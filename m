Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023078.outbound.protection.outlook.com [40.107.44.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A214EEBA;
	Thu,  3 Jul 2025 02:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751511102; cv=fail; b=FKbxGsnbqdnMStxtUOufOPEGIyECqzbLsrIefumHQwx8JwsEpaaJEZB54qS0wrAQmTXDIf+aX8nc01unDFuZ/Dq6LxXX1kY3+fFSSMM13+mmvN/EB7fipsePJVUTk5nJFOp25R+2UjX2T2n0mHN+ZoZ2kGXMddNXe1RTjwTk/UQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751511102; c=relaxed/simple;
	bh=YQbONxVXNdKaG/O/GKlJMZl1nQcSpYLKJ9YjPqsp1NE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RJf7yW8t7QcSYKAPQjpsUE3lizoZKfVhLSri4lMbAOaBka1pLoTtN24WRZrWIs66C3YsmhmBiKGd3caCnGCbhOZBqvbgwIllODYwVbCSADterLw+IP6sAnMFLvYBvZY5tv3qxkBnA/Txlc+cI7aWDilKDHnVe2JF+sfJ5EzexHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=vzh4G0Vj; arc=fail smtp.client-ip=40.107.44.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="vzh4G0Vj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hj24N5jYahozE2dIyMq/WJYRIgn+da8qLg+oIcpWK6MBvREJwyh6CvjXstYb2HB4g3fLjOZPoOBQXNwJaJkSDfdt9ffglPujy8nUM3vOrJBTtHBZ+y9BF1KSxAYRxgC50bKp3MFF7WurNb9/NWJD7nrEylxlepBjhGYuLhaJr4NUda2rdAFQbuVac8fGNC3y8Y3BzWjTMLp0pS2zfsoT331dNdN9cu9wxF6H9tCUPF59LGpzwWYC5BvePY7gL92CyUGWNVkX7dlVPGy5gKSmVwNaK87+6nHL/EUx+Tt1ey1VH65HIPsK81P+1LbzdziY/S35gKuiRkeOk6lieRG7Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nwYzLXpR7+Lo4b4c3aclCFeudGQwF3VoShjYdZKfSqQ=;
 b=F2/+Ce6+LBtIjcVMp4EFlFzlrLIspkzpv9u6Fej02/RjnRP3SHUeMumtmXSPtKoeUTr0dpZhdhrjldUfh7YoeEMbqMy+Bp5+dy6s2dP05ULL43Ac8vkEdtiZIE/UQX/bYcDcwH2a8/uXljX7z/ELcz590YFGt6gwdv80ypGU1P/K4mvxQToAWd7WbYfQ7C/+fKGcs1uGaBuPX3BGzLRBPwQLnIVek0IqAA0LWTjakVw49Q296ZHCBXfOPiiFJNu6wkUuOWRmxNKkQUK7e0cGV1TNXZjaBu1yi8era1oQ/dll1mWQmmqjPSQkKLFRWedhI1/fBBlRe2PA1lpcaZbWHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwYzLXpR7+Lo4b4c3aclCFeudGQwF3VoShjYdZKfSqQ=;
 b=vzh4G0VjpQ/oLZJAqpxRLQ4Hj28dUnedj/X0nfIdpy3p5z68lmqqVOWpqiOe9AkvM97E474uNF13MyHXp9Wyetm+j3yahVspKwFZiI+grHhxOYVexsFKIXtj9LAr6phKpwIYgs0ExsfSkk2scstmlJ8Tea8DNIRkMSsNZG460+LyJEjbDN8XCD7oj9Qyn+gP/EXNWxkld2B8SRsMUzaEZ1D3octteTcAMF3NQpZYPYenCW3rCnx20pvBTd5Kf2aKK/W75wvHIevt855UBQniQZhikMTH5AvtFS+blqJ2NYetEtKeG3K21GROIdSkOPKJT34ory/syx3meiDrcLy8ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SE2PPF4D1B6798C.apcprd03.prod.outlook.com (2603:1096:108:1::496) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 3 Jul
 2025 02:51:34 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%6]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 02:51:33 +0000
Message-ID: <eb233f20-1927-4944-9b57-f90c998db19a@amlogic.com>
Date: Thu, 3 Jul 2025 10:51:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/26] clk: amlogic: c3-peripherals: naming consistency
 alignment
To: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
 <20250702-meson-clk-cleanup-24-v1-5-e163c9a1fc21@baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-5-e163c9a1fc21@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0029.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::8) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SE2PPF4D1B6798C:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b6b1c43-416e-4797-55a7-08ddb9dc849b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ejRnSFBMdkVmSFUrYkhwSlpEcDRqZXZMNEVpam5qRk5rYjFwQW9NMWZ0OGxK?=
 =?utf-8?B?cThlOWF1b1Y4RnJSMHptUWdQd2J5c0F3UnFoUGlpMEorUEVsZDIrM1NiU25h?=
 =?utf-8?B?M2xkQ1JxVi9mb2gzQ3dXdU45OHNJMzV6OVBwWmtzY00yR0VWcG5mMVRHL3Zu?=
 =?utf-8?B?T0ozYjBsZDhOd0c0VkFoQUt5Q0gveWdUbStmY3VoNmlKdUNFZUdiVElQYjJT?=
 =?utf-8?B?TGNlUlljOUc2c1dFYXFwRE1pUmo4V09JY1UxMHE4WHN3bmh1anp5VHhpYVNF?=
 =?utf-8?B?VE1rVU5YeHRvUG5sT1BZdU1QaS9TNGpEY1VMcGQ3ODNXaGlORXl5ai9qc3U1?=
 =?utf-8?B?b3pjSk1nSlhueTA5MjF2K1JsSXdQOFNOWGQrM29ybnp5ZkZyLzZmcXQ3eVd2?=
 =?utf-8?B?b1doR1N4NCtERk1LNURMdXhzQ0RrYzB6b3lwdXdFdWNBOWpMMk9yVm1YcTE3?=
 =?utf-8?B?WXV3T3pzRFA1NkhndmhEL1Y3bzJGeHlYZFNadTNBQUEvZm1CLzhsQ3UrKzhs?=
 =?utf-8?B?YjRVR1d1UGtLa0dodWt2UEtKdlpnMit0ZXUvNkpvZXc0L28rTmFwSmNrV1BQ?=
 =?utf-8?B?VmNFMitKaERrRXBQNC9PVVlqUk1XckdjRGtWWlZaKytScy9JbHVNZ3hYLzJW?=
 =?utf-8?B?WW52OFM1WVFwSk1nRnF6UXZmcm1RV29qSlZpYmZKMEsvQUhEUEpBekR1ZWVL?=
 =?utf-8?B?eDJEYlVET3NUWUgxS2VqQjhJZVg1eUJxcFoyNTRXZ1J5NlNiOXA1VWVkWWpp?=
 =?utf-8?B?NWthZzA0UHhidzQrZVh1VVRBcC9KQWpEdmZpL3FhdmFFK1MxZVovbFBLRjNk?=
 =?utf-8?B?SjRLOUxRTVRwSnB5Ym5OdjVKRjBXOWozVi81SFQyV3poY3IvSkcwUy9wWGhq?=
 =?utf-8?B?dFBoTkQ4UjhXQnQ3cVVpbklSWVdXY2RQM0tZQjB1SlhlMDFwSEQwaG5qeHJ3?=
 =?utf-8?B?WFF0RTNPdVBjcHlZMHRHV0pheG5qNkNDcGt5R2Jpc0dkSHZwK1hpVHVGL1li?=
 =?utf-8?B?WmNrb3I5bExBeVNwcXg5d25ER0wrVENOTkRaMFNIcjY1UjlCVW1EbHlmYmty?=
 =?utf-8?B?UmNXMzk0QTcyUDFYbUtKQkFtMCt5TEtjNmFHNitSZ2dSc0Jsd0tiVWNFU3F0?=
 =?utf-8?B?dXdtWjlMMC9aZEtNb2YrTXVseG45NnYxWHN4czh6YWpBdEdlQ2t2dXcxenpK?=
 =?utf-8?B?YnVBbkU5dUF2ZnBHVzZNL1liNnVSWXVweGlCNVIxU09uWlhTRnNQbVpxTmJn?=
 =?utf-8?B?aFVrL3ZSdDNLdXIrb2poYm5TdVNVeERoRDdOZTMvYnRSdHdMTXY1dFJWSmNY?=
 =?utf-8?B?d1Fic2ZtRjdKemhVZm5jdVJMOG15OUpzWEU5dUxLL3F4WWpiWGlHWXFkV1l0?=
 =?utf-8?B?eVozV0gzeDlFaVkzbFhjY0lNU0h3L1lrKzR6WjVIRlNBUWFXTm5tQmtYeCtq?=
 =?utf-8?B?VlcrMWdDQkxPWGEyWWJMRG4vaFFlRmxLLytjRTlpRHFKZVVPL0tMQzZCelov?=
 =?utf-8?B?R05LTlZRVmpwaTRCVndydVM1aDFNUU5uZXJFR0xhUEx6cVFXQW1nZmV0NjBU?=
 =?utf-8?B?K040SjdBZGtxM1NrQ2xaTWhWUGtqbEhHcFptbU9tcDBCU3VCMWloL29CR3Er?=
 =?utf-8?B?cTN3b3ZtQ3VURk1mdFpFOFY0c0FLNHBMN05MRU9jblNNTjdJdHRoV1lxNFZE?=
 =?utf-8?B?Umh3YW1mZHZWY2JvTC9JbmNvVE9SM2NtYjhKRlU3OW9qT1paM2FDYjlBdEpN?=
 =?utf-8?B?anlyanNRUDdqU0JnTEVVVENzMXlrUDBJaWRTd2ZzM3BmWTR3Q2pXbjhzYmZu?=
 =?utf-8?B?OS8rdkNrRUNHdmd3ei9rWmZOQ21iUDdBY3U4MnlFdkdXY0x6SGNPcWhRelc5?=
 =?utf-8?B?SE0zcGpNMVlmUGVXenJnem45aWlqRUkwT0IvVzFYUjFpT01NalY2QVVRb2d5?=
 =?utf-8?Q?vi2rwzvJKOw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2RnUXVENFd1Y2lTOGFvenFlOTBBSm03ckx6SG9kYVBmV3BxTU9DcXhnc1lT?=
 =?utf-8?B?a3VYaERWOFBRVTZwWnRheUNYRWh1NkpmN3BNeTlWbjd3NHhZNVRuMFBTN3hM?=
 =?utf-8?B?bnBCcTZaN3I2Wm1kSlZiTG5RcHJrbkt5QVNiTEdvRTZnNmgyeWFLRjNSQklO?=
 =?utf-8?B?c2cwTlFRTTZUUFEzMFlKUjhlS3VMaGFHYnh2d0FZQlJubDducWRQeTNKczZh?=
 =?utf-8?B?V1ZRYkZMQ2NxaVcwVXJURFJPZjhCeXFaSUFzN2k5Yis1N1E3ZHNmOWhCL3Qv?=
 =?utf-8?B?a0JzNnExc2xNMDhqa3p4WnNpQklZeE1rdWMyT2cxNWdWZXV5Z1VRZXZVZjlL?=
 =?utf-8?B?bjhVaW9NanZuS0s2Uy9sdW9YN1E4WHZIS0hRNzlqcy9OUkczcTNVeHBHWHZF?=
 =?utf-8?B?QXZlZ2Vpd2c1VHh2YUprUDNXc2lSbmtYd1Q4YTlLWHZncG4yQmpHVWxNUUhU?=
 =?utf-8?B?dThBbEp6T2J3eHY2RUl0Q3RzQk11QW9CaC9rL2x6U1h3N0dRWlhseC9lNE45?=
 =?utf-8?B?bEEyUHJOWXE0UXZHdXVQOU5Uc3JUU2ROR1VodHhZV2VzQjA4RlNLQVltNXFa?=
 =?utf-8?B?SWx0WVl5T2lkRi8vcG9HbVBQVTNhZ1Z4WG5CQ3VtczA0aldhUjNUeXJPUmEz?=
 =?utf-8?B?QXA0NytIY2hoSEx4Q3FsUFcxQ2pOVDdkRFVGd0hrY3pQSEIzQUFqc29Pb3c5?=
 =?utf-8?B?VWcvb2xsYkIyQmwwRGNiaTM1dHRVVkxwWUU0RGhQbTA5Ni9sRXVsdzdEejdJ?=
 =?utf-8?B?YUlMTGJpSGhGMUxjNWRvWktkN2VQVWdZVGhqZTVPK2UySzZlWXlSMEE5czEx?=
 =?utf-8?B?NzlSZ3NweDVrejN5RGkzU08rZ3FCV2xrbGpSampRZmlBdWUyUy82UnRFR3J2?=
 =?utf-8?B?N2tlamNiRWlPNDBGU0JKc01TMEVIUjJNTVBWWmN3RFJraVhkRmg3NnhLTjRQ?=
 =?utf-8?B?TDdpWUZ6ZHF5ekJ0UHJPVVlFSlg4QUNNQXROVnN2KzFKUGNtY3EvRVlWQVd6?=
 =?utf-8?B?TDZFdFRQNWdrYUNWRklNK1lhZ2phZ3phcHhlZFB6cFJ2elpZdWkyelIreW1C?=
 =?utf-8?B?RkhUK3F1ZElGMnRhL2o1bHJLd1dBUUo2VVBtR3BiQ05CUWsrYnZLQ001WXdo?=
 =?utf-8?B?Ull0N2RYdmFSMitTdFJMWVBWMnhaS1pkU0tOeTN5VDMrU1MvK09MMmNJMUNJ?=
 =?utf-8?B?b3BRY0FRVXZQK2Q4b3FUS09MaU1YZ0RqWEdycDFUZnVFTUhhbDNRR3F3NEFz?=
 =?utf-8?B?V2pDU3lnNlN3aUhBTFBQYkhKSzB1VDhUZVNQQzFKYWN5UVA4cVFnS21IcEty?=
 =?utf-8?B?WmdhU0RLY21BeUJqc0ZUK01CYlNvaTZmSmRuUytURkZ3Ym1OaXA0U1UxU3Rj?=
 =?utf-8?B?U3YrQ0tEVC82aGp0NkpsblZSYmZkWE9HV2dHV2kxUXcyRlJIOTlycGdOTFNL?=
 =?utf-8?B?WG90Zi9kUXpEK1ZHNERlVnhSSnpKZVM4UnVoTkZsVUJGcUNrQS81MEhlLzJ6?=
 =?utf-8?B?WUtZQURIdDhpb3ZDSnFiRjFFUXV4eHNwMHAxMTNZVkZDYVV3eVpkbS9YSFdr?=
 =?utf-8?B?YlZuVW1iUE5lbm9tMXFLNG9XVkZGUWFpSDQwNFgvam1BZWpuV0JRQVhsWVlo?=
 =?utf-8?B?Mlk1M1cra2x5clNnZDc0U3Rkb3BFaHM2TVFEMGFUdmR0NGJBUGhPcWVVd3Bx?=
 =?utf-8?B?aGkzU2RJZFZ6bkR6MDlMbkV4Qmw2QUdmTXpqNHBkYlRqamtCcUc0dlQyVE1C?=
 =?utf-8?B?UTlNVm9EV0EybDNZd2I1SE4rRW1tZnN0WXNNd21KOGRIMjVXSWwzUUdsSndY?=
 =?utf-8?B?SkhWU1NxdkxXZWFNcWMwamluVlBUcVFhRlI5QWtXN08vLzRwVTZFMnBoU2Z6?=
 =?utf-8?B?R0E4Y1VLQVBPVHJ2WDZUbnZpaUlUUlRqbm9HQmlNQ2lOSXdGVjJqM3hUTWlM?=
 =?utf-8?B?eG5UbVM1MTIrWjIwajBPWEdPNFJVRzh1MXdBNDU3UitSQXhyVHBSdHp6RVM2?=
 =?utf-8?B?WHNxTmVXeWg1cUZ0NjlrdFhaSjVrd25pZ2pHRXdTOUpkVlgxeW5Jei9QZzJt?=
 =?utf-8?B?YjhVTzg3Um5QbnBiTWltU3E1b2UrS01aZGN0SkRWSXBTWFBjSWl2M3FaeVpw?=
 =?utf-8?Q?erCBlgE7S/ExTklEBlCZM4TjP?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b6b1c43-416e-4797-55a7-08ddb9dc849b
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 02:51:33.7810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3lvt9T/lyvp9zANwPO0uu/tTj9fYho6WIB+2YjrquVtUR7S3pfuXu5Bc0Zt8vQkbPAvtSTI/hyYBQRgj2OBmDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2PPF4D1B6798C

hi Jerome:


On 7/2/2025 11:26 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> Amlogic clock controller drivers are all doing the same thing, more or
> less. Yet, over the years, tiny (and often pointless) differences have
> emerged.
>
> This makes reviews more difficult, allows some errors to slip through and
> make it more difficult to exploit SoC commonalities, leading to code
> duplication.
>
> This change enforce, wherever possible, a consistent and predictable scheme
> when it comes to code organisation and naming, The scheme chosen is what
> was used the most already, to try and minimise the size of the ugly
> resulting diff. Here are some of the rules applied:
> - Aligning clock names, variable names and IDs.
>    - ID cannot change (used in DT)
>    - Variable names w/ SoC name prefixes
>    - Clock names w/o SoC name prefixes, except pclks for historic reasons
> - Composite clock systematic naming : mux: X_sel, div:X_div, gate:X
> - Parent table systematically named with the same name as the clock and
>    a '_parents' suffix
> - Group various tables next to the related clock
> - etc ...
>
> Doing so removes what would otherwise show up as unrelated diff in
> following changes. It will allow to introduce common definitions for
> peripheral clocks, probe helpers, composite clocks, etc ... making further
> review and maintenance easier.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/clk/meson/c3-peripherals.c | 1261 ++++++++++++++++++------------------
>   1 file changed, 630 insertions(+), 631 deletions(-)
>
> diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
> index a25e7d5dc6691d2d4a852e3d3da2b36f251cc141..a09cb1435ab108b2dcc209c6557bcd1988c4ba1a 100644
> --- a/drivers/clk/meson/c3-peripherals.c
> +++ b/drivers/clk/meson/c3-peripherals.c
> @@ -48,7 +48,7 @@
>   #define SPIFC_CLK_CTRL                         0x1a0
>   #define NNA_CLK_CTRL                           0x220
>
> -static struct clk_regmap rtc_xtal_clkin = {
> +static struct clk_regmap c3_rtc_xtal_clkin = {
>          .data = &(struct clk_regmap_gate_data) {
>                  .offset = RTC_BY_OSCIN_CTRL0,
>                  .bit_idx = 31,
> @@ -63,12 +63,12 @@ static struct clk_regmap rtc_xtal_clkin = {
>          },
>   };
>
> -static const struct meson_clk_dualdiv_param rtc_32k_div_table[] = {
> +static const struct meson_clk_dualdiv_param c3_rtc_32k_div_table[] = {
>          { 733, 732, 8, 11, 1 },
>          { /* sentinel */ }
>   };
>
> -static struct clk_regmap rtc_32k_div = {
> +static struct clk_regmap c3_rtc_32k_div = {
>          .data = &(struct meson_clk_dualdiv_data) {
>                  .n1 = {
>                          .reg_off = RTC_BY_OSCIN_CTRL0,
> @@ -95,39 +95,39 @@ static struct clk_regmap rtc_32k_div = {
>                          .shift   = 28,
>                          .width   = 1,
>                  },
> -               .table = rtc_32k_div_table,
> +               .table = c3_rtc_32k_div_table,
>          },
>          .hw.init = &(struct clk_init_data) {
>                  .name = "rtc_32k_div",
>                  .ops = &meson_clk_dualdiv_ops,
>                  .parent_hws = (const struct clk_hw *[]) {
> -                       &rtc_xtal_clkin.hw
> +                       &c3_rtc_xtal_clkin.hw
>                  },
>                  .num_parents = 1,
>          },
>   };
>
> -static const struct clk_parent_data rtc_32k_mux_parent_data[] = {
> -       { .hw = &rtc_32k_div.hw },
> -       { .hw = &rtc_xtal_clkin.hw }
> +static const struct clk_parent_data c3_rtc_32k_parents[] = {
> +       { .hw = &c3_rtc_32k_div.hw },
> +       { .hw = &c3_rtc_xtal_clkin.hw }
>   };
>
> -static struct clk_regmap rtc_32k_mux = {
> +static struct clk_regmap c3_rtc_32k_sel = {
>          .data = &(struct clk_regmap_mux_data) {
>                  .offset = RTC_BY_OSCIN_CTRL1,
>                  .mask = 0x1,
>                  .shift = 24,
>          },
>          .hw.init = &(struct clk_init_data) {
> -               .name = "rtc_32k_mux",
> +               .name = "rtc_32k_sel",
>                  .ops = &clk_regmap_mux_ops,
> -               .parent_data = rtc_32k_mux_parent_data,
> -               .num_parents = ARRAY_SIZE(rtc_32k_mux_parent_data),
> +               .parent_data = c3_rtc_32k_parents,
> +               .num_parents = ARRAY_SIZE(c3_rtc_32k_parents),
>                  .flags = CLK_SET_RATE_PARENT,
>          },
>   };
>
> -static struct clk_regmap rtc_32k = {
> +static struct clk_regmap c3_rtc_32k = {
>          .data = &(struct clk_regmap_gate_data) {
>                  .offset = RTC_BY_OSCIN_CTRL0,
>                  .bit_idx = 30,
> @@ -136,20 +136,20 @@ static struct clk_regmap rtc_32k = {
>                  .name = "rtc_32k",
>                  .ops = &clk_regmap_gate_ops,
>                  .parent_hws = (const struct clk_hw *[]) {
> -                       &rtc_32k_mux.hw
> +                       &c3_rtc_32k_sel.hw
>                  },
>                  .num_parents = 1,
>                  .flags = CLK_SET_RATE_PARENT,
>          },
>   };
>
> -static const struct clk_parent_data rtc_clk_mux_parent_data[] = {
> +static const struct clk_parent_data c3_rtc_clk_parents[] = {
>          { .fw_name = "oscin" },
> -       { .hw = &rtc_32k.hw },
> +       { .hw = &c3_rtc_32k.hw },
>          { .fw_name = "pad_osc" }
>   };
>
> -static struct clk_regmap rtc_clk = {
> +static struct clk_regmap c3_rtc_clk = {
>          .data = &(struct clk_regmap_mux_data) {
>                  .offset = RTC_CTRL,
>                  .mask = 0x3,
> @@ -158,62 +158,62 @@ static struct clk_regmap rtc_clk = {
>          .hw.init = &(struct clk_init_data) {
>                  .name = "rtc_clk",
>                  .ops = &clk_regmap_mux_ops,
> -               .parent_data = rtc_clk_mux_parent_data,
> -               .num_parents = ARRAY_SIZE(rtc_clk_mux_parent_data),
> +               .parent_data = c3_rtc_clk_parents,
> +               .num_parents = ARRAY_SIZE(c3_rtc_clk_parents),
>                  .flags = CLK_SET_RATE_PARENT,
>          },
>   };
>
> -#define C3_CLK_GATE(_name, _reg, _bit, _fw_name, _ops, _flags)         \
> -struct clk_regmap _name = {                                            \
> +#define C3_PCLK(_name, _reg, _bit, _fw_name, _ops, _flags)             \
> +struct clk_regmap c3_##_name = {                                       \
>          .data = &(struct clk_regmap_gate_data){                         \
>                  .offset = (_reg),                                       \
>                  .bit_idx = (_bit),                                      \
>          },                                                              \
>          .hw.init = &(struct clk_init_data) {                            \
> -               .name = #_name,                                         \
> +               .name = "c3_" #_name,                                   \


Prefixing variable names with 'SoC' is understandable (to avoid duplicate
definitions and facilitate variable searching), but is it necessary to add
'SoC' prefixes to clock names?


>                  .ops = _ops,                                            \
>                  .parent_data = &(const struct clk_parent_data) {        \
> -                       .fw_name = #_fw_name,                           \
> +                       .fw_name = (_fw_name),                          \
>                  },                                                      \
>                  .num_parents = 1,                                       \
>                  .flags = (_flags),                                      \
>          },                                                              \
>   }


[...]


