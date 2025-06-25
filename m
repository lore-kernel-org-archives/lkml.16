Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013000.outbound.protection.outlook.com [40.107.162.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53792E92CC
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.0
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750850757; cv=fail; b=p2hobZmp4Y6wzUGmiuoI1wGMTLdE1f6bFjwxFFX3B5Nys4yJNp65S4IHAL3V8iIG1K3BJvlGUDM2OHaSiy7owsjH9w47fRWl5bICG9EuePy/LRicOSS9wP89/oMZBf8vwEjhfQC2Khly5DUTfI+QRPEkISkW3y3dK6m4vo7yuZo=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750850757; c=relaxed/simple;
	bh=XXA6G3/+00IkFHnEjd/Ut1eopVyjk2/L/hpr4SpizAo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Y/X9wcAsIHdRGIMg/ZQhaxxtDERkw5zjhdh1yfdO/tYFgw9rGLVjz+6iSjBaVcih0gQgBklYE5dg61TMv7efJZY2oSroUYzdhOe3IlIT0Mn+kDi7Txj/2RfymZbom7Zu2aodqVT/Rrlque/vKXpeZXLKZs2rqKOghusP1npZURU=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Qefoz+2a; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Qefoz+2a; arc=fail smtp.client-ip=40.107.162.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Qefoz+2a";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Qefoz+2a"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=KLyZ2Itoq3YuVqFzUXfaY4PIbQIcvgkycFzgdkfmOebTdltx81gUurN4OgGzfOsn9yR3/4sIG9lsHNoV9RGTW7K/9qPKkgjrSOHnAapjB+KMedxBj37ETYrbVUQ3S1PuqZ8ra38CcAJpfgeM6bFfGvsOzCA7fjA+7GFWnxTO7kaxtH8lOCrJmxi5DzvsdR07qaC312aU9jGWTLjO+k+f0r715tzYqjOlRutGbq4i5ozHbUaT0YaAUSf9dn7aw5aPkq+RVr6ozdJNSkcFi4egjVepTtlq2BWZ49Ujm/ehugZXzCUMck/85bPL0QrJhgnd8Y6CD0UmGrwkfPq9pcgxgA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLxBIN4ir+eFuYzBPGVtapHKw9i5LKMBCKVlWm5gFlU=;
 b=i9xScMwQqQ5Pi7iK8zpKVctcKwISPNysp4+aDPG84gcfp8E91ToUCm5Bpic22dxcywtjcmjjJr2+vH01/d/HLZ2+uEQcMaSqyrTrZXkSYqpBIhfLIIIFLNdx8gSZM5mDE33/fK8ZK3tAvWlXZooNAnkGTMn58E8YjFo9agnbRglLEccxgSPyStsBiCyPJuBakx25CzK40II0MvpSRg659TOpFpuuwFCourobcZApWDYWeGFbWBur3iv5PC+Z+DMrzxFmX4oLNO31yq2V4tvkqmWHqVRe/8cGGTdt8EpBl3tco10ZNNKS6yeGqak3vxLc99q7TfJyec0RU81MocTDpw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLxBIN4ir+eFuYzBPGVtapHKw9i5LKMBCKVlWm5gFlU=;
 b=Qefoz+2airZzuV3KiHddIYx8zJW9IVxGMqIvel4mNZGcyUVl0BGfNEgKA02am+Ld4Q6d2F/YsQp7gmNO6i1J0kTQVr2shPhqf/qBxxsluvALUroYBYhxTsIhxqv3KxrY4mvqRsosXsoTRuOAGJrsARm03ZqKkLl9fkRg3tYrsRs=
Received: from AM9P195CA0021.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::26)
 by PAWPR08MB9736.eurprd08.prod.outlook.com (2603:10a6:102:2ea::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Wed, 25 Jun
 2025 11:25:49 +0000
Received: from AMS1EPF0000004C.eurprd04.prod.outlook.com
 (2603:10a6:20b:21f:cafe::9d) by AM9P195CA0021.outlook.office365.com
 (2603:10a6:20b:21f::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Wed,
 25 Jun 2025 11:25:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000004C.mail.protection.outlook.com (10.167.16.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Wed, 25 Jun 2025 11:25:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uIZFl3DbNrLFI5vXANCmR3hE7kzuhwp94oxD0AHQUcsWr4hq/Rqf84bTU5sCEOo7Y1L1B6/z2RDsZTYbO4Q6OHG/Tk5YCdcrzXxEjBPZ6XOCTWEfG7rSr1m/faNlrhy3qMfDCwDFYVzOwZ1U+MlUNbmzf3tvIFOSKI0waoks0XVMTQkk3g0r3I6z9iydsc6eOuSYqmeiH6bnGEwCs++U8XrS2DY0jAeCcxM5ZO+UyMwepFi6DDerHJTCTi5FsLO8ffYrnRNpIjQi9m2i+6cnA9f5qtfmTIVwl20RMJR6nXxs8ZyeMcH0hEZm8jpXVIZdHKruJD8GhBXGsY1QWT7ElQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLxBIN4ir+eFuYzBPGVtapHKw9i5LKMBCKVlWm5gFlU=;
 b=Nd8YHDzLjGdAcO/IvTKS08JDG3tFjHPJURdJ8BpoNaWCdU+bil5+yJiKaH6aBUUDdJHOKolarzzWg5IVNy0aUsWnsQJb4dTW4i7astqHg/RJShDh/8A259j8z18BNGXjoJ8dIM1cOLnSs5YHhRaiCaDjf3HqR4yFqMEZ4Zxq90YVM9HhrTVIdrzjYlJw+LRnrgtwhssb5K/XwpuYeTnk7eBWS0r1JCBNEp3OcPnzWIO0RyCs33PPSNsynyfSoCjNLRulXt9eeWdiLIs7GQ6dQhjyNPinrG1UDLhSS4UkXQUEtyvs1K23Nz614ryIiYRAjM5dGhZAbx+GZ056oezM8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLxBIN4ir+eFuYzBPGVtapHKw9i5LKMBCKVlWm5gFlU=;
 b=Qefoz+2airZzuV3KiHddIYx8zJW9IVxGMqIvel4mNZGcyUVl0BGfNEgKA02am+Ld4Q6d2F/YsQp7gmNO6i1J0kTQVr2shPhqf/qBxxsluvALUroYBYhxTsIhxqv3KxrY4mvqRsosXsoTRuOAGJrsARm03ZqKkLl9fkRg3tYrsRs=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DB9PR08MB7114.eurprd08.prod.outlook.com (2603:10a6:10:2c7::19)
 by GV2PR08MB9254.eurprd08.prod.outlook.com (2603:10a6:150:d4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 11:25:14 +0000
Received: from DB9PR08MB7114.eurprd08.prod.outlook.com
 ([fe80::515:9f73:5a61:fddb]) by DB9PR08MB7114.eurprd08.prod.outlook.com
 ([fe80::515:9f73:5a61:fddb%7]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 11:25:14 +0000
Message-ID: <c3a06824-0557-4a55-974f-fafd222a80c7@arm.com>
Date: Wed, 25 Jun 2025 16:55:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: Enable vmalloc-huge with ptdump
To: Ryan Roberts <ryan.roberts@arm.com>, catalin.marinas@arm.com,
 will@kernel.org
Cc: anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
 kevin.brodsky@arm.com, yangyicong@hisilicon.com, joey.gouly@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 david@redhat.com
References: <20250616103310.17625-1-dev.jain@arm.com>
 <01b48f6c-81cf-499c-97f7-0b537364c5e7@arm.com>
 <805f60c7-9c76-4adc-a679-658d60e08a3e@arm.com>
 <79677ade-3743-4663-8699-08a069ecdf09@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <79677ade-3743-4663-8699-08a069ecdf09@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::7) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DB9PR08MB7114:EE_|GV2PR08MB9254:EE_|AMS1EPF0000004C:EE_|PAWPR08MB9736:EE_
X-MS-Office365-Filtering-Correlation-Id: d5864d6a-b43f-4574-bc1b-08ddb3db089f
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?MnA3T21OdldxNDJVaE9Jenl1aGc4SjBSQWRaalJwa09xbUFHSlZXWmJ4ejd6?=
 =?utf-8?B?UERsY0VkRjQ4TU9GVlVxejNXV1NhU0ZhMlV2QVhxeWNOcExpZzRWOWM5Umpi?=
 =?utf-8?B?bEhrVklRSW5DSEpBZ0wyT1hFOGxGcHVGQWlGMXo5MmlITGNUOFZrKzM5Y3pw?=
 =?utf-8?B?U3FLbE03bWlKajBVTXQza2cxaElWWDdoY2d6cU41L2V0VHBPSjNnaStUNC9N?=
 =?utf-8?B?YmVzN25aTWRuNVRjR054aE9SNTlpcjZxTmg5Rmgzamo0V2xVVDE5aUtjc1h2?=
 =?utf-8?B?UGFVRFI4MlFhalVWMkdod1NXbFByaC90Ung4U01aQUZwcFdGREIxd05uTHlQ?=
 =?utf-8?B?UFBTRlBHLzJadVFNWDdVM2Z3UEUwUzZpUUdVamY5ZTlpbEo1OVV6aWdmNVJC?=
 =?utf-8?B?UlQ0NThaUlNIVWh4WU52ZnRRM2RnQndOTFFjZkFmMjBuMmJ6QmRnTFdFQ2pR?=
 =?utf-8?B?emdQMThKNERnTTNaTEJFb1R2eFcyZ2RkNkpxQ2dVYWZuZWJYOUNRbDVBOGxl?=
 =?utf-8?B?YmFNTXZobFNlUWNqQ3F5UUVMS28vNC9nbTVPNVRGVVl1a244eGpMcmgzNEFR?=
 =?utf-8?B?bEFYK2lGSzB3Qm9JNHA1R3UwckFYN1pxQjNQc2VNcG5zR0wxdEhKZW5rNWps?=
 =?utf-8?B?SHRGWmM4cndaaVM5UW53dXkzd2NvM2dTUFpJYXl4azljdWZmYURCMGFHRUl6?=
 =?utf-8?B?TG9MUU00c0tvTC96ODliYjc2ejRaT1M0M3ZlaFJKaVp5aVl3alV3UUJyaVJ3?=
 =?utf-8?B?dG50UVJMV1RRV0dHUHBsV2V0R0ZhTXFrTmF4TFYrUnRwa0lmV3Z6cWpEQm0x?=
 =?utf-8?B?aGw0NjI5YlNMQk9FTmFna2tRNGk4a21SMkIva3EzN1dSMXQ4cmYrZ1hoVWxP?=
 =?utf-8?B?Tkt0TTEzemw2R1Z4ZWhmUmQ1VEYrNmVkYjB5MFN0ZWRQaVJacmhUQklRdkJk?=
 =?utf-8?B?WGJGTHlscS9hU2lKVHZ0ZlRkcGxFRTBzZ3FoV0gvMXdSUFZqbUxQNXJrNDJt?=
 =?utf-8?B?RVJUb3R1cmZWM3hNejV6NDkvY0t2QXk2dWFjVHJPRklWdGpNMmp5Ry9Vb0l1?=
 =?utf-8?B?VEZLTDFlakQ4M2p3L3l1L2xWdG5nY092bWROa2VVVEVHM01kTDc1RXBKMjBm?=
 =?utf-8?B?K3JuSGM3TEF2VUdOaTM4MGxMSjV6QVhlNXFTYVJ6cFVpR2lIMEZVZlh0RW0w?=
 =?utf-8?B?Tm9QZ1M0Sno3cnZYRmZBMHhXdUl5bGpWUy83enBhYVREYVNCWExrSDFYYWR5?=
 =?utf-8?B?c0xiSkhNYTRVM01YTlViSE1vS3BJZkF6QmxsVU9uVk9CaTZuQjdITUtLbDBS?=
 =?utf-8?B?WnB6aXBzQmh6NHdyWmFtQ0ZoRFo2WG5jWVBka1p4d1lWS3hqVTFnZDlOTE5i?=
 =?utf-8?B?ZjVyRkkwUzkzU2xrRXo4VEUyaFEvM3JIQ1FCKzgyQUhmRllyMGM3NTZkWmpT?=
 =?utf-8?B?NFNCUUxjbmNBMEkwZCtSOCt1N0VEU0xrc0JZbUVxWVltU00rRklOMExSdnhv?=
 =?utf-8?B?MFNBWDJOZ1NpWW04U204bzNGbkJQOFR4RGJxa3pwaUk3QXJiM2pQS1ZlVHNU?=
 =?utf-8?B?Q0I4Y1VPSEJFb2hQQUtSV0pzdkdXWUN3dFFJdW1LYXdiZFp4NjdwbDdXRDZL?=
 =?utf-8?B?UHRCUFhtRlJEQUd2amFMajFPdlROK201SFg0WUxESXZlbFY4NzI4ZW1LdHE5?=
 =?utf-8?B?U3p2TTJvOHc3QkkvMC9lcWNKYlhvb3h0VWt2OFpvQ0lSSDJTT2s5SDg4WDJ2?=
 =?utf-8?B?cWo1VFliTGJxSHhkeHBDTVpJUE5CZkZRVklIYVptWDR3Unkza3pMWU1qT0ZN?=
 =?utf-8?B?Q1pVc0UvU0E5TVUzNFhPZnZVUy9BUnM0UUFOZ0J5dmlPQS9BUEJUellCTnRQ?=
 =?utf-8?B?aURNaWdNV3hWVnAxR3I4VzV2ekNGL3NyODQwTDg4R0NpMWxvL2I0N0tEY3lq?=
 =?utf-8?Q?c6eTPOCRo9k=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB7114.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9254
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000004C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1bc283c2-a64f-4f72-fd26-08ddb3daf444
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|30052699003|35042699022|14060799003|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bFlkT2MvRFBtZG1WTjFEdDRtdlNSMzdWdnZWVUMvVVF0M2Z2TkZwY0sxZG9p?=
 =?utf-8?B?YWIrRDh2UlBKdHY4dWhsT0pSWTdxWWRFMThsaTVVUG1MTkNKR1VRaTJNWU5n?=
 =?utf-8?B?UVMzQUZmblpIaXRERUcxbDhveEw5M2YxN01iclpNaktSaU05Qkcxb3J0bGVG?=
 =?utf-8?B?NXZ3K2NBZ1J3SE5wM2JqWG5WNjlEVUNnQUhvdGwzNXI4ZGc1dk9hU3J3eW9o?=
 =?utf-8?B?UDRWRDdoSFJWSGdLYjlLdWV4ZVprdmlkUmJuWFJwNzJxcGNXeVJKNEVjVlcy?=
 =?utf-8?B?MEpYV1hSbmx2a3BaVW5Iakkxd2hWSzIrTjJnK0p6WnBzSHVrNHNmQzNKc05J?=
 =?utf-8?B?UlRYNmlIWm1uVWNib3A1enBUQ2xGT0s2UG5NdGtTWnM2SDVMR2xEZlFzUGp1?=
 =?utf-8?B?N3hlS3ZUTzdIbkVPUkN5Z3d4TjlHczdINVhiNXhWUmhnTW05RytnRnZlelJm?=
 =?utf-8?B?V2lQc0ZHemdCRTQrU0EwUTlDUTZaSUNSZ2hTZE44QkhEb2c2cnVaZXA3bXJl?=
 =?utf-8?B?eVRFVHNxU2dPdGE4WnZvN2pUNzlSMjcwa0ZUMkttMDJ6bTlkdkliWlZ6Qnhq?=
 =?utf-8?B?dnZ0UzZ6bjV3TVNhVUdCQ1VrVERUN0ZFTDNGVEt0OE5xQnhXS09wREtkbGxZ?=
 =?utf-8?B?d3oxSUNwekl5SW5zMUFSZG92aVhvM0RJVmhkeWVzZytMZy9uWjJTdDhMRVNz?=
 =?utf-8?B?UWpLQ1AwQ0dnbWh2a3BtS05FUnJsZ1JwL25ROXFwMnlPWS9ya0ZCakZzcFJ0?=
 =?utf-8?B?SGhaZ3ZKd0ttSnNCT3RZUUpkd3V5RmQ3c0dHQ3U2VFFTYzAwNEJNcldYSkw5?=
 =?utf-8?B?blhTb1V5M2hYVnYrZlp0U1RiNE81RUp6N0V0d1ZmT0tTSm5BRjJwdEp0VU1Q?=
 =?utf-8?B?ZGRiRlhEaVdSMVhkeUtBek1UeWVGVDc2UjVGSTVjM3p6OUJPOHlld04xcHcr?=
 =?utf-8?B?YU5DeWwxbjIvMU5BMFFpQTdGaFNIZk5ZRmllUlJTSGFHa2tMcGtnR0g2YmxC?=
 =?utf-8?B?S2k0eUFYeXNnWmFBbHY5dnRRY2ZaOVFTdUNmU3NLelRScUdjYThjejFxQk9V?=
 =?utf-8?B?alpNM2hrejJCRGV1d0xWSU5pdU80ckNUc3dKSjEwRUxydG43RHZuajB1bFl5?=
 =?utf-8?B?TE9PQjR4UGdGajBrNS81SzIvNnpXbG5nTVhsbFRZZG1jZHdBSThCREgrc2tw?=
 =?utf-8?B?Z01NZWQzZ3BsYkc4b1NLNjA3aTRyN2ViVXpFSndRSUpKampFQk5VU0VpcEZt?=
 =?utf-8?B?QzIzMFJXdzdCZGduNUE4aUhBcmlwaEZTZkpSL1FjdGNVUkdQSmJOMzBybEdK?=
 =?utf-8?B?VVVZTWEzSVdkSHpDaTQwRTNuZDVTRGx2clRSVWVCL04vOFkxRlBxazRwQTBh?=
 =?utf-8?B?dWhvcXd5SjZsNGN2aHpHVzhwRTlYYmx4Y1Bkd1lOa1BLeUo5aW14QlFFMGIw?=
 =?utf-8?B?SmZuajM3UlluRk5qZWZLamVnK1IxNmVkWUkxV2tKdmhMb1o3NXk4SWlRWnpZ?=
 =?utf-8?B?MEsrcStac1B2ZXBWcHhWcUdRNDZ1NjQ2b2dCb2wxeTAvYTErSWVOT3p0ZVVY?=
 =?utf-8?B?MGVVaURHek5VRVNrL2szcnFVZHlDTVoxS1hrYWVDVlMzaGhteVB5b0dRRFg5?=
 =?utf-8?B?WGE5U2Y1Nktnd3dTT3dzelUwZHg0NnJycmFvNDBwMXdhTzZ4a2xNUEFraDBR?=
 =?utf-8?B?QVJRTHVLMlJYK25LcnBJd2l6eUF3MmdKOS9Ramw4WE5RZjQ3SnNmdFEra0dV?=
 =?utf-8?B?MmE3ZUs3enJrZTViRkVjWkVJZm9yTXI1M28rOTdzb25FZnZxK3FJZ0Mzb0Jh?=
 =?utf-8?B?a3lvOGI3V2FPZ1Z6U2RJT2lvWit2VWExT3phREVGclF6Uk02ai8zVWtaUWZs?=
 =?utf-8?B?cDN2TXFCclhFTmRsaGJ6QWY2YWliNURWSmJaMFRPUk5JNGdmZWc4RUZSUTNR?=
 =?utf-8?B?UEE2N2pKRkxSNnBsODNha1pmRzZhSzZ5VXRJbWgwQ1VNM1VRNXl3Y2NuZjV1?=
 =?utf-8?B?SG5wNjFNZ1VXcWNzMTdJb09mWjg3M1IvMTYxbFlHTVZjMTRBeS9JL0Q2S1ZQ?=
 =?utf-8?Q?V64vZo?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(30052699003)(35042699022)(14060799003)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 11:25:47.9431
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5864d6a-b43f-4574-bc1b-08ddb3db089f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9736


On 25/06/25 4:46 pm, Ryan Roberts wrote:
> On 25/06/2025 12:12, Dev Jain wrote:
>> On 25/06/25 4:05 pm, Ryan Roberts wrote:
>>> On 16/06/2025 11:33, Dev Jain wrote:
>>>> arm64 disables vmalloc-huge when kernel page table dumping is enabled,
>>>> because an intermediate table may be removed, potentially causing the
>>>> ptdump code to dereference an invalid address. We want to be able to
>>>> analyze block vs page mappings for kernel mappings with ptdump, so to
>>>> enable vmalloc-huge with ptdump, synchronize between page table removal in
>>>> pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable walking. We
>>>> use mmap_read_lock and not write lock because we don't need to synchronize
>>>> between two different vm_structs; two vmalloc objects running this same
>>>> code path will point to different page tables, hence there is no race.
>>>>
>>>> For pud_free_pmd_page(), we isolate the PMD table to avoid taking the lock
>>>> 512 times again via pmd_free_pte_page().
>>>>
>>>> We implement the locking mechanism using static keys, since the chance
>>>> of a race is very small. Observe that the synchronization is needed
>>>> to avoid the following race:
>>>>
>>>> CPU1                            CPU2
>>>>                          take reference of PMD table
>>>> pud_clear()
>>>> pte_free_kernel()
>>>>                          walk freed PMD table
>>>>
>>>> and similar race between pmd_free_pte_page and ptdump_walk_pgd.
>>>>
>>>> Therefore, there are two cases: if ptdump sees the cleared PUD, then
>>>> we are safe. If not, then the patched-in read and write locks help us
>>>> avoid the race.
>>>>
>>>> To implement the mechanism, we need the static key access from mmu.c and
>>>> ptdump.c. Note that in case !CONFIG_PTDUMP_DEBUGFS, ptdump.o won't be a
>>>> target in the Makefile, therefore we cannot initialize the key there, as
>>>> is being done, for example, in the static key implementation of
>>>> hugetlb-vmemmap. Therefore, include asm/cpufeature.h, which includes
>>>> the jump_label mechanism. Declare the key there and define the key to false
>>>> in mmu.c.
>>>>
>>>> No issues were observed with mm-selftests. No issues were observed while
>>>> parallelly running test_vmalloc.sh and dumping the kernel pagetable through
>>>> sysfs in a loop.
>>>>
>>>> v2->v3:
>>>>    - Use static key mechanism
>>>>
>>>> v1->v2:
>>>>    - Take lock only when CONFIG_PTDUMP_DEBUGFS is on
>>>>    - In case of pud_free_pmd_page(), isolate the PMD table to avoid taking
>>>>      the lock 512 times again via pmd_free_pte_page()
>>>>
>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>> ---
>>>>    arch/arm64/include/asm/cpufeature.h |  1 +
>>>>    arch/arm64/mm/mmu.c                 | 51 ++++++++++++++++++++++++++---
>>>>    arch/arm64/mm/ptdump.c              |  5 +++
>>>>    3 files changed, 53 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/
>>>> cpufeature.h
>>>> index c4326f1cb917..3e386563b587 100644
>>>> --- a/arch/arm64/include/asm/cpufeature.h
>>>> +++ b/arch/arm64/include/asm/cpufeature.h
>>>> @@ -26,6 +26,7 @@
>>>>    #include <linux/kernel.h>
>>>>    #include <linux/cpumask.h>
>>>>    +DECLARE_STATIC_KEY_FALSE(ptdump_lock_key);
>>> Is this really the correct header file for this declaration? Perhaps it would be
>>> better in arch/arm64/include/asm/ptdump.h ?
>> I tried a lot of things; this didn't work. I get the following:
>>
>> ld: arch/arm64/mm/mmu.o:(__jump_table+0x8): undefined reference to
>> `ptdump_lock_key'
>> ld: arch/arm64/mm/mmu.o:(__jump_table+0x48): undefined reference to
>> `ptdump_lock_key'
>>
>> in case of !CONFIG_PTDUMP_DEBUGFS.
> I think you're talking about *defining*. I'm talking about *declaring*. By all
> means define it in mmu.c. Then you always have it. But the declaration doesn't
> need to live in cpufeature.h does it? Why can't it live in ptdump.h? The
> declaration is just a compiler directive really; it doesn't control the output
> of any symbols.

Ah I tried again and it worked. Not sure how I missed this permutation-combination
initially, I hit a lot of failures and then came up with this complex including
scheme :( thanks!

>
>>>>    /*
>>>>     * CPU feature register tracking
>>>>     *
>>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>>> index 8fcf59ba39db..e242ba428820 100644
>>>> --- a/arch/arm64/mm/mmu.c
>>>> +++ b/arch/arm64/mm/mmu.c
>>>> @@ -41,11 +41,14 @@
>>>>    #include <asm/tlbflush.h>
>>>>    #include <asm/pgalloc.h>
>>>>    #include <asm/kfence.h>
>>>> +#include <asm/cpufeature.h>
>>>>      #define NO_BLOCK_MAPPINGS    BIT(0)
>>>>    #define NO_CONT_MAPPINGS    BIT(1)
>>>>    #define NO_EXEC_MAPPINGS    BIT(2)    /* assumes FEAT_HPDS is not used */
>>>>    +DEFINE_STATIC_KEY_FALSE(ptdump_lock_key);
>>>> +
>>>>    enum pgtable_type {
>>>>        TABLE_PTE,
>>>>        TABLE_PMD,
>>>> @@ -1267,8 +1270,9 @@ int pmd_clear_huge(pmd_t *pmdp)
>>>>        return 1;
>>>>    }
>>>>    -int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>>>> +static int __pmd_free_pte_page(pmd_t *pmdp, unsigned long addr, bool lock)
>>>>    {
>>>> +    bool lock_taken = false;
>>> As David commented, no need for this.
>>>
>>>>        pte_t *table;
>>>>        pmd_t pmd;
>>>>    @@ -1279,15 +1283,29 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>>>>            return 1;
>>>>        }
>>>>    +    /* See comment in pud_free_pmd_page for static key logic */
>>>>        table = pte_offset_kernel(pmdp, addr);
>>>>        pmd_clear(pmdp);
>>>>        __flush_tlb_kernel_pgtable(addr);
>>>> +    if (static_branch_unlikely(&ptdump_lock_key) && lock) {
>>>> +        mmap_read_lock(&init_mm);
>>>> +        lock_taken = true;
>>>> +    }
>>>> +    if (unlikely(lock_taken))
>>>> +        mmap_read_unlock(&init_mm);
>>>> +
>>> As per David's comment this can just be:
>>>
>>> if (static_branch_unlikely(&ptdump_lock_key) && lock) {
>>>      mmap_read_lock(&init_mm);
>>>      mmap_read_unlock(&init_mm);
>>> }
>>>
>>>>        pte_free_kernel(NULL, table);
>>>>        return 1;
>>>>    }
>>>>    +int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>>>> +{
>>>> +    return __pmd_free_pte_page(pmdp, addr, true);
>>>> +}
>>>> +
>>>>    int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>>>>    {
>>>> +    bool lock_taken = false;
>>> Same comment.
>>>
>>>>        pmd_t *table;
>>>>        pmd_t *pmdp;
>>>>        pud_t pud;
>>>> @@ -1301,15 +1319,40 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>>>>        }
>>>>          table = pmd_offset(pudp, addr);
>>>> +    /*
>>>> +     * Isolate the PMD table; in case of race with ptdump, this helps
>>>> +     * us to avoid taking the lock in __pmd_free_pte_page().
>>>> +     *
>>>> +     * Static key logic:
>>>> +     *
>>>> +     * Case 1: If ptdump does static_branch_enable(), and after that we
>>>> +     * execute the if block, then this patches in the read lock, ptdump has
>>>> +     * the write lock patched in, therefore ptdump will never read from
>>>> +     * a potentially freed PMD table.
>>>> +     *
>>>> +     * Case 2: If the if block starts executing before ptdump's
>>>> +     * static_branch_enable(), then no locking synchronization
>>>> +     * will be done. However, pud_clear() + the dsb() in
>>>> +     * __flush_tlb_kernel_pgtable will ensure that ptdump observes an
>>>> +     * empty PUD. Thus, it will never walk over a potentially freed
>>>> +     * PMD table.
>>>> +     */
>>>> +    pud_clear(pudp);
>>>> +    __flush_tlb_kernel_pgtable(addr);
>>>> +    if (static_branch_unlikely(&ptdump_lock_key)) {
>>>> +        mmap_read_lock(&init_mm);
>>>> +        lock_taken = true;
>>>> +    }
>>>> +    if (unlikely(lock_taken))
>>>> +        mmap_read_unlock(&init_mm);
>>> Same comment.
>>>
>>>> +
>>>>        pmdp = table;
>>>>        next = addr;
>>>>        end = addr + PUD_SIZE;
>>>>        do {
>>>> -        pmd_free_pte_page(pmdp, next);
>>>> +        __pmd_free_pte_page(pmdp, next, false);
>>>>        } while (pmdp++, next += PMD_SIZE, next != end);
>>>>    -    pud_clear(pudp);
>>>> -    __flush_tlb_kernel_pgtable(addr);
>>>>        pmd_free(NULL, table);
>>>>        return 1;
>>>>    }
>>>> diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
>>>> index 421a5de806c6..f75e12a1d068 100644
>>>> --- a/arch/arm64/mm/ptdump.c
>>>> +++ b/arch/arm64/mm/ptdump.c
>>>> @@ -25,6 +25,7 @@
>>>>    #include <asm/pgtable-hwdef.h>
>>>>    #include <asm/ptdump.h>
>>>>    +#include <asm/cpufeature.h>
>>>>      #define pt_dump_seq_printf(m, fmt, args...)    \
>>>>    ({                        \
>>>> @@ -311,7 +312,9 @@ void ptdump_walk(struct seq_file *s, struct ptdump_info
>>>> *info)
>>>>            }
>>>>        };
>>>>    +    static_branch_enable(&ptdump_lock_key);
>>>>        ptdump_walk_pgd(&st.ptdump, info->mm, NULL);
>>>> +    static_branch_disable(&ptdump_lock_key);
>>>>    }
>>>>      static void __init ptdump_initialize(void)
>>>> @@ -353,7 +356,9 @@ bool ptdump_check_wx(void)
>>>>            }
>>>>        };
>>>>    +    static_branch_enable(&ptdump_lock_key);
>>>>        ptdump_walk_pgd(&st.ptdump, &init_mm, NULL);
>>>> +    static_branch_disable(&ptdump_lock_key);
>>>>          if (st.wx_pages || st.uxn_pages) {
>>>>            pr_warn("Checked W+X mappings: FAILED, %lu W+X pages found, %lu
>>>> non-UXN pages found\n",
>>> With the improvements as suggested, LGTM:
>>>
>>> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>>>
>>>
