Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011028.outbound.protection.outlook.com [52.101.70.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C23145B3E;
	Tue,  6 May 2025 14:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.28
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746542073; cv=fail; b=Biogr52qwTL79ddg0lpmuX3pHp6OD7keCaM71bYkDkdpgDD5VXcL+5KocC8kwdadVQec+liWZpH7t6uU3UCYzX1MsuXuhpzQFePDAonjI7bgYhCzqREQW9J4wIB1WIsXngo06VbVjoe0T3ISNcUU4BPQ2ttVCsnIhXWpuu8ac80=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746542073; c=relaxed/simple;
	bh=BLq4IE3/QqJPSQhpASBqZIJS3GRdZfxuNxk5IFNbE58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=el5GyuL01E19RlbZ4uom05zrAoPGkJJKdtoXPLmQvnyCld7abNzBL6rG2Q8ei9uZlK5ZlTQK4pI1WV+YBpFKt9ulRM7m4c7OmBKWzkK1s9UkL/UQvtHYEw7JntNttXXsQhOGxXdFG9TNA6Be5rWgZhBOwucsauaEF4z2LYEVaTg=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DFu6G8de; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DFu6G8de; arc=fail smtp.client-ip=52.101.70.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DFu6G8de";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DFu6G8de"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=JWLZkGTB12cET9Kli2HgPQ5EeeIjEzD6QPekChdtMUFyQwx9Z8e5dWONKHviwNhM59qZSJNgWn614dgfWvS8KJL2slWAh5+r0bln0FPGdPpIUniT29aenkLUlGOSIvkMMf/vWRw4OBFsjzwAapR673kQ+3yBy+QCjsRgokmalh7fBEeuVWxppWWZF+2GjCxzML4zRov8SERSHb9HGPHE9u+RZj97BUUv/oeI7uxkF45QcWKJvLZ4wxTlJRuuwSLjU7WS1AO7XJyuB+JMURkFHFx42lTPuTJU8GsMq2ZjNSmD3SFdEgpznql98mKt1h1bpBU0cZxAiCb0N3j0Atnb9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLq4IE3/QqJPSQhpASBqZIJS3GRdZfxuNxk5IFNbE58=;
 b=rKgYK0WePq1mhqJYHNUc9XR/WcVo56sIthKLmB0AQTgwE96/76iOSF0XiQkt2K7uvKczkjo4uuRqSkQLeBAmmA1PQ4/n6vxWsRcvKAEUc3DeXySwcsBfBh10LCjLlcwYK0ZKEJD1PViuc15oz5+NH+4wB6IU8XlQ3l4bSorckJAqKk4KhNRD6sjsR81FbKqwqfR6geipSQJKhn5HQxnq75bthz6viCuNItqHgLHbior6FZkt7CFuGKUWqgBcFRlLPiZwM1sdpr13L/iyZQMkkcnMsDNYZYMIe34hB8SWtIUozwQQjHtiVm5silS65yltpHeeB805zKVqsmjVutuO+g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=google.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLq4IE3/QqJPSQhpASBqZIJS3GRdZfxuNxk5IFNbE58=;
 b=DFu6G8denruH6T33OEsBOzvZdSjIg5IauDkeOX3TI7cCRTUVpnqAdWFKmIN4PWGoXC/GTWGXv9QgX+7DqfH0CQn+/YHa9nb/TxlRZw5Dvm5anGfP13dZeOHVQ9dsaO0/ABjwXLN0fyrFmEYEc6P59KqLWY2XHbKBJgu0iU7UFlU=
Received: from DB9PR02CA0028.eurprd02.prod.outlook.com (2603:10a6:10:1d9::33)
 by PAWPR08MB9495.eurprd08.prod.outlook.com (2603:10a6:102:2eb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 14:34:25 +0000
Received: from DB1PEPF000509E2.eurprd03.prod.outlook.com
 (2603:10a6:10:1d9:cafe::14) by DB9PR02CA0028.outlook.office365.com
 (2603:10a6:10:1d9::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.29 via Frontend Transport; Tue,
 6 May 2025 14:34:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E2.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Tue, 6 May 2025 14:34:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sGWFGRSy/mSIIrbvsx+RJ0pkKqlenzieOj3mjgWqhQwYTXdZYl/J97agaanSpSZvEPSbf2usYLzrKm2uZueESGwdsuhzB1UcHb/rMNw9oNyFgwcik/e6pxI9K+Pu+EHg3kMCoYKEAY7nOi1tNm68edM5LCDrdxL99gRTnTyaMxXWsr/xanw4doh6TXcsm0i+8Sh3Gln7dKt9E1zQVcBo4r52fLXOwvsybhFt4v9GTxbQ86XECm+SeT4NwG4sp2FjiCBF4iLTNRmJ2qtN6yjZrzaLC5Ci/6Se6DZ0FOf8LDMyPAjyYtVJhyxdPkUxdvWROe/CsHhfNmI473/yEPa2pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLq4IE3/QqJPSQhpASBqZIJS3GRdZfxuNxk5IFNbE58=;
 b=PkJIGkJZhUX2uoFP52UOy5Ty9hwF/gmJzm+gwunxO8QUPKjliOi+X01CrHrXaFdYY3UCOjYh6Uckrjq7Ybvb8K5mhqnBDZWPh9ILOyCPS8GBkpg9vF0KSVH3iZUogiuzjALNT17u1uQgqHi7lpUkyPgL55AfPOkRkPeWiBb9hbUGTtDgW7tPM73FtB8OviVAnKphQ8CveIT5xCOHy06sHaUTp6SEM3u8Hs9i607exZ012UuOEMXitKMQx/ImMEMLTZYC9ocpjv0ftEbNiGMkWxfYtUnmo9y5czz72K3jbTffPsQ9TMbd2YZpiKxa2ZshHic5lQNakzV5b9iWovnV6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLq4IE3/QqJPSQhpASBqZIJS3GRdZfxuNxk5IFNbE58=;
 b=DFu6G8denruH6T33OEsBOzvZdSjIg5IauDkeOX3TI7cCRTUVpnqAdWFKmIN4PWGoXC/GTWGXv9QgX+7DqfH0CQn+/YHa9nb/TxlRZw5Dvm5anGfP13dZeOHVQ9dsaO0/ABjwXLN0fyrFmEYEc6P59KqLWY2XHbKBJgu0iU7UFlU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DB9PR08MB9682.eurprd08.prod.outlook.com
 (2603:10a6:10:462::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Tue, 6 May
 2025 14:33:52 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%4]) with mapi id 15.20.8699.024; Tue, 6 May 2025
 14:33:52 +0000
Date: Tue, 6 May 2025 15:33:48 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Peter Collingbourne <pcc@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, will@kernel.org,
	broonie@kernel.org, anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, shmeerali.kolothum.thodi@huawei.com,
	james.morse@arm.com, mark.rutland@arm.com, huangxiaojia2@huawei.com,
	akpm@linux-foundation.org, surenb@google.com, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, nd@arm.com
Subject: Re: [PATCH v3 2/3] arm64/mm/fault: use original FAR_EL1 value when
 ARM64_MTE_FAR is supported
Message-ID: <aBodzNRLzLK8shA+@e129823.arm.com>
References: <20250410074721.947380-1-yeoreum.yun@arm.com>
 <20250410074721.947380-3-yeoreum.yun@arm.com>
 <aBT8BWqoljvcAU_w@arm.com>
 <CAMn1gO4Ft2R+_CN+XdTsO0YpUQZN7zShMSg-XT90U698Rnifjw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMn1gO4Ft2R+_CN+XdTsO0YpUQZN7zShMSg-XT90U698Rnifjw@mail.gmail.com>
X-ClientProxiedBy: LNXP265CA0030.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::18) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|DB9PR08MB9682:EE_|DB1PEPF000509E2:EE_|PAWPR08MB9495:EE_
X-MS-Office365-Filtering-Correlation-Id: 894db330-e52b-46ea-c211-08dd8cab19a5
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?YkpoL2pCM2RhMS8vNk0yYkZzbkRkMWQ3aVFLdHFrRk5iMjdmbjdFWGRqRWtr?=
 =?utf-8?B?NjB3WU9QRktxTjBjTGhObGkvRGFXOXNkVCtkUVUwaTNlZEsxbS8rQTY4eDdh?=
 =?utf-8?B?WVVsS1F6NGo4WWRBV0NnYzc1T1NIRUFsdXZZQzVIRkxJNldrc09HUkJCZkpZ?=
 =?utf-8?B?MmZUbGx1T2NaMXRINXNQcmVGVmdPcWFPU2dBVzZEcjN3a2VSdk9XaW5iTlJ4?=
 =?utf-8?B?LytQd0ZJSHc1L2syYmF3TjRvZVU1WHV6cGI2Wi9hdkpGbnZhVkN1d1Vna3Fx?=
 =?utf-8?B?SzJKQ1VTK3JNcngrdXVOT3BaU2pRSERLRnh4cnIxNVVsc1hNeHJiZk9wMnd6?=
 =?utf-8?B?NWFLUnJaYnpNYVMwY1NGR1NDelAwcHZzaGhHa2lCSWRsWjRacjBabEJIUVI5?=
 =?utf-8?B?TkErWFJkcUpNeDJYb1RheDMyQkM2c0pwUmhvaDZLNm02RncrdGdRL3FoNEN4?=
 =?utf-8?B?WnIwRlVRRG13SERwVmllakRzSG4zUjhxTW1tdTFwT2RITlNucmNON3RyK2JU?=
 =?utf-8?B?Z1NPRDliZTlZWkNxVkUyNFM0RTQ3K3FjWEVKVy94WXhCdERmdzdnaWtzQm5F?=
 =?utf-8?B?MW5IcVpkS09Va01ndFdIc2xtbnRQT0RXa2lXS1EzM2xjVVJaeUZ3TVJvd2V6?=
 =?utf-8?B?Q1N5MVNRRGZubnlXa2hmNW9RUkpQUXRZWWROVHVtVGQycXFjeCtTNDNsZDlD?=
 =?utf-8?B?dVFYRUJhVkxyWmtZdEpadHV2ZzhZMU1ZcTdaM1dIWVY1THFSejZwTEFibVdB?=
 =?utf-8?B?QmV6VktER0xvN05lRnFmclBvcXRweDdIL2EyMElIYWhtcGZRVndSWFZGMW9s?=
 =?utf-8?B?MktvMnRwZjB0Y0VodC9VVlh6MkM3Vzc4b0I4ZTVuVGZubFdjTVdiZDdWc3Vq?=
 =?utf-8?B?M0pNc3VyUEJwQnZHeDhLMmJnN25PSXg2Q1kxeHhZMkQ0MUptbjNsZVh4SXVx?=
 =?utf-8?B?dDJWSDlkc09MMnlXbGxlNWM0dlBYeGJMLy9tWGhzYXJ3VnUzd2NrMnhHYjBI?=
 =?utf-8?B?T1gvekVrOGpSRUpFT09QNFBSa0gwVkRYT3h1ekdqNVlyZzZEbDVOOEM1VFNT?=
 =?utf-8?B?Q1Z2UTdYVE92dm45Y2d6dG1RRjVxRjU0d1NxU0t6a2RhYWcxVWFNTkhhb0Jx?=
 =?utf-8?B?V2QxN2FYeW4xaml3RmF4TFBpQUd5U0hkU2VMc0JxSFNnWXdhSDVqMTNRM1M5?=
 =?utf-8?B?MnJIeFY0ZmExWFNmYWlRUVQ4cUZPMHNucEFPZmpLQWVZNVU3L05JRmxYeGdE?=
 =?utf-8?B?WmM1Q2VFNm82NFJWdUFsRndnTjlTU2x6bkVlblZUcTNnOEphZXhLVHdkeng0?=
 =?utf-8?B?ZS9RSmJWM2ZHaEkzZnZjR0puaE9RUXZGbDA0UkUySTM1dmJybFRUMmdHVmNJ?=
 =?utf-8?B?K2RUZk1Bb3RTN0l6cUVtRVlUeUNNWFhzcmV2NnZ1RUo1WVVpUWFiUzlaQU0w?=
 =?utf-8?B?UGh2REZvZjVmeGdhTFpnclhCRFFZY1hpMjBoVUxKUTNwR0Z6REFRdGd5UjJ3?=
 =?utf-8?B?N25IeFN1R0Y5dkVWcVZ1N2xGOUE1MjRaY043KzFJdHVPS2ZmYWhHQVhhVnEw?=
 =?utf-8?B?UWNOTWlwQ0Jkb25oZVFNbG05Z2tnMXhyelhPZ2VNT0o5aFo4S2oza2ZKd0dn?=
 =?utf-8?B?OXZYcG9JTlBlV3BVaElMTG9VNy85UVlRNkVpMkl5NXhoUVIxUmNoT3NTNVF2?=
 =?utf-8?B?ZHVjWmMxeWpMKzVsZ05VQThOUlNEa3RWeUhpR241WXBKVjFEdnhVdi8zOU81?=
 =?utf-8?B?S1kzMkMyQUlqc2J0YTYyZC9qODUxTmhCenBJd2JpUkxocUhxMjVSUktWdkMw?=
 =?utf-8?B?enl2UW5nRzExZ1UvZWozWG9HdHpxdm90SE1iT2lIY3ZhMG9qcXBqRXllV0lw?=
 =?utf-8?B?RnhybUZMV3lmZTNMK0F2bEl2aGYwNng1d3ZLYWNpQ3JRK2kyTm5GQ2FMcmF6?=
 =?utf-8?Q?/YHb1ZKBg8M=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9682
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E2.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7823e60e-7290-4578-6d93-08dd8cab0596
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|7416014|14060799003|1800799024|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OXBoODJ0cnRocENtaHRLYk5LRVE2S2NxcjJEbk53RjUrVldkanRaYlpJSFZT?=
 =?utf-8?B?V1ZiU0p6OUwzU3d2a0hDeTlYNW5md1RCUjBJTkJkN01udWRDNVpxMElHeXE4?=
 =?utf-8?B?YkJZTGUwOHFHdWFmb2NESnhwTisvV281Zk4yVkorUHo3REU3YmZ2Q1VGTHAy?=
 =?utf-8?B?ZkV4Nm0zaUV2ZzJtbnI4eDJFNDVIeDhPSS9KaC91dWI3YjVETGRyLzhxYmVY?=
 =?utf-8?B?bHVjZm9Fa25rOU1sOUpSUUdPT1ZscGsyK3VFWWl1dWVxcjVUOVpSeVpQZXho?=
 =?utf-8?B?SU9xelV5eUdmQngwcHdldW5WSmJsUUdDN0thUzlVaTE2cmx0QVplT2hBRDBx?=
 =?utf-8?B?MGlMSzNMR2wvQjVEUHhxS3l3RlkzaFdKUHVGam9zUDBwWTZ1WnZRVnoxUHNL?=
 =?utf-8?B?UDNYRVROVDNKaGh6emJRM2hhS2ZET3h1anVtM1I3eUlrQStYems2bzBxak9P?=
 =?utf-8?B?TjU1VHg1NlR0UE16WE10dG5xc0dLVnBCODNwTi9YL3JCK3F3YjNlUkpidS96?=
 =?utf-8?B?T1lpbFpzY0lZUkx2YnI2N2lBWjZYNEpSRXhybTdodmxwcmxKRnFFZVdRTjVY?=
 =?utf-8?B?QnljZVBaWjVGM0g5UUU4N2FkU01GdUJGK3JLakY1U0l1ZllFMWpjQ2VCMVFk?=
 =?utf-8?B?N0hkSStnSS94ejZ3elpUVCs5blJRTVVJZmZMb2F3STUwZ1FtVVd1Z3VSVVpv?=
 =?utf-8?B?V1JrNVRPbU5UZGoyNktkNGpIcEQwNFQ5NHo4aTlkN3hTajZpSGxNTy9aT2ZJ?=
 =?utf-8?B?YmFQbVNaSUExNEdhYlpVMndwdnQyMjZZK2kwTGVnTk1qSHVtU3dUWmNNZ0ZH?=
 =?utf-8?B?ejluanZaY1F1YWZVU08vMkdXK2w5NXRjalloZW9VN29pYS95T3FXOVY5MjRx?=
 =?utf-8?B?Z3k3elhmVVdOSkd5d0xEWEY3RGlHU2FZeDVVblVwTVFxZnAyOHkvQXdMZGtl?=
 =?utf-8?B?TVVJMlZwdTJGMkUwdEFIQ1B6Q3JEYURwbVIwSjVub0Fxcjdvdk1YcmZITkhE?=
 =?utf-8?B?MHV2eVVSOXBEYnMwdzV5MHMrWjFMVHUrYUx4ajdaakkzK25OU2ZTQ0cwL0tZ?=
 =?utf-8?B?aEcvNGVNeVpTMVY2SzkwWnpBSVdRbHNpTHB0d2ZRZ3dNZXlsaWd3TytIT29K?=
 =?utf-8?B?VjJoY1BpZGExaWNSem9DWFNDeFQyNjQzbXoyWWM4aUNBZEJVK05wVXlZcXhs?=
 =?utf-8?B?bU81K2tLM0s0YWhOYjFNUXh4Y3dPekRWb05oYU1hRjYyTHRQZ1Rrd1BRNjBq?=
 =?utf-8?B?cmphNlJPbjJ3WlQyTjBxandMUUlHTGJ5SkhGQUc4V2xaeFdDbmRQbVpWdVY3?=
 =?utf-8?B?U2s1T0JWdi8xMThlQ0NHR3N6T3E4bmhuTUFrMkFZeWF2SS95L1U5bFJyREJr?=
 =?utf-8?B?V01uY21ZMzV5WHJCMms4Y01Ja2FVVFF3dVJGMThEbGtnWEtUQm9uMTlqbldX?=
 =?utf-8?B?MlZqOWN3TzFXMms4QXgzVHhPS3VUd0RkK3ZkTTJlRm84cklMdk5BR1ljSDJ3?=
 =?utf-8?B?RnZqWHNKOVU5ZDhmeS8vZ1Z2VGgvbnBMQUVXT2dzSWZPR3R0Qk94bTVwU1Jo?=
 =?utf-8?B?UDNJbDhINGo2TnIyTDRSVU1tOWlhOElsRFhMWERGMCtmcEo1cGFQdmMxYjIz?=
 =?utf-8?B?cVgxOGViWmprSlcyTWN3LzUxeXkzMDFjL3ZyZEVlRU1jSno2OXJMazc3eCtq?=
 =?utf-8?B?eVZjQ1RIdEFwUzhmbVJQUnZmZ05TbDRkcFM1UmVPUVMreGJ5a1dvUStDQVZm?=
 =?utf-8?B?OVZOanpDM2RpQU5qRkhtU1VyT1R2c01xeVA3NkJNeHNmRFF5WjUwSzdOTjBs?=
 =?utf-8?B?KzRMZFFxeUlTYmpVdzNTZU5hL2d0UmpBNG5OVVlLaUJkeDVJZWJKNjE3NnpH?=
 =?utf-8?B?dy9rRi80QlhiSVU5Qk9GOVR2dFlpa2ZIWmsxWkpXZ1I2Yk9RdDUwaGYyZzFS?=
 =?utf-8?B?L2xjZUJjZFUvS21Bbm5rbnRuYUdacXVVenBrN0paNysrbFNmNmFTcDR5bklv?=
 =?utf-8?B?UzJQODVXY2tDTG45MHdIY0ZJWVlxUi9zUnFkZENrekpiNm5zTndjVnBOL20w?=
 =?utf-8?Q?yJkA9R?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(7416014)(14060799003)(1800799024)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 14:34:25.3081
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 894db330-e52b-46ea-c211-08dd8cab19a5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9495

Hi Peter,

> On Fri, May 2, 2025 at 10:08 AM Catalin Marinas <catalin.marinas@arm.com> wrote:
> >
> > + Peter Collingbourne as he added the SA_EXPOSE_TAGBITS flag.
> >
> > On Thu, Apr 10, 2025 at 08:47:20AM +0100, Yeoreum Yun wrote:
> > > Use the original FAR_EL1 value when an MTE tag check fault occurs,
> > > if ARM64_MTE_FAR is supported.
> > > This allows reports to include not only the logical tag (memory tag)
> > > but also the address tag information.
> > >
> > > Applications that require this information should install a signal handler with
> > > the SA_EXPOSE_TAGBITS flag.
> > > While this introduces a minor ABI change,
> > > most applications do not set this flag and therefore will not be affected.
> >
> > It is indeed a minor ABI in that a tag check fault resulting in a
> > signal will report the bits 63:60 as well, not just 59:56 of the address
> > (if the signal handler was registered with SA_EXPOSE_TAGBITS).
> >
> > I don't think user-space would notice but asking Peter.
>
> On Android we don't set bits 63:60 on heap addresses when MTE is
> enabled (and userspace programs aren't allowed to modify them in
> addresses they get back from the heap allocator either) so the fault
> handler should continue to see them as 0. Of course, a userspace
> program could be breaking the rules and setting those bits anyway, but
> in that case it looks like the only consequence would be that the
> error reports from the heap allocator would sometimes be missing some
> information (and this could already happen if the access results in a
> non-MTE fault) which I think is acceptable.
>
> Peter

Thanks for your confirmation :)

--
Sincerely,
Yeoreum Yun
