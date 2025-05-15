Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012028.outbound.protection.outlook.com [52.101.66.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BD3220696;
	Thu, 15 May 2025 15:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747324624; cv=fail; b=tkie4sV6PkctwmSPiixIoTDm3tZMnl0RhX2jfH/PcBJjVxBbKqfd3ZyJIM95mquf3qNZ1LTsxo0Pqvqi4FS+4z7xJdklQ0IVoivXDdTBTjwQRUi4Jat6S8gEVSHu/YT9sS6Wf+87ZnsD+ZHQ4Ydv4OCiTsTgRGSKyIayQ9imU10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747324624; c=relaxed/simple;
	bh=/08JVBhOIJkDWGNGS3PN8IZKmeOPrseWNjaUnb0qum4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QKPXbgV+ZhNpldzj2ON66lZrj50dE/JHrkGBdoCq/zny5HKj+E5D+j2/NgqOL8dFvrTPp43YuR1EUJdQmPl7g2SO5nQxZJqabSSn4T0+R97goxlv7GPNJ1qGcjMMLcLKGAMviGG+yogYXs3gBena+Nl48tDuR6hJik9fEkpHe3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=b7+4Ru+u; arc=fail smtp.client-ip=52.101.66.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="b7+4Ru+u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vdysyxGPoeHmWiV8Xm4F+CAoRyIGLFjEU1OyjATqtdqT5gkVZDZiIuZhnsg0zW8UPP/ICfTy/sdJpdpyDvJpR7lZYrNR1ajEy5FKp22OXzLDlfW1w6fDMgbgVYjNYK8UULAZI6T0rj8LbbRCGn8jxiud1r5ccxKkYXtJKtRjzBrbK6uSBY6Gw9HmdXGyEfTHT1M0yZPIHle6/J1wrjnMpXlbK1Yh4OVpzEeNzaB6dkFh4ZHXkqMRmmksHkyfoQAZxbFFMj+mU6+yNXcKGN1k2aBNU2EgMwqk5joT2OuZCe8T60s9QrGT6qxfhOmHo+t94QxtTBH+39ldINtVOzbw+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LskDpy0z9zp1iz6TPkYwlV28azk9XNtfUaejfhX6N7U=;
 b=lB13RPssMlkXHK2IEvdH57LorrFidVI7SvifhYeHWkX6IsSC48H6ZQatCmCMm+PBYwoOBUvXmPImRseqp6c6CRTg7p9xZCBt4xB1GijuARaanVJr5ugM/8b5w87A4VGnNqFsHqyaazjrK/bMaWxHtitGqRb7Vf4hRS0/UWGoF1dFnQXUI7IRIxQDpaRziVP+WJDBVjVOapGlExZedEHxHDt4SwZCI+wUv1CrHzXYzAO+RZGDVRh2K7Ktkp1c5TRgvVvdd4KR2qx1H6WuhA/1u0JoYdLWNNVFFCkpPjehCtnZFXxNDLf39ZrX5Y0hARFF7aZWKo20Oa5oYW0A4ICtdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LskDpy0z9zp1iz6TPkYwlV28azk9XNtfUaejfhX6N7U=;
 b=b7+4Ru+uBtQyJVexARv6QukUhjmDJ7EIddhpC1RDc02XFzvoq4nTBNlX0Fmvtu7d7VVBTrH8Z0hsqvnF0uDtACVA9hObFxxLr7U9Evzm2NeyrejNMoJQyT7xL7SxDU50oKb3E7yuGmlzUK+pDjQqts6k/HBtGlYisO/A9Usq4ablKuPdj5cfyhsW0u//IDOaiOUaUX2XfSQeeQs9zh5b0TnUVLZ7I+bweyPP6adxEWPoY1pe3DX2DDgzwL3VkeVq62MfJODNJxdmh+61ckgnPQwflAgmEnKhlKeC78j5VVACxkuo/RBB0/TI4KCXWZOLp629upvisOaibRpZH9VqLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by GV1PR04MB10197.eurprd04.prod.outlook.com (2603:10a6:150:1a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 15:56:55 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%3]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 15:56:54 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	vladimir.oltean@nxp.com
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: [PATCH v3 5/6] arm64: dts: ls1028a-qds: make the QIXIS CPLD use the simple-mfd-i2c.c driver
Date: Thu, 15 May 2025 18:56:27 +0300
Message-Id: <20250515155628.233007-6-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250515155628.233007-1-ioana.ciornei@nxp.com>
References: <20250515155628.233007-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM4PR05CA0013.eurprd05.prod.outlook.com (2603:10a6:205::26)
 To AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|GV1PR04MB10197:EE_
X-MS-Office365-Filtering-Correlation-Id: dc663f11-fed1-43e0-7e59-08dd93c91d76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?v2mLlp5bqL6QRa3M6AQXwXQ/aTkOP3rTQdEkKwnOaXawwB7lbmJ2YHPZTUEr?=
 =?us-ascii?Q?+nu3dlgn4m2WSa1VNtO8rwKS12b3DpAmamHGS4dCAY/rHoZQ8maXoef+fEG9?=
 =?us-ascii?Q?4fTbrtN0jHPxHdU17qLHFxfllAtSD3YopeC9c/qjkplk+LQGy2RvlxaPPuV6?=
 =?us-ascii?Q?BoHG3yYHCz1eKxbdYnjNVpM8vLtPqESAT+OMq2gpMDg8P2gmQBLLX8cajHAu?=
 =?us-ascii?Q?DiNqmJUDntM5+hMS9Px9RVP3BleCvY0UqRdcF0Xr6qndVri70tMnXfr3151n?=
 =?us-ascii?Q?96r+DjUe/MLS0H64yzx88Xkiwl/sm494Vmq1eCkFLU4esJvABBfsObKPPw44?=
 =?us-ascii?Q?uQ73mDan1mIMRmIsYhMHkJoJJtDAnIR5FkDlEaCNASe9xILE3CB42KGh4GBG?=
 =?us-ascii?Q?J7vzWhL2JBVs6ecPabtE/F5kWxUu/a4I4da2hjz3gu8tLpOxoHsgRasEasv6?=
 =?us-ascii?Q?7NC1DID6rl8f8orGQzExSJHYorMNGHOYLtxMxJS4WXzL79uiRXOi3AMjOVZG?=
 =?us-ascii?Q?50WX0j21IHKE3tRQKlzhcNFBfZZ6/zmOTyH1OCDYM3jSmaaI6j4orIoK1smg?=
 =?us-ascii?Q?50vJttzp5vljLNMdsA2vUFbnCZ4N6syGivnQv6wzXGEfGOzpJEisSON2qIe1?=
 =?us-ascii?Q?eAurRwAtxuwALJ+820S0rkdXZAki2e0jDDuKOSnf5B+fFamzAj45yxUcbNYF?=
 =?us-ascii?Q?0KphsVpI9JSH59HgmuHr0baVO13a32SfTtHnQTNlwcUWpBJkhWN8F/Nkcr5Z?=
 =?us-ascii?Q?4B8zaxk4mpBle42Flena9M+KV8Rqa99ll55IaYKlijdSUZ6hxCcapOUjeei2?=
 =?us-ascii?Q?725rSgqtdqZBG9iAJm8zbpWY2KTdVZODBbanSR4XAos1aSdsMbfvCzEHC8ay?=
 =?us-ascii?Q?Po77MY+ALNkEZF6+hOL+zG6QG2tVOpgfkUT2TKJKKHIPOZYcZAzwfkiK/85r?=
 =?us-ascii?Q?KYNJW7XjEUCfOacA8bjEpiLPYeuVdEaCE1QZ1TA8cT/+wrbdoLOv1C7jxzmd?=
 =?us-ascii?Q?UhVRZS6rAHJze75unifan/bFxjiMU0+vf80bdF4T2Yxkg7XtWcacieYaP2Zf?=
 =?us-ascii?Q?hNWBledDyNcxQS++uxBTsKAZzqFjZ+02T7xkDGh+iWLW9PVSiljq+SPB86nO?=
 =?us-ascii?Q?2kcnf51+rP2ghfdxE6dW17XGHIGBzQD1fQtPaR5NnpRhjZKvh8oAlnbb78Q+?=
 =?us-ascii?Q?JVUTIXD5MMYOc9S+JZbDM9o0FTL/uTtf/zORDI9P3Uq+iArrbxxSr/laV+GU?=
 =?us-ascii?Q?q259/IVgzU5TgTi/zyPJsDPpAsEZ05MvcHHXNIGIS/BothFgIRuHmNy8opXu?=
 =?us-ascii?Q?z5i6YTp33EoeeT1tUokZkQfHGj2W7f2ICsone95BPDXRUffkmkgdmik66lTS?=
 =?us-ascii?Q?SXj9uoA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RPe2UVfqYowaBj81qCbk34FnSI2XXQNP6x3ABEU1Ow7xJsJ/xuJ0IptLRkEk?=
 =?us-ascii?Q?l3oxfMZ1CjTVoJNlSofWjA3e9GQ8aU0qEgCDE7M/YElgA2t07eoVx4NZOIM3?=
 =?us-ascii?Q?ajfrjUg7FhJF1CxPvHr5lpPsCAFCO+GN8YHKKjBiBpZrJMakc3P4Z2y5nGL8?=
 =?us-ascii?Q?3dmUK0y46Xj5XYNvy6RVZL8vvi0p09b9X3u178kIjo7P1Q8mxUhQzZbVQXPY?=
 =?us-ascii?Q?k89W6lDynxy/sQ79scvs8Q+/O57hXHb1dHaWSYqHvbe64k/aB6zD0zbGLShW?=
 =?us-ascii?Q?aLE1oZWF02HKAE+bXhtVY0X4mKs9UrK+tXwmwldnBOafthDk/X4prJsaObLS?=
 =?us-ascii?Q?wjLXwkE+m7FWujVJUMOsPYQ72swWXkHJeFoo2Cm3k94TC28F7Ut3MFvuZGVQ?=
 =?us-ascii?Q?fEXjPCROb4bL3li877KJ3a2MgSzeO1lwN0UJ0Jt8kPDUnBi0RBKaGtLx/G/O?=
 =?us-ascii?Q?PlqwK3aUKUl9+BSrUBd6/Xk9kwXhx8u1Ir7SSZuDMpjcfTEd+GEeJ9Ultk5/?=
 =?us-ascii?Q?87EygtAj1GogB7wpL89TKVj2b029Eqpdh9i/LiSge+he642tJQtjuFIsGG3X?=
 =?us-ascii?Q?f2JG7hrC9WZw3FH++V1ZjW+I7QAfduolNBhN45LxNIGd7M+t6BF5zDP2atJ5?=
 =?us-ascii?Q?QEbxjQMDxCYjWTk3oBZtQW9YOm++uCg1Hslq31fjF1bnKCo7Oq00Jj1M4IS7?=
 =?us-ascii?Q?bAhovTlf93P7mJjLQz3fE9bj5cgZZZsZAUf49nkvFOo2R6bQ3O2jBazL4qwY?=
 =?us-ascii?Q?KzSNG4g1IFCXh2hzKf2zbyTAyOrYZoyhMH18JoKtuMLEoA8tCiqVzxhUrsfO?=
 =?us-ascii?Q?U9VQPf96Y9+gRVPIk8xtOVKiXMZMEyp0KcdqDVUqJrousC6g5iNEWUIdwxxP?=
 =?us-ascii?Q?q3c6TpdM77tHajpJVR6qjizDftu2U7XKDbZ0iM0ouQRqCBMn68LH5sd8fMdI?=
 =?us-ascii?Q?vYtsDGqORPQEEPiTftU1OfzqlbNgd6tzHTiDsFIiVA+jSizdI2QFB4BhoXnu?=
 =?us-ascii?Q?Z+g1Exc+90VzB7cOG4p6898hzHlRGNxDPUOt6B4+wc6in/CZLGs4BJNWiwlu?=
 =?us-ascii?Q?F525bot7YuNvwr0+QxXnVinjavHg67nTN61ew1Qkx/08Wh6V9NLYMtmzTT+Q?=
 =?us-ascii?Q?it19YZgpQBECOOdDqXxDdT5zcj9TS6UGpp/63ZC76v/uIKQr6XGOzBAw7c2m?=
 =?us-ascii?Q?+qZ+2dIt1PHvT8tLKHhFYka+Fw4maP7gL8F8BPHg23loiLxi9QSTJ1ocf5xt?=
 =?us-ascii?Q?daFgLnERjtdIQ4S8RWBVZcshByxt47diAJnr076wJREy9JMNf7jHuJX5QN9F?=
 =?us-ascii?Q?fx++MMibfcdl7IM0S4cX03sAYYQNWPwYyG65npishge0ValWoxsGgycv4vcT?=
 =?us-ascii?Q?C3rTsYUxeCsOGU21YIBZ/baTP2OHT6aI1O79Rr6WI+lSHXv8TdBMFRW9/qlq?=
 =?us-ascii?Q?uGS8cilIC8VBPDjrHcfOpTsINaDUctZtAqSLIjHZk6AMUO/QkfYbGht1GDTV?=
 =?us-ascii?Q?1ZsoS9qqu/Afg+Io89OsLq15MOao31KIg0z/MzSao6HMh/d77RbbWdHL72eq?=
 =?us-ascii?Q?sWJNq0iN7UtrjQLnALzTSvSsWMCVFLawrM4W0G9H?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc663f11-fed1-43e0-7e59-08dd93c91d76
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 15:56:54.9534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: scOJxEcFR4oUP6PZiu+0OsFS5IBq+3W5IygQ4wMDlRbmuEyynXeYD8llJxmBJTqvbhjifcMcgfRwnZ8F75nIWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10197

From: Vladimir Oltean <vladimir.oltean@nxp.com>

The MDIO mux on the LS1028AA-QDS never worked in mainline. This is
because the on-board QIXIS FPGA does not have a driver that could probe
it and register an I2C regmap for it which could, afterwards, be used by
the child devices - such as the mux-controller.

There is a downstream driver for the QIXIS CPLD:

https://github.com/nxp-qoriq/linux/blob/lf-6.12.y/drivers/soc/fsl/qixis_ctrl.c

That driver is very similar to the already existing drivers/mfd/simple-mfd-i2c.c,
and the hardware works with the simple-mfd-i2c driver, so there isn't
any reason to upstream the other one.

Since we want the QIXIS CPLD to have child nodes with "reg" and the
current format lacks that, change the compatible string so that we make
it clear that by using the simple-mfd-i2c driver, and its
fsl,ls1028a-qds-qixis-cpld compatible, we expect dt nodes children with
the reg property.

Since the QDS (QorIQ Development System) boards are not made to deploy
any production software on them, but rather made to be used exclusively
by engineers to test/prototype SoC features, breaking compatibility with
device trees is not an issue.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v3:
- none
Changes in v2:
- updated the commit message to explain better the context
- used the new compatible string

 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
index 0bb2f28a0441..40e1bae52ef5 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
@@ -338,17 +338,18 @@ sgtl5000: audio-codec@a {
 	};
 
 	fpga@66 {
-		compatible = "fsl,ls1028aqds-fpga", "fsl,fpga-qixis-i2c",
-			     "simple-mfd";
+		compatible = "fsl,ls1028a-qds-qixis-cpld";
 		reg = <0x66>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		mux: mux-controller {
+		mux: mux-controller@54 {
 			compatible = "reg-mux";
+			reg = <0x54>;
 			#mux-control-cells = <1>;
 			mux-reg-masks = <0x54 0xf0>; /* 0: reg 0x54, bits 7:4 */
 		};
 	};
-
 };
 
 &i2c1 {
-- 
2.25.1

