Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4511F0E44;
	Fri, 11 Apr 2025 13:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744378330; cv=fail; b=MR2Z4WWSRDK7C+7nexm6u1V6xRxBmEvxeampMg+46xPOuF1aM7jZzckX+dKCeT/ESo4Xy1yLvQOGBwq6uQhxyUKbV+2BM8Gi//9RdtzdGrIOY0o719nyrkPyy/k5d/VcseNRwdaEWE4FaJEjgTkvq/632himoNVjf2FA50fnuO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744378330; c=relaxed/simple;
	bh=IuNCf6bnUwvnw8IDe0LAQf4yk2UGWE8bQlSXKOjiTug=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OScVdgX7w+xWdNTYKGZHLpdQZUoOP7rewKCEat9erILNKoTr2VTITmBJ9iu2qe+pzwE6kQVVMN8OiKQdgjQGedGEUj/n0AyofptivHDDEvn9r2Se2dN43oOuRh79KZMkkUARe+UsH/uZwJSSHCrFCmtLG4xR1ybLt/YCZt/Fnvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dkb56rb9; arc=fail smtp.client-ip=40.107.244.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dkb56rb9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=um/IfCqHsfPfCFXQRoUplbbOHd1SwINHq/9QEIJBHkMH89p+y6DHtAPnSssgxiQPLqaC9iLKi0jFsZxFizt6JwhoXGugcADKV1WQc2RFD9lAMOn2XZ0FXQ5dYjkTRGDNZpfd+p5npWTlRkDSTiKauVNMy3DTov74OiVYhWF0Qmn24bBOuGlxg+ISDLAcI7S3YCExDqkOQFDjI/QVgSb5262FrSDsfAQ2LkigptA9uRFNhonaidaPj6DQ1sw6vJpJ30gOsMy5G+igOwc/OUZUrakQLtBeF2ONbqLOo7nkaa9ig4nGgH/7C916HU8BleM8B+BaaQhWNwl/c/dNjq4eDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/kahapFlp8K+3dWMtIuVdgPzOOLqJ2YiHWrdTONz/I=;
 b=ir9wXffNZZ5AoFzDOYOUfW/+8KUym34EPoTngN0EJwO+g2U+UCNHBkIo54nuaECCbjfCBNO5cwvim/67Vp2jVWFaz2hetN2fpVSFpxueybBL80PPXav4Y6MKff4qtJogaGA0sij0SEGgbpSinJGfTG8RbeWcvoXIt1oVArpb/Bsbkt1VDygCOdC/FYWztEU1NguX3Mgt/pY9PAwurBdokQ2ijdIrLUgvmV6MiFjwxBgWSFme2974tgp5VvQX+o+Vt+aKenBwnIav/WWrsG9GXJq+At29ijDdHwgXAqW7pcPfmxP9PmfTZOrSnit9Smn/7qwTJ0ykAnj2ki9jcepdCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/kahapFlp8K+3dWMtIuVdgPzOOLqJ2YiHWrdTONz/I=;
 b=dkb56rb9tjxr4R5ZSTSFDYyJySdDdomfzI6daP7ulzppTDNmlbJSvqPRi2zY76bISPiVUPnccsjl8BJuBZHy/Cv1mICtefJSJKXv8+2P1t/MkFFU6lIeYBjzv4aK/helKDygFSJKlm84hfGhAQxyxsJd2VEvG3nuaYL493eBRy4=
Received: from PH8PR07CA0045.namprd07.prod.outlook.com (2603:10b6:510:2cf::14)
 by DM6PR12MB4388.namprd12.prod.outlook.com (2603:10b6:5:2a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 13:32:06 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:510:2cf:cafe::ca) by PH8PR07CA0045.outlook.office365.com
 (2603:10b6:510:2cf::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Fri,
 11 Apr 2025 13:32:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 11 Apr 2025 13:32:05 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Apr
 2025 08:32:00 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<shyam-sundar.s-k@amd.com>, <gautham.shenoy@amd.com>,
	<mario.limonciello@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<anand.umarji@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v8 06/10] misc: amd-sbi: Add support for AMD_SBI IOCTL
Date: Fri, 11 Apr 2025 13:31:18 +0000
Message-ID: <20250411133122.1806991-7-akshay.gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|DM6PR12MB4388:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ac4779d-b33f-4419-4a51-08dd78fd4015
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kiFrkG8lnqHVQlNpsQ6P22tBZsLTrKoPhdliDrJc4rZjtqVwRGu5vk1cQ2hb?=
 =?us-ascii?Q?jf+T1CxC2S7vHyy/FHwHSDNwegqDZO6Cz54BSJqI425DVjGqjog5fExPCwqi?=
 =?us-ascii?Q?SzZxOtgoMK1BdTuuyXkoBBsExCpX/qqgzHleFv3+r6oVIjtmV7S3llXzDAB3?=
 =?us-ascii?Q?RTm4XGbZl7pyzo9bbytKWXrPmXhHeJmWyfmlKw1+06eB7/PfoIw0K4PJTLKb?=
 =?us-ascii?Q?TC1fYv9E4dh/kxLrMThV0Up9i+A81WGtFREL8t7wDFZiCcVLe13MIxx+HqFD?=
 =?us-ascii?Q?xth4TcZpbVZQSG37eoG2iPYAXlN4jl+U7U8K+rllQYzTIZgWRE+zI/dF5z/b?=
 =?us-ascii?Q?yLS18iaz9Afpq6T+uUmCAx3UMKqc0qR2ZkdRYad6J+nrn8JsD8Y8/e+CbC3K?=
 =?us-ascii?Q?dE4w1nbmuX0p1gpneXaCyVBTzJYI0SVovtg6NFqQB8CtI3p3Vc6Vh6uZQ75m?=
 =?us-ascii?Q?0/dQHlBBSs2T1eBZVQ6VgnQJRBqUScRz8ZXx85dIuvO7liZkk3rwzg9GotDB?=
 =?us-ascii?Q?9esJIcxpQ8rgRR6eMWIv3U9AnP6bbNCXxZeAEFmFn0dqn8YjO4DlPGU5ciJB?=
 =?us-ascii?Q?4JDwoNfR0cFM/NLsfoBeYSbkKf0icAhpSTyaANgB3EB5rqrBX4TyToBGCfEx?=
 =?us-ascii?Q?LcK163hzVjaaFvcM1hhmbzMLYSG02TQAQNZco2M5oX9PetGyjGGtakGASRot?=
 =?us-ascii?Q?SVgfwGjRAiG1s992J8FdJfgGL0+4m37exoUSjGGZA8f6JMYw7MwDf5n26SXZ?=
 =?us-ascii?Q?zkZOKZxbG8nFKiboc8ZKhvR/k7DYw/9Jp+XCXq3fXF550V4zlMYiI1vHRWCu?=
 =?us-ascii?Q?HvtMZ4sKhpxbgB4fCDc7WzAuvfF/QqhodrYNFHGBO/JGGc5trDSiXoBG28Dl?=
 =?us-ascii?Q?IaKR5xNFtxFbqHsiZtd5bQ7po1fpkEWEBwomLBrZuoxrZQscorG8yV9FsJip?=
 =?us-ascii?Q?631CPK3UcKo7lnHYaBciNSu2H171lV2j8ESG3OE6TatC0PW6J4iY7tlVsROT?=
 =?us-ascii?Q?OKHrAULSOQBob2M6Rke0vtcBe8hlHp/xLuJZRg19niY7SuootI4H/l6eqUz/?=
 =?us-ascii?Q?b1G4INUc42jQanMoYKJD77BeY8wg9M1dxHL2bt7jqtx/VVUj17vpY9rI4b2c?=
 =?us-ascii?Q?yJW2nQqAjyqblwlAPf93d/RiFEIzCPK5UTI2S3mQ3/KI8s4K11K+oGEG9VZU?=
 =?us-ascii?Q?MiVLVYFFZajhxoFb2Hpbk315s7nOCsLCS1h39otQ4X4R+VLYN3lSgbbDs09Y?=
 =?us-ascii?Q?9ye52SqFL5TsMmbDaelKiVtxoonBOmo6exCoXDwjfcQd7PsHCyRLo8Pr5Thq?=
 =?us-ascii?Q?qXJ6gHGye1uN75bI+cXp9yKIBf7Cspjhl2hh5VksRLgSy0SQNr/ffglGQYyp?=
 =?us-ascii?Q?37jLd61OtZWL+rYbIcNaM67SBcUC2Dqjj/Tf35812vj/5oVNyhz4dSQc3/+V?=
 =?us-ascii?Q?KVY/S/52sZ4Z65AaN47zFQ2YDtCYNY54gSRA17F+8wf7rbGIaoYpgTYKrZRu?=
 =?us-ascii?Q?4WfYEOVj7Rij7qCAKULk5UWNgzmft54+pdhR?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 13:32:05.2112
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac4779d-b33f-4419-4a51-08dd78fd4015
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4388

The present sbrmi module only support reporting power via hwmon.
However, AMD data center range of processors support various
system management functionality using custom protocols defined in
Advanced Platform Management Link (APML) specification.

Register a miscdevice, which creates a device /dev/sbrmiX with an IOCTL
interface for the user space to invoke the APML Mailbox protocol, which
is already defined in sbrmi_mailbox_xfer().

The APML protocols depend on a set of RMI registers. Having an IOCTL
as a single entry point will help in providing synchronization among
these protocols as multiple transactions on RMI register set may
create race condition.
Support for other protocols will be added in subsequent patches.

APML mailbox protocol returns additional error codes written by
SMU firmware in the out-bound register 0x37. These errors include,
invalid core, message not supported over platform and
others. This additional error codes can be used to provide more
details to user space.

Open-sourced and widely used https://github.com/amd/esmi_oob_library
will continue to provide user-space programmable API.

Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
---
Changes since v7:
- Address Arnd comment:
  - New IOCTL and structure defined to separate
    ioctl for each protocol

Changes since v6:
- Address Arnd comments
 - Squash patch 7 in this patch
 - Remove check on "cmd" size as it's implied
 - Update check on input structure, msg.cmd to max value of 0xFF

Changes since v5:
- Address review comment
 - Address Arnd comments
 - Add check for cmd in ioctl
 - Remove attribute packed from uapi header file structure apml_message{}
- Address kernel test robot warn:
 - warn: can 'data' even be NULL?

Changes since v4:
- Address review comment
 - Address Greg review comments
 - Not initialize ret
 - return on error
- Previously patch 4
- Fix documentation warning

Changes since v3:
- Previously patch 3
- Documentation and comments changes

Changes since v2:
- update the MACROS name as per feedback

Changes since v1:
- Previously patch 5
- Add IOCTL description in ioctl-number.rst
- Split patch as per suggestion.

 Documentation/misc-devices/index.rst          |  1 +
 .../userspace-api/ioctl/ioctl-number.rst      |  2 +
 drivers/misc/amd-sbi/rmi-core.c               | 92 ++++++++++++++++---
 drivers/misc/amd-sbi/rmi-core.h               | 15 ++-
 drivers/misc/amd-sbi/rmi-hwmon.c              | 13 ++-
 drivers/misc/amd-sbi/rmi-i2c.c                | 25 ++++-
 include/uapi/misc/amd-apml.h                  | 51 ++++++++++
 7 files changed, 167 insertions(+), 32 deletions(-)
 create mode 100644 include/uapi/misc/amd-apml.h

diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-devices/index.rst
index 8c5b226d8313..081e79415e38 100644
--- a/Documentation/misc-devices/index.rst
+++ b/Documentation/misc-devices/index.rst
@@ -12,6 +12,7 @@ fit into other categories.
    :maxdepth: 2
 
    ad525x_dpot
+   amd-sbi
    apds990x
    bh1770glc
    c2port
diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 7a1409ecc238..3191d96ea4da 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -397,6 +397,8 @@ Code  Seq#    Include File                                           Comments
                                                                      <mailto:mathieu.desnoyers@efficios.com>
 0xF8  all    arch/x86/include/uapi/asm/amd_hsmp.h                    AMD HSMP EPYC system management interface driver
                                                                      <mailto:nchatrad@amd.com>
+0xF9  00-0F  uapi/misc/amd-apml.h		                     AMD side band system management interface driver
+                                                                     <mailto:naveenkrishna.chatradhi@amd.com>
 0xFD  all    linux/dm-ioctl.h
 0xFE  all    linux/isst_if.h
 ====  =====  ======================================================= ================================================================
diff --git a/drivers/misc/amd-sbi/rmi-core.c b/drivers/misc/amd-sbi/rmi-core.c
index 1d5e2556ab88..7d13c049c98d 100644
--- a/drivers/misc/amd-sbi/rmi-core.c
+++ b/drivers/misc/amd-sbi/rmi-core.c
@@ -7,7 +7,10 @@
  */
 #include <linux/delay.h>
 #include <linux/err.h>
+#include <linux/fs.h>
 #include <linux/i2c.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/regmap.h>
 #include "rmi-core.h"
@@ -20,15 +23,17 @@
 #define TRIGGER_MAILBOX	0x01
 
 int rmi_mailbox_xfer(struct sbrmi_data *data,
-		     struct sbrmi_mailbox_msg *msg)
+		     struct apml_mbox_msg *msg)
 {
-	unsigned int bytes;
+	unsigned int bytes, ec;
 	int i, ret;
 	int sw_status;
 	u8 byte;
 
 	mutex_lock(&data->lock);
 
+	msg->fw_ret_code = 0;
+
 	/* Indicate firmware a command is to be serviced */
 	ret = regmap_write(data->regmap, SBRMI_INBNDMSG7, START_CMD);
 	if (ret < 0)
@@ -44,8 +49,8 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 	 * Command Data In[31:0] to SBRMI::InBndMsg_inst[4:1]
 	 * SBRMI_x3C(MSB):SBRMI_x39(LSB)
 	 */
-	for (i = 0; i < 4; i++) {
-		byte = (msg->data_in >> i * 8) & 0xff;
+	for (i = 0; i < AMD_SBI_MB_DATA_SIZE; i++) {
+		byte = (msg->mb_in_out >> i * 8) & 0xff;
 		ret = regmap_write(data->regmap, SBRMI_INBNDMSG1 + i, byte);
 		if (ret < 0)
 			goto exit_unlock;
@@ -69,29 +74,90 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 	if (ret)
 		goto exit_unlock;
 
+	ret = regmap_read(data->regmap, SBRMI_OUTBNDMSG7, &ec);
+	if (ret || ec)
+		goto exit_clear_alert;
 	/*
 	 * For a read operation, the initiator (BMC) reads the firmware
 	 * response Command Data Out[31:0] from SBRMI::OutBndMsg_inst[4:1]
 	 * {SBRMI_x34(MSB):SBRMI_x31(LSB)}.
 	 */
-	if (msg->read) {
-		for (i = 0; i < 4; i++) {
-			ret = regmap_read(data->regmap,
-					  SBRMI_OUTBNDMSG1 + i, &bytes);
-			if (ret < 0)
-				goto exit_unlock;
-			msg->data_out |= bytes << i * 8;
-		}
+	for (i = 0; i < AMD_SBI_MB_DATA_SIZE; i++) {
+		ret = regmap_read(data->regmap,
+				  SBRMI_OUTBNDMSG1 + i, &bytes);
+		if (ret < 0)
+			break;
+		msg->mb_in_out |= bytes << i * 8;
 	}
 
+exit_clear_alert:
 	/*
 	 * BMC must write 1'b1 to SBRMI::Status[SwAlertSts] to clear the
 	 * ALERT to initiator
 	 */
 	ret = regmap_write(data->regmap, SBRMI_STATUS,
 			   sw_status | SW_ALERT_MASK);
-
+	if (ec) {
+		ret = -EPROTOTYPE;
+		msg->fw_ret_code = ec;
+	}
 exit_unlock:
 	mutex_unlock(&data->lock);
 	return ret;
 }
+
+static int apml_mailbox_xfer(struct sbrmi_data *data, struct apml_mbox_msg __user *arg)
+{
+	struct apml_mbox_msg msg = { 0 };
+	int ret;
+
+	/* Copy the structure from user */
+	if (copy_from_user(&msg, arg, sizeof(struct apml_mbox_msg)))
+		return -EFAULT;
+
+	/* Mailbox protocol */
+	ret = rmi_mailbox_xfer(data, &msg);
+	if (ret && ret != -EPROTOTYPE)
+		return ret;
+
+	return copy_to_user(arg, &msg, sizeof(struct apml_mbox_msg));
+}
+
+static long sbrmi_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
+{
+	void __user *argp = (void __user *)arg;
+	struct sbrmi_data *data;
+
+	data = container_of(fp->private_data, struct sbrmi_data, sbrmi_misc_dev);
+	switch (cmd) {
+	case SBRMI_IOCTL_MBOX_CMD:
+		return apml_mailbox_xfer(data, argp);
+	default:
+		return -ENOTTY;
+	}
+}
+
+static const struct file_operations sbrmi_fops = {
+	.owner		= THIS_MODULE,
+	.unlocked_ioctl	= sbrmi_ioctl,
+	.compat_ioctl	= compat_ptr_ioctl,
+};
+
+int create_misc_rmi_device(struct sbrmi_data *data,
+			   struct device *dev)
+{
+	data->sbrmi_misc_dev.name	= devm_kasprintf(dev,
+							 GFP_KERNEL,
+							 "sbrmi-%x",
+							 data->dev_static_addr);
+	data->sbrmi_misc_dev.minor	= MISC_DYNAMIC_MINOR;
+	data->sbrmi_misc_dev.fops	= &sbrmi_fops;
+	data->sbrmi_misc_dev.parent	= dev;
+	data->sbrmi_misc_dev.nodename	= devm_kasprintf(dev,
+							 GFP_KERNEL,
+							 "sbrmi-%x",
+							 data->dev_static_addr);
+	data->sbrmi_misc_dev.mode	= 0600;
+
+	return misc_register(&data->sbrmi_misc_dev);
+}
diff --git a/drivers/misc/amd-sbi/rmi-core.h b/drivers/misc/amd-sbi/rmi-core.h
index 3a6028306d10..8ab31c6852d1 100644
--- a/drivers/misc/amd-sbi/rmi-core.h
+++ b/drivers/misc/amd-sbi/rmi-core.h
@@ -6,10 +6,12 @@
 #ifndef _SBRMI_CORE_H_
 #define _SBRMI_CORE_H_
 
+#include <linux/miscdevice.h>
 #include <linux/mutex.h>
 #include <linux/i2c.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <uapi/misc/amd-apml.h>
 
 /* SB-RMI registers */
 enum sbrmi_reg {
@@ -48,19 +50,15 @@ enum sbrmi_msg_id {
 
 /* Each client has this additional data */
 struct sbrmi_data {
+	struct miscdevice sbrmi_misc_dev;
 	struct regmap *regmap;
+	/* Mutex locking */
 	struct mutex lock;
 	u32 pwr_limit_max;
+	u8 dev_static_addr;
 };
 
-struct sbrmi_mailbox_msg {
-	u8 cmd;
-	bool read;
-	u32 data_in;
-	u32 data_out;
-};
-
-int rmi_mailbox_xfer(struct sbrmi_data *data, struct sbrmi_mailbox_msg *msg);
+int rmi_mailbox_xfer(struct sbrmi_data *data, struct apml_mbox_msg *msg);
 #ifdef CONFIG_AMD_SBRMI_HWMON
 int create_hwmon_sensor_device(struct device *dev, struct sbrmi_data *data);
 #else
@@ -69,4 +67,5 @@ static inline int create_hwmon_sensor_device(struct device *dev, struct sbrmi_da
 	return 0;
 }
 #endif
+int create_misc_rmi_device(struct sbrmi_data *data, struct device *dev);
 #endif /*_SBRMI_CORE_H_*/
diff --git a/drivers/misc/amd-sbi/rmi-hwmon.c b/drivers/misc/amd-sbi/rmi-hwmon.c
index 720e800db1f0..f4f015605daa 100644
--- a/drivers/misc/amd-sbi/rmi-hwmon.c
+++ b/drivers/misc/amd-sbi/rmi-hwmon.c
@@ -6,6 +6,7 @@
  */
 #include <linux/err.h>
 #include <linux/hwmon.h>
+#include <uapi/misc/amd-apml.h>
 #include "rmi-core.h"
 
 /* Do not allow setting negative power limit */
@@ -15,7 +16,7 @@ static int sbrmi_read(struct device *dev, enum hwmon_sensor_types type,
 		      u32 attr, int channel, long *val)
 {
 	struct sbrmi_data *data = dev_get_drvdata(dev);
-	struct sbrmi_mailbox_msg msg = { 0 };
+	struct apml_mbox_msg msg = { 0 };
 	int ret;
 
 	if (!data)
@@ -24,7 +25,6 @@ static int sbrmi_read(struct device *dev, enum hwmon_sensor_types type,
 	if (type != hwmon_power)
 		return -EINVAL;
 
-	msg.read = true;
 	switch (attr) {
 	case hwmon_power_input:
 		msg.cmd = SBRMI_READ_PKG_PWR_CONSUMPTION;
@@ -35,7 +35,7 @@ static int sbrmi_read(struct device *dev, enum hwmon_sensor_types type,
 		ret = rmi_mailbox_xfer(data, &msg);
 		break;
 	case hwmon_power_cap_max:
-		msg.data_out = data->pwr_limit_max;
+		msg.mb_in_out = data->pwr_limit_max;
 		ret = 0;
 		break;
 	default:
@@ -44,7 +44,7 @@ static int sbrmi_read(struct device *dev, enum hwmon_sensor_types type,
 	if (ret < 0)
 		return ret;
 	/* hwmon power attributes are in microWatt */
-	*val = (long)msg.data_out * 1000;
+	*val = (long)msg.mb_in_out * 1000;
 	return ret;
 }
 
@@ -52,7 +52,7 @@ static int sbrmi_write(struct device *dev, enum hwmon_sensor_types type,
 		       u32 attr, int channel, long val)
 {
 	struct sbrmi_data *data = dev_get_drvdata(dev);
-	struct sbrmi_mailbox_msg msg = { 0 };
+	struct apml_mbox_msg msg = { 0 };
 
 	if (!data)
 		return -ENODEV;
@@ -68,8 +68,7 @@ static int sbrmi_write(struct device *dev, enum hwmon_sensor_types type,
 	val = clamp_val(val, SBRMI_PWR_MIN, data->pwr_limit_max);
 
 	msg.cmd = SBRMI_WRITE_PKG_PWR_LIMIT;
-	msg.data_in = val;
-	msg.read = false;
+	msg.mb_in_out = val;
 
 	return rmi_mailbox_xfer(data, &msg);
 }
diff --git a/drivers/misc/amd-sbi/rmi-i2c.c b/drivers/misc/amd-sbi/rmi-i2c.c
index 7a9801273a4c..f891f5af4bc6 100644
--- a/drivers/misc/amd-sbi/rmi-i2c.c
+++ b/drivers/misc/amd-sbi/rmi-i2c.c
@@ -38,15 +38,14 @@ static int sbrmi_enable_alert(struct sbrmi_data *data)
 
 static int sbrmi_get_max_pwr_limit(struct sbrmi_data *data)
 {
-	struct sbrmi_mailbox_msg msg = { 0 };
+	struct apml_mbox_msg msg = { 0 };
 	int ret;
 
 	msg.cmd = SBRMI_READ_PKG_MAX_PWR_LIMIT;
-	msg.read = true;
 	ret = rmi_mailbox_xfer(data, &msg);
 	if (ret < 0)
 		return ret;
-	data->pwr_limit_max = msg.data_out;
+	data->pwr_limit_max = msg.mb_in_out;
 
 	return ret;
 }
@@ -81,8 +80,25 @@ static int sbrmi_i2c_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
+	data->dev_static_addr = client->addr;
 	dev_set_drvdata(dev, data);
-	return create_hwmon_sensor_device(dev, data);
+
+	ret = create_hwmon_sensor_device(dev, data);
+	if (ret < 0)
+		return ret;
+	return create_misc_rmi_device(data, dev);
+}
+
+static void sbrmi_i2c_remove(struct i2c_client *client)
+{
+	struct sbrmi_data *data = dev_get_drvdata(&client->dev);
+
+	misc_deregister(&data->sbrmi_misc_dev);
+	/* Assign fops and parent of misc dev to NULL */
+	data->sbrmi_misc_dev.fops = NULL;
+	data->sbrmi_misc_dev.parent = NULL;
+	dev_info(&client->dev, "Removed sbrmi-i2c driver\n");
+	return;
 }
 
 static const struct i2c_device_id sbrmi_id[] = {
@@ -105,6 +121,7 @@ static struct i2c_driver sbrmi_driver = {
 		.of_match_table = of_match_ptr(sbrmi_of_match),
 	},
 	.probe = sbrmi_i2c_probe,
+	.remove = sbrmi_i2c_remove,
 	.id_table = sbrmi_id,
 };
 
diff --git a/include/uapi/misc/amd-apml.h b/include/uapi/misc/amd-apml.h
new file mode 100644
index 000000000000..a5f086f84b06
--- /dev/null
+++ b/include/uapi/misc/amd-apml.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Copyright (C) 2021-2024 Advanced Micro Devices, Inc.
+ */
+#ifndef _AMD_APML_H_
+#define _AMD_APML_H_
+
+#include <linux/types.h>
+
+/* Mailbox data size for data_in and data_out */
+#define AMD_SBI_MB_DATA_SIZE		4
+
+struct apml_mbox_msg {
+	/*
+	 * Mailbox Message ID
+	 */
+	__u32 cmd;
+	/*
+	 * [0]...[3] mailbox 32bit input/output data
+	 */
+	__u32 mb_in_out;
+	/*
+	 * Error code is returned in case of soft mailbox error
+	 */
+	__u32 fw_ret_code;
+};
+
+/*
+ * AMD sideband interface base IOCTL
+ */
+#define SB_BASE_IOCTL_NR	0xF9
+
+/**
+ * DOC: SBRMI_IOCTL_MBOX_CMD
+ *
+ * @Parameters
+ *
+ * @struct apml_mbox_msg
+ *	Pointer to the &struct apml_mbox_msg that will contain the protocol
+ *	information
+ *
+ * @Description
+ * IOCTL command for APML messages using generic _IOWR
+ * The IOCTL provides userspace access to AMD sideband mailbox protocol
+ * - Mailbox message read/write(0x0~0xFF)
+ * - returning "-EFAULT" if none of the above
+ * "-EPROTOTYPE" error is returned to provide additional error details
+ */
+#define SBRMI_IOCTL_MBOX_CMD		_IOWR(SB_BASE_IOCTL_NR, 0, struct apml_mbox_msg)
+
+#endif /*_AMD_APML_H_*/
-- 
2.25.1

