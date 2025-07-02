Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011041.outbound.protection.outlook.com [52.101.70.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912DF219A86
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 11:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.41
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751454662; cv=fail; b=sHkqGvQ+hSWFGMmFAjwxgqZUSy+HtPEaqESL2q8omF3dAmptLxIP+bGZOqheRjmh8AbbYQj7OagDSpwySAMVbuZy831DyCgCD7gr2CxXt9PAFj2mVg5v+KdKeCuMC8p2ofhW8BjZ2iBv4X9ikn9ZwJYvyJu4Ce+xF0gp9pEGOGs=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751454662; c=relaxed/simple;
	bh=nBP5EGR2E7T231fpj+peZxqxCr3K5WW9KVA+Yjw0Sj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=P5NcJ0UU3j2tLyAUhj74MU98rgs9iMbimqJgl1NH8n0YDB893km5h43k9cQ3xIAUQS/aD4cw5aT4qcLbAyCPn0KonQJgIp8te8YOTXrg6sAyPbizeqbzZ8Z0rholtXw+y84rAmBL9SW3UQU3hXMsZ7oObVa9eGSGOHJNttOep84=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=rPSYYOeR; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=rPSYYOeR; arc=fail smtp.client-ip=52.101.70.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="rPSYYOeR";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="rPSYYOeR"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=QFsRt7MLBHHMopzZgh+c2XBHcH2egVd6g8Qbq0hC4Z8h1ixEWO2EtHtKKAMv5ZulPEwefkfHIIBk6UtfsK/n5O+u0c5e4oB6D4vN+OX6cCybuIcuU3Q2tAmTx4zeV04fw2dduPe0x3zDzxemCKnCLhRApHyvrJN1HTp3/UajAblbjqPXG4YTW9FfLwA7VXjJklIqWQ+9NkA1PYIwp8+R6OiRPTXWWTLLqYumG6SGepW82qfGBDyuGzj3+0oB7Y+hbtO3Z6cZH6aplnZQ/jiuEOp+5Oe8KzF+gt7K/EdlIz1OPB5DmoU/BfhPLCuZhSm65cMckijbYNjumwlbeFn3sg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y0rnkDe11eqxqlfRWZA3xTXYyt6Gh40oYFctWQUOSrQ=;
 b=l0SKdyf/Owp5YRKxYug2HlIIj8b7V+ZfIyun7mbtt8bY1RvjZ6flrlxdP9vwYAaNXANmt4j4lGCOYXaqbyY0GCAuXXDedi9Xfpygzc3H8oFpaJ793AIl5fpjHH5XERM5nrX40iIjt4+5XtxG7M7Jq7nnLR9xxgDgtivt1G/D1aQJuAd5MHH27ybaYO18rNPPane9XrnQiyk3EVl+aGAmGy5C120wP6gnnGQp6f08HWHTI1IuY6m4rdl48BO6seTwHro9w3tJ1hF92ZJwRC+32MzXBs3kKEfWCmspsKkT2yqTPbDn69GXcRDbGs1sy+DArjYbND6PhOcvQM5jxqxHmg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y0rnkDe11eqxqlfRWZA3xTXYyt6Gh40oYFctWQUOSrQ=;
 b=rPSYYOeRPyaf0YG0Mn7pWm6BJvm22+16F3Gx/j5fPupRL7R+obWhsup1HGzUlTStCFa2c6Vk7dMM7RL1CpzXGhuwMc/IIo7gW++NDDMwllOUNfvPWAFs41f2Ej6QlpahFE50Xti6WcAFmSDBdmEBJXfkp+wRgNqQK7UqK6Vx3/A=
Received: from DUZPR01CA0108.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::23) by DB8PR08MB5498.eurprd08.prod.outlook.com
 (2603:10a6:10:11c::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 11:10:54 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:4bb:cafe::3b) by DUZPR01CA0108.outlook.office365.com
 (2603:10a6:10:4bb::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.21 via Frontend Transport; Wed,
 2 Jul 2025 11:11:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20
 via Frontend Transport; Wed, 2 Jul 2025 11:10:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K6SzH6+VBy2wihGEUfVZ6+/YumoYZX0AWp+stmgBy/gDAmoSWFIbot6eNJE9nuq50FEA6TNce+okOa9D0FcTh9Vzrmy7B7d96MyVjPUAIrB4kG0mCcfXFO9/QPv9wfNSClbJ60AdwNsx/+511SkB94LPpoal0XmXd4OwrkKpf7QMmoQCwkcAoorZGj7L6cPD7pOCNM2IpjBlqyXjmxTM3lzMGsZmu2o1V3KI5/CMZPVcg60R3tHFdhSr9vG71VlHk3mWwo7rpyVTdw2SGT1UFORzLRUMD2BanA8grHEXmHemoftnls10JW7n2v3g/zBBp+mLRG/kPs38lssvS4LgxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y0rnkDe11eqxqlfRWZA3xTXYyt6Gh40oYFctWQUOSrQ=;
 b=GqwbelkCV5UzE64KhZzuboGi6Mc4VdA461gpOLOzONN761J/36L0ivWXUJGZt4bWL+ZaDAhkN9GfjL7me8EjcPrwGiwSHkmLdpY5Za+JaOP+PfbXr800S1IB0qBSPbQFvBCilcDxG1WiQc5FN4IuZjBgxQvbEeqKCj/E1yUg0ONHBagn2WMnDll/uG8VO/NWgEKgqKcXbJRNZyv7yrv8aDQ9ZREgqgKe2/ayJWNuuLN4HxuRyDNpepF9CWWCYuU2AlCigN9OdMMyclNyDA/ytWXXG8y+n/HlRuAQun7S1AlcKjekCvQQXebC2lcKegWG+/1Migm4dudimiWJO4Hi8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y0rnkDe11eqxqlfRWZA3xTXYyt6Gh40oYFctWQUOSrQ=;
 b=rPSYYOeRPyaf0YG0Mn7pWm6BJvm22+16F3Gx/j5fPupRL7R+obWhsup1HGzUlTStCFa2c6Vk7dMM7RL1CpzXGhuwMc/IIo7gW++NDDMwllOUNfvPWAFs41f2Ej6QlpahFE50Xti6WcAFmSDBdmEBJXfkp+wRgNqQK7UqK6Vx3/A=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DB4PR08MB9384.eurprd08.prod.outlook.com
 (2603:10a6:10:3f0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Wed, 2 Jul
 2025 11:10:20 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%5]) with mapi id 15.20.8880.027; Wed, 2 Jul 2025
 11:10:20 +0000
Date: Wed, 2 Jul 2025 12:10:17 +0100
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
Subject: Re: [PATCH v2 05/28] coresight: etm4x: Ensure context
 synchronization is not ignored
Message-ID: <aGUTmZgrN13GtrBp@e129823.arm.com>
References: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
 <20250701-arm_cs_pm_fix_v3-v2-5-23ebb864fcc1@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701-arm_cs_pm_fix_v3-v2-5-23ebb864fcc1@arm.com>
X-ClientProxiedBy: LO2P265CA0491.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::16) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|DB4PR08MB9384:EE_|DB1PEPF000509FA:EE_|DB8PR08MB5498:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dc2faf7-1928-41ae-d35b-08ddb9591ce2
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?yZKkirM1i796Mav6HkZsoARjq5ZW0tvbIITyfh8WjiC/PkODblcMagTW1Nm1?=
 =?us-ascii?Q?i9H6u/cBwW/fT/qtsR0xNafU5B235cOwjHf7EDSGt548pn1TGFJorLCfRZB8?=
 =?us-ascii?Q?UB0GTE8gYLO+kUDqFIErTC1JRWRqxCFrAlS4ByQ85+szRIQBGMuOqTxckFnD?=
 =?us-ascii?Q?f7OPHWtFWdWkM4kTGqbSyr8HKUPE/j82+TKgVHzH+lBisG4zH0cu/7RcAVXw?=
 =?us-ascii?Q?FbOr6U5xOCsszXejZ/GeMn2ghdhA/G2l4ZrIhF5BMY+V9VhL8UGRVyQ3XPoL?=
 =?us-ascii?Q?zSo6HzEGoR/wk4AmfiqzPZ7E0i+uGIoTa7WU/UMHfGKBBPXmiRLmda99uhZ8?=
 =?us-ascii?Q?LJsSkQnGG7Jc5tHROF6zU7Cg5qNvZabPJNssuAQn4es5GtPVIPHYzGSF4Vri?=
 =?us-ascii?Q?z3wMNsEofnk8RB2AZmDPo36V9J0rgYuonivTVIbf6Ul8HMdmCIKa+huQEbRM?=
 =?us-ascii?Q?78OLqDS/Q/TobhUemx9xA/N048tniZUYY/zE7JV9ABWePNFXTexFT6v5Ujwx?=
 =?us-ascii?Q?QALnsAGZ3+t+hOqH4YNm3O6eXIgCJqa/mmokFaFLdUYlJQRyK16qCYJmoU87?=
 =?us-ascii?Q?P40uaVl5LCFrISSVvrMZWCV+ruuFbIS1XMmHPLtdKe8OymbDxHfjnhDuYS8O?=
 =?us-ascii?Q?nqnKj3WgLRRYm3j2nHQ6PFXDvYk5gqFBhHIZtNuK3nZbuxIrBepd2cFUmtPR?=
 =?us-ascii?Q?buIwGf84nQgtjCSamePbvqOksANn4EruHq23JiXLtKkD6N/cQnUDwchraH48?=
 =?us-ascii?Q?JU0h7F1Wf/Ah6mLeXIWy7uyg9w8oQFregYFVJ6/SWTRYiEQCy+5PvX6BIZU1?=
 =?us-ascii?Q?3qh/bHGjqfkc09bOvyGOO+zKVRif5GR9oT2Yc5UsLKCWSdlIBML/eQbo+Sb9?=
 =?us-ascii?Q?24g54wJwpXhkJiiYhvRhdeLS1tR3l+et6i9ssdF92M2soCsSOom/LZp3yxwK?=
 =?us-ascii?Q?VP6ZnoI6rn1DCC+cqP6G5JUxhYM3n+7F5v/GIfyO9V6rX0CykN1xuo2FliYX?=
 =?us-ascii?Q?tUGJaPo4MGPVOu4jRZz2c/JxeMnWGOIFCVaPU+H6OTWUIglhtQhFkuGiSdO+?=
 =?us-ascii?Q?4M+PLDvGkAY/McmIcOtpnkqVlyyvISc+FkdKBjlNUxAM3agI3Cyk/uYG0+rR?=
 =?us-ascii?Q?0OoPaF/WbROsYEkj8U+tg2dAM2PWc5jtYb8UaT3AIFaGCFsVUYI8v9uSPR7K?=
 =?us-ascii?Q?kX1GsBeFMM0hQh1Lc62/zXKnYnY51DCGR4VyDz157keWViEHbI2d0yUPEe8b?=
 =?us-ascii?Q?mcgG36KmX1eQlITOQMnbvD5ny2SzI0hQ+EWQft0RRXbeasrY0e5BE8+2GR2W?=
 =?us-ascii?Q?Mqt/HzNOXa5O6mkTIs7E4IZeEsacBfsVr1/r7t6Ba5Y9VbxycTCyI3rq9MHC?=
 =?us-ascii?Q?e3YQY9cO+sn+YX0ajlxD4mpUA2FkMCvGGweDxPHoZ4mdJxrc8AjcBGlBodRC?=
 =?us-ascii?Q?Aoo9tiJdShs=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9384
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2174a95c-cb0b-40dc-7a36-08ddb959084a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|36860700013|82310400026|35042699022|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oCLBlUAoGSjRX3l44C4/bPe3x2LrRmcM36ykPs1xPunR2tD4GfGxtWUqDCCs?=
 =?us-ascii?Q?l29MlJGbrpkUa9KuCCo5xGUjcLnwpKpOoOhAsclS5l73nOmG0OX7zuxvhbme?=
 =?us-ascii?Q?sbDYkjRS+EJ92G13HuXFCnb33lw4WS5FuVsyi1n3RVdanH1k48SjPjB/zN7p?=
 =?us-ascii?Q?L1VFjmMOx0w8v0go9hxQcOgPnp2p+RGc4U0PZ56cg2owFDPcCAfksCBW0IDn?=
 =?us-ascii?Q?G6NjlU6DgOdN8Jovj7Ykjc6b73usUuvBkiNxnr4Dwku99fWFLRJzF07mMeyu?=
 =?us-ascii?Q?57VOLAItx8JVcQ/5D1xRXyigyF7JmiKm/HOfGzpAe6nbfH46fkFiFAtOg4XU?=
 =?us-ascii?Q?uIRdIx2ThRpDYnVdWw3f801kaTbi3FCornZiub0QRvQ1qyrPgfge0saEjcc/?=
 =?us-ascii?Q?LH4BIvIVNZACKc0pfyPmucUWrvGESg0pZlnht4BIz+qA4yga5TU4fDdAMP73?=
 =?us-ascii?Q?KVlfDcQVtuV2TAayfyBPZAB1BFKlkwsgLKCOGcd94ihH+9vl8z6S67TRHkkX?=
 =?us-ascii?Q?qZDnUCVPL59dRESl925qQDB6ksvtSHbZypQkfCbb1xlSdaOdywmQw5gbc2Wi?=
 =?us-ascii?Q?eq9s8Gx1a7xwqB8Cn0VhGDj9aehYQfEmQqZXoD+BljkOB28c0qX2X3+v7qf9?=
 =?us-ascii?Q?zTXUz4jxQ8WReUOvLxgsdeRd9rpYd4VPlLkvD47vU+Db1moT+f/aaQs36qca?=
 =?us-ascii?Q?/oKwoyI5pxon7hywZUBoWO75RO3rBNOdqaleB6HUGQAYp0HAV90qJ8oX4V8Y?=
 =?us-ascii?Q?qvO0F3xWScCi1FJmb3xIifF3TuhbgZ0ZOybdUJOvi0HP8Ihi/rfgD4nQj3hC?=
 =?us-ascii?Q?lQh/un33AE5sMo4SDHoO+zfjhNVC7TcRsHpBB75fJbDTt5UuYP1TfkEOK+fV?=
 =?us-ascii?Q?pjfkfufLuEir5f+HrB/wPqGmt455VgAK+qgeZdg0cPneWx3/a5m+zfZ3vZgy?=
 =?us-ascii?Q?iVDVsIRTs6iNpKKxqvtwJv7rjetrgBWz4243gtypBr/6WNJOwm+kNtGr0xjS?=
 =?us-ascii?Q?s0c2sFb8odeQ/Yh1DWMthfi3cxHhU/W7rU4dhHeLWXlzvjgDgesbj9xRsOOV?=
 =?us-ascii?Q?ZUCjfCVN6gBRLtde0tcLsTQgHW1SarZpIp+Mk3/cmrblDpbXr4QBh1H/SLkt?=
 =?us-ascii?Q?QnWSIgdlSIQlb63VqoR8dE1Gatg4W9U8BLia3JaOyKUUoYl0sm0B1RdlXsbw?=
 =?us-ascii?Q?sinBByHBSJtRRJAKMy/YChMleyHBmkwiiiWqJ/59gdJhyz3CdLsKefc4wgGJ?=
 =?us-ascii?Q?dwuIhuyRzci7dWd1SJ9NdOXRE5J174aMn/ZGqx38N73K0lcZwcDQfBBk5wm6?=
 =?us-ascii?Q?UKJBl+jHvlB6QeU586NtmVsqfy1qbvaCZvJQEjk+C1/D/FnSjJfH4cR7QGoN?=
 =?us-ascii?Q?ZV5h+TZjbpl7fYMJWnMvx8PPMfqtFMQgGp5VLl2Wet0kZujB5zCJJ3WDqSlm?=
 =?us-ascii?Q?Zv3q4l15XpNuMdgdMQmbciLqe79U3hEKxeFncw6OK17EaYzAbd+HupbU5+9f?=
 =?us-ascii?Q?p3TWiAVhCYEpkWaOMU3SRJk8q3SWYPHBB7Y0?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(36860700013)(82310400026)(35042699022)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 11:10:54.3355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dc2faf7-1928-41ae-d35b-08ddb9591ce2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5498

Hi Leo,

> As recommended in section 4.3.7 "Synchronization of register updates" of
> ARM IHI0064H.b, a self-hosted trace analyzer should always executes an
> ISB instruction after programming the trace unit registers.
>
> An ISB works as a context synchronization event; a DSB is not required.
> Removes the redundant barrier in the enabling flow.
>
> The ISB was placed at the end of the enable and disable functions.
> However, this does not guarantee a context synchronization event in the
> calling code, which may speculatively execute across function
> boundaries.
>
> ISB instructions are moved into callers to ensure that a context
> synchronization is imposed immediately after enabling or disabling trace
> unit.
>
> Fixes: 40f682ae5086 ("coresight: etm4x: Extract the trace unit controlling")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 38 +++++++++++++++-------
>  1 file changed, 26 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 0f2a8b8459c93ca29d270b6fa05928244e0761c5..af9d3b2319c5f49ccd40dfa0ccf0f694ce9e2f4f 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -459,13 +459,6 @@ static int etm4_enable_trace_unit(struct etmv4_drvdata *drvdata)
>  		return -ETIME;
>  	}
>
> -	/*
> -	 * As recommended by section 4.3.7 ("Synchronization when using the
> -	 * memory-mapped interface") of ARM IHI 0064D
> -	 */
> -	dsb(sy);
> -	isb();
> -
>  	return 0;
>  }
>
> @@ -579,6 +572,13 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>
>  	if (!drvdata->paused)
>  		rc = etm4_enable_trace_unit(drvdata);
> +
> +	/*
> +	 * As recommended by section 4.3.7 (Synchronization of register updates)
> +	 * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
> +	 * ISB instruction after programming the trace unit registers.
> +	 */
> +	isb();

But according to 4.3.7 ("Synchronization when using memory-mapped
interface"), doesn't it need to dsb like:

  if (csa->iomem)
    dsb(sy);
  isb();

Or am I missing something?

>  done:
>  	etm4_cs_lock(drvdata, csa);
>
> @@ -954,11 +954,6 @@ static void etm4_disable_trace_unit(struct etmv4_drvdata *drvdata)
>  	if (etm4x_wait_status(csa, TRCSTATR_PMSTABLE_BIT, 1))
>  		dev_err(etm_dev,
>  			"timeout while waiting for PM stable Trace Status\n");
> -	/*
> -	 * As recommended by section 4.3.7 (Synchronization of register updates)
> -	 * of ARM IHI 0064H.b.
> -	 */
> -	isb();
>  }
>
>  static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
> @@ -981,6 +976,13 @@ static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
>
>  	etm4_disable_trace_unit(drvdata);
>
> +	/*
> +	 * As recommended by section 4.3.7 (Synchronization of register updates)
> +	 * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
> +	 * ISB instruction after programming the trace unit registers.
> +	 */
> +	isb();
> +
>  	/* read the status of the single shot comparators */
>  	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
>  		config->ss_status[i] =
> @@ -1118,6 +1120,12 @@ static int etm4_resume_perf(struct coresight_device *csdev)
>
>  	etm4_cs_unlock(drvdata, csa);
>  	etm4_enable_trace_unit(drvdata);
> +	/*
> +	 * As recommended by section 4.3.7 (Synchronization of register updates)
> +	 * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
> +	 * ISB instruction after programming the trace unit registers.
> +	 */
> +	isb();
>  	etm4_cs_lock(drvdata, csa);
>
>  	drvdata->paused = false;
> @@ -1134,6 +1142,12 @@ static void etm4_pause_perf(struct coresight_device *csdev)
>
>  	etm4_cs_unlock(drvdata, csa);
>  	etm4_disable_trace_unit(drvdata);
> +	/*
> +	 * As recommended by section 4.3.7 (Synchronization of register updates)
> +	 * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
> +	 * ISB instruction after programming the trace unit registers.
> +	 */
> +	isb();
>  	etm4_cs_lock(drvdata, csa);
>
>  	drvdata->paused = true;
>
> --
> 2.34.1
>

--
Sincerely,
Yeoreum Yun
