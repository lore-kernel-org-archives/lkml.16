Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013033.outbound.protection.outlook.com [40.107.162.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847E029551A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.33
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749559252; cv=fail; b=fx0UKvgHK2+Hnyxvib/mpRg4StCZ2YAeChUdyTVcQ69VcKutmCj16TZwlENJ+O68E7dwhrIz9LWMrnY+fH8X6U3ee0hxsGWtHlNWvtDecLE0Ki0DmMiBNezxDyyExHZRjvdBj/Vr2hkG5QH78fRMRa7sgIb+2JBAZOlk+7Jew9Q=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749559252; c=relaxed/simple;
	bh=OeNzbNzlWIn/VXGeMpOYDsblWdEScTJvI2xixZu3QDM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cbq9ugWzooYN29lkcqc9+geKtUu79CCE95XWbjP+he9Axf86aPfsYU2JpdTbmubdaNzA+j05k1PFlWcawFqQoTdHQMiTlfwpZ5YKsH9fptqFrAxUCr5Euc0SArVUf/PjBT3fMGHp0QmXMmHFqeAAZcqjqPk2c2rG5cDhxHZXh6U=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=rwEoA8fD; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=rwEoA8fD; arc=fail smtp.client-ip=40.107.162.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="rwEoA8fD";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="rwEoA8fD"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=hphoRCnNlBCau3yUlwkTkG+hVhDVofWtrefopTpBWBjlUmFbWD8/mk201zm3S9FG4KJxTpEfcpNGzt23ol9i4OEeStF6FXOR1okPhoVoT2JjZD5NWSX6db4P1zUV5hzuLPJrTlDxZUhwaLQ2ssfq2Git0ueF1yY8U2g0DOzGhmy/IxYvFpU4Y67yeq/ySurChGwl7rqcwtULhytDl9Y+ZSBJitBPcEk6XZ7MakQ4RMKlYwsgobc+aZQ9gb/zDo4M524PGKyPlOcBvi8ZMb3XoUI4/6qat8fLDA/XQimxb/elkNXvYPo2M3Ao51U91cU9dhuaGeS/jF10kr04Fs6jaQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=90TTL+pVjP8nAW3AZKg+EpcDV2rIWFDRMIsILNdkxhE=;
 b=Ba4xolUlkCZWlpBfGZeMbPZK3qf6b2i6+xFUEnK9Mucx7UWrpZmBE52Bt4CN9vx/Om7bPQiDKlRWQtQoTMiQn19oIx5ZsXui48QvaKLUEr+DWnIslOJ/3r//ie+LOPiK1wjSEHRP2ep5maSa8BP6k5Uc5aGj0Zp9PIqONwynBM+I1lb5l1744JWNQS6lwqpYUW6T3VsdX/o4QvWHlRG7LY4g55uYa0X4ayFPKNTSUDZ0F9Ry7xWo7tPqp0Flyd1q3CGLQbdvOCvD5bfZFIerxZC/WaculHkYV+YM9U9j5+TZxRHKDTPcjUjoIySG8bc9+qtCGqbfJdRozOAIJLu5Og==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90TTL+pVjP8nAW3AZKg+EpcDV2rIWFDRMIsILNdkxhE=;
 b=rwEoA8fD3sICQmJOpXWj1mBOx2jjqz45heJ7WN56y10i33nAn57US4L6xeoEH5NuERs0ZF8OJxV8vLzV5jss2cpf1gMtlOmMdMoAmfcN2qOvnms35GEoFTfddN9w+zvBo3ETcIIwsf18ydPhIl0kizUW03TRkvuLNbCRvuvAU5c=
Received: from DUZPR01CA0160.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::20) by AS8PR08MB7909.eurprd08.prod.outlook.com
 (2603:10a6:20b:52a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Tue, 10 Jun
 2025 12:40:43 +0000
Received: from DB1PEPF000509FC.eurprd03.prod.outlook.com
 (2603:10a6:10:4bd:cafe::e0) by DUZPR01CA0160.outlook.office365.com
 (2603:10a6:10:4bd::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Tue,
 10 Jun 2025 12:40:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FC.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Tue, 10 Jun 2025 12:40:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lbdj2XzKCW5acOrOCtbvsho8cQDrS3xe+X3io0qYDZTRkclXVLNdJYFJVwkyswwIVVwnKa75xIWN2B8jypxvzT/xHG6GmRUT6tcuJ1e3mLN+itAcF2ww9hLx09n9pGPrqn3T24JhWQLIuojXyMinyOWrh/LVJPQvZwN5KGX08I3OlJ/P9V3PlRdQsjsrNNq+ULM41/JHZvw5fWcUTXZHklfO7t4Ixxob0GrHA1Z+m/X5jkY7ITJmf29acnTnUiEVZJZSUBoi1+IuyxF9pxhAs75tPy9tIJ9lN5np4lP7kC4WUZXlddyaHSXY3eS6vdWcX6WrFsScHa9F94StvjZPaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=90TTL+pVjP8nAW3AZKg+EpcDV2rIWFDRMIsILNdkxhE=;
 b=A9qVUFwCAf1Ruloxu8aXyVT5hFJqXe7UwR2vi3cui9QG5N1x7At9KIuawiiqsRTCv1PLHSfCk7fzVUGvJI8kk09rvYPIYPbgE3wCyruAmS+VwaxAIvWAEz75KZkCdNbfKjzkmxG0M0AA5kEtRY6wciWImUyIqUVNvmT6uuGl/1IaxXYPqymPeIxEyTaHWKOCS3ROMa5xVZivySybc4KVD/f+fckfZBxwuJBty3BNZECyhO4v27cnUc+JY9ZX76ioUgr84DmJZGjm7kbZmvlwxAw10m/Iwiv3hE/suWfcBB1g4rL7l89UZU+rusIW/d5wbdgBh42w3+SWno7m+dIfQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90TTL+pVjP8nAW3AZKg+EpcDV2rIWFDRMIsILNdkxhE=;
 b=rwEoA8fD3sICQmJOpXWj1mBOx2jjqz45heJ7WN56y10i33nAn57US4L6xeoEH5NuERs0ZF8OJxV8vLzV5jss2cpf1gMtlOmMdMoAmfcN2qOvnms35GEoFTfddN9w+zvBo3ETcIIwsf18ydPhIl0kizUW03TRkvuLNbCRvuvAU5c=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by PAWPR08MB8958.eurprd08.prod.outlook.com (2603:10a6:102:33e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Tue, 10 Jun
 2025 12:40:09 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 12:40:09 +0000
Message-ID: <1e89f07c-7620-4f9b-b647-c585824ce015@arm.com>
Date: Tue, 10 Jun 2025 18:10:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mm: Allow lockless kernel pagetable walking
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, david@redhat.com, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 yang@os.amperecomputing.com, ryan.roberts@arm.com, anshuman.khandual@arm.com
References: <20250610114401.7097-1-dev.jain@arm.com>
 <20250610114401.7097-2-dev.jain@arm.com>
 <db04bd02-0090-4aff-bb2e-0d1e023757a5@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <db04bd02-0090-4aff-bb2e-0d1e023757a5@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
	AM9PR08MB7120:EE_|PAWPR08MB8958:EE_|DB1PEPF000509FC:EE_|AS8PR08MB7909:EE_
X-MS-Office365-Filtering-Correlation-Id: 72f5173c-4779-4ad2-b318-08dda81c0388
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?RFdPem9RanJRMFZKbDlNcWJveHUxdERuamJLL2w2L1BxcUd0NzBYbjhsdUNW?=
 =?utf-8?B?bnowbDF2UUVPZEhocVJxZENNODMrRC9sLzZDaTQrV2p5LytOQzNDNXovc1Zh?=
 =?utf-8?B?aXE2TXMrWWR0QzNscmlLazRNenk1dGhDV0NUSkV2ZmhrcmxJQm15M28yY3Nh?=
 =?utf-8?B?cmVheE9tSVJCU0VSL2FrVTBtTExoQkJ0YTBJTUVLRDdJWGpOcElNVWpXQ1g2?=
 =?utf-8?B?SEhxRzF0WHZ0dWZNeEZIWGM4NWpKOHdVSVQwRGxnNVh3S0RwUXhnMXdqc091?=
 =?utf-8?B?VlQ2MjBzRkhGdVBFTVAyY3dIcGdjVXNNQTNONG1LZnZ3Y0k2WXc4NkJvaEhW?=
 =?utf-8?B?SEdhR3JRK2FFTlpBbTZ0U2FKbHp5TUVLOWN1SlhaZHR5dUl1eUhCVVc2R05U?=
 =?utf-8?B?ZFZYSUtZaG9BTkNFbzZlZWxFYitpOEQzU1ZvMGVvSFhNWVJ1NXF2blUxNXA4?=
 =?utf-8?B?M3hKR0JiSEhxN25DMndzU1o0N0phU3FFSFc0Sjc1M0Npczlwejhta092NThZ?=
 =?utf-8?B?Z0JyQnJaSG5teVRRTHlZVy95NTkzMWgwRStQMGJYMW94c0FSWVlzMGgyaWVy?=
 =?utf-8?B?c2kyQmp2ZWlGOXJLZTZCQ21MN3M5eWMyMElUdEt1TjQ2M1JnaHpiUE1DUHNq?=
 =?utf-8?B?eG5TVlFWRytuY1ZrTERWUUtrbFdnTzJXNUpCaXRHM3pIOFJFMEpkTElsbW11?=
 =?utf-8?B?S1VlZ1VSR3RVMFpvTnNvWGhtYyswN1RLZ1RaL2lndmxlUDZDM1NVbnd5WW9X?=
 =?utf-8?B?QkY1K3E5K21TZExSeFdycVN6N01YTDVIcGJjZ1p4cGRYTUZ2amd3UXBRU3Zn?=
 =?utf-8?B?VVlpMFljVk1LRURueDNMaVFUbTZ0K3pPeEJqcFZCKyt0VVNoSTNaL3dlbk0r?=
 =?utf-8?B?ZGFrM2x5U1hTQVB6L2F6ZXZkZzJMRElaamNvWkpZelR5M3R0UU9xdWhCOHlp?=
 =?utf-8?B?QWhnRjNmM2wwRlFyS01GT0huQTBjUXoyWDhBTVFjalhSa3B5SE9VdmFwMHpW?=
 =?utf-8?B?eEUzUEdyci93QklpdWdhMVRlQXpxRUZlQWdDVGpYN2NmdzdBVmQ0S2NjakJy?=
 =?utf-8?B?c3hRMnVmRVhsSWhNMGR5ZG5FaHpocXVnbnpYcDdFSko0SklFK1dHSFFnZ3Q3?=
 =?utf-8?B?NGo0UGllQ2JWY2JaS3RjZXU3LzNLV0RTWUV1R094VlR1UXZuS0s1dlR6MHUv?=
 =?utf-8?B?dTArdExqd2RpRnNudWVoUTJsWjgvK0Z2bFhKb2dWaEw5QjF6NXFNaW9vTmtY?=
 =?utf-8?B?TDROaG9ZdWh0TzN4VnZQYXJpSm93bnBCU2lVNmcrVHVvS1FLME5LOXRpOXVN?=
 =?utf-8?B?c3c3dndOSHZLZjJBY3dYSjNEMUFkWk04dEVlNk1yUnZlbzY0UnBqQXhoNVQ1?=
 =?utf-8?B?MzhsZUVOQjIwbmJnSUtrRnZNRUo4b1p0Z1ZLdVo3Z2hxakNBUVJwTC9jdnZj?=
 =?utf-8?B?RWc1b3g2UVNIMG0zbjZhbVZiUllqd2N3S1hCcWMyczluZGFxNkFNaFdUT3NW?=
 =?utf-8?B?L2p3UXRnTTFtbnJnc3RQOWp3RzJ2d2ozdU16bC9FUk5rWEx3QmQxWTRrbGpL?=
 =?utf-8?B?SWVmcFRtL2pSZ3VHYnh5cVJqMitYT3lOdG8xNW5QVzdTZmJ3U293THV4dVJz?=
 =?utf-8?B?TTZnanpSN0hHblNwUlNYSmZDM3Y0VnNxTjhNaXQvR21aWXcrblZFeFpoMVZ2?=
 =?utf-8?B?MmxCOWpodlhUdUQ5L1lOUVBVM09lOERtSU9NOU9Eb0JHMmFqNVowaUh0UGJM?=
 =?utf-8?B?R2FXeHVSV0JLa2xQNWpQTDZhWkIwYUZnVDFHcjJYS2c0WDlrK3hZR05nNWov?=
 =?utf-8?B?Y2Z0WWdkbGJWL2Z5Q1h4V0NsYjJXUmxmS2ZHbFYvYW5UaE0wOThLSGxSRkhk?=
 =?utf-8?B?ckQzbHJsY1JWa3JnbUpVTUdvbUJHaktnYkx2OGdJeFdTODByQjFvSHpEcnUy?=
 =?utf-8?Q?BoVgFOiblBk=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8958
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	58eae1a8-1200-42a3-05ea-08dda81befb3
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|36860700013|376014|7416014|1800799024|35042699022|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SkcrMFF6ZjJEWHg2c1ZDQzFlY0xFSllvaXowNkhmTXBCUEpMcUlvRnZrVHNq?=
 =?utf-8?B?c3UrRThSSlVmaGl6UW9HM3pGM1ZHVUdVMmRBUXVVNnN3YlR2WFgyREpSWWxt?=
 =?utf-8?B?SXQzTm1ORFdQb2ZYR1dFem9McExYc0RDUWdFSmhOcHdDRXdCbmQrNk9SbDZX?=
 =?utf-8?B?VDlvT1ZmYnZiM3QyTm14WmxDY0NudFBjQkg0OElMSE1Td3loT1lRcWhMWGNB?=
 =?utf-8?B?azJ3dEZReFRzTVY3VnJlQ3pQcTcvUkFyaWo4dUdqT2tNeGF6WW8xU1RSMU5B?=
 =?utf-8?B?aDZvL1hocmVZMUZHZ25SNEl6UmZ5eVJ6ajNiUS81eDdsNWVldEpRUmV0MHR1?=
 =?utf-8?B?czN6T3M5a2ZEa2VaNStDYjcyUHo5NTNwNzVDTnNPOGk3VW5TZHV5ekpRcllK?=
 =?utf-8?B?Zk4yTzh1UTF5dFUxdHgvRWJqeHJ3MWQ3YTVJUkV2UHMxc0NSYVBjRU9CaDNQ?=
 =?utf-8?B?WjJiNWlHOWU5ZHFTVjZlTkQ4TUcyVkE0OGtIUytnQ2pHYWZZY0Z4NGpoUnhi?=
 =?utf-8?B?Q2RsTlpMeVN6b09kRTdvaGZ4N3dUVGxCTnh5K3ozVzJpN0JDbVNxNFA5ZTJS?=
 =?utf-8?B?bGI0eFh6NnU2UW5DOXc0VHFXR082KzI0UlpsZldiOU9KNmlubjI2ZHlCcW40?=
 =?utf-8?B?YmJnK1hBeUdQY2t4b1MxNDFuc1g5NGNldHNjT3BoV3NFeFdIVVA5U05jRTRo?=
 =?utf-8?B?dEk4c3BqU1IycDZ2V3c3ck9uRHcvQlczMWN6WkJQQVVEc3N6ZEFoNFBWcUs1?=
 =?utf-8?B?RlRaN0kxaXNrWWh5ZXBWcDFnZForYmlVWks0aVg3WmxPZCtNOFE0T1BxaVY0?=
 =?utf-8?B?R3BBMDhVNy80Y3hNNXNuYWUyR3FSbEM5SHJzbXBzOEVFVGtUQjFtWkNyRjRz?=
 =?utf-8?B?bnZxUXRqaDE0ZlZ5V1lrTjdDQ1NiR3p3MkYvaGtLRDhNcUNnM0FRbjFzdEZN?=
 =?utf-8?B?N1g4bTZGV253MDRKWG93T1ZlbXMwV1JrdmpGb3RwcEVXRU10S0hYRkk1NkJN?=
 =?utf-8?B?V3liOWpuRGVuOHVVc3hxZGtRY2NhZGxZbkpOSHlOUDhFMWVkc3RFZlBvRS9Z?=
 =?utf-8?B?Zm1UUERQWHNaZjNVdGpQYW1wMUdaaXI2aGZZK2FZOGJ1SkdoUGZwM21kbXRI?=
 =?utf-8?B?bkFQaStHb213L0pqUmtSTE4zdEl0b3ZIdkl1bHRBOWl0VDY5TGtrMFVtNlNn?=
 =?utf-8?B?R3d2aW5TbFNQNEVkVTJkak5WV3ozMjIzQlFJSHpFYzZUL3VMYXYxYmlJRkFP?=
 =?utf-8?B?dExPSGo0K2dlMWd2RGpoeUVaTmJISklkS0hqSEtWMDJheS9nV0p4bXJRKzJa?=
 =?utf-8?B?WWdMbFhBNUNFRDlyc0xxdnYvS1gra0oxRldVZGp2ZTJ5N0ZBVnFDOFNmQ1JV?=
 =?utf-8?B?dGZweDVGMHlHaDBPZGZ3WWMvMkVKcC9VZWdRLzdhRUlmclJUMEI5ZEFQWlZB?=
 =?utf-8?B?b3kvQUg5dTJnMGs0TXZvbjNGMnVSOEdqZ3RmbkFrbk5NVUVhREI5Nk5ZaEh1?=
 =?utf-8?B?SlRpQ2Y0NmgxVkNHQnBFQmRMNlo1cDZ2RlhkRjZWSWdVeDM4ODZOWlQ1SWZp?=
 =?utf-8?B?ZzdvM2dpVm50a3hwODI5NzQzTGVuTmoxMS9BNUlVYWVPZUtzb3ZxR2pWMXpO?=
 =?utf-8?B?QTNVNU1OQmx3S0ZGMFRFelY4Y1g1ajJHdnF1cnB5R3lwTUl3aGxWV0RsRXpp?=
 =?utf-8?B?SitKanovUVVKQThmWHJBWitJYUErREVxRkZ1OU5CUzkzZDYzTUxWeGpFb3Bh?=
 =?utf-8?B?TmwwakR0Q0JWQVBQUE9Sa0YxNVhZalhTZ29pa3Fqdy90WEJOT0NWS2ExY295?=
 =?utf-8?B?UDY2RitmQkI0M21ONkpHWVQvMEh2cDZQMmNlQytMd3IvcmM5anlad3hMeTlJ?=
 =?utf-8?B?bnpVdmszTnV0UXV3Q1VYdlg2Y3F4SWdOVk5UamVDQTQram4rTUowSzBLbGtx?=
 =?utf-8?B?YVYzSzdPM1lkdkovd0FmVUg3RDYycDVYSHBaRk1uc0dlK0FxdEtueDk3cnF3?=
 =?utf-8?B?VmR5WENRKy9EK081NDNUNG5Zay9lVEJGRjBidXdZK1psVjhvUUltNFR3VVIr?=
 =?utf-8?B?R3VJK3JxVC92cTc2ckFSNldxMG1TdWZpdVNhZz09?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(36860700013)(376014)(7416014)(1800799024)(35042699022)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 12:40:42.7225
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72f5173c-4779-4ad2-b318-08dda81c0388
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7909


On 10/06/25 5:37 pm, Lorenzo Stoakes wrote:
> OK so I think the best solution here is to just update check_ops_valid(), which
> was kind of sucky anyway (we check everywhere but walk_page_range_mm() to
> enforce the install pte thing).
>
> Let's do something like:
>
> #define OPS_MAY_INSTALL_PTE	(1<<0)
> #define OPS_MAY_AVOID_LOCK	(1<<1)
>
> and update check_ops_valid() to take a flags or maybe 'capabilities' field.
>
> Then check based on this e.g.:
>
> if (ops->install_pte && !(capabilities & OPS_MAY_INSTALL_PTE))
> 	return false;
>
> if (ops->walk_lock == PGWALK_NOLOCK && !(capabilities & OPS_MAY_AVOID_LOCK))
> 	return false;
>
> return true;
>
> Then update callers, most of whom can have '0' passed for this field, with
> walk_page_range_mm() setting OPS_MAY_INSTALL_PTE and
> walk_kernel_page_table_range() setting OPS_MAY_AVOID_LOCK.
>
> That way we check it all in one place, it's consistent, we no long 'implicitly'
> don't check it for walk_page_range_mm() and all is neater.
>
> We do end up calling this predicate twice for walk_page_range(), so we could
> (should?)  also make walk_page_range_mm() into a static __walk_page_range_mm()
> and have a separate walk_page_range_mm() that does this check.
>
> I think this will solve the interface issues I've raised below.

Makes sense, thank you for your suggestions.

>
> Thanks!
>
> On Tue, Jun 10, 2025 at 05:14:00PM +0530, Dev Jain wrote:
>> arm64 currently changes permissions on vmalloc objects locklessly, via
>> apply_to_page_range. Patch 2 moves away from this to use the pagewalk API,
>> since a limitation of the former is to deny changing permissions for block
>> mappings. However, the API currently enforces the init_mm.mmap_lock to be
>> held. To avoid the unnecessary bottleneck of the mmap_lock for our usecase,
>> this patch extends this generic API to be used locklessly, so as to retain
>> the existing behaviour for changing permissions. Apart from this reason,
>> it is noted at [1] that KFENCE can manipulate kernel pgtable entries during
>> softirqs. It does this by calling set_memory_valid() -> __change_memory_common().
>> This being a non-sleepable context, we cannot take the init_mm mmap lock.
>>
>> Since such extension can potentially be dangerous for other callers
>> consuming the pagewalk API, explicitly disallow lockless traversal for
>> userspace pagetables by returning EINVAL. Add comments to highlight the
>> conditions under which we can use the API locklessly - no underlying VMA,
>> and the user having exclusive control over the range, thus guaranteeing no
>> concurrent access.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   include/linux/pagewalk.h |  7 +++++++
>>   mm/pagewalk.c            | 23 ++++++++++++++++++-----
>>   2 files changed, 25 insertions(+), 5 deletions(-)
>>
>> diff --git a/include/linux/pagewalk.h b/include/linux/pagewalk.h
>> index 8ac2f6d6d2a3..5efd6541239b 100644
>> --- a/include/linux/pagewalk.h
>> +++ b/include/linux/pagewalk.h
>> @@ -14,6 +14,13 @@ enum page_walk_lock {
>>   	PGWALK_WRLOCK = 1,
>>   	/* vma is expected to be already write-locked during the walk */
>>   	PGWALK_WRLOCK_VERIFY = 2,
>> +	/*
>> +	 * Walk without any lock. Use of this is only meant for the
>> +	 * case where there is no underlying VMA, and the user has
>> +	 * exclusive control over the range, guaranteeing no concurrent
>> +	 * access. For example, changing permissions of vmalloc objects.
>> +	 */
>> +	PGWALK_NOLOCK = 3,
> Thanks for the comment! This is good.
>
>>   };
>>
>>   /**
>> diff --git a/mm/pagewalk.c b/mm/pagewalk.c
>> index ff5299eca687..d55d933f84ec 100644
>> --- a/mm/pagewalk.c
>> +++ b/mm/pagewalk.c
>> @@ -417,13 +417,17 @@ static int __walk_page_range(unsigned long start, unsigned long end,
>>   	return err;
>>   }
>>
>> -static inline void process_mm_walk_lock(struct mm_struct *mm,
>> +static inline bool process_mm_walk_lock(struct mm_struct *mm,
>>   					enum page_walk_lock walk_lock)
> I don't like this signature at all, you don't describe what it does, and now it
> returns... whether it was not locked? I think this might lead to confusion :)
>
>
>>   {
>> +	if (walk_lock == PGWALK_NOLOCK)
>> +		return 1;
> It's 2025, return true please :)
>
>> +
>>   	if (walk_lock == PGWALK_RDLOCK)
>>   		mmap_assert_locked(mm);
>>   	else
>>   		mmap_assert_write_locked(mm);
>> +	return 0;
> It's 2025, return false please :)
>
>>   }
>>
>>   static inline void process_vma_walk_lock(struct vm_area_struct *vma,
>> @@ -440,6 +444,8 @@ static inline void process_vma_walk_lock(struct vm_area_struct *vma,
>>   	case PGWALK_RDLOCK:
>>   		/* PGWALK_RDLOCK is handled by process_mm_walk_lock */
>>   		break;
>> +	case PGWALK_NOLOCK:
>> +		break;
> Under what circumstances would we be fine with this function being invoked with
> no lock being specified?
>
> Isn't it the case that the one situation in which we can specify PGWALK_NOLOCK
> won't ever invoke this? Or did I miss a call of this function?
>
> If not, we should make this a VM_WARN_ON_ONCE(1);

I was made aware that there is a quest to remove BUG_ON()'s in the kernel, see [1].
Is there a similar problem with VM_WARN_ON_ONCE()?

[1]: https://lore.kernel.org/all/053ae9ec-1113-4ed8-9625-adf382070bc5@redhat.com/

>
>>   	}
>>   #endif
>>   }
>> @@ -470,7 +476,8 @@ int walk_page_range_mm(struct mm_struct *mm, unsigned long start,
>>   	if (!walk.mm)
>>   		return -EINVAL;
>>
>> -	process_mm_walk_lock(walk.mm, ops->walk_lock);
>> +	if (process_mm_walk_lock(walk.mm, ops->walk_lock))
>> +		return -EINVAL;
> This is just weird, you're treating the return like it were an error value (no
> it's a boolean), the name of the function doesn't expliain the 'verb' of what's
> happening, it's just confusing.
>
> Obviously I'm belabouring the point a bit, see suggestion at top :)
>
>>   	vma = find_vma(walk.mm, start);
>>   	do {
>> @@ -626,8 +633,12 @@ int walk_kernel_page_table_range(unsigned long start, unsigned long end,
>>   	 * to prevent the intermediate kernel pages tables belonging to the
>>   	 * specified address range from being freed. The caller should take
>>   	 * other actions to prevent this race.
>> +	 *
>> +	 * If the caller can guarantee that it has exclusive access to the
>> +	 * specified address range, only then it can use PGWALK_NOLOCK.
>>   	 */
>> -	mmap_assert_locked(mm);
>> +	if (ops->walk_lock != PGWALK_NOLOCK)
>> +		mmap_assert_locked(mm);
>>
>>   	return walk_pgd_range(start, end, &walk);
>>   }
>> @@ -699,7 +710,8 @@ int walk_page_range_vma(struct vm_area_struct *vma, unsigned long start,
>>   	if (!check_ops_valid(ops))
>>   		return -EINVAL;
>>
>> -	process_mm_walk_lock(walk.mm, ops->walk_lock);
>> +	if (process_mm_walk_lock(walk.mm, ops->walk_lock))
>> +		return -EINVAL;
>>   	process_vma_walk_lock(vma, ops->walk_lock);
>>   	return __walk_page_range(start, end, &walk);
>>   }
>> @@ -719,7 +731,8 @@ int walk_page_vma(struct vm_area_struct *vma, const struct mm_walk_ops *ops,
>>   	if (!check_ops_valid(ops))
>>   		return -EINVAL;
>>
>> -	process_mm_walk_lock(walk.mm, ops->walk_lock);
>> +	if (process_mm_walk_lock(walk.mm, ops->walk_lock))
>> +		return -EINVAL;
>>   	process_vma_walk_lock(vma, ops->walk_lock);
>>   	return __walk_page_range(vma->vm_start, vma->vm_end, &walk);
>>   }
>> --
>> 2.30.2
>>
> Thanks!
