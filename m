Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B0D3596F
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 16:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743353575; cv=fail; b=Fmzv0F3KE7rF5a6I6Lp07ncvW+1SzDENBxzkJR6YTSCeo9wvn0fEy4mBfGHjTw58Zz976y3A0RF9Jotqy74BdQs9ZEILrNQ33ZS2FeHo1J6Td6Pi8V+noPArUu8+Z/QLK9o/18spV2WecA/j3298sx282Q1xMxufPPqH/AyCZz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743353575; c=relaxed/simple;
	bh=P/VzK5LCME1yV4HhpDD1wCFEZILvv/qwOHuMlZDVM2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FLHJ6xUjZu/nVw0iF5aPDesKqM2fLT2w/G0uwtp/8At0I+pbQjHq9zFZYrn0ALlAflg2m2HDcZyDINMHJm0TCl5F65osBwX5fPq4fBxHInyh82bjTaozzU6RX08QgYYsOTnrrMtMI2AUSYhQtZ29csCB3wEcBO2n3f6w/PdaZqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Te7UKZ8g; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hseDycHK; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Te7UKZ8g";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hseDycHK"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UGfvGe003741;
	Sun, 30 Mar 2025 16:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=1VXw6jTHJDXVO/s9kI
	QvJuMaU7t4q57dLIwAAwOrQY8=; b=Te7UKZ8gW4eOTPJDMfPYNaJEVTazjadoNb
	Oh95f3lyNmtqfgTT/kdoNqFZuTPO2Ke/4d4qpwcmZ+HS2j1vk9TIKphfBht/4WaN
	0Kv91kvSCm/rQ3VHroHTe1qG+SCXLymzerQqs+Vu0JqL90kbaROZ86pVi6wLnHrd
	kEaoh1XL7sgziqvc2fXcYv/Nhg/lpANKnHnd6QvMR1Z7cLBQDOuisTiUaKAYMGKw
	4xPHmBLqqjKh10GWfwkO7jx6ub4z0aD9hy/DNJ4qJHRhzqPlcRVpgRSG5sPB+zqY
	F9xYowkDwIvJLd6WrLTqlHNEZfS9Si8JpT9BO6r2qf/FYhxpzftw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p8fs21tp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 30 Mar 2025 16:52:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52UF2H5l004785;
	Sun, 30 Mar 2025 16:52:33 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2040.outbound.protection.outlook.com [104.47.58.40])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45p7a767kn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 30 Mar 2025 16:52:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kl6i50+UQXldK9YgtwLCbMSD+1TNc7IVq6EKB8I5JKqbGI6bc2MzHp/q5CI4Irf3izI0BnwYArq4FybHvDWduTMV7OdB4Fc9iJQkwpwV/lhj5CPogh/YwMGszwF9ZYcc/Oe22rlxqL700YNlOsGCOeXrb9uvUFHwBlhaX73L3GBwH+7wiuqDOKwZhb6kgPugttQg3RolGbWRAVFSnHmAcQHeAylutx+IsyyG80AEJqjuvaMX56NbXMsn5KGWGH01x9jUZzOiYLlifYkmS2A+T+t0pMkwEHxrVCCnKE1DIxw8N0vDcnk4NyUtvEisSB29FLPlHbRzPWo18/UCPAXrmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1VXw6jTHJDXVO/s9kIQvJuMaU7t4q57dLIwAAwOrQY8=;
 b=tMOGo5mtskL+lUhm6QTHazJAtVdN++UPrg7CLlb0iHEx93evoqslI7ZGH0KHuwz0ceXxRmxfLdmfnITAeK4bCbe+yUnIBkGoucV6oDAzn3Lac8wHEFJs/2GGEUZQf6SjEgDkJNMy+HBVLYqnF/+hm/wk6zk2x2Lg+I+K/4t+tM8JcuEgru1UONfUv+3wSGnbZhGV8iiMOiXu0VZD+Xz3Y7r+1hYh5f1KDzaJkUpIsHjAaQCcb8mFobCby/XRrxjGkmzBTqrdu3uof2WJn7QChdbOEKEVF7HGM6dcbY12Ckx+3eOrl458EGoP+TJ0kjK2IsLpj4VS9zPSR+oGXLg4Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1VXw6jTHJDXVO/s9kIQvJuMaU7t4q57dLIwAAwOrQY8=;
 b=hseDycHKAQhH1soxyvv9CDtzNweFoCAj6C8ax7P5NZcLg+b7k5fpe0rv/WWnn1IHCLlMg+eJWweQNzR0NUr1gP1GK1AplldNUI3h6TDePifL6NTTwYzlbmjftP73npE4v+avNTRWYdPE6Yv/KXXRMR+RZJPfhmR+jTjnVcr5+Zs=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by BN0PR10MB4904.namprd10.prod.outlook.com (2603:10b6:408:125::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.36; Sun, 30 Mar
 2025 16:52:31 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%3]) with mapi id 15.20.8583.028; Sun, 30 Mar 2025
 16:52:31 +0000
Date: Sun, 30 Mar 2025 17:52:29 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Harry Yoo <harry.yoo@oracle.com>, Yosry Ahmed <yosry.ahmed@linux.dev>,
        Oliver Sang <oliver.sang@intel.com>, Yi Lai <yi1.lai@linux.intel.com>
Subject: Re: [PATCH v3 4/7] mm/mremap: initial refactor of move_vma()
Message-ID: <b2fb6b9c-376d-4e9b-905e-26d847fd3865@lucifer.local>
References: <cover.1741639347.git.lorenzo.stoakes@oracle.com>
 <ab611d6efae11bddab2db2b8bb3925b1d1954c7d.1741639347.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab611d6efae11bddab2db2b8bb3925b1d1954c7d.1741639347.git.lorenzo.stoakes@oracle.com>
X-ClientProxiedBy: LO4P123CA0365.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::10) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|BN0PR10MB4904:EE_
X-MS-Office365-Filtering-Correlation-Id: 23563a79-e672-4831-9efe-08dd6fab431e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jG5FBXNbXP316dHPxcFr3FrjpbBxZh2aPN/zOKBJaoL9zMp9lA6bZxuwiwXI?=
 =?us-ascii?Q?nnvI6ZWmBrta00wrlVZjuZDG2ONXZ+mMf8ibUDVV4XJghKv6lIMmoC2cv94G?=
 =?us-ascii?Q?qsPMaruNi9yBl6YYya4nZIHWrmhchCsUso07VWnWKaTZgKOSR0/XELYm8K9a?=
 =?us-ascii?Q?lQNwW7RTVTMzEjdHlTI/b4Vyv2gqhEz/qNhaf9EM4/uVGhU+vq9uKGy37x6d?=
 =?us-ascii?Q?Lc5jPVa9g3frKoA0iVawCWB7B+IgVMb6bBkNAk4eJ9pEqL0u3PZkcOCW05WY?=
 =?us-ascii?Q?V0PUkiyU/M+GEwlwczLY/urHGulcwDJn+/IkebMtjiXcHwjXxwudD4NX+rOJ?=
 =?us-ascii?Q?Q63wiGvXzeArdXVowByxuHGT0WRi+UXyI4/k8ovICREcCK8LqoQWSo3fEBS8?=
 =?us-ascii?Q?htHFNSW3O/s3SkfdRq5yjDHFeWkD1ZF84LpqZRrGk0yjvjNcO/HZG36IgQdp?=
 =?us-ascii?Q?Z3F0qPWBzOcepxrr1ZSjtim16o4PajJjeOSw88uqYk1o6ejLQyjfJo5eEKPs?=
 =?us-ascii?Q?oCy/JGEix1sE/gSiMMQhTviMGqanXVr5qRQfZTNJY6ySPpdeVnuiHiNkkND1?=
 =?us-ascii?Q?yTMGsKL9+KRXxG7kaXYldLB3IEvB6GUZ5TLHXpONzb9ja5i+Vo8qXlhnYXEJ?=
 =?us-ascii?Q?GPLEgfXWS7XSpZnCQ6i+i0VmVVST7XV+i6iU3H35i5TLJrkyAFedNVlCozOw?=
 =?us-ascii?Q?OpUsCaOcnilQ4ZSatPo9MHwK4eoLHL2jXXXe6GZfEgeiV6EGOP3p/DjbilEG?=
 =?us-ascii?Q?/i7xNXdc2ef4hTqNj3OH60Pr710PTcGsisJy+cHlLh/bbrwVnktyyVqpXSOX?=
 =?us-ascii?Q?qjTZauIinar/uJ9OgXimO1bg4Xt11wEYae2WqgpdOTxGuQBFqOX01CGzUNy3?=
 =?us-ascii?Q?ZtjYw7XOq6gfLvL7SbqpVfnBVuV2oAj8v1J5aQRYhZ8hM0O/FfouUFVOZtFJ?=
 =?us-ascii?Q?9Dj4SdbVFZ+Ky3r70UHpUwPC/xZO/rsKlHQt+bZIwMoYBsBGDSj/hPlzB7Rx?=
 =?us-ascii?Q?TJtL2sof3eaXqWf7emIJo0xiaOp//HUNkPOtgIsSTyPNIDnshIXkcOoMDgIu?=
 =?us-ascii?Q?Ecrb6BYT1fOOgwmbTVT0xgT3qQ7Mutn9DLV1Z+2W1k+S0JN1ZAcWCD9Kvz9H?=
 =?us-ascii?Q?AfQ4jGZZkXZkDkO6LUFi0ueEhA1dldW6TINfXIeTEIgexJpP+UMOpWLtRM46?=
 =?us-ascii?Q?/c12PEF4F6Za0sUareSBJbwpdwL6LqmcUcpRWI33x2DoRAmO4fZJzwj9NG6Y?=
 =?us-ascii?Q?k344nzhu71wtXtYSHtIdFp5XuUH8tbrYLcBRHhyBi/CcMYvsa9PMXNXODgtg?=
 =?us-ascii?Q?tLSnnlcxN1Rh5ebNIvMf171Xh0SNLqwU1KA+5yM20pG7S+UddQNXpxap+dgq?=
 =?us-ascii?Q?IijJp9eWU2oJtNI51FcncR2crNa3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fSJlHf8U6OcC5P0KNB2ERTK3uptH7NsO+/YmTABttYGitDA5ihDKfB1/6z7X?=
 =?us-ascii?Q?W20FjehC16Ur0X1CjewP/hU3QOPsLEtwhS1EAmfaB/TD8oSGjA5PUYX7ijo7?=
 =?us-ascii?Q?HcLtLsnHhl4MBfgabKuz0KXbkIJV4+3ks2DFBL9FtfcEodzQKm69fhLLEa0t?=
 =?us-ascii?Q?XiyfunITdSR7YjVoZlzYTzc2ItNPBsH4Ri3OCDGY9E6NbziNND9zUbqCl7MA?=
 =?us-ascii?Q?uadsVksOwG615CVHQLevNEynP7jRDwOzDjYf7BOVvSgsckboLde3Mb8Aseb1?=
 =?us-ascii?Q?ywjwe7yPkvjMfUP2LmDl+LGVGV/dsMnrBEIncr40u44lzOqAgMnSOjmXbz4J?=
 =?us-ascii?Q?I/dik3/XNx/U7Q1J5Ex3D9YsqLZ2zYDMLhOBB2wGL8dSvxQTEzVucC/d71RS?=
 =?us-ascii?Q?9u+8A1JDa4E9wqRMmM5iYUzTunBdywoJdLMLKGxpH3qqTvlDDgNqZVHsV22n?=
 =?us-ascii?Q?eSo8TmRCFkME+snxjpFxoU+E5e23EW2/7w4YDBIRc3Pi9d05LzhZCczoQ1hY?=
 =?us-ascii?Q?Afbgp+PDwmAgzSQVPi6S7AoO8NxvTAqbrQnsfbyKa0at/IWvq/X+wXqrKhem?=
 =?us-ascii?Q?c4NQ5BB95A8kGb5QkINfhHdRoL7buYcyT7ZbmCw6FbOs3OKz+whKqNY61Esr?=
 =?us-ascii?Q?DRQJ2iLGY45tPYzv/rJaKwe0LsGnXpewdIupHo0kja2ytVEpBFB9SEfH4qL0?=
 =?us-ascii?Q?4y1RlnXGsDyqkZLLyfRF0fsZ58ut2kl2NTp7+jzACTb53oxHzEQpXnqbPS0K?=
 =?us-ascii?Q?J7YkvXlnGjt/Kw7Y+NR9PDu079KEOjoHV+S2UqX0FyKmNrMn0+3knGqHdGZY?=
 =?us-ascii?Q?iFJZxXsIpHn7j0c+L8DFlr4b1PMObT0q3osq/vmpC7JMH+gvk6mGR5xialNa?=
 =?us-ascii?Q?4Pi1G8z6lCugVa5PmIsDGwmoO/+jsJS5KyaJX0AyphYyUSbWz/jntwqlGAK7?=
 =?us-ascii?Q?kXpwBElvVTQC0Wi0zLMMVmCFqYHa/DXTOtfIdjgmfZacsgZIJpMU5EWquPtr?=
 =?us-ascii?Q?UsEHscZmoJfjt7iZuU5WSIG2tmv0Fr0UHxo7r3VYj2WCZG/MmJ9wSUoOn3mZ?=
 =?us-ascii?Q?RbOwwy69b6c9JdQ6m9BL3kSK6bhDQe4XMTsf030JNH5kFrfm0wv/N//kpFeW?=
 =?us-ascii?Q?SRWmOMZeNLF5We6ouGSl7xgLXGzSlpRoveN0UeEBLQ0/QXjAxf7bAICJg0be?=
 =?us-ascii?Q?zdC2dp5uYc5ng2jN9rm6sh5e7Ixvh9zWbuEu3LlUFsYU8gevOswd8+W1md4x?=
 =?us-ascii?Q?V8//WiNVH4Bhc+eHawHiHlzbNK3O+WDWIGRiOq7z4baOeUxGEsikBj5Yn5Ff?=
 =?us-ascii?Q?RtyLLI7y1nKQiXFSq0PRSAaFWhiubo70Ryujt8UGu/6bNTVJL+Gudz4SsEBH?=
 =?us-ascii?Q?5RGya5hcWsUTzywvFcRLo13mHfnf0DQIFe8wgK9M78ZTr3a2VEWSA9Egi5hP?=
 =?us-ascii?Q?5uZltOhA5sYzRMje3ih2tAtWBVQaiNiRD/fzUzz9si1hl+vcUVsyk1NYTO1J?=
 =?us-ascii?Q?UEix2jrkxpEuGItvNNDwgO73AQU+cuC9s4g5WzACnHufXcVxjufTMBrhLOyN?=
 =?us-ascii?Q?IMGdt/3rHu9la5Bdiiuqpt7lJSKUEZY6Hicomvuklsj5gvHTh76wDMa6XV7p?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	900rjjg/BcMYrgK7qBsYKcOumjVNyYo5/wajoy6vvQZ4Xuwk6bNTb8mZ6Uq/iHhgs1c8p/IGU+/J4ix17mI83Ef3LIBqY7h80xwA9DP8t+2RxGTnZHBkola2/c3HLNYWNSpuygwnO+kYfxIPmBMpgqMUg7fqGAm5HyzpiyvXtEcTeEKIFGwsGU8cfdMH1ovSe7oQten8hBFRgpVCS6Bb1eUN144AzPXI7151G1ZdI4nPfEFbuykAMIkpEdpY8QMUHwI9os96dbh7vQRuK6QzfHQVfPUtSgdL9l0/sH4zToyf+zb19KgM09GOcuDfFzjAbUCT/fZGYQLsK04a8zV3Js2cemGvPLi5QThl6peVQBQbjVg3DGQ86LsD1vyb/teTzocjEQDfkVN9oWmj19fj5ysn/F0qKwYcrEZAspC0qUxRrSjyypjB/5r3RyMWlv50oBcdO/zs+BBdqWJ5zLS53/J5sl9HxAUUxkMTgw2cxqp4+4j+Zaxqv3z4VS9XdJbGML4ui67UbmEmiclR6jMydagEfQX9kF/N2cfvs2J+tNe82ZL1ZRUMnmm2dQeeCXspQpehWCMRjp8Fsui8kc1HUiVbeRjdXIwlUF6qT7O/pG0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23563a79-e672-4831-9efe-08dd6fab431e
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2025 16:52:31.3433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8TCdktkTj+/ewEJroiuVRJuAE6KNLeMVbE1tM5AXYJWTtiziZWwOjknxvhYhgJQiZ2cpj5Tc/76CqKgYDQWOh9VgBVHMDrf85srJqNr7gkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4904
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503300117
X-Proofpoint-ORIG-GUID: pR2v999G6EmFfuLDyxpn_9Hm8q-L6c7q
X-Proofpoint-GUID: pR2v999G6EmFfuLDyxpn_9Hm8q-L6c7q

On Mon, Mar 10, 2025 at 08:50:37PM +0000, Lorenzo Stoakes wrote:
> Update move_vma() to use the threaded VRM object, de-duplicate code and
> separate into smaller functions to aid readability and debug-ability.
>
> This in turn allows further simplification of expand_vma() as we can
> simply thread VRM through the function.

[snip]

Andrew - I enclose a fix-patch for the issue kindly reported in [0] by Yi
Lai. Since you've not sent the PR to Linus yet maybe you could squash this
in? Otherwise obviously one for 6.15-rc1.

I've tested against the repro and confirm it fixes it, also the fix is
'obvious' as is the cause. I have replied to [0] with an explanation there
also inline.

Apologies for missing this before!

Thanks, Lorenzo

[0]: https://lore.kernel.org/linux-mm/Z+lcvEIHMLiKVR1i@ly-workstation/

----8<----
From 3709f42feb30e2cfe2f39527d4cd8c74a9e8b724 Mon Sep 17 00:00:00 2001
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Date: Sun, 30 Mar 2025 17:20:48 +0100
Subject: [PATCH] mm/mremap: do not set vrm->vma NULL immediately prior to
 checking it

This seems rather unwise. If we cannot merge, extend, then we need to
recall the original VMA to see if we need to uncharge.

If we do need to, do so.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

---
 mm/mremap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/mremap.c b/mm/mremap.c
index 0865387531ed..7db9da609c84 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -1561,11 +1561,12 @@ static unsigned long expand_vma_in_place(struct vma_remap_struct *vrm)
 	 * adjacent to the expanded vma and otherwise
 	 * compatible.
 	 */
-	vma = vrm->vma = vma_merge_extend(&vmi, vma, vrm->delta);
+	vma = vma_merge_extend(&vmi, vma, vrm->delta);
 	if (!vma) {
 		vrm_uncharge(vrm);
 		return -ENOMEM;
 	}
+	vrm->vma = vma;

 	vrm_stat_account(vrm, vrm->delta);

--
2.49.0
