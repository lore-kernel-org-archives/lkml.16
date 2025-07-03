Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011020.outbound.protection.outlook.com [52.101.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545972D8783
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.20
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751536417; cv=fail; b=jufDeJoo1LoU57Jibd/uN/9Syum2OnrFr/S7vLWRLVks3Q/LQy+5RMiV4pNn4YSGPZ/pKAY2i4A2V56fTzdmZ1oIa/KR6TX90OLKe+YRV99gEkQR6X2HCdI7cpgGjRp7SW+hC/YdbiX5flwDECPi5mjqNTvWY7tO5SLJY125bRY=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751536417; c=relaxed/simple;
	bh=yjLfnwKcdQ71QkmQDW7G/c1iOI2XxDEluaJ4ufnUPFo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=I8FhvV3B28BSIzQu1y30ozN31xmyf9cKW86kVLiCJHcERzLLpDPuv7gELzTzePdH3jejDWTe7VxGON4EAqEHNFwiq/5ikUqLbPDH3rYJmuATDzNSZnsM8mpWBFCfcb5+uUkRKSMRvWFYpPRg97vtGmNnmvDEnQszI576Ab5gbzw=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GDBPujli; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GDBPujli; arc=fail smtp.client-ip=52.101.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GDBPujli";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GDBPujli"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=RhTHmjYaQ/n+qkpNgQuNNw8ao3T34MgL5PRqsTOb15WNz5XfazPeMaRnn3wjovQBxe52H/Ab7Ot9bZ0MqdzVh7Vi2dazR0nYl1p7GGQomzhzEE7GWt8oBW5UzfV9qBzUYOQ+9Kj+wtqR+bWktuqrKJLISw7yTDhyKvFRnQN8PMkg1MxaZMvjraMIGHBvYCZXivmA4QHlG+4GQauoWbHFowHu7F4BCwmNCmbvYj0qa1IJR3XEJ3b5sR9FHtjozMaEHYLKQ/IDXUFKEjAoLr3RS3/D4z4z1x2csQRrXQJNOSMHEol6MYTccSkLa+wTeP+ZOSmLcZ7JSJFRRzJDcJGv4g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GuXfiYl7DpZqHCiAjeqmZpWPnFrXuWYsMPzqC0SWhRk=;
 b=rGuq/DUW84i/voy/WgfObPb5ncGAxBQXVLev/NzywRXJ/8qt+aKPEwHfaBbHGpF7YTGhJrOObD+bGhOo79Cv5oSx5mqYP6UkLsF6eo+BSGWAjKKsrH7cT01jncvvldpRYPD5OtnRLjAfKySm6I7rOUkt0gyqiLoY98Qh6TJstfnxBNUz3Mf82kSreYfRCV8bI3PEifB1kBveOg/xUffFIM7XHmcVD+tJYMb3ho1Kz1xGlV7flVCfN46QGB7JGKk0i3nQMBPH8Jf1zJuncxFE3keLgkOPrl6YAsu7lpe0BNifC8kUV/optTmVeL2eKvV9pueNGGgOwUH4DsBnZ535MQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=redhat.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GuXfiYl7DpZqHCiAjeqmZpWPnFrXuWYsMPzqC0SWhRk=;
 b=GDBPujliIMEawcC0lX2DbDA12jjlkOwIgDWPEYRYMysczUjh9n10naLP28GRUFZHl9R2zrJ/pSaW/xCGI0kKphp3TarzogwManUTd0RacMk9FXnh+wF70z+OknTTxWhgPMw/xJ2egJDbnr2765FCuEmDnwVhecQ72X6J+95vzXY=
Received: from DUZP191CA0014.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::18)
 by DBBPR08MB6122.eurprd08.prod.outlook.com (2603:10a6:10:20d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 09:53:32 +0000
Received: from DU2PEPF00028CFF.eurprd03.prod.outlook.com
 (2603:10a6:10:4f9:cafe::38) by DUZP191CA0014.outlook.office365.com
 (2603:10a6:10:4f9::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.21 via Frontend Transport; Thu,
 3 Jul 2025 09:53:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028CFF.mail.protection.outlook.com (10.167.242.183) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Thu, 3 Jul 2025 09:53:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yMRh+107HR3gv4nTNFttja+89BeUwjkfN1eS2ozuQxPp8YHhEMUVg2Dap8tGZOwEU13pY2n9MRHDQL5MyvpHRCwVBCGeV+/J7k6kov9sC6743KsNk6XvjihPHoSwES90DuB6V32GD31kYsKGX4URl4iI21VMvWUCWMxhsKyraAoCX7mbk6C6Z/s2e7FBdFvefO2gObJntPJ8CJ+D01qBQlUfA/Na2vhiFX/RPw5Ff9l8YJ4XQrM8OVxb10q/TIvDsh7E+pnvt6jnWt/M1IAKWRcPu9fNdOq4Co4GC9nt278uDm4YCg26E6br40jtVB8l1xfC4++cULzUfSuWYdHTvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GuXfiYl7DpZqHCiAjeqmZpWPnFrXuWYsMPzqC0SWhRk=;
 b=FxIExjDCn6fVHYaDukp7VKXk7OXNjpoWEbJeBasPyy2pAeWEQRUDEH4GSDtI5JX/K2tYXq3bCsl3drAz9FwhJrtS33jKks4hFCfA3s4pAN2STLpTa4CVT3LOIvt00NQ22LwND3Gz1FiqPHxtLHShl4aj1wg2+vv+lyJrxggqZXUkRuus5hAtIH9kBhn36hlKqWZYjbQyUPsowDPnZmhS0MOyvtJEofgdOlLlgxpXBM2hszamszmxG3xJ7R8wi19bNdyKxD5NLXvZ1GAxbq1psuLPLcFpJPqdUbi1kAoh0IuEKKU0fe2LYuf3Byz45dBbGa5yzkXBkeecpkVjhv/yXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GuXfiYl7DpZqHCiAjeqmZpWPnFrXuWYsMPzqC0SWhRk=;
 b=GDBPujliIMEawcC0lX2DbDA12jjlkOwIgDWPEYRYMysczUjh9n10naLP28GRUFZHl9R2zrJ/pSaW/xCGI0kKphp3TarzogwManUTd0RacMk9FXnh+wF70z+OknTTxWhgPMw/xJ2egJDbnr2765FCuEmDnwVhecQ72X6J+95vzXY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AS8PR08MB7941.eurprd08.prod.outlook.com (2603:10a6:20b:539::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 09:53:00 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 09:53:00 +0000
Message-ID: <ef3f1916-a8ca-455b-bc3a-adb69e3d3242@arm.com>
Date: Thu, 3 Jul 2025 15:22:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] khugepaged: Reduce race probability between migration
 and khugepaged
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org
Cc: ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, baohua@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250703054823.49149-1-dev.jain@arm.com>
 <1d82c930-be52-4983-9fd7-099df487eb48@redhat.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <1d82c930-be52-4983-9fd7-099df487eb48@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::15) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AS8PR08MB7941:EE_|DU2PEPF00028CFF:EE_|DBBPR08MB6122:EE_
X-MS-Office365-Filtering-Correlation-Id: 66e93d03-1cc0-44e5-29c8-08ddba177850
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?SDI2bmd3cXMwRFF0TllDQnUrL1lvc1Q4UTFWTXlLWHlJTkpwbmxtc0c4TEx2?=
 =?utf-8?B?ZWxhSGtpTml0ZFdzVU5KYjNoeXFuQmFkUVdaSE1vRU11bm9jVUk5aDNIams5?=
 =?utf-8?B?aGRRTFVqYSswTjFZZXgwTVFVR0tZV2RleWw3NEVGQUJ5NGVzcnVQUzVSY2tn?=
 =?utf-8?B?enlzU1BwV2xRb1BxSENDdU84YXFvM3VQTVZITVhJUnN0UTNMTjJVQmVSbjNJ?=
 =?utf-8?B?R3N5RzkxU2ZxNS93S2R5UnAzVlZqd3kyMnNTRG5UMUIwcno1U0laQmNJNWlL?=
 =?utf-8?B?SG5PendmanZFd3lZaHRpbUtvNVhTRmk4ZjJua241NGxmQSszNGNudFJuMUpz?=
 =?utf-8?B?Wm1kL2Q5aktQYzB1U2l4aFhyRzFHQzg2R3M5QU85NEdVNjliNHEzd2REaTN1?=
 =?utf-8?B?OUl1eXZyUTV4Zks2YVN0UFI0UUtVYmhnaXZ4ZHFIZW9oMHE3dkVaS3hPR0hh?=
 =?utf-8?B?WnM2ZVBEOVNjOHZsUFErVmJrY2x0V2dkbnAvM3JZY3MwU0xmdTlMQUVEbzNQ?=
 =?utf-8?B?YXpaN1c0MGw2MjRDVEd4anVjMlVaM1RxUGhmWDBKWEppSS9HT2dPc05LdTVp?=
 =?utf-8?B?VkF1OFl3amhHQndrTTRudVJJMnFXdVhyRG1nQUNxYkVvNUIrZW05YW5PVU1E?=
 =?utf-8?B?TXNVaEtpM0hWek40TllDdFBEOGlZWlp1Z2FlMDJWcTVBZHB3Q3pQYXFkNmdi?=
 =?utf-8?B?L0NXS0N4aXB5aFNsTE9wYk5XVHgrbzMzdGJ2WkhwUEU0TUEvRXp0aU5JUUUy?=
 =?utf-8?B?b3pOdzIzd093T0pLQTMrSGNZRS9yaUExU3lJSjdQN1VGNThTSXcwaWxFWFpC?=
 =?utf-8?B?OFUrWEFrNFJaTnR2eWhKYm1kWjBTcWlmSGQwYkhOYlRyOFBJUVgxMmhKNFlz?=
 =?utf-8?B?UExIM3V5dHAwMnB4bWZBamlxYjVXemd6c3lZS2dUYTdZT3ljK0UwVTNCQjF0?=
 =?utf-8?B?MExCVERnOFliL1RYV1p2aXd3V1ZMUTNBZmkvMHNXT2NzUm5NK3BSYVNOSyt0?=
 =?utf-8?B?NWJiOWhyaHFZZDN1SjQvK09XTmlrOUk4K0s2NHNTUGdjSTFqNi82MEZCUEdQ?=
 =?utf-8?B?ek5CK0VFbHZQRFBBSDlMQkZkaVRxSXJxOFUxLzVCaExmSVQxK2dML255bFJa?=
 =?utf-8?B?V0dzQzlWd0JHdTBYeW5rd1cycmdUbTZ3eVcrTHB4QWNSdnUwRUhrNU9NdUln?=
 =?utf-8?B?T0dDOFlkRDYzN2VFVkRDcnVMRURMc1pJOVJVaFlUWWVHM1F0T1RHQ25hMmFr?=
 =?utf-8?B?OXNFeHA5SWMwOG5ZUTBxTXlVeGZRUUVlU0V3ZkIyYWJZNWErbEN4R3NTc0xa?=
 =?utf-8?B?OXhIMVZCNGZKU3l6QXlBQzJ6aW9WMlIyZUJ1eFRINWdQQ2Fkd2k0NWpwR09Z?=
 =?utf-8?B?Z0UxZGJyaklYc0RiUGlsRG1LdXMwS2NZODUzSGJGcmtKWjNBdjl1dXhuME96?=
 =?utf-8?B?MDJPdWh2RVZZeVV5ZUVJRjhkV1FFSDE2SkE1UUhITVY5ZGVOZnFDSGM4UEEv?=
 =?utf-8?B?bEwrU1dCRXF0WmE5NEQ4Q0p6dVBuMTJkV2xaNy9FUGZkdFlLN3E2NzJkcWRu?=
 =?utf-8?B?SDlkUHp6aC9DVHFEMExZS2l5MnMrWEEyL1RjZzJzcDdWcDlLS0k3OUZLNm1D?=
 =?utf-8?B?elF1WTNLaExwY1lYU0Vyb24wb2tMZmlRWE1FVzhNSGwrNGxQM0dGc2w2TXkr?=
 =?utf-8?B?cTIrVUxVS2wwRExwV2dOU2IydzQ1QmRrbE5HZndhcklBOG9mTEYwNlFxM3hp?=
 =?utf-8?B?ejJidFkyU2gxNEt4cmRZWGVoaHRUamVRNGMrU21XdUk1bk1ESDFVMGRqTjRM?=
 =?utf-8?B?cmZKTWRNSU5VcGd1clVodnZzSHQvNmdhRU5iK1JhNXJIZXE4aS9uT2s5ZUFX?=
 =?utf-8?B?OE1kVTd1RjBnbVhRK2RVOU0vODdQMDY1SmlqcTdFajgxazlHSE9QYTY5T2ZP?=
 =?utf-8?Q?LNluO81bis8=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7941
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028CFF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	14ddb7f1-78c2-4d77-5ea2-08ddba176511
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|35042699022|1800799024|14060799003|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MGpvYU9qZ0xNMFNIMXJXQmtVSjRGdmFvSldicW9EYVRqaHVubThTK3pDVlJE?=
 =?utf-8?B?SnRiVVl4VGNHMmU5TlNjOFFTeGRTUDBONGxwUzhSNVBvVHJuZjRrakVwS3Nv?=
 =?utf-8?B?dXMzQ0Z4RVpEcGNtRVhEMi9JQ3oxSVdCL1BQR1V2ckUvQlkvK21XMFlnL3Rl?=
 =?utf-8?B?Y2VOZk1RcHZRbWQ2S1paK1g2TGtQSFpIMGVmalNwcVFKNGFibzhON2w0dlZG?=
 =?utf-8?B?OEs0SVlMUXE2cjZWeGV2S3hPSVY5SDZvVE41MFF4UktndmYrL3AyYlc5OHlD?=
 =?utf-8?B?ZEZ6SGdtVm0wamRwVnZFRFI0cDRlR0xnYjJ1RWVoZWJ4Um1Ra0Vsa2ZBU2pL?=
 =?utf-8?B?UFJFa2QzcVpmaFdPcjRocHpHdFdCejRFUU12aUdZMUFkYXVXMWMzU3E2L3JK?=
 =?utf-8?B?NThlN01lODV6REw3eFBOb3lnRkkwVWx6NHdSSDBIM3RtSmpnRUYzTVY3VytI?=
 =?utf-8?B?c2xNVkd2TzQ3NFRIR21TWGxkUk1HaFIyclhyRmtVNTlEaS9CdGplVXhHTHN4?=
 =?utf-8?B?TStLTGVMT3lQSUpDdlJHQ3VBcVNHbVJVait3ejMrYVgybHB4YWZHRkEycWhT?=
 =?utf-8?B?Tk8rcU0zMU9zV0xYMjZib3gwL3VDa0UxdmlVSGw1RWxTSm52VGlWcnJiU2pI?=
 =?utf-8?B?YVhTemMvNmFaVkZNeUZ0L0tqZFMwb3ZmUXhxWFFIdVUxMlBTTnZjUE5YVjQ0?=
 =?utf-8?B?VzlPTWFjWGRLYUhTbm9OVVpmVHhpV1hHZjdOa1ZOV3NiNE5tZ3dwY29zSDNX?=
 =?utf-8?B?MnNZM3doWTJLSHBnV2ovWUpKbnVXWWtJQUhpUUpSUWYxWER0T0ZtZzRZam5a?=
 =?utf-8?B?OTQ0RWJCQ0dUUndBOElhc1dCbGF6WGVmT2tjOHh5czFXY0hDVExtczFuMU0v?=
 =?utf-8?B?RzYzdjd6NkxBaytGdEJJYTYzM1BEaVBsWTFJanVzVWFDZnVnMmtZazRuN3Vh?=
 =?utf-8?B?VmMrN2VGc2J6TGEwNWxMdWpNNy9VbWRBanZFY044NmRXcXM1Nk43bDU3d3Vt?=
 =?utf-8?B?TUhRVVNPNk90ald4K1VndUd1ZjVVaHQ5L1ljeHdoVVhyTjNMZkFxLzdXV3hB?=
 =?utf-8?B?UnQ2QiswV0F1NStOamU5UXZ4WkkyMW9XZ0ltZll3OGZqNmg4bmxHYVZTSlBt?=
 =?utf-8?B?SExlMmFpdVpBdmhuYkhsMFN5NGdmQkNUalJ2Y293K20xSzB3K3BVNmhDNURP?=
 =?utf-8?B?MkxJdm1qMVVXVnkzaXlRMS9KSFlFdVl4K0txT2xyQ2JlL1M4ZzVmVmtOUjhy?=
 =?utf-8?B?Qk9SWjZMc3R3RWFxeG8xR3JGeUh5SzU0S2pWY0VOZmUwc2hJdnI5Tkh1ODJy?=
 =?utf-8?B?Y2Y0SkQvOHgySHd3aVY3UmpPWkNSYmVQekdNS2JoTmFSc3ZNek9TcE9NOUxl?=
 =?utf-8?B?QURQK3NFYXJkcjhyaTNnK0JLVkpBV1ZobXBhQk9BTmQ0VnFvaHBMSTdtUldK?=
 =?utf-8?B?SGJyWVZuY2orVkFjNFNVWGtJSnR6UTMyNitYeU82Y2QzL3JsOFlXWmRpcEFG?=
 =?utf-8?B?NmlzaDRkQkd4T3BsaldGM0RpYVRGVzVwLzZCNVA3YkJMc0loZ2IySE9LM2FJ?=
 =?utf-8?B?Q0pEL1VVWk1Nc2lyd3BsRzl6YVJ1RS9aZmV1MENETU5wMUVyZGxyaGErclND?=
 =?utf-8?B?MkpuaFZYZGZ4M3RlT08yQ0s2YWM5MVlIQ1NacjBsRXMzU3p4eUZ0TkJRckRE?=
 =?utf-8?B?ZHNWVUhjcFZlUi9nTkp3MDAvS25uMk9JREdrZ3RMSmhiZTgwWGF2V243NTFr?=
 =?utf-8?B?bXB3QXpKalBtemxFUXA4SEdob1hGb2M0MUpVNlBqYnQrWnpMVURpc1orSUhj?=
 =?utf-8?B?K3E3ZW9iT1h1eTNPUHpLRzJTL0h3UFpVRWpaZGlGRWhGRGk0MDM2RjdEQlY3?=
 =?utf-8?B?ditlakVpWjl0VW44L2NiOHluYllHYmNOWnRFbXJMK0V6Z3BYL2ExRnBwallm?=
 =?utf-8?B?Q1hESG9ybGh5disvZHBNb0VudGliZTQyZ0R6SjNBNjIvTUxXVldlc3dNWnpG?=
 =?utf-8?B?WlNoSzNFNXNuOEJEbktGVlhKYUIyZ0dIMURkZ1JCazNCMEdIaFcrbTdKSE5v?=
 =?utf-8?B?M3cwcE9weDZ3U2NGSDhVUkxrWW1kMDh1NVZkdz09?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(35042699022)(1800799024)(14060799003)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 09:53:32.0977
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66e93d03-1cc0-44e5-29c8-08ddba177850
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028CFF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6122


On 03/07/25 2:55 pm, David Hildenbrand wrote:
> On 03.07.25 07:48, Dev Jain wrote:
>> Suppose a folio is under migration, and khugepaged is also trying to
>> collapse it. collapse_pte_mapped_thp() will retrieve the folio from the
>> page cache via filemap_lock_folio(), thus taking a reference on the 
>> folio
>> and sleeping on the folio lock, since the lock is held by the migration
>> path. Migration will then fail in
>> __folio_migrate_mapping -> folio_ref_freeze. Reduce the probability of
>> such a race happening (leading to migration failure) by bailing out
>> if we detect a PMD is marked with a migration entry.
>>
>> This fixes the migration-shared-anon-thp testcase failure on Apple M3.
>>
>> Note that, this is not a "fix" since it only reduces the chance of
>> interference of khugepaged with migration, wherein both the kernel
>> functionalities are deemed "best-effort".
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>
>> v1->v2:
>>   - Remove SCAN_PMD_MIGRATION, merge into SCAN_PMD_MAPPED (David, 
>> Anshuman)
>>   - Add a comment (Lorenzo)
>>
>> v1:
>>   - https://lore.kernel.org/all/20250630044837.4675-1-dev.jain@arm.com/
>>
>>   mm/khugepaged.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>> index 1aa7ca67c756..3fdefc4f4984 100644
>> --- a/mm/khugepaged.c
>> +++ b/mm/khugepaged.c
>> @@ -941,6 +941,15 @@ static inline int check_pmd_state(pmd_t *pmd)
>>         if (pmd_none(pmde))
>>           return SCAN_PMD_NONE;
>> +
>> +    /*
>> +     * The folio may be under migration when khugepaged is trying to
>> +     * collapse it. Migration success or failure will eventually end
>> +     * up with the PMD still pointing to a PMD-order folio, so return
>> +     * SCAN_PMD_MAPPED.
>
> Nit: the last part (, so return ..) is obvious from the code.
>
> I would have written
>
> /*
>  * The folio may be under migration when khugepaged is trying to
>  * collapse it. Migration success or failure will eventually end
>  * up with a present PMD entry again.
>  */
>
Thanks for the suggestion, but

PMD pointing to PMD-order folio necessarily implies present PMD entry,

but the converse is not true? For example it may point to a PTE table.

So I wanted to make it explicitly clear that the transient entry will be

converted to a PMD-THP in the end.


>
> Acked-by: David Hildenbrand <david@redhat.com>
Thanks!
