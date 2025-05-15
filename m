Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5701E7C12
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 19:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747337144; cv=fail; b=WC9Q7SlSIrPYNPCROqiH1DqB8TBZniy71XA0yJGM8k6ZSF+AKSEKAZwmTs8JYxIHDDmgD05ItGY8zauCmluueyncuf2pEzzvOjVTJmd8FFhP4HhSOJa27ULdp7x6AxODvScYnWalW+8/fiNmLcRL2SCvtCoevO9VSnEPlraPmE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747337144; c=relaxed/simple;
	bh=egaAlGoStOdZyugjn34EEhswi/gC3aEzqD5g7cEudno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DmYSddr/cYq47ykilXSDbv2qxxoyMWb9Yx59POeZrGfVMZIYKbxDeGOdQ9z/vq8nrA1QYZwOUcIvRUSE/rS8VNmGQeEYN1rdKvynsPY2alwGjS/R/lajveRoMYceuFWdJDCSoYJvGddm4JHmA4nUVETMFGjdmpbQIDol1EsFglk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=sdI/kcwv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wn5e7oos; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="sdI/kcwv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wn5e7oos"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FF1ol8006321;
	Thu, 15 May 2025 19:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=YYGdw7S00eQiEG2ENH
	AcX6o43IgE1lb5MsI2sFTsN08=; b=sdI/kcwv6GvoedBIws6RhPd9BqZfKNXa/U
	5TqywTLxZI5LEU2/SOm7WgzRKXqJAXLxxsQJfayz4j73fPcE693pY4Ej4RdFwUNg
	OCGjgJm5j9np3UpMWPP/Lxh4OhUQ+rUBt1h3sIMzniDMCpBlkGw4IGBlAC9JZn3J
	OX0P2dvhc1R2+UfoE9yPnNMQthcEz3b9MeK/l6ZYj+4WBc/VZrHRikyM+jzSJvSJ
	aMEqmdvhmO5lDSWrwjljoEUx156wF2Mf89uEUtIAZ9gKkG2NPZTRVw2Hn4NnOu0S
	AiXuR66XpnNJ2puaCdOOL5IqpYNXsSWvXYh7EJwR4/KE8L4XRPtA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46mbcgw0n3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 19:25:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54FITQXp026185;
	Thu, 15 May 2025 19:25:23 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46mbt9s2cm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 19:25:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oZan52+5ccKH8TFPRq+3a18ZIdJOvwbfbNwfD+EU/P+Fb1FNnm77HYbfeit1xs5+vrr9e17pSK+T2oHj4dgUdf5kK1mOH1SLXEqyZaIFC02bp7IKFTnVEPgOZUgNJR3GVOQ7KYuBzkzlH0b2o5UDFhg4szwgiGC9Zu4mNZ78A84uwuKw7SImWW9iqVUcLXdrvZUHA2yxQx+1xAviiOrGSG1FSyTGq9FUD9HcZWBx47cxwOyxaXtXkdBIKV5m9gX9saN8pJNCVtcXApVTdRHwiyq9FhBdaBRy6cJn+yT+AOkjBJ4JZpfLyQQvJvvkKWc/acbOb3qkY9aVdig9K+PVzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYGdw7S00eQiEG2ENHAcX6o43IgE1lb5MsI2sFTsN08=;
 b=fGB0nVRX7E703jyfBZ44AzJ90zeJjdlRbuNjr5LCluuU0y/rhDBSQserh4yo1JgPHoBnkc3RtVgi7pgUw2yrbwdpR6/2ZbBmmzWAJNuGDG8vq0n6KeJ+V8d4qlZHShpvt571wdT7enuHj3ruLshDGLSx4e0pbKN78iyNISHnNAiJzishGUrC6smSfJGU3XQMP0XohhQ8Dt1ZV1YsE66zcZCUpIogQZF0kVbhdsLYHhm4pYNNBvmsN0CyJXNP3/ppAabmFngtRrbEvUl/M6VoqKWz3w7l/UjC8kZ5wnx9dMcdkoWuCKA5lklSwGdFwb4QjX45FHAwesEDzb3dCSaV/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYGdw7S00eQiEG2ENHAcX6o43IgE1lb5MsI2sFTsN08=;
 b=wn5e7oosABqwwT3mXFa0CXUHcFSQSexfrkTxgl6fHqWGBAuGLxafSjgsCDQr2VOh917PWgy0VWNWN2NCCyIlaZlHm81kvDKkq0LqpT41pPL6AkSmBzrRO1dzA/RClUwQny2XU1ayg3blvSRAASxXZIoh8vQwHL+W2lj3GAU7KDs=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM4PR10MB6814.namprd10.prod.outlook.com (2603:10b6:8:10a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 19:25:21 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8699.022; Thu, 15 May 2025
 19:25:20 +0000
Date: Thu, 15 May 2025 20:25:17 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
        Alistair Popple <apopple@nvidia.com>,
        Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
        Ying Huang <ying.huang@linux.alibaba.com>
Subject: Re: [PATCH] MAINTAINERS: add mm memory policy section
Message-ID: <ed6f0fc2-5608-4eea-b1be-07e3e19be263@lucifer.local>
References: <20250515191358.205684-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515191358.205684-1-lorenzo.stoakes@oracle.com>
X-ClientProxiedBy: LO4P123CA0012.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM4PR10MB6814:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a7effa9-8c1c-41aa-003f-08dd93e63b9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k2H09FZ3uYO82fXrxxGSbifoxmqs7vuqgmBTPP+griSqxUJUtpW1n4pME3EM?=
 =?us-ascii?Q?8Ohv/QTgWyFIIgG3GcDqyUq5UtgjkNS2opb8oRgVobtrUYzWOGY5qTRQajYK?=
 =?us-ascii?Q?4bfQXQiVD/Gn0/JIgPGj4wxeQpQTnaaTmD3CPKwUA6qVW1Qf/xdpuiKqZ0cz?=
 =?us-ascii?Q?opcCrGiHapzu/vw4ezVNtBjHaN20GdQnvyYT1jvn7Fxpwur0yIN6iCZHeN72?=
 =?us-ascii?Q?CF28KOC5s+aYJKs7Gk9Xcjyg7OeX/p33Y4BM7ddKJWpTa0PS6nkTA89WQ0uZ?=
 =?us-ascii?Q?IQGN1hvDFxoYU3Gpc3/1eYSavLieG1I2y2HNTQFbY0FZfaejDPE9eMs73pQR?=
 =?us-ascii?Q?uT2wWUU57/DW1eh+RmVCEhSte/fmKbec/DUG56o/JcWBIevlF1sJdJ0J85B2?=
 =?us-ascii?Q?pg4x1vn9tfhJarcKnYNmBAgInRy3b80IRlkGNtjnOUG9va74fusiYlrfXcEd?=
 =?us-ascii?Q?U4qBfjN6Tb99CrTNw4T5axbArVlIODI1BG5N23tHtlsia9HZizcXc5yBbS41?=
 =?us-ascii?Q?EXTdn1fSKmA71Lg9nr0WaepvNt9Cu5qZ/YEjXpDswQlSAiylMc3ilAhWFNX1?=
 =?us-ascii?Q?1FDUl824qfb3qkIY5QqhgG3W34nGl7v4SIzS+YJZskXnuAPnD+aZGjapI0za?=
 =?us-ascii?Q?gzm/OBtwe5UkPOthztru4AgXSWJxbqH7kblwg99xj19KaQLM/g7t4OejrawM?=
 =?us-ascii?Q?u7mfsZ0YTBJfEDsWaq9aMR2aUUr+VW2pTemQwnT9z2KWCGqOYExTknfcJC9c?=
 =?us-ascii?Q?ihuA7yIVOPInr5hbF/C02bIlyGTnuKraW+Hh28HAeP3Zrqqts8na3tExwcaZ?=
 =?us-ascii?Q?PZ722/VOaJUs/O7iewOjZhCiX9P6J68gKet4Z0Ie/P4fe7AInQ2MiG1km65a?=
 =?us-ascii?Q?f8Wq3jkqFYDTciLj9hPJBSTmO37r1nsxMGqBvalMVVgGCH0knG0jT8CuxxUT?=
 =?us-ascii?Q?k3vBsJMn0LctXCbPxNxj8U5OnrU8iFhRhW/9hy3olWXhPYdSXThlhTKsySP1?=
 =?us-ascii?Q?oEG9XecwL/DLfWCuoWWbC2I6g9vNbI+gm/FhA38ndru7pZ3OSR1Hq58XcVau?=
 =?us-ascii?Q?NUl6QJXfhUEkD0WodTyB7lDoi3T2zZfx4JFHyXsnHkHHzsvvEFU3yOdYlttI?=
 =?us-ascii?Q?idtdiTO/PXP5UsfdHoeiAEjU2JLmMnt+RtwYPEUOgDURGJ7ls0WrfnexU0nn?=
 =?us-ascii?Q?baQFHLyrKn3rwD6x2m4O/QriKZH57puNxxCaxJ/AsLHdCQca/2NwlT0qIPXq?=
 =?us-ascii?Q?JaHzMAJXAXque9y6V+F/RrtyERajJApFgYC7Tu1GCeRGageMQW1bkC2nH2az?=
 =?us-ascii?Q?+6gZKxDU6c/qBwSUVlrRuRW/i+FjYd0KoyJXcYnXEUT4lJRnSymrw514Jlp1?=
 =?us-ascii?Q?lDx7MzpXWtYD7HUN9PQVjvK3FyLj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x9TeFSxS84bMuIv3m/jvI7nXM1y99Ub4u1btPVbL/CbPShQdfOABhfnglW2a?=
 =?us-ascii?Q?QZq96aSr09ZFTph88SVwukMCX7NjnXQUT3W33qifYZX6dtAAgUdjKJ22mTt4?=
 =?us-ascii?Q?Ygl5oWXN73r4zOShB4MFh7Q20n8bA1oLvd35f4NuGw5QGYV0IOpfWMOlOSyu?=
 =?us-ascii?Q?MRjEFIri0oZeUjgfOtAV/tQvkVDv0VWVygOVNiGhob2hLBySixTT6v/kv+L/?=
 =?us-ascii?Q?qC3tz2yYCad9KqOWCqiX146IyH8zBB+E+qaQMuwQAkPOS+VlZC7/SlQl6pqy?=
 =?us-ascii?Q?uhxGLYlpGwzOuzrxBBJvNhpBNl/D2eRpHHVn9N0+dUetZMSPAsrtpyjfuYLV?=
 =?us-ascii?Q?h5KYowM03eTZTy2dUraznbHoxNM+gm3vsFLtPTyAdl88UisHHygg9DPdrDIg?=
 =?us-ascii?Q?WVM3vKY5z35ZckIjrkb33z6twho1rWOPNTFZ1VaV+Q48Ttq+RCkOQQws34N/?=
 =?us-ascii?Q?UsOL0oaaSvKM+0j1w+SQBH9d7cWAs6v81Mqv90IsUg35Oht2yTfHHuvJYA7u?=
 =?us-ascii?Q?HIpiX+JG/REGYqJZymzrwAOYLIqgcWCAhjTx8aWdYK3wgUbb2FzbGZpmbsiv?=
 =?us-ascii?Q?X+7ifb/ESyOmIzhhtS9c/zMe52YUQV/OLrMIbLrrZP996Uhr983f0f60fmnJ?=
 =?us-ascii?Q?9v6V18S7vKa5jojmWtJd8iJObZpAIgCt4R5Zz/aqhE3Lo+UyI4GW49N/WEpH?=
 =?us-ascii?Q?6JBHgkOFrxB6jtKBiXEdDL+givL5maII6gciV4yJhQTJpBlpjXNkaH8TPm32?=
 =?us-ascii?Q?ofRebkJIyVdnmTKH7CVLJ6ef3ZI41PYoTWLuAHlG3iRBO96eGFOXelDK5uEt?=
 =?us-ascii?Q?4zGXBROs5swasNLPGo0JPdyYUnbkKX4wsv1rdck1nZZxjLkSx91/8Bxqq5OF?=
 =?us-ascii?Q?MP+FSIjt2Myg2/3uX8Du7GkEnkJv77r8hTqnipp/8/KbeJCJS4zKs5zEP8ru?=
 =?us-ascii?Q?DPzp1Jq85xzJJiprsxhuFvK+PpNjGeLM7x4XHYmDPr7qVRzHQzi4pAHYzstq?=
 =?us-ascii?Q?74ToSr2AdxbRDpZcjAynOtVX91cBJzZvL5URMBMklXZmQRG3ZTdDvBoh0uCm?=
 =?us-ascii?Q?ns7Muox/S1nm7U+pR1+Sm0SsWnRJ2cW2jSU2LpEbnAoPzVWAsW7v651FteWx?=
 =?us-ascii?Q?2r7jaqG36E8xK2jkNnS7/F+aQn2wrgHxaWyAmJ8oZZ9BICJY2xDAakDqlz6h?=
 =?us-ascii?Q?m2N4YaCWKRTJIxoBPg13fyOn3g+PKG2JtmsLcBaYrwdARzP21YCXUNT485ug?=
 =?us-ascii?Q?WGs7Ghpn/eosKyREGRlKJ4th6ojCJBMn4dj4yd7nczUts7xyqv99kQ/DANpy?=
 =?us-ascii?Q?x85OA0/OB9sVQXOnaYZ1mN69ba5GM0w1Q+S0yqyzWaLzAUAJG6UovmOUGX2Q?=
 =?us-ascii?Q?jB08V4+SuSAY/0CxUahtfe1iXKcXOX99EkUx83btNG2kAIB1JmaDcP/Za+Nc?=
 =?us-ascii?Q?lXAI0FGqhfoa5pWs142xiuY7NpocHcVVYy9WmkqorcDydHILi2r1hrEPtsyO?=
 =?us-ascii?Q?dIzuwG84eXhILQN/CDeWnZvwgb3V3Ppey5bBpNM27uyNbK/jBQtaZQnWI7Vc?=
 =?us-ascii?Q?ASopSMSoUS0WKMIa0fFJsbisoaH8UDIouUg8AwfxpMY9pDEazntxQNv9h5UO?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YnZ/43SfHz/b/rhdChJD4gcnIj9bdTQ1GCyd4/bhFgMlhOanpiC9+wYIbzvy5EaSMlGlE0ub9uqJoYiEbDrjXRM+w6Yl/nfE50qgnTPtCZkprrJgsFglGI/KLCyb6hJgGZdNJha8AbVxzHEeazAj0HyBQ96DON1XWcfMeGecUB/DXadkQ6yCyqTPOFX00fAW1CS96biF/+hI7JtCXQ4YkBRH0Pw5jx17jc26eyethR8me2Z1++rBIFrcpbOP+RTU9opS0xZDF8KYq4F0Tic3/MiCVqNnIydtgGKZrgVpmPdBdRbNMVNXa8jkebOhAQtUNZJ+XhaJmungbMVCkroC+dgR5pbP8Hy2PQDopQ2Su6bHu+fI1fA5go7EJJkNJsqYkohTaqnKFtLSnDtfngwiwW9gBVXov+vYTQINEUUxuffK5yrT9V8qK3WvjWONFItjtzobyjGPCJG3d3ATVsD1REqeVLmcfJlAA851t8saLDpl1n/BAx6Nkzjw32do6q6UdD0Fol2ZN6SaAkJdz9ehmdqbUazag7hDi7m73fdUiPH+LHkP7finf/vN+oh51UUAD2B691o/6PZLBH+ka41sUTVpPJaECn6/BORoNiblr9A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a7effa9-8c1c-41aa-003f-08dd93e63b9b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 19:25:20.9034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KD0zrIAzpo5WQIAM2VItIhAn845nkoku//t4YD2Urso8Flf3TPewlvgQ5fE7ix93TREcHmj/R9DXmvOlRQ0xczHiOCUtGKXGqOMfTBzwkng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6814
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_08,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505070000 definitions=main-2505150192
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE5MiBTYWx0ZWRfX4B/gBHwo942l FVOD8St44b8qooWqtUQwwlNGG7hkfHQhL3VmjI9aXfk4tqaQT9U0j3AZA9ojODDiSe5NT4uMw1h ITqwN7bMudM8ZvK6Pe7LkkXYfnLbaKOIwZXD7Q++9ZDYUusmMmqjL0xs8cjPtWQ0fHGMOcSWmFG
 F8tZzXjOoEsMuu5SWrKKJwZ4KBqcAUvVDwn5ZUlSaFXildBym0iyUd8ucmrB0TK663oqDifNY7j HBqjAnZXpAIf7e4XrVz3zL43LigRoyf5z3g0TRsT9TfHfgj6RvrljuSqaxEr/TzonMdxY3Nrfrm GbwL6zYNPzuFk0RpGHa2/B77CYIPwUCfPVCAqkZjRp7uC5Cxys98VTYJ6IqfntX+VQFmdu3JZ6M
 uDCDy06niF/+9JPsROt1vxBoYp74fnWqD8XkpDXQ5LDgtcasfAFpjrTjP5viYG52k34RpWuZ
X-Proofpoint-GUID: V8-sByLTeiBjBj30Opd-hZRvxzsraoNW
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=68263fa4 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=1-S1nHsFAAAA:8 a=ph6IYJdgAAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=20KFwNOVAAAA:8 a=Ikd4Dj_1AAAA:8 a=Z4Rwk6OoAAAA:8 a=tHa68p0SAAAA:8
 a=37rDS-QxAAAA:8 a=SRrdq9N9AAAA:8 a=9EtbqF3l54HVs89fJtsA:9 a=CjuIK1q_8ugA:10 a=gK44uIRsrOYWoX5St5dO:22 a=ty6LBwuTSqq6QlXLCppH:22 a=HkZW87K1Qel5hWWM3VKY:22 a=ufIsyHvWW7FwcMbVRpPq:22 a=k1Nq6YrhK2t884LQW06G:22 cc=ntf awl=host:14694
X-Proofpoint-ORIG-GUID: V8-sByLTeiBjBj30Opd-hZRvxzsraoNW

Hi Andrew,

Could you also apply the attached fix-patch, as I accidentally missed Ying
from the reviewer list.

Thanks, Lorenzo

On Thu, May 15, 2025 at 08:13:58PM +0100, Lorenzo Stoakes wrote:
> As part of the ongoing efforts to sub-divide memory management
> maintainership and reviewership, establish a section for memory policy and
> migration and add appropriate maintainers and reviewers.
>
> Reviewed-by: Rakie Kim <rakie.kim@sk.com>
> Acked-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> Acked-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
> v1:
> * un-RFC'd as there seems to be consensus.
> * Added Gregory and Byungchui who kindly offered to be reviewers also!
> * Removed Alistair as he hasn't been active on-list lately. Alistair - hope
>   you don't mind, We can very easily add you later, just don't want put you
>   here without your positive consent :)
>
> RFC:
> https://lore.kernel.org/all/20250513160007.132378-1-lorenzo.stoakes@oracle.com/
>
>  MAINTAINERS | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 314007e2befd..17403329d76f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15577,6 +15577,25 @@ W:	http://www.linux-mm.org
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>  F:	mm/gup.c
>
> +MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +M:	David Hildenbrand <david@redhat.com>
> +R:	Zi Yan <ziy@nvidia.com>
> +R:	Matthew Brost <matthew.brost@intel.com>
> +R:	Joshua Hahn <joshua.hahnjy@gmail.com>
> +R:	Rakie Kim <rakie.kim@sk.com>
> +R:	Byungchul Park <byungchul@sk.com>
> +R:	Gregory Price <gourry@gourry.net>
> +L:	linux-mm@kvack.org
> +S:	Maintained
> +W:	http://www.linux-mm.org
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +F:	include/linux/mempolicy.h
> +F:	include/linux/migrate.h
> +F:	mm/mempolicy.c
> +F:	mm/migrate.c
> +F:	mm/migrate_device.c
> +
>  MEMORY MANAGEMENT - NUMA MEMBLOCKS AND NUMA EMULATION
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	Mike Rapoport <rppt@kernel.org>
> --
> 2.49.0

----8<----
From 6e6b63cdce577718d939178625b62fe92e15565f Mon Sep 17 00:00:00 2001
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Date: Thu, 15 May 2025 20:23:27 +0100
Subject: [PATCH] add Ying as reviewer

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 17403329d76f..b4f74cdc5304 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15586,6 +15586,7 @@ R:	Joshua Hahn <joshua.hahnjy@gmail.com>
 R:	Rakie Kim <rakie.kim@sk.com>
 R:	Byungchul Park <byungchul@sk.com>
 R:	Gregory Price <gourry@gourry.net>
+R:	Ying Huang <ying.huang@linux.alibaba.com>
 L:	linux-mm@kvack.org
 S:	Maintained
 W:	http://www.linux-mm.org
--
2.49.0
