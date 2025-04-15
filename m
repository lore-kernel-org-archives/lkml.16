Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on2137.outbound.protection.outlook.com [40.107.215.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC61D274FC7;
	Tue, 15 Apr 2025 07:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702053; cv=fail; b=UgRlEZuhaPcKduOEySNfVGH7VBrynBT8y7XJb6GiGOqRSXpbRj6p9gCro/nLwse7XYMTpdEut4H51giub3h8s8IlklmwzEEEM0uTUt+xWsYen7zZ2bS2iJKjzuNycGryLbVjgyZJcCNndHhzohh74Ne6K+shC8GBixA88ZIZXoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702053; c=relaxed/simple;
	bh=Tx0CeK12rw8fNnV+a43EhPsd3vEgR7B3QwBn0narui0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QG6jYcbJDzcePWvaeM2HlEtURMb1tKVKRT5aEFo2nd7Fd9WAUP8IEdjVSn9lUHvr3ghzgBJqMiRZJoHh4hpJDpeBSqxE7EJ8EpzH9QylcN9ZXVJttvSft7kVitfh0cKncu+Wx5N38QY/4SSzbIDn7aVMCndPc53GmOE9/j8jbW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.215.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TemK2R/znsKsWLvON+WQ+DRifovDjCMozro+MUKDFpKVDXcrRUyzdmEjVdyY7/cbyQYq78Tb1tRQwDruvvW0G+NcJe6OohC//qgK2f56KjSCLh2nmDqw5+pawtg4NUU4UhZiIx+VDawTbLR3TqIiFT9bP4bZMiGBiAj0oybC5HZS20SPZAxg2d/ta0y24WJ/LUgKdl4cGc7e+q7LC2vNXr6/FOwwsf0gmlA02vM31he1HKAlTXBrtfF55NBnzQkEP3oSJeaUh/StBSbZU3/8wPjnsSV/QbFpoqg+LMPrKuXnXQ+oKkYJ+x8ZEa0Rjc/u0C5lXfsaUnNuTrTl/7ZETw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pheMVA4F2yQ/mZAq2Tm3+5kIP/DPHkXoE3b5n9yj7P4=;
 b=FusB6+61187WWmsOxZVVofKqcTwVJspmDmJVipo1TMzhVD7WH7DgVLkbqoJ0NJ7Rvl0DnVBpZfoBCBNtvt8uEnUXpeKal/jLFTrIeUDzeLmEQWRe4r873h6GkJ2gIpRRFFcRcBbtK48FWx9B3216ZNEh7qUjowQA7T0wTtsOk9jiqqco1YpAGQTausQKbd4hkntOkwq/gQvq2Ht9opW7rQ6utp3jkmzCkF4bEzfxETxc5Y82Lsm5sQDjihkj53HcH6KeYY24CLeZU5rg1lUuzO0WzLnfoG13okbFkkw35Kn3ULcuFoV/SIaIrvY0eQnfoAlAHLsn36C1dbBHNfCGoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PSBPR02CA0011.apcprd02.prod.outlook.com (2603:1096:301::21) by
 KL1PR06MB6110.apcprd06.prod.outlook.com (2603:1096:820:d8::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.27; Tue, 15 Apr 2025 07:27:26 +0000
Received: from HK2PEPF00006FAE.apcprd02.prod.outlook.com
 (2603:1096:301:0:cafe::6d) by PSBPR02CA0011.outlook.office365.com
 (2603:1096:301::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Tue,
 15 Apr 2025 07:27:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 HK2PEPF00006FAE.mail.protection.outlook.com (10.167.8.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Tue, 15 Apr 2025 07:27:25 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 150684160CAD;
	Tue, 15 Apr 2025 15:27:25 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: soc@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	jassisinghbrar@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	maz@kernel.org,
	kajetan.puchalski@arm.com,
	Peter Chen <peter.chen@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: [PATCH v6 10/10] MAINTAINERS: Add CIX SoC maintainer entry
Date: Tue, 15 Apr 2025 15:27:24 +0800
Message-Id: <20250415072724.3565533-11-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250415072724.3565533-1-peter.chen@cixtech.com>
References: <20250415072724.3565533-1-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FAE:EE_|KL1PR06MB6110:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f0e6182a-94d2-4c75-4890-08dd7beef8ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WDh9nttuICXQObVStzdhn2Rc2xcSOd6spXc8WU5g5WiBGjtONblBO1IK/uky?=
 =?us-ascii?Q?vsNhyvMhMm5WjMrJTnAI+WesmmCTG/3XuZQOYEQ3SHflWOyOXff73HmenjRQ?=
 =?us-ascii?Q?nlrxBVn91gqwQ2fGK0TFBn69lGnsynEQVy84BmmU8e4th0KQpKmcsmLBh38A?=
 =?us-ascii?Q?TDdYiKs9jsg9OyxlQa4yj3c4GEvH07LFwwmbM160jeAHcFDaB43+MVcekFnx?=
 =?us-ascii?Q?Mq49u0ec5duqPAOQEYJxDikQv6IGBfGT3+UuVPgxhBMQpcryppMA6pimdr7M?=
 =?us-ascii?Q?DD6bkcW49qP7CneXVKyB3lDdvMJ7k/Qry8MBjZtuSINAo0vLark+pom2qIpH?=
 =?us-ascii?Q?RmA0Z5u9nVC9GTmidz5QH6jNJSvydBoBTzvT2yzhpbbQiG2OSY3mssX2t56M?=
 =?us-ascii?Q?dBQy7cQNq7hth9vHYhRq/35djTYqUEWlzjBnWrwsJRdLYsLWrWOBd5PCbMvq?=
 =?us-ascii?Q?cG87gevmr9uxUy7/Zqk/EUycXlhPCi3rJvH9HlP9hJ6vYuCe6+pVZ0Fqnhi/?=
 =?us-ascii?Q?JGPJFjXlX5KXQEIYrJoMzm0fWZz2mfZ3vKKfrpqTHITfLFP7oVprBFXGWTtw?=
 =?us-ascii?Q?nHCp6tskh70/GcQsw+36Wo9Ex9s1yd2DFLCWFC0WitgPUYVNYDlSTgohs+C3?=
 =?us-ascii?Q?eNAksSLXbgMo6y+xm3GrB5e4x5MO0QOFNJ9fWbEqtD4/1u5mpnJNqR5WQh+T?=
 =?us-ascii?Q?hffKpAySH+yYgGW9SBlLuqNDW8ED6gZBixuGN9gsgDcNsFuPqdHtq1KrIZug?=
 =?us-ascii?Q?rXcKlG2C8IIlZYoAbgyQog3nNpwP75oJAMKFMHgKE4wDQy3z2TS1sShZwhyP?=
 =?us-ascii?Q?6DkENdx2/0EAzEvx96sPLY9FwM73Vcldsl9jB2gJ77Il6U+8iEWTr/xs586+?=
 =?us-ascii?Q?7TstfLkvxiwwGv7heHRlVbqCdLe/9hPimG2/Oe0YSn+7MZtB/KXmv0x+q+zz?=
 =?us-ascii?Q?4E93P9HIA/psD5YrBVKTbTwkBrnxdg3wNLzfpBt36UJE+UQtUovBIao6bLph?=
 =?us-ascii?Q?Ao0ZqPyHKwcyAwhLZad8EFOBnKkMLKnRQHmKyCkdUPUhmQ08KbT9HDwkgCq4?=
 =?us-ascii?Q?Kt/L/T1DNdrZkSwmaCOnRuxi/ajQ66JLKyW+gncFY+ZyvMrtsKoW6ISVo8JC?=
 =?us-ascii?Q?uqBJBGjA3gWO0NZfhLbpZIDNCq2iwLiCzdhHKffVk6R7WwqN8qhS0tlewy4O?=
 =?us-ascii?Q?pY2NYlptvvc9zaKXaBawvlt0Y9pqG76YDnqbeXzYlBFqCL76XtBoyDnQAI3r?=
 =?us-ascii?Q?ZbaQwE1J2ukjbe7tydjaj1aebmCm1qI0PgQeijOft8HlcgsGxwoG6Feg3t2D?=
 =?us-ascii?Q?fuqcDYqgzwqmPR9s0yLMjN9H0WqufGhQKyKtbWDRbIbpcU7yndRYyGaLjcBv?=
 =?us-ascii?Q?E2QG7VlPQPHwVlpA/aCOqqt8DmTpKDNN3ZfAvi2Rs9JkJz7THK0e3sCBlG8S?=
 =?us-ascii?Q?frOTDnxVcu2M2RdY2dMSsyDsPiZRj0Hr4Sv+E8fPXbRy2Tags1Y6T/SO2WMA?=
 =?us-ascii?Q?Sq1FkefLFZjDazE7EawlKU0QTrZZufBe6WR3?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 07:27:25.9652
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0e6182a-94d2-4c75-4890-08dd7beef8ee
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2PEPF00006FAE.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6110

Using this entry as the maintainers information for CIX SoCs.

Acked-by: Fugang Duan <fugang.duan@cixtech.com>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c59316109e3f..169b89eabea3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2404,6 +2404,17 @@ F:	arch/arm/boot/compressed/misc-ep93xx.h
 F:	arch/arm/mach-ep93xx/
 F:	drivers/iio/adc/ep93xx_adc.c
 
+ARM/CIX SOC SUPPORT
+M:	Peter Chen <peter.chen@cixtech.com>
+M:	Fugang Duan <fugang.duan@cixtech.com>
+R:	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix.git
+F:	Documentation/devicetree/bindings/arm/cix.yaml
+F:	arch/arm64/boot/dts/cix/
+K:	\bcix\b
+
 ARM/CLKDEV SUPPORT
 M:	Russell King <linux@armlinux.org.uk>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.25.1

