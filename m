Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2071.outbound.protection.outlook.com [40.107.92.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F30D1A317D;
	Fri, 11 Apr 2025 13:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744378324; cv=fail; b=ES7n+jhidFDkCaemXRo3HFTg6UoXDe7ErX2qFtEAv0H9rf7cxtQvqz0CdgFCRCsOlh1fNHPSYzTAgBArtYjwCQ25W2otR7Gozgksmu4tM+ptl9OxkglZQVlqD+FpAJCaxvDX/R+XnTE2B7Yo0VBn07Zryo2t7ePbP/G4j2DG2ak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744378324; c=relaxed/simple;
	bh=/hylpCazgtSHgUqctuy5zSLTFlF61o/rcxgXvvSFUQc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dwZm+9woQnWq2z3+Sm9BfOqDGCNBi3O9Jfsog8rF8Ip4DbWqqwUNAh3EMXpoVXdiwvHsHTZyQBA9QRHTdMDcRPf11QNfUpB7yHprKfxxQetNbolDBLHEMwAIsrq9iHixLj0/fU4tB+awkS0FfZ63rvnDBVVubzJYdklT5Z2ay98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1KRb5seV; arc=fail smtp.client-ip=40.107.92.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1KRb5seV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QdwH43jcEwF5kjVk4CwlPnxvGPvZ4J1O0sULRz6MBczunB+v5VIsk455mSy5+OHSVaz7FYaA8kx4doPxM2ZJsiXoFoY0K617tsLd6nD4tJICXE43aqqVWWIMlAPfQzrsUbf4NP3j5dSmsLdOcCV5XMCWShm3Onv536kSn7Fk+bEmHbnT1BZ2b3kcQM+5URD89tg7y05in57nXP+ex6lMOC4zdokX3jGxuRyGTOTgMrT0sZlyLCm+oIO+Q0nklsgwVwRphdyvQUtgiNXCNoR4sp/NG78XFFa2eWnLGC5FEYxxOUQVANbOL+TNV7KWXWgGFVla+f6OZbXnc2S8VZ5tLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TG/hsuXoeICZfIxIRNFbNIU6w59mt9fCZldXT79Y9Rs=;
 b=fFgXsdaLSsIFFiBVfN6lfDxfLGc+TISd8lTs4/tnkTjSSZ1zctDcvYWxTgQesGfro7VmUEbF338X1XAS/jEJOIGR+7ZxXeYVXyk3hZa1mDhugrtHm5ExGm+LI7KJzDT1XB1E4rZH6x3Ebk2hmcXw/DEdy5Pa5jj8JmX1TfRiahxAL7Z4scSa9RkpUM44syjyLD+6FlZi+2+EZ8c8ka1JsbRYrrMI0LdvsV+9vM9gRLPcmnIHFBFrqbh83ozWoUkef1yY5l5GS91wGxigs68098O+Gq1KZvqkJBNP/GdYxvbmPAPSl57TdXS97nLg9oFzU6iF7dYQOYEWqewSWpFpYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TG/hsuXoeICZfIxIRNFbNIU6w59mt9fCZldXT79Y9Rs=;
 b=1KRb5seVm5tcLKrAn+vL1/YWLeJKzxACxVsOae34I61UpEi00XGM385eA3sKWJ+LAweh1wZzeuOaEI1G0FKuwJWSktWiumYbl7jSeG1koe4pWmPlxVndUf5PYhmapxE09h5OpcimlNvT+aRu3ZVyDsvfVoxNiLzGiIoYhyrMAl0=
Received: from MW4PR04CA0288.namprd04.prod.outlook.com (2603:10b6:303:89::23)
 by PH7PR12MB6719.namprd12.prod.outlook.com (2603:10b6:510:1b2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.28; Fri, 11 Apr
 2025 13:31:56 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:303:89:cafe::20) by MW4PR04CA0288.outlook.office365.com
 (2603:10b6:303:89::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Fri,
 11 Apr 2025 13:31:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 11 Apr 2025 13:31:56 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Apr
 2025 08:31:52 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<shyam-sundar.s-k@amd.com>, <gautham.shenoy@amd.com>,
	<mario.limonciello@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<anand.umarji@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v8 04/10] misc: amd-sbi: Use regmap subsystem
Date: Fri, 11 Apr 2025 13:31:16 +0000
Message-ID: <20250411133122.1806991-5-akshay.gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|PH7PR12MB6719:EE_
X-MS-Office365-Filtering-Correlation-Id: b622e90b-679f-48ac-b2ac-08dd78fd3ae7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LALipPOpMYs4aPP8oIxBaFwxSo4SZYL24VPLZgv3y0WxOVBtbSgRDY7+XcQO?=
 =?us-ascii?Q?nfhCV5PQlzWIAGc+NZm+LsPNsAvWCS86G3UGUZqrTTsLMdG7dNT5GxYjFMRp?=
 =?us-ascii?Q?oTzxevwGTPdFsy1vFukQbkyPFQG8MiCPTs8+WaK7/cPyPdR4BhJTOaPDVq0X?=
 =?us-ascii?Q?M6//NyQtLvf9Phyum3RjR8cahi8I0VUQfuGhPhe/auMSlpMEWqnx+NEEb4Es?=
 =?us-ascii?Q?0lp/nyGQNZV0MCE1+bguQSjYUEYamGkGNhLJ4C5BavVqEm8AMrgL0c9X8KXQ?=
 =?us-ascii?Q?CMFcUTFiHlYTwRH7T5IpzDoO3j1KQjqczmisCkokJ2RmqpX7FvDbehWZJQ6M?=
 =?us-ascii?Q?hHw4hSmpsGOrbS+Wq97UZDx6hXee2DSwhM5nu8tqkK9GFQUMV/IflERk+L41?=
 =?us-ascii?Q?LEHurIgRkB33DZO4r4SbYoB3mPCy7aryZYzVikM9sRa7x7UWr20/NM4BJW98?=
 =?us-ascii?Q?DGtFEjMrsMtzsCltNxP5UwXIBF3I4lTBe/FhTs23pVV1f5dyp7VVrGfNvSA3?=
 =?us-ascii?Q?4/65SVXdsqqbL2EbZB/Xz0OZuCaNfqkJeAlZsAF9zY281pojn5rZqY6bXq7r?=
 =?us-ascii?Q?GYVQfBHnkyc2nnJqnRFOtA7wX+8rOQSGUF86HkH67edeJxWEnxRn0z5oQmws?=
 =?us-ascii?Q?8PjxiHE5WkChdls9N9ICck290Yg1zMT0oNcMfNimeedEBEKQxBv98aC3C5XU?=
 =?us-ascii?Q?TxgDviG5S7y5E+R4H2BsurAt8insPIcFIhe5ZKW3UZ5kbEL5volXqVUGW5XB?=
 =?us-ascii?Q?xRTNPC5J0aHTRbWiCZWVCbvDvPL9JEXC7cyssVswAIHaf4FfiLxDo0Y30LHh?=
 =?us-ascii?Q?ad33ILeP+Alz5wST58MmeG16oBQMxv9s/cVl9nDdrQ7LkjrSxkxw3aarN4ZP?=
 =?us-ascii?Q?N/1juA9+0ffw+2MtYYu3ZHV2x+REpbmWCFYMzvYur/QCZGFs09qKS2gdmMjr?=
 =?us-ascii?Q?fOP7CHPTPc8/dgw3TQjmSKwEb1HwZZuVYmx7HgeHQDFQQOFZYAs+ZJPriLjw?=
 =?us-ascii?Q?YohUl6zyjmB/h7hIogYjz+IMDTPBaQa41PKEB1IWq7f2dxKqt5ghbRV/wpSe?=
 =?us-ascii?Q?NIAHsSgZGKyRBZtuCvFTSIRx/dCwxk8EsPtczTHZdKx5JQJToUB6aEiPQ6k8?=
 =?us-ascii?Q?E4aRQFDtgrr+wyZAth4DurUbf5Heo4nxp/VVrFv2WxIdv3Mo8Qzi3Po7yVGW?=
 =?us-ascii?Q?wGNbkgo/dDidCrkBRfkn08xjCTwNJH98GFYRmMMQ2uu77qtz3eIOSumy7oOf?=
 =?us-ascii?Q?DWPeylk6NJTUbQAJBDz0qlJhyeAAeCn62C8tx1XKyxCoprp228ZVdstcZl0p?=
 =?us-ascii?Q?6/P+kfysIMUQbz+jldMnn1+lWlzO9vT0LOSmk5lY9aI3Lfi/TGjny4OXBa//?=
 =?us-ascii?Q?JyGlX2IxZWVYF7CQXFUhgYxxf4VjlqTjUVFFIfM409QNNIr5BfIUoRB4lSEs?=
 =?us-ascii?Q?/TSkk8CCuVGn+VVswXcWQqz022xaSqmjcXk+Iv3FsrnRLObV/NuMooMG8g1C?=
 =?us-ascii?Q?u4MOxli6iLf0tSVF9traehW7GG73dDQNQdvc?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 13:31:56.5394
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b622e90b-679f-48ac-b2ac-08dd78fd3ae7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6719

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

