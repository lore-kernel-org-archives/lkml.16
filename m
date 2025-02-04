Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A42153801
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 03:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738638268; cv=fail; b=rwoTASDQ+3aGVnSMV8x8PEodv777qkS55yHGqZPk05vSPgLenVpQUH4cYCkpF7PDYpX3h/PIs+upOw7ohfSZDm8ZVarkFaqzeReOfrxsr+2+eK0vb2C3Q69QX6s/TMmUjLV8Sbskteg6e7aPnraNdFVo2W730IY9OGbStLdlYPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738638268; c=relaxed/simple;
	bh=TjuTtLYdHlSDqxfKYsIhUscF7k9mJqUYCsnPmHN/TmU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HjxMOy54l8kFmxBP/CsbJHYYoU0+GkmkKrmBg9IGDp+20soxFd2ABNqN/SRcpVrCkiLzP6J9gsSxhcMuJ4t45z3s4mAnWP8Q4sTvaqusuEOy5o8110bxnPLiU/oB8jdCUVQfhx2/DfkpdmEdSBifqBB0MswLGZqtU+lBQ2Gp2PE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PPvYiqJh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=C6xRszdt; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PPvYiqJh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="C6xRszdt"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5141MpYh028210;
	Tue, 4 Feb 2025 03:04:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=TjuTtLYdHlSDqxfKYsIhUscF7k9mJqUYCsnPmHN/TmU=; b=
	PPvYiqJhpxhqCTBbVbAjnHQoPZBBQr/7ylI7W1gF1ARo/grduUEgWXkHIon1dQuV
	qYbkpz5JXaL7P/JiniSy61H5tPXPB32zTnAWQSBxlavoS2qbd5EC1eRmO9r+obDN
	A51dwvlp4YXP/3uZ5/XhxgIdOURXVE9Ml5SpnC2dWkbLYdMNEuuWBPCnW2FcUEm/
	M47tPDZCclnBHru8/Xg9nQYhqqizmgSN+XNI236AUVZ5kdOIytShRb6GtKRh8sGb
	S9rWbxw8JJBpk7sfmyXrfYlX6GoCs0dhJRyRp5edq/4mWdk7BFuZkOaoIUDkewdx
	RX2ofpl+Iie0NuS+d4dV/Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44hhsv40vq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 04 Feb 2025 03:04:06 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5140BN8G029894;
	Tue, 4 Feb 2025 03:04:05 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44j8p2ehqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 04 Feb 2025 03:04:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cGoFN2ErpFRCQ+1oFG1DuOdxX8AYiTfkX7tH6NEj7Q5QGDoXYeQgTwQATchCrhlzoWvdaBaBeh32odq/FXwvyirw/GFFwy8Qs1ktPklK6i2IGSCqWqlxEa9ubpBNgoTApcxfY/WTQvVvPzG1oRmoJUHQWwlPHn2d4+YIjWHA0tg4/+rOrXhAALswQkSRUfupdGaX2PCqc2HJBQJNNzhJyDN1tMSQFLpIzTqLrGIsdseE30giUD5R6WbzU/aJACOHk3Q0O4OxDai3pezcGbX105Pw7roIdfSmxWo4DvFU6g5aCW0JETrRblZ59CB/+YOhMt4/0Yp4FJh9BowU7uBSTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TjuTtLYdHlSDqxfKYsIhUscF7k9mJqUYCsnPmHN/TmU=;
 b=Z1nmgCZZw4WAjB8v625Vw4G0XCWHYn1yyQ1KVBnNKpuuVMJ94AboRDJmxWLbCMINgWZbZP5Eeem0LoXWzDKC4Ry25PQf3EUNW3Tekwvo/bSZy7ZyCKC48ZsdIlYJgk8J+PixpRX7iFTxhuWJD4hTwZQ1NU5wzVPY83DoY1D5v+u4FZWyL8Xb00aW57NXAyd+7Hsf3DwwD4wrK6aEEASNEVHdj196Hr0zmS4Olgt7/5pufxaApoOLDJA8mugt7cf1g0mhZ5p8d8zgZy2aagJEMoXUP618ZMGqYYRplQ/kByp2/5ONClNxJ94KIsgAbvrprNxfzaQv7kPaJopQpTCoRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TjuTtLYdHlSDqxfKYsIhUscF7k9mJqUYCsnPmHN/TmU=;
 b=C6xRszdtfmgivcpuLC4VEcWivnlfpKavHh2sEDra3T3xW95aylhTIpfeQdfWsfMxcmpwxM0loQzcQs6XbtLJ3PYuZ6MEkL6Na2qby1MgbYSOhhrUkLlpG6Wecc0MR9Dv/AgMsTXAr/UeBeMR+WJ8rAnTZdr9j0FcTV8DIrU0ofM=
Received: from IA1PR10MB7309.namprd10.prod.outlook.com (2603:10b6:208:3fe::13)
 by IA0PR10MB7255.namprd10.prod.outlook.com (2603:10b6:208:40c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Tue, 4 Feb
 2025 03:04:03 +0000
Received: from IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a]) by IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a%4]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 03:04:03 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
CC: Peter Zijlstra <peterz@infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "rostedt@goodmis.org" <rostedt@goodmis.org>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        Daniel Jordan
	<daniel.m.jordan@oracle.com>
Subject: Re: [RFC PATCH 0/4] Scheduler time slice extension
Thread-Topic: [RFC PATCH 0/4] Scheduler time slice extension
Thread-Index:
 AQHbNV85xP8mG8bGMUONwn7IqXYau7K1jv+AgAANEACAAAlsgIAA77AAgACalICAJ1meAIAAC0mAgArZywCATYmnAA==
Date: Tue, 4 Feb 2025 03:04:03 +0000
Message-ID: <8F78AD95-4E2B-4F2F-9E9C-103550357732@oracle.com>
References: <20241113000126.967713-1-prakash.sangappa@oracle.com>
 <20241113185013.GA22571@noisy.programming.kicks-ass.net>
 <f0f681a0-22b4-45f4-85a1-18f140286cbe@efficios.com>
 <896BA407-E19C-4CEB-BF5E-9707543BA365@oracle.com>
 <20241114102834.GM6497@noisy.programming.kicks-ass.net>
 <CF032474-7725-48C1-BA31-A8728C6C06E7@oracle.com>
 <ADA482EF-F2FF-473A-9585-CD5925FA8BC1@oracle.com>
 <02e2c26c-7fae-40e1-b1a7-3662f879e812@efficios.com>
 <84406285-6A4C-493B-B010-1FAD512EFAD8@oracle.com>
In-Reply-To: <84406285-6A4C-493B-B010-1FAD512EFAD8@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51.11.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR10MB7309:EE_|IA0PR10MB7255:EE_
x-ms-office365-filtering-correlation-id: 89d55e9d-bef4-4cfd-1b7e-08dd44c8947d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UFJFNDdZNS9FVWw0TTBBeXJXWGlDYTJmcDF4ZFVvbEtLSTlqeXNJZGhLQ2Vl?=
 =?utf-8?B?Y29sWXo5RENEdjB0ZGtYMUpqNGxhVGIzL3NNUGJTZHhIS3ZpZ2VmMG9ieHh1?=
 =?utf-8?B?aHlyU3lVTEZUcmxuWXo5VUJEZnhtNVJrQ1JwdGpGbGtJMjg0d2U5NTJXQStN?=
 =?utf-8?B?UUMyQ2k2ZTFQLzdGSFRscWYzYU1tUzI3UWd6UWVZcXdFMFJsN0pCdWViUG1o?=
 =?utf-8?B?RStOdy9sVkcrVkxrT3djbjZZVG1XOE1zS0dYSWlnNWt5K29obythOWU2K0RN?=
 =?utf-8?B?aFMxR24xN2xING8rb0MvMmRnK1pUTkdURUpMMGt0aUt4ZGU1U3A5VDlIRHNJ?=
 =?utf-8?B?QlhNUlByWEhlbk01aWY0LytHbjNJOUdoOUdjMjEvUDFyQjJJeDd4T3VVWHpy?=
 =?utf-8?B?ZFd4dnArQ3hiek1saHRpWFY1UVQxNWxNYnBWbDlZWjFsN04vQldHeVgrZzBh?=
 =?utf-8?B?WWhjZzdib2xldGpGYlRGWW5Ma1l1QjBqcFZ5UGR4Mnk1N1JrODN0OWtkUWxu?=
 =?utf-8?B?M0lLa3FxeFEyY3U5Yllha092NloxMDdaRm9uc2FmVmVQNDFwOHJHR0NVbXMv?=
 =?utf-8?B?M2lsTWtXMi95MTN4U0RIaytzTkd5WnNVUC94T1hnaXM4L3ZJdnVuVGMyeGZy?=
 =?utf-8?B?c1FOeko3ZHN3WVdVU2tuNjdxN3FDelNGcnRYQ3Rid3ZIK2NPdW80TE5TeFlj?=
 =?utf-8?B?aW9vbGRBOU9id0xrZ0hsOS9sWFZIYXQzUXNnWEovdTVRNlROVWkxRXJmUkI5?=
 =?utf-8?B?UVI5bDVoN0txTmcxTEhHdU4wUEhQME1EdjFrdzVEY09GdmpxRnQ2cElsb01u?=
 =?utf-8?B?NUtsaXJPdXJRUXBxQ1R1a05YSk5VVHZWNkgzMlhlZXNodUYwUUthMVU3K045?=
 =?utf-8?B?cmNicjNIU3IzUHJtMVR3eTl5ajBrT0I4RjVjcDdBZTRaY1h6cWtTaW1hMi9y?=
 =?utf-8?B?ZE56elk3RWVyUEx4RHpJODhhU2I0VnZWT29Ed0VIa2tCQXBtRWRtb3QvdnRa?=
 =?utf-8?B?Sy9aVU93bS9WMTNuMU5aY0RJNGVuelVBckdsT3dEV1dXQ1hLUFQyZ1pFSysz?=
 =?utf-8?B?SXlVODlTbzJrSFZLYWhNY09WMVF6UG9XZi9saEF6MVptS3VTcnhBT0tDVENm?=
 =?utf-8?B?aEJGT0JlNnZjN0hWSmMxSW43VEJoU2Nsc0ZCZVRRYzA4b1N3Q21GRi9hdHM4?=
 =?utf-8?B?d3ROalJZWnhjeU9uZTZQamJma2txaUNBUHhkekJpdmwxZTFBMk1UUmtXaktp?=
 =?utf-8?B?VGhNVkp3Y0dibHhsOEo0Tzh5ZnJHbHRZcUNwcGVncjlBNVU2b0dtc3pTSHlW?=
 =?utf-8?B?Vm02Z3RLbGFGTHBxZEgwYmJhWnl0TnBMbG0rRnU3WFd3Z2hnaWt0d2E4R3JE?=
 =?utf-8?B?a2FHUzBaUlg4K3lRcEpMcWRuRmhmMVFkQVV2NS9vWmdqQzlVQWJEbE5La0lP?=
 =?utf-8?B?a3o4blhBUXNwQUxYMGZTMGRPZlRZL0k2NDJoaElHL1JxbzdrMVpFZSszZWxS?=
 =?utf-8?B?d0F2cmtFbFhzbGc2TDdKb214NExDMWtaL2oyc0gzL2phSjgxMlRxcEJDWlN0?=
 =?utf-8?B?SmxIVVhrMjdnNzNrZm1pOGZhQTh6ZktycjRxYnYvaGpqcUlhRkZkbFM4UW1K?=
 =?utf-8?B?M1p2cjY2NFNkbWxqSEVnbWh4VXNSM3prUnVzT25wc3Q1aGo0K1d3bVRmQ0h6?=
 =?utf-8?B?eS93NnB3c3pJZkFJd3lsM2NsdUVPRC9jZXhhRUt0NHpzREpzSnczQW5KdW1Z?=
 =?utf-8?B?S0c3WXpSNjdNMSs2c1gramhYWVdIYlN0MkFqcVp3TU0yckhLQW5aLzYxRml2?=
 =?utf-8?B?VzEvTkszaWVOQ2lJdTNDTEZzVWV6elppRmpIUElsRno5S08wODlwTWdQeWJm?=
 =?utf-8?B?RUkxWTZ2VVU3dTZKcE9XaFRvU0Zqa0IrNVVibjZtM0pKTnc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR10MB7309.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aXNhMk5oTTZDWTlrN3lOS1RkYXVrbXZRSE12a05pdmlPdXRDMEV2bzVkNTFV?=
 =?utf-8?B?MG5la0M3bjcxTXZ2VE1hdDRHTkZmNGRpWlVFVmZjRGJFSGlFQmJvZ21lSGlZ?=
 =?utf-8?B?bzVrSDhWQUVOWEEwdUpSUUVjT1FHVzRsTmlaY2lOL0t1bHhXQnM5aWpRZ3dj?=
 =?utf-8?B?a2M4Znp1VnBQNUxTWWlWNGJmTGQvaTY4YlVYaHhBbFp0UFUzL29aM3RJRkNn?=
 =?utf-8?B?ck9nQ1NNcWVjZXg4RDk2Q296ME9ONHBPZlBkbEpvdnBaemtia08xazFDa2ky?=
 =?utf-8?B?TnJDdlk2TGdxNjl3K3E1OFByR3JzYURjNXI4akgvVGxLODh5SHQzSnRlYUpi?=
 =?utf-8?B?Rlp1K25WMlh2WC9wNm9PTW1jWlpOSG9WYkFvWDZTeFdUaXU4OUdKL2ZwNi95?=
 =?utf-8?B?em9FeFliQ3RWZG1VMFpxVzNOREdUU1dkVXVUaENBelV0U0E3dXpvemx3Tkow?=
 =?utf-8?B?RjBXRGRObUwraUxKaGxLOWphelBXZnFveHNmb1RyanVXaXpuWGhucU9Ld2Vs?=
 =?utf-8?B?VEdRR3pmSyt0ckYyMXVseUhGeU8zTnV2M09BbU5USVZLcXF6MVZYbldVdXp4?=
 =?utf-8?B?TmtnbU4wUkxyeUJmVURlamFyMGZYOHRGMXN6ZHlmNW9OVnI4dndFaXQzd0tZ?=
 =?utf-8?B?RTIzaStmcmwzdnhUMjBJZ1Y3b05Na043NW5udU1sRWFJZnRoT0VaQTZYM0JF?=
 =?utf-8?B?ZldsaW5YMzlwcEYvRW1NSHl2WTN3WGgyaHNkZ3RhamU3b3RtYTZsZVZCOUlm?=
 =?utf-8?B?VENxRVJyM09yR3NMdGN6YUx4WFk5UWRoQkJhUEw5bDI5NDEyTnNQbHNmenBS?=
 =?utf-8?B?eGxwTUxObSs0TlFlb1ROTUFLbDJkZFArM2RleHBxRHZ2TVpYYm9LRE9aM21D?=
 =?utf-8?B?b3AvN0FZTE00STNBbUd1NmsrdDhyU0RMdk9BaE1NREUzNlROMlZSVmQreW9H?=
 =?utf-8?B?bGQza3V5UHNTUWw2L0hKNmx6Qmxja3J4L201bEo0TkFuOEdDdkMyYXRsZ1Na?=
 =?utf-8?B?S3ZJRThzeEdGQWxhNnhYUW9ydE5mZ3pzb3NpSjFkN2ZCVy9UTnJ4SnVrYXlS?=
 =?utf-8?B?Z0pjdTVXUkJxT0VqczVBZENnSWtWaDdEYnJNVlFOV3cvcUNtWFYycGt3T2NF?=
 =?utf-8?B?YXVTWUo4T2h4TmJLZDN6Z29CYSs0Q2RVRWNqWkR4YmwrSzdnMHNQR0g2SFJv?=
 =?utf-8?B?L0gzcjJ0MysrN2U1a0Y2VU9qd0JkL2F4UlBGQ3FhRjVGT1RpTDJrbSthRHJv?=
 =?utf-8?B?a1o2VnhMRUlOYXdJQVBWdXhBQzRoTG14MktJQUJ0TzlydUNVeFlwcHlXc05j?=
 =?utf-8?B?R0RJb2Z2eU1iNEVDOEJXYVRqZDRZR0w1cjNtN3MrN2NTMmM3SmtaRnd1dnA1?=
 =?utf-8?B?dFgybG1HMkNOamYzaHR5cVRuZ2xOdE91a2VSMWRkMjh5ckExK0NYVS8rVWQy?=
 =?utf-8?B?Wmw4ZXEzMmNZSkxqQkx1Q2dPckJndG9yWVBGSUxrMDdTcWUyaWtiak1aeVpJ?=
 =?utf-8?B?UmplQzRlSkdUdWZEak1FSTBKOVVuZE5LQ0FaMmUxRG5XUytOdFVxMlZ5TTRR?=
 =?utf-8?B?bkFCaVkxQWwxWHZ5SDhTMVRrSlBxUldMcmVSK2F2MEcvdXNpSkkveDhHWXQv?=
 =?utf-8?B?U3psQ2ZjMGdidWlwTXRrTDhHRE52eXlFdVp4MHNrK0c3bmFhK1dEN2JHRzl3?=
 =?utf-8?B?ZkhqKzIva2xkRnBkK3VOR1lPS3BwQjRPUVZ2VnBJeW9NYndIeDJuVEdIQS9V?=
 =?utf-8?B?dEIyd0VVOW5rNXhjRW5MZjdvdGZUdlI3RGlMbkR0YlVyMHVvUCsxVU81OUQx?=
 =?utf-8?B?Y25HaVFsWmhLQWhxSVp2N210MStvMjBzdklUTCtmZ0RqLzJxRlY1cnBjSjR6?=
 =?utf-8?B?ODB3Rmk5bDk1VVFvY3lUczJSQUk5S3hYY25KS01lclFmWUp6RjZKdVRhd0lH?=
 =?utf-8?B?MjVWMnMzTDkxTVNISGxkd3hzTnA5bVFMUnNjeEw3NmZvMkRGTHVrOFU2Ui9k?=
 =?utf-8?B?VWhRTG1aZmdpdWw1VWY0VnBKcXpPcGhBUy9vRHI3dldlYTlxa0ViSGl3UW5V?=
 =?utf-8?B?UVROV1JTenZiSVpJTURMVENjSno1dXFKb2Zoc20xREQvWWZqNWp6YzdxUEoy?=
 =?utf-8?B?ZU1GTmk3bUh2WXR6QXBEOHVKTkp1MUlNMVZwcU43bDRRM0w2NVViSEVhQjJY?=
 =?utf-8?Q?qzOp/6SZNnmjFVaLabBvRX8fFd6ZHNwzZ70odrkIoHsf?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E9AC36FCFE84C44ABF9DED1ABB28FD8@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JApcvq1txmbfuQXf0n16oz5TMl9P6snJEryiHemL8Ar2TlWdpbTCRKmapqSAO+MgZ4mMGPcoJd9n8cwzy+CL+u5rfAtXE+hUdsoAWfmer0voPkou8cttkyNMV1jMsI9yTYwO+VrKurOauuKNDULsZA2zuStRE9BXAwdaslvyOfBFfRTC901SlGTrPPq5vUXZFImsTDw6jabwJe9Vpe3Ofbv+R0gHRafHBMZTQeNEl+E3rW59iK16v7Kk0JFaLlo5QMgf5wo+oa6HhUWel0zH5aqMOlwF5RBa0kQEvszr3j1Kf2XXFlmotrfN7X6v5byXu6Kru0Gn9lVsFtNn56Sf6YhQctrB6gZKc3c+BNGSWgcluLdlnjX07zegA1AOMyss/vmZxlrn7YvCgSv5Sro1i/1oTMu0PGKVDYYKi65+R9fQwRQaX1d2yuf5sIWgsE4wYXZwRfeO3lQwMSu1QkU5HV6ZPdrRbLeOymkQ4uXqbYtRf2DiVyLehtOLcCYIAbV12naZvUeFmGDmrApQn+w6AQqlJR8e49H4+ki/4WxKQgi5ROaN7WYYOTjVKpy870+uv8nQJxgJ6DiKWSWA2IBCtiUHMrLbjhthid4lA6mvYl8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR10MB7309.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d55e9d-bef4-4cfd-1b7e-08dd44c8947d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 03:04:03.1433
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UFCrgQYPbr5BLFQ34RHMY5pdq3djowcDxTuIE6C0d2iAA+RUzeCYW2i7nrTM+PJNQJfaoCwmYR8O3ZKQJmQF4WYTcGGRH2bjqfFc+pb5M3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7255
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_01,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502040022
X-Proofpoint-GUID: 3lLBaIoZ0RAxEkdJt1JXfkBEEl7fi6xq
X-Proofpoint-ORIG-GUID: 3lLBaIoZ0RAxEkdJt1JXfkBEEl7fi6xq

DQoNCj4gT24gRGVjIDE2LCAyMDI0LCBhdCAxMDo1OeKAr0FNLCBQcmFrYXNoIFNhbmdhcHBhIDxw
cmFrYXNoLnNhbmdhcHBhQG9yYWNsZS5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPj4gT24gRGVj
IDksIDIwMjQsIGF0IDE6MTfigK9QTSwgTWF0aGlldSBEZXNub3llcnMgPG1hdGhpZXUuZGVzbm95
ZXJzQGVmZmljaW9zLmNvbT4gd3JvdGU6DQo+PiANCj4+IE9uIDIwMjQtMTItMDkgMTU6MzYsIFBy
YWthc2ggU2FuZ2FwcGEgd3JvdGU6DQo+Pj4+IE9uIE5vdiAxNCwgMjAyNCwgYXQgMTE6NDHigK9B
TSwgUHJha2FzaCBTYW5nYXBwYSA8cHJha2FzaC5zYW5nYXBwYUBvcmFjbGUuY29tPiB3cm90ZToN
Cj4+Pj4gDQo+Pj4+IA0KPj4+PiANCj4+Pj4+IE9uIE5vdiAxNCwgMjAyNCwgYXQgMjoyOOKAr0FN
LCBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+IHdyb3RlOg0KPj4+Pj4gDQo+
Pj4+PiBPbiBXZWQsIE5vdiAxMywgMjAyNCBhdCAwODoxMDo1MlBNICswMDAwLCBQcmFrYXNoIFNh
bmdhcHBhIHdyb3RlOg0KPj4+Pj4+IA0KPj4+Pj4+IA0KPj4+Pj4+PiBPbiBOb3YgMTMsIDIwMjQs
IGF0IDExOjM24oCvQU0sIE1hdGhpZXUgRGVzbm95ZXJzIDxtYXRoaWV1LmRlc25veWVyc0BlZmZp
Y2lvcy5jb20+IHdyb3RlOg0KPj4+Pj4+PiANCj4+Pj4+Pj4gT24gMjAyNC0xMS0xMyAxMzo1MCwg
UGV0ZXIgWmlqbHN0cmEgd3JvdGU6DQo+Pj4+Pj4+PiBPbiBXZWQsIE5vdiAxMywgMjAyNCBhdCAx
MjowMToyMkFNICswMDAwLCBQcmFrYXNoIFNhbmdhcHBhIHdyb3RlOg0KPj4+Pj4+Pj4+IFRoaXMg
cGF0Y2ggc2V0IGltcGxlbWVudHMgdGhlIGFib3ZlIG1lbnRpb25lZCA1MHVzIGV4dGVuc2lvbiB0
aW1lIGFzIHBvc3RlZA0KPj4+Pj4+Pj4+IGJ5IFBldGVyLiBCdXQgaW5zdGVhZCBvZiB1c2luZyBy
ZXN0YXJ0YWJsZSBzZXF1ZW5jZXMgYXMgQVBJIHRvIHNldCB0aGUgZmxhZw0KPj4+Pj4+Pj4+IHRv
IHJlcXVlc3QgdGhlIGV4dGVuc2lvbiwgdGhpcyBwYXRjaCBwcm9wb3NlcyBhIG5ldyBBUEkgd2l0
aCB1c2Ugb2YgYSBwZXINCj4+Pj4+Pj4+PiB0aHJlYWQgc2hhcmVkIHN0cnVjdHVyZSBpbXBsZW1l
bnRhdGlvbiBkZXNjcmliZWQgYmVsb3cuIFRoaXMgc2hhcmVkIHN0cnVjdHVyZQ0KPj4+Pj4+Pj4+
IGlzIGFjY2Vzc2libGUgaW4gYm90aCB1c2VycyBwYWNlIGFuZCBrZXJuZWwuIFRoZSB1c2VyIHRo
cmVhZCB3aWxsIHNldCB0aGUNCj4+Pj4+Pj4+PiBmbGFnIGluIHRoaXMgc2hhcmVkIHN0cnVjdHVy
ZSB0byByZXF1ZXN0IGV4ZWN1dGlvbiB0aW1lIGV4dGVuc2lvbi4NCj4+Pj4+Pj4+IEJ1dCB3aHkg
LS0gd2UgYWxyZWFkeSBoYXZlIHJzZXEsIGdsaWJjIHVzZXMgaXQgYnkgZGVmYXVsdC4gV2h5IGFk
ZCB5ZXQNCj4+Pj4+Pj4+IGFub3RoZXIgdGhpbmc/DQo+Pj4+Pj4+IA0KPj4+Pj4+PiBJbmRlZWQs
IHdoYXQgSSdtIG5vdCBzZWVpbmcgaW4gdGhpcyBSRkMgcGF0Y2ggc2VyaWVzIGNvdmVyIGxldHRl
ciBpcyBhbg0KPj4+Pj4+PiBleHBsYW5hdGlvbiB0aGF0IGp1c3RpZmllcyBhZGRpbmcgeWV0IGFu
b3RoZXIgcGVyLXRocmVhZCBtZW1vcnkgYXJlYQ0KPj4+Pj4+PiBzaGFyZWQgYmV0d2VlbiBrZXJu
ZWwgYW5kIHVzZXJzcGFjZSB3aGVuIHdlIGhhdmUgZXh0ZW5zaWJsZSByc2VxDQo+Pj4+Pj4+IGFs
cmVhZHkuDQo+Pj4+Pj4gDQo+Pj4+Pj4gSXQgbWFpbmx5IHByb3ZpZGVzIHBpbm5lZCBtZW1vcnks
IGNhbiBiZSB1c2VmdWwgZm9yICBmdXR1cmUgdXNlIGNhc2VzDQo+Pj4+Pj4gd2hlcmUgdXBkYXRp
bmcgdXNlciBtZW1vcnkgaW4ga2VybmVsIGNvbnRleHQgY2FuIGJlIGZhc3Qgb3IgbmVlZHMgdG8N
Cj4+Pj4+PiBhdm9pZCBwYWdlZmF1bHRzLg0KPj4+Pj4gDQo+Pj4+PiAnbWlnaHQgYmUgdXNlZnVs
JyBpdCBub3QgZ29vZCBlbm91Z2ggYSBqdXN0aWZpY2F0aW9uLiBBbHNvLCBJIGRvbid0DQo+Pj4+
PiB0aGluayB5b3UgYWN0dWFsbHkgbmVlZCB0aGlzLg0KPj4+PiANCj4+Pj4gV2lsbCBnZXQgYmFj
ayB3aXRoIGRhdGFiYXNlIGJlbmNobWFyayByZXN1bHRzIHVzaW5nIHJzZXEgQVBJIGZvciBzY2hl
ZHVsZXIgdGltZSBleHRlbnNpb24uDQo+Pj4gU29ycnkgYWJvdXQgdGhlIGRlbGF5IGluIHJlc3Bv
bnNlLg0KPj4+IEhlcmUgYXJlIHRoZSBkYXRhYmFzZSBzd2luZ2JlbmNoIG51bWJlcnMgICAtIGlu
Y2x1ZGVzIHJlc3VsdHMgd2l0aCB1c2Ugb2YgcnNlcSBBUEkuDQo+Pj4gVGVzdCByZXN1bHRzOg0K
Pj4+ID09PT09PT09PQ0KPj4+IFRlc3Qgc3lzdGVtIDIgc29ja2V0IEFNRCBHZW5vYQ0KPj4+ICBT
d2luZ2JlbmNoIC0gc3RhbmRhcmQgZGF0YWJhc2UgYmVuY2htYXJrDQo+Pj4gQ2FjaGVkKGRhdGFi
YXNlIGZpbGVzIG9uIHRtcGZzKSBydW4sIHdpdGggMTAwMCBjbGllbnRzLg0KPj4+IEJhc2VsaW5l
KFdpdGhvdXQgU2NoZWQgdGltZSBleHRlbnNpb24pOiAgOTlLIFNRTCBleGVjL3NlYw0KPj4+IFdp
dGggU2NoZWQgdGltZSBleHRlbnNpb246DQo+Pj4gU2hhcmVkIHN0cnVjdHVyZSBBUEkgdXNlOiAx
NTNLIFNRTCBleGVjL3NlYyAgKFByZXZpb3VzbHkgcmVwb3J0ZWQpDQo+Pj4gNTUlIGltcHJvdmVt
ZW50IGluIHRocm91Z2hwdXQuDQo+Pj4gUmVzdGFydGFibGUgc2VxdWVuY2VzIEFQSSB1c2U6IDE0
N0sgU1FMIGV4ZWMvc2VjDQo+Pj4gIDQ4JSBpbXByb3ZlbWVudCBpbiB0aHJvdWdocHV0DQo+Pj4g
V2hpbGUgYm90aCBzaG93IGdvb2QgcGVyZm9ybWFuY2UgYmVuZWZpdCB3aXRoIHNjaGVkdWxlciB0
aW1lIGV4dGVuc2lvbiwNCj4+PiB0aGVyZSBpcyBhIDclIGRpZmZlcmVuY2UgaW4gdGhyb3VnaHB1
dCBiZXR3ZWVuIFNoYXJlZCBzdHJ1Y3R1cmUgJiBSZXN0YXJ0YWJsZSBzZXF1ZW5jZXMgQVBJLg0K
Pj4+IFVzZSBvZiBzaGFyZWQgc3RydWN0dXJlIGlzIGZhc3Rlci4NCj4+IA0KPj4gQ2FuIHlvdSBz
aGFyZSB0aGUgY29kZSBmb3IgYm90aCB0ZXN0IGNhc2VzID8gQW5kIGRvIHlvdSBoYXZlIHJlbGV2
YW50DQo+PiBwZXJmIHByb2ZpbGUgc2hvd2luZyB3aGVyZSB0aW1lIGlzIHNwZW50ID8NCj4+IA0K
Pj4gVGhhbmtzLA0KPj4gDQo+PiBNYXRoaWV1DQo+PiANCj4gDQo+IFRoZSBjaGFuZ2VzIGFyZSBp
biB0aGUgZGF0YWJhc2UoT3JhY2xlIERCKS4gDQo+IFRoZSB0ZXN0IGlzIHN3aW5nYmVuY2guIGh0
dHBzOi8vd3d3LmRvbWluaWNnaWxlcy5jb20vZG93bmxvYWRzLw0KPiANCj4gT3VyIGRhdGFiYXNl
IHRlYW0gaXMgcnVubmluZyB0aGUgYmVuY2htYXJrLiBJIGhhdmUgcmVxdWVzdGVkIHRoZW0gdG8g
cmVwZWF0IHRoZSB0ZXN0IGFuZCANCj4gY2FwdHVyZSBwZXJmIHByb2ZpbGUuDQo+IA0KDQpVcGRh
dGUgYWJvdXQgdGhlIGRhdGFiYXNlIHRlc3RpbmcgY29tcGFyaW5nIHBlcmZvcm1hbmNlIGRpZmZl
cmVuY2UgYmV0d2VlbiB0aGUgdHdvIEFQSXMNClNoYXJlZCBzdHJ1Y3R1cmUgYW5kIFJzZXEuIA0K
DQpUaGUgd29ya2xvYWQgc2hvd3MgdmFyaWF0aW9ucyBpbiB0aGUgcnVucy4gUmVwZWF0aW5nIHRo
ZSB0ZXN0cyBudW1iZXIgb2YgdGltZXMgc2hvd3MgdGhlDQpQZXJmb3JtYW5jZSBvbiBhdmVyYWdl
IGlzIHNpbWlsYXIgd2l0aCB1c2Ugb2YgZWl0aGVyIEFQSXMgdG8gcmVxdWVzdCBTY2hlZHVsZXIg
dGltZSBleHRlbnNpb24uDQoNCkhlIHNoYXJlZCBmb2xsb3dpbmcgcmVzdWx0cyBmcm9tIHRoZSBM
b2NrIHRhYmxlIGRhdGFiYXNlIHdvcmtsb2FkLCB3aGljaCBzaW11bGF0ZXMgU1FMIHF1ZXJ5IA0K
ZXhlY3V0aW9uLiBUaGlzIHNob3dzIG1pbiwgbWF4LCBtZWRpYW4gYW5kIGF2ZXJhZ2Ugb2YgNSBy
dW5zIHdpdGggIHNjaGVkdWxlciB0aW1lIGV4dGVuc2lvbiANCmVuYWJsZWQgYW5kIGRpc2FibGVk
Lg0KDQpMb2NrdGFibGUgdGVzdCgjIG9mIHF1ZXJ5IGV4ZWN1dGlvbnMgcGVyIHNlYykuDQpSdW4J
CQkJCU1pbgkJCU1heAkJCU1lZGlhbgkJQXZlcmFnZQ0KPT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCkRpc2FibGVkCQkJ
CTE2Miw5MTEuMTAJMTg3LDU0My40MAkxNzcsMDM1LjMwCTE3NSw2NzUuMjQoQmFzZWxpbmUpDQpF
bmFibGVkKFNoYXJlZCBzdHJ1Y3QpCTE2Nyw4OTYuMjAJMjM3LDcwOS41MAkxOTEsMjY5LjUwCTE5
NSwxMTMuODAoKzExJSkNCkVuYWJsZWQoUnNlcSkJCTE2Niw0MTAuNDAJMjUxLDM0OS4zMAkxOTEs
OTE3LjYwCTE5OSw3NDAuNDAoKzEzJSkNCg0KSW4gdGhpcyBjYXNlIFJzZXEgc2hvd3MgYmV0dGVy
IHBlcmZvcm1hbmNlLg0KDQpUaGUgY29uY2x1c2lvbiBzZWVtcyB0byBiZSBib3RoIEFQSXMgcGVy
Zm9ybSBzaW1pbGFybHkuIA0KDQpIb3cgZG8gd2UgcHJvY2VlZD8NCldlL291ciBEYXRhYmFzZSB0
ZWFtIHdhbnRzIHRoZSBzY2hlZHVsZXIgdGltZSBleHRlbnNpb24gZmVhdHVyZSBpbnRlZ3JhdGVk
Lg0KTm90IHBhcnRpY3VsYXIgYWJvdXQgdGhlIFNoYXJlZCBzdHJ1Y3R1cmUgQVBJIGZvciB0aGlz
LiANCg0KSSBjYW4gc3VibWl0IHRoZSBSc2VxIGJhc2VkIHBhdGNoIFBldGVyWiBwcm9wb3NlZC4g
VGhlICBjb3B5X2Zyb20vdG9fdXNlcigpIGNhbGxzDQpjYW4gYmUgbW9kaWZpZWQgdG8gdXNlIHRo
ZSBub2ZhdWx0IHZlcnNpb24uDQoNCg0KPiBJIHdhcyB0cnlpbmcgdG8gcmVwcm9kdWNlIHRoZSBw
ZXJmb3JtYW5jZSBkaWZmZXJlbmNlIHVzaW5nIGEgbWljcm9iZW5jaG1hcmsuIA0KPiBVc2VkIGEg
bW9kaWZpZWQgdmVyc2lvbiBvZiB0aGUgdGVzdChleHRlbmQtc2NoZWQuYykgdGhlIFN0ZXZlbiBS
b3N0ZWTigJlzIHBvc3RlZCBoZXJlIA0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIw
MjMxMDI1MDU0MjE5LjFhY2FhM2RkQGdhbmRhbGYubG9jYWwuaG9tZS8NCi4uLg0KPiANCj4gVGhl
IHRlc3QgaW5jcmVtZW50cyBhIGNvdW50IGluIHRoZSBzaGFyZWQgZGF0YSBvYmplY3QgaW5kaWNh
dGluZyBudW1iZXIgb2YgdGltZXMgaXQgY291bGQgY29tcGxldGUNCj4gdGhlIGNyaXRpY2FsIHNl
Y3Rpb24uIEhpZ2hlciB0aGUgbnVtYmVyIGlzIGJldHRlci4NCj4gDQo+IFJ1bm5pbmcgdGhpcyB0
ZXN0IG9uIGEgNTAgY29yZSBWTSBzaG93cyBsb3Qgb2YgdmFyaWFuY2UgaW4gdGhlIHJlc3VsdHMu
IEdlbmVyYWxseSB3ZSBzZWUNCj4gcGVyZm9ybWFuY2UgaW1wcm92ZW1lbnQgb2YgNCB0byA2JSB3
aXRoIHVzZSBvZiBlaXRoZXIgQVBJcyBpbiB0aGlzIHRlc3QuDQo+IFVuZm9ydHVuYXRlbHkgSXQg
ZG9lcyBub3Qgc2hvdyAgY29uc2lzdGVudCBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIHR3byBBUElz
Lg0KDQouLi4NCg0KLVByYWthc2g=
