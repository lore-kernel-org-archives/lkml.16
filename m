Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6469E279910
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 16:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748363902; cv=fail; b=geSIKf4o//o9LqL2Q65C5DBB1YLJuvPA+IHZ7+0dsBYdryF/E+9hiNafe4VFW+8QMYaZii92jnDPt8FzepV6+5z+I22DzBS5pkvQ9Qm0pPf0IwgnA8YdwT/1IOGF4AjHXTV/heR+GF9Tm5hU8IMQXWu7nzNhJTF8eskJKqEJBcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748363902; c=relaxed/simple;
	bh=wFp6MkJQ+4OzWLz1UWDAyYB8GCo4Z/dA9WASxszIO2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fY99horCiLtWuERYBR/cmz6uMaiZPl5NOGxkQGFLBujUwsZQK7+xX6JNKjPd72tkdSAhsX+cG5nQ3rk3DeM3uNg53GspMXCfUaHuJ7JyZnlQlxnby5iAzBWvgMcMUVeOVRRjzcSd048BE49xGg3LlC+v8yhK//cG3FYitvZPl48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OK1gPLBX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XzeO2Pi+; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OK1gPLBX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XzeO2Pi+"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RFu6S6010295;
	Tue, 27 May 2025 16:37:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=wFp6MkJQ+4OzWLz1UW
	DAyYB8GCo4Z/dA9WASxszIO2o=; b=OK1gPLBXRXo+W16rMWiWwO9H3PPW4ouFjm
	e8wza5w7bi7zlFRgeHgCxbAb9bW6zPg8gudFU3shsLhBywE1+8qew5cR7DWZjUEA
	VlmK9RcoV/FaUQvHzVF2OjIye9tDhjAzTR7Y/70zCjAv7sjHsw00P3sOcDvH9DmC
	/GgJh/GeGALDdLeOhkkX2pifZuG7cFARyCwBWbxcxMvGWbwn/pWahkzoELrOv4Pj
	dW7DkcVZSoNIYNGEnzsuBIplCHzvoL56xw3M/qUHnb90akVmRsrInS4g2TtYJxvw
	Cdos6ADvrLI2Cse1SvVbpTebFHSPEtDTG1EvTsdhsgsJxVSZBmuw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v46tupkq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 16:37:47 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54RGDlvP028686;
	Tue, 27 May 2025 16:37:46 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46u4j957t4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 16:37:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rXEaFnmF2MSWOPMU3Of+C+N0R7XNwc05EsUSmXKqL6jdMyQ7LIOoSKrHWGtb1V0BtwhZTgn9r7IKjCtfF6wpu3WN3A8P2kpazoihKmKIGyYSIQa8sFdr961uDnaXsZwsfe7/rPJHe7UkwGuLHDZoIblkD99pytQX7s8WeGFb8pNKk4EgPCAQKnv9gb1dG2H3OblAmxr4pDmV/Pv900+l8zHJJppc3gpn90S2QCkcm/aeQeHrK9GJh28CmnP0OSOinrlbZ+lWeZBOErkv+fbVub6rJmanykmr4fGi2edEsvgun4FxxE3HgnEgg//MtkndlA/PrjTdZuKAdkz0YnfB/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wFp6MkJQ+4OzWLz1UWDAyYB8GCo4Z/dA9WASxszIO2o=;
 b=lW32I06C5rktH9VF+rpUGP1EJuPyq0MRzMoit8dO7lLIHcnQV9vfMrLujXFlC2WAEGMWnKXQUcNQoCn6Tykpimso+5RUrbRwMql5fotDrHyEJaX6LCMil/wtWQZq51XS5kL8LOOwkmajf3Jo7yLP6u10Dj33XoVhq4czzkKmmhJDQo8ic50+1by/PThb4TV+QKowJrh/CATQCYwvkh6H57lIDljhNE2+J2JPcPgRpyNlgvof9ei0RyQ1F+i/UBGvZ0v8UwKW5XhDrnxOjV+3IQxy7BqRp1ItwTBBanWpRN07fXw5GCycVT0kPFXs6yFEI7v3YzUfcbwJqQSk3wwFIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wFp6MkJQ+4OzWLz1UWDAyYB8GCo4Z/dA9WASxszIO2o=;
 b=XzeO2Pi+lC9KAbmK1uQHD93yezgxBPvb7+TnEY/iuq/mDztPucX+OWJoaAWGG/yth+TmAYcb6d7/1kdAjhCqEKK/KlLgbamx8E54DOxXDentDy+a6fwSecjUscfW6MCSGHPNsb296ZRsqItixqjm66CzG0Ebf7oKWl5jke/rMcQ=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH3PR10MB7233.namprd10.prod.outlook.com (2603:10b6:610:121::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.39; Tue, 27 May
 2025 16:37:43 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Tue, 27 May 2025
 16:37:41 +0000
Date: Tue, 27 May 2025 17:37:38 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: Oleg Nesterov <oleg@redhat.com>, mhiramat@kernel.org, peterz@infradead.org,
        akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
        jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, pulehui@huawei.com
Subject: Re: [RFC PATCH v2 1/2] mm/mremap: Fix uprobe anon page be
 overwritten when expanding vma during mremap
Message-ID: <3f0f86a3-6ac4-47b5-8626-162b117dce0f@lucifer.local>
References: <20250527132351.2050820-1-pulehui@huaweicloud.com>
 <20250527132351.2050820-2-pulehui@huaweicloud.com>
 <20250527142314.GA8333@redhat.com>
 <fcb3b061-ca4b-44d7-a9fc-ecd0713c3fda@huaweicloud.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fcb3b061-ca4b-44d7-a9fc-ecd0713c3fda@huaweicloud.com>
X-ClientProxiedBy: LO2P265CA0029.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH3PR10MB7233:EE_
X-MS-Office365-Filtering-Correlation-Id: e03b68e7-a59a-4af9-5bef-08dd9d3cccbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HZq5wLj2eldVyE/Yg+jlDLUewkpvx9g+Ek/SWNITi0hnBBSIkSfWsizJy2uD?=
 =?us-ascii?Q?5uCcWRFIavZuWLkng54ENXSUMJ7Ztv6w59QZqW/GHhL7xGMY9hNgQNhyF60c?=
 =?us-ascii?Q?+IQBwJU2tHYMJUNpwShDY02eVaOWx4tZ7SoILTsj/xqqT5KoIUt4dhgKbjxp?=
 =?us-ascii?Q?+yvEHO5XuC8idEgvUlPTIGYDnf/sVyYb7Z8rrTWoEdv3SpF3f69pwvz4yYO7?=
 =?us-ascii?Q?rkNHoHkGsLsPZ0W+AqE9RqeC8GgwevmDRfhdL3ABN+MaJCY3ywEdsryE+vgS?=
 =?us-ascii?Q?/T3J/GZzQ1b/rHWSkreZsEVY7HtPrcU5zD7Fiyy3FJi9UuvXMz+RZ3RKNng3?=
 =?us-ascii?Q?VtLiHgeym7xbqu+/lacejDn1zo+oxB86V+T0uVbTBhekO9AvoxQUvjGotSci?=
 =?us-ascii?Q?QyZyJ5W4VsGtQni9DS1Wd/SsRBF5gqBCDrDK5Zq3u3NRToaIPL2k4mUMB6wW?=
 =?us-ascii?Q?U/uTx3my0jK+ryRbQ4wdQcBQ6eu7ifCKjX3ZBC9iQ4+1C+AU6mKtZlAGA8C3?=
 =?us-ascii?Q?QToxSkosz8Z9rnxHd4uNS1w94L/TekkmwpodmBFZMIVpOQcbVl+jeF2TJoz7?=
 =?us-ascii?Q?wtwcZAic0LGiSznvvhOn/hDOHd129AbMn6MB6V4u2Fp4I74Tv2f5I2ATbiRc?=
 =?us-ascii?Q?sBI0cxG1nrniTWGjTUGH1TFwXnrulfhz+kzD1DITcVPrQqSZw++P3CAh13AG?=
 =?us-ascii?Q?7mwIATBHpuV5H+Ttasx4qgRF85yIVTmNA4b7mzpyYcLaE9u6FwgzbYdqtXie?=
 =?us-ascii?Q?BkF2BKyNcRyJ2J/A/foGGXpO3XNNAhNZO1cBt6GEuf4q0wTfy4Jdtmu/yjk3?=
 =?us-ascii?Q?AjXiY8UgReG6T42uE9eWlTS54PIsROqhhe5mJDblhgYd/5o1Llz4B3Ni7bKl?=
 =?us-ascii?Q?G/LSxkohmVB6ZRCA3NuKbGhPZ3/rOVCbwEwXFbl/9pFUB2xOV2i/Y/qMbhPe?=
 =?us-ascii?Q?7Gx4b73OYZNe5txYn9jFyYOf3UAgiwMmc/K4UuQC1PvfvLuwHucDp674MxD3?=
 =?us-ascii?Q?Xs0PQ7PH6md7Nbm13qmUzEKjdRbDl9f0ATjwr3s1hkse7imawCuSNE89vknO?=
 =?us-ascii?Q?+PGy2JBc8SWgHDxFeO74VbejzqvP9sZ14C+bI3XXRR3NYwpAfphY4L4tQ5Mp?=
 =?us-ascii?Q?f5nq0BmXAegCsosRJnHOKLqEzPgOKa1NJUiUpzC79l3WD6FMctFcZhHzmbZZ?=
 =?us-ascii?Q?3pX2Nd6GKYXTY13cGJVUK8Z2Xd5eMkgFw1st+7EHdmq0AeAryJihqinjDoh3?=
 =?us-ascii?Q?sMt4TdzO/oS/1wdIXSZi5zzmQXrVdu14qacLy0dTHoRMs+tWwkQJVXaI9YGM?=
 =?us-ascii?Q?gt8YwOwU1+3x9SBCJ8+gWS1TE5kphbfTaQRz7grTgyeR6LNOQQMDPpKE5Lv+?=
 =?us-ascii?Q?PskcuFxkSTByxw5Bmi01R8bgxpR+7o2sPnCs8c9zKodyagHBSD70dqYWi5uo?=
 =?us-ascii?Q?Ai6vZzQ4i/M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4hTyP2tMbbNs17Py1WtoOYhPyd1fFBNHDPewZiIHXNBKm3KcgxBIF9EY4dH9?=
 =?us-ascii?Q?mpIsYFmJTiG/Eq6MpvLF5s13lyfrdXSNuTCWmsdWC2gnggMNOcctIcIY9t+A?=
 =?us-ascii?Q?5yq4erv29yuLEwLsRyjRPjcbeqSVsultejtyX/ysmnczy3taEEHvJBFsUg95?=
 =?us-ascii?Q?nTuXI5GoYoYpkTojSP1JbvqLGSi7p79T0qXdWZns8R2uIaSCf74+tiKjTG+4?=
 =?us-ascii?Q?mXPwOAovtyVsTmrxx2TNnb8llgJdcgNbvSaMLM4J73XKHSo3F+CSx/xX44t5?=
 =?us-ascii?Q?vUg78yo60byzstCB6OztWP8UzXO3vXEaU/H3lDUYGaRtG+tQ227eHDEn11f5?=
 =?us-ascii?Q?KHoGdBLVWLjWxbW4wW8ZTd3/elhm4N4E+p3FIeSoXklgESB4vp4Bu2mrHV4g?=
 =?us-ascii?Q?e0sAvoqp4GD5eSBoIFrTveAew77m3TWTvymRqriJhvYZIpAC9aViEH01FGCs?=
 =?us-ascii?Q?m+74I5TBPXjLPIbyAQgxUuPgWqTrhqejgwQN/Cm5bvETft9Cxhgcy1QNBO3U?=
 =?us-ascii?Q?3ICKFIdPzyVFOOIMHqWfSz3j/bGOfDD7tV2mPzCepkG8gizDm7nj4dv1N/Hn?=
 =?us-ascii?Q?p7W9vKgH4fNWP7qmsygdtZHGFwcyn3elPlAqJiDjfdUP2IZEacF1+xhgaR2v?=
 =?us-ascii?Q?G5Tx8+5QjxASUDaEkjhatnPuZff6fwVZig3oo1FmIPRTU5McFPrBp7m/PwHU?=
 =?us-ascii?Q?b436r9EWfpwMEsrwPHRMngGxnIEdwfpMBkpk5DJgF988GBa7+Nm7D8Jt+M2Y?=
 =?us-ascii?Q?8jMna3rmhkws2sxgZ9OCFAbZ6kmDIdzzQREtzKhrGDvIlhf1eYqkOikg7hef?=
 =?us-ascii?Q?XmvNn6HIrGe9HNQBwWtvuraZbn678dElI7uSc2Cu5Y/lXSn8JoJR7vaGLFNG?=
 =?us-ascii?Q?PQ+Sc+j9q9G17ad+nnJN/LcXRROWIOxipUY4oayTLnectH/TRlfRIShfonT6?=
 =?us-ascii?Q?ArX1XHfMz9kA0SECo3abmN3mg6ckuT+OlZckQ6lqfgsw8fvziwrI3XyQ33Iz?=
 =?us-ascii?Q?gbXb7XFPnfQObOcTwnR3yqL/je24rVUgv4QAbQ1ZzDO0rplQ+DRC7LWrSRJL?=
 =?us-ascii?Q?71CNFFouLT9utTMpPTY0oLPflNJMwfTaFC2zYTMDemXkQ8ePDncF63a4794u?=
 =?us-ascii?Q?OckiXvsU2r217anyWhX4/E7+9y982YVjqpWXx1czdlUFUC/rPMMb0TnPfNZ6?=
 =?us-ascii?Q?b/GIWsrMTyf30miVd07XVjrc1y/992vJg9caWnmnTj7VDmGLEkqejIiTgnND?=
 =?us-ascii?Q?J5dmokFSFaXe0UThgpZnjkJl70Ro7loDqeHVMLcK9CKZB4HPtj5r/P9Itihi?=
 =?us-ascii?Q?ZVj7Kh5BJ+c4R4jx7zlqqhZDjiWHmtEyAh8dEDbaUjd020ua1vOqaTs5/E2l?=
 =?us-ascii?Q?mYpP1hdXQYZ2Hltm/CQFimhcSEF2rWkd3ojawT7aZ6/3s93O31Ts0PkLEQoS?=
 =?us-ascii?Q?0aDtoOmn/2ipmTY6vPWHvM0ikpyLIDKQZ5HIAeQhUEk6TrzIq/nuQoMOrzFT?=
 =?us-ascii?Q?rjpDAREYByYJuHEw8Dj6pRo2ipQune9S7rAS863GPIhkdjv528pMj4EGd6bK?=
 =?us-ascii?Q?AegnmacuwpaiIs6GB8m5kzcZwgcT13CRHUv9vMd7/kwKkJujKU/1y6uAHclg?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lUpmJEWznqYcnSMf7+zy36FHa1F9RfabSvNYSIBZBEib6gqU8753UT3l/BUut/eXqsgUeMVw3wltaA6xjEUMyBRolZbZxJiUZZtuAdQQiH66Y9yTHx+MUQ0hJlQoGvRinsXFStCzri5j4psMT15noeI7l2nE+OaXNm/2gblrHPipbPJawZ2gEi9I+gDZWowoz/ANnKveizQCuy65lu/GA5wEuMYFd7FCCcKJg6QNBCQou6SgNaughxU+F5FIEJs9mG4jc7bB2aYoVZwCVaNUJ7sMYB8e0MOtKFd9TiKwKUclGuJL32X8+AXAp9DxxMuzefsjoMbtW8mysNZipS06ii+1J4fOygDjNEYe2/6bjUcGGjXH0RXqqJ/ctzL8DobpVHOD0c2+baUHo4DmnKRDDjZMv6dYKk0CFE99DEcfOUsuEG2zmN0ayOgbTLSpsRS6R3kCH6w23OYL1lkshb7eo8moSVSBhXPh8QHXC/SckMd+tCooUqfV0pxkVTbvnvtJcrbywqL6OoiqJp5Qo4oME99/P4C4jxecXhuuG08vdjJyBxwG0X660QkqI40vtGWCNjkC15HHh8gMKyhxcukdDeKOv2D4Fn4NaJSzyAUCKM0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e03b68e7-a59a-4af9-5bef-08dd9d3cccbb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 16:37:41.7987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /TvFC+vmHtVp1PK29hAV4CLB8Kc5UU+85A4W7ACyxbESHTFmhmRB/P9++aIsm8n1z1Ww01eQwdNyWWPyWhGMaNP45XL8zsMIkgh1QCwAwWs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7233
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505270136
X-Proofpoint-GUID: htfPxK_NiFvbid77bC-3Hu3ZVgLSpzWx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDEzNiBTYWx0ZWRfX+r7EgzsnzgyI 8081jbJj3GU903HDG6fmUzZvTmE2pQDeDIqlrcjq3KwUJ+Akwe6wm7izY/MnJcefMr0blOKMufW /ZrYcNTVM/nFHuNObpfO8lu5BF46Lj/z4U90tQHurQA25VUm60amqc1erDTBp3R6OxmOhacyldU
 6HuxZR/QGEXshleI4ucLAHJnMciI757b7GtYP70RX1uY3eig01G/A2hl3rdPgUfPRmaG8P6RIOJ p6MKfPhTv6hDqctNfKK95aTucZ7ZcSjRmDyzXqlPX78eyZ2eepdTbTUq+a2SePq3qwURw6AGfdY EuOAd35BJ2+c3mzytWCuiRLZcPnK5rXI5+AqQ6GGXd5yD3KMNyknqP/jj4cmMGeNhUcxjJNlfZ8
 s1uNvvVqjRG6ueoOtJ6lFaMWxRGRWrMsknDuFj4vQ0fDQhTgCU2+qtpYW8LZSB2JbSEJqn8t
X-Authority-Analysis: v=2.4 cv=VskjA/2n c=1 sm=1 tr=0 ts=6835ea5b cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=2PJgpZjQCL0nLYgDOrsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: htfPxK_NiFvbid77bC-3Hu3ZVgLSpzWx

On Wed, May 28, 2025 at 12:32:57AM +0800, Pu Lehui wrote:
>
> On 2025/5/27 22:23, Oleg Nesterov wrote:
> > Well, I leave this to you / Lorenzo / David, but...
> >
> > On 05/27, Pu Lehui wrote:
> > >
> > > Fixes: 78a320542e6c ("uprobes: Change valid_vma() to demand VM_MAYEXEC rather than VM_EXEC")
> >
> > I don't think that commit could cause this problem.
>
> Hi Oleg,
>
> Me too! I was test that before and after commit 78a320542e6c, so call it the
> `directly related commit`. In fact, I think the issue was introduced in the
> original commit 2b1444983508 ("uprobes, mm, x86: Add the ability to install
> and remove uprobes breakpoints") # v3.5-rc1.

Yeah I missed this! I concure that the cited fixes commit is probably not it :P

Your repro is delightfully consistent so could you bisect to be sure?

BTW did you just say v3.5... Good Lord :)

>
> >
> > Oleg.
>
