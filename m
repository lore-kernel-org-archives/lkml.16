Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D737264608
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 09:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749979646; cv=fail; b=Mppc8lE5GOy81XcFaGcPu81DSytMdUsZnQRiCKHu1drlekXlffSz+5WwR+nZ2uBoaBl8/LMUib4NKT1O7U+52r1diqcDkoc83bhDGtt7e3w25NTiKS0vGSiIdOZP0hRFzJ/9Tz55K8UvnQm7j765U4tiOWQ9VYgvXovERlCbnoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749979646; c=relaxed/simple;
	bh=MKsVgCX1zKq7R4r8uFqAJdMAXQypwocY62zofUblDNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tNN9KRVBr5E2w5YHlFCeaKru0FmC4zLj4AmVJSuN4+NuOG7u6l63PbT61iJY3F/G/E2zzhC/DAqBa4/3UKXauEzs2JnVb3IUvOcrjJ9zv6phhEVXtvhRLUh/5EYysJesFWcoHNmKqpycxO8HOxwP/xlyZn+zS0vGRXxOwMEGscM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=o/ijC4ck; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dOjUIaOl; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="o/ijC4ck";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dOjUIaOl"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55F5o4RO026673;
	Sun, 15 Jun 2025 09:27:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=JaFjC48gQ6WRbvZT1d
	/PlMI8Ty6NK1GaGpy5IJVGd2Q=; b=o/ijC4ckqacObft+2k/SYpKVGwhYXBinY6
	WdwJX0ehQuqrlFesDr0U/zUPjZe6/PXohP9A9mGUsdAxYix1OqD+3DJD2NNkeZEa
	/D3dy9quV9/IRyFG1OAzhqSf0PFfDGiDxRHE2NnEeIpgTGSnlePZKjYhu6jhHL/Z
	hP0g3ax05vJqqMRCbjLmZ+Zto3qv4FonTsPBf2eWWikUbuxK0Xf1rjM3fYVBPAe4
	JMRgIL5x1GpzwD2NipG69zxEm5GZUl1oxBzvG5VIS00Rt2f8bo0nzQAH63aHa2E4
	d6nmRNcauG9zgv76Ktxk3M8b30GIXhlRuLpWgKC7LUi89ICAVrSA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4791mxh0fj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 15 Jun 2025 09:27:01 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55F65IF9034412;
	Sun, 15 Jun 2025 09:27:01 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yh6quu6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 15 Jun 2025 09:27:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T3nX3CmMWvMzkpvuE9lG/LcOUjbA7zcoy6schwzWgEIQRqSoJdGdddo/SYQRmrjOAQmkge5VtlbBYgadmgXcURR/niCOfRsDwyVfxedz61Tx4mJkNQ2tLQvznFNre5mG8eyt+wxI18eeWVe1iPnnO80pvAVu+vk+NDf74spyQfMxlJUDbEu0kv+Y1FhaG7zbdjOz6ttvweMPw4V4qbSVKXEYx/wvaOdCRLGoplXs0yMUEmQ7zi7VfYvXXRHwvctNwa0R5nar6e5Hgq820Jw6fH3pHWC1knLdn0AY7uwyhGLwN01Uz9dagT9CaM2/UNQz+ar0pnzzfAxateopoIFRZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JaFjC48gQ6WRbvZT1d/PlMI8Ty6NK1GaGpy5IJVGd2Q=;
 b=jLUG5eX4rTJP/aQGG0gwCHFvJbaE8Mg0agl6NMwD8kVObqThk1aD5+6CVdPwA3mkuxv9CUvDGu3nZNNdYoiJhbpTNGlPk8h9b4CO2dVSA5hGfexT3peK4svv90kyAWGIB4Trr8FNDh1KCfbcJ3qaDoVewsURnfRV2tmPYXPo2xASv4QhJFbvyn0qfdpuwPMmy9GgnKvds86cAqVmYeqxJYjMZK/oHQiSNOjXURVosdOg062LBWtMVy3W1i+hlSgAfAapnOQFg7+jgZNETyeUa6PK2QdnfhY/aDokd6Tn7ffVgonDOw/0vXW8LRO2MK+jnQNo/Eu4TV553veDt/Jwlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JaFjC48gQ6WRbvZT1d/PlMI8Ty6NK1GaGpy5IJVGd2Q=;
 b=dOjUIaOlEjirj8nWzV68i+4rnuFb4np6gGZ8+iDvMlvO+gQBAzEoDk36TSFBb7IxQBzpun/22eM3FDpgjyJylwCwzPakg1ZtRcjeVbbM5unc00uF6X6Sealhovs/pXnqo6hSG/GSoGECAflgMgw42jRgHFEKXR/ayB1GzpTq1oQ=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH0PR10MB4875.namprd10.prod.outlook.com (2603:10b6:610:de::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Sun, 15 Jun
 2025 09:26:58 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Sun, 15 Jun 2025
 09:26:58 +0000
Date: Sun, 15 Jun 2025 10:26:53 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: syzbot <syzbot+b9b432686bcbcac1ca01@syzkaller.appspotmail.com>
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org, jannh@google.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, pfalcato@suse.de,
        phillip@squashfs.org.uk, squashfs-devel@lists.sourceforge.net,
        syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Subject: Re: [syzbot] [mm?] [squashfs?] WARNING in vma_merge_existing_range
 (2)
Message-ID: <717ce5ea-1e76-4ef7-bdbd-71f1e0d047c6@lucifer.local>
References: <684e5678.a00a0220.279073.0028.GAE@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <684e5678.a00a0220.279073.0028.GAE@google.com>
X-ClientProxiedBy: LO4P123CA0071.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::22) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH0PR10MB4875:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ba9fd85-685d-49cf-929a-08ddabeec6c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pbhEnqCafD3trFrPMUIzWAifkNg08JyUtHfEQ2T/Uej4X/5N7odRGbi70Ke6?=
 =?us-ascii?Q?U6Py1RLYjpkD8/0wBWOAIW7SMrt5tSsuDJINP3pxTAdLHTBO0boynWm98HAV?=
 =?us-ascii?Q?Xo8SKk1CnXaOttbAGA0SCAzAFPuIBzbQCko1HymKDq5bj8FYX2ROlOjc93Up?=
 =?us-ascii?Q?GUBMUCiEZr0bxq1PuUucE//dAT72J95LlhgaYWk2Sr8CvF3oWDNThWlHl6aJ?=
 =?us-ascii?Q?QFmyRQ34yS5Wr72GzMZ/nuCstgS9oEH0oZg0SepadszY3Q1WZ2A8gkbOMUBK?=
 =?us-ascii?Q?b/+2dDmw4oTdfuZFOLopfdcGgCeEHZdEI+ZfPqrXyt1b/gVePFNhsUYTm80R?=
 =?us-ascii?Q?9QC27OUk6ZCHNaANEOeVgg/NQthmqw5GDMMCoZVz2YGptXVLDHnfUkoPmMq4?=
 =?us-ascii?Q?JVD1mfeyeRhKsqhwqQyiueJSkWjISeS4IJlzr3DH6hKNsWSQic+6POKi9bqs?=
 =?us-ascii?Q?HMo9dQv+aq68YwjbfFMJhvlqCAWw9bo4snIn9wb/8mM+yaW2cILYLZUtL15n?=
 =?us-ascii?Q?MkWTLlDmkc7z4WXWnc4xLiR9bvmxMINz99RLGj55+ghqt6dTVGKgyA51mav1?=
 =?us-ascii?Q?DdK+MDZOXMfREDceWKdJRDx99Tqh8ewXMvzPys+uqbIElsMwMvIiTkWlsisT?=
 =?us-ascii?Q?nQwYSrX1FERfE3NY6iQi7yb0JVq9k40EtUe8phaxBsC+8IkYkSKc29DM5vZx?=
 =?us-ascii?Q?sgX9UvaryMOfwOFVO7/si+66b/MdacvdZoiQjpecUPtdl6yAYWccPRLBA1sI?=
 =?us-ascii?Q?LzTtZMcBXM6SWTwjgT4GU+tsxPwAkaXc0fJQQIGUy5cl6yYOhC5U4hjl3g+E?=
 =?us-ascii?Q?kuBqonUpspRfHJ/+Iu1HRK2U01Ai53VVpSIDljNe8YAZRNqTdtFkFUnVpKDQ?=
 =?us-ascii?Q?5fU4uf3kCSR5X+bHII5fn5UzRUknOiSTEiKnqULbeYHjBZoMPtS0eJseRSmm?=
 =?us-ascii?Q?x+rJYV1SMzgyrBL0O9OaDASVOVzPIPnBT/9CMUmAYMmitmf0yqWzN0ZrhuDw?=
 =?us-ascii?Q?WBNxlsYbPBBFGFRn5WLkiEsdArLEdJuts+RFSVGlYFkN1uKgwssejK6epGgn?=
 =?us-ascii?Q?SvThaQMCpT8q/2IxEaOO60lHyK6Ol72mJTQFZXh9a+31slWswEueYROZHi6F?=
 =?us-ascii?Q?3n22Zeojs2xPPRutdckO67fjvisAEMcl+4WxoZtO7B7uaJ4PCJJA+pD69soU?=
 =?us-ascii?Q?OqAokO/7T2DSqogG6/cBb9O/cfTDh1zFXlIKf5m4PtbpFTZOJV37LqUmZSjS?=
 =?us-ascii?Q?k4A+0geSE1k6nDjwskMZro5LlBwFhG0lSbhjR2kkMtpbgTYI07A0zWfyCndE?=
 =?us-ascii?Q?oe+Z6aL+FALTQobe9hlRsnrKU8XuTioaGbMkFaRqYXKiTRzhvmvZfqhqso3b?=
 =?us-ascii?Q?/swZkSlBmiKE2wRwb+Xc6RPYQJs+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u5MlNXfJBbSvncSEuYIECQdgYNDrmh5B8ssOy5aITd+Ak2jtoInDlcRV93Qy?=
 =?us-ascii?Q?GOl0NyQWMRAEPADgxvRdhJz8cgsYkRJupX0YjxDk78Tfny72gm0DsG7fdiPk?=
 =?us-ascii?Q?p2O/p93PfncOenU7Jlp04JPpVtyPBZJedtO77HR15TBLK+qfbk5u+pLgLvKs?=
 =?us-ascii?Q?z9inPmg5Ya897gydqiZQyDph+TVf1lhVo1IEOlufjyMK+mhCT+/wxqDUMthr?=
 =?us-ascii?Q?wss4Dhp5XZyd5sC2tCpckhMj/b88GyORArE8tV2Cmh1u51U7UDySPs8uMGvP?=
 =?us-ascii?Q?DK3PmRvnubJwa8jbrvY4IRfJ+U/Uoai70ACf8Dxl+uKKcX8puVI/6B5hC8jT?=
 =?us-ascii?Q?z1LwDNtGPQCZF06cG2VxvawUSFeJ16XcqU9/EgKcZwom8ILYAbHcbaz0Q4P/?=
 =?us-ascii?Q?AD9zQ2XvQSkDLnF/A2gz3QfB3dP3JO+qPQf8Clo/OIC47tiHWiLheWbi3y8k?=
 =?us-ascii?Q?HhaL4SZ7+ys+pboNQ72xYOHTv1ehsiOQ1DVM5exIaqwtEz4qeDJkuhYOLWtN?=
 =?us-ascii?Q?oFt+yXTF6HfMKHWx0bPcztL8Nf627LcrlUKZjC/Bb+UoqMTesbZAXV6dGHY2?=
 =?us-ascii?Q?44+sFMqocT39J00e/+l3o13shrPaYKt3V2htbV4eyNWCJzo9YAYKKQOQQZAz?=
 =?us-ascii?Q?Cam+hEbBSDGQaItReE38nofmA2W1WOr38GkhSXPi4ckGKf67+dxJoVjvzwad?=
 =?us-ascii?Q?BOxbywB9/7aWF3247MUoWI21N7gEUKx5Y3EYvBRd7z+3yp1DvpXEVD7pkrHX?=
 =?us-ascii?Q?oZ14DJK72TntjdKR3sHobemRFA1hsDu8tsZmUzF0xkaK0ZR0u5jmaUwbSTwl?=
 =?us-ascii?Q?Bc2siczNQ9/bvnIzoeTApHHhhymdb6XxyHqmjPEhs6eF0fWpgwN1JKdPtBS4?=
 =?us-ascii?Q?eerUACGpeI9i0sG9PGWHP7eYy1+gN0H94VxmDHRjBJW0+gkZAx9SqYFUHLNV?=
 =?us-ascii?Q?Y8egarGIG3igh9dwm1YIwYE16TQaAOwRpmVkF8BRM1EBFjU70kPBqwtIw4LM?=
 =?us-ascii?Q?4Hjxg4jSzzhGYQ2q+uKTfN40/twg3Bvnp3852dt/I7MTO5B5EuIXTNXv4tbN?=
 =?us-ascii?Q?yP+rIeRILOm8zvI+RMji7BiU4oPEWWdz15Ez7swdD1FJpIupwyYHjBjZHRGb?=
 =?us-ascii?Q?haN2oQ7ApwtQ6C2mS18WUyOnZoX0/boNkJANNQkK7TRxiySn3VwR7qQYMSWO?=
 =?us-ascii?Q?Wnl/JYf523eV2TRE5/CVh514jZImkX9dXpEbRWBJFXEaq9+PcUVBquKFu9Wn?=
 =?us-ascii?Q?H/UOqQW4UjBxtTe0/9PhiUm/ocoiz7nk7NX0bS2MhVJbPrbR8+iaRpdpPR/D?=
 =?us-ascii?Q?oL9OBmVWp5zOmjwvDIhfP0uSArnyNfyZiabCOaKzXEqAfN2S0AEt3Tp0cAaz?=
 =?us-ascii?Q?GmPB01MA9mEW4/t4Y7fmevX7Cn0Y1VXakw6zPgft8+GeYTb4WJbbJR42HZjb?=
 =?us-ascii?Q?/VH02s6St9hDtnwmpxgvELB0tkNAQy9CG4H5fTk8hqMjxEHid9JzJUpYCeT7?=
 =?us-ascii?Q?qFtkd90K6DTZOS6NxKVxgd2XjkWfwoW+4vrddaZWB89msK+dPN0pbnFvnXsZ?=
 =?us-ascii?Q?a7+JXSQ7DFwW5djHOwn9M8dcgEdAIZe9vRK13A0h7u9UlwkatQVoAXu3KZos?=
 =?us-ascii?Q?aA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mE6sCzxOHg51lhcj0pG0xsVfv7UhTHB/rQOvjMBkwRoCNcS/FOVu07k24Ttj6pdDXrgywqzA5PgIC6DyrJAup3e+mBucSVIfgg46NKdbpa2lqP5CUkhbAo+P73AulRyn39cnWScI/YWO1D5gPP7V0t92NABW0VSFlRYPqIqHmYkLCefxj14rXU8TM6W3N/SPBxMELA/l5PXUAkKFJIzzKof6YOO3HXdHjZ1uKyWoJ5jR+W790te1/sDVQXmt84q+e0yBZAsvyhvzL614SV2NOhoEARQm7nkkBiwuHMeOr2Jr1bGOz+vuovq4mlnhRV+j2+hTKgC9EGlppBvEVLfgKcvoBI9QKCF0uxLEG8vdStS0/8kS2okOIbsD3yu9RsOhtot62HrW+InIBvWuOCv/MM66ElMuBuANCpf6bw4PWxOJZ/dMzC8s9Q1dA9e8szZgubKyLeWoMNwMw3S5SNL93MNbUnPG7WjoVSiNYdq3zknkshWwFaeucgSCHfGZJLewK1Y2szA5n7QUzyAt4slYQKDwq26WhQb7sLjP+jCWx0ds6YL8QkBy38+hYcMvaXqGUXHgz1rEqUi5xSGvi0qWnZLKLQ2mLw+eD90JIkDFkZ8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ba9fd85-685d-49cf-929a-08ddabeec6c5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2025 09:26:58.3037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vG3qrCChtw9nz2pDbRRaeHkZc6lA6xhgqq6XJ0o14nKAiXggfMAyt9Xanc8Eor0gVukot5/CQLps5n0iqzrRkW90KpyPa36jLIdr2sZQYFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4875
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-15_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506150069
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE1MDA2OSBTYWx0ZWRfXzTovMllqucF+ zuaYOJWbSHcqcJ/cnRypG+nrt4MpL0HMpcBmlMz7GuQq+PdOlmCOzYmFx3yWY0hrv3Knlv4d6hE x1FzQvlkCfgS5feaCUrCc5ADf3H0nIhu5/97BS7vwjdaY4oxILpyT2akx34GCIu3Z22bP7rBhEv
 NXILq0cSztgFunLyFT1RcsW5xad9lqtEv30oXcSUHDi/4Xpg0DJ+/DuVgo0xasLeCYueBIUfjjq IiOzAURRk5th/NU8kYY0twtp6hi+mdl2tbj1Z+n5unhriMYybALy1dFOsa+lJHt1ceBi7h423hz eh2a3xU3YyMb9fknRcW5Min0eeU0riKg3uRwpCq4UkdBb1RuZuw9TjxAWWsdL+1pCt3la5ts3GL
 x9AqTAou0TxPW2YcdT/+b2CjYFjRFHMnBgXBkyAJfGeiPpBVBUdyZgVaOH7j9vK9Bbtz0bgT
X-Authority-Analysis: v=2.4 cv=HvR2G1TS c=1 sm=1 tr=0 ts=684e91e5 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=edf1wS77AAAA:8 a=3g80flMcAAAA:8 a=oHvirCaBAAAA:8 a=hSkVLCK3AAAA:8 a=4RBUngkUAAAA:8 a=hV4Ep2LPRT3QvdDvGskA:9
 a=BhMdqm2Wqc4Q2JL7t0yJfBCtM/Y=:19 a=CjuIK1q_8ugA:10 a=vVHabExCe68A:10 a=slFVYn995OdndYK6izCD:22 a=DcSpbTIhAlouE1Uv7lRv:22 a=3urWGuTZa-U-TZ_dHwj2:22 a=cQPPKAXgyycSBL8etih5:22 a=_sbA2Q-Kp09kWB8D3iXc:22
X-Proofpoint-GUID: g6TMK38HI-jVTIQAQXzA7aIEUWTMp70g
X-Proofpoint-ORIG-GUID: g6TMK38HI-jVTIQAQXzA7aIEUWTMp70g

#syz dup: [syzbot] [mm?] WARNING in vma_modify

Hi this is a duplicate of
https://lore.kernel.org/linux-mm/6842cc67.a00a0220.29ac89.003b.GAE@google.com/

See the analysis for this at
https://lore.kernel.org/linux-mm/e6e71e0b-347b-4edb-b558-b502f55a637d@lucifer.local/

This is addressed in commit 0cf4b1687a18 ("mm/vma: reset VMA iterator on
commit_merge() OOM failure") which was merged to mainline yesterday.

The repro reliably reproduces without this patch, and with it does not trigger.

The issue is not one that is likely (if _ever_) going to happen in practice as
it relies upon a 'too small to fail' allocation failure and can only be achieved
through fault injection.

Thanks, Lorenzo

On Sat, Jun 14, 2025 at 10:13:28PM -0700, syzbot wrote:
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    d7fa1af5b33e Merge branch 'for-next/core' into for-kernelci
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
> console output: https://syzkaller.appspot.com/x/log.txt?x=107b19d4580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=89c13de706fbf07a
> dashboard link: https://syzkaller.appspot.com/bug?extid=b9b432686bcbcac1ca01
> compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
> userspace arch: arm64
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1424b60c580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=147b19d4580000
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/da97ad659b2c/disk-d7fa1af5.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/659e123552a8/vmlinux-d7fa1af5.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/6ec5dbf4643e/Image-d7fa1af5.gz.xz
> mounted in repro: https://storage.googleapis.com/syzbot-assets/3df2a90115c7/mount_0.gz
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+b9b432686bcbcac1ca01@syzkaller.appspotmail.com
>
>     ffff93069000-ffffd1a12fff: 0000000000000000
>     ffffd1a13000-ffffd1a33fff: ffff0000ca00b640
>     ffffd1a34000-ffffffffffffffff: 0000000000000000
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 6489 at mm/vma.c:768 vma_merge_existing_range+0x14a8/0x1964 mm/vma.c:768
> Modules linked in:
> CPU: 0 UID: 0 PID: 6489 Comm: syz-executor371 Not tainted 6.15.0-rc7-syzkaller-gd7fa1af5b33e #0 PREEMPT
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
> pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : vma_merge_existing_range+0x14a8/0x1964 mm/vma.c:768
> lr : vma_merge_existing_range+0x14a8/0x1964 mm/vma.c:768
> sp : ffff8000a0d67910
> x29: ffff8000a0d67990 x28: dfff800000000000 x27: 0000000000000001
> x26: 0000000020000000 x25: ffff8000a0d67a80 x24: 0000000020000000
> x23: 1ffff000141acf50 x22: ffff0000c712ca00 x21: 0000000020800000
> x20: ffff0000c712ca00 x19: ffff8000a0d67a60 x18: 00000000ffffffff
> x17: 0000000000000000 x16: ffff80008adbe9e4 x15: 0000000000000001
> x14: 1fffe0003386aae2 x13: 0000000000000000 x12: 0000000000000000
> x11: ffff60003386aae3 x10: 0000000000ff0100 x9 : 0000000000000000
> x8 : ffff0000ca6a9e80 x7 : 0000000000000001 x6 : 0000000000000001
> x5 : ffff8000a0d66ef8 x4 : ffff80008f415ba0 x3 : ffff8000807b4b68
> x2 : 0000000000000001 x1 : ffffffffffffffff x0 : ffffffffffffffff
> Call trace:
>  vma_merge_existing_range+0x14a8/0x1964 mm/vma.c:768 (P)
>  vma_modify+0x7c/0x424 mm/vma.c:1564
>  vma_modify_flags+0x18c/0x1dc mm/vma.c:1605
>  mlock_fixup+0x18c/0x2c4 mm/mlock.c:483
>  apply_mlockall_flags+0x290/0x344 mm/mlock.c:736
>  __arm64_sys_munlockall+0x11c/0x238 mm/mlock.c:782
>  __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>  invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
>  el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
>  do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
>  el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
>  el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
>  el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> irq event stamp: 15466
> hardirqs last  enabled at (15465): [<ffff80008055041c>] __up_console_sem kernel/printk/printk.c:344 [inline]
> hardirqs last  enabled at (15465): [<ffff80008055041c>] __console_unlock+0x70/0xc4 kernel/printk/printk.c:2885
> hardirqs last disabled at (15466): [<ffff80008adb9eb8>] el1_dbg+0x24/0x80 arch/arm64/kernel/entry-common.c:511
> softirqs last  enabled at (14694): [<ffff8000803cf71c>] softirq_handle_end kernel/softirq.c:425 [inline]
> softirqs last  enabled at (14694): [<ffff8000803cf71c>] handle_softirqs+0xaf8/0xc88 kernel/softirq.c:607
> softirqs last disabled at (14683): [<ffff800080020efc>] __do_softirq+0x14/0x20 kernel/softirq.c:613
> ---[ end trace 0000000000000000 ]---
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup
