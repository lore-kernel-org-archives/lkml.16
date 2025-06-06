Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819C01F1927
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 22:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.145.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749248289; cv=fail; b=nrgenNPfg7bY8XYkH7/LOjK3jEF3ZdFlIEmmMolbTGY+wak2CZ8s1CpigoAHD4PwRf1RtGeMQ5NH5H/MMr/FJgrEH2NYFqgSGhIug2yBcGD3yrCBUdlnxHAlnMD09YeeESH3LYWKwt1pb8dHGOlo5Ks+GejtS9NAMwQeQe0mmqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749248289; c=relaxed/simple;
	bh=36tIYgRU5BTevd0jPsX1cPzqDTfrfJy18EFiYBWJZls=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=P1bmmF6Wm+gsUS3VJxsepqXl2ke2nu8ebNeOCe43IzK7JbXJ4kyzAil58GDpXIfEwhomXdFTfXyQzuPdRKp4oj03yYLu0yUQfPPffi/TsWCW8k59DUIs01o3k3wp1OchedugHBmDW+RbZpd8KEq99GiBqf9UAjegOaEm55Bhlik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=IMzQuHCv; arc=fail smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="IMzQuHCv"
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556Iket3012557;
	Fri, 6 Jun 2025 15:18:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2021-q4;
	 bh=9mQioEUZHQxhEVvPrS3M4DJdpXoI/27hrCqNiOdYwU0=; b=IMzQuHCvzMiL
	etQC5Zg8aul9Lj//p4++3s/23DYdS78Ng+PnG9/AGByCPGdjs2MTI2BgmzUbpQbk
	naHPsL40PnGadHbzyi6ymZRfegEm0PVxHmGKokHOJqluasdDo4AL6aGBo5sASeOJ
	JUcptlYZxvyJT85wXmAZu8mvKCZMdYV2KTZ6thlMp9pzbevSh1zlMIJrUW8fQTPW
	XhG3MXJVYpzocJlQj/3aG4JDmBV+V7FiozDiv+/Qk2lLyq5CCFhwuVSpdrGdoHlc
	0iHq1WrvvFqlALRDzmf+ROAhacNr25lY+60jSVx1moVutW32Mtx/aUGD98h3R9DY
	dTD7tkwU3w==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4745wh99s8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 15:18:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I0gE6Q47fP27XpxP/DHEXULrgV6RPdwHx88+v124oerdYHUuu3jV5XwYCLL1GgUwWVo/AUAjiN08XtH6UsgW4ML4+Xb5UsGh+mItFuGERawID6Vgxrjy1Kl7gq12ALdatx1iwTFVZH1yHbhjObEbXlxEjd5Lscjt9FnHAxvUhUOQNPZphkqB9Q7YtNPlTBH7GouekC0X/N6LwTCaTteOifIts2x3ZL62+Imtvx0xRQCi75QiypwCcFprhAmXJtv7VjbbgFnUpsnGQpZ9nQTCaOdvXF5sgoFw+jhAlO1ivjxxI+K42DSN5h5tQFG1YS/+fqIaYC8Jl6YQshNJ2rXUIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9mQioEUZHQxhEVvPrS3M4DJdpXoI/27hrCqNiOdYwU0=;
 b=F6ya3GLayjPVXFiOZbWUf4vg3ySWwIIhW6iDsa3JoXEepftrZnR7sMr9gbrmW32xTtPaInGK2GNiPTotKaIdI34LRdNpN2Xo2f91Mp3Gn49aEaCwBVSBG/OogopXBFNxdYfLJr8FwiOKM+1KZ4MjzNcM0Z7w433mYL3gUzxYcI89bAyIgb6WyolKjYQ+nga6QseYi3oINK6UD0MYyZlpSvqK8nOGCdxJXgIazQmK9lM2116jBhrKm+6vBWlSM0qnQA7/9ZIpwLTMkLtaSk3cZPOCFKDeAhlv44tY2bR6BOtWSwaU0bFKMNAtcqkv/gkTpXjj+Ca6vAdQO1AY0EduHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from LV3PR15MB6455.namprd15.prod.outlook.com (2603:10b6:408:1ad::10)
 by SA0PR15MB3872.namprd15.prod.outlook.com (2603:10b6:806:91::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Fri, 6 Jun
 2025 22:17:58 +0000
Received: from LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::595a:4648:51bc:d6e0]) by LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::595a:4648:51bc:d6e0%7]) with mapi id 15.20.8813.022; Fri, 6 Jun 2025
 22:17:58 +0000
Message-ID: <e4538bb6-4988-461b-9aac-26d91ca174e9@meta.com>
Date: Fri, 6 Jun 2025 18:17:50 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: futex performance regression from "futex: Allow automatic
 allocation of process wide futex hash"
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org
References: <3ad05298-351e-4d61-9972-ca45a0a50e33@meta.com>
 <20250604092815.UtG-oi0v@linutronix.de>
 <372d8277-7edb-4f78-99bd-6d23b8f94984@meta.com>
 <20250604200808.hqaWJdCo@linutronix.de>
 <aa6154d1-726c-4da1-a27b-69d2e8b449c6@meta.com>
 <20250606070638.2Wk45AMk@linutronix.de>
Content-Language: en-US
From: Chris Mason <clm@meta.com>
In-Reply-To: <20250606070638.2Wk45AMk@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL6PEPF00013E11.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:17) To LV3PR15MB6455.namprd15.prod.outlook.com
 (2603:10b6:408:1ad::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR15MB6455:EE_|SA0PR15MB3872:EE_
X-MS-Office365-Filtering-Correlation-Id: deb19023-884b-4f48-18ec-08dda547fe48
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWk1eUc2Y0VhZ1hwU1dscHBYU2QzQXFOTWtiVjhWaWxKTzByaGY4S0NOM3dr?=
 =?utf-8?B?MHIzbmt2ZEZnS3ErcXJmc3FxV0wwVXRaNldMaEV5cmRUcHJ0OXhONkY5d0Na?=
 =?utf-8?B?ZkFYQUtPRGhQYXdWM2szc0dEcVdTYk83WXFpU0IrS2pQY2dsTDdRa2s3NzVh?=
 =?utf-8?B?dnFrMXVCVFhzRWxma1RCUDJzaGV3MmdpZGR6VjlxbDNhMHJnZ2pOb3N5dytZ?=
 =?utf-8?B?N0RZR2tlSUtOd3c2QkZWem5aOGdHNVFFMTBmSGh6RzFYM1hmTFZaUjN6NEcz?=
 =?utf-8?B?TjRta0NFWDRMSlRYelJvdVZaZ0IvSHNjT2JrdnVNajNkRXlmSit3K1FLM2c4?=
 =?utf-8?B?WWFXbUVScDg5V0dBYnhKOE5nM2lYNDlJM29sM2ZBWlZBeGpGSGhFQVExTHhk?=
 =?utf-8?B?U2h0a0tXUlJPRDVZLzVnRnhyRDRKOXQrOExuNzcvb3pKb3F3c1V0Wm1JYXlW?=
 =?utf-8?B?UlpWTUR6RzNpNU04c0hINFpKTVJxdndDNkVSZ0dSMndFNXAyakNEZ2RjZG04?=
 =?utf-8?B?bXd0UStvdFZoK2lncm13ZW8xZlVqNFpsUVFsTVpYbnVWaWtTWFEvZ3pMMTFR?=
 =?utf-8?B?TUZtUEFSNWhRV2ZqWWkxUjBlQks1RG9vdnNiMTk1YjhZTGJpeTl4SnM3aXlp?=
 =?utf-8?B?WnovbjVwTFdIbUpCRDMxS2lFWTlrUEZWTHJWNlJaZDFzMitBa2k3VnljbTB5?=
 =?utf-8?B?Z09sMmVKdGNna05ua0RncDRMTVBGc1NHRHJiTHM4MTVUUkY2RjFsQjlLRnQw?=
 =?utf-8?B?Nm1TLzA1bkRYR1VuTFNqNlJORVFVaVVtY1NDdVFxV2hiakhZd0NscUJSK1lB?=
 =?utf-8?B?NHNjUytyNnB4VGE4QmpKYm1sRDZzMzdrakZpZ1dwZGlpZmRoSFVjVkZTY2hB?=
 =?utf-8?B?bTFEUzdpSXhxUVVuVkJnUDBSeVcvZnJtWTNiRHRuRUF5cUd5OWJmdWRGa3pR?=
 =?utf-8?B?dHNFbGpLbXlub1ZRZDlmK1hJOEE1alRFZjRQWTljZ1ZUbUxUVmVvYWk1c2w3?=
 =?utf-8?B?V21QQUx6VDVuaFR1aGhCUWFEU2x2eU5Jc29EUjBqcldNcCtWK2xXekRtMlRG?=
 =?utf-8?B?Y0hGOE5pbXk1eHhxS3hTNTcyelR3ZWdhOHhWckh0b2o4R3JhUXpLcmw0V1Rq?=
 =?utf-8?B?TjhCRjM4Vi9kNHpQWXVBTGhFb3dDREp6cHNhbDFDSExNQWNDbGczTmI5QmxU?=
 =?utf-8?B?WGVRM3ZXajRMbndrS0NOdEJ2VGdpekg3STJ4WGozY3BET3JoK243Z3ZFcWVZ?=
 =?utf-8?B?TzMwam9uRWJzTjdCUVZSdTliM3NEazBERThGMzBYT09lSExNSStYK1lEWVRW?=
 =?utf-8?B?ZWRQb01KUTNrZHJrSmNMa1l6Z25xcmJ5UlZ6YjJ4c2ZITFp3S2hSbXRhYjk3?=
 =?utf-8?B?amZweUlVU0V2KzUzQm8zYXpDZTFkNytxbnRaa2dUU0RVQ1NtYzZoSW4xdkh3?=
 =?utf-8?B?WUxKSGtPVE5UTnhKSE5sTmlHUVFHWXhnaGNncUxyandxamI2N0dXYktrWmZJ?=
 =?utf-8?B?aVpmd1czekJlWEQvbktqL1pRMXNUaVlqQ0UyN1VIY0FyZkVWQ3dmNGFxN1RH?=
 =?utf-8?B?d2lVbGZQOFNBS0Z3dDA5blJmaWk5OTQ5UTJJM3E1UFZXZy82alVrWmV4dUpD?=
 =?utf-8?B?elNmbmNDRXdJMnJIYTUwekx3aElodTRFTUNuTVk3aXpsc284ZElrMFIvRFBu?=
 =?utf-8?B?V1JGNVFnSEQzQ01QOWgwakFPRHBhVzZvNzhrNXpXc0VOUW5IcFpxMEI1bkI2?=
 =?utf-8?B?RUNPMUdFVFpNdmJEaGE4bDlyMzA1QklGZVcxMjYreDFZNVF4MnBTcmF6eExr?=
 =?utf-8?B?SDZGWm1vWDMycWN4aWxwUk5Rb3BGVzQvRWNjeXcyODZIS3FiOHc4ZEh5dlJU?=
 =?utf-8?B?T0huYWNzYnFuc1RkY0x4R1ZQNzhycHJBT25INXlZWURvbENteHVLZHZLMlV3?=
 =?utf-8?Q?9O2YV0g0s9A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR15MB6455.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlhLQXlvSTFmNDZpa05rUjFrWHc3NjNFd2RIQ2J2RlVEZUdHK2xzaFh3Tlln?=
 =?utf-8?B?eEdwYW5QeTRYTmNoUTB4dmJuMU5acldwL0ZvVlBvZ1EwSllMbXdJRmtVc3I1?=
 =?utf-8?B?NTlMRVZ3c0EzcjhXcit2KzYrNDBEaGFvSm4zZHQvSWVDWHQ5cGJhT1FhYk1R?=
 =?utf-8?B?MDNXOWVVcVBFSENUSUtuM21VbHlRNnRZcXVhUXZaeUtpb09iK0ltMzlsNzg2?=
 =?utf-8?B?aUx1cmtCOTVkUHpoQTBOZ1V1bzFJc2NweURWeGMwb0cwSnV6Z2grOThDakpP?=
 =?utf-8?B?enZqNVlDclVZUUpuU0RIaXgvd2lJUkVVc251Zis2RGFhTlVXd2pNZG52b0lE?=
 =?utf-8?B?TTVFYUdYeFJSMWlid1k4OUM5aDJPVGt0cGVBcVFhZFNNZTU2ZWZiT0g5WlhH?=
 =?utf-8?B?Y2RrN2FMSnd4cTQvUHg3WDM0amR6TjFtalRxRzFZQUtERGxQRC9HU1FwSXVK?=
 =?utf-8?B?UGpnWnpSSWpUMVByc0kzNEgyTEtrNzYzUkx0ZTRoRGNOMTB0dUtIQzBsZUdJ?=
 =?utf-8?B?N3pVRTZFQ25FckF1WmE0Ri9sdlROMkx4VHdrcVlaWjkrS2Fwcm13ZGp1OGdy?=
 =?utf-8?B?bmpTZjFMNVNKU290bDhXMFVFeDJmaU1BMUplR2RqZCtlaFUzbEpGRDNOUEhT?=
 =?utf-8?B?djk4Rlo1NytQRklNVnlxcWJVVVVwQzRTcU9GT2IzOGpzanE1aTNVaUowT1Vr?=
 =?utf-8?B?U3dBdXVVWEF5UTUwdlFjTENuQ0VTSG5KSWVFY0dialRIOWovT0szT3ZrUW16?=
 =?utf-8?B?LzdvMGlCN001SWZnUS8vWHg2UlhPdHF6cG5OODdST2dZbXg3Tm9ZbFBkRXgx?=
 =?utf-8?B?S0RxOHFiTVlzRFFld2ZIVkd3azgyUG80ajdwTzA1WDBnanJxRDRMT2FQbEpW?=
 =?utf-8?B?SXBpZlBxb010bW42RmZoSjdZZ2h5eS80aEtmUERFWS9jRjR6T2UxNFNWUncx?=
 =?utf-8?B?amp5TDZkZTRBMWlkM1JzVGFHV2xTbUFnSTFxVEUzQ2o4OEg1MVI1SHdNak1v?=
 =?utf-8?B?UElrZzlmQmNyV3VoZHJ4a3pBY0dubWp1ZCtRSlRkKzc4K3VNMXdXamFreCt2?=
 =?utf-8?B?cDNEcUJZaWozMzVKWE9RK3ZtaTV6ZldIYmlKUzY3dFp0RkNSZ0NTQThDT2JD?=
 =?utf-8?B?VDJVRTZ3bmtnMVptUU43ZGJTcW1CNkpOUUVQUll1MG44ZjBMU0JxRnMrc0p3?=
 =?utf-8?B?REVuenJMWjQyT3c0cXphR0h0aDM5MXZCZ3RzemtmbkNuR1ArL2RaMTZwM2xq?=
 =?utf-8?B?dWxKOENNSXBwWGQ3VjcxNTZiMWM0N1M2dlpCWERYcTRKbFQ5d2UrdUxSbUtq?=
 =?utf-8?B?bnZWR3BOcWxWbEZpL0cxUGVkM0JtVVRJRDA2cHdUY2JiQXdleGM5Q0VRQUhv?=
 =?utf-8?B?SUxPcHhER0JGcHJGQ0x3Z09mRUxSNk84UjdCNmI2aGNjQVJGd2k5eXBrdWp6?=
 =?utf-8?B?Si83dDkvYkRLL1U1K3U4QnBxY2pYWXI3OThnd2pUT3IyazY5TXF2T1BnTUth?=
 =?utf-8?B?b3lCNW5BSXNuVmJxRFdTZFhWbko5elMyQWk1OUxCeDRiZm5VTVh1eCthd3hG?=
 =?utf-8?B?eXNDaDV2alM4cTl4TFk0VEo1QjBkZEFTWW1TZG9iZGk2RjlmL1NzaHNMUitn?=
 =?utf-8?B?b21kZlNNY3ZpUEQ3YzNueGYzVzJFQkdnT3UvYXVsMWNMR3liQURjRW9TTkZs?=
 =?utf-8?B?VGszQWxkR2RyZlJFSzJIdFdDSkFoU1FDWXA2bjFJQ2s3ZGlTWmVvSDZGWHA4?=
 =?utf-8?B?WUMxVWxaOTRpMlg3NTM4S011U20vN0NYaUZibGFzN0Y5WkdhR2VZQ1VYV1BM?=
 =?utf-8?B?UndWTUl4ZXdYek1pNGFwUjF5ZU1pZmJSUXB0R0hRVTlkcitORTkxRHpEd3Q4?=
 =?utf-8?B?Vk0rQlkzdEd6MDhjc21Cd0NsRmprbDJ1ZTlhN0kyZllHclpKT0kySFhQWXBw?=
 =?utf-8?B?WEVWcThDbmJhelJvM1pyTUM4NTQvdjVvbExaMW5SZk1tT3ZUamxvY2ZCK3BE?=
 =?utf-8?B?elVOa0kwRzJIbzBJemNnMTZUZFZVRjQweE84ZEdKYWxiS1dGMzNBajNmdUFz?=
 =?utf-8?B?WGdQb1VKck5MZ1B4NG1XdG5IYUFWUTZGOEM4UW9iWTMveUw5TVcydktJTFpR?=
 =?utf-8?Q?Anxk=3D?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deb19023-884b-4f48-18ec-08dda547fe48
X-MS-Exchange-CrossTenant-AuthSource: LV3PR15MB6455.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 22:17:58.5553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BJBGz5biYGb1Xyh9Bktwy27nUMUQS/Wta2ARgTXKGyBhg5oMaYTYBj+yO4T6O+ki
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR15MB3872
X-Proofpoint-ORIG-GUID: c95W6SwjO4yM6T5bBZww1FGPLUGo9t2P
X-Proofpoint-GUID: c95W6SwjO4yM6T5bBZww1FGPLUGo9t2P
X-Authority-Analysis: v=2.4 cv=JsDxrN4C c=1 sm=1 tr=0 ts=6843691a cx=c_pps a=6OJZajHV9Y36iw+II7C7og==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=LBtYo4KyW9Vo6Dcn7c8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDE4NyBTYWx0ZWRfX64AnSrzd6y8F qHUd/s1XPq0fAI85tyCQTLONfn2KkNAigzH2HUNe04GAnopEZvK8JDMx502TkvI4PbTuwfXMYUE BzeyWxD9n55H81CSrAtUm5kYN3Uu3DEIJpZwc4o047gYHVa2Fa8FmX3S+pfFLqNzCWL8rz6jPG5
 yfrEAzjLhqPLZCxxO28PgbOIByKbpAXv+9gxwco+dW1AVPuUIPHpZD6g4cn+xeafIZNnMKSYCYg dY9g6Ld5Hv8vOoyJFODC0+j2AvfA4uf6jtjF8Mw0g1qdQjL233QVJqr41e6aCghhmPgRrOIPiSg AYpRt8M3rfbzBqb4PC/dcFgAqGRnS5HvR1xnBfl6/xK4+l9X/yZKIuR0Qe9P3aVm/KuF353wnOL
 QH5SpHnKOJ//DXsm216yi7AIgAIVg77uYSa724lN3SyEmmGXVm7g8Hg/+lKUK771TI8iCSWs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_08,2025-06-05_01,2025-03-28_01

On 6/6/25 3:06 AM, Sebastian Andrzej Siewior wrote:
> On 2025-06-05 20:55:27 [-0400], Chris Mason wrote:

[ ... ]

>> Going back to your diff, if we have a process growing the total number
>> of threads, can we set FH_IMMUTABLE too early?  As the number of threads
>> increases, eventually we'll pick the 2x num_cpus, but that'll take a while?
> 
> If you refer to the schbench diff, then set it early. Once the prctl()
> to set the size of the private hash, there will be no resize by the
> kernel.
> 
> If you refer to the kernel diff where set the FH_IMMUTABLE flag, then it
> is set once the upper limit is reached (that was the plan in case I did
> the logic wrong). Which means at that point it won't increase any
> further because of the CPU limit. The only way how you can reach it too
> early is if you offline CPUs.

I pulled your immutable diff on top of c0c9379f235d.  Just the immutable
diff, not the first suggestion that bumped num_online_cpus() * 2.

The RPS did not improve (~2.5M RPS).  Looking at the futex_private_hash
of the process:

>>> task.mm.futex_phash
*(struct futex_private_hash *)0xff110003bbd15000 = {
	.users = (rcuref_t){
		.refcnt = (atomic_t){
			.counter = (int)0,
		},
	},
	.hash_mask = (unsigned int)15,
	.rcu = (struct callback_head){
		.next = (struct callback_head *)0x0,
		.func = (void (*)(struct callback_head *))0x0,
	},
	.mm = (void *)0xff110003321a2400,
	.custom = (bool)0,
	.immutable = (bool)1,
	.queues = (struct futex_hash_bucket []){},
}

It's because our calculation on the max is based on
min(get_nr_threads(current), num_online_cpus())

get_nr_threads starts smaller than num_online_cpus(), so we immediately
decide we've maxed out the buckets?

-chris

