Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2051.outbound.protection.outlook.com [40.107.93.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F692DCF69
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 23:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751585794; cv=fail; b=W/Ffm86+SpF6YR3hupk5kHskPos51+CoZfZGThfbfwK9qOacKodvEpUDJpyIS1f85KfZUPT6fkRzEwBKk3lIfj9hiRZixbKuacgNZ1rHjP0m5tCIOykPewlXVUsWoXdSnPUBcH/MnYz125NlXCytSWqa8mOKlfyTUyhttVDFxZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751585794; c=relaxed/simple;
	bh=Zff3kkEZ4qVcdXw8tnZCNJPfavxWJcOqv+Wu0ghby84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iDyFQgzUUY/D7TvbDSASr2+ZgMxONOFpgmoERVkG8yHQuXccwTWCmbDZ4ichUE5Cq5LfVCm7LPT31dmw1ifOmqKDt4w2XRM0YoIspZ4mAYs5juUuT9vGo59MpBHONA3E3zxds+SFxAkUrucZqDPADeb/7ABiYpYag0G4bVlagtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lHtbM5LV; arc=fail smtp.client-ip=40.107.93.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lHtbM5LV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U8cD92XQnCr+Br78byyeGTkxEwib2vApNx/MTeDO4pAyF8dADnInoNawC+UFHkMamvx2NkquZcb9qDQDyy3M50ZzbABRMeMOxXqx0/PJOBuafapMeryyk6u8+JO3/jRPOXMmZnKu79OcoMS2mVqKWC150ussX2wLTRg/T6Vm73S/eLQsw0Qrlm7bresSmBed4zxvhhdEMEWsXY9GGt2VLZsT96Y05Ypha56+sEUc8i/sBw8g7w5QMDU0xrmGFaJpZ4rG9IMO0iTr984lCBeuL02UuiP5dQifZGPlxOZsgF/4uI2ol8i62SNFcVj4ODIy6KedWAXl+fy2YZUOYE/rLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/IXBhVG8erWRmvh0aPjyUnqKu6SKDHKoqSAIx0ysWJQ=;
 b=WUXK6V6mIxVbZ5YGn5RKVj2LsWvDjcSv5/YY8OeRa6nX4XsNrxmmB+ue96TKnfOWJIVeodrXVCgUOJ5PIOwNTGqrV/mZBzkDIl9qekmcYd1rf/Zjlly+gke5DFCS7mBGY0aGThUSB2RtNdZ2QJBeNxMVXLhbn28e/Zpjax95d01sO/7B5nj1KCE6U2S3Z0MYEGzJ5biisfbdgavPEgHS63xWeiM2ik+sXZtt6NSojygq1MSfknsUNT3S4mHKwcD2trKCGHHx9JPPvWKOfDSaBqwZBc/VUjyAkL7xjX6VwaE7UEqGNEfAnymUZbowHnuDwbvEljpAKBraDPvV7rqtsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/IXBhVG8erWRmvh0aPjyUnqKu6SKDHKoqSAIx0ysWJQ=;
 b=lHtbM5LVify3ub4lp+tJi6oCf5Y0RzC0i7QORSiYs747Cy272n6kQQijjaix9Xg9Gl2ahIJT4RcdKdYtlwcUCPKu0T/BvamOEPBHbcZJGubwpwGkpZDzf+KP9pWVUMiu9rhV5HFqO28XrVTSPrXctCzVenkUpCflT0EJcdjX5TliFvMYR8g0BilvgL0JM+4GOOLPhIiEBE9QlK2mTzvGXkPURwR3Esom2ycKr2dP2vPlNSzjjKg+nO7ftlrjlxhHzaVyK4jQe4f0ON/PKpgKZ4Y04OHSm/ZIRYhZ4oHin8Oj7IQOBdWfbM1djWDZG5RR7hIV7Ebtdhoct63UJyqlzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DS7PR12MB6334.namprd12.prod.outlook.com (2603:10b6:8:95::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 23:36:26 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8880.015; Thu, 3 Jul 2025
 23:36:26 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Balbir Singh <balbirs@nvidia.com>,
	Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Barry Song <baohua@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Peter Xu <peterx@redhat.com>,
	Zi Yan <ziy@nvidia.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Jane Chu <jane.chu@oracle.com>,
	Alistair Popple <apopple@nvidia.com>,
	Donet Tom <donettom@linux.ibm.com>
Subject: [v1 resend 12/12] selftests/mm/hmm-tests: new throughput tests including THP
Date: Fri,  4 Jul 2025 09:35:11 +1000
Message-ID: <20250703233511.2028395-13-balbirs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703233511.2028395-1-balbirs@nvidia.com>
References: <20250703233511.2028395-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P221CA0043.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::23) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DS7PR12MB6334:EE_
X-MS-Office365-Filtering-Correlation-Id: 90a09ed0-2c00-47e8-547e-08ddba8a6dac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V1dXdWxHRkV4bmxvMEwxaU9WM0JxcTNqQmRUUVdhRmRwQkpUYXlFS0VSc0lu?=
 =?utf-8?B?Qk1kOEQ0M3lGTWR0V1NFZS9NNk40allhS2tERm81ZnVJUnBybXlJcW4weWRX?=
 =?utf-8?B?ekNKMHZoMk93VktOcENJVkZPNUFhVy9JV0R5UzlDbkNjanpackRYMDNwNkEr?=
 =?utf-8?B?VzZHY0h6TlRyV0xYSytGNHlaWXNLV3QrZUJJdlprRG9sVlliVkorbE16QUZ4?=
 =?utf-8?B?WDZXb1VoUFFtbW1Xc2lXVDJVS2dkZWlMUlVudTlRYjR4aEU5M1hpbjZxOFJW?=
 =?utf-8?B?WDZlOHVWWkdkcjJ0SHJTVGMrdlRSNU81MER5S096OFBjdDUvdFQ0ZHMrRFp4?=
 =?utf-8?B?QkRKMXpYYkgyRXdoOWIwZmp0aHE5QnBBcTZaWnJISHdMNzNSazc1SWJueHM4?=
 =?utf-8?B?MUFzd3pBSTRKL1pLTTBuVkFjaGx2TkVjMGxMdjFNZkR1RUp6Rk95V0dMRVZO?=
 =?utf-8?B?SkVLaTBOM285YUI0VUV0dklUK1kvY1Z1d08rbGNPa01IbkROMkY5eXhGaWZs?=
 =?utf-8?B?UGlqc3djdklvdVJWR2lPZExPTzNZNnNDOE55bWNQMXpMNG1PUW5GQXgwc0tU?=
 =?utf-8?B?MC9Cdi9ZUE9DZ2JtaFVpNWljVnZiS3FaR3VNQ0dUdGxlODdiQkpTVk43WW8r?=
 =?utf-8?B?djdERTZWYmIzYjJSaDlwZnlOZTd1dnlWUk41Q1FWMk5vOWF1ek1EbnBRd00r?=
 =?utf-8?B?a2pVYUp4Y1htZUtwUHhlVkNzaEZpTko4RVplUndicG8zbHRNN3ZWQmlVZ3d3?=
 =?utf-8?B?RVBLR3dzLzV4M3JwaDBhTW9YV2ozcHhSSEhsTG9RR2tRUzVXdzVjMTFkM2Za?=
 =?utf-8?B?VDdkckVaSllkcEJxS0xHWFZYY0s2czErMzlLVm1HRHhEakRGZGl1NDVHNUJB?=
 =?utf-8?B?bnJjVUNBQXBVSkkyVTlhaFl3a3NhaWR0SVg2TjBuL0YxQm9nZ05EYzdQY3lt?=
 =?utf-8?B?M3VkY1dYOXdLSjVVWGhYdUxXbkVYUDY4YXM3U0s2amMxZXNKemlPL2lYV0s5?=
 =?utf-8?B?bk5Jd1JCdllQSm9VQ0ZyZW40dUl6dVJnSENaVmZaVzJ5dkZhdzZBVVFPanFj?=
 =?utf-8?B?QmVkaUc0UVhpZW9lQ0FPM1h3ZHRKVGl2MGpYNlZWckxTd3ZZRnQ1dzJVdkpI?=
 =?utf-8?B?ZE96ZWRteDlaZ3ZiVzRtMXJ2NGpIelk4RWIvbnJnbEZoU3QrQUFYVGNiZnoy?=
 =?utf-8?B?Y3RWZkpmOTkxWTZkekQwMGcxc3huUHNiYWR0WE1IZ01VcXM1YS8wTEwwNmxz?=
 =?utf-8?B?OXk1Tmw4U1B5WC9sdEhkL1I1dGpLdm0wZHVIOEsrbUVXYlUvcUp4TmYvSWVx?=
 =?utf-8?B?Ryt1eEVxWEdKVXhxallSTWxNNDJ0WnR4NGxqelVqRkRDbkpYZXd0K2ZZVHk3?=
 =?utf-8?B?OEg4Zk05YzJuaEk4ZzVqY3I1RHAvWHVsV0RsSGduYkttaHR1TG9xeE5vcHI3?=
 =?utf-8?B?MkU3aGptYXlNSVdnUDREOGJyb1JJRVpZMG02TTB5dVJOamJHcHJHeWQrUHU0?=
 =?utf-8?B?dWl0cTlycmpKbUNBZ1luMGV6SWxNNXdQR1Fudnd1WElHc2FIUXg4b3dBME9Y?=
 =?utf-8?B?U200UEtTWDkzVU5rQ1cwak4xemFyb0tBbzFpUXk3OGZZaEhzd1U1TUJNNlpX?=
 =?utf-8?B?cmRzK2dTbHd6MlNsYktZU2l6U1JNUElDOU8vdktKUUxXMjNlTnB0akxmTkty?=
 =?utf-8?B?Y2pTcVFSZ09uVFhUUEY0N05GbVpsQ2JNaGc1Nitnc3M2eFl0RlJvcmMzUmR4?=
 =?utf-8?B?b3pCdVVVYjJRRXQ0VnhxSFNlM3JsK1loOXBjU2k3MVBMWGd3alR1UnFhS3hU?=
 =?utf-8?B?Y09BQW9Bb040VmF3czE4K1o2cXlZK016d2UrU0RmZEhNMklWbU5Yc3pyNHZD?=
 =?utf-8?B?dlJXaDdyeDZzRHVpU1Z1SjhxeHVlMm9yOSttdWNKaXUrZUlLUFk3MDJ6cVRq?=
 =?utf-8?Q?NP+MshNwSgY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjEyQnNzTU5oeDBUQzZFdSs1RUx2Ukhacy9yamJkdTlJbnlxRzBkL3N3TDlY?=
 =?utf-8?B?RVdFK090ek54T0Y0MmdyNlRURG9oMW5udm81WDNUNzhyekI5UStBeC95SVFz?=
 =?utf-8?B?NnpHS3o1dEpwaTBEd0tqQ0RTM0xTQ3JaWVlGdFFiZ2ZFUVJITnVoVks3RjVC?=
 =?utf-8?B?S2JaZFdCY0F4OUpZRVJOd1BSZ0NuWStkSmlwOTR5MmMvTnpzZmhRaVBmU2tm?=
 =?utf-8?B?Mi95NWJydlVnVmtNNXFnZnlML1plZzVPMUNHaW5TODFCRmJjOXByMTdzbWtL?=
 =?utf-8?B?empxa1FVa083cjQrMUdacXpLelRaK0hFQlJaVSthSW1yRDVueHZyRU94ZkVo?=
 =?utf-8?B?ZCs1TGdvSEdTYitPQTUzeDRNSXZMeWl1ckFoZlk4cDBTb2FkSUNVSE4zZlZ3?=
 =?utf-8?B?aHdSUUttdmo1SnZrbjAwWFlYSkN5RzQ2S3loT2kyL1E4U2dmWS9aTHZhTDlF?=
 =?utf-8?B?Vmd3c1dTN2UwMUE4YVJyeXBPYktmdTBqZUJuVDhkUkNCcjd4UUY0alhXSDU2?=
 =?utf-8?B?azZSWGxBVVQ1a1FMZW1ZaE1lRjVpbkNmSjI1VlY1aVBOVUZlTEJvMVhZUnh6?=
 =?utf-8?B?eld2VjczL0dndkVQM0xkZ0grOCtzb0ZuNlhmSDVkM3RweXRscmFXT09FVkRj?=
 =?utf-8?B?UXh1MnBnSGphRk1sZEg1VnUvZnhVeGZEUWdjUmxBejBTTDBiK1ZsU1Ztbmwr?=
 =?utf-8?B?WFVQY0R0ajNqMjNWK2NKOTczbndyN1BPbFp2dlgrSkNqTUVYNTVqei84OElW?=
 =?utf-8?B?NWhTRlBPdEc0SzhGZk5MM2xKWGtaNWdVdDFxRGpRWlRScGhjVG50K2tmMWNl?=
 =?utf-8?B?ZW5IL3dwVTk4amN6YURBRVEzZVlmRmMxdmNvVUFuUk80aG5VUllsMzBQRzRw?=
 =?utf-8?B?dUM4OWM4dzNaOW5vY1Z4TGhnck5mTkxQV1ZmbzJHTFJLeTdYNndkSEpnclBw?=
 =?utf-8?B?cjU4YkZoT3NqQ2pnYXRCUFNNK0pzZ296bWJLTE1mQzFlYVVRVWRXNG5qUmpY?=
 =?utf-8?B?cFRibVN5U0liclJQZ0wrN1Ixd0QzbW5VcForT1RGVU82cmYra25yUTBiS1Z6?=
 =?utf-8?B?MjFtMWh5SHJxczhmZEhoZW9GcUd0WVFPY0UwUHVkNXVCQzlUYklDcTZRc25m?=
 =?utf-8?B?aUxTT2NlenJyWi9EbjBtSExiaG5qbHBHQ3BveCtrQXdIWTYxZmZLV3dMTzg5?=
 =?utf-8?B?YzVIa2lEVjU5c2x2UVVLMWNpVFdocDUxUC9Rd1diMUZ1a1Zra0RKejZEd2Ft?=
 =?utf-8?B?K1QvYi84RjFNRmpZYXpGRW81QzU3b0l2VU5LbjhhczJqTGU5Zng4ZzVvRXZo?=
 =?utf-8?B?Q2FvSi9VQlROb2NGcytqRDR5NEdnN0g1VllHMkUwdllTdDAyWUdhRkxZdFBJ?=
 =?utf-8?B?dzNtd09za0lHYWVpRlV1ZHpMeVp3bTVTSEdTVUtqYWo4bGtwRDVxNVV4SzVC?=
 =?utf-8?B?QjVYQmdUSHdpaUNienN1a1J3LzBVbWNVVDdrTjRDSDlpS0dYYkFDcGx2RjVC?=
 =?utf-8?B?aXBPYzZGNTd6ck4yVy8xcUZ0SWVMdzdYR2E2S2dsYi9hSXZiSHlqNC9jM2ZO?=
 =?utf-8?B?WGJIZXgvSWRwajBtcm5YZXVPd3hsbXh4MTlNSDVxUGRWTTAyWG9IbnppdGh4?=
 =?utf-8?B?S1UwOHlWY3NSd0ZIaTE1VDBoSnJ4WnNNaFJkR3JNSm9pZmVHQktBaEhFbkFG?=
 =?utf-8?B?MncxUHBTcHJvNmprdSs4RkFyTE9hbUwweVpydHlWcFpINlcwWnUyNERXYUNT?=
 =?utf-8?B?aVM3bWlHS1prZ0Y5MUwxTHprWjgxQmw0UndsOXhvMGhFUE96cHZybElISmo1?=
 =?utf-8?B?b0pFVFFvRmZTMklsS3o2Q25QbENETkp6L2VyMmYzd0xxWWp2QzV0UTlHQ3JO?=
 =?utf-8?B?QlRFbWFnSFk0OW0wN1MrRmRyU1pKaEQ4c2t4dWlhVWtDNkdDSUF4bEtRemk4?=
 =?utf-8?B?YjJrK1kyekJHUHlkelJUbVNmZ1RNQzlFZ2szUDIyYkdpZFdoTGxEQ0VyMWg5?=
 =?utf-8?B?NXdZYlEwYS9oais0cG5VWDZvVW5QNU1kM2p6RTMxcUcvVDlwRjBDbERkNEFU?=
 =?utf-8?B?WkZ5ZEhaOU1mTUhINzFCN2s0ZWN1Q0pqYkFZc29GWUwxSi9SNm5YSEdNUTRk?=
 =?utf-8?Q?JtfIAI8zIbmG3CAu+UEck0MsQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90a09ed0-2c00-47e8-547e-08ddba8a6dac
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 23:36:26.7385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I/JOo7wqy5g6V4PJfIYAnRxLPfonpdACqkdKOJm5oRycBKdPNOOuL4X1NAKjxWC2MXeMq3syw2DnwEIW0hcG8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6334

Add new benchmark style support to test transfer bandwidth for
zone device memory operations.

Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: "Jérôme Glisse" <jglisse@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Barry Song <baohua@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Peter Xu <peterx@redhat.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Jane Chu <jane.chu@oracle.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Donet Tom <donettom@linux.ibm.com>

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 tools/testing/selftests/mm/hmm-tests.c | 197 ++++++++++++++++++++++++-
 1 file changed, 196 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/hmm-tests.c b/tools/testing/selftests/mm/hmm-tests.c
index da3322a1282c..1325de70f44f 100644
--- a/tools/testing/selftests/mm/hmm-tests.c
+++ b/tools/testing/selftests/mm/hmm-tests.c
@@ -25,6 +25,7 @@
 #include <sys/stat.h>
 #include <sys/mman.h>
 #include <sys/ioctl.h>
+#include <sys/time.h>
 
 
 /*
@@ -207,8 +208,10 @@ static void hmm_buffer_free(struct hmm_buffer *buffer)
 	if (buffer == NULL)
 		return;
 
-	if (buffer->ptr)
+	if (buffer->ptr) {
 		munmap(buffer->ptr, buffer->size);
+		buffer->ptr = NULL;
+	}
 	free(buffer->mirror);
 	free(buffer);
 }
@@ -2466,4 +2469,196 @@ TEST_F(hmm, migrate_anon_huge_zero_err)
 	buffer->ptr = old_ptr;
 	hmm_buffer_free(buffer);
 }
+
+struct benchmark_results {
+	double sys_to_dev_time;
+	double dev_to_sys_time;
+	double throughput_s2d;
+	double throughput_d2s;
+};
+
+static double get_time_ms(void)
+{
+	struct timeval tv;
+
+	gettimeofday(&tv, NULL);
+	return (tv.tv_sec * 1000.0) + (tv.tv_usec / 1000.0);
+}
+
+static inline struct hmm_buffer *hmm_buffer_alloc(unsigned long size)
+{
+	struct hmm_buffer *buffer;
+
+	buffer = malloc(sizeof(*buffer));
+
+	buffer->fd = -1;
+	buffer->size = size;
+	buffer->mirror = malloc(size);
+	memset(buffer->mirror, 0xFF, size);
+	return buffer;
+}
+
+static void print_benchmark_results(const char *test_name, size_t buffer_size,
+				     struct benchmark_results *thp,
+				     struct benchmark_results *regular)
+{
+	double s2d_improvement = ((regular->sys_to_dev_time - thp->sys_to_dev_time) /
+				 regular->sys_to_dev_time) * 100.0;
+	double d2s_improvement = ((regular->dev_to_sys_time - thp->dev_to_sys_time) /
+				 regular->dev_to_sys_time) * 100.0;
+	double throughput_s2d_improvement = ((thp->throughput_s2d - regular->throughput_s2d) /
+					    regular->throughput_s2d) * 100.0;
+	double throughput_d2s_improvement = ((thp->throughput_d2s - regular->throughput_d2s) /
+					    regular->throughput_d2s) * 100.0;
+
+	printf("\n=== %s (%.1f MB) ===\n", test_name, buffer_size / (1024.0 * 1024.0));
+	printf("                     | With THP        | Without THP     | Improvement\n");
+	printf("---------------------------------------------------------------------\n");
+	printf("Sys->Dev Migration   | %.3f ms        | %.3f ms        | %.1f%%\n",
+	       thp->sys_to_dev_time, regular->sys_to_dev_time, s2d_improvement);
+	printf("Dev->Sys Migration   | %.3f ms        | %.3f ms        | %.1f%%\n",
+	       thp->dev_to_sys_time, regular->dev_to_sys_time, d2s_improvement);
+	printf("S->D Throughput      | %.2f GB/s      | %.2f GB/s      | %.1f%%\n",
+	       thp->throughput_s2d, regular->throughput_s2d, throughput_s2d_improvement);
+	printf("D->S Throughput      | %.2f GB/s      | %.2f GB/s      | %.1f%%\n",
+	       thp->throughput_d2s, regular->throughput_d2s, throughput_d2s_improvement);
+}
+
+/*
+ * Run a single migration benchmark
+ * fd: file descriptor for hmm device
+ * use_thp: whether to use THP
+ * buffer_size: size of buffer to allocate
+ * iterations: number of iterations
+ * results: where to store results
+ */
+static inline int run_migration_benchmark(int fd, int use_thp, size_t buffer_size,
+					   int iterations, struct benchmark_results *results)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages = buffer_size / sysconf(_SC_PAGESIZE);
+	double start, end;
+	double s2d_total = 0, d2s_total = 0;
+	int ret, i;
+	int *ptr;
+
+	buffer = hmm_buffer_alloc(buffer_size);
+
+	/* Map memory */
+	buffer->ptr = mmap(NULL, buffer_size, PROT_READ | PROT_WRITE,
+			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+
+	if (!buffer->ptr)
+		return -1;
+
+	/* Apply THP hint if requested */
+	if (use_thp)
+		ret = madvise(buffer->ptr, buffer_size, MADV_HUGEPAGE);
+	else
+		ret = madvise(buffer->ptr, buffer_size, MADV_NOHUGEPAGE);
+
+	if (ret)
+		return ret;
+
+	/* Initialize memory to make sure pages are allocated */
+	ptr = (int *)buffer->ptr;
+	for (i = 0; i < buffer_size / sizeof(int); i++)
+		ptr[i] = i & 0xFF;
+
+	/* Warmup iteration */
+	ret = hmm_migrate_sys_to_dev(fd, buffer, npages);
+	if (ret)
+		return ret;
+
+	ret = hmm_migrate_dev_to_sys(fd, buffer, npages);
+	if (ret)
+		return ret;
+
+	/* Benchmark iterations */
+	for (i = 0; i < iterations; i++) {
+		/* System to device migration */
+		start = get_time_ms();
+
+		ret = hmm_migrate_sys_to_dev(fd, buffer, npages);
+		if (ret)
+			return ret;
+
+		end = get_time_ms();
+		s2d_total += (end - start);
+
+		/* Device to system migration */
+		start = get_time_ms();
+
+		ret = hmm_migrate_dev_to_sys(fd, buffer, npages);
+		if (ret)
+			return ret;
+
+		end = get_time_ms();
+		d2s_total += (end - start);
+	}
+
+	/* Calculate average times and throughput */
+	results->sys_to_dev_time = s2d_total / iterations;
+	results->dev_to_sys_time = d2s_total / iterations;
+	results->throughput_s2d = (buffer_size / (1024.0 * 1024.0 * 1024.0)) /
+				 (results->sys_to_dev_time / 1000.0);
+	results->throughput_d2s = (buffer_size / (1024.0 * 1024.0 * 1024.0)) /
+				 (results->dev_to_sys_time / 1000.0);
+
+	/* Cleanup */
+	hmm_buffer_free(buffer);
+	return 0;
+}
+
+/*
+ * Benchmark THP migration with different buffer sizes
+ */
+TEST_F_TIMEOUT(hmm, benchmark_thp_migration, 120)
+{
+	struct benchmark_results thp_results, regular_results;
+	size_t thp_size = 2 * 1024 * 1024; /* 2MB - typical THP size */
+	int iterations = 5;
+
+	printf("\nHMM THP Migration Benchmark\n");
+	printf("---------------------------\n");
+	printf("System page size: %ld bytes\n", sysconf(_SC_PAGESIZE));
+
+	/* Test different buffer sizes */
+	size_t test_sizes[] = {
+		thp_size / 4,      /* 512KB - smaller than THP */
+		thp_size / 2,      /* 1MB - half THP */
+		thp_size,          /* 2MB - single THP */
+		thp_size * 2,      /* 4MB - two THPs */
+		thp_size * 4,      /* 8MB - four THPs */
+		thp_size * 8,       /* 16MB - eight THPs */
+		thp_size * 128,       /* 256MB - one twenty eight THPs */
+	};
+
+	static const char *const test_names[] = {
+		"Small Buffer (512KB)",
+		"Half THP Size (1MB)",
+		"Single THP Size (2MB)",
+		"Two THP Size (4MB)",
+		"Four THP Size (8MB)",
+		"Eight THP Size (16MB)",
+		"One twenty eight THP Size (256MB)"
+	};
+
+	int num_tests = ARRAY_SIZE(test_sizes);
+
+	/* Run all tests */
+	for (int i = 0; i < num_tests; i++) {
+		/* Test with THP */
+		ASSERT_EQ(run_migration_benchmark(self->fd, 1, test_sizes[i],
+					iterations, &thp_results), 0);
+
+		/* Test without THP */
+		ASSERT_EQ(run_migration_benchmark(self->fd, 0, test_sizes[i],
+					iterations, &regular_results), 0);
+
+		/* Print results */
+		print_benchmark_results(test_names[i], test_sizes[i],
+					&thp_results, &regular_results);
+	}
+}
 TEST_HARNESS_MAIN
-- 
2.49.0

