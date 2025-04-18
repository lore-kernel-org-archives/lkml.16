Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11022104.outbound.protection.outlook.com [52.101.66.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C83E253B54
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 05:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744953674; cv=fail; b=lngSccXCoYf9/KAvTKUDe680eQZr/cfXl3AJEMJj3v+WYNh4d642W1N/bYei4cJBBYjFS9ouCdS1m3tBJnPrRWghjAGA+FAR9c3vMDTItne0O1nRdvaQisfIhSK9LmduRzmnBf+1watMI/YIsdv5QHga1e+wiq5XichBjvuPU5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744953674; c=relaxed/simple;
	bh=1nrOrrzUa7N114j5iStSv9w+7lV3Dnddxa4+HrIFT/s=;
	h=Message-ID:Date:From:Subject:To:CC:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FQxL+Hp5tyouTrnSCMog/k/E/tHDbPP3XR4CeAQHmTdcaWPllKnwTpnKU5puVAjWeNEqVVzrc8y4huw0ZGNFDo7jHEw+e8uRfbPCPXm3wCbx3aUKd5yT0EQdd45ObyY2qI3HUnKRJgoQ94nBTcG0WK423oKHy+ppDD9TRz60sxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=topic.nl; spf=pass smtp.mailfrom=topic.nl; dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b=vaLiiNhJ; arc=fail smtp.client-ip=52.101.66.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=topic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=topic.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b="vaLiiNhJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zDAB6rYAhMtyQ9rtWPbCz/n7I1v6NsOiEVu7PojLYwEfB2oWweLRYLK56kFdWIRyad98agKmo9gRb5OyB+XSwDN82q4p7ns66UoXvhw2iqyzWF1UKxLqiRGT5oo6aB53kzJ/4M0mLr7OrLJKikxos+PwFwEmrE4L0ORWdKGMRuFqObotESjvLBx636A/3Zvn6298SJWmV5tJfCVoDR3rr4jZRVZvAC4lNh3iUVZhTeG740iJ+9nDS9JuSPtlApgef565cDj/ErQCgIt6DV/TqdxRNuHCt55mZnZw6xZ/azyMpajpFuW0Ieh2k89NuuGVqx1C5fxNpbEStFdP2xFrRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qnSTU2JjNwSex3SoR9Gwubj/ERZysezxTrELnQWKRLs=;
 b=EmRhVB6IPD3+NL3FJMBBQiJMgKAhqs96+ZeRj0LUaHyCzpRxTvVlXmx0BlieCKusNq8EHgB+giecoCxDTxzg5w2SV1pF4tLucbTmA56/XQSAH1Z6aanTr5+9u8pseF9+8EN8Nx7UWyLhhkGQkCMPsuEhUS1nucOjmBgYRKxWu6oCYOLlm3r0hNaVnDAXsfvji/HN/wRtKH6nQHwrwVgB9iq/tvA88t+dVaiTWviN6NLG6VtecHbtCJZlxEhN9NA4JRTZL0GdHBk+esK+dA4aPDG7lM5rQwsQ1YosRHY1LVOgAecJ3uN7z8oKhOO0RTPjPIjXWCMJ6r7OttmsS8615g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=topic.nl;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qnSTU2JjNwSex3SoR9Gwubj/ERZysezxTrELnQWKRLs=;
 b=vaLiiNhJOz/dMC6jlBpDPv0bm0jLDtznCv6/9XO+jbP2VcKwLimD+FCUqeUng47N/eV3r+qeO1ZKg+anF3kPH9JBQgxSi7AXTGr8omRvm8spaIVw2WG/CV9seb/5GsO0h0NiaIiO8bhWm1Y4TJmh3YKnruCao3LFLpa9akrTdTStHlmAjTUNm7StFv045+DpJMerV6JfOntu1fnxTXjHCI+4jT5BoOQjvtuBySG49nLVV4VU+xbEysJcFK4iFGauyAleI7bOg8suXo+71oMK9yDalWFKZzlRjcoGRhoVcTUpx30lqYm3vlWpfkECPDVlP8nDhowjxlVTBeeOA1JLsw==
Received: from DUZPR01CA0307.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::23) by GV2PR04MB11143.eurprd04.prod.outlook.com
 (2603:10a6:150:279::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.25; Fri, 18 Apr
 2025 05:21:03 +0000
Received: from DB5PEPF00014B89.eurprd02.prod.outlook.com
 (2603:10a6:10:4ba:cafe::50) by DUZPR01CA0307.outlook.office365.com
 (2603:10a6:10:4ba::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.23 via Frontend Transport; Fri,
 18 Apr 2025 05:21:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 DB5PEPF00014B89.mail.protection.outlook.com (10.167.8.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Fri, 18 Apr 2025 05:21:02 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (104.47.18.105) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Fri, 18 Apr 2025 05:21:01 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by AS8PR04MB8198.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Fri, 18 Apr
 2025 05:21:00 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%5]) with mapi id 15.20.8655.022; Fri, 18 Apr 2025
 05:21:00 +0000
Message-ID: <157fc2d6-4f87-436b-974f-413b2ab0a37c@topic.nl>
Date: Fri, 18 Apr 2025 07:20:59 +0200
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH] phy-zynqmp: Postpone getting clock rate until actually
 needed
To: linux-phy@lists.infradead.org
CC: Kishon Vijay Abraham I <kishon@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.3533c34a-bc4e-4021-a0e1-58fb0d3ad4b8@emailsignatures365.codetwo.com>
 <20250314150431.28319-1-mike.looijmans@topic.nl>
Content-Language: en-US, nl
Organization: Topic
In-Reply-To: <20250314150431.28319-1-mike.looijmans@topic.nl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4PR09CA0003.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::6) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AS8PR04MB8644:EE_|AS8PR04MB8198:EE_|DB5PEPF00014B89:EE_|GV2PR04MB11143:EE_
X-MS-Office365-Filtering-Correlation-Id: c60dd978-aed6-4e1f-6bd2-08dd7e38cfe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Z0FycTZ3UDhKK1k0d1BCWTU4ZUQvMVRmMmdNSVJQOVpTaXhaVnZOSDhIa0hG?=
 =?utf-8?B?YnU1ekZWUndhZkgyMlJqUDd3RC8rc0w1VjJka01UYmxSNDB1cGQwditQMXM2?=
 =?utf-8?B?TTRvaDdKVXFLQk5SVjVzOVhEOStLcHdqYldDeDF5N0UyZGw4Nk5mM0NRbUJk?=
 =?utf-8?B?ZWpOeE5jNXZBT1FUMDY1RUVTT2lSVC85bXdNVjVLa3UwL0srUkVHKzdZWnp0?=
 =?utf-8?B?M2padUlMVG5SckNUOFJlZmpFQmZwTUw2dkU2elJUZXo5ZlA2ZTVXN0ptcmdH?=
 =?utf-8?B?L3BNazRtZmgrOFJvNXVHRTFqQzJSNkFZVVQzOExkTW5nMklGSkV3M3BreDEv?=
 =?utf-8?B?eDZxSWtyd3Q2SUk3dGVCeG9JKzJweXc0WmxOditJdVd2TTlpWTNJWmFjcFZ2?=
 =?utf-8?B?Z1pPVjI3RkZOR29lSFpoalh4U1o3YTdYZUpaS3FYQWQ0b3ZjYnRsaGxJWXNZ?=
 =?utf-8?B?TXNtMmk5aUlHbkF0NUExaEx3SnJVZFpOUFZscjVLaE91MjJjWWFPSGRzMXdV?=
 =?utf-8?B?dnVVd1dXVVdkVENNUy84azQ5MFlaVDhjZUhJQ2doTDgwdHNvdmd1OVBmRXFL?=
 =?utf-8?B?ZGZzM0s2cEtWY1VydDdPcm5neUk1VDArN1FmSEFxOTZDVmNidElzTWRldkFs?=
 =?utf-8?B?RUhNU293UFNhbmo2V25KT0FJVmFWUlVqbytOWGdpdEtadEw2T3Rldk1zeDBJ?=
 =?utf-8?B?Q0kvYU9rdzQwNVR2M1dyNVVmNDBBSVpYNjN1bWQrd2xyd1dJSUQxaithVU9K?=
 =?utf-8?B?S0ZabnQrYVFzdDRTY2Q1NnRlOFZGNjNsN3pJbWhTUVYrd1RhZHVlTGVHZ0Ny?=
 =?utf-8?B?RnhCWGgvQUx2STFyWjUwb1l0NDJEY3YvTlNpVis4bFhOeVFhM256aFRRZExR?=
 =?utf-8?B?V2d2bHRwVHp0eEEvQjdRZmN5VWEyakNQZk9zcGpoUmVOK09JTzRmK2lOUUZC?=
 =?utf-8?B?c2FPK20wSy9UTWorTUw3S2RoNFQ5NzRhckwyMkJpSDM0Rnk4Z3d5ZHpkU2R6?=
 =?utf-8?B?NldnbW5qNkxLekZsbnR4dDNERG9OYjRXTkMxbTdOOVpSeit6NnJieThFMG11?=
 =?utf-8?B?SFI4aWJkVVdsaVE3S21VT2NVTUhFK2RKblc0QjJNMzZaSnJnQjZjZUFyUGxz?=
 =?utf-8?B?dnFNWjhqTUplRGhpUytvUW5ENkU2VU5ESENvQ0tuYkxQMXZvQzhidjR1V0Js?=
 =?utf-8?B?N2U3c1FIUmFDZ0g2TmhTaHA5WCsyeEpxVmhiSE9oS2R0OTBwQWtkam01RE5t?=
 =?utf-8?B?V2NUa25MdDhuZlA1VVFUM3JkbFN5OEFmSFM5RkgxTDlrZEhUSGpTWkM4a1dI?=
 =?utf-8?B?aU81NitSbnd5ZmNrTWpkSTIrUElGUmN3V0NjUm9TR05MSkw5RldJUldJdUNt?=
 =?utf-8?B?OHJ6eC9EMTZsOHgyem96L2RQZjdkR1hTaXJaK1puTWpqemZ2QVhKM0lCN3dj?=
 =?utf-8?B?UDY0L1hKZ2NsckNrMVpRb1BlRmYrbjdTMlJPdS9TWHlEL3pXeEZlSk9GZ0FW?=
 =?utf-8?B?NWdwbUZPS2wyZUNVc0tQVkxXVUllTlJGR2hRN01MY0V3V0cvOVN5WE1MK1Nm?=
 =?utf-8?B?M3BWUXd3b3gySnY0OVZxRnNnQ0YrbzRVejdJU01ac2tGUXY5VFM3aGFCRjdl?=
 =?utf-8?B?VHUvY2JKNXlKb3BmakFTT0ErcndLSDViNyt0REZFTkZ1RGZ2REpkd1ZaVEVB?=
 =?utf-8?B?eEp3YzBYanErNjVxN25ld25zTmV3SzVaM1o3QUEzVFNJS3QzRWlSaFVSdDRF?=
 =?utf-8?B?V1lrdGRIaW5HNGliaTlCdkp5UjRqMVU0dWsyWE9yZTJsMzNxdHVsUnQrUzN3?=
 =?utf-8?B?K0VSU002WnNyTEFXK2NUOVlscmJvald3dFJjemhBZFU0ZUd4QjhBTm0waHBk?=
 =?utf-8?B?MC83V09GTFkybzE4U3V5aSt4Ry9pRnQ2allrWFV6WGhuZkd6aEFHeVdnTU9t?=
 =?utf-8?B?QWg1MUgyL3FsbXJsaTdDbXVjdnI1YUpScjl0YTlxNENCWjE1RERielIrZVNh?=
 =?utf-8?B?SS9FTm05UktnPT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8198
X-CodeTwo-MessageID: 1b028f5c-1562-463e-a2d2-7f9b3473492f.20250418052101@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6b2b56b5-e048-47e0-09f6-08dd7e38ce8a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|14060799003|36860700013|376014|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bEJQamRLeHlGcHdVeUNqVW5vUVZKRWxRSlpERHc2bWpscnNqWS9RWnZmVjV6?=
 =?utf-8?B?N1BuZnpKaHdRcXV6R0JlMmRZMmVPQlRWeU5pV1pyWVVsQWNPdEd5RGMxU3Z0?=
 =?utf-8?B?UktMVVVMNDVaZ3BBZEJFWVNEcm9DNkxrR0w5T2pNcjgzQUwyTTZSWmJQZEtT?=
 =?utf-8?B?WkdqVE9LNW13dEZucCtpdzhpeS9WcFVFbDRqWmJtT3hIajgyaVNadWtRK0VX?=
 =?utf-8?B?dE90T0FBQjBNQm5GRFJvbVVJQ0dGTXFxMlZsbzZtM3JEWkJMVFhHd2tPR2lG?=
 =?utf-8?B?WlJmbWJENGhEMXhaUmFhdGZ3d1VYTFJkTkJMdFdxU0ZWYmo5MGxaNGZRSFJ5?=
 =?utf-8?B?T2NEb2V1RzE4eEVMdFdPZVVDVGd0MWVWR096RWFJTHJOZTE4Sm9UTDdseVpK?=
 =?utf-8?B?Q0preVlOVm16R2Z0MW9Fd1QyME5LV29NalBGcjNnWE8xN1hkL0Nia0p5SW9Q?=
 =?utf-8?B?QkdWWTVDeVZ0eG5lbk05SXJrS0FkR1hIRW43Uy90d044Snc0Q0xYK243U1Ni?=
 =?utf-8?B?d2sxbk92SVhqeWFFTUk5RlFhSkZQMm9kWEZ4TThqY1paaXBQSEwveUhjcGtM?=
 =?utf-8?B?cGpZWUFHYUlKd0ZxQTVCR0xyTURqUWptSmY0R2hDYXFyS3VtcW9pbktFWE5T?=
 =?utf-8?B?dkVaSXdWMEV6ckZsT0M0WSttbzIyL3NkYmxpTG1BNGJXWlRCMjFxY0I4RFJq?=
 =?utf-8?B?ZEJDRC81c3Bub1MvakN0QU42UWgxVGhkWEpNY0RMNlFBY3ovckRXWDk4V0NM?=
 =?utf-8?B?amlKcnlITnIxWWRIbjVIcmdPRTUxSGJNODdrTU45K1BjRUpzelg3S2ovMThV?=
 =?utf-8?B?TGhqTXZvaGczNkRFZmhVQVczamdzbGQ2SHhOSFRoUEVnREVmQzNwbUNhS0di?=
 =?utf-8?B?bW84amg0K1JSVnU0UlplMXpsYUpMQUU2aEVUTllSRk5EdGVQSXVGNFE1cEVJ?=
 =?utf-8?B?SlRyT0ZjV0xRczR6dFdXVERyZnVxWnFFOGZCbXBXVU1sZEhDeU9sdlp1c25D?=
 =?utf-8?B?ZkVIUkxrY3pJaWp2emc0VlFSSmg0SHZKZXdLeDBJcm5mUTFYS21YQ0p4Slpo?=
 =?utf-8?B?VTFLRk1YY2RraDgrU01aLzc5czVJNGlFaXZRVTlGeldDUnptcUdCdHVnVmVq?=
 =?utf-8?B?ZGFoSmpNNTdkdGhNVW5renVWSy9Edzg5SjJNaDdKUU1Vc2p3blJlMXd6ZDhn?=
 =?utf-8?B?UEZJbmV1emh2S3lyTklIQmk5NGhLOTFPN3dsV2orc3krZlpETFJweHhnU09n?=
 =?utf-8?B?NVN0QWJMbWFodG1TMVRrYVFtMEpvV3NyMmNnWFJxeGh6dmlqVVZwSHNPQkpk?=
 =?utf-8?B?VEJ0a0pnVTVoQTNaMjl5QUFFa1hDSXE0RVpVY2Z5VVFhdSt1dTZkTlQydy9t?=
 =?utf-8?B?dFJuNzVZL29nZ0tRdlNlOG5COTcxbUdJYlc4ODNaVDFadW9nVkxsRnkvZklo?=
 =?utf-8?B?VnU4THlHOVdWQitDVzBDQWtsa25lQlNyMUM5ZUdwYmpzTXl0SXpZRWNLa2w3?=
 =?utf-8?B?eEk0cDB6OUxXNWNjVUdJaml5MVc1UnZmbkhsTkRwdEdGT0h4d0VKZDA5UHEv?=
 =?utf-8?B?K3FSNkZCa3FYbzFySXRya0IrS1FHMS84NXVQbjhKeXBnMnJNV0xqZlpGUEdT?=
 =?utf-8?B?OVozRUwzTjM2TkZqUTNjMUVOOTlUNzRnN0pZMzhVazJoR1IvbEUyS2UxN0tW?=
 =?utf-8?B?UVE1bVpSMHNVWHFadFBpYTlVbjlBVHNWT0pTMVZNMWh2TkhJNUxReFpHQUlq?=
 =?utf-8?B?THp3aTBzd1JwY2QxK0NUZUJ4Q09KdzZHRUwybm9XeFVaY2JaT1dUeDI1bisv?=
 =?utf-8?B?V1N2dy8vbVBKZDFHb2Fyays5c1pnMmJwclNmd3JzR0NjTkdiMjRjQTdqTXpy?=
 =?utf-8?B?UTVYYnJIb1FBMXRkMTVXSDhzRk0vZ0MyVDJDZU1maS9kbFkxU3VTU2VwNHJG?=
 =?utf-8?B?c1FYaENETmM2L2IxSFRTUXFVTWphcFI3N0tpR2IvU2s5NDV2WFpPMjQzSU43?=
 =?utf-8?B?L2J0QTMwSGN0N2dVeXNmRlhnY3EveFVYUElYZTlpUzJWT29aSXhrckRtaXUy?=
 =?utf-8?Q?KASBHB?=
X-Forefront-Antispam-Report:
	CIP:13.93.42.39;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(14060799003)(36860700013)(376014)(35042699022);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 05:21:02.6592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c60dd978-aed6-4e1f-6bd2-08dd7e38cfe7
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.93.42.39];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11143

Gentle ping, any feedback on this?


On 14-03-2025 16:04, Mike Looijmans wrote:
> At probe time the driver would display the following error and abort:
>    xilinx-psgtr fd400000.phy: Invalid rate 0 for reference clock 0
>
> This issue was that at probe time, the system has not decided yet whether
> the GTR is to be used for SATA (150MHz) or PCIe (100 MHz). The driver
> doesn't need to know the clock frequency at that point yet, so wait until
> the lane is actually being initialized before requesting the clock rate
> setting.
>
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
>
>   drivers/phy/xilinx/phy-zynqmp.c | 61 ++++++++++++++++-----------------
>   1 file changed, 30 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/phy/xilinx/phy-zynqmp.c b/drivers/phy/xilinx/phy-zyn=
qmp.c
> index 05a4a59f7c40..e29e3e51d380 100644
> --- a/drivers/phy/xilinx/phy-zynqmp.c
> +++ b/drivers/phy/xilinx/phy-zynqmp.c
> @@ -222,7 +222,6 @@ struct xpsgtr_phy {
>    * @siou: siou base address
>    * @gtr_mutex: mutex for locking
>    * @phys: PHY lanes
> - * @refclk_sscs: spread spectrum settings for the reference clocks
>    * @clk: reference clocks
>    * @tx_term_fix: fix for GT issue
>    * @saved_icm_cfg0: stored value of ICM CFG0 register
> @@ -235,7 +234,6 @@ struct xpsgtr_dev {
>   	void __iomem *siou;
>   	struct mutex gtr_mutex; /* mutex for locking */
>   	struct xpsgtr_phy phys[NUM_LANES];
> -	const struct xpsgtr_ssc *refclk_sscs[NUM_LANES];
>   	struct clk *clk[NUM_LANES];
>   	bool tx_term_fix;
>   	unsigned int saved_icm_cfg0;
> @@ -398,13 +396,40 @@ static int xpsgtr_wait_pll_lock(struct phy *phy)
>   	return ret;
>   }
>  =20
> +/* Get the spread spectrum (SSC) settings for the reference clock rate *=
/
> +static const struct xpsgtr_ssc *xpsgtr_find_sscs(struct xpsgtr_phy *gtr_=
phy)
> +{
> +	unsigned long rate;
> +	struct clk *clk;
> +	unsigned int i;
> +
> +	clk =3D gtr_phy->dev->clk[gtr_phy->refclk];
> +	rate =3D clk_get_rate(clk);
> +
> +	for (i =3D 0 ; i < ARRAY_SIZE(ssc_lookup); i++) {
> +		/* Allow an error of 100 ppm */
> +		unsigned long error =3D ssc_lookup[i].refclk_rate / 10000;
> +
> +		if (abs(rate - ssc_lookup[i].refclk_rate) < error)
> +			return &ssc_lookup[i];
> +	}
> +
> +	dev_err(gtr_phy->dev->dev, "Invalid rate %lu for reference clock %u\n",
> +		rate, gtr_phy->refclk);
> +
> +	return NULL;
> +}
> +
>   /* Configure PLL and spread-sprectrum clock. */
>   static void xpsgtr_configure_pll(struct xpsgtr_phy *gtr_phy)
>   {
>   	const struct xpsgtr_ssc *ssc;
>   	u32 step_size;
>  =20
> -	ssc =3D gtr_phy->dev->refclk_sscs[gtr_phy->refclk];
> +	ssc =3D xpsgtr_find_sscs(gtr_phy);
> +	if (!ssc)
> +		return;
> +
>   	step_size =3D ssc->step_size;
>  =20
>   	xpsgtr_clr_set(gtr_phy->dev, PLL_REF_SEL(gtr_phy->lane),
> @@ -823,8 +848,7 @@ static struct phy *xpsgtr_xlate(struct device *dev,
>   	}
>  =20
>   	refclk =3D args->args[3];
> -	if (refclk >=3D ARRAY_SIZE(gtr_dev->refclk_sscs) ||
> -	    !gtr_dev->refclk_sscs[refclk]) {
> +	if (refclk >=3D ARRAY_SIZE(gtr_dev->clk)) {
>   		dev_err(dev, "Invalid reference clock number %u\n", refclk);
>   		return ERR_PTR(-EINVAL);
>   	}
> @@ -928,9 +952,7 @@ static int xpsgtr_get_ref_clocks(struct xpsgtr_dev *g=
tr_dev)
>   {
>   	unsigned int refclk;
>  =20
> -	for (refclk =3D 0; refclk < ARRAY_SIZE(gtr_dev->refclk_sscs); ++refclk)=
 {
> -		unsigned long rate;
> -		unsigned int i;
> +	for (refclk =3D 0; refclk < ARRAY_SIZE(gtr_dev->clk); ++refclk) {
>   		struct clk *clk;
>   		char name[8];
>  =20
> @@ -946,29 +968,6 @@ static int xpsgtr_get_ref_clocks(struct xpsgtr_dev *=
gtr_dev)
>   			continue;
>  =20
>   		gtr_dev->clk[refclk] =3D clk;
> -
> -		/*
> -		 * Get the spread spectrum (SSC) settings for the reference
> -		 * clock rate.
> -		 */
> -		rate =3D clk_get_rate(clk);
> -
> -		for (i =3D 0 ; i < ARRAY_SIZE(ssc_lookup); i++) {
> -			/* Allow an error of 100 ppm */
> -			unsigned long error =3D ssc_lookup[i].refclk_rate / 10000;
> -
> -			if (abs(rate - ssc_lookup[i].refclk_rate) < error) {
> -				gtr_dev->refclk_sscs[refclk] =3D &ssc_lookup[i];
> -				break;
> -			}
> -		}
> -
> -		if (i =3D=3D ARRAY_SIZE(ssc_lookup)) {
> -			dev_err(gtr_dev->dev,
> -				"Invalid rate %lu for reference clock %u\n",
> -				rate, refclk);
> -			return -EINVAL;
> -		}
>   	}
>  =20
>   	return 0;


--=20
Mike Looijmans




