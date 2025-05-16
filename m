Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1831DFDE;
	Fri, 16 May 2025 12:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747400339; cv=fail; b=Kq+wrCJ3hEmiOjkmgKjLOXfVfkZ/eT4PzOyQ+C+8Y7TL3B4gNKY+a1LUmREdlkJlesHNuXV+SkMQ5/VxfJRkKnHvdvOdARnCZEEjdmCU3IUVXr/KcrGXBh4BJqEZ1w0bqhrsCgVPsR8KrIbvyaG8v0rF3Gk5aZ6E9d1IUUp2dFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747400339; c=relaxed/simple;
	bh=8Jd1Zj6D7rMWQ0ty3QtiP2X+r10oq03XX40YWmwWCA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=O6AIz8OKksMsbA9yM51slEJvxyq2heqRXXkEmxZ/E2rA8Bf8UWwJ43Ro+vplGHcyWVaE84mMmY/y/6SP12ANDtBH4t0b+zVljYWZgl0E4Xl8wD7OTf60hZVShsyUuvW2rfgQN0TZwNlJ+FAQc3U2kcXxR8r02C3kRgxIggAU6tQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iyH/48mp; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lC26RyP9; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iyH/48mp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lC26RyP9"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GCfvtd005935;
	Fri, 16 May 2025 12:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ave/1jSXE4pHTMlEzQ
	OuTMVDj5sXJ3BIg7ivBJWXi1o=; b=iyH/48mpy1k1E0U2QMXj6DXjs2CK1rWrKz
	DVlcrrUpS1r3Lz8aT8l7dIXOxtWwdGlmC269WDzhMd9iWCecb6ALOvgpd5QQF2RS
	k9qeO8zPuZdkoIcZgPN6Oq2eGsEFNN/oVINvVwLgwwU3PqYLf5MMAVv/vcSaBaId
	/HfjQVQYytpyFtfqaQWQm3tDBb8PtQ9Wdfe5GY2ItI/gLYwhQNVcXtR86v5VuHCV
	8dXau4etlQKG7Ll7wi3G/yK9mYoWf5vfq3QiJBvulHodZRVQfk2AwvayefWmgc7f
	441Xov9dyycP3QUqGapTOVSAXN7r8WQIJndLcR7GTMyhnOKc/mIA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46nrbesa70-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 May 2025 12:57:23 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54GC2OS9033281;
	Fri, 16 May 2025 12:57:23 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46mbsbtng7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 May 2025 12:57:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qHiIdZJZfJD4Rx/Y4BR8D+6bKM/JyoePKd2Fwws+S6xrj4QKjwWtclZri2SFJTTV59QU/WzEMM8X2yaatVTUnwdsgz6w1miy0jKdG6sbEhE9uobcWlH3gt2Oa8EiiZyibmJCCiw8OmoXvaKi+uq0eEjfcsn3piqxOkWqkuSdWweF0hG9Kidd04R6iJKEWLwA6Vod8SN0BsAeOHyZbWFgtLVmmGjhCdjyv7//DviNZvb7OIZ1YH1vsHGfVmt0XAxibuOM7eNPdAyNRwhK1tD7zghWfUV2jAMoUSTYjXsdIfupRt6FpYa62fvRfcetDjhohYY9TtP3ywERv/a6Z0WZ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ave/1jSXE4pHTMlEzQOuTMVDj5sXJ3BIg7ivBJWXi1o=;
 b=d2hNf39h1MU/vuMaMrF0kD7IdvriCv1yCRDo0IzuSUWpfBsonuvdWwOgkIeWCPmebHjw5tVGc3roqSes8XfYt2E6y/LRkpxXB6W4bGjxqLjL1VzbKJ8aaf7g0dGCHsyRMxc1a+J+AHF2fL4PTZDO7ywGR4qRSt2LwprlzvaZm88Jpe3z/YvHQK1e0Zh3dmwK2iwVs0PAzRuRM/S2nZFfjS1PqgtPp+8acv14qPPD8V/FtoWlbI7ybaxUsyyxuvCFVTLAnlxaMKOGxeKNxiDhpTsLnmaw1yLxve3E6ahNAffjuqjP21GjdjXPCNHulOW75M7hLxgpZRuGtzxuUkRvFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ave/1jSXE4pHTMlEzQOuTMVDj5sXJ3BIg7ivBJWXi1o=;
 b=lC26RyP9O6nLsXy3VGNualPYKJQ99iSFa6wyJ93FbUSYipWcPCJVb8AMVth/WMXLyyGpPWlI9l86c2HjfWmJIndOfQOsgU74WHmgpnm8WmZRll2wn3R38yjJiSOtqKEgTKDG6rOhZPYukSyzQStr8eIZixd8+Blvm5ote7+39P4=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MW6PR10MB7550.namprd10.prod.outlook.com (2603:10b6:303:240::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 12:57:21 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8699.022; Fri, 16 May 2025
 12:57:21 +0000
Date: Fri, 16 May 2025 13:57:18 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Usama Arif <usamaarif642@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
        ziy@nvidia.com, laoar.shao@gmail.com, baolin.wang@linux.alibaba.com,
        Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@meta.com
Subject: Re: [PATCH 1/6] prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the
 process
Message-ID: <c390dd7e-0770-4d29-bb0e-f410ff6678e3@lucifer.local>
References: <c0af0eb2-d10f-4ee3-87dd-c23cca6cfd1a@lucifer.local>
 <ddc0dd46-8541-4d4a-ac59-287e11e1d3ff@gmail.com>
 <02ead03b-339b-45c8-b252-d31a66501c39@lucifer.local>
 <3a2a329d-2592-4e31-a763-d87dcd925966@redhat.com>
 <8ea288f2-5196-41f9-bd65-e29f22bb29e8@lucifer.local>
 <5f77366d-e100-46bb-ac85-aa4b216eb2cf@redhat.com>
 <cbc95f9b-1c13-45ec-8d34-38544d3f2dd3@lucifer.local>
 <8f0a22c2-3176-4942-994d-58d940901ecf@redhat.com>
 <1a175a2c-8afa-4995-9dec-e3e7cf1efc72@lucifer.local>
 <d8a7644b-6ec5-48bd-9789-cb5017075690@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8a7644b-6ec5-48bd-9789-cb5017075690@redhat.com>
X-ClientProxiedBy: LO4P123CA0333.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::14) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MW6PR10MB7550:EE_
X-MS-Office365-Filtering-Correlation-Id: 307c25c9-8995-4ad6-6259-08dd94793233
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SlL6gUyGk3+AE590PiUKJFFeLICrDCj8xaC4JQ6aEi6DYRaoaDfdP56OYcXK?=
 =?us-ascii?Q?/njM+BTtdM04iwtEaS79KkJ8rPdHdcaoteby7vOAKwczIMqjbOwYxSBHD7IJ?=
 =?us-ascii?Q?86M18xTu56lgXJUcIS0EJwvfH6fNh3q6I2OrhAuv6+M07A3bk32Jp1FV8xr4?=
 =?us-ascii?Q?SthNG5PCaEypQSvNLOPvkOT7TV7jwdT2Qe6N1YMi57yI3UvaUQyKB/w/Kv7H?=
 =?us-ascii?Q?IyzZXtVWRiosXgk8bP/NyO2sEy2/zX0KGTaZuKm66mge6M1Z7vl/M6/Ir6AS?=
 =?us-ascii?Q?YrHoMtXie10nxx9maDaG6Y7jOWaiXi8sA006yDnLbkYgE8KVP1qeY2CU3OIH?=
 =?us-ascii?Q?M0YWZjW8QABl+o/Szz9gRRWLpT0YM1k0qg/GitgRtGuG78r/aSvKR2P/bwra?=
 =?us-ascii?Q?WiLUMryj5/H1ZZj7djcbN0WvK45cLcsgOqGI3JvIFbH4Xjp+geyZVYUrOoxd?=
 =?us-ascii?Q?MIgsp70R7yB/K61R/mpN6+CyGcSCxmGJH0/fvQG/IPRBBX/La71f6H3lnFkN?=
 =?us-ascii?Q?vrfgOmVAZmSMR0doYCKN2kv9DtscT+T0NUm+s3n0p/rN00gAQeXic2S3XDbf?=
 =?us-ascii?Q?pr6bv1RCktynWtHBZbAYHV1Ty5B6KqDdxBf2dI0aKNaXysUU5Pqe/IlIkmKG?=
 =?us-ascii?Q?GwsZYlO/vHv8OCTiRBjgsmSkms+Cnja3+vCU9KyeYJPRN8ITdbVRm32y1jFJ?=
 =?us-ascii?Q?UaZoY7mBAG9+jcCRqoI+714Lao/dE7cJhoftiU41wml64xBduFqg0Fjguw5n?=
 =?us-ascii?Q?nZFT34LJnDyaX93NMIIVxcvNQOApw4Cx2QchTMwawUtKi9HAjIpU3F1I7vZl?=
 =?us-ascii?Q?VRrqOA0GBR3iVEcCzNmCiIDMoj4cgxRdr5JmZbPI0JQenNh8fZGdLmR1h3Bj?=
 =?us-ascii?Q?zRbsj/tyXYjrlua74BaaBkoy7b0gh/gUvhl7WXBBjoeXv3IRj4Dwt4Uolhne?=
 =?us-ascii?Q?/1RXbawaJCr9QIHeSntPEZWVWzJzKbgtQ3X2kmWfOzKf8kFYEoySDLKmxJz+?=
 =?us-ascii?Q?hyfx9l3KGNX+sNSl8Q12+6G1N9PlYcFzCeas84g6DIYCIQm4v2wFyk41EoL4?=
 =?us-ascii?Q?+MHjrj0UbX0YYr985M0pFmJkJffE80zRBN8H8IVMZPhZXKIo3RfkPb8eUHUH?=
 =?us-ascii?Q?rCczO5n9zVZFMn1M8nJhVwjfqPRtkneMRZ7ackVD7b8NcU5MhdddEin/OLhy?=
 =?us-ascii?Q?DD7lFaNDXCXCVwU6zl8fXhWocuTx0bWgmcBflrS0ncmWfsYDqgL7wdfWgCUJ?=
 =?us-ascii?Q?frcDXPNuBO2IlzII4Rm85dfh9nUSev7ZZJ3Ym3IEUpnbkZ4AK5x4BmPkyyeM?=
 =?us-ascii?Q?ezDINrVDI+OXcNxOVjbj4vGabN8L05IOwbof98dp1U1ggWXOeOF2LISMcwsT?=
 =?us-ascii?Q?gTiVk8OwoNIx+1pTCpqxPlnPWdKWxGny/enaBwsdVplT2w8k+hCaayWtO+28?=
 =?us-ascii?Q?qmKQf/TFnlE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9M1krGhBcMzQNOzYXRd3szzKROt0pfj5HDDSfNuMA3zRBxnWL8yoPo+0pZMK?=
 =?us-ascii?Q?Xs3MXqXwVCi6RwIqJgRKMCA0yuDSktRyepA7D5tCgQ+TU3ZWSgIvlBD0FcFn?=
 =?us-ascii?Q?KOtLlGV5wDFKytl6ZTG0Mh+/hZ5JAKO0r6bXCGQ7wDa/coygSIcNe0C+CQFn?=
 =?us-ascii?Q?RSddmAS43rE3L1rIV+FBGjqm70JUftX5MfEUZ9BftTyEkIKB988yk41Q6gmz?=
 =?us-ascii?Q?nwXLL+MMGufPeIgandvtSaMT7ofHLa8M3OA1i2JhXv0xAR5Y9trcp8Zyrsl2?=
 =?us-ascii?Q?YY4ytK8ta1foIbrqheIK+s9GTEXzQ/c006TRvv0ETGgXkfjKrvoJ6v2+mM5Y?=
 =?us-ascii?Q?BQX/ULkzaEHDEnYCgeR14LTuW9Mv270aKNTBhPXFdV+j/34KT+VZWkJHJIoE?=
 =?us-ascii?Q?F5x0DQB9iNl9/6E248vg4ABr0bRSFMqEK2czE9kowKVI4RbOznciHVa404Ro?=
 =?us-ascii?Q?MDpc3H40nMNIUWb6GNiJLcCvJSByG52hB7xmJMRY2w4N46xEaOH0Cxn0YX2r?=
 =?us-ascii?Q?7FZ92461M1Ct4gxh1VaBOzXnwM5or5XrDERPjBo9vetvOO4fcQ/u73YusTOq?=
 =?us-ascii?Q?dZouZM4W4DK+CqHkyPc+6kTQFWJsLfbgEnVQ69casP21NaluP7wyBw/UgM4W?=
 =?us-ascii?Q?4gmAXiCcNN5eUvKCkIc2sUVQ0QqZYvc5m013uLIQwiSNGBDuPtTXKbDKgbEc?=
 =?us-ascii?Q?56mz5O4V0Q79p+9g2RFByTcdNMD0uBnlDB7EHwa0aFDuEtV11A+ZIEKqSnpn?=
 =?us-ascii?Q?nn6IhI6Y3Wrznk693A2GZv5VXNLd0eWToMinTcknBrfByzQ+tp5MDvec/750?=
 =?us-ascii?Q?I125VHqACrpV/zbPkDjKWKOg7Xz7dChf8vDzABUYalet9jL2mAulNPrvMPhx?=
 =?us-ascii?Q?7DRXSRZGxOYhNzj8WNGsSYk65TqfWD7abjuFPkjQWEwGMtEv1snAf4vZa3T3?=
 =?us-ascii?Q?w41yxk5UFfK287F6uLdK7NCxN0Ct7w+EetDHpni4Sv3RIN8CeLVdix3Q9yEB?=
 =?us-ascii?Q?hBGXQz+2i4Z5dxLI9sWIwlea88rvecVlAnlFdFOuUM/krbIZCB+G3LubGV79?=
 =?us-ascii?Q?FqAT6DhMq20dDq3mO2UvkILPQdIKN+czIIm57YABJI07R/YiA5U3eLVzxXLG?=
 =?us-ascii?Q?57MWr8Eg9rNKZYNwGObccQ2ziw8tqNh3mT5BzY6UILy6MTYDbJpwOweEkQVT?=
 =?us-ascii?Q?G0U7B7V7mNSdMdvy65t01+gsNnTXvx1dmC3+WUTkQjzSLVSvy7tOLRiilLM7?=
 =?us-ascii?Q?dzhdg9ATXFiIxHM5V6Yd7CqMr7HPgyH9bUlp9EpVoU/LAZCuJBfpQw7Nxol7?=
 =?us-ascii?Q?WTu32yRpPffa53VHBSnO/pIufe33pztx09Mx5HoOB7BwHgNQkMxfzgrbVa76?=
 =?us-ascii?Q?i37fhJtHmtiUUXndkCCNRdmKU34c48uT/Qfue7GcVu+Ca1tCuInN3Yz8PhHc?=
 =?us-ascii?Q?bspN3e6oh2hePYEb6avDBFEa/R+haSPY6couVhit9CPN3zwEMctbpNuRBYPm?=
 =?us-ascii?Q?0efwmHGCgaL1kc37tgVYW2NL6l6S3/Ej2T+vAyPlbK5YTp9jA0RV22hM0EJF?=
 =?us-ascii?Q?f/61CVU6g6f2dW+u/Tf7jspUYPCB79fYD9VbHepOVfLE/yd967igjS1S09l7?=
 =?us-ascii?Q?Lw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pAPUTkTamNDNLZ2IvShVsP0DQb9nTfTIdp7J4i3aiPJmLwYjnuuy0Z0Cpq1wMkKdtp94qOD9LoHbWVzele6w5pih4I9tDjCw9HKmbuX5pOTvaSTeNLKTr7j9RteZvktjwJMe4dQf74u0BfVrPMrO+BF/sn3rd3whiUtFfEXg/uIe7T5GLjUPzKjlnvQZoO/3Kmz69DZt4xcdOn6XzYy4bbR8ybeUKirbZw6hxf6LAEeM0lIT86byarLQO8WQIg7U5CSxv3gsod77f13zun8dk++2n3TKx2BQ42T7/CDumrxgYK6uOW4NhrbU3B83LqpeJe0fOHTMnUpRLUSUaMts4AEgnN6hZyZ4eJ94k9lBO+N7O/u3HxV/7/3eKyQ/x7aYHHGXdk7kMK0CDrz782+rfmwOUgeU6qvtbMNoJVbphuyRG7pqdlqo6u0oXW5EImcYmtfxRAP4YfYIv3WG1PXPEYQBJmZ/o1TU1SB5lAXP+kDWpoCnfJ0+FyzcwvTOcn40hTWxA3yAbKHSrYaoAoU9N6x0kbTwavI2QLMKfVKAelPuDaQuHu7wHQb7QOu5mnv5lEwMrF9OAjL98LimAgtbHcsj9xqHjEJ4fSB/WQa/91U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 307c25c9-8995-4ad6-6259-08dd94793233
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 12:57:21.1574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g3VBgjYK/LzyXa3V7JKllpYnHLG+3WvFvaU0VndOWCWJJQ0XuwfZYn7iAsunbE/ahi3BRD6HVVgaifz1L/mGDhg9hhfkPSSaDCA47GboAAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7550
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505070000
 definitions=main-2505160124
X-Proofpoint-ORIG-GUID: J1BSgKM9t8X3LjDIgCFSgp_9a-6O1cMJ
X-Authority-Analysis: v=2.4 cv=R8YDGcRX c=1 sm=1 tr=0 ts=68273634 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=foAH1GYwJ0Rg78tb4jwA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13185
X-Proofpoint-GUID: J1BSgKM9t8X3LjDIgCFSgp_9a-6O1cMJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDEyNCBTYWx0ZWRfXx9RVDLi65J4D FSxEDzhPyIDoIrKvS3eIdtZV7OYhnbF36TOsY2T9AhfyLDWk7FM3tp+/jYqI36Rabdo67+nCZLr Hbzb3fJU3/pxa+AOV5sw6YTc3MjWKKTlQdrxYVaTWI7GVBoGgkbUj5ZEzTW8BH1y9DN/9ngHsSq
 S8B2ZY1sKa7Z97lOYHjiJBXDcj2MlujjaZlh3MhYxKv1TtWJ3HEHP/mVG//6ZG5HlgcXJajorCQ Df75F2ItxzQGMyMIBHRCi8EQnTzRguU+GD8owy5APj5YDiI1bM3z5GL8xGZtkhElwyaHPPBftsv RZoMF2b4TAjC2XQwTgfmCJPxJv3SESJV7DaSX+944vk1K9AMMGzY7YSBK1yIbDSn4Hh6rZ8jQmP
 5OySkJo0s1KWA8BO/zPGpBGzj9XPsmLNoUL0+KegUONnzv3grk3dIMLCiG3X9cHcCOM3XIcG

On Fri, May 16, 2025 at 01:24:18PM +0200, David Hildenbrand wrote:
> Looking forward to hearing what your magic thinking cap can do! :)

OK so just to say at the outset, this is purely playing around with a
theoretical idea here, so if it's crazy just let me know :))

Right now madvise() has limited utility because:

- You have little control over how the operation is done
- You get little feedback about what's actually succeeded or not
- While you can perform multiple operations at once via process_madvise(),
  even to the current process (after my changes to extend it), it's limited
  to a single advice over 8 ranges.
- You can't say 'ignore errors just try'
- You get the weird gap behaviour.

So the concept is - make everything explicit and add a new syscall that
wraps the existing madvise() stuff and addresses all the above issues.

Specifically pertinent to the case at hand - also add a 'set_default'
boolean (you'll see shortly exactly where) to also tell madvise() to make
all future VMAs default to the specified advice. We'll whitelist what we're
allowed to use here and should be able to use mm->def_flags.

So the idea is we'll use a helper struct-configured function (hey, it's me,
I <3 helper structs so of course) like:

int madvise_ranges(struct madvise_range_control *ctl);

With the data structures as follows (untested, etc. etc.):

enum madvise_range_type {
	MADVISE_RANGE_SINGLE,
	MADVISE_RANGE_MULTI,
	MADVISE_RANGE_ALL,
};

struct madvise_range {
	const void *addr;
	size_t size;
	int advice;
};

struct madvise_ranges {
	const struct madvise_range *arr;
	size_t count;
};

struct madvise_range_stats {
	struct madvise_range range;
	bool success;
	bool partial;
};

struct madvise_ranges_stats {
	unsigned long nr_mappings_advised;
	unsigned long nr_mappings_skipped;
	unsigned long nr_pages_advised;
	unsigned long nr_pages_skipped;
	unsigned long nr_gaps;

	/*
	 * Useful for madvise_range_control->ignore_errors:
	 *
	 * If non-NULL, points to an array of size equal to the number of ranges
	 * specified. Indiciates the specified range, whether it succeeded, and
	 * whether that success was partial (that is, the range specified
	 * multiple mappings, only some of which had advice applied
	 * successfully).
	 *
	 * Not valid for MADVISE_RANGE_ALL.
	 */
 	struct madvise_range_stats *per_range_stats;

	/* Error details. */
	int err;
	unsigned long failed_address;
	size_t offset; /* If multi, at which offset did this occur? */
};

struct madvise_ranges_control {
	int version; /* Allow future updates to API. */

	enum madvise_range_type type;

	union {
		struct madvise_range range; /* MADVISE_RANGE_SINGLE */
		struct madvise_ranges ranges; /* MADVISE_RANGE_MULTI */
		struct all { /* MADVISE_RANGE_ALL */
			int advice;
			/*
			 * If set, also have all future mappings have this applied by default.
			 *
			 * Only whitelisted advice may set this, otherwise -EINVAL will be returned.
			 */
			bool set_default;
		};
	};
	struct madvise_ranges_stats *stats; /* If non-NULL, report information about operation. */

	int pidfd; /* If is_remote set, the remote process. */

	/* Options. */
	bool is_remote :1; /* Target remote process as specified by pidfd. */
	bool ignore_errors :1; /* If error occurs applying advice, carry on to next VMA. */
	bool single_mapping_only :1; /* Error out if any range is not a single VMA. */
	bool stop_on_gap :1; /* Stop operation if input range includes unmapped memory. */
};

So the user can specify whether to apply advice to a single range,
multiple, or the whole address space, with real control over how the operation proceeds.

This basically solves the problem this series tries to address while also
providing an improved madvise() API at the same time.

Thoughts? Have I finally completely lost my mind?
