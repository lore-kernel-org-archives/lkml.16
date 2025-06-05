Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011040.outbound.protection.outlook.com [52.101.65.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29279566A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 09:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.40
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749115274; cv=fail; b=YlTcE0ho6NjHNh3Smi6NsZLANsSyNFscyDTySXtGQ1jXXT0Ptv3hGQW2a3PUm8fv2KT6kR2W5ZYeMDIOmGPdQKlULOxWzYTZHmqNjtWhlr+xiQQR41uykToo/x25gRcGkCKmFrRwIVkgtse5WjszUQ108K/34psqdbLErobeNMc=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749115274; c=relaxed/simple;
	bh=t/ndAhL9wkeUGomWiQXdVo614OMv3D/VZSEA9Ezt6H4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Mgtyceat+fTR4PtmiEabM0YezI6ICi+U4K9jHa7GyblKGvy9+wGB6uu1fKfDQnk4qeqAva6KxlmKpONnaDcVow9DlpHyfFeIyz9fRtH5Zz4kgGwOVjWpDXyJphwxh3jYaF1s1kdb7C+CGHFMJOcVvufegA0SdjS4l5DrhHr1wKw=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fIvkAIkd; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fIvkAIkd; arc=fail smtp.client-ip=52.101.65.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fIvkAIkd";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fIvkAIkd"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=MlKUowZxtafus6Z7RCUNUeYc3QI+jAhE8Crv3motAeKXZU1PKxPNSl9OZwLBTsCRCsc+A4a5EdjlbHCXRAvWa4O/guCgLUNbH/45+Moc3hU3Pk+cakNZ43FaPR98VIGur5ff8bytjf819xz2EEtfLMsx4Hf13p4ITjfHBIZAWKhh6952nxEzAf3duj9qEpNTKjciLefqd2O9ChLI14CadJcRMDI7o8BdWTzvJV+zaCQ9/2ESBv7m+8oRAzqgCvw8ZM3rMFPKJR4yATgte5L63vCsF03jc4awcaAN3EBmDxx+8DJgXiPUO4GAnJQNl+9WwDL9XGuFpLynOj69tRScAA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/ndAhL9wkeUGomWiQXdVo614OMv3D/VZSEA9Ezt6H4=;
 b=O697dK4Xkezr/KL0+NcEgfl/e4v//f8ZlOzftC4TH7emoujNR8XeCEVlgcCM/LGCp01O0x0L5in8ZowqD3yMOjptWvjc/bgHQDgMycfewW6njYRcyvOXGos0jlpk157k0xKHkNmTHuxyIlN8PeX98GlWOld0srdnVj1S4cItvNAAxnjpD/CJ7HLSgpjLZa7cf+ynmyhHokkMgrNpKUU7vWhufazpsie27DmCxCFrx0bOcs51PnVtc//oudSOCdD3wUufI+4wEJtDtcYbutawowIeUpvu/5IEX0fEPJJKzmpU6O5JIhDklXP+bRw1b+izSWCDrwQpr0OfC+UfSGmHNA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/ndAhL9wkeUGomWiQXdVo614OMv3D/VZSEA9Ezt6H4=;
 b=fIvkAIkd/o82SGBHSUgrXdQ8fLoktXmgruZHyQX/zViv7Cx6y1FFsOLBbbe52qac8p2hXykrGIvy2lb59ddN6/hIxcfy6ficJi9Gi9fUf8maX/kac0MWc4OTEEcThKAdTj86k+NUtwX3ePguhgPTNe/IW738OmUjpd0E4E7E8NI=
Received: from AU2P273CA0111.AREP273.PROD.OUTLOOK.COM (2603:1086:200:6e::6) by
 PAVPR08MB8847.eurprd08.prod.outlook.com (2603:10a6:102:2fd::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8813.21; Thu, 5 Jun 2025 09:20:51 +0000
Received: from DB1PEPF00039232.eurprd03.prod.outlook.com
 (2603:1086:200:6e:cafe::6) by AU2P273CA0111.outlook.office365.com
 (2603:1086:200:6e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Thu,
 5 Jun 2025 09:20:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00039232.mail.protection.outlook.com (10.167.8.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Thu, 5 Jun 2025 09:20:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSBIaNSaoClCQ0Hdl2TmZGynfK5OKi+DJT6oAcwFJylmfNnzgy4qfAZJj09ekLFPdV6A3iYmwbKup445HOtfV9FXyDq2QX7w703xi89v0uTo2XF7EUGC9RhCeLeVdkeAK87VTkxEg1lI54SLaZJNS7yGTCBIz7jPr516BvbVVXYCMTvaSi3/okT3cD77ntpxXNFNbl0qBscGYrs8TbA/O0xyFGfeX1qSQG1CzEhJCFB2xGU1EB9VMa/8AWZHtC/TIgFInFMRz1a8VKHXoA8mAAbHZTGzwXZQ19AXB6BNBbcYHFE1RG3Nhfx6euM/iZzV2vBgyhik5TBhJ40Y0/wsmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/ndAhL9wkeUGomWiQXdVo614OMv3D/VZSEA9Ezt6H4=;
 b=DFLgFA+xeCO7b2HGsNN2MKyGxENURNm8bCOwby6SlfuuPtgtBJZP4MmdFL+WVAnKzbJD6z5ETe16qyvlQbY2SfmKH3EBWUINUKU+Ozg/IpsZz63+09DPNBN9thB7RJMWJnXJs7PQCSKJvmsG02rY+ePJ0ZyplUR+i4keWFWvYDAWULM6PKtvYLrL6+6PTMZD+qW8p8GbSWqCvIP0yz1IkIbx3wtQPY1EAE1TjAQo01rNHF9ogWp+VLgUO60DVX7IR3NZkWUTHex7TzI6aCvnEb4Er9nTZsEbGAnnd8KAqYtXB+7Tp/EEkvyzHQ6e+a82uWuTH/QbvM6E28gZSdPv4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/ndAhL9wkeUGomWiQXdVo614OMv3D/VZSEA9Ezt6H4=;
 b=fIvkAIkd/o82SGBHSUgrXdQ8fLoktXmgruZHyQX/zViv7Cx6y1FFsOLBbbe52qac8p2hXykrGIvy2lb59ddN6/hIxcfy6ficJi9Gi9fUf8maX/kac0MWc4OTEEcThKAdTj86k+NUtwX3ePguhgPTNe/IW738OmUjpd0E4E7E8NI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DB9PR08MB6540.eurprd08.prod.outlook.com (2603:10a6:10:260::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Thu, 5 Jun
 2025 09:20:09 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 09:20:09 +0000
Message-ID: <ad23ddf4-062a-4eed-8692-3e6fe057a7f9@arm.com>
Date: Thu, 5 Jun 2025 14:50:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm: madvise: use walk_page_range_vma() instead of
 walk_page_range()
To: Barry Song <21cnbao@gmail.com>, linux-mm@kvack.org
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 Barry Song <v-songbaohua@oppo.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>, Oscar Salvador <osalvador@suse.de>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Suren Baghdasaryan <surenb@google.com>, Lokesh Gidra
 <lokeshgidra@google.com>, Tangquan Zheng <zhengtangquan@oppo.com>
References: <20250605083144.43046-1-21cnbao@gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250605083144.43046-1-21cnbao@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::18) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DB9PR08MB6540:EE_|DB1PEPF00039232:EE_|PAVPR08MB8847:EE_
X-MS-Office365-Filtering-Correlation-Id: 97b4621c-1513-4635-9cbf-08dda4124137
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?RkdUcnRndTRzdG1VZGlKRGhBaWJRaUFjUkxQdS9oZjBpQVNZd3BoVmNYN0FK?=
 =?utf-8?B?TmtoRGtEeVFBMmJVOC93MTZiRUtxdC8vcWo5QmlzVXFVeVRYSG16OU5GaTd2?=
 =?utf-8?B?MVlwbkVNd0VlZ0FuREZNd1BnUDgxOGdkMjUxL2tPdmE2NC9KR3VKUzZIaXhZ?=
 =?utf-8?B?OEJkOXFCUThoUis5Q2F4d0twKzMrQWhmaFBvTTJnaVZ4TXdCZGI5ci9QS2FQ?=
 =?utf-8?B?RnFabmVoYjVyc1YxNUEveDdkcTlnMFh3TFdMUW9Vc3dwQ1VqTzZWZXdDMmNu?=
 =?utf-8?B?WlgwNkNmU0lGNEFOK1M1STB1bzgzUXZGbG01NHpnODRLWmZHTzJxQWdXVFZG?=
 =?utf-8?B?OWhPaXFOZmF4TU5NZ2U4S3dUMkNxYXhSMEluSzhvRGV5czNLQ3VwTmZLUlNL?=
 =?utf-8?B?aU9NYU1rcWFLUnN2azJmOTk2dmpTUGxsMGtMRU9OTWpFUmpXTktqV3g0eHRq?=
 =?utf-8?B?clh2T2xBUkx0d28rWXFhZ3dRRlRyendvbUlaN0FkSGNUejRBaXY3U2ZTYXA2?=
 =?utf-8?B?Q0VZT1BETTdVQ0RlWW01a21mblc4R2ZJWlVobFpnU2RSTi9tYW9TcGRIVmc2?=
 =?utf-8?B?OTdCekJnM3NuYTE2Qlc4cExYZE1uUkI2QVhEMmQvWDhnWXQvaFpMVi8xTWZT?=
 =?utf-8?B?MmNyUXlDeStROVFLZFpTQ3o2NTZkZ3lldWRDR1drU2JicldZblhxY0tkaUM3?=
 =?utf-8?B?VzdRWDY0RmlYb2RPM2dZYzRadGZpZ1QrcHU2QUJEVTd2b2tBQlI0bXB6RWN4?=
 =?utf-8?B?NU5pbEF0UFpMYW1sOVNCL2pUYkIzSWVpcG9kT3dSWTdScytENDJURGRHTStB?=
 =?utf-8?B?VmpaQW5RaFhra2k3RW5rS04wQlZ4VEJKUFQ0eVJPYzFkY0p5TTZFcmkrVDNV?=
 =?utf-8?B?bm9kQUdMS0ZpeEJwakRhMWx0RlJuSWVyeWdaUzFmRU9UbFhPOFU5OXJ2L09K?=
 =?utf-8?B?a25vV3pLanJSaEpUTE1qMWNBR3lPTy9mK2IvVUtZcTc5cks2WnNteXhOeXpT?=
 =?utf-8?B?M3VLUm9DNzdQMGxGYXZYbGcwSnRWbk4wZjlYS3pOYU91VGk5aDcyMTJqQkxX?=
 =?utf-8?B?VU51YUFGWmt3cjVYcFFRbmtrWGRVUXJYUEJ6eFZKcmswM1AvNUZSaEtFMnRJ?=
 =?utf-8?B?MWd5STEzWklGVGZPSHA2MVpUVjRCSng5MnI2TldpM2RFMTBLbURnY2pDemk5?=
 =?utf-8?B?ZHloRmpQaVVFdS84NXFlMFZmVUdqa1NOYlE4NHB5eHByeUFRS3UwRWlRYnJv?=
 =?utf-8?B?Qnd1RUdEUXcrQ0FQcUxwUU4yNGVSc0NMNFBIVGdpcGpoK0dJZ05jTVo4aDND?=
 =?utf-8?B?TGhZTjEzWXQzKzlsckVKMVNJUTVMa1VBVitUTWRhRXd1Zm9yalBzVUVwRFdC?=
 =?utf-8?B?SWUzT2hMRStsbjZIckdISzEwTlJUaitwbm1lQlN3MmxxUGc1dGQwLzFPSVJH?=
 =?utf-8?B?bHdFVUxSRENUU0NCZTZaOWVTQzl2dzhFckpSTFkwTnppdENUZlBDSUdWT2pz?=
 =?utf-8?B?OElab3pXTXlSYnNjUTd3ZEtxaUFGOVpXR0VRZGJYUk1Wd2RUNEJodkJNSEdW?=
 =?utf-8?B?Z1pvWU9zSFgwRjE1YmFMV2ZjVUNFRjRhOUVtd3RINGhwdkFNYWd0ZXhxSEpq?=
 =?utf-8?B?THMwKzFvTmJCeTN5NmZJKzl6aXpsUkxCaUNDczQvdlJ1UGpOVmhaK1ZDTFJK?=
 =?utf-8?B?N3F4SCtxalJMTFVJNDhDZnp0OHZ5MU1MaHhtSDhCZmNtTHc5UlJiWGc0aHpT?=
 =?utf-8?B?b1F6aitXMzg5Q2J1c3pFQnFVUHhZVUhvdXlZMzJIUmJBVjVjTGpGUXpsNDBZ?=
 =?utf-8?B?TFdDbEtWckRtbUJJRFNxOEgvQnRybEttWGJveFFkWWxCaGhndFB5WHdqbEls?=
 =?utf-8?B?cXUwejF6UjhNcmlvWUp5WkRaOVBWWmtEYkNFTDRlNHJaUk1DWEtYN2Q2VEJF?=
 =?utf-8?Q?TY7KZtTbnV4=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6540
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00039232.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	da69a59b-6441-4c7f-44df-08dda4122abe
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|35042699022|36860700013|14060799003|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SnNldWNSMzZ5dGpOV09Na2c5cjZZci9Ed0FZK0dNQThkcG1xYlBtR2xIN09E?=
 =?utf-8?B?L0tPSDNnOUhJbHduNVd1UWlQVEJVQ3BWd2JKN3ZEUFY0dTQxd2Y3bGprbWJ1?=
 =?utf-8?B?YnRzQ0RBNG1NNDNCRFJVbUowZ3E5aW1ZRGdLckZGb1AyNjNvc1piN3JjYzlk?=
 =?utf-8?B?VVRLaTRNL09pWEZOTEI0V3dwU2E1ZmJJWHpUd1ZhM0RqaXE3VmJtUVZadFhj?=
 =?utf-8?B?KzNMcFN1Q0VKNlJqUTU4d1BrWlpCenBPUEZuZGlhMkxtU011SXNaM2xUM2Vk?=
 =?utf-8?B?WkJIMjkwN0hIaEhFajVSTEZLMmgya2VrUnBJOTJnVmRidm5aRE5vN3hOUklW?=
 =?utf-8?B?SEtVWlgvVkwxYW5KY2U3VThNSXFoRyt6NDQrSndCMXFMS2czbTF5MFNHUXlw?=
 =?utf-8?B?U05NSjlwanZWUy96bHlZT3RkSUNOWGhJSnVRdlBFSHBveUxRUGk0OWVWUS9i?=
 =?utf-8?B?RUNCMHAyNExUNFExdS95T1l1SUpjSmRpaHE2cmlXd0N2VHRuTm5rY2R4M2hC?=
 =?utf-8?B?SzFONjJkNDhKVnY4a0d0NnZ6Q2k2YmNsTndjTWp5ZDRVZmJEU0FacUsxQTJM?=
 =?utf-8?B?ZTh4Vk5NTDRCS1VEcVYwOTI3ZzU4WTB3ZnQzVnRTSENZOE9Ua0pJbGFuOElS?=
 =?utf-8?B?MXhvZjRwWjc4dTdMT2hOb0tsak9OV3hYQlZIam5CM2pZTmJyUkxORGo3SXo5?=
 =?utf-8?B?OVJLMnFoVmpTNzczaDg0UFhqVzJ4blNhZFVtMUxBUS9VQklMKzlEUVF6b3BO?=
 =?utf-8?B?MTdsNE0razRTaDlQMGhpeVdCbUYyS2xQUHc1c1BZb054eEVEV0hEKzhDbllv?=
 =?utf-8?B?cXFaS3ZkMTdTeS9YY0VuQjhiaS9oZTNlTmVzVS9zbnVva3d2TDJJVHFVYm0x?=
 =?utf-8?B?cDFicC9BamJienA5UktjQVZXZTlFVUJUQmptMmJ1UHM1TytSYUJWbk45TDN1?=
 =?utf-8?B?VkttbUMrbng2TmRhQVdPMmFMS2d6T295MHVEMCtvUlU5eWlTVEQwbTV0MlBv?=
 =?utf-8?B?Vkc0Y2R0M3VxWlFBdW9uNVg5TEkxQ3cwQzlIV00vczFtVm43eXY3Nk16dlRO?=
 =?utf-8?B?RmlrUUFrRytUd20rM0hJYTQ5UGFOYXE4SnlCSVdCM2xlbnpGeW15MjR0Tjkw?=
 =?utf-8?B?L2g4QU9mL212ekJZMHRsWnRNRUU2a25NMUZIU1VGTStTWEFERjBQRjhMTkox?=
 =?utf-8?B?QU01SnVFeXB1YTgwRjVNWFdjYWVHSEk0QjhvR3RYWTl0L2pNd01yZm5aM2lF?=
 =?utf-8?B?aVNoU1BlTW40eldySHI3K0VXdFJCbm9sQjhLZVRpM0JUdkdsV2VWUGdKbnpx?=
 =?utf-8?B?MmtpSDI2T3UybmswQ3dnQWh1ZlNCeDJNbXlJVTV2ak1yK0ZJNURnWnlGZFhU?=
 =?utf-8?B?cjB4b0JsODVUVGtGb09rWmlGZUlCK0NPQ0JoQ1A4RHMxSmJDOXo0d09sOVNF?=
 =?utf-8?B?bFYrN0hYMm9FNFRzNi9qaHdGUitVTC9yVHN3SVB6SFlLK1NBTkloZHdVRC85?=
 =?utf-8?B?Y3Y4dHJJOGZjMERJWnhudmJWeWFvRkRXblBWY0RUYUMvNCtUT21lOXZjcFg5?=
 =?utf-8?B?aTRIUmRKNEdmL2N0bEFxem9GSUNnRVpSWEIydExBdzZvWTlNK1h0bEVRak1T?=
 =?utf-8?B?TUhBMkliYTFhNjdvREc2SmR4VXR1QUZISzI3Y3dYdWhkdW5pMjI5NFVIQ3Na?=
 =?utf-8?B?MDZ0VlJUSEhBdFZZZzRxb29kMnZtUlZNOHVMZ1Qvb28yeHBHUldSUjF3R0Jj?=
 =?utf-8?B?RkhLNS9kT0pOcitmVWdoMHRidG9OWENFOTVycTZrd3VjL2lmZTJjM0xubU8r?=
 =?utf-8?B?UUdoRFhlcVNXMnY2b01MdThhZVd2NC9ZN2cveCtnTXdDcy9na2l3NFVvR3F5?=
 =?utf-8?B?clpaQzlEZlJOc2dEU1R5SXl0ZFlIcm9mUjd3LzVzRis0Z0ZoM20xMFp0VU1x?=
 =?utf-8?B?am9NTUNrcHRkOE1YbUsveGJ6SzdoeDdyd3hsMmZYRzZXbmVKWEFVZkk0VCsz?=
 =?utf-8?B?VEVaVXRiYkZWaENWQ1gra3d1REh6Z1VuVWJ2Q2NvdVd1bS81dytSOXlPeW13?=
 =?utf-8?Q?XH5hfZ?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(35042699022)(36860700013)(14060799003)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 09:20:46.5982
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97b4621c-1513-4635-9cbf-08dda4124137
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039232.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8847


On 05/06/25 2:01 pm, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
>
> We've already found the VMA within madvise_walk_vmas() before calling
> specific madvise behavior functions like madvise_free_single_vma().
> So calling walk_page_range() and doing find_vma() again seems
> unnecessary. It also prevents potential optimizations in those madvise
> callbacks, particularly the use of dedicated per-VMA locking.
>
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Oscar Salvador <osalvador@suse.de>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Jann Horn <jannh@google.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Lokesh Gidra <lokeshgidra@google.com>
> Cc: Dev Jain <dev.jain@arm.com>
> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> ---


Reviewed-by: Dev Jain <dev.jain@arm.com>

