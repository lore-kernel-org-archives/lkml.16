Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011051.outbound.protection.outlook.com [52.101.70.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D2E29ACE5
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.51
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750846102; cv=fail; b=s3FcAUKEp3dhOuVDYbl7KevItwsukrSBgyQyqN0f55aFByXb7QzMfCEU8+uSpi/giaP4DG1BkjcPJVeCGuR6S/8RtEyYOVbnbXEhBAy5ztAPN7JuAYQHhOa2qyPzYybasUSz/ZDBytopcWwJnQaVE/BJaP4lE4B+b6W6OU31e+4=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750846102; c=relaxed/simple;
	bh=FEEHkj2aoU3TI4jwFB0r8f0cP5HmYnEFvajpNT3Bzec=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=R9dj+dCcHuLmJ33kjRf54MV4DORo+YnEYFJqLd1zjJSoih3WTmYb86EMksyAoZcKQAn/jT0kuFxeDcZoJAOyusO5r5YGM36NUyIr7zbkmGMqqnhSESp68lymImcacBzBIzCyt2cP7zh7K+pbSTroH8Y0R+PGrkBgzbyTOjnrOCs=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Z5iSVMLv; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Z5iSVMLv; arc=fail smtp.client-ip=52.101.70.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Z5iSVMLv";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Z5iSVMLv"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=mnPL0SrOp3K0voB3nJLG2hBizghABuAVJKLH/yb16QcY+CkqmTeqrnNaXeZ75zurpAADFGkKR7SC+tgq4nhlwHDlhIcviZdqIOAbfobNEaJvOL/fJbV25bgFceulyiwWRPGMr0LV7NxRMKLjk0kajUfLEzmLG7aVuypd5g/9SmDIKywVNVycrcFE4GoDDwS4ttBqF5wgorwYZU4l4183ihXuQIUHVWmgcBZMJqzL9pOuPctq4xf2LZEqsaX2Vu+T0XwkotGxETuFsrvwveESnPSx7tiLQ1hEGV5AggxCDeaXjQA5W4zSQgmfMbNLJcQpvLPoyCCJywGbENCCiv5EvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FEEHkj2aoU3TI4jwFB0r8f0cP5HmYnEFvajpNT3Bzec=;
 b=d3/wwpgUmIuiCP1Pkg+S7CfULFRJMna2899ii+/pF5fv8T3TuozIGZiqOLl1WXIe8pjOsFmmPxDNV7gQHtVWGT31KeCUTEa8uCyglmW7HuCbd/l1UwdRZHEjfZryRxpAcdmVcZRE04sVcXYhlOSrp0z8oiwrg4wNNTZYB1ZkQ8cJalKth50dfMPcw84AErm9lB6hSVQzQtMF4bargkLJl9YHU+sE4bER16D1EC53WGQGLWr0hAfsjfxcDXXkeY4Ox/6F1TKxoGTOeN2wzes7i7gj3xsiHEKQhnf4DOlfaRBiSeJLJkPKHGsDMa3fGpCxzLDbswkntdpu+GTGMFS0vg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FEEHkj2aoU3TI4jwFB0r8f0cP5HmYnEFvajpNT3Bzec=;
 b=Z5iSVMLvD9N4Udush2vNhVgEI79gxQXUgjM2NHor7teHElThIHcuOrJBKHnEOEMXGXGdbXLlfDA5QqwzHTffxNqiJpK0eB9M8nIAA9OO1oThCU+5QjH9A0OI7sHJCmNL0nmtDutdx/Ptqxg7PbavrMfaQCoY4x5n69cX89xHYwg=
Received: from AS4P251CA0020.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d3::9)
 by DU2PR08MB10264.eurprd08.prod.outlook.com (2603:10a6:10:49b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 10:08:16 +0000
Received: from AM2PEPF0001C715.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d3:cafe::69) by AS4P251CA0020.outlook.office365.com
 (2603:10a6:20b:5d3::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.31 via Frontend Transport; Wed,
 25 Jun 2025 10:08:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C715.mail.protection.outlook.com (10.167.16.185) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Wed, 25 Jun 2025 10:08:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=igFhmZu7LxGg8ZOshZM8SqlaCW/ybd6LM2O+YJOYSCfzUsW1z2NxKpTpBc3SuHi1BipLu3U2COkxolK8wE2HJhsV+f/WnXGZGb7tleAHAVG/Esp4PdBNzE1EXmcoTa2UVaEAi9Vd+fWAMOoUpaL0O6vAbbHkWqRyNDENACzaeHmETxFuYv7OMISxy1eeCQZm7HXBZMKZHdl+bCl+P5wcd+wANfKaHODm5YrPLfhoNotcQMRFAJJWspy7WX6NwbVecMb4O0zQOlz5v86oVg8/Bh4pTqUBpu5YfSfMYjH4Yx3BA5WRRZ4x1+WWPG78OTHiolJpLZsiBspIHgtbJOctrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FEEHkj2aoU3TI4jwFB0r8f0cP5HmYnEFvajpNT3Bzec=;
 b=MefQGjyZ284wAWFylrF+nD1h2S9wGe58g4Jq3Y6IW9v8bWfqedSg7JMU//dZk1NOonS3OArFmq2rhORwEw4i1OysJIdjPVpsoG8zfqQlKPsnk7K6s5jSNeq241lO5y7hINj1ilAznXlZuaN5+V/PQqlbaz3fE/REXaGBPPXBW5vypbT1xHI/w21TPLOuIMpLc7ZrF/PMSwRJNf4SHfZXA/IU30QpMni4zYoNbB6fmoSKknV1zcObJ8n3o69t6iJun+4DAo1CVeXUvvo/BHLp0utD5+Vy0DwlTPhVyl1ThYfOC2t0AMOkUsEmqexUy0Nkh3CoV+lDSP+jJuul+7NT4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FEEHkj2aoU3TI4jwFB0r8f0cP5HmYnEFvajpNT3Bzec=;
 b=Z5iSVMLvD9N4Udush2vNhVgEI79gxQXUgjM2NHor7teHElThIHcuOrJBKHnEOEMXGXGdbXLlfDA5QqwzHTffxNqiJpK0eB9M8nIAA9OO1oThCU+5QjH9A0OI7sHJCmNL0nmtDutdx/Ptqxg7PbavrMfaQCoY4x5n69cX89xHYwg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DU0PR08MB8376.eurprd08.prod.outlook.com (2603:10a6:10:407::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 25 Jun
 2025 10:07:41 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%4]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 10:07:41 +0000
Message-ID: <9817cd5f-00c2-456a-ba2a-0b81c1de297e@arm.com>
Date: Wed, 25 Jun 2025 15:37:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add myself as THP co-maintainer
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Nico Pache
 <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Barry Song <baohua@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250625095231.42874-1-lorenzo.stoakes@oracle.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250625095231.42874-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::9) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DU0PR08MB8376:EE_|AM2PEPF0001C715:EE_|DU2PR08MB10264:EE_
X-MS-Office365-Filtering-Correlation-Id: a05f708c-eeea-4f8f-8192-08ddb3d033ae
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?WENoeXg1Z3IwQk5wT3Z0MXpsMUo5UWxoMno2NkhFNHd5VEE2d3NCajJpdHBS?=
 =?utf-8?B?cG50ODNweko4TU92NW94VitIOHhsS2Z6bmh4cWFyM3lnZHNzWDhRS0xuL0wv?=
 =?utf-8?B?Y2ZMSFk1bndnaTRzT2p2M0xuUmdlbzlvNWJKSldjVzlmSlJUY1RSWWpVUEt0?=
 =?utf-8?B?L2VNVHpTQ2JKRkJVUW04MElFblArd1Fva1lvUS9qcXkxTWcwQlpXS2x5dUh3?=
 =?utf-8?B?WTh5eGZ3cWxDN1k5citjbVViZUNiOERJZ2VGeU9QY3hyUURRN3pDYnFnZVpa?=
 =?utf-8?B?NVZncGJTNnFlTFpEMTVJeEFKTkRBa29UQ2NiczF4VHIzUjc1Wm9ySEVUY1N2?=
 =?utf-8?B?aCtHYnR3NWFFbU1zSTRWcWFUVnJSd0Zub2p0S2FMbHZMK242Yk53Yk5QdG9C?=
 =?utf-8?B?ZUxBd2UxZSthR1hsNmN0YkRZMXhTZXhaUmt3WWNQZE0zQjEvQ0o2UGk0TUZu?=
 =?utf-8?B?YldDdjBRaVdpN2FvQkkyWkdhakRsNlE2NVVQWG9sVUN0NjRWbDVBNmV1Nytx?=
 =?utf-8?B?MytmNVBqdUhqRVA4YWp6ZlN3TlhHaTh4bkNEalZCUjZjVk10UmMzTFRoM3ZR?=
 =?utf-8?B?dWFLMEpFZHY1RDN5R3VKdVY5OTRsYTk1eGJUejM3OVdJL0FXT3MvajIvWTVX?=
 =?utf-8?B?NnJQTi8rdVVsWW1YSm03b0xEc0Z2L2VzNnd1dmYxbURXYjlOWWRLd05Da0N5?=
 =?utf-8?B?RU04dlBIek00MjFYTXNwUENVUS9zVUhpbHlWWVJDVnFCMFMrWGhJYWg0Q3dQ?=
 =?utf-8?B?aUNiY0lZbEZZVnh3T2NKTnhYNGRhKzZrN0RLb1dzSlJycGhSblBZWHRleUlv?=
 =?utf-8?B?ajhIVSt3R1lua1hPcmU3c3o5d1NDaDlDaUlTMFhXNXVoNVBIUnIxNG12cjhR?=
 =?utf-8?B?ZEtoUjN3YzljUW4wOHdFQlRpVGptaUZnSmhnWjc0cHltS25FaUxYTlB6ZmZS?=
 =?utf-8?B?WjVVdjZpNWppNzlJd21TbnJnVllzMDNmMVMyVjFxSHFuVWRaelNpNzVBM1NX?=
 =?utf-8?B?R1R3SVN6RUN1YXdvWFRrOFNkbUQ1KzRnOUtvU0hTc21nWUJOWThuWG5uWUla?=
 =?utf-8?B?SjVFUjE5Y3g0SzlVMHdxTDRlYUlJMHZ2TFdEanR1QmJOVmR4c1pna3ZSMlpP?=
 =?utf-8?B?NDFPdmJCM2d5VCs0TmU2eUFsVXlLUk9wRVFjOUVsYWlIS2JkTU9wT3JNcHRW?=
 =?utf-8?B?Sm1rcVBZeU8rRHRGUHpJblR0YjhXeVRldEcxemUzOHgrUk53Tm12c0I1bWh6?=
 =?utf-8?B?dFM3MnR2NGdhRXVpYnErNCtxaUVVbFd4QzZiSlN2SEJraXhnb0s5cmFuQUcv?=
 =?utf-8?B?Z0VkdlQ1SmFGVUJubXBZVG4xaWsxVTExWEFOdlM3d2N2R05YV1p3am1OZG1E?=
 =?utf-8?B?MVhMNVZ4VEE5TTFod3g1Y2ZsM3YvRklxZlErQUV0cjN6UXg0cmJjM2dsaGN2?=
 =?utf-8?B?Z0JHZGtiTFFPSm1qNGpoNHM5MXQrMkFvTk0wQlNKcmx0cGNMd1ZPYWNWakxh?=
 =?utf-8?B?ek5oMEtFcXJzdU0rcmNZMmg1UFhXejZLRWwySzNOMjA4WktGT05id01mS05R?=
 =?utf-8?B?NGJwOG9Lck5UUU5OZm84TjE1Wk1rbzdNdjhMR3k5dU94cEFjTlVVRFBHTzNT?=
 =?utf-8?B?OUpWb2RWcnVJQjkxenBUTWN6WHl2R2x3SldMZ3VUSjRpL3l3UzFwN2xEYVh4?=
 =?utf-8?B?ano2a3VRSFRMZzQvYjk4WG9LdWk0MkF1S1dzRHVLNzFKY2JDbWlmUThuODlB?=
 =?utf-8?B?NENvY2hzdktHQStYdklheW0wTWZpeElQZm9NeWdtWDRnd1F5U3M2eTUwNVV0?=
 =?utf-8?B?QytPOWU2b2wvVUw1aVdvL2oxeDNxdXFnMGVZWTNZbnFmTjNJOUsrSUdZTXZ4?=
 =?utf-8?B?SUdseC9CMmxHa2xBUWVSaGErWnJMMGszWVYxRXRqNjEyZ1I0MVViYWd4S2ha?=
 =?utf-8?Q?NJLfODluP9U=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8376
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C715.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2bc76b44-4525-496a-63fb-08ddb3d01ed9
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|7416014|36860700013|35042699022|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c2RuZ3MvanZnaDIvUnBLUXF6bGhJYmNDU2ZFNm5YcDUzV3Nvb3crY1o0cEw1?=
 =?utf-8?B?SnRESmZoMnpFK2lvOTZHdUkxT2lsbEExejdmOVpFNGcrQXRHTzl3WG1BNnNJ?=
 =?utf-8?B?Q0hkZy8xd2Rrb3doVmY0eklIODNBNkcvME9XdmJkMlVmbm5ETlRBZ3ZFYlR4?=
 =?utf-8?B?NjNacTJCYi9aMXA4MGlYQVBRSnI0SkwrM2tJNldjWC8xNjJJSld1SmlkK2Zq?=
 =?utf-8?B?eVRzb3FYWk5UMG9OZDJwbHEvZ25zL3I2UktmZm9PdWdBRzZpRndtSG45aTgw?=
 =?utf-8?B?TjBrZ29ZVGlQNUIrT0U5WndjOUc2azJKZWZSSjlXSzlFZklHaFVGTG9mSEpG?=
 =?utf-8?B?UU1IQ05xNVZxSTdWVVlVSlYxK2FJTEhXcjB5dWJ3ZFl3VUw4MklmdmdoMW9Z?=
 =?utf-8?B?Q1l2OEwzS1F1VkY3TlRYODJnMFB1TTVmTGRKdEdWSXJzdXhXbCtXN1VJSUFF?=
 =?utf-8?B?dkJ3WnBuOSs2QzNQelR6T0xTaVk5SmlnMjZncHZRWXVvVkJEOUF0cDFQVXVt?=
 =?utf-8?B?TDVUdkd5anNoYU85RDBMNjl0VGRENEZraStPUFZuUVhGMSttNXY0K21tdnBZ?=
 =?utf-8?B?Sytza3IxUkRSbncyMHV0U1hhbXJ5T3M0SE16Vml1TTBCTzdHWkJ5UUY0emtq?=
 =?utf-8?B?TmNQMWRNNnN3T0VzSkpTcFRaUXNpR1c4MmJNWHVpcXpzK1EzSGhWNWJDSmxp?=
 =?utf-8?B?UTcvUFhrSktiUUlmVmIwQXVyRGlad1FuR0ZsS25TVnNrVC9BQ0dpY2ZIdFMz?=
 =?utf-8?B?bDJzWnllMEhsTEcwVUNTdFdRNWV5STltUldEZlVlcTJCa0c1ZFAxSTYvc1VN?=
 =?utf-8?B?bEV0VEErV096bkdVNnpjYUVwbEM2ekMxVTVSRTZMK3RvNnIxb1hGZ2xnRmw5?=
 =?utf-8?B?Z3RqeWVKa1l5MUIremYyRmszaFFLTFdQTmNMMDNqRE9yYWVWNzNHNm1EWEkz?=
 =?utf-8?B?TUFKc21LNi9pMEFSWURkbW1hL3RsaXVBZ1pLL1Q2YnlXSTJUNVMybStDMkRB?=
 =?utf-8?B?OXRXajhwODZrT3lrODVlWHRiWWdVVEY2Z01jUWkvTi8wWmVUOHRvdEUxRHhK?=
 =?utf-8?B?WkZUdFBMSE9YWG5kY3N6dytnRjBScHp3dUdISDhVNkVtT2VNcFYyZjB6UEVI?=
 =?utf-8?B?LzZ5NlFtY1NDZnpLTkdxKzhtbFdFbkpFZi81d0RMcXFsbEpmUVBXTFlrL2Uw?=
 =?utf-8?B?aGEyTGxxeU5FQm80TWE2bDdkSjdoWmszOHdMUmQydTF6NklCSWVwMW1VdUlI?=
 =?utf-8?B?RGhUTTI4SE5uMG5IOVlvKzZhamRaUUFPWHdpc3lDSHZ5SkxzNUpoOUpyQVMv?=
 =?utf-8?B?Y09KMGJwL1A1dzNCS05hbFRHWGt1NVRRS3V4WTBQSXlKSmFvemVhWldHYTJB?=
 =?utf-8?B?ZmFvNG1jT3k1Q0YvUGtBT2dDbWZ1UzVJSmgrcUJiYzV2WTRRdFlVb2cwQUNo?=
 =?utf-8?B?TFE4eEg0UkNlajY4M1N3ZG9QeEQ4Sll6N2VjTUoyWXozeXE5cWRzbkN6QTlJ?=
 =?utf-8?B?aEMwT09reFVnWm42K0s2RlFsMEM4VjI2bk9qK1pIVHByUmI0NUY2TFh0QlBl?=
 =?utf-8?B?eS9IbmNOQjlWTm04eHpFYjRIdFlHK2ljUHFBT0R4S3B4N1dCeTBQYlBzWDBm?=
 =?utf-8?B?K05XcnZQbXI0WE1CdXEveXliSkUyMmpnejcyN3EydWYwRW1OKzNMYVk2eEpu?=
 =?utf-8?B?dk9GYjZidmpjVXl3ZXJUVzRhL2docHhwbmhpdDNlaDYyQU9Ga0ZIOGcrR05q?=
 =?utf-8?B?Qks2YVgxUTA4em1lalh6bXNGYVFHeVhMb2N5TjA1V0Q5Y2xva2tnS3M3dlUr?=
 =?utf-8?B?NE9mdDRhZm0yaUlCcUY5SHoyZ3RDT2VRdWtiMGVHTisrU3NOeGdiRTlWVEpu?=
 =?utf-8?B?bHdyL0hHMUhGdEQ1YnYyZWo0MndNVzB3Z3lLc1hWNVo4VWJRM3FyVlFBUnVt?=
 =?utf-8?B?MWduRzEwNFVxYXBLOXVKcC9CY3piaDBaQStBQ2ZBVkZIeVhUQUhWU2xxVlBR?=
 =?utf-8?B?U2JMcTFKVHlkeTR1ZU1oR09aWko3UnBoUXNadG5oSzBGTDdUZGFwSlIxeGNj?=
 =?utf-8?Q?mZuwNW?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(7416014)(36860700013)(35042699022)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 10:08:15.7170
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a05f708c-eeea-4f8f-8192-08ddb3d033ae
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C715.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10264


On 25/06/25 3:22 pm, Lorenzo Stoakes wrote:
> I am doing a great deal of review and getting ever more involved in THP
> with intent to do more so in future also, so add myself as co-maintainer to
> help David with workload.
>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---

Acked-by: Dev Jain <dev.jain@arm.com>

