Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470FF252290
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744900928; cv=fail; b=Twp6uPblFEDQ3VosWpTtOvGlfqdJPCn4KAme7my9gcTVwMYH5Raw85q+9YCJ8dM4+HHYWhCe8VmwM7VXRO8eqccF7T2isl2RpzDi06RgSSjg86uAN/o59ZHRirhgbd4k8DikStyVi3567HHVhPcG9VYwvda2nSaP79NZDy9dcm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744900928; c=relaxed/simple;
	bh=T7TZWNr7yMkkclMq8FLyppMNWCsf2JTezXAzcItCmI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IzSuhCU2QfrZKYZPrcEI4eqXS7+WytMMRbY4d4towA7h6pNA29zSG8aRyTmtaJAyv7dWTtTCzfvMCAxW/xKHouFrrLXpiesmc2fyHyWz9V5zA3CMpN1i006LdVauZs5v0TjWnjUOToSqmwyr/Vq0DGByoZDa7MINkixEuDu9N6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fqZwS85R; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HIx9WK2l; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fqZwS85R";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HIx9WK2l"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HBpiIL005222;
	Thu, 17 Apr 2025 14:41:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=l6ZliAvTGzczCIhF5d
	0pADHlvrGUa9B2/Gff+pMsqzk=; b=fqZwS85R+Krv9E+tiWLbIE1i/SqfH444aE
	Mw/DKY3WRVBi2Is2as5aaDhUMbUagFVGAyqdrJ4B1U6eIfFFsJlQWs7I7Yy4Agtz
	EN9FizaC0Nz+pxWD4OFsJv6VUOt/QNopUhxOxTun5S0gNOCxb9AnyPLGviNP2Bhn
	b3CUa9X0TA+hFeAHnW9SqoNGkBI0Fy1xojMcdm9buKzhilSTb75SxmFkHYRHix6W
	5BmIEwA/YFpzvbX20bSEoFUOZwRswe6EjxpQS/XkRSrVXEkEbhwpwKZGG8kkDiet
	gg1mf5p/9JEnlJR9AZAekskKHfHwiwQVwa2THadt42MMVUWR1xNA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4619446d75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 14:41:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53HESbIn008523;
	Thu, 17 Apr 2025 14:41:56 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazlp17010006.outbound.protection.outlook.com [40.93.13.6])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460d2tcatx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 14:41:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wuFMbzyFOIW5wWIj56P+d941sEFLES3Byvc8oqW7PviQvGOPcCgZh/Y4vOVPT6OztYH1xyyfyY6vMAwKQr7SHXO9yphy//yI9d5F6mr18sRimgGrVWDdRKuSQdbjzKA8pofioVVMEkc7yxXqWu052v8grkP9attTzIr4riueeE5PtRHjJSwpF1f8dYmdXCyeu0CH75YqEBNQDhn/iWh8NwrDH2U8D9twcoJcRYcR9KxxaebkLkQ1tc9W3Brhq+m9cWtl1Won2bNZE8+GBlb/8Lc+JduJM+Yml+hBNwtbsYVVc6775EyRgsPbeuxGcllgcZ5ENheV18jm97a5pdfNqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6ZliAvTGzczCIhF5d0pADHlvrGUa9B2/Gff+pMsqzk=;
 b=V1OldeupHmQASb2V6g66auM3ln2sdQIJ9IuiSUTLsS/V0nfdjHnsxlGkZE0+J7wuj7skjLE6TmRu/OL/1UYLzPR9GlEWpHB+rX+CIa5OHp4cyFRp+K+1agsuMclJ1ZVHBdPKO40606ZkfV11m8tcG28N8WWO38c1lzqPl02iNclBtKCS1orBbiNsI1u8DNbaDNLuJZ/gYdLxk3ql93vRwNJ1bYTk7HVUzhmvZdOW12NW8eoiQR0Bs/cFw7gEWEQvYevw62ghCgPev4CX+GMk1q6QRW8kpmEgJ1taB6JeRV67QbbEaYzJTZ2ITB9C+b5KmEnzrg4PrFuVph8p88s2Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l6ZliAvTGzczCIhF5d0pADHlvrGUa9B2/Gff+pMsqzk=;
 b=HIx9WK2lw5ocyIQUzH/AKwm2o5HnF8kHnc1/0qrv+DziL0hwgo/pfnyx0j8TXuVnL67btp+k8bsJwvQ12955OLENAVLLC/gp+kbYqkIkmLXN0GTgKs7CBO/H2HQO/1eqDD7VyMr13hWhma9YDYkpz2YnH9R99MsFiEXLBIgomuo=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by SJ0PR10MB4751.namprd10.prod.outlook.com (2603:10b6:a03:2db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.28; Thu, 17 Apr
 2025 14:41:53 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23%7]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 14:41:53 +0000
Date: Thu, 17 Apr 2025 23:41:47 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH] MAINTAINERS: add reverse mapping section
Message-ID: <aAETK71jeoaW0qHc@harry>
References: <20250417084904.16806-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417084904.16806-1-lorenzo.stoakes@oracle.com>
X-ClientProxiedBy: SL2P216CA0212.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:19::6) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|SJ0PR10MB4751:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ca23010-9bed-4013-f197-08dd7dbdfe72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HUIlzryhtXgg5Gd/2RJ406Q72HAJ6zwv4TEwbn+sgbqf3vQHRb0aAATnllGc?=
 =?us-ascii?Q?35zoH5+/rAp9EOPUnXPStAPcbNvP5+KdafIv36/wk8QdahWu/mnX8PJgp1PC?=
 =?us-ascii?Q?PohbJUBSvFmq8PrJZ8rb4YksCfMYAsFDLHc6DnDjA/y9KtfIfxoz+R07tFVP?=
 =?us-ascii?Q?Jg5vpSauTpavEmJJLMCRR3hX15pLYLd4xPN1GIsKWdq1WK28ThOs6Y/Zm2ku?=
 =?us-ascii?Q?4PcpYNG1xGGeSsGvYrK6md/+aC8WCGz2456apfOFBOMGr/LHeL1TBdxZQydN?=
 =?us-ascii?Q?LQLllbaayJc87UhlvXBk0ciGBw5esGTCBRJrzGEFW4F95e5qvX4jyRpeelLQ?=
 =?us-ascii?Q?2MaAo9iXjCAyLLsBm7O+r0FpkQa4/GFzdtnVVzun0AncngljePQ4JcCLlx9+?=
 =?us-ascii?Q?sOLhuaYh+DHoVmRIGTMTaWVSya/5c+t0c2LaH1rB4J4ZoFvmHzIgWOhGHaHK?=
 =?us-ascii?Q?654MtBoo5xLLf8sX7uvoJ69omZTQ1Hl/GYh2TX/lSNidyeUAYE7+gH8mE+xq?=
 =?us-ascii?Q?zgVEO2Bi1881FyMiNJOeeIhqytlLQYdF5vWKik882v3S3Ta/YIzm2Y8fk5bT?=
 =?us-ascii?Q?UXOYR0wI4vaZrVtii934N00eA4gzXjdZdg2R0uE71KVEcw2VFYV9F7IgJo+d?=
 =?us-ascii?Q?g8Me/z/ie4fkHXXpdUaGwB1UB722idYnaGCkXC+7P1qjcRcaTHpBzXxU3NN/?=
 =?us-ascii?Q?fPxoyFraQQqW7ZhmCGJ6XahfXhBcYG8nRo0j6Tp9ZaU/TJQyEFchF5yrwpeX?=
 =?us-ascii?Q?oSRXnSGxewIaNlrdPNq0Hq0t7/KtDmD0yh9HzO27wzXIIUYRZd05tRLbhUBh?=
 =?us-ascii?Q?HGUE7xHiwKF4b4LA60Z7hP+Eq60j3NYEfqBu7zmpsIlkL4qB9SO9AT+WofUN?=
 =?us-ascii?Q?afTdoIzVEp/M7ZuZMqRUMtdq76C5YS6xmuxtMdXZb8hW0ROyAChQUCXpcn0S?=
 =?us-ascii?Q?TNWGlQDYvyLP66DInDsuy8R8aR6XhIsoG5ZrUjxLt6FPZHrWhhJR8ORYQqcT?=
 =?us-ascii?Q?NcEr8MbgUqfDszBdAzylC9YUX8uuCPTwFLdku409y295ld0gnj4djLgVk3CL?=
 =?us-ascii?Q?zxw4/kOd57xzCkBeq5IkGvnwISfjOG0yjdrG2K/5SujuRhRybXMkmMrYoN2A?=
 =?us-ascii?Q?DjeAsxUieCZSsQ4t7jRRtIAiC2LLPKp1KB6N8f56yZ4XtlKTxFvvTOQWOQ6o?=
 =?us-ascii?Q?S5BGro2EuB8QZx8bhqs06oEsIKN0g3FEJJreoxh2VsZhJr/OGrGaVNaSfR1r?=
 =?us-ascii?Q?9wzAEKe3qghgaqLewstpQArMMGedlHLK6XdR8xy52BmNGB85J3TeN6XxiJVM?=
 =?us-ascii?Q?dZGhWvPeCKLVEWA5MyRgUWnnq+G5DuqSCZa6YIIKedSRT3HZcf36PTY+Trz5?=
 =?us-ascii?Q?5APz9XFon6+EpKZslOEGB+fiwmjxclPilFRd/b8hzyBvZi7LQW+LRPv9KPkc?=
 =?us-ascii?Q?UQ9gL67OuFo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BT/PVS7207h83y7FmCKFAuqEYjslnr4kJ+dId8RJ9S28ksAjS1YbHOXje+0O?=
 =?us-ascii?Q?iXI0YnIUvWfJ8svdlkf28Mr85gP6Db9UtsKmyls745JwYV8H76yX1LhN+VKV?=
 =?us-ascii?Q?3Fl9dlu/NQVee3YT5aITS1Pulb9dGi6W7V4LJnpGkNN85QADOGBiUKfOq9iy?=
 =?us-ascii?Q?Ec8/tpQFmVb4skDFwJfYA0Wb5mfltu/Xw/nt720takdnmA6JXevepfh5TBLr?=
 =?us-ascii?Q?mAy3KN+EMfIScWVCpLeB+/ykmp6JFIfG14Stw5kbMLeKf52dpxijJjEi/AeO?=
 =?us-ascii?Q?S7q1gl2Ir/N0ukfX7HxdF3mdAf+/ri9MiP7v+vHqZSZoPlY3Be5kNxObEhZx?=
 =?us-ascii?Q?xPnP7zufestLyhyfDurCAExhZK72GHWn8g8rABJy+bYMDn4zjDZ2HBbRUNcA?=
 =?us-ascii?Q?6ZGflunHYdSqGUnRhfuH93ylPpaP0djnP8cDIthppceGpCFqoZXdeIhd8493?=
 =?us-ascii?Q?XrezoK1MFSS30OWZySt/arwR1QL30NVJnVjpcarYnYIIvTBfytN7av1VBG8c?=
 =?us-ascii?Q?jlt7aMiyI6JhuuEq5G901H5GDZm9EJLFppOWX4Y8Dzc9bvj+947ybMetxZ3D?=
 =?us-ascii?Q?8t9Ab5tahkduhitd5Zq8LcQULLtDMklBa8v7z+95XO6IXuX2Enqgp1C2QQo/?=
 =?us-ascii?Q?jmKDBtyooO+a+DdbSZCR2/Lghc23NBEaiV2Zr2TgG0E1p/0//foQWrHNhIwf?=
 =?us-ascii?Q?jxT3dqJjhq8fmH3wQG4KPChImp4VAwl6Gf8mNuXMyTsOnczNpfBhVK4CDOaP?=
 =?us-ascii?Q?g+a3m6J6Ys77EcpmWY01RZDBcrJb01TQjNtd5GMxmgKGJdmTTurCg+lTI5WM?=
 =?us-ascii?Q?AyNXChX7P7jKkE8LAaVUJlvBDsXWquYpY1xQizmc7WiJFFJTzFht60/LR3X5?=
 =?us-ascii?Q?Urzz1x9kiwn2dyTWWe3jQzE2Dz+VB8+0LcKH9h4UmCfKe/a+jalJtHmGXp8u?=
 =?us-ascii?Q?v7stn2yPqEFBXZzefPJmUoSO0sNnLE0tZLDs/vX74d/Eh60DTEO/sHYq7YTK?=
 =?us-ascii?Q?y8Ksru4eL4Msg/ym7CRUcKPhC8hyZIZSMYYI9oFSsm4kwbwAijiYZ4amnxyb?=
 =?us-ascii?Q?aakf0G1ntUMgCDme8HPSPS63a+ZiwixrVXiajnYtmq0t04H2s+ROHDqTRIHx?=
 =?us-ascii?Q?4gVeBD6GH/+1wDsc43JW360BVeOYcebLqM8O3IMFb9JnzHnkgzqNjLm5Mppi?=
 =?us-ascii?Q?n5sAhGybT+yrzJK8UwMmFdmbOg3piJG+Dtmx7AasaxBZd1L0rmaUNqlTEehi?=
 =?us-ascii?Q?gc63Jy14ecnNAafAxXJGOJj8p4Cr+JyhVe1x0QtiPtM/oaJ4vh+Fv9PBfdA4?=
 =?us-ascii?Q?JOoZ0dUhjBV3uxfiFgKrKJxh9FLlIXDLiujMQcbXvz4KdIPYGVAMbdW+A2at?=
 =?us-ascii?Q?03Rl0A6l0HbERlxBuOKyTdKsKDaaaSzG3FTwK0y0CEK6MARcEpMIyj4APL1g?=
 =?us-ascii?Q?/qQY5SR8m/3n8/wWsna91Driy0DODkJjub77LDczhIdgYfP1Dp5bjyHeeLCY?=
 =?us-ascii?Q?b36xOMRiwAdGZTrYpCxs3jOT5zTbqkG+qOcPi4lD/O99Fye/pQAcRIydfATu?=
 =?us-ascii?Q?8w/Dcjo3xGUfvPN8NvKiRDgINjpAarx8fZAVGz+k?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	G2i9DRIk8oNzirivvWYLXju8vUySOJHsmI6t1f7S0SHEGdleJgwwUDYcgQTL91e5tRtL40ga3Nb0xCUSVyHVby2sthC+yPuzWrt7ZecUaTOvhCX1hn8x6hsvA7DF+XiK9SmWMXp0LTddtVbtdukx7iCHZCDJkeXntFccOUOUHJ+TWGdRx6g7RIjQ782BNVzjUWGqfAcyram91788Qh2J7wgomcAyBp4Nii5Zg10Ej5Ni8+/hnFBF6nHbBOP++iPlCeznJwhlsQXuqPSWS9LFH4kx9frLMH99D2W1Ket+0Abfgb4pcoGwBlXTHGZaxo1ZwkCkzLdgwbjvG24w7wsGRZbPlfhcFjUALCblSVH6ZNP5KaACZsL9R90MlrgqO2R8dBANMtIrL8oiaFaZkCGcEpm4wA3frurr50m1xWR6SkEywWMStxak79rfU+2qGqRhjATQGXvSDU4bGYEe29iduEXoK5rCrZ9q+bSVSj/6eaVLBhQRWsvj7uQdpj6/iiw0lH1lAeFBY4Jo15EBO3dQxDggPTXrpeps0P0py+gV0LRK/uyjbX+MvLkrnxAsArbr1+xYElhtbnCZfSvrO52dREZTkZyONVGIdT14mYc5508=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ca23010-9bed-4013-f197-08dd7dbdfe72
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 14:41:53.1287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7nAJDKzTZYKt6iZPG1Nr1Jcjh5VwsorZMzqp0s2mhbQaXiZjpoNOPudInue1vzYAenDffDYk/JNu7/SZhQAZvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4751
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_04,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504170109
X-Proofpoint-GUID: EkgAnT1pc7AFDxsFMimKlZxni89ZWcxF
X-Proofpoint-ORIG-GUID: EkgAnT1pc7AFDxsFMimKlZxni89ZWcxF

On Thu, Apr 17, 2025 at 09:49:04AM +0100, Lorenzo Stoakes wrote:
> Separate out the reverse mapping part of memory management and assign
> appropriate maintainers and reviewers.
> 
> David has long been invovled in work with the reverse mapping and continues
> to do so, so is well suited to maintain this area of the kernel.
> 
> I have a lot of experience working with the anonymous reverse mapping and
> continue to work in this area, and also have good knowledge of the walking
> code and code related to VMAs.
> 
> This helps people identify who to ask for help, and also additionally makes
> life easier in review.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Thanks. I'd love to help with this!

Acked-by: Harry Yoo <harry.yoo@oracle.com>

-- 
Cheers,
Harry / Hyeonggon

> ---
>  MAINTAINERS | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8d834514a047..4f6d09c3fd9d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15499,7 +15499,6 @@ F:	include/linux/mm_*.h
>  F:	include/linux/mmzone.h
>  F:	include/linux/mmu_notifier.h
>  F:	include/linux/pagewalk.h
> -F:	include/linux/rmap.h
>  F:	include/trace/events/ksm.h
>  F:	mm/
>  F:	tools/mm/
> @@ -15539,6 +15538,18 @@ F:	mm/page_alloc.c
>  F:	include/linux/gfp.h
>  F:	include/linux/compaction.h
> 
> +MEMORY MANAGEMENT - RMAP (REVERSE MAPPING)
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +M:	David Hildenbrand <david@redhat.com>
> +M:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> +R:	Liam R. Howlett <Liam.Howlett@oracle.com>
> +R:	Vlastimil Babka <vbabka@suse.cz>
> +R:	Harry Yoo <harry.yoo@oracle.com>
> +L:	linux-mm@kvack.org
> +S:	Maintained
> +F:	include/linux/rmap.h
> +F:	mm/rmap.c
> +
>  MEMORY MANAGEMENT - SECRETMEM
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	Mike Rapoport <rppt@kernel.org>
> --
> 2.49.0
