Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013064.outbound.protection.outlook.com [52.101.72.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8B3248F5E
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 08:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.64
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748336305; cv=fail; b=lhypzx62JiuUh9HlR7UQNZ7X7Ox0tts/I0lUkXczo7SfBfAXYvVPfyqQTr2vdeS2Z6MEOdfBcSsJBo/NM8fD21lbLkiOjrnQaFoCsu6+Nu6Aw7MfAt63ZKLfwO7/yI5K2/5uz0TsoYI6rTYIGtOLy2KUAvOEMn3OQzuzlHcDhaI=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748336305; c=relaxed/simple;
	bh=RrFSca692YQv9qPogJInij4Sshn1LM65h2QMiZXneeI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nMuZlLiiLnJpVnBe1zaayD26bnguVc3AWXMsvmY2ytt1T30PIVVqB1Rf99S8/2Z/IBOXJL/80VBcqP50QhzxGM0PsOrHafJSqHaYaJMlaHfdHaYKIuTo9y1TmMmsl4poJUkD38WYq9ByXN+g6wqmOIlHhyw8oQS+vYZVodJcmBU=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nDz2oUr4; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nDz2oUr4; arc=fail smtp.client-ip=52.101.72.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nDz2oUr4";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nDz2oUr4"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vJNmwFxXCOJ+bG8WIQyXBVW6y7V5tsFdKk6dZ3/uSuHbaz3t2ebnHvRHA4cU8QHtdQovck8Fi0ZPFX+VAJ2Li9uDZ+YXAkL2ywUTFXe/wKySgHig1u/jOqRU6c7H1fWEpA2ks6sdycuEOmP5p5EGveM8LO2BFyAAKiRYxoh0diKaH0xSf830KhsDW8vXj849EKxf0nv0joBqGgw7C3c1VKkW5zv1OnzaL9dwtshswxIEjYMRvVWnvQGvr+oKyeUs2cOGnf26TCKE1LYaVvXR6H25CrpH5C40hlxhm/rzAVDlsH1CcJoo6EhX1RuGeXlVZIgvNbZO9jrFUQ0E1jj85g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=guM7xV75alYtXAH0dIS6sW/QDExaGKgmvdF6AZjOqH0=;
 b=oLsPeKFi64UnUWnMPMGYG4wYTrh+kWIMZQNynqqvuJPQbLUVkD3WHKDU9vvtyU56V5ZfOVifAxTUsBaPUYM1WZ/VCeb/7LEtXnwRAInfM6GYLXz+tFLyPmqzaTgU5AJ1F7UD4UQSz0Q2TxMGz2PhHDP9VsQ79TbA9s+QWd1AjCndPN1YWhI6U/Qt0m+gOG4acDO4EsDV8jn8cmT9798ZotL5k/lW2g7PZu/dOuFqJIUfARjiwuu46Ug3BmReUYb0mEDBruNbD7qfW7QqP2WPDOx2o11O5ut0f2tw1uunc8nAPZOuSiCBGHjhOfn7uljVMYjFWDa6uqxtejgdqMUDnQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=redhat.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=guM7xV75alYtXAH0dIS6sW/QDExaGKgmvdF6AZjOqH0=;
 b=nDz2oUr4hjlcOYOjLeGn3O+osk6mskK+EI2zlWe6nuvP6Kw4+bK5vHsHbN5KDsm/D9/UipbPrgGg/fBqNvdrqUTyCa5wBPlysdMPfFVZmbWBRMXZe8UO9aha/Y8gGQ3a/KO8Wa5Piq1RaJP/M4mG4KC/XsltvsyNcCYCr3c/3a0=
Received: from DB8PR03CA0025.eurprd03.prod.outlook.com (2603:10a6:10:be::38)
 by PA4PR08MB5885.eurprd08.prod.outlook.com (2603:10a6:102:e6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Tue, 27 May
 2025 08:58:16 +0000
Received: from DB5PEPF00014B98.eurprd02.prod.outlook.com
 (2603:10a6:10:be:cafe::bd) by DB8PR03CA0025.outlook.office365.com
 (2603:10a6:10:be::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.29 via Frontend Transport; Tue,
 27 May 2025 08:58:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B98.mail.protection.outlook.com (10.167.8.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Tue, 27 May 2025 08:58:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k4R8ZfT/cgTOuXlduvu+KRBNlv0h5FDRahcOZc8UIROz7adp/wQn1/gY9qleElxFzXYhCg8RsRdRuHc4Gfeb0EzkRHbFK5ucu4mwIe2WtJwgKSIe5Uam752h1+cbMPiG7pVLuSXj4UoE7SF5gu7SpSJ0mPCjobwSLer3c3RxTLLCkeeE68O7Ll16N99AdiCWo7KL2AZ4BL1SUZyCZKvZM0NwJIb0Qx9sS2H1cDLI8o6OremsJAXYj15rRk+/wnhIOqVCo24Fzpd1EUhDDJAHqBW4BWI5t1t0xDM/JcQhw9xuPPaKKaCPyxwQhsM2kWKyjDHC1yoqtLYRBVNJERM2lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=guM7xV75alYtXAH0dIS6sW/QDExaGKgmvdF6AZjOqH0=;
 b=exQswjvf98RByTkgouybMEyqKbbSS7CLCJNZ4stXwjI6CqwlaHCD3+2OGXU0oR6/sp1T7HntYNxx5s2IkkP9bJxDPrHeKQFq96Cxl7pbnKCVvAm60LqJ+2qey2okLxBx8Z/l52V1PHxWrn3G11QCpBsqi0zYPi7Y8zVBoaiEGIJTH5Ssyyj2dgHBO+athAHaRRCwTUtzg+C4iJvNU/yGv2o8stfCGqO8n9nBMZbQ07/8MAtXDvpLG4IsdaR4ATzsgwA+APsfcdz3E9kvSXxHr6WAJVgUVbkLN2fYGU1iAAXtoARIcOLLbzDfxzU2a/s4mbh3c2yuB0rio/HeJp23cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=guM7xV75alYtXAH0dIS6sW/QDExaGKgmvdF6AZjOqH0=;
 b=nDz2oUr4hjlcOYOjLeGn3O+osk6mskK+EI2zlWe6nuvP6Kw4+bK5vHsHbN5KDsm/D9/UipbPrgGg/fBqNvdrqUTyCa5wBPlysdMPfFVZmbWBRMXZe8UO9aha/Y8gGQ3a/KO8Wa5Piq1RaJP/M4mG4KC/XsltvsyNcCYCr3c/3a0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AM0PR08MB5522.eurprd08.prod.outlook.com (2603:10a6:208:18c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Tue, 27 May
 2025 08:57:42 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 08:57:42 +0000
Message-ID: <b827a7db-0cc5-423f-b50a-df3c41fb77a5@arm.com>
Date: Tue, 27 May 2025 14:27:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/2] mm/khugepaged: fix race with folio split/free
 using temporary reference
To: David Hildenbrand <david@redhat.com>, Shivank Garg <shivankg@amd.com>,
 akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, fengwei.yin@intel.com, bharata@amd.com,
 syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com
References: <20250526182818.37978-1-shivankg@amd.com>
 <b19653ae-8c9a-46f1-af93-3d09c3b0759e@arm.com>
 <0dc0fef0-ec1d-4971-81e6-0add808a8551@redhat.com>
 <cf22aeef-0160-46f8-b2e3-d308ccee0504@arm.com>
 <d405f2ba-7e3a-4914-8a6b-01704f449d69@redhat.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <d405f2ba-7e3a-4914-8a6b-01704f449d69@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0151.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::21) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AM0PR08MB5522:EE_|DB5PEPF00014B98:EE_|PA4PR08MB5885:EE_
X-MS-Office365-Filtering-Correlation-Id: 665e7e6f-caa9-4595-af33-08dd9cfc9e8f
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?d2F3QkJQZ0lJR1lmZHlNak1tSHM0UkxzOHQ5ck9GOGxIaGhIdEdrZGxyVkVY?=
 =?utf-8?B?WldNUGtVVlNUMHhoeXB6c0ROM1l1M2NkSWtmOW5MK1JEaHVxU1B5SzZDa214?=
 =?utf-8?B?dG50VUhra0hmaVVSL1ptYmVBRkcyL3JPVkg5ZDFKU2FaMGIvV3JnNXZ5MHFW?=
 =?utf-8?B?QVlVLzNnWUVLVTBhSEFSWXVZdFRid05adk95enVHWm44ZHljb1VVMDg2QlVF?=
 =?utf-8?B?Q1dneG1aWHE0RVNxdGxQbW11b0lSVGdNNnY1bHI4MmhlQmd6S3kwN0U2a0lV?=
 =?utf-8?B?d3FiOGtTby9BWHJpUm5nS0hTOFNtb2ttbllEbnVpMExUYVc3endvVkhjU2Q1?=
 =?utf-8?B?NjZkWmJHcVZVa0hqTi8zN3ZmdTlmQ3p3WE1QeGRxQTY3QU1RbTA5c3pnMU5T?=
 =?utf-8?B?cWdrMzZUWG8xaDdMOElqOGpkUktDaWdUaXZZbCt3L3I2dHhTdm9zWFlPcWRk?=
 =?utf-8?B?eXk4blB4dCtCOW0zS2pZNVh3UUJ4ZVJaZUlaVS9rSEp5QkRubEM5VmFTRUNh?=
 =?utf-8?B?MVlyejZxQUU5NnN5c05KOUdXcTdnYmVnV0JTSXEvMVdMMnZCV2xKL3pzemZB?=
 =?utf-8?B?OGRSRlcxVE5WcHlBNXFTMUhtRGNQaUhUZnAwQ0k3TFVwdVUvZ2NyTFV6cmJp?=
 =?utf-8?B?MWprcG55bnBLamk0ZFFCRmZ4d21pNGJRb2drUFBadzlkU3pnK3VoMlRidW5J?=
 =?utf-8?B?QTJmMlpBMUpYWTdoN1c2dWtMYlZRcU95cUh1M3FucUFmc1AxRmJ2WG1RVjlK?=
 =?utf-8?B?Z29wZXR5Z3RRbHZUSmRKYmRmcUkzUjRUazlTcEk2ZFU2OXhmWURwM0tZVTdp?=
 =?utf-8?B?VWV6amhLYW1HZ204RlczMkYvYlprVVJKblFVa3I4NUU4cGdoOFV4a2E5dFls?=
 =?utf-8?B?cE92aEFxM2FtR1VIVXFWUmZTQTJ3NTI2eStyYXFyQ3VvTWtOcW5IRzN3bGZG?=
 =?utf-8?B?bHIyTUlPNUVaSEI0RTY0SGtaUEg0ZXBKM1VIWU1tZjZqZHMxZW5kNTJ5enJN?=
 =?utf-8?B?d0FoVy9RbGtubnBCQVhHNWhQTWJCK3pUR1JoZzlwbG9tMWNiRTVGY1QzdmN3?=
 =?utf-8?B?Sm5QU09TS3hZTTlGZStzU3piaWJBNXRGWVI4SS9yOTNndW1rZW8yU1N6cWp5?=
 =?utf-8?B?SUlKazVIck54aHVIVkJrUDdqVDBmQk95SlNWYmxYK21FemJXeVA2Um9VbFlC?=
 =?utf-8?B?czl4WFdQdUxRWHhQVnlDQ0N2TjlSMWpRZHh1RXR0SjlvTVFPYm1rKzRHbDBL?=
 =?utf-8?B?WXowOTl2VUdrS2M1TFh0ZzRFL2lzeXV1b2tWa29TL1p5NXJ2V1RNRFFMTDQ5?=
 =?utf-8?B?WlVrdGRRdFdQWFJvUUsyWE05RGxUQm51YWFaR3FHbTZiOW5jbS9JV0Z2c2Nk?=
 =?utf-8?B?MG9QUnpUcEZTbS9zL3NnWDhsVG44V2FJTjhJaURiRUVlbERkcEI1dWhGeEE0?=
 =?utf-8?B?dVRHL3RaWTBrak1BTkt5MVhTTXN1UC9YakhFMkZVOGVLa2hvdEM3MzdyTjFu?=
 =?utf-8?B?ZzZmK0hoWFVWR0tPYWhCSEFqTm8xbklTakFSSjlzT3ExUEdpK0tRb1FVM2hm?=
 =?utf-8?B?RUNyV0V4VmsrSWZxeVp6bWdRTlpBM1lhbStBVmthR1ZRQi9jcEUySVdob3RB?=
 =?utf-8?B?eGdyUXpGTTFVYUlMVFdMR1lkcWZFZDVBaWkyZTM1ZXNtU2ltam04WWJPbzVl?=
 =?utf-8?B?cVZyeUdVZVlseEhQRHFHUFRGV20zbFJsU0w4b2JpZ1M3bm1tZXgyZlRVdjVL?=
 =?utf-8?B?MHkwaGxlZmZjMHBNQVZQV1ZrNTg0cFlSSGpFM3pueEpGcGJrNkhSMnJRYWVP?=
 =?utf-8?Q?4ckQlNsJy4Tm23Dbznq5Na8puYlUZIl5+8uho=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5522
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B98.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bc30dcf5-9226-49a8-af82-08dd9cfc8a04
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|7416014|376014|36860700013|1800799024|35042699022|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZTdoNjRlWllScUcrajd4MHJ0bHdZZlpNaUYybUJBeWltbnhjM2lHL09sbXNh?=
 =?utf-8?B?VW1aekZuMUlJaXJkamtVVjZuNTVjb29rV0dWNS95MXdseENOK1A5UVlLQVN1?=
 =?utf-8?B?U1k4U1BSWit6SENQb3FnNDBlTWxSREZVOWhiVGVuRDFnWVRveEZCeU4rYW5I?=
 =?utf-8?B?RVlySzZ6Ris5dk1BelljSm9uOVlsZW0xaHhjdWJRQUtWTk0yeG51bE5zZFUv?=
 =?utf-8?B?ZVV5UkxZVk1GYS9UTFZML1RKWnhJYnpNMjhRYXJhWGp0Q3l0aTNicU5QYlYv?=
 =?utf-8?B?SlUxVks3aWtMbC9CSFZKWkVUNllTYTJrc0xES3QyRGdpenBlUFJpRjFXSkc1?=
 =?utf-8?B?WVdlWll4RHpJVVVBVjVUb1JENDBRY3NFMDRnUEtiS2FvQ2RLcUdmZ0xpWlUy?=
 =?utf-8?B?UGZlSzI4eHRGK0JXVDJuRXBwSHM2R2dQVG5YdzExVk9lME5EL1N2NDJJaUNo?=
 =?utf-8?B?MHBlVURBdG5laHN3L0xrbEJzVlVZbWtXcDBwWWlzOXkzMjk1bTVCQVVsODVR?=
 =?utf-8?B?YlNQZG1uTWxKTEVCeVdXZUtNY09CYVZLZDFOek9QQjl0OG5sWWVEOVp5QWtm?=
 =?utf-8?B?dXE4WTU5anFWNktjZjdLWVpTeXZydUhQU1lOUjV2bkp5K04wTnNFYVdMbDJ2?=
 =?utf-8?B?ak5SQ3ZMYnM5d2Ztai94TDFvRldZa05JZ2lQdkhOdEdQT2lNYk1teGQwU0Vk?=
 =?utf-8?B?U3N3V3grYXdkUVVnbXJBVUFRS0F0YlZwaVhDYk1LMmtHVWsrekFoa0NIa0FG?=
 =?utf-8?B?QjB3VXZ6dVoxMUhtRkE1cjN2cGQ1R0ZKSllGenN0LzNqZzlwNmMyVGVtaDRF?=
 =?utf-8?B?aEhFNy84TjFRL0FmeERvN0FjSkNxN3ZIRDV5Q3p0TUtZWGdqb04wdHdNb2ht?=
 =?utf-8?B?R1Qycm95Sm9Wc0wwMGhYdG1ZN3J2VTB5V2RSU3p5NSszSk9VQWlSS0xYOFNy?=
 =?utf-8?B?cURtUkxZQW5HTXl6V1VaSUVRUHV4Q3BubEF0L01nZFhWSnE2MUZHMFRyVEcy?=
 =?utf-8?B?YklBZjBkRVhrSlBQUm9nbU9lVzRYTkgzRDJtVGx5VllyeTB2R29zQitzUGta?=
 =?utf-8?B?SUQ4MjVuaTVYYkxFZG9QbzVKWjVQcGRLRXdaNDVJd0lQb2xMVGlTZzZ4cEZx?=
 =?utf-8?B?eEo0SmlHaVh4SDh0enFCVUF5RGh4RENLTmNsWEd3YjZrTzdiejBEZHQxNVhI?=
 =?utf-8?B?cmRVTDM0QTBzK29PaUtJOUg4Yk1sckM2M3Bic0dpeXJVZ2ZiZ2ZwNGZWSGNz?=
 =?utf-8?B?Qk8vdG1ydW9nalRWOHpPcXRIS3kwS3hMK2ptbTlBbGxkYmxTYjIzQ3hsaGRY?=
 =?utf-8?B?VWxNem9FWVJnVi91bWFzb1dwR29lRUNDM2hJbzVLWXNZYlN5MmJlVzltTWFy?=
 =?utf-8?B?bjV6eVh5R0lJNjR5Z2xmM09OUUJ2QVZBQ1JKaU12VEpERDdpNjRKYVJhVFhL?=
 =?utf-8?B?NTRycW1jamMxQlFMWThqY3cvVUlKajJ0OUFBU0FkRHkxT2NLM2dHL3ZFbEhw?=
 =?utf-8?B?TXRrVGNsSmt6encxeXBRalBRSHdxQzhCZzFuSVdQQ3pzZmdtblBtT1hNNitP?=
 =?utf-8?B?M2hSclk2K2cvZS8yR0pBNUVZbk1zSmxKZDAyT2ZwWmRSMVEzV1JmajVHWkVV?=
 =?utf-8?B?amFXd1poczlGcDlHNTg2RlQwSTNSYXFkTDAwZUFwOWQ5TDdRWHgzdHk5bFJS?=
 =?utf-8?B?RVpwVEV3Yi9vYTRwVVlFZ0RKcGlBWVNBZmZCNWovZ01EdWdySlJtdlFTVHVI?=
 =?utf-8?B?YXRZV05BWE92VTRNUDhlY0pMRnlzWnNlYXdhcUVJOERoRU9wRFpvL1V1MGNk?=
 =?utf-8?B?ZW43UFJQUjY4aXNWblhSMWxzbGp0b2Z6N2wwb2J4WDA3Y3pNZE5iNHJLY25z?=
 =?utf-8?B?OHRxSzg0bDRaV3N2WFEyK0o0dXIzNUVTK3d2MzVNUDBYYVY0MmFTUWhsZ1dj?=
 =?utf-8?B?OGJYY0hSd29HbnVZME54MkFZNk54VjhoSkpnZDdpM3daN1ArNmZKak9Bb3hC?=
 =?utf-8?B?Zks0amFnWmJnPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(7416014)(376014)(36860700013)(1800799024)(35042699022)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 08:58:16.1369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 665e7e6f-caa9-4595-af33-08dd9cfc9e8f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B98.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5885


On 27/05/25 2:10 pm, David Hildenbrand wrote:
> On 27.05.25 10:06, Dev Jain wrote:
>>
>> On 27/05/25 1:18 pm, David Hildenbrand wrote:
>>> On 27.05.25 05:20, Dev Jain wrote:
>>>>
>>>> On 26/05/25 11:58 pm, Shivank Garg wrote:
>>>>> hpage_collapse_scan_file() calls is_refcount_suitable(), which in 
>>>>> turn
>>>>> calls folio_mapcount(). folio_mapcount() checks folio_test_large()
>>>>> before
>>>>> proceeding to folio_large_mapcount(), but there is a race window
>>>>> where the
>>>>> folio may get split/freed between these checks, triggering:
>>>>>
>>>>>      VM_WARN_ON_FOLIO(!folio_test_large(folio), folio)
>>>>>
>>>>> Take a temporary reference to the folio in 
>>>>> hpage_collapse_scan_file().
>>>>> This stabilizes the folio during refcount check and prevents 
>>>>> incorrect
>>>>> large folio detection due to concurrent split/free. Use helper
>>>>> folio_expected_ref_count() + 1 to compare with folio_ref_count()
>>>>> instead of using is_refcount_suitable().
>>>>>
>>>>> Fixes: 05c5323b2a34 ("mm: track mapcount of large folios in single
>>>>> value")
>>>>> Reported-by: syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com
>>>>> Closes:
>>>>> https://lore.kernel.org/all/6828470d.a70a0220.38f255.000c.GAE@google.com 
>>>>>
>>>>>
>>>>> Suggested-by: David Hildenbrand <david@redhat.com>
>>>>> Acked-by: David Hildenbrand <david@redhat.com>
>>>>> Signed-off-by: Shivank Garg <shivankg@amd.com>
>>>>> ---
>>>>
>>>> The patch looks fine.
>>>>
>>>> I was just wondering about the implications of this on migration.
>>>> Earlier
>>>> we had a refcount race between migration and shmem page fault via
>>>> filemap_get_entry()
>>>> taking a reference and not releasing it till we take the folio lock,
>>>> which was held
>>>> by the migration path. I would like to *think* that real workloads,
>>>> when migrating
>>>> pages, will *not* be faulting on those pages simultaneously, just
>>>> guessing. But now
>>>> we have a kernel thread (khugepaged) racing against migration. I may
>>>> just be over-speculating.
>>>
>>> I'm not quite sure I understand the concern you have. Any temporary
>>> reference can temporarily block migration, however, the retry logic
>>> should be able to handle that just fine -- and this code is not really
>>> special (see filemap_get_entry()).
>>
>>
>> You are correct that any temp ref can block migration, however, that
>> reference has to come after the folios have been isolated in the
>> migration path.
>>
>> So the probability of someone taking a reference on the folio is quite
>> low since it has been isolated. The problem with filemap_get_entry() is
>> that it finds
>>
>> the folio in the pagecache, so isolation is useless, then takes a
>> reference and then shmem_get_folio_gfp() does a folio_lock() instead of
>> folio_try_lock().
>>
>> This was the race which I talked about an year back at [1]. My concern
>> is that we are adding another candidate to that race; just wondering if
>> there is
>>
>> a better solution to fix the race mentioned in Shivank's patchset.
>
> Note that in this code here, we're not locking the folio just yet, 
> we're only grabbing a reference for a very short time.


Ah now I notice that the reference is taken for a very short time.


>
> We will isolate+lock the folios in collapse_file(), where we also lock 
> all slots in the pagecache.
>
> The alternative would be to also lock all slots here, which is 
> arguably worse.


Makes sense.

Acked-by: Dev Jain <dev.jain@arm.com>


