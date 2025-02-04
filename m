Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011001.outbound.protection.outlook.com [52.101.65.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206942139D8
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 16:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738685531; cv=fail; b=W+XCtE1YJCvb6O+jCFQpz+W68AgpSA4iLmZxuazXHsFQYqTYhoyOg/M+9ZfLfFs+KGbFAQHxTL7tncPwPznl7DYEFx9kBiRXoKCiknRXLq4W0hHAt/SaRl8mEt91zHZbrPh5R+CoXNZ3DgJ4n4z+Fe3wqPkTM/82WtQ+UefE0Pk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738685531; c=relaxed/simple;
	bh=ijWBKoTrCTuKcsP/8ThphR+X21qotzPBGvMVQchbZJQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=HpOr24UqRS5PlB2z5RmsplCYcdu/2rfC/1po8uyUzGpGqVnUMMm1dp77oKhqHxj4Xc5pNLwoDg+1OVzBCpKeMRTiRC56tdaUk6oIiUrWrQE2ko4+NXUD41AIY3cteI/BthXq+ZWcCT54FSkztuQs2rXAswirD8S0Z+7dFFsGYF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DcH+LjBe; arc=fail smtp.client-ip=52.101.65.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DcH+LjBe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xZpcWyWnKzMAEaStVvIDg7cDsvrVU+7KwsKvBuRQql5DsZqK7FEDz7c7BeOw/75Bs6nXUX0GYsmZdgnJYks0xIHJfaS577V8bM8PaqMu7qN8ewEp9kgDR7QondW5usAPjxuWV/y0dGD0/efWKJGwZXUZnlWZhZtHqJIPRA9QIdS6g71oh67BDkInvfdTQm5lc67Lu01FNKoyRH+wFWWkXPXafaA3a26I0fDRxgBWCUKjPxUSY/ZlMvGSta5tsjmQzZmPg/MsrtQntQJ5czmwy/EeXMAIoYoheDmTGasFtYC/WEF1r8Sz2MVuqzndfKhrw+bERm9IUKANt0SOshmKxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GgwmOen68fJtcIgB8Z1K7Vu1/+GYwtO7IXsUyNSu3II=;
 b=H80N0SzeCk3IzC8UcoWBTXvlwatPjYEzWmAa6abX7ViwzjjXnKyLVFxj/h4cvoobZGiAz6AGkk/UWEt4c2phZ6s8CJxg0pI2mvUJ9JSm/6tmiPqf7ygiFB8ohAl+OdL4Q2aNLIrCgR5BzDvhgkJIZRaSM90JGa4ZW11ie2sSQgghqTatzvQgc1Jawc+3NjsVsWZ71TWzVctpJPfa9V8vzDbZ6rV/tIlpmPJuc30GxZjweNQHkzHWeXAmCQovFKEbSKousBxZwh3Sn/071l2PRoM1Np2JdsFSK6cTIPvQhHXMGdjpMr1I/J/k+tvR1l5WIlOUxQuXtAemYo6u/NM82w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgwmOen68fJtcIgB8Z1K7Vu1/+GYwtO7IXsUyNSu3II=;
 b=DcH+LjBeDuyGdozQ6F6DW3bgiyVEQPxoUZeIbW7kEUFIdQB5IekZ0V3+QB8L0xryKhHD14d0NYyjiOW07kQxyuYPzMgjh9aCx0TRMJjtylrlOLvLdvUg1peN/zm21H0si5mnSjwzuBLcJasMuMeRax2KSgRSi2RCOsSNa0A4tNiwugpTooh14pjyVBFoIM6Wdnnl/XFOKhejTwvIxDJgzAhXBZ7OTVUplbOPlBkRBLYcD1xAPCYPKWkZJlqkydrQykLZkIvQ+/909gktGCXcNcDALR1n5uqjnB74JithdIZ+XTScDPDoMaiLVJEuXuRkYcySa3wyLQ1eMYnR+c8Ivw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB11044.eurprd04.prod.outlook.com (2603:10a6:150:215::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 16:12:06 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 16:12:06 +0000
From: Frank Li <Frank.Li@nxp.com>
To: frank.li@nxp.com,
	alexandre.belloni@bootlin.com,
	miquel.raynal@bootlin.com
Cc: conor.culhane@silvaco.com,
	imx@lists.linux.dev,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] MAINTAINERS: I3C: Remove Conor Culhane from Silvaco driver maintainer
Date: Tue,  4 Feb 2025 11:11:51 -0500
Message-Id: <20250204161151.2179596-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB11044:EE_
X-MS-Office365-Filtering-Correlation-Id: d22fb175-de83-4675-1d32-08dd4536ab31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+KiAdYVTUbe1iQT1gbZ0BGwT1z1wxSm+0lNEWoP2IK1guvtOrS8m1jsM4130?=
 =?us-ascii?Q?0MovTv40Y/NPTxB0akjwRgFLgvCfI7RAYo9Ym0TqXnTuTAEfthpPD1EAQlBr?=
 =?us-ascii?Q?I/YcfkAi9fI2UYwqnOEt9bTuTWXrgF1KZ5QP/OP0AFAzFUmnLKMENwD7yeur?=
 =?us-ascii?Q?LJBjaZUiv8PWGyEUihY6bfcartqS9P3N0+ZuFwBkQliaOLE7ZYOaIXtt1+Oi?=
 =?us-ascii?Q?EF6UKXvFUQsE9o2P9lwvt1+RxtGyAQ21ycZQj0rtH115XhO57sHL4xz+/s1z?=
 =?us-ascii?Q?9wTM5/d/Ag95/7m44T0v0V6fHf1YexhiN+CjE7z2/QgLMeTKOXqvRrHyIlKr?=
 =?us-ascii?Q?htDnn07yMDrbpimwKGsGJkjARQy5r9r1c7MOgYyHQjeq8EisJ6+5sXbHDcbS?=
 =?us-ascii?Q?6M4C0Mr38iwdI6EZipZCs0bdNI+k0McCigAzmtFhb7hLfruiHGlvBtv/35B8?=
 =?us-ascii?Q?H9skp2++0x4JWcdkSGmQC61vf53kt/Aj5gRZcsAoVK81EQt1TkRM2hxPQjgR?=
 =?us-ascii?Q?n/34irUW6aD+oLuaWxNbpXdk/3XJdumz5YsemVak4rQ1k9Qzyq3U/AYIYj/7?=
 =?us-ascii?Q?NgjzJqx1DXwZE3/lyPdEEROlMmS9EWCRkDD1aEUbaRjqkMbmhgFZg73NTvkH?=
 =?us-ascii?Q?32vR0CsQJeWE2ZUYO0bRlq/wJE33TlE6r7yXAoXHUVFG7XAeY7KCP+rPUPYa?=
 =?us-ascii?Q?ECci2cxFp+CdVFjse7/4o38YM7Q+g1Hpxouqfo5sZDO5MgY+nz+jIynKAJ5G?=
 =?us-ascii?Q?yGRJ6N+vvV1KtDg2gTjgy5ecyXQS0DteihO8+9ROMWlKbYtf4cKurYRESCP4?=
 =?us-ascii?Q?GML5XGvjFMkIdcoLRavz9cuhP+VeZoN8r0gr5AraFhHcSO/NgXORizD3WjnG?=
 =?us-ascii?Q?EHnQBkWRQi7MAOmE4jVoWE5nzWHLppOBQ1OAlzpHcYOpHpZ7zm0W2kCkwgrh?=
 =?us-ascii?Q?DKNrcMGTuAfm1YqkqVCVLE8cDWQbDEOWmSqsVuF1DlvlFW1VvGxfZAs3TeY+?=
 =?us-ascii?Q?QIMfiQ3Tbdm+EqlHrM/h3MrUZ257NjbVs++tIz65WEgmukqJiwULziblgjLD?=
 =?us-ascii?Q?ZXeuUrC7RJL2w/gwjiM//526Z72VLyHJOAobByFlrU1QQtUuo14hb0r8RfIS?=
 =?us-ascii?Q?J4MnNHQQD96q5RSEVMaHs4lg0SdYmRnYR88LSBfdy2tu4Qs75LQZ1UlZsMi7?=
 =?us-ascii?Q?hAJ9ojRAUIcZh0TyuZqyG/GSuLKcj6dg/AH6m1NjLd5BWTWzxSu0VHMoilQq?=
 =?us-ascii?Q?X7rxI4/aV5ucmJ2BJiuxbIQ71EAQB9krqUslctPgJ4R9m5ony6acpcccjamJ?=
 =?us-ascii?Q?ON/N6qR7UVuZ5gmJ8/kek0PqPM1j38RoL/QoukwbkBONNFF4bO/b8EFKUPwr?=
 =?us-ascii?Q?AEJLxz+FlN0RUsZtlNcAzIJuWiWr4aOYDHSrHe2YuvuWOS+onw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zcjloaZjjR5JN4TxQ9zYg7N1hcwdihGaX5rDFqUcc3ldqHn5u6c8OyRv2zwK?=
 =?us-ascii?Q?rJajdnNj+xzDLcqnKqoFOg0y8KQe60ofs0ZgKAQMxHVpVSusWGeOKt5ID8eO?=
 =?us-ascii?Q?xW8+SXvJTag7tsxk8O+wQn1o0EdKrWe7gYa21a1HsbfOa2OOEMF0K2CuovFi?=
 =?us-ascii?Q?sBTU4JHR1BY40YVLXmmaYLMny+XcG2Sn1C4WUQ7Vxa+FaBXtP403GFzk2xZ7?=
 =?us-ascii?Q?CGiQrZjhuMBnQpvq0iWA6lGiuYVFRt4lD7pYsrh8tOp71zwD0GMwVtu4KCfp?=
 =?us-ascii?Q?9WYbe82o62a37h7xBHlAoeNwxc49020XJjE2L249XUGMy/fa9GX1Wu5J6N1Y?=
 =?us-ascii?Q?oWE6kFPpWEG6Z1rmnSPZ7lzR9u83v6MRAS7ksD0EsyG12hX/mUGsSNWtnWNq?=
 =?us-ascii?Q?ieP9tGw1be4dalIzAj2P82a6ggPfDDH6Q7YYgqjBhpDo2NSLhrfAnDArWMzB?=
 =?us-ascii?Q?o+Xe88utuscRPVuK5KUHp9p9wIlOtb2WkbgqMBIOR9oFz81uWWhTLbICffur?=
 =?us-ascii?Q?TRD3uBd0RSmG2ulxaurFDYBxE5U1OHbbgRpcKz3f+Y0uHl+FWy7RO86AemXW?=
 =?us-ascii?Q?N8So8IkxA3Eg+hrzUDNoIif4RJp8yYtBTIOmYCW7iiPyd5HwvyFOkOmv8qsG?=
 =?us-ascii?Q?heBpYRKi22Pk0mOGhE0N89G0YwhMboEaT3fhGznIBtT++uboRrIoVs53aPDN?=
 =?us-ascii?Q?xN4asN/ibdB2CIPOEp8Hu0b5mBCADyc52xVS5BCqSvbnPYIASV9Pl2FM8kh0?=
 =?us-ascii?Q?feJ9zxak11iDQY8FzGpA3zqlYTQvSgkgM6ZRXBF/Wqb9ahKeNqAqeTFjCINa?=
 =?us-ascii?Q?5jKWrxFba8xHI93lETwUQUDRNraQm+6o7IDg3O71gjk/LaDOEDjtI0Ybp3Ul?=
 =?us-ascii?Q?lbwOMalvBsDrLxh3BIunjTFJQobNqdgNkSFUArv1q625F6Rfnr1PGRs5Bnho?=
 =?us-ascii?Q?xzPm2PSZTlXJeqDtohhQW8Byv9a6ClrPnuUt/iegLLc934qRpC6/PQXXMkYp?=
 =?us-ascii?Q?foRLpYq5TwPPXDOQBFFYpwSlhqWlrrJGuoU6WLdlcCi6NEZcuYW8ggwcira9?=
 =?us-ascii?Q?CaKH5CR/i8ELIm09eXjzkA3IpW22ERiJ5lu8Xn1YWtTnuMqeYisViZZ47hfd?=
 =?us-ascii?Q?vOLyRtr1WdZcOMEyUux2E/ILyGju1u5NjTJ5ppC9U3q79rSkcLEH5GePCldW?=
 =?us-ascii?Q?9nJETUB/ix+z9lyVZuVSBlSnOXaGqzxTYzOAXdLXW+xiORV4FvKC9yzRoMsv?=
 =?us-ascii?Q?BfpIoGfosMw/gDqUnwTFnCoimfT6plSZMvf8DKVu31f7GoawH9evnynIjei+?=
 =?us-ascii?Q?02Pea6n1zVQwqVCLOlD5EoQ7hhtCqclCSVK8iwLhAXQ86cc/v/mQdmJbbJ8N?=
 =?us-ascii?Q?dKIBzSHh0V3Id8xM9aYDGIAZWp2rQkWU1bgJAYfXV7QQ0OVgEguxM2LnE8ua?=
 =?us-ascii?Q?+or7SVpuvt1Nu0B9pfVyVbMOXiiWQDtFGVghT6ZNw35dmelOealbqMJwbx/A?=
 =?us-ascii?Q?zGXldWL9t2n7Bi6M9bmX6A87p7pfyADNRdvDmmwj+1ccaJ5Rt1+KJV6SNmjU?=
 =?us-ascii?Q?chDGkVRC7TffV8b/1lA=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d22fb175-de83-4675-1d32-08dd4536ab31
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 16:12:06.2424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z0fBmljZ5JLpzXUgRPcrX9K4ucvxYJ38VBySyNPysAn9cHE6O1p8A1qIphVxae/Quf9GahFLE+59PDXT+SFw0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11044

Conor Culhane's email address (conor.culhane@silvaco.com) is no longer
accessible, and there has been no activity from him on
https://lore.kernel.org/linux-i3c/ in the past two years.

To avoid email delivery failure messages when sending patches to the I3C
mailing list, remove him from the Maintainers section and move him to the
credits.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 CREDITS     | 4 ++++
 MAINTAINERS | 1 -
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/CREDITS b/CREDITS
index 324428ad37e83..89a86bebd9b58 100644
--- a/CREDITS
+++ b/CREDITS
@@ -855,6 +855,10 @@ N: John Crispin
 E: john@phrozen.org
 D: MediaTek MT7623 Gigabit ethernet support
 
+N: Conor Culhane
+E: conor.culhane@silvaco.com
+D: Silvaco I3C master driver
+
 N: Laurence Culhane
 E: loz@holmes.demon.co.uk
 D: Wrote the initial alpha SLIP code
diff --git a/MAINTAINERS b/MAINTAINERS
index 51e5f43c63544..40d1b7ec30fde 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21661,7 +21661,6 @@ F:	drivers/video/fbdev/sm712*
 
 SILVACO I3C DUAL-ROLE MASTER
 M:	Miquel Raynal <miquel.raynal@bootlin.com>
-M:	Conor Culhane <conor.culhane@silvaco.com>
 L:	linux-i3c@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
-- 
2.34.1

