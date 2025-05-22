Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2051.outbound.protection.outlook.com [40.107.20.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A78286425
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.51
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747908301; cv=fail; b=c6MOubVEHY0GwlmXrkQlx2OzuvgAWUet6eXhkolSNI9gb7TpGmHoETHatfPiGKS5VAKkafAPTzxsq1hHNLzGhvalPLkk8yFxLupmpo8MbsHrr6cK9YLXI6aNp3QIgu9O4I4aGMHp2cLO7aW5G55AKP4YOxm7f9tzc21drABmr+E=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747908301; c=relaxed/simple;
	bh=ilKOradm2DuAJ73ZmaJLTZr46PR38f0VLxu+VsMB4xc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Gucj3/P/DUcEL68G+KsCekjsRv7cUj5aoIGXXEBGqEcTqZhG/+XuKWfrlD3M45AW4Th3FXRlW6VtLfTBHcowcbOjKxW2IgscusVb/U6emVL52YOP04gof5x/xHl4SNxMwIUy0bQWG2LdbvjZB7UKh6oX3uq03Hv5SPz4xbOkc5k=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=rVXvsg/a; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=rVXvsg/a; arc=fail smtp.client-ip=40.107.20.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="rVXvsg/a";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="rVXvsg/a"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=GsyNTGyGWx+xksGmxfFwF9rcwyKThJt0KzbnXb25BxgEDOiT/H16DjNX7J1OTL9wJvekfAdKOfv6AivRRJnRjIroSavorxK3WWLmr5QCNjjUUS4DRkRzwvg2hBrhLsTkDFmlqPFn7uMH05vHVvaMoEPii8rPHFXYpPTEWh4u/rAE9A1SU3dKH66qV7bxpVCzpLTfRdAJT0ok+FOg4QWW/HsxHAb/HLemucZgUgyO+KKx/CWDHua/VzWEXiQQROAJU5ot0MaBVS8uX58MFDbQryK1TGYf1nWnp62UcF6ZQp0Vf3Vbvqew7cNQFLo1j9Scg2yuBZt/bjKkKLJHdJMyuQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+5SLwSUMxa+6cmExz9zYE8dag0PuseuiIrl7TIh/6s=;
 b=DthuXr6FbJXn1VDorhyVIUGn61tsVrCM66GxcdVr/Ve5VIgNZtycSu1dMyWPiDPzk/CWvtjQfODKUvJoTfXauujtZElpisFTBjl61XL1G91oHRQjjFfGqPc/m+FBV7GG4GxuRjaYDAhFg6N4NQO6NRkyoZwTNZm2AtVghmFrNcfcur3rh9mp5Xmsq9QHbqCQOdEjM9MJXH2Ai4WIFIbF5uzK41S4EkiZrJem9rvtoxj5Ey7KOr+IFJ0I1GB+s820mWqYD82kONOnBOiTGYii0+f383ceBSO1zwBFJJBYOcJD/W6bKt20N+7lTL3mtkZvAKv/NeTZlpEDnfjg/ACHDQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux.alibaba.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+5SLwSUMxa+6cmExz9zYE8dag0PuseuiIrl7TIh/6s=;
 b=rVXvsg/awFjX0KPBEk1m7NvtV2OYB0A1ujtwyCdYcEWMlw6o+PU2TyiJaJ8zpyfpCk+28g7nnR4DLt2zeOoLauyZamRi8mVM4311sHOFfrwQ8hgoLX7MKiZs+TmuSJrUK5s5j6mx0/NYWsrQnskOPm6x1NeqMat+IGRzfqWK5rA=
Received: from AM6P195CA0107.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::48)
 by PR3PR08MB5723.eurprd08.prod.outlook.com (2603:10a6:102:89::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 10:04:54 +0000
Received: from AM3PEPF00009B9E.eurprd04.prod.outlook.com
 (2603:10a6:209:86:cafe::53) by AM6P195CA0107.outlook.office365.com
 (2603:10a6:209:86::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.29 via Frontend Transport; Thu,
 22 May 2025 10:04:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009B9E.mail.protection.outlook.com (10.167.16.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Thu, 22 May 2025 10:04:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HP9gQal3u6CmqA568Hk/vSGfEBWwLWWYWetlIy+VS5OVIzo6nlmoMHZCoyFJp+V3YeSfdQhhjeDwmqUjgPvyiozeR/RpyeR+Y8FuML4NSTnPN58qny9LGEn/bFF00T6T+UjxM5nhUHRGMslugBmLkuFBI5FUu/gZjoQGCEbQrbqd2vm2abm6h6QB8ECsiqBIipieu1yhwWXPPjw3GHsd7FF19UrFBAG5B08baX70n32R/l/3GyhPBKVssL+rmvaX6bX4kMm5dqwEfspM1Msivae/QkDEjZ9IAh9s7TLrIQnL3ufXtb5j8X4AvMIzAuZqVa/q5REpv09xa81/9n4RXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+5SLwSUMxa+6cmExz9zYE8dag0PuseuiIrl7TIh/6s=;
 b=CpWh6hpF7+mC6chJeexUmmz/aeIiibcxclLGC7dFM8x6CGnshoRYWLPPacbkGDBeyG9E0XYzUEdoaBZOMxtlM5b6n3yUrqEU+wXIze3Ddnc+3dNBxOVGVunTxJENu3R82qfzoSFtHFi/m+b7oZ2RtYfBIV25NJErYr1WtVzxO0hM8FCLbkQ0Dv9RYuWIw7GRbsubNwMMZfvvTepnkNrLv4FpN8/UNLvvA92JqlKKUO/UEufflVsHaSP2CLWC7CsyWk9w6MwY/J7faK0NWNyElaJyZQ9/fgMGOty+viQUtbj4clrzkaNPhvkSchepvfb0bnc1V3WITU2cmf6HgCvBHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+5SLwSUMxa+6cmExz9zYE8dag0PuseuiIrl7TIh/6s=;
 b=rVXvsg/awFjX0KPBEk1m7NvtV2OYB0A1ujtwyCdYcEWMlw6o+PU2TyiJaJ8zpyfpCk+28g7nnR4DLt2zeOoLauyZamRi8mVM4311sHOFfrwQ8hgoLX7MKiZs+TmuSJrUK5s5j6mx0/NYWsrQnskOPm6x1NeqMat+IGRzfqWK5rA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AM9PR08MB6225.eurprd08.prod.outlook.com (2603:10a6:20b:2de::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.35; Thu, 22 May
 2025 10:04:20 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 10:04:20 +0000
Message-ID: <1752d2ac-f346-44d9-aa2f-bdd8f046b446@arm.com>
Date: Thu, 22 May 2025 15:34:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/khugepaged: Fix race with folio splitting in
 hpage_collapse_scan_file()
To: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Shivank Garg <shivankg@amd.com>, akpm@linux-foundation.org,
 david@redhat.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: ziy@nvidia.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, fengwei.yin@intel.com,
 bharata@amd.com, syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com
References: <20250522093452.6379-1-shivankg@amd.com>
 <3eae6bb7-4865-44c2-8603-dc2bd8e3609b@linux.alibaba.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <3eae6bb7-4865-44c2-8603-dc2bd8e3609b@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0012.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::11) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AM9PR08MB6225:EE_|AM3PEPF00009B9E:EE_|PR3PR08MB5723:EE_
X-MS-Office365-Filtering-Correlation-Id: 378e4f66-b090-4ae2-a413-08dd99181987
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?L2JjNzZDdm1RV3kyYkhYOHpQSDFWakg1R0ZsWUVmem51YTVXL0ltWVdLQ2lr?=
 =?utf-8?B?dmY1SUlRTFpCTW9pYTMwNXBWeXBIMFVnaVQxNjIrbmtKZVlYVWJneXg3M2hW?=
 =?utf-8?B?OEF1OXhjTGU5WlE5cDhOK0R2Mnlta2ZxV0laLzBGTFZpKytFU2tJeGlQRHFF?=
 =?utf-8?B?NmdnMUg5cW1pbTVtNHozUmhMS0pDYU13TWdlZFYreGQyMWZ2VVVpZE9tM0FS?=
 =?utf-8?B?S0h1TElYR2pFTlI5RkZHb1BEaDl1VkN2dkV3c3VLSWNDRm9NYzJqUkl0RlpE?=
 =?utf-8?B?SEVjVnkxZi9HU1pteW50OFJ6QUhWaFJySE13WURWdmlwam5tR0pHc1FvYUw3?=
 =?utf-8?B?SHIxSnlxMlA5N2lLVDNtR2R0S0JZd3E5QS9NOVovelUxVkxtRGFlV1VFSENF?=
 =?utf-8?B?d3FVT0pwUHplZ21pdlg0RTVpUXNaLy9JMVNqNVZqeGc3K1ErOEV4RDlYeTJE?=
 =?utf-8?B?U0E0SzZqKzBTSDU1Ukt5QytNVHE1NHZvODFRTjlZK0ZWZXRwVGNLZEFPeHJY?=
 =?utf-8?B?WjA3TG9kQlpaOXRYM1IweXJrM1ZZWkRYOWNGYjhBcnVsNkc0V092RlNDSHps?=
 =?utf-8?B?d0dCTlUweXZSZTM2QVpCQW82M3ZYaE1ocVdZUXRsTGZMczNhQjhsK3NFclpX?=
 =?utf-8?B?TTF1NXN2cy9IMExPRm4vSFNjaG5BZ0xhNVpDVkQ1UUdBWEdvaktMaExCamFR?=
 =?utf-8?B?V0ZTaGxXcWN3YnlJN2xpSFllMk0xd08ycWJUTXBWblZwNGw5QUpuRDBXU1hz?=
 =?utf-8?B?K1ZhMlVjbFpRaW9xV0JUT3FqYUIyZGNzcU1wbHpGczM0Tms0Nml5aUEwdUFY?=
 =?utf-8?B?emtFK0lhNmtDcDFBNkdqMnBqUzFWQ2ZBdDZHNlo5dytRbzRlRFJCTEJ4bFBU?=
 =?utf-8?B?dzQrdENIR3hoL1ZoeWFiTkROVU5vSE5ReEttNXUrTS80UkpPMG1qSExQYjZY?=
 =?utf-8?B?UlVURDJ5VmQ5VWYyT09JaVN5UjVzQ0I4d2pKNm1aR1M4bHhkUzNhc0ZUUGpx?=
 =?utf-8?B?SExJUERCWTRBOGxFaEg1RXlKRUw4YldtTWs0OTVhYjJUek1GMnlYUHhhUVA1?=
 =?utf-8?B?YTByOVBwZGpHRjdvUUhZRmM5eFpSdWlMWlJaYXhBcVBZS3BIMXhyVTNFR003?=
 =?utf-8?B?RUl4OW45SE5VWTlpcjMrVjhkdTZBZjZNZldzZStML0w2WXNtVDRYOUMwQkVS?=
 =?utf-8?B?TWh1VmJkeEQ2ajN2elI3WDdvVURpdEFjN1BBRm1zaVJBNUcrVi92NlltcDlq?=
 =?utf-8?B?bnFadk50OVh2Z2hkRzFMTjhweW4rUm9rdG1xTWRCYzZIcVZKS3l2SkZIQ1Q3?=
 =?utf-8?B?K3N2V05FMWlKWklkSWUzYUl1YmR5b3dzUmRQak5qUm9vY05xdTJ4bis3T1Ax?=
 =?utf-8?B?N1NPT0NLSjd6ZnN1c01MQzZ6RTYzZ1BsYWtVa014UmJyVzJQK2JEa1RVTDVo?=
 =?utf-8?B?U3JHTHQ5UHlzenEycExkNkpvWFZUenhQQlZ0ZW1FeUlUN1hiQmNwQXBTOGVj?=
 =?utf-8?B?L3c2d2Z0eEZhc3JONExXUkFFdjZQTFVZSHVXeG9NTldUcmtKY2tnVWNlQTRl?=
 =?utf-8?B?UjgyUzhwMmk5UGJWdWxpTGNSN29Pd3d3UFlEL0tGd2tMOXVaUW41SWtqdmJl?=
 =?utf-8?B?SHgxSEw0eTFoeVI3OC9lZTNubjZGNytrejRtSksyN2crMVV6ZGV3ZVdJZnNa?=
 =?utf-8?B?T0p4VjhGUDVmNHJOY2g4TnJDU1diQ3QrZGJRMkpmM3J1MU9sVm92NForN2FN?=
 =?utf-8?B?YmI2L1pmTHoxeTdOU0VYMW13YXl1R1psbEtBRGEzeWtuNzBvKzVXTlJuajFj?=
 =?utf-8?Q?8ttyIgC/i7LjQYT5bEl0VGuc9V5UiYlhwRcNE=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6225
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009B9E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a66f6f92-14e4-4095-fddc-08dd99180511
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|36860700013|82310400026|1800799024|376014|14060799003|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZnBBUy9Rbk5rdFl5WjRvelhtdFh2dmtQQWJsd3hnQ3pHZFIrN0hRU0hnYzgx?=
 =?utf-8?B?czl6NndHeGo5L3FLYmFqTnpFWDJnNmhqZ3pSeFQxZzN6SzhUc3RZU21VeStw?=
 =?utf-8?B?WTJnQXlUOHNHd2JJSm04ZFplTlVNK3Zlbng5bmV5WUJSZ0loSmM3QlpkeTVZ?=
 =?utf-8?B?czVlTkJId25aa1Y4QXRFZ0d6Wmp6eUY1QzRTOEtiVXpUY0s5dlRnanY1bEJK?=
 =?utf-8?B?d1E1R0N0dHlnTXJUWGJXUmNwZVBEeUs0WDV5V2gvMmloektWZE9KcTI2VlFo?=
 =?utf-8?B?VlJPZ3YvRUhURnArMWgvcytEM1JveFZkc2Uxb1hoRkpPdytXYmwvSFVBYitK?=
 =?utf-8?B?RW80WTJLSUtJVDdtdEtXc3U4dzZWbDNrVzlTWWJtTlpQZ0I5VkpvZ0N2cENy?=
 =?utf-8?B?UFdBV2tDSU5NMk1sWjM2S24zZ1FJUWVKOWtaSW94d2x4SGNjekpiR2hHWXhj?=
 =?utf-8?B?K2tENUhoLzVnN091ZmRNbW1FVzY3RThBaXhuWWtHZ2JWQlR3ZHNRWnNTb2pm?=
 =?utf-8?B?c2F6c3BDcmU2cmx2ZVFkaXZsUExrY2xXQm9mZ0lhdEpLUWxQT0NyNGhHMzB1?=
 =?utf-8?B?QTYwK1AyZ0toVzhmUDE3YlRTVFpoTnNXckFhT1lQUmZnYXpGSXJYR0drMThG?=
 =?utf-8?B?aTJ5MnNWLzNPZW5rTStsdGZZTlFMNW9TWkRxQ1JYRUhRc1ZUeXFBZ2hWRzFn?=
 =?utf-8?B?MmxsK084M1hOTHRCd2dQYXUzQkdyUmxYejlzaWl5WFVKNkhSaHhHbkdZaURH?=
 =?utf-8?B?dHVoWkZOS3ovNnhvclNpR2NPdzFhbUdxczd1enVwYWJ4NXBiSDdxZzkvazZl?=
 =?utf-8?B?TVgvUkFqeEswVHNtMEdHMVU0UzN3NVJ2OHBOVndQVFlGUjBpb1NCbFRTWWlq?=
 =?utf-8?B?bHhjZEVUQ05FamxMTm9DNmtvYlVNNE1uM1hYR2RzelNGcHUwWE5La3NzaXhm?=
 =?utf-8?B?TVM2citrTnNuZlZZdUQxTlJPTXEvcndnRFRlNlVXVGpPK0hoS1ZVMzRBWWpL?=
 =?utf-8?B?bW84c1h2MHo5cnNaOWhKUk1UbFFCVlpsVElEV2Q2cGkrbCsrRk1VYk9CckYv?=
 =?utf-8?B?OWRobXZIOXp5eVZ5NG44a1NBUjZBVURackdoYk9MVnNId3p6bVEvY1Z3Rkta?=
 =?utf-8?B?U2Yyb0JraTZ5bWhRQUtWcVcyaVRwc2IzQUZNQVFFWWdGRzR5Y3l0TVE1N0k2?=
 =?utf-8?B?Yk5GUjBFb3dITFpqTFZmSS93dzFZTk8rUitseXhoV25jb09nQTdMVGJzWHBR?=
 =?utf-8?B?V0EvZS8vbVNyYjJpTkY5MUM5djlSN0RJV25NdDNRMEwyWjNPUWYwalAzcFpw?=
 =?utf-8?B?UC9FN0l0Q0ZyOWpTWU1GanB0Y3FhOHdXUkR5UDUzclJadGNIcHpxSmRaRHpX?=
 =?utf-8?B?VzA4NUNxcmM3REpmWkJPS3NXeFZxeGFJVmN5Z2RDcDlJdlFVVmJSS3MxWDRp?=
 =?utf-8?B?bzRYN3pBeVd1UEN6WWFnRW44ZjNuemtrckVTd2VLR015cWRsU0pxa0RDZE54?=
 =?utf-8?B?eVN4ZHhQVVhYVWJ4eDJoYXcxY1ZHQ2JVTm9SeXN1L2cwdFR6ZXNJTHlpU0tX?=
 =?utf-8?B?RlR4T3lIOWcvc0dpQzNiN2trelM1RDZtbC91UER3ZkxTOEhYYk1RWGo3S3Yr?=
 =?utf-8?B?ZTVwREVCSVlmaVlKT0dNU3VYMEJjcmFkdXhMV2ZGaHNWYy9uT3Z5T1J0aTVx?=
 =?utf-8?B?RGdOU3ZtbkFoWWJuQ2pySGdob2ZTbmZCRUEybmViSTBoTElVNVVreXBGOE05?=
 =?utf-8?B?Tm1XYkYrRS8xbG5pMzVNSUo3dUFlMkYyZXNXaitEaEdPZTRGZUtCcDFOYTI1?=
 =?utf-8?B?VkgvbkVLSWV0YVFZZW94eDEyaXM3d2JhQ3JUZVdBcUEwaWxDQTQ5OU81SEgv?=
 =?utf-8?B?dnNIazhVRXRKNU85Y2hjSWFUV1VmVndVQ2hQaXJJZXRER1Z2RGZtR0x1WjU3?=
 =?utf-8?B?RGgrclJzQ2doUWJ3ajBPMHpLcEx1K0QyQXY3L3VQVFc1SldwOWg5TFUvTkh5?=
 =?utf-8?B?N09uMkNaVkRBPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(82310400026)(1800799024)(376014)(14060799003)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 10:04:54.2192
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 378e4f66-b090-4ae2-a413-08dd99181987
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5723


On 22/05/25 3:31 pm, Baolin Wang wrote:
>
>
> On 2025/5/22 17:34, Shivank Garg wrote:
>> folio_mapcount() checks folio_test_large() before proceeding to
>> folio_large_mapcount(), but there exists a race window where a folio
>> could be split between these checks which triggered the
>> VM_WARN_ON_FOLIO(!folio_test_large(folio), folio) in
>> folio_large_mapcount().
>>
>> Take a temporary folio reference in hpage_collapse_scan_file() to 
>> prevent
>> races with concurrent folio splitting/freeing. This prevent potential
>> incorrect large folio detection.
>>
>> Reported-by: syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com
>> Closes: 
>> https://lore.kernel.org/all/6828470d.a70a0220.38f255.000c.GAE@google.com
>> Fixes: 05c5323b2a34 ("mm: track mapcount of large folios in single 
>> value")
>> Suggested-by: David Hildenbrand <david@redhat.com>
>> Signed-off-by: Shivank Garg <shivankg@amd.com>
>> ---
>>   mm/khugepaged.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>> index cc945c6ab3bd..6e8902f9d88c 100644
>> --- a/mm/khugepaged.c
>> +++ b/mm/khugepaged.c
>> @@ -2295,6 +2295,17 @@ static int hpage_collapse_scan_file(struct 
>> mm_struct *mm, unsigned long addr,
>>               continue;
>>           }
>>   +        if (!folio_try_get(folio)) {
>> +            xas_reset(&xas);
>> +            continue;
>> +        }
>> +
>> +        if (unlikely(folio != xas_reload(&xas))) {
>> +            folio_put(folio);
>> +            xas_reset(&xas);
>> +            continue;
>> +        }
>> +
>>           if (folio_order(folio) == HPAGE_PMD_ORDER &&
>>               folio->index == start) {
>>               /* Maybe PMD-mapped */
>> @@ -2305,23 +2316,27 @@ static int hpage_collapse_scan_file(struct 
>> mm_struct *mm, unsigned long addr,
>>                * it's safe to skip LRU and refcount checks before
>>                * returning.
>>                */
>> +            folio_put(folio);
>>               break;
>>           }
>>             node = folio_nid(folio);
>>           if (hpage_collapse_scan_abort(node, cc)) {
>>               result = SCAN_SCAN_ABORT;
>> +            folio_put(folio);
>>               break;
>>           }
>>           cc->node_load[node]++;
>>             if (!folio_test_lru(folio)) {
>>               result = SCAN_PAGE_LRU;
>> +            folio_put(folio);
>>               break;
>>           }
>>             if (!is_refcount_suitable(folio)) {
>
> You add a temporary refcnt for the folio, then the 
> is_refcount_suitable() will always fail, right?


Oops, you are one minute faster :wink


>
>>               result = SCAN_PAGE_COUNT;
>> +            folio_put(folio);
>>               break;
>>           }
>>   @@ -2333,6 +2348,7 @@ static int hpage_collapse_scan_file(struct 
>> mm_struct *mm, unsigned long addr,
>>            */
>>             present += folio_nr_pages(folio);
>> +        folio_put(folio);
>>             if (need_resched()) {
>>               xas_pause(&xas);
>
