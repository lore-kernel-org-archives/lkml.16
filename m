Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61461CAB3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 00:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751330928; cv=fail; b=DYC5WbWiZIevln9oIObwFzeVdwt6XsO5YmFOqsIb4pmRyb/72xrtWTrgF3EopJWODiuOYJtrJXoSPr4LCsjS/LNUKSkIu8RXE+JzfX7LqUfgmMUh1LIWcvzcjVhIIsxvJEUzhCUrIDoiLVdnIhIJwm7twmXL1Gq9wRhpesf94pQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751330928; c=relaxed/simple;
	bh=3LCLkzANUIwAbYoRhTDDVDIJ/UewMq0joeHeFDRVSB0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=U3RqYuQ1lpBvwM/TkhR1YfouaWtf7cyCqLxO+aAJ0YacPwMOst6pfMi8q0+Zgi1Q7cS1jPbetD7BQRAQLu6A5phpwsfJrI6WnXxv15BbXqlrRaJfAGIZijtct3laPG3K6hZnI72v5pEqn2JufMv24VjkQ6snQfY9gsSdTAHH7fU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=N5erPzAk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gzyHFvhL; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="N5erPzAk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gzyHFvhL"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UIC4HD008885;
	Tue, 1 Jul 2025 00:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=3LCLkzANUIwAbYoRhTDDVDIJ/UewMq0joeHeFDRVSB0=; b=
	N5erPzAkwuuyxOzNJTBEj4PLkzBXomKoWgPhUWYESfF7TeqtCz/4KvZMG6XIxZW4
	dkJEpbvteAtt/Q7lVw+zqdEHHkWgLqie/QAmm6jAqBP6jBbVzQPKYUDPA39ZtdlU
	OAqCD0ESUa83ejIhwEv+bk43VeBt59W9/THEzI+e2G33h0cNCv2rShkvvPD6nbVS
	smNUUWIMHje5TPepFt5LuYBzR5I3iJ+OrZbNhUXmCAgvN2AEBvLgrvaIZE5IvpXs
	0MJBRxBL45+twxIET/6CsMzzdR/ygbwiQ0K042KR8doKlN2yGUC1hIdRFrEAjI0o
	XXajaide9vrJHaivd1mkcA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j766bncx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 00:48:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55UN99nq017442;
	Tue, 1 Jul 2025 00:48:36 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47jy1dtfta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 00:48:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o1cvBbW+f4rWU5iWaZvjaW5IECaqVbK9eoIF+9NHy7MkWoZ0UeNw0maJzI3e6viVlMuW8k1SMZuUFUTBZSPnt5LBWmB/coNftlBL3pjtc9iavu0s/vi1kidfgh4Ke+VSFEwtMAav30OVUKyJPDK2AkDBbhtkjo3NgqYtFDxbSObunC5JaN8G5LPFtzDCJ4rhA6rEIHrnQtjYvKshbwBfLboorsMs8dTRp4YksYKGtcvMEyIRBasoVloFCcIav7DQsCGRr8Tp2yZsYIPgramBU1CNwjkdex5Kyw7BWuGx1ePFKNAW6tKOtjodCAtDWWizP/23gSBKQXHNTFhSgcPH2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3LCLkzANUIwAbYoRhTDDVDIJ/UewMq0joeHeFDRVSB0=;
 b=pGOEA6VjkHP60fVUBLAsGOWlSkEcPcCKoSmku+/7PB+H+VPPQuf+Jr26iPQ+EfW1yFncho6B8MJMqF1+hyr+re9CP7djyw4YkaUY4xdCy5d72275FaM5polLQbL5eczU5NwpfcEgm9d3VIOYAGk6ywZdu59wcdDmrHBeh/5wsPMl2s90vYIQH+26DC5mbyYgRE7le+8lAUVpyML/k7FLf9+/OdXr0UDHeW5xcs9QQFHqiESC3iFRQhuScGc6wN2fOYGJOA+emZzuiXqjkPBH9epgIjQ+Qj12OYBLLwwW3T/pNPfx4dgCvJvyhUBWRxaqjra2U4SiqqGy1rg2se6vJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3LCLkzANUIwAbYoRhTDDVDIJ/UewMq0joeHeFDRVSB0=;
 b=gzyHFvhLU690Qd+3U2yXVoEgq534lF2VKgwG7+CEffuXhgmmZn/stTYNg9qPjaQrWpsci1Qy1VE7sEeZgPWGaU+Y7vp8VUptiv+E3CZB/T9GCnB8EHkyyq/UFPnjrZDsGe8fmep8fGstW17OpOnf+MJaT2Lst8uEnukqzQcI4Bw=
Received: from IA1PR10MB7309.namprd10.prod.outlook.com (2603:10b6:208:3fe::13)
 by CY5PR10MB6046.namprd10.prod.outlook.com (2603:10b6:930:3d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 00:48:30 +0000
Received: from IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a]) by IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a%2]) with mapi id 15.20.8880.021; Tue, 1 Jul 2025
 00:48:30 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: Steven Rostedt <rostedt@goodmis.org>
CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "peterz@infradead.org" <peterz@infradead.org>,
        "mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "kprateek.nayak@amd.com"
	<kprateek.nayak@amd.com>,
        "vineethr@linux.ibm.com" <vineethr@linux.ibm.com>
Subject: Re: [PATCH V5 1/6] Sched: Scheduler time slice extension
Thread-Topic: [PATCH V5 1/6] Sched: Scheduler time slice extension
Thread-Index:
 AQHb1V0mtwlUIwQHSki21OTBoge6R7PzFm+AgAArT4CAAB/SgIAH9WMAgAAKn4CAAT3HgIAAArsAgB/23oA=
Date: Tue, 1 Jul 2025 00:48:30 +0000
Message-ID: <DA7ED2D1-BCF3-486F-83FC-51CC8AF09FEE@oracle.com>
References: <20250603233654.1838967-1-prakash.sangappa@oracle.com>
 <20250603233654.1838967-2-prakash.sangappa@oracle.com>
 <20250604103106.1465f847@gandalf.local.home>
 <20250604145433.KCPMF8zm@linutronix.de>
 <80120491-7F90-4171-9FB8-9FE89B09F728@oracle.com>
 <20250604192327.sVjt6c4u@linutronix.de>
 <20250609165532.3265e142@gandalf.local.home>
 <20250609173333.6e0b6a55@gandalf.local.home>
 <7BA85550-4E33-4C5B-B855-716512D2105E@oracle.com>
 <20250610124042.46b54b51@gandalf.local.home>
In-Reply-To: <20250610124042.46b54b51@gandalf.local.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR10MB7309:EE_|CY5PR10MB6046:EE_
x-ms-office365-filtering-correlation-id: 143e8405-d9cf-474c-a408-08ddb838ffb3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cEJLbnBCVjJVRnA5SDFnZWdkVjlZS1lScjRZa1l6UDNwZERRMk5YUFFwRmpC?=
 =?utf-8?B?NHVuUmZxaWtabG9xZWdwUUVDZmd3MjQ4YUVVZ0FHRFZOM1hCaVJXd1dHS1Zv?=
 =?utf-8?B?VmIwZ2ZZSkFOc1ltbENheUwrSzMybHZaY1VDdWtxK2RwU1czc2E2eTE4RlN1?=
 =?utf-8?B?MVhKaGVENTBHbDRJejByR29LN2RsMGZZbWZ5ZU1iZkFWSDZCVkRBdE1KQmhv?=
 =?utf-8?B?WjFWNXRGd093YXZNK0lMSllqa2JVS0VRZDlJMWliYjBkWnMwR0dONW9vOFZV?=
 =?utf-8?B?cDYzem1QMGltY0hydytqbEZLMng0UWNPVGlEWkxVRUg4TGRSMjJ4NGttR3Vy?=
 =?utf-8?B?MmFsaUFwQTcyNEFiVWRDK0d3WGlEWmxJakxDdEdjUTJoQnZJQzVYSG1UWVo4?=
 =?utf-8?B?U0xmcWh0SDlVWWtDM3lkckh4ZXJOUnlZN0UwSlNnSjNJbk82MnpvN2hFSWor?=
 =?utf-8?B?cmU2TUZxYVVBMVJtNzZwY2hGYTkxeSswTDNtemJ0RGlPaFl6c1VKUG5zMFZu?=
 =?utf-8?B?a2Z0TnFJZHFHM0dYaE5yY2xCNlBYTDFqVkpwWXpERFkvb0RBNDB5MHBKbzNj?=
 =?utf-8?B?bmJiOXlNeERreFBxQ1ZoVUo2WmszUmtlVnpnbGk4Sm5Yd1AyMkdzQnhlWVl5?=
 =?utf-8?B?OGs1YUN3N3ZQRGxzQ0ptcmowbW96QkFmbTFQLzE4RnFCSGN4ZFo1ZHlmRVhy?=
 =?utf-8?B?UjJQemRvMDNRMi9oeDFHaU5CNDlINGNwQ2ZhVkx4YVJ1czhDaERkVy80ZTNI?=
 =?utf-8?B?QUhrN1U1aTBKM2UyOCtxLzZNVFViWDVwQWN0cDN6TDI0T3FKUFh3NzNLOWQ4?=
 =?utf-8?B?ZlhkL3lBNFR3WWdMaHIrK0lkZENCRTNoaHl5QlVwbEdxQkd4NWFOR3lnaXdm?=
 =?utf-8?B?K1E2MG44OHBZVEFYa2RHTlk0L21hVUhUNTVybjZQaDErczJTS3N5eGFMYUVx?=
 =?utf-8?B?VHc1cTQ3dUVyUmNqTVJBSHAvTFZZYXB5andYb2llZkluZUorRTl2VjI1Sytq?=
 =?utf-8?B?Rm03VWp5c0prcFY5bll0M3F6a2RnWTdBMzhaa3A4elBtWkFraCtLT3RJbDM4?=
 =?utf-8?B?cmIvL1hXVUw3bHdzOXpEbm5QM3FSRUFOdDJtSWlhNVRWVVRLRWhhekx3NWdS?=
 =?utf-8?B?RGFEbWJZT0NWODVKNGI0YUNnOFNOZUpaQjlNRHlHd21ZMk5kYTRFMmx2OS9y?=
 =?utf-8?B?aWZESTBtVGNQN2RPL3FYOVFTdHNSSm9NWEx6MUNhbURkd1c4SW93MkJPeVVj?=
 =?utf-8?B?QVdhV21XdHFFUDFxeGJzYWtDc2U2UVlBU216VkxXRks3NlQvTHVyLzBvQm0w?=
 =?utf-8?B?ME5JOFR0dUN6M0wxenRMUXBpaENLZk1yU3pERS9lZ0pJN0VvYTFVUndPU1R2?=
 =?utf-8?B?TVhIRnZCc2ppTU5WYVllcTlaVG1IS3loYlFLa2cxNnk0ZlBXeHJrWUVvdjMx?=
 =?utf-8?B?SFpxdDZncFA0bTdXUmUwb1cyaE5HU1ovYlF5a2prS3hNK1d0dkhhdTF5VEgw?=
 =?utf-8?B?YkdVWUtZVi9GNUdxa0pTSkZhbjgxZDkrckdSQW1tK2E1QnljdHY0clE0SUVO?=
 =?utf-8?B?MksrL3pVQndEUjRZMENqYXZNWFBCQTh0UFJ4QzcyUnY0aG1GWnhuQzRYbUEv?=
 =?utf-8?B?eUMxcmVUSXh0WGVFWC8zUXowblNBTDhVcHNyRURXV0ZUZ3lvRlZmUzEwRmIr?=
 =?utf-8?B?U3JoMTlFQ01Sd012TnNFeHdURVNwR1p4RFdkNVRDaWE5MzI1QjZ6Tk5VK2J0?=
 =?utf-8?B?Tm1NTjA4Q1hFSDNJU05ndlI4c2VwRE5ScjExeVZDU0tHYWpSU2w0QUxwV3VX?=
 =?utf-8?B?bWRHOVBxeVZUeXc5SzlBTHRPbFNtcFBEWG55L1FGa0s1ZHBlWTVuV0ZwblRJ?=
 =?utf-8?B?QTNJL2RPSnN5SnZhbEZQT0FuSmFWK2hIcHV6TE90Q2xtTjVKNGk4OEx4Tm15?=
 =?utf-8?B?SkZSNGkvcVdwOUk5STdiWDNXR3YrRTN2M0dIcVJrUmxFS01jV24wNEc2OEVW?=
 =?utf-8?Q?EWo1UxOqXukI8cCAwNO2MRFICmjPsw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR10MB7309.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q2dEekUxaE13b1JEcWszcDA3OXZMbmllVDJOQUM3RTBvRGx3aGdqUndqR1dN?=
 =?utf-8?B?OE5ERzVtaC9iamFhejMyTW5KM3lrLzJpQzk0K1VtSkE0c3BudXQ5Y3FzRTlP?=
 =?utf-8?B?NzJwRnBWRmwvK2FmZWJlV2RwVGljbERrSnNhSHVoYlB3NWpIOXhsRFRnMW9m?=
 =?utf-8?B?UlRJeFdFT1JMZjFBYU8yRVBrYXJRdXNlcEFVT3lPMVdEY2Z0MVFNUDlISG95?=
 =?utf-8?B?SEZrV2ZDcnRMT0ZLZnNiNzkvK2habGRDdlk2dnMrUjkrVXFGTEtycmdtSXpX?=
 =?utf-8?B?Q3p5N3l6azEybWhLeFQ5M1BpMk0rUzcyY1lzaW5vVFd2ZFU2SDh1Ymt5N2FW?=
 =?utf-8?B?TmdwaHVmV3NBRldnYitUS3NZbncrQURpcUY3N29jKzlRS3BtYVJtNVZRNVRq?=
 =?utf-8?B?U1dTemJocnJMemVHd1FKMmxOWWpaRklFNXFobi9iYmw0MmFURWlQS3Q2R0I0?=
 =?utf-8?B?ZnMxSitDUXVaR1E2VmFES09LNHlVYlZSdkhlS0JRQmcyTkFVbHVidjZMMk9o?=
 =?utf-8?B?SVI2bEhEbWlTNVAvQi8rcUJhWThZRndLcVVSNy9nOUZWZ2N3S0RVamFVcTFL?=
 =?utf-8?B?ZHFoU3ZMWkEwWUdRVmR3QnRsVFkyOXhYYVFDdkxwWTUxUmpFZDMxaytHMU1V?=
 =?utf-8?B?QnluYmRLTE9RbUU4a0RmeVUvODU0cGVLaTFQby9VcGhLQVRvcS9BSE5nQTRN?=
 =?utf-8?B?Q2pxdHJrcTQ0TndTbXhlSFJ6bHhlOVd4Z3Nlalh4YUVJYVZlZFpwMVlaYlpk?=
 =?utf-8?B?ZXFEc0x2VkwweXNFYmFxSjNVYmhtVWFvVTg1TUZEbGJKUklqeUJPTFd3c3lE?=
 =?utf-8?B?d0pBYkFDSG9ielcwT3hDS1NXbUY5TFRWTXpsdXRXYUQraUFzNmRFWUZrS0hN?=
 =?utf-8?B?R3Q4K2ppbGV6ejA0cVN3WVdhZ3F1SVN4dWdmUVhRcERiTW8zTVYwNmdXSVYx?=
 =?utf-8?B?TVJFZU9ONElaTlM3T3lxd2w3cHI2a0lZL002YXRPVzlvWUJlU3M0VURLNEFF?=
 =?utf-8?B?bVNiM2RoSnoyVmZjVi9GRXlPK1JGQTNMLzQ5ZWNZaXRONVBkMFNORlVSL3Vv?=
 =?utf-8?B?aXh3SFVPMnoydGNQRStKZFc0clJEaW4rc3E3djRWWXc2MCsyZWFJeE9EVGIv?=
 =?utf-8?B?MWhNVHNtSmF2L2QzdnQ1QWJSTXR3K1kyd1A0RDZlU093dzAwMjl0UWd6bnJL?=
 =?utf-8?B?WUVLWjI4ZFNKM2h4c05ocjdYcWdyYk5WcmpTV2Y0MThPNER4UVYrWGJjVUNp?=
 =?utf-8?B?dTFUNG00WjNFR2E4ZDNTc25YYXZrTFpZRDRjZ3AwRllYeS9EWnJqaTNvUUg2?=
 =?utf-8?B?NU9IeXMvNkg5SGhNTnF5endGdktHb2cwZCsxMERHMkZuTjl6WUVVRmpBMlpx?=
 =?utf-8?B?aWd0ekVnMXd0anBiZ2RXeFRZeWxhVmxKZWlHVlVTVHZjeTBieVlVQlJVNnUy?=
 =?utf-8?B?elVLTXgzaFdSWk1QbXpoaHFnaUh4dldOWWh3eUllUlI5a2Z6U1dtblU0WFQ3?=
 =?utf-8?B?VGExa1ZGK0txdk95YWE0amlhV0NqNlA0YU1Xd056RStON29Ic205SGhIYzIz?=
 =?utf-8?B?TlhPRHlqd000Z1VFV0tJQWlpOUNWUDJjaUZ1c2thYWlQRDhGNE1rMTFsemUy?=
 =?utf-8?B?bjYvVDdSWEFoc2NDcHBmTmNGRVYvbkk4UERDQU5EZzFFckZ5b3ROVlA4Vmw3?=
 =?utf-8?B?dTJoSzNqeER1d1c5cll2bFFSUEpHclhwL2xEREVYN0dSN3hMMUxKeGF0MHBF?=
 =?utf-8?B?Y0xvbXhQY0lXU29rNW1Uc1NvaTE1Z2FMekFZWGVEOS9EZnI3L1R6MHcyWEF6?=
 =?utf-8?B?Z04weHlzcFE1VGIwdjljVXlWbk5jdzhvMFNRQmhhVFREanZCY1ZxdWlOQTUy?=
 =?utf-8?B?UHN2TTdpZ0lmNXBqNUtnNXhmeHdVdEJ0Umd2ZFVXU0tOR1RsVXQrV0JWNWg1?=
 =?utf-8?B?UGVtbzlkK0FOYTZDVEhJTE5xQU5YaklVNXlieE5CM3BoTityRG9qQ2ZTNGo4?=
 =?utf-8?B?ejFMaDhpV3lxcjYxNmJlNEVKMGZJYmtqdFViUHRwZFhWdHRlK0M1SmVHVEp0?=
 =?utf-8?B?d080V3F5OCtQZ2tKQmNDenpXdnNQMk5Qa0NXaWdva1dBLzdTZCsvaUs5MkRs?=
 =?utf-8?B?TFoyeWFqZGpzV3poS01KSVlHOXdsRCtJaDEvYUIrM3B5SlJNV1Qxa0NsM3F1?=
 =?utf-8?B?SXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D21D7DD21905684FAC594676B696C34E@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Rujpqtqo4/M8OysVIlA8VzvddCai4jTm1PFd+/YBfnz0Z9vB2vqKMmTT4xcxhPLDcKGGKztFwJbLSlclkIh39ZXrSDV1unSd3u+tMp6P769EU1zSMWhpb7GBWpU+XikmRDnNKwOPnWotmTklD3btj2jmZmgptfZbL06YQguvqkxgqVyPQGKEnEIIhh+l8/0bNz/vJtShkRhZM6UmZyfrnkqXjb7jBsU6CCvMO2hZc09ChodBKV+B0XJLU2MB3zby80X9kMbFaKae5AgUjg84lKDBTTDiO6IN0UM2aRDRidMRIqYhyh3iw/N89G+ZrBMZ5ws2QbW3ecNAxlb87q2KKN1OU+AFocNWXhbbdnCyzaRuqa5Et0tECa6LgdmQhAIy/TcHVxaLn2bCGI/zBgH1D3/8D/IOnt5PTYhgCwJn2GVzZ3nG0VfvpCNWa/jY7BHMykODplBQX4kxrzIZnVwhp1t5Vf4AE/ir6SvTI5/6SftI2rSazkPamVzCVY8YJ6BsAhjF8QOCT/9rawWxW8mr57ViegN4BC1i7OndTdCtg3w367aMEHK7BLAY7mIR/6tUAheS60WUzb9ras4/+IdORNDS3ky0v83x+zusdb4xcgY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR10MB7309.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 143e8405-d9cf-474c-a408-08ddb838ffb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 00:48:30.3779
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uAVZpgytf70s68HR48ayCHYL0ttkL2/W7TiKOnE7U8mIXIHrMUAMxQkwfRWQz3QwyCepWiWoggnIf4yACBZfMGcquqcLtR5FXvInqmz/AKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6046
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_06,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507010003
X-Proofpoint-GUID: vdIFULkevrGbYtg_xYhxyHwec9HIPBze
X-Proofpoint-ORIG-GUID: vdIFULkevrGbYtg_xYhxyHwec9HIPBze
X-Authority-Analysis: v=2.4 cv=b82y4sGx c=1 sm=1 tr=0 ts=68633065 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=meVymXHHAAAA:8 a=ber9UwYpa7Yi_8l8cJ8A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=2JgSa4NbpEOStq-L5dxp:22 cc=ntf awl=host:13216
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDAwMyBTYWx0ZWRfX8A5p3CVAWzuw Y+A0SqBIv6GX0BK417yo0l8vlX+26Wv7EqtbQ0L1FVulrVsxHSHLzu5bESjOk59Iydjwu1xhwAz g2W19b3AVydjuAIMkZNIarmUg+AZfogvga42oxLXzahmefWJNjhyxWDu6sVaHF88y9asAeqEDyK
 VyKPcYspne8hhxQKtt9PTOHnjEexbwOyyUMRvRysGWFz0WVggEXJ5R0o2a6YGfqluEuRGM6eP/v OBTGNOAaJaQEGEUmaJiRPwG6M04OeqE9usF/26+k76zw5N/2/Uys+CiNkyT1sEh1OMYuqERUykS k8T5fUFPzeA52/yOUs5v1WtOG06FNvaNUIDKoidLsqoqNa0zw9eP4EeBkVDY35ZU7ILlVcypsUS
 nqJ72UgB5HPiZeYyJ9tzgs01Fmz60YVJtUNyGssx65M3saP94QLmjsWCGbCKGzFbV+3Y6ATf

DQoNCj4gT24gSnVuIDEwLCAyMDI1LCBhdCA5OjQw4oCvQU0sIFN0ZXZlbiBSb3N0ZWR0IDxyb3N0
ZWR0QGdvb2RtaXMub3JnPiB3cm90ZToNCj4gDQo+IE9uIFR1ZSwgMTAgSnVuIDIwMjUgMTY6MzE6
MDUgKzAwMDANCj4gUHJha2FzaCBTYW5nYXBwYSA8cHJha2FzaC5zYW5nYXBwYUBvcmFjbGUuY29t
PiB3cm90ZToNCj4gDQo+PiBPaywgYWRkaW5nIGxvYWQgYWxzbyBzZWVtcyB0byBpbmNyZWFzZSB0
aGUgbWF4IGxhdGVuY3kuDQo+IA0KPiBSaWdodC4NCj4gDQo+PiANCj4+IEl0IGlzIHVwIHRvIFBl
dGVyIHRvIGRlY2lkZSBpZiBzY2hlZHVsZXIgdGltZSBleHRlbnNpb24gc2hvdWxkIGJlIHJlc3Ry
aWN0ZWQgdG8gbm9uIFJUIHRocmVhZHMuDQo+IA0KPiBQZXRlciB3YXMgYWdhaW5zdCByZXN0cmlj
dGluZyBpdCB0byBqdXN0IG5vbiBSVCB0aHJlYWRzIGJlY2F1c2UgaGUgc2FpZCBpdA0KPiB3b3Vs
ZG4ndCBtYWtlIGEgZGlmZmVyZW5jZS4gSGUgYXNrZWQgZm9yIGJlbmNobWFya3MgdGhhdCBzYXlz
IG90aGVyd2lzZS4NCj4gDQo+IEknbSBub3cgc3VwcGx5aW5nIHRoZSBiZW5jaG1hcmtzIHRoYXQg
c2F5IGl0IGRvZXMgbWFrZSBhIGRpZmZlcmVuY2UuDQo+IA0KPiBIb3BlZnVsbHkgUGV0ZXIgd2ls
bCBub3cgY2hhbmdlIGhpcyBtaW5kLg0KDQpEaWQgbm90IHNlZSBhIHJlc3BvbnNlIGZyb20gUGV0
ZXIuDQoNCkkgc2VudCBvdXQgIFY2IHZlcnNpb24gd2hpY2ggYWRkcyBhIGNvbmZpZyBvcHRpb24g
Zm9yIHRoaXMgZmVhdHVyZS4NCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MDcwMTAw
Mzc0OS41MDUyNS0xLXByYWthc2guc2FuZ2FwcGFAb3JhY2xlLmNvbS8NCg0KLVByYWthc2gNCj4g
DQo+IC0tIFN0ZXZlDQoNCg==
