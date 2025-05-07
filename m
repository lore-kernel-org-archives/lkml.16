Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A936D1DD877;
	Wed,  7 May 2025 20:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746648318; cv=fail; b=J2TckvjyYHR21Bm1d70uxAhOETP1kkKJpoHBrGsUs5/qkQkxlJOhUICXlU9rB0jL3Tuk7YPAvWe9UIpUtnXXU4neTd/56dI+ZAkiD8TqYkvyGuy6hudmGYWuhNOmSIEVOpGrbR1QTRW+m+jquq90+1wIC6zNqqFDpJvrYVCdJ8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746648318; c=relaxed/simple;
	bh=UHoRSYyZlZT9+Bsjwarg6olWbHEUrygrJq5jhU5zPPk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kWNrYWjGh6BmbYGQ+GcN432YE9SnkJFYEaams7fDBHcfYpp30iIUOOs9vkPIKebDpMSpbuUtNy0yCfMM1IKyozWcqcItkWVuymDtTTJKuTKEGN4qQn98BQWTwINzMfgpCHlRB8O/orCHrifljHH4kfBM34Q3goiNT+TUHMfqQmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UdpnHist; arc=fail smtp.client-ip=40.107.243.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UdpnHist"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gpR6iZAPyvLMrZtJ43XF1QxYx3i8x2BRrg6AT0EZjCTQhD7ND6hC/NycuxStIAFxJWHkZXW8gsH7JQ/czoV/OKFp4LbV5wt/sQS9H5ZetzDIRqxoxhE4MN8RYipVLPNswEbkt/FWR6J2e31Mz0yjibPPvZADSOaUSP39YPHmeHSMGvJUwdnsk+bOGUxTDM2hX4ooOnRwusTawCPyGt9KZj7QY8Hyzr4TP6AQRtBVyRku53eLwamz/73ZdWGzc9QSDZRUx6HCPzgw79bLMpV//UR0MymIGdyZGQM6yMHlxdUBw7zqa2lv3eSAsqN7v2OKgeq5jQvsoOmwsFAaSFGBJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yftp2ths9LylgdwYEwGtn7RYpGE7/tq3ymct6OmNS9M=;
 b=kqVMslSwbRRGXWE39DHYpbaInE7vip8AHyCGe85Xxp243LfbS+hRMJScejCNoz3r9dRHm3XIJyLdXFold0lSA/sWZY/y1NoK60i5bH24tJYsOV7yX/6C4cnZ6u48oMaFM9SJzZiOxeoHTTm+xQVJVoqtynCw0Hi3nT7zklhDZSNts7/F2DHuTqFnjGgXYnnhh3Ufk45JZqq9q7lwYEUG6nkaBb7zKKcrsRo+SrZ8ENFvY/VEl5WAO9zHtR9CIY3AJINp80PeD/YTxrcJqlZLf1Ap0+ciRyrCSz28gTELv7kLkq5T4Y9Ed2k9nyNjbDJs48bTJl0m5AlFygOQnavJvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yftp2ths9LylgdwYEwGtn7RYpGE7/tq3ymct6OmNS9M=;
 b=UdpnHistE4SNYOQ7TVNjKs8oqdIE3viNJ2lVg4+usXsQF4mCi4CxQQoBZu4EFVe2UjVcbCMwWTS1YeektAvZTIboYmAklC5huXJcqv+ak/3whQaSJLigfftIbNNocjHEZl2WQabxTWRb3kVUIsxrMSrQGvIx9n8nThkBth1CRl4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by PH8PR12MB7026.namprd12.prod.outlook.com (2603:10b6:510:1bd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 20:05:10 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8678.028; Wed, 7 May 2025
 20:05:10 +0000
Message-ID: <019c9a4d-f8e5-4345-95df-255a04e5c34e@amd.com>
Date: Wed, 7 May 2025 16:05:07 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12] platform/x86: Add AMD ISP platform config for OV05C10
Content-Language: en-GB
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Ilya K <me@0upti.me>
Cc: Pratap Nirujogi <pratap.nirujogi@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, W_Armin@gmx.de,
 mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, benjamin.chan@amd.com, bin.du@amd.com,
 gjorgji.rosikopulos@amd.com, king.li@amd.com, dantony@amd.com
References: <20250505171302.4177445-1-pratap.nirujogi@amd.com>
 <9061d5a7-c1f6-47ad-b60a-226e48021d62@0upti.me>
 <21c9d764-4945-4837-93dc-ab58f22f8668@linux.intel.com>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <21c9d764-4945-4837-93dc-ab58f22f8668@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQXPR0101CA0004.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::17) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|PH8PR12MB7026:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dc063ab-cd8b-4393-0b0a-08dd8da27868
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q0dSOHZmRG1XN21FS0lZajlqVmJOYWw1dVJHUThEWmZCYTUvU2tFcWFnM1hy?=
 =?utf-8?B?WHFuV2gwLzA5RnJwTFpCNHJITEtLR082eVBkZFlCeFY0dXBXeHBVK0k3WWtQ?=
 =?utf-8?B?OEpSOVVCbXFYOWhMRU8zcDJJOWtMelhnYXhEYmlTNTRGYS80a0NGQnNlamhM?=
 =?utf-8?B?RUJUc3B1TTNuOGN4NVdWekJEV0t4WU5mbkE1YUJpbGhRQVhyaHFhTUkvWXJN?=
 =?utf-8?B?cWVHR1BySUQxRFhhZldMNW9yYmNuRVVOS2RpRlUvR3psQ3RYd0FNSG4rZmdH?=
 =?utf-8?B?K1BTV1RUZGlKYmN1SEQ3cXpMRFFOR3R5cXJlcDIybGRvWk5Qb1drRDY1WUt3?=
 =?utf-8?B?c3dtMzU1V0d2aEhhNGxXanJ2TTdobXZiMEhBZi8vcjBxNzJ4WnVreVAya3NC?=
 =?utf-8?B?ZlFXLzRtUnM4SVdhZUtpcHNNNHhaMVBMellJeHRIcDJUWVZmM2JrMkYrRnJ2?=
 =?utf-8?B?SnJwRmZQZjY2bGRieUNEY3g2Z3FFdTVhdk9RZGl3clFabEJOUzFiR0I1eWM3?=
 =?utf-8?B?aVZNSjBReE9LZVZ0SmtncUwvTkN6aEFtcE43ZTRKQlRDYm5ubTdCKzVZZlRE?=
 =?utf-8?B?OVYvbDNiSkNBQmF5eUtIWkdpMHZwOE54azIzVEVxMVcwSHFSRU5mbkwwaVZs?=
 =?utf-8?B?OEZkSnVHK1VnL1NGc2U1OWhuQ1JiMzYzTFdIaG1WWHlUM3dOdHBucEJ1dVZS?=
 =?utf-8?B?RkxGWVM4SWxac1BzNzFmNXJOS3p6YzQySDVvc1R3ZTdwZE44blhvcUMxb1hW?=
 =?utf-8?B?Z2NWN1YxUkZwb3lqR1lBYkd0Y1RrL1h1dnMrZVJ4UkF6eFhvTWNtQUQzMHk2?=
 =?utf-8?B?NjUwbWIzNmJGT05EVXRxZnUzV2FHZ2RjWWhyckY3cWQ0QmNIdFI0VHRQWEc3?=
 =?utf-8?B?aUFUNS8wZEhTVzVNMDc1dHVsNHZFS2VoOU5KaEExTlFwYTFiUXpSVkhsZFZF?=
 =?utf-8?B?anQ4NFBseXV3S3pxUXVadTMrVU45VWZ4TVdFY1c3dGNvMVNpcmFrOGpheHJ2?=
 =?utf-8?B?SVBkVVN1dHhPODRzR1hCWENMM3Zab29rOUlXQ05HMDM1ODc3NUxPd1U1Q1da?=
 =?utf-8?B?b0J6R05YdWpBMExDU1VsYmw4TEhiRU9rNHZ1eTdXam1UbjVUK0doNmVkNTQ3?=
 =?utf-8?B?clNGbUExV0x6d3ZVR2QxT0srS2JMQ2lCVHFyS3JHNGE2TDV1Q0NqM0N2d2Zm?=
 =?utf-8?B?akxYaUZQMDVrQVZBMjFMYmFvTzdUY1JrL2NvRUFZWFlPSnpEb2ZYRmhzZ1Nq?=
 =?utf-8?B?enQzL01uck9aOGh0c2ttNmlNSHg2dW1sc1N0ai9YVUhsdG5sMEVzUEowQ0Vh?=
 =?utf-8?B?S3pIL0xhWi9mTG1uM0Qxd2JnSzNVVUtGUHMvalBkZlhMajBUWU8zcGtWYVFx?=
 =?utf-8?B?YjBkL1JQWEd2OFp4QjFOQnVtNzh2RGlMaUI3Tit3S1FPelBiV0tzb0VWWnNQ?=
 =?utf-8?B?OUVDMDRxbTVMQmFmZG5rY2c3OG9YMWNPRmc2NnUzUEhIczUzMDhNMWcrdTBM?=
 =?utf-8?B?TjN4Ri8wYzNDQmc2VDNqbUt2cmRpanZORStoUUNVdjRpbENXT3ZaT05Bdnl0?=
 =?utf-8?B?akxWQ29mTnczSVN4SGVKMThnMU05a01HcjJzZ0MrNktWOHE5T2VCMDZxLzk0?=
 =?utf-8?B?WWkvR05WNUJVcDdjQmpwSUs0OHpGRjltcmt2a2IxS2Ywb0RUTkd4OE1WdmVk?=
 =?utf-8?B?SmkzaTdaSkw3elVEa0t3bGRFSnBlVnVBdS9CVHR3ZnlaS2NWS3RTQ2w2L1Nz?=
 =?utf-8?B?Zk53SGlpcHBJSjRFeXY0WDZUUDNkam80aGVaMEFMaEFDWHhSYk9jOFdkOHRx?=
 =?utf-8?B?WU1jb3R4OVlva3RNR3RENFFxYi9IYzBpK0EvZHNkbkh2d3o5WWVJOHZoNTg3?=
 =?utf-8?B?alVEWld3UkUwc2oyb1djTkZLTmJvZlgxSm55RldudVVLZS9GMHFiNmoxSFIv?=
 =?utf-8?Q?P4jLvPhSbzM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2RkR3d4TmwrWldSNmNtMnFlYlZySzlIRWZkVUFldktwL0NMbTFqcSt3ek5u?=
 =?utf-8?B?eVI4WkpvMyt0TEg0OWpFL20vRHRTeXU4cm1hZEVIYTV0dyszNDZMTUw1RDEv?=
 =?utf-8?B?MWhveUV3WjY2QWhGc3IxZkR6Q3RqaUoySXVoRXUvMS8vRW1va0JQSms5NlRJ?=
 =?utf-8?B?RldlRUkrbDYyUXcxSGxsOVhaMllQbmV0UjdkRkZIVjFGd3R4UzFnTjBFU2pl?=
 =?utf-8?B?YWtYVXI3RVpZYWg3RW5IOG9jd0lFZFBvcXg1bUxlQVpPNkJrL0d0aUxUSXg2?=
 =?utf-8?B?bEdQRzVxY2pGeGxGZlczUk5DWTE5bzNJSFpsY0NVVU5IM0FWRTRtMU1tMTJq?=
 =?utf-8?B?ekdMdmk3dnFRZkNsT1I0ci9jTDhGRnhzVDJJb25pVVdVSHR3UXNVTTgwVndl?=
 =?utf-8?B?Q2JaVnNYS3hpMWlRMkR5L0N0b0FWSlFUQml2dlptVXpGTk0zQXZEaGV4aXVs?=
 =?utf-8?B?Sm1aQUlZV2lxY1VxNG00ck5GWWwrdTAzT0NjMDRDWGRBdWZmN2FQSU40Q3pn?=
 =?utf-8?B?NGNKcWlselU1M0ZXZWRnek0waW9WZjlORlFzY1NyMlNvL1hKUUViQkw3UGpJ?=
 =?utf-8?B?Ty9vUmkvbDdwKzNRVE9LckRzMlQ5eVp0REpXNzRtZGZZS0U1eXBmWW9vWTVX?=
 =?utf-8?B?TGNZdlNCZmpPRWx4NG1tZHNFN1hhbWJ0VFZoYVpGNi9sV29mOFk0clVjcmpn?=
 =?utf-8?B?amMyTDlyRFAzWnhaRUp3cUpYUEVmczBHYkNTY2tFYTFrL2FuUVduSUpYVUZm?=
 =?utf-8?B?SmhzQUdiN25iY3d6S0JlREZsRllhS2I3MHY0cWtVakFueUhkak9GN3h1bEZW?=
 =?utf-8?B?TndIRjhYTXprMUZNZnRSRCs0SWs4a0tIV2Q4UmV4ZUtlb2M3WnNPR0hFakZx?=
 =?utf-8?B?ODVQL2tTTkk4RmhUYTNtZmkzNnZpN1Z5aXlmdDJpUERJbHVnWGNXSWU4M08r?=
 =?utf-8?B?K3R3bEhNbndsS1lKVW96cnpOSkxkTDhINzJsUGxXTHJ4eElJckJvN3pwVW9Y?=
 =?utf-8?B?T1NNVHZxSEpFUGFtYVpRQU50dnVGWnptaTFyelkxK3BNNVJYWXhOVFdaa1Mz?=
 =?utf-8?B?a0tzMkxWRWxWbTJBVjIwQm5nbmVYQ3NyNWNWUVBqbjlqT09RRG5QL0VkREo5?=
 =?utf-8?B?Rno3V1RYZUQ0RUF5a1dGRTZlODlwUnhPUWpUOGl2K0g1V0sxVDllMVdUYk1i?=
 =?utf-8?B?MWpDalhVTmJseUl4TU4wOGU0TUhPMllyK2swdHFjaVdtSkxRcnVuYithU0FT?=
 =?utf-8?B?ZGt2U0Fuc3pZa0k2c0FkVnZMdWd0RkQzcFJ2UmV5bGhVb3o0UmN6NjMwQWNG?=
 =?utf-8?B?RlVqVUh1SThKWHRjWnl2VVlPQysyMEJrYS9keTNvblM0dlJvcDFZOTdxQW5M?=
 =?utf-8?B?aGRYcDFRQ2hJMUMwTEQ3Sm55RUM3d0swWmV5bVZXVyswQnRtM211T2NvZmxs?=
 =?utf-8?B?YjUrZkxBVldiMjZ1SGozTDdwaTFsZDVjTjBjRWN5ZlpvYUhZaUZkeVA5Ylpi?=
 =?utf-8?B?aFNEQjdFL0ZzNnpXRnRiQU1pS0VuaDNLb2Jic3VIOUo1ZWcwSDFSd0piVzZY?=
 =?utf-8?B?WFNXR2ZJbEF6VTRhVzluLzZ4cUlzSkYzRXRMdnZRVkVWdjBkaHJWME1RZy9w?=
 =?utf-8?B?VmdlTVBKSVpvY0FLbSt5Q1V5c0xBVjNOQTNNOExob3dweDZLck1EdUtVWm90?=
 =?utf-8?B?Y3JsUjFJS2RrcmJPeFFUc2lUbERKcWt6elhxYk43K3A3em1sdk1MbExtU0ZE?=
 =?utf-8?B?VnZjQjg3eno0SjZQM1A2Q3N6N2hKSjhINFRuU1pONTB1YW9teWNpd0dvYjJW?=
 =?utf-8?B?NWRwVnYrczVTRVpDMU5jVnpBNkxGYmhLOWdzUTkzamV5Si9EZ0xwdExqb3Jo?=
 =?utf-8?B?UDBtSjdnVnRhY3JacjNGVEpDS2dmeHF6YUY1RHJGOE9naTErZXFqcnNPZHlK?=
 =?utf-8?B?SG1jQUN3K2MyOC82RU51VmNzMWZaQmVKUW9QQld0eE9lUDdsQkptL0l4a2pT?=
 =?utf-8?B?TW0rcGhvVHhodWZmSTFzZDYrYlZDbFNBWkZheWlOQkJoMEVKdmh2Y0lqSm5j?=
 =?utf-8?B?ZnExcXJZTnR0WW9PZDNBL2lNazVUTWd5MzlqZTFOcmxTcXNzdU8zeUF3NUdq?=
 =?utf-8?Q?sScBtV00NeIxoJfTHt4d+djeR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc063ab-cd8b-4393-0b0a-08dd8da27868
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 20:05:10.3382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zeU38adbQIm4Hkwya+AH0JHJZw+FrSpzpe6k19sHjkLPimzqW3udR4KvdT3b6y85pKgtwc7h1HwiRMms1hfEYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7026



On 5/6/2025 8:53 AM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Tue, 6 May 2025, Ilya K wrote:
> 
>>> +#define AMDISP_OV05C10_I2C_ADDR            0x10
>>> +#define AMDISP_OV05C10_PLAT_NAME   "amdisp_ov05c10_platform"
>>> +#define AMDISP_OV05C10_HID         "OMNI5C10"
>>> +#define AMDISP_OV05C10_REMOTE_EP_NAME      "ov05c10_isp_4_1_1"
>>> +#define AMD_ISP_PLAT_DRV_NAME              "amd-isp4"
>>
>> Hey folks, I know v12 might be a bit too late for this one, but I've got
>> another device here (Asus GZ302EA tablet) with a very similar camera
>> setup, but a different sensor (OV13B10), and it looks like this driver
>> just assumes a certain hardcoded configuration... I wonder if it makes
>> sense to reorganize the code so that more sensor configurations can be
>> added without making a separate module? I'd be happy to help with
>> refactoring/testing/etc, if people are interested.
> 
> v12 is not too late, and besides, v9..v12 has happened within 5 days
> which is rather short time (hint to the submitter that there's no need
> to burn patch series version numbers at that speed :-)).
> 
> I'll give folks some time to sort this out if you need to add e.g., some
> driver_data instead.
> 
> --
>   i.
> 
Hi Ilya, Ilpo,

I agree with the suggestion, but how about taking-up the refactoring 
part in a separate patch. Yes this patch focussed on supporting OV05C10 
and even the code review proceeded with this understanding. Refactoring 
now for generic support would require changes that would undo some of 
the recent review feedback (especially related to global variables 
usage). Please let us know what do you think.

Thanks,
Pratap

