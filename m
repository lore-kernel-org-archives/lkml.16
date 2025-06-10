Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CEB239E9B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749573097; cv=fail; b=gLRQT1aiPva7vvy7eb7LkUPA7qAT2KH5OX1rLSl6JM9fytpOzi7sSN5pdcXcf9IAlR8123fxlAe0OBcIRvH/kvSxpMk1ZXKfxKGI/uDHJBJ2gZVvO8GXZ3Trq085f09RfG2YCdbePjmHN9BJoMf0ig0nq27lH2jJqBm83IrIMYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749573097; c=relaxed/simple;
	bh=BphFDygacmnI0Dwr+gbzvi4K8txX3cq0dAkDKg5JQdg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QC2FK/TteIIE7+1shQjIXrXRPLpn+cmzdXCN+lwe3z0HoObZTp7XMZC+8fvVF+lFHMHNeaTi3UGQKZ8RSXgkZtBjJABR9pOhCENxy9D18HJGUPa3mv2iDgYiC9pNxvrPL40y4OaaPSH533AejOnA7Ys1XyEKV3J9IeOwypG7RQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PeZUnB1Q; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=H9S/nMqY; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PeZUnB1Q";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="H9S/nMqY"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AGMadN008666;
	Tue, 10 Jun 2025 16:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=BphFDygacmnI0Dwr+gbzvi4K8txX3cq0dAkDKg5JQdg=; b=
	PeZUnB1QkMHxive+y6M7cYJkciiGNnydr13kqeeo9jfo+WFJ33U/arLfDaL1vZb9
	zN6lmdd5FJ4QyXo+KleYWFYHeCVrbRvhg6tDisgoN9Twkjb7U5dPIS3e0fYzsghW
	phsmFBVAbF8VxC4twV4DE2SkU5BNybb+zrGKRVPUPG08cPXachSoOtUQekQBQ3ZW
	9wFw22mBM1i68OWe6nlvyWaeNVACjfwoTKcPhvxrNsc+Wtke6ERjvTtX7vxgRmvJ
	hRExDOzUtGRD+KFNnfVK4f9TVzeRmDsdfQOpZBeF8t9dKM33bXIVdyRYpNcRQ2nN
	GTp6la9W+UUER3Ev5DOP4Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474cbecmdc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jun 2025 16:31:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55AErB0B020312;
	Tue, 10 Jun 2025 16:31:08 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010030.outbound.protection.outlook.com [52.101.193.30])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bvf6vns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jun 2025 16:31:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nImo63xWqicpFEG5kP0+uBJPlfU0ZT94cxAAyWEr5R6HxWm91cUokNXpgGpWOsUtTS8o2kJBmJkVtWE0GY9B/a9MADsmRkmjEZ51QJdX+taWjU4UaZf9BKCeWCrh3teIJHe8TCA6YZrUzvmJJQVJmgReFca8sWTiz6+gqUkVRTIHxtbcweYjnR7CTFucsK8onMFR7EFULJp34LIVLD1pnJeI+5gxUs6IopgIYfhW1wMsr3WHY054L0ZrUIn1xrOou89x2sEiCx9DVRWStAFPBh7brSLHR5/l5we760yxWSQTDpYUUEpE58W19W42NJDu6DSE/LlKZtWlwkVg6nsRng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BphFDygacmnI0Dwr+gbzvi4K8txX3cq0dAkDKg5JQdg=;
 b=xJIlV3rxogTscAF0POfiGmzHsUYUwNWLOkgCyatUjTdSyTQ/wU9lFk2QOWWKpDiBOBBHPIcLTHn9tmqK4M0f2Yt60Qw2WKZhNfn18SMGpNFols5vZBojBgND6s6A3OJnVsyHm3QZaz1Q9G6N8kHoeSMj5Eb9zsjf0BsrcgC/aopPQJDlwlu9UPgIzwfkZT0dw1dp1Am+GjS0Hm/bY9imJ3baRfvOXoXRM/M3SIK7Axq7/zmgJNUuvxEm5IY0nQEDhbHDhplx0gGeI795nfraaN4SlIxSV3WUFlcOYXW6X1ugelrvQJiEJ8wQsFkdavCX2hKFKrJQYAYaRQHm5GjjtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BphFDygacmnI0Dwr+gbzvi4K8txX3cq0dAkDKg5JQdg=;
 b=H9S/nMqY/4B+K3viyy+JBH4yNZXCn+HOOws+m0pMCRho9CgnqA5Fpo3AGVeIaLdktsMbMiXb3iSLHqZbvRyT+P0WlH37M+OWfLT4CHO3ic/6DNck6FH4xwm6Vb68u1w2pJwQCV1heGnbCkP33hBm6fGBtGAzAKbEDi6X+Zq7uoc=
Received: from IA1PR10MB7309.namprd10.prod.outlook.com (2603:10b6:208:3fe::13)
 by SJ2PR10MB7785.namprd10.prod.outlook.com (2603:10b6:a03:56b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Tue, 10 Jun
 2025 16:31:06 +0000
Received: from IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a]) by IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a%4]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 16:31:06 +0000
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
 AQHb1V0mtwlUIwQHSki21OTBoge6R7PzFm+AgAArT4CAAB/SgIAH9WMAgAAKn4CAAT3HgA==
Date: Tue, 10 Jun 2025 16:31:05 +0000
Message-ID: <7BA85550-4E33-4C5B-B855-716512D2105E@oracle.com>
References: <20250603233654.1838967-1-prakash.sangappa@oracle.com>
 <20250603233654.1838967-2-prakash.sangappa@oracle.com>
 <20250604103106.1465f847@gandalf.local.home>
 <20250604145433.KCPMF8zm@linutronix.de>
 <80120491-7F90-4171-9FB8-9FE89B09F728@oracle.com>
 <20250604192327.sVjt6c4u@linutronix.de>
 <20250609165532.3265e142@gandalf.local.home>
 <20250609173333.6e0b6a55@gandalf.local.home>
In-Reply-To: <20250609173333.6e0b6a55@gandalf.local.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR10MB7309:EE_|SJ2PR10MB7785:EE_
x-ms-office365-filtering-correlation-id: 1ef8bc87-e13b-4025-df5e-08dda83c32cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VEk1dUV6WERhc0EyU2ZGVXVON0JoY2h6K0dObm9lVGdIZ2RQTXUzanNLM1dH?=
 =?utf-8?B?TUdUL21kZ3ZuUldBYTQ0NFVXNUxTblpaejFrNUJabVZQODZjbnFGZVo5Yi9j?=
 =?utf-8?B?Y1JEa3NrTTgyTndzY0FTaHZ5Sm9rd215cXVhenc3UzVWbElHb2xLQlFzOWxz?=
 =?utf-8?B?NDVPSEFURkMycUtWREx4dWNUVHVSM2hDYjJPTlB6ZEdPbHJ6QTk1aFI1MFNq?=
 =?utf-8?B?amdaL0I4aHZ2Qm1kSkJzZEYwRlpOOGRZSDE5T1B4a055MnpOYXJnamsxSnk0?=
 =?utf-8?B?QjA1ZWwzU1BIT1dOVzFUbW5uTEk2Si9XYXV1ZkxkRWFoelRxd25WMzRvRndT?=
 =?utf-8?B?UnRSRzFBSWFzRDNPc3JmY0YvaEF6bCs5L0RyemNzQkpRc25HNmJIWENITzZi?=
 =?utf-8?B?bXNialdOL1ZEUzRGUnJtTTNkb05pN2djclZPb25oalBwRitvWWt1Qm92SWVw?=
 =?utf-8?B?dk5tM1VsbHNZU2Y0akhUZ3BOZWZkNTNlQnh6V2FtTUJjc2tNRHF4Tmh1S1Rh?=
 =?utf-8?B?N0Vlay9PcnRoTnZtdk1WWnAyb2ppbzRoWlgvMHhFK0xXbnByOGQzRGFDeUNW?=
 =?utf-8?B?OGNpSDI2WDRiK2tnZi9IWTFpRExRMWZhQ0FpSUlFMytMWUtIWlMxR0VvZEFy?=
 =?utf-8?B?ZFpjb2kyVHRtdlNuQkJVSGhZcGcyRmpLR2F3U0ppVm1Kb0c3TDZKSFNqaVVF?=
 =?utf-8?B?SmhkcWlwMjRKcUNkUC9nQzl4ZkZ6djgyWnBBVVJyd1RVS3Vmdmx5NzRXWU9r?=
 =?utf-8?B?VnVtQTYxUGEvZGc3OEJRY0xZRjBodVhoSklxcW5zb0NUcDlNemNMbWx2Ry93?=
 =?utf-8?B?NkdRQzB3MHpKdmQzSkEyemVvQzFIQ3pBZi9SWWNrbGl5OWFJTVRUSWFBUEI4?=
 =?utf-8?B?cFV4aTJGczJyVnB2eVNBWmtUSXQ0dFA4Q3pRak9kRG1pMlMwd3B5Z3hCU2hQ?=
 =?utf-8?B?TWxXSkE2OWlNc3psUm4yT25oNFB1UG1FcDFxOFN6ZjBqS0l6a09tS2R6UE1G?=
 =?utf-8?B?Y3VHcnZYcE9OUUFtUVVUQWY4VWt2NFU5V3hYUjAxRlNXeEl2K1dzUE1scW5v?=
 =?utf-8?B?dTh5azNVMzQxTktMQU5VQStIV3N3dThHaUZJTGtVcG1aSWZmcllvRW9JV1pP?=
 =?utf-8?B?TG94dmRrMGQxdGVEcjdodEs0WEZ6UWlGNmg0TGJvTC9mRHB2cUNVRzh5ZXFP?=
 =?utf-8?B?eWEvOGFWTjBEVVpNaEd3emVyZEs0ZlVkbG16M3VKNHRPTS9MNFp1YTcvU04r?=
 =?utf-8?B?UTNCK1pkS2RjV2duU2xVcGIybStIRFpIWU1LRWVlNXA2YmJRK0hhaGVOc3Iy?=
 =?utf-8?B?RWk4am5mT2hoTCtzR1l4MFV4TU13eUxRUTFxWmV1RGxsVFpOUC9HUy9oMW5z?=
 =?utf-8?B?L1l5MXc2aC9JSG9uVEZtbEhKRndlZEtZRW5VWEVxOXc3a1pYYWs2MmF0UDd5?=
 =?utf-8?B?MTc4Y1JQZHJ5d0dWREovV2ErSi9xZ3ZDQmtIa1NlMUJzSkxVbHpHdFg0VnZh?=
 =?utf-8?B?NUwvbitheDVVcFl6MnRvQW1ucUQ5VktHQVF1TENpNEYvbkdWWGE3Z2ljMEJT?=
 =?utf-8?B?dEFUWXZHeDM0VlVmUEw0dFRLYVFFc3hINlpGRmxWRGhxZEV2dVJJTlFUOEJV?=
 =?utf-8?B?YWNzbCswUW1QT25ESnRUblBIYmxhVEV1LzlDTjNFMGxVbDVwRFB2Y0YrclJE?=
 =?utf-8?B?YlhGQjYwSFVPd2JucGM2Z1RhcXRGTTdsS3FnenZWczBFRmdjUWpFNWJRcSty?=
 =?utf-8?B?ZTlTMjgwQmRkdFpqSWdMNngrUEliNUIvQk5nZkxCZGIzb1ljV3RxZXhlaEU1?=
 =?utf-8?B?ajd3UnNJbHoxTmdIQS82M1BlSVFGd0J1dGxVQmdFVnE0NVpoQkRvM0JqWkhQ?=
 =?utf-8?B?TzRKakJkRW8wdjdMY01zQ2taTDlrdzZ6MmFOYlQxTlRGMEpSa2psbXA1enF6?=
 =?utf-8?B?dzEwVmlPMEJqQktnRGR6R09tSFJXYzRxR2hZT2RPdGNVdzNRV1ZLUSt4YzF6?=
 =?utf-8?Q?iL43POyH8CXlVitTDToiPr+YiGSrrk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR10MB7309.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UDRqMEZRSlB6K1RDZGZyQys5bGUyeG5QdFVUVVlOZUZOdUFaS2hFdlRrOEpV?=
 =?utf-8?B?SVMyMlhFOFhIQ21BUEZEZGx4amErZTRIdVAvZDM3bFV4c0sxM2IzOXgzWS9l?=
 =?utf-8?B?V1NlQXNaWHZDVUJHWFVTZHJ1N0VxVG0yY2o0VlQwcjUrYzhMNitRVTdyOTdK?=
 =?utf-8?B?bEU1NlpXaVN1eU9LME9CdUxHQi90Wm5CNG1TV0hqV1RzeVRZNFRzVkszUEdw?=
 =?utf-8?B?ZGxLajNnL3NTRmRYMmhqZmJWM0xsQzBWUEk1U2Zmb0I2UUdiVy9SSHgxYUps?=
 =?utf-8?B?OHJUbi8raU5BKzlzTmhyeFNEdGROTDdWMHVhQ1drWW5ObWprcGVrREowUTNs?=
 =?utf-8?B?NFIyMWJKT3R4QTc1b3dpMTV2VmM1aCttcGVBOHZzZW1CeWZSUTdUWDd4Nm5m?=
 =?utf-8?B?VGpTMkxZTHdnU3V0MlRGaGxwZHl6c2VOeisrNTVvdWNyNVkybk1GV3dKTmkv?=
 =?utf-8?B?RCsxbFBOdi9JSW05WStmY3hwTXpPR3BzbW1GQTBVa3hEZmtUVVkzWmZpbE1N?=
 =?utf-8?B?d0k3SUtnbW1Bb29aNEFjc3ZabWNmWENtbDFVU3ROYzlkVWlYUi9PNXFNY2Zj?=
 =?utf-8?B?SWdTdmIvMjI0ZWRCdHRPS0tYZTNOR1R1UFRjVWkvVHBpNkwvWWMvdlZJRnZE?=
 =?utf-8?B?enhlUlZrMmFDUFh1bCs5MWlNVTRrcmNlVW9objlNK3VZKzYyeWlVWWlKeEVu?=
 =?utf-8?B?eXdLZTlzMllQZHo2bTR4ME42V3RDSm5WUGtYdVQxNGEvRzlPbUQzeS9sS1F2?=
 =?utf-8?B?NzhSS3NBamZreVRxQmFEd0UzRHJ3UnBrajVqeHNxK1JDV3NZREVmSWI3dUhN?=
 =?utf-8?B?T3dHSHdJTVBFd3VBblFBdk85bGJMTEtJQ3cwUU8rRmxGOXlOWDRja0w2cFlF?=
 =?utf-8?B?S3hWYnJ4bEthODRaZkNHeUFVSXdkdmRDTVI2eU1YeTdpU2FoVlFub0xRKzM0?=
 =?utf-8?B?eFkxVzlVM1kvZ3R4UGwrS2lpTkl3OCs2Q1lUWHIrWDVCVXc2Z0VFYjVzNWJq?=
 =?utf-8?B?ZWdFeWVHUVIvZkpPZk5QWmdHYm42NFI2bC8yRHpoOXNvYk5yb3JiNjg2MUV4?=
 =?utf-8?B?RmUzblJHcmR6WHF6L09UMTE0ZTVEZndZOE1jY2VLSEVtUnd4cmcvRUp2eXUv?=
 =?utf-8?B?T1d2bjRZeUd0OHBUd1VXL0s2WjVNODhIaTc5VTBGZnJxREJyeU9udFAxa1kr?=
 =?utf-8?B?V0FXd3ZKcFBUTVU0ZUp3cGxxbHhxYVFtY09aMVVUYUFDM0pCdXFWTGtWcitE?=
 =?utf-8?B?R3Q4L2Y3RWJiRXlQWFdjcCtFSmE2TVZCZ2N6NjNqUHFJWS9RWTlXMEZqSldw?=
 =?utf-8?B?QmhHQTlxbDdrZTJobDJZL0VsM2dMRi9paUVHVkFEUnNBWk9ZYXczcG01bkpy?=
 =?utf-8?B?TmNCWENDdXhmSG5NS0xabUQ2K2p5YjRRSVFUKzAyNkc4ZUkxU05LY0Z0d3BO?=
 =?utf-8?B?V2dvRDNTZU1GOHFVNEZocFZPQnZxN2IxUmFONHNhTHhKT2pxeVgzbnNncVlL?=
 =?utf-8?B?UWh5NUVTdnYzcTV2elR0SXpOSnVTRFlpa2RxQWdkOC9XcElEeVM2SzE4V2s4?=
 =?utf-8?B?VTFvb0xhYWdRSTNDQkhqcm9nSW1jdDV1c0dkakEvWStPcXZvTXJCbUFTTmp6?=
 =?utf-8?B?eWUvUm44VUdITHI1UmVKWDM4RnB1a2t2akFCQTE1ZXZnNGQrQ01OblROSDho?=
 =?utf-8?B?K3NMVUY0L0VlVW9uaTJLSmpuTUM0RWlaVUdVMklOQ25lNnhpZ2pyUzRVRU5R?=
 =?utf-8?B?L1lyNjF2NTJkb3R3eVByYWhKalRGcDQ1eVhMbHU3clJ1UVdDUkVpa2w0ZG9i?=
 =?utf-8?B?YkhLUzVLZzM3K3ExSGRNUmFJQUVCeWNqK1pKeHBMRU5kMlZIWXZZY1J4a3F3?=
 =?utf-8?B?OWJ4MndyN3BranV0MUVmUTQwQmQvR2FUOUJwQzBqaDZockJlQ1U4V1RWbVNN?=
 =?utf-8?B?S1dGVnM4NFFNd3l3N21KT1NZQm9MQUVGenVzdkhDVThZVmZuSys5YmVOM2Vz?=
 =?utf-8?B?YWViSUFoVlVucjFwSi92SHhvTGxzKzN2OU03MnE3bWJHalo4NVJ0VGR4WkpV?=
 =?utf-8?B?NmJTa25na3U1cC9HWWc3M1I3NkdtQ2xWNE1PVTFnUzNHRDdSdmhkeE1mUFlp?=
 =?utf-8?B?OVRpQnVveVFoU3JyamhYSEliRHlJQ2NVQmxKaG1WS05LRUNpRWVpUmlaQlc3?=
 =?utf-8?Q?U65+4PXmSBwkrdhu8YVFklA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <41EDB0C0F6C369439FBBFA0F52CAFD22@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dp+yXdIszCvDJvXKgnrGXbXolsDJ2S9hLIbYQY7RQUT0HqvsJMPKOoUF0JnCgJmCyAdVfDdcHkf193wwDTeH9XNJK1p01KMlWCNCv+eEJKKEaZH305IoXeoRcWZJcGeXTCL/oTBaneuYLxbF0Zw0UwSt8O0AlOzctBWR8BIrh0TcQ/iMfAQz/LmogTsiQ7pIO+1CoM+qYwNLPx3F2i6BjAg0P/vcJwGpfRgeT+tHg/mvC1H9oSA3byaJ+g2TKcMmcMPLNlgzyBMz8gZniG1QCXlmg+R54ShHzbZxBsSEblrq/gun5VPld1Q62R+WxmBnUNPfi3/tbs8d4ZtBiaNiCZ4vlAVdEc2Z8zqtzKw/vb85mnqoW+l9bnO9NHEXqvgpDV2VpNjH8YzX/zLqc4cbAwSMOQ+ll43+Ik2AwUEuWSeOIN1/7F//0F8TCSpLqJwtZ57XK3F2YH/RDSwV6jSwF3VKHbYU8TVz7KCyIGGAL4B4B8J7W3aCs2batt4yr0Fvu91PUqQ3jjWMnXvuh8w4gsnMPgozfrHnWYLaRQ0XXgr2q71K5TYE0um8wzFdgNxH58vNmpFxxUzyir/ccDJRlKBT/7tFn4PBGUw5DcZZlmA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR10MB7309.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef8bc87-e13b-4025-df5e-08dda83c32cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2025 16:31:06.0133
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jeyR3XYHmMEHsa53R0VlX51s+HI7vxDhzzQkP1xmpgf6lUIJFCqnBVmnrn/0eKEnGZcvb6eT8alh1PKaWnFYy0wdjXpKpwuos/ypaX0BR8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7785
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_08,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506100133
X-Proofpoint-GUID: YNQuZwUrPiPsZEG6wnkJGSC1QMpoPG9s
X-Authority-Analysis: v=2.4 cv=BffY0qt2 c=1 sm=1 tr=0 ts=68485dce b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=meVymXHHAAAA:8 a=NcQU9QekM0A94MoTWtQA:9 a=QEXdDO2ut3YA:10 a=2JgSa4NbpEOStq-L5dxp:22 cc=ntf awl=host:13207
X-Proofpoint-ORIG-GUID: YNQuZwUrPiPsZEG6wnkJGSC1QMpoPG9s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEzMyBTYWx0ZWRfX6rMqpKnHPFy+ f4gRJg+n9RXxqGAkCLdT4/udAk25Wr6Zb1ZjwRbm0ww8JJ+KaMaTgYWKFtwcNVQI5Q9jjliE4lu uvBlyy9SaNgWtXKIvTbI/vzKM7aKec2oilFhNqXYwXDRhgd346Gq7n/uOMBK5f29qDrtS1odx5F
 Zqg0d5Y038rWS+i5/tzqlhPEMmPcNWdxhsdPxRPpS/1gwcl5Gir2dr5cOIWoUBjmo0SirBCsGLQ ghAyao3liQreRVMhb4DWkMu0uGIuXyA7SUFD9FkIQuyYeqfRcdkU4P18JjM0eK3XoOzJkatfgMX oIe694PDkm6slMRWDEDztuJivNsXrQM6dpUJhGQJs0B4pHoI2Titq54AKgCXqGcGNNBPQaEex/s
 bqDmge592k9iiAmntuVug/npQsi99xGpo/iVrqYP6pgxmvjSHOXQxXfVh8rRdafipHJz65xp

DQoNCj4gT24gSnVuIDksIDIwMjUsIGF0IDI6MzPigK9QTSwgU3RldmVuIFJvc3RlZHQgPHJvc3Rl
ZHRAZ29vZG1pcy5vcmc+IHdyb3RlOg0KPiANCj4gDQo+IE5vdyBJIHB1dCB0aGUgbWFjaGluZSB1
bmRlciBsb2FkLg0KPiANCj4gSW4gb25lIHdpbmRvdyBJIHJhbjoNCj4gDQo+ICAkIGNkIGxpbnV4
LmdpdA0KPiAgJCBtYWtlIGo9MjANCj4gDQo+IFsgVGhpcyBpcyBqdXN0IGEgOCBjb3JlIG1hY2hp
bmUuIEkganVzdCBub3RpY2VkIHRoYXQgSSBoYXZlIGlzb2xjcHVzPTMgc28NCj4gb25seSA3IGFy
ZSBydW5uaW5nIF0NCj4gDQo+IEFuZCBpbiBhbm90aGVyIHdpbmRvdyBJIHJhbjoNCj4gDQo+ICAk
IHdoaWxlIDo7IC4vaGFja2JlbmNoIDUwOyBkb25lDQo+IA0KPiBUaGlzIG1hZGUgdGhlIHN5c3Rl
bSBoYXZlOg0KPiANCj4gfiMgY3ljbGljdGVzdCAtLXNtcCAtcDk1IC1tIC1zIC0tc3lzdGVtIC1s
IDEwMDAwMCAgLWIgMTAwMA0KPiAjIC9kZXYvY3B1X2RtYV9sYXRlbmN5IHNldCB0byAwdXMNCj4g
cG9saWN5OiBmaWZvOiBsb2FkYXZnOiAzOC44NCAxOS44OSA4LjA1IDI5LzI2MDkgODAzODcgICAg
ICAgICAgIA0KPiANCj4gVDogMCAoNzE3NDgpIFA6OTUgSToxMDAwIEM6ICAyMzM4NiBNaW46ICAg
ICAgNSBBY3Q6ICAgMTAgQXZnOiAgICA5IE1heDogICAgICAzMA0KPiBUOiAxICg3MTc0OSkgUDo5
NSBJOjE1MDAgQzogIDE1NjM1IE1pbjogICAgICA1IEFjdDogICAgNyBBdmc6ICAgIDkgTWF4OiAg
ICAgIDI0DQo+IFQ6IDIgKDcxNzUwKSBQOjk1IEk6MjAwMCBDOiAgMTE3MzUgTWluOiAgICAgIDYg
QWN0OiAgIDExIEF2ZzogICAxMCBNYXg6ICAgICAgMjcNCj4gVDogMyAoNzE3NTEpIFA6OTUgSToy
NTAwIEM6ICAgOTM4OCBNaW46ICAgICAgNiBBY3Q6ICAgIDkgQXZnOiAgIDEwIE1heDogICAgICAy
NA0KPiBUOiA0ICg3MTc1MykgUDo5NSBJOjMwMDAgQzogICA3ODIzIE1pbjogICAgICA2IEFjdDog
ICAxMCBBdmc6ICAgMTAgTWF4OiAgICAgIDI0DQo+IFQ6IDUgKDcxNzU1KSBQOjk1IEk6MzUwMCBD
OiAgIDY2OTkgTWluOiAgICAgIDYgQWN0OiAgIDEwIEF2ZzogICAxMCBNYXg6ICAgICAgMjMNCj4g
VDogNiAoNzE3NTYpIFA6OTUgSTo0MDAwIEM6ICAgNTg2NSBNaW46ICAgICAgNiBBY3Q6ICAgMTAg
QXZnOiAgICA5IE1heDogICAgICAyMw0KPiANCj4gVGhlbiBydW5uaW5nIG15IGV4dGVuZC1zY2hl
ZCB3aXRoIDV1cyBkZWxheSwgaXQganVtcGVkIHVwIHNsaWdodGx5Lg0KPiANCj4gVDogMCAoMTA0
NTA3KSBQOjk1IEk6MTAwMCBDOiAgNjkzODUgTWluOiAgICAgIDQgQWN0OiAgIDEwIEF2ZzogICAg
OCBNYXg6ICAgICAgMzQNCj4gVDogMSAoMTA0NTA5KSBQOjk1IEk6MTUwMCBDOiAgNDYzNzggTWlu
OiAgICAgIDQgQWN0OiAgIDE0IEF2ZzogICAgOSBNYXg6ICAgICAgMjkNCj4gVDogMiAoMTA0NTEw
KSBQOjk1IEk6MjAwMCBDOiAgMzQ4MjkgTWluOiAgICAgIDUgQWN0OiAgIDEzIEF2ZzogICAgOSBN
YXg6ICAgICAgMjcNCj4gVDogMyAoMTA0NTExKSBQOjk1IEk6MjUwMCBDOiAgMjc4ODUgTWluOiAg
ICAgIDUgQWN0OiAgIDExIEF2ZzogICAgOSBNYXg6ICAgICAgMjgNCj4gVDogNCAoMTA0NTEyKSBQ
Ojk1IEk6MzAwMCBDOiAgMjMyNDYgTWluOiAgICAgIDUgQWN0OiAgIDEyIEF2ZzogICAgOSBNYXg6
ICAgICAgMjkNCj4gVDogNSAoMTA0NTE0KSBQOjk1IEk6MzUwMCBDOiAgMTk5MzEgTWluOiAgICAg
IDUgQWN0OiAgIDExIEF2ZzogICAgOSBNYXg6ICAgICAgMzINCj4gVDogNiAoMTA0NTE4KSBQOjk1
IEk6NDAwMCBDOiAgMTc0NDYgTWluOiAgICAgIDUgQWN0OiAgIDExIEF2ZzogICAgOSBNYXg6ICAg
ICAgMjQNCj4gDQo+IFRoaXMgaXMgbW9yZSBpbiB0aGUgbm9pc2UgYnV0IHN0aWxsIHNpZ2h0bHkg
bm90aWNlYWJsZS4gSSBzdGlsbCBhcmd1ZSB0aGF0DQo+IHRoaXMgZXh0ZW5kcyBhbnkgd29yc3Qg
Y2FzZSBzY2VuYXJpbyB3aXRoIHRoZSBkZWxheSwgYXMgaWYgdGhlIHBhdGggdGhhdA0KPiBjYXVz
ZXMgdGhlIHdvcnN0IGNhc2Ugc2NlbmFyaW8gaGFwcGVucyB3aGVuIHRoZSBleHRlbmRlZCBzbGlj
ZSBoYXBwZW5zLA0KPiB0aGV5IGFyZSBjb21iaW5lZC4gV2hpY2ggaXMgdGhlIGRlZmluaXRpb24g
b2Ygd29yc3QgY2FzZSBzY2VuYXJpby4NCg0KT2ssIGFkZGluZyBsb2FkIGFsc28gc2VlbXMgdG8g
aW5jcmVhc2UgdGhlIG1heCBsYXRlbmN5Lg0KDQpJdCBpcyB1cCB0byBQZXRlciB0byBkZWNpZGUg
aWYgc2NoZWR1bGVyIHRpbWUgZXh0ZW5zaW9uIHNob3VsZCBiZSByZXN0cmljdGVkIHRvIG5vbiBS
VCB0aHJlYWRzLg0KDQpXZSBjb3VsZCBhZGQgYSBuZXcgQ09ORklHIHdoaWNoIGNhbiBiZSB1c2Vk
IHRvIGRpc2FibGUgdGhpcw0KZmVhdHVyZSBmb3IgUFJFRU1QVF9SVCwgaWYgdGhhdCBpcyB3aGF0
IHlvdSBhcmUgc3VnZ2VzdGluZy4gDQoNCldpbGwgc2V0dGluZyB0aGUgdHVuYWJsZSAnc2NoZWRf
cHJlZW1wdF9kZWxheV91cyDigJggdG8gMCwgd2hpY2ggd291bGQgZGlzYWJsZSB0aGUgZmVhdHVy
ZSANCm5vdCBzdWZmaWNlPy4gDQoNCi1QcmFrYXNoDQoNCj4gLS0gU3RldmUNCg0K
