Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C270BBA49
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 21:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744665746; cv=fail; b=MoAPyc9qGX1sbE8a0ocgT7lI25/rN1x5TYVQKtD7cYr9i+I1uOoN4CH+P18QjrHFkQ7JJ9YxGthbl+I4uRyH1uWtkUerBn/yNy1PdYYGC6ycMgp/9xJc0SS5NYx5NJ0kvrOxqDMtBIi6PLyuxYRO3/87mjW4mjm0QFw/qy8zBHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744665746; c=relaxed/simple;
	bh=cWZt6H0kRXv9bnZ/I0RfYmXgODnq3xqWZv65RMwF/cI=;
	h=References:From:To:Cc:Subject:In-reply-to:Date:Message-ID:
	 Content-Type:MIME-Version; b=KPGaGP9MIVHgQd+Qjzbu1fUvWKPy39y+Yzv4qFOcv6181ybzH6kDmkX/01rN0WSJYWe5F+2W3Rcs63l2DR8B37EvF9KPGnqCdkqqSrm/v8/Uga0YUM3yvS7b2/Q3H6YC+ezI9WmiOA2VCRJ3tZmmxg3W9gzpPnSSAiJmXeexHr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WGAEw4GF; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JdLzg/MP; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WGAEw4GF";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JdLzg/MP"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53ELCFwF000734;
	Mon, 14 Apr 2025 21:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=w9UBRpFDB1tDER+Vem
	5Nwel2oA1AqmgxjAzh2XmZr4Y=; b=WGAEw4GF3xeluriLg/7g4A0tTQOYPA/Zls
	CwktI/m2n3JVtCt4ELyS7gCaWS/6nsMrSyKgBE/4EX5tPRVpJ6Mop4wC7baRNBEs
	GjSRO+DY4sRPqPv9rIAlchYXruFKrv1EPk9QUn/57kig3x2t6+efrg6eu2gZB+Ed
	SBzvNF9wPcoOXu0uE9UyRmdbzI9/8wQ0cJTOoeQdTqUTYyeGl9jYvwZsYjzLat7i
	QPbuGbhMG08OVoR6TqKpSF6QQxkJdWeQYIXfr67OLBP9qMk4D1JAROKV5xvbpLpE
	VXQ6dAgeW/SE1RDnq7wG/Z842cpdTvllJYAAtGNPfSo4i0hETpug==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4617ju8bnj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 21:21:55 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53EJlDMg009219;
	Mon, 14 Apr 2025 21:21:54 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazlp17011026.outbound.protection.outlook.com [40.93.14.26])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d3h2mjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 21:21:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lbDlbvcex/Tj5UPwhEwz4KCOQM7RvDn3QizvU1LeaNUprvCH+s7UevE/fSaJej8xdNGKX1HxNrEKp7TuQb+jk/NePkPSKL78rzhAZn6cLiKTegx2V0w1NCwfo3ralkeku4lmxEGB4fJhC5+eevXoLwhvi0aqiUQkwUo5qmli5j5yJdBklcamuZUw88/TV52GiC7p9vh8I3Lih3vuFi/S0Z2xP9bLa+LpNdR/NQ8vDDlQdb8RyFguBTWF35DqukqvPiY4vOp4fNHl7pkl5658i3lkcI0Qv7x5t5crdxKUOpC/4SgIbk5ypdskYVOcN0Nlg4nFV68poVZiy+gm6qHL7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9UBRpFDB1tDER+Vem5Nwel2oA1AqmgxjAzh2XmZr4Y=;
 b=I03zI5lhxA5lGdaets+goKnHmP1cm8SOF9SZ8GkSXh3aG919GtqCVQdhzeQO84w+/UJq2qDaT1q4V20G202cjr0aDfEYROvo8M7rHFirm9elQdlvOdiSKAP0CWUa10GO3Dqw6IUfRE7oNtDCniHT75hFb5469ufIPZWZ+fPycOAnLzVDpVvqW255LG4EHbXUpNyFrWSEFMirgd0HO5v79HNU7qTNdolRWFMcQqKAQsacXirwcsm01tNsgb8pjz9XL+LvdCH/aY5Ok9Q8Em+fu70+8arlpKXe+o+i0eumI/JyBCWazN4ujfxDlYvJGm1NOAUJlZW7HarW9SDKHKoNZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9UBRpFDB1tDER+Vem5Nwel2oA1AqmgxjAzh2XmZr4Y=;
 b=JdLzg/MPpIZL1xam5SyeklOyXOl0NzSFTSG5zR6D9yb8xGipSdpfS3oqyMkaZYWQNs0r20bu6igcg08vRhHd5S2oG9D4uerKEYBmF5ha+837d7kH0nhFWuZHlO9JMF6KLqq62YIjSXEyw7ZGt+QcKcHC2IyLAlX7xroaVC+ODws=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by SN7PR10MB6476.namprd10.prod.outlook.com (2603:10b6:806:2a3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 21:21:47 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 21:21:47 +0000
References: <20250414034607.762653-1-ankur.a.arora@oracle.com>
 <20250414034607.762653-5-ankur.a.arora@oracle.com>
 <Z_ywzkEEqUOMHcO0@gmail.com>
User-agent: mu4e 1.4.10; emacs 27.2
From: Ankur Arora <ankur.a.arora@oracle.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, x86@kernel.org, torvalds@linux-foundation.org,
        akpm@linux-foundation.org, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com, mingo@redhat.com, luto@kernel.org, peterz@infradead.org,
        paulmck@kernel.org, rostedt@goodmis.org, tglx@linutronix.de,
        willy@infradead.org, jon.grimm@amd.com, bharata@amd.com,
        raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com
Subject: Re: [PATCH v3 4/4] x86/folio_zero_user: multi-page clearing
In-reply-to: <Z_ywzkEEqUOMHcO0@gmail.com>
Date: Mon, 14 Apr 2025 14:21:45 -0700
Message-ID: <874iyq1lsm.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MW4P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::24) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|SN7PR10MB6476:EE_
X-MS-Office365-Filtering-Correlation-Id: afc85d10-3093-4b9f-005f-08dd7b9a5cd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l7j6j0eSXy9ya+dpl5X4jJrlFmUYlAOOq/Uxt6JiuGAmN81rTh5wZK/i51qa?=
 =?us-ascii?Q?RoTDpuuRrkc/JFS9ljoUsVYxXSR/cg15a1JWQjscCPZgelMPccdFPpaMdh1S?=
 =?us-ascii?Q?zHwGpPH4EWZNxtLVnhbqlsi/WjXZg1iPTynPGFr6wurqJ/OXgk+8ayFYZPLT?=
 =?us-ascii?Q?RT9iBWcQgPyKYi7JVMxdWcuxnLUCJf+cBkX46ZsQQcJzF02BqIncBWM9Zddh?=
 =?us-ascii?Q?g7btMLldjYPf8sjg2oO8utOiTVmy7D3so2SQwKLOoafH0OWAbXKGx6ds9qWa?=
 =?us-ascii?Q?d5bft0Cvb+5zsofNLzsFyFBakYloiF6897mhkxByijPcUeOsQEZIhLePT2sL?=
 =?us-ascii?Q?2xOFFJYKfQ9NMZNCefr2JfBaTSJGGW7k0yUnDzQgTSnbLeXQLjF8V4rfl7Im?=
 =?us-ascii?Q?3W0JZCl1B1WbCnlpjr5K3Y3MlbTFWNASd3hY8z+AZBjckpVHJ8tm9TTiZVt9?=
 =?us-ascii?Q?rCBqt7tVCtgyMbCGpbpyp+4UQsoyP3lMSShN17KTGV05p3twFMAUC9eYjnCH?=
 =?us-ascii?Q?5BjUWbftfKhlNISaBg3ysHTt42ajQcclRddkaGhXEAGg/tWXpIYyisf72Cwp?=
 =?us-ascii?Q?tYF9W5bQpmBoy9BZAxNGlRfDINSfnRoSvwfhP8rYdkRlbOyxaKzZ7AIg6Hq2?=
 =?us-ascii?Q?DWnMsecL2Q0hd9NllZRpXvIpBEK82rKZgBEGUyMZb85o7M29bPQsMTppKT8+?=
 =?us-ascii?Q?4g9omjsJ+6IntrhvWlDaA4sPqxSke84HNaXi+spKNqmXGZFuE4sB/Eyymm4g?=
 =?us-ascii?Q?6TT+BzSXYo93jyWItmKtuM/j1fLMJAKMRJaumGPXXhlmtkcLLqYc/PEaSzHU?=
 =?us-ascii?Q?CLZT/o63PZq57+O9wxBdlLkGrFTI47dDE4b0qT+/AjPZQ4tTVRoUtjX+5Lhh?=
 =?us-ascii?Q?tGpg0CUqE8vBsyWioUwHGLk7s8wqwU/skyxevegzu7gvRxnmVYf8NRqRuX/T?=
 =?us-ascii?Q?cRNQKd8MAK3Rhm7jM15FCeg/HhOTkg0ZKP55okypBJnxq83YtPKp2fFuHhpQ?=
 =?us-ascii?Q?Nx39GrjEveL6LuJOuYGjCQGA/qfCQgauKcoAPX0yCfUEMPw5BkeFO8dT+Kxn?=
 =?us-ascii?Q?IiDM02Hxr9ZYuHzVaRqS6ociepDBt+QAhHA9gkqQK7k2VjJcEuQkIYRTrK3F?=
 =?us-ascii?Q?NHLhDa0SKiXCvkoNNGWJQ6jOHTa7qPYHpuKfSPskrOTwwCLSIWb7ix26OyGe?=
 =?us-ascii?Q?QHPa0mjuu8BRzfk9mwABSM4ET2l1QgOip5jeI7KztBtwO7MgIpM5zUefolOK?=
 =?us-ascii?Q?TRosrcrH6I+7kny2Y3ySUM1BPpNktj/jCB2REWGju+l+fPmFd10NsVRJ+zJZ?=
 =?us-ascii?Q?/5dIYV5snv55RyNXlvbGjx1KMwY+Y4SqXD1l4TgJ2D/YNTCV/mP9MDnGtXfT?=
 =?us-ascii?Q?Gd45zFR4PaeRu3h/dC27E3BDPy+2LGUlt4o0LbyeehKwwtPdlNMB6BEvpUlw?=
 =?us-ascii?Q?C5Uc2Kum6DA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NTjIjIv/1jJfZ6mwED6GvqDvPfwUIw0iLFWn3PmUXDkuLf0RDwmmGKP501ld?=
 =?us-ascii?Q?+0vdWg4iLRe79fOCxNa5E3MlImmuH4uPKGRp8kBUBvdhEudXOr+Z7Oipz9pk?=
 =?us-ascii?Q?mDRR/Uzd7BNuDfTfaGnQLL9VdmafLyW9JfLsn/h4zlVh2UYY3fu1TfMDh0Qd?=
 =?us-ascii?Q?meus7PwZ3wcw3+IVAxybuvn/6gAaTPQwnH+7ekWSvQcR0UZCTbbherWjwlrZ?=
 =?us-ascii?Q?O0gl7RQ7cgF6e77fN003FzZqWUW5KLTsZrKKaimQeMe+OR7AOjZy5/V6uEmb?=
 =?us-ascii?Q?tQUK+c44gYVfWLUrdRKc8/bN91XRAOu7jcEQjuctsWIUJPAINOKlBBy2gQIC?=
 =?us-ascii?Q?V/POoQhavj78chFEXcJuJ8piGHcL7d6HCiCXcZqw6UqOaMMo0zOacIaxTn01?=
 =?us-ascii?Q?UC0e1L8lobK6oLPGOytFcRmqC+mizEo8j+kA28FHNazVwY6hLXjvXA2feIiI?=
 =?us-ascii?Q?MJ6+XN+KSEXHMAGHNzKsJXDdP65nb8qja4CB255Lu9Oi1iYQPd1N8tBOfYB0?=
 =?us-ascii?Q?A365bjS0KOCqbcr48iFr8SkQoOCB2jSzZFCcSOISDGo31ql9Jzu2+h91gwBA?=
 =?us-ascii?Q?9qytco299JopzFlVcYe7Z6PW6VPuVsNGKa2J522jsyELR5mnkaz+DYYJS1J+?=
 =?us-ascii?Q?3ncPDJQigm4GkHqQuW+WE+QZV6uyDelsNmpgwg7Yk+JMPeB+homBSorv96Ri?=
 =?us-ascii?Q?YATA5KgSmRifHwX9UBpRlltYF6PKy2eO1PYpzI1zChzMVAgn8Gk6OZFQ7RLo?=
 =?us-ascii?Q?sgrkzb0Km0ETXIFqsktfn8UGMKUIim1fUYpfq3UwqPaRIbNTTWB8m/Umto77?=
 =?us-ascii?Q?lwEJ3ib0OWqK74n9Zd2kXb3hyf16aDMwwHAt0o1/FGDBeBWxpTZdMRXZnaTw?=
 =?us-ascii?Q?uO3sCiDzQcDg0uJDtPIPOyr8Wjy5CSPF+hyWUfR60p1dKdj98zZdOPlmauY6?=
 =?us-ascii?Q?c02bpUBlcDhmz+aps54L74cJtfrQsIiPj1Y90/U/5OGuoTkXHYCk8sLeRaX+?=
 =?us-ascii?Q?bX9eYLLaOAqmXfbqix1ThduoQS+61vslD/oJijsKyNEdOggFRb5q8RsdGGoE?=
 =?us-ascii?Q?P1IlJvhdpQLQnZHRiv8pnPzK4tn+5OhOxfFBUwaXh8MA4T5wVOAppdKznM5r?=
 =?us-ascii?Q?dwgTerWh4dBC9TwfnReONin8x59KEjEi8nYDBi0AfOCKS5Of9bh5ul4ETj5W?=
 =?us-ascii?Q?q6r+VNMGXxbD8F0XLTrWIAD2sIOFFmShc0Gu0g0HIcRD2GDrpdJsXyi4BkfY?=
 =?us-ascii?Q?dpxFopCr2A7Nn/l/VYLs1xeuYfi7vs8/VtH/liDKIxIHkfDf7kFK8uoN9M+0?=
 =?us-ascii?Q?ZMG1iSN/BMvzxpbaOSyIhYboVnYjyBXY3cqKOZyNe4zbcZY33VusuUYzllcr?=
 =?us-ascii?Q?wXTUuqu1fkRY3j6YhRWGkuS9iMEAxKf8PjJjM+aPGmtscvLFETcGaJn79r7X?=
 =?us-ascii?Q?iynNONdgv5lWCn1wCKLWiD3tQUfjaA3LfnCn4I4p9hnY2xuB+hcFY7pMWYlN?=
 =?us-ascii?Q?7UnneARUgTMudm0jneAM61yKC8NtieACAOwYXDW5w+9vuCrlH8aGhWbBaoGy?=
 =?us-ascii?Q?pIPJeZsGxMsQstBfp2QUw6j+BSr6Za47TJd/oql8z+gmshBZx55C5P7YdvCA?=
 =?us-ascii?Q?PA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hAqCPBgg71cfu09BCj7pOc3tZwgzwEGymFvul3Xbty47s0j/WXW1hfjub50ho0w53IqTSZnMFzNnj+e0tBalgr7GZ+tzyuXS0M8Eg5zTUuGmdpnMiA/RnXfiuNEuoFuD2I+DHRTLCFBwKKvmsfWvOmTW+eCWtYTcGK6Lwi+amb1lXM0bvrcEaKzjRoWuOW6I/hezqdjW55KGwZ+tCKBLzt4HSmJ8P0qgEUySjJB7xip5GIIJg1dWueXChIiunqn4paJGcoP8TtG4yo5MTHrNqY0Wyq3ZOWnPtUoagu99j8X4nXL4dJHtESj3h83CqJA2nTq5OAZm9zhFyRIzpXjCOegh73yr3xNjIwKOb5alxHdkC9YIfedPFkeXPy2JLb3RzOKySehkmVAmU0AaWyXjIBS0n7COXfQFVYcJLvkHWOSrCvIjV500vjY5CnFM+zi4yN/KIwJtsP6+1aHLIzdxnFZaBgBqHDUP8H0Wz92XcfpB5Z0Occxgq74EvEWZNXV2ucUnod5aEKdLQ1dhmUtOn+XGNgkhyfOCPD+Hk7Q+jt0B5O9aFr7H1xVLj5GyoD2FW3GS2j4tnfWKYChZsfvtZJPj2NdlhzHk5jdRzLWwIis=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afc85d10-3093-4b9f-005f-08dd7b9a5cd9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 21:21:47.2150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ddRCuqlXC32/s121WeWYyN5h2qbRB4ypo3Zb3D7PhRzblFxr5pBqubXyxTYI6tkZeictcZrplEmcGqW0Ipr6HPjyjiOPEZViP5TcA1QbHD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6476
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504140155
X-Proofpoint-GUID: k7WjykLYJTvfKKSR38E0gFm-xi1Qx20H
X-Proofpoint-ORIG-GUID: k7WjykLYJTvfKKSR38E0gFm-xi1Qx20H


Ingo Molnar <mingo@kernel.org> writes:

> * Ankur Arora <ankur.a.arora@oracle.com> wrote:
>
>> clear_pages_rep(), clear_pages_erms() use string instructions to zero
>> memory. When operating on more than a single page, we can use these
>> more effectively by explicitly advertising the region-size to the
>> processor, which can use that as a hint to optimize the clearing
>> (ex. by eliding cacheline allocation.)
>
>> +#ifndef CONFIG_HIGHMEM
>> +/*
>> + * folio_zero_user_preemptible(): multi-page clearing variant of folio_zero_user().
>> + *
>> + * Taking inspiration from the common code variant, we split the zeroing in
>> + * three parts: left of the fault, right of the fault, and up to 5 pages
>> + * in the immediate neighbourhood of the target page.
>> + *
>> + * Cleared in that order to keep cache lines of the target region hot.
>> + *
>> + * For gigantic pages, there is no expectation of cache locality so just do a
>> + * straight zero.
>> + */
>> +void folio_zero_user_preemptible(struct folio *folio, unsigned long addr_hint)
>> +{
>> +	unsigned long base_addr = ALIGN_DOWN(addr_hint, folio_size(folio));
>> +	const long fault_idx = (addr_hint - base_addr) / PAGE_SIZE;
>> +	const struct range pg = DEFINE_RANGE(0, folio_nr_pages(folio) - 1);
>> +	int width = 2; /* pages cleared last on either side */
>> +	struct range r[3];
>> +	int i;
>> +
>> +	if (folio_nr_pages(folio) > MAX_ORDER_NR_PAGES) {
>> +		clear_pages(page_address(folio_page(folio, 0)), folio_nr_pages(folio));
>
>> +			clear_pages(page_address(folio_page(folio, r[i].start)), len);
>
> So the _user postfix naming is super confusing here and elsewhere in
> this series.

The problem is that the _user naming comes from the MM interface name and
is meant to address architectures where you might need to do more than
just zero the kernel address range for the page.

> clear_page(), and by extension the clear_pages() interface you extended
> it to, fundamentally only works on kernel addresses:

Agreed.

> /*
>  * Zero a page.
>  * %rdi - page
>  */
> SYM_TYPED_FUNC_START(clear_page_rep)
>         movl $4096/8,%ecx
>         xorl %eax,%eax
>         rep stosq
>         RET
>
> Note the absolute lack of fault & exception handling.

Yeah. And, as you are implying that is safe because the folio_zero_user()
(and this path) is only called after this range has been validated.

> But folio_zero_user*() uses the kernel-space variants of page clearing
> AFAICT (contrary to the naming):
>
> void folio_zero_user(struct folio *folio, unsigned long addr_hint)
> {
>         unsigned int nr_pages = folio_nr_pages(folio);
>
>         if (unlikely(nr_pages > MAX_ORDER_NR_PAGES))
>                 clear_gigantic_page(folio, addr_hint, nr_pages);
>         else
>                 process_huge_page(addr_hint, nr_pages, clear_subpage, folio);
> }
>
>
> static void clear_gigantic_page(struct folio *folio, unsigned long addr_hint, >                                 unsigned int nr_pages)
> {
>         unsigned long addr = ALIGN_DOWN(addr_hint, folio_size(folio));
>         int i;
>
>         might_sleep();
>         for (i = 0; i < nr_pages; i++) {
>                 cond_resched();
>                 clear_user_highpage(folio_page(folio, i), addr + i * PAGE_SIZE);
>         }
> }
>
> Which on x86 is simply mapped into a kernel-memory interface:
>
> static inline void clear_user_page(void *page, unsigned long vaddr,
>                                    struct page *pg)
> {
>         clear_page(page);
> }
>
> So at minimum this is a misnomer and a confusing mixture of user/kernel
> interface names on an epic scale that TBH should be cleaned up first
> before extended...

I think a comment to avoid this confusion is definitely warranted. About
the mixture of names, I'm not sure how to avoid that. For instance see
arch/arc/mm/cache.c::clear_user_page()::

void clear_user_page(void *to, unsigned long u_vaddr, struct page *page)
{
        struct folio *folio = page_folio(page);
        clear_page(to);
        clear_bit(PG_dc_clean, &folio->flags);
}

arch/arm also does a bunch of stuff which made my head hurt but the arc
version is clearly different enough.

>> +out:
>> +	/* Explicitly invoke cond_resched() to handle any live patching necessary. */
>> +	cond_resched();
>
> What again?

Yeah, I can see how this looks out of place :). The idea was that even
though we don't need explicit invocations of cond_resched() (because
this path is only called when preemptible), we still need some because
cond_resched() is overloaded to help with live patching.

Anyway, this comment can go away based on your suggestion elsewhere
(extensions for cooperative preemption models.)

Thanks for the detailed review.

--
ankur
