Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010000.outbound.protection.outlook.com [52.101.84.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7034813D52F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 16:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.0
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749228603; cv=fail; b=vDsuouVvLpJO9GCryowVOA6TsEPHZQcrqDDUiOLiYcrMNGitEzgRHqQU177mnEUN6vFBdZQnJgUhOPfDB9ThyMCgEBxLxx/ul2C/+//JJ8pVkzG0axTFPb2Zb8aZYuzk+bg8EV5MIQRcsbHAXPBGrYr35lawt4WZhxnzt7qcNN0=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749228603; c=relaxed/simple;
	bh=pdDh0JEQdhEIuln0oyxvQdz0bfcsw4BlU4K8Ds17UQE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Fx0/ErWUYptuLgUKSQqmAVLiocWr3YlCqD5szNhO8q9u0CMhWuhZ0PKmhKCtoL5TYp7eFYeYMMmuvGwcDjBBNDUkkPK7AYA3KDxvh9lhDTF6Id+vuQsF1PzO4J45dkUBtDzvL4mOVZEDULEeQA7dLlSYnhMCW7RmSKIZLbnXrIs=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=KqzcAQi9; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=KqzcAQi9; arc=fail smtp.client-ip=52.101.84.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KqzcAQi9";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KqzcAQi9"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ud4rEN5HchNlxgYsBvsiiHwpX1JTxDEJP5XEmf9LG5LZIrAWAcfkqgz+d8ZvpfTZOzEIc3hyRryrpEyQm5Vl8um+qdu32yaE3jZo8hKqgQk4l0zAPzsTqdVGyMfEPJZnytX1apiTpZg0PdsUWx4M0wEJx11vAXHBQqFbgos3OkcoL/8fTEB1c3S21c6wW8KdcJzsYkzQym/OB6VCG5CQuOf03Wb6bosb5YdE96iJW2bs5DAnaKh2ZIeqK2MEhk73tfsgaYKgKwNBsMd99/q8Mg5QExI4JBt8lWR0cJrzc8mwr0mbVzGCvryKP+yjz3mtNcGBQ1L15NZMqQK67mpCmQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5S2dghevEJtimfDFWR109u2cgIZVYgxs8ws91F0ZMz4=;
 b=FPoZiVoo5M7GkwNd5LkHS315k4R0haqkRb/2YtqjupNsyOSuScF5mM53aEYKuELLOoq9m9EMweOI4I0j24O0cD8buAcQM1gmn1Vow/ucWkHHft2IdyoBfWM4bIt1oH8DDhRN+ySFMFi8obgf5Ztam4Tlhask1GoOXVVgVm1dQqZBxkuW2PuLXSG/bfk03y/4Ftgfve+Lt6tGnvWaH9hN+4z/AonUQ9cSeDOPLGkZk+z1yRteEJu1q7ApOLdVUUd3LX4JIQU+xXfuTCDTTTZG1FAvLx1TlwjKtGlFFRqeSHapn3tCI2VhzQtgdATHZTKbNyOO0xOcH5psjl5P+8Vbwg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux.alibaba.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5S2dghevEJtimfDFWR109u2cgIZVYgxs8ws91F0ZMz4=;
 b=KqzcAQi90HnVDARlsY720sdo0zFISYSClrQ5QLZjO0EV++PKxPDTeajfcUsTOOWhrAXgTX4dpUY3uL45RhjzVizTBSEuY9ns+hhFMx3u8foPDuqFNERYhM5pba7oWCKbEqTaqd22noDvgefJo4cmFdtlCxrPjise+O+y+SywK40=
Received: from AS4P189CA0011.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::12)
 by VE1PR08MB5792.eurprd08.prod.outlook.com (2603:10a6:800:1a6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Fri, 6 Jun
 2025 16:49:55 +0000
Received: from AM2PEPF0001C716.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::6c) by AS4P189CA0011.outlook.office365.com
 (2603:10a6:20b:5d7::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Fri,
 6 Jun 2025 16:49:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C716.mail.protection.outlook.com (10.167.16.186) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Fri, 6 Jun 2025 16:49:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XtwX0JbNS6L/cwQP5xVLKl93xHrAqmi7NDJb55YgbXV0oLJlCyrk4kvWFZcTIvyZVdxajPeTBQIb4/ZdCfab0OnTcVz1m3uwlptsbLAmtzrHdCv0bQajiqB86WJ7Y8A+m02Opa6Kz8jD1iZQ7lIqhDX8HKKQRit/bqHSA0Ik33EQKx92YGhgaGaQ/W84Pi96NcAALT3bIzRHDp7qhpniEP0u8Mum9M2AHp03AtBAbuN5r8uIAxfl7S7Bg6Wf4senIzX8ZDDg5qyDIJP0IdwLYaDxBUbd/UKFsehVjT7PGpQopu3z0PeOjdUYBm2mz6IcuzDb2U8OwPgwP40r97S74Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5S2dghevEJtimfDFWR109u2cgIZVYgxs8ws91F0ZMz4=;
 b=pIFmSc4uob8mMrorH1ZPczj86B9Vsbqh//xjzRCvXvr9lqI+o1mOnN2RbVZy3GrIdR1PNmIeQu3UwpkeBR8FlM/gODrQbD1a6sn1ZD6m1pQSVT6Ta64i4E+cspYdN3cajR2tYx71l38FariGzMZdvluZdZTHWbeVM5YA9yDEyjFVS0ClMILaDvGOVaXZ/HF/oONM/uSkoHirPpJRvfKGZJkY8uN8ywM58lNKNzXLwWI/1FQn9LgaIGq2bEecPgVagCiEf8ufIF95CXzlB4JpSAjBtQgVV+UBi06zHC2sL/1JwX/jNky7ZrOMqfwZDhacTHLNJN4pAO0RfadnbZAcYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5S2dghevEJtimfDFWR109u2cgIZVYgxs8ws91F0ZMz4=;
 b=KqzcAQi90HnVDARlsY720sdo0zFISYSClrQ5QLZjO0EV++PKxPDTeajfcUsTOOWhrAXgTX4dpUY3uL45RhjzVizTBSEuY9ns+hhFMx3u8foPDuqFNERYhM5pba7oWCKbEqTaqd22noDvgefJo4cmFdtlCxrPjise+O+y+SywK40=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DU5PR08MB10579.eurprd08.prod.outlook.com (2603:10a6:10:517::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Fri, 6 Jun
 2025 16:49:21 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8813.018; Fri, 6 Jun 2025
 16:49:21 +0000
Message-ID: <c5ba98b8-a686-4a70-92e3-28d76ce05d1e@arm.com>
Date: Fri, 6 Jun 2025 22:19:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mm: huge_memory: disallow hugepages if the
 system-wide THP sysfs settings are disabled
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 hughd@google.com, david@redhat.com
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, ziy@nvidia.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
 <8eefb0809c598fadaa4a022634fba5689a4f3257.1749109709.git.baolin.wang@linux.alibaba.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <8eefb0809c598fadaa4a022634fba5689a4f3257.1749109709.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0092.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::16) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DU5PR08MB10579:EE_|AM2PEPF0001C716:EE_|VE1PR08MB5792:EE_
X-MS-Office365-Filtering-Correlation-Id: 54fc0958-4e94-490d-cba9-08dda51a29b8
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?SWgvUEtjQUR2eU5EeFAvMVdySnNBamlPd3NwNGtRd3VpV0tlZmFxK2pTcXdI?=
 =?utf-8?B?UE40SWhGa1dLcWFUa2d4SFB1RFU5QVhIdHBMbDg0NFdZaWo2cS9MbENPUkFQ?=
 =?utf-8?B?eWp1MS9TajlRY29FNzFWVlQ1R0tjbUloS1JXNml2dW5kQ240aDEySXdibHMz?=
 =?utf-8?B?YXRSVncwOXdYN09hYlVSTnRqU3B4YThRUzZUdDk0YUxxdk8zRHZ2VGMwV3Zr?=
 =?utf-8?B?Zi9Ob3lQYUNZeVNFSjByS0FKWGhIcFpCYnhEZWVRaWdhdzg3eURNNkJuVlZh?=
 =?utf-8?B?RGQzYTJaNTFFQnhoUGZIcGIyT08weXZZK296eUdCaGNxUlR1aTIyNFBFdVlT?=
 =?utf-8?B?Z1BnUmlLN090UmNGS1NDMlNhTTlXR1lzL1pldEZVT3JvR3h2cE9PaW9GOWNK?=
 =?utf-8?B?cVJPSzZnUEQ1WFJCeXVsZVlDU1VHRk50U1FacGlyUVpJWDU3Ykc5ZmZlMWhK?=
 =?utf-8?B?R0tROTNjYjk1MU1xZmpZUm1NKzFyaXkvcm9Lc2FpWkhjZXgwUllKSmJENjBS?=
 =?utf-8?B?N3pBYjNDZnFiNDlzdjhGSjRNN0NWcDNLUEh3OEZlRXVyaktvVDJhV1FMazlE?=
 =?utf-8?B?RTJqREpxNzlYZlRnNEtWcGtvMGFOQ0RvdkdRYnBweEo0WlAvaU41dHdpVkdh?=
 =?utf-8?B?OEo2UVl6Uk5CYU0yWUxkUTlrVlRaNzVqalRpajR2NXJaRDdlRTc0WVU1dS9B?=
 =?utf-8?B?TnU4cUFmalExdlVIb2VsQlNwNHNXZkRvb3VVL1EzT1NmNnE5WitXUWlIcXpK?=
 =?utf-8?B?QU9BWkQ3SUU1aWxzZk04T05nWUdXYjdqL3ZES3Y0ZU45US9GZmFtRDdtNC9Y?=
 =?utf-8?B?NUZkUG5Sc2RqaUNUUUh2QWVwR2g4QmJ0VEJNeTV4NVZWYzJaeVQzNktzT3Ju?=
 =?utf-8?B?bHlnZTBIMnR0N2QyNVJSY1RFUDhBTG1xdG1mNVp1MlVEWVZPUS9jMnJxTjJz?=
 =?utf-8?B?M1lhWkV1K3JYeUhubVpZSlhjbi9LemhSU1BIU1dVdHhoci95LzQ5MFg3eU91?=
 =?utf-8?B?bTZFaGtqT3QyTjYzSS9YWjZwQXlzOGtFUUUraUdpaU1IaGV5SVFwdmZudjZO?=
 =?utf-8?B?c2xTR3FHVGpKakloS0xoVGgrck55MjdYVjUyV3RIeVB4bEVySytpOXNvMjVO?=
 =?utf-8?B?d2ZCV0ptOUpVbC8rUy9PRFBoOEp0VVRObVRjZlIvUDlwZjJ0ZnlMNCtraDJk?=
 =?utf-8?B?WlQ0bnpIaWhwMklQSnYwdmp4Y3NFQktUZDVkYzJucFhDWU0yVDBqTlBBdWN4?=
 =?utf-8?B?WWsrdzMyTTRVM3A3Ry9Rdlk2aGlSOG9Dbmw4VDNPNTFvQk1GTGJJaDZtem1N?=
 =?utf-8?B?bnNWd3FvOTR3SFZxNEdtdFlIdDg2WkR6cFlKWlUxZUc2cDFRaitZNHRmcVdJ?=
 =?utf-8?B?OU5zUS9MZXlUWW1mTkxGcFEweUtLWGR4NmRIeW44OEt6VzNxR2QzVG5xS25Q?=
 =?utf-8?B?UmE1YWFLRExCRnJuS2FXSjJPY0JqUmEvT3RQYWpzdGVrN01XVER5V3BWSXpr?=
 =?utf-8?B?WnVMRWR3Rno4SUs3UXA4cHNWYUcybWhreStOeUZaWkhOd0orcW1JVWIyQ25Q?=
 =?utf-8?B?UFNIVEo4b3VtR2FkdU1IekNIQUVCRkJKRlpTWnBGRWJVaFZ4ZThFbFBvZWh3?=
 =?utf-8?B?NG1nUkFtb1QxMnl5K3lFenhKaDZjVS94eHE4SnpBaW15ZTJrOG91cEdTWmRv?=
 =?utf-8?B?bXBYU2V2bG5aRU5YVUhmTFBIWUZ0UEJzVUdVekZBNkJEQXY4MTN4WlUxNDhP?=
 =?utf-8?B?c0MzUkpHN2JRRHlkV2Y4T0hXWjBHSEhkWFlOVXY5MjRTaEt5SjJ4KzJJSGFW?=
 =?utf-8?B?UStpVlVhSERiSjNkbnR2Zjc1Q0NmZS9pNHEwNzBuQlRVR1dmY0krVTNIdld1?=
 =?utf-8?B?dkFrZG9IRUdzWXNkVGIyc3FrM1pINXN2eUFzblNUVHVwVXpTTSsvamp3MHZG?=
 =?utf-8?Q?0c0k3+LoF5c=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10579
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C716.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e1827d5d-1191-46aa-e985-08dda51a15c6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|14060799003|36860700013|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VThxK3ltbUVxZGwzLytVcFRTMXU3SDdBSlBlUDNDclcrdmtHWVRiK3JDWHFK?=
 =?utf-8?B?czZoS3VRT0QwbCtJRm9Qb2tTbXVvd1h0Um1YVHNXb25lSDNEYUV0RGVaajdp?=
 =?utf-8?B?cmtBMGpkbW04NVpuL05DbnB1T3dQS3VrTHRkWDJoM21lUkJFczZ5NEU5ZkJn?=
 =?utf-8?B?UXYrUGx5SldqV2cvVWVvQ3YvdWltWUlFcjhBS2hTNVJvc2tHb0dHRy9uQ0VJ?=
 =?utf-8?B?SmhoL0xTK3VjQUNPQ0hYKzY2OFpTcjVyTTNxMURyWmhjT2tKakFBWFBRYnA2?=
 =?utf-8?B?ZHptTXdwdFhiOXdPV1pEUTV0aE8zYy9CTFZJU1luQzZvL3pCK3pUYmtVUFRF?=
 =?utf-8?B?d2gzWHJ5ME0zdlVaaDVDNFNrbTFFUmhCbWd1aXhNbGk5QWZTb2ZILzFCbVF1?=
 =?utf-8?B?a1RzNTcrSXptU2NrczlXVlUvbDVEWFo4KzVCbEl3cUFTVUdiYXIycWVUaU5Q?=
 =?utf-8?B?N1liblArNm1pSEdvWWFTcW0xb2thd2h5b3NXRmtCMzVnbzk3bUhscVN1aC92?=
 =?utf-8?B?dkpjOGpza1kyRUtmL1pCVnp6ZFRJb0dZSWlNTVo2T1pMYnN1TWtpT3FVb1Q5?=
 =?utf-8?B?SllVZ0pZRTJ4NE8yUDROaEs0bGQ0NjNtUkFKcWRIY1g1dmJIc0QwSWUwd2tv?=
 =?utf-8?B?QkwzcTRTUHJSUkk3Ry9vN2NENG0rYzhWbForcm1yeFVZSEtCVXlBYTVhcTls?=
 =?utf-8?B?RjFCR1ZKNWFUeWsxUGt4TjZFTVhCOHJFOFNTRmN0YVBZdjRWN0I2K3N6OURu?=
 =?utf-8?B?ZXZwc3BBbXFNbjlqYzh3dXdCbFRBN1pKRk0yNnI4b0tmcU9INTdVTnA4ZWxj?=
 =?utf-8?B?T3pBTHI4d2lrUGp2YUh5QjAyZmlJeHJiN2hrYzY4UDV0eHM4VFZRWGNnZWFn?=
 =?utf-8?B?U0lhcG4rbVFGNFRLVnhWQmZIT2dKRmVpdWROS2JuYVF3cm8xOXE4NmtPRXFQ?=
 =?utf-8?B?STFyME1nNm1aSGxIV1IxRkVubjI2Tmw3NGJ3dXBPbXZZVkNKdFNWQlR0cUF3?=
 =?utf-8?B?Q2tEOUtkNTBhR3N3UHd0dVlFUnRMVE15dDRkYlVGL2FibHlGOHBQTUpsbUhL?=
 =?utf-8?B?UWd3M2tFclR3b09xUHhjZnFEMkQvKzNZU3o2Rzc4SWVBNVJ4RExDbFZLTlZJ?=
 =?utf-8?B?YjJ5bGhyMDczemdXcytDeURLejVxcDQ5ZXZNajJRQWx0ZzNvemdCK0tUeHov?=
 =?utf-8?B?VzFtcUViSTR0citqbHpLbktuWURtWnhWM1A0c2VnTFBVYUo3THQyWTRJTDZW?=
 =?utf-8?B?d2JLTkV6RUlGRnR3MkVRU1Bzd1FUWklHWVdjWng2dGRLekdKZHJYWmVWS1NT?=
 =?utf-8?B?TiszVXc3Y2hVamd6b243TnNTcjMyd3VRRGp2TGh5UGl1bE5vK1BkUXFBYVhx?=
 =?utf-8?B?WTNzMDBXK3liRzY4c1JqZVFuMXVYT2Y1ZFkxMGpOeE1vZ3YvUjNNRzhoQVpm?=
 =?utf-8?B?N2haUGZIcUtoaU5ETXg1SlB0OXN4VXRucHRIdUhzQ0Z5NEVYMkRPMGVKSCtI?=
 =?utf-8?B?amN2UThONG9oeXhsS0trQTR0ZG1mQmw4OUFQR1RrTFNvRnN1TWdSK0szVGdM?=
 =?utf-8?B?NFR0STkvVXpXUVdjQkNvTjNJL0dwTGgwbXRUcGZkeUF1N2N6K0pyTFhHQUxq?=
 =?utf-8?B?QXE4eFQ3ZHN6SGYxNFpQUGhZOE1Vd3R4b056RkJGOGxHNUJlMHpYY0VpRG96?=
 =?utf-8?B?bEVJWU11eldnQWRFYnJmaVJPU3I2T0Q4bjlyNFR3Y3NDcnUwY29qaU1HaW9V?=
 =?utf-8?B?dEw4QnVrOEtpa0FYdTBpZEpNRk5SKzA1UFhnenIyd242K0tMRkladVVSVXRv?=
 =?utf-8?B?TnVDWVFGLy9yOUVIS3U0Yit5ZWhLcWRHaURqVHhRR2tlTkVCZ3NoKzFKZXFZ?=
 =?utf-8?B?NHZrSHJCNXdnZWU1cjZNTDFOM2t4Z3FkQTFDaFdsTEVxYmFkZnVSbk5OWXor?=
 =?utf-8?B?aVZIOG5DYXZRL2ljL0packtBalR5UHBVUDMveGNhN0FXbmRlTXp6N0t0ZFNC?=
 =?utf-8?B?NEJoMk5kNkdaL2N1aVFYWk11eG9DeDBNZi90VHhielNWdWl6SGJTem52THh3?=
 =?utf-8?Q?Eo5s+M?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(14060799003)(36860700013)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 16:49:54.3268
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54fc0958-4e94-490d-cba9-08dda51a29b8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C716.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5792


On 05/06/25 1:30 pm, Baolin Wang wrote:
> The MADV_COLLAPSE will ignore the system-wide Anon THP sysfs settings, which
> means that even though we have disabled the Anon THP configuration, MADV_COLLAPSE
> will still attempt to collapse into a Anon THP. This violates the rule we have
> agreed upon: never means never.
>
> Another rule for madvise, referring to David's suggestion: “allowing for collapsing
> in a VM without VM_HUGEPAGE in the "madvise" mode would be fine".
>
> To address this issue, should check whether the Anon THP configuration is disabled
> in thp_vma_allowable_orders(), even when the TVA_ENFORCE_SYSFS flag is set.

Did you mean to say "even when the TVA_ENFORCE_SYSFS flag is *not* set"? Because if
is set, then we have to check the anon THP sysfs config.

>
> In summary, the current strategy is:
>
> 1. If always & orders == 0, and madvise & orders == 0, and hugepage_global_enabled() == false
> (global THP settings are not enabled), it means mTHP of that orders are prohibited
> from being used, then madvise_collapse() is forbidden for that orders.
>
> 2. If always & orders == 0, and madvise & orders == 0, and hugepage_global_enabled() == true
> (global THP settings are enabled), and inherit & orders == 0, it means mTHP of that
> orders are still prohibited from being used, thus madvise_collapse() is not allowed
> for that orders.
>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>   include/linux/huge_mm.h | 23 +++++++++++++++++++----
>   1 file changed, 19 insertions(+), 4 deletions(-)
>
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index 2f190c90192d..199ddc9f04a1 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -287,20 +287,35 @@ unsigned long thp_vma_allowable_orders(struct vm_area_struct *vma,
>   				       unsigned long orders)
>   {
>   	/* Optimization to check if required orders are enabled early. */
> -	if ((tva_flags & TVA_ENFORCE_SYSFS) && vma_is_anonymous(vma)) {
> -		unsigned long mask = READ_ONCE(huge_anon_orders_always);
> +	if (vma_is_anonymous(vma)) {
> +		unsigned long always = READ_ONCE(huge_anon_orders_always);
> +		unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
> +		unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);
> +		unsigned long mask = always | madvise;
> +
> +		/*
> +		 * If the system-wide THP/mTHP sysfs settings are disabled,
> +		 * then we should never allow hugepages.
> +		 */
> +		if (!(mask & orders) && !(hugepage_global_enabled() && (inherit & orders)))
> +			return 0;
> +
> +		if (!(tva_flags & TVA_ENFORCE_SYSFS))
> +			goto skip;
>   
> +		mask = always;
>   		if (vm_flags & VM_HUGEPAGE)
> -			mask |= READ_ONCE(huge_anon_orders_madvise);
> +			mask |= madvise;
>   		if (hugepage_global_always() ||
>   		    ((vm_flags & VM_HUGEPAGE) && hugepage_global_enabled()))
> -			mask |= READ_ONCE(huge_anon_orders_inherit);
> +			mask |= inherit;
>   
>   		orders &= mask;
>   		if (!orders)
>   			return 0;
>   	}
>   
> +skip:
>   	return __thp_vma_allowable_orders(vma, vm_flags, tva_flags, orders);
>   }
>   
