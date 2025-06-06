Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2069.outbound.protection.outlook.com [40.107.95.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDB41DFCB
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 18:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749234104; cv=fail; b=sWnTn3i//XHrBKOtrP+W+G3mPB1t+FkiJswWARg1kn0op59zN+r9f4ySCx35V0VYLB4Bq+39C0bfmNxHsPsPKC5TxkDhz2jJJCi0GflLwbSxu1DjEJbHT16IOpkJ8KZsLBgVBR/1wLPLrY6MD13zvyAxVfDI6N5nvA7DriRXdgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749234104; c=relaxed/simple;
	bh=lcMHYKhYXWu/vzSj57B6sqLPFaeSHskhktPOPQRAcVE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ulJ8BsoTUrGaIEcfJVK4BiqadXcV7TobPU5VRzxA8hNUajr+hH6cSb8tkQqFcH1FMIjCiyXDTlsO2DHjflFpNQFzA4kydE5tE7Tez+2tETbpna9ONvz/D3bOoTbjc2eS3iG4HEr0UxFOy4CPrpwKz10AbebKY+lgXiKQFq+cyzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZPSTvNsl; arc=fail smtp.client-ip=40.107.95.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZPSTvNsl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGJyy/piO2FkXo4r5KQK3gERx7ipW44c+1Fm+62ruSH4pJcA42QjjTYeEdCQjo3ZHoM3Rkp8EblJZnJRD9XQuzdW0ce5U2e5nKFnGbwL4JHFR9vRxD5+KHYoZbwl67c7TVaBrj+W0EFxC2IvQmeWJ/kfKtdlV6+ch16YuxnbzDoHE9KkMCTzuIbtgJaGagNb+GxirEzuuik3u/x5prYy9TM7u6O6cOb2JLjIOvqpfO2ixe2soQUs9dPHVupSEu1LPVSHIw5meTI4P/2AfhTSmSKnsX8q+aw8nWWF4zh55Y3Wfp2qCBhUL30M6RHXjsPFqZbKgJi/uJcTFtr20bPFwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AEL16ELCWXBjkHkzn48i/Chb/D4lQa2N+DK5B4qXDvU=;
 b=THtbYKlFbsukCNPCJdcW50nf5zOqE+emrkxM322CGq1HjdrPKWaEwCgXYRBUGiVC+6bracyy6z/6CSTYKC5c4EHmqLmvlacoosuuUpuV5k9Bu8rVNiXqnjuV1NqD/HUm4lYk5mJyK51kYP3HBT/zBjRpE5v8wU+vxBQm6D4zev81rKrdk3x8JynRMcC7SLQk+dhQWiaJ+zNg+cS+PeYocP+LWR0irONb2tZcx9H8gaekYQwhMPvXdZKe8vZdF3LDCrql74gEtfiKficb8hUxSsJp+R+Qp19YAUdBYMGss0HB8o7c04j8szrSQLVC3c1kIGL4wxFT6l2FK6gAR22qJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEL16ELCWXBjkHkzn48i/Chb/D4lQa2N+DK5B4qXDvU=;
 b=ZPSTvNslp1qJDBpFn6/5JJOWIk89NS+XuTjNZuMEn3sMQF0KSB0TjL8hIs14A8X2wnN4VXlD/E4saeRcCwSGYTHHnr3BcdLKhuUyZQ9KWCUWIjBx+oA/faxr5/aZssjRahEc662t838rY/K7bOKDzat6E1Vcg4Eq3ru6JntaTqKRQ9W2K3WNBZG3JEWiPWUpfBaYVUXBRuhltOJeEC+nsBoF6aTDTRAxyzX8IlxCMNJxsaT0Z2BEp4Wgunj1PyDDMbg/MrevwsjVnJ7SVjYjxyCPe1GAtB2sdGju6eaj86sWNDsy4pjFASS7QWdooxQ8yfPAfxCFfcPwoRFuxBpvmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by DM4PR12MB7645.namprd12.prod.outlook.com (2603:10b6:8:107::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.38; Fri, 6 Jun
 2025 18:21:37 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%4]) with mapi id 15.20.8769.037; Fri, 6 Jun 2025
 18:21:37 +0000
Message-ID: <3dfbbd63-697d-42aa-8906-539d74df9123@nvidia.com>
Date: Fri, 6 Jun 2025 11:21:34 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
To: David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Michal Hocko <mhocko@suse.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Peter Xu <peterx@redhat.com>
References: <20250604140544.688711-1-david@redhat.com>
 <aEFC_12om2UHFGbu@tiehlicka>
 <1a65d0e6-6088-4a15-9c19-537203fe655c@redhat.com>
 <aEKnSxHG8_BGj7zQ@tiehlicka>
 <e680a8f3-7b45-4836-8da7-7e7a0d2fcd56@redhat.com>
 <aEK_R93gihEn-xW6@tiehlicka>
 <50ff9149-2824-4e57-8d74-d8d0c063c87e@lucifer.local>
 <e5fa4a36-2af8-48e9-811e-680881c06b86@redhat.com>
 <1a7513cf-4a0a-4e58-b20d-31c1370b760f@lucifer.local>
 <e898e52e-a223-4567-9514-b4a021b5d460@nvidia.com>
 <72bb36f2-65b6-4785-af9d-5b1f8126fc78@lucifer.local>
 <2f866f12-2aa0-4456-b215-08ddc9b13b1e@redhat.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <2f866f12-2aa0-4456-b215-08ddc9b13b1e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::30) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|DM4PR12MB7645:EE_
X-MS-Office365-Filtering-Correlation-Id: b6c2eb77-f47d-4ff7-cb41-08dda526f988
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M1c2aE82T2Fma0hoWUprcXNJd1NST0g2SWNDV1BXc1FGNHQ4bXZUVlpCdFBy?=
 =?utf-8?B?WjA4UTExK1JjaTAra2hhcmo4b1NyazlMNEZuc2d0bEZldTVYa0N6R2ZVRHNE?=
 =?utf-8?B?U2JEZ0ZwWmdtM2dLZmJWSE92Ukk1TXJ1dHh1RmxBRHpLUWQzamluOU9ST3Nw?=
 =?utf-8?B?TFl3WFA4bkZKTWUrRW5Fc2puRERpTnM3S3VFQnRJbFZ3OFZxT3k5NnhadHpN?=
 =?utf-8?B?d29LUXhYRWljWjVEWmhaM01CcmNraXJGdHBUSWJYR3VlMk9TZkRkY3EwR3hS?=
 =?utf-8?B?aWlMNkpiZVNMdUZVR3NOQmVIOTZENlovbXFwa3J1KzByTjJUZXljMGY4dG1w?=
 =?utf-8?B?emF5SXRZWlIxOHNFRE5kNG8rZjRLMFdvakduM0RUNEZkNzEra3ZmbWk0NFRw?=
 =?utf-8?B?QzZXRlZKU3oyMkJrNk5WVDBDWlBIWGh3eGRwaW1SdWNCN2xxWmFSMXJXNk14?=
 =?utf-8?B?dUFDSUlJSEdJUFdZZ3VoejVpNUlOaHJKZk45VVI1cmQ3RWJDdXRhbDcyOXZP?=
 =?utf-8?B?M2NRSXpWOWJXalgwaFBsbUQvVDlXYmxoYXRIMU5pK0ZBTnhUVTZZWTRVamt6?=
 =?utf-8?B?TlhwSE5RYUFZYU1mNTA1OFpLeU5INmpLNjFoOVdraDI1TStST1FOYWJRWG5L?=
 =?utf-8?B?cHhmbHZGdllIYW5hVUl5d2VxNUFBOU10MEdqbjg5bWNzRkVralA0a0p1b2Fp?=
 =?utf-8?B?U05hWVAvVFVUNVZDUjQrUFV1dkxrWjEwbnczNkdKcUhSb0NmWjJBamUrNi9N?=
 =?utf-8?B?VFZkWUJxVUJ0NFFQV1p2bm1RMExJN2lkOW1SZUlkR3lnTVlnQ01zcFdWbE4v?=
 =?utf-8?B?YXJXOGMxVEhETWhISkgxS3E2UC9xK2ZkRnVDKyswcTladCsrendzd1Y5b3k0?=
 =?utf-8?B?dE1DaEd0ajZWc3VtYXJVdk9oS2dwRVhpZGVNc2JoNVpSK2RkZ0c3TmU5eWlK?=
 =?utf-8?B?bkQrMTRCWkpDT3U2MnNDZTVHZkRJczZQa3pCdGtZTFM2MWc0RzVzSUxZU1NB?=
 =?utf-8?B?L0dhTUIxV08ybnpiOWtIVlZkQjVVUFN6VStqVjJEWHRXTFpXTC9DV29xSkxY?=
 =?utf-8?B?UUVxTWVnK2ZIMm9zbFR6VUtSVHdnUjVYeU5zcy92YTdkQXNJQ0JKeW1Takhq?=
 =?utf-8?B?Y0Ftd2RTbk9PbzBrSCtTRVR3NzZtYjNZT3EvS0hyUHJsZDRMZTc3MW95Q3d6?=
 =?utf-8?B?RWozdTc1cG12ZXo0RVVJNzd0eGFqMENSZlU5RkEzQVhVRTBRaUNNV051VDRD?=
 =?utf-8?B?MTdCR29vQjRtczErclBPRFJQSDhLd1dJWHc4YURJVlR6ajlCSFNGN253Mmpw?=
 =?utf-8?B?T3ZKWm5na25wNG45TmV4TG9BdDJCak5zb2lPVDZaQmIrUm5zVU1RMGZiam55?=
 =?utf-8?B?ekVNQjloWUV6UEVndUlOTndMRHkxZXpSMUJVL0E2ZHIvNW5Vb0x2bEFPV25k?=
 =?utf-8?B?VHpIWjNWVElWZUpmeHZ3S0duZmQvVVNoZys1KzlwbjBWZ1QwMkp0MURkZWZ6?=
 =?utf-8?B?c1FOaU0wcjZwemx6SzBKbkh0ekRqRGdFcEZSd1QzQzZtZlR5eXI5clZKbjc2?=
 =?utf-8?B?SDErUS9FOWkxSHVEVWdDRjZwWERmQXNpUm83R0RDeUVvaCs3ZjdZeXdFSVht?=
 =?utf-8?B?RGlwWXZtVmtQS3FDaklPNUFKVTFFV1BRaVdCd29Sa0dDUWIwZVRBNURFMWda?=
 =?utf-8?B?amEvaWlOcUxCU0pHZURHc2dEOTJNWldnZ1ZQYlZHSE9UblR6UTFjWFFIbXAy?=
 =?utf-8?B?dEt6YWJxOWZqTkhYQ1hHajZIZ2l4bDlQaVhJbjVHeWFsWklEcG54S1Fybjds?=
 =?utf-8?B?bS9TV21meWV0U2hBaVFiNFpSd2kzTHpMM1dWYWtEVVo1NyszZmQ2cXpKcmdY?=
 =?utf-8?B?WXFRSExHYlFCWmJqaWNFYlVZM0U2NDRCTWxkSzNFc0NpUlVFbDZzSFpuMng2?=
 =?utf-8?Q?s0lpsbqPfaU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5968.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEQ2VnpLOFpGWTUxQk5ZeTU3ZE9qeXl2TkZER01LMy85SHRzUVNEZEo2aUFh?=
 =?utf-8?B?N0lCcnRVaUN0RkVsRnpoNEZlOEF1a2hYaisvUzZUNjJVQ0pZYzB3TkNxSGt5?=
 =?utf-8?B?UWNvS2ZmUmlKR0pxRGVkWE9GNkloT085WnNOaU1kWWpscmJld0orUUdvVE5H?=
 =?utf-8?B?R0RUa0kvRG9nOEdhN0lRZVVsai9xYWN6cC9pYktFMlJ6amtEVGpqNUlleXNq?=
 =?utf-8?B?Z1U0bHFGUUtLeUpRU1p0MmlGOFZPWlJXOGEzdFFRWHZZSk9kR2NuajZPRWNs?=
 =?utf-8?B?RCtqZ0VMaTB4cFNta3JLNTN3eHdMRVIvQmJkSXljakFGeHc5ZHBvWmFhTG1W?=
 =?utf-8?B?SXNCMC9payt1VXZicWJUNmZqWEdOZ0hCbk1ybGFrenlwUHYybEhiVDJzdXBk?=
 =?utf-8?B?bUZ0Um80b2pDZmhOOTZZc3FiRUdVWXJ0aXdLWFdRK0lQR2o4YUUyd0x4T0F1?=
 =?utf-8?B?T3NweHNPQmxkNUh3SFNPTG1lZmxFbXpxbVJ0R0VUdXQ1SXE2MlpRUzZpelFu?=
 =?utf-8?B?NkwxODVDK1ZPVWlidk9zMEZtODlvNUt2dHVNNTQ1SVM4VkxjUDVuL0dEakM3?=
 =?utf-8?B?Y2dkTGU2MEpMM1luYkZDNXYvcktrTU1NSmZSYUhLYXErUGczT3BiK1NRbkF0?=
 =?utf-8?B?N3hsSWRCYVorZmFDVjgxdll1QzdValBiSlZ6ZUZEUFFwK1FBZEJqQUh4ZzI3?=
 =?utf-8?B?Q2lnTURtRTdGaW4xbEQ1cm9TTWVQYkhOOHZUeVEyV282MVhNcFdQckRRaEsw?=
 =?utf-8?B?R0JNVm00QnRNUFhxZFZmc2E4SkhTOE93ZjdoNUEwTG0vb3R3SVE1NzlpNllz?=
 =?utf-8?B?QlRUT0hCU3MrQnV4WVQzQ1pwcjlZK3JQV0FKbUdWUHEyeUkzK3hXZzRmbzMw?=
 =?utf-8?B?RjBVc3lDWWtBNU9aOGhWS21vMXZaMEFWcWxLdmoyQjFCWTJCOVRXMXRvdzF2?=
 =?utf-8?B?U3ZjdmRiRWh5cHltVklKOWtxUjhlcmdBMU9ZbHhqVzBCTzdmbUNHWXBrNlRv?=
 =?utf-8?B?T1h3aUM2NU1xUlErcmJSZHk4YTNZSmttSFEwblFZcUpvZHlOWDRsc1VzRHZX?=
 =?utf-8?B?VDViUkJaNHlSbG1CV3poajEzSnE2d1I3WExVVnBtektxVUdVTjlRNXEweVRx?=
 =?utf-8?B?WFNOK1pxczhBRUIyUDlZTHZoRks4ZHR4Mnk5Tzg0d08wb3JKZFlDRjR1aFgr?=
 =?utf-8?B?dW5xY3pyS2krN1FZaW82STIwUmYxdWo5cnRJVndXT25YK1R6ZkNMOXhVVzE0?=
 =?utf-8?B?R2d3b3Uvd2l6VGUwSGZLVGhwdFM5TzFaVHQ0RWJYc0NQc2s1NWplMDhydjdt?=
 =?utf-8?B?eWRHSmIvMlR1UWVmY2RkWXRNV0xTY3czdkwzTVFYYzB1OVdQVXo0bEVvaGNj?=
 =?utf-8?B?azNpQndwK2VyL1lON0lKZitBTUIyeDh2dFcyMjdIY1V6dExJMlVTOXkxbFFK?=
 =?utf-8?B?R3FaTE1QWXJ4VlhEU1lrMVZRdWM2a24vc05YQzBNeDFYMS9tZXhSb0doTUtm?=
 =?utf-8?B?YUsyOUFCUzRSSG5VeWNpYmZVaktDSUNRbzF3YTFyeFMzTGZEbitsZlF0RnpQ?=
 =?utf-8?B?NUJjd1hOWHBBMm41dCtGYlk1YkxCYkhiU1YzS1dicW5LVzlVQ214K3YxZXF6?=
 =?utf-8?B?R1MxSkhJZkhBRGxqSk4wUWs1cUVZN2xlVkM5eUZmelRyeXV4THJIbmVIY3Nw?=
 =?utf-8?B?TVNJS3F5UXBPaHpFWndJdGVkdkpWNVpyMUZia0JCL3BWRnB0QU1TSjZ5bm9o?=
 =?utf-8?B?UWNXdVFmZ2JDY3FubWtTWmJ1YWxwQ3FvamlocE1WSzVVa0RpRHVQZFBpQ2Qr?=
 =?utf-8?B?Qkh2WnhtRUxnZzVTSU9XWUpsSnpwWkFMU3VybnBiMGpRejJMUTFiNGJ4L3Ba?=
 =?utf-8?B?VkVWWUxZRVI5WVhwdURRWjFEaHBsTlRDMXJGNXhwdU9GMUtIMDkyc0VTSFRM?=
 =?utf-8?B?SnNhQ0RQdjVqbkZjd2d4YnR1Qkd1b2d3bTB4dUxodDRnVVVoMnc2ZW9EMzJQ?=
 =?utf-8?B?QVd0RnVqcEgyU0sxejY5eUhXZklRNTBPS2ZucnM5VTU1U2pwckVYZkYzNC82?=
 =?utf-8?B?eUlmamhuQVEzQy9LaE1QS1BTcm9uZ0QrOFpnMmhBZkw5SnVUU2pCcXRHc1NF?=
 =?utf-8?Q?CBI6h+eWIUhg3cSKfOS0lS1N+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6c2eb77-f47d-4ff7-cb41-08dda526f988
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 18:21:37.1917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /iVL41+XGxIkbLdNw7T3arXP/tZNZVQNamCzcYfST56wVYAjg3h7TNuobrEK01jbMVUwJ+8LBC+1QmaaeWqEIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7645



On 6/6/25 11:15 AM, David Hildenbrand wrote:
> On 06.06.25 20:06, Lorenzo Stoakes wrote:
>> On Fri, Jun 06, 2025 at 10:57:44AM -0700, John Hubbard wrote:
>>> On 6/6/25 4:04 AM, Lorenzo Stoakes wrote:
>>>> On Fri, Jun 06, 2025 at 12:28:28PM +0200, David Hildenbrand wrote:
>>>>> On 06.06.25 12:19, Lorenzo Stoakes wrote:
>>>>>> On Fri, Jun 06, 2025 at 12:13:27PM +0200, Michal Hocko wrote:
>>>>>>> On Fri 06-06-25 11:01:18, David Hildenbrand wrote:
>>>>>>>> On 06.06.25 10:31, Michal Hocko wrote:
>>>>>>> [...]
>>>> So to me the only assessment needed is 'do we want to warn on this or not?'.
>>>>
>>>> And as you say, really WARN_ON_ONCE() seems appropriate, because nearly always
>>>> we will get flooded with useless information.
>>>>
>>>
>>> As yet another victim of such WARN_ON() floods at times, I've followed
>>> this thread with great interest. And after reflecting on it a bit, I believe
>>> that, surprisingly enough, WARN_ON() is a better replacement for VM_BUG_ON()
>>> than WARN_ON_ONCE(), because:
>>
>> Right, these shouldn't be happening _at all_.
>  > > I'm easy on this point, I'd say in that case VM_WARN_ON() is the most
>> _conservative_ approach, since these are things that must not happen, and
>> so it's not unreasonable to fail to repress repetitions of the 'impossible'
>> :)
>>
>> But I get the general point about ...WARN_ON_ONCE() avoiding floods.
>>
>> David, what do you think?
> 
> Well, in this patch here I deliberately want _ONCE for the unpin sanity 
> checks. Because if they start happening (IOW, now after 5 years observed 
> for the first time?) I *absolutely don't* want to get flooded and 
> *really* figure out what is going on by seeing what else failed.
> 
> And crashing on VM_BUG_ON() and not observing anything else was also not 
> particularly helpful :)
> 
> Because ... they shouldn't be happening ...
> 
> (well, it goes back to my initial point about requiring individual 
> decisions etc ...)
> 
> Not sure what's best now in the general case, in the end I don't care 
> that much.
> 
> Roll a dice? ;)

One last data point: I've often logged onto systems that were running
long enough that the dmesg had long since rolled over. And this makes
the WARN_ON_ONCE() items disappear.



> 

thanks,
-- 
John Hubbard

