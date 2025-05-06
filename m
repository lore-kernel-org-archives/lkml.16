Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2111.outbound.protection.outlook.com [40.107.103.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD71927AC53;
	Tue,  6 May 2025 11:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746532526; cv=fail; b=YbXDyym2VgQonxxR4z/0dw5r0GMg/OvkaD1GHqKQBvKdkxVmqOCk5n5KzDhsrBncJdp9jKiiopU/aKNHM3IzMGkwVAewj6NpbrhSf5rCeaJDStODO9bbIiK4lYX57zK41OB0zCOKlCYOkcbgMn+IlBVp0ipKN2K97jg+iCntfDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746532526; c=relaxed/simple;
	bh=2/phhhbWOke+YBjqQDHRfwQY70kz77fzN2mdgEJ00bc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Fcnrm+cePHAJ9C4GwcyqJpFryMhpxSmOSuKsQy848jNC3mVTRtDmsTTgfISsOzLCkSQ318qjBO29X9ob8zb+mj1XkecUSWlxInYJX1rIgWvGcpwQSVrrgEA1RqDktK1T0CYfTSEKOG3oZutBb9xHg7LL/WJO7sHf/NbPmz6LUIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=PRrxO/5V; arc=fail smtp.client-ip=40.107.103.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="PRrxO/5V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IkkuDtIbUoy51GLFQcAL1d85yPl99gvwXOO1BuCkRh3athesEo8CWmDrDV3weZwEgsCzrri0LloNg4SgcUTAvbkp0n22xPeS3A70E9+LlDB9K7DWJvZxzhcKYPdP1NpVt+VG7k0hxjBRC841XwXUeJ4lcQ085VTPHRKM46Yv1Ilh0aRLqFZPUEsCnVd2I/IU7nZDpl6CDswj32rORSvlcNg+cBmksn9H35Ra5ZIPaGvOKc8AanntnCOwPmH0kPlFnU8+sgiu3RaWrHRN9BQKp6kynvc6uRc3yh40A96XcGsqJCUXLVPWMDDVgOaN60JuGBn3g1zztxIvw/0ZaxZdnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHBk0e0Dk03IgkfMjb1pLkuYS2Yufmrv61krzuTQRLo=;
 b=XoNKsRlNVlFejJwuAJ46eQgXOZ2Nwv6voi2zFa2bykGWrRZTlLVA5Ah4bGXs5t7M/A0LkeKQgVgYKF8JSzeYSMgSi5BRTyYptSJjLBcCeNEjFd49bVOrIJRHZUYZCRU4w1c/wxhl5tGvz6j4hU+cBnhZWkod+/CUtDgzqds9L2UHdBQVc3if2Q7aiPRbLm4rXR7KLvEL4ju8q9Lhz+rHkQ/9Qn0LqDjtRRWTFtHbZ3yJET6yi4TEgCKpeFEuCZ0VEasDLs3f3wXrxDVERZYheIaftvpvARUYWxUPyRoLCh5f6F1o3VQA3MnXRYpxaHTLTrDgqud4worMB3iUyBcxhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHBk0e0Dk03IgkfMjb1pLkuYS2Yufmrv61krzuTQRLo=;
 b=PRrxO/5Vctza8Np1UuZMrebK2HO1A+fdQ63SwzCEdZcOHyD0GRSfZN6NPfea68/Tet1MADY71UMvutmpK5xM3tNFxBHRYWy91C+ACxE94owpAWpi5bXTzTFCY8pNNlmwzryr0qNDhKhqRSMz9kPVqfufE9xKwnUcpCuVS30L0Y8crobxmf7mToZ6y30xa8j7VyGcEmKmrYgi2ps4GdqI3+GdsWKqnY/cNvaH3TH3kEE3B4MWlyjmTjyjygV3M4tvoz2dQNuemGMVRDui4we3guK+FKZ2gQxgIg0t1YcfQ95/ofVaDpgHb4hA096Ww9k9F5JlJEzm3KIQEPEoOA9lgQ==
Received: from AS9PR01CA0048.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:542::22) by AS2P195MB2111.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:547::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Tue, 6 May
 2025 11:55:19 +0000
Received: from AMS0EPF00000190.eurprd05.prod.outlook.com
 (2603:10a6:20b:542:cafe::fe) by AS9PR01CA0048.outlook.office365.com
 (2603:10a6:20b:542::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.31 via Frontend Transport; Tue,
 6 May 2025 11:55:19 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AMS0EPF00000190.mail.protection.outlook.com (10.167.16.213) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 11:55:18 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 6 May
 2025 13:55:17 +0200
Received: from ls-radium.phytec (172.25.39.17) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 6 May
 2025 13:55:15 +0200
From: Daniel Schultz <d.schultz@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <upstream@lists.phytec.de>, Daniel Schultz <d.schultz@phytec.de>
Subject: [PATCH 0/4] {am62,am62a}-phycore-som: Add R5F and C7xv device nodes
Date: Tue, 6 May 2025 04:54:58 -0700
Message-ID: <20250506115502.3515599-1-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000190:EE_|AS2P195MB2111:EE_
X-MS-Office365-Filtering-Correlation-Id: b2afd300-443c-49b7-c503-08dd8c94df1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EN64lnKfvusKTAmkCqH3VN+6+RQE9Fedf1M21aGYwqIEmypBfrjwyRWvyht0?=
 =?us-ascii?Q?+aqeayzwIS/ZdpvAgqWAjf3FPB6jzb8it7iVhqqc5TRJFqUZpm5NNTr51Nxa?=
 =?us-ascii?Q?ztEGyDK+v0OkQer2Kdfiaqx5wzEBIusudj7ZNYx67n19V/tYHZCgF8X3TrCK?=
 =?us-ascii?Q?rdffdo4KWNks0hetR+SjGauxZ8K50S9yVsdcrC23bGiLbKof9pX/vbfSCvUg?=
 =?us-ascii?Q?UwGbiT9oQeGTqBZx4elirAIlZGVMzgHSu/JvzVf3plVpuv7HgZeU7yHMfPrS?=
 =?us-ascii?Q?zelR08PUmJimOXEFkQUqBaNZuHSY9NZDMRbewphGjJFNoBvkBNP5aRrU8WYH?=
 =?us-ascii?Q?cHX0pJ0VwtkJDL8s9R9NAOexmacwJHZPDBTqXsiFW4T+LWYQqM9skXsNnpCh?=
 =?us-ascii?Q?GRnGN7ywCP2BmhCEqux6VY//18WV9xway4XdDQwQKisSnOwj3wX7yXZ2Kv2c?=
 =?us-ascii?Q?wYnS8jv+p4XA4piEepvllxQOCKBmGXuW4k9iHCcasf9zbybssxEXZgprL0UI?=
 =?us-ascii?Q?ZqqKj1ISN8pd+FF+1HH3zhjdEWHJ7XjG1fmnSUG1ZHwe6B8fWMvU9FI7J2UA?=
 =?us-ascii?Q?54JEBeFYyv9QgJbOZG7FSXSbmeFOaIdftXYthzGOJkd1ZDeRtyr5j+mmc4BJ?=
 =?us-ascii?Q?ABgYwTkHUuoHi/G97r+pLzDVDfOgSAALDR3P/h6Z4G/58T2kDy5Yomxtpkvn?=
 =?us-ascii?Q?7YpnyijZcfHZq7+SncQtoGdfEaJ7Lm3qOPTr4E5uKNZkjIMiMDqe678ax6U1?=
 =?us-ascii?Q?bwdeDrLGXVTW7aSPtwr/DEZ9OdyZ0Yx2bZobIrGHb8EVwsli4Im4+Nzte7x0?=
 =?us-ascii?Q?Ezzu7XeyELTyczMqp35yXnoBBriCysNZxapuNfAJd27j1UDAEIswyAZwHTtT?=
 =?us-ascii?Q?wVVuO3DAd4K25V6SYhsnPGCk1bIxAqdEA6OHUW3V39RRussW86Ny7s/XmeO1?=
 =?us-ascii?Q?k+nZDE+uHp7VM5jlykNpTSxzLw34VN72O/h/1P2FEmih3rSqh+SHmgL6nvw7?=
 =?us-ascii?Q?BCRbkpx1ox2lFbd00fg9++oQj8eMLOXNdfGLou/7zfnTPEt47NET3UPa8EMr?=
 =?us-ascii?Q?JG9fM4k+wMW639qCoW9mQjJk65J0IwNxUWmYTEjpkN4aIbQBVhCF+CBhXanY?=
 =?us-ascii?Q?LW/ss5Ig6iTjB2oxTtHCia1210fcykB2gHTagG7bPh02jxzri4oVz+NhY0Rk?=
 =?us-ascii?Q?me+sz6Oq9q4yS73btPjFwbOc7cRmRImKFOjE89o7kT9VddMx34yAZowhTdv1?=
 =?us-ascii?Q?lKTVUNgYRLW6DF9Z4WTbrmUeWrkRYknxzmIu+CSsV+6Se0JOwVBnLX2qsGRL?=
 =?us-ascii?Q?CS9EnTSNbWglZOzRoU30Wlf5Wsg7m9U/sRVPvqohWsakgbkfCjWWT75k1oUd?=
 =?us-ascii?Q?Kc61exZ5kNkmAHuqrenG1TQbJkGsDj4TO1lZYkiW6AHqiRkjuSq2v+Kpopjx?=
 =?us-ascii?Q?KMR99pMr8OIqXZ/q0cbmnLyKx4KMApm+Klwvh82hJmG9Z+na2eZoeA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 11:55:18.2217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2afd300-443c-49b7-c503-08dd8c94df1b
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000190.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P195MB2111

This patch series is based on [1] and adds these R5F and C7xv device nodes
to the am62- and am62a-phycore-som device-trees. It also reserves main_timer2
as well as main_rti4 for the C7 DSP firmware.

1: https://lore.kernel.org/linux-arm-kernel/20250502220325.3230653-1-jm@ti.com/T/#t

Daniel Schultz (4):
  arm64: dts: ti: k3-am62-phycore-som: Enable Co-processors
  arm64: dts: ti: k3-am62a-phycore-som: Enable Co-processors
  arm64: dts: ti: k3-am62a-phycore-som: Reserve main_rti4 for C7x DSP
  arm64: dts: ti: k3-am62a-phycore-som: Reserve main_timer2 for C7x DSP

 .../boot/dts/ti/k3-am62-phycore-som.dtsi      |  35 +++++-
 .../boot/dts/ti/k3-am62a-phycore-som.dtsi     | 106 +++++++++++++++++-
 2 files changed, 129 insertions(+), 12 deletions(-)

-- 
2.25.1

