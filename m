Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazrln10222018.outbound.protection.outlook.com [52.103.194.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87040F4E2;
	Sun,  6 Jul 2025 14:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.194.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751811257; cv=fail; b=IGa9LqnryOZcVbAERlJ/mxSZT5NXTdsZnvVaTvCdzFnO7Fu+rdyawepTKMNAPkWx7RO2mwdWdqQS8lpv5c9l1M4H3Mr3DBOkcoqF0HNaOQdYxGZ56TKhp3jE7dBFQsKqRSxC9EeDzr3yB2i/Qb05drx/2yiPUGxXkYC4098n69w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751811257; c=relaxed/simple;
	bh=H5FLtaZsQXutzGECPQ6miEskFjXMJ9XRwO8HCVTmTvM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P3GPUTh0NgQbqcPwSkT5K4neHTSOmClbu/CgELHpq/2ZxpZoHnLBgaRv7ZLzbjbsP0dOmumBfLsD7+VgOKq5r8kM/bPxxrKcW14hFlLRZFXPhVqG5xMlyOu4ehgbcMlNrH8hN8FGLFXx8zOY5sD77Alht5CurDcQxhLrNFa9iOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=none smtp.mailfrom=taln60.nuvoton.co.il; dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b=tV9HqWWe; arc=fail smtp.client-ip=52.103.194.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=taln60.nuvoton.co.il
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b="tV9HqWWe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Drp8TUHm3LZDSp3y/EhDqsEOgdg1z+B5Gyhj8tqOXdcP9KgsTxHROaRtrAbSe48S6bHnVOIWOjchYUH86dW1Q351F6GOIpj6R3vIbezLWWWWrpvzyenBuFPJFtKGyksPCK8mDQD1bzkdA7PaenTQPlEiMRasAZgM/LahU0sGUt90xucTuX6kXRyFqv5mzKaqAosdtw2L3lsTzFgI0APTMDtBDBEV+2Z4Z3qPk49GJLQN7slZ5Zaa8BAO8miyuXY53xfzj+uDVTZcBs+77tDW5ZU5kiHe7D62rAsNhfmu47eyrsUJ+FU8SW8tQRq3wSf0W4P8KCW3VSPQrXSkUf/ujg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHVP6Jxn9qePOmfBPh2lMaoICnHmKhheR/oyM5OYcms=;
 b=sMb63v75TyA669/zoIkoArKNgtaY/wVogdoFfkmE53cuGDIbX6eZeAW6Akm1YO7ZwFlFluELrSwnWrcDQZStxeqITa1/CAL2AgBeZX91vOdiQgQuMf8LVbqTWQjFH69+nzFrQGoBt5fqL9h3gwXnVfQcuA4ZFF8ZMlf3Bd8ZIY1sI7KxeVPnQSKtOEstZjpRdgFR3rIBpEWj7KlKBgHBAd6JX2u0wXB0fk+R8/2BAqB54yQpkqpZVpEy3PYbFg0ydSDhTGMyIAwNbIEvF2nLN6rldZM0VG37a+kN4LqrvcyIoth1Nl4z3JsaScszH4gaNk2QNHu7MZ7KsFvPv4pwwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 175.98.123.7) smtp.rcpttodomain=gmail.com smtp.mailfrom=taln60.nuvoton.co.il;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHVP6Jxn9qePOmfBPh2lMaoICnHmKhheR/oyM5OYcms=;
 b=tV9HqWWeAn3fGeQfVCVi7kQsM+CcLIL+2Tb58QlmPs5i75bttZRoKgIzh6ZS+uP8E/wHHCE9gIm7z/9sH+DBZ3jL6Ohb5RLe0A7hnVwdz2O4S/uJopRivWveSq7wU9GKnsQ/OvokGKPsIv74m1hYkTSaRACaIkUhIu/M/Uyxvd4=
Received: from TYCP286CA0098.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2b4::19)
 by KL1PR03MB8317.apcprd03.prod.outlook.com (2603:1096:820:10b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Sun, 6 Jul
 2025 13:42:21 +0000
Received: from TY2PEPF0000AB85.apcprd03.prod.outlook.com
 (2603:1096:400:2b4:cafe::b) by TYCP286CA0098.outlook.office365.com
 (2603:1096:400:2b4::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.26 via Frontend Transport; Sun,
 6 Jul 2025 13:42:20 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 175.98.123.7)
 smtp.mailfrom=taln60.nuvoton.co.il; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: None (protection.outlook.com: taln60.nuvoton.co.il does not
 designate permitted sender hosts)
Received: from NTHCCAS02.nuvoton.com (175.98.123.7) by
 TY2PEPF0000AB85.mail.protection.outlook.com (10.167.253.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Sun, 6 Jul 2025 13:42:18 +0000
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.44; Sun, 6 Jul
 2025 21:42:15 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.44; Sun, 6 Jul
 2025 21:42:15 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Sun, 6 Jul 2025 21:42:14 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 4BA8F5F5DA;
	Sun,  6 Jul 2025 16:42:14 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 48D2ADC3163; Sun,  6 Jul 2025 16:42:14 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <avifishman70@gmail.com>, <tali.perry1@gmail.com>,
	<joel@jms.id.au>, <venture@google.com>, <yuenn@google.com>,
	<benjaminfair@google.com>
CC: <openbmc@lists.ozlabs.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 1/2] arm64: dts: nuvoton: combine NPCM845 reset and clk nodes
Date: Sun, 6 Jul 2025 16:42:06 +0300
Message-ID: <20250706134207.2168184-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250706134207.2168184-1-tmaimon77@gmail.com>
References: <20250706134207.2168184-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB85:EE_|KL1PR03MB8317:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a02e867-afef-407e-9b05-08ddbc92ed47
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|48200799018|35950700016|376014|7416014|7093399015|61400799027|82310400026|35450700002;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1J/ceICg/rMkBC8jNfhibEMvJyI7S2Tj9ptdbUDUhi3V0Dof7jWLduhl8Yi5?=
 =?us-ascii?Q?bU190GbRIknyJGGfZwwbnV+jlMMw/5r6kZuwJIouHrFZriR/DUqHxAyOZ+XI?=
 =?us-ascii?Q?X5vawo8hAp/9JLcB7Fn+EGZRk7cJMz9wcAReYP+WCZ8LeU+nb+f9J70ghal/?=
 =?us-ascii?Q?TDcIiNZvcofWxWNRIgm6ASf8rEmpqoB99UIyHuga98wlrk7omdLjYTtc3C1m?=
 =?us-ascii?Q?rM6Dt8aGtPSYYute34o1gae55ZwHjISKlggcdFJWYUloNOjxYqN7F4H48KUY?=
 =?us-ascii?Q?ltfFgGKOdZNtKWjn5nxa+iviQ9yPiGvN4XdG1H5twMs2FGJp1bvq3IqHNQM7?=
 =?us-ascii?Q?9fxK6figXtDO0WBP8UWP8GU0dLYqeL54AEj0LUnfPEFws8faPUI+qDf/QOuX?=
 =?us-ascii?Q?Pm3EsUi5Mb72NupoxR3xb6qM2W/JOCjAe+8frGSxPGukY7YGrZN4JnFxV7Xl?=
 =?us-ascii?Q?8zOmfJgABVF2nyiX4SsDDHYTA8H9QC1dMyneqcZp3BodprQtVOY+7gRv2lJY?=
 =?us-ascii?Q?eRpBm910WgqxSy6eFPtu1nVymwH9a28d6vWFHHhGSZ9Zko5bR2e8pzBQsCYg?=
 =?us-ascii?Q?N4xWOcHf0n9WAyYw3Af23XJKWJ8n1IxmoiynhanRmgdWqVU0VsxR9Ngprb4u?=
 =?us-ascii?Q?E2/VZDMWYR3S8y8cG5Q+v/WKXXC4yrPfklcFyZ2hJebYSxHeJFj4Dy+l9mX7?=
 =?us-ascii?Q?qDHKRk/dIQveYfr9i8OS4QQp+S79kFUEC9EPJ6SAdbysI3574kv5FKN1JXJK?=
 =?us-ascii?Q?AQ1D1zP4Ljyok9QvUTmJbJeZuGzPyMJMeq6ZpJVqC6yGwz29mTe0inPyTOMU?=
 =?us-ascii?Q?gnRKgd3H0ziPiegosY25t5RsFkg2BczuJD8nobzXjQSlJj2FE9OJ8hY9ietv?=
 =?us-ascii?Q?zOAFPwzfiYgEKimq60oKdMv1VzxXs8+4AiQiccQAWyFnU1VfTbRoTZGLbqaj?=
 =?us-ascii?Q?J8vIJO7o9uQiEFNFlU8jqBC3HXlkvvIHibx3EKtA0t5YJLtu/EcqTXtE+SvY?=
 =?us-ascii?Q?Nuu/mB/P9WHc1I8BhYOSiDdgHjlgJxTuvWFC1gyRQcLqTphZJXpgeq5jeRQh?=
 =?us-ascii?Q?6P/GLbppBCbHe5ljQeinCxqjgVmwn/GW0wBK8iI1kgn9tp1xKs1/738rorE4?=
 =?us-ascii?Q?FZmaF0XgvMeY13/JevMp5Rhct20AEA6i/EGa1B7Af/jn10sIbJhwy0bhQbJh?=
 =?us-ascii?Q?QZ7a0QGcb0p5KGYBLgTwbw+yyCbUjA3CE44tfeQjezrMocMcUrq/Dpo6Fu9B?=
 =?us-ascii?Q?FvGKOlBcj+1Z0alduK6dk58Lq6C9xuAJEBQmlveLAQXmR743NDElpFaZBA5O?=
 =?us-ascii?Q?Dz9wjmHKpdPEFDLcyJEIL4U5WvhhIDB/kXF66W1yjtqeB6T1V9G4sNqqmKxN?=
 =?us-ascii?Q?L9nS9qIP8o/wfBgUVgx962nVysNusFGcXqxMB1TksiW1nQGcWJZM1AnnXT17?=
 =?us-ascii?Q?ZM1Mg3miIeyBuZHaoV9zYD6vlB6BSKLhebYINXutOoUuKgs/z4nYqIcwe1v+?=
 =?us-ascii?Q?dCqRcOJiuXhpGZVLLLs9xHAc8TyfqZ3BOu2g?=
X-Forefront-Antispam-Report:
	CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS02.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230040)(48200799018)(35950700016)(376014)(7416014)(7093399015)(61400799027)(82310400026)(35450700002);DIR:OUT;SFP:1022;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2025 13:42:18.7782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a02e867-afef-407e-9b05-08ddbc92ed47
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS02.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB85.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8317

Combine the NPCM845 reset and clock controller nodes into a single node
with compatible "nuvoton,npcm845-reset" in nuvoton-common-npcm8xx.dtsi,
using the auxiliary device framework to provide clock functionality.

Update the register range to 0xC4 to cover the shared reset and clock
registers at 0xf0801000.

Remove the separate nuvoton,npcm845-clk node, as the reset driver now
handles clocks via an auxiliary device.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi      | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index fead4dde590d..2a36d0b2824e 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -47,17 +47,12 @@ ahb {
 		interrupt-parent = <&gic>;
 		ranges;
 
-		rstc: reset-controller@f0801000 {
+		clk: rstc: reset-controller@f0801000 {
 			compatible = "nuvoton,npcm845-reset";
-			reg = <0x0 0xf0801000 0x0 0x78>;
-			#reset-cells = <2>;
+			reg = <0x0 0xf0801000 0x0 0xC4>;
 			nuvoton,sysgcr = <&gcr>;
-		};
-
-		clk: clock-controller@f0801000 {
-			compatible = "nuvoton,npcm845-clk";
+			#reset-cells = <2>;
 			#clock-cells = <1>;
-			reg = <0x0 0xf0801000 0x0 0x1000>;
 		};
 
 		apb {
-- 
2.34.1

