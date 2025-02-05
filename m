Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B6B1519BF
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738768092; cv=fail; b=AOoHQh2jQU4EAnJF/QCl6qK3bGJSERtyPsb5X9xd4zPt53bxGjDJyEKPX8ZyF80p/p+E2o8dS6WPIlos8Oc11pBCc3vFW6fCJP53UCiE5dCRi1V/kMRdvb/jN0ki3GIwHckmn8mNJDpiAhKGNhPG4KRRUnxmo2w7ASYDsB8neRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738768092; c=relaxed/simple;
	bh=dwoSI1CY17ibvfLyZfGpw+EOFyHPC71Ckr3Q0m+5aUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mDruDXA3wWk5ARE0U9GxW+do1g/WNv+lTW6RmaGgQguz9ehejKtLXBje4quGkToMaeXbhFCMpcxp5sbltnmoBeMnieMWg9pGrkG5lk0m81hBzok0NuD36u3W4Z7FttlH+p5Ja4Ks1QKPSIACppV3r1H9hyPZWJm2wpaJeowSeGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=neTvvORQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cGSiLozW; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="neTvvORQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cGSiLozW"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515DRaCM010513;
	Wed, 5 Feb 2025 15:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=61p+JUEBCM2x4TdUIw
	MN7FCZfRnwUbuJ1AdYlabBzJI=; b=neTvvORQIt27duNuqE0SHLhjqMpmHa2Nap
	AgLzsbySrQjBGxR/0JrA91dQKckqMiWDIWkoE4izxwJHOjhSdv1Fq8fs7nD08yZe
	u1igqS7Q3+yS2gj2h90sg0bwzAGlwtdVZghnAekTLh8xTxWaAqLM4e/ywf3JBZgn
	qsVvajkLr0zWN9VoOfyX1Tid5Dz5gKAtzzNXiXGMV5N8UgsHMccqCcV7VCUlkfO3
	z/+OOJCqHCQ3xDFNaJFjKBMjtWx5DmPybzUVhLIdrBTQzCEbXIjV3Evx7mBjy6oS
	J5CBZo+fAvD//yGMIPaC8+isXheedyTJexXaZo0U1nSxk7R3zezw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44hfy877cu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Feb 2025 15:07:54 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 515EjIXU022524;
	Wed, 5 Feb 2025 15:07:54 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44j8e96sav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Feb 2025 15:07:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IaKiDlS7Y+T23C08AAnfWJMhBC2ioZcmgR8ucrknF1j0twLs+vhaAepZoq2zSir///YTsNoslBoQqwe+5ewZY4ZbSMq2OAO3RAkNmso/BW6edmXcG6BoWjiVDkgbKcban4obfca0x/OE9iRffROymQ8na3uk3LdVl43EkuYoH9OMMMGi7AwZsLwZ9lWNiQ94N3saxQmLin/+GpMPZ5ttnS2Pw3lSv0OQKze/X71wMvtVEpayiN3hkK1C+D0jHGu7ra5aO7IRDnuLoIdKApNBaPz1RDFIuY5veqmUKa5vGz8Ig9Tb0BOwhZUR3hB2s3xIzEPAHzqbTSNNoCR1K/ghuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=61p+JUEBCM2x4TdUIwMN7FCZfRnwUbuJ1AdYlabBzJI=;
 b=G/a4NiuF66ZG58t6L1EQUQh9IIe+ArdaAEzj2ar6Afgv8v1gIvI7lnJFUHkh/W9OyQeJxLj8wpSemogQNWa39I9bV7L2kDl9hgU5SkTZe5CxZJDJt1u0XTLJXL290EN4uI1mtaGyK1Dv22EWhrUhxVxqaOUlSSaCb+5a0HsqnjK+62Uor0h/hRnIeYWtg7MktPAE3qw0vjC8NPHoS0JmMaYwExvfnyGxtWpdzXSObhA/B2X8YtbomPouaSGxUQ8DUlEOBbJUmBOaQgVrZjLFadjPkI0d4ojMFGngAi1PcnPwInjLCQ5+1qnyQ2lWA2jFx+oIQC14c/10EJqIS3bVbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61p+JUEBCM2x4TdUIwMN7FCZfRnwUbuJ1AdYlabBzJI=;
 b=cGSiLozWH1n1bRb6lbETNfxwn4Mfk0AoG6C7QgoCB0g8Ntg2hUUf5aFFtR3o4/D+V1lspVfKBBX8Hs41SHiExjr6tocqiqP7bW1/cKOzkgLSovBV+zShyusSr96ujFXX7UnrFYIPo73aNCflsAdrgukB1rUqCtPjPaRhYnF3shk=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by DM6PR10MB4185.namprd10.prod.outlook.com (2603:10b6:5:217::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Wed, 5 Feb
 2025 15:07:51 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 15:07:51 +0000
Date: Wed, 5 Feb 2025 15:07:46 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: syzbot <syzbot+c2e5712cbb14c95d4847@syzkaller.appspotmail.com>
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org, jannh@google.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Subject: Re: [syzbot] [mm?] KCSAN: data-race in mprotect_fixup /
 try_to_migrate_one
Message-ID: <9fc6212e-0f1e-435f-b7e5-72058f7fd6db@lucifer.local>
References: <67a34e60.050a0220.50516.0040.GAE@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67a34e60.050a0220.50516.0040.GAE@google.com>
X-ClientProxiedBy: LO3P265CA0030.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::12) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|DM6PR10MB4185:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ac250ce-1290-4b93-5b9c-08dd45f6dc12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XfKfIAzs2shAsevbl1/tGAQVCL3LEbH01hib5hfM4u7QAfCa05dseuEh5c9i?=
 =?us-ascii?Q?873KDQOJtz/aDn/8KW/zuZW7i6tT5N1UJqVDV6YZpqqFcTqGRusYQAxTOqIG?=
 =?us-ascii?Q?8RERPP2d7NGkO4hmdKRNfZqfmQCIC0VSNt8MS2j8lk5vpiNzm2NWc2JbOrYa?=
 =?us-ascii?Q?bn8pSE1VVbs17L36woK96iF0e9hYAfhXA3rbXJvyFJMgVGrwBrF7wD40HY8y?=
 =?us-ascii?Q?9dcYqTi6Obj6aaml1n141sC2doxtsvaRqOt0k0/0gyOUgiyEXONq9HfmD0Qg?=
 =?us-ascii?Q?o/ogSZE9VeLniZtJYY6FqUanPi9d1ayJ4QajwjK1/7n8xbj1lM2wo06/1dJu?=
 =?us-ascii?Q?piXQjC/rl+jMPyTWL3BEibZ9PRkN5YmnWbPRKmLYWPrsUQBGiWkyB6RFOXIm?=
 =?us-ascii?Q?lYnimWZCHhe+Bibenywc/wTFKSea1YukvQZvoUiUwQx0MYQRDR3pgMT4zWd1?=
 =?us-ascii?Q?YmUA7o1G+oE1bQgxiknU6egs9G0HbtoYp8bHux7lQW/kDfk7nKbwKb5OsW7O?=
 =?us-ascii?Q?YY8SRrOYVDMXv7U/iQNqnO6QiUDYbWeOqx2dP1lb06zY7wJQ0SqahDIgDc9l?=
 =?us-ascii?Q?gATGBU/ZMg+A928ayfCggkumAPiOwiSz7YFMplvgINkYnPqoyEVKo+N1a6dn?=
 =?us-ascii?Q?n6ZhtjgzJf3U2RAIECsf/uYIpTPKFScdNZMfXUTyYUdQMf2JEeLFPHMguWDf?=
 =?us-ascii?Q?0RcJj+toFd4w3aSSj6wcxybNICBE2uy9F5XtNuCSsrzgAkWJugCd4HbVCi/N?=
 =?us-ascii?Q?RNfIXY1g5dfkUsvvY9yr+/Z4YMGaFR3lNV0Pedic2+AYDG12nOYjCLScKuve?=
 =?us-ascii?Q?4YRk8A1eHAytEfrbHg3iwnplMXGHN08Y4466hrwL0LPeDLeGJa2xbHu7FhwG?=
 =?us-ascii?Q?oRsDHsiN1HiCVSdlFMbRmgX+3E9ApVjdmQZhdMGh3TQYqRTBShBl3wAwupEX?=
 =?us-ascii?Q?AqK2yvy1GXTda4oR7vrd8T+VJghljqltR7KzERGFtjGm76g4QaEiqXhZTYuS?=
 =?us-ascii?Q?Tzxj34LQZf2VZh5l3wh+0lJW1fVStba4WyU8OFvIZAEV52VEAvCsTEnpJFF3?=
 =?us-ascii?Q?1VGCYNNyNfzU1w7d/MkAKpYB9aFIbhkXRNWySDztr4F7oyGHMo7mT6iO7ezC?=
 =?us-ascii?Q?6pjHidW2sbJyjXOSzlWh1s2nR4VIOEaVMdP54AAkpIpNUvKUixlgcxB/FV2k?=
 =?us-ascii?Q?eAEauphm4AZmwr7L2SyoRrWa1x5rYHUs0U+aVDrnIMSNsYW/8Dk7gF1XauIB?=
 =?us-ascii?Q?Zq4J4Ndzvh0+5DdWOWnzuK3/WvWenLJny/T87W1GIvxViiJhnKbxK2rJLp4Z?=
 =?us-ascii?Q?Amm2MpcSHmGgyqE6p5qKTSS6f8P7kD3X/YUANUvN/FU4eA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5pz9+xTZkq45R7q+Zk+iOs8hhLAMFhqX4NdglwLYA/Rb3X1QjMVaYzMVlhby?=
 =?us-ascii?Q?noodzQdxIGBo75MEWM/GrsdTmnjMa4b7ElwfXMhtbiKhnT6vMrW/96r53tFm?=
 =?us-ascii?Q?/7psWqZqN4+wF1si+JbRC7R4TAcjVxZbia96siwx67/upaeAWr6Rz2AfQa2D?=
 =?us-ascii?Q?QwzUf8Cfv6XC5hNFetNiu4cg5Qitvt0xdi7fjqlrJGyUmMYXHsdAqW2vhlKU?=
 =?us-ascii?Q?0k/479GbxkwRJfbNfk7ReNxPKorrawUU1D8gRzuhF/lwNk0cRGVgp5Im7g8h?=
 =?us-ascii?Q?GcfGTeWipRQMies5vv5VfXtGg8DT54es9ZBc/G0rMV38s9Ww82DpbrwckeiU?=
 =?us-ascii?Q?1ixWc8K87UQmJQ1ahRU+ynefizCDaWUxPdJmFgXEhjnFcAnG9geYRmGAeQmP?=
 =?us-ascii?Q?3BFVdbiKKwEQiP5J9J+aRBXW4LMYHPr1pk43HmvZyigLDOu75u+tKkMfhHyA?=
 =?us-ascii?Q?n3pT6QuOhWFpo8qvfchISvpyEwiJxj2POQUXH6vY0EErEfs20D0cyPnTvhWk?=
 =?us-ascii?Q?LXtCJDsnpI0frt4W9AcO0Ny92JKoqDysMdi6ZHs0aHTaCiJmqbbOMHj0A8RW?=
 =?us-ascii?Q?9aN9eugSlq+OphXzf73XTkuOa6HIS2QKKtUNrHelY9/hSgxDYjGN4m3faHEN?=
 =?us-ascii?Q?1hpnm+UA1obpRO1fpML/cv+iVFDmu9j2YsW2XoeD82li9OkLhyYtj+nBgPu0?=
 =?us-ascii?Q?JQO8BA/lUaF37h1g3Jp/IFY/6ZIFClpudjP9qjhVzkWS14ZfoFY+wmcsgzot?=
 =?us-ascii?Q?Wc0e40UeI0LxIwuZ3vPx3plnXn59Vj0RsGzdfwyhMzxaHI6z4W9PQXQgbQnM?=
 =?us-ascii?Q?w6cr+IV5j4+oLPak50rQogxlhYDhkeL2bx6I6vSFcbdqE503Va8A6WTgx8rp?=
 =?us-ascii?Q?3JYzloBm/Kw5Uh77oZB12WycuWhgdIKp/4M4FvklJdQ7FBMQAtxOMq/D1DG4?=
 =?us-ascii?Q?jHsX+o0XeG/cqFANrCH8qHesh0oUxzZq5XzgvG723rVKW8h3hmru4jrcWbZL?=
 =?us-ascii?Q?V54UknBrYw5PfhwfOSPaOO615Bt73yYXu3BhmxXGuaTvT6yCfUglXqKzTxIL?=
 =?us-ascii?Q?GzSdIM4Ce0GdUmOZOkPGF8TrAwnD14fvEgrIR8svWFAaTc1NF02X5XiF8dZg?=
 =?us-ascii?Q?9Cl1nXuat29u5GQ40wv3tsFOna6lipD7R0BgI/VjPgE6NGXK+OTcmfVTPYT9?=
 =?us-ascii?Q?V8JYzC0Ln1CFUAV8euHnlD+qIKAFYYL+NAmuGRCXlJEM3nMyM8mdyawI4sZH?=
 =?us-ascii?Q?2D/QIOLbqdVCxiKiemJpXj2cbdpnzg/gvQ6MQghW2MXg7xnstlNpriVAkfEI?=
 =?us-ascii?Q?vtR63fSQsyGaM4ccaFoK6B5ISq9+DPQ8wm+n5X4vsQ8qIBi4PXX5DiYcvU0w?=
 =?us-ascii?Q?KGPxw6W9WWWW3EsM1lAUGjIUfrNJ+nxsMrncfJS0IB01D1Ku5Mf1inNFMKSU?=
 =?us-ascii?Q?Ff3tKE7VKZ41KM/xfC2kmHH4380g9y7ipBENrC0bb8WCv3ENXmu2sY+13z8a?=
 =?us-ascii?Q?DkM+DuMTHbEBqD+moIwObqikdD6M+nwMxomTbuWs/l+PgBAoLrYhMU/Lo1YG?=
 =?us-ascii?Q?gPURTzBT9lqkdQl4w0GtGyJtHA/8WVSb/Qf+tvFqFEwUrrnG+aHlv7PQPhiU?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0B8i1cKdlKdokPFDIYUhQqW9rchu+luFnnVuLtKK0D13rkbVcgYvLhGNfrqD+wTu6Gfg+XtwYX7zAAKXU+mZ/LgeZaFYtB6VfTTDZhw7XDvOk/Z8zDRv6yFBS41/vdJOmfRdY4UKds9WHsWwtj7OOKQEihGQwg5PxYS62VaVcPq4hDXeffBc8Mopdpd0k6/3ag2FBL7i30oZkLnmd7DJmxCCVXyNz6fKufL5feat7ngMVrQNKputVRaCdGSUQm344QBMOuqfXKNWCGf6SGZ6ylNRkRf4lWLy0IzVrKa7cap4jq0V0iRXGph8oLUMj+4JLc8Sa7fsdmBsD+krR8BJDj+yY6oFRcI29xETNpa/IovV2Ud+dHawXBAT2901oYiNx+AH/PgQmcHEmQ6xh+SZQZdFyc8ZaGXd0hnInt0RLTAzss7pSf24K71wYZQkkMJ96b1F0L8Ox+g0doWXj0MJqE+SV8seggnT7eqsQjspbnTWrWwR5Ok4vUR6RS+U036AKjXyIXbbctSBB/Z5lKRNUrGbdGOcwq1KHunlciQOiK2nK4UDqfV+FRM+55q/x7e89yagh5LFg309TZCSZJHbdv3Nfi+vX+fdWSmva9MbHDs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ac250ce-1290-4b93-5b9c-08dd45f6dc12
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 15:07:51.4237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EBvJ7pGdvWIvqEz776eLPbzaRjuDwtD+bnjxAvG5TgykcbrSZONMXXl5qaz3vI4DF/6nAnmCk3/ZfMKofv8hSZ9TzNu61x9vb6NGQIbZT8M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4185
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_06,2025-02-05_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502050117
X-Proofpoint-GUID: 1lB8Xk4z4lvqPM7ruSOI90CBeqJCQJS-
X-Proofpoint-ORIG-GUID: 1lB8Xk4z4lvqPM7ruSOI90CBeqJCQJS-

On Wed, Feb 05, 2025 at 03:41:20AM -0800, syzbot wrote:
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    d009de7d5428 Merge tag 'livepatching-for-6.14-rc2' of git:..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=12b678a4580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=9e757e3762bd630b
> dashboard link: https://syzkaller.appspot.com/bug?extid=c2e5712cbb14c95d4847
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/9235000a1b88/disk-d009de7d.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/098ef82f8ab3/vmlinux-d009de7d.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/4f51f5eb5782/bzImage-d009de7d.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+c2e5712cbb14c95d4847@syzkaller.appspotmail.com
>
> ==================================================================
> BUG: KCSAN: data-race in mprotect_fixup / try_to_migrate_one
>
> write to 0xffff888114b41700 of 8 bytes by task 6432 on cpu 1

This is vma->vm_flags:

static inline void vm_flags_init(struct vm_area_struct *vma,
				 vm_flags_t flags)
{
	ACCESS_PRIVATE(vma, __vm_flags) = flags;
}

:
>  vm_flags_init include/linux/mm.h:875 [inline]
>  vm_flags_reset include/linux/mm.h:887 [inline]
>  mprotect_fixup+0x419/0x5e0 mm/mprotect.c:679
>  do_mprotect_pkey+0x6cc/0x9a0 mm/mprotect.c:840
>  __do_sys_mprotect mm/mprotect.c:861 [inline]
>  __se_sys_mprotect mm/mprotect.c:858 [inline]
>  __x64_sys_mprotect+0x48/0x60 mm/mprotect.c:858
>  x64_sys_call+0x2770/0x2dc0 arch/x86/include/generated/asm/syscalls_64.h:11
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xc9/0x1c0 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> read to 0xffff888114b41700 of 8 bytes by task 6418 on cpu 0:
>  try_to_migrate_one+0xb5a/0x12e0 mm/rmap.c:2321

Be super nice if these reports could show the line of code!

It's:

		if (vma->vm_flags & VM_LOCKED)

mprotect() can't change VM_LOCKED, but maybe we need a READ_ONCE() /
WRITE_ONCE() or _something_ to deal with tearing...?

>  rmap_walk_anon+0x28f/0x440 mm/rmap.c:2646
>  try_to_migrate+0x11f/0x150
>  migrate_folio_unmap mm/migrate.c:1320 [inline]
>  migrate_pages_batch+0x786/0x1930 mm/migrate.c:1866
>  migrate_pages_sync mm/migrate.c:1989 [inline]
>  migrate_pages+0xf02/0x1840 mm/migrate.c:2098
>  do_mbind mm/mempolicy.c:1394 [inline]
>  kernel_mbind mm/mempolicy.c:1537 [inline]
>  __do_sys_mbind mm/mempolicy.c:1611 [inline]
>  __se_sys_mbind+0xfd1/0x11c0 mm/mempolicy.c:1607
>  __x64_sys_mbind+0x78/0x90 mm/mempolicy.c:1607
>  x64_sys_call+0x2662/0x2dc0 arch/x86/include/generated/asm/syscalls_64.h:238
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xc9/0x1c0 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> value changed: 0x0000000000102077 -> 0x0000000000102071

VM_READ VM_WRITE VM_EXEC VM_MAYREAD VM_MAYWRITE VM_MAYEXEC VM_LOCKED VM_ACCOUNT ->
VM_READ                  VM_MAYREAD VM_MAYWRITE VM_MAYEXEC VM_LOCKED VM_ACCOUNT

i.e. the mprotect() went from RWX -> R.

I see Jann's replied so will leave analysis there for now :P

>
> Reported by Kernel Concurrency Sanitizer on:
> CPU: 0 UID: 0 PID: 6418 Comm: syz.0.1339 Not tainted 6.14.0-rc1-syzkaller-00026-gd009de7d5428 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
> ==================================================================
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup
