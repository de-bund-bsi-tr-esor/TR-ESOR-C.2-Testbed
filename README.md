# BSI TR-ESOR-C.2-Testbed

## Important

**Notice** the used test material is dealing with cryptographic functions such electronig signatures timstamps etc. Therefore this is important, that the checked out/cloned sources must not be altered in any way. This refer also to the *CR* and *CRLF* issue. Before clone the repository, please make sure the original allignment of the end lines, especially of xml- and txt-based files will not be changed. You can do that e.g. by switching off this transformation global in your git environment: *git config --global core.autocrlf false*.

## Introduction

TR-ESOR tesbed according to [TR-ESOR-C.2] supporting the mandatory functions:
+ *RetrieveInfo* - see [TR-ESOR-E, chapter 3.8](https://www.bsi.bund.de/SharedDocs/Downloads/DE/BSI/Publikationen/TechnischeRichtlinien/TR03125/BSI_TR_03125_Anlage_E_V1_3.pdf)
+ *ArchiveSubmission* - [TR-ESOR-E, chapter 3.1](https://www.bsi.bund.de/SharedDocs/Downloads/DE/BSI/Publikationen/TechnischeRichtlinien/TR03125/BSI_TR_03125_Anlage_E_V1_3.pdf)
+ *ArchiveUpdate* - [TR-ESOR-E, chapter 3.2](https://www.bsi.bund.de/SharedDocs/Downloads/DE/BSI/Publikationen/TechnischeRichtlinien/TR03125/BSI_TR_03125_Anlage_E_V1_3.pdf)
+ *ArchiveRetrieval* - [TR-ESOR-E, chapter 3.3](https://www.bsi.bund.de/SharedDocs/Downloads/DE/BSI/Publikationen/TechnischeRichtlinien/TR03125/BSI_TR_03125_Anlage_E_V1_3.pdf)
+ *ArchiveEvidence* - [TR-ESOR-E, chapter 3.4](https://www.bsi.bund.de/SharedDocs/Downloads/DE/BSI/Publikationen/TechnischeRichtlinien/TR03125/BSI_TR_03125_Anlage_E_V1_3.pdf)
+ *ArchiveDeletion* - [TR-ESOR-E, chapter 3.5](https://www.bsi.bund.de/SharedDocs/Downloads/DE/BSI/Publikationen/TechnischeRichtlinien/TR03125/BSI_TR_03125_Anlage_E_V1_3.pdf)
+ *Verify* - [TR-ESOR-E, chapter 3.7](https://www.bsi.bund.de/SharedDocs/Downloads/DE/BSI/Publikationen/TechnischeRichtlinien/TR03125/BSI_TR_03125_Anlage_E_V1_3.pdf)

and the following Archive Information Packages (AIP):
+ XAIP as XML-based AIP, [TR-ESOR-F, chapter 3.1](https://www.bsi.bund.de/SharedDocs/Downloads/DE/BSI/Publikationen/TechnischeRichtlinien/TR03125/BSI_TR_03125_Anlage_F_V1_3.pdf) and 
+ LXAIP as logical XAIP, [TR-ESOR-F, chapter 3.2](https://www.bsi.bund.de/SharedDocs/Downloads/DE/BSI/Publikationen/TechnischeRichtlinien/TR03125/BSI_TR_03125_Anlage_F_V1_3.pdf).

## Directory structure

+ *ERVT-UPLOADs* - contains the test data files to be copied into the [ERVerifyTool](https://github.com/de-bund-bsi-tr-esor/ERVerifyTool) (short ERVT) LXAIP data directory. (Apply only in case the LXAIP should be supported.)
+ *LXAIP-UPLOADs* - contains all the test data files to be uploaded in advance into TOE in order to be used while testing the LXAIP funtionality. The obtained references have to be inserted into the property list (see below). (Apply only if LXAIP should be supported.)
+ *PROPERTIES* - contains an EXCEL-file with all the properties needed by SoapUI-Project (props-file).
+ *TESTDATA* - contains the test data files used while executing the tests.
+ *XSVT-UPLOADs* - contains the test data files to be copied into the [tr-esor-AIP-eIDAS-SigValidator](https://github.com/de-bund-bsi-tr-esor/tr-esor-AIP-eIDAS-SigValidator)  (short XSVT) LXAIP data directory. (Apply only in case the LXAIP should be supported.)
+ *TR-ESOR-1.3.0-S4-Testbed-soapui-project.xml* - the main project file to be loaded into [SoapUI-Tool](https://www.soapui.org/downloads/soapui/)
+ *BSI TR-03125_C.2_V1.3.pdf* - the current version of [TR-ESOR-C.2]

## Approach
### Preparations

Following tasks have to be executed as a preparation for the tests execution. 

**Notice 1**, support of XAIP is mandatory, LXAIP is optional. The parts of preperation dealing with LXAIP will be marked by *[LXAIP]* at the begining of the line.

**Notice 2**, please refer to the "Introduction" tab in the props-file in order to get more information how to dela with property values properly.

**Notice 3**, the current version of the testbed is still working with mock implementation of the both verification tools: XSVT and ERVT. The execution of the steps 14, 15, 16 and 17 is not necessary and can be omitted.

1. Do create a test tenant in the TOT with client-id "Bsi" (cf. *\<xaip:submissionInfoType\>* in [TR-ESOR-F, page 17](https://www.bsi.bund.de/SharedDocs/Downloads/DE/BSI/Publikationen/TechnischeRichtlinien/TR03125/BSI_TR_03125_Anlage_F_V1_3.pdf)).
2. Do insert the TOT endpoint address of the S.4 interface into the corresponding property **TOE_S4_ENDPOINT** in the props-file. </br>**Please notice** the C.2-Testbed does support the http communication as default one. Anything more has to be configured according to the SoapUI documentation.
3. Do check and adjust the value of the **ERVT_ENDPOINT** property in the props-file, as needed.
4. Do check and adjust the value of the **XSVT_ENDPOINT** property in the props-file, as needed.
5. Do configure the behaviour of TOT in case of signature verification errors by enabling one (the other one has to be disabled - set to **NO**) of the following properties:
	- set value of **OPT_VERIFY_VR_STANDALONE** property to **YES**, if only verification report used to be returned,
	- set value of **OPT_VERIFY_VR_EMB_IN_CONTAINER** property to **YES**, if the verification report embedded into a given XAIP or LXAIP used to be returned.
6. Do configure the behaviour of the TOT in case an invalid XML structure is used at S.4 by enabling one of the following properties (the other one has to be set to **NO**):
	- set value of **OPT_INVALID_XML_AS_SOAP_FAULT** to **YES** in case a soap fault used to be returend,
	- set value of **OPT_INVALID_XML_AS_S4_ERROR** to **YES** in case an application level status code used to be returend.
7. Do check and adjust as needed the value of **SUBMISSION_TIME_RANGE_IN_DAYS** proeprty (in days), which does describe the maximal deviation of the given *\<xaip:submissionTime\>* and the current time.
8. Do configure the supported hash algorithms by checking and adjusting (as needed) the properties **\{SHA1,SHA224, SHA256, SHA384, SHA512, SHA3-224, SHA3-256, SHA3-384, SHA3-512\}_SUPPORTED** (enabled = **YES**, disabled - **NO**)
9. Do configure the acceptable hash algorithms for hash tree verification in the evidence records by checking and adjusting (as needed) the properties **\{SHA1,SHA224, SHA256, SHA384, SHA512, SHA3-224, SHA3-256, SHA3-384, SHA3-512\}_TREE_ACCEPTABLE** (enabled = **YES**, disabled = **NO**)
10. Do configure an inactive profile in the TOE and set the value of the **URI_PROFILE_V1.3_S.4_V1.0-inactive** as the corresponding profile id.
11. Do define the support of LXAIP by proper setting the value of property **CONFIG_LXAIP** (possible values are **ENABLED** or **DISABLED**)
12. Do define the not existed AOIDs for the XAIP test cases by setting a value of **AOID-03** and **AOID-06** properties.
13. Do submit an XAIP in order to have the belonging retention period expired at the time of test execution and document the corresponding AOID in the property **AOID-00**, as well as used version id in the property **AOID-00.V01**.
14. ~~*[LXAIP]*: Do check and adjust (as needed) the location for the referenced data objects for XSVT, property **XSV_LXAIP_DIR_URI**.~~
15. ~~*[LXAIP]*: Do check and adjust (as needed) the location for the referenced data objects for ERVT, property **ERVT_LXAIP_DIR_URI**.~~
16. ~~*[LXAIP]*: Do copy all the files from directory XSVT-UPLOADs into kocation specified in step 14.~~
17. ~~*[LXAIP]*: Do copy all the files from directory ERVT-UPLOADs into the location specified in step 15.~~
18. *[LXAIP]*: Do submit an LXAIP in order to have the belonging retention period expired at the time of test execution and document the corresponding AOID in the property **AOID-00a**, as well as used version id in the property **AOID-00a.V01**.
19. *[LXAIP]*: Do upload all the files from LXAIP-UPLOADs directory into TOE by using the Upload/Download-Interface and document the given references in the corresponding property in the props-file. 
	+ example: uploading of **PDF_DATA_50.pdf** file did produce **uuid:1122-2343-5634-4545" as reference, than set the test value of **REF_PDF_DATA_50** property to **uuid:1122-2343-5634-4545**.
20. Do generate the property file used by the testbed SoapUI project by pressing the **Generate SoapUI props** button placed in the "Introduction" tab of the props-file.
	+ Do provide the path an name of the SoapUI project property file and confirm the export

### Execution

1. Do start SoapUI application </br> **Notice**, the provided project has been created with the open source version of the SoapUI tool and hasn't been tested with the commercial version "ReadyAPI" of the software.
2. Do load the SoapUI project
	a. Do chose "File->Import Project" or use the shortcut "STRG+I"
	b. Do chose the file **TR-ESOR-1.3.0-S4-Testbed-soapui-project.xml** from the root directory of this project and press the "Open" button. The Project with name **TR-S4-1.3.0-Beta** will appear in the "Navigator" panel of SoapUI. The project consits of 8 test suites with 62 test cases, 656 test steps and 2118 assertons in total.
3. Do load the generated SoapUI project property file
	a. Do double click on the **TR-S4-1.3.0-Beta** project in the "Navigator" panel.
	b. Do make sure, the "Overview" tab at the top and the "Properties" tab at the bottom of the project configuration dialog are activated.
	c. Do click the forelast icon in the icon bar of the "Properties" tab -> the "Load Properties"-Dialog will appear
	d. Do browse to the generated SoapUI project property file, as result of step 20 in the Preparations and do activate both checkboxes **Creates Missing Properties** as well as **Deletes properties not in file**. Do press "OK" button
4. Do start the moch S4-Service
	a. Do right cklick on the "S4-V1.3.0-mock" item in the "TR-S4-1.3.0-Beta" project in the "Navigator" panel and do chose "Start Minimized" menuitem.
5. Do execute the test suites
	+ **Notice**, depending of your test strategy you can try to perform all the tests at once, doing it suite by suite, execute them test case by test case or even execute the single steps in the particular test cases manually. **It ist important to keep the execution, which is top-down, begining by 3.4.1 and ending by 3.4.8**, to preserve the interdependencies of the partiular tests cases.

### Results
* The testbed does implement only the mandatory tests at the moment. In order to get the [TR-ESOR-C.2] passed, all the tests have to be successfully performed.
