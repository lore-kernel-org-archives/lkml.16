Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2080.outbound.protection.outlook.com [40.107.102.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B739232373;
	Wed,  2 Apr 2025 05:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743573589; cv=fail; b=qzLgTlFRj9KJyLsHmq16ClaVPE66Yb3APpc/5EbOCCBqauCyjx4+tuyzGZJ39OAlZHqfBahtyIcbeOy2nQgiR/ZsrV9FUxo7Qph0RhDseBSCTbZixIwIRhlQ9sk5II2ADXH84jl7ly/NixcSA55ZrEunvGDaZYpK2xZPs4LG4+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743573589; c=relaxed/simple;
	bh=dPMPc0Usg40kN+udOdYGeDCJvdkak7BM53gcoefoweE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UGrjhr9ArnSWiVaurLFrvuHV1FhZj1nuLi596Bzt86uUvgcsZr0AtIRRrukRCTPgPA5dunrSKZlCaBE9onU2NvPRBiWBcvu0vF5bctXgJBclVg38f/jfywUm5zrWax/kicHWKcImNXX99bs42m1kgA4fXuzKMGZ7ih3om5xwZiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ME+vniLm; arc=fail smtp.client-ip=40.107.102.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ME+vniLm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s2bs1FxQ45QuaN4v7jRuKCo/2W46focq/ig9dBjGL+C/oQk+pcnFq+JeKL9VISnLT4WnKkh4pYNBL2oG8uSj8VRJ98MmHG9ZiQRAaI+gU4nRQ6qv1kwh+EYFFIUMFkbhGXOQBHM+UNmdgCb8QukK9Sa1MLxrA8mEoi9QWOJKErC9u6bRCZuGWE2pDzmJTq9vAvjI+X/aE1vvFk+3XrcQAFNrCyE4Tee5MZosLwwvtN23/WiXki7dptsN/0MvdMaOXI4npDH6iGyJsF2BZCXQ2Hbl9nvDXIbI+sfoVs/jV4RjOKbfLZenKPs2ZSbjyFW28ghndg9Q+OxN46IbPF6V6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHujq7DyttN1eYQVIB8OlncK8O5lfjEwmmARUiuITlg=;
 b=EjNobOCpCQwY3MkKnHstD6rbtH18EQkaGowyp8BEM3Pm9WZXUK9w0fv8AZGiEFK4KfZ1MMyJnYFoK5GXT6zjoi5LIhN9XMyRKWHWUIgtWMm6moZ8N7JMGwRsUf3+qWoVaVUZY64kyPLgDWngd2wITlUX7gkrOCFnH5MnGdgO+9mXc5Aqomb6drNIPEmR9KQTPRT8aj7siQbcjSmFiHF2qyQ06y344lsva0QnnsP4tiK8/Hj+eh7YyUxuNaM8ai5vWqg/nh5uYd1dVJ0S+SMQPc1ctrA4zNXA4dfPqRDzb40GhuWP1UaKM2pFFXYjjRxxoRJ0CC1RUHsgP7MKJs8Edg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHujq7DyttN1eYQVIB8OlncK8O5lfjEwmmARUiuITlg=;
 b=ME+vniLmelkOuh4fawhwr6pjf/53K3Sh4sPyVEzcn4GgPV6cmaYY5bKYDJNMJT5hsGDtrFo32BZ11MD/Lmk/BeRyJglepc4HsoFWlMKxloo9osLKjXWBTIIdARBth3jzsdMfiUjv87pYXqes2CuB7kqPbirUDFEe10GSzniqzg8=
Received: from MW4PR03CA0359.namprd03.prod.outlook.com (2603:10b6:303:dc::34)
 by PH0PR12MB7095.namprd12.prod.outlook.com (2603:10b6:510:21d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Wed, 2 Apr
 2025 05:59:42 +0000
Received: from MWH0EPF000971E8.namprd02.prod.outlook.com
 (2603:10b6:303:dc:cafe::a4) by MW4PR03CA0359.outlook.office365.com
 (2603:10b6:303:dc::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.41 via Frontend Transport; Wed,
 2 Apr 2025 05:59:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E8.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 2 Apr 2025 05:59:42 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Apr
 2025 00:59:38 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<shyam-sundar.s-k@amd.com>, <gautham.shenoy@amd.com>,
	<mario.limonciello@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<anand.umarji@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v7 10/10] misc: amd-sbi: Add document for AMD SB IOCTL description
Date: Wed, 2 Apr 2025 05:58:40 +0000
Message-ID: <20250402055840.1346384-11-akshay.gupta@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250402055840.1346384-1-akshay.gupta@amd.com>
References: <20250402055840.1346384-1-akshay.gupta@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E8:EE_|PH0PR12MB7095:EE_
X-MS-Office365-Filtering-Correlation-Id: 03e6c206-cdd0-410e-d484-08dd71ab8ff3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kJbwwL8vAulzjpfgOTeIQhXzGaIK0HdaoE2wetZ81WRqhDoO36s5oLDpsLH7?=
 =?us-ascii?Q?EUGnNqmtdb1XujqkKk205gQ1PPZwfG5/2zMIHpBpDs0GSylF/iToa0r/o+vP?=
 =?us-ascii?Q?m1C2/PvRXKYs5vvHFDiThuKOPRiyriJh285Vjw8S93hUnt05/8gp4WgE4MsV?=
 =?us-ascii?Q?Q8jI09CMy7X8R88iKvklXzEHUzTWaPr2OTg1jbQGDy614qpmAjw2ivYccq9z?=
 =?us-ascii?Q?ZGneqjLgmc7oWcpxBpwAja8mdEL4nJhZ4iblfvVS33OCmoBK2yzT8hECy6P6?=
 =?us-ascii?Q?I2zJtjzfMU+A4XpQJtwYLgzV7ajPKhUvomrHQcLBTFAnxsj+MGPxNGtSFMy2?=
 =?us-ascii?Q?MgeeWtOUyS5ySeiVKN7U4B+q94vVkXfZESO29prqXRRko6KFHV/6aPRiSyGJ?=
 =?us-ascii?Q?Ul8Mu+A9futLFBA80i8TG+vF1uGOe7WDFB5Q1Xv6U8HcXypMFnP05wh+ySk1?=
 =?us-ascii?Q?+a1JUrsTr/nWl+gjO3tKDiQdGmdiNiAPhiQhewWNL64EN7l/xjb1SXX8McW1?=
 =?us-ascii?Q?fSloZy2ACWFdfVpQ3ObFVyHep4R7oxd+5tohy6rVDrmSzSy2um+HIC5ZOLne?=
 =?us-ascii?Q?URBK/AvScgmd4xh+Ak7v6OpIa7YXNwxnXX/AlZ6INWoYlZ8vD2L4eMft9N5X?=
 =?us-ascii?Q?inE9uYkQloXZglVjndLohOKSCylF/OCghUPga5pPesYexI+hR3JasNANMrPO?=
 =?us-ascii?Q?tabUmhP8715HvLSyJQTMSkD+omodZ69VyzV4MnWFqy7TxhnYP7HH5reGYHEM?=
 =?us-ascii?Q?jwvev0GBMzQJ3fyRRyliDpxUvY+3+VhvSrnheWDY6AnuPFhw1dK7ll3XBXLU?=
 =?us-ascii?Q?/gQWTES3wougzNGh33dWWlnvRZa934XZF9oeqfh2qqDRO99MTqdhtOMypLy3?=
 =?us-ascii?Q?vXSTKe0pHcUnztzZ/0dQkxKr0d0qAvc3sPyhaB3vza9011rAZzqNdE7/MzpG?=
 =?us-ascii?Q?BRPTwfRwED2nGfORgk0GoPIHTnUu9McuSH0Arrnyz2+uHz1CuEtrArDSZddg?=
 =?us-ascii?Q?qJGLGb0z7+Y7XSss8Qg3aC9G4jpUTJNC/aoKfKSlbtxrAAwLW3GUbKwOu+rA?=
 =?us-ascii?Q?Rfo5aPAWVeceSAuzv2FVk/cu5H/OLLrKEtToghp2xeDybqeUihYFXytJLt7o?=
 =?us-ascii?Q?1Tq5VK7xyre3skSjsWgloQz9IeraACuXGWUq2aN2BXkPmPmziJJLTNtMAmOj?=
 =?us-ascii?Q?OlbXtUA+Qq+pZk00SYeWev2V7hQAx1vm3ZuuNzIqZs79/lUllRRN9IzjA4tp?=
 =?us-ascii?Q?wmTPeV/nckdQXHx3vbqkT4njKD68HoiF+g2atY3gQ9qaavdox8L2Tcw/W1bW?=
 =?us-ascii?Q?z/UPInOOC1VGps++ACBnEKqbeaOcJPFb1JRmQtHX3wGi7mNaNxeDjxXkA4hI?=
 =?us-ascii?Q?gkxx38TbuDvT5tcV0ZpPV7lw3+vRQbgE4IuROSMOk011XhcGZ9lFPhMDTrmf?=
 =?us-ascii?Q?Ihes8YHmWoeaqLZ9yx5eWJ4bAyQaJBDsY6N+mdbx00oKXZZ7UKeTEc/rmoQK?=
 =?us-ascii?Q?MmXtTakoKlH+lSGvSSCmCnARaqQ4jG7sV9OyEyPD3ARpJMwyvU2frzsc2w?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 05:59:42.3540
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03e6c206-cdd0-410e-d484-08dd71ab8ff3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7095

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

 Documentation/misc-devices/amd-sbi.rst | 87 ++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/misc-devices/amd-sbi.rst

diff --git a/Documentation/misc-devices/amd-sbi.rst b/Documentation/misc-devices/amd-sbi.rst
new file mode 100644
index 000000000000..9fbb01b33032
--- /dev/null
+++ b/Documentation/misc-devices/amd-sbi.rst
@@ -0,0 +1,87 @@
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
+ * message ids are defined to run differnet xfer protocols:
+	* Mailbox:		0x0 ... 0x999
+	* CPUID:		0x1000
+	* MCA_MSR:		0x1001
+	* Register xfer:	0x1002
+
+Access restrictions:
+ * Only root user is allowed to open the file.
+ * APML Mailbox messages and Register xfer access are read-write,
+ * CPUID and MCA_MSR access is read-only.
+
+Driver IOCTLs
+=============
+
+.. c:macro:: SBRMI_IOCTL_CMD
+.. kernel-doc:: include/uapi/misc/amd-apml.h
+   :doc: SBRMI_IOCTL_CMD
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
+The following IOCTL is defined:
+
+``#define SB_BASE_IOCTL_NR      0xF9``
+``#define SBRMI_IOCTL_CMD          _IOWR(SB_BASE_IOCTL_NR, 0, struct apml_message)``
+
+
+User space C-APIs are made available by esmi_oob_library, hosted at
+[2]_ which is provided by the E-SMS project [3]_.
+
+.. [2] https://github.com/amd/esmi_oob_library
+.. [3] https://www.amd.com/en/developer/e-sms.html
-- 
2.25.1

