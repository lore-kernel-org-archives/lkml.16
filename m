Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010036.outbound.protection.outlook.com [52.101.84.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9900041C64
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 09:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.36
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749201757; cv=fail; b=GMrFULEHf2RoU11hGOnFAkUFpMODQQPBK/poUmqBXySbLGSjqyfhFVRvgNxCJvh0AdcYKA+zkE5QRJ3a3QK6T2G9XRfxvuojWGdSqdKGc8xfYiREVnXiyUyRWHVDrLy26w8r82MuwJ9lK1CimiUJvSFW3k0q+pbf2XTNwiZOk4Q=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749201757; c=relaxed/simple;
	bh=VL7jvAhjkcxO4dn2CaaT6bbSTahXuefgqYXMPAjtUjk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tQ0AwFncw9AG9147GIDOZejY0fQ3YL8V7sCbNV+DZeLKOzul5bWeqAwKl10JajJVkVNX6L9dASyLOwQ2I/bA28uELbYSghaIU6E+Bk5h1UjjPl6KZ30HpBoWSQ1yhuItswmXPK5AGDbbNXv9p73FhN0/Veml0uZ/Dx58BFwjt7s=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=F+JIz3Dd; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=F+JIz3Dd; arc=fail smtp.client-ip=52.101.84.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="F+JIz3Dd";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="F+JIz3Dd"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=w2r8u9RyTX3s7R9yqyX5dtjn+MlHUG+hp8B+6c/Pxe+tPOx0FvFYreylGoTvXAscpIW/jXvL6IEAWmZKwEX/Za+YumW5rQ7ereeSp1hcqoLXAneAbj102phmS9QOhI/u4ALIMWJ+ja929t8LslKUktemWTXBBQ0X5bqHzf6/LoUKfwwXKfzo+46Jz1HsdDgyql5thsJWp6vVuNHt33nfg0z3nT7i8aW154GaVcuCF4BnNEDrj8ST7ZbQo7bkrWQlLZTSUizS2KffDKHOh4zOV2/2LAxiQiOosIFX/0QMbjubnrGnysdxNeTx1Tr8CNo3jK9OHdnEahL3kR059WWDrQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XzyOLrSj4sOD0rXwwl5QZNhZ18RmD7TcQiyUy4mxTeg=;
 b=cryWp5wFfUxYGnxD97eu2VoDx6M3UsVfua2lEzKXqwpah96udrz2ADZtHPBUw4QjjQz4DTSyijLbO9x5VvkHNnxYC2ZM+oLdPv4vhmjU+NpbQ9amhYhvB9otGfZAAqjPniS0COFMZz3Tkt0qeXSU+hfb2eD60GjN4XIMYtoL7YP52uycVFwEOOe2z4CUaTXEvmExzLT4AgWL0OiKUsqW0Rf7vd9/Yj3rwbDddFijFDJUMY3naBZNjEhfkA9CmEXAylsXR/Z3gPsjZKqMfawjfmj/XArlfvZT2n7Vtwuxz7RNwFa4KqkkVwksNyDksx8Dsuf0vsbfzT+diUiAFngDyQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XzyOLrSj4sOD0rXwwl5QZNhZ18RmD7TcQiyUy4mxTeg=;
 b=F+JIz3DdbMeS3sQdJyR8ulNJUbqO9KTeKuypVEwlfgzXflFi1Z3aHEF3YZ2KlrN0X2lkJumLTzc+t2aHnT4y3Y7yaAqLIux2v2BfEAwSyYDLLJTLAGnSMMV9AGcKY/lzhGeJD/+tHfRCasqobez0+xP48opCRfmnoX/UezqG7nY=
Received: from PAYP264CA0016.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:11e::21)
 by DB9PR08MB7745.eurprd08.prod.outlook.com (2603:10a6:10:394::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Fri, 6 Jun
 2025 09:22:29 +0000
Received: from AMS0EPF000001B1.eurprd05.prod.outlook.com
 (2603:10a6:102:11e:cafe::5f) by PAYP264CA0016.outlook.office365.com
 (2603:10a6:102:11e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.28 via Frontend Transport; Fri,
 6 Jun 2025 09:22:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B1.mail.protection.outlook.com (10.167.16.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Fri, 6 Jun 2025 09:22:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/AiT06ldf8wp+05s24AYjh9UYzTOmrCfC2rXqKnYwTpBggi1ODEwmbZG3gdiuKq7MIwAC6PWhvufZZ3WsyofnLxxX4LO7/OeSIVxmHfJ114C48VZfJRny5HQQWLiCGzX64fw/FwEO/D99uPQFJX7o+VZbLztphnaaM2UHHy+CpKYonS8n42g0uBqpCWBcRLt3LZs+ReVbSc/qj/z3PSOs5zk4cb0ORlVEXj6GJZ9+3tLDreFQvvAvl8cMQDCN8lzqWzztmEosqWV5Pj6ZP9N8VczUT8o82XeaD1MJLWCdx/IABJ9iOGMYm3J8KAVoWrBEeXI4OEUmvOCLQRgV3VDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XzyOLrSj4sOD0rXwwl5QZNhZ18RmD7TcQiyUy4mxTeg=;
 b=dDrKVcouk/wQ6noYu6Z/aijutf/ygbhbQBtOk4LhcWhgnDWPjlG19KBFngtNi1ilcT7Mu5914YDMoZwFWOIcVF8c/ko9zbPHApDEQ4mW9dyf1jqwuZxHdBjLtJG198GgWoPZIEBuUEOs4LmLTrROIZRDOgiqeTt6lUCWwNC/BnhHlJbVzdYct9Esj/H1YMPeATc97+4quhSItrbOaqbt30cqfNScQbMHh+wUZsWTW4kAbtAR7QjwRlqJZNIWtu/kJv0+nBna5/zAvcgeA7zFCoDbv76AAVsL+GhCOfK8liKrHHZ+rBQqYv3ez0Cs35OQzVEs1SyVZZ2nC4JAQ7n1wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XzyOLrSj4sOD0rXwwl5QZNhZ18RmD7TcQiyUy4mxTeg=;
 b=F+JIz3DdbMeS3sQdJyR8ulNJUbqO9KTeKuypVEwlfgzXflFi1Z3aHEF3YZ2KlrN0X2lkJumLTzc+t2aHnT4y3Y7yaAqLIux2v2BfEAwSyYDLLJTLAGnSMMV9AGcKY/lzhGeJD/+tHfRCasqobez0+xP48opCRfmnoX/UezqG7nY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DBBPR08MB6203.eurprd08.prod.outlook.com (2603:10a6:10:201::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Fri, 6 Jun
 2025 09:21:55 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8813.018; Fri, 6 Jun 2025
 09:21:55 +0000
Message-ID: <ecfed817-105d-487f-80ba-52965f926c1e@arm.com>
Date: Fri, 6 Jun 2025 14:51:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] mm: Allow pagewalk without locks
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, david@redhat.com, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 Jann Horn <jannh@google.com>, Yang Shi <yang@os.amperecomputing.com>,
 Ryan Roberts <ryan.roberts@arm.com>
References: <20250530090407.19237-1-dev.jain@arm.com>
 <20250530090407.19237-2-dev.jain@arm.com>
 <6a60c052-9935-489e-a38e-1b03a1a79155@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <6a60c052-9935-489e-a38e-1b03a1a79155@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0037.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::7) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DBBPR08MB6203:EE_|AMS0EPF000001B1:EE_|DB9PR08MB7745:EE_
X-MS-Office365-Filtering-Correlation-Id: 6809bed0-35ab-4008-4907-08dda4dba8a3
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?T2pESTZkTTVZNHlFUnBGQVZ5aGVIWnJsQlJaTHJMWkNTOUVjNHdBRGJSVDlj?=
 =?utf-8?B?alRPSWpseEVvVUF2d2d6K21sL1QyQ0ZQUGhuek0yczEzSHJjZHZ0aER3eGdJ?=
 =?utf-8?B?OWpOWEYvMnJwRk5SbUIycWpZTFUvdkRyUmpJMTZUSjJIcHBGVVlzZmx3NjRG?=
 =?utf-8?B?TjVZam5UeVhaSGExT3g1ZWNMem05cUkralBuZWVhUGxYYWRRS2QvZmpDWXNP?=
 =?utf-8?B?NXZOR2FINkhwTnR4VkV2YlJHSG1tNE5CU2tOWTZKQVo0V2ZPVDFYVUNlNVIx?=
 =?utf-8?B?UDJHdmFLVVp1MVFnTHZhOGErdkJVaHZUSWM4MG9rKzEwRmgrSklweURkaWNx?=
 =?utf-8?B?OWJOdm1HS040RDdicG8wb2ZDcEg0RDBYS0U1OTkwM0ZwcU4vSU1ZOXloSTFX?=
 =?utf-8?B?OTdqclF0cmZNSXZXNzVJT0l0U1NFREVOL1ZOZ1ZMc2NyU3JzWW40TEJ1bHBZ?=
 =?utf-8?B?c3ZWVGtHMUVIRjh2UXdIRnZLaE05KytpVklyanZMNVRhdUhTaityVFRKWktx?=
 =?utf-8?B?V0JEVVdIaFY1NXZzNmZIQW85MU9Yc2lKQTNFUVAyQ2RLVG5uWHFGZEU4UFA5?=
 =?utf-8?B?MWtBQlJNdVhnRzVZY0N2V1BmUE1EbGpJRVhJcTF3Rm1aK3M0cmJ3dWVSZ3Iw?=
 =?utf-8?B?bHB2NTQrNlZDdm5sQVY0UHlYT1dZMFlpZitTVzcwYkJNRWVOZVc1SWxJMnI2?=
 =?utf-8?B?dFBFYlhGVkNqWjlUT2tveXFwTzNOMUo2cENKSFJ2ZHZYaUh1WEw3ZU04SWRr?=
 =?utf-8?B?L3QyVEVNYWVYUzRBL0xsQXZmZDRubWkxYkNjdTlvMDFldHpqUzhCQjJJTXlv?=
 =?utf-8?B?L0FvdXJVNDBJREVMdmRlTmxvTzdneE53RWYwNGFERkRGbXIzNTlrSFNXM3Fr?=
 =?utf-8?B?aHMxZEk4V0V3eWlMZFZ6cXdyQ0Y1OUwvMzgrQkFxdFN1SnlORnoyd25LYUN2?=
 =?utf-8?B?aVZ3YVI1V09TRk03ZmY1ZUxuNnFNTnFGZXh1QUZIdWl3OXFMUUN5cW50Tzkw?=
 =?utf-8?B?bWpOSlM3cmJtWHJiOWE0VFFlSEs2SzdKTDJ0cW05eDdMc0RRcDI3cVpBQVBr?=
 =?utf-8?B?eEdlSlNIbDRuY1dqTE1FL3ZIRVQwYTg1dk5GNnA3dkJleEE0b3lLTThWbDZl?=
 =?utf-8?B?S2hIaUxTQzgxZ0N3WU81RU1FcWM4Ry81Sks3Z1RXTk9hekJONDkrM013eUI0?=
 =?utf-8?B?dUwrVFkrS1dOMWJBdmtmTnVmRHIyVUZ2c25Fa2U0em45ZGJ3OFQ0VUpnK3hK?=
 =?utf-8?B?ZUYzOHhvZURKd1ZtOCtjeUd1enhGSU1kV2p3WmJ3TzVxNlBHQnduWWJWb2NL?=
 =?utf-8?B?endJRGl3dGNzR3g3NUJSTVE1cWI5TGtTMUhYa2tRbEU2YUlJSmljcno4NUFD?=
 =?utf-8?B?bG5kdzJWTjl4QUJpUHFmdE9sZWRIRWNMNWxmbjB4amJDZEd4c1NzUmpSbkNY?=
 =?utf-8?B?aHRSMjUvQWpMV3VJbTBDSXovbWUxeWdoODJjUnp2QUNqU0kxKzhaaHFkV0E2?=
 =?utf-8?B?VmwvaWVoNHJkZURWV0pZVFdXNjVEK2hMQXNZVDNUM0IvR3AxR3llNTFPOGtD?=
 =?utf-8?B?UEtGcmVxN3lLQ3pPdEczOEZ6K3hFT0VxU0RLMk1BMHdyVzFWUHFWbVpHeURJ?=
 =?utf-8?B?eUVmYjZRcXFpRE8yY2RQK3l0MElWQXdRZFE1ejFyRGFldEVsZjJyZUF2N3Vs?=
 =?utf-8?B?dzg3OWx1M21RalcvMzJhVUZFdW8xRkd3NUFnb0hNVjFreWU2NXhteS81TXBM?=
 =?utf-8?B?R3VEOVQyelRVQzk3aTUyU28ybkx0ZUF0OGoxK2wxU0hYa1oyOEhVWENyU2ww?=
 =?utf-8?B?eENSbjF5WGlZZmxNZmkwcVkzdVA4TEZHSmlxMkk2U2UzRHVJVlg2QjVCQzlj?=
 =?utf-8?B?TGxidzZDVEh6cmpCYWJlZkk3TThEdjIweEZiVGxZNDVCMW5EakU4OFVneFdF?=
 =?utf-8?Q?2qy9AS0pv9M=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6203
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B1.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	815308f6-a899-46bd-281f-08dda4db9470
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|1800799024|14060799003|376014|7416014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YlFJcFU5Ym9oM0QvU3E5b1owbW1Pc0dlQlRIR2xTRlJMb2ZYSGdoSDNQUXpW?=
 =?utf-8?B?R0VROTFzTnZPdGY3ZzVQY2d3V2F3VUIyYXc0VG8vQkZKRkhYajMrTWQ3L2dC?=
 =?utf-8?B?ZDZSdjI3NHJoc2kyTytuSkpVWmRXQW4ySHplalFsMks4T2VoU3pHU0VwMUJu?=
 =?utf-8?B?S0xNYUVuWlVtNnlWNnB1QWtOaTRub3pMTytxK0puc0lPYTBMZlJmYlRMaFc0?=
 =?utf-8?B?b3NBSGNxZGxqT3BtL29OZ3dLK0lVdFFaRTBZWWFXcmFqOGNESTFpKy95QUNu?=
 =?utf-8?B?WFZCd0k4RGtIdy9YRFVISU85K2xHNisvdUx6UTB3REhsRHgraXpoVGRQTGky?=
 =?utf-8?B?OEU1WTg0QWQ5dHpNNk8xNFB5dmZxTmlQNnN0MXVQQ2szN1p5aUtpb2JFTVZ6?=
 =?utf-8?B?QXdYVExGQ0FzY0t3VHR4ZGVieUs3eENjc0R5MHpadXdVYjhkMi9OS2k3S2ky?=
 =?utf-8?B?UENrUjY5MEdUK0FqWmlZc0lJWkU1anRCSENDMGhzdFo4YkYwOVJ5clhidDQr?=
 =?utf-8?B?ZWptemFHbXR2Q2pJZ0lHdVFRaFM2Z2g2K1N6VWI1Uy83MnA3VCsrK0RDSEVG?=
 =?utf-8?B?UWdIemZHZmoyTW13TlBKenVuMGIyd2JHT0pSblp1MFFqempkenlYRHVqeGpV?=
 =?utf-8?B?bkRKdEpCaVU0NTJsRVN5MVh3Wmc4Y2VHQ1VzUlN0V2t6c2tlR3psOUpxdjBT?=
 =?utf-8?B?d3Rxd0JXOHEyODlpUlh0Slh1Q3hWUEZLMWd0TjdCcGlHTG9KUjVIK1ZvN0o1?=
 =?utf-8?B?aWljbGJyZ1Jpa1BKWTlEN1R3SXNpdlRrUXY2Vi92SlFUUUk1VEhJdXlCQ2pK?=
 =?utf-8?B?cEhPRGVMYnpvOFpYWkJYSnpKMldNUitGZ3M1eXF1RlJjRFFVZlBqRUF4OGdG?=
 =?utf-8?B?WXFGNDRxWjgwOTdtRldBeGxUMDBtL0tzN0xMUWtVMUtYak50OFc1dGFJTG1y?=
 =?utf-8?B?S0I1N3lmV1FwRE1ycmRzZGlPb1VkN3ZBN1BCTUFWTDAwS2ZISFNtY0tYSUhM?=
 =?utf-8?B?RmZYTjVMQnh5TFJUN0pWNDFod3djUmFaMXRVQ3JOd0V6eGJaUGloL1FDY2lm?=
 =?utf-8?B?U1IzTFVkRURJVStPUmVBV0tWU0wzNytHTjdyb2Z2ZEJJSzBpcVlTVlZLN0NQ?=
 =?utf-8?B?Qkk5MHdnQjAyOFowdlF0c2ZsV054RXZ2by9ITVh4b3NLMlFDUjgzQ0poQWM2?=
 =?utf-8?B?QmN2VEE5UjJUNjVPZ01IQlBTOTdFUDJLdGVNa3FyVE5FSDhYK2FYMkt4b2hp?=
 =?utf-8?B?ZE5MN21aREkrWHFSWHVWK08zRkFOTWFRV3FCOXllR0p3YkVrQ2JaRzlvT3lq?=
 =?utf-8?B?RDA2RU9NL0YzQkR6c05BTTgzNFl2Z3M0QkFzTGRRektPV2dnNlc2YStuYU1T?=
 =?utf-8?B?Qm5zVTRaTUhxRElMdnNQVW5CN3djdzlYdUx3b2xOdUllYjdrbGlPcW8ybEIw?=
 =?utf-8?B?TlVTUVRGVXk0MXR3Ny9hNnhzQ3FNY0ZGQjZ4RkkvaDF5NnpGb0tnWFdramwv?=
 =?utf-8?B?Q1ZZbHNjTlNUekd1NE9ISVJPVnY1S05pcXBORXlMOVNvM0V6cE1BdkdiOEla?=
 =?utf-8?B?MkdwU2NBLzNRZGhMZ3llWWpBS1ltZy83SmhSMnk5VlJDalpERG1MWFZTZUxY?=
 =?utf-8?B?VlI0cWJHWjlNYzdMRUMxVER3V2Z0NGFZUExDaCtSSEtFcmFyaGlqTHhRRmNC?=
 =?utf-8?B?RjlScUpTOGppSUIraDJNUmpoUjYxSEhoVWowVzF1K2Iwc1REeSt4bGVvNzZX?=
 =?utf-8?B?aW1Kc05nWGxVNHRhRk55MEZUWlRRbFJnY01zQzlITGxhQ3pTS0NNVkE2czkr?=
 =?utf-8?B?Rld1U2ZiZ3ZGc2JJR245azl4cThVRXk1S3ZlZS9NL1RaRjNYQkc4Q2hSSGNi?=
 =?utf-8?B?VHBaOHlxREtVak94UjUzcGM5dWxvUFN2SThVV045b1dtMlFQQVA5bE5IR2NF?=
 =?utf-8?B?MWdZTytkVS8veUR0bExkNllyMGUzUGk5MmZBWXhMZE5sL0RDOXhKUTBUaVNk?=
 =?utf-8?B?dTFBOVNXT2FBdXlpOWtIcXYyZ3ZORjBXUzZuU1VnZjdsWHovdUxnbUxxeUU3?=
 =?utf-8?B?UHJXQ0c4cW40MlVKb25jK01QZUZ4eWZ6YS9EUT09?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(14060799003)(376014)(7416014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 09:22:28.9575
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6809bed0-35ab-4008-4907-08dda4dba8a3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7745


On 30/05/25 4:27 pm, Lorenzo Stoakes wrote:
> +cc Jan for page table stuff.
>
> On Fri, May 30, 2025 at 02:34:05PM +0530, Dev Jain wrote:
>> It is noted at [1] that KFENCE can manipulate kernel pgtable entries during
>> softirqs. It does this by calling set_memory_valid() -> __change_memory_common().
>> This being a non-sleepable context, we cannot take the init_mm mmap lock.
>> Therefore, add PGWALK_NOLOCK to enable walk_page_range_novma() usage without
>> locks.
> Hm This is worrying.
>
> You're unconditionally making it possible for dangerous usage here - to
> walk page tables without a lock.
>
> We need to assert this is only being used in a context where this makes
> sense, e.g. a no VMA range under the right circumstances.
>
> At the very least we need asserts that we are in a circumstance where this
> is permitted.
>
> For VMAs, you must keep the VMA stable, which requires a VMA read lock at
> minimum.
>
> See
> https://origin.kernel.org/doc/html/latest/mm/process_addrs.html#page-tables
> for details where these requirements are documented.
>
> I also think we should update this documentation to cover off this non-VMA
> task context stuff. I can perhaps do this so as not to egregiously add
> workload to this series :)
>
> Also, again this commit message is not enough for such a major change to
> core mm stuff. I think you need to underline that - in non-task context -
> you are safe to manipulate _kernel_ mappings, having precluded KFENCE as a
> concern.

Sorry for late reply, after your comments I had to really go and understand
kernel pagetable walking properly by reading your process_addrs documentation
and reading the code, so that I could prepare an answer and improve my
understanding, thanks for your review!

How does the below comment above PGWALK_NOLOCK look?

"Walk without any lock. Use of this is only meant for the
  case where there is no underlying VMA, and the user has
  exclusive control over the range, guaranteeing no concurrent
  access. For example, changing permissions of vmalloc objects."

and the patch description can be modified as
"
It is noted at [1] that KFENCE can manipulate kernel pgtable entries during
softirqs. It does this by calling set_memory_valid() -> __change_memory_common().
This being a non-sleepable context, we cannot take the init_mm mmap lock.
Therefore, add PGWALK_NOLOCK to enable walk_page_range_novma() usage without
locks.
Currently, apply_to_page_range is being used by __change_memory_common()
to change permissions over a range of vmalloc space, without any locking.
Patch 2 in this series shifts to the usage of walk_page_range_novma(), hence
this patch is needed. We do not need any locks because the vmalloc object
has exclusive access to the range, i.e two vmalloc objects do not share
the same physical address.
"


>
>> [1] https://lore.kernel.org/linux-arm-kernel/89d0ad18-4772-4d8f-ae8a-7c48d26a927e@arm.com/
> Basically expand upon this information.
>
> Basically the commit message refers to your usage, but describes a patch
> that makes it possible to do unlocked page table walks.
>
> As I get into below, no pun intended, but this needs to be _locked down_
> heavily.
>
> - Only walk_page_range_novma() should allow it. All other functions should
>    return -EINVAL if this is set.

Sure.

>
> - walk_page_range_novma() should assert we're in the appropriate context
>    where this is feasible.

There should be two conditions: that the mm is init_mm, and the start address
belongs to the vmalloc (or module) space. I am a little nervous about the second. On searching
throughout the codebase, I could find only vmalloc and module addresses getting
modified through set_memory_* API, but I couldn't prove that all such usages
are being done on vmalloc/module addresses.

>
> - Comments should be updated accordingly.
>
> - We should assert (at least CONFIG_DEBUG_VM asserts) in every place that
>    checks for a VMA that we are not in this lock mode, since this is
>    disallowed.
>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   include/linux/pagewalk.h |  2 ++
>>   mm/pagewalk.c            | 12 ++++++++----
>>   2 files changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/linux/pagewalk.h b/include/linux/pagewalk.h
>> index 9700a29f8afb..9bc8853ed3de 100644
>> --- a/include/linux/pagewalk.h
>> +++ b/include/linux/pagewalk.h
>> @@ -14,6 +14,8 @@ enum page_walk_lock {
>>   	PGWALK_WRLOCK = 1,
>>   	/* vma is expected to be already write-locked during the walk */
>>   	PGWALK_WRLOCK_VERIFY = 2,
>> +	/* no lock is needed */
>> +	PGWALK_NOLOCK = 3,
> I'd prefer something very explicitly documenting that, at the very least, this
> can only be used for non-VMA cases.
>
> It's hard to think of a name here, but the comment should be explicit as to
> under what circumstances this is allowed.
>
>>   };
>>
>>   /**
>> diff --git a/mm/pagewalk.c b/mm/pagewalk.c
>> index e478777c86e1..9657cf4664b2 100644
>> --- a/mm/pagewalk.c
>> +++ b/mm/pagewalk.c
>> @@ -440,6 +440,8 @@ static inline void process_vma_walk_lock(struct vm_area_struct *vma,
>>   	case PGWALK_RDLOCK:
>>   		/* PGWALK_RDLOCK is handled by process_mm_walk_lock */
>>   		break;
>> +	default:
>> +		break;
> Please no 'default' here, we want to be explicit and cover all cases.

Sure.

>
> And surely, since you're explicitly only allowing this for non-VMA ranges, this
> should be a WARN_ON_ONCE() or something?

Sounds good, maybe a WARN_ON_ONCE(vma)?

>
>>   	}
>>   #endif
>>   }
>> @@ -640,10 +642,12 @@ int walk_page_range_novma(struct mm_struct *mm, unsigned long start,
>>   	 * specified address range from being freed. The caller should take
>>   	 * other actions to prevent this race.
>>   	 */
> All functions other than this should explicitly disallow this locking mode
> with -EINVAL checks. I do not want to see this locking mode made available
> in a broken context.
>
> The full comment:
>
> 	/*
> 	 * 1) For walking the user virtual address space:
> 	 *
> 	 * The mmap lock protects the page walker from changes to the page
> 	 * tables during the walk.  However a read lock is insufficient to
> 	 * protect those areas which don't have a VMA as munmap() detaches
> 	 * the VMAs before downgrading to a read lock and actually tearing
> 	 * down PTEs/page tables. In which case, the mmap write lock should
> 	 * be hold.
> 	 *
> 	 * 2) For walking the kernel virtual address space:
> 	 *
> 	 * The kernel intermediate page tables usually do not be freed, so
> 	 * the mmap map read lock is sufficient. But there are some exceptions.
> 	 * E.g. memory hot-remove. In which case, the mmap lock is insufficient
> 	 * to prevent the intermediate kernel pages tables belonging to the
> 	 * specified address range from being freed. The caller should take
> 	 * other actions to prevent this race.
> 	 */
>
> Are you walking kernel memory only? Point 1 above explicitly points out why
> userland novma memory requires a lock.
>
> For point 2 you need to indicate why you don't need to consider hotplugging,

Well, hotunplugging will first offline the physical memory, and since the
vmalloc object has the reference to the pages, there is no race.

> etc.
>
> But as Ryan points out elsewhere, you should be expanding this comment to
> explain your case...
>
> You should also assert you're in a context where this applies and error
> out/WARN if not.
>
>> -	if (mm == &init_mm)
>> -		mmap_assert_locked(walk.mm);
>> -	else
>> -		mmap_assert_write_locked(walk.mm);
>> +	if (ops->walk_lock != PGWALK_NOLOCK) {
> I really don't like the idea that you're allowing no lock for userland mappings.
>
> This should at the very least be:
>
> if (mm == &init_mm)  {
> 	if (ops->walk_lock != PGWALK_NOLOCK)
> 		mmap_assert_locked(walk.mm);
> } else {
> 	mmap_assert_write_locked(walk.mm);
> }

Sure.

>
>> +		if (mm == &init_mm)
>> +			mmap_assert_locked(walk.mm);
>> +		else
>> +			mmap_assert_write_locked(walk.mm);
>> +	}
>>
>>   	return walk_pgd_range(start, end, &walk);
>>   }
>> --
>> 2.30.2
>>
> We have to be _really_ careful with this stuff. It's very fiddly and
> brokenness can be a security issue.
