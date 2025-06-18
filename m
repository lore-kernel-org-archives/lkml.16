Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19E42EA17A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750266665; cv=fail; b=CkkDTaEx0SUBSw4IIxKOr1jeHj8q+yv49GXSzOOx0zB/IsTNUUU0za9XlHnXBXEsyvfmShfUY0m8dkblyZvshVD4dKdUlt+5OS2mZd/dB8SIspIp0jCDdv5jjaM0rvIGNSxiO7kk+WT9uyMMKmnFK1+8rIpDKyf6vhNpL8uoYJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750266665; c=relaxed/simple;
	bh=psvUH/PuAvgZVCUAAxhtre7OrqPoXsBca0wmM6h13AM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GnOU8hcrm7c3Tjof7kccP+t5rlvOqNxwECGY5VhtikOMBX/oH2Y+c4rCb2c/A8BJoqdzxyU3vkTRzh7wfP5aAviGntJvQlUfDKwfdhisqgm0i9y3dMGrsDgzm1RuONNo88g6cB3643b4JD6TpRz6GwZa/jUBJM1nWsHj4t2AP84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=pegN0mID; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XWq5AaTH; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="pegN0mID";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XWq5AaTH"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IGQXOH004946;
	Wed, 18 Jun 2025 17:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=enORvKngqYUEYG+Uv2
	cPWnnwGMdjlSw7PjhovVkE+i0=; b=pegN0mIDi5+K7UJRvldSKIPF/HDbVGniMO
	ngI8XoDBTD0KR+vXZQR8LOnb2Wz+p18StYsaP1F1BGzD76+vF1zMz7au4XEvacCF
	YkGlmdw/ULo4Qi0ZQ7aI2pMILoKwSgzPZ9RlPZJ7nyLbE4yxvxFONX7umi9rIs7v
	0Lv57Ds/vA6gnUdwfUoFMu+wbHi5m1di9n00m+jfsKCOCIE3ozp8KKbvHi3uWco/
	kqb1p4gdfc1Mo63YFFwdhHpw9rMzT/m1+EEesIikbEk6QqhLUG5/gNAzCY3cDRum
	XFN/KEbe6IF60Rq9FBqPJSRPvyKv1lOtBhLsVZV+AygdzaiA8Gpw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yp4rbst-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jun 2025 17:10:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55IFjD9c025888;
	Wed, 18 Jun 2025 17:10:38 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhh635t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jun 2025 17:10:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xAg3qHyEV03opNPMUamGztZxHc1WMsnAUWc94ke3FPYmta1bw7m0/nem3s0NFouKXLQK8Q+d6HZDVobDm8QakwemX1catmxocv9KT18a3WtpnMcy3cbteRLzyYiA7S4CL8unkp28olm4Z9Lzb4JCE0jNypi7pwbgG+T9sKEzN6pJ8PHb1EMMbcmufdEt3ZiOrUbSmALIDZwMvgQT53+NiC/+0esTKnF817MH1eJmeGBjHcAXouzKy87x+j3XZGtX3oc+gPMPJ5zhCVB3KdaEUYaPUfE3XrHndPJ4es7Q+oiYPeCPWMbp68RrJ/Q3N89KR2/v1daoNj04L5vD6VlbvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enORvKngqYUEYG+Uv2cPWnnwGMdjlSw7PjhovVkE+i0=;
 b=QgimVzp4LdcNtmfkkzIsgz656Dou2r+gHusSRUSo1O6iZ7shxUaiSGdaq+IkYA+Pkdw8/6ctwKPldSvc13mdt6zn+/0Wpd6GlZP3pQNAGjsSEoBKbpO6mHKmGXcQ+0MS2HIzSgLejUmXeDIS1u/xcUdYvISSjKH/weJMhTgIi9sY0j4959TWPNCx/1J0eO25dsZBXRBt9rxsU5hXheYUNy1Zolqr8RRLpzwcaAeanuSmiuqFE18LLh3cdEUBBYdhWLHE1k0yvVFsG69Auwm2tUYO9Be4FYfhl/gdcSupREfsykMWvgj7Ca5lJwYXJkqAwj4gzwzMS8Ik7nNsAHk0ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enORvKngqYUEYG+Uv2cPWnnwGMdjlSw7PjhovVkE+i0=;
 b=XWq5AaTHFe+08kLTII/B0mYzdNiykmEI54xEh36NpYZM+t1TXsNI2UX40q3PJYrXqp2kpF5P1Dupx8Q1rscxFg3KFVun5L1XKIoxlrEPOAsZ/kZXnmkf7SlxP1q1v0fWTYGDCzd1aMUFWfnc1jF4xy73FpaObxa4ADk4CJuEMaE=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS7PR10MB7189.namprd10.prod.outlook.com (2603:10b6:8:ea::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Wed, 18 Jun
 2025 17:10:35 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Wed, 18 Jun 2025
 17:10:35 +0000
Date: Wed, 18 Jun 2025 18:10:28 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, ziy@nvidia.com,
        baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, baohua@kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] khugepaged: Optimize
 __collapse_huge_page_copy_succeeded() for large folios by PTE batching
Message-ID: <42aa7d12-3f84-4ee6-a067-5aee30ec677d@lucifer.local>
References: <20250618102607.10551-1-dev.jain@arm.com>
 <738669ec-a9e5-4ba1-85a7-605cb4132d05@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <738669ec-a9e5-4ba1-85a7-605cb4132d05@redhat.com>
X-ClientProxiedBy: LO4P265CA0307.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::15) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS7PR10MB7189:EE_
X-MS-Office365-Filtering-Correlation-Id: 73c83e5b-8e9a-4f93-67a0-08ddae8b0a17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?n3eoxFi0bKfchgVMnv6mslZoR7E7MJo6lkWiRCWNvX5JbHBNwJqPrsH1W9++?=
 =?us-ascii?Q?2RqLKCUD8oVg5vYLeq/Nsi5iMNMqODUOebPg9p+av/WZ0sHEmAUYNJPVlub0?=
 =?us-ascii?Q?kpg1HC5HBE6tAQmQimh4tq0v+sU6QX36acGAh+3+tvwv45xy9XHapOQ1Gknu?=
 =?us-ascii?Q?D81FuXBj4brmd35Iqf0nY5Mrd+NiBXSlcnsFHIaZfzBwBUBm4s+Zg551E15D?=
 =?us-ascii?Q?Ba7ytwFTkX+gAb3bCzNVQmb9RvsWPMlVEWGa6SPPJiq/WMAdnVY2RLKAI5a7?=
 =?us-ascii?Q?VlKVvG5V2fSFXE1HSLEP3C/uOjf0J66uDNd8uGoCrWhDu0DyxztrdSeW5Zpn?=
 =?us-ascii?Q?c543EopDFO1bhU2n+oe6hsRUSJGwFHx2iuzQ4OtadE9RAMz3mj23Z2qlzqxT?=
 =?us-ascii?Q?JPRFUFOF2Dg600BbgWt3xFvRz2vkI82y0foInafvVojfN7iK6xCm2B49LGft?=
 =?us-ascii?Q?TGkMt8LxOgzE6XZtNlCi8ZCuGE6ZIJTcXNkBfxlaCWhJTvT9zxbLrrnOEYuM?=
 =?us-ascii?Q?EnTXmJVRyO3yJEDsUTDpDuALgFnnvvdoQ796kWKujp6DjeIuMEyw1pn9jVMc?=
 =?us-ascii?Q?Rc7d81DYCZBU2GbqcuPDqGprqNAfB96y0WW/dunk1xDCPttTKLS3x2flYOpP?=
 =?us-ascii?Q?5NRSdKS278puTAFqLR8ekdcznpHoU27tWIVzsRbzuttnmMa8x41VTU/5qh9Q?=
 =?us-ascii?Q?yepQ/x84GvYEo9IwaAm7V9fI5IJmaNSlWxwJbZZiw99ZNOVF1FcmUOnTGJXa?=
 =?us-ascii?Q?OqMgZmps25nD18FVIrAmm1eLnw53BvHKlSejcwqpnTw13MH9xvgMkLgz4LlN?=
 =?us-ascii?Q?lSwcbNQH61BZSs01LG3aPExuCKcCBUv8CHMHo7ST6iLXnctGEbQjzr8Ucaq1?=
 =?us-ascii?Q?zNLWGRoryQhKUp8vWFF3BjtSEHuNGFypRFoE0LLvTKqJt+zXQYXXar8KgkY0?=
 =?us-ascii?Q?b10Xa8p5bSIlpUcizaWkW8dVRZRh4ENKPMZDxFwwvNz9F4n+stesHnOeQBJj?=
 =?us-ascii?Q?fOQ5py9QdDll1k/cahO8MJLVkfW4PQsCdlFF+YZeCHf2P1fomdj0HnpMdC/N?=
 =?us-ascii?Q?LTBSUMs69FwgK/UXDcNoBi7V6E/mU7PPB99qXKTTnMxkG27Y0JHNYLGCBmwP?=
 =?us-ascii?Q?XUKzyU4jBV2zraJa9wP4VDkt4VBt6v4K4mI4hK3oYaQr0o9wiIzxiS+ZLZbG?=
 =?us-ascii?Q?6YT/PxN73OcahgAE2T79Znr99F3Gvyw7uhh53aZVVt+6I2Fuj6oPHylAQUjx?=
 =?us-ascii?Q?m1cfovlksLSRPv4sUmbM9hrvZShQ3ufntiX4Sg06/KZKK5k0RRC/v0u48lSh?=
 =?us-ascii?Q?l0eC+MywPhL8zXZSdWmUEDmclvFX8ru+XIBKKnfH7zNkbGrtlqVg1Y8kqAlc?=
 =?us-ascii?Q?EhtTiy4OE6FPloOjqK9grbJO+Xccnre45KDEJX1krN4U3uTnq+AXDr49p3Px?=
 =?us-ascii?Q?thxO4hPW+kE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Qwvyb2NgzHexA5eVNy7AHhVzcOkWP/rU5qNVnklB1aa+rDOFhtjUHqtG3GSm?=
 =?us-ascii?Q?g6pV5CQ1+sgPNElz8p/qoCh98hVLdZ8IqFMuWMm6vqc6lGTr6tvCghd1W9kj?=
 =?us-ascii?Q?xZvIHzInuIkKCWBs/2hHWCmH/8IX7OsYtWsS7Y4eeC7l8pSLrFsl/2yjP+nN?=
 =?us-ascii?Q?1TmUP6GiUQKlVDbBWoVUxVGi3IhSnbbWI8Yc9XKFEYbf1C78qeC9bZD+ELSy?=
 =?us-ascii?Q?oRkcNxGDk12dW3WlToSV0pTe/nVKsYCSDJuKXza9RpFpKB5fl/uUFS5KHH+A?=
 =?us-ascii?Q?IEgmnhUEH18ISz+8s87QT7AciZoP3tPRY3wnw4dR3K7ikJ3LzkACkcml8okP?=
 =?us-ascii?Q?zRjpl83H+7YfkRYidW5QiRutCP0CW7sKNAFy5qIFRXgyZOD9L1LA+uHzYN3A?=
 =?us-ascii?Q?EzcimuoLJra6pQqetj83c4zH8p6UKhZTFmHdhnt1WpHcPpRRDY6dDEWrOnHc?=
 =?us-ascii?Q?yiIK4qQpdjo/kxokfFZAauiSAtgzlyo0aC/cZBJB2Ylh1aRk5w3nnI07IvTB?=
 =?us-ascii?Q?Hu/Wah0ukq67y9vVQVI4eL0/GmxjnMFNZcWwaHXvBYetW5g+DxgLEb1jryQv?=
 =?us-ascii?Q?7pMA5ZIh5H5Uq2ldRF2bq54TPG35GSvTsUHcv4KnZjNdm+MH3e+HfoKJHtgm?=
 =?us-ascii?Q?BAe5St3/gOy+edYQwkEdFx99j1EBsjZ2QfH6i6MvYeAsZR3CxFMfeOItsnUT?=
 =?us-ascii?Q?mXhFb8AScD92YyerOjtE6Bu3ZXpd5S9NJtHTuwq0fxijt3BEulLctGGJz8Tq?=
 =?us-ascii?Q?EeWPZ+RxstNvfzoFqBVwTYc6TuIh25Wa5S7H+ERzW3kkOiWpRWDtT1Uq2FiG?=
 =?us-ascii?Q?9NDj8H9iD4CJzDeVdjpzLHxQps2A2A5wtW3B/ZGkCPPO7cOLdVhkxF7+PsJK?=
 =?us-ascii?Q?7veyvdI+4j7C1iYUFGLwv31joi5nXW/bgHWwKzhtjEIuE29vMyvuEK2dq3Iq?=
 =?us-ascii?Q?0mFtmcd+PHWXzoe0fdNhUbfSM2ouNRG6UT8mZxWbQsmN8AKFwZwujJD6kGvE?=
 =?us-ascii?Q?k8DbpTd7razqDBukFQmXmOU6p2McixjQ7ahfOpe13MMOAZgoK2CCIQwGlT2T?=
 =?us-ascii?Q?LngT5dKWE6eYskyi1eWN1AN1+nna9l4uMWZREa2WhxXyhNN50Y7Uo7iLgktD?=
 =?us-ascii?Q?KBcaMLuW+Nq/VaUt+yg8JwjYQN+ytaoOFxiOmcL3C9a1k3hZnhmDR6gQRr1m?=
 =?us-ascii?Q?LN5XVfd1bKqWJxMRFsGgHu1aXBLQdO1WLrcWkylctEgEkOdv9wNT59pMdnK3?=
 =?us-ascii?Q?5dsSGBQ/ZLwSpjtrjOCZ3CkUH5E76sxAUgCsX/EvtZdmGsegrNzFmAVsIupV?=
 =?us-ascii?Q?ihEkwy0EqdEepixTKbOS4h+WTFI3z0DobSlgB7pHQF+THLjC0DrCF6rfQclO?=
 =?us-ascii?Q?odmf/j+oBdTGZLI4dnrLXq44efa12wDxe+igs48HmiKr1ZWQjYK75VFeujP7?=
 =?us-ascii?Q?PRBuodQqqwzl96Qje41FgGTNSwRUOdmsBMDhSs+zpNZ/hdpWBWxq+fAPVW6R?=
 =?us-ascii?Q?zZE2arQ8tfeGzetduro6DoNUfl3BhqCeX9kHJvSa/0wcs1pZpPnuRYI9u047?=
 =?us-ascii?Q?Wq1Vpim6Iigb/+cr93+ZNqk/u+mXwgoiLH577F265wMl4T/WPZhGRzW/LmB2?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LyT/Y9lg2KMs+yvZy6ebn1MgusEuklKCUvCehch7T2lekYbawcb+Y3GQYPX37otGTbMTED8qDsbdZD7gaxo1Cc2XJ5dczJ4r6RRaXw9z9h3M0VXtmU4V7HYB/6neknQusS5ZfDbfDzBeIwQO5xzkQKkI0SzW94JYXvbbrYb/0tXos41U7KICj9ZrTtpRDTi9cvKfxKoXEzTcRvScubKhoHWjabGkcLltyN98UPWMYimdyqNI+5jP9UF8UpXQG0bu4Wp8W3zV8oGHjJVtqf1CL/T0t3r2tdCAcS2DgE+nkaBofE/iVA02nP5ZnG1DuS0tNvMBSQrIgHO/oA0agVG/Q01L8gQ076cbKhcqz755bGT0pCzKc3CS4ZrMxzAtcldDxNBYacKlcwHdJqDHd7JDfzS+uFBc+7RjvbUiVrSjNJMQarkwgXDHd6BbUoX0Cnqh5kGj5BjCGquBkeSBLtKsoAcc/3TzWhw2mxTJ6s9mVhiUSwgUgQXQo6burz57loVcVvepoCb0nQEiiFGUBr13l/pe+O1AwnGkeeNeraNFENh+oS4UY+0PM6cPB5/gQQ+7J8+LiU+SRVuARk1q6lWryswqJ47IiOXs1vY60DznHw8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c83e5b-8e9a-4f93-67a0-08ddae8b0a17
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 17:10:35.0184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 46QYuc17w7wbOThZzyfyA0icnil7xtPUYN4v9pf1jFaFTHSfICjC8lgUEm21rEp4G/a9zCbfM9jNVkP6dEzMv1BMZzX4p+rqs28TMz7ZPCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7189
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=623 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506180146
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE0NSBTYWx0ZWRfXzuha7Mp5eF1K AZjbFV2e0YZV2Q0YT81h1DCRsspU1+xUCRoF2pVn3ogzFJ4v0YUHR3VZhWEE9WCkn8T+MapxrmK C9gQ6ExbP6pAARedJEic2XLWqfUXb0tSWi4ylTfNcCk5NGnVO3omii+2U+QOiVU/Q/Flpyksu4V
 wtkA9P1Qlb/VqkBnpZE2lwle/HXho4UdEPKLxPVy8hn+lDMQOs8ZylKNNC2ChvJiDfNLttjhAn1 lA28mx5pN551kpQ82UUqYMJIgJN3Dp327sSLPG6raLD5hYhjdiRdgDM0wdq2WVLdrt3jGBTRlKJ GOAuQ/foSMRz7GzGDaE3FW3mFAyU1L6+L8ZJYZX8D2GNamttkZz+ux30cvgdRdgNWEoxoIp9WY9
 fFbuCwpzjRiAfrEa5fD0+Gh1UEfeGqXmpErQUcrjB7PD8Y2cuJpga19zFyJUKpj5UqZ7OcTE
X-Authority-Analysis: v=2.4 cv=K5EiHzWI c=1 sm=1 tr=0 ts=6852f310 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=siUXyIOCbJ_BvAdiNSIA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10 cc=ntf awl=host:13207
X-Proofpoint-GUID: M0V09A024UA9tRiBpV3NCHINJ1NAZwEC
X-Proofpoint-ORIG-GUID: M0V09A024UA9tRiBpV3NCHINJ1NAZwEC

On Wed, Jun 18, 2025 at 06:14:22PM +0200, David Hildenbrand wrote:
> On 18.06.25 12:26, Dev Jain wrote:
> > +
> >   			/*
> >   			 * ptl mostly unnecessary, but preempt has to
> >   			 * be disabled to update the per-cpu stats
> >   			 * inside folio_remove_rmap_pte().
> >   			 */
> >   			spin_lock(ptl);
>
> Existing code: The PTL locking should just be moved outside of the loop.

Do we really want to hold the PTL for the duration of the loop? Are we sure
it's safe to do so? Are there any locks taken in other functions that might
sleep that'd mean holding a spinlock would be a problem?
