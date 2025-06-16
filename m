Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011028.outbound.protection.outlook.com [52.101.65.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638122D541F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.28
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750073108; cv=fail; b=LP3mRR2Bs4rjlDW970DxC7QmYy8gU7BqGzQZIubffxit1g90ywEhOBV5MkCLh/9+a0E/1YMsf+OsxQ4cEKroYW9pETkGN6y0VTDHW+KSVj3SzmyP4oAm5fs8YS9+UFdDz6bKvv0mIqsbatC6KVE5+ZKU0jyp+r6pCcvHg2yoMa4=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750073108; c=relaxed/simple;
	bh=yDomShLx3ajLn8cbwqZQ9a2ZgNva6iJ9LaQ3hAwv8bE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HKkQW2bgwV/jKrPwX9U386AdVMKhRTz1RLJZ+P0mq1ZF0fQKHlTJZrw+9oERV23fQZGSosGSYhnBjB26ZMPbCSZH4Gup/DyddsvNgAp7Itu1flOvk4sut6+n74fJAOXlQbdvp5cxG16rk1NjuvqYhQpg4VvzApep1Nfzp3qEN9U=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Ft6pjua2; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Ft6pjua2; arc=fail smtp.client-ip=52.101.65.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ft6pjua2";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ft6pjua2"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=UxGJbV4hCs0HvjK589PyL7XeXXnPBCTtg64rxtrfn57Tygaj3fI0mUcRmN74DhcnKl9m4yJbbEBmStN+4K1K3HHAGEvscbeB5kqHqmRw7RW4Z1XNv50a4UgIA0JyFVOnMswUKovLHzkthnB51ATCwkYmgQeGoRSJjoYx/30c7IH7djwRD/S+838ESUNZM7Ygwh2kXlXfnA3QCcE53Cb7AqXd122lrJwFOvcEci//2dEMItSryxp9T8D7uvOwmKiSvTZN/Utypout3dr8fJYo9cN3V0O55gEaXFxnI/7KI57YBAKpYaH+oteJhS3z9lCYzv1lew6QeHhE8dWi0AqzUw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hfkc4dImIweFlNsFHmRbM/J+1986+MNbBhwukZ0MUp0=;
 b=wjNSb9c8MlDxUDo7W7eXNj95yl6dY/Kf6ZZRKUKH46mek5RBlupSNWoDWBoXoX7/s2fLih9nnOelS8TQbUHpi6V3w7Aqw03yS3rJ2veUpqh6ezQ6mEp6f4AyyoUownDo91D1piWwXVYzqXPZsJa8kUNHXyHj8JkdJR7CB+mFaH3gFw9UHwcXK7swozbdOJgtqU+iu8fRQ2A8a8b3VU9DAwxciKvMJmydguB6EZKQ+ZH32ZHdv7T1JunWB0fAO11nWP+K6StQ1NkNmug4disyPvkQRL24hJDy7K8FBaQ8cGPAprJdDNBJSYs7yn38wa5JousQ2we8g709/8tSKofyGA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hfkc4dImIweFlNsFHmRbM/J+1986+MNbBhwukZ0MUp0=;
 b=Ft6pjua26kW5oei2pah3gfKsH+euIhYF93ydot/BxBWDkE8cRY8zbvgRYr+VPXkVQc9Z/P5Mzj546wTQahSTcu8cewjziOjN+niZtlQW2PNT1YiFctdC3rn5BthrwGRwgFu/sFq1oJ8r6YCZcMI/JOY3YZKNQbYIiSWBSW3X/3g=
Received: from DU2PR04CA0278.eurprd04.prod.outlook.com (2603:10a6:10:28c::13)
 by AS8PR08MB9866.eurprd08.prod.outlook.com (2603:10a6:20b:5aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 11:24:53 +0000
Received: from DU2PEPF00028D0B.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::9) by DU2PR04CA0278.outlook.office365.com
 (2603:10a6:10:28c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Mon,
 16 Jun 2025 11:24:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0B.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 16 Jun 2025 11:24:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TY9ljegHilSWysg8TmSLEOUzI6TvZuUQMLois53xXqvHg6bcQ4BITop7rJ9lh3hfKB4CV4zt2G5lO7xanWfBXQ4WoTIdF/+IFzE4DBBwrAyp4+zSykJR6GQusXvxptc/0HURitjGN89Khb+mCmT8wUW6noGMQj9gGhF4GOF/kqZAXWVYa50Pd2DXGOrbB4aF7aMgrCRtzXW+bWNOZthEWDRloJDWy6ZzLF+SoxOe9r8iGRNuSsBr2WCCTiG8h6hN6bT0QdrUVHSU6HXpHF7d7kyS4rhz7cfZIArbq5uqhjKFfGkthdiSyHLlVo4tNvx63fxVZ3DMyu3zJ13m+8fMpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hfkc4dImIweFlNsFHmRbM/J+1986+MNbBhwukZ0MUp0=;
 b=GIU2kxA2JF7KHG9UaDCGT59BbBE1glQrx7Pfy24SPNkULrCSoJMkF+kPtZILLAfZc9suvtIvQQ0LBbJNh053y+LA54AGXk7DfNh9bQUeaji14ye96RaKNG4fyfBukd6yeRm1XB+g9vJDjvwPBfbzcieKldR7n9ItIifT7NkAU39WrpHLzKj8Glesq22K6uynmr5886K9G0Yu7V9iV96odvPpnNvfWofPp/nxjLgDVdx675esY/V0EHzAYgDtgZR904ZvQFVzFP7Gvp8+S5rIY3Tk4POhEZtb+1LxBAb/QjBeRGyG+tLQJubjDfHhapM+/ix5QwUbpaYXTqBFZs3DFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hfkc4dImIweFlNsFHmRbM/J+1986+MNbBhwukZ0MUp0=;
 b=Ft6pjua26kW5oei2pah3gfKsH+euIhYF93ydot/BxBWDkE8cRY8zbvgRYr+VPXkVQc9Z/P5Mzj546wTQahSTcu8cewjziOjN+niZtlQW2PNT1YiFctdC3rn5BthrwGRwgFu/sFq1oJ8r6YCZcMI/JOY3YZKNQbYIiSWBSW3X/3g=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DU4PR08MB11006.eurprd08.prod.outlook.com (2603:10a6:10:576::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 11:24:19 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 11:24:18 +0000
Message-ID: <1c6a7220-5bf8-44f3-8602-ece207aa1a83@arm.com>
Date: Mon, 16 Jun 2025 16:54:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] mm: Optimize mprotect() by PTE batching
To: Ryan Roberts <ryan.roberts@arm.com>, akpm@linux-foundation.org
Cc: david@redhat.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250519074824.42909-1-dev.jain@arm.com>
 <20250519074824.42909-4-dev.jain@arm.com>
 <b3064b82-dcea-4b88-940b-9419d869a39a@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <b3064b82-dcea-4b88-940b-9419d869a39a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0084.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::18) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DU4PR08MB11006:EE_|DU2PEPF00028D0B:EE_|AS8PR08MB9866:EE_
X-MS-Office365-Filtering-Correlation-Id: c03afca0-49e2-4913-d21d-08ddacc869be
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?b1hCU01IMFNUdGU1bFJGOUk4U0ZPOVREWkU2anNBcGl5TUFIUzFNTEFDZ1Bm?=
 =?utf-8?B?LzFHdHpqeEN0Q1ppNUlrYjQ3TS9YdkdFT01lVHBXVXUvTWJ6OWt4dGwwOTgv?=
 =?utf-8?B?L2FWUFlkRkw1Mi9EN1h1N0tGUnU0WXBGQnUvWnlKM1ltMFV1ZWs3dkZ2azJW?=
 =?utf-8?B?THNMUUJBRXo3M3FmbkhFUmhTUS9Mc0ZwajRBbStheHVpNG1uYk84dzFsMGtF?=
 =?utf-8?B?UG5HVEl3Z1dWa29QU3FDbmpCdnY5eE1seC83RTk5Z1N3Q1h0Yk43dHViZGVM?=
 =?utf-8?B?SVI1SVlPWU8veHhSWC8wZU9pbzYwcmFIRzRqRzVCUXMxdWlzcmV2RTRqcFIz?=
 =?utf-8?B?NFcrUXRnbFBUd0grZkk4UThlRG8wSEhYeVNaSnhaK2tmVit6K2tPNTJLVG9q?=
 =?utf-8?B?RmhQQUphTUkyTGROdzJ5TlhzUERMNFpXN2dIVmkzK2FDZmJZLzA2cUFGdG1I?=
 =?utf-8?B?aEpCSWZ0em96dFJMcmhLUGJPL0d4VEJXVXVRNkwrb1lpcnBHMGRwbk5uS2FO?=
 =?utf-8?B?R0UzdEFhY29GMjRldzZoOUJmL1N6NndBVGtVT3ZmSWdKMklVOHJEdUFkK2pH?=
 =?utf-8?B?bkpkU3VXaUEzMDBZaXY5MC9tVnp6VGJXK0xzdGZxVHMxcFNhQlVib0hSaFFL?=
 =?utf-8?B?RjYyU0hqN1VZV2NiSUVCMzNGemIrUkxheHNiQ0o2MWlhQmNCZDhCUmJLcTkx?=
 =?utf-8?B?VWNIRVFGZ0UvN2J3dHdqamw2alEzNkViUEZFR1k2OVFQTHlHZE96NlVwdjda?=
 =?utf-8?B?UUlKTmExTjlyWUMzenZncy9hOWR3MlpqQWNxQ0lHcTlvQUdZVEdWQ2RMNFgz?=
 =?utf-8?B?VVltK28xaTh4WTd2V1JsbFYvSG5YYlhxaHNjOWFJVnF1WHZNMVVLUUIxS1ly?=
 =?utf-8?B?WnJheStwOEFrSytsNFlxQ2NqVXlkVnZpTTZYeGtQSncwdXZSVHdaUWozMm1m?=
 =?utf-8?B?QUtpVlNzVDJUaE9MU2YzSCsyZ2xaVEVyWlc4STBPeUhFZDNPZ0xIcFhWcUdX?=
 =?utf-8?B?TjV0TDRWclZQQjl0Mmt0UzE0SSt0VHZPTVdKZzduNjBzYitMMkVCOXhrVnBD?=
 =?utf-8?B?Z1hFUk1FVmdhMDJZQmhwUDBSQTJ4TTlyeUdCMmZHVnRFazYrK0hiN21qY0VJ?=
 =?utf-8?B?bVdkZUNNZjdxbHRvSHZJendTVXg1QUYrUk1sRU1pWHBtQnp3MVh2bTFPVkJy?=
 =?utf-8?B?NFFLU0srbERKVVBhMkhlWTJsbTlvZndBb3ZyaGxUdWNYNWxNS2d4MDlXU1c2?=
 =?utf-8?B?cHF2NlVQUjlMblFaWWlWejd0dXZEV2JyQkRWdHlsZ05SelJUb3V3c1lld2NB?=
 =?utf-8?B?K1lWaTlyTXJpOFR5K1hORFBFanBPejlUNEtaQWwwVnZ3T2ZtY0JFL2VtQTBD?=
 =?utf-8?B?Wmw4NHJVeTBSbUlEM3cwZVAyenl0OTliN0YwVEVlcW10OUVNK3BRV0xubWJp?=
 =?utf-8?B?ZW5XOURHdEdiZUVZSHc5bS9aeXpLbExuZWFCWVMzalJDaXpFWnJXZ0hmTkwy?=
 =?utf-8?B?RXlQbUtqQVFvYkVYR2ZPa0ZpUzhINkdicWdJVmFGTkJhaktxQ2JrRmhINW5N?=
 =?utf-8?B?N2NTVXczMWsyMXcwbGFRbXBGUXgvdC9yamRKNk9FZW5QaExhd29RSlBKejFh?=
 =?utf-8?B?aTlHNG5MdHQ3ZEdLUzVSdUJNbjhFSVI1b0dleFcvdXZIemVESWxkbG4rVkFu?=
 =?utf-8?B?UUcrck9aSm9DNkJOTC90YXhNMnhTenlFaWkrdWw5TFd4Z0s0bHRWZldaYzBr?=
 =?utf-8?B?ak5rL2tTU0VEYUFCOTFlcUFOWlRCZm9DZnJvQWhSNmVyMzZyQmYwcTBYWjZ1?=
 =?utf-8?B?RGVzUCtWZDZxRjk5WG1SbEdwZCtPcjcwK2lFZWQvb3orOHcxdTUyZVozYVNx?=
 =?utf-8?B?aWRjK1VXRDVIR3lIcXhoYkV1YjRCaHlEQ2F6eWJuMDVjWlhUQ09CZ1BueGxE?=
 =?utf-8?Q?2JiJYr49Zqg=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11006
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D0B.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2fe02093-2062-4886-61e9-08ddacc85572
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|7416014|82310400026|35042699022|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VVJ6TGpnUTk0R1JjeDRFUE0yOW05TzlnYm5scnBFb3VXSzFCcE5oN1A5cGQx?=
 =?utf-8?B?UFNWdlZlTCtvN0Z1N2JJWVpLbm1aTkFNS0ViOGFMdk9CMS9mNldzOVZMc1R3?=
 =?utf-8?B?dDNrWVEyQSswQkFLeGJ5RlZNbW96L3ZRVnhkNUZJNjhKQXJ1YXVIYjBWOGcv?=
 =?utf-8?B?TUVVZWFMRk5qNW9HdVZVelZ1YzQxQWVNcC9sTjJHRWtWc25oMk5id21lUU5U?=
 =?utf-8?B?NGxpenRPVkdSSitHQVFYNnJjR3lVNlZrQ1RBQmh2OFQxcVJSVlZXWXRIMzNi?=
 =?utf-8?B?enlIRXZaRjN1blhXbFhoOE1MVHpBWVFDZ2VPMVhrVWF0bjJrYmdUSlRVTDJF?=
 =?utf-8?B?WTUxZk5SQ0swWTM3QldrVlVqVWhuMlprbjBkMHlmOWwrdS9OMTZHLzc1K1Jk?=
 =?utf-8?B?N3lHSDZOK2x6UW1ZMEJkTjA4QXlIUmFMTllHcXNmQ1ZaVTRrMFVGaU95WVRo?=
 =?utf-8?B?WlRPcWZvT25IK0N3S2drYm84ODdySHoxNVdrTmFPK3BPY3c4aGwvUkd2dFZZ?=
 =?utf-8?B?Smd4MzlYTzMrRDIweEdQdE5ORk4yN25JK09RdlRJTTdSMlZ0NnQ1ZmtZVEtw?=
 =?utf-8?B?VVgrTCtDNURCLzBhOUZlWEh3QW5kYUpRS3Z3clU4QlJ3b3JZVm5XYnUwVk5s?=
 =?utf-8?B?U1FhVjRhRUs0NDJnS0liKzhBaTdBdVAxU2JQTXl1Qk5rVEJ4VzBwelVPdmxG?=
 =?utf-8?B?OWVKZzU2SXNNRUkxWHpsWnJuVTRmMXNWellkUUJ4cFhWWk81aXVKYVNXdnhv?=
 =?utf-8?B?R1FDWkhZSERHQXdIZGYzUFREOFNyVDREbnIrbzdlMU9oSlJPTmFZbWcrK0Iw?=
 =?utf-8?B?VEsyMFkydTJQQ01PdHZzN01VWTV0SDEwNFhQZFlwNUhaQkNsd2ovdEE5ckNC?=
 =?utf-8?B?d3I2SXI5c2JJS3ZCSzd2cE5QeG91MDIrRmdnempBdGYzMnlrK2x0VFdOblNF?=
 =?utf-8?B?SXVlUkljVzJiUkYzd1huN2pkUTlkOE55NW1pbXNhWmpkdmdXUHQzaEpsUWE1?=
 =?utf-8?B?MDRPdDRFMURuQzV1NU12ZUc5aDhXNnlFUUgzVWovZzdlVUN5cW41YmllUFVu?=
 =?utf-8?B?bG9UTjJMMk9hN0NBSmJVNitrOGE4RHpzeHRTZTBSUlZHWGRUWkZvNXdwRzRh?=
 =?utf-8?B?S1Q3MXJtYVYwZk9CdFJaWXdEdGJXZC90L05qM09URzk1QjJlaHN5bHVpQXdv?=
 =?utf-8?B?eVdqUGZxN01abm4yQlVQS01Ed0t2dVhBdE9GK1lBbzdEUmk4c0ZjU2xLcnpv?=
 =?utf-8?B?VDYvNm5TUjBRVitCdDZnbkRRc3RMNktUaFRUU1JJUFRBMUs0VFRjaE1IUlB3?=
 =?utf-8?B?RUdCRHd4S0ZxeUt1MktBazA2eDhtR3Y5YkpGSFdFY2lIV1o4ZzBQS1V6aWo1?=
 =?utf-8?B?YURYV25XQjFpN3c1L3Iza1podTlyem5mbDVJR0FldDVNMDFUdm51UUxZQWJK?=
 =?utf-8?B?RlFKeVZaNmU5YXZHNEdIU2pzeUMzNmVNL3dtYW9NZndySk1iZ1BqemM1WWpx?=
 =?utf-8?B?dmhXc0VEcjl4RkYwUHJWN3UvaVpWSTh6SWsydUpDaXNSQzdmQzZUdzFkTlk3?=
 =?utf-8?B?cDErUHlEeHhsZnNyVFhrZ1R0MDZXb1JNcU00QXdIVHVSSmZjZHZUZzdxOFkw?=
 =?utf-8?B?eGNiL3dJeEFJa0pEd0thdDNmM2lwR01rc1RLVnE4RGVOSzJuVE5JMXQvZ0xm?=
 =?utf-8?B?eXFSanJ1T2JYLzBiUGRhZ1FSK3prRVcxdnJsOUNxMlNBcFNRMlhZZW1sQ2Uv?=
 =?utf-8?B?S3pnZWdxNzBEdHBSWS9FZHZLT0RBQVZvNUY1ODRiL1R4aTdJNGN3dlFrUnY2?=
 =?utf-8?B?RnlrUTZrNmMyeVZwd0loOVozeVNiUkJPQ3FDOHRtNTdBalhKUitGQ1lzWXhF?=
 =?utf-8?B?NUNKZmw3YUVVeWF3TFBUcitBbkxFQU9wOXpKQ0w3VTg1SVJtZEt1NUlLcVlY?=
 =?utf-8?B?RW5DOWhmYUhXb3gwVDFCV3V1OG8rVVZaa0F5TE44WGdLUHpuRU15c1RBVFBk?=
 =?utf-8?B?UnAvVHhiR1h1UU9wY3JmRHpZRXlJbktWRXFpd0xPemducnpkWHFWUEs4bUlS?=
 =?utf-8?Q?7Jq/Do?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(7416014)(82310400026)(35042699022)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 11:24:52.2954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c03afca0-49e2-4913-d21d-08ddacc869be
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0B.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9866


On 21/05/25 6:56 pm, Ryan Roberts wrote:
> On 19/05/2025 08:48, Dev Jain wrote:
>> Use folio_pte_batch to batch process a large folio. Reuse the folio from prot_numa
>> case if possible. Since modify_prot_start_ptes() gathers access/dirty bits,
>> it lets us batch around pte_needs_flush() (for parisc, the definition includes
>> the access bit).
> parisc's pte_needs_flush() is a different (static) function, just coincidentally
> named - it takes different arguments.
>
> But powerpc and x86 both specialize it and they consider the dirty bit. Both
> implementations look to me like they will function correctly but it is a bit
> ugly. They both conclude that if there is no change or if dirty has gone from
> clear to set, then no flush is needed. (flush only needed when dirty goes from
> set to clear). Given after your change, oldpte may have dirty set when it wasn't
> really set for the pte in question that means the function could detect no
> change when really its a clear -> set change; it gives the same answer in both
> cases so it's safe. Perhaps a bit fragile though...
>
>> For all cases other than the PageAnonExclusive case, if the case holds true
>> for one pte in the batch, one can confirm that that case will hold true for
>> other ptes in the batch too; for pte_needs_soft_dirty_wp(), we do not pass
>> FPB_IGNORE_SOFT_DIRTY. modify_prot_start_ptes() collects the dirty and access bits
>> across the batch, therefore batching across pte_dirty(): this is correct since
>> the dirty bit on the PTE really is just an indication that the folio got written
>> to, so even if the PTE is not actually dirty (but one of the PTEs in the batch is),
>> the wp-fault optimization can be made.
>> The crux now is how to batch around the PageAnonExclusive case; we must check
>> the corresponding condition for every single page. Therefore, from the large
>> folio batch, we process sub batches of ptes mapping pages with the same PageAnonExclusive
>> condition, and process that sub batch, then determine and process the next sub batch,
>> and so on. Note that this does not cause any extra overhead; if suppose the size of
>> the folio batch is 512, then the sub batch processing in total will take 512 iterations,
>> which is the same as what we would have done before.
> This commit log could do with some reformatting; blank lines between paragraphs
> and break at whatever the usual git commit log char limit is (72 chars?).
>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   include/linux/mm.h |   7 ++-
>>   mm/mprotect.c      | 126 +++++++++++++++++++++++++++++++++++----------
>>   2 files changed, 104 insertions(+), 29 deletions(-)
>>
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index 43748c8f3454..7d5b96f005dc 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -2542,8 +2542,11 @@ int get_cmdline(struct task_struct *task, char *buffer, int buflen);
>>   #define  MM_CP_UFFD_WP_ALL                 (MM_CP_UFFD_WP | \
>>   					    MM_CP_UFFD_WP_RESOLVE)
>>   
>> -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>> -			     pte_t pte);
>> +bool can_change_ptes_writable(struct vm_area_struct *vma, unsigned long addr,
>> +			     pte_t pte, int max_len, int *len);
>> +#define can_change_pte_writable(vma, addr, pte)	\
>> +	can_change_ptes_writable(vma, addr, pte, 1, NULL)
> nit: add an extra tab for readability:
>
> #define can_change_pte_writable(vma, addr, pte)	\
> 		can_change_ptes_writable(vma, addr, pte, 1, NULL)
>
>> +
>>   extern long change_protection(struct mmu_gather *tlb,
>>   			      struct vm_area_struct *vma, unsigned long start,
>>   			      unsigned long end, unsigned long cp_flags);
>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>> index 124612ce3d24..6cd8cdc168fa 100644
>> --- a/mm/mprotect.c
>> +++ b/mm/mprotect.c
>> @@ -40,25 +40,36 @@
>>   
>>   #include "internal.h"
>>   
>> -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>> -			     pte_t pte)
>> +bool can_change_ptes_writable(struct vm_area_struct *vma, unsigned long addr,
>> +			     pte_t pte, int max_len, int *len)
>>   {
>>   	struct page *page;
>> +	bool temp_ret;
>> +	bool ret;
>> +	int i;
>>   
>> -	if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE)))
>> -		return false;
>> +	if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE))) {
>> +		ret = false;
>> +		goto out;
>> +	}
>>   
>>   	/* Don't touch entries that are not even readable. */
>> -	if (pte_protnone(pte))
>> -		return false;
>> +	if (pte_protnone(pte)) {
>> +		ret = false;
>> +		goto out;
>> +	}
>>   
>>   	/* Do we need write faults for softdirty tracking? */
>> -	if (pte_needs_soft_dirty_wp(vma, pte))
>> -		return false;
>> +	if (pte_needs_soft_dirty_wp(vma, pte)) {
>> +		ret = false;
>> +		goto out;
>> +	}
>>   
>>   	/* Do we need write faults for uffd-wp tracking? */
>> -	if (userfaultfd_pte_wp(vma, pte))
>> -		return false;
>> +	if (userfaultfd_pte_wp(vma, pte)) {
>> +		ret = false;
>> +		goto out;
>> +	}
>>   
>>   	if (!(vma->vm_flags & VM_SHARED)) {
>>   		/*
>> @@ -68,7 +79,19 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>>   		 * any additional checks while holding the PT lock.
>>   		 */
>>   		page = vm_normal_page(vma, addr, pte);
>> -		return page && PageAnon(page) && PageAnonExclusive(page);
>> +		ret = (page && PageAnon(page) && PageAnonExclusive(page));
>> +		if (!len)
>> +			return ret;
>> +
>> +		/* Check how many consecutive pages are AnonExclusive or not */
>> +		for (i = 1; i < max_len; ++i) {
>> +			++page;
>> +			temp_ret = (page && PageAnon(page) && PageAnonExclusive(page));
>> +			if (temp_ret != ret)
>> +				break;
>> +		}
>> +		*len = i;
>> +		return ret;
>>   	}
>>   
>>   	VM_WARN_ON_ONCE(is_zero_pfn(pte_pfn(pte)) && pte_dirty(pte));
>> @@ -80,21 +103,55 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>>   	 * FS was already notified and we can simply mark the PTE writable
>>   	 * just like the write-fault handler would do.
>>   	 */
>> -	return pte_dirty(pte);
>> +	ret = pte_dirty(pte);
>> +
>> +out:
>> +	/* The entire batch is guaranteed to have the same return value */
>> +	if (len)
>> +		*len = max_len;
>> +	return ret;
>>   }
>>   
>>   static int mprotect_batch(struct folio *folio, unsigned long addr, pte_t *ptep,
>> -		pte_t pte, int max_nr_ptes)
>> +		pte_t pte, int max_nr_ptes, bool ignore_soft_dirty)
> We'll almost certainly want more flags here in future. I wonder if it's cleaner
> just to pass "fpb_t extra_flags" here instead of the bool, then OR them in. You
> can pass 0 or FPB_IGNORE_SOFT_DIRTY at your 2 callsites. No strong opinion
> though.
>
>>   {
>> -	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>> +	fpb_t flags = FPB_IGNORE_DIRTY;
>>   
>> -	if (!folio_test_large(folio) || (max_nr_ptes == 1))
>> +	if (ignore_soft_dirty)
>> +		flags |= FPB_IGNORE_SOFT_DIRTY;
>> +
>> +	if (!folio || !folio_test_large(folio) || (max_nr_ptes == 1))
>>   		return 1;
>>   
>>   	return folio_pte_batch(folio, addr, ptep, pte, max_nr_ptes, flags,
>>   			       NULL, NULL, NULL);
>>   }
>>   
>> +/**
>> + * modify_sub_batch - Identifies a sub-batch which has the same return value
>> + * of can_change_pte_writable(), from within a folio batch. max_len is the
>> + * max length of the possible sub-batch. sub_batch_idx is the offset from
>> + * the start of the original folio batch.
>> + */
>> +static int modify_sub_batch(struct vm_area_struct *vma, struct mmu_gather *tlb,
>> +		unsigned long addr, pte_t *ptep, pte_t oldpte, pte_t ptent,
>> +		int max_len, int sub_batch_idx)
>> +{
>> +	unsigned long new_addr = addr + sub_batch_idx * PAGE_SIZE;
>> +	pte_t new_oldpte = pte_advance_pfn(oldpte, sub_batch_idx);
>> +	pte_t new_ptent = pte_advance_pfn(ptent, sub_batch_idx);
>> +	pte_t *new_ptep = ptep + sub_batch_idx;
>> +	int len = 1;
>> +
>> +	if (can_change_ptes_writable(vma, new_addr, new_ptent, max_len, &len))
>> +		new_ptent = pte_mkwrite(new_ptent, vma);
>> +
>> +	modify_prot_commit_ptes(vma, new_addr, new_ptep, new_oldpte, new_ptent, len);
>> +	if (pte_needs_flush(new_oldpte, new_ptent))
>> +		tlb_flush_pte_range(tlb, new_addr, len * PAGE_SIZE);
>> +	return len;
>> +}
>> +
>>   static long change_pte_range(struct mmu_gather *tlb,
>>   		struct vm_area_struct *vma, pmd_t *pmd, unsigned long addr,
>>   		unsigned long end, pgprot_t newprot, unsigned long cp_flags)
>> @@ -106,7 +163,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   	bool prot_numa = cp_flags & MM_CP_PROT_NUMA;
>>   	bool uffd_wp = cp_flags & MM_CP_UFFD_WP;
>>   	bool uffd_wp_resolve = cp_flags & MM_CP_UFFD_WP_RESOLVE;
>> -	int nr_ptes;
>> +	int sub_batch_idx, max_len, len, nr_ptes;
>>   
>>   	tlb_change_page_size(tlb, PAGE_SIZE);
>>   	pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
>> @@ -121,10 +178,12 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   	flush_tlb_batched_pending(vma->vm_mm);
>>   	arch_enter_lazy_mmu_mode();
>>   	do {
>> +		sub_batch_idx = 0;
>>   		nr_ptes = 1;
>>   		oldpte = ptep_get(pte);
>>   		if (pte_present(oldpte)) {
>>   			int max_nr_ptes = (end - addr) >> PAGE_SHIFT;
>> +			struct folio *folio = NULL;
>>   			pte_t ptent;
>>   
>>   			/*
>> @@ -132,7 +191,6 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   			 * pages. See similar comment in change_huge_pmd.
>>   			 */
>>   			if (prot_numa) {
>> -				struct folio *folio;
>>   				int nid;
>>   				bool toptier;
>>   
>> @@ -180,7 +238,8 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   				    toptier) {
>>   skip_batch:
>>   					nr_ptes = mprotect_batch(folio, addr, pte,
>> -								 oldpte, max_nr_ptes);
>> +								 oldpte, max_nr_ptes,
>> +								 true);
>>   					continue;
>>   				}
>>   				if (folio_use_access_time(folio))
>> @@ -188,6 +247,11 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   						jiffies_to_msecs(jiffies));
>>   			}
>>   
>> +			if (!folio)
>> +				folio = vm_normal_folio(vma, addr, oldpte);
>> +
>> +			nr_ptes = mprotect_batch(folio, addr, pte, oldpte,
>> +						 max_nr_ptes, false);
>>   			oldpte = modify_prot_start_ptes(vma, addr, pte, nr_ptes);
>>   			ptent = pte_modify(oldpte, newprot);
>>   
>> @@ -209,15 +273,23 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   			 * example, if a PTE is already dirty and no other
>>   			 * COW or special handling is required.
>>   			 */
>> -			if ((cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
>> -			    !pte_write(ptent) &&
> Don't you need to keep the !pte_write(ptent) condition here? No need to sub-
> batch if write is already set.
>
>> -			    can_change_pte_writable(vma, addr, ptent))
>> -				ptent = pte_mkwrite(ptent, vma);
>> -
>> -			modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr_ptes);
>> -			if (pte_needs_flush(oldpte, ptent))
>> -				tlb_flush_pte_range(tlb, addr, PAGE_SIZE);
>> -			pages++;
>> +			if (cp_flags & MM_CP_TRY_CHANGE_WRITABLE) {
>> +				max_len = nr_ptes;
>> +				while (sub_batch_idx < nr_ptes) {
>> +
>> +					/* Get length of sub batch */
>> +					len = modify_sub_batch(vma, tlb, addr, pte,
>> +							       oldpte, ptent, max_len,
>> +							       sub_batch_idx);
>> +					sub_batch_idx += len;
>> +					max_len -= len;
>> +				}
>> +			} else {
>> +				modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr_ptes);
>> +				if (pte_needs_flush(oldpte, ptent))
>> +					tlb_flush_pte_range(tlb, addr, nr_ptes * PAGE_SIZE);
>> +			}
> This if/else block and modify_sub_block() is all pretty ugly. I wonder if
> something like this would be neater:
>
> 			use_sub_batch = (cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
> 					!pte_write(ptent) &&
> 					LIKE_can_change_pte_writable(vma, addr, ptent, folio);
>
> 			while (nr_ptes) {
> 				if (use_sub_batch)
> 					sub_nr_ptes = sub_batch(...);
> 				else
> 					sub_nr_ptes = nr_ptes;
>
> 				modify_prot_commit_ptes(vma, addr, pte, oldpte,
> 							ptent, sub_nr_ptes);
> 				if (pte_needs_flush(oldpte, ptent))
> 					tlb_flush_pte_range(tlb, addr,
> 						sub_nr_ptes * PAGE_SIZE);
>
> 				addr += sub_nr_ptes * PAGE_SIZE;
> 				pte += sub_nr_ptes;
> 				oldpte = pte_advance_pfn(oldpte, sub_nr_ptes);
> 				ptent = pte_advance_pfn(ptent, sub_nr_ptes);
> 				nr_ptes -= sub_nr_ptes;
> 				pages += sub_nr_ptes;
> 			}
>
> Where:
>
>   - LIKE_can_change_pte_writable() is similar to can_change_pte_writable() but
>     does everything except checking the per-page exclusive flag. Note that we
>     already have the folio so can pass that rather than calling vm_normal_page()
>     again.
>
>   - sub_batch() can be passed the folio and the index of the first page within
>     the folio and the max number of pages to check (nr_ptes). Then returns the
>     number of pages where exclusive flag is the same.
>
> Obviously they both need better names...

I cannot figure a nice way of implementing your suggestion. We need to get the length
of the sub batch and the true/false return value from can_change_ptes_writable, and
we also need to call pte_mkwrite in case the ret is true. Doing that in your suggested
way seems harder to me, along with the fact that it is causing indentation problem by
one extra tab compared to my current implementation.

I don't know, my method looks pretty neat to me : )

>
> Thanks,
> Ryan
>
>
>> +			pages += nr_ptes;
>>   		} else if (is_swap_pte(oldpte)) {
>>   			swp_entry_t entry = pte_to_swp_entry(oldpte);
>>   			pte_t newpte;
