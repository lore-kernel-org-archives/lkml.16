Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA07B9478
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 01:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746409458; cv=fail; b=t6pEVFJJd0iG7w7hjmuHGK/DCPelMP8mSqklcYNbGQPKn4yf38Joe0sgETS/WUhclIa5CSZVnGu6UZEybnMyIUcBlOeiE5Vcou6XC5XvStnQ8NHg4o6X2IG9hkl/JDDh7/z0XOCf3cZBcJ4mU02a84N32WU1gLzcAIrocQTCAMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746409458; c=relaxed/simple;
	bh=e3qB4k/mDKwt7+tYIsYihZD+jI/LMwgIhvU8m7I/WWo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=h6hVxxD88YJUYEhz0AXkx2i72wT2cbB5Y/y47+4HEG8JupTNcPVS1l8U4gO5BM2fUUcbuy8smNwgiN1N+HwQ+MwSsw0gViDPQZLbxjxXLg2JjoHs1Cw63CugenBayRVOChWJnU2gY+rg3MD825T0YA3oSGtVdDsYUmqJyVdIyjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jYnoiiAZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qjFCORxs; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jYnoiiAZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qjFCORxs"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5451gJUe027215;
	Mon, 5 May 2025 01:43:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=e3qB4k/mDKwt7+tYIsYihZD+jI/LMwgIhvU8m7I/WWo=; b=
	jYnoiiAZbZfkJY20MoXTsw4kIWdtC+vBpXsxweUmvjm+vvXhu361hs7aGHK6zttE
	1Fv98RPHW/gF6WqO1w3FOYQWty1EkML/0pwnjDoucr8Pc3/wMZpoSTSp+BvIG3Jy
	JT5MZbUB+IORsrmsnRBSmx92pw3kzXVyeurxyo7nd5PC+/EtStTFF5wNFtBLMuny
	uAcpNqW4Muh1wt+lqbs0C1iELSgDHydEeMPPLfCtvjEthUti0N8rusxj43CR5uT0
	0QxSyYpNDzIw5Hq8cPvUU8I4auL/ewJMvgW0U0pbZSDQExosnScBLBfj9hpF+z7u
	7Ax0hKjACGLQAYKbLruDTw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46ekw6r00p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 05 May 2025 01:43:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 544NcD6P036000;
	Mon, 5 May 2025 01:43:52 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazlp17012036.outbound.protection.outlook.com [40.93.1.36])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46d9k7wcex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 05 May 2025 01:43:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uz1udb8HZZvSX0+Bfm4hR2jCQA4FZPfXFSXJERsCK2O8uq+EwLJNfzKV3rfHcmUqw22w/iZTzSS+43z5Sp3VQJs4xoC/5Os8DHslZ+v4y382XciM/06q7rbBIieKYMllZGDmYwevt7HUCPhLITueSUMrO66mWgxoDn/ajZ1oHF2syzZAN8nEFmGxkyDNOCE8zapwOTH3Hr/XyOpI2rGypFCFRcaBjHJg83mAx/m9agiU6NY+/URS8cey3AcIG66cNEbjeDOquw2LtdvgsVvKHtI2/ec7kREr0L577Yjh9t2HtLmG92ZFfCUd4rFYBcKkkF+wRiri0FAvfZpV0szZFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3qB4k/mDKwt7+tYIsYihZD+jI/LMwgIhvU8m7I/WWo=;
 b=C2UqzP34xijdQlCDmUeHp9TEB0KczTvhiOfWih8qWjuZO4WeVq4F76hCQHtZd4QTWhofViL5incTeHe5AkFbemFoBsMgJFvoHQ0+B0zR7v0RvNmEYSLU4zhSgsl5w27VoYLTWlNJtpbPFRLi5ZDvqMsakdU3B1LtaLw4YB8Bk/xdRkhdwWuxj5Bw6TVo+G8miGdNpRAiVRzvFtzgEnlDamWDpKgjcCTxZP4DP/vVWzVPgNig8tWyHUuq7BqXsrWhl59yxYueJq6mO9npy8Fdd1jud0LhtOKCB5aAlefFbXgFJK0GdzNviEO6raDAHyUTwTQ8W4gpOccCEe9VEW0HKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3qB4k/mDKwt7+tYIsYihZD+jI/LMwgIhvU8m7I/WWo=;
 b=qjFCORxsNWctpxedUTWKE4Pqo5+z/9vwLtXMFUQ6Mu6g/IgxvSNfToSSWTjyYYmAe6jMXuegAuDVlPAwJ/96m4557KmGcU5d3Mth9mi6vweQypk3ANg6S401byZwxvdFJwnivW0PwMqG4aFS9eyiJ9fzTdl06RRNb4WFprZVtfo=
Received: from IA1PR10MB7309.namprd10.prod.outlook.com (2603:10b6:208:3fe::13)
 by BLAPR10MB5124.namprd10.prod.outlook.com (2603:10b6:208:325::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Mon, 5 May
 2025 01:43:44 +0000
Received: from IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a]) by IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a%4]) with mapi id 15.20.8699.022; Mon, 5 May 2025
 01:43:44 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "rostedt@goodmis.org" <rostedt@goodmis.org>,
        "mathieu.desnoyers@efficios.com"
	<mathieu.desnoyers@efficios.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "bigeasy@linutronix.de" <bigeasy@linutronix.de>,
        "kprateek.nayak@amd.com"
	<kprateek.nayak@amd.com>
Subject: Re: [PATCH V3 4/4] Sched: Add tracepoint for sched time slice
 extension
Thread-Topic: [PATCH V3 4/4] Sched: Add tracepoint for sched time slice
 extension
Thread-Index: AQHbu0K7XemYr0jh9UGGM8QgRucf/LPDR7QA
Date: Mon, 5 May 2025 01:43:44 +0000
Message-ID: <DF36EF48-1052-4F62-A310-B92DE46A73FF@oracle.com>
References: <20250502015955.3146733-1-prakash.sangappa@oracle.com>
 <20250502015955.3146733-5-prakash.sangappa@oracle.com>
 <20250502091434.GV4198@noisy.programming.kicks-ass.net>
In-Reply-To: <20250502091434.GV4198@noisy.programming.kicks-ass.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.500.181.1.5)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR10MB7309:EE_|BLAPR10MB5124:EE_
x-ms-office365-filtering-correlation-id: 0804e84b-4b61-4ef1-cd63-08dd8b764565
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZS9IZ3lwcUZUYjJVWVd0dk9GMlJZRm9FYTQzYjB0cWxzVE9FR3R5ZHRGU0gx?=
 =?utf-8?B?QkVSaVR5TVNHZU9ZYmNuOXJNU1BMVnpvRTU4aTRoNmNFVC9tREJRQVlGU3VW?=
 =?utf-8?B?YUJiWW1YT1RhWGFOZGtTQ05hUCtRSDNTbUtnS3R4SlBvclpRUmQ3M0tjSWV1?=
 =?utf-8?B?WE1VWTJJZkF6UXkxR1FqTWpWWFdOQk8zY2NGcUxkTnVEaEdSNlJsVExpSllP?=
 =?utf-8?B?a05mckVWS0FMWS9PTmV1UW03N0VZQ0dNdUp4TmNZL29QY2VGV0RCV3g0N0wx?=
 =?utf-8?B?RkVUY3dTUlNFTUk1bGNqTHRmNU4wR056ajdNcmY4V3h3SU9FZXRMc0RKbTBO?=
 =?utf-8?B?bGYyZC9MOFBFRHd6MEcrbUJIeU8wOTVoT3JJKzNuZHpCbEoxZk9NK0E5Rkhu?=
 =?utf-8?B?QmZjZ05RL25MUE5qZ0JGNGU0RXNqeUtTakF6TXluK0V6ckQ5ZDBnRkpGTHha?=
 =?utf-8?B?di9HblNsY21HcmRJY3FJR1B0NXkrTnJXSElaNHkxWE1lU092elkra3lDWUVl?=
 =?utf-8?B?dk0xaTA3OVgvWmxnZzNlcnRkbGZ2U3lEV05uQmdzS2dvK0VGVXprSCtwZms3?=
 =?utf-8?B?cmpUaTl1WTlGQmp3bXRzV1V6TTVGNEtsN0JKL295ci92NzlXczVXa1pFZFpS?=
 =?utf-8?B?aUlDbjYrS1FzYUxkcjRMUVdmVmRHSFRQVE45Qm9UelgvWlBsVW1lM1ZTMzdR?=
 =?utf-8?B?cDVPSU0zL09uT1pmbWFnTFJ3WXRSQzA2U2FiQkRLZnBjVG5CSlRvTk1TdHVX?=
 =?utf-8?B?SHBOUGxUNWVFZm5VN3krVXUvN2xlajBLS2FqM1NUU1R3b0VqWFBJak5aTXhw?=
 =?utf-8?B?RlBZdXhUUEFkUUlPQW1mc1NxMHVDTFQ1N2JOQjY2cERZbWlJVnQyYlhoN3pF?=
 =?utf-8?B?QzE3Ym1UU1JIV2xmaEI2ZnJFeEZJd01kWStScExVdDNQRFlZc28vK2wvaG9s?=
 =?utf-8?B?ZVdWTi9pZGd4U0J1bHN5eDNlc016Q0dlQlk1UFREZWxRQVkyeG5Pdm5QUWRO?=
 =?utf-8?B?VjBUQ2tmQTh3WVpGSUNZcXhQbkcvSEpuTkJDNlRncGo2TTZWQTNoTUdPSUN2?=
 =?utf-8?B?UEFXQmFQNG5pRXd3TzlFME1DbWZVaXhRT2hJQ1ZybDRvRk8yY1hJdjZvcG9j?=
 =?utf-8?B?YjRoTWZVSHNZVzN6YVVuVk9GSVJkWlpuam4vZkJvS2cvOWZQSEV4cWVVQ1BV?=
 =?utf-8?B?YllEa0poeG53ZDd3R0RrdnJ3bGdUMVZPaDdyOGo1MFk2QjRIMUJ6S05OT1Vv?=
 =?utf-8?B?NzRycVh1UlVoZENVUzJHTDhST1pKcW9JaUNNdE5TT2dRd2xjNFZ3dXo0Nmc3?=
 =?utf-8?B?T3JIQys1clZWaCtZUklveHdiYmhTT3FodytqQk90dkpHdktCdEREcGx3SVRT?=
 =?utf-8?B?bmJ3MTJUQzBEUE5iSWxaN1AxNjdMWDhLUUFzQlVwQVpzTlZOVU9BbklZalls?=
 =?utf-8?B?Y0YxQVh6NWVNM1AxODVNSmJYS3h4dWY0a1drakxuYjVXQ3RYZTNvbE9hV3Fo?=
 =?utf-8?B?dVNUa1dJa0ZKYm9rZVptTUxqNzF6U3NSalA0bDJhWE5pZnBteGtJVU81dDhu?=
 =?utf-8?B?UmRwbEhVeGZockR1NzNldWxXVVY1aEFhM0tZdlo2T0xaUU9OaEREc0tHaGIv?=
 =?utf-8?B?S08rY2R5ZGdpUUZCc3hQbFF1WUtLN0piUkYyRzlnUm1oTTQzZXE4QWpOZXR0?=
 =?utf-8?B?ZEJzR1ExNzFFNXl4dlBRWTRMdzR2ODBSeHM3NlhNSXdMYStIeEpnYnFxZkJ1?=
 =?utf-8?B?NGdhMXRmRHVzcWRRdE9KY2Y4YlJpcm5ibHd3ODYrTnJzcFBYVllPb01TUVNC?=
 =?utf-8?B?eGJmMmZES0NpUEN4dElhc2VBNFRLVGs0SmRrTWlCRkpOb05sNGJHRU1sbnRr?=
 =?utf-8?B?VnFTQ010WCttbC82OUpCSFREOUFUT2FoY1VRek1MWTFZMGVjZWNXUDhPQWFD?=
 =?utf-8?B?SzdjWGFkV2l6QmFSTFlaYjR1bFowTW5XVk5KcGpzRWxXUkx3R3N0UWFQb21O?=
 =?utf-8?Q?kWhbg7a8zP6Rx+r8NgtoG/rTfAVBQQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR10MB7309.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dFR1Wk5JSmxQb1RiTFRyQVV3YUh0YVVUbzlNd2FXV0tLeHpEbis3V3ViVjdv?=
 =?utf-8?B?SERxbnVyMWtaSU9GVnlhblB0N0tvVzVOK3E5NlpFMjJsUk44YmMrbDhFQ3hy?=
 =?utf-8?B?TnBLWGRkZ0NxMDhKUk5IRG9OdVptTVF1WDAyVGNMbmtIdm9OcVBLcERRMmpU?=
 =?utf-8?B?anhGc1BXQTZjeEtscUowT2JwcjFnVXlLSG05Q3pBd2t1anlOeTRZbENGM3FR?=
 =?utf-8?B?MWltaW5YT09rSVhaYnZOOVkrSzB4VTIyTkt1dE9tZXJQQUFsNEtGNFBYUGFQ?=
 =?utf-8?B?RG1RTzBXZXcwSG5vZHB2V0NaSjhvRTczM1ZhTkpaVlhmajdXWnJqR2VIYjVv?=
 =?utf-8?B?RGhYajNaQk5CWHVFclhVOXJabVRMay82QUhQWkVFSGthSElSbW00ZFpVd3B2?=
 =?utf-8?B?cnNwTmtPNDFyNWNKNDR6WldVU1MxQ1FNWGxmTG5wdzFWdldBRmVCOWsvdC9Z?=
 =?utf-8?B?bWVTSHVxZTl2V2RYc0NoOE1Bd0sxWTNUcklrc0dETXB4RC9rZGd0NnkxcWg5?=
 =?utf-8?B?ekRaT2p0a0wza2pVeS9WUHl1WncrcWNqQ0oxTytJb3BjSWMxRUlWUmxCaGJC?=
 =?utf-8?B?cTlsbkUvbUh4U3Y0MDArRWZNRWRZT04xNlpsY09MLzV0WW9pYy9ycjZLUmNS?=
 =?utf-8?B?NkNTUkhwdDNIV2V5Q3h6R1RBYTV0Z3JkRW13dVEyOTU0NUc3cllZZDNEaDR6?=
 =?utf-8?B?NjhkUm1weUFmaHNBQnhjek9kNFNnUGIrSUprZzNZY2lRZ3NCNUdySHlBdDFp?=
 =?utf-8?B?RjUrbE90TFVWc0tvRVcrRUdzU3lhZlhsaVNjR0VqUkcyV0xhcEQxTGUrcVow?=
 =?utf-8?B?UWFGZ3FOem56TEVVL2RNMTFqL08vV3ZBVFUxY0RBQ1B2aFZIQm96eko1cU5a?=
 =?utf-8?B?Q2p2MVAvbnNYRzdTMzI1VGVobUw2cG9nY3pQNmw1VGtzcHZzRktjZG55bHNl?=
 =?utf-8?B?cEs5NHlZVzRtNVRIbkpQaW5uRWZzV3NlSTFpTVBsV3RWeUdCQUx2bnpjazQ4?=
 =?utf-8?B?Y0tFTFB0V1hqc2c0emdadWVidStpWTd0UjNSaHVGc3JHZzFvbUxCSHNXblUy?=
 =?utf-8?B?TWNmLzNDMG1BTVBvd0lyZnluclVVbFRhT0U5dVFiVEdCWUNOVjJ2MkUzNmRj?=
 =?utf-8?B?Ynpyc0ZLUFNHbDdiTWFGVTNRVlBWajhmbktVVUVVWmsyNnRvK3pzTnFTL0JY?=
 =?utf-8?B?NGN4d21iUzdVUWJZTFJoNmVzQzdySWpUYzN2ZzEwdGVsem0xSUJhYTF2VHd2?=
 =?utf-8?B?RnlJVlhoMXJPMTNuUEtuaHhZNDQyQktmMFB6NUY1dURZV0kyZkFvNzdnTG5S?=
 =?utf-8?B?b0JTeVBVNWVlVTA0WDVpZGZtdUZIWU9nOHVzWWVab3ZqZVFhS3JuY3VLaEZv?=
 =?utf-8?B?L3BDU1NlRzJlc2JtWkp5amFtMy9lY0xvcFk0bzA5bk91KzM4ZHVrTUwzelpF?=
 =?utf-8?B?cnRPZ1ZqZlQwdkxvVGpTd0J3SmdvbjBiM2lDY0JrZk8wM1BtMEdtaVhCT3Va?=
 =?utf-8?B?N28wcmg5RE10VURNc0lGQ3J0VSsyYlZGR25KTWw4U0swUHhEdUp5ekRqSDlL?=
 =?utf-8?B?Y0NuajFCTUxGcUlUQnJBWVBhdVZOQ0RZVjhtQ3VEeHNNY0s0R3EwVjRnQURt?=
 =?utf-8?B?NjFzYWpRazhQV01neEhWQWlZTndPUzZhdHV3dFZJSHE4aTBraW5nNkhxN2pP?=
 =?utf-8?B?TDNoRFZwaWxDUGpNOWFLOEVKNFlzU1ZzU1ZvME93bVJsc21UVkRxM20zL3E3?=
 =?utf-8?B?ZWtCcHd6WXJCUHFuM0JWdWJPZ1pRZmtGbnZCWnlleW55RVZ2ZnYrdFpLaXJq?=
 =?utf-8?B?VVNlN0FTUHJQcWFISWwycElLTWUxcHJONVBlRSs4NEZDbG9HZzNoZmFrNDkx?=
 =?utf-8?B?d1U3V0JmaGlObzBMbEtkUjFVeVVMWlVmRVFlRW9ScytDVEg3NU5UUWowTWh1?=
 =?utf-8?B?RGhTQndjUGRrc1JrbWJUT010L3Qwa3pKSVpXMksrc1VKdG9uaXpvRzFYb0Zo?=
 =?utf-8?B?SEM0azNGemlpV3cyOTBuZFk4YTVwek0zcGNUZWxDNzg1RG5lUklOVm5IZEsx?=
 =?utf-8?B?eXVvdmZyOEd2bWpHcVV5YTRUa0FraCtTVFdwbVVrZGlYMEVYMkJlSGxSWnEw?=
 =?utf-8?B?Q1F3S3FUVGtFcFVFMUozUktBcHJHS2htTEREelpEbStHa0tzVWs1aUlKU2xq?=
 =?utf-8?B?Q2g4RWc1RUZjYk9yUDlxZzdlSG5yM3JQMjIwR29KNHorZjNIVTZMUU1EODJD?=
 =?utf-8?Q?3Cwm+oHq8l7v9Uuw9aAP8K4ZK9L8fvq1zhQ56F0Zhk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF543BA910BEE841B7A912BDA2FBBF5D@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ui/nq971IlUZf3blMAp1OSmZCwsv90rItqA4yE7NvaK1pPpFEN53L2wJQSI0wS8xliZ/bYGnrAxtB7uXv+bVUaC9hZ3BHqj7C3/I+baFcS6geHc1Wyyhm/rjo9GH9OWoXnNGI/dWGNCKEHKwt0DFqh8SiqsS9Sbn5fyBRBo6FViIiAOlsLS+rHzY/wOebR4CC1tHhTuow25sXHOjWjKosY9RAkjM9m+/VtU5dSmu5huMvO/WJK2SXWNXhnxStAieWm5qfhteu3Il78G62AzeZgJCH8bBNlgVuljAU/WGuL21lBCsu1rInJzHn47Y+b8Q81PfbXjlE28e+QchNpkOU6ft8lmXnQQzBUpQg4I6595i759UXyRaVDCVKpZ6q91ch29xt4xeDUJsRXMTgkFjHC/x5+WJmSMDDYx8EUZjBcQnUJOIUMFkSM/lHGZsPMPR4+wGjmWbATWLbrLrmRkVWmbxs+v8N3lH6Tj1LzrUWq9T5/EEMytO98+VdJAbigH3sJJDJj6WVAnwql9IIiXRKtk1/dvk86t+po1LTwacb0qJr+jG+ODtqUmmUfpE5EeUHd6QHYeZ3Vzy3t0aKANIcpdQZn0VQp+2EEc+1uuahs0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR10MB7309.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0804e84b-4b61-4ef1-cd63-08dd8b764565
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2025 01:43:44.2892
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hBXX8vAi92fDcvEVE2IVh7xbx72oSWmHxK7dqnnZF/HgpgYeDil568kqHg6ssQwJlPnmQxAOqNgc8MRX8VU2si5k+do3QWSBpeMj/eGhx5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5124
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505050015
X-Authority-Analysis: v=2.4 cv=LP1mQIW9 c=1 sm=1 tr=0 ts=681817d9 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=JfrnYn6hAAAA:8 a=yPCof4ZbAAAA:8 a=kCRx7WtxGkeb86VEhswA:9 a=QEXdDO2ut3YA:10 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: sjACTwE8PzIHXVAyuuCBEan7yC-qTveq
X-Proofpoint-ORIG-GUID: sjACTwE8PzIHXVAyuuCBEan7yC-qTveq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAxNSBTYWx0ZWRfX9vW+IElDEShr kW7NPpr+6+rS5IZ0Nhm8T4TlftFmVx+cFr9KlLa1aEv4MrXHIAcAtkIbualtOgBHfUbZ5fMBQzy XB9iwIZpI6YrRx1wHQD7SNat5wEKoOIG1Z5EWMst8yCJDb3CzQyjazjmv03mF3moWO5gA6j2nKh
 /d2HdAJjkBzLKNJv7vBOkKMC7avw8snWLvVD4yMMcojLDE8Elx8zq7RZBV/2t+8lHNs2PECBg/F JjUN5w8zFniRVpfDcWMReLTtIr3TtokB0v6VWGV1SxvnrbYbjYcyhVXomE4ManU6fGN6u7oW9O4 /+GgxAh48xQGCBkyFIhqq9IKHtRqvAzwsyvDnnTYjHRMsI6e28aAHL5ulKszPtme+Dy4ZeMZn6Z
 Utdo/lYGJaacdsLxIcPl+sbTpqQsXh2+jj88m/zwYh/4ADFCiTmJGmFkWOmla3ra6lbapoi0

DQoNCj4gT24gTWF5IDIsIDIwMjUsIGF0IDI6MTTigK9BTSwgUGV0ZXIgWmlqbHN0cmEgPHBldGVy
ekBpbmZyYWRlYWQub3JnPiB3cm90ZToNCj4gDQo+IE9uIEZyaSwgTWF5IDAyLCAyMDI1IGF0IDAx
OjU5OjU1QU0gKzAwMDAsIFByYWthc2ggU2FuZ2FwcGEgd3JvdGU6DQo+PiBUcmFjZSB0YXNrJ3Mg
cHJlZW1wdGlvbiBkdWUgdG8gYSB3YWtldXBzLCBnZXR0aW5nIGRlbGF5ZWQuIFdoaWNoDQo+PiBj
YW4gb2NjdXJzIHdoZW4gdGhlIHJ1bm5pbmcgdGFzayByZXF1ZXN0ZWQgZXh0cmEgdGltZSBvbiBj
cHUuDQo+PiBBbHNvLCBpbmRpY2F0ZSB0aGUgTkVFRF9SRVNDSEVEIGZsYWcgc2V0IG9uIHRoZSB0
YXNrIGdldHRpbmcNCj4+IGNsZWFyZWQuDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IFByYWthc2gg
U2FuZ2FwcGEgPHByYWthc2guc2FuZ2FwcGFAb3JhY2xlLmNvbT4NCj4+IC0tLQ0KPj4gaW5jbHVk
ZS90cmFjZS9ldmVudHMvc2NoZWQuaCB8IDI4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysN
Cj4+IGtlcm5lbC9lbnRyeS9jb21tb24uYyAgICAgICAgfCAgOCArKysrKystLQ0KPj4gMiBmaWxl
cyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4gDQo+PiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS90cmFjZS9ldmVudHMvc2NoZWQuaCBiL2luY2x1ZGUvdHJhY2UvZXZl
bnRzL3NjaGVkLmgNCj4+IGluZGV4IDg5OTRlOTdkODZjMS4uNGFhMDQwNDRiMTRhIDEwMDY0NA0K
Pj4gLS0tIGEvaW5jbHVkZS90cmFjZS9ldmVudHMvc2NoZWQuaA0KPj4gKysrIGIvaW5jbHVkZS90
cmFjZS9ldmVudHMvc2NoZWQuaA0KPj4gQEAgLTI5Niw2ICsyOTYsMzQgQEAgVFJBQ0VfRVZFTlQo
c2NoZWRfbWlncmF0ZV90YXNrLA0KPj4gIF9fZW50cnktPm9yaWdfY3B1LCBfX2VudHJ5LT5kZXN0
X2NwdSkNCj4+ICk7DQo+PiANCj4+ICsvKg0KPj4gKyAqIFRyYWNlcG9pbnQgZm9yIGRlbGF5ZWQg
cmVzY2hlZCByZXF1ZXN0ZWQgYnkgdGFzazoNCj4+ICsgKi8NCj4+ICtUUkFDRV9FVkVOVChzY2hl
ZF9kZWxheV9yZXNjaGVkLA0KPj4gKw0KPj4gKyBUUF9QUk9UTyhzdHJ1Y3QgdGFza19zdHJ1Y3Qg
KnAsIHVuc2lnbmVkIGludCByZXNjaGVkX2ZsZyksDQo+PiArDQo+PiArIFRQX0FSR1MocCwgcmVz
Y2hlZF9mbGcpLA0KPj4gKw0KPj4gKyBUUF9TVFJVQ1RfX2VudHJ5KA0KPj4gKyBfX2FycmF5KCBj
aGFyLCBjb21tLCBUQVNLX0NPTU1fTEVOICkNCj4+ICsgX19maWVsZCggcGlkX3QsIHBpZCApDQo+
PiArIF9fZmllbGQoIGludCwgY3B1ICkNCj4+ICsgX19maWVsZCggaW50LCBmbGcgKQ0KPj4gKyAp
LA0KPj4gKw0KPj4gKyBUUF9mYXN0X2Fzc2lnbigNCj4+ICsgbWVtY3B5KF9fZW50cnktPmNvbW0s
IHAtPmNvbW0sIFRBU0tfQ09NTV9MRU4pOw0KPj4gKyBfX2VudHJ5LT5waWQgPSBwLT5waWQ7DQo+
PiArIF9fZW50cnktPmNwdSA9IHRhc2tfY3B1KHApOw0KPj4gKyBfX2VudHJ5LT5mbGcgPSByZXNj
aGVkX2ZsZzsNCj4+ICsgKSwNCj4+ICsNCj4+ICsgVFBfcHJpbnRrKCJjb21tPSVzIHBpZD0lZCBj
cHU9JWQgcmVzY2hlZF9mbGdfY2xlYXJlZD0weCV4IiwNCj4+ICsgX19lbnRyeS0+Y29tbSwgX19l
bnRyeS0+cGlkLCBfX2VudHJ5LT5jcHUsIF9fZW50cnktPmZsZykNCj4+ICsNCj4+ICspOw0KPj4g
Kw0KPj4gREVDTEFSRV9FVkVOVF9DTEFTUyhzY2hlZF9wcm9jZXNzX3RlbXBsYXRlLA0KPj4gDQo+
PiBUUF9QUk9UTyhzdHJ1Y3QgdGFza19zdHJ1Y3QgKnApLA0KPj4gZGlmZiAtLWdpdCBhL2tlcm5l
bC9lbnRyeS9jb21tb24uYyBiL2tlcm5lbC9lbnRyeS9jb21tb24uYw0KPj4gaW5kZXggYjI2YWRj
Y2IzMmRmLi4xOTUxZTZhNGU5YmMgMTAwNjQ0DQo+PiAtLS0gYS9rZXJuZWwvZW50cnkvY29tbW9u
LmMNCj4+ICsrKyBiL2tlcm5lbC9lbnRyeS9jb21tb24uYw0KPj4gQEAgLTEyLDYgKzEyLDcgQEAN
Cj4+IA0KPj4gI2luY2x1ZGUgImNvbW1vbi5oIg0KPj4gDQo+PiArI2luY2x1ZGUgPHRyYWNlL2V2
ZW50cy9zY2hlZC5oPg0KPj4gI2RlZmluZSBDUkVBVEVfVFJBQ0VfUE9JTlRTDQo+PiAjaW5jbHVk
ZSA8dHJhY2UvZXZlbnRzL3N5c2NhbGxzLmg+DQo+PiANCj4+IEBAIC0xMDAsOSArMTAxLDEyIEBA
IF9fYWx3YXlzX2lubGluZSB1bnNpZ25lZCBsb25nIGV4aXRfdG9fdXNlcl9tb2RlX2xvb3Aoc3Ry
dWN0IHB0X3JlZ3MgKnJlZ3MsDQo+PiBsb2NhbF9pcnFfZW5hYmxlX2V4aXRfdG9fdXNlcih0aV93
b3JrKTsNCj4+IA0KPj4gaWYgKHRpX3dvcmsgJiAoX1RJRl9ORUVEX1JFU0NIRUQgfCBfVElGX05F
RURfUkVTQ0hFRF9MQVpZKSkgew0KPj4gLSAgICAgICBpZiAoaXJxICYmIHJzZXFfZGVsYXlfcmVz
Y2hlZCgpKQ0KPj4gKyAgICAgICBpZiAoaXJxICYmIHJzZXFfZGVsYXlfcmVzY2hlZCgpKSB7DQo+
PiAgICAgICBjbGVhcl90c2tfbmVlZF9yZXNjaGVkKGN1cnJlbnQpOw0KPj4gLSAgICAgICBlbHNl
DQo+PiArICAgICAgIHRyYWNlX3NjaGVkX2RlbGF5X3Jlc2NoZWQoY3VycmVudCwNCj4+ICsgICAg
ICAgdGlfd29yayAmIChfVElGX05FRURfUkVTQ0hFRCB8DQo+PiArICAgICAgIF9USUZfTkVFRF9S
RVNDSEVEX0xBWlkpKTsNCj4+ICsgICAgICAgfSBlbHNlDQo+PiAgICAgICBzY2hlZHVsZSgpOw0K
Pj4gfQ0KPiANCj4gVGhpcyBpcyBob3JyaWZpYyBjb2Rpbmcgc3R5bGUuIEJ1dCByZWFsbHkgd2h5
IGRvIHdlIG5lZWQgdGhpcz8gSSdtIG5vdCwNCj4gaW4gZ2VuZXJhbCwgYSBmYW4gb2YgdHJhY2Vw
b2ludHMuDQoNCkkgd2lsbCBtb3ZlIHRoZSB0cmFjZV9zY2hlZF9kZWxheSogY2FsbCB0b3dhcmRz
IHRoZSBlbmQgb2YgdGhlIHJvdXRpbmUsDQphc3N1bWluZyB3ZSBhcmUga2VlcGluZyB0aGlzIHRy
YWNlcG9pbnQuIA0KDQoNCg==
