Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2056.outbound.protection.outlook.com [40.107.95.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFF91D89E3
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749555208; cv=fail; b=uTmVFzGpqZKQYHPIbgqZHnV8qiKPX/VRIuBPkCFOf9/FycxGWxEc+y5PYVxYSrUTpxu2sPGf9Nnr6VA1jyjUYwIArNHQlCx9C7/4AhmD8ZQl37Lj7Fdt1EUhRRBFipfg35TaMsFyraxl9kUlATqGo5nKwy41bZbLZVawrzGDgeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749555208; c=relaxed/simple;
	bh=9maQiiaJmLyyo5hoJeWAnEl/sIGzTcH/7Uw3fkG58/I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=g6rXnv77JeVpDnChR1ITYTchlbAea0mMVMnYWlkycnZ13tsMRxwTlMhai2fM0GMJx9EkshGe7uIoGne0U9bXcRzQVkpX36SeBRifa+udIbps2oovCSSEUfCgKqckfhso7DS87SVEUH6m0AeTj/Uoav3qL3W1dCIo0feoldgUYwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zqT45sOf; arc=fail smtp.client-ip=40.107.95.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zqT45sOf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D/eCSmL9yXMt/DG+syokc+e7jwkrkaYhWOS5MxGgSKG8jrHCnVPlDDqBmNbqHO5yRSVblhN+VuOFauRuOi30k34umDIDuwkiiF+L3DBsYnRQMzD2+mgXi1lfoNuFNe1WWIvqPMSJOpdhx8OrMyi8XAX8hi40XFOMcWuKM4NoWEXbnTY477uQZFRLhBcIcl3BmXYXtHJZb1SMyWS6hqHyGbjLmLzPIjLXOoFKfuqi8p+duJczR9qNp/k1GW/cR9Zsc32UKN305EY+CW0ZYeosEERdhecUAjaZYlHduPS5mKxhzNN500MP45YA/naJ80wSxH2vanMGieIAJL0Vl9xBlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zMM85KVvjefkEU/EPZ96HSKeINoMFRZlKs5oXKWKuHM=;
 b=ZLvILoQAdNt1yqpDPgfcGINl/uSFd/FfApC/bohLsg2eeahi3Hv+gv3QgmFS9WJRTFNToZn0SXy2OoXQYU8HC/WHmuu6LgAOVUryZ54wyeOCeWwS3+wFggGomm0OglbvGLGN96KYj5NVYIVzd6ham406VJNs3Bg2nS6iWqhUWu9dSf2NOnxylGzHOyycfi/mj41lIcGvxpYxdgaimRJoMwHxqxfbjy0tTCtjTdfJ3miSv6EXp74E8WM5mzeEk6h3FVsLW6NuSPmqjnUHjvzR7YbSaHok/gL9qZG4g/yf22XqViPJ5x/vUDFTzPr3isqTe/zkEwj4mavwIjFE2lKztg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMM85KVvjefkEU/EPZ96HSKeINoMFRZlKs5oXKWKuHM=;
 b=zqT45sOffS8f1+fTK3t3M9RN1UgahCVFy9O+b5UmBRgR5OoFyOZytyMIQw5tOvc/3Tbx6oLJt4Xj+K9sYZMYM3SvcckQsKldlWiEfNoiGq/zrbcCfQQo5ZUV9yK7Cc4NDYpEAK6fwpgkllzeKEZMwcAH1K3iuSxMWqZQTup/jkE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by PH8PR12MB6890.namprd12.prod.outlook.com (2603:10b6:510:1ca::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 10 Jun
 2025 11:33:24 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%7]) with mapi id 15.20.8792.040; Tue, 10 Jun 2025
 11:33:23 +0000
Message-ID: <a5da2e4d-c042-4d01-bfc3-f50ca674247b@amd.com>
Date: Tue, 10 Jun 2025 17:03:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] sched/topology: improve topology_span_sane speed
To: Leon Romanovsky <leon@kernel.org>, Steve Wahl <steve.wahl@hpe.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 linux-kernel@vger.kernel.org, Vishal Chourasia <vishalc@linux.ibm.com>,
 samir <samir@linux.ibm.com>, Naman Jain <namjain@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@linux.microsoft.com>, srivatsa@csail.mit.edu,
 Michael Kelley <mhklinux@outlook.com>, Russ Anderson <rja@hpe.com>,
 Dimitri Sivanich <sivanich@hpe.com>
References: <20250304160844.75373-1-steve.wahl@hpe.com>
 <20250304160844.75373-2-steve.wahl@hpe.com> <20250610110701.GA256154@unreal>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250610110701.GA256154@unreal>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2ae::7) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|PH8PR12MB6890:EE_
X-MS-Office365-Filtering-Correlation-Id: 93b1d904-4567-4ac3-f3d1-08dda8129ba7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?anZzZTl6aUJiUjIyUmJhYmgvNXMvSUVmTkVsRTdaL2p0NFhZakxjMCt4RWtw?=
 =?utf-8?B?bWpGS0ZLbm4wbThCQURXdlpia1loNTJTcXBKaEdPVGFBaHFxWXdhcHhpckx3?=
 =?utf-8?B?eUdNbGJ6OFdxUGdLWW80TVZHczkvdUduVGlabmpsTGhvQ0UzZkQ0akdqS3Ey?=
 =?utf-8?B?UnNlQUVZcUNLQVdnSWRlK1VNZkdVdXdaSEthcEsyYWxxb2JYNExlTFBtTlpu?=
 =?utf-8?B?T1hleG5wa29ZR3JrUlZML2c0NFd0bDlpdERwR2cwK1hBZW9XK0JEeEh1ckxF?=
 =?utf-8?B?MXlpSXlTaW5iNDBGcWpJME03bWdiMTd6L3REa1JrRWRrYzZiMFRITjFhK05z?=
 =?utf-8?B?T3RuajNBNlBHSTh2WnJTS1dUQzh6bDFaSEhrS0QwL0F0anRuMGZWcU1uY3NZ?=
 =?utf-8?B?anh4N1M5bXhQa0JMR0pMbWVxYjBCcjJmdmxhNHlmUzRSRHh5eUlsb0JXMHdD?=
 =?utf-8?B?ZUlMNDlvbi92WVg2RE1Qeldvb3RTVlJXVElqNnVBWTA4M1F6anJINnBuYm9P?=
 =?utf-8?B?T3F4bDZFcGJ0d29WVVVtNW0wNjVNSlR4YjQ4L2RxUGtvQjF6WTJJNzMyWUFJ?=
 =?utf-8?B?WDFaeE5EaTd1Z0ROY1lINHpFT2R5eFZKMVYwYkc4TlQwR1hreURoanNXTlM4?=
 =?utf-8?B?RzBPb3BlVlRBTTFZQVAyWFRtdkViVWlqOUVWZWpINzY5S0NCSTRVT0NkMFhQ?=
 =?utf-8?B?ZDdVNnpyTXhaUnlYU1RWalFlZjlOekxNYnB5ak9aeEk2UExrbVVZWVphMnRD?=
 =?utf-8?B?VkVQQnArWGQ3V09UWUJjOEpwZDBDSjM5ZlVtN3FpZVpJdjg5R2NlckZIWlpi?=
 =?utf-8?B?ckNTeldSQjdFK1lMTU1DUlc0UWFxL21tYXFGeWU4aDZ0UzR3d1gyekp2L0NK?=
 =?utf-8?B?QzZEYVpTQ3FJd0UxWW0yK3ZoTWNLeXFPendUbmRmNXplcVlnSGswL3Uvblgv?=
 =?utf-8?B?WEhBNnh0b09ZLzZCdnFyRVlQNEhRT2trTlFJMXlHZ1ZzamtPcmtIUFRPZ3dQ?=
 =?utf-8?B?SkRBUmtOYTZHbk9wcXdKT0poVlFVQzVrSkszT0l3bG92Y1pkN3FQbTR2UEhi?=
 =?utf-8?B?cm4xRy9zQ2xob0JVbnQrY0JsbEdVMGt1RW5CUDh2MmhhdnRLY0pOSTd2YnF4?=
 =?utf-8?B?N3JvUmtGdGJSTzBtNU9PZFh3Vlk4Tmo3VlhSOHZnUEpvc08rTElPN3dwaWVs?=
 =?utf-8?B?SVoyMnpRcXZJcXFXV3dIZnFYQjZZTHdmUGhhR0hzT2lIK212SXdmN2FmVjhM?=
 =?utf-8?B?ZjNyWHBJTE5UMnN1czJtRWxJTC9HbklJUlNPNmtieEtEdDhrbTJPdzJ0eG9y?=
 =?utf-8?B?dk1PMHVjMU9LWmpTMm4xZXc5RWpCQnJXb3Y4SkxaVkkxWWJzeS9mZFpJSW9D?=
 =?utf-8?B?eWZGQ0dvVCt6ekpiOTVHa1JDWWRieGpZU0NGK2dWYjVPS3JMYU1HUjhaM2ZW?=
 =?utf-8?B?NktMWklBenFvQzJ1ZE1QdWtlZFZuNUhva082UEg2VUc3Y0kzdHd1TGFFbkNE?=
 =?utf-8?B?aG1IbUdDM3ZyYVp0VHRER0gvNDFZRXR0ZEtmVExOMHdEL2NqZXR0VFY1Z095?=
 =?utf-8?B?TFdCdDIwdVBYdjhtQkYvYjdtQk80aXF1T2RiZCtoUjB1Qy91bHFJVkc0c2k0?=
 =?utf-8?B?Uy9VZ2VSTmVjUTNnQlNWUzMxWVFWMzJIeFlNczV1UGhMazhNZmpHcTNsR0VP?=
 =?utf-8?B?MFo1UVlDaXRkWCtmdlNudTdpYW5IU0pBd0phckFLL2V3bFJzblVLdlRpSS95?=
 =?utf-8?B?dC9VSUZ0YW91VVh4UkpjdU5DNnNjUEdtWjd3NnpURWZ0MHhGMk9ObHVDK3V1?=
 =?utf-8?B?bUlNa3F4cmNJeVJCbEN3aXpjZHFwZjBsakZQTjdRQkM5Q0FDQVVMTUoxa0Q4?=
 =?utf-8?B?VzJvZVFVbHM0L092cENvRU9ib0RUb3pQWVIwODhxYkZiaHZsMkY1aC8vS1VC?=
 =?utf-8?Q?ema4CrXOQ1c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGorVjV3NGpVM1BLRkxpdklJSk10VDQ4ZVhsUEp5RUoxQ2VaR2JSUUFEYnkr?=
 =?utf-8?B?aGpqZ1hUZW9mL3I3R1lJSnk0VDVNa1d5MDZhbStkK1E0ZXo2dUZ1c1lxWW9x?=
 =?utf-8?B?TDNiM0c0RFdselFDOHIyeG1IcmhMdnE2VEY1SlNGMEkrUEJZOUpHb3RWUndE?=
 =?utf-8?B?SFMzYndlakcweUFqN3RkYXpBaGpqdi80VGtOcS9YbTdCSkJDWnRQcjAyVFRB?=
 =?utf-8?B?K09USnQxcG15emZFWXcrZlZNcE0wb0Y5RzI5YVRJRzBRVkFJNmpPVFgxMXBp?=
 =?utf-8?B?T3ZrOFhnekkzU3FEUzJhdnh6cUFsZmxCcmZMOU9mVGJQWG9CWGtMMmV0RVBs?=
 =?utf-8?B?ZnhYWnJMbmhZay9sUGRVZFZFMWpsQVNXc1p1TWkxYjlHaWxCWEgzeTduYXhw?=
 =?utf-8?B?bmJVM2tLdjVDcTNBWDBmR0lQSnB2dkc5VlFtZmNjRy85OGZrSXdOT1h0OWxv?=
 =?utf-8?B?bkVIUnpPNFBGNWRtR3Nwa2ZNUThvUDRiVXBUdFl3K1I1ODdnMU1Dd05VQkhT?=
 =?utf-8?B?N3pkb2hDbXZqMXlKbDF4Ynltc0hrS2VWb2NBLytzdjVDSXBPZWNLbjByYk9V?=
 =?utf-8?B?Y1V3M1dSRnhNSDk3UUI1QTRORy9Ea0w2NDQwaDJ4clJNWENWK3NjZTNDVmZ3?=
 =?utf-8?B?bmJKQlN0TWU3VGhMcFpsVGw1REJGUmJuQzdZZFNmMERqRkdHdWRISGJ6SExS?=
 =?utf-8?B?azJNMGpMS0ZIbDU0K2dPSjVwNDZ6bDFoYUJ1cUd5OXIrd3p3d1hLYVUrVFl3?=
 =?utf-8?B?MDY1Y2VKcklmOFVRYjJlU2Z6SnNqbXBXVmo3RGs4UVlMRlM4U2dBeDF3VHhO?=
 =?utf-8?B?WjY4UWRIdVVZYnd6elorZDdOcHBjK2ZUMk03UjJUQU5pTVlIZzFWY0xMVU9G?=
 =?utf-8?B?MGdMSWJFYkJXUkg2WHc2eG9IbUxteERLeXRxNVY0Zm5WRVFTbDd5TDZHdGRx?=
 =?utf-8?B?N00yTHB1ZWpGdURWclp2dk5XRWJsNDdTdEt0STNJWGVzWXpPQ0creW5hOW5I?=
 =?utf-8?B?OVdhK1hsbXdudWpYSllWa0VXL3ZacDRpMXcvQ0JuQ2I0ZDV0cXQrMnZVYlJ2?=
 =?utf-8?B?cm4yRklYRFZQZ3FCejlEd3VnKy9uYVp3dmV0QmJiNlliOFV1ZjYwTkpXTzJl?=
 =?utf-8?B?MTY0dWEzMk9uN1R5ZEVzcG9xc0VCc2RJU0x5emlxYXVHSWpWenk1TGRDQjlQ?=
 =?utf-8?B?T3JwNFJoanlBZVdoNnkvYU1JdlMwd0tJVXpOQlpabkdNZmh6c3Rqb3RXa1U1?=
 =?utf-8?B?Q0RjRkpBMSt5R1JQeDJhMGErTE5KVnczclFTa1ZNUEd6bC9aY1FleXpPTExh?=
 =?utf-8?B?V2pKeEo2YzVVbTl1Y1BIREUybDBzTkdSLzNCck05UFNRYXJnalBuK3lGUVFV?=
 =?utf-8?B?OW4vK0dxWG54NUVBTWpwQlVQS2Iyak5EcEs0c2M1enUrbWxhdkZzLzBhMDhw?=
 =?utf-8?B?QVlpTmkwcFMwVVEvNXZoay9PUjhzemJ2N1NxcEF2aDlVMElMWEFLUUlDdjI1?=
 =?utf-8?B?K0ZHVVJJcGhLWkk4VEk1RnlQVmp0cWVPRmtLVmJ2VGxRRFJRMWNIR0dLeGpZ?=
 =?utf-8?B?WmdsSVRBVlJpNFRDRGx1UFowUzZVK1V1R2gyTGh6aTBSeUZrUWNIWE00Y3Zr?=
 =?utf-8?B?M0pQTVEwRk9BZCs1MlFZdG1kWFFPR2xMUkRMWEpka2dSZzdBalRnNVZoVnJp?=
 =?utf-8?B?cE1EdzhwblpZZXZqbGxWaTJzZGRDdlllc1c0REJ5WUttY21YZWxSejZGbENZ?=
 =?utf-8?B?R0FkZzkrVW5Gd21sYVBORy9GQmgwK2Mwam9LUVhOVHJIUmRJY2JnbnduS1Nq?=
 =?utf-8?B?VndFdXdiYVo4SE8xd2VRVUFWTXIxV21OVTNXUXp4WmtBcHo2MERaMlRjU2RK?=
 =?utf-8?B?MERxYXJ6YXFnMzZ0M0N5ckttRXYxZEFsNTFqSDV0MTltKytUNGZ1VXFlVktr?=
 =?utf-8?B?L0FJTWN6SURrVEJFaGR1V3ZCcmVuR2c2NmozOWswNnZaN3BLak5SNUdBTm42?=
 =?utf-8?B?WklsMzYzMG9IS0REVnFtWUhQaE9xZHFCa3pGYUtKSlMxNXdQWlpIS1E1SWZV?=
 =?utf-8?B?T3lwL1VCQnlpbEpLRGk0aEw3SmtMNnNtcktqR2FjL2pwdWNqaURKNFBvNFdJ?=
 =?utf-8?Q?a0KK7eYKDxGd1oVjTeeGlyU6+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93b1d904-4567-4ac3-f3d1-08dda8129ba7
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 11:33:23.4921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y+iLf5VQjnI4sW1WBRr2EV/hB3hdRupoNo4s0sLc1a+thB9Sb69EWGQLltKTyqVt2EwvUxuooXwazA+5cYJH9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6890

Hello Leon,

On 6/10/2025 4:37 PM, Leon Romanovsky wrote:

[..snip..]

>>   
>> +	if (WARN_ON(!topology_span_sane(cpu_map)))
>> +		goto error;
> 
> Hi,
> 
> This WARN_ON() generate the following splat in our regression over VMs.> 
>   [    0.408379] ------------[ cut here ]------------
>   [    0.409097] WARNING: CPU: 0 PID: 1 at kernel/sched/topology.c:2486 build_sched_domains+0xe67/0x13a0
>   [    0.410797] Modules linked in:
>   [    0.411453] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.16.0-rc1_for_upstream_min_debug_2025_06_09_14_44 #1 NONE
>   [    0.413353] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.13.0-0-gf21b5a4aeb02-prebuilt.qemu.org 04/01/2014
>   [    0.415440] RIP: 0010:build_sched_domains+0xe67/0x13a0
>   [    0.416458] Code: ff ff 8b 6c 24 08 48 8b 44 24 68 65 48 2b 05 60 24 d0 01 0f 85 03 05 00 00 48 83 c4 70 89 e8 5b 5d 41 5c 41 5d 41 5e 41 5f c3 <0f> 0b e9 65 fe ff ff 48 c7 c7 28 fb 08 82 4c 89 44 24 28 c6 05 e4
>   [    0.417662] RSP: 0000:ffff8881002efe30 EFLAGS: 00010202
>   [    0.418686] RAX: 00000000ffffff01 RBX: 0000000000000002 RCX: 00000000ffffff01
>   [    0.419982] RDX: 00000000fffffff6 RSI: 0000000000000300 RDI: ffff888100047168
>   [    0.421166] RBP: 0000000000000000 R08: ffff888100047168 R09: 0000000000000000
>   [    0.422514] R10: ffffffff830dee80 R11: 0000000000000000 R12: ffff888100047168
>   [    0.423820] R13: 0000000000000002 R14: ffff888100193480 R15: ffff888380030f40
>   [    0.425164] FS:  0000000000000000(0000) GS:ffff8881b9b76000(0000) knlGS:0000000000000000
>   [    0.426751] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>   [    0.427832] CR2: ffff88843ffff000 CR3: 000000000282c001 CR4: 0000000000370eb0
>   [    0.428818] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>   [    0.430131] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>   [    0.431429] Call Trace:
>   [    0.431983]  <TASK>
>   [    0.432500]  sched_init_smp+0x32/0xa0
>   [    0.433069]  ? stop_machine+0x2c/0x40
>   [    0.433821]  kernel_init_freeable+0xf5/0x260
>   [    0.434682]  ? rest_init+0xc0/0xc0
>   [    0.435399]  kernel_init+0x16/0x120
>   [    0.436140]  ret_from_fork+0x5e/0xd0
>   [    0.436817]  ? rest_init+0xc0/0xc0
>   [    0.437526]  ret_from_fork_asm+0x11/0x20
>   [    0.438335]  </TASK>
>   [    0.438841] ---[ end trace 0000000000000000 ]---

Would it be possible for you to boot the guest with "sched_verbose" in
kernel cmdline and attach the full dmesg? Thanks in advance.

-- 
Thanks and Regards,
Prateek

> 
> Thanks
> 
>> +
>>   	/* Build the groups for the domains */
>>   	for_each_cpu(i, cpu_map) {
>>   		for (sd = *per_cpu_ptr(d.sd, i); sd; sd = sd->parent) {
>> -- 
>> 2.26.2
>>

