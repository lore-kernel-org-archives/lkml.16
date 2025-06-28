Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011031.outbound.protection.outlook.com [52.101.70.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A3921ABDD
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 11:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.31
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751111825; cv=fail; b=tjbvCBt0xWLkLq58OXwarWlwFNSKEl7+um7doxH4XJnK6WJdxdSDaG3Lw2/OzaWCwBONMGFcyC0W3X2gQH6UvnVUC0IYooM2xxqcnVgSe8toPVmp8InHVl5HG3VmNBeTvrkIXH6KAbYNfXE+/6aFm+B3Pb2GCtjyd4qze8Wp3Vs=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751111825; c=relaxed/simple;
	bh=av0PfdkHc1ZQKMzCbz+8DNFBmvqQLlxtE+G0yP7bVfY=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tEn2l8lxYYtuMuMHY4Vs2KweDhLGLtpwhttvY9qZ65iSg2hmi1k4dDdXzRnaHHl12AOBwK/PylFkNcRm9DAgz5arNNg95EKeYeXba5MRY5exgaUbJwPIYNBh/NO6WnGlSmsiola0KWFLgG1tjm72isJlQYA0uwzVA+YDfN/NUa0=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=bCOOBz+r; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=bCOOBz+r; arc=fail smtp.client-ip=52.101.70.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="bCOOBz+r";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="bCOOBz+r"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=o5P3xhjaDMqTaASnfw0jrH7UhJhMkBAY0nxTttKfuUhGaE5DambiNKb4qwahv0ygq5fVwkf+gQ6zK/CxFNi9gIbXI/8U2VgVXVijaR9lV/8bR1/4dl+zgl5ggw7PJQMP4bhYLXYfKBDqfrlYm2YmgVlnRy8jAQRgL0KQarnEL40PBIA+a6xitchUweRBZLTwzml4RCkwHzwlPe0H7YC8XtNeCvlqXF6xZzbbI0e6iDa2QGyAUuMV3viZ9v/db3kaDG5mx5vyEbPg4/kr/2wb0OYOFm0xLB3v67UuL+9xPg/aQAZ0t+VTDjhwpkMln9ljibIN1V7Ukacr5q7CX7dmiQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lacx3DZ+B59hUdyWkSqXen0o95H4PGB5latTpq9HqXQ=;
 b=vVRegL6IHdwXPBCOXZZNXPmhK5TjvjYty+kTUCNudmsLRFHd+sTyOAotWV1LQXbHq5/WIuL2BxyA4uZ/uZpOkHjF98FTypszwcL/H7RvaW+Xuq1skiOTTynGniCMi/YDnAjeDqfFplrv21A+KeLyDbNQcuLdWj+0bNexUARY6dx7B/EFx4G5X+o8uBBod+N4uzGDH4KIkXlyAuIAWX+0Oe0zq/fa3PhZ4dq4CL0xZZiAi4iYKaLeD4UoiPgoSNHy88o4FlHROUx18QWlwdezAQkKlnMj3IKBe+YbLD0ljDhXloCVoI/Q6kUf0eeced+SMuUqvrXEc4rqHVbaJOQzeg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lacx3DZ+B59hUdyWkSqXen0o95H4PGB5latTpq9HqXQ=;
 b=bCOOBz+ri1Zwu9wekHrL17g3lC08Im/DXfx53IiRbZfmM65cDR1ATavnzJ04mo8wT5Gk/OvbyXhZKd5MVO9KZngP4inqKhO3XuNaaloawYjjEuImJi38R+RmlSquqvQ1V9U+b7bOS5uXUkJlLfPkdRsUp4PzUWL0EXaI5iD689c=
Received: from AS4P250CA0029.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5e3::19)
 by DBBPR08MB10484.eurprd08.prod.outlook.com (2603:10a6:10:53a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Sat, 28 Jun
 2025 11:56:58 +0000
Received: from AM3PEPF0000A78F.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e3:cafe::51) by AS4P250CA0029.outlook.office365.com
 (2603:10a6:20b:5e3::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.26 via Frontend Transport; Sat,
 28 Jun 2025 11:56:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A78F.mail.protection.outlook.com (10.167.16.118) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Sat, 28 Jun 2025 11:56:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I5EGO7V056itJZEib272M+nh/AiyLPbMb7HIPj7y86sDgv8/NYU8+MoVx8mBbxcUCypP1fSze8REtPwI+242E8J6SXxBVFJ6SPhtfaU6Ym8PEgYcsxQG3beU1H7l+x65t6AmfXBQ9kBdrxG9KTIoED28Lzrx8NliY65nqkgWnLg+SDmjxoOoDbNpqwRCgeW+Avfoc7hTgbhSP9WDcWTRYAlZowPU/JWL/VKE1LppWIDYGeVw9GfMtYKrvqhJ6pUPKKWa6R9ksQwp8gc8XORlXHn3mfEhMBSl1i05igTtE8LqS3+IgHaHUJGsKjenCXnlx7vAQmEva3lDPPPA9MRy6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lacx3DZ+B59hUdyWkSqXen0o95H4PGB5latTpq9HqXQ=;
 b=hY5MFYHxwUxO+uYhCdm2SUb9LxshvZOS7pw1TDx6qlpFc1SFd5hfrflEs+W2AxGdNHWuC45wnTMp/39L83VrkcneU3ENLEW5oJWGH8WV/VTUYdheNi/PYyUjtiAi8reSB4OLOAG+SxGCKWE9ZHtvCkAzknbSni+RJwGlRJt///VgoLnhv+HfjNTmJSZW2nk5ENoN8Z7dFNp7/+uj+rmGMD+aHw0ttfe0XAizIu25zVwveqJb5Q8hevYS8/hgwezhaN0IrJAA8qp/meUpee0gljubctKhaoCHIVVzlhakrN0NsUKfdofDoFKCbxA5k4RGeOhUIF/x+7d53+BlxYU4EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lacx3DZ+B59hUdyWkSqXen0o95H4PGB5latTpq9HqXQ=;
 b=bCOOBz+ri1Zwu9wekHrL17g3lC08Im/DXfx53IiRbZfmM65cDR1ATavnzJ04mo8wT5Gk/OvbyXhZKd5MVO9KZngP4inqKhO3XuNaaloawYjjEuImJi38R+RmlSquqvQ1V9U+b7bOS5uXUkJlLfPkdRsUp4PzUWL0EXaI5iD689c=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DB4PR08MB8055.eurprd08.prod.outlook.com (2603:10a6:10:388::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Sat, 28 Jun
 2025 11:56:23 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8880.015; Sat, 28 Jun 2025
 11:56:23 +0000
Message-ID: <2d55c06a-f4a5-4728-b692-60d88a5fe692@arm.com>
Date: Sat, 28 Jun 2025 17:26:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] maple tree: Add and fix some comments
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, akpm@linux-foundation.org,
 richard.weiyang@gmail.com, maple-tree@lists.infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250626171918.17261-1-dev.jain@arm.com>
 <20250626171918.17261-2-dev.jain@arm.com>
 <bxhfvhmk4iyyz7l3nitsgf4xgsydraskligg56n4ww3fe5zlvr@xqzh44dk3q5b>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <bxhfvhmk4iyyz7l3nitsgf4xgsydraskligg56n4ww3fe5zlvr@xqzh44dk3q5b>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0121.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::11) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DB4PR08MB8055:EE_|AM3PEPF0000A78F:EE_|DBBPR08MB10484:EE_
X-MS-Office365-Filtering-Correlation-Id: e2fabb9d-ded2-401e-2efa-08ddb63ae1bb
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?MXFHWmRGcHUrNUdUZWprWG9nUzNFWGl2REhTTzlCUVFBQ2JnL2ZYcHNpeFUx?=
 =?utf-8?B?Q3FDckc0bUc5ZlVnT09aNmNsS3RsVUdNSWszdTVydGVUeG9BTWVDT2VrYXZx?=
 =?utf-8?B?NHQ1WkxYK09Gd3ZLTlpub0J4TFZyRFFHS1pJWTBob1pUa0xqM2xsbG9UZnRR?=
 =?utf-8?B?OTI5SDVhOGJrRWNFTVpuZnRGR0hja3cxQ3AxcWF1cjl0N0FGQUg5ckdtaWhU?=
 =?utf-8?B?SU1BR3k5L241RlhZczc3UnJlczZCYTlXdlpqU210cFdHUTNjQUpGbThMZWxj?=
 =?utf-8?B?UjNVM0xyQWJLRXZuSnJkajJwMkhpRVVQdFczb2ZkZEhOUDVYV05ZTkQ3ck1a?=
 =?utf-8?B?WUpiRmJBRmJXZ05Xa2p6UnB2MnovaTNVR09lRzVDYVRVUWUwREtNcDBLbEZP?=
 =?utf-8?B?NXlrOWlNbERKaW9Kc2J5dlBySndIaVo1Umo5bzM5TEZ0MGlEZjZGVTB3YU91?=
 =?utf-8?B?L1R6RGplWFR2N1hrMVMxNHNvWG1zVW5MOGFwd3Q1em1VR2ozODFpakpJYU1j?=
 =?utf-8?B?OEhOd2xBaDhkWDJSZ21md2xwZ0tTSVR4VElzNThueDhteTZHT3FpVEFVSmVD?=
 =?utf-8?B?OE9GcVhQelR2SnJKREgrWmx3dnlzMHRpRG9maFBmVTBqcXhDQ1dFWXcyWFVt?=
 =?utf-8?B?ZTE2YXFjQ2xpcXNOQzFrL2lMaE9YeklvTlJIaXRPYXFGdFNiR1NMMkRodlhz?=
 =?utf-8?B?bytDb00rMnI1dTVCdXRCdTdyem5wRlY5RW8vMkwydThody9vZUpneFlCd3JO?=
 =?utf-8?B?cCtGaHhOR3llUDBrbGVINXR2ejl5ZmczcEFOY2Jld3hOY292ZkkreHVVV0FK?=
 =?utf-8?B?VnlXSGgvU2hmN0xSN3lVR3BGSUVCai8zZ3RYR0pnWUZLcjQxQ2NBbTcvTDJ3?=
 =?utf-8?B?T05lYWhveUd3T1RpU3hNa1BXRHZlVFUrOUdvbk1jejZsbFFHRlBjNWtiTkRI?=
 =?utf-8?B?UG1rUDFSTFZXcjRJNUtwelRQaVQ3RVE0L1hhR2lhYm5RaHlGVElzN0tXR1F2?=
 =?utf-8?B?YkNLckw5aUw4VVZOamxGKzB3dm1tb21aU3g4TDhEdDZzR0xxb1FLai95RVJu?=
 =?utf-8?B?Y0xUdXhsV0FKclFqeFhrYXNSbmwrbGhDclBleUlYbzQxOHB3YmVONVEyckVO?=
 =?utf-8?B?WVhHbzB1Y1d1MjB0WThJYmw3cEZFZDd6dGxUSDZLN1FTRTRkUWs2UHRHenYy?=
 =?utf-8?B?MS9jZE1GSGF3eERMS2hXbTlCUWs5anYwL09pSDVLbG1hbHdaSmhYMnZIblpG?=
 =?utf-8?B?WkhWU3kyNE5qN3MwZTc5SmRjM1k2cW1STndCWHdlT1lrckpndHErb1J1N1Mr?=
 =?utf-8?B?UmZXMGo1MFhyblA0MUdoOUpkcXF2bSs3OUJMcHptRU9BOEFIVGVUb2F3T1ht?=
 =?utf-8?B?SlhuWTkzald1bFMxODk5WW5iVkZwUmNEcXA3aXdiWUVIR2pnQUNGcTA1RTRI?=
 =?utf-8?B?MVB2b0pKVzVITGFVNWtzV3duM3d6ejNuY3JMbHFlNFdhRE1DMTc0eVRpVDh1?=
 =?utf-8?B?Y3BLVjJlTE9hYUIrMjdrWFlDa2lNL3Q2VWNkUE00VFFLbnVTcFk2RGZrdFQx?=
 =?utf-8?B?djArSmUxS0J1TTlyVWNrYUxMUHFVVnBBYytEYnNZWE9xN0NuaVZFK0tISE5S?=
 =?utf-8?B?MmlFWGw5cG9kMHcvc1BnOG1JdlRYU1ZtZyt3TG9OQWZkdHBWODloUzlaVlJr?=
 =?utf-8?B?OVY4d1hOTDN3cVNLZFI0RWpCYmJrZW1FUGxCTmhwL3gwaXA5WXdmWi9QbkhB?=
 =?utf-8?B?YWxtR3VNTnB2aCtLUDkwTFJYTCs3b3RzUG0xWWJtMnlFNktCS3dQZVF3bWli?=
 =?utf-8?B?Um9zZXFBN3VlbkpKYW5DdkUzTnBBbzVnblhSRjd6MzZZZG1CME5jYkRrdHB6?=
 =?utf-8?B?ZVZOUFhDMkxQSWR4NktIQjJTemlkUDVtRDByQVozUjVUbTZBRzAzSzhtb1NV?=
 =?utf-8?Q?NaguaCOOlSU=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8055
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A78F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b7b5bf63-6907-416e-5bfb-08ddb63acd45
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|14060799003|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U3gvMnFJQVVTaDlEcTcrdnpRbHJZZlhha1VrbGwvWDc1N3ZqcWpQNnhCVUZy?=
 =?utf-8?B?cnE5OE1xZFhXcTVvZWdna2oxUkpqNXlpSUhhakE5U1ltVDFxZnNYNWZXN3JS?=
 =?utf-8?B?SlJtK3FwYnVzdHBTeW9NQm5ybFc2b2c5Z3pGSldOdGprYmVpSEhvSHpPeDVO?=
 =?utf-8?B?SkNQTjVHSE5PZ1BKdk9iYUFZbG4vSDRlSHNnTy8xTGgxcFlodmVQNkFXK2dZ?=
 =?utf-8?B?ODJDUERBcWxJRmZVRzk3d29FTUFOV01LUnNLdkl5SHVuenBsbUswV3JmZjY4?=
 =?utf-8?B?dThpNkZ2MkMrcWNGd2dkUmNoQWZCY2wzZEdJWjJaa2ZjVmVHbFQ0QXBvWUZ2?=
 =?utf-8?B?ZHQ2SFUxb01VQTdZZHhQM0NyVlpkbXFiQ29FdlBSTFNrSjVqNk1vSVA1QitT?=
 =?utf-8?B?aHNJdng2TDBvU0xyQW5DTkFCby9OVHl2c3pNL3pWaENGNjJCVm05eGdmTEtw?=
 =?utf-8?B?N2FaL2ZFa2hvWmZjVjlyUk9nN2JFU0hGakkvZFNEYlRFZEtjbXBXZU81RDc4?=
 =?utf-8?B?MkFGRlNhZURBRFRjWHlvU0lsejVKVzY5ZFdoUFd0anNvL3NLNW11M0lQa1lP?=
 =?utf-8?B?VVR1OCtyb2wya05aWTdYSXlCeTFqZ3RvRVQwVWYvUlhxamlWc09PUzRLM2FP?=
 =?utf-8?B?M3UwN25nUDkzVDNHbndXZmEyWmh6dVlGakxyOUtsZE5UWUdDZUM0OGR0cXVS?=
 =?utf-8?B?UFZKOXM0bUJyckVCTUZKdFQvVlluemxNNVk4cVRyaE5nTEorODhNck40ZmY3?=
 =?utf-8?B?TlR6YWd6SjNGcmVZY2VCZ2tBMFNCSERtdW5nb1E5T1puVWVmT3ppU3dORWdV?=
 =?utf-8?B?WUplVUdjVnVIU1hpTjBrUXE1ZnNTT1JkckxTeFBwc20wZUR0ZjhmZmdOaFdD?=
 =?utf-8?B?WTFWa25sVDVndWNGZG1CSnNQOWxUbXRaRHl0bksxRGk0ZkdaQVFHeE53aDdH?=
 =?utf-8?B?VGdWc0dsVXY1UTZTcGZMcldYa3VKYy9jYkxLcWN2VTY0UlBISEhOZHJkN2cw?=
 =?utf-8?B?MWNvNDl0NnpLL0d2MG9DdUZaV3hSRHBXT2lPRTJUSUxRY3R4RVFTbC82NGFW?=
 =?utf-8?B?NVdqUHYrcjB0aXE3RUNGbW5tVzUwVEhUa3JTVW42SFdkaURQd1p5SFNwWkt5?=
 =?utf-8?B?UnJYSFhVVUYweDRjWGczdUVCUjFqYVhoZUg1VVZhcDY4a2toUW5RUW9sMzls?=
 =?utf-8?B?UEhDdFd3bTFpK0kxdjYxWEdsaE9jQ093TEthN3hsTWRLSTNYMmNzQldLR3Nh?=
 =?utf-8?B?REVzMWJWRkYvNzh1cEc5YUNVYTF4anE5VG1sTDgwd3VoRHh1SVk4UkdScXRr?=
 =?utf-8?B?dUp1VkQ0V0ZJWFBUTVl2Y21tVlFpeUlKUU0yTzkyWFI2SWpPd1BjZWJUcERo?=
 =?utf-8?B?NnBFcHAvZnFjd0tkaWNNLytjQ0JVSDJSSzA5cG1QR2VhQ2xNZllQRXJiYStM?=
 =?utf-8?B?Mnc1NVpMMW1rUTZRVkt2MVJjeGVMZEpkV2VMUE01ZlNIWHF2N2RGVFJNMmc0?=
 =?utf-8?B?cnFCVndGUmVWRURlSjRvZmpCTDFYdSswaVhzOVBxRWo0RUJpeEI2SWFyaVhM?=
 =?utf-8?B?UlJFeGtRUSs5UDlzMFV6Qm5JYmIzaGRoY3Rxd3UvUFVwb0l3R3dzQXAzQURn?=
 =?utf-8?B?dUZoZ0RwSkJwaGZRMXdwR21kV1lZdTZGNDVGMmNacW95OStlT0RESUx4NW1L?=
 =?utf-8?B?TXRqeVd4cVV0VnN3WC9iK1dPNCtoR3hlS3lyNmZCd0R0T09MSHdCWUhMbFlI?=
 =?utf-8?B?YmRMTnZPc2RiUFBVSW1VZWlmaXR3VTRhRVpoenMwZEprV2YxWXN4SHZnZjdF?=
 =?utf-8?B?ZWs2WDJZR1hIMnVoUjdSNWo2T255QjY2QnVNeE94RVpEZm1CQ01hc3pCcjVt?=
 =?utf-8?B?MFk1OEFKbzB3VldudjRldURVakF6MXd2ZExvSHprb0R2SUtGK1BiYmZYdXl1?=
 =?utf-8?B?azVEcnp1aUYvQzgwZ3hPVGtnT1hRRWhKbmV4QjloV3BJNDc2djNhcXJJTUpx?=
 =?utf-8?B?R3hIcnpOYWhBaUhLMjBybDJGa0F1QTd2dXAxZ1RkU1pMdVNzU2J1RXNQbmxn?=
 =?utf-8?Q?waiGMN?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(14060799003)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2025 11:56:56.6969
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2fabb9d-ded2-401e-2efa-08ddb63ae1bb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A78F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10484


On 27/06/25 1:34 am, Liam R. Howlett wrote:
> * Dev Jain <dev.jain@arm.com> [250626 13:19]:
>> Add comments explaining the fields for maple_metadata, since "end" is
>> ambiguous and "gap" can be confused as the largest gap, whereas it
>> is actually the offset of the largest gap.
>>
>> MAPLE_ROOT_NODE is used for mt_mk_root() and mt_safe_root(), indicating
>> that it is used to mark the node as root. So fix the comment.
> That's not quite the entire story here.
>
> The first pointer in the tree may not be a node at all, and may be an
> entry.  So having that bit set tells us the root of the tree is a node,
> so the comment is correct but maybe you have a better way of expressing
> this information?

Hmm. Can you please correct me on my understanding - when we have an
empty tree, then we insert a root and can store a value there. Now when
we store the second entry, we allocate a node and make the root a node,
the root points to that node, and we store the values at offsets 0 and 1.

I am reading more to answer my own question.

>
>
>> Add comment for mas_ascend() to explain, whose min and max we are
>> trying to find. Explain that, for example, if we are already on offset
>> zero, then the parent min is mas->min, otherwise we need to walk up
>> to find the implied pivot min.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   include/linux/maple_tree.h | 4 ++--
>>   lib/maple_tree.c           | 9 +++++++--
>>   2 files changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/linux/maple_tree.h b/include/linux/maple_tree.h
>> index 9ef129038224..bafe143b1f78 100644
>> --- a/include/linux/maple_tree.h
>> +++ b/include/linux/maple_tree.h
>> @@ -75,8 +75,8 @@
>>    * searching for gaps or any other code that needs to find the end of the data.
>>    */
>>   struct maple_metadata {
>> -	unsigned char end;
>> -	unsigned char gap;
>> +	unsigned char end;	/* end of data */
>> +	unsigned char gap;	/* offset of largest gap */
> Thanks.
>
>>   };
>>   
>>   /*
>> diff --git a/lib/maple_tree.c b/lib/maple_tree.c
>> index 6c89e6790fb5..e4735ccd06f2 100644
>> --- a/lib/maple_tree.c
>> +++ b/lib/maple_tree.c
>> @@ -338,7 +338,7 @@ static inline void mte_set_node_dead(struct maple_enode *mn)
>>   	smp_wmb(); /* Needed for RCU */
>>   }
>>   
>> -/* Bit 1 indicates the root is a node */
>> +/* Bit 1 indicates the node is the root */
>>   #define MAPLE_ROOT_NODE			0x02
>>   /* maple_type stored bit 3-6 */
>>   #define MAPLE_ENODE_TYPE_SHIFT		0x03
>> @@ -1053,7 +1053,7 @@ static inline void mte_set_gap(const struct maple_enode *mn,
>>    * mas_ascend() - Walk up a level of the tree.
>>    * @mas: The maple state
>>    *
>> - * Sets the @mas->max and @mas->min to the correct values when walking up.  This
>> + * Sets the @mas->max and @mas->min for the parent node of mas->node.  This
>>    * may cause several levels of walking up to find the correct min and max.
>>    * May find a dead node which will cause a premature return.
>>    * Return: 1 on dead node, 0 otherwise
>> @@ -1098,6 +1098,11 @@ static int mas_ascend(struct ma_state *mas)
>>   
>>   	min = 0;
>>   	max = ULONG_MAX;
>> +
>> +	/*
>> +	 * !mas->offset => parent node min == mas->min. mas->offset => need
>> +	 * to walk up to find the implied pivot min.
> The => arrows here are a bit hard to parse, especially mixed with ==.
> Maybe use more words?

Okay.

>
>> +	 */
>>   	if (!mas->offset) {
>>   		min = mas->min;
>>   		set_min = true;
>> -- 
>> 2.30.2
>>
