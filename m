Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011047.outbound.protection.outlook.com [52.101.70.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D084286405
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.47
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751284655; cv=fail; b=XnrPkxMH55EPu2P0F28xT++dkfJeRowD1ZSZGVU7HNAYKPi5iLfJ4QyMtgqR8xxpcKTptpBV2iqtWNY6EPXdMNx+yz4SoDR0MjTT6JruprWnce4wIzxJM2J8BRRspSoNBtMFGnmMdO+QZ1tjhmlTqEOxdHZnU9h4NDaXWH7lqTY=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751284655; c=relaxed/simple;
	bh=iq34+m8iMJExHHwXlvBfkSfG/4DuwwJvFdSDGeMnyqo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hAvUlJHYXOEEWo+TpSfsR3sfN705rNbD289Io9MUsJGrQYt5gzh116lodf/dpacXudZg9qmkg7zDcbEUQxGoXUKRBNNhM48mxWOKVQDzwFHbqLJy+TuLC8bH7I7r5y85t14GxtzXE2lUMfQQEOEV4+/zczuYvWqJdEhtgFxWkCU=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=mhI8X97+; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=mhI8X97+; arc=fail smtp.client-ip=52.101.70.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mhI8X97+";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mhI8X97+"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jkSJ8rTvcsBc7F8U56MzoGhoHvJChBOdOzj+DTiJG9CG0NfX6bna1h/WgXE6kyHVHfkQGfsJrvMGi0WjGH8bpzR115egyMWAa1xgr1NkRPnrW0W0RMgVA3WGd3Vgi1x+o/v4kgXxTNhm7tB8UVke8ip2LsrdJdvqoQ6g0hPWO+1G64NtWi47DfJ7HY8XjgXKEXzRi6bqYFhkNIZivlk+jhPfny9pPIteTnLiHF53r3JI2NcC39Lhruoso7SlhO4yEchGAKIDrtFedmsDreF4LXGtKp+FFzcUFtkbhuf07PutaFXI9H3x0Tu62mKACFhU6fmn9kVGhh5NJSwec253QQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iq34+m8iMJExHHwXlvBfkSfG/4DuwwJvFdSDGeMnyqo=;
 b=WjMSg/ta28k36SjAQKyD9fG8MsiJ35QSzOkysKm5JZBZdpivohskpC7b+EcGDvRjxAqeL+vWcHtzwty1S64sp6HcDpKra9FEcMEjd7GgyVYfLJLcU9pnim6hgLy5d5tdOzODVlmQMLLEmqME+88EKrsaxRYep7BxkaujMwUaM+ZgueXNfuZt8uwQ3nZA2GZbNCR3kOlO7GNID8SAJEr/KqqWnBdBE0H2cFb8UNFX9YkkYaDBgrcjUn1L1vLMlxKHP23an8E3hgCGrDgWCYFF5Z70fH7oMxt7HVGyC3C7b6O0c7rMYkatjl1YE+rQ3ZECZb0c3bFBtnCUCKZen+74rA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iq34+m8iMJExHHwXlvBfkSfG/4DuwwJvFdSDGeMnyqo=;
 b=mhI8X97+2Rq+h47jkzjEdxK1hWcde6ZteSoBnOEhIqoRQWN06UGfz45VoPCo+/vtcFoRpOZPTegHrBO7Cp/FaKz1nHjVyX28F2GMlwxTkscoUHbbmZYFYnGU5eOTQl7kzNH2Vi+cmHvzE8Y52aReINR3NeG9YwipBYA1mYCv1Xs=
Received: from PR1P264CA0004.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::9)
 by DB9PR08MB6396.eurprd08.prod.outlook.com (2603:10a6:10:23e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Mon, 30 Jun
 2025 11:57:29 +0000
Received: from AMS0EPF00000196.eurprd05.prod.outlook.com
 (2603:10a6:102:19e:cafe::ea) by PR1P264CA0004.outlook.office365.com
 (2603:10a6:102:19e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.30 via Frontend Transport; Mon,
 30 Jun 2025 11:57:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000196.mail.protection.outlook.com (10.167.16.217) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Mon, 30 Jun 2025 11:57:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lUfnUQo7Vq7KuAupwEi7jysF88fl6wBpFTmKzxlnZgAr9NeK7D9RCyjO7ngV1Bdqopd/b7mL/sL32eCqYC3xsELOl7S2HUWdx6ww8/FJgWbGbu0N/Fkhh9qFelUho0uRugIHAaC6sFWqZvyDW6pvUAlGV6qOLEqqIf9qXG2yteO4PvL23ZfRRwPp7S2wfoVLoWq9YuIpINcbr1kdONWF4rLsT0yuzxnJHCRpi4ny/dooUD1r99WGFIOBlqCopAdJS7wGvDhWIXYzuts+SoTfCjx178PqeJaSBZ2RsBJAWC7ZN8jPPaUpijiGKac1xDe7lVdKYRcTuB0duDCh+TwGyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iq34+m8iMJExHHwXlvBfkSfG/4DuwwJvFdSDGeMnyqo=;
 b=uIpn+fvY7xYoIxfy8Ig+nVt+3QbhVeGQA58CztN+cyRj4dkObj/7Nuerywu1KoeP8svIOBPyJ+8gflq9A9Mv5exFMFlJuXnK4AiZZazcmpBpUJ12bV4jsTqdcb2KPyKG/j7Q+Jyfv5PZcnmygL4qWx3ynFfcLiKIN9WbNWlVaxrx2q2Q18+BRn8nOgscdwW1mgk9eCnhXUSK3mUyis4E7XGgF4kr7S8xLoQw+03sJi6C6BG3vHm6aP4PCXqoP4ZUTN2yZJj0b+FZ/vJRAmPIGutmR+XJebWUB1n7j7FSZPHQbfMUru1dDkNl4YfdUhctvvEF9xLZFYhpq9Frn2p+Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iq34+m8iMJExHHwXlvBfkSfG/4DuwwJvFdSDGeMnyqo=;
 b=mhI8X97+2Rq+h47jkzjEdxK1hWcde6ZteSoBnOEhIqoRQWN06UGfz45VoPCo+/vtcFoRpOZPTegHrBO7Cp/FaKz1nHjVyX28F2GMlwxTkscoUHbbmZYFYnGU5eOTQl7kzNH2Vi+cmHvzE8Y52aReINR3NeG9YwipBYA1mYCv1Xs=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AM8PR08MB5700.eurprd08.prod.outlook.com (2603:10a6:20b:1d5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Mon, 30 Jun
 2025 11:56:56 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 11:56:56 +0000
Message-ID: <07b08c1c-7685-4a92-97d3-54652dff9fba@arm.com>
Date: Mon, 30 Jun 2025 17:26:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] mm: Optimize mprotect() for MM_CP_PROT_NUMA by
 batch-skipping PTEs
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, david@redhat.com,
 willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
 vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
 peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
 baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250628113435.46678-1-dev.jain@arm.com>
 <20250628113435.46678-2-dev.jain@arm.com>
 <79a48c48-53b1-4002-a8b2-447e69d96e49@lucifer.local>
 <916304ae-abf6-4cfe-90e3-411d992d7488@arm.com>
 <5038680a-1c7c-4e71-8447-38708662a275@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <5038680a-1c7c-4e71-8447-38708662a275@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0110.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::28) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AM8PR08MB5700:EE_|AMS0EPF00000196:EE_|DB9PR08MB6396:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d0b4c05-89a6-45d4-5bb4-08ddb7cd49bf
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ajJCZnBuRGZCZU9GeFdBVlJoZ3QrUW94QTN2TXkxcGJ5QWdJTHdHUnlUTVBH?=
 =?utf-8?B?REg0OHA2d1Rma1hHTTNSL1pSTmJScUF4YXlSWTNCS0U5Yy9FeXUzYlFkMjV6?=
 =?utf-8?B?L3RXN0E1NlRBQUFQNngzWmxJU2d2NFNWSWtPRlJuSzkvRXFjQTRBYzR5eldO?=
 =?utf-8?B?Y3BOVlRubVNqdmdnZWMzYndsTm9ZWGtDb0N6U1IrTysxZnRwSUFwWTY2ZWtz?=
 =?utf-8?B?U25OSk5aR1c3VzFyNjM2MlM0OWhjaUFpeFNYcXp1Vnd0ems0UkJBcnp4ZHMy?=
 =?utf-8?B?QnVCeVAyd1dhZVd3MVFCZktxdVo3cjhrZTBsejJQeFRha2hYTnhhU1hTTWpT?=
 =?utf-8?B?L051eHJZWC9wWXV5VXhGQ201WXRtcUphTUx1bUNtVUp6UVhtZ2k3VUpWcDB5?=
 =?utf-8?B?YVIxUUh0ekhYbkJndGlnOUVBelRhZWppSUVLZzBYNlhQMklrQjVHMzV4NUZ0?=
 =?utf-8?B?WlNDTHpCVUxGNk1XeEJzMXQwbXJndWhNSHlUdnpSNmNpeE80UXdPTlBuWllB?=
 =?utf-8?B?NndoWDcvSkRMTzBLVlJyMlVMSlMzT3hWYVc4cG1sOXZyRkF4K3F5bm5hTDQ2?=
 =?utf-8?B?MThHSHZBa0pjcVVyRDlrQzFBa1k1WWsvOWNUTjdIM2s0a0RWY0dYQTc2UWJU?=
 =?utf-8?B?UU41WFlQU1hMR2NMbzVVLy9yR2dqSElkcGJrVWUrVVk2K1RHN1dXMWlSc1hk?=
 =?utf-8?B?TE5XWFZPdkMwRnhvZmFwdlRoSVdxaXBRT0VSeXJOM3VqRGVrcWZhbS9tQ2I4?=
 =?utf-8?B?SjF2S0VRUmZsdU02UFNpRC8wMXUvQS9HbEtIYVJpeGc5ZTBqc09tV0hxcmpy?=
 =?utf-8?B?R1ZuYUpXRHkzYlJDVjJuVzY5dkNKSXQrSk15aTc2RU0yaGdWSGp2TEIxTm5i?=
 =?utf-8?B?Qmd1dnYzYXBscG5COHJmVSt6YnRXZ0ZuM3ZOT0RHeUs4UGpFdzBINFdRUXdC?=
 =?utf-8?B?dnZJSzhoVXE3NXFrS1NRY2JycHNkUnU2WkJ0SCtKb1pSR2owN1RKanh0TkRJ?=
 =?utf-8?B?MjVQT2ppeUVpdGp5YlpVMDhpdk9keGVPMFM1cHp5ZUQxT3VLa2NvblFQaVNi?=
 =?utf-8?B?Z3RhSUZ3V25TSzhtZjBmZW5qQkxFYkJqcW5EWmlDTnFLck9iT1UveWtMc0Y1?=
 =?utf-8?B?TExMT3ovblZnR1BXYzlKS0FnMEVIQ3l2Ylo2VzRGWXp1Wk5Ma1I1OHdnT0ZE?=
 =?utf-8?B?b3lKLzgzWVZuZnd6eTFoSTRyKzNpQjRxdjkvOWJMcUpobXN6dktBSTE4N2VR?=
 =?utf-8?B?UjRlY1VOV2JXQXdVVlJwd2NsUURDVjFVcStjUFIyNUpwVVJjMkU4clJjK0dh?=
 =?utf-8?B?eUNvbjkxNjg3WEJnMzVYQzdyZVhzVTFDdVJGOVdqengyWk9LNkNTOUlqWTBv?=
 =?utf-8?B?bHhuSUhQU1lzR1g2VnFyeisrQkU3UlJTcy9RQnF2dXJEMmxBY2YxdDMvSHp1?=
 =?utf-8?B?Yk4yNlNJZ0o4ZWVXdlY1SHhLOXdURS9sRHNKWUdLWmk4NmVKU08wcWdISWRn?=
 =?utf-8?B?TDc0NEt2Sk1meit0S1FmcFJ1blB6UFNMOHNoUE9OM0pNbkhNMGpaZ041THly?=
 =?utf-8?B?bjE5a2pNUHZ2Z1RzQU1RQ1dtakJObEloSCtDc0ZnS0ZOSDdzWUtLcWFScytO?=
 =?utf-8?B?OG9PbzBLNVRiTnNMRlo5eDluUThETE5GdGh6NGlQVmEyazM1Z0xsdkhoKzNU?=
 =?utf-8?B?ZGM1WCtVb0w5QWkvSFF5S1dSRGpPTmczdXd5Q2hWTTZjQlBiUWxsR291NGVl?=
 =?utf-8?B?Q09ONUlRUVdwa2dLeHBjU0p1bTYvcFByb1ovZmowS1R6NVdKLzVrRDFBTjFq?=
 =?utf-8?B?L2Vud1VjMW1DZHN0ckJiazlDZVNSL0NIOFMvNnZxbUZiZWduVTRrT0RleWNk?=
 =?utf-8?B?dHh3clJtOXhUeCtWem5sV09qRnJBTGVpam1ZcjhkUDRzMGZLUWRZZngzV1dr?=
 =?utf-8?Q?Cra1tGGh0YU=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5700
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000196.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	06089e41-11c1-4b05-697e-08ddb7cd35ec
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|1800799024|36860700013|7416014|376014|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cThQL0NWWXpFUTdjcnplazNLMFNLU3hHTm4zQjR4N1JNY0Zad0hiRXhBTHFt?=
 =?utf-8?B?VjNsUzJSUmZobDJiMSs1bWZlUFM0enhIb1NnRXJmMFdBR05ia3VBVytXSnFo?=
 =?utf-8?B?dHdVRWZVcDczWU5tWjJtallOTWNHVUxnVUxmK1dMT3V6ZVNuOGQ5dDNBaHFt?=
 =?utf-8?B?QnpYWTJTc1lINU5PbXozenFScFR1ZHB2UzNHL3JuVDBUSm5FZGNmcTVxM2VV?=
 =?utf-8?B?cytYZHRaRXVRb3YzNCt0MWRnQTFacDdVaE1GYTFRdFVidnRpbTNLWHFuYXFU?=
 =?utf-8?B?R1NjWk9HLy9kVFpHcHVPbk14WHloaXFha0FEcVJ5TE16Y2FwdDBWQ0QwMXNm?=
 =?utf-8?B?OFZVV3E1WmJOZnRVSU4xWXQ0TFE4WlhDQ1FEWDZ2R0pSQ1phaUZaVFhuUVBB?=
 =?utf-8?B?RzVaY01yVndxN1RoWkw0S3BaRDF3b0VxdVhGSUZIVUpONjRQMmpiQ011RDVr?=
 =?utf-8?B?WGdYUTdIRElMYlYxS210L2x2ZktVNmhMN1Y0NGpBYkNjdEovcERPd21OeU5t?=
 =?utf-8?B?RE5POUYrcXVtQ1FqMzY1ZWlRekJZRlppeTJvK2tPdFU0KzJKY3J2T0paQkFI?=
 =?utf-8?B?TzdFQUFkM2RZcmpXeEcrcXhTSlVPOTExb3F6NzhMdVJuNS9BMUdoa041cENm?=
 =?utf-8?B?UE1EZ2hMRkNQczR6UmlHd1lrMXNkS3V5czQycHNpSHRycHFySkxzYXZzNklR?=
 =?utf-8?B?VCtlRmYyeEUrWVhqcXQ0RlAzNk9GcWYvYXEyTUpHeEFsZ0MzS1Y0RFBOZG9w?=
 =?utf-8?B?QWlHaXlPZ1hhMks5YlBKdm1qVDRGalFxQjR3V0QwSXNJRGhCbVhvSjFhVEZp?=
 =?utf-8?B?YWwwaGFEeE1DTlJxcWxjWVhuUkhReHRVcUprNWp1M291WVl2dytvbFFJTVoz?=
 =?utf-8?B?am8wOU9oa3ZkaGs4M2ZmZ0lDYXRpWnlaNW5xa0FqS2taeTRlWklVQTRMU3RH?=
 =?utf-8?B?OWZPK1QyOUVzeUFGZGhocGs5TlRkMkxzNnZxR2ovekordzRIQ0l2clA4MFhy?=
 =?utf-8?B?dG1ab0NaeUhVckpWL05RUFI4Q0RYK3pyV3A0R1pCbDVRQWwveXAzV1kxVWxR?=
 =?utf-8?B?alFHU1pJWlBPY1FMQjcyUHlpUkFBb1ZUUytYdkVNMkFpQTRvOER4TWNkaXps?=
 =?utf-8?B?K1RCMFVENnJ5bWxid2YxSUxPcGd0QkhwTTZRVWZFUkZjT3prY29xSXh2T1di?=
 =?utf-8?B?TnZsd0pvb28yaS9tODNkU2dLd2Z4RUNaaVdaKzhwODlPQ1pncnR4SUduNWFN?=
 =?utf-8?B?bEtNclNvaXFxZlM0VENPV0lGOTE5eUQ3NnhxRmNRZi94TGlHV0lQWG4xTTF3?=
 =?utf-8?B?NnZBTDZMNm5WOXl0VWM0VzArRFF3eTdIQVIxOXU4cHdZWUVrOWlhOUdFS2hW?=
 =?utf-8?B?YUJnSnBBUE1BOGs1VjBOMGFMVFJPQUpUbm13bWgzNFdydTdiUUNlYXg0UXJE?=
 =?utf-8?B?eWNvc1pkNk5qOWE2NnRFRnhuZlU5bXZPUnVoV2Y3dmJNaWFyM3FSY1cyeUd6?=
 =?utf-8?B?Kzk5NUFzSW5GdDRzVFdNR0ExdU53bjNaY2M5TmxaK2FWWUo4UWVVR25CNWg3?=
 =?utf-8?B?V0VzOW0rcGVoTkZEVGM0WkkzWkNoNUozbnE2VjFya1BINWx6VEJSNitjYVdO?=
 =?utf-8?B?SWxPbko5S2tIZUluUEFLSjFzSUcySmlkYURrYUluYnlhOWdSQzFUeXNTRlR1?=
 =?utf-8?B?SGRhRTZuNHRYbjBlWmYvYVNNYTZzZFlMYTFFZVQ0VTIrYzcvMFlxM3U4UUpF?=
 =?utf-8?B?b05nQk16WlQxbWZna3kvM0JvOXFTWUMzTzF0NC9JL0owMkRjSC80cmU4Tjdh?=
 =?utf-8?B?SWVjMmswTlJ4WkZoN0xiTkc0bzVFUFFnWlFTWEExRHlUN2J4M0RIeEZCMFNH?=
 =?utf-8?B?dGt6dXNGV1diR0VPV3JQZGV3Rnc4cDBtNmU5ZmUwNjgxempPQlZzZnVRMFhL?=
 =?utf-8?B?ZVJIZFVUbUV3WVdUOEpBNDA1RHQ4OVVhTGhKKzJmRm43NUlYUUcyV0JjQ2pm?=
 =?utf-8?B?VHJHeGtpYjJXWFlGVkNoaVlEZXNBMm9zNFJSNkhoTG1HMzNPc2NGaXNQeVJo?=
 =?utf-8?B?Ly82aWJBcW14YlRYL093dVl5K0dHN1pZZUJEUT09?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(1800799024)(36860700013)(7416014)(376014)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 11:57:28.8955
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d0b4c05-89a6-45d4-5bb4-08ddb7cd49bf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000196.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6396


On 30/06/25 5:21 pm, Lorenzo Stoakes wrote:
> On Mon, Jun 30, 2025 at 05:10:36PM +0530, Dev Jain wrote:
>> On 30/06/25 4:55 pm, Lorenzo Stoakes wrote:
>>> On Sat, Jun 28, 2025 at 05:04:32PM +0530, Dev Jain wrote:
>>>> In case of prot_numa, there are various cases in which we can skip to the
>>>> next iteration. Since the skip condition is based on the folio and not
>>>> the PTEs, we can skip a PTE batch. Additionally refactor all of this
>>>> into a new function to clean up the existing code.
>>> Hmm, is this a completely new concept for this series?
>>>
>>> Please try not to introduce brand new things to a series midway through.
>>>
>>> This seems to be adding a whole ton of questionable logic for an edge case.
>>>
>>> Can we maybe just drop this for this series please?
>> I refactored this into a new function on David's suggestion:
>>
>> https://lore.kernel.org/all/912757c0-8a75-4307-a0bd-8755f6135b5a@redhat.com/
>>
>> Maybe you are saying, having a refactoring patch first and then the "skip a
>> PTE batch" second, I'll be happy to do that, that would be cleaner.
> OK apologies then, my mistake.
>
> So essentially you were doing this explicitly for the prot numa case and it just
> wasn't clear in subject line before, ok.
>
> Yes please separate the two out!
>
>> This series was (ofcourse, IMHO) pretty stable at v3, and there were comments
>> coming on David's series, so I guessed that he will have to post a v2 anyways
>> after mine gets merged. My guess could have been wrong. For the khugepaged
>> batching series, I have sent the migration race patch separately exactly
>> because of his series, so that in that case the rebasing burden is mine.
> This stuff can be difficult to align on, but I'd suggest that when there's
> another series in the interim that is fundamentally changing a function
> signature that will make your code not compile it's probably best to hold off.

Good point about changing the function signature. Anyways my bad, should have
been more careful, apologies.

>
> And that's why I'm suggesting this here.
>
>>> I know you like to rush out a dozen series at once, but once again I'm asking
>>> maybe please hold off?
>> Lorenzo : ) Except for the mremap series which you pointed out, I make it a point
>> to never repost in the same week, unless it is an obvious single patch, and even
>> in that case I give 2-3 days for the reviews to settle. I posted
>> v3 of this series more than a month ago, so it makes total sense to post this.
>> Also I have seen many people spamming the list with the next versions on literally
>> the same day, not that I am using this as a precedent. The mistake I made here
>> is that on Saturday I saw David's series but then forgot that I am using the
>> same infrastructure he is changing and went ahead posting this. I suddenly
>> remembered this during the khugepaged series and dropped the first two patches
>> for that.
> I'm not saying you shot this out shortly after a previous version, I'm saying
> you have a whole bunch of series at once (I know as I'm cc'd on them all I think
> :), and I'm politely asking you to maybe not send another that causes a known
> conflict.
>
> Whether or not you do so is up to you, it was a request.

Yup my bad for forgetting about the conflict, apologies!

>
>>> I seem to remember David asked you for the same thing because of this, but maybe
>>> I'm misremembering.
>> I don't recollect that happening, maybe I am wrong.
> Yeah maybe I'm misremembering, apologies if so!
