Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15AAF9EC
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 12:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749213955; cv=fail; b=ZOrTNMUWv3EgWZ3jGhTsCB4sJ0ctdHna2kG2ObfuxKcIBDyjCdwOaFZ0ZJ8lckKTvydTXR6rHgsxfXT97+R/NlTn3ZKxxMDuTWepiwNvi4OEjwDvL6PHsuQlek9Opv0w3RA/BUqMgFDee8BGt7bivfOUsuGezUbsx14HVFvbemI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749213955; c=relaxed/simple;
	bh=3OXFzlhWe36IjkK8be7Bjn9NqsHIu+06lpfbNSlyBxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WRu9Tl1B5zxtf66jXJuIG/+PtIGwMOOpQjVFsePe4XyZtrwJq8wsmQ86b2JfhkqFZcHT9kp3Z+jJmk4ykwSiDVxuCKL55A9b3xt7037fESO5vlb2rj2hHcuvoLS1GKxU0ZCsMks6rlrv5Wh4bBZYbD6bqGnaCeTj9dTnO0X7rAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Z5DXLOgH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gkqusZ1Q; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Z5DXLOgH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gkqusZ1Q"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5565MaJr030087;
	Fri, 6 Jun 2025 12:45:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=3OXFzlhWe36IjkK8be
	7Bjn9NqsHIu+06lpfbNSlyBxQ=; b=Z5DXLOgH0ZB7EpZ+L2E+Vew6w2i6Tlf7vm
	tEIoSO2bEe0WMO9PMb5HPU7YKzSXCQsK0HcKc6gMgn6jB9bdsP2BGEveutB0it9J
	5a68qx1Bqo//i+YfldYoD/ZMYF5xM06icxyCzKVfNXiRrB7cM1PW4M9wLWk6vgAD
	52UPrLlFQqvlkMdhD1ozNgUxET6CfahaYEpvMGpwxRf0LNVveoGMG2gY0CysmK1M
	Pdfp/ZUXOO9tjfd88uxirt1kBUe3if1wLMcNOdv35/DPhm+G+ItAL0E+siw+gc1z
	B6h4hjkHnBEmdf99nnuuZ2EvrN+dxte7T+u5zrJHSYx0nzk4JMBg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8dyxwm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 12:45:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 556Ac9IO040959;
	Fri, 6 Jun 2025 12:45:26 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7dfx4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 12:45:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6v/Ny9BY+wz0GhuOyP3s72jx6pruPT4MvH6qx9/vQdU0cFeGBZb5E3IdAaOaY3MLwArkgy99yDG5WyzmebeIf5vtndrZLNfOfJKiQnQmqX/X7bFBCPScKYicrsaT66JuamhVgxi6kTDigDTdSUeWMDmLofL96b062ugAuJ8MhCAubRX6jZq42PNTuJQqxcQdnR1TYFvp0fikAzCksWK6qTkLhd0PZqU7I/ZVWC8NblOBtpCjZNOwOPv6C8g8YXjF9w5N/d1KpyhZgLwx1e6tEjZ6P5+8LNi2kTIN4o7L79G8ltOSiuGPlneNfSBommUCwXfCrHIAQQFlLFOs0QDPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OXFzlhWe36IjkK8be7Bjn9NqsHIu+06lpfbNSlyBxQ=;
 b=DOJVEXdqUsDJsxqCvneGqjPjaPq76whaxbC9Go8wtMYVvdjtIOMbT31tbHckGzJLg8gnwNmCMkz32eTSNDgKAIX1g5szqEbuo+qyDkZdJiFs/leiyIlUYzti4OeiF4dWAXSe5vMbX+UYdpTnTOvXEKu9kVgtkkJZRLn+92BKQXHJ3GbyuFlAbLiauRFdwHtrOLODUIVvU4lmnbGGyvIjqm1wwreNhC1yoOlIpP6kSjxkk6NvfWeJcuYj+TUjr6yaO+n69Zh1MsGWSSZU8QM2oHRu2ZSAONP1hfHUziUYABab/9dyJ+DE6CdOic5Wc1H2+2SYvfulNOgPq+KozRtEtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OXFzlhWe36IjkK8be7Bjn9NqsHIu+06lpfbNSlyBxQ=;
 b=gkqusZ1QyT+sMJxhMJx8xgrEQI8U5MkmrR10wze0Og53XMwRw2ywxiXTv+f+i1K8NsAwUBRLHHOfw4JGxiy79o1+W3aUCrjUaCc7QVeVJtGqIdqgiM7/AxF5Y1B51FZop1BNZlhcasAwIaZwE5lFvef+HgYwCAuvbNmqJZvjZZU=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ2PR10MB7669.namprd10.prod.outlook.com (2603:10b6:a03:542::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.41; Fri, 6 Jun
 2025 12:45:23 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.022; Fri, 6 Jun 2025
 12:45:23 +0000
Date: Fri, 6 Jun 2025 13:45:19 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
        Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 00/10]
Message-ID: <6a4381d7-1191-41af-85b3-164e25dd9025@lucifer.local>
References: <20250605142305.244465-1-osalvador@suse.de>
 <c4a96aa2-10ae-4dc1-abd8-be91f7e8b583@lucifer.local>
 <aELfqFrdIiwRFQs2@localhost.localdomain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aELfqFrdIiwRFQs2@localhost.localdomain>
X-ClientProxiedBy: LO2P265CA0342.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::18) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ2PR10MB7669:EE_
X-MS-Office365-Filtering-Correlation-Id: cdb721ed-86c3-45da-f5b4-08dda4f800d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tN6v/fFz4Fef3IWMNaPM2ffRT/libaSAK1U2isZPwLD29UvJ7jmvsP3oaQBd?=
 =?us-ascii?Q?7+2AdVQ3KpgjiUQU8vObYxBmiSozsa7Z5O4sF2jftuCJxL6Xoddb1o5El32m?=
 =?us-ascii?Q?J7f6nnfw654QEWrGZ4aZWDFXNUUwfyLPkAha9YxCAST3hz35N7mKgojCWOuw?=
 =?us-ascii?Q?YDOtLjhchAfyPU6uvxDIlN7Ngl5PO+wyrrLqaFntLdJg35Z5rbNpAiTLIRvW?=
 =?us-ascii?Q?TWxkIbim6zjWOcjsYWLL2BYizhVcHfyfgSWASvlWQl5KUgFtoQuhoVSdt2jp?=
 =?us-ascii?Q?8sLTJxdQo8HBgVLPtR46HVLROZuSk5IKXp8gWi6IYz6UgaIPznN6Qhteoh2x?=
 =?us-ascii?Q?AbHiBZ9R7hKy97mI68feK7CF2bYm6jqfPnwUwskpcaVdNwx1oZm7hKNSqL7H?=
 =?us-ascii?Q?L2zQgwLWijCZq3g1wL3PFv80p8Uc4OFYPQb7rWC0CMs0bBEX00oTSKrqaPHk?=
 =?us-ascii?Q?m60aa2ZiPsridqAPgZl637Q0rdxjogAigKC8NKGceKy6+T4jHvX93BN1ioKz?=
 =?us-ascii?Q?erhF/frZXfVpEF5nNOuBxWTkj1G0DVKOJNQMfcrjl4sxy1QTiA84kErmmQZK?=
 =?us-ascii?Q?T/aDiuCK1gvFT3f+2/M/AjLn3KZHT/UWS+GBY+OgOMf3RxcDhi/JKU0euBvr?=
 =?us-ascii?Q?/FBHuMWxoQUhlyHI71asDvOAsdAn1h/hyDQEUxC6ke2icrEdGvQ7KG7QuWbo?=
 =?us-ascii?Q?k92zu9efM2BtYTiYSYg/KSuLcc3ZUTdJvHxWrzYzqskI6xvg8TqalsDhBtUw?=
 =?us-ascii?Q?TTy74qDH8WXsBjiZB0cfxUr1MHZ7yiOMugIcYr+KI6IDPinKXN13Rs2d6zfl?=
 =?us-ascii?Q?NIS+pE3FSF+RU2AGfuGQ0Zjbo7zzvg1D/8kB2yvl5EMitZlKAfa+1cTPYnFp?=
 =?us-ascii?Q?omrC5PRYiKjNisQBYwGJp40RpMiq1dJnCDQy0jumjlnf0jJYhp5d3ku/xYVl?=
 =?us-ascii?Q?DGEDDHg36ORnRDxu0oO236FUMeQcZaBHeg0G5OKo0F2AdxDMIocLnsaM33jF?=
 =?us-ascii?Q?fB00YoyKlbw2DmVa+rMdCIzN4cUUSAi6zmzIfGkfBN4qW+nn8GbqCGqQrmZF?=
 =?us-ascii?Q?aH3NUXVF0ho5d5flpx1FEzAKDn1KAoVpdvI6DaYq8e4Ot12P5BzIT8SYqgVm?=
 =?us-ascii?Q?OI/HXTnG1BkPAN5VghldR83ZlxA4nfjDtC+Tv3NOfLHgzaeGZMIG5aAnM/Mn?=
 =?us-ascii?Q?8ejxnssP9GFlpGir2OfM9E69qMPw4afO9XnE9nYzmD4UBY7c7/oB0vHIhxby?=
 =?us-ascii?Q?cMhCsxK/3UkGZLtYlNBhPhFRiJ4yMF1bTLyG8FY8lnIcKgEoN/tQSMfEjpkG?=
 =?us-ascii?Q?UgetHVSqndVwWZmOy9YVSvfS2RPrBvxrkS6RGJkica5samAEDKldGgY4OcBA?=
 =?us-ascii?Q?9ojPVLOUi+liB8OffQc7iohieK9H8LaelmP08pr33p9I+nOWNyfiBKDybev8?=
 =?us-ascii?Q?4BIp9UVZsnw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Fv4QkVGtS+6tAf2O/tDi9jakbnodhEIRGbfC3FeP8C6JPDQfgSh22w++jd1C?=
 =?us-ascii?Q?G+495ljpqNVRwdDOFAmyhlv4LmSFetjBiFUpHCUiq4M0H+LmOLNwKRTfxXby?=
 =?us-ascii?Q?2i71d8iJXsOB7LgnX79vBhOZNXhR9XioP+cTo8vpmouXvH6m6B+G5lxs4Cl2?=
 =?us-ascii?Q?Bw1ga9jhmzGGk80tX5yrXoG9L/rSrm8w2cxByBnqjlc6KF0cGHtlxvp6ec1P?=
 =?us-ascii?Q?Dev4E2P+0pEPEbJBhx+U+6k7umoVPCdEqgdcd/bdT0/mUct5PkthYGGt4jER?=
 =?us-ascii?Q?1wSVaANXdyA1b2k6HIDQkANkTXJfMFeazKKNca7K8WaS2gXtMkyEkFvkJ93I?=
 =?us-ascii?Q?kP2jxq98Jq64IFspNrFsF91lHGz9VqG/Ze1prncx2ixgxl/xeT+p+gd1LJQv?=
 =?us-ascii?Q?fHsMo3LZUg5QLVaHp2lFL5KTferAEIGZDsP/ZT/WhoI+e+oPY4cSYmuQi+Ro?=
 =?us-ascii?Q?Kb1aVyPGNiYbCI4b6Bm8GPgBtSh3u6grGtpLJhEvjmqRd9iSQhOiihUBz0RD?=
 =?us-ascii?Q?e5Ts2bPTYhiWlDBqzWEk3zy7I9n5i5f6h+PQEtKYeMQaWx9iO6tLVRBZCBmR?=
 =?us-ascii?Q?iG5f9HhbDmWY0S172jDkM8YevXNIIBnRXB584saTSBrfHeNaf/O6i5A/EjVu?=
 =?us-ascii?Q?+FnMQMvBcAiy0lguBcj7RnUNEkq7lVccUh/7grOSYNI/e1ABeIa0AeqGJ7/Y?=
 =?us-ascii?Q?x5r5J8HKSYFmNJvBp3t8vp9p40lQqfD0Hh+bQLqL75E/sxCnLQLezZrcmoio?=
 =?us-ascii?Q?b1WGyKeXH2u7j6uoQAp/SHJwYCVc+boM2+d6d3Lr/8BoCzpWRu9KMKFkv9YS?=
 =?us-ascii?Q?4zE5tqKEWlznFNAldbUonQCqcVi/3AdGD46H5Q8t55WQFbOdB0d4Vn7s8eqc?=
 =?us-ascii?Q?Ms0MB9f0PoKDSTv6ibaU41+3J5PmDnm3wcPRIv8oRVlgcXZp/gkUIp7/caps?=
 =?us-ascii?Q?xcyDvQSLEYaDGedWY/ddRod8+qoftYVHZy7zCzNuD852SOB9RUxWpG0UHLQa?=
 =?us-ascii?Q?NUBG7Sv1rTocXUkHqq8J4Vxt3IGTRKxbgsa1aGffCygrqsCR6U7I2tejtkGU?=
 =?us-ascii?Q?SeuB3vIlkJ3SyA5RGLdfua+qACdGd88zK1C+1AKUoHC0N3ZJ95MRlA7IYa3M?=
 =?us-ascii?Q?eAjy41qN3rAMIAVm7ct4TlfvF2sAGT2LOjVyL469xsDnYVGidus539rK1zj3?=
 =?us-ascii?Q?mhJgaMaru1l4q3QituadSiLtGMu5XFndfPUfw+FN6iZn06dd72OK21oQzDGK?=
 =?us-ascii?Q?fcuISKti0qxYgzAYJ1r5kEEuKptPLZtXVsj6t6E1YAsjY+88jyX3cq8+6/XF?=
 =?us-ascii?Q?3M7llH/risXA5CBb+hkOH7CEsCZC1wZjleFsjaSalWfsX0ZHO9LJUdiVb+S3?=
 =?us-ascii?Q?n5T1e0Fn41ZfSGaefBCD0ziZbbD7ecYGPgBdQzbx+KXaZmzTRoRzTJsqL8bI?=
 =?us-ascii?Q?h+Hn3jZywZqkcu0b298TuWnN7k6UMVT2oHZoAy9m8JodnkPT8dL6pAj0j+5C?=
 =?us-ascii?Q?ckm+6WB1G7BDAhs8M6LPc5ql7ihjIlWtV3L/Z48GiXsVpI/oFvGvvCeEwPTy?=
 =?us-ascii?Q?DJkhG5fb0HOFOOKhp54Y8X47NIj1M1qS1BDik/CuUSb4JDjo9KgY7/GHUAZv?=
 =?us-ascii?Q?OQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Pv1FjKqKzpa2s9DuR6rJcFW1rirlFA6woG9Zci97/oQNnM/SrWJLAzuJJf3/wIIN61BOQfWfbOpfxS37DYuuUzIG74GVq+emDnRITPWkmw9wdsCJgwDSlumvW0dkrZOkcapUZXhvEEjOt9/mGQUoWyaEtpq7kn8FqHjGG7WhFCWg6QKButU8VUZTdZx7gbVLVhKgxGKoqMx4Pv8Uwf0eVYtCOewgPJx//5KOd7oyOMIxYDxC9nzhW4OTl53GF3lnIu8EAn1KwvFvGxtE0chHExiHh7ObANu+rzczFRljd1UZApb1IpyGlKFxBNRILm2U4fA9VUsnVmLokNApC7AN+RDu+EBlTYacB1uNv9PqNcbcmTySFwZCTRlhovxDo1yqzh90zSgFSpc+U4AJDuvwtmSGIK6uKnh305MoSyPhFOk42hmi6WO2rd72ELnWY/Y77ojXl6zhSytaXRGN1BSl5aIkeSEpmwmPGmLI/8d53mVnQc7i9LfQtWdbNzwfAMV5hTcOREp9QBhSwIOgwidP/ok7k2d1OYHl+6EvXI5p0ta5/9EdTeVnsCsHTIgWaz1yyZSENPmnPJbZ0hzqlHnpNNZuuVPSY8fwQBCu3lSF0d0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdb721ed-86c3-45da-f5b4-08dda4f800d3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 12:45:23.3407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rY81F0zlJA7DheUXUD9ig6/HU9XqpuNq7vP8sF6+wwR922Jf5SrtBXZF64lcsFzYzbkTT4lZg8a/Qy8NT6sqyQBXbR0NwUKi0J510Om/m5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7669
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 mlxscore=0 mlxlogscore=783 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506060115
X-Authority-Analysis: v=2.4 cv=Va/3PEp9 c=1 sm=1 tr=0 ts=6842e2e7 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=aeQPjN3iLbsYLSR27tkA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13206
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDExNSBTYWx0ZWRfX8HXrxBDXQl7I ebVcLeeA8MlMhdjU3IBur/ZwSMRfV2SXak1E2pdj6C+U1P5mwWJtex9hDLiAb8cSpEp/+4RZx5J 3ibtX/ND34cfP3TEi45h+5mYKxatQnkwj9acQOcCL8f9teLo3Knh6kn2bXrZb0CMtK3ZT7et5vr
 IBHoIKYqR6ytghA2WaBq93pktdzrvgafsv7P2LvjHhYoAwFnJvdoHEQaSdYirc67zJnjuZXqS5X ccit+TSEz2s0JcNoZM75gze1i2/cl8W5eULtKSlPc2flBl1Bns3mLV6bHBCTxxviMNWK1chBiNk 9lksKBfcCJeJzVQYqQPoS0aRSmj66CZLrwtBczRJx/fU4Yq8zXBw55krS957UkBIYFX3FgRgH+m
 I/MQjQuyQLnlNdjh0QJK7xNXYQ5GITmqPoYH6wQAmb6m40gaarcpRxAcFTBQN+qHTNizfsDN
X-Proofpoint-ORIG-GUID: w_jidXDch6kDDAjdKr955Cw-NMKqgpR5
X-Proofpoint-GUID: w_jidXDch6kDDAjdKr955Cw-NMKqgpR5

Andrew - as per below could you drop this for now to fix the build?

On Fri, Jun 06, 2025 at 02:31:36PM +0200, Oscar Salvador wrote:
> On Fri, Jun 06, 2025 at 12:30:42PM +0100, Lorenzo Stoakes wrote:
> > Hi Oscar,
> >
> > I don't have time to dig into what's broken here, but this series is breaking
> > the mm-new build.
> >
> > NODE_REMOVED_LAST_MEMORY for instance doesn't seem to be defined, but there's a
> > bunch more errors.
>
> Heh, I apologye, I assumed every config has MEMORY_HOTPLUG enabled.
> (I'll walk on my knees all day long to make up for that!)
>
> Fixup was posted this morning in
>
> https://lore.kernel.org/linux-mm/aEKdvc8IWgSXSF8Q@localhost.localdomain/T/#u
>
> But we can drop the patchset for now as I'll have to respin a new
> version including David's feedback.

Thanks!

Yeah sorry, I tried grepping for a define and it wasn't there, but I guess I
wasn't grepping at mm-new (I rushed it, was in the middle of looking at a syzbot
report :P).

Also a small bugbear, there's no subject in the cover letter :P I mean I
appreciate the beauty of silence as much as the next fellow but the cover letter
subject line is probably not the best place for it ;)

I speak as somebody who's made literally every possible post-send-to-list error
known to humanity, of course :>)

>
>
> --
> Oscar Salvador
> SUSE Labs
