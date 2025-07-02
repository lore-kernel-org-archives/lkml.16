Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012036.outbound.protection.outlook.com [52.101.66.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75F3274B24
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 12:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.36
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751460989; cv=fail; b=irCWh61+EH9kk541ia5yoUA0BfZHnyXwseH+l/SCUZ+TTLhUOQoKRFtn5ZofjKkMrcQ2zF1CiC7I7r4r8bFWRMJfxQPwADhY+J3u245ngDExITh0+TPgxGBREE4vCbvot0+fGYI0FCd8+iVf6B7NfcxwYGod3rONtk7fkm9Fuzc=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751460989; c=relaxed/simple;
	bh=unMS2zvPAbtIoxF1yxsPCll+YeFRgvIr8QqFb5ZUBzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rr4NixzZq3nv++8SMP7624yf6H6Xx8xgT+21ieR4yhO7foAoYdUev4Yi8mjl380mo7XXKAI+Wpn5FnhiUWPslGEFH4wIcNF07zBCnlq1dg3iKUnHyPlJrvlz960ehXDjtJ+WXt0JgWn3e5J8FmEyqC1V7SxzkDM7FkEb5x+PROI=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qqsMcsMM; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qqsMcsMM; arc=fail smtp.client-ip=52.101.66.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qqsMcsMM";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qqsMcsMM"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=juin5rtxx3Hpb5nN/nBzIRlFa4nCdumAH950aIUaMqpwWh+QEOwtIer+y1NbZIa8nSULJ/UQncwb+1vTgSvjS6Rp4CI61OsYosKYrppZNc6kXrkc/Kg86/i8dNaX7T54q02N3hdiqcCBmQTstuEAFRPxRL4IuCX6eI1eaRFLHGjKB1WBBlMbT6OyfWS4KYMYUjp4lPRi70FD2gEU08OzvFiOozZeCjwlDbXv5kX1jakUYh69pr13Rl72H/NXtDWXWOrCEbbmhqxjJA4/ycAMSSW1SgREaIIbbhBBTLtmD/KcS9ghmO38k/w0/g0hg0L0T5snEjZpw/NOEcnXf4Gdsg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+jHPiUeldD8dhONJEpxFOonPC2AXGWpQaz9V/YVPBE=;
 b=V+nPkzPopfJ5SdRxOon4oFmX9YsIOQWWbccTxVWnmOtMIC+eqqNCDY/g5jykM4RdEuHHcHxitVpkPZyGyZHykNR2dFjzX0p/jvw7qbZW/UkKNktRgEOLcfxayG2ZqcCIkw2nI40Ks2zcXD7JLl/G6KB5mnJ2x/UISdxqHeUiU+RNQ9DpQcWtT3hl6alGgTtzuD7E/SAyVpREmA77tryLWEudVpWATGSnLsE9xW4j/NsY0cOGxv7vLYuwWTvhggimtY6F54nmAnXC25LyYtDhKk0ZeYQFeg4LECnzRnKVuWgpCE4gMSSfBuFflDdjE3aBzmQKyTGgzbk6RfGzq7bMkw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+jHPiUeldD8dhONJEpxFOonPC2AXGWpQaz9V/YVPBE=;
 b=qqsMcsMM6SzTVenpoFYAZHsfDN87l5g94oQnc9tIudnbDZl7hG56EhOQwx68cZCiPKv+MFzSHJynkYZVfBDnOjbWeu0wrLTj0i6fmG4rZkypLf9tW2gGOuMv0fP4Lkz4AD51GzQd9XCZ2xUU/TyqfuELAkulgOQzKwk9LW0WrEw=
Received: from CWLP265CA0414.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1b6::17)
 by AS2PR08MB9101.eurprd08.prod.outlook.com (2603:10a6:20b:5fd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 2 Jul
 2025 12:56:21 +0000
Received: from AM3PEPF0000A78E.eurprd04.prod.outlook.com
 (2603:10a6:400:1b6:cafe::a9) by CWLP265CA0414.outlook.office365.com
 (2603:10a6:400:1b6::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Wed,
 2 Jul 2025 12:56:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A78E.mail.protection.outlook.com (10.167.16.117) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Wed, 2 Jul 2025 12:56:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WnqUvyQzMrzsJp5InbgByGSlj4Glbw2ACsX9b42e/1vZ74DO8BaTHScVm2DZSnBBj5w2maA+qjwgOSsb5evbnV5CaRO/CMneT25cfgaLP9BnRGTs09/MBQazk9ejU4ElhsgbPzx4Fj32+yLFukhtatSRX7rwvHexyUo9jOVYUzQPQTbhn8sXV/9ZujXle64qBNA6iPYZfyvLWj2bt13Z0R3wQVD5LpX/HiMprmrv4BYx3pwo8SyCD0LNox4u65bkFxuN8H8u/QuPf05lt/3dXy9l/K78A6A8P+uQ4a1MW3T+4EvCjYSGIClwlvf3oJ5SoqFCWmCl+WYK3aOzX18xvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+jHPiUeldD8dhONJEpxFOonPC2AXGWpQaz9V/YVPBE=;
 b=L7iaOx8bpVsR74onGxoiTAxBB0mLWtBa9+sj/p2fHFJwrheT3P2lXYYx5GD0NUgAD45Z9Ba6Kke+V4RHB+0e1zZCevzkjk6p31bLvXu4HFpBdnevn5uuwj1VmYbKwxuTko+O4Vjq/pJYCe+p1P9DEdxvOXSr6OWQEY8pTFqtQFB+kNoafGfd5FVMu4RJ1jxDN4Rs0nl72gaHo6CDZMnUvYGQnFlKyCAUX9Maq3ef/dR9PU6mt97PebLDk/Dsyi9cUaD1Z5p1Gh16FOUN/pcqGRr+/C8Vp7XB4qONySFE2Ebm03Cl6PCM3F7saqrB0Sw2n/XQo5m1Ri/Ln20Zbx0cvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+jHPiUeldD8dhONJEpxFOonPC2AXGWpQaz9V/YVPBE=;
 b=qqsMcsMM6SzTVenpoFYAZHsfDN87l5g94oQnc9tIudnbDZl7hG56EhOQwx68cZCiPKv+MFzSHJynkYZVfBDnOjbWeu0wrLTj0i6fmG4rZkypLf9tW2gGOuMv0fP4Lkz4AD51GzQd9XCZ2xUU/TyqfuELAkulgOQzKwk9LW0WrEw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AS4PR08MB8070.eurprd08.prod.outlook.com
 (2603:10a6:20b:589::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 12:55:46 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%5]) with mapi id 15.20.8880.027; Wed, 2 Jul 2025
 12:55:46 +0000
Date: Wed, 2 Jul 2025 13:55:44 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/28] coresight: sysfs: Validate CPU online status
 for per-CPU sources
Message-ID: <aGUsT6gMJkYDbGPG@e129823.arm.com>
References: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
 <20250701-arm_cs_pm_fix_v3-v2-12-23ebb864fcc1@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701-arm_cs_pm_fix_v3-v2-12-23ebb864fcc1@arm.com>
X-ClientProxiedBy: LO6P265CA0015.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::8) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|AS4PR08MB8070:EE_|AM3PEPF0000A78E:EE_|AS2PR08MB9101:EE_
X-MS-Office365-Filtering-Correlation-Id: fc590428-75c6-4f91-c2d9-08ddb967d7c9
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?BY4Gb4+FxwdrcBl+p8KcogLSiS5DuYuC+kHPeVVkBt6MrDuz+d6dqKghO/gW?=
 =?us-ascii?Q?GXibq3VOx+EkBP/EEJWJ0drysIrcFLzISn8efqm3DfGWleOd+5DTCo9x9pXm?=
 =?us-ascii?Q?hQueIqhJOuMTDyT41UwPTw4gP4o491ujRqy6fdRqPVnmsZG1wHkihQXufPEi?=
 =?us-ascii?Q?wI3wN5usexCoTDy6zwyqamZBbi4fGiysaoFjYXMhC2c5OEmqHnfKSJhr7skl?=
 =?us-ascii?Q?iXl6LIpkrtFZRyfMtD95a0nb2fPkmqfBNsn5gI6k4oOCg3MuVv1FHj1crxLr?=
 =?us-ascii?Q?p0dmQGZDBHb3x6DKx5givM1Ra0ThOyLxtjSJCeq74sQsqPsQc0N6ZhAonjqS?=
 =?us-ascii?Q?aIVAtvjXNwlCBNV3hnNiaYyuCB29jGZeWD3taZkvn7OPseqHJgs2TQogZpM0?=
 =?us-ascii?Q?QtSGGRYVkNCbcX65LpBPunYu3ObLGEpmn88jRgOwtNtq2IBAo58YgCRupxID?=
 =?us-ascii?Q?iMKZkMVGKU6o+xAZx0p3NJsJSj4QjAmUgrlAvS7S5x/JGlm7oq++lP4oavZj?=
 =?us-ascii?Q?tpY4keAw7ulK8ZWG2UfkwcCRPcVvBlq1Oi7MSBD1mCzCsc2b0KIErtis0ETN?=
 =?us-ascii?Q?Cl7ET9N1EVsXtVye38M+M1qGbk4svoFkXFXXXJUjdbtHJwPawuXK/jSzM+fw?=
 =?us-ascii?Q?VdzzKzT7zuzcxSSphzHMlwvwbTh5VytvnTBigxUK10mJdB+y9J0+ayRSO/AK?=
 =?us-ascii?Q?Bohxr82lFShPwos/ZgMl+Pw1eQHtWlmg8/lvg1sg0pabqNcYMOX11zdznbLg?=
 =?us-ascii?Q?fOO7L3BDOEaEjDA/HLXKrhLZTOC41qdb0TxAbbB2VCU6CBfL17DZ7HQKeahc?=
 =?us-ascii?Q?c0UoxD3YOBa7L4KwV1+PqWJkc3IYeuElsycT3FQmC6hmyS7OtISyQwYF11Iz?=
 =?us-ascii?Q?DA3C6U41/eW7z0MdtnoBi+mcrBrr46jXTYo4KmurofemMWA9kQ1TJT8p9KMO?=
 =?us-ascii?Q?4dou56fWF7UwH/Q5M1ktXm5+6itvLJH4xWdiM4c61RGWHTIckGjK61Gs8yl0?=
 =?us-ascii?Q?G/TQdQccVhMHWKdXKo+os0gkQpzlPN3GLcN0MJUGOHKRS4z4KVnnPcte16IM?=
 =?us-ascii?Q?zp1dlrVU1p5fQWFkLqwiNz8sbbJtOXbdNPH/DHTl0o9jQgmrKGFqn47fYUB1?=
 =?us-ascii?Q?23XLeb59nF3JeGrrAW7Re5ZQi1yNiLrPa2dVL3iZqqtG32CsqJ1qG5MySPOJ?=
 =?us-ascii?Q?EaJinQFcecrOcTSUc3GzQ7qigOiboa9+z/2JB+j5PTt510r6FhnC+u0xfKWg?=
 =?us-ascii?Q?SqpZvwCZkiQZvru4Pl1VqHPwOQZEUi/FMpAVuzQoscyBIbElUt2DeWFTdRSw?=
 =?us-ascii?Q?w7lOE3mxIVN5l4Bx2zcdhXzhhl97php5+qyJnhp95d5qA9/XaHuK/wwIGx8X?=
 =?us-ascii?Q?iDehberBq2sz2zEeFQd+RtykAUZRzsYHeY9PfYtVtGX2Kc7NrNPi6Q8Dc9Df?=
 =?us-ascii?Q?Vy9X8oyfXjQ=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8070
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1df82e57-e855-40be-1587-08ddb967c331
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|35042699022|14060799003|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tj+DbLz5FArxSjgutTpjs/at2uTwN3Fx+8L8u1Nos6hoBrxDG2OcbLcmTju7?=
 =?us-ascii?Q?lHpbYgArpf94834J6odmtMX8cy88pM4TlYay/M4EOn2efQ2TOMl7+OunoGbM?=
 =?us-ascii?Q?xcN9IwfDOZSqsdgDUmgmISuLdcXvAZrF1CBAYLFlLuzQinkdHa457DVeNXzO?=
 =?us-ascii?Q?tWsH7TJWv90IAEwPzku3p2Wnalkk8UADGwdzOO+btzVy8Z441+KssetOh/t8?=
 =?us-ascii?Q?hdDImkp6zoAxmKsjitgksPWy+e+Upze+IOHjaxtiHqNl023Uh02QsStCVlEQ?=
 =?us-ascii?Q?auCO13MJVtgG+RWyVst39umK39JEmHteEu1EyGN+B5Cvm0cpfAiU1KYY/6ZE?=
 =?us-ascii?Q?MtfYtSzbd3198InodKrGsf3SWiEe74xDg42YWngTOLp0TUaxZIaJov10OBRk?=
 =?us-ascii?Q?dYkvjzrGLqN7E8MYMER+vpti9C2VsJ0ykGDqdQwX3RrkEh67/QWhsVxtjSl8?=
 =?us-ascii?Q?sQsDdqaeD3+MBvsKdJddF1HA217heM6tSa+LyKOlSm8IR4kxR46KVLHyoZyH?=
 =?us-ascii?Q?Nwi3Y4cmmJ/Sl8Xl0857E/sRB3YrmOAKqdpPNB0wj9UIotty3MJnTnjqeGC9?=
 =?us-ascii?Q?IddhyCpnhckcc9UYlGpAjMqaTjiQqClw/m3QPrERqGKMBaGMQojT/Z+yUXaV?=
 =?us-ascii?Q?tWU27hgGfU3+cOymOD3R5dyLqxKClbUQ0DE6qkW27mbSm8AMekK6WQlPUbjj?=
 =?us-ascii?Q?5JxnqyB3yEsoNXd2iUg8jCGDVqsg06j3+NKlecpfRMj7VDmS0L9DfweYpOE4?=
 =?us-ascii?Q?RRDv3dMqvml6mjss0xmVQUFfDM/E5JdtH2yMDHqGvJu+lcg9G42KD788D+Tm?=
 =?us-ascii?Q?tuZI9R9PuwO1eWAHpxymYh7lgdGaVTSZkfX5+HpyUwbX2sQyG+rzMNcqhnv3?=
 =?us-ascii?Q?1aTBJczBKzOgbzzxKhtMqFIUaXhIq8q+x0Nea3ySTOUvZ7feNH/S9taRmCei?=
 =?us-ascii?Q?WcbOjGd43RBjJ5myrcbI3RKFdUXV187pHhRyUKxZ6NuZ8ll9M3xEJIBSGEN+?=
 =?us-ascii?Q?KUNGW09h4MdeOky1mcujPfLO1VMrNxEzd0j7ma0uqXogyqwDdMAtPAA6eftY?=
 =?us-ascii?Q?nLD/NldSHt3ezbErmXsvqyVIdFJpQs22xuXPi9aCPIREvpwlkiaDfdHE2vyF?=
 =?us-ascii?Q?RL3YsOz7qiI2xqsFJy4jRjxelnTBOub9G1/rTGGCAmGuOKnOfq2mQxb2qckm?=
 =?us-ascii?Q?2qiWuvEbNIAUOBU8q7C/vQsHJNnTxVnrRrzxEbDohgRmTFEKPLLGnyqQn1lq?=
 =?us-ascii?Q?IsXPlxWl15Bcy8p8ownoaB2mTqB14H1sxTqfFtgfyXcwWMf15jOmBWZ02PGy?=
 =?us-ascii?Q?62AwcI01uGXBUr/ApdhBerbMPZ8pUlYXEh/NxSf4DCzw0sXZ47tqtW00TtwD?=
 =?us-ascii?Q?WS0h0IBWrzR1KPqN309WpwLDHf16hyQUbSWbLChiXggERWpHwszlOAl+G881?=
 =?us-ascii?Q?cMEWyctznliof+N8LoxqwOecKHP2iJ90nrtlTGenjHgrj6oViyNZUzRsfLai?=
 =?us-ascii?Q?HagWa307c3I9iBfKLm47TmbcJrZ+bO/3CAJd?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(14060799003)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 12:56:20.8651
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc590428-75c6-4f91-c2d9-08ddb967d7c9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9101

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>

> The current SysFS flow first enables the links and sink, then rolls back
> to disable them if the source fails to enable. This failure can occur if
> the associated CPU is offline, which causes the SMP call to fail.
>
> Validate whether the associated CPU is online for a per-CPU tracer. If
> the CPU is offline, return -ENODEV and bail out.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-sysfs.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
> index feadaf065b5318c8426aa53420b8e5f67a258683..14ee15297b98115122068cbe932f0b2ce004b77e 100644
> --- a/drivers/hwtracing/coresight/coresight-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
> @@ -161,6 +161,9 @@ static int coresight_validate_source_sysfs(struct coresight_device *csdev,
>  		return -EINVAL;
>  	}
>
> +	if (coresight_is_percpu_source(csdev) && !cpu_online(csdev->cpu))
> +		return -ENODEV;
> +
>  	return 0;
>  }
>
>
> --
> 2.34.1
>

--
Sincerely,
Yeoreum Yun
