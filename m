Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011046.outbound.protection.outlook.com [52.101.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9F615746E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 03:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.46
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750216491; cv=fail; b=jc1UGLQmuVv+qp4rEi+5BavnzQtuohgi8wGbeYSe2leG5IWTeYXeUy+JJUlPtE0qP2CCbVSrDVx8C7i0o4MKYqaoYir8T1iYxEebSIMaM3/xgNmG4oy7nzObdCcS4kjmQodeREJddjfnDa6doXgc/vqc8vzNTjNRT/MUfJwfBb0=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750216491; c=relaxed/simple;
	bh=U1CR6XU0CmG42GDjGVWsESuMpc/BTX6PgZVsuRUt25s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ts0NxgUIigiFEh0KB/6xhvkqe3oDjg9etomMmpiAJAavlyzUXh/DpHde60xITttwlg88REA2tER5JkEkORCPu3BjwKBm90ySyc1uPFE9WPoi+AWG7hjw7yILyaswRuILqRug2uHn2vaN1NX73l9gpzHSG6uE6uEgpeWE9f2zIDQ=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=q+oBJ/xN; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=q+oBJ/xN; arc=fail smtp.client-ip=52.101.65.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="q+oBJ/xN";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="q+oBJ/xN"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=duBNJK+nVncz8m6AKBkBc2rVfwYsHYYlk03658Fx3CAzpjZl6gPT8ebPdrBCPfJ9AAUZeCl14wcKVrBdAe++2h2eaE/5OCX0P8HheeJjdBY1SQk6QqtNUf8bgZGJW5U0X6WVdyfwSDW9lxsOyxwA5FZX5yo3h6RIuDCLbCtJeSF2XNpxPe9iUIfSxl+kNdyk9kTZvACMSB93zzo/RVR7TXDqktPSD2gHWpEdceI0QsWSAu5hw6Vej9WGgnvLtX4au3s8m1rxBW5rGh/zNRNWqnf4bw3tXePHeiYqBBlOI3Of0pd3+RpmRS1DAS47UV8TTjPNkHEfxusxSK92vHcT8g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1CR6XU0CmG42GDjGVWsESuMpc/BTX6PgZVsuRUt25s=;
 b=gb27SP0Vj+VXnIax910nyrMZKoJAkQvaIMDu6+0mddkhEpApx9o/n3nveZLcHluMfusfnrvDR8zXaNKDNo8QXmSqyODAgyPzo0jeR9QoY4c41J6b8pYmmD+RVbl7oUAzPH73w018XX5lzWvywsP6X/r1fJpHl5GoST15IONJV+ycDOtK5eAa3uuMfydig7H9oo4ZeX3+Qbp9hq1esnSANmXX4yAEmQMm+mDbWq3IJKy24Jf+B61sLtjClA8qGLzSx0nqUVLWd8zZiOlOwWMvWx8IZ+bLs2cck2CbJf/8o02+4NOQhBZkaqsls03+e2F4E1RahxNT1cU8fJX0FQnLKQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1CR6XU0CmG42GDjGVWsESuMpc/BTX6PgZVsuRUt25s=;
 b=q+oBJ/xNsTi/3Fuh6fIz/zKOOlrADo+Gdc2KsMiJ1QQ+l+VLq6IWQJx+71YuxjjdOtTdtflIohaSqFxweLPn8skjbAvwhsMNuEgFdNFHVuT9lvuw87iwR68U9cqBsTlBj2BCiRNKevLT0TPy3qHZEIEiu9hW9Eawla8f5CnUQzY=
Received: from DB7PR02CA0022.eurprd02.prod.outlook.com (2603:10a6:10:52::35)
 by GV1PR08MB11076.eurprd08.prod.outlook.com (2603:10a6:150:1f0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Wed, 18 Jun
 2025 03:14:45 +0000
Received: from DU2PEPF00028D0C.eurprd03.prod.outlook.com
 (2603:10a6:10:52:cafe::f2) by DB7PR02CA0022.outlook.office365.com
 (2603:10a6:10:52::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.29 via Frontend Transport; Wed,
 18 Jun 2025 03:14:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0C.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.21
 via Frontend Transport; Wed, 18 Jun 2025 03:14:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WRMnZw1P4MKwxuAmm7YKLYOWKcF+Eco+3HCsxxm4Azu1aBVtBnq1rENB7lmo7MxwnwGSEQD9dOyq4tOmGdCSAdmYG9bd6zUYsXCBxpfmwSjMLsPrjbSGIEWNSBPtEhLXvrkxy9h7M4r7JEHyTyOX4ETRi/GAxzsO1CIJz/UMHtwOH3naCd5/F6caavWxr9UdZSjF8+z3dhBztbS3Cbfjjbe4RHvP+5EuF5EAAI1s7ppX4f+4OrnFSfnRAuI2Q0s+6bNJdJU+djBQelu7AxrmBCPB8cGn/Pv+wtNLFzadzZeJEaN/gzX7TBe/ct5kJL6SAqkhe96yEvA+aoqKOPjnHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1CR6XU0CmG42GDjGVWsESuMpc/BTX6PgZVsuRUt25s=;
 b=V7DiPIPNaiU5WDPvkK3nHsGEfoHGHaybq6UTNbrTbPwomruDgCeraF3IBkgni1r0UBFIS6/ej1Vqt8qCvc260U9GayWR5DI8zUAP7nAQSscfXGiIlQvq1rO6Q/NX0hV//oFmZtruOx4zYtp2VMQG7tc8y9kIMwYwTBntiva5No2kZIShMNHwE6p7eFNA5XxsE1PFJc5ftdE/cgw05mjReyPHtpwbCYsKPuo8fwnNXU4rZwDxhVgMV4byoQv3caovaz+gT+TCZuLbg9L+JIJ+BtcU3m+pr2JFbdZ/betp5CZyib8IJmuAiK5JCiboQ6O2fAGBMg+DOcU8zIuMw9RBMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1CR6XU0CmG42GDjGVWsESuMpc/BTX6PgZVsuRUt25s=;
 b=q+oBJ/xNsTi/3Fuh6fIz/zKOOlrADo+Gdc2KsMiJ1QQ+l+VLq6IWQJx+71YuxjjdOtTdtflIohaSqFxweLPn8skjbAvwhsMNuEgFdNFHVuT9lvuw87iwR68U9cqBsTlBj2BCiRNKevLT0TPy3qHZEIEiu9hW9Eawla8f5CnUQzY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by VE1PR08MB5710.eurprd08.prod.outlook.com (2603:10a6:800:1b0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.35; Wed, 18 Jun
 2025 03:14:10 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%4]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 03:14:10 +0000
Message-ID: <9cbbda32-b0e3-4509-a81c-9174ab741433@arm.com>
Date: Wed, 18 Jun 2025 08:44:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [QUESTION] xas_reload() in iter_xarray_populate_pages()
To: Matthew Wilcox <willy@infradead.org>
Cc: david@redhat.com, ziy@nvidia.com, dhowells@redhat.com, hughd@google.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, ryan.roberts@arm.com,
 aneesh.kumar@kernel.org
References: <20250526063524.22597-1-dev.jain@arm.com>
 <918d552a-085a-4529-8f20-a060b1f0c9f1@arm.com>
 <aFFx64M_iFgeIh5j@casper.infradead.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <aFFx64M_iFgeIh5j@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::15) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|VE1PR08MB5710:EE_|DU2PEPF00028D0C:EE_|GV1PR08MB11076:EE_
X-MS-Office365-Filtering-Correlation-Id: 65e7ec80-7016-429f-6a9b-08ddae16459b
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?RnNpNU1iVTZTbHR2QTBBb042M3doUzEzSzExQ1VINU01QjQwYXRRTTVmUnps?=
 =?utf-8?B?anlXZ2orcVFhQTdmQ2dOT2c1alNEZjQ5YVh5ODdoMXhiV05aTmdDZVIyU2dS?=
 =?utf-8?B?ckNiMlhiQXZKVUFoeWEwUm9mR3ZZRmVXR0ExaFR5VWh6NEE0KzZ3cHFpM1hM?=
 =?utf-8?B?N3A3aXhnaDNQcU1pSG5UMEZIdFVZU091bHllNHNyb2VqaGRzZU9TQnpuQnZ3?=
 =?utf-8?B?Sk13Tkp2MG42U2lVMDFER2hRZ25LbUNsbzFJSHdDakZZc1JTOUVDN0FaYWRP?=
 =?utf-8?B?M0RKVVFPanBENUg1OTg5VTRUVi9zZ2EzdXVJQjNxMEdFcStIVnNuNStSVFo1?=
 =?utf-8?B?VzF2ZjVwRDFXSm5wRU9aOUdMRHh2NXh2Q0hqMDlSOTJYaTZWMkhMNTJkaFE4?=
 =?utf-8?B?SGhhYW9uakhWbzhxS3FjTFk4ZFpNSGZiUjcwRWtwSDROQlI3VlliQklQYzFY?=
 =?utf-8?B?ZVk5Q0FPVmVoZVk3eVNHcFlyUStXWURxemVxSkNxZzlpSitRWFltK0M4ZzZy?=
 =?utf-8?B?ZHVFdDJCU2g0VndaWWFKenRleUNLVG0zb0JKZnBnUTh5cURxVWRDd3h6QUwx?=
 =?utf-8?B?WUNLMHQ1R21OdzlZNE5oYlZPSHl4R1hGOU5BWGtVMm84cEJpcm5QTVdsaC9l?=
 =?utf-8?B?N1FaSEF6ZmVXd0ZBbVQvMHdvdUY1UjZ0N2Izd25mTGV3ajk0WnViNjVNakpH?=
 =?utf-8?B?Q2Rremt5aXFKNjBmUVAycGg5TlluWU80ZVZZZVkyVlBwWmFOeGZBYkdxOEli?=
 =?utf-8?B?ZVdJMVZrczNuWjl6RjhOc3MrV0h5b2Z2RzJTNkREbkM3RC8vSFJYT01zdm9m?=
 =?utf-8?B?cmYzbWRIcGJSYzBUTktiU3BQNHRoSjJiclYzME1NeU5HcmZaOWg5SWtyUUpN?=
 =?utf-8?B?cTNoek5IVC9zQXlrYndDL0I0eFppTmtKSUwvZm42TU9ad0JBUmhpVHBvV1ZJ?=
 =?utf-8?B?SVM5L2l0S1AwclJoZUtlMWFQTC9yeFkvc3dXUUFOT3hJY0xvZnlFVHozb09a?=
 =?utf-8?B?WDlFMk83SEZJeDhMODNXbkVwZ0g5MlhMa29ZUXJIM013M0VzckpHOERrNDhl?=
 =?utf-8?B?WHZTaUpUREJLV1BtMEsvTnd1akp1WGY5RVNleXd5cWFQVG1mdEtoSTFiWGpv?=
 =?utf-8?B?SEdjR2tYejdJOFlkV3VlV3NNNkQxWVFkbzVpNFZESktlMEgxSEJCQXluUUFw?=
 =?utf-8?B?V08yZ1owdzUvYmNYelNSK2hDTG0xT2pDVUtlZVdTNXlwWFpQSnF6SWZ0RlZF?=
 =?utf-8?B?SHdueUVMSjYrR0I5VTNBekFUWklEcjlnaXN0N1hTS2dwNDRORG83ZktRNEdZ?=
 =?utf-8?B?NVdoSGpIUXoya251aXRvbzhkUkZRMHVaTm9DRUpSQ0YreG9nWk1OK2Y4SHFm?=
 =?utf-8?B?UXZZVkxwQi9SSTZjYnNvdWltZmlyY1lKRVNoY2I5QU4rRFpKNlVsMDA0dVZV?=
 =?utf-8?B?QU40R0lwMHpjUFJyNjc5c2ZwY0NNUzFtS0R3RGRGUjdSQkpaZlNFU2g5eEZO?=
 =?utf-8?B?L002a1ZwMVBJeUNLWGx3cXpGV2NZMFMzK1R0WEtCZ0RCcHMrOXQ1Y2t0WTVS?=
 =?utf-8?B?MXd4SDNHb21xeWxNTjlzY0RjT3ZtUTVPQ29RSVJZcFFKTGRURUJaRVI4UUcv?=
 =?utf-8?B?LzZQUldSNXRFZFRSVjV0cVZQbW9LbVFwTWFPaG90RkxheVRiZ1ZyUnJKRzls?=
 =?utf-8?B?Ums5ck1yVmJUSzdOK2RxZFNzMXVqaTdxWnpOZ0tocDdVYzVGcDRXc2FuZmk5?=
 =?utf-8?B?SWtHS09mdm40emdTa3JqTWljSGZNbmdHM3RuemU0TTRERk9jL3VuSUxPaDBS?=
 =?utf-8?B?bkt1N3BvdEtIa21jN1diWWpGUmVWOGYyRG50YjhDMXIzQ3dPUEZSZVRxZFNt?=
 =?utf-8?B?OHZXUTkwZTVObFVPTlZoSEVsS3JJaFFCb2hUd0RMaW9pUDlWTzlDWjFPMWM0?=
 =?utf-8?Q?8uZmmaxJiyo=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5710
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	70a8d543-d44d-47eb-0922-08ddae1631ad
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|14060799003|82310400026|35042699022|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dTR5UlBMMGJKUVhyQi8wQ0RGbFJXZ2hjRC9KUzVIU3V3Y0lQc2l3TmxSMWt1?=
 =?utf-8?B?SmVMY2RIOVo2bmsrcGd3WWExdGRiOUhuS1VqdTQxbFlLSEJ6KzR2aDluUUFl?=
 =?utf-8?B?RzltY2hYMUcrblhrQWgxT09RU3lhb0xTYzlCcUQrRnhlYko3Y1dRNE4rSVFs?=
 =?utf-8?B?RFcyM25BVUdGeXpaR2lMWEFZVXJCN2lQQ3RiVXF1UkI1N1lNQ2dZRXRQV0lX?=
 =?utf-8?B?UUFtcW1pSDFZN1hRa1ladzljTjJUVjdrU083dlh6ZUlQVVlCcEljUytYclVZ?=
 =?utf-8?B?dVJjOUZJNHNsajlBZTlRNDNhc2RiYzBkTXRSSWlEMDFYRDltY0NyUTkzVVBK?=
 =?utf-8?B?NmMzaENZNjlnZUs2Q1FOby9aNUlNL1ZDVlIrbkcwbUlXNnpnbEFNdW90MTZk?=
 =?utf-8?B?SzhYSkRzVlcvYUw5RWJzTGZuc2dxcmNwMHRkSGdwU2pzWEVCTjZDUFNheldB?=
 =?utf-8?B?QW9EUUtJV2tQWEEya1d2Mno5YW9va1ZjTFk1Zmc4RFNaYVlHQm1oUFd6YS9x?=
 =?utf-8?B?MVZ5Q29SMkp5MFlGQ3k3bmN1MTQ3ckRNMjdnNk1NUVJMU0UxS1pST296b3NW?=
 =?utf-8?B?YU5taFhQU00raU02WHI5Z0x0Q291YmRxYnQxUnBHMmpQZ2ROb0hWRk1qZVlB?=
 =?utf-8?B?S3FobVZmVjdVZzRWeWFoazJMWEt5QnJVa0o1Y0FTb29ML3FQbVRNVmw0djYw?=
 =?utf-8?B?VGlraGNWUHFKYXRZRUVMTjlrbStkMXN2YWo5dTB3WGk4VlBlUEErUkY1Z2g2?=
 =?utf-8?B?UFhocWVHV3R4SG1SU0NxN01tQU1qRUxiK1U4NmV6LzFPMXRqQUJ5OVB2Rmh2?=
 =?utf-8?B?aU9QaW5KQTlsM2VpWmRxZGVQemNrMmhZWjJiV1pxQjZpajFKMTFTSkNiRXkw?=
 =?utf-8?B?dS95OWVoNktvWU5nVlJ2ZFFjSFl3S0E0L1JRRkNOVEVDdmxOb0lDSEFheThu?=
 =?utf-8?B?dzkvVlZhL3VVUTBFaXJPNkRUUnd3NWdOczNGaGt6cE1QYXN4WVFpVVJwZ0Yx?=
 =?utf-8?B?RGtYd0NrNzFKNTFTeklyaG5hbXV3TDllWTlwZlFrMTIxNDlBelBoQ2xDYUZx?=
 =?utf-8?B?bnVsY01QUGh3VU9VTXhQOXRGZFhLNUJmK200elBXUnpQNkJmRGpDaThMR0pF?=
 =?utf-8?B?dWZ6VUlNTnBkNmhpaWpDMWlHU0NsN2pINlFvbmlQeGh0QU1OKzQ1K3hoVDRr?=
 =?utf-8?B?bWU1aFQ0bnFId3RoMVZrNTBvOENrOG9oWkplZGQ4MjVWN2VRVjRBbU40dHpa?=
 =?utf-8?B?emVicDRDZWNqcklXTkZpVXkyMGJ2a0ZOa0NkZWRWZDY1ZW9jUitrOGlTOHJH?=
 =?utf-8?B?czVIcmErekRWakRmQlMyVUphdUJtVWM5ZHNwcVhSV0JLNDVlN3Erd0ZKVTEx?=
 =?utf-8?B?ZjJLdWJITXV0T016ZVNMcWw1Rko2VDAwaElneGN5S0dLeHhRdjdJWml0TFIx?=
 =?utf-8?B?Q0FjcVFyZ1dLNXBJVy9Ecktjc2J3cHhqc1BpclpHd1VwZ1Z2UEdRa2dmdXhs?=
 =?utf-8?B?K1AwUEQ0RHNxNFJDRjVnWkUwY2x1RW5yUUYxYllicHhSRU1FVStuZENuRFk3?=
 =?utf-8?B?b1gxRE54bDlWY01OUmJNNW5vNHpER2Izekg2WE5kWHN1K09xUXdEb3g3VXZW?=
 =?utf-8?B?bGJjZnB2R0Ezb2t3RFdSSGs5QVRrWHN2WkFuWWNkcEJwR1IySjdCb1JtQ2NK?=
 =?utf-8?B?ZjMySThPQkh3U3dRTGJLaWJiWFJSenlIMVpZSVhpSHBqMU1WYk90RHU4aVll?=
 =?utf-8?B?TSt1MmpDOEZ2UWpISXl0R3R2aXZkdjd3OVJRYklPQVJBR0NSSE1zaC9OeGxS?=
 =?utf-8?B?eXVXOS9MR0FOVzcxTThvK0lxdi9rbTBubDFoZHlUemNBdXJIa012R0NhT2R4?=
 =?utf-8?B?d0l3NzZRZUFNYjk4M2lteVFuMmM4am1MbkMvU21Dd1Z1SFpSVUR5WEdkOVNa?=
 =?utf-8?B?R1FISHRXekdrRm5adHd0Rnc1RHFaNy93Tnc1NEF3MXN5emhJVlg3NVNwdW1F?=
 =?utf-8?B?U2NDWWVGWWZGZ0tkcWxUMEozRURtRFRqUFgrSEhBNmp2WmhsMXYvWFlnVkdt?=
 =?utf-8?Q?16sovc?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(14060799003)(82310400026)(35042699022)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 03:14:43.5588
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65e7ec80-7016-429f-6a9b-08ddae16459b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11076


On 17/06/25 7:17 pm, Matthew Wilcox wrote:
> On Tue, Jun 17, 2025 at 10:40:51AM +0530, Dev Jain wrote:
>> On 26/05/25 12:05 pm, Dev Jain wrote:
>>> Hello all,
>>>
>>> After doing an xas_load() and xas_retry(), we take neither a reference nor a lock
>>> on the folio, and we do an xas_reload(). Is this just to reduce the time window
>>> for a race?
>>>
>>> If the above is true, then, there is a negligible window between xas_load() and
>>> xas_reload(), because only xas_retry() exists between them, so why to even reload()?
>>>
>>> Thanks,
>>> Dev
>> I do not completely remember our discussion in THP Cabal; I recall David Howells maybe
>> saying that the folios are already locked, so it is safe to do xas_load and then do
>> a folio_get()? Even if we remove the redundant xas_reload(), I still don't understand
>> why we won't need xas_reload() at least after folio_get()?
> Because you need xas_reload() in order to solve this race:
>
> A: load folio
> B: remove folio
> B: free folio
> C: alloc folio
> A: tryget folio
> A: reload folio
>
> If A already has a refcount on folio, folio cannot be freed, and so A
> cannot get a refcount to C's folio.

Yes sorry, I should have written that why is an unconditional folio get being
used instead of tryget...and the answer seems to be that we already probably
have the inode lock so we are guaranteed that the folio won't get evicted.

>
> The other mutexes are irrelevant here; this is purely a folio refcount
> problem/solution.
