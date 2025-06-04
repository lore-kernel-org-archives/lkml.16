Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0580B2BB13
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 05:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749014624; cv=fail; b=b0Mb3YeINCIK8mS+l/el9xsa6nXDtvk+pkASPM93rYj0D7cCypCXbnI8PdL04j4zJFz4TkgBBOn87dK7rL8H7R8r1dpfvI5/iGC/qvko8n3mwVcdNAoxW46Tkt19dx8l64MWHOCFYkB+FKmdM+uJEswcLw1kL7otua5eZWXgZTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749014624; c=relaxed/simple;
	bh=1XQNak32LjEtge/adG4l4PLoCAlOCcaR7WZ7XhQ8cBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FIvWBd/BLZ1Rn2v417Fjbgjo8lPRehEhT4wV+xgTBrdfxiZDiVCGxpKpVyzmPwHqTwWR+BNV6jq51m0TKHnGgmUSHSf1eC5l7QXu4yd1+Kn7DVJdbuXzXpoFV79ZcFMsy/FpGWGP+uQxMWlFrQJ/MHBL2dYOcJrcNum0w9VkXfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DNJ7muUG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GI6wxVaf; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DNJ7muUG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GI6wxVaf"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553MNN6k000885;
	Wed, 4 Jun 2025 05:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=1XQNak32LjEtge/adG
	4l4PLoCAlOCcaR7WZ7XhQ8cBg=; b=DNJ7muUGIyUYcvXfStB5U8R/ZN0Ckgz6JF
	oZX+IdRKkFVVtQXMncr1zuXnwP/X4aYbXvX2fYtu3M5L3bqJkgwFYZ5Dy0pURM6s
	JgqVAb6ZSYa8ld8p0wGFJDeix4EcmOAdJ23YsFMvlZ1A4uZE5ZuvlWneh0XUZbzE
	ZlBtx5CW6bHsnT2TlQP1kQ1WNLCrTC4R0ST4BjD4sA/tVvpdypI8gcGouXqnTUsV
	xYBnTwF0t5taQELzNTkRsgzjvV2PqDcq/9Eq4bx2XABg9eDYXMQm//oSP7qm9Psg
	9bY0P1YVC+7CUbIk5QCsrdI4Z9S1cB3GqBJmLTlj6XH1Ukr5xM4Q==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8du8b3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 05:23:28 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5545K7Aq034829;
	Wed, 4 Jun 2025 05:23:28 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7ahxsm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 05:23:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S9d+/oZu7+gnGEprptXwbnHRb4gSTYwqJ06nBknNUhAKGX4IGz5dZbZN1zS3Mm6Z6vJkrTIR4PlbmKL36qKhRCHDrWr20fYL56xoudUVZJcs+Z02UqewMYtQ+VLT3IcWeRKfygnz/06EKwWxJrs/YsQmOGOT5hulultbyiRbDQkwLyjaL1gglV8MYzfekYl+jJxx7HFpikx3esShxQE/hSm4xUxAYVfEFhhipY0znJQ8r72K3DT39Xlm6gJm1OiqtzXTqrEDY5QUUtedcfgR1pnJ6Uf0RjNRITBV7wnALrjSJmVLs72vahRu4UslSKVUzY1zeVbCsUIGDrKY92FcEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XQNak32LjEtge/adG4l4PLoCAlOCcaR7WZ7XhQ8cBg=;
 b=a0mjjrib0UBI1HB/nnln4KTQjxvC1A+8/726WGXgpAGbsVeskXUtgI2pTK8vL8vPKpXJZ6g8OJg+PXP0M9vNCLNNsg1DoG7n+J7H8ReB3oPkWGi6ZnbQ53pp/7PuU9T1sYDPogRLobDj1RvNTTFg1vfVSkLceHAkbsgWzdx2ZLqbGFGxzDzFTM1bbnfC733lFN6rBp+s+4EE3IsIcbtcx20IaEN33Gf2XTRpMiABSZzfwd+1+RKy+ktWqvAGpmHVuCrzG+HCBoz8f7tsRTiRBGufZQgGHZTaheSSHuIe9XpQJdn07GFVyjkOaxZyTBcsAl+CZa8gK2X/FDMeIwIHEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XQNak32LjEtge/adG4l4PLoCAlOCcaR7WZ7XhQ8cBg=;
 b=GI6wxVafZ++6CzK3o3q5rM6oICj7J8x6RjiEUsbkwEhndqQWVtS6VFiKc61Aixm+Jg665ISdxVRczH551haLJ6U9rNy0KiTDk58W8Iv6VR7e1K9DixfsjSLF3W7ehVYkucJf2cAcFszjPUIcoPLYL/Q1ttFn9QihfPzIWyopg1k=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MN6PR10MB8095.namprd10.prod.outlook.com (2603:10b6:208:4ef::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.41; Wed, 4 Jun
 2025 05:23:06 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8746.041; Wed, 4 Jun 2025
 05:23:06 +0000
Date: Wed, 4 Jun 2025 06:23:04 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Pedro Falcato <pfalcato@suse.de>
Cc: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Barry Song <v-songbaohua@oppo.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
        Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>,
        Lokesh Gidra <lokeshgidra@google.com>,
        Tangquan Zheng <zhengtangquan@oppo.com>
Subject: Re: [PATCH RFC v2] mm: use per_vma lock for MADV_DONTNEED
Message-ID: <9069347d-ad43-4ba4-9b56-72c20c87ab12@lucifer.local>
References: <20250530104439.64841-1-21cnbao@gmail.com>
 <0b96ce61-a52c-4036-b5b6-5c50783db51f@lucifer.local>
 <hafjpizztpwazia2ubkieavxw375pb3ziwhd7bfq24i4gv5ayn@ah4zz2zy2lhv>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hafjpizztpwazia2ubkieavxw375pb3ziwhd7bfq24i4gv5ayn@ah4zz2zy2lhv>
X-ClientProxiedBy: LO4P123CA0263.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::16) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MN6PR10MB8095:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f61f523-5267-475f-fbbf-08dda327e2f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tDJitaTSpB3haHfdyJnONw+G2nAxHJFNbcYdvzMBqYllibX85Z8YGreElsSj?=
 =?us-ascii?Q?Z/0NTU0i6F7eOmkk2+7k0o/15T3DzcDnV1RxC6tpblznzwqI8R8Jgpttw520?=
 =?us-ascii?Q?P0eLq1uWL6rRflYtnapgLGDD0KwHB/wpLnNy5iq19brJKicSKMKbhTtcUH0m?=
 =?us-ascii?Q?XgFZVBQMNU2SPFZ0JzDgwW7MtOqmmTQ+MM6ma35xpbGD2apGz0U6+7ESNllD?=
 =?us-ascii?Q?MHvA7bEcBuOnaLG2cMp7SEceEamG8vGsAnwKbgy6Em1MghceENy9EDWON9Fj?=
 =?us-ascii?Q?mi2IuQhpkbAEQeeOWGwkLgsidjD5nC5pXGneBGtuJ42wLBciXTvQvjYDs9o0?=
 =?us-ascii?Q?CH3t4DX5ZcGIwtV8qYGI+pfYUaQtO3PUn0jWFRAx7wxxKvKmu+4ZlFn3CbYW?=
 =?us-ascii?Q?yewaoiM99QuhCQVI2/XeyQLI8qQsHl+ZbIQRub7aJa4fVA0cJ2AS1mnZkiqk?=
 =?us-ascii?Q?97Nc0cclxbPcIBL0exZJzDHs8j5NN+K8cssIUFK8iGjOQ0EOEoFqKcKEieqY?=
 =?us-ascii?Q?77qvQTVfb10n/DDkQST6V1oI8r/f4HaQDA2ZI82zO7hlsAJ3LcyXyg9tWgOP?=
 =?us-ascii?Q?5zWn3rfHtHkO3luyIdeQeG0ZI0abR+Et5Ab3LGj9/GKVblTB1kOKNrM+ScwI?=
 =?us-ascii?Q?kZHsQBeEAKjQ8b2Ajusi2JLwv3fRkZUr9vCIdhH1I+aZmNWoInmS+GqUOd0z?=
 =?us-ascii?Q?izSk4VIdQ8qFuNVfex9P4KxB+yDdintAezCgQF3m11eXQusd2lLDGSqnR/Rw?=
 =?us-ascii?Q?vMTWSLjVZQZC2s1JxQPHojBReNTO29sKnsP5VzwPucAbV9zRHThS4JUz5xO2?=
 =?us-ascii?Q?2F/shHVKPwHv4bi5zJrZLfx0LH446YwlG8RObeJ5BD7IXKe6Thoxon8h6IHy?=
 =?us-ascii?Q?8XMX2bRoHHAAEnsaJIAawphZa5AlJhel9AtVbfMjiipwSXdyVbruUNAMTc9S?=
 =?us-ascii?Q?8PBc8Ndud1dLoqqJJBawk67FN/86Ktr1HfUbnJM3PY4nu6aeKaR1D3CbWfhI?=
 =?us-ascii?Q?f5/fIxi9yxouD9CoFsBo2FIi0m8rgPz870vNIspKNWuJlC+Lg8gT+6ZAZuId?=
 =?us-ascii?Q?mmbDTCKMDDgxhQYmVHu16hFQ2w4Iv3hJV+/AooDyhtXpaZTKNcd8wvQblbaQ?=
 =?us-ascii?Q?E0f9vuh+CTz905a8qBW5b23bZhWiQFAVPaOxcOr1k0kigszUn+hVo1636QAt?=
 =?us-ascii?Q?8rYpU7fLSg/qwDEktQsvB2eVOMT+MGfNsBphKP61hlr6hBwnaJy6sqieIQh/?=
 =?us-ascii?Q?lAYSOG4uco/OrC0+tmhjJ1kw6gHb7tQ6tclA/9JohhvNl5o8jrvxhobF1XTT?=
 =?us-ascii?Q?3sNRivrv8fhH5N0EnqsViltbLG9O3Zx0ewuIPPUXGNcNA7AeTo2MncGqZ+wp?=
 =?us-ascii?Q?Jgq8VUcMoOrktSWIWZl1TAOp5XUo4buCzwkHuLt5kvaIafMh0pfxxKye6wUx?=
 =?us-ascii?Q?dP75q4Lr1KI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fI9RXzTqUhLILpeEbD+N9uEVqhIViamzxJFLeJPUGJbP5izotlQ+AWibiSFl?=
 =?us-ascii?Q?R5+zOehbnWaapOOGiRE+75qxHloRNK6ki97ks5XajMVYzUBuHtpG2zeH3VKd?=
 =?us-ascii?Q?KWnwGo4IJ3HdAonb4Bqh/9diK7gUloGiYJH8GTRh1DVjvOO+nj11HBVBqbsM?=
 =?us-ascii?Q?IRy/o1aHsDkKPmI1SmLpSf3JfPURBXm8TzlnD1ZSufRUahbDc0ByEo36ngSu?=
 =?us-ascii?Q?JnvrqKcIqRYd8wR+a80luQztDOAOjXgD405Jt1ZqPLdFRDWPmPdf7ub0QK/P?=
 =?us-ascii?Q?/b7NXpP0BQgFQQOwQMZHiBwDqi0Tn4H3hd4DN3X8QD2gzPdbJowIluZCFoqm?=
 =?us-ascii?Q?rFXRzqBae1Q76WJRn3tr7ayy3Wt7wxpOH2GBEN6llCEjH621PUCx5b36Qhm3?=
 =?us-ascii?Q?j902nbIxLXG3i4A/P9rvPssDs9BQzfBc5KKto2Hsur1Xb5D49XfCD460Gqtd?=
 =?us-ascii?Q?v3cvYx+vSnywTZXeUObWEzc4sJeFfYo7ghhQXldnqP3uytIl0eTPjYutrMUQ?=
 =?us-ascii?Q?9hChh815wDg+/ezQ8SA1MZDUR4k2UFYBPX5z/kKxDYLJKZK3IOC/tlDgURdH?=
 =?us-ascii?Q?wPLmqoLz6M1XONYnRiLvp2ePk8Z6qol6NjxZCMqfzdFeVsyhsj4Hy/3BpMfG?=
 =?us-ascii?Q?nhevGRJbho3v42MpCpknM/uh3mr41RhFo3ML3CnJTZa76xBn4Bv7X+hcVNjn?=
 =?us-ascii?Q?fx7qlswXZkIFSYxA+MUP9f6Q1NliFoZ9CbLW8am9ezTLFPmc1x8cNuzOUgg9?=
 =?us-ascii?Q?Gr+6H3hQZG2uV+rbQmqDNka3b6VIaPuuZLH4j5po7pzH5FT6KhttKOvyz/L9?=
 =?us-ascii?Q?SXVVTN75s2CirYkDWiO7h6Uc7xY06Za2MJQ+6Nu67MyHIMSvjdgnHqgPH76v?=
 =?us-ascii?Q?A/lEEWgiUEABQV63WXvt82vlSJzKJsNVems2lgK6qcS8hwAK+oIhK5wGCtBY?=
 =?us-ascii?Q?jQAWhAYM+OXZSQuZOGIV5JP5BlL7crRd+XlVsz3sSS6kFXK1Aio4+xULGnW2?=
 =?us-ascii?Q?LrrOsJAMr+0y4av3CjnI2/A3aJ+YT3aGsaePrE1lMJc++CXC85fflzWTl6l0?=
 =?us-ascii?Q?9wA0lqKrmtk9iM3phHAqQ1vqng7vo6qizCz3HjUn2n88zYuC3PUWmFr+JoVV?=
 =?us-ascii?Q?OXUgG3VNHhUKN96J/X2uLVAxppUU4jBvbD4hlSLjhDmHUgSIcGIsW09PyJG1?=
 =?us-ascii?Q?hYwNdxBYfawDxnJURXhISe0biwrDpfqg9c/iFBWY7GefmiXbVXdwE9r/66GC?=
 =?us-ascii?Q?vdfWGxWvzUK2QWRrL469zC44a5pcM1deVAdQ5bkRZUq2d6QqkcvwGs0jy6vM?=
 =?us-ascii?Q?YAdOD1Q8DEsSB/hlAkXuasHEwDAet9XAYfIjMoc3s3BIw3BhwA6kPxf5mGtt?=
 =?us-ascii?Q?fbgFMnEQCzVUsWqBPs+8KIQdNVWqGm6VVG/CtxrPehEsTAM97HJ5TVpUgeT4?=
 =?us-ascii?Q?J7vKZICphaCTyPdLuPNP3Jfgo5Z6vd/tcA9fjIZIQLKKaaUA9+nD+MI8dnZp?=
 =?us-ascii?Q?e7DbqSkQnLWdq9+WaOGCEFEr1ZUSVzI/bBEgYPG+3IcAvBw041i/btjv/E+r?=
 =?us-ascii?Q?ETpmvQqBlB/hzQNYtcyB5SrPwUTDVubWHmUXMN/uFRDK9RDiaVDoc56jB4VX?=
 =?us-ascii?Q?GA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rkM0G5XC9hkmvU3Qq4eSQo5Q9zb9Szp2yzq+nno7f6YGtViSCPt/5Ta2OVpsmevWc5QWYXUHyrX+4cheCbvGk2pglMXoo7Id0p+BLthftrdZntIQLoVlRECWOQ36jR65x056JcAVqcNXKk0J7a+r98KBoz8VSLzQCz0fLz2y1NkUl3q1/YuNMCh6cLkKXbUv1kQ88WJ435FgLc4l8UbAwDxXbnE1ABpU3qyaV/SazjdXPaAMYG0vqNl6hN2qV1l5FUE3ok5qJbAlyq3ObURJ3MomsxvFLZptC/j6UikM0hc8JqP93us33qP9aqXy/z2B6d2IjvXuvwtQWZrkesNNV9gbzSeOexeEIZEUa1eZZgW6+D08IRzIrFRWLz3BeN7hCcd4r7fLjirLf3ZhzZS72SJXwpVnufkVaxMmTFdf9y4soDRHs7TRycIM3p0TscYIkA51TuUkKc5Omlk/GumQGpC+/jS99E0bg0d3Q2oy28nnIzTEoU9qNVwmJRY5zIQJNsNp3kkvx16H7yWYzCZk2JS2XwiCY6mg9IPohJFM8hKZUCJdqMZiPqW69YHgFw1pNhClvG5FwiAwfoTartiezb2MgiQTiG7nezEgqXOewKA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f61f523-5267-475f-fbbf-08dda327e2f3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 05:23:06.3932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: My7i7VV5/7bcF1GP+obMF9HMuK3kUdC5nersRXWnl+KzhTCutLXEsk0AGky3x6fdxQ/AlSoBdRnVN5kDO33wuzrFYgIhqcL8QI5n3vdKf7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8095
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506040044
X-Authority-Analysis: v=2.4 cv=Va/3PEp9 c=1 sm=1 tr=0 ts=683fd851 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=klu2yiTzNs0VdZASX2oA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA0NCBTYWx0ZWRfXwEuhv9agOt9+ xsm8KY1+ukgSgcp3O3XBgrFKyTVHNLTj/R3NErW5YSHZxDEZE1JUd6/WOE2DJArEidZ5Jn2p/ym 7GMZ5tIj3sLfZm8Y5rz9X6e/zi5VTfPeA7iJIyYvaYwzHTNoAHIndx3d39CjTBwigxrUaYp/XDk
 AUMBCjdGpKIpoe1Yzjpsu6TJ+IdpXdIgQTzxuWTWs1HF6wWje2I2onq7TZxTlxPSBDvuVKOBsVT 1gJArx/+mdT95KEQPCEpi2wjS9I7LJIw4glS5qQgdC5+DOXGvNMceIzkaIv59XzbAeJTyPEeLs3 n2AmFwiDVXZFGq8f6NN/Z38LIqDG8yNnrMPdtixHRQkcWGDI+Q5mZf+phvYRBcGzI0CYrVYOVKh
 3ViUM3QhqkDtgixmcThU9YM8ztkgFZIvI31UntG4BZPw7dlvRCCwIspD8wIIGQA79Kg6FGLF
X-Proofpoint-ORIG-GUID: VlBEuBTnIRk2x_WGshovuaGR4qchbrrf
X-Proofpoint-GUID: VlBEuBTnIRk2x_WGshovuaGR4qchbrrf

On Tue, Jun 03, 2025 at 09:59:46PM +0100, Pedro Falcato wrote:
> On Tue, Jun 03, 2025 at 07:43:04PM +0100, Lorenzo Stoakes wrote:
> > Hi Barry,
> >
> > As promised, I enclose a patch to give a sense of how I think we might
> > thread state through this operation.
> >
> > There's a todo on the untagged stuff so you can figure that out. This is
> > based on the v1 so it might not encompass everything you addressed in the
> > v2.
> >
> > Passing in madv_behavior to madvise_walk_vmas() twice kinda sucks, I
> > _despise_ the void *arg function ptr stuff there added just for the anon
> > vma name stuff (ughhh) so might be the only sensible way of threading
> > state.
> >
> > I don't need any attribution, so please use this patch as you see
> > fit/adapt/delete/do whatever with it, just an easier way for me to show the
> > idea!
> >
> > I did some very basic testing and it seems to work, but nothing deeper.
> >
> > Cheers, Lorenzo
> >
> > ----8<----
> > >From ff4ba0115cb31a0630b6f8c02c68f11b3fb71f7a Mon Sep 17 00:00:00 2001
> > From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Date: Tue, 3 Jun 2025 18:22:55 +0100
> > Subject: [PATCH] mm/madvise: support VMA read locks for MADV_DONTNEED[_LOCKED]
> >
> > Refactor the madvise() code to retain state about the locking mode utilised
> > for traversing VMAs.
> >
> > Then use this mechanism to permit VMA locking to be done later in the
> > madvise() logic and also to allow altering of the locking mode to permit
> > falling back to an mmap read lock if required.
> >
>
> Just as a quick drive-by comment: I was playing around with using per-vma locks
> for GUP and mm_populate a few weeks ago. I never actually finished the work (and I
> still plan on getting around doing it Eventually(tm)), but my final concept of an
> approach was to simply read-lock every VMA in a range (if that fails, go back
> to the mmap_lock).
>
> I *think* it works, and doesn't have the same limitation for single VMAs.
>
> I understand this is a super handwavy suggestion, but I know this discussion has
> been happening and I just wanted to get this idea out of obscure IRC logs :)

Ack, and I was considering something like that, but it's one thing at a time :)

Doing things in a more generic/integrated way like this should make it
easier to incrementally change things.

>
> --
> Pedro
