Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2073.outbound.protection.outlook.com [40.107.21.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6140A1514E4
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.73
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747914367; cv=fail; b=PSCr7qOw2Vh76meQi17UAkIlq/BkzGftq/j56kh0WiY246Xexup2tkNGpwcOQXJZeWD5OqUnulRN/1nT3vfOFV+kdzd8hDOb3QAYMFOgvJ4HWQCuL6eG9hfTdm4by+QG9jgnt0xVbf1KF9sjEMinuorOWu+jMow4Tmr0NvqA38g=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747914367; c=relaxed/simple;
	bh=WdXGzShLzMs+h4hc++q7z8CLwHu+oUUFo2AgtozKXa4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KYF4BQJ8zSTK7x6gv8ujPxOvPOF9vzPhrmzBmpT3wncN55Q6086QjIYXfgX+xjAQNnaK0dE4saIkl9WLXNhSlSMYOy6rc7BVhDvFeIbsmXDYAW4NTiYhdB77uxJN3ZBVr8mx9y9B3kkmjgAuAv81caa8VUYeKfwhIEsrYXznMLw=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Gqaoj+VE; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Gqaoj+VE; arc=fail smtp.client-ip=40.107.21.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Gqaoj+VE";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Gqaoj+VE"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Y7sHPQpuxnZfKpWutnN9/XSoD61hJVQOKGDkw9eIM5vS0COod7OFvw5hQbNhL4hgRBIUcLJKgOz3gIoJ1yL3mWRIO6Pai9JezeAnKYfXEWNyU98T39oFw9vRXvT3oLth1YNz9mTeddilXMYAw27BzAle5KwKy1kG4YihF18GyFQbZejWsVDYKrqSIf1UeGZpY1uykj3KpHWNliTus2Js2YaK/UbZIasvtpJFgck5XgIOXQxF5UXaGsv7kOpjQpZOcNAOhJKWFD/rRMlmYNXCeIvHDsiWnFTp3LV87jYPT6kWnwlOvX50Ecw6YcTQvOtffIHsyLOs5HULZy100z0IeQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPpwDBiNYcwDjKqyh6XNW+OfkygeO35Yq/4HGtfrIr8=;
 b=ZEgyLpL+0lxmPl91aPU3lQboMMg5XD9pKYgrffTjqswMy5mkflSa73OuTseEmX47fX9ROp94w62Yix+kpuoyKM0/1Fc6baO0Yq7Nzq3WARBrkDQjWIqzgbUC2x2X8CAYissHmGzTEhA2BDLbw+uj7RVQWfKoW35qRlDTq+U3kgh9Mwgah8A43WhLrYi1Ff+skoyQZXgIpotIjYM+8VzUZZFMcdoOp1GJ/AxsNQrK0zmTZz7D7GEI262ud+RHadUEbW/HCY6Uwj9dviHCJJFzVR63hlLIazM6veLQBCBKjqSOad9w81CqgtmhDkuBfpT8r69k9s7bIE9RMXoYjAWNVA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPpwDBiNYcwDjKqyh6XNW+OfkygeO35Yq/4HGtfrIr8=;
 b=Gqaoj+VEVvp17ltez91azB99HJEVrjmcCAE+fT+8KHHskqyZDXB6S12aA4YPSC5D8w/gbOJqOa3HYCs0LXkdqW+kw4DLn1X30IR1qx+NmFFu1dlu3WbC4DFphC2pyM4PTVhMEGmIsBIQU3cumE0tou/EIsKok6tFkRMxQvf6fBU=
Received: from DU7PR01CA0047.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::24) by PA4PR08MB6142.eurprd08.prod.outlook.com
 (2603:10a6:102:ee::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 11:46:00 +0000
Received: from DB1PEPF000509E7.eurprd03.prod.outlook.com
 (2603:10a6:10:50e:cafe::b6) by DU7PR01CA0047.outlook.office365.com
 (2603:10a6:10:50e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Thu,
 22 May 2025 11:46:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E7.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Thu, 22 May 2025 11:45:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Et7i2G/p8lkDPLRbRcFdJAzydI+zYeAxEGfkLsdg2CnDhDHKA7021Yma7w3dzcfuOHGraWsGBhMX1gchN20aQuergp0huPVriuliw1E52En3zZwrfN6YvduVaOO1cl7eD5Dp7GVDVwI0y/sXHftecLFsjh/eqNn/Ma1es5zL9hjDMmQe4Fjjjv6jE+qaxAQYYuIvzG0lPfSSipwpC0J5Fv3gc8EjCe0sx57tWOd4kbV7iZ0oHDGfYjR3uutSWBY4qHe4fAtF3Q4Vg6ds0bRwU0ek5DkR2PnfB34SN8Z+e5GZwyrL5o5jbzO3oKfRxHbe51RiHRyLR6lvlV35WSAwcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPpwDBiNYcwDjKqyh6XNW+OfkygeO35Yq/4HGtfrIr8=;
 b=tCzQ1w71Ia9spZSaxYbKuUsulpXETu/miK+VwBVe+UvohiTZ2gPdHwMJgDRIUU/BAUYGEQCDlpuaRS+jC2f+SKlXZ+BEIzSNXgUODPvrJtCx68hT/JZ7PFU5bPik9VmeaIrARb/Z+XQFG6EXUIQgYRW+ZatR2pf6/ByKTbmx9FfTGVhjf2vmTbo36tTwEZdYNmQtXhz6TKltMyX7jjhkCs7oqTV9kLjhSirMGBfh9p/cpmljDZnGPtRk8XtHpbaWfFHCiwzntpZbzmqT7cGzqUrXFSGY8ArHW3JhiLTDIspKGrTrIee3xqJU3TbFjhZqXEGCEls5BA8ZKYM2iJ6Mxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPpwDBiNYcwDjKqyh6XNW+OfkygeO35Yq/4HGtfrIr8=;
 b=Gqaoj+VEVvp17ltez91azB99HJEVrjmcCAE+fT+8KHHskqyZDXB6S12aA4YPSC5D8w/gbOJqOa3HYCs0LXkdqW+kw4DLn1X30IR1qx+NmFFu1dlu3WbC4DFphC2pyM4PTVhMEGmIsBIQU3cumE0tou/EIsKok6tFkRMxQvf6fBU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DB4PR08MB8127.eurprd08.prod.outlook.com (2603:10a6:10:382::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 11:45:27 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 11:45:27 +0000
Message-ID: <ed0628ba-494d-43a6-8436-55f2ffc0f2c5@arm.com>
Date: Thu, 22 May 2025 17:15:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] arm64: Elide dsb in kernel TLB invalidations
To: catalin.marinas@arm.com, will@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 mark.rutland@arm.com, anshuman.khandual@arm.com,
 yang@os.amperecomputing.com, wangkefeng.wang@huawei.com,
 yangyicong@hisilicon.com, baohua@kernel.org, pjaroszynski@nvidia.com,
 ardb@kernel.org, david@redhat.com, Ryan Roberts <ryan.roberts@arm.com>
References: <20250522114414.72322-1-dev.jain@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250522114414.72322-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::11) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DB4PR08MB8127:EE_|DB1PEPF000509E7:EE_|PA4PR08MB6142:EE_
X-MS-Office365-Filtering-Correlation-Id: a5aecd9a-2905-4533-19b3-08dd992638ee
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?L0FmbmNQaDhGMzNXVnRWTG91RUdPU3RjcS9ZanhZMFNQYVhaSUNFOVQrd1k4?=
 =?utf-8?B?cll6VG5PNUwyMDFueUhiaWd4SlY5cFBQWEU2TXM5M2NqY3dKWS9mU1k5WmJ2?=
 =?utf-8?B?aEZTVk13dUYrN3JnV0kwQVg4Y2tVYUt2UHllTlBFQWdsYXZndWszVldvK3RN?=
 =?utf-8?B?SXRnekFLZEo1ZXZGMGlOa0o1dzhYWVVYSHN1Q3ZHajlGeUdGemdyYkF1YVpq?=
 =?utf-8?B?ZktCdUFXZDh1QVovTnBtQjgrNzhLS0xBaUk2LzNBSmpHRzNEN3h0bk8vYjQ2?=
 =?utf-8?B?dEtHY21kS0hndHpzUmw3YVVSMHJTMU5kK1RudWNOeVFMcE9JN09uVnI0UXl6?=
 =?utf-8?B?cm5nc0ZGcUM1QmZ5ZUV1ZjVEZ3hTM05GSWw2WlNqMFNGcGZ3TTQ2V3Z5RlUw?=
 =?utf-8?B?SVJwT28wSG93c0ZGZFF1RWZOSW1XWjF0cFllVHBKdkZERndDcUx6REVwaGN6?=
 =?utf-8?B?WVM5MTVTTUE2VGN5T2J6cFpvYzh0SlBnUDUwUnkvcGRSQjI4dVE3SlNDaU1L?=
 =?utf-8?B?R1FFQkh4M0J3dlZpN1l5TzExTm12Q2xIZzhGNHlVVjUzT3VoZTNISHdhZHl4?=
 =?utf-8?B?TWpxbUtEclVEODRxNmRpMXhodjlySi9BWjVCSnVETXdNckd4NkZ6cXQ0Yjkr?=
 =?utf-8?B?TVUrRXZwd2h1bUlBSmhKNTExR1F0L2hRNlpNQks2Vk9Jd0wzTnJvc0VKM0RZ?=
 =?utf-8?B?aC9lcHVMdlB1OWRMelNvZjNMV2NOWW1WcUlCYjBhMWg5ODNXTTFFVW05eDNV?=
 =?utf-8?B?OUFaejZyZnVhRmRlVUNkVVhENDJhVjJVVE5xcHI5WncvTWZGck4xblhlY0tr?=
 =?utf-8?B?QUpKcGRoUkdvUnlCR3V3SWYyaEJiaXdTVUJmTHVvdmZkWFI4MmQvVXU2Z1Ra?=
 =?utf-8?B?R0d1UWZGaTNIRUVoM3pXemdzUno1cU05cnpuTktUaXhvNElnK1FiaXZJaUVz?=
 =?utf-8?B?U0ltNTRnVnFhSWRtdE5uMnVSR1NPT3hFU0RtS1E5bXc5cFVCZ0gyQ1dUS1lH?=
 =?utf-8?B?ZDR5NUsvQllDQm4rb0dIVTlpYTVuSHBBdkw0eWJZZyswSnE2azMvQ3YxcDVk?=
 =?utf-8?B?a2k1YW53dHl0dy9Mbi9GcHNyMk5CMnd0U1J3V0tRa1o5VHNuNk1uZ1o0NWZr?=
 =?utf-8?B?NkNNM3lIV2NtS0xPZDBSRVpwVERPemkwVDNmWnE2Q2t6OURYN0txbno0aUJo?=
 =?utf-8?B?TlAyU1NxSUZnTk9JeDhyVmZGVWVZWjZydGFjUGdxOGl6eDFBODZYOFRqTjls?=
 =?utf-8?B?YnNNZWdLR0YycEVEOFk4R3JMUk01akp2dmV0OWhKMnhPRXViMDdMMkJSRXdD?=
 =?utf-8?B?UWlFc0NVTm83NjRWUkZjMzRObm1pL3plMTNFQ0VwQWxaYjRPM05pWlQ2ZVY3?=
 =?utf-8?B?d3Z6M0VHK1llNGtiUTY0SUxHOURWY3dNVkEzQUpUczc5TnB5RzY1d01kWEJi?=
 =?utf-8?B?K21Lc2J4emoxQlBNcWs4cG44VStUZXdncUovNnFBKy81ckQ0K0Y5TzZqdTYx?=
 =?utf-8?B?MUFwVDdMcTV3b2lwQlFxV0FlUjk3SFpsNm5YRUxaU1FHQW9qR0pHZzdEcE9t?=
 =?utf-8?B?K2ZJQU5WVzN1cjhsbllPUEo1Q0xPUFRCR3ZvWHRHa01ocGMyU01uUTF0UHZ5?=
 =?utf-8?B?ZmdqU0JFelRsaWpWRXdQMVpUWHMzSnlyeW5xTXh2QklwakZOMHQwdFJ4cHE0?=
 =?utf-8?B?bXFJMDR1TnI0bTRzSlYrYkl1TVdFWlYvUGtvOFVtdyswdEhiQllUMVY2Um55?=
 =?utf-8?B?OVlGNTQ1ZmE0eWxBY3F4Sjh3eDdJWUVuOG9UNXg0RXRhN0Zramp3NFNXR2Zl?=
 =?utf-8?B?Y1V2VEU3V2RvakJQTnJTeVNGaTR2dGtZV2xmSzNUTFVtMEYwN0g0Qi9sVHBL?=
 =?utf-8?B?RTZuelpVQ200dTFlRkJ2SHlBTTZvb0VTZ1VnWkdYeU52N3BabjAxbUtEM05R?=
 =?utf-8?Q?TcA+PGcVyxo=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8127
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E7.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fa11bbf6-7031-4f1c-1ff7-08dd9926258f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|35042699022|376014|7416014|1800799024|14060799003|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aDl1RVBCYVZUeTZ6dGE1cXJLTGV6QXpyTDFzWjRmYm1WSW44WGw3aWJscU0r?=
 =?utf-8?B?T1JQWHJuWGZ0cTJRWVV6aVl4RzNFYVhHbE9mTkxsL3RZOUorZkdWS3k4cEVp?=
 =?utf-8?B?OU0weTQ2b2JjSElSZ1lvZHpVanFtMHF2S3NQVGpOVWZ4QkxHOWNoZUlySXh5?=
 =?utf-8?B?VlZsVmNTZWNQUUY0OFdqckV3QStLcEU2ZlVxMTIwZU5yZjFJTGx5QVpzb3pR?=
 =?utf-8?B?d3dQOTVWT1hvVVZPV0hWaHJ3N2FtK2hWYS8waEoyRmUzOE5PYWwxQ1BCa0VE?=
 =?utf-8?B?NUtvUlB3TVkxTFlPT2VydkF3dFkwY3NCekZpUFQwaXMzVG9FWG5yN1kxb3c2?=
 =?utf-8?B?ZTVrMDYxWGhXRzBLcy9kQ3NHY3RoajF0aUR4MEg3ak1QaXUwSWhsVTF0eTRu?=
 =?utf-8?B?K3Z5TlRtL2pWbURvbzJwV0tKMlRDMmJGUktFdUJiTnBhL044bWRFQWxENjdX?=
 =?utf-8?B?cDI1cVU1UEJ5dFNiOU91bk8xaHkvUUUyR0k1a0N0QzdQOEpUTXZKMU9aaGFQ?=
 =?utf-8?B?aWhrdnZtMHZGSzVpNVU4VU1xNXhOY29KYkorYjdWaVhOaG5ISXhDRCtSZVhI?=
 =?utf-8?B?QlNNRVd1aUEvdndQbHlkQTQ0MEYwZk43endGK2pFZmdQOEFacVRIR3UySHNV?=
 =?utf-8?B?M2JGSFowYlNOdnBxK0YyK3czUm9NY09wR2lReENaems2WDNvV0l1L0VKczE2?=
 =?utf-8?B?TVpzNGFFbC9Lc1g1UWNsOFJiQjVSdnVSVnYxUG9FQnlxWVc5cGZ5VFNoSWRj?=
 =?utf-8?B?U00yWWY3eVJGMCtFNG85V0Z5WFBZREFOQksxSlZHaFZvdVBQYkQ1b3dqU1Vm?=
 =?utf-8?B?L0t1R1I4KytqREtISVJCcWdtL09pMGErK0NSbjAvbTlTTGxkc2xIaUhNYlFV?=
 =?utf-8?B?YVRyazVRQXJNdFYzNDhVRERNcnJmZkRpdkRTSVlyRTZtdDlkK2RBekhLMDls?=
 =?utf-8?B?ZUNXTkhDSUluRnFaM2xzZ2p4VFNlQldTZVd3Ymh0UFZYeG9CM1hKMzdpc3Q0?=
 =?utf-8?B?K0dHMFNLbmxZNDI3andXbmFzYjVxRWt6WHVLeFpYRnRrWlk5am0wTUprdmdi?=
 =?utf-8?B?SkFmK3pXVjdJL3FwVTNhUmdHVjVQU0tNK1ZFMVovem5EVkkwdVZPcWZiYk52?=
 =?utf-8?B?Ykl4ZUZEdjZ2VjYzaTRvQ0JsMnNlSXg2cVNESTkvWlAzMXNZRmxaNU9Kckhj?=
 =?utf-8?B?bk5XOHlOOXFPT0NiVTVCdi9IcWF0Y3VMZTdrQjZ3QTNYVGVBUjZZUWFPc0FN?=
 =?utf-8?B?VkxKUFFZTWhXbmxrcldmWVJiRGFoeGVQU0dzVmNLSkZKY29zRXV2anFaS2xD?=
 =?utf-8?B?Y1EvMFdTK0RxODhjYWk1ODJzQW5ScU5EODFwYzdkbTJMNlhMaFRYbldyK0NW?=
 =?utf-8?B?OFJJWkFkSk1XUmxHOTd0ZVJDYUl1NUs0TXQ2QitweHRyWEc4bjhkM2FDbm9j?=
 =?utf-8?B?aVVRZFZTRis1Rk9PS0lpTzRZWG1MelhnSWlvcU9McnJjWlRPSURnQVIwL3N0?=
 =?utf-8?B?SmxCV2xVWVlPVkxVa0Q5N2N4WEZWd0N4MkdjdHJPbnZwU3Q3dXpHaXIxcDcy?=
 =?utf-8?B?a1NpVEhjRU8vMko0a1htcGVGS0NqMlZFa1Vwa3U2Ylkxb3FaR01YeUF2Tmtt?=
 =?utf-8?B?c1IvYnFMTXc3ZG5RMEk5QVp2YllXLzcwNmNPSzAwejdqMUdlOEloRlJBb1dM?=
 =?utf-8?B?Rm5WZkgvQTJZYjEyQnZCWW9PWkJLSkxyYXFHU000dXBadkFnYTZQbVM0WXp5?=
 =?utf-8?B?bDVqNGRac2JpbXNycFVPdFNTbnRja2pmZzdVNjJiRkN5NE5ISno1TVoyclFr?=
 =?utf-8?B?R2k5UlJNRGVBaFozeXREK0xWWkVGb0M1RkE1QTVMR2NvWVEvVlIxWVpDTmlh?=
 =?utf-8?B?em94NmhpSFR0TWlKbWZBeXJ5NUp6VUdNWmlvK01LcjlNbVRERHM0STVJSFRH?=
 =?utf-8?B?a2ExRU4veTdsRnZvUTFGSnlVVGlsaXNjV3gyRWNTTXlqVk4zQU5zcHVxRHRR?=
 =?utf-8?B?VWRKTnd0Y2Q0THNFVklsbkRuclZRTm9FUWFsTGlzTFkvY0ZYNGxMQmphOEhQ?=
 =?utf-8?Q?/FQGuo?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(376014)(7416014)(1800799024)(14060799003)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 11:45:59.8401
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5aecd9a-2905-4533-19b3-08dd992638ee
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E7.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6142

Forgot to add Ryan.

On 22/05/25 5:14 pm, Dev Jain wrote:
> dsb(ishst) is used to ensure that prior pagetable updates are completed.
> But, set_pmd/set_pud etc already issue a dsb-isb sequence for the exact
> same purpose. Therefore, we can elide the dsb in kernel tlb invalidation.
>
> There were no issues observed while running mm selftests, including
> test_vmalloc.sh selftest to stress the vmalloc subsystem.
>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>   arch/arm64/include/asm/tlbflush.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index eba1a98657f1..9b4adf1ee45e 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -508,7 +508,7 @@ static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end
>   		return;
>   	}
>   
> -	dsb(ishst);
> +	/* dsb(ishst) not needed as callers (set_pxd) have that */
>   	__flush_tlb_range_op(vaale1is, start, pages, stride, 0,
>   			     TLBI_TTL_UNKNOWN, false, lpa2_is_enabled());
>   	dsb(ish);
> @@ -523,7 +523,7 @@ static inline void __flush_tlb_kernel_pgtable(unsigned long kaddr)
>   {
>   	unsigned long addr = __TLBI_VADDR(kaddr, 0);
>   
> -	dsb(ishst);
> +	/* dsb(ishst) not needed as callers (set_pxd) have that */
>   	__tlbi(vaae1is, addr);
>   	dsb(ish);
>   	isb();
