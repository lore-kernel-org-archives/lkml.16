Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012043.outbound.protection.outlook.com [52.101.66.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47281E5B60
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 07:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.43
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750231825; cv=fail; b=l14CbBMzfU5aQI+IWzHwt9Y378yqWlFXYE8LPvjfo6HUEsrkxx5LRkTdZfiBpI+JoVR/tchejrWEO0PWua5JHuCd3QdnH/3CAHokw4DfP9pfXaM770/5+5wNEQYi8O8rVOGV/zl5enDsTzs0FmBGMP3Px++UEj6JkQO69Uzhy18=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750231825; c=relaxed/simple;
	bh=L8rA/X0D7sv+RGBH6QskNoop70+INyzRayrQFKnf4B0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kQEGYCHdKOEaQvafOwCCxXBCBmrpSZSlRBw77eKQTJKG+hom0p/CWvLf9DG5KYy/4Af/NNcZjDxwFQ4NVrYjZ2kMz7mI5Hgjxez5J6rhfM6QT5gdQ9Rn78Mb/mdYDpOwidbkJXcjlGJ7g0wO6AnFpeu8/ea5Oszcu9HlkgZYHt8=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ppD+c4bu; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ppD+c4bu; arc=fail smtp.client-ip=52.101.66.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ppD+c4bu";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ppD+c4bu"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jOEnzZ2SMrGTUSSYW7t4gXIWe3fp8cCLHGg9jDjCYPsJVl5aM+nnMrNLFygurdgot5qaPYP70vFQ3WD0FGdlMaF4ju3WWv9zF9epTa4t7MFTG4rx9cDRzq2DnfbpXtf1dJuCUafRaqK5s/vHCnjJeLjkoKiB+fCVZYNRghYaSOyLnbxT7HeVyJDojGb01t1OWrzwdPPfmfWRHCCREd0tb3h4mFdLCgO64r+9p2ryh79x4YMUPTNULffaKn6TVPgAGF6KJU95fuUd9zFqeqCWNvbW9LSGI/RsVCOCdZUbzAwhgDqzW26YkiRFzYzJQUzh1emN58pspbpr3tkrrgCO4g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7jZ5iohybPnDr1+Gci5U8Ox5tuSuKgEhl+ox+Bh2Ao=;
 b=wW06mbzJA0d2oT+1tg3rYnToForxo9by9aE9m6owZnv5H8n6aF6yfFBIy3FjMQEth/H+zlzyIj4pVklxiu6Ks7XDec9Ybw0fLokGMRAZRQjYLkUu7YIdXc8RP5c19/PwX3HC4+Lz3UyTKWH1T8Ds5PcX20rz6rS5bqpfUXp4O1b7Q2pHs9gtKm6OVC91PQvNqGI8fW6nw8EoxDSBVvOZXko5Xw3oEPvcqDQmWSzTAYj6klJltGD13VFhA2NpedEzlAg4K9yTbRzkgeWGsfPQ2zMriXT2CXbFsQruAHt4BEm+23+qLCb9F6nUt4aV5dAHYHF7k3qpCXOSfSsl3RSceQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7jZ5iohybPnDr1+Gci5U8Ox5tuSuKgEhl+ox+Bh2Ao=;
 b=ppD+c4buqkFRJu5tnAoji0BvCXErUk0ISYe4GhKh9t9kPEp8+IBZ/VCXr0U9LpxjAlLPXgUjk0daeqY4oq61ZhB1KJA2/AZKjNt5bKFgTSB52yd7Dug80aKELsDiz9AjB2ggbyd2Vzt0oxzkEF7z74MVEQ+ju7uZE5dJI4yIdMM=
Received: from CWLP123CA0169.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19b::11)
 by PA4PR08MB6190.eurprd08.prod.outlook.com (2603:10a6:102:e6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Wed, 18 Jun
 2025 07:30:15 +0000
Received: from AMS0EPF000001B0.eurprd05.prod.outlook.com
 (2603:10a6:400:19b:cafe::38) by CWLP123CA0169.outlook.office365.com
 (2603:10a6:400:19b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.32 via Frontend Transport; Wed,
 18 Jun 2025 07:30:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B0.mail.protection.outlook.com (10.167.16.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.21
 via Frontend Transport; Wed, 18 Jun 2025 07:30:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+BIVQx5ucKd6BKzqg7hPwG/7pSyreZ7Vn5vm2gv8pCeB8TWFUOxFeDrK24bPDBXNylwJJwEvwhnO2KtVwjn1RLvOw6IbtYoarLznCzbPIWwsBMWbAt0NZp7nlyuyBCY6n8EYpAcdyscXKm51Mzo4wCFW73DZQz6ct7+OFFPEBO9Gt5aTSVAArQxwpkK0Q6isVgHD2jyZCoFowiasKPfKj6CiqL+mNTdXnD2sPb3JxWCSNTalc15I8lvNmop6ZFbpagfY+mNt33nQbszHzvrrgNTaSuKBX48Yzo39TL8qZ0C5KuNpWHAn75NcZ9D9BrUbt0WDttALUiEplz48KYOLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7jZ5iohybPnDr1+Gci5U8Ox5tuSuKgEhl+ox+Bh2Ao=;
 b=pcxw9bLADZxfK5rNCM83hFf+tt8XlS19IMCGEZ4TbtusyQ83wja9WIcKPbXhNYK776/VcDTcuhg+nbIKV39xgAiNYWpzC7iGCw30t7I29HPsvyOl9iHVbO7rQ8VoCRo7uDEaYh78SVjmK2M/ZYjkUQEVHd9eQh0bKcoj9Q4ixnroTp244lkSzuelGUvUOdm8O/KPNlbb9S0126ffZgb/6Sd1F2CgIlkpR83sSHrHZ2fMAj/Z1RlbLRxohHCGnmoisqkAHXLDqb0q4W6xsfsT4R9yK0nvYgwKR8sWV45P2husRcC/7f1eFL0OGBXjkuzkFj4GgV7su7htnvKHk8V3eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7jZ5iohybPnDr1+Gci5U8Ox5tuSuKgEhl+ox+Bh2Ao=;
 b=ppD+c4buqkFRJu5tnAoji0BvCXErUk0ISYe4GhKh9t9kPEp8+IBZ/VCXr0U9LpxjAlLPXgUjk0daeqY4oq61ZhB1KJA2/AZKjNt5bKFgTSB52yd7Dug80aKELsDiz9AjB2ggbyd2Vzt0oxzkEF7z74MVEQ+ju7uZE5dJI4yIdMM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AM8PR08MB6467.eurprd08.prod.outlook.com (2603:10a6:20b:316::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Wed, 18 Jun
 2025 07:29:42 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%4]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 07:29:42 +0000
Message-ID: <9314d711-6bbd-4b6b-b95b-64fb6c7dae6a@arm.com>
Date: Wed, 18 Jun 2025 12:59:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] mm/shmem, swap: avoid redundant Xarray lookup during
 swapin
To: Kairui Song <ryncsn@gmail.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Hugh Dickins <hughd@google.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Matthew Wilcox <willy@infradead.org>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Chris Li <chrisl@kernel.org>,
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>,
 Barry Song <baohua@kernel.org>, linux-kernel@vger.kernel.org,
 Ryan Roberts <ryan.roberts@arm.com>
References: <20250617183503.10527-1-ryncsn@gmail.com>
 <20250617183503.10527-3-ryncsn@gmail.com>
 <c9503955-36a0-48eb-aa4c-73a85b2da2ca@arm.com>
 <CAMgjq7BmJ1fqWsDgkbiCt++_uA1D0kxfDOdKVjtHCS9Y4jfKWg@mail.gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <CAMgjq7BmJ1fqWsDgkbiCt++_uA1D0kxfDOdKVjtHCS9Y4jfKWg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::7) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AM8PR08MB6467:EE_|AMS0EPF000001B0:EE_|PA4PR08MB6190:EE_
X-MS-Office365-Filtering-Correlation-Id: e0c2e2b9-e9ea-4755-b526-08ddae39f7b5
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?eStPSk1qRTNEN3VzRW5VSlRIcEw1VHhiL1lSMzIzRUM4MnVseExEc0NJcTV3?=
 =?utf-8?B?L3B4VXBXSkNrcS8ycExmSkpvUTd3NkpzalQ4WWl1ZVd3MXdIaUJINFFGaXlh?=
 =?utf-8?B?QVFlNCswc2hpc3hpQ0lmNEh1ay9uUzc5bXpYTzBNRWdwMTlXZVNDVmRTZ0t5?=
 =?utf-8?B?U0lySmVrSGMyL3lWcEptNFA0bkFabFlwckJVdll6d0NkVExPZ1NEUk1uZUVL?=
 =?utf-8?B?Qm5xdDhpeGdEdUxOU05YaWZ1Y3JmWGpxamlUdW5CNVVNdWk2NUVXd21JNUtY?=
 =?utf-8?B?NC91UXdUTkE4Zi8rVmhzay9mSW56ZG5WMDhibSs1RnFaRG9hWVdFbHdoVDky?=
 =?utf-8?B?bmltb1gxRFpTYWZDSGx0SmlMaURBNTBpVElIYVV2VFhLTks0TmZNYWIyVGhp?=
 =?utf-8?B?Mk11cVNFY2VDd0ZscWRNUTEzWU8zRkRUcVo4VlBFR2VINi9ZRVo1RERJaGZk?=
 =?utf-8?B?a1FDMTNvbHJxMzRWVnFjVzBicndrS2RReUQ3VGh0ZGZwbVdqMWlpcFFPNGht?=
 =?utf-8?B?YndnejEySUNSanYyMys3T2w4QjNUcGJSNlRhU1RTd0psTXdaYmRZT3pZSk5y?=
 =?utf-8?B?R3VmWkh2UEpGRHlSTDAxTmRrT0tBMnJCZHoxZFZVVFNZeWNvRURGUjV0eitp?=
 =?utf-8?B?NnBvOWozNGwvak5VSE9qSEVmcjB1Z3U3dU9naDJIamI4R1lPbkJta044YUds?=
 =?utf-8?B?QWM3QW82WmhZOU9OUUg4T1Nod3JiU3hpN2JKWmZjZXFGTE41c0hhZHJMRGtE?=
 =?utf-8?B?REhoeHQ0UXN3VlVyVlRpTXM1cTBTemRtZ3ZKOUtsTkROOWlWQnFFMko2Tzgx?=
 =?utf-8?B?L05SSU5pS2VqV1ZYZGNFTm9UbFVrc2lpSlJFbTJQVi9XNEs3N085MGdHTzVL?=
 =?utf-8?B?Rkt6Um9NbXZycWFtYlNZTFZOaHZEKzl6dGFXejZCZkJzRkYva1hobGZWc1E5?=
 =?utf-8?B?ZURVdFBUVm51RS9JL09GRGMvK205N3BHOGlnY3NxZ3piaWlXbEh1RGdHYjRM?=
 =?utf-8?B?MnRnU0wzbmlpMnhpYUI0bjZBQVV5OWEvSFA2QTkrT0N6VHlrYTh0OUNXVHho?=
 =?utf-8?B?cGVtUGpSeSs5RmxCaVF3WEU4UkhnQjNQd3BkZGV2SkthUXp2MXVncUVjalR6?=
 =?utf-8?B?c1MwYzhadkVqVk45SVZvSzY4dG1wbXpQdG5xMmozZHJiUUpvT284YjBvWFRQ?=
 =?utf-8?B?UkJEc1JmRXg2ZUxuY1UvTkdLZEswaGlVWFphUzM0QWJWOWU1R1JjZWNoZUpX?=
 =?utf-8?B?Smp4cFlLTEZJTVhLa0h0ZThrbVhBeW00akZhMXJnSFBVTURTaWhWUE9wZ24w?=
 =?utf-8?B?N1c4UzdUUTFpWTRDSWVFc29PMnc5QVVxejJHQ3BuZ0Z3cVBrOUZEckIwQjVx?=
 =?utf-8?B?MEI2dmtnblVMTmoxL3dzTGUwZjNWcDlmc0o5TXRNeU5IRVZpT1lOKzNlOU44?=
 =?utf-8?B?TFYvakpLSVNUM0tQSVFFWi9vOTgxU3BMZXdZUUJsb0w1bmdndkVHYnd5U3Fn?=
 =?utf-8?B?dDYyV1lDalg0T0hKdksybWFFUHIxYVQrR2JuQlR0R3BtclpUeHB3NldHRGQy?=
 =?utf-8?B?eGtYNVFXeERYSCtDd0lJSnBEN3JVR1hwSUZGTTNEZU9kZi9CZnhOOW1VVnhY?=
 =?utf-8?B?Q0JNcDdjNUVFV1VsbGZnLytWd3Q1TTNmMmRlamRUWFczckNxR2paZ2pKVjVs?=
 =?utf-8?B?UVNCME1KeEJ1SHpTVkplRklPODVvTHBTMEcrbmlSZDk0L0IrNndYcTd4eFN0?=
 =?utf-8?B?T2w1VkxTQWNoWWxHWXpZSzZPaE4rY3lNSUZIWUZNMkxQNE1MbTBKUTlrUjIx?=
 =?utf-8?B?bnJWWGI2ZVk2ZXErdU5TV25vUVBRYndNTWJjV3ZvNmN2QXd3ZzdId3hxalFW?=
 =?utf-8?B?KzJ4Z2o4QXh6Z3ROZ2VqVFRtL2J1b2VYajFoNldwdVk3d0RpU1JIc20wdm0z?=
 =?utf-8?Q?tWxr9vZRFeE=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6467
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B0.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	50980a39-49bb-4dcf-9c69-08ddae39e454
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|14060799003|376014|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U2NvemlPWVJPYnBwVkZZQnRBancrVGZWbUhiQ2doM0toL0R1eDF0QUFCVTFT?=
 =?utf-8?B?OUVWQXBXNTBwNUhrTlIweE5VUzRGcmYzOFc3ZytwUFdjMHFjMmpVWkN2VXl3?=
 =?utf-8?B?eEx5SGlYTGp4TXRpOTJHbVJuenFwK29PSWFGdlV5OURESVdndk5Nam5SczhG?=
 =?utf-8?B?TWovTi9KT0ZmdHRndm5RUFNsNlMvQUJ3MUYzV3Zya0M0Q2x3cEI1UHJmK0pP?=
 =?utf-8?B?OU9jNkVQajY4eXlJMThnUXp3THRqSFpkYXVmTCtsU0VDVFJFbUlyckpZS3B4?=
 =?utf-8?B?ZHpRUHRJYlFlV2dJTjdnYVpMT21FdFRidkRlanF6WXRKNGIzSzZyR2RMbGNJ?=
 =?utf-8?B?Wmt3RFl0NGs5L2RuR3dZZnFiVkRodTlSd3NDWFdqV3FJaDlQTzg5bU05UkxH?=
 =?utf-8?B?YmQ3dlhNMnNEdW8xYmphTFBKbDVIV3U2c0I2VHQ1Y2RvZTBpdWN0NFpnL28x?=
 =?utf-8?B?ZFBDWWNvSWsxRW5EV3NHdnROTU9jSXE5TStqVHlzM2VzbUttR2pIeGwrTzhB?=
 =?utf-8?B?SkpBc09yUWFLK2I4bFRRYW8rSklIS09LYjdzUWRIV2t1OEEvN09NZTV2UnlN?=
 =?utf-8?B?WGtoejVuUFJDOTIwN2tGWEJDZW91MmVKOEo2K0FjcWpSQ3ZSQkVzSHFvTzlN?=
 =?utf-8?B?Vnd2b0o2dmt5cFZCdjJGQ0lyVjBSbVpYR0tkckR5N1RZOTU2RFVWSmJTMnVQ?=
 =?utf-8?B?QjFKU1dsVGROamhZUThSUk9BSXBGRFc2Z2J5dnMzdnJOVDlWempMNURPVHB6?=
 =?utf-8?B?TXQzUXBxRDZvRWlxWUdOYVlxS2xkMm9DWTBDSkdPbU4vYVhEdmx1cStOQlNC?=
 =?utf-8?B?QXpVSVdSMlpkNnNBM1dleUNZV1RmSXBFTERsL3o0ZXdWeWJGSTRvTHhpTG5D?=
 =?utf-8?B?WTN1d0NQL1pySlRCOFc4ckJ2YkxyNmFvWE1iR2VjVURzZWIzNVZ3WVpnK1VJ?=
 =?utf-8?B?NFlmUzJ1R2RBQW9NOWc3YWg5R0hLYnFRSm95TENjWEN1UG96S2JIWGZxaUJC?=
 =?utf-8?B?MHNvbUZMYW9pM290akZvTmM2ZTJJZFRRbzZhamo0blFRU1ptcFZJeXJtTWFl?=
 =?utf-8?B?SFRNVHdtNEZ4bkhMTGc0R1c4bm4xd1BWaDFGUkdDemZYc3FQQ2tkZEQxMlhr?=
 =?utf-8?B?Z3hCYjBaMm9ydFBpbzJOVjJDa1poaERPQ3g0akNmWGgvYlBKVWRzQzVkcFNT?=
 =?utf-8?B?ZUFMZ3Z0M0hNTDh3Q3oxUHpCZFVYZ0pVZEZva2JtcitiYVhhNUJodVFaQ2ZI?=
 =?utf-8?B?TFpYTDhXVm9hcCtpVGx6SW85bkdaZlZHU2prSnl0TWkzZ1pGK3JvK1JWOVh4?=
 =?utf-8?B?Z1ZIOGJiZEFncnMwYldVRnhDQ3VhRnF2WEFDU01pNU03c0Z4SkZXT0FseW5P?=
 =?utf-8?B?bGk2RHJ0NSsycEVuOG5vSFBZaG0yQUxUMEdUejBXblJMQ2hJSU4wYi91czU1?=
 =?utf-8?B?OTJvYnVvMTdRT2x3MTNtS1dZbENQTWt2clljOTVoRVZpZkdQUWZwOTZERlFr?=
 =?utf-8?B?a1NuL3VySzlwS0JWU1N5bHBUK1N5YlVISURCamsvNk5vcnd6WFhjYnJHNVpZ?=
 =?utf-8?B?TTBaMjV4TCs2ZHNwcnVZcnpoa0Q4MFg3RnVkKzN0Q0hmQ01NclhrYjVZbWh3?=
 =?utf-8?B?cFRmWDAxd2tPNFNpKytHTFk2V2JZUDZPSjEzTmxML3QvWnk2VU0zWHNJck9O?=
 =?utf-8?B?aTFXK2dIRWZPNkR2Y3hXOXZveldaWjVTVDI3R3lyL2EvcGdzd0F4dG1mVXZU?=
 =?utf-8?B?R1NkbytZaXA0eEZLbTJGWU1ETzJOVjcvNUFOb2MxR3JpMzh5OFE4V3RLeXBk?=
 =?utf-8?B?SDJQS1lvU1pOTzNENHRreWNnU1lmVmlGaS9xdVdyS3M5SkNYSXBxVytweUFU?=
 =?utf-8?B?eERZbkxWelJiTUI1OXpzb2tnZFBCcGNoYUdVZVNVQytZMjZGbmRwN2s0YytU?=
 =?utf-8?B?Z05GL2d0OFJlSFdYYURDU3JYRTJIeElxQk9Ia0EzUnErdFNOV1BKaEFQYWZL?=
 =?utf-8?B?UkJjTnZtUWY4LzF5QmtGdUorVkllOTgvdklpcXEyQ1hKZEMzckpIVGVCWlUv?=
 =?utf-8?Q?1T30Yw?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(14060799003)(376014)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 07:30:14.7830
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0c2e2b9-e9ea-4755-b526-08ddae39f7b5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6190


On 18/06/25 12:52 pm, Kairui Song wrote:
> On Wed, Jun 18, 2025 at 3:17 PM Dev Jain <dev.jain@arm.com> wrote:
>>
>> On 18/06/25 12:05 am, Kairui Song wrote:
>>> From: Kairui Song <kasong@tencent.com>
>>>
>>> Currently shmem calls xa_get_order to get the swap radix entry order,
>>> requiring a full tree walk. This can be easily combined with the swap
>>> entry value checking (shmem_confirm_swap) to avoid the duplicated
>>> lookup, which should improve the performance.
>> Nice spot!
>>
>>> Signed-off-by: Kairui Song <kasong@tencent.com>
>>> ---
>>>    mm/shmem.c | 33 ++++++++++++++++++++++++---------
>>>    1 file changed, 24 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/mm/shmem.c b/mm/shmem.c
>>> index 4e7ef343a29b..0ad49e57f736 100644
>>> --- a/mm/shmem.c
>>> +++ b/mm/shmem.c
>>> @@ -505,15 +505,27 @@ static int shmem_replace_entry(struct address_space *mapping,
>>>
>>>    /*
>>>     * Sometimes, before we decide whether to proceed or to fail, we must check
>>> - * that an entry was not already brought back from swap by a racing thread.
>>> + * that an entry was not already brought back or split by a racing thread.
>>>     *
>>>     * Checking folio is not enough: by the time a swapcache folio is locked, it
>>>     * might be reused, and again be swapcache, using the same swap as before.
>>> + * Returns the swap entry's order if it still presents, else returns -1.
>>>     */
>>> -static bool shmem_confirm_swap(struct address_space *mapping,
>>> -                            pgoff_t index, swp_entry_t swap)
>>> +static int shmem_swap_check_entry(struct address_space *mapping, pgoff_t index,
>>> +                               swp_entry_t swap)
>> I think the function name shmem_confirm_swap is already good enough? Anyhow the
>> changed name should at least be shmem_check_entry_is_swap.
>>
> Good, I can keep the function name unchanged or follow your
> suggestion, I thought a `confirm` function returning non-binary return

True. I will vote for keeping the name unchanged; you have already documented
the return value so it should be fine. Just can you put a new line between
"Returns the swap entry's order..." and the previous line to make it clear.

> value may look strange. I'm terrible at naming things :P
