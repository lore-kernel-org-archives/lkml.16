Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010023.outbound.protection.outlook.com [52.101.84.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2D11B87F2
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 03:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.23
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750390490; cv=fail; b=WKOaML/hepjMcaG6csVCTVPUYLHIH552RId/HdQ/LuP3OCIM6e06NrCiIE46MTl8HR/pNw1WY6+W/p/K2f2EdHJjFu9p3cu3ikgV4ZEOfZ5DjIH5mXquoZ88/HmH8UNLzxm5YCmqbV4WaeSwJiu5+WEHsjDeqFN4oL9juJ/EU/U=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750390490; c=relaxed/simple;
	bh=yV3z74szO6AI10EPcguVzp984DCouX1H4rn4hdBj4zA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HlmThrZhEoru/BG4tY0IKRJysxCmtMOhby7ANLXXrJwcS8S29OabF+6UstNmuxqMeeOqfFgtO5hLkONFWfiyv/wZw4YZ6ux02L/C262gzzeJ53O6BgQj2C9ntETslx3yeeEbxhby4LjmFXxPAMB3AL6abDYh43P2NCe6zmE3Wmg=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=SFjzFkF4; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=SFjzFkF4; arc=fail smtp.client-ip=52.101.84.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="SFjzFkF4";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="SFjzFkF4"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=h65SRGlflo4r2nNMwLu8H0foTifeRB63aAcBmxYx5phGeewmgz2DbBlbR1gOxGtwjw+csIjkqcQDfquK4ANiOrsVds9A2Is4bAMY+SfZX1uqLfnNGeHZ9wkndy1I9hcx5KXlI6IJfpkk9KplN/yXaza4kTLQ0cwvYA39l/SqFxZSScFKTSZnDMazUWaFR2Tu8igXMVvzw5noErNHvFoCQZiTapCe9dTgK2SXm/WTPntCJtlLlnESohNViqdnoT2y0xtVGBHDJY41xBwYzoEl0HTZdAUZIgbfqbcAffdSIQ93sSY/8RVbiqTmqhwHxGKrj0NI0fOX4b3AxGJnnFBgcw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mXQlzT/x9+1sc//PhKWtUB2GVyhkCeC902Ceks8zQ+4=;
 b=XDLbEP2LSF7/L2oroMXuWy5anbVCXWxVdC24IRLIkU1eg4obLc0mApQ4Bq8F1CEi09+6SUn8uh5XZeVGVdwC3M+cD1J3qYfATAaeIu5FrBf0CLpKKWaqhfjMWynkOV+OrMr6Xcu32jFGz0VMrvAkCYm3lmv0KRRyGRZ6PwY+Ux4bmshmJv3pzsS8W5PuOLXkOVjmAdAYNCXTgW/Q0P7DNm95L+lwPLCPIt8FOrpSHBJcw4l0pqUF4TR9reEsU8hcsYFaHdycSQiRhieZiYc3gvtWgY2ibxKGcIKSb9nftc9DCp8Gwy/A7O09O1mR5AxG0faSfstxFR5Y5WPKDez4Ow==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=tencent.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mXQlzT/x9+1sc//PhKWtUB2GVyhkCeC902Ceks8zQ+4=;
 b=SFjzFkF4NjpdsP4o/wqsdmyYXCKZXpxm7xMZYt8zjxbxq5kElGGKMgp07N3uIy4zgym5V52e9qhflA78pJWyEuLYjdUJbxZpvUwt5Zh/vnnaJNBKKpMxoW9WEuSR3hsw8SJtZzhW7wubLO/9XGpeBW8B318pcqY/6V9WaBX5T3E=
Received: from AM0PR05CA0077.eurprd05.prod.outlook.com (2603:10a6:208:136::17)
 by DU5PR08MB10802.eurprd08.prod.outlook.com (2603:10a6:10:526::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Fri, 20 Jun
 2025 03:34:42 +0000
Received: from AM3PEPF0000A792.eurprd04.prod.outlook.com
 (2603:10a6:208:136:cafe::68) by AM0PR05CA0077.outlook.office365.com
 (2603:10a6:208:136::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Fri,
 20 Jun 2025 03:34:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A792.mail.protection.outlook.com (10.167.16.121) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.21
 via Frontend Transport; Fri, 20 Jun 2025 03:34:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dampRFsueQijDPaXP9QIFig+WDuqU4CAnYp+IA0yJI8Y8s5Kx9XDAFyWh+xQQ5TAxEj2tWIHLdi86lP7SUVDkcNsvOBglrAa29O8ExijohnWXxqaLN6CptArKFDyWTWXv/xOwlD7j8PG8jlm1x/yILcUjigI6qm80ThRJhnMuZ4DZcJ//WLdSQ+5DyE4U5oBtIARqAgo9VtgBqS6P6an0UvGqMQ1v/LvCt1T2sLd8szEQtdEniOja+2Z7jrmDbk0ZDV5GmwIZ+fiobH2X2g9c37YDRtwLgdL+2ZK2dhyYhNRHVCV/LAAiCfWtccMjRf4GO9fifeSyWHHjNLJc43GnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mXQlzT/x9+1sc//PhKWtUB2GVyhkCeC902Ceks8zQ+4=;
 b=K8F2kl30mTRm0D6UBPpySZDzcwj8Mv2UIFdtAFPShkgRsEhRMqvqr4W3A4XlMiIm5pMG4hd9znMVqxID1FiGkTAGY3bawaGvSp5aoN+fHK2rwEDTZu5a2ZfDm4lkEg04vLx7/SNc36Bkhfj6rw+rZZxvbCTKrceBLdwoLjRBLZOh6Zoa05vc8/UQkJckjyG+RISj6vmILM2yZ3cdFo9NmseZ/QsOiFmb/hmc6twEqj0GZdUihxMvwmGRzBMWhhkqtuKoGXfSNpHQpNiLWTvrmDgJ3Ut++e7EMYUhdzd0E1OXOuj5twFQGREtIprC+H/9nj6YuREt9bIkLReV5BavwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mXQlzT/x9+1sc//PhKWtUB2GVyhkCeC902Ceks8zQ+4=;
 b=SFjzFkF4NjpdsP4o/wqsdmyYXCKZXpxm7xMZYt8zjxbxq5kElGGKMgp07N3uIy4zgym5V52e9qhflA78pJWyEuLYjdUJbxZpvUwt5Zh/vnnaJNBKKpMxoW9WEuSR3hsw8SJtZzhW7wubLO/9XGpeBW8B318pcqY/6V9WaBX5T3E=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AS2PR08MB9524.eurprd08.prod.outlook.com (2603:10a6:20b:60c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Fri, 20 Jun
 2025 03:34:08 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%4]) with mapi id 15.20.8857.020; Fri, 20 Jun 2025
 03:34:08 +0000
Message-ID: <033a81f7-c88a-43d8-9712-362fdb1c382f@arm.com>
Date: Fri, 20 Jun 2025 09:04:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] mm/shmem, swap: avoid redundant Xarray lookup
 during swapin
To: Kairui Song <kasong@tencent.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins
 <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthew Wilcox <willy@infradead.org>, Kemeng Shi
 <shikemeng@huaweicloud.com>, Chris Li <chrisl@kernel.org>,
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>,
 Barry Song <baohua@kernel.org>, linux-kernel@vger.kernel.org
References: <20250619175538.15799-1-ryncsn@gmail.com>
 <20250619175538.15799-3-ryncsn@gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250619175538.15799-3-ryncsn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0108.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::13) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AS2PR08MB9524:EE_|AM3PEPF0000A792:EE_|DU5PR08MB10802:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f247770-11ac-4759-ef8e-08ddafab63eb
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?R0VKcCs2bXNPTXpTZzJMeks1bDRtWWdsVEpCNHIxZHgzcDI2bEM1bVZKVkVy?=
 =?utf-8?B?ZWdoUWhOeThkMXFIQXVQZWVQejVwUXBybFpNRkYxeWtXcWcyYzc2MUV3Y1R6?=
 =?utf-8?B?TkFzZjZoUHhNbWphYWFrR2hRRUMxODViUHNRL2htSHR4dU9Vek5TcnI0KzVo?=
 =?utf-8?B?NmNaR2RhbmVkdVc5QjBHWXpzcmE4NjRPRlhDUzdPb3dTc0V4MkpyeDZrV1Ux?=
 =?utf-8?B?WERsejJUc2pXVEhFS0lzM1Z6cUpQYjdibldVTEZVcGw2VG13RXVkRVdXWm9Y?=
 =?utf-8?B?WWdXbmxHNGExbmhxQjhpUU9RVklaN1dVL2JJUkpxWEdzRXNnN0MwYk5lV0NR?=
 =?utf-8?B?L1EydGE0eElaRVMzT2RkM0RTd094S29Tdlk0QnhFd2EyOXVmaVNZT0I3bHJB?=
 =?utf-8?B?YlBIdnNGNEFVbHNjMm5zSGlObmt6bWhxK21nczdGZ0czZlNRd3NTNGw2R0JR?=
 =?utf-8?B?ejJLanRWYXR1YmxzeHljZEFocVhTcEZHWGtYbW1qNS82MlpmU0tsa2lGckF6?=
 =?utf-8?B?ZmR3NjlPelNVUGVTNS84b0RjMmlWa1JVRDFWWWJYSGFFV1JLVFZQcDVTWVNJ?=
 =?utf-8?B?Z0R4R1VQTEl2UjkwOEZIT1Q2dlZPZEVsZzc5REN1Skh4VjN1bURJTzhjdDRw?=
 =?utf-8?B?VU1yNURDRllmN2RGdm5Qdk5vRklEbDBtd0Rrb0hYWGFFdmY2UE1ZbXZLdUZD?=
 =?utf-8?B?Rlh2VDFWTmtGQnRHNEpwLzZReTA0d2lOQ1Q3RXMwQlc5ZVNrRVVOb09wTktE?=
 =?utf-8?B?Z3p4RDR4a3pVdEIveCs0R2ZYdStvNDZPUzBzOFVNTUZhMkFUT0F3QTNDcHo5?=
 =?utf-8?B?UzFxeGUzQ3ZPcFJKY3VseFBtR3paN1BQRFQ5U250bXNyWE1lTDJVQTVBMGhr?=
 =?utf-8?B?UVZrRU9ZQ1lRTXlzcjQwdm5haTBZd1c3ZmxnUUk5TlVTSCsxWjhsM1JoMTlH?=
 =?utf-8?B?MXU1TlpIMGRRVVBhc0xQeWVSK3VkYWEzWkpVOGRlM0lKVHQvTXFkT1BUQzNs?=
 =?utf-8?B?c01RM1MrQ2hwUW5ha0NJZW02UnhTZjRvSVhoYXJ6ekNzYVBWRjV0MXRoS29n?=
 =?utf-8?B?RjBScFlFRE1INnF4Unp2cU5Tem1kUjZ6Z2ZVQitEKzBGeFlRUElJR2lGcWVY?=
 =?utf-8?B?Rlk1UU9zT0tlSitneDQwNmVhYlg1NGpPZ29JV2s1OFJMTUkrYXJVRXcyYVlj?=
 =?utf-8?B?djhLQWZJR3F0S2RYQTVnTm5MV3VyMmFHVldWNVhRM3ZORWNZS2NjUGVLVmpC?=
 =?utf-8?B?VlFyWjlkbUNteVNPOG9XM1dJdXcxMkVmRFJ1eFhiZjlzaGNEYXNncWlKck55?=
 =?utf-8?B?cXR1cGVPa0FxWjBrMUdNY1hxVlJFUHV2dGJhZjRBVWt4azg4NmJCMHRLZDhJ?=
 =?utf-8?B?ampXQnVLZ21YTk5zZjVkbXBOSzdmMUdWYzR1TGl1R3NLRHJDMjdLaHpXYS93?=
 =?utf-8?B?Vm15VldPUm5BVlZvMVNUQmJ4endBTWZQMGVMZDFOY25ZS0Z0eno4UkdjQVM1?=
 =?utf-8?B?amZKVFp3NzhMakZ0Qk9tTkluUURnbE4zWkpodXIyWCtYS1FjM0E5Sis5SUV1?=
 =?utf-8?B?dnNPZ1k3TnliZnlSWktneTFSSGREdXFheW5SNXM5TFltUGhxOWNwd1pWZEgx?=
 =?utf-8?B?TDEzLzhjaWxEeEZoOWo5MzQ3N0o3aWZwTWNFb1RGY2d6dHhicWxsYitUOXR0?=
 =?utf-8?B?Rmdnc3JWL29pS212UmlKVFZTN3hDcFZuejc3Z2NGTlB5WGMvRytDVUE5OExV?=
 =?utf-8?B?bDZYbHB4LzJXN21DcnUrNkd1bVIwYm9sOWV4dEZVNGF6NzFXK1RXWXdvYXdI?=
 =?utf-8?B?b3dpMkUrY3lUd1NjajRXblRrMURvN2N1MHc4Nm52VlpSejVpcCtCOTlId3B5?=
 =?utf-8?B?WVpRN0ZzYzNhK0M0YVpWNkQ2Q0lXL25KVkFqemd0YWNOMU1VMjN5OVJONnhQ?=
 =?utf-8?Q?oCvsn35aavo=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9524
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A792.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bf7bb658-af88-44b0-6e06-08ddafab4fda
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|35042699022|82310400026|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eG1BMGp0UnlNNDBxQ29nRENXcVc2M01qOS9QTk80L0tGUnVDek1Vbk5tQ1l3?=
 =?utf-8?B?bjlDcThRb3ppcXVNRXBQVUg4bDI3Y2xHRGNPdzl1YUtJMjdWcTFJY3daQlNK?=
 =?utf-8?B?T1pXK1haMlhvU2pZbDQrMTJSMDdmQnNHRlhLbVNBU1F1TjJWSXdhUGdWMk9G?=
 =?utf-8?B?UTZ5TzhmVnEvbFp6QU0ybllwbnQzcXpFV2hRdDh6SnNjZHpTYnBzaXFFdzh4?=
 =?utf-8?B?RnlrRWFicWd2Vk1kTFh2MFhIZTNQRE95WUR4a2lxbXRxVlg2ZHVRTjB5S0hE?=
 =?utf-8?B?VnAxbmNMTGROTGF0QXVaN2o1am5rZE5TN1YrYkU5VGptQW01ZXI3QmNTTG5P?=
 =?utf-8?B?ZnBuRVdMYXNib3BaYU4rY29yQzRTY1FrdERvNTAyRlRFMDg3QjVKUlh4Y3ZZ?=
 =?utf-8?B?ekEzV29lTVNaOFpGVFcyY0ZOSGhqZkRQYjhTRVlObjVvTTdnLzlwRnZSN3Fi?=
 =?utf-8?B?a2dLZmo1R2xnc0JKSTRYUW1NUURNMlVNWHd0eWhYcWgwc0g3ZWQ5RlIzc1o2?=
 =?utf-8?B?eUhEaTNoRUdTNFlvY3VCbEZLaFBWTnJvSTNRbi9ncEQveEtFSGo0cUtKUTBW?=
 =?utf-8?B?NlZKOE52MnAzNUFTOGNrMmZGMlZuN1hzQzlZTjlMV2RzeGJ2Ym95SnhWT1Ni?=
 =?utf-8?B?OElBU0ZBaHl6QTVITHdVY1Yxc1dSWWo0bDJnYVN6dU9PK3ZabDNFK2lJOUZM?=
 =?utf-8?B?ODhHOFJKSXkrTXUvQlN2ajhiUWVSREhJTUREQVdXeXBrYnJPRUdyaTlBQktV?=
 =?utf-8?B?YTV2NmFJUE53bjVNN0pWNUpqOVF2TmhnVmQ4QXF1VnR3dkZGSERacGVVMmpv?=
 =?utf-8?B?SVJIVzVPOXo3UitteVFCbDZBVjRvYjhEY3NzUGxHMy9PTTBHNFN1b3E4UHBY?=
 =?utf-8?B?NDhPZTRGa1VBR21XelNPQVVRZGdZOGljWVg1UloyYlExdE9XaU1VYTdOb2k0?=
 =?utf-8?B?d05pdTdicTl2UnhaNS9qVlFqTE5oWjJyWXJYTGl3eFJZYkZNM2hGRXp3QjVs?=
 =?utf-8?B?c0ZucmxubzVvL0pmU25tczBaZ1VIOGxHM25TZExxNGZ4MzJvQ1Z6SldnbUZ5?=
 =?utf-8?B?NVNNNUpxdGlqNkdmb1Q2TFdwMUZHcnZZUWdoSFFLK2lKNlgydUU4Nk1DRjJH?=
 =?utf-8?B?TUNvNzNJeHB5U3g3SGhvK1c5dGl4NFdMbnEyQ0lnUHdNblFVYTNRV2E5amxj?=
 =?utf-8?B?VWEwMXdvTCsvUlEzLzIwN3plQ2Q2R2c3UUdOT2kwR2J5cnBEeU9PVjVKV0Za?=
 =?utf-8?B?OUhCZGN1cEdFZ2xOS2IrZTVjV3pDQXlIN1h5T01FRGFidS9DSHJ1Mk96cUtP?=
 =?utf-8?B?MzAvbVhMbDNCRmVvQUZYYU5ncXNBb0ZiZmNiOEorckd2Z0lJbVEwSTBJSDRC?=
 =?utf-8?B?MFVzOEZPWDNLdE1nQkhKSThuMGtFNVdnK0IwbXJISXZvcC9xN1VNdUh4Z1di?=
 =?utf-8?B?Tmo2czB4eVp5MzRwTkZVaVgzWG5vRmZXanBSSjNwT20vTzduSmRzK3FIR0g4?=
 =?utf-8?B?OGdsNzZsdGdFeklYNGFoUGtWUWZXRVpPWVBGMGJmOGZyU0IwK3RZUXc3cjdM?=
 =?utf-8?B?amorUytORlY3aExYOFVlaDR0RFpzTTlKVm8rdkZOUERNNFUvT3hab0V5MXZ1?=
 =?utf-8?B?TlE2NzdGMVJ3UlB2VSs3S25vZEJFeDJ1R1JScHNnTXZ2R252WTVBQnUxdXVz?=
 =?utf-8?B?NHFjYzZSV2tTVk5oTkxVZHBzUjN5d3IxRE5BME8reDhReUpqUEQ5RHk2Um5M?=
 =?utf-8?B?TXlkMVNoL1VyUFVJN3BCbGNDSjZKbERtb2x6UzZqdTZLVkM2SnlTYVllTGgv?=
 =?utf-8?B?WG5rTE5Od3owejVSTWVBOHlSM0hrTC9QSlpZVWlQWTU3MHRKS01lMzh4SlJI?=
 =?utf-8?B?Y1M5Z3RRNzFXeFRLQWxpNm5VYVhkbzl6ZW1ZeHhMcE9NaWJScGRDMTF5Qy9X?=
 =?utf-8?B?VThEV2VMbUFDQVVnQURmdUtkNHgvemNDRG5lSXNHa1lRdkNMckJYcHJ3RTh2?=
 =?utf-8?B?QlQydzluSUQzVGRXVEZOR0NOUGdxN2J0b0xTZURBenpkRU9mRjVBWHlLa0g5?=
 =?utf-8?Q?ibmXdD?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(35042699022)(82310400026)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 03:34:40.6207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f247770-11ac-4759-ef8e-08ddafab63eb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A792.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10802


On 19/06/25 11:25 pm, Kairui Song wrote:
> From: Kairui Song <kasong@tencent.com>
>
> Currently shmem calls xa_get_order to get the swap radix entry order,
> requiring a full tree walk. This can be easily combined with the swap
> entry value checking (shmem_confirm_swap) to avoid the duplicated
> lookup, which should improve the performance.
>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> Reviewed-by: Kemeng Shi <shikemeng@huaweicloud.com>
> ---
>   
>   

Reviewed-by: Dev Jain <dev.jain@arm.com>

