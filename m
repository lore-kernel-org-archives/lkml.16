Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F122E62A2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 22:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743718020; cv=fail; b=uong10GXwHpn59JHf/jqta3OW0UiukyYcUNxRz/X5ea0fpyW4BNK5BEqdcmG714YAVdETxEQ8tVkFPkmu/E9F6pZvLh/qMZ6QPahA434QjDEMVp6LKrvdK67yK42I9sOw35aSHNU0nNSiaTltgrK3MMHNgSwhg5LmEq6s+GejVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743718020; c=relaxed/simple;
	bh=z0v7Pq6SYe4F7xNingR1rVXH+RP/vk4lY/kIrZlpCqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=b2qXQ5z7ijNTWSwW5luVjIisFLmACm5A6JzrVKPcnk8P6ympykg4qPRRlVSjTqI4MNhH/PweXmXnI+hb9/z2lXSFhL/FfuvWZJCATFiMwKW7lR+I2DkuWiUEdZOeFbWI0jnmM4lZ0+aYBn0XhqWxHj2jiWz+AX4fFHmmr32CdQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZcHbOXe8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Ur0hJ60X; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZcHbOXe8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Ur0hJ60X"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533GJSlO020913;
	Thu, 3 Apr 2025 22:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=x+3ZVg9x22v8YDWyP6
	bS2cxBYMxAVe2V3HHzkjFi8co=; b=ZcHbOXe8i+NtpyTsPSIpdrlh0aHRKgiuEV
	pOt9btV8fGB4qwcFDhx/qK7Xb7R7k0E7JWS/R81URQUQ1planwTrQxMYqhj9riG4
	Piu3SXGvkomwOlGQNWadNA3PeqzEhBiwhyRSyauGPxVFGK2Y9oIFr8Jz8wRi+50B
	4Ru/R3tligMm73RUeuKTSKvQkJyCVNcs65zsTIBuGFpWsrNXl3uZfOls/hUL8RI0
	yT9yC4D7e/mqihPijXmnhUOZqQLKBXLVEWbuTCLRH8lZnLzZuDU2NDItdzccIZ4h
	LhUlXYxzOEpgm+A4IBIlrpe0KnUGuEc4w6bbRFwbDSwCknnj8lKQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p8wcpem3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Apr 2025 22:06:37 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 533KsnLo002565;
	Thu, 3 Apr 2025 22:06:36 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2040.outbound.protection.outlook.com [104.47.70.40])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45pr8tuwv2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Apr 2025 22:06:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ilpc0kHF6kXu5lnxq6OL0+q+mpwkf7Za7fYFLFyy0n45D/5PldJBSwax0yqjlJC2tZP/9200fgFHLzn6hDPa2YtizEJPp/aI3hYdNpObnPYcKz7GelxPSaeZkpJ+JAWYqleLV9b/I1NAtBdN+uarb89pRtPDyXER75Wm3iQ3lT0i/iA8wHaNACTghd2PMBcL1DgyAJpdTbhVKbgIJHL0GRthvZ96699NX+A2g7WOqvQ2hW/TLYnURoP18o4ePAO+XTkYZ3duQgACQuLMS+lEmdsu8f+r+YjAdKspvWBKy6PRYh3ldKAM33Rkz7kNwz3nMCEB3ZCkw6QBr094jAe+Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+3ZVg9x22v8YDWyP6bS2cxBYMxAVe2V3HHzkjFi8co=;
 b=ySUK8xwUbTkzXjlvFSWER23zPIxFOItOoeF5Vyaspdwk7KJw8pT2YYHL+asPbzSiZqPCFkR6Tphol3hg636xfs1TGl/Y/xs7A2kU9kWFNWLbwU4pO/bzpybNWxR6IFZXmgAHwtFrBzGDwoPkcvuD+n/M5VU7COG6+kiAddxIw9cNS+1N5LQfCLrx1/0yXF3o9qmpwu544ByOPAho3C91wXvI4kSsXAWGn0NR8jtBZXRIIwHqyACmq1J3xYPExnUvi2sGKonVTL3bbjwEMDAwP7KRzoQywAUNsnYYBawzRUItAHWpjUhYoCK5W1hZ8oOK4CdYrfm2L5qAGH3LUadvbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+3ZVg9x22v8YDWyP6bS2cxBYMxAVe2V3HHzkjFi8co=;
 b=Ur0hJ60X3/mM5+ORjiJGUE9WW4MyzqknLvGs5MhOVkAzveTSy6TnPJX/2DN3uPNC9xQA2eGKTctADZG5p1S6/lwwj8UFwBkQ+JV7AKSkg3MawyKZMiEF/JWav2S/P8ODLQcMTOrku0NbLNqUuAElkhyk4z5KDvjZy3j6+Cu+RHU=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by IA0PR10MB6721.namprd10.prod.outlook.com (2603:10b6:208:441::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.43; Thu, 3 Apr
 2025 22:06:34 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23%7]) with mapi id 15.20.8583.038; Thu, 3 Apr 2025
 22:06:34 +0000
Date: Fri, 4 Apr 2025 07:06:27 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Oscar Salvador <osalvador@suse.de>, Vlastimil Babka <vbabka@suse.cz>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
        mkoutny@suse.com, Dan Williams <dan.j.williams@intel.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH 0/2] Implement numa node notifier
Message-ID: <Z-8GY8X9uAE8LsDz@harry>
References: <20250401092716.537512-1-osalvador@suse.de>
 <78c976ba-1eaf-47b7-a310-b8a99a3882e2@suse.cz>
 <Z-1tzl2NqqRUYyU-@localhost.localdomain>
 <e1ebfafa-f063-4340-b577-d1b6b2fb5d11@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1ebfafa-f063-4340-b577-d1b6b2fb5d11@redhat.com>
X-ClientProxiedBy: SE2P216CA0046.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:115::17) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|IA0PR10MB6721:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e5ba1c7-54ee-4589-f3c1-08dd72fbcbbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8rOj6oVbCpgkmzzwvfQjrbibHszQQMldAO7joEU6KbrQdv0zxzOCAl2JhZVS?=
 =?us-ascii?Q?VAbyW84qJLYJhqak7N6KFmzxjIUiPykFXeW+TstLQQE8kW4gkrR6+TtM076I?=
 =?us-ascii?Q?XJoXXQ/T99vE8E3n3I5cqfAS4UpaM+3K0ViPmEKVV0VmSNRTTLCFSU6gMoCK?=
 =?us-ascii?Q?zipM1mwoB9o/YDIgl8AfC0oaJjWt7jeHmHWc7t08jEBScObKz4wwL0aCGNy2?=
 =?us-ascii?Q?jDl6VBCFr6TIqeVCeFgdAtQY950lKGsGxSKwHJ0c1hZ3pf3WtAXRB1kEdceq?=
 =?us-ascii?Q?jA3VFKuHHY2FkhEqIvXxKcj3Vuhn7EGvrjikPZFyvdgi7LdIZHm4D5nk2acn?=
 =?us-ascii?Q?6ikTp0Nhzpf5zXi4MpT0tmLkU9c8NtTeuNxI9dUo9RF8oTR6FYi4DQJieplW?=
 =?us-ascii?Q?Q0QH/cQnU2SRR7iP88ljXico8AMK76Q+zZQ7cbfu3dvpaZ2124rd8l1Fj8WD?=
 =?us-ascii?Q?pJZ0iViCPXldXt12O8X0kccWzJtD4okPIZgW7A25g7jP7ZEOfaYgYW0cUu9L?=
 =?us-ascii?Q?bnFNSnmvfjkrGF/aD0/1klx7c0lnINSxD8FuVzQwasEtRUE+CH2xWjGsFstm?=
 =?us-ascii?Q?5q/JxUfxwJPhCQ/qmU1ddn/h9mxSlBFNGaU+Eu9MPf43YfAJ+TDBL+rOJ5Fy?=
 =?us-ascii?Q?/XkbJBPf8KsD2q1f7QNId6Q02ufoF8l8Bt13AnonvF2cZumJEhBpnnlHyyfP?=
 =?us-ascii?Q?2WX9h8zgi2otqRheYaZMzZStdOCoYaZQVOI+S7/E5cen2pGaWKZ9UY/9E6JM?=
 =?us-ascii?Q?jDv+FhfcTHTVXmbWCQa/m88RoFLNuap1maB+yesNZcp4uKXPQgRwUQQ/BdpF?=
 =?us-ascii?Q?thDhAr9MPJ/q9TwRefThrK6rvHbMes4CgMr5IBcH9oupkECZwWdRG1KFXtkd?=
 =?us-ascii?Q?VtV8CTtUcPrVuiCcUQDto7R+ztor/0QFsXefQn+XU5wF3wgTCqJ1eqtioAvd?=
 =?us-ascii?Q?4/sD56Kr3T7Nhlrz6TBGoUYX28oWdqnvYRpL9/GX2WLOkafq0DITmmtEtS9C?=
 =?us-ascii?Q?KUd3z0foU6AA4gCkPVCytHS/y6MaV8xQ/Ljy853Bz4TqBjmtIBIXVBTFfZFb?=
 =?us-ascii?Q?DDz0VtENZSaKO1fcJxSTUM1Mmau+Vy9j9IoX8n3vHTs2Mfp1PooEjWZ+Qp9y?=
 =?us-ascii?Q?PxezEF0W5DU5Af0VpUcpwDdVPsXHDIgmY4zrcxED35NCzo20dKgIxnT4nj3v?=
 =?us-ascii?Q?a2NmQs9IvlFhmq8o/4BPUZuDp8WbzM7ETHu5YUJu+cO4dGy2qc5xqR+FZeof?=
 =?us-ascii?Q?8PAubRTCf/4IoefSYfPPKu6DbP0fLPt8yay8jLjsUNm2dH6JEWjrnOfv8miA?=
 =?us-ascii?Q?/0J7hBFPuFC+MUw6kzhWdDQnOnkdPc9vcCBMvRvq9d+zVcfQVTEWb1EBWo2u?=
 =?us-ascii?Q?8IwTUjv8Wdmg7fDC4pbtTM1vqnl2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?po68FNde82X0pIuVm+o3V/5IGqSs89in02232X+Ccgl7ZzYO9jos36jSMSnZ?=
 =?us-ascii?Q?m/KT+RBSbagZuCFKSI5GWZK5daWPtm50Ben5pTZWhZkG8p6n/7OCDeNNsRyT?=
 =?us-ascii?Q?pjF4E4c/jEWkgZRgBZyty40nRIY1DK59E3oA5ogcoriWG5SfkE4tjs6MYOLq?=
 =?us-ascii?Q?xY0e+Vn7s+LdtEGWGqPHt4vF1qYu1VCFnrAGhvBCtKJin+NyUHDSBknHFn1q?=
 =?us-ascii?Q?WlknsDFZ9AIAooaPXbtGNEdQ6EFb1iysyyXGQGSPSYDb7y90Df5OkagIXB27?=
 =?us-ascii?Q?IT5uaZznPIO0SlWQR4BtyfPclyF1TdttDiqGMZrKM8dn29RoNMl4dfvgROvI?=
 =?us-ascii?Q?9kZUWcZ50gGV7jTBLTNVcpVIeKO89yzJjb5fSAUR5nlYqnDr8laK6A6GGDCx?=
 =?us-ascii?Q?Vi8BUs+6vDVB2l60JoQQg2iFj1DwVlMGOj4qOzTvUkhbP5tViUQ+ZppnqLH3?=
 =?us-ascii?Q?rRrYjWlwNXt6uKa5R6FOKJEwYB5Symcieg/Ol9Z3QaePOXYUJGxddMgEr/pu?=
 =?us-ascii?Q?RS7NHjV8fEVNcUGsk9eE1JSRXE9FQE6/fUfbZCBm5PQe6M9bGbzRnw9GNdcO?=
 =?us-ascii?Q?BAZXvnrmQnDp21Mpp4s5Bqf9DrmWWCT1M1lGpUbCGwgM7LvoxJvNs3b9TawE?=
 =?us-ascii?Q?K+8KEs3tlxOCatdzGcsp9LlsaR1szXpJU66L1kVcuL7vuJb0ZFG9b5fuuHx2?=
 =?us-ascii?Q?xHox+cHoWvRkCmcwIkVbJkFAhulKe7Sp25XnCZaH/DBfhRAx9EBrg8ACOBXY?=
 =?us-ascii?Q?HOVQKz1yrUxaGHrRuGMLUYa9a83vBp7MKEbCOGZCM+C41vj3LRSmMQ1IhG96?=
 =?us-ascii?Q?PeGRFlu43urDMfCQiiTMFReZAZPpAVPi9QD6s3Q8PwRt2gprMyy1+7rzGfKB?=
 =?us-ascii?Q?cU1N3lRBg/Ca4tH3iboDPsB2KuDwx5qYp3QGY8pXVosEcQnCHnq8DsvHUbA9?=
 =?us-ascii?Q?Wh3I52GU6c3dcIPO6BTKL8Y9wjJwUkVDH0PNERnJwm0J9X72s6eTV6n+sy4F?=
 =?us-ascii?Q?wzy1NHcM4QXduLFyJiJJlYEJj8pn8BL9y7RtilJoe+LU/bWvDNhf21GdKse5?=
 =?us-ascii?Q?3UCl8zvuz/xeVIentgHakk2/AeEfXosPlDtNDaENid5adAeGBN3SZv4aY+Bb?=
 =?us-ascii?Q?SyMShxqr+BxrC0DfRjEn3Eu/Ry1nR8dJF62mZL7C/52TTxWhi/CMMgxwhRHm?=
 =?us-ascii?Q?IGEaOeMWFQhf2h0CMpxuM02Lnzs6Qb6z2gF5Unn4jV3tJ0xc8YFXVs3srQPg?=
 =?us-ascii?Q?1gVdXW+fBcPdQF2EEwQCF88V0ps2VE/MQmP6dDcG+Y6vTKBvMfNRGaPDRWzY?=
 =?us-ascii?Q?Jx60RpMIP3ZHwKwycVRlPxTurlFtvtK97J9z9jrR+wCAu32AJdGJd6dXc0x2?=
 =?us-ascii?Q?w862MOqjBvYOHPnLSqJ2Ubgug2dw9q5eqNdaYcaz5OquDAN/aVI28yw2inv6?=
 =?us-ascii?Q?AwUrDmc5tm61lzKQZxa7+RlYmA/GAIDZBD+zJ2s966aaudGKLTQlKS9RHbFD?=
 =?us-ascii?Q?YEW4wy+2VqGm9NFHxvkimxAG32J6bewAgKeUdt6O/O9/j1Rv3459+3kF3Mw9?=
 =?us-ascii?Q?uRE7yCWyt3VMnA8RZT+js22WHolTQk1SiotNR0sf?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	t3KK1JwduO55OqJ8OMXqgZTkUm2ZJHHkjzbJX+MBg0XIw05L1RyEEJfABKgXDjBa57Ufiu9YKUDCI/8a5TWDn/rSnXMTr6mvvjcTwyruH5ZK6ZV9QR96/G+x3WtAzx8x95yKke3U/ROXeZL+XpjopQF9KzNcFnCYr9Qsjg/4iQ0ix0NqM0MXgygZ2kEGhwQSrseEMj8PXQL9rR66WFnrFut0WNaYhLmWI930F27nhCA54vwaO7kDn7ThDjGhJKVGgwDGirqLp61blprMqD7VqT9zB72XBHOt/Km6mmld8FYMji08S94Az5q1xeG7z7+r03GqZjo8JcPla8F+LP6aHunOgl1hxSle+DDOotDpZkTahGBk9v3YQmQ7sMzJnj9BgHfYmS01owLsXWLDM/7BExPoRsqfX5JzgdUD0zj6JtLKghrS9AwEFwLP3OzJ5m/aMmRouO+AuzFc3LAjz4Dt7RH5GG5lDCBvkDkKe9vHO3OgtVcJez2S47pI/sZdUF10DP/DBZEbXq/hMOA2bv8gTgQgtjemiGCATXcetqfEQ3yMT79mNu8GSeg2UuVDRXSCtwzP7GU9bOxEO5YgTEmJpXELymUYmqXh6yM/ZCHQ7iw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e5ba1c7-54ee-4589-f3c1-08dd72fbcbbe
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 22:06:34.0022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ketygVSumIy0iY0mTg8jBsUWQDSm2FxzMXq60qOkAlXslv2Uj+ilutclpp/ZYBVpuX0Cvb22vIPqOS4Ks7T2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6721
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_10,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 mlxlogscore=925 mlxscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504030115
X-Proofpoint-GUID: unNAg4kVizOyIBOUV4Y-lraDpx8vUG0Z
X-Proofpoint-ORIG-GUID: unNAg4kVizOyIBOUV4Y-lraDpx8vUG0Z

On Thu, Apr 03, 2025 at 03:02:25PM +0200, David Hildenbrand wrote:
> On 02.04.25 19:03, Oscar Salvador wrote:
> > On Wed, Apr 02, 2025 at 06:06:51PM +0200, Vlastimil Babka wrote:
> > > What if we had two chains:
> > > 
> > > register_node_notifier()
> > > register_node_normal_notifier()
> > > 
> > > I think they could have shared the state #defines and struct node_notify
> > > would have just one nid and be always >= 0.
> > > 
> > > Or would it add too much extra boilerplate and only slab cares?
> > 
> > We could indeed go on that direction to try to decouple
> > status_change_nid from status_change_nid_normal.
> > 
> > Although as you said, slub is the only user of status_change_nid_normal
> > for the time beign, so I am not sure of adding a second chain for only
> > one user.
> > 
> > Might look cleaner though, and the advantatge is that slub would not get
> > notified for nodes adquiring only ZONE_MOVABLE.
> > 
> > Let us see what David thinks about it.
> 
> I'd hope we'd be able to get rid of the _normal stuff completely, it's seems
> way to specialized.

Hmm, perhaps we can remove it with as part of this patch series?

status_change_nid_normal has been used to indicate both 'There is a
status change' AND 'The node id when the NUMA node has normal memory'.

But since NUMA node notifier triggers only when there is a state change,
it can simply pass nid, like patch 2 does. SLUB can then check whether the
node has normal memory.

Or am I missing something?

> We added that in
> 
> commit b9d5ab2562eceeada5e4837a621b6260574dd11d
> Author: Lai Jiangshan <laijs@cn.fujitsu.com>
> Date:   Tue Dec 11 16:01:05 2012 -0800
> 
>     slub, hotplug: ignore unrelated node's hot-adding and hot-removing
>     SLUB only focuses on the nodes which have normal memory and it ignores the
>     other node's hot-adding and hot-removing.
>     Aka: if some memory of a node which has no onlined memory is online, but
>     this new memory onlined is not normal memory (for example, highmem), we
>     should not allocate kmem_cache_node for SLUB.
>     And if the last normal memory is offlined, but the node still has memory,
>     we should remove kmem_cache_node for that node.  (The current code delays
>     it when all of the memory is offlined)
>     So we only do something when marg->status_change_nid_normal > 0.
>     marg->status_change_nid is not suitable here.
>     The same problem doesn't exist in SLAB, because SLAB allocates kmem_list3
>     for every node even the node don't have normal memory, SLAB tolerates
>     kmem_list3 on alien nodes.  SLUB only focuses on the nodes which have
>     normal memory, it don't tolerate alien kmem_cache_node.  The patch makes
>     SLUB become self-compatible and avoids WARNs and BUGs in rare conditions.
> 
> 
> How "bad" would it be if we do the slab_mem_going_online_callback() etc even
> for completely-movable nodes? I assume one kmem_cache_alloc() per slab_caches.
>
> slab_mem_going_offline_callback() only does shrinking, #dontcare
> 
> Looking at slab_mem_offline_callback(), we never even free the caches either
> way when offlining. So the implication would be that we would have movable-only nodes
> set in slab_nodes.
> 
> 
> We don't expect many such nodes, so ... do we care?
> 
> -- 
> Cheers,
> 
> David / dhildenb
> 
> 

-- 
Cheers,
Harry (formerly known as Hyeonggon)
