Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E7D17D7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 02:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751855746; cv=fail; b=DzNz6urOMfvCUPozptmKAhvtl/2TbG+KlTuTsvDPc3xrEXLKBF12ZsxQoRfCrTEfM02kILvjEIXwmd8dMphZaeGdb2jeKvEoWrNX8u7IprkNaH/T8dnpWAk2AMIIcLG1A8M0uSaEdrvD7s1qwdyI+XoHx7T7w+ZLhaqCrQCMYdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751855746; c=relaxed/simple;
	bh=tNZKSAJxELSxzS9eS76Wxs5YT2GbGT1rpmRxbiGkSuk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EAHVRUqGSgZpTUMsjaXd96U6e8f4IrzPcojStGdUHYJ9AMeMg5Nr6c/ZN5IuBk1Wy1dRfNER+F9eGQwks+6jHP5/kOSGljgcpgSfhZoW2PjRsdhjJN4CpryV5rSdR3yOPLQUiW1wFa3G5LDfBxX/acmAFvD0X81HKhROkKwKILQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sWAORXup; arc=fail smtp.client-ip=40.107.237.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sWAORXup"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XDHDdkF6BAAMVifQGMLFnyD0jn1ju5kEZyGhz8rKyaZXogPTJICF+s2/T8k1gZ4tTH+q+09j05ZgXZLH4YTf1VBZ/sKGjkviIYL9HIH/C0H5P1OcD6pKbU05FwALqTtEX2TpRmHin1/hkBnjr4ht3RjlLWePbDpbbCzzDxRHEaqljBaUX1TGuKBDSP4fC2ysxVmUIaRrKHDXKf9S4UvxKOvM7lrYFr1stz6pjYUZ6BPFqut8zVcbsKJfxHoJfYGfTlpY+yoa/l7KQpo7Cht28ett63PgAVjd7GPnOiBfTxrGrw0Xkku/zF0oev7LhrtGI61Yo1BD5nXRgli0T0Kjfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hN4LBkJccrFMPuZaeo9gMxVSoZbP4ZKUQ0anjZ6FiFg=;
 b=lSf/W3Qqx4ss62qO4JdveCsK32Swn3Kt2ABFKu8qql/l/3SutOsL3kgqhgboRuuL/ayt2OTKVnpPjFJq8vtTfUV2bVEef3PbtqMH/dRDHqqkLpA1DFwLWzA/cwXPIv7hi1tcFHM4s6IzMaaPVB1V3s7vgpcQk5mBEcA9BOT+UuVQ8ywBOMfv97vre5k359+zbFDoH5vARXI7k8ZI9H/FObTjCvgp+ftITQVkcp9z5FqJ3wYVZOXPv5J/XChNaZGcCoVMo3smpa7HSqQAqlbpoMKqq8HYJJc+6WGoopFaSJBMv2z2x2k95jXhltZU+cGP4123aXWR7L5Z6PSv84NqOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hN4LBkJccrFMPuZaeo9gMxVSoZbP4ZKUQ0anjZ6FiFg=;
 b=sWAORXupAj+5IkTtzmOgnCFZI1OpzmtIHiLAfsukCPu+rQTuNRPhfPhTTHEnjLkVrox6OQwbywf50V4/NG7wTYuv+etHSLdiMo1nOd6GvBFNBJPpGL7DQcsCRm8bDsx6SNUXoQlBZId3TYnskzgKRyEDO3KyfNOThUTh2uw9cJNtJeabYFuJ8rOStXDBoMpLRW6VvplalgOAistf07jCN+qoQA6bshIDzLGsvE9Q2olcDGmmVWggmHk8w2ccm7xW9mu4ThluFtUCLBlbSJYrl6mUYguiLGiDRovEL4ltl6WtxTEwSAhWkBQUIbayAkjVebrluB+hEcsBi/j6IjdSpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SA1PR12MB7344.namprd12.prod.outlook.com (2603:10b6:806:2b7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Mon, 7 Jul
 2025 02:35:39 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8901.021; Mon, 7 Jul 2025
 02:35:39 +0000
Message-ID: <2ace3c9e-452a-4bd2-a7df-6fa9fd3de290@nvidia.com>
Date: Mon, 7 Jul 2025 12:35:33 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [v1 resend 08/12] mm/thp: add split during migration support
To: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>, linux-mm@kvack.org
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Shuah Khan <shuah@kernel.org>,
 David Hildenbrand <david@redhat.com>, Barry Song <baohua@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Jane Chu <jane.chu@oracle.com>,
 Alistair Popple <apopple@nvidia.com>, Donet Tom <donettom@linux.ibm.com>
References: <20250703233511.2028395-1-balbirs@nvidia.com>
 <20250703233511.2028395-9-balbirs@nvidia.com>
 <e1889eb8-d2d9-4d97-b9ae-e50158442945@redhat.com>
 <715fc271-1af3-4061-b217-e3d6e32849c6@redhat.com>
 <b25b3610-5755-4b7e-9a9f-d7f1dc3e4bdc@nvidia.com>
 <6bb5b0ae-6de3-4df8-a8c1-07d4c6f8c275@redhat.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <6bb5b0ae-6de3-4df8-a8c1-07d4c6f8c275@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0099.namprd03.prod.outlook.com
 (2603:10b6:a03:333::14) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SA1PR12MB7344:EE_
X-MS-Office365-Filtering-Correlation-Id: a3427167-fbbc-481a-e346-08ddbcfef626
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bTBmOFUyaHM5b0NWbExCcDVFMldEYWFkZ2hvVDE2aVdQdnhCMmovNU1QVFRU?=
 =?utf-8?B?aStWN1JURmNmTm1GcVpiYkREVVRIYnBWbDdGK1JPUGRUUG1pRlR0clgvQmpr?=
 =?utf-8?B?akwvU0V2azN6NFBRN29uZUVsVEpaNUxBNHJhNmVadEMvdXRUZW5MM1pVVkZW?=
 =?utf-8?B?Qk1JMUVDV0JEOHVZTWVwbWZNV0ZpcFM5WWU0c2NsR2dmM1dYOUhxOXNPVFVT?=
 =?utf-8?B?TUdCc2NhSnRqTDN1ZC81Zm9aS0F0bzRtaDJOZnhaMXFUTWJLUUpoMTFhbzVY?=
 =?utf-8?B?bW91T04xcUFDM3l5TmxteWNvQWg0ZythcmoyOEo4VkRzbWt2ZnZVSk5aZURq?=
 =?utf-8?B?SnVnZ0l4cTd6KzJBbmxmazNYSVlpd1B2NGkyYXZtSFhqeUxVU2FNeURqU0Js?=
 =?utf-8?B?b0w1SWtScDlHZ3B2Um9LY0J4dFk0Y2gxcHhpSjROTGc3eC9FcVhzNE1PYm5o?=
 =?utf-8?B?SkJLQXlYMlFDbTRsdWZXdERXU2NYRHRsbXFTNm05dUxzNUtDdkxwWWwwR3V5?=
 =?utf-8?B?MWUxWHFMcHZQV25SblZKNG0wRnFTV1ZoWTJnVjF0RFJvMWsyQlpNazRxQjJi?=
 =?utf-8?B?VzB4UFBYRVU1cFRzYmhZQjBOMTBqNzZxMnNzTE5NQXc3NjVHNDFOdklYTXFN?=
 =?utf-8?B?Y283bURDN2xzWlBWSmI5UTB3VFlJSTVScjVBbmtxcDBKM29rWS9FVGNOSVBQ?=
 =?utf-8?B?R1Rwa3JsUnNhVFJ1QWFJVnhhMkNtTUxycmhWa1RYL01JNHkvcHgrME5GYjRP?=
 =?utf-8?B?NGI3U0ZxeEg1MFJjMzFFL3B0QUlHbmplakMraW9Hb09NYjA0dkR3SHFnSHlu?=
 =?utf-8?B?R0lQSm1PekR3a3hiRG96OFo4R0F4MDY4eVpDNERienpQODQrT0JlazBJcWI0?=
 =?utf-8?B?RzVISHVINElGUWFpZW4xUWI3MU5zazZyWENyVXZYeFovUmZLRnZpb3VYc0R4?=
 =?utf-8?B?M1UvenBGU01iTTlLK0xoM25yWmswa0ZkU052LzkxQVlBcGlSNi8zWHdscFZ2?=
 =?utf-8?B?am0xR0tzeFM0MUE2bFZDdS9ET2xRNDB2SnlUdjZlNDNDVU5ZRVZ1WWpTNHFp?=
 =?utf-8?B?WTR3NE03ZytsZ2s2UDNWR0dxc0ZxUmk0NUxkczVVSEdFOS92Y3RZaXpHQkoy?=
 =?utf-8?B?YlRHRVdJakJkdEkwUFpLMzN2QWlUajhMZjlMR3NydUpvazFNcWIwRGVjRGdY?=
 =?utf-8?B?MjhuWll6ZDZzRGJpbTZjcm9MZ00zRDAxb2tQRE9mM0FXY3BWbStVYWFWMzNC?=
 =?utf-8?B?cktqL25kdnliRHpicDNoZ0ZSREFONWMrZmlrUHE1TFRxbXZnd0JpRVhMYXA2?=
 =?utf-8?B?QjQzaXBvM1JhRnhXZFRybWI5VEVvMzZFcEM3dFhvVXAwRVdzU3hHa053UTVz?=
 =?utf-8?B?MTRmZ2hINzJYYWVGTjg1TXlHUWh6eTBYR213SkVLRzFvUlFzR3I3T2FwYk1E?=
 =?utf-8?B?RCtFQzlkOThQOHJLUVNXUkxnTGNzQ0t1NDdiQmozdkpuQ0RFd1Vxc1QwL3J3?=
 =?utf-8?B?UGhxaVVmN2tiYzVLbUN4d3RYYURDT2hmRXFhS1JiRG1yQ1hiMEFNeldHSUMy?=
 =?utf-8?B?aWIvVTlrdE5HT2lvYnNJUERiYjJyTExsKy9zd3JJbWJ3d09IdWIxdHJGd2ZN?=
 =?utf-8?B?RmtlVGRDR05LaWtOTFJhczVDYUNWSGxGK2RvNXcvbzVJOG16SWRGbFRNTlVL?=
 =?utf-8?B?cG92UVNGcTlmWDJsa2Z1TCsvTUZWTU5BS1NSYk9hK1prUytTWmpBcytxUlpn?=
 =?utf-8?B?RjR3bDNWS091OUE3YzFzNkpXREVDWllSUWk4RmNQVmJ6N2J0UWxTbHJFOXpM?=
 =?utf-8?B?V3JiRVFWdmdQcHYvNFFGRjFaTkRjMXZCM2FJSW1YaVIvVS9sRGRNQWIwYkVi?=
 =?utf-8?B?MHI5UzRPZ1MrRnljamJqTGRXUDdWcUxyTHE1WFBUbmhGQkE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlZhVGVUOS9BQ1dOUXVTMVlOWk5IZGxaTXR2VUIxa252UzJUTHhFUDRTYVh6?=
 =?utf-8?B?N1FIZnBOWm92RFMxODZHbFI1a0ZwQUhBNC9tSzgrd2NwOFBMYlZLMHFIdmdX?=
 =?utf-8?B?YVpxM2Q3U1VBVDhmdHhnNXROMkM1UkVOMmJqZ1FEeTVLN1FpMWN1ZlpieEtN?=
 =?utf-8?B?R3Mwamc1RkxRdE9haXdGUFlCbFNrSWxpTTZGaVBlVHNSbHVDZW9vM2FCY1JO?=
 =?utf-8?B?QmEvMkNmUVZBZ1cxcmozWjFvZzlOOGJjeUlNV3lSR3RKVG5oK0ozU2VXNTBx?=
 =?utf-8?B?N0tJem5mRi84SytTcXh3Q2R3OWQyblllRStCdEpVSEdZWkV5d1h5a2ZtYTNi?=
 =?utf-8?B?ZGU3SUwxRzc3WCtDZlNuZXpGSXJvWHFSMEpWYWZCV04yZWIrV0htOGlNUkdK?=
 =?utf-8?B?aVhaQVFzcEN4RUJmekpPWWs3NU55cFNXRndLYWpJTCtyUmtGOWVaRXgyUXFU?=
 =?utf-8?B?b0JYY29LN09HNkUzdDBqQzkrVGQzZmtNYnExVHhtaHdFQUkxODNkMEYxbUwz?=
 =?utf-8?B?Z2diVlRWNTZ2ZWFZM1ZJdHVBUHlKelVnL1ZJWFJ0ZEVucXZMcFR4ZGVDNzRC?=
 =?utf-8?B?dEpjYmNFS2FZV29EMFdTQzhnTXNGV2I5S0NDNXZsL000dFcwUHIwbEtxdXdN?=
 =?utf-8?B?a3l6S05CVjcyRW0xQ3JiRkp6eFhMcTI5YjV2YklBZ1FodjNRclN0aFN0a1E3?=
 =?utf-8?B?cVBiQ0xRNlRzUHROK0VrNjA4VEF0Ty9DZDZFNGtESVE2cEFYMktCR3Z4LzQv?=
 =?utf-8?B?b0dybWxRYWM5SFk4TGRmaFdhSlJPQmNvZjNOOEczUTlDa1FvaEs5cDBKUTNC?=
 =?utf-8?B?QUt2MWpsMGNRUFFFRi9vNklpR0hDb2poVGdXdWVaN0dFYWQ2bVpKdXBjcXhU?=
 =?utf-8?B?NU1yN2h5OW4zY28rUzZCeFUvVDBwOFRVd1lNd0kzbFlzWUs5MVM1cmljcTZX?=
 =?utf-8?B?c2hzTWlHVGxvL2VzR21YaFU4V2ZVMERIZDlCSFBBSG02TEtFbVBvRzN3YVpJ?=
 =?utf-8?B?eWNWT3NVZWtvaW5FNHNWYkpuMVBJRlpudHNpdUd0WGUvenNmTlo3OWpPcU9J?=
 =?utf-8?B?N2RITzgxbGo0eW9PN1FkZCtuZDZpNUxMS0ttMjhzWlVGWWFTZnNkWWZwMnh4?=
 =?utf-8?B?UWREUjV0elBiZTRyVmJwTUhSMVNOTlM2TWNkdzZrVVR2eFVOUWJxbzNBMlYy?=
 =?utf-8?B?V29neHhoZHZMckFHQWd1Q1Mra0YvbitEK2poV1ZMa1ZCT2MrZFZ0TE5HT3hG?=
 =?utf-8?B?VGNVNGkvNEFYUnNHTnJJMVE0dW5TZHdQcTNJVnlrelNRdGcyZ29sQXp1TDRs?=
 =?utf-8?B?WWdyMWg2Rm5HNFZhZ3NZNU5tb3BBOWJHV2JMdW9CTnJwdUtZeVp6bHp5YUFi?=
 =?utf-8?B?Qnd0aUNxNEF2MnhSUDI0RW1HTHhtU29FUlJHVDRTRmNtb1JENENhV3Y5UEl5?=
 =?utf-8?B?WTFHS0RTYTdkY2JicjBuUlFMZCt0NWd6OStHOCtmcDJqWHhHc2JtMmtjdFFu?=
 =?utf-8?B?TmdXVTZYNGI3RkZWMTMraHhKZHh4WHFKSDRoZE1nQ1RJaFJXZWJzT3FJTkht?=
 =?utf-8?B?SGtWMlVlTFUzRVNrSEYwYThYOW1mWUVySXJJS1VWVEQ1SlhHU1hkc3J0aFl6?=
 =?utf-8?B?UGxTYXdjbVJ3Rkw3Ymp2dG9IZE9CQWJvMXVRcjJKbTdJWS85OFFvUW8vVzYx?=
 =?utf-8?B?WDhkeTZSOFRqWmtIaTlmOXpjdUwwZWhaSDVNWlRCYktpYXhraEVZQW1hSEx3?=
 =?utf-8?B?bWhBa3FFYzd1cmtmRkR1V0M2MUErdVZqUUxhT1ovaUVISFIxakdBbnYvZDZy?=
 =?utf-8?B?VkNDZTlwZnBqNC9TNW1nQ3FBMnJDZjMvbXhTVUFyK1A3MkZPZGxDajN6NXkw?=
 =?utf-8?B?akdINm1ycUU1TDhOamEwMWRVcGVDa0lJRXZnMHZ5THBTQktOZ3JVekdQMElK?=
 =?utf-8?B?a2tGdTZkUHk5VTRJalFuZUJzVTNkZFVvUUQvUlZPSWZnT3AxTGdKaHQzL3R4?=
 =?utf-8?B?NUE4RGttd1ZoUWFLZTIyckY2RS9tVldad0dlNm16S3Q2cGRoYngyUFcvRFpT?=
 =?utf-8?B?UDMrc3NPV0EvMk5WenhFOG5yV25obFRhMml4RWZpaDVTVjM5M2ViZ21QRGJj?=
 =?utf-8?Q?Opx4PeERf5YCAdjWiNqyJ/AgR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3427167-fbbc-481a-e346-08ddbcfef626
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 02:35:39.5583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WuBS+VCmrMzmMS6b4ouAJrNb6wkDPXdrVAe3eL5fxo/GvkOprk0mW+Hl1yzZ9UYzLQvx3Nu0EE3/tmUcYOO6Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7344

On 7/5/25 13:17, Mika Penttilä wrote:
> 
>>>>> +static void migrate_vma_split_pages(struct migrate_vma *migrate,
>>>>> +					unsigned long idx, unsigned long addr,
>>>>> +					struct folio *folio)
>>>>> +{
>>>>> +	unsigned long i;
>>>>> +	unsigned long pfn;
>>>>> +	unsigned long flags;
>>>>> +
>>>>> +	folio_get(folio);
>>>>> +	split_huge_pmd_address(migrate->vma, addr, true);
>>>>> +	__split_huge_page_to_list_to_order(folio_page(folio, 0), NULL, 0, true);
>>>> We already have reference to folio, why is folio_get() needed ?
>>>>
>>>> Splitting the page splits pmd for anon folios, why is there split_huge_pmd_address() ?
>>> Oh I see 
>>> +	if (!isolated)
>>> +		unmap_folio(folio);
>>>
>>> which explains the explicit split_huge_pmd_address(migrate->vma, addr, true);
>>>
>>> Still, why the folio_get(folio);?
>>>  
>>>
>> That is for split_huge_pmd_address, when called with freeze=true, it drops the
>> ref count on the page
>>
>> 	if (freeze)
>> 		put_page(page);
>>
>> Balbir
>>
> yeah I guess you could have used the pmd_migration path in __split_huge_pmd_locked, and not use freeze because you have installed the migration pmd entry already.
> Which brings to a bigger concern, that you do need the freeze semantics, like clear PageAnonExclusive (which may fail). I think you did not get this part
> right in the 3/12 patch. And in this patch, you can't assume the split succeeds, which would mean you can't migrate the range at all.
> Doing the split this late is quite problematic all in all.
> 

Clearing PageAnonExclusive will *not* fail for device private pages from what I can see in __folio_try_share_anon_rmap().
Doing the split late is a requirement due to the nature of the three stage migration operation, the other side
might fail to allocate THP sized pages and so the code needs to deal with it

Balbir Singh
