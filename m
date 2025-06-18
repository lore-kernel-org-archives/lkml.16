Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012066.outbound.protection.outlook.com [52.101.71.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C1D2F533A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 07:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.66
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750231025; cv=fail; b=XaZkS8rBTytlw5P8GkNglBsxYVjMop+41L/XUReFMStLXY7vf2Tos247bhXdVkvfQ/CN8y0hDCejqJLoxAzACiR4YvjD99ITk1JmUhTfFeCMaAsZ6MZzOFTG0DeE/mra86tINPo2sm6BqczpPQNcFoNgw/T+Oc6DKffNBmQPcYQ=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750231025; c=relaxed/simple;
	bh=WbLYaSo83OjAnvGJZZOaDOl+aVMoywj/f0AcRZ4+7bo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LvR+vJb/vlV1B/izi6qlN1I4pBeBsz7adyIHU9X6Clcx27VnGuM+AfIH0yuFDvxD0VEVa9kvziC5Ibxo7KGSdrHlhxOO1284G4SqWDOo68h7n2333tMUXBKtZNu2gWLDSZ4mI5TWxFXHxWLE3CKv7PTsuE1O2cSoAYdUCcdTjs8=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=jpaJAN86; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=jpaJAN86; arc=fail smtp.client-ip=52.101.71.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jpaJAN86";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jpaJAN86"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=zV5SVKCR045d5kH/owgvZ1ctOwFxQHw6PiKKeKN6sQu0y4YDtB3iIZLiHUzZXLbNQUBocsLHONUCebZtyI27LwTruqjAavRuybxmxX3A1TgXJDkXKycuK3DxkZNoYd7iBgyOSgk1RxGluQQstjZ00YfzhB9CkmYT2Z16P+QwPSns4fSISYVmxxE1MeUm9iF1MAsVpjdJeG9DguDx8ojNfLrV2L/nwgOhXOfpKMERaYT6Xj57TAbmcbfHmwpHPAoVnmpt95W3WC2Q8iaLeClMih4GMnpzPy79apz73Yarp7sKWvx/Sg/gp8085nOd7o4jomK1VZWFX1VsFgn2iEXLuw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WP0Sm/n30Y8hMg3xyFxoay3eKroXsChZHzMAar6zT7M=;
 b=DpJz4qB9Jivf2qZlwGnZnzraHsEPRkJVQLfekdO3aQqvYssibMRoM+NgOKsalFYPMuxKKYIforwensQ31B1Tcb72qWJEqr/VT3SLR1OArO4GdxMNsesXeIJgwnSjkTn++Jc7HSLzTFbW+M8P+IhqZUR6V88jNiESmwZxUF97oGlRo+LPRlA3JCDShbtyjqnbMlZcB/BViLMqKutBdM7c7yPVUH3ZDYFAgRX48rxBUHMq3U6AzJJ8iLjhZOPThCqC7kUMWadivvKaM6VJWVOIFOTWimC7RCD9VB5TAS0zpwUBNVSRd1lg3ZMmn+pCRvXtSgk6iC/yQZEC4K+MvraMtA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=tencent.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WP0Sm/n30Y8hMg3xyFxoay3eKroXsChZHzMAar6zT7M=;
 b=jpaJAN862LafL+TZ7oqUJwh23o/XQ/I8wW4+hxzhp3S+mRAwgV7RB46UwegpMGkc5P0SfgKq4g87s39Ap/IKRtp4Oqqiom3lQW+y7T9kv7KJiKXJwMfITI6oC+pCLW2ncdvLv4+17Gztv2Qrf8GsiP/n6sxFSW9/8tbUhRyy6MA=
Received: from AM9P195CA0003.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::8)
 by DU0PR08MB8930.eurprd08.prod.outlook.com (2603:10a6:10:465::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 07:16:58 +0000
Received: from AMS0EPF000001AE.eurprd05.prod.outlook.com
 (2603:10a6:20b:21f:cafe::4f) by AM9P195CA0003.outlook.office365.com
 (2603:10a6:20b:21f::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.25 via Frontend Transport; Wed,
 18 Jun 2025 07:16:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AE.mail.protection.outlook.com (10.167.16.154) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.21
 via Frontend Transport; Wed, 18 Jun 2025 07:16:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MXYyrjOcSudFTrnoggn5BQ24OGUQd+J3HE7mcYFDRrNnWmsOohCB+nwILaIoV5DJDf873KN9dvAZCX7I4wAu6iw2qVLYtfovDQxmvcC9NMeh3WaNOtV/dDzoQJzIEnvMouYiu3BoOXZTobSBN/7i9dQoPb14POhbziBj9h7Or6KRhcKa63XFxzLVSMpe1iKkYJig55TIOd5f+fnnQ8zByQmd1kzF8/hRM7QzmZbGPo6Fw2Sby/IfQpgbvxZIvfmlcTfPGrfSZ9HNMBPjpgux0DVDkDl0Vu/fpqGKYGe6VsmNuisCRO+Itpvs3k41eGjkGF1Rz2ROm7y8EeZ+sN9v1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WP0Sm/n30Y8hMg3xyFxoay3eKroXsChZHzMAar6zT7M=;
 b=pu6XdznFBZNGY41fDv3SzEhUXDZ6Jp9e8DGxNiO2Hw4Slr4utcb/Vq1YuNx8uhWh+4Wy6GOci0w5mwZjOdXt9aTBNbE1Iiovtm/i4GMr2T24cTqY2i+PPLvKfIvfr4Q0M8BdBkvb03qsPGoHYJHn9NoC5oKBCwetoRVB4J2zLE2oovlD7rIxByvpC3bv+2PrH4UvkFa2wWje6AhNJS2bSN+grRiVFsDC5P6TdCCGZ6DSmOw2qRPTjb+PDKlsYZaZ47mEYS/cJT7cHkyCEYZIf80qXAFhb4SqfVc6/Hou6l3CNcfdgrDNCBYQqlmWvxqg69peoEvqs8QWHSxeRifAwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WP0Sm/n30Y8hMg3xyFxoay3eKroXsChZHzMAar6zT7M=;
 b=jpaJAN862LafL+TZ7oqUJwh23o/XQ/I8wW4+hxzhp3S+mRAwgV7RB46UwegpMGkc5P0SfgKq4g87s39Ap/IKRtp4Oqqiom3lQW+y7T9kv7KJiKXJwMfITI6oC+pCLW2ncdvLv4+17Gztv2Qrf8GsiP/n6sxFSW9/8tbUhRyy6MA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by PAWPR08MB11158.eurprd08.prod.outlook.com (2603:10a6:102:470::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Wed, 18 Jun
 2025 07:16:22 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%4]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 07:16:21 +0000
Message-ID: <c9503955-36a0-48eb-aa4c-73a85b2da2ca@arm.com>
Date: Wed, 18 Jun 2025 12:46:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] mm/shmem, swap: avoid redundant Xarray lookup during
 swapin
To: Kairui Song <kasong@tencent.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins
 <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthew Wilcox <willy@infradead.org>, Kemeng Shi
 <shikemeng@huaweicloud.com>, Chris Li <chrisl@kernel.org>,
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>,
 Barry Song <baohua@kernel.org>, linux-kernel@vger.kernel.org,
 Ryan Roberts <ryan.roberts@arm.com>
References: <20250617183503.10527-1-ryncsn@gmail.com>
 <20250617183503.10527-3-ryncsn@gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250617183503.10527-3-ryncsn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0023.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::12) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|PAWPR08MB11158:EE_|AMS0EPF000001AE:EE_|DU0PR08MB8930:EE_
X-MS-Office365-Filtering-Correlation-Id: 988a1217-a9f0-490b-69ba-08ddae381c09
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ZU4rR0t5c3FhdVByWEFVWGRXb3VyZk1pOGIxRHBrOUtFTENqUnZkNzhsa2dN?=
 =?utf-8?B?N1F6L2VQa2c0VXdxSHdxalJITjZWOU13STgxOFZWOURtZVdiaXZFTytRZ0ZO?=
 =?utf-8?B?VHpnM0k0U2hEWlZOT05EWEZVYXhOMzRPM2NpdDdvTHg1am1OLzlKZ2c4OUJG?=
 =?utf-8?B?anNIRWE3MCtyYVpKbmJiUHNtUTczWjNCbmFCZU9YRWpTNnlCNllMTmIzam50?=
 =?utf-8?B?MktiWk1paVlQaXNpS0xnblAwUklpMnl2Lzdoa1ZZWlduNmYxaXlScG40bmor?=
 =?utf-8?B?MkVNWHV2cEtWTnBxTGVobFFxR3JtbHk2YXJMRGlJUWx2S21PY3pNUDE3Z3kw?=
 =?utf-8?B?Y1pFanlLZXhsd0NGMnlsRXRMMEp3K3VYaUZ6L25QVG9DbWtZS0Q4eXB6VVNk?=
 =?utf-8?B?aE82V1ZUVGd4bHRRQW5kMlJ0SGN1QjNGRHJMNjYzS2d5clBieDNQT2RlMTVs?=
 =?utf-8?B?bThVa0NwU2I2TFpWNUUvajc0SnJUK2phRmJRMHEvSHlwbHdoc2VUMjZmbVBI?=
 =?utf-8?B?NVNuZnB6V2ZhSTF3cXpJTVM0M0xUMXZiaW4ydkNmb3BzOHZkUWx1SmhaMHFK?=
 =?utf-8?B?bUJYeFh4SzJVLzQ3SDhvaU85SmFRa2F6SHlVZmRkZHlaZTRUTERLRHFQL1Yz?=
 =?utf-8?B?Q2NTNExIaFkzR3VraExBeWhRZ2hIN01XdFZQOU5RSXBRcHFJWWVJSHQvOWov?=
 =?utf-8?B?RkUwblA3Y1ptWlVRbW1FSDJsVGcySFlrMkx5S3Iyc1pyZHB1WlBteXRjV04x?=
 =?utf-8?B?eFFMTkRhNnRTclIvK2ozQTZhQ28xSm5qZ0NGVnZKd1hQVUZIcFFRRlNsK2VR?=
 =?utf-8?B?VE9jZjd4cmUyYXd1Q3BSSVpxbXR3WUVYNVhIOHZPVUtpVnQ2N20vVm8vRytL?=
 =?utf-8?B?RXZWMXJNc2F6SVhyYkg1VFFZaDZFSXVOSDRqbzhWeDczWHZpbHc4YVVnMFJN?=
 =?utf-8?B?MjlsbUl5TDJVWkYyenJVa0QyeWVqdUx3dE9yVjBFeHNHdUhZVWRFRUp1VWR3?=
 =?utf-8?B?b3AxT0JaTGIrK3BaSnlKcnJwT3ZCZkFiVlU5dHplVng0Nk9MaUx6SVRjQnIr?=
 =?utf-8?B?MFpqWFErSzVjaUg2czZpSmhBSmtQVnBPNHZER3NKdk1tRXIxUUNyQmFLd2Yz?=
 =?utf-8?B?YkJmbGxJNDRvVzhlUGdLZXEvM0s0TzZJSXZDZE5IUXV6TmYrUkRHRzhlWUtN?=
 =?utf-8?B?bkhpZkh4bkxOclczU0VPdE9ycWNzNitIT0g5U1JkcE1Bc3RONDJtNk9HMjhX?=
 =?utf-8?B?S3piUkJCaXVkdkVNc3JXY1RPQ1duL2hPUXVrWUFkNk1UK0xYQzBPUFYvMUpm?=
 =?utf-8?B?Sk1Pc2ZseGFSMUwvM1NLZzh1YVFEb091VXBjOFdqcXU4WHBxeWt5S2tqSk9P?=
 =?utf-8?B?VEVPODFIVkJBRkFaU1phdjFmVFp3ME1udVN1R0RyZ0s4RzlINnFEbmsvcWQ4?=
 =?utf-8?B?clZ4d2tlb005U0g4dHpzTjhXUWM3NWc3QllyRVdHUkVnWHVZa2xiSjNGVzRj?=
 =?utf-8?B?QkovRkI2dTFtQU0xeFNyR0ZkRG94REJBUDl5NkcyZTUweSsvem55dEJJdm5T?=
 =?utf-8?B?NjVjV3ZsRTFSMmZBb1VQSDRoS3lxT0dFSE5oRnhTV21Keks4VzlacUhVRW5O?=
 =?utf-8?B?TmxZV3c0U0JPVlo3T1JDT0xoR3dGb3BoMVZ3VlVSRWw1N0VzaDN6K0QzVDFI?=
 =?utf-8?B?bFpkVjNtR0xOdWFteGdzNndSTEsxSGFhWVV1RGN2N2hudDh2ZmhvenZoN0JO?=
 =?utf-8?B?djNyNmFHb0NxWlovNC81bDlUaVI0VGQ1b2RKWjI4ZDBWUG5pNzBBeXo3dFRM?=
 =?utf-8?B?bHIzcjEwT2pJSEpBVnFZaU9qaGdDVVZ4cCszY0lFT3VYNysyVTBxTi91T2Ro?=
 =?utf-8?B?Qm1tR3JKeEJuRkkwZHUvb3VmOHc1UWxMK1BHQ3kwRWRSeG9CbmsxUjQ0cWpT?=
 =?utf-8?Q?dEIFC5pppY0=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11158
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a3e42e86-952a-442f-c944-08ddae3806fd
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|14060799003|82310400026|7416014|35042699022|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?THhIa3FpY3I1M2w1MEZ6REpKNE02dFhuRytxMk1EVDJYN1FNQ2lPYlNBYm5u?=
 =?utf-8?B?VXZwMVllb2NNU0t5SE45aDFwa0VRRWp1RHVhOXE2SldPUTkyS285dmxNd2U1?=
 =?utf-8?B?OEF5SmFGSS9Xb2JMMG9IWU9LL1FJZlVGc3hDMk1PemZ4citBRis2UThVbUZn?=
 =?utf-8?B?ayszWE5lMzY1c2lVT1VIdk1mdCtZdStweXNLOTdGQWFTUk1kREhlRmRkdlNV?=
 =?utf-8?B?bjNVbkZMMFQ1dnBaeVRENlVYMElqcEVzMUxpRldhYVhmaVF3aExQR1ZpNUxK?=
 =?utf-8?B?djZSRzdHcE9qZGlMRlFYamdaa2MwUG44b3VRRktZZTkrMlZqUWlwdE5tL0Nv?=
 =?utf-8?B?T2NTbWk4SkNLYkphS0Q1UDBPOFNxT3RYS1FtUnFTTUU3TEdsb1lteG9xaUlH?=
 =?utf-8?B?dmZvZHpVL3NwQTRkYzJKbWpoMkF5MUZsbUdzazMxTEpEYzdJVU1VQytkUnU4?=
 =?utf-8?B?VnY1VjJOQzU4ZHRFWENEbUVSZTJNdW1iVUdmbkRSL3V5ZElWeGJlWTFSMlQw?=
 =?utf-8?B?aTRUQW1yeld0blBKTERiR0E4aHdMaHhWMk40S21laWN1b2RiRUZ0cFd2d1E2?=
 =?utf-8?B?OFdQQmFoMktTY25EdEFCSUs0ZlViSE52MU9oaDRMQ242VStNLzVlYnV4S2dv?=
 =?utf-8?B?Mkt3V0ppVW5kbWxxTE8vR3MrR1lBTExlU3ZKbmwrTmZabGJYVVYwaVduSEd5?=
 =?utf-8?B?SXhZV1lFdkUzSExxZ1gwYXIvemlTdjhNUktYcGxTS0dtMFZ2RlE3aUV6VDZM?=
 =?utf-8?B?Z2pDbjhKZmNGSURkQndNQmZidUU3RW1xTEZNMVBCREY3Unc4THphbjN2bCtn?=
 =?utf-8?B?M3FjS0l2RXFENVFSRUtFWkxGTG9KKzlXWDVzWnczSm13UkRDcDc3VVQwZFp0?=
 =?utf-8?B?cVFRcUJSaE82WkdQRGlTM3cxYXRRZ2JkWDZqWlh3S05KM2NnSDN0OVMxaEFw?=
 =?utf-8?B?YzFrNFZOTTVkQnJGQU5tSG1Jb2lVRDZsdS9TOVRRdzFUekVkNHAya0RoTkZU?=
 =?utf-8?B?c0RINHhydEl1NVdBMG1XQXRzYmxlbkNqem9KcmFBeUlJSmlBZElOOUMzL0Uy?=
 =?utf-8?B?TS9aWDJEdWlEVmhhZE9EZCtQQ2dIZzdvS2dWVlFBc1M1RkwwRURxV2JFT2dk?=
 =?utf-8?B?R212eEl5UTdZckRSL0hka1JZVlExQ3daam5xcEZrN1F4MXgwdkdSdjEraFVY?=
 =?utf-8?B?NnpTWmhtSWJZRUhJSFJ5YmliNzlNdEU2dGF4WTI5Mm5sN0RIdkxCdThHelFZ?=
 =?utf-8?B?cEE0NGU3aXBIUTRhblZJZTlkd2F6YXZ3OXdNbjNkRmhubjNZVXhXOWw4V2JX?=
 =?utf-8?B?anFEWmNLSTBzSEw4cWs2R0E1bldmdXR6LzlhNnMwZDBXVWdLQWlVZ2NKZU8v?=
 =?utf-8?B?Vm54dU95dElNcUlQSml1d1VYSUN6NEdUckpYY2dQWmdDc3BEUTMyc0h5RGR0?=
 =?utf-8?B?RXJ4dWN2b25ha2xNamtCQjI4M2hITlJWS0NWS0xLZmpNdzVKSTFuRHV0SG9j?=
 =?utf-8?B?UUNHVStNV09ld242RlQ1emdUYkhYMjNYbTMxRXg5WU1GQ0xZUGpGYllBYlQx?=
 =?utf-8?B?RWI1NWVmT3QzOGNhSUkrc0p5Sm1aMGdOMXRtR29DVFBVOEcxOGdTZndhc1I5?=
 =?utf-8?B?WWhsekpiVXdYQzJhaGRWRDIwdkZjN0Q1dk0xcGppQVZ0S3hkbkNBekNnWmh3?=
 =?utf-8?B?U0pYRDRSV0RJeThXaTFpS1ZidEUyekplZnRjV0tTbmNBeHRyMWl1K2Y3U0p5?=
 =?utf-8?B?NkU1KzVuVWZncTlVY0RDajhVTjIvTVdUU1QyeVg3aHhQVXFGMHkwYUJHdDM1?=
 =?utf-8?B?NEFNc1lZUUN6bGhPTHRvZTBoei9taEg4d25Kazl5WVJkVElZOUJpdzBEenNX?=
 =?utf-8?B?ZHBHOVIzaGVFN2JKOC85TlcwWWRpVlpzRE93K3k4OHAyVE04ZVJHZ0VwWWlV?=
 =?utf-8?B?RDE0Zk1vaVJqRFV0VjNjc1ptdWRKQUYvSm1ETFcrMWlJSEhYLy90OVgzdkNw?=
 =?utf-8?B?bDVpeklDbStJUEt5QVhIY2FZRWFWbW9UN0RjdGo5SkhuRk9aVWlXZkp6Skl6?=
 =?utf-8?Q?wvmDQf?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(14060799003)(82310400026)(7416014)(35042699022)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 07:16:56.7261
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 988a1217-a9f0-490b-69ba-08ddae381c09
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8930


On 18/06/25 12:05 am, Kairui Song wrote:
> From: Kairui Song <kasong@tencent.com>
>
> Currently shmem calls xa_get_order to get the swap radix entry order,
> requiring a full tree walk. This can be easily combined with the swap
> entry value checking (shmem_confirm_swap) to avoid the duplicated
> lookup, which should improve the performance.

Nice spot!

>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>   mm/shmem.c | 33 ++++++++++++++++++++++++---------
>   1 file changed, 24 insertions(+), 9 deletions(-)
>
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 4e7ef343a29b..0ad49e57f736 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -505,15 +505,27 @@ static int shmem_replace_entry(struct address_space *mapping,
>   
>   /*
>    * Sometimes, before we decide whether to proceed or to fail, we must check
> - * that an entry was not already brought back from swap by a racing thread.
> + * that an entry was not already brought back or split by a racing thread.
>    *
>    * Checking folio is not enough: by the time a swapcache folio is locked, it
>    * might be reused, and again be swapcache, using the same swap as before.
> + * Returns the swap entry's order if it still presents, else returns -1.
>    */
> -static bool shmem_confirm_swap(struct address_space *mapping,
> -			       pgoff_t index, swp_entry_t swap)
> +static int shmem_swap_check_entry(struct address_space *mapping, pgoff_t index,
> +				  swp_entry_t swap)

I think the function name shmem_confirm_swap is already good enough? Anyhow the
changed name should at least be shmem_check_entry_is_swap.

>   {
> -	return xa_load(&mapping->i_pages, index) == swp_to_radix_entry(swap);
> +	XA_STATE(xas, &mapping->i_pages, index);
> +	int ret = -1;
> +	void *entry;
> +
> +	rcu_read_lock();
> +	do {
> +		entry = xas_load(&xas);
> +		if (entry == swp_to_radix_entry(swap))
> +			ret = xas_get_order(&xas);
> +	} while (xas_retry(&xas, entry));
> +	rcu_read_unlock();
> +	return ret;
>   }
>   
>   /*
> @@ -2256,16 +2268,20 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
>   		return -EIO;
>   
>   	si = get_swap_device(swap);
> -	if (!si) {
> -		if (!shmem_confirm_swap(mapping, index, swap))
> +	order = shmem_swap_check_entry(mapping, index, swap);
> +	if (unlikely(!si)) {
> +		if (order < 0)
>   			return -EEXIST;
>   		else
>   			return -EINVAL;
>   	}
> +	if (unlikely(order < 0)) {
> +		put_swap_device(si);
> +		return -EEXIST;
> +	}
>   
>   	/* Look it up and read it in.. */
>   	folio = swap_cache_get_folio(swap, NULL, 0);
> -	order = xa_get_order(&mapping->i_pages, index);
>   	if (!folio) {
>   		int nr_pages = 1 << order;
>   		bool fallback_order0 = false;
> @@ -2415,7 +2431,7 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
>   	*foliop = folio;
>   	return 0;
>   failed:
> -	if (!shmem_confirm_swap(mapping, index, swap))
> +	if (shmem_swap_check_entry(mapping, index, swap) < 0)
>   		error = -EEXIST;
>   	if (error == -EIO)
>   		shmem_set_folio_swapin_error(inode, index, folio, swap,
> @@ -2428,7 +2444,6 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
>   		folio_put(folio);
>   	}
>   	put_swap_device(si);
> -
>   	return error;
>   }
>   
