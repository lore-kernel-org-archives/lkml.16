Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010048.outbound.protection.outlook.com [52.101.84.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678BD8494
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 06:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.48
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748931115; cv=fail; b=OYFMSceO6h2eymJAgcffPCUR0TnzXZo0AVcEK4+xoh0/2Q1E0zWJSJrk3BOTEaUZUtIIqxXxDeIah9O9Kg5+HY6gNBMO21HHXw0lQHGgyJ2mow6XVu9TFcIaIENdKeDZOGDfqW+dwIDBXHzYU5pKaKx4XGIyt0b74OyVE/Ouj6A=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748931115; c=relaxed/simple;
	bh=UZUZOT0HZ8QFz3UTCZPsWz7M8eHvqPVOSJWQDAmsci0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gU3D0Tba0GydKZolmGMCaJwm5qL1AV/Q24fTt4HzaqBPLTsAQiyKpmSidEqVQiC/CDDdXpw5gQ+9eAFX0OrNtlCtNLiWEjyg94zT7wXc1N3aWbZ82n4XD2aw+mal4ID2nasPLN+x9Q9kdxdxVaQD6y7SF8UlVlHlFqefpWz4c9A=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=l47S7eCy; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=l47S7eCy; arc=fail smtp.client-ip=52.101.84.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="l47S7eCy";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="l47S7eCy"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=e0klFxMQfIkpZT87/J8JOJnmlrH8dORHZwLHFJz/9ohMhnr/23kgY/xOQAuUrPB3q5DAtZGTuXl04PUmyjNEBvRF0djL1hTIXGEyP++xVGC36aJThSUD+o6tsI1SkrMzCVX87vuZ4ziiTnROasOlQ1Tcmm83EG9hbiYpzxg7z0nND5Poa/bZ12/gVenzr5y7pMdvdVcIHAqOVofBlifVPjSs9DnTbibd5pJybyl+MZ0v1LCvTnQpGeEZjrDUK0Jz3iA9+bMCcIFdaaLQrv8O3ogi13DyHo3ipSGXd9PRqnYCtqlNZnyBiyBcUULhioFPIyEZ9nL+RVTTIKg8Db04Jw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8QOV8M8YiDU47PuT8wwjv+i1/ozIQiF58lr9NHl08Vs=;
 b=FkLwYQ5SRe100k6mGkKWbA2GkFEHaWyZW/yDlIyQSmAYmWijxZQyR0RsgYmunZda+TjluWu3lSBbnH7ZK9o/rLJwyRs+fS67y96xDQB7uGv4Mkts99LWhFwJjHfaDbqt+8/9ZT3FLPtqmBvTF83h/z4rzvVbeSs6e6Ud9SnGMkh7zrIb/yXo2gNr465DiPRa3LGmFw9XWzAZkL1/4kCI7/y+FCNI5649+LOF77Rysbvz8tlsmljV12SE9neTcmfLqlSgUW7BD2hLXFwmeoQAHWa8wAhGWNwC8IN7B3K+pcQ2esEwgzvAUdRVmgD0uCb0toXmmh5MikXkKhqV1slChg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8QOV8M8YiDU47PuT8wwjv+i1/ozIQiF58lr9NHl08Vs=;
 b=l47S7eCy0/XdrtOXFs2/RM8w9x77LsHs70IZ+WqzfVOZMCpe4drJob93TwYHXbKM0jwGG06IBSMiAYMtr6OD9rzVpSpyDl48X02qGbZZjq8irGSHLt1E7gJk7cggTaP3JGwpwxMXMhjctwW4qMUJ62e1sYTFKUmIMfjC6uBWbIk=
Received: from AM0PR02CA0096.eurprd02.prod.outlook.com (2603:10a6:208:154::37)
 by GV1PR08MB9916.eurprd08.prod.outlook.com (2603:10a6:150:a6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 06:11:44 +0000
Received: from AMS0EPF00000194.eurprd05.prod.outlook.com
 (2603:10a6:208:154:cafe::c9) by AM0PR02CA0096.outlook.office365.com
 (2603:10a6:208:154::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.19 via Frontend Transport; Tue,
 3 Jun 2025 06:11:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000194.mail.protection.outlook.com (10.167.16.214) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Tue, 3 Jun 2025 06:11:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E5IRh3pGYE2aa4JasL47/4XP/jqVJV22S9cLa9y/GIrOrtLurVfouw8GFCSagoR15TJK4cVEME5lUkYcuFf0R/cpUCNUgVXtQ2Jqn4bHSYo0jyx77LyQJq+Jucdd1G6buv2T+/EH62MT5wmBzgy4qdsFTBidhPYPmtqJA9Wyafjp8hzSoEMy6YSITg2tuTCRG+BCafgqI8Gt95IcX5aGBSx8flsYb06PQRU0ym4ADBEYG+RkCuYWg2oUQxOuPS+Wk3OVmyXOCu842eoloT0zvfAW3QrA+H4eiftFWzUAFbWT8E8JPaSmSR2+5vg2Au4ciGudWOkM1rv1wS/EJrygXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8QOV8M8YiDU47PuT8wwjv+i1/ozIQiF58lr9NHl08Vs=;
 b=h3x2XSupw/aDNgdBc0xHzR1Wl3kYvpEHOPyjcXyLDKBsmayg6EQGE5OVY6kCERhvjgJmGq+CJMIwtQLPNwAwOnhDsAishka0qdPmySoM9HFKYmY5YmJc3q29WQ6BYsczxhf6F0fheFtum8a/x4HFvOhBHQs92NI+SxtS+yl3MgOFWuAP5wQZH9PN/Hvwd3yVe7STcbXt6mthKg2WtAU69dUSqwTjGjb5Fju/dwC1HKYKgAgnEkjMqLP6U5shjouXoFA12vZJjSOuthpDX449AvyGgO2Z1AVIT7W20YHKjDOnvM3dBSa3VO44x1TZ+gW0JE4wi/o5l0ZISYIRm3QoNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8QOV8M8YiDU47PuT8wwjv+i1/ozIQiF58lr9NHl08Vs=;
 b=l47S7eCy0/XdrtOXFs2/RM8w9x77LsHs70IZ+WqzfVOZMCpe4drJob93TwYHXbKM0jwGG06IBSMiAYMtr6OD9rzVpSpyDl48X02qGbZZjq8irGSHLt1E7gJk7cggTaP3JGwpwxMXMhjctwW4qMUJ62e1sYTFKUmIMfjC6uBWbIk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DB9PR08MB9922.eurprd08.prod.outlook.com (2603:10a6:10:3d2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 06:11:08 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8792.033; Tue, 3 Jun 2025
 06:11:08 +0000
Message-ID: <7bd57eba-42a0-4bf3-8632-b91c401b7316@arm.com>
Date: Tue, 3 Jun 2025 11:41:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] mm: madvise: use walk_page_range_vma() for
 madvise_free_single_vma()
To: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
 Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>,
 Lokesh Gidra <lokeshgidra@google.com>,
 Tangquan Zheng <zhengtangquan@oppo.com>
References: <20250603013154.5905-1-21cnbao@gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250603013154.5905-1-21cnbao@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0022.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::29) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DB9PR08MB9922:EE_|AMS0EPF00000194:EE_|GV1PR08MB9916:EE_
X-MS-Office365-Filtering-Correlation-Id: 929c9d07-4723-42fd-b589-08dda26582d6
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?amF4L2s4MU8zU0FIbHBrYUJUdlBJWlpyelpMbnV1RXZseCtQNHBVWFByVjZt?=
 =?utf-8?B?ZjRMUUsrV2UzbVhXVlRHNFI2YTV1UEpjQVRRbEt4QnNWSE4zV0VDaEhNbFhx?=
 =?utf-8?B?cnNnN1hiNGM4RlZ5RzlNNS9PelozbmRqZkd4bEczNm5taWxLUkUwTURiSWJl?=
 =?utf-8?B?aWNnSU4wdnd1bk00SDhNSkVuczhnWkVHdjQzNXJFdDBqNlFWYWd3WWhWMGV4?=
 =?utf-8?B?eENkZkdvbnkySXVUNnRtODNiS3UrbU1ZTmR5U2JkaFBoTExwclNPMHkwYkVx?=
 =?utf-8?B?RkpkNzhHUlJiN0ROTTJaY2M2T3pHMzdPd0lHNTFHeHdqVEtUNWE3eHhPOHNS?=
 =?utf-8?B?czF2TmNMUFpWTVlrdnQyK2l3bER2WThNaEFXUmI1N3pFdWRFTk5LVFJDSndh?=
 =?utf-8?B?dlM0ODJBNDlpUDYwazZaU01oMzJxS0FlS3hseW5nNUlMUDR5ZnZFTEdIM2dO?=
 =?utf-8?B?SCtZS1BUbHlRSEpacXNRdGpySjFqRVREb1JxaVA4K0ZOTmxYM3FIV1dxc0xz?=
 =?utf-8?B?MExFOTVwQUlKSEh6cEhKOW1POTlPQTNTOU1OVzRvemJkZ3EvRDErV2xpUnpO?=
 =?utf-8?B?Z01yeXVYV1FxQUp3MEZQeWtpeFhRSUwycWI3NkswK2xvakE2MlpjSUVqTmxI?=
 =?utf-8?B?c3lNWHRGOU9IVnJEMHBKNDhGaFV4bTBSdm01TjFMWmJTQlhXZzlwUGJLcjN4?=
 =?utf-8?B?QVV3dmNTRTUrR3ZQUWV2VWl5dUxjMWt5N2gveUhibDdUYnZYZEtycXFLNHlB?=
 =?utf-8?B?WmlyZzV1anplaW5WbmhyNmhscUJycnZmU201ZURiYWU4dXRnUmMzYkNOUGo0?=
 =?utf-8?B?NCtaNDlVcmFpVkJQYkhYa3JGMW1GaXBMVFA2NzV5UjhiVHRnbHN0eE9kcnB2?=
 =?utf-8?B?UHBsOVA1YUx3UWl0K0JVUU1KUWVVVDNZazEyZXBZTlJlOWtWVFF5MmNnd0x5?=
 =?utf-8?B?NWRpN01oNVFvUmFzWXdOdS8wWEhScVg1UUFtNlFLcWtIelU3MVErbzc5OXdN?=
 =?utf-8?B?RkNrRWhCVHB1dGZFbE1BK3kvaFlBTk9YZDRIN0dPNStmN01JUjg5c25maVpx?=
 =?utf-8?B?TXQ2RDhWWmFKdWZZWmMyM3Fia3ZwbmMxV3VsS1JSZTl2bjZydVdKRU9acy9M?=
 =?utf-8?B?djBrRVpCN0pPWVFYUUlPWkRhWkU0VDE1S21NYzhmUkNNejIyRXUrWHJrbUVB?=
 =?utf-8?B?NXVsKzJMYXI5SWFsckhBOXVSSVNYS3BxSTVvMlRYbXk0eTNNZzIrVUpab2xS?=
 =?utf-8?B?WmFLdXUwd0NTcG9yN1ByeUI5N0ZDQjZ4WkxNZEZiVVBYSVlNZVpVbVpDT3lk?=
 =?utf-8?B?aWpoU0JKV3JzVEZOcEVLenZrdmZMQzRnUGJTK3ZNQlk2Sll1OWpOWnFyWDBx?=
 =?utf-8?B?Q1B0WTFhKy9IblFySWJ0V09POUJoQ052UnBadWpsRXhpOWd2bDJLa2N6V2ZM?=
 =?utf-8?B?MmViMHY4K3pQb0xjWGtRaVFSaEl2TW5kYnl4T0w0bWhreS96V3IxMzVIalZJ?=
 =?utf-8?B?OGpjSnNjZ3hrSWExMEo2WVVzaC9aYld2ZjlFb1lZWWZQaDNFNlUwY2IyV3h6?=
 =?utf-8?B?L0NKRTBFZlRjUzgzNmh0dmVsTFJncTc3RkVHOFMwSVEyUGZnRnFKV0w2NDg3?=
 =?utf-8?B?dzBxYXpsazc2MFNYN3pZRGNqSlBrbloxc3NYc1F0V2hUNWJJOGcxemRjTDIr?=
 =?utf-8?B?M1lxd2FhK2V0Uk1VVmNoUUNNQU82YkozeXkwaHFnSE9xZmRjRytmaXkvUnc3?=
 =?utf-8?B?M256MnBFZHVzN1A5YXBndnRnTUhqSFh6bVJMNVp5Q3BOWTJwU3RJUXZpc09m?=
 =?utf-8?B?RHIza0V0QVFGUzE1ZXIwYndaeFBIMXI4N3JtcFFJeEtZWTRPK25sa05zZXd0?=
 =?utf-8?B?eW9qeDgyaUFmMHp1Qi9oa0ZoNkh0OGkxbHJ3WEdQQ2hrTTUxbTM0K0tZYWhx?=
 =?utf-8?Q?+G8XWRywLs4=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9922
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	70bf936d-ff0a-47fb-de62-08dda2656e12
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700013|14060799003|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UHdVR2FkcEhYMjhIL21mYVRPeVFsa3JnZzIrUVUvSnBxV0g1bStzV01qWVhQ?=
 =?utf-8?B?VDhjbVpHTUk2aVJRTFhieUZ1MkdzTzlQWGtLZEdqSDNkK2EvZFk0OG90U3I4?=
 =?utf-8?B?WG9HUkZFS3cxUUxpZmJJNFQyUXpUeU5YdHloSmxOTjh4bnl6QzIreUZhU2NP?=
 =?utf-8?B?V29kU00rQ1pGZ053dG5zYXZncXlUUk5NZG9NVUJIUTZJZVZ4MWYvWEFQWGNo?=
 =?utf-8?B?Q1RLdit3bFkzYnk0Z0M5dExsUWp0N0k4dG9rWDgvTTQxQ2VuOE1FLzhWYUxF?=
 =?utf-8?B?R0psSlFVditoTzZ1U043elFJYXdxR0xLUW96cGVXQ1IwVmJFVVVNcXVvRVdp?=
 =?utf-8?B?REdBclp4UkFRaE53b2llWVVuRjhYODkrOFRSS1B2REZQOGZjbjRGSmtwbk5z?=
 =?utf-8?B?Q3dvb2x3RVZlTUNKaGdiQVdxSG9JeUNPd285SVBLQjFOdGNobVJURmx1bXhl?=
 =?utf-8?B?MzlvWWxyVDIrc0dIdUhMREZKYk1TZ28xMTNjMStlSC9ORzNjcldtUkpGMDZT?=
 =?utf-8?B?YlR4VTlMSVJuM3ZITm9razBsL051Rlp0ZVo4bCtkZTNJUVZWU1piUDNTWjQ2?=
 =?utf-8?B?Tkh6U0Zyenk0ck5vRHQwQzJiV1VTZWVBUXlXZmZ0SDRtSWpxS2w3Qk43TEkr?=
 =?utf-8?B?Z0FPNXUvVDJycExFaVZaUVdLSndzZmFlTDNmc25GTGtmNFJlUWJGTU1mcnMy?=
 =?utf-8?B?Q2xrUU1RWkVhOUNobVZUSUdGQThRN0JackFtUzI3aTZIMXNYSEFVME5HUFl5?=
 =?utf-8?B?UDV0ejEvY29CODFXL2NuVnNZZmlqODZuTm5vZTdMMDZram5UajhFT0pqeGp3?=
 =?utf-8?B?d2VSVytmWDNkdHJ4RDhENGVONTNYVjlobktCNExMTFQrZnRqRjY2SDRuSU1R?=
 =?utf-8?B?RlA3SUgwck55bldoY0F2UkhxV1YwU1BaNHBxb1FaMlNhZW51bW9wNXIvQSts?=
 =?utf-8?B?c0M1QVZveG4vLzFXQ3pxcFFrSG0rOCtpRWdLYkVkM1Q1eDJ6VDA1cmoreTFm?=
 =?utf-8?B?UFVXMURtSUlURVJkdC9veWtRUytzV3ZIZS9kSVgzSDE3QVRKZ2dGcHVtbExD?=
 =?utf-8?B?b1NMUEx1RDJEc2ljQmx3bWhNTlMxeE1PWDloQWg1NndDSWloR2xwdFV0azJU?=
 =?utf-8?B?cGVFdkp4b2Z1YTk0Y0RsRithTmFVWWdrTHZuUVRhREJzNzVMOTJMemZyNmIy?=
 =?utf-8?B?RkhYR0hQWXNmNnA0cTIzTUluVFF1VjlUYkQ1WEw1WDg0K1dyLy94cEgzRnVX?=
 =?utf-8?B?dEM4ZkNzejBwUElMcVFFSXQ2UkM5cnR6R2MyTnhCUkpwWkJTYkFRUkVpNTBy?=
 =?utf-8?B?OE9aYWE3eThyMDk4TzV1a0cwV2FZNEJlWlBXUXBtWWRXTCtLSWpOejlZM1dh?=
 =?utf-8?B?KzYwNVZYNkpYRUFTa29XK2tFU2d2OFZsSWhKS3ZJVGJ5U1pnYS90cFl6cTE3?=
 =?utf-8?B?SXBRMW15R0g5eGRyMnVGc3BabzB3dkt0NGFrZ1ZaUkdzeVJCS3JHUlZSc24x?=
 =?utf-8?B?TUhQVHBsUEw3U3Z5TCtoVnByZis0dGRQOGxsZzJleGhqNnkrZG85dGxXam0w?=
 =?utf-8?B?WDRVVk80WmJEZU9hSmh3WUdJRy8zWEFlTnYyQ3VueE1hR2ZPVFlUTTduVjJ2?=
 =?utf-8?B?TytocmErb0RvQU1pWklqKzkvRWhjNy96eU9vdWFDQkpXYzhwcG05K1pYL3hk?=
 =?utf-8?B?UlRDNWJUdEhoekxYL1VjWFl1Ni80RGF2QTNDWUJYNXNWVnZwZkhSVWxhdXE3?=
 =?utf-8?B?QSszQ2pBV293V1Q0S1ArVWtsSzhBSXZnUEFqbzNnbE5FS1pxVVpHc3VVSUNn?=
 =?utf-8?B?U2VVMWhYWVkrZzB5M0NlR0ZZM3VoL0k0a21PYjVaSGVySEV4RTM4Qm44Wmpu?=
 =?utf-8?B?b2gvdzhHNUNoeTc5NkF2RjdBcEd2eFZYaVNSUWl0TjFJdTFRRzMvUTYwU1hl?=
 =?utf-8?B?R0t1akdqcHdXWTNhRzNpb0FldjNIekNncDBzajdOWGQzQkVsU2pCZDkvNjBV?=
 =?utf-8?B?OUxMOFh2WE9TWEZJdzFoMzdUdXRUNENqclR0b3hicUdmaEdxcW1GMm9zSWpN?=
 =?utf-8?Q?AY4/J4?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700013)(14060799003)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 06:11:42.6184
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 929c9d07-4723-42fd-b589-08dda26582d6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB9916


On 03/06/25 7:01 am, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
>
> We've already found the VMA before calling madvise_free_single_vma(),
> so calling walk_page_range() and doing find_vma() again seems
> unnecessary. It also prevents potential optimizations for MADV_FREE
> to use a per-VMA lock.
>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Jann Horn <jannh@google.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Lokesh Gidra <lokeshgidra@google.com>
> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> ---
>   mm/madvise.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index d408ffa404b3..c6a28a2d3ff8 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -826,7 +826,7 @@ static int madvise_free_single_vma(struct madvise_behavior *madv_behavior,
>   
>   	mmu_notifier_invalidate_range_start(&range);
>   	tlb_start_vma(tlb, vma);
> -	walk_page_range(vma->vm_mm, range.start, range.end,
> +	walk_page_range_vma(vma, range.start, range.end,
>   			&madvise_free_walk_ops, tlb);
>   	tlb_end_vma(tlb, vma);
>   	mmu_notifier_invalidate_range_end(&range);

Can similar optimizations be made in madvise_willneed(), madvise_cold_page_range(), etc?

