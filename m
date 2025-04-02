Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01753230D3D;
	Wed,  2 Apr 2025 05:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743573564; cv=fail; b=OgKfpVNpiZ6Cq/ZByukprF2kXSl+aljdDz2B1frI9d+1J1QTr79q2pPC4o60xqojoIAamwzxG8iwUK1xwu6i+LXZCIrU6tUKw9jKOXPqEiidCM5bvMjr7MBCVzPTtgrw7P2SKUBGv7wYipItoFz+hkrLOcqojIkaTnXyOUBqOy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743573564; c=relaxed/simple;
	bh=fh+uhEeUGrjJhdvGkAo65eRfKeCy3t5xL7Tvx1TUDk0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ehYQkG6LJPCPrO7OoGABxe4+CNJ2yqNffZWoVjfX08wZuAeODnRygBPprmcK6tom7Hz5gZ+1x5c2xzBGjX9uCiTcBzNZhkR4Hs1vJ0dB7BSrmWnocmGfxYNxYUlaP7RHwR9Z8lqtnEyEJ81CxyDfFHZgKUjfe/XjOPHKJkND0OQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Rtc0LkMW; arc=fail smtp.client-ip=40.107.93.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Rtc0LkMW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GPLbBFcvZWqBbI7KXx85agTkSyy+9Gm+Es7RhV1AhLyjJMtXVUW7bfathjzFSYm2Kw4qgqRji3Q51SHjcODsLVtTK3xdI9lkP2t04BJy3JIrehnNm2T/etxt5+1yzvjtBVrOlSUhGBCoGGjPQ8pD0Dd33HyNDf7fPtxichQnBHD7PCo7c/u7HW9oQuO9M0rqQ/HiX/6/KyHtXQDGqgCW4vqTI8NahpGTfpR7QRU189KqQ/vKgAKb/lYBFbECfGgR3+tZwd+Pl+yJWrnDVFf718ApPknOK+Ni5vcOLqaEPQ2p629jjXddeXCESAa03BUqSBz5bB8wedpbY9q2/dUNzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fWpAIKJib9evUvF3ZT1qq4ZIooQ7/lcpgzwS9JjO6ec=;
 b=YM7cQ46J895NRsJ0MgkNVszSqnqhPAoAJh5WtqoQf2K8k1V3a6zJnnQlEV2QygnrLpEB/GcJS2UnNcBl3yukGNGcGwX+u35fRn/Z9pN+84x9yfn4Y2PRLSHryn9OMWZaEHpG3Sy/qaanRLKsY7rRJ3XH48d1hps03aiIuO3xuypG65GK+5S95Oe1Tk5EHOvbpqGEVV5IGm2CW5i/ysPz+wwfJUew88l6G1pfzl5ChcwxaB1AGbpujz8aNmWts1gQYACqeQmQbZAJcl0DMf4lbVwQ7e8cv7SealjhfTsxu56mh/kN4VBDNIusW3De9jRE1upwmLfVnyMv6kSQLE06uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWpAIKJib9evUvF3ZT1qq4ZIooQ7/lcpgzwS9JjO6ec=;
 b=Rtc0LkMWPGzLWuAr1BpZo43FpGAzSLOvzvDCkpiIV6JxsRueWn4ZwNZfm/fc7OIH3G8A43+ePpu5VAHN+7JF2eWNrQABmNFOks7OExPXd6WHObJY1wMf8njMxd/+3d/tt+JsOxzL5KZ45Rcd64K5GQkeWhLpwwRP0tzAIym3w1w=
Received: from SJ0PR03CA0269.namprd03.prod.outlook.com (2603:10b6:a03:3a0::34)
 by DM6PR12MB4404.namprd12.prod.outlook.com (2603:10b6:5:2a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Wed, 2 Apr
 2025 05:59:18 +0000
Received: from MWH0EPF000971E9.namprd02.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::12) by SJ0PR03CA0269.outlook.office365.com
 (2603:10b6:a03:3a0::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.41 via Frontend Transport; Wed,
 2 Apr 2025 05:59:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E9.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 2 Apr 2025 05:59:17 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Apr
 2025 00:59:13 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<shyam-sundar.s-k@amd.com>, <gautham.shenoy@amd.com>,
	<mario.limonciello@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<anand.umarji@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v7 04/10] misc: amd-sbi: Use regmap subsystem
Date: Wed, 2 Apr 2025 05:58:34 +0000
Message-ID: <20250402055840.1346384-5-akshay.gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E9:EE_|DM6PR12MB4404:EE_
X-MS-Office365-Filtering-Correlation-Id: b00c2434-946d-489a-edbe-08dd71ab812a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?El6fMgxw2ACBwr1iXMFpo5F+ODV4Zs+hM0z9nneqBqcJjrwAkJ3aWBr1/ae8?=
 =?us-ascii?Q?/1CLZGQ5NMFDdoV3fJnPPZ7xkts/6PMKG2UW6/dNQLZI69Yt/2GsrhVDMnuk?=
 =?us-ascii?Q?fAbC5oHFd97bgJtGSRrJ4FpMQomr3z34LKqNOwHM4AVzMD3xdXgMjxpSHJxr?=
 =?us-ascii?Q?3K0kkeAf8ZUjHmVtGzObraq/kb7dVrJ4SXQKn+o1OSrp0lZPU8suLVfYJXs8?=
 =?us-ascii?Q?SzY28u5xITja7kCp4EZF8DnlenrmmYPozHqRr4L7jbPD+T+oFfc/rRI4gFFr?=
 =?us-ascii?Q?QZrWQTwipdN2Yqq88t3wrSuxbb0GWpB87G6L0++eH6YuFOm83uKMVC7OilFG?=
 =?us-ascii?Q?zeGGlaWeYw8XL1DAXywzEh7s1giXZ3D6d5Qoj0OaE7LLmph6wAoptkfs3fzO?=
 =?us-ascii?Q?RzohJ46pRAYJpzmF42OZKp6Frzsj7tvvtpeS4vkhFbRdpD3jpAy35cW5aSeo?=
 =?us-ascii?Q?iQ6Nj4FoTm4FETVhAQePBtvKg0gX1PJK632xfcSCHi/hW2XmmIUftMM2dEgf?=
 =?us-ascii?Q?/eM6bTunlDkCpd5n/neLMZEAgCqENT2f0zkr8g+eonYpX7KFRNe3+TQiGZUX?=
 =?us-ascii?Q?CkkDc8lNwUFVx5Q7eSvNVmXblttcsW5mb3cQ77UCdd/mw/d7ALlM1muGak4Z?=
 =?us-ascii?Q?WE1eTv5m9/9amXWjoi4UWbk6ErHAqtS17P4AZnnHAi73vStZpACtD0Cmy5H6?=
 =?us-ascii?Q?iJ4PJWCDv7eUcvQpdK8vcNuHYmznKX/PLAW+++7BSQIG9yWyNVLLIRy/o9Z4?=
 =?us-ascii?Q?5M4IRSc6ChGk3rcoR9wOLjZpOdO2beAcVEqkuhQwLNBZ9n86bbmW+4OXQEdB?=
 =?us-ascii?Q?QQgOsKjYuKTEii4kTC25T17sgRlALaPbKoxStY0v7jnjr4mQo9q+V44HQTFL?=
 =?us-ascii?Q?g25Nh/IpHNqbk6ytJii1FGaTII5Zg6br2tPMpBz9WVAuKns8dJjD7q1mLCOg?=
 =?us-ascii?Q?RI/onVmqbzivvcI4zrR1zmluEA7ilUy68+3+uXnD4TzDTxTeBy2jerk+Bjjq?=
 =?us-ascii?Q?mUeN+K5uKTd6lAD7DsY58zPIgb9TWCVG/LgqKdDCPrkFr4/sFtJ0xw5UVFxF?=
 =?us-ascii?Q?q5rALbnIC6cuerOEZizIcyjM3WbH52ggJyOw6cascLfXJVd1Boiy4w4lXneM?=
 =?us-ascii?Q?l4fVjGGY8nTNW2vfIX7jkjdNZk+qeFiGhJcWXeJg94N7ktlMrLid2KVMmady?=
 =?us-ascii?Q?bMK8D73pT4ReYndnsKWEiDtr6Pd2PJI6A1+O5pYHYSAyJJXugsv6Qi6uW4xS?=
 =?us-ascii?Q?SXlFmffyofWXWvBRzW4E//TOaPkXKcHlCSv1y9h+vnw8h6Fa1d0whf61pCfk?=
 =?us-ascii?Q?jSQSVnJk45XVN+3YE18zt5AQhdfDnN02FUbDnAYhWT7fRPvXkgfWThtPbA63?=
 =?us-ascii?Q?hKCX2Y9WYyZF7aWUpz8+cVF3/jxH7707QWBNNu+cMm013LGWEuNZdtGgEuOb?=
 =?us-ascii?Q?hXMCWJgH25hM1A/Fil99M6iy4oiDPTYtkuN3z7+DoubjYkTkBHTLL9jqQb6D?=
 =?us-ascii?Q?X0eTWXC9iRCU+SQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 05:59:17.5492
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b00c2434-946d-489a-edbe-08dd71ab812a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4404

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
index 27165d3bb20f..bbb6bb1cefde 100644
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

