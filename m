Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2072.outbound.protection.outlook.com [40.107.247.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645DC267714;
	Mon, 19 May 2025 08:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.72
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747642472; cv=fail; b=k+yigGqtQDTmR39bGN9+KGrdfzS85Pg0/9F66+7jEFI7u/5YTLc94LS2eE3OTFnWLYCBos9rVwYM8xC9riGWke/sTQe7eWPTp2S48iqRP8FZPc1AuljwigMODom3uy06DHTJPMb2UQSOUrrXcy3D3KBymxjL16PHEk0gVX+OhdY=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747642472; c=relaxed/simple;
	bh=6Nkf+qFRAPo6qmg21LXLhTsqOnaDkiVskUkenEMju/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AGwxRh8pITk1gbU1qKz2wgksYsvpbFpvQiv7JA8n3b8gpjS1vrnWfU2sM70xa3tqCEQCHKh8ytXuJdkMZ5QEYY2UnpoisK4xFjlj2uTg45c3YExNaDmlk7H6FnXHwVfewS94C6jDCMdRzgKaUJNJqsG2Kuy+YK0TrMsYhnAtQYo=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=WyZZYbRf; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=WyZZYbRf; arc=fail smtp.client-ip=40.107.247.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="WyZZYbRf";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="WyZZYbRf"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=IeioVlXDq429GEB1bx8/rD8FY/KlmM8oBGbF305D7DtQzOZlPNlPaojIkwNJPoc8gs+kKYRvINJTNJqmNAR6WdfEPaaB7gFjaRxSDrE9D3QeXb5JSZNqXd4tPG6gEYibbT6CW8kK+tiGLwpsYMmAB7E8FftwOYGG9aA+kTufSV48Fba77jsvZhYYTMGpOXu3cD233iNZEF9/Mnv1QNIehERPNhyMGITM1F6keEYZPau2exYhZz4oHeKpJ+ZUKE+1oGOBXGjxC5uiz6fKBYnwIhNCyerkWS2LdE6zOle1RIxbtoizZDhkBENZ4PI5DqMVp5q++bBWqH29/2JEH9sYgQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pH9tKMcABzHaa3SNKC93aUI8lFN4jygoI1/h+SaAb20=;
 b=WgezCSBoliB1D7cc9k2QYVgGlnB99iyrkWhwGsTlgqQJ4eeqQtbIS6V6imKutCnV7zDe6R8FY+2IzhM3u3jZMygNMkPTbOWEPHz3pNFiXFy/bmSG2IBzUF7d+iouruTGoB/AlgkBjQxIKoh3RH3hvDCb/+3DDTHy1A9i7XdkCLiPzSS7p5dTgYxeEflranUPROqrFaOkRwxSlKHu2/+7w7wmbZWzp0QrmBl3ODeNT15gCjGop2UACy84XEIUA4vDgoxqk5wpoHubvdbmsL7cZX6Bp/TL55dtVO3DQKZQjXWKWYH+kLFt4n5ZeH6rsaC8o6tlU3bUwFTkx31AOTE6aA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=google.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pH9tKMcABzHaa3SNKC93aUI8lFN4jygoI1/h+SaAb20=;
 b=WyZZYbRf0HckjlxY/taWE0u3+b0WPb001tcQ6UDOVfQvwEGghdeVeM1feXiiD3+6jWN4ko+JMc7F1nriIquGDNt8yDjfbtag3ZO5eWfzZld60vniXNtDRn/MhKNJGlrtspG+n94SVRW4wZJrQg6F4CGTq65hfFFZFUBjFCt8xSI=
Received: from DU6P191CA0039.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::13)
 by AS1PR08MB7513.eurprd08.prod.outlook.com (2603:10a6:20b:480::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Mon, 19 May
 2025 08:14:24 +0000
Received: from DU2PEPF00028D10.eurprd03.prod.outlook.com
 (2603:10a6:10:53f:cafe::e6) by DU6P191CA0039.outlook.office365.com
 (2603:10a6:10:53f::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Mon,
 19 May 2025 08:14:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D10.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Mon, 19 May 2025 08:14:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Macoeg4hsWlIB5xfs/0K7yDL4elG2a0SEVdZM5JqbfoCqWbJ6C6hSRJfi2vQonNSrFEbBjKQrnz0iGiMGgnrpsijG9MkZJ9aWiZrmNAUjQzkAYg3fBSJpwo2WigJRqU1KP9YWD4Pv22lM7FBkEH4A47gumhSaGSakngSI2Ust2JMeAa12wkG6XtrmrjtSwJ4kl6Y8KNbNXlZLnsdYLGRz75W/qUB1JEDduUY/FVXbJVyXSNxJCuSAZs2jKT3CJWTWcvgotJFmY+JB9zJEvxRUF314EnISldym6zA7DMZR2pjrPbD6ZphjnIa0mKQSmY9tim44ea1gdQ9vE7h+Qursw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pH9tKMcABzHaa3SNKC93aUI8lFN4jygoI1/h+SaAb20=;
 b=bWA1nPM8u3j2SmThXHBhUWsfmoXzT4rw6KXKtChO/rJ7auUZu9TqCgvyM0BR0bSzw4ggAmGGDj1oh3mt22Ujw31E/XiOeI3q7t9/wOkQ3MRk9PuKjhwk2DZqEThX4GPkHLuTi1OiwNQfDunOgCncOemtF8K69l6Lmn2ELIm6MCggKnZnC5XpZ/PYbTN5teFJfzJM5kq0hRNQ3smmY7VbMtBr+57vOmCUUbBWkVqlxeBaCrrqNDswg+bwF7lxsoqqNUwGv3jN8K5oW1OLmNmZ3Azxb71t/dHzWRzJCiyYO5fTr+NjxJFJk4cJ/fCcBa5xzYLbJATutyIPpv+e9JAUgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pH9tKMcABzHaa3SNKC93aUI8lFN4jygoI1/h+SaAb20=;
 b=WyZZYbRf0HckjlxY/taWE0u3+b0WPb001tcQ6UDOVfQvwEGghdeVeM1feXiiD3+6jWN4ko+JMc7F1nriIquGDNt8yDjfbtag3ZO5eWfzZld60vniXNtDRn/MhKNJGlrtspG+n94SVRW4wZJrQg6F4CGTq65hfFFZFUBjFCt8xSI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by PAXPR08MB6414.eurprd08.prod.outlook.com
 (2603:10a6:102:12e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 19 May
 2025 08:13:48 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 08:13:48 +0000
Date: Mon, 19 May 2025 09:13:45 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	broonie@kernel.org, anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, shmeerali.kolothum.thodi@huawei.com,
	james.morse@arm.com, mark.rutland@arm.com, huangxiaojia2@huawei.com,
	akpm@linux-foundation.org, surenb@google.com, robin.murphy@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 0/6] support FEAT_MTE_TAGGED_FAR feature
Message-ID: <aCroOfZaM61jH/Te@e129823.arm.com>
References: <20250507095757.1663684-1-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507095757.1663684-1-yeoreum.yun@arm.com>
X-ClientProxiedBy: LO2P265CA0147.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::15) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|PAXPR08MB6414:EE_|DU2PEPF00028D10:EE_|AS1PR08MB7513:EE_
X-MS-Office365-Filtering-Correlation-Id: f8a4b811-3a17-4cbb-7c33-08dd96ad299f
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?9OdZyo9Bnidpvh3hAkxeiOjLe8/KKj7I/vPn42EVVg+NiVao1o+Hzs14BFWN?=
 =?us-ascii?Q?kd7SrcmVZ3ShDwdjQcbXbZo46bhqMKQ/8yNEj7Hh52WMA8fiOg0JIHvdBM+j?=
 =?us-ascii?Q?3scURyeyId8MPIWqa20Odl7931yx21HEJsURc+jQNYP3r09FRGZL415sMj+p?=
 =?us-ascii?Q?/l1v8W3iUyBmmVPawreRl77cHozj7D+bWOaHHXoyKYPeQ8Qo7lyUZNqeMC00?=
 =?us-ascii?Q?YAPIf+L9DHZ1RzmNuRHXvMsYtqq4GqSnsuEJq2+w3NPzxj0sP1wh06KaTyJW?=
 =?us-ascii?Q?QffHdCCs7Cd1Rx9rag9roWEieWPkgbjSvZN5dyyqJ1vPgGyCjzy8W2XVoQ/D?=
 =?us-ascii?Q?YRWs2rnll6/2L/k07E0rL+pUbugjLmw+DFWL5XVJDJC+ARdUvH/KG+fTkhYp?=
 =?us-ascii?Q?lxHcGcOedkxNFrwIjFcRbsRqO3anUkV2fdxKWJ+8AhCD/oqvwZayauQxl56x?=
 =?us-ascii?Q?8Ut+C7nyECN1GKamiHQk7msrog8E3W3Fhb0epjSiy39RWMhBIS0o52m3oix4?=
 =?us-ascii?Q?8LDhSgIZi55blxO9NC1tuiBoOIm7e298K5caFxE2vERxPr/rpTkwkaClnxan?=
 =?us-ascii?Q?+gHGaSm8ykIDAM1qJyCogBhtPlEZcl7p2fnMrbItud0UQf7WlyJRF4D6mQ36?=
 =?us-ascii?Q?u5pNd9mrk3RWB4UnmK2kQZ2cuEIaezANyeqACtRDsQMz7RrN5LMKE6M1blYL?=
 =?us-ascii?Q?XXmjJov7MxePu/n1jDJbkcY8hQZ34ujtUnGcyU7lIbOcYSOPnlLZN7rIjZdk?=
 =?us-ascii?Q?lyJitUs2ZVXHGXbUIbPtLoOG59wE2zbJEetBGMdyLa3O00jmHBMR3J2W0SW5?=
 =?us-ascii?Q?jiI+EtiQ5MSrE9uYnX9q39sduJqZvnxQxNrvyEMFKRkoNuo1HQpt0rv9Rtnf?=
 =?us-ascii?Q?bpbgvzov5XXxyvBZRfGwA9vLjMuPUPjWY8qT1o71h6X25tRbLMPJHFaZCjNN?=
 =?us-ascii?Q?rRGh65UO5T6rHhtdeFfXQcmFg41dS8oySBERFCMhzIaFBRNAgGVDtPVym/8O?=
 =?us-ascii?Q?MPvI84gXQefXOP/IXyOmt6ipT0KaUxqe9+O1zspnJeAiLSXYPB/jsawzFPkT?=
 =?us-ascii?Q?siYKfnOBEVlMk7gvygOHxcaKQS88X3EDvkW7o7T1/B1Vp/6ySU/QkqDRIBay?=
 =?us-ascii?Q?BdV1I3O+YBEXb4eL6QDux9K1AXS0rCYR2NtG8S/xLWvdPLXlIDN5Mm/v7y4s?=
 =?us-ascii?Q?pOqSMROiHcP7DIjZMsNEZElIPJHwUjyhST93BRVV/KZqFzjDoS0m0lkxVzem?=
 =?us-ascii?Q?8Wu4E8Mdjn3Fp+1EqFzwZNS4w/siNcyzJcJTVmNT+Rqj7TX/05rBWYDrgpYU?=
 =?us-ascii?Q?oAKRjWjy7Fb+VOzADJ5IWne6XxZlNgNvA4bkAVD/w9p6JcmJtDosWvEnmP1S?=
 =?us-ascii?Q?8O7P47ecQCU8QKEEk9KJAe0f5uMMVgodmlKg944pf5EYpJTg00gIuZW52Uy9?=
 =?us-ascii?Q?dInCuB2GiMj9Wkm90IuijkBLFZ1CpX/otzhl4vWRQ7uDbdajY3oh/i9kpQt8?=
 =?us-ascii?Q?KAXzKNTFqWhIm34=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6414
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D10.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fc6a2cc8-76b0-40a4-71e7-08dd96ad14cc
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|14060799003|35042699022|7416014|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?i1Lc97QYKucP1twekYnzwk8af0Fq2VmOCJoNxH/Pk6uqrq2vPCdWnFgLFjoQ?=
 =?us-ascii?Q?9PTBDwWfwcBIjUv4Pbpu4c3M6fQIvP+RYoAsM5xQblHxoM80K2u4s9XfjS84?=
 =?us-ascii?Q?LdyCP+Kpptua/lbwayybUd9V2NLrKlxo6gauqMLAZGMfSvmI21DtQ/3TzErm?=
 =?us-ascii?Q?lMau8irTJ76VUip/hJOXna1MkdInK66/KQt5lu0tpDg4aAnvnNU9arNoyn3n?=
 =?us-ascii?Q?jKLbKDWnGAudTCT5H7UfsZwhBcHSpj+UqCJPyaeCKWse8+LI+nMDk/+sYJyz?=
 =?us-ascii?Q?8eNl8LCLNwbOEyt8h1HxEeBmuwkV59jXEQ0rYLEZ42LJSMZJ6UUDlwn0erTR?=
 =?us-ascii?Q?Z/dbtME1AYzU9pslea8D3zCnk/kTrFqxn7tpc7hVtVmRuTyaK9cAU66OryMq?=
 =?us-ascii?Q?FAZgbj+PgvsrTER3w7VljAsyBE0ex/ydD2+uuxFf3tAednj+5r+NtJgyMvuB?=
 =?us-ascii?Q?Cb1UjMIDNpyq1XLnKf3uwtgzAcRcv3xXQD7fe3N+xITo1xVR2R5WLC3Dkwnx?=
 =?us-ascii?Q?J/L0bOjwn4O8/1G/d4s+AbD2cDXIWVSHFmFeXonQqCoFiS01TcdRguuyFAdq?=
 =?us-ascii?Q?7bpR/HI9YuWtpReveVvXAkcaP4uvnQT56C+Q3MVnYugHX2PzSgtP4DB6cP6e?=
 =?us-ascii?Q?2zRQa9HOkxnwX5OiZxz1n1UWAZrnCeYsrIJeyWKEO0h5hI0fECF2kIYRSl8p?=
 =?us-ascii?Q?Prh2I5ifLhA5wgOKdoFMKa4EJ/JpNXeACVX1A0RB3izTQ/o0TGOYHJ67ocLA?=
 =?us-ascii?Q?Ic6KiL4bbQzcGcmOaEmHbKBNTIqiiZm/5y87R76GLdL7XqIHsSJ8TkZuFCV0?=
 =?us-ascii?Q?XX4Q27cbIodd15s2FaemfhcZX80otp3ufV8GNzRmVLIdxHtiD4/X4abPy3Q5?=
 =?us-ascii?Q?M9SE9Lbjjw3YxO7AgMV1h7oLbUtFwrENQiSENNzm/Jf83LLd1Z/8FXbSnMSe?=
 =?us-ascii?Q?2iAtp9LFU5/jOUzaguKgMeLpXHDbOaNASOat2nRug7iMKzp0cviX629maGiM?=
 =?us-ascii?Q?7wxSIN/2K7AKPOidgj1y7OGu7w2BdDIkkBBwjuufAZtR75bL6JjM5zqZ6HV4?=
 =?us-ascii?Q?RnsUxGgJripxNay0iBXCnvSNo3rRlQvEVDpAU6Bp3y8xlTfrm10cq9UbMF13?=
 =?us-ascii?Q?jneGnw20VXHLw2JVgfrcqrvHxivA5auYMZRgSH9/Vi+abQldYSL4ydx3nuF5?=
 =?us-ascii?Q?014BIbVIM3lXTvwv0BRCrilws0Nzq5iADeFHsW0lYsJMKop5NK+LeJEIz/P/?=
 =?us-ascii?Q?jhsJzu/wYU93eJqnHmgPUXXg97i1eslSfSOGgbsUkGrUNeQaLA5Yzm0WdYA8?=
 =?us-ascii?Q?sE67n5Jg2RzxGlDWEJpMUyaa8666iKL5AOqkpu/7f0FHRKon+Fw3Bz8NJXq8?=
 =?us-ascii?Q?UEO3V4Kb26Lk4FYcT4VLtX3gRGwBwUyU/mR68Cb+aApYtvAy8NNWbl7m3qSF?=
 =?us-ascii?Q?6D8TKRE0Q3u7+li3zuqWwDipTzJoPcDOZmxUuTuRSMdNJYgUrvbcSCBVB0cD?=
 =?us-ascii?Q?zZw8/SEXMMu5+35x8txcoFsySfm6c3CWfm/HoUoUxaBZD4N46Pgn72FDRb1h?=
 =?us-ascii?Q?PQGhJGi8UbkU8VbdOtY=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(14060799003)(35042699022)(7416014)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 08:14:22.7209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8a4b811-3a17-4cbb-7c33-08dd96ad299f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D10.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7513

Gentle ping inf case of forgotten.

> The FEAT_MTE_TAGGED_FAR feature provides support for
> reporting all non-address bits during a synchronous MTE tag check fault.
>
> This patchset extends the reporting tag to include
> not only the memory tag (logical tag) but also the address tag via
> si_addr when FEAT_MTE_TAGGED_FAR feature is supported.
>
> Patch Sequences
> ================
>
> Patch #1 adds cpufeature FEAT_MTE_TAGGED_FAR
>
> Patch #2 adds MTE_FAR hwcaps and export address tag when it supports
>
> Patch #3 adds mtefar hwcap test
>
> Patch #4 prepares to add mtefar testcase
>
> Patch #5 refactor check_mmap_option with loop to add mtefar testcase
>
> Patch #6 adds mtefar test cases corresponding to
> each testcase of check_mmap_options
>
> Patch History
> ================
> v3 to v4:
>   - fix hwcap string for FEAT_MTE_TAGGED_FAR
>   - split cpufeature and hwcap modification and merge hwcap's
>     modification with exporting address tag patch
>   - add mtefar testcase on check_mmap_options
>   - https://lore.kernel.org/all/20250410074721.947380-1-yeoreum.yun@arm.com/
>
> v2 to v3:
>   - Rebase to 6.15-rc1
>   - https://lore.kernel.org/all/20250403172758.67106-1-yeoreum.yun@arm.com/
>
> v1 to v2:
>   - add hwcap test for MTE_FAR feature.
>   - add MTE_FAR doc into elf_hwcap.rst
>   - https://lore.kernel.org/all/20250403142707.26397-1-yeoreum.yun@arm.com/
>
>
> Yeoreum Yun (6):
>   arm64/cpufeature: add FEAT_MTE_TAGGED_FAR feature
>   arm64: report address tag when FEAT_MTE_TAGGED_FAR is supported
>   tools/kselftest: add MTE_FAR hwcap test
>   kselftest/arm64/mte: preparation for mtefar test
>   kselftest/arm64/mte: refactor check_mmap_option test
>   kselftest/arm64/mte: add mtefar test on check_mmap_option
>
>  Documentation/arch/arm64/elf_hwcaps.rst       |   3 +
>  Documentation/arch/arm64/tagged-pointers.rst  |  11 +-
>  arch/arm64/include/asm/hwcap.h                |   1 +
>  arch/arm64/include/uapi/asm/hwcap.h           |   1 +
>  arch/arm64/kernel/cpufeature.c                |   9 +
>  arch/arm64/kernel/cpuinfo.c                   |   1 +
>  arch/arm64/mm/fault.c                         |   7 +-
>  arch/arm64/tools/cpucaps                      |   1 +
>  tools/testing/selftests/arm64/abi/hwcap.c     |   6 +
>  .../selftests/arm64/mte/check_buffer_fill.c   |   2 +-
>  .../selftests/arm64/mte/check_child_memory.c  |   4 +-
>  .../arm64/mte/check_hugetlb_options.c         |   4 +-
>  .../selftests/arm64/mte/check_ksm_options.c   |   4 +-
>  .../selftests/arm64/mte/check_mmap_options.c  | 244 +++++++++++++-----
>  .../arm64/mte/check_tags_inclusion.c          |   2 +-
>  .../selftests/arm64/mte/check_user_mem.c      |   2 +-
>  .../selftests/arm64/mte/mte_common_util.c     |  70 ++++-
>  .../selftests/arm64/mte/mte_common_util.h     |   8 +-
>  tools/testing/selftests/arm64/mte/mte_def.h   |   8 +
>  19 files changed, 291 insertions(+), 97 deletions(-)
>
> --
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
>

--
Sincerely,
Yeoreum Yun
