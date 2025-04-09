Received: from YQZPR01CU011.outbound.protection.outlook.com (mail-canadaeastazon11020139.outbound.protection.outlook.com [52.101.191.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD6F2676D2
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 15:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.191.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744213999; cv=fail; b=F9XM2+bdtIeo3cpEWKzDl4Spuyrx4F6JwprvKTG7DkT/1gAI9eM6VsClegNjD36G34bUwMlfZV1L0qdu9ELxirwOUivhYjoG7W0mz7GaI7vmqQWzPICXFH8xKF2iZ3NEXI7xfvDZ5YdagTJd+2hxAJD4+YjdwaP3fC7mNCmuQIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744213999; c=relaxed/simple;
	bh=2AyEdY3678SbNIq8+k3U/4Z7a8nEkste7iznurS5rVY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ruC9Apv1negHVzzcP8twp0ld7SJbSNO1KzpzgIG0+iatJ5GLNeeEHsM28WRGl/XGjdO2yimw2M1CkIEY3DWWZf0znERMZcgRDa873rGFD2X5rprQzVmmJ3ndXj240aQm3js+sp5g3MciCx6S2BsQCTRLZMvrMnA99fcRgvkFFms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=RfGFXoC5; arc=fail smtp.client-ip=52.101.191.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="RfGFXoC5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KtUU/EhbDVxjIiioO2Qt/tR24FFOt1WjWdGRIG+1DGLF5xLXTXL6goOWKoYUwgTFGVHslXJBYy4hXHpaQqvxpubolp85vC3mdy5mM6pjQ5XxJd/R/eECyoiNz7iqDvzphk6C/bWIUTHvQdRUBPeZmDhsNVxRVb1UN9HtkvvxFlNn/F+qpxKoTaIGEJ3fg7+UREW1WHa7qvNg/gNqGWnHZhZRMF2tLiIeK0E6ePT1Y1BSVkrM7unuqJJ3g1lmYEipwP3QMQPNOZKxPXUjOxZjNdeb3BMn9ABqvgYg1F66mYGKBme31JqqKyezy5SDOP5cWCtfRyE4OPk04rXSc8hKiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3erLUUutDFb/cN3DxVByNrXKG/wXALdzN+a7WGKsGs=;
 b=TYupa65qaCHEjbrhDW3lsuSznk0izQJVxbOpoYonnIJ+UhduX2gAmC4odKdZMwGmSbcWTK4+JxMMMAP2nIZK5/kM7o64T/m6/dV17DyaRgWof29XNWe3tDbsRFwdhVxc9WJ+DcHSIv1Z9HO/VzEgCwJlOMRTKyE5I6yuo6ermWpgSyalIKNdX6rUXaNAwQwhePdT0MKD1DbKMUluOG9pkR4GRWFfSfGgd/3a4IT1LHe0f9tJSN8/gCsZyckxvEsU9P5ZXVtPKuWm9LFSTdb9PbP62SOvDoee9UwNPRYnkvXUv2a6u41TX10nx5+nEvdV1fboOOE74GcE01kpcX40bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3erLUUutDFb/cN3DxVByNrXKG/wXALdzN+a7WGKsGs=;
 b=RfGFXoC55Edmty8CLZo/HTZP8pAAqyTIy5yjam0YadD5ncC9qQ3YI8FwEwocozGtjxjWwq2HzzbPHCBJsVM3c3ZiODxyGbAaNp8Ikga7rM0zZRThip5pFRlTan0VgkW62anc78a7cN47jSsiXp7DG4sUwLyZGpoq1emWWzdloR81xYE2yS0Orpv4XKV2nvbDmGC487DAIqq1M3EwD6jDuOMYnqbwJblI+eQKiiDqd3A9jcXYyFjl1ztxG6b9WV1y6qY/k1roIyK1nJy3gC+CdQlSqGbtS3PZuczSH1xNx6bNhQ1sF9zLRE30bDg1hqgSY0Pl49KK8+3BPVCpdRgO8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YQBPR0101MB9199.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:5e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 15:53:07 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4%7]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 15:53:07 +0000
Message-ID: <e916f393-b18c-4641-ace7-cf23b7508e09@efficios.com>
Date: Wed, 9 Apr 2025 11:53:05 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/3] sched: Move task_mm_cid_work to mm work_struct
To: Peter Zijlstra <peterz@infradead.org>
Cc: Gabriele Monaco <gmonaco@redhat.com>, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@redhat.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, linux-mm@kvack.org,
 Ingo Molnar <mingo@redhat.org>, Shuah Khan <shuah@kernel.org>
References: <20250311062849.72083-1-gmonaco@redhat.com>
 <20250311062849.72083-3-gmonaco@redhat.com>
 <20250409140303.GA9833@noisy.programming.kicks-ass.net>
 <c0df7480-1c18-421f-9348-2d39b7bebb49@efficios.com>
 <20250409152025.GK9833@noisy.programming.kicks-ass.net>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <20250409152025.GK9833@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0084.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::20) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YQBPR0101MB9199:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a2b2a22-a2d3-444b-a9b6-08dd777e9ea4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SlVZc2VPVmxoMUFLNzF0aXNRWkZXK3J0YzE5K2ZGZ0FsNHhGakp2VGV4eDBZ?=
 =?utf-8?B?dmtRcGtNaXJ2Ny9DTjNubUxhVWdteU9vVXEydzdOaXk1UWJoNkVHUDEvTUxp?=
 =?utf-8?B?R20yNG9mRURGVWpFbTdxZ284RVFuc1l3MWU1cENnTXhZbEVlNjZVcTl3Q3Jv?=
 =?utf-8?B?Tk9mOGpha2Yvb2t6T0djYUF4MktvZ3VkVVNCZ0FMaHUzTk9DdlNEREFWd0pY?=
 =?utf-8?B?QUNoVFVTdFhnMzFWZnVUdTlQbllWZ1dPckpzTzlybURyUjJXcGpHUnMvNFYr?=
 =?utf-8?B?Qi9XdzY3am1JbCtCSnRNaFhKdnRxWlowWkQ3OWszRHVyRmlVUjZRbkI4cUVR?=
 =?utf-8?B?ZmcyWmVHN2daTFpjZ2xrdzNJclBJdVhTK0ZzaEFhMVllNmNYbnFwWVZjZG9t?=
 =?utf-8?B?UCtxTFFFNjlHYTJ2NUxPSGN3d0ZEdTB6V0VJWmNqZGtQMkFEaE5sY0NCSk03?=
 =?utf-8?B?STZvRzQxNldheWVYdTQ5NGErREdiZVlmSEtSNVlYZ29Vb3hocjl4YjJHT1R1?=
 =?utf-8?B?dUtSTXN5OFBHLzY4bXpBOFdhMmUrRmpGSitYOHdsM05hSzY1SnVNQldUSGRJ?=
 =?utf-8?B?RjAvUVFrcjdvTmVzbmV3Vk5mTjF3ajZIWnNCRjNaMXdFV3MvdlRYQ25mbEly?=
 =?utf-8?B?WFU0dXoxNWwzcXFhWWQxVVJ2TkVqRDdDK3h5RVlYWDZzT1Q0clQ0YUJWV29z?=
 =?utf-8?B?M0JvdEJLTkR4bXNrZWdVK2V5djZiUmhYY3FyOEc0S20rc2V1RStqWHVJZW92?=
 =?utf-8?B?bEpYUk9FMWR3VitMT1F3MG5FOHlCRnR3cU4rd1l0aWVKV1pQaXdkN3dMRlo0?=
 =?utf-8?B?ZEF5eU1hU0piS1l0bnp1ZEdqQzZjTnBmZnptNkZkQnkzL01FYlovU1daclhU?=
 =?utf-8?B?eDEyOTc0NVY5TkNodWZYSzJhNnhCYjZwaTl5UFpnbmRJZ0lhT1cycjlCRTRO?=
 =?utf-8?B?RmV1SEhBVG1ENkt2YmNQOVdWMHZZTlpGOFNkMHhKSkkyMDBOaGFGMTNUVkZJ?=
 =?utf-8?B?cm8yN1EzV2dwakprNlRuWXcybXFnY2lKQlZXQnUxcVJRbG1ZWGhGd2Y4MjFC?=
 =?utf-8?B?cUJTcC9QMk0zVUFDNmxmY3dyS2tPU05LdEpzTnlYMm9TamcwR1M1WTI2MHZs?=
 =?utf-8?B?ek5mbTlpM2paeHB0cDNuRG1MUEx1M0UwTUUvYk1HSEhNSlQ2VG5paHJzMjdI?=
 =?utf-8?B?d01pYUxMZHZCRWo4dlphUXBxdC95clg0bDg0OGtVSVNSL3EvTFpjRjVNQitv?=
 =?utf-8?B?Q1gvZXRoKzhoQzlMQ0huaWNPV0VjQ0ZsVnJrQmxaRGRNN1NZYWpKeUxLZ0FJ?=
 =?utf-8?B?YitwZzFNMEtPdnFxQVJBWmJQd1NYZSsrMyt5d1FyQmZtUGQ5NzlHUUdTa2Z0?=
 =?utf-8?B?YmNFM2ZsNGRlNzc1c09XQjJKYmxFS2VMbm1oSFdXWXlOb3Zsai9ZZHRYbUJE?=
 =?utf-8?B?OTJDM3N1ck1CQTdNZkVRSWtaZ1ZLQUdXcGxHLzNHa29mNzI0aTN0RHVBc24r?=
 =?utf-8?B?a3c2empYa2xSQno1MUpzTUszZlVyZkdielR5QlpjRUJZTFR2MC9WZHgyK2to?=
 =?utf-8?B?czFXODhmckZPdkgxaWF4WDdGVXk2ckRQaVlwR1ZPdG1NWk5Dc1ZjVFU0SXRX?=
 =?utf-8?B?NUFHSk1zQ1JBTkI5T1VxcXhCL2FZdGNURGFQOHlleEtsT2xCbmZNbUd6ZWo2?=
 =?utf-8?B?RHh3aFg2eVNHb28xbkk1UGlCakJWUFVLa3oza1Q2dUlKZlZpZXBQd0pVY2Rm?=
 =?utf-8?Q?hs4Cx0qTxphiaQ9ooSQUBLFSrH2jHtTUzTnDT9F?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEM0T1pmWVRrK1ZFbmp6NTlEeTJzMmxzMnFoeUlrSHFBc1d2VzM0NCsvMWZQ?=
 =?utf-8?B?TVQ2MnNidWVCUFFZdCsra005MVUyY2U5d0dUUWs0TGJuc24xN29TRHJzalVG?=
 =?utf-8?B?eC9Iek1vNnVFZld2d0krcnN4M2ZibUhsMnRVdUI4dzByc3VSd2h5VjFDWVNl?=
 =?utf-8?B?NFZSS3cwaVpjRFQ5Zlc3MFFZWDBScjV3aW1ERitZZWJCVUNBNlZhUkFyWEt6?=
 =?utf-8?B?YWdZQTgxQXB3VjhRckxtU3BMOEFxcHJ3VW81dEE4YVNWSWZhaFg3OGl2NVdI?=
 =?utf-8?B?TzZpVGdSaGxGaTY5MXVnUHMxWnh1ZUVvd0FPbVpkZWlaK1RyZGpLd0xTYzhJ?=
 =?utf-8?B?T3dZeWRmdk1PSmpNUDdRK0k5bmhhS21TUDRtLytiZXUyYUIvdzN2aWZoRm1m?=
 =?utf-8?B?Zk94N0hOcEtUTkxJUHB1RlNIZzJEM0pBWnUvZXRwTVkySVNLNitObWVYQ1JK?=
 =?utf-8?B?S2YxVXZDRXJoRVFrRnlOMTd0akxVYU9TcndCbVlaQkRnd1NqT0NYOU1XSWJi?=
 =?utf-8?B?Mlh2cGlnVW0vOWJwYm9UNy9TQ3BpbmgzbjNuVXprVi90dVJteGVla3hoWC8y?=
 =?utf-8?B?djJZaGVtVlp4OXJ6NE1KVXN4bnJrdnVTRlgwWE5GZ1RCL3JJcEpCUkpsNmFY?=
 =?utf-8?B?VzYzSzZ6R09IMWxUV2pmV2tBWlJkZ0p2eDV3b05zVHNGQ0dDdFdvNmpZdlUz?=
 =?utf-8?B?QitSNE01SFMwUkFTUU5nR3Rad05lT2xjWnkzYUFFRnp0MEVZamI1eFh6SytG?=
 =?utf-8?B?Vi94VktlYW9GN0RFckx1My8zVHl3S0hPbFV5L1RNTTB6M0NqdGV3OUdGbWcr?=
 =?utf-8?B?YnhLcC9vVlp6N0h2L1V0dTUzRnlXYVVWcFVZaDd6TVJOb1UzRkMwOVY1aHVI?=
 =?utf-8?B?OHIzVFFiTEQrMGJ5NFQybnlBVWd0T2RtT1hWRWZ6QjIyV3RzOXJuaThQMFRj?=
 =?utf-8?B?RVBuZ3ZicjdlQ2x4Wi83c2xlWHJiYW9UbDRKdFNBTHM1cW5GRysrWnpuK0xQ?=
 =?utf-8?B?Um8rY0ZsSDY5RXBuY2YxdTdWVVN0NlFQdnFIbDYzVjQydEg1QTZsb09yTzZk?=
 =?utf-8?B?WHFSbUJONHFEWk95TVc5Rmx1MURITjdrVGtHVERzalUzaHJVTmI4L2Y3K3la?=
 =?utf-8?B?aXRqT01kQ3RFa3NNZ3Awb0JGaXFJcUV6OHZTTkNSNEdHNDlxQ2NIVDN5VXgz?=
 =?utf-8?B?VDdmK1BqaGVRRVVFSkY0UWRFT3k4VlA2SnFpREdiRGxQc2hRRlZoUytUSXdz?=
 =?utf-8?B?a0s2NWJYZHM0TjZtQTcwQUpReXVpdVBtR0NCeUhpaWw1anB0Ump2MEtWcDlO?=
 =?utf-8?B?UzBVQlh1QSt5aWFpekRFVE5xREpOSW82dzdrTjFlZ3J4QlVnV1NsRlEzOTNl?=
 =?utf-8?B?S2tBTVVPQy96QnhxaXNvQjFhRGlKK3FnVmhwUGZ4NXBmY0dMemtKTUlhMHV0?=
 =?utf-8?B?VFV1YzVlV2JFVGxYbjIvMVQrSG9EL1BHczgySmRxMmF4RGd1bEhBUVlheWhH?=
 =?utf-8?B?aSszSTN2cTZmTThZeEdFbityNmpUL3JuQ2ZsN3NHVFA1V1A5T0gxb1BvMFZa?=
 =?utf-8?B?dkliQjBodm05VzZYUXN3cVNUT0oreFFxR2UzWjdxYVM4amRFYzhReGpLaFMr?=
 =?utf-8?B?TFNHcEMreU5oZExNSmlONVZHekY5R09jcnJoMVliWGRRNi8vSmJpd3p5L3Qx?=
 =?utf-8?B?b25kWW1zOFVnbW1WWkg1ZmFXbzcxMi9aY1hkaVd5Z3N4NkdGWWRtZTBiQk5W?=
 =?utf-8?B?TG41T3N5WnlnOVdMeUM4eWxtb0VZd3RIZG1KUnBhRVZQODFPeTNNc1UxWFB1?=
 =?utf-8?B?TTF3czRZclFsOG40UGwrYy9CRDlJZ1dmektGNzB5RndsdW9yTFc3Y1BPUjdw?=
 =?utf-8?B?YVViNDhweHVLNzM5VEtOQVlYb1RINFlHcEFUNm5kS3hVZTU2eUpPdzhZTW5R?=
 =?utf-8?B?R1BIOXZnMjkxY1VDODRMcmE4bnI2WnkrS3k0Ri9qc21hcFRqWlNydlB4Y3Yy?=
 =?utf-8?B?ZUdBSzI4eEJ4enBLb3ZDKzhBR1dPUHAwYWhQWlloRWpIb0JZRUNwblVQZjBk?=
 =?utf-8?B?c1ZkT0JnYTJrMjEyd1ZieUFjWkNJek1BZW1qME1aTkI3cXJaeWsxMGtGOWNs?=
 =?utf-8?B?bWY2bTVuT3lEUWhLelprZm0rM2g3N1RDZUREMDdkcFFnMGc4M0kweWpibG1u?=
 =?utf-8?Q?xU8cHAYGVwxg22091FkGg9k=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a2b2a22-a2d3-444b-a9b6-08dd777e9ea4
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 15:53:06.9738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zpSygDaLXESiuPtV14ftdnFIkbpbihy22siJ/X2FYT8yyzK9kpEomAby/wSaXmM7FVutdEo8F84i7K9ZnbDWLvGCO0G0V376RRmHXqvgpAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB9199

On 2025-04-09 11:20, Peter Zijlstra wrote:
> On Wed, Apr 09, 2025 at 10:15:42AM -0400, Mathieu Desnoyers wrote:
>> On 2025-04-09 10:03, Peter Zijlstra wrote:
>>> On Tue, Mar 11, 2025 at 07:28:45AM +0100, Gabriele Monaco wrote:
>>>> +static inline void rseq_preempt_from_tick(struct task_struct *t)
>>>> +{
>>>> +	u64 rtime = t->se.sum_exec_runtime - t->se.prev_sum_exec_runtime;
>>>> +
>>>> +	if (rtime > RSEQ_UNPREEMPTED_THRESHOLD)
>>>> +		rseq_preempt(t);
>>>> +}
>>>
>>> This confused me.
>>>
>>> The goal seems to be to tickle __rseq_handle_notify_resume() so it'll
>>> end up queueing that work thing. But why do we want to set PREEMPT_BIT
>>> here?
>>
>> In that scenario, we trigger (from tick) the fact that we may recompact the
>> mm_cid, and thus need to update the rseq mm_cid field before returning to
>> userspace.
>>
>> Changing the value of the mm_cid field while userspace is within a rseq
>> critical section should abort the critical section, because the rseq
>> critical section should be able to expect the mm_cid to be invariant
>> for the whole c.s..
> 
> But, if we run that compaction in a worker, what guarantees the
> compaction is done and mm_cid is stable, but the time this task returns
> to userspace again?

So let's say we have a task which is running and not preempted by any
other task on a cpu for a long time.

The idea is to have the tick do two things:

A) trigger the mm_cid recompaction,

B) trigger an update of the task's rseq->mm_cid field at some point
    after recompaction, so it can get a mm_cid value closer to 0.

So in its current form this patch will indeed trigger rseq_preempt()
for *every tick* after the task has run for more than 100ms, which
I don't think is intended. This should be fixed.

Also, doing just an rseq_preempt() is not the correct approach, as
AFAIU it won't force the long running task to release the currently
held mm_cid value.

I think we need something that looks like the following based on the
current patch:

- rename rseq_preempt_from_tick() to rseq_tick(),

- modify rseq_tick() to ensure it calls rseq_set_notify_resume(t)
   rather than rseq_preempt().

- modify rseq_tick() to ensure it only calls it once every
   RSEQ_UNPREEMPTED_THRESHOLD, rather than every tick after
   RSEQ_UNPREEMPTED_THRESHOLD.

- modify rseq_tick() so at some point after the work has
   compacted mm_cids, we do the same things as switch_mm_cid()
   does, namely to release the currently held cid and get a likely
   smaller one (closer to 0). If the value changes, then we should
   trigger rseq_preempt() so the task updates the mm_cid field before
   returning to userspace and restarts ongoing rseq critical section.

Thoughts ?

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
