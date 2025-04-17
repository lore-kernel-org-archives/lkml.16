Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2061.outbound.protection.outlook.com [40.107.105.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10FE24502A;
	Thu, 17 Apr 2025 12:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744893222; cv=fail; b=SGQrPBsIg1MNQGNtDnjJoFwnd4ygb9/YGwi94VPDh8jnYClW/oVkOKZqOxNPjKqyjfbRv3FQ3wCkZvYgUjX9Q/XtvO4/00GtnS5fInrKkjlU3cZPQvfbDh7D+sR1qTyz2ts/GjkHKwbg0K+5VWGiPl6eXPQLXnMOeWqgTyrt2D8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744893222; c=relaxed/simple;
	bh=+BzMrrx7UH8CxzQx8gybYJMssefKjIAjKWVDj624sfU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=D9+OVX9VOOrB6+wDmlQZzbnP0gOxIUVr4IZ7WuaFf+aQiJbDx1Edq7jP9xjQlkTeHBvfpT6yxnZ5G/wUm0cntxcPKK5rPWs9w8NaHmKOr1braZHSw4+Mce6Jy8Uj287iBn21UxCEJX6NV9za/GnTtb49vKEbltVwYOgBCZSf0Ck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=WTUyIHo9; arc=fail smtp.client-ip=40.107.105.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="WTUyIHo9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RVgJz4r6/Tej/GadN7z50z1WeUn8hgpLUhYt6XGHmGjXjKAZifvzqPwgJ4q6edirZmMy6iiKxys1M/TcxjVfldLLKNfRpq07sQ7HOaoBxwm6Io0yToBF1qwAs2jlglxXU1rF+yiDuXKbB56USU+I5+7A8RZYLeMkzhzW1CbyIsVj3Bvc7ZiJ7liZTWYJ18h/oOTceFlGsiUu7bX1ZyEaAW35IdBTNCLvh17UV50856xtthGmjbX9rdlYAtlQnakLuOzAZrDtZ/GfHlRWoWObplciyGoOxk7hiyIfconhsQJ94fOGRmZ34Psk6KicCQBub/y3FIJSC86TrzgxkhDUxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9i9XnNvYyeyPvpbkPUbDuJlvvs6ehtEyGqGy315pDs=;
 b=GgzrvD6TlNLEYvuF7NmqvguJA6y1HbilHqeWbVgAZ5TvQz4Y7Kky78U2PMy/AjoSwt+s6eBO8QvGQD4X22JX4OYjUsv1DN+IP8yKiJW3BXTAFVGAyLbBrflH0fTfBH/97L1r87L4oseq7VTRUeq5EhVK2k2HfP0Tg02a3WcIyB8I7kh7w+cVX7S5HHM99MkaWwuunG9b4Kg4ChHpkI/rKLmm8xgnWN4HOaxIcdLK7cGTQcPz0t4LBA6vQrJpWvS3/HHYnJkBAQte4Is260A2an+cozS01LFRPf9NXR6f+N+Ng6vjt32cImSDJ3GLPfLAuSBHPjmSjP2ieqkC+X9T5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9i9XnNvYyeyPvpbkPUbDuJlvvs6ehtEyGqGy315pDs=;
 b=WTUyIHo9VePxjTSkrnC7qF0bm2InbzwtAVrOZHNgjf4/qqLeIgelkvDYa6n8Qo2sK5k1HXWfM4I+cEy3gO8gzlREUqGp3/VsqoVDv3aPMO78nB9odoVlD6vAV25zI8mviubXixSpumhwxUUnkx8xz3brpePNzl0wYVRZ+h3POIm4DOvT5EIxqdJP3YpIuq5ESYGpsWKz6ZjT5pAPt9Dudit+EZ31oMN8IhGknxjCMd8xKZ8YqSxaMnAXx7FcYeX3WxRXwFTjRw2O5ur4YquCaN/1wtXnpn3Yy4/Qe0r1lMWOkKUy4ziI43T6plxifopUe4JKXxDlvLr2CkFaDxWdOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from AM6PR0302MB3413.eurprd03.prod.outlook.com
 (2603:10a6:209:24::15) by AS4PR03MB8627.eurprd03.prod.outlook.com
 (2603:10a6:20b:58a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Thu, 17 Apr
 2025 12:33:36 +0000
Received: from AM6PR0302MB3413.eurprd03.prod.outlook.com
 ([fe80::fd5:7b7c:3b2:8d1f]) by AM6PR0302MB3413.eurprd03.prod.outlook.com
 ([fe80::fd5:7b7c:3b2:8d1f%7]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 12:33:36 +0000
From: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Wojciech Dubowik <Wojciech.Dubowik@mt.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: freescale: imx8m[mp]-verdin: Add vs-supply to hwmon
Date: Thu, 17 Apr 2025 14:32:54 +0200
Message-ID: <20250417123255.819309-1-Wojciech.Dubowik@mt.com>
X-Mailer: git-send-email 2.47.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI0P293CA0015.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::8) To AM6PR0302MB3413.eurprd03.prod.outlook.com
 (2603:10a6:209:24::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR0302MB3413:EE_|AS4PR03MB8627:EE_
X-MS-Office365-Filtering-Correlation-Id: 43f04911-cf8c-46a2-64c1-08dd7dac12b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WdQqJpZsl69pUmCUlIrJsGr2yJ7oyhiKIvgKvizBqZgfNgPBzQuTXjxnmPpO?=
 =?us-ascii?Q?33EfqFh+t6SCYD8nhh3hITV8NaGnKD0gJwx+hyQ1DlVt0M8bY50BkIF+9G3K?=
 =?us-ascii?Q?Orp7pqDrkyFe5CEFacHth/Nrt763M4cqLiPP6HLmIp/WMdxYkRKdnlikiYOE?=
 =?us-ascii?Q?NTxpTosUXBWEzNlQ9O3beU2rSRKtixTH54UpF1EPn8NOe4ET75i/o0xHmSwL?=
 =?us-ascii?Q?eQ/SAqRw7oIVF9EkcHZgyYI/YWT5+5uQPJXy84SuA8ncCRv2S3Y4JzvRD/Cp?=
 =?us-ascii?Q?X+x730sfLajhRAySyXpFXM+T4yRBtO3Fz0qZeh+Yt9uolwLxdo4XuHHDZ16T?=
 =?us-ascii?Q?WwslvOutonFt9XxcGyeNZTJ7IKlnO+2CNFqbFTF2q/IkmqQKkdhoyzY24jaF?=
 =?us-ascii?Q?0E+a9amfUSJmdHhPLLDAbhF8rNLl7XCau6WGyonzaFB+5Phh/8OvZfpJGYF1?=
 =?us-ascii?Q?4XFaH+Hwd/ypZDID7EnD9Xn0jv2JJOShy0Cl+HoS53JvW9NcnwArymYY+IWb?=
 =?us-ascii?Q?oRP4h/UqqGlZErGYoppr/HSHtZFRCH+/I+VNgZgWpow+uWD0/0+bE9vvrsMh?=
 =?us-ascii?Q?JPETzgrfZ7iyIe/9UvZVnrAqC2yKudM0i9I6U1bViqtQupDkuOpvaZkr1Idj?=
 =?us-ascii?Q?+MeDV+/fWYApwQblKtt7N8tqK3INSeHvjBbqnWcn3PNnhFTn8WLLQoH1JWhP?=
 =?us-ascii?Q?ENGao93l1IS/oczbzmkzNJUjyqekyl8inR47m1G4NnA+r41VhUw3l4AvJVVR?=
 =?us-ascii?Q?gsJta+jcGAwP+uczokvYzNOjTfy86G8rktzqtMfdddhHovINfLG40sp3rwkA?=
 =?us-ascii?Q?qfHJ/47CIy7Q9dJEq7itbtvZ4XFp976WVDmIYZjiVk5ybaLlUbyct9AVUFFn?=
 =?us-ascii?Q?NUuU8L2geICh+JxZ1i+HUZpYwbfBq/MpUf399tQGqqYxXH0scHygsoDjjb0V?=
 =?us-ascii?Q?j9zL58EzX8fsxRKRyFo/pf6QhuZXZEJUwA7T0lVR/haFzLe87L7IStWZHq3e?=
 =?us-ascii?Q?sRWeeaGZQGN3UTX0Dl6vC1SGDeQGbZv93TaeDXBcGI+M33mhCvbZDRdfW1oj?=
 =?us-ascii?Q?LLjomrZQJCp1azVUG/ICwoQK3ApGyfjC2ajK23UOnLFo8OIg5VFIAc9knOey?=
 =?us-ascii?Q?UIjrxBRdcbjRJk4SKXrp0KfPe1zYnfzB5p8IbfeHOY/9DIX/jIqAhYlWm5li?=
 =?us-ascii?Q?rnAAVUBMW2Kq9tqDic5m6CcWcWgtHQTprebDaLJzmi+9kxoOX357C/BiKN3M?=
 =?us-ascii?Q?R+A7NQCIcmj8pmRgdGj+IqAjNg41jmPWLKKRiPojaNn6aQHSnq1MMFko3VOQ?=
 =?us-ascii?Q?MORsXMihBe+yoqnxBZ0+eVon5nHwTR5oIUike/CKCC4jWPS6NGQeY4ul9MGk?=
 =?us-ascii?Q?yrVZef9nYgX/eWIenC2VcIFKyOLGuzIiQbz/qMaJQAEXMdZ82LjkDZvIvSr1?=
 =?us-ascii?Q?W0d4vXOu/kxzAhuMHUOnihEzjyS0tT98dHuLq2hty6g7WjNYukotKw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR0302MB3413.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eYpsLcCCCmshrtaWWu8hSG9c1wxtYAqREo3jdNxnT9Zin21LuQT03mnKMuQJ?=
 =?us-ascii?Q?u99NbshthvQMGuz1ZJPhVy3U1Id1Rf0J+gDMkCnLD+ObuO1qBRd8c5C9rqOZ?=
 =?us-ascii?Q?cgo7Z1F8eKrtnI9XeND/Ews6Rv8hDp98oBFPJnShyCJ5/Pm6le9BSKOfni4j?=
 =?us-ascii?Q?E2N0CZt42hZYbexZBK57ticmeOt8aZf+K4JmuLZraQDKdVT2ejYslu6fTA1s?=
 =?us-ascii?Q?gSi26ZWmbJD5l1CorWugzhVunijYwba6cGzcp2KUZLxYMG3okLHkbRTkuaMQ?=
 =?us-ascii?Q?bAX4dLDx6ehQM2eCOmQtIP9xUn3nzOS8uDEHksnTeBTKLPNUB8Qffrvm4WOP?=
 =?us-ascii?Q?BSEJ7dZSb0C+HRG843R4YjSy4BUvIwGnLS1fPgFMBzne7+WIIrrtx+mKwRHG?=
 =?us-ascii?Q?mE3Q6yPy7IWMVCDCMfFQMdtNs6jTB0PTbnDfY5iEgDhqufpvKEG8D2SU1bXj?=
 =?us-ascii?Q?G61ab9xs/KfBXXb1eDL6oj9HK5N80yS5wHKbUkAFZrDHCem24rwGZONF3y2m?=
 =?us-ascii?Q?SCTKIOdJmV3gYPOJZwu9aQtp6jEpsBdTNrW6WgdlbepTl2Eun0ZxVWkjRMru?=
 =?us-ascii?Q?GiZZFgDQByGS7b3gZaxVi2FAq2cao6Eq8RBTSfIj9e56nl9dUFwisUpEBrlC?=
 =?us-ascii?Q?9vE3g/Jm/TMm02L09kuocNDfQds6WEZTocVB4zvTrbla/T3UxjcJ8c6RgO8z?=
 =?us-ascii?Q?8EOR/BEwxtufGq+tC/o+MPYsws2mqmm4ZfTUwOTXz7PnPj5OEdiZUdf0foMM?=
 =?us-ascii?Q?yxfbGMmwmsiHPhaAXUoMiABSRnDZRuFAffttYk5qoPAjKPsd54qzU/Eob+wz?=
 =?us-ascii?Q?mxJdT9odQUkQu/xFGSUpwfyEdqGkdxs7anUq28aBhGHMGiFVeu+L0BPWTtPP?=
 =?us-ascii?Q?gQZ8PMQQTB2nxikgNsN+e1+WEyvysdcNCDqXpEOGL/QePIJjhAgDDR5bY5US?=
 =?us-ascii?Q?rHMylqSfdZ4zGjAiRp+Sl8rh+S+DVG0pw20rIWKFn9dM+dq17uh5aSKv52Um?=
 =?us-ascii?Q?IZwQ95WjEA2zva28Grq0x040BNfsNaQOgzYjfGWcGhP1zGmytRUMgBetZgM2?=
 =?us-ascii?Q?/TVIiwk4oep+9viAL3ZNCBT4ymXEswPwrOziYH50Mn6hbe3Ef9qM9pIy3KbJ?=
 =?us-ascii?Q?447/df8KNf54GFi49zXb3ZqZII+8ciBYiACUp1EZXU3/0lL6cElGfo4NeYck?=
 =?us-ascii?Q?U3ON5TOxT6ClzhWTUeKeAWaIpyGOvP9LdAiePgoLPd4XB1XZTp5OeVo/4dop?=
 =?us-ascii?Q?r8zl9ez27ST4dD+gQX068SEQ4erqX+9fVrpAMhscKSDtn4Yheacm5RP7CWMt?=
 =?us-ascii?Q?KNRUlN1xsA4TWPd9Q7SbCHDgq8AT3Db9L3ADNTRy6Gy4z66piVTq3jBbH8f3?=
 =?us-ascii?Q?P0sMLjHfw+nhIANmNphXNU1Cbhk/fsHlXcsZ0yuqbCDF4IvgsCbRL4+xgqSM?=
 =?us-ascii?Q?ObG3V0kidPJn8brQOlmLmANC6KuYXtkbYPvZb7IXO5zzJ5r7XjlmkPrRqYMB?=
 =?us-ascii?Q?szjmgU8NJKFj3zxnr4NzH0ncRsRauS74nx16T16nyBB4Wb/mFIuB9g02gpAx?=
 =?us-ascii?Q?ZWtOUguyVjid5dZGbtKIAerH80DN/anS+zPSnsNM?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f04911-cf8c-46a2-64c1-08dd7dac12b6
X-MS-Exchange-CrossTenant-AuthSource: AM6PR0302MB3413.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 12:33:35.9504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8vtJAjpofq1KFUNC1BwF3EM53sP2O5SO0dZRPzs+yPtt4HOG+EDJVWmxxp2gXTxS6avXQ38elE9V6XY+GrYTAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8627

INA219 current measurement chip is connected to +V3.3_SW rail
so add vs-supply definition.

Signed-off-by: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi | 1 +
 arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi
index 1d8d146d9eeb..33a134961a3d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi
@@ -66,6 +66,7 @@ &flexspi {
 
 /* Current measurement into module VCC */
 &hwmon {
+	vs-supply = <&reg_3p3v>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
index a38e7c947a42..600efa8aca1d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
@@ -143,6 +143,7 @@ &hdmi_tx_phy {
 
 /* Current measurement into module VCC */
 &hwmon {
+	vs-supply = <&reg_3p3v>;
 	status = "okay";
 };
 
-- 
2.47.2

