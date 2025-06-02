Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010047.outbound.protection.outlook.com [52.101.69.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE4217996
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 04:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.47
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748839005; cv=fail; b=A+jxYJUFrV8bG5R5M+9ahupoq14b66KNbfRrQ9RPjYjIV1ZrcPaxO4qSgAVcokj5Adwvq4NAbpEudJb0yMSUhWRPOy8fsxvU1jVHoeAAqfhcmxHtzFKsr5gGanMvnnPdCGcHt6fpaoyCZtykM4WuPUL3FTiLLeXs/rXhWCbxIOs=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748839005; c=relaxed/simple;
	bh=kmyDiBpy3+W9VqcGEgAVyAmvgPOFuqdYGEpca4Bfrrg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=e4cWzoIz/NDNKKsXk691xvgIpaTPSb5onuZQLV/vQbt8tTfa+w8SSHUs4Gj1OJrALU+aJCWLyMMKorvrDvbPL5lv7b9tgKvRFFOjthBR16ToD/pEjZfGsG9RIq8s0ajRsuORe1UP5XjIMYXSp/S1+jpoff2VvYPkzvKTTWaGVSE=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=iOf5rWaq; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=iOf5rWaq; arc=fail smtp.client-ip=52.101.69.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iOf5rWaq";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iOf5rWaq"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DG6IRQM6VKSHi1KGKfdjZrKQrDdMoXuv+GOikWcCXUTEZ+Z1ouOHKwr6Y2kQCIzQJMGe/1OTP83dSyI5Ef2HES8t7WQD37AC2zlZffGbhXYpi4cH5uKpVlMTnMUfp5hVnJePiRP9PDMw650UfhynCfPDFqFfJyZlemL/tv5VEyQCjxiq0TJl2Ty0jC0o8zEzOqYCNuvDYXhrzfrs0X3rPNvyYx2qGFFGnV5LrXxMwDTnA8i+eew8g98YIe72kZBeUjvXPqyzEEyzTSpwgbTWJsVfKMiHGkCi+F6hOzvW21NPobKAAAoq33uO41ZB15hBWEXZc23eyDjeLRMDFYw7Zw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XEe/eHqtmeCVY99dUUcJQkzcnu17ZTGthQYrC0lJw+Q=;
 b=EtJfM3oo3ZFHQ5VuxolKnEaG9YgfTCPrEQ0eLwODOlg64f/noczt3M9Ge6HjLc4x897gh6JH2IJ5z2ODxYeupfdKNnfC/7Ujg30Hhj/A0P8ad1+POEtr3on2hVJXBH2pI6330nH7b6goE5XGG4gAIFNgjRbFlI9G2h+AhF+mNF41/07jwflrBI0WkCvoi6jLUhoAD0VVl/WrKoKtv8MeT8PGnKCqpIioOXbZ1H7Yv9XtMiHV7MDvA2qFh7aSOX8eiSeTPjhiO7YdNFAAQCJUXeImAI5FTy0zEcwV5BgH2EmFhXCp8MKhsJ9V2Qkpw2XGKMEpePXcN2hHYTM6VBXvRw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XEe/eHqtmeCVY99dUUcJQkzcnu17ZTGthQYrC0lJw+Q=;
 b=iOf5rWaqu0560E7ZWXTgacbHU/czWUh2dbqUxFCtGBWDgMSB42NlrvxgPYLATogxwJ0RpB2xNn30q/VEwUPv3bJIM15dKhQyu6C0fu9lRjcoKnsTafRz+pCHoJaKPg7TL0eTr2qUFyH66jmjwL/oCyX/UZZBhIACKDt56gOU+hk=
Received: from DB8PR09CA0004.eurprd09.prod.outlook.com (2603:10a6:10:a0::17)
 by DBBPR08MB6234.eurprd08.prod.outlook.com (2603:10a6:10:202::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 04:36:37 +0000
Received: from DB1PEPF000509E7.eurprd03.prod.outlook.com
 (2603:10a6:10:a0:cafe::58) by DB8PR09CA0004.outlook.office365.com
 (2603:10a6:10:a0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.23 via Frontend Transport; Mon,
 2 Jun 2025 04:36:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E7.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Mon, 2 Jun 2025 04:36:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rSsTaAVW7vnKEvMclEiC2/vPlpo+xmmJmwIJtO1GpHVygT7JhYCLCK9mrfp6fXInL6kDjJ+wNAk2WWOddeNXegRojwXrn7iebDxr/FPUpBaY/yUVeBEcXS8/vN4/ZwzdM8ZupVFFO7FlgUIHEwVITPTp1Dq5BoK9kpTLxbma6m3s/skMPP7obQnBsxncdHFt8byc9RG+ECw68LyzWyFeM2ppUeo4+5SteHjZ+g7Pef0iRa2LiTmIndNzA2XmSYlV4HXQxTZ2+YWhuinjRa+6BSfaVYZCpK59U0hybhHFwgoxzUdN236+zcfxHDSVGe1IVS3szfHHF0bgupTgEFfohQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XEe/eHqtmeCVY99dUUcJQkzcnu17ZTGthQYrC0lJw+Q=;
 b=QHvfEFF6dW2IlfSx2De5kC4fK+6b7wvItsDP8gwZBpPVH83fu+g21ijrzxdb3KyoJrEnGpCDReQxHEbIev4XqWA49FQ0ONZ8WgIvD0s+aoUIFnTuxkb3ng5gtvKU5UTNA/M74fOT/X+YvG0R3i9QiHmHxvuNLjEyTqyrZl6okRPKl3Tm4QCYN0WQfTukpuRveejf7G9TYSfWnuWZbQIjNdkSnC5c98UfG+VBHWEIsTOXh8eGbIRrdmzMxWdYGlj+OYd6w2stVosPrEWWvZqeO2hNRdhrOg3WS8Uy2fZD+lwzG5p9phWyQq3A+0RojNcZYLDqhtaH7wH6asU8Q92/Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XEe/eHqtmeCVY99dUUcJQkzcnu17ZTGthQYrC0lJw+Q=;
 b=iOf5rWaqu0560E7ZWXTgacbHU/czWUh2dbqUxFCtGBWDgMSB42NlrvxgPYLATogxwJ0RpB2xNn30q/VEwUPv3bJIM15dKhQyu6C0fu9lRjcoKnsTafRz+pCHoJaKPg7TL0eTr2qUFyH66jmjwL/oCyX/UZZBhIACKDt56gOU+hk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DBBPR08MB6233.eurprd08.prod.outlook.com (2603:10a6:10:204::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 04:36:03 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8769.029; Mon, 2 Jun 2025
 04:36:02 +0000
Message-ID: <4fa4b022-ad2c-46db-9edc-ea4396723964@arm.com>
Date: Mon, 2 Jun 2025 10:05:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: pageattr: Use walk_page_range_novma() to
 change memory permissions
To: Ryan Roberts <ryan.roberts@arm.com>, akpm@linux-foundation.org,
 david@redhat.com, catalin.marinas@arm.com, will@kernel.org
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org
References: <20250530090407.19237-1-dev.jain@arm.com>
 <20250530090407.19237-3-dev.jain@arm.com>
 <d195c7bc-0c04-4514-b536-b503d4827914@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <d195c7bc-0c04-4514-b536-b503d4827914@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0171.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::17) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DBBPR08MB6233:EE_|DB1PEPF000509E7:EE_|DBBPR08MB6234:EE_
X-MS-Office365-Filtering-Correlation-Id: 45142948-13b2-4a7f-2622-08dda18f0e73
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?cVd3cmRHcnpuZFBFSmtraXJjeE0yd0w4ekVHc3cvTmxCenBueGJTWUZ1anBa?=
 =?utf-8?B?UXAxUTdPVU1RM0tEZXk2L21ONXVPSVlIc2EycGxUcE5ua1NrR1RydGVJb3Bx?=
 =?utf-8?B?MmlicSt1bHBublRsTm9uUDhSUFc0c1dBUjE1a1hIZUZZLzZLNlU0cWszUUs0?=
 =?utf-8?B?VXk4bzVHWEEvNXo0YmZFTUl1WHU0YU5vU3oyZnNPc1h0ZFovMkJtOHlRQm1I?=
 =?utf-8?B?MmczcFBoQjhLbGZTWE1HQWgvUVlvRFlFTGpsdWE3RW5sb3IrV0tvTmtiWitB?=
 =?utf-8?B?RVpmSnRhc0Z4NlZkWnV6ODNyY2VqWkdDeHU1KzB1QlBiZklvUUI5Um5VdnU3?=
 =?utf-8?B?ZWNjbU1EQlIzdWRtRlNndmdsU2FUdENKZWdKVEJrV205dHZmQStzZEVxYmgw?=
 =?utf-8?B?bkNuTG1vbnRFRVNUcHNSZFBXSlZsaStPNDVUeWYvL0xLNVhnZnBTSlBCbDJk?=
 =?utf-8?B?T3IrOUJpOWh1eXdRQWs0S3l6VDNscDhKQ3F1bXVsd2VwMnM3WWxNSmNjRUJw?=
 =?utf-8?B?WktkV0tnMk1icExiWTZoWTlDVE56eFMveGJnOWlKdXhudlBXL1RyWXYyM1pm?=
 =?utf-8?B?NjhRU0RwVHZnNndDOTFXYkM3enRmZjhxTnJNamhoc0tqNHpSclZEdC9ISUlB?=
 =?utf-8?B?MmJFOGpJbDBoSXJXM2RZUE1XRnR1c3hpc3VodmgycmU2c3l4SzFackUzSkhw?=
 =?utf-8?B?TW1jVzcxeEJ0Skh5eDdpWGFySkc2cGVDMVljQkQyZUpNUjRWQmlrWHoyTjRt?=
 =?utf-8?B?TGNzVkIrZWlDNHFyVDhYakxNL09IeVI5S2lSR2E3bThDSThkNXVBZFZaM0N6?=
 =?utf-8?B?ZHZpT3NDN3JCWnpTeThkbGxFSE5pNlhNWTlBOUZwR20vUmVjYnpna0MyU1BZ?=
 =?utf-8?B?cVcvL21sYVJFL3FOWDQzdXlJK0NQQkZ0eXF0MVZWM0hRT29CN2Q2NFg2YnNk?=
 =?utf-8?B?ZUgxdE9GNjVsVk9HRXRpeXZLODA5YWkrWkthRndIR0Y2VVlpZUgvNEQxQWcv?=
 =?utf-8?B?cGxZU2hTUENkN0lISVJOVkhIdktmN3ZyYkk5SURKeGMxeVNiS05VZk9yRUR4?=
 =?utf-8?B?ZlBqbnhVODl3cmRwQTB4MzM5VUIwYXhVRktlZlhvcXlKWCtwZWNiNk1LRXI1?=
 =?utf-8?B?RDV5cmxoV2Fub0Vody9SWWkrY2JGT3N3a2QrekdJV3Q4QjhFZFJZeFc4TUF6?=
 =?utf-8?B?RGFjSTh0RFNPSDV1aTBlcStkRks2RC9BaHBGcFJQYys0VlRRUUtyOXJqL2Ex?=
 =?utf-8?B?QnF4WFR6UVpiZ2tZTTdJbjdKTnI0SkVrazNQK1FHdDgzMkdWZ2xScUNPU2Fp?=
 =?utf-8?B?ZHJ3b01wL2FhS0U4MHluc3kzVVM1czQ3TUhzVy96ME41MWo0TUh2K205TXgw?=
 =?utf-8?B?Y3ROR1hXR2JrVFZsbi8yVVovTXVrNk81S1p1Y3lORzkydHU1aW5VSmU3L1JT?=
 =?utf-8?B?MjVPbTd6UGdlTW5KcnM5ak9mOUc4OTR5dUp3YUpFOEtNbEZrRlVYK3ZKRWta?=
 =?utf-8?B?WHFQOHoyVWdsN0t1UngwaDR0TDd4M25ZM3BhWkVDTWhQckU1SnZndnZaSm42?=
 =?utf-8?B?R3B1WHpFbElET1Q2WEFIbThmeW0wZzRqTlV1VW54Z1NNSzExYXo3b1Z4VUlR?=
 =?utf-8?B?VHhsdWZtbEhpWlJyc0ZVeUF4clJPTE1RNHNlTVJabEVvUXVHTXJiREkzUEdS?=
 =?utf-8?B?QXlTODZsbjBkWE5BbjhLVXNZSTNiQk1pSVJ5d0lYMzQrYzMyOGxndHI5WFkw?=
 =?utf-8?B?MGxyS25EVW9uOXdQc0VZQkhlSHFmN255K1RDeVdnajlvcUtkYnBZeFJGQVBk?=
 =?utf-8?B?L1dXUmJCSmpZTmViZnI5dHlZZnNCeWllM2h5Vzdhd2NWdWRjTWZadld1QmZB?=
 =?utf-8?B?ZDJBN3hlSmN0M3JuZE1OUWh6VTdlV3RlZ3c0NVAvQzhIT3c9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6233
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E7.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ba2a15b0-3b97-4f59-b5c0-08dda18efb0e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|14060799003|1800799024|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODBqYXZIa0JMM2VENExDSmFhUVZkVVhnZEM1c0lZRVNwK25LT1grTWl1UVYy?=
 =?utf-8?B?bDM3anVRcVk1NnZwZ1pBUHY0NE40eDNyWkJVNVRqT0F4bVV2SU9VOXA1RDR1?=
 =?utf-8?B?eHV2b2FLUHZUODN1SERvUXQzcHJLK1Zpc1FzMFJ2b0dNaTlmMkRlaVRhVWsz?=
 =?utf-8?B?NWNEQ2VWQWZIQk1BbThtTHlWR1hzdGQwbjlwSkNuR0Y5czFlWjgrbisvV3h3?=
 =?utf-8?B?T1h6V29RV0pROXBJK1pZSTRPVEwrQkg0NWQ1bTZBY0l0ZHVPU0lPekpDUEwy?=
 =?utf-8?B?S0NlTFYyTk1mZUU0djdPZi9NUkxKeGptRm8rdXNncmVaOXU0YUdJdHpxUldp?=
 =?utf-8?B?WlgrQkRTOS9MelFNM24wSW5DbUgzbzNVMm5TZW5qTEZmSnJ2R3RySXY5UWti?=
 =?utf-8?B?RnU1a3BtYUxMTHVrYnNJL2J0d1dORStsOXFjNU90NWQ3dFgzVHBXY3VBYUps?=
 =?utf-8?B?T0tDbFR3L3dXN05hZjN3SU5SeEF4OHZHVGUzTW5xYitXNVRZbzhIREdBNFRZ?=
 =?utf-8?B?am9kZHNwenA1VWx5cm1Ja1R2ZlA2anhOSzhtb3V2c3NEaDMzWWRidko0V2ZH?=
 =?utf-8?B?eVJIZ09GWDQvYVNkLytKcFF4N0RaU0VUemRZVWFYS3VnV2o5RUtHcFZuS2pt?=
 =?utf-8?B?RGFwMG5DZENBaDhTRGtRZnhCMEFpVUF5N1ZMWFlIaGMzUnlJbThMNHFLeTBW?=
 =?utf-8?B?V050MTA1ZytuVUtjQWE4WDI5MjJhbzRlTXN6YTYzaFNQL1QyQnpmb1FQTzll?=
 =?utf-8?B?RVdxYTN2WjVTR3p6MzhsdE8rdVZrbE5jczl6RFB0Mk50YXN1b3lSNEsxemdR?=
 =?utf-8?B?c3g2czFpbzEyVXo2R0JhSTZJYkp0Z0F2bnF3VkgyVWgxT2pzQ2kyanlLcmJF?=
 =?utf-8?B?VE0wWGFwUzNMNENxazhYSVVTbWh6Nkp2WkUzb09obGw0a3M0OEN0QW1jNHIr?=
 =?utf-8?B?bWZCakkzalFJRHkwUXF1b2tlaDN5TEVxNlkrbFdZaUdOVTlWenB2dE1FKzJC?=
 =?utf-8?B?bHNRUGExRjFjNnRHSmlselEwelgxMjVOQXRSTlNDTDd1ZFBrcDQyc2FRb01z?=
 =?utf-8?B?b3lpcnRxcEhVOVA3VHoxalFmTnhWTm5RZ29KYU5yRmJUOENENWNBZUZNcGxs?=
 =?utf-8?B?VE9HMkJMM2ZrdzQ1dGZ2aURHdDFxTFdKYjJ5WWxyNS9XaHlrVXZIUGdTL1M2?=
 =?utf-8?B?N2syOHpta3Q0K2FBeHJNMHBuNWRwMHp4RG81K3RLM2FVSjZwcEE5Mk16U1dK?=
 =?utf-8?B?eU1vQ2k3Z2dlZndoOFJscWRpbWVmQXNRQ1ZXYTVSMmVDOVV4Ukx4ZTBVQ09u?=
 =?utf-8?B?azVoR3B6cG0zY0haSzVSbXBiclRkSnVEQjhHd2l0UGI5cDBvN0JDR09yMGZ2?=
 =?utf-8?B?VHU4SFg1aklwcjREN1pKUUxSQWR6czR1NXN0dGhjcVVjclRBNUR5K3dDVjVw?=
 =?utf-8?B?cEV0bU50dzFCZTFWcUREVmUxNi81QTREbXhOUXV1RGgxMFhsQTFHcVF0R0ls?=
 =?utf-8?B?Nm4veUFaVmx2OHRocjJBWkU3b1lmR3A0MGxxS0l5UERkZzNHRVppZnFDOUQx?=
 =?utf-8?B?VmFJRmt6a2o3eTVOUFZDWWRkU3RsZS9OcnYyQUl4ZmRFUHFPVlg4dnh1WGtQ?=
 =?utf-8?B?clVFOVd1UHYzNTEyWWM4enJSdkR6LzhmUGFLczZBVU9PWHY2YXJTNWFjU2d2?=
 =?utf-8?B?N0ZrU1UxcEdsMDBrZExnUmxFOEQxZWJVVDFvYlE1K0lORzczdUNPek9VcHhS?=
 =?utf-8?B?c1NKb0hOU0RMZlNtYkZmdkw0cngxWW4rcUIzTXRvRDVJMEJwNU0wMVJ1NXRK?=
 =?utf-8?B?WTlDWTRzVmFDQTIvc1ZsdlJxaXlPT2psbEJUd1pXNVl2UHR1L1hmcEk3UjFE?=
 =?utf-8?B?TVpsc1N5Nkhwamt6TXNuSWl6WjRFS3dCam9Udm5WQUFkZHdvY0lweHg5dmhE?=
 =?utf-8?B?YVc3RkNFNHFhUm16bWJkdXBIdlhVQmEzdWpMejExVXljM09ZV1U2SE1lQ2JG?=
 =?utf-8?B?Q0tuWHM3Zmh5R09zdXlrWEMvNEUxSDZUWE5JbU8xU1MwcmtGOWFWZEJxUWFU?=
 =?utf-8?Q?ZXWUnX?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(14060799003)(1800799024)(35042699022)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 04:36:35.0236
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45142948-13b2-4a7f-2622-08dda18f0e73
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E7.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6234


On 30/05/25 6:23 pm, Ryan Roberts wrote:
> On 30/05/2025 10:04, Dev Jain wrote:
>> Move away from apply_to_page_range(), which does not honour leaf mappings,
>> to walk_page_range_novma(). The callbacks emit a warning and return EINVAL
>> if a partial range is detected.
> Perhaps:
>
> """
> apply_to_page_range(), which was previously used to change permissions for
> kernel mapped memory, can only operate on page mappings. In future we want to
> support block mappings for more efficient TLB usage. Reimplement pageattr.c to
> instead use walk_page_range_novma() to visit and modify leaf mappings of all sizes.
>
> We only require that the start and end of a given range lie on leaf mapping
> boundaries. If this is not the case, emit a warning and return -EINVAL.
> """

Thanks.

>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   arch/arm64/mm/pageattr.c | 69 +++++++++++++++++++++++++++++++++++++---
>>   1 file changed, 64 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
>> index 39fd1f7ff02a..a5c829c64969 100644
>> --- a/arch/arm64/mm/pageattr.c
>> +++ b/arch/arm64/mm/pageattr.c
>> @@ -8,6 +8,7 @@
>>   #include <linux/mem_encrypt.h>
>>   #include <linux/sched.h>
>>   #include <linux/vmalloc.h>
>> +#include <linux/pagewalk.h>
>>   
>>   #include <asm/cacheflush.h>
>>   #include <asm/pgtable-prot.h>
>> @@ -20,6 +21,67 @@ struct page_change_data {
>>   	pgprot_t clear_mask;
>>   };
>>   
>> +static pteval_t set_pageattr_masks(unsigned long val, struct mm_walk *walk)
> Please don't use unsigned long for raw ptes; This will break with D128 pgtables.
>
> Anshuman had a patch in flight to introduce ptdesc_t as a generic/any level raw
> value. It would be preferable to incorporate that patch and use it. pteval_t
> isn't really correct because this is for any level and that implies pte level only.

Okay.

>
>> +{
>> +	struct page_change_data *masks = walk->private;
>> +	unsigned long new_val = val;
> why do you need new_val? Why not just update and return val?

Yes, shameless copying from riscv and loongarch : )

>
>> +
>> +	new_val &= ~(pgprot_val(masks->clear_mask));
>> +	new_val |= (pgprot_val(masks->set_mask));
>> +
>> +	return new_val;
>> +}
> One potential pitfall of having a generic function that can change the
> permissions for ptes at all levels is that bit 1 is defined differently for
> level 3 vs the other levels. I don't think there should be any issues here in
> practice having had a quick look at all the masks that users currently pass in
> though.
>
>> +
>> +static int pageattr_pud_entry(pud_t *pud, unsigned long addr,
>> +			      unsigned long next, struct mm_walk *walk)
>> +{
>> +	pud_t val = pudp_get(pud);
>> +
>> +	if (pud_leaf(val)) {
>> +		if (WARN_ON_ONCE((next - addr) != PUD_SIZE))
>> +			return -EINVAL;
>> +		val = __pud(set_pageattr_masks(pud_val(val), walk));
>> +		set_pud(pud, val);
>> +		walk->action = ACTION_CONTINUE;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int pageattr_pmd_entry(pmd_t *pmd, unsigned long addr,
>> +			      unsigned long next, struct mm_walk *walk)
>> +{
>> +	pmd_t val = pmdp_get(pmd);
>> +
>> +	if (pmd_leaf(val)) {
>> +		if (WARN_ON_ONCE((next - addr) != PMD_SIZE))
>> +			return -EINVAL;
>> +		val = __pmd(set_pageattr_masks(pmd_val(val), walk));
>> +		set_pmd(pmd, val);
>> +		walk->action = ACTION_CONTINUE;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int pageattr_pte_entry(pte_t *pte, unsigned long addr,
>> +			      unsigned long next, struct mm_walk *walk)
>> +{
>> +	pte_t val = ptep_get(pte);
> BUG: Use __ptep_get(), which is "below" the contpte management layer. ptep_get()
> will look at the contiguous bit and potentially decide to accumulate all the a/d
> bits in the block which is not relavent for kernel mappings.

Thanks.

>
>> +
>> +	val = __pte(set_pageattr_masks(pte_val(val), walk));
>> +	set_pte(pte, val);
> BUG: Use __set_pte(). Same reasoning as above. But this is more harmful because
> set_pte() will try to detect contpte blocks and may zero/flush the entries.
> Which would be very bad for kernel mappings.

Thanks.

>
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct mm_walk_ops pageattr_ops = {
>> +	.pud_entry	= pageattr_pud_entry,
>> +	.pmd_entry	= pageattr_pmd_entry,
>> +	.pte_entry	= pageattr_pte_entry,
> Is there a reason why you don't have pgd and p4d entries? I think there are
> configs where the pgd may contain leaf mappings. Possibly 64K/42-bit, which will
> have 2 levels and I think they will be pgd and pte. So I think you'd better
> implement all levels to be correct.

Okay.

>
>> +	.walk_lock	= PGWALK_NOLOCK,
>> +};
>> +
>>   bool rodata_full __ro_after_init = IS_ENABLED(CONFIG_RODATA_FULL_DEFAULT_ENABLED);
>>   
>>   bool can_set_direct_map(void)
>> @@ -49,9 +111,6 @@ static int change_page_range(pte_t *ptep, unsigned long addr, void *data)
>>   	return 0;
>>   }
>>   
>> -/*
>> - * This function assumes that the range is mapped with PAGE_SIZE pages.
>> - */
>>   static int __change_memory_common(unsigned long start, unsigned long size,
>>   				pgprot_t set_mask, pgprot_t clear_mask)
>>   {
>> @@ -61,8 +120,8 @@ static int __change_memory_common(unsigned long start, unsigned long size,
>>   	data.set_mask = set_mask;
>>   	data.clear_mask = clear_mask;
>>   
>> -	ret = apply_to_page_range(&init_mm, start, size, change_page_range,
>> -					&data);
>> +	ret = walk_page_range_novma(&init_mm, start, start + size,
>> +				    &pageattr_ops, NULL, &data);
>>   
>>   	/*
>>   	 * If the memory is being made valid without changing any other bits
> I notice that set_direct_map_invalid_noflush() and
> set_direct_map_default_noflush() don't use __change_memory_common() but instead
> call apply_to_page_range() direct. (presumably because they don't want the
> associated tlb flush). Is there a reason not to update these callers too?
>
> Perhaps it would be cleaner to wrap in ___change_memory_common (3 leading
> underscores) which does everything except the flush).

Makes sense, I think Yang's series will need this to handle block mappings
for linear map.

>
> Thanks,
> Ryan
>
