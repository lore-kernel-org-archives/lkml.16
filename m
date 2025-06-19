Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C328435963
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750337744; cv=fail; b=pteGonqYgWdnwTAoHHxKkGE+5O51p1HQlLGqWRvMaZhThJPBKzNNFvQBT45a3B9KlkTGMyJahepJHuyKPfks+ZTSO/y7EVXmSK2v1Oa0DqjRFc3+lSf77eEs+ak7wdvT2HMc5S5BYWltHpUr1Yy8wOEWt4+CsU2JIHo9BOgYI/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750337744; c=relaxed/simple;
	bh=v4G+MOf/wLb3xvP2HcW/D8pldthNrvYO7Xr+/x3gIz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pykcWuON7za2l4zu8P8FJlEPX/Rc2N5RQhrLuOtfeLZuiiEw8RuzrPBU+GMr4d5N2tHXaX3NkB6kPWR1FRqjaBu4JcI6xzYJ5cb8/JBF0u1Y0w2Gj69lkTd6WuojzqgXjcnOZs4YIILxDTa5CaejLYI3YyR7gY8Ln9UIe4cF2bk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YZPEueOj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lpKTs0IY; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YZPEueOj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lpKTs0IY"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J0fZkD021492;
	Thu, 19 Jun 2025 12:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=1I4j3MxrzBIlMuaIdC
	l9xzoPM+/Dv/syGqsM6YQVR2Y=; b=YZPEueOjzjsj+kuG/WeMXKOJgQgw0eUMFI
	jEdNvTi63JJdu9XdzOVAW+7JaKep7FpPGvZP/7PH6gF9EVRZxCE1tHYhzwQIzfyK
	gW7ATtO8HaVXcpDa+tYabJIAHu5xJEOYzWBh0IP1fjWfsuQJ5c70rD5K1iX5+HxK
	XAdGjCh9KPxQmRR5GyYk7GzuXLkmmH1FFFaF6xMnZAd98XIRMCerUOoGZTUqqWJ9
	CClxu++R9Rfanlk9PnUBKZAGQ1PbQWXkJR5kRxYMDNJqRP57wlr5/esltBB5f4gA
	Zc38e7cjc/g2K1gY+NEklznNByeceSM/s89bnlRbf6XcZdMR0ywA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47914esvje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 12:55:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JB1H8T021703;
	Thu, 19 Jun 2025 12:55:25 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yhbmsd5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 12:55:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d70Z/b65llZNJ9E1vaz9Nb1QB+ewsYm9f/W3N+zS+rWVH3QB4wAiZCN6gbMpF3egZHUEkAQZfIcx0DNPcLY/Nkf7Dv3msCnylc4nQCUPJgR2sKyWFm92H/njg9VhV0Wu7BET2Xw5ScsaHOfubprOteR+m29jnHK2b2vweKfYVQW1zpyRooQkttRyoDSswkuiluwpN5Wi4yzxqtmlOC6887e68JHLlzOdXdW9Zb801ehfmhHnfWzkIqlDghbHnN/JonC/S4bVYIccoybW9auiV40iestA+dqbkHh5vz1uN2eWAuwVGEE3mNXvIVU0D/zjPFJrYVhz5i7xe3GSJOWh/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1I4j3MxrzBIlMuaIdCl9xzoPM+/Dv/syGqsM6YQVR2Y=;
 b=Z+Sn2ZYIBra1RlwkmU40Mc86PNEPkyY9mleKNJg52mTdHesBsW9T7Ir6M0FFazziMj2hksVdCk5eO1yd/909uVApMcv2zfCcviyusKf9fTlccqsSnHJW34zQwtcjpqLJTyoH14TFr42RBRepvGqKZT44kQvapbji0uk553iCDfOA6Zef7eCz+E3UY++EY93++7L3GJdK9iJOeIR8/dsMpAS4t1BloUrRFX2U3YCNDYfia6zoIGGstloMeYM5NZXoeaGMXSW1kuVQEWwjRvuKaYYeEfVo5MU7m+ajcbOCiFJGsj5TvFcCTLm4oaw0pDFR6QGomZz6W5rYpmsahEWRVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1I4j3MxrzBIlMuaIdCl9xzoPM+/Dv/syGqsM6YQVR2Y=;
 b=lpKTs0IYDAjNZt0LfUYc0ukdPTvKS6Qhinwr2C+eodajN683QYhX2BxLdljHcVmI6CGswdY3AGYt5ZpwIuvoSXFBWCurh8cfjZwlCv/LyGfaH2L/gAEHx6U8fJcKKb8v8MVS7DqvGSOw+9lSX5KqAB2z6SIhoUtSaKaCWM8jltc=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by LV3PR10MB8036.namprd10.prod.outlook.com (2603:10b6:408:28c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Thu, 19 Jun
 2025 12:55:22 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 12:55:22 +0000
Date: Thu, 19 Jun 2025 13:55:20 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com,
        baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, baohua@kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] khugepaged: Optimize collapse_pte_mapped_thp() for large
 folios by PTE batching
Message-ID: <023a65d4-5f69-42fc-ab43-b73e44d6cd10@lucifer.local>
References: <20250618155608.18580-1-dev.jain@arm.com>
 <cd871535-f606-4f2b-8fb2-e3520a2b000f@lucifer.local>
 <164d06b5-1640-4b0e-bc60-cd886bc5a98a@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <164d06b5-1640-4b0e-bc60-cd886bc5a98a@arm.com>
X-ClientProxiedBy: LO4P123CA0679.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::12) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|LV3PR10MB8036:EE_
X-MS-Office365-Filtering-Correlation-Id: 78a5759d-1032-485c-2291-08ddaf308d95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t04n4yhMkxs21S9/RlJnhEBauZMfhJmRr82EvJuBdKQgI5Kg+WxXll1kRT7+?=
 =?us-ascii?Q?OCmOiC3RekaD+OI8RP0iUNKv5ay7CZ6Oap8sY0ZsY/Ouig5EyKeKFv2+uRS+?=
 =?us-ascii?Q?4iRV8UymJDq0oP3p30qSk3gYw8cVd9ZF7ECXJGgOyMYtvDppZ2dcSAdbx/ai?=
 =?us-ascii?Q?SpWMt7TMGCHOA/ifb7tAv7edJOgCOJWCLyOK4RgNTyTKoI9TS3I/xcm/I62q?=
 =?us-ascii?Q?T8ODKnYHjMgueD7hNWrTi3loh4+tuIVjqKfM+KA7osbcpk6nBBngciavaBlf?=
 =?us-ascii?Q?99PAhVTFs3ZKuNFATf+vQYP0orlyFwfyol5w+rGIas7JB5FBhDtbAdsk70M0?=
 =?us-ascii?Q?6V1+rH456D7SVsjYoP2IpKaOUheOYy+tWQzB8sQt2Of7qhDBSajQUUuMlcJE?=
 =?us-ascii?Q?xMmTe6G1hvHVC+DEieHLH694FF4UPSqc+CEJuJK7+Yd+O3lrxM5ezx/lDWv+?=
 =?us-ascii?Q?0YApncwqPJNpDMvTZy1erwHJ80dNsl26HkjTcOqSokb8XYy5w5kwlFCSv/gd?=
 =?us-ascii?Q?+LxKlUsEH1e12vfQr+gZZ7Zy6eO9E59EiodCx/F0nec24huOSS8YmOUkP1Cr?=
 =?us-ascii?Q?w0iL2Lp39pNyYFHmfLN1fG7D4eExFJJbtO+PkuVR36J4p8SI3J3+2Y8njBco?=
 =?us-ascii?Q?z7x/sLTbF4MZjLKBVsO53hAA1iq32RHBg20oh3yqWcxMLnKkSGzIca6uCyos?=
 =?us-ascii?Q?qLl/fkYUoDocr/bT0UQjQLkL6nLjx9Qm35enr6YPzuIMcYDDyj/Hjjwwqbtu?=
 =?us-ascii?Q?tasplnk272GtnctzU7kJ5BQsAR16+1VShknATXZyj0hhUFDCPW2EkTSq4lG+?=
 =?us-ascii?Q?FFCcNTOlmAI2NZHjaqKSRFP9zkeyXjziX3sRu2JwlziL05fKUKOTvFynx+7Y?=
 =?us-ascii?Q?TZyKTzpfnEDxh8Z4lAdbhQt8zJFxq55+AbvrH504p25+GR8xCUzifp4eA/nS?=
 =?us-ascii?Q?6jzM8Z9DQRF67rP9R2lVy9G0vKmZCS4R0W75+FOobLLbiYva08I8hylt2r1z?=
 =?us-ascii?Q?gbxzLhJCoqri4FhYAyI+f6CFv7c3+K6OqEiyqrB0CwSQTEU0cOyGLKWMHotq?=
 =?us-ascii?Q?qVrZcqWZqEn5Vrvht3C0J4Qh9kmHkzAGjHfeERFGDI7wx4OjO6lAZq6ttKKc?=
 =?us-ascii?Q?+dJc6LziLgwQNLrGuowcPtxnGfHHuAtXbi3suZQYVjhLvl6FGckReOvPSqcc?=
 =?us-ascii?Q?IkP4TX4/EIw9dWlPwm9AuWU+uELxZXIawoS1rKV5oMs9lGrxxVQ5vATbxEgo?=
 =?us-ascii?Q?ejWFqENh6bUMhAQqqXoSqdqPyGuXWlnHhnq6CgPJew5RAKO4c3tqfg8O8p4H?=
 =?us-ascii?Q?f+OAOI4bHikWzPPiIIDqMB3pHZQ9TyCQsV7GH3JbNlMu84L1yF6xH4wiT50q?=
 =?us-ascii?Q?8EF8s+15scv2Hb96bE0MaV8hdHvkjwlH0GD3MEXUEYJc3NTi9js3Ebffdqwm?=
 =?us-ascii?Q?xc2rfNcPcII=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EktNk4JkoIpLya1mjdX4FKGy34NoO2ZvwvtYxuavjE6mpGQwCvsJCg/9HJ+O?=
 =?us-ascii?Q?9mbI/pFeWMebkOPy3l+f2hzzeT3/+c5K84jcvXSS/s3QKUfAN/ASA53KM4YJ?=
 =?us-ascii?Q?9MuUXQ4XFcg2PC1pchDOkbEwju27CAYYYTsiptp1SdmtKWZIB+fCcwCecNsY?=
 =?us-ascii?Q?GUtAfcD7miX2BksiV5il/AQtiBcWT7CAGu0MuoDT2hCRj4vqWqXOMpyy93fk?=
 =?us-ascii?Q?wyzdIEnhwGBMpqpJqq4vBy4PTxu9VsvfnkHMUQKnHbMF2hQn3o6FrH6UfKoO?=
 =?us-ascii?Q?Um3VvavgyqIt+FuKC/6hDOf1XIU2IPGX5xXKuv9opDBnt/aYW0VTBnzpDeMq?=
 =?us-ascii?Q?jwNUxd07wHmrI/EZj8lis95TcNIfKu4lpXUDO6lzaq8UBlL9WmfHruJ9NqQ9?=
 =?us-ascii?Q?RNaLscKYbWcFm8RfjMDFsm7qXEoiKvvpcEQ454TuX2WeHUkZohCdtLuqQi/3?=
 =?us-ascii?Q?YMS2nKQMUQ8XA9jZx+mqMG5xO9KdF02FKgd5+xPpi4gRUqqBhu03Fwa/Npb3?=
 =?us-ascii?Q?v+equFRl5BYG8G0gTeggkwUxT9kfcG4b4eLjmb3U4SqCHF2bKTBuJnwTq4du?=
 =?us-ascii?Q?0OrKhrDGDtoHqsPFELYmAgX27yPiCvchWPADDk93oFFg2r2G5/HN3XspBZch?=
 =?us-ascii?Q?HYCGPrAR0ldwSgpAY8Zndi2+tXbJZBXcV675PUtn62io9lZmlzJWYdMr0vuE?=
 =?us-ascii?Q?AtCnrjsiAfOR6viEpMmrTOLL52ZG81RGafqpB5AQoO+ROYGB9e1CMNvonwlg?=
 =?us-ascii?Q?sbR6FhDB8ZJa7rQwXjDuEHQJko+J3qF5aUEoLe5ZXl/eMs6NCij99GuIAfGD?=
 =?us-ascii?Q?BcU93IK067hTvS8Eu7t3krAzFVSvOEa3vuHKGLCOd3jRMjNHfHo2EsS2QWC9?=
 =?us-ascii?Q?BzlDRBzIicT4zkY3CSXdWeSQK8U4dquAc25As3Yo/cAa1GkPbdyK8RK03Jpy?=
 =?us-ascii?Q?5l27IK/OVGQmtyXn2VC9W1ZB9vMdFctHgQGSk+ZOTihf3aBm1DJZ9tEtt0qx?=
 =?us-ascii?Q?AV69/WeYArvU2EWDab8uI7nEUg9uUZQQS1a0qKVphta9UuwAMpGQu7rohZ7l?=
 =?us-ascii?Q?6r9fjekcZsT37wFatDVTFWPA4exjaekxTvKMxZCtTo4day9TkS0hV2WeBQod?=
 =?us-ascii?Q?7fPUR7GN80/soRueIpaiHDrM2oyzf9VwfdNjO+exJq3k/GQUc4ftIxez9iM1?=
 =?us-ascii?Q?Km8spII1jyj5wrAR4oDzkd0BbcHBf9iEnOiocApAJ2A+f80cNXEZnZgFU3j6?=
 =?us-ascii?Q?RsPOL3Ygi40EIAcDA6TDX10GDGRJHUrBZpWQizvhSE2YebkV/gcikg2gfheC?=
 =?us-ascii?Q?ll95L/JhAXYEfL5O2kh2/cTIh//FDlmiRgE/DIPvR+R2ro1PcQ4pwGKIcLW+?=
 =?us-ascii?Q?qTbc1cxtOl7srxUGU8+XF4cPnERoC+IFlp7y7ptmtJQXn2MELtxnYSBkNUZH?=
 =?us-ascii?Q?5jHeCZIUGcA7PM0A8EMdMJV+256pmcbaFeIf6Ecmh/m8BoPsGPhve1UHk0Vw?=
 =?us-ascii?Q?NAAbowuuHZoolxDDgePdECTC38/QqjYNJMHHCkg97jTnHhbaJoJ+vgqFAlyX?=
 =?us-ascii?Q?1qVq4FhEOyIXABN9pnlduMmgdNLlGo3jOFZIgdr3swW6aFMNM9XDQZqT19sY?=
 =?us-ascii?Q?XQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4HUUnthbp1ZXVmNxXJsCeGdGTFtzIvYaNkb4N8Ke557/KpQ7D0iCkBJad3EmSr5zmLTp6wbV9S8NcBJhNR9AiClHda9AHTvBe97WfvaTedS2/mz+TlSWtPyJIq47Eu6Jp+PqprHEL7eaMZ1Cvky3fJtO1oQp4PCdQ63hAfb8cjBxBL3WfTjh3bPR2c+Pcgi+vYCzyDyVMYNtPmXvjFdUW2T2SrBZ18nuaGv08q5Kz+8hdQmwS29FmzEKd67M+Hxon0mglWnac1IXchQGc4Sqi60ljLJ0WXc0/7nJuQywxIbRNEZSqedNq6vgVfYKslGlY++wi7+YLNIB3Jzf/eEikCFHUjAC9ri5XehVGg8hmo3mR1MpoeIDfq0SEALcyQB5LqJWWDSpWxm96yTgp0jt6ZZcGiJD4i/cBCQr0t83lCubqLQX/wQmUAqwzTJQ9SuPITEdD9dOmMSoUSi7LqFb7QzDU+6mK1nHwC+CkTNwzXMIJ9a9gb3OZS3O1v8hXVSTfFUReOiMZzr7vQQ+gKAsprnZE0ZPMdkUD9Ovs8u9UUbeZDEvnrRrSD+NjH1aC6PWKB57UHXRcgRQQ+k0Q8VNDK01iIn0CAl+A3MfbXMfeTA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78a5759d-1032-485c-2291-08ddaf308d95
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 12:55:22.5794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2wdnDlvsAYAZh0VS1vJLipE/nGSRSBjOGH8mEqKZDznVN5a1+fLeO+EzL/TGCBF8oxPNyklp/Av4Ws8KKFo5DhZSVvKXwjGRLlfRFSAFEgE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8036
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_04,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506190107
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDEwNyBTYWx0ZWRfX3giJDuliVO4L VOXq1DdFdry4Fdxo/RZYljYmgg5W/9OW/d356ZsQaaZUizDujQaTgjtLQYkl/BdNDtwnqMygUTq qkQqm8CQ1IYn2YNLHWj0IGKNIM0dK3QJtM1t6yGx4fBRD5JI++qJ5LdBS3OisbuiebccuCpTtYq
 jAlvM+UqS10ZgCc2ay/emnkVt/u1y/9fkIrUcH+TTTMrQJbiCTdbw5st0VIxc41HcajZR3Tii4O TCTfj2Gom1gIeGdwpRTmQQ8GTd0c8gFyhc8wQos+MYiynKv7SDxxsPaR6n74f29aAl5Hvnh6bY3 EblGotpjaDLb/KpFMHfpaaNQkxPgGA+2sH0hRjZ3O8dR9t9dW2Ol5vKKl9D0M+XmGnMyzGgT9IB
 byUKjsRzS26WjvKxGoV4Zg4O6W6X+TEAN7yT3yGDkV7eMo2itpYCUiJWftEBXr567iZHauAx
X-Authority-Analysis: v=2.4 cv=U4CSDfru c=1 sm=1 tr=0 ts=685408be cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=8gB0sCNqnUlaZvzeU9IA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 3Hdx8rrdqNSRs8HyWZXSTBaW1YTWpVe-
X-Proofpoint-ORIG-GUID: 3Hdx8rrdqNSRs8HyWZXSTBaW1YTWpVe-

On Thu, Jun 19, 2025 at 09:18:39AM +0530, Dev Jain wrote:
>
> On 18/06/25 11:20 pm, Lorenzo Stoakes wrote:
> > This series has a lot of duplication in it esp vs. your other series [0], but
> > perhaps something we can tackle in a follow up.
> >
> > It'd be nice if we could find a way to de-duplicate some of the near-identical
> > code though.
> >
> > But it's a 'maybe' on that because hey, the code in this file is hideous anyway
> > and needs a mega rework in any case...
> >
> > [0]: https://lore.kernel.org/all/20250618102607.10551-1-dev.jain@arm.com/
> >
> > On Wed, Jun 18, 2025 at 09:26:08PM +0530, Dev Jain wrote:
> > > Use PTE batching to optimize collapse_pte_mapped_thp().
> > >
> > > On arm64, suppose khugepaged is scanning a pte-mapped 2MB THP for collapse.
> > > Then, calling ptep_clear() for every pte will cause a TLB flush for every
> > > contpte block. Instead, clear_full_ptes() does a
> > > contpte_try_unfold_partial() which will flush the TLB only for the (if any)
> > > starting and ending contpte block, if they partially overlap with the range
> > > khugepaged is looking at.
> > >
> > > For all arches, there should be a benefit due to batching atomic operations
> > > on mapcounts due to folio_remove_rmap_ptes().
> > >
> > > Note that we do not need to make a change to the check
> > > "if (folio_page(folio, i) != page)"; if i'th page of the folio is equal
> > > to the first page of our batch, then i + 1, .... i + nr_batch_ptes - 1
> > > pages of the folio will be equal to the corresponding pages of our
> > > batch mapping consecutive pages.
> > >
> > > No issues were observed with mm-selftests.
> > >
> > > Signed-off-by: Dev Jain <dev.jain@arm.com>
> > > ---
> > >
> > > This is rebased on:
> > > https://lore.kernel.org/all/20250618102607.10551-1-dev.jain@arm.com/
> > > If there will be a v2 of either version I'll send them together.
> > Hmmm I say again - slow down a bit :) there's no need to shoot out multiple
> > patches in a single day and you'd maybe avoid some of this kind of thing.
> >
> > It's really preferable to avoid possible conflicts like this or at least reduce
> > the chance by having review on one thing done first.
> >
> > I mean, why not just put both of these in a series for the respin? Just a
> > thought ;) in fact this is probably an ideal use of a series for that as you can
> > ensure you deal with both if any conflicts arise.
>
> Sorry for this. I found these two patches independently with a couple of
> hours difference, and I posted this one yesterday because stupid me thought
> someone will, after seeing my first patch, point out that the optimization
> can be made at one more place. So I will send this and the other patch as
> a series anyway for v2.

Sure, thanks, it'll just make life easier.

>
> >
> > >   mm/khugepaged.c | 38 +++++++++++++++++++++++++-------------
> > >   1 file changed, 25 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > > index 649ccb2670f8..7d37058eda5b 100644
> > > --- a/mm/khugepaged.c
> > > +++ b/mm/khugepaged.c
> > > @@ -1499,15 +1499,16 @@ static int set_huge_pmd(struct vm_area_struct *vma, unsigned long addr,
> > >   int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
> > >   			    bool install_pmd)
> > >   {
> > > +	int nr_mapped_ptes = 0, nr_batch_ptes, result = SCAN_FAIL;
> > NIT: I don't know why you're moving this, and while y'know it's kind of the fun
> > of subjective stuff I'd rather the assigned values and unassigned values be on
> > different lines (yes I know this codebase violates this with the pml, ptl below
> > but hey :P)
>
> To maintain a reverse Xmas fashion. Now I know that the declarations are already
> not in an Xmas fashion, but I wanted to make sure the code I change maintains
> that for the part I am changing :)

We have no such requirement in mm nor do we particularly want to establish any
conventions around this.

I've already read enough stupid articles about unreasonable kernel devs insist
on yada yada... let's just keep it sensible and logical! :)

>
> >
> > >   	struct mmu_notifier_range range;
> > >   	bool notified = false;
> > >   	unsigned long haddr = addr & HPAGE_PMD_MASK;
> > > +	unsigned long end = haddr + HPAGE_PMD_SIZE;
> > >   	struct vm_area_struct *vma = vma_lookup(mm, haddr);
> > >   	struct folio *folio;
> > >   	pte_t *start_pte, *pte;
> > >   	pmd_t *pmd, pgt_pmd;
> > >   	spinlock_t *pml = NULL, *ptl;
> > > -	int nr_ptes = 0, result = SCAN_FAIL;
> > >   	int i;
> > >
> > >   	mmap_assert_locked(mm);
> > > @@ -1620,12 +1621,17 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
> > >   	if (unlikely(!pmd_same(pgt_pmd, pmdp_get_lockless(pmd))))
> > >   		goto abort;
> > >
> > > +	i = 0, addr = haddr, pte = start_pte;
> > This is horrid, no absolutely not. This is not how we do assignment in arbitrary
> > C code.
> >
> > I don't know why we need a do/while here in general, I think the for loop should
> > still work ok no?
>
> I don't recall now and I cannot even find it, but I have been following this
> pattern for some time, by god I cannot remember which pattern I am copying
> from. Anyhow I also hate the do/while thingy so I will change this to a
> for loop.

Thanks

>
> >
> > >   	/* step 2: clear page table and adjust rmap */
> > > -	for (i = 0, addr = haddr, pte = start_pte;
> > > -	     i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE, pte++) {
> > > +	do {
> > > +		const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> > > +		int max_nr_batch_ptes = (end - addr) >> PAGE_SHIFT;
> > > +		struct folio *this_folio;
> > Hate this name. We are not C#... ;)
> >
> > Just call it folio no? The 'this_' is redundant.
>
> There is already a struct folio *folio which we retrieve from filemap_lock_folio.
> So wanted to differentiate, I didn't think hard about the name. How about mapped_folio?

Ah damn, ok that sounds better, thanks!
