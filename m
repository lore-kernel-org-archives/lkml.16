Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020096.outbound.protection.outlook.com [52.101.69.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98538566A;
	Mon, 26 May 2025 12:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748262697; cv=fail; b=YZhJ2/VNlHRrweTjUApaa52hmEGIs6wzhSf40tuD8o0bd5mJGv+Wsrm7uMjwIjICkMo2ILbk4MocvaxGDXnnxd/Z2WFXwujNQuIbcjpHBXCdIHHMq2hYzQqKEhe9fj6pizMgXzYwlDau8okp2yRHvNVGgKQDe020s07g2+ieYs8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748262697; c=relaxed/simple;
	bh=s00D/vLlyWj0S4qn/sU5JBjcYDfXeIcNghxgLFCvo2g=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=qo+rIr0QuP96U970dpiEqcS5awJNf07/czdyP3247ua2rOOywX/lq4itD7dhzvjfa2eOf5552Xo/aymKlI88XPwizugwChMcnrqxSNsnWnqu9gCBC0SS9i1ixDpWGd7cbhqnOkn9lo//W1O7AwywdS0AdgB7lept7xtWnMTW1b0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=CyB2w4SO; arc=fail smtp.client-ip=52.101.69.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="CyB2w4SO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LhfrMOl5lZMcydaKPQKlDTeIiD/Rfyymzzbl2mXkUIuD/++BIN8chjO3+8bRljxZCi/230QXiZcRJdwW3nekHsiL1N/1kiQUulN3WHAZQJmpThpWbY3XGCylgiIBAw0ED/fl5yUD//uw12o8RUiv7o7VqNHaNwlTrVhcj3A3p5do0IHA2p89woJgHJcCDAdb5o4ss6XMz7DhLvF4PCPUoqC7ErW5opAOw7DLFR7e3C5enp9MPtc1nEHKieWuerc/C57gCOVmuygWAaQMiH1yrp4VlvsAqW89mihzCJT86fBU6OSTZ1uwU280k64uyDW2vTHh8DmbrUHkBxx2HJMMAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxjmeaZkiGOpF02C1gi5XR3KTdfglazpZGe4jPoyrn4=;
 b=NklRg+93tDEilOZ/Is20tf96+brxwYymwwJMVKR2TB0b6XpzDP3lvXmJumuBWjGWVeoTjZxaWdkEKEpzrCQPKWKT/WBnGaoJL4Lh4gxnDyMM2/mR3aMnq3Faer0ye9n0l59jVEz7HkIqQvVFXx3gDgz0aZsyCxUkivL8YfVVBlUECfHouvx4K3YIg+q/fsaeQp04oB4gGLX6JqzrRiQISUYP46vQYJ7Ww9IO4njmi4kv6wpAUnwiW0KTXommljwPynjOIbtAQedrbz6j2TAAEizeLEocGrR4Y07L3ySGJjZGRgGiQBefezbJ3C+UCMxlaph7n7qCib/4cOmHDlcpqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxjmeaZkiGOpF02C1gi5XR3KTdfglazpZGe4jPoyrn4=;
 b=CyB2w4SOXHKma8zUksW+J/mYRevRk/W/p6yhJKBnni6nysf+qxPuFqDzqronrHg2e4OWyj4TEH7ETjLGaZrRtCAg09HQpg/vqWb8+ZCLcf5F2qCuXzP2xCi+xkrZ46OBpQ4fisauKXPW1bldsidkTde7P3myJllH3YDJpi0CJMtaIn02xxRBMPMP65IrsNrxIun7sZb0A+Zfq4/Wu5xWvcAed/LDLB0WkwvhX6n6nBPuDEyHaeG/sIuQCK7PGW1b3Y6pU8R98C6G5TugEumgTYumVWp2IA2lJm6sRfOFJQSeiJEDM3kJMOo7cz2sF7quwajoKwpolkyDJ/R0q3GK3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by AS8PR08MB10028.eurprd08.prod.outlook.com (2603:10a6:20b:63a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Mon, 26 May
 2025 12:31:32 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.8769.021; Mon, 26 May 2025
 12:31:32 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Frank Wunderlich <frank-w@public-files.de>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v3] arm64: dts: mediatek: mt7986-bpi-r3: Change fan PWM value for mid speed
Date: Mon, 26 May 2025 15:31:23 +0300
Message-ID: <20250526123123.2515967-1-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.47.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF0000383F.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:5:0:14) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|AS8PR08MB10028:EE_
X-MS-Office365-Filtering-Correlation-Id: 430f7db3-9d6b-4725-7b34-08dd9c513ea1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/s/ccwXjdzIdZWXQOgf+CcUXdIzhnCX7b2NHBsfwMuU7KQuihyPfqlJFGhdl?=
 =?us-ascii?Q?s0sxQwIhwqar0gw2MDN2jww8Dw4PraB7sIZbfM+/BMqg2TJK7pYVG+iivuTn?=
 =?us-ascii?Q?WhNpr9QXO2S9mV3v0TnSLT9kOMBlqG19R1v+JHnFvTesroba143x/tMUwkkc?=
 =?us-ascii?Q?tI8cXeBJlhe/qrhLg5eUjrLZmQRyDWHKay9OzvAWSb15LVH4MeF3KwO2QzII?=
 =?us-ascii?Q?iW+6ASktkEWiRGWajAixllSmx6i2hHScoW7x2Dn4h/NgDd+k39bJ8/9Y+Iu3?=
 =?us-ascii?Q?Kn4aB8CsFSR8c5OQbLlW7hGJ31DJBtb+TfeQAnEK9ZlXeCwlLmmOXuhIFYXh?=
 =?us-ascii?Q?U5uIX6MiQfRnESAOV867RP5gD2dKrv20TWtl3+pTxXDdgc351epB0HaZWrbt?=
 =?us-ascii?Q?fPRPZ7bt8F+bC8DNIkqG9fPgRXU+rjr/ED48vtDYSwNxpUjvls4uwIh9ReXi?=
 =?us-ascii?Q?SIWFxAIdNRr23hFgJzWUyMnQFcJqBV6rSHzWB8N0pnLurkswxXDJMrAQKy0j?=
 =?us-ascii?Q?Ae1UMf4ztFeBTZHFyElivCEcyBIOCt5TzD1XAXFGTAMOiIbmSvBDNJNUJQwc?=
 =?us-ascii?Q?8BlLkWonpgOZQihKGp5n6n7BhLbyPcmb3SF4fLUoh215n7sqCAkdLfx7Ni/U?=
 =?us-ascii?Q?DH8e0rEz+4tN+lCqRxaDRrRA3Ghb7NXD78U4FYYPZPzrXjm5ry2x2oTNNs0/?=
 =?us-ascii?Q?VnPXpUBLRanKchpvx5yrS344jThxXrhA6L5MZ6Xx02djzfax+vUPraS6nmhy?=
 =?us-ascii?Q?JCI4XkAUV5uTyR44dM/W2Oz/QOiqb3Vtqu2mRCrr7gsAjY/TcgTxRiDiqMOH?=
 =?us-ascii?Q?yDbesH+fv4AxkePxL3c7yEGwFCGQBZt8zskk3FHBAkVc1n/bN5tQY8ln3HIK?=
 =?us-ascii?Q?AzxsadLLRge+oxFM+U4GizVMa6T+yNIx6V2+xAXZCqNDpLYOKna+26jBAU8c?=
 =?us-ascii?Q?beiJgr5/ObOtiXk4FQeCWsXIuzL8UIZI2nptbHGL95TBjy4u1inbuLnayo34?=
 =?us-ascii?Q?P/Ta+4ReNT+NxDaHH7OchGydDJd5YAHhX96sJt5ZaCJyqZBPCQC40TdwudkR?=
 =?us-ascii?Q?tiZfb13yljLrG+LLFQ6rqC8LVQAGmomZO+B/lZpMp+tlC0Fj6kCQDSVExefe?=
 =?us-ascii?Q?iIFqxS/M6NqV4gDP6BNSy87ow42hJTq+ydvNrjRMwGjlPqrvJqR1W42UHWWj?=
 =?us-ascii?Q?/M5pv4VSk/gUwV+pfT4IB/0gHYY+O2d5Bu69Bl4FgoND7DrXxOQ1Vyz/OgXS?=
 =?us-ascii?Q?EcXeha9DvPmgZ/K/mdZ0ptEffc1EVpx3XQqmtuvSPU70/2V48zP3QzK3ayLj?=
 =?us-ascii?Q?TRe38ghpCgMRgEsx686I37xkCyzzXV9BahajJwBgCaMz+0dZ2gVWuKYEcnGz?=
 =?us-ascii?Q?/a+Pt1drzDSwLSOgAb44ASbI2ctIFgxHgSQwvnSnH9Z2GA1EJYrSvLWIuwLG?=
 =?us-ascii?Q?pxnmVjTCmzuJDoelOSkUNVF3LkXlwfCFXW38dMwlxIlSoLAMyK2T9vhhnZQD?=
 =?us-ascii?Q?NZyYz71dxMnxAUA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XkQp/gE5ucBxtldcTnYjC6mFmP4TofnMuoMf6cvKMHwEICtdj3jqPrbXmstL?=
 =?us-ascii?Q?sp26o2skPIcNaBSgvJSTAx+VX8tO3Ki4dPP18jOGRiqvJ06RSKMUwCnk4tID?=
 =?us-ascii?Q?zsGvAl62Y457JAnUVDTbyEE7yi63TdA6AUThmxOV7qvoicG0vqzJR+b977Hi?=
 =?us-ascii?Q?NLUMvnjEhWi2zBn+H3C5SjGBniOgLz1UcRmvyL8MX/R+GuUDBD5lYXSn6DZI?=
 =?us-ascii?Q?wwSQ8ah/FjcPvNtmpI2PGzKHZnMJEtFZO8lz7wOkOUGeE7yPYKhbAaYeA303?=
 =?us-ascii?Q?BzGI2wE85sqZoK0CJo0MLCWt5wNMADo/hitpHFpD9i44eajJDzY3iLRDJ31o?=
 =?us-ascii?Q?x92kejWWi43YWSVUZCBmhdK1+/9kvnaVVqpUtxhgf2XTMO9sSVrCrZCSh7+T?=
 =?us-ascii?Q?vRwug1YjtvaGlpaZBQqu1zJ4Vnw76gXEtv5QJv6E2AvNYusM+RfM59bQsVCa?=
 =?us-ascii?Q?Tc5J8iJk/LW+l2cU4hy4i4O+ikLooi4pvY8uTt4xP6SuCPv/AJsIgY7vrN41?=
 =?us-ascii?Q?EST2SmOmtXASyebUZT+IXxo5Cxo2wIWeFDMsxsBAsR9usjEBdVEuIui68zFE?=
 =?us-ascii?Q?QVSZ7mNS2vK1RwWgvoUSNy6AvWz4DKNwo5phS9jLMx8CUqYRmzidzlmhuPXD?=
 =?us-ascii?Q?yEpCyOHhFa07U3tdV6yE3VdmhsYC4GklIYEUrKPv47olIYBxWZnp4KwspbIA?=
 =?us-ascii?Q?BlC3I8f1w0QAXR5PRbH0qk20uYzpQWes9233INuvv3XraFLOPqZcquQHzmp9?=
 =?us-ascii?Q?W6Byx0+A9IC7UI0nwa8FbPa6AhzARYd7zpKyMAWAO2grWz0y2eRo5LRi3SPt?=
 =?us-ascii?Q?GBak/Q61WmZnpLoiBMG3qCOjT9v9AUr27j27Rt4BGUyBTEatIK/f9IPHPm+0?=
 =?us-ascii?Q?khqs7v02HGL1HlsQorPseaBxI2l6B8t3KwmgbW91VVHRrHjX9lLwV1YNmuH9?=
 =?us-ascii?Q?v4p0YwxTJNLJziG79uzqQzgK94s44TbUprgqhqMM3SYPo7gsMgnoEmMFT75A?=
 =?us-ascii?Q?PTmC9iiKOTT5o/r8ldelsSGMw0XjRATRvJuBuIjIR1QzSKUKRYUUpVrCBZ1h?=
 =?us-ascii?Q?3nHFvQclettqfSMYLprne9uOBkYizIO15gJcDYWSyl3S6Q21EEWGggtI30FJ?=
 =?us-ascii?Q?dNpexaetCk2PPxG9zJTHZ4t0+TyayGFDWJWrkclpxTlQNu/hqw5APHinTFFJ?=
 =?us-ascii?Q?YH9A7OrD6RsE7WbcHYK/TU2xqkNKFAERU7d3NWxhzgyTV1Y8Zc5/pA6Cxbr4?=
 =?us-ascii?Q?y+4KW55SD8nlTcfjK35NI5Z6eBP7+nu3C4LHFdJhqK2TkD9H7AOmOX3taR3i?=
 =?us-ascii?Q?Eqn8EJPhq1wtwQwAxSoe3T0GY2/IohYAk54PAABcQN+DYvHEUT9R5ZRWVVvY?=
 =?us-ascii?Q?6BHcwAOLgWsmNALkjRokg5tGTyHbI1wFTcsJw/eQm8iJT9T0UKTj5uGEPDvg?=
 =?us-ascii?Q?g7O8jddw39v9+LbiImjTsHo/G+CmKqJvzG4zW0ytVqMbiUAGsPe3NjnakP/N?=
 =?us-ascii?Q?T4fFgP9671wVXRwIRkga9w3y4Yi90DO3xeO037OfJn8MHH729xW8OSeMvbO1?=
 =?us-ascii?Q?K4RcJzhU7FsumYOvc7B4smXKW7r1+MITlKaA6E1FCIfzW8X3lR9taeD9eJ9Z?=
 =?us-ascii?Q?Fw=3D=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 430f7db3-9d6b-4725-7b34-08dd9c513ea1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 12:31:31.8820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F4cTHBEi/gYsYOSCP2NivFjSJLiieij7Q4zbEIbA9/Ut6RQOkjpNDhKkrIvHlDPdrhrLkc+bPNP43LoI6ylMocsWAzcXYV2KWH4LDmyA+QQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10028

Popular cheap PWM fans for this machine, like the ones coming in
heatsink+fan combos will not work properly at the currently defined
medium speed. Trying different pwm setting using a command

  echo $value > /sys/devices/platform/pwm-fan/hwmon/hwmon1/pwm1

I found:

  pwm1 value     fan rotation speed   cpu temperature     notes
  -----------------------------------------------------------------
    0            maximal              31.5 Celsius        too noisy
   40            optimal              35.2 Celsius        no noise hearable
   95            minimal
   above 95      does not rotate      55.5 Celsius
  -----------------------------------------------------------------

Thus only cpu-active-high and cpu-active-low modes are usable.
I think this is wrong.

This patch fixes cpu-active-medium settings for bpi-r3 board.

I know, the patch is not ideal as it can break pwm fan for some users.
Likely this is the only official mt7986-bpi-r3 heatsink+fan solution
available on the market.

This patch may not be enough. Users may wants to tweak their thermal_zone0
trip points, thus tuning fan rotation speed depending on cpu temperature.
That can be done on the base of the following example:

  === example =========
  # cpu temperature below 25 Celsius degrees, no rotation
  echo 25000 > /sys/class/thermal/thermal_zone0/trip_point_4_temp
  # cpu temperature in [25..32] Celsius degrees, normal rotation speed
  echo 32000 > /sys/class/thermal/thermal_zone0/trip_point_3_temp
  # cpu temperature above 50 Celsius degrees, max rotation speed
  echo 50000 > /sys/class/thermal/thermal_zone0/trip_point_2_temp
  =====================

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

---
From Frank Wunderlich <frank-w@public-files.de>
Date: 04.03.2025
>
> sorry for delay
>
> i have the fan from sinovoip and that was working for me, but if your fan only works with new values, i have no point against this change.

Frank, does it means that you are signed off this patch?

Changes from v1 to v2:
 * improve patch description

Changes from v2 to v3:
 * added question to Frank Wunderlich
---
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
index ed79ad1ae871..b0cc0cbdff0f 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
@@ -42,7 +42,7 @@ fan: pwm-fan {
 		compatible = "pwm-fan";
 		#cooling-cells = <2>;
 		/* cooling level (0, 1, 2) - pwm inverted */
-		cooling-levels = <255 96 0>;
+		cooling-levels = <255 40 0>;
 		pwms = <&pwm 0 10000>;
 		status = "okay";
 	};
-- 
2.47.2

