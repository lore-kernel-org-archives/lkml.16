Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39782C1799
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745924648; cv=fail; b=MvRNw1kNSlRst0EkMjvp6yJLfxiHHT6Im4qNrQYoT+2PNhtG8jYXInkwJYsOiaGZuK0RUq1te2zvNcAP4Cb+byoTCU17iPmmfw4O8YalHaiyTBWF7ERYiM0CO5fmpBUtl9NS3xjQ7YVF8wS6iee8pJ6CboBKea7N69ulJ2IA5uM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745924648; c=relaxed/simple;
	bh=COGni2XC4NhSKUbBQvVQgl/JzwYIOODCHc8Ee9G26qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=n2qxZeaIaVRhga/B7GvlqvmvldF8Asn0qYUlLSikJ6cVt/JatjBHofgtQOhV97iJWs+40MHbQhiSZmDalpKDaWPUy38bliCiCf0jjDU0NA99rbXR/temlrzHni847zfwdMLuEg7BS8SynstLOzXCuLkCgGrY1ENw67Cyn0RCaWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WDuySYzt; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JtBsWsbt; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WDuySYzt";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JtBsWsbt"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T9W07k006996;
	Tue, 29 Apr 2025 11:03:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=sS8mKA1n5lImLPbeyx
	xpLSDXYaHrJCWoZNGmi1aMvRk=; b=WDuySYzt6KsTYzxuMgPPmKNmHOyfiYQXmO
	hWL0PZwH2yioYpTqPjhr+klASJrwC+Xv0JEx81P3a5Y1RNJNEZQj06QiJFHt+jnU
	RUMWckajrnXpsCVLa8hO3iqYQJ/mXxujS1zA1PjbF+oG77ywE4A+NkitTSiwhhFl
	4HZoh+XMgXeJ+9bYsKa0OGalnPqcQzYGt5YtQiuWKFYjd7nzrrQniENstOmSVbYt
	u4loGddy2NnajmTkS0o1NggG7oUf8qYhSfGnPWoSBGLqM/1e3ErKFRR4PMipy2ly
	k2Ww8xOEh3CPrkb1Nx3zw+fNGXXPNjp91SrcyxYkhTJksROAJKgw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46av7hr5ed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 11:03:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53T9oUq2001295;
	Tue, 29 Apr 2025 11:03:35 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 468nx9nrca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 11:03:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a8afj149zudBOoL9Lf5YSDCsG/gI591+N2gyciFaDuKhicQI5IrYG+0uzFUZdTV0Kll78Vp7bDR4qinLZWoyV9Ha91RIg/WSZHim5JVSQPu9FqaW8CoGDTN/RpqHiYFBoOsplO9clRUtJR3xCgoMcGlp3KTC7gt0O7cqopp5Ga1Kh3GPWRKq893ylWt9m8DojceKaDtsn5Aj6iOu55gdcgBsPWnT7uBnLLBsOf8dpfc54Gss6oJ5zZ4Uyxc25e6BO1E+NKZG+Vpo5c+Xg9zTD5aYBsia7pDB/CI0LsD9cIgJrTiu2MKExXG7mU0xcre9XYytkLVMYODhWcdgUuZxOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sS8mKA1n5lImLPbeyxxpLSDXYaHrJCWoZNGmi1aMvRk=;
 b=YkbXHpb3LkNH9h2VLJ8urO+A/X4M/6UdVhEQv6b/SG05n2SIu3/RaOlu/Zh52Y3PGGvh+Xe3fNlhHDe9fBkSaUkRNo6w1D3HynjC4sXS2G0cn5xwrzkxmQFyeVviqZHazZYD5N/+rTVCcSOYUWmc704GKcsT9GPAEN8x2lV5TJyMd84HQA5eoNOZSHOE7rNje2Ul+lNm7oXIs70QZCZqm2Ijcl4tfEMrjFZ+SS+MXm2teH9ZsQGuqBxiMPbSnUHVr+lNGYZqKxlkmcznYBDGALTQiv9ZMh4gMX3eZjlqAnsIsQGPvvPRdlbd2MSnA5pFUkU2NWTdI4zZuLHEb7Ywjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sS8mKA1n5lImLPbeyxxpLSDXYaHrJCWoZNGmi1aMvRk=;
 b=JtBsWsbt3EAhaWpwTc/efCAXDC5FIDlUEF10PM3ZSZSAwKOjyG6esgNC/ZwexvA0blF0shzfHazhkc/1rLXx15OVml+BRVVTh8mnsGd9vohlEm/CSa/tt74vp4SUWqBryxvNfRGtG4gkXOiG0beOi9k9p3tI/d3bXeFw+e16MG8=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM4PR10MB7507.namprd10.prod.outlook.com (2603:10b6:8:187::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Tue, 29 Apr
 2025 11:03:33 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 11:03:33 +0000
Date: Tue, 29 Apr 2025 12:03:31 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, david@redhat.com,
        willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
        vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
        peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
        baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
        christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
        linux-arm-kernel@lists.infradead.org, hughd@google.com,
        yang@os.amperecomputing.com, ziy@nvidia.com
Subject: Re: [PATCH v2 0/7] Optimize mprotect for large folios
Message-ID: <6ac365cf-da48-4791-b56d-62335519efdf@lucifer.local>
References: <20250429052336.18912-1-dev.jain@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429052336.18912-1-dev.jain@arm.com>
X-ClientProxiedBy: LO4P123CA0590.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::6) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM4PR10MB7507:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ce7e1b7-0eba-4892-3e5b-08dd870d7b61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ck4s6Ynfx9zP8dboF0jTdzX2gCFZupveWtC8mptEKZli1j8vzdyDOtgOlzMB?=
 =?us-ascii?Q?0ZpM34e/aKlILOARZzVsw8n4QQHDElfG9/6r+BdCw29Z4i28UlOz+RibGWoG?=
 =?us-ascii?Q?v7aAZB8XV09tdvnTFHj6n7KNBEidrQBVwkta85Ccfh9RF833y/2rzSAr1Q5H?=
 =?us-ascii?Q?bg3vUSSWehZu+r9x9T9fK1IgmjJ8vxksJgUedir9/ll6wpgiyPjqpNOGFfiL?=
 =?us-ascii?Q?orAiKyYZ4P3OYfOpn8cwcqyXPjUeGdJMkvnpz6leMJJvl2NsY42CKGo+R/26?=
 =?us-ascii?Q?4Nfk4nbzPgvIpHkj0wOb2Pwpxg5mylu2MOlnFBwdfyK744YjbJ7I+IcY3MkV?=
 =?us-ascii?Q?6ndPMaoO84d5kbTLOANFZvm/UFAZOhvKAz1WY7oGs/BgzyMTNaooRRxUpAxp?=
 =?us-ascii?Q?VppRvPjKQUF8OvJM/0146/+1FrbAZrFlenFpRD6e+0pf8I1FuP5v6Sid+r7Z?=
 =?us-ascii?Q?u+ur8Z9KbMNEtwT4lCYB3F7swrqRJBUQ1JggO1q9sYW3Ibafoe5EExlHH1He?=
 =?us-ascii?Q?7tOeONTVjTCBgwVmOuRjKPAMKjZav1cA6lNrs9Rxjkl03AUkYltTiwbMd+mU?=
 =?us-ascii?Q?xHB/3yUa4HKRsfSbh4W8QHFFR+vByQj3iqZn//E8wv8b4l/1IWlleXvl/X8e?=
 =?us-ascii?Q?rF2nwNchqRC3wa9R+OMsoaYaWn/I8ZZmpbmPQBT35lag3vqmXdCIrAc1T8SO?=
 =?us-ascii?Q?qnDYz7JEOXdO96l8prk29GMJ2g/WRggQy8Q6/dPQuqAJ7263imkf0+oBnTdq?=
 =?us-ascii?Q?cyFdEb9XIvaKzUBTUnvA8Pp/D1jam+ihDrOcFpCFJJtzbcrVClKvTcubOSzD?=
 =?us-ascii?Q?wAHSJY0ceReajOzQKdgfwBTCpWZUjd93/eOs8nnYb/X8hFNETE+RKG65WjxF?=
 =?us-ascii?Q?V9azZLANSYT+/fJmHxrDsjERv1b8gZ7jPIBPWBIXQuNDCBhZ2hwOk+iXtqO+?=
 =?us-ascii?Q?920nOOOjw7hyvwhcmrHlMypt7WvINEvkWFSW2Hli3j8xOCQZnEWZvSGoCnZo?=
 =?us-ascii?Q?BeEyqe2NH2v5XM/cLzew7suXo2Czmkh5hhUdCEZRjF8i4NhjBnKD4R+gWHuM?=
 =?us-ascii?Q?DDyWKy5O/qqRG/gbadrmBvhg/Lo31LfuFwmSIyyW5V0ZeLS0wBVH4ewYOFSS?=
 =?us-ascii?Q?b4qW7D5FOYHuXPhd60va5IVfwvOJX9HuaYZFPpGe4IwiBDNf3Lpf/ONU2YEw?=
 =?us-ascii?Q?trmBPy/Fjkg1BO6fZBdfm2pEP5GoaIiGJGdPpOiJV6U3f99fb8i5WCHndB1y?=
 =?us-ascii?Q?gOBH0HZgtZm9F2FT00nlMf4zoT7F0dCOoE4zcjfCwyJPkEHBTjlr4SKTckJx?=
 =?us-ascii?Q?26gXmf7j7BpMtnb5UwjRCoCtL+gKCWCxCdN4ItWtTXF3rjCuaAl7bt7evOLs?=
 =?us-ascii?Q?RAvKFqaJS4NIloiMsNDi1kO9ipNc8+KZf6JVW7FyvcqOOAx1qAmBHvoG3mzW?=
 =?us-ascii?Q?8y4oCJcxugI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W7E9hxT2TY/t04EfqiJnkm+CVt6tXLolYTmT9jYCgHbkjHlckaagGv1ednnz?=
 =?us-ascii?Q?300vLvut3ZosaN01ter/ehv08hhr+jYadKx3eVjUbB5DvizBtGXm2TOE+1ey?=
 =?us-ascii?Q?82gCz2tV/rpTLUceOGn+QBM6fqqxpp9zDQ/nNvTIbjtaJL9xPAAzip9Wm/wm?=
 =?us-ascii?Q?Zfg6KrCeFHQUlWcil5ONEUHQoakl0Mf1Gx+bUMolg2awe0MOeFU/FdiE7P60?=
 =?us-ascii?Q?M0uQR0JJhKx7eycVjK0sntLG3FW47KQ9XWpH4CYbB86ywX5AJwSyTThF1wzf?=
 =?us-ascii?Q?UjviUrIZl1JXIyoHva6TF0P3hALs+9SK3hXrRbbShwYWZPnWygHcZr7VszOV?=
 =?us-ascii?Q?dQqUaPIxVmC4jIqDzeMur6K+uCDfLOAlUD0p/Rn7EGhYQDg2wlW+rlOdIh/g?=
 =?us-ascii?Q?X3gAwmo8cLRwI3FbcIetRQ3rosCLU7nT+/SmYjwtBKAfJ+y/10rATtQIBncq?=
 =?us-ascii?Q?N9QzQNQBLZqcn9qD8SbtnuUVH4wtInJWFeOZYDnYdGmhD31eprcuYb8kHV7l?=
 =?us-ascii?Q?/SpSUClGFlEugRKKn8lOrlJH8s0dABqTP0O4gPzQxBKqj/vVV6VH+1vMioS9?=
 =?us-ascii?Q?m+jzYbje4C7IZsSSBpmdg4fN14gagxFskbpiB7vVUXKvtwLUKJmJYT/Iro8N?=
 =?us-ascii?Q?ztsoaPISdh6c/ojPvt0TMMlUr76EFpRnLdqqsahec/pnVwf+qr3KS25AbVuU?=
 =?us-ascii?Q?biUlZLoOj82L8sfvUtYw/xEm1a8fbBCbLOhhUxZ1HAX1+/L4ne0dMuuCYUVi?=
 =?us-ascii?Q?OJyE1cKU/GmaNkHkJueOeWuasUPF2NFFqTcOt9JBjo8rDWnXNe8NAGxip7M3?=
 =?us-ascii?Q?ZmQCSWAk+U7bGpIFQPur4T2Q2CmLPFH6HH9gtazD/5MfKe86wfKqhwEZpWwr?=
 =?us-ascii?Q?rZ3nlBcXLx3bYBkRsB4znj1mkV4Qoj1cfZUJeKn2Y1LXjfy0HzcJ0gXIAPjO?=
 =?us-ascii?Q?hKkaiPR1+6iOhxWbDvA9c/GtZmIy5SEtDF5kDHQ8Hc3kcjy/p/sgp/AjbCDE?=
 =?us-ascii?Q?MuEuCcEMoXWtIVjJb7MnAmwPNNdYFHENY0H2OjqmfbMfbPewwQ3cYe3o29wg?=
 =?us-ascii?Q?ANSrxbF3pFWEgjXC8c+ls2DrZIDCLxeVM/QT+OcZW1quK9O5855XIxcY2jnt?=
 =?us-ascii?Q?oa7Bncj3d0/JMXnwHnwVHh1WAlf/w4grbef46fkTagX4Om+cWeOw0ku0vzjb?=
 =?us-ascii?Q?JFahtNSwMXrWxBmDhmAnhJW5nPzlgNfweaWSEfXShuru9pPbdHS8rRbVG7cK?=
 =?us-ascii?Q?Hs8n1hkCnkuK2/UCOp16ICD7aYH+AzA8DfQdt7coGyBYnhJQX75MVvX8kkQ1?=
 =?us-ascii?Q?j0n/eMeZ9ZE4e7uFCbO+ri+FIrHQOJ129VuXzDoSulmA1vS+c/bngQFMdT1c?=
 =?us-ascii?Q?koGew8+BjEcUIVNZ+XssNNAB4qPVaakM72Dq3KjaneV7dl89JKwOUKSypj5p?=
 =?us-ascii?Q?PU3r2009S2IVb0bXifR2PZwA7sXzCxTVl/EHW9h2aA3nqw0H11FlKe3VLXdo?=
 =?us-ascii?Q?2USfphFE4LCnqB8VbRrQ66GUyU7WZLHqhcQkoasxaiDoULMwykE8Wsia203F?=
 =?us-ascii?Q?Uie6weY/ieEY+8boMiWjs0gqTvdQ9UJPTxjahTT1OGO++PV2rDsskSdChlrU?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	r69gPQmGQkMEJKimH3gWKQ6BQKSzeyyBiKyfyxT4hEjvh74Y6ujbJ7oPwTqfw646nE6zsbSeVgVs20/aj8l0JW4eT62qUA1cFuQyIeYIoS5xZcxAVb4OWADHMYMp9DglO7XzNoHc2QFDql29zpqKn9ByL2p74bsgdbk9Hv02kc/sdsTgDubLOechHU5asy1IA9CzBfmcnT5ssxW2ajuYoigRL10KscpZ8Qk8gJfl1JZ8HrFSCG/cCvHU3g7EpD/ZtK1Rh+7EUg/RguuSnGUf+bZHBwA+WInZQr4e3wzyzorbGakKvP3K35nh5gqty7WEeLhjnP13CR0USXg8FeIQ4XtbpJxRfRnc9WD2pg+tLzxqqxETx2Yb+JU6c4BhtOHeXkiJoyqyYsG4vJZTS12M2Gd/Hy4rAdYEDfk0FuMBNb0e45pCsspyHIn4Ei5MWjKHD70V77ZhCeQpByVWVTJBTCHc2sPLy0WmgJ6DA4FZ0KD+RqhG22kgYhyEzFbaFJJQ54coRXNoITY2JrfNMuZjjPuPvTnl57+BbWpdlYcb3nLXy1e3tCCHkli2s4X6yztVBIY4YhFW156mSDoNDU1edIx6NeWTsYmpx+L/CFpCV7A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ce7e1b7-0eba-4892-3e5b-08dd870d7b61
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 11:03:33.2539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ALdXr+bIl63OKwwWb7K3x7tAwCIMRbCs5J8rm8IlmaXLTS4BgF1tMUaGwo7ygxsJcbnBGXXscyqOQNviJNG5St2mUVlj1/8vMfiW9kY2QGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7507
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 bulkscore=0
 mlxlogscore=752 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2504290082
X-Proofpoint-ORIG-GUID: 26VyKUCf8-cvk-EK0T5u49aNbYngxDkE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA4MiBTYWx0ZWRfX5/Qj4GmJnLZz G2CC84g0GuxL6JZI1vekVVUUGFZViC74Gap8OMW/pBX5l1I1W+A4VVxMVxNtPK3ymkMyLvHW1Sp 7+h5Kl5tzXc8X/7gJ0Dx7vM+ArmmR9vChGbJb0MPVuP+BUlRm2S5gCyUpvE3AqTChwTYO8endXA
 XPbNCQpsL9k/cmrWcr5a6XuyOTrtHyrnK1hjk4TTaYeSsKybjUcnmmEYzon1IlxJ5HUGVxGp04Y Iplj818q6FJIIxM982PSpHMD+YO1g3lGHkxJvLyZhap7zHlWLQlNCu80lGI5txQW+7FZx17Fnsb 2bAI+ukfjR2EycCA3tq8v2K823XyefIkvDqBqNQIbB9nHDvESX7tXZLvIYAdaNh0RCs0Y3RYx/A QSN9k5q4
X-Authority-Analysis: v=2.4 cv=R+UDGcRX c=1 sm=1 tr=0 ts=6810b209 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=GoEa3M9JfhUA:10 a=eh1Yez-EAAAA:8 a=M4HioWCSAAAA:8 a=i75tgf7LcN9AgqpEKkwA:9 a=CjuIK1q_8ugA:10 a=srm1WMWxqhwntykBde7-:22 cc=ntf awl=host:13129
X-Proofpoint-GUID: 26VyKUCf8-cvk-EK0T5u49aNbYngxDkE

-cc namit@vmware.com

Also,

On future respins can we please drop Namit from vmware from cc list?

I am being spammed with these messages whenever I reply here:

'A custom mail flow rule created by an admin at onevmw.onmicrosoft.com has
blocked your message.  Recipient is not authorized to accept external mail'

Or ask him to fix this :)

Cheers, Lorenzo

On Tue, Apr 29, 2025 at 10:53:29AM +0530, Dev Jain wrote:
> This patchset optimizes the mprotect() system call for large folios
> by PTE-batching.
>
> We use the following test cases to measure performance, mprotect()'ing
> the mapped memory to read-only then read-write 40 times:
>
> Test case 1: Mapping 1G of memory, touching it to get PMD-THPs, then
> pte-mapping those THPs
> Test case 2: Mapping 1G of memory with 64K mTHPs
> Test case 3: Mapping 1G of memory with 4K pages
>
> Average execution time on arm64, Apple M3:
> Before the patchset:
> T1: 7.9 seconds   T2: 7.9 seconds   T3: 4.2 seconds
>
> After the patchset:
> T1: 2.1 seconds   T2: 2.2 seconds   T3: 4.2 seconds
>
> Observing T1/T2 and T3 before the patchset, we also remove the regression
> introduced by ptep_get() on a contpte block. And, for large folios we get
> an almost 74% performance improvement.
>
> v1->v2:
>  - Rebase onto mm-unstable (6ebffe676fcf: util_macros.h: make the header more resilient)
>  - Abridge the anon-exclusive condition (Lance Yang)
>
> Dev Jain (7):
>   mm: Refactor code in mprotect
>   mm: Optimize mprotect() by batch-skipping PTEs
>   mm: Add batched versions of ptep_modify_prot_start/commit
>   arm64: Add batched version of ptep_modify_prot_start
>   arm64: Add batched version of ptep_modify_prot_commit
>   mm: Batch around can_change_pte_writable()
>   mm: Optimize mprotect() through PTE-batching
>
>  arch/arm64/include/asm/pgtable.h |  10 ++
>  arch/arm64/mm/mmu.c              |  21 +++-
>  include/linux/mm.h               |   4 +-
>  include/linux/pgtable.h          |  42 ++++++++
>  mm/gup.c                         |   2 +-
>  mm/huge_memory.c                 |   4 +-
>  mm/memory.c                      |   6 +-
>  mm/mprotect.c                    | 165 ++++++++++++++++++++-----------
>  mm/pgtable-generic.c             |  16 ++-
>  9 files changed, 198 insertions(+), 72 deletions(-)
>
> --
> 2.30.2
>
