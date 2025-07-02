Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012001.outbound.protection.outlook.com [52.101.71.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE9B2AE8B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 06:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.1
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751438961; cv=fail; b=HA7/gJocP/Bt/pNIBSDhIjIDdIdzXxYr5eCPCuQiYVcwNIxotP/cFn+v8YtbTgfZdvt+FFHOCcM6OJJgMIblJJGV3wg0xZLrbQLFlCcMuSiXRah5LzkvmbnWDrOuiEOAlc2sKw4C1xrVKkbsxvn1igg71yGjdojAMshS/BmTMd8=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751438961; c=relaxed/simple;
	bh=4Bh0keNYiIySTWP1zCiDXIup2Wz1+sqUkFDfG07iN4c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YD4G62DrT/zk30imWCKf+Ysrma8vIocq9OjFRQcZt5jNugTthjRJbfnuoe+3f59IF9Zm0Rfh3nCPMFwqdmy6Rc6NOjVKDZ/UnXmGPEBdgH4pTzzpPABWEe30uq4iUOaYFUE7sC69NtqnA2JEeNJvSG55BrdQOS4wlHDksGSbhmQ=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Sdkh4etf; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Sdkh4etf; arc=fail smtp.client-ip=52.101.71.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Sdkh4etf";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Sdkh4etf"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ExhrAW4PeRC7LRLMWabrn9bsGzn+Ib5/bFZmIwhcAoKgJ9/7hZEUd4C23uHGmIp7tECfOtKxnHGbYyk/etLw2I1lEHdt5sqxqviTUTlWEvS7DTU3cPnNGGQ7ytJPc7RHcuwyRMEqELPB7K6eSj+R/YFe/CFRJQcaevmXClaknxoepOiD507trs1/StjaIjeZ24zFYCY5w7V+fmYincx3SYDCLMPzQed0i3vWpLtomFjTndOr2O3en91j2mu90ymeqXG/8DFr0l3cOpPNR8DYbBUrkEoY1C4daOGUKZPbHKijhaVpcR2W3VKZbR+asouv3yZFDE3+E+Z8ZhS0oI9V+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46BSr9q5vryPS68NOgREV+ImjjJvRNfDFVJNVVE9k9w=;
 b=pmoJgh49/8tmFkrl6nu/AjM8AjUboiuWDTnnkDN35dlPynpk3srefRiApMjgVbLDn7p8CuLzFBxNUkVSim6ge8DgTZeoVo8qQB3/gMTuBGsUV6/w9DR8s5yb9r2flKDDKtNsRJ+5+1yM76+7Semf/VbeOp+8XzvUjrAlEhTTFkGTeeI6+6uHBlCYFGtOl636VMo9mHxeHvarPQUeGZYlhIyPPozl7OsaeMbWhQenLdhleFfGOJYP2KqfF7fNXvE5DfTcCWpjZj40ZCU/Ry5AdSBwuxNrzfrdL7M0LvrtVdZuNJrxKTftbxwP3tnPEnuYvmVeGJpptKf29mX+57mSNQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46BSr9q5vryPS68NOgREV+ImjjJvRNfDFVJNVVE9k9w=;
 b=Sdkh4etfoXuXeRt5bi5Z0niEXgMKR1pKpKOAz3PnjBDiikXaMNR6Gn2rxeMTgGhoJG1ZEVNWDRNLifW7DXF/cqoJ++eUoiIwacAQOUoYrhQFZLynFbX0kOwRzJdGN+dJQt+g1IrY93TxhXq6oRaxsZ03k97fmn4zJ+apDKrz7LI=
Received: from DU7PR01CA0041.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::6) by AS2PR08MB8478.eurprd08.prod.outlook.com
 (2603:10a6:20b:55c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Wed, 2 Jul
 2025 06:49:12 +0000
Received: from DU2PEPF0001E9C4.eurprd03.prod.outlook.com
 (2603:10a6:10:50e:cafe::14) by DU7PR01CA0041.outlook.office365.com
 (2603:10a6:10:50e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Wed,
 2 Jul 2025 06:49:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C4.mail.protection.outlook.com (10.167.8.73) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15 via
 Frontend Transport; Wed, 2 Jul 2025 06:49:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRIw/J3ANzKmnqFnO+G0Bf1NeQm3Qg3xpiMFUOK75vR//kDGd7pEErbocJMtbIBXqQfAVZo1BCU5GO+QMsd9bUkpvUmugzZjeoATQwVrosueK8G+PHL5TUHxzNv9i5hWnG7Ze/Jzo3fuSq9El6nibhRN7nwxEUeLcBfrzxQwlh4Vh0h2YQJ7pGVY4T9v38Ib+0EBhAzYm0HBLYgarNXEd/M4Ufb9qf2C0PZ9rAjDXKyB7AyslaKa8HK4p5HfrZt8EnaXjJpZOoDok9ZF6x3m+R9YHrHHeTc18Sog35exm5xLXZcaR7km5McxNgQCyeO7Vs93N3VT/c+ZCZtdoG3MAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46BSr9q5vryPS68NOgREV+ImjjJvRNfDFVJNVVE9k9w=;
 b=uVwJLnwdyz4uGEt0T8N0ZHmXC21l4rSCjMaIeNpCdfeEPvagOpsaIAkAN4OILatOR81VOLQQ5XtkWlljF0vE7wAZSDud+SWdhyALN0VfPuWEbqXDB4QOzxefvmQqs2bA4z2trT9Jf34WNH1V0sNkqvu690sEEH2szbKUiejHSvFeWh0vdjJYXLa4rEDPdcNYDfc/4yVhBEfmrMHeUElHKh/m/O1s1J7PTS9j8LEJp4tSqDR0We0vZC7YU3FRLGi0e7wgWgK1W6QUlor+Hmv+S6WzuPoU8VzRbYxrp5zDJx6RnsivOD1cdnstYeq496jlptRILPIRKifKY4h1gvWZpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46BSr9q5vryPS68NOgREV+ImjjJvRNfDFVJNVVE9k9w=;
 b=Sdkh4etfoXuXeRt5bi5Z0niEXgMKR1pKpKOAz3PnjBDiikXaMNR6Gn2rxeMTgGhoJG1ZEVNWDRNLifW7DXF/cqoJ++eUoiIwacAQOUoYrhQFZLynFbX0kOwRzJdGN+dJQt+g1IrY93TxhXq6oRaxsZ03k97fmn4zJ+apDKrz7LI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DB5PR08MB9969.eurprd08.prod.outlook.com (2603:10a6:10:48d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Wed, 2 Jul
 2025 06:48:37 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 06:48:37 +0000
Message-ID: <8adf60ed-91ed-4469-86ae-59e8e30bc6ed@arm.com>
Date: Wed, 2 Jul 2025 12:18:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/test_vmalloc.c: introduce xfail for failing tests
To: Raghavendra K T <raghavendra.kt@amd.com>
Cc: akpm@linux-foundation.org, urezki@gmail.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20250702064319.885-1-raghavendra.kt@amd.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250702064319.885-1-raghavendra.kt@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0177.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::9) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DB5PR08MB9969:EE_|DU2PEPF0001E9C4:EE_|AS2PR08MB8478:EE_
X-MS-Office365-Filtering-Correlation-Id: 98ef9629-f073-4ba2-43cf-08ddb9348d8c
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?UTZNTDE0Q3hyQnBwckFaYUxseGp4VWMrV3VHZFBGaDRIcVgrNFUweE15aVZ3?=
 =?utf-8?B?T2U2MHhDSUYvTWlQSitiejlxbnQ5b09RUlBOaExQZ3pNZDZReUU5ZTYzMUM4?=
 =?utf-8?B?clpQL1pVNFZqQjU1Mlo5NDVaUEk5NXJHeVNzYmpCTFdpRzhNM2NVWU82MFQv?=
 =?utf-8?B?UlYwbWF4U1lUNCt4T0d3QjdaUGIyVjh4eUdzeG1TVXlEb0U4czR2OE5lSzdL?=
 =?utf-8?B?amJJUkRJN1NFVXVEaDd1WEl2c0FSY2tjdHpUcHhxT2grR1J1VjlZcE9MaEhw?=
 =?utf-8?B?NnlPRFk0cVkrTWQxelVGMWpIYjBlSnUvbytmOURwbGwvaUxQSVRNNnZIVWxR?=
 =?utf-8?B?bTQwZ1B6R0R0dmVyM3IvbVdTS3pOZGFTUGRETnc2VDhoOFhzMWNyWkFMb0VQ?=
 =?utf-8?B?SWVyYXEwV09tTmhCT2M3eG93S1NCa2lPSjRVai8vZkEzcjZIZ2ZTRzZYYnFQ?=
 =?utf-8?B?SGplSWJVWWlxK0ZIZFhFTTZGaC9VdWt6SGo5YlYvdlhqZCtpVEpYTmdRQ0Mz?=
 =?utf-8?B?ZTlNUEEwV0FjVW1nSjF3cm1vT1FjVWQycmJ1UGp4LzFqVXV0eHRacW4zSk1X?=
 =?utf-8?B?Uk4zOFJYL0lCVTFCM2NoU20wRENBV2k1ZnBScjlubWN1WnlpY2FkWG5TUDhm?=
 =?utf-8?B?LzV3WlNybTdaNEhvQWR3cCtJNWJtbW9ReG9TNDJnMlkwRzZuV0luZll5Y0Np?=
 =?utf-8?B?SExYbGVNVFg2aHlES0QyRkNmenZmbVlFUFJJNVB4Q2EvbVMxeVkzUlN1WG1S?=
 =?utf-8?B?TlhvVDFlUkxUeHRoK0xUYUJLeTFCUFZLWmZac1Nxbm1KbXRVVFNLUFcvcDVh?=
 =?utf-8?B?T25RODJwU0xvL1pUWHlia0dNNi9EV2lEYmx3OEVTVjFHSEp2MVZiOGlRUXht?=
 =?utf-8?B?OFRrc0hVMlJTczBEMlNFK1llaXNsYnJwSXh5Q0UybG5WQkJRdFNmdHF5amtM?=
 =?utf-8?B?Q0luS3k3cWd5dk5ocGhIR0M1STNVLy83Sys0UDVvQjdNSS91VXYzMm1xVGd5?=
 =?utf-8?B?VnFpNGozV29tQldPYUROY0hwMm5lVzF3a0xEREZtR0EremYwSytDMkc4RTJX?=
 =?utf-8?B?eWt5M1BpcTRNUSt1a00zYUQ4V2ZPV1gvVlU0dFJLR0RZUEQrSTNuem1HYlVP?=
 =?utf-8?B?SERBa0doNGlJWnVtNG9VeE9Sd0d0YW5FNmYrSjl3MUlJZDY4d1VCY1NnWVZ1?=
 =?utf-8?B?TUJiZFdiT0lZMzRaaDJrd3hYMnozOGdnWGRmeUN4TmRTejlORjcvN3NEWUh2?=
 =?utf-8?B?bW9zenlTNHhKTnRkQnU0WXVsMGoyUEtlcjU5RDNQZU1Gam5udW5nZzQvZ29H?=
 =?utf-8?B?c3pMd1dKWVNlNTcwRWdUNENVNkk2VXQ3aFhFbHJNWFhYb3c0NGxSVlcyWk1l?=
 =?utf-8?B?NVRXejZNKzExbHdBZW9EVXdIZUp5UUh1L3RQVVlpS0xJOXdoK00zNkcvR1lE?=
 =?utf-8?B?TmhERloyOVlmZmxXRnhoYmFzWE9nT3hSNkFlTDd2QlUzaStYT0NkalNqd2ky?=
 =?utf-8?B?OEpVQ1ZWejFST04vcnZGWUM5eFpWTGNJQmN1a28yOHRKOXVsOFFrM09abzEz?=
 =?utf-8?B?anZGa2tHWXZRSFBCVnFkWXFEYkRKTzdneVV6OW9VWnFQY3p6WnpFazlHTVlN?=
 =?utf-8?B?UnRzenVhN3ZhQzRUelVBUXZJRUluY3pKYlhFaEFJTkhoMy9oUWtLRlN5SGZ4?=
 =?utf-8?B?enJtWXZiWUIrQ1o0cnZTQ2VsLzNCb0RzWFIyMVYzcEkxTENqRTNQSDFUVnhk?=
 =?utf-8?B?ZForM2V0M3pYRFQ2RncxWDBRLzRwVEExbHhWT3U2NEFkK0lpSmFlbzNlWEIx?=
 =?utf-8?B?T2JiUnJTZTBUZmo2NkJlbituM3BnN1FRUklGc0hVS0ZKSmFELzdrSzRFRytl?=
 =?utf-8?B?dVZVMkdNRkUySGo2WUVHc2MrVHMxTENJRS9sSnVxNGRmYTEwT0tJUitXamY0?=
 =?utf-8?Q?YtyWVjn5/2o=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB9969
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C4.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	45dd204f-22c2-410a-90d9-08ddb93478af
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|35042699022|82310400026|14060799003|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b3EyZ3V4K0dMUU5DM0N4cEc3QkloNTc0aWttaW01dzIzeVc4Q214UlIrMUhM?=
 =?utf-8?B?WTBnS3F1dEYySitKNmhOZW56d2szUjZUbXFscU9GM3E2bmF6eEpsNFRJZndE?=
 =?utf-8?B?UFFUdWc5OUFHL29CYWVDTnZwSGJTbmFQZTlleXY3SWt2dmlnR04vaVBZa0JN?=
 =?utf-8?B?ajQzZDVSY003cnNwVjhReGlOcXY2Znd1VWFibGlOL0dMZ21KaHRWMlFIb3pi?=
 =?utf-8?B?MlBya3M1aUtpMGhLQ0NPMktGSWNmc3pPazM3TTZ3QmliNjI2QXJCMkRaMW8z?=
 =?utf-8?B?NnZEV2MvNGl4aHY2Z2U3OUdNYU9SV2hjTGF1V1ZydkFwcENNTDBSMFBUQWFo?=
 =?utf-8?B?UEloMmNleCttb3NFcVU4aTFyU1lCUXVBTkpQTmRFMG1QV1FCNXpsR1YvT3Fn?=
 =?utf-8?B?cnAySjJRdG5kRzlHM0ExUkhEeCtnei9UaDBNbkRTRWRpcjB1VjdWRWsxQmFj?=
 =?utf-8?B?aTZwUExZc00wM0M4dHlvaFJIRGR4RWh0ekUwWnd3T0lHS2xNSEhYN3FGTkNJ?=
 =?utf-8?B?b2YyR1hKR3J4V0pQNnQvRDVVMzI1OHEzenp2TTBZYncyK1M1bWdDN3hkK3cx?=
 =?utf-8?B?L3lmeGo4c2lUeHI3MmcvN0FzbDI1Z1NFYlh1TjZLSm1majhMSXpwUzRjcVRU?=
 =?utf-8?B?bm9rbmlhNUJ3WHZ5OHlqQnBmSCtOZUFOdUIzaTBVQXczSllBbVMzbzJjU0Yz?=
 =?utf-8?B?R09tN1pSckduWW52SHNxN2U2UnR6eHBtZXhpbE1kOEliOElBZExKVUJIQWpG?=
 =?utf-8?B?SDdib2czc2pRSWxHQnVSUTlGMlZFRHArUWlaRmxaVG9zNmNCWGpwUUNmcXEw?=
 =?utf-8?B?M3JucGZwUXNuUnJJR1ppU0dIZUYvWWxwVnJQdTlsTDF1WXBhZ2RtSGpOVk9r?=
 =?utf-8?B?TjhkanBKekdiWkhiMUkxTjRrTjZtNEZwS0hNbGxDM3FielJ0QzYzNXQ4S2hi?=
 =?utf-8?B?aUpDVCt6eXJySGtPY0lhcXZXa1BJelVvTjBCaUw3eDhFUkNXMWllcDllRkJu?=
 =?utf-8?B?Znp4YkFZbWNlMU5OaldqUnJpbUhBemJJZHpGS3dMMDYzZm1lKzF1ZFcwVGUx?=
 =?utf-8?B?eFlLYTVWZXRYaFE4c1dOUmFSOVVLc0tZSGRtNTlNazBYbmg1NFVOUDkzNWh5?=
 =?utf-8?B?dTdCbXJPZVVmTnIzbFk4Q1QzNi9iNlNFQlB3V0Y0ZEZOUWlFQVVMbGtXYUE0?=
 =?utf-8?B?Y0Z2ci9UMXAvcW9FRzg5RERucEJrQkpiRExLMmcrck44S3lleUpLQ2xBQ2Jn?=
 =?utf-8?B?UjdyYSs1NXlveEhnVmlvZ1AxVEg1eFpqa3RxS1JDU28ra0kxTHg1d2s0MXR1?=
 =?utf-8?B?Ulc0Y05HdWZNQjR2bmJGS3RUaWdIcUJteUhsaWVXd1JGNmRoTmVZT05GZ3I5?=
 =?utf-8?B?MUxpY1pqbVN4cm95L2piQ2tLcVExYXVDbU5zOVpSdlNTNjhzWTFDR1dMNkk1?=
 =?utf-8?B?dWFFaURWMGtOdjNWeUYzUGVodlN2TWhoYzFUMklsU3p4RDMxNkFvWGdYU2Np?=
 =?utf-8?B?dkVSeTVYeEJpTGgzNDljeEVxTG54aHNhUFo3Wno3Vk5VeVRsNUpyS0RXNGlK?=
 =?utf-8?B?WGk4VjYvVXY4NTdKQ3dIcVJsa1kwdlNOVnpnaUxzMUp1cGtzNloyeUJaRllO?=
 =?utf-8?B?QWdxa1REYjhRUkFQTk5xRkdzNTJJT3lSamtaS1VWRDlmdlFqN0g1SVVuazgx?=
 =?utf-8?B?dHBNWXdjNkFncjYzMk80cFVsbHBrWlpPVFZqQ3djUWxENGNvVEZVT2hHMzll?=
 =?utf-8?B?T0dFMGtWODJMMVExa2JoTzlVeTJqVWk0SWpSL0FTMXlTUnE3NE4zYnhvbGor?=
 =?utf-8?B?OTZiV0MyMnhVc0hxbE8vbHlkT3BQSWdLR2ZnRHBRdTJseko0c09Fem5NQ2Iy?=
 =?utf-8?B?RWFtSGlQcmRIc0VoV0pqcUg0SzF3RFRPaVRocm1laGluRWhjT1NzL1Fxc21p?=
 =?utf-8?B?S3d3STltRmY0a3JvKyt0cmh3Y0FkK25qT0N2c0xEZlBNM0w4dk5mWSt4aUNy?=
 =?utf-8?B?VDl0VG05TC9Ud3BwSTBLN3puQ3hTczhBdVVZNlpVaGJleW5mZUFPbUdGanNq?=
 =?utf-8?Q?v591YU?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(35042699022)(82310400026)(14060799003)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 06:49:11.9622
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98ef9629-f073-4ba2-43cf-08ddb9348d8c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8478


On 02/07/25 12:13 pm, Raghavendra K T wrote:
> The test align_shift_alloc_test is expected to fail.
> Reporting the test as fail confuses to be a genuine failure.
> Introduce widely used xfail sematics to address the issue.
>
> Note: a warn_alloc dump similar to below is still expected:
>
>   Call Trace:
>    <TASK>
>    dump_stack_lvl+0x64/0x80
>    warn_alloc+0x137/0x1b0
>    ? __get_vm_area_node+0x134/0x140
>
> Snippet of dmesg after change:
>
> Summary: random_size_align_alloc_test passed: 1 failed: 0 xfailed: 0 ..
> Summary: align_shift_alloc_test passed: 0 failed: 0 xfailed: 1 ..
> Summary: pcpu_alloc_test passed: 1 failed: 0 xfailed: 0 ..
>
> Signed-off-by: Raghavendra K T <raghavendra.kt@amd.com>
> ---

Thanks for doing this, been thinking about this for so long but
I'm lazy : )

>   lib/test_vmalloc.c | 36 +++++++++++++++++++++---------------
>   1 file changed, 21 insertions(+), 15 deletions(-)
>
> diff --git a/lib/test_vmalloc.c b/lib/test_vmalloc.c
> index 1b0b59549aaf..649f352e2046 100644
> --- a/lib/test_vmalloc.c
> +++ b/lib/test_vmalloc.c
> @@ -396,25 +396,27 @@ vm_map_ram_test(void)
>   struct test_case_desc {
>   	const char *test_name;
>   	int (*test_func)(void);
> +	bool xfail;
>   };
>   
>   static struct test_case_desc test_case_array[] = {
> -	{ "fix_size_alloc_test", fix_size_alloc_test },
> -	{ "full_fit_alloc_test", full_fit_alloc_test },
> -	{ "long_busy_list_alloc_test", long_busy_list_alloc_test },
> -	{ "random_size_alloc_test", random_size_alloc_test },
> -	{ "fix_align_alloc_test", fix_align_alloc_test },
> -	{ "random_size_align_alloc_test", random_size_align_alloc_test },
> -	{ "align_shift_alloc_test", align_shift_alloc_test },
> -	{ "pcpu_alloc_test", pcpu_alloc_test },
> -	{ "kvfree_rcu_1_arg_vmalloc_test", kvfree_rcu_1_arg_vmalloc_test },
> -	{ "kvfree_rcu_2_arg_vmalloc_test", kvfree_rcu_2_arg_vmalloc_test },
> -	{ "vm_map_ram_test", vm_map_ram_test },
> +	{ "fix_size_alloc_test", fix_size_alloc_test, },
> +	{ "full_fit_alloc_test", full_fit_alloc_test, },
> +	{ "long_busy_list_alloc_test", long_busy_list_alloc_test, },
> +	{ "random_size_alloc_test", random_size_alloc_test, },
> +	{ "fix_align_alloc_test", fix_align_alloc_test, },
> +	{ "random_size_align_alloc_test", random_size_align_alloc_test, },
> +	{ "align_shift_alloc_test", align_shift_alloc_test, true },
> +	{ "pcpu_alloc_test", pcpu_alloc_test, },
> +	{ "kvfree_rcu_1_arg_vmalloc_test", kvfree_rcu_1_arg_vmalloc_test, },
> +	{ "kvfree_rcu_2_arg_vmalloc_test", kvfree_rcu_2_arg_vmalloc_test, },
> +	{ "vm_map_ram_test", vm_map_ram_test, },
>   	/* Add a new test case here. */
>   };
>   

Why this change?

>   struct test_case_data {
>   	int test_failed;
> +	int test_xfailed;
>   	int test_passed;
>   	u64 time;
>   };
> @@ -444,7 +446,7 @@ static int test_func(void *private)
>   {
>   	struct test_driver *t = private;
>   	int random_array[ARRAY_SIZE(test_case_array)];
> -	int index, i, j;
> +	int index, i, j, ret;
>   	ktime_t kt;
>   	u64 delta;
>   
> @@ -468,11 +470,14 @@ static int test_func(void *private)
>   		 */
>   		if (!((run_test_mask & (1 << index)) >> index))
>   			continue;
> -
>   		kt = ktime_get();
>   		for (j = 0; j < test_repeat_count; j++) {
> -			if (!test_case_array[index].test_func())
> +			ret = test_case_array[index].test_func();
> +
> +			if (!ret && !test_case_array[index].xfail)
>   				t->data[index].test_passed++;
> +			else if (ret && test_case_array[index].xfail)
> +				t->data[index].test_xfailed++;
>   			else
>   				t->data[index].test_failed++;
>   		}
> @@ -576,10 +581,11 @@ static void do_concurrent_test(void)
>   				continue;
>   
>   			pr_info(
> -				"Summary: %s passed: %d failed: %d repeat: %d loops: %d avg: %llu usec\n",
> +				"Summary: %s passed: %d failed: %d xfailed: %d repeat: %d loops: %d avg: %llu usec\n",
>   				test_case_array[j].test_name,
>   				t->data[j].test_passed,
>   				t->data[j].test_failed,
> +				t->data[j].test_xfailed,
>   				test_repeat_count, test_loop_count,
>   				t->data[j].time);
>   		}
