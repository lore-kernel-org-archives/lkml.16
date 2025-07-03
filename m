Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011064.outbound.protection.outlook.com [52.101.70.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC182D3753
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 10:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.64
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751537167; cv=fail; b=NgSpQbPK2T8DeJBCMO8FAIaFm40t5uskvjZn3DpjdhElCtK6TYJHBnhEC0Y8bC2ZT+WhC8bey9iYKKbFa4xUTWn6djYR7kYKF/T/O2H8hKy8Zwh6uL+bKDa3pxnzQFa8cnuzRD0PYpBLW8Pjnrn7fX9sUWYcAAga0ijb2uOXOms=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751537167; c=relaxed/simple;
	bh=2rtXv8Aj2+UxvONjp9ri78gx59jZtIHbUV1cRsHyFcY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CNDkM6rFDCKbligTkE9HaXiMkQoisJGJJutLnrn7T7Wn+1u25to6ZewdVOCl+IhM0s2NAlaqn9Bd84EheDPbqif/EdKcgtX2STOPfs1U/1Go15o4LVOROSt1fIvNyK4ZoWhBs2VC0Ygz1qkouC7yGYJ1CUJKUCC1WU2DxwMoTmI=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=CU2TXb/F; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=CU2TXb/F; arc=fail smtp.client-ip=52.101.70.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="CU2TXb/F";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="CU2TXb/F"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=kmyVMXaY6owcdGP7edDgRFabNnz4kWTaYKOL+0ixW7re+XgXEN6YS7/KGq3TAEmoKCc68a1ETZl50h+CdxuvRVpu7CC7GlF+D9uWPO2CT43ahRU1CuGMM0b35Zl2zkSnG+JY4FhHtYSvtO0IBfqBjBPyVZAoIwiV5MmLXNxCM8jD5It/OeGujWpNDd3lkx+lXpCtNMrRfEJiiZKmedAfRs5BfTJAt6+1k8c0jmqnoEyenjE/5fTHV94e3qZ27y6hHZy6EDHOaGlrS2k6qwSwBwvK+1jjBBvzYAxcQAIk9U8BTPtFAQTZD9MvDytMA8JCVlLRHx18tgFGHiMRDTqzMQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y3XG7+FKJr2bgTZp3SuvJdpbOGxUISoGJ2woG3aQ2xQ=;
 b=DYtsAXp2qjW4iUp9DGSVcRdZVGMql3T+YeSlKvbH/BcsT33ePpkhtfTuWB4jF1NprjYY0rP5bhP9BLti2NZBe1SnUOhzwc1Hdgk1CKXsPM4zhlmVprPqOATTjYBAP7itBiia8gZW28ubjnOMz9DzPjkR7r6dpMP3dD8vYkT5p56OlF8ZcIIPjgC7hgCwcmU9rDCU0JoT6oZRPG0P2zgEOnmDLkEs+JDq958Nl2T3/2igOLTPFvcKI380NEKhkED84c2Ah5ySNjyk1XClsiE9vLsN1+C9K7ggaKo863MstWDCi85FsNzOi0jXkl/L0kc84cD3/KEypeZbMyV0x68RxA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=redhat.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y3XG7+FKJr2bgTZp3SuvJdpbOGxUISoGJ2woG3aQ2xQ=;
 b=CU2TXb/FYct6ALXtfw+AWcIGrmGmeZHvCgUZUzaMe5hv6ZTA6xb7kT8p+N++dug0LohrFXAEdrWeUWpQpywjyC62soMJCQfMkCcSdrEz2qViv642cJI2YAnlfECA9vxXpIV6AYDB1mhSlw5vjt3QgN0nzNzOXquMRbm/VVM9HuY=
Received: from DUZPR01CA0061.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::19) by AM8PR08MB5585.eurprd08.prod.outlook.com
 (2603:10a6:20b:1c5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 10:06:02 +0000
Received: from DB1PEPF000509FB.eurprd03.prod.outlook.com
 (2603:10a6:10:3c2:cafe::f3) by DUZPR01CA0061.outlook.office365.com
 (2603:10a6:10:3c2::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.21 via Frontend Transport; Thu,
 3 Jul 2025 10:06:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FB.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Thu, 3 Jul 2025 10:06:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tqdSzn5d+jMCflyUlx+2H/BwCC8T3qVuUyWLt0jsyj/OqgGIYW1SqB1nShovqIl0l6TddrLGzIoBtZNERyGn/l63tW3NooMLYTkjExNHfoU9cdpnSDfMg2DiFwTU4q6H1ibPLl5oHiMIkTom927KhgaSJ/cbJ7YBS5am+U/U94yb1uTAMXF+U6vZsu2U/oMC+0OtO5Q1CdGy5kO+AcP09uwkE3eiNN8jlEq9FBsMnrmvT7ERqrUmCnvK1m4zRXwyexvQsrSGIfcmSYHP/BnTZ0c3byNV0eeiJHCPKG7EsUSSpnvApdR4WGENecQgdhQ91peQHx/CqCYEO59vk+JUcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y3XG7+FKJr2bgTZp3SuvJdpbOGxUISoGJ2woG3aQ2xQ=;
 b=LEHEzPLheaYy5NRDOb5lRa1/OVhG9srS+6XQheF9TbmTs9BWGWcAWgf7vWBPMsPwxoVcb2vutQHtwJcW8zcFfCeOQ+7Xv2QHBZUMFrXNwVA8TXJml5VL7Dq2Waz6fz2pSmcaytqNM4D1g4lATnKEx56Z6yhn7mcX467IeJ7/zL8T6XnEJTS8pmWdcdtkSZ0TifeXJ0Mb/ISTpoL+IxaSUQrqzDCnpsdS9Xq7+mAg854ucP/sFkDesn17ezbitvhbC7adk4xLT7zv0PBiXH5Ji1WqCr1aIdVBDvB/T9T43eq/y4U7VuYiNDyL6MC4KT+2Mw1zTzCG4EkebNZrsCvHWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y3XG7+FKJr2bgTZp3SuvJdpbOGxUISoGJ2woG3aQ2xQ=;
 b=CU2TXb/FYct6ALXtfw+AWcIGrmGmeZHvCgUZUzaMe5hv6ZTA6xb7kT8p+N++dug0LohrFXAEdrWeUWpQpywjyC62soMJCQfMkCcSdrEz2qViv642cJI2YAnlfECA9vxXpIV6AYDB1mhSlw5vjt3QgN0nzNzOXquMRbm/VVM9HuY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by PAVPR08MB8896.eurprd08.prod.outlook.com (2603:10a6:102:324::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Thu, 3 Jul
 2025 10:05:28 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 10:05:28 +0000
Message-ID: <460a0098-34ec-4ed4-8469-67b0f8a602d5@arm.com>
Date: Thu, 3 Jul 2025 15:35:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] mm: convert FPB_IGNORE_* into FPB_RESPECT_*
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Pedro Falcato <pfalcato@suse.de>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>,
 Lance Yang <ioworker0@gmail.com>, Oscar Salvador <osalvador@suse.de>,
 Lance Yang <lance.yang@linux.dev>
References: <20250702104926.212243-1-david@redhat.com>
 <20250702104926.212243-2-david@redhat.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250702104926.212243-2-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0119.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::19) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|PAVPR08MB8896:EE_|DB1PEPF000509FB:EE_|AM8PR08MB5585:EE_
X-MS-Office365-Filtering-Correlation-Id: 456b1d6a-8086-4a99-5a73-08ddba19378c
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?dTFIREZtRW5yWlk5dUdNNEFBM2NtNmhjZnF4Yzl5RDdsdzJsR1Jmd2cxeVJ1?=
 =?utf-8?B?MGJWZEMwT2NFUE5QRnlId0dBQnpFbjRaNHp5TlVxTVV3RGpwajZDZm03RElN?=
 =?utf-8?B?VFJMZ240aGlWcktmSTBtbTRacHJ2bWpCN3JyNmtWVjBEWTVGU1Z2UnQrRWZy?=
 =?utf-8?B?cGNsWVk2ZDg3b0F4a29aRmw4Njl1Q1Y3YXl3ajNWbU5kUG5PM0g5eE85QzRH?=
 =?utf-8?B?ZHFjVjUvNVZHejhuWWIwTUlQRFN2Yjduc2JyOG1aSWE5NVArVG9Xd2ZxRHgx?=
 =?utf-8?B?dGVYeW1teHJ2YnYxWnhQWUJXRGVuQzhQK09YWnpyYjZyWnlxL2JMSEJCMUNi?=
 =?utf-8?B?YXJtdkZCQUtnV3c0SUdLTkZlTWczTmYzV1RqTFVUR2daOXQ2R3dobmJJM01l?=
 =?utf-8?B?RndXWDRYSmVSU0RoMSswSVAwdUZIQUdYeC9FWkNjdFB1NXVrOGFKUzJJT0VC?=
 =?utf-8?B?Nlh2N0FPcWxSSkY1UlVlTS9kNEYvYTFQMk5xWndlYTZ4eS9lamN0NzQrTzNL?=
 =?utf-8?B?c3l0K0N2UUhCRE5HaGY2YU80Mm50eW0vQ1FuOCs0ajVPbHlQUnNMVzRjeVpW?=
 =?utf-8?B?VU1sOGdCK3pneWZRaWg2S3BQMXBXdC9GTG0rU3lUVTlhbTltSTd5cW5raC8w?=
 =?utf-8?B?dlpmMmlza0dZOUhtZEpSUGJDd2F1NDR3WlVnSEVQMkprQmxwZXNDMlJmdXh6?=
 =?utf-8?B?NXo3TmhheXN5QU1wYXBNbWw0NmlnSWo1aC8zbFl6K3RlWGpuNWtpdjRPMk1N?=
 =?utf-8?B?NC9wL0xJaWphRjJJcXhQeEZDOUQ5dFpMUEdMcS9GSGUwc08wdTU5NGFBWi9T?=
 =?utf-8?B?RnpxT0tWeTVtLzF5dW9MMTl4NzNVNFZFZzFkdTNsaFI1elY4TXNZbXRyRHF5?=
 =?utf-8?B?Y3lsZk1LeFRPTEtVQldEcFJmeFpCaFprZGt5UTdQdTliYTRuRllUMVlCeGRs?=
 =?utf-8?B?U2RPS1ZYOE4wRWVFTW9wVWRGQWlnNUQvUjNucnJZSG5SamtwYVc1anhoaVgr?=
 =?utf-8?B?R0h6MHp6Vm1zNFlERXpKNytHYVgreGJTZXFmS3BlemRRNXNHY2ZKMmt0NUsw?=
 =?utf-8?B?ajRCUURjNXVaMHBqdFZ6dmQ2akRVZ1VHS2M0MElHUGRHU0RGMUZTVTVwRFJD?=
 =?utf-8?B?UTVGRTZxTW93T0FNYXROcjNHdFFtM1ZIOXFiY1ZRV044Zm4yY1ZDbmFvSVhK?=
 =?utf-8?B?T1dEcWg1Z0F4ZDhkMVF4Y2wrRDVKY1haYkg5ZnE3SENWUkx6TFNBYXNnMEVs?=
 =?utf-8?B?K2NLRlF2RFpCOFN3Szg1QW1SVFBIMU04TE1JTk82ejRUZXQ0d0M4dk1rc1V2?=
 =?utf-8?B?NDIweTd0cXBCbXR2bktVMDVHMExQMVUreXI0OHJOcHgvZ2xzUWdNV0Y4M284?=
 =?utf-8?B?ZFA0c1BDS3Ntc2Q3R2NSWWdrVmltZzhLTS9aOElmRllXSytOMzlKSXdSVG9v?=
 =?utf-8?B?dmVpenQxbkhIZFlXeTY5cmxUUkJuYVF2c1hwcFlZOXpYWXRBZ1hHWmsrU0JT?=
 =?utf-8?B?ZGV3YUNDdWVqQmN1Z0hDY2dEYjhQd1RQdDF6S0U3V04wQlo4RmpBbENjMm5a?=
 =?utf-8?B?ZlpZcDkxelk4b1h5bUQvcjhCYzZvNUlFa2JTN0EvQ0Jvd2pnSjVaZlVDSmpm?=
 =?utf-8?B?SlhNU2xIaTNzUGVENjBCYlJiS2YzbU1DNWZzbGJ0QWt0MWoycVpkckZtRDVN?=
 =?utf-8?B?dVVqaDVVWHRmSUUwd3prUUdGdzBrNkpvNlpxSTFobENlaHl3SGdhdWNlLzc5?=
 =?utf-8?B?bmlrcmR2QVZpZ0ZMenplQ1RqcG5lMk93bmZmbGE0K1U1TnlucjZQa3h5dDhF?=
 =?utf-8?B?ZlZXOVpFdWlQL0U0b2w1N1haZWdJMWptN3BhNS9zbFpHR1ZCakZXOGR6cDdZ?=
 =?utf-8?B?S2VWUVdrUXg2ajJQVldRSHRBTGRnL2dJWXIzR1BPRVlFUUd4SDg5MnBoZmVa?=
 =?utf-8?Q?eCQ4XzAKBu8=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8896
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	57c0679c-a513-4b06-2c1d-08ddba19233e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|35042699022|82310400026|7416014|376014|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?djdreW1hcmNONDJITXk0MWNubEsxNGxwVzBUQnBJc1hBN1NzaWhLRWxiVHhy?=
 =?utf-8?B?UG1HNDVGb3F0MTRmOUMwMVlibmFKemZQeFdpRkUrLzFyZW1Fa2VPTmxYQ0cy?=
 =?utf-8?B?dWRXUE5sNDA3dGkxRmZydUVQblI4V1BjdGlnV3UyV2dqL3BrWXFjSnMreVJ0?=
 =?utf-8?B?SmU2WlUycGpxcUFNTkxqWUxGL0FFTHdWL1hjeVVZY1huQllJQ3hJQmVZSzVo?=
 =?utf-8?B?VGpnSE0xUDFNdEpmZWthSTM0anV0K3VLdHBuQUJhNnYzeU1kMmlVS25SWTcz?=
 =?utf-8?B?NGxyZ2lRUXRIeWNZV2ZucTRNOERNT2xSMFRhNjlsakpRK2NETFZvd3hpSkxK?=
 =?utf-8?B?RnhXRUp0OTJOam5HQlhHcDVlYVZkT01ESThHYUIydmoyRXdKdmRKcm1BeTRt?=
 =?utf-8?B?RHk1ZHBkek8rYXdCa1pCMnVvcjB3ZkN4TzJibEV3RTVRWVRLWVkzbjRLaVFF?=
 =?utf-8?B?VXRpeFJtOW1zdmxaOHlySWt0RDNteGFCclhoV0k0OVJ1Z3kxSHUvSnBSL3R6?=
 =?utf-8?B?dUhyWjh5ejRibzdrUkM4KzhYYkg0a1V3RUF4OTNOZDdrNjZVd3NVRUpPY0tM?=
 =?utf-8?B?eWNHSmtjM2dQck5MOXYyVURZcmdZa2w0aER3SkJDcW1Ed3lRZWp0eVdTR0pq?=
 =?utf-8?B?b1FtOUljZ3pLUVZSZ1dKVEQ1QkVjQmJoTzlFY3RiMklXY0NVRDRHU1JTNm4v?=
 =?utf-8?B?eWFRQmxXNzIwZzBPb1JZTmo0dFdEL1RwUHZJQ2JtaGdQQ1VFSHV1bTVVYXR2?=
 =?utf-8?B?Y0tuTks2VkR2b3JMZlV2aWJDRTlMVEFjYU5uMjFsM2c0dEpobEd6U05qQnZP?=
 =?utf-8?B?OHF4ODhURWJpTFpFMG9RY3dpVkx5TEJXNGJsa2djL1p0UkJWS3lSb1pvTktE?=
 =?utf-8?B?ZlU1ekFvTmI5VEJmV1luUldMSGpIQnY3YS9QeFlMMjBxTVJhR0lPZ1VkMmFS?=
 =?utf-8?B?NWdmSVlkWFVDbVk3MGZLM0Zoc0JZOE5mdEdrbmJ5NmNHbHorRDBuNFVWb2FY?=
 =?utf-8?B?b2tFMlpqK05MdmFFUWdqYmJIL01IU01pRmltVEVxMFRBdGN4OEhTNks3bEJ2?=
 =?utf-8?B?NS81YnhYRmNFT2FOczVudWJxbmtvNTJIaVlTcTRLaEhBUUZCVVRLYThRQ09T?=
 =?utf-8?B?Uk9BK0RQSWNlaDk1SEZWVXJKeUVMTld2SXRSdkN0eGlWWHo0aHlDVVhrUnJ5?=
 =?utf-8?B?RUlNbDBFS2hlaTd0aENIOEMwS3B1ZnVIZkhYOHBoazZPRncyM2MrOWVsN1A1?=
 =?utf-8?B?bXhUUEQwMEFEQ1ZxaldTTm1QNlNuTS9DU0hVWEt3eUNMYUI4RGxIU28wV0tI?=
 =?utf-8?B?a1RqT3FpdVVDODhDVVp2UUdMc3Y1ZyttMi9Jb1BZU2lnbnNTWXJUaTlveXMw?=
 =?utf-8?B?eUpySDVWUkExWjFudkEvWVJjaDZoMU5ERUdzK3kwQzVybTRua2lnWHZ3MVc2?=
 =?utf-8?B?OElwam5GbnlUazMxcnJlZ3NDZ1hnVnIrbzBxL2h3dUk4c1dlK0Y5bExhNWRR?=
 =?utf-8?B?cWQ0RENKV3AvV2FtWldCVVNoaUd2V1JCZzNWTWhJcnNBZk9ua0dlY2FaNGx3?=
 =?utf-8?B?dmFUZllYWElEZStFVlFrRmpaaFU2M3RkYkxyV0FYeExPNUxFVkJ4OHJPZDhY?=
 =?utf-8?B?WmMySG5NZXpsQVpHNVBGM0xHNktRTzhaaFJJTHRkWGlYWDBvaGNtL21HVlh5?=
 =?utf-8?B?R2dHNDExSXR5NlcwMWorN2R3ZmhvY0t3bjU0NlkrNDlTa2dhSlNTckNwQjg2?=
 =?utf-8?B?Qy9DQlI5c1crSTFEL2ZtQWZCS2tDWEZkWWw5UEZBbkpaRm9tUVVUVWh4aXUy?=
 =?utf-8?B?dmppVVlObWh4MHJFVEdqNVJ1WnVWRk11UjlzbUhqYnE4WW9RTXVUZzhCNmsw?=
 =?utf-8?B?WHdITUhDQURXVzNWRTFUdStONFpISis2QlUvNjVGTEJHOXJQSkpkQ1BPanlE?=
 =?utf-8?B?U0NxUW5lZ1I5dzlNanNsM0tYQjBBZ0xQbGxFZDhpU3ozU3J4bVJQMklWd0po?=
 =?utf-8?B?T1EzaU9vcnhFc1ArWnBIZ3dTbHBxT2JuNWZJWk5SOVhxRVMraWhhL2lZdnc5?=
 =?utf-8?Q?W9ZNwz?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(82310400026)(7416014)(376014)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 10:06:02.4251
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 456b1d6a-8086-4a99-5a73-08ddba19378c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5585


On 02/07/25 4:19 pm, David Hildenbrand wrote:
> Respecting these PTE bits is the exception, so let's invert the meaning.
>
> With this change, most callers don't have to pass any flags. This is
> a preparation for splitting folio_pte_batch() into a non-inlined
> variant that doesn't consume any flags.
>
> Long-term, we want folio_pte_batch() to probably ignore most common
> PTE bits (e.g., write/dirty/young/soft-dirty) that are not relevant for
> most page table walkers: uffd-wp and protnone might be bits to consider in
> the future. Only walkers that care about them can opt-in to respect them.
>
> No functional change intended.
>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Reviewed-by: Oscar Salvador <osalvador@suse.de>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   

Reviewed-by: Dev Jain <dev.jain@arm.com>

