Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E041F70823
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 16:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751558553; cv=fail; b=UfFlhzRkRarBgH1XWKOSylgl+BHCBIkZ8ejGgiVDfOQSsr2GlviBUbZTearWiJB57S9X4I+Cf9OSNavcsuU9AtjXmEXcPkWACBG0yc8XtzEeMF3x1JPkbDwmgaQd++bu1FCVSZaz747FtUyKGkJ0ab/7d+tB2HnaeemgIBlNmN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751558553; c=relaxed/simple;
	bh=nEOfJPgFcKW8/wiPf7X4U2UoAhS6a0u5fiM2yQGUp0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cNVo5MPZ3/H+gXNCoPPVmC9iwqE1zLqCO3sOqURFDsCZ3ff4Rw1dEImDmyf+1LvdsNemFkEgeAPEmDq0l3JuK0L/EqtYlNZHe/cPpzokGD7z7OiwzE3o0QUs88PqeZJJu6bA9+jVu7oYbpSJqUy47Rfxi0csdAGfpU79JcUf9L0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kJ3yuJl0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=sE58YmEb; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kJ3yuJl0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="sE58YmEb"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563DZ4En031141;
	Thu, 3 Jul 2025 16:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=3l07cNyafYzzsy4ops
	G3b0zVPZtIlVRt8wmHlE065zQ=; b=kJ3yuJl0V1TXsmEPZjcVX4Hhjilf6Lj/Uu
	104KuW+f8Wn8XUpI/MoMas8QYajSbdiw5woLN57aeQQxSCMVK308vMDZcA5RKL+q
	hP4HyUsePZLb3/KxYZs5xuuU7Odlw/4gwgv6T3JfTLC6/vjXHhUt/ux2A/B0TQZt
	ET/6TUB/lUVm3J1Tg0M/Rrh9JN7wmS+qXUwIlWFJR27IGi/OQJuTkgV8mXRIKgsg
	R+/6Kv6UJMD+MSVqbUm53uIQR7l7GVIsvGVoVuTGTSJWHw6QUD8ycgFgvALuPtgd
	FotdCjWdBu3VtOT0f09MmvbByqBMjbBIadZ+1b25KvK+Z0S7g6FQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j7af9aqx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Jul 2025 16:02:00 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 563FL7Vl030105;
	Thu, 3 Jul 2025 16:01:59 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2082.outbound.protection.outlook.com [40.107.223.82])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ucttb3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Jul 2025 16:01:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=efZITEvTEwgIZSgaXse4LlOUy9i7ZqSiZHl0nCjImZurOM/shP+0ZqICrvtDQ12MQJqj5RHHaMcdFQ0RXSNLZsLmb8Z1+pzrnqtnJxTP0m0tNF5IntTPbIzdrmcp3iTOqmsE5sWHZ5JVaSs6t2gESWOMO+v1SzyT+Ol+zMgnv69yyo74RzA+VjXMB3mIY3SLy317r5ldos6x6L0z1T50p0jpucBJPwQut0it7jntnyz9PkGAifcnQ+eEeKgU1HZxaUL14hu6KNMxn0b8WnOhOJAAYgoqokQZCQe3afrz8kxqtnf44Pg4/+QP/5gHsREh5byql7tS+ijBDRmx/OpCrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3l07cNyafYzzsy4opsG3b0zVPZtIlVRt8wmHlE065zQ=;
 b=fzZOaLEBmaqtPnspcOrLiShqpryxomG1D880F1u6SAqsNUb+yDtR2NmNNQfiB7UjQ7cW3CwCMqpVqTfxfxc5RvMsMCPRl4730DNxaIqs38d2sjvpA14+x0mlb7XTpBq1cKC0RyfB34UsBt2e5Fxx8mzKjY6vIfHqm9XLVolzymrX6WUBg7qIIc1Q844Z1XOFO6W/86Stk4b+2FGzjw/UeFEooXsjhW0ne+cpCAkSWAncw7mmr2dpmT6vjWEIklL8WuZnGYRLUZ/xxbDX54S4qCUB0rpimsuvIoSIXCP2eXKPiudP0AWp2gJNJG2EQQ+8bHcWsNsC6vEmdddLBp57pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3l07cNyafYzzsy4opsG3b0zVPZtIlVRt8wmHlE065zQ=;
 b=sE58YmEb3kevwo4JQE7rLL6HD9613Hg2mtmeQnQhzoDGi++sAGwnPJMTB+d6RKIvpGVZWXlaMkRCJ+0KAyHa1xrM+YguwmFY33GlRxb/kT2Fg3Gqfk1cXEEkMT03aw3iBhf9D6/NTOa27Ovcx6QFqrzqHq5c4xghAyE8GUFcD0k=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SN7PR10MB6381.namprd10.prod.outlook.com (2603:10b6:806:26f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.34; Thu, 3 Jul
 2025 16:01:56 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 16:01:56 +0000
Date: Thu, 3 Jul 2025 17:01:54 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Peter Xu <peterx@redhat.com>
Cc: Suren Baghdasaryan <surenb@google.com>, Mike Rapoport <rppt@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Vlastimil Babka <vbabka@suse.cz>, Muchun Song <muchun.song@linux.dev>,
        Hugh Dickins <hughd@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        James Houghton <jthoughton@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Nikita Kalyazin <kalyazin@amazon.com>, Michal Hocko <mhocko@suse.com>,
        David Hildenbrand <david@redhat.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Oscar Salvador <osalvador@suse.de>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Ujwal Kundur <ujwal.kundur@gmail.com>
Subject: Re: [PATCH v2 1/4] mm: Introduce vm_uffd_ops API
Message-ID: <e9235b88-e2be-4358-a6fb-507c5cad6fd9@lucifer.local>
References: <20250627154655.2085903-1-peterx@redhat.com>
 <20250627154655.2085903-2-peterx@redhat.com>
 <aaaca9d4-b8df-45b8-a3a4-a431c99f26c7@lucifer.local>
 <CAJuCfpHN6vpDx+UNPEzJgZ_qD9USTJZ_+yZzQg2BpF_aRpufYw@mail.gmail.com>
 <aGV3fyZ0eGAt7Wag@kernel.org>
 <aGWVIjmmsmskA4bp@x1.local>
 <CAJuCfpH1mtKiphP8ipZeD4CNG9Mr4QERJTQAQm_gtZow5G7AAQ@mail.gmail.com>
 <aGalpN8m73zQOW7j@x1.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGalpN8m73zQOW7j@x1.local>
X-ClientProxiedBy: LO4P123CA0491.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::10) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SN7PR10MB6381:EE_
X-MS-Office365-Filtering-Correlation-Id: c8d2cf3d-10db-47d3-85a4-08ddba4aef83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?30+nTfoZt21gc2JAaHWL+/y2LxxOr/owiKKbkToIt7UhZ/J/IxvRKVvKCpF4?=
 =?us-ascii?Q?jAgLvCnBCUXKYta89cTOWrwNvE3+wRNzW0No5CqBOxH0cQP2h9cOvh3xHq+6?=
 =?us-ascii?Q?gAdAj/3tuQAez/rB0qx7IWPyR47iNPhheuBn9jtH+64uKFqDKQtC7G1QoPSe?=
 =?us-ascii?Q?5ULm5kyrK2d940tZaz4FtXVVWoiEIe1yeniKxHGcOJPlOGgxDMV5vVSL9o86?=
 =?us-ascii?Q?NrulQTTiBdA19HYycJpRfD3Cr+LrzyVp3OQhvIRzfqEVvLUpQkmoxtzo9ku0?=
 =?us-ascii?Q?MPTTcP3QVMBhXR0ck6D6heTOoOJkA8kc5X3y4kzFI6LT7LCgZClmP0KKaZHQ?=
 =?us-ascii?Q?aFR+B79pdbAwazN3c8ukSHWUR/XkceER8yUZ0q6iAU+gdE2Mw9+D+apZON8U?=
 =?us-ascii?Q?76c5ZxPnNRvvqZ+VyC24Zh0QqdRU1BkBxnEpsgWu215TJ+HowcxW9//ViaNi?=
 =?us-ascii?Q?d1nV/+ni1ccyn0VlQdj1rcIUAUBc/6Frj/gsaAM1lu6xNGTRO5B7r57aCKhG?=
 =?us-ascii?Q?2V38gv3Qqi4svkZrWaKCuqZnc1KPd4ZinIoOdnxTN23uf7Q2FTaplkNMCe4x?=
 =?us-ascii?Q?SVz5OPZ+DiGwZA6G8dxCUZwDRN01kfOCaDPkt++zkWXJ6x6x1FNoJJCNOkuY?=
 =?us-ascii?Q?DJdUjylpjimCZjK9dtQKqaEfLQS60axA3bU/l2j3DmaOPNqjDIQB1/moORr0?=
 =?us-ascii?Q?1HdQ5SPRgtWXoIczTygNNHWLoy5KYu0TFfTe3ZAhTjpWEO5q2W+Wjs+OrXr8?=
 =?us-ascii?Q?9eDzGNf6B5uJXNZ3Bgezi9qke/n3dWupgAPWJEJ1qYLN5olONfBNobOLyeQ/?=
 =?us-ascii?Q?1iDk3OGJZa5bREtXIYvg4tofZwCM7rqdThAu+irZ/9Q3oeSHNv1onAjHhVxe?=
 =?us-ascii?Q?x4Z2Fv3FGFwQR8W2M8kiZzr4ii1P3EG7IulX9/ukjkrFne1ySokxE80obO4n?=
 =?us-ascii?Q?S9B9Bs9AK7GhGQAt6iHLIgSJR86sCMdEkyXftxbgGW5qyvammbxQ68bmvJyb?=
 =?us-ascii?Q?FFWEm6KqZ0GLSu9spLARW3Dc/WrZpX6sf8fZjE/ur3su1qaC8z/I1biUwOKd?=
 =?us-ascii?Q?SFpubyAX8kNZV58Qjw5zbY7hKEThVFRpYiDf/Zy+gWFE1fvuH51f97S2QBxV?=
 =?us-ascii?Q?ZAJOlVqXRGT1be8qHWv//T3PvtZlCDS+fWkr8jMhMVDQYLugpgGBn/04b9WX?=
 =?us-ascii?Q?S77of+rwn8AKlr35PLBpBAyqn30jhGH/gWWseAeobgqj6RoVrpKqL4NB0XCY?=
 =?us-ascii?Q?54NbKJuxndiMgP5f4SaIQz9kTMx2vCH+EuLGyT1V06fp2SgwHvxi0Fy1K9Hv?=
 =?us-ascii?Q?k9gpweeNt7xF5E/TKqRyC0RohUUkor4gRzG+2KhfBPjYvD0SgTOv5edU7WK8?=
 =?us-ascii?Q?1HFi5y9y/RLvfcai8k62FoBofm1JDGZM1G6dEXfhYyNuSrpdENc6Q9O9Q1Bl?=
 =?us-ascii?Q?Mm1AwMU+A7M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4Kj44TfYg96/L38s8pjp9muEdy5h59k2C+LW2GdBAy4xlNfWNzzYXJccL+Or?=
 =?us-ascii?Q?mdcqem8lX5lpSnorTIaBuwBa1boAGZZmfEd6cUJXn2d2gRZeiYggq7Px7Afy?=
 =?us-ascii?Q?Mb+4L6livtvqINXETcLVPJ7i3LFXCpzis4v8D+cU8TCRQXfpZiCX885xMo7z?=
 =?us-ascii?Q?9N00Uyvh9QW9F8rq7zHtawyrdslNgXPH6OIhWIW6RmCbw0g0LHN5aL4Mo9jt?=
 =?us-ascii?Q?bLnj+nz7iPuVaCXVRI/aa8OY/XAJc0PSSMAQEuXDnc3mQl0RbwRQb42jTCFt?=
 =?us-ascii?Q?RQv5hzSuxELC3bNJt4u5qBChGezlLYKR5L/IvIAT+ZXAagEvmnPCJRxyg0t7?=
 =?us-ascii?Q?mwfCJBu0Ul+l8Wig/rTyuJPaIsc6MjGlEiBxEt7AQIXV2SP3HhiV8477549k?=
 =?us-ascii?Q?FrUUtUHJTNRm7z+XklcgAROKMOONtoBY4ABdVI57N+A+AOgUVB/lCN5WijAd?=
 =?us-ascii?Q?yy0ve3YIiqaBAUMjeyr3wDbujaYRZdbemPGnghYQAnzF5P1e+sctqF66EvJl?=
 =?us-ascii?Q?0f0aPfBFx5pYHo3JwenMVgg+5R4fqJ1nYJsAnSW+8DqQsT5CroPzLGYX5+bM?=
 =?us-ascii?Q?gQnzlF++yZXL0dB+l0x8VfYbsor9dOswa9t2JH7iseSkcykKaW0eP59EgCEF?=
 =?us-ascii?Q?RN+YNpv8n41I6yC3DOyiaOO6NvpqdC4iAOnmGhHUd40YzZHbXX04Tjuua3Bm?=
 =?us-ascii?Q?AtnXvXHm7/NLTAXAzJwPKndjrQom4LVhBn51vK8GYMik/kogajPrYcofKzsr?=
 =?us-ascii?Q?cddwYYWduy0qjNpJuGADjRP/utsIOOVlqwfJ1WjWBTsH0N+lHhjSUau2nvrT?=
 =?us-ascii?Q?2rkQ6RcIGqhTR6jOmS5x2WdC4BGjhTLkW1aME2PKet/j2HVoRtSJxLXEIh+d?=
 =?us-ascii?Q?lZcF5ll+ZAINsbyi8Fep+uRVfAQIeTHu23w2LnQmxzqzXUfrfZqLo+RjZvQf?=
 =?us-ascii?Q?+Lx2nd6fWmXVCWiKAYWg0hdok24wuSFDHq9UootizG1FfYN1EDPM/n8wAekb?=
 =?us-ascii?Q?dwvHjyiwcT83VvkJBuhELVlVGuJWvHBtKcWzbgOkRh3iVay963bCFFc2MNWd?=
 =?us-ascii?Q?p/dppHzme8wtkYlG/Yhfv2A/MfIgid1CwRKXPhh5z5v5VKxdTum1meWXI4Jh?=
 =?us-ascii?Q?fi+p0EhXfn82HfOBAegoFn4wvZM20KiUqtlm1D90MCBN19OnfQOTpL7V6wRL?=
 =?us-ascii?Q?L5VLJggXirdnECpxh/RESgVIF3Rum+TvYjuEVFZ7gcinwCpRsIhP9SCaVA8G?=
 =?us-ascii?Q?rTWGTBu/MuVigGdM+vo8cWZEDeBkU/RnhdhMy/isnD/R3LcJW+qOzxM3NnuH?=
 =?us-ascii?Q?+lJNCkPy9CM5jY+OAGxJ4sKlAMr09yEqLH5AjJ3bWCB11qEVWuIlHYk7A+Gg?=
 =?us-ascii?Q?zyBV4CjZRv5XVmGBPiXK9rkGRL5d4YM/NG+DtvIJhoN61+X5zVfH+r0NxhzO?=
 =?us-ascii?Q?q1N25w3yLoCzWoTm30mleltsun36kk2/waaWqvEsPu1pzthJ0XjC2HTOpIWr?=
 =?us-ascii?Q?mPXHmIMzXxFbqIeyUvU2xEYBEKpkHoSbMCEiUDxXZDiuFPq3FCObVBs5Nqoz?=
 =?us-ascii?Q?M09As1PRuYanRfPe1RuhtS6HDxqp3xV0laZYX1HNdUeI39bLLRELu0ihfO51?=
 =?us-ascii?Q?/A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dVhXPVh5J8yIwirj5EgbnjGzIVz1AP6l+bodWLMhvMBnOZGE+4aEz0OsGzzXYjsTDvHp4tVZjpNwBjmNmNC/C4UMNDNMsXwDv6mbzyjEIhVXbyQJ/M8jK73VwPkrRNj52lT/3ErV8+3nNfWFSPxnrPddyApg3dm8dHZrOELPc66nRhXfAKK43s21020CzUKTutNR5tXC7brGVwv+VyL9tS7Byl55J8QN4Qjdgh3l5W+DfwQRjzPJkFi3JJgJfOWXZQq47FXPGIxoMpSnvMQMdTu2m6DI88vb2blJ+ASqvUEH2Nr81DUdYhWUXVDsM6wV35V0dKQCyTvjoVJ+hdrpa24hk+cYCo1oQ02dJ1dDLOourBhANW5fpUpAgK807Rdikr9L8hSXr4LdwdKpkfM/PxIRE1a6K/1jDQBMiEo6oKSFrYXekdIeIwSxlUPDM/357Ob0vex0AFV2TK7SWeW9r25b8ygLa3eP/3dXSUPDSsk0pY09SLMl4pd2eeoXVG9YRYusiaaVftb/mAhJ1HTA41JxSEF4OQ875XRZSd4xFliztUpi03bSvf9S8zZHsG0eonHg4/irC9Z8GFb3UZFN1lJDrWyqSQ8qR95/SehTACI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d2cf3d-10db-47d3-85a4-08ddba4aef83
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 16:01:56.6032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d3wzhgd/L1izH5Gznc8XyaEMZ3wNuU5eWve1euf9nkpB18L95ZeGd1pZEGc7wq9Zcz9f+CF8+M2khAvVbtFza80LBO8C1jKuxR0cghVEplY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6381
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=966 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507030132
X-Proofpoint-ORIG-GUID: HPYNJuMOCtWeu6bDQoxruI9VRvadZLEt
X-Proofpoint-GUID: HPYNJuMOCtWeu6bDQoxruI9VRvadZLEt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEzMiBTYWx0ZWRfX7mJ29cyqt4xs ErUOWZQqXBqG4+xkmQhlIcxLHvBG27/bVON/JiP6CuNOdUz3QTZ+HreJPMa1zjmQZXbrBAKTl9z yFioTG5W8h5JBQ7LUAForI37TL5XNkYzJLNJBTHOysxE2c9shgvOS39Hx1r4X4YWJLqRoEUyEp9
 GwTkgUjvSxmjJniWNSaaCedBJlKHyKMGm7N0FCBVv4M9RX/NPtUwafCvHck8tfocxerhoTb0bin MW4xoye0eJyHNSjKe4rthqCKEXfF9dTgbfc/cQpvZNQYXm9HfbBkLiZOC4K9KMUOL662xktBrXU xibz4Vepa/j5ZUQW0pOrt26tD5LkcK2USTYP+eSM53sgObn1ci8RO7yiWg0pTx4m2+duoK8vL6O
 ICzt+L4dZdUl3kVHNRZrHigfO4gziQnMo9Rxdep17hkrwh/nqSmijqwViAOvsuG5yaYRso/F
X-Authority-Analysis: v=2.4 cv=b5Cy4sGx c=1 sm=1 tr=0 ts=6866a978 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=BF0sogXpU8zcN6B1Fh0A:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10

On Thu, Jul 03, 2025 at 11:45:40AM -0400, Peter Xu wrote:
> I still feel like we're over-worried on this.  For OOT drivers I never
> cared breaking anything.  For in-tree ones, this discussion can really
> happen when there's a need to.  And at that time we can also have a look at
> the impl using uffd_copy(), maybe it'll not be that bad either.  It seems
> to me we don't necessarily need to figure this out right now.  IMHO we can
> do it two-steps in worst case.

This kind of approach in relation to f_op->mmap() is precisely how I ended
up being cc'd on an embargoed report of a critical zero-day security flaw.

So I think if anything there is under-worrying going on here.
