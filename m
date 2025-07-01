Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010069.outbound.protection.outlook.com [52.101.69.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC30A47
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 05:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.69
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751347434; cv=fail; b=N+iCt7Yay1kBFOW+v9M9X6Gffnfpe3v+5EyN2GsL/d8vziUi4Vv9AOGoECsgPag3sQiGCW2uzH43+3H4DPeCYY0ZYpqUrHzKHIMGYryOZeD6DqgD6sIPrQYvyN9nuuL67xwP3vHkxLuLz5nd8h4i3luChwTn6fPOLjhbGGw/BVg=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751347434; c=relaxed/simple;
	bh=h8S/XzaB/cPVhfeXmNbLvaZgDS5s8axhG6is3W2PgMM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZdHthC8T5THVfe7ykR5iKsgifBV/vUZ9WS4zxaYhNT80G+Jgq2gUTXIvBMlhGuxBua/VeA/NqxMMo4mhTBTJqZK/It7x/X40etHGztT2YVQ4B2JZgqHbrzUPWiroLoqF2xyiGDsxdowrIMlaPY11RvnwVRpDsxq9Ib1VZqPqmVE=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=CYzRiGLs; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=CYzRiGLs; arc=fail smtp.client-ip=52.101.69.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="CYzRiGLs";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="CYzRiGLs"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=O6MFRW9PRReapGTGa5OGYVfYYu0c8/jyCU5MZYbTKE5KvABEDPI3hu/2XZOuR/upK30Qi85N/9foZcxLJe7D18McgUZ3fI2/AF67UOn26qzHQaATw0AXv9ioToiGHii3al1d208K/3o9pDuFNxoiKaiXeLmODbJmBl9xSBJGzdvcULDpFfe7CEwd5eQSNJU80VqgE5xqPZa6aJ5FR+1suuuK3upuV6ED/f+/NEbNphUixLc3xpD04SMPSa1m860FZJTFSGKmXUW4+t3K22gzMIIoyzPV4UlrLVBjwen4wSeVCJfLAD5vM5qwB+z5P5LgasCsSFSHr9dFEZpFZQ++tg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38W/6fO56+IJKbEQ4CAinXCtQ+SnLPvT/dR4Lc/a194=;
 b=oPOGhelkhjZW8qrfHzEczuR+7BfpM+XHKOMnihCMJNz6/EE5HsuCOm16ZldxmQ11w6YqU/Z2SFwXI254sdalkqOYvsPAaQRmUtobq9oP9v9qWrNL7GhfrsmIVCu2SKWEdH8QPi+2OsBDnK+UAzwZV0GVvbGJFC0RpWgjbUJnG8LOveYpMOFWEO1Pw1+iTU3LDSxL24bZXwTYvEd5XkX39/f4m3K/INPkur2/badeuhi+WeplsoELncWBb7HsQQ/Gvw85gFAsOTUucIxXWqFJwqyNlMSXLOK50fB4j4FPAMxUKzGbY5tWdho7tLSulJpM7LoOiaKVorkyEpSDw4uWzg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38W/6fO56+IJKbEQ4CAinXCtQ+SnLPvT/dR4Lc/a194=;
 b=CYzRiGLsFi3NBVwFVdV1WJwP4oHLL51tvqHN4YpzLj8lcNP6px/h52AbREhgM3u5P9WDL1kPcEUgVPP5AjCx1LfTxJyjGa3qVjwoptd2zfn6MKweQvzL2igd2Os72ACnwQEO5Dynjjmz0OgYByz5JjCDDFO6ldQFFbQtmZmog+k=
Received: from DB9PR02CA0009.eurprd02.prod.outlook.com (2603:10a6:10:1d9::14)
 by AS2PR08MB9572.eurprd08.prod.outlook.com (2603:10a6:20b:608::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Tue, 1 Jul
 2025 05:23:46 +0000
Received: from DB1PEPF000509F3.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9:cafe::a6) by DB9PR02CA0009.outlook.office365.com
 (2603:10a6:10:1d9::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.32 via Frontend Transport; Tue,
 1 Jul 2025 05:23:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F3.mail.protection.outlook.com (10.167.242.149) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Tue, 1 Jul 2025 05:23:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EC8RU9FtQ+dmyQZRpycbHRJkwWGnIOKEjFhP2K3e5CWLdDajAi5zSomxBB/aAlzoFrdloXP20Q4GoTNiuRyqFTlOGeq27TamOZI+Thkb4Yn1vxhgBybv5Trez3Du0BJ85y8lpI/PKCF5MUUnROzS9RQvBcLBYatcwSkDxuqlf/5C9FS5YPCuJ0vWxHmJL5p3KK1tmxieqxOn+B2FHK1PFDa7LTPsUQ744QL6WcreFFsj+MQTUUWR408RVZ8wfV4qACkMwznWT6zO6fbQzzXfZqrOyNYfexmQuQr7LrR3nzuBHklW12Kr3ToNS0W8O/P2EyWRxLzgFkrZTBTm9FFFNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38W/6fO56+IJKbEQ4CAinXCtQ+SnLPvT/dR4Lc/a194=;
 b=Plj2shC7ju1FjErwhWUFzoV8NqGZNMT17HrmRjkuyfsIspJyyZSOpD2zJrX8loHQ7r9jaqySQaA5P1PDLyf2zil0ywOKgxBPHnN5kyLIOn8QoQ4V2SoBMAdHZQmFl6PI0fMQcSRDMSQqipdMmb04Wd7zLwuQr3PZwaVSA3PJnGKeXIYCuP65Rtd0eEjmJmvG8jOVnDBCjVeqgkg41CuyywmnAo/cuF2u2sKhybVGI4dvB1zZE5BN4x9Ed7pjscbei6/mPItYvvc7TKOr1Vl14al1qRkpcTT5rzKwNt2UU7Rn++dZTvBU28v7LRk4ETTLGrLMMRBWQutJzvm/oUulCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38W/6fO56+IJKbEQ4CAinXCtQ+SnLPvT/dR4Lc/a194=;
 b=CYzRiGLsFi3NBVwFVdV1WJwP4oHLL51tvqHN4YpzLj8lcNP6px/h52AbREhgM3u5P9WDL1kPcEUgVPP5AjCx1LfTxJyjGa3qVjwoptd2zfn6MKweQvzL2igd2Os72ACnwQEO5Dynjjmz0OgYByz5JjCDDFO6ldQFFbQtmZmog+k=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB7111.eurprd08.prod.outlook.com (2603:10a6:20b:402::22)
 by PA4PR08MB5934.eurprd08.prod.outlook.com (2603:10a6:102:e8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Tue, 1 Jul
 2025 05:23:14 +0000
Received: from AS8PR08MB7111.eurprd08.prod.outlook.com
 ([fe80::4ea7:7e71:7dd3:3b45]) by AS8PR08MB7111.eurprd08.prod.outlook.com
 ([fe80::4ea7:7e71:7dd3:3b45%2]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 05:23:14 +0000
Message-ID: <5816677a-705e-4a8f-b598-d74ff6198a02@arm.com>
Date: Tue, 1 Jul 2025 10:53:09 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BPATCH=5D_mm=3A_limit_THP_alignment_=E2=80=93_per?=
 =?UTF-8?Q?formance_gain_observed_in_AI_inference_workloads?=
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: siddhartha@kenip.in, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 mgorman@suse.de, Vlastimil Babka <vbabka@suse.cz>
References: <28338f055b3c9afa8b69ff6f05ea20ed@kenip.in>
 <4990838b-660d-46a2-b21c-67adcba61ff9@lucifer.local>
 <19714cae-6b73-43ec-af7a-1455196561d1@arm.com>
 <3ee2e7fea6f263aa884e3e715632b09f@kenip.in>
 <d8ffe547-5516-43e5-9f33-56b2698a0b4f@arm.com>
 <ba2c89bd-88de-48f8-abd0-b62d8b1d50b3@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <ba2c89bd-88de-48f8-abd0-b62d8b1d50b3@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0012.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::11) To AS8PR08MB7111.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AS8PR08MB7111:EE_|PA4PR08MB5934:EE_|DB1PEPF000509F3:EE_|AS2PR08MB9572:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f6d8ffa-e25b-49a8-9438-08ddb85f73f2
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?OUdRZFFmcVhUWDBkVDB4Q1dhMDVBOWxUVDNjTmYzRUo1Qkk5M0JGYUxJVXha?=
 =?utf-8?B?Z2lMMEZQOTRTT3hsWUxkTHUvbksydGcvZzFNSGFycFY1K0hMbXZyZFJIOC9W?=
 =?utf-8?B?UjBWL0RqQ0tNR3Q3ejByVG1KSElYYjEvcENPbnFsaEhqL21oSE9QSnQvcHhQ?=
 =?utf-8?B?WUpPclF1RE8wODRPdHFKMjJtbXY2QkVjZDF0Qk8rV2MxdmJVdlhKRHNQMVdt?=
 =?utf-8?B?czZSQStVaHpuUTVVSWpFcjlZYS9EdFh0YUw5c0sxUGw3dEpoRjZRazVWWndo?=
 =?utf-8?B?YURqZmpNV01UemZqdDdiNDV0aFJSclZkSUpIL2IwZldZbkFlODQ2U2lCZ2NX?=
 =?utf-8?B?d3ZVSzVoNlpqd1ovamxuVUs1WGU3SlNpOXkyY2M3SFpyYzVHWHBQLy9nK25I?=
 =?utf-8?B?dFhoeG5udm9uSEZxd2VKZk1BMEN6RUNyRlB6QkpOK2MrNjhiVjdNY0tMVDhH?=
 =?utf-8?B?b0VIRW9jenFBdUxoV00vYmlUVlZrQ0dmcGJBbVFPNC9RcEFtMmt4ZitkYzFQ?=
 =?utf-8?B?NFp5SXlOS2hoUmphdlErSXZYWHh1UU5qVGlwL1Z4V0pQUFRQTjBYNGlEWVEr?=
 =?utf-8?B?dGtwblgyWHpFKzBwNGtyWVRUWWh3SmdlZms5eGZQZjhOWDNMVk1tUDNEazY5?=
 =?utf-8?B?Si9MdVp5b3A0QTRYQndENzVOaUhWNUtBOStzNURqbTVRNjduMVVLd2xnbDJm?=
 =?utf-8?B?SGpKNUo4Z3FWVUlWTXJ3dmI5NmZoRURBZzc1RUZEUS9oK2kyU05kZ3FLUHJi?=
 =?utf-8?B?QktJa29hOExDcWNvVVRQUmtIRytKZ2pKM0MwUmVSeTdqWjVhNThVV1NQQzk4?=
 =?utf-8?B?d1A0UStqOGtnd3Q2MGdiVEJCc0VjbExETTI1Wk44dTd4emsxU1hGdVArSEhi?=
 =?utf-8?B?QXVnOFB4RUNhRmxvd0tzSmZpbGtxc1Q1YWppdmNyRy9ibzg0d2E5Z2c3cnR4?=
 =?utf-8?B?aDM5VkdVS2RWRkt1RDFyK1k5WEgwWlg0R0RoS0RVTHg0RWR1S1piVUhGeDI1?=
 =?utf-8?B?YWdjUTlpcU1MTXpqdUVzdURzNEhYVlkvaXdwa2Y1b1BDR2YvWWk2OEdQYmVQ?=
 =?utf-8?B?Zjd5Y1VKM1IzUWxqdWU0R2ZueXpCMWZoVjdhU2pqb0ZubGd4MzNPZjJTdFBn?=
 =?utf-8?B?KzdpZXdWd2ZqcS9kSk1yMjdJYUNpZlZZV1hDaThTZXdjdWw0ZjRLd2dKZTho?=
 =?utf-8?B?UW1mRHRmbXhwNDByTllWTm5zb0o0MTRXaE11UlpjOXVUaEZSNDdWRHNhcUdW?=
 =?utf-8?B?L1lZS3E4Q3Q1elc1SklScjZjUk1GU1Y3QkVKZzI0cjlqMXlLT3Jway95MVU2?=
 =?utf-8?B?cnREV1FmUzNUdXVieElyMHVlRUZWdDdhaStqWkZqNklDYVAweitlUlkwK0JN?=
 =?utf-8?B?TGsydmR2V3JhWG9HRzYwSHJweEg2eHBQcE1vMDhHTy9uYUhzN0pmczlMc0FS?=
 =?utf-8?B?T0lMQWlSRG55REtuNGZWbDlpVDUwVEVxV3d3Zm1QOXlJRmd2dUpqaENRNGZG?=
 =?utf-8?B?bVdqUkpaREllTTZaYkxydVlsMlBueEU2WGVpS1pZam4xbWQ1NXRMNElmYVhn?=
 =?utf-8?B?OVF5WDg3MFMyNXRkRElDTmlvSG8ra2JJMUxmcDcwMmhXWVNiOHlFbEZsWHUr?=
 =?utf-8?B?VnpWMkRyVWozekRBa3duY0RXcGl5aU5sbWg3Zzl0NnBjcklOamRHNVdQNlFX?=
 =?utf-8?B?RU5DcVdrcEFlU2lTdGdtaFJSVHVNazRKL2xXME51TmhwWkhVeXdVNmVvU1R1?=
 =?utf-8?B?eHpYc3plL1VrZ3dxSnpqZVlYZmF2N29rMzBMc1FtRVpaeWxtOS9WbmE3MEhl?=
 =?utf-8?Q?OHMTxhR1J3xxE/Nz47wPHuwwiWn+4bki+fg74=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7111.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5934
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F3.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ff6d8904-0a2f-456a-513a-08ddb85f60b0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|14060799003|376014|35042699022|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L0tGTFZXWnJIUXVqVm81QzZqTGg4aDRoOVRzZ2pBVnlMdUpLUVMySHpoUzZC?=
 =?utf-8?B?S2dyUkkzdENwYVpocU5JcStldnNMUGhzYksrY082bko2QlJ3bFdsNU4wNXl5?=
 =?utf-8?B?bjFrOC9ESTk4bUwxZDlYVW5IbmdiRGxQM1c1WDhWaE9XRFJqR1Z6ek5JR0FF?=
 =?utf-8?B?SGMzTFkrbndQQ0JQNUhUSkpWR2tGZlRTVGVaYmR1NkZ5a0QyZTdta1J0cldM?=
 =?utf-8?B?NmFGTVJlditTUG03K1J2dGYzUkNkcXJaNjUyQWl5MTFidStWS1BOaENtL3VI?=
 =?utf-8?B?eVM0MmtCRk1kdkhGQnNUVVI2MUFCMDFkcFp3OUFScjRPbktuQVhGUjRhUFcv?=
 =?utf-8?B?eXlCZHhqbmNQQzU3ZFNjbU9MSnZzcmt4b1NTaXdLMmFQUXJrOEhlV0pwWDFY?=
 =?utf-8?B?NEF6dHBLaGhTb1RHVFYxK054VVlSVmRBTXA5VVdLTUlJd0QyZTZ4U3Zxc25w?=
 =?utf-8?B?Q29SZmNYWUNNVmRwN0FlU3dGTDFRMUIyd2laU2FaZmlRYVA1MHFlWnN2QXVM?=
 =?utf-8?B?d3A1LzZRc3FSTDJqWDNDemZLSTE2dXY0MlZMQjNRRGhXMjU0dkwwS3AyVCts?=
 =?utf-8?B?c1NLUkM4OTJPNnV5ZlhoM05vbFk2R1RrOWZwUk54NU9LeWJBL0Z5WFBxc3Rh?=
 =?utf-8?B?UUk2YXVNckJka0JocXZWRC9RYUcvMFZtSExua3RRYXYyQjBYQVR4QlAxZzJE?=
 =?utf-8?B?QUNHaUNacGlzTFpZZ2RQdThySHh5aURUMXU0Y0Iydk5COTNpSmQySmRMQk5k?=
 =?utf-8?B?OGxDVlJ0cjJiVDNrL1ZVcFRqVks0eUp0ZHpFeUFQQ3JqL2lUWDRta2psRVlW?=
 =?utf-8?B?c1RkcExsSit1QnkxRXBKZjAzTmZkR3JOK1hwM3RzOTVHdm5GQlpJemZERS8w?=
 =?utf-8?B?emdPN2Y2d0daNXdkM0lBTWhaMGVZUXFOSUJBOVJxNEkwQ2ppUjRWT3JPYk93?=
 =?utf-8?B?Nm1xT01aV3o5U0JwOUZMeFExZFJmSHJqeXdsY0N3dTVvc21BTld3OWRlZ2xH?=
 =?utf-8?B?aUhKb0sxTWlic1VIeW5lMEQrSUNYU3dCNFZxb0VOQ1YyOXVIY0l0bnlzOGYv?=
 =?utf-8?B?MVNzUXZBNVY4cUtBazJyM0xTNmUyU2xkbm5ZZDhqV29Fd3laMit2aTMxQ044?=
 =?utf-8?B?MGV5bDJlYkxqa0NhWHgzTDZnOG9ONkdkSWFDVW8rY1hPY1FiaEdhRFpENXo2?=
 =?utf-8?B?c2ttaEdveEU3S1FJbUFPbFNqVk83Mnc4LzBBdDJzaXMyRWdQYWlsM1kwajA3?=
 =?utf-8?B?M1hKeXdndlpEanEvb0ZXTllhNCtHZE1pMWN4UVpvbGxhWmovWVo1WWR3NE1q?=
 =?utf-8?B?S2JWalAyWnZ2S1pDVkN6dE5lOUttcHpvWVRXZVJOSEk0RjMwYkQ3U0pzR2Ra?=
 =?utf-8?B?cEo1VTk1ZVpWd0VGWk1zendzVk5yTm92UWpGL2hYT292bWExc1Ivc3ZZenRC?=
 =?utf-8?B?di9zMXRtUFhnUm5ISHJ1NElDT2lnRHpXMVQ4TWJhdXlwYnhqT3VDZkUraGV6?=
 =?utf-8?B?dGxFR2g0R2VRNEJwSkZ0MFVqc2ZyZXJNRFh3YW1rREZySWRlYWwvY3dzUitS?=
 =?utf-8?B?QW9sM0NhMVhqZ0VhTG5PdDVBdGFPRkUyYWxLN0poUWE3THpEd2N4ejQ0S2M0?=
 =?utf-8?B?dC84alN5VWE1MXJ2ZitZTi96UzYyMkNHdVNRTWFRenI0cmhMaDNYRG15YUkr?=
 =?utf-8?B?L0JyRUIwb2pyOFF3ZnlBdU5Zdlc3eUFtcEpKbUh2ZnRTMnFpZm5OemcrVVFE?=
 =?utf-8?B?OE9KVmIyU1BJcFVRTVJxZ2ZGQUNVd1VySE12NjdMMEJhZ21IaFZCZlJqdG1w?=
 =?utf-8?B?ZlNUVEZKTW45R3FFMmU1MVg5QmhnVzhLa1BrQTgyazR3bDZxY3FDREQ5bWhY?=
 =?utf-8?B?Zm0zZEVZZlM4bHp1UTUzVG9hUUFMa1dWM0lFblYwK0NiZTJDMk5OWUNKbW1m?=
 =?utf-8?B?VGI4U0hnSkJSOHpHTm4vTkR5Umd3Uzd4UmJmNjVMbE13WDNBTGxFdnJ3SGNY?=
 =?utf-8?B?dkpsbXFkVS9nPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(14060799003)(376014)(35042699022)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 05:23:46.2184
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f6d8ffa-e25b-49a8-9438-08ddb85f73f2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9572


On 30/06/25 4:24 pm, Lorenzo Stoakes wrote:
> +cc Vlastimil, please keep him cc'd on discussions here as the author of this
> fix in the conversation.
>
> On Mon, Jun 30, 2025 at 10:55:52AM +0530, Dev Jain wrote:
>>
>> For this workload, do you enable mTHPs on your system? My plan is to make a
>> similar patch for
>>
>> the mTHP case and I'd be grateful if you can get me some results : )
> I'd urge caution here.
>
> The reason there was a big perf improvement is that, for certain workloads, the
> original patch by Rik caused issues with VMA fragmentation. So rather than
> getting adjacent VMAs that might later be khugepage'd, you'd get a bunch of VMAs
> that were auto-aligned and thus fragmented from one another.

How does getting two different adjacent VMAs allow them to be khugepage'd if
both are less than PMD size? khugepaged operates per vma, I'm missing something.
  

>
> So while you got speed ups on some workloads, you got really bad perf impact on
> some that were subject to this.
>
> The observed speed up was on a very specific benchmark also. While it's a great
> improvement, it's important to understand the context (see the original patch
> for details [0]).
>
> I do think it's worth considering changing thp_get_unmapped_area_vmflags() for
> mTHP, as it's currently very limited (just PMD alignment) and it'd possibly be
> sensible to change this to checking against allowed THP alignments, but I'd not
> assume this is going to get some crazy speed up as observed here.
>
> Note that any such change would probably require some refactoring in THP first
> to make it not quite so awful.
>
> I also think for Siddharta's usecase mTHP isn't really relevant is it, as intel
> do not support mTHP currently do they?
>
> Regards, Lorenzo
>
> [0]: https://lore.kernel.org/all/20241024151228.101841-2-vbabka@suse.cz/T/#u
