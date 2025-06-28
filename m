Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012012.outbound.protection.outlook.com [52.101.66.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22F63595B
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 03:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.12
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751082223; cv=fail; b=UJVKSE/jD2srECxfcKIQXK1lo8DHiTWg/Yj8E++67RQpyFnX63MKEIc+V5lz92RiIxhh6Ji2DxDI7dYoYVDQFncnkDLrLXG/eBU8mB8yoGLrBXM2/f8nfSpgenl7dk/9xshicDrnHJigRt5OqVHZSQWBPdCUnK7jEqm+kH5uX/0=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751082223; c=relaxed/simple;
	bh=gIdsEkUrYakT1NSrSh4xjR8MImoTCDZemqpVfAyeKGU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gIvN2Bz7H1ipfWvcqP8frlRLINYc6kyE2gH62+I7mJUnm00jSOUDEJRb+CKegwXytr3+B3sLzZ1aR7U6AvW7TerXbkSQQUvVZ32zlHskvqcLasHVf443/vrffqrogVU85t1E/k7P1gY0RHyVuU3+ktqTXRqmOkqz9El5pQGMyok=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qW/5V9MO; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qW/5V9MO; arc=fail smtp.client-ip=52.101.66.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qW/5V9MO";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qW/5V9MO"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=wQZEKspuS4mfGCSTXATr7/XojGgonT2NSQ2DlKh37/EG3g3ACEe10cISgO1EXP0im4DWlbpwEPo0b6KKT+4ARFQ5yDJ2mrjC9cCrgyrBMRzUgXgBHZkRnHmYCo5tWtF80+fALiUltDMWQtTjO1gx6nyQAgyuK/uq4bXWB69BSkx0JfqBooDPqmoloRgrRG0Sya3N5hh30iiAQEu6RpcaPAl4gbXHzi2GD6cZUZ6UjXY3glCF0g8wZSJFi/SVz7jzfKxbrkQAFghSm5sP3+xJMFug07nGazQ3rmqfN3Qa2P9+7BJtUpxdEFfRDSuQwMVB+IKdaUziQm1Mx9J9wbcGAg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1dH/gieoz8n3TXPR9jYC+4XcqSnGd76I+6NeKPb+3TQ=;
 b=tb9PiXkNIc3DfbVXEJ5KGWciJ4UK/HXQ6tW250v/xf96YMWQy7ucAZEDshcpTsZUrJZIoeKtG0fkgCnWSYJ7UQy1+1ctah9SWu3FlHTEQRs3AYtKCn4e6BbwmF4S4Hv12AyAQy6kPELGrYBd3gIKtx4rIpq4W5WoDxl4ZJ4yrVkG/uUa0upeHPDlJVpg/vU7bkf90Ooek2Lbvt9kNjWtqgP5QNoCHvAW74B3r3ELtDCYmZn1oz7+xvCT7JZbci8wTqGZnzYv0F/780ezsXme426yaiY6dHqiJBDXz5S/5wTNLvFQHY9vnew4YdGFJAymAw7EVYGi/hen7L/FkLJN3w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=redhat.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1dH/gieoz8n3TXPR9jYC+4XcqSnGd76I+6NeKPb+3TQ=;
 b=qW/5V9MORxKBZRHYpyhICY/m9bcthaiqItbQJ+lE1/1FL4d9ISBjNvGm7D9eKmPmLLtSqAuJXDOVR03YWQPkIEXFl/AnV/vl5Hsai4Mp4MGRtiqAM/wlPjbcWb+mPE5l2+szbMi45c8EU0Vl6nTSqzGzDBp2/2CuzcUzFp8qBL8=
Received: from AM9P195CA0007.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::12)
 by AM8PR08MB6484.eurprd08.prod.outlook.com (2603:10a6:20b:357::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.18; Sat, 28 Jun
 2025 03:43:37 +0000
Received: from AMS1EPF00000047.eurprd04.prod.outlook.com
 (2603:10a6:20b:21f:cafe::a0) by AM9P195CA0007.outlook.office365.com
 (2603:10a6:20b:21f::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.20 via Frontend Transport; Sat,
 28 Jun 2025 03:43:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000047.mail.protection.outlook.com (10.167.16.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Sat, 28 Jun 2025 03:43:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tlPjxv9Vci3LV6IOrJOCIC/1mva7EQqdHIVtPMnu4L9dZoluFNEe0egvZ/rVDGZLHw6IyL/9HaiBD8FHUjJWhjxB/4ow5SDeyBgeopak+XNQfqSPg4hl8lyYKMAtafwHtKYjOGqbmhrnqVD5Q4Recvn7+iw5lTu/jex3VEQywRSvj3XjMeW7vkPQH7vdzAYlTiISUKqmZ55h0gHBO1F5LE9BF/AX7fLbP3ALiGw9rAKSvQXlL6lO0+dPdKwidg+EovI8sfXq8K2RLBICANzDkQWuaOxUxcYg/3sklkKrep7GnR9Pn0rEPCuX94CZQHfbFF7Mvo7R6+cQrGSaeZaryQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1dH/gieoz8n3TXPR9jYC+4XcqSnGd76I+6NeKPb+3TQ=;
 b=JHsilU7c6JI/8oXpaw5tTquh0k0DiMAlnJoGDWIA6IQj84wvN+Jm2QV9c74G3K2Vimb+3ejYyWL8ghjkd11Xv9utErdsZ9R5q6ceFriqBETNMizxmKwq81KCuzidnj9gp//A/vtw88G6AlJnbVpo8wcZLBvFzPs2K5ohmrPfd4+9a4wop+ZOezGWrd7+HN5CPfp9J9ql3z6lVPQMDvScv4VfJ/cdQVMsXRPfogcpmC7I+WSVb3YVRbTrVpLh5mHv2eHI044aTpBplydysyL5eWf217ijzXRpmfilTTlitwrVX+FpcpugOHio6VPywftVy2YBPWOsjCSd4BR8ogLgSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1dH/gieoz8n3TXPR9jYC+4XcqSnGd76I+6NeKPb+3TQ=;
 b=qW/5V9MORxKBZRHYpyhICY/m9bcthaiqItbQJ+lE1/1FL4d9ISBjNvGm7D9eKmPmLLtSqAuJXDOVR03YWQPkIEXFl/AnV/vl5Hsai4Mp4MGRtiqAM/wlPjbcWb+mPE5l2+szbMi45c8EU0Vl6nTSqzGzDBp2/2CuzcUzFp8qBL8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DU5PR08MB10802.eurprd08.prod.outlook.com (2603:10a6:10:526::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Sat, 28 Jun
 2025 03:43:00 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8880.015; Sat, 28 Jun 2025
 03:43:00 +0000
Message-ID: <ecca3a0e-b78e-48f3-a824-97092f3ddfbd@arm.com>
Date: Sat, 28 Jun 2025 09:12:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: Deduplicate mm_get_unmapped_area()
To: Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Jason Gunthorpe <jgg@nvidia.com>,
 Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
 David Hildenbrand <david@redhat.com>
References: <20250627160739.2124768-1-peterx@redhat.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250627160739.2124768-1-peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0174.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::12) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DU5PR08MB10802:EE_|AMS1EPF00000047:EE_|AM8PR08MB6484:EE_
X-MS-Office365-Filtering-Correlation-Id: 62f96439-c1c1-4dd6-85fd-08ddb5f5f706
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?RnNrRnkrQ3pqRXZuSUFmTndJQXVpckhQcU5yeFYwQWVpZThQQkVOQ3U3NmVY?=
 =?utf-8?B?UUc0Ulo1dG1QWkgwYlo2Y3hYV2R6cUZkSzhGbnZhMXFiTmhBY2FHR3VHVTVr?=
 =?utf-8?B?WW1qZ2hKa1h1WHRnWEthRytVWTJRd1kwVFZFSzEwMzVSWFJLeGZEQzJJb2JY?=
 =?utf-8?B?YWsyaVlFZEE5ZTBOdXRadjFXRng5NVNQOHM5dFlvZDN0WlVSNE5YazlTeTVx?=
 =?utf-8?B?ckV3S3JodHRNbmdONmVQamhNZVVDM0R0SEdRSWFacnVhU3FGczViOHNvRnRt?=
 =?utf-8?B?WVlyOE81TmZvQUNVcTJCcGZmUEVjcE4wL1M0eStkalpNdzJxSDNhaXpXZ3Jr?=
 =?utf-8?B?RnRWTjkyK2YvVzducVl0SEhRenREaGJvVkFQcVFyTlhFNVhaY2hvVkpieHZW?=
 =?utf-8?B?Njk1OXl4VTArUE1IekM2cDhnRVIydWJSbTF0QzFyZXZPSzQ5bGFsUnFTM3c1?=
 =?utf-8?B?ODJ6aTRRSGhyQTFlbEpENTdHT1htOW1zNXJ1ZjBtcFFWa0FPYjU3SzJpSU93?=
 =?utf-8?B?R2xCdVhiblV1MWt4cDh4bGQ3aXNmc3lSSjhLT1VIUVlBUWtKN1lxbkdGTUt6?=
 =?utf-8?B?bkNKL01GNEN1MDJvc1VOQy91dUJCdVFIemlaejVzS2Izb2lGSGp0bUJSM1RV?=
 =?utf-8?B?eEZaRXJDN2dadDROblhTQ3M5K3F5N0tBaEhWM296Z1VYTEF2dUJ0dm1zVEpx?=
 =?utf-8?B?KzFzWmdRYkxoTDRCcWs1TkFIVGNJcUFBdDdiajBpTlEzQ242Z1A3eW1LYlhP?=
 =?utf-8?B?WHhCdThlTUx1aW56QzVsdThXWkpBN3dXeFNISndTM0Fza0NFUmJCNE1xWmJo?=
 =?utf-8?B?TkRQUjh6NVBkbUZaaGt1VUI1amFvN3d6TngrM3NkRzFuYm5mNW1Oalpwb1dy?=
 =?utf-8?B?ZHFZWGZydEJzVjdSanEySnRYdmY5SmxNMUo2VTBlb1V3ZjNSMWlpcm56ZWsv?=
 =?utf-8?B?dDFPUnc2Z3ZVeHkxRVZoWUR2S1RYM2NZQk9zOWtHTFBuRnF2TUxPWVZwN29S?=
 =?utf-8?B?b05qM3VIUk1QNjZUVjN4aVhsMVlDaW9nZXN4VC85ZThUQkYxNnNTUnV0ZFRS?=
 =?utf-8?B?am9aa3JJNGxUS3FibXJINWtwSnN5WFZLaUE5TG9TaGV0TEVjWHpLOHF4QjE5?=
 =?utf-8?B?RnFCUE9zTXRSS1hnSFU0WDI2RStPdHVaQzMzSnYwelFvMFVSNVZjUFZUMGtT?=
 =?utf-8?B?MmhxL0MxQmRGS2JhTmJHWXZZMHc2VUxsNTcwUFlMQzlNK2V5RWY3TXRiVWxt?=
 =?utf-8?B?eEJzTlZoaHhOdjRLcVVobXUwT3B2L2x5M1hzWXNYeW1YalhKaFAxRHJaQ1FV?=
 =?utf-8?B?Mm1PNEpaYlduRk5rcmh4R2Mra0pnNGt6WnZYajEzSGJCUStUcHVMSVB6NmVS?=
 =?utf-8?B?VERLenBzM1lTYm1udmxCVkM5M2JnYkxLUnA1YjgyY3BNL3RtTitTVXlIankx?=
 =?utf-8?B?NjhKcHRoOUxSRW83TWJCMFB1NkYwZHRHeGc1VVQ5RHFZYTMrNFRxZDcxWllh?=
 =?utf-8?B?Z1dheG1zam90YWFsK2xUWmcrd29ueEZwblJJakJLQ2FSRURobXBQenAwelNk?=
 =?utf-8?B?Z1E5UkdLS2lGZEg3T3VtbTAwcDg0Yk5haVVoWVgzMmdGNnFUbHM2UEpJa3dR?=
 =?utf-8?B?OE54dlRYelo2T096YllDUkVDNWsrbUp0REdqT3YzK0lTZVZLOHpRSDNQOGtz?=
 =?utf-8?B?ZENobTZCdWhrTkU2dERiWnZpMVp0WXZwaHFRaGdDMlB1WThycUxyK0d5T3g3?=
 =?utf-8?B?TWJpOUVJNDhldlVsNXVJSkoyR3JySnYzNkhySXZvUzZMb2dBNGVrV0Ria3Rv?=
 =?utf-8?B?aG5hbnhnSHRsVDNJWGFXaGFQTmluV0JNUnNDS3VjUTRJVGp6T0JDM3hicE1X?=
 =?utf-8?B?VjdTZFZhckNZb2JvOGhRYnpnclpxVStWVzJlTUo1eEpzM3FVU0ViTUV2TDdX?=
 =?utf-8?Q?mLNf9tkmysM=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10802
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	53f32d81-e62a-4547-9507-08ddb5f5e0d5
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|35042699022|1800799024|376014|14060799003|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WEJac2R5azJVSmk1aDlxSTZoVEFPK1dsOEt4VEU4T0FVUmY5OFJEbDJxZ2lH?=
 =?utf-8?B?VThCT3REd2tuRjVkNWhvRzRBRytMY1BTamZTZm5LYUl6WEEraTRrWkNSZjg4?=
 =?utf-8?B?bW9PMDBqTW1aUUMwRjh2em5JbTJ6ek12WDFUT09TQmdZaUl3QVlNS3hSeWVz?=
 =?utf-8?B?RW12bkJLUlNOZ3FRRXNjY2JPV0tUM2RXcTNDZVc5K2dsd2ZGeEQzNHJvWGZ4?=
 =?utf-8?B?a0ZlemxhOEx6N1Q1bkRQN3FMbElRNmwzQW5RK0JwcTloTUVyYjFDZEd3YVlS?=
 =?utf-8?B?YTl3Mm5ETnhOeU40V09kUjI3N09XRUt0UGJJMzZkR0lXOHQvaTQ4MVNpd25I?=
 =?utf-8?B?OStCcFlROTZaTHV5VXc0dVBwcnVxb0lmczRpQ0ZVcUpxQzNNZEZ5SStxWVFD?=
 =?utf-8?B?SGJ6eU8vRzlRaGlvUGxiMTNlTkRmSWtMQ2Zad0RoMGhQM0VHekJ1UjREQ2Yr?=
 =?utf-8?B?UkZ0ano5TlNjclJuc3dDZHR5eTZaRkxGU3piWGJ4K1prSFNIaDFxWVhVUnlB?=
 =?utf-8?B?WEQyWVkybG9WNG5OdlhFWUJ2aktjazhqTGthZkxRQ0NmOWQ5NDFIN3ByNHQr?=
 =?utf-8?B?SUM0NFNEUkRlRmVVUzkxRzVhR1ZDaGJ3UHBDM2tIRnVJc3JoUkZGUkFvMGZ6?=
 =?utf-8?B?NkdJUWY4SXhnMUk0NUw4dkpqa3ZiTkRvNFRUZkkvaHgrbHVJejVYTjZjeXFE?=
 =?utf-8?B?citpNUtDWkljOTQ5cWU3WHFKSVZyZUxYeHdvRGhlaGR1bndjYld5bmhxQkJP?=
 =?utf-8?B?UGZiTmZuOEhnSFlUK0duaTBRS1hOQVpvZmRmakRtNnU1bnRtajcwaGVCWmxz?=
 =?utf-8?B?eEYyclVUK0RnV3V3TUI4SkNzSTFFR1k2MXhhRURldDJPdGtwUGV3NDhjZFBx?=
 =?utf-8?B?Z3A2U0p1dWN1bVRTbDRCTGhiWWhkQVN4SUd0aXNlWjAzSXVBamdBK0F3VFA0?=
 =?utf-8?B?VFJGb1NEeW9QbnJvbDBkdVhwOGtob1FuKzhWdk1rMVMyckxRNGdFV3RLUHZS?=
 =?utf-8?B?NU03L0NuZlR4YW1FVUN5RThMeVZIMklEelZsUEYxM0p1bVllRkUzYVdSRFhs?=
 =?utf-8?B?ZVVLYXdmaGtKT1hqSEg2eGM2cVZPNTMzVEl6eWxlR1hnaytTSUJmMjFUWVJR?=
 =?utf-8?B?Ulh5VnpQUWx4OWxSZUpKMkdsUUR0U2dTeWxUUXhmSUpiVGxYUTl4MkdqOTV2?=
 =?utf-8?B?VlF6emU2aWdDY0JUSFVxeVkvN0xhcHA5aGliNVRmQ2RJNmpDS2UvSFRLaXBG?=
 =?utf-8?B?SWlJS0M4RDhGS2hUTU5vWEoxUU5VWGxpYzMyZVdWUjdMSHc3N1QvWklUU0Vv?=
 =?utf-8?B?bHFneHNNZEoyQ0pKWFRpd1IzVFZZeXJoOFdyRU9pNkRwREc1a093T0RIWEtj?=
 =?utf-8?B?bEppR05OYVJBZlBCd2ZYWEhETGJNWUhqU0hjakQwTXdPWGI1Rk1TanNUL1E1?=
 =?utf-8?B?U3J0TGZ2UFBkZnBqaG9lUy9oRkhXUHBYQ2tVOWhiQUNSZXFFSis4d0xpcnZj?=
 =?utf-8?B?bW1WbnJQdXdZUEtscjk5OWhxL1RDNkxFellJNzBIK204dG4xMzFmbXZRZG9R?=
 =?utf-8?B?Sm5nQ3RTOTYyWmVyelNmZCswMzVzZzBiLzFTdzY5ekZ0aGh0STdUck5ZUHJw?=
 =?utf-8?B?L1ZFZ05pbnRrQzFrcjM4WHkwb0NzMG4yZDFuQ1cxVjJJSktTL2lXNDhNOG5V?=
 =?utf-8?B?MnR0S1RYcU91bmFVT2s0VVVTbnNxaEFDTzhVZG9uUWlTdkJ2UWxrRDhkVkZG?=
 =?utf-8?B?cTJmYVJtL2V0K2ZCM3JzMHkvMDh0RktqR3JoVVBudVg3Zml5SU1jdHJXZDg5?=
 =?utf-8?B?b0pzRHVwa2MzeHA3SXVNUHE4aGtvU3Bxek1tZGt2RmNOVVhISFNIeC9NY3Mz?=
 =?utf-8?B?WmlXeHpadkg1T0t0QWhIVk91dGc4YW0wNlV6aGFzOFhwYXJWMGxId0l3RE90?=
 =?utf-8?B?amJ1NEdzYXBsb1duQkEvc043WnV4b2I3OEliR0pVcG5jVm84LzQ2c2xLaGVP?=
 =?utf-8?B?aDNrdlFIVjlkMWtCNWIyR0pWOFZ5MCtoNzVwcERFT0ZJeGtxclFxSWtPY01G?=
 =?utf-8?Q?vLyB6a?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(35042699022)(1800799024)(376014)(14060799003)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2025 03:43:37.1606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62f96439-c1c1-4dd6-85fd-08ddb5f5f706
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6484


On 27/06/25 9:37 pm, Peter Xu wrote:
> Essentially it sets vm_flags==0 for mm_get_unmapped_area_vmflags().  Use
> the helper instead to dedup the lines.
>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Jann Horn <jannh@google.com>
> Cc: Pedro Falcato <pfalcato@suse.de>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Oscar Salvador <osalvador@suse.de>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Reviewed-by: Pedro Falcato <pfalcato@suse.de>
> Acked-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>   
>   

Reviewed-by: Dev Jain <dev.jain@arm.com>

