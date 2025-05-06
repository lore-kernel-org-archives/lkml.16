Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022082.outbound.protection.outlook.com [40.107.75.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFE527586F;
	Tue,  6 May 2025 09:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522482; cv=fail; b=V6zb+4Iia80IR5dGcjsobs8x5Fo+UnW6pzF9mXfZ5hmEEvk2pJwmcXyYDDtqPLmBrgG+aHl2GuHssCnNw0l9UEW7TL1lfVc865IHySIyLHYPWgbUBcpQUOYgqgtYeHi9zrDDEcslpHCkk4U62FEbV7jccakaHrm4r8clrBrVhrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522482; c=relaxed/simple;
	bh=Tx0CeK12rw8fNnV+a43EhPsd3vEgR7B3QwBn0narui0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k/Q3VmgwqXYfjDAJwoFLn1y1Xc+qa4dlaGPU7STJy5hrpiNASyQxBDoL4TdSuRTFivt/tSxFme2E1Dv12kdXRKiJyvuj/+usSBohpr8La4XwvMWzd9yGRswmUCHS4Is6t2XIz/dDwbEChUkGWUud3xDaInrOoGkOgtrBbMx//gA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r7ZJs442NyBlyBlSX44ev+1W6xBz1Za9V3q8ANXRfDO2ZgEgBqOIV2LZsUe8bhKR13WTySfUvpSpoo0wfV0bTZpi5d7uOkk3Gg0oZ+r9kljecwC6GX5hN7mqOgG9NqoFduYuIly6051/YrW+0/HJJyyB3aKYw4bgw4Lv0gDq1BQd6fBqF/+1wgLsDyqLEV3fBqxjZcg4r6a9YUVW8V/z/tlRvRvB5CW/DsO0jLAqVMKCzMOk/7P7JxkfdE+FU0wsgbJchD6EUHwwysZ77xDSYpECdulm6Gwe5rVhhTjIPIpKFCUetqcAJHSsodlnAGIw1EqrmZWd69xFOl36ZwdcfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pheMVA4F2yQ/mZAq2Tm3+5kIP/DPHkXoE3b5n9yj7P4=;
 b=bU8fXAsjLWGvllVftK80ypbxLq3WjjpHcoZd/tf7WPPKH/sP/IGxX773D6jv7SL7e9e39ghzPk/Kv+Gf1pSjRrMMBf8Fs2p7ZGPzj/DBRpSweh22j7LYWLUdP4b9OLswVZjMfnDXmHXT4sxqKBA+0Ymz9sYdpggYLOse4kLze8XYdLdIu38bS4r+xB+9/J4WK52yWqHndwN/lFNH+BLyk40+0XvXu/LTuUY24qzH0RM+YIqhPXEU9aMWrUcYvXbgNMrD1MrS/F8ZX9Qu16/j5X4Ocfect908bkY2hFd3NZb9gWw9UUY3VsLM6EAm0YYm5KjAKKtTmbhRFlLfzh44Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYAPR01CA0117.jpnprd01.prod.outlook.com (2603:1096:404:2a::33)
 by TYSPR06MB7019.apcprd06.prod.outlook.com (2603:1096:400:46a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Tue, 6 May
 2025 09:07:56 +0000
Received: from TY2PEPF0000AB87.apcprd03.prod.outlook.com
 (2603:1096:404:2a:cafe::d2) by TYAPR01CA0117.outlook.office365.com
 (2603:1096:404:2a::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.31 via Frontend Transport; Tue,
 6 May 2025 09:07:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB87.mail.protection.outlook.com (10.167.253.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 09:07:56 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id B6EFB4160CAB;
	Tue,  6 May 2025 17:07:52 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	maz@kernel.org,
	kajetan.puchalski@arm.com,
	sudeep.holla@arm.com,
	eballetb@redhat.com,
	Peter Chen <peter.chen@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: [PATCH v7 9/9] MAINTAINERS: Add CIX SoC maintainer entry
Date: Tue,  6 May 2025 17:07:52 +0800
Message-Id: <20250506090752.3695666-10-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250506090752.3695666-1-peter.chen@cixtech.com>
References: <20250506090752.3695666-1-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB87:EE_|TYSPR06MB7019:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9befca50-3083-4cb0-d7ef-08dd8c7d7db6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fiqxMjlvo1mkChGwzSrnltnavujS4ASfw+INNgrZbhweumkxILK+PSLFUCcr?=
 =?us-ascii?Q?ZM5FGN5gAheEdchTMqJc/6+euUjH0ni4NexigKs9GMZWT6Eoku4N/H/GJ33E?=
 =?us-ascii?Q?ZTSmg7u24+jvila9J3AjCvbO4qbnrVTvxB7DUblanj1Nr89svdfPSJF8GDK6?=
 =?us-ascii?Q?q1kz9j+PxbegKdPwCz8Tna0MK0Z87BP9UHGSxbOHP1A8EttgSrNN0ZztlrkR?=
 =?us-ascii?Q?ZYp6QzZk2f1kBwtO07wMYG7i19HlFsQo46xbe5lyikobVlP5gvujGJIur8KF?=
 =?us-ascii?Q?cMBSoD33qUgkff4YltM9I6MotnyMtLXjx11A2ix17LV9rzhaE0DuCxXZPthB?=
 =?us-ascii?Q?jA4JeHZlvO2JH1fxaDnWDeRO1Cf3iw5cGDyTIkwmzHkJzPvPIruogj/T/rpe?=
 =?us-ascii?Q?+llbd0IMCqh6I6Veqz07e3QRb5hb+UW692sXkgKKzh7YeWFz2hS3FwMYFuSO?=
 =?us-ascii?Q?mDNHoyyNWnJBLSNlVnI79bphTOHxkPHCWZ24rgMYvDXSc7cu8mnct+l6bPmM?=
 =?us-ascii?Q?VTzNX9ohBBX+mbI6O7/flD3kPOhsba4wIW70udiKWKLXRHAxsQFbjz1luzAP?=
 =?us-ascii?Q?F1+a9wy9nuhx/vADdIT9NoGcjd3Rz8L40KI9tbIKmib1IkjV6+AkdkCSFYBp?=
 =?us-ascii?Q?AuG4KDXApK2IAQl7q+npFP9806ZnHGMBf5B7oDqRzlqyrS/LMng3IfxKtNFH?=
 =?us-ascii?Q?T9Ai3c0jy1HMEPSEwuPiaTEwExXV+78Z0WqNj/n56mkteilDYWhDlsLRx5vA?=
 =?us-ascii?Q?IUUnqqVjE6SNtOu1yW9t8QmnlWQYW/k5QB8z0uxyinLnqYwUDoJkQ21VhQJ3?=
 =?us-ascii?Q?gG6b8YXg4/Vcp5krmYuibqRTA1ve8SXK6yuU4ztBnu8SHR+jYmvNrrgKHRsw?=
 =?us-ascii?Q?YZrEa/ZM3mR4G4gKSgEQEvovgmO9H8WihFFxogDMRiPj+NHLd56T0Uf8ti8T?=
 =?us-ascii?Q?moV1Tw5/nh+Ei8qvbg/QxrfHLjs5otTYkC1UzU+wobJbKD1R63cCIzbcYRAk?=
 =?us-ascii?Q?lP8WXdtBvmhI2x2IRE/z/6Yfl+j831dnn7E8K7pBasZ6nquN7VEuuncf9pIw?=
 =?us-ascii?Q?kW2nY2BA0u9JnfbOEontCOVVrobqQn++rOmzQxVOTsiQgSHYrtt8GvRj05CE?=
 =?us-ascii?Q?RDG4EH79LH+pgn87JVf1DlHpkexZNlAORt/eXZ1Zz8y2YjRMmIurHIiicDmg?=
 =?us-ascii?Q?RaCQYYlkzQDi9Oe6X2+3IhOQKHLapSPnRlKuVJjSY8XxEZWUIN50LoxceD3e?=
 =?us-ascii?Q?VqELEyAVULqmTTtlaqSfWyf5ze/d5sXS0rl//M2wR5FXME8d+5QXli9TCrgC?=
 =?us-ascii?Q?HsbeLStA0vZ+A7TLBHeVefr5DxNVAzMHSNfJ4I/NPJ+LzQT5yPdL34PlCgjS?=
 =?us-ascii?Q?MuQqgqkj75G4E08JAUYAkbvPwkn7tbZc3L/jXafT71vixEiIjZ19QDgOC5oh?=
 =?us-ascii?Q?EAn68epN/phGOn9rvzFSVLkVn1ymW0ubFMNzeJ8+jG05M+iHE0QoU9P87C7M?=
 =?us-ascii?Q?QgMm1cH0otAHKFjsn23Ro52Edv1vaeZ3m6n5?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 09:07:56.2305
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9befca50-3083-4cb0-d7ef-08dd8c7d7db6
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB87.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB7019

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

