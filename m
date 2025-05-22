Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053B8C2E0
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747891403; cv=fail; b=RZYvhctr3YsJJHGOeCbk4BNk01JQMbX8yQmzEgpO90tVCfL7e2J7X7D8CSN5rweaAtt2cPrFZVd4yD2HG6b6JvEWar2NIHsC3L6hi0x9IUP4BTi5XrAcXIK8i0LJFq2WMuxOR42cH7MQmumzwM8KUgRo22/fPUtkmRpi6Fh7TX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747891403; c=relaxed/simple;
	bh=LlLI8s9ZrZv1ekemf5ye2whNuX/EXJDztACpA9PrXBQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bmX3eMs2xbNUOOveb29IW4Na6xmFNYjK36SoeSqqBzPASX3sO5rluHVb3N4nasR5Wr2Mg5vc2C8UVBK4G4STkGTg94qZjyG2+ss6cY/E3IAdTFnJok11phdhLiUJHVU5OhxwDdscv1e0gQcdOcyJ9ZqChkc1KVFH8X8tApI8aNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RVMmmLjP; arc=fail smtp.client-ip=40.107.237.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RVMmmLjP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V1sfwWRBrJaixUmrxyKc/+QjsP23qRoU8mQTRkAWN4nZ6hhWcmrvjQCpdSsZE2ZWHiOCiPRPlcBLb+cYe6OWbVt4A2xtQ3vGiZK3JKYMq2aSHNUHDUsG629pic7RtxEesL6Ta6s753E7KDQi0eShaDkmeBPdTSiNCViJ0glLFWbDZpYDdwQrO/usoNfAHGZzPWY2lC6CashXIxcPSjnSVOcTSlg0Kq7LIna9z2zDBiq159bTRs/Mh/AEI7oAElI8uxaikXAlcNvqWUH2IcsxjuYzGjLZhSYNFPUezEg3yiiIvfDVHWhsYqGxDoejBvdDL1Oxl3BKCD7JuqZp4m24Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CORwf+yhil6G3gKECIC4IveDLPNjGNDJdcLKRdSFNqA=;
 b=IWziqMmkmYaDDzMwLT+XmmuyYLk+iSNDUGu6c15RkAmd+0J8QOHX/f7+QyxLBNtpeUJrUgbhZyN2cD2NVqiNr69LX0kLBwY4Tb8gE2P9X+zUKVVcm8lMZvIQknVtqlIOxqS+KpErueNep3ZispL2SzmFqdOpznFHAztbMTAiQgWSM+2h5qCSCgWaat8HnF+EGFUX9bifmu6RsYiH4TGpfDxE6PB2NN/2cAB7AxRgpQ3DQ66w1AVMAGvkwjQyUYnhoeoq/Flu7IgkOSTB9KqiUGAo1jNGhUkwd8bEmKMROCvdaosN4WPnuMj2gHHx1v0x7rckwRDj6T+8nlcshSK16Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CORwf+yhil6G3gKECIC4IveDLPNjGNDJdcLKRdSFNqA=;
 b=RVMmmLjPCiR2uu5cSUPRtI3KQmKMWN68/C8iS1kQmIU07VjU9ZTi8rC9B3UZRhLfdKoZMcK7Q6DZt2IbRqZVr8+6tM0le22F4rzPo5NQivDVfs0bfcBRGpeegk4lSg8RLflL0lTEyPETQTX9bzTauIPTh2DATtUOFcyqf4bwHkM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6434.namprd12.prod.outlook.com (2603:10b6:208:3ae::10)
 by CH2PR12MB4134.namprd12.prod.outlook.com (2603:10b6:610:a7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.28; Thu, 22 May
 2025 05:23:18 +0000
Received: from IA1PR12MB6434.namprd12.prod.outlook.com
 ([fe80::dbf7:e40c:4ae9:8134]) by IA1PR12MB6434.namprd12.prod.outlook.com
 ([fe80::dbf7:e40c:4ae9:8134%3]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 05:23:18 +0000
Message-ID: <cddcb4fa-0958-4a02-8eae-5ef19e0d1160@amd.com>
Date: Thu, 22 May 2025 10:53:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v0 2/2] mm: sched: Batch-migrate misplaced pages
To: Gregory Price <gourry@gourry.net>, Zi Yan <ziy@nvidia.com>
Cc: Donet Tom <donettom@linux.ibm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Jonathan.Cameron@huawei.com, dave.hansen@intel.com,
 hannes@cmpxchg.org, mgorman@techsingularity.net, mingo@redhat.com,
 peterz@infradead.org, raghavendra.kt@amd.com, riel@surriel.com,
 rientjes@google.com, sj@kernel.org, weixugc@google.com, willy@infradead.org,
 ying.huang@linux.alibaba.com, dave@stgolabs.net, nifan.cxl@gmail.com,
 joshua.hahnjy@gmail.com, xuezhengchu@huawei.com, yiannis@zptcorp.com,
 akpm@linux-foundation.org, david@redhat.com
References: <20250521080238.209678-1-bharata@amd.com>
 <20250521080238.209678-3-bharata@amd.com>
 <a6c42783-baf6-4463-a2f5-9a6d3e380865@linux.ibm.com>
 <6795B38D-7858-4ADE-BB3B-71A1950A284D@nvidia.com>
 <aC6Y6-h7lWLcZIwC@gourry-fedora-PF4VCD3F>
Content-Language: en-US
From: Bharata B Rao <bharata@amd.com>
In-Reply-To: <aC6Y6-h7lWLcZIwC@gourry-fedora-PF4VCD3F>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0212.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::11) To IA1PR12MB6434.namprd12.prod.outlook.com
 (2603:10b6:208:3ae::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6434:EE_|CH2PR12MB4134:EE_
X-MS-Office365-Filtering-Correlation-Id: fcf838eb-a6f2-43ae-af96-08dd98f0c272
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N2s0VnMrQVI0VDJOVnZLUHV5clh1V2tUNUp0ZFRUeDVpUnpGV28zOTl2S2tu?=
 =?utf-8?B?VkpYWmtTVHB2bHRHZ3Z3SXZ5ZHoyclFvKzRxeGoxWnpjdVltbitSV3BIQ3JH?=
 =?utf-8?B?R3RMMW5BandnaVlud3YwSTVmRExzcTgweTFFNmtjRGxiYVNsVXhEdUdlazdP?=
 =?utf-8?B?VDlEcGdiN0tmNGF2b3ZpUFREUEFSZ2pWN2lpZGRLYnJjcWZEYXRIUXZ0K25t?=
 =?utf-8?B?T0hHVW41TkZHMC90OU1QSHk4MzJ1MVJWa1pYUWlaZmJkb1VwTSticURnWVBI?=
 =?utf-8?B?amRrcGR2ZzlFUUxOaTdNRFlpYWlDREtRZDhxWmlMTXpGQjRTWUdqcEpIbXd3?=
 =?utf-8?B?NUk0Z0M1eTRodWNyeUNFMW8yMlJwbEtTTXBZcWZETG5ZVFBHb2NhcWlKSDNS?=
 =?utf-8?B?Q2dnZHo0VWNDR2hkQ3l6VnFTZEdZSjJXNUR0b0ZXYS9WM1RuNEh3d0U5S2Fp?=
 =?utf-8?B?b045c0pYNms3akJsL3d5Z2tKZXphNnVBYjZzaXZSZjRVcFA1bmZFVGphRThE?=
 =?utf-8?B?U1ZSb1pvc1hQa2p2WUtUc2hwcTJOYzdjVE1lK3dLdWwzVWk4N1dpZndEVzlC?=
 =?utf-8?B?RmRZNHhUSWg0clgydzNkcHA3TVpIZmo0WHlHelFXRTJ0RWU2THoraXhjN212?=
 =?utf-8?B?SFU3N0tyQ2xlZXJWSnZNdHNST0xPdzdPa21JbHpqRm1rMU1XUnk2RFRrNWR0?=
 =?utf-8?B?KzFMT1VRdzBKMHZLOWdGQlZwVEpRVzRwaHZNR2dWSWRxVVpaSWtRWU56WlBj?=
 =?utf-8?B?a0FhZlBNS2NrUFlEWVlmKzZYZlU2VXNhcUZlMFBjK2xIQlYybW5rWkZnNkk4?=
 =?utf-8?B?WUxmZ0x1S1VpNUNVb3A1S3o4S2dLVmo3NXcxbzRQVkw5R0czcTdDTzdHSDZs?=
 =?utf-8?B?TG1ZMXFYRmRSV3o4LzU0R0pBNzhkVTVPRnBsdXZvcllpejRjT1JhbXg4aW5k?=
 =?utf-8?B?bGJaY0NqYlk3T2dKVGlubFRRcXJkdS9WWEpxMVN2RE5FdFE4MEloeko1Zk1n?=
 =?utf-8?B?MG02R1ZGd1VLNWpvdVBTWHhKcGV5S2k5TktwdUgrVDFyQ2x5MS9McW4rek0x?=
 =?utf-8?B?dmhvdVEwSVd5NWE0a0ZiNlkyc1h6WnRoOFVSdWRTS1l6NU9qeC9aUkVpSXVv?=
 =?utf-8?B?VndJN2x6KzdRVmh4bWwwcytQeWpvQ0QvSTBlb1ZZNkdaNnB1WUgvU05uK3Y2?=
 =?utf-8?B?VkhDai9ZcXRhdk1KakcxVFpYaU9MbVpYS25YYlZZbUs1dXN2Zk84aE1XTDBF?=
 =?utf-8?B?Nk9kcHAyNjVLUmk5TjZXNzlWUFFoVXM3SGZieVJ4MVc2OEE2Uzl4OXhMRkw3?=
 =?utf-8?B?UzkvL1k2SVZ2eTRRMFdPUnN3V0tjMklYclZuNGxhK1F0S0xkZjRvRzFtbmtR?=
 =?utf-8?B?bEhObGdhZ0tPRW9ZSFJCcXlmQnFlcTBlaVJPMXFVc3g5VlFSMno4ZGRNckU4?=
 =?utf-8?B?WjJBOW1UcS9hOGNCMVdFOHpCS2ZibkpJTVJ1T2FlbEZXMWxlWVRnNnVnd3hu?=
 =?utf-8?B?Zk56cmRQMlhFTUpvS1lnaldvREdycENuOVZuTXY0cWtBbGRHZWsrN1VDdFBn?=
 =?utf-8?B?b1AyMGZKNUtlSml3UWpqVDJ3REJ0QXBRQzZ5SkI2di9uM3cvb0x0dzVLVDBl?=
 =?utf-8?B?TmVPejVzZ2xvL01kOFQ0T3B0QTB6TzRNdHI0T1JqUVQ2dHJLTGRNWDY0Tmwv?=
 =?utf-8?B?N1dLU3JERmg3Uklsdm9MRzgxcnZzMkZBa3F5QUl6RTZ1bmsxVEZ0REhYRmFH?=
 =?utf-8?B?cGtiWjJ5TDdNQ2dkQ0VCUzczaWk5MGhlYUZPUTV0Sm9JTWw3Nzk4R1FFL0hH?=
 =?utf-8?B?NGU1Z1h0aVN3VG5Vb0UxaFZRWW52WlhjNnVHNEJOUzR3RUg2d3hXOWUrYURi?=
 =?utf-8?B?REVneVM1cmhuS05lQkVRN1QzNUN1UG9DdW9KMjh1cGZodnZTSjRjdDc0L053?=
 =?utf-8?Q?TdORB6V5Pn4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6434.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVZ2QUc5NnFiZmJwOWtGZjA4NkY5aWZUYXRpSFdhdDQ5cktqaGFSWXpLL3Ez?=
 =?utf-8?B?MWpOOStzMHZ0T1RZaGRFUUpPbWQ2dEJnOTRWV2V1eHNGdFVIZ1VBODhWcTFy?=
 =?utf-8?B?YjJ0a0hWUkhONHcvNTR3Vzd1OXRUazljZjFzb2tybUF0bS9hWHBEVm1lSExz?=
 =?utf-8?B?bWVYVVRBVjBEeWVTS0pHRlVXb3d3YmZ1dnp2OUE2bFJ3Y1hTZ1FBYlhVeGR1?=
 =?utf-8?B?TkhTdG43WmIxcmF1VmlHdHVlcFBpSnVnYXlPUFVWeXpMM2pRcVI3MFBQU0ZM?=
 =?utf-8?B?UTd3dEp6MnM3WjFsekVyUENjRXRHVkxUeHF1NDdDcnh6WUhFMCsrMVdPZkw3?=
 =?utf-8?B?ekF2VGhZWmIvdFIrS0VobDhnaEJvRVRubEpOV0Q4REczdVM3RUg5L2R3MWtG?=
 =?utf-8?B?V3pTdi9rdmUyem5yaEI0bTdRZEFqOFVBaHhQZnNJNjBmcThvMU9HcG9FM0Q5?=
 =?utf-8?B?S2FrZXVmdW85UWltRkpaVVVrVUprdlJscHZEOEdHSDFIVzBRcUNIeENKYVRQ?=
 =?utf-8?B?L1Q1eWp4bkhiSm5LQ0ZlRUFDR0cxcjB0TDBmYmJiMDVQZXZmdUdWQzFQRnpP?=
 =?utf-8?B?WFlJaDU5NG1yNUk4b2dqZlB6RldTQjhHcUNlTllvQzhVL2hiZWJvbC92WEdN?=
 =?utf-8?B?Qm42KzJEbENmSU80YTQvNXhnYm1vU0E3b1dQRVBYSWptTnFkZnJEd3Jwemxt?=
 =?utf-8?B?emZTU09QQjFpb1FwSmdYNDJiWW9VZEZDTjBHQSt1QkxmaDlVbGs2WWdvNUJH?=
 =?utf-8?B?NHMxbG8vU21PVU01RmNQMFRyNmdMZjRFd2RqQUQveEludlM0L2o5VmszV1BK?=
 =?utf-8?B?ZWxIYWkyc1B3L0Fhb2EybHdOanczWitLZmR1VGhzMXBLcGloVk05YVl2Q1I2?=
 =?utf-8?B?M052aENiclFaOEljQ2pOS200UGxkdmw3dGx6T2xLR3pMcTNkdWt3MDRuQW0z?=
 =?utf-8?B?eVlFRC92d01jZDJUS29zWnF2T2VsVVlhNTVjRHRqdkNUVnliZUhOWUZIbHhJ?=
 =?utf-8?B?Q2ViLzJUbXcvM3pmKzNlVkhBbFhYMlN1dzNneUs5QVh5OUpuTS9LRWFoZHFk?=
 =?utf-8?B?dldJeUQ0TWpjTkh4UnVyMHV2ZGFQSGQwYkdaS3FzKy8rTlUwMUlmSW5uRGY5?=
 =?utf-8?B?ckFaS3czSjVwMkE2MkhpNWR1bEFoRXJQWGdrWDdCbW1lTngxdTBvVXp0aGVy?=
 =?utf-8?B?SFhBVEpheW15Wm0zOCt4SlBqUnpsT2hpS3ZLYlZTSkFRYnhhcGFIb1IyMWFT?=
 =?utf-8?B?cCs4SDNvWlM0RHF1LzNMWEJLM0pQN2lmSjNTRXlkbHRtbnFOcmM2dVNmMzZ6?=
 =?utf-8?B?K29QMWZMWG5sV0JwMndZT3NGa2hMRDlIR3NvYU83dmNGRkNnWmJBN1ZwS1lH?=
 =?utf-8?B?V3ZMblNqZkVkTjlMM3pkZUVnRno5aEcrQmtreUttKzUzQkd4VlAxZ2thZU5N?=
 =?utf-8?B?Qmx4SlErZ2kzMlJsaUt3dXEyQWVwQi8xaUxzSnFwMzdwMHYwZWJJMmZKc1N4?=
 =?utf-8?B?WXdxWEltY1RXdCt5WWdXUzRwMDVOZWZBSlFiT0VxVG5zQXRQbW9iSDRtcTNr?=
 =?utf-8?B?QjRpbWVyN2d0WjdFWXZJOXYzS2JpbXZyNEdQVUJTLzgyOTk4b1A5ejF0QU9t?=
 =?utf-8?B?R1dpNGp1a25vdWlpTXhIcThrSnVXNmQweTN0NVVHdkY4Vmh1cmFVMjlURWs1?=
 =?utf-8?B?MGt6Uk0wOG1GTXA0bzNYNmJIS2lYbE1GZGZnN3l6alYxMmlISGxjVVBVcmZX?=
 =?utf-8?B?b1FtWFBta09PNWEvaVZLdVByL0Y5aVJWclJmNDN4UFVmS2kwdUlkU200RkNm?=
 =?utf-8?B?MDJwdWdhVXFFd3RTTnNrMjh4NFh5ZEVoSGlhVjA5Zm8zNW9WdHBraVJOSVhI?=
 =?utf-8?B?emFJWmNDRGRXWHpDZVdDNnpxUmx0aVNrNFM3ZDBTUDZFdU9Nb3hWUzkrZU1X?=
 =?utf-8?B?U0pNOXcvV2QxK1Nhd2FFMWUvVHAwdUU4UkdJdGJyWUxTS1ZPdCtxcFUxbzVl?=
 =?utf-8?B?OFg0U3N0bXdmeDRtYjJsU3libTFzaStIZ1BTOFg2eFpFdlh1c2liRGpLbXVw?=
 =?utf-8?B?RWY5VmlZQXl3bkZQNE1Bemh5M0VYbElyaGJyaTYxbm9IVEt0SmwrZUlSckFF?=
 =?utf-8?Q?lRwUC1ErxZ3lCypa+w83iuAHq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcf838eb-a6f2-43ae-af96-08dd98f0c272
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6434.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 05:23:18.6096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RYxTuu56jOliz/+j5Exl4uainvKBYFnGHVvqoWiQRhcGESFD5tC+pJLhxj/sKd8rU4b14gk72mOI/ziNJ9Hmdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4134

On 22-May-25 8:54 AM, Gregory Price wrote:
> 
> The really annoying part of all of this is
> 
> #ifdef CONFIG_NUMA_BALANCING
> #ifdef LAST_CPUPID_NOT_IN_PAGE_FLAGS
> static inline int folio_last_cpupid(struct folio *folio)
> {
>          return folio->_last_cpupid;
> }
> #else
> static inline int folio_last_cpupid(struct folio *folio)
> {
>          return (folio->flags >> LAST_CPUPID_PGSHIFT) & LAST_CPUPID_MASK;
> }
> #endif
> #else /* !CONFIG_NUMA_BALANCING */
> static inline int folio_last_cpupid(struct folio *folio)
> {
>          return folio_nid(folio); /* XXX */
> }
> ...
> #endif
> 
> Obviously we don't have to care about the !NUMAB case, but what a silly
> muxing we have going on here (I get it, space is tight - the interfaces
> are just confusing is all).

I really didn't realize the usage in !NUMAB case, thanks.

> 
> My question is whether there's some kind of race condition here if the
> mode changes between isolate and fetch.  Can we "fetch a node id" and
> end up with a cpupid because someone toggled the between tiering and
> balancing?

Good question. I need to check all such cases where inadvertent reset or 
reuse/repurposing of last_cpupid field of an isolated folio becomes 
possible.

> 
> If we can answer that, then implementing folio_last_cpupid and
> folio_last_access_nid can return -1 if called in the wrong mode
> (assuming this check isn't too expensive).  That would be a nice cleanup
> for readability sake.

Right.

Regards,
Bharata.
