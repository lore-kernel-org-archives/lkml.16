Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012064.outbound.protection.outlook.com [52.101.66.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A8E2E403;
	Wed, 11 Jun 2025 13:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.64
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749648441; cv=fail; b=SBi4pk8Iff9CHkaRypruDKmfsNVtF55FhDRXi2zU/yjBNLe/lovknSzrPV4oh6Yz1TE4o8ECyFEpRvLi2WFz8fg35yahTiIv0CN05JD4cqsUWRq3P6zocVrs17R6UJhv6Idyr0v+wcs26wqbp3i9rsj5o0vJvKPb1J5fOs/uuAQ=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749648441; c=relaxed/simple;
	bh=pkGfuU3B3R6g/eSJgYnW/DBBjm8jH98DSAPTUBuBBus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NmaruXsdql+NuY3/j20HjxYANPEedR9w8AXfAW/5OZ6JMtGh5ZOyuGUX4h0spZ2CH63AuM4beECO3romzJ7Six6BDqr91TtGRvG05N0mWjYShxkXmpiesLFeZfrNtlmTB3JKx+RJJQh3dgGw1MVlR+lrYi0Qh7ZEWooMNE9gDhY=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=C1TmR1VC; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=C1TmR1VC; arc=fail smtp.client-ip=52.101.66.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="C1TmR1VC";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="C1TmR1VC"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qEcxiYS9tpxN2WY7aMYgOFYLlEgL7PHgKbniJe3YIcquYqMLmTlcKn6/EW28kSuMhVfgMWOEwYdkrMiHL1lAum/MC1Kie7vogR0YC/wxUnGtk9FRKl528oxPe0hgKUV93/tor/NrypNFPUshmCMTLTUpWCksWDv/X+J9+4+Cf0z41/ar4NYNI+yPuwDI5JtwtnTr1zg2TrRlsyrMovOkAxKkZ/sOMtuVSVcLZtixYplPFn68yw/Mgrz2AdKU236+7diq71x0bTuzafmP2NBNRjYYU9Hq1yqBkq3U6aRVEd05gxWffl0AcvhXaXLlpWi3lPJxudWCJtIzLeOg2DTgfQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hArUTCGILOYyIwVGjRvGWuH6g4nzXdl0NOGKE+nBbYo=;
 b=Kmw3AiSJTI7PyqFPkaCUS62cooopC0CooPk0wVdexQA7yzerTXMgelP5oVwS3fJtuzrvE3ZFQ4E3g7CWpkrb8wNn90aQYxmysi7i+0nbv122Tg+vMMjSjWJ/MPVlWif+ALBNP9Upq3OQa1P5+T5F+8IfFthOu8GPm1H5eE8hFHU11F9TOuaL2gEoNcDZnX30jHFTrA0IRYr3fxynMLtE0rgRDRh7AMu+zvOWOV+H/swpXpzUMUXUxN0WQCB/jZs1RqT0PvhEY8NPS395AiwlD4dfHdWWtpvWpN+lMSX1UwdDchwNDX8o8nw0WATcFpkkuA1wE4yiXhfA58cjRBneug==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hArUTCGILOYyIwVGjRvGWuH6g4nzXdl0NOGKE+nBbYo=;
 b=C1TmR1VCfFUTC62b/RyRW0IA3Se4mqpyQT5hBR7gVacMQZWVDmBgdroLc+Rwx/2qc+5gROP1tKEifNjvdubqxYjeOoVR5UxMFo23d1m0mJAUx1dXC2t/op8rNLTeYriUm+dIOvlnfBVF7QDDH0lDFM132bBD1z5EZEmM681Zq9Q=
Received: from DU2PR04CA0322.eurprd04.prod.outlook.com (2603:10a6:10:2b5::27)
 by GV1PR08MB8178.eurprd08.prod.outlook.com (2603:10a6:150:92::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Wed, 11 Jun
 2025 13:27:13 +0000
Received: from DB1PEPF0003922E.eurprd03.prod.outlook.com
 (2603:10a6:10:2b5:cafe::c7) by DU2PR04CA0322.outlook.office365.com
 (2603:10a6:10:2b5::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Wed,
 11 Jun 2025 13:27:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF0003922E.mail.protection.outlook.com (10.167.8.101) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Wed, 11 Jun 2025 13:27:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dSltqDGnPqjMC8ophfwlDA2pV/piUIyOd/9GtzEZUm6Kq45ilnWYiuyNfWVZJf85fWvD0bBTCZtW+T9zqaITO7XUb0Ocopo0hsVtAZ4+SznXyGSdwxKwm9EhZmLIYC7URGQyKG+q6BRCpurZY01nG85AuCwa36gsLdbzBmCxPlDT+6eFw/B2y9r1mTDQOFZAh6uXmpTws5uUbGO9FJuQQG4N98mHsiYkIIQLS39xsFin8mI1pYbegXd2N4v4RWr1JFUZ4PGuxKwda6fAOwafRjmaVCiIe9tKp0vV4O91Urv5OerakZxziGi+sJxJpQrzv0a9viKjWmJP+bcM7H9KsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hArUTCGILOYyIwVGjRvGWuH6g4nzXdl0NOGKE+nBbYo=;
 b=itKtxfPeiTb7RaE7NH990zFbRKDOyaEc1Jyv6liMhurm+OplDBU2hu7aV8EZuGFWbU7Q1vfo7WGgCcI+KDnRGl7QE0ibNRXiThYtmSiCuFDmi08yzKTR1+//ZVP/b+1AB5FwH0fY6AL6nBTQ7Q7/n9srNqVIFTJtXEiB8yIm5jx/FvXkHa9K2jyqU1W/LIura7a1ioUNCI6tAiSLtiJhAnQi/zeTjo3HPVqumD7hp02rwqvqSLn0Qt8twgcZjv/6hPLcNUNulyiwDb380IPrG2pdNPW3fqCyf8L21niZQHc7FapGA7j65NqL0zSSxtkKCD77FKxG2Q2sxIWUH+XAeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hArUTCGILOYyIwVGjRvGWuH6g4nzXdl0NOGKE+nBbYo=;
 b=C1TmR1VCfFUTC62b/RyRW0IA3Se4mqpyQT5hBR7gVacMQZWVDmBgdroLc+Rwx/2qc+5gROP1tKEifNjvdubqxYjeOoVR5UxMFo23d1m0mJAUx1dXC2t/op8rNLTeYriUm+dIOvlnfBVF7QDDH0lDFM132bBD1z5EZEmM681Zq9Q=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DU2PR08MB10302.eurprd08.prod.outlook.com
 (2603:10a6:10:46e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.29; Wed, 11 Jun
 2025 13:26:40 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 13:26:40 +0000
Date: Wed, 11 Jun 2025 14:26:37 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, akpm@linux-foundation.org, surenb@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 7/9] kselftest/arm64/mte: add verification for address
 tag in signal handler
Message-ID: <aEmEDQ8HcEXrbOXE@e129823.arm.com>
References: <20250611094107.928457-1-yeoreum.yun@arm.com>
 <20250611094107.928457-8-yeoreum.yun@arm.com>
 <5d2a3abd-f19d-4fe0-adfa-9a9860d7404d@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d2a3abd-f19d-4fe0-adfa-9a9860d7404d@sirena.org.uk>
X-ClientProxiedBy: LO6P265CA0029.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::15) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|DU2PR08MB10302:EE_|DB1PEPF0003922E:EE_|GV1PR08MB8178:EE_
X-MS-Office365-Filtering-Correlation-Id: 09b1d1fc-251d-4fc8-c566-08dda8ebacd8
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?TqlH4tzz8c1pL8ET/E6atrfmNtqNmKfYiws2wmyksSpz2d4XwCzNrk7WdFSI?=
 =?us-ascii?Q?h6aSphtUZnID36RlAEHOB803Bsm90WHiDvBwyaJG/1J9ckGN+ygPbU+qizKh?=
 =?us-ascii?Q?TLUyOH94ZrsIn3jYeq5GebSqK/kkDg3ZSICvrjZYe9h3aYiyHaS/IUJMOTBT?=
 =?us-ascii?Q?5xrX3zhD0ZHftZnf1c2Ci9Zv0EzD7ysiCs6BdgVWAeTd8XDCpK1jQK7AMdLP?=
 =?us-ascii?Q?fW2uO+WhnUhcuMZjlaEVzq7nSvXHxz/dMExMTR6QAx/Nbsi6rYtyHzf1tDqf?=
 =?us-ascii?Q?7yK+Ge8UYXbIM2GUppU5IDj74KsO3fAGgGilUKZphybR+STDDa7NYjkOMNlE?=
 =?us-ascii?Q?gaN+Sg5padV+fOZjM5AOi8oFmih9+wf34zK1tPHibWAyWH2FKcTOrJEOvuv0?=
 =?us-ascii?Q?G9aOltV/iOxY7Z0ytZNp5GwhjczA8/ccUYm0lSpQkgIBj5xSjC92ilFToi/P?=
 =?us-ascii?Q?qhBujTBKVUyuNj7vY0UHU/9Hg96ARND66DeFfHfp9QfftY7mv0zpvc8S7aM2?=
 =?us-ascii?Q?3zxyJ2KxevcB8T5hWTH7wSms8c/2a4XZxaAPcYxIgnq4gEPef4RUJdkolPn3?=
 =?us-ascii?Q?KZOrcvvaPC45JsZIMyUG6Yjet8eSjbhwWa6BXiyx5ZlP3NH5bMAsp0leCQYg?=
 =?us-ascii?Q?LI1CcP3QrBTbhXxWfD8/Z636vWDqTCm9dmB8ML78LJg1loOacBN6W0tzFeQS?=
 =?us-ascii?Q?XUkdyJeJntzzw6J5iOzIcMUeMhF9PsSBXZqrMjVxW/ICzATjuMtrzooH6Kpp?=
 =?us-ascii?Q?TtTTxpR9seQSHl2NUristyFAwrKqPjETqc6T+KfnT1/hjNdhrU5THTDmK3K9?=
 =?us-ascii?Q?hrV2ws9SjB92w3lSXOUdZ84Z5fsFGl8VIUtti8EcZuDw5YQlPg6jYSOZbQMN?=
 =?us-ascii?Q?3j/PhWGqJgQk8WKh5x9+KvcILUKiBxAWeWgwbu+zjc3GF1khL8ZBuUXfpVjB?=
 =?us-ascii?Q?VCycrPCPldWhtDX5ndOMqeI94FhdEEop8/I319XlONrwYipbH11sTxcJU6RV?=
 =?us-ascii?Q?sfppei0YNgvSSpSu7rSe9nplzrHEB4clvBuPUvZ/BJasAoHsNuab4F3uqOrq?=
 =?us-ascii?Q?KyPa4DphQdeT1KaiJzX5Lt1ChOVFRaaarVAFamu/4jQ7xUPyoL52u/GFayhp?=
 =?us-ascii?Q?MKtC6ws30fZkMrWRQC9DjHUpKTSF2U+YVAE+sNdcRIPS+bcldXbQ1hOvaCVT?=
 =?us-ascii?Q?/utXFRnTPqmeUC1Kgk03hdnSIXL+WLnc9iDQ2Or9Ik33qF27dC7iVCRjn6UN?=
 =?us-ascii?Q?nx651utlOa12w6SpAh4csoSOy/wBNgGNRcHYPdmFMSaIO1DlrdiLSV245FGm?=
 =?us-ascii?Q?/vu2q4UU9ejxwEIlA7d0UWd2aeWihOhXPJEQPOA1CUmTLz3ZMtVz031WJ9BK?=
 =?us-ascii?Q?oQftVDoHIGNhMC/kvcxa6q1GmtoywA9OKI4ZMn6i90hCj7Q6rtOOhRfwhjFT?=
 =?us-ascii?Q?2LReaaOd3q4=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10302
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF0003922E.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6bc2071f-ed35-4184-1d1a-08dda8eb9961
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|376014|7416014|82310400026|35042699022|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+Z7zvExfs8R592ISQZXoYFckgiFeiDV3yVP16k7fEN/Mn31h+ZBLiCs9IAAp?=
 =?us-ascii?Q?tkHRTukBmcB/JkY7XQSKiqVkX6fxl4w4xPbAE90IIpqTlWbSrm66oe1rq5zs?=
 =?us-ascii?Q?38gYCXgn0VbPzB3FFshfd34pWA/OkOfejIAXzwgHuN0yRMeNTnjaZGGgYDav?=
 =?us-ascii?Q?JjElHjt4FbMNpWeyhYBuF42XBq+wouSntqLIIMUrN/MlQXOnDDeWtCuXnZ/C?=
 =?us-ascii?Q?9FZfxiMc3kmdEnf4+zdduGpCZo+/ma56phvyAo6o0QAJtKghrtrdhiqwG8qX?=
 =?us-ascii?Q?y9YWGIpjat0TPDKMfCnT+vfxph711uSlhnHuVrdBThXajpy1sjZTB2hmh5zY?=
 =?us-ascii?Q?dfMDT2FbT0f8zjpAAE5ck6Qm4OEZyDz75qpSxxtR/QVfAMa6gIZ6ZKVzLO2w?=
 =?us-ascii?Q?qjDvndqf46MpxzB5u7yBVNcl/1FTifnuRJlJWZCL3TGhN4xsRxI4nOAohnW4?=
 =?us-ascii?Q?EHc80qMan7Qz+VF3MfgNT0Ft9qzxOZuSREXMzb/4tOJ1diuF0fttDt6o38uT?=
 =?us-ascii?Q?91Ew0nNx2noUTc7Rhpxc95s9W611NURUYtP43UlSaytAVtB5TJ052yl3Tpmb?=
 =?us-ascii?Q?lcxjRaZPz9CY5qqzmiENRF3Xr9KZ8nHkENaZFDR33GK+/nhpIT09ndN/bXPV?=
 =?us-ascii?Q?T+ZYu6u1HIyNQKKLy1zO8ND1It/g93mmmgX+n7cTc9F973558fM/+DQJr/gP?=
 =?us-ascii?Q?ewxku2MqaYSuMBivxaQ7xCTKVkWKsTHD9k9SDsRa9+1whzijRtxYhlbvdYNX?=
 =?us-ascii?Q?HIAItDYeM57Goew3Tao/b+xUbXAEuiaqsLNxeOsu1linKbbXQmTjNAucq5CO?=
 =?us-ascii?Q?/2QpABLN8AEwCoxaIWH1f4EdpvdvQqf7mdAoA1zOngpDkkXXP2Hkv7qRZGqI?=
 =?us-ascii?Q?M1P1olk+DTyrpHd7nBFKgbUvD4vXs5qPd3sbrJC2HmdCz66WHFnbWMRDguIa?=
 =?us-ascii?Q?u2LcW301RW0+oeGJ0taOjo5lC3WsYFrRrqgzgEmIq78WMZFkEVPc8CNcpAaz?=
 =?us-ascii?Q?2I5SZLJ1yhsBInjU85qHuwr6lBpxh2Dn4Yev8KWS1GCG+EjdeXg/E9LrUfxh?=
 =?us-ascii?Q?Ls5UeAu9Yw2AgMnS4jNIEKIAdy5eF8xgwYo3IUSB+GuoEDY0EEpx30ekxvcu?=
 =?us-ascii?Q?mbD2JDwSd8KLvI6yiQnA+0GnP+v1ygLt7DE/+MpeUGt3e8M/EwZRU0FSjeOu?=
 =?us-ascii?Q?kqiSJ+j5tsAQWaYSSfD0ExEcQ4lal/5CNMskH7EDPARVT5Xd1MNtbFODXqoR?=
 =?us-ascii?Q?ZmSrLUKpEMCz2W73HaWWU9XO0mAz9qXvEEnlIQIf7+py1p1BXuQfKa0ah5HH?=
 =?us-ascii?Q?v+cGAzK8xr6NWEbbRjv/dq6eVRFRhG9M616VEjT9ccBx5zd5/zVJFzS9QIv0?=
 =?us-ascii?Q?Y3mE+Vj3l9pjsuAZwATR2LhXQBIc/8816T9yXNOuwvAhevZ+Q0xQ41SMTXaz?=
 =?us-ascii?Q?H07FTue2L2gylGYQd42zLaDhp8WobvHLp5lGB9XT3Aw0TEgRplk+CZmaeA/A?=
 =?us-ascii?Q?IlerOkrHuQ+pFODrBIT6e6l3YThnLXW0LGiO?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(376014)(7416014)(82310400026)(35042699022)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 13:27:12.6140
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09b1d1fc-251d-4fc8-c566-08dda8ebacd8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF0003922E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8178

Hi Mark,

> On Wed, Jun 11, 2025 at 10:41:05AM +0100, Yeoreum Yun wrote:
> > Add the address tag [63:60] verification when synchronous mte fault is happen.
> > when signal handler is registered with SA_EXPOSE_TAGBITS,
> > address includes not only memory tag [59:56] but also address tag.
> > Therefore, when verify fault address location, remove both tags
>
> Reviewed-by: Mark Brown <broonie@kernel.org>

Thanks :D

> though if you're doing a new version there's minor stylistic stuff:
>
> >  		/* Compare the context for precise error */
> >  		else if (si->si_code == SEGV_MTESERR) {
> > +		 	if ((!mtefar_support && si_atag) || (si_atag != MT_FETCH_ATAG(cur_mte_cxt.trig_addr))) {
> > +			  ksft_print_msg("Invalid MTE synchronous exception caught for address tag! si_tag=%x, si_atag: %x\n", si_tag, si_atag);
> > +			  exit(KSFT_FAIL);
> > +			}
>
> Indentation seems off, also there's ksft_exit_fail_msg() but either way
> works.

I'll fix the indentation next round. Thanks to let me know.

--
Sincerely,
Yeoreum Yun
