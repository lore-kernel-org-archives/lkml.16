Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21C6A92E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 10:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745229669; cv=fail; b=AZqyUTjEw+JGbT0oCQTQfkOoKu/LauAQu3zReJ6aks2qHe6X1nOWMRPxKpphMMl1KYyuA7DpQIR4YJBLmIiaZfmnI4lUA7rgxuiPPE+OQmXmV1hEG0hmoK4hHVeH7ZmRx0JWM5DnjqQxm+/X2ZwMi7nmXxXzmo3N621ospMWIuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745229669; c=relaxed/simple;
	bh=BtE+5gFSujJqykbK+kxSHc8ULLuW+Kby+Q6l7xSVeEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Q58zshFuuLhmFRCCFA8Uwgxv7V0C8iLVctovvd7nDcKwVyvwJNGVnE1D9aCWAbZKwhNIO0pWAMGgwyzj2gJkHHmtHQQUQ0xhNad29w1hvQWp9bwlvixJFKQSTS/960Pz5amDpl2XnYH/z2BwajZF1+5EYLaGX1860IvA2L1exPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RKhkVcac; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hyX+Dczq; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RKhkVcac";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hyX+Dczq"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53L1EuGV012235;
	Mon, 21 Apr 2025 10:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=Z9hDtWGy63JZwJdZL4
	kLmZPv2uw+diVhFTrgHO1afew=; b=RKhkVcacF+ymCWb/87xFDcE9XC7QjXxtRh
	t3MLKFnEW+HMC0zQIU1BG1Jl8KMWo6f742897fl+dt+Cy9ReyQHO4GUlf5WZtpmg
	OZZh5I67GIkfY350kS+AMFGOSHGCnTMKyC6puEsZrc+mzZa2eMPbnp7gtGtqX9Ut
	l5RVOeqWMX6VCJgRRAH5h1a0QPNAqFgbkuAXQGQquJq/7gWZ45D++V0B5XO4yL/d
	UQk/DWLpnzAXEzhbgn1wVOc/TEzLR+WDZ+1JIXQuXsCjIQx/9jbGixLGSHXdAoiy
	HG3tcUWmWZAOfCgHf6I1d31TwU+YuHCeKFjkgQ/p9G+qXpfSc82A==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4643esa72t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 10:00:40 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53L7YPZV005814;
	Mon, 21 Apr 2025 10:00:40 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazlp17010003.outbound.protection.outlook.com [40.93.20.3])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 464298371u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 10:00:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fmp6qlTOKMRgTJQ7NJxXwUg2GTJtjBEkaybnPfhsDAR8m9NeZfjXPUhY85w/C60OLYvh+/Jy7awfSxtQReMY+KBpqZAXbwHuqIREbiiW7bxjzcjI6RCeC3i9hXI9jq/06OBtjkHV6QmCYcw8NTR161JtANKlBu5lya0+k94dbsFTv74NvZ1B+MsD1PGl6x2h09Uu4h1ad6r+Mybe5vrNOpwM8xXMzYkwCAuu2eH+0JxJpltT7U7XesyRMAV1XjgX2Rp7JfXrYP8AT3EAAlmwZGJHqzyP/01bgQ6k3fJjanovKQ94kJQrpiQF66H7EYetsCaZzmXLq0ndhdvv2ObxNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z9hDtWGy63JZwJdZL4kLmZPv2uw+diVhFTrgHO1afew=;
 b=VayYGb+fyugVc/pjS8U/sjrpQfn3Qa0aMw0DUxS7ZVro7lK04zmmGYDVFIf6ResT86HyChCQPAveE1O01eJgUkDVENXGxGQUb/CRcX0qVZSTWxmDk8ca0v/QLcipzSD8MewTqM4yxPfApTN2S5ujfSBTX/Z68u/lnDW94OLXA2iE8TUHl834VACWfmuTHqM5pzGkOhyL422XxYeJcEW/iN9hSSqMFiKzdePwLj9OB6+WjLPpQle8Ro/McL9UMnSk5CqhvbhWlbaAZWtobqXbd6MaqIJ3nCthpXGKkH5bF8IxUU4A/6NSnlZPjD6GbrWdh+Fjq5vpT19oYINWn5bwqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z9hDtWGy63JZwJdZL4kLmZPv2uw+diVhFTrgHO1afew=;
 b=hyX+DczqnB73GToiqokBADj5tMjLno2zNaVNfBQs06nAK9UL/qXMQMfo0AwMcrYYYP2N+Cl72KnxNNZEwnr8wGlTC8eTrz8ooywurVD3dMwPY+c4aq7J1vfKUpVOj8dYGz1YTu/0H5mFvgjI7kNyPVOxEd1Z1+GXQkHsA1oIjiU=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by SA1PR10MB6520.namprd10.prod.outlook.com (2603:10b6:806:2b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Mon, 21 Apr
 2025 10:00:38 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23%7]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 10:00:37 +0000
Date: Mon, 21 Apr 2025 19:00:31 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: Tianyang Zhang <zhangtianyang@loongson.cn>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Brendan Jackman <jackmanb@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH] mm/page_alloc.c: Avoid infinite retries caused by cpuset
 race
Message-ID: <aAYXP4f417_bx6Is@harry>
References: <20250416082405.20988-1-zhangtianyang@loongson.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416082405.20988-1-zhangtianyang@loongson.cn>
X-ClientProxiedBy: SE2P216CA0136.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c8::8) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|SA1PR10MB6520:EE_
X-MS-Office365-Filtering-Correlation-Id: 350014ca-ff22-48b3-265b-08dd80bb5dba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uuicCRMSNIryuOs6IyWnEvF+sKDFBquLTTqY2opBHafKgc+avfZI699r/QCX?=
 =?us-ascii?Q?FfgQixpzz9zinH3sj7VAHsovL7IwPAg1LVzLK4OI4whOlzOl8RwmsqM2YP2X?=
 =?us-ascii?Q?nezPTj1ki6qwzx+QbwWF8dWFb3WhYR/bUbw6GEkGRzqUdRC9JD2Nk6+GG7TT?=
 =?us-ascii?Q?NRCFg9SWaNLoFeMaC2b/lxtW1MT/Sg1zlrLSczH4MNIoX/d2NPunAEqa0V03?=
 =?us-ascii?Q?clvoWoPzzMZHfPOmdP2SHsxvq8SQcHe0YFNPTbK9lzrlsPfa9vG/9aDmQeXs?=
 =?us-ascii?Q?kSxR13tO87IB/XIVVlgLC5RVVtq7XZ3Q5HpJd7oW79CXVJozgPp8CCttPYxD?=
 =?us-ascii?Q?JY/G3aECnxU01BwE8izgidGaQFrHvUp12iWlSyA458X0+DHkO4/+rxjcRa1Q?=
 =?us-ascii?Q?ln+rCpKGlA8h2+tCPIOYPKEy9gIjEyOI67AmqcjFfB6Gw/JCrZBbGOJQ2hMW?=
 =?us-ascii?Q?AXwCwAxMkoUc7xdlGalITNtG6fTfzt9LT3Xnx3f0l0nleOAYQxU2MxUhMR+d?=
 =?us-ascii?Q?+Pby4D3uegshQ7UYp1H97hF3VqqIC1SjoW9t8ScYP55hXL0LdV14lw3cjnOB?=
 =?us-ascii?Q?xQ9+HojDR+HnH0CQgfjhD4RROaDxPe8GEVKCPAaX1xb9DbxykiIGi0QSjQvx?=
 =?us-ascii?Q?jA7KO27swv7p2Ir53q2WmJp3wc5ROwCz7sRRojdaIxiNT+ITz9pPLzLBozNS?=
 =?us-ascii?Q?sOcE9hn/yrR+ughmZN/voS5Az76ByKSejn7hM3DhAqDUImVzP4iSI11uX3KU?=
 =?us-ascii?Q?ArqAwzN13eiZk4slc8yK7Og6gHHHB0KnRt8Doa6aaqSHuMdG6RLo1NUMH3Oj?=
 =?us-ascii?Q?+xXkpNLE254X3fJwpEDmMGQQXeE23B1xPscbufn+QADCwpFk90MbmbF2Ut94?=
 =?us-ascii?Q?tcqMviaP7U8mHjGpwc9OUoI+RoLJUMLf0ic62tgevB5jkUO4QGhsgYzJVQcw?=
 =?us-ascii?Q?YgjPJw6BOp8nwSCKjYZd2oTRgXxR4/80eCe61l29AFDUyLG9pXWO7k67oDV3?=
 =?us-ascii?Q?c1P3sZ13jONwTmSzVXriyKPuh4N9lAx4H54HwYT4tkenK0bHxXJ24Vpf/xHj?=
 =?us-ascii?Q?MhoQ6uq9IVa3wsNJk2zjtlXslt8B38vKaphedwfBAwKA20dNRjrEtp6wSudS?=
 =?us-ascii?Q?VUkHQMQdJq5lAjTaam3MzvP3vA5znjebwkN+zsy5W73WMZdnluOT4zCWzEs9?=
 =?us-ascii?Q?h1yVzvvn+t6p4z1r6sdHgQmjh4ulGVtO8TYIN30z67kSfsq11GglI+bc6OSe?=
 =?us-ascii?Q?07XVNaZAYPz+tMWgM3vYZq0i1ZjXoC/sazf6rtiaVY5nYbG3x7Me+zJkXgMg?=
 =?us-ascii?Q?29Im/Q1mIaNRwJRbutPBQsA7Z1H561GmdGG5T1u4jbOOOAilxtOIhPJsG6y+?=
 =?us-ascii?Q?s5MbNMPfnZmGtNThf2of4qTfiVFHo3YHV0qYQqbNfH3zwDAixXj5YkNOuoIE?=
 =?us-ascii?Q?6/kyTcTUHZY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9YeMmWJvGtoXVdtr++M9qBInin6fw4t/xYWvVKg4nn2RRaBUysYM2b/e7yTC?=
 =?us-ascii?Q?xlnz3zs7HVzc0yqJ5CbJmyrmCsz0QB1JstjuANl02O8E78q21+7qljxmEAnm?=
 =?us-ascii?Q?drZcrlSJWQ+XlSL7yjCxZUh9dDCW7FIaybWukCt3UmMT/wtrbc5GHvvgCkxD?=
 =?us-ascii?Q?H3KccXUXju9RFy9Bd3iCvKle9Bf2moZEOCC12NWAYJKnD7TQYvpY0wttE2uc?=
 =?us-ascii?Q?hf/Npl7wMeTkFGlOJfJNDlimwdBsB77unzXVNf97zoKjEXBoBYbMe3WYtSXG?=
 =?us-ascii?Q?MysvgTvDHeutJJq+puc1TTFdSNMVy8o5P8bVPC8Lwpcqehy4FmrzvufPu/R4?=
 =?us-ascii?Q?OJyDBhaj7A6yWTo6r14q9pnNKreGP8xyLGEN6pKle9/DaQi89K2brbx64/5R?=
 =?us-ascii?Q?5bXNtOHl0WqyNCRgzjPQ3gPA8AXTQhEx/0gJm72m4iERvA36dDc59UQSZC9/?=
 =?us-ascii?Q?NtZNGCysolEbfNU8Np6oqycsR4+FA0wfHmA8KKDeypgSrWJ6dJiAinEWXa13?=
 =?us-ascii?Q?NxqoHm+Z+eAHUG00QMX1HY63RpdzvNBwiOcyyYiobHP9c2VHoprs3uoHI7cs?=
 =?us-ascii?Q?m3hENKhHKmBi3xSWfZ5Ied5OIo4++ohy5OGe4LNQH84l9fZQdxXhC5dEme7/?=
 =?us-ascii?Q?nyjJn2D/OwtfRE7WdfGn458gd1VQwetvKe2QJjuH+UwzkRx8YLk7u4SXyy3h?=
 =?us-ascii?Q?9sNX8Rexv/WS3Q+Vg12v/xwt+E6laztfR8qHbyYHW4NHpmp8d9ujiaVLYe49?=
 =?us-ascii?Q?UTeYuaaHY1ctG+qXOlKGCtJr+Ny/KMIMOM6s68LQZiu/mDafuTrP2hrO77Sj?=
 =?us-ascii?Q?P8dasMhH5JNp6QYSvUDWdHFL/GeUnHp/n9frhyMSsxtv7nEQdyJkvYXHkQOm?=
 =?us-ascii?Q?WFGy0mkn2mBWkpr3H6hBdGm+6dD5uUKM94Uo7u5tuaPk1RkAyMIqxWJpnY8A?=
 =?us-ascii?Q?kbZ67tR/Tt6nC6zwwh6jnwPOuAWSzxTCMxGP4x2vyc0tkahHixVp7MRL2Ysd?=
 =?us-ascii?Q?xzhCnUNtLdfPnFdON4bVkx66sgygMsUeSG+AcY4/DDrlQrMdPI66NbCcf1M7?=
 =?us-ascii?Q?scS1An/6VFsl2qcSKwgFP54tR8L6PF4lwi+uAyiWFoZHxibtiWl35uEY1Rtp?=
 =?us-ascii?Q?b0EaPvBryf150WhhNfeZ5FwyH1UGejqD+v2IpEk0aP/Stf1LJamiioJknqpt?=
 =?us-ascii?Q?TXc8GzwMXPXG5IYo8cvWBLm32IUJvjLFz1syoIIydUxy/Y69i/9ImCvAMT4J?=
 =?us-ascii?Q?dm8u4UljmguMioWdZBLnVjDkQEcFib3eWNXN6N26WNw9/HxU2JXddioedCRF?=
 =?us-ascii?Q?4UCzpXaJ/12TgYTKUuMbD7ihLMsrY8LYLRARmfS3RZHQwpgXJatOBhFYS1RJ?=
 =?us-ascii?Q?wuTPxjIVHJmrGEvA6GRewD+db8OAW7sm2oeB4v+uWG4mVS291wR0PCfTpoHb?=
 =?us-ascii?Q?K97Hg5xEtH1Kl9sH7Px+2dFiPBPg+JgM4sc3Mm25z5OcLGnMFRu/kAs7hcjP?=
 =?us-ascii?Q?Mg0scdQrSC2tpp4arht/GXgEDI7bmqlVjI4sypz/8CJqwB/C8ePma/XnKJu6?=
 =?us-ascii?Q?ZxiX3OO1Tb5Padu9aOwWXRCeR2Tg2IsesoZ/q1ej?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Q8xuYT6t3S9tD+Rz9zJW4B+xdBsAT6LqCAh9VS4Hy21yp2PmflUM5OdZIurOxKM3H3gOYu16Pu9xSWMOfxuST2eZiJ/8d0myxiXCF+TCTk+McLh/Kkau/FCKb2J4nuvZ7/lEYi/OIvLOLEXCKgo/UZso/WkcokcxjkqHO4r2YmU6FIgtZ0QrZ9n2efpBgSdvRrdZ7bkA2TX2HNzTlL/zsiqaGAkeMUkO3X6yan3YVfTiejxy6IETPAHWekCGYN077OlcqH1qlJGkfNV7pWZ8QMNA8FWvXEAY6dql93fXe9Fq5GZ00+Vjgu0zZ+ygMdLxPoaoj8TT+Y3hCbMFmlXjZSfvpxyQoFNzBwXP0BEplnNhacd0qoBpo/WdHXd32rDAh5zRW01oQTmuwh00klKFWosUsmxUNfsOYtzK5VNJC1O0H7gGiRzEJJA98mmnRj70CvgJLWLjv/wffFEOqZvlSPA9DtutFYL9tFIWqB//c+wCzGh5JkY7VuLb0hQLxA/v/KITFvKNWKor3ar4n6pGBhQlQ0ExTjpIMmlEfuTchc7gXYRoC+6gJ6bPZVK6Sc21ZzA4ZNCg1dpYBn/5iKOA5cs9h48H8Jat2+4BjE0Seas=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 350014ca-ff22-48b3-265b-08dd80bb5dba
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 10:00:37.8305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h4GY0WbX1a0NDrJJx30VCdx6629Mw+wggXGsrYgAmjcPeOwuUnmodK+i3X6Cepz/NwIyaFJQWS1AzhFgdC6LRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6520
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504210077
X-Proofpoint-GUID: 7EMV0-oFhGiQ5rjkuSJeJyqLUuXXbaZC
X-Proofpoint-ORIG-GUID: 7EMV0-oFhGiQ5rjkuSJeJyqLUuXXbaZC

On Wed, Apr 16, 2025 at 04:24:05PM +0800, Tianyang Zhang wrote:
> __alloc_pages_slowpath has no change detection for ac->nodemask
> in the part of retry path, while cpuset can modify it in parallel.
> For some processes that set mempolicy as MPOL_BIND, this results
> ac->nodemask changes, and then the should_reclaim_retry will
> judge based on the latest nodemask and jump to retry, while the
> get_page_from_freelist only traverses the zonelist from
> ac->preferred_zoneref, which selected by a expired nodemask
> and may cause infinite retries in some cases
> 
> cpu 64:
> __alloc_pages_slowpath {
>         /* ..... */
> retry:
>         /* ac->nodemask = 0x1, ac->preferred->zone->nid = 1 */
>         if (alloc_flags & ALLOC_KSWAPD)
>                 wake_all_kswapds(order, gfp_mask, ac);
>         /* cpu 1:
>         cpuset_write_resmask
>             update_nodemask
>                 update_nodemasks_hier
>                     update_tasks_nodemask
>                         mpol_rebind_task
>                          mpol_rebind_policy
>                           mpol_rebind_nodemask
> 		// mempolicy->nodes has been modified,
> 		// which ac->nodemask point to
> 
>         */
>         /* ac->nodemask = 0x3, ac->preferred->zone->nid = 1 */
>         if (should_reclaim_retry(gfp_mask, order, ac, alloc_flags,
>                                  did_some_progress > 0, &no_progress_loops))
>                 goto retry;
> }
> 
> Simultaneously starting multiple cpuset01 from LTP can quickly
> reproduce this issue on a multi node server when the maximum
> memory pressure is reached and the swap is enabled
> 
> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
> ---

What commit does it fix and should it be backported to -stable?

There's a new 'MEMORY MANAGEMENT - PAGE ALLOCATOR' entry (only in
Andrew's mm.git repository now).

Let's Cc the page allocator folks here!

-- 
Cheers,
Harry / Hyeonggon

>  mm/page_alloc.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index fd6b865cb1ab..1e82f5214a42 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -4530,6 +4530,14 @@ __alloc_pages_slowpath(gfp_t gfp_mask, unsigned int order,
>  	}
>  
>  retry:
> +	/*
> +	 * Deal with possible cpuset update races or zonelist updates to avoid
> +	 * infinite retries.
> +	 */
> +	if (check_retry_cpuset(cpuset_mems_cookie, ac) ||
> +	    check_retry_zonelist(zonelist_iter_cookie))
> +		goto restart;
> +
>  	/* Ensure kswapd doesn't accidentally go to sleep as long as we loop */
>  	if (alloc_flags & ALLOC_KSWAPD)
>  		wake_all_kswapds(order, gfp_mask, ac);
> -- 
> 2.20.1
> 
> 
