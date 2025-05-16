Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2083.outbound.protection.outlook.com [40.107.94.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB4823F292;
	Fri, 16 May 2025 12:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747398780; cv=fail; b=YMm/4rZY74BUGzazW88TsjODvnbHOFsXOjaszrNK/zXd4r9kCCz875bcM56XcY5CMPORLeEsVedae/b1sLxLMpnnrd1MUed3OMSn4F215730WQ8E5qlSZoWYXeZt8KDU8u6wVH0S/Pri5KfrhyXeR8Mclp8JEmaVsC1aP+Zvi08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747398780; c=relaxed/simple;
	bh=/iNmvIuX0wxGBSXOXC7psAFjgLOJcQG41tlGveXSpZ0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=u0zhysur1qI7v4pMKTH7U5KT1UEYMVDEmv71vlEHDuPffqpya7TkOHH82MmkRyrHBLnswqMTG8Y+84fIEeby+zNcgQuFznaumDgEHDKgQ/p5NAmg7hDiMpwSCQ7QyAuBfIrOEiP5pdWg8CwFfQA6Spjpj2myHXwpX0uwD823P1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0/koJG1Z; arc=fail smtp.client-ip=40.107.94.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0/koJG1Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HeQkHp04nsJdYZSPGWI47G0C5Hly87JNlVVRwXnsWRsqJlC9mlEIb98naBd4hNPR0a3CgYGIyiuOt5fqsuAlyd09D1HnTuh1p3Al9o0NQPvizlhcMHxfrtv2xdMgaBPjvO104vA1b3dqXI5+uKz+NGcSYeVe5Az54eeb6DTVLu6vPWSPrtPe+fbfaYZIwRGqpjgUFWF0hudW2YJbOyJrzbz92jqfJLdTL1kmGZL+8+rUWgLVmA97JXNKWfqLFaCjrOuVe7Qs1wyEerCef/YjO8NEcjD+1PpLy5+2k6u+s+/pUtDrdJEC0MAL2jWhMTUlaB/hhOZqW0M7CA09NZbwAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=voBPBy0H1GGNZOHIF7TJgPhvw4mJpSJ++IFOI1LFqfs=;
 b=r58EXMCC5fEprAFJvjhrsi9CLfYw4iWdGsFby/YOInC5bY0Cbdp/vuI3t6UnLIgNnK8JECsP5mwxiWltvDLr8W9yYldkBbPlvP9gj3YE/eBRX5d0uQw/if2aMnFCr72+0ebjmuUrQOXLKLw2USKiaXnRUrG/6UlebrL1QZlqJfyfC8utM36PJEqqQ4hXxVsaUhJ2XSPTFgAr5warO+jXR9FogGOYxDlv1E3V0Bfjf8ya0m7Gd36nG6pp03CmecuVF2rk+Ih58xaS2/t1eYUZX8+BfkZBliS4Db3kYta1exNMzxYHq8C/ySzDAT074Fe9XlB4Ju45JYIHxccmNPXb2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=chromium.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=voBPBy0H1GGNZOHIF7TJgPhvw4mJpSJ++IFOI1LFqfs=;
 b=0/koJG1ZQZr3BpTchUr4s1OUVd4OhvnciZG/Yanczh49eqOSdKmIqlTvQd5oNXXQkSpZRqfaZFyayYdZxUgoHVFhftWMyEsnUXgo0lcD/YJIV4MJfL0zAz5MzmVbYvTsjdfMXEy8RFlGutjxWLa5eh9ZoVnH0blpW9fGkrcEMo0=
Received: from BL1P223CA0030.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::35)
 by SA0PR12MB4399.namprd12.prod.outlook.com (2603:10b6:806:98::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Fri, 16 May
 2025 12:32:55 +0000
Received: from BN3PEPF0000B372.namprd21.prod.outlook.com
 (2603:10b6:208:2c4:cafe::56) by BL1P223CA0030.outlook.office365.com
 (2603:10b6:208:2c4::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.33 via Frontend Transport; Fri,
 16 May 2025 12:32:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B372.mail.protection.outlook.com (10.167.243.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.1 via Frontend Transport; Fri, 16 May 2025 12:32:55 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 16 May
 2025 07:32:54 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 16 May
 2025 07:32:53 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 16 May 2025 07:32:51 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <mka@chromium.org>, <gregkh@linuxfoundation.org>,
	<radhey.shyam.pandey@amd.com>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, Jonathan Stroud <jonathan.stroud@amd.com>
Subject: [PATCH] usb: misc: onboard_usb_dev: Fix usb5744 initialization sequence
Date: Fri, 16 May 2025 18:02:40 +0530
Message-ID: <1747398760-284021-1-git-send-email-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.1.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B372:EE_|SA0PR12MB4399:EE_
X-MS-Office365-Filtering-Correlation-Id: 160bbb69-1732-4c62-36b8-08dd9475c88a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Axq7Dainf1h0v98kK7BYEZZc0ih5OYE0kIzd1z0MEMss+Wo94sCuTaK0Gb6b?=
 =?us-ascii?Q?KaATvOcnYevIX8LR/RPf8FM4SXghfG/FYKx3IslxaXycnufNaoQ6iLWbDRTX?=
 =?us-ascii?Q?3E1pVv6QzrwTqCCYoLw0wNf4DkozIJq8uRi/hPlHfi8EvOpbKn39Z2LRv9PO?=
 =?us-ascii?Q?e5z+8GUwXdQKyWoYYcobvHoTUpL+1a3Jmhyqi0PjQW5TreM+Hvi2e3KbUW+r?=
 =?us-ascii?Q?KLEj9angr1SMnWPl41A4jNuIqxf98wEmjqLwmWM8BRXDQ94P66pnPJYLb2dx?=
 =?us-ascii?Q?2ggr0Jkl+6gEZ5UBPXAocY/7GPxwfziDbAShRLKKgwWIO7O/Kk2IUuCOBw9I?=
 =?us-ascii?Q?X1HB2COHd+wzyrwyHwh+WF7zz4zarkRoSvztXh1mX2o3pFq8lFIJ25TD/X9c?=
 =?us-ascii?Q?eiFAQdZjgE7sLZJHowR19pzBzC0V50savcvnVWImnhuuj63Uv105wsMIxr6U?=
 =?us-ascii?Q?HQGaPEbvLO5nbM9DY//j+ofSB6LtV2BfGsCyM2NuYZA+Tg9Yt2FVoaap90jv?=
 =?us-ascii?Q?P5ftUxqMjK44tJnJzdAfWqxUwS7WhSXFuUIsLKo4dsZ+bU5sgbuYbwj99AGY?=
 =?us-ascii?Q?MnBAUBRvrg7YqTOTlCGpaCg5lEFsmKUsk3/pBz/G9tLgjdzvkYoaa4G9YVGk?=
 =?us-ascii?Q?KR8ib2WVQPMP9YYGHLDPy+JFo8uAV0VLOArLXVQAmdss7ymFqxJOha7HtsOh?=
 =?us-ascii?Q?85nVO5Nsz1aBDA3ZQ4cwL7VSb5+IoGduCfHkfTbvv6r7r1uXrDdyBwa8eVZ5?=
 =?us-ascii?Q?xFIOo9Ib2N6snundudZvm9OD88Q9xCy1bCnuf96lSWrViD7OEaT5g4w+oxIO?=
 =?us-ascii?Q?hyGFHJaR1uN65Q0AzMrvNkhzkIP5fUIwRNtzve073MdOZ5QoBQHcfWpmTv4A?=
 =?us-ascii?Q?DWpPKsydtMWpqjZt1R6rUqAdrLeYLvs1l7hXNBZHM+J36Cqdbtt9iCIYlLQg?=
 =?us-ascii?Q?IfAasAcDEobBZTsczDLLZi4TLmECH+yzQRJ4wFCb7HuKmCQAu/+rJqyK/Eup?=
 =?us-ascii?Q?54A5959NdVL0gfI9uyv0aIyT5Z0C6d8u0U6xCPi7QnmihsFRxe6eJHPI1Nox?=
 =?us-ascii?Q?d/rhuZ1o2zCULZg4zOamyvcns5foeY+vtkuc4syr3XdLrWj4UDkaGhta1umy?=
 =?us-ascii?Q?MBAHN7wsb3Mhf25BaHGa9ussK5Cy9BY/E5yqD8iEOxiUpNRWzxIcSA4OdTu+?=
 =?us-ascii?Q?6hI94i/DCi299BTFDXOG/nOorkABIMd9DQh++lE7P+aGuHGTaehrY9Mqxq8J?=
 =?us-ascii?Q?nOIlvhd5FfT1ozM4H574sIF339iNPwFFbxLO6rHLJSuXBkLlqXrFv+TLIe8f?=
 =?us-ascii?Q?P7F4S0+GCl21U1IWsNRefH9CjnL8CWbO4XAjx/9b9zM7d0LIzr666kpaA/o9?=
 =?us-ascii?Q?zg0m9V4/Wtfdbu4bugbnxx1M7Uav4KbV6DkkbGM3pWuTtrD5GYI9eQ7n9PKh?=
 =?us-ascii?Q?FJ7qVrs+mPbu8U/PbSFfDg5iCsnk2Ie3nz7bCUR5WlX/z89GDRaZKz3ZRIOY?=
 =?us-ascii?Q?Ixm6n3Tm9g0qLx+VpGbf2TRXAN4kz63iA/VK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 12:32:55.2578
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 160bbb69-1732-4c62-36b8-08dd9475c88a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B372.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4399

From: Jonathan Stroud <jonathan.stroud@amd.com>

Introduce i2c APIs to read/write for proper configuration register
programming. It ensures that read-modify-write sequence is performed
and reserved bit in Runtime Flags 2 register are not touched.

Also legacy smbus block write inserted an extra count value into the
i2c data stream which breaks the register write on the usb5744.

Switching to new read/write i2c APIs fixes both issues.

Fixes: 6782311d04df ("usb: misc: onboard_usb_dev: add Microchip usb5744 SMBus programming support")
Signed-off-by: Jonathan Stroud <jonathan.stroud@amd.com>
Co-developed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
 drivers/usb/misc/onboard_usb_dev.c | 100 +++++++++++++++++++++++++----
 1 file changed, 87 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index 15fa90f47c70..320278a0ac39 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -36,9 +36,10 @@
 #define USB5744_CMD_CREG_ACCESS			0x99
 #define USB5744_CMD_CREG_ACCESS_LSB		0x37
 #define USB5744_CREG_MEM_ADDR			0x00
+#define USB5744_CREG_MEM_RD_ADDR		0x04
 #define USB5744_CREG_WRITE			0x00
-#define USB5744_CREG_RUNTIMEFLAGS2		0x41
-#define USB5744_CREG_RUNTIMEFLAGS2_LSB		0x1D
+#define USB5744_CREG_READ			0x01
+#define USB5744_CREG_RUNTIMEFLAGS2		0x411D
 #define USB5744_CREG_BYPASS_UDC_SUSPEND		BIT(3)
 
 static void onboard_dev_attach_usb_driver(struct work_struct *work);
@@ -309,11 +310,88 @@ static void onboard_dev_attach_usb_driver(struct work_struct *work)
 		pr_err("Failed to attach USB driver: %pe\n", ERR_PTR(err));
 }
 
+static int onboard_dev_5744_i2c_read_byte(struct i2c_client *client, u16 addr, u8 *data)
+{
+	struct i2c_msg msg[2];
+	u8 rd_buf[3];
+	int ret;
+
+	u8 wr_buf[7] = {0, USB5744_CREG_MEM_ADDR, 4,
+			USB5744_CREG_READ, 1,
+			addr >> 8 & 0xff,
+			addr & 0xff};
+	msg[0].addr = client->addr;
+	msg[0].flags = 0;
+	msg[0].len = sizeof(wr_buf);
+	msg[0].buf = wr_buf;
+
+	ret = i2c_transfer(client->adapter, msg, 1);
+	if (ret < 0)
+		return ret;
+
+	wr_buf[0] = USB5744_CMD_CREG_ACCESS;
+	wr_buf[1] = USB5744_CMD_CREG_ACCESS_LSB;
+	wr_buf[2] = 0;
+	msg[0].len = 3;
+
+	ret = i2c_transfer(client->adapter, msg, 1);
+	if (ret < 0)
+		return ret;
+
+	wr_buf[0] = 0;
+	wr_buf[1] = USB5744_CREG_MEM_RD_ADDR;
+	msg[0].len = 2;
+
+	msg[1].addr = client->addr;
+	msg[1].flags = I2C_M_RD;
+	msg[1].len = 2;
+	msg[1].buf = rd_buf;
+
+	ret = i2c_transfer(client->adapter, msg, 2);
+	if (ret < 0)
+		return ret;
+	*data = rd_buf[1];
+
+	return 0;
+}
+
+static int onboard_dev_5744_i2c_write_byte(struct i2c_client *client, u16 addr, u8 data)
+{
+	struct i2c_msg msg[2];
+	int ret;
+
+	u8 wr_buf[8] = {0, USB5744_CREG_MEM_ADDR, 5,
+			USB5744_CREG_WRITE, 1,
+			addr >> 8 & 0xff,
+			addr & 0xff,
+			data};
+	msg[0].addr = client->addr;
+	msg[0].flags = 0;
+	msg[0].len = sizeof(wr_buf);
+	msg[0].buf = wr_buf;
+
+	ret = i2c_transfer(client->adapter, msg, 1);
+	if (ret < 0)
+		return ret;
+
+	msg[0].len = 3;
+	wr_buf[0] = USB5744_CMD_CREG_ACCESS;
+	wr_buf[1] = USB5744_CMD_CREG_ACCESS_LSB;
+	wr_buf[2] = 0;
+
+	ret = i2c_transfer(client->adapter, msg, 1);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 static int onboard_dev_5744_i2c_init(struct i2c_client *client)
 {
 #if IS_ENABLED(CONFIG_USB_ONBOARD_DEV_USB5744)
 	struct device *dev = &client->dev;
 	int ret;
+	u8 reg;
 
 	/*
 	 * Set BYPASS_UDC_SUSPEND bit to ensure MCU is always enabled
@@ -321,20 +399,16 @@ static int onboard_dev_5744_i2c_init(struct i2c_client *client)
 	 * The command writes 5 bytes to memory and single data byte in
 	 * configuration register.
 	 */
-	char wr_buf[7] = {USB5744_CREG_MEM_ADDR, 5,
-			  USB5744_CREG_WRITE, 1,
-			  USB5744_CREG_RUNTIMEFLAGS2,
-			  USB5744_CREG_RUNTIMEFLAGS2_LSB,
-			  USB5744_CREG_BYPASS_UDC_SUSPEND};
-
-	ret = i2c_smbus_write_block_data(client, 0, sizeof(wr_buf), wr_buf);
+	ret = onboard_dev_5744_i2c_read_byte(client,
+					     USB5744_CREG_RUNTIMEFLAGS2, &reg);
 	if (ret)
-		return dev_err_probe(dev, ret, "BYPASS_UDC_SUSPEND bit configuration failed\n");
+		return dev_err_probe(dev, ret, "CREG_RUNTIMEFLAGS2 read failed\n");
 
-	ret = i2c_smbus_write_word_data(client, USB5744_CMD_CREG_ACCESS,
-					USB5744_CMD_CREG_ACCESS_LSB);
+	reg |= USB5744_CREG_BYPASS_UDC_SUSPEND;
+	ret = onboard_dev_5744_i2c_write_byte(client,
+					      USB5744_CREG_RUNTIMEFLAGS2, reg);
 	if (ret)
-		return dev_err_probe(dev, ret, "Configuration Register Access Command failed\n");
+		return dev_err_probe(dev, ret, "BYPASS_UDC_SUSPEND bit configuration failed\n");
 
 	/* Send SMBus command to boot hub. */
 	ret = i2c_smbus_write_word_data(client, USB5744_CMD_ATTACH,

base-commit: 484803582c77061b470ac64a634f25f89715be3f
-- 
2.34.1

