Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013019.outbound.protection.outlook.com [40.107.162.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723CE13D539
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 04:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.19
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751344814; cv=fail; b=IyDgdbNZwdi4+QWyuJzzV7ldsNzWf5vS/yDYYHv/NYCGYl1wm6eB26Cm6xpxwu8cL6IOO8GNSunWsTByXEeXe4qOydRyxtmUaTBAM0lPGWB1YhOfnz3oEiKI/aKt6F/u3CzcIX3EDUtr0SmvH8Kb5FhDgjy1lumAmEzeM+RzzAs=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751344814; c=relaxed/simple;
	bh=AboEgynkvxA5kljXKKshLwpwe3uh3pDQcf69xuZOsdg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HmCA/+91TzMAtilX9PlrALGS1eWSOhhnalrq3CMYdZSCTyvnjXaIDuEqPrfzTkht+bLulrGSFxIJ1ixzGgyb0vqip1K84JjqXuNLFJk7DCsNN0/gi/hHCE7TVEVxRjqjfMo4gs3HUVTI2jyW1ZcuMLzYInv+87WCBBLZkZ0XT78=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=k/qrVC/s; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=k/qrVC/s; arc=fail smtp.client-ip=40.107.162.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="k/qrVC/s";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="k/qrVC/s"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=C3QTydRn+chudAVOTIclQYMzmD2f4Ss+5S3K3h1xJsxf3Y69Pscn8MT9vh7hiCpUO885mCguG05e6gy9GQG7ZDWgr0BfBBLcrbMLXJT03ORdFFIO5Ifq37+x4otmgstBXR+CBS/0V+wi0BhgdolkGvO5iuWaxagNlm88ud1K87Y8lC1Nkw8vC3mR8yWAGw/EczSKqVQvXnsgj26I95MSyQ9J+bftn67WlVwqP+Caig2f3Qc1CLNytLUgQ+aC8rlx3D8qblaNBjmLRShRz4nMbWO94QirFmZqGqxN9JdsXB6hkQ7H3jsVxnJwimw1FGC0ZiWl04jQkp1xbjaEh5n5yQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dymocVtWnFCVrXeQHpswYTqcOtzU8qx7/0rtJ/LnGys=;
 b=p9ulQKga9Nm4iGKV4Oa91HGZaHf7QITBrbmheUmNCzLGbV5m++GXOvsXrEUL3sj/81v1rBp1Xj4Er9JAqCu+yM/OLUw4Uo4fwfU/c+r6NNwt5E5vbPAknEwPo7kRt0ISmPTbpcXVJuK6lcmHMLGZ/qt9HbzyuU2V458+gFftiaYqRTHUIjpz206jhmxI5UgdBN5IlDz+F4iIFmwgPqZXVWma5fTEK9BcD2RLxCpb3buSAS4qxGjy4rFIrQNLj6Jp1W1J5riu5z0K9XWomW9DQ/4KtaoZFiBV651ykueZBv23hLCI1gF6CX3IMuy9DKIQT/qwJba4GobvhJQwPUp/nA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dymocVtWnFCVrXeQHpswYTqcOtzU8qx7/0rtJ/LnGys=;
 b=k/qrVC/sBXPcUIiAzzfga3eyx5TlhWMuX0shLA7cnw6tRvlap314LS3FNFkpLM3ORVnUHJMxhm/MmOHY3ecYY3TGjH3/nqKHgAHITxAvbte3Sj9auCB4GHi4P21J4NyyPO0UBunHtW4eT9x+PBjeyDAa8oP7xuHy4QNm1kOUGug=
Received: from DUZPR01CA0301.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::18) by PA4PR08MB6304.eurprd08.prod.outlook.com
 (2603:10a6:102:e1::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Tue, 1 Jul
 2025 04:40:06 +0000
Received: from DB1PEPF000509EA.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::f) by DUZPR01CA0301.outlook.office365.com
 (2603:10a6:10:4b7::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Tue,
 1 Jul 2025 04:40:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509EA.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Tue, 1 Jul 2025 04:40:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JuqECtAZ/t/1B7SLbfPuR53kxQfKl50Z2XXuJYg5n74gg5I1Dm8r2a3+qmVFBy3Qf3rz9x4hazV3jBGkDkaxfsyzzezcramjEG0oXLRXfEhGX+RCDwXokn7orwvsxJgRIeMntO/wHM6rYkznhko699LRM8WejeM79gxdrDSa5Vbsa/vodUPuq1+p9TVCj9ZHTxuxVtiOI4fiJdBcuIl7qFrnvi/EoQE/qLFrDkbpQLN1vUxlamz3lQON0UOL3Rmj4BkNGW6M4s15lPbkjzCR8lri1kRdm7oSjJZ1hCvS4DiTvfevVsoK90stAneW7V24w3fJpi9qDVzKHMa1G+H9Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dymocVtWnFCVrXeQHpswYTqcOtzU8qx7/0rtJ/LnGys=;
 b=pH7/tyxN40WsOYuxuQRyu1OPgxqPcJaFZaIvyOSiu7vJLLl6xCwEO8Effv0sKL+wwc3jFJcP4cO1ZErUTYtt3L3kIW+E0s2K7DCuULGwlzxgddACpwj8w1GrauAxURC+6fbnTTtQRGWJX6SQjqifD29/k6lGw4DrBcJ/Bs8NT0GmTFu/xS+ql0vOuGGMT9WQtLGgNIPaEcPvQtZoMdeeBY5042MeIJlAnbbWRJybC9YY/Vmxv723gx3pG2XXUeNUDrHApZTr1gMh4lkSSV0HUt7Fi9U5DTHAZbuVkUj8JuaRYusjsHAaXPHgawYEQNfunR8IWfwJsGDMXGwu04+8tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dymocVtWnFCVrXeQHpswYTqcOtzU8qx7/0rtJ/LnGys=;
 b=k/qrVC/sBXPcUIiAzzfga3eyx5TlhWMuX0shLA7cnw6tRvlap314LS3FNFkpLM3ORVnUHJMxhm/MmOHY3ecYY3TGjH3/nqKHgAHITxAvbte3Sj9auCB4GHi4P21J4NyyPO0UBunHtW4eT9x+PBjeyDAa8oP7xuHy4QNm1kOUGug=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by GVXPR08MB7701.eurprd08.prod.outlook.com (2603:10a6:150:6d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.18; Tue, 1 Jul
 2025 04:39:33 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 04:39:32 +0000
Message-ID: <50bfa46d-5fa4-4b52-a3e5-c0da419db776@arm.com>
Date: Tue, 1 Jul 2025 10:09:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] khugepaged: Reduce race probability between migration and
 khugepaged
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, baohua@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250630044837.4675-1-dev.jain@arm.com>
 <e05103e1-3cdc-4271-b78f-84299d1a4efe@lucifer.local>
 <4e2ea3d3-d519-43cb-8026-d448e1d8df98@arm.com>
 <3e4576fb-d25c-4415-9df8-8133039af7cd@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <3e4576fb-d25c-4415-9df8-8133039af7cd@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0181.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::19) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|GVXPR08MB7701:EE_|DB1PEPF000509EA:EE_|PA4PR08MB6304:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cf8cf23-4328-4299-53dc-08ddb8595a29
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?TGJhbi8zUVQ0Z256aWtBdlpQV0gvdmhudEtFaml5ZFRjOEIwNFBwVGpqZ1Zq?=
 =?utf-8?B?RVlWYXBEYTVWVnJiVnJrSE5kTklON05FTDh0c1RmVzFaNU9ia1BMZ29XR1VQ?=
 =?utf-8?B?NVp5ZEFPNnFsaEdBYnU4aXFOaWUwRENQdGJqd09yaFRiZkthcXBtUnZINXhv?=
 =?utf-8?B?bTlxM0xLdWhGRVAyYTZndW82eWdRVFNvZVVkM1hjOGNKL3RmZ0FTSnhSQTlX?=
 =?utf-8?B?WHFSRzVhNlU5R0lzZUt1R1JjMnZvbUVSQll0WWZtK21qWXdKaFBtMHVFT01v?=
 =?utf-8?B?eVFmSHhzSjRPcjRlek1BaHB4cXdCOVZtRDBtL24xamhKWS9JaEVKSUdYbjRW?=
 =?utf-8?B?Z2FkQnRWQVhtQXpJSENlTGJOOXVUa2F2T2FsQUxZS3A0SjRzc1EzVlI5NVFp?=
 =?utf-8?B?Y0JiaDRZd2dNT2pEcEhjdlF3amEvK2JYc2JRQk1zKytLWklYcmpmek1EYmZ5?=
 =?utf-8?B?Qk1IWnorMXVZZGtJVjRDVFl1eEI2c3dQcUhkTHBoZ2ptZGg1TlFYWFdYQ0VP?=
 =?utf-8?B?cVFZc2hEOFp2NjBoSmFNQ0E0b0VkQ1h6U3BSSTVjb1dtTVhyNmk0QW56b2hU?=
 =?utf-8?B?MWZDVkw3QVJOMEJ4OUg5K3UyYjFSV2wvdXdnYlUrcW9yMm9YOFJrbzhOKzc5?=
 =?utf-8?B?VHhFZjY5OHdvRE9tL3cwSnpnU1ZUamxkY2J1MzNtcSswOC84eGFrVWU3N29z?=
 =?utf-8?B?QndmZFBWdmkvNEJGV1FOU0V3cDRTLzF4WXJrUjB1MlVzaG5MMU5Bb3NyMDhz?=
 =?utf-8?B?Q1h1dzZhN045L3hCaUJiVm9wZ0NIRG51NWhPOHE4UFBnU0Rsck1pZEJnT0RT?=
 =?utf-8?B?Q3Qza3g3QU45d1JpSGxLT2lSc2RDVFJTakdZMTFST09LMy9lQ2t0WlJYVEZ6?=
 =?utf-8?B?b0tUN3dyZmtTVnlNNDFXNkU5SHFCRlJZRnE5Nk9IR0ZlNUtZRWFhdlEzWjR5?=
 =?utf-8?B?OGI3Z2tMTE5EZmFwbFRFdGhDc3MwS2tldzdWQStkWk1SdmsvMkpQOExZTU5H?=
 =?utf-8?B?S2FJelJoV2ZaMlRaZjR6TXpnajB5cVR5K1Vza0s1U0ZHTkRtZXlveGswSE85?=
 =?utf-8?B?VVREUE5zV2VPN0Z4Q01FaUxHR1B4TXBnY2E0QTRaMkU4ZTZUR3BydHh4S1VG?=
 =?utf-8?B?UlAxQVRVV1FJd1lwUm9TS1cvM01RN0gzMldJMm9obGc4VHMxMHNyTzlqeTNU?=
 =?utf-8?B?NkozOTlGTEh2WTZ6M2paSmNrdGprMmp0UTRCS1R2SDZQQlBwZG9ZemwzMVJo?=
 =?utf-8?B?Mm56VWhtMUthaDNralFjbWJzWklXeVVrYnFIa0Y0M09jSUJ4dUhlYXYyaTZT?=
 =?utf-8?B?RW9rUjFlcmlSWnRiYVNqcFMwZVdyeEU3cFE0VFJCa1RPS0YwRitOVTM5dlNH?=
 =?utf-8?B?UW1pb09PaUNxd1pPZnNQVDUrK2k2Y1FrTElHYnU1ZGhqQlRKNWxKTFRML25G?=
 =?utf-8?B?czh5OGVDdXg3dXFYdWlDZTZBWEVucnpLWURTUzVEbWo0eWlNQkFLZ1ppczVq?=
 =?utf-8?B?alJxRHJmdll0MG03SWNrdngvaHFBT0lnTHQ0djZuS2laVzgyQVJ6cmIxRlNR?=
 =?utf-8?B?WHhHVTZVQTZOSWZaSkdjYy9FM2JvOEdlckdEdDIzeGdMSWJYcnRnVTRGK01r?=
 =?utf-8?B?eHl4VzRkTnJiT3Exa3ZIeVBRaGovMFVWd05RRktOYU1DdEtPVzc1Qk10Vk9V?=
 =?utf-8?B?SFpLaTIrVHROZDlGenI4T1BvK0FnbFRaMkhUaG9JcXE1R0hTc3lHVWFMRzlW?=
 =?utf-8?B?R2FPUmxDMVZoU0hweDB1eXlCOEwzUFZYY21Pb0xsYTdsMGNXUGEreFdBWXFD?=
 =?utf-8?B?ZEQ0bHBhMzhRSzJCV3hGbG5vRHBhMlJPSWJmUXRYTzU4ME1rYkFvTWZnOWoy?=
 =?utf-8?B?c3M4U0lBK2ljNHQyekVxVFM3M2lVUXVrWEFMNG9sL0E3Nld1RWQ1VERnZ3Va?=
 =?utf-8?Q?xY55T/xcIYU=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7701
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509EA.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	70eead52-4bf2-4e81-ae43-08ddb8594616
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|14060799003|30052699003|35042699022|82310400026|376014|7416014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a2FrbGY5dlQyNi9MbFpDWHEyY0lOSGpjMzBUMHhEWjBUTmxCd2ZrbkJHeGJG?=
 =?utf-8?B?Q2dDTFJQbkxROS94UWtTZk1wTUZyVkZNcFhlRkZBei9ZMUtYSDVuU2F5b3M1?=
 =?utf-8?B?TmdUWnZyd2ZtaHJ3aEFRblhvUjl6ajJ0QnpCMEZGRzI1NnQ1aFNWUkJJc004?=
 =?utf-8?B?eDc4OU5zMGtYUG1sZ2d4M3pHQVdzMHNlNjhyZjNJRkkrdW1TNnJSU1ZpLzEy?=
 =?utf-8?B?Slh3OS9MVGdDaHZNRmdLa1dNMjlnTE41ZkorWlFsTXA2SDFSUmtVT2Nhajhj?=
 =?utf-8?B?aUMxWXlpa3B1eUVUTWpFZ24rbndQditvQWZFRTlzN0VUeFZaaklIOElOZ1Zh?=
 =?utf-8?B?bm1XZWlUWGg0cXpiSXNMd1ZvaEUxUTBYU2tDb2czSUNyczJXYWNGeGpUY3RF?=
 =?utf-8?B?OXNJSGFNZ3k3YXZzNUwyV3AwV2g0dmpoYlduNi9oQzRrbmU4QU43ZW1RU0Zw?=
 =?utf-8?B?cFNqMzMzY0w0cXloYmoyR29rQWZ3THhHVnZOTFZZUDFKSDJPNDhEOEtGVktV?=
 =?utf-8?B?N004eUxqa2FnQmt6MGNXQzZUU1FwRmYvOVdSYlQ5QVRLK0hWTmVmNG9CUlJT?=
 =?utf-8?B?ZnBzeGVOUmkrUGJ1b0tYMWo2MVMrdHRSUW9vU1FOR09VbFRDZ3IyOEhEampX?=
 =?utf-8?B?ZkZBRTYxKzRFcHpJMzZBNHpBL1B1akwwQ1B4VW5uUVcwNFJET1lqUHZleTRZ?=
 =?utf-8?B?S3JiRitwOTI0ejlPbndiWUVZQTgwR3pQWSthNGs1aTdYMVJUSU1YTGxwVjRY?=
 =?utf-8?B?LzF4Vm55ZkJoZGVvS1dRUTN3KzVEWHNMeXJOZTlITGp5ZlBFcjVXekhjOElX?=
 =?utf-8?B?UkRDUFlEVkNGSmdQRFgrMW1tT1g0WXFGcEpxUDA1RlZPbzNYY0I4akVpOURr?=
 =?utf-8?B?WjVzeUxveXZhOGc1VW0vUmpnWUR1R2JlWkhreERzWWJqWFRSeGcrS2Y4Z0sy?=
 =?utf-8?B?eTB3dUlIanhKNjBLZnZyYmJqSEZrQloySnpVYXFod0pGZWJmVHVUalljaUQ1?=
 =?utf-8?B?VHV6YmRoMWVnZkFEV2lQTmhZaTYvRnFGSTQwd2lJV2c5SXlZQVhFZGlVZG1H?=
 =?utf-8?B?R2dPOEYyVVVFNTBDV0UvUHIvcTdwcW8yTWhQMUNYdWtZMGNnTUFxSGJuVkwy?=
 =?utf-8?B?YUsrb2tPOVI3UThIcDJCUFBweUYrOGRsTVZTNkhoV2VGTlR6Lyt5S0Q1Ni8v?=
 =?utf-8?B?UGl5bmhIcGp0aWxBSi84Rm9LWm04SEdIamFlZ3ZtQnZMV0V6S0kreTdDT295?=
 =?utf-8?B?ZnRlL2wwUEhVa0kreEtnTjJndXIyNlVCcnBFVkFPdGFjdEV0TWJaVHpwSy9Y?=
 =?utf-8?B?MW1NNDM5K0MyRm5jVmNHbzE5Z25Qb2ErZ1YzK0VMckl3WjRHY0E5R3dOaVJy?=
 =?utf-8?B?aXNRT0dKTm9ibjdRTndMaU5yUnY0bkVlbzhEaG9iMWNyTzgrMEp3YWlJaUFZ?=
 =?utf-8?B?UTdkOW9zbWdqb1ExSk1UVzhXblJiaEVKd3BYMUJJQTY3SzNla2NhM1MvVFF2?=
 =?utf-8?B?dDY1dDhESFlIaGFtZ3R4Slc3N0hxakJvSWVjTktXMkU0RldRU2MxNjE1NzNG?=
 =?utf-8?B?aEFxc28xSDhLZ1ZTMWRkZ2NuL3NtZVlrSzhPUDNQRGZRSDQvSHdmU2Q4Q3pj?=
 =?utf-8?B?eUUvNE5DUGhiSnQrM2F4MEZqeDUzZTFVZi9sZHRKWHFlb1BIaEdoRVZiMzBs?=
 =?utf-8?B?aUxHZWxNRmRxR1BqWjFXVCtZTTBzSjlHaCtjK3cvTU9COFZ1L25tVnFsKzc5?=
 =?utf-8?B?THZjMmpzbzFQM25XbzdyaWkzanlWSTF4ZFZQTzRXczFZcjg0Y240bEREZ0Js?=
 =?utf-8?B?QVJ0RXBoRFdYNGhFRVhPcE91dWZ5S3c2UmpwckhvTWhUZnZPQzhZNDZ1Zlpk?=
 =?utf-8?B?Mm02TzdHSHRROUgvK1VBaWozTzhqako5bWpvQ2VsTG5KL2tid3doaHZacU9P?=
 =?utf-8?B?a1o3RGEyZGdjUnUyM2tNLzNHQ3VrdUU0ZDhsM3hNRlRkWFZIdWtnYXhXblFW?=
 =?utf-8?B?U3JXaE43NGFVRkdHbjdvODBNUU5xQTByUWRDaGhMUTVKS1dVdUI0dWVPblhs?=
 =?utf-8?B?MzhuYUVYK3RxMElzZkMySFBSYytwTjlvd0ZCZz09?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(14060799003)(30052699003)(35042699022)(82310400026)(376014)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 04:40:05.9622
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf8cf23-4328-4299-53dc-08ddb8595a29
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6304


On 01/07/25 10:00 am, Anshuman Khandual wrote:
>
> On 30/06/25 8:00 PM, Dev Jain wrote:
>> On 30/06/25 6:57 pm, Lorenzo Stoakes wrote:
>>> On Mon, Jun 30, 2025 at 10:18:37AM +0530, Dev Jain wrote:
>>>> Suppose a folio is under migration, and khugepaged is also trying to
>>>> collapse it. collapse_pte_mapped_thp() will retrieve the folio from the
>>>> page cache via filemap_lock_folio(), thus taking a reference on the folio
>>>> and sleeping on the folio lock, since the lock is held by the migration
>>>> path. Migration will then fail in
>>>> __folio_migrate_mapping -> folio_ref_freeze. Reduce the probability of
>>>> such a race happening (leading to migration failure) by bailing out
>>>> if we detect a PMD is marked with a migration entry.
>>> This is a nice find!
>>>
>>>> This fixes the migration-shared-anon-thp testcase failure on Apple M3.
>>>>
>>>> Note that, this is not a "fix" since it only reduces the chance of
>>>> interference of khugepaged with migration, wherein both the kernel
>>>> functionalities are deemed "best-effort".
>>> Thanks for separating this out, appreciated!
>>>
>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>> ---
>>>>
>>>> This patch was part of
>>>> https://lore.kernel.org/all/20250625055806.82645-1-dev.jain@arm.com/
>>>> but I have sent it separately on suggestion of Lorenzo, and also because
>>>> I plan to send the first two patches after David Hildenbrand's
>>>> folio_pte_batch series gets merged.
>>>>
>>>>    mm/khugepaged.c | 12 ++++++++++--
>>>>    1 file changed, 10 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>>>> index 1aa7ca67c756..99977bb9bf6a 100644
>>>> --- a/mm/khugepaged.c
>>>> +++ b/mm/khugepaged.c
>>>> @@ -31,6 +31,7 @@ enum scan_result {
>>>>        SCAN_FAIL,
>>>>        SCAN_SUCCEED,
>>>>        SCAN_PMD_NULL,
>>>> +    SCAN_PMD_MIGRATION,
>>>>        SCAN_PMD_NONE,
>>>>        SCAN_PMD_MAPPED,
>>>>        SCAN_EXCEED_NONE_PTE,
>>>> @@ -941,6 +942,8 @@ static inline int check_pmd_state(pmd_t *pmd)
>>>>
>>>>        if (pmd_none(pmde))
>>>>            return SCAN_PMD_NONE;
>>>> +    if (is_pmd_migration_entry(pmde))
>>>> +        return SCAN_PMD_MIGRATION;
>>> With David's suggestions I guess this boils down to simply adding this line.
>> I think it should be
>>
>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>> index 1aa7ca67c756..8a6ba5c8ba4d 100644
>> --- a/mm/khugepaged.c
>> +++ b/mm/khugepaged.c
>> @@ -941,10 +941,10 @@ static inline int check_pmd_state(pmd_t *pmd)
>>   
>>       if (pmd_none(pmde))
>>           return SCAN_PMD_NONE;
>> +    if (is_pmd_migration_entry(pmde) || pmd_trans_huge(pmde))
>> +        return SCAN_PMD_MAPPED;
>>       if (!pmd_present(pmde))
>>           return SCAN_PMD_NULL;
>> -    if (pmd_trans_huge(pmde))
>> -        return SCAN_PMD_MAPPED;
>>       if (pmd_bad(pmde))
>>           return SCAN_PMD_NULL;
>>       return SCAN_SUCCEED;
>>
>> Moving this line above since we don't want to exit prematurely
>> due to !pmd_present(pmde).
> Might be cleaner to just add the migration test separately before
> the pmd_present() and without modifying existing pmd_trans_huge().
>
> 	if (is_pmd_migration_entry(pmde))
> 		return SCAN_PMD_MAPPED;

Sounds good.

>>
>>> Could we add a quick comment to explain why here?
>> Sure.
>>
>>> Thanks!
>>>
>>>>        if (!pmd_present(pmde))
>>>>            return SCAN_PMD_NULL;
>>>>        if (pmd_trans_huge(pmde))
>>>> @@ -1502,9 +1505,12 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>>>>            !range_in_vma(vma, haddr, haddr + HPAGE_PMD_SIZE))
>>>>            return SCAN_VMA_CHECK;
>>>>
>>>> -    /* Fast check before locking page if already PMD-mapped */
>>>> +    /*
>>>> +     * Fast check before locking folio if already PMD-mapped, or if the
>>>> +     * folio is under migration
>>>> +     */
>>>>        result = find_pmd_or_thp_or_none(mm, haddr, &pmd);
>>>> -    if (result == SCAN_PMD_MAPPED)
>>>> +    if (result == SCAN_PMD_MAPPED || result == SCAN_PMD_MIGRATION)
>>>>            return result;
>>>>
>>>>        /*
>>>> @@ -2716,6 +2722,7 @@ static int madvise_collapse_errno(enum scan_result r)
>>>>        case SCAN_PAGE_LRU:
>>>>        case SCAN_DEL_PAGE_LRU:
>>>>        case SCAN_PAGE_FILLED:
>>>> +    case SCAN_PMD_MIGRATION:
>>>>            return -EAGAIN;
>>>>        /*
>>>>         * Other: Trying again likely not to succeed / error intrinsic to
>>>> @@ -2802,6 +2809,7 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
>>>>                goto handle_result;
>>>>            /* Whitelisted set of results where continuing OK */
>>>>            case SCAN_PMD_NULL:
>>>> +        case SCAN_PMD_MIGRATION:
>>>>            case SCAN_PTE_NON_PRESENT:
>>>>            case SCAN_PTE_UFFD_WP:
>>>>            case SCAN_PAGE_RO:
>>>> -- 
>>>> 2.30.2
>>>>
