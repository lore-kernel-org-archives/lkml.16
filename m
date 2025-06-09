Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012026.outbound.protection.outlook.com [52.101.66.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F892522A4
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 09:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.26
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749462166; cv=fail; b=QIGCV3Go9mnNyWKg874gV4knjoP4iHPEbRDMU8zXFw7QphFunG8eM/De1fahsD0eJGwY5tsmbb0Xeamu6YAmbUw245kGCAm8IUeGdgb6WoYt6RiM/75LdZ9RsHokcRCetTpdYayScLLDYV96oUZS5OU+ydpEBXQwtE7SlK0IheQ=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749462166; c=relaxed/simple;
	bh=e/QLDW/Ko4UuG9TV60qDfrg3m39eR7V/V6X4uoTRsLQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EOBKMEwvM/quQ1VWqJ52Igcbb2sqPSgoiGFLGr8FzjI0Y4CvvaI6WrEft7OwKoHW9EoV8ObqirnE9PxWpTTnM4foX4TVceSSHfF9u0UxpApqXPykYtul5flNo0uUa9OQy0DWpGtqgxvz0R6zALDnaO6S5Pcs/wDmXZrdhSei5FU=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=k4oalIlv; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=k4oalIlv; arc=fail smtp.client-ip=52.101.66.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="k4oalIlv";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="k4oalIlv"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qAJ/nd3+fa4xq+XuF1rtdng/YVhlOSTDgC0MC+E0dy00Vkwy5Mt7aLN56QCHT4NSIpJ4cPmrPTqLfKslj+PqHliAgHp6kcpF+Nn1qrMfHr2tFpw2rpV09zUg7b9VfvcWAvs0ZB25aVkFSgUND4N6ua+htrjbx4oP99hPh7fCf7Q3RYCmfzy6zRJHy0//fVIuq3M8Wyc7zHgO9IgYcGZdo9A0hbTfi3sqgHgjxZrNB83hhiN+F2PJjt23ZDrRnxTqiQMOeZmw9yqVALdhComEuR4NUzixavmns9ToI+lc3nAUJWV2WVK8aMn99ZGONycd9VyTxn6Baw7afk67uK7SzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/QLDW/Ko4UuG9TV60qDfrg3m39eR7V/V6X4uoTRsLQ=;
 b=dsIvUlB5GX7lsaqrUMMgnZhTsZB96YD1I/qoRMfysPnjUshccJcNL82rv5HwmA8FBZJ04wHMYpuiTTr9UvCjvkiOrLQwll8fkudiUu1gAu+KcIclsD6Otd4FOsVfqVQSuWmSHKJsSOO+BB44iUF8MgGHbfI5/LRSZzXmopKhYpUcaClstQTBjBNbjogRBtYpLfSnz+wezODQzaRGtw8EGckXQ5TLvzN83zuMGDk+UBHezrjg93sQkdb5wZOlqxORV0aaasE8PUWZUc3rVB37mZlXjkevE0xkTJ26gKlsV6jOxio86TjOPamXVZ+RoIQ8UA+ibzYwl2/gWsHqOP3lfg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/QLDW/Ko4UuG9TV60qDfrg3m39eR7V/V6X4uoTRsLQ=;
 b=k4oalIlvGlqx/lGvMlG+//Khgep+p5oOjsk2T2HBXQeTxiHM++dMXmb8PJibNigCHnB9dN0Ge52lRrTD29bP3m3MV+Jgy7Undq8M0WaqZzDUBJriNMCvb5h9QPL1tu4PH5ossaEKtyFb48ycGzM7IFduT/lh+gs79KeESf0pGQo=
Received: from DUZPR01CA0309.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::9) by DB9PR08MB7771.eurprd08.prod.outlook.com
 (2603:10a6:10:397::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 9 Jun
 2025 09:42:40 +0000
Received: from DB1PEPF000509E2.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::b1) by DUZPR01CA0309.outlook.office365.com
 (2603:10a6:10:4ba::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Mon,
 9 Jun 2025 09:42:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E2.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 9 Jun 2025 09:42:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b+11840MpQP//TR5OnjssAgs0Df+KBXqIWTrCx+GL3ZNp+fSOw7XY0jjDnotLo8nMs8lcdvxh5y5e9teKcfvZFkOfmk8+HxgLDEi0xHSBEpNs0KAGjePnn8pTED5MgxwXhRyDvVkfUN/bA5w5ysDLlI5/HTOO2fJfWehoycpEaZn24er5wexlIpo5cOGF+r+I1TFy302wfl/gRK5F/mYK7abLQzFGF6ee5IPK4TZqcKChgqnIay8Cf8mPuaGrSJMypJ3U66WFDpD0yPiq1ETcys2Z9/TpxuTRrbHoYpUHSIwfFZOyvwBPHPE3dY/RPfmRooOUlkmdVDpe0sBnzUXqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/QLDW/Ko4UuG9TV60qDfrg3m39eR7V/V6X4uoTRsLQ=;
 b=op0+2NFeWMaxJqDfRTMm+DGb9vqKu7r/GMM71UItc8vR9LtHqL/CBWkW6yYD9QiPVIuKbTfnsaEIrxCBUk64cEIoad+HZtXtTDxtjCt64m2CCTJzM9Zoj+Zx6fxXXWe6yAUL9MzTg5224oDbnFKSKZK4H+P1yVYgxiSCtJ/xJlGZWCLG2mpIhTCKoQD2VPPb3y3a+KnhbTen3YNmgT80Ecsw28AtsA5sIafEUOtEAecQ01vH8sHS+alB6mObFeQoNqnVBTZd0wxJu7WjGdVYzpfvp0v9iTpgAJz7MOvv9ZZ7NQWAiAycTV3HEtayIhDmbvI4S18/7aa2HTBk0ZnUiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/QLDW/Ko4UuG9TV60qDfrg3m39eR7V/V6X4uoTRsLQ=;
 b=k4oalIlvGlqx/lGvMlG+//Khgep+p5oOjsk2T2HBXQeTxiHM++dMXmb8PJibNigCHnB9dN0Ge52lRrTD29bP3m3MV+Jgy7Undq8M0WaqZzDUBJriNMCvb5h9QPL1tu4PH5ossaEKtyFb48ycGzM7IFduT/lh+gs79KeESf0pGQo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by PAVPR08MB9331.eurprd08.prod.outlook.com (2603:10a6:102:303::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Mon, 9 Jun
 2025 09:42:06 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 09:42:06 +0000
Message-ID: <58d53c0a-1b61-4276-bdd5-9eb2e583f865@arm.com>
Date: Mon, 9 Jun 2025 15:11:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: pageattr: Use walk_page_range_novma() to
 change memory permissions
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, david@redhat.com, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org
References: <20250530090407.19237-1-dev.jain@arm.com>
 <20250530090407.19237-3-dev.jain@arm.com>
 <f528506e-b04d-4c80-93c3-93ba4ca385bd@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <f528506e-b04d-4c80-93c3-93ba4ca385bd@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0177.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::9) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|PAVPR08MB9331:EE_|DB1PEPF000509E2:EE_|DB9PR08MB7771:EE_
X-MS-Office365-Filtering-Correlation-Id: dc3a30d0-482a-4dea-d011-08dda739f8e1
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?QkRDZGwrSFp6akZRYUJ1ODdFeWdPd0hmekhXdXVvMjRjR1VFaEM0TU9Lci9q?=
 =?utf-8?B?MUJUdzZKUEZUMHU3aWkyWEVFVW9hdFVPNWFyTyt2MVo4bXlCWDA3VzArZ2Vu?=
 =?utf-8?B?cVVocWU0THNKOEFyd2txa29pSmJvamxDSmltSC8zdkM0aEREZDBSWE1zbzdk?=
 =?utf-8?B?bHFoYlJYM2FLRk1hY2J3ZCtDUi83TWtIVzcyNHpkTEtmVzBvSTRoRFU1a0lj?=
 =?utf-8?B?UnNERGdvcTIzVEwzc241dExoZFM5WXdpdGk5cHAydmtQUDcvNzdnemNnM2d0?=
 =?utf-8?B?eGpPSFVTbllaSXFBV3VVL0oyLzBlK3dBWlRGL21CMG44SWRhOExDZHZzM1A1?=
 =?utf-8?B?NGhKSDlUcS8ybDN5bW5LTXFZTmNGYzlDazliMEtPL3JmU0JRNTBvZU04TEN5?=
 =?utf-8?B?K3VvblBidXh2OWJkNExFT2wwbFRvcTJEN2ZYek5vcDFhMjc1MUpidElLS3o3?=
 =?utf-8?B?T29Wd2kwVzcrc09VODAxelJESWtSaEhETkIzMll4SjNTSHJWekRvMVBqNWRD?=
 =?utf-8?B?SDljUGMxdjBBeWtmMWg5Zzg5ek5XTEorZEplSHVtK2FvekgwREcxL08vMFVB?=
 =?utf-8?B?bk82WnRuSlM3TDgra094NUdQSTBndWhxNUpOSnVHV0hFVHFtbnYyRkJscE1W?=
 =?utf-8?B?T1k4MmI1aWFwQStXejUvWWZmSi9lSU54enh0L3VWc3hPdkhMSlBqc0RFN3JG?=
 =?utf-8?B?K1J4NWRua3RrZ0pDYmJlZ3JMMHZIVEFIdGVDY0t0QlFVcEx1RGt0QTI5UjRU?=
 =?utf-8?B?eUFOQWNpYityVDVHcFdmVFZVMkJqWC91VSs0SWRTSy9ncnpnZkpoTHFtdXp0?=
 =?utf-8?B?Z1NVcVBZTmN2cGRwMkhpN3JXQURNTmVKRy9DUFRLU0JGRWZlKzA2enVKWWRY?=
 =?utf-8?B?WlFISnNzdnVnemx6UFVBcUVaUjk1cG5rbk1sMUtDY2FkcDUyUkdHYzFLd2ZX?=
 =?utf-8?B?eDVYTnRESmQxRGw2MER2OTh3WHB1SEYyUlh4Q0paZVhsMzZYS3gvRTdnazJZ?=
 =?utf-8?B?SFI3UWhYT3lvbDVqR1VIc2VVWXNtUFZQOG8remJxUHRuVXdHRmdETzd2QWZl?=
 =?utf-8?B?TjFXRW9Qa2M5TUpON1p3VkprUVNnSXB5dGlFTmIxelBpenF6T3pvSVNPMWhR?=
 =?utf-8?B?QittUGJZd1lUUGlHVlp5Z01uNlBmMXl1NjBzRGZPdENZNjFEaTFSb2luN3Vs?=
 =?utf-8?B?TWlDd3EvWGhVZXBlanBBMnhHU1JqWFo3QWp0RnNEUDBEakV6ZDd6d1k3RTVk?=
 =?utf-8?B?bkxMZ25xS21aS0VvQU5PNFZaVmZvSVRVMUtGczZHQmFPUkZ6eWRtalRoUWVQ?=
 =?utf-8?B?SERVc2Zsc1NJZzJMbVZwanV4TEZoNmw0aGVEeGx4bFhMVlpQZDNKaGczaUZi?=
 =?utf-8?B?YTIwemIyZmtqVyt2aUx4RWUyRHp2WWRPbjBkSmpxcXJTbFh2L2NhdzQ3K21L?=
 =?utf-8?B?UDFGbHRjWDIxaDJYY2Y5ZnN2bmxsSEJkbnNpbTJtREtGcGtlOUZublB3dGtQ?=
 =?utf-8?B?UkwyYUZiOVFaTXV6Rjc1cVFRaVU4aWM0VWs1M0lVTFNUNVNQT1hpL0tGNkx5?=
 =?utf-8?B?WVJ6SjBXRDRIR1lYTW1VSWJIWFJsM2lWa1F1QUhDMnBFZmM0ZlNYN2taUVU0?=
 =?utf-8?B?YnpCZ1ozK0ZpSjdDQXN2QWt1QktTQmVNUzNQTEorSWR0Z21uOXFvMGVaMWxU?=
 =?utf-8?B?dis2dUVlMlFYZ1hqdWJtUm9mK0tCTnRBVjhQS1EyQWpwZ0xkS0QycTJpcy93?=
 =?utf-8?B?RnRnM21sL2dXM3BVazhyZk9TUHA2cTZlcUQ1MUZnbVRWMlk1WkdiUDBkc05P?=
 =?utf-8?B?TUJncUlpY05YQi9Fdm5LdmZJcmxuNzhlQ1phSHNhaUJJV1U5Vmg3M2NNTGMr?=
 =?utf-8?B?b1UrRGp3ZVFYeVRwQkQ4S2NvenB0eDcrSkI1K1ljUXpUbU0xUUpPemJ6NmdE?=
 =?utf-8?Q?kYnsHGsWun4=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9331
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E2.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ad9d9a8d-0e57-4dd2-bb83-08dda739e55e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|14060799003|7416014|376014|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WWcrQVVQWDQ3NTI3NFpNTFhpa2trZExLYkxHUU1XVTJYbzNXYmhFaDhVUjVR?=
 =?utf-8?B?NWhqQUlDbTBZZS81R2pNaWE2ZjdiTkdRam41Z1QwV0pIWjk1eGVWbll4SzFM?=
 =?utf-8?B?MTZ0T0ZPSFhlSFJGeXB0YWREcFlYQzVVMWNlWUtWUEFycjNpUXluNWN5Y0N1?=
 =?utf-8?B?cjhrZmVYZ2NIVTRvSENpcm9nZzF1WUtybFg4M2ZoS09QVUgydERYM1hXc1Fa?=
 =?utf-8?B?ajNhak8xRUVmU3RZdHNlaGo4bmVJTGY4ckhreUxJOXRudkYvWjRYMXpMWXBR?=
 =?utf-8?B?czk2RjFLY20zK3FqbU9TemdBVGMyMVdsdWwrMEhBUGhXbzRWZ2QzMWo5eDhX?=
 =?utf-8?B?VnA4WnhrbDZVd2ZFcnBsUHVOZmZtSkdGeUhlaVlQYXdQSjcvZ0ZEVEhMVDRh?=
 =?utf-8?B?TnVFU3R6SlZuK2NzdVV0b0hRcDVVNGZpdDc4ejA0QkZVR2xJa1NKS2FkMmw0?=
 =?utf-8?B?R0FQM1lub3U5ZnlMbmtHMURPMWJidHliVVdzcXVYK0pzalp1NWlnL04wNlhy?=
 =?utf-8?B?ZXlsZmIwc2FmZFRJa1pGL3ZyNU4xZ0MxcWlMZjh2QUNMb3lQVVJkSU1oT01C?=
 =?utf-8?B?YlcwcEdvY1ZJVXVySFBCYkV3OHpadGpUK05HZFU5UDV2SUhTSXpEQ2tEQU5Q?=
 =?utf-8?B?TlJEZ0ltcFNVQ2pWWWhJbE1ic1d4emJ6SXRzSWZVTFUzbXZEOUNFTGRkQXYr?=
 =?utf-8?B?bTd6K1JMM3FkWnJVWkpHc2JxcjJFcmpMeC9pNlZ5bTUweXlhNi9LZVhDUmdO?=
 =?utf-8?B?M0dVQzBVVXZLZDFJWFhGQmlzUkhlT1huaTByM25MdnNkUkl4aVhiSU5hZ2tx?=
 =?utf-8?B?VEpVZjA3bkduNGlEdDI5S1pSa3lIYmtxUjVFZkpWbEJVWGtwaUZwZE5USzVQ?=
 =?utf-8?B?VGZhTytiRllLelFVM2JHbE93V1hZWTZpb0ZHa3V4VHhqZU9teUV6NzBEb1ls?=
 =?utf-8?B?SlhmM1dveXZsT00rZVIwTVk2cDIwM1R1NTlsOVZ3NXZUQ1NnVldPUVQ5bmtH?=
 =?utf-8?B?enV4N3doRW5YYXdlZ2VSb2sxWVNqMGlkWlRuUWFSS0tZNWg3dEswYXhIYjR3?=
 =?utf-8?B?ZmZsc3Z6SWx3cEh0SDZSbkJMMEE4WktHbnQxeDN4MnM4SGFwdDQ3V0I4bE0v?=
 =?utf-8?B?MEI5Ty94endlZ2E4VlN4WVVWcUE3SVhXMisyZWlBU0ZGQXordzhQWTVzVFNo?=
 =?utf-8?B?bGlmZkRrTWx4UzJPM2ViQ2p1ekl1NWRnYW1GZStCOXN5MVRBS294M09PaGZM?=
 =?utf-8?B?OU9TbGF6QWo2NjlaZEorV3djaUZpUzlaYThCVnVaaWNCN0I4NWNEeFB6Nnk2?=
 =?utf-8?B?SE5yUzU0SEdEc0h5aEIzcmdKc2hwRWtEMDhFZ3lmZThodEZ4SWNpTmlPb3Vv?=
 =?utf-8?B?NHdSaUNXZ1lYYzk0M2d5Rmg2QUFCdjl6V3ptRW5ES3hBV21XQ2I4MFdnTVZG?=
 =?utf-8?B?NlhPWXpnV1hkeS80QUNMeTYzaGdxSlFkWWpmOXV3djUwbEJrK1R0SXlTUXUv?=
 =?utf-8?B?RkU4UEhZaVJHVmV5OVFEZGVDYjk0Z2FZRmpFeng5a1RwM01USzZUU1NuS2lW?=
 =?utf-8?B?R0VpbWxIWEpqV3RLSTg1L3hhajdaUm14NmNJL0lzc2E5aTJ3NUE5NVRiT1Mx?=
 =?utf-8?B?LzZZSGExN3BIeWdpYnlEL0RPS1hFd0dtcWlvWmV5dStsRS8rZjBWZElKbFhD?=
 =?utf-8?B?UkxNUlVHTFcyUmtlbnFvV3JyOVNSbUdXTzJuV3VnbG5Jb2s5SC8ybVVWMlJi?=
 =?utf-8?B?QXdNK3V2eVlyMnlEY0QyZ0dkZG9XdFR5NkJLWFFrRkJSblRJRUl6QUQrTnhh?=
 =?utf-8?B?VHpwL2FOOVRjb2hmWHJmd0dwVU1nSFN5KzFCa1FKS2hTNEYrK2tLdVdkeFY5?=
 =?utf-8?B?R3ZlN1RESkUveE83MllXVkR0eFZDRnprYzFkYUZnMy9FTCtqQ3A1V1JYWXlH?=
 =?utf-8?B?Vk5pWGJOYVVTOGpTVGt4RUUyQ05qS2c4b0xnNk1TamEyNzJFNlIreHZQWUVp?=
 =?utf-8?B?ZlpPR0ZPYWduc1psakxEZWhGVVJEMjFrMXZMWWRyVnJhSEpUV0dOeWd4aFJF?=
 =?utf-8?Q?acdzy5?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(14060799003)(7416014)(376014)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 09:42:38.6029
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc3a30d0-482a-4dea-d011-08dda739f8e1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7771


On 06/06/25 3:19 pm, Lorenzo Stoakes wrote:
> On Fri, May 30, 2025 at 02:34:06PM +0530, Dev Jain wrote:
>> Move away from apply_to_page_range(), which does not honour leaf mappings,
>> to walk_page_range_novma(). The callbacks emit a warning and return EINVAL
>> if a partial range is detected.
> Hm a follow up question here - why not just improve apply_to_page_range() to
> honour leaf mappings?
>
> What does honouring leaf mappings actually mean? You mean handling huge pages?
>
> Would it be all that difficult to implement?
>
> It seems like you're pushing a bunch of the 'applying' logic over from there to
> a walker that isn't maybe best suited to it and having to introduce an iffy new
> form of locking...
>
> Can we go vice-versa? :)
>
> Also obviously walk_page_range_novma() doesn't exist any more :P
> walk_kernel_page_table_range() is the preferred solution.

I cannot see this function in mm-unstable. Also, mm-unstable is broken - I get
some RCU message in dmesg, and after some 20-30 second delay the kernel boots.
So on which branch do I base my work on...

>
