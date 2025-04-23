Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404A722F746
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 09:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745400630; cv=fail; b=W9qJ0oClcWb382IHFsZhzLwRnpuKUFmmkYhYcYX2ey08U5o28UTk8N5IyQlYBXNHRVAvRqG06QlKvmZTKL7vuJSL5o6Xn5vfZrasm9KyJNZs1MhoNjuJMzCF4TY3p8b24w8Y0L09l8wTqEyyrgV44eEdrYL/8awsPu8S4W6elxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745400630; c=relaxed/simple;
	bh=sjcn3vyA7kQkpn3SRzlUaoykNUc1wrz1nMNfJ2g/x7I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IocDn8kveLVZnTgRKKnky35NWkMTXltfW4+ahnAxbjpWWHZgFIaO94NWxWy1nOljZ1VyxyqmrPYPeJeG0wHUGx2pabK5/6hkbVdUtT0z6PuOWsgoKJaC9AAspJ4Ym9Y38yESgnqPm35xr8Vbwr9F6Y2ZGFdByI+f0w1aCMW3v40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=i9u8r6nD; arc=fail smtp.client-ip=40.107.92.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="i9u8r6nD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RwU0nmXa0B0KsCM9Hl9J3Qq4IlvzGJq2Otr3c13eL4q4pV/RCTXSpYbO03px1i1SvKBc9tmIr2W2yeeM9oadE3xLU5qPAhMzJqLBaqPmQplEGjOJ8g0LECGCoE8z9K/436LlVFl3pjhcy7Yg+HpadkJTdCVZlf2NvvJUMRw2cwBZoaKU0Cn85viu2Uea8Acp2ILVbqhmleFyCQaar3ZuUeWxHQHY29OzCwzcK63PhPhXx6/gwKq28zKV/5KWaPoHVJJomqSopoznxsXXoQowj9z17wT84D/esuPgcmEyEcEdbL1QZo2lteODx6aBbIH6y0hMBC4zzASYHOLFGVlAbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bjju/C8CEa03yvnHuFmlizC2rucoeg4rYD82OQikc88=;
 b=C3k5CKcBxtpPTtB794cM4QobMUwxA0bMFg8k2/cT0mZi9wAcs3TLsW6bVXYTSDRgLEikCpy46QWPkELsekwCQTdNyQ68OE/SAVb+1iXEzyp/KooiylCgBg6ijGpwnG1kZyvhlCTLQ93knzaIC8CoAPZBp6nioxzbRqPHjk/lXUY5K8qxpnbxj+oMeVMBJV0daQEw7zGuV5hLAe6tQKQeRD7dqdElgXcWUucvo7AQ2UR/cL5piPnvS5/BG9MDVdK4WHHgNewlAM2FWDAn30H+njU7WSJXciRESKqmTe3+Of3QMdMIaVazCRYDR4liXhl6IBXD0YYx6jS088zuzM6Ikw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjju/C8CEa03yvnHuFmlizC2rucoeg4rYD82OQikc88=;
 b=i9u8r6nDNtGjYFngJ7Corwxi4dB7TIKdPYzmbUyY5y3xzuZUobriUFAU/OWqxnVcM6d9Gglue9E+a+ty1Ks9+2NG40Jw5q0KdZVYW8BcDJ4zIeMqwKF8M2W0HhjXAUSLu8N4QTCDmpLUUBSbF52v/UG+VwxcyvuOHrCxhMdBAJI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6434.namprd12.prod.outlook.com (2603:10b6:208:3ae::10)
 by CY8PR12MB7514.namprd12.prod.outlook.com (2603:10b6:930:92::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.24; Wed, 23 Apr
 2025 09:30:24 +0000
Received: from IA1PR12MB6434.namprd12.prod.outlook.com
 ([fe80::dbf7:e40c:4ae9:8134]) by IA1PR12MB6434.namprd12.prod.outlook.com
 ([fe80::dbf7:e40c:4ae9:8134%3]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 09:30:24 +0000
Message-ID: <83cf7fc7-23e0-46f5-916b-5341a0ab9599@amd.com>
Date: Wed, 23 Apr 2025 15:00:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: AMD GPU driver load hitting BUG_ON in sync_global_pgds_l5()
To: Dave Hansen <dave.hansen@intel.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Cc: Dave Hansen <dave.hansen@linux.intel.com>, luto@kernel.org,
 peterz@infradead.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 x86@kernel.org, hpa@zytor.com, nikunj@amd.com,
 Balbir Singh <balbirs@nvidia.com>, kees@kernel.org, alexander.deucher@amd.com
References: <bae920c0-a0ff-4d85-a37a-6b8518c0ac41@amd.com>
 <19353ca2-11f3-4718-b602-d898ff05ba87@intel.com>
Content-Language: en-US
From: Bharata B Rao <bharata@amd.com>
In-Reply-To: <19353ca2-11f3-4718-b602-d898ff05ba87@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0159.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::29) To IA1PR12MB6434.namprd12.prod.outlook.com
 (2603:10b6:208:3ae::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6434:EE_|CY8PR12MB7514:EE_
X-MS-Office365-Filtering-Correlation-Id: ff40f705-a69d-42ed-e839-08dd82497969
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dWd4ajB1bXhSZGsrT0F1UXdHTW9aOFdzaGFQZlhjTkdITlJ4eW9aeFJSQjBB?=
 =?utf-8?B?M3V0SlE3MDFUd3NVRnI2bVdlSC9lM2k5eWNpNUN1dXhVbDNFZUtZaWV5bys2?=
 =?utf-8?B?QVNrQURXcVg5aktKN1NFOExUQ2pZOXZxWjVYVWE0b3ovbXhTa0pVaEREVHQv?=
 =?utf-8?B?QzZpTkRlS2lxS3E0MkkxU2lKMy8xTU9TdEk3RWNoSXlka24vYXJSbEhaTTgx?=
 =?utf-8?B?cWVSUjBwRzl1THJUaHFZc1lGdkx3WXVJbVlIelZTL0FIYk5wL2JIRXhzSldn?=
 =?utf-8?B?ekd3THNCV1BpS0hkczlBYTJXY29NNmVWb28rMFNiYWNjb0xxZ0wyejMzaHZ5?=
 =?utf-8?B?a3lDSlNTYjkvUEkvYkduQm9idkx1dmZycUtXY2xreHcybXN4SmlmWGtMRUs1?=
 =?utf-8?B?dGg4Zm5MRVpseGI3K05wWTJSMWdGTGdJSkdZNFFXR1VlRnZSWTV1djNuZkNn?=
 =?utf-8?B?NW9Wb05jNGxyYWZhRHBpWHBOOUhEZmF6dG9ldzlEckRBandISFFjcnJaQmFx?=
 =?utf-8?B?K2dHT3RFQkUwbWpQcEE2Z3lxczV4SnU4ZHg0ZnRIdHBvZjVDemIva1pWK1R6?=
 =?utf-8?B?dGF2TkJSOUNEaUtENXVtMUNIV2FrcmRmUUpwMVhUa3BkTEZrUzBIcCtSenRy?=
 =?utf-8?B?MzgwUlpkUU1VRnVoRk1MSml1VXVQL2lHbWtMY09vWHhqREFLN2EvREUrMUt1?=
 =?utf-8?B?NnNPNlhaSi9pZG9UazR1V1d6MUlpRHVaN3RxSkQ4dTcwQ0xtcHFBZ09LSG1S?=
 =?utf-8?B?d0d0SVRXaFRLdWlQaDI4c1h4dEpxMS9BMXRCSE90aGFQM1B2c0k0NHV6NVJN?=
 =?utf-8?B?dEtsTDhmM3Fucm0xZDBsVkQrT3o3NGZreWpxYm5aSzN2OW9IcmhBTlZxTnN6?=
 =?utf-8?B?Wld4M0hZaXBRS0tvMyt1clNQZEVTU2lQUEVxaDhiSVlWbjRicEdxRE43RjlV?=
 =?utf-8?B?RnZxK2tCQjZuYnUxODB4NWlHOGZYSGh6RmNsNVlObUxPVVkxTW0rODlIaXEw?=
 =?utf-8?B?NmV2cDl1WGtXbTc3VlBXQzFDYVVJMkRFRFc1eldSYkJpMzZLYTdEZVpiVDVF?=
 =?utf-8?B?eHNERmswZVdueXZaN1NrbUt5ZDlYbENvVUlxWk1TaXlBTTdqdTdJMkluYlYr?=
 =?utf-8?B?UzFGTGcvVmVEcUNvZjZsRmc0Risva3JuWEZ3a2tXNnMyRXhYMFc2U2FFcTNp?=
 =?utf-8?B?U1BmN0x4Q2l0NVlLZEZjQ3VsbzhiUlhlM2FLYStsWHFoeWMrdzVmNHJQdUI1?=
 =?utf-8?B?d1c2VGw1QkNBZU5waGNRZHJtRVZRYmhzZFI5SW82RWh1TmE3WEExeXFYSVdk?=
 =?utf-8?B?V3FkOWVUMUJnUVVYU09wVkMzVUpIUVN3ZUpMQVFSZ2EvdWkyVmlyaWVnRFhT?=
 =?utf-8?B?NUQ1ekpPNHd5MWwydjJQZ2hTeTZJbFo5dmFSUzBZWWM5TVBCbVQvOWpMWllI?=
 =?utf-8?B?R0ZOenpDUWFPSFFsalo5OWFtV0dab2E5WldaQkVYdVFRVDlPK0JLaGp2ZlEv?=
 =?utf-8?B?Sy9JSnhzOTJySmI5dWNoWjM1cit1UkhiSWNSbUlNLzM1akhCQkF6MW1IaEEx?=
 =?utf-8?B?T0JLQjJmckxBeGNIbEE5ajNkMXFtaE4wbzRheUN4SW9SNkI4VkhEdi9mVzVI?=
 =?utf-8?B?Tm9CNTU0Nzc1U2tpcnlhM01wMzk5QlhYUzhiUlNOYUxva3lWZmkxNnVnQU9r?=
 =?utf-8?B?dmFEMGZDdUsxdWZkOW5uQXIreHhGSEpOVVEyRjlvUHFpZ1VLZFFzcWdiL2g5?=
 =?utf-8?B?R2I4SzhYSjlqZUM4Q2lwZ09EaWJveXp2UlowcENLcStvT3plZ1dFVW5VL0NC?=
 =?utf-8?B?U09wMU9XRXQvSGh4UnRLT2h3R2wyeXo0UWRXK3hjRG5IZjN1RXdJNFZPZS9u?=
 =?utf-8?B?cnJ3MkZZQWpiYmhVUUpmdlF2SDMvSTFrT1dUV0hucmNEaGlVMTNNaUhhWjkv?=
 =?utf-8?Q?+fTQXQuj2Rc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6434.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXNNUmxMRktVNG5PUlRST3M4ZTczWlpXa1h3bVpiYlZiL0t5Y2x6anRLL2t6?=
 =?utf-8?B?S0ZLWnUxaFdWMkZrbVlpa1hjNllaa1EzZ0JQdWI2VDdmbmU2aC9HWXQ2R3V0?=
 =?utf-8?B?NCthMmx0YjdqdHN3Vm5Ua0FqQlJoZmRiSXE0R0ZoMVJQamU5VUpqbjJna2Iz?=
 =?utf-8?B?emlrRGlkVHNicC9CejREYnNORTdhaGhjaENUSUNuTmhkdlR2N0kxZG96dkI1?=
 =?utf-8?B?RFg0NWQvWUx6dFBRSzk1L0hObHltMWRFek1WMzhLYmJDTExFWUl4R2VIOVVX?=
 =?utf-8?B?RDBPSFA3a0RqczdScFRvQ3JZQ2M3cTBWelk2QUtERmQvbGpmN1dBVWRzcXgw?=
 =?utf-8?B?MkFsUVU4RGNrKzlKcUNBNXdlWWVPSVBWT1p5Sm9SbHpNd0w3aG1lMHl1QUt3?=
 =?utf-8?B?OVlNM0VncHZsT1Racm5zS01JTFpmODNTUmJvTUVQaHpiYmh2dVo3ckN1OVhL?=
 =?utf-8?B?aTRpY0FFM1pPbStJYmNUc0hyUDZ2dFhXVVBQQ3VRaTZiM01WQ082em9vbUlp?=
 =?utf-8?B?TkpHc2xwUlJmK041emVmUFRjQkVaTEViam5VTzd4c0YvSnUyemJKNGl2eWgz?=
 =?utf-8?B?VTJoVG83RDh6bFYyelVlcDZjMVN6Z1BwZnRHZkZMZVUxZ3JqTTRuTEJjclhN?=
 =?utf-8?B?V05qbVNCVXlVcjJkZVZ2b2F6dm10c1QrWG9qdjlGc0RoRHJLQUJON2RHeE1V?=
 =?utf-8?B?NGR2SGdpMlJGWUxWSCtOYjlNNFpNQStrYnhVRmFrZXBDU1B0Um0yaEJHc0xu?=
 =?utf-8?B?K1YzdlcwL3VaU1RnU3ZjWXh0SjEzb3VkYy85TThwSHZvTGFkQ0pXWDIzTEg1?=
 =?utf-8?B?OWhhSS9OOXhkUGxLNVJGU1lvN2ZRdGFhRCtGcndHbzNWRVAxSmx4cS80d0tu?=
 =?utf-8?B?NTR6Y2ZHTDg2NGpLc3J4M3dlUFR2STg0RjkzWnIwMXBmOWhNUkdZSHdhVGFH?=
 =?utf-8?B?SGtBMEpRZjN3cC9IWW1acW9Yd0FNaFpDWElsTEsyeUk2bTBWc2c5MG9ZQWhp?=
 =?utf-8?B?L3hSbGUzampkd0VldTBDVERaWVZMWUd4S2RLK1dXMWRkeTk2bCtwM0xSNTZh?=
 =?utf-8?B?bjR3dWdXWExURzdNeW1zTDhSa0hoMGcvMkg0VUh0QjBaK0dtbjR1NUJIQ3Ex?=
 =?utf-8?B?VGpRQ1lmcXhLSlFzNUxaZERCYUJ6OTVBaVdiWGZPR0xuRzFGODh3Q1ZvSU5F?=
 =?utf-8?B?OENDVzh3WnNhY1FpRUpwQithcDNrZFVmUzNFNHlFcC93UXBwUTFLUmRLOU1z?=
 =?utf-8?B?QjRISC85Q0pMUEZSRVczajJ3N2FCV1VDVHlDN3h3bmFjdytaMnZNNWordGZ0?=
 =?utf-8?B?YkMzYXpWMXBhem9iakRsNTBxamU4M254aGcrU05uRER0Nmx1azE4bWg0M21q?=
 =?utf-8?B?OW5sKzdCNUZVMHB1ZDVXWFRmWTFLUW1XU0gwOGxzbVdsLytVVXl4QUxFd1hF?=
 =?utf-8?B?bXgwUEhhRVpVWXF2OGk4OVcvRmVqdXE1M2hLWmpRek1NTUE5dU8yNnhOYkZl?=
 =?utf-8?B?dS9EbktEOU53VWJ4ekt6NTBkcnpJYkhDSW9hNDRmTm9JdGgwVHAvUElQRExj?=
 =?utf-8?B?S3FzRloyNUhrd2tEMTB5RlhwODYwby9UaGxVU25oU0hzdmZBWUNkSFJvK2FX?=
 =?utf-8?B?N05UeUs1S2hlRFdWOEZoQ0ZlODdLZUx6dkgzZW5idWZsWlFDMjZWM1NySE51?=
 =?utf-8?B?M1l3dHg3WUIrM1JGTGhMVXk2ckRpbmZiVEVnNk9LNWlVNGVuTXZnd0d3bTlj?=
 =?utf-8?B?bllzRlJjV0FHNzNVdDdpdTV0SDk3RDZzVll5VFZ1VHJWSUJLU2hMYmw5ZXhy?=
 =?utf-8?B?UzVDZTc1bW5Fa05OaU5CTWwxdzNLUkFTRnR3bExxdnMwSWg4alZZaUFlVCtv?=
 =?utf-8?B?bURsQ0IxbVJXUklseVUzczRYcno5YkpyS2FPbjdjd2tpUEp2SW52NVhwVmZF?=
 =?utf-8?B?RlZqZ040blFXQzkrUW9jWUFRUFg4bEt3NG5EU241MVA2dlNzcWxpTDZGZFR0?=
 =?utf-8?B?dW83ZlpuOTZJOU85V0VPQU1BR0JoZmJEUFh6bTVYRVhxeS82bEROTHFmeHBG?=
 =?utf-8?B?SXdBbHJBY0pjMHdaaXorZmg2MDJjZXNONHQyTGxBdktKU3FBVGRyUk1tUERB?=
 =?utf-8?Q?pmHM9/9Lxm84re5Jqnf1BcBen?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff40f705-a69d-42ed-e839-08dd82497969
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6434.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 09:30:24.0592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iV6PMvIy67WipRWxvslF9ctXit5p3ZYkUxztCAXSg4SAPhfCK8clA2wXjmzzzaC+n0otSZ4JPBnaGFVPyPXYvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7514

On 22-Apr-25 8:43 PM, Dave Hansen wrote:
> On 4/21/25 23:34, Bharata B Rao wrote:
>> At the outset, it appears that the selection of vmemmap_base doesn't
>> seem to consider if there is going to be enough room of accommodating
>> future hot plugged pages.
> 
> Is this future hotplug area in the memory map at boot?

The KVM guest isn't using any -m maxmem option if that's what you are 
hinting at.

BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
BIOS-e820: [mem 0x0000000000100000-0x000000007ffdafff] usable
BIOS-e820: [mem 0x000000007ffdb000-0x000000007fffffff] reserved
BIOS-e820: [mem 0x00000000b0000000-0x00000000bfffffff] reserved
BIOS-e820: [mem 0x00000000fed1c000-0x00000000fed1ffff] reserved
BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] reserved
BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] reserved
BIOS-e820: [mem 0x0000000100000000-0x000000f4a3ffffff] usable
BIOS-e820: [mem 0x000000fd00000000-0x000000ffffffffff] reserved

kaslr_region: base[0] ff4552df80000000 size_tb 1000
kaslr_region: end[0] fffffffffffff
kaslr_region: base[1] ff69c69640000000 size_tb 3200
kaslr_region: base[2] ffd3140680000000 size_tb 40

So vmemmap_base is 0xffd3140680000000

Also the last and max_arch pfns are reported like this:
last_pfn = 0x7ffdb max_arch_pfn = 0x10000000000

Here is some data for the hotplug that happens for the 8 GPUs.

Driver is passing the following values for pgmap->range.start, 
pgmap->range.end and pgmap->type in dev_memremap_pages():

amdgpu: kgd2kfd_init_zone_device: start fffc010000000 end fffffffffffff 
type 1
amdgpu: kgd2kfd_init_zone_device: start fff8020000000 end fffc00fffffff 
type 1
amdgpu: kgd2kfd_init_zone_device: start fff4030000000 end fff801fffffff 
type 1
amdgpu: kgd2kfd_init_zone_device: start fff0040000000 end fff402fffffff 
type 1
amdgpu: kgd2kfd_init_zone_device: start ffec050000000 end fff003fffffff 
type 1
amdgpu: kgd2kfd_init_zone_device: start ffe8060000000 end ffec04fffffff 
type 1
amdgpu: kgd2kfd_init_zone_device: start ffe4070000000 end ffe805fffffff 
type 1
amdgpu: kgd2kfd_init_zone_device: start ffe0080000000 end ffe406fffffff 
type 1

The pfn and the number of pages being added in response to the above:
__add_pages pfn fffc010000 nr_pages 67043328 nid 0
__add_pages pfn fff8020000 nr_pages 67043328 nid 0
__add_pages pfn fff4030000 nr_pages 67043328 nid 0
__add_pages pfn fff0040000 nr_pages 67043328 nid 0
__add_pages pfn ffec050000 nr_pages 67043328 nid 0
__add_pages pfn ffe8060000 nr_pages 67043328 nid 0
__add_pages pfn ffe4070000 nr_pages 67043328 nid 0
__add_pages pfn ffe0080000 nr_pages 67043328 nid 0


For the above vmemmap_base, the (first) addresses seen in
sync_global_pgds_l5() for the above 8 hotplug cases are like this:
start ffd3540580400000, end = ffd35405805fffff
start ffd3540480800000, end = ffd35404809fffff
start ffd3540380c00000, end = ffd3540380dfffff
start ffd3540281000000, end = ffd35402811fffff
start ffd3540181400000, end = ffd35401815fffff
start ffd3540081800000, end = ffd35400819fffff
start ffd353ff81c00000, end = ffd353ff81dfffff
start ffd353fe82000000, end = ffd353fe821fffff

This is for the case that succeeds while I have shown the same data for 
the case that fails in the first mail thread.

When randomization results in bad vmemmap_base address, the hotplug of 
1st page for the 1st GPU results in BUG_ON.

Regards,
Bharata.


