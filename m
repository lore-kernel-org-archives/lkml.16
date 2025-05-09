Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2052.outbound.protection.outlook.com [40.107.22.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F94E800
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 17:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.52
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746810653; cv=fail; b=kspT6llL/T7kiSFLMwjvBv202zZkfiERtpsgt0weHUYTSb0lAiC9II/0K7jBgcwerKj7Zdr7hZOp/UP7CCYh8im2Vp7G0wpoyZ04YUWQ3WeCXoO025mDIZRZ5bRV5RKiGNLGSZloOV74vZvabYBsGghpYcXcapC5B0BcsRq6eF0=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746810653; c=relaxed/simple;
	bh=Z4TcX/91fGNgagab3heaq0w5UrOuk9aX5T6+x0lKghM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YIz13LMOqXEPKi2jYF2cv7cddc0/75gqAQtlsiNFvfiRH8tf2C/tiiIieY5zLQ8Kzftbr5eaAYt3Y21ilJRaEczbrIY4z0q5F6+IDRLRlh9ug5Zhxs0RRuFERxgxx4ax7OJT4iFs0GgXclUE67AI0TYqvAEdSzcvlotN3RzrV6Q=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=jheHs3Kn; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=jheHs3Kn; arc=fail smtp.client-ip=40.107.22.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jheHs3Kn";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jheHs3Kn"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=pEBL/WbUxjSy2PgoCKUDx09wmrvklAeC5AE4bKzlDwFWU+xA40VcT+sGYqibK3AfbJo7Gxc5yXVI+Qk8/hKKSuMiV/lBR0HRyj2drKmKs5RsT/uPS6oLvrgE+qS0gvckJJMZ649OsxreX5oM6gU4aG4Lujkm3PsDCBKMSyYW6H/R5SZZPPX5ESH/8A9Cd1TQMImwY6fTyOP0Siesy9Nrx6Mu8zzNbmVUgX3JpQSwmaOe+K/3uILzGOyZEHdmiiEW82FQPJlt4DuiujaQxtvzxtB0eeAsIZd+OOkhGhNy4nAk/qK20gmusXjpvisRl0ttLNk5LedFloa2MAwCeTFtUw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHTN70uNp7VPsG75rluEfog60E8tpKaWY56N2rx8MeU=;
 b=cNHWZSumF7rRTWp0Iv3EIq1Y6KTcMU0A0baBjiuRnBJjh4jJRnvcKUeOtZF9vNNxPc9d4f/OxIt/Byk08gaFg54/Ibk3Hlw47oXPQIZRi98iGVoG+Qck8okT1BWAYdLxEIYT+eKu+kcBr04K53KziqTmSctXTlbdz+Ww6PZFhodGsptbXOPzARQFX/uS5wFSVbGjIEohZfLMqU+3+4NUHHzF+syxE4/kFzQ+13OeudkWDiThSCJzQye1ibuXmOEiWMNHBakxQN+rAL5yvkp90UL+D9jK/ezcjHlKOR9fpUhYVOh2SUvcXimYFalMR01kXh0LXNy05pfrvA/V+47e9A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=google.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHTN70uNp7VPsG75rluEfog60E8tpKaWY56N2rx8MeU=;
 b=jheHs3KnMFWOTwgK31q8UPHNrtwsox4DpIcW2WPGcBD01pYNhTSs08d47DL3VVdJycRqK0eeP/CVZ0pnUSaGtxKVxfsmlTPSuMH0/7/yU0g4Ts+rUmLoOztj3viMmL909rfJ1RAPiBpzuBG1SnihZq2l4Jcx8RRbQwtb2IxeMLk=
Received: from DU2PR04CA0074.eurprd04.prod.outlook.com (2603:10a6:10:232::19)
 by AS2PR08MB8455.eurprd08.prod.outlook.com (2603:10a6:20b:55b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 17:10:47 +0000
Received: from DU2PEPF00028D0D.eurprd03.prod.outlook.com
 (2603:10a6:10:232:cafe::59) by DU2PR04CA0074.outlook.office365.com
 (2603:10a6:10:232::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.21 via Frontend Transport; Fri,
 9 May 2025 17:10:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0D.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.20
 via Frontend Transport; Fri, 9 May 2025 17:10:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sLUDyUkV22OkxwCfEWKd7H2AQDpdD8068G8UikhVMz2fuk/z3bBjYw1siESzSHXwcCgdzj5G6QfIswVmzFl/ONfQnrex+gbmxtb8CJSwsOg+2Z2ZlCUtd3ciwuveBgpNV3SpoiXFWRPsYj5hy4jZ2uBVRU5E60KKNSNeASwWF+Yri/0hlUcaiNQtIU7Kxt0cK0uGQVvLsM2yztc7ETenLd+E463wENdEGpjqBgxRq/uP8mYFf6bCmTIIoCyjJ8kRA13WF3IrXBMc00zHBek44j4XyOWWfwCuLrREsnHWSei2fvVzX1ezACv0BJPABSJMoPz113eY8GAa1GDfgU9DQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHTN70uNp7VPsG75rluEfog60E8tpKaWY56N2rx8MeU=;
 b=DqzClEAt2sC/P+21WhtH5Q230PmGfwAou3FiueNLoBswi4FFesPYL0jstE8tFOVAtx7xX9bEV4nPm+bPwLaItXBBaDYGaBlSYF3OMsoELOeVqaYfiZ/rbl/6kWRZkg+tIhFIN1IqreOHaOZcLkPZvcXBeLNOYiiTk2s1isTGWoDHNbsqhnVncO/GzU5AGX794QCc3xqDcolvFWGQ99H0xk7bHTLORQc8abLWgXdZEcnXZF1MTO4lbIZnjs8t4HB/a/xOB7yZ0c/pUozDNpUQ/GLn2IxllA1cOYId7ynpGm2TyNPRcdO2KRYY+DmsP2hrfj+KEKJ9WEUR2YOtmuj/CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHTN70uNp7VPsG75rluEfog60E8tpKaWY56N2rx8MeU=;
 b=jheHs3KnMFWOTwgK31q8UPHNrtwsox4DpIcW2WPGcBD01pYNhTSs08d47DL3VVdJycRqK0eeP/CVZ0pnUSaGtxKVxfsmlTPSuMH0/7/yU0g4Ts+rUmLoOztj3viMmL909rfJ1RAPiBpzuBG1SnihZq2l4Jcx8RRbQwtb2IxeMLk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DB9PR08MB6396.eurprd08.prod.outlook.com
 (2603:10a6:10:23e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Fri, 9 May
 2025 17:10:12 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%4]) with mapi id 15.20.8699.024; Fri, 9 May 2025
 17:10:12 +0000
Date: Fri, 9 May 2025 18:10:09 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v2 0/3] arm64/boot: Forbid the use of BSS symbols in
 startup code
Message-ID: <aB428b2F9qzE0zCI@e129823.arm.com>
References: <20250508114328.2460610-5-ardb+git@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508114328.2460610-5-ardb+git@google.com>
X-ClientProxiedBy: LO4P123CA0391.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::18) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|DB9PR08MB6396:EE_|DU2PEPF00028D0D:EE_|AS2PR08MB8455:EE_
X-MS-Office365-Filtering-Correlation-Id: cb65ba3d-65e4-41ad-44c9-08dd8f1c700c
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?6vivxGMmh9+yXW3t4JTLQrGxQej+vq1HHU0SmfP0h/23rLH8rhe8HMga6m7p?=
 =?us-ascii?Q?rTFT8/6jYTgsJ7046iDxWrPaYIuggKLWpOvXOv88iYwRU4SFipwd5t0zTSC5?=
 =?us-ascii?Q?yzYLqQ3U4ouwNanwHl35W4mizZmF87Tb+vPKtDqZpQOq5u7ixZvPJecC8mVi?=
 =?us-ascii?Q?SL5JyQNzZ1zwwxjpidfsiwfYg/wQvPDQEYAfqio3B9ugvZG92QrY3V+WkVnL?=
 =?us-ascii?Q?j9Y2+KV3cpYp2iAXyXKvq1VuaD3vxuGu8GzFEwQo9nGSQ97AQbX3aPEEp9jt?=
 =?us-ascii?Q?EZYbFBzKdFw4GI8DuiCzLuDWVBZuSvCFiIEv5Dn5FekLiJGSQ7MZ8+14wzos?=
 =?us-ascii?Q?qRjZ2BUm1l0c198xdXipNbt/88j4N/RJmxkJRbWJK+IfcnjKiay098tDDFWJ?=
 =?us-ascii?Q?6lcAOTvKDHDzT2CiuycNDV0BsEmmHBDj0f4x04jrwA6NHMMq61D/gBXIYjxz?=
 =?us-ascii?Q?gBTVaJn6E1mtPdCjCytmi9HtxVsgCK45vpgFSAfr5rba0BME+8VABoJblB1+?=
 =?us-ascii?Q?Pic1aSBLaScIzCsi19ZOlDf+bzO6O3K5y0J5fyMci7azjIGUjZNUVQGkjBqT?=
 =?us-ascii?Q?gPen9phirK7Gie3bhFM6WDXxOuFm/DYLOHi7doFiRwgCcZS8Upjbbzv1zk67?=
 =?us-ascii?Q?rmGBTzLVkDVR/nLQI9MmQ/Jwgnc5rT6HYCMzp2UFZ0BrgiLBKotwYmsxcDp7?=
 =?us-ascii?Q?1reU+bRKubCdKF2Yxze1AXpdc2lLq4DtnbwY6+L2w4wan0P7KGc7/wIbNEc+?=
 =?us-ascii?Q?sHbj5ME3JEt3qlxs2ncyD514y4PLinuzekprcul+JXEtzr9TzpWBHDSrSp6R?=
 =?us-ascii?Q?lZYDoEweKivwIJmokuWwGU4HGOxqr67pVeG6l6uHWv2ldGEPFWuM4Y0wptL3?=
 =?us-ascii?Q?sxnuKyVdOSSR0cNLexuIbQWVReVW9y2UMMlv0KpackXKfu9HiIHx1f7yd8rs?=
 =?us-ascii?Q?qjEecyE3EGlfxp8npwG4T/wMYFxV3SuVCYM5xM63J+z2EFMgZJIHhxCR2HnQ?=
 =?us-ascii?Q?IiO66Wn4cV8wa/kGjh6G0hlS0eN5x16T0m7bHsv6OIljr5hNEUZEtvlsYkBl?=
 =?us-ascii?Q?OlduQjZI+h5hUF5ArMbrRRyimGvPBDjhqKAyM/+AdEBxJfjFVzPZvMZp2GOj?=
 =?us-ascii?Q?5vgNU3lQs1FWKw2f+dmSfz1I8XDuw/2uBx2r9Z2c0G8wToYflTqPezpyJtxU?=
 =?us-ascii?Q?/7ziKDaatsxNoXonZt4FnIXiYuPj+GbeWzY5cNS6ZhWYVbO2OrgBUMOdO9Jo?=
 =?us-ascii?Q?k3HwLUfygsfyGZxZYehdajE+sKGajKukpYAy7/mqBUQ7gVqHqB4YCwCbZOA7?=
 =?us-ascii?Q?BLIigRrHavHsRkwA9GgYPFrRTItaXbViUQFA+A7QE57PBb1JrNbK6G28y8fN?=
 =?us-ascii?Q?6DH6GEoMk6WFcPTsx/jQ+GA2FE1iMJ3ge/MupoMONVHmx4borntse5DED1kQ?=
 =?us-ascii?Q?xZZWMyAEIGo=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6396
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7eb6cb60-3187-4c77-4da3-08dd8f1c5be7
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|376014|36860700013|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4fUsmSTDBGCTl0uQYFDGZqG4bOC6E2uxau3BzxaSKDw281SZFVBX27e3X7AW?=
 =?us-ascii?Q?PPIgIAzSUQlLsDJCzCiA+CCyyzQiChGygbGJbFxCopUYjd33bScg0jCafPWw?=
 =?us-ascii?Q?EVplgn9d7DJcSOnSDY7GjEqjlETO0+vYOyxwWnDGVSSN+Px5Lceg3O3h93/L?=
 =?us-ascii?Q?DW46019PkmGeDsCLcxJ26EyGYY5JdzF4+h0wbV6cVvzEB9dV+u0/DcdY0aZt?=
 =?us-ascii?Q?GGOsPyM8OEU7ogikakwRIDN0ZlHF2y1HkYZrI1UVscWBjB9S7eu0h42HkwKu?=
 =?us-ascii?Q?YtvC5WktqJFU1rWE4a8m9XZQ3ai0IHBp2U7+rkc0+W0IqcFlKnp9LwSpyghH?=
 =?us-ascii?Q?aj2r/N9t2NLuzHnyKCVg66Ec6Sq8HzgqZ3c04jPOtlT63kIGh4vkRF0C+qXn?=
 =?us-ascii?Q?1fx6tGpy0aGdUwqz/FFcwPYQcr+kQR0WSgwzOXg3aZYWDKmGKFD967iMv0hr?=
 =?us-ascii?Q?/L6LO/PuoPVgmTOS941hlobqBOMC0naGSJadzXDnGc2R3ffbcC4bKh5RYT/F?=
 =?us-ascii?Q?aYM+FDEQN+K2njVD89s9oRuUYHLGYoI7keQUjjPr93ZNkPwCefw2hqOKeuon?=
 =?us-ascii?Q?CcUDwVwTHoEPoevdLB3e+ae/MQHKHWEM3hFE5cNRweJjSF1gJW5ukEeILunE?=
 =?us-ascii?Q?K7K7mzHLTlmy3KpGCkjzgpm8bZ9fa2oLOavPzCFBk9md3ZyUlQnBYL4t5mzt?=
 =?us-ascii?Q?usr/pTW5Wm+skyJsYgSEO4knJrTo3NraEw4W4QinmAXI91wW3hIidNo9qVWj?=
 =?us-ascii?Q?RIwsNU2XDpsPlexmqaPgAXoe8rIq+uJHwAIbSVs5SZBBT8LDiD9Ds1KnQ92O?=
 =?us-ascii?Q?mFFpIEgdBNmVyPw8tF+srTB/B9huXAUEyrBj7Hn4APZ9C7jGAqjPGT6nA4+6?=
 =?us-ascii?Q?jdc+efvf5reMgnkNJCIldx/4QlOFuCYTMP4v6bcQ+F4TekPH3vJcVuQootJY?=
 =?us-ascii?Q?9qo4PVU2Dj0yOOvR136oPlxLu2gap0nsPU3P0EOw+f2RpXpogCwhTg1Ja9mm?=
 =?us-ascii?Q?n9qBqcLqsZMoWyT+gYgOYkEhXGlmA/9HRybMj5t1wh/NQqmFgiaOX2+ADBRM?=
 =?us-ascii?Q?87pDGiktVUoDItOcV/LFOH+XnBRBBtjeCkkm+mLiSEcZDjsjBOvl5v7MWcLn?=
 =?us-ascii?Q?6/ry9rPCzuMER65Fq7EQLkel2d0yNnQXc/fNibxX7WzgXelJuOZwdFJw2tOI?=
 =?us-ascii?Q?VCwOl5hry+49V0nM+SahLXH+413muZakfXIvgLLjgTNaSpdYTYBwGzAJ8xcm?=
 =?us-ascii?Q?WqMVcaauLTpdkhYG/qXYT68bCJNGiwpF+c1t/l8thQ3YMr/NmdV3TjF3XCaN?=
 =?us-ascii?Q?bzU0Z9MG7aH+/IK8P9GI9mTLyk7JUBVyUUZCFuWM+PjmkGkzerQgcs0J//Aj?=
 =?us-ascii?Q?gc9pV7k0GOg/VwooQ1QWpHqc8Pn5PuIQaJNK7MTWuVpGDcI0YK6fJvQJQRtZ?=
 =?us-ascii?Q?zisFebRBFAmzcpNOBDdrAL2CFWaHGie2+zk6rQOM9OcNaFSiVYcnqcXISJhD?=
 =?us-ascii?Q?9+/K0hKAP7dJALrNjzc+3HtX+GUlCjE0oQSS?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(376014)(36860700013)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 17:10:45.7195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb65ba3d-65e4-41ad-44c9-08dd8f1c700c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8455

Hi Ard,
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Move any variables accessed or assigned by the startup code out of BSS,
> and into .data, so that we can forbid the use of BSS variables
> altogether, by ASSERT()'ing in the linker script that each symbol made
> available to the startup code lives before __bss_start in the linker
> map.
>
> Changes since v1:
> - fix build error due to missing declaration in #1
> - work around Clang complaining about the ASSERT() expression in the
>   linker script
>
> Cc: Yeoreum Yun <yeoreum.yun@arm.com>

Sorry for late.
with commit 117c3b21d3c7 ("arm64: Rework checks for broken Cavium HW in the PI code"):

Tested-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>

Thanks!

>
> Ard Biesheuvel (3):
>   arm64/boot: Move init_pgdir[] and init_idmap_pgdir[] into __pi_
>     namespace
>   arm64/boot: Move global CPU override variables out of BSS
>   arm64/boot: Disallow BSS exports to startup code
>
>  arch/arm64/include/asm/pgtable.h |  2 -
>  arch/arm64/kernel/cpufeature.c   | 22 +++----
>  arch/arm64/kernel/head.S         |  6 +-
>  arch/arm64/kernel/image-vars.h   | 66 ++++++++++----------
>  arch/arm64/kernel/pi/pi.h        |  1 +
>  arch/arm64/kernel/vmlinux.lds.S  | 10 +--
>  6 files changed, 54 insertions(+), 53 deletions(-)
>
>
> base-commit: 363cd2b81cfdf706bbfc9ec78db000c9b1ecc552
> --
> 2.49.0.987.g0cc8ee98dc-goog
>

--
Sincerely,
Yeoreum Yun
