Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2080.outbound.protection.outlook.com [40.107.243.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC461186A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 10:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743070608; cv=fail; b=V7QLAqdVByzng7qPOYv/Ti3hdhRLTWpWJi/kz19HH1oYnEkTppiYkNlwrKEBzlQjvOgpkZ4TXJENn29/aC2QumwZbTdc+H4S8Rm+HzA16QQGeUGs/P/tcSVl25IOxOR821ZsMPa8sBJ3GzhnX2OnpJb1s9mHiPe8/ilgV33LB6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743070608; c=relaxed/simple;
	bh=b5917OpryS3lajUhLb0gTeneVab8cIUSDeSNwQ6F+rQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=H8kd9nfe01FxUSnFxr4JNQpFnpsMhX0tKx2CSZ9yZoSTY/sDGYJowwbFutjEy0hE3IDTH8Jt+U6Z3vAj9nx8OzRKBRRHMgKzMssme042N1JQ7L3C8zaWlSb81rTLN+q76NzyaqqG3S0jKFfdkCeZ/CxDfJuEPKm99ZeGd/rfhKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HxPs1kWc; arc=fail smtp.client-ip=40.107.243.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HxPs1kWc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aHy+M7Q9dEIQGmpSKGKjXyjTfDzyA0xYllEmC5oKUQDHXn6rZkh7ezxHeO454lNap7VoLRBP7fS7s9kx73FLGZai02W51M88i9UTucecvE3wi4tJdoQuLlRSlZPqbJXGv458vVspMjipCdQwjh577AhSNX8t5umIRTJi0KAqkTNIwA1WH0SEjBA0whj9fTxKZkR1GMljx/qDmprXRS+pu6UGTUYRN/qtQtKwrjjKC2qTLvZrUBaqQ1Rh/4xnS49uju0Dte2iXf8b6j11BvMDL4RFgwAmnhWsZ+Q1exqtamcqxQ6kMMipOdKoDiXm2bic3iCSAn5fugc5VIyrM78baA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zNZnmsAWCQEVdiqFj/iQJur6vM1O3XQkaD2N+MCvyJU=;
 b=LdFMJe9O9sbkCh6d2Y24MZSTacONBg80iU9g2sXOZ8SIw6AMnAQzl8TjE4VXEFsBQb5Ql9nWA5uEXF5Tp9OW2e7JYWbkHU8xQfhAzchwoaR/vf4p++59jN8Q395SJ5d/3QcxNqMnL7JfweTha93mh0kYoDyyrC7dJot9haZh4D3QBrOybnu8FQOFPZBKTv08Ex7Mmt+gR7uI+tK4o0/gk8UvaYvRyQ0asDi7KOKn1RZHXa0CIhLdHYZ5rt7a82SR2xdEBr4gqppS8eZF+L9wVkSPpHTd0J41kyIi5y2ezhfyRDwN6N0PDcH+a/CLwQYnUPbT0O6CJXgO6Sb8iwDmKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zNZnmsAWCQEVdiqFj/iQJur6vM1O3XQkaD2N+MCvyJU=;
 b=HxPs1kWc9cqkVftLabNeT2VPi4PWuLCpYN/oWshMjoFakC/6Cvxc+xHAJEHLGrpTFcAAc6Rwf7VM/pRoMzMRDGDXBg+b9rIYBRwFB4Hbfw0nRsPkWLumuj6Rb37T7bWTaWradYb5XMzQrt6SxjqIgSPlFeuqVVdCdCRcRLxQX94=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by SJ5PPF4D350AC80.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::993) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 10:16:44 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::1fc8:2c4c:ea30:a42f]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::1fc8:2c4c:ea30:a42f%7]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 10:16:44 +0000
Message-ID: <f1a7c98a-9aeb-4e58-8d8f-d4e5c0e305d4@amd.com>
Date: Thu, 27 Mar 2025 15:46:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ktest: Fix Test Failures Due to Missing LOG_FILE
 Directories
To: Ayush Jain <Ayush.jain3@amd.com>, rostedt@goodmis.org,
 warthog9@eaglescrag.net
Cc: linux-kernel@vger.kernel.org, srikanth.aithal@amd.com,
 kalpana.shetty@amd.com
References: <20250307043854.2518539-1-Ayush.jain3@amd.com>
Content-Language: en-US
From: "Jain, Ayush" <ayushjai@amd.com>
In-Reply-To: <20250307043854.2518539-1-Ayush.jain3@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::16) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4401:EE_|SJ5PPF4D350AC80:EE_
X-MS-Office365-Filtering-Correlation-Id: 806cdc65-9e33-4e48-ec1b-08dd6d187956
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dWJOQmhVOGR3UXYvZVFCY1laUkJPSW1LUzMxZThoZDFNMmsxM3pDVVoyQktR?=
 =?utf-8?B?U1VFNTJwdHA0Rks5ZDBtNDhlc09LVmxZUThEeVk3Ym00Y1Vyc0c1VlhVclZE?=
 =?utf-8?B?eE9jQkN0YmFaUm1HRWhyMEN2Zkh2YVpVTlhJdTV1OG81cCtRTVFKMmpUdFMw?=
 =?utf-8?B?NEVaOHprWDNEY09Hc3VITWFrenVidm55M0FZSCs3M1N6Z0ZPdHRxdDJlemFE?=
 =?utf-8?B?dFJlL3M5dEpkNkwrWEVaRHFwa2dXRDczem1CeUVXSnd5dFEveTBPakRiZkZ5?=
 =?utf-8?B?cWpFcTFjZm5GL281aytIRkplRWRpQko0MzhhM0EvWTcycGhacTlXZVQ4cFdE?=
 =?utf-8?B?Y1JNVkM0REtVaGZXWEN5ZllHNTZ1bWpPTTl6LytBSDNNM2g0OWZyb2E0K1VH?=
 =?utf-8?B?TjZWZUdDdzkvRkpCeXB0YUNHdi82S2tweUZzZUpmays0dytzM1VscW5seHlk?=
 =?utf-8?B?MjJ2WG1hbE5QNS9tTkptS0Q0eS94UkxCN3RSeS9vMDd3L0srR1MzbHZST0h2?=
 =?utf-8?B?SkE0QlVFK1dYWTNTMVl1WmNTWDNDL011RUtTRFdzZjNtNGVYbm9aNmhjTnE0?=
 =?utf-8?B?d3hNbk1JZ3hhUEZVSTVRREFkWGQ3QURtUjNJejNpaUNPS0RZUlJpbE84Q1lO?=
 =?utf-8?B?eGhzRFhVblhWOWhpNGJkWTFvMjFYL2RJajVpVk9IeFBSRGJEdzhtNEtMWlho?=
 =?utf-8?B?Q0J0bzhybDh6RjlUYnBZV0NvWlJ6Y0tIKzF6WEVicVNXTEI5T0V4eU1yWVI5?=
 =?utf-8?B?UUtFSUV1RW9VN3FJeHd5OWJlZHAyeHMzbHRicnZKMm5KUW9lV3dESjFYeHlL?=
 =?utf-8?B?Nk9XK0wydHhURUNqblFrZFFpTGQ0dUhMeTlsSFZtbjhyZ3RwWXkzNE5XbHZL?=
 =?utf-8?B?Sk5DdGd6N0JTS212SmppM2phZGljVVBJYUdjT3NXdlBjMkdSbDhpNlp4T2pz?=
 =?utf-8?B?K1d1aTQyYnR3SFFjNWpiRHlOUzVmU29jbTdEZ0FBNHpQWlMzUGUrWXV3dnJi?=
 =?utf-8?B?VXQyRyt0NWpMLzFpUGFJZ3lTTzdXcnZSMnF0RWg1ZFVMcGthTStnYU1YTXgy?=
 =?utf-8?B?Z3ZBQklYRlluYjkrRVJVR3NRQkErZFp4RWEvaXVvRUhvSXQ3WENwakxITHNP?=
 =?utf-8?B?RlZPT0NXZnFUeHcrS3RiOE84ZzBJZk85dmMvR0s0K0hqcFhDRmJYZ1lQOWt2?=
 =?utf-8?B?V2hxMnh4UFh4VE1GWU5YQk1nN2o5Z253Q0VVZnpaL2dDZXN3cjdLa2l5Nkxl?=
 =?utf-8?B?MFIzdlNWODBySGVlZmRnUG5WVTZ2Wi9BcjBxRjFaZUJkOUhWK1kwekZiRGNo?=
 =?utf-8?B?SVU3NVMvd21wbUxWQ0hrc0lXdVk2QXhLVTFNZ1d1QmdKWWtFazVjWm90ZzBM?=
 =?utf-8?B?RFN3d3pTWWZ2TWx3dHpKeURaSlhacUlnNXhKN3diWCtqL0UwVGViWitSMmc3?=
 =?utf-8?B?QS9xckFkOGxVY0RWT1FZVWZEdmNmZVlFSlNHNkVnV2JVZVJZNjRKVjVJQjVj?=
 =?utf-8?B?YTBEU2dlbEx6cXJrKzc0WnY3Z2ZOeXRuWGl0WW5yWE9zNGZ5SkV6bnd6RjJ1?=
 =?utf-8?B?UmI0czQ2UlJ5U2tqNHdIZmJvWXI2NmJzNkVpMnFoYXV6amZ5di9Bc1VjWFJW?=
 =?utf-8?B?dEtTVTFjSGk5eFhLb0s3em8wZmNydTdKSmR4cVVPSXdlU3VkcUJNR3FrRWFH?=
 =?utf-8?B?b1VnSi9TejE5QzFMdEZPeGFyeTRvL1JYSFlyeUlScDBDS3RuZ0JVWXBXSDNS?=
 =?utf-8?B?VFc0OUJDS3BrUnFlUjBIVmR0OWE4R2JENzZHeExPNmh6NlFCL0N6b3NleTBL?=
 =?utf-8?B?MEg2QWkyOUVERUpmZnJJVDZDUEtLSTlJVUN3Qzc0RVVkTFJoakZad3Q5b2NU?=
 =?utf-8?Q?EGEh3+k4zMoOk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4401.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dk5oWC96N3QybDBvNE5wekZpc0tpRllmNUZpSUxmdmNFTTBkNWdMMW10Ymxo?=
 =?utf-8?B?UldqdmJsVjREVlRIc2VFL1BYcFU5SGYxY25sZzFxc1dvdVZ5akwvQXlIYVZS?=
 =?utf-8?B?cE9JeE45S2JYNHVHdCt0b1hhd2ZkblBtS1RNMFV3bHp4Ym1CU3dpTVBXVGVt?=
 =?utf-8?B?QVJ1Rm9NQjVyVnZmOHdxMTdndVdhN21TbHpDTm1TU1dCN0Fsbk9qckcxMW03?=
 =?utf-8?B?RWdHSzE5YlZieTBEM0tnMVhoRHRSbkF2RGpjNUtlNnBXTTdLeWdQVTRHVFcx?=
 =?utf-8?B?d2ZEY09heFI0R3ZnNElDQWV5YXIraXFuTDBtNDhLNUR1ZzZyY2VwekNOYUtu?=
 =?utf-8?B?amZKV2NON3NJWmtjZVJXdC8xa2FvWEQwMUNuTkNFeGkrZmxQbHZ3eXdTNTVp?=
 =?utf-8?B?Z2M2bUVqMXNnMm1IWEVlNkFUajhVanFlcTZIQ2pYUTdLa0Y2YzVMaFdyR3da?=
 =?utf-8?B?RFdlV04yVTdVSDZEcEdFN2pSNTdFZjBpVlRSNUgybXNlanJ6MmdvbVZ0UjJJ?=
 =?utf-8?B?YkpnelRIN250Skg5RW14ODFKK3F1OEtuenRpZUdHT25zVFMwaFg1cSs0K0x6?=
 =?utf-8?B?M0FEbzlacHNYZ1RRaHVIbWx6OGhVQXpHRy8xbnMxMHFxQXdQTFJvS2ZTd3V0?=
 =?utf-8?B?YTBRMmVBdGpVK3NMUUxwYlJhUHdxUjNhTWI5cEllU0RJUmY2TllUYWNlM0Ni?=
 =?utf-8?B?aWhJZTVlMnN4WWpsSXBPbmhiMFZzZ08vZkw0M3R5UUdPdTUwVXBTTXlyWVMz?=
 =?utf-8?B?ME1ia3Y0bVNzdUFydDdsVzBqRTlhZWtkeDhSY3M1WkpZUnp0SmtYYjRmaTN5?=
 =?utf-8?B?cWFBaDBzY2lwRlVQcGs3M2pSRW5oSWFoTy9UajZWbm4xWWUrNGVlaUJHSytJ?=
 =?utf-8?B?RjJaRG4vcG4vbkYxeEVNeWhqRmtHUS83UG5EMW54clpLaUY0YURlYjRRN2dT?=
 =?utf-8?B?c1RJbjcwWStSSUtKQno5WXRneWFma1AxYk9uM3pPOWpkVFpMcytoM1M3UGJI?=
 =?utf-8?B?azBBVTk5QTBPODJTcFRtKzZncXZSSi9YcEUwTkFESW51TTJKQ3NBc3B2YjBP?=
 =?utf-8?B?dmpjVzY4VC9PTDVUWWd0b2hSMUFNbVh1S2M4b2dMemkyNjMxWE81cFM0em9k?=
 =?utf-8?B?WXJsMXBVcmt0Qi82NGt3WmFHY1Bhd29zWTZ3Si9TQ1Q1a3hVR2oxZkVwc2c3?=
 =?utf-8?B?N2FDK25tMHgxMktuWHJlZkxsbHVDWHVhcFNpejlFOTlISGp1QWxqcHJOc1Fu?=
 =?utf-8?B?NmJOZUpMSFBxZ2FuUkUyak1vTVhkb2ZXdisrZ01reFR2TFFUbHZ6WVhSYkNv?=
 =?utf-8?B?b2JPVEVUaFc1bGNneFg2SjQvZHBuNVFRcDZHY3lIemNNaHhMWXdLL09CbXpC?=
 =?utf-8?B?WE9pU2xydmFMcm9NcmcxYk9JNUY2dDVzY2dFNkhjdU5RUjhsN0p2MjFQa0cy?=
 =?utf-8?B?Z1VBOU9KOENicFhsYXh5ZkI0UGhDMytLVUQ5NmNXdFFYb3Bva0RjTGc4alMy?=
 =?utf-8?B?eFZGSXZTSHB0a25xREJjR1B0TlJ5b2VsVGM3WnFkRS9nenBzSkQ3OVdiV3hp?=
 =?utf-8?B?TDJML0tBaHFIY0NQS2xPWXl2R01JRUZnVlU2Uk0zcCtERmliNXVwMW5Qb09E?=
 =?utf-8?B?b2orYlo0S05PSHAxcnBFTCtmcm9pdXdCZ0hPVTdRaXVWUGtyaVZmUlI0dUc5?=
 =?utf-8?B?d081VTVaUmw3SVdQY0hjbktLOVN5c1F5aFQxbUZ5d1diUlZ3T0lYRnMwanYz?=
 =?utf-8?B?K29vY0ZNK3lEd2E3dUN4NVk2RXYrN3pvNGJCK2JTYnA1R1BJdllhUjY4MWZG?=
 =?utf-8?B?NUQrT2QvM0syc0JXdWZVVkszM3E3NEZxU2YwRzJTcHR4blpnVGJGRkF3RStt?=
 =?utf-8?B?dmRETEZzczlGTmErT2xEaWlZdkpxK2UrSW9Dbi9VajFPSmFQRFdQT29YRzg3?=
 =?utf-8?B?QWRXdVl4MmlBT3ZPanhucFc5LzZTbk4vV1hkYXZQalZEc1Y0MTZUS1pYK0R0?=
 =?utf-8?B?bFhXN2hpekJ1RjMrMVcxR00yQXRkOXVsNEg5RkgxTzdOaXdZNVRVVlMzSzBj?=
 =?utf-8?B?M3NuN1B4ZEdDeHZEK0ZwRG1wejJ3b0Q5ZHdzOWNuUUp4RmU3WjAvbnZBY3p3?=
 =?utf-8?Q?YRqoRGkn9Ys1ZzqAZtneavI1H?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 806cdc65-9e33-4e48-ec1b-08dd6d187956
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4401.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 10:16:44.2587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rInP8fs2/bchHR2viy1hbxy/jNtgA5NS64UJJxD48p+7HfkE6we+qnCMQBGgxRI2F8wntHm2BuopX7VYIE2/EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF4D350AC80

Hello Steven,

Hope you're doing well! Just a quick follow-up on this,
would appreciate your feedback when you get a chance. Let me know if you
need anything from me.

TiA,
Ayush

On 3/7/2025 10:08 AM, Ayush Jain wrote:
> Handle missing parent directories for LOG_FILE path to prevent test
> failures. If the parent directories don't exist, create them to ensure
> the tests proceed successfully.
>
> Signed-off-by: Ayush Jain <Ayush.jain3@amd.com>
> ---
>  tools/testing/ktest/ktest.pl | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/tools/testing/ktest/ktest.pl b/tools/testing/ktest/ktest.pl
> index 8c8da966c641..a5f7fdd0c1fb 100755
> --- a/tools/testing/ktest/ktest.pl
> +++ b/tools/testing/ktest/ktest.pl
> @@ -4303,6 +4303,14 @@ if (defined($opt{"LOG_FILE"})) {
>      if ($opt{"CLEAR_LOG"}) {
>  	unlink $opt{"LOG_FILE"};
>      }
> +
> +    if (! -e $opt{"LOG_FILE"} && $opt{"LOG_FILE"} =~ m,^(.*/),) {
> +        my $dir = $1;
> +        if (! -d $dir) {
> +            mkpath($dir) or die "Failed to create directories '$dir': $!";
> +            print "\nThe log directory $dir did not exist, so it was created.\n";
> +        }
> +    }
>      open(LOG, ">> $opt{LOG_FILE}") or die "Can't write to $opt{LOG_FILE}";
>      LOG->autoflush(1);
>  }

