Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B83A31
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 00:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750034153; cv=fail; b=l4mQgbPCJzxV5+zoQg31F/7YxKGgSOCwGVXg1XUHCnMMPQMIcNHw0wU+Kf1unltEq6z2ReLfQMrh0IEY2MzNayLQ8J6GVZH4g3qhoR7bztm2aSTwBIZfhr3a1kstOAEKVaMQGoh+Qg7vx6TIYQk9BkHrRgkSvoAZnor0HVNvYTw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750034153; c=relaxed/simple;
	bh=AN2+FS3rigoz9lT4obFjeglHOpEcXQ17Z6pUY6qOSgM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HR7YSpfmjsyhgtsecNbD77tML2Lli3JPz6E/mwUFL/Je2FEiWB7B3EYXDw9fAdIL93hGMqc8asovuf/G9Bxa/+qN92ryHKq0NUk7KkbwNGhXNvzuC04yor94Hf4R84xl6jwv3Wl3zyo0TlsFfmLv6kAb8h5B6bIbgdM8edC4Yzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=XTBPDeDx; arc=fail smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="XTBPDeDx"
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FJIdp3014878;
	Sun, 15 Jun 2025 17:35:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2021-q4;
	 bh=UbjKKHhOrcm0beaT67iSqdaW/FoUxmX6JSN2LQd4SjM=; b=XTBPDeDx1vOi
	znbSlZCfPdpaFio75kcm8HWAwoKH93n6Efh6QmVsDQOet/XpZwXGnr71kag3Me09
	Oy2Y1Xk533Lf1+fFu8Rr9+EHHMqAOJX895bDkZNB2ia7HCDgCvU4zX9o0g3BXOc+
	7WDlH2UERML41hpQkwGw8mW1LK36yX/5D1r4Vgr3wkBVg0kBWBhezJoPsc292t/y
	M6Jm+OkYin+Af/4xnZSEYBIuBeFvtuWRODeceTUdRoiaaG1KMTnSedpLN6Yx0rNj
	gl5OjMroV/0evme7LnwmqAQ2axnbwC7RHu/qXTvJIKbrx6aHkd2ASc94jfbRC/nt
	p6y7PRi0FQ==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4796mfe9tj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Jun 2025 17:35:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tfqqeUXVclLvf8Cek/UXn+weSBMQtoC1L8ZDIa9V6e8aph9JbHhuWf4jGL9YFz4CjOxvzJ+c3Dg/2+CDu9NC4VLlWX7FaZp4Wb1VXBHfwpLiT/jkL7AU52d2Jd+f+x8h1J18N0O8WvTRY1OzWOvBXq/EhNtB1iG3uiNrXhOHDRfzNfGwOlYbcZL0swlFvdzTlhN1qC5JD4ae5OvVSF2oPvUzmxxt8MruxB8tIVcmwwD5RK66APCkvWrYtP+a0hbbAxMuqtQHlYwI6sCslP5u0aHzgvpUUNgQUY1GrDA817c1Leaf9DjxeMxuQrpo0fv9pPtFLyj/v9Sa94du2s0gyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbjKKHhOrcm0beaT67iSqdaW/FoUxmX6JSN2LQd4SjM=;
 b=A7NyEua3V1jCVC7BW2iZvOWwBFXB3vuYuHEa5g6Ervrgi6xiOq8iaSkckUKai58mXtVV5W2Hd4+JXG7twHcf0Rw5RGiBmXWy+rAZgrXCqXwCqSr4JIdvKgkJn3/SBIZ0wsazX6u9u+CTHK+B4p8JNkzsMyjIdsPTUIaX9LZHuWIxpZA9autbElBU0qj24RkYRAUw69yfIC9TiCc6KDykIViz51iXDD0/h5Iij3HOT3rxy+8pI09sQXUyyPppx93r2cwbWNwfeIyaTChzz7kub97dLS2Jw99HwJpi6WBx2WV3Rl8DUdut8YmPpu96sIDpUvqS9XMMdH56g/gm6hfj1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from LV3PR15MB6455.namprd15.prod.outlook.com (2603:10b6:408:1ad::10)
 by PH3PPF502D5FE3E.namprd15.prod.outlook.com (2603:10b6:518:1::4a1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Mon, 16 Jun
 2025 00:35:33 +0000
Received: from LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::595a:4648:51bc:d6e0]) by LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::595a:4648:51bc:d6e0%7]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 00:35:32 +0000
Message-ID: <1113e83b-1dee-4c40-8e9c-674b33b87ba8@meta.com>
Date: Sun, 15 Jun 2025 20:35:17 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 0/5] sched: Try and address some recent-ish
 regressions
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org
References: <20250520094538.086709102@infradead.org>
 <20250528195944.GB19261@noisy.programming.kicks-ass.net>
 <8a65afe3-30ba-45ed-9862-361376873ee0@meta.com>
 <20250614100451.GI2278213@noisy.programming.kicks-ass.net>
From: Chris Mason <clm@meta.com>
Content-Language: en-US
In-Reply-To: <20250614100451.GI2278213@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ROAP284CA0120.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:10:41::23) To LV3PR15MB6455.namprd15.prod.outlook.com
 (2603:10b6:408:1ad::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR15MB6455:EE_|PH3PPF502D5FE3E:EE_
X-MS-Office365-Filtering-Correlation-Id: d3bb26b3-9acd-42bd-20e3-08ddac6db36b
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OHlKMUN2bTNlS01GSFpjb0RtSXVRSzdUQThQNXIwK2swcVE1MHdOQ2s5MGgv?=
 =?utf-8?B?c3JDMHJGU2dCdmJuLzNhOS9KMEIxZXdhSG1JdDN5d2xPd0pJRTh4RWJtV21h?=
 =?utf-8?B?YlNJUUhmOWlXYXdHUkEwcUU2L0R5YUR2dzd4cDA0ZFVhZXA0TmdTS1RSZE5P?=
 =?utf-8?B?Rkt3alV5NmFqNlB3aGdVT2lBSzIyV1lkb0huTU96VmczblVRLzhFaWFwZWhz?=
 =?utf-8?B?d3pZK3dmQWoramF3ekRTa0Joa2ZicGhQT1V1ODY3STk4dnBFbHp2c1diMGxZ?=
 =?utf-8?B?amZRVGh2RXI3M3BSaXVuUXJpVUcwaFM4SFZzS2FUZ3pVMlJ6U1cyZk9peXJS?=
 =?utf-8?B?VWJpNkJmYzYvKzRqNmhvMWQ5eXUzRE4vRUNhZ0FrUXA1WThXSUxSVFlwZ1N3?=
 =?utf-8?B?aVNuSStESVpEWTJ2L054U0ZLRmVBNjRyUWd3VTNLY1JGdlZaby8wOExBalNi?=
 =?utf-8?B?SmVYMFIxYmdTWU92OHEyeGJIRm1BVisrbHN0Mk1ZdDlRemk0cFd5T3VlUWJW?=
 =?utf-8?B?a2c0azl5Mnp2b3QrWlE3cWV2TmFKTCs1Q014S0tENmd0NmxCdmNoTUFQUytq?=
 =?utf-8?B?M0dTY3dscHU2RGVhd1gyZ1Z4dWlwSW11cG4vWVNDbXd1YzIzaUZjOVBVbU1R?=
 =?utf-8?B?Z04ramhycG9LYnJOZHpsMUpaNDBORkJ2MldKOUdWdTJONWNtMm12T1FEV0NF?=
 =?utf-8?B?Y3NRb2xwWmlGMGJudTBvMHdicE1VWW9vQVNLU01WVmJUb25KR3Q2ZWJpTUNh?=
 =?utf-8?B?Sks1a01BRFgycEJidFAwWlN1NFl3TmdSRUcrSWFpdzFnTlY2bXBtZERVK3B3?=
 =?utf-8?B?WlRuVmUyL3JNTCszU2F1Q0dtYXo3UHVoUmFvajRkc3dRK25XRDJXNTFnZjBC?=
 =?utf-8?B?cm5DTmMvZEVLWEtQbHB6aFdhVWMxS0U3Y3ptZ2gzTU1rbUdHNGloU2NTcUlz?=
 =?utf-8?B?VGhtYTR0SnViMEVpVUg5ZzBtVHJDRXN6MXZSTnBVdWRjODZ1dm5vczRVRmdu?=
 =?utf-8?B?YjBOaWwxYVlJU2lxL2FQVERuT3VwakRYRlRWeUZBZlp0ZTdmT1hOR0RMaE1i?=
 =?utf-8?B?d3dyUmQvSnNtLytONHU1VVY1OUNNbTZnRXpSZ20vM3pyM2FneFJ2Tm1FeDJ4?=
 =?utf-8?B?K3hWeEgwcXU3eWFmenNtVXlBcFZER1NqRTl6SnZnQkx1MXV0VjdCbEZQdGpt?=
 =?utf-8?B?NzVCOTBWeVlBTEpHUkJTUzg4RTQ5REhRT0FmVmUrV2dzckcxaml5UUx3TXU0?=
 =?utf-8?B?RUJtMVhpMElScFdkUkNabzBRc0V5OGFmZThTalBzWVhWVE9KNmJIeXYvWFBs?=
 =?utf-8?B?Q2M5WTIvVW9lVjhnUmVHa0M0azJUa3FvRk96TUNxVUtNYncwVkZCQzdwMDhk?=
 =?utf-8?B?RUIzZmNuZVZOS1ErcGozR05xdUJOMzNJdVZCc0pYNVNNTnUzTko1ZlA5dnc4?=
 =?utf-8?B?MjBjd0hmK1RHaWdacDh3Uk9kbTR6U05wemVpMmZuK253TFNUWVlVSWNPZWxT?=
 =?utf-8?B?aTd1OXJFMENmdGN0TkE3cFVPVnNGOFZiSkRCZHN6OWJiK3dIRzlKRE9nUEJ3?=
 =?utf-8?B?eE5sKzFQS2xDdmlHNzFCbE1zd3g1ZG5rblN4b083L1hSK3ZRbUxrb2lMdGFW?=
 =?utf-8?B?U1JZT0FBMTZna0hoNjdJS2RCTDRiMXhnM1hBL2dTOWNvZlU3VzJnK0pJTHRY?=
 =?utf-8?B?REhJd0ZnbUNRcU1zN0hNQzMrdnJtbnJHdk00L1d3VVJESHExcEUxd3hGd1c4?=
 =?utf-8?B?YnBCeDBXQUNzRmF5RWlndy9yWktVUklsQUliZDR5NnFWck94ZlZ6S1dTcWR6?=
 =?utf-8?B?RW1ZTjVpenV6R0JXYkxwd1UrNGdsNjlycVVqVmJtUXBMbjl2cENrc1V4LzVv?=
 =?utf-8?B?SlRNZysxaTNSUGRPK1BYUTQ1M0l1WGtLQWN1UG1CeWxoR3orUUROeFB6My8z?=
 =?utf-8?Q?WjydOlOGlXY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR15MB6455.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3h0OTQrZDNLT2dhZzJWaXgvZWxYcHlldENBQXlzcFptNGxQc3pRTm9EazVS?=
 =?utf-8?B?L2x1UmdnNlU4RzZreXhvdFFldUpDNktVR25XQnV5UldNZ2xjUytCMU1tSlFn?=
 =?utf-8?B?c1R6VnplRzlhbW9kcThSblA1K0RtQzNPRDJUUys0OThMUlBBOUwwem15Z05W?=
 =?utf-8?B?WkRxc2JWOTBvRzc1cy9sMHBUTnVSV0htQVFialFDaVFVbXhCb1E3dFRBeHVm?=
 =?utf-8?B?OXR5TXpPREdLaDZ5ZGREckRGRHdmYW9tZ3lMZXYvTXdkWTdoaHRMekRMOW1H?=
 =?utf-8?B?a0Mrdm5kU3RjaXZNVXMwU3BkR0wvNmZJNE52YStmRHNMRDBweVB5cHNEK2E0?=
 =?utf-8?B?WUVEWFJPUFIrOWwwaGF6enRMSG5rTXNBa0Z1eDJCU2RXQ2NpQktsQ2xoMnhF?=
 =?utf-8?B?Rm1zQlQxZFVsV0F3RlcrZVR2VjhpM255Y2d2VlhCOXJOeTFxcThBa3pOR3lw?=
 =?utf-8?B?RDVwNEpNYVpQUWFMdThRbU1DMmt2UU9PL3dWTWtmendNdUh3TE41RzhWR1pK?=
 =?utf-8?B?Qk8wcGVVdUM0dG5hb3ZxNDNKaWcxak5HVEw0YVhQVEtYR1hJTTZCd0w4emhG?=
 =?utf-8?B?aVFZdzJmRDllV3BZdThjL2k1K2hpd3pZOFIxMy9ZQ0N0Y09lS09EcWhTeGhm?=
 =?utf-8?B?ZzY2bTZmUG1xZG1tSEZhWHA4bndWZzRJeHdHankvbmRlLyt0TGhIeFlHZXdo?=
 =?utf-8?B?MG0zRm9TQllQc1hpL1BZMnhpbU1YalJObW9nSGhFc2FsbkdGNVgwTXU3TGd1?=
 =?utf-8?B?V3ZkdWkyWkFEQnFxWEh6MU9TM1owa3lnak81RVQzUGc4dDE5MlZtVmNXSUVI?=
 =?utf-8?B?a0JzTTJzRHhrZG55a0JuZFdsbGVkbisvUDczalNmSmFwVHIrRnlKUERDQmpw?=
 =?utf-8?B?KytZV1luQ0lGWFVPcEpXdzBWNjluNktvNWlUUVQ5UWxoeGZsZlNXbjNxbTB0?=
 =?utf-8?B?dVJOZ1VUZjIwL05wU2ppNkdHeXlXQi9DTG5EYjN6R0VzaUI2bmM5VW0yekNk?=
 =?utf-8?B?amV2VEVsTXZTcmd3L2NTYVZMSEltaTZLcWVXeVU0MzVvWDJNK2JPa2lJMkNC?=
 =?utf-8?B?c2ttcVRDYUgxTjNmN3ZOeC83ZkJ6QThlY1V4aXl0UUJ0aTIzNU5aYnFmUFdX?=
 =?utf-8?B?ZXR2cm9QNmZwYWsyazZMOGpvTUNublE0T3RHOHIxRE8yYzVRdTJqN3JTSlVs?=
 =?utf-8?B?T0M2aDFUOUlENk1ScjJSVUI3eTFTU0l6NGJTWFl2ZDJ6bUlrYlMwK0lWd1JX?=
 =?utf-8?B?S0hzcVpDZFhaNnhkTE1BeVNKT0RxeU1MZHphSk9CTTdsMWtobm9jbFJNRjlu?=
 =?utf-8?B?dkJjcXZ4azhqV3JiMzBFcit6c3c3KzB0bkNNNEFDYVIzMEttck82YzAzMzBM?=
 =?utf-8?B?czJveWhvbC8wUkF1MFVsaU9idlVhTGFvdWJXWW1LV1AzYkVKb2huVExLcGJX?=
 =?utf-8?B?UnA2TXg3dXhBcEltdG12NHp6OUhYRk8va3FscmNtK01OVnNUQ2pQaTZLVHZC?=
 =?utf-8?B?SGI5REJrV01vQnFQSE1BbzhYMGlDRWFjTzB3bnc5MmdUZEhnMmNsVUFRbUlK?=
 =?utf-8?B?SitOWXNVQXc1MHBXdkdvYUhaVVFJL2l5aGhuMFZpdllKbHBBdmpDQlVpODdZ?=
 =?utf-8?B?ajRVTUs4QmZUQXhjNUJxa0RYRzFFWVhYUXZJM2JKc1dlc3pHU0Voa29xOURr?=
 =?utf-8?B?WG5pSXo3dG8zaGx1Nkx6amZxMktXeVdyalFRWFc1VEtCL2NGZFN0NnU4Rmlu?=
 =?utf-8?B?RGRBTldRNjR0SWFrbzU5K2lOSlBOT3MwaGJ6eE1uTUEvckcwVjgrb0dRZjRy?=
 =?utf-8?B?K2VjNEFsa3E0VFNVSkRxT2FTdUR4eENWWjVrMVJ1WHl6U0trSGQwMWt5RDJ4?=
 =?utf-8?B?a01Wc3RWcFNWY0dvUUZBWis0SVpreC83RDlqdWh0dnIxWXhLVmVtU3dCOXVj?=
 =?utf-8?B?KzA5ZGxNU3A5OFk1d3Q0cmprdHEzZGJwaG9hRnFscUFpK1FVVGI2Q2k3UDB4?=
 =?utf-8?B?K3JNR3B5Z3FmNUIrS2djVWMvNStnenVseHZBYXQrZU9HV2JhNmQ1MHNDUDNt?=
 =?utf-8?B?R3NtL2RzV1I0ZXllQ1BvK251RzY1Z1hKZGlDTlpxT2FDcWtwS0JGRWRxaTdQ?=
 =?utf-8?Q?3BTQ=3D?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3bb26b3-9acd-42bd-20e3-08ddac6db36b
X-MS-Exchange-CrossTenant-AuthSource: LV3PR15MB6455.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 00:35:31.9869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YuX8qeojxX69x1gOzqPq7nOdmBV9T0Jyi3FYp4i/qXnRxnS2vakMUeGIj5fFx0WH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF502D5FE3E
X-Proofpoint-ORIG-GUID: PcDSqkzhJ6qPNNe3xf1PB0XlfVWBTvyk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDAwMiBTYWx0ZWRfXyO2A7+EJ/H2z frbj8eNW77b8z02zKm8V++wC8vWlWHPMb4ttYfRL9BYmRJ2lDIu0cbWQ6e+7Yhkh+b0JYJoBway TWTkRYUEURSckSTGpbKTUrlWU5G7weDHHfFAcPq5ozA7OO5a1UPqaZ6w/9BaftgHCRj9KMH1n4I
 YeQXHLDvteD0eeVw/XzsbqIwvkUx69lO/lkmYffS341hEMMiQ17UJlGVu5uOlgbonAGDc3AagP6 cAUqM+LjRkqIT2E7thXNglqEA8M8X79id7/nWiqsDaN3Uqva+LEjJCqVidwGy2WB3YB2gKGW7Uo 9AQPGSSJt0SY5eeu/VD2A2TA/a5YxgkG9Q48ydNw2hCeklYg4x+dGyjZyqAtYoCrdGuOsCD5hLn
 /EgVOwXv27M9r6eZrnFqinbUhcuVt99BKekCahgUu24q0kVD6HGHc10jEcnpbFa7Vy6EV2FT
X-Authority-Analysis: v=2.4 cv=So6Q6OO0 c=1 sm=1 tr=0 ts=684f66d7 cx=c_pps a=LuzQ4XTo42GRDgkCKj1yyg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VF6qZnJ4AAAA:8 a=pW7wkaEpPaLaKwuUlbsA:9 a=QEXdDO2ut3YA:10 a=9q4iEFIXrH76IA-M63OW:22
X-Proofpoint-GUID: PcDSqkzhJ6qPNNe3xf1PB0XlfVWBTvyk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-15_10,2025-06-13_01,2025-03-28_01

On 6/14/25 6:04 AM, Peter Zijlstra wrote:
> On Wed, May 28, 2025 at 09:41:33PM -0400, Chris Mason wrote:
> 
>> I'll get all of these run on the big turin machine, should have some
>> numbers tomorrow.
> 
> Right... so Turin. I had a quick look through our IRC logs but I
> couldn't find exactly which model you had, and unfortunately AMD uses
> the Turin name for both Zen 5c and Zen 5 Epyc :-(

Looks like the one I've been testing on is the epyc variant.  But,
stepping back for a bit, I bisected a few regressions between 6.9 and 6.13:

- DL server
- DELAY_{DEQUEUE,ZERO}
- PSI fun (not really me, but relevant)

I think these are all important and relevant, but it was strange that
none of these patches seemed to move the needle much on the turin
machines (+/- futexes), so I went back to the drawing board.

Our internal 6.9 kernel was the "fast" one, and comparing it with
vanilla 6.9, it turns out we'd carried some patches that significantly
improved our web workload on top of vanilla 6.9.

In other words, I've been trying to find a regression that Vernet
actually fixed in 6.9 already.  Bisecting pointed to:

Author: David Vernet <void@manifault.com>
Date:   Tue May 7 08:15:32 2024 -0700

    Revert "sched/fair: Remove sysctl_sched_migration_cost condition"

    This reverts commit c5b0a7eefc70150caf23e37bc9d639c68c87a097.

Comparing schedstat.py output from the fast and slow kernel..this is 6.9
vs 6.13, but I'll get a comparison tomorrow where the schedstat version
actually matches.

# grep balance slow.stat.out
lb_balance_not_idle: 687
lb_imbalance_not_idle: 0
lb_balance_idle: 659054
lb_imbalance_idle: 2635
lb_balance_newly_idle: 2051682
lb_imbalance_newly_idle: 500328
sbe_balanced: 0
sbf_balanced: 0
ttwu_move_balance: 0

# grep balance fast.stat.out
lb_balance_idle: 606600
lb_imbalance_idle: 1911
lb_balance_not_idle: 680
lb_imbalance_not_idle: 0
lb_balance_newly_idle: 11697
lb_imbalance_newly_idle: 22868
sbe_balanced: 0
sbf_balanced: 0
ttwu_move_balance: 0

Reverting that commit above on vanilla 6.9 makes us fast.  Disabling new
idle balance completely is fast on our 6.13 kernel, but reverting that
one commit doesn't change much.  I'll switch back to upstream and
compare newidle balance behavior.

> 
> Anyway, the big and obvious difference between the whole Intel and AMD
> machines is the L3. So far we've been looking at SKL/SPR single L3
> performance, but Turin (whichever that might be) will be having many L3.
> With Zen5 having 8 cores per L3 and Zen5c having 16.
> 
> Additionally, your schbench -M auto thing is doing exactly the wrong
> thing for them. What you want is for those message threads to be spread
> out across the L3s, not all stuck to the first (which is what -M auto
> would end up doing). And then the associated worker threads would
> ideally stick to their respective L3s and not scatter all over the
> machine.
> 
> Anyway, most of the data we shared was about single socket SKL, might be
> we missed some obvious things for the multi-L3 case.
> 
> I'll go poke at some of the things I've so far neglected because of the
> single L3 focus.

You're 100% right about all of this, and I really do want to add some
better smarts to the pinning for both numa and chiplets.

-chris

