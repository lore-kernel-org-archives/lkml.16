Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazrln10222018.outbound.protection.outlook.com [52.103.171.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518C22628C;
	Sun,  6 Jul 2025 16:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.171.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751818559; cv=fail; b=AqNQ6v06NY6ChRRs3+5txdO89+iaYVDIBHWL7tig/uwiICa6P36kOyeN5KmAwq8CjQnkIFX4qynkxeYBiWzYFpsrK/S4w5RKJx1TgDDOY9uwaU47SOW7wKvxo/gaFqUGsDUVzYMAv58Mo+Nn9EG8s2SlhEhO/c1ol/V3UGZm+1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751818559; c=relaxed/simple;
	bh=f06z6MulOoq35pk9y7Z5bTztTVb2ZPSPycP5W45txEQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hSZHWjuv5dH4S9iIxVsnk/QVXnAGRXFi2JaOCdiPcpEUEg/kSo30iYxnW6SyOt2cfYhKzV/gFxKcA9JTePv6IUsNb9n47jzctX+XzCHFn848jvrGxdCdHasPegSgjMF4VWhEvuuGGUFGgrE+UAZ3ACUgsB5AuHCT+TbbupOo0LU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=none smtp.mailfrom=taln60.nuvoton.co.il; dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b=WGidmDgD; arc=fail smtp.client-ip=52.103.171.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=taln60.nuvoton.co.il
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b="WGidmDgD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WWzt6V6CZ0wVn8Yx0M38zO4VphGXkwe1XfTextXVMaGSV/1mNPSqnOEzk9PqZl/KURqA7KB/F/Kry9GzB2kKlsL4ZYADFoqg9t/w9swwbtyDqktKKKRe2ur0WIcAzce66ipgydMHthxzp8uuMHG+yqCwLkrLdFqqV6f6RYbGeQ+qvIQF7+BYj+luEwnyNHm4upqqf+BguJ6njd8TJhYsIZY9dKz3rUvdFHGe11n6G00zAqAeWj1FH4Kr8dG11eOvUukAJdF3oFeN6OYplLfTgvp3qp+Hh7JbKiAOvp2H4scKYeZ25OGtipEPg2orSWmvpkbALuEXi4QVDnFZEPH4HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PWkrVEjH+Kng9OzO2UeygUYz6JuQlLQhSUoFiGBq62U=;
 b=maxLllMBoZxPQZFuhrPhaZOCdOCPkTpVqdqieJN93GrMuw+PO58iWExqgAm41ApKkaxDUHFLym3ZDK+tT1IxR+p/c451oBxALNTBfD9I+5wb3OztWxHFDlD+Wh7xWTh8diZtVlqLTHw7CRj7gLhT7/OaJIooRqRT2kfxyqEIjwWXcj4EauyqPzXnq98eA664q3N3enZczMuGX7e1QxSnxQqELCRjSX/sk38pAUWMtIiF8iFa281nMfKqhbfd9fBUWkNWIOBsLqWKVC0NDbxxSz7Fb1kauXMmmFQaZ/x6LKPV5XBJh6UyACQUgHtkFYx3TJBWNN9jo5wGR+dPRF4XnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 211.75.126.7) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=taln60.nuvoton.co.il; dmarc=fail (p=none sp=quarantine pct=100)
 action=none header.from=gmail.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWkrVEjH+Kng9OzO2UeygUYz6JuQlLQhSUoFiGBq62U=;
 b=WGidmDgDTYcw8RjHk5FMpeIWOVMA/BiZkCgaBLBOMyer0c/cwMspGI7YM16VQn2ok+38mpoNREKET3Kn26qiE7IO25nx3oa3HNFBLsVzmanGQAMX1BzzD0GsmR1iMX6IeRc6uH7gaG+N2YUmpvftUIr5nYD0JHE4frLT5UZfAbo=
Received: from SI2P153CA0004.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::23) by
 TYZPR03MB8839.apcprd03.prod.outlook.com (2603:1096:405:a5::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.23; Sun, 6 Jul 2025 13:42:18 +0000
Received: from SG1PEPF000082E1.apcprd02.prod.outlook.com
 (2603:1096:4:140:cafe::e4) by SI2P153CA0004.outlook.office365.com
 (2603:1096:4:140::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.3 via Frontend Transport; Sun, 6
 Jul 2025 13:42:17 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 211.75.126.7) smtp.mailfrom=taln60.nuvoton.co.il; dkim=none (message not
 signed) header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of taln60.nuvoton.co.il: DNS Timeout)
Received: from NTHCCAS01.nuvoton.com (211.75.126.7) by
 SG1PEPF000082E1.mail.protection.outlook.com (10.167.240.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Sun, 6 Jul 2025 13:42:15 +0000
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.44; Sun, 6 Jul
 2025 21:42:14 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.44; Sun, 6 Jul
 2025 21:42:14 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Sun, 6 Jul 2025 21:42:14 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id C9F9B5F5D9;
	Sun,  6 Jul 2025 16:42:13 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id BA2C5DC3163; Sun,  6 Jul 2025 16:42:13 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <avifishman70@gmail.com>, <tali.perry1@gmail.com>,
	<joel@jms.id.au>, <venture@google.com>, <yuenn@google.com>,
	<benjaminfair@google.com>
CC: <openbmc@lists.ozlabs.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 0/2] NPCM845 reset and clock device tree updates
Date: Sun, 6 Jul 2025 16:42:05 +0300
Message-ID: <20250706134207.2168184-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E1:EE_|TYZPR03MB8839:EE_
X-MS-Office365-Filtering-Correlation-Id: 42f7e12a-542c-429a-96b1-08ddbc92eba0
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|48200799018|7093399015|35950700016|376014|7416014|35450700002;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zg6/V6ZICYcOdhVwlQ03c7Z9BVCSCAXlGT3rI5el1hdh9Das1gjnVi30RNBu?=
 =?us-ascii?Q?/pXc9lNtEfBeB1OhbarC3f56hiq9Y2LvdkkGFF6U/i/+BfTn3SrAq6jiszY5?=
 =?us-ascii?Q?d79yrPETFVHKH2ryNEgUwr5O4+FO06cx/PsdxLE/bDI2vSTSNa2rRPpKM+ZN?=
 =?us-ascii?Q?ILjm2CWkzkPbKQlTPYoAEdtWGsC+m5ib9w9qTBg/3CotazRokfqlqPNRhlrC?=
 =?us-ascii?Q?YVqDXvUJBj+p/ZO+7Lci2Y6chQSpXHuaCaYL7AiFsdxugais9+s/djHI6yvL?=
 =?us-ascii?Q?ejYK2n5wBniaQ3EbIDYr+1iKZcHi4PtwCpMhzvzkp08RnuHuy9tGcZ/ZZYt8?=
 =?us-ascii?Q?xmvwudx2w2Dl3zeyldn79oSB3w8Rnwri/vzMUW2wqlbeBsm/pNQmGYfaSLI2?=
 =?us-ascii?Q?CLu2rQ4XHSy6EwVUKSs7bXIZz4sbq20edMSAoSGqYi7sES+euEmtOoH9KiQh?=
 =?us-ascii?Q?1SFrgRoIEpbtoUYkD75VK7LeFyxha+nnAMDmDIQ92O3mlwy11Y66aDpgvaf5?=
 =?us-ascii?Q?1hUFDraRX8uxN6107qzaQt17qi3ttaZ50wnlop3UET+Z28gEoZ5A7l9tlc+O?=
 =?us-ascii?Q?M+6s2mLZ8ez+PNz6IHtwDAfUDE3jTOFnsgOrJxdQ49X7XtOuFpfsLlF0hxIz?=
 =?us-ascii?Q?cloFu7NO4rT+cEFiPzbV9wMu8QG3UhsyKH5qaMCNLUYgPwTvhOFv3LuWu4QD?=
 =?us-ascii?Q?bnncbfy7yXIHSn7VD2UL+w5gO0C4k6Cb99nfqcWl74QC0YzEFnvMtGZrroQt?=
 =?us-ascii?Q?3BawRzJcYfzT+DzqXudZ5qJof9aqeP2zQr6HpDshMobl398qvIwiRL3JvYdJ?=
 =?us-ascii?Q?paAMQ50HSVsDbElMkicWNTI+MrrwarqWDPqL5gmxjXsPNxxhiO3ZzL1MjTnx?=
 =?us-ascii?Q?uUU60QcGmsP0/CZL6ryUzXipi039OPIgxaC+BRbW9+8Jgb1Z9ryFr22fdx2M?=
 =?us-ascii?Q?8I0KoVgjcG3ZzuqkOO6RXnf2yvW5SdEoWym7rAUyL9grcT+Oy7VjsQUKKFLc?=
 =?us-ascii?Q?PEbHs2D0fjnR5odTYD1lwFtUVsc3/mU9d+p73GvwMFmGDyK1uYh/YM521J09?=
 =?us-ascii?Q?T/DIZCYrWmFi7Gs1HCA7tPcdgaQSiTBZNGZOc8HOl4P5H3CGBMMVbIQE9b53?=
 =?us-ascii?Q?jQP4YA+0yuVbKTpe05njh/srNLzyOA5Z85YZmd0TzkQXrk3k3Fewy54t7a+H?=
 =?us-ascii?Q?1c7qwUrEGB7CvSUEjqAXp1ZtNbzvxtxebnev/imxn1EPDtIjjAGE8j1PYMn9?=
 =?us-ascii?Q?z2wXOWVJ7WFoo6CR0/+Lbi7tiZi4MUc+kRulraSlrcvsm0hGn/RMH8Htg3vF?=
 =?us-ascii?Q?1cplhZIVvnK0eA/MUJC13ImSbemsZna97E54Lr4EgfTMC/qi/72chVoeE02M?=
 =?us-ascii?Q?GPwMFvUt4tyjuZVYV4kp6gjVI5Cvz0XSaIeoHXUHr3cUbz/x5+Jl9gAkdgku?=
 =?us-ascii?Q?PyFRhMoMjB4Rc72w/n588la38w00wPZbelNlHZS8oMIYpy3q3nUxRf/gmxG7?=
 =?us-ascii?Q?nxnoEak8nnOHdVRZ0Rfbn8IOJBreVP3XCMu4?=
X-Forefront-Antispam-Report:
	CIP:211.75.126.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS01.nuvoton.com;PTR:211-75-126-7.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(48200799018)(7093399015)(35950700016)(376014)(7416014)(35450700002);DIR:OUT;SFP:1022;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2025 13:42:15.9720
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f7e12a-542c-429a-96b1-08ddbc92eba0
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[211.75.126.7];Helo=[NTHCCAS01.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E1.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8839

This series updates the NPCM845 device tree for the integrated reset and
clock controller using the auxiliary device framework.
Patch 1 combines the reset and clock nodes into nuvoton,npcm845-reset.
Patch 2 adds a 25 MHz refclk and updates peripherals to use it.

Tested on NPCM845 evaluation board.

Tomer Maimon (2):
  arm64: dts: nuvoton: combine NPCM845 reset and clk nodes
  arm64: dts: nuvoton: add refclk and update peripheral clocks for
    NPCM845

 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 20 ++++++++-----------
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  |  6 ++++++
 2 files changed, 14 insertions(+), 12 deletions(-)

-- 
2.34.1

