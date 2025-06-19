Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012015.outbound.protection.outlook.com [52.101.66.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F3323A98E
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 03:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.15
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750305322; cv=fail; b=O7lVgsMiJXCVnPqdYIeGlAVnKIcWlmRKwO2ut5kw9ccnn1KQEAwVEqjHzs0rlNung9P6ZvG62AgDYwYOLkY1k12pvBm3HhhgzQQR5lai0MhJLcgjnWyRZbwgkLD2nb7awpDf3GeCP4imBQS7xUkCdBAXN04ZlgcN1VAtk0iHO8g=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750305322; c=relaxed/simple;
	bh=tE+vDmIda0HWxdU0j8HtoO0++s5SuJoknO0I9PKRKKY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Vl/QRrsYIXlp+BomEaszGBuhuK1tsyFpc1vh2+wPQFEj8f0dItJVuvYvgOLPYoxlp8Wn9A8GY2ul6JOL+TGTxS9Y3664hvx3fb3DfQPRgtx+WN/WGgE+97/Dx/BEGObpUeJDEdSriGom3dOovYdu/ZcfTCwvK5Go2aoB/jppPu4=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=JU8Zj/1X; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=JU8Zj/1X; arc=fail smtp.client-ip=52.101.66.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="JU8Zj/1X";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="JU8Zj/1X"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=pFQ8cbiJsH7cdROCNIaKGqLlfOY9dpXBZFXBdM7UoZnpOX0lh85c7BGzjTZRGGRNmMBDLj+8YWw00R1v+rrcD2nHjY4zfIIB6g6UZktP49nl8qQVs/fpj+kBJHe1vGQdWuZ6A3BDrnJ4GEs+t+mBpbg7Cf2YGFJUgRhW6yWo7vy2CsQ4wCKqvwOw8B7pvk5M81fYkmtHI8Qn0OHnM4uJxDVrf3K/hJuyFSbxjrLp+wXcINwB1NMwWUBTrFoqT+20++TIPAA3obd7RX3N/k6AAM+q6SkHq/Fz6U4fuGc63ZIR6yIa1j5MgNJUQ3wNnWWUeURzGXPCgFGjoatluB5rmw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7w8BOgPjzzdSc5xVT4m6ZhOHSt1Sqc3qFE86Cv1D7k=;
 b=PliGLLW9nKtj4IzMHCUaeUl/6tYcsRRMVKSFjo3w/a9UX5JSzuORlBvMxA+uxanOdluPbRoWomKmtSDcTi1+9AXiY9nSZFk1+DOtyzWF33fDYgQXtAg6qlSMzBypeTfOkq3p+oHqxzOoarpTur8ABQqk36EDcLtdfvvAVKRNiK60ua5xjss/L2kf/LgyjGa9CJPBi1G2Ed0DYFjd6drUSPZcmAiJVXCpkSWdf6lpF/104n+7X3UQvXg3j5ctsYL204JzFSX8o+jl++XvqQorud5Ha4cPNeDfheutTlG2kF0sqpVZaa7DkZxoGUzysp9S3UH4Eh0ha2yR5e0frvvY0g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=redhat.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7w8BOgPjzzdSc5xVT4m6ZhOHSt1Sqc3qFE86Cv1D7k=;
 b=JU8Zj/1XOOkvbAvYMlsl+AfgalHxpGKlS6ys/95god69xY2EqRUXZY8OQhwkTr9DRbf04lxcYuqjM3ktP4C7pObL2za0mCvZ4VQuZpExfza9tkguv7tCYjfoVN2Tzokr+9+aMRkv3UXUhCR94rk7tY/gPEYXzYfaES6WWfAUz/c=
Received: from DU2PR04CA0242.eurprd04.prod.outlook.com (2603:10a6:10:28e::7)
 by PAVPR08MB9404.eurprd08.prod.outlook.com (2603:10a6:102:30f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 03:55:13 +0000
Received: from DB5PEPF00014B8A.eurprd02.prod.outlook.com
 (2603:10a6:10:28e:cafe::d9) by DU2PR04CA0242.outlook.office365.com
 (2603:10a6:10:28e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.34 via Frontend Transport; Thu,
 19 Jun 2025 03:55:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8A.mail.protection.outlook.com (10.167.8.198) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.21
 via Frontend Transport; Thu, 19 Jun 2025 03:55:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cs8aVjUigJTuv4jXW8a6ZRiCJvEV8eQvh5TuRMgNlXalLy1L9/HGLxH/F0n4xd5LmmRemRsKpUSMVuInicc98URTr9IbrTXV8+mm4VwC7p9qwBm+jALNHWqPNcS2FnvbMwFcht+SOR9/QDkh9j6Ef1qRRE57RWG04+NtCXYxE1ctgl833Oxpk99IYv+sFWf3YOE6ipjyCcpnflvQFkOZMvp4ZQ7CB7znTFrQDqlnlYr9MaRQFY1x6/+TgoinuovFC5vc5ccEoS6nTFCQQiJSiF63LX5lUiRiDUqFK5mFtoRA2BcB8ZnOyonm+TgCKziDPedwRf8DE+CnGBQyw1n3pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7w8BOgPjzzdSc5xVT4m6ZhOHSt1Sqc3qFE86Cv1D7k=;
 b=b5V4YF7MVMCgQu4SlTrpv6xQZMAH7AgX1d5+Q0ieJ3E5AcxrYJ8EX5TyWdhdNIJIXS3vk2tBTaPEXpxWDcrS5cYL2Cq0DVURvrSwt6gHqWcelPO4+H67Ou6cvDdimitAerLQtVoFMtKwsFnoJeeKohDBeE1OqXlqkYFtoAV27aItgrhPjOIOga19MBhHr4wVivsVVVtwS+5ZeXufVFiZggDkctcv4oKZd5ejfFpL93qaWDG+gl0BUDwFGuXmUQYvpNMpTxAAEyR+ZN6IztLT0yzC/cYvWvk2svJMMdxDEbw6KPLBSHAdBwTiYTwI05hsjuOtxLJ4iv1x8KBLrIY/kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7w8BOgPjzzdSc5xVT4m6ZhOHSt1Sqc3qFE86Cv1D7k=;
 b=JU8Zj/1XOOkvbAvYMlsl+AfgalHxpGKlS6ys/95god69xY2EqRUXZY8OQhwkTr9DRbf04lxcYuqjM3ktP4C7pObL2za0mCvZ4VQuZpExfza9tkguv7tCYjfoVN2Tzokr+9+aMRkv3UXUhCR94rk7tY/gPEYXzYfaES6WWfAUz/c=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by PAVPR08MB9860.eurprd08.prod.outlook.com (2603:10a6:102:2f4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.34; Thu, 19 Jun
 2025 03:54:40 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%4]) with mapi id 15.20.8857.020; Thu, 19 Jun 2025
 03:54:40 +0000
Message-ID: <9840db68-f352-4e4d-8f06-c153b6c9280c@arm.com>
Date: Thu, 19 Jun 2025 09:24:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] khugepaged: Optimize
 __collapse_huge_page_copy_succeeded() for large folios by PTE batching
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org
Cc: ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, baohua@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250618102607.10551-1-dev.jain@arm.com>
 <738669ec-a9e5-4ba1-85a7-605cb4132d05@redhat.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <738669ec-a9e5-4ba1-85a7-605cb4132d05@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0037.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::7) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|PAVPR08MB9860:EE_|DB5PEPF00014B8A:EE_|PAVPR08MB9404:EE_
X-MS-Office365-Filtering-Correlation-Id: 83ff0b7e-533a-49c6-a6e6-08ddaee5185a
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?MDlndzZTSEUwRGduZ1pXYWxuRFFaekZtVlNYMlNNTFhiM0FhWmZodVJlWlMw?=
 =?utf-8?B?czJVcEt4RWorZzdQaUxyWktaZ1hHb3pxQitoQjVIM0ljNXdmK1VncHJpS1Fj?=
 =?utf-8?B?MUxhQWFwT2R6R0FaMk0yQXJMN2dIWkpJUGs2Q3pTa210bGtlK0lQTmJEcFd0?=
 =?utf-8?B?NnhWUmI0SXdUdGtEYmVoNEh3SURydGR6Y3cvMFlZdE5nbEtSc1RGNUdERXpj?=
 =?utf-8?B?cmIwRVpvVDRtWFV2RWFqanBrWW1TZG1rOSs3aHMwam14UmxzejdxMFg2TUZi?=
 =?utf-8?B?NjZDRmgwUEkybktmU1ZyZFNXRWZlRTduWHp6bVloVlNkakNMNXNVM0hET3Fu?=
 =?utf-8?B?MnRKaFhCRzFyZEZlRUhPdURaejNFNzIzbFVNbXp0WVFmYjBDTFNGVXh2UzVN?=
 =?utf-8?B?aXdjdVN1aUxDbjlOK0NDSkNacTloNVlIRFM4cnYyV3V5UnBJZHZYWWdxQjB0?=
 =?utf-8?B?eXNsR2RsNkxXT1dZbTdRUjhEWTQ2MEcvd2lRdEZLVWp4RXY0aGtkRTFPYXZa?=
 =?utf-8?B?MXlaSW5jV0tnZ1k0aWtiM1Y2YmxvdjJOMU1pelJPNXJOdmtKTFZBWWV2UFkx?=
 =?utf-8?B?WG5acCtBMytEUGZCQy9wZXM2YzdhV0RYdFlMYWZoV2oxZ29tSzBNbVY5c2ZM?=
 =?utf-8?B?Q0FRMlNVQ25ueUgyUWs2MGlkZitTWVVoT1htUUFZTDd6RkV0Q3VTM3hBalBV?=
 =?utf-8?B?aTN3akVIWnJkSFpuODBhNGl0RDZuWktTWThpYkFmOUczcnI1VnBTNDBvbXNu?=
 =?utf-8?B?aDBTQitCeTMydStXbEV0M0hDME1jMWJaeE0yWHdQUm9oRjJUS1YzeXN6T0Jw?=
 =?utf-8?B?SG1RRDRYWFNiNlgwOUs1YktWVWN4dWk3K3c5Y0d4TU1GekdSaktmcWx3eU8v?=
 =?utf-8?B?cGZudnlvY0JPbFB6M0ErbmhjaWRhdDFZYVRPMklRaElNMnBJZXpDZ3dXS2ti?=
 =?utf-8?B?QlVuT1hZcnVvY1ZiV0dmeS8zbytMK3NkeERmMUR1TnJVRnUyN3E3T1FOdkV5?=
 =?utf-8?B?UHBWZitaVGxJd2NPMXlFQm9jU0NCTjBHOFdLVGtTQWdnZXROTUd5Zk1jL2tr?=
 =?utf-8?B?OUxSY2RLYm8rZlhvTXdNSS9MT29lOUZsSHVZVytKUDFPMzhhNkluSVFYaVUx?=
 =?utf-8?B?eUthNEdyVE9mVnBMTTlndThqd25XZ1pTdEdQYW1ja1BROHl4TjZxa2o4dHRK?=
 =?utf-8?B?WGNUM0czdkx1cDNXNjljaVJGTFRiOU5ubXQza0ViZzAzUzkyUnZHNkVkQ0du?=
 =?utf-8?B?aWh4QVhONnIvbzJFZEFqSVVQd3BrMHdzaDdvQjBja0x0YVExeGQ3elp3TEV0?=
 =?utf-8?B?T3FLLzZxMzE4MzE2RGRGRWZSY1dvcUpwQXhnZytBcTZFWldJbC8vdytQZ293?=
 =?utf-8?B?VWJkalp6enRRWG1JZXQ2TW9KZDlBeHlNbS9wWkhNbFRzZ1FJdWVkSnZWUG52?=
 =?utf-8?B?WlkxUERNdXd2V3AzRXkzcXVQMnc2T1Ayd1pYVzRRbkVqV05ncnYwSlhQTTdn?=
 =?utf-8?B?R1hGWFM2eU16V3pWbWQwcDJaZjFlQUxCd0NLRHEvUUcvbi9naHlVSGhVcktL?=
 =?utf-8?B?Q2tFTVYrNlFTTFRJYnVPR2NoUlI4SjFBSFl6RXROVVJlSHhzN3hidkZuMHpy?=
 =?utf-8?B?Y3hsMnlQaUhhTnZZaXFYUUhyODJSbUhvYzYxRkUzTjBNTHNvdFFCbEMyMWsz?=
 =?utf-8?B?Q1VNUkFEQlVvS2dTemJGUWYrSDZlZWYxRW5yamQyaHZEYmh3eVJ6ZlAvWHdU?=
 =?utf-8?B?MWZ0eFNoTEl0YTZ1QjdMVFVRZURrbXpKLzVmTnNOSzB5U01lUXBDS1RtMEpL?=
 =?utf-8?B?QkI3amYrQzgwTC81YzJOOC9YWHlocFpaU0d2SXdMNk9Udm9ycm1mcEpmM2lt?=
 =?utf-8?B?bTZmZDZNSXBaNVNVQjhPNkYxcWI3OVRQUVJBVVVLek1DalVQODg3RStqNUQr?=
 =?utf-8?Q?waxTMMBuvgk=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9860
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	35a2a7a9-bd74-481a-309b-08ddaee50459
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|35042699022|376014|14060799003|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dGkvNFBHMTJ0TVhHVWJ5NlpXYWpzSFR3SXYyYVphaFM4TE9LR0ZaeGwxZ1Ni?=
 =?utf-8?B?OTlsRUVBZ09MN3grY0w5L2lodnR4aWRsNVR5ZklQQnZOMVZNa0kwRVJIREJ0?=
 =?utf-8?B?NkdRODFEYkhDMHdYN2FGUnU0TlBMWjBTQm5kWHNtS1lQdEpHekkyYThGMHVZ?=
 =?utf-8?B?NzJTOS9HZmcvWkR4Kzg5Vktqdms3SzJEemlDTkhQbjNyckFuaDViYlA1U1U1?=
 =?utf-8?B?SzNxS0FzM28rWkx0YXpsdlZreHdnRVVCVGVMemhNNVIvbVZ6cWRTSnhWUEk3?=
 =?utf-8?B?RDBNcy85bkZTNldpZ1puVFZ3TXI0OTh0U00yRzhmQ1VyeHo2Q2FqeUplSmdm?=
 =?utf-8?B?RUg0bC8rYXJJOHExT0NIT1FlRDFQSTZ5WTk0YXJsam82Qjc3ejBWVXFibW5y?=
 =?utf-8?B?MjV2YTc0OVdPSDFUWHdrVWFOMDR3T1VqRzBJYjRLTEZCdXJjM1NUTFcvaElC?=
 =?utf-8?B?d3NLSDliN2hyTHV6SVpYclV3NTUvQSt4VElUV3ZXdHNzbFJFTkZmQkRudUFB?=
 =?utf-8?B?SzMrOU1tZkNkYlB6blk4N3NaaTQvR2g1ZzcxU0pGZDdaSytOd2V1L2IyYU93?=
 =?utf-8?B?aXpMTnQwNS94UEt3Unk4bFphcVBrcGxhNG1HR1BKd0pJNGpscCtZRlNBSElU?=
 =?utf-8?B?UVFqRm5zMitxVEtGQzdVb05uVTVlM2lWa01HNDRJUVNaQ3BjV1Z0dGlEaVY2?=
 =?utf-8?B?YVgwSGVsaWJHYzdUeHZGQnlDZjh6MDREcFMrQzAwdG1XVTFXazNtUmxrQlY3?=
 =?utf-8?B?SXBLS0NGcnI0SE03V1JjbjNsY2dCVlJWNmpNMkVwd2FiM1pnNC9zMWx4YmtS?=
 =?utf-8?B?L25UU3kwT21YaGREV1RDYVdJbzBaM0lIa0ovTzFwNkdpRXpDVkN6a1J2bXpv?=
 =?utf-8?B?MVZLc2F2bVZZeHVPbjU0WDlXOXdCaFJZelVQdlN0WnFObUh3M0Y5U0JjSkxS?=
 =?utf-8?B?ajBtSzRhY0VXSUlLbit4T1lPamFDelpMaTl1T3ZwbkY0cENLU1pRcVB0amxD?=
 =?utf-8?B?NnJBWEpqdFVvUk5OTE1GNjlxYnlsTjNUcWk1MXpveXZpV2dibXdyNFpmd3hy?=
 =?utf-8?B?VkMvQTUxVVNoWWoyRWdpVUdzRWtnYWRJNWkzeEpONEQvdU92eUNXQ0kxQ0pi?=
 =?utf-8?B?eWdKMmJnZTMzNlJZNXNnVTlWTDR6TGVPMENlMmdwRVFCSjlZVmxkKzhvc2pE?=
 =?utf-8?B?WHErSU5KTWtxL2pGTDNIbEtMZjJkUFlYeXVJc2d4UzRrK1lLWjJGcnNJQTNq?=
 =?utf-8?B?UlR1Y04xTitPNTkraDdQbm1hSi9PM2ZFa2hOdzlVRHdudnNkSmNYaWVMK0Rp?=
 =?utf-8?B?ZnNDbXFpNzFuRGxSN0xva1BadnVONkRaSk1qcmF3cVlJbzljU0pRZjlHMVc4?=
 =?utf-8?B?MnZnV1JOWmVZRXQ3RWJ4M0NiUkRmOXRzTjFTY3BTWVEycW82Nk9JMWF3dU5L?=
 =?utf-8?B?MHIvUVE4V2RnS3h5SFFMbkEyZEJYMnFkNnRXd3N1QlhhSUs2TC9LSStydGlQ?=
 =?utf-8?B?QXlxc2lHVmtTNTdzVUdTL1NrSStsVnR1cUVrU3djYTV1c1NQVUk1YXBmTHpR?=
 =?utf-8?B?d2FZQlVidjU0WEgxTTZnS05iQWsrc0dLY1RyamRqdlJRNFpsaWdZMWlUMllq?=
 =?utf-8?B?VnRkZFQ1U0pGWFlvQ3RFZlpVQTU1Q3ZvSm9lM3o0aE9xKy9YVVVjWWhlYTJS?=
 =?utf-8?B?OGlLbStRS3dpSHhHUWU3aWtqbEJucnNmT0xTY05tT2hXb1dqdktXV2tjZUZ5?=
 =?utf-8?B?N1EzY3puVmQzeDcydmZoa3B2cXhnNXhNTlZmczJ6YmhFblpOOFpKamtwMnRw?=
 =?utf-8?B?Zi9rNnFVQTJod0lkMGNaSSttcGVqV2FGanVmQllCMUIvdFdOcmY4ZmU3OENV?=
 =?utf-8?B?aXVsdHJFZG9QZU9rV2xucGxmM3FMdHF1dXArdlExaFlhaFpaRDB4ak1GeTRF?=
 =?utf-8?B?M2hSY29EM0llc1FnOEhZWTloeExJTyswTzRtdXg0L29wQzhpNVhLTlhiaDNo?=
 =?utf-8?B?NjlwN05rWldZaW8xZ1ZqNTNNN25obHAvMTlub3VxZjhPMWJhVldUZFFzbmZX?=
 =?utf-8?Q?F1MHPu?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(35042699022)(376014)(14060799003)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 03:55:13.4727
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83ff0b7e-533a-49c6-a6e6-08ddaee5185a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9404


On 18/06/25 9:44 pm, David Hildenbrand wrote:
> On 18.06.25 12:26, Dev Jain wrote:
>> Use PTE batching to optimize __collapse_huge_page_copy_succeeded().
>>
>> On arm64, suppose khugepaged is scanning a pte-mapped 2MB THP for 
>> collapse.
>> Then, calling ptep_clear() for every pte will cause a TLB flush for 
>> every
>> contpte block. Instead, clear_full_ptes() does a
>> contpte_try_unfold_partial() which will flush the TLB only for the 
>> (if any)
>> starting and ending contpte block, if they partially overlap with the 
>> range
>> khugepaged is looking at.
>>
>> For all arches, there should be a benefit due to batching atomic 
>> operations
>> on mapcounts due to folio_remove_rmap_ptes().
>>
>> No issues were observed with mm-selftests.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   mm/khugepaged.c | 31 +++++++++++++++++++++++--------
>>   1 file changed, 23 insertions(+), 8 deletions(-)
>>
>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>> index d45d08b521f6..649ccb2670f8 100644
>> --- a/mm/khugepaged.c
>> +++ b/mm/khugepaged.c
>> @@ -700,12 +700,14 @@ static void 
>> __collapse_huge_page_copy_succeeded(pte_t *pte,
>>                           spinlock_t *ptl,
>>                           struct list_head *compound_pagelist)
>>   {
>> +    unsigned long end = address + HPAGE_PMD_SIZE;
>>       struct folio *src, *tmp;
>> -    pte_t *_pte;
>> +    pte_t *_pte = pte;
>>       pte_t pteval;
>> +    int nr_ptes;
>>   -    for (_pte = pte; _pte < pte + HPAGE_PMD_NR;
>> -         _pte++, address += PAGE_SIZE) {
>> +    do {
>> +        nr_ptes = 1;
>>           pteval = ptep_get(_pte);
>>           if (pte_none(pteval) || is_zero_pfn(pte_pfn(pteval))) {
>>               add_mm_counter(vma->vm_mm, MM_ANONPAGES, 1);
>> @@ -719,23 +721,36 @@ static void 
>> __collapse_huge_page_copy_succeeded(pte_t *pte,
>>                   ksm_might_unmap_zero_page(vma->vm_mm, pteval);
>>               }
>>           } else {
>> +            const fpb_t flags = FPB_IGNORE_DIRTY | 
>> FPB_IGNORE_SOFT_DIRTY;
>> +            int max_nr_ptes;
>> +            bool is_large;
>
> folio_test_large() should be cheap, no need for the temporary variable 
> (the compiler will likely optimize this either way).

Okay.

>
>> +
>>               struct page *src_page = pte_page(pteval);
>>                 src = page_folio(src_page);
>> -            if (!folio_test_large(src))
>> +            is_large = folio_test_large(src);
>> +            if (!is_large)
>>                   release_pte_folio(src);
>> +
>> +            max_nr_ptes = (end - address) >> PAGE_SHIFT;
>> +            if (is_large && max_nr_ptes != 1)
>> +                nr_ptes = folio_pte_batch(src, address, _pte,
>> +                              pteval, max_nr_ptes,
>> +                              flags, NULL, NULL, NULL);
>
> Starting to wonder if we want a simplified, non-inlined version of 
> folio_pte_batch() in mm/util.c (e.g., without the 3 NULL parameters), 
> renaming existing folio_pte_batch to __folio_pte_batch() and only 
> using it where required (performance like in fork/zap, or because the 
> other parameters are relevant).
>
> Let me see if I find time for a quick patch later. Have to look at 
> what other similar code needs.

Perhaps that version can also have the default fpb_flags ignoring dirty 
and soft-dirty, since that is what

most code will do. So the wrapper can pass which flags to remove.

>
>> +
>>               /*
>>                * ptl mostly unnecessary, but preempt has to
>>                * be disabled to update the per-cpu stats
>>                * inside folio_remove_rmap_pte().
>>                */
>>               spin_lock(ptl);
>
> Existing code: The PTL locking should just be moved outside of the loop.
>
>> -            ptep_clear(vma->vm_mm, address, _pte);
>> -            folio_remove_rmap_pte(src, src_page, vma);
>> +            clear_full_ptes(vma->vm_mm, address, _pte, nr_ptes, false);
>
> Starting to wonder if we want a shortcut
>
> #define clear_ptes(__mm, __addr, __pte, __nr_ptes) \
>     clear_full_ptes(__mm, __addr, __pte, __nr_ptes, false)

Thanks for the suggestion! I will definitely do this cleanup as part of this

series. It is very confusing and if someone does not know, it becomes hard

to find the batched version of ptep_clear, because this does not follow the

convention we have right now - ptep_set_wrprotect -> wrprotect_ptes and

so on, the "full" comes out of nowhere.

>
>> +            folio_remove_rmap_ptes(src, src_page, nr_ptes, vma);
>>               spin_unlock(ptl);
>> -            free_folio_and_swap_cache(src);
>> +            free_swap_cache(src);
>> +            folio_put_refs(src, nr_ptes);
>>           }
>> -    }
>> +    } while (_pte += nr_ptes, address += nr_ptes * PAGE_SIZE, 
>> address != end);
>>         list_for_each_entry_safe(src, tmp, compound_pagelist, lru) {
>>           list_del(&src->lru);
>
> I think this should just work.
>
