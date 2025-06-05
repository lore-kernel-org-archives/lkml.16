Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012007.outbound.protection.outlook.com [52.101.66.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3324323B0
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 04:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.7
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749098945; cv=fail; b=gFxIO155UeU7atruBFYFRPLzp5ZuofD9KmTEPoFgzrBHWRz8xlEenQLg3AyDxgIjmKBIZjNKJ8NmHppN/acBPXnjUbwwZ7byR9j1LxOmh+XUwDghcBNYKR9gXNO3/lUv4ZChmZjselYZe6KPb3ERek3CtLVAccSkF1SOORlEx1A=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749098945; c=relaxed/simple;
	bh=k1P6t8TAsNPZqSZQVK/fNuHklbQEAIFpkiR/6DCR49M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VPu4zahGbN3bJlmGIcrRMAdw6TodAA5NGHPentCbVIMuekNySrMoqjzGCxqkGzo1uYAOaIDBCyujqCcJvvpQzd7mNEEXvqQ32M4JBLnk4a/nglP+MsSfJiqm1LwyraSx09V6zlK8HNSZ9VWsqaESzpC9jyby5EiherwB9iHmHKg=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=KVl4zVOA; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=KVl4zVOA; arc=fail smtp.client-ip=52.101.66.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KVl4zVOA";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KVl4zVOA"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Z3tTr9ZZs/CReE51ssntHD9impacIT90Ky40PQe+w5tKVIoSit1UedrT893artd2sSvo83O5yQrBq5RBkUfvXlt9fGBguDJ5Z40ELLlQzRcc+JonPizCr2Qt6rSUzbieGL6A2RODWx7OGKg5UKxshGSkN1GXwmLZXkj799Oquq3dM+shKS/ParG8O6wl8XsLofhHCTwun2YsEU7O5A2Jv+SKeLyVAcaPdrwzpdCvFWkZ6xeaz0EaI2TOhwEhrsIjmqL8+bDJXWIVnDoAR/5aLRohE89XMWm6rqUg+2SxDRscFVkf+05C1/6zHS1rNS1aXs2dNBzxkvRjLW36HkQk8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gjTRdTnKnFXB17jZo8REv4nWFhsu9F7Or5tyGV39Odo=;
 b=DKhH2fzj5qEUBwHJlQ2pIq3kTjBt7LzZlztjQjc3ldmvHJticGcmBN5OS4Y3upioW3CFTbyPkiVv5CerT2uBtdFmwfTWwHkNdKYo3T1ZTnmmA7HLsanvghRuUc0WpuIhsaPM4pZThfM/LZN147om+Zpabzx/2v5IA6YRWtAGSvbXixkz0Jsy5wPMuVEu4btU9Db7xof9Y2v440C8vyJAvCE3/fkWksBId208NxxHQKHmnOM4quFICCj2ZHeFwLrhQBvqkt3I0BSZAl1+z0AqJnNUt66PvDfqsaw2wrBnbBuR8COILyqhUfTN3+FnXF6XDbiPxzQ6GGo9b6bIZwC4dg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gjTRdTnKnFXB17jZo8REv4nWFhsu9F7Or5tyGV39Odo=;
 b=KVl4zVOAXg+omMvjz/iUKo3I85vmXQJNsjtpI13iI1NsYl9Pmad6DjumCawhRVzg9XpDBQRuzpXGv7z3UNwaglFhFlNwYLMnjx3TLFxqK4YzQ07egfXA1icrV2TM+8dqjo57KxH/6O4X/tDH2xMnFN+O7WporMSpPOaTN2uaU/s=
Received: from DU2PR04CA0170.eurprd04.prod.outlook.com (2603:10a6:10:2b0::25)
 by AM8PR08MB6434.eurprd08.prod.outlook.com (2603:10a6:20b:369::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 04:48:57 +0000
Received: from DB5PEPF00014B9B.eurprd02.prod.outlook.com
 (2603:10a6:10:2b0:cafe::c2) by DU2PR04CA0170.outlook.office365.com
 (2603:10a6:10:2b0::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.24 via Frontend Transport; Thu,
 5 Jun 2025 04:48:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9B.mail.protection.outlook.com (10.167.8.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Thu, 5 Jun 2025 04:48:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X+s6tvbIwOK0IiD2qQ8OruzPp2vttyKFX5b/v7VlPU0qoERtriLlyzjt1AImvzCsRflxu7QbGBreybQx/tmAjZ8g+7h3aKG9PlwspJD0mYBp2Y+/CclR4hmuYTUMZ8FSAzfGkc+M1h3oF7qSaceKzEnmabU1ApQqQxsL4/3Nr+0tvi1TZwxc/v0Pcr9G4eJ6H8zcO/93CJUwm+ZfaW/qFkd26gozp3vD4EY6lsZoo98fZYi8rzayAd3rZlumsMVyLAMUIdWkr5yH2JB61QN+oXFXR3ic1AExIHl7PsJhUL222S6uEFKtfE3w02q7EVQj00niZ6E706BIfKB2pqsy+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gjTRdTnKnFXB17jZo8REv4nWFhsu9F7Or5tyGV39Odo=;
 b=kwF93WIcAjBbdAJ1dnJ9EGn4dKbMs3gjCi0tR/RauC75JIJhrJDVLAtgkdFoImaMNwxUxxb15Gx3lxMxFXx/8cGoG99DlwTyLwho3xMmR/fyKV1e5s50zmM96Iwfs5A7ChYIXu8FcxexFNXDerLS+yYr2m58PocHX1Q0rK2YRSKNM5JUahEAcBzx+PZmOx783X0LQ098OgoANtLd+AA9QZOJmBFVxTYbnuUFyJExEISfkFnei3DAb/pSB3Ca4ih5vtXx2UB44OmRGnrIJrT7pPuVPjN+3lOOJ9lWL7X0cKyxDFI+G5akuyYe3PhDu8ZJPnyOvgNX+tfEcxWZL6DMiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gjTRdTnKnFXB17jZo8REv4nWFhsu9F7Or5tyGV39Odo=;
 b=KVl4zVOAXg+omMvjz/iUKo3I85vmXQJNsjtpI13iI1NsYl9Pmad6DjumCawhRVzg9XpDBQRuzpXGv7z3UNwaglFhFlNwYLMnjx3TLFxqK4YzQ07egfXA1icrV2TM+8dqjo57KxH/6O4X/tDH2xMnFN+O7WporMSpPOaTN2uaU/s=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB7111.eurprd08.prod.outlook.com (2603:10a6:20b:402::22)
 by VI0PR08MB10653.eurprd08.prod.outlook.com (2603:10a6:800:20c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Thu, 5 Jun
 2025 04:48:22 +0000
Received: from AS8PR08MB7111.eurprd08.prod.outlook.com
 ([fe80::4ea7:7e71:7dd3:3b45]) by AS8PR08MB7111.eurprd08.prod.outlook.com
 ([fe80::4ea7:7e71:7dd3:3b45%4]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 04:48:22 +0000
Message-ID: <6cd41ae9-303d-4eda-8d64-f7dba19eb106@arm.com>
Date: Thu, 5 Jun 2025 10:18:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Enable vmalloc-huge with ptdump
To: Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>
Cc: catalin.marinas@arm.com, anshuman.khandual@arm.com,
 quic_zhenhuah@quicinc.com, kevin.brodsky@arm.com, yangyicong@hisilicon.com,
 joey.gouly@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, david@redhat.com
References: <20250530082021.18182-1-dev.jain@arm.com>
 <d2b63b97-232e-4d2e-816b-71fd5b0ffcfa@arm.com>
 <832e84a9-4303-4e21-a88b-94395898fa3e@arm.com>
 <4202a03d-dacd-429c-91e6-81a5d05726a4@arm.com>
 <20250530123527.GA30463@willie-the-truck>
 <b223245d-c43c-4d3e-86d4-9fbfd90cfacf@arm.com>
 <20250530133625.GA30622@willie-the-truck>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250530133625.GA30622@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0152.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::22) To AS8PR08MB7111.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AS8PR08MB7111:EE_|VI0PR08MB10653:EE_|DB5PEPF00014B9B:EE_|AM8PR08MB6434:EE_
X-MS-Office365-Filtering-Correlation-Id: a665d257-98f2-4a63-0b2d-08dda3ec4782
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?SDhRcGhGOWdudUQvSng0SnREa09mRCs5cjRUbVBFbjQrUk11NDJnTmxvZWQ5?=
 =?utf-8?B?MXFEaGl4MEZILy8wUE5CNWtxOWIyNjIrRkNtTUc5OVRqU3NqVUpYTmdXakFp?=
 =?utf-8?B?cFFjNkd3UHZjWnViaS9zYk8vWHk2SmM4UlJQemRycWNCdmlsY2JoajF3UlpG?=
 =?utf-8?B?QllXblNZaFNUWlZvK1dlOVorTXFpREVOblVsMTB6V1h5dk9UTmIxK2Y0M282?=
 =?utf-8?B?MldvYVVqbzd1SElGTVgzcGhOVm5zZG9kOVZETkFHWnNzZjErdUs5QW5ScnVW?=
 =?utf-8?B?UUF1M2cydEJPeVI2cmMyVjlqZXlpQ2pId1dORStqWFVPUGxMTEpleXhuZDI3?=
 =?utf-8?B?TjZDdXBGcHVTVmNRMlU5ZkxlaXZtNjdwZzRWZ0RGcmREUjJveEN1bXpqL1RS?=
 =?utf-8?B?V3k3QWcxY1MyL014RmpwTjRIckFiZHNPNXd4Q242R1QrVGtFd2txb1lLNDR3?=
 =?utf-8?B?djhMZlJCY2pIWW4yY2tKWFY1c3IyYWNxcnVkN0I0V3A3d0krZlFsUGdoNGtP?=
 =?utf-8?B?SjNXVTMzSUhqT3JwWUJqY1p5RjdLYnZVS0MvZzZBb1hPUFd5U0FJOVJJUS8y?=
 =?utf-8?B?b1N6eGYzVnhUSHNqRmpuaThWaktiNmNpRHVPRDhZdzZtTE0xWkN1dzRnOGNM?=
 =?utf-8?B?b0grNzk3UzJMMktKdjBqRkdtajc4dEFwZjV0SmtZcUpGYUZlMFdmOEF6cFJR?=
 =?utf-8?B?aGtZcXhPUE9QT2J4a0d6MGhENE81R0p1cmoxempjdXo3OHFaamh3MjNoTzZ0?=
 =?utf-8?B?MjQ5SG1MZFNocUgrek52R0w0WkJMV2p2aTRBSXU4QysxclA0N0N5VkFLT1RR?=
 =?utf-8?B?cUpFMFA4Ymo2Rk5QMWVOMy9WSjJVZTJyUzRJNTZLZ0RUZmVpUXNGRHRGSVNH?=
 =?utf-8?B?UVROcnRaZUdubXVqVjJxK2VxVk9CaDdRQ1hFZWZuSGdmWTA4WGQ3RGxtLzhi?=
 =?utf-8?B?cmFieEgwcCtMYjNyY2cwa3krU0FYVHNJdTU2QjFNYkM4cUkxRW1YbjBabjFq?=
 =?utf-8?B?Qlh1M09Db0RsUU12eHVYdWh0Q284eTZ2QUttckk3UlNZUHl0Qm94ZC9NeEho?=
 =?utf-8?B?QTVYcm5IT29BeStSREt3S3R5eXpNYndDdlFXVXk4c281TDREaTh3WHBLamtL?=
 =?utf-8?B?Q0E0RjQzTmlxU0pLTDdPa1pSbGE1d1hPUlN4VW92L1VQV2tzS2FUeVRtQkRu?=
 =?utf-8?B?T2ZvTUN1UjNweFZHdmhrcUJLZllYNVFUdVNzR3ExN3lIS2RSbHRoMWU3dmt3?=
 =?utf-8?B?ampvUVZCQ3dNM2czQnhRMlB1MkV3N1hHNThaN3gwZVQzMHRJYjkxYXVVN21q?=
 =?utf-8?B?bFBJVCtGbmI1NGhRODJmSllUN1dvZ0ZUaE1CTldkMTUzT3dyM2JFa2NmTDAr?=
 =?utf-8?B?TnY0YnNGNDY1RENmOGh6MUNsUTZ3RTU2eUI3cUhxazM5N3R5Rkl3UktqbTMv?=
 =?utf-8?B?SGliSW1TM3ZHampqYnRmS2pjdWNQWFY2cjBZQ0xZMW12dEZBckdDdXVmRm1S?=
 =?utf-8?B?ZGZ1aTR0Uit1blBOZ1lZSHRCSWptcGNXRndOVllHbUZMVmgwTEdMdVl1T0tC?=
 =?utf-8?B?MUpjM3dsazVJT0F3bmFRU1p0dWs0ZGhjVlpLWXk3REp5ZUVTYm9sc0JpbXpo?=
 =?utf-8?B?c0krQzdaS0F3MDJVa1kwa3U1bGc2THpQYkNXMUdXa3hLYzVYUXYrRXNoU29Y?=
 =?utf-8?B?bEpYU2UxQjk5bkNzSUJ4ZElPWFhkYlFOdC90NFBmdVE1MThZYUZsUzl6SCtD?=
 =?utf-8?B?djNUUkpEbEpWbVRFQThSSjBxTVhja1pCWXRYZlVJcG5vdGVVcGkwY3lVbTVR?=
 =?utf-8?B?MTFIbGpBZHRHS05Wa0FqcjA4VkUxTnFQK000UzhqT2hmck03Q2tKTHNLYjN2?=
 =?utf-8?B?SGFBdmhCUVBPM3FsZlRZUWpKNHRQTFYremx0djhtcHpROXc9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7111.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10653
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	818334e9-b8f8-4876-f5dc-08dda3ec32a3
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|14060799003|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NU42Mk04ckZnWnVLWk9hTlcxcG1mVEtOYlFXSmdZYjdxa201UnhFcnN5UnIr?=
 =?utf-8?B?dmdQbXNtK2MvZTY5Mzhnc1RoNEpnNTVjYWRRZmtySGhJS3BqUTVZeGZLZVNC?=
 =?utf-8?B?TWJmZ1VtTitDWXJ4R3MvMm1jTVlOUnJEWlludHEzcEJtbjBjcG16cUN3cU42?=
 =?utf-8?B?Syt1bGNjQmhHWFdwVkJGVTdvM2MwV1JmaW9PZGRxeDVvcVZ6MnFnQm5zQzE3?=
 =?utf-8?B?VDRBZjBCMGhrT3RUR09DSWFiVUViK0MxajdWYVJCc1Rrb1FBS0VQYzJmTlFW?=
 =?utf-8?B?Z1FwUkpqUUVhaGUvTk10TW80Q0ljQk1Bcyt1U2ljVnZmdTVwbWR5SWtyRWFC?=
 =?utf-8?B?aUpiM0xqTDFGLzZJaTl4T0lXZy8rY1lyZk00TW1aRGl2SmNQc3BRRW1pd0Jr?=
 =?utf-8?B?YllLdXBhY3c3UlZkdGVlamZscGpLcmFseHVQaSs4YytqNXZ5amZrdHBCV200?=
 =?utf-8?B?a0k5N2JoWDhCaW9IejN5cTlDWkVnbEtmQnR0RVVvSEZoVmlXYm5jSGpaVnM3?=
 =?utf-8?B?dDVDZDgwQ0ZZU0pXeDNQb1ZsaFNUSEwwMUw1dG51TGgzZ29uczdoWTJvdE5W?=
 =?utf-8?B?YUtOZC9xZXBjZU5uSHpJdllYdDhHY3ZMUU5PZWM4Z2d2Q1k0SDNJZFNYTDEr?=
 =?utf-8?B?Q3Z0L2dJbm5sMmRPdzFCbHV2TXJuMVVLYU9JeDNad0doTll0S0dCQzFWdWY3?=
 =?utf-8?B?MTRtTHFsdlFTM0tRZVYwRkpJRUxpNUdCc3dJVG41MGczK1I1WHRRRkFuemdn?=
 =?utf-8?B?WHNxMFhQMmNjenRqeTlPci8xOG9OOWUrTFhoSlV3M01wVmxSeUNRaUxBdTNn?=
 =?utf-8?B?b2V5TG9xUDMxdHd0ZW5zMTlrbTdNeFVOMUxtRk1DaUVGTExIUjZmaUpHT0FY?=
 =?utf-8?B?dkVjb0Nid0tLdk1xcFlXTFMxS08wOEhJSUZuVytYZUh1YlNOakp3L2pTcFRt?=
 =?utf-8?B?TEdVVTFDVVFoeEltbTFsTXp2K1ZHbm9xYUFpb0dvQzFnUkJVTTZQUFlhcnFo?=
 =?utf-8?B?UWc0enJlUWJLampla0FlbUo1cU9SYnc3VWtXTGRvRVgyYkZqdE9DR3VZM1dM?=
 =?utf-8?B?a0Jxc28zdmJTUmVGRUNsd0J0RDZoM3lEcTJCSElpSkZMNTNSOEZmL2lKZlR4?=
 =?utf-8?B?YXcyMi9FSHpqOGREd0xhNjhSUFVWVXlqaDJvWExWNWdUblFxYU5CZzI2ZGh3?=
 =?utf-8?B?UWk2OW9uQisrM3ZCYmlDeC90eXk2bmRJYXFEWFpJRFczQ2YyeE1QZ1RyeExE?=
 =?utf-8?B?UUlUdlU0U0FMS3I1dWhUVkdJVUgzRlVGSWdsMjJtYmx3L1JnYzBZaG50WUVW?=
 =?utf-8?B?cHpsckdyU0oySVptNE1WVHNQMHlEd3hBUlhrR0V0RFNRN01QRHQrcSsxSGUv?=
 =?utf-8?B?Yy93b25lQ21rTFAxT2ZtZjJQN3BJYXRxUVV0MG95R3o1YWNwZnVyNjNQdS9O?=
 =?utf-8?B?S0VMbDJQWTdhWm1JMTQ3dHcvTE1vNGZZM3FjUnMwQ0duSGVKS1lBTi9BS011?=
 =?utf-8?B?ek1Oa1VXa3l4emRqQTNhZEpXbHJBV3JldU42dUY1TkZSWFNackhyK0t5TWpk?=
 =?utf-8?B?K0hMTkU1Q200Rk4vVWZXVmpsZ05GY2hpanBERjd6UXVLL2d2KzVhNmZkOEls?=
 =?utf-8?B?L1NDVTN5cEpjTC9EdlZuTmJOMVlsOWUrMjM5aFdIbDU1a0N4TkxSNEZVamtz?=
 =?utf-8?B?T1NzL1doU1pTaDBybUNHZFlzbWNFUlpCTFBCbHVzSmNlUU5XTVBDTWdQMXJL?=
 =?utf-8?B?VnliaDNHMlJkY3duRzdlMXVUc2kxZGQ1cmFSSms5M2lhbzUxbVJaMnE0dWE5?=
 =?utf-8?B?ZnUyenJBMElhOUlQbU5QazZ4UGZPbmNYeU9yL2tEUC9MYllkZlZxRVd0MUxh?=
 =?utf-8?B?cEdVQWhEVXp5VTc5M2E0N1VYeGNKQnRjMElXM2dIY2xpMnVscExid3BveFJl?=
 =?utf-8?B?cTlJUUNteU0ralRuNjkwUU01aEdWdFJDZ1lGc3RYZmhWbWdlNVFUaWVZVHdP?=
 =?utf-8?B?TlNXTFZCUUZOT3ZKNGNZSElJeVdSR1FEbzF2NXFTN2F0QzRSU2JZblB0K21O?=
 =?utf-8?Q?4jndQb?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(14060799003)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 04:48:56.2652
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a665d257-98f2-4a63-0b2d-08dda3ec4782
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6434


On 30/05/25 7:06 pm, Will Deacon wrote:
> On Fri, May 30, 2025 at 02:11:36PM +0100, Ryan Roberts wrote:
>> On 30/05/2025 13:35, Will Deacon wrote:
>>> On Fri, May 30, 2025 at 12:50:40PM +0100, Ryan Roberts wrote:
>>>> On 30/05/2025 10:14, Dev Jain wrote:
>>>>> On 30/05/25 2:10 pm, Ryan Roberts wrote:
>>>>>> On 30/05/2025 09:20, Dev Jain wrote:
>>>>>>> arm64 disables vmalloc-huge when kernel page table dumping is enabled,
>>>>>>> because an intermediate table may be removed, potentially causing the
>>>>>>> ptdump code to dereference an invalid address. We want to be able to
>>>>>>> analyze block vs page mappings for kernel mappings with ptdump, so to
>>>>>>> enable vmalloc-huge with ptdump, synchronize between page table removal in
>>>>>>> pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable walking. We
>>>>>>> use mmap_read_lock and not write lock because we don't need to synchronize
>>>>>>> between two different vm_structs; two vmalloc objects running this same
>>>>>>> code path will point to different page tables, hence there is no race.
>>>>> My "correction" from race->no problem was incorrect after all :) There will
>>>>> be no race too since the vm_struct object has exclusive access to whatever
>>>>> table it is clearing.
>>>>>
>>>>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>>>>> ---
>>>>>>>    arch/arm64/include/asm/vmalloc.h | 6 ++----
>>>>>>>    arch/arm64/mm/mmu.c              | 7 +++++++
>>>>>>>    2 files changed, 9 insertions(+), 4 deletions(-)
>>>>>>>
>>>>>>> diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
>>>>>>> index 38fafffe699f..28b7173d8693 100644
>>>>>>> --- a/arch/arm64/include/asm/vmalloc.h
>>>>>>> +++ b/arch/arm64/include/asm/vmalloc.h
>>>>>>> @@ -12,15 +12,13 @@ static inline bool arch_vmap_pud_supported(pgprot_t prot)
>>>>>>>        /*
>>>>>>>         * SW table walks can't handle removal of intermediate entries.
>>>>>>>         */
>>>>>>> -    return pud_sect_supported() &&
>>>>>>> -           !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
>>>>>>> +    return pud_sect_supported();
>>>>>>>    }
>>>>>>>      #define arch_vmap_pmd_supported arch_vmap_pmd_supported
>>>>>>>    static inline bool arch_vmap_pmd_supported(pgprot_t prot)
>>>>>>>    {
>>>>>>> -    /* See arch_vmap_pud_supported() */
>>>>>>> -    return !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
>>>>>>> +    return true;
>>>>>>>    }
>>>>>>>      #endif
>>>>>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>>>>>> index ea6695d53fb9..798cebd9e147 100644
>>>>>>> --- a/arch/arm64/mm/mmu.c
>>>>>>> +++ b/arch/arm64/mm/mmu.c
>>>>>>> @@ -1261,7 +1261,11 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>>>>>>>        }
>>>>>>>          table = pte_offset_kernel(pmdp, addr);
>>>>>>> +
>>>>>>> +    /* Synchronize against ptdump_walk_pgd() */
>>>>>>> +    mmap_read_lock(&init_mm);
>>>>>>>        pmd_clear(pmdp);
>>>>>>> +    mmap_read_unlock(&init_mm);
>>>>>> So this works because ptdump_walk_pgd() takes the write_lock (which is mutually
>>>>>> exclusive with any read_lock holders) for the duration of the table walk, so it
>>>>>> will either consistently see the pgtables before or after this removal. It will
>>>>>> never disappear during the walk, correct?
>>>>>>
>>>>>> I guess there is a risk of this showing up as contention with other init_mm
>>>>>> write_lock holders. But I expect that pmd_free_pte_page()/pud_free_pmd_page()
>>>>>> are called sufficiently rarely that the risk is very small. Let's fix any perf
>>>>>> problem if/when we see it.
>>>>> We can avoid all of that by my initial approach - to wrap the lock around
>>>>> CONFIG_PTDUMP_DEBUGFS.
>>>>> I don't have a strong opinion, just putting it out there.
>>>> (I wrote then failed to send earlier):
>>>>
>>>> It's ugly though. Personally I'd prefer to keep it simple unless we have clear
>>>> evidence that its needed. I was just laying out my justification for not needing
>>>> to doing the conditional wrapping in this comment.
>>> I really don't think we should be adding unconditional locking overhead
>>> to core mm routines purely to facilitate a rarely used debug option.
>>>
>>> Instead, can we either adopt something like the RCU-like walk used by
>>> fast GUP or stick the locking behind a static key that's only enabled
>>> when a ptdump walk is in progress (a bit like how
>>> hugetlb_vmemmap_optimize_folio() manipulates hugetlb_optimize_vmemmap_key)?
>> My sense is that the static key will be less effort and can be contained fully
>> in arm64. I think we would need to enable the key around the call to
>> ptdump_walk_pgd() in both ptdump_walk() and ptdump_check_wx(). Then where Dev is
>> currently taking the read lock, that would be contingent on the key being
>> enabled and the unlock would be contingent on having taken the lock.
>>
>> Does that sound like an acceptable approach?
> Yup, and I think you'll probably need something like a synchronize_rcu()
> when flipping the key to deal with any pre-existing page-table freers.

IIUC, you mean to say that we need to ensure any existing readers having
a reference to the isolated table in pmd_free_pte_page and friend, have exited.
But the problem is that we take an mmap_write_lock() around ptdump_walk_pgd() so
this is a sleepable code path.

>
> Will
