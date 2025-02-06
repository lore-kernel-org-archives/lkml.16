Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2A81F4184;
	Thu,  6 Feb 2025 16:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738858518; cv=fail; b=gXs/1qysJYMy5sq8hvoLyVAIh1DWxC+FpEpGwNxJXrHef+2fItHTuR66UkjE2K7Q/F/4YK9yuiRlgJ27RKmgRNWB+Smd5ASOqPzwmUeYNM9g+OSIY91un/GDuK/vIUCvPwVhU+71KIFwP4BWXqdOwYWdq2qYIqWg3YMRYZNj7Vo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738858518; c=relaxed/simple;
	bh=1gI9KXreoGX2UjKg31Fza3CS9VBUdjh4WUuko8m1qFQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PQ90O1gFf2B3nPkLrNGF/qDCRI3xV4d4zZZ4f8h4xoby1IFSHh1ENJycridMOYuvWbwU0h7amwY496B5ji0eytiW8NcFlZQiVWJYvtPtZIlIDt67EUaf2MOIsn+XhRUkM9LFVo/R4lEwv5gaZq59fSZFlK9VHZPZ6FpKkzhZKv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=o0zth3sy; arc=fail smtp.client-ip=40.107.237.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="o0zth3sy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jEKTFb71gV+8MDzbh4hCuYTqpCgJyGrK38JmLMJ5cNTCzGJV9aueg3mSYxXa4Xa93PvPXtYd3IxZ5NEKsAElx2BWHYCWH3Po9kt9QBAyptznUhVsrjFxkNxENiP/X0Dd1KX+ScYY62oG70QWoH71KUg6jultfvRXnTb/Ep/PAMXkEjeC0iWiStqgpzKGAYitR1yn8UUdoq+AdaX7Kt/yaAvZ6usUX8dyXRGZ+Lf7g3G29rzGT3sp7Owe6etoq13r4iPn07Q8beDRZMhSe5cEF+3qhebUrr41K6hh67wJt1gYANV0AvrZq+tZ65bg4cHymV1jDbr5kDjveEomyHI9YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9NaIIxr2gyeIJEm97Ffe0eKikQl4qsPNtM+bRTN+hlM=;
 b=E10YH2s8MY17eWns7k+Ny9EyM9VZizHlqwi93bnNyo064lRK8/Q5I+c4wFZ55/qAvIix+eva8d7eahEY8+v7byCGHvWVP67biI0llaO0E3bRGjjHSJ+BkeetF+rzS69x4lMHsntD9wyThGDI6MBloWhGcN+IhcOKZWcN1ghPZgBSjxDlARtKa+xKaU6+Fpnm3P3mfR/9kyh8U0xG+t4Tzd3UHYdCg3L8Fh5Z9iANlyQPBVWOvxWZMoUcfr5kl999wYNTez5Nd8wlI/UP/ApKMPjiI4qK83C6j/jn82/Tn/9msAszqsjeM6673Ix8fony1icJZfMScnvZqOxSfO5VLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9NaIIxr2gyeIJEm97Ffe0eKikQl4qsPNtM+bRTN+hlM=;
 b=o0zth3syF7cFqKX19Y6WacIGywFFIc9CSBgfUrOa2RkKdEcyKl4qftUxs2A36n7f+PDEYb2n7eBoTLiw/a/xxxjS1H17R+2NRc3QrAsE9vri9RarMQYwShSPnFCSb4siHgDjiVr94LmoG3AN7IsRZXEn5sM4ne4wBJGjoqEirDM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by PH0PR12MB8823.namprd12.prod.outlook.com (2603:10b6:510:28e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 16:15:12 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%4]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 16:15:11 +0000
Message-ID: <ce173fa9-dad6-4bd4-8165-d6286c661340@amd.com>
Date: Thu, 6 Feb 2025 10:15:06 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 06/23] x86/resctrl: Add support to enable/disable AMD
 ABMC feature
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 tony.luck@intel.com, peternewman@google.com
Cc: x86@kernel.org, hpa@zytor.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 xiongwei.song@windriver.com, pawan.kumar.gupta@linux.intel.com,
 daniel.sneddon@linux.intel.com, jpoimboe@kernel.org, perry.yuan@amd.com,
 sandipan.das@amd.com, kai.huang@intel.com, xiaoyao.li@intel.com,
 seanjc@google.com, xin3.li@intel.com, andrew.cooper3@citrix.com,
 ebiggers@google.com, mario.limonciello@amd.com, james.morse@arm.com,
 tan.shaopeng@fujitsu.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, maciej.wieczor-retman@intel.com,
 eranian@google.com
References: <cover.1737577229.git.babu.moger@amd.com>
 <920cafec1920358ad0c8af2e78a8f8bbd8c0b77d.1737577229.git.babu.moger@amd.com>
 <8a6fe2e3-8853-4371-b73e-6ff689ccb695@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <8a6fe2e3-8853-4371-b73e-6ff689ccb695@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR07CA0068.namprd07.prod.outlook.com
 (2603:10b6:5:74::45) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|PH0PR12MB8823:EE_
X-MS-Office365-Filtering-Correlation-Id: 20e8ec9e-abf9-4341-3e75-08dd46c96ea9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a0N6WXdCTmk4NC9ZeFZwZjJmcWFXYXdPeDVRNDhBbnJYRjY2b2tFdnErbnZR?=
 =?utf-8?B?K1FpT1FGUUNqb2lJUUgwOEJEaUV1Sm93UHlVVkloeHFkVTFhYjNRWTlCWU5G?=
 =?utf-8?B?QnppOU5HQUsvbTVoejFPQmN4OGNyS3NiaVhGQmJpcXhld2k4emswcVAxbGNG?=
 =?utf-8?B?MmFuNFlaRXhsWTZJY1h4b29wbnF5YkdvOEp2ZmFHVEJOTCthdU9hT1VoeDJq?=
 =?utf-8?B?OXAvaVlQd1ZjUnRrMG5jcVp3L1FjcmQ3Z0dVOFIvUHJ4WXdVQ1grVmp2R05v?=
 =?utf-8?B?c2pkRFJoa2toY3plam5NNUhhWHJydXNuVWl1WnU0Z2d5RGtGTzYxRlNhdFB5?=
 =?utf-8?B?WTkyMS95Z3ZvVHZuMmd4OTFBNTJvOEtGNmRIOG5WVVd4cXNML01QNTZPRUli?=
 =?utf-8?B?MFFLVkdaRTVUY1BnM1BVUmx1STVhY2l4dUgvOTRMTXY3cGlOckdTVTRKT2xj?=
 =?utf-8?B?cTI2bk1tV0dhMnUraDV0UElBQitxK2k3S2xqTnJ1QldyOFV0NlM1WVQ4M3Fp?=
 =?utf-8?B?NXl2Y3k1MkxJWFNOS1lWVlcyTTN5anpvKzZMczFVRFlUbVp3NEtrbTdqdXVy?=
 =?utf-8?B?R216eXd0SEk5ZlZpbGJaaW1scVFPSW5iMWNzemdOZmExSzVDdTdvaWxGcXpK?=
 =?utf-8?B?L3dGelJOdEJMNnR6aEVkQ01lWFJQVUFjZU82ak9rZ0g1UjFEaFlpN2dZOHpi?=
 =?utf-8?B?Um91QTBCa0c2eFJRVUE2SDRVQnZJTVpBa2dEc1lNb3NZdlJBaVlQZUc1RUk2?=
 =?utf-8?B?ZGhQNDNaZHdpTUI4OU9DOXJGRDdEM2FZd2NkWGc2V3djYm8zcXZwOHA4VFdU?=
 =?utf-8?B?d1VoZEM2cVR0WVBGcG5Td2U5UkRFOFd3ZjJYN1VwUG9tS3k3Rms1SWFTQWgv?=
 =?utf-8?B?ZlNudDNIRjczd1prS2ZyNFd0bEx6cnBxWkJ4RmhQTXIvMXF1WTJodkhqTVVQ?=
 =?utf-8?B?Q0ZhVk5aMHI2ZUordGcyQ2F4ZjZDaGY0eFlNeUlGaXIvemIzU2o2MCtFeGcr?=
 =?utf-8?B?T2huRE9BNGxMNnNFci9JeVdRUFpIZjNTMUtxTVZFS3NJQk1Yc2pZWWRmekc1?=
 =?utf-8?B?ZE1FQUw0WFhqWkx6dTRyTysrQ1IzaE9RWFdQMjhLNkdpeWpYOVNpcnBieVpK?=
 =?utf-8?B?enYrd2JGZUc1OW92bUdLaE90VG5zeEtjUXRpMUFleUhKL1pqWkZuZXVJQmVw?=
 =?utf-8?B?bWtvMlRWZUlOUWdNbEQwejRuWlM2UEwrODBKWXNwWjgzZ0N5bUZaVlpBS0p3?=
 =?utf-8?B?bWpNSzRhYW1iM1ZoN0hWNzJ0MkJBeFZnNEJTbk1mdFA0cFVLRzZ1eWpTeXRM?=
 =?utf-8?B?ajVuVGRIRnUrVC9PcncvZHk3UHJ3dm1helNuUC9nelJ1SHdrLzBUWmpManpH?=
 =?utf-8?B?aVM4MWtsRHNRZjE0b0t0TDUwbDB2Q2syYTdBN1B1SjNOaUpoRys1eWxPWjV1?=
 =?utf-8?B?UHBwZnNLNk5wWGtGOVFrMkpmMjMrTDlxZmpDK2JsdEJjeWlTRnZYeXJpa21O?=
 =?utf-8?B?Q0RVeXgveW1OeWd3ajU1WjY0UDlPMVdXTnlBZGJUMlNIYXA0eUlUNmkzaGF2?=
 =?utf-8?B?RUQrZGlDclNtZkVWclNqQmZ2T0VNOGg0ZDh0S0YzViswWmFxN1JTQzBydVBs?=
 =?utf-8?B?bERLbnVDT0FLUXZtZW1XK2FDa1Z3cW4yd21EOGVmdnpRVml1Vlk2aXl3RTVH?=
 =?utf-8?B?ZjJLMlljK3M0R0JWUUUzeHgxM0FjbjQ1YnZzQThMQlcvTWRsc1RIaFhYUUFn?=
 =?utf-8?B?NjROVWlEMXN6Q2NGSUZ1Q0pjeHphWW1tVWp6SkdWOUZwemI1dklxQUorelgr?=
 =?utf-8?B?UEllNmx3bEtzaFB1S2hoQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkR3TFVRMnBBbnJKa2ZsWkhhRTBIYk5oRy8rWUtKQkROQzJObzJVVm40NjNp?=
 =?utf-8?B?TXlibFVOWExsbFlLbVFjV3o2S2pKdmgxZ1dUUGRmR2hBcEc3NWc2cWs4Unkx?=
 =?utf-8?B?MVFQQmNUS0gyTk9KNFVPTWNIWHl3SGtZVHM4Q0M0NnpPZGJLckFrMFNXTTl2?=
 =?utf-8?B?WGtINXIycnNIR2pSZHZOTExWeHNzTUFrZGNGalIycXRoeFBzMng5cjh2eVRm?=
 =?utf-8?B?VWs5eEV6OUJtWjJaTFZIM2IyNEgrVG0vdktCbUFJdnJldEtuUzczSy9NTzRH?=
 =?utf-8?B?Y3BNUk5XNGRlSGYwRm5Ka1NzMTF0d0lnNGl2MjRRSTc0ZTdIWUV5WGFTbWR6?=
 =?utf-8?B?Sjc5ZWxFaFNib3BwVDNIY21OS0tRSnIvOVRXeVRzR3YvT2hFeU9NU2xkcWFE?=
 =?utf-8?B?dzR2a3ErUnJBU2lqMjBkTFZRaC9LY0NlZmZMNGI5cHVVQmwwVGpUU3dLLzRi?=
 =?utf-8?B?cmJkU0dJdjhIWWwyWjVuRmRKK0NQOGRmSFBKS0xGWEpZMmcrRjNBbzhtVVN1?=
 =?utf-8?B?WkJPTUlHVGRHV2hicktFKzRuWEE0a09wQld2VVZjNXR2RVZUT1k0clAyNjMz?=
 =?utf-8?B?SlRaSCt2N1l2b2JxU3JrV085M0ZVSmxPUElwdVdyVjdYL2J1QVlLa1lOYUFZ?=
 =?utf-8?B?QTJGRFhRV1YwOC9XajR2TURFRDNxSTVYam5ZTXV1MHk0WjJtR0duOUFhbFB5?=
 =?utf-8?B?ODVYeG9GVXV2dnRKMjN3NFhhT0s5QUllK2lhOW5IckJzMVFJbk1hY1lOcXdk?=
 =?utf-8?B?UnZLWmxWamVaQ2pFK2VyM2cxcUU5TUV3Y2dwS2ZzZ2NIZ2lmd2MvaFJEdVVV?=
 =?utf-8?B?VzdWbVZuc1h4V1dkSk1TYmNPUHBneGhxLzQ4MmZUQlR4SDhRSGRHQkMrbkxQ?=
 =?utf-8?B?Y25kWERpM3FLZHBUL3VmU1UxSzl6V2t5dWhHZFdwVEg5bWJHYjBBQ0c4TEVL?=
 =?utf-8?B?Vi9zMHZzYm9NKy93SHF5UmErYmcwam52cUl5TExHT1FQU2M0QU43d3p6eHJo?=
 =?utf-8?B?MCtvUnBBandOQ2VTRDhYL2Y3cXVGTTFNMCtoWUdDby8rSlh2akpseDdvRmR4?=
 =?utf-8?B?YTVxeTdkaHhkaUpnNWpxZkc3bnBpN3pUUlhGNXAzTEMySXNjVGpHbUYrL3JG?=
 =?utf-8?B?alZ4NysvV09CYVhSRU1waUhzcGtLYmRKeStGVFBQK0lrOW1XcXlqaGxycHpm?=
 =?utf-8?B?NDIycE1MY3ZiTDk4bklrcm44bzc5RnNlaVVCdFRteVEvQmRqVjIwNXNEbTdY?=
 =?utf-8?B?ZjJPL0dzRHRWTFBScUNKdWpmTXN2UjFRWUZqMER1MnMvN2VjNXFtdEhDcllr?=
 =?utf-8?B?b1JHVE8wOTRjc0R6MW4xNXhRc0NCRmtoS3BZNWVEK2tWSTZmZDFqQ1haZXZC?=
 =?utf-8?B?K0RQMDErZmdRZHpwcHlETXUxbC9VSHZwdW9zQ2hNQjdXOE1ETTR2NVN3eFZS?=
 =?utf-8?B?cVM1djZaZXo2M2VMa2dBcGx2RFo3b1hKVWdBRW9NM1p0Y0tmeWszQlA0cGV4?=
 =?utf-8?B?OGtDRXkxdnpocjdCU1p5dFhReDJGYU96Q2ZYMjZkaVkzT0dIemV2eXRoV05y?=
 =?utf-8?B?Vy9RcVRYMndYSGpzL24vNnFHV1d1MWtRTTQ3K2xpV0xOcFdndldiZEZMODhn?=
 =?utf-8?B?SDY1dzcxV1BpOUlZc2dFTmpkLzlCU3lhRGlhVmsrWGVXZGtTN0lmNnc3R1R2?=
 =?utf-8?B?M3Rlb1lHaU5xWHdqSjJvWHFvWFg3L2R1d3JyajZINzNvczRmV0pxV1RlUkRq?=
 =?utf-8?B?TkJMditidlRSQWJsMEV4ZGZZckhRTmw2cjZ4SXczZE1MRCt1NHZWNnlvaXRJ?=
 =?utf-8?B?WjhSYnU3NTE5bXpEb2NMWm5ZVjhYUi83c0grRkpsanhWUE5aR2J6Y3BpM1dv?=
 =?utf-8?B?bTBENy9ZSjUzSVcrcEtsTG9LZk5XREIwU25ybTBMRVNsSUFuWFlkZVFmWW9n?=
 =?utf-8?B?YTVEVm9iYlJTSVA0UGJ6S3A3YUNHSWsyUVBoWnJ2NXR5bi9jczRTZGl5R0RV?=
 =?utf-8?B?M1NxMk1vd0lPVEJrbE11bmFrRjV2NUJGRm0vdDJ3VnZWNTNyYzkvSUI4ZXVW?=
 =?utf-8?B?Q05lSzh5dkxSUFFLQ2I2RnFYdVpoL0gwS0RRUndhZ1VwZkpUbWJJdG1IQko2?=
 =?utf-8?Q?P02wim3iXZBnTCIPaLvcvWo3C?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e8ec9e-abf9-4341-3e75-08dd46c96ea9
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 16:15:11.7594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PA+TJ+sqxOhKYWcKypD4UN6kJnwbsjS5YlATBX6OPph0uQ8fkiReLj0XZNOgL9pZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8823

Hi Reinette,

On 2/5/2025 4:49 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 1/22/25 12:20 PM, Babu Moger wrote:
>> Add the functionality to enable/disable AMD ABMC feature.
>>
>> AMD ABMC feature is enabled by setting enabled bit(0) in MSR
>> L3_QOS_EXT_CFG. When the state of ABMC is changed, the MSR needs
>> to be updated on all the logical processors in the QOS Domain.
>>
>> Hardware counters will reset when ABMC state is changed.
> 
> I find that the state management in this series is organized better
> and easier to understand. I do think that it can be simplified more
> and a hint to this is that it is mentioned here but not done in the
> code introduced here but instead required from the caller. It seems
> simpler to me that the architectural state can just be reset at the
> same time as enable/disable of ABMC?

Right now, it is done from mbm_cntr_reset(). It does both arch and 
non-arch state reset for all the RMIDs in all the domains. It is called 
in two places.

1 rdtgroup.c resctrl_mbm_assign_mode_write -> mbm_cntr_reset();
2 rdtgroup.c rdt_kill_sb()-> mbm_cntr_reset();

I will have to introduce another function to reset RMIDs in all the 
domains. Also, make sure it is called from both these places.

list_for_each_entry(dom, &r->mon_domains, hdr.list)
             resctrl_arch_reset_rmid_all(r, dom);


I feel current code is much more cleaner.  What do you think?

> 
>>
>> The ABMC feature details are documented in APM listed below [1].
>> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
>> Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
>> Monitoring (ABMC).
>>
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
> ...
> 
>> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
>> index c3d7d4c3009a..a7526306f5e4 100644
>> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
>> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
>> @@ -1261,3 +1261,39 @@ void __init intel_rdt_mbm_apply_quirk(void)
>>   	mbm_cf_rmidthreshold = mbm_cf_table[cf_index].rmidthreshold;
>>   	mbm_cf = mbm_cf_table[cf_index].cf;
>>   }
>> +
>> +static void resctrl_abmc_set_one_amd(void *arg)
>> +{
>> +	bool *enable = arg;
>> +
>> +	if (*enable)
>> +		msr_set_bit(MSR_IA32_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
>> +	else
>> +		msr_clear_bit(MSR_IA32_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
>> +}
>> +
>> +/*
>> + * Update L3_QOS_EXT_CFG MSR on all the CPUs associated with the monitor
>> + * domain.
> 
> All monitor domains are impacted and above does not clearly state "why".
> How about
>   * ABMC enable/disable requires update of L3_QOS_EXT_CFG MSR on all the CPUs
>   * associated with all monitor domains.

Sure.

> 
> 
>> + */
>> +static void _resctrl_abmc_enable(struct rdt_resource *r, bool enable)
>> +{
>> +	struct rdt_mon_domain *d;
>> +
>> +	list_for_each_entry(d, &r->mon_domains, hdr.list)
>> +		on_each_cpu_mask(&d->hdr.cpu_mask,
>> +				 resctrl_abmc_set_one_amd, &enable, 1);
>> +}
>> +
>> +int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable)
>> +{
>> +	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
>> +
>> +	if (r->mon.mbm_cntr_assignable &&
>> +	    hw_res->mbm_cntr_assign_enabled != enable) {
>> +		_resctrl_abmc_enable(r, enable);
>> +		hw_res->mbm_cntr_assign_enabled = enable;
> 
> Added benefit of resetting architectural state within this if statement
> (perhaps simpler to be done within _resctrl_abmc_enable()) is that it will
> not be done unnecessarily if ABMC is already in requested state.

It will be
       list_for_each_entry(dom, &r->mon_domains, hdr.list)
             resctrl_arch_reset_rmid_all(r, dom);
> 
>> +	}
>> +
>> +	return 0;
>> +}
> 
> Reinette
> 

Thanks
Babu
