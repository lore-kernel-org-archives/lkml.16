Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212EE232377
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 07:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743578203; cv=fail; b=omnG4KK1nG5XD9bwuzqevegr0MtggMQTCdkTvgY+RWc4bFCDeziLqExuLsXHoD+Ly0T3k/RTcXwDog4FNizxcIo/HaC7QdyaZcxPhaRB+msPQqwcxvuA4Km/K9oT9fZ/N1X2DRwPd8qhwb3WI42l3d1UYaYx5zjP+7MsER4U9Dg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743578203; c=relaxed/simple;
	bh=okMX+B5LPiCJLzZE9eLkGZIHa1Ncs/pTjPURgqapvRg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ehl0mNR+9MFu2x0zKCEoahN/oEIR0r+SflrtPczhbNq/E4My/E6fOQTDnIpSfIlM5KbPLe2XjzuLJd94KbdevmNc3pTNpxGVeevO+vJaf0H1RohyxT8XpPgSonkCfRFJ96MvKnbB4EyH+1Lhro+4M+qLE1r2oEcAxUX5/CLOFSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Nnrc/6oW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mKRMeLse; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Nnrc/6oW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mKRMeLse"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5326fwPm019376;
	Wed, 2 Apr 2025 07:16:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=W5FxkoCO8GuTmoLDTI
	BTIFWRGvyLUEUUjDYWsF5HiTU=; b=Nnrc/6oWZztq/4F89GjUjCCYt+czKxupVN
	jZvS3QgQHmBcwM/I4g/yLr195ZtZ/tmVctunV32DD3OVnsWjIF3aF592gZ3R2OHO
	xteB0I1E1Y8CgqOqFY7/izFLZfOTDK355rXEpoij2ZF3x+gsMmcBaeKFHIq75b2w
	CE2wANQwdx8DK2y1/FlBq0MKgqo1PDDSWZnzvHxwZemqLmkcHSRbKqfI+pJpzhhS
	PaY/sN9jNYaDKYanWIpQInhaHhGjWWhO4K7JGPqEOIW4FBREG7CLHxUa4McuPIlh
	rrxksRUTeaUh/x2jOb1aDzUm3qH3cTaOD9JlEvo7MottwfOFR5Xw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p7n2a3gv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Apr 2025 07:16:36 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5325t1Z6003407;
	Wed, 2 Apr 2025 07:16:35 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2044.outbound.protection.outlook.com [104.47.70.44])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45p7aa7qq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Apr 2025 07:16:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r0mVtn8eXZyJqD2+o7fU6RZRhrYqPulORFpPvUSlLathOUKxd8sbWisyeacFQgOu6mu9SikC81aYRfnUuf13Yr/tF2GKuffzimZA1i4WH7WeN3gijULwDqHd4LCmQyfg/CQcnjnqoI6wRciEQy/KV26CN92QBVR+7F8GZsE+m27O+h5JDz/W9OLo/uJzcrApy0rOr2TWIT+dsNWfxB4Nq2sMI5iuI0k3Lr3WEG7hsB1BTiAkioftdN5iZw6xVJMSbSWx7FTfvhFbmt8jzH7hMbY4rz13bLIPDbE8Afc1EdHyhbUK5EjI7HiHb8Vb5gPqo831o7DjJs4kxax3+K4xZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5FxkoCO8GuTmoLDTIBTIFWRGvyLUEUUjDYWsF5HiTU=;
 b=PA3KL59jP/B9KI3GMQ51Cixxd+6lbTKnXgBeJgddF52IzAMvLa0usvYeQ8KFBeZXUldBQUZHJR8wBgS1Fi5HBO/Z7IUPQsyPuvZw7kNk7U3nBDILd7Ck2WV+lLYXsSE1hdbeRPCdhNaRwR2cP1hj8Zg7cS9sWXiU7UPqm29ucZV4cmPia07+uNKB/zLxAQaBbmHp5OOrgyhstOAmfl6msnG1nN2ueV8HzMtrogF/8IlLfqTqHhQW2gBlBaaAkZH5hhK3buot+nhEZNVN7wBwfvKAGVqKg/ISTTu13/LmjL9UrNYPw9C1A3HkMI7l2qkw6p4N+xat5yCGqWjRLyszLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5FxkoCO8GuTmoLDTIBTIFWRGvyLUEUUjDYWsF5HiTU=;
 b=mKRMeLseuFd3wNniW9aCg1FOhTOwCi/Wr7iHXpSvW2lLoZcBvK4SI0yTy90fyPrs29ljqvU/vT64Jb0c2SWAdJGAjFJkj869aPPUQI1V2fSmyMaxBROM+UmuROF2r5Hgc7gWsqoeoP51Z36WkbYB0l0I6JXUhW5vYYapSoJB8aM=
Received: from PH0PR10MB5563.namprd10.prod.outlook.com (2603:10b6:510:f2::13)
 by DM4PR10MB6741.namprd10.prod.outlook.com (2603:10b6:8:10f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.39; Wed, 2 Apr
 2025 07:16:33 +0000
Received: from PH0PR10MB5563.namprd10.prod.outlook.com
 ([fe80::1917:9c45:4a41:240]) by PH0PR10MB5563.namprd10.prod.outlook.com
 ([fe80::1917:9c45:4a41:240%4]) with mapi id 15.20.8534.040; Wed, 2 Apr 2025
 07:16:33 +0000
From: Siddh Raman Pant <siddh.raman.pant@oracle.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "cve@kernel.org" <cve@kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] published: CVE-2025-0927: Fix up JSON schema.
Thread-Topic: [PATCH 1/2] published: CVE-2025-0927: Fix up JSON schema.
Thread-Index: AQHbo58pHbUfAnVX5kCgH9pC8q26dQ==
Date: Wed, 2 Apr 2025 07:16:33 +0000
Message-ID: <4d521717c418c873225d220ca65fd6740c496c8f.camel@oracle.com>
References: <2025033057-CVE-2025-0927-1436@gregkh>
	 <80cd3f46783cd5702b3abd40c11f3f08f64717ec.1743576485.git.siddh.raman.pant@oracle.com>
	 <2025040248-hut-sevenfold-82c3@gregkh>
In-Reply-To: <2025040248-hut-sevenfold-82c3@gregkh>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB5563:EE_|DM4PR10MB6741:EE_
x-ms-office365-filtering-correlation-id: d6409569-f139-4eeb-dc48-08dd71b64c34
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|4053099003|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZnF0TXE1MzZ5V1kwUFg3VUVnR2xQY1ZZREM5VGdOSmhzZys5QWw3am81ZWpv?=
 =?utf-8?B?ZUNZV3A5YlAvNGlYVjlpOHQ0VE1nQnMvam0rUUpmVFRnVnRUdTBnRkVoVXV3?=
 =?utf-8?B?SWRpakZTYVliaXNGNWdIdUpQQUtUakRhb1JMODgwZUMvTzFtRDdsNm1PN3lY?=
 =?utf-8?B?b251VnN4c2REVkMyeDJGV3pRdnBKV1BkdVNPTjJhNXVudHorMklTNVpyY3dk?=
 =?utf-8?B?TjBIdmZ2WUpJa3drRXNuL3ZPSVZYWU1RdUl4d1hYR21ubGszZGJzb0M3cmlw?=
 =?utf-8?B?VFZwQnUxMDhIamxRWWVFU3kzLzVrejRValRkS0tiMThlSDJXOENETXphZXRR?=
 =?utf-8?B?Z3M0NVpQSEdDaEcrZEZpTnhKVXJsa2V1T3JwU1gzcmd6eVZOaVN3NHFhdk53?=
 =?utf-8?B?ckZvWFN6MkZPdHk2ZGU1WUIxVnloeUpYTmgwaFF5UUZIL0pnQzBhYVltU25z?=
 =?utf-8?B?cGFUOHFpdngxbUlvNml6VXI0VDcvWnBmekI3N2sweXBxUWpxWm1iWnZnb1Qx?=
 =?utf-8?B?VkdEd2g3dlVpMWpEdWVHQ0lSK0R5TkJHVllZdENJOU9NWDdQNy9NSEtZa2lY?=
 =?utf-8?B?RVQyRjQxRU0zWkRPNllVb1l6czJyVG01N1ZzTW1qa0txTy80bldHRFpSdmd4?=
 =?utf-8?B?ekI3Wmk4SWlINm5IcDF1RFlGMlZRQklTTy9FK1NIVkd2QjZrTzVaK2pEWUpE?=
 =?utf-8?B?VXlXaWNUdzVmYTRodmd3UlRsTkJIYVdmYlI3YXBscEVxS0VEL2dNaXVyLzVH?=
 =?utf-8?B?ZllsdWJXME00TEVoSWpkZDBsMDRpWmVaR04rSU4wQ29IaUFmRVBrQi9MQXhN?=
 =?utf-8?B?K2tkYTV6YXZZTjYxQjdkaFBqdzNsSjlKb25KNjByeTRsYS9ENVlZM3B3QlNE?=
 =?utf-8?B?bW5lMW1GZTRiNi9YODNUZDlMYUlPSWZJSlNwcVZrM2xTdHFlak1Tbjd0UnZu?=
 =?utf-8?B?N2N3djZ6elI1OVlNNVRYcmg0ZHhxcEVtYlExVVpaYzVwUVdHRWpUN0hucGxk?=
 =?utf-8?B?ZXVVS1IrWEY1Ui9aL29WR2NpQ1duSXFOV3MwUlA0eS8xdjIwelk3b05rbGJC?=
 =?utf-8?B?OFdEMkIyd1BOQzFWTVM5aDZFZUJwcmNoVkhYQTJrRFRFS01Ya3pUSUNwblR5?=
 =?utf-8?B?a0hsZ0JiRS9BY0xUOHFQd203ODROcDBGTm4xczhWVGJscTBNWTZqaFlpNk1R?=
 =?utf-8?B?Rk00ZEJpZngrSS9Pek9HWjBLb0VoRmNMUlBvRjhpdjc2UE9zdU54QlZwSkU2?=
 =?utf-8?B?SlBLd2ZMbXN6bE9wTmxTTDI5T2gxT2Z0Z2JLbnVGV1V4dnlNMXMreStSQis3?=
 =?utf-8?B?T0VzcDBQVDByVys3ZjcrbTdRcnNnbnlEb1duaGtyOW9Id0lwVUhOeEZ4NjlW?=
 =?utf-8?B?enA0SFJ5UzlZQXdKUE9wUnZqYVZoN3FqZE5Fc3BLQ0hka1A1K2J6NExxeUxx?=
 =?utf-8?B?YzZJVG1yeC95OFhhdzlRSDNJOHVmaDdoazZBUHZpZGRQZGZIK0xBN3BhTEtU?=
 =?utf-8?B?bkxCUjQxU2xMYlVXazFrYkNQcW5uVElybGY1N3ArRkpIT2ZBSHhjVjBaN0g3?=
 =?utf-8?B?bThTVzA4cW0xd2dkbXVlV1RxTU9oVE5TMkhqQkRWelBxZWNyNEY2TXhFakQ2?=
 =?utf-8?B?Z3Q3bnRjaUtsODU1NExUZGROS1I2RlREcFhHWEtpSDduVUtYZncvbDhlV0Nn?=
 =?utf-8?B?VjVYRWlneDk0SU9TNFBodjNJbG8wa3ZpSzBqdFZpQXpiZ1ZWbEpsbm52TUZm?=
 =?utf-8?B?VGhFWmxHNlgzN3ZoT3NxU2tiWEh6U0pKNlJzMHdwcEk0VTJxU2I4R3poUXEw?=
 =?utf-8?B?cjUxdjNlMTJJVlRtdmliRUtkc0ZpWjYwdmRtZEZuUGo2N054TUZieXBrbUJT?=
 =?utf-8?B?N29OalZGSjJWWStPajByT3RrTHU1NWFESFc5bDdXVjBMQlE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5563.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4053099003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OW5hTVpWVUxzR1dCenRubEpGVElPOVRKaXNxVFlHWTJkcDB0WTYwWUpLZG5Y?=
 =?utf-8?B?bkFocjFDLzVYcjNya1AxM1lpM0RSUkhsZ3R1S21haU1BeFpROVo3WHV2Sm1o?=
 =?utf-8?B?NklKVUtGc09RSUwxUE5Ec0FiRVZEUU0xN0EwajlnOStDc3NrYk14d2Z5VHRm?=
 =?utf-8?B?VWdNN09LbTlEdm5IZEhXK0lHTFZRWkJKUTE3QVA2OXFiV1E2YmNzNXoweHZC?=
 =?utf-8?B?c2pjc3NGeVNEdWdQbHhEVHhRZzdzSkFsdmNINi8rL0JMK1VLQ2Z3TUZWVnc1?=
 =?utf-8?B?bkc1U01CVjRRcExYbHlDYUlsandtOG96ZFR2QWtZNVpoYWM2VXJZSEJEeTQ4?=
 =?utf-8?B?MDM2VFhJVk8xWng0c2hSam1ySk90SGdCQlN2VVF6VG5tcWFqcEFZVUQ3NEdT?=
 =?utf-8?B?VUUyQUpidlgrTDJxZ2VTU1I0cjZFOW1UTDBLb2hRMHRxeUxpRzZlQzJGQndG?=
 =?utf-8?B?K24wNlhOYUZaU3AzYURxTWNBWm0xamtVekE4QUFPK0NIMFhDblY1dGhJYy9O?=
 =?utf-8?B?RDE3T051L2hnd3JvVTJiVEN4SXZGRHkwK0s3RW0zSEdZSE5nZGdwQjNibFdY?=
 =?utf-8?B?RzZxci9JZngrSVQ4d0RyVS9aOTMxb3F3Q294Ums0WGlKVHZPaWUwWmNaVHp2?=
 =?utf-8?B?RFJIQStMZG5FY0VOWVFBWjVwaVFSWDZuc0dyYStDK2hWTy9kN2VrckZjUnFq?=
 =?utf-8?B?ZkJwY0VZYmU0emgvYzdOV2F5UXYxTkVNd2d6Nk0yZXZ0cU5FSFlQRE5sWTh3?=
 =?utf-8?B?dDU4ek44V1laWEpOem9MYjZraHB3cFVPV201Rm1FM1hXQWpJWU9GRnI5aVBr?=
 =?utf-8?B?QkxLTkVJQ3NBcWw0YWYzdXkvUC9JbVBtb2kvWTdiM1pJcFZrcnpJc2xTeVBt?=
 =?utf-8?B?V0N4U01LUFk5d0lmdmUyTVJJY0wxZC85by90UkszZElNWVM4NW9OOU8rcGRJ?=
 =?utf-8?B?dElaaDlranUrS2pkRStQWnNhY1FNcjV0QVZDa3BqckNwQVJYTjZlemRTcFN1?=
 =?utf-8?B?TC9teU5GSnZ3S3FobmEzaHd3blV0MWpxR2NhY1NCSUEzQ29vTFlyajNKdDdD?=
 =?utf-8?B?N0dwTEh5VzZZNFZVMmdKVVZXZ05LdXliRURUOVcxVlBNVkdmeWo4SS83MndO?=
 =?utf-8?B?cWFsWDZMSyt6L2dKdVhoanVXOHVtRWZvU0xKVWxVdm1iV3p3SnNENUM3WWdF?=
 =?utf-8?B?d1dhU1Nrb0R4RzJVSFdkaUhxaGNydUZUbzNocDBoOWVZSUQ4NEp6L2lEQk14?=
 =?utf-8?B?ZjQ4cEdaSG13aFNDQkdxd2VvUy9tdEVlZTFCdTArWWpOczNjOHI0UE1nWGlW?=
 =?utf-8?B?aDFpVVRCVXFkTm5wdExTTkJwbTJJYzdJMHFNU1Nvdk9keGVSVUMyL0dBdmRh?=
 =?utf-8?B?a3ArZ3pGRFNWekFYM2lYMmlxUjJCSkhTQWI5c1QyazZQWm9WTUFnbDVzbGZm?=
 =?utf-8?B?aksya1p4U0ZCUWlXT2VVSHZ1b3VtUitQZXU3UHdINzdHK2Z6R1dUNGtPTXJU?=
 =?utf-8?B?T2h4aE1UM1ZzQUNnK2M0aXhnalNNL2FGbHZiT1I1QXBHaVVhem1UME1TZk94?=
 =?utf-8?B?UUdFQzJsN1l5bUZyYUxCZ1g3RUoxWEQ4S2lhdnJXOE9mcWNXK0VOQ3luWmls?=
 =?utf-8?B?TXdFVXA0d01waWl6ZllHWW9LQ2RBMnlEb2xoYzZxMGxjZ2hGY013YVltajZM?=
 =?utf-8?B?YXhyZENCZ1Fab2l6NkhVUEtETTZpL3VQY09rQzV0bDhUNDYyaWVFdVUwK2sw?=
 =?utf-8?B?YjNlcXJSa1FNOGUwVnJ2MmwvWjF2NTl5SFg3SUlzRzdJWVlPcVVERi9uQ21l?=
 =?utf-8?B?Y2dNelE2TmRSWi9xMld0N0dsOWFONmt5eWV3Q2VBWDJkUkhkbW9iSGRiNlBJ?=
 =?utf-8?B?a0VqQ0QvRHBNNkRuY2kvVm85VS9hQWVZT003Y01scVU3SnplMitYQU85UjJk?=
 =?utf-8?B?OThvRjZKUW9ZRldMdm4xbVVJRWEwbEM1QVdWKzV6NEU0YlNkcUMvVFFFUnZX?=
 =?utf-8?B?YS9jM2krQXVjKzZhVDhtd2pGeGh1VFpuS3VXbnFlMXF3ZDZIczM1Rm0xUURT?=
 =?utf-8?B?ajlMKzhpRndaNWtnT2hreENrLzM2VHdHVGQzTmE5elVlOVRGYWRralFMT2N2?=
 =?utf-8?B?ODhWck44WnlhNFdCYU1ZU3lVT2NPck9sQnpFT0srUk16bTI3ejJHQzdZOU11?=
 =?utf-8?Q?Orcq5Bi2mlMfoQAQ01y+w8U=3D?=
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="=-E1FgVJQqiYzFCbDPkEXK"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cZEJIanmOHgxOMLXmhvF+WU7+aMsE281J9AM4UjezlL0U05fN+rQw3xU9ICVi06LaagvWrdGWfsJJQbLsseWak+mIEsZHMerN4RnEM9G4H3S1+NR8mqQy0I/DM8wQVY7TvgUNtOTLRRoUetianbbs8TPV2tnBebSAqVYsKvRy5Ney8u3uokajeO5NLjvIu5LwI/TlNPixrceWMi3GvT85LwWGpOvATKGUlzgw20USl9264+35cUSkRVkCSh+BVKsw0nZU1slShtnuSP1jclWP8DDKQ8G+wJKUnjNQvWsrK4PIN6+axBPVE3EdaZmMYd4O+p4/B30ZiE37Dn3c9M7RbB4luH9oXMcNM7r4pJoCM5/hP2UZq2Pu3iSMxSMkdw0rFf6k/8tfxIQtuFe9I4AhfdN8m0pOqcfopkgYxE4Iig+w8YYH+AzNKQ3chO1UGpe1aTejk/SyeSAj4a0/mnFDXmG0vNTiRtLuAHUzMQkIJ7K1msKE9B6hn8g3mamJd5Lb5bcX2pEv0+GlPSvXuy+OSb5fEz3fbdLIx5mRxu+0mxeSGhYxrmiDW078d4RizO5mt79+rUb4FUpeBYS0RJR7zTRDFefskFhVg4TDwXZ13k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5563.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6409569-f139-4eeb-dc48-08dd71b64c34
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2025 07:16:33.2748
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jj+XDhuGxCZaFOPzMdaBNNo97V9gn0OKgK68M8bAh8Fq2mU6aX89wglM9SD31h1l1eNg+pTxRExC2cxLZNI/tKsW7Hzcf1i1WHl/cDGglRo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6741
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_02,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504020045
X-Proofpoint-ORIG-GUID: it8vkhrB-_EHytLqNgf_oOzhKlbMp7QZ
X-Proofpoint-GUID: it8vkhrB-_EHytLqNgf_oOzhKlbMp7QZ

--=-E1FgVJQqiYzFCbDPkEXK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 02 2025 at 12:36:20 +0530, Greg Kroah-Hartman wrote:
> On Wed, Apr 02, 2025 at 12:21:52PM +0530, Siddh Raman Pant wrote:
> > It doesn't match the schema of other CVEs as it was not generated
> > by bippy.
>=20
> It was created by vulnogram for obvious reasons :(
>=20
> Also, please cc: cve@kernel.org for stuff like this.

Okay, noted.

>=20
> > Fixed by hand / manually.
> >=20
> > programFiles were added from the info in mbox.
>=20
> So this did two different things?  Why does the layout matter here?
> Eventually it will be created properly when someone gets the fix
> upstream, I'm waiting for Canonical to do it as they are responsible for
> fixing this mess at the moment, but don't seem to be responding to my
> emails anymore...

Apparently, they fixed it in February and backported it:

https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/noble/co=
mmit/?h=3DUbuntu-6.8.0-54.56&id=3D09ad3b1e99befe042ae5219e4020eb54411d98ef

https://ubuntu.com/security/CVE-2025-0927

Thanks,
Siddh

--=-E1FgVJQqiYzFCbDPkEXK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ4+7hHLv3y1dvdaRBwq/MEwk8ioFAmfs5EgACgkQBwq/MEwk
8iptqxAAnifIUxOAP8yndSpEvWJWpZ606/BbVwpRzBXCLCr2EOis4WnH6jXp3YMW
QzFskVEkcM29kgDdgl/8WhBbaz+oFJYKlsp3FkAzcrvNnLv2U9JIhVBBrnURtNBX
fjk8Zt/ftlp5DQ5EU83c67+D34kxCDPxdQneiywuDFXMaq8S7ktwGRXDfZrekRZN
30meuurQd4pYQ4f8cRRvd/SlDLrfnoEkjdWR4C8HlpAXm+5Te3cWGxXpbHL4iUt2
nPA07uoIJLuWZSJpIprg276DUvkVxKw5535QVUCgM0nv+Susi+Yz9qjnZa3MJHhd
WrnE0OZJ9NDmyjW7IB3IH6TTbqp3c6bZg7twedCA8gL8zNpZ5JiG1zl60XekbLZI
VThzyaMI8M99j6qVaY3h6O8YvP9NDU3XTLG5PzxH6KuO5eD7xZ/WKmMfy7ptxV7Q
cUJIifm0gX6OzwfHvj6hgYUSsZW0BfedTjLblnopUwkFeEyvT9lsfj+DAoASDbvw
lPHz36OO9MYcheFc0Q26/lsqdfp124ymp08f7soVn0N7lgsmZmHHrXD5Mt56VMKg
iGGRQtEOuckh5GUL6B6yOtLF+mk+yHtrps+R/kqbqxlyEg0n2V9zVEImPA3vij9R
1ScIQn9YkivrX/fkLqnW3YV0gHUkbuiPecxPXDYLhTrBzaIc2G0=
=dfbv
-----END PGP SIGNATURE-----

--=-E1FgVJQqiYzFCbDPkEXK--
