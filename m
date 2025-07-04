Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011007.outbound.protection.outlook.com [52.101.65.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207BE322A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 05:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.7
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751605581; cv=fail; b=T4Su/qQ5V64iaaf2gZV7CpZoEXdzeXeSF7FnkTOYMmA4oWx06FlWVe5nHNtNZ0hmaIa1cTxYrrPwPuQMsRLIF4Y29wUNFI9aMTqg8YWy7yaLo2Mm0mF/9CzkyUoaRCBqaB3j4o/F2UWClK/Q7EaA9sKwgfSeaX3uuP9yzqxi4+c=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751605581; c=relaxed/simple;
	bh=lde6ZCObQOSqp2hdbQotHmV4oHhBpD+hJc85iIePexo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RDoVkl2QfB5dPXM/We5GZ69qpLSQ0F1MD23ZN8cwEEAYJBQX7Nts8U1h+7QKdkWeER3NBktR0v9gZcOowzN6mF+USvOYPQKu3pzBDo+ohl3mHlvkxAqqkoUoTRFYSWNHSSmBjXrcWtueINNf8z/gln/1Eb2IJau7DI3sU+kkqEs=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=OxNllsSi; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=OxNllsSi; arc=fail smtp.client-ip=52.101.65.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OxNllsSi";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OxNllsSi"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=HWWYPhgOTwUdCN89qr2t+UV5iL6/6HJNww6m22+oClPZyGx0vhAllJDofc2liAq45OYqm2hU+Y1mxg6G8rII41OiC5VMCd6rld2wXGKGKDbe9Noj0L8/U/VmV8zrYJzonFhqTVO6ttNYZwtvAnHVKYFJtw6iO596NsEALql/+XL2d8EHv5TzJCXAkwa+dSUMFvsSJM/in4mPicduZamVuUf38mJgO87N0lBIxdFT/c3Pt40mj1+zhryb1HTusgJy0sOLcOkFg6BZKNBvicGoQzfBymJFKDQn8GOnYHVLXSXWDmFeDh6TS3G9S+py/WTCHqTq+ByOaM+vkVHQtTQWfQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eM2N8LOc982jPhSmTy2wltFlS7M6EiF/ZjDCAqSuMOM=;
 b=Ns8rTEjiM6l40h6CDimSqH4tZQssYCe5cUuVhUifR2dQpgUVOcMN6TPwpEsJHGZfSQhkzSwhcyrDhwmuOVtpEKw+RCahKu70XZwDdpS0W9UlborSn59Ajy0SbftVlfxrD27aGoXoYCrYgD10fvdTK2ioROxMBbe7wP/UH2yayhjSSopyzvmrBzJdcZVdowkjhC5R7dcMSgo7+otI/1Pl94TM9bei2F6f4kd7mnIkLjotDe0u0fl63PONGUSj132vk0if5BvdQHufCgmJlgYLguG+yreqYONDqGkmX10Ce4IYlYKUj1txTCOtxj/XsUp37hgxrCC9PBXD9ZgVDNgoWw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eM2N8LOc982jPhSmTy2wltFlS7M6EiF/ZjDCAqSuMOM=;
 b=OxNllsSiqfDNP5FlMpqOgAAj5b92yJf7kUuUe/9o+NxTKvVl1HUZRbSy2ndvDfxuj3ZXqb0O6QNlmFb8x5g+QrUb4lPXOaS4NEtzuW7XexUqsOc9+Qdt86GsJBawWBL8k1lDCq3m5NE5Gz+VrQayDaZsIJg0FI39T6eBL2k/zj8=
Received: from DUZP191CA0070.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::20)
 by DB8PR08MB5420.eurprd08.prod.outlook.com (2603:10a6:10:11a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Fri, 4 Jul
 2025 05:06:15 +0000
Received: from DB5PEPF00014B9F.eurprd02.prod.outlook.com
 (2603:10a6:10:4fa:cafe::3c) by DUZP191CA0070.outlook.office365.com
 (2603:10a6:10:4fa::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.23 via Frontend Transport; Fri,
 4 Jul 2025 05:06:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9F.mail.protection.outlook.com (10.167.8.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Fri, 4 Jul 2025 05:06:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qAip8MRwVGmceEGHwjFDj+tmRkxenvEDNxSJ7KHqjGlaWfzCJRF3TCmwVegZMIQ8nQ+aBvvYD9xXKWQPWTnmC3oG4E6go/F6/RHP96UCJVbZ1k7W/afC5+qP2gvKYacyAQrlywGlRrZcmGMEdaHIOIumt6lwYMBzbD9k0zB83mK93zulDWKXfs4vpMRdWXv7Atf9+xyNsj4dGtGxH7SJJyre6YpumODheWSy9Elw4ouIgbZKwvc9BC4pWBTfA8xF3WhWlpIxNX9qil86E/zu2MMRiKtMyQIjPRxYLjCRErkBHaE9b2/0swtIWvM9rvJd/FV/br4ay+69OCV8o2yCtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eM2N8LOc982jPhSmTy2wltFlS7M6EiF/ZjDCAqSuMOM=;
 b=GllcQisQv8x+kVUe5IZ/r8S2DbeT94QNJ+rdiXJq72nAS3vyUMT9IBMgGZOQyirSCZ/R64jRV/sqcvNkzpytWbywCgXQ6PGU/smGMUiuA8l7ws3NqAOq6u0Q8AGeugS83aMzj3f7kXrs4SvsjQXZVq7cTSPukg9SOWZKtuMMZDd7d9/azej3kOKg7jlhWKxo6GzcXFgqWSR3b6Edv0ief6SCy915gaht322VX4+Om5KR1MCfH8Pr5q/2Se2/FjeP3H6Kre6uNkpmmKnIrF+px4hZZUMXGHw9b0Wi0V+7HV52aUNKME1L8nOXlHD3DUkbmlynbpDvT0RRN4U+mM3Njw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eM2N8LOc982jPhSmTy2wltFlS7M6EiF/ZjDCAqSuMOM=;
 b=OxNllsSiqfDNP5FlMpqOgAAj5b92yJf7kUuUe/9o+NxTKvVl1HUZRbSy2ndvDfxuj3ZXqb0O6QNlmFb8x5g+QrUb4lPXOaS4NEtzuW7XexUqsOc9+Qdt86GsJBawWBL8k1lDCq3m5NE5Gz+VrQayDaZsIJg0FI39T6eBL2k/zj8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AM9PR08MB6675.eurprd08.prod.outlook.com (2603:10a6:20b:300::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Fri, 4 Jul
 2025 05:05:42 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 05:05:41 +0000
Message-ID: <31f0c3df-fb72-478e-aa6a-bb475b99484a@arm.com>
Date: Fri, 4 Jul 2025 10:35:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: Enable vmalloc-huge with ptdump
To: catalin.marinas@arm.com, will@kernel.org
Cc: anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
 ryan.roberts@arm.com, kevin.brodsky@arm.com, yangyicong@hisilicon.com,
 joey.gouly@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, david@redhat.com
References: <20250626052524.332-1-dev.jain@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250626052524.332-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::6) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AM9PR08MB6675:EE_|DB5PEPF00014B9F:EE_|DB8PR08MB5420:EE_
X-MS-Office365-Filtering-Correlation-Id: b4f286d4-4203-47e5-477d-08ddbab87ffb
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?VmpiVHVKZSsrYm9lSHhxbCtXbHVYSWdUdXFCMEU0b2tqZGZ2Vm1nWnpjcHJV?=
 =?utf-8?B?RTl2a0V4VW1RUnNRSzNWcmxjZ2dMbW9kOVhMRlpaN0xaS0Q3anJ6ZWFqWVpm?=
 =?utf-8?B?ZnpaczhCN2w3ZVBuOGRSVzlLdE9XdFVXUDZENVhySTVPZVNJOFdsTzNXdlJu?=
 =?utf-8?B?Qzl2d25lRWU5R0ZMSjRXdWtWbWhKOEVzUSsrbjZqbEJCVUNwQXVxZnVRbnR2?=
 =?utf-8?B?VlBwY3JKNkdVS3pZTWdSNFQrVmU1NUVxVnRHZmdxTkVoelVZb0JZdUlqK1dT?=
 =?utf-8?B?YXZpWkZ5U3BLVGYwQzY1KzNXUUlWTi9tdU9JSjVoQmtFYkQ4YkdIOWtBcVAz?=
 =?utf-8?B?bGx4ZlBWTHV4Z0xRN2kzaHZ6QWV4b1hPdHN5Q0puUGRPZ1hvcVVvZnJjTllX?=
 =?utf-8?B?Tm8vekZYbGtjRllMWjA4ZXpzQ1FvelM1VXBjN00rREJyNjd0eStYdTlaSzVm?=
 =?utf-8?B?MXZET2ZHK1VOM1hhbnlTdTliK2EvS3dlZFI1WXB4YUV1eG5PR0p2UUlsQjNz?=
 =?utf-8?B?UUhMVEc5d25LblEwTFVFUDBmQ3RsODBUeStXbkFUYVpQWWk2eENRc2FNRjR2?=
 =?utf-8?B?WndvcHR5a3dpbUxPclQvL0l2bzM0QUpEd3EwV2YvM01QejNwbUVXRXJrNDU5?=
 =?utf-8?B?SWtEWk1FNFFoaUVPb043MXdFQnd6a1JaTXdtVXV6UUVmR0R1MkwxYjQwa3FR?=
 =?utf-8?B?NENnZTRwZFdMWGE3L3NaY0xXN1ROaTdQTENnaVEvU1M5RWJNK21xckxCaWEy?=
 =?utf-8?B?b1Y3aytBbUdqVUJaZFQ0d1JRZldSUzl0RTU0c3lPTFJiVE5oQWJ1TCs5d3Zv?=
 =?utf-8?B?cGYycnpzY21GOUkvUUtydnlUN1ZKalBBbjV5ZEFsWGk1V2JPdHJLN2IwMXUz?=
 =?utf-8?B?ZVJqbVdYRmNrbEp3aXFuL1FkSm9YSllERm03U3cxTDIzRFZTblpmZEpBZTFD?=
 =?utf-8?B?NDkxa0dPQzY3SjNpcjRESWFtd1Y3Z29IQ0dJZXJmWEd2UVRtUnJUckRYUGZQ?=
 =?utf-8?B?UnZWc2krZzY4dFBvVkhBUXJOUngybkswUytZb2wvUlZlbC9xQkc1V3hsUVJL?=
 =?utf-8?B?a3k3emVmTGEwbi83VFNXM3Fyb1poMjJxUG1ZYWhxbnNuNHo3cHdGcE9XaGZR?=
 =?utf-8?B?V0RHR1kwNW9HQ2ZoWGxEd2tzUWhtMDd4d3I4Nlc2M0tPS2ovNVpMSkprY0Yy?=
 =?utf-8?B?TkxWc0VRNVk2dHBvS3R0TXd4SHc2aUlsbVFadTFleHdSRndKTm9MK3BJT3B3?=
 =?utf-8?B?eUF0MXZHU2dDMTM4R2IyaXNTWFA2djluZnpRbXMzQ1hYSlYxS2tLbGlJeVBF?=
 =?utf-8?B?ZUxHaTlFR01PYWU4WkErY0l2WVV0bjg2d2xqT2R3bGVrUElRbUk0QTA0Wm5Q?=
 =?utf-8?B?QW5WMEVsbit4YXQ4M0hnWjVnNnNHSW9pbkJIMHg1OWk1KzdBWjc3NFMyblEy?=
 =?utf-8?B?dGF4Tldxd0toMml2Ujc4MnovU1c1N1Zhd1V3UE1VUkRUWHJYRWlJWVMxaEhm?=
 =?utf-8?B?UlJhd2VQYzg1QXRxR01iNHgyNjlicUUvRkJlblZWT0dhYVM2SDh0bzNYTk43?=
 =?utf-8?B?aFBua1d4QUtXTVZGMHZaQ0RwZ1FDdHRiRzN5a0pEeEFrQUtpazBMeXhLTmRR?=
 =?utf-8?B?ZFZYLzlkVm5KUGxMWi9vd2tWcE8wb2g2SlFCcE5qYzd4MEpQcTJ0empoQWti?=
 =?utf-8?B?M0pqR2lMYTJzTSs2bFpnellVbUcrZ1ZneWVXbzA3em5aQXMvcUZjRGw4dkh0?=
 =?utf-8?B?WFZyRFdsZC9BNVhDOEp5aXBxU3Vsd3BMSy95a2xucFYwYW40Ry80ZnlZTzFa?=
 =?utf-8?B?ZUR4ZFNSd2JqMWZHRGVGOVd2eWNGSFlVd3hON1VTbjY4TnJVSDN5TmZEUjE5?=
 =?utf-8?B?YU1RaXRuT2l3MlYzajZZQU9PbjlHNHp4dnE2UDlaWXdUcUE9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6675
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	82e6dcb2-3064-4c6b-2824-08ddbab86caf
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|35042699022|14060799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MEo1VEJjSU9kM1ZDZmhwb0F3bk1NN0xHNG9ua20zeGNTV3dZbjdqeXFkbE82?=
 =?utf-8?B?eFBiekVCMGFIY0tSZDE4WlBKMEZ2OXVnL3V3bmp1MVZhNjh6dTNZUnhkcmlT?=
 =?utf-8?B?YUxjTzRzMkJ2amY2dEFWaHNKOVhXL1VFZDcyRUdTS3lvYUJJZld5UnUzdElF?=
 =?utf-8?B?di9qSVVYYXlGNU9hcXBnRnNzQ1BIMXE0Y2ZGdkdEUVN6QytPN3JoWEx1S3pp?=
 =?utf-8?B?d29SdVhKOVFkMERTVEJyZ3FNcEl0eitvMEZWOEI1QzhSbWY4cTZpWFJVcElS?=
 =?utf-8?B?RlVWY1ZHaitsbXBYY0wycVdDT0doV3VSZC9QaU93NnJMd2xQc0Zmc25hZDcy?=
 =?utf-8?B?U1Jvd2FtZVhQOWM0V0UrU2dzOGp1TU1ObXFCaW5EUEV2ZUE1WTFjSGNFS0dY?=
 =?utf-8?B?cHVvckV1REt2bm1FZzFqWWw2empxVys0U0l5WWl6MmNZWHU0T3gwcXo0dTlN?=
 =?utf-8?B?OHhOSWVMaUtiWTc3ZkpSR0Y1TEJyZW1FamJ6M1poMW1ORnF1YkQzemxzZjRY?=
 =?utf-8?B?NFFuUGIwaUorSGNaM3VmWTNRYTlxSzlmSUU5VzFCMlpvanRtTHNLSDZnTDJq?=
 =?utf-8?B?OVZiMlpLbEpwdWNjTEtDcy8zWmJwUVNraHAvU0dlc0NkSFBPelBkc01yZUJM?=
 =?utf-8?B?NFYwNzFkMkdJTVdJbUlEaHc5cm9pb2EwK2dGbVhPa1BucTBhckNvODlzY3VY?=
 =?utf-8?B?d25mRERzVkdXdi9DUTVHUmNZNmQwQ0ZPZExRUHBXTzFHd3ZqSWYwdWdydTVY?=
 =?utf-8?B?aFIxRnF3Z2Nuc0FwOHdiZGhNbCtzRFpickRRQS9GVHhpbm9tTHExNUxRQU1I?=
 =?utf-8?B?SWsxa2JVMXZ4b0crbHplUWV4OThtWFZaNlBPTnhDbkNTT1FMTHlpVmJuUGZQ?=
 =?utf-8?B?bFBWbG04dG1jQmFobXVEVWszeGVkL1pyRGliRVNnVzhXWlBvUHhGeWpoV2hS?=
 =?utf-8?B?ektqZS9FdGZWYjUxZHZOMVRvbXVXcjErcWJLejNjeTM0VWZLVXRpc1N0VUNu?=
 =?utf-8?B?cW1LMDNlajF6RXRDTWFtUmFROVBCMWNsVmUyVEVjMUx6cFEyM3lsbloxMmpr?=
 =?utf-8?B?RDRhdnRFRFJUcTNsODBUK1N0Mmc4di9EcWFZd2dWMzJseTJTNW9MRUs5TGVk?=
 =?utf-8?B?NXRyZko4em5NTXQ4RlB4SXRLd0k4WDRvZWU0VXA5dnpSV0UwU2lJQXVrTjlD?=
 =?utf-8?B?SXlSZ215cGxtRGpoSS9rdG1udzJaemFRSmhPY2VnM2l0Ri9wNk5XVHBLUm4r?=
 =?utf-8?B?bHVWNCtFdlk1WmpSUVNLeHZnWkh6YU43cXJEdjhtRlBpQXlYQkxxeVlodlJ0?=
 =?utf-8?B?VmsySldkNndnRW0rdjQrazA1RC9VRlJiWWoxaXl1SEIzeU80SWZTbFhBaFIx?=
 =?utf-8?B?YXlXcVBHYlhRSlMrZTRFWFJMY1FaVGNIb1RaR3g0dFYza0pDa3FFMDErNlhZ?=
 =?utf-8?B?UGZGK0F5Nkk3ejBBR1cvQzZZR0tQQWtXby9DMHZ4RzJtWkN1aHVlcDNKWlVB?=
 =?utf-8?B?dU9TR3dJdS9VeEtrZkFLODQ3eWt4THZZRlZWbnZRdHZjSUhTaDZFdStPcWFR?=
 =?utf-8?B?bXBHTkZYUGxGcjhpRXZaVUhWdVhmK1BiKytSc0hFdG53N2hUWE9McCtUbU5q?=
 =?utf-8?B?RmRwOTdxb2FBcTd3RXJOYkRCTi9oeGtIeWI1U0JWRHJadXgrZkRHYlJjNGRP?=
 =?utf-8?B?Wk1WN0NUNjRDLy91MStKSDFlaElQRHFudS80OGdYZkhacmx4OWJiYklNRFdP?=
 =?utf-8?B?QUtvVDJHSnJuamkyS3Jzd3JFUVpMendsWjdxVisrU2hxbWhUVE1wdXJhWkRk?=
 =?utf-8?B?WS9oSytYOU9ZMGZuZDkzc2JCbmxiVkRHa2dtV2lVZXJMOTJqREFNOE1Zb3U1?=
 =?utf-8?B?MXAxTndzYWMzYTlXSmdRNk5sbzU5RGg3cXloMnJZMEhIRmVERWtIN0lBYXh2?=
 =?utf-8?B?QkZ0a2huRmsxOXplZ09IbXZTbTl5emhmZWRoMXlubXZGZ0w2eDFSMXh5Yzla?=
 =?utf-8?B?ZS9mbVA4NGd0bkNVOEh1S3U2RVNtVC9DZ1I0OFdOWERNQnUvbE92TzJwNzFL?=
 =?utf-8?Q?ZSriTg?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(35042699022)(14060799003)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 05:06:13.9432
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4f286d4-4203-47e5-477d-08ddbab87ffb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5420


On 26/06/25 10:55 am, Dev Jain wrote:
> arm64 disables vmalloc-huge when kernel page table dumping is enabled,
> because an intermediate table may be removed, potentially causing the
> ptdump code to dereference an invalid address. We want to be able to
> analyze block vs page mappings for kernel mappings with ptdump, so to
> enable vmalloc-huge with ptdump, synchronize between page table removal in
> pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable walking. We
> use mmap_read_lock and not write lock because we don't need to synchronize
> between two different vm_structs; two vmalloc objects running this same
> code path will point to different page tables, hence there is no race.
>
> For pud_free_pmd_page(), we isolate the PMD table to avoid taking the lock
> 512 times again via pmd_free_pte_page().
>
> We implement the locking mechanism using static keys, since the chance
> of a race is very small. Observe that the synchronization is needed
> to avoid the following race:
>
> CPU1							CPU2
> 						take reference of PMD table
> pud_clear()
> pte_free_kernel()
> 						walk freed PMD table
>
> and similar race between pmd_free_pte_page and ptdump_walk_pgd.
>
> Therefore, there are two cases: if ptdump sees the cleared PUD, then
> we are safe. If not, then the patched-in read and write locks help us
> avoid the race.
>
> To implement the mechanism, we need the static key access from mmu.c and
> ptdump.c. Note that in case !CONFIG_PTDUMP_DEBUGFS, ptdump.o won't be a
> target in the Makefile, therefore we cannot initialize the key there, as
> is being done, for example, in the static key implementation of
> hugetlb-vmemmap. Therefore, include asm/cpufeature.h, which includes
> the jump_label mechanism. Declare the key there and define the key to false
> in mmu.c.
>
> No issues were observed with mm-selftests. No issues were observed while
> parallelly running test_vmalloc.sh and dumping the kernel pagetable through
> sysfs in a loop.
>
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---

Sorry, I observed that post v3 I forgot to add the change wherein
I drop the PTDUMP condition from arch_vmap_pxd_supported, I'll add
that back in the next version. Thanks Anshuman for the spot.

