Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691EB25D52A
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747774889; cv=fail; b=rtm6pHwZgUmAv9guxDdoeoqc6DQ0bbRPITgEmztSQ3FUcAm2csaEqwlnrEkukltyWtWNCIKY9EQJ3s9WNzkt3EvdFsrzxdsQ6W06jUopQoLuuhAC+j+H/H9m1Eyd4qeLQ3hCeAgkj6X4Dw40TB4Ht6KLMVUI3ErbF/ZfipgETEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747774889; c=relaxed/simple;
	bh=7aQKxsX21qFCdRq2QzFmnkxJ5I4MTlYs7tUpoGCGdr4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LyKVBaXHtEsVMoFAbkmYbeYZOrGaqnV1IDzCqdElXhOZaGs/MA8R/XUybWg/2iyAtjvIJWMU/5UdD7633gNDNXdNshQaa8YzGFLizH9ex08mVweL2IZJjAAuK1qeL1GUDWk/am8WiWXJFC847uXks39BH+Smi7NZkdtL+fB7x/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eVlNIEo8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wML6A1JL; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eVlNIEo8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wML6A1JL"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KKCII1003909;
	Tue, 20 May 2025 21:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=7aQKxsX21qFCdRq2QzFmnkxJ5I4MTlYs7tUpoGCGdr4=; b=
	eVlNIEo8tBAQWgMzyQl18W0RyJhs+keZC8guDgag55TDL9Lbc0TJwTBLctc054nd
	A2WyREBgvsoB6J/cSbkbM6q9Dz8uVT59WSF3m/rwZJVURd31IF6d1FsHPQ07ckrY
	wSuPD/OImHjppoQ6bK/cDpsXe0LIBXPNE05Wb9YPccDvVEqyxbaxP7BowovknsfJ
	FwgGQrPXj1viVEOEHYbYMG2XzAlj6exsTxzIJZziWJOprPQVlhYCE11V9onLoQhl
	Y579/uvaiIaIw+MqqA7kiRcurXnoypS9PpueUSQefsq35NANVEXSOdHdiUwc9odQ
	8OSlsViwEx6fJNGc1j0Dfw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46s0jkg4v1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 May 2025 21:01:08 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54KJqwrd023815;
	Tue, 20 May 2025 21:01:08 GMT
Received: from cy4pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11010057.outbound.protection.outlook.com [40.93.198.57])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46rwekj3a4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 May 2025 21:01:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ddy8CffYDQj18lh0XFpXYlwLy+7PRdhUNNAYjiEPepNUaRGgXGdQA7sAPTBvYSY9SOZ7GzuOtQmLK1wwL5Hma80LTnt0Fz/exkJD/Pb8bhIOlATzlWzabFKIUg5Fu+jFXfmVU2MPZsabYws6Ejz76q9/DJ/NoJsE2d0u/8yDVAn2Idjud39BUybPjng7iMP0RnMngsN5SLybI8MEmDCQTJuMedpboqMIP9xMM4OYD+GOiukQJCfQOdZOCx/mD4mPb5r5CO4hxsM5ZPsHhgNXFKyY+mKSuEkQuM5nEH4JOo9ADTSr1folbFGBsANsdWwVu7cW9Z4Cc1DQ8K2PIfIxKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7aQKxsX21qFCdRq2QzFmnkxJ5I4MTlYs7tUpoGCGdr4=;
 b=FaAXvDU72aLCpqWvBelv2FJtVakINb6BNMaFezh3Cj7lNnlyTlMEB+qNhRSyFeVsVv4ehR33A3PJIOiPAzx/Mna+OALsWFCTjWpVX7eSB6JIHbg8ZFf1pff+WbW6hJY3fyWZn3rqxhzw2c8tbodq84bnpenJ7ElmspUdyc2lqPrwIs8xC8uBlDyFCo5M2t0mvN5S+sXc9o4H5p+831X2nCNXzGVqtcGuUVCEANEGQt3vgoul9091IcbxhTktlD+y8iWV1EH411hrVxKGqwgB7LJDYZGU78BmLcQFVvhZfSKIWhWkW/kSs2Ej9s3+QgHkS048E/6QLXkrPKL/zJovmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7aQKxsX21qFCdRq2QzFmnkxJ5I4MTlYs7tUpoGCGdr4=;
 b=wML6A1JL2GOzc0SEWg8A9k8XFB54NUEyDtvD5bWAO6ONkn8tpGZmYBtkYRslCBKU1/FeEv6TIWnqjS17rwNmPy1dER/VEmVxkRtOcqb4Z3ORqWGRhPNNIZK1Xa03vB1g6Svt+fh1vcYJRBWEiQ6qzU6fkhM6XH08bT7NeiwfNbk=
Received: from IA1PR10MB7309.namprd10.prod.outlook.com (2603:10b6:208:3fe::13)
 by IA4PR10MB8709.namprd10.prod.outlook.com (2603:10b6:208:56d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Tue, 20 May
 2025 21:01:04 +0000
Received: from IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a]) by IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a%4]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 21:01:03 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: Prakash Sangappa <prakash.sangappa@oracle.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "peterz@infradead.org" <peterz@infradead.org>,
        "rostedt@goodmis.org"
	<rostedt@goodmis.org>,
        "mathieu.desnoyers@efficios.com"
	<mathieu.desnoyers@efficios.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "bigeasy@linutronix.de" <bigeasy@linutronix.de>,
        "kprateek.nayak@amd.com"
	<kprateek.nayak@amd.com>
Subject: Re: [PATCH V4 0/6] Scheduler time slice extension
Thread-Topic: [PATCH V4 0/6] Scheduler time slice extension
Thread-Index: AQHbycpL7RImi2NyjUaDPPyyeRtlcA==
Date: Tue, 20 May 2025 21:01:03 +0000
Message-ID: <1AC8E96A-6046-450A-94AB-BC1A61F77A86@oracle.com>
References: <20250513214554.4160454-1-prakash.sangappa@oracle.com>
In-Reply-To: <20250513214554.4160454-1-prakash.sangappa@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.500.181.1.5)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR10MB7309:EE_|IA4PR10MB8709:EE_
x-ms-office365-filtering-correlation-id: 0232f4fb-f40c-475f-5f18-08dd97e16e78
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TC9yelFNeWZWTTN2WVRDakNhZnJxZENQL2drZU54UGxpTktrUUlranBQSFhx?=
 =?utf-8?B?YTE0TlBFYUlkZXJjblh1bSsrU1Q5Q0grNmJId1FCQXFwVlpyUVhxS1RqY3Rm?=
 =?utf-8?B?cWRRcHlBTGhFeVd5aXBMT2t3RWE5VmZTSlloN3pTZEVCL2VTcm5MZjhmTVBk?=
 =?utf-8?B?SkoweVEvNStjZ3h2eFVESC84Q3lFMFZ6UWFVTjlGN0ZrejhkcE9WRHIyelBP?=
 =?utf-8?B?NCs2TFRNRldlL1h6bXBrVmx4bmkvM0Q5a3RTTjhHdy81ZERNZnpDM0xGYUc5?=
 =?utf-8?B?YVpjVnJNY3BWZkhjaVdZU20rQVRORXo3OS9QL3pka0dWTHNJTm9udnUvUndj?=
 =?utf-8?B?ajd2eTdEbGx1cmVXR1NVQ29mSWdnQThUWk9Xd2VHdUdZR1JXb29vbWVaS2or?=
 =?utf-8?B?M1hTT0s3Y1laWVBzeDRQbHN0SEpxc3p2emYvM2FXUkxhSmdBUldrbWo5UHdR?=
 =?utf-8?B?cUt6dHFIUjVYSmJTdUREcW1iY2FncE5qVlZGcXoyc29XL09qZVRkenF6NGhi?=
 =?utf-8?B?aHVjOGV1QWpNY2hiZzg5WUtaMkdUVkpSb3JYM1pkRkNpRUlxR1lWbzAxUjU0?=
 =?utf-8?B?Q0JLN3V2WXdLM2p0Mnh3Rjc1V0hudklmM2liRTdNVXZaY1h1aVFDZ0o4LzFN?=
 =?utf-8?B?Y2tkY0RZVlp5V05ZSDdET08rOEY4T0NlQ1phTEF3bzlrRE1HVVpFb3lROUZa?=
 =?utf-8?B?Tml6N3VHMEIzRDQ5cXdjNWRpVUFYbll6ME1kMTNZYWgvR2tLWDVwY1R5M0F3?=
 =?utf-8?B?T20zZm5KcmxLL0pPMUZpN0Z1ajFTdy9Ec2pRUkZPTWs0NkRPdElmZlFhU0pH?=
 =?utf-8?B?dnFDMVpTYnhEcGFQZ1JYVXlvNW41MWliWVhsc3pCWGNTSDhCVm1PWHdRMVJh?=
 =?utf-8?B?YTk0d2NKcGYrcTk2VndmR3ZFUVZMMVF6Z0xuMFhmNk9hcXF4aWdobEpwZjkx?=
 =?utf-8?B?UUZlY2tFTytJYlpnRVNoU3diaWszSHpiVVlKek5aTTZyRFgxWVBqRjUwNUlE?=
 =?utf-8?B?YVo3QXVZUEZ0K0Q4NllOVnlqOWVaaXZkdWYyT0NxOWtlQzJHbDluVDVkVlFl?=
 =?utf-8?B?eTV3Qm01K0o3dFdjMENRcFZ2SzJuZWpzYjgrckFGM3FCME1YZ2dMWUhQNmRP?=
 =?utf-8?B?UnRsOHk1VU8vTXdxam10YThjTm1GQ3orSGJVUFE1TmRvSk5jWmxJbVhQSERv?=
 =?utf-8?B?ZkxvMEpWQUpldzNEL0Y1TFl5Uzd5UTlqUlRvOWtaZGUrY2E4cHl6cWovTzNv?=
 =?utf-8?B?NXA0OGVraVdUU2N0SWU4L0xHZVVldlhEaDlqRExpV1dqUlVVV05abUE4M0NV?=
 =?utf-8?B?dmhuYTlYektqajFTVStzbkF2cDYwVnpOYXFBYko4SDBIZkd2Y0d1ZWlvUmxJ?=
 =?utf-8?B?WG1MVlpTckZtb2hvQzlGb3RmeUZwdkU0Vld5RTJaTStMZGIraElNaDAvcWJS?=
 =?utf-8?B?ZFU4cjUzSldsK2VsT3NSNzhKaEl5RkQ1OFhMRVJCZjZLaTIwZndLQUhaQUV4?=
 =?utf-8?B?a3pCUUpjYTNicCtrMG12VEJmaWhQeU9kTEN4TUFaTEQzNXd3REJ5N1ljTGx1?=
 =?utf-8?B?TytFU2xmY0pMUFcwYnFLYXViT1pscHFmSCt4NEdJaFF0WHdNVVczMlU2dk9X?=
 =?utf-8?B?MVpFaGRVSlBBaWc0S1FoZDg2TU54TmVHOUo5bDBTekxNdDJlVVFybjl1WThN?=
 =?utf-8?B?YjFzMkxaSCttbHprZlNpRlRDcnA5cDc5U3p3TE9rUjYyeFRJd3ZjSFBQcUJs?=
 =?utf-8?B?RmlMeHgwWk1lT1N3Ym52L1FiT0pzWENsLy80dkpidDZqSWNPTWJvK1Z6UTNy?=
 =?utf-8?B?MFhGZFhKWk8yNnYyMGlGMVBPcEl6b1FtUy9HMFluMDZlVXhveW16YVg1cVJR?=
 =?utf-8?B?aUgzanZoU2Q4V0FidklPQnFwTWtTcktPbzJRTnNobkdQS1kzK3p2VlJNT0J1?=
 =?utf-8?Q?cEGLkX52fZDs6yYoROoWAdoOe5AOMJqZ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR10MB7309.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Rld6N3dEWkJqVmVMNVBIL3M0QlplblM3aGJtT3BhTUxUbllKZHlubnFUQktM?=
 =?utf-8?B?c283cElGcEdreklnSys0dlU4TkhkSUpxWVdiVXhUcVV6bm5YWDhQODJnakpD?=
 =?utf-8?B?WjVvVmhLa2dXejB5Rkl3MlBQYVdpMHlkcVNiajYzaHVuWHlta09IdU14OGhJ?=
 =?utf-8?B?TWhiM0FCck4rejNTTHk1TUNZbFllVWhyTHVjOUx1bER5NmRIOXNNM3ZGNmhh?=
 =?utf-8?B?MnFBNjZUQlFNNkxXU2IyRjZpRTFQTWNRRkhEVEhualBXSDVkL1Bjbm9TaldR?=
 =?utf-8?B?TXFjK3Q0Ym11RTBEUGt5dDdmbnYvMDdvS2JZVlJ3emk0ZVUvYkJzNnIweHlh?=
 =?utf-8?B?OWwxTC92c1l6L3BvRnlWTnROd3Z2N25jSE4vWWtNdWhDTzBxeE5ia3ZqOFBO?=
 =?utf-8?B?Zk1zMWg0bC95RGQ0RnEyMXhON3owSkM2bjhENEdRUFdsdTFmN25zcnY5SmNL?=
 =?utf-8?B?U3hpY0JVNmNmaUxGQTBGTXF1cWU2bmRCZWR2Y211c2dHanM1aGw3TWJodmRR?=
 =?utf-8?B?Q0YycGlwSFcvYzZ0SU9TK0M2eXR1TEdwQmltQjNDUDFFK2kyWnVIYVhVNldQ?=
 =?utf-8?B?cU4zY0JUekZZTWhqaytMcWhIZHJuV0wwazRNR2dKaXRMZWNzUEQ4bW1EdVEy?=
 =?utf-8?B?ZG1qc3BlcHRuRWtOd1FYeThvTEs2UFpyQjA5SGQ0VjZySDFFV2VUcmlzTFpz?=
 =?utf-8?B?cFVjRnJFUjJtZmpoQXNRTUdWdHZxZTIrVWNwLzVaLzJtajhUajg2cnRKSFB5?=
 =?utf-8?B?T0RkQXROZCtTNXVDRkZsQ2EzQ0h5RXhidFdEMWdXd2dTQjdHNnFZdW5udGJn?=
 =?utf-8?B?Nm5tRWNZSm9MRzViWllNSEYxc3JKTmZ4UmRlZGVyUm05NVZmdFBtU1FzdEkw?=
 =?utf-8?B?UnplYjFyelVnTWZsbVZtbWxJcG1UVDMwbWViRnBNbTJkekZXa3dyL0gvNDVO?=
 =?utf-8?B?UG94TmxHNnM5NUJ6Y0EySlBUYk1BSmNHVm9WbHk3bW92TXFpdkxCeG9hK0c4?=
 =?utf-8?B?ZmYxWndqbEVmbzNJTUFIQi9QbXpyU2hqTjg2cWJwOFZsYmRkQTU0czMwa1lN?=
 =?utf-8?B?c2ZkbDZ1Q3Z6OStGSjBsdlhhdk9LMFM4dXh0ZFc4QzErVUE3QU1iWGtmMEZW?=
 =?utf-8?B?MGJZUjhoRWZrUW11R1kyWngzZWNReDZza3FPc2RSOVZSS0I0QmRnUUUwU2Mx?=
 =?utf-8?B?KzNMWGhZeG5FK2tGVGpiQUs4Q3hFMU1CZ3lrSUZ3SDc4cE1MamQvWFJ3VVB5?=
 =?utf-8?B?Q3VnMGtLSFZ2dzJFRStOajVGWGoyWWxFSDRVOSs1ZkV1UTBrd0FlYjZYTFkx?=
 =?utf-8?B?cFNyS3FJRGNnL1pLQ3lLTnhWc2NiSzh1SDBrcitRZFdCMjVyMlJMd3ZOY2k2?=
 =?utf-8?B?ZHBoai9hV0kybU1HWldBNVVJTU15NmNBa0xaQ2Y2bSthbS9ZcUF6TjdHRGk1?=
 =?utf-8?B?WTZoZnBnbGV3K2hqVHB1WmNHZzFUcjVVZjRrWVZiNDlVNE1jcFpMS2NBTTYw?=
 =?utf-8?B?MEhOM3dOUkZsdlZjQlZSYVllNytjMDlPcVhwMkZZVXNNb1J1bkxuUUxkV2Rl?=
 =?utf-8?B?YVVLdmN0QllLNktMWjFTZUw1Z0xTblZuQ1B4UVZvSlV1cTE3L2NiZGMzc2Fa?=
 =?utf-8?B?QnNUZEtuSGx0RXVGaUhGR3p5d1NhMGVuZkNGNWhJYkVuT2dQTFNRcXBhQjRy?=
 =?utf-8?B?NVRXN2tVUXp4YjVZUWxXSnFML0NGZ0JlMHpwcTZHUmdVOEFkSHU3a29adXdB?=
 =?utf-8?B?Qk9EdlUwWlZkV0ZPcXRUdDd0VnNmdVM3cHVFVU5LRU1BSWwwdDU2dTZFSW0r?=
 =?utf-8?B?RnNXUW9PdG01OTVycjBPMW02RTZRTGdvbU41ZkhQQkNpckdEU3RKdEhEdVBM?=
 =?utf-8?B?bitvY2c3M2QvWEtVTlJQczBIQ2dVVWVIU0E2bmg1dnpNNXEvL0lLY0VIeDVH?=
 =?utf-8?B?clZiZmcxZmV1OTlUUWgzMU83TTZTamtYZmlGakRBRkdaVjV0OUlZdTgyWFFJ?=
 =?utf-8?B?bGpLUHk2YjI4OHFJSWQ0bFVqZ1VyTEN5L3VqdGRoZ3QrL2cvQUVRZ0E4cXBD?=
 =?utf-8?B?Nm9ya1FIbWF1N0x2Sk1HSklqRjc1T1AvTXRIYXFpWG5wek14VDRIcWFLRVI5?=
 =?utf-8?B?NThRY2JGSFY3Sk9TS1ErUTlUc3lkZktMMkV2VjQ3QlBDZDJ6K0FTd2RoYkF2?=
 =?utf-8?Q?E6jVvUKN4jHF7j6jIb+2KaE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B657B05C5964747B968663F6A9B79F9@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xLbtMfRiezW44hbqzvWJx9JCJqEc/KyP+nQXYb3tRZ9U1BMZW6CxZf/QAhnxn6zaDEeY3x+81ubKil/Hwv2JDEFLM8QALATLfDpQPer8ktJCEdQQ7cqyALHYD2QI2iXaF9OiJw+WHUow29ILOGB9wQWuFR0FKmID1kuub8qxMSd0B2A2hn4goeP0XnGfwJh0OUQbSiTXTB9qWH3T47sPwWXHObs5AGT2A5w4IfFFYSJPv/D9c+0WHiTlevXSguqbeKMj3F1Tm6vPFS683Zd4mE9uKUT9Ul0J+TLy4k9ibi60Guz8FjhZs/OcPFWeT/phQEAX9vXwhjCKn/qENry/7PLH04oljdQNWXhMuKDDU1Y9fdVj43rZFFzPlwju6Tlbe+jyKEVmv8arLRReJcVrNjIv/zPO0PnqAqFWxe0hB6jSi7bv65bS7o/5K9YiVZMGYJjEPHtILYHVFNg5qxSCt7JLDIu16p7NpkK2Vd203kauEVoUrKgVtOXtGwKV0BW4ad4kMp52WVr44jN59SBcMpWOZnydC00liaXeRRFaDvKF0AQt3iTNygg+7QoP6aA8LiXehbeVpflaQKFkG3rXAmw80/UzM5zV+N6Sr/MuC9k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR10MB7309.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0232f4fb-f40c-475f-5f18-08dd97e16e78
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 21:01:03.2672
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qs9wJT4Fo3Cekk31bgpx4nUZzh9bdoy4ySH2OCSrc2dAAf8jdfhq07mAWSOCq+JLGZm8zqZ/O1IWnhOZzhT+gPOAdP27sTWK5BbUPRBCzkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8709
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505200171
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE2OCBTYWx0ZWRfXzg/hWlIKUdex ba1Gtlc2WLPttmLv6XdSB/onjNlLU2xJhNbi43ikg5fjGQ4R8xMq/A3mQDUl9sOlzaiv72tPHvC 36ia0ACdWwO9ftNta1p+Lug0jGg0Fsf6X90osG7lerKuc1xz61Zo1R8ABQYv3MqOzNPGPc/Z8fb
 gv7JGeL0lIM4mmrYMTiIYDBeAQRQVx9fWB0mQuamBft4diRK+Q8YSLdW0JoghLjVSzapcGFti3w Lkcbi0mIxU9LjUIlLYxAknCb/ZVadErdpZ0wuLgMr/ngXs4lhqN2LphQ9zUfBKB+sLEkM7ClpE0 e8S3kzAkYXWHWLM423SlyapkPe4is0sPXzY5/DFWozmRrY03upiw4SXsu3wJd53Z/9Xyoo4oBX8
 kzDW1jjRUX46Ly9evhHQd/C8Boev3AcWurFxkf5txvc0ftNBkunBwybzOuCUul47sP4gEMdn
X-Proofpoint-ORIG-GUID: CCWVsvGpj0F8BlAISmYw3kRgvq3VLSrZ
X-Authority-Analysis: v=2.4 cv=IKkCChvG c=1 sm=1 tr=0 ts=682ced94 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=meVymXHHAAAA:8 a=WsHKUha7AAAA:8 a=tjuhyLeqsmBb8-qYR4cA:9 a=QEXdDO2ut3YA:10 a=2JgSa4NbpEOStq-L5dxp:22 a=H4LAKuo8djmI0KOkngUh:22
X-Proofpoint-GUID: CCWVsvGpj0F8BlAISmYw3kRgvq3VLSrZ

DQoNCj4gT24gTWF5IDEzLCAyMDI1LCBhdCAyOjQ14oCvUE0sIFByYWthc2ggU2FuZ2FwcGEgPHBy
YWthc2guc2FuZ2FwcGFAb3JhY2xlLmNvbT4gd3JvdGU6DQo+IA0KPiBBIHVzZXIgdGhyZWFkIGNh
biBnZXQgcHJlZW1wdGVkIGluIHRoZSBtaWRkbGUgb2YgZXhlY3V0aW5nIGEgY3JpdGljYWwNCj4g
c2VjdGlvbiBpbiB1c2VyIHNwYWNlIHdoaWxlIGhvbGRpbmcgbG9ja3MsIHdoaWNoIGNhbiBoYXZl
IHVuZGVzaXJhYmxlIGFmZmVjdA0KPiBvbiBwZXJmb3JtYW5jZS4gSGF2aW5nIGEgd2F5IGZvciB0
aGUgdGhyZWFkIHRvIHJlcXVlc3QgYWRkaXRpb25hbCBleGVjdXRpb24NCj4gdGltZSBvbiBjcHUs
IHNvIHRoYXQgaXQgY2FuIGNvbXBsZXRlIHRoZSBjcml0aWNhbCBzZWN0aW9uIHdpbGwgYmUgdXNl
ZnVsIGluDQo+IHN1Y2ggc2NlbmFyaW8uIFRoZSByZXF1ZXN0IGNhbiBiZSBtYWRlIGJ5IHNldHRp
bmcgYSBiaXQgaW4gbWFwcGVkIG1lbW9yeSwNCj4gc3VjaCB0aGF0IHRoZSBrZXJuZWwgY2FuIGFs
c28gYWNjZXNzIHRvIGNoZWNrIGFuZCBncmFudCBleHRyYSBleGVjdXRpb24gdGltZQ0KPiBvbiB0
aGUgY3B1LiANCj4gDQo+IFRoZXJlIGhhdmUgYmVlbiBjb3VwbGUgb2YgcHJvcG9zYWxzWzFdWzJd
IGZvciBzdWNoIGEgZmVhdHVyZSwgd2hpY2ggYXR0ZW1wdA0KPiB0byBhZGRyZXNzIHRoZSBhYm92
ZSBzY2VuYXJpbyBieSBncmFudGluZyBvbmUgZXh0cmEgdGljayBvZiBleGVjdXRpb24gdGltZS4N
Cj4gSW4gcGF0Y2ggdGhyZWFkIFsxXSBwb3N0ZWQgYnkgU3RldmVuIFJvc3RlZHQsIHRoZXJlIGlz
IGFtcGxlIGRpc2N1c3Npb24gYWJvdXQNCj4gbmVlZCBmb3IgdGhpcyBmZWF0dXJlLg0KPiANCj4g
SG93ZXZlciwgdGhlIGNvbmNlcm4gaGFzIGJlZW4gdGhhdCB0aGlzIGNhbiBsZWFkIHRvIGFidXNl
LiBPbmUgZXh0cmEgdGljayBjYW4NCj4gYmUgYSBsb25nIHRpbWUoYWJvdXQgYSBtaWxsaXNlYyBv
ciBtb3JlKS4gUGV0ZXIgWmlqbHN0cmEgaW4gcmVzcG9uc2UgcG9zdGVkIGEgDQo+IHByb3RvdHlw
ZSBzb2x1dGlvbls1XSwgd2hpY2ggZ3JhbnRzIDUwdXMgZXhlY3V0aW9uIHRpbWUgZXh0ZW5zaW9u
IG9ubHkuDQo+IFRoaXMgaXMgYWNoaWV2ZWQgd2l0aCB0aGUgaGVscCBvZiBhIHRpbWVyIHN0YXJ0
ZWQgb24gdGhhdCBjcHUgYXQgdGhlIHRpbWUgb2YNCj4gZ3JhbnRpbmcgZXh0cmEgZXhlY3V0aW9u
IHRpbWUuIFdoZW4gdGhlIHRpbWVyIGZpcmVzIHRoZSB0aHJlYWQgd2lsbCBiZQ0KPiBwcmVlbXB0
ZWQsIGlmIHN0aWxsIHJ1bm5pbmcuIA0KPiANCj4gVGhpcyBwYXRjaHNldCBpbXBsZW1lbnRzIGFi
b3ZlIHNvbHV0aW9uIGFzIHN1Z2dlc3RlZCwgd2l0aCB1c2Ugb2YgcmVzdGFydGFibGUNCj4gc2Vx
dWVuY2VzKHJzZXEpIHN0cnVjdHVyZSBmb3IgQVBJLiBSZWZlciBbM11bNF0gZm9yIGZ1cnRoZXIg
ZGlzY3Vzc2lvbnMuDQo+IA0KPiB2MTogDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDI1MDIxNTAwNTQxNC4yMjQ0MDktMS1wcmFrYXNoLnNhbmdhcHBhQG9yYWNsZS5jb20vDQo+IA0K
PiB2MjoNCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwNDE4MTkzNDEwLjIwMTAw
NTgtMS1wcmFrYXNoLnNhbmdhcHBhQG9yYWNsZS5jb20vDQo+IC0gQmFzZWQgb24gZGlzY3Vzc2lv
bnMgaW4gWzNdLCBleHBlY3RpbmcgdXNlciBhcHBsaWNhdGlvbiB0byBjYWxsIHNjaGVkX3lpZWxk
KCkNCj4gIHRvIHlpZWxkIHRoZSBjcHUgYXQgdGhlIGVuZCBvZiB0aGUgY3JpdGljYWwgc2VjdGlv
biBtYXkgbm90IGJlIGFkdmlzYWJsZSBhcw0KPiAgcG9pbnRlZCBvdXQgYnkgTGludXMuICANCj4g
DQo+ICBTbyBhZGRlZCBhIGNoZWNrIGluIHJldHVybiBwYXRoIGZyb20gYSBzeXN0ZW0gY2FsbCB0
byByZXNjaGVkdWxlIGlmIHRpbWUNCj4gIHNsaWNlIGV4dGVuc2lvbiB3YXMgZ3JhbnRlZCB0byB0
aGUgdGhyZWFkLiBUaGUgY2hlY2sgY291bGQgYXMgd2VsbCBiZSBpbg0KPiAgc3lzY2FsbCBlbnRl
ciBwYXRoIGZyb20gdXNlciBtb2RlLg0KPiAgVGhpcyB3b3VsZCBhbGxvdyBhcHBsaWNhdGlvbiB0
aHJlYWQgdG8gY2FsbCBhbnkgc3lzdGVtIGNhbGwgdG8geWllbGQgdGhlIGNwdS4gDQo+ICBXaGlj
aCBzeXN0ZW0gY2FsbCBzaG91bGQgYmUgc3VnZ2VzdGVkPyBnZXRwcGlkKDIpIHdvcmtzLg0KPiAN
Cj4gIERvIHdlIHN0aWxsIG5lZWQgdGhlIGNoYW5nZSBpbiBzY2hlZF95aWVsZCgpIHRvIHJlc2No
ZWR1bGUgd2hlbiB0aGUgdGhyZWFkDQo+ICBoYXMgY3VycmVudC0+cnNlcV9zY2hlZF9kZWxheSBz
ZXQ/DQo+IA0KPiAtIEFkZGVkIHBhdGNoIHRvIGludHJvZHVjZSBhIHN5c2N0bCB0dW5hYmxlIHBh
cmFtZXRlciB0byBzcGVjaWZ5IGR1cmF0aW9uIG9mDQo+ICB0aGUgdGltZSBzbGljZSBleHRlbnNp
b24gaW4gbWljcm8gc2Vjb25kcyh1cyksIGNhbGxlZCAnc2NoZWRfcHJlZW1wdF9kZWxheV91cycu
DQo+ICBDYW4gdGFrZSBhIHZhbHVlIGluIHRoZSByYW5nZSAwIHRvIDEwMC4gRGVmYXVsdCBpcyBz
ZXQgdG8gNTB1cy4NCj4gIFNldHRpbmcgdGhpcyB0dW5hYmxlIHRvIDAgZGlzYWJsZXMgdGhlIHNj
aGVkdWxlciB0aW1lIHNsaWNlIGV4dGVuc2lvbiBmZWF0dXJlLg0KPiANCj4gdjM6DQo+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MDUwMjAxNTk1NS4zMTQ2NzMzLTEtcHJha2FzaC5z
YW5nYXBwYUBvcmFjbGUuY29tDQo+IC0gQWRkcmVzc2luZyByZXZpZXcgY29tbWVudHMgYnkgU2Vi
YXN0aWFuIGFuZCBQcmF0ZWVrLg0KPiAgKiBSZW5hbWUgcnNlcV9zY2hlZF9kZWxheSAtPiBzY2hl
ZF90aW1lX2RlbGF5LiBNb3ZlIGl0cyBwbGFjZSBpbg0KPiAgICBzdHJ1Y3QgdGFza19zdHJ1Y3Qg
bmVhciBvdGhlciBiaXRzIHNvIGl0IGZpdHMgaW4gZXhpc3Rpbmcgd29yZC4NCj4gICogVXNlIElT
X0VOQUJMRUQoQ09ORklHX1JTRVEpIGluc3RlYWQgb2YgI2lmZGVmIHRvIGFjY2Vzcw0KPiAgICAn
c2NoZWRfdGltZV9kZWxheScuDQo+ICAqIHJlbW92ZWQgcnNlcV9kZWxheV9yZXNjaGVkX3RpY2so
KSBjYWxsIGZyb20gaHJ0aWNrX2NsZWFyKCkuDQo+ICAqIEludHJvZHVjZWQgYSBwYXRjaCB0byBh
ZGQgYSB0cmFjZXBvaW50IGluIGV4aXRfdG9fdXNlcl9tb2RlX2xvb3AoKSwNCj4gICAgc3VnZ2Vz
dGVkIGJ5IFNlYmFzdGlhbi4NCj4gICogQWRkZWQgY29tbWVudHMgdG8gZGVzY3JpYmUgUlNFUV9D
U19GTEFHX0RFTEFZX1JFU0NIRUQgZmxhZy4NCj4gDQo+IHY0Og0KPiAtIENoYW5nZWQgZGVmYXVs
dCBzY2hlZCBkZWxheSBleHRlbnNpb24gdGltZSB0byAzMHVzDQo+IC0gQWRkZWQgcGF0Y2ggdG8g
aW5kaWNhdGUgdG8gdXNlcnNwYWNlIGlmIHRoZSB0aHJlYWQgZ290IHByZWVtcHRlZCBpbg0KPiAg
dGhlIGV4dGVuZGVkIGNwdSB0aW1lIGdyYW50ZWQuIFVzZXMgYW5vdGhlciBiaXQgaW4gcnNlcSBj
cyBmbGFncyBmb3IgaXQuDQo+ICBUaGlzIHNob3VsZCBoZWxwIHRoZSBhcHBsaWNhdGlvbiB0byBj
aGVjayBhbmQgYXZvaWQgaGF2aW5nIHRvIGNhbGwgYQ0KPiAgc3lzdGVtIGNhbGwgdG8geWllbGQg
Y3B1LCBlc3BlY2lhbGx5IHNjaGVkX3lpZWxkKCkgYXMgcG9pbnRlZCBvdXQNCj4gIGJ5IFN0ZXZl
biBSb3N0ZWR0Lg0KPiAtIE1vdmVkIHRyYWNlcG9pbnQgY2FsbCB0b3dhcmRzIGVuZCBvZiBleGl0
X3RvX3VzZXJfbW9kZV9sb29wKCkuDQo+IC0gQWRkZWQgYSBwcl93YXJuKCkgbWVzc2FnZSB3aGVu
IHRoZSAnc2NoZWRfcHJlZW1wdF9kZWxheV91cycgdHVuYWJsZSBpcw0KPiAgc2V0IGhpZ2hlciB0
aGVuIHRoZSBkZWZhdWx0IHZhbHVlIG9mIDMwdXMuDQo+IC0gUGF0Y2ggdG8gYWRkIGFuIEFQSSB0
byBxdWVyeSBpZiBzY2hlZCB0aW1lIGV4dGVuc2lvbiBmZWF0dXJlIGlzIHN1cHBvcnRlZC4gDQo+
ICBBIG5ldyBmbGFnIHRvIHN5c19yc2VxIGZsYWdzIGFyZ3VtZW50IGNhbGxlZCAnUlNFUV9GTEFH
X1FVRVJZX0NTX0ZMQUdTJywNCj4gIGlzIGFkZGVkLCBhcyBzdWdnZXN0ZWQgYnkgTWF0aGlldSBE
ZXNub3llcnMuIA0KPiAgUmV0dXJucyBiaXRtYXNrIG9mIGFsbCB0aGUgc3VwcG9ydGVkIHJzZXEg
Y3MgZmxhZ3MsIGluIHJzZXEtPmZsYWdzIGZpZWxkLg0KPiANCg0KSSBoYWQgbWlzc2VkIHRoZSBy
ZWZlcmVuY2VzIGluIHRoZSBjb3ZlciBsZXR0ZXIuIEluY2x1ZGluZyBoZXJlDQoNClsxXSBodHRw
czovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjMxMDI1MDU0MjE5LjFhY2FhM2RkQGdhbmRhbGYu
bG9jYWwuaG9tZS8NClsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzEzOTU3Njc4NzAt
MjgwNTMtMS1naXQtc2VuZC1lbWFpbC1raGFsaWQuYXppekBvcmFjbGUuY29tLw0KWzNdIGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MDEzMTIyNTgzNy45NzIyMTgyMzJAZ29vZG1pcy5v
cmcvDQpbNF0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQxMTEzMDAwMTI2Ljk2Nzcx
My0xLXByYWthc2guc2FuZ2FwcGFAb3JhY2xlLmNvbS8NCls1XSBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9sa21sLzIwMjMxMDMwMTMyOTQ5LkdBMzgxMjNAbm9pc3kucHJvZ3JhbW1pbmcua2lja3Mt
YXNzLm5ldC8NCls2XSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMTYzMTE0NzAzNi0xMzU5
Ny0xLWdpdC1zZW5kLWVtYWlsLXByYWthc2guc2FuZ2FwcGFAb3JhY2xlLmNvbS8NCg0KDQo+IFBy
YWthc2ggU2FuZ2FwcGEgKDYpOg0KPiAgU2NoZWQ6IFNjaGVkdWxlciB0aW1lIHNsaWNlIGV4dGVu
c2lvbg0KPiAgU2NoZWQ6IEluZGljYXRlIGlmIHRocmVhZCBnb3QgcmVzY2hlZHVsZWQNCj4gIFNj
aGVkOiBUdW5hYmxlIHRvIHNwZWNpZnkgZHVyYXRpb24gb2YgdGltZSBzbGljZSBleHRlbnNpb24N
Cj4gIFNjaGVkOiBBZGQgc2NoZWR1bGVyIHN0YXQgZm9yIGNwdSB0aW1lIHNsaWNlIGV4dGVuc2lv
bg0KPiAgU2NoZWQ6IEFkZCB0cmFjZXBvaW50IGZvciBzY2hlZCB0aW1lIHNsaWNlIGV4dGVuc2lv
bg0KPiAgQWRkIEFQSSB0byBxdWVyeSBzdXBwb3J0ZWQgcnNlcSBjcyBmbGFncw0KPiANCj4gaW5j
bHVkZS9saW51eC9lbnRyeS1jb21tb24uaCB8IDExICsrLS0NCj4gaW5jbHVkZS9saW51eC9zY2hl
ZC5oICAgICAgICB8IDIzICsrKysrKysrKw0KPiBpbmNsdWRlL3RyYWNlL2V2ZW50cy9zY2hlZC5o
IHwgMjggKysrKysrKysrKysNCj4gaW5jbHVkZS91YXBpL2xpbnV4L3JzZXEuaCAgICB8IDE5ICsr
KysrKysNCj4ga2VybmVsL2VudHJ5L2NvbW1vbi5jICAgICAgICB8IDI3ICsrKysrKysrLS0NCj4g
a2VybmVsL3JzZXEuYyAgICAgICAgICAgICAgICB8IDk3ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKw0KPiBrZXJuZWwvc2NoZWQvY29yZS5jICAgICAgICAgIHwgNTAgKysrKysr
KysrKysrKysrKysrKw0KPiBrZXJuZWwvc2NoZWQvZGVidWcuYyAgICAgICAgIHwgIDEgKw0KPiBr
ZXJuZWwvc2NoZWQvc3lzY2FsbHMuYyAgICAgIHwgIDUgKysNCj4gOSBmaWxlcyBjaGFuZ2VkLCAy
NTMgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4gDQo+IC0tIA0KPiAyLjQzLjUNCj4g
DQo+IA0KDQo=
