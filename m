Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51841F4168;
	Fri, 11 Apr 2025 13:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744378345; cv=fail; b=JqLBYpmuMYowODJYk8WY2zngGaFUrkKjTJX+jrqSXNv//KEBTjVOrRgii9hyu3ALKPLWx+wkdlJHO2sqtzQdYCTgOF3ZYgc48kqH1xWdKPa+l4DCGcn62pdoDcLZEjwWQ5U6/zcRIX7tq+ymLFVofZtXZ49I3tT5i79fIquWrjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744378345; c=relaxed/simple;
	bh=lNYGOO7+kY6nsro6B/C6OXwpG+dO5AlDTt4VOcI8/u4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mc0UP/fxOa/cZzvfZxZqkiDenD0aJOptxvKOLb5vqvzs0a2qnkbPtvaKw/OT45j+iC4yvyTIPa67aXn0MnbBf/Qttincb7mjoXdKXqzHdCEval5jd+vdXDDjX/HsKrYV5kaIQUHncvc5gXJ0bU2h1z/uDc7bMh9whHja4FE7ZPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uHNQtiBR; arc=fail smtp.client-ip=40.107.243.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uHNQtiBR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aiAz28pebaYbuK7cI2tmiYSemE24yEdGaZStCQ7AID9Ae6+wM7WTZqDBspu0j7z7FJ11IibjmRt5ONklqXjIWNLSINZswqmgNYGEGirJiK24H0i+KsHPoTtF7NtUQ7KKwukGgZ+PpIli78gNbqiPRcPTbiU8Zk6xpxCmk7JVgtpFP+eGWRLZW0Mh5a4iUn4z1MbvzEAtY9JJ91NT7jdbuFuYRpxIn24CCqPkzl46fhK5YGflrJ2oMcg/nDgUaa7UbdX2QKEkbwF75pryqixTkn3dSXqqd18Aiy4i+q4u7dgLJaeyShRu4C9kuE52i0gqXqT2LLFQr2umf8dC44DpHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u8xUb9f+T+4W8mDwJZ9vdFZfJQAWUEZxfL09lBFQKSI=;
 b=pHuaPI4YnO+vdlzlSy9TqjAVDN2M8oPVjIW+Ww/uSMRts1WmixlorX4568KaFUpkNZELz7WvllQsu44kszNRY4PT8iKZmzZV01kwzy6/gJxjrryRiwQnPwgJ/adDDuIXkWv6edkIBWiv0+iuqiBBhgepvHiGhl48Vhix4VqyU6m8+KkY17TUG0sbgOq2hFxFxGkug6k4appK16zfSt0GeJMUpjrq+1UDr5/lk51EuLdlEkxT4lPT1jyLt40aKM0iQsecZN6PEea8KzjOPhKItFHbZ4fSbBAz8y9AmwUtCwcUMCc+0cEq1qiqZAAeUHKGIGF9FfjZOemViE7nV0pR1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u8xUb9f+T+4W8mDwJZ9vdFZfJQAWUEZxfL09lBFQKSI=;
 b=uHNQtiBRCNIPYIpekIPDLp5GUSJWMuQKUfh1H2J/6OtZJ3BGLDzQVk8atkAbHdgpYmZRyME+uHf8FptbYH/iMRaPQmHibdsWaU9fwddY3FeujEfjI8/m7dO2WMRWxvybMU+4OZnB38qasr+n9A+6VuXbGrmd+g4VjJeaetAvI6E=
Received: from MW4PR04CA0291.namprd04.prod.outlook.com (2603:10b6:303:89::26)
 by DM4PR12MB6541.namprd12.prod.outlook.com (2603:10b6:8:88::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.28; Fri, 11 Apr
 2025 13:32:20 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:303:89:cafe::61) by MW4PR04CA0291.outlook.office365.com
 (2603:10b6:303:89::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Fri,
 11 Apr 2025 13:32:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 11 Apr 2025 13:32:19 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Apr
 2025 08:32:16 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<shyam-sundar.s-k@amd.com>, <gautham.shenoy@amd.com>,
	<mario.limonciello@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<anand.umarji@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v8 10/10] misc: amd-sbi: Add document for AMD SB IOCTL description
Date: Fri, 11 Apr 2025 13:31:22 +0000
Message-ID: <20250411133122.1806991-11-akshay.gupta@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250411133122.1806991-1-akshay.gupta@amd.com>
References: <20250411133122.1806991-1-akshay.gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|DM4PR12MB6541:EE_
X-MS-Office365-Filtering-Correlation-Id: c226b659-6ef2-483f-01b7-08dd78fd48c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9Pt8/54sMeA31ux+fkRG0Ll8BP/+qcIDrFvZS1oMi2GFGdOTFDN4LTGQIg6I?=
 =?us-ascii?Q?vaq6KEpH1uUH6akIXJiZE/+coKrWamDo/8NQaPBjmX6Goq1IUp1KKqPBETOD?=
 =?us-ascii?Q?nZGzv0rjb4WNZgI8uxnPT1s1YAdhG3l5/eKkBr5l2WXtkpzQdlAxiM80mlR5?=
 =?us-ascii?Q?BQUvCVEM9WOGbd7YcalM5hD+jTquem9uS+liLjbtJUYZS/IlL8+MERwpgw7y?=
 =?us-ascii?Q?Cfec9hs1QbdKXqfROnmDFxt8Bjil6gXX0vRGJANMnVlh64iocWicvZExAXC0?=
 =?us-ascii?Q?asGNp+Csg82ZapBcJepb2m4jgnOTtgiXbhs8FfShDMrMqOflHViE/VcmC/8b?=
 =?us-ascii?Q?UKejBT9dtLV7UwKtixSMmCxWCZTb7yrBNgkudDvkPGj+pCo4jhpawsc/Izov?=
 =?us-ascii?Q?H2JKSa/fJWx0W8AcxwI8nrAI4vDK9jx88NIJLb9E6UAoTms+3mOthQg3B0P9?=
 =?us-ascii?Q?xQ7qJvSK+OJ4K6+kpKcx8+s/hXWzqY9mMdmjxGFMO2Ji7PVcXVlyvHGZB0lr?=
 =?us-ascii?Q?2VeqCR6lBnDTR/g10pEoT8W3MAck2cpm+FvSAiLLTxHkr+bXy96W5aXYGahC?=
 =?us-ascii?Q?fDygeUKa8JUbA22OjNKXeIp+6QnrPOUMcRsdBHvzo8TDedbigojVg3XzRVg0?=
 =?us-ascii?Q?g1MCP6N0GY1HXwF4ha43wkjlReaYV21M42kctMVWaxfDgZ5/Yg4Lju/qRWMd?=
 =?us-ascii?Q?coRsr8aYAekl0BUdlafZfLUWvifhLnwqY9GijEdkb2iykSVZtXxS1VNtXp/W?=
 =?us-ascii?Q?S21b/krGY7lXFbnVHsLLC2Eun81hZwsqTE4gHeHuPIyoXmbMYrCZf+ufaAVd?=
 =?us-ascii?Q?dPIyOkJhgFtmtY3Bc+cI49tNTVN1qyjWxtzFIkkgyDNYMresk6WFS0IT/kjV?=
 =?us-ascii?Q?Z5ADWg9BLJGT6PY58C6yjvUkZePpMuXI9PqYlz1qqlSWJr2OKmSNDFE+6XnA?=
 =?us-ascii?Q?3GgM2Z07YvAfeVAXiyTyqv1C5reGVDjXDv9Z+mkFJIrNn9SY13EDb7R7GiY6?=
 =?us-ascii?Q?f12PGrVDR/4aD1eLTODFjrh+9HcYPQ53HfsgMTbhL0u0OgXiVJr1ooc3FELE?=
 =?us-ascii?Q?h2SlczaQ2ixgBlpVzkbjU/3UmKYXcrrT42HcuPnPSCirGBXBwDp51bEZp1jR?=
 =?us-ascii?Q?BPO+7HwKg5HGAAHg4LDM/BDDLD+meDwurcqhY4Ny8tLUFHo/588WrTz4KwAQ?=
 =?us-ascii?Q?VYTLa70E80DjDStHxbstigYkIGsrW9qYrq2RIa7qxMKKtVEGDxGptUCm9Lm8?=
 =?us-ascii?Q?Y2PxAgB2U2u1pBkf8QqNZburfnt9vzKDsW6pqmCNsp+WcuuLpxXQCpRxidTZ?=
 =?us-ascii?Q?KmaMkQEcue1Rj92B8KjX+2li+HuDHtNOAQN6XOfCpfXCaqMegOLp6Xcu2FwG?=
 =?us-ascii?Q?CDshXmwIYVzMNzDMy1tqX4T08zBJq9Oa5heKn+h1QshDeiVWUH3cMcHweBot?=
 =?us-ascii?Q?jZ6gDLgryvWDXobMP0Vvn8QssWExZixRCflIFnsO3ya/x35mN32bLn5d4GPN?=
 =?us-ascii?Q?WcmtW8QQRROMBdZNTrNWMyeVaB+8IAglb3DDmchPlnB4EGNKwCM8rB5oew?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 13:32:19.7583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c226b659-6ef2-483f-01b7-08dd78fd48c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6541

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

