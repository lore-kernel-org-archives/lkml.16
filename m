Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B274C28D8D0
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 09:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749030903; cv=fail; b=urBhX7ARkHYi+XMmGetYWHPwrpmDv30ROHYBt6nBbV5f7RsfEtTfIRMlGErc8BpTKgNSUXrUp6xLdw5KQkdoBUdFALSUobcrw927wV2WvRE/E8064vuJBbDqAB4lraK8keAgXfeyi7rjwyNl2a4CKDSvAdjAZCbMGdBjbHAZ0hI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749030903; c=relaxed/simple;
	bh=NE/yuEBXPXDgmacwqvFBtTzqiYRjxadxODucAm71Z64=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mh78nGsJMf2YAzaj2m0+mKARefHXgrj2+vMt91z+QFejoWLNoNYpzgXR3G4Ut454Eae492QzyI56dSIxDnXGYL43S2J+zkPDxMH2Q9kgksZ0ewoPDt3+7+Tg4TyQnFCk/WZbtoMa/AF9agTAb8n57aS69F6Bmd2EyG6Vq90TLus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=G5f1ePH9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HpkSZjPq; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="G5f1ePH9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HpkSZjPq"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5549Mbpq029579;
	Wed, 4 Jun 2025 09:55:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=NE/yuEBXPXDgmacwqv
	FBtTzqiYRjxadxODucAm71Z64=; b=G5f1ePH93GvLFKC6cl7Dfn5QGekVK75RAx
	/8u+F+czIDKpYFiBXk6tK86wbRz4ikCp4CU/212p4npLvABLD2wc/++mVtM44UsU
	v9lRT88GNZnnC1GO8ejupvNqvQXzkdMcXVc8q3DdCsXjOhfYcq484l9qtUKa81+O
	5pjxbUuAYCn5qR6AWpwIqeV1x22QwbTVkVAUKISvJoxdBZqSJRoB+7S5p7Crw0+B
	9t06LbQB1XFwI+ckZpb6EOzM7lKIp+DTGcrPXsKPihAFBz9r/WPNYVRYgjXmNpQP
	8UafkjaIbkw9GRIcmOy/ktUUzmF57jNBKUP6RXZ4MOSwxFY53vEQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8j3pux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 09:54:58 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5548sELh040691;
	Wed, 4 Jun 2025 09:54:58 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2082.outbound.protection.outlook.com [40.107.236.82])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7at5pg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 09:54:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NTyXjKhy4k5vG1PyG7JwiL/+uomqutDl/EI/VIZSBhWeRjp6h5L5gWHlnVoI1T/9L33OAjkhGRYPwRFHfdEq+c7A63Tyhs2dmecV3kABZgIDy9QW5dBSQm1Ab3CE+OvoXSOqITHsGZgmWlTcM+g1MVFGd4UXOnJnH/a1DROKmP5nLNt+FEPf8xiTMICm13akSgQWcCJfe2A/fE0UtsufEzdIbxf4cV5MAGTvon2pZtao63VNiGn59G2HGEXGFziOmYixBQnXePQSrWnC3oEhJx7aMaBuJa5LySyCTF2dscEKT2O/S2aUs16fJVdcTl23DQlIBCJUdthNuGnUPQ84QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NE/yuEBXPXDgmacwqvFBtTzqiYRjxadxODucAm71Z64=;
 b=P85b5SUOS0KXZqfSn6DodU9XR7X8E5vKQc9uNRGDY2Z5fYpvu7st81EIj/jQ6UY6w7DdrkgOAhSQrLpU3o+Rs3lLKIi7fdFvMqkGAKyHaTJKOPJPJ/KKOxYMNDY9GvoI+7HwgZnhE9zpblJSFQIXwjJpEGEqiyOoFakbiqBGNExQcR0WC9kimITiOo9NFv47b4RkhGVBgWzYmsuw2LSnWAu3qTAY16yG8rs+R9NykE1maHzCTehu8i9RIB2XAb5x07r0Hov+DFly6EYKlbKwT3TEfaI7uHFptEZW7CuDxiXDZBAQ3g88k4CQeEqwPSYehFw9JdXZ0IVjVPqVfc5Vwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NE/yuEBXPXDgmacwqvFBtTzqiYRjxadxODucAm71Z64=;
 b=HpkSZjPqr53ha8bn52NhLHn+fL3xa29MnbvxNngpRRGZ3PjIbuOZvzSbm//9EN2LtWwJeZDo5Jc72BrpT+ZIVFehBijX8SgXL3LTwyp9MF05PgXVkO9z/WQmmshfd5N775Iu0EJoE4RsID5iNk6RdKDIhfsLBIsNcTcXJYoemRo=
Received: from BN0PR10MB5015.namprd10.prod.outlook.com (2603:10b6:408:126::11)
 by SJ0PR10MB5631.namprd10.prod.outlook.com (2603:10b6:a03:3e1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.41; Wed, 4 Jun
 2025 09:54:56 +0000
Received: from BN0PR10MB5015.namprd10.prod.outlook.com
 ([fe80::f2f4:6196:e18:1b1]) by BN0PR10MB5015.namprd10.prod.outlook.com
 ([fe80::f2f4:6196:e18:1b1%5]) with mapi id 15.20.8813.018; Wed, 4 Jun 2025
 09:54:55 +0000
From: Siddh Raman Pant <siddh.raman.pant@oracle.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: CVE-2025-21991: x86/microcode/AMD: Fix out-of-bounds on systems
 with CPU-less NUMA nodes
Thread-Topic: CVE-2025-21991: x86/microcode/AMD: Fix out-of-bounds on systems
 with CPU-less NUMA nodes
Thread-Index: AQHb1Ta5ezQGfr0GskK/Eg86yvAS5g==
Date: Wed, 4 Jun 2025 09:54:55 +0000
Message-ID: <064d66133dc11a95f7c5aa647784cf9bb3ede1df.camel@oracle.com>
References: <2025040257-CVE-2025-21991-6aae@gregkh>
	 <793ae4a30ab15d0993ce9152ce91b6b98a05b1a5.camel@oracle.com>
	 <2025060430-rimless-splinter-4131@gregkh>
In-Reply-To: <2025060430-rimless-splinter-4131@gregkh>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5015:EE_|SJ0PR10MB5631:EE_
x-ms-office365-filtering-correlation-id: 7d02c351-dd62-4db2-8400-08dda34ddc40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018|4053099003|4013099003|7053199007;
x-microsoft-antispam-message-info:
 =?utf-8?B?R0VlVDlwd3BRd1ZWdjVsalpOU0sxZXBkV2lBc3lzUmNMcTJlWHVGSzVpUmQ5?=
 =?utf-8?B?WnMxQ2tvKzU5SHE3Y0wvV2Z1RDI4dlNzRGxDOFQwT1V0ZC9saktMVGRLU2dD?=
 =?utf-8?B?UFd2bWZlSTJZTW9oVmVYcEs0UUJmRkNQTzArNmtqTnJDZVJ4S2Zkd3ZZQm02?=
 =?utf-8?B?WVNpNFZRRkFSNkVGZGl0T2RlNWJMQWxHbnFXVzh0MjA1YSszNXd0VWxDN24r?=
 =?utf-8?B?a2hUcUlqU09FM0pDc0NoSnF1dGhjOEZ3dkhxSnVyNXNmNDNSRDJxRTJ5T2ow?=
 =?utf-8?B?T3VoTEFKeDZWYytCSXRxWXR0VXhjVnV6VHB4cHhJc0lmNUV4clozN3NJNGVC?=
 =?utf-8?B?TWxMaG12Yjh0alVzL0daT2tyYmhKd3lyRytzMDJLeXdNUE9aYUJCMXliNXJ5?=
 =?utf-8?B?N0dvdWdqSWs2VDZTMXBXamxmTGRkc3JVb2dmOWF6WkN6UHJLSkxXNXcvbjAz?=
 =?utf-8?B?Njhyc1FPc0F4TzFCejNyMmtWTDRJYXpLSU9SV2hweU5MZUkvTFIxNVhLdTFz?=
 =?utf-8?B?blJiRm1XUENUWTdYcEtuakpaZjM1N1E2U1dvQjNxTzhyQytlV2xrLzdZWnJs?=
 =?utf-8?B?Q29SNlJjakNKQmdOTXo4SXZaQlNSMDRMQ09oQU9DTmUvbkdYd2dJQUhJYkZ6?=
 =?utf-8?B?YXZXbDVPS3ozenhHY0N0U1FmV0praFlhUStaQ3J2cWVUYS82WDZWNklEWWU1?=
 =?utf-8?B?QTFSZkU3TkZVVTNhQUg5S0RjbTJ6bFVZdG11ckg5SGlxenFvdkVtaWNjNGUx?=
 =?utf-8?B?aGtSclZLTitWTTBMbGtMRzVMemQwRzhrQmxVMEQ1VXl1RlJlTHQ3QnNRYU0w?=
 =?utf-8?B?SHd6c3BxY0J3Z2REa2tKTVNZdW5HQzZwdFVjZjkrYTNvRzBQVlJ1TWQ0TUtI?=
 =?utf-8?B?SkNIVmFnUjRRQnd1dUp0Y2xldWtGTTZtUHI1SWZZTUtkVjJPaU54dW5BNjJo?=
 =?utf-8?B?Q3NnUnlwRjhUR3dOSTBNWGE0UmhqTWVkUWRSU1JJcm9GVjdubXVrK3NEblE5?=
 =?utf-8?B?QTBjbGZkaXVFZnhSWURJcklwYTFlWjNtUDl1ajJxWUZvUDhyclAzWEJVN2Y1?=
 =?utf-8?B?bG5tREp6QnhjOThIL0hpTkRmc2diMTl6Ym9DSG1xK1RvSW9VSWxzWWFuSERm?=
 =?utf-8?B?RVoyN2F0OG5MRWFyOUxNbjk4RHlIckcyd3Vjd21YV2s0MFVyQ1A3Mzc5dmdW?=
 =?utf-8?B?YTNoaDFySDVvclNuYWEvMWFmQW1vY0lHQTdYK04vMjNiUXZyUmltanp4NEJQ?=
 =?utf-8?B?RE9pUjhYc0c0cVVvQiswdjJtNkdDbkFadjhiZjBvbE45SWc3dlVXU3VtcUV6?=
 =?utf-8?B?TENST3JMbnF2UU1NOWg1bndzZ2xFbjh0eVdhdndMSjc4Ymh2WlV4U2RObExn?=
 =?utf-8?B?TG9jMS9UajdmMHVkRGdzekVwQmVZUFdTVHhFcmNueWVBdSs0TEY3TEgxeUpr?=
 =?utf-8?B?R3pRZUZWRm5YMjA4ZjlVVlVpWVBWSDlHeXo5MDc0MjlwMTBDV0xxVlVMQ0U0?=
 =?utf-8?B?cW5BcldwM0FnNFZ6KzJZM1NJeFVVUm1na08xTW4rZUQxdzErQ2YxdVQ5eHR5?=
 =?utf-8?B?TzgweGpCMFZOMVp4c2RobVNBakh5UHovWFNONExhZjRORjVQZG9FSUpQSUJa?=
 =?utf-8?B?aFpsYXo2Q21MNFVJSERXRlUxMW1ZNzdKMGNhUHNMcG8ybWIxK0xyRnN2bmlI?=
 =?utf-8?B?YStwR2VkN3JCK0RwZEhISGtIRWh4NEdzYVphUEZua3JTLzJibk5kLzdqenh3?=
 =?utf-8?B?emxYNnJHcDQ1bEV5aUlSUHR0c29HZTdoUXBySUUvUDBUZlA3MXlMRVk0dGY2?=
 =?utf-8?B?Tmo5eklSYjdsYnBRV0ZMd0hqeUNiOE04SGxFcWl3cCt0Skl3bVhKOFNUQlpl?=
 =?utf-8?B?T0lhcEN5VStheE9rM1RxejB3OEo1SjBWa3E3ZzVOVEx5bW8yRjloTXQxOFl4?=
 =?utf-8?B?aFJIdmVPQTBDbTZuaFZHS0NVc09PbkFBVjBPVk90Y3A1MzhnOGxFUkN2VHcx?=
 =?utf-8?Q?1PG7nIaQWx9saOy+aImpICHqaYFc7E=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5015.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(4053099003)(4013099003)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZURnVlFlaWlUZXZWVWxMek82SHIwUk4yYU9OQlY5b2lhQ3plUHpocGJpY2FJ?=
 =?utf-8?B?MS9DcHJ1czljbW5LbmZQVE43dDd1MmpzNDhMOEhQd0ZKcVIwMEo3THcrV1hP?=
 =?utf-8?B?YVFxc05ub1VIcERRdmNsQlozQm1BYTh0eHNQdHFQeXBsTXoxaE1hdCtteFZR?=
 =?utf-8?B?VjdobnRiS1ZYVjA5ZUZBYnVSU1VuYVRsWXZFMGx1WWFVNXVjd094MUJKY0JY?=
 =?utf-8?B?TURkSlhVU0ViT25LbFZWRE12czQwWmpJQzZEdXkyL3dSM3BldlNkeE1FcVpD?=
 =?utf-8?B?L2tHZWFYTGhPTHVaZU1iWXFBUm11WmlMTFlmcmJZME9DNlJHMzdxU1pIRzNu?=
 =?utf-8?B?QXc0M09OR2ttVTg5U3NPcnBlbGQzU3lvMWp1dHpFaHJmeGFWUG5GYTZlL3Rs?=
 =?utf-8?B?YzJTN3RuWE5TM09kNTA4eWdJVVAwL2lrOVdMdVlNcUs0cUMvcUlEUkZBUGZh?=
 =?utf-8?B?bEk0Y2VYY0JqWDQ4UnhvMERWMUtoS20zV1hrVVY0WjF4ODlIQk9CaWJHTWRQ?=
 =?utf-8?B?UmdRbUhQZllMZWJGck1RKzYyZ09HaUlIWFFlUTVYanN4UEsxRWkxN2k3VnBn?=
 =?utf-8?B?WFJOTWw5TG1obmZzVDJJeklvM0FvMFNKWDFZd25pTzJGekFJWm14OERmSm9o?=
 =?utf-8?B?cXAwb29yK2E3ZnhKaVp5dnFNYzV6UWVFMGxFSWIrOWZSZjlWUk1xY21yUFlY?=
 =?utf-8?B?bUxmWDB2S3A4Nzgzd3IzNWhEaFZhSlFPenVOcHFsTU9vVnc5N2FaMHJEZFpS?=
 =?utf-8?B?dGd3ZjAvV213STBiZmJISVd1VnJmYnVUUE1XcVNJY0duNGp0ZXF1WlhmeWFx?=
 =?utf-8?B?cjhRS1ViNmNUVHV2K0U1YkZTR1NQOXRvbWQyQjJrcTFkTCtXTnp5cEFZdVh1?=
 =?utf-8?B?MEl5ZHYyMVJPMnpiTVZEYkxwSExrc3I1U2cxMVNzMkxwVVUzMnFZVi8zeHMw?=
 =?utf-8?B?dFVTTFVDY1pScDZZaEhrcEdkWEFkcWgzRzZ1cVpvaXdZVkhuaXFLV1ZUVlFk?=
 =?utf-8?B?Z0lENktESGJzU2ZpcXJ0bmx2RXViSUxsVWVKYVh3cTFERkdua3FwaU12WnB4?=
 =?utf-8?B?SzdVeGhCdmpVNmJRcW45L3lQTUtDYmIrR1Fid01NRC8rNHpmcDdRWVNVZkU1?=
 =?utf-8?B?QkJNRDFsckhaSndkZjlBNndZY0lVNk1jQ3pUMkxma0ZLSGlrTVJYeHJFK0R6?=
 =?utf-8?B?a3RieG43NXlNYWlIYmt5c2YySTFYblFhRFZrNGJtdG90UVV0SXUwdlZHWW05?=
 =?utf-8?B?UFhTdHpXdWErdlR6OXY3a0V1WERvbGNJMm5uVUtEYmtIK0gwK2E2bkZPWUNF?=
 =?utf-8?B?dmlGMno4YkcxMzczL1NZei9ycEF4WngvcXlDbDUzQXo3c0t6OHRyaFVZaks1?=
 =?utf-8?B?ZW5qN0wrL3JIRzlsKyt1TXJIczRaVjYyeHJTL2FKUktwSCs2LzJjOW4rQVp4?=
 =?utf-8?B?Y2U3RkpuUldBbWV4OWJWSGM0dU54bmErQzR3WXpJVXJDaG13RWs4UEtySm1z?=
 =?utf-8?B?bWZvKzhFbGVEaTFUUHdTaFFZZ1VPanRmcTRrZ21PL3JpSlJManIvd25QU2NT?=
 =?utf-8?B?N1JLVERCZFUwSWg2MHYzSGhKdHJoTVBFSkk3QUVnaHBXdVhkSDlFU3JCNWpW?=
 =?utf-8?B?RVBRc2ZuelpTSk1KZlQxQ21jWVo2RmFpVDlBNGs1anBzZklSdXZVLzZaSldB?=
 =?utf-8?B?a3kxN3dSamNOb3h1dHFJK3hpMHllVWVJU043RmxGdS9oYjJPUlh4ZXVCOEVo?=
 =?utf-8?B?dUR1S1k4ait0NUVuTW4xZEpzdFVieEJUTm5IdHZSQ2pvMWNnYzV6ZE8xTlQy?=
 =?utf-8?B?ckp0eEIxM1RkZ0RzUWRwaDZiUFl1UDRTcjNmcmlCOUdKeWt4ckwrSlNpNEs3?=
 =?utf-8?B?eFR4MjI4Y28vOWhPNHBwbEFKaWFobUszMVR4TmhoTWNSUDFLbFBjMGd5UUpC?=
 =?utf-8?B?UkY3amVoZVhwNUJaQmlHNjZZZjJVUFdPY0NYQ3hPS01JZXY3OWhLUC91Q3gx?=
 =?utf-8?B?WHVxdnMzTHlzb1pES29sTUg2d2xPbWgyempldmtLZUFLTWFMUmprTFJ0akFr?=
 =?utf-8?B?dUpFdWI1SWhPa016Ymh1UjJkUzZidmI3VCsxMkVzL3hreDhBbTMwUi9oamps?=
 =?utf-8?B?Nll2VVdnempZOGNlZjQwdlMrb3lzV3VuSkRFZVBYOFV4V21TUExSUTdHZ3Fj?=
 =?utf-8?B?dkE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="=-Zl36f6sOY+6rHHFS2kbE"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Jcfht1sXZH/c4T5ROlP3+N7iF/4VxsOuHkGItMhPcJTySub1dSAE7isPLndqzpJMOS/pef6zyEvrbMGO8/QHB0EawqBEJ2CG5jJS8lWOY8yW3kMZrEP6a6rY6dhpcVlV0BXJyf6lEJtvYlJN73b2bO2322L18jKL9DynYzYe+xnW+wxqSywGi7lGT4BvQnv/5xtcLIIKcWRO9T+L6EgG6nMQjE2Y2AHBsYW7btwZ4heUa3tztcSxPTPaAiWbmGuHuFKQzkDSj7vDnvmw7b9IcSYeHvG1X4fAYqBnVxen9Dxt+LK9zptdmA+LYZl/WcbpKekgEYe9Nk/1pMopHYrBfBvQ+KgFJe4jP42OuoVFGGuYR91WG5K8FoQxHXc9/HCJyx8RbBN9sKrjHNKjftS3Peo4Ao2GKN/FBY3DDB8D9ncPGzbhBl6hF3WJfNdt2Y7X+GfE04EeI4Ox3ny+IDz/ySGpepNyg/O4oCKtm7pA8xPOQoCFdyAqM0i6mL7eS9y3+hSzo1Pp3/Z/I6+ZCDwAuBAbxgyX9wZdXqH/ZWbxyb0tWgO6ubG+iWm4yUu8fcSBgNs/pPlKzPMs1aosT8oMGOIDAY/q0yoD5wbbT492S8I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5015.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d02c351-dd62-4db2-8400-08dda34ddc40
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 09:54:55.9048
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hZqDHMoCrmTA22ttfCqZOhLaBYCQtK9ooM6/aENtal2NwqwDuQqspLCeGEIzkTFVwVj9WC508SeUOOZ7rpgeLAOtXozARZoSDcRx4X6JO0w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5631
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506040074
X-Proofpoint-GUID: -TCXILxUqFDNbTk9P2mTj5zrCYojGRiX
X-Proofpoint-ORIG-GUID: -TCXILxUqFDNbTk9P2mTj5zrCYojGRiX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA3NCBTYWx0ZWRfX4fqW243L0n1l bU5ymFHSw0S5sHqjMf07YqXYtUZzVYkozUWDfBE+TPOxtt8cnMsjl0LYU0h5jSvRdIhkgQPEPlx HpV77LwXTaNxMUsaw/aFnhmtXHdmJjkVNd2hTT87+Oza5V4YdGFRQmB/2dE0FMmShNC3UUmMQYL
 hRAnrABL04dd2/XnbKmMbADrKCb+dZxqwL9Wlr/yBxPp6WPGD+84leAscQioe3EnW/tPrZ2s8R+ yXaLPzoXk0y7QCgEEJuyW++GHy1xkqrXWXnGFqZgpRT0f41dD74amBDU6U+MlGe6Ou9KWaY/38+ mhrQvvxn5DwM/zxUoFvb/4WB6BFscgMPrkTzJvpL0+4/pyf7cPbb+rycl7uwTDPaQlGiqEFhvPa
 dqmGwXmUeHLEd9HvvzO109o8TPCAOHstlTxb0n938CXR/0yPECLgtle+akI8ULg2xKjoiqfu
X-Authority-Analysis: v=2.4 cv=QI1oRhLL c=1 sm=1 tr=0 ts=684017f4 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=ag1SF4gXAAAA:8 a=8r2qhXULAAAA:8 a=_mSwfpN90Yta9QRQWCYA:9 a=QEXdDO2ut3YA:10 a=WWjZugqi5kgA:10 a=IZYsaDoDhFtbN8HEXcQA:9 a=FfaGCDsud1wA:10 a=Yupwre4RP9_Eg_Bd0iYG:22 a=8gvLZcY7Nlvl4CGD_6nf:22 cc=ntf
 awl=host:13206

--=-Zl36f6sOY+6rHHFS2kbE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 04 2025 at 14:58:03 +0530, gregkh@linuxfoundation.org
wrote:
> Doesn't "causing corrupted memory when flashing a microcode update" fit
> the cve.org definition of a "vulnerabilty"?

This only happens on CPU bring-up so I don't see it getting triggered
without already being exploited.

Thanks,
Siddh

--=-Zl36f6sOY+6rHHFS2kbE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ4+7hHLv3y1dvdaRBwq/MEwk8ioFAmhAF+IACgkQBwq/MEwk
8iooHRAAihE76gmSmD5VfevvaBxSEsOqTul3bp7ZqjoSVBTFHh2AdxnNupsMD0Mf
HfEuxV2hm37vlMU9cv0gte4qQZBF/jZ2eDXCS8s+Oqti9WKxyVWbmfdgERtr+KZj
Pdm0XGolgo3v94HopZHW8EnGZR0aOQX4jgyfgOoNM9o4IEMDUVSNhnigaJnGscXv
I2ZqQHYHg2iSxHfntrJtCD+GMx5sx3pxtnGX35hSoY7aYOddYMRcF10OzW3bSqCo
lVkXSWbUcYYeBnIGK/DeUEYStz7XYVGJYWmTzeh63zWgZJJzWnIxhUJUi00Fk4pl
vW6IJc0gB5Fj0H7e1EwbmOYuYtkGokhys9sEiMrzBN5dJ7gNlqMhZW6RugwHOnNq
/kekdX2Zeq4j3/A00g2LI0bsDCGtUi29rMiLJTNaXk5WbsVoNTyRE+hwoVyXGn3g
TAkwmV78MIYs/tj6u7CaiqfWTc/Gpm77GRCAFg1R+zQUH97rK29SuoRQBPLEFfNQ
6ADKx95U8S7cPmQ5grGtmQRP8Rx/zKZHBVs3Krnj1mcfcotHw2nW1Ie3OpMG1jBI
yZE8Ub5nUHCYqpEzNJKUw+oGOUX2fVsaFOpHQnGv2YoIqDlPI7ADiRlcKpo0OWcr
SxQXuEG9sl/3PtfohdjnkE0L40YILIYk4s5MnIlANtqdMfiw8NE=
=sKh0
-----END PGP SIGNATURE-----

--=-Zl36f6sOY+6rHHFS2kbE--
