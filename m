Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2058.outbound.protection.outlook.com [40.107.249.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B8D221FB1
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.58
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747897210; cv=fail; b=fGThbD5rOFjkjr9vmYoiTEkxYIshvxg9UJk16c/Nie2Xzibms1g7rOaWi/XW40VgX71J8gJrFj+zaLtYQ/fVHayWnTQ0PZeo8rdeeHfNE4U+AgNlNgmIacelPQPbpNrvo2eARyXDzNEPcRO4TlsxqU5+k5I4jPTBxisNjsceIJ0=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747897210; c=relaxed/simple;
	bh=1kjecdUHuQjZIEwU6jePZWLV1ocMgolIXiLErlatDaA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QmExOTh83P2K9OevVRAKNVCTgf+nxwfrkMpcGV/NzsCCk/CBbJNOO2qG/CFNMXxx2kUbim/RrX4VyWl10JBIVRrSBWLd9VyJE3dH+KFUjTUyfZIDUWJH+7IvjavCh6NtepCaeHRkhrfCi0IZKC3GNdQF6VbghNDxWXEtwbsonMU=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=G7KSYY96; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=G7KSYY96; arc=fail smtp.client-ip=40.107.249.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="G7KSYY96";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="G7KSYY96"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NAQAFt/LdSCTDXWw2VLNhiNC4gSBtYzyZzHH9Jsj+9PjPmLsK4L5g7ZNSqw0MJMxH7uzrTgtvdw3Kn3ynhAE3bLDmnZtT9sg0QEFPVSeq8IUBe+UbLepxxSRylr1DUF7WCybxf9tf3vJ8in3CFXfhG6a8emF5OP2z1mZ/caYMCjj2BEjUfHaolp8YqSYb4f35Qci67HX8f7ornP6iN+YVw61Z5Bv5Q5k5bLUgi0JZyugv7DtkihxpqeG7dpnUJ7a5jInxIdvfTVgcu4mitDwU21LQa/TrWMBZZ64Weag1w1iLgMUFBEM2xssbChhUtnp6ivUsZQCW7bO1oIxoo4NTA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45oKovsetRoMHf4Ow2mq6fuZ79JKi+fKKlDhPy6q8dI=;
 b=nPlzKyPKUtdsargNB82Cq1yWI2H09xmPD25tDc5ItP46JRd9QlNulgh0cR+hGYDYkAIMmZbdBcWfKO/30lXOEfts6rR0z2z7vxrPS5lY2tdAmXK0CL1LYuInvV2vV2bSoZkmpfgh4j46EHDmy+/6pLRZ5W3u87V9oTNYop77/5Ny/30FRGbuahf2oSDaAncgzT3Se9YaOAAYoDbv8+f1/TQkAfRaeAWxHFQGzX9yvJyZTFqWDeu3wX6KkZ7Y70qivGuXbTy7P8tchuFrYutxmOjH0Cgk9b1A9fA80MDu/37qvXxdrJMO+WHImEcbQSbzTw6aoCsZ/vT72//hhI1cGw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=45oKovsetRoMHf4Ow2mq6fuZ79JKi+fKKlDhPy6q8dI=;
 b=G7KSYY96SA9L1M57W3umLX/bcRO/I3pb6uWuiO8XHtyrCNDSlANwmcgbAm/ItG5uDunYYTQMS2KeL7HZZF6/hDD0mszEjU8KCbj23Kw4aFl5RQ5IU4mf86mM4PclSkPTyjOyRJhU/vmS9rBx/jZev1Ui245/1XJU5GwvJoheRF4=
Received: from DUZPR01CA0327.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::17) by DB3PR08MB8913.eurprd08.prod.outlook.com
 (2603:10a6:10:43a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 07:00:00 +0000
Received: from DU6PEPF00009525.eurprd02.prod.outlook.com
 (2603:10a6:10:4ba:cafe::8b) by DUZPR01CA0327.outlook.office365.com
 (2603:10a6:10:4ba::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Thu,
 22 May 2025 07:00:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009525.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via
 Frontend Transport; Thu, 22 May 2025 06:59:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eB4xthp7WXr1dYPC4yUUo0l6UoBcf3N0pM9EutSc5zbAXv5PbwkLf3TLj/ez6Rchks6qEKQSDrDh4T0kxSKsf60vx78HOEI82ixgwHkXGKNIbeGYlm9LrAeNSzWs2tmD10KQiv1KLE7SEf+9n2Gf9KTVf7nlwlDsGqzK+JuQHTNCoR0vTUS8e0OnPyjYh3H1Nigc7nZFRvWjVFJPHGW6h1kxKmPm5vrlAjhDlfPnRrJPs71Hyk70qPd6b9w6wPB31ZUcIXNWVDAj3ISwtUKsqQg4crZp2NsuYxgNkUU5vvrZwwP7jmWFT0b0LHUBCbSs+eXGfn49vlKq7XfMEGVFlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45oKovsetRoMHf4Ow2mq6fuZ79JKi+fKKlDhPy6q8dI=;
 b=Qk09OHkKjEz39pKmmnDgsurfcxtt8XPAcgXPpZtT22Bk2nGLPXg+64z8dJXYrXaTilhj6zF5PSkQCJpgiZSnH59lPNtyTSmu8QkY9+qJ73Z+zIrApFjnGW52+UHPncmn29R8m0J0hfOYjaNrQ/++TIHfQlrYZToQ6QE6SN9XnOp9NTbycoVG1WRvhVqtrpJnZvRbRwUpGw3BIBm+DInXfNc1Aq9nLmplqy34JJS2ynicTRKjcMDXlAK+omgZVgVJtnf2cyITMO7SrcxiYsTZeoX+B9vA1Ykh2StUiwzAVMOKcE2Ude8HwLlKNtpurfPw8Yu6zA9vW5/HLgTGUCloCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=45oKovsetRoMHf4Ow2mq6fuZ79JKi+fKKlDhPy6q8dI=;
 b=G7KSYY96SA9L1M57W3umLX/bcRO/I3pb6uWuiO8XHtyrCNDSlANwmcgbAm/ItG5uDunYYTQMS2KeL7HZZF6/hDD0mszEjU8KCbj23Kw4aFl5RQ5IU4mf86mM4PclSkPTyjOyRJhU/vmS9rBx/jZev1Ui245/1XJU5GwvJoheRF4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AS8PR08MB6519.eurprd08.prod.outlook.com (2603:10a6:20b:31c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 06:59:27 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 06:59:27 +0000
Message-ID: <413c580e-52c0-480a-937e-94f242a71196@arm.com>
Date: Thu, 22 May 2025 12:29:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] mm: Optimize mprotect() by PTE batching
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
 <20250519074824.42909-4-dev.jain@arm.com>
 <b3064b82-dcea-4b88-940b-9419d869a39a@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <b3064b82-dcea-4b88-940b-9419d869a39a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::19) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AS8PR08MB6519:EE_|DU6PEPF00009525:EE_|DB3PR08MB8913:EE_
X-MS-Office365-Filtering-Correlation-Id: 404d5c9c-28a8-4426-8b7f-08dd98fe44ac
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?S1BLK2RkN2FDYzBuWUdzOU5hMzNCUHNWTm00WWk2K2xKeVFQSUJ4dTZGTTEy?=
 =?utf-8?B?Wk9DR2lBOWRwVDlGamN1YWwrVHh5K21SRnAvN0xrMzlHU3h4R0dqSEVCQ0FJ?=
 =?utf-8?B?MlNRczJobFNzd0xOQkZnS0F4TWdFQXRydTlzUm12T1IwSExOQ09RM0JWdDg3?=
 =?utf-8?B?QjlUL0F5M2RySkJRT01CK2Ivem94cGo3Q0FlcGlHRUo0Q0g4bGRLWHIvMW1v?=
 =?utf-8?B?ZTlCNXMxeU1Bamppb08xOW00S2dWNkVKTnZaQWlIOVpvRkhXUjJRZ1RPQlpm?=
 =?utf-8?B?NUE2bEFRSVZNNTl6THoyeE4zeVdFcnNFS1BNdTAwUUJpUHNEUS85STZDblYz?=
 =?utf-8?B?TnVlakxiLzBHVE1kUEVTUFcrby9lano0WEZLZk9QMGFjajl4Nk9RRVlqZ3pC?=
 =?utf-8?B?cWYvWjRGeGQ3R1ozOEh4MjF4Y3RVYkpSek1DLzNGS1QzVHdBL3Bwd2lmcFFt?=
 =?utf-8?B?RkRkU0Y0Uno1cURjSmhZU2JnNGxIT3VmRzV6TG9LMjJOUmxRbmlHR3lEZU9u?=
 =?utf-8?B?V2VIRW4xQXNZYUVOemlJVkFEeXR6a25DY3RpUVp1VjVKMDBWR2ZUcGYvL01v?=
 =?utf-8?B?clhtdXNQNTJkYlU4TXFXOG03OTVMcUZLZjdGZGpJZk5EVHQwd2lqNHBJUFdm?=
 =?utf-8?B?Sm9CRGowdVNqT2pvUTVLbThMVzRXNlJaUlpFZ0pLTUxaVTFjUmxwSGFrOHFJ?=
 =?utf-8?B?cGt4MlNNYlRzRHREVHVwZGptdWVHMmpMUWZVYXp2WkJpQnNNelByUFpsVXVa?=
 =?utf-8?B?NnpsTmgxMVBxZ2krNjNnblNkZjVYMC9mZnVsYktGcllNMVhTeUxpUDZwZWpY?=
 =?utf-8?B?RkpNb1lXWWNaalRST3JOV0g0WEJ0anRkZ0VQM1NKNzlCRStoZUt4bW1ldng4?=
 =?utf-8?B?TDNPOVo5Q3pBRmdDZDlXZ0xMYTcxNERzOHJaSTd1ZEErUU94ZTNUL2VYM1Qw?=
 =?utf-8?B?dkZ4VmF2SEE5ZjVoVHZDQU5xZlQzRmoxT2g5bjJpVW1tR1EvdXE3bGJYNG5U?=
 =?utf-8?B?RlZLQ3VCMVZaeVkyVFFvZUNOSWhLNHFmUGZNcWpMcWxHaGlTb2pKVnBrejM0?=
 =?utf-8?B?SHRnUkJFajR0d0lpalBhSFBLZ0FDU3RYeFVISFNpajJIbW51ZEhOV2tDTGJJ?=
 =?utf-8?B?TXROejM2dzU5c252cWFsQ3ByY3hBQkVKRWphQkdxTnd4T1FhV1BueE1XOUFp?=
 =?utf-8?B?aG5lWmR1a0wwTEZBSTIvRjNJNUNZRUoyUkpKLzJNakpNdnEwK3ozS3gwQm1B?=
 =?utf-8?B?U0cwK21tNFZuS05ZOWVBcFQrMTFmSTB5cklEd2V0K0xXUC9DMWdvbk9hUFB1?=
 =?utf-8?B?d2QvUk5aemZaa00vTTEwUkZ5TTMwSmQzcFJnZno0UnN4V25aOUJvdHZJVGRG?=
 =?utf-8?B?M3BPUU9BR01LUWtLdTNuQVBXbDZOQ3huNFpkczlqVmVtRWcrYStKazA1NGsr?=
 =?utf-8?B?Y3c2VnVCZ2NSSVp0MWJ3ZU5kWjlJd0hyVWlsMzZvT1dicTlYZ09ObVpxVjlZ?=
 =?utf-8?B?UkxnQUNTNk9HL05KY3JkSGU1MHF0cENLYUpYcEUyOTBUOHVnNFNTV1RGenhI?=
 =?utf-8?B?Rkw1UTR0NHBiMGN1cmNUUjkxMjJ2SVE0OUYrcmR0eVg3dmdEQ3p3bm9BbTE3?=
 =?utf-8?B?d3crQlppU1g4T2R6b1ZCQTZpK2lyZ3o2bi9QNDIxMFNxR3h3QThLL0dHQXJN?=
 =?utf-8?B?aFdqSHc3TEg4NlZ1T1hPalUxb2g5VGVxV2gwb05oM010R3pyam91UnZHcmhV?=
 =?utf-8?B?Uzc1UnJTc2w0d2VjbWhMTjZlRGE0OHpzWW50VzZBck14eDhraGJZaHB2NlAr?=
 =?utf-8?B?TmV4MnVqM0Zyb2cwazQ3aisxNDIwQnZXdlV0ZDZiSnRVRkU4UzcrSWF1UVYz?=
 =?utf-8?B?VHJ3a2NIS3lmYkV5UFF5dlQ5dEltbFF0aDRZWjArZkpDeWc9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6519
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009525.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5db11151-75c8-48c4-f4fc-08dd98fe312a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|36860700013|1800799024|376014|14060799003|82310400026|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VjBJTWVpNklnTlZBMUdpMGFaR2ZKU2IrbVRsbXAybVp5UWVVWGFJVi8zV2tw?=
 =?utf-8?B?c1dPYXN5clViMWtrK1pBQkoxYWJrZWZzeTlrNG9jaG9McGpqcnZlSEpQbVRE?=
 =?utf-8?B?enN0cVk5K3FxL3hPeDFNcFY5QjVRRWNDdFU4Tmh0UzNrK1hxVFlUSmUveHI5?=
 =?utf-8?B?aUZlSXhoSnhoaCtlU2kwOE5CaEd4VlpRcHlMWmcza1dPcll0QWVUekx0Q2dy?=
 =?utf-8?B?ZVdOVGtBM3hFa0wvS3F4TmVDZVFkTGN1aE9PSmNyVVNJbmtST21taUpVSDJi?=
 =?utf-8?B?R2NXbWhqaWMxME1KWFY0RnhBNzdpcmdUMDQ4cjlteVdYdmIzMk1PaUYxRVlm?=
 =?utf-8?B?RmdnWVZyQ2JUaitmM1Q4RjlkV0JOTVFaa0V5Z1NkOHgydTlPclBqZWhSMUs5?=
 =?utf-8?B?U084UUNGSWx2aDRMNk9zeVVYd3gyVmcxajFvVnlOQ3VDMWV5NGhHK0N0eTRv?=
 =?utf-8?B?WGpJRElEWHJRZ0dtUkRMN0ZXOUY3azNwMTduMlUwMFJaQmpscEdFeDB0YVMy?=
 =?utf-8?B?OXcwa2RhZUg3akU2TXdBMWlhZ3dlMFo5YlNONG9uYmtIRGR4UVYwZU9kdHNV?=
 =?utf-8?B?TG9MRk5Db005OWt3Q3luaHlFazNzYTRRaDRRaXVRZlg2NitkZTVuMG1qN2NM?=
 =?utf-8?B?QVJRS1JnQlRMSEFKZkJiOUJJdWRSNDA0YXQrVzRlV0V4NXZSeElpL0VIbTdX?=
 =?utf-8?B?bCtEY0FSaGkvLzNCanF3RS9wQ2ZYbVVwbWNxYlFZRnB1RVBiYWlpeHJneXNN?=
 =?utf-8?B?TkxxbitmRE4yNW5WNk1jLzRzbUZqbHVVb1ExbitSUnRvMHJxR2ZlUGNsbVhT?=
 =?utf-8?B?NndHVUw3Qit1YXpkNWNWaXI4SzFOV2dROVFNbFdYK250c01xZGRjc0xhN0hn?=
 =?utf-8?B?NHlDY08xbExSb01NdEd1QndpSjFMQlZQRE5qOEt4YjZRalF6UFBHSGNJSnN2?=
 =?utf-8?B?L0Fia2UwUG5CZ1VHcWNEMlBwdmd5YTlyT2ZrYVN4aEgwUnZZbi9KTkdsTHk1?=
 =?utf-8?B?TVJxWWNIVzV1MmNIOVFtR0V0clk2VHhpVk44Q2hiMjc3ZEpvcWE1S3hSeDU3?=
 =?utf-8?B?L05rUHFudjJja21nTm5lbnNmSldqY20vM0hGcCtlYXNqYU9ZWFhLeW8zWmJI?=
 =?utf-8?B?bDdKYVdxR1duUU1GY1JQNXhNVTVocU1MTklYaUpnbUllcE1vTWFHTGk2dk96?=
 =?utf-8?B?VDkveFFKREN2Yk9CRnRLVTFKbnMyT2NCV2hURFNZK08rQ2dZODhMSjVvR2tY?=
 =?utf-8?B?cTk0Ryt5V2dhTHZFTWRsNDdKWXN1b3RIbnNqSkZaelcrTHVDRDhLU1czVitV?=
 =?utf-8?B?dHY2OGpHSUpuUkFITkJzS3gzcWdIdVY4UDlBL3JQT05UN1BWNytEZUx0Mzl0?=
 =?utf-8?B?d1NlRHpiSUxMSDd5TVZXMUdFdXREM3Fzak4yU2JkR3p4Y0ovQm9uSUFkOEJK?=
 =?utf-8?B?TWZEZWR5N1lnUXBZOEdsd1lYQ3c0cnYrN2o1bWRWUjB2cFFMOE9VVzlJRzhL?=
 =?utf-8?B?NUMvZDYxeTQwU0V3aFJxdWM4L1daakUzalJnanhrbEUvWWZwS2xzdlNFcSt5?=
 =?utf-8?B?MWFYWjJhRHBVb2lXSHYyMVZIaVBSTktCVVJNSHRXZ29zZ1VVV3ZTNUVkczA0?=
 =?utf-8?B?U01nKzhZdDk1ZHJKWGh3RkREUjBjbG5PcmxraUpyTnphWlVMZk05TkNaZ2tt?=
 =?utf-8?B?YytLWWhFajcwT1Q0aUx2U2NNNElDeVRxNjVKT3ROZDJmdVNwWGlFU09HY0E4?=
 =?utf-8?B?dFl0c1JnZit2YmxadDVHZFJ6T2RIbEtmVjNCM3FYL3FrYlEwWForeit2RUN6?=
 =?utf-8?B?Mkg0ZFVOM0ZUNTVoV1l4eFpWemhwQzV6RUYrb2VlM2cza3JNNlg3TURhRXIx?=
 =?utf-8?B?V1V6QUxZOGw3ZFRleTlYTmdLTzlZWVdNNENtNTl4NDVtSldKWDJUUVJYZ0lX?=
 =?utf-8?B?d1ZaT0d4R01RN0kwcUNoRTVYYlhienpLL2d5aW1vTXM4cUs1VGc1SFkvSXlR?=
 =?utf-8?B?c3dUck5RMDVRL0thSVFSODRuSVkydEh4RGpTcW1DaHo1YlNITEpMYnNoWnpM?=
 =?utf-8?Q?se1KQV?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(1800799024)(376014)(14060799003)(82310400026)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 06:59:59.6671
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 404d5c9c-28a8-4426-8b7f-08dd98fe44ac
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009525.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8913


On 21/05/25 6:56 pm, Ryan Roberts wrote:
> On 19/05/2025 08:48, Dev Jain wrote:
>> Use folio_pte_batch to batch process a large folio. Reuse the folio from prot_numa
>> case if possible. Since modify_prot_start_ptes() gathers access/dirty bits,
>> it lets us batch around pte_needs_flush() (for parisc, the definition includes
>> the access bit).
> parisc's pte_needs_flush() is a different (static) function, just coincidentally
> named - it takes different arguments.


Oh my god I'm *that* stupid :(


>
> But powerpc and x86 both specialize it and they consider the dirty bit. Both
> implementations look to me like they will function correctly but it is a bit
> ugly. They both conclude that if there is no change or if dirty has gone from
> clear to set, then no flush is needed. (flush only needed when dirty goes from
> set to clear). Given after your change, oldpte may have dirty set when it wasn't
> really set for the pte in question that means the function could detect no
> change when really its a clear -> set change; it gives the same answer in both
> cases so it's safe. Perhaps a bit fragile though...


Yeah I was wondering about the fragility too. There is a hard dependency 
between

arch private functions doing a very specific thing so that our batching 
does not break.

Best we can do is add a comment explaining this, I think.


>
>> For all cases other than the PageAnonExclusive case, if the case holds true
>> for one pte in the batch, one can confirm that that case will hold true for
>> other ptes in the batch too; for pte_needs_soft_dirty_wp(), we do not pass
>> FPB_IGNORE_SOFT_DIRTY. modify_prot_start_ptes() collects the dirty and access bits
>> across the batch, therefore batching across pte_dirty(): this is correct since
>> the dirty bit on the PTE really is just an indication that the folio got written
>> to, so even if the PTE is not actually dirty (but one of the PTEs in the batch is),
>> the wp-fault optimization can be made.
>> The crux now is how to batch around the PageAnonExclusive case; we must check
>> the corresponding condition for every single page. Therefore, from the large
>> folio batch, we process sub batches of ptes mapping pages with the same PageAnonExclusive
>> condition, and process that sub batch, then determine and process the next sub batch,
>> and so on. Note that this does not cause any extra overhead; if suppose the size of
>> the folio batch is 512, then the sub batch processing in total will take 512 iterations,
>> which is the same as what we would have done before.
> This commit log could do with some reformatting; blank lines between paragraphs
> and break at whatever the usual git commit log char limit is (72 chars?).


Sure, and I think it is 75 chars.


>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   include/linux/mm.h |   7 ++-
>>   mm/mprotect.c      | 126 +++++++++++++++++++++++++++++++++++----------
>>   2 files changed, 104 insertions(+), 29 deletions(-)
>>
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index 43748c8f3454..7d5b96f005dc 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -2542,8 +2542,11 @@ int get_cmdline(struct task_struct *task, char *buffer, int buflen);
>>   #define  MM_CP_UFFD_WP_ALL                 (MM_CP_UFFD_WP | \
>>   					    MM_CP_UFFD_WP_RESOLVE)
>>   
>> -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>> -			     pte_t pte);
>> +bool can_change_ptes_writable(struct vm_area_struct *vma, unsigned long addr,
>> +			     pte_t pte, int max_len, int *len);
>> +#define can_change_pte_writable(vma, addr, pte)	\
>> +	can_change_ptes_writable(vma, addr, pte, 1, NULL)
> nit: add an extra tab for readability:
>
> #define can_change_pte_writable(vma, addr, pte)	\
> 		can_change_ptes_writable(vma, addr, pte, 1, NULL)


Sure.


>
>> +
>>   extern long change_protection(struct mmu_gather *tlb,
>>   			      struct vm_area_struct *vma, unsigned long start,
>>   			      unsigned long end, unsigned long cp_flags);
>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>> index 124612ce3d24..6cd8cdc168fa 100644
>> --- a/mm/mprotect.c
>> +++ b/mm/mprotect.c
>> @@ -40,25 +40,36 @@
>>   
>>   #include "internal.h"
>>   
>> -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>> -			     pte_t pte)
>> +bool can_change_ptes_writable(struct vm_area_struct *vma, unsigned long addr,
>> +			     pte_t pte, int max_len, int *len)
>>   {
>>   	struct page *page;
>> +	bool temp_ret;
>> +	bool ret;
>> +	int i;
>>   
>> -	if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE)))
>> -		return false;
>> +	if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE))) {
>> +		ret = false;
>> +		goto out;
>> +	}
>>   
>>   	/* Don't touch entries that are not even readable. */
>> -	if (pte_protnone(pte))
>> -		return false;
>> +	if (pte_protnone(pte)) {
>> +		ret = false;
>> +		goto out;
>> +	}
>>   
>>   	/* Do we need write faults for softdirty tracking? */
>> -	if (pte_needs_soft_dirty_wp(vma, pte))
>> -		return false;
>> +	if (pte_needs_soft_dirty_wp(vma, pte)) {
>> +		ret = false;
>> +		goto out;
>> +	}
>>   
>>   	/* Do we need write faults for uffd-wp tracking? */
>> -	if (userfaultfd_pte_wp(vma, pte))
>> -		return false;
>> +	if (userfaultfd_pte_wp(vma, pte)) {
>> +		ret = false;
>> +		goto out;
>> +	}
>>   
>>   	if (!(vma->vm_flags & VM_SHARED)) {
>>   		/*
>> @@ -68,7 +79,19 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>>   		 * any additional checks while holding the PT lock.
>>   		 */
>>   		page = vm_normal_page(vma, addr, pte);
>> -		return page && PageAnon(page) && PageAnonExclusive(page);
>> +		ret = (page && PageAnon(page) && PageAnonExclusive(page));
>> +		if (!len)
>> +			return ret;
>> +
>> +		/* Check how many consecutive pages are AnonExclusive or not */
>> +		for (i = 1; i < max_len; ++i) {
>> +			++page;
>> +			temp_ret = (page && PageAnon(page) && PageAnonExclusive(page));
>> +			if (temp_ret != ret)
>> +				break;
>> +		}
>> +		*len = i;
>> +		return ret;
>>   	}
>>   
>>   	VM_WARN_ON_ONCE(is_zero_pfn(pte_pfn(pte)) && pte_dirty(pte));
>> @@ -80,21 +103,55 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>>   	 * FS was already notified and we can simply mark the PTE writable
>>   	 * just like the write-fault handler would do.
>>   	 */
>> -	return pte_dirty(pte);
>> +	ret = pte_dirty(pte);
>> +
>> +out:
>> +	/* The entire batch is guaranteed to have the same return value */
>> +	if (len)
>> +		*len = max_len;
>> +	return ret;
>>   }
>>   
>>   static int mprotect_batch(struct folio *folio, unsigned long addr, pte_t *ptep,
>> -		pte_t pte, int max_nr_ptes)
>> +		pte_t pte, int max_nr_ptes, bool ignore_soft_dirty)
> We'll almost certainly want more flags here in future. I wonder if it's cleaner
> just to pass "fpb_t extra_flags" here instead of the bool, then OR them in. You
> can pass 0 or FPB_IGNORE_SOFT_DIRTY at your 2 callsites. No strong opinion
> though.


I think your suggestion is better.


>
>>   {
>> -	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>> +	fpb_t flags = FPB_IGNORE_DIRTY;
>>   
>> -	if (!folio_test_large(folio) || (max_nr_ptes == 1))
>> +	if (ignore_soft_dirty)
>> +		flags |= FPB_IGNORE_SOFT_DIRTY;
>> +
>> +	if (!folio || !folio_test_large(folio) || (max_nr_ptes == 1))
>>   		return 1;
>>   
>>   	return folio_pte_batch(folio, addr, ptep, pte, max_nr_ptes, flags,
>>   			       NULL, NULL, NULL);
>>   }
>>   
>> +/**
>> + * modify_sub_batch - Identifies a sub-batch which has the same return value
>> + * of can_change_pte_writable(), from within a folio batch. max_len is the
>> + * max length of the possible sub-batch. sub_batch_idx is the offset from
>> + * the start of the original folio batch.
>> + */
>> +static int modify_sub_batch(struct vm_area_struct *vma, struct mmu_gather *tlb,
>> +		unsigned long addr, pte_t *ptep, pte_t oldpte, pte_t ptent,
>> +		int max_len, int sub_batch_idx)
>> +{
>> +	unsigned long new_addr = addr + sub_batch_idx * PAGE_SIZE;
>> +	pte_t new_oldpte = pte_advance_pfn(oldpte, sub_batch_idx);
>> +	pte_t new_ptent = pte_advance_pfn(ptent, sub_batch_idx);
>> +	pte_t *new_ptep = ptep + sub_batch_idx;
>> +	int len = 1;
>> +
>> +	if (can_change_ptes_writable(vma, new_addr, new_ptent, max_len, &len))
>> +		new_ptent = pte_mkwrite(new_ptent, vma);
>> +
>> +	modify_prot_commit_ptes(vma, new_addr, new_ptep, new_oldpte, new_ptent, len);
>> +	if (pte_needs_flush(new_oldpte, new_ptent))
>> +		tlb_flush_pte_range(tlb, new_addr, len * PAGE_SIZE);
>> +	return len;
>> +}
>> +
>>   static long change_pte_range(struct mmu_gather *tlb,
>>   		struct vm_area_struct *vma, pmd_t *pmd, unsigned long addr,
>>   		unsigned long end, pgprot_t newprot, unsigned long cp_flags)
>> @@ -106,7 +163,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   	bool prot_numa = cp_flags & MM_CP_PROT_NUMA;
>>   	bool uffd_wp = cp_flags & MM_CP_UFFD_WP;
>>   	bool uffd_wp_resolve = cp_flags & MM_CP_UFFD_WP_RESOLVE;
>> -	int nr_ptes;
>> +	int sub_batch_idx, max_len, len, nr_ptes;
>>   
>>   	tlb_change_page_size(tlb, PAGE_SIZE);
>>   	pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
>> @@ -121,10 +178,12 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   	flush_tlb_batched_pending(vma->vm_mm);
>>   	arch_enter_lazy_mmu_mode();
>>   	do {
>> +		sub_batch_idx = 0;
>>   		nr_ptes = 1;
>>   		oldpte = ptep_get(pte);
>>   		if (pte_present(oldpte)) {
>>   			int max_nr_ptes = (end - addr) >> PAGE_SHIFT;
>> +			struct folio *folio = NULL;
>>   			pte_t ptent;
>>   
>>   			/*
>> @@ -132,7 +191,6 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   			 * pages. See similar comment in change_huge_pmd.
>>   			 */
>>   			if (prot_numa) {
>> -				struct folio *folio;
>>   				int nid;
>>   				bool toptier;
>>   
>> @@ -180,7 +238,8 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   				    toptier) {
>>   skip_batch:
>>   					nr_ptes = mprotect_batch(folio, addr, pte,
>> -								 oldpte, max_nr_ptes);
>> +								 oldpte, max_nr_ptes,
>> +								 true);
>>   					continue;
>>   				}
>>   				if (folio_use_access_time(folio))
>> @@ -188,6 +247,11 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   						jiffies_to_msecs(jiffies));
>>   			}
>>   
>> +			if (!folio)
>> +				folio = vm_normal_folio(vma, addr, oldpte);
>> +
>> +			nr_ptes = mprotect_batch(folio, addr, pte, oldpte,
>> +						 max_nr_ptes, false);
>>   			oldpte = modify_prot_start_ptes(vma, addr, pte, nr_ptes);
>>   			ptent = pte_modify(oldpte, newprot);
>>   
>> @@ -209,15 +273,23 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   			 * example, if a PTE is already dirty and no other
>>   			 * COW or special handling is required.
>>   			 */
>> -			if ((cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
>> -			    !pte_write(ptent) &&
> Don't you need to keep the !pte_write(ptent) condition here? No need to sub-
> batch if write is already set.


Ah right, the permissions for the entire batch are the same, so 
pte_write(ptent) will

return the same value for all ptes in the batch, so we can batch through 
this too. I

thought that we may skip on the wp-optimization for other ptes if the first

pte is writable and the others are not, but that won't happen because we 
are batching.


>
>> -			    can_change_pte_writable(vma, addr, ptent))
>> -				ptent = pte_mkwrite(ptent, vma);
>> -
>> -			modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr_ptes);
>> -			if (pte_needs_flush(oldpte, ptent))
>> -				tlb_flush_pte_range(tlb, addr, PAGE_SIZE);
>> -			pages++;
>> +			if (cp_flags & MM_CP_TRY_CHANGE_WRITABLE) {
>> +				max_len = nr_ptes;
>> +				while (sub_batch_idx < nr_ptes) {
>> +
>> +					/* Get length of sub batch */
>> +					len = modify_sub_batch(vma, tlb, addr, pte,
>> +							       oldpte, ptent, max_len,
>> +							       sub_batch_idx);
>> +					sub_batch_idx += len;
>> +					max_len -= len;
>> +				}
>> +			} else {
>> +				modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr_ptes);
>> +				if (pte_needs_flush(oldpte, ptent))
>> +					tlb_flush_pte_range(tlb, addr, nr_ptes * PAGE_SIZE);
>> +			}
> This if/else block and modify_sub_block() is all pretty ugly. I wonder if
> something like this would be neater:
>
> 			use_sub_batch = (cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
> 					!pte_write(ptent) &&
> 					LIKE_can_change_pte_writable(vma, addr, ptent, folio);
>
> 			while (nr_ptes) {
> 				if (use_sub_batch)
> 					sub_nr_ptes = sub_batch(...);
> 				else
> 					sub_nr_ptes = nr_ptes;
>
> 				modify_prot_commit_ptes(vma, addr, pte, oldpte,
> 							ptent, sub_nr_ptes);
> 				if (pte_needs_flush(oldpte, ptent))
> 					tlb_flush_pte_range(tlb, addr,
> 						sub_nr_ptes * PAGE_SIZE);
>
> 				addr += sub_nr_ptes * PAGE_SIZE;
> 				pte += sub_nr_ptes;
> 				oldpte = pte_advance_pfn(oldpte, sub_nr_ptes);
> 				ptent = pte_advance_pfn(ptent, sub_nr_ptes);
> 				nr_ptes -= sub_nr_ptes;
> 				pages += sub_nr_ptes;
> 			}
>
> Where:
>
>   - LIKE_can_change_pte_writable() is similar to can_change_pte_writable() but
>     does everything except checking the per-page exclusive flag. Note that we
>     already have the folio so can pass that rather than calling vm_normal_page()
>     again.
>
>   - sub_batch() can be passed the folio and the index of the first page within
>     the folio and the max number of pages to check (nr_ptes). Then returns the
>     number of pages where exclusive flag is the same.
>
> Obviously they both need better names...
>
> Thanks,
> Ryan
>
>
>> +			pages += nr_ptes;
>>   		} else if (is_swap_pte(oldpte)) {
>>   			swp_entry_t entry = pte_to_swp_entry(oldpte);
>>   			pte_t newpte;
