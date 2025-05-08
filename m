Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2062.outbound.protection.outlook.com [40.107.241.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5404519882B
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 13:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.62
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746711759; cv=fail; b=CDKXiKtMADgOs0BERknbHtTQ5Aaa4UBBKDoVS5xtZwkxMtneNvy/CKJDJAqQMkQID27PWT4s/Mm1nsxfcs5Lxnd/ZJ43tBZul4c+m0hYrvpK1QbtM3zrzbXUVZeCu0Bw+AkLWms9MMTp+rQiLWesHOIcRccnl83dA45dL3A1snk=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746711759; c=relaxed/simple;
	bh=3Ldzle40GQ7pta7bd/iqy3EWkZPbluTxLnKw1+nEJCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RW5gNF3VpkDnRKzLUeAoA5IYp9rU3VaXG/GHQxFS8pN5nEGAzzwPrvbTbZvf8u+1dOA1tbv9SrNZQCmjD75fepdZ1Thhc8BIZw28o6xqMn5jpJswDkSq/jzYjTEBPQ3M2LtOUP7R3anOx2vfurFgiFz+Tz3pnO6IZYbczzOqjK8=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=UJTwEH95; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=UJTwEH95; arc=fail smtp.client-ip=40.107.241.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="UJTwEH95";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="UJTwEH95"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qv4l+4hMHj3G87nG4jCFGhbw58HQANV/7CONuEGSvyPb2ATnX9GlDcxn5tiwKbtfh1CpvaM+IV5OekXtsGSJRU2CTG5zyl+fIrAWb/5yjKdv0WexSVB4wSovlsR/POvEygKhxLsLAxioDYF+9B/ZHgq3z/Gdt1cRqqfx0LqU5u+hw9P+iCQtIJamwK7jzWaPY17DBVnfssuZH969kcs0G6IJFVL55rahWlHMx+dl6Fze8qcivPnfcaD/3VARw/vWNpFfuzJIWZ9tiN7OXMmKR8wWp3+y7ULqwYeSRhoRXoUw1FCZ0iBrImCGzt2FGKW5mwOl0oX8dd3M7IeyObUcYg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ls1vpzbITyev0joTDzIn18L5+nikjREZyvOTLrAQkF8=;
 b=fRLs+OcCdBNa3rFGJhvw+AmBpghMFGPumB9h1vzf/D4QdfhaMyWflOLJqZcj36MPJG4cdFp2hoqJpXhPtk8jSZzXjKwEcDIj0H2BhF2ooIVUdjT1ln3z/U9kNgYuo851VXsqwJoIyaJnlWYtHjCN6Es93qv/udNR8FlK2pxj8qks+rGl95/HqfyDVqBzfDZeTEuR4A8/neK1igpTdQvggMaRcLYCmxklT2tvo0BpnEQ237++Rq3dUlODjYbA8VlmX+G+235P3zB6/pnNd1Mg0RcK3tUgqBIJaed0t/dK1VaKMirZpFCJa0/3YcKTblwxJ9g2iMs4uMRd1JBtOZ28Fw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=google.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ls1vpzbITyev0joTDzIn18L5+nikjREZyvOTLrAQkF8=;
 b=UJTwEH95AX+C+DLAZoAcY/aRFzdpzZnzJVKA5YqeM80Bz//f93wraojnInaNo0SAQMtjCUKhPZLO49Cl8TmLs2UNd4yqq6M8x/VpDSloELR6D+LvgUQTZybR/hyY6rtT3UiE0jsNTB4QCZ5oZ2T/ltsfaJa7esPEJJWXTwKX/G4=
Received: from DU2P251CA0011.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::6) by
 DU0PR08MB8448.eurprd08.prod.outlook.com (2603:10a6:10:404::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.26; Thu, 8 May 2025 13:42:31 +0000
Received: from DU6PEPF0000B61B.eurprd02.prod.outlook.com
 (2603:10a6:10:230:cafe::ce) by DU2P251CA0011.outlook.office365.com
 (2603:10a6:10:230::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.21 via Frontend Transport; Thu,
 8 May 2025 13:42:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B61B.mail.protection.outlook.com (10.167.8.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Thu, 8 May 2025 13:42:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PF7xd/SLPEs2e+AsmS/Fxpj38J9kVsl2dJ+AqwmEoUWJAIOQkHXY+TdhkGwUM+xIB/S7ImAECSoyWUpFjYkvdzGaXHn+UxMkoWtKUZEc/xKq3MmHQ22bGSjPET1Zj3J+pEBUVvsSFba1Dzg9KoTjs9DjjsRoKHVfRXoVzBeZXbhBZMRIb/zuMKCrBQ3ABxN/WKajkznmxiHVxmBj0dmK7jjk+Dt7omdAl1nxw5ZXDXZbh5AeB0ye2BuSpGnD1AJUYteafSgSOmraL7M7wIIvn8sk4Plhx/Q1Dl54ZRCTxdbfb5pVp62sMduBiki4DGIbE9mswCtVfHvryLZQmw/U1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ls1vpzbITyev0joTDzIn18L5+nikjREZyvOTLrAQkF8=;
 b=NWwcKk1Pgd2ljlyMzOPalTXLwCXuh6CKyWq79DhjAPUHj/0qBbz95KM1KbNqw10jj9LfBqFfzcnSNuyYFFh8JJCN3rYauYCBqKteYOSqmE9Jkqu+E6C2TUiqI3gPiJmyfxs2xb91gT+PVnMxprVzuJ7mWdwxwsXkgFts/J9OgKbVAffFI0aUr7Ju07341J1+a/wjtZ6L9beeiHywaRp6Bn8zE74L/nO0GNW62udyZP+WMRBetb7t2O+SGT9btFqbVg3aD5XA22K5rHwgnmlIgcOXPF3iRr9MdLPsNT9w+xeQGSPTEpL/SrO8S1EGAESrt6EodpoJYeF3R1s/YMQ51A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ls1vpzbITyev0joTDzIn18L5+nikjREZyvOTLrAQkF8=;
 b=UJTwEH95AX+C+DLAZoAcY/aRFzdpzZnzJVKA5YqeM80Bz//f93wraojnInaNo0SAQMtjCUKhPZLO49Cl8TmLs2UNd4yqq6M8x/VpDSloELR6D+LvgUQTZybR/hyY6rtT3UiE0jsNTB4QCZ5oZ2T/ltsfaJa7esPEJJWXTwKX/G4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by VE1PR08MB5615.eurprd08.prod.outlook.com
 (2603:10a6:800:1b3::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Thu, 8 May
 2025 13:41:58 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%4]) with mapi id 15.20.8699.024; Thu, 8 May 2025
 13:41:58 +0000
Date: Thu, 8 May 2025 14:41:55 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v2 3/3] arm64/boot: Disallow BSS exports to startup code
Message-ID: <aBy0o+AvFkMm+5ss@e129823.arm.com>
References: <20250508114328.2460610-5-ardb+git@google.com>
 <20250508114328.2460610-8-ardb+git@google.com>
 <aByy1CFUieJQeofl@e129823.arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aByy1CFUieJQeofl@e129823.arm.com>
X-ClientProxiedBy: LO2P265CA0381.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::33) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|VE1PR08MB5615:EE_|DU6PEPF0000B61B:EE_|DU0PR08MB8448:EE_
X-MS-Office365-Filtering-Correlation-Id: 127f90da-344b-42ec-6464-08dd8e362dc2
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?7OJW7hqzbXuIpbolw2t8xi4Hldq+HfBS64JqsoJuxZNormcibMrXHfIACRQ3?=
 =?us-ascii?Q?87KZBrhA6xiAXOoboJizvKqLgoq2OT5FdVPQtLNnzq3HAKSCyYkXy8Fpwd68?=
 =?us-ascii?Q?G+BbAHZIHfgCsMpL399P1TNIFdigHYbQKzG/fz18zSZoZJ+TQyEuI/jG6JYr?=
 =?us-ascii?Q?VAih0n/PfymGr8kDmY2XOdAXQafwWxsB3NYG+UioKyPs363euCvJymdQP+kT?=
 =?us-ascii?Q?F40EviOaJFkA603PhHdnJ5hZonerId0VGB51YogdQHA+0Ywn1zjTpAhq9Cvp?=
 =?us-ascii?Q?2C2LSp/mjvQs0S/GieyeTWgYQ8atf9HCOSMoK3CzmSfe1FQiZZU8XUkBYT6m?=
 =?us-ascii?Q?Yz3K2SMgRD6+b1cE89qrE6gDUFJcjhq/HxkoPbZYSgXENTNks029ey3aKh06?=
 =?us-ascii?Q?yYdMzQyF2SGT6uKfYIXjgt0YmNPTZ8HkSWD+CxOxtc2MjzRLaaItzfEAhgsH?=
 =?us-ascii?Q?mnq1/viHgcynoy0EmLj+RJxiVkbQiCiTq9IOlVNM4cW3hpqP0PEJsp8OWceS?=
 =?us-ascii?Q?nE4wlsHwAXAe3SOVyFuXVvmGmx94wuj0tvnhmBdvw+64XjR4ChpfqYeXYnLr?=
 =?us-ascii?Q?cluzp9B+jHs2/fw9JwBSUlUNyY9bebUU2lT6xMoMIu2kO8Zh8k1GTQmB5CGo?=
 =?us-ascii?Q?O2ssl7B4udy/Aey4ypXZKXZ8phKiVY/VMD+N41zl8w/bmTzRts0ABm6Lpx+o?=
 =?us-ascii?Q?R8nWwws5KtiVrtZ7AXKoC2JFsj9HrLRkBmO226clHeO/IzfvvGQ2ZNC7qiC2?=
 =?us-ascii?Q?Ck890Nj1f7ooftTRJ/6OBmBeWBdPno1vJMxLyPQEvfP/HezWXHjjGUvLIPGL?=
 =?us-ascii?Q?mUBQ0IIfz3TF0dTxhR5onytpu0zV3e3g4lYzZm7Fq62Djc25ol4XEGkO9jIE?=
 =?us-ascii?Q?fUkTbNhU9Lt5w1NuXzmp/ZX4tO7Z7oSd//cPT7TdSwgGs1Clf51H+op5zUxd?=
 =?us-ascii?Q?tU5xerh5P17EZVjOoVjXBUqlAnAWWYZOPgTeThJIydoexVZl64DpFS4aEpeq?=
 =?us-ascii?Q?U3ZNWddk92tN8dyrZn/Ygh8dgiujV7OHNlddjIvMP5irTLsmZORHcqW8fYWE?=
 =?us-ascii?Q?smIkKgSBMDTezyctEUeIZmnBDSY9xb7jjax6NGpT4lMwSSFjhsvVAceocUyI?=
 =?us-ascii?Q?i+Re8AGVqBwCCz3qmefvdBZPh4mba6iC2YVsd7+e1cIOgNy9ULtj3gWPyGGK?=
 =?us-ascii?Q?6VkItc6GGmCQb60ZdSOq6eWi2SuJVaQwHSQq9TetNVOyBJ1kOdLVy/FRJF+D?=
 =?us-ascii?Q?/QZDdHu5ZuPD6gXpnqLmT5ewkqTXwJSe579YhgnT407Tf0jRwWTYHeNyDrcW?=
 =?us-ascii?Q?CJUIgBU7w21oZWX58P/QP2crP3ZPhgKV3e1ywFLXYfpet3t9L4DfYRN5eGQ6?=
 =?us-ascii?Q?1D3iVMkvv/ttE5aVqrI96KngxZKZp1uYbk/3QgGlGbcZKldikeh0Zl7NKw2w?=
 =?us-ascii?Q?yDpXkJ1MqUA=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5615
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	70119042-a905-48b2-755a-08dd8e361a78
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|35042699022|14060799003|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?V8OoHXtnzoh8QgAxIRDBkI6eG35R3xF15Lu3yo1ZhLqkYkBdRJH2fIeq+QPy?=
 =?us-ascii?Q?XepTAEPbV8qj3BpvfYk1Vb2XyDere6TSM0AD5pwRno4jXiqA5bvcvYCTybhL?=
 =?us-ascii?Q?x5erTKoCCwD2ppXXR09tmmdzDpmaNGkKY3cwg+n00i+YQaNCjrL3ZgsGYi1P?=
 =?us-ascii?Q?GHozth9I0Q4/xKF7mIAWEZNL7BFAwG0o0X4bnO08uN409vsi4sGEfuqM9bMt?=
 =?us-ascii?Q?PKXtZWYP89O27MGbiqaqTPDYDR4NU0DWCjwsvfMpW/jUlT3aMSeUA+iBTCUv?=
 =?us-ascii?Q?77VTYZnQpU1UR83Vi0LB38g74yHUlW3UBGhcuU/pyFxX5O3p3WHKikn2cXzM?=
 =?us-ascii?Q?tSAcfbEA2tqMJt1tR7tfoCkNh//LjbBfB08xsDN/i1QV+nT2+OM6XNp+6jgJ?=
 =?us-ascii?Q?yj7VW+1kZy8+GgkdcMhkGPTs2sbyU+zdoxKgb+FmtYrBniJDBEHFHXExUcCv?=
 =?us-ascii?Q?iHbLEcdAoL5BTIs31qyI173rLRhO3pmlgqc1L/xQZY0HPUUEcvbUhwiqhAO/?=
 =?us-ascii?Q?Mso8AAajyBGqGZrcjXox8lXWy0Dm64EYtZjWHPQ63+fe6h4jpoE8es2rt/p1?=
 =?us-ascii?Q?Uwqv4KDbsgY0cNiv6uNdRCmSTlYSfCO2n5+0qf1AZVOZoeBHe5RftWx6wCUP?=
 =?us-ascii?Q?EsPWpCe8Gmy03Uliqqpw+8rtyEhs7Yb63LQIoyQ5Zmep9ie5avWBWTvjBJgp?=
 =?us-ascii?Q?LD3w4EMcRQbnNp8HGqaHUYqklXrSewSL+/g6+5MQE2qAT2+qO9JB8FotqtSi?=
 =?us-ascii?Q?8+hqPl1TL4ZB4OAej1YUJmc+9eB7KsadEox9BGVI8CYOZ99jl17uE1KHjG8A?=
 =?us-ascii?Q?o2rLPiW+2P4tt9fG0SwSwSnDvxZOCXXxQyVCkNESHv3qrlGxgl7uUXtKZ54n?=
 =?us-ascii?Q?Wq4lL8Q5kmlBgsrd6a0nFIbacqPKfDdSXq1PyAPhIRn3b53LNah6lHh1lR3/?=
 =?us-ascii?Q?1iYhIySf9VjHYaCrgeBKedIYV2o0WTlEFOd5e5F32NOvW+HuJKHFDyZaHAZT?=
 =?us-ascii?Q?gVXzFs43ADQcitBzj47sx2pwuWWbCJaHnhvubg8qAy8LWww3Pr4IzpFZ/Ct0?=
 =?us-ascii?Q?ESyH/67B5LgLyYf4rcB64N9ebYztvRCEF1UHS9TRwFkngT+f2xVprO38qJUW?=
 =?us-ascii?Q?9CdCgeW5negvl1fXDFwDUQPrPjC06XbIy/KPyfFl7303HtkEfMJ/BZYzeNUG?=
 =?us-ascii?Q?eXczclBMsESKPlKJN13JgQH+E983VwvHVbInqRH7NnhxpuL8n0NgQaWinwrR?=
 =?us-ascii?Q?eleOxgVNMfXN6KuXp3RAToiygFE66Ezi32s7S7QGpSIGl6TxsIQ/gIdnkD+t?=
 =?us-ascii?Q?GZ93/YoxMONO9ElobASN50siti1tofaUaMQoddr4U92a9LxsK8kP9Uo+QGmK?=
 =?us-ascii?Q?/5t5dWl6nNs3vyvI0hKsOSTihKo1chVcKc7xwBdjhFyHgyiq0QiRl337gq47?=
 =?us-ascii?Q?hYoW0/2d1ynJk1e4jNqQw9SIHiwi4V+lig4lt04q/hNSNkimL39KuBfN1Hxs?=
 =?us-ascii?Q?wreK8qcz5f+Xtt9GPHP2LDiloVK9fi8MTMwT?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(35042699022)(14060799003)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 13:42:30.2513
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 127f90da-344b-42ec-6464-08dd8e362dc2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8448

On Thu, May 08, 2025 at 02:34:12PM +0100, Yeoreum Yun wrote:
> Hi Ard,
>
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > BSS might be uninitialized when entering the startup code, so forbid the
> > use by the startup code of any variables that live after __bss_start in
> > the linker map.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  arch/arm64/kernel/image-vars.h  | 62 +++++++++++---------
> >  arch/arm64/kernel/vmlinux.lds.S |  2 +
> >  2 files changed, 35 insertions(+), 29 deletions(-)
> >
> > diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
> > index c3b4c0479d5c..a928e0c0b45a 100644
> > --- a/arch/arm64/kernel/image-vars.h
> > +++ b/arch/arm64/kernel/image-vars.h
> > @@ -10,6 +10,12 @@
> >  #error This file should only be included in vmlinux.lds.S
> >  #endif
> >
> > +#define PI_EXPORT_SYM(sym)		\
> > +	__PI_EXPORT_SYM(sym, __pi_ ## sym, Cannot export BSS symbol sym to startup code)
> > +#define __PI_EXPORT_SYM(sym, pisym, msg)\
> > +	PROVIDE(pisym = sym);		\
> > +	ASSERT((sym - KIMAGE_VADDR) < (__bss_start - KIMAGE_VADDR), #msg)
> > +
> >  PROVIDE(__efistub_primary_entry		= primary_entry);
> >
> >  /*
> > @@ -36,37 +42,35 @@ PROVIDE(__pi___memcpy			= __pi_memcpy);
> >  PROVIDE(__pi___memmove			= __pi_memmove);
> >  PROVIDE(__pi___memset			= __pi_memset);
> >
> > -PROVIDE(__pi_id_aa64isar1_override	= id_aa64isar1_override);
> > -PROVIDE(__pi_id_aa64isar2_override	= id_aa64isar2_override);
> > -PROVIDE(__pi_id_aa64mmfr0_override	= id_aa64mmfr0_override);
> > -PROVIDE(__pi_id_aa64mmfr1_override	= id_aa64mmfr1_override);
> > -PROVIDE(__pi_id_aa64mmfr2_override	= id_aa64mmfr2_override);
> > -PROVIDE(__pi_id_aa64pfr0_override	= id_aa64pfr0_override);
> > -PROVIDE(__pi_id_aa64pfr1_override	= id_aa64pfr1_override);
> > -PROVIDE(__pi_id_aa64smfr0_override	= id_aa64smfr0_override);
> > -PROVIDE(__pi_id_aa64zfr0_override	= id_aa64zfr0_override);
> > -PROVIDE(__pi_arm64_sw_feature_override	= arm64_sw_feature_override);
> > -PROVIDE(__pi_arm64_use_ng_mappings	= arm64_use_ng_mappings);
> > +PI_EXPORT_SYM(id_aa64isar1_override);
> > +PI_EXPORT_SYM(id_aa64isar2_override);
> > +PI_EXPORT_SYM(id_aa64mmfr0_override);
> > +PI_EXPORT_SYM(id_aa64mmfr1_override);
> > +PI_EXPORT_SYM(id_aa64mmfr2_override);
> > +PI_EXPORT_SYM(id_aa64pfr0_override);
> > +PI_EXPORT_SYM(id_aa64pfr1_override);
> > +PI_EXPORT_SYM(id_aa64smfr0_override);
> > +PI_EXPORT_SYM(id_aa64zfr0_override);
> > +PI_EXPORT_SYM(arm64_sw_feature_override);
> > +PI_EXPORT_SYM(arm64_use_ng_mappings);
> >  #ifdef CONFIG_CAVIUM_ERRATUM_27456
> > -PROVIDE(__pi_cavium_erratum_27456_cpus	= cavium_erratum_27456_cpus);
> > -PROVIDE(__pi_is_midr_in_range_list	= is_midr_in_range_list);
> > +PI_EXPORT_SYM(cavium_erratum_27456_cpus);
> > +PI_EXPORT_SYM(is_midr_in_range_list);
>
> small nit:
> Would you rebase this patchset after
> commit 117c3b21d3c7 ("arm64: Rework checks for broken Cavium HW in the PI code")?
> Otherwise, I experience boot failure because of SCS related code:
>
>   ffff80008009fbc0 <is_midr_in_range_list>:
>   ffff80008009fbc0: d503245f   	bti	c
>   ffff80008009fbc4: d503201f   	nop
>   ffff80008009fbc8: d503201f   	nop
>   ffff80008009fbcc: f800865e   	str	x30, [x18], #0x8 ---- (1)
>   ffff80008009fbd0: d503233f   	paciasp
>   ...
>
> At pi phase, platform register initialized properly...
> So it makes panic on (1).

Doesn't initialize properly...
Sorry for typo.


>
> Thanks!
>
>
> >  #endif
> > -PROVIDE(__pi__ctype			= _ctype);
> > -PROVIDE(__pi_memstart_offset_seed	= memstart_offset_seed);
> > -
> > -PROVIDE(__pi_swapper_pg_dir		= swapper_pg_dir);
> > -
> > -PROVIDE(__pi__text			= _text);
> > -PROVIDE(__pi__stext               	= _stext);
> > -PROVIDE(__pi__etext               	= _etext);
> > -PROVIDE(__pi___start_rodata       	= __start_rodata);
> > -PROVIDE(__pi___inittext_begin     	= __inittext_begin);
> > -PROVIDE(__pi___inittext_end       	= __inittext_end);
> > -PROVIDE(__pi___initdata_begin     	= __initdata_begin);
> > -PROVIDE(__pi___initdata_end       	= __initdata_end);
> > -PROVIDE(__pi__data                	= _data);
> > -PROVIDE(__pi___bss_start		= __bss_start);
> > -PROVIDE(__pi__end			= _end);
> > +PI_EXPORT_SYM(_ctype);
> > +PI_EXPORT_SYM(memstart_offset_seed);
> > +
> > +PI_EXPORT_SYM(swapper_pg_dir);
> > +
> > +PI_EXPORT_SYM(_text);
> > +PI_EXPORT_SYM(_stext);
> > +PI_EXPORT_SYM(_etext);
> > +PI_EXPORT_SYM(__start_rodata);
> > +PI_EXPORT_SYM(__inittext_begin);
> > +PI_EXPORT_SYM(__inittext_end);
> > +PI_EXPORT_SYM(__initdata_begin);
> > +PI_EXPORT_SYM(__initdata_end);
> > +PI_EXPORT_SYM(_data);
> >
> >  #ifdef CONFIG_KVM
> >
> > diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
> > index 466544c47dca..e4a525a865c1 100644
> > --- a/arch/arm64/kernel/vmlinux.lds.S
> > +++ b/arch/arm64/kernel/vmlinux.lds.S
> > @@ -319,6 +319,7 @@ SECTIONS
> >
> >  	/* start of zero-init region */
> >  	BSS_SECTION(SBSS_ALIGN, 0, 0)
> > +	__pi___bss_start = __bss_start;
> >
> >  	. = ALIGN(PAGE_SIZE);
> >  	__pi_init_pg_dir = .;
> > @@ -332,6 +333,7 @@ SECTIONS
> >  	. = ALIGN(SEGMENT_ALIGN);
> >  	__pecoff_data_size = ABSOLUTE(. - __initdata_begin);
> >  	_end = .;
> > +	__pi__end = .;
> >
> >  	STABS_DEBUG
> >  	DWARF_DEBUG
> > --
> > 2.49.0.987.g0cc8ee98dc-goog
> >
>
> --
> Sincerely,
> Yeoreum Yun
>

--
Sincerely,
Yeoreum Yun
