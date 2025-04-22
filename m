Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040221A0BD0;
	Tue, 22 Apr 2025 15:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745336251; cv=fail; b=tHd418tE7fdYx0qu/LtxhN91gAEvjVopQCBDrq1HWmK17eXHYzVCoGroxlmGOUeDAqgSeGJAV6Xg5sL5Ec6l+i9njL/rPloWFAqjO6akBUxc8JDiNNex7diEkCSVwZ43DmaeWWAT/m1E+tbpzGhqXB1aFKQo/3ztTTGW1ARSQLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745336251; c=relaxed/simple;
	bh=94NNV37n2i0lyr2EBburCGkct9bWlxR9BGoym65NIfc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=i+q22grEjKlvEtDVNezHMpGRHke6sqQ7+FZ8pIwF5LRLSV42NaExZVu6nm3z9teluEM16fRrXQ3J9TwvVdhkLzAL5hSVNVNchBUIeTN1AQU3pyweXra1dtimPjDfLO7nsJm00XMPu3pHN1aKKtbaDc65cIvoNCCPrvNHLUq7syM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ROo/aFf8; arc=fail smtp.client-ip=40.107.223.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ROo/aFf8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eg4XgUn5R2iiOuBQYd6l1VCMMILa2mDYTk4SmvKpu8gCWt8l39SAFPltAcRzOMF69dG/fUBtg3uDbfc6j+++81WvZUhFp3UJx/mU+klIDXQMR5zCeOjDMtqRFO5FdN+aCjAzcIHt1N7WQ5nrdzbK54zla+WjaOITqz6UzPeef2tLtqpI+2fqfYU/+cCifpszrT8xEddI2/6fi6aMoDOmYDhQEkd9a07VeA++oWeLkw3J7WRerhy80huu1+UcN+wWZS7G9VGwNrrBmj0s02l92wD+LicXSoKNorvw315+pdzESnTXByQGmT/1yoWrU6mDh4bRXMgSnGs0+OIp7dKtHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQAwa+2Y/nT+lr1x8ulwbBB7qCbz41lRHJNcGDOYRQs=;
 b=jUdctp310J6SK0JGMb9ucSWdb7xbYS0jZwI9cla93U5T9l6Y4IRII9cYqNscZeaLEjUwxmR4BXCc0T0ibgEWv3pc9ymkfSSj0PETwizYUAjv6G4LGjUaL7Z2U1MGVy1LeS/EBPLPnVg7wEwai6NSgEDG1b9QyqQ0kfXFu8rNBnlV/Y1mvARQm2xtEre495mOrwFAlCbKit/ZPiNYt44BI5teJAr3CAbwmbSfgUJL2LZFewIrrK6G9Wy6avOvAMH8LCjGcn2SDzyIjFP07KlbOZW6cbY4uIP8CjQoA7Pxd2Kndcxk841EXll6lGmC9ijeYHh004A0k4hISUzCLRSYmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQAwa+2Y/nT+lr1x8ulwbBB7qCbz41lRHJNcGDOYRQs=;
 b=ROo/aFf8UcIfUR2i2aJagyDf7D7nmpaB7c/l0oONipyIuzyfvDv2cN0cMmygedvfhz5BY0C1Osb4WDkHQgo3sb7brFYuvBxD9BaPO2MT76voikuKJe9aqvYNHqQhKn9pEk0Vo48mfKVIKS6PhQHXXe118N0aSQJty+qYLLwMhzc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY5PR12MB6432.namprd12.prod.outlook.com (2603:10b6:930:38::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Tue, 22 Apr
 2025 15:37:24 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 15:37:24 +0000
Message-ID: <8a6b3ed0-aec0-4f44-9b3d-28f944ab531c@amd.com>
Date: Tue, 22 Apr 2025 10:37:22 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] platform/x86: Add AMD ISP platform config for OV05C10
To: Pratap Nirujogi <pratap.nirujogi@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, W_Armin@gmx.de
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com
References: <20250417182923.1836092-1-pratap.nirujogi@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250417182923.1836092-1-pratap.nirujogi@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9P223CA0029.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::34) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CY5PR12MB6432:EE_
X-MS-Office365-Filtering-Correlation-Id: e576bd52-1ffc-455b-83eb-08dd81b39434
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZUgremtabTBKME5MZHYxV1NGTkZFZW92eXhYUHBzZGxGcTFEbndCRTlmZnRW?=
 =?utf-8?B?N2hpdmllakw3Y1NVc0lMemxGdUp3QzlOTkgyTUUrZUhkUzFhcWdKbXAzSUFp?=
 =?utf-8?B?U2F3UkVRcFo2QmMxS01iRHh5dHhNWGdFeGwyTy9QZ0g3MU8wUEJVblVEMEFD?=
 =?utf-8?B?elRaYVo0NUxiS3RNTmcvSWVKbUIycVV4dW8raEV2cUlMU21POERUeGtKT0Q4?=
 =?utf-8?B?TzhjdlNDanJ6MDVMME91cUJQbk0zYUhaM0hlak92NWt1ZDIzc3pJVGdaVXJ5?=
 =?utf-8?B?V0RUOGl1WC9waE1VMERYTW1QSTIvdEt2YVlTL2c2K3RCckJUS0lKUDVOOHZV?=
 =?utf-8?B?aVVHTjkvZTlHZjVUcTlTb3p4K0RyY0ZGYy95akRIdDA5NW1xVGdBay9hRjdN?=
 =?utf-8?B?MlQ4UHREOWZZZG9VOFZvTTJrSWRub3lrZzZCa0NFNW4ybzBrSTZrYWM3VXpJ?=
 =?utf-8?B?N2oyZXI0Z0d4N2RuWGVKaUpRSnFuSDZRbDQ4Rm9VK2tOcjMvbEJOTnNraXVv?=
 =?utf-8?B?dGZQeG5pK28vWUdodFRBenRWWFVYbmdITTA3MEdVOXQzTk1hUGFMbis4SjBn?=
 =?utf-8?B?U0UvL1hoQnJTU2RVaG5NamNhOUxWRjhQZk5oUzdLc25IblFFSUQzUmtFdkMv?=
 =?utf-8?B?SVhhb3lzYUpBaXlTdzZoZlVmRGFUeDBVRVBVcnBtcGV4SXN0R04zUUVGN3ND?=
 =?utf-8?B?TGhMdDkxYWpPL09YOUlmNStsMVA1UXZFK0liQU9HalVKT1pSYy94NFppSlNq?=
 =?utf-8?B?cVBySUxkQXV6QXRSS25MWG13Wm1sd2taaHlDU29UTXFnaktUei9zVzFxNE9z?=
 =?utf-8?B?dUt0Y0pNRWVXNWFrdmNEMXZ1OXlJb21Ya0h0c0FCbVk5dzd5Q2s3R2VHbjNk?=
 =?utf-8?B?eHIyMy8yUTlLSWNFUkdnOURKNkNEWmc5Yk9kMisrc0NCbHNFcXM0a0tsdjdt?=
 =?utf-8?B?Q0s2bU9jaGp3MThHQURJQzNHMEN0N1pONFdINTJDaVBLMk91czhlbEVEQzZQ?=
 =?utf-8?B?RXMyUXJqZGR2aTk4Syt6K2R1Qnl4YVc0M3cwakRkRnN3bFl2Rnd4UHphMWRm?=
 =?utf-8?B?NXZvRFh0ZXBkenVmTU4yWjVrNit0VXdCMk9xdExkaGNZSVF6b01Zc3VHZHZo?=
 =?utf-8?B?ZjF4eTFkQzFrajJza21WbzM2QnFacGJxWVlZb1UvK29wRFpBZjd1M29mVFlL?=
 =?utf-8?B?Nnlad1Y4SG5hb1VyZ1l4ZHZYcitDWXFpVGZDVzNIQ2luV2UwSXBJUlJ3VTBj?=
 =?utf-8?B?a3U5VmZZekl1bkZsRCtrbkorU1lIYVdTdTBsWmVHVmpLSU9LNGE3Z0hDMEFW?=
 =?utf-8?B?bWtKNEo0U0JjOTRVYXhzUzZNc0NhUUt4VnArYzNpa0FsbVZuMDlma0JsMHVK?=
 =?utf-8?B?TkdBVmU5cEx0SWpYeHE5aXVveHZPMk1iTnpUZnd5ZUV5WDhOZnlLZXRRdTEw?=
 =?utf-8?B?aW9CM2EvOGxrcXpPM21sL3lmWWZReXBjb0tEM2E0ejAyRmdwcmRUb2xtbitn?=
 =?utf-8?B?SnZsZGZXcXNVNUxCKzRqbS9aVGROeXUvZXdvUkJCTWN6aUo0Rjh5bENIeVVC?=
 =?utf-8?B?ZER3Y0x5bmFUWjByZitueGZzKzVSUE1XU2E1ditnQXVETVZySjhiTnZYeXll?=
 =?utf-8?B?dzR0bFhHNDF2MDJXUFVKbURJaHkzQjRzYTY0VUZqTkNwSC96ZjhsR2xwSVJO?=
 =?utf-8?B?L3FKSm9CK1M0WE5rOVJlNjA4QmZET2JWaTJsNXBUWi9ObUpHMDJ1WFBWcTJD?=
 =?utf-8?B?NDVyS0xueTFzS2lsUVRLMnN4UXdhVUFOSjc0WDVRVUpYcTdLMEVpYkUrRnh2?=
 =?utf-8?B?SEIwTDBuaWxXU1dWWkFCazV4Z0ZFVTI0RWIxcFZMbVdJTCtXQUhCcXBVOWFl?=
 =?utf-8?B?VWJYb3k1UVFHazlBdlhjakpJcDY3MkxZQ2VNTTNFMGtDWnFldy95Uy9DVnVk?=
 =?utf-8?Q?mTcl7/t6gyI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjFjV2pkM0E0ek5Rb2d6bkFDQThVNmNqVERMOGFsQlVrTjd4QlUvS1ZaSGNT?=
 =?utf-8?B?QXpEbWRCRTdQZ3YvL0ZsemloWW16QlJnSHJ1R0hMeEc4bmF3MmhZdFg5SWhx?=
 =?utf-8?B?WEVzOEpDMGFGWDRYK2RjODdyNzBRV25iaUMxM0hyS0RON3B6MmJVMG5rY2o3?=
 =?utf-8?B?V0dlSjZzVURNaENib1BYb3A0bUpra3hEMENPekE2UGxyUGQ4OW5WSEMzZVQ3?=
 =?utf-8?B?Q2crcWxOelBBYUFrS1AyZzh5cHlpRVBRdkpXdk1SS2FpZCtURGdIWGVFejY3?=
 =?utf-8?B?MlloQWVOMUdXME9XQmdncy80Q2llNXlIK052V2drQTdmc0phbERTengzQlR1?=
 =?utf-8?B?TjRhaE5qRnRYREFLYTFNTnRXd0wvUDNlNEFjbk1aQXRibVpBaTVzbTA0N2pP?=
 =?utf-8?B?eE5CbUR6UEFYcksxV0I1WXl4bGQ0ZE5MT2t3K2pHSTc1SW9CVENTd2hWZ0o4?=
 =?utf-8?B?eU5KT0JvU3VJSHhmTjlyUnRKbXpTa0hxbFNXeDRLdzRhMVhXaDA2M3lVeGlC?=
 =?utf-8?B?cDIrNWRrYTBGa3ZGTGE1QWQ3TEcxOWoxNkNZYnNvOXdBRGZ0azNDMitRc1cy?=
 =?utf-8?B?T0loNWxBY1NrYjM0SUZlckxOTjkyMDd3V3pLdXA4WUVySDZDVmh2R3VnbFV6?=
 =?utf-8?B?Z0dzNUtXYXBJNjYyY1Bkak5tOFRCSWxIT1Y5MEgyZFJqU3poOUhBUVRlNnkv?=
 =?utf-8?B?b1ZmK0ZHcnRaWWlHQmgxNlc0bm94Vmh5VWgvMFU5RHVpV1ZldmVSYUNOTTRO?=
 =?utf-8?B?cXJTQlRpaDZrb0lHYTBCSmdPeEUwd09EMXZMSFVLWjRGeTFTVUxnMzZsS050?=
 =?utf-8?B?ZjlqN0VBRW0yeGVzbzlReTJtcGtMUC9YM0N4SU9RYTMvV2VpcGFNN3Y4bTFY?=
 =?utf-8?B?Rm1CcEN5SGV2NGZnYUNpeVlEMHA0Q1VnY0Jsc0RwMTFsTmI4RjFqREpDNHJW?=
 =?utf-8?B?eHNhYW1EQ3NWdUFGSmdKWFpCUFRPbXFNczM5MTlDNGZOTUd4WXI4US9HRFp0?=
 =?utf-8?B?ZS9EZVR0WVpheEJmVjRTOWFkUUs1SlR0RXV1bFY5NjRhNG5xa1FkZ1NncjNz?=
 =?utf-8?B?NzVIbWkwVEptZm5yUElYencyWnh4Z2FUaHJYOFd4dDdHMHZQdG5YUTdMZ011?=
 =?utf-8?B?R0pqaFR0Qm1uWWk3bjkyNXJwck9uV25LQWhuRC8zY1FuMHFhV01zNmhhT2d0?=
 =?utf-8?B?SGxEQmdrOVVseG5rTTZ2R3ZDZjV4aE52dTEzbVpIbUVFSUVMNGlaQXZ2U1dC?=
 =?utf-8?B?K29kbnp0REcydnp6TW8rOElYRDNaTjVsQU5FVkdLclQ1cEdLS1djSTVVUlI0?=
 =?utf-8?B?dDNOeDZsVkFidytGWjQyVHY2b3FIdkZFL2NQL0QyU2hwK1lnQXBYdHpjSnIx?=
 =?utf-8?B?dHM0TUZLcGh2akJ2a2IyMzNFK3Z0NmpBRzV1MmV6dUhLZzRoQmRTTlpDdVVN?=
 =?utf-8?B?dXhiK3UybVF3VFFpNkFDOGdWSmxpMWdyWmNoQXNrbTVVelJ6TGdpZGRWZGNP?=
 =?utf-8?B?aTJQMUpqZVZVekpGY0RXd3dDK0JnbzhFT24zbG1YcVJvOWZpUjZzN1k0Vnhy?=
 =?utf-8?B?aDF1aStLMHk3c2NzUUc0ZzdCTVJyN0lYY2RpWUJ6S3d0aDg5S2pyTk1nNVhP?=
 =?utf-8?B?dU1KK09pV1ZheHBCNlVkbUJtYU9FUjFieEdvUkpwR28wTEtlYllUL2FxOFJl?=
 =?utf-8?B?a2FIbmhjSzB6TDBvUEl2VW9pOWFzNUJNQUtuY2lIdlFVSTQ4RjJDZ25xNzlJ?=
 =?utf-8?B?SCszSGtNbVExVDhKTXl2ZGF5a3FlSitvZXIxM0JreTlwVy9EdCtrZFp1K3dk?=
 =?utf-8?B?WlRDeFBneFgzYVVCb0RueUdPeVFRS0lHNEwyR0pOYjhGMTJMZ0pSWlhvaU82?=
 =?utf-8?B?UXJ0TVc2RmdFSXk3NjhMOVluQXM3ZGd4N0tncHhHeFE2M1RQNk1oLzc2Y2I5?=
 =?utf-8?B?cjE2d0FITFl5cEJCeFJlNmNTZ0hHbGZTdVVFV3JLTytZeWprVDUxL0I3VG9n?=
 =?utf-8?B?MDVid2ozSWdXRUl5Tm8wSS9SUmF4eHNSczJxNExvVmR6UXpWV21qUFpRbjM1?=
 =?utf-8?B?SWNZSGVaTkoxUmp4OXRrbEtEcUozTWROZ0dJNWJXbmpDdGFDdXpscFMxRFg5?=
 =?utf-8?Q?cbpY1IU30nbxO0W5GbeRtsnFt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e576bd52-1ffc-455b-83eb-08dd81b39434
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 15:37:24.4435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rt5k6eFdsTD6jJT70xxA2ystcc3Z3RFpXUW7u1K07cYroiZpsI0NdjZpAvspuS9Xqlo1L5UM+rI9ENthRNUgmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6432

On 4/17/2025 1:28 PM, Pratap Nirujogi wrote:
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
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> Changes v6 -> v7:
> 
> * Use devm_kzalloc() inplace of kmemdup()
> * Use IS_ERR() inplace of i2c_client_has_driver()
> * Remove the extra cast
> 
>   drivers/platform/x86/amd/Kconfig    |  11 ++
>   drivers/platform/x86/amd/Makefile   |   1 +
>   drivers/platform/x86/amd/amd_isp4.c | 269 ++++++++++++++++++++++++++++
>   3 files changed, 281 insertions(+)
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
> index 000000000000..461a10be5ccd
> --- /dev/null
> +++ b/drivers/platform/x86/amd/amd_isp4.c
> @@ -0,0 +1,269 @@
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
> +	if (IS_ERR(i2c_dev)) {
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
> +static struct amdisp_platform *prepare_amdisp_platform(struct device *dev,
> +						       const struct amdisp_platform *src)
> +{
> +	struct amdisp_platform *isp_ov05c10;
> +	struct i2c_board_info *info;
> +	int ret;
> +
> +	isp_ov05c10 = devm_kzalloc(dev, sizeof(*isp_ov05c10), GFP_KERNEL);
> +	if (!isp_ov05c10)
> +		return ERR_PTR(-ENOMEM);
> +	memcpy(isp_ov05c10, src, sizeof(*isp_ov05c10));
> +
> +	info = &isp_ov05c10->board_info;
> +
> +	ret = software_node_register_node_group(src->swnodes);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	info->swnode = src->swnodes[0];
> +
> +	return isp_ov05c10;
> +}
> +
> +static int amd_isp_probe(struct platform_device *pdev)
> +{
> +	struct amdisp_platform *ov05c10;
> +	int ret;
> +
> +	ov05c10 = prepare_amdisp_platform(&pdev->dev, &amdisp_ov05c10_platform_config);
> +	if (IS_ERR(ov05c10))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(ov05c10),
> +				     "failed to prepare AMD ISP platform fwnode\n");
> +
> +	ov05c10->i2c_nb.notifier_call = isp_i2c_bus_notify;
> +	ret = bus_register_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
> +	if (ret)
> +		return ret;
> +
> +	platform_set_drvdata(pdev, ov05c10);
> +	return 0;
> +}
> +
> +static void amd_isp_remove(struct platform_device *pdev)
> +{
> +	struct amdisp_platform *ov05c10 = platform_get_drvdata(pdev);
> +
> +	bus_unregister_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
> +	i2c_unregister_device(ov05c10->i2c_dev);
> +	software_node_unregister_node_group(ov05c10->swnodes);
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

