Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608462620E9
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 15:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746460719; cv=fail; b=oHlDWSYlYh0AaCkyk1FUmtBLsDh8l9wqsnkCrLUtHD/PghyH/I8tbz2nAFwXBFICrg5a0uuTco3vzFGZPVonDyKYdvbPuq3rxqZIH1bK1y9q8KqFmi3/via+pSqf5NMGLLZbEFiu5dtyrIv8Ka/l5Qq2CSPgmiNDksG400zeJDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746460719; c=relaxed/simple;
	bh=RcX8qigRAnhlBIt2DPnckFVCEBcSarWhNZT7aDRx4y8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HZLPwEs6XgoE2YZYPpxKCEyRxcLDNHBiq5Ihpi3yNF/O6dtqtCKE6Q/bkzYs9fe8oY4eFfbj5To4+WYI3Ph6PbhFNd1UhWT1vjoy6qen2rQ5whP+mf293fr67wWNt17P5/7Rtp7jWaGUsT2ohRH3Xpcy0N2egN/6f6OvkNXPsfE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QWMP8iR3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Nd9KJLNX; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QWMP8iR3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Nd9KJLNX"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545FumZq022905;
	Mon, 5 May 2025 15:58:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=RcX8qigRAnhlBIt2DPnckFVCEBcSarWhNZT7aDRx4y8=; b=
	QWMP8iR3qHhTF9ATUDmWKir/rCO9A/yJnfh+BChRk848CHzCKiJboe/xPnHd8TJf
	8+IkuHJ59aCsjbFjDap0ulMzr1hSbpETODoepXcGeXTfa00SGD94GcYnBeLthg27
	YoArO+JeYKHGXX58u/IODwYlRadcXxtSrCu+qf/GlW+P/zcYWja7HR6RVFolEGcS
	fgEgpSyY0R4IIQN9JmQ52/9sgDzgyWfYGePsK/EXlEj1fL5Yg0qnsd1cs9oN1EEd
	QWCxTt1IMNh3ppZwjPYS+ZvbryVjamQij9w81GoD5nYeE2Bd2CwxutfKouZusZhC
	TKlHKibftwfG8xY+VLtIhA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46f02v82pf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 05 May 2025 15:58:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 545EoBk5035622;
	Mon, 5 May 2025 15:58:24 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazlp17010006.outbound.protection.outlook.com [40.93.13.6])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46d9ke3vsn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 05 May 2025 15:58:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=skKi0fiKYaE4Ld1Sa8WBn/ToZxeHqKUuGGozwTb4bNG0C4i6Wm2+dl656HDwbFgKmDk75dCv2okhBMq4zlvyHckX+G8VBVmqRL1rdjr+1i2Y7cAceznwvRXTIhRYIFdqRLt/Lc34WX9IOSPWuIlqmdkD/9sSTcHsCKobtog/yKIXTl9jeuIZ3cEPYq4il0o5tDK6eUHT7SkE2TDe1bnhWqGzfuyhvS1CjcOTrqasMGvjDhBELMCzcS6z0vXlZZ3ca/+gsRBCFdZzH3rq+uruk+Ns/odPF9kdLvuvuG5SHMVB5PC23G2gZWEIqadAa1sp2ONtlTNvV4VFuiktqv5BMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RcX8qigRAnhlBIt2DPnckFVCEBcSarWhNZT7aDRx4y8=;
 b=WeMRkbc45RWUNo0ck1vvIWYIdCMW25D4Mggv1aHvRWEM6Bsz+YraMOxU2wWpb6dk9LfMqBuA3cpu8hAc6zNEPSCafibB3DM5IaL39ePiGKLLdl3pW2PV5gxFUW07yQqeDIJtCW7cDksBkPgs6cxTIfZNlHtabtUnoGV8W+3gbthcT+dtDcBeZnDlrmDI0gFZQw44gsYBPnFYa6d5whyYAjg0qzGnSNcqa+aBzmjlFv73/F0/5zEGRZn0gnZTT/+Z0mv2HotrT6z+mTgXpkiwS4ia9wfSo95g48PzBDtOzCmJjV9JIxlsJQc7H7bs4NfXsYjk2qamYXVci4yKza8xcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RcX8qigRAnhlBIt2DPnckFVCEBcSarWhNZT7aDRx4y8=;
 b=Nd9KJLNXGeOK+tYRgOVibB7kdHeQllSGYFhQ4ca1G6lQFi6onlcJu015MyVzs5mjjasQm36l1NXjYbSkO6UnqpiGFRwAZsEhf8fN23/Mikq3Xle2TIG7nZBqEWfh0gAVGg3E35+jrMvvzffx85VnccbQmgUafqNU71mh0nNSMc0=
Received: from IA1PR10MB7309.namprd10.prod.outlook.com (2603:10b6:208:3fe::13)
 by CH3PR10MB6689.namprd10.prod.outlook.com (2603:10b6:610:153::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 15:58:12 +0000
Received: from IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a]) by IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a%4]) with mapi id 15.20.8699.022; Mon, 5 May 2025
 15:58:12 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: Steven Rostedt <rostedt@goodmis.org>
CC: Peter Zijlstra <peterz@infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "mathieu.desnoyers@efficios.com"
	<mathieu.desnoyers@efficios.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "bigeasy@linutronix.de" <bigeasy@linutronix.de>,
        "kprateek.nayak@amd.com"
	<kprateek.nayak@amd.com>
Subject: Re: [PATCH V3 1/4] Sched: Scheduler time slice extension
Thread-Topic: [PATCH V3 1/4] Sched: Scheduler time slice extension
Thread-Index: AQHbu0F1MdTMmRhrrUCPTfzyEjyJ57O/T5aAgAP6VoCAANkZAIAAE2yA
Date: Mon, 5 May 2025 15:58:12 +0000
Message-ID: <4D9FC618-1BD6-4126-8B1D-96ECD497CA90@oracle.com>
References: <20250502015955.3146733-1-prakash.sangappa@oracle.com>
 <20250502015955.3146733-2-prakash.sangappa@oracle.com>
 <20250502090529.GU4198@noisy.programming.kicks-ass.net>
 <20250502090643.3809b6f5@batman.local.home>
 <C3F85063-68B5-4C6D-B95F-27B72DBFA178@oracle.com>
 <20250505104830.36f22a4d@gandalf.local.home>
In-Reply-To: <20250505104830.36f22a4d@gandalf.local.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.500.181.1.5)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR10MB7309:EE_|CH3PR10MB6689:EE_
x-ms-office365-filtering-correlation-id: d3ea42f3-70bf-4db9-2666-08dd8beda385
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MUF3dnRNclArT3hzdFJPK29vcmhlOGdTVmpvd01GWFRtWGxNQm9xVmpzOVZh?=
 =?utf-8?B?YnVXbkdXbmFDNkRIU1MxYWIwQjM3Y2JNOVNwWEovNXA4Z2NKTEFZUjR3c3E0?=
 =?utf-8?B?UXpCMHlJMUJnZ1A4WVhKc0tXVnl4MWNJSkhrYk5SNUJwYWlrSUYxby9iU3Ji?=
 =?utf-8?B?eXhjc0xDNk9EOXRSa0liRUtudkt6aWlsMnZVR3Y0OUJFUDlISmJST01xT1N0?=
 =?utf-8?B?NlpBMzVHMHFEenVlNFVHTnBvMDU4OFlyYXFQZis4T2RzMVRWL3lrbC84emh4?=
 =?utf-8?B?Q1BreG9vdG9QdTM1dDZQRWtNV3VxNjBzTjBiSTEzNDFqSC9veU94dVRIZWNs?=
 =?utf-8?B?Q0FrVlRsWTBQWjRXK1liVlBGZE94S1g5QTlId245RkFJcG5jOGx1a0w2bHFn?=
 =?utf-8?B?RjViRlhEMXVUYnlCOHJRaFhpbUlyUEJyb2h0VlM0TmJGT1J1ZVh0ei9yVkZq?=
 =?utf-8?B?bVVxTWJTaVRRMVhtY1M3NXd5djl4UFVNUnFkejlkdWRlNnhWUjZWREZhZnlR?=
 =?utf-8?B?L3BoQ2l6YlpvalVTVCtrT1BpKyt1V3ZSQ21YWThhOENLODB2ZXFwZDlRR2Fi?=
 =?utf-8?B?OEUxVVhtMEJNaDUxdjJhRElkZ3NyUEkzejloYVJnOGErbTF2dnk5RVpKNSsr?=
 =?utf-8?B?S0NRamJqU1hhVVVPblZKd2VzRy9JVmlTQ0dJSnd3ZDltajk0MGdiWXQzbnQ5?=
 =?utf-8?B?ZjlrenRlaEVORGRINnZ2V05QRW1pWnN6OHdmRVFRUGRLemRQU0tJV0FDcDFR?=
 =?utf-8?B?K09rOWN4WkFiQzgvYVFRVHdSVEVTWXpabkNMS2xJako2KzN6VmczalVjN0Uz?=
 =?utf-8?B?OWo4WmlLSHFxRnVCdWxmbmEyQStDT1ZxemFQNjRML2h5bnNqMTZ6ZFh0blJn?=
 =?utf-8?B?djBBSlR1ejlpTGgyZWJ6WHNpWkJVU0tXWkNIU1FaRmxsQlg5TGJSazV4QWhQ?=
 =?utf-8?B?K2EwdS9xYmtNT0FrSldGNHpyMnZSWmdoa1AwWUZqQURjOThmL2o3QWo4d2g5?=
 =?utf-8?B?U3FwcDdWSmV4TEJkUEphdEtqTFMvWC9pemRHSzh1SE5kaUNUYzFNazB4bHp4?=
 =?utf-8?B?ZndwRmlINGVEKzBqU1VOYnV4dVVsNnhiSXpYRHRzWFpWNEh1Y2NIeVVRYXlm?=
 =?utf-8?B?MkZ2c20ycTdxV2Nmek9NN1lFN3JVMWp6TXB4MmViSkNMUUx0MjhXSUlpdkZF?=
 =?utf-8?B?NlF1OHBxckdvMktEQ2JjeXBqdHdjZVJJSWpYUVFEemRDWUU0MURKTmdWNTNl?=
 =?utf-8?B?Y3JYNFN5ejFqelVTZzFwN2NYOElKdGY4eVllVm5vVzNQYjhibStJQmRwYkpS?=
 =?utf-8?B?N2MwOGx3cmtaQjEyVmJ5c1Q2eldhci95d3B3RTV0TCtVQmdqK0p5YXJZV0xN?=
 =?utf-8?B?UjVRL3NBZGJGUTl1Vlh1bTE1OVdSbUxHQ2FnQk9UMXF6dmdoZWVLbTA4TGRD?=
 =?utf-8?B?c3MyKzVsMnREV092SlFCZjNIWjRuV3RVcW1aYmI5dVA0L0xpVWRDUkNNKzl6?=
 =?utf-8?B?Zm1XOFhpQmZRZjlXOHgzeVk3cnFtOSt5TEVEZmJOTjgvK3dQSE5mQlQvUm96?=
 =?utf-8?B?YVVOTVkrbjN1WjRCT0lkald1c2sxR01BY3lzMWFkQVR0NjhqRzZxV3VlTzI2?=
 =?utf-8?B?U2NnRjdqVmowVEtFRGZSbnhjZ2NreHJGZ0RySjU3bW9oclQwTzg1Z1dkT0x4?=
 =?utf-8?B?Q2tENkhPVDVoVmljRW1yalgyV3Zod3lLVDhXbFVaa0ZHS2lZWVNWbUpJdGkv?=
 =?utf-8?B?eEkzNDFSMjFOTWFWSXFXZWU3VVRQdUQxRHBUQkYrWk1FaGNDK3ExT0xNZmFt?=
 =?utf-8?B?dDc5Sy93NDhOVHVpeFc3d3Jzc2MwOHdmZnBFelIyc0t4YXJoOGNGaUxhOTAv?=
 =?utf-8?B?Yk9PMTlBQXROOXFsZnZEeTJsY0o1a2ZTQWJYalR5SVdlT21DVnlSYkFpbFRo?=
 =?utf-8?B?a1lUR05aUEZBSVdSNkM0YVJBUUtRaitCaHFsVUpBUFRMSFBGQStGeVMwdk41?=
 =?utf-8?Q?XLtcLDYGRdHkV1VxpA4JiWf/ODZ6Gk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR10MB7309.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M29qeVhaNFlpOUVZYThXUkNHcDZBbm5YdTMvSHQ3elpNRTV6Nm5XeTQzRGNW?=
 =?utf-8?B?d3VXR3lkaEZSUmU5QUUwMzk5ZE81UzkwUmJmSEVyTWl0Smt3dFNoWW9EVUhv?=
 =?utf-8?B?RmhjdHlRcXZvVlVvSU5ucTNFa3J2N0p2RFVzaWtOcFRjazJRTUVGVU4veXkr?=
 =?utf-8?B?T2VUNVo0eFZsTkIwYTR5S2pySEFhMUhSVVY4bDZRNVA4ajBoVHhsUWcyZEpj?=
 =?utf-8?B?NUxGSFhsbGI2Y01lM0VSRkhQd2NWQjFrakREV3RVc3ordHEyMFIyZVEzY2N4?=
 =?utf-8?B?VFdRVC9SdDQ2TlFNVlBZRWFKdGRYN3Q5Z0t3RmsrM1NZS0dLSHVDdkRUaStx?=
 =?utf-8?B?U2UwODU4VklRR2M5dzMrSnBZNGxWeDJ3NzVzSDhQbEFINEJiZWhoRm9oYnpO?=
 =?utf-8?B?OTZkd2tHVnVFb1RYWUpyMThSUlNpWTVPNHBxY0dwMEVZcUtyVm1qN0NKdCtC?=
 =?utf-8?B?b1RUOGRnTjdQU3gxSDl0UkZITVE0Ym9TeVJWLzFObzNBd2graVNITEdBRnpU?=
 =?utf-8?B?VXVURkMwd293ZDQ0dHY0bG5vdjJGQmxLMGRXSldXNFovUDNLNkVVb3JQT21o?=
 =?utf-8?B?QkhjWnkvVDF0VEhsckdXUWFrTzBvS1JCQUcrYUdJMzgzMzZJMFRHY3R4cG00?=
 =?utf-8?B?Yi9TWFBXTG1qUHZPWklva0E0WjBFL0x3bDZIMGs2V0F4NUh5WVJ6U1RHZG9r?=
 =?utf-8?B?RDFzcVVDRExoSlJScHBLSjF4OU4vL2RxaE5LVEwvR1NxZDFrR2xWbGxDQVZi?=
 =?utf-8?B?SnRGN1Z2Q0FpVS9HaGIySm9DM3c3QkJWSmo0OUNTVmhyb0dmbXJHbW8zdUlF?=
 =?utf-8?B?MU5nTi8wZVllVFBUem9nT1NIWU93Uk8vYjNKMDZETFI0YTVWWW1JQ3dwcVgy?=
 =?utf-8?B?dVlJOUszR0V4Z3NyVjR5Zy9ubXhUTmNsZ3NlNHRPL1dpU2Fwd1dBUzBrc20v?=
 =?utf-8?B?Y0NXNmVLb3JJdis0TEp1VUNrK2hJbS9QV29PdFZqaTJiM2Fzb2gvRkNpQjFN?=
 =?utf-8?B?cUtQZEVoYVhadm9xMDMvSThMcXdOUUJiN0VNVmFDMjBCS3laZkVhTTQ1VWVv?=
 =?utf-8?B?aWVRbmsvMVRXbzhZRVJHckx0dWpkY0V3eTN4YTZZQ2J2SXBXak5BYmJlYWFJ?=
 =?utf-8?B?UEY5aFExSXNucXpadDZXcVpiZkV5QVdDdFYxZmEvbWRDWElDREp4dmNOY0h0?=
 =?utf-8?B?RmlMUDh3M3AwZTJwdlV0OHgvODZNRHBDbS9CNkpyeXBzdFYxQzh5Tmd6T1hJ?=
 =?utf-8?B?K1ZnVnhONGZnQ0xoKzgzMlJ0R25lQ2JZTG5IS2tsbnAxOXd2UXFVMjNCdWZQ?=
 =?utf-8?B?ZGlQWlFNZnlQYzRuWEpjbnRzZ25uaEI0aCtheVJmcW53N1ExU1dMSCtBK0Rl?=
 =?utf-8?B?VUlHTFhlMDErOVJKWGFPWGV6RFRBQnVOMlhSUWFBYjNKMWpJSHNGS3AyeXJX?=
 =?utf-8?B?NThvbUtXN2FtZWllNzR2RjRFZTlUcFc2ejQzamEzVzNrYW9rSFAwQWN4YVBs?=
 =?utf-8?B?cWVMVnlyYWpCbDVTZHNHVHBqREdqbzNWclVML1QxMnN3cTJZTWlqTzlWaDhW?=
 =?utf-8?B?RWxHTW9FWmlXSVpyU1liNkxSanA0bGxXRHNJVEt1QzBnbTl4NmxndW5xMXd6?=
 =?utf-8?B?Z2dreGVLVlB4SmpEaXBZcTE3dDJVV0p0YzlhbGFmUWllTmlVZmM4Nno4L3RD?=
 =?utf-8?B?Z21DZGRTU2hKUWxHSm41UXRLbDk1RUkzK2lxZEtBYWVIeFI4amhldUplaTlZ?=
 =?utf-8?B?Y0NxelloeC93dGw3WE9QT2J0L2xwVk5PSlZLZkxtRzAwbjRtU0VOOGo0Zy9j?=
 =?utf-8?B?ZWtkYUJjQ3NQNlN0a2FjOWRwT3lrOUU2NEFyMVh3QUFOUk5rRzFtM1Yyd2ZR?=
 =?utf-8?B?Z0dJeVN0cFJRR1lNdkFLbkkxc3laMXRteTk3ZzhQWndEM1FpcDAwL2s3VEJi?=
 =?utf-8?B?VzNTMFUwTlN0SVhqcE5ZV204aW9BRUR1Vk5RS2lGUGUvZVFlSjg1ck0wcEx5?=
 =?utf-8?B?VkRKRGFvdTQ1OTdWdmlBWGQ5YXQrSVloc21neWhOZFBZQVZTcTRBbFNadTFR?=
 =?utf-8?B?cFBOeWF2N3lIVkFtN0xLcFJsVU56eHZoQXNzTEVBc1NrTUh1YmEzVEVKRno0?=
 =?utf-8?B?aitWUmk5R29hN2lIUy9oRk14M2t2eHEyNVBzaEFUVmxYdnVCOFlKN08zNUxr?=
 =?utf-8?Q?36ccwU+s1AttBGTgzb+0eWU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F05FE7BBA758474A80DDE04DD84D27B4@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LOCH8JpQeBeyA2Na79CyGHFGMgNE6+iWUyi1PTptFGR0MJRwzxUa421f8rufEmXCHpZp+w4Wcs0qYjo/ffXFbnXBP3gPpkra0y5VZ+1qEe5byC2de6Qd4FXI/ElylxZyJC05gLTqZOUD1LxqFxN4EewiChh3XrJJDl6C4YeCfLBTOsGCJcr58c/xVeBfgq7XcjUlo0ak7tmoDRLqWzx5rohXSzB7kUUD25drar0IJSuA/mplBpAQE/JJvS9b4nAJ2lUOqLXDfHbTn1Z35/IO75cOP5ormLHQGQIPZFGIx9tHGFbDNrZvRw4FE2W+CRbn3hBuP/66ixWfYcE7dgLQgD/9U1l0FZhuiErEQrscXHnNJbg5yUCuqeSqSt2qojw13t7Pu2FthJtrrRnhNGlQmA38wYADoR0mw/x8coR+JV8ZDo4DescyGU2G8jFxuP/HlSy1Xo4LXktNSqC3e/EyF+/k1Yx1ufmccKhIyCj0Goqmy7QmusZJSZ5WoQeY1IPllF1QMnWx04lQWAop8xfEJOI3XJ8HZNOztKX76RpOkK7lNYprhgXejxFmVH1leNHRoM7/P8P88i2fF0C8UmC3JXrCYTmdVrsbAiYsyczC55k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR10MB7309.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3ea42f3-70bf-4db9-2666-08dd8beda385
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2025 15:58:12.3162
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A1o1liSwrGaQ502VuYkpH6OkZWtUATCz33FF3Fj1bvmcn6ohm3ILwFAemjwWNIHtqqzwrtLT8QAXBEHUJe/k0m+mCUCxJMBvQqJxupbHs98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6689
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_07,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505050152
X-Authority-Analysis: v=2.4 cv=AKbg9L90 c=1 sm=1 tr=0 ts=6818e021 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=meVymXHHAAAA:8 a=yPCof4ZbAAAA:8 a=s5Cf6NlxxO4kBW-FiCsA:9 a=QEXdDO2ut3YA:10 a=2JgSa4NbpEOStq-L5dxp:22 cc=ntf awl=host:13130
X-Proofpoint-GUID: 28g-SMWVd1qhsz62yswRWaGO16eBwbGC
X-Proofpoint-ORIG-GUID: 28g-SMWVd1qhsz62yswRWaGO16eBwbGC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDE1MSBTYWx0ZWRfXwzoFYIHd9k1H QDMXyUZStFc0Q5m40GHqAbudvW7IglQpR/AWG2mTm0dIth4Rgf4kcaweEStdbdiwI7/skVitbaw OsiK8acFyPUvONXNhjSW6UOyyppP2De9l1lZWcTpLu72S+jaJjRNiYiFRTYDOM3IudxIl0B/gCj
 Lulfu816BNGbfGqV3MIci598mrfMVXzPBFL9rUgX8EFkwm9gkx4TrzMh8lZvDXnhAVagpMmP5IK NBJUVx5xWOVK7X+fdyb4O9zGXsuch92Tj5XO4A5gAU8vgQbD6ZFZU/thMSKyskWMeqQi2uWFAf2 ObQ6FdUYZUlPa/KmP3+hPQOksptb9C9H4+IehiQFgiIx5eLEESX3YceLen3me34TCllT0c8WMOC
 LN94Y39dtCtwL6mVQiWFaflmLqt+Labf5dMKktahd38Y96iuZ2DB64ue36OrNYrnswjvMfb4

DQoNCj4gT24gTWF5IDUsIDIwMjUsIGF0IDc6NDjigK9BTSwgU3RldmVuIFJvc3RlZHQgPHJvc3Rl
ZHRAZ29vZG1pcy5vcmc+IHdyb3RlOg0KPiANCj4gT24gTW9uLCA1IE1heSAyMDI1IDAxOjUxOjM5
ICswMDAwDQo+IFByYWthc2ggU2FuZ2FwcGEgPHByYWthc2guc2FuZ2FwcGFAb3JhY2xlLmNvbT4g
d3JvdGU6DQo+IA0KPj4+IEkgY291bnRlcmVkIHRoYXQgdGhpcyAib3B0aW1pemF0aW9uIiB3b3Vs
ZCBvbmx5IGFmZmVjdCB0aG9zZSB0aGF0IHVzZQ0KPj4+IHRoZSBleHRlbmRlZCB0aW1lIHNsaWNl
IGFuZCB3b3VsZCBub3QgY2F1c2UgYW55IGlzc3VlcyB3aXRoIGN1cnJlbnQNCj4+PiBhcHBsaWNh
dGlvbnMgdGhhdCBkZXBlbmQgb24gaXRzIGN1cnJlbnQgc2VtYW50aWNzLiAgDQo+PiANCj4+IFN0
aWxsIHdvdWxkbuKAmXQgIHRoYXQgYWZmZWN0IHBlcmZvcm1hbmNlIG9mIHRoZSBhcHBsaWNhdGlv
biB1c2luZyB0aGUgZXh0ZW5kZWQgdGltZSBzbGljZSBvcHRpbWl6YXRpb24/DQo+PiBBIHNjaGVk
X3lpZWxkKCkgIGNvdWxkIGVuZCB1cCBpbiBkb19zY2hlZF95aWVsZCgpLCBpZiDigJhzaGVkX3Rp
bWVfZGVsYXknIGlzIG5vdCBzZXQgYXMgdGhlIHRocmVhZCBoYWQgYmVlbiByZXNjaGVkdWxlZC4N
Cj4gDQo+IFNvIEkgaGF2ZW4ndCB0YWtlbiBhIGRlZXBlciBsb29rIGF0IHlvdXIgcGF0Y2hlcywg
YnV0IHRoZSBwYXRjaGVzIEkgaGFkLA0KPiBvbmUgYml0IHdhcyByZXNlcnZlZCB0byBsZXQgdGhl
IHRhc2sga25vdyB0aGF0IGl0IHJlY2VpdmVkIGFuIGV4dGVuZGVkIHRpbWUNCj4gc2xpY2UgaXQg
c2hvdWxkIHJlc2NoZWR1bGUgYXMgc29vbiBhcyBwb3NzaWJsZS4gVGhlIHRhc2sgc2hvdWxkIG9u
bHkgY2FsbA0KPiB0aGUgc3lzdGVtIGNhbGwgYWZ0ZXIgcmVsZWFzaW5nIHRoZSBjcml0aWNhbCBz
ZWN0aW9uIElGRiB0aGUga2VybmVsDQo+IGV4dGVuZGVkIGl0cyB0aW1lIHNsaWNlLg0KDQpZZXMg
dGhlIGFwcGxpY2F0aW9uIHdvdWxkIG9ubHkgY2FsbCB0aGV5IHN5c3RlbSBjYWxsIHRvIHlpZWxk
IGNwdSwgaWYgdGhlIGV4dGVuc2lvbiBpcyBncmFudGVkLiANCg0KVGhlIOKAmFJTRVFfQ1NfRkxB
R19ERUxBWV9SRVNDSEVE4oCZIGJpdCBpbiB0aGUg4oCYcnNlceKAmSBzdHJ1Y3R1cmUgIGlzIGNs
ZWFyZWQgd2hlbiB0aGUgDQp0aW1lIGV4dGVuc2lvbiBpcyBncmFudGVkLiBUaGlzIHdvdWxkIGlu
ZGljYXRlIHRvIHRoZSBhcHBsaWNhdGlvbiB0aGF0IGEgdGltZSBleHRlbnNpb24gd2FzDQpncmFu
dGVkLiBUaGUgYXBwbGljYXRpb24gaXMgZXhwZWN0ZWQgdG8gY2FsbCB0aGUgc3lzdGVtIGNhbGwg
aWYgdGhpcyBiaXQgZ290IGNsZWFyZWQuDQoNCkhvd2V2ZXIsIEl0IGlzIHBvc3NpYmxlIHRoYXQg
dGhlIHRocmVhZCBnZXRzIHJlc2NoZWR1bGVkIHdpdGhpbiB0aGUgZXh0ZW5kZWQgdGltZSB3aW5k
b3cgZHVlIA0KdG8gYW5vdGhlciB3YWtldXAgb3IgcnVudGltZSBleHBpcnksIHdoaWNoIHRoZSB1
c2VyIHRocmVhZCB3b3VsZCBub3Qga25vdyB1bmxlc3Mgd2UgYWRkDQphbm90aGVyIGJpdCB0byBp
bmRpY2F0ZSBpdCBnb3QgcmVzY2hlZHVsZWQgaW4gdGhlIGV4dGVuZGVkIHRpbWUuIEFsc28sIGlm
IHRoZSB0YXNr4oCZcyBjcml0aWNhbCBzZWN0aW9uDQpyYW4gbG9uZ2VyIGFuZCB0aGUgaHJ0aWNr
IHJlc2NoZWR1bGVkIHRoZSB0aHJlYWQsIHRoZSBhcHBsaWNhdGlvbiB3b3VsZCBub3Qga25vdy4N
Cg0KT3Igd2UgbmVlZCB0byBndWFyYW50ZWUgdGhlIHRocmVhZCB3aWxsIG5vdCBnZXQgcmVzY2hl
ZHVsZWQgaW4gdGhlIGV4dGVuZGVkIHRpbWU/DQoNCkkgYmVsaWV2ZSBpdCB3b3VsZCBiZSBzYW1l
IHdpdGggeW91ciBwYXRjaCBhbHNvLiANCg0KLVByYWthc2gNCg0KPiANCj4gQXMgaXQgc2hvdWxk
bid0IGhhdmUgdG8gZG8gYSBzeXN0ZW0gY2FsbCBpZiB0aGUga2VybmVsIGRpZG4ndCBleHRlbmQg
aXQuDQo+IE90aGVyd2lzZSB3aGF0J3MgdGhlIHB1cnBvc2Ugb2YgdGhpcyBmZWF0dXJlIGlmIGl0
IGlzIGFsd2F5cyBkb2luZyBzeXN0ZW0NCj4gY2FsbHMgYWZ0ZXIgbGVhdmluZyB0aGUgY3JpdGlj
YWwgc2VjdGlvbi4NCj4gDQo+IC0tIFN0ZXZlDQoNCg==
