Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011001.outbound.protection.outlook.com [40.107.130.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C8C22CBFE;
	Tue,  3 Jun 2025 11:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748950009; cv=fail; b=Xy1sUlHvbPXLKTPG0OXirXS0ivlVq7LLc0z3/DVMiseqinay6R+lnNFNAHHwe0NpfmfB/gn+odnm+6ktj8WkgcPtgXef4dzZUOyRMqHVs89tPs3pyM+2i6MmJmq0A/pUasOVt6lC5i2X9/X+uOf9Lhc/OcN0CII8jNFjv2xbCIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748950009; c=relaxed/simple;
	bh=Ghe88ANONGIeB62HJpoEvVfYBESLaKH9MpIt/XQxp+U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aHViKgrtDoGcduTYljmgyxosHCCJuAMao+K/ZdAlY6VvEfHT2LW2xYso/2cNX6HfQEDRQUF0uk+eP/wWHKcJxofDrsSr+mkK1q00SIsWqfQzB/ita6xq8FbdewaA3wB+rtv/ao75sE6ur14nyAXwDxORd2GCctiCBHaXKGYZw4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=oeztjr2D; arc=fail smtp.client-ip=40.107.130.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="oeztjr2D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FQbcDQkY7C2JrELLkmfuRKaTqbalbykxGqoA86bIJQwidbJu3Y1VHBBudyRNMnUt7569PVgRS54SUT30i3m+vNforCRl3qAVFhn0mtNxz2PUd86NefDZ7+hUzytJOz5gH1Qt36i9gRlyoXWepgqO0+nHuMUX06fK3O7BQDqTBLC00Rwj3sUv07ejkjAFvWvs0PiAAbZbcl8URoxg0guyGoVhRtcFVQlxNcTQ+3Oqb4w0pla1+mM7/2xm60D9/2E5VsxCI5etUcpf5gb2veEc3vdPaiAPcCY5fCpC6S4zMQP2ScW9QUKsde050Zr0A6GFfj0Dpk5KMPm9IoB+w3em9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6nKfACNYMskCHMoUpuKV9x+C7zVbJKdp47UELMDZQQI=;
 b=EZfE9zvU4/AjilUfIxofhaR2EPTKCCkQb7gJioz5qe6Jm9HWhwj1Vxk7XjBHzpmoagGZfi9Vn6N6DIcmX3U6VP0pzHKffsFcbSiSTa2dgPeZis2KBHaPD6+B1MMVNeaAT9qT8HZoJFb3GtONEkgQFLZtQeO1n/vhxU51WKNpzQiTYbZVsYmBxov/lWGXG2+S+Q0oowDicUW9gIAa/qRAI6c3mEPZYWjqbEF6X0Ky+B+cfjmcLZOTfzqmMv7sXZ2hdTkIOB6sUW3rJQGmYEeCDg7hSx99Vx9KlBMczMHNc1flWIOltHx3GWndKcVRp0LYEpKKO8bws6uqwWXfYNoyKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6nKfACNYMskCHMoUpuKV9x+C7zVbJKdp47UELMDZQQI=;
 b=oeztjr2DrcVYd35Jwxb7MJezA1hHMuZSEReW3GKBcS2TU1dCjDDrIyS5eT7AXa/glaykye0/Z+etBEOTf+NUUgrR89PTgeiZW/s4MJG+kO28YPy3he47cOj6NUi9uZh/xrOj44LEMSR9YKMDicvPbTuq21IGV7U9aK2Qq8cve43sezWbXcf8rD85FCJFAZm76b464F+8XVYhPX+ylz2H6GZuxr3cFo0JjI/etGAaSvrFGnoSwhrf29Bw1BWFcXEbuQNAgm3cTLTf7ju3uRZZO6wsESxMVAmDNosBZZ1kpP+XcgpmjIk3yBXTW1yTeQUw/NkahQfIbAJm13O5Uegcig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by GV1PR04MB10079.eurprd04.prod.outlook.com (2603:10a6:150:1ab::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 11:26:43 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::3a74:80e4:4144:62db]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::3a74:80e4:4144:62db%4]) with mapi id 15.20.8769.035; Tue, 3 Jun 2025
 11:26:43 +0000
From: florin.leotescu@oss.nxp.com
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Florin Leotescu <florin.leotescu@nxp.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: viorel.suman@nxp.com,
	carlos.song@nxp.com,
	daniel.baluta@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	festevam@gmail.com
Subject: [PATCH 2/4] hwmon: emc2305: Configure PWM channels based on DT properties
Date: Tue,  3 Jun 2025 14:31:23 +0300
Message-Id: <20250603113125.3175103-3-florin.leotescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250603113125.3175103-1-florin.leotescu@oss.nxp.com>
References: <20250603113125.3175103-1-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0020.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::30) To DU7PR04MB11163.eurprd04.prod.outlook.com
 (2603:10a6:10:5b3::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PR04MB11163:EE_|GV1PR04MB10079:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e08390e-c6cb-4e67-8fcf-08dda291843c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?EiG/rOOowV8kgbdfYmVwEvUW0Oliksvj01D7QDOvGBUflIv1dJZ2GZZQJc?=
 =?iso-8859-1?Q?Pn9QtTLQK98rYDxiqgbycf5irUW7sBMQ/0E9n1Bbl9yiXGB54Sl+jlsJhS?=
 =?iso-8859-1?Q?v6nRlHUbCYe9VeVp0Bb6Xvw1t395Rsor46cZFuseWKKUUBTiWgukcA97Rf?=
 =?iso-8859-1?Q?WDYLugHuxfYcGMZGqvqPRxdeEmSiMCapP5SxZFESxyKmJf9vH0x6kRR33h?=
 =?iso-8859-1?Q?R6gK4/3NAmayABEGl+/V+NAFHlPSv8JbS1vdVrc0LdjDlyJJpXnGpiZWGl?=
 =?iso-8859-1?Q?jU6bv5zhpId7alhl2LOhXCNnW29WYkKt5JGzoj1ysC3iriFwibayYhwFpM?=
 =?iso-8859-1?Q?/Z3Fz9RtTdxGLPUIg0YePteoTuNb98Wf9QXlPl2p/tqaZ4lNmSHTegHVsy?=
 =?iso-8859-1?Q?LMdAVZFBcYhAxftsJohGzJOg8W2j9oPNfVijB2n+s5UFsF5v5lDWWuLVZg?=
 =?iso-8859-1?Q?Vu/twORV5Gck8SzY+96zKQIf5fidf7J8K7sKgGWidJ+mxPgtUvw3CV3Kts?=
 =?iso-8859-1?Q?JtwoMaKGpeuo1zh2NhJuoMpya7nPnCN81Wy/n9R2J4u1YkVVRsoS5W1dqz?=
 =?iso-8859-1?Q?0jsSUNYUrRBVbbzKxNj0FB2mjDRjC5ZXEDBObJl4YrHqctKyWQGn/b5gzb?=
 =?iso-8859-1?Q?mWI2S4YJ9IFZwqcRSyK+UatmToh2gX8L04EAMPHSqBm+y4iTTWSpftAija?=
 =?iso-8859-1?Q?e82BCz54IXp60Xn4LfyWHIFoobnTM17n13cY5Na7sDYaf5WbnNqEF3CYNm?=
 =?iso-8859-1?Q?0o0GPMS01oIt3+13K0LQuOvStjGeegnjVugc1gn8M9t8Ku+bS/ZRc9i9Np?=
 =?iso-8859-1?Q?t8JLAtFxryojUmdlP80XIGA2Tcr1mmFJ0iQBgujr4IngqrvwS67b2BKtEp?=
 =?iso-8859-1?Q?df3oWevJeyHsK6OKuAZ0qFp86A7C69pemS6ZC1KBz+Ww5NQk/pbzd7/TfH?=
 =?iso-8859-1?Q?/fTIIgkiB6v0s70PZRVx16ds9xilVNAg1tnh/QXDMeVeW2q7runEG1U6Id?=
 =?iso-8859-1?Q?bXHnBcuE3xCAit1zs6vhWqiTI5+SjEBdcTn0Zw7szYSkbTFd9zA70AL2MF?=
 =?iso-8859-1?Q?nh8MPNEUxHKUDBdPBJ8ixnpYBIoUSR+QuxVQSk7xAD0c5Ttj/TxqSjOTDj?=
 =?iso-8859-1?Q?Tshei8xCuP2+LIwg25V2JHL+bJ5C5yuSYrTXPFRcpWy/X/f2sy1pXKIX3I?=
 =?iso-8859-1?Q?Z46BwE70UfrcXLy1lbsAqHM5s93wEwfPQDxhyFk2Mp6aJDqxiQ8gLwnIm6?=
 =?iso-8859-1?Q?CN+uJl1SvXrXTxTnySxxLGFs5p4sNSrWvLEI5s8XRyJtrHw8OkyBuKcKde?=
 =?iso-8859-1?Q?PkfJK51x0DGd34qrHIrFfOHiCNrx9XdRKDUGbDhIgdIstSaPW4bjKrLHlG?=
 =?iso-8859-1?Q?WKwJKSX0OQ0MK19IYR8eR1U3Dq7Yaw6QiHtEvkBVYyg1aRCGs3diXbxGDb?=
 =?iso-8859-1?Q?df3wLTUVdE8huoyz85MsTitnVu1emvo47KbUr7/qc0JE3JaAb2XA8hucIH?=
 =?iso-8859-1?Q?s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?nVaH53Nvd9IUK436S8uKUjaQVQjMbobpR5fAfdIV2fZlMvfpd90TWh0aYh?=
 =?iso-8859-1?Q?Nok2RC6W9kVyZU9U8FTlIBnzrKMvBU/wDt1RAlyfGwOqXNgskcZoUEHrzu?=
 =?iso-8859-1?Q?TmH9o4px1lfUCIWwsh1PczLU1CFS792BXyHwFeqHtSdu122YnsoMyyRqw7?=
 =?iso-8859-1?Q?WdtnjUdL7mMOxbAdx28EW5+SyDZsi778KH1Ml0LeKr3e4M2+hwwsrrbV9H?=
 =?iso-8859-1?Q?wYqm2eC+ypgOOsT7vGRmPhwgNdHf2ZwDiKyKs1nl64bbOMDRaxAi2+kcZo?=
 =?iso-8859-1?Q?YYgF652wRAMyn+ydgpZlqMg7B1eAsuUfF0QaMRdkgRxnrtoqTgZnWRtvfu?=
 =?iso-8859-1?Q?LSEQK7FvB1RoTvqiJ3H/xZYOq4bIzAdHcmU+H5iDJL/KAWHX5nfSk2/edb?=
 =?iso-8859-1?Q?+knaGrgKTYhUWJGrXnolaP1IvNGCSyAshIhavp1ifh3wgq/XpVldZhLPBw?=
 =?iso-8859-1?Q?o+4S9x/u064kC/VvMYuUbIrMJhJqiKC/oOO9n0ZbspFN/FA4GX5gOw7kHs?=
 =?iso-8859-1?Q?17SXtarpbP2bPR++Jeot6KLsd052kNWbBY507aa75ZYbUrWmAVrIHGOyd5?=
 =?iso-8859-1?Q?kpGWo9JihzqOHz9krCV5nOTrMEPSou42CJ5exfCt5Rv7bvurUP8oOYCB7o?=
 =?iso-8859-1?Q?7DY7rwAdcdXEqKgh7lAr0sO6IL97LbUmV6gccF0oo4PHUWCfdCpOZlgfIr?=
 =?iso-8859-1?Q?KNXhxdjB7UOeFCBNEKWCEbgz4PSiNIeBKx7FOufJWBiB5JrbR5yiE6NHZJ?=
 =?iso-8859-1?Q?6+OtBqlkVeXA+aVyHD3EwOhQREmIr0m/6e0WmlUhVgYGJFaMlB/p5SCJAr?=
 =?iso-8859-1?Q?mOx3lYowANp03kvHSZUUpp890ZPBGf5Auuq62SUr+e2FrOUsOghWbL3EIZ?=
 =?iso-8859-1?Q?eiaMoOiEM/8cP076IU/OPK2wsENRqDjbeRt1C9uN7XBvB9d6TkL36aLjVO?=
 =?iso-8859-1?Q?lrCI6/CAcLh8T2afPH02cqoBkG2RMqBONzla5gEdAAszT4gRGVSE8zEGBY?=
 =?iso-8859-1?Q?uLROuxziGMd7ojUpeeh6+L/e6/n3LEgJrcVLJox1qDSY4C9KJxVsONxALs?=
 =?iso-8859-1?Q?W9dCKiPvrkmOmkoIVk8JiXqs9VI7qhSkUdjx33FehK3ukBExYAsu0TuskW?=
 =?iso-8859-1?Q?7ERK50zo0dYsdC1fAHlrUv9QsQfowq9+x3FCKRW2nNKXnOSngeFyBLUtq7?=
 =?iso-8859-1?Q?dOkf2AQmdm3zpoy/CqJagVxA3C5vG/bxsTfFWYPc/t2mHz0eRqpL1neSU4?=
 =?iso-8859-1?Q?6zTgUsUKnJi3KcNERSYPwbS0ki/fAfsWUiab0AWCFfL8TbJ5Htck61Nx0z?=
 =?iso-8859-1?Q?Zzuhxa1gaPTZ6k+UtwHycb/ghoaOrjRfRqZysgknG3DYJUufk/xvULxmYD?=
 =?iso-8859-1?Q?foC5kZDIdfv1zY8wDRpHvVelIK72R7GdNOfs1m42l+lVNrWd12Kzav2Yev?=
 =?iso-8859-1?Q?S3UQlfpH8ywSgI0tocRU4YuSPKUsaEjf/ZWDQST9RSCtP9k9OYLEirIqV4?=
 =?iso-8859-1?Q?eRnYv8k8+/yUAcf8gxIGrlqqH/0fL7H6wuIkFUmek9UYyb3MPfXaEX6uvy?=
 =?iso-8859-1?Q?z7txEDGBLvtN9337yPQsdHL+26Z66Hvt7BxeK1/wvv3RMyE0EUWqQEM1qs?=
 =?iso-8859-1?Q?GG1/QhCVT4tH2SDDlJH5klR2agOapBf87x6sF5wszwscqqJr0tIrNNGw?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e08390e-c6cb-4e67-8fcf-08dda291843c
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 11:26:43.3195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xq6jvB4mkvoWZlyRgz2mMHDZ/BlvsA9FevuERN9j05Gj85c+BqzJZu4fH/Ft4mK/zA9rWUGnZJoegg/XTFfbGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10079

From: Florin Leotescu <florin.leotescu@nxp.com>

Add support for configuring each PWM channel using Device Tree (DT)
properties by parsing the 'pwms' phandle arguments.

Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
---
 drivers/hwmon/emc2305.c | 151 ++++++++++++++++++++++++++++++++++------
 1 file changed, 129 insertions(+), 22 deletions(-)

diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
index 8fc4fcf8a063..0228511f4753 100644
--- a/drivers/hwmon/emc2305.c
+++ b/drivers/hwmon/emc2305.c
@@ -11,6 +11,9 @@
 #include <linux/module.h>
 #include <linux/platform_data/emc2305.h>
 #include <linux/thermal.h>
+#include <linux/pwm.h>
+#include <linux/of_device.h>
+#include <linux/util_macros.h>
 
 #define EMC2305_REG_DRIVE_FAIL_STATUS	0x27
 #define EMC2305_REG_VENDOR		0xfe
@@ -23,6 +26,8 @@
 #define EMC2305_TACH_REGS_UNUSE_BITS	3
 #define EMC2305_TACH_CNT_MULTIPLIER	0x02
 #define EMC2305_TACH_RANGE_MIN		480
+#define EMC2305_DEFAULT_OUTPUT		0x0
+#define EMC2305_DEFAULT_POLARITY	0x0
 
 #define EMC2305_PWM_DUTY2STATE(duty, max_state, pwm_max) \
 	DIV_ROUND_CLOSEST((duty) * (max_state), (pwm_max))
@@ -39,6 +44,9 @@
 #define EMC2305_REG_FAN_MIN_DRIVE(n)	(0x38 + 0x10 * (n))
 #define EMC2305_REG_FAN_TACH(n)		(0x3e + 0x10 * (n))
 
+/* Supported base PWM frequencies */
+static const unsigned int base_freq_table[] = { 2441, 4882, 19530, 26000 };
+
 enum emc230x_product_id {
 	EMC2305 = 0x34,
 	EMC2303 = 0x35,
@@ -287,7 +295,7 @@ static int emc2305_set_pwm(struct device *dev, long val, int channel)
 	return 0;
 }
 
-static int emc2305_set_single_tz(struct device *dev, int idx)
+static int emc2305_set_single_tz(struct device *dev, struct device_node *fan_node, int idx)
 {
 	struct emc2305_data *data = dev_get_drvdata(dev);
 	long pwm;
@@ -297,7 +305,7 @@ static int emc2305_set_single_tz(struct device *dev, int idx)
 	pwm = data->pwm_min[cdev_idx];
 
 	data->cdev_data[cdev_idx].cdev =
-		devm_thermal_of_cooling_device_register(dev, dev->of_node,
+		devm_thermal_of_cooling_device_register(dev, fan_node,
 							emc2305_fan_name[idx], data,
 							&emc2305_cooling_ops);
 
@@ -332,10 +340,10 @@ static int emc2305_set_tz(struct device *dev)
 	int i, ret;
 
 	if (!data->pwm_separate)
-		return emc2305_set_single_tz(dev, 0);
+		return emc2305_set_single_tz(dev, dev->of_node, 0);
 
 	for (i = 0; i < data->pwm_num; i++) {
-		ret = emc2305_set_single_tz(dev, i + 1);
+		ret = emc2305_set_single_tz(dev, dev->of_node, i + 1);
 		if (ret)
 			return ret;
 	}
@@ -517,15 +525,85 @@ static int emc2305_identify(struct device *dev)
 	return 0;
 }
 
+static int emc2305_of_parse_pwm_child(struct device *dev,
+				      struct device_node *child,
+				      struct emc2305_data *data)
+{	u32 ch;
+	int ret;
+	struct of_phandle_args args;
+
+	ret = of_property_read_u32(child, "reg", &ch);
+	if (ret) {
+		dev_err(dev, "missing reg property of %pOFn\n", child);
+		return ret;
+	}
+
+	ret = of_parse_phandle_with_args(child, "pwms", "#pwm-cells", 0, &args);
+
+	if (ret)
+		return ret;
+
+	if (args.args_count > 0) {
+		data->pwm_freq[ch] = find_closest(args.args[0], base_freq_table,
+						  ARRAY_SIZE(base_freq_table));
+	} else {
+		data->pwm_freq[ch] = base_freq_table[3];
+	}
+
+	if (args.args_count > 1) {
+		if (args.args[1] == PWM_POLARITY_NORMAL || args.args[1] == PWM_POLARITY_INVERSED)
+			data->pwm_polarity_mask |= args.args[1] << ch;
+		else
+			dev_err(dev, "Wrong PWM polarity config provided: %d\n", args.args[0]);
+	} else {
+		data->pwm_polarity_mask |= PWM_POLARITY_NORMAL << ch;
+	}
+
+	if (args.args_count > 2) {
+		if (args.args[2] == EMC2305_PUSH_PULL || args.args[2] <= EMC2305_OPEN_DRAIN)
+			data->pwm_output_mask |= args.args[2] << ch;
+		else
+			dev_err(dev, "Wrong PWM output config provided: %d\n", args.args[1]);
+	} else {
+		data->pwm_output_mask |= EMC2305_OPEN_DRAIN << ch;
+	}
+
+	return 0;
+}
+
+static int emc2305_probe_childs_from_dt(struct device *dev)
+{
+	struct emc2305_data *data = dev_get_drvdata(dev);
+	struct device_node *child;
+	int ret, count = 0;
+
+	data->pwm_output_mask = 0x0;
+	data->pwm_polarity_mask = 0x0;
+
+	for_each_child_of_node(dev->of_node, child) {
+		if (of_property_present(child, "reg")) {
+			ret = emc2305_of_parse_pwm_child(dev, child, data);
+			if (ret) {
+				of_node_put(child);
+				continue;
+			}
+			count++;
+		}
+	}
+	return count;
+}
+
 static int emc2305_probe(struct i2c_client *client)
 {
 	struct i2c_adapter *adapter = client->adapter;
 	struct device *dev = &client->dev;
+	struct device_node *child;
 	struct emc2305_data *data;
 	struct emc2305_platform_data *pdata;
 	int vendor;
 	int ret;
 	int i;
+	int pwm_childs;
 
 	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA))
 		return -ENODEV;
@@ -545,22 +623,40 @@ static int emc2305_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
+	pwm_childs = emc2305_probe_childs_from_dt(dev);
+
 	pdata = dev_get_platdata(&client->dev);
-	if (pdata) {
-		if (!pdata->max_state || pdata->max_state > EMC2305_FAN_MAX_STATE)
-			return -EINVAL;
-		data->max_state = pdata->max_state;
-		/*
-		 * Validate a number of active PWM channels. Note that
-		 * configured number can be less than the actual maximum
-		 * supported by the device.
-		 */
-		if (!pdata->pwm_num || pdata->pwm_num > EMC2305_PWM_MAX)
-			return -EINVAL;
-		data->pwm_num = pdata->pwm_num;
-		data->pwm_separate = pdata->pwm_separate;
-		for (i = 0; i < EMC2305_PWM_MAX; i++)
-			data->pwm_min[i] = pdata->pwm_min[i];
+
+	if (!pwm_childs) {
+		if (pdata) {
+			if (!pdata->max_state || pdata->max_state > EMC2305_FAN_MAX_STATE)
+				return -EINVAL;
+			data->max_state = pdata->max_state;
+			/*
+			 * Validate a number of active PWM channels. Note that
+			 * configured number can be less than the actual maximum
+			 * supported by the device.
+			 */
+			if (!pdata->pwm_num || pdata->pwm_num > EMC2305_PWM_MAX)
+				return -EINVAL;
+			data->pwm_num = pdata->pwm_num;
+			data->pwm_output_mask = pdata->pwm_output_mask;
+			data->pwm_polarity_mask = pdata->pwm_polarity_mask;
+			data->pwm_separate = pdata->pwm_separate;
+			for (i = 0; i < EMC2305_PWM_MAX; i++) {
+				data->pwm_min[i] = pdata->pwm_min[i];
+				data->pwm_freq[i] = pdata->pwm_freq[i];
+			}
+		} else {
+			data->max_state = EMC2305_FAN_MAX_STATE;
+			data->pwm_separate = false;
+			data->pwm_output_mask = EMC2305_DEFAULT_OUTPUT;
+			data->pwm_polarity_mask = EMC2305_DEFAULT_POLARITY;
+			for (i = 0; i < EMC2305_PWM_MAX; i++) {
+				data->pwm_min[i] = EMC2305_FAN_MIN;
+				data->pwm_freq[i] = base_freq_table[3];
+			}
+		}
 	} else {
 		data->max_state = EMC2305_FAN_MAX_STATE;
 		data->pwm_separate = false;
@@ -574,9 +670,20 @@ static int emc2305_probe(struct i2c_client *client)
 		return PTR_ERR(data->hwmon_dev);
 
 	if (IS_REACHABLE(CONFIG_THERMAL)) {
-		ret = emc2305_set_tz(dev);
-		if (ret != 0)
-			return ret;
+		/* Parse and check for the available PWM child nodes */
+		if (pwm_childs > 0) {
+			i = 0;
+			for_each_child_of_node(dev->of_node, child) {
+				ret = emc2305_set_single_tz(dev, child, i);
+				if (ret != 0)
+					return ret;
+				i++;
+			}
+		} else {
+			ret = emc2305_set_tz(dev);
+			if (ret != 0)
+				return ret;
+		}
 	}
 
 	for (i = 0; i < data->pwm_num; i++) {
-- 
2.34.1

