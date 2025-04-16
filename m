Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2051.outbound.protection.outlook.com [40.107.93.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012B222424E;
	Wed, 16 Apr 2025 19:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744831034; cv=fail; b=A84eoOQ+Iao9MGtFv7m7kDB6N9LkEzVs6saUjWo0tj//I6tBv+Ia7jnyeheTtH3WJU0bgKk16SjSCjIxn4wjtgkUtDc6qL2X5P8z29FCFtpWT95b2irJyKc5AO6qjA0rD6qs4dMyKyEhst66D0qebhPOGGDDvx0qhsDIp6eFTi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744831034; c=relaxed/simple;
	bh=kbNHvkl/LpMw92klJcK7ypjGfxURNWg9FkpkQMQB2j8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=S2OFV1wfvLIJ4WSOLtO79WaEv/A9vqh9M/h0WlPuxknaz85DJt5WxYACw4rBDVMTD2S2hHT//Yiw1m5313LQOdr/vcNCFiAtojwgSBISIHycgyIQHMzPAmpF0YkUQmQU9fihVRareYrleU2gQIJLg0zmcIFBaKKJSAHt/BoWgTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BeyG2iEn; arc=fail smtp.client-ip=40.107.93.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BeyG2iEn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m+lMzKERhni6gwt8Ifisb45U+vbQJUtbuWxOT+61UZYAb9Z5BH8KVtyaTtt/iph49Bheb+BK7VV7vkR79I1KwJSV2huEVWuAhAtQyf3gL0AUNha7crGF5KqqQF0/VjDnDSG9ie3gehhI5S7f5IPmHGggxfEoLFQnqPkvVhYKAqgZlYlz5SQcFEHKdYnOA/2gKr1EWeI2g2mriKDMRe+GsosNRI9ap6neXHl2mkcbru9WK4f9Kka6wnWyQK/weYZrpKxpHEWGudLkYCk8/P3CXj0NlycQP2DEP28S/F9+ugG7LRlce1K7YQX/6xQWlKjnfYkq3uPLswmQDN51uWpk0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XmgCTNEvQ05PhOfV5q5bqCwa6dQ+BL15bjf3a/GrzAY=;
 b=SN+LtkuBTZp2pzSrPwH7PiHRjnbveTEQM2D9WPIhn9J+NCRykXcmiKdUjhWXFGGTwdhRo/wCQTJHTpwHDBgDBs+r6RnQVlayhDuIEN5RpQC6VW4t1P4Xfa5EpyQXEGb0ESQEJo25CuhDI22hPWyf7L1byIyBE9mUtHtkvbSo9uNwo8INnU7JAD/TIhHAFAzbquEPwVTRNSSy28D1TONS+DjFtuye832VTtmBt5pdKl+yK7A7b/iaoS5Xinxd7YZdNVPwZBQpXqGeRgJ0/9IfhFRetQYDhA5FE5NI7rK+zEJm291HejXGZdqrboEdaIHXAF2uAefZsIPqQXGJxUrRgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XmgCTNEvQ05PhOfV5q5bqCwa6dQ+BL15bjf3a/GrzAY=;
 b=BeyG2iEnsVpPQOurbczahR1a/j2WKgGovdrXjNPgpGQWYZ+eeRqIpAEhXUWZo2n4iw/U1Ki4JG9zQzaQZdb/hFkF5mzu+HtE7beF5VUCnBG9Dhp07mABiuVq29gNeYHCNgkKYNpNZa3yM9UPKdhd0snilvdPvbROE6i3NFFo5LQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH8PR12MB7256.namprd12.prod.outlook.com (2603:10b6:510:223::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Wed, 16 Apr
 2025 19:17:06 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8632.035; Wed, 16 Apr 2025
 19:17:05 +0000
Message-ID: <8ea4f52c-b837-4e22-9b21-9a5716ccb12e@amd.com>
Date: Wed, 16 Apr 2025 14:17:02 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] platform/x86: Add AMD ISP platform config for OV05C10
To: Pratap Nirujogi <pratap.nirujogi@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, W_Armin@gmx.de
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com
References: <20250416191411.1482060-1-pratap.nirujogi@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250416191411.1482060-1-pratap.nirujogi@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0017.namprd13.prod.outlook.com
 (2603:10b6:806:21::22) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH8PR12MB7256:EE_
X-MS-Office365-Filtering-Correlation-Id: bdcbce71-bbad-444b-0e36-08dd7d1b4622
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OFpPOFE3cTVGQUkvSzloVXVCL0dEY0wvM0MvK3RraWtMcEp5bGsxUm5HZUNv?=
 =?utf-8?B?c1hCOW9FbENYdkpKdTFkQno5TXIzUHY5OEc1KzR0K2Uybm80akNZWDZoTnRi?=
 =?utf-8?B?QVhiRGttTWFMZzQ0QklaSGhLZ3NtSDIrY2dqd3drUG80U0I1YWYxMUYzTXJP?=
 =?utf-8?B?K3ZYWTRHWHNNcUFtOUhSUlNmTVlEYVRxYTk0c0lUaGJWZzZ0NXI2Nll5N3Rw?=
 =?utf-8?B?aTQ5emN2eWZ4UWZ3Vkp3QUhmM1hZSDNlaTRwWWw0RlBCTVkremE4Z3FTVDc0?=
 =?utf-8?B?ekRRRWZ4YnBFdWNCeDFWeTZVRGgyRE5JZlllYktCVkN0MVpNdEQzZGlESDE0?=
 =?utf-8?B?ZTJic2ExV0xXcmlyNFJJRTVqNmhOVWx6UjJuZURsZWltVXBwSUVGam5GTXI5?=
 =?utf-8?B?OEdmbUtJb3gzQnRha0FaY3g4V2YyZ3JLTlB2dXFzTnkzVFJNcStLa2Y0bi9J?=
 =?utf-8?B?eWhqb3dLMFlvSWRxTlFMaXpNeVg4dnQyM1ZjWW9iOEhIZHIrWlJDcEd1bHZ3?=
 =?utf-8?B?ZStLZjlTOWhFdFEvbHBnYTBWL3llZEJ1Y0hhTjg0Q0ZyRDJQTG5UcmlzTWdn?=
 =?utf-8?B?M3ZKSXJVZlFPcjV1MC9EUEptbDNxYS9Db2JZdEp1bkxhNjRPWkRXS1lvSy9K?=
 =?utf-8?B?TnErc1F1czhIeldJVWJUeXB0Q1NtOWsyZTBDaXE2R3p5RWI4Mll1dG05NnJY?=
 =?utf-8?B?cjl3aFBUdTgwb2wzdU5QYjNqbzVFSCt3TmZzZ3VheXBBNWoya2lOalh6QWwx?=
 =?utf-8?B?TGtRUGlFeGlrWUV5NEVPamkvMHdmNHAvWmo4eUtaNHJ5SndYNCt2N1dKdDJW?=
 =?utf-8?B?R25LcUhhdVV6bUFzc2d5VjFIR2pJY1lSeTJ0NjJEQUZPd1NRbXdvdUlPM3hO?=
 =?utf-8?B?THFTRWNIbExsMDB4YUJwV0loRGdRNlRYL0FRMWFMWGUyWWlTUU9ZZ2hQRi9I?=
 =?utf-8?B?ZzB0ZVE4ajlrUEg1U0NNelNQVWM3cWNsK09QdTZlQUlaNWkvSTVRQWZjQk9I?=
 =?utf-8?B?ZmtSSThzS1prRFRvQmxJYngvcG14b2NqakFjaFRVaWUwZE1ybWxxT1dtb0NC?=
 =?utf-8?B?Q0QrQkpPaWdzKzVNYVJoOWMybE5zckwvYmM2cnZHVzh3NklFeTBqZ1ltc2Q3?=
 =?utf-8?B?TWRvYng0OS94aTdCQkw0ZE92MXpjYitvS1VTVERzbk1LVFlNUVp6aFRNVGpj?=
 =?utf-8?B?dUYyR2I0QXZoWDFMMFJkY2FERDV1bkdzVlc3bUhrRzJYMCttOG9IUVBjNjFp?=
 =?utf-8?B?RXY2TXpQNHNKNG13QjkvNTRLV2lFeHFtVFQwamhNWG5nS3JwbzV3QUE1cllu?=
 =?utf-8?B?V2pCYTh5elRxaUtzWEFLdlU0YUlLeU94eWVFeHVYMXR0RVBFQUFyZ1FldXNo?=
 =?utf-8?B?dXEzcFJ3RUs4eDdLK2JYZlMzazBFeUd0QkxuWHNkcDk0UmkxcWVibWdVOVRq?=
 =?utf-8?B?bndPcWsyWkZzTENVeXVKK2V5ZjREc3dMby9nY2lCZW8vMG1aYlJiMExiNE1l?=
 =?utf-8?B?QjFsUm5GbUFXN1FXQ3NSNEx4M2lkYkZWUFNxNlFlZUpocW5iaW9pbmFhOUgx?=
 =?utf-8?B?OXJxc2p1VFErRlJpcmR6NDlncHEwdFJYS3lBNjZuMElWNzJpd3ZBMlJTUGRt?=
 =?utf-8?B?WjMzakcxT2Zab2hkQzZYQnd4ZTIvZjVzN05IcVpBUFpVL2x2UkRqQU5Oc0Zo?=
 =?utf-8?B?YmJJRUhRN3d2K3dJVUgyYVIvV2o2eWNzd3RDS3RnSzFDVGl1RisvY0dKVzF1?=
 =?utf-8?B?MldyMVJ0ODJNd0Q0cjd6VGMxQTY3TmZXaW9rMlJCcGZLM2Q4aUlvdnNGQW92?=
 =?utf-8?B?UklQR0RpTUpjdnZHYkZNM3ZlUDlEaDU4RzJEWDNvV0E2aW5Obkx1R3VYRTdM?=
 =?utf-8?B?R3R0TTVqSTh4SjhEZDV5eS8wVHM2QjhrUncyYVV1cm9pSjNsR2Q2YWNyWnBi?=
 =?utf-8?Q?tCdHEV20+9o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aytnZmUyeFJtaHlyaGFWbmpjMVRhMCtNbURPRHlHRm5KU2NEN25NdEh5YUdt?=
 =?utf-8?B?QTgrTHVKbVlidCt5WmVHY0xiRVhxRkR1NEN6eEpUaUlGYU96OUw2bXo3WUZV?=
 =?utf-8?B?N0ZIUTJINmRKempOcXM5NWR6bXFNTVRrSmxUdUpud2kyR2xTRlR4K05qb3Bn?=
 =?utf-8?B?bTF0SEhSMkhJcWlXSHJuMnpJdE80QzY4OUViaUpDa2JyMkY0aDhVQnZWZ2xQ?=
 =?utf-8?B?cVRqU0VYVHhlRkJNYzAxWXVJcTFFMytZU3lLQWdpK0JVVEtvVW9GV0JObFRT?=
 =?utf-8?B?QUFKMDdseVMyVzFyVExpYTNUYW9OSFg4ZmJleVFHZHpYQjlITGJOcVY1Zzd0?=
 =?utf-8?B?aXFBM1JvY2hLYWU4YnNFakc3YzFqaU9GcmdGY1hXdEhSVHdSUUdXRjdUb0Nm?=
 =?utf-8?B?YnhjVTZTMGhpZjNzMmhrZ29MT0tUMGJjM1orMWI4am40OUVFMVZrbGdGdFRo?=
 =?utf-8?B?R2s5UEwxb0xWRzR4QUNONGpqdVdPeGZNOUloSEdWbnVFV01YR3RMck9LdkFu?=
 =?utf-8?B?dWlYSXJ2ZHZJSUZwVW44YnZaalRldlByb1BxMFcvTlMzZlQ1NGxOZHNDT3U1?=
 =?utf-8?B?OWVtakZRVGdCZTdwTmFyaUVtU2NsZ0R4VjZwQnNMOVZxcjdPWkxtMGRFRTll?=
 =?utf-8?B?eFdwRi9Sc0RrZDdYNGlBcUl1QVg4K2p4dEpxTXhySnMrWDZQcVErVjRqcnVy?=
 =?utf-8?B?ZU5ybHp0ZGc4N1hQcE9RZHJWREJhR3BtS3ZsbW9iZWk1M21sMXdvV21mL2Nu?=
 =?utf-8?B?ZkN5MVdxbTlLeUJMUmF2TUpOWUN3TW52YVJ6V2IzMlYyUHNhclNhYjFoMWp5?=
 =?utf-8?B?KzNxdU1SWll5RHE5QjBIRUNGS0VXeHYwbW9GbGR1Q2tHV1N4dS9kL0lObnl1?=
 =?utf-8?B?a3ErWHE2L3lWWVJEMEpsaUpYYnRlR3QrMG1abzNLb3hMYUw4bUVBMHBnM05n?=
 =?utf-8?B?R3hOSTlLWWk2aW16dXkxdkxEWkMvMDlWNGJTL2VsdDV3dDR4TGV2RWdoVVdy?=
 =?utf-8?B?ZG1HZDVKakNPVjBSdWx0akYxUEFzRndMZW01VHpOZTJjS1VrUG82U2g3VkpO?=
 =?utf-8?B?Um5ZMlR5ZFBJWjdIYnBpcTJLcnpKV0JsenlRdkttN0FybkpXU1o2Qlg4TG5U?=
 =?utf-8?B?WWlIUHZRR1dMMkhJcFBBaWpoZ3MvdlJwVVNmU2gvR1oxMHl4SEd3aU9wN3ZJ?=
 =?utf-8?B?VzJnZHlCTFRQZE9VWHhjLzgzZ1FjMFEybDk1SWVDbWh5Q3RRNlVFS1JaM2Mv?=
 =?utf-8?B?VkdTOC9BNU8vdlhiVGZtdXY0RVp3WkxZZVZNMGZCVk1YY3lQaXJxMFZlZ25k?=
 =?utf-8?B?QjJnRkVodW83S2NIQTBLQUJsd3RuTUhJNGFwTVoreE1xbXZiaHFOY1dUMVdQ?=
 =?utf-8?B?dnFSck1ZR2QvSUQ4eTZMeFYxeDMvdTZONUR6UVZzcktoYWxqMjhnRjVvb2pa?=
 =?utf-8?B?U01ZdFlaSDdrSDg0TzBPL2ZqbTcwWC9jT2Vnb09WbStCcklFMWNzSVgwKzdI?=
 =?utf-8?B?OUxRbFpETk4wVDlJQzlPZjlrV0h3TVZBVjJESkFzNXNSY0hlTWtlRXFWMW9T?=
 =?utf-8?B?UC94MUlIK0dKM2pIOXhJa2pkc21BUnBYNU9zcEw1TDNBZ2JlRFBnSkFncy9n?=
 =?utf-8?B?WG0rOEQ5elRCUDV0ZE81Ukh5ZnVRUmxmejNPMUd2VGl3Q0h3bUJyck5qNmtv?=
 =?utf-8?B?RzBFUFJzZThnUEIzejN2Vk56QTY4MTVUUjJCYU5jZDN1c3hVaHRMMC9oUjNK?=
 =?utf-8?B?NTRWa1hyaUdKaFBEWnB6VXVsUC9QSnRkRG9iSHkrd2tBMS9BUzlSN1h4cFJZ?=
 =?utf-8?B?MXVIYkhwM1NZNHE4MDlkVkFiaVN4dmpRZitUT3NCRjhNdjFpcm1BaEtMdWNX?=
 =?utf-8?B?UURhcUxVcThRV0M5YkZKMTRUWmpxVDh5bDF2M3RHTTgveStDcEF1U0dVamNz?=
 =?utf-8?B?N0FoTkVVY2ROYjkrLzZIOXdXVllOVC95Q0ZqbHVuTFZXUEFBQXltenJRZGli?=
 =?utf-8?B?Z2k0bERpSkZ1TkNFMVk1N3VqanpjR25VU2h2OTdKYytNU3ZVMXBwRzRsTlU2?=
 =?utf-8?B?Vjd6cWEvZ1laZ3BBd3BiR2FIMVQzNWxNSmUxYnR2VkRtTUJZTGkrLzZGSnpo?=
 =?utf-8?Q?cSI23eodehgMo5KoWjWbx6uT0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdcbce71-bbad-444b-0e36-08dd7d1b4622
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 19:17:05.3614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5SEY4U66bk/j9ClUFJXCUBEMhIut5phG+owOIkVMNED85McyPC/FYFHkxUDumVy4TBIO9x0993F394L4Emi4lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7256

On 4/16/2025 2:13 PM, Pratap Nirujogi wrote:
> ISP device specific configuration is not available in ACPI. Add
> swnode graph to configure the missing device properties for the
> OV05C10 camera device supported on amdisp platform.
> 
> Add support to create i2c-client dynamically when amdisp i2c
> adapter is available.
> 
> Co-developed-by: Benjamin Chan <benjamin.chan@amd.com>
> Signed-off-by: Benjamin Chan <benjamin.chan@amd.com>
> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>

Thanks Pratap.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
> Changes v5 -> v6:
> 
> * Cleanup header files
> * Avoid unnecessary casts
> * Fix coding error with software_node_unregister_node_group()
> * Use i2c_client_has_driver() to validate i2c client handle
> * Address other cosmetic errors
> 
>   drivers/platform/x86/amd/Kconfig    |  11 ++
>   drivers/platform/x86/amd/Makefile   |   1 +
>   drivers/platform/x86/amd/amd_isp4.c | 278 ++++++++++++++++++++++++++++
>   3 files changed, 290 insertions(+)
>   create mode 100644 drivers/platform/x86/amd/amd_isp4.c
> 
> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
> index c3e086ea64fc..ec755b5fc93c 100644
> --- a/drivers/platform/x86/amd/Kconfig
> +++ b/drivers/platform/x86/amd/Kconfig
> @@ -32,3 +32,14 @@ config AMD_WBRF
>   
>   	  This mechanism will only be activated on platforms that advertise a
>   	  need for it.
> +
> +config AMD_ISP_PLATFORM
> +	tristate "AMD ISP4 platform driver"
> +	depends on I2C && X86_64 && ACPI && AMD_ISP4
> +	help
> +	  Platform driver for AMD platforms containing image signal processor
> +	  gen 4. Provides camera sensor module board information to allow
> +	  sensor and V4L drivers to work properly.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called amd_isp4.
> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
> index c6c40bdcbded..b0e284b5d497 100644
> --- a/drivers/platform/x86/amd/Makefile
> +++ b/drivers/platform/x86/amd/Makefile
> @@ -10,3 +10,4 @@ obj-$(CONFIG_AMD_PMC)		+= pmc/
>   obj-$(CONFIG_AMD_HSMP)		+= hsmp/
>   obj-$(CONFIG_AMD_PMF)		+= pmf/
>   obj-$(CONFIG_AMD_WBRF)		+= wbrf.o
> +obj-$(CONFIG_AMD_ISP_PLATFORM)	+= amd_isp4.o
> diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/x86/amd/amd_isp4.c
> new file mode 100644
> index 000000000000..9d1abbcc915f
> --- /dev/null
> +++ b/drivers/platform/x86/amd/amd_isp4.c
> @@ -0,0 +1,278 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * AMD ISP platform driver for sensor i2-client instantiation
> + *
> + * Copyright 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/units.h>
> +
> +#define AMDISP_OV05C10_I2C_ADDR		0x10
> +#define AMDISP_OV05C10_PLAT_NAME	"amdisp_ov05c10_platform"
> +#define AMDISP_OV05C10_HID		"OMNI5C10"
> +#define AMDISP_OV05C10_REMOTE_EP_NAME	"ov05c10_isp_4_1_1"
> +#define AMD_ISP_PLAT_DRV_NAME		"amd-isp4"
> +
> +/*
> + * AMD ISP platform definition to configure the device properties
> + * missing in the ACPI table.
> + */
> +struct amdisp_platform {
> +	const char *name;
> +	u8 i2c_addr;
> +	u8 max_num_swnodes;
> +	struct i2c_board_info board_info;
> +	struct notifier_block i2c_nb;
> +	struct i2c_client *i2c_dev;
> +	const struct software_node **swnodes;
> +};
> +
> +/* Top-level OV05C10 camera node property table */
> +static const struct property_entry ov05c10_camera_props[] = {
> +	PROPERTY_ENTRY_U32("clock-frequency", 24 * HZ_PER_MHZ),
> +	{ }
> +};
> +
> +/* Root AMD ISP OV05C10 camera node definition */
> +static const struct software_node camera_node = {
> +	.name = AMDISP_OV05C10_HID,
> +	.properties = ov05c10_camera_props,
> +};
> +
> +/*
> + * AMD ISP OV05C10 Ports node definition. No properties defined for
> + * ports node for OV05C10.
> + */
> +static const struct software_node ports = {
> +	.name = "ports",
> +	.parent = &camera_node,
> +};
> +
> +/*
> + * AMD ISP OV05C10 Port node definition. No properties defined for
> + * port node for OV05C10.
> + */
> +static const struct software_node port_node = {
> +	.name = "port@",
> +	.parent = &ports,
> +};
> +
> +/*
> + * Remote endpoint AMD ISP node definition. No properties defined for
> + * remote endpoint node for OV05C10.
> + */
> +static const struct software_node remote_ep_isp_node = {
> +	.name = AMDISP_OV05C10_REMOTE_EP_NAME,
> +};
> +
> +/*
> + * Remote endpoint reference for isp node included in the
> + * OV05C10 endpoint.
> + */
> +static const struct software_node_ref_args ov05c10_refs[] = {
> +	SOFTWARE_NODE_REFERENCE(&remote_ep_isp_node),
> +};
> +
> +/* OV05C supports one single link frequency */
> +static const u64 ov05c10_link_freqs[] = {
> +	925 * HZ_PER_MHZ,
> +};
> +
> +/* OV05C supports only 2-lane configuration */
> +static const u32 ov05c10_data_lanes[] = {
> +	1,
> +	2,
> +};
> +
> +/* OV05C10 endpoint node properties table */
> +static const struct property_entry ov05c10_endpoint_props[] = {
> +	PROPERTY_ENTRY_U32("bus-type", 4),
> +	PROPERTY_ENTRY_U32_ARRAY_LEN("data-lanes", ov05c10_data_lanes,
> +				     ARRAY_SIZE(ov05c10_data_lanes)),
> +	PROPERTY_ENTRY_U64_ARRAY_LEN("link-frequencies", ov05c10_link_freqs,
> +				     ARRAY_SIZE(ov05c10_link_freqs)),
> +	PROPERTY_ENTRY_REF_ARRAY("remote-endpoint", ov05c10_refs),
> +	{ }
> +};
> +
> +/* AMD ISP endpoint node definition */
> +static const struct software_node endpoint_node = {
> +	.name = "endpoint",
> +	.parent = &port_node,
> +	.properties = ov05c10_endpoint_props,
> +};
> +
> +/*
> + * AMD ISP swnode graph uses 5 nodes and also its relationship is
> + * fixed to align with the structure that v4l2 expects for successful
> + * endpoint fwnode parsing.
> + *
> + * It is only the node property_entries that will vary for each platform
> + * supporting different sensor modules.
> + */
> +#define NUM_SW_NODES 5
> +
> +static const struct software_node *ov05c10_nodes[NUM_SW_NODES + 1] = {
> +	&camera_node,
> +	&ports,
> +	&port_node,
> +	&endpoint_node,
> +	&remote_ep_isp_node,
> +	NULL
> +};
> +
> +/* OV05C10 specific AMD ISP platform configuration */
> +static const struct amdisp_platform amdisp_ov05c10_platform_config = {
> +	.name = AMDISP_OV05C10_PLAT_NAME,
> +	.board_info = {
> +		.dev_name = "ov05c10",
> +		I2C_BOARD_INFO("ov05c10", AMDISP_OV05C10_I2C_ADDR),
> +	},
> +	.i2c_addr = AMDISP_OV05C10_I2C_ADDR,
> +	.max_num_swnodes = NUM_SW_NODES,
> +	.swnodes = ov05c10_nodes,
> +};
> +
> +static const struct acpi_device_id amdisp_sensor_ids[] = {
> +	{ AMDISP_OV05C10_HID },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
> +
> +static inline bool is_isp_i2c_adapter(struct i2c_adapter *adap)
> +{
> +	return !strcmp(adap->owner->name, "i2c_designware_amdisp");
> +}
> +
> +static void instantiate_isp_i2c_client(struct amdisp_platform *ov05c10, struct i2c_adapter *adap)
> +{
> +	struct i2c_board_info *info = &ov05c10->board_info;
> +	struct i2c_client *i2c_dev;
> +
> +	if (ov05c10->i2c_dev)
> +		return;
> +
> +	if (!info->addr) {
> +		dev_err(&adap->dev, "invalid i2c_addr 0x%x detected\n", ov05c10->i2c_addr);
> +		return;
> +	}
> +
> +	i2c_dev = i2c_new_client_device(adap, info);
> +	if (!i2c_client_has_driver(i2c_dev)) {
> +		dev_err(&adap->dev, "error %pe registering isp i2c_client\n", i2c_dev);
> +		return;
> +	}
> +	ov05c10->i2c_dev = i2c_dev;
> +}
> +
> +static int isp_i2c_bus_notify(struct notifier_block *nb,
> +			      unsigned long action, void *data)
> +{
> +	struct amdisp_platform *ov05c10 = container_of(nb, struct amdisp_platform, i2c_nb);
> +	struct device *dev = data;
> +	struct i2c_client *client;
> +	struct i2c_adapter *adap;
> +
> +	switch (action) {
> +	case BUS_NOTIFY_ADD_DEVICE:
> +		adap = i2c_verify_adapter(dev);
> +		if (!adap)
> +			break;
> +		if (is_isp_i2c_adapter(adap))
> +			instantiate_isp_i2c_client(ov05c10, adap);
> +		break;
> +	case BUS_NOTIFY_REMOVED_DEVICE:
> +		client = i2c_verify_client(dev);
> +		if (!client)
> +			break;
> +		if (ov05c10->i2c_dev == client) {
> +			dev_dbg(&client->adapter->dev, "amdisp i2c_client removed\n");
> +			ov05c10->i2c_dev = NULL;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static struct amdisp_platform *prepare_amdisp_platform(const struct amdisp_platform *src)
> +{
> +	struct amdisp_platform *isp_ov05c10;
> +	const struct software_node **sw_nodes;
> +	struct i2c_board_info *info;
> +	int ret;
> +
> +	isp_ov05c10 = kmemdup(src, sizeof(*isp_ov05c10), GFP_KERNEL);
> +	if (!isp_ov05c10)
> +		return ERR_PTR(-ENOMEM);
> +
> +	info = &isp_ov05c10->board_info;
> +
> +	sw_nodes = (const struct software_node **)src->swnodes;
> +	ret = software_node_register_node_group(sw_nodes);
> +	if (ret)
> +		goto error_free_platform;
> +
> +	info->swnode = src->swnodes[0];
> +
> +	return isp_ov05c10;
> +
> +error_free_platform:
> +	kfree(isp_ov05c10);
> +	return ERR_PTR(ret);
> +}
> +
> +static int amd_isp_probe(struct platform_device *pdev)
> +{
> +	struct amdisp_platform *ov05c10;
> +	int ret;
> +
> +	ov05c10 = prepare_amdisp_platform(&amdisp_ov05c10_platform_config);
> +	if (IS_ERR(ov05c10))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(ov05c10),
> +				     "failed to prepare AMD ISP platform fwnode\n");
> +
> +	ov05c10->i2c_nb.notifier_call = isp_i2c_bus_notify;
> +	ret = bus_register_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
> +	if (ret)
> +		goto error_free_platform;
> +
> +	platform_set_drvdata(pdev, ov05c10);
> +	return 0;
> +
> +error_free_platform:
> +	kfree(ov05c10);
> +	return ret;
> +}
> +
> +static void amd_isp_remove(struct platform_device *pdev)
> +{
> +	struct amdisp_platform *ov05c10 = platform_get_drvdata(pdev);
> +
> +	bus_unregister_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
> +	i2c_unregister_device(ov05c10->i2c_dev);
> +	software_node_unregister_node_group(ov05c10->swnodes);
> +	kfree(ov05c10);
> +}
> +
> +static struct platform_driver amd_isp_platform_driver = {
> +	.driver	= {
> +		.name			= AMD_ISP_PLAT_DRV_NAME,
> +		.acpi_match_table	= amdisp_sensor_ids,
> +	},
> +	.probe	= amd_isp_probe,
> +	.remove	= amd_isp_remove,
> +};
> +
> +module_platform_driver(amd_isp_platform_driver);
> +
> +MODULE_AUTHOR("Benjamin Chan <benjamin.chan@amd.com>");
> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
> +MODULE_DESCRIPTION("AMD ISP4 Platform Driver");
> +MODULE_LICENSE("GPL");

