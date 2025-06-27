Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523472E9ED4
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751043167; cv=fail; b=SRYYarHQDNdp4sI+4LjKObg+1xt4EKYKV0qEs/P0ggJBntaUjmbbWuVxLOE4NWjB1bgcjA/Sa+SVWuo31eBNjBM3sJ7fwZyFbcx3NeLzH4/6RBK/oAmG3EFK0geCcAj0g049QY0e697UM7EThMKPhM+NpUXGty2jZlGV9dIrK70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751043167; c=relaxed/simple;
	bh=2tVbHrEigX5OzFgocx1bqHa065vtq0X1ka68ovU08SE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=X2jhETZwbz84uI7+snhsc73AWSV6N1/pY1xFAQLgarafDEP1+gRu75mhZ6WKqj9alWCzAV+gHKRTqiT+3H9ltWl8GMiEWQt0xXujf6V1HxC4hO4pl+/EO1j3xSd1VPhPoymFbE9ETUUJuN4FGE1A6pa0CdLe6TMe3UJqwo2EL0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ArES4DMU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ATUIdl5o; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ArES4DMU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ATUIdl5o"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RFdqYC018531;
	Fri, 27 Jun 2025 16:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=arONGflApvECPp+wEg
	ERoUGh/Nxeu6ilWtcdB1UIj/U=; b=ArES4DMUaVWc5FsDkLtfRNRblKYLcrCxhu
	aqfd5/+EsSVEhccu24VvOAPSDlG0DAfZuilLcjacckY8M4rH5PLUFxRfQ/sukf8o
	qwGDL+Ur9qkVzqIt2SvWHbc9qhofFknbXqbQiJaJShTw480b6F0aZkVJCN8IwR1I
	lHi5a3vjfdjRs1GwDDzwsr0op0IONXOKeyv829ZDajt09qJApFhz7HjiGPkjSecQ
	i+HHofdvQTGBr0W8Zyf9TNfyzMlHFEtktIsc5RCT7Ky4TJKJjBcOmOe69s6Y4J6F
	Xw3iWXM24BNkLBOKoV5P4k/ohbR9KxxWinVU5/DEXyGoNGmQGFmw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds7v4dtd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Jun 2025 16:51:57 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55RGJMo7002788;
	Fri, 27 Jun 2025 16:51:57 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47h0gwgybm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Jun 2025 16:51:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gp1Yuvlxu9vga+S0ykV0tMrbv1A8g+45Z1TT9yqlsmKMNVebWidJz5M/aAD/usOih2XIYcSPFVkVizcFLBzg+SQivZvDBDuX+2uNVOF7oJkhG4bD3x0zQoxDtH0XFj+A3xnJd2PYm9tz2pKLHviS4MbfmbogGJ/aOKXMdlUE7cHzYfHsPlonwpIp2WnyzT2jkYW6av+LkVl4IQv4Un600TD+iBpRXFDUWPnKgVsmiUdgtSF2w7QQqC6GhV5djoFmzq1KXfEYARcKVWkOYN2MtB6uNU31tf36klVhaK4NFMgpeI7GiAR1xP79iJxykXk1OE6QrEnwhHk/u12vLT/cQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arONGflApvECPp+wEgERoUGh/Nxeu6ilWtcdB1UIj/U=;
 b=OpiQMd7cyVIIyrUjjHKtUjkpfk7LQXZhkJ3oT0+6evmT/yGGnVKu77JK9CiXffC4GHRzcJjjth6/2YpjCeKquEh/hG/QXe5KOG1NUbU/XEekaSqHC8unmaQqYe1I08qdqfCM56UhYK/dZ95lXNoAmrdJewNkbb8rW9CGvBwFjkqyO7uwNhP/DvNVAvhAao7CtxuXn0xaY9aK2Z3BNz38wUvS6Lv4EZZRTdTljxG8BaUQjiqD1sXr8c/UlQ/pICs9y0DMSLvYiEbpcLSfwmPF7B/EXmpbqM+ySr5XtwCM73viwwd/4iR8ito3fY10Oc5Aco5bEKfrItBXLaR7QiRBWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arONGflApvECPp+wEgERoUGh/Nxeu6ilWtcdB1UIj/U=;
 b=ATUIdl5oAetD3A5j8OttUFK9l1no+Ige9elfP04CzguQUpP0c91lHNC1/ylqplcLj2On9L1D9otzjmvLiBtAFucxxEe1sTWpop+2V5mV2V+7vTCbzNQqPIrdwMiFCvcfQRJiW4svT2FLwEF+cLO0YMGMpGerN9CD/4DGQ+5rdaY=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS0PR10MB7050.namprd10.prod.outlook.com (2603:10b6:8:14a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 27 Jun
 2025 16:51:54 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 16:51:54 +0000
Date: Fri, 27 Jun 2025 17:51:50 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
        Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
        Ying Huang <ying.huang@linux.alibaba.com>,
        Alistair Popple <apopple@nvidia.com>, Pedro Falcato <pfalcato@suse.de>,
        Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>
Subject: Re: [PATCH v1 2/4] mm: smaller folio_pte_batch() improvements
Message-ID: <ea03a9a8-6e2d-4576-b15b-cf8fca1ebcfe@lucifer.local>
References: <20250627115510.3273675-1-david@redhat.com>
 <20250627115510.3273675-3-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627115510.3273675-3-david@redhat.com>
X-ClientProxiedBy: LO2P265CA0226.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::22) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS0PR10MB7050:EE_
X-MS-Office365-Filtering-Correlation-Id: ac33aaf7-057f-4cd5-7a0e-08ddb59aeb35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tI3LBDKYqPI1fxjgmgQFDHrY6eYmL7VR5QRgDDWvwD030hQZuzxuEpMuS4Yx?=
 =?us-ascii?Q?Y+UrXPc3vQe7PF7NB7zysYYPsckHZc3+TlgcSZXqWh2TfeNp1XvCO5+WcFtF?=
 =?us-ascii?Q?cvBKnSlFoNFEft9RyilDdSlycTaeOLYuM9ygR9Mwuv7IejpWmi/p3GpQG/I7?=
 =?us-ascii?Q?qwMWNF42YeT9yypkcp12FGu8oAQFh7B3xyGoCbLS2OS9xa/sSxgHVPUJLjoP?=
 =?us-ascii?Q?l20XjhYvOjHiUe9GtqCERMLkCnCI2dFIQa/q1lrBEMBmPnDFpNNJ6HjcpgL/?=
 =?us-ascii?Q?qfzrcBLoippfmCP1WjS84tTeFn9X0i293HkfNxnkVFgN0AbTQIEqr0RmrOSo?=
 =?us-ascii?Q?pE0likRTF5ojz0Mcl9/4ISewbZ8ggH/oIlR55r77g3yAFl7SFRLL0J+6E5mW?=
 =?us-ascii?Q?1PTR36LotH3k11afvCSJkdVdvQKkn3SeJq6SqXMt8WhlPeqIHDwWnh/yoyk3?=
 =?us-ascii?Q?aA556hAv4UlRnWIkzthdkTKoDZ1uCLBAJCrWUxD+LhdqjmrgOF1k+pdi3FiJ?=
 =?us-ascii?Q?zpyj2Om9sj3XNKn5wiplMshrVH/2rpjWrsm1KxxgEC5zTB+fXUr4SiA9iAz8?=
 =?us-ascii?Q?Ie+tGUfsC6mwpMxC14uPYVaDtnRxcJtrdQGfgRzoGyd+l+OhbkyJdvLgr6x7?=
 =?us-ascii?Q?zHhD2i85eqJGbXAcg69E+/VoUOQ/2FDWT8erkazi+T1oUK3U25CRZjt184kI?=
 =?us-ascii?Q?aT0fLbX7Gd1Sv+YC99z/ILNhtqLLpIN65Gp5xz7gn8Ho5gJSk4DSxobqs0St?=
 =?us-ascii?Q?a6OKf+Mkj9ovUe1rO1ANvGxEEwGkkF2OYz18pjX8owd5CgtxAtCEVmXhmoe4?=
 =?us-ascii?Q?t4qCMy6LCqNjbK74Ddioeu4YL3bV1h92UCCwZCCov6o+JreoFlKodyGCvjxf?=
 =?us-ascii?Q?JS14Vzy9+97hPD8fC+YyITQAa4mClONzpRV4XYYQ/YKKrCnZZ/oJU8a2IjgH?=
 =?us-ascii?Q?npnXRH6XbbaAiLUAWj+/Sa5MRR8vRjJPEsGLiRCu7XRH0TUvYSY7e4KlSFsl?=
 =?us-ascii?Q?bECwV6hbzNwAGxPYQwaqTbtjSMpuF8saUgmTbyea1P/gcu6qctyFfqJ2ErWO?=
 =?us-ascii?Q?zZ5A0vEH6Nz8Efjkj2oU//tAXpfWpCW7X/yQXFCDLOPM77stXhA5qAxALsHx?=
 =?us-ascii?Q?XY/uyuhGJa5qUd5fIvVE8tgjVNb3TXx3L1WAuty2ZOf+BNswI75PyjfPlSMX?=
 =?us-ascii?Q?oJ6HjrvaTBAI/m9N6zutI+ARppvE43gp+NYYTemqqMQNFcreDw+nyx0L5e1g?=
 =?us-ascii?Q?4weZNYzLBxoF4XXlwc9I9MaFD6kQpDGIAStmarbTy/zKimWto8Sz3aOmDbWp?=
 =?us-ascii?Q?gru0RhD4bKVLGDHDDNN9JZs1oXho1MTyDpY8NSo0xo1n99qJxJMXs+lSjjtN?=
 =?us-ascii?Q?bnvUzbHYfwv/uFQB4odr/IlLqh7hvK101PiYhacDzX5QbU/02Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?svs6PAgrO1IhO95W2ZsyohVTGHWVSH+IYj/VDvsDUMS2C6uEIIFT7jg5hSnn?=
 =?us-ascii?Q?Dj1nlwVsHIaqqQqIwC4NoMDJvOzG7JbRHKGoCyUWKXysRTVJbaclVoqZvPVu?=
 =?us-ascii?Q?uhkjVBun9qRiK2D+g2YG1BpgFRnz7HbXXrPPR5oOZ4Eu73HwJCq/6qcY1otM?=
 =?us-ascii?Q?bkCgQj0sEeWE6atRQgF6wPXkVXVp2gGL261SCwrDBPRBJWV6EzgLzLkVCIrE?=
 =?us-ascii?Q?BrnV2x3Zw4Ri1fFgO/f/QPfjfwArgTmHPngBn7Cefm2EctBO8LpCZtwga/yW?=
 =?us-ascii?Q?Beoy8ZYm/Fwm3i+J9idpoMamnT2JYcMorwBkFtRC/e+e3Vvkwj0lj65+hvil?=
 =?us-ascii?Q?UV1jSVbBkvdBcNjXJH+9HqSuAYuq+Ikd9bMq7qhki1d4VTJ2yu7qCyUB7FDk?=
 =?us-ascii?Q?aW+Z/FxOA0iDEpUJqA5jgNDsVbmudDWNpTvycjH00DFgGYogcA4ncCOMgKDz?=
 =?us-ascii?Q?+RXLzEwxWKb7oXShD4TU8FGA2GZoUxcrMwcWwpFkM87OUBwdDeIvYZ/GY/ut?=
 =?us-ascii?Q?W9CdLUsLOnoOH4uLIOfvvrbbGzeM73txi82ENtgCdtor9Pm8o/S2OgBV+SUF?=
 =?us-ascii?Q?+ev1PgmzLQykbWaVMYggh8ggEVUBPJpnbnISWSxTwkjVEg87nOx7fri4f5/b?=
 =?us-ascii?Q?yodBP6qVSo2lBVuuYaoSRR7+KkLkxcVv26XRNSzvclJZ0mBPLm5p1s23APpD?=
 =?us-ascii?Q?3CHl/gt1lIBKih7U78cGc0d6lTTN7Yk9aKOsqcy7tRL2BM458ChA0zgvIPAn?=
 =?us-ascii?Q?5mlyYn6S0CfMT9Uc873hoR7u5a5g9PDkVsrQse0qRy7vmHtFsKi/DSZhoqda?=
 =?us-ascii?Q?usfPMt5EpkfGF5UjtopIaAVXW9egbnmKXomothbBiAfAbzZAnO6bzf8NsNnk?=
 =?us-ascii?Q?GQLALBMD4K3X/6sfXY6TTKSZ07+A+brWArTs+yl2F7SA2N/0lXPGIEznUhPF?=
 =?us-ascii?Q?GsnBsokIzq9L06EkNnpQFV4o3YVttLsN49PYc6wGcHcmViaTvDX1PBuDtvT1?=
 =?us-ascii?Q?MvmKyP/Uo+SOu2qHI7n+YegdWhJHXu9HtzKbddU5SWj6ukXK3F4N/R+VrPp+?=
 =?us-ascii?Q?C7pWsQggVoNg23tPQ9kewiWMKcMJw/dp6a8H5cZUi92ozc5xggNHeDJ92COm?=
 =?us-ascii?Q?D2WvZsGDVWcfkdc9x9rA4LnzIzSMFZ6/TM++2ModRsJVoQum6t3FFn4ZR0vK?=
 =?us-ascii?Q?RBGIEa2LxH3ik6pifxiXAtMTbYhIlce+MinL9/kK3R/Qg7nqDjPI4QiJk1DW?=
 =?us-ascii?Q?/m0aHIoPVkHVgwb91xmd+yCPPgwzUkdHE0dBRwcuAvFm3V6LfmoOYdI2jxtf?=
 =?us-ascii?Q?VgKEH8LikEiKUR+RCwRWI7GCoEydDngf6lroPUFIm/qQjqCnE0vIFlewWR//?=
 =?us-ascii?Q?k2jjrFd7MnJhoNxTv4ww+kqvthrtid3gTzh2vgwsFF8c/KE/Oq+7Umsh79oY?=
 =?us-ascii?Q?NtTczc+XeyUGuAcvmvXZievhmlrCXSysMng8RYxrNQO4Wqfdw7v7HGvlF1fx?=
 =?us-ascii?Q?ZcDP43DIFTQSfwxvbBbN6wq1PF6x6u1FZo5c8cQqa54RWK3yqInf9m7RigB2?=
 =?us-ascii?Q?uMGyuomAgXlOWhkXdVfUTAbX20XkadmNRTWVSYggxYGj/OO8FXGMFEZsDq4/?=
 =?us-ascii?Q?6g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	glqZf0HBjj5ela3XsIXHOAuXFOLmKXB8WsLtsi8Bi3g9tlgoUEK1kLDZj/dP13XnLcHOWYl9ialbVfk9gmw0eLWifhlaVYwSiI+oV98M1gMbSlfREM08VKlczODSHPCL3uo8RGH02nHPJrfLjDojn4BvJHHyRdH61T1ZnW/nNmqwG5R8fpcvkHIDCFqDhiLxcagZWXK8/OKQoCkpFXtDUrT9EAyQ8qDhZ16efWW3mLi3p0iUqNHM1F7zD615hqH3zRp5SUceaRy7/HsPjZUWmK/pk6epoli9/u5GqWsXlcqXleH3qvygH60791xEAC23LcTgQR29pOILmn4RgPAeYvE8OuZl2BYc4bZbdN5RtRqfBhIyUHrUOpY+NPRt+BGRew8cWfyYJ540dSCKZ38JOpP5WcC4+MZnHwaXqoPEo+iv3LVRSAkFGBsY3UMcw6L80wdjYLb/AAuDV/GpUkjTZooKC+qA08W48srxlQXnUY6a7KmwAPaVe/J0ogUeqb8oOvxpGLyYGYf2ek2P/qKBttOelFoKZzxcqYX6eDK1lHbRvubqlO1INp0cAgh4Xzd46r2PNztx2A60a069kKu2AIZEmDHaNc5adhYchJ0zfLA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac33aaf7-057f-4cd5-7a0e-08ddb59aeb35
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 16:51:54.4406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kb3F6oTRIL6ngT0Mu4UlPLl4HkEHR2OqO1y1MtZPqN3dZRzljoH44cG5MHlfVBeKcCZ80ltwLTxRq1pfyOp/sCq/2M9WL+1Mg6I1+YbbfFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7050
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506270136
X-Proofpoint-GUID: SHvY8VfLZP7Mu2Dqq9n5u10yKgkh2HkA
X-Authority-Analysis: v=2.4 cv=CeII5Krl c=1 sm=1 tr=0 ts=685ecc2e b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=20KFwNOVAAAA:8 a=H7Tr40kqd8Mb8qZDWDoA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: SHvY8VfLZP7Mu2Dqq9n5u10yKgkh2HkA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEzNyBTYWx0ZWRfX3VGD1YlHweEG k+vqKF7hJnqE8gAYhduByV2yzOaSQFwbz+bFvQC1gD7GUsxBoLZyJVYZ4tsKXL1byib5AKlEPBZ RT+RJ1FgZfRxsZ+a1gWLxQaBodnT9qf0PDWEkH4roqQZkd5kREh0Ra38KlJotz64ABZcY5qbQ7f
 /0XoMZMPAK/W8if6hSCreRpw+ra3WKVYffsOpBnM+OBacddvvW+CwCnhaRjQtEwkYPE2zU5RLcU C960R9exntgB6mEJNPsXavsoOd6h7rv7L8h9v/RAlPFk873khde7X+ehfNf4C7ISRWBYhAnU8PW 0wCBT43qeNlYGfi74LDOuxo7QDsnoU2vYk7pF4E1yBfqodAs4TKPtGGDiyvNPCAusgWhbf/rZdT
 +3i2DbBMdHC/sgI69cZcP+JcByPCtNTg+Mll/binKgzNlD5QnXGKqufxi3Ehib2dissGpmnS

On Fri, Jun 27, 2025 at 01:55:08PM +0200, David Hildenbrand wrote:
> Let's clean up a bit:
>
> (1) No need for start_ptep vs. ptep anymore, we can simply use ptep
>
> (2) Let's switch to "unsigned int" for everything
>
> (3) We can simplify the code by leaving the pte unchanged after the
>     pte_same() check.
>
> (4) Clarify that we should never exceed a single VMA; it indicates a
>     problem in the caller.
>
> No functional change intended.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/internal.h | 37 +++++++++++++++----------------------
>  1 file changed, 15 insertions(+), 22 deletions(-)
>
> diff --git a/mm/internal.h b/mm/internal.h
> index 9690c75063881..ca6590c6d9eab 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -221,7 +221,7 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
>   * folio_pte_batch - detect a PTE batch for a large folio
>   * @folio: The large folio to detect a PTE batch for.
>   * @addr: The user virtual address the first page is mapped at.
> - * @start_ptep: Page table pointer for the first entry.
> + * @ptep: Page table pointer for the first entry.
>   * @pte: Page table entry for the first page.
>   * @max_nr: The maximum number of table entries to consider.
>   * @flags: Flags to modify the PTE batch semantics.
> @@ -233,24 +233,24 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
>   *		  first one is dirty.
>   *
>   * Detect a PTE batch: consecutive (present) PTEs that map consecutive
> - * pages of the same large folio.
> + * pages of the same large folio in a single VMA and a single page table.
>   *
>   * All PTEs inside a PTE batch have the same PTE bits set, excluding the PFN,
>   * the accessed bit, writable bit, dirty bit (unless FPB_HONOR_DIRTY is set) and
>   * soft-dirty bit (unless FPB_HONOR_SOFT_DIRTY is set).
>   *
> - * start_ptep must map any page of the folio. max_nr must be at least one and
> - * must be limited by the caller so scanning cannot exceed a single page table.
> + * @ptep must map any page of the folio. max_nr must be at least one and
> + * must be limited by the caller so scanning cannot exceed a single VMA and
> + * a single page table.
>   *
>   * Return: the number of table entries in the batch.
>   */
> -static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
> -		pte_t *start_ptep, pte_t pte, int max_nr, fpb_t flags,
> +static inline unsigned int folio_pte_batch(struct folio *folio, unsigned long addr,

Do we need to worry about propagating this type change?

mremap_folio_pte_batch() and zap_present_ptes() return the value as an int for example.

I mean I doubt we're going to be seeing an overflow here :) but maybe worth
propagating this everywhere.

> +		pte_t *ptep, pte_t pte, unsigned int max_nr, fpb_t flags,
>  		bool *any_writable, bool *any_young, bool *any_dirty)
>  {
> -	pte_t expected_pte, *ptep;
> -	bool writable, young, dirty;
> -	int nr, cur_nr;
> +	unsigned int nr, cur_nr;
> +	pte_t expected_pte;
>
>  	if (any_writable)
>  		*any_writable = false;
> @@ -267,29 +267,22 @@ static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
>  	max_nr = min_t(unsigned long, max_nr,
>  		       folio_pfn(folio) + folio_nr_pages(folio) - pte_pfn(pte));
>
> -	nr = pte_batch_hint(start_ptep, pte);
> +	nr = pte_batch_hint(ptep, pte);
>  	expected_pte = __pte_batch_clear_ignored(pte_advance_pfn(pte, nr), flags);
> -	ptep = start_ptep + nr;
> +	ptep = ptep + nr;
>
>  	while (nr < max_nr) {
>  		pte = ptep_get(ptep);
> -		if (any_writable)
> -			writable = !!pte_write(pte);
> -		if (any_young)
> -			young = !!pte_young(pte);
> -		if (any_dirty)
> -			dirty = !!pte_dirty(pte);
> -		pte = __pte_batch_clear_ignored(pte, flags);
>
> -		if (!pte_same(pte, expected_pte))
> +		if (!pte_same(__pte_batch_clear_ignored(pte, flags), expected_pte))

Doing this here will change the output of any_writable, any_young:

static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
{
	...
	return pte_wrprotect(pte_mkold(pte));
}

So we probably need to get these values earlier?

>  			break;
>
>  		if (any_writable)
> -			*any_writable |= writable;
> +			*any_writable |= pte_write(pte);
>  		if (any_young)
> -			*any_young |= young;
> +			*any_young |= pte_young(pte);
>  		if (any_dirty)
> -			*any_dirty |= dirty;
> +			*any_dirty |= pte_dirty(pte);
>
>  		cur_nr = pte_batch_hint(ptep, pte);
>  		expected_pte = pte_advance_pfn(expected_pte, cur_nr);
> --
> 2.49.0
>
