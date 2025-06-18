Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012035.outbound.protection.outlook.com [52.101.126.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52A42F5305
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750254394; cv=fail; b=r9U09wTzEdJ7gVUZeJwnHzD1f0f3qkeSQJfWrXh2A4bAIKqTNEeqUIC9UjUC8RroSYwrfx4JB0G6TqCsEUtlDQHknqXlyEK/6Wo3KLK278vwZ/tSBkh8/lJDVGcb2EKCIDd4oFnFA3Mjo/4L198ynm/khJqMsy7/Ic+RVDtB06Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750254394; c=relaxed/simple;
	bh=b+45zwO2vhtKSDaG/jRlr4RbnpNPF/W8LZDcZDfQ2J0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UDQIcOSKuRRZI7cYVaytHxhOs0/8BKJW68qLF7sO66LkmjRwIiJzJz1615ItnY0vmh+hcD9ljefe2NYKQ4ou2/yTs4yz8Dec4UNRVeSgHFF/LZ+4+p6/2kAzOi7qaa8IcOMDWHPSslKn67eGFahd7yaUXawVzaeLpioNA4FrVbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=hsFbqkpg; arc=fail smtp.client-ip=52.101.126.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="hsFbqkpg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5Cl1pxFuNncK11ZPu/KUjrQOqZB+Fm2IhYXsQ+lwuEaP15PFS3jaeFdlKzxab6BdUU5YY8NvgKYyIFCWbbN+LZQ8OezR5DyOjxRQ4DSSbFiOlBW7E8AVenU/uQMAb/w0eMg/CxaNPh4BrQ+kuTVv/Ug37Xa3DjTaSi5FNLasJqNrMNdfi/dtCeRYKTbt1U+GK824OAVs1PXhahwQdyfAGJPE2n3gkPDpNDKNmM1t+9d96kP4ixi6Aqk8DP7+o76Gu8lXgBi7968QAUEwceI4xgoYxDjC3skOmxUIFUMPSWWpbOeGw6I5ZrjgTTDGRwDb3gUzRuQCE0uC2BZsBSGag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n06KNjfKhQdICngTbecLTaDr0Tv6z2FKsL/19Fmkwpk=;
 b=CdRYUdf/sHynHjPwRHHZVPqJ8bBqsY6XwC0eDnss9MyXY5bvGCg1S9mTLHSeq3l/xdzga0fESmeFEnhhbQ0lyLwCvYk21zmAwz1hTS5V9TcJw9re/7SBI+S8xpDD/tA8cvv15CEGCNrCvFXpfI7hwXSyfTVhIO2uRU8KpRdse5rYGNx7Ta4FNT7EzP73lCiM5jdK1xDwKmbxtXRDq3xLsbWJar9in5rKZ+nk8yV/Lcf8HlUOAXh3e+FngyHP0LuVtJl2unyGhfG8at1Rm89LUJlVMaMmQWMj9AvBH7ShSDn/O/uZsCiAdDceE57DE4LBuUZTqP1VWLoEs7A/UBlnwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n06KNjfKhQdICngTbecLTaDr0Tv6z2FKsL/19Fmkwpk=;
 b=hsFbqkpgavkl8Xeylq1SkJV8P4E1ivTPPQRrwLK3x09UWtdD2YgJHhyImOmUJF8ehDLdA1JkKlBnuaQ6w3XIHWEn+uWLbbNAjiR6lpUNag3IIe8wl9HdfXyb+dH0ufDhhAnrki+qaj4zJTwyyxqxRktuA2UFwPmbg842ssI/qf0+h+C22EzR2xgZRxLzQUHo/fSWp7NBCdBcoyjSbfBCXIifRVHm6cqYpGXfUR7hN5YrguVsR/mV45JjyA+58wAB7E3BVtz4SbeLFUo/ORBti46YJ/ZNy8NvKUp4fBvYdZc/HMoDQDJG58p+gFkIO0Him64R7UhnLVqjcwOs95Faog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from JH0PR06MB6849.apcprd06.prod.outlook.com (2603:1096:990:47::12)
 by SEYPR06MB8004.apcprd06.prod.outlook.com (2603:1096:101:2d6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 13:46:25 +0000
Received: from JH0PR06MB6849.apcprd06.prod.outlook.com
 ([fe80::ed24:a6cd:d489:c5ed]) by JH0PR06MB6849.apcprd06.prod.outlook.com
 ([fe80::ed24:a6cd:d489:c5ed%6]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 13:46:25 +0000
Message-ID: <4b52fa6f-f2bf-43d6-8463-190dbae0c913@vivo.com>
Date: Wed, 18 Jun 2025 21:46:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: rt-threads retry mempool allocation without delay
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 opensource.kernel@vivo.com
References: <20250617091044.1062-1-justinjiang@vivo.com>
 <20250617172547.25af99b0f195379f6d6df9f8@linux-foundation.org>
From: zhiguojiang <justinjiang@vivo.com>
In-Reply-To: <20250617172547.25af99b0f195379f6d6df9f8@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0019.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::10) To JH0PR06MB6849.apcprd06.prod.outlook.com
 (2603:1096:990:47::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR06MB6849:EE_|SEYPR06MB8004:EE_
X-MS-Office365-Filtering-Correlation-Id: 658addb9-5f87-4200-67f8-08ddae6e846b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|43062017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NTJOMWh0TFpDNTJiS29WZ0JRcmNWVm5mOG5RVXg1YTJKYUJRZERwMWxpYU1B?=
 =?utf-8?B?MHMvZjIxQUtpU1NQc0FQNDhQa095NU84VmwyaXFQZmtpUE5lZy90ODQrL0VT?=
 =?utf-8?B?VHdxT3lRSEJkVmNBQlhyRy9FLzlEaDNqTndiaEVDSklEWTk2bWY0RkljVEpi?=
 =?utf-8?B?L2JZbWZBL1hBaG5nSVI2WGN5Rjd5dCsyMGxxYkdnZXZWS3FaaFdKdlQwcnJz?=
 =?utf-8?B?UWJyak4vK3hQUkNsbUY1bU1aMFFwV2VVTUdpQ3VHM2RvZHFldGNadHNVUmZr?=
 =?utf-8?B?WUxBK093RmVJelRkaTdTQlFzLzVIUjRBSFFyVkpUdFE1ZlhLaU51SlNObmZK?=
 =?utf-8?B?SEpSN2p4b0ZIbCtXQ216VkNBUFIzV1hOa1VEU09KYmd2Y0NzeDU4OS9CL3ph?=
 =?utf-8?B?anY1ZVFaSmtIVTlKMFB1ODVYMy8vZGlRbThXVFdFWm1RNTFqOVJwZ3VMMGRu?=
 =?utf-8?B?eHFwZzVHWmUycHNMNjR4L0xiMlBuNHpyRm9uZVhjTGVjNkR2QjVmc2hReGFu?=
 =?utf-8?B?bk05dGRPU2g5ejZXL1ZBdVFYdmlyQmdPL2FlZGFHMzhOTWVMeC9raDZPY0U1?=
 =?utf-8?B?VllXME83N0xnUTdYOTB3THBSMjNHS1B0Z2llZ2ZiVmFMTVFNTVk3YUJVNjc0?=
 =?utf-8?B?a09RL0s0TUtVdTVjejd6ZkxWZmh2Smt3ZXNhZkNoU2w1N2ZxT2hxc1lTTG1X?=
 =?utf-8?B?bm1sdTBtYkh4eTNMMWk4UHBORUpDM2UxTkVnOUxnQnJvak5EY2ZsbXF0cGEy?=
 =?utf-8?B?dnRXVXgzUlF6dXpYTTZvUmRvQ2l4QzJ2NDZRNnRiQmh0YVF1ZVZBdGRORndq?=
 =?utf-8?B?MmdTNEhMMC9EWFpZVDZYNWozUU5xSjB2MHF5MjlBUXhoVUFvMTZtdThhOEpM?=
 =?utf-8?B?YXduRUlGNFFINGFIeG5GcUZDWHk2WmswbkRibGRNNDBqbjRXcWNlRzZScnlj?=
 =?utf-8?B?aVBFamtLaFZwa2xlcDBING5zNmNUS3JZd2I0aWNkeElhS25JNXJJaHpiUjl3?=
 =?utf-8?B?S1Qzdnl1MTJncjdxTGF3cGVRZStlUUZnY04vTUtwMUxSZU1IaUZXT1M0NGRl?=
 =?utf-8?B?TmUzOWhBRi91L2pvaWN3dTZ3TDhiYUcxb3VwdTN5NzhFS1ZkRmxLbUYySml0?=
 =?utf-8?B?Zjc3K0d3L3dKb0phd1IyQXdFRnFtbkV4ZlNOMkNwZW9UalRYSm1mODhFbWRR?=
 =?utf-8?B?ZFNzbWpwZ2EwNnl1OGhya0xwYTJxdHVRWmQ4YmcwY1krMms0YlZBb3J4OEwv?=
 =?utf-8?B?eGdURFgvK081VXJhMXJuRW9iQkdiVmZmR0VZd25KS2hSRTV6eUpFWWxud3lr?=
 =?utf-8?B?YXhzYVFnZEVoNzR3bGhqeUxQWVBWdjZUK01vbDVmbTMyS3oyWlpnRTVoMzJH?=
 =?utf-8?B?ZFBrU1RtNWM1cDBaVDlzSld3QUQxbitDL1FSZjh5YnNqZDRkT1ZCMWVNdEJO?=
 =?utf-8?B?Q3cvNTAvL2RGNThueHhkQVNyMFNUVWMvZHdYbHZ4US8wdDRpaFl4OHVxY0Vq?=
 =?utf-8?B?ampYY3ZPMS9oQjNvdE9yMUllWDE0ckk4ZjYzeDJYelFGRFhVUHlIdEhWSGk1?=
 =?utf-8?B?OG96bzJnbGkxTkRqTWdSRGJrOFVWSjR4QlRuK2ZLdVl0eEg5WEFVMnN0bFl0?=
 =?utf-8?B?N084cmJNMG9ra1l1dWc4KzY1QzhDY1FodllmUlNsbWlUdll4WWdzTzhUeC9V?=
 =?utf-8?B?NExCZWl6YXVQc21pUEpMa0JjUXgwdklBR3lEU2tKZWVvYjRKQ2tLRFV4OVVQ?=
 =?utf-8?B?SWxodFRya3RVVVhzZEFPTDZ2VSt0all6cDFTL3plb3p5NWhIRlpUaHNPSUNi?=
 =?utf-8?B?ZlZPYjg4OTA4UFBNVmpadklXOU9sejRlWlhCRS9SNUUvTGgrYTJOMk1VYjJ6?=
 =?utf-8?B?UXB0a25Qd1V2a0xTQWo1WEVDcjZ1aXVCdnVEeUFhWGZRNzBVd1FLdTJpeW9N?=
 =?utf-8?B?UVB1TGhwakFlekpRRWxTWVVEcm9ISzY0a2tiazlYRjB4WlhpTmVjS05tZ0tM?=
 =?utf-8?B?N1JuZTVkcUVnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR06MB6849.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(43062017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFZPblZkVXhoM3lYZlRXdm4rTjJHMUpld3Z6UkxhM2Rnc1N0RzdIVEpxZTVv?=
 =?utf-8?B?YW85cHJyM1gxM2ViZklzN0syOS95TVNOMFFmdTViUkhZQVNUWC9LcFR0QUsz?=
 =?utf-8?B?VzB2clAvTjNMcnp2WTl2TkhHb0s1ZVNRUUxxa21WYXhmTWxvSDg5cGtnQ0h0?=
 =?utf-8?B?R3BIU093dnJ6cktPSndEQ3p5V0JJZENMdVlwWFNmK1B3SmRnT0NVZUdmNkFj?=
 =?utf-8?B?cS9xY0JCb1BHUmg5TE1QbEdrTnJrRzZTYllXK1lLc0JZSmJkTkNWSVcySDIw?=
 =?utf-8?B?MHlDZkdHMlpMNDVnanY0N09XZGFTb3lJNzEzcjVPUDhvSzFqNDFMczdSdjA3?=
 =?utf-8?B?SzFLbUFtdkorSEx3WVUvWm4yaUsxSXFmNnVxUGlmeVQzRk5xNkNWZ0pFYVZu?=
 =?utf-8?B?T3Q0bHY4YVVPeTQvMGhoQzdwdU5xTmZRUUZHVDkxUGF6T3J6WDJJS1JyVE90?=
 =?utf-8?B?YVRXVXEraG9tNEpEOTBRWDBrQnhnaGNjMGxucnpUZ0V5c0E0RzEyUGU5ZWVT?=
 =?utf-8?B?OHZaRzlQZkpudFRWYnVGVFA1L3I3VklRTHZXcGhUajNOc0R4Slc4SERja0p5?=
 =?utf-8?B?TU9HQUlzVjJwV01JTkVTRUNRTGpjWmNPbmNWRVVJeThpQUlFRXFvMEJ0THk0?=
 =?utf-8?B?RFBRMEpXQWE1Q2JTem1UWUxtaDVweWJUek8yMnVFREJFMG9OcC9CdEt2MldN?=
 =?utf-8?B?MS8wcGF6UWJFS2lpbXZNZDlMWkM4Q05uU1BXZ2RsQ1d1OWJPb1hpc1htRFNF?=
 =?utf-8?B?T2ZLQ0Q2YmFwVnIzYU1SQ050MVdiNStHT25ESVN4S01IM0tiUnBBeUZMS2hB?=
 =?utf-8?B?ZTRPWG5oRDZwTzF2SU9yQ01TSnAydWdWZExjbWlOenlCUi9IMVhLRUxPVTJY?=
 =?utf-8?B?SHlBU01xZXRSZW5lNVZTc3lOWmJITmRRaEs1cWsxUnlFRGI3U0JjRDcwaFV3?=
 =?utf-8?B?NWJqUWRHd3FoRTlIMDJ2YmdwdW9Senc3dWRqOG40Qi9YNnFwRWlJQWg5bWtF?=
 =?utf-8?B?M0tFVWFyWm8xTjFFbGtYRFFmWlFJZHNmcmVGL3ZmZVZHN3BycTJKYXNOT004?=
 =?utf-8?B?Q3VNS0VpQTZGa3pHVnVCU0V3bFEzcFBFdFN4ejZFNi96TnZzcEY0c2REQlRC?=
 =?utf-8?B?SVJjSmVxTG1TcDhFWUNucEt6eEFadDA2ZUpTd3NyMDhJOFdYb2hIdWVyWmdw?=
 =?utf-8?B?TGZMazF2eWhFZ0VzUDhlV2g5bldFcXZiWEs4ZXlyOUVoSHJ4Mmc4UjZmQTYr?=
 =?utf-8?B?OENHMGVnalpOeGwwUGkvNm9Sc1pVUTRKTmlWSnVBMExMZ0gxektLeldZTHVm?=
 =?utf-8?B?em5vVU5GV2hkb1ZFTDlENnhPNkVGSThoL0Nvck4vQmp1UVNIYXZlQ2hkaEp6?=
 =?utf-8?B?Y1pBckFGbWxLSXdIYU5ZaGhvaGNrVDc5QTZRNGNJTm5zTmhOaVVjWUh0K1FX?=
 =?utf-8?B?QmI2OWlKM3dpcFJoT3ZpRStHb1puTU1FaExuQXJiTHZpZmhITHQ5b3dOcGV2?=
 =?utf-8?B?SlAybEVGL25OMHVCK0NmWHpud0owMkpSb3JWRWQ4ZmNPY2J6NjlCOG1RNDJH?=
 =?utf-8?B?TDRlbUxGcDFEbkFtMXhRbVNzR0Z1azF6eWphYUN2MjhOZUsxZkRrMGFMcXUv?=
 =?utf-8?B?T2FiYzY0cTd4TVRod2NuVXRzclVGc2hRY0NPaDFEMDRXeUNDZmlxVTFUeHJz?=
 =?utf-8?B?WWFnNWJ4OUdoVnNFQlVvZjBmS1l5YmdtaTIwTUw1SDExUGluYVpkTi8weWhU?=
 =?utf-8?B?bC84RW9JSlJWR2JZOCtIMEcvaEl4UVJnTlp5ZG5BTmhuUVQ4V3BTbW5ucFFC?=
 =?utf-8?B?Vk1ldy9GMEg2cHZPQ0FmVmZrNmMvaFJ4YUZZLzFicHdSM3RITHB2eThDOFpB?=
 =?utf-8?B?Mkk4WDRwOU1IREVQYWtNWXZQdkxQOE9JSDVvVmVFUVp2cWsvbUo1aFBnNE1s?=
 =?utf-8?B?VTBDUkE5dURoSTlBeFRPVjJta05KNHVtUDB6dW84TUJwVFJVclc5aEhWQWNN?=
 =?utf-8?B?RmxPRHdWLzJITS9BR2VNdFBUemJIN1NtdnRHaFdQWlBSWjRxNW5OM3RyZ0d4?=
 =?utf-8?B?UWhnSzJxSnh5d29PT3NOWEZST0syQURxdklpU3RvZkFxdUlCOVlrN2o4Y2ND?=
 =?utf-8?Q?lka3rES6srj77bzQmJnpm6sU2?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 658addb9-5f87-4200-67f8-08ddae6e846b
X-MS-Exchange-CrossTenant-AuthSource: JH0PR06MB6849.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 13:46:25.0061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AzH2VcXLc94P4D7IBw0T71OCILZ0cbp0Pj7NSvwJViUwnJTp+SALcVSz6GKaIwztD7304ht9S3V8UQUUlfQMJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB8004



在 2025/6/18 8:25, Andrew Morton 写道:
> On Tue, 17 Jun 2025 17:10:44 +0800 Zhiguo Jiang <justinjiang@vivo.com> wrote:
>
>> The real-time(rt) threads are delayed for 5 seconds in mempool_alloc,
>> which will seriously affect the timeliness of front-end applications
>> and the user experience lag issues.
> Oh God, do we really do that?
>
> Yes we do!  I'm surprised this wasn't reported some time over the
> intervening 13 years.
>
> Yes, a hard-coded 5 second delay might be a slight problem in a
> realtime kernel.
>
>> The real-time(rt) threads should retry mempool allocation without
>> delay and in order to obtain the required memory resources as soon as
>> possible.
> Well, does this actually work in your testing?
>
> I guess it can improve the situation, some of the time.  If it's a
> uniprocessor non-preemptible then perhaps interrupt-time writeback
> completion might save us, otherwise it's time to hit the power button.
Hi Andrew Morton,

It should be solved. We conducted the same test but did not reproduce
the issue.

I added trace_mm_mempool_alloc_start() in mempool_alloc_noprof(),
void *mempool_alloc_noprof(mempool_t *pool, gfp_t gfp_mask)
{
     void *element;
     unsigned long flags;
     wait_queue_entry_t wait;
     gfp_t gfp_temp, gfp_src = gfp_mask;

     VM_WARN_ON_ONCE(gfp_mask & __GFP_ZERO);
     might_alloc(gfp_mask);

+    trace_mm_mempool_alloc_start(gfp_mask, current->prio);

     gfp_mask |= __GFP_NOMEMALLOC; /* don't allocate emergency reserves */

we can see that the gfps of the QoSCoreThread thread are as follows,

QoSCoreThread-2421    [005] .....   120.217517: mm_mempool_alloc_start:
     prio=98, gfp_flags=GFP_ATOMIC
QoSCoreThread-2421    [005] .....   120.217512: mm_mempool_alloc_start:
     prio=98, gfp_flags=GFP_NOFS
QoSCoreThread-2421    [005] .....   120.217513: mm_mempool_alloc_start:
     prio=98, gfp_flags=GFP_NOIO
QoSCoreThread-2421    [005] .....   120.217524: mm_mempool_alloc_start:
     prio=98, gfp_flags=GFP_KERNEL

1) GFP_ATOMIC can directly return NULL;
2) GFP_NOFS, GFP_NOIO, and GFP_KERNEL all contain __GFP_DIRECT_RECLAIM,
and if the allocation fails, them will enter sleep to wait.

So, regarding the situation in 2), my modification can solve the issue.
>> The following example shows that the real-time(rt) QoSCoreThread
>> prio=98 blocks 5 seconds in mempool_alloc, seriously affecting the
>> user experience.
>>
>> Running process:	system_server (pid 2245)
>> Running thread:	QoSCoreThread 2529
>> State:	Uninterruptible Sleep - Block I/O
>> Start:	12,859.616 ms
>> Systrace Time:	100,063.057104
>> Duration:	5,152.591 ms
>> On CPU:
>> Running instead:	kswapd0
>> Args:	{kernel callsite when blocked:: "mempool_alloc+0x130/0x1e8"}
>>
>>     QoSCoreThread-2529  (   2245) [000] d..2. 100063.057104: sched_switch:
>>     prev_comm=QoSCoreThread prev_pid=2529 prev_prio=000255001000098
>>     prev_state=D ==> next_comm=kswapd0 next_pid=107
>>     next_prio=000063310000120
>>   [GT]ColdPool#14-23937 (  23854) [000] dNs2. 100068.209675: sched_waking:
>>   comm=QoSCoreThread pid=2529 prio=98 target_cpu=000
>>   [GT]ColdPool#14-23937 (  23854) [000] dNs2. 100068.209676:
>>   sched_blocked_reason: pid=2529 iowait=1 caller=mempool_alloc+0x130/0x1e8
>>   [GT]ColdPool#14-23937 (  23854) [000] dNs3. 100068.209695: sched_wakeup:
>>   comm=QoSCoreThread pid=2529 prio=98 target_cpu=000
>>   [GT]ColdPool#14-23937 (  23854) [000] d..2. 100068.209732: sched_switch:
>>   prev_comm=[GT]ColdPool#14 prev_pid=23937 prev_prio=000003010342130
>>   prev_state=R ==> next_comm=QoSCoreThread next_pid=2529
>>   next_prio=000255131000098
> Do you have a call trace for these stalls?  I'm interested to see who
> is calling mempool_alloc() here.  Perhaps a suitable solution is to
> teach the caller(s) to stop passing __GFP_DIRECT_RECLAIM and to handle
> the NULL return.
Sorry, we conducted the same test but did not reproduce the issue, so the
probability is relatively low. I think there are multiple possibilities
for this situation, and different rt-threads may sleep in different
situations. So some improvement strategies should be implemented in
mempool_alloc.
>> --- a/mm/mempool.c
>> +++ b/mm/mempool.c
>> @@ -18,6 +18,7 @@
>>   #include <linux/export.h>
>>   #include <linux/mempool.h>
>>   #include <linux/writeback.h>
>> +#include <linux/sched/prio.h>
>>   #include "slab.h"
>>   
>>   #ifdef CONFIG_SLUB_DEBUG_ON
>> @@ -386,7 +387,7 @@ void *mempool_alloc_noprof(mempool_t *pool, gfp_t gfp_mask)
>>   	void *element;
>>   	unsigned long flags;
>>   	wait_queue_entry_t wait;
>> -	gfp_t gfp_temp;
>> +	gfp_t gfp_temp, gfp_src = gfp_mask;
>>   
>>   	VM_WARN_ON_ONCE(gfp_mask & __GFP_ZERO);
>>   	might_alloc(gfp_mask);
>> @@ -433,6 +434,16 @@ void *mempool_alloc_noprof(mempool_t *pool, gfp_t gfp_mask)
>>   		return NULL;
>>   	}
>>   
>> +	/*
>> +	 * We will try to direct reclaim cyclically, if the rt-thread
> "synchronously"
>
>> +	 * is without __GFP_NORETRY.
>> +	 */
>> +	if (!(gfp_src & __GFP_NORETRY) && current->prio < MAX_RT_PRIO) {
>> +		spin_unlock_irqrestore(&pool->lock, flags);
>> +		gfp_temp = gfp_src;
>> +		goto repeat_alloc;
>> +	}
>> +
>>   	/* Let's wait for someone else to return an element to @pool */
>>   	init_wait(&wait);
>>   	prepare_to_wait(&pool->wait, &wait, TASK_UNINTERRUPTIBLE);
Thanks
Zhiguo

