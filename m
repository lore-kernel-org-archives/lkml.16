Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BBF1E0DBA;
	Mon, 28 Apr 2025 06:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745821896; cv=fail; b=G67QwenGd9eKuyKuScEr4u9KZp79liQinXCNj7l4+8bOr0tFGnIQKEjgF7zsAurEeGpPWMcgDdfEc+D0peE06i/Mf/IJkbMvANIs41gQtSi/Z/R9dAJWEdXy5/vpTgOGDeiOzsxIxGgyGVt0SYBFg6AieyQlhihwYJir0C5EbrU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745821896; c=relaxed/simple;
	bh=lNYGOO7+kY6nsro6B/C6OXwpG+dO5AlDTt4VOcI8/u4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JXi0un8hWb9Dr77zc8RKAkx1sr8CQlk25pCQvp712KtGfMhDnviQ1vcVRiAD+M9ysrDMEvX3RWct0V+wOX/F+eAulfjWT6I2tqlbvF7am9et2WbSrFDS/WSB7drHmx1IXVotWRPmf5Ttk0N7+CP22ZuVO0yvuVWYfzaEjOigLA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Dk6ihpJP; arc=fail smtp.client-ip=40.107.244.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Dk6ihpJP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fEHBle4SOnjGJjsYBDjVo9lA0yBEkOzGVZL7YiuJLgeXCFsA08PYHebp8vJ3T92sTwkKkoE5prcEWDlzF6CyQwgByKhosB3dPM+AMFceJ3A2YPT3HNoU2uxHHsBBTmt4RzT1hrWuRQlJSb/ptMvsllI4dFcOHVbxw06+dHkVJZyVuwRM71FHyBjehcnOTYmEDvmYZCyh3MwsXz3XA/NAr4lLK+OOB8cRzqGD8zcAHY9vDTUXSXfPK5M8iLhwzh5ikoqI29F4pbpMRljz8ptfPKDgMwJdvExIPLmzjITyPH9rG4+iegw7Yh8lHKWchY3aLOeGxB8/RAhjbw5VPbiOfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u8xUb9f+T+4W8mDwJZ9vdFZfJQAWUEZxfL09lBFQKSI=;
 b=xZEWixG1i1KDrbYt1/spwFIv9cIY+pghgdRe0ikKigxDr5s8hiCi7oSKijNBSYrxdb9frIpHk0f9CKXxDrJlrl1D8MeyLDsuFMZto411PiJA0SLSjurmzSDpC4qawYwrul/qcAhe0V+AlbxnpheG0sCMV9pq4dBezzq1y2o8CYaEW2K2mx+qX3IFryc/RGe7yRlJpzazZ/AUrqw467YJBI7/ZEni/DdTJCo2zE943KaznOhBmoVlsjDxtv3j8qBe5AiLi65gUzxQr7QbR/lSoounmcXRHTVDzk+mk7d0sw7oDCMicus14zjerQSAcs8zgNv7BPF5WqId/SP3YCLh6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u8xUb9f+T+4W8mDwJZ9vdFZfJQAWUEZxfL09lBFQKSI=;
 b=Dk6ihpJPStd6Tnznt17A04ly30q+n4d/YJRJcUnC99IdARWMjpDQxwolz2xDq7Ay/LbxZeKWFHp8ebcaDZAb0bn9I12OKr5NSfTvyVQVAa5nTBKrPLtYFy6fbQcEKkpRSZ7nEXshnZs1aZF62pBsRVchaLzBOJCM1b/q0GS6hW0=
Received: from MW4P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::17)
 by DS0PR12MB9059.namprd12.prod.outlook.com (2603:10b6:8:c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 06:31:31 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:303:115:cafe::99) by MW4P220CA0012.outlook.office365.com
 (2603:10b6:303:115::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Mon,
 28 Apr 2025 06:31:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 06:31:30 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 01:31:25 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<shyam-sundar.s-k@amd.com>, <gautham.shenoy@amd.com>,
	<mario.limonciello@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<anand.umarji@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v9 10/10] misc: amd-sbi: Add document for AMD SB IOCTL description
Date: Mon, 28 Apr 2025 06:30:34 +0000
Message-ID: <20250428063034.2145566-11-akshay.gupta@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250428063034.2145566-1-akshay.gupta@amd.com>
References: <20250428063034.2145566-1-akshay.gupta@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|DS0PR12MB9059:EE_
X-MS-Office365-Filtering-Correlation-Id: 57652d57-fb57-415d-e6a2-08dd861e4fce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QsqFG+zDOkh1oDbkfEB2QCKVeg203boqAlouIE5f4MubSmrICow01MwEfMFS?=
 =?us-ascii?Q?GkyEWWypsdDWtkFLQVV0t05xrYvftVa6ZvlDJFzb6HNhbemhuP59q7B5sUg7?=
 =?us-ascii?Q?pNbtLotHKIyPKPpnY7IPsCQiNid+jQ9h31Wp22rD/2305cWKorZiTfHrilBk?=
 =?us-ascii?Q?yAnioLld4UCN0JdsRHdGUvGk1cJY25A6UxVQSVp4Ezce3QVGfZWVz5gKkbPd?=
 =?us-ascii?Q?NQ/4Gq4vgMMXcH4xptJ9/ds33+t0xUDn3mhrnnc+YxgWvcxEPYyTCbhkCQ5+?=
 =?us-ascii?Q?jaoEgvtxuhtL2gEV6VedgUUr3tr/bcXxPt0zoNG2Gj3e9jhW2EGEAU0vCb4x?=
 =?us-ascii?Q?hNGMHdV2i/KtxxF0vzTKGglh18FuC1PWiHq/zIJk04XORqfZ20xCr7tzpstc?=
 =?us-ascii?Q?Dsme+k7GTDMH0lP1jxCjPF5JJjUo3bz27ubjVYJ64snoqJirB/Vuuy/dGH9B?=
 =?us-ascii?Q?sT502GzEx9qV0W3vBjHEuJY1x+JFSzI6b8zIjZ+bvaRU05zjw2IwdRtXfdfV?=
 =?us-ascii?Q?OUy5hj45ANMDgxxMV0XIbKNKfqUumkDTTXGCCe9005kEr3Sokh81PputQsd4?=
 =?us-ascii?Q?/89tFxO7jurZDj1EWlL6T4Mi8KpX2uwxKS/boOc5CdPO2ubhKZM6+eSki3FI?=
 =?us-ascii?Q?ne2n249nZqPxVdftq1jE/LYsO2bjANl5ZU+sHal1BOcT99jkkbLVxjoo367O?=
 =?us-ascii?Q?p4d/IqCrm39aVW30aJK5yNe72pT9VxWjH6cMv5sj8w6hkaWkjheUBWcRktNC?=
 =?us-ascii?Q?5I1gdIiO09s9gxGTUIPpwHr39p3g5aQutFLgcvnj3kr0aUHq63758V5WPo/l?=
 =?us-ascii?Q?raFepSQRFx3okfkAlT4FsDvxBqVPlVb/J0CBafTMijDdPTROC8y79XP+yErm?=
 =?us-ascii?Q?Lv9sdI0ZLOSainWqwGi1Oy1Sm5uUSq7B5lbaMVESoDceGWpTGDRYj96E54B+?=
 =?us-ascii?Q?VogKqgH3QOFuml0+c8uAVVVlSf4p/Jxo3rjBixiy4nyRii2EgdoASiU/C2c+?=
 =?us-ascii?Q?8kBFLwZD3/qD1uWtVl3VaUidlCXT1rM73zSplAFBvk1I9RGzrmNoRvIA3N1E?=
 =?us-ascii?Q?YJ+Occjmiju6NVobWtrVMbAt2kiZRxl8Zc57YW2TkPl1mXJuOqKYXW7Lh+9M?=
 =?us-ascii?Q?5lniouxXmdxLVDafJkVRFtaCJhGivZpjsiS+pt0cCLiaeCdErz0GLEA1jO37?=
 =?us-ascii?Q?XsEY/78na/OIk/PMUcU987Xf00N0/3azYWIcJ7LJpyFIycpnCVup0Mg0d5Cb?=
 =?us-ascii?Q?90sAfBItkALmbioE9uvMLy9vY0pRuH7MC6QZeeNccNa0AsJAG6+XkiSMSjuf?=
 =?us-ascii?Q?qvT1LscFe4+JlrDxvuZDeJqjJxTo9+pVbKTvnFI8PchdzCUMTcm47Ym5Zmy7?=
 =?us-ascii?Q?Ck78icpKrgzLng54i8n5G9bk0mBhLsB8gckx+EO6+b5uoP+LP4oZCMvuu80U?=
 =?us-ascii?Q?qWcnOBqM2Yhrn8oDlP4g8Rz39kwRdiWtF9J1GaYqGhGC2ZFrhyGlkwdTziQq?=
 =?us-ascii?Q?YaQM/ylrQIbC8llwr2t26P3J5NlsU96ZhHNb2KeW+R3ZWzxD1hflgLpciQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 06:31:30.2023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57652d57-fb57-415d-e6a2-08dd861e4fce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9059

- This document provides AMD side band IOCTL description defined
  for APML and its usage.
  Multiple AMD custom protocols defined for side band system
  management uses this IOCTL.
  User space C-APIs are made available by esmi_oob_library [1],
  which is provided by the E-SMS project [2].

Link: https://github.com/amd/esmi_oob_library [1]
Link: https://www.amd.com/en/developer/e-sms.html [2]

Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
---
Changes since v7:
- update the documentation as per changes in uapi header

Changes since v6:
- Rebased patch, previously patch 11

Changes since v4:
- Previously patch 9
- Update description as per review comment
- Address the review comments for documentation warning

Changes since v3:
- Address the review comments

Changes since v2:
- update the MACROS name as per feedback

Changes since v1:
- New patch

 Documentation/misc-devices/amd-sbi.rst | 99 ++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 Documentation/misc-devices/amd-sbi.rst

diff --git a/Documentation/misc-devices/amd-sbi.rst b/Documentation/misc-devices/amd-sbi.rst
new file mode 100644
index 000000000000..5648fc6ec572
--- /dev/null
+++ b/Documentation/misc-devices/amd-sbi.rst
@@ -0,0 +1,99 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=======================
+AMD SIDE BAND interface
+=======================
+
+Some AMD Zen based processors supports system management
+functionality via side-band interface (SBI) called
+Advanced Platform Management Link (APML). APML is an I2C/I3C
+based 2-wire processor target interface. APML is used to
+communicate with the Remote Management Interface
+(SB Remote Management Interface (SB-RMI)
+and SB Temperature Sensor Interface (SB-TSI)).
+
+More details on the interface can be found in chapter
+"5 Advanced Platform Management Link (APML)" of the family/model PPR [1]_.
+
+.. [1] https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/programmer-references/55898_B1_pub_0_50.zip
+
+
+SBRMI device
+============
+
+apml_sbrmi driver under the drivers/misc/amd-sbi creates miscdevice
+/dev/sbrmi-* to let user space programs run APML mailbox, CPUID,
+MCAMSR and register xfer commands.
+
+Register sets is common across APML protocols. IOCTL is providing synchronization
+among protocols as transactions may create race condition.
+
+$ ls -al /dev/sbrmi-3c
+crw-------    1 root     root       10,  53 Jul 10 11:13 /dev/sbrmi-3c
+
+apml_sbrmi driver registers hwmon sensors for monitoring power_cap_max,
+current power consumption and managing power_cap.
+
+Characteristics of the dev node:
+ * Differnet xfer protocols are defined:
+	* Mailbox
+	* CPUID
+	* MCA_MSR
+	* Register xfer
+
+Access restrictions:
+ * Only root user is allowed to open the file.
+ * APML Mailbox messages and Register xfer access are read-write,
+ * CPUID and MCA_MSR access is read-only.
+
+Driver IOCTLs
+=============
+
+.. c:macro:: SBRMI_IOCTL_MBOX_CMD
+.. kernel-doc:: include/uapi/misc/amd-apml.h
+   :doc: SBRMI_IOCTL_MBOX_CMD
+.. c:macro:: SBRMI_IOCTL_CPUID_CMD
+.. kernel-doc:: include/uapi/misc/amd-apml.h
+   :doc: SBRMI_IOCTL_CPUID_CMD
+.. c:macro:: SBRMI_IOCTL_MCAMSR_CMD
+.. kernel-doc:: include/uapi/misc/amd-apml.h
+   :doc: SBRMI_IOCTL_MCAMSR_CMD
+.. c:macro:: SBRMI_IOCTL_REG_XFER_CMD
+.. kernel-doc:: include/uapi/misc/amd-apml.h
+   :doc: SBRMI_IOCTL_REG_XFER_CMD
+
+User-space usage
+================
+
+To access side band interface from a C program.
+First, user need to include the headers::
+
+  #include <uapi/misc/amd-apml.h>
+
+Which defines the supported IOCTL and data structure to be passed
+from the user space.
+
+Next thing, open the device file, as follows::
+
+  int file;
+
+  file = open("/dev/sbrmi-*", O_RDWR);
+  if (file < 0) {
+    /* ERROR HANDLING */
+    exit(1);
+  }
+
+The following IOCTLs are defined:
+
+``#define SB_BASE_IOCTL_NR      	0xF9``
+``#define SBRMI_IOCTL_MBOX_CMD		_IOWR(SB_BASE_IOCTL_NR, 0, struct apml_mbox_msg)``
+``#define SBRMI_IOCTL_CPUID_CMD		_IOWR(SB_BASE_IOCTL_NR, 1, struct apml_cpuid_msg)``
+``#define SBRMI_IOCTL_MCAMSR_CMD	_IOWR(SB_BASE_IOCTL_NR, 2, struct apml_mcamsr_msg)``
+``#define SBRMI_IOCTL_REG_XFER_CMD	_IOWR(SB_BASE_IOCTL_NR, 3, struct apml_reg_xfer_msg)``
+
+
+User space C-APIs are made available by esmi_oob_library, hosted at
+[2]_ which is provided by the E-SMS project [3]_.
+
+.. [2] https://github.com/amd/esmi_oob_library
+.. [3] https://www.amd.com/en/developer/e-sms.html
-- 
2.25.1

