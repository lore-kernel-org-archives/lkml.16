Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2053.outbound.protection.outlook.com [40.107.20.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F8818FDD8
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747238375; cv=fail; b=kh4G9HlRuEbeKhu/KJ7qZI7q7uDbMgmipAwSsXW369SL4gJUnncDlm8WZdcTE5F4nFEf7oh+CmdO8NlM9Burc4j/WXUuXzNoClcpTAJDWhQ4Ka9f3NoN7NNERus0Ycm3798F/1ZfWFcxmguPitrPZTnaHh0MybDuiLmbkHsvPm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747238375; c=relaxed/simple;
	bh=7WKAlL4FbazsiGoCSYTTje+0JTWOAkb027ZB8Fp9110=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PDvfhiNxM30l/RFhSxwcV6o+RrCbsgSsyTgd3CZyXnJMH7ug83rUCv3W1ndbYAXx5uqo3VhIS+jd/wxyLym6GkzlJ3zo/JK2pwq++6m9xrFW795r5nntrKsqi9LeeN4Csr2qfk4iU9R3cXL+6i/Do6Cj5Lq2ZGKpW3L5S7B+r/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kuka.com; spf=pass smtp.mailfrom=kuka.com; dkim=pass (2048-bit key) header.d=kuka.com header.i=@kuka.com header.b=n8jhkuZ7; arc=fail smtp.client-ip=40.107.20.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kuka.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kuka.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kuka.com header.i=@kuka.com header.b="n8jhkuZ7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QVxYqybvQLxRY2vH7aIOa88VXZxji7PnGf4d5Dkdv39fc3gDj+9eqi/PgQhhp5A/ULXQkvbPxgUVdgXZpc8hBAVua9PIna92as4lvEjrg66EkJOJfV4eO/RE7T9d9lA6WqfBdBVVXncAfTXxeUcR4QEiPC5onKVMtWdJAPWO1U5taLnOHSfaP3OJBp+/9vHq5vcxBY8eFY81YabbASIL+8t5cgPKUS/uyIz+t7bq3OfM6sbw02/vMle3UWU1q1JBN6jSIO+g0IGV8f7c9SRI6x9N2UE85XSI8j2u14Fr5KxOAwVqbtmJNpI7YvZgEV4SeOUPsbjghf37tXM7n4B8eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pxD325w14Mcg1vrFGm+eNP/tyTAm4xkuLaFTb4NM0Qk=;
 b=BLV/sgUYBPfPqLI2qgw5X1GnTZhYU3PX8Pdkvom+ytqLCaE7b2Inq4k46DvuCuFAO7jQEKD7JR7g30r6sm0Bf+Ypn1aIjOWy3sLf1fOTlbuVmxFe9Y9BzVPEKnD3kV2LN9BnuTWuOXdbu3VTVrZfdWscg9e73wo0b3QPMtPCa9aBqVxu65mYFG69yIhbWcv+y4JLy1RJJyEpNJr3NXbXj50XLuVOStkyAyfBoqfdTqiZt0/LRQnpCx2rnM89b6IBxc1gyWjWr0c7LpENudk/o+6ZQ8Otxkk+jeMQ2+OohJZx3Tu0AgaJ+DrpSDnQVewkUueImM+pkMfQ/7mN1OBDDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kuka.com; dmarc=pass action=none header.from=kuka.com;
 dkim=pass header.d=kuka.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuka.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxD325w14Mcg1vrFGm+eNP/tyTAm4xkuLaFTb4NM0Qk=;
 b=n8jhkuZ7DC1Qt5eqDMEkg9OEIaXApZdUq6ozPCQuzsIVoewAH+cBNoWX+OnkcaK8zjOeIJgnfri5MepGZiO5HXsponVwrTA1IaWRp4myMXbpS95q18ik9/8tB7jZtW4WmfiBltA8YDNJaxPk9f8wiUtWO578n7JU4pHY3JCwxBvRfSRO0bL9s8+VxZY3zZxR6YpnlNjfztRUHL5S0uIoHBWHK12h5Ck8CvNp0vjEMqw9z9PxJXnagWL4FeUzjslPV8bUstB51rCCNcgEygqTe8I2yIGMS3lZRQl/6tgF80H9oSyK2ycrvBXgwUqrD2C2DmbTkWCaRnYpwO73gB3zSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kuka.com;
Received: from VE1PR01MB5696.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:123::12) by GV1PR01MB10664.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:16d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 15:59:25 +0000
Received: from VE1PR01MB5696.eurprd01.prod.exchangelabs.com
 ([fe80::ac38:4740:6a66:b5ba]) by VE1PR01MB5696.eurprd01.prod.exchangelabs.com
 ([fe80::ac38:4740:6a66:b5ba%5]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 15:59:24 +0000
Message-ID: <b12548c7-9f1c-48bc-a728-d169fcd5e16f@kuka.com>
Date: Wed, 14 May 2025 17:59:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: madvise: make MADV_NOHUGEPAGE a no-op if !THP
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, yang@os.amperecomputing.com,
 willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250508-madvise-nohugepage-noop-without-thp-v1-1-e7ceffb197f3@kuka.com>
 <3ed9ff7f-d360-4bca-9805-b70cf51cb023@lucifer.local>
 <106c0d2c-7492-4a81-969c-de4f1798586c@kuka.com>
 <42872c96-e9c5-4c3c-9095-3f12202dd803@lucifer.local>
Content-Language: en-US
From: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
In-Reply-To: <42872c96-e9c5-4c3c-9095-3f12202dd803@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::20) To VE1PR01MB5696.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:123::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR01MB5696:EE_|GV1PR01MB10664:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e27f896-54e7-4164-81f9-08dd93004c05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VEw3MnUzOThUbE1FWEFoTnk2ODJRYlE1QlhYM2ZlZ2Z3V2c4Q0hCenNhUUt5?=
 =?utf-8?B?d1lkN3RmSnhvVHJtaEVueWhUcUxFSjk4RzdWRERFbjJPajZsYXRkdll5RnFz?=
 =?utf-8?B?MFF1aVI0aEZUTllNZjNMRkE5ZnhpMSswbjhyRVVzd3VlY2ZpYThlamdsUFB2?=
 =?utf-8?B?TzBZc1lCK3l2K3Y0emh6NmNiSGkrSUpmbEVkdG1OUi9HbVBBV1VZUzNYS1BB?=
 =?utf-8?B?TUY4bFVXM0ptejAydWVMbFg4Y0V1MHY4emlCZ0V3clBkZGptNEhvaEVQdGpT?=
 =?utf-8?B?QWNSMnZVeGxDQ3YvRmw1SWFCY042M09DMDFhWm5QNkRUYWNWZVdyREwrUzFn?=
 =?utf-8?B?Zk5VY1RZWVp6NzhLMURGdzlUUWNVeGlsejFaQm8yOEJ2VWJuazc5dERwVmo5?=
 =?utf-8?B?Q21RYjZhOFNHTjRuR1V1cXJFQUtFUmh3a0h3ditxV2trcFFGaHd4d3FoY0U1?=
 =?utf-8?B?ZlFvMzJrM3UzYjVYQ3JOaHVWbXREYWl2NmlKWGVTNE80VmtTa05TOG1OK1BL?=
 =?utf-8?B?WGQ5WTBsUEJwTkZpVlJ0M1QvZEU2Q2VSSEhDb1Njb3ZxQnlJYlZBWHg4TEJn?=
 =?utf-8?B?SEZXR25OYmlXSGRoRXlncDJFNUVYZXU3S2FHenFBRGJXOG9xZ3hKR3l1c1FS?=
 =?utf-8?B?aXdWNTAxYlg2N0FwS1JrRWt6LzZYTVF2V0FSZzZrR2NlYmx3ZFBkMU1nVEdn?=
 =?utf-8?B?bnRISVdzNkprb0Y0eXNlNTc1WlRUMlByT3RoM3A1MXJVVVg1STN2MXJiYnpi?=
 =?utf-8?B?YjBSQXdtVFJ4WTYzTW50T0MycXVLUWx5eW5BRlBGT08vTlFFcVVWOVFZTXJv?=
 =?utf-8?B?MGFWNDhKam1MOXBPdjlVaitLUGhpakJIY051RC8vVkJBQ2F2OFQ5a2NpSld3?=
 =?utf-8?B?OFk5TVR1ZDd5ZXNmZHMvQVdBVS9YOVVzekFBUEhDR1IwRTR1ZlJ1OWo2bkMw?=
 =?utf-8?B?NCtVeGNTRXg0M0FHN09lbE9vbWlKY0lienUvVG9wWjFlN3p1YnNHWXpDTkpl?=
 =?utf-8?B?VWhWQkxYRmxLUmE0ZUVHYWdMa1Qxa1ZLaFdUUEVGdjkrOHFIZGNGenRkNUh5?=
 =?utf-8?B?anRGV3p4VmZleTFMcWV2ejZXejJiQlBXQU12NitGOTRNL0RFTE9zcFBOanpY?=
 =?utf-8?B?SlhzZ21ZMVpOak14U0RDR0xJZ0JQN3lDekxZRHducityMGFOc3g5Mzgzaytj?=
 =?utf-8?B?L3o5MTg4VjhUdVRyWlBsdVZObzRHNUg1SHZadHRKUGxjSm5nYW56VVdYL05s?=
 =?utf-8?B?WERqRjV4NXhNNStRTG5Fc1krTUM4NzFEMjQ0ejlJaDM5QkU0bFdYbEtQUDdM?=
 =?utf-8?B?SzNXM2ttOU1qOFRRTFcyZ1ZMQ3ByZEFUTnE0SVB4aXQvRWI4RnJpWXF3bnUv?=
 =?utf-8?B?bm9YK0hkZVV4c3ZldnJCakc3OWY4UG90aW5DUWFCZWNWT1E1eW9xQzlBWVVp?=
 =?utf-8?B?emE2WHBZNFVGWm8wWjdjcXZWT2xNK1ZSYkdPQk1VRnZOVkp0Qmwycm1KVmY3?=
 =?utf-8?B?eWQyNXlGalJWRnF1T2puYVZJd0VLQUlRazl6MWJMWmxKNnpGYzJTNmprbE9z?=
 =?utf-8?B?ZFIwVHlBblprS3l3azNLQ21zUmRJZzhXOW1DdGVYMW1rUFdQVmJvbzFlNkI2?=
 =?utf-8?B?R2ZqNjEzU3p4YnJnSUJPMXIwVzJYTlNxbWtYSklkTlE4OTRqQzRHVG5HMnJR?=
 =?utf-8?B?MVhkSEJFUSswc3hDYzhMTVVtOEorN2QrVTJxb0dLc1FQamRtb1c0UHplajJs?=
 =?utf-8?B?MUlXZ2JMRVJFZ251ak0rTDNMUGhodVdlVVVHQzdtQS9uamUyaTZIc1J5Y1Na?=
 =?utf-8?Q?7RHqBnOyrDqFDoDZRuZXcH9VDZ7uovZF5WmfA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR01MB5696.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHNRUVlGYndhRGJsd2VHRzVqb1hVOElXamx3c1c3ZUJ0NUJrSlpXNnFKYWp1?=
 =?utf-8?B?cXhMZUV3cVorR0hINnhyRmtBWG4vQnI0RlpKY2RrWDBucVhkdmhuNHh1N2Mv?=
 =?utf-8?B?V1l3YWZZV0lkVGErd2pxUGpROTRYM0xVVng0c2daWlFOcWcvOEM5ZU8rK3po?=
 =?utf-8?B?VEpjU1IwMFpGSS9INGhmZjBub0hYYldNZUx1dnlBZ3JFNnNqZElucnhqaUE1?=
 =?utf-8?B?K21pVXBIU003d0QrTWxmQUx0NU9KUVd5SVpCNGRtaUFqcU5MVncyRFdqZlpa?=
 =?utf-8?B?cnA2ZlRXanAvcmJYZDk1TXNJTDFFVEdFVkQyYjFQNHA1SkJYaXdNNGF4c043?=
 =?utf-8?B?bGNkZ2NpTEpZSXBtSnM3UVRRb0lzbnN3V0tYUXBmaE8vWExTU3IwYnl3TUhQ?=
 =?utf-8?B?dCtkWlNJYW00K1krUGhSL21KMG4rWkRkcGJxcHZkaXRKSHF2elI2cytaaXVE?=
 =?utf-8?B?bHFnVXVUeU9OL1h3aitoaHl4NkhLNFBkZGZxWUR0N3NKNnBldmxhbUEvWmpT?=
 =?utf-8?B?VTNOV2J6TVc0NEdqcHMwNkwwTGNGcmlYZlBJVUZKQXF3QzV1dmd5cE1adk85?=
 =?utf-8?B?VlhIbTlCZHR3WWNuWTdYeGwvYU0xQnlkME1LVVNjNStrM2pSNmVBV2Y0QVFq?=
 =?utf-8?B?MEFnV2x4MjdXYnpqaEpXMFNvall6TUIxaEdVT3VXRmRsSWM3K3BWdllxOUpu?=
 =?utf-8?B?SFBsM0FTT0hPdmtzdXVLWHVqcFJYU0xuRTBVeklWY1llV0J6eEp5VE9Vd2p3?=
 =?utf-8?B?RWV5ZmUxM2lJa2QxcUt4aXVSRllTS1FwMUZuM2FUM2hiaVA1cmtzTTFZb0RK?=
 =?utf-8?B?L3pFZGc5ejBPZ3NmT083cVBvK1p2c1F5Y0xNMlQ3OWJDOEUzUERDUlZBZ1Qx?=
 =?utf-8?B?dDJ2QXZtUWVLYnVCaXVhc0pLQXJCVHNnaExyRnhoS3RoRzlYYmZPNEU1QW5t?=
 =?utf-8?B?UCtGZmRzYW5Gbm53VGhzRlNENEJkTlF1a0NlUGQ0NGFIOEJxTVQ2UEo3UGFF?=
 =?utf-8?B?UCtNbVRWSXh2dE1FNHB0QlFrdmJnQXowMFhXMUhyNEVkTWlQU2tRWVRJZHAx?=
 =?utf-8?B?eXNHc0xqWUVPM0RmMUd5d0JwK2lvUVRVRU94cU9SVlJwMVRXRzlGampjbFhT?=
 =?utf-8?B?SGZZalQ0ZjRJbUVhVUg4dHdZKzc5eGQ2MzNRWDYrWUgzcUdZUVNsNE1rUFk1?=
 =?utf-8?B?V3BIZWEwbG5VVW91U2pTQlB6TTVVUG5jMTFoeWRNQnhOTXdYZzBKQ2N6VFhQ?=
 =?utf-8?B?dGZPZjM0dStOcGlwcVp2bGdUTzh5Q0RERnhONWZOZFVYWGdFT1FzM09UbFRl?=
 =?utf-8?B?WWp6U2ZqNC9WWU5JeVNySXNHM2hNZU9nZWlpdWg4UjBxaG9EYy8vZVlJUmlN?=
 =?utf-8?B?M2RzYUgzZExJVWQvQW5KdWwxc0lHWndyeklRaStia0RQVXV3SWdWMG1uSE9O?=
 =?utf-8?B?S1dTWU9UMVhzb1NTbWovNXdQZVJEZ3ZwVE9IYzFDVXpkd0R1Z2lzMVFLWUww?=
 =?utf-8?B?MVBCb2hOVDBoSXhGM0daUEsvSHlJQUVCRnUxYWhnMStvTFlrQ2Ria0Jwc0w2?=
 =?utf-8?B?bld3S3RVSitPcmhndDJXRzRHZGZSNnZVT1NaTTJhNjRTUUdJbjlKTEo4MXlr?=
 =?utf-8?B?em9mSmlMbUNnMXk1TWh0WTZKZ0s2cVFpTG5INi9rdXYyYTlmV1A3OU1XTll2?=
 =?utf-8?B?a005T3lZRDZtUU80THlVcWxQbUNjOGRHL0MzaXBjK2RUaWVJR2tKcHJxWkVK?=
 =?utf-8?B?TnRPTUFCblV4TUNFTk1LaVVZa0RWRENuTm52N3g1dzBmWFQzYXdzYXZGZHBu?=
 =?utf-8?B?bjR3ZitPc2JaRFhoRGJZbWdYR2ZNYzcrSXBEUHk4ZDFjVkJIa1ltZk51cWdl?=
 =?utf-8?B?YTZLV25Jc0xZdjRQaFRTWUFFb00wS01NOEZOVEZuYml5STBJL0w0aWxoaElw?=
 =?utf-8?B?dVJXcDR5NnEzbWdLd3FQd0Jzd3FEcVJVR0FJcTlETEsvTVRYa2l1L2pzeXhi?=
 =?utf-8?B?YVcvZDlVVW0xVGpUVGg5S2E4VWoyQW56S1NSL1lUTDFrSi8vdDlodFhKdzdp?=
 =?utf-8?B?SkJibTJXc0xlbjlJWk50NDA4WVBHb0NLTHAyNkxGWWhaODBaSmk5emlHYnl5?=
 =?utf-8?B?dDhvR1NCOVI0NEhRS0lXajVWQUs0Y1dQNUJRdXJhQU9zdU5LYWc5dVB5bW5Y?=
 =?utf-8?Q?5pa8ZQGHtiC/iy4EBmLGwJA=3D?=
X-OriginatorOrg: kuka.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e27f896-54e7-4164-81f9-08dd93004c05
X-MS-Exchange-CrossTenant-AuthSource: VE1PR01MB5696.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 15:59:24.2756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5a5c4bcf-d285-44af-8f19-ca72d454f6f7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PGlDQUkhDteGQRXqPuiL0U3WVfdRvs06j1XRmPSceH1yNkID8CcfgWBV+kwmoNUW/DeyheG2eH77qkljkd179mUQxGuiEsVAeZsP21MMndY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR01MB10664

On 5/14/2025 5:27 PM, Lorenzo Stoakes wrote:

>> On 5/14/2025 3:52 PM, Lorenzo Stoakes wrote:
> 
> Igancio - you're deleting too much context here, you did it in the other email
> too, it's really hard to follow what's going on. Please try to be careful about
> what bits of an email you delete when quoting.
> 
> You're putting my comment here without the context of what I asked Andrew, so
> now it's not clear what's going on.
> 

Hi Lorenzo,

Sorry about that and thanks for letting me know. I appreciate your advice, since I am new in the mailing list. I will try to include more context to avoid confusion in the future :)


>>> I have pinged s390 people on there, but I don't think this is going to make this
>>> cycle given we will probably need to coordinate with them to fix up this enum
>>> name (which seems the best solution to me!...)
>>
>> They answered that it would be ok for them to do a quick fix over the mm tree:
>>
>> https://lore.kernel.org/linux-mm/6f8f3780-902b-49d4-a766-ea2e1a8f85ea@linux.ibm.com/
> 
> Yeah, we need to figure out who's going to do this patch though :)
> 
> Did you want to Iganacio?
> 
> I would suggest chasing up with them to see if they plan to do it or you ought
> to do so.
> 
> I can also do it if you need it quick, but I don't want to deprive you of the
> opportunity to patch that :)

For me it's fine if you create the patch. That will probably be faster ;)
