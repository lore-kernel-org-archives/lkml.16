Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB18833E7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 01:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745543973; cv=fail; b=nPLAXXmVIO5r5SzMDQ6bYXbGU4rIO5nW3WuToGyoiq7T+qgpp0tEW28EeJod468yeicX7wywfg2ng+4M8Lrsf6+p7pP5NhpUzQ31j4cyOj6Op1ix+JZ6C97GA6uEBaaXAbyb/naR0z2w1hUw1c0PMgVDsL4asG52Pw3s09aO8XU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745543973; c=relaxed/simple;
	bh=sRkVaQ3rHA+8pKv0Ods3bqYRSl8FaOMWvnvTBjDAsWs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=p7vh1zHA03Zhi97r8xgWm9NLMNOa2T/fXhjwNjYtqxBmJgsN9GldIr8pJHZACR6NlY1qaR348LatJTMX8GuKi/AeqjCbQXyohsJZz9fg4XtnJKjV47c1m2Is06BrpOTeTU85AdDG7D2m3Kq3C6CVNzwCYKGsTG4RDXs4J0JXmK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=g3cv3b/3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=k1VrFUAe; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="g3cv3b/3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="k1VrFUAe"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P1I9cj011332;
	Fri, 25 Apr 2025 01:19:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=sRkVaQ3rHA+8pKv0Ods3bqYRSl8FaOMWvnvTBjDAsWs=; b=
	g3cv3b/3Ps0bELDPf4flaNmcNK9bIGipwEUNL5NgpV40E1i+wq3mlmyGFu6o7QJb
	R4c06S7ZpRLzsb9/h2gSWnt3FsVvmkt129Pl8uYX2na+URvvAFRESbMwmr3OxD6t
	dyMQWLt4PVQbxbREv40QaKP7aLsUrVYkRNH+YVHjaitjbx7mt+oc5gldKD9cQoD+
	fBgRLAULIh99hrVDOhTwKO0bN7lJYOhY0aHwsnwU8AS2amtR20Iz10qGvgYbSFgh
	CprRm4OQCMado2XacraHioS1KqPsJOnWRHdMHjz9tfLT/QYrT2QJOcreUVu+wtCa
	COAfXElCxsBQw0I1+H25+A==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4680kd804j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 01:19:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53ONtwf3017349;
	Fri, 25 Apr 2025 01:19:09 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazlp17010007.outbound.protection.outlook.com [40.93.20.7])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 466jvh9s13-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 01:19:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xVS+tjxhW8m7/UAD0weKfFqjWSqys9L9PmMrxoMyw4V8uDLx44L1MkfjZPE5iN+4xCEUUWEbjxa0SJMPeadl6d8wE2F85D4TF4pXbSNSqHU7Yk4tUDCBtMZ6NS0rQGirjfCoRZAXkbu8F+OvyeD7neKZ+pGyf7KIYTHb2sTHKZimj1aOA87ozSaUVi8CimOR6b9u1GKoOuz50zDRi9EZC4JkDA+skU3KVBGNFTfXY88FiwvstIOoXhz8o24BbHGfmeWY1bhd4ezbwLvZnAQQW6dC+UIPBfsGUaoiugVVtsb0VA6ME1+/vkwtAQNA3mnRaKth03wAteQbE2sCI1CR+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sRkVaQ3rHA+8pKv0Ods3bqYRSl8FaOMWvnvTBjDAsWs=;
 b=yOHmt5Rt9oKHNz0Yv4lEsBcnz4wN0qQjPf24oa1PsYXl/UoQM8BNujbdC1v8xbs+ZtwcZzhd2d2SAWdTeWbd4Bp8MgB0kfvacgaMLFwuPMAyDkY75fnYMywyMKZU8ANmF9oiDrY2taft0rADb+tyANUytkh0N7W72Z4D7MqaZTfy0x+6EhRkAfnUBkMxDJCWaYXUoPILgP8AsSDyPT0vvJiv30lwkuQ1kVll95nVCLrhHbQxHLxG2s8quzjp7iSWquoQuvJHW/ykfo2eT+rXTPwTR37BpQL5cEToDaZVy9wQcpVIhjg1tse9eiLUsHfCEjP98M1z4lKaY3Cv2VFR7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRkVaQ3rHA+8pKv0Ods3bqYRSl8FaOMWvnvTBjDAsWs=;
 b=k1VrFUAeOi0v06p1HoxZKLTNgcWfZ57ZD9Wkr8ycP6ClDN/OZqJJQ5ibounyvv1v50pjFpO0QVpfVdGfTk8CkwOsJLsy0yhZEiuS03EHR/rVCu9g/yjULMIqFjzrpZB1c7qkKW/attrGGb2s064WE6MNxosg5BEFvy0u5+DXjNU=
Received: from IA1PR10MB7309.namprd10.prod.outlook.com (2603:10b6:208:3fe::13)
 by CH0PR10MB5097.namprd10.prod.outlook.com (2603:10b6:610:c2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Fri, 25 Apr
 2025 01:19:07 +0000
Received: from IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a]) by IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a%4]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 01:19:07 +0000
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
Thread-Index: AQHbtSMgnPA5MV9ZP06XHg8GjLCPC7Ozlb+A
Date: Fri, 25 Apr 2025 01:19:07 +0000
Message-ID: <DE11FCAF-4686-44AC-82AD-F0672FE450E1@oracle.com>
References: <20250418193410.2010058-1-prakash.sangappa@oracle.com>
 <20250418193410.2010058-2-prakash.sangappa@oracle.com>
 <20250424141345.7F42GFmZ@linutronix.de>
In-Reply-To: <20250424141345.7F42GFmZ@linutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.500.181.1.5)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR10MB7309:EE_|CH0PR10MB5097:EE_
x-ms-office365-filtering-correlation-id: bc04e5a0-08de-4eb3-b197-08dd83972cd7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?L2FESjBNUzVQelV5L0d1YmdRZVZjRlVkTldoN2ZJdUJkOVdITGtSejBkdEZj?=
 =?utf-8?B?RDdEVEJYWXNSOFc5Y1lqYzc5RnlJWjhpZTNDeGFwRENjcUR0NWRCcXJUSi9P?=
 =?utf-8?B?QkVwNUJTL29aRXpHOHM3RzZOc3dLTXh0VHNXa0hXeXlqeWFFZTR5d093QjQ4?=
 =?utf-8?B?Zm5yazFmdzZTd3B4cGd0T0hXeWh5SFVpMHF1czZXSWRlZkpvYzRYOS9jVGsv?=
 =?utf-8?B?L0s1VjloK25YR3VBQzVzWndRZ1h6YkJramhxUTI2ajZHSzExU1lhL2t2bXhO?=
 =?utf-8?B?ckdGL2M2SGtlWjI2eU55NStRMUlwaXVNdFlKekl5a0pUOFAraUVGOVZ4Ky8y?=
 =?utf-8?B?TE9ZVGdDalAwbnJ5VDBrQTZLVHh6Z0h1U0FSSktZQkhrZTcvdUs4UXBRUzZ2?=
 =?utf-8?B?YVo1ejBuSXR4RzRnZHNVR3k2Z3dCanNXaU1vZ3pkbC93UTVRY24rSUR5KzFz?=
 =?utf-8?B?clV5QkZtYlEvcjRhVGQ0OTJJVFNyc0hmTEJTY3lSakhLN1F0OCsyc2NETkd0?=
 =?utf-8?B?WDVIWGsyL01mQ3VkMWpqUEwzczdDUjk1Zk1IUk4xc2Uwa0tMVHlPTmRDY0dV?=
 =?utf-8?B?NnMyNmNaVEl3QjRKOHJXdXZ5WlZmRjFaNlQxWkd3L0hpcjcxcFR1RFYyZmdy?=
 =?utf-8?B?SG1sckFITDljaGtPaWdFVGY5NjAzSFpubWdnRGppZ0JBL0ZXWUQ0VVpiTmRV?=
 =?utf-8?B?d0czNFVkZWlPTGZzTjRmNFU5UmNNVVJDT1dxMDRlQmFIU2s3dHA3bldpeGFu?=
 =?utf-8?B?dmc4eXBhMit6YmZpYVhvR3lqYWJsL3pNZWp6dWlRY21zQzNONm1naG50YXBN?=
 =?utf-8?B?dXVQRGJXVjZEWVZxcjhZY0l3Tmp5L1J3dkpaMzZhTWVuSXdhaDYxcVJyVFY2?=
 =?utf-8?B?dWFSWTA1NEI5NTFNMXQ0TFZNZlpITE1HdjRobDN3YUh3MFVnekdDcEFpQ3pD?=
 =?utf-8?B?L294dW04MnlnVERRQWh0NnlKbnJOZE9HK0p1WGxKQnB6S210QkJWK3pub3Np?=
 =?utf-8?B?OVp0bVQ1YmVVRUdQcG5Ha2VaSDBsWHdDejQzWnFWYTdPTUNOQlFvQXBqd3dQ?=
 =?utf-8?B?djd6NkljZXp5amZBcWVSNDcySlJnSnB0VHlwb0hOQ0JGSnJSY3p5Z0RpU1BB?=
 =?utf-8?B?UW9sM1BSSVRRSXhTNCtnYklWa2RGbTQ2TncvLzI1Myt3d0NCblIzbHJ6bldJ?=
 =?utf-8?B?WjVNS1JaMUhQMlFxTHBWUHh4UTdEYkZVYjM2OEpjZjQxR3NTVC8vaHNCYml5?=
 =?utf-8?B?Y1A2U3ExNkRJb0M3VkdLMFZRb2tTMW1yMXRsNDV3bEJjRlZKS1N6eWdrN3BU?=
 =?utf-8?B?bVhlendzbDFNUUwySVRxdGFYNHZDR0RLVTIra3RYdUpVa0M3ZXNBVXpYc043?=
 =?utf-8?B?Mk1JWnBqRzNvVUJGQnRQVk1sRXhTTTFBNnptY1dxdHdxVWxraFhqUkZ0bmJh?=
 =?utf-8?B?S1ArS1orRURNU2I1Tm9lTzNuK2hXUmFmNzF0dlEySkFzOFdHeitkcnd1bTJP?=
 =?utf-8?B?UzB2ajZqTFdZYmtLNHN6NzNWUDdnc21jbXBMVjQ3TVZuQm4zejhLYkdNMXc3?=
 =?utf-8?B?bTBwRDVjRml2WnYyTGd6RmR5QllkanBzSlpBS3lrZ2tYUHhGQVhUVytsVjMy?=
 =?utf-8?B?akdZMFdaUkdRbDlqcFNEUTA2SDZOcnVIWldRWmZSQXFncXgxVU8rNlk4a2RV?=
 =?utf-8?B?UER0S01DY1JVUWVrdmlYNnpuMWlrTnZnNHdySFFUd1RKbmJXQkkvRjlCbjQ1?=
 =?utf-8?B?eTViZndlQkQ5UDk0NW9TUTRjOEhmaHlKbkgyc29TSC9rSXo5VkJCS0pRaTVK?=
 =?utf-8?B?OXk4eFVldjlIS2R1ZU9ZNHlFYnFldGNoZzJ5Tnhidm5EOTQ3elJNSExhbURX?=
 =?utf-8?B?eitCQkZpbU4rMkl6dXV3Z0J4bDNJNGRNaVBoSGsyRHRWM25rL2JDS2hWZVRy?=
 =?utf-8?B?NkVnNDZramNOOUNnZ1Z0c2dlWDc5N2RGeHNncmQ1d1hTL3Rud0xFVFJHWFpN?=
 =?utf-8?Q?ua+GfPfy9o1T9KK9V6a/YLV1TG/fQM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR10MB7309.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z1ZlUmxac0JSZHF0MlN0Q2lxRzJQRDgzNHJTQldwWW45SEM2QzZHWTlPOUMx?=
 =?utf-8?B?OTAwNFA1S0IxYUw5TnZyOWpLVXFKOXBIT0xLR25HRnhLOWZhQkhNWU5ZVS9P?=
 =?utf-8?B?VUZ0SGlYMVQrUTJOcTdZckdvK250YTFwOHdJVmlSbllram9rYmlYRllhTCty?=
 =?utf-8?B?bzNqWWF3K3ZZR3d2czlkaE5pSjJnc3MyQVRGaGIya1d6SmxkcGZONUpWc1RI?=
 =?utf-8?B?RU1MZFptNXh5eFB0V1Y5dUE4ZWRXbXVYRitHbUxJaWY1Sy9CZ3Y3ZDRwWlZJ?=
 =?utf-8?B?M3FXSndEK2xwamw2d2xRb3NObVBqVHFNcjhXRzVmSGhZL1N5TlpHZVVHR3RS?=
 =?utf-8?B?Y1loL2pxTlQxcVdhRVM1TWs3eUMxOWxXUFAycTVpakVnTEQ2T3Jsa3Y1Tm5n?=
 =?utf-8?B?ZjN0V0o1S3d0eThJSGp6MldxelJhQ3FJa3BQdUhRTzg4Y3JZWHpGdFgrVGsr?=
 =?utf-8?B?bXcreDFyQmJpNnFPQ05JMGhnTStFWVhvd2dNRldQbVFEaUJOVGNPalZmVVMz?=
 =?utf-8?B?b0g1bjBoQVdrdTRjWmE3ZkgxL1B1YVVhc0pDSnVZTE5ObDdlb1dqTEJNd3dk?=
 =?utf-8?B?RUUrbElCaTZjOGsyMU9zTDRUQzI3MGJzMnJqUWMwOXM3YUJxcENYd2MwVWI3?=
 =?utf-8?B?R2ZWZG9qd0hzaGdxNGY0bXFBQTBjdWIrNG5Qbk1sUGhNVW5WTEZHWlFlNkE2?=
 =?utf-8?B?aHEyWVVxVVJIT0ZpakRqUy9raTB4TjVvSVZzWTZTTEVlZVZBZGRaL1E1QUJi?=
 =?utf-8?B?bHZaQWl5V1pOOGJPWXl2dm9iMXQ5VWdmOHRMcVdQcFZRdHJvM0x1dmNjRk52?=
 =?utf-8?B?L0RVVFJObElIaEZUVHNFQU41YWczMVp6LzdIcW5YOE5ZbDNhREdCWXhKNWNJ?=
 =?utf-8?B?NElMVklwL1ZhLzQ2dStranptQk9vamk5NVFKdFVTY1B6elNxVTRTdy9vN3hW?=
 =?utf-8?B?cEtqMm1lZ05GVWpmMUhFYVZ0RVJ6VW9CQ042NHZBQ2RQQ3U4WG9LTERlbFRu?=
 =?utf-8?B?QSt0cmlrMlBVNTFqMjFsKzM4eTdhd1RTV25ZNkJ4MG9QTjlrK0VLZ0tBSHdz?=
 =?utf-8?B?bDVxOVdrcW9LVmh0bmt4Qy96Z3dWNlZxNjZmQ3lQc1V2bGVta29Bd3RIV280?=
 =?utf-8?B?dWFtbEFvYi9nK284bXpCaXZVaFovczlKWG5TcndTSVVyM084bEFFdFJVVXp6?=
 =?utf-8?B?RjV2bE1DWnRtZGhmWlQrN0kyM1dCeDg2bHo0T2JjSStDVkVldnEwVHZ4ZE1K?=
 =?utf-8?B?RGUwUlRHZUVJY25qOTAxbzdDRVpwaTNaQWx6QmcrSnNMVG9DbGJMcXZsUHFs?=
 =?utf-8?B?alplTUd4QzJsejVqYWNkNCtkK0tCWXFJU3haeW1vSjlEcVNMMXovdndkTlJj?=
 =?utf-8?B?VytYMkhRVVJSejlnOFpLWmIwVDhyNXBoc2xEeVZZd3ZDNzFvMFJQVWQwbEhU?=
 =?utf-8?B?bndIQXdNcUZ6ZWE0NlgvRG5qeXExTEt2LzZwN2NHZVBRYmFOSGNYd0Z4Rnk2?=
 =?utf-8?B?VUFsRk4vV1B0UjM4cTd3ekNDV3RBUmpVdCtGU2lCMUNlOXpUTy9FR3dSL200?=
 =?utf-8?B?bFIyWUVwUzYwdnVaY2ZRSUtDa3dYMGN6ZUppNXB6dHpHUXhid1hhSllUTHVE?=
 =?utf-8?B?eUlVTWFYNXlYUG9lUEo3QjRndkRiRERoMitvVXN5S0lkbDZZbWxuU2RRL1ht?=
 =?utf-8?B?aUozKzgzK3VWMFU5K05PMEh1SkEwdklCWVRhNnlrWnRMNnhyd2s2aXB5ZXF5?=
 =?utf-8?B?R05VN0c3RytqT1kxdXVtNE9XNmxob1BYVFpOR3pnaGI2SFplYjVvRncxdkVr?=
 =?utf-8?B?bVRDSThON3lOZ21FNlBsM2ZmdFRqU1Y2eXM0UkVSUHNBRXZHaHowaW8yS25J?=
 =?utf-8?B?dzVpRTZHU2U0NjkzbzUwQU4vLzVTVGY3UE5pOGpaT2w5bG1Pa2NBZG9HL3Zt?=
 =?utf-8?B?WmpKNlZ1OEliWnJoWG9IZVFNQ2k4RFJDbU00MWtidndRVHB4WmRZMXlMelJ2?=
 =?utf-8?B?eGRmT3d6RVFneXdlamNodlVUbHNnOUF6MkgxM09Mc2FrRjRyRVd3Q3plUmRK?=
 =?utf-8?B?Z1RGMTdYd0JhTThwVmpsdnhGT3V4S3FKSGhqM25acVU5Y24veC9OTmZTT1BB?=
 =?utf-8?B?MCsrY2FXWmZVamRCSmRFaFJYVkFvaTlVa3F0WmRiaTVhMEZJZXA1U2JzdVBL?=
 =?utf-8?B?YlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D6120DC199F1C84184A84CB8480B1848@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AWgUn5LrPVAlPjfIQIfMylctD3trgQ2VqM58LkBDx2wt8mEqUr2kA40Ot39c46iWFBkKWe1N9YQ646byuhG5NKZVj8Nk4P6cXpHWJZqF2XUO3H1+YOQN47bjxPfX5qs0i6U7IkKGjqaaZVU7Bo4rYcnBLsPi+0/JgXs7rXn7o0M/T4+Pzhyv5vZpSVdsO8S0z8Sx7ZZlVmM7OHJ8bhBEMUD33SnYs1bMfryQj6LMkuJyus9vzCOylvB36OUUDpDTeoEkP2XOm78JI+R3QUEP8EjBF1EK/wNmddLK0XyetcLfpu6aXuI3V88YsuuKI/eED8AgmP62dJ//VFJ+HP1HFnrKT3cDzy0Mzy2PhUeSVQwhSK7gBUMAlHpNc655M/bg7Qq096NZkF8zM9Xa7NWcQLVYdoh7oDIXp1jnG4iPxIfkKUdBAaLskDEMrwClkTEGG4RHcR3xR559pWktcxts7IoZxt/ghY4Zn2vQd/sYSo9SOFvSTBh+wC8VbVLTUGJna3Y3rV4qE+SPS7kLKwWpqyQ8+X+uHAt/xfcLGxjU5ecRGn9kcMe905v+FB/a242XaFZedWkd6AnbdS5gLcV2EgPjut/uFax7DRprSoeOVbU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR10MB7309.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc04e5a0-08de-4eb3-b197-08dd83972cd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2025 01:19:07.2080
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A8z42wcDBywW0bhY2z+lmK11UDKGhQ4jK61oxAQRuWW88yUrOQt+Efrn9XBRTQ4bLQvRb5R87+IBv9matXSCfCUtIvvl+fbh4zeo5s3ea88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5097
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_09,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2504250007
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDAwNyBTYWx0ZWRfX85HZqFuw15Xw XaeFY4siVqviOz3F56hJN2xp2fCnWgoKjd+E7uB7LH1thY04awdmtIUHcm0KQPzOkDCqZnas3n6 z5RNEj25qLX2zFVjjDadSJG3FkJdVDoq1/aLlyCt+LzxZN5FDrTrgWAHCVOF/NXi6IxVQKLogRk
 EDX8yS+uBvu39d7SVvONOjAsrDZN3NJGmrjvdFW2PeL6JAIcJrbj9Cc3aQayBipQF5z3k0d3U4h +xztgcrR1IpPHqKk/+Pkmzt87GZtAdyrXLuXo2zELSU1sz9Wr8dxkon1LeQGmmZSdSdXE+RdrNv M7zU7MFO9CobAX3QN4mxKVv+CNPWt9DG7nv1ZehnXg4Ba7QUI5kAMV1UJcw+BOeWxCmpypzttOj uKhYsrlP
X-Proofpoint-GUID: dBJFQlwHR_svn--CFtynpuCyVfsFQJA0
X-Proofpoint-ORIG-GUID: dBJFQlwHR_svn--CFtynpuCyVfsFQJA0

DQoNCj4gT24gQXByIDI0LCAyMDI1LCBhdCA3OjEz4oCvQU0sIFNlYmFzdGlhbiBBbmRyemVqIFNp
ZXdpb3IgPGJpZ2Vhc3lAbGludXRyb25peC5kZT4gd3JvdGU6DQo+IA0KPiBPbiAyMDI1LTA0LTE4
IDE5OjM0OjA4IFsrMDAwMF0sIFByYWthc2ggU2FuZ2FwcGEgd3JvdGU6DQo+PiAtLS0gYS9pbmNs
dWRlL2xpbnV4L3NjaGVkLmgNCj4+ICsrKyBiL2luY2x1ZGUvbGludXgvc2NoZWQuaA0KPiDigKYN
Cj4+IEBAIC05MzAsNiArOTMxLDkgQEAgc3RydWN0IHRhc2tfc3RydWN0IHsNCj4+IHN0cnVjdCBw
bGlzdF9ub2RlIHB1c2hhYmxlX3Rhc2tzOw0KPj4gc3RydWN0IHJiX25vZGUgcHVzaGFibGVfZGxf
dGFza3M7DQo+PiAjZW5kaWYNCj4+ICsjaWZkZWYgQ09ORklHX1JTRVENCj4+ICsgdW5zaWduZWQg
cnNlcV9zY2hlZF9kZWxheToxOw0KPj4gKyNlbmRpZg0KPiANCj4gVGhlcmUgc2hvdWxkIGJlIHNv
bWV3aGVyZSBhIGJpdGZpZWxkIGFscmVhZHkgd2hpY2ggeW91IGNvdWxkIHVzZSB3aXRob3V0DQo+
IHRoZSBpZmRlZi4gVGhlbiB5b3UgY291bGQgdXNlIElTX0VOQUJMRUQoKSBpZiB5b3Ugd2FudCB0
byBzYXZlIHNvbWUgY29kZQ0KPiBpZiBSU0VRIGlzIG5vdCBlbmFibGVkLg0KDQpJIHN1cHBvc2Ug
d2UgY291bGQuIA0KUGF0Y2ggMSBpcyBwcmV0dHkgbXVjaCB3aGF0IFBldGVyWiBwb3N0ZWQsIGhv
cGUgaGUgd2lsbCBjb21tZW50IG9uIGl0Lg0KDQpDb3VsZCBpdCBiZSBtb3ZlZCBiZWxvdyBoZXJl
LCBjYWxsIGl0IHNjaGVkX3RpbWVfZGVsYXksIG9yIHNvbWUgdmFyaWFudCBvZiB0aGlzIG5hbWU/
DQoNCnN0cnVjdCB0YXNrX3N0cnVjdCB7DQouLg0KI2lmZGVmIENPTkZJR19UQVNLX0RFTEFZX0FD
Q1QNCiAgICAgICAgLyogZGVsYXkgZHVlIHRvIG1lbW9yeSB0aHJhc2hpbmcgKi8NCiAgICAgICAg
dW5zaWduZWQgICAgICAgICAgICAgICAgICAgICAgICBpbl90aHJhc2hpbmc6MTsNCiNlbmRpZg0K
ICAgICAgICB1bnNpZ25lZCAgICAgICAgICAgICAgICAgICAgICAgIHNjaGVkX3RpbWVfZGVsYXk6
MTsNCi4uDQp9DQoNClRoaXMgZmllbGQgd2lsbCBiZSBmb3Igc2NoZWR1bGVyIHRpbWUgZXh0ZW5z
aW9uIHVzZSBvbmx5LiBNYWlubHkgdXBkYXRlZCBpbiB0aGUgY29udGV4dCBvZiB0aGUgY3VycmVu
dCB0aHJlYWQuIA0KRG8gd2UgZXZlbiBuZWVkIHRvIHVzZSBJU19FTkFCTEVEKENPTkZJR19SU0VR
KSB0byBhY2Nlc3M/DQoNCg0KPiANCj4+IA0KPj4gc3RydWN0IG1tX3N0cnVjdCAqbW07DQo+PiBz
dHJ1Y3QgbW1fc3RydWN0ICphY3RpdmVfbW07DQo+PiAtLS0gYS9pbmNsdWRlL3VhcGkvbGludXgv
cnNlcS5oDQo+PiArKysgYi9pbmNsdWRlL3VhcGkvbGludXgvcnNlcS5oDQo+IOKApg0KPj4gQEAg
LTEyOCw2ICsxMzEsOCBAQCBzdHJ1Y3QgcnNlcSB7DQo+PiAqIC0gUlNFUV9DU19GTEFHX05PX1JF
U1RBUlRfT05fTUlHUkFURQ0KPj4gKiAgICAgSW5oaWJpdCBpbnN0cnVjdGlvbiBzZXF1ZW5jZSBi
bG9jayByZXN0YXJ0IG9uIG1pZ3JhdGlvbiBmb3INCj4+ICogICAgIHRoaXMgdGhyZWFkLg0KPj4g
KyAqIC0gUlNFUV9DU19ERUxBWV9SRVNDSEVEDQo+PiArICogICAgIFRyeSBkZWxheSByZXNjaGVk
Li4uDQo+IA0KPiBEZWxheSByZXNjaGVkIHVwIHRvICR0aW1lIGZvciAka2luZC1vZi1zdGF0cyB1
bmRlciAkY29uZGl0aW9ucy4NCg0KV2lsbCBhZGQgc29tZSBjb21tZW50IGxpa2UNCiDigJxEZWxh
eSByZXNjaGVkIGZvciB1cHRvIDUwdXMuICBDaGVja2VkIHdoZW4gdGhyZWFkIGlzIGFib3V0IHRv
IGJlIHByZWVtcHRlZCINCg0KV2l0aCB0aGUgdHVuYWJsZSBhZGRlZCBpbiB0aGUgc3Vic2VxdWVu
dCBwYXRjaCwgd2lsbCBjaGFuZ2Ug4oCYNTB1cycgaXQgdG8gdGhlIHR1bmFibGUgbmFtZS4NCg0K
PiANCj4+ICovDQo+PiBfX3UzMiBmbGFnczsNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9l
bnRyeS9jb21tb24uYyBiL2tlcm5lbC9lbnRyeS9jb21tb24uYw0KPj4gaW5kZXggNmI3ZmYxYmMx
YjliLi45NDQwMjdkMTQxOTggMTAwNjQ0DQo+PiAtLS0gYS9rZXJuZWwvZW50cnkvY29tbW9uLmMN
Cj4+ICsrKyBiL2tlcm5lbC9lbnRyeS9jb21tb24uYw0KPiDigKYNCj4+IEBAIC05OSw4ICsxMDAs
MTIgQEAgX19hbHdheXNfaW5saW5lIHVuc2lnbmVkIGxvbmcgZXhpdF90b191c2VyX21vZGVfbG9v
cChzdHJ1Y3QgcHRfcmVncyAqcmVncywNCj4+IA0KPj4gbG9jYWxfaXJxX2VuYWJsZV9leGl0X3Rv
X3VzZXIodGlfd29yayk7DQo+PiANCj4+IC0gaWYgKHRpX3dvcmsgJiAoX1RJRl9ORUVEX1JFU0NI
RUQgfCBfVElGX05FRURfUkVTQ0hFRF9MQVpZKSkNCj4+IC0gc2NoZWR1bGUoKTsNCj4+ICsgaWYg
KHRpX3dvcmsgJiAoX1RJRl9ORUVEX1JFU0NIRUQgfCBfVElGX05FRURfUkVTQ0hFRF9MQVpZKSkg
ew0KPiANCj4gY291bGRuJ3Qgd2UgcmVzdHJpY3QgdGhpcyB0byBfVElGX05FRURfUkVTQ0hFRF9M
QVpZPyBUaGF0IHdheSB3ZSB3b3VsZA0KPiBzdGlsbCBzY2hlZHVsZSBpbW1lZGlhdGVseSBmb3Ig
YW55IFNDSEVEX0ZJRk8vUlIvREwgdGFza3MgYW5kIGRvIHRoaXMNCj4gZGVsYXkgb25seSBmb3Ig
ZXZlcnl0aGluZyBlbHNlIHN1Y2ggYXMgU0NIRURfT1RIRVIv4oCmDQoNCg0KV2FzbuKAmXQgdGhp
cyB0aGUgZW50aXJlIGRpc2N1c3Npb24gYWJvdXQgd2hldGhlciB0byBsaW1pdCBpdCB0byBTQ0hF
X09USEVSIG9yIG5vdD8NCldpbGwgZGVmZXIgaXQgdG8gUGV0ZXIuDQoNCj4gDQo+PiArICAgICAg
IGlmIChpcnEgJiYgcnNlcV9kZWxheV9yZXNjaGVkKCkpDQo+PiArICAgICAgIGNsZWFyX3Rza19u
ZWVkX3Jlc2NoZWQoY3VycmVudCk7DQo+PiArICAgICAgIGVsc2UNCj4+ICsgICAgICAgc2NoZWR1
bGUoKTsNCj4+ICsgfQ0KPj4gDQo+PiBpZiAodGlfd29yayAmIF9USUZfVVBST0JFKQ0KPj4gdXBy
b2JlX25vdGlmeV9yZXN1bWUocmVncyk7DQo+PiBkaWZmIC0tZ2l0IGEva2VybmVsL3NjaGVkL2Nv
cmUuYyBiL2tlcm5lbC9zY2hlZC9jb3JlLmMNCj4+IGluZGV4IDE2NWM5MGJhNjRlYS4uY2VlNTBl
MTM5NzIzIDEwMDY0NA0KPj4gLS0tIGEva2VybmVsL3NjaGVkL2NvcmUuYw0KPj4gKysrIGIva2Vy
bmVsL3NjaGVkL2NvcmUuYw0KPj4gQEAgLTgyMyw2ICs4MjMsNyBAQCB2b2lkIHVwZGF0ZV9ycV9j
bG9jayhzdHJ1Y3QgcnEgKnJxKQ0KPj4gDQo+PiBzdGF0aWMgdm9pZCBocnRpY2tfY2xlYXIoc3Ry
dWN0IHJxICpycSkNCj4+IHsNCj4+ICsgcnNlcV9kZWxheV9yZXNjaGVkX3RpY2soKTsNCj4gDQo+
IFRoaXMgaXMgY2FsbGVkIGZyb20gX19zY2hlZHVsZSgpLiBJZiB5b3Ugc2V0IHRoZSBuZWVkLXJl
c2NoZWQgZmxhZyBoZXJlLA0KPiBpdCBnZXRzIHJlbW92ZWQgc2hvcnRseSBhZnRlci4gRG8gSSBt
aXNzIHNvbWV0aGluZz8NCg0KaHJ0aWNrX2NsZWFyKCkgaXMgYWxzbyBjYWxsZWQgd2hlbiB0aGUg
Y3B1IGlzIGJlaW5nIHJlbW92ZWQgaW4gc2NoZWRfY3B1X2R5aW5nKCkuDQpXZSBuZWVkIHRvIHNl
dCByZXNjaGVkIHRoZXJlPw0KDQpUaGFua3MgZm9yIHlvdXIgY29tbWVudHMuDQotUHJha2FzaC4N
Cg0KPiANCj4+IGlmIChocnRpbWVyX2FjdGl2ZSgmcnEtPmhydGlja190aW1lcikpDQo+PiBocnRp
bWVyX2NhbmNlbCgmcnEtPmhydGlja190aW1lcik7DQo+PiB9DQo+IA0KPiBTZWJhc3RpYW4NCg0K
