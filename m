Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010004.outbound.protection.outlook.com [52.101.84.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D49B17BB21
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 03:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.4
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749611020; cv=fail; b=gtdYtlCNkfU/0u1Cg8OSNCbzbkiUNKXt35+nGpY8BXy0TfTuRxtNjOHMb2gK2rCzhhHOBuw129Erkmn94ksO9Cko49IkzBEx7hk3Kblqhc+AnuxBi3I91f3nJw5Z9tFePz6Qp1fq12MbT63MwgYmuI5NDGJ/0wIis/ZQqo75TI4=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749611020; c=relaxed/simple;
	bh=fNIuc/v2V6Vx/gSdFKmxffbsVY8gfAxPgZyW7iVsAto=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SsQKhpGqZvU/l8zJ6mw+fLhe1Z3BZHwqa6zHGwjokmtPyOGeNRjIsq7hoh7LhRMhPg87mh72IWccX8faZexpKA/J5wAhCzaHTeBS2Xc81em7nnu40bvmx1Qrd2l7EchvVWXxfxaZil4nSCQKBznWIOYPxXw1EY6plOzX2LjdYdw=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ZuaiFoBj; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ZuaiFoBj; arc=fail smtp.client-ip=52.101.84.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ZuaiFoBj";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ZuaiFoBj"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=oVIbj45Vrlc0LhPX5RQndHPVIJslKPXm+GGPlbGrMj9hDMm8ortPlCKIXUxOmN/7Ec+xB9Psfgb4NsNDX+lZpXJWvF3ydWLuPz/uBLnSw5+E4cuPi5lAL7JLjGnSes1JeKtRLlDorRT/yFAwJMxq9fAzpwPnEQyklQ1A4nR8fQwUDt+wiSMazMsqMqVfbCYtNW2q9EXWeJ8jSJPcN1wbWQiHh+m9rFcPw5mAxwxwNMHKquRvSENFpMWYMh5oHO73BCm40NEx+FKo6eNconGzhNytRYqIb/tMtfTZY6qEDtYjU1sNBgPueYgISVCAvQLob/FrDHjqfJkhsTFoizwXkg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YpWpT1l4Mz3XZqS8+bbqElciBU/6ZhacaPmz43yF7z8=;
 b=ROXpGmFLO3BZZS7wiIuHYe51XRQlxXaYF0kIFarpKNzHbZzV76jBTs5YlapasJCUV9exAb0wKdCaKkyFgpFK2AMyMFN7GK7m8XsLSZK2F/ivPAfct81zOaB1eG32Oqtsr7dyc2VQ6Qz6FaNxPaZZ+GF9ZsYwaglUDgRihxPXBZWrBQhFuxo5PA/28Xf5d01dCJ5FnX1Y2QjR4G/lYRWGfv9hr5TY1B276FCTdevJkr9gByL3RibUdQv8Rr6VIvT6TgPjOoc2paA5UiYU9oWCyDA+mV02rAtgrarjlFf9s0aKAbyid8iOEuLrCWzEm6aZA9j/3vBMLi2oVUhl1MJYGQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YpWpT1l4Mz3XZqS8+bbqElciBU/6ZhacaPmz43yF7z8=;
 b=ZuaiFoBjp7qaf9peNvAkjiX5spdc3KkZv17k+SfatlfLIUr0B5KNeIo91l19is+IN2Eax3x6wVd1xcvswvS9nEIPq8NJji2/aJ7BVMKUwlljZKsX7GuZ13OAzlosyguSYCXvxMzb4Kv+o5WztJXjkajV6QiiXD3mGX977T6riqA=
Received: from DUZPR01CA0224.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::20) by DBBPR08MB6185.eurprd08.prod.outlook.com
 (2603:10a6:10:207::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.29; Wed, 11 Jun
 2025 03:03:30 +0000
Received: from DB5PEPF00014B8A.eurprd02.prod.outlook.com
 (2603:10a6:10:4b4:cafe::d4) by DUZPR01CA0224.outlook.office365.com
 (2603:10a6:10:4b4::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Wed,
 11 Jun 2025 03:04:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8A.mail.protection.outlook.com (10.167.8.198) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Wed, 11 Jun 2025 03:03:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AsKOGl3o9+Uq6Jwgu85L/+f51SUJNJlC1Ls+fO2vGQanEc8Aeyb5ApIwFqUgCO3P3YgBl+EShGwLmY1kX0a3mppaB8dSc3j2EGMKp0C/6r4ZXNsWF63T3shBQYSp21dAIjTi6/jtHtScTIS1Zus2Vt6o2hboGZtd+sezoBFGNXCtafHshihZOzlKcQV/FMg8OO2s9Ct2htSMlN6WIhlwZBtGeTCgk/+pD3rGYJ8Ke3JTW1QQ8hZGqGF5IG/Gt5+4Cpcy9C6JQfu7zYfiDALwEPOrTh1FtrXBHZzYFsuVSZr0kyczKMNkdzbtkzcDJaxKYBhs5yl5eNHSiTZQW18wGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YpWpT1l4Mz3XZqS8+bbqElciBU/6ZhacaPmz43yF7z8=;
 b=lVK7noMGX9opotLXc4JGMPkKin7R4vA9F58hhBwj2OioleKTE5TYtcbcFRvoh4OwDAWNwMB0CI0IQZG3ODD51thsttDTBTekO+KAa6YMMjEhF3W7lRtSrd2BDa69EJaCPY0G6dkOox0SOzOFtmmoZKg/S9/1Kh/RJMk6c9qOGrzPe4M1aBcV+iVLmWqZOffBGBCWtA7g/wv82BHlNbAD7kOCLYfwZFLz/WL1TPz+gXXzNlPLjpTlXuyL+jUtdxxcdOlOVs2Dqi3Z4c4Ilf22dGGFi81g49oUjUIWU+WrNM0yElnPIGSjCj81sSo4WyO0GTn239NZyOWIpvRdsC2E5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YpWpT1l4Mz3XZqS8+bbqElciBU/6ZhacaPmz43yF7z8=;
 b=ZuaiFoBjp7qaf9peNvAkjiX5spdc3KkZv17k+SfatlfLIUr0B5KNeIo91l19is+IN2Eax3x6wVd1xcvswvS9nEIPq8NJji2/aJ7BVMKUwlljZKsX7GuZ13OAzlosyguSYCXvxMzb4Kv+o5WztJXjkajV6QiiXD3mGX977T6riqA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by PAXPR08MB6733.eurprd08.prod.outlook.com (2603:10a6:102:15e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Wed, 11 Jun
 2025 03:02:57 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 03:02:57 +0000
Message-ID: <1cf5e639-dcf8-492b-9164-493ee45cc0ac@arm.com>
Date: Wed, 11 Jun 2025 08:32:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: Enable vmalloc-huge with ptdump
To: Ryan Roberts <ryan.roberts@arm.com>, catalin.marinas@arm.com,
 will@kernel.org
Cc: anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
 kevin.brodsky@arm.com, yangyicong@hisilicon.com, joey.gouly@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 david@redhat.com
References: <20250610160048.11254-1-dev.jain@arm.com>
 <e10d0c8f-c86b-4e26-8006-f38734993796@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <e10d0c8f-c86b-4e26-8006-f38734993796@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0048.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::19) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|PAXPR08MB6733:EE_|DB5PEPF00014B8A:EE_|DBBPR08MB6185:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fbbc9d9-05e0-4122-b482-08dda8948b56
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Wlh3ZmwyTnJXd3dWVGJLNGE5VUpRaE1QQkxBZTd2SmVVM0psUld5ZGVleTgw?=
 =?utf-8?B?WTdRSS83RUZCYW1veEcrMjZFbUIwWThOcUtkZ0E0TXdaNm5MT0ZkSGYvbUVq?=
 =?utf-8?B?K2Y3cGExREsxYVBha09tbG5jMjVIaWJaTEJ4NzhaWXAxaUZ2ZzVYdFdiZ1pB?=
 =?utf-8?B?N2FManhCOVlVYmtaY1M1UTdPWTVOS05tWjRPZUZxL2ZjUUtubzVBUU1teXV1?=
 =?utf-8?B?WUptUzdHU3ErY2NKNWRpWEdPME1JZkl6dThSaXJTNWwwdkVVQitvWjRUS0s5?=
 =?utf-8?B?alZTWmxOZmx1dEVzbEgyTHJnbkdDaExKUGFQbCtnVm5Pdk1HRllUdUVhYmgy?=
 =?utf-8?B?TFdiOVRDZDl6Ui8ySGZNMzdEbU4vRHlUb29CdytVWHJRdzhHS3U1OHEwREdM?=
 =?utf-8?B?Y0Y5ZTgwUWVWZTBrWnJFRFloMmo2cWtZcnhkaEwxb3ZSdlFEZVQyNENNVHF4?=
 =?utf-8?B?UHFHNTR6dDBmUVVUd0RJMWV6YWFUcXg0OXpsY091Wmw3T3AvRU5RMlVHbnlT?=
 =?utf-8?B?eTRCT1hJYis0SE9BYkFIb1VNOGRlUll5cHBtOC9KODFZU0d3OHliTVVHV24r?=
 =?utf-8?B?M1BNd1RSeFhtWU1rL2lvQkxSdmZmMVFrbitxTS9GYUV6aWRrMG5qanVKUHRE?=
 =?utf-8?B?ZkNGNU5kQ0QxUW03WlpUbTl3L0ljR285eE9Oald0ZGtDR3N1dElua05hVGlN?=
 =?utf-8?B?QjAxcUg1SjFSNjBoQ0lrZmZVSmlzQW5ZMDFzYnF4RDhEcVo0U3FFTHZQSmRN?=
 =?utf-8?B?a3RxRGJBN080NWQySkVHNUEwM05oVjVmOTJRWWdzUWZyaG41ZVprYU5LTHo1?=
 =?utf-8?B?ZTB1TnZ3SEpwY1B0cHV1TUg1TDd1eDNwbzliVmdhNmZKOHRBVE9mRmE4R1hy?=
 =?utf-8?B?T2tjVWFDUlJ1anJJYytuOVk2T2NrS01EZ21XQXdTWWJyVVZTSENaWEZxR1hZ?=
 =?utf-8?B?QjR2dzhRQ2VxSnN0TjNOVk0xbjZEdHRCMnUwelNkeThGRTJOUkxiZlB6Nm5F?=
 =?utf-8?B?Z3FIT2FHUVRtM0pUWlNONUFBa3Y4MnNTcXhRbVZ4ZTRUdndUNmF0Vks5cVQ5?=
 =?utf-8?B?bmFpeTJoK1FZWUFyTytiR2E4eEJvcnNHaFU2aWxWTWUrbEh0ZmpvQkJuRnVK?=
 =?utf-8?B?dTZOaWUraGhMaGM2Q2FjT2F0V0tFMklSYzlRbHVqNmdHVUI3WlgzRnhIRnpK?=
 =?utf-8?B?MlZKOXpsMGUwVmNVL2dVdXZ4VnVEeHRheVA5VHd2b1pDaHJkTzAvZUwrVVND?=
 =?utf-8?B?cHFWREU3bDAxUnhNWDhSMUJuWFV1V0orVEQ1cWQyRXFRMldGWEZLZzdSWlNy?=
 =?utf-8?B?R2Z3RkI2ZVFCYXdleVNxbG4yTG1hc1V3STBRY3ZHVXBDS2JJY2dpSE50M0pE?=
 =?utf-8?B?bkUvMWIwRDBmLzVxQUlYNlBVbHNFcmZkWVd4TzF3cVgzWWdFWVRBVkVEMzNT?=
 =?utf-8?B?a0QyN1RpWGNIbzJwUDQ5U3FSeTFYYlBQQlFrVC81dmNVY1RlUGg1cUpLNTh4?=
 =?utf-8?B?RG5pRTEyY1kwSzdLUnF5c3h0N3NEMzg5Y2VVK0FtZmF2MGxhRWRySnQ5MnZu?=
 =?utf-8?B?MDZIc3hiRTZ0VVk0OEJ0ZzYxdTZoMDMwN2NQUXFFRGxGSXY3K2FIRU5tNFBX?=
 =?utf-8?B?dU01SExrQXhlbVJhNkJtYVFtTTNMU2c3T3ZrNSt1TDdoSGhSTzcyM1htZEJN?=
 =?utf-8?B?TExSOVlnYkxPSEFSOTVRSjk2Qm01Y1F3bURWNVZkRUx3cnB6OWFEbU5JcDV1?=
 =?utf-8?B?UzlsM2NvbG1mNGpDbzZxTVZTZHZkei92cDNTNVpnWkZxWkkyY0tRMTFIU0Nk?=
 =?utf-8?B?MjBsZUR2dDNFVGlWK2NacEpZZDJ3TGxMSzdmWmFjUzBjK0VVdUtJR1hFc243?=
 =?utf-8?B?ZHA1dFVvTlhodTZxN2ZrQlZvYWduSFFKK1lYOVZtOGJMOG5pNVRoU3FKNmhY?=
 =?utf-8?Q?p7UtoMYF9SE=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6733
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9646ba6c-9481-4228-8670-08dda8947766
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|35042699022|82310400026|14060799003|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ekVLbWovMFhsRUgzeWxNMmw4REJQRWhGQW1qcnRhNzd0ekIxQWdGR0QvaGFx?=
 =?utf-8?B?a0MyQk9DRjRlQWttUUI2YkRRT0t1ZzJOK1hpUnRHOW8ybXR6alZLeUZTVGhS?=
 =?utf-8?B?SGt6c0FZQlpFWENDaVJzTHNhbHl6SU5Ya2hyMW9mZERhcVlveXl3K29OWlJK?=
 =?utf-8?B?RUZwZnljWnBvWVZlMW9sVCtCY0hzZE1pNGJXelhNMFBwSXY5WEJiOTEvNXF0?=
 =?utf-8?B?MDhjYVRJbW56bUpMVitJazhWVWVFV1VBamxXdWZiSjdoYUpyV1JaeGRpWnFT?=
 =?utf-8?B?NmU1NzkrUFVqUWxpa2hEN05NNlpEN200eUpEQ0hWRkxiSWpIbzJMcVJRY3h1?=
 =?utf-8?B?cEswckowTk5BZjBIdCtWTVpiY3g5YkhKNkp6K1JJTXRocjRrYi83d3N0SFow?=
 =?utf-8?B?Y1VTd0JyYjhENmtqTUY0L0FEcG5oS2lkbHpRK0dnZ1NCZ2d0WHJTaDUzbGtW?=
 =?utf-8?B?WUhqRlpRa0t6dW9RMWJKQi9RRjExb0t6K0hGMUdjcjBTZVR0SXU2aGxvVWY4?=
 =?utf-8?B?UGw3WlpVVkdiN3VMd0lBYlVqcjRROXdQVFdGa3JoY3Q2UmZDdVZIcStNRDMr?=
 =?utf-8?B?UGREb3A1a3M3RU9WY2Z6OVU1US80bWtBZGh2dC8yTlFMa0gzVjZaL3lWWXZy?=
 =?utf-8?B?MXUyV05nZExvQ1JDeEZ3VzFxemVNNVlZWElJOXJ5RHZXakpBeGtvdU55Qjll?=
 =?utf-8?B?TmtyVHkyeXUzTFphUFBrdTVDQXBoSEo0NG1XR2h2aGd6cmFleXpmSGw5WVZM?=
 =?utf-8?B?d3RZMUIrdWhZTGxXOWZsTFdiUVgwN04ycitEU1hxYmZkT0FGaTNId3FGYnVy?=
 =?utf-8?B?Y3RBSTU2aGRtdTQ1eWg5Y3N1cHlMcXg3V2lHNkNlS1U3cDR2Z3Z6Z0MzN0ha?=
 =?utf-8?B?MVJLTXVUOTRHVFZlVlVLZDdOSUJ4T09Wb1U4ZUZTdmJDV1BNSTNHNHNycWpi?=
 =?utf-8?B?NGNFb0pqZHRDNWRUYU15T3BxbEtrRURjL25VVlJqbENzOStoczdOM3NHVlNV?=
 =?utf-8?B?NkdTTHppc3U4SnRZdVJtek0zRmdOZGRHcVJFY0JmZmYrcGhRRm9JSTFmNzRV?=
 =?utf-8?B?WkZWbllnV0JTOGpYZ2V2ZmlYRmkrTzkxT3hibHJLbXE1Z2ZIZ0RSOHVDVTFq?=
 =?utf-8?B?V3VwMnE4RmxIZndXSnE1b0hpajVUQjhpSE1idEtuY0hNN3hMc2tBQ1ZGWUR4?=
 =?utf-8?B?OGxYNXAwTnBJYUZlUHdxZUZkUUdTd1pCc0MxZlRkZFh6bGJ5anExanN5SlFD?=
 =?utf-8?B?MTFKQ1pzVHdiWEgrLy9UUmxGR3lwL0xlOEpjQlhpSlZZNHBSdk1ZK1JCbjNL?=
 =?utf-8?B?MGdFTHR3Q2taek5vRDUxQWxTWkIxNGtVa0YwSld5dGxjWXlVRXNwNFdEMGRu?=
 =?utf-8?B?L0NQSmhzV0hVMGhLSzRlN2hlbFQyV3R5RmljaUlsVTRYRCtTcFdsVUZQeCt3?=
 =?utf-8?B?dDY3VWRldmNwS0llaE1ONmtFQzYxQ1RNUndEYkJMeVFNY0ZDYlpIYWJtNU8w?=
 =?utf-8?B?RC9menFvRHptUTJ1RkJGV0FmREs1M0k0T21VMUkrZmxRSTJUdys0MmdPZmtU?=
 =?utf-8?B?UU5mRjNkUXZ4KzJ2QVd2cjM1SHN0WFJmZEhvaUpWOWVwQVMvVXhNU1czWXB5?=
 =?utf-8?B?TmY1Q3VmRFhzVStabzkzelRWOVRMZjBuaHFkdlB2U29XMW9GeUxINzhUZU9C?=
 =?utf-8?B?WGtYcmxuT3J0a3JVUnEwMkt3b0kzNXFhMUNib29tWHhPa052M3JVWnhQdVda?=
 =?utf-8?B?WXpPY0gycWpxaE1iOXQvTW42N0NkMmJzSlNjQXZjSiszNnN6MUliakh1SVFR?=
 =?utf-8?B?KzRNZlFndUpSUFJMaWhsTE1Dak1WK3BVeG55WEx3R2dGTmNHLzFZa2dkeE9p?=
 =?utf-8?B?RC81Rll4T3lhck5jV1pGM1dsSzVaOGNpNDZJNklUVUJVZlBpUEpwT1pXZHZp?=
 =?utf-8?B?ZWhTeVcraHFkc2I4VUM2Y3gvSCtRb01MWTMzbWN0aEdVZ3VoLzFaN2dicnZP?=
 =?utf-8?B?b3J1b1VkWmtxWnVQWnlxT2FyK2RRcXpWcnpPWGhNK1RvcUlwZGQ1NDBXKzBJ?=
 =?utf-8?Q?/UI5eH?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(82310400026)(14060799003)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 03:03:30.1661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fbbc9d9-05e0-4122-b482-08dda8948b56
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6185


On 11/06/25 12:30 am, Ryan Roberts wrote:
> On 10/06/2025 17:00, Dev Jain wrote:
>> arm64 disables vmalloc-huge when kernel page table dumping is enabled,
>> because an intermediate table may be removed, potentially causing the
>> ptdump code to dereference an invalid address. We want to be able to
>> analyze block vs page mappings for kernel mappings with ptdump, so to
>> enable vmalloc-huge with ptdump, synchronize between page table removal in
>> pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable walking. We
>> use mmap_read_lock and not write lock because we don't need to synchronize
>> between two different vm_structs; two vmalloc objects running this same
>> code path will point to different page tables, hence there is no race.
>>
>> For pud_free_pmd_page(), we isolate the PMD table to avoid taking the lock
>> 512 times again via pmd_free_pte_page(). Note that there is no need to
>> move __flush_tlb_kernel_pgtable() to immediately after pud_clear(); the
>> only argument against this would be that we immediately require a
>> dsb(ishst) (present in __flush_tlb_kernel_pgtable()) after pud_clear(),
>> but that is not the case, since the transition is from
>> valid -> invalid, not vice-versa.
>>
>> No issues were observed with mm-selftests. No issues were observed while
>> parallelly running test_vmalloc.sh and dumping the kernel pagetable through
>> sysfs in a loop.
>>
>> v1->v2:
>>   - Take lock only when CONFIG_PTDUMP_DEBUGFS is on
> I thought we agreed that we would use a static key and some rcu synchronize
> magic? What was the reason for taking this approach?

As I understand it, the RCU magic won't work, I had replied here:
https://lore.kernel.org/all/6cd41ae9-303d-4eda-8d64-f7dba19eb106@arm.com/

>
> I'm guessing CONFIG_PTDUMP_DEBUGFS is very much a debug feature that we wouldn't
> expect to enable in production kernels; if that's the case, then perhaps this
> approach is good enough. But given Will suggested a solution that would make it
> zero overhead when ptdump is not active, why not just take that approach?
>
> Thanks,
> Ryan
>
>>   - In case of pud_free_pmd_page(), isolate the PMD table to avoid taking
>>     the lock 512 times again via pmd_free_pte_page()
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   arch/arm64/include/asm/vmalloc.h |  6 ++---
>>   arch/arm64/mm/mmu.c              | 43 +++++++++++++++++++++++++++++---
>>   2 files changed, 42 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
>> index 12f534e8f3ed..e835fd437ae0 100644
>> --- a/arch/arm64/include/asm/vmalloc.h
>> +++ b/arch/arm64/include/asm/vmalloc.h
>> @@ -12,15 +12,13 @@ static inline bool arch_vmap_pud_supported(pgprot_t prot)
>>   	/*
>>   	 * SW table walks can't handle removal of intermediate entries.
>>   	 */
>> -	return pud_sect_supported() &&
>> -	       !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
>> +	return pud_sect_supported();
>>   }
>>   
>>   #define arch_vmap_pmd_supported arch_vmap_pmd_supported
>>   static inline bool arch_vmap_pmd_supported(pgprot_t prot)
>>   {
>> -	/* See arch_vmap_pud_supported() */
>> -	return !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
>> +	return true;
>>   }
>>   
>>   #define arch_vmap_pte_range_map_size arch_vmap_pte_range_map_size
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index 8fcf59ba39db..fa98a62e4baf 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -1267,7 +1267,25 @@ int pmd_clear_huge(pmd_t *pmdp)
>>   	return 1;
>>   }
>>   
>> -int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>> +#ifdef CONFIG_PTDUMP_DEBUGFS
>> +static inline void ptdump_synchronize_lock(void)
>> +{
>> +	/* Synchronize against ptdump_walk_pgd() */
>> +	mmap_read_lock(&init_mm);
>> +}
>> +
>> +static inline void ptdump_synchronize_unlock(void)
>> +{
>> +	mmap_read_unlock(&init_mm);
>> +}
>> +#else	/* CONFIG_PTDUMP_DEBUGFS */
>> +
>> +static inline void ptdump_synchronize_lock(void)	{}
>> +static inline void ptdump_synchronize_unlock(void)	{}
>> +
>> +#endif	/* CONFIG_PTDUMP_DEBUGFS */
>> +
>> +static int __pmd_free_pte_page(pmd_t *pmdp, unsigned long addr, bool lock)
>>   {
>>   	pte_t *table;
>>   	pmd_t pmd;
>> @@ -1280,12 +1298,23 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>>   	}
>>   
>>   	table = pte_offset_kernel(pmdp, addr);
>> +
>> +	if (lock)
>> +		ptdump_synchronize_lock();
>>   	pmd_clear(pmdp);
>> +	if (lock)
>> +		ptdump_synchronize_unlock();
>> +
>>   	__flush_tlb_kernel_pgtable(addr);
>>   	pte_free_kernel(NULL, table);
>>   	return 1;
>>   }
>>   
>> +int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>> +{
>> +	return __pmd_free_pte_page(pmdp, addr, true);
>> +}
>> +
>>   int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>>   {
>>   	pmd_t *table;
>> @@ -1301,14 +1330,22 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>>   	}
>>   
>>   	table = pmd_offset(pudp, addr);
>> +
>> +	/*
>> +	 * Isolate the PMD table; in case of race with ptdump, this helps
>> +	 * us to avoid taking the lock in __pmd_free_pte_page()
>> +	 */
>> +	ptdump_synchronize_lock();
>> +	pud_clear(pudp);
>> +	ptdump_synchronize_unlock();
>> +
>>   	pmdp = table;
>>   	next = addr;
>>   	end = addr + PUD_SIZE;
>>   	do {
>> -		pmd_free_pte_page(pmdp, next);
>> +		__pmd_free_pte_page(pmdp, next, false);
>>   	} while (pmdp++, next += PMD_SIZE, next != end);
>>   
>> -	pud_clear(pudp);
>>   	__flush_tlb_kernel_pgtable(addr);
>>   	pmd_free(NULL, table);
>>   	return 1;
