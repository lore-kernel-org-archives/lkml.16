Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023127.outbound.protection.outlook.com [40.107.162.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9E11DF258;
	Tue,  1 Apr 2025 21:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743544530; cv=fail; b=ImCUAgtNqMMu6+YCDqRuhVboPfdi5NeIaD1JMldtBZSWajRqWadTHDnkHTFg/kMGTwMeD3bViXHANTnX17x0K3gwd7qsh7FyuDKG0HM3Cze7DgXH2cnGtv/G4gwRWu2ngWGaE4S/P0uEDx2l2vqR3f1ueG7gVfxOZ3gtDTXA0ZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743544530; c=relaxed/simple;
	bh=0D74nxs8k5zJdqw8PAxqjrZSmrkIF9WueMHxWHcE23I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Is3C5n5cCVGUPgCwlgGq7SdHsHNl4r1glLuYLh+BOHKr9UIJHIIDZ8Ni1OdR7zXNy3c68B3FOpVPqA8eNldGY8lKGIOt/tK/jKSksOStfrIvvh83JzACld3AMX7QbgR4JZP5Wap05J9Jt64SdPLp28ui8vhuZCpW1YVUfyj1v0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=yQXQUDmO; arc=fail smtp.client-ip=40.107.162.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="yQXQUDmO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCETVRyykK1Gqm7Yjr0WCaZ35no/61ivJVrxtuMcdyob5XgDFCMcnq1hsRzd/vKe9zJtXtGnqFGvE5lbH8FQciNTgJuso7iz+9SiXiipfG7FKvPVovIwGXKmyZl2e+CrCYRhg2WjgHoaFPiUt2JEeDnLHjJBRKjWW0OSXEzF6W4FfjWzeJ1jVJq2xNYD47nAnYM710ci/MFiZn6faA9xH2LIsbu7hX+xTOgH0Qab6q6Jaq+/gl/qOVKJRK0KOHTJU9tj4/eq5+gJ6Mn+gQH8JwUqYuq2Fy93WhdG3CCfNISd7AEU+XypuykFR3R1DGa/lnDoGu2PqvawcsZbG5lDSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QLyk3UzaLGvBhsHU8wI4wALNc+oNV8Vwedg8RKLIl2E=;
 b=oQNVLCHIe0ZPB7P3n6CW3DwlNQngHLwE4dQenDjYmt33gbP34gyiFPW9hEEm6nYGYDinItwHLDfRjvrKERzALVuxataCe8bOoKesJ9Dbdz0UK20TUAz72/IPYXGZRD5/DHXNHgbwWHgHbWo9CGHv7UvsZDLEHIS70S6Tu/OexRE1A0LfPcvNePa2ExqMznMP7ZDoaWCYE957aorhmTbLF/omiD5lSyABCOHcqMs5j5eD2U8UqyBdNh4NU2Iodhq+aw31W9Xoi5TYIHB7iIHdLcwyXIFU3OnhC17dcAj3Hq+HnZjJ32/SkJjVXv/iceC7Qpk5iWHXHKfjxwCys6mnkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLyk3UzaLGvBhsHU8wI4wALNc+oNV8Vwedg8RKLIl2E=;
 b=yQXQUDmOKA3ypiYrWK3+OVkQOiqUW7XaNSvw0LGHryhPGX6c38rGp8detmDworzBge3FqLUILi9TdzgkgRGcU29IbnbzZj+DorUeqUKAirqSj2FS7PDi4ukylSjib47EGi57vSxaycwWEykRy9lKhCGiMjefC6ac+kcNqyfLI6MVex+sZFxkDsEgu6t7+JIauqceIonBwc65K4BRwFhNkzJxfrcIaB1SRYXNfSemhswb6v3pfB5CStZ6IPCi/SmyjuLiNMTDoRmp8g/eBb2Z2VVpUQ3ORP8aS/x/6h2+mZy1z7ZO1FwNwgqwXaiwxKwGVOB52chl/emLhdi4hsBVCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by AS8PR08MB9979.eurprd08.prod.outlook.com (2603:10a6:20b:633::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Tue, 1 Apr
 2025 21:55:22 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.8534.052; Tue, 1 Apr 2025
 21:55:22 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Frank Wunderlich <frank-w@public-files.de>
Subject: [RESEND PATCH v2] arm64: dts: mediatek: mt7986-bpi-r3: Change fan PWM value for mid speed
Date: Wed,  2 Apr 2025 00:55:14 +0300
Message-ID: <20250401215514.1944552-1-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <trinity-2fa9ed21-07af-4fbf-a20e-32684dabdd82-1743507920209@trinity-msg-rest-gmx-gmx-live-5779db864f-xlr59>
References: <trinity-2fa9ed21-07af-4fbf-a20e-32684dabdd82-1743507920209@trinity-msg-rest-gmx-gmx-live-5779db864f-xlr59>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::19) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|AS8PR08MB9979:EE_
X-MS-Office365-Filtering-Correlation-Id: daa27a51-1e9f-44ad-5b56-08dd7167e6a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rMIQYwoWi3axQWGQXGpOlA8T0cT76H8wSUnJ9cTr7q5jpRwWcm0XoixzyVPM?=
 =?us-ascii?Q?M69Bcv8YAmWIRunoXt/bhrrd3JI92/Iqxni5KGThr1hL9XkQVS9Nb0skTdaj?=
 =?us-ascii?Q?myT0CQ6QN7qjH3BqfPBF9T/S+MvdiiFWF8DQ43E1UaG+KipiKENNDWZlqCDN?=
 =?us-ascii?Q?Y5Otp0BUW4g2JSLCkE7Y/hBOdW18lDviQTaFSYAEZeINYcEHfKXPAsBmOagD?=
 =?us-ascii?Q?MGOND7gQNBU5eOpDV7KUJwDlFWlOSymjyfUZHpgSbUcdxjDoqb4MNxBAflnm?=
 =?us-ascii?Q?JzZo26qYMe8cKaoUfol8Zutasx+J4ugGw6y/rc0jtUMIezyP+aqgtrSXKbfc?=
 =?us-ascii?Q?shIkMi3ERbVIad1iwzmZSAKPoCRgUWy+VIOpkaVv9EJfmTlBHmKimR4LSQny?=
 =?us-ascii?Q?GJmvQim1JtMQeYdWQ8ArUrTZCf02IbId1RI8ZR2qbPIXXNfxf5Ri4bSUjYrd?=
 =?us-ascii?Q?ym0DH8uE/UAtE0dSNSHaYhEna4wDJYpnzEhnJRDPNo5FF/+bwNJPaZOX4Ypx?=
 =?us-ascii?Q?7INL0TjQsLirD71z8BpfHevpTRXvAE+7jKqT9Wm5+hrIRK1WIV/ZyhlFopMz?=
 =?us-ascii?Q?++3pXUged+OaWDY2HuzT1eOOYC8PSltPz3AzrkXSqt0rpAu4ZW4L/rHoVzQp?=
 =?us-ascii?Q?wRn+qGeCKECxLSURwM2fpg9pVFsr3Yx7wBhP0pmd/wRIToLkEiTCtR51bN3v?=
 =?us-ascii?Q?Fmn9Zc+2UjJDhdxba2eqcyHZgy11MgMyeYeYXIkbC+HrlSZPKCikvJrx7Wlf?=
 =?us-ascii?Q?WK92CBT5Li+IYweA3I8rJklXF0NBfx3WSocr6VY1jim1Wk2IfZz1IdpFHKHn?=
 =?us-ascii?Q?txdJ/SDsEct7jX3AEyxTwTVDjeNojDdxrctajriAOpzQqIXaRmTcNwvXSNFQ?=
 =?us-ascii?Q?sHyOG/xGOmHscufbA5G6WS+5AXt+vS5vJJQAKD0LgEeUtx2DbvR2lFuK63Hn?=
 =?us-ascii?Q?/xI7tB6hhc5cqZUeKCWIXbE63lYuxzjRC190Ta62PRchYpAqk1XRS7yoLA8d?=
 =?us-ascii?Q?8gIodZzzEj/87Q9Iu617/MhFRJNWtx3edrVKitWevXeWI9J10vzewDSZRUoZ?=
 =?us-ascii?Q?R+/5jdaiEU04W8/0GanMA7sFy1AqmzMkt1WAFwPtUq1kvm3aCfeVMkG4+NEh?=
 =?us-ascii?Q?480T3VN5xeZzzqYdtxBFUA3vqfJulGN2TkRdFmioHclaQIchZkjV6LI+gux6?=
 =?us-ascii?Q?g2JmaVTJxo63aQtL5KNa1ryR9O4KTwwB0SCz7gwCWF3vhGq7NGY+P9cRQ+hx?=
 =?us-ascii?Q?L/iOBC4uCbqeryJB/dz8LsT8uTJDgObHQ+2cWNYt57JdhSUNLoP+mgU+cp3o?=
 =?us-ascii?Q?VHF3go0+d5G0MGWlL4UWavAFXLNxVIhAFTdt39j58QQmGdOhUY1fPy6yftaq?=
 =?us-ascii?Q?vSDbTzIKN3PASS0Uc4CjrICSw6uqSwsbMLOCBWbM/twLUFpzz0zig7bv96zj?=
 =?us-ascii?Q?+amVIOh369dyo7b9Y0UEPIUUzyP+JMhHDUwqLpxfoWWdWsNj9k4euQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SnBFLbpm/GUkvj9ZQ0HHxfwVn+VasA9CRRfgFZJbP+NrzKeThKNLrv+vJ9eU?=
 =?us-ascii?Q?jOrlGOskLNpnpnqbjPD8P5YmPxfJG15J/B8qgbsNi4HrqwEYIg25BpT6MyxP?=
 =?us-ascii?Q?OZHi1O63lw4vvFF4/GEORKKKj7dEXDYioC3NdlX3zXE9510PJ/EoyCrLJ47l?=
 =?us-ascii?Q?ccAd5AUSDZqJQ1oAuQtN58q2MDbPJcbvovFdQFtdNcpMBIfkSw/e5PyPsv9c?=
 =?us-ascii?Q?lkk/nRj7xE13hnnvXFKd/Qbrp3oSdh4qBFFHcbvhA2XircYwlxN75btN4y0K?=
 =?us-ascii?Q?W6LcSwEJCF5iZ6a7wPnN1WdpC0OVGPPcmehCJV11zZGhE5CorSsaaT/HAKJy?=
 =?us-ascii?Q?lmjKtEWnjRX8qoBTnL9hsq8ox8QtSN8WROLUvzbK3ZoFqeoa5dbuQSH44+o0?=
 =?us-ascii?Q?t/vobEI8b8ESlaRcxr8qFB9ZYyBScTp18FBu5ikIbZHW5F+b6h1OFFAIHInT?=
 =?us-ascii?Q?IJsnaLAm4jrxYNkPRJwxs4xSyh2ZdFpMTrb1L2YUmdql07jPKvmz3qYxqFXx?=
 =?us-ascii?Q?Xa6pMWclceJRGAWaimQpEQxbPdBcliMYKRjOyiWV/qimKPoHeBTKwtGGaCgX?=
 =?us-ascii?Q?qb9tdgTB7L0jrokecB0Txx7zxOpXUL/58NaZR6jSPMVBFr7eDWTZKgfVrf/9?=
 =?us-ascii?Q?ZGoxgIl53Q/LstkKhxU+YwdvVqf9B2wZkh97vTpXjx7fvpfI80SIVanJpLFv?=
 =?us-ascii?Q?AkdqPD/+8zE46rG0WAj6tDkvIswVCJbTdDIjeOd40Le1B51RohRjEufODKTT?=
 =?us-ascii?Q?g8vR0Ih5/5zKA6nonlb3zspS95GhU5LwAZr5m1PQYWxSSEWv4HdjxEcLiSEK?=
 =?us-ascii?Q?irI51DubMnNRllO6Ya5Xx7UFUPDN8WOr/6bCuPxEtNGvCYrl0x/tJ4TjZKVI?=
 =?us-ascii?Q?b/TRqTiOTeqmQYrY5y1bOqIlnN0FQFJhfmeJVEKIdE6Ho8gzPUtXT2tfOK0p?=
 =?us-ascii?Q?f0DB/mc4L5A9adRaDOxAUrKODKHMbv5VGYO8uSddbMngdGNGK+bA/bq+6yLj?=
 =?us-ascii?Q?SrofCq8i5UWN3gJZypb/rZh/gueYbv3/ZM+IOmlzJFe+Sb+RhIqahwKwnv2b?=
 =?us-ascii?Q?gBVg1xRVOM8hZK954qvf3KXcDfSq6uqGnNrLDkacFtrNH4SoX9nFyk6fhUxf?=
 =?us-ascii?Q?xqcUwuclA63jswR+bGtRKVkDzxq1Bh2g+vcqqlannx9cjqTln+YtzQDVhVUS?=
 =?us-ascii?Q?4lzPB3SaWACxQPnXIkqZiroQsGXgWEJKbcIjFDrim/87qLYCvlD1ua8xpqjE?=
 =?us-ascii?Q?pORwWGLum5/YhZqdJPliJmdzDr01y+zZlTg5PAi2K8O7+9z5yfijSf9kyRNA?=
 =?us-ascii?Q?yrXiyXmHFtmsnvH9J9zlnBI9UyqjRt7jKheuQ9VOdEvTvXJJOmNV54+a3QiH?=
 =?us-ascii?Q?3V1WKFeCDK1cU4A2yfocMJ1QSC+B3yHGLDi+EVOfhGu9ssd5nsqw8WM2ae4G?=
 =?us-ascii?Q?C2it5cbLpjZbsPD2G5gEtE+vwPDPcZHx48Lpkmeqflx/CzFzqAz0zhGhV7nQ?=
 =?us-ascii?Q?ghdY+4fTB0DdZ7opbJonOfj5J3kDFRgATkWD2LEFZDxsHUZYol8TgCciAYdq?=
 =?us-ascii?Q?1hTli5Zo+5x1p+b/OP7alo1Ay67nKvR3miIu8f5662JUAQSRBzhQpem/pfoz?=
 =?us-ascii?Q?4fHpUdghnMJPMdM2UHAr494=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: daa27a51-1e9f-44ad-5b56-08dd7167e6a1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 21:55:22.3996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SZXCQBUc9XmNMicOpBcy4XFnG8xjl18nFJ78Q72ZCaHqMmsupjXePHBTQ1VOvbsdZhHkBRREudlRzBQAGV+8Xs4JIP9utckvI1Hn2XaQQB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9979

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
Changes from v1 to v2:
 * improve patch description
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

