Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011059.outbound.protection.outlook.com [40.107.130.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3065D283124;
	Tue, 10 Jun 2025 10:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749550286; cv=fail; b=qroMtA6fO+fw1aIhsE2AEYRzXZTDOUKrnMeH4a00qh00HoUuGI7XqBBK/6ELNm4IQE68UBM41h3osaPPUR3KLrWu6UcRZDkHg3ai71jkx3/T+bbso5eKJG3CIbLtQMVSTBiPwzS7K6CBatuZu13OnQpDLPHFuU2Q8/CnRd5ZjkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749550286; c=relaxed/simple;
	bh=W68d/HbBKYPkwjNwVxZWLT6VfbQyVs2Ne+3pYKbszUQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=f3RdJ2wDU0t1oXPO3WCvbRG8fJuj4UfSoXgu8+R9YmIj5mAMaT5Kdr7X+SwwYbOSAW9qP2OlM9a/pxKs7G6YeHKQJBDoLfOJpoMKpVVZrntI6WbTsPOwHNJNcMcF+87XEOEjnM6i3T5LQD4Obi0/m8uGQARdHPSEb528vpe0VxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=RY1831xs; arc=fail smtp.client-ip=40.107.130.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="RY1831xs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r8ur8wBSBfGlJufHIhGoN72uw5GmBkxH2St58vVZ/tUcD2L8a7FAzdIVPdQHjGnaD/HjGRQXWnK/NkDl70nTPdzBgiYOkgVoqSzvqK1eeNjbLklosdurriASGtmfeQYGXSlF/b69lkPO86OuMciF/Hyosy0eSqnRmV28OWGamykw69hchuKq+dVJ+RztBFoCjrEV8fLg4wa7DhMgGpmdWvgG6IuY+3DgQEHtXasRY/lOBXLoS4Yl2iuuc/e7GBaX6FhV3561tjtgXkd9yQG/njHr98awhhe8NPPseGgUOAS/WpZEvmwu2P0QXc83MVjG/ojDVNugQC0H11T+CHdimA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipkLXvNdeHweYAKlsTO/OaFaBY9BU8+6U6ExXvkUklQ=;
 b=kixBZBh3W2eAQvhXFa2QZnekSq/9TrIGCxHUSA9EZaAhLfZ96ruFF7/8jE9kVYOS+Vap9aiX5Iw2iY3ssNNgmhs/atThfhVR7OJ3KQum2rNlwB4rheW1kE4nEFlbZMGMYJqsJddhWoqQBbFv+zr5rqwNzoYq6qUo6ijhAcXjzDoMsi0sEddk2Pefu7vQ8hFcWXk4EZc4GpBYCVj0xPFiHo/+xpueR/39jb4mBNxqPGZp1OqHyk/wpoNkFihagWnXn/2NN6FmXfw7VJCTlwbMQ4NNTXw/JKs9+loXIa2LokjsYXfr9nYxoRkBgZMZx/4A9hnwnClaWQn+LIevQgCP+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipkLXvNdeHweYAKlsTO/OaFaBY9BU8+6U6ExXvkUklQ=;
 b=RY1831xsUxhhF8XSXaWoyEGPcXur/JUwN++ll1kd9b4AZCYQ6caShafBB4kilxbeS703PaTT3MZrDEfeGQij184ilxVDR7EVNFcp2GuIFh+kzwAC2qCoOwXMHtaG1PMfSEzlHKTM/4WHqP0xLZx2YTgH3kx6HBoWk4E5ZHyvoFw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI1PR04MB6879.eurprd04.prod.outlook.com (2603:10a6:803:132::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.29; Tue, 10 Jun
 2025 10:11:17 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8835.018; Tue, 10 Jun 2025
 10:11:17 +0000
Message-ID: <55b8edb6-c3bd-4580-8a37-2690e1a35b8f@cherry.de>
Date: Tue, 10 Jun 2025 12:11:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] mfd: rk8xx-core: allow to customize RK806 reset
 mode
To: kernel test robot <lkp@intel.com>, Quentin Schulz
 <foss+kernel@0leil.net>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Lukasz Czechowski <lukasz.czechowski@thaumatec.com>,
 Daniel Semkowicz <dse@thaumatec.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250605-rk8xx-rst-fun-v2-2-143d190596dd@cherry.de>
 <202506071321.Ze0gsxC0-lkp@intel.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <202506071321.Ze0gsxC0-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::19) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI1PR04MB6879:EE_
X-MS-Office365-Filtering-Correlation-Id: 79119085-0b24-444e-b267-08dda8072383
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TWdvakt0ODVicmZFMzhabitzRkx4NXFuczgxaGxHNDJYWFdLQzUzenRxaFZp?=
 =?utf-8?B?Z013UHMrcnhVenRCSUJ0NERTVUtFZDZRZE5IeW44YjZ2Q2FOTFB4VFNuYU4v?=
 =?utf-8?B?dDd3Nmc2TDJYendKNHVHQlIyd3plMlFTL2o2UDVHMSsyYnNvbXBXNzd0dTBM?=
 =?utf-8?B?T0UxNjFTU1Ezdk1lQ0xXMVBIMXdyS1ArSkROK1ZaUEN5OS80WU9lTHVKZmoz?=
 =?utf-8?B?MWUzeHFwUGxBZi9KKzVUbytxNnF3bWlxSG9pLzF0VG9RemRxaEh1K2ZsWldz?=
 =?utf-8?B?VXkzL21ZRVFwVkcrQS9QK1hBaE5NTlF3S1BaNVRsMEtoQ1pJcHJFaHc1a25S?=
 =?utf-8?B?bCtBM0krdHZ3NW50VStLMW10eXIrMVArek9XbHQ0WVgyN2FXWlMwWXFGNE5j?=
 =?utf-8?B?VHE2V2pXSkZOUmJGOC8wRHlyWHNHd3NSS2hQd0t0OVNsa1NZQVNpZGFRNmgr?=
 =?utf-8?B?eC9xc3BDSWw5elEwZmIyOXJJRVYvamNBZjhhYkZLNlgyQnEwSVYyeVNZdC94?=
 =?utf-8?B?YXExUy9sTVpha3AyUlUwQUlLY2EzcFpQalBYbUdGaThrTU5vYkd3KzRBNUNK?=
 =?utf-8?B?OVFVTjR2ellHU3BuazlYcy8wUi9lT2JybnJabHlWdVpYUDBYaGhONlhreUc1?=
 =?utf-8?B?dFdPOGo5V2FRRHdSdmlxalI3UkNsblIvcHV5Rmh1elNFUE45UW84ejFSNlMw?=
 =?utf-8?B?UEIwcys5YmpXZEZ6M3NreHozZGF5UjNvNmxWQW50TEdiZzZhVjBicWM1Mk5U?=
 =?utf-8?B?RWlRaGo5T1U2SklVdzg0ZXN3dU1UTERZRDZIQ3M1QXNyMEQ1bzJLcXlrOHh4?=
 =?utf-8?B?T3g1SWxpNVhhZFh1RFJTMGRkbTAzUDc1WnRoQkU4LzFMUzJEOWdsRlZLejNI?=
 =?utf-8?B?OStSUUJRQkcrOHFQWno4NytRY1ZqanJFM0pEOXJicGlrdmdKaXIvV0t2clJ5?=
 =?utf-8?B?NGFyTjNKaGQ2d0hEQlB1OStzM3VWanFDYXB3UUJONHMxZEdSVHB6dlIxR0hG?=
 =?utf-8?B?UVZ2d3dRK0Jra1htVkhBSDhCQ0pySVBsSEdNTEt5aEc1dXBTd3JOdWRzWTgx?=
 =?utf-8?B?Y2FtL1kwM1k4UitNdCs3bHRqYlppZ3RuMW1hdmZGaXJKczFybm9yLzVWaGVs?=
 =?utf-8?B?ZkhiRlNrOHpiZkVONXljdVpNYVR5QVFkZ1JLN21BUmtiek5ZNG1Cb2JPNVE5?=
 =?utf-8?B?YVBqUWpEM3pWL0VnWUFvaU1RanYzSmh3WXpwUS9JeGtIdk84VnJaTU1SeEl4?=
 =?utf-8?B?enNzc0pORVpGUE04U3F5YzNQZlBHRUVkR21manlLS0tMWmV6RGtZUGg3WG1L?=
 =?utf-8?B?YTZHdkVhQUJncnlPY0k5ZmxaTWdySFBIT3l1aVBLdFEveWNBWk1leDJ2NWU4?=
 =?utf-8?B?MDZjZkczb3lWVHRuQVozWDNDVzRjdFhlcEJjSkZ0VjlyNWtZNjFibXFVK2FL?=
 =?utf-8?B?bjh6SVFhdS9KeUV0SGt1c2svMDc2YThYRkd6TEVYOHU0cFhqY2pXWTJRNXFt?=
 =?utf-8?B?SDZxNFgvTmFkb0tFRHQ2N2U5TTVuc1pLVERTRVl3OXlTeGJYM3JGTkJ0QzV0?=
 =?utf-8?B?QSs0Y2xENjk1L2Q4SEFQRzhzYnhmMm1jVWRIV2NUZHluSzI5QXVQOGxhUWxy?=
 =?utf-8?B?SjcrTVU0RnpBaGlDTUsrbUc5WUxlYmovZEN0eG1EU2h0OE9NQ3NNVEZKaERz?=
 =?utf-8?B?aFZCUEpWZ3BMdEtHbE1uQU83TmlXSVhwWFNqTEUxN1gzNXp5bVpmbXZIT25D?=
 =?utf-8?B?QVRZNEY1ejRUL2cvck1nQ1dreHlQMDgvc3BIc0ZlUDl5T0ZWVnFrYnNpV250?=
 =?utf-8?Q?8Fx16NjhfK0abDv6hb9W2NzVkd7/BaPgYxQWw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWhLR2thbm43YmJKc3dTUGhYME9mSmRTSVMyN010NWt1cVRDa2o2TzltTU5S?=
 =?utf-8?B?M2NueHdhZXdHR296U3g3SjFYc1J1MmxGMTBycHBhZGZ1ejZlcG9TNDhKeDNw?=
 =?utf-8?B?Snh3NHF5UTBVdVdlRFFqQTN6b0ZPa0I5ZTFZMW56elQ2ZVZiWDZhd2pjY2Iy?=
 =?utf-8?B?Q2w4aVRHbGdSYkNVclp1eEZYeFhYVUFNeU9HMW9HZXJUTTNNUmR3SEVFck5J?=
 =?utf-8?B?b1JOK1VkbWVvdXlSbGk3MXRoZFBjVkxQNGlRQkNOWTRnL0g4bHU5SjZYdHpq?=
 =?utf-8?B?c1cwSmh3ajBsTXJnTmtCSlpndncxMzBjYlRmM2xrREpjdlV5dTNvRWlEQ2s2?=
 =?utf-8?B?VzdQN0IyUHczeGlKNVJoejBUNTFxcVlhLzlWTkFxb0x4TzVYL245SHlVeWpa?=
 =?utf-8?B?SmRvSGg0cUJscC96RGNFQ3kvUHhZWnJ4UStScXpXNDJlSGxBUG12WnJYRlBG?=
 =?utf-8?B?YThsUzJVTzBvN0J1MW03cHhjRGF3YUZhRHpXdENybTdjL0RXZW1hbnJmem54?=
 =?utf-8?B?blcwSzR2Vy9OU2hlanhIazZKYmNzR21keFZHMjYxdjdkRlVmcUdqbDdNTDBH?=
 =?utf-8?B?ODRPR1RYYlB1bnFURm14Z2lGMHhmcDBOSFBDSnRiNHdBZXNwL3lpSTFJc0wv?=
 =?utf-8?B?SU1CVzBwWEVPQ2JFOEo5NThObnhwOUlvSzMwaVpISW54N2pWVmFsVnJNZUhs?=
 =?utf-8?B?MFNDY284bVJxUGR1ZlNQaTBKUzVkWll6OWoxQzZFMUwrT1JrMGtyK2pqNm91?=
 =?utf-8?B?cmJPVUdvVVJsRDAvOWZyMkFTKzI1b1hZZmJKS0FnVkxjUndKdDNwUXFIN0Nn?=
 =?utf-8?B?MWJ0a0VVamJYQnJZNXdYSkZkY0VOMVlhTGNMbUtFTFFhRVZKMzh1M0ErNUtI?=
 =?utf-8?B?T082VDQwdERwakt0a1MyaUFncm9YQm9TM1daUmwvdTFiclBSNzR5djdxL1Fh?=
 =?utf-8?B?SVcxaDJvVmhQU0s1MkJkakxZWHNQekoveXZMSkgvK0ZMRCtxTWkyNWxTVllk?=
 =?utf-8?B?VUFmWG93Nk1NbjNJOUc1TlBJL2xGY2lzVEF3SThZWm9hNFlkaTZjV1BCQjU5?=
 =?utf-8?B?dkh1RTRKcjF2dVJHbkQ2K2JGbU9pTDlEZERIV1YxRXUwQkl0WWFWZlVxY0pO?=
 =?utf-8?B?UDRDWVFpYjhCWUQxc3NtVjFTd2lCdElsZ1Ryc1V0dWEza2JXa3loR09HblJE?=
 =?utf-8?B?R2xHOXRyN05FVGZZTVE2RmsyOUdiSk1VZk9nZWpqWmVoVkdIbXN2OEdmUmZ1?=
 =?utf-8?B?UTYwK0hHcmgzL3Y2WlBhTWV0MTl3clB6bUUwMUlqTUpHREYwYjM1aFZkRmVR?=
 =?utf-8?B?d3hCVnhXZ3I3aGdYQ3hjZDQ2VFBIcExTazhRbEhEZ2dzc3d5TFIrellaTEFZ?=
 =?utf-8?B?TWcxZ0tnVnJpZ2ZQQllhajVWalNpWnQ1dm8yVThSa2pxemtXbUZ5dHNsMy84?=
 =?utf-8?B?Skh5L3VCazlGdVdPMVVFbE4xRWo3QTdnZ0hMM0J2ZDRJeEpySlQrbkwwNlhB?=
 =?utf-8?B?QTFsSTFkVTVxNkFhL2hMMDR5UUR3RklKSjk5R3ZEME5tV0VmYUh4dEppL29D?=
 =?utf-8?B?VXVGMmNHQzdsdDFpUWlzZWlDWmlBekNxanpuTGs0aWQ5SThhMG1mRWtsZXZi?=
 =?utf-8?B?WkgwZG52R0ZFV2lMSVkxUkVkYjNqSW81WlJlNnlQMFk4WG1yWDVac3Q3WDln?=
 =?utf-8?B?QnhjZVgxbGdvM2x6SjBVc0dPK0dCWWJwR1VUaVhjZ0M0cUhYQzdONHhoT2Qz?=
 =?utf-8?B?TS9abXExQWZ2UXJXeVhCQmU4K1hUVnRmKzdpUGRaVWlTb3hhRXM2UDAyYTli?=
 =?utf-8?B?dE84REF6eHZYR21RTzVGRWJUUHJhaWdJQWlnbmNpRkQ2WHAyeER0dGJqTURX?=
 =?utf-8?B?bUFyejRLY0JtNG5SL3Exb1ZpWlg3Nm5kU1JtVjJ0cUR4czNRbEVEVGlZVjZN?=
 =?utf-8?B?bm1sRmNZenNLK0hjRUlUVWFRZWttSFVzY2JCY0VPTFM2MDFlQm9ybG5CY2l0?=
 =?utf-8?B?U3pQNjFFamJpdi82Z3BaNVJzZDg2Sk1kRjAxNmQ3MUYzL1NkVnVEeVZwZUdY?=
 =?utf-8?B?UUlmdm4rWTFvQ3FQWittS2hocUtDcGc0NUFFOFdmM0lpTUprR1RIMlIvdUtN?=
 =?utf-8?B?cUxoMnE0QWdqZXFES3NKUDhqS1VWVUFyNDhoTy9nNkFSYU5JR2NSbC9GcUo4?=
 =?utf-8?B?VVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 79119085-0b24-444e-b267-08dda8072383
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 10:11:17.5151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tZZfxOCywPyvTwY5h/OVasWGgDEWUWVmALQBoT1lMzaJqPEp8A0XrTJtBvtXFJI96vVwWYAEOMWI2BCBDkwlj8rnHLQpV7uVTtdxI3et0dU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6879

Hi all,

On 6/7/25 7:46 AM, kernel test robot wrote:
> Hi Quentin,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on ec7714e4947909190ffb3041a03311a975350fe0]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Quentin-Schulz/dt-bindings-mfd-rk806-allow-to-customize-PMIC-reset-mode/20250605-234243
> base:   ec7714e4947909190ffb3041a03311a975350fe0
> patch link:    https://lore.kernel.org/r/20250605-rk8xx-rst-fun-v2-2-143d190596dd%40cherry.de
> patch subject: [PATCH v2 2/4] mfd: rk8xx-core: allow to customize RK806 reset mode
> config: arc-randconfig-001-20250607 (https://download.01.org/0day-ci/archive/20250607/202506071321.Ze0gsxC0-lkp@intel.com/config)
> compiler: arc-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250607/202506071321.Ze0gsxC0-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506071321.Ze0gsxC0-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     drivers/mfd/rk8xx-core.c: In function 'rk8xx_probe':
>>> drivers/mfd/rk8xx-core.c:740:42: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]

This should be simply fixed with the addition of

#include <linux/bitfield.h>

Though somehow I cannot reproduce the error locally as I get:

COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-15.1.0 
~/work/upstream/lkp-tests/kbuild/make.cross W=1 O=build/0day ARCH=arc 
olddefconfig
Compiler will be installed in /home/qschulz/0day
lftpget -c 
https://cdn.kernel.org/pub/tools/crosstool/files/bin/x86_64/15.1.0/x86_64-gcc-15.1.0-nolibc-sparc-linux.tar.xz
/home/qschulz/work/upstream/linux
tar Jxf 
/home/qschulz/0day/15.1.0/x86_64-gcc-15.1.0-nolibc-sparc-linux.tar.xz -C 
/home/qschulz/0day
No gcc cross compiler for arc
setup_crosstool failed

But I'm pretty sure that should be enough to fix it :)

Since it's a minor change, I'll give this v2 some time on the ML to 
hopefully gather some feedback before I send a v3.

Cheers,
Quentin
