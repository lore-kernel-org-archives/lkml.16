Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023128.outbound.protection.outlook.com [52.101.127.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACE63987D;
	Tue, 13 May 2025 02:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747101816; cv=fail; b=C4NehQ5QSYrdz20HRPHl8TlYbvrbvJ0OHI9oPhgf3UuUBOGu+sLTnhhInKaIYclOnvYxYV2+BH/VqjradupFaXffs4FjGkvULnwZ6AVNqAb2VlVri6TMl3lhPEeqxJgTFNYON3zJygiWwP4gSsrpzOPWvTvWr5Nqwq5tBtYXPTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747101816; c=relaxed/simple;
	bh=xCnKUHrjSNt23UvK606hc3K592QTvZry6MF27OoTsCU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PDLBsrA2L2/B9rotkQbX6TzeOY1eRbwC6xvlsKHwoSEBhu91+A+Zu6WGVtg/c3Bfq3HP/KCWYTff1QBI5EFplJF8oL5N8Kp9FDiyI0e9qTmHHgT81oD8W1TGZ78/s+oANBT2iK2jNHSsHjolT/oLIDvQuFaZmhkTeDzMiAyXyxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ir1I1/ktOTN/BqIRdC9TNerUMTNl+Fa+W9g/Y6rcJNBDyeCLjlJb2ba6Neio5ciYadOfSEQ4HOWP/1y9FXqE6xljO8ly/Amels79lEUugkjwBCvs36Brw4DYMtMSZhF9+sLSs7ijQEJYEbl9CQrdquKN74koqMeXtK6vBrjP6TlovSkpI4HaMS1Sdk6WzxIdbYxdF30NCF0YOWUsH+Q9HTZx5k4Z82Ey7fMc/Wc2263XZEcN00uhGSanksqNhBRepOA86YdxEZjqW9neRLXk+BxCQZB1EfsONMW8/GcI65rBEZL8RNIntUfZrL2OUYuErUNiFS5nbtAP45govsXUSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrrlBKeOi+KDfQQXyjr5Yzguwm4KMkMUiC1P6pGVHDw=;
 b=dBlBZ/KPhKJHp93e9BY/QcrXLtvnbD0e4PdnicwfJHzVB39maPSNWqY0W/90hrnZ0B8THrzOZwgeUTwzmRtPP7cp85n5GKBWufmGq/Ir/J6LCLTTH9tI+aiATErokQELYrrTKRqd7jMT8Hl+q97fCZwUQAHKaTxGLEo0Xl1sTvr19EmLZG8tPTsEaqhMKVn1I82P0Fz8+UGzASS3Ld6W8Rilr8ehj49+g3VctSH7cr2L+hhEBd41glFFH06COwYMaRkoca8LCQxqCDYFRM8n/LxOXxvCaEMTrAR49LZGp8mWfHMwvUYBOtK/xQdu5OohRbie61ToPnLipI3pSX8z+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0092.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2b4::10)
 by SEYPR06MB6431.apcprd06.prod.outlook.com (2603:1096:101:16f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 02:03:29 +0000
Received: from TY2PEPF0000AB89.apcprd03.prod.outlook.com
 (2603:1096:400:2b4:cafe::e3) by TYCP286CA0092.outlook.office365.com
 (2603:1096:400:2b4::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.30 via Frontend Transport; Tue,
 13 May 2025 02:03:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB89.mail.protection.outlook.com (10.167.253.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Tue, 13 May 2025 02:03:28 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 5C0084160504;
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
	Fugang Duan <fugang.duan@cixtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Peter Chen <peter.chen@cixtech.com>
Subject: [PATCH v8 3/9] arm64: Kconfig: add ARCH_CIX for cix silicons
Date: Tue, 13 May 2025 10:03:21 +0800
Message-Id: <20250513020327.414017-4-peter.chen@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB89:EE_|SEYPR06MB6431:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a7520e36-6ab0-4813-7114-08dd91c25aac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HqINyhEa8Cy9zYwLGGUlOGKqAtMzQvUto1fKw6SgP2PHGsuDzg/sv6NKo1hQ?=
 =?us-ascii?Q?eqUBoPEQiCCoUJpS3rP35ofxGsiT6Wy2Y86dgtEF1Kduub+N5GXcsVQULbUo?=
 =?us-ascii?Q?Ydjw6v8Zjry4PdlxXk//ChHzRrEQrasn5gyr1P/P+i3MERpuIm2ypbrTMx1c?=
 =?us-ascii?Q?B2OpcpD33gyrvCrvI0taZ2tWFQwoeKoMHClnYCEuJJ/T5X5fnN8QEUxBkWHX?=
 =?us-ascii?Q?+mA8/SpGY70YOY2GAouFKgB+jJkalGuD7/lNldNW34hVIPcMXxJZTnI4oSva?=
 =?us-ascii?Q?tZFxXXetHvJ0I4JVK/eEvzeY3t1GUz+NtgLTHREz6vLzF90DviRONt0uPrgk?=
 =?us-ascii?Q?TsFViNtcZvknIuoF19HfQalP6KW3jZ4nDsrfM3Dqxd3acHQd0JQ6aYy1L4Sp?=
 =?us-ascii?Q?/+fQidowIzB6J6DiM/Ss1oqBCnp2eIdkxIiSkeuAlZak/CGjQdaeCynjpdtS?=
 =?us-ascii?Q?7wSNX1nYeqBqTrIWxWNWqPFmdsTwA2bWnmWvdjlhL7M9GmjEon455WhMpEFn?=
 =?us-ascii?Q?7UAEVOUd+0EKSphjHpoBPjSc7Ky+Pr8nM30iY0FIDkS2LQMWWgsHtc2abUfM?=
 =?us-ascii?Q?WG9uWr5ErUGSX9GjdE1tn1VJ7EprFr6hukvRIr4JBTsLFZuNMZoGFSA5CddU?=
 =?us-ascii?Q?Lh1fuyAHDD34eMMB55z9lHfYXZNJL/PegYBjMu/gB8Uvp95UtPMv6YCMa8fv?=
 =?us-ascii?Q?Z9LqgTyGAQQ4WX/lvci+6X0PSwr92XdmntZcWSH38DrMEHv94BT00iiD8pQi?=
 =?us-ascii?Q?dfbWpJOVTTuglIRF6N+49+5sM30alY9SFnyhxo4uXqONsGC7/SeXZdl3qBYb?=
 =?us-ascii?Q?O4Yo+xo48tTNvxKTLpQKiqtkK0AqoxuaXbM9Wv8Sp277bJimhtvXjb3BL9Pq?=
 =?us-ascii?Q?m76mbJ2g91sIX5Fe7LuaxsN4KY8QtRL/EErm1mbsaBLcQBggaKrHAUNKnsaC?=
 =?us-ascii?Q?kN3H5vhM4YwCEtCiAdJjWnFgsWgiwIW1zjN4koLQJ9rpSdd04my9tZpg0YKA?=
 =?us-ascii?Q?Fdtdi/UeBUkTIaNY8yacHy4v3UDOiVmuKeTP8Uc7eUTK3JdPg1ubn2PI513J?=
 =?us-ascii?Q?XEgbtYI1c+TgQgK3Ek/o9Z1qH+wmYnnPVV/qu1hvoByKmSj+XizF7NgfESnE?=
 =?us-ascii?Q?JBzfomqK7QsQDSGNMia6ciVRY49IanhAARp2UdNwqh10T0Jf42UDLNXfTaWp?=
 =?us-ascii?Q?pXAlVttbMcdHp4PARK788k8f+YQ+0rFC/hO/EW3iyxg+Z5BxhmOjDGE5cMqX?=
 =?us-ascii?Q?MeSMujuxzONLrIxfGuszQ0ggnR8Yp0m/OE9krHDULybDso953McvpgaF0Pbh?=
 =?us-ascii?Q?9qmY9Mh8kwNu35ZvorxBfgtwPzTQ10EKnGuYaEGPe1QGz5WNc+ojsLK3JpRm?=
 =?us-ascii?Q?5z0a3GA97UzSxurSHSmTiw2Cr8joMc0+3Ef3FTFZCLZRZ7T+uckwMj1nvP1W?=
 =?us-ascii?Q?VmCen3iencUC2nUCaDB+8aGRjDSgpMEh2khyJ6cXLFcXrWKNPUPCK4mOeYyy?=
 =?us-ascii?Q?suSJtwuuHy3jV6tIgHfTfDzd2xSBHONRPUpM?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 02:03:28.4990
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7520e36-6ab0-4813-7114-08dd91c25aac
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB89.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6431

From: Fugang Duan <fugang.duan@cixtech.com>

Add ARCH_CIX for CIX SoC series support.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Fugang Duan <fugang.duan@cixtech.com>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
 arch/arm64/Kconfig.platforms | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 8b76821f190f..3db7acf04122 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -106,6 +106,12 @@ config ARCH_BLAIZE
 	help
 	  This enables support for the Blaize SoC family
 
+config ARCH_CIX
+	bool "Cixtech SoC family"
+	help
+	  This enables support for the Cixtech SoC family,
+	  like P1(sky1).
+
 config ARCH_EXYNOS
 	bool "Samsung Exynos SoC family"
 	select COMMON_CLK_SAMSUNG
-- 
2.25.1

