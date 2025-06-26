Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44D427144A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 10:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.145.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750935530; cv=fail; b=fI5RvKqDibfWae6h6Ym97usdpDiO3BFcFyN9PkwkUcTXSVzAVAKhn7oEBT/O1NF1WZPwXT79v+iuMJouNFD+3jq4YyXMwuz9z2ttMAx79evyabckGIo2mhOIhYup5j7HdCLhvgsHkkyYeO3xuQbSRclLPxra6rIpgwj8JxV+HGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750935530; c=relaxed/simple;
	bh=z/b7CFY564b3VColm0zMqPJfSsN/GoOHBPcYh4ahXAE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Da3Ozo6il0xsfZ3C9lm/sOoYLal+goVJusWZsOQrjrDSwD+gY+5dV8LqF+GTxkHzdRduEg9sQSDE0lhf9mFYF4F2cCL7YY45Hkzc4P8Z+y7XkttyfcIJOmBcS02ZTuUVLn7jgdpxbhKl8weKzOy8TFTsRhyzuhBXGjvxWhxuqXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=S2w9wKyI; arc=fail smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="S2w9wKyI"
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9NlS0023897;
	Thu, 26 Jun 2025 03:58:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2021-q4;
	 bh=lAKX2Ssb0LOT+GCIcFjWfxO1PToUrQiDg/1u/SJxVdI=; b=S2w9wKyImImO
	DXV9WufP14HHwPosvDUnw8Oaqk9k62vxoji0fo804TS1Pwu/J4mwd+JKHr1dKdm7
	mkkOOiw9ABwpG8nDI5eX1iiIUlvcMHy/N8AtilnavGyGEkD4JpWaXLIkiceluM/B
	deWjkW5KQAzmx1SzLjiw5UhkoZm+to3/4l4pcMG0EFzuwuo/bRI5zR25xD41+8ag
	2IXqDSzV81CbG+37M7E6+AfWPna62iJ8vU/aFmV/iBzbfwzw04O4UqgDeC9HGTF2
	yPIefe/nJ5W7S8v5cR0CYkyzjt2lBOhnA9WVk06LqU0WkReML61NeP/39KeUBGfu
	/vXp85u6gg==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 47h17ss5yj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 03:58:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HtiE538gYOl2/pyXg59tDo94wY8shA7EvsOyDzdVT3nhs4Fj6FYMMIU5eCa++xiknDxKxgtGNypDXxHTa4Lz0brhjipq/Of9iNnEtmGB2xYCwRh2RyNj0SnF4Gn39u51Lkxdp/sIJcm6/GRbd2ZYdo/DMJxPBWKjpXLXldS0hGpyxXP3jTt1VhKkTfRMVp5s20ft402za/wzbW7sNX0vcCkma9DaggsAZfLnPoKUz1qBlABHgfIkibbYNqzuKI4LDHPmmtHH5oIrdaeJ6zwiFD2Xw6kBGnslxhcEdsZJil7qw6E3WfFIdoj1QhtbsVXeqX/3rm4044Q/p/n/0ehIAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lAKX2Ssb0LOT+GCIcFjWfxO1PToUrQiDg/1u/SJxVdI=;
 b=c4269cnf0GjlXfQsrypByA8HwBBcEusA+3Q3imJktsdcF9yjQDsL3tf42Lw02piBXLVUMDqUD/cvJWo10dO+CjOTMSkYt2sITFrAxkd6LPu4qy0BKIurb6pnDvs5+Yw6S4TeZsPxd2029RomRwmljsrLAYnFOW028GZZ5ONjQLXm98rEvLrljspO3+kh9q9n6t875hxDwR9AVFvMzjemA88RJnsUJrywpyDM2HnNnnN0beaNckXwVGHbZksynpc84vR+ktTXJjEsAgok/4aM6XLEQOuazQhRamO6idMBZHqdMUUJQAClg2VQNJ0JSIThqm37VT7H/Hl/4eWGQfk4EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from PH7PR15MB6463.namprd15.prod.outlook.com (2603:10b6:510:304::9)
 by PH7PR15MB5306.namprd15.prod.outlook.com (2603:10b6:510:134::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Thu, 26 Jun
 2025 10:58:39 +0000
Received: from PH7PR15MB6463.namprd15.prod.outlook.com
 ([fe80::15b4:afb0:f4e9:5bc9]) by PH7PR15MB6463.namprd15.prod.outlook.com
 ([fe80::15b4:afb0:f4e9:5bc9%3]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 10:58:39 +0000
Message-ID: <872c057e-5e2f-4cbf-943a-072b6015fee9@meta.com>
Date: Thu, 26 Jun 2025 06:58:28 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] sched/fair: bump sd->max_newidle_lb_cost when newidle
 balance fails
To: Peter Zijlstra <peterz@infradead.org>, Chris Mason <clm@fb.com>
Cc: vincent.guittot@linaro.org, linux-kernel@vger.kernel.org
References: <20250624204942.715206-1-clm@fb.com>
 <20250626070057.GE1613200@noisy.programming.kicks-ass.net>
From: Chris Mason <clm@meta.com>
Content-Language: en-US
In-Reply-To: <20250626070057.GE1613200@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN0P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:52e::32) To PH7PR15MB6463.namprd15.prod.outlook.com
 (2603:10b6:510:304::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR15MB6463:EE_|PH7PR15MB5306:EE_
X-MS-Office365-Filtering-Correlation-Id: 1828d345-cc8f-41a9-5296-08ddb4a06811
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M2hWcFlpbmUzSjlkMzQ1ZC9ieUU3cGpOOEpFTFM4TGN1WVBpMXZEWGR2VjRS?=
 =?utf-8?B?U1BXdkpvMHJ5YnV6LzlsdU43SWtzRkVsYVRqTk82MFdEL3BJNzJiNkk1R1Zw?=
 =?utf-8?B?MUQ3R25NQkVzSDlvWDVhMWdQNXRDTTVrT0xkTVZQd3JrYWRZbkoyZ29ZaWo4?=
 =?utf-8?B?N0tsc3NYUjliRUdOc0RrNWh1ekthMTN3T2lHVUpWd2txUTlkSVFQcWQ3M0V6?=
 =?utf-8?B?UmQvcHprQVVBK3VHRWh1SDc3Vk1zRkxYU2xvNFdCV3JFWWREVi9MUUVKTWhR?=
 =?utf-8?B?bmM3aW9Kd0ZBZDVRcnkyUGNGMy9lOWhYV1FZVFBNc2lYSjdRSHJBNk0xMVZH?=
 =?utf-8?B?MHgydlFnT2Naa1R5R2YybjhnMVNFTGpDWC9XNU1rOHk5WitvdFVGdDhMMmRU?=
 =?utf-8?B?MkpnUTJDSjhSTjdVL2p0azhzNnhXc2xqZVZPQmluNzNoSHUzWDNvWk5EemtG?=
 =?utf-8?B?eXFZRFRtVUhRTmtTNVdQb01keFkrbExRTVN3RXRhRGxtck9qU3ptMW1xZW5u?=
 =?utf-8?B?UzIwYlVhUkdFV01RS29NMW1jSlJ1Qlh2RWIrODRzNytoUldtT2x5MGg1N0ZD?=
 =?utf-8?B?Y0hwM0NNZ0ZTQmw5cWJSWnVuQVlWb0Z4c3ZxZUtmcnMrOU0zYlI5SVpJUllH?=
 =?utf-8?B?UVM5TytldC9HVkVvaysyeCt1N3JnQWNPVFo0L1pZQXRtd3lSZ1EvSEZBamJW?=
 =?utf-8?B?azZNU3N1R1FZbnFlRjNUYXZrL1p3Qk5NbURzNTZkNkVPTi9tOUxEcGdQeE9L?=
 =?utf-8?B?UUZTcmo1OThXOWZmUUpwZEJ2QUZ5WWcwZXM3ZXY0VVZpc01HVmhQRU9HeDhO?=
 =?utf-8?B?dzl3NlpuQzRYNXI2aUgwbVVFeTdUSWtFTENYT3JCaXpMbzNuK2U0UW4xRnpz?=
 =?utf-8?B?Qk5BS3JZSXg2OUVQT1RjUkF1TlFKcERhN1gxRGFmbkJBYnRYTlBGK2k4M2sx?=
 =?utf-8?B?RzhscFZFbnhxZmRRclJ4clgzalpBUC9ubWthOTJxSFpOYklhYWh6M1hvUTNp?=
 =?utf-8?B?dzQ2RjRvZTFDcllYMU52SmxBSXpmTm1kdkFua0lYdWlIL3lLMDg2azRBMkdY?=
 =?utf-8?B?ckxFVDdtbmwrMXRwME81bEdORUhrZklCa1NPTTNzNkpEZjBjS01NRTlxWktp?=
 =?utf-8?B?b0FUL3FJYkNCN1FWeFFsRVlQNWlBd0JLQlRydUY5UVVEZUdFOTBKT1ZJM3RV?=
 =?utf-8?B?QmNuT3daYUthQUhNMmhnOHdZazRjZGFlN0xwd0VISERPNWZqbTUvQ3BBc01T?=
 =?utf-8?B?VVEzQ3V5Z0g5NHVIOGxEWU9hamI5SU8xV1B6aXh4ZnB2RVdSc2JFN0RyQ3Az?=
 =?utf-8?B?Slh5dlIrVUtkK0s3UXcwU2doS0MyODZmNXhUVUxFNUQvRUo2VmxlcXhjS3hk?=
 =?utf-8?B?N1JPa1dQWGpjZkVOMkM0c3h0dDZHcm5wdHI4RHB4Y3RtSnB2Qjl6Y2htY2No?=
 =?utf-8?B?Z1VhME43NGdlWXVCZlBXMFZ3cTNOdXFWSDNjZXJrTlhzOFN4TlpQcW95WTZw?=
 =?utf-8?B?Nko2RkdqOVV2Vk01TlZiT0NBcjFob1RiT1ZMRUtBWUpEZXpScm9NYzZmY20y?=
 =?utf-8?B?OTZiMDRUdlZxWlJldEVIL3ljalNGT2FBYkpkNjJZOGczN3h2Ump2emtyZUJ3?=
 =?utf-8?B?TGZRM2lueURvSDIrK3VtQ0pwQXhxTW4vTmxVeUt3dFo2TjBIL2hhMjMwNU0z?=
 =?utf-8?B?RmM5bWlxOXRyTFZwSFJpMXVKM1BPWkRjTC9saVRsN25lQmpYVktOa2ZQbTg4?=
 =?utf-8?B?RFpBS0FwU2ltVlN4anJhVkczZTk0Z0ZVd2Q3cTJHY3ZNVDRGT1lqMnp2Rm44?=
 =?utf-8?B?WnZZR0wwQ3d0ZDBQbFJwcXc0QXF1L25DZHNyNEJyL3BUSmx4cTNNRUpmMlRL?=
 =?utf-8?B?N0lxL1UzbG10cjdCT2RybjY2RVhWZkpMMkVPdGRLZ1Z1UzViWjIvODFBZ2tI?=
 =?utf-8?Q?teKATdt1Who=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR15MB6463.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2dPUGhhUk8xQlRjWG5FSUlyTEUyUlRsdCsvT2xldmRUSVNJaTFHQVhPMTFz?=
 =?utf-8?B?RzJDdlk4K0Z6RHJvL25oaGlSdHhUd3hxTTJkdS9tK0NpUExxU2cvT1ZnOUdh?=
 =?utf-8?B?V2owZXlmRGJOTDF4VFlxR1BhcC80SlJicS8yaUxuYjVyM1NtOUloai9paW1G?=
 =?utf-8?B?L0FnU3ZqUFZsQ0J5UXpnNHpLTHNMdjZoSFJMdENyTGF0ZnBQeWpJaU50bCsw?=
 =?utf-8?B?UGpNbXBwNHVyRHlXSlRXVGdrQm5pTlZLOVJpZjlxWldsQlB3dHhBcXFzMWFu?=
 =?utf-8?B?QXRqRkt5SGliM3dCdHl3RENHUlhqZ2JIbnFnVWdUR0c5N1FaWk9Ha1hxQ2ZQ?=
 =?utf-8?B?dkRUT25iR2luRjY3UTN3QTI5d291VXZySXRxcmRXRWFHZjN3UytiUXJsWDJL?=
 =?utf-8?B?Z09obUVwbzc1YktmaHVJTFgxU3A1QXo0am8rU29UZVNtMFNmNVBZTCtyTHR5?=
 =?utf-8?B?T1IvYVNoNmJjOHVrdkRZWXUyUWhMMXc5bVBEc2ZGZzFINHppT1dvZ21scURh?=
 =?utf-8?B?Q1pqQU5UTU1oc3BtOXh1WThVeG9ETG1TZjk3aFVINEE2THdqenZLbXNYMjhn?=
 =?utf-8?B?bXFQN0VNc1VLdTFuRzNmRTZHaUpkbDN0UzJFa21ndFJqczRnZWN0M0FDdGZM?=
 =?utf-8?B?RWdvVU95ZzNTeldKb3laVEpkdVdBdHNyaSttdW9ka2xCQitRckVITE0vTHZm?=
 =?utf-8?B?bi9GWEpGY0MxNEVVQ0cvRXp6VUxEYnpCblMvR2FJTkxsdmw5c2JYTC9PcXVZ?=
 =?utf-8?B?ZmFjaFoyYkw0WmdBQjdWRlZOUjRvZ1VaOWNKdFkrT3YrbDBqTzJuZmRaZ0V2?=
 =?utf-8?B?UnZuTlRkMHpScUNZeDY3VXZxWWltSmp6Y0ZidVdzOEhUN0R6dWE2OVVYOVNu?=
 =?utf-8?B?NUlmNlhnN0FCMTBOQkdQeVVQZHorWElxY3Q5dzVXQ2NXaGtnRm5Yc2NUSURy?=
 =?utf-8?B?blBHMnBPbkVidmFSTGVmSzlrWWhKVFlpbjhBYXRGVCswMDVLNy9FNGRxQnNk?=
 =?utf-8?B?R00wZUZKdk1ha3VVdHp1YkhYZGF4bGpUM2pTNlNLQ21DWnE1QXBHYXNxenZT?=
 =?utf-8?B?RyszY1ZsRGJCNDJBaWdvUUVYOVc4bWU0R1dhOGh0L3Q1bG1xZjkzcTVzbU42?=
 =?utf-8?B?dzNMNzg3SXVVN3o1UzZ4eGxmVy9aVzJWQkUzMTJ2Q0MxbVluUWpwRE5va24x?=
 =?utf-8?B?bHBUQ0tZY1p4QUVpeTE1UTYrWURXSnJOOWZoemNXSlRxQjg5OGozZzBta1RW?=
 =?utf-8?B?aGtJN2xNUWlsVUFzTFU3RDJWd1NjRlVWQ3k1VGJUcWVJRWpqRENCWC9LWDVh?=
 =?utf-8?B?TUZIZlBmL1lKVVdoRmZLOE9qUE5aSUhRaTdOcmVmSjlMRVhYUEVwSDBsb1M2?=
 =?utf-8?B?ZXFXTXd1b2JjQUt1VUIvRnA5YmpTT3c3N2NLaldQREE0SWY5Mm90QUNjR3l4?=
 =?utf-8?B?QStCMG9FNXlsRTVrWFFCRnB4Q0c4UEF0M1RIcWRLaXFwWmRLRFFENVFxWm5P?=
 =?utf-8?B?SXAvdXJUSzlPbnkzaU9UT2dBOEFJbnkwaVdHWEtuaHpXZ0VyTWJveWdubVNs?=
 =?utf-8?B?aXhKMTR2c1pweUlJZzl2WUFzNWRUK2FIcEdKSlVGcE9SY0lWWE4rMkorWDA1?=
 =?utf-8?B?TE9zdEI2R21RQnFTNVN0WkZGTll6T0lCcXB2S0U1dGdFakFVMTk1azUwUVF0?=
 =?utf-8?B?RUM2K1BBbXdaRHBPaCtYbjZvdlpXZWFzb294N2hXSzNpa1dUMzRoeWxVTWds?=
 =?utf-8?B?RFc3S0llRFdGZnMwYXdBQzN5WW1OeXg5UVpYWUJ1N25GODRmL2xsVjlCMmN5?=
 =?utf-8?B?Vm95R1JzUVpUbUNqdmhaUG1wVDhjSGZ6UEhRYWoybmdleitHczErYzkvUTF0?=
 =?utf-8?B?OHpTSU1wMEU1SGhZZkRsbmlVYWd5cU83RUswYnIxdmNDTzhGNzFjOGV3c3Rz?=
 =?utf-8?B?cUVxL2pqZTBxNGIrRUtMdGRwYnNnM1RmMFVxRzVPOWh4TTRRMjdMU0ZycUxx?=
 =?utf-8?B?eUcxTmZYcFVVZEI1V2t4SjJlRnhpMjdySnJVdHBVdFhGRDJFaml1cUdNTHZv?=
 =?utf-8?B?Q1pBMkd2cVpSYithbW5kRWNlcm5aMVZwenVSWlNXZk0raWkzQWJXaERxLzFT?=
 =?utf-8?Q?wppA=3D?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1828d345-cc8f-41a9-5296-08ddb4a06811
X-MS-Exchange-CrossTenant-AuthSource: PH7PR15MB6463.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 10:58:39.2161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qzUI+c61ZM+zoVaIZix5rZ0lr+zru84OPfA5awJt4SmLv13i94CpkSP3cCIxGlW/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR15MB5306
X-Authority-Analysis: v=2.4 cv=Qt9e3Uyd c=1 sm=1 tr=0 ts=685d27e1 cx=c_pps a=+M2Hf4NIZF2Pi0mlSiStKw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=x9brGn7cofvYIgEnBrAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: WfkV7ZzydXDG3UjzBTFwzu0krqmJ7yPO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA5MiBTYWx0ZWRfXxZsnxi2LwTXf GuDO4lZzgD5D+IM80xHZxDMGDWnBfi1r6EnwyFJNC+Su3eRTnPkoSoD8riZ/IChK6wTMBkWbdvY 4650NKih5/g1t8r5J9n6DIw4wvy/9+ktt//Q7oOxpcIBL19pyytiWUJUvbIuIR/2CgH2Sx9KcMU
 dv3Lr6EKrPt3lSHUZG9S2nmmFaOo23+hAFqZRfimbNgo36Rx9o8rD/R9GZkzGAXuZkKZLB7O7Kr znXsOyzORPMv9dMAL47tgJfXFwMHlD9WvuP8LeDesiKfIOeMEeepKN7k/ehuYbN+iTYjq0pQLYS vSreiU13g4tA+rrorjJhkZZT9LR0683Tx9vVdx7EFhmYPMXCAFZdCUTUHsR2NOvmLHPEd9LKd2V
 wxK/S/pw5F1ChpBJawIWjy3FjapPiNu3F3Bi0YNnjP6AH6je/GqCnSp858U9qqsMvi3Gsoeh
X-Proofpoint-ORIG-GUID: WfkV7ZzydXDG3UjzBTFwzu0krqmJ7yPO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_05,2025-06-25_01,2025-03-28_01

On 6/26/25 3:00 AM, Peter Zijlstra wrote:
> On Tue, Jun 24, 2025 at 01:48:08PM -0700, Chris Mason wrote:

[ ... ]

> For the non-RFC version, please split this into a code move and a code
> change -- I had to stare waaay to long to spot the difference (if we
> keep this code movement at all).

Sure

> 
>>  /*
>>   * Check this_cpu to ensure it is balanced within domain. Attempt to move
>>   * tasks if there is an imbalance.
>> @@ -11782,12 +11808,14 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
>>  
>>  	group = sched_balance_find_src_group(&env);
>>  	if (!group) {
>> +		update_newidle_cost(sd, sd->max_newidle_lb_cost + sd->max_newidle_lb_cost / 2);
>>  		schedstat_inc(sd->lb_nobusyg[idle]);
>>  		goto out_balanced;
>>  	}
>>  
>>  	busiest = sched_balance_find_src_rq(&env, group);
>>  	if (!busiest) {
>> +		update_newidle_cost(sd, sd->max_newidle_lb_cost + sd->max_newidle_lb_cost / 2);
>>  		schedstat_inc(sd->lb_nobusyq[idle]);
>>  		goto out_balanced;
>>  	}
> 
> So sched_balance_rq() is used for pretty much all load-balancing, not
> just newidle.
> 
> Either make this conditional like:
> 
> 	if (idle == CPU_NEWLY_IDLE)
> 		update_newidle_cost(...);
> 
> or do it all the callsite, where we find !pulled_task (ie failure).
> 
> Specifically, we already do update_newidle_cost() there, perhaps inflate
> the cost there instead?
> 
> 	if (!pulled_tasks)
> 		domain_cost += sysctl_sched_migration_cost;

Got it, I'll play with that.  Vincent, was there a benchmark I can use
to see if I've regressed the case you were focused on?

-chris

