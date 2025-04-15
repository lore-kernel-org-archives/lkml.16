Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7122522BD;
	Tue, 15 Apr 2025 20:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744748977; cv=fail; b=rhXY5Ra+NLX+2L4nRGc7SWLDiRo6x1rKg4hwIWIiP72WwZrhqWOK0oxU7/9dGM3TBzh/IvBVH8xIYPu+2vufOYo7UpbAT3RU52Tasn0QOyuuz9rWbi+lAFrg9CftJ+nUhAjpuYybO2nDtqPyU6eNBiHZxNqoUnBWBa0iikaRjMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744748977; c=relaxed/simple;
	bh=oJDmjsJcZ3nFwTuQtuw4C7aoSXtJohQ1zT22LETuw0Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uDhzSG7svVUQgwOB7iObeOQm/L7AG1K3AT5SEg8ma55Xd1R0033voVeyuLjXkqvaSnBVT9n+YOqtmY1jmCW3u065fLlhaAbRVH6R3yH6dgUGyC2ldTf8FWa/dhv/Ykx3pHJNyWe6eiAFku8lIccTrX/MjydERMQQZs3AlqC0AgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hWvK6f0z; arc=fail smtp.client-ip=40.107.223.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hWvK6f0z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ag6ta8HMDK3ZOajomx9opebUG0fxAt5AnBh0LgsTkzxoCwpQDqngBeYpo4NkqTTgEvogPJsvqo/utZvXbKr46adfOu8+2cQU9Tt74R1laBaCcvauIPFNYWKbT8WwEGR9G+R0hti7jkfTSXbl6Qjc6QtnYi2Bg3t7FeWSaLnNIS8ElH4Nz9lji/o4AlMi8WAmrWrTsUKQh9dyzgDBNNgx6WwlvXgVznDjZrylKuCxNIMxJJ8owEFdTD+aWZnicF3ua81O0m08ukzWLckl046hgIXpar8zcxvbvEQWLcIezcYTWWqxCBV/m2ZhD7Kg8dtauv7HKI/ITU8+B7k3Q5J1jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tlx6/o/41JWiMrofe/aIjHL0D7kIwZyc3AStfoDd+gE=;
 b=tzDvm1biTH2G9xy/WJ0/+4d5gG4kj5Dpxp2bsgdMSSUXqv8mAWsCm8fGJ1vCKEkAp/NclKUeYSKjI1bObORPpczwBtyMhFIvvV+Z2zu9xvTeVRq9Hw7GXBwL+yY6jkXK7Q1Hhe5maNuTVG8jyzEe2Zu3xNvEyUiQC8bpP42erOlq3or813nOXudba7zf+Z1EMqC2TncLELKmNljzw03n6YtiNGnzTNNYAA14qpJrjFjrX3uG/AyfdC+LG0jRtgr8iXVJQUEw8mKJxeTJJ2UuqMAeq2kkhKh6/d28xjK4KOuotSbgiAypB0vou+Wb1RGeFaDMazxwns/dfltFYqgMKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tlx6/o/41JWiMrofe/aIjHL0D7kIwZyc3AStfoDd+gE=;
 b=hWvK6f0zwDqU/UU61m8dBYJKu+uRYvIFqv8iPNz74RsiWN0df4dgJEvuAWIAn1A+8AO3+A0/dlIjMAGZ66gpQrHrzfhjejM3hZuHGyRbt4mVUR7ZUUjFJsUu10D61G8OKH9EB1FJSDPBsbeWqXSlX3Jfxm63lQdUxdvzA9Zqy14=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by MN2PR12MB4389.namprd12.prod.outlook.com (2603:10b6:208:262::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 20:29:32 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%6]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 20:29:32 +0000
Message-ID: <e7115e72-9463-4d73-a7fc-d327ec348786@amd.com>
Date: Tue, 15 Apr 2025 15:29:27 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v12 19/26] x86/resctrl: Add event configuration directory
 under info/L3_MON/
To: Reinette Chatre <reinette.chatre@intel.com>, tony.luck@intel.com,
 peternewman@google.com
Cc: corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 paulmck@kernel.org, akpm@linux-foundation.org, thuth@redhat.com,
 rostedt@goodmis.org, ardb@kernel.org, gregkh@linuxfoundation.org,
 daniel.sneddon@linux.intel.com, jpoimboe@kernel.org,
 alexandre.chartre@oracle.com, pawan.kumar.gupta@linux.intel.com,
 thomas.lendacky@amd.com, perry.yuan@amd.com, seanjc@google.com,
 kai.huang@intel.com, xiaoyao.li@intel.com, kan.liang@linux.intel.com,
 xin3.li@intel.com, ebiggers@google.com, xin@zytor.com,
 sohil.mehta@intel.com, andrew.cooper3@citrix.com, mario.limonciello@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 maciej.wieczor-retman@intel.com, eranian@google.com
References: <cover.1743725907.git.babu.moger@amd.com>
 <b5b9dcc35d737b999aee9f1aee727d0eced5739c.1743725907.git.babu.moger@amd.com>
 <ee19ea57-96e7-43d0-ab27-3dd12fb549bc@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <ee19ea57-96e7-43d0-ab27-3dd12fb549bc@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::6) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|MN2PR12MB4389:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ecdd2dc-2173-4149-1f96-08dd7c5c3a99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bHhFOGR0dFd0ZmpIM1ZrM2ZYUXpPYndDOHl5ZEtrWk1MM3ZEb1VvTnJPdTds?=
 =?utf-8?B?TzNCY251WEpuakdvU3ZvQ1N6SDJJY0JWY21KZ0tKT0Rla1RwaHQzdC9kdDBj?=
 =?utf-8?B?NTN3RzRRSFF1OGU0SEhYZndyR0lRQUR5dERVOGU4UzdpVVdsUTlqbnQ4MkRs?=
 =?utf-8?B?cEtJZlFvTkVQdGZ5MStYZXZCa0h0YzJGVkVkd0t1L0tNTkYxOHZJOS82NVFF?=
 =?utf-8?B?dHZYMEdUT2tSd1ZWTG82cEN2V3NBN2QydW1TZjZaa0lrNjZQdzhuOExtNldz?=
 =?utf-8?B?RERHZXNHZ0hNU1BLc1EvNXU2UGJjakdvK3N3dnN6amkwRTVoak9xWVl3M3Vj?=
 =?utf-8?B?UGo1Szl3RXB6K3NGQkd5d3lYSDQyVmRQN3FjaUcvbW01ZlRsL1IwWnRSNzlQ?=
 =?utf-8?B?SmxIWlp4cFBhTHgvSmJnWXRvK0ZEMTNwdkdobFd6b3MyNURwUThJbks1bTNn?=
 =?utf-8?B?YmdkQ1psbC9JVC9XZ3VMcXpqc05sRDI1K3REMktLaGtMYm16OHQxYXRJV05t?=
 =?utf-8?B?Rm9LaGIzVXpQbUUycnpFQk9RRCtWbUpVNU1rZ21pVGMwNHVRaTRvaXhobSto?=
 =?utf-8?B?R3NwSUhPK2hMbE54Yzd2OGIyWlA4L0FGR1BQYzFTQmhnVWNMZUsxRkQySVh5?=
 =?utf-8?B?aWhwcFJyRG0yRlZpSTFzYTFJVDg5Sk5ETlNmY1NiV0V4SlJWT0VEbjJUTThC?=
 =?utf-8?B?VmZ1b1NWRWhnWXdmTWVNZXlKMlNNencwYUw5VCs5d3Y5NjhFYkErQ08rQ0ht?=
 =?utf-8?B?Y2syS1lhWHBESWlWMFlWSDMxS1gyMzFXbnk1SExxOXBKWFhSVFpMbVlkZGFQ?=
 =?utf-8?B?Y2dRS0NaWVBaUFdpMkZkcldVMmJqOUV4bWxuaWEzYktoNVVoQ25FeUVBbEpV?=
 =?utf-8?B?N1I2Wm1IcWZWbVI2bDBxRFNuVlRQd2tvZlBRbHU4Y2JZK1hrWGNXT0tPUU03?=
 =?utf-8?B?SGlZbVh1bzdldklLY3dEYjBCblFDN1FlOEoyUWN5eFZhUkpPYWpkYk9VNlNt?=
 =?utf-8?B?UytwLzZ6MzRHRURIdTVIbS9RWjNqaWxCOTh0cU40UEpOc3JabG56ZWU3NWh4?=
 =?utf-8?B?K0N3SDZ4bjE3T0puMnE0K3hudDZSQnB6ejl5UHpLVE1YcktieFVFWVRKSVFQ?=
 =?utf-8?B?UVNrVlRpY0J3QWdDZDFrbUN3VlR2ZEVFOWtpNDFuWEo3TGVJdmdKeGNkVGgz?=
 =?utf-8?B?UFlnaEhFbS9GN2VKSjNpSWZNSXI4TEVJR0ptcnNYWnBXZXV4am1VNCtuNmxu?=
 =?utf-8?B?U0hjcnliMXRpWnF2NDFSR3lmdGN2MTRsTWE2dTVxbzV6ZWY3SDhIQ2VSTjdC?=
 =?utf-8?B?ZkVLalU4MWt0TU56Z21FN0FmUUUvS29PZTFjMHhObGRZM1ZTeUtaclNHMFll?=
 =?utf-8?B?MExCbWkvRFhwU3Bhd2RJQXQvZnBFMEl2eW8vUDMvaVkvd2xuaVdxZVFNc2lS?=
 =?utf-8?B?Vzc5WFg1aWQxM0xNdlRueFRMVUNQQlZyM1VuTENjdmdIOUx5dGJTL2w5d2Jz?=
 =?utf-8?B?ekRmWG9ycVlyaTVSdG5JVlVLWVVJUGlBQXF2TWx5aVJhU1pXWURmWkt6SmhS?=
 =?utf-8?B?V3VjUTJOUkpHTnJEYmp1VTV0Z0dsdk1yTWEzbFRERm1vRFYvOEVDRi9XZXV5?=
 =?utf-8?B?RUplZkUrMjVicUQ3eENGS2liQ1RReG84TVQ2SDVkSkdwYlZkam9lRzBRVlY2?=
 =?utf-8?B?MytmZ2t2WTQ0RytEaGxXUTVqZGQ2RmhIeW5vVVR4Z2xJMGRNZjJncEZDaG9Z?=
 =?utf-8?B?alpoZWxta3pDN3I4TW1QdytpVjJFSG9MdTBWREp0Si9aVFV5cUc0N3pSU3Zn?=
 =?utf-8?B?bnMwcUFPenZyelgrWXlvOTM4ZmZHUUdyV1V4L1pCMzNjVW9TN2lZY0ljY3NX?=
 =?utf-8?B?cGhicVNYZ29yK3NDeHRwK2ZjYjZ0UDlXWUdkeDJEc2F5b3BTT04rV0NiUlZ4?=
 =?utf-8?Q?QZgxqi8pSHo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enk5UkNIOUxoNy80NFNjU1MyTExmeFBMYkNSU0FGaXFKVjZEQ3duT3BFdHU2?=
 =?utf-8?B?R3dFdU5xUFdLNU5LNEF4S0lmdVlpK2lXVEdQeFFYTXNJaWl1Nnd3MTJkVWoz?=
 =?utf-8?B?cWJjL0xhVUNFTHpkT1JXQ2NLdURHVldrVTRBaWE4ZW56dEZCSFB1Z0lzdkNQ?=
 =?utf-8?B?dU1ReFpId0VIc212T0huZnY4a2cxbGNuUEtaRTZEWWVHQ0RIcXpzREMrSDVO?=
 =?utf-8?B?ODNGek9Va29obHcxM1lJUXFWK0RsL1ZUT0ZQZWd6VldHZWNLaElMczRmSEp6?=
 =?utf-8?B?NU9KcmhQNy83M3dDMys0VDc2Z0x5cFkvdEswSUp4ZFZReFcyTy9hZ1lzN0to?=
 =?utf-8?B?Q0VQdWtTMmRXSmEwbEtIWEh3VFJiM2xXREEzT3h5bG5xQno2VXdNUFJVZkJW?=
 =?utf-8?B?S05jN2REREprc0JTOFpUTDJoa3NTRkNMUDdFNCtyZmw1Q282WEpNWHBIOTZv?=
 =?utf-8?B?amcxNVBjN2Y2SUF5WU82MisrTjFSUjBhNHZkQ2p0M0h0dHYvVTJJQlZOdDla?=
 =?utf-8?B?c2x2THRrOUxsSHAwd2VjOXBKU09mUWxuOHI0MGR5NmhNVCtSQ1JpOU1wbnZU?=
 =?utf-8?B?dzlpeklMd1VYZWdlR3VaSXUrSXlFNFM0a2ErZjlFUEg1bzJhRUJZS1dCZWo0?=
 =?utf-8?B?QWl6WTYzTDZTRkhOazdCNG5mY2x3MDEyeDNLb052Y3NHMVZRTTlHaU5IL0Vs?=
 =?utf-8?B?bHhvek0yZ3BBUW93SHVVbjhubjdWV2hYcDlrRlJEUDVlamN3aDJaWUdVYlky?=
 =?utf-8?B?eWt5REJmNDFUZ1JMUWxwY1hnaW56NEdaNmlyVnVTN3pNR3hRR1F1V2kvTWw2?=
 =?utf-8?B?aGlvanl3OW8zY0dpSnljS3dHaVJDMkoxL2FKWURseTNhMzhhZDRxQnpuMkxK?=
 =?utf-8?B?T0VvSTlld2V1ZU11am9kVXl6ZkNZVXcyaG5Hb0IxMVVHbWMzVDd4eU52RkQw?=
 =?utf-8?B?WEM4b1drN2ZQMkRYd1diN05kZTczYVJlUEcwVTdCQ0tuMEU5TDFWQXF2bE1n?=
 =?utf-8?B?aHpuSlBKVVFYM0IrSnp6bEl6K1BqWDdkT1NYRFNhck5BaTU0S1RoQ1hGOXNj?=
 =?utf-8?B?ZmZWSUJ1SDdJTEpWTTdEeG94bGk3ZjZoYnl6MDdEOTNLRllCSUlZaUpVeGw3?=
 =?utf-8?B?TzQwRjFPUW55aGIrY0NLR2svcFpvWTJBUzVBWWVtSlNpS2M0OEJIS3FwT1J4?=
 =?utf-8?B?S3ZkWERuR1VKQmVubUtUTlBVdmxuNGc0UitoUWNMR2I0N0ZFbURMbnNhSDNa?=
 =?utf-8?B?RHRvREs2YUFBOWpxYjRhZlgvTU9kRFlMeUszaDVVRCtEQ1ZWejFXT1lSQVVF?=
 =?utf-8?B?ZllXTjlnZW5iUWNiNmxBcHNFS1lrYWRBMlQ2dHBWbEtzaFB2cy85MTFVcU16?=
 =?utf-8?B?cm1QSHBFcStpTlljSStISE1ydW4vZjdZWURZNU15VVZOL3MwZVdUeFhpTjFI?=
 =?utf-8?B?allWOHViVHVDZDRXamJKNFJnamJqOEIxOUcydnRyaEpyOGN4TldDam1pcUdv?=
 =?utf-8?B?d1RVSTdXZ2daSW55WXYxam5HQ2pDZitnS0JqY0RTNDN4OVVjdWJpQ3orMFJm?=
 =?utf-8?B?WGJNR1RHNHZ1Uklrc1A2S3dVb294TmlVRHdIVlZrSzlPN2RtS2EwYkkzSDRO?=
 =?utf-8?B?bVVXZWdYektONDVUd1NHV2hzUUpCOFl0NkVhYk9GaGZZMXRoamFCa05vdGNt?=
 =?utf-8?B?TlNhSllFcHBhN0p4UTNpLzlTdlphcUVubzA0blBFMWc1UGF5TzhRcDVLTFlL?=
 =?utf-8?B?RkZwdkIzSGw0MzRjc25sYXJob0I5TFlUVzVpeFhuRDIyd3pCb0dYQkhhaTln?=
 =?utf-8?B?bFZyMThWUUJOdC9PdmJxbk1aNnlSMk1hMGFsbklvVFJEWHhDaEdRaHcxMUp4?=
 =?utf-8?B?aVJzVHpxRmZhVHFETmVidDZSbFFrSGk4RDhCNGJmL2tqQ0xnRW40TUFMbHZU?=
 =?utf-8?B?cC90eVd0SEp1VDJLRkExZ2poNDN5STBEZ1BIUWJWS1F5UVBuemIvYXNSQnJH?=
 =?utf-8?B?RnZQZGFFMUZBVXFNK3NhTVJSdkppUFlQMFlkb0tRVkdKckwxNTNRUDNjL3dT?=
 =?utf-8?B?Yy9mTTA5WVZJdzR0cmY5dWtKTVordGF3VVVzQWZZNG8xc2ZxNllYK0swYUtU?=
 =?utf-8?Q?1rGI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ecdd2dc-2173-4149-1f96-08dd7c5c3a99
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 20:29:32.0250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f3ZUq5HiQECkO1CPl2isQNa4PcNltRUXxIXY4QUhN7kuvjlQa9dvuvkqm33dRq67
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4389

Hi Reinette,

On 4/11/25 17:04, Reinette Chatre wrote:
> Hi Babu
> 
> On 4/3/25 5:18 PM, Babu Moger wrote:
>> Create the configuration directory and files for mbm_cntr_assign mode.
>> These configurations will be used to assign MBM events in mbm_cntr_assign
>> mode, with two default configurations created upon mounting.
>>
>> Example:
>> $ cd /sys/fs/resctrl/
>> $ cat info/L3_MON/counter_configs/mbm_total_bytes/event_filter
>>   local_reads, remote_reads, local_non_temporal_writes,
>>   remote_non_temporal_writes, local_reads_slow_memory,
>>   remote_reads_slow_memory, dirty_victim_writes_all
>>
>> $ cat info/L3_MON/counter_configs/mbm_local_bytes/event_filter
>>   local_reads, local_non_temporal_writes, local_reads_slow_memory
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v12: New patch to hold the MBM event configurations for mbm_cntr_assign mode.
>> ---
>>  Documentation/arch/x86/resctrl.rst     | 29 ++++++++++
>>  arch/x86/kernel/cpu/resctrl/internal.h |  2 +
>>  arch/x86/kernel/cpu/resctrl/monitor.c  |  1 +
>>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 77 ++++++++++++++++++++++++++
>>  4 files changed, 109 insertions(+)
>>
>> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
>> index 71ed1cfed33a..99f9f4b9b501 100644
>> --- a/Documentation/arch/x86/resctrl.rst
>> +++ b/Documentation/arch/x86/resctrl.rst
>> @@ -306,6 +306,35 @@ with the following files:
>>  	  # cat /sys/fs/resctrl/info/L3_MON/available_mbm_cntrs
>>  	  0=30;1=30
>>  
>> +"counter_configs:
> 
> (mismatch quotes)
> 

Sure.

> This organization needs some extra thought ... consider that the section starts with
> "If RDT monitoring is available there will be an "L3_MON" directory              
> with the following *files*:"
> 

Sure.

> 
>> +	The directory for storing event configuration files, which will be used to
>> +	assign counters when the mbm_cntr_assign mode is enabled.
> 
> Needs more imperative tone.

Sure.
 >> +
>> +	Following types of events are supported:
>> +
>> +	==== ========================= ============================================================
>> +	Bits Name   		         Description
>> +	==== ========================= ============================================================
>> +	6    dirty_victim_writes_all     Dirty Victims from the QOS domain to all types of memory
>> +	5    remote_reads_slow_memory    Reads to slow memory in the non-local NUMA domain
>> +	4    local_reads_slow_memory     Reads to slow memory in the local NUMA domain
>> +	3    remote_non_temporal_writes  Non-temporal writes to non-local NUMA domain
>> +	2    local_non_temporal_writes   Non-temporal writes to local NUMA domain
>> +	1    remote_reads                Reads to memory in the non-local NUMA domain
>> +	0    local_reads                 Reads to memory in the local NUMA domain
>> +	==== ========================= ==========================================================
>> +
>> +	Two default configurations, mbm_local_bytes and mbm_total_bytes, will be created
> 
> "will be created" -> "are created" ... or maybe just:
> 	 There are two default configurations: mbm_local_bytes and mbm_total_bytes.

Looks good.

> 
>> +	upon mounting.
> 
> "upon mounting" seems unnecessary.
> 

ok.

>> +	::
>> +
>> +	    # cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_total_bytes/event_filter
>> +	    local_reads, remote_reads, local_non_temporal_writes, remote_non_temporal_writes,
>> +	    local_reads_slow_memory, remote_reads_slow_memory, dirty_victim_writes_all
>> +
>> +	    # cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes/event_filter
>> +	    local_reads, local_non_temporal_writes, local_reads_slow_memory
>> +
>>  "max_threshold_occupancy":
>>  		Read/write file provides the largest value (in
>>  		bytes) at which a previously used LLC_occupancy
>> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
>> index b7d1a59f09f8..a943450bf2c8 100644
>> --- a/arch/x86/kernel/cpu/resctrl/internal.h
>> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
>> @@ -282,11 +282,13 @@ struct mbm_cntr_cfg {
>>  #define RFTYPE_RES_CACHE		BIT(8)
>>  #define RFTYPE_RES_MB			BIT(9)
>>  #define RFTYPE_DEBUG			BIT(10)
>> +#define RFTYPE_CONFIG			BIT(11)
> 
> hmmm ... these flags are becoming quite complex. Even so, RFTYPE_CONFIG would be
> unique to this new feature so I think a more specific name would be appropriate.
> Maybe even "RFTYPE_MBM_EVENT_CONFIG".

Sure.

> 
>>  #define RFTYPE_CTRL_INFO		(RFTYPE_INFO | RFTYPE_CTRL)
>>  #define RFTYPE_MON_INFO			(RFTYPE_INFO | RFTYPE_MON)
>>  #define RFTYPE_TOP_INFO			(RFTYPE_INFO | RFTYPE_TOP)
>>  #define RFTYPE_CTRL_BASE		(RFTYPE_BASE | RFTYPE_CTRL)
>>  #define RFTYPE_MON_BASE			(RFTYPE_BASE | RFTYPE_MON)
>> +#define RFTYPE_MON_CONFIG		(RFTYPE_CONFIG | RFTYPE_MON)
> 
> Why is this flag needed?
> 

Not required. Will remove it.

>>  
>>  /* List of all resource groups */
>>  extern struct list_head rdt_all_groups;
>> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
>> index 58476c065921..4525295b1725 100644
>> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
>> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
>> @@ -1264,6 +1264,7 @@ int __init resctrl_mon_resource_init(void)
>>  	if (r->mon.mbm_cntr_assignable) {
>>  		resctrl_file_fflags_init("num_mbm_cntrs", RFTYPE_MON_INFO);
>>  		resctrl_file_fflags_init("available_mbm_cntrs", RFTYPE_MON_INFO);
>> +		resctrl_file_fflags_init("event_filter", RFTYPE_MON_CONFIG);
>>  	}
>>  
>>  	return 0;
>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> index aba23e2096db..b2122a1dd36c 100644
>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> @@ -1907,6 +1907,25 @@ static ssize_t mbm_local_bytes_config_write(struct kernfs_open_file *of,
>>  	return ret ?: nbytes;
>>  }
>>  
>> +static int event_filter_show(struct kernfs_open_file *of, struct seq_file *seq, void *v)
>> +{
>> +	struct mbm_assign_config *assign_config = of->kn->parent->priv;
>> +	bool sep = false;
>> +	int i;
>> +
>> +	for (i = 0; i < NUM_MBM_EVT_VALUES; i++) {
>> +		if (assign_config->val & mbm_evt_values[i].evt_val) {
>> +			if (sep)
>> +				seq_puts(seq, ", ");
> 
> seq_putc()

Sure.

> 
>> +			seq_printf(seq, "%s", mbm_evt_values[i].evt_name);
>> +			sep = true;
>> +		}
>> +	}
>> +	seq_puts(seq, "\n");
> seq_putc()

Sure.

>> +
>> +	return 0;
>> +}
>> +
>>  /* rdtgroup information files for one cache resource. */
>>  static struct rftype res_common_files[] = {
>>  	{
>> @@ -2019,6 +2038,12 @@ static struct rftype res_common_files[] = {
>>  		.seq_show	= mbm_local_bytes_config_show,
>>  		.write		= mbm_local_bytes_config_write,
>>  	},
>> +	{
>> +		.name		= "event_filter",
>> +		.mode		= 0444,
>> +		.kf_ops		= &rdtgroup_kf_single_ops,
>> +		.seq_show	= event_filter_show,
>> +	},
>>  	{
>>  		.name		= "mbm_assign_mode",
>>  		.mode		= 0444,
>> @@ -2314,6 +2339,52 @@ static int rdtgroup_mkdir_info_resdir(void *priv, char *name,
>>  	return ret;
>>  }
>>  
>> +static int resctrl_mkdir_info_configs(void *priv,  char *name, unsigned long fflags)
> 
> Why a void * instead of struct rdt_resource *?

Yes. Will change it.

> 
> Also please fix spacing.

Sure.

> 
> Also, why do fflags need to be provided as parameter? These are so custom I think the
> hardcoding should be contained here instead of the caller. With this the function name

Will remove fflags as parameter.

> can also be made specific to what it does ... perhaps "resctrl_mkdir_counter_configs()"
> (please feel free to improve).

Sounds good.

> 
> 
>> +{
>> +	struct kernfs_node *l3_mon_kn, *kn_subdir, *kn_subdir2;
>> +	int ret, i;
>> +
>> +	l3_mon_kn = kernfs_find_and_get(kn_info, name);
>> +	if (!l3_mon_kn)
>> +		return -ENOENT;
>> +
>> +	kn_subdir = kernfs_create_dir(l3_mon_kn, "counter_configs", l3_mon_kn->mode, priv);
>> +	if (IS_ERR(kn_subdir)) {
>> +		kernfs_put(l3_mon_kn);
>> +		return PTR_ERR(kn_subdir);
>> +	}
>> +
>> +	ret = rdtgroup_kn_set_ugid(kn_subdir);
>> +	if (ret) {
>> +		kernfs_put(l3_mon_kn);
>> +		return ret;
>> +	}
>> +
>> +	for (i = 0; i < NUM_MBM_ASSIGN_CONFIGS; i++) {
> 
> This can instead work through the resource's evt_list and use a flag (TBD how to
> adapt "configurable") to determine if a directory should be created for it.

Yes. Will look into this.

> 
>> +		kn_subdir2 = kernfs_create_dir(kn_subdir, mbm_assign_configs[i].name,
>> +					       kn_subdir->mode, &mbm_assign_configs[i]);
>> +		if (IS_ERR(kn_subdir)) {
> 
> IS_ERR(kn_subdir2)?

Yes.

> 
>> +			ret = PTR_ERR(kn_subdir2);
>> +			goto config_out;
>> +		}
>> +
>> +		ret = rdtgroup_kn_set_ugid(kn_subdir2);
>> +		if (ret)
>> +			goto config_out;
>> +
>> +		ret = rdtgroup_add_files(kn_subdir2, fflags);
>> +		if (!ret)
>> +			kernfs_activate(kn_subdir);
>> +	}
>> +
>> +config_out:
>> +	kernfs_put(l3_mon_kn);
>> +	if (ret)
>> +		kernfs_remove(kn_subdir);
>> +
>> +	return ret;
>> +}
>> +
>>  static unsigned long fflags_from_resource(struct rdt_resource *r)
>>  {
>>  	switch (r->rid) {
>> @@ -2360,6 +2431,12 @@ static int rdtgroup_create_info_dir(struct kernfs_node *parent_kn)
>>  		ret = rdtgroup_mkdir_info_resdir(r, name, fflags);
>>  		if (ret)
>>  			goto out_destroy;
>> +
>> +		if (r->mon.mbm_cntr_assignable) {
>> +			ret = resctrl_mkdir_info_configs(r, name, RFTYPE_MON_CONFIG);
>> +			if (ret)
>> +				goto out_destroy;
>> +		}
>>  	}
>>  
>>  	ret = rdtgroup_kn_set_ugid(kn_info);
> 
> Reinette
> 

-- 
Thanks
Babu Moger
