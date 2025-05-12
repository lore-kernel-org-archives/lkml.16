Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC96C186A
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 22:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.145.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747089347; cv=fail; b=kXm2eU1x3wGegXJlrS+rFpUBeAK+q5HaK/jOP1CwWiq7B7ChhW8vYEflcns4XsLTj+M070V27iAL7h0OQvf0/uAAkAnK++IpF3NjNiACQal6k4LZgrlHKGuaqeq+8ceayPbiXCkjI/ovdJC/JJWThUjaIyG9C4R535qThn7lg9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747089347; c=relaxed/simple;
	bh=rNZg6EF5Nqii+fV7fh07HomF52MYp50wcLnaKyy1Ado=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DDe5W81HWfnI97BgmfmkbqTsYNvIQPltMG/ZnlwZ6GHFE+ELwZ19TauocAyQtfO+gryYRDw96wcMcTYhLFOFEPUNlQ2dJTAYRpmJAnZWcP9lbX7oOPdIAPC4DmwfywYSohF+Rl6iHZOycfe5v0N3ud+oQYgXnQc/3ChWNMbLl24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=GLb8xmQa; arc=fail smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="GLb8xmQa"
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CLZInY017661;
	Mon, 12 May 2025 15:35:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2021-q4;
	 bh=ZTjkxNtrhmFDJw0vqaLo2vwUw9lZcqYiF9UP5hqSRNA=; b=GLb8xmQag42G
	L6XFDMKy879/VPXS2KRvSo3pPrJhwfaz5w3jRTKsTClLzWrBJEv3NgBQEKamjwb1
	3WcBtfRiUxLsKGhBICNx1Ap1AmgXs4hxG8Qr/Qp7BkpjAB9UHbCWmnDTt4RA8t1R
	t6bi4h+7OcKkxfWVaoG2hIWHBPG02egOxgH1kZ3OJ8jtl5trGcB4hxC0KjjZIQBk
	JDDPwXO6rnrKcusQ03bK+aEgozsSB8OjWzsmZZdxVhl49ZSlSuBoZ0S6IMvZ5SBr
	PXZnDoUvmUdvqVe5vWNkbN5PhAkFmiY8CGRMpu/iFnlTLJHWBHrpwpdaXeJdWDUF
	B2/4kK/7Dg==
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 46k59qqpjq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 15:35:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ehBI1lw/OMJo8YKZqfbiFPyCTHqLI04gfU/lJv8bbkTJ8ubmqsTQP5oE882kHCvDvkGBZOUkb9EXOsY99ciAV1h4kL4+riXCtWsgKWTddLmpW55SJLcwxJHpIrJADIgYaC4FV6WYHBgQD9ycp4AB6qJm+EeBspDf//5fK1jx2e3/j2FtuVRlE99B4urim1uZDjae2jT2QebJJrsglaXX2vhPK5U8CqBWtZXv/b/m0R6xZImT74V0kd9ilpjseffPQxaR8snoaSJTQKU5vGYtzhdWS6iszqK/JYi5JF7eCIjkhsUpOEN9BJZUxi1jPc0oYeiHx7zF3bGoB1VJbfwAAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZTjkxNtrhmFDJw0vqaLo2vwUw9lZcqYiF9UP5hqSRNA=;
 b=jaKztd5CWgDqqJKFekyPkunYpNPywC0+RPJE0Z2yYngizuPWPhkCaqafiBy2Kkjsger+fci0iryytXpXFFMYkBniqscRJGgGXDdw7mkWmF4GpH5tiU5LpEePhjj6BjKKmXskuDQLIrTxF2EOphJb1jf/EcvAyz2gYb92kXHUeZR0j/hm4ifg/pus3Ie4uUxKCF+7LqYczUaT/8a2QOcttmYpzZIIyMOTsPYw2cXQIFBObEXhk5aVGuoVi+7DcfpviOQqrURC21sRLoZs0fU+Xp5YjalQBNEy+5Prtg9CZ1CP45dPrO+eRu+6IB5cbizpdAawYCZ8FlRMkrP6oNNbKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from LV3PR15MB6455.namprd15.prod.outlook.com (2603:10b6:408:1ad::10)
 by CO1PR15MB5115.namprd15.prod.outlook.com (2603:10b6:303:ee::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Mon, 12 May
 2025 22:35:32 +0000
Received: from LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::595a:4648:51bc:d6e0]) by LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::595a:4648:51bc:d6e0%7]) with mapi id 15.20.8722.021; Mon, 12 May 2025
 22:35:32 +0000
Message-ID: <d3c8527f-ffaf-4463-a305-17ca21a06ce8@meta.com>
Date: Mon, 12 May 2025 18:35:24 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: scheduler performance regression since v6.11
From: Chris Mason <clm@meta.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
        dietmar.eggemann@arm.com, vschneid@redhat.com
References: <1e3c711f-8c96-4c39-bbe2-7742940d1d31@meta.com>
 <20250509194955.GA25798@noisy.programming.kicks-ass.net>
 <20250512180846.GA25891@noisy.programming.kicks-ass.net>
 <2f394a01-1cd9-4719-9394-647d8731cf3f@meta.com>
Content-Language: en-US
In-Reply-To: <2f394a01-1cd9-4719-9394-647d8731cf3f@meta.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR18CA0017.namprd18.prod.outlook.com
 (2603:10b6:208:23c::22) To LV3PR15MB6455.namprd15.prod.outlook.com
 (2603:10b6:408:1ad::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR15MB6455:EE_|CO1PR15MB5115:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cf9bf9d-ae11-4e3b-ee19-08dd91a54e40
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q0VIRE5ldFlQSVJzNk9pUDY5aXhDSno5NHA5YTVieTlWWWluTzh6cWlkQkc4?=
 =?utf-8?B?Q1pQNWEzM0RLL1JWRHo5UlJSQTIwbXpWOUNhNlRmNEI2ZFZZVkg2d1BGN0Q1?=
 =?utf-8?B?T3lUOStsempUR1lqRlc1cGFNdEV3OGJsSmVwQ0V0ZEhLeHh0Wmh4dkpaMXlu?=
 =?utf-8?B?UUhQb1BWSm1GWmpSWk5tVEJ1UEFXVCtwZDJCRk1hVk1RL3lSN3krTVdmVVNB?=
 =?utf-8?B?NHpVK1hLY3lHYWVIYjBMNURxU1AwMWdyR2gzOVdOc1hwYzBtMU4yY3J1WUVW?=
 =?utf-8?B?R0MwYzRtd0FhTlZMYVVML2t3OUg3S3dxazJUOFcyWm5LRUNONDVrYzhpSnpt?=
 =?utf-8?B?d0xGaTY0RWdFRW4vUHRITEhVclhSQndIbjBKd3FDQm5LUHdoWFJpSE5LOC80?=
 =?utf-8?B?NTA2WWEyd1dZUVh1VWRzNWJuUU1WSTM4cHJWM04raHo5bkw5Qy9FMDlPNHpI?=
 =?utf-8?B?SmpDUUhlL29HaWcxUXI3ZmVCZlNkWlZpTUJLcHU2NkwwWGpNcGxubmxEb3NM?=
 =?utf-8?B?ZzErcERnN1VHYXdiMFBwMlFEaFNtYUt4QjZFQTcxMXJCb09qcG5pM3grN2Jx?=
 =?utf-8?B?RFRkSEJxWFBQUW9Sa2prc0FNT2tReUNFOHhjVml4OVY4WjRsY2J5bW91SjRW?=
 =?utf-8?B?SFFvYjFOV1UvVGc0aWJNZCtMQnFLS1dIYzY1bGtrRnJNcmMrd2F1dHp5MlMw?=
 =?utf-8?B?LzV1eE8vRmcyY0VSRlNHOUhra2lWRmpHVnhXSXFOakIxaXJqK3VReWprQ25S?=
 =?utf-8?B?MVVQcEE2S2lvbzJza1lnZGNBbHh6Vi9vRUtiaWhwbjdQc3VRT0hQcnhVVmhl?=
 =?utf-8?B?cmVKWTkyeWo4SGw3UXBsT1kxY0tTaGMybVRFQmR1V3U5VjlZNEE0b05ZVW55?=
 =?utf-8?B?dENuUTBJRCt4UWVmRGhZb1k1LzlaOGRtcndiYUR0OFlHTnhzc3FtbFlFMEln?=
 =?utf-8?B?dmZhaFFZQmRiMzNpOWk5ZmlZdnlYUCtndmNDNlB0a2Q5bE93azY1YnFUSlJu?=
 =?utf-8?B?T1k2UlBIM3B1V1RhZmZ1cUhSci9ZM2JXOTFqMitrNis5d01MOWdSa3kvMm94?=
 =?utf-8?B?Y3pVUmVxNUNTMmJCVW5kcUdqSElpN2hUNkVTOThTQzBQSzNyUTdHR1JQQ1VY?=
 =?utf-8?B?YXlwTEdiZ3dyV25CYWRPSTZ6cjlDMWJKRytvZHFONUdaaVgrTTBPN1IwaFJY?=
 =?utf-8?B?WUs5TXl2ek8wcUNCa3Vac3g3aS8wUW1oR0RrSXRrQVFXMjZwTGFGWlFKMWsr?=
 =?utf-8?B?d05xbFBkQUZOSGlrMkt3Y014RzFyb0k2dmcvcHp6aXdvNG12QlpRSWpnRUlz?=
 =?utf-8?B?NFNEOG1JRDhxWitwdCt1TjhWUEZLQnU0eHpZRXUzQUpLMkVpQnNzTkFXdDZW?=
 =?utf-8?B?UytYSFZIbGY5ZTd3Rng1bjhpRGJBbms3MXpTN2ZkQnZoeEtzYnkzNWc5dmla?=
 =?utf-8?B?R2hmc2d1Ymt0T3ZIcjVJYm5mNkcyYzZaUXJlTGQzWkgrMExVYjVOM1pnVXg4?=
 =?utf-8?B?Q21GbEVhaEZZR2UvVjJIaTBqUlJ0SG9mWHdZSWoxZkt5eHhhZktoZzdReHVH?=
 =?utf-8?B?UjFDajcxd1VRTWVVcXRFdVljSDVJSWlvM3F4TjcvYUxqRGQveU94bEZiRnQz?=
 =?utf-8?B?MjV3dXEyNHB3RHllNWE4SlJHZzlRS3B3K2E1WWhwV1krK1Z5ZHpnV3FpanJv?=
 =?utf-8?B?VWVVQWI1Q3JocElFUjI3SzBZbU9aT1JYcWJsYTdJNW1iSHFGMkVRYS9iOGsr?=
 =?utf-8?B?RFNjb2JhMi9yRjlNMTdQVTF6K1kzcGFtTUJCWEhCUit2dnBFOVF1dGo2amlB?=
 =?utf-8?B?R1ZPZ0lGNkEvWmt2cFVYczdzSUczbyswc3FSVm5mVmNZb1BPdHJvMU9BQXUy?=
 =?utf-8?B?SWtMNWtDT3BaUzFaQnZpWW93KzRIR1BUcnFZdTJxTUNDNEQxdCtub0RmZ2h5?=
 =?utf-8?Q?e/5yMzUk9Vs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR15MB6455.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHdiVmdQWnBWd2FFN0VaZzdMeXlIY3hOcUZVWjBJdlkzY1l0T3k5bWVaSFA5?=
 =?utf-8?B?TVVLR2lXRmpmQ05QUTV5N0FJVCtlZ0VlZmdtUEo2aVY2bmFBU2lLTjM0UzFC?=
 =?utf-8?B?ZlIwYTBwUlhwTHYyUXZnK2plZ2FsWWlObnFXUWtMYU1zZnJkc3lOQ3g0UWZC?=
 =?utf-8?B?QWxzZ08zenNZbVIrUlNWNUxjK1NSa3h6UWVRbUpWWER1cnFvckFvNS9MMmpw?=
 =?utf-8?B?ZmlCOVJ2UUhsQkowSU9DbGZXcmVDenU3aDlYWE1SRjJnbTY4NForQ25jdWVV?=
 =?utf-8?B?Z0tLYkEwZ3pXTW04TXVPTXh2bVJxMFVOOXpDTytaazJyTkloMk8zeVd6bXQ5?=
 =?utf-8?B?UzZaeVUwUjFUYy9PRjd4bk1aMFlQTnlWNDVnc0laUE1VVWp3aklHM1czb0lO?=
 =?utf-8?B?TWhZSmJkOG80Z2U5VU4zcVFtZ0VZZ01CSmwyQzRWS1ZGdjVBeGN1NkR5WjYv?=
 =?utf-8?B?MHdIK0NEUjdPRFpZaE5MQ213b0Nab2RxMHI3OFJ3NVpObXpEZllzZDI4SFBZ?=
 =?utf-8?B?OGpvd2ZZQzZBRGNRK0s4YWN5cUhneFFLMVFBME0zMEhVSHZhQmhFTm5vQ1Ur?=
 =?utf-8?B?K1pCUFcvVUg3cDdIT0xLRktqSzFZNTRVQkNvdGNnSUNNSVg3STlzVzNwRTF3?=
 =?utf-8?B?dFZIZEhPcC9PV21CZnlxWmRDNG41YVZGUTRQZzdha0ZzZDI5aFlYU3NMcEJE?=
 =?utf-8?B?SW52VnhyVUhCWUthcUh0bDBWbEhiRlFFa1JRUXlFd3NUS3psWnJzSUhJSzJU?=
 =?utf-8?B?a1JtU3JKZ1JoNkg1eVl3QnFkdjdwUWV1YnBCUld1a2ZGNnVnVDNYWVgycUs1?=
 =?utf-8?B?ZHNyTEdybytFVHA5aXJRckNsSnpGY1NsSGo1a0dTYWsrd3JMdmlSOHdGakNv?=
 =?utf-8?B?THFyYjh6d25pRnVGMURPdkpWY1VnTU5NQW5SZkxpbDNLWnhhbzBIYlhVbTg2?=
 =?utf-8?B?RGR1WmhyanpHdkVrdVFCblFVRUxRci9ZM2s3THNKTzcycTl2Q3ZSRk93N0FW?=
 =?utf-8?B?SDRBTkkrNmxITzhreUlOTzhIRG5Ia2JIYkxCaDdpaWwwYm85ZzlhdVVweGtK?=
 =?utf-8?B?K1pVTHdNNmtxU2I3blBRcHNTaWNBS0lJRUFZMmsyWUt6MFN1ZkZQU01mRHFJ?=
 =?utf-8?B?eFZuL2xuQzJxNUFvZDNFT2lZbThKV0p4ZkovajViUndwaTQ2Nk5KRnFDSmk1?=
 =?utf-8?B?WDcwTWdUcTR2dDFoQXRJNmJ0UjN4alZCeEVVd3k1a1RkeE43bzRvMmgwZTFW?=
 =?utf-8?B?cENrRXRsYmtXYUxMMVp5QVkyWStyQnZIWm9DZ3JSc1VIYk5OekxhWi9ZYWpX?=
 =?utf-8?B?YzV5U01Ja1BKQXZpZjdtazBCU05COC9DOStVMktLbEhHZHppeWNrbDFsSnd3?=
 =?utf-8?B?UC9lQURDazZHREpBV01CZjl3N1BrTjFEV3lTL01ocEQvQm1TaFd3YkRreERZ?=
 =?utf-8?B?L25UQWNETmNJVHNvcWJQVkJWalUvRUJPKzEzREx6dnA5Sy8zN091dmFIVlYr?=
 =?utf-8?B?OE5ZRThiWnp0VHl0NHBTYzVrSDRFU3hZQU5uNzc0RjBqSjhSdTUrVzFTM0Jt?=
 =?utf-8?B?ZGNSOEJUeXVxd1l1WjNkUEt1N09kWkIrVi9kWEVvNUx6MkprenJsdEJHZHlF?=
 =?utf-8?B?bGk1anIvR2RabWZIZFAyZSs1U1JEeWUrY0w4ZlhMU2lhcXBzK0ZCWHFaSE1R?=
 =?utf-8?B?QlRsNGFBdlV6YU9mSWNDajM1emJ1N3pUcVkvYXhCZXFzYVlFZm1yaFBSS3Vw?=
 =?utf-8?B?K2pQZjlBUDlsSHcxRDN5cWJFS29xbVc0dGZyUjR2T2o4RzlSN20xb2F5OUdY?=
 =?utf-8?B?UktPWFJLZTd1dWlaUUFaRllEZEV0N3F2Um5qN29kWElrRVMySHFaUlhhdHpI?=
 =?utf-8?B?dCtxVEtQc0FUS05NN1BIQ1pCME12N05Sa25neWhXOVBkeTRYOWVOOXdrWG1m?=
 =?utf-8?B?dGllTVlQbElFeDZiZkY1V3VQTU9Wb0t0Rmx1UHVRTDdMM1RxTEhlRERDSmsx?=
 =?utf-8?B?MVBuSmNNOUZBVktNcUNhaTdrbHdvKzFRaHVlanUyQWlGdVE2S2hWcWJHcFJB?=
 =?utf-8?B?Q25IZHE1SGJjYzBldmVxdnZGam5NRWFLWlBQbXRwczEwOUFzQWUwU094UU92?=
 =?utf-8?Q?EmBc=3D?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cf9bf9d-ae11-4e3b-ee19-08dd91a54e40
X-MS-Exchange-CrossTenant-AuthSource: LV3PR15MB6455.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 22:35:32.6391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VV3TYfSMZDM1aJPuDUGBEAlfUVRkC8Hpx6gW3qkgLrc8BUjcT+X/b99Dlm9p0JKc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR15MB5115
X-Authority-Analysis: v=2.4 cv=T7SMT+KQ c=1 sm=1 tr=0 ts=682277b7 cx=c_pps a=ZeveGGZnxkNpWlA7A6AaFA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=JfrnYn6hAAAA:8 a=EkNm_tuz03YXDZq65usA:9 a=QEXdDO2ut3YA:10 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDIzMiBTYWx0ZWRfX53ZYqcWq/TLq v9mWQ5MaYoF2UPvYM/Q3yM71O1lbyeApkogbVw3QHneoSl2DFw9KOgD7fC822eDetGatq6HmU9b J2zmjotoT4kwTTI5OcYfsK1PGtW2QxfNAwkTgY/Jgxzin63mSguTAr2YuYtSxploRyVaRrw2Ksm
 nEBsf9dXuybkDcnDpt9lEv7vxReVvfLcrYaEMPpciMPp5y2z4ZGvkhICJK1VffVboA2L84q4Hv2 U8lRx28FBsMVhXO9drO+RrHCpMmPAnbiICP0GhAofxK8cEF8N8hxODt7VqWbhHkRtVAFNo5zYL9 w+xtoQBMltXzXRp4bvNBTqhODirBXzzYW5ofSiHLnU3HPgzrZyzEHO0XXHK8e0UdNMvhgNeWL9v
 zq09xnCENsx6z/W/qNeDNh5l1eyaaFWu97vAf8Th4VY6AQF2Ddqvh7popCqNyqkxY+4wmYC7
X-Proofpoint-GUID: 1XU2o8h_v8wA-loHRJn_YkLCq_KqMNbq
X-Proofpoint-ORIG-GUID: 1XU2o8h_v8wA-loHRJn_YkLCq_KqMNbq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01



On 5/12/25 3:39 PM, Chris Mason wrote:
> 
> 
> On 5/12/25 2:08 PM, Peter Zijlstra wrote:
>> On Fri, May 09, 2025 at 09:49:55PM +0200, Peter Zijlstra wrote:
>>> 152 729288bc6856 kernel/sched: Fix util_est accounting for DELAY_DEQUEUE
>>> 	average rps: 1936829.47
>>> 	average rps: 1950715.10
>>>
>>> 153 84d265281d6c sched/pelt: Use rq_clock_task() for hw_pressure
>>> 	average rps: 2176857.32
>>> 	average rps: 2223004.23
>>
>> So, a little more data on this.
>>
>> The result appears stable, but reverting 729288bc6856 on master does not
>> seem to cure things.
> 
> 729288bc6856 is in that section of commits where the regression was ~1/2
> as bad.  (bad: 1.8M, good: 2M, middle ground: 1.9M) I get the same RPS
> with and without it.
> 
> I called it "good" in my bisect run, but I'll take a second pass through
> those potential suspects and see if the bad really starts there.

This commit drops us from 2M RPS down to 1.95M.  I did a bunch of runs
on the surrounding commits and the drop was very reliable:

commit 152e11f6df293e816a6a37c69757033cdc72667d
Author: Peter Zijlstra <peterz@infradead.org>
Date:   Thu May 23 12:25:32 2024 +0200

    sched/fair: Implement delayed dequeue


e1459a50ba31, which was the next earliest commit is consistently fast.


If I take 54a58a787791 or 54a58a787791 and turn off the
DELAY_DEQUEUE/ZERO features at run time, I don't get the performance
back.  But, if I patch them such that DELAY_DEQUEUE/ZERO default off

diff --git a/kernel/sched/features.h b/kernel/sched/features.h
index 7fdeb5576188c..94409e9831e97 100644
--- a/kernel/sched/features.h
+++ b/kernel/sched/features.h
@@ -37,8 +37,8 @@ SCHED_FEAT(CACHE_HOT_BUDDY, true)
  *
  * DELAY_ZERO clips the lag on dequeue (or wakeup) to 0.
  */
-SCHED_FEAT(DELAY_DEQUEUE, true)
-SCHED_FEAT(DELAY_ZERO, true)
+SCHED_FEAT(DELAY_DEQUEUE, false)
+SCHED_FEAT(DELAY_ZERO, false)

It runs at 2M QPS again.  If I enable DELAY_QUEUE/ZERO, I go back to 1.95M

This is roughly 1/2 of the total regression, v6.15 runs at 1.88M maybe
1.85M on a bad run.

Peter sent me a patch to try improving my ttwu_queue rate, I'll give
that a shot in the morning.

-chris
