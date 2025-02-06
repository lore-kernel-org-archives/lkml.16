Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D362E64A
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 13:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738847131; cv=fail; b=tvuSTpd0Msup78PkpmVk+8VgYjK+lShiK7cDH8a7r74SuNeCWjZvXaqKVKbqiFhZh24yAr3KVP4dAR3Hjq57gXh0PadowcidCVcW8KcRd6dQ/kxInX0BHADcmGnKuIGAXo12kp3P1hUMfUl2XESw1b5EWLQAjku3ca4pkXW60zg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738847131; c=relaxed/simple;
	bh=3qYz5kKxDkvKodiE1d1kJ+Lw1WLmtEAWzHLLl6DxLZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bWxZu3ThHmufh5ufKuJ96DbspeW5VgmSgzEe7ptIUZetMbPS6KCBM8L1Q7VUGi9+sm65bZpR3+stPTNQof/MMenVQVRlrGe4OJfCQv1qyWy11R1tlKC+lEcCM5HTKBNKJsDicwULai0OFtbFBC9yTp1kBQyVn2pRg5Y8LhFVCDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bgoslgYx; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=aDZU5YFj; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bgoslgYx";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aDZU5YFj"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5166AuBZ031571;
	Thu, 6 Feb 2025 13:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=WGrXGmE+aSCICXVa20
	y2nKdTYucTAUCurr0Vx/VXUKg=; b=bgoslgYxv4g2/tBSWYKaEQ00aJ7/rOmeDg
	7a7FOXRdy3pstYk0bvaN4RyRfgbKlSidfr5GxmDbrJXpHMz0yw6GwxXCBNAJW1ct
	zGTq6GCtDhe838f96m+RVhCPwNf8/XDKwQ25xzgaDCfavNyaJhZ5iT8AuCh4A1Kd
	OXApnGi6bPPOR1xYevF97hB6pUL6rnKS6/b6s3HyEmPGDFmgW7TdZEtKvlXI/gLR
	SIIe6mlH2OOfox8lo1/x3bVGj4a5m2UIDqPNuUEgvSYd97ZwNoYEyIl5B4+jHxrP
	LjeHISo1TiSIDeIcuMDSojv+bhqmE/ctgyIOf3KgX9wEbslEaT9g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44mqk88j8u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Feb 2025 13:05:03 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 516CaOdh023504;
	Thu, 6 Feb 2025 13:05:03 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44j8gkpwx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Feb 2025 13:05:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hZVHjLZi5BYY3oMadgzKIfQ7eo5W+IyyjnRPWC+FzFWNShnUp1rz/nJ7hqNTwlKFYRTvzecJewMfGpramxkUYXsblH5kW5h3hVNOX/ezZp/gcVZgqIpXzeRI7N8MzfxVdyAPtKnteeCgtjEuJlbSEtPaDA54/qbZ/TEA0/YYJSkkOgIUPaO1ZDNu0Su1Qy5bUx43qFiB2K6ouY804vDc3BFhKS2D7GJ00zBBaIhP3McJjbasV7fLJpqjXQoz1BciIFvTxB2jWkSvUPjicbN11o0PtthHPGVJGIZrv+WisGWlY7KyRzKF5PpPs4nYM9aom28ROnFQCkGAHPzDpewPWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WGrXGmE+aSCICXVa20y2nKdTYucTAUCurr0Vx/VXUKg=;
 b=if0APWJU+G0oe0SufwaM8KzihoE6tJUgGyI0fCB7gNgu5bgV9FZPwKpoblBU4Jvz/TS6JKXwqmJKPDCK5lvZPCvdeOH67fbPsTlrgJdhuDCqh2B330erSiVGyAzIwK6P7ScPN+Ooke+dYIOI2qYDjySq2/ufv/5+9VOzyPQCX5b+N5YeJAg7AHHfueNELo88gpxF0ELgOfDnC/H2Onka4urH7wE0VSK9RG1QDtzrgzTW10+9hEcPevRUzJkWFM8bEuehTvV5BajoBBsMOZwSf2xbH0PIQq9mTsafn1D45m4Xpp2W8nl2znvTwd0F4zZt+H+Lex9DcLjHu3jNQTnQ+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGrXGmE+aSCICXVa20y2nKdTYucTAUCurr0Vx/VXUKg=;
 b=aDZU5YFjqX6cmEFxg4v8YSlv0jsVzqDSb/2Bc3ooXBNFmIGrqkoYvEZ4hdtDX43+Cqcac8lvYaBiU+mTuA39j8jWt0RJxcCG+/XsLV2Y9W6yMDH1SqYEBke0/1PNGQoD4Qe/NbOVtHz7nntXk/Ic0ACOY7dBs0SaiMhbb/tWnBc=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by DM4PR10MB5917.namprd10.prod.outlook.com (2603:10b6:8:b1::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.12; Thu, 6 Feb 2025 13:04:59 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8398.025; Thu, 6 Feb 2025
 13:04:59 +0000
Date: Thu, 6 Feb 2025 13:04:53 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        David Hildenbrand <david@redhat.com>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH 4/4] mm/madvise: remove redundant mmap_lock operations
 from process_madvise()
Message-ID: <048896fe-69cf-479c-a89c-0242da88f84e@lucifer.local>
References: <20250206061517.2958-1-sj@kernel.org>
 <20250206061517.2958-5-sj@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206061517.2958-5-sj@kernel.org>
X-ClientProxiedBy: LO2P265CA0270.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::18) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|DM4PR10MB5917:EE_
X-MS-Office365-Filtering-Correlation-Id: bb844f9f-31ae-4675-6fba-08dd46aedc6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xkScVnZdc6rg3evMlj1fRHm5KsWSLWsrkZDw6s2vUXIH8IducQrYejRoPoSP?=
 =?us-ascii?Q?zT/0xHozwPdWxkYaAEe154XmVyXCWNBTD9PmwlfIE6iV/ajN+qcyxOX6lFhy?=
 =?us-ascii?Q?iK+jgU/AVdzXHb2od9O+YfYpCa0eCehnHrn30jhZQmtKL9esjZkjRinQCFCA?=
 =?us-ascii?Q?UFK5epZ1K1525Euq66ErRead0OA8M1qGVV3Z3wcPCaSrcnXjvwyowg4vl6E6?=
 =?us-ascii?Q?BiQNHex+CkUG6kzJEdCUxkLsiXHsQfVko4kFK0HctsHbvdsAnXQwYEETGG8E?=
 =?us-ascii?Q?0Xd9K2gC/oSa6383x6fgFEd4YlvWFZGhyP+Km+mkiQOakdNn7uArsY+CEkK/?=
 =?us-ascii?Q?mnWnMJSK8/Vjat/8K7YARksRu1JnnC23mumemBwYFfobGitIBciHA4K0Obdy?=
 =?us-ascii?Q?LWpdpqJwA4+Fk5QY/DxygdSUj+fK9PvjjrT4YPFVyymi9wb9ZxEMgvZ6TX6J?=
 =?us-ascii?Q?J56p3PDlVn7PlNffgQMO7G6jPWtD9OnnR9d7oBurKJQwGLdJB8BqLHGcfFlL?=
 =?us-ascii?Q?09RBzV+Q4P8FcIRAWBNjPNkI6czZNcFBWS8MjenGdGk6Phpw2Ix+O0bynk2v?=
 =?us-ascii?Q?ewmaiiPN2MtjMjTv0Lox/yoy3jXGWPHJqzBCi/PR5KImJTCETvGpKeW8z92v?=
 =?us-ascii?Q?x7FIIneq/w1gxpdqxzxBLbeRMjADL4iZKlxHbCN0wYt6sh2geD5EtR38RAL6?=
 =?us-ascii?Q?fU2v89mbpdyJ2VHyIndNwuxg2RM3x/+Xuv/35eDkmDY76AekpQe0/Al8+IOT?=
 =?us-ascii?Q?bhLnzeIUUUzuRgcpPKGDlpjENLNuaQbpuMymGuLK/kp7Nvd0Vt92px4ddjL4?=
 =?us-ascii?Q?p7RuHgmzIyphzgvV0cmi5QTUz200EWEgFSO1BEqxnfDNY+i4TREGhakG/dSO?=
 =?us-ascii?Q?LxFMOz7TMJ2GVUQtF5y/jnBWfCoGKYlMXEyIPPVowsQXSsxl2EQizyFxCB2s?=
 =?us-ascii?Q?zH02wBRQlP6p5AZoGhFLfEFlur8K4vUO0Cz6Z/aLddRZPpUQBtKWV0amdTjk?=
 =?us-ascii?Q?E64Db1Oc7Ope36YH698xtFZ4pN6PToV+9tnmpLcAcYYCmZ0Qp7AAhA+smS7R?=
 =?us-ascii?Q?9HnFHIIZ9Lk4ff3n7AzlEZQsxJaofjJgU5d0ki2sldlnW/MRhO8s6ERjs0D4?=
 =?us-ascii?Q?z7wkF2fxA0OinjRjyIf8tQfWyfZ0fsZKdpSn1mKzumLmJDKe6NgcwlochbU0?=
 =?us-ascii?Q?27ZEgJTFyCB4VhMgSWgYL2xgb82jcArnMR3Lv18ntAdFmUPcyhE7ZVwIBsET?=
 =?us-ascii?Q?4R/THtd6iri9hOaThxkHWuDunhVPrFecKOMdC0V37hZRAF2RbxjmTGqnx8bw?=
 =?us-ascii?Q?ck/j/cuS+oTN+HNUqBXPZguhmVVTlEXrY36yb2yrwtmcZhIi5xZbtCIsI8Zo?=
 =?us-ascii?Q?octZeLV5DEqSsJtweXgbJF7bK7wZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9Yf7gSuD/TQiDfWACRL7LnKjvrGwen6ITCUWSRKoGXBx9eUTOTykOcsS65Ks?=
 =?us-ascii?Q?SiqdGOcultwWsJ9Q+0VzGU8C8u9DjqP5zu9Lx+zXEw3XjFBg7Uqt4+UKCoas?=
 =?us-ascii?Q?cfhAiDRR1xZN4F15yXl325C+AD1IIy2Ar1h/FbdpScZB6gxqfDZqA+rDM5Lj?=
 =?us-ascii?Q?agxzzgP4MUKD5//qBaMhBBjSIaopfFYy6L1vwUSeisYnWQFK69GPyL/CwuLB?=
 =?us-ascii?Q?LdtVQU6V/ue40ivV2AW3TJe9m5UAxTYEFgaX48rEP9KLJ22dx6f0z7JUL4iw?=
 =?us-ascii?Q?ZGwmWdA3q9g777y4B1n87Zdl5Ub9hUcJtSojqjKLeqLvt2FpH+CzjCou/yI/?=
 =?us-ascii?Q?Y0wNM3pqGu8YCF3b2obZbNo5hywF/ij0FviEfwPgx9gBeG/7+yPJ07W9PqHU?=
 =?us-ascii?Q?4cRJ2nBXM0oeALCPCi0jg6xMDeHEk8qxcxtb5jJcTXuG8BSsGKOcj2+huYHz?=
 =?us-ascii?Q?XiIuRwd1XI7pxFOrVcDNGF+0/jwK+cttGK6jCB8DpJcM/yzsP0xo30rk+qUT?=
 =?us-ascii?Q?CR5G2orOGGHIVJq+CqyLBV6PFbCgGt1SBsPdbf9iZm3N5mJVs9B785ZhuPIk?=
 =?us-ascii?Q?W3rIDa16jqDts7c+HAzNZkHhN+xatbo36q0jvFFWmuS8ksMyqz6N30tlZx1x?=
 =?us-ascii?Q?G5VJrEK89Q4IPIdgAKTMlhXq0+PkhRqWUayPh32OzxVzDgBcQ0SdkYCVZJP1?=
 =?us-ascii?Q?XkGf9Fg2m7nLA2vx/ZlGyEKmVShcqBmyur+Jk/Qebsmo6j+wozPO8fbcB9qn?=
 =?us-ascii?Q?4qh/fAu4A8wX5Jc/BIJzfwosSt0osNPybMl/kTLq9FIsMbhPxGFBGBw4IyEI?=
 =?us-ascii?Q?Is5DUu8yzaNZogqfBveANgJZIjGW+DB1YRRgXQAXSMGctHKTJfs4Yrsedeuz?=
 =?us-ascii?Q?zz3j5iZBciMwRNvOYgFnEMmvXo4XS4Nsinrqpt2030xu1sdsj/h3aok165tC?=
 =?us-ascii?Q?Ag79UypAHjkiRo+XFfe+3AmXlmbBcDPygSNXTa3NltYNBpsegDJWw/zBjQUF?=
 =?us-ascii?Q?de8v0t6diW8hN75qlPTVGR05i+cu9x9rFPIG/vHhEs6bq9R09XRRBl9JWoPn?=
 =?us-ascii?Q?2qXWbnsGiHRhg1MlqrU9MAObXWxuUz1v3kQgG/rFBrpAMj6QxmNoI0xH+o6U?=
 =?us-ascii?Q?HpdXd1yuLbHh5PW+xB5thKcnbE+lFDDkSdFM7w/d+XsyKpIBTHgFGXcLqYCf?=
 =?us-ascii?Q?8FaeXhDPSvEDuA+BeVMTO8MkdJlQ39TD3DD1El5n27oOnGNhM6tNS4QK3eDy?=
 =?us-ascii?Q?0QE+y3d8MGdf1/gt2VDYRqxiYvSM4NXTVoXrTJ1ZgcU+Kr6VVkK/grptHgHy?=
 =?us-ascii?Q?xYvxDdTx37t6EFnSboJfsoFSDGzLTbG2eLNKs/7aoNJTGNlRG9QcHzdQYeY5?=
 =?us-ascii?Q?2WO1lwObpfiH+Tibp8KdqnwnGZW4MyVZOPF7KDNNUPrL4/mRNfh3E7EJK3x+?=
 =?us-ascii?Q?I78GNrJzfwQG1DTy97/OJycuNWACh+9vGxKR6IuTYwpNeQNb40eUg1OQ9vfN?=
 =?us-ascii?Q?Qa3pst2UfMEvx1wQtGcwFnTcgPxGBxdfQukfu34ZS0NLBcvbAYDpzzBRvHAv?=
 =?us-ascii?Q?6FKJWbyTQZNa6Oqu+9n7c+8wxPWKA5PMW6v9KGRqrOMH5YfaHMIwJ+xcATx3?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GHOiSVyuYsgAz3hKCmoE4S9Adp/68WVdKKzQOOuinfisvj89YMQ7Q6hzLgDaA+bizWf2YajYiPr8BF1TI+QIQCkgQD8aZ+H8a47/of4xu73QhTWsxmQiOpbcazwqOPwljL5jgFJ3VLCXQWOjDp1NFUx6csZfJi9xKqUmVSVnakD9NEbacO4n04stckOw1ixwoWV4DPa3KHKvnOYHrWbUi2Ox3mpuEmKuUH3c24nWI5hf5MUZCnNlMny9FY6AzGjDidbnOzJQGbdSXenxzbZ3hRPVH36q5qT2z54UL2zbuJI3fgtQ2XDxzM9JjG7zlhx0qJku3yDW2Dx8WW43MAPcQQ8pLoiww6NuzPgKmouWOxMPSC98L1y/UOm4EQVqUbF7g2T4BaCUHcTlcjIhe9gNuuSvXY0FIoL4b2M2PhMqo3cb18KQVIEt4erL6a+lJBwxyE/xV8/Assq0BX7+GmQs5fPQNRmWa+jfUbOy5TeCnq9S4KE0gPgDs+J0pSyLO7+1sY5Cmr5BWDz7smiQWFtDpCxTmorfO9CWWX5CKgj1jdn6GL1Aq8j7Ujnw4K+KAz2UpwJqHyaGycclSibOMejUHgAvrVVoUdds/BiOQHP49as=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb844f9f-31ae-4675-6fba-08dd46aedc6a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 13:04:59.4160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AiftuJNzvIeOEb/f2/mZ+MiM+e7hbnvNsI+18mJYURfmfTudg6oOKnZIbkbDF+bg0CRRCboCSfTWl+K4rJHjd3DHeDXwO7CXUFFay/yWcL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB5917
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_03,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502060107
X-Proofpoint-GUID: tV6rbyh3RVuiZXYf0hj-ctNiC5BKfAFx
X-Proofpoint-ORIG-GUID: tV6rbyh3RVuiZXYf0hj-ctNiC5BKfAFx

On Wed, Feb 05, 2025 at 10:15:17PM -0800, SeongJae Park wrote:
> Optimize redundant mmap lock operations from process_madvise() by
> directly doing the mmap locking first, and then the remaining works for
> all ranges in the loop.
>
> Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
> Signed-off-by: SeongJae Park <sj@kernel.org>

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

But please fixup the comment as below. Maybe Andrew could do it if I am
giving enough info to go on, otherwise it could be a quick fix-patch? I
attach a lazy attempt at a fix-patch in case that's useful.

> ---
>  mm/madvise.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 31e5df75b926..5a0a1fc99d27 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -1754,9 +1754,26 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
>
>  	total_len = iov_iter_count(iter);
>
> +	ret = madvise_lock(mm, behavior);
> +	if (ret)
> +		return ret;
> +
>  	while (iov_iter_count(iter)) {
> -		ret = do_madvise(mm, (unsigned long)iter_iov_addr(iter),
> -				 iter_iov_len(iter), behavior);
> +		unsigned long start = (unsigned long)iter_iov_addr(iter);
> +		size_t len_in = iter_iov_len(iter);
> +		size_t len;
> +
> +		if (!is_valid_madvise(start, len_in, behavior)) {
> +			ret = -EINVAL;
> +			break;
> +		}
> +
> +		len = PAGE_ALIGN(len_in);
> +		if (start + len == start)
> +			ret = 0;
> +		else
> +			ret = madvise_do_behavior(mm, start, len_in, len,
> +					behavior);
>  		/*
>  		 * An madvise operation is attempting to restart the syscall,
>  		 * but we cannot proceed as it would not be correct to repeat

This comment is now incorrect, please fix up the 2nd paragraph so it is
something like:

		/*
		 * An madvise operation is attempting to restart the syscall,
		 * but we cannot proceed as it would not be correct to repeat
		 * the operation in aggregate, and would be surprising to the
		 * user.
		 *
		 * We drop and reacquire locks so it is safe to just loop and
		 * try again. We check for fatal signals in case we need exit
		 * early anyway.
		 */

See below fixpatch if that's easier...

> @@ -1772,12 +1789,17 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
>  				ret = -EINTR;
>  				break;
>  			}
> +
> +			/* Drop and reacquire lock to unwind race. */
> +			madvise_unlock(mm, behavior);
> +			madvise_lock(mm, behavior);

Thanks for adding!

>  			continue;
>  		}
>  		if (ret < 0)
>  			break;
>  		iov_iter_advance(iter, iter_iov_len(iter));
>  	}
> +	madvise_unlock(mm, behavior);
>
>  	ret = (total_len - iov_iter_count(iter)) ? : ret;
>
> --
> 2.39.5

For convenience I attach a lazy, untested fixpatch which may or may not work :)

----8<----
From 86e99a658a5e0195050d6bb9e19975f54bf14e7a Mon Sep 17 00:00:00 2001
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Date: Thu, 6 Feb 2025 13:02:52 +0000
Subject: [PATCH] foo

---
 mm/madvise.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index c8e28d51978a..ab5f5da1571f 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -1725,7 +1725,7 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
 		 * the operation in aggregate, and would be surprising to the
 		 * user.
 		 *
-		 * As we have already dropped locks, it is safe to just loop and
+		 * We drop and reacquire locks so it is safe to just loop and
 		 * try again. We check for fatal signals in case we need exit
 		 * early anyway.
 		 */
--
2.48.1
