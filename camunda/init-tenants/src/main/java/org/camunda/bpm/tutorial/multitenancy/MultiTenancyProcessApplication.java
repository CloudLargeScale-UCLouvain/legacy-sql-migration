/* Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.camunda.bpm.tutorial.multitenancy;

import org.camunda.bpm.application.PostDeploy;
import org.camunda.bpm.application.ProcessApplication;
import org.camunda.bpm.application.impl.ServletProcessApplication;
import org.camunda.bpm.engine.IdentityService;
import org.camunda.bpm.engine.ProcessEngine;
import org.camunda.bpm.engine.RuntimeService;
import org.camunda.bpm.engine.identity.Tenant;
import org.camunda.bpm.engine.identity.User;
import org.camunda.bpm.engine.repository.Deployment;
import org.camunda.bpm.model.bpmn.Bpmn;
import org.camunda.bpm.model.bpmn.BpmnModelInstance;

@ProcessApplication(name="Multi-Tenancy App")
public class MultiTenancyProcessApplication extends ServletProcessApplication {

  @PostDeploy
  public void initTenantsAndUsers(ProcessEngine processEngine) {
    IdentityService identityService = processEngine.getIdentityService(); 
    BpmnModelInstance modelInstance = Bpmn.readModelFromStream(getClass().getClassLoader().getResourceAsStream("processes/tenant1/tenant1_process.bpmn"));

    String[] arrayTenants = new String[]{};
    if (System.getProperty("tenants") != null) 
      //tenantQuantity = Integer.parseInt(System.getProperty("nb.tenants"));
      arrayTenants = System.getProperty("tenants").split(",");
    System.out.println("Tenants : " + arrayTenants.toString());
    int userQuantity = 0;
    if (System.getProperty("nb.users") != null) 
      userQuantity = Integer.parseInt(System.getProperty("nb.users"));
    System.out.println(String.format("User quantity : %d", userQuantity));

    for (String str:arrayTenants) {
      //int i = Integer.parseInt(str);
      String tenantName = str;
      System.out.println("Create tenant " + tenantName);
      Tenant tenant = identityService.newTenant(tenantName);
      tenant.setName(tenantName);
      identityService.saveTenant(tenant);

      // initalize BPM deployment
      System.out.println("Create deployment for tenant " + tenantName);
      Deployment deployment = processEngine.getRepositoryService()
      .createDeployment().tenantId(tenantName)
      .name(tenantName + "_deployment")
      .enableDuplicateFiltering(true)
      .addModelInstance(tenantName + "_deployment.bpmn", modelInstance)
      .deploy();  

     
      processEngine.getManagementService().registerProcessApplication(deployment.getId(), this.reference);
      // if no user
      if (userQuantity == 0)
        continue;

      for (int j=1; j <= userQuantity; j++) {
        System.out.println("Create user " + String.format(tenantName + "_u%d", j));
        User user = identityService.newUser(String.format(tenantName + "_u%d", j));
        user.setPassword("tenant");
        identityService.saveUser(user);

        identityService.createTenantUserMembership(tenantName, tenantName + String.format("_u%d", j));
        // set admin group for each user (we do not care about security here)
        identityService.createMembership(tenantName + String.format("_u%d", j), "camunda-admin");
      }
    }
  }

}
