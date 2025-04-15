Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94EA2DFA25;
	Tue, 15 Apr 2025 09:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744709727; cv=fail; b=Iuez55N/B74RJDPZ/CR2iXN1hYDpjtvw8i2TO/C7PMuSRDTw3msX11UtwYPF+qW4RpwwMtoEN1I9g5pwgNfm/qk19Dpvfq+XdNwwkAMO9LvzX9K/VGKide1cCmMfHEAphTQtSysXK5YldjwEmoD+w451fa3Sk6u9p+iWeJDti1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744709727; c=relaxed/simple;
	bh=zxWClsiVl6q/EuFwRDg2f2sGelK/4V9xsaD7tLM3nAc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lNREEg9ScLoq450mmjDjGM/PF9JEnbnZhrGLkONYfXQCU4ex9XmThoKPTS7dB0Y1J27QuSLwBl1mln5O8LYPHa/FRcIR+KPTgt5C74egPME1Z31jQoMD4OG6aJjZO2n5o9BGqy0T+LQ7zFF910aOGQS7rvc8d1Z0i46NsNwZFOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LPGpR/XA; arc=fail smtp.client-ip=40.107.220.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LPGpR/XA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uJvudtasSh4/gQqM90i38B2jpt9Zu4fbj8Bpng5ygIMtc6op180XGCWXl8XMSU1riAhNCgRjK3cGV1pj6h7y565o/Wi8l5OCimGyV4P3VY6IiIa2dS4d7UPwq/wlRKht58JsIeaEchfAjjj2jKlBysTEgx22A7UT5nWAIRmo4Vz/qm0wuzKKe7TYZBAuV/lk+52LkyWMuHhynDQ4MH9Kcn4DF3KgCrzSy+PwxgDYbzCg6KBGj7nrIBMkOsrPQBataIgL+8Q1Y8cWbSeOQ8Uh5/5t+R1tiPDANsszx6y/feks/N2NebCXoJmuN8Osds3p1ZEQPd2JWEqrPSe7wjjI3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OI1xvvUX6v+YLdj1xBOZD8MGIHtfzLCCl/Oh6NKRajo=;
 b=dNDtwM1jPdPtuoKNpNhgNPeCnBdrtvULl52u2D3CDP6osfDbM6//jU1vTY9AjFdOmKdm9F3bykoT4OJkci38NH7fP7slPJAlnxlpD/dB+6FVNnOfxe/RWbw7DpjIthdovGflZs1rzDDbRch054doc3bWgXtVEzoT1J8H1yW00M1roGF5O3hh/RkwZTppzhwW4yMcOnblJa627tvUMAi34W7+Gfjww7gK1j3xwqk3C1oR6Zag3Qo6LYiMghydnWtBQ0dC4uYRbIOGo7Ro0wNdWVbQKGxhyKmw4tNKxq7HQjbsksLJ7KiU2FqL6PKmJvSGyPRlNFotZPEDlTmSgRAdMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OI1xvvUX6v+YLdj1xBOZD8MGIHtfzLCCl/Oh6NKRajo=;
 b=LPGpR/XAxqbU3AXmIA1OUgbiXtJrwUKvz3X8kPYThnykal3Wq7RDJlHZ59ynuyN8gYpcRBOQyO9ba7PvHsYXELdLEKOMklvJz94aPnlgbLIR6S6Mcv6CdyH0rBm7daC5MUOIp/FiZXXENsBKUdfIoBs+EZrKlzJd/LzJRgPk5Jc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8909.namprd12.prod.outlook.com (2603:10b6:610:179::10)
 by SJ0PR12MB6855.namprd12.prod.outlook.com (2603:10b6:a03:47e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 09:35:23 +0000
Received: from CH3PR12MB8909.namprd12.prod.outlook.com
 ([fe80::b55b:2420:83e9:9753]) by CH3PR12MB8909.namprd12.prod.outlook.com
 ([fe80::b55b:2420:83e9:9753%5]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 09:35:22 +0000
Message-ID: <42ef1aaa-014a-4201-ba47-e7350d2989a6@amd.com>
Date: Tue, 15 Apr 2025 15:05:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/10] misc: Move AMD side band interface(SBI)
 functionality
To: Arnd Bergmann <arnd@arndb.de>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, shyam-sundar.s-k@amd.com,
 gautham.shenoy@amd.com, Mario Limonciello <mario.limonciello@amd.com>,
 naveenkrishna.chatradhi@amd.com, anand.umarji@amd.com
References: <20250411133122.1806991-1-akshay.gupta@amd.com>
 <06b76e0f-0b47-47ea-a48f-2bf09ac4a62c@app.fastmail.com>
Content-Language: en-US
From: "Gupta, Akshay" <Akshay.Gupta@amd.com>
In-Reply-To: <06b76e0f-0b47-47ea-a48f-2bf09ac4a62c@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0095.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:268::15) To CH3PR12MB8909.namprd12.prod.outlook.com
 (2603:10b6:610:179::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8909:EE_|SJ0PR12MB6855:EE_
X-MS-Office365-Filtering-Correlation-Id: 4037f2b5-5449-45d4-baf8-08dd7c00d805
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NDBWdzZSbjJIYitVQ2hqSEhZN3hrdnMzbkx0MnZDMW9zRTlhZTJRaUdXS1Vl?=
 =?utf-8?B?TFVHNFBlU09sblpIZDUyaFBqNnBmaUg4NVk3S1hicUdaeSt3Ymh3SFZOWFJV?=
 =?utf-8?B?dldzUHVZY1lCUmZadUxXdjBxdXJ0QTJkNmRFekdJTVFWZFViclpHa0NmUlRK?=
 =?utf-8?B?OStqNnRWUXQxd21JL2wzMEFvUE5GYVdHYmVSU2FKb2NJV05jTlpZRW9EU2lm?=
 =?utf-8?B?b3Z3N2tTaEJEVXY3YUVHQzkwS1ZOb2toN0YxNlhXYXc5aVFNSU1DblYzQy8y?=
 =?utf-8?B?REVrNDdPdUxMbW5PMGZKaXFFNXIwc0V1UXM5Sy9Kc3BRMlV2SGpsdFVXY1Fq?=
 =?utf-8?B?MEdZWnhCbnpPWUFSU1JMa2tvUkVaaSthZG51Q2twS2ZUbWRmc3cxc3NmeDRQ?=
 =?utf-8?B?ZUJiUmtqYlppWlB2TWF3dUE4UnhWTVQ0T0RRL3BJUVpPL0xYNWU2K3lMS29q?=
 =?utf-8?B?Yk81NExzQU1lNFJVYUt3NkFLOGtITjI4d3h1d1hSaUpzYkxDUUQrWWZJZVgr?=
 =?utf-8?B?UnFTUmM2UkdSMyt4R1lNc0xJQ1FLU3BhZ2RBcldBd2IybEhIdFpDcUl5RVdN?=
 =?utf-8?B?ZGxHTnUvSEU1WFcrUnoxc1RwVUNtZTJ5cnc2Q0VXSldGeFRYc3V3Uld2WjZS?=
 =?utf-8?B?QVpRUGFqd2IwQWtINDErTkZkUzFVUWY3NWcyZ3o3V1BRWUpvcnVPOXpEMDA1?=
 =?utf-8?B?K1NMU3VpSDVsMzBzak9lQktpbkJQVHFOTGtBRTJzRHNQZVNXWUNlOENqSEcy?=
 =?utf-8?B?a1o4T1NDdWxtUWp5NFl4RWFJdnlrcXFWaGw5MWZaNzVxd3pNcmhpdy9JNC9D?=
 =?utf-8?B?QUU3R0VFRWFQcTVMOUd5MmxxUXYxUEQyQmZ6SWF1MmF5dU5rLzJaOXpKOTRk?=
 =?utf-8?B?TXlpNDQ0THB5NFJuZWhBWUdXN3lGY003L1FjdVBKZXhOL3BrMFVpZnlxblNr?=
 =?utf-8?B?RmU5UTVPamhEeFQwZ2NSbGg0SXZqM095eE80TWRRYlpmZDZFOVE4RWZENStt?=
 =?utf-8?B?R0pFQVlrT0JqL21DbGlMWkhjK1BMWkJrTDhmVTk1a0hROGs3UXpuaTFidkVs?=
 =?utf-8?B?N2F2V1lpMWNlQVMzOEUwYTRWdENYYXdiRWQ1TUtFdUhyemZsRFo3MlVrZG5M?=
 =?utf-8?B?TmZxUS9Rb0lwNk1CSDVpWnpaUzdkQ1ZzR2UreE5VS0FETnB6d0Z6K2FPQ1Rv?=
 =?utf-8?B?RFRwZWJSUmdDaFNkRVdwclBzWGlCeGpLRGdmcHlaUElrUERscjl4MHVmSWZs?=
 =?utf-8?B?ZFRtSnNYU04xNll5RElNMkVNNTBoelFQZ2t2TG9RN0hVdGpmTXpXRS9DRkhs?=
 =?utf-8?B?L2lmYTFqNzh3NlF4QXEvbm9leEpVc0UwcmRtN212L1lBSVVLYzZqcmRoU1RG?=
 =?utf-8?B?Qy8vQTIyOE4yZTlZWDF5S0l1bldyZW1ReGNMWHQzWUd1bXhoenUxczRZSUJE?=
 =?utf-8?B?MndnSjhuZWxGK044L2Q5Q3UzMkx6d25OQnZFa2JkTDZHQ0xCQ3RDUWRvSWdG?=
 =?utf-8?B?VlpCRzBVOEY5bmRkRE1ldUFkWU52WE9oV0EyM0liM1l5ZFRmRjhtNnBXOUQw?=
 =?utf-8?B?TTVFYkljMkdyelZxT1RLa25FM3NqQjlpNnRKaXhhaTErL3ZTQ3MwTWxSU3p6?=
 =?utf-8?B?bHEybUM4QTBmN2FsRGo0UGlwbTF1ajBtTnBWT3NTQXFQK2FuM0hPYmtNQTEv?=
 =?utf-8?B?c1NNNjZGMXd6QUdIYlRCYTVLbTVaSWZJYjR5SERuaGRLQ2dxMlhpeUxIOEhY?=
 =?utf-8?B?K21XL1FUYlRqcXM3RnRWeEt5TURXREJVaXJ0VHR4cXlhRHZYcU41UEQwbGt0?=
 =?utf-8?B?akd3bXcvdjBOTEZxQS8rOWFBUnZlcEphTHkxaXlRcDVZQXFvTC9pZ2c0Y1Fx?=
 =?utf-8?B?bk8xZzlKQ3FlT1BDRTQ0Snh2aG1odjZwakRvaEVHdWRXVFdndXRneUhBWnRw?=
 =?utf-8?Q?itGm+pkDln4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8909.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dU16Um5tZ3VVVXZ2NnpISHpIZHhMczJ2eThsdkUvclZURzNQMkdWN2RDVk9W?=
 =?utf-8?B?L0lQYjdtZFhsMVFmb3pOaDJSSDFPN0NBTVFaQ0lOSDVucEVpQmIxL1EwZmdp?=
 =?utf-8?B?bS96YkE1bXF5TDRqMjJQV0pDQjNvd3JlSTJ3U0dyMFBBanBESklIMnQ1SFA4?=
 =?utf-8?B?RUw5L2JUM2pVZ05uTnpSMkQrQUkyZVFaWUpvc1pCSjdzaU02aEFzU2d2blNQ?=
 =?utf-8?B?Q3I5elJla011QWxrMWl6WVRHdzdsemQwNXdiMG4yeG03STE3TDhkTEU4MFJu?=
 =?utf-8?B?ZUtLYmhzNnEveUNxendqNnBZSDVoTmZaa2lJeVY4Z1BoWFlqbmY2NFBqNTVl?=
 =?utf-8?B?ZUdoUmhmdk5Td25DUlJuUVV0cVRJYUR5VmJRYTBjOHUxM2RVdUJBVVhCOEZK?=
 =?utf-8?B?eElHY2MwRFl1d1BvRzRURFZRY3pkc3FjallNZFNvNWRSWkMvYzVsbjIyL09n?=
 =?utf-8?B?bXQ4RTcyVTBXL2MxZTN2V3JFQkFDeDBlWXRUVVNsaUxsSUs4b0hQeHQ0Q01w?=
 =?utf-8?B?akcvRmM1cGdtK1VNc3J0VnpDTmQ5UTdGZkYyUzVMTVR4bFE2bTQxbmMrbEs0?=
 =?utf-8?B?U0xSbzY0aFJwQmxyU3hTTllXdHZPQjlLbWE4Y3dORHc5L09Kb1JPWktXcWtj?=
 =?utf-8?B?TjFTUk9RMXdnT0M0ejU4emdFZERldnlOZm5oVkdON1Azb3ZVU05nNGVHaWFY?=
 =?utf-8?B?SzFUaUpZV2JYd3BKRzRwS0NxdVpOdVYwWHdERld1Vnd5Y3lENmlmSlg1ZDNk?=
 =?utf-8?B?NE5iWFlPY3Q0a3drWWt1S003RzVqcnV6Z2VLcm5zR2h6ZUppZTlldlhYN1lz?=
 =?utf-8?B?ZUQyR0l5eXB2UHNTZzNhYit0U2FCcmZyVy9PK1ZVSVRqYkpFMk5uZjJkSUZX?=
 =?utf-8?B?M0hGNFYzcnVYSmNuRExUeHZ2bkNIRTd0S0lxMWY0Vnh4OXFYYXRLVDIwV20v?=
 =?utf-8?B?YTh2YmNBNWsvcEtxVFBLaVBlTFAvYkRLNWpHT3VCOWc3WENJMGtuTEhQVXJ0?=
 =?utf-8?B?c3ltSkxSZGtDMUNwU2JxT3RwQlFXMnc5eUkzdHVoWWZKd0xHQnNQazllcmN0?=
 =?utf-8?B?RnhqMzNxazFVZG5lbWhHRFE4WnBIMC85L1VBU3VzS1diRHZNVWJWVWh0dmhH?=
 =?utf-8?B?eE90ZVVIR1E5UzFUOGtoTXF3OGFtZlJ3VDF2U2FjUFdGMmVNb1dUVEVyN2tV?=
 =?utf-8?B?emFSOU0wUVY0M2VHYUZ4K0hiOFlzTldiN05iUFl0RWtNS3BCTDhiK2ZmL1VQ?=
 =?utf-8?B?RnRxb0Fla0JBNDhvWjZOZnBBUEVWL1VMWUd1N3dZM1lNaFErUlhOL3Qwc0hn?=
 =?utf-8?B?SzA0RWRUU2RPOXd3R01iUGxFMC9PQUkrVkZNMVg5ZEF3NHlyaVVsdjk0NXJo?=
 =?utf-8?B?Y0o0aW1kVXpVVWtZdmlTbUhYUVlWRnI0Q3FMSmhRY3cwUHIxTHYxZmM3dXJ6?=
 =?utf-8?B?N216RVVZWTAvTjZGcFo0OXd4aWhHbUdmY2huRUpHYUx3eUhtdXBOMEtnZTNR?=
 =?utf-8?B?VFZUbUtkM1dMTVpsZFM1b3Z3a0xNNFQ5Y1dFa2pXbU9EbmRHT3d6TXBSaURt?=
 =?utf-8?B?TFVlb1pNdXRPazBibjNrSEZrUXVQN085TXl4Q1kvN1NLUW5uY1NpZ0dGYVJ6?=
 =?utf-8?B?NmFsVDRrVk1lbGFraXM4L0VucUh2M0pWZGUvU1dhQklHWjZPdE1VWHAxQlor?=
 =?utf-8?B?Z1hjNDdhdEpUTjlpVU5SMUpTdjRXSjlwOUROT1dQRy9FUDNuMTUvT2NqZjhE?=
 =?utf-8?B?eGhVTSt6eHVtQ2pKVi9KQ2puL01sWGFUd05QU2MwN2F6UkU4YzVnQ1ZwdGd2?=
 =?utf-8?B?RmdiWVk1VW5WTUUvVFBjN0RBWlRmODJXckNaMUJLYWo3M1RKR25EVi9vYWlp?=
 =?utf-8?B?ZWNERzNnWklZNVUrR25IYnFIQ2pwU0o3c3B3RSt0dHMyZWVqUTlGbzJhNTQ3?=
 =?utf-8?B?RzVvenNlUzg1dkt0WEZqUVQwOXJDWFBsYVF1WFArZzUwaWRXRWdmdmt6SEVw?=
 =?utf-8?B?Qyt4eWhFd0NPVUw1a0dYb1NMQmZqVFZSbWpYQ25NMGtnbnM1bGllcTlkbnpZ?=
 =?utf-8?B?OUlkQUMrZEpiWUV2N29HUG5hMnFqZVZDTTZncURBSG5KWHRJbWt6ekcxWHNw?=
 =?utf-8?Q?B1ol18XdQosw8uXL3ewGSh6IL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4037f2b5-5449-45d4-baf8-08dd7c00d805
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8909.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 09:35:22.7050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xeKGp1SHfZk5RoHfbGP2r4siQ77bGMemuHUW01KcHTmOlFK9mdoAxR0AHQnXpcO+kOlFgB0YiQPmEkbsXC2zsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6855


On 4/11/2025 7:21 PM, Arnd Bergmann wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Fri, Apr 11, 2025, at 15:31, Akshay Gupta wrote:
>> At present, sbrmi driver under hwmon subsystem, is probed as an i2c
>> driver,
>> fetches data using APML specified protocol and reports through hwmon
>> power sensor.
>>
>> AMD provides additional information using custom protocols, which cannot be
>> enumerated as hwmon sensors. Hence, move the existing functionality from hwmon/
>> to misc/ and add support for following custom protocols
>>    - read Processor feature capabilities and configuration information
>>      through side band.
>>    - read Machine Check Architecture(MCA) registers over sideband.
>>      The information is accessed for range of MCA registers by passing
>>      register address and thread ID to the protocol.
>>
>> NOTE: AMD defines Advanced Platform Management Link (APML) interface
>> which provides
>> system management functionality access to the baseboard management
>> controller (BMC).
> I think this addresses all my comments, thanks for the update.
>
>> Open-sourced and widely used [1]_ will continue to provide user-space
>> programmable API.
>>
>> .. [1] https://github.com/amd/esmi_oob_library
> I'm still a little uneasy about the low-level mailbox interface
> being exposed in a character device, but assuming that everyone
> else is fine with having that in principle, I think the way the
> interface is structured in this version is good enough.
>
>       Arnd

Thank you for quick review.
I see a kernel test robot error in patch 09/10, where require to use 
"__u16" instead of "u16" in the structure. I will submit patch version 9 
to address this.

Can I add your "Reviewed-by:" for the other patches?

