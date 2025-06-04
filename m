Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010031.outbound.protection.outlook.com [52.101.69.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C05F28C2A0
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 08:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.31
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749025552; cv=fail; b=YXJrGN/hAtGMS7qVSDK7THvSoliYIf573+zU8RrxMBC6kfONxB13JhHObjGdp/cw6RRBk1JVw6B4zxqnmiINnpFTu5RkzefdauURvOMq5X8FNLlXL5J/cFJK/6mr8rr8YVv4utXbd1zC8Rzapcb9arZcCu4+HFctgWEdh76OAUc=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749025552; c=relaxed/simple;
	bh=gIT7qmEbqVoZRt0XHfmFlBce+soJx8Whk+SePoMpiEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pI6jtu6qsU0r6xZwUv0+vc2O400V62RwpnzuJ2UsTa07DOrTfIWrcpJqcNL7yTa8VFJs0FDaLOU69pHoTcS7sbba5UT4s/1dddi7sMJJqBD5e1gI5NlFjJn3fpG6lMH8SjZKouvd4FDARf3/sXJIWJ9sU3fSQRFw4/EqD07+5ps=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=AsDNAFW8; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=AsDNAFW8; arc=fail smtp.client-ip=52.101.69.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AsDNAFW8";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AsDNAFW8"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qcmNYlJk0nvn2mqKHjwREH7vkC02xpwcJF/cCHzEus3hXU67zfHeiV68QxiJ9QEPghnJ+kY0HtGL5Zs+qqmQ6xdGQphiAwF0xLAzAZmc4QhuShYImPVWwpHHlmLeWc4ICAD4PovJfWZADcCEDH4+C7UJzlFKQShU/B7oJtSUeknvx3wjYhCz+ivx5yaiWDmVo/MFjgpupcpFynt7/qD/kPj+su7/UBNmvWqgG+tXdUWOsTlGKPcRB40dw1JmukUWPepRr2+141lN0kMFQPnKy4Hw0kw8AgPVFPq5Q696MKRwNyU6YAUQNhfFyof2+3rK3M82g8uOcz6LHtIiIYqK2Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/MQJ0Rw8kFs+vPMych6XbYFm7c+XrKUmdExnpECm9s=;
 b=zOUiVIkACFfb4SwKuTSIBQqOBIaQJN66YeX8YBlfgDUrT+S1vVM8KtAy1RrdNjDKxS7DswYofSc21g2NIrH9SazLziFT/9nSTDPUWvWFGk6fbin2Jopl3or7I+jUGe2wh5m8iYr0Rmf0bruTFRWT9Iddjn1oepmkq9dmlPwMh5kLGGCMm+F7g/yB0Khq+0oXazoi/8cU0UHhSuE1K5ly39Gw9iAMRRfyEe88K3VLYvTmiCNZW2emBdUK8QynftQCbdSglXILvNZcSRYRFfJC994PRBZGswjL5GGZMxhX6aGP2BQphp5qQE+7Abxe3r/tQp9IcbedRqUs0cyY3mfkVQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/MQJ0Rw8kFs+vPMych6XbYFm7c+XrKUmdExnpECm9s=;
 b=AsDNAFW85mrFMyHbdof7uBC79EHYJrUMW0uBrJWM0VhvBVsApsjGuyMWSNQ1ygku4gNgKgBOcR+gYUYRGLaxtfVxebCFCiHSMJn9VN39AwYC4m3wbolyTvZoXizkkVQtJAgE10enMy+T/y4TRCgvRlynsTAKgPLH4qgsoQjC6TQ=
Received: from DUZPR01CA0147.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::29) by PAWPR08MB9469.eurprd08.prod.outlook.com
 (2603:10a6:102:2e1::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 08:25:43 +0000
Received: from DB1PEPF00039231.eurprd03.prod.outlook.com
 (2603:10a6:10:4bd:cafe::97) by DUZPR01CA0147.outlook.office365.com
 (2603:10a6:10:4bd::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29 via Frontend Transport; Wed,
 4 Jun 2025 08:25:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00039231.mail.protection.outlook.com (10.167.8.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Wed, 4 Jun 2025 08:25:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uAPa8xPD0jyvlNz7p+0IQOm1AgZo8OB1MKcV2QGEV9j+cHkXYISFIqIoP1EmLWkKR23aMFQTBkr0En+10amcGlY9kS6fk5+yuOJ+6JPQ8YqDH5HfGLL6/sThF+/rbp/6nkVrbZJ/QaT7XCZf320BEMdgaPN8eF37wvB1QGQRwxAtNYFvOfjzj9spSZQcjFy1rOiljfQwI68mhNvoeOZlDnDOW7hfvMfGtMpYraUOplIoD9X0KNQHmQ5ER62epscCPUOJU4t93kopY9pLENPSBmZqKiaVuQnek5TryRowTR/z/ooYLYSVpqa+xzisKVEFtTZy3aGNdctMXTuVpAIWjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/MQJ0Rw8kFs+vPMych6XbYFm7c+XrKUmdExnpECm9s=;
 b=Ws1m58yJf07d/O4eE/cTsNX80YZpsYj0+gVw3wbmwPnqKav2FYa24rUvoaHuref6iHTvVzmEWj45gnxSQp6rGFQMoY08PGlsL0d0dcMoplRoR7dceBG3Vx+zwgfmOIGKHkfEPfn3c4p8LoIfgMqK/1mdRHweyJyoOrXI4ZeHEakdE0af+mOcX1dm9Xq5r8QhMJaCt4s87O8ymXV23oDEP0d9byuyQIpiOh/WnMhx+iJifXX5W7njj9WBu6U5QfZLZm3nV1XBVMsDZgvzCEkuzEfoIInZ7QrU4HlAeAuNErXdZmcE8OjzG/2AGiPGON9eZGZecV3eJnUE9qqllIDkgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/MQJ0Rw8kFs+vPMych6XbYFm7c+XrKUmdExnpECm9s=;
 b=AsDNAFW85mrFMyHbdof7uBC79EHYJrUMW0uBrJWM0VhvBVsApsjGuyMWSNQ1ygku4gNgKgBOcR+gYUYRGLaxtfVxebCFCiHSMJn9VN39AwYC4m3wbolyTvZoXizkkVQtJAgE10enMy+T/y4TRCgvRlynsTAKgPLH4qgsoQjC6TQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AS8PR08MB5928.eurprd08.prod.outlook.com
 (2603:10a6:20b:29b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Wed, 4 Jun
 2025 08:25:10 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.8792.033; Wed, 4 Jun 2025
 08:25:09 +0000
Date: Wed, 4 Jun 2025 09:25:07 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Luka <luka.2016.cs@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] WARNING: locking bug in ___rmqueue_pcplist in Linux kernel
 v6.12
Message-ID: <aEAC4/XzOqkqA1wd@e129823.arm.com>
References: <CALm_T+2nmQCQXsBSsD2QPTXb_wOKALAgOPwzTFc=evWUmUsq5g@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALm_T+2nmQCQXsBSsD2QPTXb_wOKALAgOPwzTFc=evWUmUsq5g@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0161.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::22) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|AS8PR08MB5928:EE_|DB1PEPF00039231:EE_|PAWPR08MB9469:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c20502d-cb21-433a-3504-08dda3416586
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?JNgB2kCa2zXnvpxHOqAo9QTjxwf0LWbaodIitA2EYn/ftm4UHUxLYipm/qOo?=
 =?us-ascii?Q?r8kTs1EvxN8QJYDmUXua3P7G0b1QFvMR/QRkwtc1sGxe6bZtzYZ2NQyuFS1m?=
 =?us-ascii?Q?GR4ycU/Looz6OJ+lDn9tXMASOv2G62xCn+1cFfRwSkc0VUCw6G1v0rizBX7B?=
 =?us-ascii?Q?NMWfVIC7CMLrxy3C+qE+NAapcjoH8Yh8ABL3TGAE1nSKOOWhjJH8x4i8VULb?=
 =?us-ascii?Q?nTI+l23rwYas77rN58A7KTu/jpNOxHx6JQk+ok7u7aY4ahpDdDADQ/3d+yvc?=
 =?us-ascii?Q?tzGn9SJIHzPIqIe9TB1Qjpypk0KcTHfgV27lVwbpBe6ASm6TUQzkRjjrT8uG?=
 =?us-ascii?Q?nrYw6MRQWh9nHA9PPcnhhzcB5Ry+DWwyaVQw+1ej7dOjtf+eF05aQyXAlJf5?=
 =?us-ascii?Q?+V9fEGC4Rz2X3uoj0umm/v6My9NdAONQVi7dpYgTGTOMYt2FujqAiY6BgP8n?=
 =?us-ascii?Q?eEHgpeuCZQYAwBPea2AoC47IEb7llJ53GwP2dMD0QIz/lRPBoLcUtjrovX72?=
 =?us-ascii?Q?KitWZXDPxuNw3PfDYpPdcWLTyPsGuLxfFIyxZnKKsRM9mJ/Y1eFWz5EuvEnN?=
 =?us-ascii?Q?A0Qg9YDPTmmJrs9lrjKOc8xhOi9WoBqrmuR0I1ol6QvTZoT2Z2b1FLixCzuN?=
 =?us-ascii?Q?S3Y6va0KCxrnXkhTatuMW3mAcDzPjDW8at/mLx7d6yMIiHF9LQbxFgUNzufa?=
 =?us-ascii?Q?zaRUXWKnGqW8L8u3ta+/aaKObnM6dpQSEb9w8BpgAG9qLHt9i5LJXlw2Bz/y?=
 =?us-ascii?Q?jBkcz9uOTU6Kt+7tHQd7ZCeMSSrAKDnKttiusLKR6ufuLGYAhFpGzlYB2/dc?=
 =?us-ascii?Q?jAR8jK1WdCR+eC4PW601NEbu5o2op+JB/XlsZ+X/5iFZ/XuJ+g63k1TM9yYW?=
 =?us-ascii?Q?rYkIs6vOtWlSVVmVkC7+o8LfuvSCX0xG14CjSBTE0KFFrpkiAhpsvjuJF/o1?=
 =?us-ascii?Q?89L5HGui0Qlf2W4hHa8StXA09daA+dSmrCFMltn9lGYo+IcmsuleVfJ4I+TH?=
 =?us-ascii?Q?D1L9TbnIZejNHe7H/rU/4WCSRuvkr7MkLQsO7LSljaoQlgDa9onREjXVUVr9?=
 =?us-ascii?Q?hBDwINWxyPXVwABBxsWL8n9rwV7t+HqNdAWmJ2ytvdiSJB1rkyaCd3iCBmml?=
 =?us-ascii?Q?g2IiMb/aP6hMuoGGrKMk8qsJZ6BHpJQtbfyPDcLuJQdBfaRbRMuWt1sGw4WG?=
 =?us-ascii?Q?Qc8Qj6ikliRCW+HvIOpfIgb7Scb1AuugBIYvd9VeG0e2foNiFl0ePcCrfvXD?=
 =?us-ascii?Q?GuQKbruEPwEu9Zog7TXt6qtVSusQAKUyeNnepRcpMgkGt/K/KOU+yLfPOW0P?=
 =?us-ascii?Q?fY5CbkqA+3tIFDs477TY5/11KEvmHeBI0g5is/q3+pVSig087BoUdvmdktp3?=
 =?us-ascii?Q?RX5hnVY=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5928
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2c58c697-489c-4606-e3b3-08dda3415187
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|14060799003|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?O2t2b4o6ET+CL38OB3FanlJaJiJipUvDEbOWBIcarBNqyfKrgBjirE+ddPem?=
 =?us-ascii?Q?aDlMkX0Bcy2hacfyjXyYnhy8GUbf9XtJFYIccwD3LgvERnc94lC+OmsHdueb?=
 =?us-ascii?Q?FAwh+BXN712ge2fUQAc3oUp5+4SScTdDUtTIFQ8v/Tqz6+ZeofE1J1H+4zCd?=
 =?us-ascii?Q?A7J3Cp2VA7LHdpzxCAuVPt/mgqo9jpLaJETWK2JXzF6ZxJ/0WgNaMzQpGsKg?=
 =?us-ascii?Q?BYi1Y6kTAKxYRQiMLd0Mm4a6MO5z2A9eRafoR/eSugkrOG2GMKl0WhgMBW4U?=
 =?us-ascii?Q?FORtUz2q52KgDitJYw5hybZJbNgMLmLPcRnZ5QQ+A3ZgjBB6XzCNSlNVX5c2?=
 =?us-ascii?Q?O3rJ9+zWXkwwRKbhRNMs35XkNGn0japHQvfBWEGlrwMvDYfXDpUYTue78NBz?=
 =?us-ascii?Q?FA7mp0qHSkeM5UAL2X/XKo6Do0MpRIl2cbw40Dqm1dsDIrfQ5cY3Ug4fWJtQ?=
 =?us-ascii?Q?ccpSKNKfJhEOX3LJO9E3d+Sm0totWrFG5Q+JeKVRU6D6mjoMCeQzH+VcJid0?=
 =?us-ascii?Q?Rw+kKtUuCduvCAie8K1o1KhUam9w1cyptC8OBBr5CF+Bezlsa5MZ1jq+vqfp?=
 =?us-ascii?Q?bzhce0QugY/rjJoF3P95uhDKaML82erpFVi8KcSKqv4wPRYGoRa1OLkmKmMS?=
 =?us-ascii?Q?6wggz5fukPCKmvYcgTa2aLQe7DHSsyB1HCwoPVm0U5dVYmQvDlPsDo2yn331?=
 =?us-ascii?Q?ziSUu4XuE5Aj9zdSix9y1bMMXyejJcVeSwdj1BCY4aZbeRzwlUtTs5oFFmWk?=
 =?us-ascii?Q?ROLLHzsxzVooLBbHx5XF930FdkY3/canoAp0dc6xIg/qnPEhVpiKZr9RZz8V?=
 =?us-ascii?Q?sk+gQIPvKtorpFwLXLd9+LyW6HEFWLt5fRmI6FL2nHGV1d1V7Lp7XTxB6rHn?=
 =?us-ascii?Q?hiozMNSsoWgh3vYKiZ510jFcjgjFoz4Tk+dptonKk6jQ/xt16WUHw8UeyneJ?=
 =?us-ascii?Q?aOySf+Fb61rMbQ8rsALGm5nh711qinbDjMIaanbt1ZnPhb8h1SpSq5SR+v6X?=
 =?us-ascii?Q?Jm+DofAVk5AXDI02SICVW6Qyk2DwarmN8jTv2Z5QNqyiRxngalMZr/IwQvlz?=
 =?us-ascii?Q?YEKglXcMx4FfniW68BLlkQS011JxyvnoTZeRCD9Zo9g3dM5cyzgcNbWZXt2w?=
 =?us-ascii?Q?FTuTjQ9iBGzrqJPrQufw4R2CmliWaM2CpTbpDAqwmBq7kveRXNtpVgb2CYq+?=
 =?us-ascii?Q?JrVwT3OtcgSG2vIe0X1dEj9kMjU5vPo/EXDNznpzt1p/ZZ2gVsnE62DCufgC?=
 =?us-ascii?Q?5TwBBi+/8GX3fTuGLZRPg1hwJppKBqyc5E61VnAnqmZcZMnduRWe13gbtDpn?=
 =?us-ascii?Q?EJ+YUttOuwlOi9Bd1CcNN2Uw4vm85DBXfYzeJbGPRv7/rI46z5blzwI5LSjq?=
 =?us-ascii?Q?Powt7kKKVYzdg6+fX+oXDpdF0Mk6MiQuOL2xNHThEuCrhQmgQubfUJofeodq?=
 =?us-ascii?Q?vle619L2KY43iNX2SgybaymeEOpF2SREuO1RWEoHWzBe7QwK0wSWdQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(14060799003)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 08:25:42.6714
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c20502d-cb21-433a-3504-08dda3416586
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9469

Hi Luka,

>
> I am writing to report a potential vulnerability identified in the
> upstream Linux Kernel version v6.12, corresponding to the following
> commit in the mainline repository:
>
> Git Commit:  adc218676eef25575469234709c2d87185ca223a (tag: v6.12)
>
> This issue was discovered during the testing of the Android 16 AOSP
> kernel, which is based on Linux kernel version 6.12, specifically from
> the AOSP kernel branch:
>
> AOSP kernel branch: android16-6.12
> Manifest path: kernel/common.git
> Source URL:  https://android.googlesource.com/kernel/common/+/refs/heads/android16-6.12
>
> Although this kernel branch is used in Android 16 development, its
> base is aligned with the upstream Linux v6.12 release. I observed this
> issue while conducting stability and fuzzing tests on the Android 16
> platform and identified that the root cause lies in the upstream
> codebase.
>
>
> Bug Location: ___rmqueue_pcplist+0x3b0/0x236c mm/page_alloc.c:3276
>
> Bug Report: https://hastebin.com/share/tobupusuya.bash
>
> Entire Log: https://hastebin.com/share/imecipavet.yaml
>
>
> Thank you very much for your time and attention. I sincerely apologize
> that I am currently unable to provide a reproducer for this issue.
> However, I am actively working on reproducing the problem, and I will
> make sure to share any findings or reproducing steps with you as soon
> as they are available.
>
> I greatly appreciate your efforts in maintaining the Linux kernel and
> your attention to this matter.
>

Could you make a test with this patch please?

-----8-----

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 28066b4ced81..4c7007377525 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -707,7 +707,7 @@ enum zone_watermarks {
 #define        PCPF_FREE_HIGH_BATCH            BIT(1)

 struct per_cpu_pages {
-       spinlock_t lock;        /* Protects lists field */
+       raw_spinlock_t lock;    /* Protects lists field */
        int count;              /* number of pages in the list */
        int high;               /* high watermark, emptying needed */
        int high_min;           /* min high watermark */
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
:...skipping...
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 28066b4ced81..4c7007377525 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -707,7 +707,7 @@ enum zone_watermarks {
 #define        PCPF_FREE_HIGH_BATCH            BIT(1)

 struct per_cpu_pages {
-       spinlock_t lock;        /* Protects lists field */
+       raw_spinlock_t lock;    /* Protects lists field */
        int count;              /* number of pages in the list */
        int high;               /* high watermark, emptying needed */
        int high_min;           /* min high watermark */
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 2ef3c07266b3..f00d58aba491 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -134,7 +134,7 @@ static DEFINE_MUTEX(pcp_batch_high_lock);
        type *_ret;                                                     \
        pcpu_task_pin();                                                \
        _ret = this_cpu_ptr(ptr);                                       \
-       spin_lock(&_ret->member);                                       \
+       raw_spin_lock(&_ret->member);                                   \
        _ret;                                                           \
 })

@@ -143,7 +143,7 @@ static DEFINE_MUTEX(pcp_batch_high_lock);
        type *_ret;                                                     \
        pcpu_task_pin();                                                \
        _ret = this_cpu_ptr(ptr);                                       \
-       if (!spin_trylock(&_ret->member)) {                             \
+       if (!raw_spin_trylock(&_ret->member)) {                         \
                pcpu_task_unpin();                                      \
                _ret = NULL;                                            \
        }                                                               \
@@ -152,7 +152,7 @@ static DEFINE_MUTEX(pcp_batch_high_lock);

 #define pcpu_spin_unlock(member, ptr)                                  \
 ({                                                                     \
-       spin_unlock(&ptr->member);                                      \
+       raw_spin_unlock(&ptr->member);                                  \
        pcpu_task_unpin();                                              \
 })

@@ -2393,9 +2393,9 @@ int decay_pcp_high(struct zone *zone, struct per_cpu_pages *pcp)

        to_drain = pcp->count - pcp->high;
        if (to_drain > 0) {
-               spin_lock(&pcp->lock);
+               raw_spin_lock(&pcp->lock);
                free_pcppages_bulk(zone, to_drain, pcp, 0);
-               spin_unlock(&pcp->lock);
+               raw_spin_unlock(&pcp->lock);
                todo++;
        }

@@ -2415,9 +2415,9 @@ void drain_zone_pages(struct zone *zone, struct per_cpu_pages *pcp)
        batch = READ_ONCE(pcp->batch);
        to_drain = min(pcp->count, batch);
        if (to_drain > 0) {
-               spin_lock(&pcp->lock);
+               raw_spin_lock(&pcp->lock);
                free_pcppages_bulk(zone, to_drain, pcp, 0);
-               spin_unlock(&pcp->lock);
+               raw_spin_unlock(&pcp->lock);
        }
 }
 #endif
@@ -2431,7 +2431,7 @@ static void drain_pages_zone(unsigned int cpu, struct zone *zone)
        int count;

        do {
-               spin_lock(&pcp->lock);
+               raw_spin_lock(&pcp->lock);
                count = pcp->count;
                if (count) {
                        int to_drain = min(count,
@@ -2440,7 +2440,7 @@ static void drain_pages_zone(unsigned int cpu, struct zone *zone)
                        free_pcppages_bulk(zone, to_drain, pcp, 0);
                        count -= to_drain;
                }
-               spin_unlock(&pcp->lock);
+               raw_spin_unlock(&pcp->lock);
        } while (count);
 }

@@ -5744,7 +5744,7 @@ static void per_cpu_pages_init(struct per_cpu_pages *pcp, struct per_cpu_zonesta
        memset(pcp, 0, sizeof(*pcp));
        memset(pzstats, 0, sizeof(*pzstats));

-       spin_lock_init(&pcp->lock);
+       raw_spin_lock_init(&pcp->lock);
        for (pindex = 0; pindex < NR_PCP_LISTS; pindex++)
                INIT_LIST_HEAD(&pcp->lists[pindex]);

@@ -5854,12 +5854,12 @@ static void zone_pcp_update_cacheinfo(struct zone *zone, unsigned int cpu)
         * This can reduce zone lock contention without hurting
         * cache-hot pages sharing.
         */
-       spin_lock(&pcp->lock);
+       raw_spin_lock(&pcp->lock);
        if ((cci->per_cpu_data_slice_size >> PAGE_SHIFT) > 3 * pcp->batch)
                pcp->flags |= PCPF_FREE_HIGH_BATCH;
        else
                pcp->flags &= ~PCPF_FREE_HIGH_BATCH;
-       spin_unlock(&pcp->lock);
+       raw_spin_unlock(&pcp->lock);
 }

 void setup_pcp_cacheinfo(unsigned int cpu)
(END)
@@ -2393,9 +2393,9 @@ int decay_pcp_high(struct zone *zone, struct per_cpu_pages *pcp)

        to_drain = pcp->count - pcp->high;
        if (to_drain > 0) {
-               spin_lock(&pcp->lock);
+               raw_spin_lock(&pcp->lock);
                free_pcppages_bulk(zone, to_drain, pcp, 0);
-               spin_unlock(&pcp->lock);
+               raw_spin_unlock(&pcp->lock);
                todo++;
        }

@@ -2415,9 +2415,9 @@ void drain_zone_pages(struct zone *zone, struct per_cpu_pages *pcp)
        batch = READ_ONCE(pcp->batch);
:
@@ -2393,9 +2393,9 @@ int decay_pcp_high(struct zone *zone, struct per_cpu_pages *pcp)

        to_drain = pcp->count - pcp->high;
        if (to_drain > 0) {
-               spin_lock(&pcp->lock);
+               raw_spin_lock(&pcp->lock);
                free_pcppages_bulk(zone, to_drain, pcp, 0);
-               spin_unlock(&pcp->lock);
+               raw_spin_unlock(&pcp->lock);
                todo++;
        }

@@ -2415,9 +2415,9 @@ void drain_zone_pages(struct zone *zone, struct per_cpu_pages *pcp)
        batch = READ_ONCE(pcp->batch);
        to_drain = min(pcp->count, batch);
        if (to_drain > 0) {
-               spin_lock(&pcp->lock);
+               raw_spin_lock(&pcp->lock);
                free_pcppages_bulk(zone, to_drain, pcp, 0);
-               spin_unlock(&pcp->lock);
+               raw_spin_unlock(&pcp->lock);
        }
 }
 #endif
@@ -2431,7 +2431,7 @@ static void drain_pages_zone(unsigned int cpu, struct zone *zone)
        int count;

        do {
-               spin_lock(&pcp->lock);
+               raw_spin_lock(&pcp->lock);
                count = pcp->count;
                if (count) {
                        int to_drain = min(count,
@@ -2440,7 +2440,7 @@ static void drain_pages_zone(unsigned int cpu, struct zone *zone)
                        free_pcppages_bulk(zone, to_drain, pcp, 0);
                        count -= to_drain;
                }
-               spin_unlock(&pcp->lock);
+               raw_spin_unlock(&pcp->lock);
        } while (count);
 }

@@ -5744,7 +5744,7 @@ static void per_cpu_pages_init(struct per_cpu_pages *pcp, struct per_cpu_zonesta
        memset(pcp, 0, sizeof(*pcp));
        memset(pzstats, 0, sizeof(*pzstats));

-       spin_lock_init(&pcp->lock);
+       raw_spin_lock_init(&pcp->lock);
        for (pindex = 0; pindex < NR_PCP_LISTS; pindex++)
                INIT_LIST_HEAD(&pcp->lists[pindex]);

@@ -5854,12 +5854,12 @@ static void zone_pcp_update_cacheinfo(struct zone *zone, unsigned int cpu)
         * This can reduce zone lock contention without hurting
         * cache-hot pages sharing.
         */
-       spin_lock(&pcp->lock);
+       raw_spin_lock(&pcp->lock);
        if ((cci->per_cpu_data_slice_size >> PAGE_SHIFT) > 3 * pcp->batch)
                pcp->flags |= PCPF_FREE_HIGH_BATCH;
        else
                pcp->flags &= ~PCPF_FREE_HIGH_BATCH;
-       spin_unlock(&pcp->lock);
+       raw_spin_unlock(&pcp->lock);
 }

 void setup_pcp_cacheinfo(unsigned int cpu)


Thanks.

--
Sincerely,
Yeoreum Yun
