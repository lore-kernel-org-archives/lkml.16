Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020106.outbound.protection.outlook.com [52.101.227.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95F817A2F5;
	Thu,  1 May 2025 05:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746078393; cv=fail; b=XFrPBryMFiePI0SKy/nODIGzxGuC3JrzMSF6zos3Z02NRJGxqFnXL2f7JNNLVD0szwmoVrgd3jyenFGIxQmx1X2kGX0Z70DIh0IVkHAWzcnVaav3xrCROw7OxfO/nFDRUTAJfcSYY8h5meGCsJ8XkeY8c8TEmX+31dRzkxir1Rk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746078393; c=relaxed/simple;
	bh=0QD4yUmx/B9JK/jrS9So2Eb31fFwUaaukL34FxtienI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=TWf8wbEWXSy0EXrD18gWgZJqM+L36hfDPin1VmnyR3xxM8uA8Kz7v0EHRRRfLTYJZtB50A1tkcjjihmzv+3sOwrSfCZiNC0ZAljAGNiN6OjHne9BUycwInOqMzkseCxHV4LSUyBFBthkMcUXCs6hDkw8heC/SPyhjhwEzByp0VU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.227.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KM9XxGuJK6iykPAOGuwzLwGzMl9i8fSXoQNd88wPbUxnW+mUM2sdP68Jnadwd1l9tVgLZOWIlqY15vUI/Yhre3YgVziRqZOesOj8CrlyA2mEOkBih1E+judFU6G5GF2DyLwwUchk7P9VVAFtPh6SRKveSDekz8nTiAjFhonmPBed+VbWqi9gRRSEs7XrbDyxiZmXEXYsUt6oUPMFFHERtT6L8DJC38hSNRPmkfPEkx7YtvSprpB4vRWd51GiyRmXzXJeFvOWhuAWiYUoZiWCTfHPJSAbf0W+vd5XcCSfINE/Qwov2CWVsM05wNjasZLCCUxGRnlLUwgO+hOabriLrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FgzrLVaJB77MB0EBjdCKGzZJC/djdPOC9gp3eMYiPOE=;
 b=hnsrmdil/cHzLnYHAZGMYvGKPcO5kcmVChzYUt66U+p9qpQpfnlKkNm0JaJTj+lhp01OqLCo8uxDaGKJunEOQ7isJnGqpdyjv3vaVIYdVIfmh7b72bXsqXB/Pi7Xz1fHFuvMSwxvvK7F4IY/MUZseCDfOo7UVjcTdYJaAS7FKjCIIYGeTdDTYVvR4ejlEpk7OAByYlskljGIr3+rQZK193Rat5nVgieDZvBY0SLvngrM9wazsK13WUpO4gVxJUoUNyJEfKvfbKlOe0LeFhgnK9touBAS25747KkhQuKXcTqiWE/+82z08wcQ3qtbuWCtorUbzXWrpdtCG6Ppww8bGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by MA0P287MB1090.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:e5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Thu, 1 May
 2025 05:46:23 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::8f1d:511d:2d42:bf5c]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::8f1d:511d:2d42:bf5c%5]) with mapi id 15.20.8699.019; Thu, 1 May 2025
 05:46:23 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: krzk+dt@kernel.org,
	tarang.raval@siliconsignals.io
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx8mp-var-som: Fix LDO5 shutdown causing SD card timeout
Date: Thu,  1 May 2025 11:16:03 +0530
Message-Id: <20250501054604.23368-1-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4P287CA0122.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b2::11) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|MA0P287MB1090:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d8f50d6-56ab-45ca-a2e3-08dd8873817f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?a/pVjV5w+e1yrnsjJWvrxKrxMA9Th2QILzt0sKoCjKioSr13oFSmJyB0ehGc?=
 =?us-ascii?Q?/qRuqOC3hgKeQLD3UYGSa22JFYHydVQDOs4RZTzZqClAsrasndWmAb3Fi9jX?=
 =?us-ascii?Q?zAJC+w7ZeJlDCzGsA0A93sv4vi8STMlMmJlV6ixXOWws2cV34/SP8H+9nKYR?=
 =?us-ascii?Q?4JW+TKNTmt9m+WyiletW8sPCdPpBal2C4Ba2X9O4j6NHMJu+ngJDiK4RYN88?=
 =?us-ascii?Q?BNx1o+9X/C/Cap0W75TJs8tj0pN2P9tOGhs2WxU3QzCeOihkFgoPzp4IgVXV?=
 =?us-ascii?Q?mJ2Bjismuja+QQt/VHBEY3DUmrtg2fTsUGJuW+xrYSLulQESqKHzdqndiyaA?=
 =?us-ascii?Q?qkfS1WZgSNUPlip0FCpD2btPNbxPhl8P1eYm9HBdokpQo9IfxEZUkPdJYkRM?=
 =?us-ascii?Q?v5E33c1Foe36A1u5CPBBocbFgBTOce1QbC+m/xSvfajNYs4HGemKVKohO1At?=
 =?us-ascii?Q?JEgIInL/zh//6QHf2LoACOVseAGlaHaxezETeHZHKV7iodIil8JHhL6/ihQG?=
 =?us-ascii?Q?/qst5Jw5jjTT8lr0T8A9L65Ck3CRYNDBCy8Pj8qZ4vqJob04wpEMx34EoDOR?=
 =?us-ascii?Q?qiU8jNIwQLENagQtaxczm/v8SxiIHHyksqkk6Rl/p/f4xr3AEvqhsrmEG+XP?=
 =?us-ascii?Q?FaiQndSQf+0I65X/srJAGwJo8u2BIDq+2VTTUBY5Yt1W5gw7nbpJxs3K0EF1?=
 =?us-ascii?Q?V2VWY5ljokr4a1hSjF+LHlTkIOWxCBhf3YuqUWJ6gvXsOnDRvrLlAdpvftgT?=
 =?us-ascii?Q?smRkbCmqJCQViOfiZh2QyNla5vGjE/plNMhTGcNQaJlV9M7fXVEnWcAHzebF?=
 =?us-ascii?Q?isjIabgO9X4lpNfVuwVZuaxc0VfzDcgPAaix3sij2XhFQ2+9pRAVk9JP1JoG?=
 =?us-ascii?Q?y/GXGV4zyKeRVMA5+/Gbl9XtmoYVOcNFOk0JUbNrINkmUySCcT6jv6COAnEz?=
 =?us-ascii?Q?6ninxyCh69dXjJ1HaYsDmj2R6Kd+WOgvmgMbcV/ULFpvfnV7k7Lp2svD9jP4?=
 =?us-ascii?Q?l+YbJ2+1cS9933P9p3N0U2XwHFd0K7TkPCiO+XIrwSpEyne9feTaqtBF5kmv?=
 =?us-ascii?Q?/8Yzq0qolG2kYZa7LuOpgTwAlkoYLh4zD5lAi1pK0bF0NA694jYc1c9b41Ut?=
 =?us-ascii?Q?SajLNGJSoJPj9Ycs8NAZSPMWBm9DBXPACC4HVo4Kj7OSP0it0ev+CQrLbkrr?=
 =?us-ascii?Q?KD8a03VIruc9EdNq1Fhpm6AlhD11Cl+5w4ndozQPoHuu2iKk90+oX9armwYK?=
 =?us-ascii?Q?8XQ/I8vU0Olg8eB046AAvSYGwJTCE1zR45jj3kYcKSAWHnDFMkyf4sxvH3XY?=
 =?us-ascii?Q?kjmRxOaGOvpB6arpZnX1BtupTVWwZM87Oo8evWSfjBvHpKJA1iC4o8mCDJQk?=
 =?us-ascii?Q?kVajNbOKfIO34P4Rr77eXcfPwPQrUuIdCTbXDYCS9E9mr6HhSd7iNTtYkWR+?=
 =?us-ascii?Q?HP9lYh/1ckPmkoic2UlKKJvPVIT2uNrds9chTkmt1Bem5bDojtQT/w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LicdPpW8BEjA8+hW09r/AJBxQ+EKbyILLC6QRfwg6sxZ723J4x1xG8vAYfI4?=
 =?us-ascii?Q?XTZ1Qocy535cfeXRmtgtXgq8y+40vcq4/u8X9rk2x4S34a2dr2c26S3f22+L?=
 =?us-ascii?Q?5x3MJKIr8nMp7O4xG+Qbr/wm2GOHbpIkdqiZXCEvSsI2MNJjh/172komUMZg?=
 =?us-ascii?Q?lyOK6POJutGLxNJt0XxZd4NV0pYyhJKVFIR8GoBI5/fWzogUmoRngGFQCyuR?=
 =?us-ascii?Q?9QhTXKJDss7eqo1SE4Chu0/E0l+eJg1PPt3uj+Ru89CVMYJCJcY8PxLOpXBP?=
 =?us-ascii?Q?XCs/UwimT6v1xK4ApkUv8NGV4ZAkoofu5P56d7HmxMNaQqnyMDLZNL9hV7mh?=
 =?us-ascii?Q?P0BSXpLSub21UT4M2SXztpr7J5VanKY4Ew35peuFR92KmRUADyd4EapC6HcH?=
 =?us-ascii?Q?J3HhiAZwHNbCRBTlE+IGnkj4Ck8+7v8CwF6RPT521cVbeWLKcNNRcs3DJ4aT?=
 =?us-ascii?Q?lxybKtAbtPV2PERAilsKzS2rX0EqoVoqWobsOTHuzBmiMpTJSAy3yI5vNamC?=
 =?us-ascii?Q?FKZ3ycz3+sYrxrw2R1GA4BZd8OdqfMqC7YFTcDKu24/UTzd2nxxb9NTsiSEo?=
 =?us-ascii?Q?DgcdXF4MtJVK75lvQlrQlpJzkKqyI4xc00h72RHkWc+5SIisLnlV85PsKGQx?=
 =?us-ascii?Q?4OPiRQzvRuqE0BgiNxKjhRdjEEKyBtmZAnPk3E3gmLaswbYuHTyXSpZkgCY9?=
 =?us-ascii?Q?Dg7mlCFHHHVhMHpKBSFm0xEQVl4g/NxB5cQ6KtXEt3K59JFpaI+xs3M4T4WZ?=
 =?us-ascii?Q?M3aC+b7rPAaH8TVYmV0orJWriQU/9VxvUdvupuFAPxeJuc4P6qhvG+7VvgEw?=
 =?us-ascii?Q?ieULd9P4maRoAHXWnEFEVBnfvmSDpl5C9LjApcPVXfvyseKWLJ06OpWeiT/5?=
 =?us-ascii?Q?4n7YeXu91Hq2Scs/249SVNtFHr/Cf90uDZZcmV7mEyfiFcE1kVMvZEatLyGR?=
 =?us-ascii?Q?lbzDDY/8OoiQJo1mmXRRXq9aM/lL1NI2kuKcPRIDi2QCLA9UyFxU4+Al72SI?=
 =?us-ascii?Q?dDnMG9Bwq7d4sIGwytwLnKrN/7tph0J8BuLJ1zVV5ETGYngBln3kvTILi8vS?=
 =?us-ascii?Q?k0OHqWTXjJPoPH6+kps2pBDztucgseVBp+r918+Cs5LFRW3bQoRzWVoCezEP?=
 =?us-ascii?Q?B1Y0P0OLpXOtyRHa1avAvvsS6fGrhFF26lMcjD2XtQmTKEj+iS83AzBkKCRj?=
 =?us-ascii?Q?MsNGaLsu22DCFhbct9+sz63zHpW00mm48NUfEL1jqWva7FKfiMIOyWJnlPwK?=
 =?us-ascii?Q?Tk/ntY2VYMTG5xiMDjRcROodVSrg9O0oADTiKBd7hgEmfZqZ17jzvas3ET9J?=
 =?us-ascii?Q?HVqBXgSgoCmYcRIV+Y8Q3RtAi2ySZtU4xWOu8E2IDUl5GyUUmzjLXHhOTkLh?=
 =?us-ascii?Q?JGMqzM3BcgJrRhGDhQlYc7EoDtnjBQ6qZ3B0jmp8MJk9HZmt3BdA6ulLnOaB?=
 =?us-ascii?Q?7fWFeQt5Oane/nDZa3+kjDAgsrNfOYyQ/0xfl4eTzjExkIP0uxL7L4YJ9c6u?=
 =?us-ascii?Q?iM0rNqn5mSEg1FtBNUkrjIbrCXorM+59nYDvzHQo/dUTuHwgd8uWl4Yw2lcb?=
 =?us-ascii?Q?gZISEUXz+cP+ATzAf4iXfQUnPd0XvZwFdZRlPSTpB05MtjLzXAD9PMk47TWy?=
 =?us-ascii?Q?glCqrUffXAGCJWVp17vJ5Lo=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d8f50d6-56ab-45ca-a2e3-08dd8873817f
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 05:46:23.3050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YMBt8oX/8b4j8FBhGzvGwvs607mUMip71z5jQF/+18H/4I77TwF7P88Wex9gEw5qJmdiKrvsgCEkUrw/xUuFmnlWkeOkjf1VtMve8b21qcQ2i3GQ/R61yRbz8YUqSo0m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1090

Fix SD card timeout issue caused by LDO5 regulator getting disabled
after boot.

The kernel log shows LDO5 being disabled, which leads to a timeout
on USDHC2:
[   33.760561] LDO5: disabling
[   81.119861] mmc1: Timeout waiting for hardware interrupt.

To prevent this, set regulator-boot-on and regulator-always-on for
LDO5. Also add the vqmmc regulator to properly support 1.8V/3.3V
signaling for USDHC2 using a GPIO-controlled regulator.

Fixes: 6c2a1f4f71258 ("arm64: dts: imx8mp-var-som-symphony: Add Variscite Symphony board and VAR-SOM-MX8MP SoM")
Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
---

kernel hangs during boot with the following logs:

[   33.760561] LDO5: disabling
[   81.119861] mmc1: Timeout waiting for hardware interrupt.
[   81.119872] mmc1: sdhci: ============ SDHCI REGISTER DUMP ===========
[   81.119876] mmc1: sdhci: Sys addr:  0x00000010 | Version:  0x00000002
[   81.119882] mmc1: sdhci: Blk size:  0x00000200 | Blk cnt:  0x00000010
[   81.119886] mmc1: sdhci: Argument:  0x00844358 | Trn mode: 0x0000002b
[   81.119891] mmc1: sdhci: Present:   0x01f88009 | Host ctl: 0x00000012
[   81.119896] mmc1: sdhci: Power:     0x00000002 | Blk gap:  0x00000080
[   81.119900] mmc1: sdhci: Wake-up:   0x00000008 | Clock:    0x0000003f
[   81.119904] mmc1: sdhci: Timeout:   0x0000008f | Int stat: 0x00000000
[   81.119908] mmc1: sdhci: Int enab:  0x117f100b | Sig enab: 0x117f100b
[   81.119912] mmc1: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000502
[   81.119917] mmc1: sdhci: Caps:      0x07eb0000 | Caps_1:   0x0000b407
[   81.119921] mmc1: sdhci: Cmd:       0x0000193a | Max curr: 0x00ffffff
[   81.119925] mmc1: sdhci: Resp[0]:   0x00000900 | Resp[1]:  0x0076b27f
[   81.119929] mmc1: sdhci: Resp[2]:   0x325b5900 | Resp[3]:  0x00000900
[   81.119933] mmc1: sdhci: Host ctl2: 0x00000008
[   81.119937] mmc1: sdhci: ADMA Err:  0x00000003 | ADMA Ptr: 0x4003f204
[   81.119941] mmc1: sdhci-esdhc-imx: ========= ESDHC IMX DEBUG STATUS DUMP =========
[   81.119944] mmc1: sdhci-esdhc-imx: cmd debug status:  0x21b0
[   81.119949] mmc1: sdhci-esdhc-imx: data debug status:  0x2200
[   81.119954] mmc1: sdhci-esdhc-imx: trans debug status:  0x2300
[   81.119959] mmc1: sdhci-esdhc-imx: dma debug status:  0x2400
[   81.119964] mmc1: sdhci-esdhc-imx: adma debug status:  0x2594
[   81.119970] mmc1: sdhci-esdhc-imx: fifo debug status:  0x2608
[   81.119976] mmc1: sdhci-esdhc-imx: async fifo debug status:  0x2798
[   81.119981] mmc1: sdhci: ===========================================

---
 arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index b2ac2583a592..8d50e8382a1a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -35,7 +35,6 @@ memory@40000000 {
 		      <0x1 0x00000000 0 0xc0000000>;
 	};
 
-
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 	        compatible = "regulator-fixed";
 	        regulator-name = "VSD_3V3";
@@ -46,6 +45,16 @@ reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 	        startup-delay-us = <100>;
 	        off-on-delay-us = <12000>;
 	};
+
+	reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
+		compatible = "regulator-gpio";
+		regulator-name = "VSD_VSEL";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio2 12 GPIO_ACTIVE_HIGH>;
+		gpios-states = <1>;
+		states = <3300000 0x0 1800000 0x1>;
+	};
 };
 
 &A53_0 {
@@ -158,6 +167,8 @@ ldo5: LDO5 {
 				regulator-name = "LDO5";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
 			};
 		};
 	};
@@ -205,6 +216,7 @@ &usdhc2 {
         pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
         cd-gpios = <&gpio1 14 GPIO_ACTIVE_LOW>;
         vmmc-supply = <&reg_usdhc2_vmmc>;
+	vqmmc-supply = <&reg_usdhc2_vqmmc>;
         bus-width = <4>;
         status = "okay";
 };
-- 
2.34.1
