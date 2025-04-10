Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011035.outbound.protection.outlook.com [52.101.65.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756561E990A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 16:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.35
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744302977; cv=fail; b=FV1DRM7sXZ1QX8okHSqm+LzieONTSSTHZSa/kSA8q8YFcjF0UqWe0YDjWBczh40R+DeediQI5kn2uIJNcbb25+4gOJX6URBYWCf/RUxma6BFu8xFyGiaqZNp0h76h0UBX9UjVOoE7rbWLHHP2Ds2B+Y0hgrAxzrRq+TMI44rNfg=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744302977; c=relaxed/simple;
	bh=gyVMzoQibovDI/Y8SWHTTvLLpSLbpGTxwo9q7Rsfkog=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=s0WjR0433UWpAIIB0rBPCwJo7+omRR+WRvOrNavnHolKAokpqWuBLbXzDR2sWhnF5PYSBpwsjveKDJFae6z3UZphactFrFV8PL9Oj2cKkRS9Sf3lsTh19QDXVVEIAr+WvC7oP0AzKaJLSkmAbgrtNg9ECbt0V6INCVDJfiWpMD8=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=T5xwXTT8; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=T5xwXTT8; arc=fail smtp.client-ip=52.101.65.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="T5xwXTT8";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="T5xwXTT8"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=UFRLPR5m2EA9k1st6jWs94hvztKZMOo5gvPrrZJhpBiZ+WwNpbqkGPiWomDrLOraL2ywfDQNpE3rrUfLnyLg7avsM5+TuC+yhe8daWFzjRa7wMnTEv9FxylsdedH9+teM4Sev2f8T7Ki+lHD5Q02nHGiAgwcjxFv7RgJ8UQw/72DVZQSy4ttYD6biV4Zw4FQlkS9m2zgmmbk04Lpeng/5kFRilsgYRfkZQzDWjA+FNvBQLYd8gU4mL27SjP/+Pvi83GTZqWOuhiu5p8Y1375LsNDe+gHG3x4hEGrZqQh67iJwydtHJQT89a6S23iKSbC1jfic4W0JYpRo3XLU6b+tg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=99a9H2JPQ09dF86FfMJUhwua22yLvmDS3tCgi2msFF0=;
 b=nRK0wGzQ0Ii5qKnyxwITyVHEW14VhddQDjtLNDFMpS3YgDWnoO2xv5e7VRyhIIlA43i6TZ5M7EvDwx26gfjGfNYMZLnZIxi/hyMRJSTxzo9TTgyImn8Axj3hvmmBL4k/8WRUTOREEZYobDVhJnmkDwM8IZzHhsYx5/T9kMEbpOhfaHWfBNJ5g30sqfaR3djkjh4JNRpDErurnd3jekl9jIfa/3bPsOF1WfyOZbeU5yT7cJ4bPFXbKWIjB08SaHVOBnQg/FUA1mtFjzYAUnNNVs/skn2nW9VxjXFLpGO7FA4N4PWdH5rCphlJXvNkVMBhF9j53bvO1daHEtEJwzB0qg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=99a9H2JPQ09dF86FfMJUhwua22yLvmDS3tCgi2msFF0=;
 b=T5xwXTT8pcbc0ICxGGLbaXZVGSlbPS2A+MIaDfJCKcAK4W9H7qxWB4vzDnMGvw2kr9LZcZhpgWUEeoNuMrtpvITtGUlRgluUOSiHE0fEbT6FL1oicILazOLtcAuWonChEZF/q9cuCRKoiRLbikqQyw6EFfzaXfQ2l6flFC2o4UM=
Received: from DUZPR01CA0168.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::24) by PA4PR08MB7387.eurprd08.prod.outlook.com
 (2603:10a6:102:2a2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Thu, 10 Apr
 2025 16:36:07 +0000
Received: from DU2PEPF00028D12.eurprd03.prod.outlook.com
 (2603:10a6:10:4b3:cafe::67) by DUZPR01CA0168.outlook.office365.com
 (2603:10a6:10:4b3::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Thu,
 10 Apr 2025 16:36:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D12.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.13
 via Frontend Transport; Thu, 10 Apr 2025 16:36:06 +0000
Received: ("Tessian outbound e6e18cf4ef9f:v605"); Thu, 10 Apr 2025 16:36:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: eb8ed9011e504b31
X-TessianGatewayMetadata: iT0WXdkglIy3xWQVTbj2paEO1WwHZaG9WLFU31j9kkJ3XwV1UvcTFoNL5HmGgT9/cUfQEBJYMATpTlipJyUveTsbvqXhe68jfNeFuwnpfeVagBgJ9pGC/8fGmuv2AgbIWnI9vLFPiEf1J4QhTCrgStbK1FkdaTa7xyZs7VFxEl4=
X-CR-MTA-TID: 64aa7808
Received: from L876dbb8c19f5.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 28606061-1789-46AE-B7E6-A1FA01E3EA3D.1;
	Thu, 10 Apr 2025 16:35:59 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L876dbb8c19f5.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 10 Apr 2025 16:35:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v6ggzeqvtShP9ixckAEzPAhxGl3M3dxICvZ43ml2B3oMHaJPc/GQV8OKHrN63XYadahol90TFP9mhpvNAq5ipDXoMO0EjYjvbk7BZVxSMiNg8k4XAHCf7DagWR4Nu8TRaFRyOTrWfYyaEKuhnwbuEOTY/FL7r0uECOgZ3zJ4KCWiltvBI/jNGQK0hujCVh3Bk9F+NV3T+8T285l7S53gJTQkb+0PTQxDD4TNkEr8tTdYVN9kZnJ6wyqdB4U6ZQz9XUSUbBrJUhIyePDIhYO8qBlpHaoa3HnIkm05DJTlGyhNmWtPFqy18U1Bdv5ZvV3ZhD006hmgCekTcuZu/iEyLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=99a9H2JPQ09dF86FfMJUhwua22yLvmDS3tCgi2msFF0=;
 b=gdMAGdJ39quEHfpchX4LqVTGtqI7cmv4hkiHrMKzIowVMgxqQtXezc1REG56uLtMV4bKQ/kXYzPGM5C1q8xQ2/UVpaUyFlDAmsDfWhc8jQO3JcQxL4U4GKVl8GeK5GofF+J1uRe0esstbJl/2rE+dUqVmrIPDJ1Z4L/5HRNgh91TKL1VUbMwMyiMCioG9/9NO8k1/u2CwUZDjH6aTYVphLRA49xwbNd3gpUPM1RdAJ38/ooVeB//VD5g5PFO6jnNjqSTtsiCsnILQwQvoqU4xw4wKaBpGL/4GxIMNZlvPSSwms1IU7RwhbIb6b8yeN1NfCJRA1HvMpU1Efq2DlGJcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=99a9H2JPQ09dF86FfMJUhwua22yLvmDS3tCgi2msFF0=;
 b=T5xwXTT8pcbc0ICxGGLbaXZVGSlbPS2A+MIaDfJCKcAK4W9H7qxWB4vzDnMGvw2kr9LZcZhpgWUEeoNuMrtpvITtGUlRgluUOSiHE0fEbT6FL1oicILazOLtcAuWonChEZF/q9cuCRKoiRLbikqQyw6EFfzaXfQ2l6flFC2o4UM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS2PR08MB9076.eurprd08.prod.outlook.com
 (2603:10a6:20b:5fe::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Thu, 10 Apr
 2025 16:35:56 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 16:35:56 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panthor: Add 64-bit and poll register accessors
Date: Thu, 10 Apr 2025 17:35:46 +0100
Message-ID: <20250410163546.919749-1-karunika.choo@arm.com>
X-Mailer: git-send-email 2.47.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0468.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::24) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	VI0PR08MB11200:EE_|AS2PR08MB9076:EE_|DU2PEPF00028D12:EE_|PA4PR08MB7387:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cffc4d9-c3f7-477f-8427-08dd784dcaac
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?NHsipfCLLkPTWcpo1jFv/wl2laH7D0/cEaDFTLtS1wzmyAsHRyJbE1EsS37C?=
 =?us-ascii?Q?FFB650+0NX0JwHsJ4neMeJ0J1GdZpJAV0eCrxjPDOXPjmodbhSaofjtAWT8K?=
 =?us-ascii?Q?0sn8OYCcoFnpMvuvgdzjNQYNL0MVUmznMpEMgfAdg9sasWxBb/7YK+t8uo5T?=
 =?us-ascii?Q?aCwLLyxg2I3wkK8Llgohe3aa/ofmZPODhG+P9+eaUFZbrT1MBRwScjAgReiM?=
 =?us-ascii?Q?dUT5Ge4Uh6MyGdKb4xuv+KOXCMB+GyMZPpilrgXLHy0cieYxBFI2/ZDF1RXO?=
 =?us-ascii?Q?5zssLpuTltGGi0nWtIDP/bEsJqQqXa1auT9CMmHVxvtkPnIAembnZ+OS8eR3?=
 =?us-ascii?Q?iIEnUIuvtbUdXO1tw+f/NEt7kNnUDDaNhTz4q54LY8Hsw8OwI5IXiU6+ntuV?=
 =?us-ascii?Q?mvi7c4L0dgIf6sMtl5wVqyO6kfFbwjzQgu4AHDK9AttSSKPw6mHgM/4ca+s9?=
 =?us-ascii?Q?tI6E/xku2hEYJ0nhCjhUoZHeaiDDo3b0iH25Goz1rOW64BigFuA0oJy57pI6?=
 =?us-ascii?Q?jxwV5iD9Gso/3Q6AjB4rvmQ/6339dP82HOI8HB0zCb5QytcvsW/PDQyHH98K?=
 =?us-ascii?Q?JId6um1o+2rPZ146FAwnVZ0opNKjuZgm/V3EmOoi+Nbl+LoX0xIPva+yHapb?=
 =?us-ascii?Q?sa1K1yUtsQE5s1orjObtuUh0kRSqpFrh8GB6JBz04NVnQY2g9VgmCcUgJCYg?=
 =?us-ascii?Q?s5Bgeq/c6ODR2hiSpgg/XCbWKGkroHKVPZEzjVL8m/1m6GBxy2evJni615IW?=
 =?us-ascii?Q?bt+NMT1d9vdvWIS84VugjEEFv+MDeYUsoy0+F9YdSnLXJCB9NJB4RzoUtBgR?=
 =?us-ascii?Q?j2aYXKea+NJWma7th5EW/3mPl2M5AE0PGf6/2+CcjZwoD8iKwBUxtyUoopfI?=
 =?us-ascii?Q?jifUmTjqoY6dGd0Sm905sxYddYGKNmLzFjtCGa9OzrPIf8V8Zks5LTqniQ09?=
 =?us-ascii?Q?KRIXN+Jixzlq9gziskCj/7LJEmmuhzcJX5UYhi565N4yGlI+VC+U6bsqFY1x?=
 =?us-ascii?Q?xeXC2xQ/y0edciRZsX/zlgpVipl8cJgOnv0gyo3NWiHXP5ceY4lyI4sckO7k?=
 =?us-ascii?Q?oOBwECEKzD+MDkZuvhYTJ49biyHHAntE3tl7ZPchtq/0BDKYW8JNEYoXrv0r?=
 =?us-ascii?Q?Mue10HKeCCj7aXT/7oWixA71ps7wk3ojwtvUo5xYAANrr8QD3o6C5uecMJAp?=
 =?us-ascii?Q?bgJ1w6HsrkrVXLzJoBvXKRmBaARZanqY5/ZlV7BGfNXKppBqac9BT5zXCAom?=
 =?us-ascii?Q?yXgBbZHGVDAfY8dxSiyWRQWD/66tO0ESGnmJ6oQHhICAatiUmukn+7HviJE8?=
 =?us-ascii?Q?K4Haq97dlnDlwLGSrDILAWQIi+IDYQTQGgz4Avemwh41+/qDtRFF8bGGpFCk?=
 =?us-ascii?Q?2ckQMaJDp5U++3TsIQlJwcJwm+G5?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR08MB11200.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9076
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:800:257::18];domain=VI0PR08MB11200.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D12.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5f19473f-265f-48f9-eb08-08dd784dc487
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|1800799024|376014|82310400026|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xRKHLFFrgnY1URhz/AJV1PExM/UQhlyMgDE0CI3k07oBua5W2XAA1RDxdEyG?=
 =?us-ascii?Q?Zk5fTkc+cnCg4ly0jCx88N8giDchNXs6OTtO27Q7EhxLqVdWsFk/EzhOeZs0?=
 =?us-ascii?Q?Su6H5QEuC7x5sLNPnubU5b5pP+ZOz/DLwUFwGZkXhSTdqztaRrkzKHkvEArc?=
 =?us-ascii?Q?JPk3Scu7PaHwlnOoHPPCyQBP3DVrQcLxAcEeWBXbZFr0ECaLJ69kxxlwra5c?=
 =?us-ascii?Q?TXjvOOdP8YKXVjToCV2VkDsvAulCfzV8P43/NdNBxP5eGFaFa3hpVULyU3CI?=
 =?us-ascii?Q?nQU8kM5BNkvhfr308GX1eOBLm/drc/RRz9Sp3jSdziOwk0drDT6faCmpM+Ra?=
 =?us-ascii?Q?fZ0uB1d4nwTsdKpjjg2OH2w0dwh2XN5diBWNVdgLkXioFBdEZaKjXVxqnJ40?=
 =?us-ascii?Q?rtNjDe+d3LlPNBnm0U03fHUl+/4TCVL4HZSv/TPBq4xDaFJ+/EgnexPFlHfo?=
 =?us-ascii?Q?ivT4SK5qeBDMXU7xyb8iHy29divlapGPHu41GuE8CFDaiIq9vnzWObbLQ4rX?=
 =?us-ascii?Q?kBykm2BD3jz/3JyA0zBJPG5AG43VQe7k7MRbL3hRHpi5Phb1FikGJyQw+w4a?=
 =?us-ascii?Q?lMBiUyqDXUnM2SFaauCFqcpYRM+7iuk75qn27Fc0ygoYL9IyeTh94+8eDDB8?=
 =?us-ascii?Q?GHR/pdpkufyxBxFWlu86aKeWIeH353IOcuIUopLph+0MMu2x6Ej6bqz7T8+g?=
 =?us-ascii?Q?oFIA1VbrP/sTn4CDEXHSxLMwWX9kAfMk9JOCfByf5Yz8ke8yLLmfEIPred5v?=
 =?us-ascii?Q?JsBC4RaFGHFojRq1gmdinyhEKl1MKfjbYp85q/r7KfSBTCs24E1M7V3TPy9G?=
 =?us-ascii?Q?NUbELGxsehFaCq3qkBb9uudI6Q+SgzGmaQsy0SvMIqRy0ARejDNLMLeSv0TZ?=
 =?us-ascii?Q?Taw/TRRWtkXwlPO2cyEdA4rJ5gScYtT+W9p+174f/FSo4CUSqsKNudINneT9?=
 =?us-ascii?Q?9bBxVIQDFgL7n4ZFEYRxJsvFe7HpUyOCcW9L5v0SBeKZuwmS0/sLwdS7lj6f?=
 =?us-ascii?Q?5nb6uGxsvwXPAJyLZpjIph3HjY0zHFbq5qBNgbcMrlm8XyMChMZUEAwRK47R?=
 =?us-ascii?Q?qvcrQb94JsQh3PCGcUCW42iwN8iaUoIvHJckZXK7vJZAYe8j0hAewToJYi1i?=
 =?us-ascii?Q?EcdU/s5dKczhS14oNHKs55jLPA3o8jwh+vQYCx9giXGXhz9/VkT4/oYTMxF8?=
 =?us-ascii?Q?+tC00zsC8Yq+ZS3Zyxy88JpBf3qLhFJQBIV2p1qcwOhm39lk2sh3U7A+XqFw?=
 =?us-ascii?Q?luWAkhH2bVXVx4mnQX2lqTNoSu3DJ7LF2VSFUUptYLd36OZz+TJsufSEmJUd?=
 =?us-ascii?Q?ziiRnZ/C9O5OzTMKAuBp1+6+Y1PyswnXhN4Va4YsxRFBtYRwQMdIKydYzPSu?=
 =?us-ascii?Q?oyMiCF+hZ/cCLVZt2No7vRzf8jKY+Gye0wZw/A5jVtnP/EWAqppIy/9p4Hyj?=
 =?us-ascii?Q?vZHcDytTqyXl8dpc+gW6tKBkUWZc9p4b3hcng9TWDIOUSqm9cN84TXr68Adc?=
 =?us-ascii?Q?c/8hwBBs3kxL7Tw=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(376014)(82310400026)(36860700013)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 16:36:06.4440
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cffc4d9-c3f7-477f-8427-08dd784dcaac
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D12.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7387

This patch adds 64-bit register accessors to simplify register access in
Panthor. It also adds 32-bit and 64-bit variants for read_poll_timeout.

This patch also updates Panthor to use the new 64-bit accessors and poll
functions.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.h |  71 ++++++++++++
 drivers/gpu/drm/panthor/panthor_fw.c     |   9 +-
 drivers/gpu/drm/panthor/panthor_gpu.c    | 142 ++++++-----------------
 drivers/gpu/drm/panthor/panthor_mmu.c    |  34 ++----
 drivers/gpu/drm/panthor/panthor_regs.h   |   6 -
 5 files changed, 124 insertions(+), 138 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index da6574021664..5028e25f5e0d 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -428,4 +428,75 @@ static int panthor_request_ ## __name ## _irq(struct panthor_device *ptdev,			\
 
 extern struct workqueue_struct *panthor_cleanup_wq;
 
+static inline void gpu_write(struct panthor_device *ptdev, u32 reg, u32 data)
+{
+	writel(data, ptdev->iomem + reg);
+}
+
+static inline u32 gpu_read(struct panthor_device *ptdev, u32 reg)
+{
+	return readl(ptdev->iomem + reg);
+}
+
+static inline u32 gpu_read_relaxed(struct panthor_device *ptdev, u32 reg)
+{
+	return readl_relaxed(ptdev->iomem + reg);
+}
+
+static inline void gpu_write64(struct panthor_device *ptdev, u32 reg, u64 data)
+{
+	gpu_write(ptdev, reg, lower_32_bits(data));
+	gpu_write(ptdev, reg + 4, upper_32_bits(data));
+}
+
+static inline u64 gpu_read64(struct panthor_device *ptdev, u32 reg)
+{
+	return (gpu_read(ptdev, reg) | ((u64)gpu_read(ptdev, reg + 4) << 32));
+}
+
+static inline u64 gpu_read64_relaxed(struct panthor_device *ptdev, u32 reg)
+{
+	return (gpu_read_relaxed(ptdev, reg) |
+		((u64)gpu_read_relaxed(ptdev, reg + 4) << 32));
+}
+
+static inline u64 gpu_read64_counter(struct panthor_device *ptdev, u32 reg)
+{
+	u32 lo, hi1, hi2;
+	do {
+		hi1 = gpu_read(ptdev, reg + 4);
+		lo = gpu_read(ptdev, reg);
+		hi2 = gpu_read(ptdev, reg + 4);
+	} while (hi1 != hi2);
+	return lo | ((u64)hi2 << 32);
+}
+
+#define gpu_read_poll_timeout(dev, reg, val, cond, delay_us, timeout_us)    \
+	read_poll_timeout(gpu_read, val, cond, delay_us, timeout_us, false, \
+			  dev, reg)
+
+#define gpu_read_poll_timeout_atomic(dev, reg, val, cond, delay_us,         \
+				     timeout_us)                            \
+	read_poll_timeout_atomic(gpu_read, val, cond, delay_us, timeout_us, \
+				 false, dev, reg)
+
+#define gpu_read64_poll_timeout(dev, reg, val, cond, delay_us, timeout_us)    \
+	read_poll_timeout(gpu_read64, val, cond, delay_us, timeout_us, false, \
+			  dev, reg)
+
+#define gpu_read64_poll_timeout_atomic(dev, reg, val, cond, delay_us,         \
+				       timeout_us)                            \
+	read_poll_timeout_atomic(gpu_read64, val, cond, delay_us, timeout_us, \
+				 false, dev, reg)
+
+#define gpu_read_relaxed_poll_timeout_atomic(dev, reg, val, cond, delay_us, \
+					     timeout_us)                    \
+	read_poll_timeout_atomic(gpu_read_relaxed, val, cond, delay_us,     \
+				 timeout_us, false, dev, reg)
+
+#define gpu_read64_relaxed_poll_timeout(dev, reg, val, cond, delay_us,         \
+					timeout_us)                            \
+	read_poll_timeout(gpu_read64_relaxed, val, cond, delay_us, timeout_us, \
+			  false, dev, reg)
+
 #endif
diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 0f52766a3120..ecfbe0456f89 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1059,8 +1059,8 @@ static void panthor_fw_stop(struct panthor_device *ptdev)
 	u32 status;
 
 	gpu_write(ptdev, MCU_CONTROL, MCU_CONTROL_DISABLE);
-	if (readl_poll_timeout(ptdev->iomem + MCU_STATUS, status,
-			       status == MCU_STATUS_DISABLED, 10, 100000))
+	if (gpu_read_poll_timeout(ptdev, MCU_STATUS, status,
+				  status == MCU_STATUS_DISABLED, 10, 100000))
 		drm_err(&ptdev->base, "Failed to stop MCU");
 }
 
@@ -1085,8 +1085,9 @@ void panthor_fw_pre_reset(struct panthor_device *ptdev, bool on_hang)
 
 		panthor_fw_update_reqs(glb_iface, req, GLB_HALT, GLB_HALT);
 		gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
-		if (!readl_poll_timeout(ptdev->iomem + MCU_STATUS, status,
-					status == MCU_STATUS_HALT, 10, 100000)) {
+		if (!gpu_read_poll_timeout(ptdev, MCU_STATUS, status,
+					   status == MCU_STATUS_HALT, 10,
+					   100000)) {
 			ptdev->reset.fast = true;
 		} else {
 			drm_warn(&ptdev->base, "Failed to cleanly suspend MCU");
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 671049020afa..fd09f0928019 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -108,14 +108,9 @@ static void panthor_gpu_init_info(struct panthor_device *ptdev)
 
 	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);
 
-	ptdev->gpu_info.shader_present = gpu_read(ptdev, GPU_SHADER_PRESENT_LO);
-	ptdev->gpu_info.shader_present |= (u64)gpu_read(ptdev, GPU_SHADER_PRESENT_HI) << 32;
-
-	ptdev->gpu_info.tiler_present = gpu_read(ptdev, GPU_TILER_PRESENT_LO);
-	ptdev->gpu_info.tiler_present |= (u64)gpu_read(ptdev, GPU_TILER_PRESENT_HI) << 32;
-
-	ptdev->gpu_info.l2_present = gpu_read(ptdev, GPU_L2_PRESENT_LO);
-	ptdev->gpu_info.l2_present |= (u64)gpu_read(ptdev, GPU_L2_PRESENT_HI) << 32;
+	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT_LO);
+	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT_LO);
+	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT_LO);
 
 	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
 	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
@@ -152,8 +147,7 @@ static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
 {
 	if (status & GPU_IRQ_FAULT) {
 		u32 fault_status = gpu_read(ptdev, GPU_FAULT_STATUS);
-		u64 address = ((u64)gpu_read(ptdev, GPU_FAULT_ADDR_HI) << 32) |
-			      gpu_read(ptdev, GPU_FAULT_ADDR_LO);
+		u64 address = gpu_read64(ptdev, GPU_FAULT_ADDR_LO);
 
 		drm_warn(&ptdev->base, "GPU Fault 0x%08x (%s) at 0x%016llx\n",
 			 fault_status, panthor_exception_name(ptdev, fault_status & 0xFF),
@@ -244,45 +238,27 @@ int panthor_gpu_block_power_off(struct panthor_device *ptdev,
 				u32 pwroff_reg, u32 pwrtrans_reg,
 				u64 mask, u32 timeout_us)
 {
-	u32 val, i;
+	u32 val;
 	int ret;
 
-	for (i = 0; i < 2; i++) {
-		u32 mask32 = mask >> (i * 32);
-
-		if (!mask32)
-			continue;
-
-		ret = readl_relaxed_poll_timeout(ptdev->iomem + pwrtrans_reg + (i * 4),
-						 val, !(mask32 & val),
-						 100, timeout_us);
-		if (ret) {
-			drm_err(&ptdev->base, "timeout waiting on %s:%llx power transition",
-				blk_name, mask);
-			return ret;
-		}
+	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val, !val,
+					      100, timeout_us);
+	if (ret) {
+		drm_err(&ptdev->base,
+			"timeout waiting on %s:%llx power transition", blk_name,
+			mask);
+		return ret;
 	}
 
-	if (mask & GENMASK(31, 0))
-		gpu_write(ptdev, pwroff_reg, mask);
-
-	if (mask >> 32)
-		gpu_write(ptdev, pwroff_reg + 4, mask >> 32);
-
-	for (i = 0; i < 2; i++) {
-		u32 mask32 = mask >> (i * 32);
+	gpu_write64(ptdev, pwroff_reg, mask);
 
-		if (!mask32)
-			continue;
-
-		ret = readl_relaxed_poll_timeout(ptdev->iomem + pwrtrans_reg + (i * 4),
-						 val, !(mask32 & val),
-						 100, timeout_us);
-		if (ret) {
-			drm_err(&ptdev->base, "timeout waiting on %s:%llx power transition",
-				blk_name, mask);
-			return ret;
-		}
+	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val, !val,
+					      100, timeout_us);
+	if (ret) {
+		drm_err(&ptdev->base,
+			"timeout waiting on %s:%llx power transition", blk_name,
+			mask);
+		return ret;
 	}
 
 	return 0;
@@ -305,45 +281,26 @@ int panthor_gpu_block_power_on(struct panthor_device *ptdev,
 			       u32 pwron_reg, u32 pwrtrans_reg,
 			       u32 rdy_reg, u64 mask, u32 timeout_us)
 {
-	u32 val, i;
+	u32 val;
 	int ret;
 
-	for (i = 0; i < 2; i++) {
-		u32 mask32 = mask >> (i * 32);
-
-		if (!mask32)
-			continue;
-
-		ret = readl_relaxed_poll_timeout(ptdev->iomem + pwrtrans_reg + (i * 4),
-						 val, !(mask32 & val),
-						 100, timeout_us);
-		if (ret) {
-			drm_err(&ptdev->base, "timeout waiting on %s:%llx power transition",
-				blk_name, mask);
-			return ret;
-		}
+	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val, !val,
+					      100, timeout_us);
+	if (ret) {
+		drm_err(&ptdev->base,
+			"timeout waiting on %s:%llx power transition", blk_name,
+			mask);
+		return ret;
 	}
 
-	if (mask & GENMASK(31, 0))
-		gpu_write(ptdev, pwron_reg, mask);
-
-	if (mask >> 32)
-		gpu_write(ptdev, pwron_reg + 4, mask >> 32);
-
-	for (i = 0; i < 2; i++) {
-		u32 mask32 = mask >> (i * 32);
+	gpu_write64(ptdev, pwron_reg, mask);
 
-		if (!mask32)
-			continue;
-
-		ret = readl_relaxed_poll_timeout(ptdev->iomem + rdy_reg + (i * 4),
-						 val, (mask32 & val) == mask32,
-						 100, timeout_us);
-		if (ret) {
-			drm_err(&ptdev->base, "timeout waiting on %s:%llx readiness",
-				blk_name, mask);
-			return ret;
-		}
+	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val, !val,
+					      100, timeout_us);
+	if (ret) {
+		drm_err(&ptdev->base, "timeout waiting on %s:%llx readiness",
+			blk_name, mask);
+		return ret;
 	}
 
 	return 0;
@@ -492,26 +449,6 @@ void panthor_gpu_resume(struct panthor_device *ptdev)
 	panthor_gpu_l2_power_on(ptdev);
 }
 
-/**
- * panthor_gpu_read_64bit_counter() - Read a 64-bit counter at a given offset.
- * @ptdev: Device.
- * @reg: The offset of the register to read.
- *
- * Return: The counter value.
- */
-static u64
-panthor_gpu_read_64bit_counter(struct panthor_device *ptdev, u32 reg)
-{
-	u32 hi, lo;
-
-	do {
-		hi = gpu_read(ptdev, reg + 0x4);
-		lo = gpu_read(ptdev, reg);
-	} while (hi != gpu_read(ptdev, reg + 0x4));
-
-	return ((u64)hi << 32) | lo;
-}
-
 /**
  * panthor_gpu_read_timestamp() - Read the timestamp register.
  * @ptdev: Device.
@@ -520,7 +457,7 @@ panthor_gpu_read_64bit_counter(struct panthor_device *ptdev, u32 reg)
  */
 u64 panthor_gpu_read_timestamp(struct panthor_device *ptdev)
 {
-	return panthor_gpu_read_64bit_counter(ptdev, GPU_TIMESTAMP_LO);
+	return gpu_read64_counter(ptdev, GPU_TIMESTAMP_LO);
 }
 
 /**
@@ -531,10 +468,5 @@ u64 panthor_gpu_read_timestamp(struct panthor_device *ptdev)
  */
 u64 panthor_gpu_read_timestamp_offset(struct panthor_device *ptdev)
 {
-	u32 hi, lo;
-
-	hi = gpu_read(ptdev, GPU_TIMESTAMP_OFFSET_HI);
-	lo = gpu_read(ptdev, GPU_TIMESTAMP_OFFSET_LO);
-
-	return ((u64)hi << 32) | lo;
+	return gpu_read64(ptdev, GPU_TIMESTAMP_OFFSET_LO);
 }
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 12a02e28f50f..a0a79f19bdea 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -510,9 +510,9 @@ static int wait_ready(struct panthor_device *ptdev, u32 as_nr)
 	/* Wait for the MMU status to indicate there is no active command, in
 	 * case one is pending.
 	 */
-	ret = readl_relaxed_poll_timeout_atomic(ptdev->iomem + AS_STATUS(as_nr),
-						val, !(val & AS_STATUS_AS_ACTIVE),
-						10, 100000);
+	ret = gpu_read_relaxed_poll_timeout_atomic(ptdev, AS_STATUS(as_nr), val,
+						   !(val & AS_STATUS_AS_ACTIVE),
+						   10, 100000);
 
 	if (ret) {
 		panthor_device_schedule_reset(ptdev);
@@ -564,8 +564,7 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
 	region = region_width | region_start;
 
 	/* Lock the region that needs to be updated */
-	gpu_write(ptdev, AS_LOCKADDR_LO(as_nr), lower_32_bits(region));
-	gpu_write(ptdev, AS_LOCKADDR_HI(as_nr), upper_32_bits(region));
+	gpu_write64(ptdev, AS_LOCKADDR_LO(as_nr), region);
 	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
 }
 
@@ -615,14 +614,9 @@ static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
 	if (ret)
 		return ret;
 
-	gpu_write(ptdev, AS_TRANSTAB_LO(as_nr), lower_32_bits(transtab));
-	gpu_write(ptdev, AS_TRANSTAB_HI(as_nr), upper_32_bits(transtab));
-
-	gpu_write(ptdev, AS_MEMATTR_LO(as_nr), lower_32_bits(memattr));
-	gpu_write(ptdev, AS_MEMATTR_HI(as_nr), upper_32_bits(memattr));
-
-	gpu_write(ptdev, AS_TRANSCFG_LO(as_nr), lower_32_bits(transcfg));
-	gpu_write(ptdev, AS_TRANSCFG_HI(as_nr), upper_32_bits(transcfg));
+	gpu_write64(ptdev, AS_TRANSTAB_LO(as_nr), transtab);
+	gpu_write64(ptdev, AS_MEMATTR_LO(as_nr), memattr);
+	gpu_write64(ptdev, AS_TRANSCFG_LO(as_nr), transcfg);
 
 	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
 }
@@ -635,14 +629,9 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
 	if (ret)
 		return ret;
 
-	gpu_write(ptdev, AS_TRANSTAB_LO(as_nr), 0);
-	gpu_write(ptdev, AS_TRANSTAB_HI(as_nr), 0);
-
-	gpu_write(ptdev, AS_MEMATTR_LO(as_nr), 0);
-	gpu_write(ptdev, AS_MEMATTR_HI(as_nr), 0);
-
-	gpu_write(ptdev, AS_TRANSCFG_LO(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
-	gpu_write(ptdev, AS_TRANSCFG_HI(as_nr), 0);
+	gpu_write64(ptdev, AS_TRANSTAB_LO(as_nr), 0);
+	gpu_write64(ptdev, AS_MEMATTR_LO(as_nr), 0);
+	gpu_write64(ptdev, AS_TRANSCFG_LO(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
 
 	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
 }
@@ -1680,8 +1669,7 @@ static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
 		u32 source_id;
 
 		fault_status = gpu_read(ptdev, AS_FAULTSTATUS(as));
-		addr = gpu_read(ptdev, AS_FAULTADDRESS_LO(as));
-		addr |= (u64)gpu_read(ptdev, AS_FAULTADDRESS_HI(as)) << 32;
+		addr = gpu_read64(ptdev, AS_FAULTADDRESS_LO(as));
 
 		/* decode the fault status */
 		exception_type = fault_status & 0xFF;
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index a3ced0177535..6fd39a52f887 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -232,10 +232,4 @@
 #define CSF_DOORBELL(i)					(0x80000 + ((i) * 0x10000))
 #define CSF_GLB_DOORBELL_ID				0
 
-#define gpu_write(dev, reg, data) \
-	writel(data, (dev)->iomem + (reg))
-
-#define gpu_read(dev, reg) \
-	readl((dev)->iomem + (reg))
-
 #endif
-- 
2.47.1

