Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2050.outbound.protection.outlook.com [40.107.96.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35BD43AA4
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749542365; cv=fail; b=bPPq5A6ntqf1Mg8INPKhKpUfYn0hfWDdvQp6USwL0bDmfEyeaJx/XeDPOI++folbxdWZWOedDs1EiIMpXTV2xjYDrV9keOd+zvvJMLD9AWwxMVSgcjC1r06ts8b8n83Xl85lird+guqjDm8DYU1HLNrVQRG/DZPySavl7VMU8SY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749542365; c=relaxed/simple;
	bh=ZvdX041NLM+ZvNNVBnRH5hlkXW4Pr8POB+PB8UkNdys=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=E9QFhBH0Xn/qNGXIFPrTa4l8AKgQvd4YjCiOHGj3HpsH+CSFRyT8EPg6rZEKT0PaNA774DL+u1dpc3dEZoIvfW1jYJZi5CX9tSaS0M0+Ibgd4mE5ZAlJBdXkY9uUuJnxeKrQPW5+7XkxEWwb17hn3PZjxEnmOQ8XYIKdXEXp3/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YmYn9Zdp; arc=fail smtp.client-ip=40.107.96.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YmYn9Zdp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=duq39VzLBkkDx9EvCeAnqd3e1nnQLthH2r1lXd3k4wh6FoDk3E9V83APWyThkFzMdal2WgP+C9a7RxJmUenktvhqoiAPxioIMGmv6GjiKRR9Bzr6DpYZ7lZhiniaaLfjNlFc+Y5s8eTXMZDsmJOzzRIXk0HoKE/qwW1eAwlTsvvOnT8JCfWF/huKCKhokdykmnDzD2BiZ8kB98mdNWfzMvYTeQk1UerPPzRJNoET7gVhXPRb7bIFcoDzGsd08+ox0jx6VmJR5mjNav03zy6lDivvLLcz7vrAXuc0FlaOCk/yxvEhL6CPwztUHg/R3lRr/dv1r34FsGiqQJnYS1KTeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YC0MDMLC01wJQsfAHVngqJp2lirTENYC2gJPwsrBVoU=;
 b=Q5edtf9huOKEeXOLUPNvM/raHfnVfuXejDozgsgkWBSUvTIl94giPOu0orpKq/NKOVfKb3/5SxThLmgYiaUtnl7k67iARsrKrIvouZ9R4/rEdh5h0pGIMEfTPlja+1iINukjJ2dDEs9GYhF2t2b2ftKimP1X61HKU7h8GY3SboozfaORuVE5ClIWCUh6ZFM8YWCksmgEssfRgGh2mCb2TS0MBFvH55SWwoP8xrs3LbziiTP/GeyALr4OqY1yIJfLlS2PaU3Xe2OU7dSKznHNJx18wwerMqmiIJDcQdEHtaZHKp3F9R2rS+HAbpdgksyU7WCKNXMHueiEXG1ICs306Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YC0MDMLC01wJQsfAHVngqJp2lirTENYC2gJPwsrBVoU=;
 b=YmYn9ZdpXzzwkWHxFacBWTCc5H5aFXnoIDJLG/iA9plalU4Hl3nmBFVDGRuQGBTkY32kryB4VdBjwFGDoCObQkRKPJZzSeh7qcZpBRK6JKKT4gNCyuezjDAA2q+ncVy7iWPqQ04XYDUasz+Sso9W+aYainUIAeiujMty+ftgdYo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by MW4PR12MB6777.namprd12.prod.outlook.com (2603:10b6:303:1e9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 10 Jun
 2025 07:59:20 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%7]) with mapi id 15.20.8835.018; Tue, 10 Jun 2025
 07:59:20 +0000
Message-ID: <4fe4f01a-09f0-40a1-b020-97ac6d835256@amd.com>
Date: Tue, 10 Jun 2025 09:59:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: xilinx: Add debugfs support for
 PM_GET_NODE_STATUS
To: Madhav Bhatt <madhav.bhatt@amd.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250417094543.3873507-1-madhav.bhatt@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20250417094543.3873507-1-madhav.bhatt@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR03CA0011.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::23) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|MW4PR12MB6777:EE_
X-MS-Office365-Filtering-Correlation-Id: c39d02c3-90b7-454f-1102-08dda7f4b4cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UlU5cWJWUFpkNDNsdzhqZjBiZjhYVWVMdUlVNmhSNWk3VVk0d2FMY0JSaDU1?=
 =?utf-8?B?UnRQdlJhWWU4ck1nVlI0S25iNVdpUWphRzJOWElZQ0ZxUjB5U2pYK3R4bitw?=
 =?utf-8?B?YzZnZS9wMnVkai9VejVjWm1SdDJlZWMyaVlJZHNlc2FjdjJSMHZ6ZVFGYzZE?=
 =?utf-8?B?Qk56ajIrMVRhNkhieEZjYVNwTEltOHYxNFd4V2hQZHVqa0pCRmZ3TDdDTUpE?=
 =?utf-8?B?Tm94RHVzZ29Ec0FORXRtVFpzTWc3Nlc4dnI1UWNXTEhzS3R0c0xBTUNGeTlw?=
 =?utf-8?B?RE1KWmJzQjE4Z1RoVmpFMXhVODExRWdJNitqMzNuZDlibDFxbDJwOEI0OW5n?=
 =?utf-8?B?dU5ybjlLMk5IQ1BCL1VTM1BnTnIxbENiWGRybG45Q05JMDRlZnNHZStvNkcr?=
 =?utf-8?B?ZTNEbDkrRW1PczZqcU9JeDJyMjg4bUlpY0N3MDZQcFRCVS9pSzRoanRtRkZY?=
 =?utf-8?B?SjFyOFRPZ2VLTjMvNmlNWCs1ZzkwUU8wN2tGbkNaMWJmWUZuVVA4MkhLd2RM?=
 =?utf-8?B?VTA0bkgvQWNiQTFQNmZRcS9vd1VLSXordytJbi9RdVhUVjFQRWFiWEVjeHZH?=
 =?utf-8?B?YS9vVmhVUHNWUC9LVWc5T0tuVlBiV0s0SzJkd0hPWVlvU3hydFJrSDR2R0lY?=
 =?utf-8?B?MkdIUEgxTWRHdk5pVVVkS1M1L216UmpyTHBYN1cwUHNKWTNnS3VCWkEwRVI1?=
 =?utf-8?B?emVhRWViMWZUMGxHSkJWNUVNQWRhSk9GRndSQ3BPMnBOT0dka2M1UngxcFMr?=
 =?utf-8?B?WElES3kwQ0sveU1QeXkyOHViTnZnMm10TmFqakVseEhKT1d6TTFHUnRTTnd1?=
 =?utf-8?B?TkYrQ3AwbVQyemtSK0tuYkxxMS9ENWJaak5iSDl4TDdhVUllaEs2NjRtOUx1?=
 =?utf-8?B?ZHQ1VlU0U0xOMkVQQ1hHcDhvZUpnOEtnVmdsOGhkenQxdjdvZERZa0JQRzRw?=
 =?utf-8?B?eFl2OXRUSGp5UmxQeFJhQ2g3M0l1OXo1T3N0K2tKNnJRVDVGMXNBVTVjRHI4?=
 =?utf-8?B?dmVXdWd1RjRzTWNaSlFxWWRObEZoMHh1N1QzaFpVWnprZzV0bDRBVG50aEhu?=
 =?utf-8?B?UmlDSGdldG56QUxyZU1hN1pxc1ZSNEZab29HRmp2K0Y5eUx3NDB1WGhzbEJl?=
 =?utf-8?B?c0syajdDZTZOZkxsM2tkQUtSV2UwRmFyUiszM2c1TEQ5QVg4Nm93eDFrT01T?=
 =?utf-8?B?a3FMUDAxc0lKV242U1pPOTNWSGI5MFpzdHB6MW83eFZSTFl1TUpXMXozY2VR?=
 =?utf-8?B?dDBCcTNYSjBlMmE2YndHdU12NFVEdXBndWFjZk1jK0J3clE2ZU1qcmVaRitK?=
 =?utf-8?B?eHdwcURUUkdDUUxnL08vTHRUTnZDbG1wblA0bkVRd2tsUmxEeWRJOCtXQ1VJ?=
 =?utf-8?B?UjY2UmZ5MnRUL2Y2VXFtaDJuaWN4UkE5Tk5rSVpwT3phcU93WVlQNnFmdUdr?=
 =?utf-8?B?T1VxUE4xeTVFbmR1R1lqWGQ1WklFK05NTXJGRU03MGk5bVNJY2ZGTDNqRzN0?=
 =?utf-8?B?dFU1NTVvdlV0RDBHTEU2V1AvNkw2UVFLdjlrRW9aTzg1YXB3NGx5MkRGZml6?=
 =?utf-8?B?WC94bWpWa1o4bVhaNTFrVUhTd09ocTZBK3VLYjJjcVAyU0g5aXJWTU5BZkYw?=
 =?utf-8?B?LzdsMVhyWURxZHdYRzFmeEtnQjNLU3h0MWovcDkwMDhGaUZoNFJyTGhOVENJ?=
 =?utf-8?B?dmpSV29zU01YNEdSNDhnWXRvaTFZaTkyM1UzWXN6RDRoVFA2N3BneW9sYzNR?=
 =?utf-8?B?THF1NmdOT01SeDFDcDR6QXR4R0dKbUpxYWZNKzgwWUJ4cncwdklGa1ptbE5S?=
 =?utf-8?B?THpWcnVWekk4N1NnWjVsZTJTeFA0SHVkRVVsb1J4aXZiSW5paHlJaFJQaE9C?=
 =?utf-8?B?QVc1cFdNZ3FHem1GaThrUElUaGV5cEE4cTV2dzdyS2dPYTVQZHdXdFAxUHQ1?=
 =?utf-8?Q?+ZPSvFnU8sc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rk0zSVJoQzErL0crRDQrZVlSTElBcWRRb0Z4WlhtL1BoUW11c096RENwc2FL?=
 =?utf-8?B?blk0NFVoQ1R1MW5saDlWSlQ2T3cvZkdZZjI2MUsxRnJudnpySnBQREp3REwz?=
 =?utf-8?B?UmhFbjJIbWNnR2ZkQmV2YUlNVGZ3bXJwQ1ZxcU5FVnJOQW5PN1RlZmo5c24x?=
 =?utf-8?B?TURqUk1TVUpUOXc2UnE3UGJEZTE5bFIzU05HSTYvTkFETHpkQm5vOVBEVVdy?=
 =?utf-8?B?Y0lYVmFyYnZJN2tTU2p2azRyL0FZWVVDTnNnUzNhQjdIeWl2aVVvcDFrUzhQ?=
 =?utf-8?B?VUpoeE11QnJuK1BFNHJuanV6MVRDc1k0N1NaR1NBZ0hJYzVpVDU1ZHIvTGJU?=
 =?utf-8?B?VSt1bGVsQXorZ2czUk9VODlpUGZoQ0ZCZDVPVGN4bXpOWkJJRXYxWWhFQnZH?=
 =?utf-8?B?YWhsTGFWUldTTHE0ZzNsakFxOWZnZk5oZHBSaDFjaXU2cUg0b0xFVldVSXNp?=
 =?utf-8?B?V3VUZU5RcmQrL3Z0aXhSeHV6TTNBcEpoOUViQmFVTGFpNWRHL3JITUZMMzZC?=
 =?utf-8?B?d2t2NlNZWG94TTlzUk5qQ3ZFQVRhN3hOb1JWQitrSFFFZnRKaDNCRlZOMXlv?=
 =?utf-8?B?UGtQeVZCdnRFSHVtdmZBQ0NOeXlBTUh4YzhxbUpoZUx2NEYzVW80aXpYMWFz?=
 =?utf-8?B?RUplb3N6TlAvL0JDZVA1aFdXNENGSlRsaXdSNEh6SytDamE0clpTclVkbGdm?=
 =?utf-8?B?SW53QXBCMDRBNWVIYXdCcnllbVVtV3dZdm83emg3TFhZLzZyQXRiTjFTem8r?=
 =?utf-8?B?OFM3c3kvSmxDdWtTa0MxbkNZSk5iV0wzaFZNeGNvMTJFWG14U0ZMeVVKQ0Q0?=
 =?utf-8?B?UlFzWHpVKzBIUjFKU2VSTUFoNWwwVDFURElvL3Y1SFpOWFgzSVh1M2Faancr?=
 =?utf-8?B?Qm9aQ1g0b3dxOFRVY3VzWTZHSGJvcis5cWxXWTNnc3RaMnhEd0VKblFoV0ly?=
 =?utf-8?B?MktQTS9xV3VSb3NUbE9LcGt2SysxK2NRcXZLaUhPSWNVSnN0NFZxcGZUUGlo?=
 =?utf-8?B?cG9GK1VpWm9KamYrbEN3TkE4VUdQQmNlS293NmlGaVdUd0ZaYlpZWHVSaldT?=
 =?utf-8?B?NGNneUx2S0NTSEdTREFMQzBSYWVCdkFkSkRHNERZYytrYnhYSkFPVHIxUWMz?=
 =?utf-8?B?Qi8xcGduUnVQdk5WL3A2a3BDcjRZVjdWSFZ3SkV5bEFEdTNQblNEaDNCWUp6?=
 =?utf-8?B?c2FMcERnSG91Sm5QbVRVbWt3aXNXMEx4ZXJKSnQrSXZOY3U3Tm1Tak8wazFy?=
 =?utf-8?B?TmFGSmlISFFNK3R4bWZIYXZKay9Pc1pBR2lsa0p4dFc2NEFaL21TQk9uZFNO?=
 =?utf-8?B?ZDFJeVpqeDRNT2V3eXZTSGVNaTFYNlhPK0RwcGVPVWxZd09JRHFqb0lFZTh0?=
 =?utf-8?B?V3JUaE03Z1RmalZDbWRCbjROUDNiQlA1M2RvZjJTMk9rdmRZVlRXNU1oRXhI?=
 =?utf-8?B?UDRreHIxQ2M0S1hzRVlGd3hxWEJFR2txZ3ZaanJzOFBZYTkzYjNwalJFUEFV?=
 =?utf-8?B?OEk2SHZkZ2w5L1NXVWNmNlI2ckJiOStsMUNTMHFmbmlJRDhRL2VFaE5IcS9V?=
 =?utf-8?B?SER0K1BGeUIvNFFHT2gxUTdVM3d6NlR6Rm5KTHhtTGF1ek84R0liRGsrY1R5?=
 =?utf-8?B?d3BkQmI2L1JBTTJuMjU2SjRJRGxWak9va2Z3RFlYSStEWUZnR2FNL3Vza0Yz?=
 =?utf-8?B?Y3diVXlFZ1p3a2cvei94RTN0dHpPZm5uc0N6bTFVeVJXanN1eUdEN08vRFFF?=
 =?utf-8?B?cC9ST09FTXhSQUtkRWdWRVVMMFlNR3BFQ045RWFCUUlueFJBNkZ2NUFyL3pF?=
 =?utf-8?B?RUU4SUdSbDFNQWNWUXZuSEZUaFhVK3BybzQvejBPMzRzL2hZQTZUWXRzMkpu?=
 =?utf-8?B?MWF3U0xWcUc1bm5aOUV6YzFXRTdRU0ZJMWRFMm42cjB5QXkxSW1ueis0eStK?=
 =?utf-8?B?MkpPQTFqTlRsZDZwYSszUmNqdlVyNHJwd3MzOUtacmt4eWIzSFJpeENjS3ov?=
 =?utf-8?B?VXUvdGJCMWJBRzE0eXlBb1JWaGUxeVRvckxJd0NjamNEcnNZaXI4QWxYNldv?=
 =?utf-8?B?bSt6L3FPUVRWYkgrMVRIc1NNSEkybmJKNldYK0hid2FFMmtUejJWelZNWW1W?=
 =?utf-8?Q?GRxDjTBzDC3QnkN0O2jJQQW0H?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c39d02c3-90b7-454f-1102-08dda7f4b4cf
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 07:59:20.6988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: osmn/qwRwfa4PjBFa8qZapQ5BrYNtXf+5rXNw3eRpajpPZxHUCLhJmdagMjFZNVF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6777



On 4/17/25 11:45, Madhav Bhatt wrote:
> Add new debug interface to support PM_GET_NODE_STATUS to get the node
> information like requirements and usage.
> 
> The debugfs firmware driver interface is only meant for testing and
> debugging EEMI APIs. Hence, it is by-default disabled in production
> systems.
> 
> Signed-off-by: Madhav Bhatt <madhav.bhatt@amd.com>
> ---
>   drivers/firmware/xilinx/zynqmp-debug.c | 13 ++++++++
>   drivers/firmware/xilinx/zynqmp.c       | 41 +++++++++++++++++++++++++-
>   include/linux/firmware/xlnx-zynqmp.h   | 12 +++++++-
>   3 files changed, 64 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/xilinx/zynqmp-debug.c b/drivers/firmware/xilinx/zynqmp-debug.c
> index 22853ae0efdf..36efb827f3da 100644
> --- a/drivers/firmware/xilinx/zynqmp-debug.c
> +++ b/drivers/firmware/xilinx/zynqmp-debug.c
> @@ -3,6 +3,7 @@
>    * Xilinx Zynq MPSoC Firmware layer for debugfs APIs
>    *
>    *  Copyright (C) 2014-2018 Xilinx, Inc.
> + *  Copyright (C) 2022 - 2025 Advanced Micro Devices, Inc.
>    *
>    *  Michal Simek <michal.simek@amd.com>
>    *  Davorin Mista <davorin.mista@aggios.com>
> @@ -38,6 +39,7 @@ static struct pm_api_info pm_api_list[] = {
>   	PM_API(PM_RELEASE_NODE),
>   	PM_API(PM_SET_REQUIREMENT),
>   	PM_API(PM_GET_API_VERSION),
> +	PM_API(PM_GET_NODE_STATUS),
>   	PM_API(PM_REGISTER_NOTIFIER),
>   	PM_API(PM_RESET_ASSERT),
>   	PM_API(PM_RESET_GET_STATUS),
> @@ -167,6 +169,17 @@ static int process_api_request(u32 pm_id, u64 *pm_api_arg, u32 *pm_api_ret)
>   						pm_api_arg[3] ? pm_api_arg[3] :
>   						ZYNQMP_PM_REQUEST_ACK_BLOCKING);
>   		break;
> +	case PM_GET_NODE_STATUS:
> +		ret = zynqmp_pm_get_node_status(pm_api_arg[0],
> +						&pm_api_ret[0],
> +						&pm_api_ret[1],
> +						&pm_api_ret[2]);
> +		if (!ret)
> +			sprintf(debugfs_buf,
> +				"GET_NODE_STATUS:\n\tNodeId: %llu\n\tStatus: %u\n\tRequirements: %u\n\tUsage: %u\n",
> +				pm_api_arg[0], pm_api_ret[0],
> +				pm_api_ret[1], pm_api_ret[2]);
> +		break;
>   	case PM_REGISTER_NOTIFIER:
>   		ret = zynqmp_pm_register_notifier(pm_api_arg[0],
>   						  pm_api_arg[1] ?
> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
> index 7356e860e65c..dea6c53511ab 100644
> --- a/drivers/firmware/xilinx/zynqmp.c
> +++ b/drivers/firmware/xilinx/zynqmp.c
> @@ -3,7 +3,7 @@
>    * Xilinx Zynq MPSoC Firmware layer
>    *
>    *  Copyright (C) 2014-2022 Xilinx, Inc.
> - *  Copyright (C) 2022 - 2024, Advanced Micro Devices, Inc.
> + *  Copyright (C) 2022 - 2025 Advanced Micro Devices, Inc.
>    *
>    *  Michal Simek <michal.simek@amd.com>
>    *  Davorin Mista <davorin.mista@aggios.com>
> @@ -1413,6 +1413,45 @@ int zynqmp_pm_set_tcm_config(u32 node_id, enum rpu_tcm_comb tcm_mode)
>   }
>   EXPORT_SYMBOL_GPL(zynqmp_pm_set_tcm_config);
>   
> +/**
> + * zynqmp_pm_get_node_status - PM call to request a node's current power state
> + * @node:		ID of the component or sub-system in question
> + * @status:		Current operating state of the requested node
> + * @requirements:	Current requirements asserted on the node,
> + *			used for slave nodes only.
> + * @usage:		Usage information, used for slave nodes only:
> + *			PM_USAGE_NO_MASTER	- No master is currently using
> + *						  the node
> + *			PM_USAGE_CURRENT_MASTER	- Only requesting master is
> + *						  currently using the node
> + *			PM_USAGE_OTHER_MASTER	- Only other masters are
> + *						  currently using the node
> + *			PM_USAGE_BOTH_MASTERS	- Both the current and at least
> + *						  one other master is currently
> + *						  using the node
> + *
> + * Return:		Returns status, either success or error+reason
> + */
> +int zynqmp_pm_get_node_status(const u32 node, u32 *const status,
> +			      u32 *const requirements, u32 *const usage)
> +{
> +	u32 ret_payload[PAYLOAD_ARG_CNT];
> +	int ret;
> +
> +	if (!status || !requirements || !usage)
> +		return -EINVAL;
> +
> +	ret = zynqmp_pm_invoke_fn(PM_GET_NODE_STATUS, ret_payload, 1, node);
> +	if (ret_payload[0] == XST_PM_SUCCESS) {
> +		*status = ret_payload[1];
> +		*requirements = ret_payload[2];
> +		*usage = ret_payload[3];
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(zynqmp_pm_get_node_status);
> +
>   /**
>    * zynqmp_pm_force_pwrdwn - PM call to request for another PU or subsystem to
>    *             be powered down forcefully
> diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
> index 6d4dbc196b93..54fa85f2cf73 100644
> --- a/include/linux/firmware/xlnx-zynqmp.h
> +++ b/include/linux/firmware/xlnx-zynqmp.h
> @@ -3,7 +3,7 @@
>    * Xilinx Zynq MPSoC Firmware layer
>    *
>    *  Copyright (C) 2014-2021 Xilinx
> - *  Copyright (C) 2022 - 2024, Advanced Micro Devices, Inc.
> + *  Copyright (C) 2022 - 2025 Advanced Micro Devices, Inc.
>    *
>    *  Michal Simek <michal.simek@amd.com>
>    *  Davorin Mista <davorin.mista@aggios.com>
> @@ -164,6 +164,7 @@ enum pm_api_cb_id {
>   enum pm_api_id {
>   	PM_API_FEATURES = 0,
>   	PM_GET_API_VERSION = 1,
> +	PM_GET_NODE_STATUS = 3,
>   	PM_REGISTER_NOTIFIER = 5,
>   	PM_FORCE_POWERDOWN = 8,
>   	PM_REQUEST_WAKEUP = 10,
> @@ -630,6 +631,8 @@ int zynqmp_pm_request_wake(const u32 node,
>   int zynqmp_pm_get_rpu_mode(u32 node_id, enum rpu_oper_mode *rpu_mode);
>   int zynqmp_pm_set_rpu_mode(u32 node_id, enum rpu_oper_mode rpu_mode);
>   int zynqmp_pm_set_tcm_config(u32 node_id, enum rpu_tcm_comb tcm_mode);
> +int zynqmp_pm_get_node_status(const u32 node, u32 *const status,
> +			      u32 *const requirements, u32 *const usage);
>   int zynqmp_pm_set_sd_config(u32 node, enum pm_sd_config_type config, u32 value);
>   int zynqmp_pm_set_gem_config(u32 node, enum pm_gem_config_type config,
>   			     u32 value);
> @@ -937,6 +940,13 @@ static inline int zynqmp_pm_set_tcm_config(u32 node_id, enum rpu_tcm_comb tcm_mo
>   	return -ENODEV;
>   }
>   
> +static inline int zynqmp_pm_get_node_status(const u32 node, u32 *const status,
> +					    u32 *const requirements,
> +					    u32 *const usage)
> +{
> +	return -ENODEV;
> +}
> +
>   static inline int zynqmp_pm_set_sd_config(u32 node,
>   					  enum pm_sd_config_type config,
>   					  u32 value)

Applied.
M
