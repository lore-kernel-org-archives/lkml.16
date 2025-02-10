Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2068.outbound.protection.outlook.com [40.107.249.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C23F1AF0D7;
	Mon, 10 Feb 2025 07:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739172251; cv=fail; b=NlTTTXYElBPF1+GLegGFn8UC2zKNZNR/hrQ9cQupE8hcgzssWu3HT62SpMRCOluTXPH+UY6n5Xy30fNlSfLtMmj/j52sTfXbyck+VcPsSt8ke96VFLKy5sZN0bKPZ6rFh7Waesbi34T2GBlJZ+4uvzH4gNaED99BdbCxWiA3QrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739172251; c=relaxed/simple;
	bh=N5Fm06kFyuCzBbXPyvBxFlPvO2oZd6GaSL9MbzU2z48=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ITpQixFO1YeRv7SOeEe9Gck15wUS0xcCxisZsoKvrgZDgs2O8els7fgnWNBPiR13KQ3fdTwvUgXpfHvaQRQhxqGc9xw0ME0E237t+BPvWrlIIdr8cIMsT/IDivGtnbUumhZ8N8ve34wa1C5TQxUQJK5ijmKojYGmCLNCq+eiQ3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xOmdaoPp; arc=fail smtp.client-ip=40.107.249.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xOmdaoPp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KffWb8XtWCdJomIMcEfw0RYYKts/SMO4sork8Hu7GQHDDpSBaU8Wd6W1yjVBN43dD66l2AVIVwO+PZrjjG2x5kbO00kQqbiWXcwBXkY1zvvIpXcxmeMi9bOXDgE/6Xy1pJQFQ779f/TAGVVDR+RZi/LDqJWGGByfLwawWKTFSuFD1rT2iQHWZTboT7I4CwmABOGAm3b1sdhQM3VtKf4EQKR84P2uNFur+WDxikjWDlzC0380hSwMpmowltDuff/ccElGDjIZ0b1jXWOe7+BHa1vMhzCLA70etWi174QpwyURRPo9hg24Bp9b59LJAuExHP2N7NHUVLmjP4BFGT1Vfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZeuH0AogVMgtZXaE5HfsTqIJsckDxH4w9fAj7jcwldo=;
 b=ZvP/ON+9CDdI4c3NZBNY3IOJyBULf86of3qDpX4kz+kvKUu8rfLOt2mq5xWivXQQCqUGbaJ0PkrIGLM417O3KilWK9JjmTl52NQpYmvqz0o0lmKRYRkXrobnYNaYZ7tBXXqmv4rxSjwWctRmJV4KR4PJY/+OgAB+Gchz43yyO1iOfGYS+ADoMcCDeD5FEIcg6u6rNbCOLqdsYMt3l0iUe0gm1UAcxBrKGLhjjmN7+u0To9O6JzIE2x3FRxkrvQIteHCshzNfTs3DtUaDiC9gexAtMl+p+CRT00e5/5XWaRT1jqDFyDOWZsF338k92HfpM57G+ubxtCHqtRJoiuwLeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZeuH0AogVMgtZXaE5HfsTqIJsckDxH4w9fAj7jcwldo=;
 b=xOmdaoPpBtMdkp27jhrtLkad/sSWsxLmLSUAoqjBXmOlLnv10uU3QnHNiEJ1kifaqiAiySpN9LBz8643jLmKEpFnl9Eb42KRy+I+e/Kzir3w8+bIVN2OuaEibEo4MjrOdtOCjhUbY/QimifQAqn5u85gNV74ooDFslIbpmbGOugWfGgGKkkNN2YcvIC6u+zgZcaAmzuxdPN1HtzA1mbBlGcbikBoMBx4YDe2eGSumTVBSnvGqSwTt74lH+2I7G5Jm8zJvYWeOxzBv1piuUvPBM7BU4lWmAi121yUO88V1xXBP+GV+cru75Pa6iAop5XzChMMDtB9140Mf7AHoW9ooA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by DB9PR04MB9648.eurprd04.prod.outlook.com (2603:10a6:10:30c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 07:24:06 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::3a74:80e4:4144:62db]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::3a74:80e4:4144:62db%2]) with mapi id 15.20.8398.021; Mon, 10 Feb 2025
 07:24:06 +0000
From: florin.leotescu@oss.nxp.com
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	viorel.suman@nxp.com
Cc: Florin Leotescu <florin.leotescu@nxp.com>
Subject: [PATCH 2/2] hwmon: emc2305: Add device tree support for polarity and pwm output
Date: Mon, 10 Feb 2025 09:31:58 +0200
Message-Id: <20250210073158.336522-3-florin.leotescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250210073158.336522-1-florin.leotescu@oss.nxp.com>
References: <20250210073158.336522-1-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4PR09CA0022.eurprd09.prod.outlook.com
 (2603:10a6:20b:5d4::14) To DU7PR04MB11163.eurprd04.prod.outlook.com
 (2603:10a6:10:5b3::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PR04MB11163:EE_|DB9PR04MB9648:EE_
X-MS-Office365-Filtering-Correlation-Id: 8924b0d5-3528-40e9-9a0a-08dd49a3e74d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?/cciT2VC1lsor9Qy1/uaEkaTCdcKEjYMf8a/qbjoFOb892fsweatQ42LX+?=
 =?iso-8859-1?Q?FFRoCqJDONzOH0IMoGRC99qGSVK561gu1cx9BDGMwSAP44KikWp8UJhryo?=
 =?iso-8859-1?Q?ePZvGKY7kkeeXJij1aKH2pBJMkoHJ65uDS6Z2twGqzQKYPOe79iouVL2Lf?=
 =?iso-8859-1?Q?ymr4fPdKRm1SOtaMDS1rjVDFkbqxQ0sCTTvyYB0BKJywI+wWAMqXk/gGTy?=
 =?iso-8859-1?Q?He3hOjdtBcE21pv4UmM8nKoizf0hxwPnvaehnaq5EivwHAnsitMB94Ydja?=
 =?iso-8859-1?Q?/sUXcMi4pNU8kHYi4JgSZHwU4guDvoGDz+vVUTvZSnVSlvGCoWsxgb6kZ8?=
 =?iso-8859-1?Q?ymrfNMfm9HaZPq+jvSV3SzMscJV78MFUVgqMyJyMeGbIga4kIXk5XHo6Z6?=
 =?iso-8859-1?Q?YJnGjHKQ6GtZlL1pAPc4zMQ74dimxE7kUpmcmqAeeriAJnEyIc4kJs57dd?=
 =?iso-8859-1?Q?W1Uc9YRImgAJxXy4GktdwzaRv/X493AQxwBiigz+Gl8eCdGiTQjyKmv3bn?=
 =?iso-8859-1?Q?NPWwYA9NEuKivHCGOJ136lNnvy9rWoQMQtNHTcI6noHulAxDtz/tHgB3da?=
 =?iso-8859-1?Q?QDHebCZ3lGVQtnuQ505EpweYswRKSOC6S7XqZtN+eXhoGuvivdfeR3P/Ro?=
 =?iso-8859-1?Q?2PASRl7np7R3bRFQUGT/LqnGG+o7MkENXRv+8HFgQ0+DIz61K/39F2g9U1?=
 =?iso-8859-1?Q?WCVdeBk4ZeYtm5ly4w8RW9DlWqbVrJEqF3H9754O7/hyr0dld/L4kjWx0W?=
 =?iso-8859-1?Q?z4vjqxglq9TepISmLQEQSw4lAawCtofVUZPoW2Dt3hx8HzyYSA3l0900Xf?=
 =?iso-8859-1?Q?AhPxaCivdwDX6kHfULJhOWWkHHqq3F3UX8b6p3Bmpn6M0v9RDz8peCVTvR?=
 =?iso-8859-1?Q?QS7Ff5t8I+pB9fgDEZWhmUfrz5nSo+PKrfoHySTpvHVxHMTjD2jjXxCeT5?=
 =?iso-8859-1?Q?d8Lzwfp/TiryNWGuCsnVZPzRISB/3TiqCQKdLYbJySKrMLmXv4DI3Wizvf?=
 =?iso-8859-1?Q?eVcgsBiQaH/oAUNAUNWFEj7XUMKmNWg3EB6pK1WocvY/bROLpuA0GgnzkN?=
 =?iso-8859-1?Q?aXWOMLM0kJ6Md1WjyONqLELW2AD6PsuNxPY4V+xrkQZQ4FprcbmRQZzKAy?=
 =?iso-8859-1?Q?SO5uet4eJhsegYMRkkIYgwwN6sTIqecjhBvqr4QEw9xfv7nIS4eJ+oDc27?=
 =?iso-8859-1?Q?nThKGo6Tma2ZS7rZiNx50AptN9PhJ8mUZCpJGSUVrxMotm/w0CGiH51WAS?=
 =?iso-8859-1?Q?z9LaQLRh6kuaIKMo4okYW6bV5sV9HUh4BYORxdv0KonB+6CQf7qkVv0e/D?=
 =?iso-8859-1?Q?AQv3z3iFYXPr+OMwROTYh98iG7fNX6BBMl6Totw1RO9SA56HuZM6af2iLj?=
 =?iso-8859-1?Q?kuttyJda/oXbLlgqstvCwOi+mvaCbth5VZDvPXcrK/jrysGoRjhdUnDFI1?=
 =?iso-8859-1?Q?auVOuGXbSyRSSU2x?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?iaFgf0SH/QyGR0261ejSqJuKBNgMXGcVb493vOvOGfBVNC/jpvohcHZ1Wn?=
 =?iso-8859-1?Q?gRPMGPcKnkNpJGMePfOihKulLiUNBnQiORJ4iLOJ39TLAUor75tsya21yE?=
 =?iso-8859-1?Q?SBRNF/m+RXNGsd4InTr6n8Ud9DWnM5HpO6b3HGwMfIg27K4s9TaCIBWeiZ?=
 =?iso-8859-1?Q?FBTaWGSWpnAgdXfYk9rwSbZD4rhAtrc5GsBdzprvX4vGupkSN6DkzLx19S?=
 =?iso-8859-1?Q?rxBu06SSDV4rL0RNVecXQBZ2991J+tjUVdUCdiW4lWrm88SSEQ4MyZUQ3P?=
 =?iso-8859-1?Q?n5R9HqNzt71sks6DI0Y28kJejVOSahqNhPR8Pfk9HaGlBekbn9iH3MrHLO?=
 =?iso-8859-1?Q?QQdEgQg0xgf2qHvDXMuWbu35mu/hl72SIwKXBsD4FsSYvgfosMPO7ZVao4?=
 =?iso-8859-1?Q?DHA2Ljrqem/eBJNCuMSb5WNvNGTvxnjM27/sHmN1MlVTtEdiDaFs4YkYG9?=
 =?iso-8859-1?Q?dOAt/sFgHHI2ZL4bjMdTn8yvcUtu7e8Y4sbFrBaVpgCZE2/A5yzxv4dw/F?=
 =?iso-8859-1?Q?PRJaTpwCNwo0+6gBy3a7A9F7t+WeKXooCkZogeWWDP/hFQwtnnhjNOEi+B?=
 =?iso-8859-1?Q?Aw3cv8fl433wssULDkJgXSZnQEP3XxTAtd9Yk8zXsnjK+/k3X2xPYa97ac?=
 =?iso-8859-1?Q?Tx+du5alcEfO/GxII/1VvmakD03n0lizwJQh6u+S1rR4evLRcjkOBSE28N?=
 =?iso-8859-1?Q?9X/IlactGdXcgZqi+zZp0usb/xqEuqZFtH692V+S3vxzNGAX9B5zIYSXTu?=
 =?iso-8859-1?Q?CfTAXgTMBgWqVy64ejf9lM7u50bFEKQM1ba/4grM0vE3RyaUizT9c4CoKz?=
 =?iso-8859-1?Q?m+aPwCDSNmFo0OClNhijE4ZzD1nRezcR5IuS0Y0HeQZ9Y4QrKZ+n7t6xW8?=
 =?iso-8859-1?Q?HHgusfgiBJZn1d6AMnN5nsrBmntd3Hu9SYrErke0oI081J2hYk26pXU0EA?=
 =?iso-8859-1?Q?1yzoPF//9neTUezmRveSRHLgvwuSdG1yn290CuDmiK/NsysL7ZIXD0B9sW?=
 =?iso-8859-1?Q?4PefPWVW81dc7leOsFo2ptBPLZe+secWAUw4bT5TIroTzIwHbtrkBUZEY+?=
 =?iso-8859-1?Q?NdYjKx1SGQEGmlRd4wSnMvdyF1qIume3hBv2joRUo/uNEJME0IK7fLQSZS?=
 =?iso-8859-1?Q?GkYblKsGZz5tQ3y5RGYWZnQM+wtVjhCYPtyqZKJqcdx4PnyIFyQzEhyTs7?=
 =?iso-8859-1?Q?DZaySl9kL1ysvUn27vH6XQ4DMdOpsIryB+ig/DWPH9Vt0uUC1waFILoWC7?=
 =?iso-8859-1?Q?C/2wWagQFfqUWXlcLWPd0tu67f4XIPqRMH6+rbu55Jjg+rohPKFNgixIun?=
 =?iso-8859-1?Q?MxIKQGmxaYc5ONRZ/7DeEnlJiT0gK8vX9x6jCCVf1NuRQh5vbNlC1vFHSa?=
 =?iso-8859-1?Q?kAuRwlqe5Se2X5fSIVyqMA9T2yd+U3BwhUXUiqM/GJ12wmrmr0umuGwjK4?=
 =?iso-8859-1?Q?bHUF+crhIxFfO9wYYn0Y7t55NU+qyEKKlRVwk6lg6T5t7ZWAuDizOXMZrN?=
 =?iso-8859-1?Q?bvFEqgQacNtxsBOlvyP6R+qPyjRI+6QL2pi53FyiDioX/ajg4QEGy7Hl4H?=
 =?iso-8859-1?Q?wWA21Y7pCzD0gKT9JJ8XJCQqtAQKKrEXmlwBOLeiZxXLNzagwf+jAbfd4T?=
 =?iso-8859-1?Q?GboA/Wf0VbL+xyzgZdqigf4KQ57IqZ6yCdOGB2uQccYk57gseDxkmqjw?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8924b0d5-3528-40e9-9a0a-08dd49a3e74d
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 07:24:06.6646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9x2cHMQAzrD3CI2/P67+4skb1GdBMQciKeHveXectsJKVwieuHG8bv0kF/2eVn2G2Yw5skmeeXddulxweEFMPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9648

From: Florin Leotescu <florin.leotescu@nxp.com>

The patch enhances emc2305 driver by adding support for configuring
pwm output and polarity via Device Tree properties.

Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
---
 drivers/hwmon/emc2305.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
index 18e765902d32..e8cdc0cbcb35 100644
--- a/drivers/hwmon/emc2305.c
+++ b/drivers/hwmon/emc2305.c
@@ -23,6 +23,8 @@
 #define EMC2305_TACH_REGS_UNUSE_BITS	3
 #define EMC2305_TACH_CNT_MULTIPLIER	0x02
 #define EMC2305_TACH_RANGE_MIN		480
+#define EMC2305_REG_DRIVE_PWM_OUT_CONFIG 0x2b
+#define EMC2305_REG_POLARITY 0x2a
 
 #define EMC2305_PWM_DUTY2STATE(duty, max_state, pwm_max) \
 	DIV_ROUND_CLOSEST((duty) * (max_state), (pwm_max))
@@ -537,6 +539,8 @@ static int emc2305_probe(struct i2c_client *client)
 	int vendor;
 	int ret;
 	int i;
+	int pwm_polarity;
+	int pwm_output;
 
 	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA))
 		return -ENODEV;
@@ -590,6 +594,29 @@ static int emc2305_probe(struct i2c_client *client)
 			return ret;
 	}
 
+	if (!of_property_read_u32(dev->of_node, "pwm_output", &pwm_output)) {
+		dev_dbg(dev, "Configuring pwm output\n");
+		if (pwm_output >= 0 && pwm_output <= ((1 << data->pwm_num) - 1)) {
+			ret = i2c_smbus_write_byte_data(client, EMC2305_REG_DRIVE_PWM_OUT_CONFIG,
+							 pwm_output);
+			if (ret < 0)
+				dev_err(dev, "Failed to configure pwm output, using default\n");
+		} else {
+			dev_err(dev, "Wrong PWM output config provided: %u\n", pwm_output);
+		}
+	}
+
+	if (!of_property_read_u32(dev->of_node, "pwm_polarity", &pwm_polarity)) {
+		dev_dbg(dev, "Configuring pwm polarity\n");
+		if (pwm_polarity >= 0 && pwm_polarity  <= ((1 << data->pwm_num) - 1)) {
+			ret = i2c_smbus_write_byte_data(client, EMC2305_REG_POLARITY, pwm_polarity);
+			if (ret < 0)
+				dev_err(dev, "Failed to configure pwm polarity, using default\n");
+		} else {
+			dev_err(dev, "Wrong PWM polarity config provided: %u\n", pwm_polarity);
+		}
+	}
+
 	for (i = 0; i < data->pwm_num; i++) {
 		ret = i2c_smbus_write_byte_data(client, EMC2305_REG_FAN_MIN_DRIVE(i),
 						data->pwm_min[i]);
-- 
2.34.1

