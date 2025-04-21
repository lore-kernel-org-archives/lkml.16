Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857E81EB3E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 06:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745215460; cv=fail; b=SISsKQAXEiwMbozSEnmqPQ7GERvvpfBPe7ykMbkMsWrcHTFHFx3PcC4UsFZvpNmo0KRnL3qyJpASsaQkNPCogWdQ/+npP9KiNebt4l54/mH8wY2lhIng3oK/bJDLxEjP0zHxhF6IYGElfbqQh3aX/x0c0I7/Tdf+3H2pK4Y9i/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745215460; c=relaxed/simple;
	bh=CSPFgrv0rLvlnPlTAfmQj/f+h5LQvaWbcjzpdYP62fo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=C3tTl2ajNkwfpIMr0qUD8uy2bOmL/Q7VlVTDi8whDaMzWt2AokxfH1Nzy3pURLWFmYnAOXDkF5p2OfxbGZhinH5wQcSrhkcz2UwuyWGKXZbC0nhp+PL6WDYaPZyCaC4rFFwagVJl76L57ix17rCETWy8KVSsxyYq2xWaQ1bc41g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=e0JNpsz0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IJLPeUkB; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="e0JNpsz0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IJLPeUkB"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53L1C0bo023186;
	Mon, 21 Apr 2025 06:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=B9chyyhe/NG+kyHcuo
	JpDjmWN+7K4j/ggco4tFgv91c=; b=e0JNpsz0vJHt4//3kChRmOMf3lhHbcX1Q0
	ry26Zrol+DtHJsWdMAqoBVPvN0UmKdPZAo7ux6OTx7HaZLIsNk8kh85nZG0xRAzl
	Uq/QpQAOCpUVd4b3oBTHSZyTbsIAySNL33MSItriqsdCWzcWWQZf8tYWLmQo32CT
	zooREw3ftkVc0hVoYac08I4npWALur3udD9YlBihdQHoBmHNkZhkurmkrf+D/qNk
	4TN9typVnjtA2ospKPJLSZTbh5GnqRGUlhv4mfrdK7CI69W3usMiavOzEt53Uspq
	nb0T3yPvX9lXqXQXKK0mR/H62DKC/HicyIlTUBtsNdv9dSICs2vQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46428c1wy2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 06:03:20 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53L4Ucxe021184;
	Mon, 21 Apr 2025 06:03:19 GMT
Received: from cy4pr05cu001.outbound.protection.outlook.com (mail-westcentralusazlp17010000.outbound.protection.outlook.com [40.93.6.0])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46429e5p96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 06:03:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bWSeZkYwbseMMT1ulpAGpznBaH+A7F1KEMiEImuqom7h5/WHq10Q2nijpWJsn+creNHnij3/nGUtSYn+j2CA9BH84bpOejA/ePuhuNp5AkAjaksjgFkN5kThZD9kluTzh152aD6wAL6iOwUcJv7Dy4beq/T8q4imIVrY4MhtFvuUSMWC9F0rONqAOsMVVMYShjtr4DB0MKGOigO6gwMp5OhexIB7uXc4TPpsdXjULz/rt9wdDhkt9djY9ImO8iwaIsH772uD3JD19jsBkxglsKgqQ1OPA3a+AUecblu3m7wXfyGVOr2D4SQasHbD0nNvevDt6PM7kDD2/iaWFrgzxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9chyyhe/NG+kyHcuoJpDjmWN+7K4j/ggco4tFgv91c=;
 b=jFZuRz5oQZNGP1NFH0R832s8gDs3JOSvEfCitFZQyd1vJsl7l8FKmpSucNsNoCG0xSKyu6nK9FBSRMR1HT0hmBTpWBlnMIVuykqgQoCWTZKTX2BFtcSOP1czHpwHDGCn4VyLbtwrxjxcxkRGdtkP9mH7EOhRgIDVjsw31NG6k2w73kb8t0ABYRmMpdlN6lBsrccykuDwDNOGEpnN2WVZP98uFA3KaLsAdOdW5gY0borv2WotXUEddUQtiAls8Xy2czXw4kHW6NG3/u78goZ0kmyhyQG+qjFhtu7INjzc+vQmPwYodYM5iFjFAafVfTwFjepCgPQBm9u6E8AJkM2yOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B9chyyhe/NG+kyHcuoJpDjmWN+7K4j/ggco4tFgv91c=;
 b=IJLPeUkBbS1MWKGc78oePptcmiVVXWjWPCj4gzd0U5sdDNkHscwmw+MCUKf5LsEw2/KAPIuiSLyRktUT8twOPgLZXIP57bpgIWmCsDSipfS1f9PEXei9kezI7+58cjBGdmrhdxDaAyA3rwGjpD6kuK3kLkIVflO6xwcKO9yyT1o=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ5PPF3BE5F3DF6.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::79b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 06:03:17 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 06:03:17 +0000
Date: Mon, 21 Apr 2025 07:03:12 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Ye Liu <ye.liu@linux.dev>
Cc: akpm@linux-foundation.org, nao.horiguchi@gmail.com, linmiaohe@huawei.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Liam.Howlett@oracle.com, david@redhat.com, harry.yoo@oracle.com,
        riel@surriel.com, vbabka@suse.cz, liuye@kylinos.cn
Subject: Re: [PATCH v3] mm/rmap: rename page__anon_vma to anon_vma for
 consistency
Message-ID: <9b0bd289-40a8-4e4d-89e0-7eae922bd41a@lucifer.local>
References: <20250421015823.32009-1-ye.liu@linux.dev>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421015823.32009-1-ye.liu@linux.dev>
X-ClientProxiedBy: LO4P265CA0275.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::11) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ5PPF3BE5F3DF6:EE_
X-MS-Office365-Filtering-Correlation-Id: 19218aa0-bf67-488a-f641-08dd809a35c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dz/ps93yXx7DBDxDhc/wDbgkZOa5v5OOt6QdT/DM70LV980DO/MjdQ3Ato8I?=
 =?us-ascii?Q?4ruD/zH2bQ755RWqESa/2xL5cPPXrguCp6WiADBFs4jB28aFdrExaf9eQdhg?=
 =?us-ascii?Q?gsvnxNkgaCxSLViq3EzF6AH0709mUo/Pp6ybSLdMdRKdpK7ATSOLtPFUaQOF?=
 =?us-ascii?Q?3SQziNfwwVSOmpeiJpgss8sNIyFb+IITLZJt2nuqpioN2DUc5F2ohxONtlQB?=
 =?us-ascii?Q?gsDEtA2YGEc5vXUzRIvD36u6Hi5tLHwfW5+nllHLPaA4dzQ35LWXG9WCsr+G?=
 =?us-ascii?Q?/EqOxdUPbj+3G0+oYb2LUmbVFH5LMnJJRkDc7LKtmQOHKmdoXMSb6fyihRzV?=
 =?us-ascii?Q?unfGnR0MM3hdKMEw1jtu3KBZMDrC4nqesH2RXsBoCZV47fGPrFjOJbfZioSP?=
 =?us-ascii?Q?p33VvEc4DBZcbseil8AS6sz6+TGkQlKWb5iqjL7u6v2bk6aohipWiJESoVMs?=
 =?us-ascii?Q?leOgD0S+Bg2Pw0cpMSDH1DtW9MbA8tDsu1OZAkaSQdhuiYlih+IhRpo3ngrb?=
 =?us-ascii?Q?ob+rW4V9IOuc8V/f0tGoeKazc9VQLDZfL9tZib2Hb39fZnLRAkP2zL+34elf?=
 =?us-ascii?Q?Aphjm9Qv7V5tdDs5ZuTz/zLTTvmGIhzedMk8YsNQXe/puQu3o6uQQ6XY3F5m?=
 =?us-ascii?Q?qihQkvmUemwCzwqzMWxguAytHoiz5iX16vAMhZSnl0FWxd/5igsfWoop9lvU?=
 =?us-ascii?Q?2dPcJ8n9HtokTJPnnvKtzGp5hANfT462nGR5cH+6n7ATavFKzLy48hmzw2rX?=
 =?us-ascii?Q?AYoPfPGiZHYIu/8eDHZOdG2T9Q8d+YzgSST+r7x2GNyv69h+8LJTBK5nBQeZ?=
 =?us-ascii?Q?v6cckEemffB9tJ4kYC2LYzqmTnDRTrvyVlaTS6hrbyzyarIdBeJvJEq6VaDl?=
 =?us-ascii?Q?Ccgcyn08F9L7ly4wmYA8Qc/aa7vvC+gqnwpELjt+rSN0/Van7PTONTvo8AGZ?=
 =?us-ascii?Q?J5Aj4PF1FACLaMqRheEEj3oMMtqYy8cbTCK2XlBVr5vVqGXQI+1zZYRX/f+j?=
 =?us-ascii?Q?v+sA3wBU8PrflFkLLzQVabpCPCjZRofYJcZUG47XYHaollrWLQ7NFQi8gUHD?=
 =?us-ascii?Q?hg9a96X8SB5qINNqeVfacSwxyZwDjGUW/XyT6vXI/HUS2CIwYls5Ml3Ze6fY?=
 =?us-ascii?Q?Ov6lHuojIeYs5YiEO/S2Ge91pRwIwTZ7uyvzDyOmc/iTbk6r5pGgVUSiSQqP?=
 =?us-ascii?Q?DN91pC6gJK32wjN07aaqr8Di8PLlAkn2HLu6+ohXUJybu2Lh2A9HiKpnT8Eo?=
 =?us-ascii?Q?KN7h2tfcz6i5O5aPk5qBUKka0vYiUb75vyrD6f1e1vY3oA7f3lZcveeqYzpO?=
 =?us-ascii?Q?Xtz95EEIxqAjf7ZFSsbGaYLTjLWL0DrH4TbBDm7XsKgrM228EWCCXe7nbEAG?=
 =?us-ascii?Q?t00rBwomN967o/j/Y+n29cYsxBLszsBssUwOpQT7Cq1o+rzwnCLm+IX65TNH?=
 =?us-ascii?Q?FxSuWdWiiEI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IqNxPHkZLjexAAJ93f5MOw5zgWE8h8Jg69QIvSitMKG1B4Tl3RH0xP2Y9X3e?=
 =?us-ascii?Q?605bx1cB9/eDJ7wQzphtyiyCsdLAnBA7ReJNFPQdB3aV4CgJCX8J+OmXNRCC?=
 =?us-ascii?Q?povUT5u18usASsPozpWLaPU6dDOv2WtYEt8AmiA2XSWwPWNZoPyFg7PGaMWx?=
 =?us-ascii?Q?S/I5nmyst5joNH2pu+xEuQX3Uz6VYIdARPhUkANC/HYdrz/uvzmLRiDj5/9K?=
 =?us-ascii?Q?UshDT4M4YqZ0NYcnF41HNytGLJLTu6FCcooyCtB4aeneP2p0jSjK99Bwe/uw?=
 =?us-ascii?Q?7Ufo5d9IeCrz90SzTZBIF8qzH0exrhONROo4RLlJ4F63sRjiabok3QsZGo+s?=
 =?us-ascii?Q?xmO9t34491GMRSOHEHMD1HGDPSAaKR3FxKPhyx1FbJ6p4nv+DwBal48PdJT/?=
 =?us-ascii?Q?NxStYydLPui85OkGs+wQVkTsAu0XIXX5VCIPN7givnAGdCmqyoERzUo+GlmS?=
 =?us-ascii?Q?mxJdrYS/OC/TE5DeTU9Q4AzqoBlX4KdawfqchvJAYFdzELzjWlvRSYIVOTau?=
 =?us-ascii?Q?PR8vI6awisvrCBXd2qRLxI3bAvyqGdpj/PwZp0I1s0Kq8tkU+22eGj+Y0K5x?=
 =?us-ascii?Q?OwN8WdABinPaAT2ovmMP+WedhBHZ4cIOmdPkkmawdR1gnLNs26BqqPNF6rVc?=
 =?us-ascii?Q?rDjqRuDj2KVHOVr2YJWxXD0L18DJYbUYX9tmUqBUVfdAGtHFbblzFCx7fPez?=
 =?us-ascii?Q?eU4KfgOC7jrMUaldzCdPlDxLq/d6WH51OmegnQfWxqD/UgBPySie8x6/JGr0?=
 =?us-ascii?Q?RkJaCmaLXoIlABfYz3Dh4WwhNn/trzqUEezM8SVsJ7v6Jx9V2LBgPvNp9JXN?=
 =?us-ascii?Q?i4IuMV+8AbcNIRBHp1drDdVACg7Aft10iab74dNHJWdeBZUO2Wkdrl1+WzkG?=
 =?us-ascii?Q?Ew2H/KzKgSGI+ZJdo/LOTmWqktiUBcjR+3bSa9YquWQe9uhVk+khekk0DTcc?=
 =?us-ascii?Q?yxmwMMB+gw9Mt46hgZvSLNUm4Ih4ETebba5kNlfS2Ky7EMPPJ591a+iR41VD?=
 =?us-ascii?Q?tkojnCUCd91oKuE1wx17dqhx7FkmJ4ooS/KaNy2iov1Jawf4U4uflkR/9G2c?=
 =?us-ascii?Q?llM9L6Ho0jSnJLr5G/tv35Cfe34JjMhTyQzG86JGcrTZLRgjHYPUDVabyMS+?=
 =?us-ascii?Q?LnNiL2SXh0pgTkpx26+/9ebT/nAi9Qe6sF2VY10RdsnmqkCsBQuafnumiWf9?=
 =?us-ascii?Q?B4/dQlVZQXr55oFQF3xqTzyobtNNx3Wg0GZ9aJzTAD16FhdFm2/RlNqnOUiF?=
 =?us-ascii?Q?fCtbipjKrnmrFPaCdSQFGDhwpgHoctfjj24Bb+gYS/fiQ9lWHUYHszy+LvD7?=
 =?us-ascii?Q?8wQik4N3LAhGACdsmiXA3tiKfD3aMoPZTuHIjXLJwyCbQvJI1LSwLpndovDB?=
 =?us-ascii?Q?G+EEPNdttQ74aqta1TMG33BKizNhO3anWWmOiZ91QfRw1UKwcOub1TC21RZr?=
 =?us-ascii?Q?v3vmTu3yjWYs8XyE0xfLSD8SDW3uag7+bt6/s0h6dWPLsqVdAiWvvTc5ZG38?=
 =?us-ascii?Q?/Z7Pk0NWGb+fPtiaJxeqirx0wd7qnxuEdPXpML9SiJytFkR3491lisUyk7/3?=
 =?us-ascii?Q?LfSH9qNyyzdenGGVWlg9fbWC9X3XrGQJyGT/0CQDFtoy2z0g6OeeOYvmgJ6E?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8ztJLCExP9Axp4ZEzdH1s/cMqYYr1YPX6QP3CfM9mYd1nZQqoZyqI61EwcW38CDHFE+rnuNz5wzmP2X60L+3EoNJJxOw5hjRe9I1HZvWtiLhiD9SUN+JaeCXcehIAXvSCMKJ9VvSATll/uuijkqQzX97JUBruhbiDFh8TTBM0YxXkVJUUTtHHwwzixHFG2q7CJ6as1/QLv0yxKZbSO7ZNB1gOLBPSYMtdckrS4biPPkBv2xd2gFENasuFJfbX1caXysDDgt25Hgo57vlEP9u9aM1hrsW+RmlBg/J/eWoO1ZwU5MxGbqApNrHyiQ4u/jn6jVJ7eq/5ppBJYYjtYW5UPM3pEtqhWsMZjTmvgTuL0an9c37GLATJsitjfEx3Sgsxf4kuhtvqlAEHgKQg5tPGGOJjK7ctOWH33+Oy/i3RY6L9BkMH0IYMcbAN2mNJwk2BOhi/60fPoPD3FF3YzBIbb2bc3TvN4Rdp4YniUVSabw8mHYIviq59SNfwcqwM0TZpj7s7PSrdTVPy25E033QK4klA/hgQWL17iaZ/9oabvvwhpAsUZH8iYYfIvHep1h+LcJygB9iwBPdb80XdXMn2Zidg5Xrvnfah/tSaiGKSxI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19218aa0-bf67-488a-f641-08dd809a35c7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 06:03:17.3642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VPGEi+qQWK6h2x/s5LSMGCTkOnAFtEiv4RyjryklKMeGC7Sph5rKApAU5AgLtS+OVkY4Vbk8hJEafb0tTf1j1dIbzWH9h7gSvWxIvWVVmj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF3BE5F3DF6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504210045
X-Proofpoint-ORIG-GUID: dDSTh3YOsaYWYaNIIlJOELBrW3g5IltD
X-Proofpoint-GUID: dDSTh3YOsaYWYaNIIlJOELBrW3g5IltD

On Mon, Apr 21, 2025 at 09:58:23AM +0800, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
>
> Renamed local variable page__anon_vma in page_address_in_vma() to
> anon_vma. The previous naming convention of using double underscores
> (__) is unnecessary and inconsistent with typical kernel style, which uses
> single underscores to denote local variables. Also updated comments to
> reflect the new variable name.
>
> Functionality unchanged.
>
> Signed-off-by: Ye Liu <liuye@kylinos.cn>

Hi Ye,

I see you're still getting used to the process :) this patch isn't correct,
you're sending a single patch at v3 against a series with 2 patches in it
[0], but you have sent it entirely separately - this is not correct.

If you want to revise a series, you have a couple choices - you can write a
'fix patch' -in reply to- the patch you are altering, which provides the
delta against that patch.

This is the preferred way in mm, unless you have made such a big change
that this is infeasible or if multiple files change at once or if so much
has changed it would be a bit silly to do this.

To do this, you use a client like mutt/neomutt/whatever you use (but one
that can do the linux-y In-Reply-To stuff correctly) to reply directly to
the mail, and then say something like 'hey here's a fix patch please apply,
and add the output of the git format-patch that contains the delta against
the file at the end after a single line with '----8<----' on it.

See [1] for an example.

Here, however, you've confused matters a bit by sending this as a v3 when
it's not really a v3 properly, so I suggest in _this case_ you just resend
the whole thing as a v3 with this correction in place.

You should also propagate tags, I gave a reviewed-by tag here, so make sure
to include this and others given when you resend the v3 series.

Thanks!

[0]: https://lore.kernel.org/all/20250418095600.721989-1-ye.liu@linux.dev/
[1]: https://lore.kernel.org/linux-mm/13426c71-d069-4407-9340-b227ff8b8736@lucifer.local/

>
> Changes in v3:
> - Rename variable from page_anon_vma to anon_vma.

Also _please_ copy/paste all changes for all versions each time, and add
lore links for each prior version.

You can figure out the lore link as https://lore.kernel.org/all/<message id
from mail headers>/ - I always do this manually :) you can see I already
figured it out for the v2 in [0] above.

> ---
>  mm/rmap.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 67bb273dfb80..447e5b57e44f 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -789,13 +789,13 @@ unsigned long page_address_in_vma(const struct folio *folio,
>  		const struct page *page, const struct vm_area_struct *vma)
>  {
>  	if (folio_test_anon(folio)) {
> -		struct anon_vma *page__anon_vma = folio_anon_vma(folio);
> +		struct anon_vma *anon_vma = folio_anon_vma(folio);
>  		/*
>  		 * Note: swapoff's unuse_vma() is more efficient with this
>  		 * check, and needs it to match anon_vma when KSM is active.
>  		 */
> -		if (!vma->anon_vma || !page__anon_vma ||
> -		    vma->anon_vma->root != page__anon_vma->root)
> +		if (!vma->anon_vma || !anon_vma ||
> +		    vma->anon_vma->root != anon_vma->root)
>  			return -EFAULT;
>  	} else if (!vma->vm_file) {
>  		return -EFAULT;
> @@ -803,7 +803,7 @@ unsigned long page_address_in_vma(const struct folio *folio,
>  		return -EFAULT;
>  	}
>
> -	/* KSM folios don't reach here because of the !page__anon_vma check */
> +	/* KSM folios don't reach here because of the !anon_vma check */
>  	return vma_address(vma, page_pgoff(folio, page), 1);
>  }
>
> --
> 2.25.1
>
