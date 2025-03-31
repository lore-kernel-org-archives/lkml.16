Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2041.outbound.protection.outlook.com [40.107.92.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB0615E97;
	Mon, 31 Mar 2025 19:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743448536; cv=fail; b=qF3dQgo08bxFSp6PrDq2MpdKIfV3c10Mwpnn6WK0deC79KBcr+6eyiwnF298Hab/BqLDaezFoVVPVZpCkVZVzgm9ZkT7/SxxXZlpvcqd+XsRhYxoLoRSwzDcbArhn//Q6toX3E9chzBT7pI9URg0sQN6QiZr0lfHOZ/CXps7+Bo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743448536; c=relaxed/simple;
	bh=2Sbd37dcMKxd1JxeUuK89/6Ffy8uSXJaxiv5s2L5lyA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=G+X59pC37sZAfXKgCxNFO+41wbLJZK21Km7iLVoN6SQQjGQyjfp9OEjjQ0RFXjXnn32GH5ct3RSTVi/wT+uZ3prn1sZflbMOkI5vpiI/mpOQu9zWxSQCQ6dAVf+JVX8vS4OZkVGUImCaR3ZxDVqQEphzC9YvVOOYpSDtLY9uvbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iy1iOgoS; arc=fail smtp.client-ip=40.107.92.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iy1iOgoS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cbu/vn+mKk8LbkOujCZxC0f9dK8BhZq/Q4/1TKi0VNu6qou0+jqxNOQHsoarQW3lBMqnmTdnk58GqwGrt3I3/7a9sR/Y0Sj2MAKLEWJRcK8eYM/HRaymkJDn4c8liN36K1RZI3XN6uOsj4Gtn4zcypOwHL2lt9xiZs4bb9WXMDGDdv6/740T9oHiS/P7EiwW17MwzxnYtRjeTi3R2SdnWo8pKU8idxaJ79OPyQHgnPBDniKAj9t/A5LvJqWdxLZPRtGRTa8TImjSVJA98WxOQsXozDwyne8XdVq3ShgcQEyQ4916s6aZVYmxaCagn6POLqn47U41kIC5LU1jOqo9Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xl6N5VISa0YElBri09FK7I6/D8UJ3Co+JDqF7dLuUvo=;
 b=hDbUtKkEvKbKVy2CTHtStdNWghWAB3hOUdlVu9wzHQEPUFeOSaE7exzjrp/tmG2aTx/0NuDDkzVf14gKpgkb4Bc05Ql2pJOGhpizhOv3Pee7KM5uJxqecz/JiKym7EJFrfitKld0nEXzkmpnf6zK+2NsGPoToDDVeywDCBk7Yu5NYmSiEjPze2W1IHVKT4vBGAcuh9BthfVl96dwhjskLQZwrYR6cDl2YVW0oVzTEoy0OH8hp6/SOY8RyfvvOpkMZ6wrkP974znVXKmqlJTmc/HL+1nFXOkRvwBcXdfNiJlU9zQ5BBk9Y5lczwvJ4cCsKnA3u+7dNUPtYQ2eIq92kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xl6N5VISa0YElBri09FK7I6/D8UJ3Co+JDqF7dLuUvo=;
 b=iy1iOgoS8mL64hawyJDGOdAnJf9Z/i2+nqouAsIUtr1kvA3JCHTtYu+CvlWeRzxY1RKNG1DzQissfKs+lcNyIUD991y8Twa/kl1sAH+ZO36QqMUAnGqkxeoTaFPbyRSTeaiuFrnkc67XpZzK9cbFbn3eU2+UNjs0klhItJgs0Gw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by PH7PR12MB6833.namprd12.prod.outlook.com (2603:10b6:510:1af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 19:15:31 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 19:15:30 +0000
Message-ID: <a7cc10b3-9594-4278-a9ca-c48af1004ac1@amd.com>
Date: Mon, 31 Mar 2025 15:15:28 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86: Add AMD ISP platform config for OV05C10
Content-Language: en-GB
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: hdegoede@redhat.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.chan@amd.com, bin.du@amd.com,
 grosikop@amd.com, king.li@amd.com, dantony@amd.com
References: <20250327221423.1248521-1-pratap.nirujogi@amd.com>
 <496ab43a-1d84-6184-db66-7bb19893a7b5@linux.intel.com>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <496ab43a-1d84-6184-db66-7bb19893a7b5@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0235.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::19) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|PH7PR12MB6833:EE_
X-MS-Office365-Filtering-Correlation-Id: c95dcec1-639f-414d-3682-08dd70886729
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VDgzaTN5LytIS1d5YnBaK3N2ZWVFRy8ybFhveXd4MlYzRktQM1FkdFdtRFZi?=
 =?utf-8?B?eHBxUDltSW4vZ3diQXhEQ1BJb3hUdmdKeHZyRWQ1SVRSSWhKQnhsM3lNZlg4?=
 =?utf-8?B?a1hhbVhTdHVvak5KdlRGYng1cW9uVXFFRzdscUpxRFA1aUNFdEMrNXpBYjB0?=
 =?utf-8?B?VFcxTTNXbURlV0lBQlBIUkMzTEdFaCtra0UweFNLcFZ2Vk5ieTkyb2FhRmY4?=
 =?utf-8?B?eWdqazhNN1RqdEJ1YnBqVU4xNlNPeVB5ay9FNVpvMXZzUnB2bFJzWlQ3cTEv?=
 =?utf-8?B?SzBJTlI5VkxsWjZ5dEVpb3k5WG9ZUGZ3VEQ1SE9UM1R5cXhoa29uTUdDaERZ?=
 =?utf-8?B?cEdaVG5SdEIzTTBoOExSbEFycmdHR3pGMXQ0T3h3eVI4SU1SZ09SR1k2SzJO?=
 =?utf-8?B?REc3eWJyQ3JUNXpNdDBlV3FNZjk5QjlIanpNWkJNYVhIWmh6RjNSMDNsc21r?=
 =?utf-8?B?YUpiSWdtS1BvK0pSNm91a0QrVnRoTUkvZ3BNV1BoME5vRTB0VDhJVjJkZEJ1?=
 =?utf-8?B?eTdjSWJ2MlFqdWx3WjcrTlNlMlZsNi85UDZLdWFkcWx6UjQ2dEpPVGxmbEhi?=
 =?utf-8?B?QUtDNGpZRzUySkRxNzFhL2p6bktIQjFZNlNaWHVhUTB3akFvQ0xJV1RhQXI0?=
 =?utf-8?B?LzcrTDNBY2RPNTdLcCtwZHVwQURDb21vbWpwZnpXdE0vdk1lS2huZXA2clN1?=
 =?utf-8?B?WWRyYm9maWxMRlVGcUtrQUpZcFpnZkxiZ0ZiUldFVU1oNWFlWjhCU0ZSR1Mx?=
 =?utf-8?B?ckh3RVdMMzNSdHVWaFpsc0tieDRZWGNpUTRFZWV1NlNGcmxjb0VZR3VJWTNB?=
 =?utf-8?B?dktWSGQ4dnhGcktCLzhqc2kveURTMUVHbCsrRVNGbmlaajB5dktKclhWcnV3?=
 =?utf-8?B?MTYxOE1mdExUWHZpc3cyYzZQSFJ5ejlBL29WU3djNklIdEtKZXY2d3BKOG96?=
 =?utf-8?B?Ri8wNC9KcHhiSmZlUlUrWDVyNi93UDMwbkttTVMrQWJjZFJrVkRhMEFLTVBK?=
 =?utf-8?B?YjFUaFJ1eUZUNUFjQjBKVjIxUTB4cnI2UmdpM3E4V2JvUU1FcUxTbE5jSEt5?=
 =?utf-8?B?S0ZQM1BYd0JIOXhXSDFhck9QUnNwVzB1MmlyckRmQyt0UnpBNTFla2lRMlNS?=
 =?utf-8?B?THE1Wmx2cFZIVG4wNDJ6TURVSFJ2aWFnNDV2WFRwVWNxMkdkVEV5bDExZVQx?=
 =?utf-8?B?T1cyR1JRdGp6TmRXR3dLaElwNlpZV3lnZHFydUIrYVhkbWRRSUM5ZTNQZmlv?=
 =?utf-8?B?aE5LYWNWV3VIc0hwS3dOM2cxWnFzTmRsSnJBWlVHRmpjWjVVUU00T3hCRjhJ?=
 =?utf-8?B?MTBSQm9nS09WNDl5Z2VPdG94cXcrR0RGWWt1UWVWdjBvaUJMUkJXNXZiV1kx?=
 =?utf-8?B?U0xOMk9HY2tSNGNpbWtiRTRTMmRMcXhuMWRnL1Q5ME5WV2FvRHZaNmVHa1Ft?=
 =?utf-8?B?dnNRQlA3YUhTcXNINkVBZTl3eUR5R3BDR3NPYW1CS0g2ZmRzVEFMaEZBTzJC?=
 =?utf-8?B?VjVYNzlPeWlxMFdYY2pXUEtUbUNWZy9DRjNhNDVYaWtLV1ZsRjhTNTNmL2hD?=
 =?utf-8?B?OVFHNUhOMDlzUWY2akVZalZHbi9TV3l0d2ZPYTU2bTlDdjFZSGJBMDRKV25s?=
 =?utf-8?B?WXcvakx3Q1dXbEdKeHBFRFp3eThFdU5ralNYMXM2eVEySmhOOTFpMVdTOVNr?=
 =?utf-8?B?eFhBNXB1UE9NRHRIR2dVRjIvTE9uYW1sZjc4Sm1DOGsvbmFrYVphOWtvRk81?=
 =?utf-8?B?OTZYRFkvZzN4a2lMcS9kdG9yMVdDVVp5Qk85N3RJMTNPYmFPSXhxSndmZjQr?=
 =?utf-8?B?TE1BWG0wVzBQamp0TFJKUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzdZVjlxRk9GZllyaFNVa0h3RkxZWVZRSHllZHFvUjlJWk45Zy81TThLTGx1?=
 =?utf-8?B?NlZETWdPdEQ2UkphRnNRMHplSmNydnBjb0Q1dDNlVm84N01sODZROVpLdFFX?=
 =?utf-8?B?N0NzQTJTb3NmTmpWQW02bFRSK0JKK3FTekpNRmRxTi9yUHhPUGxqa1hsK0lk?=
 =?utf-8?B?NTZuL0s5ZlZSeHpVWjNaNURjNGt0RlhQWEsvdmRpWnI1ZUU4VmhiRzEwL3VO?=
 =?utf-8?B?QWJJeXpvNjZFeW5vamd5aWV5MXRkL2dNc0hycUg0SlZCZnVVamxMSmxSWG1o?=
 =?utf-8?B?TjlEVzdoZTYrdnU0MklZK1djQ2hDcjRLbVlrSVBKNFR2S2VhN1lKM1paYS9x?=
 =?utf-8?B?YTVId1J3L1NhWndHY0d2VEtnU2I3cDJQN3VWRCtzVjhhSEJHdk1EUTNzb01W?=
 =?utf-8?B?VGlncXBsQU5VTWNRSXh2b0tsUG1naXlsTDZ6Zy9wVlJCN1YwMzBIdzJlUmFn?=
 =?utf-8?B?Z1hkSjZpbEhOM1VhcXlNYmY0WEJreU9oYWoxSFNadHJjdFZZYkxlS3Y4aGxi?=
 =?utf-8?B?S1pqczlSMjNHZ0ZoQzBrMXNudUdjT21rMkcrbW9rSUhFMmZjWUNMc201anFY?=
 =?utf-8?B?OXhSY1hYUmE1TVFyTFFBZDlwbjZZZ3lQamxmWGptUHdMb2xvb3dZT0Z3dlhS?=
 =?utf-8?B?TEdCQkJlbFg5UW5HM05KRVFrNk1SS3VlSEVlZnRwYXZIdndZdURBZEFLb3U2?=
 =?utf-8?B?UktiUGpzTUpwZGdDNzN1elRGWXdWR1FaeExwaVltODR4NU1RckdxcHNYcUhx?=
 =?utf-8?B?d0xsYzFjTElrMmk4ejdoelZRTkgzUU1SWlBQL3luNEFTUy82OWlXbjlWMThy?=
 =?utf-8?B?WnBVU0hZVlRuUmV5cW1TTjdKVzlXY1JnbTlmMDlpUmsvUkZiZ1VNQVViNkh5?=
 =?utf-8?B?ZktzcWpieXQ1aFUxRVk1QktPQWxmb3pZcXpvcDNZZEgzaTNHalI1Q0Zjb29M?=
 =?utf-8?B?WDdIZ2k5dlJSTWhhd2hzS3pVT3hFRzZyTHRrOUk3RjVZaHBnWDFEbDBsVFJT?=
 =?utf-8?B?eFU3Z0JpYkNXVy8rd09Ubm1mb3ZkMjZyOWlWclJQRCsxcDdCbEdtcE1ybEFY?=
 =?utf-8?B?YS9QMThWMHBBbFp1dlc2WjhkTzJqYWxHbUw5ZFRBNXI1RHo1L25WRzg1WHpa?=
 =?utf-8?B?eWVSdTVpbXVlSGlhb05wSEphK1NySU9pY3FPVHhudTc2MkNManZVc1pOTW4z?=
 =?utf-8?B?OGN6djNPeFZDSjFXM3dFMUl3OVYzbWFCVVNmZ04zOGdBTzhhMlNHMFJ3TWhw?=
 =?utf-8?B?REY3bjc0MEI5d0h2TzBibU5pN3VzMTAxUjJkMjZJVXcyUVhpaGhESFNiTWtu?=
 =?utf-8?B?VFoxNTNCbnpnVUtzMS8vQ0dpSElMcDA4ZTR1bG5sQWpkYXRmalVITEsxUG1I?=
 =?utf-8?B?ekpXaFhnTjJoV0RyRjUzNVpDNW1MNE42MitoTmcxT2Q5Qzc5eWo0MDRaMkpz?=
 =?utf-8?B?UjIvOWIvWFdiTXNmbGQvOG1tRjRwV0gwRzNXUWxXbGpMREhVSFNVKzhBa3ps?=
 =?utf-8?B?S00rdmRiV3REMEZoZTFsWlR0ZUdORk14a2JqMmtKeEI0RlRnQnYycnFyelo0?=
 =?utf-8?B?MUY0Q0tKUDJhRzV2NlQ1aDU2aXZZNXM2bVdCenNMR3RvM1dESGVBVDNqT043?=
 =?utf-8?B?MU45YTJ3NWlJVnpyc0ZvbldpUWF3TjEyalc0cGVnQmhid3ZSSENvdGVZNWMx?=
 =?utf-8?B?QzRrZWtSSEhqODhUby9VQzhJQWxTOWlreWl1U2pSTUx0YUoweE0veE5aVVhV?=
 =?utf-8?B?TGNyK1NybmM2cTJ6Zm56cXcyOXJ5d3JIWjJyQUI1VTNUV1ZPZGdMalZidUha?=
 =?utf-8?B?VDEwb2pFMWxTMVd4NThmRG1oaHdkNU9JVWh3K2RRd0MwVlZFNWo0R1VlNUFW?=
 =?utf-8?B?RHppMlBCeXVwdTdGWlc1d3Z1bDliVlJmcCtZbERUazNma3VFR3BYZnlkMmti?=
 =?utf-8?B?ZHN3Q25YQzZxTjJJMzg0S1FQYnJLdkJLOUt2ZnBWV1NlN09QOXBob1p3S1ZP?=
 =?utf-8?B?aWdwTHFyek9OaUdjM2xXUTg5Y2FxT1ljR2tQS2Rzem9yWUNReHRiZFpFRUFy?=
 =?utf-8?B?aEUxRGQveGFrVW9rWFlxK2tNeTFuNFNHb1R4STRyeDRQY2l3d05DWDlDTGJM?=
 =?utf-8?Q?DFWfcZNopk1Zr8ShUqmtoXoqD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c95dcec1-639f-414d-3682-08dd70886729
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 19:15:30.6445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ViN9jFuQhtY/fiV4XhHEEnztTDcgYjESoo0DRZQ3LCvs35ueGZZt+J1rxVz8EIJeyjib2ivKIfHjPw8JSFSWPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6833

Hi Ilpo,

Thanks for the review.

Thanks,
Pratap

On 3/28/2025 6:01 AM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Thu, 27 Mar 2025, Pratap Nirujogi wrote:
> 
>> ISP device specific configuration is not available in ACPI. Add
>> swnode graph to configure the missing device properties for the
>> OV05C10 camera device supported on amdisp platform.
>>
>> Add support to create i2c-client dynamically when amdisp i2c
>> adapter is available.
>>
>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>> Signed-off-by: Benjamin Chan <benjamin.chan@amd.com>
>> ---
>> v2 -> v3:
>>
>> - Remodelled as ACPI driver to bind the device when matching
>> acpi sensor device is detected. This eliminated the need for
>> dmi checks for platform validation.
>>
>> - Added software nodes to align with camera device-tree format
>> to capture the camera device properties missing in the ACPI.
>>
>> - Constructed swnode graph in the below format to successfully
>> parse the endpoint node using v4l2_fwnode_endpoint_alloc_parse().
>>
>> OMNI5C10 {
>>        refclk = 24MHz;
>>        ports {
>>                port@ {
>>                        endpoint {
>>                                bus-type = 4;
>>                                data-lanes = <1 2>;
>>                                link-frequencies = 925MHz;
>>                                remote-endpoint = &ov05c10_refs;
>>                        };
>>                };
>>        };
>> };
>>
>> - GPIO sensor lookup is moved out of this driver scope, it is taken care
>> in isp driver module init.
>>
>> - This platform driver is specific to AMD ISP4, hence renamed driver
>> name as "amd-isp4".
>>
>>   drivers/platform/x86/amd/Kconfig    |  11 +
>>   drivers/platform/x86/amd/Makefile   |   1 +
>>   drivers/platform/x86/amd/amd_isp4.c | 354 ++++++++++++++++++++++++++++
>>   3 files changed, 366 insertions(+)
>>   create mode 100644 drivers/platform/x86/amd/amd_isp4.c
>>
>> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
>> index c3e086ea64fc..4b373edd750d 100644
>> --- a/drivers/platform/x86/amd/Kconfig
>> +++ b/drivers/platform/x86/amd/Kconfig
>> @@ -32,3 +32,14 @@ config AMD_WBRF
>>
>>          This mechanism will only be activated on platforms that advertise a
>>          need for it.
>> +
>> +config AMD_ISP_PLATFORM
>> +     bool "AMD platform with ISP4 that supports Camera sensor device"
>> +     depends on I2C && X86_64 && AMD_ISP4
>> +     help
>> +       For AMD platform that support Image signal processor generation 4, it
>> +       is necessary to add platform specific camera sensor module board info
>> +       which includes the sensor driver device id and the i2c address.
>> +
>> +       If you have a AMD platform that support ISP4 and with a sensor
>> +       connected to it, say Y here
>> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
>> index c6c40bdcbded..b0e284b5d497 100644
>> --- a/drivers/platform/x86/amd/Makefile
>> +++ b/drivers/platform/x86/amd/Makefile
>> @@ -10,3 +10,4 @@ obj-$(CONFIG_AMD_PMC)               += pmc/
>>   obj-$(CONFIG_AMD_HSMP)               += hsmp/
>>   obj-$(CONFIG_AMD_PMF)                += pmf/
>>   obj-$(CONFIG_AMD_WBRF)               += wbrf.o
>> +obj-$(CONFIG_AMD_ISP_PLATFORM)       += amd_isp4.o
>> diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/x86/amd/amd_isp4.c
>> new file mode 100644
>> index 000000000000..c4dce3779543
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd/amd_isp4.c
>> @@ -0,0 +1,354 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * AMD ISP platform driver for sensor i2-client instantiation
>> + *
>> + * Copyright 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <linux/acpi.h>
>> +#include <linux/device/bus.h>
>> +#include <linux/dmi.h>
>> +#include <linux/gpio/machine.h>
>> +#include <linux/init.h>
>> +#include <linux/i2c.h>
>> +#include <linux/kernel.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/property.h>
>> +#include <linux/units.h>
>> +
>> +#define AMDISP_OV05C10_I2C_ADDR              0x10
>> +#define AMDISP_OV05C10_PLAT_NAME     "amdisp_ov05c10_platform"
>> +#define AMDISP_OV05C10_HID           "OMNI5C10"
>> +#define AMDISP_OV05C10_REMOTE_EP_NAME        "ov05c10_isp_4_1_1"
>> +#define AMD_ISP_PLAT_DRV_NAME                "amd-isp4"
>> +
>> +/*
>> + * AMD ISP platform definition to configure the device properites
>> + * missing in the ACPI table.
>> + */
>> +struct amdisp_platform {
>> +     const char *name;
>> +     struct i2c_board_info board_info;
>> +     u8 i2c_addr;
>> +     struct i2c_client *i2c_dev;
>> +     u8 max_num_swnodes;
> 
> I'd put u8 next to each other to avoid having unnecessary gaps in the
> layout (I understand you put them in this order likely due to logical
> connection between the integer and pointer but having u8 sprinkled
> around here and there leaves holes into the layout).
> 
thanks, will update the order of variables to avoid holes in the next V4 
submission.

>> +     struct software_node **swnodes;
>> +};
>> +
>> +static struct amdisp_platform *ov05c10_amdisp;
>> +
>> +/* Top-level OV05C10 camera node property table */
>> +static const struct property_entry ov05c10_camera_props[] __initconst = {
>> +     PROPERTY_ENTRY_U32("refclk", 24 * HZ_PER_MHZ),
>> +     { }
>> +};
>> +
>> +/* Root AMD ISP OV05C10 camera node definition */
>> +static const struct software_node camera_node = {
>> +     .name = AMDISP_OV05C10_HID,
>> +     .properties = ov05c10_camera_props,
>> +};
>> +
>> +/*
>> + * AMD ISP OV05C10 Ports node definition. No properties defined for
>> + * ports node for OV05C10.
>> + */
>> +static const struct software_node ports = {
>> +     .name = "ports",
>> +     .parent = &camera_node,
>> +};
>> +
>> +/*
>> + * AMD ISP OV05C10 Port node definition. No properties defined for
>> + * port node for OV05C10.
>> + */
>> +static const struct software_node port_node = {
>> +     .name = "port@",
>> +     .parent = &ports,
>> +};
>> +
>> +/*
>> + * Remote endpoint AMD ISP node definition. No properties defined for
>> + * remote endpoint node for OV05C10.
>> + */
>> +static const struct software_node remote_ep_isp_node = {
>> +     .name = AMDISP_OV05C10_REMOTE_EP_NAME,
>> +};
>> +
>> +/*
>> + * Remote endpoint reference for isp node included in the
>> + * OV05C10 endpoint.
>> + */
>> +static const struct software_node_ref_args ov05c10_refs[] __initconst = {
>> +     SOFTWARE_NODE_REFERENCE(&remote_ep_isp_node),
>> +};
>> +
>> +/* OV05C supports one single link frequency */
>> +static const u64 ov05c10_link_freqs[] __initconst = {
>> +     925 * HZ_PER_MHZ,
>> +};
>> +
>> +/* OV05C supports only 2-lane configuration */
>> +static const u32 ov05c10_data_lanes[] __initconst = {
>> +     1,
>> +     2,
>> +};
>> +
>> +/* OV05C10 endpoint node properties table */
>> +static const struct property_entry ov05c10_endpoint_props[] __initconst = {
>> +     PROPERTY_ENTRY_U32("bus-type", 4),
>> +     PROPERTY_ENTRY_U32_ARRAY_LEN("data-lanes", ov05c10_data_lanes,
>> +                                  ARRAY_SIZE(ov05c10_data_lanes)),
>> +     PROPERTY_ENTRY_U64_ARRAY_LEN("link-frequencies", ov05c10_link_freqs,
>> +                                  ARRAY_SIZE(ov05c10_link_freqs)),
>> +     PROPERTY_ENTRY_REF_ARRAY("remote-endpoint", ov05c10_refs),
>> +     { }
>> +};
>> +
>> +/* AMD ISP endpoint node definition */
>> +static const struct software_node endpoint_node = {
>> +     .name = "endpoint",
>> +     .parent = &port_node,
>> +     .properties = ov05c10_endpoint_props,
>> +};
>> +
>> +/*
>> + * AMD ISP swnode graph uses 5 nodes and also its relationship is
>> + * fixed to align with the structure that v4l2 expects for successful
>> + * endpoint fwnode parsing.
>> + *
>> + * It is only the node property_entries that will vary for each platform
>> + * supporting different sensor modules.
>> + */
>> +#define NUM_SW_NODES 5
>> +
>> +static const struct software_node *ov05c10_nodes[NUM_SW_NODES + 1] = {
>> +     &camera_node,
>> +     &ports,
>> +     &port_node,
>> +     &endpoint_node,
>> +     &remote_ep_isp_node,
>> +     NULL
>> +};
>> +
>> +/* OV05C10 specific AMD ISP platform configuration */
>> +static const struct amdisp_platform amdisp_ov05c10_platform_config = {
>> +     .name = AMDISP_OV05C10_PLAT_NAME,
>> +     .board_info = {
>> +             .dev_name = "ov05c10",
>> +             I2C_BOARD_INFO("ov05c10", AMDISP_OV05C10_I2C_ADDR),
>> +     },
>> +     .i2c_addr = AMDISP_OV05C10_I2C_ADDR,
>> +     .max_num_swnodes = NUM_SW_NODES,
>> +     .swnodes = (struct software_node **)ov05c10_nodes,
>> +};
>> +
>> +static const struct acpi_device_id amdisp_sensor_ids[] = {
>> +     { AMDISP_OV05C10_HID },
>> +     { }
>> +};
>> +MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
>> +
>> +static bool is_isp_i2c_adapter(struct i2c_adapter *adap)
>> +{
>> +     return !strncmp(adap->owner->name, "i2c_designware_amdisp", 48);
> 
> Eh, where that magic 48 comes from??? Why do you even need str_n_cmp()
> variant here?
My bad I missed to update the max count. Initially I was using 
adap->name for checking, which is fixed to 48 chars. But later moved to 
adap->owner->name and missed to update the count.

https://github.com/torvalds/linux/blob/master/include/linux/i2c.h#L754

Ideally str_n_cmp() is not required in this case, strcmp is safe to use 
as both strings are known to be NULL terminated.

Will replace str_n_cmp() with strcmp() in V4.

> 
>> +}
>> +
>> +static void instantiate_isp_i2c_client(struct i2c_adapter *adap)
>> +{
>> +     struct i2c_board_info *info = &ov05c10_amdisp->board_info;
>> +     struct i2c_client *i2c_dev = ov05c10_amdisp->i2c_dev;
>> +
>> +     if (i2c_dev)
>> +             return;
>> +
>> +     if (!info->addr) {
>> +             dev_err(&adap->dev, "invalid i2c_addr 0x%x detected\n",
>> +                     ov05c10_amdisp->i2c_addr);
>> +             return;
>> +     }
>> +
>> +     i2c_dev = i2c_new_client_device(adap, info);
>> +     if (IS_ERR(i2c_dev)) {
>> +             dev_err(&adap->dev, "error %ld registering isp i2c_client\n",
>> +                     PTR_ERR(i2c_dev));
> 
> Please use %pe.
> 
sure, will use %pe in V4.


>> +             i2c_dev = NULL;
>> +     } else {
>> +             dev_dbg(&adap->dev, "registered amdisp i2c_client on address 0x%02x\n",
>> +                     info->addr);
>> +     }
>> +     i2c_put_adapter(adap);
>> +}
>> +
>> +static int isp_i2c_bus_notify(struct notifier_block *nb,
>> +                           unsigned long action, void *data)
>> +{
>> +     struct device *dev = data;
>> +     struct i2c_client *client;
>> +     struct i2c_adapter *adap;
>> +     struct i2c_client *i2c_dev = ov05c10_amdisp->i2c_dev;
>> +
>> +     switch (action) {
>> +     case BUS_NOTIFY_ADD_DEVICE:
>> +             adap = i2c_verify_adapter(dev);
>> +             if (!adap)
>> +                     break;
>> +             if (is_isp_i2c_adapter(adap))
>> +                     instantiate_isp_i2c_client(adap);
>> +             break;
>> +     case BUS_NOTIFY_REMOVED_DEVICE:
>> +             client = i2c_verify_client(dev);
>> +             if (!client)
>> +                     break;
>> +             if (i2c_dev == client) {
>> +                     dev_dbg(&client->adapter->dev, "amdisp i2c_client removed\n");
>> +                     i2c_dev = NULL;
>> +             }
>> +             break;
>> +     default:
>> +             break;
>> +     }
>> +
>> +     return NOTIFY_DONE;
>> +}
>> +
>> +static struct notifier_block isp_i2c_nb = { .notifier_call = isp_i2c_bus_notify };
>> +
>> +static int release_amdisp_swnode_props(struct software_node **swnodes,
>> +                                    u8 num_swnodes)
>> +{
>> +     int i;
> 
> unsigned int
> 
sure, will update in V4.

>> +
>> +     for (i = 0; i < num_swnodes; i++) {
>> +             if (swnodes[i] &&
>> +                 !IS_ERR_OR_NULL(swnodes[i]->properties)) {
> 
> This fits to a sinle line and you can remove the braces too then.
> 
>> +                     property_entries_free(swnodes[i]->properties);
>> +             }
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static int initialize_ov05c10_swnode_props(struct amdisp_platform *p)
>> +{
>> +     struct software_node *sw_node;
>> +     int ret;
>> +     int i;
> 
> unsigned int, please move it before ret as it will be then longer than
> "int ret;"
> 
sure, will address this in V4.

>> +
>> +     if (strncmp(p->name, AMDISP_OV05C10_PLAT_NAME,
>> +                 strlen(AMDISP_OV05C10_PLAT_NAME)))
> 
> Why you need str_n_cmp()?? AMDISP_OV05C10_PLAT_NAME is NUL terminated so
> strlen(AMDISP_OV05C10_PLAT_NAME) "stop point" is meaningless.
> 
yeah, I agree, str_n_cmp() is not required, will use strcmp() in V4.


>> +             return -EINVAL;
>> +
>> +     /* Initialize platform specific props for each node */
> 
> This seems pretty unnecessary comment given the name of this function. I'd
> just drop it as it doesn't add much vlaue.
> 
>> +     for (i = 0; i < p->max_num_swnodes; i++) {
>> +             sw_node = p->swnodes[i];
>> +
>> +             if (sw_node->properties) {
> 
> Please reverse the logic and use continue.
> 
sure, will update using if(!sw_node->properties) in V4.

>> +                     sw_node->properties = property_entries_dup(sw_node->properties);
>> +                     if (IS_ERR(sw_node->properties)) {
>> +                             ret = PTR_ERR(sw_node->properties);
>> +                             goto error_release_node_props;
>> +                     }
>> +             }
>> +     }
>> +
>> +     return 0;
>> +
>> +error_release_node_props:
>> +     release_amdisp_swnode_props(p->swnodes, p->max_num_swnodes);
>> +     return ret;
>> +}
>> +
>> +static struct amdisp_platform *prepare_amdisp_platform(const struct amdisp_platform *src)
>> +{
>> +     struct amdisp_platform *isp_ov05c10;
>> +     const struct software_node **sw_nodes;
>> +     const struct software_node *sw_node;
>> +     struct i2c_board_info *info;
>> +     int ret;
>> +
>> +     isp_ov05c10 = kmemdup(src, sizeof(*isp_ov05c10), GFP_KERNEL);
>> +     if (!isp_ov05c10)
>> +             return ERR_PTR(-ENOMEM);
>> +
>> +     ret = initialize_ov05c10_swnode_props(isp_ov05c10);
>> +     if (ret)
>> +             goto error_free_platform;
>> +
>> +     info = &isp_ov05c10->board_info;
>> +
>> +     sw_nodes = (const struct software_node **)src->swnodes;
>> +     ret = software_node_register_node_group(sw_nodes);
>> +     if (ret)
>> +             goto error_unregister_sw_node;
>> +
>> +     sw_node = (const struct software_node *)src->swnodes[0];
>> +     info->fwnode = software_node_fwnode(sw_node);
>> +     if (IS_ERR(info->fwnode)) {
>> +             ret = PTR_ERR(info->fwnode);
>> +             goto error_unregister_sw_node;
>> +     }
>> +
>> +     return isp_ov05c10;
>> +
>> +error_unregister_sw_node:
>> +     software_node_unregister_node_group(sw_nodes);
>> +
>> +error_free_platform:
>> +     kfree(isp_ov05c10);
>> +     return ERR_PTR(ret);
>> +}
>> +
>> +static int amd_isp_probe(struct platform_device *pdev)
>> +{
>> +     int ret;
>> +
>> +     ov05c10_amdisp = prepare_amdisp_platform(&amdisp_ov05c10_platform_config);
>> +     if (IS_ERR(ov05c10_amdisp)) {
>> +             pr_err("failed to prepare amdisp platform fw node");
> 
> Missing \n
> 
> dev_err_probe()
> 
sure, will take care of both \n and dev_err_probe() suggestions in V4.

>> +             return PTR_ERR(ov05c10_amdisp);
>> +     }
>> +
>> +     /*
>> +      * Register notifier to instantiate i2c client when AMD ISP adapter
>> +      * is ready.
> 
> How is "when AMD ISP adapter is ready" related to what the code does below
> this comment?? If it only refers to "once we've setup everything", that's
> what probe is doing in general so why comment such obvious expectation.
> The first part of the comment can be read from the code below so I think
> this entire comment is useless.
> 
>> +      */
>> +     ret = bus_register_notifier(&i2c_bus_type, &isp_i2c_nb);
>> +     if (ret)
>> +             goto error_free_platform;
>> +
>> +     return ret;
>> +
>> +error_free_platform:
>> +     kfree(ov05c10_amdisp);
> 
> Is this really all you have to rollback??? It seems that
> prepare_amdisp_platform() does more rollback itself if it fails in the
> middle (and so does amd_isp_remove) so why those same rollbacks do not
> need to be done here?
> 
This rollback is added to free the ov05c10_amdisp handle which is 
allocated in prepare_amdisp_platform().

>> +     return ret;
>> +}
>> +
>> +static void amd_isp_remove(struct platform_device *pdev)
>> +{
>> +     bus_unregister_notifier(&i2c_bus_type, &isp_i2c_nb);
>> +     i2c_unregister_device(ov05c10_amdisp->i2c_dev);
> 
> I've my reservations about this when it comes to things being properly
> synchronized.
> 
I need check if i2c framework has any protections. Any recommedations or 
references please on how to gurantee the synchronization for safe 
i2c_unregister_device().

>> +     release_amdisp_swnode_props(ov05c10_amdisp->swnodes,
>> +                                 ov05c10_amdisp->max_num_swnodes);
>> +     software_node_unregister_node_group((const struct software_node **)
>> +                                         ov05c10_amdisp->swnodes);
>> +     kfree(ov05c10_amdisp);
>> +}
>> +
>> +static struct platform_driver amd_isp_platform_driver = {
>> +     .driver = {
>> +             .name                   = AMD_ISP_PLAT_DRV_NAME,
>> +             .acpi_match_table       = amdisp_sensor_ids,
>> +     },
>> +     .probe  = amd_isp_probe,
>> +     .remove = amd_isp_remove,
>> +};
>> +
>> +module_platform_driver(amd_isp_platform_driver);
>> +
>> +MODULE_AUTHOR("Benjamin Chan <benjamin.chan@amd.com>");
>> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
>> +MODULE_DESCRIPTION("AMD ISP4 Platform Driver");
>> +MODULE_LICENSE("GPL");
>>
> 
> --
>   i.
> 

