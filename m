Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA281D63F8;
	Mon, 28 Apr 2025 06:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745821884; cv=fail; b=C7tkfe/tRMA1ukpKvArXNSwAFQUQT0ZKVT3bqkDR6pGCGjAiPtXgKuHMz2kWFe8T9vAp6Y5ofFplGybgXWkev3F0GO/6xPLTRMBXgQvnZ8/bDwsDr7e2zlSEAUOcpWyy/XJclet7fFN6qLH7EcJ1YFQ9Y/o9712UPKxronVxVUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745821884; c=relaxed/simple;
	bh=IuNCf6bnUwvnw8IDe0LAQf4yk2UGWE8bQlSXKOjiTug=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pHisIsV5nXwieXf4UsettGkfV9Z50Ly6S9b1njRmF+kpVBUo4bBhzZBkg+ZbLK+PaVPmxiKlOZR04Gu4W1kfmabNpjZ4Y0+lj3RP5M6viH9rmAzwZ3aDR02DZCkgpxHYrzyqgE7eo/V/44DQwzFsiWgxHVR4Boe8dat1A8ZcMpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PZk+aplr; arc=fail smtp.client-ip=40.107.244.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PZk+aplr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DqVRg2ghbKrTVmkEGVLt9FYrmOZav7yy+cGtNOjqS+Zcfiie3KjSgPfqzf6fclW5bkQtjq9SH8SFaQezPMkYBg4puwKZhDLnsKChIDXWerKP9TbtdPNA2iElEr2RK3QfCak6sGbbXreX5OkJvhss8pjb6iWz8MXaQ11EWE0oeCwxVDzeCzKbgwqX4kJg3g09wZIzW8xSDoUT2UFA+JaeL+9FOrKnU0wlpKJK46V2S6xVRBuE4mRBO9PW10YztoM5o6Go1ypgd/e2h98kPpR7PL5S9jBfLLDRuKJiEsReInG07+K1PmYMbxLhVAGdTJpmYpfwpenAGmEjbSBG8RYE4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/kahapFlp8K+3dWMtIuVdgPzOOLqJ2YiHWrdTONz/I=;
 b=pGvHfFXTIiNInDKmyWERmeJnUBbQvngF0z5pFBWPe9EGITpJTG4iJ5mS5e72Uzgn3PXdcJ8QiDZs8zDHwP1BqpiMIfnHW2hA90K4Hy5vjb1cMpl/LOruZY6P1UCAUxsDDFFEdPuYZYGXSLtHr9HgLqbKxPQOCSy9Ddfh1NvDXQrwThMgnTZyAeFv2IYCoi0bUyjL7hXpxo4CUGow+F5nCSNobgU8+IEzHN49SS9JE2S4xyygr70XW/4zSRCCmBr1rHMzMXYgxY6b5GyDvzlGUSQshua/de9jiQ1dfmproDm1y7KSzOOlH1HvquddfNbJAJvBGVg0TAH+ctzndFVphA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/kahapFlp8K+3dWMtIuVdgPzOOLqJ2YiHWrdTONz/I=;
 b=PZk+aplrTFcWZCcUChSU1KAxrNpZ6ZPOPK4QyAclcldpAOtxWJn+Az/wipSkCiMvHModB4OjOMRQXa+rNGS7E6imsqu+twm10gcOvrTil3JY/JMuesUCyJkzWCnhoLyDnm/XuoIB7may69QbB5ApBOeEVV/ijGGY9RcvGha7UT0=
Received: from SN7PR04CA0067.namprd04.prod.outlook.com (2603:10b6:806:121::12)
 by CH3PR12MB7715.namprd12.prod.outlook.com (2603:10b6:610:151::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Mon, 28 Apr
 2025 06:31:15 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com
 (2603:10b6:806:121:cafe::38) by SN7PR04CA0067.outlook.office365.com
 (2603:10b6:806:121::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Mon,
 28 Apr 2025 06:31:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 06:31:15 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 01:31:10 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<shyam-sundar.s-k@amd.com>, <gautham.shenoy@amd.com>,
	<mario.limonciello@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<anand.umarji@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v9 06/10] misc: amd-sbi: Add support for AMD_SBI IOCTL
Date: Mon, 28 Apr 2025 06:30:30 +0000
Message-ID: <20250428063034.2145566-7-akshay.gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|CH3PR12MB7715:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ab30645-59d6-403e-eec1-08dd861e46dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d8y7F1XrWQnA9lTptu4RHoeQFv/bjtA0FYT5lL3CqfjNcsYPZzxDXJTmfPgH?=
 =?us-ascii?Q?oV42A4iu/lVL9g+o4zf6vlL1cYASATpf81yGcicev8TT9kfTICYEf7n8HEy0?=
 =?us-ascii?Q?9wKU5zhhM1arJBLhcp3SOpX6O8u3kcgM9WGp98th2wQZL1h5sOGxNTRf+beJ?=
 =?us-ascii?Q?ORYeraqJOv7Trzvvr3ldkRXLDkd7zYOUeq7wnc59HPAPsHVZJDVFcGW+YHyV?=
 =?us-ascii?Q?eyVEYLpmAicMz1lmuhRmBxpNqSa9BjkViP9bJ2gXRhRwjaz20bK0V3GvMNVv?=
 =?us-ascii?Q?Ri6ppahY7KSTs7cW6Vztdm/p0FxYTiuUatelXtZU6AWgu5E9823dQuSKZss4?=
 =?us-ascii?Q?Nu4WE02W3YOJLyHcGTX5auHLv4cbildzQqrZ7zYkkJzk4kc3ct6u42A2vAvd?=
 =?us-ascii?Q?E6TCSGBEQXK19V0lyICU3+Q0c9Mc+dMTcchcet82K4jcS0l7ekRd34D1EFBD?=
 =?us-ascii?Q?jdZt5TzEXS4H5XX90uFTv1f6QaJhzxiHQzLyHLrcM8QDl2UsvQuxu/K1sRwJ?=
 =?us-ascii?Q?+MJvXUogIlMyyT7wpF07w11pXJgcn4tMJvWZnZwBs4rzKT85ulwn+aeE77WK?=
 =?us-ascii?Q?nxV2aax9R4kLFQEP+EKR6CaAltSEVFoMPCJwfcRPq95Pq0KDxOuvZNEV5+sO?=
 =?us-ascii?Q?UqZd/MjuexboZhzkOe+uqVf3k703NPmO4fuRgvHaOgKWAMGwY8KzdvpoV3lO?=
 =?us-ascii?Q?pNu04iCidFQ8yH961+slnAFYzc4MDLK7/W13ELc/xlWI+V9Um6ftlM5i6o3s?=
 =?us-ascii?Q?3AY19PgXurvu0pPIZJBFJCa/d6id+paZ9hNJKfNCWGgGB3/K7mxVKEZC3V0p?=
 =?us-ascii?Q?Yrc7AKGByowtSWEh7TMlWUl7P0d/3iVRfTOCLUg9Nf1ZBb4kDwT7ecJGHxuK?=
 =?us-ascii?Q?apAKSTPcZD90HnQOwb35cLjuNNuUXY0DAlrILG4FqUZ02yw5QmgQUhwVNsdC?=
 =?us-ascii?Q?tDtYbALeLiJ0Rdxy+39WjK5RbMYQ/5S3pAgygDwgbjvwzErDolz+eZf6zK2V?=
 =?us-ascii?Q?oQ/a0fPgynhdNF1Wes++X52w0tC027viiPxCd32HOj46J41/eR7pVZK5WR7B?=
 =?us-ascii?Q?sDDwTHWPFmR12z2liyxMGGDf413uT9PjvZRdADNT7+cbYu84y4icoQIjj2pd?=
 =?us-ascii?Q?DxcFzAVgbR2O2j9PUWaIIlj7VirV0mT6yC6FpphofOcm7KpzV/Hxz0jmIZyh?=
 =?us-ascii?Q?wJx5X1pprhANzYvykGGP7UYis+yo4LQmIeP+XuSprxAJdzQ4eJ38bFwWfgNH?=
 =?us-ascii?Q?lvHajZkxjBf+ASTMuX+iwkXkiGGMiqdWj+38EojBQJO3LtHO+EoFJp9HCwDb?=
 =?us-ascii?Q?WXg1XfhNvc8fmDcYsQm8kSqd494FTu28/qvOrUqE5w0ra11WInv1cUchsYxJ?=
 =?us-ascii?Q?ZRowjsP8iHDpLTM1aaumtAF+0JeII3enowm9WwRu1W1LaCrtmP/nBuzf7oRK?=
 =?us-ascii?Q?MAMMKTJRBzPI2zUYPD5sLit0Cq7wGgRWL800aCwKj4hD3A4O4LfLLeggE9Nk?=
 =?us-ascii?Q?p/kvdMKbzMw+fOnbpGXwftgi2Z43D6t5/Of3Rz+XQeDtBFQN7KPc2uTM0A?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 06:31:15.1942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ab30645-59d6-403e-eec1-08dd861e46dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7715

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

