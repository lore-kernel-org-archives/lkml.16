Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013020.outbound.protection.outlook.com [40.107.162.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7868828AAED;
	Wed, 11 Jun 2025 13:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.20
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749648912; cv=fail; b=frM+hRRV+UDGAz35YPtSWUyWX5uavVNBxqdFNSThtw4YSIAygUYc5pIOeT2Y3Aub2Ww7Mtwo8lIDGbCwzcEDLYW29mziqnfhI+QkDDziVHYr8nHjLEHGLZl+WiJ14yUS36r4PMXUyBPmVxLqzb9V6zvOhrS/F7tWUIjSok66dro=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749648912; c=relaxed/simple;
	bh=JSF+aWqnWbUihgwKDINQV5ORNsVmrZv6LyZae8lF1zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IaW4jn3MsMT0q/nFDh96ksDQFoTgr0k0/jGN/F6dw8fC+W1knzA4Ys/pru/Rpjy/MzzQohJ4myx7JrbjYItLMwPFs3aLBGOGoZ4vyDJlD/5CQABPf/xgedJbMu3TrP02NOXwMcs6Jgs/OIbiaAiydnZImLwbNv4gk6UkXXxYoYg=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=lUI7OYBt; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=lUI7OYBt; arc=fail smtp.client-ip=40.107.162.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="lUI7OYBt";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="lUI7OYBt"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=y1hXIPbUJCBsu0KS+mWxHoj/EEqKF7t9ZWSHhBH3k1WEOOA7Y0sM+ac+IFzIRL8QXM8spFV+/wrNrwpmw5VoQGkgjHTXuri4JV6RcFpVcvWm3JHq9eXW4zswq8sgZo1h6q5Bz/Vh9ntQ5H8zJX+iRLfFBdNy1/tS3N2qNpQxza81tvM7ZsGCnZvUTDxb7rUKLOkMvib18h9V5mPNABJhzRlXm3t8tDTpaCTduhrV7IfIidVdvlpEAOxvclpK/lCgoB2DKZ5tloG2ROxwlDZRfcb0CHKuDuqQ9qP29c5WbzhjlSqYOAGyBjtk1MV0avY6ATEKrIsZrWY7Cgcr7mtlgA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5HvOhvMieo4qNxWMvGJDfYLP3i8aq/Ak3I5am0lp0I=;
 b=TAPZLk2dCu96e0IwBA6n179NYoy+lOVgyHT6pCeBbuiOvwL9HpyVwyXMzhEmYVCqzxvqZEeVJ0wNL3oOYS0TSdy6TAZ1/14HjHOM3WNFkiEDTm27f4e0BTxg3BRz3+KaSnecRUJ9pAiiCt7zvkQBwYU1ysmGvaGUdVJ+8Wb8JvHHxE1tyt9N/tXLz+hjFrO4yIu0IICOdxG5quXc5Boynj9YVXQSpwBHNAo/0t4P4GUMvs0P0XEnGWDYFHizb0fV+N3mXszfMdwydrKFtURbMMA8LFw7FoWSB9qSaR1QNs8Er8tgBqGPdrp1SIIRV3PJeoSixyUB/Nrn07tO+pijfw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5HvOhvMieo4qNxWMvGJDfYLP3i8aq/Ak3I5am0lp0I=;
 b=lUI7OYBtX8Y4Qw6kJcCa1F/Z/w6C6KMAd0AXvjBj79/jIcF/LTSDqkXWhPBLE9FMoRB+NHcCQdRK16ruKsAlVKEkvcR/uvhrgvUmDJNXJ8enBgO8dYPB5pMolfPvsiGUSN7tUbGU8GPeJyYdZEuJohNc8DB7JXy9meOeCJUZki4=
Received: from DB9PR01CA0010.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::15) by DBBPR08MB10842.eurprd08.prod.outlook.com
 (2603:10a6:10:533::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Wed, 11 Jun
 2025 13:35:07 +0000
Received: from DB5PEPF00014B97.eurprd02.prod.outlook.com
 (2603:10a6:10:1d8:cafe::f9) by DB9PR01CA0010.outlook.office365.com
 (2603:10a6:10:1d8::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Wed,
 11 Jun 2025 13:35:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B97.mail.protection.outlook.com (10.167.8.235) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Wed, 11 Jun 2025 13:35:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lfNdVLL7aT0FK5u9hxBHsC2D2oEpA49mPFgDumSksIMY0jzNDyAkY8Xn2gcLaWU3wJTiS8lixmcoLohWsDXogZATv1m7eNVICJhvwMUj1n8Zfuyq74wsOe6Dh/wKI/s6Y+i9N7joyhXcFQ3N1EU+b15SXqyn+OS7UaJ4Lq/uky2Vd6YVUGZ9jW9/8RBcRx6kSPxJy1uyIi+EHSki6K7dx05swdY7I8YtnDQxjJvZCXgYO/SikbWPJXrMqb5kydLfnc3TEp4X5pOZiNMg4StvGJOaxfSJsWhMfMOl/XOgZlN7a0QKb9L2ATKohhHvLvfEokW1HxHmSGD9nSYmtCkoCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5HvOhvMieo4qNxWMvGJDfYLP3i8aq/Ak3I5am0lp0I=;
 b=cnH+ST4P1+Ls8poxGwKzs33DtW+4tFWaBxHCKCi7qYg72SKB7NDqJFxJfYvE2C3ObXO0dQt5ICPD9rKbLPj1ADbjtopE41eWNXKEXizOUb5CCnT5XauqT5tdkqWKic8G6iuJHFo1DvIAbqoDaOLGfvaBbYwxDFOdCkLsyshhwyyP6jeETUCH+AmE/aNWETE1mSDiAJBrrhys/JkHr2vlyhdJF/S07CF43RNCgzWd5mpVulUqu9dnx4eueInkrPkE99iAkd1rlZVFja0x6ACce4tkl7jP2abmrC9xnl9MrkgolyMqYOA+9Dix8j/JL18ZG+SbzAyUFIfEJ2PIrs+TQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5HvOhvMieo4qNxWMvGJDfYLP3i8aq/Ak3I5am0lp0I=;
 b=lUI7OYBtX8Y4Qw6kJcCa1F/Z/w6C6KMAd0AXvjBj79/jIcF/LTSDqkXWhPBLE9FMoRB+NHcCQdRK16ruKsAlVKEkvcR/uvhrgvUmDJNXJ8enBgO8dYPB5pMolfPvsiGUSN7tUbGU8GPeJyYdZEuJohNc8DB7JXy9meOeCJUZki4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DU0PR08MB8302.eurprd08.prod.outlook.com
 (2603:10a6:10:40e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Wed, 11 Jun
 2025 13:34:32 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 13:34:31 +0000
Date: Wed, 11 Jun 2025 14:34:28 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, akpm@linux-foundation.org, surenb@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 9/9] kselftest/arm64/mte: add mtefar tests on
 check_mmap_options
Message-ID: <aEmF5PYpgtsuTu9R@e129823.arm.com>
References: <20250611094107.928457-1-yeoreum.yun@arm.com>
 <20250611094107.928457-10-yeoreum.yun@arm.com>
 <9a81979b-2b9d-4bf6-88a0-5803483f802c@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a81979b-2b9d-4bf6-88a0-5803483f802c@sirena.org.uk>
X-ClientProxiedBy: LO3P123CA0008.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::13) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|DU0PR08MB8302:EE_|DB5PEPF00014B97:EE_|DBBPR08MB10842:EE_
X-MS-Office365-Filtering-Correlation-Id: 746ad379-e5b8-46b6-abc3-08dda8ecc6db
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?0B7e2GDBdM9KbWZCRbBZTPiPjm+FNJ8bDtkC+Ek6dxVXfgnVIuFbZiFyQYuz?=
 =?us-ascii?Q?xpKVA7lmCwii1wkgV0OjSpocWTu1R5gmO1PlAO6Tkg+NNzvgksFAfoc+dk1K?=
 =?us-ascii?Q?N8RDtSy401C94ydnR/Y82DCTeD34SoSZbAVUEGCDX4fOKtSMaXyweusvO7/4?=
 =?us-ascii?Q?74RjrSvIPLSf3VJ+gNr1kc3nZ4fA235slsnTLaMJ3SYwunuc730B1MuR5tdY?=
 =?us-ascii?Q?pv4v/yy/sX3mA4T32qmr5PmJ3xkbmoO4PMeoiXb32vcHIsKzDj5u2/m02dsI?=
 =?us-ascii?Q?gDDx2hFQbEzpiAVb4mD9SgAIeDtzwz/7yd/IJnbBhPq4Qyn21bOKfYTqNSge?=
 =?us-ascii?Q?1FFqS3qT47II2owLh9+on4bVZpm6ntkEjsYSjFl3kKUo+cx14QzmaERxMEtk?=
 =?us-ascii?Q?EohsFy5fO5twZppnLhnJwgErc0y43WwnHqShH/CakIs70Cr/3Ckt+NzAPcge?=
 =?us-ascii?Q?z8e7GlRU25J/FXJjX+c59O40T78dvOfr2H6Q3aJopNnOZaVZyC0/7nAWPwQp?=
 =?us-ascii?Q?LRPgyODUFYowV552tRT5AWpulMYvjyWrMnzyroBFx/kgIEmWZ+XcxD38SAdL?=
 =?us-ascii?Q?27vTHzRHDXBosBSt7UFSpXUVI0xjFiL4VfvbH3lyu4rygayP2DesqKHUQGpN?=
 =?us-ascii?Q?8f57K7jWKWg5URCTE0lPaGyJTJG8YFRWwydyK1Enn5CNbT69BUThuDBes3Q7?=
 =?us-ascii?Q?E7ZuEDyY1N4Uqirs0CdS7VPlKOe30n4VZgJzQFkXVjLlrc0UZL4iILEi8GTd?=
 =?us-ascii?Q?q8ezBmCMsTRuOfHNZOlH+HWMYRCaC7xfeTsT2sk5r12kpUqQx7YqFDNn0Rj9?=
 =?us-ascii?Q?pXkexwL6ht+zsmMtUhTRD/EYTa1+O7Id+pB6Qh/Fsfjs4BVy3/NWh72OqB8y?=
 =?us-ascii?Q?BW6bgeJoj56Gtk9ErAiTfq0Z8vw+Wq3e5STzYvN/gimwVtyi2f7RqdAS/+o3?=
 =?us-ascii?Q?wJ4jgSjIQWHzcDrRWLpZ1v3tPq7FHedEpbwjBtYkvFbaMcrDUKFh7ClFLR/M?=
 =?us-ascii?Q?eB+P450v8aB77pw6tVF3g6M/+ORsLw37G3AHftkP0cjU1wOnM3TcxCo1zJXX?=
 =?us-ascii?Q?8IRiqMOmigH3dDVnNu4YobfjYYM9eK9niPd+hGrIiP/4eUeD0lvN6Jjl/40m?=
 =?us-ascii?Q?J85q9driBtVzQckxJlmwbEFDR9UjZ7cinVlv7H5eInkuyb2mxyaBDf1dgKYT?=
 =?us-ascii?Q?FJwuIT2A7L8YGDzmea9CGwJ/dgXy/7j2CwTtBe00olMANRO6372XB8D+XOAJ?=
 =?us-ascii?Q?gj6P9sd6MCiGUq0MUQKgQKstUr/WUQSN0M5By3wPnccceKn1K0dizswznM/u?=
 =?us-ascii?Q?ro7dtlh7rojeALlbaHLrHsh0UrSED3vU909SJ6iV2jmxJ3ELlvwDDfhjc0WG?=
 =?us-ascii?Q?ObafRyrcvnctUpLtGFzBmC38eT40wZE3bJOv1lHOitqFPQHPAQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8302
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	65f11ade-4d56-4ebc-910b-08dda8ecb252
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|14060799003|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?U7VnfrZL+44HTA7HVnHwYAlIvBk0ocFIZKSK8qS4Veen6YE3ev19fQcvg66Z?=
 =?us-ascii?Q?QyE8E19nm1DEtjB7GOpDvWbiJ3ShXccaSGNThTXTbCWblj2YuUcqETp1jAbZ?=
 =?us-ascii?Q?4i42ISLd2OFMY1+2UgPIR8+IhpFvTVqibXFK3RpWGWjZemoDDK2ivDXXuC+m?=
 =?us-ascii?Q?2rslh2NJodO1GQoI0YtjV7LwAODzWhA1xhtl4MQshOiwuj9nv/Zef1CILCng?=
 =?us-ascii?Q?w/Aw2aZLK/p5z2XBiZJ032v9VfUgF7w/gOB9Gop3n2GEfvUlJVenQXMZSess?=
 =?us-ascii?Q?5KC4Qopq1R1HV6opUiF7pHNusLlTO8TD+n7iqi1zZ0L9KSCRx4ix/UODPNRw?=
 =?us-ascii?Q?7Ssa3vM6PC43VB3YIpBRVnFTuWOFD+CHSlgESGviVCsjPFDvbiPjF/4rHyTB?=
 =?us-ascii?Q?jYjqP7XX8cPRMoP0o8QF+9GqaBT7h6syhKuWLtJB5imujXnjHyeSba0A28/8?=
 =?us-ascii?Q?F2dDoK2Tz0v/OmigsqG5HBX+xC7YSSE1D4iKhwNFNNCoqWYn4YdNYW/7my4k?=
 =?us-ascii?Q?wB/TWQOUM+bjZ+Gn6xzntSB6JYN0MJOOmVApFy+0f/xNj60TTrxIRmfod3ZD?=
 =?us-ascii?Q?EI3gcSW+xT1HmqKc4l/PXHcNwWTfKLFF6M0XVSUeUOKqzhwEptrx6u+ofg3s?=
 =?us-ascii?Q?JpGwltjSO1ZLMGP5ULdoL5vg7alpPtrWHNQdYVwrMKejcVjjdWHT9+tomyoi?=
 =?us-ascii?Q?UoJmp3jdXUk3YDyVnisCUuTmP0KvYjQB0j/itCCePaCQq5UFZuykM8KGxY65?=
 =?us-ascii?Q?G0xRxB8Tp6i/M5qnxNnIi8Bz+vkCVXDKmLcL60XYdLQAZaIdJwLUVvzA6LjC?=
 =?us-ascii?Q?0UShMm1nYpQr9D7qoUA+CzSyy8ZhMBrB9g//+2+1kNujm5lrpAigJNuyQpbf?=
 =?us-ascii?Q?yG1CAdUyMTwkd4ta+Nk17mhDaXAZM7ghmQr8Ce+ZqX2o2VFDezfOOhfkh3NB?=
 =?us-ascii?Q?F2QNKkk1/xgyrlS/ZWBdaRj/JEaI0aqubUsbQq2aB7JqUNIxbBQ/bauIs7xm?=
 =?us-ascii?Q?IBpZpBfbb6Vf7lsBJ1BoVMAvWpGxZZ8DQ1R38fRxGl1uiu6SceaQ3B9aPlsZ?=
 =?us-ascii?Q?IC5qX7Dl7ZwFvBJg5GXXXR2XwGVRazAqOpuLQVbP1rwRaYN+YGtpxSz3UyVN?=
 =?us-ascii?Q?/OPRglAA+KvVkonWJnzZPw8YHDniW9LByxfffahhuLPBzS2C+wDPIclaQtIb?=
 =?us-ascii?Q?nAbacB5ntkoLfXXfjYSxkIDBp8KHHQ6NXDulebgRERIzWgBTDqIasct/NBdk?=
 =?us-ascii?Q?DBRq2VeJ0ahVTWFTY4TTBSgwgB+k6wvnoGGNuTsn7fkUajg9WTADCod3l/Vh?=
 =?us-ascii?Q?YtzITSK0XfZNt4fgJLwN8uvjs8MZpzkOEyGVtfT9kUDLJ14TNoWF2y3Gmzt8?=
 =?us-ascii?Q?nI7atlOHAjKACKbuoq+t2R1LqV9DSQJTLp0oz16NJR5RjCX3iEHobq9J1WBR?=
 =?us-ascii?Q?WMdQ1QWwMGUyb8eTPQiQziIqe6HxgXAs+oOtRsQt3Z+sLK/1TAkrC8ix2rPr?=
 =?us-ascii?Q?A6gWWLeUX9gkg3LkcBW5mYMvTyS/u4cr7Jzg?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(14060799003)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 13:35:05.7493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 746ad379-e5b8-46b6-abc3-08dda8ecc6db
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10842

Hi Mark,
> On Wed, Jun 11, 2025 at 10:41:07AM +0100, Yeoreum Yun wrote:
>
> > +static int check_anonymous_memory_mapping(int mem_type, int mode, int mapping, int tag_check, int atag_check)
> >  {
> >  	char *ptr, *map_ptr;
> >  	int run, result, map_size;
> > @@ -97,16 +106,16 @@ static int check_anonymous_memory_mapping(int mem_type, int mode, int mapping, i
> >  			munmap((void *)map_ptr, map_size);
> >  			return KSFT_FAIL;
> >  		}
> > -		result = check_mte_memory(ptr, sizes[run], mode, tag_check);
> > +		result = check_mte_memory(ptr, sizes[run], mode, tag_check, atag_check);
> >  		mte_clear_tags((void *)ptr, sizes[run]);
> >  		mte_free_memory((void *)map_ptr, map_size, mem_type, false);
> > -		if (result == KSFT_FAIL)
> > -			return KSFT_FAIL;
> > +		if (result != KSFT_SKIP)
> > +			return result;
> >  	}
>
> This changes the logic to exit the loop immediately if the check passes
> which doesn't seem like what we want, should we instead change the test
> to be:
>
> 	if (result != KSFT_PASS)
>
> which I think is more the intent?

Well, at the time of write, when the check_mte_memory return the "SKIP"
intent is to iterating the next item. But, yes this is meandingless.
I'll change with your suggestion.

>
> > +		result = check_mte_memory(ptr, sizes[run], mode, TAG_CHECK_ON, atag_check);
> >  		mte_free_memory_tag_range((void *)ptr, sizes[run], mem_type, UNDERFLOW, OVERFLOW);
> >  		if (result != KSFT_PASS)
> >  			return KSFT_FAIL;
> > @@ -192,7 +201,7 @@ static int check_clear_prot_mte_flag(int mem_type, int mode, int mapping)
> >  			close(fd);
> >  			return KSFT_FAIL;
> >  		}
>
> Won't this upgrade any skips to fails?

Right. I'll change this.

Thanks!


--
Sincerely,
Yeoreum Yun
