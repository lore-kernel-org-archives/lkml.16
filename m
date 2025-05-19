Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D2F246766
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747645548; cv=fail; b=bJcAVJsKGGLWNCZYNeXvjRakS3rNUD/gKe+jqxAq2+WXPhQ13XyF5Qbx3CPZmvcfg2uG3MLyIAnm4zxpqdwYS74gML7FAlUybGjfdvsac+CxKobO5A58Qn3mhLKkfwKegSU7yJGwcBqza6yvEOjJFU6msnSM7gbeTld1pEOLPAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747645548; c=relaxed/simple;
	bh=Gngmp8zPJL+Zxk5x3bkbjR3ErKAtmNk4586TCZxqjEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=f19GS2916LBmN/HttJqV+PLYpwR034iKlOrF29EDrozat3Hh7aficl+OrV37qYzqHmoQRgmJMxo/fizVJzPZ+PK4/7zPMbN1GDrNwz+bl9h9dsLhUouso6+B5rnYimxR+o9TvJO7IeIN8KksaMM1G8ptJjNrNTmuEwAHiORsTfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YlLrj/OU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=m0QKi2Y3; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YlLrj/OU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="m0QKi2Y3"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J6iqBV019925;
	Mon, 19 May 2025 09:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=uQw/X8BsZWjWLWL+Uy
	JGmjogF9xc57E1axuii4CrSJo=; b=YlLrj/OULsRky8iYDv4I0eGwuC1EyTs1Ay
	OvuNMTyCMHvsWmU7zRgNitAwOlWCuVKuto96DPXlzA3sXxMAe/pc+MAJ1soi8ajL
	3kCpkm1LY6fvuOV6rSNIHBoy0qtoLPiJrqaAM7vhheTls1VeOJiO+UFjmeooyYJS
	1a8fUf3gnRb75L+huLSjuZenQGYI6AoMM2gEHLep6GtYUahX0NfcTo3vNDuh+B1B
	i7qTGjvSNImVrBDfMiBj6pTESJw8SBhPlP1d9fooM41outVND0qeKS6eBgZ5CBK3
	n61ALf+H4bp/6y3ruN6bC0QeKcdFp+ss4Npx6MoQYXW6+XgbRMVw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46phcdthar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 May 2025 09:04:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54J8sT99021788;
	Mon, 19 May 2025 09:04:48 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46pgw66y14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 May 2025 09:04:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s+gO9EK+6hPdBvmzO1R42cgRYo0C4PhnzTUo+qICWa3A/LP3SSGodhVuPTRD0x/MSHW+Nj1uH0ZyitKqV+dfcYsVLYxGPFTR505olb08FDw+e7mfQb1EtUyLUOXXVdQjD/TQpzI2uNdn6x5vkA3ictMwpuTah1NTcvF5M6su46/uRcmnJguJZ3WLC/GbMhPSMRf+oxFRuxz2TITpX6ZsCSmp2A+phETQ02Brtze6PXbdupk4d7jcifY0j+c+5NWmFZfYYKuJ2QV0jCzHP7lKbkVGWmEakEjm409990GjjPkz6hsVjdTBoetg55XsGUk0T/v1VFL4NTQvBQnqUjh+pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQw/X8BsZWjWLWL+UyJGmjogF9xc57E1axuii4CrSJo=;
 b=iSkBExbekMTnnsvRTisnaPos+MzBomKsE5hR6aNlIdMdCgGHgodCY3nlBfZxFF3LGfq4VF7YnK4Vvs3VRIgVq5O+WBis5rYImQwpkdPr4a5MgvxJRE7GbycTK4deuFXzB7kGGFSmOdB+VQY3gqCAmwBqfFjTbT5I7mmyrpDdYtR0QLCJCZCYnLA1xxNYJORDeOCFvSUUKtfZpvqJ+qR/2886XXOnr+W0ptWQV8HCXg1XPskdM0KWAu9+6+DwLnIgdk2ZH6p0fLItttXAtNycQIDmz/QLYp6Otadeb0xf7aOUlmjI1lVqlVdY2XsEXlZg2MbyM0/pBZe9+B9axk+RdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQw/X8BsZWjWLWL+UyJGmjogF9xc57E1axuii4CrSJo=;
 b=m0QKi2Y34QxuyLqkYqCZ3ZlaoWTwHLlZUhQd1EKATEir+yvVdMEmuLF2LidNndmL+Geqj8u1RdeIGokbP1Si75zuUhec/fI7Dp9mcD7M5QMkPcwudFzUA9bg2yTnsIcIRFGh+N3FB9T+Pcy9ajw3wSGyAsRkRPiyfbbunHO771U=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH7PR10MB5814.namprd10.prod.outlook.com (2603:10b6:510:125::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Mon, 19 May
 2025 09:04:45 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 09:04:45 +0000
Date: Mon, 19 May 2025 10:04:43 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
        jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, david@redhat.com, peterx@redhat.com,
        ryan.roberts@arm.com, mingo@kernel.org, libang.li@antgroup.com,
        maobibo@loongson.cn, zhengqi.arch@bytedance.com, baohua@kernel.org,
        anshuman.khandual@arm.com, willy@infradead.org, ioworker0@gmail.com,
        yang@os.amperecomputing.com, baolin.wang@linux.alibaba.com,
        ziy@nvidia.com, hughd@google.com
Subject: Re: [PATCH v2 2/2] mm: Optimize mremap() by PTE batching
Message-ID: <55cc1cef-1ece-48c3-af17-22ece8df5ed3@lucifer.local>
References: <20250507060256.78278-1-dev.jain@arm.com>
 <20250507060256.78278-3-dev.jain@arm.com>
 <fdb76016-396a-4ee4-9c9d-beb18c86cfdb@lucifer.local>
 <c038b7cf-3b72-403f-b988-bf3009287502@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c038b7cf-3b72-403f-b988-bf3009287502@arm.com>
X-ClientProxiedBy: LO4P123CA0483.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::20) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH7PR10MB5814:EE_
X-MS-Office365-Filtering-Correlation-Id: 98436712-dbc8-4017-9103-08dd96b43343
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BuHETuZO+yDpnca/phEM0DRWJCRQ4WRe3ZMGCxi54PpaSXvmOWhXJeWFHqiJ?=
 =?us-ascii?Q?VZsMoOgSy3hWZjZA1Xayw2GG7Wrm/le8O/x5EvCBJkPp8GkRxlX6J8lX7ALN?=
 =?us-ascii?Q?OmoO7EK7eJSv9gKNyvjC2vo19aie0ZyXjz4rpFok0gNDJN5EJQQwAct/eyOV?=
 =?us-ascii?Q?vOMM5BaSD0TmVFtQvmY+po3LmMj2ModGIzdsIVQoo/V2+9HLYOuC/ONyliB/?=
 =?us-ascii?Q?mxtGHbaAHtAfPM9jAYYQ4GXmfH9CBhQXkqLxHscK331pmfjXWJpOrpXk5MOS?=
 =?us-ascii?Q?3RHaLLrX9o+pZLUTwnwCcXiaHs/PDdAhufHt29nxak1ZBRurCN0JKVpD6M0Y?=
 =?us-ascii?Q?kRo7dG08YC01RyenqPBH6s0pm3NaCOpc0ySnIzRx3PYAHSJvA5LLkFEEJbxA?=
 =?us-ascii?Q?u4MplLHBTvyDgAJrNzGxMcC9x4tSdmUgB2cQ/kjgbOE0sC2CbQ00D5aKx8MU?=
 =?us-ascii?Q?IYzizNTUnFvxHSQUlMulsQ+NW34tMD+UZ8O0X2d4pFbmAhKdnQ5/ciUI2J7g?=
 =?us-ascii?Q?Uiy2YoHuMffFH9TsZfNpYGpnu8MuX6st+IJev4ZWttGKkkQytWUc8umr/p27?=
 =?us-ascii?Q?YUVLL0WrIil9ciJzL2aImmbos7IdMOMQCfoiXavQ/4FBvaN+dUFGm8z0mB1/?=
 =?us-ascii?Q?N+R86qZeRWhJqKV4rHfW1WsbqhZdS7eDGomtWtfJEmGcBOM6byMh+IF7hGDX?=
 =?us-ascii?Q?GnQvjjI/B+Xnb8WsDfxKQIyXpO/QO5EZYagdf11IG1iHxI+9HPVNfyA16rIV?=
 =?us-ascii?Q?AvuEAXYaB6hdG+cvxGtA9BrqdxW+dzKiqt1IVhZeV2rQS9VviL1hfOrvRtX7?=
 =?us-ascii?Q?0x5j30GLg1SLXRkJHEW3WheJU258ldp9Tbzk1vscCCwYIptpdI6uOUGmDdMg?=
 =?us-ascii?Q?LVCLe6PSA6KqYKvFxeteW9N8xXd/y7YbnVtydsK7bwaDHbtI5EAAhAW0l56J?=
 =?us-ascii?Q?HGnkU/ItVUBaJKqlCiYigjhUltwEiOQ/MrNv9K5ZFRjC0cuxslYGNmV/8cCb?=
 =?us-ascii?Q?UYGVWsskoW1qZBNSJRNqo7zHIEQOF2KvpB/JVpPjuhIhCMinDnR9wsFj5XQ/?=
 =?us-ascii?Q?+2S+fH6NmhyHGjKcifknNMBxhC2szDsptSs5+fPw9x9O6894/aaeKEVDWgJW?=
 =?us-ascii?Q?DoDe/P3A3bDSLnrtOdT6eVDuKhPnAyiAGdVA2BnX+E6HVfCqmpK4K/uqBayy?=
 =?us-ascii?Q?Q9qvy63kOh1w0sPqdEZwQq59DnjlIPIvQwYfwRJLKYio6i3+a6XLZsgMvG2S?=
 =?us-ascii?Q?hWw2BzA1l7wlaengJ44p9+U/tf8bPNqymNtDX5vuYwFla+jSN6eoOdfcfFQz?=
 =?us-ascii?Q?NIBmyeA4RLyEOYhDkD8uNRzMs7KfC0ZtCQKi01N0VCKIgab5XXyuRqKcjBZc?=
 =?us-ascii?Q?Jp57M1RrMAdz7x17ORbR+Vu2AcpGMJKfOTtSkT3+uo892I227LIVf4qMcZAr?=
 =?us-ascii?Q?Bttv/5/igaw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/WvhUzl+CcOa5o7Kw8vnJiqbdgQrlWU8l2aSDurtKpjNc5pkKn2DOymjAwLg?=
 =?us-ascii?Q?f0WEnZCgrw1RI43M3lWCSIRN4IwlrcDEjCNv4btxKctKxGKmVN5ebBELnAof?=
 =?us-ascii?Q?fp73+oHo4MbGs6Zbuye4o6fSwiuVk63vfH7LK6ljaona8E8OHUT/PpyFECby?=
 =?us-ascii?Q?AVXd4dY+qEAcchdsfq617d8+ZJM2XcnfDSUYFyOQsXSVwcQvyZMuk37p4uoK?=
 =?us-ascii?Q?u65MK/ChQqFcYqXq8vWFwfyt1Ci6QFVj8gPJzcXzoqhvSy3SQq1Nr2TIYwbK?=
 =?us-ascii?Q?BDPXVNf1LZLyF/QsHvRao/Kg34gl8gxA+qVC6GT2z2rFi4QNDjO4asxnKxzM?=
 =?us-ascii?Q?8FFkv2RXfDD5JM5ViKYEL0CxRxgqnjIGUB4aD40eKliJxW5ePRnQ9zFQJm0T?=
 =?us-ascii?Q?2nVZj7d1LRjP/euoYkopkUjx2D34mV1g1U30vq+K/S1YvtnNSopUlRhqLOkl?=
 =?us-ascii?Q?VUDGAKPXALP6ncdGnd6Z3DycQDcpnI3IY5vYz+401T6/bwHP6DlIBCK/Bc6R?=
 =?us-ascii?Q?VpfZLLhKUcVmv09qRNeQgCHkaiN3F/iO9UtYjpDxFlipE+4nFQmMLVsIzp+/?=
 =?us-ascii?Q?c6x7K7CeaIhM3WBQWkh0eBAtN+xREPCje+P8m61eQLUmvipdpdJIHnQaUMnn?=
 =?us-ascii?Q?XC1ztL42qzgwA7EkHNGefslF4O97jG8dUFGfTTs8qPyokcREv4bx+e7znucI?=
 =?us-ascii?Q?a9JOYnCyQukCVufLiYNqIz2WKPbdI3BexZfMvfqizmMKoeU5bMzPrWCCsJAw?=
 =?us-ascii?Q?umcHJ/d559V6jFqkRHUUIlNA6rO0boTDC43V9EHRRJaGIE7YYMZtgNiAQX2x?=
 =?us-ascii?Q?Djqw18+daPcmcxDu+EyAAU7vrsgEm03HKIG4/x6cwONuh8s+rKk59NOJU9TE?=
 =?us-ascii?Q?N656CdUK5KMmXgPlOAzhlG3CDbYXW9AoK8V9I6pfqptJMEq9Y/sAXWb/m+XH?=
 =?us-ascii?Q?N4nbUyTfV6220FebOOnbQt1wdwGI/0eFzLnJO7QTjBtalYlx+R7naQhLjL06?=
 =?us-ascii?Q?1ecVtRimQZouK302K/7sOXviYXFNFIaqtZpEElPWsynfZPIB4bjcCY4Kk9rF?=
 =?us-ascii?Q?48jgvplkTCJ8KMYyzIRT74fVIu4fELpdGKRIdZu9wBZJL/Nage660d+JDRnr?=
 =?us-ascii?Q?Qiqw2lijDru6PsJQcvFrWj6dpcu5tcUfRr5UkOE5JWturmzcIEXtD1fzH9il?=
 =?us-ascii?Q?RK4r/jtt8MaSj5HZbjRode6vRjuBaL+k0P6rQmy7Lhd3DRTiEVXuhsVYMXBY?=
 =?us-ascii?Q?wfHLojPjrI7xXieaB38ZXEt4FKXrgET/lO/ENgOw+u7PRfcnOEeVV+wgmJTk?=
 =?us-ascii?Q?B7ZOrhNkBePYctEaFtiKgpK7cufBeYsfRMfysU0lAqp38xpE6ZCu1jTSxJFQ?=
 =?us-ascii?Q?VHLHAwxseJK8T5ybm3VrHnlwWuAk69Rlh5OwCNUo7OVN/KUD6Ui6isrpNpEG?=
 =?us-ascii?Q?Gjz6LyYh8auP4i67zPvV5MBK/xcT/xhz84Pap4SJvINlyi8eaNtZJCSqgA3j?=
 =?us-ascii?Q?W117PaJp0TIqA4X4YW9Jo8F0+bjo3qWKpfo/TaW7Y+ilyk3xSnHPw/j7Vg3M?=
 =?us-ascii?Q?+hVkfXhNKAgZhbjAfQRPNUs3nqwFb5WJD5LMo19KGr98rJHukBbyMZfRXvlI?=
 =?us-ascii?Q?9g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JxxE9W5JJj/O9fRVaUfKiKl/9AC2rkRd2lTt1XpGB9QPdN+85Hi97dghZnrZ6PlnOcUhmjn53OFZET4WCjMV4XU7U9XE9SwBPcmYX5Q5hRsDHZr3VSyjjbq+Np3Y10pb3CK9ps8GDS8OB3nM9lXnCOdWOb2wz7ikfHn6z+uXE9FoELozQHj9sbojIaIwVjCwujIndWh9Ksot5DTy4JYD2wcrItw8fGFIFk09yRsaB7gO10ymTqR1wpZ+XPSw5F6uoJk1C6Q20I7NEI0x+A9/bbz1NarPJvX+bBjTL6+cgl+jQ/WJvhx+lhvQlKL1cCYjDS9ccDzkCW12OeiA2i8dB/P0Uw0YdbPqMANKikPiasx1hMGfGJESeDYOuK9vW+ADmA8q8cwnS33AUnpQrGXZ2oXrNLdzkVc5tLJbtQ8agTxzVeQZYeZ/UGVidFrMAXVI+zyN0gJgrg4M1u488GlM1ztOhmV0gZnr5bXfL8fv19UVfIQpGrjwXUlk3res1hYyLQlHft+AEBq67Tg1gFkgo/5m6OP2WLS6HjfI2J2fWwNiUDRhXbZ+dR5iZM2Q7DJ7SHWGwRjYCqRdNJK6L7FZYpYJfsybBkXWhixoXK7GNkg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98436712-dbc8-4017-9103-08dd96b43343
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 09:04:45.5678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JBPc5RJ2K7NZyPsZiBPe08+JlUltBfCpM6fDjaDXZFAcnRFP1c/6sXVII0/joXtZm3J5OFSmojuQN6PZIqhQykUOM9SCMyj3eZ6zCizyU+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5814
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 adultscore=0 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505070000 definitions=main-2505190085
X-Authority-Analysis: v=2.4 cv=a6gw9VSF c=1 sm=1 tr=0 ts=682af431 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=7CQSdrXTAAAA:8 a=KHWCclXVDUDByXdvD-UA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: VUN4nI09o3hqaKpWEeo6v8x5vl5KJl1C
X-Proofpoint-ORIG-GUID: VUN4nI09o3hqaKpWEeo6v8x5vl5KJl1C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA4NSBTYWx0ZWRfX6VSTGsY5VdcC 1aQcjTGrk0tmkLmr1ZDGAfCqd/9Uo9ysf2UKxhjql0jY2SIBKI4K3MVNXTlTIZj6811t/ijGpNQ 6JQQTRWNxbuTjtebHCAllZwnNeSE6Lf95unA8lbloWnRxBRaRV9hCAVeNl2FrCoDc6EF685LA90
 CyUaT2YvmAo6x6X+oPBOGxBBhQvIvEGel8BUqjaKjbaGD9igWrWEfH+CBvkZASFYjue0tvd/NyP skrIjx8erfsQFgIKTI0+gCt/VIMRVm2n+AQl7mznVgSf4B4m5L7lkP3Q3+1OMNN8bhKaon7nw26 Cw/1tf6PCrc++Z+BabshxHnJ1w+r3k9R2fSf151mDeHQbAxKWrDwgIgj0Bb7HRAWc9/YS1O+2kc
 xVmcAQALn4fbWt6Q79xlKewzBVfVbnxULN/nHMi0bJi7/rQyi5tEmXgqcB+F/0KxE5sLYr0R

On Sun, May 18, 2025 at 01:47:35PM +0530, Dev Jain wrote:
>
>
> On 08/05/25 3:34 pm, Lorenzo Stoakes wrote:
> > Before getting into the review, just to say thanks for refactoring as per
> > my (and of course other's) comments, much appreciated and big improvement!
> > :)
> >
> > We're getting there...
> >
> > On Wed, May 07, 2025 at 11:32:56AM +0530, Dev Jain wrote:
> > > To use PTE batching, we want to determine whether the folio mapped by
> > > the PTE is large, thus requiring the use of vm_normal_folio(). We want
> > > to avoid the cost of vm_normal_folio() if the code path doesn't already
> > > require the folio. For arm64, pte_batch_hint() does the job. To generalize
> > > this hint, add a helper which will determine whether two consecutive PTEs
> > > point to consecutive PFNs, in which case there is a high probability that
> > > the underlying folio is large.
> > > Next, use folio_pte_batch() to optimize move_ptes(). On arm64, if the ptes
> > > are painted with the contig bit, then ptep_get() will iterate through all 16
> > > entries to collect a/d bits. Hence this optimization will result in a 16x
> > > reduction in the number of ptep_get() calls. Next, ptep_get_and_clear()
> > > will eventually call contpte_try_unfold() on every contig block, thus
> > > flushing the TLB for the complete large folio range. Instead, use
> > > get_and_clear_full_ptes() so as to elide TLBIs on each contig block, and only
> > > do them on the starting and ending contig block.
> > >
> > > Signed-off-by: Dev Jain <dev.jain@arm.com>
> > > ---
> > >   include/linux/pgtable.h | 29 +++++++++++++++++++++++++++++
> > >   mm/mremap.c             | 37 ++++++++++++++++++++++++++++++-------
> > >   2 files changed, 59 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > > index b50447ef1c92..38dab1f562ed 100644
> > > --- a/include/linux/pgtable.h
> > > +++ b/include/linux/pgtable.h
> > > @@ -369,6 +369,35 @@ static inline pgd_t pgdp_get(pgd_t *pgdp)
> > >   }
> > >   #endif
> > >
> > > +/**
> > > + * maybe_contiguous_pte_pfns - Hint whether the page mapped by the pte belongs
> > > + * to a large folio.
> > > + * @ptep: Pointer to the page table entry.
> > > + * @pte: The page table entry.
> > > + *
> > > + * This helper is invoked when the caller wants to batch over a set of ptes
> > > + * mapping a large folio, but the concerned code path does not already have
> > > + * the folio. We want to avoid the cost of vm_normal_folio() only to find that
> > > + * the underlying folio was small; i.e keep the small folio case as fast as
> > > + * possible.
> > > + *
> > > + * The caller must ensure that ptep + 1 exists.
> > > + */
> > > +static inline bool maybe_contiguous_pte_pfns(pte_t *ptep, pte_t pte)
> > > +{
> > > +	pte_t *next_ptep, next_pte;
> > > +
> > > +	if (pte_batch_hint(ptep, pte) != 1)
> > > +		return true;
> > > +
> > > +	next_ptep = ptep + 1;
> > > +	next_pte = ptep_get(next_ptep);
> > > +	if (!pte_present(next_pte))
> > > +		return false;
> > > +
> > > +	return unlikely(pte_pfn(next_pte) - pte_pfn(pte) == 1);
> >
> > Let's not do unlikely()'s unless we have data for them... it shouldn't mean
> > 'what the programmer believes' :)
> >
> > > +}
> >
> > Yeah I'm with Andrew and Anshuman, I mean this is kind of a nasty interface
> > (I mean _perhaps_ unavoidably) and we've done the relevant check in
> > mremap_folio_pte_batch(), so let's just move it there with comments, as this
> >
> > > +
> > >   #ifndef __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
> > >   static inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
> > >   					    unsigned long address,
> > > diff --git a/mm/mremap.c b/mm/mremap.c
> > > index 0163e02e5aa8..9c88a276bec4 100644
> > > --- a/mm/mremap.c
> > > +++ b/mm/mremap.c
> > > @@ -170,6 +170,23 @@ static pte_t move_soft_dirty_pte(pte_t pte)
> > >   	return pte;
> > >   }
> > >
> > > +/* mremap a batch of PTEs mapping the same large folio */
> > > +static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigned long addr,
> > > +		pte_t *ptep, pte_t pte, int max_nr)
> > > +{
> > > +	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> > > +	struct folio *folio;
> > > +	int nr = 1;
> > > +
> > > +	if ((max_nr != 1) && maybe_contiguous_pte_pfns(ptep, pte)) {
> > > +		folio = vm_normal_folio(vma, addr, pte);
> > > +		if (folio && folio_test_large(folio))
> > > +			nr = folio_pte_batch(folio, addr, ptep, pte, max_nr,
> > > +					     flags, NULL, NULL, NULL);
> > > +	}
> >
> > This needs some refactoring, avoid nesting at all costs :)
> >
> > We'll want to move the maybe_contiguous_pte_pfns() function over here, so
> > that'll change things, but in general let's use a guard clause.
> >
> > So an if block like:
> >
> > if (foo) {
> > 	... bunch of logic ...
> > }
> >
> > Is better replaced with a guard clause so you have:
> >
> > if (!foo)
> > 	return ...;
> >
> > ... bunch of logic ...
> >
> > Here we could really expand things out to make things SUPER clear like:
> >
> > static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigned long addr,
> > 		pte_t *ptep, pte_t pte, int max_nr)
> > {
> > 	const fpb_t flags;
> > 	struct folio *folio;
> >
> > 	if (max_nr == 1)
> > 		return 1;
> > 	if (!maybe_contiguous_pte_pfns(ptep, pte)) // obviously replace with open code...
> > 		return 1;
> >
> > 	folio = vm_normal_folio(vma, addr, pte);
> > 	if (!folio)
> > 		return 1;
> > 	if (!folio_test_large(folio))
> > 		return 1;
> >
> > 	flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> > 	return folio_pte_batch(folio, addr, ptep, pte, max_nr,
> > 		flags, NULL, NULL, NULL);
> > }
> >
> > I mean you could argue assign nr would be neater here, but you get the point!
> >
> > David mentioned a point about this code over in v1 discussion (see
> > [0]). Trying to bring converastion here to avoid it being split across
> > old/new series. There he said:
> >
> > David H:
> > > (2) Do we really need "must be part of the same folio", or could be just batch over present
> > > ptes that map consecutive PFNs? In that case, a helper that avoids folio_pte_batch() completely
> > > might be better.
> >
> > Hm, if we didn't do the batch test, can we batch a split large folio here ok?
> > I'm guessing we can in which case this check is actually limiting...
> >
> > Are we _explicitly_ only considering the cont pte case and ignoring the
> > split THP case?
> >
> > [0]: https://lore.kernel.org/all/887fb371-409e-4dad-b4ff-38b85bfddf95@redhat.com/
> >
> > And in what circumstances will the hint be set, with a present subsequent
> > PTE but !folio_test_large()?
> >
> > I guess the hint might not be taken? But then isn't the valid check just
> > folio_test_large() and we don't need this batched check at all?
> >
> > Is it only to avoid the split THP case?
> >
> > We definitely need some clarity here, and a comment in the code explaining
> > what's going on as this is subtle stuff.
>
> I am focussed only on batching large folios. Split THPs won't be batched;
> you can use pte_batch() (from David's refactoring) and
> figure the split THP batch out, but then get_and_clear_full_ptes()
> will be gathering a/d bits and smearing them across the batch, which will be
> incorrect. Even if we introduce a new version of get_and_clear_full_ptes()
> which does not gather a/d bits, then if the pte_batch actually belongs to a
> folio, then we will *not* be smearing a/d bits, which is again wrong. So in
> any case we must know what the underlying folio looks like :) So my agenda
> for v3 is,

Right, ack, there being a large folio per se doesn't mean A/D collection is
appropriate in THP case.

I guess then this is really _only_ about the mTHP case, where essentially
the other PTEs are to be disregarded going forwards?

>
> - Incorporate your refactoring comments
> - Remove maybe_contiguous_pte_pfns and just use vm_normal_folio +
> folio_test_large
> - Fix indentation
>
> Sounds good?

Sure, but can we hold off until the mprotect() stuff is done first please?
I mean obviously you're free to do things as you like, but this will help
workload-wise on my side :>)

Thanks!

>
> >
> > > +	return nr;
> > > +}
> > > +
> > >   static int move_ptes(struct pagetable_move_control *pmc,
> > >   		unsigned long extent, pmd_t *old_pmd, pmd_t *new_pmd)
> > >   {
> > > @@ -177,7 +194,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
> > >   	bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
> > >   	struct mm_struct *mm = vma->vm_mm;
> > >   	pte_t *old_ptep, *new_ptep;
> > > -	pte_t pte;
> > > +	pte_t old_pte, pte;
> > >   	pmd_t dummy_pmdval;
> > >   	spinlock_t *old_ptl, *new_ptl;
> > >   	bool force_flush = false;
> > > @@ -186,6 +203,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
> > >   	unsigned long old_end = old_addr + extent;
> > >   	unsigned long len = old_end - old_addr;
> > >   	int err = 0;
> > > +	int max_nr;
> > >
> > >   	/*
> > >   	 * When need_rmap_locks is true, we take the i_mmap_rwsem and anon_vma
> > > @@ -236,12 +254,13 @@ static int move_ptes(struct pagetable_move_control *pmc,
> > >   	flush_tlb_batched_pending(vma->vm_mm);
> > >   	arch_enter_lazy_mmu_mode();
> > >
> > > -	for (; old_addr < old_end; old_ptep++, old_addr += PAGE_SIZE,
> > > -				   new_ptep++, new_addr += PAGE_SIZE) {
> > > -		if (pte_none(ptep_get(old_ptep)))
> > > +	for (int nr = 1; old_addr < old_end; old_ptep += nr, old_addr += nr * PAGE_SIZE,
> > > +				   new_ptep += nr, new_addr += nr * PAGE_SIZE) {
> >
> > Really nitty thing here but the indentation is all messed up here, I mean
> > nothing is going to be nice but maybe indent by two tabs below 'for'.
> >
> > I'm not a fan of this declaration of nr, typically in a for loop a declaration
> > here would be the counter, so this is just confusing.
> >
> > In the old implementation, declaring nr in the for loop would make sense,
> > but in the newly refactored one you should just declare it at the top.
> >
> > Also as per Anshuman review, I think nr_ptes, max_nr_ptes would be better.
> >
> > I don't think 'nr' needs to be initialised either, since the conditional is
> > 'old_addr < old_end' and you _should_ only perform the
> >
> > > +		max_nr = (old_end - old_addr) >> PAGE_SHIFT;
> > > +		old_pte = ptep_get(old_ptep);
> > > +		if (pte_none(old_pte))
> >
> > This seems broken.
> >
> > You're missing a nr assignment here, so you'll happen to offset by the
> > number of pages of the last folio you encountered?
> >
> > Should be:
> >
> > 	if (pte_none(old_pte)) {
> > 		nr_ptes = 1;
> > 		continue;
> > 	}
> >
> > Or, alternatively, you can reset nr_ptes to 1 at the start of each loop.
> >
> >
> > >   			continue;
> > >
> > > -		pte = ptep_get_and_clear(mm, old_addr, old_ptep);
> >
> > >   		/*
> > >   		 * If we are remapping a valid PTE, make sure
> > >   		 * to flush TLB before we drop the PTL for the
> > > @@ -253,8 +272,12 @@ static int move_ptes(struct pagetable_move_control *pmc,
> > >   		 * the TLB entry for the old mapping has been
> > >   		 * flushed.
> > >   		 */
> > > -		if (pte_present(pte))
> > > +		if (pte_present(old_pte)) {
> > > +			nr = mremap_folio_pte_batch(vma, old_addr, old_ptep,
> > > +						    old_pte, max_nr);
> > >   			force_flush = true;
> > > +		}
> >
> > Thanks this is much clearer compared to v1
> >
> > > +		pte = get_and_clear_full_ptes(mm, old_addr, old_ptep, nr, 0);
> >
> > Nit but...
> >
> > Can we have a comment indicating what the last parameter refers to? I think
> > David maybe doens't like this so obviously if he prefers not that fine, but
> > I'm thinking something like:
> >
> > pte = get_and_clear_full_ptes(mm, old_addr, old_ptep, nr, /*full=*/false);
> >
> > I think we are good to just use 'false' here right? As it's only an int for
> > historical purposes...
> >
> > >   		pte = move_pte(pte, old_addr, new_addr);
> > >   		pte = move_soft_dirty_pte(pte);
> > >
> > > @@ -267,7 +290,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
> > >   				else if (is_swap_pte(pte))
> > >   					pte = pte_swp_clear_uffd_wp(pte);
> > >   			}
> > > -			set_pte_at(mm, new_addr, new_ptep, pte);
> > > +			set_ptes(mm, new_addr, new_ptep, pte, nr);
> > >   		}
> > >   	}
> > >
> > > --
> > > 2.30.2
> > >
>
