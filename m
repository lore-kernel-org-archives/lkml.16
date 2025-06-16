Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011052.outbound.protection.outlook.com [52.101.65.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64032882C0
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 16:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.52
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750091730; cv=fail; b=q5+BGI1Pj9MdYYXvEh1L9M3mo0KK/GW7xYZN6hOy4HOEW4669jbjN7KaFVJX27rIVz/F0sKScWKgisDA498eaEetzibiqZu/Y9RhhhlnkvHPloMr7IF6RGMU0GIn9JTzUIXPzEMrwMzSt0vOacZRqCN7YXT2RFapGtSNf8cSQP8=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750091730; c=relaxed/simple;
	bh=Hmdiq4vOWyN55YMJ5gI70Q93sED0QA/XufYIwYGiZr8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=swQT+/49hN2Ay0BaaNczM43Epgkz09g7aIHA4FjNdr8GCq1dlWIFQMz8Nz/m10etbFPnCi+trsGHnsi2f7FKkLCWnzymYkBBj6+nsW1uZcegfSE0GbgO+GfgHPdgSR3oyruh+yDqJTGAwndBjsF5eL1KWt2qUySmGgJ1ydX0wss=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=W214J55I; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=W214J55I; arc=fail smtp.client-ip=52.101.65.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="W214J55I";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="W214J55I"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=yfCJp/rAxfxp2TdFTUBfZ9C/KFAG8azmCXD7+GJCQeXDMKouaUMrrl44l2Ypt96Rrqdca2g/DTgj3iv6VjFbzLS1wi6oQASa47kjF50STPqSceBmPzPXMe+A69WlGII31Bs9bK0qLIm609WZuN5Jwc3Xx/x2Y1WgBSE5zHinc96l/3IJQo9ZBxTNy/zL3g+3pA276QDhen7cMPWtS9E+3t5nQiAObtVvayGN9rAZ55kUQtxNpsjulOOgxQLDr8bweYF84URootpx+Dxpc8YEV535nTqC2aSbkMqr7LNnmEOpcujbNOOfGxQiOfVbOxydSke55nfAN1JuAEODHM4bWw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02paAA6LFqGAPZGBph3yUBlxvhbs8245SYze76TBIRo=;
 b=LjKC43r31WUuX6IUxSCkMatJfU4XcRt2CA3j4LuRsCjStoPUNwaaY+kfLlHd0XJwG+Yaud8euVz6FxRhsrRUQ/UOToYoyAGVHZK7t7I8gEZP9PaS6FWnLk+OzipAu88r0czNXJ7CyWBKAGmMXjXSn3pxhUVe/z9TPW7pYo0K7BpeaN7YjsbjTxXmBCcXAfrslrNmOnRrZzKevKixsCdcj01jL1P1I+e+t09krrNhEBz1VHiynvk5diyarAZTbYlEY8tZxBDQQxNd88EZZmElU3F6YihC85ByMRzzxRillKGSaqnpes9b5E7pAxF/Gzzp/VtYZ52wCvgSDrgKdPArkg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=redhat.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02paAA6LFqGAPZGBph3yUBlxvhbs8245SYze76TBIRo=;
 b=W214J55IyfpznN46RFeWaQvhQIdgSqHeZSuQZFMjDs5zWFCpifr2Ogd4QLfbqly48uj+X03dBYKh8imfFc/T7GB+GSzlObfDQG7CILWtLztNH3H0CslXFFSO8G1U5+XBLq3cLQ1YeP/ZQrQYdr8IHVTVjtMjYtORDy9wdm59874=
Received: from AS4P191CA0053.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:657::29)
 by AS2PR08MB9047.eurprd08.prod.outlook.com (2603:10a6:20b:5ff::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 16:35:24 +0000
Received: from AM4PEPF00027A61.eurprd04.prod.outlook.com
 (2603:10a6:20b:657:cafe::4c) by AS4P191CA0053.outlook.office365.com
 (2603:10a6:20b:657::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.29 via Frontend Transport; Mon,
 16 Jun 2025 16:35:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A61.mail.protection.outlook.com (10.167.16.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 16 Jun 2025 16:35:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sqBkNfJMsUxyCiDjLiKdDwufIKho72YQA49ib6eFKVSIojLXtuPSiPelZ4N11jYjEVTqzgZ8KWzTuqdgiRQj4fqr5m/GC4CSjMaxxzTQVMYNVydLznWskrBGEH5yAdinh3Ev25VPaSOADN5Zlb9QpHzglWlwFGK7mDGvg1fkaK8j0MIt0J4Et7LC48kwz6BR4Y/UVRbwbv1UUi7fVzlAsCLT7B5133gHyX4sdTx4+NPiOnz5UZetffvCJodv9d5Abwd83ypJvBUfnWVNy/2pv7zsSkKOEqmPWGsPLkZxyMrCYDMvyx0bU/IebW+SI1iMt5GUgiHl09rnQ4BBp0r/iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02paAA6LFqGAPZGBph3yUBlxvhbs8245SYze76TBIRo=;
 b=YpnHzQr4OdS+oUHdmUyD1j55frJddJz99kYxl4dcM0FrYzbcOz5Lr9X23sdh2G5Qd9aZSKRhfpQZ1q+TMy/eBxFlzNaEUx41+FSK6v9QotcI0TAs4hX/vk+V5gEeWN/octc5dRdooAa0tDFWIwGtnMWLnPoLRk2Uy+2zuCyonNDj4+qeaLlAccuqwgJ9LgxrbeQgyMQ5ZcHQKbksLTCCVOcJMhBfd51cnLHkb0zmk2//NhrqHiTgr7vnZOIKsZBkAapaiDqTzZYJDJAUQtuVzzw2faLuH6glxNWyA2pxPa6mNx0/0ISSsjuKmcGyjkpGax6GnFv+JgqysPTpER1QVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02paAA6LFqGAPZGBph3yUBlxvhbs8245SYze76TBIRo=;
 b=W214J55IyfpznN46RFeWaQvhQIdgSqHeZSuQZFMjDs5zWFCpifr2Ogd4QLfbqly48uj+X03dBYKh8imfFc/T7GB+GSzlObfDQG7CILWtLztNH3H0CslXFFSO8G1U5+XBLq3cLQ1YeP/ZQrQYdr8IHVTVjtMjYtORDy9wdm59874=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DU0PR08MB9370.eurprd08.prod.outlook.com (2603:10a6:10:420::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.22; Mon, 16 Jun
 2025 16:34:49 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 16:34:49 +0000
Message-ID: <6455797b-44b6-4b81-93e8-e7d193b05333@arm.com>
Date: Mon, 16 Jun 2025 22:04:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: Enable vmalloc-huge with ptdump
To: David Hildenbrand <david@redhat.com>, catalin.marinas@arm.com,
 will@kernel.org
Cc: anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
 ryan.roberts@arm.com, kevin.brodsky@arm.com, yangyicong@hisilicon.com,
 joey.gouly@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250616103310.17625-1-dev.jain@arm.com>
 <4a90e7b1-7592-4dea-9225-40c8e3b597d8@redhat.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <4a90e7b1-7592-4dea-9225-40c8e3b597d8@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0038.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::11) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DU0PR08MB9370:EE_|AM4PEPF00027A61:EE_|AS2PR08MB9047:EE_
X-MS-Office365-Filtering-Correlation-Id: 62ab4a29-b952-439b-17e1-08ddacf3cad9
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?YkdBeGxtTXY2UGNvcW5IOTdwaDhmSmdNMEU4YWgrNjJ6ZWZvbHNiQXVLQ3ZF?=
 =?utf-8?B?VHNvbCtxSk52dWo5MTVheXcraXRuMEpodjN5aHdkOFhPWE9TMmxKaE9CY1Vl?=
 =?utf-8?B?eG5JZ0xzT1FpM0lOT215UmRPaGs4VWs5dmJTUUZSa1U0ZDFsL2I1S01GTnYy?=
 =?utf-8?B?aklhUGVDYWpHay9aeHBybUdpeXp2MlVjaUM0azVZdEtMWHVmVmVINkVBbXZm?=
 =?utf-8?B?RUE0NEJwOXJjcjJ1VFBUTWVLUGNVREJ2UXJGa054bFhsbVVlWmRtWXFUOHdi?=
 =?utf-8?B?Y1BZVHdrRTNyY1QrRXJWSllabFVhWll0UFZQZ005S2MzUzNlMWNmZExiWjd1?=
 =?utf-8?B?T2JUaktBaUdPOTAyRHpFVXNYY0dObEF3ZzN4SC9LSGZWZ3I4VkduVGVHWUEw?=
 =?utf-8?B?NTN3bklYcWtINVE4SUE2VjV2T3Z0ZldLVnBENW14Qzd1VzIxbXMxZWhXS2k0?=
 =?utf-8?B?b1ZNOUpWQVBmWXZmZC9BOVR4Vnh6V2pYWnlaaFNYK0N5K2Q2NXAxSXVteE9z?=
 =?utf-8?B?R1FWNEFsbWVtVytpYTN4SXlBaDBPL1NMVXgrTFhkak5aWmxSTGRIY1puSERG?=
 =?utf-8?B?UitTMEVnbjRvbGpZZk91VHFic2owTzBrcTBqeklTVVJkLzk0YWNIWjBXQlRk?=
 =?utf-8?B?cWZxY0xmYWJnNkhhU2RvRUtTZnErTWpzUlFrVXlnZGErdXlVd0hOUkVXNERN?=
 =?utf-8?B?SWNJUXJXbmZtNDQ1SnpuRFRBVlRBR1dtZ1REbXU2aE9ITnprd3lWdXJEZ3VX?=
 =?utf-8?B?eldudXo0bm9jN01VUG5lTmdYd0kxYVhrTiszOTVvU0t4MENxN1ZPTG1jcEM1?=
 =?utf-8?B?UmNBSFNKT1hrQXAvN21vaitxYy9HcURtMlNLLzgzMVRHNUp6L09XSlAxbzFO?=
 =?utf-8?B?YVVvYUZGOFZXOUFqbGZiVEg2dm1pWWVSMThQWTJPdnZlS1NOWmYxeURxN29p?=
 =?utf-8?B?OFZUWDdMdlgvbklFejdheGJMQ2t1RVZtS2t0NURtc2dSR1lMR1FwU0wxMUN5?=
 =?utf-8?B?SFY2aVVBSXQzeTJ2RlRoaUl4KzYyN0czQlZTWU9nUWpGaFlXNTRJWUg0eTVs?=
 =?utf-8?B?dkdOVGg2SHJIbFoyVm5SaUprTDN0cFlsaFRwcVZFbENXRVEzUURoYUxKSjBE?=
 =?utf-8?B?UjJWMXA5WHltSDEwTkN4N3lybUg1ZTRGUVc2MlpIZThjOXkrRWF3YlRmRU1X?=
 =?utf-8?B?YVlkWXdjWGFZMEV0QUdla2dyanR4Z3NwWGFEL0JoYnNBbzYyTkNhOEpDQzM4?=
 =?utf-8?B?OWIzS2RTOWoxeEdDeWxmMFpQRGU5VWlBanI3M1QrYStlZEVLbU4ybVN1cXJE?=
 =?utf-8?B?RWpFZjFyNjdnNmZVdENncDIrRElJSzRoYjBQcjkyOHdqNTF6OUJjTjFwaHoy?=
 =?utf-8?B?U3VIeE5OejRxMnhqTTlsenlEdzAxeEIzZmtZdVBPV2ZERzArNXJmaWkxZmpa?=
 =?utf-8?B?VjZqZ2ZybHQ4NnozbTRTckVlUDRqTHpQUFhWSm83QnhqNzVuRzhrbU9YaVd2?=
 =?utf-8?B?cS9SVEdGOVN6eWhSNVpSQ25uRkd0UHRIUmVVVmpLR0RTUmF0N29SVkpsWk5L?=
 =?utf-8?B?SnViN2hibU1mN0o5VjdIZDhITlZkeGFIdWd2VUdaSEFGbEVjWjJhZ25rUDFW?=
 =?utf-8?B?dnlNRW1LQzU3VnRmL01PT1FBQytGZHV5VWVHVk9rM1htb29aZW83T1Y4dTl0?=
 =?utf-8?B?K2ZlbGFSdDUrdlplVUhSQllXWEd2ZGZVVWtFY2NUS2NnMk12TGhId0FoaEVy?=
 =?utf-8?B?VkpwLzZmMnkwMFRmaFdPbGthWjRIb1ZmY2RkSjNHSDNmRGRINk1aeGlqZ2hs?=
 =?utf-8?B?c3hMeXJTaFNuQ1QrL1lwRWRPMnl2L21JNzhvbXFhSDNJUzNpMXN0L1ZHNDdn?=
 =?utf-8?B?cTJQU3ZvL0JoNHJPMmZlN05OZU5mZWZYNHpHc0RYcktYMVE9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9370
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A61.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b06ee638-2ca0-4b61-1550-08ddacf3b66b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|14060799003|82310400026|35042699022|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?THp1YWFDVnJYejd2VE00MHZ5N3Y3YmRNQ0N1bWFObC9HYUhwY1pBSTN3TFRE?=
 =?utf-8?B?TjhJQStTTHpxNVU4S3N2bDVsL2N2NTRwZ0xxdDlmV0wrdW1qZzJvYWg2amd0?=
 =?utf-8?B?Q1FmanpVMnR1b2ozWDkwZFBtbTlsTFczZkNOVjdOd2h5TCtMTzFnNEkrVTVn?=
 =?utf-8?B?Qk5IMGJkc0VXK2Z1TmptM2lXUytKL0pDYnlCVVU4VkU1dnI2UlYzWDhRYkgw?=
 =?utf-8?B?RG5zVkJnc2V6M3BESnE5Q1ppWjJ5cTdCYUViUEl2VUw5eThCT2JneE8rb2lM?=
 =?utf-8?B?QTQ1TmVSTWxHRDh3T3BSM2ptZUc2WENUUDRqN1hMalhzYUJuZ1orR21lVGxD?=
 =?utf-8?B?NjVPUzlZZC9kdjVjd05xSElmV2JYcUxUY1FyeUNhaTdUdnpuOWxnUzJNS3Qw?=
 =?utf-8?B?UWFjdHdKZ0tlYVJVR0dDOTVBRTJ3VmVSMkhzUGR3azRNMVFLeEpOUTNoNFU0?=
 =?utf-8?B?SmVzSHVpWmZJZU5FejVqOXNUd0MyWmRpN1k3RVdmWWd5MmpFNVpZOGJNL0pa?=
 =?utf-8?B?aE9rTFZSbGZaeFpmdVlnT2dxNXZwS2dZOGM4elI4ek9IYi9lVlMwd3FHTGNW?=
 =?utf-8?B?UXJxbCszT1ppRXZNaWh6OU1MZGFHRDJvMkpLemdoUEJWVG5KTyt4c05sWUEw?=
 =?utf-8?B?YnhNT2I0U0o4cGIxc05URjFRSVcrTWl3aC8yb1NoY0ZoTjNnRlJIZXhFTzVj?=
 =?utf-8?B?ZmM1dnplazQxdnVmNmcxaDlaeUxHOTRDRVUyaFpJL0NmN0Q1MUFObE0zb3pZ?=
 =?utf-8?B?b3lqWlNuM0J1N1dPTVJ4MDB1a0FXZk5BVlJid3A5Y3V6N0tFdnd3NnRhRXd1?=
 =?utf-8?B?QUt0NlEyWUhKUE96U21ubVpaaHh0K0g1blc2S1JaUFFNYW5USVBKaUNrYzY1?=
 =?utf-8?B?dzF3VjFNY2JPbXJyaE52aTQzTEhyeHkyU3A0eXpjc2EzV2lmajVQVFhnd0M5?=
 =?utf-8?B?UG0xSU84VVpjcGxJNzE5bXlwSU02dktMS3VXUURKWndLeEpFSTVoajEwUjJR?=
 =?utf-8?B?OUZUVHJCYWMvazFubnZib0x0MENEanJDVVZTRVNrbUFWaXA1ejRnbVllaHgr?=
 =?utf-8?B?YUE0Y0FYeEJpT0ZqRWVQenZVWHFlYlFVcDZYeVdtZ1lpcUZZTEkwYzhBVzB1?=
 =?utf-8?B?bVBhcXd5d1ZxQ0g3VmpnYWNTYlNHMnpwRjVzSFY2UklUcnBMZXBvZ3pOSHBU?=
 =?utf-8?B?Zy93TzBtdlRvVVFWall5dUJQQTZ4RVhBYVdzY1N0Q1NYMmtJTnlaY1Jab2t1?=
 =?utf-8?B?ZS9NYkNaZmJRNDVRajhDY3RRak9RQmpIaXlWNHYzaDRvdFdVdTFOTTk0T1h5?=
 =?utf-8?B?WlZXTUVnZTR2WDZuNElQUmlMUE9JTHVZd2Urc1B4S1FMSFBSMjNldEp4OVlH?=
 =?utf-8?B?ZCtjWnVqUVc4NXRpU3R0NTBBUy84QitIRUErbm1PSXl2ZGxPM2VPaHVXQ2dl?=
 =?utf-8?B?cUFWclRXR0JXMnNOV2hZc2t3TTY2cm1Vb0E1QS9ZWDJGdXBLVHRqTTVtanlW?=
 =?utf-8?B?KzlScVVRQ0dFY2x5K3pKWDl0cGtxWC9xTkRCa3p3bGVzUGx4QTFIN2Jmd3RW?=
 =?utf-8?B?SVNxdlFiSEF4MVRlOWkzNTVCVVNDVEpJUk1zK1N4dm1UNGg5SWl1V3VtZ0Yy?=
 =?utf-8?B?d3A0T1hrZkRacmJic1pueDAwSHUyRjAvNWV6MzM4amdSWi9XOFR1VzhnWFJq?=
 =?utf-8?B?NG1VdVpKSDFvWVovMzlqdEdCT0d5ZXRPUEJxa0RkNDYzNWNYTThDTTJEenlr?=
 =?utf-8?B?eXhDSmdpckdOM1NnMHhUdmpyRU9YUGZpZ0U0aVFUcWZFaXpNWjdWalFBdlZs?=
 =?utf-8?B?Z2NiaUNnRk12My8vQ1VhclQ0cEJhZmVNZG9xcytiWjJJN1ZkVHFPeTJaQldH?=
 =?utf-8?B?VjUrSGt3MTRPVG9OTnp4MW9KYlJlQzNoZjVudzcvRngwVGlUWVVEOFBzSkF1?=
 =?utf-8?B?SFYvQnVaalpWN0VheGxCaXA1QWNscHUyOEoyck1WaDd5bjVnVU9ZOXo0MHdw?=
 =?utf-8?B?WUVMaVJ0dnZVNEdYZGl0OFlzVVJoWkxoMlBhdHdUY0Nrc2Z5UzZsaktyQ0JM?=
 =?utf-8?Q?BUyGV+?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(14060799003)(82310400026)(35042699022)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 16:35:23.5757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62ab4a29-b952-439b-17e1-08ddacf3cad9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A61.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9047


On 16/06/25 8:30 pm, David Hildenbrand wrote:
> On 16.06.25 12:33, Dev Jain wrote:
>> arm64 disables vmalloc-huge when kernel page table dumping is enabled,
>> because an intermediate table may be removed, potentially causing the
>> ptdump code to dereference an invalid address. We want to be able to
>> analyze block vs page mappings for kernel mappings with ptdump, so to
>> enable vmalloc-huge with ptdump, synchronize between page table 
>> removal in
>> pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable walking. We
>> use mmap_read_lock and not write lock because we don't need to 
>> synchronize
>> between two different vm_structs; two vmalloc objects running this same
>> code path will point to different page tables, hence there is no race.
>>
>> For pud_free_pmd_page(), we isolate the PMD table to avoid taking the 
>> lock
>> 512 times again via pmd_free_pte_page().
>>
>> We implement the locking mechanism using static keys, since the chance
>> of a race is very small. Observe that the synchronization is needed
>> to avoid the following race:
>>
>> CPU1                            CPU2
>>                         take reference of PMD table
>> pud_clear()
>> pte_free_kernel()
>>                         walk freed PMD table
>>
>> and similar race between pmd_free_pte_page and ptdump_walk_pgd.
>>
>> Therefore, there are two cases: if ptdump sees the cleared PUD, then
>> we are safe. If not, then the patched-in read and write locks help us
>> avoid the race.
>>
>> To implement the mechanism, we need the static key access from mmu.c and
>> ptdump.c. Note that in case !CONFIG_PTDUMP_DEBUGFS, ptdump.o won't be a
>> target in the Makefile, therefore we cannot initialize the key there, as
>> is being done, for example, in the static key implementation of
>> hugetlb-vmemmap. Therefore, include asm/cpufeature.h, which includes
>> the jump_label mechanism. Declare the key there and define the key to 
>> false
>> in mmu.c.
>>
>> No issues were observed with mm-selftests. No issues were observed while
>> parallelly running test_vmalloc.sh and dumping the kernel pagetable 
>> through
>> sysfs in a loop.
>>
>> v2->v3:
>>   - Use static key mechanism
>>
>> v1->v2:
>>   - Take lock only when CONFIG_PTDUMP_DEBUGFS is on
>>   - In case of pud_free_pmd_page(), isolate the PMD table to avoid 
>> taking
>>     the lock 512 times again via pmd_free_pte_page()
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   arch/arm64/include/asm/cpufeature.h |  1 +
>>   arch/arm64/mm/mmu.c                 | 51 ++++++++++++++++++++++++++---
>>   arch/arm64/mm/ptdump.c              |  5 +++
>>   3 files changed, 53 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/cpufeature.h 
>> b/arch/arm64/include/asm/cpufeature.h
>> index c4326f1cb917..3e386563b587 100644
>> --- a/arch/arm64/include/asm/cpufeature.h
>> +++ b/arch/arm64/include/asm/cpufeature.h
>> @@ -26,6 +26,7 @@
>>   #include <linux/kernel.h>
>>   #include <linux/cpumask.h>
>>   +DECLARE_STATIC_KEY_FALSE(ptdump_lock_key);
>>   /*
>>    * CPU feature register tracking
>>    *
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index 8fcf59ba39db..e242ba428820 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -41,11 +41,14 @@
>>   #include <asm/tlbflush.h>
>>   #include <asm/pgalloc.h>
>>   #include <asm/kfence.h>
>> +#include <asm/cpufeature.h>
>>     #define NO_BLOCK_MAPPINGS    BIT(0)
>>   #define NO_CONT_MAPPINGS    BIT(1)
>>   #define NO_EXEC_MAPPINGS    BIT(2)    /* assumes FEAT_HPDS is not 
>> used */
>>   +DEFINE_STATIC_KEY_FALSE(ptdump_lock_key);
>> +
>>   enum pgtable_type {
>>       TABLE_PTE,
>>       TABLE_PMD,
>> @@ -1267,8 +1270,9 @@ int pmd_clear_huge(pmd_t *pmdp)
>>       return 1;
>>   }
>>   -int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>> +static int __pmd_free_pte_page(pmd_t *pmdp, unsigned long addr, bool 
>> lock)
>>   {
>> +    bool lock_taken = false;
>>       pte_t *table;
>>       pmd_t pmd;
>>   @@ -1279,15 +1283,29 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned 
>> long addr)
>>           return 1;
>>       }
>>   +    /* See comment in pud_free_pmd_page for static key logic */
>>       table = pte_offset_kernel(pmdp, addr);
>>       pmd_clear(pmdp);
>>       __flush_tlb_kernel_pgtable(addr);
>> +    if (static_branch_unlikely(&ptdump_lock_key) && lock) {
>> +        mmap_read_lock(&init_mm);
>> +        lock_taken = true;
>> +    }
>> +    if (unlikely(lock_taken))
>> +        mmap_read_unlock(&init_mm);
>> +
>
> I'm missing something important: why not
>
> if (static_branch_unlikely(&ptdump_lock_key) && lock) {
>     mmap_read_lock(&init_mm);
>     mmap_read_unlock(&init_mm);
> }
>

The thing you are missing is that I unlocked a new personal record in

dumbassery : ) I was focussed so much on the static key logic that I

forgot to change this code from the previous revision.

