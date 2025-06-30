Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011045.outbound.protection.outlook.com [40.107.130.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE436BFC0
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.45
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751278010; cv=fail; b=LIEZaGvyHLSt7Q8jTWUSbcHpqLSP745Y2UFAfhe2vZzZ0HJ/KcVmTLoPvft5fLDEPVna43BnetskD5mpAbP4q3aaDMJs27c9LSCoV3fOpxQyKyT1J2q2nE8BpWxKSveYocwSODTvOtGrMFZuwY0KKKpROkKdzczljy2hA3S2/e0=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751278010; c=relaxed/simple;
	bh=NWE1OLsAiFhA5O5mKXeAnO4kXNQQC/k8XcoQerBwyVw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HgiPSGkSFga9OthUM1deY8eQdZjpkSW3vwWcXy0dmeBCA+14Vj2Tf26dE5/IcoS5j6Rm4xNXm6ZDKBxdAvSvi10wc2u37cteO0I6Rj6ilJhbJzhCdSM0ywz8C6nWgpZ7W5w6lddDFYihUF7apntIPh8Vc4daHkzXHDZpfuFF6Gg=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gHqRXVOK; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gHqRXVOK; arc=fail smtp.client-ip=40.107.130.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gHqRXVOK";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gHqRXVOK"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=aeyCY16s1NfZHb9/ZP+YOa6qozUmx3wWlHx7VW1MEJbXutQJTM2oTRbU91F3U2XB7yfY6X8OVmMvVzKqgvK54LsT47Ux0efxbtATj1bcjtYVksjr7lzBUZmgFmcGnLDuV5/cDTfRXQJvfrM3p8Wk9vfrOjamYh5Fz3gaWxnfRB9vbx2NxwvUjGGy7cTZTAUOl01gDmQQxGb+EAH53qRpkQlaWCpsCTlT0FtnuYEKNPW8IK+QaowRkRZ4IWuPT9Ojp3IFY3ITLWZYZ04wBTOMkGk3Yzi0Kn2ZdMM5vbCLnJXDmdd70q2/Qr1blKUesyqkKC3QUYfKbLjNZkjuVimotA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sYK1TqbshNYFoaVS4eGJJxsvwJcYymiHl0uzUrRSkNs=;
 b=qTcPNN0KQPmRU23FZrrOZoI9zUYpJ4wYcN/8siTy/Vini2OQhxT6Amoytz3VHJLYSZauMXWGRYCv54lkYBrFc63t36MfeC2FRazi7OSlLDRZvDIbN1/2/r0LDdvu/oRkDH/GFYygJfUD3oe2Mw/7O0KiuWIzTmot1zOLX+/JJ+GsxrI4RxqfTJlixXGZN0X2Bpgjk2KkMSXaxavlfcBZodTgKvbrkfKiXah31RZJPygrsgws6XxY3IISNrDYaydlIz86MmO3w0+5EdPT/UbJE0g3fU+HtsInd2WvZiSN1Rp7MQ9YasY0DKkkgYJXyYTr/YvZx5Nz8Prv2TrGNzV/gA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYK1TqbshNYFoaVS4eGJJxsvwJcYymiHl0uzUrRSkNs=;
 b=gHqRXVOKKfIsT/Vs9LGUQkTdyqqVX1uVk5BKya28pFMwMv86VE3V40BUkZCMYv7Au3+FuElnI10cQLknE4YMY3VZAZGbmGpOM7ShNdWz+tJeQfu423v/Fv9DrBBz3fdvEMh14VPwCvt2uVNqvDmnVZGZtxc1Ci4H+ptPMGbOnJc=
Received: from PR1P264CA0010.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::15)
 by PR3PR08MB5612.eurprd08.prod.outlook.com (2603:10a6:102:8f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Mon, 30 Jun
 2025 10:06:41 +0000
Received: from AM2PEPF0001C70B.eurprd05.prod.outlook.com
 (2603:10a6:102:19e:cafe::c7) by PR1P264CA0010.outlook.office365.com
 (2603:10a6:102:19e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.30 via Frontend Transport; Mon,
 30 Jun 2025 10:06:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C70B.mail.protection.outlook.com (10.167.16.199) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Mon, 30 Jun 2025 10:06:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tkGeyUT3HxeO2WSSJ75y85dhHKbKGEZilctNyYGg6Z84v5KF5jQBv9chR6hHUXYqsq+rhOnFAFc00PQq6h3g2QN1zWYTPdiGWZ9qhOWC1EwgP44kfYAsSkYR4fsm6fBEtvYjqxpaeDe0poakyDPsdSeepizFYDuYHLTxcBiLni28XviXzRd7VsSNlhcvRhoahCuvbFhfxjlTwbrlL0LpwrjBk5C2+T76CdFVtHMifkdML5RfEh0wzNuL4mtlg5cMqzqcQiMZGMVSzLmIfWti33cvx6qfRbM/mo7UNfVcvrEiyaJn7G9iG2euokcHN2TcJaUlTN3oFJkux01k7XMmOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sYK1TqbshNYFoaVS4eGJJxsvwJcYymiHl0uzUrRSkNs=;
 b=rCisCukmt3BawdVybc9qRiP1qbL9yksFVIYhk9QyleS/2KQRUhCcMf8fjyY/yJT/K5GcOaEse1DmNnu2gSeeQk+05kdck1nPWE2T6P/5IXbUf2FbDCUh+V8ySP2Zg83mREFoj3Q+C11yGiUW7tF6WQihk5JcwABYLjKkLWEpnVwEwsGQXDb8kX8KKaidtCLfeCVz0YmHB2nLDrGMPKJhTkl5xrAa0rIf+P/Yckhlw7GJ/hGkaotiVsZ2Y7YNeZa6ngID+YeyklmIQCAXhWM5ygnsEhY4py7SM8EwHvUQMWdOOoqra6qnkuzMU//zHnY52XgfZ4ed6UA7MqdxfSASNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYK1TqbshNYFoaVS4eGJJxsvwJcYymiHl0uzUrRSkNs=;
 b=gHqRXVOKKfIsT/Vs9LGUQkTdyqqVX1uVk5BKya28pFMwMv86VE3V40BUkZCMYv7Au3+FuElnI10cQLknE4YMY3VZAZGbmGpOM7ShNdWz+tJeQfu423v/Fv9DrBBz3fdvEMh14VPwCvt2uVNqvDmnVZGZtxc1Ci4H+ptPMGbOnJc=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DB9PR08MB9707.eurprd08.prod.outlook.com (2603:10a6:10:45d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Mon, 30 Jun
 2025 10:06:06 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 10:06:05 +0000
Message-ID: <bcbf5e12-34fd-4bd9-ba6b-88118e44af10@arm.com>
Date: Mon, 30 Jun 2025 15:35:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] mm: Optimize mprotect() for MM_CP_PROT_NUMA by
 batch-skipping PTEs
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
References: <20250628113435.46678-1-dev.jain@arm.com>
 <20250628113435.46678-2-dev.jain@arm.com>
 <e029c030-2b0c-412d-b203-4342250b2deb@arm.com>
 <aa35a908-e4e0-4ea7-b626-181619fd2e1e@arm.com>
 <4553060f-0e9b-4215-8024-30a473636055@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <4553060f-0e9b-4215-8024-30a473636055@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::20) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DB9PR08MB9707:EE_|AM2PEPF0001C70B:EE_|PR3PR08MB5612:EE_
X-MS-Office365-Filtering-Correlation-Id: 27763d74-70ca-4188-7ecb-08ddb7bdce8e
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?dWMxUElVcENGK21LdEYwMjhSb2R2ejhUSDZrRVErWUgxczJONktZS1hCeVlw?=
 =?utf-8?B?bjErUGFtTkVLTTRWUTRLdmlTUWYyZkJOZzEzSC9NUGhTS0l6UWllMXBoc3RY?=
 =?utf-8?B?NnQwb0Z4cHJidXNUMWU1MWVLcGIzSTZuZFJ5WWxSVUgrRC9aejBsWE91UHRn?=
 =?utf-8?B?VUVvUDhwSU5KZGViSTRobUpYbHFxZVEzOEtlYVBrbVBDcDI4MXhIYzlCSCtZ?=
 =?utf-8?B?MFQwVFRrV3BZV2JEUkVWQ0Z2L1hwc3MyZndHMlVjY1lDM3paUkhnZ2prU3pO?=
 =?utf-8?B?UlZKdnkvTTNXMGluTzZla1NYMitMd0c0VUVSWXkxL0RPS2FyQ1JCNTR1ZXNq?=
 =?utf-8?B?TWxpeUk5dXR3akNhekcxNzREdS9PVVRpR0dFejFVQThGS1k2YVcvcHRsQmpV?=
 =?utf-8?B?VlZOZzltTGc4M3l2OEx5akU2SGtzUFJ3RC9BSDNCYVNhbG1uRTV5N2JZMkM4?=
 =?utf-8?B?cXJ4d1FwVkVBekFLZ0FoTjZwK0dOYm1pQmFDbDNOajI1dG9MMzJ1dVZCVURT?=
 =?utf-8?B?WmEwRlVUV0FRK1RJVTE1T0V5UzVJNnFlMVE4T1lZODc3dXRGeThhcnZXVmxh?=
 =?utf-8?B?R200b1RDamRSc1JEMHpUS3kwVUZsY1l4L3dVQTRha2Z1L0ZCaGFsZjlWTDR6?=
 =?utf-8?B?amJ4ZHM2N0VaS0MxTVR3eVdEWmFhQjJiS2FPaU5xa0RJTmhlNFZHNkcxaGh3?=
 =?utf-8?B?WmkrNVZyNy9PTjBpRzBmLzJIZVEvSndaNVppL01CV1ZCemVvTkpvNGgzenhT?=
 =?utf-8?B?MHVhUllFRldhN09pazBOYy9lN2V5RFQ4UWJTQXh4TXFqa2xVWnltYmZMRllF?=
 =?utf-8?B?U3QzaVhaMHR0c09LbkZjdThXbERPWnlyZDgxOHFwcy9HY1ZmeERDNnVDVjRO?=
 =?utf-8?B?N0I5SUtYcWlOaWt2empQYmowcm1BQlZPNHYvd0ZqMTM4NCtaOXNhT3Qwa0ZL?=
 =?utf-8?B?RjVUMUxtN0wxYldlMDlLcjdNMGkvUGI4eTVJc0JFSC9jeE9vbXVpME5Td3Zm?=
 =?utf-8?B?SHI4VkMwVnptcWlaWXN6WEZZOU43Z3JVNnNGcVJhN00ycFpvcmhKeFVDa2hx?=
 =?utf-8?B?VzBYYkwwZkp3dmRidDNSYUJ6MUt5N2pjQVNYSXZSTnRMVXpLWUdzSS9uTFdk?=
 =?utf-8?B?S29JVUlJbzBvZDBnUFhUSEQ1SGFoRmtTSE9PYVYxTi9rWHlFNkFrSWtadW01?=
 =?utf-8?B?YWRrTVFPUEJyUFl2TU9CTDc2S09rVGdlT082d1QwcUJmNG9MVU9tZ1p2anpS?=
 =?utf-8?B?SDBDRjA3N2dlV1Y2ck1vR0VjNU84UUdkdWcrdXFGTEcxTXpaaEZmbjcvZVpR?=
 =?utf-8?B?aXlMR3g5bHpYeUR0UlA2TWt6SmdrTEFNVVZVbm9zc1pHTWJpT0JRb3pvMlNR?=
 =?utf-8?B?QkpRZDFqd2lBQWpqdnRiMzIvZitvMHVORTJJV01XUTZ2NkVqNHhNZVl0Y1ZX?=
 =?utf-8?B?TG5VSEpZL2tzYmg4MXNnd3VxcFdkMXhnK1kyeUp4L09OOEUwdzFEYlYyeFky?=
 =?utf-8?B?WUpZMVo0VGQwS1VJTVMwcWFobWg5ZlJPYVFudGVzcVAvVG9JcmJkeStGaEw4?=
 =?utf-8?B?THVBVlNCQ1RHMjZ6bGtidmJEREZZaVZHaHk3WExwZ0cyeE9CK0o2bmQ4cmNt?=
 =?utf-8?B?emZUL0M3c3RwcWJuOTRQVmwrdnJtb2hySlV4cEZOdDhsQzdzcmM2QlJRZVNo?=
 =?utf-8?B?Y2FqcnBzZDBjK09JWmdtaGxHaXNIYnBXcCtkenY4WHNub3hwVjlxSmI2UWxN?=
 =?utf-8?B?L3hKV08ycElRYnhxUDV1MStvVDNNNkRsajVTWWI5R2FPTWFUYTAzYW9pSmZ1?=
 =?utf-8?B?Q0FKOGtUQ1VMRTAyckxnZVFLRVFNbVBiUFpKdk9ranMrNmlHYzkwZVcxVFBT?=
 =?utf-8?B?TkR1WVRld00yWVowMEkwQ01kVkpDNXJ1SE5sOXBPQU44aFE9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9707
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C70B.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	84226616-36e4-4dc0-8280-08ddb7bdba1a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|35042699022|82310400026|14060799003|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OVpEb2R5QW9hL1JFNmVLQ2k4ZTM3NVNkR1hIdHVZSkJDK3R2K0xIbURTbjNC?=
 =?utf-8?B?WnVmNFVMcE5lQ1NmRUlpVUd0Ti9MMnlCOVZrSjNXL2Vlc3lHdHZ6TmtEYnVm?=
 =?utf-8?B?ZlNUSGtpSlltWnozMk53VGtvZHR1WkNYdERqZm1QV1ZGaS9FY0hCUUtLZDZZ?=
 =?utf-8?B?SUYyM2F6ckJUYWdocDA1V0huaWtSVDhxNXVsV01CcUlJUFBnaXF3N0dtdFRu?=
 =?utf-8?B?cW1PNjBBMWRNa0pkNUlOUG1mOTRSc21EZmtSVDdNOEEzUWJRcW14ZEtLbXNV?=
 =?utf-8?B?eFVlN2dkaFNMeExjT0NLdFYyUE94WGpQelMvNWduQ1oyQUg2OE9EMnlHS1l1?=
 =?utf-8?B?NURuRU9KdnRFWEExYk44R1liSUZhd0wyU2VRUHNBZ0J4RTJscWN2T2Z1aTJK?=
 =?utf-8?B?MTExN2g3bW9lM2ZOWlJvczMxVkxjZ3o1UGsvVkVld0RNSkxvRWVGZDFtR1Nk?=
 =?utf-8?B?b1dNQ3puY0x1bHp2SjNQZ0lhR0RtWkxUclB3M2ZoaUtpNHNJOUVFcThlOFNj?=
 =?utf-8?B?T0ZmRG1mdTkrTGNZVm8weFYwK3BsaDZIdlQ0cUNQQUd1eFhSY2MybEZBN3VS?=
 =?utf-8?B?T21Ndko4RUc0eDZFTG9Rbm95OU1hMkNZcU5aQldZTGNXTytJN3B5Y0xyNTZr?=
 =?utf-8?B?LzNxNnRWaDJyNElON3ArUklzcEhPcG1pa2tvaEZic1RQL2JIcWZIYTNhSzFD?=
 =?utf-8?B?emZxZ3Q5ZHZ4ZHUrd0RNRHBseStCcVJtelJ4YWs1cVdnS25mMXVTRDY2RmRn?=
 =?utf-8?B?L1oxTi9JSERFTTA1QTVVTkh1RXJDYmFtY0IvSUNZdnNtRGlrd20yNDRxU1ow?=
 =?utf-8?B?eUVDbG0wamVkVXJLaVpRMFVKRTdRRFMwN2lURlpZU2IrQjVTLytFdUkwMFZU?=
 =?utf-8?B?bmQveEQ2ZWJNTFNHN3drUG5scUtxbWw3dktCLzJ2QmZCcUFYdFJ3LzBML2Nv?=
 =?utf-8?B?eGt0ZEhZQnJuV1ZWYU9tNnFPV09pZFEySCtPd2ptM1NsNVNzREZhWUxqT0dy?=
 =?utf-8?B?Tnd4SUlmVFhMaWFkNzRINTJHVFV3bU9GdEs3NGxkalJvdVJKY3ZrbnluUy8w?=
 =?utf-8?B?WENzSnZOSnV6RkwxL1VRQnZvS0JwSlpKbURSMDJyNWk3WnJpVGtzWFE2V3lJ?=
 =?utf-8?B?TmthbUN3UG5DN3hscVg3ZE5lUnV4VXBBTTNzYmhpVjI5ZlRDVFdUT3hiQ1hR?=
 =?utf-8?B?U2JGUFI2ekZZVEV5NFRDaW9ya0pjR05PTTExR3B1U012bkNqK2tZMEVxWXJK?=
 =?utf-8?B?L1ZmbXhhVW1kakxPaEZlcU1SOXZkQjlLMUFvOEp5MWFlaGRPNmpuVFdJUTF2?=
 =?utf-8?B?QzRzL1ZrUkRnUU9RSm91Wk5mMkR2WnVMZVdIWGlqd2N3ZTEvRXZ1TDNGeTZu?=
 =?utf-8?B?WnErb1pzZnFjY1h6RFVMdjFiRkgreVdhQ1ZETU9ackNmcTJ5QXMvRnB0c1g2?=
 =?utf-8?B?bHBCeWREYkxpNGRENUMrUkNTR1ZVYk1mM2gzOWh6eTVSZTZxeTA5UWV3dUV5?=
 =?utf-8?B?UE53eXBWYVdUcXF2aDFrNVlGUlYyMjZ3U3Q1K3gvdTFLSEdZbmRaQ3FuUzF4?=
 =?utf-8?B?YWVCWE1xOE5JNDN5VUtHNTkzeXBSdzFYTVVQZkRtTnRUeXF6MitHV0h6cEx6?=
 =?utf-8?B?eEV6SzNpZWQzZzlyM081MWEwc2RzYW9sSmFGcU9RVzJGeHV4Sk5LZmU2UnNE?=
 =?utf-8?B?NkEzTWVrcUc0OFBJd0tCMjVDM1E0aHVTNUVUdnhTRllZamM0NWtYeHJrT3p4?=
 =?utf-8?B?T1hMZzFoQzV4dHFDT0ltdmRHK3FVODlLU1VweVZLd2xhZ2NUZmt5ekhVbGJB?=
 =?utf-8?B?R1BZMFRJY05VbzlTVjRDUWJnZ0llclJJSG0vOGswZWo5bklwSVdOSFhvaDJ0?=
 =?utf-8?B?TjJ5OFUxUVdUUUZLNGZ3MVhldmV2YkNxV1BjWFgyOTRnNUI5eGw3Z0oyVmdC?=
 =?utf-8?B?WFVwaDAxbkVxSGVTRm5PMWRQZmtTSlVlay9iMVVzVWtUVktBK2lkMmpnOWxD?=
 =?utf-8?B?eFltNElNZFpIU1JpNlRvRWh3SktEMStMcUU1N0hHY21VY0t3c3hXSUpYL1RZ?=
 =?utf-8?Q?hP1tHS?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(35042699022)(82310400026)(14060799003)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 10:06:39.7499
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27763d74-70ca-4188-7ecb-08ddb7bdce8e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C70B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5612


On 30/06/25 3:25 pm, Ryan Roberts wrote:
> On 30/06/2025 10:49, Dev Jain wrote:
>> On 30/06/25 3:12 pm, Ryan Roberts wrote:
>>> On 28/06/2025 12:34, Dev Jain wrote:
>>>> In case of prot_numa, there are various cases in which we can skip to the
>>>> next iteration. Since the skip condition is based on the folio and not
>>>> the PTEs, we can skip a PTE batch. Additionally refactor all of this
>>>> into a new function to clean up the existing code.
>>>>
>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>> ---
>>>>    mm/mprotect.c | 134 ++++++++++++++++++++++++++++++++------------------
>>>>    1 file changed, 87 insertions(+), 47 deletions(-)
>>>>
>>>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>>>> index 88709c01177b..af10a7fbe6b8 100644
>>>> --- a/mm/mprotect.c
>>>> +++ b/mm/mprotect.c
>>>> @@ -83,6 +83,83 @@ bool can_change_pte_writable(struct vm_area_struct *vma,
>>>> unsigned long addr,
>>>>        return pte_dirty(pte);
>>>>    }
>>>>    +static int mprotect_folio_pte_batch(struct folio *folio, unsigned long addr,
>>>> +        pte_t *ptep, pte_t pte, int max_nr_ptes)
>>>> +{
>>>> +    const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>>> +
>>>> +    if (!folio || !folio_test_large(folio) || (max_nr_ptes == 1))
>>> The !folio check wasn't in the previous version. Why is it needed now?
>> It was there, actually. After prot_numa_skip_ptes(), if the folio is still
>> NULL, we get it using vm_normal_folio(). If this returns NULL, then
>> mprotect_folio_pte_batch() will return 1 to say that we cannot batch.
>>
>>>> +        return 1;
>>>> +
>>>> +    return folio_pte_batch(folio, addr, ptep, pte, max_nr_ptes, flags,
>>>> +                   NULL, NULL, NULL);
>>>> +}
>>>> +
>>>> +static int prot_numa_skip_ptes(struct folio **foliop, struct vm_area_struct
>>>> *vma,
>>>> +        unsigned long addr, pte_t oldpte, pte_t *pte, int target_node,
>>>> +        int max_nr_ptes)
>>>> +{
>>>> +    struct folio *folio = NULL;
>>>> +    int nr_ptes = 1;
>>>> +    bool toptier;
>>>> +    int nid;
>>>> +
>>>> +    /* Avoid TLB flush if possible */
>>>> +    if (pte_protnone(oldpte))
>>>> +        goto skip_batch;
>>>> +
>>>> +    folio = vm_normal_folio(vma, addr, oldpte);
>>>> +    if (!folio)
>>>> +        goto skip_batch;
>>>> +
>>>> +    if (folio_is_zone_device(folio) || folio_test_ksm(folio))
>>>> +        goto skip_batch;
>>>> +
>>>> +    /* Also skip shared copy-on-write pages */
>>>> +    if (is_cow_mapping(vma->vm_flags) &&
>>>> +        (folio_maybe_dma_pinned(folio) || folio_maybe_mapped_shared(folio)))
>>>> +        goto skip_batch;
>>>> +
>>>> +    /*
>>>> +     * While migration can move some dirty pages,
>>>> +     * it cannot move them all from MIGRATE_ASYNC
>>>> +     * context.
>>>> +     */
>>>> +    if (folio_is_file_lru(folio) && folio_test_dirty(folio))
>>>> +        goto skip_batch;
>>>> +
>>>> +    /*
>>>> +     * Don't mess with PTEs if page is already on the node
>>>> +     * a single-threaded process is running on.
>>>> +     */
>>>> +    nid = folio_nid(folio);
>>>> +    if (target_node == nid)
>>>> +        goto skip_batch;
>>>> +
>>>> +    toptier = node_is_toptier(nid);
>>>> +
>>>> +    /*
>>>> +     * Skip scanning top tier node if normal numa
>>>> +     * balancing is disabled
>>>> +     */
>>>> +    if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL) && toptier)
>>>> +        goto skip_batch;
>>>> +
>>>> +    if (folio_use_access_time(folio)) {
>>>> +        folio_xchg_access_time(folio, jiffies_to_msecs(jiffies));
>>>> +
>>>> +        /* Do not skip in this case */
>>>> +        nr_ptes = 0;
>>>> +        goto out;
>>> This doesn't smell right... perhaps I'm not understanding the logic. Why do you
>>> return nr_ptes = 0 if you end up in this conditional, but nr_ptes = 1 if you
>>> don't take this conditional? I think you want to return nr_ptes == 0 for both
>>> cases?...
>> In the existing code, we do not skip if we take this conditional. So nr_ptes == 0
>> is only a hint that we don't have to skip in this case.
> We also do not skip if we do not take the conditional,right? "hint that we don't
> have to skip in this case"... no I think it's a "directive that we must not
> skip"? A hint is something that the implementation is free to ignore. But I
> don't think that's the case here.
>
> What I'm saying is that I think this block should actually be:
>
> 	if (folio_use_access_time(folio))
> 		folio_xchg_access_time(folio, jiffies_to_msecs(jiffies));
>
> 	/* Do not skip in this case */
> 	nr_ptes = 0;
> 	goto out;

Ah you are right. Thanks!

>>>> +    }
>>>> +
>>>> +skip_batch:
>>>> +    nr_ptes = mprotect_folio_pte_batch(folio, addr, pte, oldpte, max_nr_ptes);
>>>> +out:
>>>> +    *foliop = folio;
>>>> +    return nr_ptes;
>>>> +}
>>>> +
>>>>    static long change_pte_range(struct mmu_gather *tlb,
>>>>            struct vm_area_struct *vma, pmd_t *pmd, unsigned long addr,
>>>>            unsigned long end, pgprot_t newprot, unsigned long cp_flags)
>>>> @@ -94,6 +171,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>>>        bool prot_numa = cp_flags & MM_CP_PROT_NUMA;
>>>>        bool uffd_wp = cp_flags & MM_CP_UFFD_WP;
>>>>        bool uffd_wp_resolve = cp_flags & MM_CP_UFFD_WP_RESOLVE;
>>>> +    int nr_ptes;
>>>>          tlb_change_page_size(tlb, PAGE_SIZE);
>>>>        pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
>>>> @@ -108,8 +186,11 @@ static long change_pte_range(struct mmu_gather *tlb,
>>>>        flush_tlb_batched_pending(vma->vm_mm);
>>>>        arch_enter_lazy_mmu_mode();
>>>>        do {
>>>> +        nr_ptes = 1;
>>>>            oldpte = ptep_get(pte);
>>>>            if (pte_present(oldpte)) {
>>>> +            int max_nr_ptes = (end - addr) >> PAGE_SHIFT;
>>>> +            struct folio *folio = NULL;
>>>>                pte_t ptent;
>>>>                  /*
>>>> @@ -117,53 +198,12 @@ static long change_pte_range(struct mmu_gather *tlb,
>>>>                 * pages. See similar comment in change_huge_pmd.
>>>>                 */
>>>>                if (prot_numa) {
>>>> -                struct folio *folio;
>>>> -                int nid;
>>>> -                bool toptier;
>>>> -
>>>> -                /* Avoid TLB flush if possible */
>>>> -                if (pte_protnone(oldpte))
>>>> -                    continue;
>>>> -
>>>> -                folio = vm_normal_folio(vma, addr, oldpte);
>>>> -                if (!folio || folio_is_zone_device(folio) ||
>>>> -                    folio_test_ksm(folio))
>>>> -                    continue;
>>>> -
>>>> -                /* Also skip shared copy-on-write pages */
>>>> -                if (is_cow_mapping(vma->vm_flags) &&
>>>> -                    (folio_maybe_dma_pinned(folio) ||
>>>> -                     folio_maybe_mapped_shared(folio)))
>>>> -                    continue;
>>>> -
>>>> -                /*
>>>> -                 * While migration can move some dirty pages,
>>>> -                 * it cannot move them all from MIGRATE_ASYNC
>>>> -                 * context.
>>>> -                 */
>>>> -                if (folio_is_file_lru(folio) &&
>>>> -                    folio_test_dirty(folio))
>>>> -                    continue;
>>>> -
>>>> -                /*
>>>> -                 * Don't mess with PTEs if page is already on the node
>>>> -                 * a single-threaded process is running on.
>>>> -                 */
>>>> -                nid = folio_nid(folio);
>>>> -                if (target_node == nid)
>>>> -                    continue;
>>>> -                toptier = node_is_toptier(nid);
>>>> -
>>>> -                /*
>>>> -                 * Skip scanning top tier node if normal numa
>>>> -                 * balancing is disabled
>>>> -                 */
>>>> -                if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL) &&
>>>> -                    toptier)
>>>> +                nr_ptes = prot_numa_skip_ptes(&folio, vma,
>>>> +                                  addr, oldpte, pte,
>>>> +                                  target_node,
>>>> +                                  max_nr_ptes);
>>>> +                if (nr_ptes)
>>>>                        continue;
>>> ...But now here nr_ptes == 0 for the "don't skip" case, so won't you process
>>> that PTE twice because while (pte += nr_ptes, ...) won't advance it?
>>>
>>> Suggest forcing nr_ptes = 1 after this conditional "continue"?
>> nr_ptes will be forced to a non zero value through mprotect_folio_pte_batch().
> But you don't call mprotect_folio_pte_batch() if you have set nr_ptes = 0;
> Perhaps you are referring to calling mprotect_folio_pte_batch() on the
> processing path in a future patch? But that means that this patch is buggy
> without the future patch.

Yup it is there in the future patch. You are correct, I'll respin and force
nr_ptes = 1 in this case.

>
>>> Thanks,
>>> Ryan
>>>
>>>
>>>> -                if (folio_use_access_time(folio))
>>>> -                    folio_xchg_access_time(folio,
>>>> -                        jiffies_to_msecs(jiffies));
>>>>                }
>>>>                  oldpte = ptep_modify_prot_start(vma, addr, pte);
>>>> @@ -280,7 +320,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>>>                    pages++;
>>>>                }
>>>>            }
>>>> -    } while (pte++, addr += PAGE_SIZE, addr != end);
>>>> +    } while (pte += nr_ptes, addr += nr_ptes * PAGE_SIZE, addr != end);
>>>>        arch_leave_lazy_mmu_mode();
>>>>        pte_unmap_unlock(pte - 1, ptl);
>>>>    
