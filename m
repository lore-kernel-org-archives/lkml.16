Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC30EDDC5
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 16:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743178258; cv=fail; b=IsJ2oTLn9VOUXkKwUUC6OpCi4PeleJ3Azll7BhB3/AFxqc4ftx6xEOUENfSuvx+/NvVFU7yMCLWIwRX5StUEQGpeYVnIPxAnOh2ENbhTtAC16TrMeeZdgBHEacr5bYQ8msuU8Tj2yfhqlM+sU3+Ps6q8m2AVNyykSiH401aCMNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743178258; c=relaxed/simple;
	bh=rVpUlnlk/ueD+/5cKisCK3kIX0OSm7diyVUtC9ncTv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ksDiiCbfhjsKrVFDTlyu1sMqvYfLUOT7DPC+ILspQtNVYPAbW3jvCD8R2w1bhL8Aa7w0EZdDW9DdoyvrA14xHUzAMaJyzzS8MnF9DbYLh98r1FQnK9s9a/ecdYyILgjSeG/UJPJhLL1441U3SS03Ou2BMuacaIDRWm2XM7QCA6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cH1aSEBj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xMEY5AWG; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cH1aSEBj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xMEY5AWG"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52SEpasF001221;
	Fri, 28 Mar 2025 16:10:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=9Jmttbd2qxg4b8yVlA
	NzXIvQ8w0Z5zXkZogcU5a9RoM=; b=cH1aSEBj7oCdJJynM94/0IU4jS2uDqyK3q
	nteOIXHVyLQ0XvTyX2tel4x2ZvTn2jQpim2eRs1zFB7OsMcTqFPsAcxc0b4Ny0G+
	NCfE/WAbwHFfpaB5eXf49vzu9fHkigcxCQea38lqLRbRWEfGHNz79qY3mTHdVQOW
	jh7WWc5E8NsAzvM28LVfKipqOZ6Ag5+iYsag8C9nO100QKZhnbmqENzoYateAHIs
	tuF542e91si7ZXc3IK5pdl+RK92Pp2/ic4BFI0OW1VKaBdjdutgCo7mKnnKm+Dqb
	dObhaf78v+uoJS7T2FZWkkF2veD4HSOzHso9gEzqq5+pLwcCLN4g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45hn8bfb5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Mar 2025 16:10:43 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52SEquBT023816;
	Fri, 28 Mar 2025 16:10:42 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45jjcj8a1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Mar 2025 16:10:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=knhBoWaD9y16nG/bf04Tzki1LMbElGPMxgaTuUvtm2g9XxpyXdOidxIAyn8+x59Q8M1TxkR007QQYOBIaQpQee4wYRfi75JNkEN+Qo3KGLiGd9wNJ04BaKHArGpw0fnys/QwlvyxKX+Q8lzFgiOQqENYzuZNaADVYdiQEzTr6horOZtjaF1EUiaNMtQrRqTal93aS00j+/x9ADGdTqZSka54nvQDw4jChsAtBH/BMDTfG1x1hGzxHZX8mAyGKgaVU+V1KOoiWWUnFxwhPaZsG/t1evpk8Z4R0jk6Zt56hDW2NjqVVButgLhaETk3h+f1vwUcNQfvt09c5WFXfuJzEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Jmttbd2qxg4b8yVlANzXIvQ8w0Z5zXkZogcU5a9RoM=;
 b=ZzBq5KkZk+e7Q/bRCXiTkRk6UlFYxuYD1pO+AEy8dyhblmj+p9EOqAmpTYrSM39LPhpssntVh3Jgw1H3I/j+oJD5k6q5taqU7CdR9csh3CR5LKaJYDSYzHvqPvRJRHPjQQ1ds3gqS19nHm3MB8ka9RWXh03gpreLSwsYt9SymOzPmZenk0hC/1o8VCBR+Bz2Qm/FxR7OYyBC9pPIhMLL563qnceyt+cerZrPbffjYdKwX4L5RiYItQTt7zpwHEYSe2afE57kinP1Ifr0/WsBr/fxXbbtGizDlG6WsXvBm1WxAMgVN7ggyubK09OzI8MNPrrXixsI8raG3fS8E6rIOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Jmttbd2qxg4b8yVlANzXIvQ8w0Z5zXkZogcU5a9RoM=;
 b=xMEY5AWGA3GSj05SapFR24ODemRNlNOoHMAOUUk2uTgekqmmj2l4WYUnwe0803PScHV5gQosLxe/ux3A2EbgXMdJoAq7NCmXsDOy/fz76W61HZpytUGG9wiUbOCdBTqsouT/t/LYc6W+bAHW6hCkKoR+8s8FL2DCehmZoM3rZ+U=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS0PR10MB6752.namprd10.prod.outlook.com (2603:10b6:8:13a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.33; Fri, 28 Mar
 2025 16:10:40 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%7]) with mapi id 15.20.8583.027; Fri, 28 Mar 2025
 16:10:40 +0000
Date: Fri, 28 Mar 2025 16:10:37 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Peter Xu <peterx@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Axel Rasmussen <axelrasmussen@google.com>,
        Mike Rapoport <rppt@kernel.org>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Lorenzo Stoakes <lstoakes@gmail.com>,
        David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] MAINTAINERS: Add myself as userfaultfd reviewer
Message-ID: <88c571e0-c886-4897-be36-6ea944a83e9d@lucifer.local>
References: <20250322002124.131736-1-peterx@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250322002124.131736-1-peterx@redhat.com>
X-ClientProxiedBy: LO4P123CA0077.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::10) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS0PR10MB6752:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c63a85d-d129-4bd5-e2ec-08dd6e1315bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NILr/F+yN/hCmAYQsfchaLRcRQJgRi/5u/roCHEqMZB2+Y9ORyTlhUJgfKSU?=
 =?us-ascii?Q?k8I2pZIn4ETgkowe01YmoWCR4362E9lG93/Dc1aYXcb1Eojy5HGDnKMvLc7r?=
 =?us-ascii?Q?w025rQEWI3siBfRdkgG0Ln3/W7sQGW7UYz1nGElHY/65XKsXP9xez3RMs2ty?=
 =?us-ascii?Q?4fRhvxc4BnPjsGL706bWBvXQtfEhMfpofi0DljX59hiFWyEp2X6zh93Sun8W?=
 =?us-ascii?Q?S3/4hYDhWtCFwRsV9jO0p7+fKZPCcKmiOr1XRUgWkVbE4sVQTJxtb3ncZA5j?=
 =?us-ascii?Q?0QfldUg44Hms9hLrUtRPTHXIgChyBFKQvRtnjatUF9cJsppY7Fdu9ZZVCpdc?=
 =?us-ascii?Q?5QRxiDom16VW3ltDk7dG7UQ+Ye16YfUwmQPS0dlLVkk+K+qj8KAE/3wCNxzm?=
 =?us-ascii?Q?+aWpHtjP4Mx9/zB1sGjoHVbeZJx3LW90Mq1sw5X9qSoLfk1NpnaEjp1bpOq5?=
 =?us-ascii?Q?2ybpEMdddGYYA6cmzkJkyGH0gMccZNGFl3CTprKDkj+MkM0aDt9n5IgqB0Hj?=
 =?us-ascii?Q?h1Jxbp1EXJBAE54Wm9R+VAaBuaYukmwUHJCYnAhKS3sfRV1elX3d8ehADyI0?=
 =?us-ascii?Q?VWuydMmyaZJAqFB3x8yFTJ7Wq2dJoV/QOnHZmBWeyMFJLY47iSSP3PCCBFuK?=
 =?us-ascii?Q?FkHtm3tCOmVQ5tUiamN1nd2F67bQHBcEXkz/jq8tlSz166ZB0+MQw04WEuMb?=
 =?us-ascii?Q?vYllk0kn8eFfZiHdhI67aJdSYDyJ+cajrR93saIMG0jzowR3Erx7m4x0xQGu?=
 =?us-ascii?Q?gI0q+RRk+ZnLlZBNXw5r2nV5pdq4+oWtSpyvHkfql3PCgP5YiqfL2Ki7tNtS?=
 =?us-ascii?Q?/IcqLyRqa5lfp8Hxez02ntnap7A94xNKJT120hFsu3ZHZSyvvs6gx44+opQe?=
 =?us-ascii?Q?YmjNXm7x3MX5N6qxIrYSAPChnVEiYpQdw7cdCr80kFIANVggUkL9b8T96XQs?=
 =?us-ascii?Q?NwujYvMJ3DmYGvotslfiLlHhhY4Ca09V7md+hWFSDtHDAUaBiQ4lMmISgxgS?=
 =?us-ascii?Q?ENqBWhqkQvwmh870sn9CPXk0KWoesOw5bovz81ywaIxFP7UaLv8EhzL0/y6w?=
 =?us-ascii?Q?E8GKVIdhCq7GnayJgsBppjHWKDg3kwZRu6tRLBN9ji80yyDRrMUZqu0IDcwj?=
 =?us-ascii?Q?gtwB/03qjoBeEiyR6BBeokmZUhbKUDVZYJ9IPxR4iquop+N+vx75wt3yPuwM?=
 =?us-ascii?Q?prGW4YKBzWnC9IflEfQhCLDzXtPCUdVV8wT200eAvhhUDLCw5Ox31N81cPqk?=
 =?us-ascii?Q?0YSDHTuaTuJqdFRWit6cPAguJKiTCuWF8QNOfl47ykJPWEbDwI9ZRnWeh4aM?=
 =?us-ascii?Q?hnw04UirMumNgUGefx+UEVSnfwL6kODJkq+9Su9Flf7vhzwJzMUdSGiLflGr?=
 =?us-ascii?Q?MB+8/WrrsrNi2h2k/qm6fi1jFoS3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B45Mx6HiEkyO0ZJeyYqrYj7hvdD50S8j1UIGRWnbpE7kyCD++rFxoOt1HTls?=
 =?us-ascii?Q?vHIUO0A8QxEWqk7g1C3qy+w8dvRD7XdVKEH0C1z31/4a15lWSjkS7eMneMas?=
 =?us-ascii?Q?E4jD6YKamUF1P3ocAAKNXvH88JD2746eQ1EQQwHijE5NNdxgJKfxm6UKk7+U?=
 =?us-ascii?Q?hr3xiT8/qYWtc8f5AVmHrIx1+0gFKDhwnhEOkoX93hDzN+9HV+t+sCPHxngP?=
 =?us-ascii?Q?4JGINkXra18gCF8xk0oYpWmucVpj3yZmCV9iF61jEABhbilqIRentO/w0Oan?=
 =?us-ascii?Q?vnn2I+PVja2av9bPIPS2zlBe742z2ru97db+WPgU88qkULxngbkbD/Nmg5pZ?=
 =?us-ascii?Q?NWbvp+Kp7tFg5ay14iAUgf8+s71+Kt1DdKznYhjuVZJHfnINisxahX79Ng+n?=
 =?us-ascii?Q?3uEsRKxt4yJ+VDO51OpVmCTRpZP66JhMyiyW433nQp6RTP8HetCcZfj9URFm?=
 =?us-ascii?Q?HfIAUjZTbqXz7An1qHW3PzWXH/J5bFqygD9lWRm3SoiyAliseNSvCZSbWHcF?=
 =?us-ascii?Q?d07lh2xBldDjFzzjtgNqgw+Rpk8CkK6/NMjNEUdydFtFotvpMtox1mhAoAKA?=
 =?us-ascii?Q?1mwOopIvtZjFF0EMP10ViS1lsFdljXy14SToWJUeKGc456pDVm46d5+W1eXv?=
 =?us-ascii?Q?ik1BrX4Yt6ZT7BXyTM7cBUdKgxQN+wTatTO8omXD46hZaeCM1/IN3jJqmyN/?=
 =?us-ascii?Q?QXndforYhg2n2rZkdaG5DHQo4lL/xsxLOqnmAm/W5g9SnRFzxkHIKzR6D7Wq?=
 =?us-ascii?Q?329c06O0YxOZTVSMZfFsQXjnDILCqpD9TAQNMhoLUzRhrv9a2mdC10fIPqLs?=
 =?us-ascii?Q?VElOB20WQPayGOKe3rtEaJkVwUUrepteq1PKnSnODPZQ7lCz+kFeG/ot/ydI?=
 =?us-ascii?Q?0nNTo/YSXmczXOIeXwx8J/Pc31GP2xtC1FOfFp1LJgDPAMthy4DJu9wIVd89?=
 =?us-ascii?Q?i2G6CtGMcviVs5nZDww3odwfJlFys1e0mkveQjeClaHp/Mo5AVrd/lWl22xr?=
 =?us-ascii?Q?ogVFYd0DDduRaDlN4OY/0bwq7Gvg4DVGkemRlBS6kbBJ/yfzB8IYnhwEFEWs?=
 =?us-ascii?Q?JB2yAZBJqviOWf5mZwpoTkuI3GpATaecagW+ET9lHQ4d+V37CNshq5jsv9G1?=
 =?us-ascii?Q?jDmGmy4Enbj827O1Ay+kq7J9uP/FRutz1mytxCPy8xrBKyE/6hd+fRqlODxC?=
 =?us-ascii?Q?L1c/XFgOG8I+kShJ6tnRdEmx/WUvUE+a2qMpptUbm9vsndQi6gFjG7NJcTlK?=
 =?us-ascii?Q?iCYhvEBdn4jhjunQHNzMVky1zCvEGRrdJz1zX847jqzTVKm1DZWJsPFxSdaT?=
 =?us-ascii?Q?qNEi5YIU77NTbF++uESIpDuFsdZULJhBMgebd8Zlbvol17ZJIjHRnh3OkGOb?=
 =?us-ascii?Q?u7PfXmSlu9/81i8/zQOHrr89D7caiJzyVbnKu++TofbCd/pTzoV+2Q9+Go+a?=
 =?us-ascii?Q?jD48MzWfepOKmkBDpAr8C0YQNOcxzULSTnGuq6w4PWqC6025D1JSg3Tslqyh?=
 =?us-ascii?Q?hzOXqgTUToYv1kiyhoFvG/a2A45ol0uU+c73xtCVcUT+fGFwNYj/nkaZg5Cq?=
 =?us-ascii?Q?hndvOdN1M1AC3py8Jqr2GpYDA5yJiZanAH9sgRywjO4oTfYJ8gWWmMLpNugO?=
 =?us-ascii?Q?+w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZFYqQeTxBd9jtJsDZ4U4B/ALIV1xrsUAJUs5puc6c1bm9q1f+eGCZVWfh3iPObfgGTXLjsdjiao0Iua2b1FcQZGdY5/cORPFKcfN20455TKlPfM9VbmI0M/de+L7m+FDxyox+k+eq35U2dDuaoNU5fqtGGOLQlpWP7yO+m2byrVJ24oDfvFVNsWkDMpspySAP+cIADVwTnYmWsfn4fRV0H+LM2D1KOticRnqo9Yl8v6nlRIvduTXQxU3qWluMe3ZK7t7Mk7VKbfTCFBDo8qcp2I7c6eUe6JJB6gbAipUD55HiVwm0PYIpqbQJtkenxuhSS/9AZCafBrlzP9t25BEW9/4IKjcfFCifoJVawNjFNQzWL9CZFvVvH7PQF1QoeqEtLVSZAIvC9FNTc63sl6cjCCdQajEoVKzudO5JjbV0O4zfjMrz4gRYlWB4946P5Xtx2z+cP/X+wh11GuZnPnvITX3012s3b//LZ0+SWelAVFi3QhcJAS08OpcGHwGolRKWpCr0p3T/55JWCByJ2kQfGI/LrNGvgx/+9kvgBEKI/vG3PptzD8bXZedSBHYNZRK9sUHOb5TEOUDtViKQY3ZRpzmP0Uz7kivwctCfxDA2B0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c63a85d-d129-4bd5-e2ec-08dd6e1315bf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 16:10:40.7404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KUNDPa3yPZTzRmeAiyxvlXBZPRjzDjv1OspFz1DDWPt9qZj38kLCcJo2cDVLDQOYl27SpoyPtRn42j4jBRPOsp/r6BWtG90xqGggEO+hTZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6752
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503280112
X-Proofpoint-GUID: QqlETgUI-XhdL8OV4G-8ZC2BPExPn2dU
X-Proofpoint-ORIG-GUID: QqlETgUI-XhdL8OV4G-8ZC2BPExPn2dU

On Fri, Mar 21, 2025 at 08:21:24PM -0400, Peter Xu wrote:
> Add an entry for userfaultfd and make myself a reviewer of it, just in case
> it helps people manage the cc list.
>
> I named it MEMORY USERFAULTFD, could be a bad name, but then it can be
> together with the MEMORY* entries when everything is in alphabetic order,
> which is definitely a benefit.
>
> The line may not change much on how I'd work with userfaultfd; I think I'll
> do the same as before..  But maybe it still, more or less, adds some
> responsibility on top, indeed.
>
> Cc: Andrea Arcangeli <aarcange@redhat.com>
> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Cheers! beers_owed++ ;)

As Mike points out, also needs include/linux/userfaultfd_k.h but Andrew - I
guess you can tack that on here?

Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  MAINTAINERS | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e714ea3a7c9f..844e3e1e05d2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15220,6 +15220,17 @@ F:	mm/vma.h
>  F:	mm/vma_internal.h
>  F:	tools/testing/vma/
>
> +MEMORY USERFAULTFD
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +R:	Peter Xu <peterx@redhat.com>
> +S:	Maintained
> +F:	mm/userfaultfd.c
> +F:	fs/userfaultfd.c
> +F:	include/uapi/linux/userfaultfd.h
> +F:	include/asm-generic/pgtable_uffd.h
> +F:	Documentation/admin-guide/mm/userfaultfd.rst
> +F:	tools/testing/selftests/mm/uffd-*.[ch]
> +
>  MEMORY TECHNOLOGY DEVICES (MTD)
>  M:	Miquel Raynal <miquel.raynal@bootlin.com>
>  M:	Richard Weinberger <richard@nod.at>
> --
> 2.48.1
>
