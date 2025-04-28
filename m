Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2A41D5165;
	Mon, 28 Apr 2025 06:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745821880; cv=fail; b=Akx3OQ++OCmmqwbUfxxzzZsWNhRxGPtz33ptVbRGxhTaM797HSkUdJYKLBWLJZXpZBq5YR08pLe4lpsYkilXe5OFVcJrpdxQrQ5sAMU3v++6TV9MKpFF787hbaaYJTVS0aRQDRf1ncIXDpmIh1Yf5a3ujNDOnOHYb7ESjziAaWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745821880; c=relaxed/simple;
	bh=/hylpCazgtSHgUqctuy5zSLTFlF61o/rcxgXvvSFUQc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nLNYfgtDYIm0Wf9sTUNaPxlOyVRxY/EY+25lpmTJBIX1p+NseCShkXN56ZCZUzkU5Jh3G7Q/9Nl8l+kFPpx4/l8ZMO4jP8FeUaqsmRGIKMAnEY3GPozwij5mNq+O+Oto9R5VG/swQ+wxLpVARylmYOLW1qwsiNOnnX51RMig7+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=C5LgOiWL; arc=fail smtp.client-ip=40.107.93.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="C5LgOiWL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pZrB+If0ds5SCkuU9dFj4Xk42NUsou29JEA9b9+H5FcAUrUYCOFfLvZUVQDjFnB/UXV8qinzyIBiroOltGx5C7UVaM1QWI33kFVC4CLmACOFIQbb83KY8BJ6vwri//ON1F0viswzqaiwlImAv+w2gdlGXxxdm8PngiskTXZCmTECfsQyiScMUmTWcKZkB6viVaI4UfJWUOWaWkU3ghmiJiPh3f1GF4PNtiKJcIcOvonrp1BZGvt1GzpasmSdgRaoTrIp3toNOVN+4EsBDLsS7Aty8h4pqv8emdb68JPFEDcQEMOnq+7Q389QWKUHXoh3ov9EzroR9mbKNzvV3MaFrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TG/hsuXoeICZfIxIRNFbNIU6w59mt9fCZldXT79Y9Rs=;
 b=osclM33QOUKaY5Ifo7v2H57+9gg+usAwbJ8y9HYWfx5mBajVJyQuXR8l0Z27l/9OeTpvERrWJJR7C0CtoXzpTUg9RVRiqovsdOn0NFDp9YR7Q/7u2QIHo9wRVeaSgHV/MddRBkzcCxcOMDeYZjomiD/Y8cMYjKACZpFvnK1YNKORcI1+2NLXrMufMyvG9ExRE0+T9tlkjtdjiyHIKIfZAPViht7ZMe6B0GAXp61Q9l99TGhp+5VUGWHqzTK7OeK+1LCc8JAhPF3J77SD90cOo2B5i3EgnkHiFu/WAHBxjgZni9EMM7SDsMMNK/sx/4+fmdyuVcHHOP82EZ6RTZkayw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TG/hsuXoeICZfIxIRNFbNIU6w59mt9fCZldXT79Y9Rs=;
 b=C5LgOiWL3R0XhbTDso3000AUJQF8ttxtr4RpdjajW4vSYSf7I9zWOf4wHhwO6j465SnTdnCkOk4IPpG0GCzBmeKRd5GvVfJPVr0jKqWMDMG76vS09MLyj9lJtHI5WyvlwJajHfX+KSBoNHA7fwVq7kuKrTt8PQkYG2/HeSf3FuI=
Received: from MW4PR03CA0044.namprd03.prod.outlook.com (2603:10b6:303:8e::19)
 by SJ0PR12MB7035.namprd12.prod.outlook.com (2603:10b6:a03:47c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 06:31:14 +0000
Received: from SN1PEPF0002BA4B.namprd03.prod.outlook.com
 (2603:10b6:303:8e:cafe::62) by MW4PR03CA0044.outlook.office365.com
 (2603:10b6:303:8e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Mon,
 28 Apr 2025 06:31:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4B.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 06:31:13 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 01:31:03 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<shyam-sundar.s-k@amd.com>, <gautham.shenoy@amd.com>,
	<mario.limonciello@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<anand.umarji@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v9 04/10] misc: amd-sbi: Use regmap subsystem
Date: Mon, 28 Apr 2025 06:30:28 +0000
Message-ID: <20250428063034.2145566-5-akshay.gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4B:EE_|SJ0PR12MB7035:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d2feeed-8a0a-4418-386c-08dd861e45d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WvN20XpCw7bc1RgjlqYoX3JXv8it52XnB/Xfio8Qm8asBre21iJ+hWyaU4ta?=
 =?us-ascii?Q?oOLHSsEhh+32bGI0+A9o661XbDCAvxHcdMIfa+NoVXgXaZXBxd09ckTTjFyE?=
 =?us-ascii?Q?31LOOKwQq2s/11DYt7C8V8IwR1Lh1Pj89dQVnEbUzVWVhkl0xMb4k+AYPxXg?=
 =?us-ascii?Q?D4NX2vQm2W6klxgH7q5e36lIxi5U8Z/t1uVGS4Q/hOBw3KOfjhFyo5ZmWu0I?=
 =?us-ascii?Q?f92GlUma2Vq6aU8JAzFbUwR3WVN3eoizahJKncpey/PEHJYA6M0W08Hd2RCl?=
 =?us-ascii?Q?8gkL+zbADKy/OmgcTvnNmK5vgdQRoDW0hh3cwWZWDhfZlaboWWKsf5E+DbbM?=
 =?us-ascii?Q?sNjZ9/ansIJILrq/KsmzFIIA2iEFjariZoT7C1W/My9m3AYGgF2cxehLaNm6?=
 =?us-ascii?Q?isD5qWBnrQxuUjaKF5bU4aNOj8yyRHcrDSAiLBz0YKkK8/oVM9Osed+nYaxM?=
 =?us-ascii?Q?si0tjDxBQNeOY9RM5PAGvfWRg1jvaK3s2qt2S3mneO+Long36/KPODP6ta3x?=
 =?us-ascii?Q?g2MnyDy3eBrCDm1dzNPNlp+Rh7Z22QpUXhFyV+iZzZtsER/A/cdjb/zx/G/F?=
 =?us-ascii?Q?hiSJIWzcHTYSiMv2oyZ1xWTtALln2tz6BwvuKxFy74kaI25DShSh8ozlPGyH?=
 =?us-ascii?Q?yM98wyKjHm5HH2Hz/YULbrFWvPXyRCbYCpGjIh55Ssn3TvAPD6LdjikfvbaE?=
 =?us-ascii?Q?gUQ04F3GE3en1lvZkMtA/Fc5NlO7u14QgIWChgU17UTtpollVEgscV5So0hv?=
 =?us-ascii?Q?Ty3aMTjhrdUBtiRg7/NKND9YsWk/WWnEEVB4MC7/Gn7XynbHXssgd5gWvKiu?=
 =?us-ascii?Q?OOcyEqF5F4SaBdrXX7LLMqZYsQuQoV1Fe3ETlXiT+ahh0KXw8j0koADR5J88?=
 =?us-ascii?Q?OWAvfHlb19EQbWFqkN/gtRIkPX9jSOj1zad61E46amcWE/rU0jYe1w9ncSfI?=
 =?us-ascii?Q?RXkomh7o3v5LhypSSxh7NhKuhhnIgEWXUSCQpkxQq2mypn1BI8DIrbT5be6x?=
 =?us-ascii?Q?ppoELDwH+zD9CaV42HEgXtEVe+kljExpUMJJ1I1zabZE+5ahyW+SvdJyiJY2?=
 =?us-ascii?Q?/lhZRN8KB4W6rIHavw6qroe5Y6FwccqEoTlAtSy9R9qUsL7f4HMLTrmG+7Eq?=
 =?us-ascii?Q?KWDPDcXpNtDpeW5xCjSSa6AiF19Iq82jGHWP992USXGFIHv3GPONlSiTRlDI?=
 =?us-ascii?Q?T5xIW1ZmY74c7u77Dl65P4kSuE21p664rwsw68u1fjFR+UOjOXEgfmpukg+V?=
 =?us-ascii?Q?ItpBU7yZEMJRKUN4SsG3G3NrpraUp4LKuMjD2MtTRtEQN01Ub0vmp2IG25YV?=
 =?us-ascii?Q?q4Ar6xDHIvCwGGAlBBrYganfBTKxYVUEut3R7+UztbSvYSaqccpGJYe7hL68?=
 =?us-ascii?Q?oCec2vT2+zsMXAxLRe6x8uLtFtBfNSqvsMxueJyI21xLrFXJ0bDi+q9jKF6N?=
 =?us-ascii?Q?uHk4iwyDtZquS1IxRz0Jnn38t2VDO0smLXtQAJsPfuQOHwsmLXFTiAGta1z6?=
 =?us-ascii?Q?aOxiVLq+ZxLlacoMSQ0PxdglmBg9UqZQWrve?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 06:31:13.4331
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d2feeed-8a0a-4418-386c-08dd861e45d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7035

- regmap subsystem provides multiple benefits over direct smbus APIs
- subsystem adds another abstraction layer on top of struct i2c_client to
  make it easy to read or write registers.
- The subsystem can be helpful in following cases
  - Different types of bus (i2c/i3c), we have plans to support i3c.
  - Different Register address size (1byte/2byte)

Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
---
Changes since v4:
- Previously patch 2
Changes since v1:
- Previously patch 3
- Remove "__packed" from data structure

 drivers/misc/amd-sbi/rmi-core.c | 29 ++++++++++++-----------------
 drivers/misc/amd-sbi/rmi-core.h |  3 ++-
 drivers/misc/amd-sbi/rmi-i2c.c  | 25 ++++++++++++++++---------
 3 files changed, 30 insertions(+), 27 deletions(-)

diff --git a/drivers/misc/amd-sbi/rmi-core.c b/drivers/misc/amd-sbi/rmi-core.c
index 74456756270c..663ab9176d95 100644
--- a/drivers/misc/amd-sbi/rmi-core.c
+++ b/drivers/misc/amd-sbi/rmi-core.c
@@ -9,6 +9,7 @@
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/mutex.h>
+#include <linux/regmap.h>
 #include "rmi-core.h"
 
 /* Mask for Status Register bit[1] */
@@ -21,6 +22,7 @@
 int rmi_mailbox_xfer(struct sbrmi_data *data,
 		     struct sbrmi_mailbox_msg *msg)
 {
+	unsigned int bytes;
 	int i, ret, retry = 10;
 	int sw_status;
 	u8 byte;
@@ -28,14 +30,12 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 	mutex_lock(&data->lock);
 
 	/* Indicate firmware a command is to be serviced */
-	ret = i2c_smbus_write_byte_data(data->client,
-					SBRMI_INBNDMSG7, START_CMD);
+	ret = regmap_write(data->regmap, SBRMI_INBNDMSG7, START_CMD);
 	if (ret < 0)
 		goto exit_unlock;
 
 	/* Write the command to SBRMI::InBndMsg_inst0 */
-	ret = i2c_smbus_write_byte_data(data->client,
-					SBRMI_INBNDMSG0, msg->cmd);
+	ret = regmap_write(data->regmap, SBRMI_INBNDMSG0, msg->cmd);
 	if (ret < 0)
 		goto exit_unlock;
 
@@ -46,8 +46,7 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 	 */
 	for (i = 0; i < 4; i++) {
 		byte = (msg->data_in >> i * 8) & 0xff;
-		ret = i2c_smbus_write_byte_data(data->client,
-						SBRMI_INBNDMSG1 + i, byte);
+		ret = regmap_write(data->regmap, SBRMI_INBNDMSG1 + i, byte);
 		if (ret < 0)
 			goto exit_unlock;
 	}
@@ -56,8 +55,7 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 	 * Write 0x01 to SBRMI::SoftwareInterrupt to notify firmware to
 	 * perform the requested read or write command
 	 */
-	ret = i2c_smbus_write_byte_data(data->client,
-					SBRMI_SW_INTERRUPT, TRIGGER_MAILBOX);
+	ret = regmap_write(data->regmap, SBRMI_SW_INTERRUPT, TRIGGER_MAILBOX);
 	if (ret < 0)
 		goto exit_unlock;
 
@@ -67,8 +65,7 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 	 * of the requested command
 	 */
 	do {
-		sw_status = i2c_smbus_read_byte_data(data->client,
-						     SBRMI_STATUS);
+		ret = regmap_read(data->regmap, SBRMI_STATUS, &sw_status);
 		if (sw_status < 0) {
 			ret = sw_status;
 			goto exit_unlock;
@@ -79,8 +76,6 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 	} while (retry--);
 
 	if (retry < 0) {
-		dev_err(&data->client->dev,
-			"Firmware fail to indicate command completion\n");
 		ret = -EIO;
 		goto exit_unlock;
 	}
@@ -92,11 +87,11 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 	 */
 	if (msg->read) {
 		for (i = 0; i < 4; i++) {
-			ret = i2c_smbus_read_byte_data(data->client,
-						       SBRMI_OUTBNDMSG1 + i);
+			ret = regmap_read(data->regmap,
+					  SBRMI_OUTBNDMSG1 + i, &bytes);
 			if (ret < 0)
 				goto exit_unlock;
-			msg->data_out |= ret << i * 8;
+			msg->data_out |= bytes << i * 8;
 		}
 	}
 
@@ -104,8 +99,8 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 	 * BMC must write 1'b1 to SBRMI::Status[SwAlertSts] to clear the
 	 * ALERT to initiator
 	 */
-	ret = i2c_smbus_write_byte_data(data->client, SBRMI_STATUS,
-					sw_status | SW_ALERT_MASK);
+	ret = regmap_write(data->regmap, SBRMI_STATUS,
+			   sw_status | SW_ALERT_MASK);
 
 exit_unlock:
 	mutex_unlock(&data->lock);
diff --git a/drivers/misc/amd-sbi/rmi-core.h b/drivers/misc/amd-sbi/rmi-core.h
index 977ee05af6a6..3a6028306d10 100644
--- a/drivers/misc/amd-sbi/rmi-core.h
+++ b/drivers/misc/amd-sbi/rmi-core.h
@@ -9,6 +9,7 @@
 #include <linux/mutex.h>
 #include <linux/i2c.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 
 /* SB-RMI registers */
 enum sbrmi_reg {
@@ -47,7 +48,7 @@ enum sbrmi_msg_id {
 
 /* Each client has this additional data */
 struct sbrmi_data {
-	struct i2c_client *client;
+	struct regmap *regmap;
 	struct mutex lock;
 	u32 pwr_limit_max;
 };
diff --git a/drivers/misc/amd-sbi/rmi-i2c.c b/drivers/misc/amd-sbi/rmi-i2c.c
index 9ad4c8093399..7a9801273a4c 100644
--- a/drivers/misc/amd-sbi/rmi-i2c.c
+++ b/drivers/misc/amd-sbi/rmi-i2c.c
@@ -13,24 +13,24 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/regmap.h>
 #include "rmi-core.h"
 
-static int sbrmi_enable_alert(struct i2c_client *client)
+static int sbrmi_enable_alert(struct sbrmi_data *data)
 {
-	int ctrl;
+	int ctrl, ret;
 
 	/*
 	 * Enable the SB-RMI Software alert status
 	 * by writing 0 to bit 4 of Control register(0x1)
 	 */
-	ctrl = i2c_smbus_read_byte_data(client, SBRMI_CTRL);
-	if (ctrl < 0)
-		return ctrl;
+	ret = regmap_read(data->regmap, SBRMI_CTRL, &ctrl);
+	if (ret < 0)
+		return ret;
 
 	if (ctrl & 0x10) {
 		ctrl &= ~0x10;
-		return i2c_smbus_write_byte_data(client,
-						 SBRMI_CTRL, ctrl);
+		return regmap_write(data->regmap, SBRMI_CTRL, ctrl);
 	}
 
 	return 0;
@@ -55,17 +55,24 @@ static int sbrmi_i2c_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct sbrmi_data *data;
+	struct regmap_config sbrmi_i2c_regmap_config = {
+		.reg_bits = 8,
+		.val_bits = 8,
+	};
 	int ret;
 
 	data = devm_kzalloc(dev, sizeof(struct sbrmi_data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-	data->client = client;
 	mutex_init(&data->lock);
 
+	data->regmap = devm_regmap_init_i2c(client, &sbrmi_i2c_regmap_config);
+	if (IS_ERR(data->regmap))
+		return PTR_ERR(data->regmap);
+
 	/* Enable alert for SB-RMI sequence */
-	ret = sbrmi_enable_alert(client);
+	ret = sbrmi_enable_alert(data);
 	if (ret < 0)
 		return ret;
 
-- 
2.25.1

