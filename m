Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6B93AC1C
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 20:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748030631; cv=fail; b=SV1I3SDBADc+KIOGgdfKNsU3Bl1Zb4eLxc9NPjVgxqoQ3ntT+FAZIFsAWD/voy/o1CpdtmcBIIDktQOUXXvSM/aSl2TNvM3GzNBiDnNyvwgKNVNzLwLn3wQbOKxaunYAbBVR5TUv2JNb5aia2iIjQTEAPxRK4S5XXPGDgr+oUPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748030631; c=relaxed/simple;
	bh=qhoXdbLkAF6XVjr9H5g60kkDFsCQSu+3fc7Kf+s79FQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DRXkvIm1OhyhK5dLvWzbZ1jmjT9XvSWkimkEecYFqdLWxhlrDLCuzNgKWm9hieTRI93Qgimm4s3D4ig9Z8zHhJc4x2WwGF3/BAmDgCTjGh6hTpmwJ4CKkYh8zwCja6UQd2Aja+BqdhOf2cVhhRLRCCxlot76JRAfIVSBxEq58iA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fE4zEzjR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Du21GFIY; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fE4zEzjR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Du21GFIY"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NJtm7W019735;
	Fri, 23 May 2025 20:03:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=qhoXdbLkAF6XVjr9H5g60kkDFsCQSu+3fc7Kf+s79FQ=; b=
	fE4zEzjRxM5ycr6aIUayofCnZLo8cmFZMOkrvV86DGhEJfYo5n5bJ6bZqAa7QjYv
	xTOYIPxRV/jBzREw8GrQk3mDH+zQy9DxRo8lGoYIvys2KC80uKYwCMs6+gn9M6Z0
	V6elUdYAJxkM8eqFBSOLPDcW+Jzc24jseykw8BG3DFTS/QMj4uAPdw7F4OfXA+vX
	dsRYLKRHCQhmOJ6emLZK8aV2y+o7ARgzj3xJ6lgmGiTme/l4WxfWWXFRa5g0D+Pr
	nr0NxnRBrH/b8cr12SIWRJFiEyK+ZMRH0VM/EIjg1+1Jk9wqvdzkW7yHgkBgxi3j
	w2NdUt2CTXvLhxYrK+H/iA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46ty2g81hx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 May 2025 20:03:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54NIuepT034689;
	Fri, 23 May 2025 20:03:30 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46rwesxydh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 May 2025 20:03:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NbqSvllGZMnHwRKBOFGIDwOns8rPzSbvMBpqzjgg+Q7xROOyZdcUZh6hdfMF+yyD5LQ5MfqMQ6SeEd5Qs7zrfHdYvQUmAmJ+PwubPWjQDt98Cr9ak63PCbUBiOo3cNX/buksptFTX3k9625stuZ5P7AT4+bHqWm/jC5RqbNjZ+D4n8yiYtTrdo7zNtP6OoisnJPRznUW/TX967bcvyHZjcnM+Y15AUiNOu1PQno2iT+fB3zWftLoKc5fzRmlF8rX41BODi3sb+hlgQ+FTbkDV3fV6tH4zmBtqVFB7/kQJRSgPw9uOj7WOmkWXXeuvVXvU4hSfigTufS57MCRxwkFkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qhoXdbLkAF6XVjr9H5g60kkDFsCQSu+3fc7Kf+s79FQ=;
 b=OCUq9pxWofvFRWYsvUUlXSB8j6fh3KqFo1oAGDElzb2IuGzXUv7ZqOIE8figdgnCvetSzjMG5wi7Q6B5gjAoFcyqkYuXYIWjJ2zGSpKbZKgFJH/kU0P3AoorKq1lqUI5y/eQASZzQu7/59kGOWE0zBi+tRkIqNUoU7GtjtjK8BNOlX3JnPQ290s3zHSxpwW9c8DNcM73uqGotZ7QYn+iIakq+RnhyoZhZpeNSKpd5QWyRAKNYr9VDaibGgUZVT56boMFzkPJtqnSTWS2+vV4dkIXwsNM0UX7QSM+rKFypPTILiwM+TB8Sicx1RzONzIw5mdMGTuxEEFhVsprz10erA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhoXdbLkAF6XVjr9H5g60kkDFsCQSu+3fc7Kf+s79FQ=;
 b=Du21GFIYO9QI1wtRW99vo/K0CMOLdYaRqGZFpuLMDthpvd4p3iX4xhUBY5m7bwXVvO4b+/eHX1nxpt7263iasYUwUC0j25yaDerU0lbJSUWU+pMiYfMy0h1XJlCW8VBwIMRKmh5eCoOb/+xuJr5w4talYCtxOLUkzkz5KIRH3NI=
Received: from IA1PR10MB7309.namprd10.prod.outlook.com (2603:10b6:208:3fe::13)
 by PH0PR10MB4520.namprd10.prod.outlook.com (2603:10b6:510:43::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.35; Fri, 23 May
 2025 20:03:27 +0000
Received: from IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a]) by IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a%4]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 20:03:27 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "peterz@infradead.org" <peterz@infradead.org>,
        "rostedt@goodmis.org"
	<rostedt@goodmis.org>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "bigeasy@linutronix.de" <bigeasy@linutronix.de>,
        "kprateek.nayak@amd.com"
	<kprateek.nayak@amd.com>
Subject: Re: [PATCH V4 6/6] Add API to query supported rseq cs flags
Thread-Topic: [PATCH V4 6/6] Add API to query supported rseq cs flags
Thread-Index: AQHbzBzrkmSjT3CYL0qc5IwMVL8iOLPgoziA
Date: Fri, 23 May 2025 20:03:27 +0000
Message-ID: <6FA93FD0-D4C3-427A-9C92-18BE8218F264@oracle.com>
References: <20250513214554.4160454-1-prakash.sangappa@oracle.com>
 <20250513214554.4160454-7-prakash.sangappa@oracle.com>
 <df3840a6-36ae-4429-80f2-b1f089917e2c@efficios.com>
In-Reply-To: <df3840a6-36ae-4429-80f2-b1f089917e2c@efficios.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.500.181.1.5)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR10MB7309:EE_|PH0PR10MB4520:EE_
x-ms-office365-filtering-correlation-id: 2e3471e3-9087-4920-834e-08dd9a34e205
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NWE5aFprZWFPZWRMQ0ZlQ3FZMXd6MkxacXBIR1hZSkNrQlRCY0RRWmlYT2RM?=
 =?utf-8?B?QTZTaTRVejlUMVQ5NTdQeXRxS0p4dE1XTFFaSDRFOXpsdTE3aWJjNzNMWTZY?=
 =?utf-8?B?Y2F6Q2hVNDhFcndkZFJEMGRGMnpBVXVmMHo4UklBWXNlRGtxbitvcGxnNThm?=
 =?utf-8?B?YnRiUVlLdlVXbktSYTBCbHVpbHVZdkZJSUt6SkRLaS9tK1FQVllYNiswNVJI?=
 =?utf-8?B?anVHV2lDYVp4UENzVWw0NkFocXpzSEpmNzFpQ01wdW54UVJwS0pMeFpGWmZl?=
 =?utf-8?B?ck1sYkxVMlJBZmJKZ3djR3hMa0gzOGY5ZWl6NFVrd3lSVUlnRTc1VHNJWE1L?=
 =?utf-8?B?V1JjYS92TGV5YVZHY25pamNPRU1YQ0JTdmFuZi9YRzVCOENBeVFETlVDZVBh?=
 =?utf-8?B?enJJOCtVQmdrUVRWUFJIVXB5bVJFcnZmeVVpK3Y5VWFGUDdzWTVYMHk0RnZy?=
 =?utf-8?B?TmRWMG85b09JdGZhU0d6b2hMU3ZUa0J3aWNkOGkwcGd2V1k3S1M5V0FQVUQ0?=
 =?utf-8?B?dyt1VG9SbTR3SEFiOHFRd05ka3B3SkY2QzVFYUwxSGF6YTFQUVhsNStSOHRn?=
 =?utf-8?B?aFgwN2JsNHZlYmNtU05GTm81Ty8xYnVydndqZStRVnBqQnlpazdha3l2UUhF?=
 =?utf-8?B?bFp2anFCUjdGeENMa2hYR3laRUpsTnpvRERjcUg0YkFSSnhJb0dWNlZKTFNI?=
 =?utf-8?B?Tzkvb2pKS3JTYWRpcVoyNlZlNnVhMGx4d0RhL1J0YmZrLzhMOStYalJHZjlR?=
 =?utf-8?B?L0h6L0pLN1l1dDNweEU5aFpSWmNScHFyajBsWkpBaFZjTlZvSmtmeGNLQjZX?=
 =?utf-8?B?bjBTdHdqTVFmYkJuUGxVRzJCLzR0Z214V3VXL3FrRHlHRW1YejlvRVhRYWpm?=
 =?utf-8?B?SldaM05uMVRhSC8vYjkyN2VlRTA3MmVnTXF1ZlI0YUJHb3MzUUhQRnprOHdp?=
 =?utf-8?B?NjZUQ0U0UThaZUdYMmUyWENodzhiUExEUjFhK202cWhSK1dTNmduTFpWZ2ky?=
 =?utf-8?B?YWlmaThISUp3alM3cTduVjhqUkZ5V2kvRlJHR3FpbXplSWpZY1RzdWgrTmZu?=
 =?utf-8?B?bFU2UnFpaG5ZZnB6Nk9kSG41V2NXaytYRTR0eG1VNnhMdjZ0elFIdi9JL3I2?=
 =?utf-8?B?NjUxd1RFc0ZMVm9vK2VRVndzUHJlTWt4RTNMOFAwM2dMV0FTMGNoNlU3QmRt?=
 =?utf-8?B?anZSSmxIc3BXNVpoTUx6M3h0eVpLWXRKL0VPTk1waXNvUkVFYkdmYW1WSXc2?=
 =?utf-8?B?M3g1RE1mMkVjOStldkNENGNLMmFtYkZjVnIwZ2RQVzFhYmNpQkFuOXp1dDFL?=
 =?utf-8?B?U1RURUJBUmk4ZldQNjZWSjluSmFGK2FlOGE4bjFKWXp6OWlaa3ZWUDZHQ01C?=
 =?utf-8?B?cHdQVXpwSXhQcTk0RkNzNnV6Tk9tK2ZnNzE4MHljdGpKUEVMY1Q0QnBvclFj?=
 =?utf-8?B?bkh0SWk1ODdYeDVoSjdWZFpLcmNYMXBpMVF0REV4ZklnMVpTSWpjbVRqd3Jp?=
 =?utf-8?B?NTZWbHc3NGhHMUROc05ueTc2c0RIZXZadC9pbTBHUWtwU0kvaXNubzJrS2s5?=
 =?utf-8?B?R3lQQlNXelI5TjR2WDhPRkYvb0dOUTJ1aXhpYmNVNVRUMEE0V25BaVZsT0Rj?=
 =?utf-8?B?VlE1Z0JTUmtPLzVzQ2Jqd2pxU0xRQzlNQXZ3UzNMalpxNFZQVXAwVjl2b3ZR?=
 =?utf-8?B?eTMvSEIyOFVrZ2hlNC9sOWFTc0RDOW1hQzlLNmg5ZXJ4RldzSFQzeTNqclRZ?=
 =?utf-8?B?MjlIU29hNHU5QmY0Mk9aMUtRNndUUzVEdUtjMkdiQWNNaEVXeVcycjdXcHpH?=
 =?utf-8?B?QlhPTklvYmVuSUJZdG9nWVlROGRvbkhSMk44TE9mQitGZmVRanR2enlsMXAz?=
 =?utf-8?B?ZFJPUk12Q3Rwc0VLMHZ4NVUwQkV0QjM0ejF3TkF5ZEp5RHhJb3o4TUhNY2tY?=
 =?utf-8?Q?rg+2bhBlKiw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR10MB7309.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K1lBRFdUV3JUeEorWmx2MnNReTJTMS9PWHlabEdUamZLUTFpV0NjODk3RU40?=
 =?utf-8?B?TjhuSmJoZVZqbmtIMDkzbDN0YWJxM2phaFFsZkZQWUdyRDNQZjU1bG9WZHEw?=
 =?utf-8?B?QTR4MVlKVjhSbk44dFpzekpjc0UxVHFIUmlCQTJhYjdBemZXZDBCVGM2UGZz?=
 =?utf-8?B?VHlBRUx6NSt5K296T093NDhIYndKZXhjWFZENnRPUXlXdWUzZjFSRmo1QWl3?=
 =?utf-8?B?NTM4d1JMeEo1MFo4TU56RytMSW9leFBjVFpCSlZTRTI0YkVTR0Yvck9EOUJI?=
 =?utf-8?B?ay8wS09VZTJUemdXbk8rU0F1MHJiUlhGNWR2TUVQUHh5YTNHdkZWNklpbXln?=
 =?utf-8?B?c3Y2enM4d004d2VCdXllMU9QN3Z0MU45MUZUT05UMWxzblkzb0J0TnN3bXR1?=
 =?utf-8?B?RDhWbkQ4cDI5WGJCcUFxZlZFSmdoN0phRUVEMUs3M1piMDdIUVdJZHRPaWU0?=
 =?utf-8?B?dENSckVNV3lOZDl2Z1RRaUlWbURhdG1Rc2VjSUk4TnR3WUhzVitQWWR0eEtG?=
 =?utf-8?B?WitKclNnRExmeTVNcFBtNzJaMnZranB2eEMrM2drT2pWT1dYVkFmQTVYb0lJ?=
 =?utf-8?B?bmhQWWZwTkpadWxlZ0lycllpODQ3b1B5RTdmZWVQbG04UCtQZ1hINDdaczBK?=
 =?utf-8?B?dmd2elltSThlRWVsN2dla2hCR2Q0MHFvZERmOVV2ZWx2SDdVeGxZZkNpOVd0?=
 =?utf-8?B?UE9YUVBDcUhzMVp6TThBYmxGNzBxdk93NjZQNVBMRGxNT0plbC9yVnF3ZDJ3?=
 =?utf-8?B?a2N5bitIdkRCWmtmMFlQNzZJUkp6bnR4cnlHM00wZENUMi9NN3ZRUE9yWkht?=
 =?utf-8?B?UCt2QzBwRDdTS3NpZmFjSEFyUVIwME5RSFdiZ2NhV3hIT3FkV1hXK1ZNM2pB?=
 =?utf-8?B?YTVGZ3hOVjJhWnFOOGExVEsvUlhIM1oyem1qWThKNG9hMlkzQmE3bENMK2dJ?=
 =?utf-8?B?ZE1MMEVhZHl5MnpjNjZtR2FzUmtCZXA4U092TTJ0V3lnYkN5U3VtUmNsM01m?=
 =?utf-8?B?c0tOSG0wcW42cWNPekRwRVZGUHR3WDliYlVJNXRydE9jZWxNYUk4bkFRdC9K?=
 =?utf-8?B?NWYrUzZqc2JUbWN2N2dFYlpMNU4rY1NNYW5hN08yeU5RUlBSMG14SE1tV3RD?=
 =?utf-8?B?KzhZVkQ3WGEra0Z0emt6VWRLNlVtZjNXajQ2Ykw3NE0zMUxBQ0pCaTJnU1Bt?=
 =?utf-8?B?c0VJQXp5NzdYRWUyTWkxRi85ZFQ1R0FRQUFkWFNHUFBJSWk4MmpaeFFQUkNo?=
 =?utf-8?B?RnlzLzVPWTAzSG1sdGRpUjBmUXJMTGwyeTVNU3p1T1VWSXR2QndUakdsR1JC?=
 =?utf-8?B?Q3Qray9WbGxERDJEWUlhek8rb2w1enp5NWZxVHphZExZUWo3cDJPQmsvQW1U?=
 =?utf-8?B?UFJ2QlIxaGhpeXN3dStNNGpaWi9BV0QzQWd6ZDg3ZGRKMVFpeXg3d3VVbEcr?=
 =?utf-8?B?NVZjM0t0WWYvb0l3bXhhNFpsZWNEbkhjUFdQdnlIQURPTWJnaVFXajcrak8x?=
 =?utf-8?B?OHFKY3RsRnZXUjV4Q2FjSHVZRnE5M0dnTEJDdHZnOXVPMmlCYUt3ZjhFYkU1?=
 =?utf-8?B?U2V6VVpZVkIvZllBUTBSRUwvcEc5ZFFPakxPc2ZZWWZpYkpQREdwd1NsQ1E3?=
 =?utf-8?B?ajZRT1EwRnp4WkJjbU5vMmJOUm9qQ1M2a1FCbWk4NGVGK0VDdjRyVGhRaDBu?=
 =?utf-8?B?c3h0anZRNkkwSngvRjNaZDJCV3htMlhVV3lmWWNvRlRSd2E0TGJpMzVsc0Nx?=
 =?utf-8?B?bFpEdzQ5WlAzdTdkaDUxVWlqaHFwdVpINVpLQ2owOWR4WGpCdnZNYlo4THZi?=
 =?utf-8?B?Y1dqbnZIVmFwWmFQODkwV1VybHJTYnVNL3JmQzU5VW9LOVAzdXp3R2xGVkJ3?=
 =?utf-8?B?RnpkU3JLL1ZIUk1sWWkxak1zNWNuS0ovZjZidzJ3RWhWam5tZVZMd2ZOcThX?=
 =?utf-8?B?d0RZVzlxM2YxcGRnRkwxSW5CTmFFSXZ0Vm9yNzRZNTk0Tm1sOW5wNnlpYjdM?=
 =?utf-8?B?dzRlaGRoTllZWGpMWW9QaVZyNkUvNm5QK2ZQNzlkOWxsVExXVVFMZVA0V1Bq?=
 =?utf-8?B?NWhKT3M5b3Z0UDNwOFRyNVJIQWJCWm1BZWhFc2ttbWhiczNkdFhDK0E0RGVS?=
 =?utf-8?B?ZEQ2dmFJTUpvQjZSSjNNQjBwQXlMeTV0cHYrZjF2R2pLWHNIMmx3cWtER1Bz?=
 =?utf-8?Q?bTj83bO4iCwqRBMPmkwrhv8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <61C251A7936C5C43B024B3FEB462E27F@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5K+qvtLNEbWpgUPmUi//3SPuBWGU3nlDxw/j3vdpLvzIKN6hNocbFAyRSAuW0yPdTNMFHyq+iRr1kiyJje83E2o272ouzG0sL0Bac5yC6/z/7oBGGbLyZktz8VgkEVN17947eAaP8K7B49zvS7SoPoxrlw3168PVQ5M1VDH4bzxawELF3X8BZn09V7qKHSqyRIZc6Dbt5vrN/8Q6QnpmUIHXPeVKii+Lp45pQSBlyvhxFXf+hTart8Yz6WC1iVFOZwZvBVHsUIH+dAXoOVTGSiNRlymcqAcZiYqTnKrTD8lq6yvR0W99+xo9+OrgXzjfZG7vAUs+U6eSDcoLWWCvoZyKI9gQ1ceuONDBvG+Iv+cMcCtmEvc8s9D1l3FI/7WcamKJ7IHosWCvMzEPm+0Uqfa9XSoQ+yE8XGUvfEEIHSZbZ8PyZrpCDNO4RPHsFh9tKAVd4M6b/DzC69EuV8t9sNS4Y5vSVyRpS0n9kl3f/ydU163PVBayElJxy44mD3+vMxxh4Xrk67z9BOEV1/LIWWW56AmoGgb4GCImdn4DnRVW2u+FR6+Q0Np/a6F/yANmn9M0jX2O/DrjBjqoHnqYYYHPYz9/7yG0jmWFsUQb4iI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR10MB7309.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e3471e3-9087-4920-834e-08dd9a34e205
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2025 20:03:27.6940
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JsPFrhEDz9bLVU3L7BtsfAC0GJ5u7sdkDAPY2X0iD/x8VBeQH+XDY2czfLbVHNboRxGt9Ebns0kjmbT0SKE4c2bJ7D+mmWU64il5Hcea9gw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4520
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505230184
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE4NCBTYWx0ZWRfXxDKqPg+qecCw WlyR5dlyO/47aqXtMSHLeYUQMi0O1vFSCt0+Q+vPSUHpflaDeHfUSDlotbLWGWUkl+HCSBelnVp mNdRjSuCD0i2jg58Yn2X+CAub5O3q0u0GsCQourNCgwilwd2g+Vuf9YfYVeX/gV4kvWFM4H5tOJ
 os4OI7LgivpLU6Jl8jR4aHCW8LjpPiDvhjTJVf6diJtY0+mdSuhcE2H5w41gwVjrj0vzcm80KGn 88LUUcLj8lpyH+8vQmk5sifSoPY8DlalvzwvpYL3rURzAiabYeZOHnNkrSrwziwu/wOHx6bqnPS G4sEjHydC4CoJtSfPc5ir2Xx4mfWks0uH6m1fUsQdPed+3n9FBix/UBqqh1uACuID5RxSG2mr+x
 ztoMGUwzi9KA9ioAwRIthHej3MaTgcJQI8vmPZy2BQGRY9OvOfwVrRwyg4qO+0P1ObjMBVg+
X-Proofpoint-ORIG-GUID: XhsTYCQ-4skCWBmRSoglH8FVAb2Gcbu9
X-Authority-Analysis: v=2.4 cv=VMvdn8PX c=1 sm=1 tr=0 ts=6830d493 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=7d_E57ReAAAA:8 a=yPCof4ZbAAAA:8 a=CypzESuuXAlbVZQyAksA:9 a=QEXdDO2ut3YA:10 a=jhqOcbufqs7Y1TYCrUUU:22 cc=ntf awl=host:13206
X-Proofpoint-GUID: XhsTYCQ-4skCWBmRSoglH8FVAb2Gcbu9

DQoNCj4gT24gTWF5IDIzLCAyMDI1LCBhdCAxMjo1N+KAr1BNLCBNYXRoaWV1IERlc25veWVycyA8
bWF0aGlldS5kZXNub3llcnNAZWZmaWNpb3MuY29tPiB3cm90ZToNCj4gDQo+IE9uIDIwMjUtMDUt
MTMgMTc6NDUsIFByYWthc2ggU2FuZ2FwcGEgd3JvdGU6DQo+PiBGb3IgdGhlIEFQSSwgYWRkIGEg
bmV3IGZsYWcgdG8gc3lzX3JzZXEgJ2ZsYWdzJyBhcmd1bWVudCBjYWxsZWQNCj4+IFJTRVFfRkxB
R19RVUVSWV9DU19GTEFHUy4NCj4+IFdoZW4gdGhpcyBmbGFnIGlzIHBhc3NlZCBpdCByZXR1cm5z
IGEgYml0IG1hc2sgb2YgYWxsIHRoZSBzdXBwb3J0ZWQNCj4+IHJzZXEgY3MgZmxhZ3MgaW4gdGhl
IHVzZXIgcHJvdmlkZWQgcnNlcSBzdHJ1Y3QncyAnZmxhZ3MnIG1lbWJlci4NCj4+IFN1Z2dlc3Rl
ZC1ieTogTWF0aGlldSBEZXNub3llcnMgPG1hdGhpZXUuZGVzbm95ZXJzQGVmZmljaW9zLmNvbT4N
Cj4+IFNpZ25lZC1vZmYtYnk6IFByYWthc2ggU2FuZ2FwcGEgPHByYWthc2guc2FuZ2FwcGFAb3Jh
Y2xlLmNvbT4NCj4+IC0tLQ0KPj4gIGluY2x1ZGUvdWFwaS9saW51eC9yc2VxLmggfCAgMSArDQo+
PiAga2VybmVsL3JzZXEuYyAgICAgICAgICAgICB8IDE3ICsrKysrKysrKysrKysrKysrDQo+PiAg
MiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspDQo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS91YXBpL2xpbnV4L3JzZXEuaCBiL2luY2x1ZGUvdWFwaS9saW51eC9yc2VxLmgNCj4+IGluZGV4
IDAxNTUzNGYwNjRhZi4uNDRiYWVhOWRkMTBhIDEwMDY0NA0KPj4gLS0tIGEvaW5jbHVkZS91YXBp
L2xpbnV4L3JzZXEuaA0KPj4gKysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L3JzZXEuaA0KPj4gQEAg
LTIwLDYgKzIwLDcgQEAgZW51bSByc2VxX2NwdV9pZF9zdGF0ZSB7DQo+PiAgICBlbnVtIHJzZXFf
ZmxhZ3Mgew0KPj4gICBSU0VRX0ZMQUdfVU5SRUdJU1RFUiA9ICgxIDw8IDApLA0KPj4gKyBSU0VR
X0ZMQUdfUVVFUllfQ1NfRkxBR1MgPSAoMSA8PCAxKSwNCj4+ICB9Ow0KPj4gICAgZW51bSByc2Vx
X2NzX2ZsYWdzX2JpdCB7DQo+PiBkaWZmIC0tZ2l0IGEva2VybmVsL3JzZXEuYyBiL2tlcm5lbC9y
c2VxLmMNCj4+IGluZGV4IGM0YmM1MmY4YmE5Yy4uOTk3ZjdjYTcyMmNhIDEwMDY0NA0KPj4gLS0t
IGEva2VybmVsL3JzZXEuYw0KPj4gKysrIGIva2VybmVsL3JzZXEuYw0KPj4gQEAgLTU3Niw2ICs1
NzYsMjMgQEAgU1lTQ0FMTF9ERUZJTkU0KHJzZXEsIHN0cnVjdCByc2VxIF9fdXNlciAqLCByc2Vx
LCB1MzIsIHJzZXFfbGVuLA0KPj4gICByZXR1cm4gMDsNCj4+ICAgfQ0KPj4gICsgLyoNCj4+ICsg
KiByZXR1cm4gc3VwcG9ydGVkIHJzZXFfY3MgZmxhZ3MNCj4+ICsgKiBJdCBpcyBhbiBvciBvZiBh
bGwgdGhlIHJzZXFfY3NfZmxhZ3M7DQo+PiArICovDQo+PiArIGlmIChmbGFncyAmIFJTRVFfRkxB
R19RVUVSWV9DU19GTEFHUykgew0KPj4gKyB1MzIgcnNlcV9jc2ZsYWdzID0gUlNFUV9DU19GTEFH
X05PX1JFU1RBUlRfT05fUFJFRU1QVCB8DQo+PiArICAgUlNFUV9DU19GTEFHX05PX1JFU1RBUlRf
T05fU0lHTkFMICB8DQo+PiArICAgUlNFUV9DU19GTEFHX05PX1JFU1RBUlRfT05fTUlHUkFURSB8
DQo+IA0KPiBUaG9zZSAzIGZsYWdzIChhYm92ZSkgYXJlIGFscmVhZHkgb3InZCBieSBSU0VRX0NT
X05PX1JFU1RBUlRfRkxBR1MsDQo+IGFuZCB0aGV5IGFyZSBhbGwgZGVwcmVjYXRlZC4gU2VlIHJz
ZXFfd2Fybl9mbGFncygpLg0KPiANCj4gU28gSSB3b3VsZCBub3QgcmV0dXJuIHRoZW0gd2l0aGlu
IHRoZSBzZXQgb2Ygc3VwcG9ydGVkDQo+IHJzZXEgZmxhZ3MuDQoNCldJbGwgcmVtb3ZlIHRob3Nl
IGZyb20gdGhlIHN1cHBvcnRlZCBmbGFncy4NCg0KVGhhbmtzIA0KLVByYWthc2guDQoNCj4gDQo+
IFRoYW5rcywNCj4gDQo+IE1hdGhpZXUNCj4gDQo+IA0KPiANCj4+ICsgICBSU0VRX0NTX0ZMQUdf
REVMQVlfUkVTQ0hFRCB8DQo+PiArICAgUlNFUV9DU19GTEFHX1JFU0NIRURVTEVEOw0KPj4gKyBp
ZiAoIXJzZXEpDQo+PiArIHJldHVybiAtRUlOVkFMOw0KPj4gKyBpZiAoY29weV90b191c2VyKCZy
c2VxLT5mbGFncywgJnJzZXFfY3NmbGFncywgc2l6ZW9mKHUzMikpKQ0KPj4gKyByZXR1cm4gLUVG
QVVMVDsNCj4+ICsgcmV0dXJuIDA7DQo+PiArIH0NCj4+ICsNCj4+ICAgaWYgKHVubGlrZWx5KGZs
YWdzKSkNCj4+ICAgcmV0dXJuIC1FSU5WQUw7DQo+PiAgDQo+IA0KPiANCj4gLS0gDQo+IE1hdGhp
ZXUgRGVzbm95ZXJzDQo+IEVmZmljaU9TIEluYy4NCj4gaHR0cHM6Ly93d3cuZWZmaWNpb3MuY29t
DQoNCg==
