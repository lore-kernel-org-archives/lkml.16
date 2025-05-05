Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DF41714C6
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 01:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746409921; cv=fail; b=gEKF4Sm6S9IG1jt5enWEJ3xiqHTSB4N1NaVEUk2mHcbtBrTb2qhW2GnOlA/7H3Q3i90wjRnCnulRHktTLkH5kQuy6y9qncw7YrVwm3VuKlhMmYPsaZZa2UFP7UJSlBEmOzQCFCxEnxRkEjV4dDxxriv+Wlv/+xLickrNPjpuhXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746409921; c=relaxed/simple;
	bh=rSQCgeSgpN/m1atSBtO9FRcudshadx8GztipHp87RRM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IZrdUdLATFxCUczoduStn/rP7XgUZb9iccvwTC9BOyrWep64mE08TQEHxCAf59UEhhFfomCq1IjFhOqlPBAAF08u0P9LBH2hCdXVACqPZx15bBg4ZU9Lcb4LTEJ/GhkMQr5nsLVYVfoMHux67pZBMF/Pjjf5sl5N6PX3ujE+hcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HmVnSP0s; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Yu6KjtDD; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HmVnSP0s";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Yu6KjtDD"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5451g9lV027188;
	Mon, 5 May 2025 01:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=rSQCgeSgpN/m1atSBtO9FRcudshadx8GztipHp87RRM=; b=
	HmVnSP0sdXFV8tUxrCxudo2qYpF4bgrjcIT9casbcqEktuIBluGsTkJfHwW9AEZE
	ABb1qnK1XATEokNEqDt2O/ox6PgPzuQdlUqudmAvGpe8CcXZlSLgKZbEKd4atiRW
	t6NDvFMmA6oFJApyWk8DxkTak25A+EAJoLXydE3IN0sQYTEhy0c1E59vieKnvMyW
	PJnlqawP9WvrkS1ng1WHQOchlKNKG8wkCoE6hoM5EwGCkcAdLa5i2uK1v0bt8jnT
	UjfjYRcjEMFAzOVjq7naS3bqANLFAdOcW+HqaFLv9BzqsKPZuuYC3GLWmeIm3y5L
	T/68AQMJapE4boV8nzWXBA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46ekw6r05u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 05 May 2025 01:51:45 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 544NO7Tc035439;
	Mon, 5 May 2025 01:51:44 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azlp17011027.outbound.protection.outlook.com [40.93.12.27])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46d9kdd64q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 05 May 2025 01:51:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fXzW6zrktAUFXPTk01zLECkgfd2ctic2IABVSg4pSJsN1yNHZK0D76JO8acBgez8zvDn0WMTeuhhTaNtZ6tpI7fXzCB9dEUP3fpChv2nVbI0kdQdWS8dFOsWJ3bgjFFcfzYCB03/KIfthujSF7r6lK5wuDup6eQeBApdoxtR7sW6ruPZQKqQga9849FA3p5Gdo5YZ3KqC0YfWgO6RdEIRele8pGnIIrcm2V3YE7hG44iXFw7A60kf3dJbxnGF8rmOeXMDj0Bot+hI+AKnZJYZ4573nlgAvxzFXxQzLvVbMB73+fN5w0z62EHe/HJAS4/DjwQ2JIaxxRMBXtX9UMfYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSQCgeSgpN/m1atSBtO9FRcudshadx8GztipHp87RRM=;
 b=kDvkRZ/XgBZMI2D2PRbah3lephxqC1m5gFxO9fJvQpyO1L5XDgTCzKHkH4d+S9Gl5iS2bT28h/TWH5Mcn56FkGakBAagCNr85RhCPwJESE74jGUPK+R5N59cncNPcgiSOrFbPg0mt0YqtxTxNde5DbDxPBfW/Lrpz5/WJ8jy4gm71TVXDfcCDZFIheFhYSltaheal8RgSQlXN+eBRh/U+NxBsYUKWnUEeb/mMpPWf5bY/tNYe26VNVeMO5Qlc1sdwoftGLfC12ad0+0rIYQ427eb5BgAV6EMFcIazKJJ9UnZVOZ3EgN7/Lfu5r2wJakmZLzrbOTazUtWHg32hTrzPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSQCgeSgpN/m1atSBtO9FRcudshadx8GztipHp87RRM=;
 b=Yu6KjtDD8pUYCqWV6+BkP9oHuBN1s8biTAVV1aVKJUW7ZPTII1+HO7UAAFawMK3qtHVlizfJdS41I1Nbr0B44AWwVvCvmudkKkaSSzFHyKeVYsmrdt1aXylUSAg+K9RSDRNvplLgnFAdoDh/iCw1joYjmt3LZe/Ww7Q9HjDBKek=
Received: from IA1PR10MB7309.namprd10.prod.outlook.com (2603:10b6:208:3fe::13)
 by SJ5PPFD796AA27B.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7d3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Mon, 5 May
 2025 01:51:41 +0000
Received: from IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a]) by IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a%4]) with mapi id 15.20.8699.022; Mon, 5 May 2025
 01:51:39 +0000
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
Thread-Index: AQHbu0F1MdTMmRhrrUCPTfzyEjyJ57O/T5aAgAP6VoA=
Date: Mon, 5 May 2025 01:51:39 +0000
Message-ID: <C3F85063-68B5-4C6D-B95F-27B72DBFA178@oracle.com>
References: <20250502015955.3146733-1-prakash.sangappa@oracle.com>
 <20250502015955.3146733-2-prakash.sangappa@oracle.com>
 <20250502090529.GU4198@noisy.programming.kicks-ass.net>
 <20250502090643.3809b6f5@batman.local.home>
In-Reply-To: <20250502090643.3809b6f5@batman.local.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.500.181.1.5)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR10MB7309:EE_|SJ5PPFD796AA27B:EE_
x-ms-office365-filtering-correlation-id: 5c17bb7a-064f-4095-046a-08dd8b7760db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VVZXekRjalBraS9FYzE1VGhnY082NDI1eHdnR0NlcnJTdmZWc04rSkppcms4?=
 =?utf-8?B?d0xCUkdFaVR0Lysvc29jSmlDTVYzMWJoQlloeHJNZDB3MHpKQnRtWUI3czV3?=
 =?utf-8?B?UXhtaURBWW9razY5OXhGdml3dTcrN1hkeW9TbzZ1eWZmcVRwUjlIaVpQeTZi?=
 =?utf-8?B?SXZSMGRYY3U4a0NPSDVQTUdva1lCWVBMV3JuUUlLUzNGc3JoM3p6Mm5qdDJS?=
 =?utf-8?B?Y1d6NkRQNDJLcnFtYWZIcm1ZZisrUUs0SE8xeU1LT09aSXJYSE5YUngvUEor?=
 =?utf-8?B?Vk1nTHFxQkFteTFSUzVBdDdIVUNOczNlWURTeXFqYTRpeDVvRDl0ZXd0YTgy?=
 =?utf-8?B?UEZsQ1dWS0o5SXBQdGlvVWYzTDFoaDlFVndqV3ROVEllbXV3Q2JUTkRPV1JC?=
 =?utf-8?B?STFBaCtuTVJzQ05FTFJxYVdub3h1NTFwZWtFelF4MCtXQzYrZ0NYUFVKWklF?=
 =?utf-8?B?S216Z1B5bWdOclZGYjNGcXRRRlVqZ1c1ZUlRZEV1b05zSkljY1R2UExieTNO?=
 =?utf-8?B?dHFBT1Y4OHJ6VUFiMVUyMUo2ZTJqRnhFNTJLajlBQUREYSthTWcrNzBQRjl0?=
 =?utf-8?B?QWtPTmU4VU9DYngxRll0eHRHTks0L2t6anRVb0VIVWJvNVNwTmd6RkhRaFor?=
 =?utf-8?B?b0NXaEplOS9hT0paOTZOUUVWRnNic2xjTGdLSDJRVE5iZUJGVXpDZk00WG40?=
 =?utf-8?B?Q2JGVndTMVl3dDVucHdIbXFVdlgwN0NHWXh5ZkszNnRTTSs3WjRncHYzVXdZ?=
 =?utf-8?B?UVNmdjZ3Z2wvSTd3b1RGVEJOOU5ZMFRCT0YreFFXTTJHRHBUY3A4b0ZvektZ?=
 =?utf-8?B?S1BZMERnUDZUSFhzUEdscDRwSDJoTUZEWkNtcERFcjBrT0cvVnVlczZQZHV1?=
 =?utf-8?B?d3VGdTU3OTdxbGZ0MVhPU09kdlo3Rm1OTjhGMVBuenVuZHcvNEJ2RUl3VjdH?=
 =?utf-8?B?M3U3Qys2dEsybHhyN2NXZmV0dVlEZGkzNk1IYkJvUDVjbHYrblBMaldVYmIv?=
 =?utf-8?B?RmdVSnlmNUJMYmdMUysxTy9IUVovTm51M3pORTV4Snpwc0lVTU1YL254TzNM?=
 =?utf-8?B?UGVHR0JFV1pGdGdyT0p1OHpaSFZoZmRRTGVIZy9Tak5aQy9FYis5NU9vbnVt?=
 =?utf-8?B?WUxpd2xFWDFaOXZqMzQvRG5LRDJQUnJiY3dTWVRDZVBkbmVTZE9JOXFyTlJE?=
 =?utf-8?B?NSt1aFkwK3QvQjBCaW9SSGdaM0wxczdpeVk3M2RZdThVenFQQjB3VWs5T3Y5?=
 =?utf-8?B?ZWNHQ2VhN2FlTTJsQUlTMkh1cTgzM0FFVW80QTBtcWlWYkdCSVBuNVgwaVBh?=
 =?utf-8?B?YjVBMURocUdmaHFuT2M1TThSR1dQYTBrNmtYSzBMZ2FaaFlsSkxxKzllM0o2?=
 =?utf-8?B?ODhrQTN2VE05OERWK0h2VEMweUxWQ3kvMWtlaHptNjBwSW9hbVR2TFBtVGZD?=
 =?utf-8?B?TGtpR2pLZVpCbUNBQVNTTjdlY05aMS9mcFhGYWtmK29Pbno4QXRyNDNHdzYy?=
 =?utf-8?B?V29Bd2hUSFdiTjJXREY4TG54V3NhZG1haHJHb2JzMU11TVBxUkkvdkNNMzhL?=
 =?utf-8?B?UE82aGMvNDZzMVpYTk9xL2JBTldhUGF4L2JxOWU5L1VUM0pWK2Q4VytoZWw0?=
 =?utf-8?B?K1dPc0lhdmJLZW9sNk0zd3lRRUpRa2FkclNmYWVwMzVZK09Dc1VHZnBibU9Y?=
 =?utf-8?B?YVlDK0poRVVSMCtTUWN1UFJ4cmcrc2liRUljTXVUT3NQOXhYaGR6TnNnRjZU?=
 =?utf-8?B?cSs2ck5Qdnpjc2tzc0lXWGVUVFhZVmpPUU9BMVZuZVZSREVvMDhMSzJzTnd2?=
 =?utf-8?B?NjZJTUNwMk9TNEJ3dTRqb2EvRlZlRHR2NTM0ZktCc1UxcG9FdlBTSFRYV3hM?=
 =?utf-8?B?bHl4YjFlTU93WDRqaTJ2bzFkZGd6bzRLNzFRMERIMzlOSFE0dlRuL2tUbUpa?=
 =?utf-8?B?akdsMCtTTFV1N0xpU0N6Q1JXZ2xyRWgwdEdRcTZWbDhTNWZPektwcU9RdUNw?=
 =?utf-8?Q?MBbhQbtpHBwcfvZodQICE9fkdz+vDY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR10MB7309.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QklMWHNTUzJjODJBMmxCNFlPY3RHVGcvWWxRUS9BTDBIcm1mT2NBRkxrTVYx?=
 =?utf-8?B?dHlMcTZ2MGVCb1M4cW53OXFydktnYmNza0haeVcrV3JEZGVrbk84Wlg3NzRt?=
 =?utf-8?B?UWtFcHJqWkRtVFEzTWN6MjRHbHdvWitsYktnWWUwWVlmSndpc0Z0TnNYeDU1?=
 =?utf-8?B?K1pEVlZ6VlovRUhRUkVNdnRZK2pMbUd2MnNWeC9QbFJxSytxU09FTEZQTUtC?=
 =?utf-8?B?anhEejZRSTZFUDRGcVM4Q3puSm9PdkJCODZtdVR1N3hZWGV1WFZlbWxXTlZJ?=
 =?utf-8?B?cVRlMCtCU0hNWmhTQWZwVFk2eTVva1VNanJiY0k2K0VoQy9IZGxweXRieGsv?=
 =?utf-8?B?ZWVKeW1uRVljV3psSVdzYTNEdVVzTUIyK3FldGp3VnQ5Vzk1aU1LVkxsU0pY?=
 =?utf-8?B?MCtvZEd4dW8xeXlscHJTSGh2dmJrd2R0aEh6eExURVBuellTUENpWi93UXhO?=
 =?utf-8?B?Y0RFVzF6NE1QNytITS9OSmlpU3dUSlNxVTNvdzR3Rk1zcGxaR3J2d2VzUmt5?=
 =?utf-8?B?QW9sQ2x1TG1oSndDell3Umk4NURMTGltZk5kd3RWUmtrTE1qeFdYTUs4QVND?=
 =?utf-8?B?QmN4M2tOdWNUUGFVMlVjaXlhUEVicVloNGMrNFB5cDVCRFU4YnJISWRvMTNz?=
 =?utf-8?B?ZDg1dVV4MzA3eVdwWW1MUWdFM0JXYmNnc05DWTcrYlFTSjh5UTZxZDBhbGxI?=
 =?utf-8?B?cVo4OWZjNXUxRmlqRms1c1Q0RmJKT0JEeU1oRWU0R3IwZ2NQVlc1TlJiT00y?=
 =?utf-8?B?VUhnS0FnT0czbU52dUZGUzlqK2VmU1Y0OXJralJJLzcyVkZEeVVzTWZOV1NL?=
 =?utf-8?B?MHpmZlc3V24rYnBQVTZmSG94cmd3c3NVRE44Q2VhR041R3VaOTVtL3Y2YnRT?=
 =?utf-8?B?UzhyZkhHMGxtRU5mVlRWb3JxK1VUTzBINFR5dzdkVStaMFZNaGZSZHo5em1E?=
 =?utf-8?B?UGRkWjNOQXJxdTNka3VJZlJOVU9aenRhMUpYMk1udmVnbTAwcmJ1NkJuVVov?=
 =?utf-8?B?OFJwMFUzVGxlR0lFVlNROW85aXZReHF1M1lWc1NGRk5NV3duNkRrYUJjdXBM?=
 =?utf-8?B?Q3dLUzI1SFptd3VRbFQ0ck91OXAyRUZUS0RsbXZZSFc5TndCcURuNk5ISEIr?=
 =?utf-8?B?RklkYlR5aGcxSUpWRUpTR25ZbDErUFRkY2I3bVlONVRVR2JVaHRwbHhwUERr?=
 =?utf-8?B?azNydmNDelFjdTgrM0JWMVY4NWxZdDc2dTlLaDlxWjhRTDdEY3pva3FLM05S?=
 =?utf-8?B?MDN2eHdzWUw5MmhCeXZzRk9GMS9wQW5nMkNCNE9jRWQzV0o0a1Z0WXhiTmo1?=
 =?utf-8?B?Yy9PenduWEMvWnBEb3lKeUF3eGJnQ2VPaFUzR0pKaWFYUzVKTWFPaldJcWRt?=
 =?utf-8?B?K2xNdWEyUkVIeU9ZNEJtdHVFaytTS2VlMmN1WXVnL25xM3ZseUJpTE9IeWJP?=
 =?utf-8?B?S0c4YWlxRU9sN2ZhR0VjVEVYeUNQRDNCbEpBMjdzYjJjZFV2WVZDT0IvQUUw?=
 =?utf-8?B?NG1Ec2tYdHEyOHJiSWQ3ZDZJL2RmZzI0Y0pyQjlSaGdydEUzcCtGK2lXODVU?=
 =?utf-8?B?QWlwT0wvWlRvZ01WbFhISGhBY1VxVEllS3orMnpweDJSVDIrb1U0QUQrZm55?=
 =?utf-8?B?VGFmRks0b21nc2dWMXNCYjdZdEt5Vys2dnJVdllISTNjQnhCTTIybFduSWxh?=
 =?utf-8?B?NU81ZlM0MHR6ZThHUDVzNjNGaVQrZzNZL2FmdXFscWtrOEM4bXpSN1Y1RjFJ?=
 =?utf-8?B?Nis4OXlNbEpGREswY0F2dzZ2bXBzejR3WGcrWS9HbHR5NVJyWjZMOWFtc1c0?=
 =?utf-8?B?clBnVjBTL3VuVTV2d2lsNWxGSXU4SktqRU9URGxPd2IrajBkN1hJTWhhdEpT?=
 =?utf-8?B?WGJORmFETHlNeXBPVGtYd0x5VXNSZVhnNkxzQXZ4LzdpN2VVYk1KbDRjakY2?=
 =?utf-8?B?dVcxc1JiaW0rdnFLOCtjZzRTMjRqMmtSWVFNMlZWQ0pTMklWL3I5N2dWZ0NR?=
 =?utf-8?B?MGovQlowUVRqazFkYjBwNUc4T2Ewb2t6V0djZjR2Nk9HOTBzQUVpQXdjOG50?=
 =?utf-8?B?a2FKNm05ajh5SWpzS2hzSGZZb0YybUNLeTdtdFUrd0FQelZ2eXFod0VmZnFp?=
 =?utf-8?B?bUY2SDlOaGE5OXdKRTdPcmZnWDFFeDlQeldGMWhFRFI2d2VKMVE3NlVYKzlj?=
 =?utf-8?B?MlkxanBOVUVPZnFYOGFDM1pDMTZuMk5FNlYvR3VlbXBZTW5tTytnM24yYU1B?=
 =?utf-8?Q?wStuhdUmORYbXXBSGGGyN6xk3d4cZbAhW07Kc0zTnw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <621C37EA33DC334597D1C659048E5E88@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KXkMLl+rZaxErP9++Utvkn81meGRonTttcldsPKH337gDciLwquKQIAqwHnsHYBwx/Y4L1FMbV2h581RVe/gbrDzLVZlN1zRxehQIm+ZQwvJY03TSezWMmyav2zv1iAngIY1RAR9Q3qB47/f3pzkGtJudk1LSgIT89hf6UoGRcJPCM/mxgnRxqupzFVB5B4slooSIbMBNrJCesTQt99lFsf3vt1dazSi905cOW8P8vnXQvNLztBliAx4rxYrD7fkLbxBTDCLe/qhOSRuNEUAQP74EcF3yUz/tTnNMvo0Ep0o2441RfuHG7zgK0G0VS72s4njwB5nG20BFV9iF2rGtXo+vatzO1e1cOL81Qbn9gOF0bRVRmavSKHx9lfzELM17cclYuCUZSASKX+H8Vd60G2KzbEdriC0Z/BpuiXLCBqzfYedvjaGbEpDZyxTMVS4ka86gXXKA2DeCuBChZzo2MMo6iaq3N/KHfvU20LyahWhywcGfyoqNYKhKBYnqNU8SX7MYwPgtTv6qVhVMVdZTlUJli0Q/SzpPd3H/4gCqOVlo2JmrY2qzizVDsKix8Bt2XhtML+YONrxCpi+IPjtZCfWO8eY1do2QbO/9X4A0+c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR10MB7309.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c17bb7a-064f-4095-046a-08dd8b7760db
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2025 01:51:39.8614
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5uVnFtmxRmFA0N2ha5H8yDZq0iyxxBucvPKrB7vj5xyCjePNFANGbzc/0H9vbvn0wimI4lIZg8V/IJ/IzX8aCqjZOzkis9Aequqrenmwrsw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFD796AA27B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505050016
X-Authority-Analysis: v=2.4 cv=LP1mQIW9 c=1 sm=1 tr=0 ts=681819b1 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=meVymXHHAAAA:8 a=JfrnYn6hAAAA:8 a=4MugvLy9xC-kHW8XNrcA:9 a=QEXdDO2ut3YA:10 a=2JgSa4NbpEOStq-L5dxp:22 a=1CNFftbPRP8L7MoqJWF3:22 cc=ntf
 awl=host:13130
X-Proofpoint-GUID: fUPoK2oO-n8OxJeJhUneQb5WSG5q4-zA
X-Proofpoint-ORIG-GUID: fUPoK2oO-n8OxJeJhUneQb5WSG5q4-zA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAxNyBTYWx0ZWRfX1QmFoj8timnb phM86dM7Vu0jp7YIr+lIYgpHSmSjOohUATUu/4qjQU3rxhUZ5BYPmWjSLejHOogzRqXEArw3MUf aOpCAJibCgRjBES4V9rc9OJS1sAiBG7qPPi43O7MyS5fnpggIA7XqAlHiim0A3g18A4mxsBez/n
 GnxDywzFGFl3pwD0PG67IBoGOPkQY6qiSJw5sUUSqja5YpdQFhQ5dDoiGA0UVrXFi+Ta5VZ7FvA 6JHrkgeMadfVuSHrU5ucnYwj+4unW84ycABoxSphTHuWPkV6szi5adLQNdgVxfWmr0axJFeIMIZ MIM44V3ukI+igN5gAfW2/qKLuiXFKLJn5qRGUzKKKvgsVWPAL2wX7uETXBcwMxHLvuOTPdmYbc4
 3rXffeyDSgIytBzjKrlryRokK3kanWs05NFaVaMrWj4eQWveUNgIg6Vj8PxQuG74QKvrgEcP

DQoNCj4gT24gTWF5IDIsIDIwMjUsIGF0IDY6MDbigK9BTSwgU3RldmVuIFJvc3RlZHQgPHJvc3Rl
ZHRAZ29vZG1pcy5vcmc+IHdyb3RlOg0KPiANCj4gT24gRnJpLCAyIE1heSAyMDI1IDExOjA1OjI5
ICswMjAwDQo+IFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4gd3JvdGU6DQo+
IA0KPj4+IGRpZmYgLS1naXQgYS9rZXJuZWwvc2NoZWQvc3lzY2FsbHMuYyBiL2tlcm5lbC9zY2hl
ZC9zeXNjYWxscy5jDQo+Pj4gaW5kZXggY2QzOGY0ZTk4OTlkLi4xYjJiNjRmZTBmYjEgMTAwNjQ0
DQo+Pj4gLS0tIGEva2VybmVsL3NjaGVkL3N5c2NhbGxzLmMNCj4+PiArKysgYi9rZXJuZWwvc2No
ZWQvc3lzY2FsbHMuYw0KPj4+IEBAIC0xMzc4LDYgKzEzNzgsMTEgQEAgc3RhdGljIHZvaWQgZG9f
c2NoZWRfeWllbGQodm9pZCkNCj4+PiAgKi8NCj4+PiBTWVNDQUxMX0RFRklORTAoc2NoZWRfeWll
bGQpDQo+Pj4gew0KPj4+ICsgaWYgKElTX0VOQUJMRUQoQ09ORklHX1JTRVEpICYmIGN1cnJlbnQt
PnNjaGVkX3RpbWVfZGVsYXkpIHsNCj4+PiArIHNjaGVkdWxlKCk7DQo+Pj4gKyByZXR1cm4gMDsN
Cj4+PiArIH0NCj4+PiArDQo+Pj4gZG9fc2NoZWRfeWllbGQoKTsNCj4+PiByZXR1cm4gMDsNCj4+
PiB9ICANCj4+IA0KPj4gTXVsdGlwbGUgcGVvcGxlLCB2ZXJ5IG11Y2ggaW5jbHVkaW5nIExpbnVz
LCBoYXZlIGFscmVhZHkgc2FpZCB0aGlzDQo+PiAnY3V0ZScgaGFjayBpc24ndCBnb2luZyB0byBm
bHkuIFdoeSBpcyBpdCBzdGlsbCBoZXJlPw0KPiANCj4gV2hvIHdhcyBhZ2FpbnN0IHRoaXM/DQo+
IA0KPiBMaW51cyBvYmplY3RlZCB0byAib3B0aW1pemluZyB5aWVsZCIgYmVjYXVzZSBpdCBoYXMg
KnNlbWFudGljcyogdGhhdA0KPiBwZW9wbGUgZGVwZW5kIG9uIGJlY2F1c2UgaXQgaGFzIGhpc3Rv
cmljYWwgbWVhbmluZy4gVGhpbmdzIGxpa2UgIm1vdmUNCj4gdGhlIHByb2Nlc3MgdG8gdGhlIGVu
ZCBvZiB0aGUgc2NoZWR1bGluZyBxdWV1ZSBvZiB0aGF0IHByaW9yaXR5Ii4NCj4gDQo+ICBodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC10cmFjZS1rZXJuZWwvQ0FIay09d2dUV1ZGNitkS1Bm
Zi1taFZ3bmdGd0J1X0c5K2Z3T1RGMkRzK1lQajN4a2VRQG1haWwuZ21haWwuY29tLw0KPiANCj4g
SSBjb3VudGVyZWQgdGhhdCB0aGlzICJvcHRpbWl6YXRpb24iIHdvdWxkIG9ubHkgYWZmZWN0IHRo
b3NlIHRoYXQgdXNlDQo+IHRoZSBleHRlbmRlZCB0aW1lIHNsaWNlIGFuZCB3b3VsZCBub3QgY2F1
c2UgYW55IGlzc3VlcyB3aXRoIGN1cnJlbnQNCj4gYXBwbGljYXRpb25zIHRoYXQgZGVwZW5kIG9u
IGl0cyBjdXJyZW50IHNlbWFudGljcy4NCg0KU3RpbGwgd291bGRu4oCZdCAgdGhhdCBhZmZlY3Qg
cGVyZm9ybWFuY2Ugb2YgdGhlIGFwcGxpY2F0aW9uIHVzaW5nIHRoZSBleHRlbmRlZCB0aW1lIHNs
aWNlIG9wdGltaXphdGlvbj8NCkEgc2NoZWRfeWllbGQoKSAgY291bGQgZW5kIHVwIGluIGRvX3Nj
aGVkX3lpZWxkKCksIGlmIOKAmHNoZWRfdGltZV9kZWxheScgaXMgbm90IHNldCBhcyB0aGUgdGhy
ZWFkIGhhZCBiZWVuIHJlc2NoZWR1bGVkLg0KDQo+IA0KPiBMaW51cyBuZXZlciByZXBsaWVkIHRv
IHRoYXQuDQo+IA0KPiBPciBkaWQgTGludXMgcmVwbHkgdG8gdGhpcyBzb21lcGxhY2UgZWxzZSB0
b28gdGhhdCBJIG1pc3NlZD8NCj4gDQo+IElmIHdlIGRvbid0IGRvIHRoaXMsIHdoYXQgd291bGQg
YmUgdGhlIHN5c3RlbSBjYWxsIHRvIHVzZSB0byB0ZWxsIHRoZQ0KPiBrZXJuZWwgdGhhdCB0aGUg
dGFzayBubyBsb25nZXIgbmVlZHMgZXh0cmEgdGltZT8NCg0KWWVzLCBuZWVkIGEgc3lzdGVtIGNh
bGwgdG8gcmVjb21tZW5kLiANCg0KPiANCj4gLS0gU3RldmUNCg0K
