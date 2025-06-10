Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6540428C5AB
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749557248; cv=fail; b=NoWgtxcZ+m2ow1yvMEgFf4fte/ni8zVeUwkAe33enyFrMJwtYM/eFXjMDkcbhHbULx3abasxMioSpFx17U/I2i7/dOiLkjVheYJaiQcgQiRDf9mixjB1TInzIRNHP3jga1YCDniwRllMSH5SosDwatjgJew4TRxsy4epMkP7F+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749557248; c=relaxed/simple;
	bh=8FRC4PtZ5X9fuxYUKPZDIZ/VP8fyHcuW0Of1A0gdE5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kalY5Y8M/SDCfuRXlyPm96nXVw4DbsIUcAEzY0L2r/GJ3Q3wRr4wqcV+E1MLllT6N+7ClDtvDDTq6c8+s12+7YEJm2PMgVvs6FisAPgTrHVQ4jZgSd6uuerB3W6lCv8CTT2FCnRKZieRVaPuvxfclKJYHW692pdoeSzbsYoDo3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=S9+TIC4W; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=f644uOmV; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="S9+TIC4W";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="f644uOmV"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A2fYwH021468;
	Tue, 10 Jun 2025 12:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=b7pR2b+EZwDbGh5obX
	9dZxooJJGkhUpxtDYoRAN4ByM=; b=S9+TIC4WGn1UG/Py6aUvvszJY+a2979Cnq
	ihLrnFgrgCdxQE9jbt0ZevOUFTauefrQI1eH3ucdoj7fAr4irT9jwyoPLSIwYsSA
	jECVIE9OE9gAL3eTPEPmCT2Wu3tipKnHrwTtfl1ZSyPWy3o6lByRN1DXTgyiz8dM
	dOKYrlG8ufDFFPyHGGXZ56kNmzO9XB7IRFL9Z/bTlTf5ve8MEstWpizH9uk9RHcF
	O/9ZSzLqQZfWAPJqWsF59PD5ealYVCKYKXXGdhTh4A08drQ+DNy0D0XXksVPwFDz
	aj4ZMvfS9HzuOQNHrhHdCLs8zGpwbaWpH2pLsaCJVe6jmFOMJOPw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4752xjueyk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jun 2025 12:07:06 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55AB5oX7003297;
	Tue, 10 Jun 2025 12:07:05 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv8n1vf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jun 2025 12:07:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X4zCGAq87hfsOGX1Ag5Xz9NzzSl8CZKICrmYkNdYGYVB6DLM+MQALhCCJ/KokA/PUIiD8DzDfbi/ZD4lAASSLNP64vOonQxJ9WiGhvhuDTFyCJZ0sBqdomECAwsiE8JrMmoYG9Pqtb1pf71KfmA7rpR7y9HGmrdQP5dFoTNnBXhSY6bzUbT+tvhxLx9eX+AfUH8Smem6SObIzIikv99cbvx2DU15XIWIc4L5KFatCz83TS3EjajdPXX3HuFX60Ci9m7+cZztCQlaeA+0aD3C9YovKoQVF79ZeA7Xq+/O/yNBcaapowykh/UQW/tefjxO5K1e9AOCGMp3clw/Of0zXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7pR2b+EZwDbGh5obX9dZxooJJGkhUpxtDYoRAN4ByM=;
 b=qhJK3GUTAsUjzefY5C00Oj4PgXQP8jk5898JQJTHtG7UfBQfMe/k4U65lg9FUvD6eSPhPz4kFTc+OvvQ82/Zn3Na8uBzMw4iVZx1tWrsYmmEcEtNp4OnhX42uKQbcTCr8I+Rg51h7xKosWWKbn0GOEAU2AupjTy9Q8Z7H3Fk+l0CgjDsEtj87WAuYWRwY4NjVcV7EwBR4F7M1xmhF3LfitlWivJ+jYpFM6TPJy0a+hBvb+Q0C3V4V+IPVXyAVcws8Wknp9Wy/D6ged7VXcVsfYfGHH6el22cg+j1K4Y799b2+zayZNwnjO0KY0iFFmTI/cYJfLGQuRm8ELOanUTsig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7pR2b+EZwDbGh5obX9dZxooJJGkhUpxtDYoRAN4ByM=;
 b=f644uOmVtdoe8Yem1kpxyXZtpn82Pp5bSGjeKLng1hKcSGqWMKIsGI/eAtwSRg1I6m82Vh8uua/V38Y+BXmQbl3ziX9jTCch2n4KqLbUmn4sY1KVBaQTFGSkoXZzpgn0iilAQrnbL+kJRQGbT4MlOV6CoQFBYgDdIO/Lv70Usac=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA2PR10MB4729.namprd10.prod.outlook.com (2603:10b6:806:11c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Tue, 10 Jun
 2025 12:07:03 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 12:07:03 +0000
Date: Tue, 10 Jun 2025 13:07:00 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@redhat.com, catalin.marinas@arm.com,
        will@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
        rppt@kernel.org, surenb@google.com, mhocko@suse.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        suzuki.poulose@arm.com, steven.price@arm.com, gshan@redhat.com,
        linux-arm-kernel@lists.infradead.org, yang@os.amperecomputing.com,
        ryan.roberts@arm.com, anshuman.khandual@arm.com
Subject: Re: [PATCH v2 1/2] mm: Allow lockless kernel pagetable walking
Message-ID: <db04bd02-0090-4aff-bb2e-0d1e023757a5@lucifer.local>
References: <20250610114401.7097-1-dev.jain@arm.com>
 <20250610114401.7097-2-dev.jain@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610114401.7097-2-dev.jain@arm.com>
X-ClientProxiedBy: LO4P123CA0348.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::11) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA2PR10MB4729:EE_
X-MS-Office365-Filtering-Correlation-Id: d6debb55-a692-4588-d199-08dda8174faf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T7VLqR4f0vdsvMEvIGqKZZMFlWY9ckmxsAu1dRFZLUoHf1DKCswhAYSEChCj?=
 =?us-ascii?Q?lhAOY6ko6x7cIgtrRXskYUzgzAU9j3Mzo3MhGFFtG1d5r5B4WW3ngrK0c0R3?=
 =?us-ascii?Q?jL6bL+yoDXHFUOwi84sy/zxLrRBgXp3T9fBDvzdMMaB5Jn5PMsqsWJQGeXY4?=
 =?us-ascii?Q?Fzo5Q7phYc8cUQc5VvwZv+Y8IK2D6adTxZ6jfZqSR0MA2UuXWV6oGzNNi1Zp?=
 =?us-ascii?Q?WMhFRCePYE4wAWxb2anYgg4wo1hR8bLifQBTBfMnEdjSS3+bVhw7P0RzXsy5?=
 =?us-ascii?Q?yE2jfeqoSgo8w3GfFAbp5BbSq1FkStgnlQNCcbX2MT3de/q1O+qn2r+nAc+i?=
 =?us-ascii?Q?hc0ZIM6Qb559qSXHC7R98DjZ3bSFmhCYphgUsYzkNuBahV3QYrd3NSQtPtpm?=
 =?us-ascii?Q?+up+9l8gTM14eHyZd44hUtcHPYRjw8bk+kZUdyQOFLCLiXqVKTgAIYDsWzTA?=
 =?us-ascii?Q?6zIof70pwOGaCRf7KIVTzbc4T1RiHjS/l4JE8TFoEhCnJcVWoTULoJkkE5q4?=
 =?us-ascii?Q?u7R5FVrZlFSdvBPgdR6LcXDraqBqB7z3QmBQzS0AF22eqAPIuZZD11/NL3Vd?=
 =?us-ascii?Q?Htw4CGpvFLQcCEv/p1cOR2U6/EgiKWA8N3OvAL8FVpH4t45KH72DBjpSkpSL?=
 =?us-ascii?Q?HoMGBn/epQJc+oO/zMYnHoRqZoFQcs2vKTEKKhwl81qL44BLxeVPlasLDm77?=
 =?us-ascii?Q?TqH1+FG+fdeHTgJ2DgLec1FRY4zJ4CxbpeMfR2PJ+hrs3djwWgWR+fTimMkx?=
 =?us-ascii?Q?hF/f07sLUjxuuIi+R5wT7YSPl0kmydE5UTZEo9R41/sDloIv7KU7txlnHA2k?=
 =?us-ascii?Q?xQNC6jwk6dtmn1qLnZz20eVqyJXhRCE395873wh/uBodjvlrgKMEYGeqC6OY?=
 =?us-ascii?Q?B2wLdafoDL7FhGrVMGIui9I9Ki7J7yXkeliFlb7EgSBAUJLstGih/MWXlcVe?=
 =?us-ascii?Q?os0CkdJb67O9DTwFCEoF1k3LWOOXT1G9p1pePxwZMrus6heofj7i8cRnFaud?=
 =?us-ascii?Q?rHEqBp7eHaiXxOlOlDZ+OOc5TtYDBApzeIXGHEmhy5YXcQ6tGP+NrB4DARlp?=
 =?us-ascii?Q?lwrp46ax2fY2lSsCLEeaCFvSGZkssX6Z1P3x1ZEFC76Jgcxy8hatgO4WieKF?=
 =?us-ascii?Q?MWjV6KY+W6I+oVnfHm1tNEmNDik2rlAVF1jIr0p3vHdNUJsZN12dxi6vr7Jt?=
 =?us-ascii?Q?W/7gKEFZbe6+/MzV/frcvdgsf2JpfthldFAtpSCmbn/oSvjCyTYkUKfk8+PN?=
 =?us-ascii?Q?nECA+wvgJD8Mxc1IUGjBYTBcOr9R7DcGbt7G3AA1OGpJq17tYR9pNE67dVuX?=
 =?us-ascii?Q?fKz9hSGCl388aennGAMJr3uhqoLcvBm1KEQ/SKXJ07SB9d0y5HolycpWF178?=
 =?us-ascii?Q?5oWgOrUDRIUgWVbQ5LRx3aZ2T1EZ7r16ROhSiFScOqb/dbKJuREGQve88Nkc?=
 =?us-ascii?Q?Rw+zhWTlWow=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7Kq0EyZJssp/KHyPxDp+3o79S2vvlnIThNGrLrJYYfSruGukI2AzepalduCJ?=
 =?us-ascii?Q?Sp5kl7oEjMKrULIK/qsPW/eTd0bB9pAGiQREgFothfPKBYDrekohKAbSyX2Q?=
 =?us-ascii?Q?l4gBpu1kcgttN7V0+a+sj2rd1uNayZNMzGvvrFdsnmj+O/kIaitYfQU+dkO+?=
 =?us-ascii?Q?p2WoDMtdB4ZcTO51doPqxaW5KD73iCYPye21Telor+fez7WMPwmjzZrYozmF?=
 =?us-ascii?Q?HfL8ZFW0zOS3VEClTq38fP+tS7qx41t7o439d7XfHHZmrWFEKRFGGP2oP37U?=
 =?us-ascii?Q?/acEib5TdOdCE1RWJ5G5c9zWumJCgBKYCEb1EO1Aw6jC61ESfUe9qbUO/8Tm?=
 =?us-ascii?Q?gO5fL5RJOFf9jjhLiSx5Nmem5H27NkKENV8uUStWirs/vdh/CbEp5TXYx++N?=
 =?us-ascii?Q?PwuzI4sLpwiuIFD8dPZXQMU38tj94oATUU7s7zi9nww0x/DBmQ7sYlNONhWk?=
 =?us-ascii?Q?XJ7TaZWm+drBiwrUl1Pb0jR9GqICfC/ZnCRZNmgb9KDQ1xj+Ek8gdBYz4/q/?=
 =?us-ascii?Q?607DjeQ3wtsc6CsCv9LDZCB9SJf3XzTllGcEg5QAbnJED1aXeQj9shxJzc+u?=
 =?us-ascii?Q?6M9a+/ZnXLuE5+NZ1grELgf2xqsLfVS6O9QGG/mJ+jQzU+ZN7YuU3YB+B3sg?=
 =?us-ascii?Q?iyw0RwWc/hykohP7qBKRFzQ/+NztWJFniCMpoh1GS8+K50Pg9dAhwlfCYS3L?=
 =?us-ascii?Q?rN8ThprGdZ9+7AA/VGBl8ydDnY0bm1VF5U6MGSmuySGEGzQleSmaVGmGLBK5?=
 =?us-ascii?Q?covNuTgCGUPN1NVCYRfqzShSjQxK6YSWdy96MrWE0NgRW5lxEcPAC363Y241?=
 =?us-ascii?Q?ggb0UsQu4S/Un4J1biRD2/9V/4NgL2krcl2yZo5m8lZlOzLUAvwdv0ZZ9h0t?=
 =?us-ascii?Q?R1Tuv3LIOgL6vbW0+nzhyxyZo12BipAQHW1vHuTHDmhITZkpsX8QKcU8FVks?=
 =?us-ascii?Q?V2ORRoxKIfvy50iyr2Ii9Chu7TAvx8nffKAQEmTlA0e0yKr9gdf4rmbEt/dk?=
 =?us-ascii?Q?ec4bkIRuEwpY/AaslFd8GR9k2iouucR3j0oZi8PqV+4WI6uEBM0YcuYf6F9r?=
 =?us-ascii?Q?oOKBnrsYw1IFSiofRJjNSP70DCV/Lj9V437peNZoKm/9bRwPHPhX+clGledP?=
 =?us-ascii?Q?QmzvMmJNSs0Nd/oPG9NW4zQyCgROTIvtjGKlVmPLn9vaBiwRu2ZaXzf82vMc?=
 =?us-ascii?Q?YFxT8OTnv6UBUJH7myFD57/AcxoU+JGBFMUrGpmTxEEv5QjYP++umw+lQPZg?=
 =?us-ascii?Q?UJ8dHnZc8YX2phufZKLQ61ZJUL7zc17d1E+LwCGrM9j9rp15HX+7M8Lucdgu?=
 =?us-ascii?Q?1gqRe7dEmSeCvwIEra5Xk7whLU5uaJ0qiekm8b+cxomkvBnl/77GqUS0/gpo?=
 =?us-ascii?Q?Jwn0j6TsycKqphZZrGfkotww8pq6XzGKlSNB8XX+jFs1YTIhKtvg0FNy8kbl?=
 =?us-ascii?Q?qPPWKA9L1+ZQ4a/Xj/SFfOdTldZnfa1iY1bHS3VDisQn8nlQfDhrZmyp49Jt?=
 =?us-ascii?Q?bSgwLJ2XuWK1VYCnqX2pp89IIx4DoKLKJZhFOtOeSgN/KN6wMxAtxgeibPR3?=
 =?us-ascii?Q?KXycvus4kAWhonZWybEkk1EdM8lqm5rxJKOjt3r1R/Xo7UkqiR5MRD6e3Jfr?=
 =?us-ascii?Q?/A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Zpli8PgXa1tGD4LJQZLGGXBhzVFQ/5MvnWl7H2q0T8nE2hAsfeiaulAAdtJtxm32Pb8vgziET3BYS/0t0accDCbVgVkZFUzZl8zj+zZ1Zssb0JqRFOkwTV54K6eEjEaZteHFzK/UJeipEZ279k4jXSyUJGAlk95wIMmbv40RuhRm0qZtKFEngisq3nIbKxBB8RqwZAWTryVDme7HiAIeHYFVxPR1qI7KPbNPGmCto3ocsNTCt4d0HC/uXQER5bumXvuZDqT/bT36IljoiRCm/sx5oaeSvHPDrF8RW922L2QW2SG+p6H12+ihckRUsZ/r76oRwtG7y5I41YDbdl/IwG2ta5Sk/5R+hAhFmiKW2cDqLmE/4dI49CXQo77GenDEwzh7LSXc3vMgo0SY85FrFYhn1rqSfiIcKuVxCYYVFp/R0Kt7t3ZLh65UFGqMs6tYIdQDBo8nwq6MWdtGRrMy0ECPzlEivXN/btF5vkiUZbdcS9uzfbcbbqRjn6zGgYwXVjcgSlef+CBf5K1viS2PHnuXqiooRwBOmDx3hYfaT/WBVuQB7nWuiEXOLpcG4jhwASy9Mq8xgDvFxvO5EU+xpcSKYn9ArSV9q85rNWRyQWY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6debb55-a692-4588-d199-08dda8174faf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 12:07:03.2079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ZlRX/Bi/bllkxR0DFqcHQPgBbQCTGbEbbXXhsKGUrgCgo+ZqKVOAkFPf5SITM9OrX1P5syC6Llkfh6Kh6S/02afnxYAe5lFJgCA6Ggf7Y8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4729
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506100094
X-Authority-Analysis: v=2.4 cv=K4AiHzWI c=1 sm=1 tr=0 ts=68481fea b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=a_tg1jtI3tLrFxr4cV8A:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 cc=ntf awl=host:14714
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA5NCBTYWx0ZWRfX9QPifgh5Wh4h o6It21njVPJcKDweP5WJFhaFY1OQzK2tsKyImoeVOX78Bg/IrEH1SQBbhyIqftFjMvhQJZhw5SE IJN4pHWqGPJ5EGDDaFrmPyNEFL4Tr2N3/ZRAfIL17koVkJoZ9/IZLQn2G6SMILBRXpVxgMdpeAt
 DFFeStcBgm9fV3hTDRdnEqSEg9bS70rfP6Wc+nBEvfIJfMwD4ffA5eKbvONilPCsCaPuJW0bqGp TFwWePgj0aVnsEU7vJjUTEJruW0gM5201lUNlIz8+4ZlWqTDGl88ESi+XeFMFsd+5gxKm2kMQy0 cEsnLsVNbu53cjEguwomFFzhVTiE7vs2TPjLYPbBaQudrn3p0JKhAfp/of5gDOLJ+Danx1kzPCZ
 0sKaAmHmYokgPrr4XJ/waeeBlc+lqUyFrfBSvuEe26/4r8SiisUCqIajeKnLlFyB3U3VvQ/W
X-Proofpoint-ORIG-GUID: _AXNj6c-T777hXcR5G5NUmh_hS7Md5K4
X-Proofpoint-GUID: _AXNj6c-T777hXcR5G5NUmh_hS7Md5K4

OK so I think the best solution here is to just update check_ops_valid(), which
was kind of sucky anyway (we check everywhere but walk_page_range_mm() to
enforce the install pte thing).

Let's do something like:

#define OPS_MAY_INSTALL_PTE	(1<<0)
#define OPS_MAY_AVOID_LOCK	(1<<1)

and update check_ops_valid() to take a flags or maybe 'capabilities' field.

Then check based on this e.g.:

if (ops->install_pte && !(capabilities & OPS_MAY_INSTALL_PTE))
	return false;

if (ops->walk_lock == PGWALK_NOLOCK && !(capabilities & OPS_MAY_AVOID_LOCK))
	return false;

return true;

Then update callers, most of whom can have '0' passed for this field, with
walk_page_range_mm() setting OPS_MAY_INSTALL_PTE and
walk_kernel_page_table_range() setting OPS_MAY_AVOID_LOCK.

That way we check it all in one place, it's consistent, we no long 'implicitly'
don't check it for walk_page_range_mm() and all is neater.

We do end up calling this predicate twice for walk_page_range(), so we could
(should?)  also make walk_page_range_mm() into a static __walk_page_range_mm()
and have a separate walk_page_range_mm() that does this check.

I think this will solve the interface issues I've raised below.

Thanks!

On Tue, Jun 10, 2025 at 05:14:00PM +0530, Dev Jain wrote:
> arm64 currently changes permissions on vmalloc objects locklessly, via
> apply_to_page_range. Patch 2 moves away from this to use the pagewalk API,
> since a limitation of the former is to deny changing permissions for block
> mappings. However, the API currently enforces the init_mm.mmap_lock to be
> held. To avoid the unnecessary bottleneck of the mmap_lock for our usecase,
> this patch extends this generic API to be used locklessly, so as to retain
> the existing behaviour for changing permissions. Apart from this reason,
> it is noted at [1] that KFENCE can manipulate kernel pgtable entries during
> softirqs. It does this by calling set_memory_valid() -> __change_memory_common().
> This being a non-sleepable context, we cannot take the init_mm mmap lock.
>
> Since such extension can potentially be dangerous for other callers
> consuming the pagewalk API, explicitly disallow lockless traversal for
> userspace pagetables by returning EINVAL. Add comments to highlight the
> conditions under which we can use the API locklessly - no underlying VMA,
> and the user having exclusive control over the range, thus guaranteeing no
> concurrent access.
>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  include/linux/pagewalk.h |  7 +++++++
>  mm/pagewalk.c            | 23 ++++++++++++++++++-----
>  2 files changed, 25 insertions(+), 5 deletions(-)
>
> diff --git a/include/linux/pagewalk.h b/include/linux/pagewalk.h
> index 8ac2f6d6d2a3..5efd6541239b 100644
> --- a/include/linux/pagewalk.h
> +++ b/include/linux/pagewalk.h
> @@ -14,6 +14,13 @@ enum page_walk_lock {
>  	PGWALK_WRLOCK = 1,
>  	/* vma is expected to be already write-locked during the walk */
>  	PGWALK_WRLOCK_VERIFY = 2,
> +	/*
> +	 * Walk without any lock. Use of this is only meant for the
> +	 * case where there is no underlying VMA, and the user has
> +	 * exclusive control over the range, guaranteeing no concurrent
> +	 * access. For example, changing permissions of vmalloc objects.
> +	 */
> +	PGWALK_NOLOCK = 3,

Thanks for the comment! This is good.

>  };
>
>  /**
> diff --git a/mm/pagewalk.c b/mm/pagewalk.c
> index ff5299eca687..d55d933f84ec 100644
> --- a/mm/pagewalk.c
> +++ b/mm/pagewalk.c
> @@ -417,13 +417,17 @@ static int __walk_page_range(unsigned long start, unsigned long end,
>  	return err;
>  }
>
> -static inline void process_mm_walk_lock(struct mm_struct *mm,
> +static inline bool process_mm_walk_lock(struct mm_struct *mm,
>  					enum page_walk_lock walk_lock)

I don't like this signature at all, you don't describe what it does, and now it
returns... whether it was not locked? I think this might lead to confusion :)


>  {
> +	if (walk_lock == PGWALK_NOLOCK)
> +		return 1;

It's 2025, return true please :)

> +
>  	if (walk_lock == PGWALK_RDLOCK)
>  		mmap_assert_locked(mm);
>  	else
>  		mmap_assert_write_locked(mm);
> +	return 0;

It's 2025, return false please :)

>  }
>
>  static inline void process_vma_walk_lock(struct vm_area_struct *vma,
> @@ -440,6 +444,8 @@ static inline void process_vma_walk_lock(struct vm_area_struct *vma,
>  	case PGWALK_RDLOCK:
>  		/* PGWALK_RDLOCK is handled by process_mm_walk_lock */
>  		break;
> +	case PGWALK_NOLOCK:
> +		break;

Under what circumstances would we be fine with this function being invoked with
no lock being specified?

Isn't it the case that the one situation in which we can specify PGWALK_NOLOCK
won't ever invoke this? Or did I miss a call of this function?

If not, we should make this a VM_WARN_ON_ONCE(1);

>  	}
>  #endif
>  }
> @@ -470,7 +476,8 @@ int walk_page_range_mm(struct mm_struct *mm, unsigned long start,
>  	if (!walk.mm)
>  		return -EINVAL;
>
> -	process_mm_walk_lock(walk.mm, ops->walk_lock);
> +	if (process_mm_walk_lock(walk.mm, ops->walk_lock))
> +		return -EINVAL;

This is just weird, you're treating the return like it were an error value (no
it's a boolean), the name of the function doesn't expliain the 'verb' of what's
happening, it's just confusing.

Obviously I'm belabouring the point a bit, see suggestion at top :)

>
>  	vma = find_vma(walk.mm, start);
>  	do {
> @@ -626,8 +633,12 @@ int walk_kernel_page_table_range(unsigned long start, unsigned long end,
>  	 * to prevent the intermediate kernel pages tables belonging to the
>  	 * specified address range from being freed. The caller should take
>  	 * other actions to prevent this race.
> +	 *
> +	 * If the caller can guarantee that it has exclusive access to the
> +	 * specified address range, only then it can use PGWALK_NOLOCK.
>  	 */
> -	mmap_assert_locked(mm);
> +	if (ops->walk_lock != PGWALK_NOLOCK)
> +		mmap_assert_locked(mm);
>
>  	return walk_pgd_range(start, end, &walk);
>  }
> @@ -699,7 +710,8 @@ int walk_page_range_vma(struct vm_area_struct *vma, unsigned long start,
>  	if (!check_ops_valid(ops))
>  		return -EINVAL;
>
> -	process_mm_walk_lock(walk.mm, ops->walk_lock);
> +	if (process_mm_walk_lock(walk.mm, ops->walk_lock))
> +		return -EINVAL;
>  	process_vma_walk_lock(vma, ops->walk_lock);
>  	return __walk_page_range(start, end, &walk);
>  }
> @@ -719,7 +731,8 @@ int walk_page_vma(struct vm_area_struct *vma, const struct mm_walk_ops *ops,
>  	if (!check_ops_valid(ops))
>  		return -EINVAL;
>
> -	process_mm_walk_lock(walk.mm, ops->walk_lock);
> +	if (process_mm_walk_lock(walk.mm, ops->walk_lock))
> +		return -EINVAL;
>  	process_vma_walk_lock(vma, ops->walk_lock);
>  	return __walk_page_range(vma->vm_start, vma->vm_end, &walk);
>  }
> --
> 2.30.2
>

Thanks!
