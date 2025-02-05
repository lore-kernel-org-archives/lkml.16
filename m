Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazolkn19010002.outbound.protection.outlook.com [52.103.43.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD712E64A;
	Wed,  5 Feb 2025 17:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738775804; cv=fail; b=kn5KSw0PN5sO8ubP8csC83psiX+X+e9j1RLMB/g47gj7Cz9rzBDFXy0op2sZzsli3OyeqGhNX30ju2w1X70T7wFcfx+c496OE++Yuyx/UQxuKwgFEYjJ9DBUkXGeUFf99Tb1HTG+UeTebh6xvFfYFPjjEPp39XKY5lJ2hIN6ycM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738775804; c=relaxed/simple;
	bh=c4quHxGEzPfxGtjtj2300hLgFTOAeHTYEy97krhNFLM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=r5GVuXMmAOL0cNyxABjVRIvdrnPbEyKFUO0D7JWrOJw3n0ktWUjOziTmNlYtihQ5/scDHHiYvpo3JY2eTwyu/6LJGArNfeOBBI3pls6irkm9ePaownHb/k4jxmvj+CvRv2iK6gu0EDG+yaM47Vjh85MH72s1O1b6ttr3OtNCFow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=vQ5wotxM; arc=fail smtp.client-ip=52.103.43.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="vQ5wotxM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MYJONuO1oZMIQ9nnwrWztQIyYpqL79swIJvxCpTSs/bI14NhMGsVhRkgoq5mbczuK6DdhwURJXZ4+PKAvm3A3kHD9xZl7zVxMJM6dzaW3Hro5y3d/vjh5OR1/4s3hoffPIuYEH89rIACUWpEyLaZOEJoiV437PuGJ+Aj9xpVKY+QPopLAUJcMkyOEcCe6RH9B/Ux68JgL0YFrY1SjFnERDVyCtGlH3dvk0axXqCRw0oEx1SupqGYLKCpz76dg10LWAoGonGnZiZkYX5JtHpWfTWHIn+UuBFjQl7P8oyhDPKcvBixfNfw81zz+CDv0Xh+zM2L8Rs9nFnM9qnTKIzJHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0BUDGG3NtL88Q0s06VhZy4U75tPLmP8bryblliudr0E=;
 b=HnFGJJpp88aVfYM4sqmWCXenaT0FHmlS9S6pkSmE/5tHhf20rzhwJFs5iYJYhIfPZpOrwF4szsqdqGVo60iK6xlCKhRbELIro00khCbupvFgmD5PU/Y8j1nNCvNcT6G42F1P8Eyxif3YMOXNjY770ws8sRfXOfzF43pmzwwfZwUxjWjuHhV0JMUMtTeHFHzANZ82Ujy2o3Yop6pI8pQ633G3+EMubI4Aztbx+aHlEHaEjQqWOAPUDEaYHck/CoUNUQqeufYQiAd/4IhrbwrwqgUVa6s1GjDYyMQAwVM5lKt9Uy3h9gcjD2STbGhJA47URc0lhSuPNOLlVmKhdcOI1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0BUDGG3NtL88Q0s06VhZy4U75tPLmP8bryblliudr0E=;
 b=vQ5wotxM1dZj946IWFDNrksEN6D206CPIy5sxiGgd8y7bW7z8FZZFWLeTZLi75mvDTkUHLAagtcWqjXbLOLhqfWeqFtotDdpw0Z/Uk2ZorpbBgBrdkgqtXyMNaJ24BbaSUYVoAjf0VKk1b7DMBKLo1xH1BJJ3E18cF6XPpUxgGnsLwY6oHGIJrnag8+p6jVaxGnCTcj63Z+dPiO30EoyR0ilZlb/5iH9i+ROxbsxQcfF4G40UYLVpsVoE8NVKQ7MSPpZcaaHc9CHcbsLWPRkI/oCKGbmtVLrud0p9HGa+tII11Ihg/kluUmIaUXp8lFnxEsRD4++tAVxK3A/Yy27cg==
Received: from TYCPR01MB8437.jpnprd01.prod.outlook.com (2603:1096:400:156::5)
 by TYRPR01MB12364.jpnprd01.prod.outlook.com (2603:1096:405:103::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Wed, 5 Feb
 2025 17:16:38 +0000
Received: from TYCPR01MB8437.jpnprd01.prod.outlook.com
 ([fe80::83e7:751f:f3af:768f]) by TYCPR01MB8437.jpnprd01.prod.outlook.com
 ([fe80::83e7:751f:f3af:768f%5]) with mapi id 15.20.8422.010; Wed, 5 Feb 2025
 17:16:38 +0000
From: Shengyu Qu <wiagn233@outlook.com>
To: conor@kernel.org,
	kernel@esmil.dk,
	robh@kernel.org,
	krzk+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Shengyu Qu <wiagn233@outlook.com>
Subject: [PATCH v1] riscv: dts: starfive: Unify regulator naming scheme
Date: Thu,  6 Feb 2025 01:16:35 +0800
Message-ID:
 <TYCPR01MB8437F6FCD14E116B6CBBA09098F72@TYCPR01MB8437.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0215.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::6) To TYCPR01MB8437.jpnprd01.prod.outlook.com
 (2603:1096:400:156::5)
X-Microsoft-Original-Message-ID: <20250205171635.7310-1-wiagn233@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8437:EE_|TYRPR01MB12364:EE_
X-MS-Office365-Filtering-Correlation-Id: d8b2740b-ce4d-4cf8-0ea2-08dd4608d9ad
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|7092599003|15080799006|5062599005|461199028|8060799006|5072599009|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4y5ouRzWp1+tPIAjERG6xRHGZENe8BNM0Nvnq8R1vf1+wwPd7R+DGHgksm/s?=
 =?us-ascii?Q?Etq5g5AjEFU6dSqCu16nODCZyjsd4ITtI8i8+ZoNNlJvZMUA7FDXkjLtdkPD?=
 =?us-ascii?Q?TC4N1t/Rf5QbaCOwhOTdfVQDtuA934v1gPcrXe7hk8jrPv8A/t80wqQtQkOv?=
 =?us-ascii?Q?ax9dJIz3u1w1xEHJvFogrC/KxyxonSLJrhLdFPP30ZuEG3VwPhpGsF/No6os?=
 =?us-ascii?Q?qPR79EtyY30LzrHO0GOOTItphSG780DzrmxQhPwjf3zCVs7Rq9nZ3qUDrlGa?=
 =?us-ascii?Q?sZAFu/0NJky0yvW4tSCF7cvRm0GbAdd41dvtCpTaaTz2KNNBPn+UeGKOoIFf?=
 =?us-ascii?Q?Kxh5rkEPZqWw0jmDOPwqeRpKNPm7uC5z3MIF0N81uNrJ2cwIjBwMxXqXigkW?=
 =?us-ascii?Q?ct0EqLbx+eyXPPbuFWF9NSmyjAYRLVI9AxLFu5RjMlmi18al6tkYHINAWhbL?=
 =?us-ascii?Q?nyuGRRxKhVN2Wc/E91YzXD9aXCBo3iPvqudctrsXBkt50SScT80ixVEIbYMr?=
 =?us-ascii?Q?E69XqxvDPmEiWAVIvDUlD+T3CWo9OkJ9G7D2jIhp+PyA4AZo1jcBpgNFGX/t?=
 =?us-ascii?Q?B/snUb6A70TSc+hNEylCfnrip+Y2LokF2nzwjNi8ZfXhQmjH/SBcvLPUxg2t?=
 =?us-ascii?Q?5sD1CC86n0sZGsh7BoTQijpDIQTcl1Y3n/arScOYNuzg9Mctj1Nwwxsi5bvy?=
 =?us-ascii?Q?C6LoW729ufJp7OKEAiei9y1jgQs18wcDjSw68YVbiLnG2N/pTt1qVAn8Px8R?=
 =?us-ascii?Q?nQaR+Z1pLZd73yIFphqL10kE99jf9i/ywupEnOc9/uk0TuIGVFNw+XN6lQoT?=
 =?us-ascii?Q?y97k3DNwk9upn193Uk/0cNI+uYulF66Yeo1tH/hyrLg5YQk9MGZzRQTy8iR4?=
 =?us-ascii?Q?hUNtzeDSUuUImGK8FDmyx4sY7SWo5lMzM0Y8NCoZIZexMs24iCyQEMwIJ5aq?=
 =?us-ascii?Q?KIw/8XbOKa7dahNNQ0dHpnaR+qU+/yxtYWPCWi+UGUWIjMw07uwhfcOCJei6?=
 =?us-ascii?Q?qNNhP8HT5YlhbKelvN7v3DFSzMxOrk75/cjg+ULgeMMoLrRmefSSaAUbOdQU?=
 =?us-ascii?Q?BKfizVqnwFUL56O2o+0WF4wUds5uyPfKsZ1BMRl7jtazn4lbFfezdUUq6Rws?=
 =?us-ascii?Q?yns4s7uGI9n2?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c6sCG8YTP1kGuZBYl6/jmfjQC5hp+efeKb64bB1xoRIbsIsQ46dDYchuntMO?=
 =?us-ascii?Q?+DOt6lYuhRpCOLUyR79TVSlMsBVys00D/IP1372mWSHoPQI3xmAdTbkbglAv?=
 =?us-ascii?Q?qnG+s7ADcsGqhJ+kiY0/WKZ663zSYgHJqSsK+remtu3sFfJcCX9fOa0loH0z?=
 =?us-ascii?Q?wlIUHVlmS/2Vvy1RtCiWwgd6MMud6kibIqHguGMMtATkizC8fcyrCKCN/aUq?=
 =?us-ascii?Q?u1JDh/ZstQqSRtvbqw426l7Lb5FZ6UK8j6qaTsnGiUpbe/jhYFTlgLOkOiQ4?=
 =?us-ascii?Q?zsqGln+Pn4Zk2WJYNCidirXlyKa1Ce3bgKCRqP2US/jJhzL6C1dS8v2iLQmR?=
 =?us-ascii?Q?vUjT46aJ0KfsDPco/oGixoDhcaR/MjVAHBBJo/vEHnQ6aMmbUuSB95TCCZED?=
 =?us-ascii?Q?N1QBROsznQ/ARiMyZPCaJnY2RNij1dn2PyR7aY72eTvC0vpjVJqKcYYDUNKe?=
 =?us-ascii?Q?9nOrt6u5r7vr7HEVssHp5fk+KgycmJTiLl6jSLaSCrygsQSZzxff7Ah8ovir?=
 =?us-ascii?Q?BAjqJxCWWKAJjP+MMGjEVK7qAZ3WLVA7pFlNOi7cBA1Fcb8AR3TfwZYGXHez?=
 =?us-ascii?Q?jBs3FbGcizsxCXyeBgqU+Qw8C8HLqqtzPz2vRyOp6uo91Bl3bdbEgLv5wTG+?=
 =?us-ascii?Q?UrqbO3v68VtTyX3oD1B7mMTrCiTLL1P7mCjWtGrPJhvXfN7TlfZ2MWCTFbEr?=
 =?us-ascii?Q?+WWxRWpOI1Dc9a4gRDATZuoDj1RFc+fK2qgIjUNja9eBCn5S4YFjXSA115UJ?=
 =?us-ascii?Q?wFAZRsmJq3d1Ws4kn63rkBJPq/l/JLUymZz1WF3uLjWfLkpksjMFPKdzi+JA?=
 =?us-ascii?Q?DIv0aO/4TpXpI4xOQ6MrcH+O2ByvKLRGZ587VChoYYIRGRjSqHVuwoo/QqBn?=
 =?us-ascii?Q?hDsQQbZkPGnKVfA9zVqWQmXKU65WVdFe5o24W/uSTCSfYJ7gfxY8VCZwRgQR?=
 =?us-ascii?Q?YriaYITDJVes2FE+bgliVQm8jk307trCOguunLdp7//id5mQWYpHRhHcqFF2?=
 =?us-ascii?Q?91q1GgdGx4pPrWsq2gonsMNrrMpFkdSR4QNiD1LiLwkORWtCBTFbE40qkD1I?=
 =?us-ascii?Q?Agx3NpFV1WuTycVt1NVA95UgPs08yPGj4pqto6+1fpSuY3mSa8zDiAV+QkJx?=
 =?us-ascii?Q?hF7WlhrcvKDn126FmVEI9hkhUaekQmP9HW+VbaN8RNe75lcadrk6wWJCSwwI?=
 =?us-ascii?Q?tQPw+mIbKlxJG2XDhvIXBlPUDMJU6Y7M3z3CAKKj2F4QxPK8JqlPkj3wosU4?=
 =?us-ascii?Q?UCp1DYE5pzjFH+KsdgEHPGxL5Y4oQzx3sdgBuaq6g5DxUjv/tCdWf7DBVjc3?=
 =?us-ascii?Q?zwo=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b2740b-ce4d-4cf8-0ea2-08dd4608d9ad
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8437.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 17:16:38.3836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12364

Currently, there are 3 regulators defined in JH7110's common device tree,
but regulator names are mixed with "-" and "_". So unify them to "_",
which is more often to be seen in other dts files.

Signed-off-by: Shengyu Qu <wiagn233@outlook.com>
---
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
index 48fb5091b8176..dd2eefc295e5c 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
@@ -233,7 +233,7 @@ vdd_cpu: dcdc2 {
 				regulator-always-on;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1540000>;
-				regulator-name = "vdd-cpu";
+				regulator-name = "vdd_cpu";
 			};
 
 			emmc_vdd: aldo4 {
-- 
2.48.1

