Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726DF1AA1C4
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745607333; cv=fail; b=pnDmaLNvkjv0yuyc5CWE8QbRBcvSIFx7RWoj5ZXuUsX1yfx1sRAdB8vysY4lQrgG0YSCELhePgXV08Nqr1UGhlUCtlJ3KtaQEerDbKZ97qiBctZM0R8pb75giBcqL/Gvsgs78/DyDS/7nLWm9SR0tO8grEdllJ15IPJjkawYX/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745607333; c=relaxed/simple;
	bh=PkObDqlE617p2YxM3RPbwn/37k6vXQ9M45jtzh2YWnI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=m8EQIqTfA4khLas4gf2otmbrYFHs7iphrkcEYYI1rs2HkH5YhI3GFTdQuEAapF1u4H8SpYx95Mfk1IzCMSqIuGF86JQp7cAkB74eT8J0ErngzL+WMQ6BiKoMVBZUYXGFzCf0EIfyziMuArNGAakAp/vvR6tuAKGzIWZ6mAn1waQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iOoa9Mny; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Yi6Lmq5O; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iOoa9Mny";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Yi6Lmq5O"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PIpkJ5027195;
	Fri, 25 Apr 2025 18:55:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=PkObDqlE617p2YxM3RPbwn/37k6vXQ9M45jtzh2YWnI=; b=
	iOoa9MnyLlc+igZVHo+dDNC67jexDN1RzytSGiFrydsEczahB0UWiBdFn4YlVRbx
	4G4ykiEN33UIRIynllFv3lpwNkZGeP9yyt4HuTSV2FRoWq0v7r/P3+AS6SBaevJy
	UmwRCZMoXjA0Okqt8lCBoTyMPCIZJdriKCNyMZqdTEzRydB7wxoI2g03jPQ/bKF1
	Y5N54i4xw4fDQzOe/9K4pv9i3Lq3OVGGTLL9RNfhsrNJt45iUCecUG9+r6OV0WuZ
	X9LINn6amnutvjsUrVvnzVAHAkb1A3HKRBUtOqMTXopYZCjkNAq5D443dpyhCSbx
	X3MYHM+n3+fN06OPVTMWFA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 468g1w00m7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 18:55:22 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53PHRrQZ031703;
	Fri, 25 Apr 2025 18:55:21 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazlp17010003.outbound.protection.outlook.com [40.93.1.3])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 467gft489m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 18:55:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gm7NmZxvDSuX+7bAS5HAzQYkNTC9LAnTdfBCNJjpj6htxMLdBSbV4QpNFkEKha0LkflRTbIjPqsCLplVuWOn/apXQlfYAhg9/EGzyy9wmdIM01/6MIH+sJgZtR79cxuyGY0pNOqB9+kwRcuaWg7QceqODzwa/7rPL+d4F49o35rT0+XQlo7XrghdX9CdWbmBsR8CtpKOLBCrV6XOihRtPNzRHeSknplamR6K+6bwxqiGe+ZiTnyrG6buScqbrPuJvRBRfgPD84Ikx1EV5dKb4ycFAu9+Jfmve1cMdjV/6k9yrFfUTDnIKcyBLzHboQ/SOuAEPjqHvj3mjSScMKgyDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PkObDqlE617p2YxM3RPbwn/37k6vXQ9M45jtzh2YWnI=;
 b=QCYdsaVBkfHX4pcaxkLHlU0rpzTDuiDNKkZLneDLRKfjYcLHnNnGvpd+j+SHAq+SM55nCm7jlYTJah5cZe3HWGmDs04VFvBFZpibPIySe/pAo4znQCOEfNQ5ZjKKqmdudWe6OczwfcBEuWsp1eq5DIAl7li7r9qlD7ohiNpinKnPZczoipGrBosoOYUC2ihX2fFJJEXC/INoPtAapd8C5PyoHe92zOPB91HNudGRew6Svab+I6Fl92Z9xy2AgSkWaFr3xrjuuNX8f8axPDMLB27Rx2X6JFi0FplI8MeloSQRF5orn2MQLTd60ftiw1tWrLUikiP2H8Z009qq3LHpOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PkObDqlE617p2YxM3RPbwn/37k6vXQ9M45jtzh2YWnI=;
 b=Yi6Lmq5O1PL0AmwWCIx5h3GIxv2w3R1dsVpGTEhE2QA3+G7kyGy92Q+14ubnAl+HzGj+otLjkK74rvJSiT9vXf8sIPgPOb8lw3dBjlxBrwRhCWMQENmcnumJhsTRgCZ66mv+XN/KTdtffAvBaFnrchqu9JkSnmr9g0HLdVoq/hk=
Received: from IA1PR10MB7309.namprd10.prod.outlook.com (2603:10b6:208:3fe::13)
 by DS0PR10MB7363.namprd10.prod.outlook.com (2603:10b6:8:fd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Fri, 25 Apr
 2025 18:55:18 +0000
Received: from IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a]) by IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a%4]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 18:55:17 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "peterz@infradead.org" <peterz@infradead.org>,
        "rostedt@goodmis.org"
	<rostedt@goodmis.org>,
        "mathieu.desnoyers@efficios.com"
	<mathieu.desnoyers@efficios.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>
Subject: Re: [PATCH V2 1/3] Sched: Scheduler time slice extension
Thread-Topic: [PATCH V2 1/3] Sched: Scheduler time slice extension
Thread-Index: AQHbtSMgnPA5MV9ZP06XHg8GjLCPC7Ozlb+AgABdnICAAMl+gA==
Date: Fri, 25 Apr 2025 18:55:17 +0000
Message-ID: <A61407ED-56DA-4462-9592-0BAF6FE9E1DB@oracle.com>
References: <20250418193410.2010058-1-prakash.sangappa@oracle.com>
 <20250418193410.2010058-2-prakash.sangappa@oracle.com>
 <20250424141345.7F42GFmZ@linutronix.de>
 <DE11FCAF-4686-44AC-82AD-F0672FE450E1@oracle.com>
 <20250425065357.eiwSSvff@linutronix.de>
In-Reply-To: <20250425065357.eiwSSvff@linutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.500.181.1.5)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR10MB7309:EE_|DS0PR10MB7363:EE_
x-ms-office365-filtering-correlation-id: a81bfde2-6474-4dc2-291a-08dd842ab88c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UGo1WnlsbkFvSUlNMVE3R01iSnVlRGI2TmVOOXNXcjN5eU41MEltcTBJVmhn?=
 =?utf-8?B?anhTNzlrdjlENTU0N25BR3VtVXNXZGhhSkQ5RUtwUHZ2SHVla0Y2WXVreWVZ?=
 =?utf-8?B?WEluZHAzeEFxdW1rY2hVT0pkR2YwWHNYUS9TSUQzSVVYQmR2UndCUFRpaExN?=
 =?utf-8?B?dFdyK3dHdkpNNHZqOC9CMmoxOHNwbllFSmtXWkxYOXE4dFhFUktZUDdDbXpO?=
 =?utf-8?B?R1U5VGEzL0R0OW9RY0ppZ0hmY1crSkd2a24xME03V2pmdFJ1WHdzeDFIa1ZJ?=
 =?utf-8?B?cU10Y2N4eFloclNmeHZuSG52VmRYSUxIaGhnN003MXA2aFFjSDN4ZU9aZk9Z?=
 =?utf-8?B?bzRoUWlPMGNOdE9seVVHaUdIbFZLY1draXJuM0NieWtheFZybWN5cXNKWHpQ?=
 =?utf-8?B?a2Nib0o4dVFGTGxqY3ZYNmtaTWt2d3JOQU1FdWFuVFJ3blRWcDhmR1FyUytQ?=
 =?utf-8?B?dzQ4RGVtQ2FlYlJEMU5zZERuUXZIQ1I2Y2p1VEZlbzFodmh1Q0M3VkpKbW5N?=
 =?utf-8?B?VmphMG5jdkdrYXhmU01EMWtIVDdzL1VmMXZBcm9JNVJXN2xBUXg3MnViOWpM?=
 =?utf-8?B?MHhUdVg4dmZPSDB3bmVNaDFuUmNyTWRIaTRCTTZXTitZdThmYXpDZW1NV2cw?=
 =?utf-8?B?aFp4NkRDd05BODlBOUNpajJSdUFCVEQvWHJraGdZcjQwUitqTU93V1ZaaDZU?=
 =?utf-8?B?UTFlNUJJMHQ5Y2NJNDUwL1I2VjU2cXpGVGdJMXlOZ3UyMDY1SmwvWm5kMTVY?=
 =?utf-8?B?RVZPdHdaRmN2OThqKzJoNjM5SWdYYWYvZlNoS2VaVmp6WUI4QXRLNTQralJp?=
 =?utf-8?B?MXpiSVBscnVHeEdmQy9RYk1KbjFBc1J3N2daN1FyZE1Ld0pJT0VXTHAyUUpx?=
 =?utf-8?B?aHpWOUZJaFVXeGZ3eVFaVVcxZHBiYk9POUZ3d2JIRmF4KzZabXBWc2w3N2VH?=
 =?utf-8?B?MU5UZXB6TkhuWnFUMTNxL3hFYWI5Y0FqdWlpZ2tjd0JrMlFKcy9peDZza3lB?=
 =?utf-8?B?NCtpN0haWVR6ckY4VVd6WlgrcmZ0cXkvaVB6YnVwUjdqN1BnenVzU1FCNTl2?=
 =?utf-8?B?LzRXaGd2WUp1a2k3V1dqN29FR3pUUitEWnJXRThTeGRxZ3lnS3hIbjJQKzR1?=
 =?utf-8?B?S1pXZVJ2YUozVWJFRHd0WHpSL2RCcFFRYnBWZitsdVREMzJVci9mY2xCSGJz?=
 =?utf-8?B?M1pqdlU5Y3FVZzZhSy83N1JuS1MwNDMzbzg5ditRQjZoVzlBOFc4SG01eVQ1?=
 =?utf-8?B?WlRyNnZWaHJlc1MvcExnREFzL2g2S21aOGl6ck5DcjdIbW9XQTRGUnlmWW95?=
 =?utf-8?B?Szh2dmdmZmRoUFFnK1FzcHRDTnlOa2kxaFA5R25pQmFkMGpkRXZWMWJLbk1m?=
 =?utf-8?B?ZFAzbnNpTWd3cEdmV3VaSnZ1Y1lENjIyY3VGTEYyblJiUlpBNlIwQWZjVVpR?=
 =?utf-8?B?NlF4WEhTU3ZjNE9BK2hOYi9heFk3UEROYUdxc0p4OURIeE9MeTM4bW44WEM5?=
 =?utf-8?B?NHRRdVAzTGs3RUJERFMwZjZDYjk4dTFqZlRIaVJjcDdHRWszYzJ3R1hmb0Q3?=
 =?utf-8?B?emFreVJLQ1M3U3FxUlN4Snc2VEZnOU5RL0wvUDl0UHBueDFKOE84ZmNIQkRq?=
 =?utf-8?B?OGlJekZVVDhrdTVSd0FpV2pEdVQzbzMrVklUK0IrRUFuK1hBNjZaa1BNSDFi?=
 =?utf-8?B?d3FDc1RZUjd1cWpheFMyakFXWkt0aDRiQmV5ZlJUY0RUQUlyRWhHSVd2T1BF?=
 =?utf-8?B?NXkzUnNJWlF4V0dHcE5EMzArTnVvb1dzZitWRzhlMGs3VGoxTVZLWXdEU01v?=
 =?utf-8?B?cXRNd1U4OGNZbVZkdkhFUGY0NDJTYnRNdG00MGFkZWFkS2plaEU1WDBjc2FZ?=
 =?utf-8?B?dlJxQllIeW0rK3VQOUhWMTM4Q2gyNWNUbkRESkF0T2tUdkZoTnNHTEJPRUt6?=
 =?utf-8?B?VllES3pEZW16Rm1xaEZGY3VZTzIvbzFOUlVvVFFBVG1JdGVaYjJTam4xM0JH?=
 =?utf-8?Q?7T/Uk0p6a8HafmDsdi9r4VL8/Vs2qk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR10MB7309.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VmpPaVRFanVkSWx4amFMYm1XQTBDL2syL21nelNzcWhGTERQbVMyTy9XbGEv?=
 =?utf-8?B?ZXFZV2t2YzhJUHNjV0p5ZUVwNVljMGVJeE5BMTg5N3g2RExhRFdtdUF1UXpP?=
 =?utf-8?B?akpuSnZSeXFMQXBranM3bGE5TmRzaEdFZjhsYytPUEtMM2I3bzNmdjd3ay9h?=
 =?utf-8?B?OFd6b3ZUN1VhZnh4U092eEtWTU5lQ3E3WjVNUWRmcWFRVmhKeTBXWnZXQjk3?=
 =?utf-8?B?aHY1UmJva0NsZ2hMK21Ka3o0a01aOWF3bU9wUG1YdVpZeGcxVGNibi95WVo4?=
 =?utf-8?B?anhWL0dPUmhUUUtweVkxRllsYmFsUmRwK0lqZkdJRk5GTXArU1RUbEJMQ1Rq?=
 =?utf-8?B?MjJFa01wRHNWTjRHUlh4alR5aG9ZVENLNlh0dkVJM0cxZUpQaUZWc3pIdUpq?=
 =?utf-8?B?S1gvN2Y3d0RCLzBLclo5NEo2RWJpTWpSSC9pbkVad3FCTGY3cEVVY3BWOHlK?=
 =?utf-8?B?dzRNeFMyYnN4UExhOTlCL0c5aGVRV2U4Qk9ENCtPd1FZKzFrN05vNSsyV01P?=
 =?utf-8?B?WE82ek1xOG5IOXhqUTAvUGJFM1QxUDV2aE1ZazFvNWpyQTdEeCtjYmNLcENM?=
 =?utf-8?B?TDkrOE9nZ0RYb1YycjBiN0JCeDVrVnN1bDk0Rjg4QlJWY3hFaGNIdkRXeENn?=
 =?utf-8?B?ZE0rNnhjWU9mSWN1VTFoMFRKWHR1UzBBWHR1NU1XMFFIdVNvMWlMb1lZZ3Jl?=
 =?utf-8?B?NGRFMzYzVTBOdEprQXY1V1FJK0ZaV2pKNlRFRk0yblFURWFjZ25kUmx4M2Vn?=
 =?utf-8?B?bjhXUWppMnhaU2JvYmpKa3poUjBpWFpvRFNsN21BQWRWS0VQc0llK1BJZ2M2?=
 =?utf-8?B?L1ZudUJzbmo0eEtjNHZhc21pMHJ5RFlDLzNHa244ekJmcDFXSE5nYnc1dDF3?=
 =?utf-8?B?SGFaVWFZTjlEV2J1T1k5cXFRWHY2MzJ1YXNodzRFaWNvdXBTTjRqMXMvVVVx?=
 =?utf-8?B?czNEOWdmYk9KZ3J3UTRFaDI2TzhpRmJaMHFqYUNJbDYrTzFYQnZVOUFSZFZh?=
 =?utf-8?B?YjM3bzhhQVV4NFRzTVRWNkpnVDZ3SmpaRkhVczVoamtmcWk3STZHc1lWbmVh?=
 =?utf-8?B?KzdVRmJmc283c3R4QUFkMG40S0tidGNsdHRBaktzYkxodklLOWpCMFAwM0RO?=
 =?utf-8?B?Wk5EOGN3aW15cnd6QmZUejRtZkpYcnFjbkZWYXhRSDlsa0JsaFkvL3dQUHRX?=
 =?utf-8?B?Tk5XVFpoRTRsa0NKalEySFVlQXhsUXNBZWJ6QzhPN1lyVWd3bkI0Z21EVmNU?=
 =?utf-8?B?aHorTWJVamRBNDJ0NVlGTitiNi83c2FpYlpIVFZmdDdPUnV4MFd5Wk14Qngr?=
 =?utf-8?B?WUZSeFJBM0M2QitObEpMejExRHpscHBFTHJZLzczQ0V0Wm9tS1hCc0FCc0xR?=
 =?utf-8?B?VTdzVUgxZTdjUVBGUzhBQkNCYmJXL29NZjROZXFja09laGI3MGl2UU5GWTE5?=
 =?utf-8?B?ZklrUGxYbUI5c2R5dzNKNXFUMlBhZnhNd2VuMUNzQm5hejllWUUySnNIMEQ1?=
 =?utf-8?B?RDFNTzhDdUxxQzN0Rytyc2o4dllaSHQyeUdZalRGUjUxZE45VjB3N0o0MGVI?=
 =?utf-8?B?VjcxRTVRNUI1ZEZYRHlCUGdwYXJPMnlaUUlsSVN5SUlsRG5tUG1tS1d4YnVz?=
 =?utf-8?B?dGtMREpQK2JJbzZsMWFyUzJCQW5MNGdjMW5Qd21sQkd5bmV6TlBFbjlOWnVt?=
 =?utf-8?B?TXFpcHlJVHJjRG9yNUI0KzgrenBpeUFTZm15aHp2bFlPVnljUEpSUktEQXAw?=
 =?utf-8?B?bkRpYnFsQW84cTczYnhYTWowaEhxVm1WUVBTajlrTzVSTW5VcDYxVkRrL09U?=
 =?utf-8?B?MzNHZjQ3RjBla3k0aHhicUt4cDQ4ejYrMXlFck0vdDZBNnpOcmUzRmhiSVg2?=
 =?utf-8?B?aUFyZStwclg5Qlk3SGM1cDlzbk5tcUpBWkdsMGFISGZDRjFpbFYvaUZGMTQ2?=
 =?utf-8?B?S1dHQmdaVU1tRy81WVlqQTRBWkZEb3hVakJEcjNNb0NWZVQvOGNicCtWelhP?=
 =?utf-8?B?a2Z5Ulh2UXFNWTFCSHRqaUVQL0czYWtySTdVamlKb1N6VmZDZyt4RGV3ck5T?=
 =?utf-8?B?bTlRK0VzWGEveERERlhUcjEyemFwdytIK1p3Y292NjZmZ1ZiUWthZHhHUHU4?=
 =?utf-8?B?bkdsOXlibzNUV2h1Tml2MWhZbkcxV3JGWGRLMVpwaXNpdXF2R1BaSWJUYy9w?=
 =?utf-8?B?b3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <824671099D1A554584A834E4C674BB7B@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RJCOdPW9JKEBE9XoSHOY6MTJ5VSW9Az5hLM0M/zkTytIFdPPTHnB4fWKPrNKfqfPQp2AdnhzloFV9ERKg2OBG0RvPwyRzTimWp4XUWDBgNuuDgWDSV4zhlSGxYJfQFxwQ9EKLRTLhmLsKCLyS+xeR5nKz4Ylbc+7wq5x963letu4twNtPPgC3Y4p2I/IG80ZmMcA8p2CuolvFAR+cKEQubFjALkGoQEIeKyQYnSWZPs8lgVNoWvcnJa04ijsE4HTSkklqyIVK74/WUDf/hgEn0mlgB9xKEveZjs3u7Vg6/NQNpGofmGaKw4SJDgZvWPh/IenEZxHQ61UXDVI+POXyZTEXsa4HbSxPHzUO2bBlPjZ2jb4LjUx4+WY37IkdZrkju39ok/4K6d9wgtFWTRVoLbq2JU7MmZVYUd08roioI6t0bwQLm9PEzXEjbFq4TMHGITgcMN3QvVT/aKqyeDAR9IPih1PW50uKrzpHd6xLy5fQi4ODbl600D4W57UCQeNKs2Nrh4230I/XV2OncpeknkXVFRuUxmPO54LhgdhkL04C3M5YP+CLPxthNFNeQGNz6QWSguF+Qu0ghDl09rLr4uh33sqgh25qkxc2irABhI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR10MB7309.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a81bfde2-6474-4dc2-291a-08dd842ab88c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2025 18:55:17.5578
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fhyGI7iX4Ok5oZUT9NOvKnS5bgLdmWso24/VsA2wmy2W1LUne7qhZEwIjlzSYaP9OtrZv4TRG9Hjv/Z0DqMU3GGaYhkYQ7MA4/+NKVLVfLM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7363
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2504250134
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNCBTYWx0ZWRfX4PaZrvHEAq3S p3HkZD9CN1X15Y2a1T9v5VqCgyuG9XXTzgneUSzOAWUofQ41gWYoaVrxD/7pUHP/BI79m/qNZkB Ag3gCXChTYvLJLco6JDtuuDo5Xk7QljD6P+AsGZePxw2ITyW5pDePZ9PGA6DR/GgB/PhhQDr1N2
 yPRB2/I9q0CXLRIhyicIBRfOOQJrC6FEoYzN4lbD9WW/k4uZXCJ7TJiFxg2HceYj+2PIv7ISpx6 VIH4eV7oFWhlXHLix2MtL7qt/egUvZYRO0jv7PIsl4iIQrznscwbQzTh4KzXh7S88fJ/0Tgmy8y ArlptSTsJfMjR4IlKsI3xpGECNM2t1JZ72DNzU55oKY+I3m1iWI68JzNadB5LTxYmEPptpc2qd+ zgB9QNje
X-Proofpoint-ORIG-GUID: 14udsDpJ-P5P7_vQ9zmf2WLZwu99UpVW
X-Proofpoint-GUID: 14udsDpJ-P5P7_vQ9zmf2WLZwu99UpVW

DQoNCj4gT24gQXByIDI0LCAyMDI1LCBhdCAxMTo1M+KAr1BNLCBTZWJhc3RpYW4gQW5kcnplaiBT
aWV3aW9yIDxiaWdlYXN5QGxpbnV0cm9uaXguZGU+IHdyb3RlOg0KPiANCj4gT24gMjAyNS0wNC0y
NSAwMToxOTowNyBbKzAwMDBdLCBQcmFrYXNoIFNhbmdhcHBhIHdyb3RlOg0KPj4+IE9uIEFwciAy
NCwgMjAyNSwgYXQgNzoxM+KAr0FNLCBTZWJhc3RpYW4gQW5kcnplaiBTaWV3aW9yIDxiaWdlYXN5
QGxpbnV0cm9uaXguZGU+IHdyb3RlOg0KPj4+IA0KPj4+IE9uIDIwMjUtMDQtMTggMTk6MzQ6MDgg
WyswMDAwXSwgUHJha2FzaCBTYW5nYXBwYSB3cm90ZToNCj4+Pj4gLS0tIGEvaW5jbHVkZS9saW51
eC9zY2hlZC5oDQo+Pj4+ICsrKyBiL2luY2x1ZGUvbGludXgvc2NoZWQuaA0KPj4+IOKApg0KPj4+
PiBAQCAtOTMwLDYgKzkzMSw5IEBAIHN0cnVjdCB0YXNrX3N0cnVjdCB7DQo+Pj4+IHN0cnVjdCBw
bGlzdF9ub2RlIHB1c2hhYmxlX3Rhc2tzOw0KPj4+PiBzdHJ1Y3QgcmJfbm9kZSBwdXNoYWJsZV9k
bF90YXNrczsNCj4+Pj4gI2VuZGlmDQo+Pj4+ICsjaWZkZWYgQ09ORklHX1JTRVENCj4+Pj4gKyB1
bnNpZ25lZCByc2VxX3NjaGVkX2RlbGF5OjE7DQo+Pj4+ICsjZW5kaWYNCj4+PiANCj4+PiBUaGVy
ZSBzaG91bGQgYmUgc29tZXdoZXJlIGEgYml0ZmllbGQgYWxyZWFkeSB3aGljaCB5b3UgY291bGQg
dXNlIHdpdGhvdXQNCj4+PiB0aGUgaWZkZWYuIFRoZW4geW91IGNvdWxkIHVzZSBJU19FTkFCTEVE
KCkgaWYgeW91IHdhbnQgdG8gc2F2ZSBzb21lIGNvZGUNCj4+PiBpZiBSU0VRIGlzIG5vdCBlbmFi
bGVkLg0KPj4gDQo+PiBJIHN1cHBvc2Ugd2UgY291bGQuIA0KPj4gUGF0Y2ggMSBpcyBwcmV0dHkg
bXVjaCB3aGF0IFBldGVyWiBwb3N0ZWQsIGhvcGUgaGUgd2lsbCBjb21tZW50IG9uIGl0Lg0KPiAN
Cj4gSWYgaXQgaXMgInByZXR0eSBtdWNoIHdoYXQgUGV0ZXJaIHBvc3RlZCIgd2h5IGRpZCBoZSBu
b3QgcmVjZWl2ZSBhbnkNCj4gY3JlZGl0IGZvciBpdD8NCg0KU3VyZSwgaGUgZ2V0cyBjcmVkaXQu
DQpJIGhhdmUgaW5jbHVkZWQg4oCZU3VnZ2VzdGVkLWJ54oCZIGluIHRoZSBwYXRjaC4gV2lsbCBj
aGFuZ2UgdG8gU2lnbmVkLU9mZi1ieSwgaWYgdGhhdCBpcyB3aGF0IGl0IHNob3VsZCBiZS4gDQoN
Cg0KPiANCj4+IENvdWxkIGl0IGJlIG1vdmVkIGJlbG93IGhlcmUsIGNhbGwgaXQgc2NoZWRfdGlt
ZV9kZWxheSwgb3Igc29tZSB2YXJpYW50IG9mIHRoaXMgbmFtZT8NCj4gDQo+IEkgZG9uJ3QgbWlu
ZCB0aGUgbmFtZS4gVGhlIHBvaW50IGlzIHRvIGFkZCB0byBhbiBleGlzdGluZyBncm91cCBpbnN0
ZWFkDQo+IG9mIHN0YXJ0aW5nIGEgbmV3IHUzMiBiaXQgZmllbGQuDQoNCk9rLCAgSSB0aGluayB0
aGlzIHBsYWNlIGFmdGVyIOKAmGluX3RocmFzaGluZycgd291bGQgc2VydmUgdGhhdCBwdXJwb3Nl
Lg0KDQo+IA0KPj4gc3RydWN0IHRhc2tfc3RydWN0IHsNCj4+IC4uDQo+PiAjaWZkZWYgQ09ORklH
X1RBU0tfREVMQVlfQUNDVA0KPj4gICAgICAgIC8qIGRlbGF5IGR1ZSB0byBtZW1vcnkgdGhyYXNo
aW5nICovDQo+PiAgICAgICAgdW5zaWduZWQgICAgICAgICAgICAgICAgICAgICAgICBpbl90aHJh
c2hpbmc6MTsNCj4+ICNlbmRpZg0KPj4gICAgICAgIHVuc2lnbmVkICAgICAgICAgICAgICAgICAg
ICAgICAgc2NoZWRfdGltZV9kZWxheToxOw0KPj4gLi4NCj4+IH0NCj4+IA0KPj4gVGhpcyBmaWVs
ZCB3aWxsIGJlIGZvciBzY2hlZHVsZXIgdGltZSBleHRlbnNpb24gdXNlIG9ubHkuIE1haW5seSB1
cGRhdGVkIGluIHRoZSBjb250ZXh0IG9mIHRoZSBjdXJyZW50IHRocmVhZC4gDQo+PiBEbyB3ZSBl
dmVuIG5lZWQgdG8gdXNlIElTX0VOQUJMRUQoQ09ORklHX1JTRVEpIHRvIGFjY2Vzcz8NCj4gDQo+
IFdlbGwsIGlmIHlvdSB3YW50IHRvIGF2b2lkIHRoZSBjb2RlIGluIHRoZSAhQ09ORklHX1JTRVEg
dGhlbiB5ZXMuDQoNClN1cmUsIEkgY2FuIGluY2x1ZGUgSVNfRU5BQkxFRCgpIGNoZWNrIHdoZW4g
YWNjZXNzaW5nLiANCg0KPiANCj4+Pj4gc3RydWN0IG1tX3N0cnVjdCAqbW07DQo+Pj4+IHN0cnVj
dCBtbV9zdHJ1Y3QgKmFjdGl2ZV9tbTsNCj4+Pj4gLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L3Jz
ZXEuaA0KPj4+PiArKysgYi9pbmNsdWRlL3VhcGkvbGludXgvcnNlcS5oDQo+Pj4g4oCmDQo+Pj4+
IEBAIC0xMjgsNiArMTMxLDggQEAgc3RydWN0IHJzZXEgew0KPj4+PiAqIC0gUlNFUV9DU19GTEFH
X05PX1JFU1RBUlRfT05fTUlHUkFURQ0KPj4+PiAqICAgICBJbmhpYml0IGluc3RydWN0aW9uIHNl
cXVlbmNlIGJsb2NrIHJlc3RhcnQgb24gbWlncmF0aW9uIGZvcg0KPj4+PiAqICAgICB0aGlzIHRo
cmVhZC4NCj4+Pj4gKyAqIC0gUlNFUV9DU19ERUxBWV9SRVNDSEVEDQo+Pj4+ICsgKiAgICAgVHJ5
IGRlbGF5IHJlc2NoZWQuLi4NCj4+PiANCj4+PiBEZWxheSByZXNjaGVkIHVwIHRvICR0aW1lIGZv
ciAka2luZC1vZi1zdGF0cyB1bmRlciAkY29uZGl0aW9ucy4NCj4+IA0KPj4gV2lsbCBhZGQgc29t
ZSBjb21tZW50IGxpa2UNCj4+IOKAnERlbGF5IHJlc2NoZWQgZm9yIHVwdG8gNTB1cy4gIENoZWNr
ZWQgd2hlbiB0aHJlYWQgaXMgYWJvdXQgdG8gYmUgcHJlZW1wdGVkIg0KPj4gDQo+PiBXaXRoIHRo
ZSB0dW5hYmxlIGFkZGVkIGluIHRoZSBzdWJzZXF1ZW50IHBhdGNoLCB3aWxsIGNoYW5nZSDigJg1
MHVzJyBpdCB0byB0aGUgdHVuYWJsZSBuYW1lLg0KPiANCj4gQSBwcm9wZXIgZGVzY3JpdHB0aW9u
IG9mIHRoZSBmbGFnIHdvdWxkIG5pY2UuIFRoZSBjdXJyZW50IHN0YXRlIGlzIHRoYXQNCj4gSSBj
YW4gZGVyaXZlIG1vdmUgZnJvbSB0aGUgY29uc3RhbnQgdGhhbiBmcm9tIHRoZSBjb21tZW50Lg0K
DQpXaWxsIG1vZGlmeS4NCg0KPiANCj4+Pj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9lbnRyeS9jb21t
b24uYyBiL2tlcm5lbC9lbnRyeS9jb21tb24uYw0KPj4+PiBpbmRleCA2YjdmZjFiYzFiOWIuLjk0
NDAyN2QxNDE5OCAxMDA2NDQNCj4+Pj4gLS0tIGEva2VybmVsL2VudHJ5L2NvbW1vbi5jDQo+Pj4+
ICsrKyBiL2tlcm5lbC9lbnRyeS9jb21tb24uYw0KPj4+IOKApg0KPj4+PiBAQCAtOTksOCArMTAw
LDEyIEBAIF9fYWx3YXlzX2lubGluZSB1bnNpZ25lZCBsb25nIGV4aXRfdG9fdXNlcl9tb2RlX2xv
b3Aoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsDQo+Pj4+IA0KPj4+PiBsb2NhbF9pcnFfZW5hYmxlX2V4
aXRfdG9fdXNlcih0aV93b3JrKTsNCj4+Pj4gDQo+Pj4+IC0gaWYgKHRpX3dvcmsgJiAoX1RJRl9O
RUVEX1JFU0NIRUQgfCBfVElGX05FRURfUkVTQ0hFRF9MQVpZKSkNCj4+Pj4gLSBzY2hlZHVsZSgp
Ow0KPj4+PiArIGlmICh0aV93b3JrICYgKF9USUZfTkVFRF9SRVNDSEVEIHwgX1RJRl9ORUVEX1JF
U0NIRURfTEFaWSkpIHsNCj4+PiANCj4+PiBjb3VsZG4ndCB3ZSByZXN0cmljdCB0aGlzIHRvIF9U
SUZfTkVFRF9SRVNDSEVEX0xBWlk/IFRoYXQgd2F5IHdlIHdvdWxkDQo+Pj4gc3RpbGwgc2NoZWR1
bGUgaW1tZWRpYXRlbHkgZm9yIGFueSBTQ0hFRF9GSUZPL1JSL0RMIHRhc2tzIGFuZCBkbyB0aGlz
DQo+Pj4gZGVsYXkgb25seSBmb3IgZXZlcnl0aGluZyBlbHNlIHN1Y2ggYXMgU0NIRURfT1RIRVIv
4oCmDQo+PiANCj4+IA0KPj4gV2FzbuKAmXQgdGhpcyB0aGUgZW50aXJlIGRpc2N1c3Npb24gYWJv
dXQgd2hldGhlciB0byBsaW1pdCBpdCB0byBTQ0hFX09USEVSIG9yIG5vdD8NCj4+IFdpbGwgZGVm
ZXIgaXQgdG8gUGV0ZXIuDQo+IA0KPiBPaC4gQnV0IHRoaXMgc3RpbGwgZGVzZXJ2ZXMgYSB0cmFj
ZSBwb2ludCBmb3IgdGhpcyBtYW5vZXV2cmUuIEEgdHJhY2UNCj4gd291bGQgc2hvdyB5b3UgYSB3
YWtldXAsIHRoZSBuZWVkLXJlc2NoZWQgYml0IHdpbGwgYmUgc2hvd24gYW5kIHRoZW4gaXQNCj4g
d2lsbCB2YW5pc2ggbGF0ZXIgYW5kIHBlb3BsZSBtaWdodCB3b25kZXIgd2hlcmUgZGlkIGl0IGdv
Lg0KDQpJIGNhbiAgbG9vayBhdCBhZGRpbmcgYSB0cmFjZXBvaW50IGhlcmUgdG8gaW5kaWNhdGUg
YSBkZWxheSB3YXMgZ3JhbnRlZCBhbmQgbmVlZC1yZXNjaGVkIGJpdCBnb3QgY2xlYXJlZC4NCg0K
DQo+IA0KPj4+IA0KPj4+PiArICAgICAgIGlmIChpcnEgJiYgcnNlcV9kZWxheV9yZXNjaGVkKCkp
DQo+Pj4+ICsgICAgICAgY2xlYXJfdHNrX25lZWRfcmVzY2hlZChjdXJyZW50KTsNCj4+Pj4gKyAg
ICAgICBlbHNlDQo+Pj4+ICsgICAgICAgc2NoZWR1bGUoKTsNCj4+Pj4gKyB9DQo+Pj4+IA0KPj4+
PiBpZiAodGlfd29yayAmIF9USUZfVVBST0JFKQ0KPj4+PiB1cHJvYmVfbm90aWZ5X3Jlc3VtZShy
ZWdzKTsNCj4+Pj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9zY2hlZC9jb3JlLmMgYi9rZXJuZWwvc2No
ZWQvY29yZS5jDQo+Pj4+IGluZGV4IDE2NWM5MGJhNjRlYS4uY2VlNTBlMTM5NzIzIDEwMDY0NA0K
Pj4+PiAtLS0gYS9rZXJuZWwvc2NoZWQvY29yZS5jDQo+Pj4+ICsrKyBiL2tlcm5lbC9zY2hlZC9j
b3JlLmMNCj4+Pj4gQEAgLTgyMyw2ICs4MjMsNyBAQCB2b2lkIHVwZGF0ZV9ycV9jbG9jayhzdHJ1
Y3QgcnEgKnJxKQ0KPj4+PiANCj4+Pj4gc3RhdGljIHZvaWQgaHJ0aWNrX2NsZWFyKHN0cnVjdCBy
cSAqcnEpDQo+Pj4+IHsNCj4+Pj4gKyByc2VxX2RlbGF5X3Jlc2NoZWRfdGljaygpOw0KPj4+IA0K
Pj4+IFRoaXMgaXMgY2FsbGVkIGZyb20gX19zY2hlZHVsZSgpLiBJZiB5b3Ugc2V0IHRoZSBuZWVk
LXJlc2NoZWQgZmxhZyBoZXJlLA0KPj4+IGl0IGdldHMgcmVtb3ZlZCBzaG9ydGx5IGFmdGVyLiBE
byBJIG1pc3Mgc29tZXRoaW5nPw0KPj4gDQo+PiBocnRpY2tfY2xlYXIoKSBpcyBhbHNvIGNhbGxl
ZCB3aGVuIHRoZSBjcHUgaXMgYmVpbmcgcmVtb3ZlZCBpbiBzY2hlZF9jcHVfZHlpbmcoKS4NCj4+
IFdlIG5lZWQgdG8gc2V0IHJlc2NoZWQgdGhlcmU/DQo+IA0KPiBEbyB3ZT8gTXkgdW5kZXJzdGFu
ZGluZyBpcyB0aGF0IHRoZSBORUVEX1JFU0NIRUQgZmxhZyBnZXRzIHJlbW92ZWQgb25jZQ0KPiBh
bmQgdGhlbiBSU0VRX0NTX0RFTEFZX1JFU0NIRUQgZ2V0cyBzZXQuIFJTRVFfQ1NfREVMQVlfUkVT
Q0hFRCBpbiB0dXJuDQo+IGdldHMgY2xlYXJlZCBpbiB0aGUgc2NoZWR1bGVyIG9uY2UgdGFzayBs
ZWF2ZXMgdGhlIENQVS4gT25jZSB0aGUgdGFzaw0KPiBsZWZ0IHRoZSBDUFUgdGhlbiB0aGVyZSBp
cyBubyBuZWVkIHRvIHNldCB0aGUgYml0LiBUaGUgc2NoZWRfY3B1X2R5aW5nKCkNCj4gaXMgdGhl
IEhQIHRocmVhZCBzbyBpZiB0aGF0IG9uZSBpcyBvbiB0aGUgQ1BVIHRoZW4gdGhlIHVzZXIgdGFz
ayBpcw0KPiBnb25lLg0KDQpPaywgd2lsbCByZW1vdmUgdGhpcyBjYWxsIGZyb20gaHJ0aWNrX2Ns
ZWFyKCkNCg0KVG8gY2xhcmlmeSwgUlNFUV9DU19ERUxBWV9SRVNDSEVEIGJpdCB1c2FnZSBpcyB0
aGF0IGl0IGlzIHNldCBieSB1c2VyIHRhc2sgaW4gdGhlIHJzZXEgc3RydWN0dXJlLCB0byByZXF1
ZXN0IGFkZGl0aW9uYWwgdGltZSB3aGVuIGVudGVyaW5nIHRoZSBjcml0aWNhbCBzZWN0aW9uIGlu
IHVzZXIgc3BhY2UuDQpXaGVuIGtlcm5lbCBzZWVzIHRoaXMgc2V0IGluIGV4aXRfdG9fdXNlcl9t
b2RlX2xvb3AoKSwgd2hlbiB0aGUgdGFzayBpcyBhYm91dCB0byBiZSByZXNjaGVkdWxlZCwgaXQg
Y2xlYXJzIHRoZSBSU0VRX0NTX0RFTEFZX1JFU0NIRUQgYml0IGluIHRoZSDigJhyc2Vx4oCZIHN0
cnVjdHVyZSBhbmQgc2V0cyB0aGUgdC0+cnNlcV9zY2hlZF9kZWxheT0xIGluIHRhc2tfc3RydWN0
IHN0cnVjdHVyZSBhbmQgdGhlIGhydGljayA1MHVzIHRpbWVyIGlzIHN0YXJ0ZWQuIA0KDQpXaGVu
IHRoZSB0aW1lciBmaXJlcywgaWYgdGhlIHRhc2sgaXMgc3RpbGwgcnVubmluZyhpZS4gaGFzIHQt
PnJzZXFfc2NoZWRfZGVsYXkgZmxhZyBzZXQpLCB0aGUgdGFzayB3aWxsIGJlIHJlc2NoZWR1bGVk
LiBJbiBfX3NjaGVkdWxlKCkgd2hlbiB0aGUgdGFzayBsZWF2ZXMgdGhlIGNwdSwgaXQgd2lsbCBj
bGVhciB0LT5yc2VxX3NjaGVkX2RlbGF5IGZsYWcuDQoNCg0KPiANCj4gSG93IGRvZXMgdGhpcyBk
ZWxheSB0aGluZ3kgd29yayB3aXRoIEhaPTEwMCB2cyBIWj0xMDAwPyBMaWtlIHdoYXQgaXMgdGhl
DQo+IG1vc3QgeW91IGNvdWxkIGdldCBpbiBleHRyYSB0aW1lPyBJIGNvdWxkIGltYWdpbmUgdGhh
dCBpZiBhIHNlY29uZCB0YXNrDQo+IGdldHMgb24gdGhlIHJ1bnF1ZXVlIGFuZCB5b3Ugc2tpcCB0
aGUgd2FrZSB1cCBidXQgdGhlIHJ1bnRpbWUgaXMgdXNlZCB1cA0KPiB0aGVuIHRoZSBIWiB0aWNr
IHNob3VsZCBzZXQgTkVFRF9SRVNDSEVEIGFnYWluIGFuZCB0aGUgZm9sbG93aW5nIEhaIHRpY2sN
Cj4gc2hvdWxkIGZvcmNlIHRoZSBzY2hlZHVsZSBwb2ludC4NCg0KVGhlIG1vc3QgYSB0YXNrIGNh
biBnZXQgaXMgNTB1cyhvciB0dW5hYmxlIHZhbHVlIGZyb20gcGF0Y2ggMikgZXh0cmEgdGltZS4g
WWVzLCBpZiBydW50aW1lIGV4cGlyZXMgd2l0aGluIHRoZSA1MHVzIGV4dGVuc2lvbiB0aGF0IHdh
cyBncmFudGVkIGFzIHBhcnQgb2YgYSB3YWtldXAsIGl0IHdpbGwgZ2V0IHJlc2NoZWR1bGVkIGFz
IE5FRURfUkVTQ0hFRCBpcyBzZXQgYnkgSFogdGljayB3aGljaCBjb3VsZCByZXN1bHQgaW4gc2hv
cnRlciB0aGUgNTB1cyBleHRyYSB0aW1lLiAgV2h5IGRvIHlvdSBzYXkgZm9sbG93aW5nIEhaIHRp
Y2s/LCBpbiB0aGF0IGNhc2UgdGhlIDUwdXMgdGltZXIgd291bGQgcmVzY2hlZHVsZS4gDQoNCklm
IHRoZSA1MHVzIGV4dGVuc2lvbiB3YXMgZ3JhbnRlZCBhdCB0aGUgZW5kIG9mIHRoZSBydW50aW1l
IGR1ZSB0byBIWiB0aWNrLCBpdCB3aWxsIGdldCByZXNjaGVkdWxlZCB3aGVuIHRoZSA1MHVzIHRp
bWVyIGZpcmVzLg0KDQpBbHNvLCBpZiBhIHdha2V1cCBvY2N1cnMgYW5kIHRoZSB0YXNrIHJ1bm5p
bmcgaGFzIHRoZSA1MHVzIGV4dGVuc2lvbihyc2VxX3NjaGVkX2RlbGF5IGlzIHNldCksIGl0IHdp
bGwgYWdhaW4gZ2V0IHJlc2NoZWR1bGVkIGJ5IHJlc2NoZWRfY3VycigpIGlmIGl0IGlzIFRJRl9O
RUVEX1NDSEVELg0KDQpJZiB0aGUgdGFzayBvbiB0aGUgY3B1IGhhcyB0LT5yc2VxX3NjaGVkX2Rl
bGF5IHNldCwgc2hvdWxkIHdlIGNvbnNpZGVyIGF2b2lkaW5nIGZvcmNlIHJlc2NoZWR1bGUgaW4g
dGhlIGFib3ZlIHNjZW5hcmlvKGJvdGggcnVudGltZSBleHBpcmUgYW5kIHdha2V1cCksIGFzIHRo
ZSB0YXNrIHdvdWxkIGJlIHJlc2NoZWR1bGVkIGJ5IHRoZSA1MHVzIHRpbWVyPw0KIA0KUHJha2Fz
aA0KDQo+IA0KPj4gVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzLg0KPj4gLVByYWthc2guDQo+IA0K
PiBTZWJhc3RpYW4NCg0K
