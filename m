Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102B92367CB;
	Fri, 20 Jun 2025 20:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750452434; cv=fail; b=obRIYWNXAymiasFc/IEtUtbV1JmTvK/1/U0bhJIon9LAIprv7LZWUUIG+lc/MmKukmpWT37X8fCixWyOjF9QaeWyCa/iiC1x0AzRM8caiEa6CSuawqQdGLmfiev5bWYVDulNRbnWnqbASAJ/CXfwfAUqN5KYMLxAQ47ROzK+HFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750452434; c=relaxed/simple;
	bh=XjGg7B1yboncMlEcP0njQzUSpVgyRt+Upbatv137bgE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uGFaKfmRW9La5EgCEuuNtl/sgP2z6Rs8ytZiUYAPvN/zeDLRhN4v8nimkXDNFnMh5lQdgxb1TQ/o14GxYwK00qLNEeTgvnN17VFm3tFcdsS8GbrjgIbACgMRk4c0P0e/5MCZspe/fB3xzTRoWN6phyWaljQypBcdI9Iinso8OdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OxImdVGK; arc=fail smtp.client-ip=40.107.223.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OxImdVGK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IBmBC+wMFl1ZXnMJwvkZsqS2R453ByL0G/2w59lWexa1a8mSgy+X8pzwoobBoKq5qAiE1GbtxLEdM0/1LaZP4lzDKva3cg9log5RXsS7zNJdt1NaPs343QIFHtZxwWkePpVQJZedw0yRGC7+sY2Dh5AflZobqGQjj9MBsfxxJGMYZ4dKmnZ6LeYiil64ovJtBWqPCRvbiGnnMGdehPzH3XA0+aacxPLOPWNUydx2cp7axxakJZE0x6bV/rFECy4PMq9pe4VlR9sqe2XfPxzq/vgoYp4liYBrDFsCXiqrk8lhEoBE5UPMpC3jjqbCn5Qd7PXrW6s7KqqskGp6oOhHCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JFTqBDbbUeyxvB9GlKsZ0ss0zf0L5S9XFWscfRHnRLc=;
 b=qHGQSCPRqFh24gFJBJwMuwI15I24QlXzBIWmCjxKFtpZgeVCe/s0Zp9uOhytHT+17LL0fZTte/YNU0UE03vX7XT4syKBoUytbpSaYjc0EuyNtSE9L7WHDyUHIEiznhc5J8dqM90ntL2OGN60T0fwEP+mpcr1BsCBLr1/hoiHWuEAOlX7Hxi/RDt4hldv1OxVjnsMhPTdDJX4AXQAcbhYf6YodAutIKzxGYKwnlfz19l6NVtdoJ/V7jsrksjihEAPnic7bnfnHQKGm4ZIuATPr8rWUu0AAAp8MawfYUyW4r3w639E68nrR1ut8I7cpOR8cHMS+jM8Wv08hH25Fbh/Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFTqBDbbUeyxvB9GlKsZ0ss0zf0L5S9XFWscfRHnRLc=;
 b=OxImdVGKlaUS8Vd6M8xLvDIvrGr3lXJ2gH0qUZump9evehIg/tgleAFMjrZcINjivO3UMnHDluEn0O/HGm+cXn9B6Lamcem2oUeLcxZikWABM+wySNTU7dp8N/hU4zFystxy31AL5IfAGP9Dhta2sFcaDUNP7ss1jq9QPmU/xLxHQCRK0qVslagFEGtge7+KFNdKn2Sd729x4iIbsSBKHJPKTkOd9RYmSHe334/njgRnpyLxxryyZVRoZM695I8w91ph5Hipk4zNcnG+7JmPpNmTgDZgK1wqnxLbtBoMQR6Px6fRu/1GPF4FMhvuzh0U0M3DW0/5XxyGlYtbDnqvIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB6256.namprd12.prod.outlook.com (2603:10b6:8:a3::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.24; Fri, 20 Jun 2025 20:47:10 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8835.027; Fri, 20 Jun 2025
 20:47:10 +0000
Message-ID: <ed2aa3cf-ca2e-4abb-9c7a-7134572e4997@nvidia.com>
Date: Fri, 20 Jun 2025 16:47:08 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] rust: kernel: add support for bits/genmask macros
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Alexandre Courbot
 <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20250610-topic-panthor-rs-genmask-v6-1-50fa1a981bc1@collabora.com>
 <DAMAPVAI3V8X.N8SAQD6KOO1Q@nvidia.com> <aE2P3OBo1Ufjctxy@Mac.home>
 <aE2btHiDP5LRmBTL@Mac.home> <aE2d1RdR1-pxurzj@Mac.home>
 <20250618205824.GA1682301@joelnvbox>
 <D553B512-2338-4602-8EEE-B87B2BFC2FC8@collabora.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <D553B512-2338-4602-8EEE-B87B2BFC2FC8@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL6PEPF00013DFC.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:21) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB6256:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ab7019d-d01d-401f-c24d-08ddb03ba0bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WU9FdGdVcStYeDBza3ZxUTFSbjY0Znlwd29FZmhxekY4S1Bmcy9zNWl4RmZt?=
 =?utf-8?B?WlpkUjVIdnhKZ1F2RkY5ZnBZZnQ3R0R3MzBSVHpkdGxydEJ6TnFHZkhWM1Jx?=
 =?utf-8?B?OWJ3aytETS9vN1JrWDZ1dTVVeFh2d243TktLTEVBOVhTQ3pDV3hocGd6V1dI?=
 =?utf-8?B?d3RJQjREbTllbnFFU1BUbmRWUU1BZG1YckpBSjF2YWpwTTlXSHdqYitVVStP?=
 =?utf-8?B?UUQ4VS9BL0dvNlllMm1DOWJaTUV6bkZJTTdhcFVFMmE1YjNPN3A2KzE0MGxs?=
 =?utf-8?B?USs5Ym5SeXZ3WHFQTEdtbnNsRG90cTNsd1U1TXhEUDJHZWZhRlBHSmNQYVdR?=
 =?utf-8?B?Sm1kMFU3Y0JiZVYvREJWeTFkNWZuaFV4MmptdkVTNUZmKzRjai9OV2ZHSmZG?=
 =?utf-8?B?WEZZSVh4SHJHQ2JXUHhDM08ybFE1NE5IYTBDTjhCU0cwS3BYY3BzbmJSSDBl?=
 =?utf-8?B?alpjYkc4akR0OUZUVWI4ZDlTczFxcHE4WmoxZ2kxQkxlSmorZ0hQNUdqYVFN?=
 =?utf-8?B?UW1vRjNLMmNydTFpVXorMXl2SUF1dDl3OHhQQkpNa0ZBMVNPMkM3SzloT0xH?=
 =?utf-8?B?eWxiWXN5bjNlOWM3U3pjTWxEVUhUblp6RWhJVDAzdFNzZE1HaXJDS0JYUmVi?=
 =?utf-8?B?ZWJTT25kb3ppUG5pTFk1LzBtdkJWcjNobWVYc3FEZU96RmtXZFFiQkkzbDIw?=
 =?utf-8?B?TGVHdnZhRG43UUpTczJyT0JQbFIyYTJUNEloRlVkZXB5WTNEamJ1Q1MzUUVa?=
 =?utf-8?B?MWozNGsrV2RzVmUyTVRCb2g1TmxUQmJmUEtXZWZxdmliU2M0UUVDY3kyeVZm?=
 =?utf-8?B?V3Zpa3hXRUNSTGRUN21Ed2dxWHpqK2FvMTRlaXhwN1F0ajI5bXVjT0VTUGVY?=
 =?utf-8?B?VHlWMVI3MkFlcXJYdlVyeE90T2E3MWRWRkJwNGV0MEY4djhVOGtNdjdqNEd5?=
 =?utf-8?B?alE3Q3NnalVHS0orM3FQcWVTS09RNjIvWmVkNDc1T0NwbndLTngzamNPSHlt?=
 =?utf-8?B?UFljYTBjclNYY2N0clFlRkJhbmd1bXNoY2JNWTB6L0g4QTFhc2tNalQ3WUNC?=
 =?utf-8?B?VmtCR3hQbTNhaUVFZGl4aEtnYkJFelp5QlRPc1pBUEhubzRYM0VZMHh4MDIv?=
 =?utf-8?B?d3hKWGFWWCtvZDFyaVNLV2NFeEpoLzZvZWxLMTBTU0hxQWNMckdyQXN5L0JD?=
 =?utf-8?B?YnpZNnFnQldJK3lxQndUQWZ0Z1gwMGRmbnhGVFBZWVpiQzJscjY4T2lNYmd2?=
 =?utf-8?B?UGtSUGVoOHU2bWJwNC9yY2dlRDVyMWwxNTluSWxxbDRaak82dmYxUmR0RURG?=
 =?utf-8?B?ZjlQYnhWWFF0VnFPOFRacmI3Z21sZ1pFeG43ZFRDTnJNc20zZUEydWN2cStj?=
 =?utf-8?B?SFRHTDJRZkdVbzdSeE1tNS9kNW9TZnlPS204ajFlVU4yb2JzMHU2L0Q5WlBu?=
 =?utf-8?B?bE4vSExoNkdhOU1GaUkwQUowTUpLb25Bc08rQmRiZnYrd2lWLzJzUjF1aVhK?=
 =?utf-8?B?THEwYW5CMkhoV2RCY2V0WTJCUWI1UTR5TjZCTk9pT0NPOVE5NUNFOU1FNmRV?=
 =?utf-8?B?eVIrUmxocWdwczAxdTF4eHZiZG5PeHBqTnJMSkwzczJLZmwxS0ljNTdockVa?=
 =?utf-8?B?cDRnSytFOTRLSmx4WjhRb3Vsb2pkSy8zd1M4L29PSEFaUVJlcEtwcGxVc3pi?=
 =?utf-8?B?YlRITG9iSGxSM2RsYmVvNElZV0NXano0ek9oa0hJakR4VjBtb2NNVVpiQ3px?=
 =?utf-8?B?RllGcDRSMzlzVU1XaFplTXRYdEQza3RsYXUrRFphVmZqcHFNVzlIUzhhTGRv?=
 =?utf-8?B?ZUN3TTkvYmVEeWJXTGlGRGYwdU1KcHFEeEc4b2JRejJNVGJNSUNhQ1BNTU9T?=
 =?utf-8?B?ak9oMWh1elNQL0F0R2F1Vm00YjNWZnRwVnJoSjErQ3VoNjZCMkN4N3A5VHEv?=
 =?utf-8?Q?hP6l/c/w9oM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sm1YbEl5WU13ZDQ5MXkzYncxYVArSmUrS1hGZ2VKUVRlWXJGOUQ0bW9Ic0U2?=
 =?utf-8?B?dHZoS25mNGFmZnJvZXRUVVZwWi9TeVUwZmFqZ3BuRlNOK1BMUElxVVB1ck1z?=
 =?utf-8?B?UktiNkNVWE5PN2N1WmFlVytKcmh6Q0EzMmNzcjRQa1hUckltUWh0UHloK0c5?=
 =?utf-8?B?cXU1QVFRVmdhYWIwazFlN2JKVWNzK1hHL1JlWk9GTGZQWC9PRFdEb291c0Q1?=
 =?utf-8?B?aGZFYUgzWGowYm1wY295VkxDMmFFd0plNG8zMnR4bytyOGtwclE0UStLMmZ0?=
 =?utf-8?B?Y3E5TzBhTVFDOGpJTDczeTgwVmRIZ2tOMEpORXJNSTJFNjRKa1g2NTNwbTdE?=
 =?utf-8?B?MGgyRVdEWDNjV2ZSc1JTa0MvZldaUGZiMTc1UlMzd2NTdVRLa1NFcXpoR01I?=
 =?utf-8?B?dTdMYmY2b0lQSjY1SkQ3aUxqNWFWaVB5c1RNYTNUdGdDS2RsYk40Z2h0Mkl2?=
 =?utf-8?B?dXYzWDkrQUQyUUJmd0NEOGZaeE1KVGdZdHRXMEo1NjhZR2FZQWJoNXJBMDZT?=
 =?utf-8?B?S3ZUcWNnQ3o0Nmowb1NPSXgrcWdmV0s1L0hXWXBJR3ZQa0FGKzdiakRWZ3Rm?=
 =?utf-8?B?MTMxcmdkMGs3Zi9kNWNmQk9xNjJpSDFCOEU0SWZKUVRMK2Z6ZkVXaGdNNmtE?=
 =?utf-8?B?eUVpaWtwSy9sRiticTRwSWdKa2xnNnhIMVZselkxR0Rja2JJMnRhVGxDOGxv?=
 =?utf-8?B?bzJEdE11K0RJY01Tc0UvcHZ4ZlRnb01xYmlvUXdoSVFzU2ZxK25xZEFWN25P?=
 =?utf-8?B?U2Y0SlBtNit1cUdLNXZVNHNnQ2dNS2xtSmlZVmFzVzVGeURER3Y5SWloQkZa?=
 =?utf-8?B?S2JGOXF3SmZkM0xOcXNkQ2JMcWFQYXkrM2NpaFJJcDdNZ3g5UllmV2FFNE0x?=
 =?utf-8?B?M0xQTG5tbzgzQVJsRzhZcjFKNURrUUJia1BGVkNQcHVjNStEdWFmamlqb3ZU?=
 =?utf-8?B?YlBxT1krNy9TcjlBTmU1MmxSbkR6NGFiaWJwbWxwL1VGSzZPS3ZrdjVrL2lw?=
 =?utf-8?B?OTBtaTdreGNtWTV3clFLL1c5bmhCMnhtSjFPL0hxNEFoT2VCYlpUNDZPc3pU?=
 =?utf-8?B?TmllZy80dHBGU0xQTHNxQ0NYWTNkOXpKUmFBc3RublNCL1NSdTkxNTFoNkRR?=
 =?utf-8?B?RlU4MlZNUUxrWElGMktBdEFaRVVYWVhQVVkyOWU5YTZSQks3b3Rqd1pMRW1o?=
 =?utf-8?B?ZHp1MWtNUUpEbVdFaXJUejVGbzBEWVFuMTVOTjNqbGJVbW93cEl5ZEhtOURu?=
 =?utf-8?B?WlhCbU5DQm9nY0RqU0Q0TldOb2xQUGdYbS9jS3ZJZlh0UnhSeEw5N1Zqb1Fs?=
 =?utf-8?B?R2hENEtwNjdiaUt3NHA3bCtZWjNnbTlmb1R0TDRrYnkyK0x0QnYxUjJZRjA3?=
 =?utf-8?B?cnkvb0ZwKzFPQzlFU3ZxUzNzZUxlSDZnRUpTT2tFU0tuN204dEl1RkZFRkI0?=
 =?utf-8?B?dWJvZVpqbDJ4TEhLSUEzcUhMQmtmZjY4MzROeTlRZWVLS2puMU9ndFlxek80?=
 =?utf-8?B?b3l2K2tJZWtKQUp5Z1BIbU1zQmlQaFZDZWNmbWlPTG1oMUovNmQ5SVcxZy9p?=
 =?utf-8?B?NkhBaHFqaG9CNHMyeHZVRFNyZTRhK1pyaDBlYU5QeVk1d1hCOWFpcGhCMkQ2?=
 =?utf-8?B?VGMyV2xSa0NiNEpkdHNrOFVqaHZuQitkTC9NTWFUVFAzdm82dXVUQWxWVFNy?=
 =?utf-8?B?ZE1vS1ZiZXlaMStoRW9mVDkwdXVGREJzRklUY0ZuNUVpMWtKNmY2UVZtYWJl?=
 =?utf-8?B?VHF0dGFCRE1GTUltdjBtaHVWQm4vSGxOM2NXajdubzFqd0lzbXMvRUZLdTgr?=
 =?utf-8?B?TURUT1RXb21zaUd0ZWR6UVVDb2VXT0kvM3dpckJKRC9WRGZjdUZ3MERnZkVk?=
 =?utf-8?B?M0hkREhiWVQ2aW1UTlVKalNKeVAySVRoSkhxM21xL1B6cWZyckNISXFvRURn?=
 =?utf-8?B?bGY2RmdXVFJUMlA4blZlL0dLTjlEVVNrWDBpQ25EcHlhNjhaK1diOWtkOTg3?=
 =?utf-8?B?UkdHMUlxSEEwWTJOa0d0WDJlV3NtMUxqY1ZrNHJGMXdZWFhnek4xdDUxcWVT?=
 =?utf-8?B?dWZiY2VuL2s0NFVjNk95WGcwODF1RkczRVNGd3V2bTgyMnEwcEphM1NLTmR5?=
 =?utf-8?Q?xYunBdfjeQ6sItZ+jlNv3VbzD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ab7019d-d01d-401f-c24d-08ddb03ba0bd
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 20:47:10.4043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jpIRGuFK0ougMSZUnI1rRxJsgx9nePNiGtYV34YzFFGon5q4dsbpvF/MjJRQLiMw5vtCT7wDnC7UiOu2rdsttw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6256

Hi Daniel,

On 6/20/2025 9:48 AM, Daniel Almeida wrote:
> Hi Joel,
> 
>>>>> I think generic over `RangeBounds` is a good idea, and we should
>>>>> .is_emtpy() or .contains() instead of comparison + boolean operation
>>>>> when possible. Seems we need a function to check whether one range
>> I am also of the opinion that RangeBounds is a good idea. I think it may come
>> down to both classes of devs, those who have used genmask before in C and
>> expect inclusivity, and those who are using it for the first time in Rust -
>> the latter may almost always want to use the non-inclusive syntax, no? 
>>
>> thanks,
>>
>> - Joel
> 
> Can’t do that in a const fn, and we really want a const fn as the default.
> Hence my suggestion to only support a..=b, which is both correct and explicit.

I haven't looked too deeply into the const issue, but the a..=b syntax is fine
with me.

thanks,

 - Joel

