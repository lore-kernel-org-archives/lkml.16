Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2074.outbound.protection.outlook.com [40.107.105.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CAF26A09E
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.74
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747908193; cv=fail; b=cO4+nSDwkGsF+veK6DPhz7CJQNWreVM6/zWIOqMG/VQ4gq2Mo4ghmDHBexMwt6J5dICEJM2y+HmwWWmJhe3uKVEKup5CekyRu5lWevMkgjMgpMegJ1CvFDec/SZ4od0gj39XTx95uCp8uo3LFU74KApZ1QDaZbeodZcVFsFekps=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747908193; c=relaxed/simple;
	bh=yRFKiHwpYPy3XPL+D+uG6Ipk/kGyA/GvzCpbzJj+ifs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qyr7IB0+jeUJOJ/wPsVEQ7zpmcoADGkLtCSDs6oWwZo9mRxnMWfJ43XQJSO0xnuX9lGPViWBKEctcojqQHra5lTm8HflcLf0u0DxQaK6fJ6sE0+qbH1SmWS5x1G5GuufxN3mEOLsrUMW08Yal1HKV/turQ0VsivPzbbdX3JzFbc=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=JbknlN2p; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=JbknlN2p; arc=fail smtp.client-ip=40.107.105.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="JbknlN2p";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="JbknlN2p"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=pjo70ULQ94dQPmO6Sj8ORhOTbstSfM7xGIc9BQwJw/EVGQrMuwicfxmVwJigWAL5gPz3rq+zkPYnSGf0LzpaoSfXb7ExWUXK41gEz1Gcj7TmKgSz4HePnnpBHwuHr2E/KjRLNyLQlRW8E9tHQDVVOOOpckgy5f/PDqe91cXSIqlDwXJX3F2TFx3ox2jIBW0+vjYZWsh19otHWp0kiqgsewW7y7Kkj5JG+bHAnuEQKt8UKl2sZgprT30b+/zt0+ZygHXheASbab5mKvNDfDx0zsajGdRfx+9nPKItuObtth/CIWGicTQrwLdBPgwlqjILPOgT5owmc1d5QdsvIpNTdA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0z0u+lqh/+qBCMPxMnAhVIMArs6t7cb5jQl/pQs/p2Y=;
 b=RUkaq2dYTmlchAcg7u37IEoY1rMXt7yFVdh+DoA7AUfPP103UifC15Q/tF+CePK4EGpU1F884i4v9opK0g+udRBhXn3TWV0gyI8uf1kTN4wpRORXBx+e89VLb6xpqyvHBioEXINHnUWe7CO5tEEr4PthYxb3OW3uTfGhpkwsIPTn2JiDkdLXrIIlEaOh1tGWZK3+Sr+2d3eIa7VqKrHiU188206j6gYqUbgmW/0+z5W2EI+fhb9+8B7g+Q1jNxtCMROjCu9D4tfArTWUhTaxpUpyNVdge+b3F1KOwrugUKdHmtCvhQW24fZLXrFxmuiBiebWChIXGP/2NrZe6raRRA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0z0u+lqh/+qBCMPxMnAhVIMArs6t7cb5jQl/pQs/p2Y=;
 b=JbknlN2pyXxa62LpH3djtmN7GfJwtM9i/YXPq0QOf//aefZu5ftNzsreiJEkq4ILgWZwHY6WeaimaOFh3nzczshO9UBhz0duT5QWAXjFm3tCDqSUtra+5OvO/sTN+j5etKYo0Bdir96yMT127WYtrtNoOAdDEsAmjEbCEQmhVuU=
Received: from DUZPR01CA0274.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::13) by GV1PR08MB7801.eurprd08.prod.outlook.com
 (2603:10a6:150:58::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 10:03:04 +0000
Received: from DU6PEPF0000A7DE.eurprd02.prod.outlook.com
 (2603:10a6:10:4b9:cafe::6d) by DUZPR01CA0274.outlook.office365.com
 (2603:10a6:10:4b9::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Thu,
 22 May 2025 10:03:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7DE.mail.protection.outlook.com (10.167.8.38) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via
 Frontend Transport; Thu, 22 May 2025 10:03:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oYkhwHWVSTvZRnE4dSLdprGW6YxHLrsephmSfl1S6b7/aR2EUG+5rLNLdiz5J7vzuO2cGupXPc2HgcC2ZYrn2zpagf/AhS1lEOzoIQNWjIoTg8hf+eRDs5SdK39Osz7JRoCULZ4zfv+k0XgLkc18I7r605YA0hSzpJgx1tW4g/eIWPt3X98f435kfcG3fjK1MQX61gDnjzLJ0NCGs/pYIhZo/9B3lJTFsjWeoBYUaUomvzH8UwXDSHbaE0vZt4Xtj3UtG0OxoOvejRp/A4DrhZsgv+Ev6hMiP4ulcuxXSM+RCfwvQyMoAeukE4ORqZex4xsiHU5dBCQrQWoeUNliGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0z0u+lqh/+qBCMPxMnAhVIMArs6t7cb5jQl/pQs/p2Y=;
 b=oFLdFLNZ4Fh2EW6F1DRktS6yVM0m8cNG27R22+WIrtIdSbUymFvetjqJQQCXUTfH3KnaDDCvK8eXTZg5Ja3yV6H2JgJOkNpgt36ySJUp7A7kujQivb7m8RrILEE9m8CxiFB9EIbYayGe1Xyrmw1A/kZPWRqItyoJLpj4Jr1sMasC4EKdD5+HVC76ueaL0R65NBh+H6PnwUzCUNBdBOV1/bDT0st6ZcNtAV3OThQg33e8mj970+a0K8YMJhL1QYiGlY3/bChyx4S1+g+C+NrV8tYmm2RQQfRAIO3a/w139/eP7FKwFT28M3TfN/wFmrojfFQ/ZZV2TAWIePovMEkQHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0z0u+lqh/+qBCMPxMnAhVIMArs6t7cb5jQl/pQs/p2Y=;
 b=JbknlN2pyXxa62LpH3djtmN7GfJwtM9i/YXPq0QOf//aefZu5ftNzsreiJEkq4ILgWZwHY6WeaimaOFh3nzczshO9UBhz0duT5QWAXjFm3tCDqSUtra+5OvO/sTN+j5etKYo0Bdir96yMT127WYtrtNoOAdDEsAmjEbCEQmhVuU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DB9PR08MB6601.eurprd08.prod.outlook.com (2603:10a6:10:23e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 10:02:31 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 10:02:30 +0000
Message-ID: <47ff4f56-6bc0-4e7f-8b71-765a08a4cac4@arm.com>
Date: Thu, 22 May 2025 15:32:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/khugepaged: Fix race with folio splitting in
 hpage_collapse_scan_file()
To: Shivank Garg <shivankg@amd.com>, akpm@linux-foundation.org,
 david@redhat.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, fengwei.yin@intel.com, bharata@amd.com,
 syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com
References: <20250522093452.6379-1-shivankg@amd.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250522093452.6379-1-shivankg@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
	AM9PR08MB7120:EE_|DB9PR08MB6601:EE_|DU6PEPF0000A7DE:EE_|GV1PR08MB7801:EE_
X-MS-Office365-Filtering-Correlation-Id: 145fc17f-69a1-46ed-7e1f-08dd9917d7a9
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Vng3Slg2cEtKMU4yc1NTL1paRDR1VDMzSWZvK0orOWNBWVBTeFJmaFhCSDY4?=
 =?utf-8?B?YzJIcE9mWHFhYzFjakp0TWdMNjJnYXp4OTMvdFV6SUFGOVE5RDVMOUFhYnRW?=
 =?utf-8?B?MUlTUlpHTlp2Z2RTc3FLMDZIRW1hM3NqQkV1SDBPdVM3NXhuV21BOU9pbDlk?=
 =?utf-8?B?UlcwM2Y2MnNjRy9MTndNNFQ1TjdhS2tIVUN4azhodnBxK0ZWc2VvbTV1bzFG?=
 =?utf-8?B?ZXhLMmNva2h3UUFsZ2ZjaGtVelhWekRVL0lENmN5ZG5vYjJXck1KbG1jbGZa?=
 =?utf-8?B?WjVzWmRUVytOZVNjZ05LMlZzWG1sb2JBU2VtTHdqUitxRGlRQnZOWndCS1dk?=
 =?utf-8?B?V3dkZEtkYjA5SHhpcURPZElIZTgwS0hOVm5PRGpRTGRFc3MzM3BLWTZkOFJY?=
 =?utf-8?B?TThsUUhKUVJmVWxQVVA3dUFuTDdBbC9TMjBoeENlcWlUM2FRTnlCWmx5VTNQ?=
 =?utf-8?B?L2ZWREM4Q25jbVlSNGJ0YnUzRmU1WWdnQXNTRUVPQkJOM0IrMmkvcFBrSmp6?=
 =?utf-8?B?SHMwazdsbWMwNEx1RHJFdlpmSmNRUldiNHpMcXpTNDRiR0NMMkRheE4ycHNW?=
 =?utf-8?B?ZG1Kb3IzdGRseDlvd0dvQkhjd3JDbkw1cHE3blJKcnI3YU1uZngzZnBjTlh5?=
 =?utf-8?B?QkpXVkQvYllUS0xGZjV1M25xK0VSWldkL1U2amZEcWZ4czVMS1ZXWm85bWZQ?=
 =?utf-8?B?WGVSY1BEQlBJRDdHSVVhU1o5M1Z1dnhyTVZkQVpERUdlV2c3QUhWYXdXQ3RK?=
 =?utf-8?B?VG55bEM3ZVB3eTliYnB5am8vZXRIT1hDd2RKV2ZISlVQK0lId01zcC9XYkZP?=
 =?utf-8?B?NkM1cjlGTUJCSHIwYVJnOG5mb0ZJVlVRdFBIcTQrTng1MFVPRzZHd0d0YmlL?=
 =?utf-8?B?R0FlcUtWNUQxZ2NJTVJ6bmt3ZUw4RElRVjBzcXNSUlN5TzlCcWlObzE3V20z?=
 =?utf-8?B?WG9iYU43clIrUXN3VDM4dTc0Y1hQZkdFZzh2ZEQ3SndmSDFqYmR2Sk5KYXNG?=
 =?utf-8?B?enM0NDNERlZ0cVFUekJVRkdVMTJmYmRmUzlScElVMW12VUJVb2ppdnF5U0Rk?=
 =?utf-8?B?K0krMzlzQUdTYlBudWdHSkxpNVVMTnArNGlKYWxhUUxwaENrQWxNMDFMZ2sw?=
 =?utf-8?B?MS9FOENKUmxjbDNlTEMyY0kxdDdSc3cxaGlWNmJkMmt5eno3VHlsSHR6M01B?=
 =?utf-8?B?TWNzWkhpMSt6ditGTkhHeGRlTk1yNkQraXkwUWZmS0NiSFdHUldZK3Q0eUZu?=
 =?utf-8?B?ang4VWh6Tk01RUIxTkhhUjhrQkc1WVVTenQxUnpLRFRjR2d1MXNpOEZUcGdx?=
 =?utf-8?B?ejFBbkxRckR5Wk1jbC9ZbEtJV3EvenlsNWtrRXhCSUZSdm5rR1hSZ1Y1b1gw?=
 =?utf-8?B?dU0zREFLdFMxM0R4OUNBRE4ycTJ2VWs5Ym9aVW8vSDdoTktpU2xtTXFRaXVh?=
 =?utf-8?B?TTdXRFBQRk1SN2hUbktxRE9OZk4rZjNzdEY3OG52YkRjZVpZNzd2TkNBK3oz?=
 =?utf-8?B?T285Mmt5LzFyb2dXVnJkNmdTOHo0cmR4azVYVmpneXNlTWhrS0ZpS3BlQW91?=
 =?utf-8?B?R3VMNHdGTnF5bEljTVRKNmNYWGl5ZEFZWXIwcExJUzBka3VERE92Z3c5YW9S?=
 =?utf-8?B?MkhuNGpxTzRhR29TM2JYSGN6c3RaY05jWG43c0phMG5WbjRVS0R2N3NWL0hr?=
 =?utf-8?B?ZVJYZ1JiaUttS0hSek5BNWxrdm9NQ2pYUHRqY05nLzJTN3lWUHNITWF5RFM1?=
 =?utf-8?B?Ujh6UGR6L1NlaHFMdWN4Qkw5akE4MmdXR3dReEQvTjJXYU1obEFTNmlrSG1T?=
 =?utf-8?Q?Hei3iRF+kTDYSa3EIpQG+buohMXZ7I5eNLOoo=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6601
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	723b7b63-8dea-458e-46ac-08dd9917c3e1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|7416014|82310400026|35042699022|376014|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bVlybERpZ3c2UnF4YXpFRnlWVGNteFM2cnBINzZucGlSM1pzeXQ2TTlVT0t3?=
 =?utf-8?B?M08vbU8wengxbkJIdGt6RGxUTzJqVFlZNVpMYzJMdkE5Slc5QzE3aGRoVlo0?=
 =?utf-8?B?cnlkcVJjQUpGbEw1azFxNHgvc1ZGSWFraWJXTHhhOGVrOW8xUUxURUZQbUMw?=
 =?utf-8?B?UmNDa3ptRlRkSE5rOHMxSUZSOCtFK1ZpR0dHSjk5ZGVtNEVKdG5TMUgxS3VZ?=
 =?utf-8?B?S2tkR29Bczhjdk5CUUNYRjJiak1HNWdrMWdUY2ZManBSbm1URThQSndLd1ZX?=
 =?utf-8?B?b0xXVzBaYXM2c2lHY1RJbGsyVEtzdUlqOENjYTkxQkt5VkpQT09CQURnZmhW?=
 =?utf-8?B?eEMzRzlTSDlWWkIydmR0NndRcDVyZVUzUWJhUU9NNjYyU1NMUklVS3dXbHZ0?=
 =?utf-8?B?d0RTTVhRQndyWHBpUVlyb0JzSG9uZGZCSlo2ekxUcmErTDlxRkNZM21Tc1U1?=
 =?utf-8?B?ZjFYeVZFNGxQWDJQUE9iR2VTZXVCbm5xTHNtWU5RS1FpSGVJck9mSkNyY1Q0?=
 =?utf-8?B?VXdyRW40Mk11eEtzUGFwZVNwNnp5enpER2ZTZHFyOVJQS2NuZ1hrT3p2c1dt?=
 =?utf-8?B?VkNjcFdQd3NHR0svV3NQTXVTN1BSWVpTSGNmUlRpUUUwRCszTi9PLytHa2Jk?=
 =?utf-8?B?Z0NHTys3Zno4QTh5Nzhsbyt0YnBCMy85TzJsN2wzbVViY2VvUHdiYmptREtW?=
 =?utf-8?B?N2lYR0w5ckVRcGkzNTJMbXJ3NWROT0VFRUdvUjVveEtJUFBJeXpQZER0akg5?=
 =?utf-8?B?STRMNEw2aWpMRVhKSmRvSUhFZFh0cndIV05ac05mTjJOLysvbG9CYmxxWllv?=
 =?utf-8?B?Mk5FSHlBc21TSlp6a25vYVRVY1NodERKRStaZVhqRTh6K2xFdjBYWVg2K1Vi?=
 =?utf-8?B?c0hWYmxsQ2k3Wi9PTjZSYWkzR2hueHRJR3c3ZncyTUdON2hyM1ZjOEFWU2VK?=
 =?utf-8?B?WDJKS1kwSCtJa09pT1JZV0hMeEgxd2YzbGIyRTlvd2NIMVFlSDhRaGVETVdH?=
 =?utf-8?B?aWpKMnNtV2ZnbU9UWTlhY0pVbEpHMTRLMlhFZ1VkT0FKUVZUYjNjUGNRMzNN?=
 =?utf-8?B?Sms0MFNwMVU5am5tK1NXN1hvTG1kZTdENitqQ29RTWR5MDI4KzhMVFNDd25x?=
 =?utf-8?B?V0hnWlJwRTFDejBTTGp5Y0FvNXVIUTNZbmI3YkE5WERya2JmOXZ6czBxeXNk?=
 =?utf-8?B?S056QVBKSFlPaTlTREVjMzJoM2ZjMGdzN0RuVFBJdGNJOVV3ZFU1bWdzeGZp?=
 =?utf-8?B?UWVYVGVzT0I2U2ZoUm1lYWRYK0NZRVZra3pmNEpXeThwRXhYb2xvVFN3WmNy?=
 =?utf-8?B?S1NPVk9yQVhHRkZFQlNXY1NiMXNKaTdTTDYvZUM5L20xRHMwd1ZIcmhPT0Yy?=
 =?utf-8?B?ejFxSnZSbThXckowN056dkpaZnpTZVJubWFiUmlEMlVFd0swSHB5cUJ4eUpj?=
 =?utf-8?B?aXJLaFd4UkltS0xUdmtzRHVveU5WM0owSlNiQ3plaWo0Ykp1U2xmdEYvcVdh?=
 =?utf-8?B?RWZpZnFUSTFuSVV4czBZTC9sY2gyV01uMHE3L3NtdHEwU2VXd21yaGpDUnZk?=
 =?utf-8?B?eHRzbWQxck00UnZndDFpVU9zTmpFcWEvanM5OTFRQTBpanZjMG1XWXMzY2Iw?=
 =?utf-8?B?Q0FweHJqaXoxTXhSS0FUeXdCZ0ZJV1ZwdUJCUkRVQWJ3SlphTURFY0I5NG1s?=
 =?utf-8?B?eThsTlkvYU1MbmF0bkE3a25pWkNJb1QzdkZnSFA4eGFGY2dsandJWHc0ZGR6?=
 =?utf-8?B?cVd4djQ5bmZ5NDlmTlQyZEovNFJGSDM4Z2RHT0trTCtkU1VKaEpQck9RNUJN?=
 =?utf-8?B?WUdZVVZad1BKK2hqeXBQQUw5a1FQa1BOdGFBSUxuWDVNRFpnaWV5OGhUbXpj?=
 =?utf-8?B?b0w0NUMraFU5aTVoaUlEa2NmNlE5aGRuWjZEdmdhT1d1RWF0R0FUVk54V0Nn?=
 =?utf-8?B?Q0dFQktRV2k5b0dYNHZ1TTZjMkZ3Q1BKSFFZVGNNTHVGRWlSR2NUNWVjWXBC?=
 =?utf-8?B?T2hYYjFnL2FnPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(7416014)(82310400026)(35042699022)(376014)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 10:03:03.7002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 145fc17f-69a1-46ed-7e1f-08dd9917d7a9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7801


On 22/05/25 3:04 pm, Shivank Garg wrote:
> folio_mapcount() checks folio_test_large() before proceeding to
> folio_large_mapcount(), but there exists a race window where a folio
> could be split between these checks which triggered the
> VM_WARN_ON_FOLIO(!folio_test_large(folio), folio) in
> folio_large_mapcount().
>
> Take a temporary folio reference in hpage_collapse_scan_file() to prevent
> races with concurrent folio splitting/freeing. This prevent potential
> incorrect large folio detection.
>
> Reported-by: syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/6828470d.a70a0220.38f255.000c.GAE@google.com
> Fixes: 05c5323b2a34 ("mm: track mapcount of large folios in single value")
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Shivank Garg <shivankg@amd.com>
> ---
>   mm/khugepaged.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index cc945c6ab3bd..6e8902f9d88c 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -2295,6 +2295,17 @@ static int hpage_collapse_scan_file(struct mm_struct *mm, unsigned long addr,
>   			continue;
>   		}
>   
> +		if (!folio_try_get(folio)) {
> +			xas_reset(&xas);
> +			continue;
> +		}
> +
> +		if (unlikely(folio != xas_reload(&xas))) {
> +			folio_put(folio);
> +			xas_reset(&xas);
> +			continue;
> +		}
> +
>   		if (folio_order(folio) == HPAGE_PMD_ORDER &&
>   		    folio->index == start) {
>   			/* Maybe PMD-mapped */
> @@ -2305,23 +2316,27 @@ static int hpage_collapse_scan_file(struct mm_struct *mm, unsigned long addr,
>   			 * it's safe to skip LRU and refcount checks before
>   			 * returning.
>   			 */
> +			folio_put(folio);
>   			break;
>   		}
>   
>   		node = folio_nid(folio);
>   		if (hpage_collapse_scan_abort(node, cc)) {
>   			result = SCAN_SCAN_ABORT;
> +			folio_put(folio);
>   			break;
>   		}
>   		cc->node_load[node]++;
>   
>   		if (!folio_test_lru(folio)) {
>   			result = SCAN_PAGE_LRU;
> +			folio_put(folio);
>   			break;
>   		}
>   
>   		if (!is_refcount_suitable(folio)) {


Do we need to change is_refcount_suitable()?


>   			result = SCAN_PAGE_COUNT;
> +			folio_put(folio);
>   			break;
>   		}
>   
> @@ -2333,6 +2348,7 @@ static int hpage_collapse_scan_file(struct mm_struct *mm, unsigned long addr,
>   		 */
>   
>   		present += folio_nr_pages(folio);
> +		folio_put(folio);
>   
>   		if (need_resched()) {
>   			xas_pause(&xas);
