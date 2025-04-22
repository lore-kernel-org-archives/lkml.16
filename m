Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2062.outbound.protection.outlook.com [40.107.92.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E843D290BDD
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745310534; cv=fail; b=r2x6szz80GA2rYVzSyObJf2X+vP1BdhL14IBRiWMAA07jmzyjFcDM0IV6P31Ro2+oCSAboLM2uMPuEYGtu8K8gh4Cgs7JDUecbBWT+35YWZ1hcn4lHgalmOEOmjPJDlijWKaqMcClZr2QLWtUT5+IK732hFYAVW4ft3ijYXt+Lc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745310534; c=relaxed/simple;
	bh=zD8/0MnZZS2HHdf3YXpoBj68/1NwAFZvZL1u/Pn0qeI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=L0IwGdQob9Qwxt7E/aO/DSGiN94B/e7BKjqYHotIDbWaOLukWMW6/I/okMdxrp8UEdok9uB9RU3I88F+MYQir8oGBq6GiokToJI96ThtuP0D2DNjt7d/wqTei+N6fdEhaFrlnhUIYHN1H/NrvdleHzq7KwIEjsJGjx6ACYs6i1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=d8ZjzlUz; arc=fail smtp.client-ip=40.107.92.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="d8ZjzlUz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j7GQO9J/xK9WMT+BXAuFnM6P9nEPHsfjJEDD75DykVYffhJ7Nanm9zp1Vi2HRLP9b7V1GqyAf28upAbxXFpRbhsBtfbfgSVLtBo8e08iqsMJVxd70VswCwArhPZ5Vw9MjywQ8Oh/N/qQVrHK3F5ML8hIEYn7ZDm5TgjwKDx0MApy+SVCSb42pei1j8JO+pbxu+/Hecl9qvg4TciS4x613G6CzCCAFwi/iVU9iMKjNVg8AntcCneomH3uyeCMnbTH3uhihQqZtVDAA0/04N0BgdpEQ4uKAyqzR6Q6wuaZQS47TRI4MoUAJtOxFOwAKL0wDg46SnBH/vB1L0j+JSBWTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9YWq0OWyHkzVk/vnrX9CXpmf9D722r5E829cZzrmge8=;
 b=y27cfEwzuxSOl62+OIizBsVcZJJccEtFICvnhb1kTOciNM8M8s01cnLE53lfJaFIyheWZ9j0Q4iqawLRBVQHBk8luHD0iP2x+mt6mSKy/jrd1vsf1euyB2YI52kJezW2DoB0FbBkWVahjRuyw9n3zQDnKJNNEO7Bl8NnLodBq6jxblEDqkup1e+pN3zOFq3WoEYyMiAkixeE/T8lq3igFj1dzVw05rNkr5f+WcAtG/sHebnD+6dgVLr6hXD3VPTTTGzz31ajan1tc2FNyUUokoFE1PbpqaOTcK68kfgS++a3upGmuFpI/TcFBugAZgnjyUI57rJZK2IDhuILD3P5AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YWq0OWyHkzVk/vnrX9CXpmf9D722r5E829cZzrmge8=;
 b=d8ZjzlUzw7O0RcRDabhbaT3cAGfqYf4wYq2nkIZyX+1+4OhY/7ZL0/Pj5rp42PH0HKMOTtbeEo2Izmqb7v+DCwIUjhL8KTVD9WP7AWE0vexD91ryuEcKEhNm3xj/vfmzPe5Ch94reYGWto0qrZXTQGuuRFQJjmUilWG6VU76+9E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6434.namprd12.prod.outlook.com (2603:10b6:208:3ae::10)
 by PH7PR12MB5688.namprd12.prod.outlook.com (2603:10b6:510:130::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Tue, 22 Apr
 2025 08:28:46 +0000
Received: from IA1PR12MB6434.namprd12.prod.outlook.com
 ([fe80::dbf7:e40c:4ae9:8134]) by IA1PR12MB6434.namprd12.prod.outlook.com
 ([fe80::dbf7:e40c:4ae9:8134%3]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 08:28:45 +0000
Message-ID: <37775bf2-d571-434c-8670-827631e2eb12@amd.com>
Date: Tue, 22 Apr 2025 13:58:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: AMD GPU driver load hitting BUG_ON in sync_global_pgds_l5()
To: Balbir Singh <balbirs@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Cc: Dave Hansen <dave.hansen@linux.intel.com>, luto@kernel.org,
 peterz@infradead.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 x86@kernel.org, hpa@zytor.com, nikunj@amd.com, kees@kernel.org,
 alexander.deucher@amd.com
References: <bae920c0-a0ff-4d85-a37a-6b8518c0ac41@amd.com>
 <ad725f4b-6e45-42e4-ba6d-919534bc99a4@nvidia.com>
Content-Language: en-US
From: Bharata B Rao <bharata@amd.com>
In-Reply-To: <ad725f4b-6e45-42e4-ba6d-919534bc99a4@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0173.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::17) To IA1PR12MB6434.namprd12.prod.outlook.com
 (2603:10b6:208:3ae::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6434:EE_|PH7PR12MB5688:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b1f4312-e3ac-467b-c9a7-08dd8177b2b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bkdWdHNqR0pmVUQ5TlNETDQ0SytPcWNqdlRNNmw1YVJxc1M1WnZua1JXd1Rh?=
 =?utf-8?B?MnNiaXd1eFo5RUlHN3V0NVJBNFdBWHpCWlZaWEovZkFpa0YxWTRrN09ub0p1?=
 =?utf-8?B?RGZzVkd5RWFXNzd4dy9XSHRCY2c3OUxUc1lQaUtWWEJ3amRwSkV4aWxlMkNj?=
 =?utf-8?B?aUx2RUtIWVFEME0xaEsxbWk1S0hRUVlSY0NIRFRUTUUyb2ZwVG1RcTkzQ2o4?=
 =?utf-8?B?SlZmTlJXY2VwMElqSDdwR2lNSjdBZlVHVDVKM0hMak1zMkpOcFRWSFF0Vk0w?=
 =?utf-8?B?NGU4dkhkc0RXQ1Q4SnhqMndvSUJ3cEZQaEdtSmZnb2RLWDRCRjE3RCtENC9h?=
 =?utf-8?B?dTBaanFDN0NGdmpIVjd1Vlh1TmduaitnNDlIOEFWMTh6SENTZ01adngyaFY0?=
 =?utf-8?B?NDRqMUh1ZlcyNHk5R3J6NDlMdHk4NUNHbzkrdEVUVC9Rc2tjZmpza1NEMGtD?=
 =?utf-8?B?YTNHZXdsOTV0ajdQbEpPTHFWZHhtUnJ2Q0dmSDZwVWJQMjU0NGZYdDlPdDNh?=
 =?utf-8?B?Z3IzbXZBdXl1TFIzZm4vZmpmSDZtdWFMSi9hUWMrVHIzeEtYTjY2T3dvM1pF?=
 =?utf-8?B?UDUvdmRnMEE0TEZSR25aSFVYN1ZBM1V2NlRCTW5wS054RkJSMloxN0phMHgy?=
 =?utf-8?B?V3lUYUMyc0FyWi94Zmxtc05zVkcvRHhnRk5ORDNaaGtNbG1BUW9tQlRwSUJw?=
 =?utf-8?B?b0lZbXJmdkxvN3VWTVBFcWREbmhmalNoOXlTZzlYNEh4RFpzYWdTWEVMcW1y?=
 =?utf-8?B?NXdwSnI4dzBGVU1DblpXSXVNVGlleWRZM2dQMW5CWTA5YkhSSTczOFVTdmNN?=
 =?utf-8?B?eWNxL3Y5NnZkV0ZoNzQ2Sy91cjg0d3AySG5veTFaYzhsTTEzdXhqb2poNmlx?=
 =?utf-8?B?emdTWnczeVhUbndXenBvVmJGOUR2M2crM1IrbTl2SVdBY2lJOThiUi9selQ2?=
 =?utf-8?B?eU5SM1JqRlZTVk9Rb2JVdjYvL2orZU1yY044bzIrcHNTVmRFT1B3YVlXbjR4?=
 =?utf-8?B?Y2NkU3Y0TE0xNWM4aWJFM3BNTi9PcVJXeHZtMkttc25NY1dQOTJlSnZMU1E3?=
 =?utf-8?B?YjY4a1J4Vmc5ZWNCTWoxQTlVSlV3eDhoek9zWDVocktoMEkybEZLb1YyUXVn?=
 =?utf-8?B?ZDBwZW94TnVvUWRkaDJXWjhwL1duQnBJdEVybjZuTmlUd3VGVTJvNjdGQUd5?=
 =?utf-8?B?VnlPVTJiQU0yQi9uS2pHVytIVmNEeVZsRmNjRjFxWVpjWmI5cElOa2czQXZa?=
 =?utf-8?B?ek1zcnZRUCszQ0Nwc0h3WCs0cG1FbHVCdkQwZHhUNnkrbStmSkR2UktzNERP?=
 =?utf-8?B?RDRaMmRpYUxNd2RLbHd4ekNTRnhCWko1SENYcmN6NHZrQlNrRlBnRkE3RE9T?=
 =?utf-8?B?WmMrUVVYMVQwNjZSU1RLTytUTWtBZ2RaQkJYdENHV0FoMHdGYlpSc1hpa2pJ?=
 =?utf-8?B?d21uUGFIVTJuVm5Hc2xjTjJaUFZoY216R0lYOGlVbFQ3TFI2YWUwb05OTG1V?=
 =?utf-8?B?a1hMbDB4RkJRU25od1dBeUFBL1ZJLy96bWlCRWlCTDAxMXJGQWhGd3ZRS0NF?=
 =?utf-8?B?bWFsRTR3cmVybGF0QXczWWY5STN1SXpNUU8zUVJFSWwwb0s4Zzg4bEh5alRR?=
 =?utf-8?B?c2RzcU96c0R3ZHdiZnA4OVl2VFZYSnU4UDMra1VseUVLTGtrRUczN1doQ3VJ?=
 =?utf-8?B?WjhEWVZkZkpnQnhIdmtwRlB2U2FYYnRqUkcyczR3SFBpN1J1V2NaUXgxVjVw?=
 =?utf-8?B?dUw5UU1BcXlvVEZOcTUrVUJaRUQyTk94b1hwK0RvWVM0THkzTVVWdTJJZUZU?=
 =?utf-8?Q?0SLWMT5C7oAZqeON7mBY1QhQ+Q1W0xf8SKGNo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6434.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTl6SiswdXJ3cE12RktZM216Uk0rcFVkdFZDUVRpemt3U0VVY0FNWVFvWXF5?=
 =?utf-8?B?Zkx5T2NoVGxXQkIvVmVtby9CMXZBMXA5UnRVdE5kaU1EVkhXVExTSHB2Ni9s?=
 =?utf-8?B?Tys1WVp6SnVrWTF1WjZpTXhtaEhyTzExZzFoWng5Ni9ROGRlTTdKWUJ2cjhs?=
 =?utf-8?B?YW5LRUp6RUlxSEdRRWNRa0p1UDBhdVlHdlpNR1FabTFrWWduQ1RubCs1cG53?=
 =?utf-8?B?VVJRSUgrVjQzSTYrck1yYXJBNHZ0L3ozSnVqa1hnb3dzamlCY1dueGpPUTUz?=
 =?utf-8?B?eUlWL2NTUXdwNHFBT29yUncwaWZpQmQ4MTNmcFVYWWtwR1Q3dkFuMDBuVCtV?=
 =?utf-8?B?TXZOT3RNRENBdTBxclNVaWordllxb3VRcmlyL0I5L2QwTndNZkRXVWNnSk9w?=
 =?utf-8?B?SzJKcExBcW1JWFBLZ1BaeU8zS2E1QnIvN1JoYm9mUmpFeTNFUDUzQWNrTXZn?=
 =?utf-8?B?Qm14OVFLbVRBL2xrVUo3WU5LaVZseEJneFd6aGY1c2ZpaWZmZW81MDRtTWdy?=
 =?utf-8?B?Y0dqWXRKcmZXVzlEaVByTkp5dEgxbHlXVytYZ3FJU1FPZlh4ZEhZYnNBaUlL?=
 =?utf-8?B?cGpTekVmeHFDUitkSWpLN08wQlpRdHpUTkM3aG53UWlCRXBURXkvenlQM0ZD?=
 =?utf-8?B?bVhNdEpQVGo1ak5jV2lxYWJsV2dueGxDSVRXY3Y0WTJXOVBPalRkQWNPZ0JO?=
 =?utf-8?B?QVhWcDRWK1pjbUpGNEQ1YTZUM3EyajFhVjhPQmFXRTRDajFOa0k2RUREdHJq?=
 =?utf-8?B?cWNsQkxQbmxXbVVsMHFGOFhGRFE0UGdaUEI4cWFTUE9rbmZhWFpPWStHMHA0?=
 =?utf-8?B?ZmpVdFN3c05WNFV2VGtxbzB4dHlMNDAzbzFoRU1xVTN4SlF1amd1S1VJK3BN?=
 =?utf-8?B?TFVhVDBYSkFKbmcwdVJacXhsMld1NGJxWHBDTXdYbGdOM28vd0hhWGRIODAx?=
 =?utf-8?B?dERKd1d0S0tndjNidTF4QmlHN1pvSk82dFIxNGNoZkZmTUxEa2FLWGhIUUl0?=
 =?utf-8?B?S1Q2OXRCQlI0K25QOFdTUmlZUkVRSDNrK0pkV3VtMkY0RktiVmU4UVJocitG?=
 =?utf-8?B?UnlJWnRveWlDSlNpTy9HM0hUbis4bEdFOHVOY1RSNW9XVWhsL1N4eGYzYmY5?=
 =?utf-8?B?YitBSHMvdHpWY2lmWUdHbWhqQ1JDQ1c1ZkVoYlYxYWN4QnM1TmJ1T015TEZQ?=
 =?utf-8?B?M1JWZVB4UXV1cDhXWC9jQlNKTGUweFBPeW1BZHRhaHp0cjQ2Zm50NDZ5eG92?=
 =?utf-8?B?S2Z6TFpjR3FxMjhaYlcySkVHekxqMXA3WGpHbEw5N0lReUlNbmpFRXBaRTRl?=
 =?utf-8?B?Y0E1bHZ3Q0l2ZENSMitjekc3VGZmdGxPRkpVMW13NGtWYkcrTGdIMnVZaTdU?=
 =?utf-8?B?VElrbHg5Y3BXL0huY0Zhc1BaRWJidGhIcS91RWJoOVF4MTBTUDJvc2loa1gx?=
 =?utf-8?B?MlREZEV2TFBOcTNwa21jOENtT0ZmaFdkQm02K2NSMnBFZWlhNzYvampWZ05i?=
 =?utf-8?B?a0NIbCt1T3N6cURkR3lmRThLamdhbUF3M2FVN010bDlDTkh6MlU3OEpVRXNJ?=
 =?utf-8?B?N0tmSjNQOGtHQzJoUmV0cWNpcU1NY24rZkpTdEVmaldQQnQzaWUvd0VhV2lq?=
 =?utf-8?B?eEFOZEhyS04wbHhsWlEwRWtHdzBYVklsSlJCVllEOTQ4VWpySlBIZ0RhY1ZV?=
 =?utf-8?B?NHpkUjdyZlFSeURGRVA4aHBTaVIwVjZubVJpRTFoMG5JblJYdEpXNTRGOTBP?=
 =?utf-8?B?dzZVOXk0WlR3Z1ppcWg4eXFDbThvelN1elpZTVFjY1ZiU1pDdGdHd2lEaGh1?=
 =?utf-8?B?NFdTOU9tdmVKdnd3WmJ3OTZhbDNzQzFIQXh2SmZMVFdYcm0rZ1hNWHpYcWZS?=
 =?utf-8?B?ZGg4YU9DblptYmViNkEzL3luS0NHSnNnVVVabWtsNTZ1THVqWE5haEcyTmpU?=
 =?utf-8?B?ZFYzZTlnQ2pnM09iVm5WQTlPbHFYeXFjS216OFVJR0lIM2JzTVdjcVE5Wm9j?=
 =?utf-8?B?d1lnUXFTMno0YnlyWWljVERmb2xCUWRWdUtpdmNQb1lub1Vva2hKMVZoekRk?=
 =?utf-8?B?YVFPYUdRRGd4dDJQWXAzcjFGNFl5WjNoT0JRSFl4QTEzNDRIMUo0a2lzWjRP?=
 =?utf-8?Q?JEdh1kOg1XYGJZe9QUGqcyj9E?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b1f4312-e3ac-467b-c9a7-08dd8177b2b2
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6434.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 08:28:45.8864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tU/EWOZRhumlsJgp2fAfy+hVIMrAniX53PksooALf3G0u3kER/DHnrw8WUWW8NfrE1Qb7Xi9IaIsj7FPVnaNcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5688


On 22-Apr-25 12:44 PM, Balbir Singh wrote:
> On 4/22/25 16:34, Bharata B Rao wrote:
> 
> Could you please confirm if this is a new issue? Sounds like your hitting it on 6.8.12+?
> I've never tested this on a system with 5 levels of page tables, but with 5 levels you get
> 52 bits of VA and you'll need to look at the KASLR logic (max_pfn + padding) to see where
> your ranges are getting assigned.

I haven't been able to test this on latest upstream. Will get back on 
this as it can take considerable time to recreate.

Same or similar-look bugs have been discussed earlier too:

https://gitlab.freedesktop.org/drm/amd/-/issues/3244

Disabling 5 level tables seemed to have solved the issue though.

> 
> I'd start by dumping the kaslr_regions array.

Sure, Thanks.

Regards,
Bharata.
