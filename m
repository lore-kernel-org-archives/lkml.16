Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013061.outbound.protection.outlook.com [40.107.162.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB2227B516
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 16:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.61
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748363987; cv=fail; b=WYtaou0HNWoQ66IVbZpUUeLX8hWG2ZY7IESWYJm0M5SRMqVIDEnTppwh3Uf7y9QRereYRQnDt8IO8XgmCHjuD59jOn9IGMx8EriJew1lgddCPOq9Upx428njcOXYG1k1xzWfW/DbHrWT7nT2JDfvqSGh6lr/HHb3Ho0HYSosfPA=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748363987; c=relaxed/simple;
	bh=o2WtolANpPhFXLMnFoFzoSumyScgEjdINQkH2txO4cE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UbQ5kBU/URowb1i+ZAbYzLlOk+kYcXLUJJSr6qgwIJS4YbrsITQNE1OvrbyIbFEFUbyaLUATJFVhNSUqiDYH674XBMxR09DkfB3uacTohylNWmV5LtN6WocPJ6SqOvJ7gxDJ3adp0MyOWyQqkFU7VogeBLyyUiHB7xHMaDT6DMI=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=oaeJ7grC; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=oaeJ7grC; arc=fail smtp.client-ip=40.107.162.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="oaeJ7grC";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="oaeJ7grC"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=O3B0AOC64B/lpoDN88FEdyNk9bRJsFRFAw3TgdrBjTgwBaLH9MHtTDgqhwp1ZUo3Nqh5cRiSoq/vvLkmV2/rydEmljYRWT4i0eqeONVsKbiCQV8/vfNHMmoz90hjL29F3VTHNLuNZYYnEiBVszld+DKE3iEmuNRgeHS6HaEWdNwhGD3/RUqgS6jJXgSwLohtrjNEvpdaPUQOFgMJJfm+hwbaHmVpE3vI8Zi5iDLkjx3fLHLSNAfQJM0L5rU4XS9zOQjTuk8Az1aRiD6Wwu68AGqC8Q/Ne66IVbst06J8eTBSyYKwumiVFq/u1yNTl1lwk7ym4DANJomRzXd6UPdRVw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z276fUH54sQmOygKVH47ehP5cJDvJHzMJjFITFfPo+U=;
 b=mgdBEF0lQIKn5e0bxJWxv3RNcmBLGvdxEgwMOK5npvhaLf/wNIU4UyG6+8fSLaZBaK4czBvV0Tq3jU0M/tMKGiH1eb2qEPoH0k9Hi5V9erP4DMwXRmAHX7OukzPr0qEPQKA1PU7AFCeK/mzxCyrbP9B9ikDQzcTMtFB0MksRmVhCkCI+ORbR+TJfuF2OVqtyaw7csJdbWTvWG+iHU6hJ4ja6uyvYlvQMsCqSMiFM3ONImi7Eqb5yF5V3q5ZfzDzN+RilzqL8/zDHGFjmdoui5e+aSe/MiMst+5v2b/3rDDtTQpkmbKgN90Qjel3Eujxd4DYyJOlCiDIcF+xgqbk8dQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z276fUH54sQmOygKVH47ehP5cJDvJHzMJjFITFfPo+U=;
 b=oaeJ7grC/B3uj/F2s5fQGzGCnwWCUp2B9fTPKj03tdkTi02DZoiePLmnVJ7Zl5hsBSQqg6ZRKLFnLXvN4Me7sXqs8AQf3XJxllanNkyTfXrfWfYWewdDAP+B2t4XwputBypOITw4LpUqSbkphSCC1gX1jlJxQL7KCIhAq24ZSpM=
Received: from DBBPR09CA0047.eurprd09.prod.outlook.com (2603:10a6:10:d4::35)
 by VI0PR08MB10447.eurprd08.prod.outlook.com (2603:10a6:800:207::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 27 May
 2025 16:39:40 +0000
Received: from DB1PEPF000509E7.eurprd03.prod.outlook.com
 (2603:10a6:10:d4:cafe::1a) by DBBPR09CA0047.outlook.office365.com
 (2603:10a6:10:d4::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.24 via Frontend Transport; Tue,
 27 May 2025 16:39:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E7.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Tue, 27 May 2025 16:39:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yNMJTLJ8ZJRHoth2Fh3aeVUePxY0fDedc2jcLtStaN1qNsV3yC56wK0CpEMWeQMIh7xO6Oo4I7osbYeJUJ2Kv/tCob572UZU4B+ILGdyQwPIJvP1tq8tH1MYhJ3f0GDg/zCYZAwa3Y6jtPVYNkr5zqCeryDsRiil8Lo4XlnAQoY+HHGnA9LCW0XttaJBUIqa+zGuVkNBwC1+4qetI5mCMqPBs5rlN4gmMgiB+HW+zTmRhD0J3J7/CBjFgL2J0QkjqSGhUqs0sDCIS8ujWDgrGfzj+zpBbpDESSaF1mQjdMZ0AQvmm3nvGpGaLddZFtqW6iFgsFCRUt6tFal8738Cvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z276fUH54sQmOygKVH47ehP5cJDvJHzMJjFITFfPo+U=;
 b=cGbgEnuQnBQHR4I4hMnzw72iFuAyg9yoFMWKGXOIoRHj55S33nG88nR3zkspKAmdpzmotNDqP6N46eddxDsA4D3A3MmMcIV0hQuF9fB+rhUR3yDF6GaymPII9jRZE21cyilsJJyy59HKlZsT2KOkuKo1ff+BZ5RQlQ7DnvvJb6+ckW8bLArmWA3Dl+uV1bWzZMd16HcAXepVrLKgoehbR+g0wjRPJclqDoSLjvQDbykgCf8ThQXsPGj3KjJ38dezL7Wq/JSDEmkgoJf5BTdIPZ3bxTuppQxDCjOnQ/NRhBKOb0D1HDm5d3eZyUPdGidSxUOK4U1kXMKJKSHJef/KLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z276fUH54sQmOygKVH47ehP5cJDvJHzMJjFITFfPo+U=;
 b=oaeJ7grC/B3uj/F2s5fQGzGCnwWCUp2B9fTPKj03tdkTi02DZoiePLmnVJ7Zl5hsBSQqg6ZRKLFnLXvN4Me7sXqs8AQf3XJxllanNkyTfXrfWfYWewdDAP+B2t4XwputBypOITw4LpUqSbkphSCC1gX1jlJxQL7KCIhAq24ZSpM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DU2PR08MB10159.eurprd08.prod.outlook.com (2603:10a6:10:46f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Tue, 27 May
 2025 16:39:06 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 16:39:06 +0000
Message-ID: <8ef715e7-76a2-4004-ac10-3cc10912c67d@arm.com>
Date: Tue, 27 May 2025 22:08:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] mm: Optimize mremap() by PTE batching
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, david@redhat.com, peterx@redhat.com,
 ryan.roberts@arm.com, mingo@kernel.org, libang.li@antgroup.com,
 maobibo@loongson.cn, zhengqi.arch@bytedance.com, baohua@kernel.org,
 anshuman.khandual@arm.com, willy@infradead.org, ioworker0@gmail.com,
 yang@os.amperecomputing.com, baolin.wang@linux.alibaba.com, ziy@nvidia.com,
 hughd@google.com
References: <20250527075049.60215-1-dev.jain@arm.com>
 <20250527075049.60215-3-dev.jain@arm.com>
 <3d5d5813-7764-4667-937f-cec52f8b03c9@lucifer.local>
 <422a63ea-9211-4e4b-a37c-8d4c5e964b53@arm.com>
 <888a8314-b200-40b7-ab52-f30f0af93374@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <888a8314-b200-40b7-ab52-f30f0af93374@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0017.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::35) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DU2PR08MB10159:EE_|DB1PEPF000509E7:EE_|VI0PR08MB10447:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fc23726-78a5-454d-dedd-08dd9d3d1347
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?SWRDNCtYUEZBcmxmVUZ5bTJuT2Zac2F0dDdiMUltQkd0VGRxM2FabUkrMitM?=
 =?utf-8?B?aHNlOU14OG9XQndTUnl5N0prUVQ0Z0xLMGRSQW9ZelVJMU01ZWJ1djRiM3hB?=
 =?utf-8?B?VW1ydDZQbFMyNzdjNU5oSG0rZ2JZMTM0STZFemxlYVoyT1hNYnVrb01Sdklz?=
 =?utf-8?B?THRhZHMvb21jUUdMZFAyMit3eWdSM1dLdCsyU3Q4Sk9OMFpRU0VqZk5rQzEz?=
 =?utf-8?B?a0UrTDZoZ0xwV0srbFRHUTdyK01URy8yck1CN0NvYjJMa2pMVFlBOVV4OXlL?=
 =?utf-8?B?Z1ZKUTJ1WDNudU1WSjBURnBWY01EaTdsZzBoRTM3bVFrOXU3N1JaNTcwVGdq?=
 =?utf-8?B?cDJNYS9wdGhON055bzdUY1BHR3FaNytNbC9tcHc1eGI3aCtIaFo1eFNkOG9a?=
 =?utf-8?B?dXd4ZjVxV09kdmwzb3ZoVTg1bjY2ZXZUR002cGVpU0xtQzRFeHBoY1Y5OGhC?=
 =?utf-8?B?Rm1oSWJuWjZTbHllSG43TkdQU0NSSmYzd0lLMUxvdkM3QlZlNzM5Ync3Ky94?=
 =?utf-8?B?cXhhZlAzdlIyN2czbFdiT1N0T0dLNWJsaXh6STlKSzQrSWdxWEZhUDVYMUpR?=
 =?utf-8?B?ajdtY0pmWC9BZ0dYeEE5YUJjVExmQ3Z0ZUkzQkt5SkFIMG9LaHo2ZUxvaUp5?=
 =?utf-8?B?V1VSMit1OWhza0hBb3paa21NV3d3TFF4L1QyVzdaekVwVzkvME5NMFRCVmRw?=
 =?utf-8?B?V05aaVRNeVBLTTZzOGJFVG9oVGhyWUNUMUEvbzZjWlRqVmlXR1hlYnJya25D?=
 =?utf-8?B?eVNJRWlYYnpWditUZXM5QS9RMHppOW9DNnlVWlNyUDhldGJqcFJMTWVBOFZo?=
 =?utf-8?B?Mk4ra0xDOHVyODJPckZDYzBZWFlrWlpzdlZhRlMySkl0L3AwalVZcm00NU9t?=
 =?utf-8?B?VFNsaUZtK2M4a2VOQ0o0a01pNlhZY1lmK21kQkZqSUttcURsRXR3TENyakc4?=
 =?utf-8?B?VFRXOUZhMjE1WmNmekdhUFN3RUdFMlMySTlBNGRycElGOStFRmpXV3pQNXZz?=
 =?utf-8?B?cWs0ZFNrRXJiWWd0VWgvV0RTbzF1NUk1VUVoRWxDTTZJREMzNmZ4Z3RQYk5M?=
 =?utf-8?B?YlhyWnU2b01jUmRPVGViZmUvQVRvOFRkZFpPTy9qdGg3YWZQNHZDVGJjbzFI?=
 =?utf-8?B?c2UxbUVpNzh3RW1PcytaeXo1M0dPNVpWYlgrNnFPTkxBa0IwaXUyVEIweHo4?=
 =?utf-8?B?eWY5REZoMU1GbmJEaVMrQWRFaVdpM3dsRWtWVndNMjB2ekdueFFqTDN2RSt1?=
 =?utf-8?B?QnJJbldvZmtha2xlbHVOcGFxVEZMcjBHeE1yUk1pZ2Q5MEZFNkxYbWlIb0Jw?=
 =?utf-8?B?dmxlanRtY1VybytSYWhpdk80bldvRmNaeGhMOWVvYzAydVh5bmNONDhxWEtY?=
 =?utf-8?B?Y3VOZy9GeWNhSTgvNHRKK2JiRjhlaEpMTFZMYVAwMm5CV1N1QVI4ZHRWVlU5?=
 =?utf-8?B?N2FFK2MvSnkwMy9odGFmd0hFY1VKY1dtM3pRUjBValRCbVZxUU9jellDS3hu?=
 =?utf-8?B?L0JSSkhmcEJEb3IrZlRCamFOcHZqcThhSVUyNENWRUNySVpXTU5sazFuZ3Yv?=
 =?utf-8?B?N0JBa2J3N3Z1R1dxMWpVMUxFMTZLYjdwRTYvNVo3cC93M1N0RzdYOVJkMVFH?=
 =?utf-8?B?ZmZDNU54b0hlVlVFODJUL1MwdHkxSlZWdmxidG0xaDF2UzA1Y1BLRWh5Y2VO?=
 =?utf-8?B?dk1OWjI1T3B3ZjRwYWxkUG5saHp1ZFdBYWJmMUVwcGZjQUpNUWlzTS9raDcr?=
 =?utf-8?B?TlQ5N0UxZWZRbVZZTnhRMU9OdjZVQ3JJeEVKN0lyRVp4SUUxbjZCd1d6THR6?=
 =?utf-8?B?Y1NjMStIY1lCVkhHSGVNdUY2ZVpBYUxTZ2pVZEdZc1ZrSG1SQTBjWGgrVHhV?=
 =?utf-8?B?NVhCQXNwUWJubGFXR0MzL2MrTzhPcHZ1TS8raEhyMURoVGNyZVNrVnk2bUFk?=
 =?utf-8?Q?/LwRsAEJMI4=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10159
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E7.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3f69c4b5-98f3-4aa2-698c-08dd9d3cff46
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|35042699022|14060799003|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S09wMHRtUGgvQ1ppUm9nWnBZUW04Y0FKWWJJMVB2WDRWbk1WYStKdnF4TXlK?=
 =?utf-8?B?VE8zMnN3bkphRGtDVjhrMXJWM0FOZXNlQ3dod2JjT0pLYkJUUGs5d2szVjhr?=
 =?utf-8?B?MGUvNkE5b0g4Tk1kS3BXTEFLQlJsQXJoSnlMOG5ORGttTUVKWXdhaXBmajJ0?=
 =?utf-8?B?RHNnQjU3MlkxMVNSdUxhZW1mT1k0ZE1adEpDQ1pXWnNISTVUZHRhNTV4RGU4?=
 =?utf-8?B?TXZXODNURklUQkYxMjVNVXZnRy92K1QrY0c3MjFHbjZVMk00aGx4bzdSZDcw?=
 =?utf-8?B?TDBUenlURjNJY2lNdS9LQmsrcThoNkVWYmFydUx5RjNNMVdsVjFGMjhROWlJ?=
 =?utf-8?B?SWh5Z2pqRzRpNzlqMVJmeUFtaGhtNldMKzdFUkozbXkxTVBaM0NlcURHSGU5?=
 =?utf-8?B?TGN0UVc2TTRyaHNVQit0UmN0UFdDeERqWk5EOUFvcENWTGJoSDJ1alhpUVYx?=
 =?utf-8?B?Q3NNSWJiRHA4bUIzSVFWSWZoci93Nm9lVGdselJPeERFajkrZVdXMGlyUHEy?=
 =?utf-8?B?Lzd2OW1pdU9hVTBUTDhUSm1nVnZhOUVZNFBRTTBNczNRNTllL0g5SE84VW15?=
 =?utf-8?B?dDE1N29BZitjcXYrci9DeHdNWlRtZkd1WU0zK3pPTzBHMEhhVVZqbHRmV1Er?=
 =?utf-8?B?SGZ4UHhUaGdNOE1vUkIzTFJKdmZwOTJjQTBjTmNybjVmc1gxbEpOM0t4M1JN?=
 =?utf-8?B?VTFFK1EzL2pOMG53Q0tEOW5GWnBXS3JrZVJWYlc3emFJWHVMS2FaaVZzK1E5?=
 =?utf-8?B?ampCbmZxRXl0K09acjNaMkJjTTMxYXl2bE8xWlNha3FKd2Zwdk1KNW1NczZ2?=
 =?utf-8?B?bG1GVE9XbG0rdkhxS0NoT0dvUlpiaE43bHFRcnRmWENwM1hYUXV4S3J0aVFH?=
 =?utf-8?B?VU04QVU2c01ONXR2d201UTNlelJnVXB6VTdRbWE3MFdUTnNzazBOdUJENjlX?=
 =?utf-8?B?NkpxTDlWRVdtNi96KzRkMkx6SkhoUmRUeVlpWkZHK3JIZGQ1N0M1cGs4ZkVC?=
 =?utf-8?B?RW1tQWdBUmlMdnd0NFl2WHdHQnhrYVpSR0NVaXo3cnp2VnpBT2Qxd2o3TFhZ?=
 =?utf-8?B?blI0TlBZSGo0UmdjZjV3OEE1bE9sN0VCZWtpMXpmZWZFdWFvakhTL2ZZUFp3?=
 =?utf-8?B?amRMM0NDTlJhRmlrbCtGVURtMGtkS01VYlRlZHFmbHhPN1VRcEFUTkZ0TUdi?=
 =?utf-8?B?NTRjbk5UQXNYN25qYTlpNkRFZ09HU1c1cTRvWGFxTHZRU3diczlRREgzTFls?=
 =?utf-8?B?WWZ2d0dZL2k5Q0RtQ3dBNUN1VEZrT0REMmlVaVMwRnM3enhTRHUxcTdpNzZC?=
 =?utf-8?B?N1Nub3NCbE9oMDk5ZFhDODVjZmQrZ3JBSmVBZ3o5Y3pPMmVjVlhKUHFzYTlF?=
 =?utf-8?B?bnA0VzVrQWxZazZwN05WZyt1ZlN5SjRaNldncklLNmFIci9UYkZQMHVjTzhh?=
 =?utf-8?B?NkpDT2tVK0Z5UWg3TFVQWk82d2ZnSlRzZlIwWjltdVp3RFBNNjJXWVJTRWVm?=
 =?utf-8?B?d2MrM0hweWNSVjNOdzhFRHEybWJqeElzN093MGpqVEZ0Y0VvdVFCbDE3SUd5?=
 =?utf-8?B?TGkzbVp4TlB0Y3VUaW9KYlUyRm8vRm16QkV1RDJvS25KVEdwK3JxVXVJYU9z?=
 =?utf-8?B?ZE16MURSVW92ZDM5VFVnazlIR3lXYldON014Ull3WFRiTXNWK2hyekZIU05B?=
 =?utf-8?B?YWVtckk1NlFjckp0dmU5b1liT1F5RFVOY2k2UmNSUFEwakFGVG1JUkd6WnRJ?=
 =?utf-8?B?NVd2S08wODkvZ1FWTllZR3gwbVM2bnkwVSt5MTFKS2NSMWE0WWZZajB1VjBH?=
 =?utf-8?B?YTJmR0hnWWYrUHZGNGszUFlFM0hzK0NtMGZ6OEoveWZSNHdEUkJoMXFYWnc2?=
 =?utf-8?B?YXFicFAwOVFkR1NURTMrNVRWbEIxcDJ1QlBFajBiRnB6eHhPMHFvNjJmUnhN?=
 =?utf-8?B?a1BNbURTczRjSWxYd1pSdDNIQzRVWVFaSy9rTEpxSzNHc05VdmRycXk3N0pr?=
 =?utf-8?B?UkRoQzd1aExzUDZUajV0cCt6VmxiRnYyVUhpc2pXUnNmMGFMbGZhbDBrR0VS?=
 =?utf-8?Q?ChMeNt?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(35042699022)(14060799003)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 16:39:39.7437
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fc23726-78a5-454d-dedd-08dd9d3d1347
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E7.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10447


On 27/05/25 9:59 pm, Lorenzo Stoakes wrote:
> On Tue, May 27, 2025 at 09:52:47PM +0530, Dev Jain wrote:
>> On 27/05/25 4:15 pm, Lorenzo Stoakes wrote:
>>> On Tue, May 27, 2025 at 01:20:49PM +0530, Dev Jain wrote:
>>>> Use folio_pte_batch() to optimize move_ptes(). On arm64, if the ptes
>>>> are painted with the contig bit, then ptep_get() will iterate through all 16
>>>> entries to collect a/d bits. Hence this optimization will result in a 16x
>>>> reduction in the number of ptep_get() calls. Next, ptep_get_and_clear()
>>>> will eventually call contpte_try_unfold() on every contig block, thus
>>>> flushing the TLB for the complete large folio range. Instead, use
>>>> get_and_clear_full_ptes() so as to elide TLBIs on each contig block, and only
>>>> do them on the starting and ending contig block.
>>> But you're also making this applicable to non-contpte cases?
>>>
>>> See below, but the commit message shoud clearly point out this is general
>>> for page table split large folios (unless I've missed something of course!
>>> :)
>>>
>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>> ---
>>>>    mm/mremap.c | 40 +++++++++++++++++++++++++++++++++-------
>>>>    1 file changed, 33 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/mm/mremap.c b/mm/mremap.c
>>>> index 0163e02e5aa8..580b41f8d169 100644
>>>> --- a/mm/mremap.c
>>>> +++ b/mm/mremap.c
>>>> @@ -170,6 +170,24 @@ static pte_t move_soft_dirty_pte(pte_t pte)
>>>>    	return pte;
>>>>    }
>>>>
>>>> +/* mremap a batch of PTEs mapping the same large folio */
>>> I think this comment is fairly useless, it basically spells out the function
>>> name.
>>>
>>> I'd prefer something like 'determine if a PTE contains physically contiguous
>>> entries which map the same large folio'.
>> I'd rather prefer dropping the comment altogether, the function is fairly obvious : )
> Sure fine.
>
>>
>>>> +static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigned long addr,
>>>> +		pte_t *ptep, pte_t pte, int max_nr)
>>>> +{
>>>> +	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>>> +	struct folio *folio;
>>>> +
>>>> +	if (max_nr == 1)
>>>> +		return 1;
>>>> +
>>>> +	folio = vm_normal_folio(vma, addr, pte);
>>>> +	if (!folio || !folio_test_large(folio))
>>>> +		return 1;
>>>> +
>>>> +	return folio_pte_batch(folio, addr, ptep, pte, max_nr, flags, NULL,
>>>> +			       NULL, NULL);
>>>> +}
>>> The code is much better however! :)
>>>
>>>> +
>>>>    static int move_ptes(struct pagetable_move_control *pmc,
>>>>    		unsigned long extent, pmd_t *old_pmd, pmd_t *new_pmd)
>>>>    {
>>>> @@ -177,7 +195,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>>>    	bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
>>>>    	struct mm_struct *mm = vma->vm_mm;
>>>>    	pte_t *old_ptep, *new_ptep;
>>>> -	pte_t pte;
>>>> +	pte_t old_pte, pte;
>>>>    	pmd_t dummy_pmdval;
>>>>    	spinlock_t *old_ptl, *new_ptl;
>>>>    	bool force_flush = false;
>>>> @@ -185,6 +203,8 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>>>    	unsigned long new_addr = pmc->new_addr;
>>>>    	unsigned long old_end = old_addr + extent;
>>>>    	unsigned long len = old_end - old_addr;
>>>> +	int max_nr_ptes;
>>>> +	int nr_ptes;
>>>>    	int err = 0;
>>>>
>>>>    	/*
>>>> @@ -236,12 +256,14 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>>>    	flush_tlb_batched_pending(vma->vm_mm);
>>>>    	arch_enter_lazy_mmu_mode();
>>>>
>>>> -	for (; old_addr < old_end; old_ptep++, old_addr += PAGE_SIZE,
>>>> -				   new_ptep++, new_addr += PAGE_SIZE) {
>>>> -		if (pte_none(ptep_get(old_ptep)))
>>>> +	for (; old_addr < old_end; old_ptep += nr_ptes, old_addr += nr_ptes * PAGE_SIZE,
>>>> +		new_ptep += nr_ptes, new_addr += nr_ptes * PAGE_SIZE) {
>>>> +		nr_ptes = 1;
>>>> +		max_nr_ptes = (old_end - old_addr) >> PAGE_SHIFT;
>>>> +		old_pte = ptep_get(old_ptep);
>>>> +		if (pte_none(old_pte))
>>>>    			continue;
>>>>
>>>> -		pte = ptep_get_and_clear(mm, old_addr, old_ptep);
>>>>    		/*
>>>>    		 * If we are remapping a valid PTE, make sure
>>>>    		 * to flush TLB before we drop the PTL for the
>>>> @@ -253,8 +275,12 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>>>    		 * the TLB entry for the old mapping has been
>>>>    		 * flushed.
>>>>    		 */
>>>> -		if (pte_present(pte))
>>>> +		if (pte_present(old_pte)) {
>>>> +			nr_ptes = mremap_folio_pte_batch(vma, old_addr, old_ptep,
>>>> +							 old_pte, max_nr_ptes);
>>>>    			force_flush = true;
>>>> +		}
>>>> +		pte = get_and_clear_full_ptes(mm, old_addr, old_ptep, nr_ptes, 0);
>>> Just to clarify, in the previous revision you said:
>>>
>>> "Split THPs won't be batched; you can use pte_batch() (from David's refactoring)
>>> and figure the split THP batch out, but then get_and_clear_full_ptes() will be
>>> gathering a/d bits and smearing them across the batch, which will be incorrect."
>>>
>>> But... this will be triggered for page table split large folio no?
>>>
>>> So is there something wrong here or not?
>> Since I am using folio_pte_batch (and not the hypothetical pte_batch() I was
>> saying in the other email), the batch must belong to the same folio. Since split
>> THP means a small folio, nr_ptes will be 1.
> I'm not sure I follow - keep in mind there's two kinds of splitting - folio
> splitting and page table splitting.
>
> If I invoke split_huge_pmd(), I end up with a bunch of PTEs mapping the same
> large folio. The folio itself is not split, so nr_ptes surely will be equal to
> something >1 here right?


Thanks for elaborating.

So,

Case 1: folio splitting => nr_ptes = 1 => the question of a/d bit smearing
disappears.

Case 2: page table splitting => consec PTEs point to the same large folio
=> nr_ptes > 1 => get_and_clear_full_ptes() will smear a/d bits on the
new ptes, which is correct because we are still pointing to the same large
folio.


>
> I hit this in my MREMAP_RELOCATE_ANON work - where I had to take special care to
> differentiate between these cases.
>
> And the comment for folio_pte_batch() states 'Detect a PTE batch: consecutive
> (present) PTEs that map consecutive pages of the same large folio.' - so I don't
> see why this would not hit this case?
>
> I may be missing something however!
>
>>
>>
>>>>    		pte = move_pte(pte, old_addr, new_addr);
>>>>    		pte = move_soft_dirty_pte(pte);
>>>>
>>>> @@ -267,7 +293,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>>>    				else if (is_swap_pte(pte))
>>>>    					pte = pte_swp_clear_uffd_wp(pte);
>>>>    			}
>>>> -			set_pte_at(mm, new_addr, new_ptep, pte);
>>>> +			set_ptes(mm, new_addr, new_ptep, pte, nr_ptes);
>>> The code looks much better here after refactoring, however!
>>>
>>>>    		}
>>>>    	}
>>>>
>>>> --
>>>> 2.30.2
>>>>
