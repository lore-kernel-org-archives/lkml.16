Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62F7189906
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 18:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749233241; cv=fail; b=cD9HqNOeuSGX/zFhyypC0M9sKCNG9tmiLVzw9Rg4hXXmSU6q6cTJbFLH3KrakN4gNZyuTzm4CSyQfQ05PWM2vJByPsZMyxeU0C6SIFjhuq5PkinvJWLzCS8LB+aLk+Sarm3RHsUmMp5JGzdUQM0Si2MIwz9hHLWLdyBjrRLRTeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749233241; c=relaxed/simple;
	bh=yLueuzAvO+vDGYLSiZeXWdgTexBKJUeS1ac04/5QV/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iL2+TM6NlYE9cHmQnZCqMLXYK/FZq9Stxl0VPLR9tQwK5FJPxtFgECvH16R424CUqhpDFJrD0eRUyZ2iDkgEB3MXwwjoqgNBKs+fWAKf6eBKv7tt1703CggNs1XlLpTNDgp++KxGilpOPO/1VkInQBqX6SUm6Y6gbim1us8IoUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VHtLsUmL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oH9ZZRHA; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VHtLsUmL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oH9ZZRHA"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556HBaY9002375;
	Fri, 6 Jun 2025 18:07:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=84JJ+04JzOIjWxGcwJ
	xz2D+8D5+GDqIahpvdf+qqPEw=; b=VHtLsUmLKtwDEnOAVRDwWrzgmw06e4L6Gt
	S2ZjabsfFFis1CWa1btnwAkrxcZ69SHJjt66BJWAtg99oJ2ER1RLsh4DcVrLLwS7
	rqvYCOc0iCYBQ3UZTFzs9JbspjJJ/Saubm2HftO+zpNSKCv0rNg/F4+dk3xRa7AG
	10Ujl54I6FDgwQ4OKN4brgwKk43nIxI/lXXnfT7jKcE3Si9G5dMOi9ifLdugufdO
	VmbLcwX7ym+5+KEdYKW6NWUtQoXd/lpoqD+KcQaYdHejG+oXy4LHVJ+1zPc3WZo8
	K0cRMfUOKHNjJt3mhUZD7x3CDvky4W9wPmpRQ+ts059xUQk/AVig==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8j8j05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 18:07:04 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 556G5ukR035110;
	Fri, 6 Jun 2025 18:07:03 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7dtpuf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 18:07:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iR2ZLnHxR0VyPnNurzCRu4kjN6e1zkZZFaePZ4/WBy4tjMomeDj0heUtcgJv+R3mDAkcWMxDLof7Yk4aa+ZxN7uuAxVJdN0wOlq6rK3rfG+X+zT63z6epahRj7+WvYLDMAVcHbwY2IKsCIomazswfpke4VHAO6dJNn4O5M8h7m3aqa+Gspp+SecpnwEILQWNJL9Z7PB3cn/RargUpL4lid/66Hs9W3ZNF9l9ips8a8fT2DuJOIZZgbSBsJGCR315YKQMm7OtZUfBbcfmb/D+ly1wInaNR11teTBwRaOJW0lEBK/trdFnZV8gIhdzwe0fF3hgo7eX4TzYPC/n2zgLNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=84JJ+04JzOIjWxGcwJxz2D+8D5+GDqIahpvdf+qqPEw=;
 b=WByO3IIpMlwBI+4rY2H7qTj/Nu3O5NyllbG9VMYob2WcADlKQitG7bCAhzJbjt3b2NQyZWNKNe5pO3GjY5P53S7vAkn784/FKu5+nXk9Czm3Uvh6U5lkP5OaIDVp2OHuSQ+eDK+Bo2XNyluzXXUJRE0VCM4Dx39F92P3GtE2KfBQ/lDpiQ1EjEI7b5A2ryGzGoyonDb+NLED3pvwxpYWIprUAc5DUjxte2YgOUYloo0vaVLBsH8aEpe9i2F+8p4Ixmg9ofxCIZsEBQrmBd4KtDp2ErAt1GfjkYGY7hQt7l0dLaLXgoP5YX3ImYr3jD+BojusPahfwTwRgm/Hpt/pCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=84JJ+04JzOIjWxGcwJxz2D+8D5+GDqIahpvdf+qqPEw=;
 b=oH9ZZRHAVZmJv2rTXa3QuTYS/gB4Y/nmBEmDbZgtcUlApNKSYx8AMh98ZNa5yPOfDsFq+J+bxm4dKBBN5gvKo6rtzglQmQki6A5PeHVDGcNmP0SOlupKZPBVrhjVi/LzOH/2cEb9srcTq0WIoOlc43N5QynNt9DzUJZt19k4ztE=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA3PR10MB8092.namprd10.prod.outlook.com (2603:10b6:208:50d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Fri, 6 Jun
 2025 18:06:58 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.022; Fri, 6 Jun 2025
 18:06:58 +0000
Date: Fri, 6 Jun 2025 19:06:55 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@suse.com>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
Message-ID: <72bb36f2-65b6-4785-af9d-5b1f8126fc78@lucifer.local>
References: <20250604140544.688711-1-david@redhat.com>
 <aEFC_12om2UHFGbu@tiehlicka>
 <1a65d0e6-6088-4a15-9c19-537203fe655c@redhat.com>
 <aEKnSxHG8_BGj7zQ@tiehlicka>
 <e680a8f3-7b45-4836-8da7-7e7a0d2fcd56@redhat.com>
 <aEK_R93gihEn-xW6@tiehlicka>
 <50ff9149-2824-4e57-8d74-d8d0c063c87e@lucifer.local>
 <e5fa4a36-2af8-48e9-811e-680881c06b86@redhat.com>
 <1a7513cf-4a0a-4e58-b20d-31c1370b760f@lucifer.local>
 <e898e52e-a223-4567-9514-b4a021b5d460@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e898e52e-a223-4567-9514-b4a021b5d460@nvidia.com>
X-ClientProxiedBy: LO2P265CA0166.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::34) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA3PR10MB8092:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fa5ed1b-db15-4584-f78a-08dda524edbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7tnlIXEOFsU4VDHc6FaszZf0aZy5tSMI46YV3udUu1e0rdjzm/eApfvc/iMT?=
 =?us-ascii?Q?JPBPd+YLB3syKX56oEvcpUIEqqyPDeh7/0z/NOQ9h5sZVQ2zfN5YC04+9Jfc?=
 =?us-ascii?Q?6A3s5AS6kPeu5QNlT43en0HiUmRhVXtUQwzrSHl1sNBJs6StVunTDux2gtOY?=
 =?us-ascii?Q?lItUHy4ByKpx91NzX0JSxWobAfiKS+s53DJqo8jmOkt5fZAX5xklfsgg8Wix?=
 =?us-ascii?Q?l5rtSV1UigoleWFDXb4gsA1XBg+bTcrk+66wQulkqXFeBDV2FhDEcrnvLMv0?=
 =?us-ascii?Q?BL/OxVCMz2EG9AoEsnXzWIU1Nd5Gdm6DczcHmjfnutJWThIu+8zr27Hp9Zpy?=
 =?us-ascii?Q?UeS09Bg2BUw82U+O5l1LharcasLEZZjTkDTZBCqCokIrQfx+t2pVavtdTLyi?=
 =?us-ascii?Q?3i5M2gwqNtsngozWqvZ/smJJQzW76W8MORfIQAPAqSxUoPLS21CKKCUBgR8l?=
 =?us-ascii?Q?vlDSpLB8y2IXkh7oRIlcbZB/95fl+KgtIwyesMphVPqxm+WRVk/oZSUe3MbK?=
 =?us-ascii?Q?Hzu5E3vIUsnCJoSDuo1dSyv2mJL8cG8iAeQOl6kjZZ76+ehz2a6+fWhMI+yz?=
 =?us-ascii?Q?iPOeXwPPIK9f3cedSlFLT+yMsxj0BuCSOkC70u9/WFaCf9ZQlxnXskMp3bG7?=
 =?us-ascii?Q?iHptv1XqCqRNej31CBvCbQ4EavYSMhx/brDo9/GmPXVtw5KFTbWkgorD2JSJ?=
 =?us-ascii?Q?KU/A8XhEevkadVgkI6KMSCaq4CD1v/S73Kpoccykk8RNkKjqWikzMzjUAOUZ?=
 =?us-ascii?Q?eEE7rBXy+mmIBYNZNTQAcvoo3LgNt0gpzc9+M5cToXQBywzeAyiFHJznS94u?=
 =?us-ascii?Q?V711pEDNnQgfKxC7ImngpuugC8NhxYJEyJib0KN9068IK17fKBAaCbVym7vt?=
 =?us-ascii?Q?5Lyvx3LWUVQzTi1pwLx/NDq6xaRg7I6ZiRLIyoFjOgegmlnsohPLOz05LhSH?=
 =?us-ascii?Q?BLRr86pj0932HlcprulwP5HU3c/B0HBzcdzvMxghZMesEdJdeWSLrc8PVQ6R?=
 =?us-ascii?Q?mpf4TshIUTsg04cGU9mI7Wox4DudPrIIx0FAPFNkV+jW5QTK/EVBPDHFySmP?=
 =?us-ascii?Q?CTDcQ1MnboUWWgIhUuNqP+sPJ5grHcuyJB6tOcKBuZ7cW/mFq0t6AYMhgcIO?=
 =?us-ascii?Q?0lc44OlcVKDcH6FP58wkkUpSqtaJSKP8nhuwpJK/e30EhG8RF+GJyHBwcz6z?=
 =?us-ascii?Q?t/ntFghlTSGEAKnxqHTV8ifKFqCZpZCs4bVlVlvNkBScvt5l76SzzRxCmiyP?=
 =?us-ascii?Q?f+Du7y7PG8//o0ZHIkZjpt0zVxHUoeZP2/EdZZQCQXSnwuTsX0i91J45OFN+?=
 =?us-ascii?Q?eHbolXuKm5mzthQY7D2bPVeD/95mE1JfsifogaSHR26nw04thyHXuqdoYSCp?=
 =?us-ascii?Q?0kXupZFN7M3JaeNGw7mnMGHXaNIwyXCj4SdpClGkYpwBOudksBLa9NUZvA+M?=
 =?us-ascii?Q?EnA5EzBZkcI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lLGVHivjirb5XJuaSTZ5LD35GA3MYMtcgQigJsEVpjXP3GZXIrciBSbFnIHi?=
 =?us-ascii?Q?+ZgUKKNoLYGqS485xkXHqF+lNXD1ReTkDjJAKtSMD4FU1JyNf1ZwwptR6keY?=
 =?us-ascii?Q?Gj6dw/ZnREyPgc5gzCxL1kERBYERk+LLN7Pd0nZVg3jWvydiVatXqTKBb+kp?=
 =?us-ascii?Q?weQsL64xUfTQP0+FHS7SMOmpPeAg+O6C91lX76FIzfmsX7Boo5EPSIhauoCN?=
 =?us-ascii?Q?AXfLwf+ij6yVdF8vWfPUvuuSbrHs55BgSqo4pHCGMaGT55cyX+8RhdHnTf3u?=
 =?us-ascii?Q?Z7az2qSnSBYklr7VcADxvr+NcC/Anpl0yk2oEJhd9gYTZyfNw6TDHclRMJSa?=
 =?us-ascii?Q?2h9Slo2RIF4T+4Jv634OhiTMfavy/+LDKNkoYff6K2A5nT8vQrWH03mDW1cN?=
 =?us-ascii?Q?riHMKVoe7CoQ6/OydfhlL/CtqrqQ9C1MCBu/bcUKmlE2EvYn7T0qLIqnVMpU?=
 =?us-ascii?Q?056Hd4TKVR1i0VfHzjJ5+CUhY2xi2fFbA9whQf1dSlkkhDS1lMZ28UqqYjGW?=
 =?us-ascii?Q?h+hlZH8598h+FqbaSC5JndvpA8jrHFmGDcNVWtOmUj5Nd0emhrMrwAIKZh8Q?=
 =?us-ascii?Q?s57zE1AquAX0J4Qa/fSYoWXdxe5nh91vM2mLEnmUZeO4tTgvJ5QciLGC+ypa?=
 =?us-ascii?Q?czTLjp4rt69piEDleT7o2kjaaCxY4iGLoEBQLKZ9/jwp7SosyNKWxb+xMZf6?=
 =?us-ascii?Q?0HvQzf/h3AwY3KGioFNyGu97bF9NqqXRib0kwfRyLoStWYjba28z4BSKoF16?=
 =?us-ascii?Q?E1n0+/JfyhSKkOsJVdDk/kWw1vkCqEiBWjSqtAw0KmFbpEsRqbwX1+gN3BOj?=
 =?us-ascii?Q?u79g5gFPtn6C92iMbsv6HiAwPLZROeblZIHOwJqXYhWJ/RuXz85R52AjJApq?=
 =?us-ascii?Q?YEYyMr3vtv/4+ASnSVpwt5I6ZpheDfZNqn62EUD7YIMD7C9oB6NEnbItTK4U?=
 =?us-ascii?Q?P0dW0xLbXGzvoiDxZcaj6P+Q0QWM6hdTIHXOKs2kWm2oWdQ49BZbpvx9iB9K?=
 =?us-ascii?Q?7bvE6lm81KcQ3fyDLNv7TNIF3OB/ctC16+cVDMPyAncrD2KlKrbIhnUa/gyc?=
 =?us-ascii?Q?Azwfw8itkd0tZH9ImpZMbH7CQVdqtY0WqHjJ1lLeDp1lAxxKOG7huzlW+XZu?=
 =?us-ascii?Q?GVZ+bzYaCP66jpU92McrzSA9vvDJCx7rt/Xq+r9gHmDRA4K33BUECD5LyCu1?=
 =?us-ascii?Q?LyGXwkF8o6ddb8ZwIIjIpIvIPdkm5fG7ZhB6Le6YfQPzI9ubtjyAwg+TpPwQ?=
 =?us-ascii?Q?ON4KAcFdrAdc54qRvU6HKNvWK7zb9HBZZgs82KLrbVWVLJ+20g6T9g132uAI?=
 =?us-ascii?Q?vjROXwU7SI/5+v3pSGFMe41aUxDtD1U+PZ0UGW90zqhU7EPT1pJPH8vYE4y/?=
 =?us-ascii?Q?QNFYH8n4vTd8wUqxoCdR2Zq3GZOxiMP3j/ZVWqaep84K26/FszdeBQyJXnsu?=
 =?us-ascii?Q?VEtoVgoFrUlM9y8UFxpb6mJbH+OiCxbuSfU6l6ft1si/LMT+YoyLrkaByS1g?=
 =?us-ascii?Q?iT1SiXvgUhF9Ey8kpuCMx96ZsmSqH4Y43lwyM0mPBupTi+LSjHzh82tjKDvF?=
 =?us-ascii?Q?9WfFTcRDzFQZBfScPySbyci6/Cf6EykdiUKlb52ZALOYLdoWuub5x7x0l/Tf?=
 =?us-ascii?Q?jw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	C1Pau2efFdWjo0AgiWxYSxkz4w+kGqEdLowgwVy/3RDlM/RIf5T+AUzlI3ocDayScUUspbs+L4ivK/lYDIWYXsqXVeFszMKloC/7KqoBAkQxn0nHFPfP4Ck0aMJ2NND9s8TPvXQ4y6q/UNsC3GMeYXiULGUBinUb80MyRVXbVwONmE7itFjCCk2eMMqwHrs+moBoVQd0ZbGczjH/HBPhGJ+4w6bqOmVxVYiNjDOoalXhqSuxSJp9XOucssbapIgyfqPrUTeVLmMEVZNyuNDlmnEqH7SJBgZYzeM38icuDeAo73uTqI4sE4ujkpkeMH0azG6XsWEEKj/CjEd86W9AW5RS1xce3vWyTJdNnzECxbYaPc8fbC6HITg8IdYxHJ2/a4Wrw7gkqYvddjhKNzPg/ARDxisSrfs+8V6t7Bkzve47PhjsGMojcc+dtLJdV8597s44CJSn8ZXfcVVWKhGytbwkBQXBOOm0V86ZPBDfDz7w0f78aAPH6tQpvCjFzLaVkhl+nT00GT+DOeMpWr4Se4Vs+8bHXttXlgfoijkDZCsk9DFqCce6Je9DNBhtZhr4pPQ7lqI+SBs0HS8KjgUWARFJddG80UjNed5TKRgPuos=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fa5ed1b-db15-4584-f78a-08dda524edbd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 18:06:58.3750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AEHOcz8uNXDq9EbXzgKtIXVbAd+j8n7xxBu8Owxu64RYbeF3+NtVe7LAdg2lQPGDRSPxbZQJN+4bSI7mZw9i6659vuSzCduTeiRt8pFnptA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8092
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506060157
X-Proofpoint-GUID: 5wItIeZbtG3JdKaE5772cKWmlGrGImxw
X-Proofpoint-ORIG-GUID: 5wItIeZbtG3JdKaE5772cKWmlGrGImxw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDE1NyBTYWx0ZWRfX+JsxYIJktLFy sSOyFczowjbsdbUZ+XsWZGThCWUPkiSFzy9Pfv1NeoD9borbRNo5RP8V3iBbw85jnUEPRCRxxPI 7nsSrgEr4K93DcN1a8vHisRr80TeClVH/WE3pZxoaeKDfvo0s8wJA87yj2PE+gFTOFQ4R9Bwgc1
 WaA7KcVuWkbajBL8S7NMrGbFIFrRWRmh5H1ckXZN9+YGcVbnmNdCXFlIl5ShihCzb3Rtj13hyb5 RQwy3yseQXX66mBVHtR8u0Dv0bGFzG65jEAkpPeJ3RQGX7dOkGrNzZCV3l18qqFDufYJFZYnv0j 7ioRMZnkwMiApLk4LsT/9QqaznrKaXLyKd/9ywB9g3+qplcNi5NT/jJh0icG1WIknQhh2+AnLBF
 FmQs3ytP6qFDsZssxn+t28yWJfOuI4Pi4pwaQRRQpZXeqZ6RlN41drkPRZ/dxz3FN3IHT94b
X-Authority-Analysis: v=2.4 cv=QI1oRhLL c=1 sm=1 tr=0 ts=68432e48 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=WwM-Af7u_kNKHnxEFAAA:9 a=CjuIK1q_8ugA:10

On Fri, Jun 06, 2025 at 10:57:44AM -0700, John Hubbard wrote:
> On 6/6/25 4:04 AM, Lorenzo Stoakes wrote:
> > On Fri, Jun 06, 2025 at 12:28:28PM +0200, David Hildenbrand wrote:
> >> On 06.06.25 12:19, Lorenzo Stoakes wrote:
> >>> On Fri, Jun 06, 2025 at 12:13:27PM +0200, Michal Hocko wrote:
> >>>> On Fri 06-06-25 11:01:18, David Hildenbrand wrote:
> >>>>> On 06.06.25 10:31, Michal Hocko wrote:
> >>>> [...]
> > So to me the only assessment needed is 'do we want to warn on this or not?'.
> >
> > And as you say, really WARN_ON_ONCE() seems appropriate, because nearly always
> > we will get flooded with useless information.
> >
>
> As yet another victim of such WARN_ON() floods at times, I've followed
> this thread with great interest. And after reflecting on it a bit, I believe
> that, surprisingly enough, WARN_ON() is a better replacement for VM_BUG_ON()
> than WARN_ON_ONCE(), because:

Right, these shouldn't be happening _at all_.

I'm easy on this point, I'd say in that case VM_WARN_ON() is the most
_conservative_ approach, since these are things that must not happen, and
so it's not unreasonable to fail to repress repetitions of the 'impossible'
:)

But I get the general point about ...WARN_ON_ONCE() avoiding floods.

David, what do you think?

>
> * The only time you'll be flooded with WARN_ON() messages is when *two*
> things happen at once:
>
>     a) Something that used to completely crash the machine (a VM_BUG_ON
>        condition) happens, and
>
>     b) You're in a loop and it keeps on happening. Yes, in -mm, that does
>        happen a lot (per-page loops, for example), but still.
>
> * It's *so* easy to miss a WARN_ON_ONCE(). We don't want that, not for a
> critical failure case that used to be a VM_BUG_ON().

However, I do dispute this point - warnings are pretty easy to pick up from
my point of view unless your dmesg is absolutely rammed, and if you're
concerned you can panic_on_warn right?

I treat any warning that I see for instance in a test run on qemu as a
'must fix' problem, let alone if observed on an actual hardware system.

Are you thinking of scenarios for instance where you have a lot of debug
output in dmesg and thus these fly by, and when you retry the operation it
won't show again and thus missed that way?

But of course this won't do much to help you should the operation be one
you happen to only perform once however! :)

>
>
> thanks,
> --
> John Hubbard
>

Cheers, Lorenzo
