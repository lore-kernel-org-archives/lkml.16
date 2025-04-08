Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B1422B8D2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 18:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744135364; cv=fail; b=X5x0Mp+o8pbZyoAtg5qjKS2RMnjedtLUTAYzpYkwINwy8IxzqjdGjWSmkzByG16Up6LCYPg+PcWr3NWAj1oerGBQg6Txffhpplf0Hhf1Ytj8K3bXuaJmmnfQYGIaRrcAaGWhNv2nlKzswuVwTSNJ3JwE8JfKDne6DidUgFmRiDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744135364; c=relaxed/simple;
	bh=JdFQmnxnvMgSAPJVScdakYUlw66B5u5+UA4epF1FrTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rHrpKbQEUAr8dteTvYZV1MF667DOxTMx46iFtZy3tIRZnQlkgBhAFNCz2Fm8VspEO2veao3A0gOnaiB5aVAxgnL3K6NNjxYdzYinK1yjRe1Q/PMqoAI2km7MPdR2e+1uhLjowA9BiSsLjMppcZOozMUTQHKC7DPKF2kVM5wI9VE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mChi/oWm; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=y0IOf5qA; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mChi/oWm";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="y0IOf5qA"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538HCDj5026246;
	Tue, 8 Apr 2025 18:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=CWejdr7pmGWl0Thdn+
	+oFuFp0gCG1o5TXJl3DtUgT1U=; b=mChi/oWmf3KXkS+yurgU4iCUqtiXZ3KJ5B
	+479Tf6gAoOgpr5OxvD1IVyAdbxVDUCzWOmni9Jb5gJIXXPg5bTeUH/TrS1Cxqyu
	ECH8kzzdSkoVR3WwjLkAzj7nGrNy78YRoCGVhMoZsVUI4xqQV53MZ7Y7/85l6ot2
	ZkNB4mmdscMNPVSvxmt7oL5ctdI2bu9Il/fKGr5LVxgDys+5ouEbYRdVaAXmmcdf
	g3MDQ46Fgl5kUpM6H9NhkKjigZqcV5crNUU6ykeMz1a9aeFVDSOXbu/AInFhLXX9
	PtUAITXEbUXWYf/aUiyVv0R2f1fSPD//AU8tdMJJcA+D9j+Ixq0g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45ttxcwec2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Apr 2025 18:02:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 538H0VkF023897;
	Tue, 8 Apr 2025 18:02:31 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazlp17012055.outbound.protection.outlook.com [40.93.20.55])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45ttyfy2fn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Apr 2025 18:02:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IVBpSxoaGznv7UNXt2mfhz5vR8ZzEsvRWLjvAW+DxPNOjLYAex1uka/CDLLO0XnuOW0yvCqjOsgnZ8fJOueSAVn7+mQAs1z/rYidysd8VBOmgWjpP+hbEP+Z6OP5VGTqZ+7PUQxg4TJCgKP0pWpBlbCDI1YCelPcw918V5+7mY9A9WH06fzy/UNt1vxKTCV5LxvMwle+1Kf2moVqBXNYWEIEi9ttkFbocu0rBigVlOc+XS5qJoffC1ABAq0h6uESePfPl9jP0F80brPkRPcYeoPhHj7j3oOhCMNV16X3Ts8UajPG4Ow/Aftr2qcuWjWEYR98QgwtnwADz9T3PijJqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CWejdr7pmGWl0Thdn++oFuFp0gCG1o5TXJl3DtUgT1U=;
 b=oovI3FSsrpzHI/XsA/t1CpQtFadyZqK6qM3jTSLBILxCtLzReioZFR6Ye9uHPsdJAPwiw4rJsT8Fk5wWbR1L6gr6NJyrSnZSAmAkaDh3OA2kinkp/3BLp3r1xk9f76otzqIhwBQF8nl2cn1/yLdlbSc7HxjhmVzcu0gtlQD6kXmM6fFsBQnPc6fLiUzz2351zGjcmznQ4qMxe1SJMbzBZO0iNAH156Pt1wqoweB/NE4D+DirRvX269CTBF9Ut4yj6WAkflqFyJ22xMEl4FAANoQ5KZeYpoTopSZd5L4Gi8Qk0Rda0Hg4XuxBbPi8RA6CNJ1SjtiRh0V0l07ngzxm1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CWejdr7pmGWl0Thdn++oFuFp0gCG1o5TXJl3DtUgT1U=;
 b=y0IOf5qAHslvlQ5jwNGy+z1bPf5CD5k7menpW/H94k2Ja3MT5G4V40/i4Oe9pQzkE+YXS/2a0ZGqEO92i+QoC/0gXyfr6verMtbSzb8r7ZgIUrpU/mMacCfCmRgNki+irDBkQDsHoH21LtPm74jAM+fdCL02UC6Q9WHgZSWJgk4=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by DS0PR10MB8198.namprd10.prod.outlook.com (2603:10b6:8:1f4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.20; Tue, 8 Apr
 2025 18:02:28 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%7]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 18:02:28 +0000
Date: Tue, 8 Apr 2025 14:02:24 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Sidhartha Kumar <sidhartha.kumar@oracle.com>
Cc: linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org,
        linux-mm@kvack.org, akpm@linux-foundation.org, willy@infradead.org
Subject: Re: [PATCH v4 2/6] maple_tree: use height and depth consistently
Message-ID: <x2zslmxit4p67pk6sda3fed6hcvggwg55xegfxedkhs2d6m54a@2wi4tfptka4f>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Sidhartha Kumar <sidhartha.kumar@oracle.com>, linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org, 
	linux-mm@kvack.org, akpm@linux-foundation.org, willy@infradead.org
References: <20250407184102.2155415-1-sidhartha.kumar@oracle.com>
 <20250407184102.2155415-3-sidhartha.kumar@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407184102.2155415-3-sidhartha.kumar@oracle.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YQBPR0101CA0149.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::22) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|DS0PR10MB8198:EE_
X-MS-Office365-Filtering-Correlation-Id: 56d110d9-8b89-46f6-c8ed-08dd76c78632
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YPCb49q16D8oRv+qgy78MZwrkB516nFCp+/ueuPh7Lz2C7hcWZVUZLqnLEac?=
 =?us-ascii?Q?Fg2FmgW21WcmgjKS/+uYn5jYS9ltJZTz77UZCFgAMyWDi1fE3yAMOFdclj5g?=
 =?us-ascii?Q?+KRSOayBQ4dow9G/Uxn6w9DFSwg8mVIotqisYntxA0UiRK4MElLu5QWCyJyI?=
 =?us-ascii?Q?o3NAEoWNerYC139I8A+qtdRLBlQHiKCKeZ+WJUlyQEDetveXn9TEnwkJL6nm?=
 =?us-ascii?Q?KoX410mYB9TDznLgXLNXQLzNytHeeHX3yrFNAV6HuxuwuDkzu+YOAlPuu7iK?=
 =?us-ascii?Q?fjIyjK4qp/7HD52it3ZhRnSrhVa+9/8sapeWP4ky4/G6adL55Rcoa+WH8b1/?=
 =?us-ascii?Q?NggTQ35sUDqopDz4tMnBbTzlSASTTQigKG4ft4lWr7Kvy72boGoM1eMzzVDL?=
 =?us-ascii?Q?3Vm3p5QFFW2NgS3veCNFOXFeDXsSnVHfLhC6lT1PhffeBizAxQlIdwdM2S4r?=
 =?us-ascii?Q?uLKA+IzSklz6WEMP3dsTvQNMDJNizn2j1dR1dI1Zi+bg8U38IemIbaLJ3vB9?=
 =?us-ascii?Q?rjSvT56HnPJtXwEy72vEPI/k/ppJ9LM+SObfY0oVd6OeBbecsnPVfcFH8nmq?=
 =?us-ascii?Q?tOl+NxpfQaH39OE+IbgjpplArDtwecXa/mB0efbBQ6y/GOFwHIUMEjeYze9k?=
 =?us-ascii?Q?iQH0Plypj4Vol32Iht8yRGaNGiwb2EK11k+skuOqvsKz1zH6r/mDJE8NaNzC?=
 =?us-ascii?Q?N0dQotI43MYb1RKTqlTDzGDc4jPD/ytN8dS4zH5hDAW5Svsm8BdAQ5qGEf1q?=
 =?us-ascii?Q?QIba7fiznQjKrJ1Dh3G/QawceciTW5+bMu4v9YEn/+1B1E+7vs9yXva1oEMG?=
 =?us-ascii?Q?OUTUvbNxAML/24r1ByeCUMdVIJm9KD0XMW+V2QRMcJGDvGuk9meSLCi9DnAh?=
 =?us-ascii?Q?JEs1fxCGAv4ZO7STKnjg79nhTE2I3uzbDNagM0v2OXTjPVbEkT1M0vuAvdYV?=
 =?us-ascii?Q?XctpRDXx9bQSY4y5J58heD0h/6l3fNXRw51sjo4yp+5SRnNqvCjE5FebM+2W?=
 =?us-ascii?Q?gwljKRrqXKNA5zkBSUf6xiceKc6HUhdQzw2f/XwUbmiLO9C2hk+vez24ekfG?=
 =?us-ascii?Q?nv3LPtW5LJsbwQ+uVKJStXQ+q+Dof4rnLnGBcZCYhPNTxRbV9H1sP+dVzHz2?=
 =?us-ascii?Q?VHow+jXDZtou9RfyMAOxxnUulheT5EcXko4o7JLvdVCAjLTdR54Vd4ajq7G6?=
 =?us-ascii?Q?kcvTkihNUSzWHeuI4dtFaczwyoIHlHcOFQbOs4tIZ6J8Fc6mJCeE4mlet4G5?=
 =?us-ascii?Q?gTFAAbhViUVKD5x3q76Q+khZf1CcMXoDsO1kEJu3j3RkoyHq+1kVEzLqe5RH?=
 =?us-ascii?Q?fDkS3Ocvzjw4yOuxeDvZtZqhQyKbuUDODlqDwIV7imO6ubC4SqwCn+piRrG6?=
 =?us-ascii?Q?Nd90c6LiAzzwcGo60xlBm1ohDH6n?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9UNLEH2vx7fcsn6d5m4XeQbQgEVntwbmiRbsADUge69Ozq8By+uTujcQSc4y?=
 =?us-ascii?Q?uDRCd0zZxcsLhOEgegavHr2xbhAHKnrnu/FxM0h5fRR7si6WIs8hVralejzD?=
 =?us-ascii?Q?l8T3mT8tElQATNqNNg6QTt/9bUTILQQ0r23sR6pe/do511STos9FuEwVsldj?=
 =?us-ascii?Q?9u3Nf+P/InDKsCg9BjHMvv4ONSBPeh+qkCRfj7T9RDuYITjtKIOYsciYpBv7?=
 =?us-ascii?Q?9qdXt3feR407Ho003NkMbPsyptrj3/6Ss5U7JOz+JGk1uqYAsHpjpq/h/1k4?=
 =?us-ascii?Q?QfTSLZ9flh4IjgKEPC+tXe8VPuTHWhZL0/dFwILZByyZhcmya24FfX0abRwP?=
 =?us-ascii?Q?nYmftcwnTLfeEOvHja85hKQAy4nbnFno8u+LfL3ycUJpKfoDP3pxhOLsQBRG?=
 =?us-ascii?Q?lFouYRWihoWWX6X9rWdgSn3ocoWlVbcsgImymuLhKIx1IDki7AXPTlrnU82e?=
 =?us-ascii?Q?ybai3PD3ApaWsAb/tNxqy6TSjYRDcNT7Tr7CTlJ6DY7HYB/719dDwLHEpSSD?=
 =?us-ascii?Q?OnitmTxLb2HHsSglsvTgD++/wfJJ1pKE9wmm9TuKLGB044WTzHdTZCdp3IdK?=
 =?us-ascii?Q?W2RAdkcC8cEXmNuHThWMF1LfmDXu5QWsI7ZsNb7Go+7U7P+DCoIdAlJaAzE/?=
 =?us-ascii?Q?owVDnRfVKWhAMkbvdKYcdvKRMl0Hnmggn2BYH86tCvHiUf8/A7vP1jSYOGCy?=
 =?us-ascii?Q?DKDyNZ/7BiS04kuR1JpZZo8ut/Gf0BYiuLHoB9MjPoMbqQc6jkJVkeIXaJGI?=
 =?us-ascii?Q?8VRli/yajUwoc5HbH7CCVUT8OxXi29iZX6ZpuPxUeqEomluqkvUVo4P5V5Pw?=
 =?us-ascii?Q?dgUHauWXDlP5mNo+jrG9Ed0U2+2FFUpUYkSMF7KMJooGY2OlaoTzia1jR3CT?=
 =?us-ascii?Q?Cdwu7aZkEl/JBX5FnWJFa8Zj21JAxGDp6T3vT8RDCYUi/9fdKcUtLgKwsJw9?=
 =?us-ascii?Q?CYG+JdhNi+QWvYaFNW6FS/KJO7TsLP3HaTc1aJOI6sk1TC3kY6WWh0fDtlK9?=
 =?us-ascii?Q?WpFr3b3nY3eoC+C8EHzC8XnEP/B5lp58IbC7R91/2BZav1+rIBMYU3tNByRU?=
 =?us-ascii?Q?Gd5DZQQ8e9vcMnYmLFQ9BEIr/VjKoH67/ZzqhvnaSv+lGRGeAD5LKnXreyDQ?=
 =?us-ascii?Q?lfjYSSwkhRPOCLPG3qgba099rjNgAuu2n72Ve7aIAfhGN/T+dsbrHPZL3sjz?=
 =?us-ascii?Q?tMWf+kVmsfPBt9pWbH5TATgzMeBRHLoUE1MpYdaWf2afMdSyYkVAFpH4bPKR?=
 =?us-ascii?Q?MvF7Gh6EhXfSe7GsbXNVBpdp7zKrRAkp4fUIxxcEzEtkZUjQrAmXTkXwVnP0?=
 =?us-ascii?Q?kYwiZckJPvfLJ5AnEA1swUWsKmGzQw/E0VMG3AXbdhvE+PiwO+5zuOsXe1sL?=
 =?us-ascii?Q?dNHD8/e19/LPOt0BpjrwG5rU8eOY6NYRlVQs2ZpA9Y7S887KvknpfyuHAg9R?=
 =?us-ascii?Q?f9H4ohhNuioSVISxA36/XMYKUyQlMEdOiMeDkeS2nZ6omdHGr/DR79nPJz3D?=
 =?us-ascii?Q?GhvYqAotkOqo1NBR3K9Oll8rjjzni+h8iFDGh+drRRaLC28lUej9SiGWmkGu?=
 =?us-ascii?Q?EJCTPtuEMV+IaAd11hUgljgGz3Wdyb8kmtJLCrWM?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XLy1HXo5cHNLEYJSxSzqsHWI4HKRrH/1jCzCiJu12Bk29piyKS17HnHykPZ4Eb695yyf3b1l2ej6XgDBSIpt4aO0E/t8dA+1Qgksn2vJ9T1ea8SfzmZoHGpClSeZfeLhpLk//f6jMh1edZf2wsouGeOO/KdRq74f4OcQg13pPVxK44Sn99rwdWCWwDciz/Yek0KnE7LH0DCBF3Y6P+8f5g9r/eilT3pJFBejK6y7gmcObv3NCNUSGcEzOHwnDxyq3jSXRDwXooYDZY+BtEAkBIU+2qiF4cqmci2/ZdNirNfTFocUSTOAGFh1MCnZY0fJxYpqoO+QzEqaGs6Ic7VpPEeRQUk9SWXpVxL40gwmBhSPsRavkvjQSGwrHjEMfAa7c8+mXG/QdJ6ihhuLb8/sNL6DUSyx5RFYZXq4ZJRWh4cBGjPRQGv3EU163ZPgrUJu0KgP2xAaquUuIh+vC+Ole2gKUdZJjRvIWdA2GGIWZp2o1wrjjvx2Dt7zyyGBK/JcsBqRSamPX513s9QvLx8/p/U1N7euL8PKzp8m48c5mZTNILyvusZTNnJltG3rjpVFm3xEbS37m2WgGnD3Rgab3kNNk/nlbRFsi8Rhi3DfUnc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d110d9-8b89-46f6-c8ed-08dd76c78632
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 18:02:27.9762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qf0oO+qUaFB+XAbUxC5BICnqDl/ww6ySP66o2LpowKykB6/KY2JYayFWV5YkG9/w77QgJI0OQxB0Y8pdyR0v6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8198
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_07,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504080124
X-Proofpoint-GUID: w-iJ_lBeYRz0ArM5m6YmjncLgouLUJQY
X-Proofpoint-ORIG-GUID: w-iJ_lBeYRz0ArM5m6YmjncLgouLUJQY

* Sidhartha Kumar <sidhartha.kumar@oracle.com> [250407 14:41]:
> For the maple tree, the root node is defined to have a depth of 0 with a
> height of 1. Each level down from the node, these values are incremented
> by 1. Various code paths define a root with depth 1 which is inconsisent
> with the definition. Modify the code to be consistent with this
> definition.

Small nit below about adding more detail to this log, but otherwise it
looks good.

> 
> Signed-off-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>
> ---
>  lib/maple_tree.c                 | 82 +++++++++++++++++---------------
>  tools/testing/radix-tree/maple.c | 19 ++++++++
>  2 files changed, 63 insertions(+), 38 deletions(-)
> 
> diff --git a/lib/maple_tree.c b/lib/maple_tree.c
> index f25ee210d495..236f0579ca53 100644
> --- a/lib/maple_tree.c
> +++ b/lib/maple_tree.c
> @@ -211,14 +211,14 @@ static void ma_free_rcu(struct maple_node *node)
>  	call_rcu(&node->rcu, mt_free_rcu);
>  }
>  
> -static void mas_set_height(struct ma_state *mas)
> +static void mt_set_height(struct maple_tree *mt, unsigned char height)
>  {
> -	unsigned int new_flags = mas->tree->ma_flags;
> +	unsigned int new_flags = mt->ma_flags;
>  
>  	new_flags &= ~MT_FLAGS_HEIGHT_MASK;
> -	MAS_BUG_ON(mas, mas->depth > MAPLE_HEIGHT_MAX);
> -	new_flags |= mas->depth << MT_FLAGS_HEIGHT_OFFSET;
> -	mas->tree->ma_flags = new_flags;
> +	MT_BUG_ON(mt, height > MAPLE_HEIGHT_MAX);
> +	new_flags |= height << MT_FLAGS_HEIGHT_OFFSET;
> +	mt->ma_flags = new_flags;
>  }
>  
>  static unsigned int mas_mt_height(struct ma_state *mas)
> @@ -1371,7 +1371,7 @@ static inline struct maple_enode *mas_start(struct ma_state *mas)
>  		root = mas_root(mas);
>  		/* Tree with nodes */
>  		if (likely(xa_is_node(root))) {
> -			mas->depth = 1;
> +			mas->depth = 0;
>  			mas->status = ma_active;
>  			mas->node = mte_safe_root(root);
>  			mas->offset = 0;
> @@ -1712,9 +1712,10 @@ static inline void mas_adopt_children(struct ma_state *mas,
>   * node as dead.
>   * @mas: the maple state with the new node
>   * @old_enode: The old maple encoded node to replace.
> + * @new_height: if we are inserting a root node, update the height of the tree
>   */
>  static inline void mas_put_in_tree(struct ma_state *mas,
> -		struct maple_enode *old_enode)
> +		struct maple_enode *old_enode, char new_height)
>  	__must_hold(mas->tree->ma_lock)
>  {
>  	unsigned char offset;
> @@ -1723,7 +1724,7 @@ static inline void mas_put_in_tree(struct ma_state *mas,
>  	if (mte_is_root(mas->node)) {
>  		mas_mn(mas)->parent = ma_parent_ptr(mas_tree_parent(mas));
>  		rcu_assign_pointer(mas->tree->ma_root, mte_mk_root(mas->node));
> -		mas_set_height(mas);
> +		mt_set_height(mas->tree, new_height);
>  	} else {
>  
>  		offset = mte_parent_slot(mas->node);
> @@ -1741,12 +1742,13 @@ static inline void mas_put_in_tree(struct ma_state *mas,
>   * the parent encoding to locate the maple node in the tree.
>   * @mas: the ma_state with @mas->node pointing to the new node.
>   * @old_enode: The old maple encoded node.
> + * @new_height: The new height of the tree as a result of the operation
>   */
>  static inline void mas_replace_node(struct ma_state *mas,
> -		struct maple_enode *old_enode)
> +		struct maple_enode *old_enode, unsigned char new_height)
>  	__must_hold(mas->tree->ma_lock)
>  {
> -	mas_put_in_tree(mas, old_enode);
> +	mas_put_in_tree(mas, old_enode, new_height);
>  	mas_free(mas, old_enode);
>  }
>  
> @@ -2536,10 +2538,11 @@ static inline void mas_topiary_node(struct ma_state *mas,
>   *
>   * @mas: The maple state pointing at the new data
>   * @old_enode: The maple encoded node being replaced
> + * @new_height: The new height of the tree as a result of the operation
>   *
>   */
>  static inline void mas_topiary_replace(struct ma_state *mas,
> -		struct maple_enode *old_enode)
> +		struct maple_enode *old_enode, unsigned char new_height)
>  {
>  	struct ma_state tmp[3], tmp_next[3];
>  	MA_TOPIARY(subtrees, mas->tree);
> @@ -2547,7 +2550,7 @@ static inline void mas_topiary_replace(struct ma_state *mas,
>  	int i, n;
>  
>  	/* Place data in tree & then mark node as old */
> -	mas_put_in_tree(mas, old_enode);
> +	mas_put_in_tree(mas, old_enode, new_height);
>  
>  	/* Update the parent pointers in the tree */
>  	tmp[0] = *mas;
> @@ -2631,14 +2634,15 @@ static inline void mas_topiary_replace(struct ma_state *mas,
>   * mas_wmb_replace() - Write memory barrier and replace
>   * @mas: The maple state
>   * @old_enode: The old maple encoded node that is being replaced.
> + * @new_height: The new height of the tree as a result of the operation
>   *
>   * Updates gap as necessary.
>   */
>  static inline void mas_wmb_replace(struct ma_state *mas,
> -		struct maple_enode *old_enode)
> +		struct maple_enode *old_enode, unsigned char new_height)
>  {
>  	/* Insert the new data in the tree */
> -	mas_topiary_replace(mas, old_enode);
> +	mas_topiary_replace(mas, old_enode, new_height);
>  
>  	if (mte_is_leaf(mas->node))
>  		return;
> @@ -2824,6 +2828,7 @@ static void mas_spanning_rebalance(struct ma_state *mas,
>  {
>  	unsigned char split, mid_split;
>  	unsigned char slot = 0;
> +	unsigned char new_height = 0; /* used if node is a new root */
>  	struct maple_enode *left = NULL, *middle = NULL, *right = NULL;
>  	struct maple_enode *old_enode;
>  
> @@ -2866,6 +2871,7 @@ static void mas_spanning_rebalance(struct ma_state *mas,
>  		mast_set_split_parents(mast, left, middle, right, split,
>  				       mid_split);
>  		mast_cp_to_nodes(mast, left, middle, right, split, mid_split);
> +		new_height++;
>  
>  		/*
>  		 * Copy data from next level in the tree to mast->bn from next
> @@ -2873,7 +2879,6 @@ static void mas_spanning_rebalance(struct ma_state *mas,
>  		 */
>  		memset(mast->bn, 0, sizeof(struct maple_big_node));
>  		mast->bn->type = mte_node_type(left);
> -		l_mas.depth++;
>  
>  		/* Root already stored in l->node. */
>  		if (mas_is_root_limits(mast->l))
> @@ -2909,8 +2914,9 @@ static void mas_spanning_rebalance(struct ma_state *mas,
>  
>  	l_mas.node = mt_mk_node(ma_mnode_ptr(mas_pop_node(mas)),
>  				mte_node_type(mast->orig_l->node));
> -	l_mas.depth++;
> +

Please add a comment in the git log as to why this moved so we can find
out later.

>  	mab_mas_cp(mast->bn, 0, mt_slots[mast->bn->type] - 1, &l_mas, true);
> +	new_height++;
>  	mas_set_parent(mas, left, l_mas.node, slot);
>  	if (middle)
>  		mas_set_parent(mas, middle, l_mas.node, ++slot);
> @@ -2933,7 +2939,7 @@ static void mas_spanning_rebalance(struct ma_state *mas,
>  	mas->min = l_mas.min;
>  	mas->max = l_mas.max;
>  	mas->offset = l_mas.offset;
> -	mas_wmb_replace(mas, old_enode);
> +	mas_wmb_replace(mas, old_enode, new_height);
>  	mtree_range_walk(mas);
>  	return;
>  }
> @@ -3009,6 +3015,7 @@ static inline void mas_destroy_rebalance(struct ma_state *mas, unsigned char end
>  	void __rcu **l_slots, **slots;
>  	unsigned long *l_pivs, *pivs, gap;
>  	bool in_rcu = mt_in_rcu(mas->tree);
> +	unsigned char new_height = mas_mt_height(mas);
>  
>  	MA_STATE(l_mas, mas->tree, mas->index, mas->last);
>  
> @@ -3103,7 +3110,7 @@ static inline void mas_destroy_rebalance(struct ma_state *mas, unsigned char end
>  	mas_ascend(mas);
>  
>  	if (in_rcu) {
> -		mas_replace_node(mas, old_eparent);
> +		mas_replace_node(mas, old_eparent, new_height);
>  		mas_adopt_children(mas, mas->node);
>  	}
>  
> @@ -3114,10 +3121,9 @@ static inline void mas_destroy_rebalance(struct ma_state *mas, unsigned char end
>   * mas_split_final_node() - Split the final node in a subtree operation.
>   * @mast: the maple subtree state
>   * @mas: The maple state
> - * @height: The height of the tree in case it's a new root.
>   */
>  static inline void mas_split_final_node(struct maple_subtree_state *mast,
> -					struct ma_state *mas, int height)
> +					struct ma_state *mas)
>  {
>  	struct maple_enode *ancestor;
>  
> @@ -3126,7 +3132,6 @@ static inline void mas_split_final_node(struct maple_subtree_state *mast,
>  			mast->bn->type = maple_arange_64;
>  		else
>  			mast->bn->type = maple_range_64;
> -		mas->depth = height;
>  	}
>  	/*
>  	 * Only a single node is used here, could be root.
> @@ -3214,7 +3219,6 @@ static inline void mast_split_data(struct maple_subtree_state *mast,
>   * mas_push_data() - Instead of splitting a node, it is beneficial to push the
>   * data to the right or left node if there is room.
>   * @mas: The maple state
> - * @height: The current height of the maple state
>   * @mast: The maple subtree state
>   * @left: Push left or not.
>   *
> @@ -3222,8 +3226,8 @@ static inline void mast_split_data(struct maple_subtree_state *mast,
>   *
>   * Return: True if pushed, false otherwise.
>   */
> -static inline bool mas_push_data(struct ma_state *mas, int height,
> -				 struct maple_subtree_state *mast, bool left)
> +static inline bool mas_push_data(struct ma_state *mas,
> +				struct maple_subtree_state *mast, bool left)
>  {
>  	unsigned char slot_total = mast->bn->b_end;
>  	unsigned char end, space, split;
> @@ -3280,7 +3284,7 @@ static inline bool mas_push_data(struct ma_state *mas, int height,
>  
>  	mast_split_data(mast, mas, split);
>  	mast_fill_bnode(mast, mas, 2);
> -	mas_split_final_node(mast, mas, height + 1);
> +	mas_split_final_node(mast, mas);
>  	return true;
>  }
>  
> @@ -3293,6 +3297,7 @@ static void mas_split(struct ma_state *mas, struct maple_big_node *b_node)
>  {
>  	struct maple_subtree_state mast;
>  	int height = 0;
> +	unsigned int orig_height = mas_mt_height(mas);
>  	unsigned char mid_split, split = 0;
>  	struct maple_enode *old;
>  
> @@ -3319,7 +3324,6 @@ static void mas_split(struct ma_state *mas, struct maple_big_node *b_node)
>  	MA_STATE(prev_r_mas, mas->tree, mas->index, mas->last);
>  
>  	trace_ma_op(__func__, mas);
> -	mas->depth = mas_mt_height(mas);
>  
>  	mast.l = &l_mas;
>  	mast.r = &r_mas;
> @@ -3327,9 +3331,9 @@ static void mas_split(struct ma_state *mas, struct maple_big_node *b_node)
>  	mast.orig_r = &prev_r_mas;
>  	mast.bn = b_node;
>  
> -	while (height++ <= mas->depth) {
> +	while (height++ <= orig_height) {
>  		if (mt_slots[b_node->type] > b_node->b_end) {
> -			mas_split_final_node(&mast, mas, height);
> +			mas_split_final_node(&mast, mas);
>  			break;
>  		}
>  
> @@ -3344,11 +3348,15 @@ static void mas_split(struct ma_state *mas, struct maple_big_node *b_node)
>  		 * is a significant savings.
>  		 */
>  		/* Try to push left. */
> -		if (mas_push_data(mas, height, &mast, true))
> +		if (mas_push_data(mas, &mast, true)) {
> +			height++;
>  			break;
> +		}
>  		/* Try to push right. */
> -		if (mas_push_data(mas, height, &mast, false))
> +		if (mas_push_data(mas, &mast, false)) {
> +			height++;
>  			break;
> +		}
>  
>  		split = mab_calc_split(mas, b_node, &mid_split);
>  		mast_split_data(&mast, mas, split);
> @@ -3365,7 +3373,7 @@ static void mas_split(struct ma_state *mas, struct maple_big_node *b_node)
>  	/* Set the original node as dead */
>  	old = mas->node;
>  	mas->node = l_mas.node;
> -	mas_wmb_replace(mas, old);
> +	mas_wmb_replace(mas, old, height);
>  	mtree_range_walk(mas);
>  	return;
>  }
> @@ -3424,8 +3432,7 @@ static inline void mas_root_expand(struct ma_state *mas, void *entry)
>  	if (mas->last != ULONG_MAX)
>  		pivots[++slot] = ULONG_MAX;
>  
> -	mas->depth = 1;
> -	mas_set_height(mas);
> +	mt_set_height(mas->tree, 1);
>  	ma_set_meta(node, maple_leaf_64, 0, slot);
>  	/* swap the new root into the tree */
>  	rcu_assign_pointer(mas->tree->ma_root, mte_mk_root(mas->node));
> @@ -3669,8 +3676,7 @@ static inline void mas_new_root(struct ma_state *mas, void *entry)
>  	WARN_ON_ONCE(mas->index || mas->last != ULONG_MAX);
>  
>  	if (!entry) {
> -		mas->depth = 0;
> -		mas_set_height(mas);
> +		mt_set_height(mas->tree, 0);
>  		rcu_assign_pointer(mas->tree->ma_root, entry);
>  		mas->status = ma_start;
>  		goto done;
> @@ -3684,8 +3690,7 @@ static inline void mas_new_root(struct ma_state *mas, void *entry)
>  	mas->status = ma_active;
>  	rcu_assign_pointer(slots[0], entry);
>  	pivots[0] = mas->last;
> -	mas->depth = 1;
> -	mas_set_height(mas);
> +	mt_set_height(mas->tree, 1);
>  	rcu_assign_pointer(mas->tree->ma_root, mte_mk_root(mas->node));
>  
>  done:
> @@ -3804,6 +3809,7 @@ static inline void mas_wr_node_store(struct ma_wr_state *wr_mas,
>  	struct maple_node reuse, *newnode;
>  	unsigned char copy_size, node_pivots = mt_pivots[wr_mas->type];
>  	bool in_rcu = mt_in_rcu(mas->tree);
> +	unsigned char height = mas_mt_height(mas);
>  
>  	if (mas->last == wr_mas->end_piv)
>  		offset_end++; /* don't copy this offset */
> @@ -3860,7 +3866,7 @@ static inline void mas_wr_node_store(struct ma_wr_state *wr_mas,
>  		struct maple_enode *old_enode = mas->node;
>  
>  		mas->node = mt_mk_node(newnode, wr_mas->type);
> -		mas_replace_node(mas, old_enode);
> +		mas_replace_node(mas, old_enode, height);
>  	} else {
>  		memcpy(wr_mas->node, newnode, sizeof(struct maple_node));
>  	}
> diff --git a/tools/testing/radix-tree/maple.c b/tools/testing/radix-tree/maple.c
> index bc30050227fd..e0f8fabe8821 100644
> --- a/tools/testing/radix-tree/maple.c
> +++ b/tools/testing/radix-tree/maple.c
> @@ -36248,6 +36248,21 @@ static noinline void __init check_mtree_dup(struct maple_tree *mt)
>  
>  extern void test_kmem_cache_bulk(void);
>  
> +static inline void check_spanning_store_height(struct maple_tree *mt)
> +{
> +	int index = 0;
> +	MA_STATE(mas, mt, 0, 0);
> +	mas_lock(&mas);
> +	while (mt_height(mt) != 3) {
> +		mas_store_gfp(&mas, xa_mk_value(index), GFP_KERNEL);
> +		mas_set(&mas, ++index);
> +	}
> +	mas_set_range(&mas, 90, 140);
> +	mas_store_gfp(&mas, xa_mk_value(index), GFP_KERNEL);
> +	MT_BUG_ON(mt, mas_mt_height(&mas) != 2);
> +	mas_unlock(&mas);
> +}
> +
>  /* callback function used for check_nomem_writer_race() */
>  static void writer2(void *maple_tree)
>  {
> @@ -36414,6 +36429,10 @@ void farmer_tests(void)
>  	check_spanning_write(&tree);
>  	mtree_destroy(&tree);
>  
> +	mt_init_flags(&tree, MT_FLAGS_ALLOC_RANGE);
> +	check_spanning_store_height(&tree);
> +	mtree_destroy(&tree);
> +
>  	mt_init_flags(&tree, MT_FLAGS_ALLOC_RANGE);
>  	check_null_expand(&tree);
>  	mtree_destroy(&tree);
> -- 
> 2.43.0
> 
