Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5B92417C6;
	Thu,  6 Feb 2025 22:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738882680; cv=fail; b=g8+uzZNWra4TewUFGOPSCuNfINZIOw/msWFKZ39gNNzTO5vCKmtR39MQCZTkKzfSygZhnsrhrDG1Xn5hpy2aIN5q4ntihEbPqiMb8rJbbhiv6i3QG57sZX4lHEO0by4ta2QWTX8fsvOuqVHKE39lQZzMNz/jKOABGG9syEdaYy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738882680; c=relaxed/simple;
	bh=bhXW/nYxnOw6U3dkRs6ye1aUW5k6aRY5nqKWv7w1KuE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WWGT4VjBh3WV9Yjo/eBmwkcRjzcXh6JGBVthe8jYtO2ETuA/sl1b67cSheEOGnAA1pv8vzrprzag7l3wg5lrL9n5kvt9/upck+dxLzQgLMtLUsXa0o7URS+k23r0eoEe3pnLOrJbpTsKuGx21xXNcGFB06JtxPXwcurukBj2/8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Q57c1ejh; arc=fail smtp.client-ip=40.107.220.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Q57c1ejh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qUroqiTx7OliXKFpinItOmedt07v3r9e+laJGcP8U49aw1aGHLNLSiddDvv2jBUO9Vb79jbywkkPs3q1S2S7L14KydlZSJxSqz7IfOhRtQgxYbeiJ8CtABBhCVsSq/oo6Zvouj+GVr3lljQ7ow938LFrOj5VfpLrkIV0QfvLbCBrpQXbR5LSbtP3Y82Fh0FEh+p4nkfmUgDKUzwQoTxz7hx7TmjI9e1WveFqTIE3VLW9RSkCOVAbUKt9EMYPF456v+YucXNMqKGUd5+wcuyJI7hWosBOb8CtjjUWIkoQQ6NzFfrnb61D+xqJlZo2OqHEw7aJlRmDR7jMh9EoyPIE+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6p/p9fzdQOgluKHnCZmQZo9dbjN1ePXCop1q1DtyhqE=;
 b=oc+q2FT/BAh2tWugyaHbLDHj9ym6phYogE//uyXk37AVgqnR7C+I6rIu3v+YZzXWq2bGs0mXIvQ4NlNxwIoxZM9+M3peIsoVU1nQs0jhkxz8m6d2KpwUfyT6pKv4wT7S44qeppBVpkkpELo4Zxu27RSTsRkpxH67FkStRXrRZZt2VW/6Un7/JkgoO3bDOIw8v9FL6NgPcP0koABSstdPCLQGlAkQZeKFBaMuKX6fFpvmGwdFULZQuqDgsScJE1qVTeomNrl3YmRlhZERBTK3rbBfQ4ioipCj6aNqtXHXIOyWJXBm312UKr+V1kTjyrHGhdzHcysPpTM9ON33Dpul9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6p/p9fzdQOgluKHnCZmQZo9dbjN1ePXCop1q1DtyhqE=;
 b=Q57c1ejhqG4AHzEu3WPn3qVBL6AHan9Ja7m67fmtYcjHSNuX/hvFviuhM5YM8FEQdMkczokd+jK4roBkgTBvUAMUA3yBPFO5reC7NFftXN6+CVgv1YQQZg7LZgJ0R5XSWUOgVV830p7tB/TI52gs4PZA3Kr+RPF3nOQkp/11vrw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by IA1PR12MB6283.namprd12.prod.outlook.com (2603:10b6:208:3e5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Thu, 6 Feb
 2025 22:57:54 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%4]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 22:57:53 +0000
Message-ID: <c117f176-cc91-4f1d-84ef-cf19d07a1b7a@amd.com>
Date: Thu, 6 Feb 2025 16:57:47 -0600
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
 <ce173fa9-dad6-4bd4-8165-d6286c661340@amd.com>
 <9bd6b7d1-957b-47ef-8edb-88f9749fcb09@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <9bd6b7d1-957b-47ef-8edb-88f9749fcb09@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH5PR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:610:1f0::13) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|IA1PR12MB6283:EE_
X-MS-Office365-Filtering-Correlation-Id: 028c292d-f994-4209-fad2-08dd4701b054
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TTZ1WWUzOHg4UzlSekxvSjdnR25qV3dTbWpVYUo0bHlsRTc0MXVsWDVyN2FD?=
 =?utf-8?B?TXdRcEdsanYwVncxQWk2bVp5STJ1aWpDcURkTDFEMXBkeERQNUgwSUtaK1p4?=
 =?utf-8?B?Z0pXUE9mZ0R3eG9TcjhPb1FHRUFtRTVSdDB0ZXRJYjdrbkUrVm53ZHdCR29l?=
 =?utf-8?B?ZzgvNEhIOEJZUi8xN3J0Tk5tWkRRT3VxNy9LV0p2S2dzZElqOTF1Vk9vMFdv?=
 =?utf-8?B?M1p4THoyZUs5Z2plQ2p5L0JTSlpmNTB1aTIzVEpxUGZRa2FGalZDQ2c4SzVa?=
 =?utf-8?B?VnZ6NG1EVjVNOUFqNmYrUW8zU2F0dUJNYXNKSEExbi9BTVBTcW5TWllFWExE?=
 =?utf-8?B?VWRBWDE1Y1R0Umg0OUl3c01USVRaYkFCS3JMZEZ6bDUybkdFRUxJVDBJa1V2?=
 =?utf-8?B?T1kyTjA3NlB3VUp2ZkdTRXUvZnNTSTE1d1Z3cmRFNG0wbGg5SENqYlBTQnlS?=
 =?utf-8?B?TnFpaGpDRW9TRElQczR0bGlmWkZJVGJadmJhaGVPbWNja29xVlJUU2IrY3NE?=
 =?utf-8?B?RDUyWm9tcTB4dmRKTytRRzRYV3VOejNkNGE1cytVQjVlRktpY1k5UmRONVY4?=
 =?utf-8?B?MkFwRGFxc3NoSFY2UE5Sb2pMS3BRQXJzSTdURzI3Y0tvRExVSG9LWHp5aXdo?=
 =?utf-8?B?NjFRTEpmVzZ0WXBRS3doVU1pcVk2VnYyQlB0N1ZqVlhMRVFhbGlUNWpOU0ZJ?=
 =?utf-8?B?c2FBTk5MUXgxV042REo0eWdXajRFNGNWU2F6SjVWSEtCcVBjNGNBMVFyOHRv?=
 =?utf-8?B?bmVad0hyREVNRC9mYUp3SmpZSHRNMm1iaEhJdVBtT2lwejdkVTJOamdOSlcw?=
 =?utf-8?B?OTgrR2FSVytpK1RMcE1QSkpFMW9GZThBVGNuVWYxeTZ3eExKVDh4YUd5QnNF?=
 =?utf-8?B?ZU12NlpsYjhJMU1WdXE1QXpkbGEyT1h0aEdMaFpxMWJtR3RZMTR2MlFDRFc3?=
 =?utf-8?B?bFE3M3AxVTZNT2JLMDVBWGNHZHFUNVphSVRYU29PRDQxUzQ2aENnSjR0UHdB?=
 =?utf-8?B?aXp3NkE3MHpYbVRBTVd1N1dxdVljUDFna2dnUysxa0hLam41SWNPYTN1T3Mx?=
 =?utf-8?B?Vzg1dGJuV3N6QVBRMlBzaFB4UGZaQXpaWE5UcHNrNzBhZVc1OWFrYUxnWVJB?=
 =?utf-8?B?UHQxV0ZDQXQ0NzRlcWtLN3g3OEhKM2Fwb2piOWJybWtOTDhoQlJpTElZNi9M?=
 =?utf-8?B?S09EcHYxMHlqZ21ha3RuY2J0ajBScjI0UkJDVGFNaWtNZEZQcTdPRGFHNVUy?=
 =?utf-8?B?WEZKUkZUS2c0VFhUYUlxWWJZOW1yR1NMYWZqbEZUUjF1L1kzMHNVMkxETnRK?=
 =?utf-8?B?TTlOWENLWXRpRVZBcTdzRW4xZExaaXV4SG02aEt2UFJEKzRqenc5QTFYT0Rl?=
 =?utf-8?B?US96dCtpNEEycjlEVFJNNFRJRnE5MkRPcjJjZEFjVUFMeHlmUlZ5dCtySHlT?=
 =?utf-8?B?MUtVWFJsTTdiMG5TSTZJc2pMUEg4SWV0RHFMUUtVMi9QQmpoaXZKWGJhenBY?=
 =?utf-8?B?S1p4V3owYXEwM1lqczJ0TWx1TXFHSU11TXVjekRhNkVIeEFiTGp4dmdwa2FS?=
 =?utf-8?B?WktsT0RNUlprYi8yMmIrd2hsd1F6R0VrOXFyek5XMzRTbEg0QTZWNi9zdUJx?=
 =?utf-8?B?cmM5OGFQeTVrZHNLQ3BmcUpVYmp5aFJhSUZCOVpEWHlvQkxxUmFaeGRCT0hh?=
 =?utf-8?B?N3p2WFZLUEpRdHFKcDFpR3lCQ2llWTgyYmpDaHQwU2M4Y0Fac21MTlhCNHNq?=
 =?utf-8?B?cXB5eFQ1R1Ezb0xtK0RSOHlrd2dhMVcyYkJOY0VlNEhudmRNVDRpaW5iTGFI?=
 =?utf-8?B?eFZkblEvYlAyWmdMWVcxQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tm1ZNXJRWlliYWtKMGwzTjVLT3RiRHB3c09PeHJhRGJyMnlSZFRVM2hCaGVu?=
 =?utf-8?B?dkJsQlYwUzRDaXJSbytaYkE1TTlqY3ZRbVk5eC9QbUk1SG9oamJJa1VqK29k?=
 =?utf-8?B?aVB5UzRUYjZkUzVhMjlWMWpnZEs4aFA0aElLdllBeDVuWVhKdWxDQ05ZQUhO?=
 =?utf-8?B?QjUxWk5ubnpRMU5naVFpVjNlL0FJV2w4OHJ0cEprRVh3OFA4NlNjd3Zja3or?=
 =?utf-8?B?WlhGUk9FMWJhWC9CMkpqaFVKaXNpQzN2UjdvWVVzbXhtTDFRQm5DekVDZm84?=
 =?utf-8?B?V0RxeVJtZ2FHelE4ZmpQWWVMTWxPVFV2WEx5bE5JVWdpbEdQQkF3Rjd3dU9w?=
 =?utf-8?B?MUZtaUZHbWxIUmJrZ0VETW1aUlMvRHJSRnA2bm5UaVNJMUtpM2pjWG1wRTFH?=
 =?utf-8?B?T0lvTjdZdElCWEg2UWRHL1VNR3FwRll6TjdTU2ZELzY2VHFiSVYwRHovTEFu?=
 =?utf-8?B?S1BwZDJpZDB5dGxneTJtZGgwYmlUL3hlWWNnWURWdis4c2x1Q2Rjajc0NFdO?=
 =?utf-8?B?eU5WRHVFRzliZ2tubTRLMVZxdHkrOVZhL0Nic2FDSzd0OWxiT3IxakdmaGpa?=
 =?utf-8?B?eGY2M1FneUtjbWVXYkpLZENaZDFRcFFOSUNVLzJlUm9qbit2VTBzdE9wdmR0?=
 =?utf-8?B?QVgwTGx1MkVpTGd4Um03OXR4ZGZKZjVmQUM0VGNSbWVybjdiY09LdEprSCto?=
 =?utf-8?B?YW5vb0pHSzBRN3VNWE5ONmI0VExYeVU4bC91WG9XY3kwck1OZXlMaFNSeDJn?=
 =?utf-8?B?MWdoMFl2Q2h2dE1DZWd1M00yeHBsb2FaTS9QRVFWWnBZd1hKb1pZbWErNGlM?=
 =?utf-8?B?ZkV2YTJYYjYrWW1EWW45VFA1YmRvRzdHd09LUkQrSmxJZnRtQlZKTUVNTlJP?=
 =?utf-8?B?eDJVZEFpVHYxSTk4UFgxVnkwT1BQWnIrNzdrSS9CWXNMWW50MVNCTnFEWktq?=
 =?utf-8?B?TmEyMU53clJKellVTGlYazJHbTMrTG91dDJuZWVzZVZNRHpTejBHV3YvMEZR?=
 =?utf-8?B?ajF3THZDTzlqTjZHOTdxR1hEUzhIaFRueTdFUEphSEVGalNXY05STGo0MjNw?=
 =?utf-8?B?MHhIbVQxL1pTelVyL1JQT2dVcndrcXljTEFhd2xBMXlsaE9sTU5WUHZzQkRX?=
 =?utf-8?B?ZmlZeDdzZ3ptQ2VkdTI0eWNodEZ5Qm1vdDNlaTcrRkwxaEpuMk4vcWVyalpz?=
 =?utf-8?B?TjA5cmJoWm1NOWhPdFRrTnhGbS9EQUU4ckFjVGRTS0xSRE5DdlVGYXVtRFFS?=
 =?utf-8?B?bWxXQUI0YUxIdDRBSFhoWCt5ejZHcyt4bkQxMmx1U3FkTkVaMG9YWWRTY1FG?=
 =?utf-8?B?d0FXQVVlTjRZNkErNDc1NXAzZllITlRrVnhsUlcreU9kTkF4MU15TjdEMEhS?=
 =?utf-8?B?UExDeFlXT1BsbG1CNEttNTdiZklHU0RKNUZ1ZXZmZ1ZrNXBrZkNqL21hR1ky?=
 =?utf-8?B?aW9kcVdKYmJ6WlJrL3Q0eHZBc2tIeWw4RG5oNE52RkJsVTlMM284RkxPTHJT?=
 =?utf-8?B?STdKYlBUOTV0WnZiRmpmK3UrMm1WM1lVczY2VmRYK2hicCsxZFE1UGhwQ1hp?=
 =?utf-8?B?TWZjbm42eU1IZjhsYlQ4VU0xZW43R3QwOWkyQnZrMW83TU9adGNTY0JiWjE0?=
 =?utf-8?B?c3NWZERGN09UakpVaHoxLzJWZVc3U3BOZVNFa3ZPQzZqNHFGWUFuT2FVSURP?=
 =?utf-8?B?NEVxSzlCV051bGs3bVlINTVSVDZONkZYYmRDK3UrUGhaWHlvYmttUGU5ZW5V?=
 =?utf-8?B?U0VEN3ZXOCsxUHJYby9NbllLQmg0OGV6Z05DODIvYUtzdDEram1WTUdtdnlW?=
 =?utf-8?B?T3BZZ2krUjgwWFhMSk8rcklQL3ZzdzhRTzhvamVmK2tZdEVzaHBydklqSzJu?=
 =?utf-8?B?U0UrRUJ5QWhkUnVqaXZZa0xpK1EyRFFycUlVdkRBNU9ZVDR3Ymx0TUlyVmVq?=
 =?utf-8?B?eGlXcXdOY3BlNjFrUXYvMHF2dzZYMnpXejFXSG8xT002OE9RaHhoN1FHdTZx?=
 =?utf-8?B?OTU3amlWOVREcnFPRzg0cUZJWisxd2tuYzNBQkcrY3dORTk0eHUwbTJnM0lV?=
 =?utf-8?B?SHIxd3VEWFFPenVyazkzOTc0VmRCY0pLelcwelpvNVVjd0FZTkxnQjc3SlN4?=
 =?utf-8?Q?0gHW0NcaWevO+pSCkNj5Wmtkm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 028c292d-f994-4209-fad2-08dd4701b054
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 22:57:53.7136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4yiwspi0U818UbitKYjP8XtmKhgG4NF2LwlHrLaDJ8V20Q8HhCH86w7LvrZsxdXW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6283

Hi Reinette,

Lots of things in here.

On 2/6/2025 12:42 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 2/6/25 8:15 AM, Moger, Babu wrote:
>> Hi Reinette,
>>
>> On 2/5/2025 4:49 PM, Reinette Chatre wrote:
>>> Hi Babu,
>>>
>>> On 1/22/25 12:20 PM, Babu Moger wrote:
>>>> Add the functionality to enable/disable AMD ABMC feature.
>>>>
>>>> AMD ABMC feature is enabled by setting enabled bit(0) in MSR
>>>> L3_QOS_EXT_CFG. When the state of ABMC is changed, the MSR needs
>>>> to be updated on all the logical processors in the QOS Domain.
>>>>
>>>> Hardware counters will reset when ABMC state is changed.
>>>
>>> I find that the state management in this series is organized better
>>> and easier to understand. I do think that it can be simplified more
>>> and a hint to this is that it is mentioned here but not done in the
>>> code introduced here but instead required from the caller. It seems
>>> simpler to me that the architectural state can just be reset at the
>>> same time as enable/disable of ABMC?
>>
>> Right now, it is done from mbm_cntr_reset(). It does both arch and non-arch state reset for all the RMIDs in all the domains. It is called in two places.
>>
>> 1 rdtgroup.c resctrl_mbm_assign_mode_write -> mbm_cntr_reset();
> Please see my response to this usage in the related patch:
> https://lore.kernel.org/lkml/b60b4f72-6245-46db-a126-428fb13b6310@intel.com/
> In summary, I find mbm_cntr_reset() ended up being a catch-all for random
> cleanup and creates confusion with the other mbm_cntr_*() calls.

Yes. It should work. Will respond that comment later.

>> 2 rdtgroup.c rdt_kill_sb()-> mbm_cntr_reset();
> Please see my response to this usage in the related patch:
> https://lore.kernel.org/lkml/8d04f824-d1cc-461c-9c57-0f26c6aa96e0@intel.com/
> In summary, it does not solve the problem it originally set out to solve
> and it can be eliminated.

Yes. Should be fine. mbm_cntr_reset() can be completely removed.
Will respond that comment later.

> 
>>
>> I will have to introduce another function to reset RMIDs in all the domains. Also, make sure it is called from both these places.
>>
>> list_for_each_entry(dom, &r->mon_domains, hdr.list)
>>              resctrl_arch_reset_rmid_all(r, dom);
> 
> I do not see need for new functions, except the one I mention in
> https://lore.kernel.org/lkml/b60b4f72-6245-46db-a126-428fb13b6310@intel.com/
> that suggests a new helper for reset of architectural state that does not
> exist and ends up being open coded in two places in this series.
> 
> With only one place (resctrl_mbm_assign_mode_write()) remaining that needs
> all state reset I think it will be easier to understand if the state reset
> is open coded within it, replacing mbm_cntr_reset() with:
> 
> 	list_for_each_entry(dom, &r->mon_domains, hdr.list) {
> 		mbm_cntr_free_all()
> 		resctrl_reset_rmid_all() // Just for architectural state
> 	}

You meant "Just for non-architectural state" ?


> I would not insist on reset of architectural state within the
> architectural helper. I find that it is best for architecture to
> maintain its state but I also see there are many precedent for
> resctrl explicitly managing the state.
> 
>> I feel current code is much more cleaner.  What do you think?
> 
> It is better that previous versions, yes.
> 
>>
>>>
>>>>
>>>> The ABMC feature details are documented in APM listed below [1].
>>>> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
>>>> Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
>>>> Monitoring (ABMC).
>>>>
>>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
>>>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>>>> ---
>>>
>>> ...
>>>
> 
> ...
> 
>>>> + */
>>>> +static void _resctrl_abmc_enable(struct rdt_resource *r, bool enable)
>>>> +{
>>>> +    struct rdt_mon_domain *d;
>>>> +
>>>> +    list_for_each_entry(d, &r->mon_domains, hdr.list)
>>>> +        on_each_cpu_mask(&d->hdr.cpu_mask,
>>>> +                 resctrl_abmc_set_one_amd, &enable, 1);
>>>> +}
>>>> +
>>>> +int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable)
>>>> +{
>>>> +    struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
>>>> +
>>>> +    if (r->mon.mbm_cntr_assignable &&
>>>> +        hw_res->mbm_cntr_assign_enabled != enable) {
>>>> +        _resctrl_abmc_enable(r, enable);
>>>> +        hw_res->mbm_cntr_assign_enabled = enable;
>>>
>>> Added benefit of resetting architectural state within this if statement
>>> (perhaps simpler to be done within _resctrl_abmc_enable()) is that it will
>>> not be done unnecessarily if ABMC is already in requested state.
>>
>> It will be
>>        list_for_each_entry(dom, &r->mon_domains, hdr.list)
>>              resctrl_arch_reset_rmid_all(r, dom);
> 
> I am not sure if you are actually planning a new loop here ... as
> I suggested above this can be added to _resctrl_abmc_enable() where
> there is already a loop over all monitor domains and all that is
> needed is to add a call to resctrl_arch_reset_rmid_all(r, dom).

Sure.

> Even so, as I mentioned above, if after fixing automatic counter
> unassignment you still find that resetting architectural and
> non-architectural state together then we can go with that to match
> the other flows (eg. mbm_config_write_domain()).
> 

Sure.
Thanks
Babu
