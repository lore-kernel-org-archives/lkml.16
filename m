Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2057.outbound.protection.outlook.com [40.107.100.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193941A288
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 07:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747986659; cv=fail; b=ODXn9cc5/IGb2zuibslVXJIvRskz0XJ7ltizPHkKIU788VFeELG3DizJSHJBr2uDK96Oy6n8iwfUuySDWfrZbQl76Gc7R2KxwylmByfxajcOq7bSWmSnkN6bmN8Y3OP6Lq5wRcJIZF074hHVWa1A1znj+f3oJa4rTl1dViubY6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747986659; c=relaxed/simple;
	bh=1bxWXPQ2i2mmxaGyXm/AJgMhkoHsA0le7lcsAN+MP3o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nZE3VTQi4Aqmdi6PtObug6YvCIUdNH4daa0zb9V4R+M44FywRvJoc7s0WDPmL69eWjWbyL4pdwyXDZjq5kM1hcrCVap5T8lM0ai61pK8hz/iPGFDxQNkPoGkR3oOv67oTHMO9DyvR92y/JlfjUHNON8POtwIUT3sqxVheLrsghs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Ld1lr3Oi; arc=fail smtp.client-ip=40.107.100.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Ld1lr3Oi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENYkbNbnMtF87vM9w5uFTa0aQ9XMWupeAf9ZDTYRmbcuW2NTdvkaun2hinBuwWxfC7EPEWjjChADxag+MgrfLYGR8Sf7ZkM4XfZZAdsEY/Sk0SdiRMFFCKjUkngeTcw2aEQLyr/80owweNKA6igXoNCr1g1HBtFh36T2tlv3fUbYsvhNjtffOeI9DwpSPBDzTWm6P/Uyynbjv0AW9cSUddt5haN6ZD6TKlaWiLVUdGEM0GfQlyv3jRnEivz8ClWUrJKWEHSkaMI3f2VNRr5KRgjsaLn5C7ij3IdOWoGgrXa7KPWv2BEn9zi7ooQRCTDkfuKuUDljhHVtgTv5dRWPfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOLmFnnu6kgtb5X+aMkpnOjQC6ZO8ZCAEXrgga5zpfU=;
 b=OgX9Ym2ggK/rYsKO4jQpHiqfJcTM9ittxM3FlpUkS3Lt8986o4jTvHgL9rgCTX1pS/RdaCtPR4OyNN8BDenXT9VT2yw17WlIzJ10bcZ237t/dtZQRMI+JQTbYptaLB+VHPfpZSVx5RAG7EvqjoSwQ1WSqsqHK9EvyI+RjV1Nk9SXmGc5QGdi+FXTHGKkQKhOXprQqTwyXGqyPP3AEw6har+/FtSPu2suh7GTbDfU79ZmpVEfwt+pZ69qHUfO/oROsz/iSEBQumrG28015Z3VhlsmblzPWJ3wM7WICdQ3eIdHWdaCksIscsEAZ6DSL2x3cIakdEWtQBQRSnPyISb9Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOLmFnnu6kgtb5X+aMkpnOjQC6ZO8ZCAEXrgga5zpfU=;
 b=Ld1lr3Oi4h5N/g2bJXui40d7GtNpBzkiehAhpt+8PyPkj4KmGjoVsjK+Bpz/piMRcklnJxooSiGSuKMlPxoSSEfZQge2Z7sJmpEY2k+CEqQL2YMuSTN/V49TKl4rducRVCcFn4arBNIkvx2MB3O6KiFVnUCjDA6jATvBTwN5D4w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8)
 by CH0PR12MB8531.namprd12.prod.outlook.com (2603:10b6:610:181::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 23 May
 2025 07:50:55 +0000
Received: from CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870]) by CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870%5]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 07:50:49 +0000
Message-ID: <a37c6fa2-ae90-401a-bb7f-54be2c603a80@amd.com>
Date: Fri, 23 May 2025 13:20:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/khugepaged: Fix race with folio splitting in
 hpage_collapse_scan_file()
To: David Hildenbrand <david@redhat.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, dev.jain@arm.com
Cc: ziy@nvidia.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, fengwei.yin@intel.com,
 bharata@amd.com, syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com
References: <20250522093452.6379-1-shivankg@amd.com>
 <3eae6bb7-4865-44c2-8603-dc2bd8e3609b@linux.alibaba.com>
 <a3e9e11e-1e8e-42a5-bcc6-e5ad97b4e4da@redhat.com>
Content-Language: en-US
From: Shivank Garg <shivankg@amd.com>
In-Reply-To: <a3e9e11e-1e8e-42a5-bcc6-e5ad97b4e4da@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXP287CA0016.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::29) To CH2PR12MB4262.namprd12.prod.outlook.com
 (2603:10b6:610:af::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4262:EE_|CH0PR12MB8531:EE_
X-MS-Office365-Filtering-Correlation-Id: 73f1a3d9-cbf6-4f58-ecdc-08dd99ce87ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Tlg2VnNBWWtEZC9BdWMyOVZBazFrWWljUzdyS3hvWnZQZTk1aUsvdnRJVzV5?=
 =?utf-8?B?MWVDVVRMVk1PeVdjcm9hL3h1ZHNudk54b1ZHQVE2ZW5yNTVKUTdVYlhoWk96?=
 =?utf-8?B?RVg2MmxUUHFuY1cyRFpuN1RaajV5V1Zrc29CNG1NVktLSkhYcnIwa0ZQNUw2?=
 =?utf-8?B?WFQ2RUJTV2ttUi9CUHo0SUUyd1hLbXBZVkZHcWF5ajBva2FiWWNFdS9FRkYz?=
 =?utf-8?B?K2JvRWo2Kyt4Qk93T0xPeVkvVk0rdmg4Vnh4R05PNCttMmJRdVVKMFNUeFBm?=
 =?utf-8?B?dVRxSDBEM2ptWEZNZjFuaGMvYkZEcnZUelNnbGZGdjdHNUtIOHdXRmlxbGtN?=
 =?utf-8?B?cERoN2E3cFlrdFZrTDdoTXFQdWZKY0NROWpoUldYaEIzakVvUTNCcDlucjZk?=
 =?utf-8?B?TjMvejJsNVRVR2ZTT0pmbThybGtTYmY0STExV09SOVF1djhKL0ZnU202RWxO?=
 =?utf-8?B?R2R5U1FMK25ZdTlkaDJBNHFNRnlUdDB6TllwakRFUk56UVBkZFZsMWNpSFkx?=
 =?utf-8?B?ZGhVemFWSjFOdGY5Yy96aXVvdWJEM3EvdlJrWlgyU2VJYmtkb05RUnZrMGJm?=
 =?utf-8?B?VGNiYUQvNXNOWktMKzZtcUhwbEQ0NE11YVE2ODNhT3lKazFKZFJOUTVjUEw5?=
 =?utf-8?B?T21ySjNpZU9JV1pHUzNlaW0vZGFKLzZUWmxjTWJla0FQVllhS0pOR1YwTlFw?=
 =?utf-8?B?cTkrVkpjN2llSjZPblJ0WFFzcGJqSTB1bG1OdG5oUDFsS29RQnA4eC95WDFz?=
 =?utf-8?B?dlZPL0ZTWWFZZEY4RUE0bTVTbEpobTdpbllrM3dvUmFhbDdXdTcyNGp4eHkv?=
 =?utf-8?B?bEcrb1ExS2htb2FrN3VuSjE3YkZNcEdoUWVJYWthNW9OOTBiWThvVDlhdUhZ?=
 =?utf-8?B?TDVVNEJqK2xXV1NaY3ZOQ0wvT3cvbnMzV215dE5SUTJNc3hFMkdTL2dRcFdr?=
 =?utf-8?B?QzR0VTlQSXZ1bkFsOE9xQW0rVlRZU0JkQ2JmRW1zaXlQOCtrQUJNVXhEeTk4?=
 =?utf-8?B?b1dsSjJNcHpDVUVuTzdNdEMrL21DQTA1alMyUDJVYU53d0RlZHNoZ21GZS9l?=
 =?utf-8?B?cXNHU1NibjlwWlgycEVSd2FlRHF4MGUwTnRtWUZYdzRYd09nZzMyWlhtai9Z?=
 =?utf-8?B?SVVwOVd4S1BaNTZRQ2FGbk9pTHNtTFlVNTdRQWxEU3cwb3lwTS9TYlpVRVBt?=
 =?utf-8?B?emU4ckgwZlZobTUwNkZZRlFacFFodEJWSHErRVB0N1RKNVJwK0RaUWVmMlUw?=
 =?utf-8?B?MHZ1dlNkUDBqVlovWUxqSVVIM21aMVIzRjM4NEZ4ZXlteVFDQ005amsrTmxi?=
 =?utf-8?B?NElXZWRremdmMTdoL2FUMnhFNFZtZ2FVNDgzeEVPMTNpV1VKL2EwRnFEK1Bj?=
 =?utf-8?B?aFk3L1ZZUFVxSFhJeTFQRkh3bndyYktvUlNVMk9RV1FsUTdkdEFnUEl1Y0c4?=
 =?utf-8?B?Y1JvR1hJaFM1NDczM0o1OGdia2IvY2dPdm84bGFmeW5udmpNcTZQMWU3NDlV?=
 =?utf-8?B?azk0N1RrZ0VTT3Q1OWRDbkM0dDhtTWdjM1RnZmhnMzdOamZOSTRLZ1hrNFh3?=
 =?utf-8?B?UFVOOGlHTVVxa25tazFQMENwZzFkNFoyYisrRVNaWGtpdU5MM3FvdlE0WHlV?=
 =?utf-8?B?dEMwYUNRVDFMdTVmTmZJQitNeGVpUXJHQnFFVFdpQW1od2VJZ2ZZTmRTanhK?=
 =?utf-8?B?V3A2cnhFL1pMSHlqTU80cGg3N2RIRXd3VUFwSWIzSVEzSUhoYm9JN1M0NlVm?=
 =?utf-8?B?VUhHQkJkclRycW5PMU0vYUZZTGV4TUdzMDNjU0pkN2JsV0h1ZXZlNG9WQTJ6?=
 =?utf-8?Q?nynzyEocGQxUwESJAAALqJqOpKXCtEP2q35jc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4262.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWM4OHNURElOaHBZUkdUU3o0a1E5REtKWDNWcit1eTN4MWtwZFNpaEJPK1Nq?=
 =?utf-8?B?YzhQTkltYVdRN21oOStDRTJTZlpvMDlkSTk2eHJKK1JOVjJKNmY5alJ1b25z?=
 =?utf-8?B?NzRWTzREejl0ZHE5N1lHUUE4MWhwcUY2M2xXeXZwbm9weDljdG1hci9ZbzZG?=
 =?utf-8?B?bEtIc0lXNS90ZjVVbE1GMi9oTGh5VmRVbmFqbDdMSmIrME9NK3d4ZVFuN29v?=
 =?utf-8?B?VmRnSjJaTE00dERGYllPMHZ2Q1dLd2FENkorWVN1VmpTZmp6S0dHT3J1VnpX?=
 =?utf-8?B?VUxKckY0d1loaUViY01FZWp2NlZGNVl4cUdVYVIzSVJ2TkR4M0tXeFdqei9R?=
 =?utf-8?B?ellJblhqSjZFMEZUTFNhYmpFOHN6bTQwTVBJNVJVUTZaR24xVmJaNkE3U3I5?=
 =?utf-8?B?K295dXQxajVqbXR5d2p4Zm8vVE90SmI0bkdya2JBVmRWa0JYMzh1NXc1cFFo?=
 =?utf-8?B?NmxvN3VaQ0YvWUJBR3F5UGtkd3NNREdXRk4xVnJRalFBemllckxCTG9ZcDhP?=
 =?utf-8?B?eUdBWmIvVW05KzBiWEM0N0RnekRKNEJvSlVNMnp0ZWZFcVpBd0s2c09XdjJo?=
 =?utf-8?B?V3B2d2FKcFdGVmFKWkwwMkpYa0c2VWc5aTMwTHViR2p6eGhMaGx4R29MNUxt?=
 =?utf-8?B?bXZTNGx3QVpEVXF0dmZIRHROalJKTW1pQXFML2cyYklNMlpNQUhhWHV0RU1J?=
 =?utf-8?B?MHRFZnU5ZTBIaTh6VlpsQlpVQnpBWWY4bFZ5MVMvUXVUZjQxY3lmVFhMZHdW?=
 =?utf-8?B?Y1ErUDlheGQyeXJEbGo1QzRGbWZwR2xEd2VERU52SjVLYVRPVWlIWk1MNGYy?=
 =?utf-8?B?cGNXNHlYUlRoTU9sdnRCY2lpR0VHT1pmUXg1TUtiMnFTSEZuREREVmVWV01u?=
 =?utf-8?B?YzFPRXV6VFZvNWYwYVdSbXpHRGlHNW9iNko4SU4vN1ZsZHdERGFYbUlKNHJv?=
 =?utf-8?B?K284UEg4bnE3cElqRjZvTGNhQ0czV09UQ1kyenk4clJOek9HQWVyaGtYOEUr?=
 =?utf-8?B?czJYZnNnUC9RV2cxajRvbHA3QjZ3cmxvZlZZVzJJYktNNUI5VFdkZXRUTlNU?=
 =?utf-8?B?S21xUlV0dnlmV2NVK2wyaHNzUWJwR1BKMjZKNityVXhNRXIyZndBc1RpSnZ3?=
 =?utf-8?B?b1d6UER3MlRodWtqQnp2WmY4dEVuVjMreVgzRXZzeW94VTc5TVMrV0RObzVo?=
 =?utf-8?B?WldzSWxhaUxjTER6OWM5SEtDSkhGclpqdTBQWVNPdkdZQWpCTGpnVlBHV0FH?=
 =?utf-8?B?OHNJMU9TamR4U0JSOHVBdzEvUEU3UEtETkFpSjJPVHlBZE5kUnR6TWlVZ3lV?=
 =?utf-8?B?dWxHME5mSDczY0xuMUJ3bFBuTFVjNlV5YmZtbk9qKzRDQU5tWUJwdW90SnNk?=
 =?utf-8?B?bHlvbThhUzNTelRJZDRDblAxOXM0RCtJdmk0eDBEa2p5TEVGY1daK1M3TUpP?=
 =?utf-8?B?ZXZ5cW5zY3RXZGZwc3BiWFVyeG5jNEJMYURwT0tkV3d6Z09HYkJIM0RxaUxZ?=
 =?utf-8?B?WEl6Q2NDUVVRaXZVRjBheWJ5MzJ1TndpT0Z4ZFZvcGwxNVVEMG8xYVVXRnF4?=
 =?utf-8?B?aEJjZ1QyZzVEbWpDdFUycTFqMnQyU3lsajk1cmxQN3ZqRUxUMGdqMlU2V1pJ?=
 =?utf-8?B?NTJaWUh3UkhjTDVPbjZPaUZxN282dWtQTyt5MFM2K0g0WFk0dDZuam1yQm1z?=
 =?utf-8?B?OVBEaStoeFg1QktZMG5kWHZ3WG84NXFuSTRFTlJZQjlFR0FCN1FBUThxdW8r?=
 =?utf-8?B?R1k0cWxPQmh5WHRiampZb3NacTBmaWhMbDhjOTg4OExmSEZSMFFMbHhrWlQ3?=
 =?utf-8?B?ZmEyZjNpN3AwampzTjNZdHVQM005K0R2T2FINURNdHhFeDBKYzdaLzNiUmd3?=
 =?utf-8?B?aEVKS1duZGJlNVJ6SjhxeHhOVWRMVmtmY3Z5NDNJWEptcllURFlHa2phbGg2?=
 =?utf-8?B?ZUdYdjFGNkxzcStkU0h2WGNxWmRqYngvanZDdlRsS0R3aStFakpjenIycWJO?=
 =?utf-8?B?UUJrOUhwQkJuZkVxMmlGQlVsQTFVYUxqcFBYUysyK21XZzU4L1V0STBzTVMx?=
 =?utf-8?B?cWVrd1dLcmJEemJMb1J5cWc5RGFacXAvR3g0cW9rdU9LOTQ3TTROZ004ZnVk?=
 =?utf-8?Q?jYEmo9WxuWJS9iFTKTuIlRZDG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73f1a3d9-cbf6-4f58-ecdc-08dd99ce87ca
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4262.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 07:50:48.6460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2t0seBqJinr6Ew2zPxC40H8j3GRJc1ZGSBaVI9qxIYzSFQpfr5JXa0TEhPtn7ndRqLrh0jGbN8/B7GyAaTeIvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8531



On 5/22/2025 5:29 PM, David Hildenbrand wrote:
> On 22.05.25 12:01, Baolin Wang wrote:
>>
>>
>> On 2025/5/22 17:34, Shivank Garg wrote:
>>> folio_mapcount() checks folio_test_large() before proceeding to
>>> folio_large_mapcount(), but there exists a race window where a folio
>>> could be split between these checks which triggered the
>>> VM_WARN_ON_FOLIO(!folio_test_large(folio), folio) in
>>> folio_large_mapcount().
>>>
>>> Take a temporary folio reference in hpage_collapse_scan_file() to prevent
>>> races with concurrent folio splitting/freeing. This prevent potential
>>> incorrect large folio detection.
>>>
>>> Reported-by: syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com
>>> Closes: https://lore.kernel.org/all/6828470d.a70a0220.38f255.000c.GAE@google.com
>>> Fixes: 05c5323b2a34 ("mm: track mapcount of large folios in single value")
>>> Suggested-by: David Hildenbrand <david@redhat.com>
>>> Signed-off-by: Shivank Garg <shivankg@amd.com>
>>> ---
>>>    mm/khugepaged.c | 16 ++++++++++++++++
>>>    1 file changed, 16 insertions(+)
>>>
>>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>>> index cc945c6ab3bd..6e8902f9d88c 100644
>>> --- a/mm/khugepaged.c
>>> +++ b/mm/khugepaged.c
>>> @@ -2295,6 +2295,17 @@ static int hpage_collapse_scan_file(struct mm_struct *mm, unsigned long addr,
>>>                continue;
>>>            }
>>>    +        if (!folio_try_get(folio)) {
>>> +            xas_reset(&xas);
>>> +            continue;
>>> +        }
>>> +
>>> +        if (unlikely(folio != xas_reload(&xas))) {
>>> +            folio_put(folio);
>>> +            xas_reset(&xas);
>>> +            continue;
>>> +        }
>>> +
>>>            if (folio_order(folio) == HPAGE_PMD_ORDER &&
>>>                folio->index == start) {
>>>                /* Maybe PMD-mapped */
>>> @@ -2305,23 +2316,27 @@ static int hpage_collapse_scan_file(struct mm_struct *mm, unsigned long addr,
>>>                 * it's safe to skip LRU and refcount checks before
>>>                 * returning.
>>>                 */
>>> +            folio_put(folio);
>>>                break;
>>>            }
>>>               node = folio_nid(folio);
>>>            if (hpage_collapse_scan_abort(node, cc)) {
>>>                result = SCAN_SCAN_ABORT;
>>> +            folio_put(folio);
>>>                break;
>>>            }
>>>            cc->node_load[node]++;
>>>               if (!folio_test_lru(folio)) {
>>>                result = SCAN_PAGE_LRU;
>>> +            folio_put(folio);
>>>                break;
>>>            }
>>>               if (!is_refcount_suitable(folio)) {
>>
>> You add a temporary refcnt for the folio, then the
>> is_refcount_suitable() will always fail, right?
You're right. Good Catch!

> Indeed. Would one of our MADV_COLLAPSE selftests catch that?

The status of this one test case changed from PASS to SKIP
with the patch:

./tools/testing/selftests/mm/uffd-unit-tests
Testing minor-collapse on shmem... skipped [reason: MADV_COLLAPSE failed]
Userfaults unit tests: pass=65, skip=1, fail=0 (total=66)

All test cases in khugepaged.c PASS.

In cow.c, Test Case status with or without patch remain unchanged for me.

# [RUN] Basic COW after fork() when collapsing after fork() (fully shared)
ok 758 # SKIP MADV_COLLAPSE failed: Invalid argument
# 1 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
# Totals: pass:769 fail:0 xfail:8 xpass:0 skip:1 error:0

> 
> We should also be converting that code to use folio_expected_ref_count() -- either directly or wrapped in is_refcount_suitable().
> 
> Likely just here through
> 
> if (folio_expected_ref_count(folio) + 1 != folio_ref_count(folio))
>     ...
> 

This makes sense. Then is_refcount_suitable() will not be needed.

Thanks,
Shivank




