Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11021115.outbound.protection.outlook.com [52.101.129.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0250F19D093;
	Tue, 13 May 2025 02:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747101818; cv=fail; b=JVnYo/8Q0HqNF4q0rgHsVejMIqOnfe16WQJFxBzRx7uGSTctnhyub2+ZFng2Q+4yuV6bkOSomBJAYi/Ru0u/nQBfJ7oErte6ceaeqPfF4sTDjUNQnwrtnc8F+Nl2RQJGcMAHfBwdhHMOlB2/jRCWMDsPP9Br+IRkhvPEkSsl/qU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747101818; c=relaxed/simple;
	bh=Tx0CeK12rw8fNnV+a43EhPsd3vEgR7B3QwBn0narui0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fiigAsS8znCFABGT/MpAcp+rYmp2d/P1Q8H5ZxGdhIwejEqyoY74YjXRA8qzedrqUpsLInkRdqT6vJuRg3fjb+kQ/VWF0Y8QCPA8jQEy0pViC60i+Xc2vhjWrzWJKGWHPivsdiPOch98yQmDnDGRTJCWeWCqgoLDFXw961cFot4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.129.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IcFujacqYxnnEZSx4fC/DxPq1zVb1WRTzTQWBcEVbtYegFpxIbeSEg6jdoNbZI7q7d38K+WOOlQa9fItSt5y2dq2jQfw1B8nsS2rFT4anYFkzvZhGGN8TgOgMRmbwn5ykKKs0rcLb1nbeT47EFczI1Mu/y+St4CuF+FJjRTr90jOYPkB5mhgF5FHQkRBHiwiw7ZqyBRgS7IjAnrNm6qUE/XExTu0YVfg04keTdt5HbsIzQxEp0uyr3GuhzY0Aq/d+KGYVoHUo19ohe4SNCAZ94KvopuAGqYFq8OmFhYQXrqGyjITaE3v+vrxGAd0bV1AI1f8yOroZAgQrHm/j8aNJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pheMVA4F2yQ/mZAq2Tm3+5kIP/DPHkXoE3b5n9yj7P4=;
 b=bo8WJOd/byWK4xP4B/5H57V6IeEmzSBj+x5E/77cAY2EvAzihnFGExzQ68l4/+IeDh5ndOjaB+PeFZtPqYMLh8neqel0RFvhb7PMhD+OCTtLper0d3uHoe0TMIrsCf4wBXYBH5N6DlZm5BdSd9gVd9flLaIIJ+M/KM0EF4/uV3+/D4u4vzshtqBRSOz5xnPEcmRgvzVcA4mDyPiXVEEyaUFVyXbuXOwi9TOIP5s+qULLYWx6Nfbreo90jOzFFtfCVhXLJjTdQ0HD62fbjZmceGslByB+uh6tl+rRwNSYywJvqe2LKQqRHFN9Q/mDCRhHxN8N9DRY0rooUor5m+r5OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0212.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3c5::16)
 by SI2PR06MB5244.apcprd06.prod.outlook.com (2603:1096:4:1e4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Tue, 13 May
 2025 02:03:31 +0000
Received: from OSA0EPF000000CD.apcprd02.prod.outlook.com
 (2603:1096:400:3c5:cafe::4b) by TYCP286CA0212.outlook.office365.com
 (2603:1096:400:3c5::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.30 via Frontend Transport; Tue,
 13 May 2025 02:03:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CD.mail.protection.outlook.com (10.167.240.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Tue, 13 May 2025 02:03:30 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id CBAD5416051D;
	Tue, 13 May 2025 10:03:27 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: robh@kernel.org,
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
	sudeep.holla@arm.com,
	kajetan.puchalski@arm.com,
	eballetb@redhat.com,
	Peter Chen <peter.chen@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: [PATCH v8 9/9] MAINTAINERS: Add CIX SoC maintainer entry
Date: Tue, 13 May 2025 10:03:27 +0800
Message-Id: <20250513020327.414017-10-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250513020327.414017-1-peter.chen@cixtech.com>
References: <20250513020327.414017-1-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CD:EE_|SI2PR06MB5244:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 369420d8-b6f5-4092-97cd-08dd91c25bf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NWLa8YfJ+eAqFwvtZSvthPrVTL/ujNgxcfKxZ1+hczzdxihA20iDQ795ZE94?=
 =?us-ascii?Q?jLBItgQljwtD6uwoTJPlwJYfY6lOTkon+nacoUv40hwRWrdTJYwrZ6Eu6DUw?=
 =?us-ascii?Q?E0HRhJ5MHSV/ad87pVO0oUQsg0lYZDEPxbfVQLNguoj3fzTJnx5f0hp4N9My?=
 =?us-ascii?Q?GDtbyeIykvW1Qaob+PtnNs5wetVy1WZPyDxORaqiq+uQChVpHilyuW67gaFD?=
 =?us-ascii?Q?MvQty7w5QlDtBXeywItcjvto7wmusc7R/rxNd19Ock+1A0ZylkzXFK8uK5k6?=
 =?us-ascii?Q?oL/H/X1vwkD7ULDNddUIUsAzrX820imn3sN/KECb8zhp9BgxSTwV5OWox+G2?=
 =?us-ascii?Q?BmLWttf3+Kc+moNDSg3tF6aDboTAEUg5SJzOzf7Khwds2RnrhIzxdzav+0rk?=
 =?us-ascii?Q?2fubgcIzjD/tCgbK6jQJ2olKHUwubYdRzdjE/PMWV9W2aCpGLrMWwvu71jaG?=
 =?us-ascii?Q?9vM3pna/40slLF26POhCw9cKPK33WHVJ9179hY8qa0eO8W9Oj9sYeSUR9zNU?=
 =?us-ascii?Q?Wb1n33EbSWGt20hJjvDSTxxeaRfTGYV3y0gSG6qtwwbIwdin+24F6MxC1rqb?=
 =?us-ascii?Q?tW3rwN8C4+V7BIW3hcQF0bUxfI8EKI+v5RPAC7pkFSldMkhQSrJ1IHmKstRU?=
 =?us-ascii?Q?aULbijqjcvnpxAwREEX65lLHbbaQcW1kreMolPYl+O1H1GzRPLg/FUEKR0Fw?=
 =?us-ascii?Q?ohr4lsmOhss3d8F5G8U7pTZXM4MNWa0q810jHTi0drv6ECd4wXISETXLpNLb?=
 =?us-ascii?Q?3ogjEU6Tq109WUES4OiFAhWt5RuCiN06afR/pmEUBj/fZdhrtZ0RsxFLjFwP?=
 =?us-ascii?Q?JBIiixUfqF/lu2Mlno5nrjULwXtfjb0if3ivsT1Oq1CakyY3ls5Gc9RJhHr/?=
 =?us-ascii?Q?aH5mPEC1udvAEdAaNVU1/8iJuXrWTmq/rxuoEzzlUikAtm1aEb0ebVDTjXfH?=
 =?us-ascii?Q?M4nD3c0gg82RMMOGktWXViPzSpp128SCL8ErOno+wFwCcU1/QLx9jnLOK72X?=
 =?us-ascii?Q?8uBx3GEKASQ4J1KWjOYTPW6tcPOrAJufhgo16Efgd1sDH3F3wBN4KH8b3wY/?=
 =?us-ascii?Q?Wy7WokgHmL5L1vSsjRf+tW+DY9HgpleDQVdcIHWYP0IzSVH9LWnI5beAxM5Z?=
 =?us-ascii?Q?zHbmwYiLWtGXtoprbMrm6orZ/0aPU4dX8amvmf+QTqlYeOq9szwnC1MZ4I3O?=
 =?us-ascii?Q?2Ah0dzk0gr0QEWnvMX2AsFVSc1Z0RKj6w7JmgrqV2SA+UbXCAc1mL7+YBiGW?=
 =?us-ascii?Q?zE7+FW28XNb9XCzspnWFmKxWTOqy/RGQcZej2ukH6NPyZlQzrSkCA6C7HQ/G?=
 =?us-ascii?Q?88oRY4/7nTyIdVZkTZvjeb74Bg06JtYmbit/I3MdaBpugHrwU1WsavBiqvgz?=
 =?us-ascii?Q?C+cBBdoWhSlSvIPfMG+Ec9/eYz7o/4Dd0arXi/IdRP70dSdXvBppPiDJeUC/?=
 =?us-ascii?Q?D3PXekjq/jg9OZwpS9B/pLy+bzl7B9/a8VZVkFtRCgEupL8Inj1PBo9s29IP?=
 =?us-ascii?Q?mU/Z8lPNJncxDSF4wTWTcuHwl8h5HjsBBxLm?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 02:03:30.6443
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 369420d8-b6f5-4092-97cd-08dd91c25bf5
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CD.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5244

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

