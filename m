Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C188E2C3261;
	Wed,  4 Jun 2025 11:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749036312; cv=fail; b=C+NhvbkHVeYzjaw5brU/T1alYSHmdUNe3GvGQsGg9ejyQGXgFCoixwn5vFzKEsuxP3it3Wm5cNRS6BVT8OUzkzXtLaFFTM0po3wTY68bUglm2dhmpuIv8Q70xs/jpsMmNmEoVmQkqQVggj1aFRJ0dBn7nT/TQ6bLCmrrkOPcn8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749036312; c=relaxed/simple;
	bh=Sclj0X5Wqmd5jdHr2V+8R/l3yobv2CN6mEv5Vg30MXI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=s/MMiiYApn3w0Ow2meFz4hFOqHl72HEKbfQ9Ex91SLEPl7UxWzLjiunLUjBjno/Y18E6p6QhbYgjetQppGpzr4bgWvE+iJImU0ZXaZt+EGXKO7NWc+ViXDDng/WJjZfzO96r64J3G8DfHtn9/SkPko+ripvDdxtxRrQw1Q37InA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Uta72S3L; arc=fail smtp.client-ip=40.107.220.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Uta72S3L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B0SvnO+HzP3VADjE8DhjubUlNgKH1xMqmc+bFNKNR+MQXhfi6yOwp9pflVSQ73YhAbtK8FIuMNcw0h8NKe0ftX2MtQvKpqEtv3shKoj/jQKlRKI8FRe/NnvZU/KOQUzhJrGW67KT8tuPKaiRwZyotBd79y6yn5xXeQRlfe6UHlFeQ2X2XZsH8kNyU/bZyOJ72B4T35Ww/SHBwtoT8BbdxhdUjzU3I929nC6/dckfRucZFcUQ6tyWkU+IgjOWwpkueksl/8y5Uy0IDWYtJvmIVNHAPk+Cyhc7v7oiwrqlETtOj+L9CAKXBY/MTI0Z5bCtkcAl0G7vKpgifgQUwVgH1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ef5MtIATJQApQ4C4MrrH6jMGYSdXle9FqJxE0HUr+XQ=;
 b=k5svt+v5bQ+tjnqB62fiRCoxrnYjNJ2Qiz4WMqvnnR/XM7OhlHjQ14Hp1F/6MwNJ4BpRQTbcvwNUURemkHVpIj34c7x6NtUwb5Pype2r+tqfSJM2b4yHUGs7KxGeNmHXQJO7SOOh/gHB+eQeKEJk+ZanMdaN/BlybxgVz7yIFcw5XpJgRUz0uzo5Yi7k51WGFFn2tQioTycTCRSh7rwGjlGZmhM7VguOcZNVjRQ/Tz6dQk1hS+aJnSOxR4ekNYdWTut/oG70RYbzXe7IttRYygsi5Zla/HbsmsYkEJwOcc4hgKKI9pdpwYltvwAOlFV15KeVvAEYHtMX25V2smJCqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ef5MtIATJQApQ4C4MrrH6jMGYSdXle9FqJxE0HUr+XQ=;
 b=Uta72S3LsqTYuUZ0i4kYaQ004LAim+y1ePtg0qyiiv2Xv6G9mvG1PeZXZNqN2tX3hZWEpU3aHb898yH4P1Yk5qUetZh3gxgueto+T1cp6O9b2U6GkUy0BbA0w1x6YyRQThh9qKrVcM37RKW1vv7dfwhXbsudgu8MCcPOVxVeios=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5962.namprd12.prod.outlook.com (2603:10b6:8:69::7) by
 IA1PR12MB7710.namprd12.prod.outlook.com (2603:10b6:208:422::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Wed, 4 Jun
 2025 11:25:08 +0000
Received: from DM4PR12MB5962.namprd12.prod.outlook.com
 ([fe80::5df0:a9be:ee71:f30a]) by DM4PR12MB5962.namprd12.prod.outlook.com
 ([fe80::5df0:a9be:ee71:f30a%5]) with mapi id 15.20.8769.037; Wed, 4 Jun 2025
 11:25:07 +0000
Message-ID: <b579c4eb-058a-445f-b288-aef1daffeaf3@amd.com>
Date: Wed, 4 Jun 2025 16:55:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/platform/amd: replace down_timeout with
 down_interruptible
To: jake@hillion.co.uk,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
 Carlos Bilbao <carlos.bilbao@kernel.org>, Hans de Goede
 <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 sched-ext@meta.com
References: <20250530-amd-hsmp-v1-0-3222bffa4008@hillion.co.uk>
 <20250530-amd-hsmp-v1-2-3222bffa4008@hillion.co.uk>
Content-Language: en-US
From: Suma Hegde <Suma.Hegde@amd.com>
In-Reply-To: <20250530-amd-hsmp-v1-2-3222bffa4008@hillion.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0030.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::35) To DM4PR12MB5962.namprd12.prod.outlook.com
 (2603:10b6:8:69::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5962:EE_|IA1PR12MB7710:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f09f9f4-2567-41af-da41-08dda35a7590
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MW9pYnFhdW9vZjl0Z2hWcVdkOS9lK0EvaENrdUxudEtVQ0VVMUtMdHZVcGk2?=
 =?utf-8?B?YzFpeUdhNE4zUzlwMXUzTGUwS1k3MFVvMlNsVm9WMVhzbFl2d094OGZFVFRn?=
 =?utf-8?B?c2VGN1BJN2hJd29SRVBobHcxdEZvNkw1dnFmbFN6SEZFc3dCN2lvZlBlRGNC?=
 =?utf-8?B?TFo4UjB2Qlc3OXkxN3ZoZGpqbGNsV1ZmaGdpTkFCdUJySDlDVXN6ZGV1cUZG?=
 =?utf-8?B?MENITjQ2b05MZkJ5UldhSndFOGRRZnlHT2d6ZVIrZEd3SDZxOUt5UTNkd0Y1?=
 =?utf-8?B?TmRKY0hrUXI4UFNWUWVmSnhoalN3bFByUWlqaEhZdVd3ckVtK2RXMXR3ZExJ?=
 =?utf-8?B?NFFIdU9zZHhtQnZ1SGpyOFpDUnhtOTRRL3dDMEV3dmpUZDNDMzR6N3pCUnBD?=
 =?utf-8?B?ZUR5Tm5HcEV4NGkwbGl0b2FtRVMwL0J0ek5NWVNZazNWaHhwV3Q2NE9GYkpv?=
 =?utf-8?B?eXcyTDc0RTJhL2hIUm5kTmJFSWV3dTlpZ29BLzJZWnBHTjRrS0NCcGlBYUpY?=
 =?utf-8?B?OGxrWlhVS1hIVmFWa0x0Y0VoUmtFeHhYOFdtcWdBbHg5WVcwTHJ0aldUMWs0?=
 =?utf-8?B?dFRENFVZY2JGblZaQWhZTklQc3lJeWtmcjRJZEdJUkVzTmRpTW1DSlRCSzhQ?=
 =?utf-8?B?blpPL3g5alhJN05vbG16THZDekoxL0tpa0QzSC9DSGtPUlplU0FRbUxkRmI0?=
 =?utf-8?B?TFJKQ09VRlJFMys2Q1NTUTJ5OVZXR3dwR01VTkdVeUdpRmdpVmxjVFFQempS?=
 =?utf-8?B?RVVwK2xOb1FMSXdVMGxoWUZFTzdzeXVEUjg0dVFUbi9qSkpOWkptSmJhZ0Zl?=
 =?utf-8?B?bGM3a21zZTBaZ3FnS3VZS01rYXdCQzFIdm1TUE1LVk56ZURSOS9HajBuMVh2?=
 =?utf-8?B?WVRYNENWN29odnc2UUs1OVkyamFnQmR6MFlpay91aXRjU3d2QTBoQW1FaUho?=
 =?utf-8?B?VzZCVWJUU3VldHA5SHpnZmRwOEE0aWFNUlkrMUZwanpPZU1xUEpDQlNxdnpT?=
 =?utf-8?B?WmJncjdkU2RwT0NweEV2dUU1VHlIcHZTRzIxRU1xWEhJZFUyd0tIU0ZRNU02?=
 =?utf-8?B?NGc3NUdXaXpVTk9OSkpjUktmenQ5QmJJUHRscDBIL0FtRFhZYzJxTFlQMXdu?=
 =?utf-8?B?eHR5NFFScFkyNWR6VmRnck9nTjVYQ0V3bVlnM3JnSGZhc2c1R2Qrc0pXdTQv?=
 =?utf-8?B?QVVFSlBFTHc4RHlJME9lVWdXb0VXTXREUHNuWGVCZlFEMUdiTWtQWkhWNVZi?=
 =?utf-8?B?VHF2QTYvZGdDZ1huNENqVHgwV0ZmNHd4WTlnUFhjSG0raGFuTnNBV2MvSlVC?=
 =?utf-8?B?UFBIa1dFcXlmMGk4REQxV092US9OckZ0c09PRHhIayt0TGtZQy9IVzc5UDZi?=
 =?utf-8?B?L0E2Z3RKamwxbVVOdytLK3BTR1VxRTBTZUt0NXhxeklHTFRjS2VjYUsrR25t?=
 =?utf-8?B?bTBiQisvK2ZqVjhSYkhTNnJZNkRybzE0RnhjcHkzTEdxbmJ5UGl5Z3BONEh3?=
 =?utf-8?B?OUt2TGxpT3Q1Z0tXZ0ZZQTcwYXBwZzRUdW9teWtEM2VMcXpYTkdzSTViWU9I?=
 =?utf-8?B?d09lQjZZR2FpMXljT0hsamRMYXdWRFNwNnlaUmpvb254STJnVTg1L2g0Q3d6?=
 =?utf-8?B?RE83QzRIMUh5c0tTL3lwR0lJOVVZUEtvaUFPdzQxTjVDVmgyK0QzbXZzSlNT?=
 =?utf-8?B?VXU0a212SVFWb2daNVhWSlB1U0xMTUM4NEY0NjFBRmdDV0hKejhHbjd4MEh3?=
 =?utf-8?B?dDUwVGhuVWsrL2o0bHF5aU5aUkkvaEZIaTRGSGxYeFZBL3F0YzNKdU5RWUd6?=
 =?utf-8?B?YWxia0Q1bm9KcjEvKzlaYUNqU2RxZGx4cmlUb0tGKzNHNUJmY3Ztakh1RGR5?=
 =?utf-8?B?STdNYkNVSXRla0V5VkpTQ2tsVnVHMWZJWjdvZTJMSHBkcEM2Z2YvTDAxTklL?=
 =?utf-8?Q?ltK6RhMKI/A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5962.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L09YMnNQd2xwRGN0dG02NjRrbEhjM0cwQit0WGYzMVlGMTY5U3pDZ0c5OW5R?=
 =?utf-8?B?bFBBMkhlSUw0VDZJTU5kVFdTRTMrbXpYTGV5K2x2MDJtSXMvcW91Wjl0Ymdl?=
 =?utf-8?B?R0hzcHU3Rit0MzEyTm4ycjd6TkRZczRCTXlrdWxSVUNOanZqTDN0aUVPZmU4?=
 =?utf-8?B?dFV2YklTa094OXg3WXpqNXE4VzhQUTVyWXFDdUsxeExrMGtyV3JLdkhuMFBC?=
 =?utf-8?B?SkFCVUxpOUlZb0xpcFpod1NwUVYyR1NtOVZMUWxtNlVrUGFWOGVlckZmc1Nu?=
 =?utf-8?B?REtLcHkveFZQNSttcDh0TWZ2WkRzcWJTWXEzdFR6a1Z0aWg2MHB5MEIydnkx?=
 =?utf-8?B?YUwyT0VFSlNOZ1poeS9uVVd5TWZmQjgycmdObVU4ZVY3dEpFQTNvWVRlMjZ1?=
 =?utf-8?B?T1BIWi9ScnNnSjRTUCt4U2NybzdubnN5dHhPSWtTOEg0ZDBMMXJDN3FYeXho?=
 =?utf-8?B?Y1hCTFBwb0x6L2c5WmJULzVVYjVKbm5JUXJzM3ZVSkd4b2RGV043aUhKclJw?=
 =?utf-8?B?MnR2Y2JTeU9kWm1xWGNGOFJ0OXlWMGloWTdtVVZ3Z0RvMkdNR1l5RzQxMWda?=
 =?utf-8?B?V2ZNaHNPYjRsUk96bjE4UFVwVjJzbnRjaVpZNndBLzZPOEFKVXFuTjh3SG5T?=
 =?utf-8?B?aTAwM2VpWG9qTTBDZC9kcGxFNHU5b1paa3RGY0wwYVpvajFmejYvS0l4VzBS?=
 =?utf-8?B?VWhxdDFPMzdkd2I0WHFrYW44ZEhOaFBmb2UzR1IweE5QRU9ta1NCY2ZJQVhs?=
 =?utf-8?B?aGx1RWtZVEJLQzYvaUd5bGJvd05BdmlqZXdpL2Q3TktaQVlOSFRpU1AxUm1q?=
 =?utf-8?B?cjl6K2dxckt0eEdJZXQ0WEtOdG5oQStCTTNpWi91T2x6STQrR3dpa0RaVmVl?=
 =?utf-8?B?WU56U2hZTGM0U3N1YzkzR1FwTU1PSDlSTGlKU0hmb2tndlVNZWJ3d1RqOXcz?=
 =?utf-8?B?RTMyRGhZaVZqWURGNlA2U3NQV0lwTzVKYUNZV0JZOHd2MjE0SkNHZzh5VXVl?=
 =?utf-8?B?NE1FSnpGRk5WanpQeER5dUFtRThvTG14dENWb0VGMk1hOE8xaS9HQnhRL0tw?=
 =?utf-8?B?bEw5SjE1cnlNcjc4MHlyM3Z3cnJoRTNKSU53ZWQydWlPWE43NkRsRVd6YVVD?=
 =?utf-8?B?eDRIODZqSDdiOSsvNVdLM1RsTEpXd3k2SVlLU2wvNGpCMGtITVFRaWp1UWhY?=
 =?utf-8?B?b0NScExCNVVIdFFlZG54WlpLRGVwQzVKVGJIS25CY1J1MmVXWGtnaHRRdmMz?=
 =?utf-8?B?TGd5enhhWktVT1lrdkxZV05EV1BlYWt0MDdWRlJybjV3MFRWNG9kY0VLK1BZ?=
 =?utf-8?B?SzByV29scHBETE5uNi9GbFhjOTYwL1k2am43RmhiNGw4dVlnbnRRNEh0SlM1?=
 =?utf-8?B?TWtOV3pzWHc5SFZmOU90ZzROeFNPdGNPNUZDanExeTBiNStLMXBuMnVPVE93?=
 =?utf-8?B?c0xMelpyc0FvSEIrUCsrdkpsRlQyNHNsc29GVnk4K1RsYXByK0F0ZlVYaVlw?=
 =?utf-8?B?NnlQVUlYdVBJQ1JWVmFpZGpKZkJZK25UR2pCcTgrRDZlay9sRWNaTGU4NUZY?=
 =?utf-8?B?THVGUmJTdTJkNE1EWDN4RXA4MWV3OEE5SmFGRHBIR3ZudjlLaFZ1UXd6K1Vs?=
 =?utf-8?B?SWpkY0twc2lEU1lYNS8zdVlHV1JpRVFzeG82Mm5hcVc5OTU1dWkxWEJERk9x?=
 =?utf-8?B?eW1VVGZkeHZJM3VmQ1h3bkJVTVVYZkQ2S3JsOUZVQUk4anBjYXp5a3g2UzFm?=
 =?utf-8?B?ZFFxT2lJL2FrRkhiRFhieThEbmlUWTcvVTVDZ2hXaHhqMVowU3pwUHhJMy92?=
 =?utf-8?B?NDNka1hTbWg3VG5qZk5QazliNkpiZlE3Q05RMDhQdVp1bnNOUFhDM2ZaczZz?=
 =?utf-8?B?eFNzR2FIY2sydGhTK0VyM3VHSHlDZmVBb3FMdURFR1pvTnhkLzlwNlRwL1J0?=
 =?utf-8?B?a1R6YUFQYm8rRGp1Zy9JcU9CbTF3RlRLQlZtdnJ3aTMvYTdIQVkzZE9iVnJQ?=
 =?utf-8?B?a2dWa1JMWXc2aGlIbmtNcmYvTnh4bitGdEdDNHhyaHQvL3p6a2cvQU94NGdH?=
 =?utf-8?B?Wi85MEc3SGVNMU4xdHVGdnFySzJwOXVXRFpjR1VmMXpVa3NCYlhaMUNRZmJ1?=
 =?utf-8?Q?W/h+rLIk/hbWMevnTe5V2WL60?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f09f9f4-2567-41af-da41-08dda35a7590
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 11:25:07.4192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gcjsHGpw0H9mDeQU79OrySmVhRiLEA988M0gs8qhXUKluwq3dqdFefMIRD+A7cm6Kg1BGbrYsM7zUUcfrhQUtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7710

Hi,


On 5/30/2025 9:45 PM, Jake Hillion via B4 Relay wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> From: Jake Hillion <jake@hillion.co.uk>
>
> Currently hsmp_send_message uses down_timeout with a 100ms timeout to
> take the semaphore. However __hsmp_send_message, the content of the
> critical section, has a sleep in it. On systems with significantly
> delayed scheduling behaviour this may take over 100ms.
>
> Convert this method to down_interruptible. Leave the error handling the
> same as the documentation currently is not specific about what error is
> returned.
>
> Previous behaviour: a caller who competes with another caller stuck in
> the critical section due to scheduler delays would receive -ETIMEDOUT.


down_timeout() will return -ETIME,  Please replace -ETIMEDOUT with -ETIME.

>
> New behaviour: a caller who competes with another caller stuck in the
> critical section due to scheduler delays will complete successfully.
>
> Signed-off-by: Jake Hillion <jake@hillion.co.uk>


Reviewed-by: Suma Hegde <suma.hegde@amd.com>
Tested-by: Suma Hegde <suma.hegde@amd.com>


> ---
>   drivers/platform/x86/amd/hsmp/hsmp.c | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index f35c639457ac425e79dead2515c0eddea0759323..6c30bb3edc1d77939b10047b771a5c574e5f2a1e 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -216,13 +216,7 @@ int hsmp_send_message(struct hsmp_message *msg)
>                  return -ENODEV;
>          sock = &hsmp_pdev.sock[msg->sock_ind];
>
> -       /*
> -        * The time taken by smu operation to complete is between
> -        * 10us to 1ms. Sometime it may take more time.
> -        * In SMP system timeout of 100 millisecs should
> -        * be enough for the previous thread to finish the operation
> -        */
> -       ret = down_timeout(&sock->hsmp_sem, msecs_to_jiffies(HSMP_MSG_TIMEOUT));
> +       ret = down_interruptible(&sock->hsmp_sem);
>          if (ret < 0)
>                  return ret;
>
>
> --
> 2.47.2

Thanks and Regards,

Suma

>
>
