Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3569F2F4305
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750269065; cv=fail; b=tJAjXH+frvhsucREHZmMQ/sfSfiI+j9iEq34lFyZJbbC2hPrQO5GBctSV/8OelOiUbd7bYMZXk6Q1vYqEChJ7EXvFE7m//JRtTTTTT7rYVbidj5SMrxR7LQKIAlYlHTgk9Ri2knwNFH4e3quJXMse20XS4KhnERpckBrpH7fZtg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750269065; c=relaxed/simple;
	bh=b2BvGl/ysyJS+mDwfIRnD4zgMucSMTPMi5PgVFh1eQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gZU9wn/yq/KPwgxMILOwoXEDxXkL+o08UGz+IyoZpHLTcUwCaGFfGMON4QBkwcCj1gblAkBvWmSu/UdNDRu4C4uN6ti5+1woW5i+YFtKYsWFPWQ28LjhAEr1v8pbkvscGGeTGp7SJUltaSKn0o4s4UV4Ftbqyl4KCOjtZKoTYyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AVk608tD; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=iuxgJlDW; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AVk608tD";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="iuxgJlDW"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IHgvIm006994;
	Wed, 18 Jun 2025 17:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=RgUjDJ3E4MrKKYi5IG
	NY2DUKHCBGKXjpe+rQpxrzk3s=; b=AVk608tDghNahyDe4ZTfF4LetUkm1wffHT
	5SwZeWr7ULXpQUUGwEY1yiU4aYMcZaQUPML8U0pY0GuoOND3ruY3zdxYTG3Jd77v
	DVWuzo77IY6oScrZzI+yHrElFTLhjceV1A3znxZtQKMD3VYTS+R5jbSNlTPav4DV
	PkEC4RqTGhyv9+UupvRZZoO4VBf5GK2ed4pqDnvX2MRHRljOu0yTymzdYaI9FoEf
	1x/S93jffIdaIsdKOjxMsF40gD4OKcQ6pCJUwWE2WtSaFnQIeRkcb/3RQJnZ/VZB
	u7GaKQLPaq8nL1mlwgL/+FG3s4Vek7GImTF4X/FmlE/8Zm8PXwTQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4790yd8bpu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jun 2025 17:50:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55IHo2os026079;
	Wed, 18 Jun 2025 17:50:43 GMT
Received: from cy4pr02cu008.outbound.protection.outlook.com (mail-westcentralusazon11011003.outbound.protection.outlook.com [40.93.199.3])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhh7gjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jun 2025 17:50:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLR+Ahbj16Qf93tWkfhy1nGSSSlT21MzBot8aNTdQdu40h/0IQZMJm7mpFe5Frq8HdvLV8GDHtqujsJlCHT+nWjaINrAszWPVc/uX/HJBosnDuXRa39QCp7gXiVfXmY6fV6IeiYnB2HTUE2a6HA/O0vpmdbPoGbTFzFcKuGQ72to+e9ClqZEfiJOsGzLY4+RX4TL29EdvUsYjrHpsRAsJ5EBZP9Ct5rw0yG7zSg3oMUl2bhxntgzapfFdJkwHF3LNiX+4DS5He5VDzg5+CP6fKsffgc1HyncJ5ocRU4rFu6EwdIsdtsHJhNVdq5LhNzBQ0upPgt4Gnt1e1YDoyHdYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RgUjDJ3E4MrKKYi5IGNY2DUKHCBGKXjpe+rQpxrzk3s=;
 b=RsxC6j4bK2/zAq5b0IveUbOpMitCRvrJDMN8q1XEPL3hCxTZGe0HqxiTkcupEENq8vn8kba4+2gqeNMXuAoYDSH73hWUGEJgaxfkF9JpO3QThfQIY7B4NmfJooPRS9YA8ED1gaIf/TpTicLH6m6I+I6TKf5oKUyQbZ3JXP5WeO5Cco9Sw2yDAfXVz9QVb0vr/VNtE2co3WGEGn+rToN9rKqctSlH3MABiw9zEmOtpcYrVXXtlZ9SrGmw2shr8a7R9r8/nkEcvnNbjg6z52xRXlsZQOn1Cfvbe5oWGfv9O36YDNb8QA9az+jShNb00XfWFg0pUgGkQipLJUZ/YRc9UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RgUjDJ3E4MrKKYi5IGNY2DUKHCBGKXjpe+rQpxrzk3s=;
 b=iuxgJlDWCnMQDkaptLugtAFYU2uxC24lobyRx05xFjl1BOeAndNnzzsWj5luylEZZP1o0kqZ3xidKjhcCoPLVW41AepMWiX5vAB/2Wu0KIviwq0WzdX9etWC2wN9s/gbde+qyisGnfU6OAislkD1UBDIHA8Uy8j/jMGcCEZk7aU=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA2PR10MB4620.namprd10.prod.outlook.com (2603:10b6:806:fb::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 17:50:40 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Wed, 18 Jun 2025
 17:50:40 +0000
Date: Wed, 18 Jun 2025 18:50:38 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com,
        baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, baohua@kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] khugepaged: Optimize collapse_pte_mapped_thp() for large
 folios by PTE batching
Message-ID: <cd871535-f606-4f2b-8fb2-e3520a2b000f@lucifer.local>
References: <20250618155608.18580-1-dev.jain@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618155608.18580-1-dev.jain@arm.com>
X-ClientProxiedBy: LO2P265CA0427.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::31) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA2PR10MB4620:EE_
X-MS-Office365-Filtering-Correlation-Id: df0a84ec-31b5-44b4-3a48-08ddae90a3bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?n9fF9yrLPQ7hQJbgUnr1qjHipZK50K40cFH/rSg4NtmO1t0WDZUUuOrb/+JM?=
 =?us-ascii?Q?i9Fi4rHWPnuaWNa1EQ7RVJ/nvxUyaiiy55HP1VvvUh06EB5WJMItuAOI8m+7?=
 =?us-ascii?Q?fXKOkkTJ3mxX8solzUvs0DajVsxt0WNLRLIKcjAosTivrmhve6cIy96kbL2F?=
 =?us-ascii?Q?d0ZZEMS0zgQK0H8Gh7uy8lJBq1Jye5/c3obv1CVhQ+eS7p4ND4iXB8sFv39m?=
 =?us-ascii?Q?oeb33HPGymb6wctUhyhjjaIfIYFhS0oupX15QtNcVoMWZqri4ETLtcvh8lZY?=
 =?us-ascii?Q?Vi5p+GlJzP7xVg9hRtBADjuSpqfPs6SRhvWHC3n3hdjdENFwFj/zWYREcppI?=
 =?us-ascii?Q?CfJI7pudEucX+g2uFQLOUOO7JBk37Fre/lD9z17/wnO+EjxuewPrtmuKRbzi?=
 =?us-ascii?Q?mwKQQXC25SorryoYrEJOTCYCZlbjaEZvaSpAL5zEz0tRQMhAgzRnPWnQvgk+?=
 =?us-ascii?Q?0sE/CO4q23lz5rftigDA/AJC/Pc+9dTsPJRxudt0hKDNfIXgflmz1MWknBTR?=
 =?us-ascii?Q?gbII+s2DvuMNWIrrVgiYwghmT4UOm0unCUGfpWCYDqImmr+tGgZSSvr8D/by?=
 =?us-ascii?Q?TapAbHSdsnXVYhqD8ZjilHmJOhpwowSybTU+zC+BUrIpq+qUCI8r52okEscN?=
 =?us-ascii?Q?Nn2xTFQ3l3AA93qou7AxeHVuBbdfVdzjcZ1YLIFytYh5GT5QANWuiA2YMri+?=
 =?us-ascii?Q?ZsqdjzCfB0uoTsPg/QCei2nXCSOIyA4kUS6RTDUjJ+9hx2/UN3YDaYPhqbge?=
 =?us-ascii?Q?8jY3NYswyJhnbZpzPau7HQkxdw3zEagEq8DBA+42liMnwMU3kL7UC5CKiulw?=
 =?us-ascii?Q?ISiA8jtmVMOJQIUYXVOAQbVkjlQqWEmHWW8CBUEZ38ki2csAho/kktWpmL3l?=
 =?us-ascii?Q?2s9T4Y3N5D7hVW845LuQD0RajdECdeWWz1eH74nAQ11MDPXHnCj+trTrwMyV?=
 =?us-ascii?Q?4uekol6fuoat+2Oxl1xw4UuLWpoCU92Y9ZRDeDZmEXSmB0Wqrr+jskrPe5l4?=
 =?us-ascii?Q?QIxgedExoUtunt4NX0qiN7HDmZuR9I1ihuuhNGt70DtdDgOvkCyfSYsdvyhH?=
 =?us-ascii?Q?rcMG5isq5LEyRxTG5c0ee5yWmKrLGBOawbNJ09eqVdJUfHnkk2NQQQ0oh/MA?=
 =?us-ascii?Q?MEccB6vEWqPF/Ce8k2h9x71CI4bceGVHXzQUaxU3+C07cC907Vf9VJe78VYk?=
 =?us-ascii?Q?XhKJx44yA/XzeQKe1DOpV0GK2RD+pwAUaLHK4Xj6eVCnTn33nBXi2cy+20/m?=
 =?us-ascii?Q?9pFKLltE6bxmVxg1OFEzdKw0BKzAaQEenoE02qHyPh80OnShsqmEbS+8R9pt?=
 =?us-ascii?Q?2UOSP2kMh92e7kYX0at3jlCXtxeKsPlahDntahgnjZ/q4Cj46uPRb1A51alA?=
 =?us-ascii?Q?14tkh7uJjSWtTdt80aSKVGA2GX6OZZ8AoBa7vnho9DSr1khdCpMnMkh5Gz08?=
 =?us-ascii?Q?Prxpf6Nk6TU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J4Q/zYukNq+w8y3tiV1o/BXt6yiij6CjNy0bv3A+ufMiPoo/f4fg4YhbqGTQ?=
 =?us-ascii?Q?FrFLjzWGcyymzhzJne0P9mZARNPuZJPauZg/aO93VlEHdN/u4KvfvKkefs8r?=
 =?us-ascii?Q?zzrwePgnUemXEEpD2KXZgtEM7BouAB8YCKu9WodGqTzTIFGg1oIgXyZDSWXB?=
 =?us-ascii?Q?11Yab3chdCyjKaiDL1fZD647ID0IDyitzJjm6D//dCmXabty4Jd4lS+yF7YH?=
 =?us-ascii?Q?BcirfwL56J82MAfmgmqY0zqn+tvh3e4ExVnmj4Rpk1x3ziNQGTxw91mpAlhS?=
 =?us-ascii?Q?HVlL39GqeDPNG3jjylOk+GVn2dGL+k80n1TM3Z+BNS06zJ4iPhIBfEAPUtDP?=
 =?us-ascii?Q?9fCCEZjPY89/ANP0/+BCcbDCj8NFl9qLBQBkogn1NC7Lu7DeP0lJ/a31qM1b?=
 =?us-ascii?Q?SST2cLsFJdMYDJd83wT2wuYWv0tkYuEGU03XL7SPx7WvNQyvM+XrmwV0nISq?=
 =?us-ascii?Q?thsBXNeRrgdvusXRrtKlNfcyUFgcWd3XrDh1+lauV7qB647AkIivpOs+0Q+o?=
 =?us-ascii?Q?SGBzHI9OekqmsikvS/QBz7I1gyUh0KllOieUBJDrqxZQCdNYliGPnWOk8kin?=
 =?us-ascii?Q?RyebKSrpaOubLWt4/rDfD4DTpYUMH0VFxIZvr4/+yVnMcDse+WE7trCASCN3?=
 =?us-ascii?Q?4CTu7vIhEKhXwvmTIk6xQaH6fV9Pvji1due1+1ZfzgDqqhii+QpI59YD8cJg?=
 =?us-ascii?Q?gyY/lue04VCqToN/LuXjI6IJjr+r4+hGTZNfSH0HFSSFYQY3xpxqEy7U4C7G?=
 =?us-ascii?Q?AlZR+5EACMO491wEsqfBF4Y9pQMTajnqZiGZ4g8tiv4JNe41lcPa6CEiM31J?=
 =?us-ascii?Q?qLlHbtajIHpTSUuAF8DOx/SObNVPgDjl7tDhyJhz6WstSuJK0aE6XJ0t9SJF?=
 =?us-ascii?Q?30gFPq6kZf7lgyJWrRPaox7jC3JY+456KNcXaEzI16zYCiwhZ710HtVvHN/H?=
 =?us-ascii?Q?w5WQbTiwrMTCt6f1wnIoPl4LT9PzfkHkLt2n4sLIFYwEcDbZ1pRu7wy78cR0?=
 =?us-ascii?Q?8LTDyI754XpLcCRsD8G2wkGs2hMrh4ne7eVxt+xDdUSVHL6gzDPBiVmmwmSH?=
 =?us-ascii?Q?AF8zP9hX4ONW0LSQGymVJbOXTNeBvmkbx3gw0/RGKZ3z2n0Mlz1Et+V9TPX+?=
 =?us-ascii?Q?mxzwb+n5s4sDH+OfVxKGl4S34SsoYThUG2BbIaftvsOf1oKIavvU0Db6kd23?=
 =?us-ascii?Q?R6toZCPGZwCUv2K6Mzl+BsX9KcNyZB+yZYupv5V6/LByy4FLa9sGOkj3n98N?=
 =?us-ascii?Q?UipaxdOrBxpaFigqQ5dQK1x2yeh+vIDQc/04ipYTHTiUbvOSlUKFPMAjEhKg?=
 =?us-ascii?Q?heSVZ48S7g86xz9FOHZNjnLbLl5rfEn6NYIoP8JN/klUjTK1kGnnyFpylPYh?=
 =?us-ascii?Q?0e1ujrcqIjpvVuD3nAx7YtlWwzqo6hjMduAMPjl6kvTZh0FAvqoh0cyntkY0?=
 =?us-ascii?Q?jjdOhqhaiVJz/a5oZITX+rp6s11YDwLA4DEczc8VD/lxZktNeb5aAOCfctHM?=
 =?us-ascii?Q?4OmGUJwqwTCeQ6z3g7SNMnFNnmTvaJh1moHkQv2mT02UlJkh1aPGOrxAFcDy?=
 =?us-ascii?Q?4FxqylvkYTSD3BklOqEbgPVH9LbBPJwdasM2jB6QiTZ0yh33orzOJYmeyOlP?=
 =?us-ascii?Q?Gw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MKstZmq6ts/Ig1nW4HxirdEZwlA6BGE+raexaqUzN9eUelWKvSzN3NsK+8fYd7WDcL3ll7UguG2bcvXyv2j2SVWoo53YFqnEqX0XIM2SU/N94K2OZlAHosVMEsnQO1tHjZDMoYkQGEEv6nujxZ74eWt/TvfDH4E1gCs42m+YRE/r5AWCcI9MoKbILZ41+6RBjM7UdI1aTZOb7XEtNlH4lmLHcKhCNRADY/fr/oXhigqeFhQVUpI9aluWCx8GtmW/6WOadqdME0JsmsWEWS1D2b1H5DUu8g9K73V+24hVY5Ed9EgHpsjpRCCWXp0URqrvQfQEpl3nJTUZhreIIWTnJLnqml4SPsGktErgKPLbUnE0C7buTAEzQmFLVVKGZdgrmrERyWZJnrZ9y+zKArz34GQKIBE12e5ZCuUWOos4LEP6NebMJtj0kAS/i+5dy0hvaVleIwHRSNSM+rWoBB2PMeZyiUKYMLFn9TRlkzqLpJ62y3M3OonJRLT9fzL9lhWAZtvMfBs3qkqdVGKK5OYUa0hk7804BMI96K2ukpC6AaG4oYmwG5WwUFBHJK+0tSorijRiZjOsmJjXkRL/s+x/atDw40tw5m7N3CGUuwUk+RI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df0a84ec-31b5-44b4-3a48-08ddae90a3bf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 17:50:40.2937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VP2EYz0rDcqGq6N5qohPiWpdjSAUVn0sXAWvJudmKtjkImm181qA9vmwvpIlqy46LnndyqtjXVQzvw4rwP1Ss+BVVAKZuXUIrQ0nD29tsz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4620
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=751 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506180152
X-Proofpoint-GUID: fvAGar0xQOpOK4pgbdlBr_EJWt13UeDc
X-Proofpoint-ORIG-GUID: fvAGar0xQOpOK4pgbdlBr_EJWt13UeDc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE1MiBTYWx0ZWRfX5mGua+xOWb/p UqecUSpdC9YxWpYS3x6lsgL5MfqruNIauY4HoLCaE75LvByUIZL8Kv2FeBUcr56K+L6n7zh0pSv S61Ssfc7SF0hR9r7glc3eJ7gdLmjNG+V0JUfvN4TcAkKCwis+pcN+gz58kSinkTP5ItnLtLSi5J
 8nHNQ27H8lxxXRet9MKgfxH3ViYPhZSL9IjQ0NNqvzZVwnsgROYtMXKSxSSH/5TSsj/k18/pFG9 ivuT0kHXOGEUD8ZxHKo2uZL8g+LG6ZGDPo121mLCkofgkxBBPjY3DqnLPBqZepGTwn8CbgJJPkQ JtDZvbKKxFdrG6+iR0YtNmRslAxdrvhR5LEKRyQhW/+J+Fdk6XCymqaK4pyHhav6Hu0Al5UZkNM
 Gyauz4i0DM0D8rz9oMyAz0WHmqKgs937k/1+N0UKj/RDSEWBkgUZFGEyTzwSuqP5kWKjcxej
X-Authority-Analysis: v=2.4 cv=XZGJzJ55 c=1 sm=1 tr=0 ts=6852fc74 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=JoVDZVHTwmE6Y3AUHOsA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 cc=ntf awl=host:13207

This series has a lot of duplication in it esp vs. your other series [0], but
perhaps something we can tackle in a follow up.

It'd be nice if we could find a way to de-duplicate some of the near-identical
code though.

But it's a 'maybe' on that because hey, the code in this file is hideous anyway
and needs a mega rework in any case...

[0]: https://lore.kernel.org/all/20250618102607.10551-1-dev.jain@arm.com/

On Wed, Jun 18, 2025 at 09:26:08PM +0530, Dev Jain wrote:
> Use PTE batching to optimize collapse_pte_mapped_thp().
>
> On arm64, suppose khugepaged is scanning a pte-mapped 2MB THP for collapse.
> Then, calling ptep_clear() for every pte will cause a TLB flush for every
> contpte block. Instead, clear_full_ptes() does a
> contpte_try_unfold_partial() which will flush the TLB only for the (if any)
> starting and ending contpte block, if they partially overlap with the range
> khugepaged is looking at.
>
> For all arches, there should be a benefit due to batching atomic operations
> on mapcounts due to folio_remove_rmap_ptes().
>
> Note that we do not need to make a change to the check
> "if (folio_page(folio, i) != page)"; if i'th page of the folio is equal
> to the first page of our batch, then i + 1, .... i + nr_batch_ptes - 1
> pages of the folio will be equal to the corresponding pages of our
> batch mapping consecutive pages.
>
> No issues were observed with mm-selftests.
>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>
> This is rebased on:
> https://lore.kernel.org/all/20250618102607.10551-1-dev.jain@arm.com/
> If there will be a v2 of either version I'll send them together.

Hmmm I say again - slow down a bit :) there's no need to shoot out multiple
patches in a single day and you'd maybe avoid some of this kind of thing.

It's really preferable to avoid possible conflicts like this or at least reduce
the chance by having review on one thing done first.

I mean, why not just put both of these in a series for the respin? Just a
thought ;) in fact this is probably an ideal use of a series for that as you can
ensure you deal with both if any conflicts arise.

>
>  mm/khugepaged.c | 38 +++++++++++++++++++++++++-------------
>  1 file changed, 25 insertions(+), 13 deletions(-)
>
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 649ccb2670f8..7d37058eda5b 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -1499,15 +1499,16 @@ static int set_huge_pmd(struct vm_area_struct *vma, unsigned long addr,
>  int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>  			    bool install_pmd)
>  {
> +	int nr_mapped_ptes = 0, nr_batch_ptes, result = SCAN_FAIL;

NIT: I don't know why you're moving this, and while y'know it's kind of the fun
of subjective stuff I'd rather the assigned values and unassigned values be on
different lines (yes I know this codebase violates this with the pml, ptl below
but hey :P)

>  	struct mmu_notifier_range range;
>  	bool notified = false;
>  	unsigned long haddr = addr & HPAGE_PMD_MASK;
> +	unsigned long end = haddr + HPAGE_PMD_SIZE;
>  	struct vm_area_struct *vma = vma_lookup(mm, haddr);
>  	struct folio *folio;
>  	pte_t *start_pte, *pte;
>  	pmd_t *pmd, pgt_pmd;
>  	spinlock_t *pml = NULL, *ptl;
> -	int nr_ptes = 0, result = SCAN_FAIL;
>  	int i;
>
>  	mmap_assert_locked(mm);
> @@ -1620,12 +1621,17 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>  	if (unlikely(!pmd_same(pgt_pmd, pmdp_get_lockless(pmd))))
>  		goto abort;
>
> +	i = 0, addr = haddr, pte = start_pte;

This is horrid, no absolutely not. This is not how we do assignment in arbitrary
C code.

I don't know why we need a do/while here in general, I think the for loop should
still work ok no?

>  	/* step 2: clear page table and adjust rmap */
> -	for (i = 0, addr = haddr, pte = start_pte;
> -	     i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE, pte++) {
> +	do {
> +		const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> +		int max_nr_batch_ptes = (end - addr) >> PAGE_SHIFT;
> +		struct folio *this_folio;

Hate this name. We are not C#... ;)

Just call it folio no? The 'this_' is redundant.


>  		struct page *page;
>  		pte_t ptent = ptep_get(pte);
>
> +		nr_batch_ptes = 1;
> +
>  		if (pte_none(ptent))
>  			continue;
>  		/*
> @@ -1639,6 +1645,11 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>  			goto abort;
>  		}
>  		page = vm_normal_page(vma, addr, ptent);
> +		this_folio = page_folio(page);
> +		if (folio_test_large(this_folio) && max_nr_batch_ptes != 1)
> +			nr_batch_ptes = folio_pte_batch(this_folio, addr, pte, ptent,
> +					max_nr_batch_ptes, flags, NULL, NULL, NULL);
> +
>  		if (folio_page(folio, i) != page)
>  			goto abort;
>
> @@ -1647,18 +1658,19 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>  		 * TLB flush can be left until pmdp_collapse_flush() does it.
>  		 * PTE dirty? Shmem page is already dirty; file is read-only.
>  		 */
> -		ptep_clear(mm, addr, pte);
> -		folio_remove_rmap_pte(folio, page, vma);
> -		nr_ptes++;
> -	}
> +		clear_full_ptes(mm, addr, pte, nr_batch_ptes, false);
> +		folio_remove_rmap_ptes(folio, page, nr_batch_ptes, vma);
> +		nr_mapped_ptes += nr_batch_ptes;
> +	} while (i += nr_batch_ptes, addr += nr_batch_ptes * PAGE_SIZE,
> +		 pte += nr_batch_ptes, i < HPAGE_PMD_NR);
>
>  	if (!pml)
>  		spin_unlock(ptl);
>
>  	/* step 3: set proper refcount and mm_counters. */
> -	if (nr_ptes) {
> -		folio_ref_sub(folio, nr_ptes);
> -		add_mm_counter(mm, mm_counter_file(folio), -nr_ptes);
> +	if (nr_mapped_ptes) {
> +		folio_ref_sub(folio, nr_mapped_ptes);
> +		add_mm_counter(mm, mm_counter_file(folio), -nr_mapped_ptes);
>  	}
>
>  	/* step 4: remove empty page table */
> @@ -1691,10 +1703,10 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>  			: SCAN_SUCCEED;
>  	goto drop_folio;
>  abort:
> -	if (nr_ptes) {
> +	if (nr_mapped_ptes) {
>  		flush_tlb_mm(mm);
> -		folio_ref_sub(folio, nr_ptes);
> -		add_mm_counter(mm, mm_counter_file(folio), -nr_ptes);
> +		folio_ref_sub(folio, nr_mapped_ptes);
> +		add_mm_counter(mm, mm_counter_file(folio), -nr_mapped_ptes);
>  	}
>  unlock:
>  	if (start_pte)
> --
> 2.30.2
>

Logic looks generally sane though... :)
