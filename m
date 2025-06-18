Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5075B1A239D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750267613; cv=fail; b=q8ZV/qnP3RcR9+XyYbQ1IjgF1SHDSk4T5d4VUdbyjyoHRc+0nP8AZsSopIKbVB+BSOr+H2T6/jICM90dkkLwvcvx9qnOn8l3EqrlyO4wwPS8jhfip8NCBuJPWGDITe4StWS8OpmiZD3CcCENRzKN8hBgXQfjghu5FiNJoHA88Wk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750267613; c=relaxed/simple;
	bh=a1kLpZZuQ0evFQ9rNYLS3gswa5kSjHEdlz+kDgd1diU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FyStsy/n4lzrVGAW5Ed9iRInkU/kibXqNBNx1ImFeg4fb3nlZlJ7CW/Tf//V70xlXkleK9JkGTOgrV1Z9erBN73z3HtmdeHcjIxuml2FM2QoVkrUm4uCu3lYmWGgtSeXvNJe47wjuMn/v2kiZDwFPlIiqXo61108iRgPm/dGhyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cZQcbCu+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=w2kQccdt; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cZQcbCu+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="w2kQccdt"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IGQUKL004880;
	Wed, 18 Jun 2025 17:26:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=7oShOV93+Ba0M3f7nJ
	QnVoCTdg3SESIthW1x32oQjk4=; b=cZQcbCu+KoKZKeX+Phd80C9Rr/uWskhEj/
	lrLXK391YkB5FX3Ea2NLsUpfmZxBDDUO86G1vOkRz8SVSic9cms/QEwd3LL9V7oH
	ME5UX/AgioJdoj96xSsReduTdlRdGmVos0tZMo8GtLkUqn639LM2y9IwVYALk+od
	Lc1csY3SU5Q5kmKbiyjgff9uIK/WW96lC7CaSLTlSPfHPThT13zZvIFo4wBIHKdj
	n/Fxbt1zpwHbhGut6GheLUyPHHp75EDNjFBG10lsjLbk98hKzvDvVrJhE+HJAGBj
	IBP0m9pzU3rM1atOOK9V70MR/e0qiq+zIWB3FZPMoZapjP+veQcg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yp4rcsg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jun 2025 17:26:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55IFu6R9000823;
	Wed, 18 Jun 2025 17:26:30 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2055.outbound.protection.outlook.com [40.107.94.55])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhaxbd6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jun 2025 17:26:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U3QafmyvmXW0jQqSbQaSw3mG9cXmtJu2JBeL2KDNGmssEUa/0/X5v9mgloFUfN3XBaMM+Nfu1JrlBy4kOzDFfJUCdVa7wxkezuWFtHP3M8ZFi3ayCcTM2U3nhqEqnV6CABSBq3yUp36pqG6Nn+PAtzfAe0yWgesOBPp/2qktmJivGWcOGBpirwCcXCG1kaAyZdFYjfijf6zDZvAHLlhmf39L7Nb+eLEg93V93hcyZpKxgaAoDzLVus0AKn/t3aim6QQk6tK77wvFBwc0hUiOfKCj7UiSqblgm39spiZusBBE0zkD2RPZfCdd/5PI430hPh3fwsTsz02e9iv+UbRIFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7oShOV93+Ba0M3f7nJQnVoCTdg3SESIthW1x32oQjk4=;
 b=KEbpjuUIz2jLGeyVGQ6RC1AROGgEL0kSuGqnbWNN5rEryYPtn9WdsyQf/IVsKKI7UciC2/8SdZDy2kW/AmHN4yu+uC9cmlvya1a30oRpzyZhMzaMhN/B1eYOHjI4zK45fsl0O9/+IWFQ5q1TbJQATAHEhgZxJCK+h45T61+W3OGNJ1QNrAWv3YGS8nMjzSMQ9ZRggUPvW0l0LlPS76fSoCwmr5KarnjCFZDQ++h+jy4mMb5K8iM8zWJWZIIyn0wdpvIhkkjIFhEI/9AJfA9M1IIm/ED+sCBr3nBh9uoEjoCvlJfHI+P0bJsXVXH78JSoEslbuhcpnQXGAMCdsC7hpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7oShOV93+Ba0M3f7nJQnVoCTdg3SESIthW1x32oQjk4=;
 b=w2kQccdtGyOAN44W3X5ZRiMeTrXMwmJR+b82zo4EvGEeBT9gDflP/q7psMETPCyR6x1Evh5ihCkHuN1nr6Ls0Vd9VjWv76rkeJ8rL97YtZFXNW8ubagoEvL2/3R/IuTk+7+CEMqfhcGFSSV2FWCvT5dpfawHJHDP+Feb7oMI7X0=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH7PR10MB5829.namprd10.prod.outlook.com (2603:10b6:510:126::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Wed, 18 Jun
 2025 17:26:27 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Wed, 18 Jun 2025
 17:26:27 +0000
Date: Wed, 18 Jun 2025 18:26:25 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com,
        baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, baohua@kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] khugepaged: Optimize
 __collapse_huge_page_copy_succeeded() for large folios by PTE batching
Message-ID: <f4de7754-e60a-4a87-9319-24b78a0c6895@lucifer.local>
References: <20250618102607.10551-1-dev.jain@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618102607.10551-1-dev.jain@arm.com>
X-ClientProxiedBy: LO4P265CA0190.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::18) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH7PR10MB5829:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e16a1b0-3865-4a5f-949c-08ddae8d41fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jZbK1B4YrXNPzBMp6nWJJnDwnsOSRY4ETjXNz7tkg6w0VRNKhbLi36x4uqQ3?=
 =?us-ascii?Q?NaxAkNPLe1if71YGUJ8lvKHiBDnXZ06cg7sDat2nsYId+YoA+hmiEGvYcOyh?=
 =?us-ascii?Q?RMb46WL1+yWd7k6xBlTkrM9ws+C+pCeQzDTBXoXBnGVemGMSqZe8iRJEq02L?=
 =?us-ascii?Q?NDt1O9ZVltWtzC8QzgDAqe+RYEEHuRFVx2pVWZvXYc1ya/KM1ug55Licl/eB?=
 =?us-ascii?Q?8lYG5xQTgdopHF8JrlQef6R/4l6wIvarKWc6BJFcQPBCXOGTay8lvoyakVyK?=
 =?us-ascii?Q?RRE8Rl8Tp37NMKHGLIXy/F7orC6WkTiV1+jNcwp06scDMnjwjVj1VACgR+nm?=
 =?us-ascii?Q?zyWalo/YJMXgJJ0c7Eo3anr5rmOKcnQiMw5Hf3Vtv/gEIoWCYY+CpsOzp0ko?=
 =?us-ascii?Q?8fx9KKtulgbKg1EANVXr5xs34l3sGM3iAbx2SVD0iPNmnlpR7q+R52tmo6gq?=
 =?us-ascii?Q?0BCDLcMEGDQd9+KDnaVGRslkKMe4X3O8zmRkfZ2pQ+nk5wwZJ5B5wL9e8JDz?=
 =?us-ascii?Q?XHjwMmGyqBPIU05nQwnPtRk6qKr3rXq6/AOjueNF57uu1+DB8CsYWkV1+D6X?=
 =?us-ascii?Q?f6KxLhkzoJ6SPer9am4lKjMTGnI9MWP+BxPMzyxtLNj6Qsw61z9jrVSKx0hn?=
 =?us-ascii?Q?CnDgIIO6/p0sAG3ZVBvoNsbAI0xHdon3sf+FwuwuQh7vhp5Z6IkyCTNdHD4E?=
 =?us-ascii?Q?V6E36piY47sjYdKTrN5kHzCThx6dRGZg2VgTD753mG6GuOpAAlS74r/p+gd1?=
 =?us-ascii?Q?ICmhBDhZ4fZQfVjMm88/uzDdfDsJ4OBUQXbdOON/kNfnYRaPSU7RAIa0ADCH?=
 =?us-ascii?Q?ayt//LFJ9gJnKMQdgMefBjEZ1OoZpWxYRhyQ+CxaBO4sGC+AcDuQti3JZBWZ?=
 =?us-ascii?Q?JVuqqkegk1qn5I4jsBHO9v7+4N9GytEII07W3NDF9BIHKRSPeS3wWQaV8U6r?=
 =?us-ascii?Q?POR3H8zBw55ozrlK8J8t8ETckXvmRSAhVIuh3e98HU1L21bKb0m1WodB4kv5?=
 =?us-ascii?Q?fWTvr38A8cWobAXTmW8vgDyf9RgHdva8vSwu1uGW0dYr7CrNudWuYhpW0FtQ?=
 =?us-ascii?Q?gL9YEQOnizdDT+M++gFTZiCj5Fe1ZmZJL2gwHfv42A9SMTPwRn0XkEcyoIg1?=
 =?us-ascii?Q?v3LX26FDXQW0iQE06r5N893WHvOM+FAQM0l//74oi7LoTQbiBQCbg6ISUrfN?=
 =?us-ascii?Q?dk+cgh0Cva6Fb6Jga5a8eRdXQ5Re5yOK1N2G3mw3j+K5snWsOM8++PsAAMNJ?=
 =?us-ascii?Q?hcFuc5HhZDFA7sMQHgvQz0wBtuCPUOnHi8yUMSVd/5srnqr5Xx2QoTIz0pqf?=
 =?us-ascii?Q?oqVI2Y5Cbh+PRKGAikv9T10ncj5VsBsxUD7VlqF5R0vfLiYAtkrUqQofDVow?=
 =?us-ascii?Q?i07UyaqAsXeONLWJ4rxyT8Xhsmuo8JENqn3EevRjFK/n+4UcxQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FMtx3Sfy68UzNSBaU+PS5zxtafopZDnHNS6JpAnOdgFm8GKfCDdMdjaO4VV3?=
 =?us-ascii?Q?6NXR05dUjjd4tpit2ocaGCUlpSmVzdjORfdGUF9AGLGSJGOlv63kpI72LyPw?=
 =?us-ascii?Q?fLbUrz3pChqpWztBKmmot1ZTgyRrOnSDgiWzQngcp/e5z3xV4dwL8ExOKyjq?=
 =?us-ascii?Q?Bwya+Gw8AxExsEs1COMdJ7hSk8zE5+SwGx8lfMwnMdmVrZWDxwnmhGi0SGiC?=
 =?us-ascii?Q?/6hVD8uxbkIdVYuQ/GjaxjbQ+jbCHdjVShBtJRzFUEnI7KGL8irKh0g4byQA?=
 =?us-ascii?Q?xqB6FoGgWgIFWryKoeorMwa8qWoOxfo6BG8pG2fcnrRObDrHOdvJwzCCQE6f?=
 =?us-ascii?Q?1glL1BscZxd0UnoXuBm2tyyvpsfdYqmgoUEh/AUUw9GvaO4DtggY6Ypta9xJ?=
 =?us-ascii?Q?lEmcEUlr06nXP+N4vrpr7yZzcT1Mo72cEQTCIpjZDqNB49dPX25dNzw3+LrB?=
 =?us-ascii?Q?AVduIcNeF2albQIm/XzDLv5/0dnNs2Wzb3flaI70LZ3+c6J1f4D0h5cc0MeB?=
 =?us-ascii?Q?61/k+IhHoTGk9PQmw2gM/Zj7tzV4tdlK5tosWfGIHhUCpzzwWtQPzDUs61e/?=
 =?us-ascii?Q?A5SlhykH3jdf8l6JHZPVmZB4UripCOYXwcltnT8R+VwNIv9wNSBhmuc6z0Ko?=
 =?us-ascii?Q?EeOELMoMZRKRaoTONk4Hm6fDyLDK2eX82vZtlGLKimJkQNd9ahz9+HbuDDd3?=
 =?us-ascii?Q?8hRnRFnt7dv+tJbsDImUXdI+GRcyu43EXDtRg+59UnWLBGANJ6V7CXQ/E1BN?=
 =?us-ascii?Q?dQhx0Xe/yidP+oOlExFyp6XlfDsj2OYh6751cTWc3Tmouaj2apIDTorTeySi?=
 =?us-ascii?Q?XU2osN1tjKYLJVjLrUCtuNqk0N1B+OFjfFCqMEhoJWRYtzALxCjvvSNN7PR3?=
 =?us-ascii?Q?2AXUFewzFs2BtqkZhpmaI1TtIe8DsarVUAPyib7b/L+ujPoHLywxZhYNxDBE?=
 =?us-ascii?Q?DM8MC3gWwV3FBAcfnXHa3oeg5PwTQ8jQ7w9/pzfJghz4UltAJo2JMVrE+ty0?=
 =?us-ascii?Q?l7FtSZwdHP4dE3JcZfJ1ci/Um7IkuUjipKH5UpuzbFulzMn9ohoj9XOpt6xp?=
 =?us-ascii?Q?/u7lnj4QSfAQSlTLw3e2JCKKMJvuTa2pCa/R13jxUn2q6ZzpNYJvyZfmKvEF?=
 =?us-ascii?Q?pAvYYiGlf6GevffrSN+lHVEOaEyre77rdlbo1g6KYHLL/zbM0kf9iA0sBhId?=
 =?us-ascii?Q?LVoUW/3uFQeyttpWxeDsUVx0bLzDMcLzfDcgwSUs0rMMicYbs6Z6xUW3dyn7?=
 =?us-ascii?Q?9ct7nc/wx3NQVCpbMvXLiM+xmBxjAPDGYfKomWvTxxPLrxeyAR9f3HZGHPE6?=
 =?us-ascii?Q?EqtWXytgPchr7fseA/fhhRDzMlnoFL+ve+uKaLC9Ry87ank529V+OVUTHuuR?=
 =?us-ascii?Q?ihLNdrIyxDWIDSgCc3xKIPCcCrSpUP4wx2K8angIDEViH3GyFGzA24dD6sfk?=
 =?us-ascii?Q?LRuniuS2oddiMcdFO0GI5qMLpdB49sou3HghZaggg/LxVLNxzcThNiymZqmO?=
 =?us-ascii?Q?Q3Ac5YbXWT6pb/oiKDYqu37kV9Yrb/BuwVOsi34dkTB08qkaWDchxjWC3lTt?=
 =?us-ascii?Q?ANXtbBOHFUysq+f7BCuVzYjSFfHbIjF0J+94c2QYHvwjj8fkM6PO/ax5ijBp?=
 =?us-ascii?Q?Xw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6yGyLVhxDJE8bxKzc+FLJK+fWiMTLvn5QJoBbHB4dXkbEDlT7LjVnEHdQ78eXRRZljTTPFdNCMbeSZTWyZwwolmSJr1hC1DUyffuBXY+c9edPZiEstO+XFN/LIp79/QxkV+6/rnfvE7NN8PbVrP2l9E7djYzsBOAJzC/oymKs/amy+YwDDf/uCa9z+bnfQ1rxSi5/n5qqW785tG81N4iSReXHWCjd1PHGxdC9BaIQMzLWoLyPFXWdTvfHJcAlqgy+/wJp1WqpOu+PG0r4xIlxGkrsTDSRrrKQpVRaP2Xb8sahk1nUOARghSvBOR1+uKQ9wy8G8jTjAkYDcLnpTdY8Dbs4j+1G7qjPCI5IScJ5vj2regEGllRL1/8UuQ/4WAAmyPRu5mekWfs7AAKdjDA6fdhHrmBDJ0e2Oj+aB6mEKNi5Z6ZYjLvzPqkR/oESYsJs5n3SgKRQ3TjbdQ9gQL7SjrpgC6uKvf/ebxcZiVemz+BTzmFUKBYpj4kybLpQHgEgvQmv27Kulm4A8lMYLmICV1EwPFsTGAeaiHyKzW5j0foJ2BHwTUGjgFzCXU6uHsypTOL4zgt1+1OksRCmAwpjBxJItIVRSjqYDN/9/bCZmo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e16a1b0-3865-4a5f-949c-08ddae8d41fd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 17:26:27.7929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e2PFKBJRDJCu8/wVlXNq953u7X5zL6hJRzr/tPSAN5Fj4fCIfIoDOJnmBKEHSlPgVfbRY+O0PV+VtnyOCqtaQvENCSu9Gt2s84Ce+axB3zc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5829
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506180148
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE0OCBTYWx0ZWRfXx7GVN6FwwFSh dRxQizIccZXflmzctWE7jwWo/OJk3OAg8sSTlzHJBVbajkDUcenRonXDr0yC9P9Dh2s7k09MO7k K/WixdMQhwq1gC6AHCRsc289FwL2zYoRXaUUeoCIofdxFjKhFgB8AABmiS3SWrO/Xp+RzyDJUKA
 EVCun5CTyxt3lmnhicA3mc2PFPBd1s+rlXICuyfr/0eukUEwHla+1k/peVCBCA1UiYAYihrCrki wcc/C7LUa9vNI29TLryV9zGy7pip4gf1i4ZkozyBVsa0jlkBlFWKu14hP0mSymTr7DHIMdYo/Zq 049vHfrq54+/OObJaoKqSTPWB9n+6vJKNuW9WsfGeCfcCSvEZ3zzOyG9okaoCE05tO0BhUDOcJy
 fKfvB07sJDOAG/GitombqjEXzc3NMHCabDq2Q4UV79OkhVFrEfCXRqkfx9qrRPirw276SUQL
X-Authority-Analysis: v=2.4 cv=K5EiHzWI c=1 sm=1 tr=0 ts=6852f6c8 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=SgFX74s8mZMajhGHGVIA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 cc=ntf awl=host:13206
X-Proofpoint-GUID: 4kSK5jy-U0AciaQJ_s5CpEQw4oS6FKXn
X-Proofpoint-ORIG-GUID: 4kSK5jy-U0AciaQJ_s5CpEQw4oS6FKXn

On Wed, Jun 18, 2025 at 03:56:07PM +0530, Dev Jain wrote:
> Use PTE batching to optimize __collapse_huge_page_copy_succeeded().
>
> On arm64, suppose khugepaged is scanning a pte-mapped 2MB THP for collapse.
> Then, calling ptep_clear() for every pte will cause a TLB flush for every
> contpte block. Instead, clear_full_ptes() does a
> contpte_try_unfold_partial() which will flush the TLB only for the (if any)
> starting and ending contpte block, if they partially overlap with the range
> khugepaged is looking at.
>
> For all arches, there should be a benefit due to batching atomic operations
> on mapcounts due to folio_remove_rmap_ptes().
>
> No issues were observed with mm-selftests.
>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  mm/khugepaged.c | 31 +++++++++++++++++++++++--------
>  1 file changed, 23 insertions(+), 8 deletions(-)
>
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index d45d08b521f6..649ccb2670f8 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -700,12 +700,14 @@ static void __collapse_huge_page_copy_succeeded(pte_t *pte,
>  						spinlock_t *ptl,
>  						struct list_head *compound_pagelist)
>  {
> +	unsigned long end = address + HPAGE_PMD_SIZE;

I assume we always enter here with aligned address...

>  	struct folio *src, *tmp;
> -	pte_t *_pte;
> +	pte_t *_pte = pte;
>  	pte_t pteval;
> +	int nr_ptes;
>
> -	for (_pte = pte; _pte < pte + HPAGE_PMD_NR;
> -	     _pte++, address += PAGE_SIZE) {
> +	do {
> +		nr_ptes = 1;
>  		pteval = ptep_get(_pte);
>  		if (pte_none(pteval) || is_zero_pfn(pte_pfn(pteval))) {
>  			add_mm_counter(vma->vm_mm, MM_ANONPAGES, 1);
> @@ -719,23 +721,36 @@ static void __collapse_huge_page_copy_succeeded(pte_t *pte,
>  				ksm_might_unmap_zero_page(vma->vm_mm, pteval);
>  			}
>  		} else {

Existing code but hate this level of indentation.

The code before was (barely) sort of ok-ish, but now it's realyl out of hand.

On the other hand, I look at __collapse_huge_page_isolate() and want to cry so I
guess this maybe is something that needs addressing outside of this patch.


> +			const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> +			int max_nr_ptes;
> +			bool is_large;
> +
>  			struct page *src_page = pte_page(pteval);
>
>  			src = page_folio(src_page);
> -			if (!folio_test_large(src))
> +			is_large = folio_test_large(src);
> +			if (!is_large)
>  				release_pte_folio(src);

Hm, in this case right, release_pte_folio() does a folio_unlock().

Where does a large folio get unlocked?

I mean this must have been existing code because I don't see where this
happens previously either.

> +
> +			max_nr_ptes = (end - address) >> PAGE_SHIFT;
> +			if (is_large && max_nr_ptes != 1)

Is it really that harmful if max_nr_ptes == 1? Doesn't folio_pte_batch()
figure it out?

> +				nr_ptes = folio_pte_batch(src, address, _pte,
> +							  pteval, max_nr_ptes,
> +							  flags, NULL, NULL, NULL);
> +

It'd be nice(r) if this was:

if (folio_test_large(src))
	nr_ptes = folio_pte_batch(src, address, _pte,
		pteval, max_nr_ptes,
		flags, NULL, NULL, NULL);
else
	release_pte_folio(src);

But even that is horrid because of the asymmetry.

>  			/*
>  			 * ptl mostly unnecessary, but preempt has to
>  			 * be disabled to update the per-cpu stats
>  			 * inside folio_remove_rmap_pte().
>  			 */
>  			spin_lock(ptl);
> -			ptep_clear(vma->vm_mm, address, _pte);
> -			folio_remove_rmap_pte(src, src_page, vma);
> +			clear_full_ptes(vma->vm_mm, address, _pte, nr_ptes, false);

Be nice to use 'Liam's convention' of sticking `/* full = */ false)` on the
end here so we know what the false refers to.

> +			folio_remove_rmap_ptes(src, src_page, nr_ptes, vma);

Kinda neat that folio_remove_map_pte() is jus ta define onto this with
nr_ptes == 1 :)

>  			spin_unlock(ptl);
> -			free_folio_and_swap_cache(src);
> +			free_swap_cache(src);
> +			folio_put_refs(src, nr_ptes);
>  		}
> -	}
> +	} while (_pte += nr_ptes, address += nr_ptes * PAGE_SIZE, address != end);
>
>  	list_for_each_entry_safe(src, tmp, compound_pagelist, lru) {
>  		list_del(&src->lru);
> --
> 2.30.2
>

I can't see much wrong with this though, just 'yuck' at existing code
really :)
