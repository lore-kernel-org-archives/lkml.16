Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010003.outbound.protection.outlook.com [52.101.84.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5ADA72608
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.3
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750055894; cv=fail; b=UmaigTPCDFU2u//ptV3KZWC12pG4Qfl5RvpUIKoj0zOrB1+NQPyYscPuMMDhWh61eDQJFkhXTY0awwMkrNFgpdlvFZIPFjziHujdSxUozDOUvSF7z8Wze001lhprYRmFVMtKziRgF3rnRMDgi54d3F4m7I3jn4z5pd32mzxsVMo=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750055894; c=relaxed/simple;
	bh=xvGTtaZs9kD2+XpxMMHfTwuwfCfCOf/Cz3qxUholVWw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XXCsNiv90H/v8c1/CZ40v7TuIdu+yL/8UlihMVgwdRN8ztDvEdGJrolmGKIe872lFjHCvgQR/jGonIdS9009SuPtMh5GncgXBNnnFBwSKzjMnTKrpcAsag05R0iQfS3G8869Z/Jw9ffXLYycsfM9aDZA+fKwaZnv1MoppOHHtwY=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=hNe9xHLM; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=hNe9xHLM; arc=fail smtp.client-ip=52.101.84.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="hNe9xHLM";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="hNe9xHLM"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=tU9WfArvCvO4k3ZY4nLYLk8+v4iK3hQYZKL0uaW2VadshUTD6oSsX8Y+uUWPadg3Fc+fBaMz7Dl1V9OBaVz1VLNAyjNkxTyBT//53E7L2VIJ7hjV189K/9mii5ogW8RfJ+7Hx3MbYwI1JZJx8J+phM/goZ+WEMM06yqzxvy6enS6aZZaoMK84eNm/25oDwo84PtQkcZFDuZ1nQ6YzsAp9+QWHJr39+Eb9tTyYbRDuAH/GDaj9sf9X3V2fNLCcLJM3YAq4+f70esHkwNGbZGjZTTmWok+x8tqsF98a3VXTmtZQdm8sZfd+xrFeQJc0dZA7jg1yL7XZGR4l0tZsK0Y4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47bBSICkwHOVQq4EoJ/jpHuiKgmKPjQksWW3eEtM+ng=;
 b=ecllt70MhtEXLOSCRp8aMS315AoOVy0wE5DMOY3oyHqm6AHVbH8ujPSjS6ny8ZZ8N6gaXFsOj+z9lUaKLoUg0sAoiVbhaTusrEM0uRc3ohjmyJL1EcRwf3Xe37tOqt5RmS2OoMj0vpV8gGfNVBAeIV5L/XA/E07bRtdhnGanParwtdZAF77zxyIRU1ySEYFX+kPpJI+PEiqLkrfSBd1PYX9Q6KZwKcSfpNzivh45Etj/8IlIlL+JrMPy9owcL5kQLQfaDKuqUiplfhkpcJv65SpCkqjDQJ6fqdAlmIOyBEISEOuf1FcuYbQAGYkCYRNRNqGYtsYHojc/zHk2I1sScQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47bBSICkwHOVQq4EoJ/jpHuiKgmKPjQksWW3eEtM+ng=;
 b=hNe9xHLMIjRchqXNV1zDWgHK2vCdjUa5/uZ5yHBHbW3Wb5T3QpaoRm0AAlfQBHT8hNqu0GhPdH85JNlufltijb80qUCsy3sDDwQ6sQ9fIUfazwDS+2Q2HIOrsALN9TnwgAcUHz6IDBnlmZ+kV1IOfRGmS2SNSGH4UdKEv3Q+QVA=
Received: from DUZPR01CA0126.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::20) by DU0PR08MB8834.eurprd08.prod.outlook.com
 (2603:10a6:10:47b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 06:38:01 +0000
Received: from DU6PEPF0000A7DD.eurprd02.prod.outlook.com
 (2603:10a6:10:4bc:cafe::4f) by DUZPR01CA0126.outlook.office365.com
 (2603:10a6:10:4bc::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.30 via Frontend Transport; Mon,
 16 Jun 2025 06:38:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7DD.mail.protection.outlook.com (10.167.8.37) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15 via
 Frontend Transport; Mon, 16 Jun 2025 06:38:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bkk9J8jIND/Xgxu9DJ0hvoYF6YXJUeWnpH881LBP/bkJX6f7ADxZ5hCd/ZaxTWLuk+g0BacbRV3zgFu/dmV7JFY4z2c0uZDDwrQZUHn1muMhLRrPnW44oJ+NxU0uyz1EGEOQZqqQOssTXiiWSEoF0EdFuwpWuY92ZXlKNOvfs38AXx0NDnZWf8hiW8Dc6Q13oDemEKZgFV6+mESwn1gGbMEVsdRSwD/4mVyY9jOnP/+Zp+iZ75QBPdIfDaKyi1mbidrShYfD5Iq3rhZtsF0lO+KAuDcaini0Z+8E0idkWmoYAVBjd3JCCNUMpapEmwTPfWAd6HWuaXGTQ6aBR/y+WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47bBSICkwHOVQq4EoJ/jpHuiKgmKPjQksWW3eEtM+ng=;
 b=c6/vapuYGcdggRJb/a+40zxK41/FFPA9nLiuhlpGwUdgv9s01EhBHLRsVRuBlGgty73uuarBRlcXi+93AOIXmf4458oi0agFCFNpsvbBxv6csulLx9ctxMaBZjlnXPxFcl5zQynmGgrHKUF9PEmItC0OhV0135jfpX5amJKElRNJLk/RrzX3ijVhz0v/nGhnawsD0kCk0rvWUBf+D/rWT+evdBhwqcrZO/7wFqV8q4BlpTV1M4zNOjyii3KvZoZ7NjlYWvH4/FV4G18+Fk+FwxOColWGcd4E9il/1IXnUWd3w7+ncV5AWYU+WcAId8yyYoKTOr1XyzMdAnwBQwJz3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47bBSICkwHOVQq4EoJ/jpHuiKgmKPjQksWW3eEtM+ng=;
 b=hNe9xHLMIjRchqXNV1zDWgHK2vCdjUa5/uZ5yHBHbW3Wb5T3QpaoRm0AAlfQBHT8hNqu0GhPdH85JNlufltijb80qUCsy3sDDwQ6sQ9fIUfazwDS+2Q2HIOrsALN9TnwgAcUHz6IDBnlmZ+kV1IOfRGmS2SNSGH4UdKEv3Q+QVA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AS8PR08MB8085.eurprd08.prod.outlook.com (2603:10a6:20b:54a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Mon, 16 Jun
 2025 06:37:26 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 06:37:26 +0000
Message-ID: <d253401a-015f-4cf0-84e0-b39c73b12255@arm.com>
Date: Mon, 16 Jun 2025 12:07:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] mm: Add batched versions of
 ptep_modify_prot_start/commit
To: Ryan Roberts <ryan.roberts@arm.com>, akpm@linux-foundation.org
Cc: david@redhat.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250519074824.42909-1-dev.jain@arm.com>
 <20250519074824.42909-3-dev.jain@arm.com>
 <59242559-5e90-4422-82f7-179a44eb968a@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <59242559-5e90-4422-82f7-179a44eb968a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::17) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AS8PR08MB8085:EE_|DU6PEPF0000A7DD:EE_|DU0PR08MB8834:EE_
X-MS-Office365-Filtering-Correlation-Id: a1d77c82-da08-4b28-2905-08ddaca056fc
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?clNiT3gzdlE0K1ZuUzZmVlJXc1ZJNWNQVlpZbGdYemtDQ215WW9XWmx5c29a?=
 =?utf-8?B?alhYNmZCUThVa3FaYkQwM1ljNGFlcFpFelZZN0J3dDBlSkZ2NHZrb1lKeFdR?=
 =?utf-8?B?MHJUUi9udmxiOHFPSDRWaTlzUzBuTnVIdlFUeURkbWY2WjNmOUpxdGRIVUta?=
 =?utf-8?B?ZHcvL0tTNXc2UlJtMEd6VWIzYm9xUHZEVGxzVWFaQkZGeVJ0SkJhOW5LaWZr?=
 =?utf-8?B?dGdvbHk0dFpaV08wN042ZGdOY0hFelJRWUg3RzVGcW92ZGdiaHNUblpWMlEw?=
 =?utf-8?B?U21hTXdpT0ovT2NpVFVoMFdabGdKNGVKbVpsS2tVdVJDd0U2a2ovMG1PVDdn?=
 =?utf-8?B?L1VkYTlRVkYzSkR6T2p6L0U3QnlUa25KeHdTRWtJWGxVRnRkS08vcDhIMlF4?=
 =?utf-8?B?dUx3WWxmU2lBU1JhVStiK012eElxRjNpU2srWEtQR1pPZFExems1UnAweHNo?=
 =?utf-8?B?WFgvUisvMFRvRWdvck1aditWMWhZSmdheTVJQmdlTDFBWEw3K0ZVb3hYMmZX?=
 =?utf-8?B?R3BrSkxlSm5xVlh5SVRHVzBPcnhEZ2JkL2FMNXEzOXBVSG92eUIvRUNVU0hp?=
 =?utf-8?B?Uzh4VGZhZkFxKytBaUlxZW9oNEhOL0JGTXF5ZjZkcVFPZlJxenBGNWFFSWky?=
 =?utf-8?B?MWt6ZDBBWmMwOUdzVGNlZWtFdVMrR0hMamoxREJKb0NoOFBhbTRTZXhZc1FI?=
 =?utf-8?B?c0VCODIxcjJjekExb2p5dFI3ZmRaVjh3Y3VGczFjUFl5TVhEdU56bGdRci9Y?=
 =?utf-8?B?T3NjVE5ndktWSDE5K05nUzNsOWJmNk5JYUQ1a0xRQzdqditpWTlzZE92bkZs?=
 =?utf-8?B?QkRzTTJHMWErSTBYbEk2b2ZyOExubC9iY2ZhcTV0RjcvNnl5OXFqZUF5Sk1i?=
 =?utf-8?B?N2w5NG82cUZ5TERiK1lDMXZyb1M0dzhOQnNZMWx4a1dDdkE0TnNEUGppYmUv?=
 =?utf-8?B?RktWQlNlbjhKVUpKWjQ0K0JQTDhxOUVFa0FGems4Z1orSmlqMFpsdWIzYVZl?=
 =?utf-8?B?bmJLTElCaEJVTnZxd0JBbzJINUdJN2I1L2hWM1FrZHdyM3lDY0I3bE5aQkIv?=
 =?utf-8?B?VnRmMWp3c0VIRDZPWVVPUE9MbCtkM1RZQXVpWHdhRUZESTFtK1UwQktzY212?=
 =?utf-8?B?enVkb1JUUnpuMmFSVzg5VVJvOC95WGUrdnpYMmNaK2tXeEdhS0EzU1VZNm1Q?=
 =?utf-8?B?b3RTZ3k0eWNOdkJSVitkVXNmblBRSVNFM2hyL1pTei9VYThDS0Jkd2l3ZUNn?=
 =?utf-8?B?dFNUUG5FUGdVNmpxVktoNFl1MzByMFZpQ21ObUdFMHFPdFFvalgyR2tOOWpB?=
 =?utf-8?B?M1NEUkZ0akdINUFRblNUMkR3WDByaEpkOFFuT29XZld1ZjVudFk0Z0s5VVJN?=
 =?utf-8?B?a0lpeGJLU2FFY09URjFVTEV4UTF2N2lKVzhBUXBQZ0lmSlZva2JtVCtyb0Zn?=
 =?utf-8?B?bjkyaytuSUhadERPc3UyZUVoR3B6bHZGUXZVWEpJVTA0dEk4RTBDYWRDcWV6?=
 =?utf-8?B?M1hxbXorUGJmRUdkL3JWOTFIOUNlR01jaUZhQi9NdG5vM1hrNkQ1SjRqcEVK?=
 =?utf-8?B?blBIcklxV2MwWGZvM2dMSGxyRTZxQUdaajRsU2UzNVJCbGJySmQ4UnpZOUlI?=
 =?utf-8?B?YkFneFBQcEJpbnUzR096U21rQ1J5NDVXSjZVU0w5RlZJYnhBa3I2V1cwQ09E?=
 =?utf-8?B?aWdpUDJ4aXNrMDBTcVd3dGZ1M1ZXWTJ2enFtaFpkMkJNcVk5ZlpMZkk1RWsw?=
 =?utf-8?B?TXA4dHFiMEtvQ1RIVjlLN3A3bnkxbUxud25zbGNVeXViTGlQMGNPRnY1NTBp?=
 =?utf-8?B?S0VCL21KTHY5NzRLdm5PajFaR1J3d3JCWVFZZlZLT2RWNXViTk1EN0ZNeDhC?=
 =?utf-8?B?SkV0aWNRQkdSQ1R5Y2s0ZFRJMzQwMzR3blpFRnpHTjJUYkgrWEdQYWQ4NkQx?=
 =?utf-8?Q?LCC72J94DPo=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8085
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7DD.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	66937980-671b-44dc-5c3a-08ddaca0423d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|35042699022|82310400026|1800799024|36860700013|376014|7416014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dHNBQUlhbEJneG5qQlZ5N205bWRySUdFR0htRnliaHlGNmtkWXNuT1RhMGky?=
 =?utf-8?B?bVJIQmdVU0NJb0FDcXlUVG9ydFhYaE15ZXJpeXJzVllOZGxGQzNNd24veGpF?=
 =?utf-8?B?d1Q1MzQyRXBPYm5OeXBiY0NpVGx0UUZsblhqbUZLbmV4RzloaFN3SzFBdW5H?=
 =?utf-8?B?cHl1V05DUXBvZXhnMFAzbGxUVDdLOStya2JOekloQjV3cnNZeWRUamIrVGpD?=
 =?utf-8?B?TDFRTEpUV3RCV3dTeGhQYUFFQlM0eVNqeFFESWs5MXdsUUJQYTNRMWNIY1lK?=
 =?utf-8?B?Um16RGtvZko4MExmdk1KbktwTmZzbHVwVy9BaThoTW5MaFZ6UUVWc0dqdElF?=
 =?utf-8?B?azRBKzZnd2NXZk9uVXVONGVZN0l0YWhCbHBsR0YwOTNiSUJKTHhxNDNBeDVL?=
 =?utf-8?B?OXY3VUpYUDByclV2K1V1SW1uamhTKzd3VTBsSldrZjM2RGVVd1loc0J1QmlH?=
 =?utf-8?B?MGNjRWpaalpqQjl4MTdlRkNsdlY0V0RBRjhjSjgyMFB6SDdiWXFVdklmUHZs?=
 =?utf-8?B?WWVTRWIzR0NtMGpzQWJJSHJpSldhT2tJUmI1ektjckZjek5uV3RzUFJ4V1Vp?=
 =?utf-8?B?bGU1T2RuWnFFd29RWTBiMzBPWXFqZUV2c3k5SXdiaFBlL0FHY1pkVkluc0Nw?=
 =?utf-8?B?d0F6RmxLSUpnMUxwQ2FiQ0FNajUySlJERDNKTTdNZ3lkNE0vQ0VMai9YWXor?=
 =?utf-8?B?M1pkdkt2dlhFKzhmdysrRC9VL25UN0Iwc0ZmNUc1eGJMR3hqbHBtWjVCYUEy?=
 =?utf-8?B?TGZDV0ZZVm9KeGhVV1A0VHRNalFXdDhjaGNINmh0dXkwVTBLdStUalVmdFVC?=
 =?utf-8?B?dTV4Zm40SU5HaGJXajg5SjBLcG9aaUs5UWlZUEtIUVc0TjhXWnhHanpTNEl6?=
 =?utf-8?B?YXkwS0ZwV2VtUkJlMFphZTcvUkxMcVJlOEtrcjl5MzR1OFUvSkN0M0hxM20v?=
 =?utf-8?B?cG5FOUw4VG00KzVrSlVEUTcwdllCQm1uYzdqWXRZb2RMTmFGbUJSZkpEMWFJ?=
 =?utf-8?B?NEgrRlNEVzZJQmFnTmRDd0RDczdYMVVldndRMWhNazFiM3hVZi9SK3NLZFRQ?=
 =?utf-8?B?eTBtcmErMFc2U3hXK3Nyd2VxVmhqbDY1aDZZOXJyZzhKazNVU0QwTVZ0dVkv?=
 =?utf-8?B?RkxoR0tPM3NndFN5blZLRGI1NkxMNElmUWV3TEtBWGRJMTh4N1lHUk4rTTJx?=
 =?utf-8?B?c3UwUjF0U1R5bm9DZndSUlBEQ2d4KytZU05KL2xQUEp1SHhXcjIwZ1QrS2w2?=
 =?utf-8?B?RExLR096Q1Y5eEFrcFNteEsycWd5S3AwUkRWQ29ZbWNJYUkzQlBrdjhSTzF1?=
 =?utf-8?B?SGdjM05WVEJjdjR0ZUkzQkVWSWRnQ1RGUEJOTldDbmo3bmgrSEFId1dQNitU?=
 =?utf-8?B?L0UyaW51YlBNN3d2emxZNW9yeEw1M3BRdk1GbnkwZFRrVWtxSG94Z0FQR0xJ?=
 =?utf-8?B?SjhDaTF0bktSSi9OVlNKbUtLVmx3S05BSUppeVMrMTRyL3o4V21iWkc3VHdI?=
 =?utf-8?B?UGU5b3hldW80NURlblZUTkhwc3AyNU1mTDd6cEF1MEZocEwySjVyaHNid0NR?=
 =?utf-8?B?Z3pDckdiOHNEa2VjK3RVdDhxWlVkaXhTVzF3N3BkUnpYOTNTdldxc1MxaUVX?=
 =?utf-8?B?TS9UaWk4MHp0UE05RXNhQVF5QmszaFRJaG93MEtDcGVVdVM4UjVwZlZiRDNn?=
 =?utf-8?B?MytKbkUyOGhvUkJlbDZMZllxQ2lrSUpzTHNiRk9LK1ZwUGl5aVVIYml0TDBF?=
 =?utf-8?B?Y2pzMitDSXVOUXBDWnVKUU9wQzVIZWwwOURqM2VnK3lxRTlVYmI0TGt6bVY2?=
 =?utf-8?B?UlJ1bEJiTVN2elRzSEQ4eEJ5NG4rcnR6R3gvQi9yWnN1RHkxYklxWkxCWTVF?=
 =?utf-8?B?bmEzTVVBajQ2VG5yV0hKYnljdDVPclpXUmRxdzZzTjJqRXp4TXI2a1F1anRq?=
 =?utf-8?B?LzQrRFdrTU1ZdTJEZW82R1hyTGJmY3RhdVVZUVYrR0wyandXalo4cVQ1YXV4?=
 =?utf-8?B?QnJ6VUxtWTF3cjRVVzN0Z3ZkT0hiV3RJaTlVZnRIQXJLNVRBQlVOMm5rWitx?=
 =?utf-8?Q?QQYgrW?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(82310400026)(1800799024)(36860700013)(376014)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 06:38:00.9460
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1d77c82-da08-4b28-2905-08ddaca056fc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7DD.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8834


On 21/05/25 4:46 pm, Ryan Roberts wrote:
> On 19/05/2025 08:48, Dev Jain wrote:
>> Batch ptep_modify_prot_start/commit in preparation for optimizing mprotect.
>> Architecture can override these helpers; in case not, they are implemented
>> as a simple loop over the corresponding single pte helpers.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   include/linux/pgtable.h | 75 +++++++++++++++++++++++++++++++++++++++++
>>   mm/mprotect.c           |  4 +--
>>   2 files changed, 77 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index b50447ef1c92..e40ed57e034d 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -1333,6 +1333,81 @@ static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
>>   	__ptep_modify_prot_commit(vma, addr, ptep, pte);
>>   }
>>   #endif /* __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION */
>> +
>> +/**
>> + * modify_prot_start_ptes - Start a pte protection read-modify-write transaction
>> + * over a batch of ptes, which protects against asynchronous hardware modifications
> nit: This overflows the 80 char soft limit.
>
>> + * to the ptes. The intention is not to prevent the hardware from making pte
>> + * updates, but to prevent any updates it may make from being lost.
>> + * Please see the comment above ptep_modify_prot_start() for full description.
>> + *
>> + * @vma: The virtual memory area the pages are mapped into.
>> + * @addr: Address the first page is mapped at.
>> + * @ptep: Page table pointer for the first entry.
>> + * @nr: Number of entries.
>> + *
>> + * May be overridden by the architecture; otherwise, implemented as a simple
>> + * loop over ptep_modify_prot_start(), collecting the a/d bits of the mapped
>> + * folio.
> nit: "mapped folio" is a bit confusing given we are operating on ptes. Perhaps
> "collecting the a/d bits from each pte in the batch" is clearer.
>
>> + *
>> + * Note that PTE bits in the PTE range besides the PFN can differ.
> nit: Perhaps "batch" would be more consistent than "range"?
>
>> + *
>> + * Context: The caller holds the page table lock.  The PTEs map consecutive
>> + * pages that belong to the same folio.  The PTEs are all in the same PMD.
>> + */
>> +#ifndef modify_prot_start_ptes
>> +static inline pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
>> +		unsigned long addr, pte_t *ptep, unsigned int nr)
> I thought David H suggested modify_prot_ptes_start() and
> modify_prot_ptes_commit(), which we settled on? I'm personally fine with either
> though.

Nothing was decided upon strongly. I will personally keep it the same for sake
of consistency.

>> +{
>> +	pte_t pte, tmp_pte;
>> +
>> +	pte = ptep_modify_prot_start(vma, addr, ptep);
>> +	while (--nr) {
> I thought we agreed to make the loop logic a bit more standard. I don't recall
> exactly what was finally agreed, but I would think something like this would be
> better:

Again, nothing was particularly decided on as far as I remember : ) Let us
keep it the same - https://lore.kernel.org/all/d048366b-eb6a-4fea-9b60-af834182b1b9@redhat.com/

> 	for (i = 1; i < nr; i++) {
>
>> +		ptep++;
>> +		addr += PAGE_SIZE;
>> +		tmp_pte = ptep_modify_prot_start(vma, addr, ptep);
>> +		if (pte_dirty(tmp_pte))
>> +			pte = pte_mkdirty(pte);
>> +		if (pte_young(tmp_pte))
>> +			pte = pte_mkyoung(pte);
>> +	}
>> +	return pte;
>> +}
>> +#endif
>> +
>> +/**
>> + * modify_prot_commit_ptes - Commit an update to a batch of ptes, leaving any
>> + * hardware-controlled bits in the PTE unmodified.
>> + *
>> + * @vma: The virtual memory area the pages are mapped into.
>> + * @addr: Address the first page is mapped at.
>> + * @ptep: Page table pointer for the first entry.
> You've missed pte and old_pte params here.
>
>> + * @nr: Number of entries.
>> + *
>> + * May be overridden by the architecture; otherwise, implemented as a simple
>> + * loop over ptep_modify_prot_commit().
>> + *
>> + * Note that PTE bits in the PTE range besides the PFN can differ.
> How can it? All the applied bits other than the PFN will be exactly the same for
> the range because they all come from pte. I think this line can be dropped.
>
>> + *
>> + * Context: The caller holds the page table lock.  The PTEs map consecutive
>> + * pages that belong to the same folio.  The PTEs are all in the same PMD.
> The middle sentance doesn't apply; the PTEs will all initially be none if using
> the default version of modify_prot_start_ptes(). I think that can be dropped.
> But I think you need to explain that this will be the case on exit.
>
>> + */
>> +#ifndef modify_prot_commit_ptes
>> +static inline void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned long addr,
>> +		pte_t *ptep, pte_t old_pte, pte_t pte, unsigned int nr)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < nr; ++i) {
>> +		ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
>> +		ptep++;
>> +		addr += PAGE_SIZE;
>> +		old_pte = pte_next_pfn(old_pte);
>> +		pte = pte_next_pfn(pte);
>> +	}
>> +}
>> +#endif
> I have some general concerns about the correctness of batching these functions.
> The support was originally added by Commit 1ea0704e0da6 ("mm: add a
> ptep_modify_prot transaction abstraction"), and the intent was to make it easier
> to defer the pte updates for XEN on x86.
>
> Your default implementations of the batched versions will match the number of
> ptep_modify_prot_start() calls with the same number of ptep_modify_prot_commit()
> calls, even if modify_prot_commit_ptes() is called incrementally for sub-batches
> of the batch used for modify_prot_start_ptes(). That's a requirement and you've
> met it. But in the batched case, there are 2 differences;
>
>    - You can now have multiple PTEs within a start-commit block at one time. I
> hope none of the specialized implementations care about that (i.e. XEN).
>
>    - when calling ptep_modify_prot_commit(), old_pte may not be exactly what
> ptep_modify_prot_start() returned for that pte. You have collected the A/D bits,
> and according to your docs "PTE bits in the PTE range besides the PFN can
> differ" when calling modify_prot_start_ptes() so R/W and other things could
> differ here.
>
> I'm not sure if these are problems in practice; they probably are not. But have
> you checked the XEN implementation (and any other specialized implementations)
> are definitely compatible with your batched semantics?
>
> Thanks,
> Ryan
>
>> +
>>   #endif /* CONFIG_MMU */
>>   
>>   /*
>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>> index 1ee160ed0b14..124612ce3d24 100644
>> --- a/mm/mprotect.c
>> +++ b/mm/mprotect.c
>> @@ -188,7 +188,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   						jiffies_to_msecs(jiffies));
>>   			}
>>   
>> -			oldpte = ptep_modify_prot_start(vma, addr, pte);
>> +			oldpte = modify_prot_start_ptes(vma, addr, pte, nr_ptes);
>>   			ptent = pte_modify(oldpte, newprot);
>>   
>>   			if (uffd_wp)
>> @@ -214,7 +214,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   			    can_change_pte_writable(vma, addr, ptent))
>>   				ptent = pte_mkwrite(ptent, vma);
>>   
>> -			ptep_modify_prot_commit(vma, addr, pte, oldpte, ptent);
>> +			modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr_ptes);
>>   			if (pte_needs_flush(oldpte, ptent))
>>   				tlb_flush_pte_range(tlb, addr, PAGE_SIZE);
>>   			pages++;
