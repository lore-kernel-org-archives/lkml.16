Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6662320B801
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750838157; cv=fail; b=E9MIaw0WCfRr1OVy04waYwhBy+6L5OW1p/QGMY/pHq1JuZ45OoJzMqtSY+6/h2dmpGIFkRItqBciUhINO7und8Te+LG9k/59jQgWbx+ntSDk2Aq9cl0NrcyaHNA1xLRHafInhLYtiEEKG6C3Vin5zpZyCxuBqLHPncNmnKUlQl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750838157; c=relaxed/simple;
	bh=pLT1H9GR5rbbelrl32Qn++DywiG+MgIDHUdPzQiElx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Vqm+zpWWiEc7fnwlfT0FfO7KKXvdHAkCpoCA6FpMr3+yB0bZHdGr+zEu2dOthJBp4tELCEdIvbwK1bv3T2oDvuIxSQdyMM2t4l+thlaLDLqp8FOyYQZKPy9Fzs+HnLCzkEjpMn7ag3vQt6h0Th+HDs+vktKV0hKm6yZAdmhlz1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XdzcHbDN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qVdy9NAs; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XdzcHbDN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qVdy9NAs"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P7fiVH013233;
	Wed, 25 Jun 2025 07:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=J0pZE/xv8J+3SSDjdc
	UY4R/Mzy565Cu6BxdmNvcChjc=; b=XdzcHbDNAxaj8KqJTDHwxpVtibjisUxaqa
	HFpU+N/Osd34VIJsigxj1rf8qmYs9ht/tZjMTeGrG+nkQNXiNgrTB5Pa7o6mVL3B
	Pi16y+YWi5w3cwOVwAV5/AvCSddt3kxeVgdfwV2jQBeUdtEq4yrRbTwCwxczFgNB
	BJB1r/XPaJLExQMTf7qcy9bsHn+hdQNIprX38gqgvyS0x+MFRZVKek1s/sZH9NRi
	dmHSmW9lrrtszEgrtOfSlSpXCixSGgEYxIFFoYp3wNSGIlQw9bb8xa4f/WfIAx6F
	cNjWiLE0bNvaXYGSSaOydxfp3jAYFiM68Nhvet5LbyNi4U2mmh8Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8mxrb1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 07:55:38 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P6t185025285;
	Wed, 25 Jun 2025 07:55:36 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2056.outbound.protection.outlook.com [40.107.244.56])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehvx7xd0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 07:55:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hTK43F2CxQODJjqq9KvWKA2hf7QFz7I4tpvS6TUa37WihSBsCnpQ+WPIAOvIWWVj/lzmGdp2YxbE4/dm8QMvPPypyuT512dTWY/uH0/tH8Db6wgdphWoB9A4Pv9x9RKy53wssVxqR8jQkHu3z9WIq45u7LZUkPxz3B7VMYFm0ibHmEI1jxMqIjs4U/9H5DXBRgy8Advn63LUUZdIm8eWjm5naiXOjnDJm1jYqt6nULGUvON2JNGAjSy4PoLYVolYw7RiZVCjhtmoW6JzTH8BT7D4NHIe6DSiHYl8M6ONkYsSm96wSfIdtm0uhztrct5an18nv/94Spina+rnBgCOMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0pZE/xv8J+3SSDjdcUY4R/Mzy565Cu6BxdmNvcChjc=;
 b=crVDh6xUiu7zYWk87FZI0Tzcl6wuiOJ2kVPvdvRpFMoSJIIA/hR2mFhxQaXcl42ItP6ULYflmhZj64QNDAWLlfEYLdxTn4tHdGgRfsFsJSprfsWoyg7Pr5uEUUS1lFt0SLFfFk7F3wlelbnISMA1NU7+IMCmO28lfzUuF9AN0C1nN+0O1vnFX8/dBddpvz9giLM9NyvgI8xQ+brNrDJCkIJHvFUHFsv2tEwRaNcYgYtNA8S9xKbgTYV6rS2zm/Ddjt9fCT2y5jOfyYeOCXioR7OskzvPnIaYn4h4b3HeHWIhDQrW2jxmutWUlBjhZctoUpeZ+BIaIkHjs2sYK9WIxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0pZE/xv8J+3SSDjdcUY4R/Mzy565Cu6BxdmNvcChjc=;
 b=qVdy9NAsX1yBQjqJoTghRBFDjhNgeKH/aCQDgmp2g4mWBSKWvRa86EhJGhNrFzbXZRsk7ZN2HCJFKA4vuG+sbpJBj4fX+cHTop7/PC0U0K4/U8GCwlzAThCNSj2j+8uWPWdw5rDc8Vcy9dIbvofwVCcTkFfbLh7p2FDzcmhT/zs=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM4PR10MB6183.namprd10.prod.outlook.com (2603:10b6:8:8b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Wed, 25 Jun
 2025 07:55:31 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 07:55:31 +0000
Date: Wed, 25 Jun 2025 08:55:28 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Hugh Dickins <hughd@google.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
        ziy@nvidia.com, Liam.Howlett@oracle.com, npache@redhat.com,
        ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
        zokeefe@google.com, shy828301@gmail.com, usamaarif642@gmail.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] fix MADV_COLLAPSE issue if THP settings are
 disabled
Message-ID: <01d679f2-fd64-472c-b9dc-ebe87268ce82@lucifer.local>
References: <cover.1750815384.git.baolin.wang@linux.alibaba.com>
 <75c02dbf-4189-958d-515e-fa80bb2187fc@google.com>
 <f1782ae5-c1d6-4f46-a676-666505990f4d@lucifer.local>
 <008ec97f-3b33-4b47-a112-9cef8c1d7f58@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <008ec97f-3b33-4b47-a112-9cef8c1d7f58@redhat.com>
X-ClientProxiedBy: LO4P123CA0380.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::7) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM4PR10MB6183:EE_
X-MS-Office365-Filtering-Correlation-Id: c17e0ce6-7504-465d-50da-08ddb3bda85d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WVW212RYY77+NOG09gEZykKqxQ6VjUlsHBnyFC+J8w6RY5Ui0UK2QLl8WIH9?=
 =?us-ascii?Q?ZDe96Zpph/3pzoUBqT/5/uYHkVT/lipE1Ip9fYj76ixZiJvVImlTDqaBVAn7?=
 =?us-ascii?Q?Nmodrw015Zk82oxyIQw8oECx4TOsHpYpDq7HJ0UR8B6HeGeajFNaK6xS1D22?=
 =?us-ascii?Q?WfwZd2nOdPrT1WQe1XSyHGDCXU8qucNznhbeOJKvSu10Fb39mcxPD//MAnXL?=
 =?us-ascii?Q?Fgp6mt6DxrM4S/yE/Y2A4O+FzFRHn90DlqSiy2CkBT2GqknHr4XLtwpR43DK?=
 =?us-ascii?Q?4QoJJ/8X1XHyfJxjxi9Rsc4GnBqYESM78UnIfcDzSKkgEHjvPf9DT1ipypXA?=
 =?us-ascii?Q?0Wn1TjK+LhLNfl9Y/dku3kjY2N7BqybTkrxgf01Sagyz+kBP2L1a8D2+kjzR?=
 =?us-ascii?Q?U4G+iWPlYJLhpt78HMQHvt1VSJRI45ZAiyyg4QdW4j2WppkhWpevVCVnD2Mz?=
 =?us-ascii?Q?8MAxgKM6EXeL228XCGy6DJ8L71RbF2vgEBjuUxTBErBBUJfOctfJMGd4R0kI?=
 =?us-ascii?Q?HA3tnffkNM2Qm4aOOfNjOftBQtzv62vVJ8Qs3ZqznPSo0XbaseBM7thS7Dl0?=
 =?us-ascii?Q?RyOp2jvx39EvIkCS5u92KZDEaCpl2od40rteqjh+IypN/TKFre96B+/dAInh?=
 =?us-ascii?Q?w9tNv2PhFA6/6UgmvlZGW8G43T6+VOFXWX+T0727/hha7Yz7dgSxC7WapjCI?=
 =?us-ascii?Q?zxntxsGBm8P1K+rzKPI4SO/yZgJxIS5CH1fmlB8ZownHcIWNTaEZJimM4keG?=
 =?us-ascii?Q?ujGrIZY/8ZQcUDpyXWxjXyHXcJ74kbVQ+xXpzH7z6G+fuwLDj0BEhqB+0yo4?=
 =?us-ascii?Q?K3HbM5HNUVr6YsPxlrFIRpqtaM5h5apdRTHQLARssqI0lmigZXHpQbUPC65o?=
 =?us-ascii?Q?WuiWFyBnHa57/Auoct5hBTkCGn1bWxGwInmMQE+FSW/dn2a81DAnUiV+osqZ?=
 =?us-ascii?Q?F71IMsMxGu7xK3+M7/hNqEf5wEf1ypnSDky4oGypKFBbCuAJNOl095PKlwjW?=
 =?us-ascii?Q?jQ+iBrWtSozO3GxW8CnuCuJvGZhycFe+HPgLpEBTIx2EYtRdOUXO8OeLYPZN?=
 =?us-ascii?Q?+CS/VjGp703xn22lkbnoXwkeJZ1HCdGNSgUyFox3Frws/V7QONqilrN9saH4?=
 =?us-ascii?Q?6xdU6VW8aUR0yMaOESxLwRI+sdryFJenrY4sbo82zav29O+kGpfvlABKn1+u?=
 =?us-ascii?Q?K/WCxVe741FOv4/qNgfdB1wxAYLeC7vNNTAI+V03cYcxkOO99e7YHLNCV0Qy?=
 =?us-ascii?Q?3E12Rivb5zfUfh9qdgBOoSfypb8n3ONMxgSmyRfOCXVr/NoFqF/zPtP7NPcF?=
 =?us-ascii?Q?1qGGdJGeMKziL34uH4sLOYk46U5a1jXK+M4Mu/1Q4/Oj589srSR2kdzoYrDo?=
 =?us-ascii?Q?lrffs60oCe31a3OwOdl5qrYOFh6A6CxSr9cXmzavYcYIOMaUMNJFV9Oi+85p?=
 =?us-ascii?Q?D+kIb/RN2qg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QTzvqaEqTK46388iqaGkgtmwXf85+URU+OUi/7vNVKOydjXPGcNNtKPIcrE/?=
 =?us-ascii?Q?qklKTfl5VF2tqxE8FV2OJDRWbRsPPDiVUtv6gxUxiljUDU7zF2gKG6mBQas6?=
 =?us-ascii?Q?fTcfJc/x4RUohMUINvww1rd1rlt7EDOHm4L2RrYgxWIz2Cm6DjF/JQEb8Q+X?=
 =?us-ascii?Q?RhV3gFs9ufs8ing934GoM0tVkWciWi/MsdT3bPUFSj0kfcTmHAvyQwMEhOFa?=
 =?us-ascii?Q?CdwUaqMeeO23z+fZOfzd2Rzq04KQQWnJeQyqoE6kBPKBkxezL4xV1B/XR9d/?=
 =?us-ascii?Q?Mks8mssbvkCZOq4eTKRaJ2m0FHD8up266Av4g+hRttyN6x5wxjH3ONisYNIO?=
 =?us-ascii?Q?7Fo/DM5tOIU+UImFFKr247ZLcy7YEdfCRx4O0zpeIf7Zh+yWMhvm1UGKNVG4?=
 =?us-ascii?Q?3GDnYkr4AlX4Qyn3NLjeklXOUQ+mFPiK0nIiQ5vIt3QF97Tfc1gwoQS5ncyI?=
 =?us-ascii?Q?nZe63Xgh5Gmzypuh9pIfYrdGm2DSO61dV95ZDKErRuHmFkp2Bn1ffl41X+OO?=
 =?us-ascii?Q?h4NFWxY79+a0wyA8cG05uU7MBKnX/nV+is758j1nOSNkJtsIepyhX4URYMWh?=
 =?us-ascii?Q?E1+3EXT+xKISG8TjEUEoHXcyu6Img9bIsbkmLer7sr0VekiCFLpCINsBXa2W?=
 =?us-ascii?Q?CiQkoQelWEVQBqBDDhKKxxcQ9qljST6GNDHUePgwsqcFGQnsRVE5Na2opKNz?=
 =?us-ascii?Q?VZJvzE9uPJ2mhLju25c/iJK+wHZAjdsjG6GpqPuHOcDJA6tcJ/FDzTxlV+75?=
 =?us-ascii?Q?c3lRGr4oATCHKAGbbGLuqOtMIby+Zq2CA1nsfPBnZiOIhsI07IwD12rk2eYv?=
 =?us-ascii?Q?zuxGD1hilFbJIvOuldt85rdYdCWrJRCAl8Cwk3xs8/bbHU+Z3yOEuk0GZn9E?=
 =?us-ascii?Q?mgX7a4kffTvaafZp7noWlTZd7XoAgqecx581pTD4RQWp6moitGv3u06C5edU?=
 =?us-ascii?Q?QV2TG+NK1bf+fh6TdZePursMZHl6CAw1R/3vghov1OtN8RcR3xiVD7U7dI//?=
 =?us-ascii?Q?6/2L0hK1w2y7wiCYFlEnYKKr+axa8cMRLdn/31SEZYiuMFdhHJvxYdqhaReR?=
 =?us-ascii?Q?kF28NVvpgGQvEgZEItr1khAN6iUG5FNrBCtMptlZlfn4lbJ47Ch+C4Qo4k0u?=
 =?us-ascii?Q?WNmDdVUtfLTY7Hf5oTfYnJ3TAtolROmw1JRnNsyKav6uzDWOD+gq0VCj6/nw?=
 =?us-ascii?Q?MehYPpU5BW5tQ1YJfQ8fg7p4TEKjTZ1QoAT8uXT1iLwYTPBbRV/ObjO0EoKt?=
 =?us-ascii?Q?jp66gvyiEAbwzcPmDgHDRc2pN4pvmriGw+hGdDT72oaPWmeV/yNPLZKcpuNo?=
 =?us-ascii?Q?TFGeEbjQtTGH8ftxY7SB83RefjGx6rkLMNVs5aWQ10gXVBNQBzgDmx0eNyQ8?=
 =?us-ascii?Q?VoQ2PBWyGC9J467ggLnzAXuFoZIVw3ygnT9lbU7v3boE3gacX288RePzrdVh?=
 =?us-ascii?Q?LY/WTeW059GPM4AovY5NKXMCk86vY0GrsKg4ZoLf9HWgC3LbgCIBWcarRNL4?=
 =?us-ascii?Q?FspkTWtrX72w1QO8H4hFHK17nVkjUzCfSFsmMramjLBE1K9xIsPapCopo8Jb?=
 =?us-ascii?Q?I6Azt7aIdzgY0xnj4pvQhcqlREfUv7n8eN1EdJLY8UFQO0GVZOd91wePzoR+?=
 =?us-ascii?Q?xw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qVsnpB6H6X1zaaLNtZ93HyOAxdlZ8g5dW/83NJsLxS6zcse3fzQrjnc/E5JHmB7eYqsVGkjd2lvE7AWa++CDxKMyRU8nFLwLzs80VrPEexnmbNLLtVbE96bx3zf/l8O66ywugCp4HjF+IoU5zKavXCsr95AzC9zhnj4bw3QKItL1BzAzZQqqLbI6Xi6zOdeTqkHSurVHPVMELSxaIb8wrrsN9gCjR2Ig+cW2ISLATy6NwHqJmsmga1aSnB81KkfhEVkPjrYPapk+M/YwMPqRHT4Wxo1af+iYnd4X9H+2F3Of40Xjm93lH/2FuLwPDnRaEUaKPVwWhyO8ml3C5b2ME9h6ye+gmjtFt9qEgLeTeGs+xIEctCfypMyolCy6g174rdNimUhlIFeEInmJ5shgfTPpHeZFx70p5+Lwl/kC4sESQHsX/FljrUkVXJI5Gs7hSQv/G0k2qVBmLCJLkgsytVlRNtu8Y4uajC3qhXf7RCSmEuMeTTZ44zX0brta7bjEY3qAJXISaCKT753khKtCiPt6+aeWrTQ9V+a6qmgwG+ReP3mwfdHcej/e3HEgpNF3Z+jDJBjiWa+gvv+oE05DCL9sxDFAJ5IORfJMC7EZtJU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c17e0ce6-7504-465d-50da-08ddb3bda85d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 07:55:31.2021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yM/SjQl2fE6d4jVyYs93Wi0vqYjC4i7cQI3r+FqE1HU/e5vmfvt0srewWOs2hGtQu1q2VDgveON7d2caKhM5WBh9EF+xP28CTGN5ImgStPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6183
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506250058
X-Authority-Analysis: v=2.4 cv=IcWHWXqa c=1 sm=1 tr=0 ts=685bab7a b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=OoSfaKEnZdg-jq5oWe4A:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14714
X-Proofpoint-ORIG-GUID: kldoxtsG6_KhIYkdZBbhov2LnoBw-3hG
X-Proofpoint-GUID: kldoxtsG6_KhIYkdZBbhov2LnoBw-3hG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA1NyBTYWx0ZWRfX3lixMGrHcBpw SsjjzqqRlqASBpf9BdlvJclJELVmpDdsu/V2LHJZOQxeDJfSZXc9/Ac4ULbzihBq9tf1Zpjwn+h Eld/lg6PVK4EFB2ZMewUyTSBhC9TzkhrL/ITSiq0X/fYwC8chpADlVpdknNiER51zyKNDtStjR4
 o1E/F8T94HmRs5jyp4UjOhNPd5pVtVtY9vd3wTI5mUlNhmZHXmozsuBaBETtd/UjcB7S2PJv35J YSFkicsILm+1gLFJ4A2Aim0pFr1w6nX34z0TUdJjfoFfeIKsINH3r+Wdox4xG6afY7fAsSFEjuU AHn3FdVoR+vc4hFfMEANP+wO/ldTjB8q6xQRUDm73uncTSvGr9zv5MlTxuUy5nPKUIHm/xeNZil
 gEChcXQPCdWREyHsq0FODeOmdCn5ZF10DgZr1bVnlY+Z1yUVF9Xs6FmkDSfLTR00KZuMWqfb

On Wed, Jun 25, 2025 at 09:34:51AM +0200, David Hildenbrand wrote:
> > >
> > > We would all prefer a less messy world of THP tunables.  I certainly
> > > find plenty to dislike there too; and wish that a less assertive name
> > > than "never" had been chosen originally for the default off position.
> > >
> > > But please don't break the accepted and documented behaviour of
> > > MADV_COLLAPSE now.
> >
> > Again see above, I absolutely disagree this is documented _clearly_. And
> > that's the underlying issue here.
> > > I feel like if you polled 100 system administrators (assuming they knew
> > about THP) as to how you globally disable THP, probably all 100 would say
> > you do it via:
> >
> > # echo never > /sys/kernel/mm/transparent_hugepage/enabled
> >
>
> Yes. One big problem is that the documentation was not updated.
>
> Changing the meaning of "entirely disabled" to "entirely disabled
> automatically (page faults, khugepaged)"

I mean, if we decide to drop this series, I will fix this in both man page
and documentation.

It'll be basically heavily underlining the fact that sysfs never DOES NOT
MEAN NEVER it means never _automatically_ as you say.

>
> > So shouldn't 'never break userspace' be based on practical reality rather
> > than a theorised interpretation of documents that sadly are not clear
> > enough?
>
> I think the problem is that there might indeed be more users out there
> relying on "never+MADV_COLLPASE" to now place THPs than
> "never+MADV_COLLPASE" to no place THPs.
>
> What is the harm when not placing THPs? Performance degradation for some
> apps?

Right, but we're already not placing the _right_ kinds of
pages. MADV_COLLAPSE was a pre-mTHP era thing...

>
> What is the harm when placing THPs although disabled? Making the life for
> David for debugging customer issues harder :P

Well Baolin pointed out the case of a system that only enables mTHP for
instance. Now these apps all get PMD pages. That is surprising and also
absolutely reduces availablility of mTHP pages.

This is a very big problem.

I guess this comes down to - do we have users who are _absolutely reliant_
on never + collapse?

And no we do not want to degrade performance. But do such people exist?

I'm guessing Hugh might know ;)

> > While it's useful to have this, prctl() is where APIs go to die. It's a
> > hidden wasteland that nobody knows about, it may as well not exist.
> >
> > We have a whole sysctl directory for configuring this stuff. It's sort of
> > crazy to have that then to have a special prctl() hidden away also...
>
> prctl(PR_SET_THP_DISABLE) is today not really a reasonable way for an admin
> to disable THPs system wide I'm afraid.

Yes.

>
> >
> > >
> > > Add a "deny" option to /sys/kernel/mm/transparent_hugepage/enabled
> > > if you like.  (But in these days of filesystem large folios, adding
> > > new protections against them seems a few years late.)
> >
> > Based on a reasonable interpretation of 'never' I would say we retain this
> > series as-is, and 'deny' could be what 'never' was intended to be before.
>
> At least for shmem_enabled never means "unless overwritten per mount through
> huge=" and "deny" means "force off for all mounts". So "deny" is "harder"

This is so... ugh. Lord. My sweet English language... "I will never let you
in here" vs. "I deny you entry", one is a lot stronger, and it's not the
latter one...

Anyway ok given that this is the case, I guess we could use deny for this.

>
> Inverting the semantics here might be causing even more problems.

Yeah you're probably right.

But obviously every distro who defaults to 'never' is going to get a
surprise here.

>
> --
> Cheers,
>
> David / dhildenb
>

I suppose the least awful way of addressing Baolin's concerns re: mTHP
while simultaneosly keeping existing semantics is:

1. Introduce deny to mean what never should have meant.
2. Use something like the logic here to enforce it.
3. Heavily document it (I can do this).

But I still find this yucky based on the fact that nobody will expect any
of this.

But maybe the THP toggles are such a mess that we're past that anyway?...
