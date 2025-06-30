Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012010.outbound.protection.outlook.com [52.101.66.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A152E403
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.10
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751272844; cv=fail; b=MVNSQHTBW3cC8utvC9StQv36C96BAIjRNKP26vJjUOWAPz9oDI/J99NwgRbHI9C77OxBU5wo85WmQw37mRRU769PIWx6y68vCdqGZWCQ74GpGhBTqJqvjEsadSv6HfR5a4j6t/M95UyfcoxfVZcB6xzPrKyRnI4A3JzR6CDGi6E=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751272844; c=relaxed/simple;
	bh=lcxGVSyvfuyVr1HaTl5siRvz5wUkreQvNG89iEIEpzY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Hnl/ua9DaxdLrfFlhFYflxzYailTp7svszFdIkmoYTEYpQpatrPtHyN0W/xhexAxyeI3O+PihIXGBkV1rCeuiV2XVAHMw+7gQQB4ZpMEvcTeC2pyq5hq2cfzzdUYyE2n0hT6v21velgoBMpSCV2iuyzeK/iFuynKCKgWZSU+zGg=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=e+BCBt5G; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=e+BCBt5G; arc=fail smtp.client-ip=52.101.66.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="e+BCBt5G";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="e+BCBt5G"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bZpFHlV1etdJsz1tECqR0ljtSNpeor3wUL1GJeiErpAsLOvM+wVOEnHYndCHjG+Fj3GuHO3cF/LLZWiVot7vqPvax2zSqTCNgRqESbjj4iUoLsfWsxN+qt6WTX8BEqc2NdcWnx+QIthFot4XbHw23H32FfykB9C4H1W/v4LbbNDD3GcqQ1AyOuZpeZci1GFA5hcPhJysHxy2lyWhYzIbdJIWjTNFUkNdJpIglQwwb+IYbGU8TWY+OJeD2Br9YoRx1dOyJIcyTTRc9L6KGYE6P3yXauozR5OFl6YMX476DpR3JE1Tjmead7hrSZ5Wapvi2IvOep+IcSn3YbHOfmL5zA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qbIhHPEngVz0ix8q6zG+CNN+eUfubdeXQYxJ7ah+imY=;
 b=k5lrt+z4cgqpzHbDNxTd+sMtlD1nGhJKiQreosfJIAPZgaE0pposioLPg6yR8/yTu+XWqXq6Z7nyh4TzdD509eLFB8+ihx1UkiAXPhrTEiV2PmcHDt7YtE11XXBVIMQ8G5inhx0bC1ax2CwBB3x28yJQNC62FXLDd102Tfa8UMFL6fZr7ntGXeYUEtuaZ9ZSV3FLXJQYs1zK8LscnnFMaymxK+ux06veoa+rEE5Emy0Jn6ZF9+JDFH160lEPYGNVyFZoTRq6KgOTRVbTC5eVfnJxU1hIuZsZQMhD7yil2uRfEdLbJZmVBBmTWLYf6O2h+UQ0MVhQxKuObh+GsZty6A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=redhat.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbIhHPEngVz0ix8q6zG+CNN+eUfubdeXQYxJ7ah+imY=;
 b=e+BCBt5G201iQfIAQtGGvgcVHj5K80LHyOuRKNgKyvdelN/ZwVCuqva9+6ElqS/Pl79TZwmR4Y8YfGFdNkl6zKwClbPkDrmjrmn6kSu9ihxjSbi7ytgh3ud2NJMzQph1CdbKwzQrdeaaZeo2mRmlVrQyL1Mvmsb5dzJJIy3waM0=
Received: from AM0PR02CA0175.eurprd02.prod.outlook.com (2603:10a6:20b:28e::12)
 by AS2PR08MB9785.eurprd08.prod.outlook.com (2603:10a6:20b:606::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Mon, 30 Jun
 2025 08:40:31 +0000
Received: from AM3PEPF0000A78D.eurprd04.prod.outlook.com
 (2603:10a6:20b:28e:cafe::29) by AM0PR02CA0175.outlook.office365.com
 (2603:10a6:20b:28e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.28 via Frontend Transport; Mon,
 30 Jun 2025 08:40:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A78D.mail.protection.outlook.com (10.167.16.116) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Mon, 30 Jun 2025 08:40:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TlHxQayOrkzc3pP5/LqmQsMJ+BZVmhogduvwdk6eLiURFsPxyL6L3SOepdKc/yxC6o+d5YwDu1xtff/ItLI0oTCLymjYc+b7UkvPRAXWQ+dSbIZKL8Axsjytj9cKqXsKGXaiLfzLOqWNufaUI3NyCbPEsEPVD9Ucjo+lrudQRSa8pGwcFGNyAYTz6JqOYcEFqrauDUPhrKiz8L2oFVVASxxYb3VkeKYpx014vRRMneB+Ft5PgQRcXYsqMd85FGlnsn9yJ7/4XWg+cqXVNtG4i9dfdFqN94hEo9swkV58vMyKSmpLGdapQ+H70WpJfgjkKR0fnHgMo5QlojkD0OYxcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qbIhHPEngVz0ix8q6zG+CNN+eUfubdeXQYxJ7ah+imY=;
 b=bGFYCAOG/wvWdF6CuOC8+giJyoKB+xfsxBidkB4GJ6MwLyEyhdsCVdLlAjjd094LbcIfoo4CQGR39qNuCmSIIWCpez+iJ18OLFoHIJJ2jOhuIssWLf6zkc1kTtf28eSiSLwL5eSP4Znh7V4rMJsMt5YXVYr8YIUG47+SgntiluorWYE2tE9L3UcavzliJKCbpwcwZZt+BCjZAOHM28Bz0HFoKrAuGaRYk+MSw1MVWufYocK97GGePYTxwUC1s76Fa2dgdhkbImqAjS7CSzZToMlKF5qwRHF3M3wUwp+YGgJ+BhOXsvhOorpGgkRv1nwnr8DEhfL3DT6k6X0MrWs7gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbIhHPEngVz0ix8q6zG+CNN+eUfubdeXQYxJ7ah+imY=;
 b=e+BCBt5G201iQfIAQtGGvgcVHj5K80LHyOuRKNgKyvdelN/ZwVCuqva9+6ElqS/Pl79TZwmR4Y8YfGFdNkl6zKwClbPkDrmjrmn6kSu9ihxjSbi7ytgh3ud2NJMzQph1CdbKwzQrdeaaZeo2mRmlVrQyL1Mvmsb5dzJJIy3waM0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by VI1PR08MB5519.eurprd08.prod.outlook.com (2603:10a6:803:133::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Mon, 30 Jun
 2025 08:39:58 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 08:39:58 +0000
Message-ID: <2d6ee500-cfd6-4d41-9e83-fa26aa48af02@arm.com>
Date: Mon, 30 Jun 2025 14:09:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] khugepaged: Reduce race probability between migration and
 khugepaged
To: David Hildenbrand <david@redhat.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, akpm@linux-foundation.org
Cc: ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, baohua@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250630044837.4675-1-dev.jain@arm.com>
 <786c83e0-d69f-4fa3-a39c-94c4dfc08a20@arm.com>
 <28bc843d-615f-4848-988b-31a0a2921d14@arm.com>
 <fd84915d-2702-405d-8d9a-d1ef21e6f563@redhat.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <fd84915d-2702-405d-8d9a-d1ef21e6f563@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::17) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|VI1PR08MB5519:EE_|AM3PEPF0000A78D:EE_|AS2PR08MB9785:EE_
X-MS-Office365-Filtering-Correlation-Id: 88f0fedb-5b69-4ddb-48c2-08ddb7b1c59b
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?NXIvUkp3VDNERk9nbVIwUi91MVJadW8yaTg1ejZxaXlQZTBNekpxMDJRN2I5?=
 =?utf-8?B?L2FZL2JiSHBwSjdqQlJlZGU3a04zdlBNZHpNaXNhT0xRS3VUczFxb2hmUG9B?=
 =?utf-8?B?ejFRaE5mN0crSjIrSVVzQ1QwamlrdTFyWE02NkRaeUNiSnVLdHZUV2lOZThh?=
 =?utf-8?B?bG1NTEVJeUM0dkkrUzFaV0YxbzZuU2NuSHROWmxmVVNYZmY0QnlJN1pHSnRh?=
 =?utf-8?B?WkhvdDlEUkp1U21TMGUzSTJqdVJjZXlRekg1OVAwV0NsakxmQUFqODR3MXNM?=
 =?utf-8?B?RjI2aFJ3TDBMMkVDcHFFdWpUZmJ0V0F3dWFnS0ZKU04rbmMxQnVXNVh3VFJi?=
 =?utf-8?B?VG82TXdvb0FRNTBPN0o2U2hDZm9tOWlFMG5LbWtVUERvM2o5RjdIS3R1dkky?=
 =?utf-8?B?RmdiOGVQdE43VmpwRExueENlQ2pEOEFUNUdDcjdoUXo1b2djVXlKQ1FrdU9V?=
 =?utf-8?B?TzVXLzQvb0w2WmdEaWFOZ2dnRm5VWVN4VGNzVWhqRVlNVzhWcXU3M3I5MFBH?=
 =?utf-8?B?VFlKS29yakpFSmdVRENLMmdQUjZOWkkxcEQwZTRTcEZ1VkRQdmVicTlNYnF4?=
 =?utf-8?B?SzM2RndiejUyem5aMHJ1QUZ6VDZnOUhxbTcwTTNvSDNpMXQzYjZ2UlFjcXdS?=
 =?utf-8?B?TyszY2dKZENrQ2QvWk8weXlnRnpDZkRnV1JDcnVhUW9KVHdwdmdZSnhBZGNn?=
 =?utf-8?B?M0wrRXowYkdBS2orQzdoVTZydGxXUllpa3V2RFBzTkNleW00SUhudHhJWVZy?=
 =?utf-8?B?SSt3cGlxZXgrMDAwczg5NUhsNTJZcUQ3akUzZVgxODZOc1l1WitQcnIraXZn?=
 =?utf-8?B?d1VtSzhLQzVxWXMwcVAya1djWDlqSW9NSGM0K3BDb04wS2FUMWIrYytwbDBr?=
 =?utf-8?B?V1hNS0Y3MVUwdGRERU4zL25zWXVOV25hQTRBWE00cGhyZnJhdkpCdmtsU2tj?=
 =?utf-8?B?OStwTGphR3pkWGpTaGZmVTJOTllLVVEwOVRTWk5EbGhKMUkxVFRZY3lvRlBT?=
 =?utf-8?B?RVR6MVc0YWVwaVRaVFdMVVgyYUcwQnkyNUNnRXpKR2ppQmRxWXhRT3pMSmQw?=
 =?utf-8?B?em5SZ2Y0RFFZQUR0T2xmNWpyWFJCdHVaZS9ZVkIwekF1VjFtRThBLzh2UEZH?=
 =?utf-8?B?a25KZ0g4ZnFCeWZ4ODNBbDhObkFEazhmaTVDaUZ3Zi9vaUluazlDYlMwSkN4?=
 =?utf-8?B?UVpIWEkyMTFtelZaMWxLZndlSVNPK01hc1dvSE1sbWJ4cW1DcDd5VmZwN0RZ?=
 =?utf-8?B?UWlyZVlOT0Q2Y2pPVWVzVnBnVXNxenpmT01YOU4zR3RxVVNpT0pzWGNzUzJL?=
 =?utf-8?B?RTV3L2gxNXZDcXNiZU1VeitXT3UxVUJVZTM2dnNjblhrNTM4TW54TldQUmFo?=
 =?utf-8?B?RTZQUGx2a3kxT3lNWGV1cWxGR2RTUVVqbXVORUhpeURpVEk0MDlSUVpKN1ha?=
 =?utf-8?B?emROTDFuSSt1TndIQzFIc2QvRkxqOFR2bjlYY29qVkRtd1VKem5xL0hMMzRQ?=
 =?utf-8?B?ZXpWMzRFTFVxRnlrRFhlRTF5OGo5NVpyRVVkYmVMZlM0NWtmcjNSWHJ4dE1J?=
 =?utf-8?B?ZDFsMnphSUhJRHl6SW9DVGxBZG1RNFo2cGhuNmg3d2p6Rkkxd0I4dXlPR0lp?=
 =?utf-8?B?QzVJb1NTYzNlb1EzSk5pdmc1M0pKcFlXa3E4V3BMc1VIZDlYU3FXT1ZEUnVH?=
 =?utf-8?B?SkEwdFlQajUwN1BQbVM1WmorRC9mdjRNV0EvMW1RUWo1R1RPNzRYQTNibW9q?=
 =?utf-8?B?R3dGUGR2dEx0Vmo4Z1Uxc3Q3dXZrdHpacjluTEl5aDZDakdKTHNGbW5HWFdG?=
 =?utf-8?B?d2JudUtneW82eTRCbm1TTHQxR01rdFVNL2pmM3ltNmw0WHoyQ1FQbFFISFN5?=
 =?utf-8?B?T3F6SURjNHBUSjExdUh3UUVoWjYwNjRYNlZNTk04a1BHOXo1OVhPOFdRdjMr?=
 =?utf-8?Q?qH6odtjVDGM=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5519
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A78D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4ffeed36-2bb7-4f24-0bf5-08ddb7b1b20f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|30052699003|82310400026|14060799003|35042699022|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YWFseldUTVg0cUZwaSt3YWE0Q0JycG43Yk5nR1A2V3dYSGF0aGZMb0dEWGJX?=
 =?utf-8?B?dXFReXZ2RnFWRzBydHg5WUV2WTVId2dkOWhacGhyYzJ5L1pieTh1emlBNVdJ?=
 =?utf-8?B?N1hkOFBmcUhjencwUjR0bW9oZVZlOXI2OUZISlpwQk5lVmVxWVhjNTNmeEJ5?=
 =?utf-8?B?bWVLOHhsZlA1MzJNR2tJZVhvM3RHRERvQTR4djZLL0xWeDlvejQxbUhHZmd4?=
 =?utf-8?B?Rjh0SHBPTlNOR25kM1MxMW4yM1htQVZFUVp4OUVRZnBjd21JYWJ2cVp1QklU?=
 =?utf-8?B?THlCeVd2WGpFMzhldDIwamRQSUhXcG5WSDhvK1p0MTZxZm1GSnYvbCs3WEVI?=
 =?utf-8?B?RHlwbUhpeDNXT1IyRktOelRFMGdDTzRUNkUvMW1OOUVxTjEvUys0dEp0VUdy?=
 =?utf-8?B?MGxSU0tJK0JNa0Y1M2RGYVFRWVJsY0t5R2NTK0xzektPLzdYRTZWalJFL0Ir?=
 =?utf-8?B?QTlHVEVQV1o5UWJmOGxDTXhHelR5Uy9ZdjIra0t4MWRCTWFCdXMzUEtpS3dZ?=
 =?utf-8?B?dUMwZG5QSmVZTURPbVFiM1ZLdVVnMndGTDF1TnlrcDR0ZUg2eDZEUWNkcllJ?=
 =?utf-8?B?aTExUVhabUloRkgyRlV2RU1aK3ZRY1ZmbnRoc1VNZlkwaU5IeFIzQlJld1hk?=
 =?utf-8?B?b212UHhXRE5kZFFPcGs0WWt4Y3k5Ri9ITVdpSWxZNjdyZkNuZ3RKOU1Vb2JF?=
 =?utf-8?B?bVpsYmdvM0tBc3pGZlVxLzFzU0NjS1Bjd3VsakZiN1E5TzZOWW15Z3lYMW5x?=
 =?utf-8?B?NWJQc1U3dTJjbGNpanNSaDRJc3hMTTJ5ZnJkWDUzYXlNcUkxNTN4VDRHS0dh?=
 =?utf-8?B?c0RRbWIyRmQxL2lSTVV4czlEdkcxQk16QXFBamVoZ3N5c3EwZ0lUMk9yd0hJ?=
 =?utf-8?B?VGhZTWpGZkF6c0dvTkpvckExUit2NFdYUVRzMjhSNU5DSnUrV2RLbkNlSnZt?=
 =?utf-8?B?Y0VIeHF0SFU1MDNnSDRCL0JWTWlJcDUxMExQRGg0Mkp1NTdRUkVPOWk2cEpU?=
 =?utf-8?B?TlRZM1JwZDNJdW1SWHlLUVpFbnU4bE9lck5qNytTM3AxVW5nT2FaYlhzZ091?=
 =?utf-8?B?OTIrekxiVGZScXNCS2p3ZkNtRFMzRkJYMUhacTB2TlJ3WHBobC94MmVvYTQ3?=
 =?utf-8?B?TkRSZWdweFBGM1Y2WDZZWGtPMm5ncnlUeHdmM1BCRjdzZ3V0bGRwNjN2OHJh?=
 =?utf-8?B?VGo3bjJvMjhoMXlNbTNZL04yZnNwRDliWWJjMjUzZ01IMGZBNkVUTjZBSVYy?=
 =?utf-8?B?TGZyUkF5czFzMVZMWnJIZCtGZzEzZS9XRW1zTm9VeDFqT254TmNieTNzSE1Y?=
 =?utf-8?B?dS93U3ZHaVFkSTJSUlIzYytvSWhmV3c2WUxHRHExdzY5MThIZ2xJSG5RNHds?=
 =?utf-8?B?RTNQVld3YUc1U3k2Y2MrVlMrSjB5djU0RzMzU2lreDNMcWVLQ1pzczVyd2c5?=
 =?utf-8?B?THlhSlpySzJuUGhTTktNUWdEMGZaRHQ0YXJHOU5qc3NjN3BxZnRhcmJPMFNQ?=
 =?utf-8?B?dTdmYjJzTGZZUkNpNjdRYWJDYzQ5WjBWaGdyakgvMHdlcUd6QU5KaU5rRnkr?=
 =?utf-8?B?Zmw4ai9rc2tRZ0JrQWxpYWlqMlJpTFY2S1MzRk1OZDlrU1k1ck1WN2ExcS83?=
 =?utf-8?B?eFRqYXUyNUVyQzRQZnFjaEtIS0ZiM3FHd29tR3RDWGRWUEFJMGE1MzVmVmtN?=
 =?utf-8?B?ZFV1cDl0T2tOMmZSNTYrY0FDUEFKaXVtTkpabjFoWnNqMGVUR2UybWZoR3Rt?=
 =?utf-8?B?MVdOaFNkRGlzLy9vVHQ3NVU0SEZIMG1XUU9tWE12ZHRPYzcxQ0FxZXBSS092?=
 =?utf-8?B?T1cvVERLNHdzcUtuUXYvOGhYU3V1Zm5KcWFLRmVCcmE0aXl0cXhFa1JpcVZR?=
 =?utf-8?B?eWMrNElicXJUUk1KU0pUTFY2VVlTdG9DRGZXM0RCc2dINzF3VWNzY1NlaTBo?=
 =?utf-8?B?bHdMUm5xeGhFdExWcGI0YVBYQ2JscCtZTHhqM3c2RlNzQTh6a1VOaCs5Y0Vn?=
 =?utf-8?B?YjlSS0tGZDdCQWlMMys1LzJFT1hvbVlCNHdqckJ5SnlCVGc1MVUzT1VEcTdF?=
 =?utf-8?B?NjdpZmxiOXBzQ0luQW9GeDRTR1RnYlpFSjRzQT09?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(30052699003)(82310400026)(14060799003)(35042699022)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 08:40:30.7844
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88f0fedb-5b69-4ddb-48c2-08ddb7b1c59b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A78D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9785


On 30/06/25 1:49 pm, David Hildenbrand wrote:
> On 30.06.25 10:12, Dev Jain wrote:
>>
>> On 30/06/25 1:25 pm, Anshuman Khandual wrote:
>>> On 30/06/25 10:18 AM, Dev Jain wrote:
>>>> Suppose a folio is under migration, and khugepaged is also trying to
>>>> collapse it. collapse_pte_mapped_thp() will retrieve the folio from 
>>>> the
>>>> page cache via filemap_lock_folio(), thus taking a reference on the 
>>>> folio
>>>> and sleeping on the folio lock, since the lock is held by the 
>>>> migration
>>>> path. Migration will then fail in
>>>> __folio_migrate_mapping -> folio_ref_freeze. Reduce the probability of
>>>> such a race happening (leading to migration failure) by bailing out
>>>> if we detect a PMD is marked with a migration entry.
>>> Could the migration be re-attempted after such failure ? Seems like
>>> the migration failure here is traded for a scan failure instead.
>>
>> We already re-attempt migration. See NR_MAX_MIGRATE_PAGES_RETRY and
>> NR_MAX_MIGRATE_ASYNC_RETRY. Also just before freezing the refcount,
>> we do a suitable refcount check in folio_migrate_mapping(). So the
>> race happens after this and folio_ref_freeze() in 
>> __folio_migrate_mapping(),
>> therefore the window for the race is already very small in the migration
>> path, but large in the khugepaged path.
>>
>>>
>>>> This fixes the migration-shared-anon-thp testcase failure on Apple M3.
>>> Could you please provide some more context why this test case was
>>> failing earlier and how does this change here fixes the problem ?
>>
>> IMHO the explanation I have given in the patch description is clear
>> and succinct: the testcase is failing due to the race. This patch
>> shortens the race window, and the test on this particular hardware
>> does not hit the race window again.
>>
>>>
>>>> Note that, this is not a "fix" since it only reduces the chance of
>>>> interference of khugepaged with migration, wherein both the kernel
>>>> functionalities are deemed "best-effort".
>>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>> ---
>>>>
>>>> This patch was part of
>>>> https://lore.kernel.org/all/20250625055806.82645-1-dev.jain@arm.com/
>>>> but I have sent it separately on suggestion of Lorenzo, and also 
>>>> because
>>>> I plan to send the first two patches after David Hildenbrand's
>>>> folio_pte_batch series gets merged.
>>>>
>>>>    mm/khugepaged.c | 12 ++++++++++--
>>>>    1 file changed, 10 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>>>> index 1aa7ca67c756..99977bb9bf6a 100644
>>>> --- a/mm/khugepaged.c
>>>> +++ b/mm/khugepaged.c
>>>> @@ -31,6 +31,7 @@ enum scan_result {
>>>>        SCAN_FAIL,
>>>>        SCAN_SUCCEED,
>>>>        SCAN_PMD_NULL,
>>>> +    SCAN_PMD_MIGRATION,
>>>>        SCAN_PMD_NONE,
>>>>        SCAN_PMD_MAPPED,
>>>>        SCAN_EXCEED_NONE_PTE,
>>>> @@ -941,6 +942,8 @@ static inline int check_pmd_state(pmd_t *pmd)
>>>>           if (pmd_none(pmde))
>>>>            return SCAN_PMD_NONE;
>>>> +    if (is_pmd_migration_entry(pmde))
>>>> +        return SCAN_PMD_MIGRATION;
>>>>        if (!pmd_present(pmde))
>>>>            return SCAN_PMD_NULL;
>>>>        if (pmd_trans_huge(pmde))
>>>> @@ -1502,9 +1505,12 @@ int collapse_pte_mapped_thp(struct mm_struct 
>>>> *mm, unsigned long addr,
>>>>            !range_in_vma(vma, haddr, haddr + HPAGE_PMD_SIZE))
>>>>            return SCAN_VMA_CHECK;
>>>>    -    /* Fast check before locking page if already PMD-mapped */
>>>> +    /*
>>>> +     * Fast check before locking folio if already PMD-mapped, or 
>>>> if the
>>>> +     * folio is under migration
>>>> +     */
>>>>        result = find_pmd_or_thp_or_none(mm, haddr, &pmd);
>>>> -    if (result == SCAN_PMD_MAPPED)
>>>> +    if (result == SCAN_PMD_MAPPED || result == SCAN_PMD_MIGRATION)
>>> Should mapped PMD and migrating PMD be treated equally while scanning ?
>>
>> SCAN_PMD_MAPPED is used as an indicator to change result to SCAN_SUCCEED
>> in khugepaged_scan_mm_slot: after the call to 
>> collapse_pte_mapped_thp. And,
>> it is also used in madvise_collapse() to do ++thps which is used to 
>> set the
>> return value of madvise_collapse. So I think this approach will be 
>> wrong.
>
> But if it already is PMD mapped (just temporarily through a migration 
> entry), isn't this exactly what we want?

Good point. I was about to say that what about PMD-folio splitting 
during migration, but then

during unmapping the folios, if we cannot migrate the PMD-folios, they 
will be splitted via

unmap_folio() along with the PMD, therefore we can be sure that if we 
encounter a PMD

migration entry, then eventually it will be converted to a PMD leaf 
entry on migration success

or failure.


I'll merge this into SCAN_PMD_MAPPED, thanks.

