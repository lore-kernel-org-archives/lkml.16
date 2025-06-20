Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8B130E857
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 14:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750429106; cv=fail; b=i0/gakYrI0rjKl+6tN1IePCBKn2qH2q7bgrJr92/N0ORPVhDr314Cz4uCXtQELNZnKgHcaUDIfDzBmie8ZG2Ps5sCJ+ZLnFbKsFyt56ZpE2rdBreGVLeV2sylIyRotJbhyXpmyVSxcOmQ5h46qJKL1GoIzPYZp1kd4Bb/JJWjkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750429106; c=relaxed/simple;
	bh=ZsvJnFT4EnexZp9IEtj606rZmqsPhrIWyUw0vL/OiB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IxuBVaXVm37wG7F6hnSf7sKqob94aIf0sLF8g2S/c2xFx6OYpIdx7uHVvZVaY3iyvZlGANZrrN3Uc3T2eQ+tSoE2tZqQbg7Gfe8kVR7F0E79Y4CQIp9hAxonTPVN20LIbliKbU4oG6zNzjvEQZ0n41ySWFZ+yVw9W1pSlKg9oU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=pC1GhQ4k; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=0Eh02M1N; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="pC1GhQ4k";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="0Eh02M1N"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KEBvcp023328;
	Fri, 20 Jun 2025 14:18:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=draRcK+hQMtwJVSHAb
	h22q9elc30f5b3twx//G/ydLw=; b=pC1GhQ4kJfnLHh2dEp4rkKpZuzK2GLtiT2
	zZroVLRPU+SONbPFkfx+Ohb11tenAsz2Aos87GoiEPg95ciowhFDcALxfLog9tJ1
	zByRuLnhhhMpHA87GZhH2LHBoLppAYQzbjDqUBkJnTpCVniQIY4RSIv7479fn678
	x5VUzZMZh5qJy9ZuDb0auWpkdLM7HRLIxiIyMZx6mYsDVMTvs/5QLE710rUGhtnj
	UOMRpOQ5JUvwwcX21syJ7/Hqhq5iZVmNW6APmvPe4jlmpfHO7zAm0wnkQrfL2qB2
	zdDmbk/Lze+SC3fF9G/DtbaXSyRejz9fzSp7ZEqiIUQUfS2rnkCw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yv5bp8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 14:18:01 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55KCJA6w009746;
	Fri, 20 Jun 2025 14:17:52 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhkfw4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 14:17:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M0C5K/Vz4a4BkjfoZC2MDutJ+JJVX/8Obmn/w/0lfTfPFxl4JZfyu6kzu0xzJ04f01mAOiz6+u4RNtQ3UZ8yhe3k8YCzEexzg262XjlYJi10sswbY0UA7pChbqCT+1tuNRCOT6vxitrGER0xzdS9+D7o8zq8U8jrWpdHe0+PsGW8cPRtAPcGOIxNuzhRSS8JYOwHGI3vLGWqaCR7pJOdnPD5Pswhc4bHhNhLxaflgpFHTQK/Rw7+vv5CgnJPLt+4vubcXxkfVll5Xxt7YNUZs0jOVzngTY9vjEbP14Ld5NYWrxMF9GhrrQerimtYGMCyyj5RgNkrNvV+Q1s5jLocoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=draRcK+hQMtwJVSHAbh22q9elc30f5b3twx//G/ydLw=;
 b=MZK4dtqsX7he9jX6fQJJ15ATQyyoNnkjbzDP2zHtG21U8Lv5GmgGsfouNNnKt7c2DBElJM2BPb2knAW3QlovbqpaWqqecNnzPeq/0Ufrei+yBLB+YwnISr3uND40NWiEuMmI12zzZ7q3NmU457O1U39xTt21I+Q/y/YjeTYpSf9J2oFlkLJrzXCiWTUiAJ2TRpAEe9uLH3MUu/NVHWmf0CRuD9Fu7EXo+8WybrfLaIyqt3qbUEJ/KNrZfJijKrcviYa/WKjXuya6H0KMTLaYTP5dfwD2qgvbal5mH0FBbYdQrsKjaTdFt7zz9V6bLSAo1oCj4U7O/HQQZP7rvB4+jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=draRcK+hQMtwJVSHAbh22q9elc30f5b3twx//G/ydLw=;
 b=0Eh02M1NbsoWkjjX1HSQtXzqrTn/8MKjzTJacqH0J2k65OyMNXmVmegW8fSkxjZhdSXrI+Fdd3nkThHFgISWoo2DcgLdmKNNZ7elLXp/QLnAH3N9auPHWgHhxbw5/dvQzn1LZzyJ39p4aLHFYYyFNZQqnP47RgQWwpP9hsEACw0=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ5PPF61CA724C7.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7a2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Fri, 20 Jun
 2025 14:17:49 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 14:17:49 +0000
Date: Fri, 20 Jun 2025 15:17:47 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Jann Horn <jannh@google.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Lance Yang <ioworker0@gmail.com>,
        SeongJae Park <sj@kernel.org>, Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 4/5] mm/madvise: thread all madvise state through
 madv_behavior
Message-ID: <182acfda-ea9b-44d9-b994-285165c5461e@lucifer.local>
References: <cover.1750363557.git.lorenzo.stoakes@oracle.com>
 <ce41fab11efac21ba28b89328276076b9e389093.1750363557.git.lorenzo.stoakes@oracle.com>
 <2f6a2210-7327-4270-b072-0047936144c7@suse.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f6a2210-7327-4270-b072-0047936144c7@suse.cz>
X-ClientProxiedBy: LO4P265CA0117.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::20) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ5PPF61CA724C7:EE_
X-MS-Office365-Filtering-Correlation-Id: aee67657-04e9-49c8-f51f-08ddb0053c92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?I1O/PSrc2yekL8mr8sZSBuabZ5M1PO1SW+R0hb3lLvaVjibya2uWnGKTBVuY?=
 =?us-ascii?Q?vQIbDOvJKNwtqibkLl1uX6G97Vq9nw3QWQmi+z69i1vVTB20RZWGF5WwKo9s?=
 =?us-ascii?Q?Y6fumGiytaW5Ej+W664Lw8Sff8znksHFUgq78nru1OgvC8BHQrQDt2fntBbZ?=
 =?us-ascii?Q?WgthRXgGq1PQswjMIX7C7H5eEQoFzXNQGG6rFoqAr2JYNlBrqzFN6280Sgd3?=
 =?us-ascii?Q?BdAlMbOlggjv02GEDLgjPVCOHuTvNSFlML3pqZwDKckfXV79uHXX3VQVHjhT?=
 =?us-ascii?Q?2QB7cusZOXybEnzsHwmg1NoMiUWkZmK4RRY9Ih/EcBW2rYKVG/g4IDA4/HS+?=
 =?us-ascii?Q?Kwgt02MCgApt2MB+eBO+8FEtspQf7HzS5ssRVvNN//exyYZn5vXRu6iWJLJS?=
 =?us-ascii?Q?CZyu/FCH9cAGINbp2fG04yDpT0AGokFN6sZH8cR9W0Dbn4kC35G+ADww2AW0?=
 =?us-ascii?Q?DaPZLDwxs6W4w9i72kqlL5bwax/Hffojjct7IylFp6U1hIHVjl3rwFPZwyVb?=
 =?us-ascii?Q?huh9OUarI+kCOcA26FdubTMzFaVRjVDl9EGoNXW3WghTN/zGGCGltlCdnIr8?=
 =?us-ascii?Q?lAcqYOa8rTqA0MGOiulXuTxX1RwzExHAHloJevdGTmz2UxvsBdv0S/5vOwiO?=
 =?us-ascii?Q?fr2R7ttQTc8Su6RZQum8YhMxyCAEWsa2kLyFM7Ic1oZ5QeLQ/6sNFFTTORFb?=
 =?us-ascii?Q?OQ2jNvAO/gWuB5bTlLibyQ9xkvT4oQ+ShFT3UkymdVnirxYDXMT+QxuQBrIu?=
 =?us-ascii?Q?Ptjq70P62cYr7ryM8yYNO0/Q/6cbD2+9PXgg7YbZEWhNoDe9R4c67J3Rql63?=
 =?us-ascii?Q?/skQ5IMQZHeuyIFDveFLAwYi63KnXX0RX6dALnD0MYbV+VPEtCeVkKw0xB7Z?=
 =?us-ascii?Q?GjufqKzC6SbWlV7fpIqZoGwxdff8Rhz1ve5KPSqZchAdFv0rkXX166W8/rpB?=
 =?us-ascii?Q?Wpg/FhWwz2rAn4bhWc6+DZSL4pXi5f4EGmu5ChVvIAataIOilEGuEIVRTEu2?=
 =?us-ascii?Q?B5LryMpB9Y6YRKW60v32hy/EIQQApiOViewJasaqeR/fAhQS04Q9CfcozHop?=
 =?us-ascii?Q?twcAelGCP6iuZKQzw4d3tUwJYsbRHV8HpQursRwd1OEXWioLZSSSvdoYHAFR?=
 =?us-ascii?Q?RU1hpLX4nlZF1nfMajvyt1PFMAZ+JdrGuvi0b2tWDWJbTfEAiCYHo5aMaujs?=
 =?us-ascii?Q?ery86N/PxTdlj0aT8is38aGEDNHk4eZNPA1dEri8S8Y5G7dQ9zLKUaiX91vQ?=
 =?us-ascii?Q?kuhnKY2q6vDff/xxIWo1/3W3+n6fWqkULcvYOtCbDfl2e8k4ZMOse3X/e9LO?=
 =?us-ascii?Q?oieYHhsLbSws50JTt0swczJnT71JFzeUgjdbtVwF/vwsxE9kaYFEATgkbOa4?=
 =?us-ascii?Q?WLh0g/uRcdwrIumdiXuCR1n4o6ZcT5YzNZbVYXIzIDAE0nzLO+DBvV775fDs?=
 =?us-ascii?Q?ctt/V7ZGsJ8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z15NmbtOdxmIc9er4mJ3TqaEWo9bNEUHqmYInssgkuALEyg+4QVpdQpWSCCN?=
 =?us-ascii?Q?JopIeno0QC2wezZfwZCzw1JPAXHiJSn44pHNI5O2LsG70mPi6sA/TXu4G/Vk?=
 =?us-ascii?Q?h98Ha8mg+LQk2cPq4Zcq3p1tabFj7tphBGD4JMFwlnme2fTJWAXVPlnyAeg7?=
 =?us-ascii?Q?i8xqhYFLWMZNm7dyz36aMvrBRMca3YuWGRqgtuz/ttZf3m/YzfL87rOeea1h?=
 =?us-ascii?Q?Us38EWeYtSdjyxE0ZZ9zzeCmd/umb4QK/tJ0Q/OnjAUyFt3TeHYP60zIoFNO?=
 =?us-ascii?Q?U4um6Aln4lvu8JrX+lbt6tSJcCMUvnI5XZI3rLoXOyhRBG/pe3QURDPCECXs?=
 =?us-ascii?Q?Wa0yXruyt+Uyk2anmuVcbpRvk3iL3/6TJsdEeUlwB7A8fMqVTc1njrIuLK1H?=
 =?us-ascii?Q?fQFVdRR9JCwfjZiv9spMiLlCGmzR75ZZy9Ms2Tq6qW3puDvaYblgJ9/CJnHf?=
 =?us-ascii?Q?IAmH4k1HKAV9hRl9hnh3f0IWjICSdLtUoY7RHekPM9ss0JcMXb8GDkFMkn15?=
 =?us-ascii?Q?MtYrRyc4MPUV3rC+3dFseK740AoQ56gbYvxVnXQoBCfKfDEop4BtqV3KkjeV?=
 =?us-ascii?Q?Pf94C6ULzx6SI4NEWYpZII/BFGXz/aQX2FUagiJk84MBMlxUOEZbVRqq4PLn?=
 =?us-ascii?Q?iCC7oPGMj1iDdCIWiuF4e3JEJsEQ8b7ORP19AF+RqQWke7i1l/7CG6MfZhhu?=
 =?us-ascii?Q?IXMSEhuBYAqr8kS84uWJAwGvuqTIusG8EUujOeH8hhbuOzWSDACJMLujZiks?=
 =?us-ascii?Q?SrR+cvIATBaUZsLRuip+E0QnAtmfKqn9ZMd8sKs1fKW0UYCzelChaElJ3Nlr?=
 =?us-ascii?Q?29Gd8wMrsoBcpbnOssQpTNByjnB7HHHi5OrpDaMt3bMvDCiaBOXlbTnvImRH?=
 =?us-ascii?Q?1UoE6sQWIvDCSS1HZxBiZ9Z9Dk2Jl4dzl8WOomjOynSCOqakPoO9nP1rorqO?=
 =?us-ascii?Q?kafSLzpmxLxBXJfUnT9u8Dp5bCCxQtxh6rCdQpxn/cy6ctvQl2sLcgSfMRGy?=
 =?us-ascii?Q?bFwiqRhexI3Hf7kWcuYct7bYwHi30/INy9hKXRYOHgsJV9zn2wBJbq08KMnA?=
 =?us-ascii?Q?QDMRpKDSQgpeTmgLKH6lYkEBu4Y2QQhKcrR8CYXdXFSx9JrlqaUk4E8vYMxt?=
 =?us-ascii?Q?CyFESHswD7zRs2NrAlBtLDNLisSd3mggYUjcdhrC8V22ctlgaHEHfR5PkbuL?=
 =?us-ascii?Q?QaGzjMsGzRZQQRBomtdWmZHbYDH2/XBtNzk3L6BocOD6J6oYkbdscnVwDbeC?=
 =?us-ascii?Q?4u3WaP8H+xYzCwHb0zSovdC3HmwE3nDWVaWjgxMYJZaV5jJmZ5hn8vvFqkuh?=
 =?us-ascii?Q?ohZZG6lG69TJRmeI4yGyG19xafkXNKeZ6YIbfhrmZPgZTYMY1Rgmn41hX7MA?=
 =?us-ascii?Q?mS/YQyLQT4dkTO3WcsCnPLDmRp0xVVjGWUSiQcd+U3OfLN6PGf70dyfjXZXP?=
 =?us-ascii?Q?Y6upUNc0MWUh12EPR9RQuyl49sFXSk9wfhZKQW8ib1mk2j/1NXsFHwMfCzaa?=
 =?us-ascii?Q?n3CZIZUwfebp8bMyOIAvcy8VIXtWktfMVUTiK72JSFrEM9ow/Lk4uNofJajH?=
 =?us-ascii?Q?4Fl17DALlGy9G6CVsiEygJI1QtrRnZTQRmlgcEU+AnNYXqA1FNPqF5mIa0MB?=
 =?us-ascii?Q?hA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bLmnta5Ol1sd2wvH4UCBKXh91ZFJuj8dRDImxhrlnMd6OArKBqqRjanUujQ2MP2rQi6YVf7c/heZeYbVfRkwn561YEpkODemhN8OdQH1FYnJRBRMLar+u6NaiD7IwBiySKCItnTlymE2AZMpUa0sNDM9E3gaH72MzrCehTFoQWwWKS66TIusi3xbmGp/VBWnk2mR9T0Kh5wZ6wtWmsBF1vYqDzMUaRzYY4ktMzZptfH6uVkiW4kTSsZUcfXvB/MLEbFBTPKcyb5UGXnYfqDns0GWHiydP1A8hDHn1nPk8C8NZAEZJ3ZG03kxKiqt4TJ3C2EbTw5ogHpjoaGN2+ZXUl41HBKeOANUaSNl+Wx8xEKG6vUggnpa8pFY77LRSvErUVF/LysprvZNMSGPRAKgU85LZb2UVAjgOUAIHSJILN919MrZsFw3Z0xaN2Gb08QdDfEkLyBZx4cnI8+cydy98BaUl231YoTIL16t9iMnkBkR1xkkyNq9+zMBNxg9TEtwrlg1koFqWT8tHrPAkQH+W13moDUSgM8gYy4U8nlLyDAI0X1TVgIz/1Vvvr+wJQucCFRKMBLFDX5aT5Y89z6nnYv12siOtvh97c5QeifdcTI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aee67657-04e9-49c8-f51f-08ddb0053c92
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 14:17:49.4970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HS6f2R/H8IyeIfgPp5ZE4IfNnLpuJsi7WJgE0kYdgIrRpBUlGX6YwpBVeQ0lptZxvBRzIRX/jRDihe3n+ObTovoBQYcg4QyDtY12xAZOBCU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF61CA724C7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_05,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=782 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506200101
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEwMiBTYWx0ZWRfX6G0cnLrHHWOK VAxH09UI5H4QYLupmIcDqpNxrgaSnOG8qsExObydwBBPKuJZ7hwkCCkkBcfwoUPyCYUMfuGLns6 nib2o+0VKlp34xFJa7uxGoVnH8ZnKMK/07/JXUMIu9AXRiqyt37AJ8oBuTYrrG/iV6ExNgaHlEy
 /Y+SCLF9m+vjZJNtNbHbuuL75t64Upw+JO6QCQZaXkfLKys2uwx0WGZStd+0kzaeeOIXomSsj1d yrukxvPC5rNgeluwMtJkhUMfrqSNg4CzrwCnSjhRoErMgOp+1ffpA3WJjkG56g5dTTMuYnMIkGe bL5wR/Q794I9WyMWD95jlxah0DBmg9DVN9hUMHS/uYcfYXcNMKwmKmVYazgO++GkwIQseS/PkP6
 ysLKdR3m/RbsgSFe/NYNCHJEbKeWFAKDHKDJ53pDA6MssaHjgwTQjaQx3eHw/BFNEcDyqm8x
X-Proofpoint-GUID: m-jMprVem8XEofGKBp5oR5541dMIPHPt
X-Proofpoint-ORIG-GUID: m-jMprVem8XEofGKBp5oR5541dMIPHPt
X-Authority-Analysis: v=2.4 cv=W9c4VQWk c=1 sm=1 tr=0 ts=68556d99 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VI5bMI_XPFn-zu0VtxUA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14714

On Fri, Jun 20, 2025 at 04:16:07PM +0200, Vlastimil Babka wrote:
> On 6/19/25 22:26, Lorenzo Stoakes wrote:
> > @@ -1662,13 +1668,16 @@ int madvise_walk_vmas(struct madvise_behavior *madv_behavior)
> >  		range->end = min(vma->vm_end, end);
> >
> >  		/* Here vma->vm_start <= range->start < range->end <= (end|vma->vm_end). */
> > -		error = madvise_vma_behavior(vma, &prev, madv_behavior);
> > +		madv_behavior->vma = vma;
> > +		error = madvise_vma_behavior(madv_behavior);
> >  		if (error)
> >  			return error;
> > +		prev = madv_behavior->prev;
> > +
> >  		range->start = range->end;
> >  		if (prev && range->start < prev->vm_end)
> >  			range->start = prev->vm_end;
> > -		if (range->start >= range->end)
> > +		if (range->start >= end)
>
> I believe this change is fixing a bug from patch 3/5 (which I didn't catch,
> sigh).

Whoops, I fixed this during development but clearly didn't backport it to the
correct commit, will fix on respin.

>
> >  			break;
> >  		if (prev)
> >  			vma = find_vma(mm, prev->vm_end);
>
