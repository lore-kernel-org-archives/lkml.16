Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011065.outbound.protection.outlook.com [52.101.70.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F6B25F793
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.65
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751283685; cv=fail; b=ETZFRadQ5qJGMy4tTwi7e3NQUeaE8IhM1/7L6jUoaYkAxKnhlLLLxmWr5Zv9QCRcr05inaZxi/05m7UUpRRRhe+0CROlIIeIrinzV1vyYZ/KEexw8wGC43T6/uOwM1JJm8sD8JGGIyLPEsvfzegj2Y+y8hBHA4VFwvrsdyoOLMU=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751283685; c=relaxed/simple;
	bh=Csm2yiH5gGkd02cyIr2c9RXW3fJAxP9EsqOIR1u20PY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JNUMK1XKsKWQ9t8vr24UA1K8LiO1/35fts18GobloqzUCJZCGhYVCecyY379mshPvKojpYY3pzet8BMV4inV2rdYByFTl3PU0KDpx3HSBHzNoyMMVeqKf7J2NrCF5upU8RE1as23Siwn1wGRA2lS/w32n+/hNa71Rlbei0X3/0I=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ZPzm889s; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ZPzm889s; arc=fail smtp.client-ip=52.101.70.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ZPzm889s";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ZPzm889s"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vI3cn4l6souN/GnhxXAU1L4G0BfymMNiDjRYn+5h6nBHag864PeWycypHohWeCFuaThce/WWhNlPXgGCB5FDkMV9ZR+nYKxdOJYWRIPPzrva6GDbXzS8HjNEQ7gysBuZ+BMnHChM5wPcdoPKJRl9IkOLYWqtmUAuFGLeVmvcNsn8gELn1KRpsBYTUdnC7AYMrGIfADW75h2aFBB9EefLinrqLVT3VFSLRHEZtLsI0W4YKu1PDQL9WXxViHhnl5JLmK53tB9CvfRQzuFOvprYIIKpXhVq7PaEb7u1vEVVyirBxe88CeqkCcZe5wQpoJMGu+m/I7I+A8Qh725x5RD/fQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UinPcF3MLBUrqt1aoPdThK7yLlSc6KMS6xlrw7b8pPo=;
 b=FJYhQEfum3rZ40O7KN0Irns/OTVNxmoP/klgiIj2QFLC8oL+yrSg4vbmy2O3eofcIS8lbUkzjLmXv62X2mFgX+Thv+/BOb4MZz1lNCSQ2SJJJ65nI5rmm+MDjvZBdPIsdhRL36E1cDmyqLvr5RLKY19n0N0qtx0WQ/d7sMPQv2lLWOdJpWcSUc9Y16OYBP3PBrWRVYhCEaFjYRzhVSSmsg2lXIrNK1ROQJWi4DMB3h0c2Nhi4vcn9IAjDlOh3Wmq0rsQcKbJAewu6E3LvqbMXAwdurteg3qkHO86CVZl5aFiNAx5FAOSJVpvhdhOZ58rd8X7W+rryby7gz+G/+VwyQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UinPcF3MLBUrqt1aoPdThK7yLlSc6KMS6xlrw7b8pPo=;
 b=ZPzm889sb3H3ItItsJmObp/ZNOLcKeI9SusrRAHZ4P+U+Wyt/JElGieqyGdnibDGy/Awi1agn0lTHz2+MsJP9d4TYe3NnpSV1ZFFLMppowSvpJgsZ4kRiNSZrIGG14URhXSWjZAxL2c0Xlqjp2TpWB7IgDkx2uZ1UryqO9kWsJw=
Received: from AM4PR07CA0015.eurprd07.prod.outlook.com (2603:10a6:205:1::28)
 by DU0PR08MB9776.eurprd08.prod.outlook.com (2603:10a6:10:443::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Mon, 30 Jun
 2025 11:41:17 +0000
Received: from AMS0EPF00000191.eurprd05.prod.outlook.com
 (2603:10a6:205:1:cafe::69) by AM4PR07CA0015.outlook.office365.com
 (2603:10a6:205:1::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.12 via Frontend Transport; Mon,
 30 Jun 2025 11:41:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000191.mail.protection.outlook.com (10.167.16.216) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Mon, 30 Jun 2025 11:41:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oZo9WfkBG+AetKwnBvZ+a3//lmNQdsvb+qvO/o8CPDdow2Qw/DUZJ3/4NJth1XzI9pwzxJw/e9H5bVWaDoE7GlhMqh1Yoro6254N8tbEK/PTL/q2OtUHzKX1m/oxgI9y1D5v42KYO5vSARgwIJ6SLG3E9M5ISfpokzWHz5uPwUsm9hAZQtKIw+MtMbx0LETFE5+4n65IDrMLeBI2e41Q86/fMZlpUYc+QinlksSiPoYaLt2bknVkLnYjYthOvJEC/Nh3Qzkh6FKRZcoXCCqmUcf+c3qNyNEH753FR7sR8VT1mPvWwoJlYCIfUxDtFd9mgZxz8VqbnxFxq1OIEeq34w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UinPcF3MLBUrqt1aoPdThK7yLlSc6KMS6xlrw7b8pPo=;
 b=mtI1MeESE6tQDbLzeug5Sfne2pg69KArYRNeGK2o/E4NUC1h2rQOYV8wbHLK7iXuFkwyP2t5nONIGq8ca+ueOtdPsqcrv85pl/nxsKUad4WlbMm8ixcbalDaP3qryMicKumd+yvm0HbrAcuJH1sElgDuEqCMGjNArErY7GDLLfZPTfgG6qRNXn5tjG8WTyzuIYrvk+kcPuEJuY9pa2IB4HwpJRknpphbpC++mCYMwvddMcBFNptLKtWg2GpQNYXHywKQM0SF6CmV7frWAeomXSVT/wT4JydUOXNu3jMDs1ULwdyrKOr5vw8893pIzYAIqH7DV/dHHeJKj7EJl3bngA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UinPcF3MLBUrqt1aoPdThK7yLlSc6KMS6xlrw7b8pPo=;
 b=ZPzm889sb3H3ItItsJmObp/ZNOLcKeI9SusrRAHZ4P+U+Wyt/JElGieqyGdnibDGy/Awi1agn0lTHz2+MsJP9d4TYe3NnpSV1ZFFLMppowSvpJgsZ4kRiNSZrIGG14URhXSWjZAxL2c0Xlqjp2TpWB7IgDkx2uZ1UryqO9kWsJw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Mon, 30 Jun
 2025 11:40:44 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 11:40:44 +0000
Message-ID: <916304ae-abf6-4cfe-90e3-411d992d7488@arm.com>
Date: Mon, 30 Jun 2025 17:10:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] mm: Optimize mprotect() for MM_CP_PROT_NUMA by
 batch-skipping PTEs
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, david@redhat.com,
 willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
 vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
 peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
 baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250628113435.46678-1-dev.jain@arm.com>
 <20250628113435.46678-2-dev.jain@arm.com>
 <79a48c48-53b1-4002-a8b2-447e69d96e49@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <79a48c48-53b1-4002-a8b2-447e69d96e49@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0022.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::7) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DU2PR08MB10037:EE_|AMS0EPF00000191:EE_|DU0PR08MB9776:EE_
X-MS-Office365-Filtering-Correlation-Id: b95e8b37-c7f5-4615-5088-08ddb7cb0659
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?cUpEUnZoRTFpak1raXFybHM3cHlteDBkVEdvRWpqeXRDTnRWOFJZZ0Y3RU03?=
 =?utf-8?B?MHZyVnpBUDJzYlBWVUVxYzFkdFZQdDJpRVN6RWFjNFV6bkdvbVVhMFZGOVpz?=
 =?utf-8?B?aTJEQ0ltcFRjTnhFa3pTeU4veWpmMmxiUFFRWUZKeWw1K0JtVzhpdVFMS0hw?=
 =?utf-8?B?NEFadi9PYjM4by91Ymh6eFNhWmtodXB2a21yU1FzVHlJbDJ6K3A5eUFIczVz?=
 =?utf-8?B?RjZkMDFWTzZheHN2WWpkU00wc0RkZENWbFJpOWFaRTFvaXE2a2ZSZXZnYytq?=
 =?utf-8?B?dm8zMWVJNWN4Ukg4Y3E2dS80allUK1AwS0NScEo4MmRWY3VUUkRjUlplSHZK?=
 =?utf-8?B?YzRKNVRkbVBBK0w3ZG93b01zRmhjN2F4S0xraG1saUVMdVlWMElZdGVpVHY5?=
 =?utf-8?B?N3FuQUJUVDJYWG41ZENhRlRsV2QzVGliMlRkN05HblZLK0dCQitQc1Ria1Ru?=
 =?utf-8?B?cml2U3NEQUJISklpRHF5MmRyL3lLeHJjUGtWTGx4YTA3c3hBWkRpd0ZoT25M?=
 =?utf-8?B?OTZZUk4vd1JtZEkzaDkwMW9aTUFCRTVyREtCQnBTTnJFMFZmcDhtaVFjOVhL?=
 =?utf-8?B?eTgvL0FXVU1ka214OVlZOHB3am5QN25KV013THgyQXFncGI4QkdocTRBLzBy?=
 =?utf-8?B?VVNORTArV1BOZERFUUhzaGQvQjVMdHJ5OWF2M1NUUy9NdEVPUUI3amdYMFNi?=
 =?utf-8?B?bVRscTB1bVA4QlhCMGtRL3dEeEVWcytaMVlhLy9Ib3dzS1c4Tk5XNWFPK0tt?=
 =?utf-8?B?enJUbkRDU1BkYkhnQUVpZXVaR3ZNMlllM1BVWk96NVV3ZFZ2elh3TDFUMUo1?=
 =?utf-8?B?RVFaUDFjU05RdGxIU2JnaFZhbnhDYkFlbzRuQWsyMDhxWld3dURVTzhkVGkx?=
 =?utf-8?B?UjE3ZWVZeGxHc1BHcndPS1QzN2FJSjZDSXdzQ2VhejFtS3FUTkFHTkJQMCtV?=
 =?utf-8?B?d2FBZ0hhTnZCV2Z2SEI2QmNGYVMwMnZ1T2ozbElsNkFuTm1rUXFjUzN4N2V5?=
 =?utf-8?B?cHFoWXRUVlhseVM3WngrM3QxbGJ2a2VEa3pwMUdoeDV4NDFHZHpxQ3dMSGYr?=
 =?utf-8?B?b0V2N2g2TktUQmcyUTdBc1U4Mk90MzRpL0NxczFVYkcrWjUwaEFocTNJdEdR?=
 =?utf-8?B?U2l5ME40M1pBaDZtdFlhc1lyN1hXM2lJZ1NLdGRHZVFGMFAzQlZ1MzlzU2xC?=
 =?utf-8?B?aUphaWE5MG1Seml5WC8rd1BaM2lHL0duTjY3ZmE0L1pjYjlLYW5rT2RjSzNT?=
 =?utf-8?B?SEE2Z1ptaGR6QmdoeWo2QjROTytzOEVxWVRreU45d0VLVUVNSG85WkQ3cGU0?=
 =?utf-8?B?YlRudDBISHhwWHVoUjI1bXdwaFk1V2RFZkRDN1QrWDdJcEpkUUwwN0s5MnRG?=
 =?utf-8?B?cHpweStzRnBCVXJQL3RQQ0xMK0JrSGVhQXZtcGhWZjAxaUlrSUZ1TkljNkVO?=
 =?utf-8?B?Q2h5OUxNOWNGMmJPZ1JYUndheVl0bEJkV205eGd3UVJkelhXVWxxOExuSVBL?=
 =?utf-8?B?VHh4SHk0bll0S2FtbEhEQTBLQm5aZ2NEYnpqNW16Z1g1NEppRDBBd0V0VGhL?=
 =?utf-8?B?VlQ0dU9wdTdIZ01Mem5TbXBNZll3dCtaMGhNSlJMMC9SOEV2N00yMkt2K0k3?=
 =?utf-8?B?cDViMERxOHdPSWJEWnNVdXJVVWNROWFRYk5tVmhzak5mdTN0dkRXdzVua0tL?=
 =?utf-8?B?dis2emI5Tm1KTlRkZitSbjNSV3krMW5hVlNSWVZHRHFVemd2VnhycFBMc2to?=
 =?utf-8?B?aGtYMmlpeVBEWVVsdnhENlkrMkRoOXBQcjZXWkVHaVBqelJ4dnlRckh6UHVu?=
 =?utf-8?B?MmhhL2REL1ZZdkp1Sml0Ym1CNmZEUTBxNklCb1BPR3hnaUtMd1JyaHlyZEZZ?=
 =?utf-8?B?TFN3VDkyYjcyNEVXR2MvREhiYmUxbkQrcTRwRDlYVlpWaVFOeE0rTG4yQ1F6?=
 =?utf-8?Q?EL9yQdLk44M=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10037
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000191.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f4b5a326-9790-44a0-f412-08ddb7caf290
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|14060799003|36860700013|7416014|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T3A0QnhvSnIva0l4ZjlpQmR5NE1YRWJCYmF1U1Q4eGUzRVBPRUFxc0pWYjBv?=
 =?utf-8?B?clpXc0EvY25FUEJhbHdqL3k3WDhUcUFUUTFhSEFiRmZ5UTJvSWNEVTNQYWw1?=
 =?utf-8?B?eVFlYTNpcXB0TnBUVC9FZWVFOWdFNW52QWZXZWt0ZlArclBzWmFwakRLK3ZB?=
 =?utf-8?B?VTdqYXRGWXF5ZDAzaVJkTVBMbWNrYWI4aTFRc00rZzViWU1pcXV5Z1llM0xt?=
 =?utf-8?B?Z2ZyYWdjempxMDJaa1VnVDhUbVZMK1Jhc3NxQ29uMEFmaTlvYXVCSWs3QU04?=
 =?utf-8?B?bEdQQzJoZFpVMjlIakl3VjBoeGJZeU04QTAvRDhGSCtyampzUmlZbHo5czk4?=
 =?utf-8?B?djVqQXVkZnhyRHpCVjdZLzZKK3RYSFV2a2lwTVkwTnRFTEdUM0d1aWdrMzZL?=
 =?utf-8?B?Y0V6Tk5DU0hLdXhzSXkwMzlhcGRDL24vWU1UK0xTR3RCWGVRM3JHZjNxN0xC?=
 =?utf-8?B?NWJVSjFEdXZoZklMUWtwYWFGY0lZK2YwTmxTZXJjNVFaSzlmbStZM2ZOQk9r?=
 =?utf-8?B?WlFKQ1RZWmZQZHdHQS96b3U4Uks2Y0FWZjJKMVY5RlBZcWYvaStrOUZlVFMv?=
 =?utf-8?B?OFVYOVhwSGtrNGY4Q0M5RkxXRk5BanFzS2Z1L3k2QUJIYWRTa0pxRlAvZTdn?=
 =?utf-8?B?RjFCRlhrUnptLzFreUU1dFl5NXRnVTlnUDZES2VMVkhkRkRYdkM5T2RJZDhv?=
 =?utf-8?B?ejdzejVITk5jSTJNSGg0MWpiM2JFdkNkdlZSTUhSaUxBUnZhekFscE9OSG8y?=
 =?utf-8?B?WjRpeFpjRi9Yb3hNdFoySG1qcktQR2lHaURrZXNROVphdjA3a1FOWHdlSVZR?=
 =?utf-8?B?bHRzck5tbkdjTFo2NFhFakNPSHk5Wk9nUWdRMGtxTkk2NHB1T0hPeW9jTEtn?=
 =?utf-8?B?Wmk1NE1yUjR6bHJNandlZURSbWM2a1d5bHBEQkQ5T3FnOVdDcXhhSHJRVjlm?=
 =?utf-8?B?YVNmbHJIbTBmUkc0WTFZcDlKTWtsb0doajViUk1tbXlhL2tvL2ZFUmFDWThw?=
 =?utf-8?B?TG9kSytIdnNPZjl1NlFQNC83OTJFWEVkM2c4K0xzZFhuamVrVWlva3phbGhl?=
 =?utf-8?B?bFdBTjZaTitOT3ZvZjZRcHdVanhMbEJRUG9WZ0xiQzR4TUhLUXFaMTMveG1W?=
 =?utf-8?B?R29GQk9rZ25JZ0RFMXp5ODFZUHZVbE1yZ2JSMERQck9rRG9ZMHF1bzdONm5O?=
 =?utf-8?B?NUpvWVgwc2R2M0FxS1BTUkc3VWhtUmxaSVluemZZR0MrWko1VHlVeGZzRnc3?=
 =?utf-8?B?NGhUd2RJdUV2LzErUlVUR1BZZ3lCQis1S3BZd3RtWVJlbDhVYVA4dG44OFc3?=
 =?utf-8?B?ZWQxV2ZWb0dxZVlObEIvZng4clNYcmxheW5sd1FzazdPZmhvQmRablhJSCtz?=
 =?utf-8?B?Ni84NWVOcnQ4aFBScmpEb3FnZTZ6Tk45OWV3MnIvd2lLT2N1K04vL2tZcElh?=
 =?utf-8?B?RTFlT1dpaHBDZnBKN3AyS2NjSERTTStSY254TzNPYS9ueWJXUzhxbWp6RUM0?=
 =?utf-8?B?YW9nNDRjZWZSd1dMaVNVOEZ2NWNxcHJFeXFPSVdTRk9NZDRnakFpVWJNY3NY?=
 =?utf-8?B?YnQ5NFZoVWJFRDFoYm5ZaHgvZEtXY01taHc4aTdKb0JMRDA0UW1BSUw0L0k1?=
 =?utf-8?B?MUt5R2loWTVWN3VZbGJNL1FraFY1dEM0Nnc5NkxmbUo2enZ4WkZUc0YyM1RH?=
 =?utf-8?B?czl0QnNaWnFzZjJ0bDBwQ2NGT1pUN3hXT2pZd1pjYU9SOEloelBmUHpWcUdp?=
 =?utf-8?B?aVlhaWZzNzZKalBtUkJLbEhRM3VuV2w2NUdEa1dnVmY3aTIxQ09OWDcyVHZC?=
 =?utf-8?B?SkdMdk9BS0pKUUNIVmdBdXdvbXpXTjdScmQ4V0p3ZjVCemtQcDd6R001d3FM?=
 =?utf-8?B?Nm5FVHVsOHBFK3lXUnBXTnNLQmR4UUpTcnFkUHJaN0R1OXovVFF6QS9CbVYx?=
 =?utf-8?B?VzZsdmREamJUbm9VNk5MQmRaRWxJQ0FnRkdaWkNVTmdIOTdqTUJ5UkVXc2Yw?=
 =?utf-8?B?dDd3ckRIWmZENFQrc0JtTm0vb3ZGUDNvZXpoLzFRdkx1K1NxSE5kMjhtVHFr?=
 =?utf-8?Q?Ko9ldd?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(14060799003)(36860700013)(7416014)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 11:41:16.8184
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b95e8b37-c7f5-4615-5088-08ddb7cb0659
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000191.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9776


On 30/06/25 4:55 pm, Lorenzo Stoakes wrote:
> On Sat, Jun 28, 2025 at 05:04:32PM +0530, Dev Jain wrote:
>> In case of prot_numa, there are various cases in which we can skip to the
>> next iteration. Since the skip condition is based on the folio and not
>> the PTEs, we can skip a PTE batch. Additionally refactor all of this
>> into a new function to clean up the existing code.
> Hmm, is this a completely new concept for this series?
>
> Please try not to introduce brand new things to a series midway through.
>
> This seems to be adding a whole ton of questionable logic for an edge case.
>
> Can we maybe just drop this for this series please?

I refactored this into a new function on David's suggestion:

https://lore.kernel.org/all/912757c0-8a75-4307-a0bd-8755f6135b5a@redhat.com/

Maybe you are saying, having a refactoring patch first and then the "skip a
PTE batch" second, I'll be happy to do that, that would be cleaner.

>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   mm/mprotect.c | 134 ++++++++++++++++++++++++++++++++------------------
>>   1 file changed, 87 insertions(+), 47 deletions(-)
>>
>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>> index 88709c01177b..af10a7fbe6b8 100644
>> --- a/mm/mprotect.c
>> +++ b/mm/mprotect.c
>> @@ -83,6 +83,83 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>>   	return pte_dirty(pte);
>>   }
>>
>> +static int mprotect_folio_pte_batch(struct folio *folio, unsigned long addr,
>> +		pte_t *ptep, pte_t pte, int max_nr_ptes)
>> +{
>> +	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>> +
>> +	if (!folio || !folio_test_large(folio) || (max_nr_ptes == 1))
>> +		return 1;
>> +
>> +	return folio_pte_batch(folio, addr, ptep, pte, max_nr_ptes, flags,
>> +			       NULL, NULL, NULL);
>> +}
> I find it really odd that you're introducing this in a seemingly unrelated change.
>
> Also won't this conflict with David's changes?

This series was (ofcourse, IMHO) pretty stable at v3, and there were comments
coming on David's series, so I guessed that he will have to post a v2 anyways
after mine gets merged. My guess could have been wrong. For the khugepaged
batching series, I have sent the migration race patch separately exactly
because of his series, so that in that case the rebasing burden is mine.

>
> I know you like to rush out a dozen series at once, but once again I'm asking
> maybe please hold off?

Lorenzo : ) Except for the mremap series which you pointed out, I make it a point
to never repost in the same week, unless it is an obvious single patch, and even
in that case I give 2-3 days for the reviews to settle. I posted
v3 of this series more than a month ago, so it makes total sense to post this.
Also I have seen many people spamming the list with the next versions on literally
the same day, not that I am using this as a precedent. The mistake I made here
is that on Saturday I saw David's series but then forgot that I am using the
same infrastructure he is changing and went ahead posting this. I suddenly
remembered this during the khugepaged series and dropped the first two patches
for that.
  

>
> I seem to remember David asked you for the same thing because of this, but maybe
> I'm misremembering.

I don't recollect that happening, maybe I am wrong.

>
> We have only so much review resource and adding in brand new concepts mid-way
> and doing things that blatantly conflict with other series really doesn't help.
>
>> +
>> +static int prot_numa_skip_ptes(struct folio **foliop, struct vm_area_struct *vma,
>> +		unsigned long addr, pte_t oldpte, pte_t *pte, int target_node,
>> +		int max_nr_ptes)
>> +{
>> +	struct folio *folio = NULL;
>> +	int nr_ptes = 1;
>> +	bool toptier;
>> +	int nid;
>> +
>> +	/* Avoid TLB flush if possible */
>> +	if (pte_protnone(oldpte))
>> +		goto skip_batch;
>> +
>> +	folio = vm_normal_folio(vma, addr, oldpte);
>> +	if (!folio)
>> +		goto skip_batch;
>> +
>> +	if (folio_is_zone_device(folio) || folio_test_ksm(folio))
>> +		goto skip_batch;
>> +
>> +	/* Also skip shared copy-on-write pages */
>> +	if (is_cow_mapping(vma->vm_flags) &&
>> +	    (folio_maybe_dma_pinned(folio) || folio_maybe_mapped_shared(folio)))
>> +		goto skip_batch;
>> +
>> +	/*
>> +	 * While migration can move some dirty pages,
>> +	 * it cannot move them all from MIGRATE_ASYNC
>> +	 * context.
>> +	 */
>> +	if (folio_is_file_lru(folio) && folio_test_dirty(folio))
>> +		goto skip_batch;
>> +
>> +	/*
>> +	 * Don't mess with PTEs if page is already on the node
>> +	 * a single-threaded process is running on.
>> +	 */
>> +	nid = folio_nid(folio);
>> +	if (target_node == nid)
>> +		goto skip_batch;
>> +
>> +	toptier = node_is_toptier(nid);
>> +
>> +	/*
>> +	 * Skip scanning top tier node if normal numa
>> +	 * balancing is disabled
>> +	 */
>> +	if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL) && toptier)
>> +		goto skip_batch;
>> +
>> +	if (folio_use_access_time(folio)) {
>> +		folio_xchg_access_time(folio, jiffies_to_msecs(jiffies));
>> +
>> +		/* Do not skip in this case */
>> +		nr_ptes = 0;
>> +		goto out;
>> +	}
>> +
>> +skip_batch:
>> +	nr_ptes = mprotect_folio_pte_batch(folio, addr, pte, oldpte, max_nr_ptes);
>> +out:
>> +	*foliop = folio;
>> +	return nr_ptes;
>> +}
> Yeah yuck. I don't like that we're doing all this for this edge case.
>
>> +
>>   static long change_pte_range(struct mmu_gather *tlb,
>>   		struct vm_area_struct *vma, pmd_t *pmd, unsigned long addr,
>>   		unsigned long end, pgprot_t newprot, unsigned long cp_flags)
>> @@ -94,6 +171,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   	bool prot_numa = cp_flags & MM_CP_PROT_NUMA;
>>   	bool uffd_wp = cp_flags & MM_CP_UFFD_WP;
>>   	bool uffd_wp_resolve = cp_flags & MM_CP_UFFD_WP_RESOLVE;
>> +	int nr_ptes;
>>
>>   	tlb_change_page_size(tlb, PAGE_SIZE);
>>   	pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
>> @@ -108,8 +186,11 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   	flush_tlb_batched_pending(vma->vm_mm);
>>   	arch_enter_lazy_mmu_mode();
>>   	do {
>> +		nr_ptes = 1;
>>   		oldpte = ptep_get(pte);
>>   		if (pte_present(oldpte)) {
>> +			int max_nr_ptes = (end - addr) >> PAGE_SHIFT;
>> +			struct folio *folio = NULL;
>>   			pte_t ptent;
>>
>>   			/*
>> @@ -117,53 +198,12 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   			 * pages. See similar comment in change_huge_pmd.
>>   			 */
>>   			if (prot_numa) {
>> -				struct folio *folio;
>> -				int nid;
>> -				bool toptier;
>> -
>> -				/* Avoid TLB flush if possible */
>> -				if (pte_protnone(oldpte))
>> -					continue;
>> -
>> -				folio = vm_normal_folio(vma, addr, oldpte);
>> -				if (!folio || folio_is_zone_device(folio) ||
>> -				    folio_test_ksm(folio))
>> -					continue;
>> -
>> -				/* Also skip shared copy-on-write pages */
>> -				if (is_cow_mapping(vma->vm_flags) &&
>> -				    (folio_maybe_dma_pinned(folio) ||
>> -				     folio_maybe_mapped_shared(folio)))
>> -					continue;
>> -
>> -				/*
>> -				 * While migration can move some dirty pages,
>> -				 * it cannot move them all from MIGRATE_ASYNC
>> -				 * context.
>> -				 */
>> -				if (folio_is_file_lru(folio) &&
>> -				    folio_test_dirty(folio))
>> -					continue;
>> -
>> -				/*
>> -				 * Don't mess with PTEs if page is already on the node
>> -				 * a single-threaded process is running on.
>> -				 */
>> -				nid = folio_nid(folio);
>> -				if (target_node == nid)
>> -					continue;
>> -				toptier = node_is_toptier(nid);
>> -
>> -				/*
>> -				 * Skip scanning top tier node if normal numa
>> -				 * balancing is disabled
>> -				 */
>> -				if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL) &&
>> -				    toptier)
>> +				nr_ptes = prot_numa_skip_ptes(&folio, vma,
>> +							      addr, oldpte, pte,
>> +							      target_node,
>> +							      max_nr_ptes);
>> +				if (nr_ptes)
> I'm not really a fan of this being added (unless I'm missing something here) but
> _generally_ it's better to separate out a move and a change if you can.

Yup I'll split this patch.

>
>>   					continue;
>> -				if (folio_use_access_time(folio))
>> -					folio_xchg_access_time(folio,
>> -						jiffies_to_msecs(jiffies));
>>   			}
>>
>>   			oldpte = ptep_modify_prot_start(vma, addr, pte);
>> @@ -280,7 +320,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   				pages++;
>>   			}
>>   		}
>> -	} while (pte++, addr += PAGE_SIZE, addr != end);
>> +	} while (pte += nr_ptes, addr += nr_ptes * PAGE_SIZE, addr != end);
>>   	arch_leave_lazy_mmu_mode();
>>   	pte_unmap_unlock(pte - 1, ptl);
>>
>> --
>> 2.30.2
>>
> Anyway will hold off on reviewing the actual changes here until we can figure
> out whether this is event appropriate here.
