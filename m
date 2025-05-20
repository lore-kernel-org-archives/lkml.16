Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45571C4609
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747748079; cv=fail; b=dqXe+BOKRWvZPQFz5I9+Op3oj7HnXXMgUYZCLI+8FDZYrbHKQplykeFmGLUF94Jo56nxfjdfe/FvtXIZL95rWyTwpDhyJRfEyCzNumd9Amt0vpml4RQf7Cns1oRqwiT4olB7s08VInJTOZMFMcsB23GB3uHVPAW2/bzdBioS/eo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747748079; c=relaxed/simple;
	bh=88jpjl219fc6YF4DvquWeVAPmaW+K8MfaRkPVaXD8GU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iJ9IWgd1KVkb8DnSS0+rzzgBTYUJank+qPlE8TFhhxQqvID5niMg19nOu2WpacOu/XifGxxc01bYUbg9gA18+e3q/b2H+XH1CXNEdlMvz18ND8Yb0Pf1hfrH+u6P0V30UMsWYBo1x/CIFLwZMmoyKDYd5gjZ4uW/f50yK6JP91Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=afEHPpZr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Wixo3nLC; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="afEHPpZr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Wixo3nLC"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KDMJwY013163;
	Tue, 20 May 2025 13:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=MESlZ3X1kDAgs3JeE+
	0ZkAvPu/xrrUW+DVk/C9blYL4=; b=afEHPpZr2B1mZNPRBwVue0/PveISBe5qz2
	GsBEPJUpDdFqsQv1/04U+VZ+nEDYKkTUiPwOFg5eY+Wcskjg3X9d/S4pm+N7SWKH
	rx9WQo80dnq4saLz6y8BCndkAAwU3bluQXpw4uhl5zS3M/GnMukbcw/8O5IRIDIw
	eY1OJ/8jLbp9uBUJhmvQLNC/GM6Ny0g1SF44KLTaC4MJZG8GbVLAkMlUY3qtsDwm
	yRJfQ2WvF7te6QPycfxhTQPpN80YzL5CzJ2omjEDKHGBWcPhSPEKsvPYSgwlvLP1
	CPgLh5dFYiayDTuG7dHW/dMGpJEKjPRLULmrMW4lm5+zmmIDtR/A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46rtjb812c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 May 2025 13:34:17 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54KCUuVG015751;
	Tue, 20 May 2025 13:34:16 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazlp17013075.outbound.protection.outlook.com [40.93.6.75])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46pgw7s0fg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 May 2025 13:34:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KDHVBBSQGgEGKv2WLm7q4gNPGltKw6RHMiqOpRrHI6PMlCqVa4okyJgvGIoUPcTWFMb+u7Y8Cf97V2UQFOsPJXP8LdGBUA9bQ+ZM1ujiLqefZN+r5rzf9QPV/4ciuVSoQNIapQK2cuc0PiZjJzlhDbXNV/3t3+BAEmah4URZoXfGy4b/gjc7hpS4/M4B2P8ZrYo4m8DHC7iWx2C6K2SJVG5JAPailEbW8zNgFKt/5P++2t+TTvcFmLXrMiQi4auODp8l6VhE+kReiPq1/lOkPYup/fW67dJcAG8kS6GSNQRDX91jub1w7fZu66ceaxMlUT3M/AiSZAoSmIV2NCring==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MESlZ3X1kDAgs3JeE+0ZkAvPu/xrrUW+DVk/C9blYL4=;
 b=m3MSFKircQIyUu0I+P36olYIZwa985OO/PsyIlYmCbphSOCsjhtN2huMCKDokkc8MFUnaaLhuMkFiXXjt8tNtUfiJT4gvzCBhUZsjfW6ika7G57TbrMsd8rrFVjZj+w8mpz76QSNE3gWmVS/HW11a5tLur6V7WRlqE014I8Z+0258h4Aejrvm1uQQ0Cna5FrJ/Np3bEQKZo7bRqzhxj8ldDEd2LfSK2F0mqRLjfQJJroxb2da9OPLRl3MMOTxc//55y9T5Pnku4U2xQ3g9DSc6vziaHsYLPPMf4+b6qoncP8eH/SyP+YOaat/ZmXTy8aI4nVx2VCwGijm+lpYFNksQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MESlZ3X1kDAgs3JeE+0ZkAvPu/xrrUW+DVk/C9blYL4=;
 b=Wixo3nLCJ7Nr+qc0oiOP14clVFJ+ILVXSvepFXm0tEzXogmatnjUfWPo5RV4GoJCzXVP3OUggaB2ozb0w0nm2WrS+mwL2p3TEi4QSeQqQfCvLnSyMcTrSxVGn53aeKHX46t+NfwD+Mp93n513D6l/hMgvYM7Xl5KS7Y6cl+30Kc=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by SJ0PR10MB5788.namprd10.prod.outlook.com (2603:10b6:a03:3df::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Tue, 20 May
 2025 13:34:08 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23%4]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 13:34:07 +0000
Date: Tue, 20 May 2025 22:34:03 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, surenb@google.com,
        hannes@cmpxchg.org, shakeel.butt@linux.dev, vlad.wing@gmail.com,
        linux-mm@kvack.org, kent.overstreet@linux.dev,
        linux-kernel@vger.kernel.org, kernel-team@meta.com, vbabka@suse.cz,
        cl@gentwo.org, rientjes@google.com, roman.gushchin@linux.dev
Subject: Re: [PATCH 2/2] mm: slub: only warn once when allocating slab obj
 extensions fails
Message-ID: <aCyEyxHEXQ7DU9I1@harry>
References: <20250520122547.1317050-1-usamaarif642@gmail.com>
 <20250520122547.1317050-2-usamaarif642@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520122547.1317050-2-usamaarif642@gmail.com>
X-ClientProxiedBy: SE2P216CA0066.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:118::10) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|SJ0PR10MB5788:EE_
X-MS-Office365-Filtering-Correlation-Id: 41b605d9-bd0b-4293-dcd9-08dd97a2feee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eR849JsOFrZVMGV2yKKIQNHKQAEdGA74ZNHGQVv3mk9u6rAP+ythDYNdfVSL?=
 =?us-ascii?Q?Rmo6pHGXjhELFALfrwrnRzhtb8rYu0u2LJZjOJiYwHunQS/fOZuhMloxh12t?=
 =?us-ascii?Q?bz3FjPe8qTeczcS0U1HmNFCyISbwdsibwUPZFJPqIJdu+6wHS0bWoiuy3Mue?=
 =?us-ascii?Q?qzufxi0zOMDk3XHkAkNCK0/XdG5kSki3a6CXKfawAII2w6ncj8NvQbfgsBoO?=
 =?us-ascii?Q?UiB3eI4h3Rr5SII/LoKBb/dyhNj5BCWBD7UUYsKaX4FCkitXZNaG8Vn3bUxs?=
 =?us-ascii?Q?IX1umvczoejZo64iJZrHnRri6FOPMGQkU8yXGTnLa4pyP84rq+e5ztSuZbGe?=
 =?us-ascii?Q?e++pKPN9z40ueLepppmu+44sspF0XWw9Zq+/LpxdRcNMqEdmS/iuc9+u0G9m?=
 =?us-ascii?Q?sLGv1jRS4J5xRcfZF1jvfRt+vZRKI9rXITvmC3/eDrPjEbU9vATtYORQ+9wk?=
 =?us-ascii?Q?XGAcQobjLCk/tkm+Ll16Is8ac6dnWSpSzN8peoe8EFAJkxaR5Os57FS6wNN1?=
 =?us-ascii?Q?OvZpvNleXJ0HhEFitZ707SZy0fufUqKkmA3I0zqYLVMFSGD2cL/3QB7Gr9x4?=
 =?us-ascii?Q?y/glW234567FnI+2W6V+FKeh0oO64vdHCwAa6BTCLE6pPLJQuWQgSB9lnkCI?=
 =?us-ascii?Q?bvWt+SzjKW94MvYcCuyhTrAp+XloQTp/MQPcAaQfmzp2baowBPrrHzXqzgnF?=
 =?us-ascii?Q?E7rrTPrD8W6t3XHxglLj7jNfWfYIM9c4AUlz2VzO7S+VfGgbQV7Mh+qSscxx?=
 =?us-ascii?Q?sOp0Y/5q4iWjPCzuZifZtYFaydpkBcIgeupSI8kycw8+EYmOfLmvYJu84VxV?=
 =?us-ascii?Q?YgDud9EJJBsJoLAqF+Y8h76Ib7VPpLA7A5KwWY2KRqGp+B510+MfSFhHcLj3?=
 =?us-ascii?Q?xI8QaJt/paHG4VQhbSmdkMU/nJ+nOHD9uwyRpFzJM3xSkHeU7gSOd2HG7dLZ?=
 =?us-ascii?Q?/Bki4foL/jJBRrv0rbXkBgZj+7fIwzbhhdHkX+OCwlZ1mfVzj/e37grd440w?=
 =?us-ascii?Q?CahyjzJYAP6Ly2Q3/OOFxMwYl9NNvJYqCn0uQpcbu11sfo1tLr73cw/sKIo6?=
 =?us-ascii?Q?W7uvpDy0AGAkzskPGrAARzfe7heq6MDe47IHVmM9XYl9HcJQ8jArpqcfDBXm?=
 =?us-ascii?Q?fTD4HQiNQLBx/5AARHPHXIx68nWkdnutGxi41IAAJ+palrm7NYLz5xpUkCCC?=
 =?us-ascii?Q?oSJ40W+mTZdzxsIF8eYY9f8yBiL8rF3cw8+frEtNgRT/C3N9Gf6MdKDV4xtV?=
 =?us-ascii?Q?9CRE74VUCRQIOL/84GLW/oc6u3Fl5TuDMagIpM5he3SIbMWDJ4rU21Yr1kDN?=
 =?us-ascii?Q?H+OWhgG3aObyLa5IqsZPj9oCwHPKmTcY8FhgQNmNd6U2KGOEf3VtVpLU83kk?=
 =?us-ascii?Q?2btroz8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q89uefcgPUTH1pW8uAuF+HLNFBf4iu7oirGdXHjLHAxSrKkJUle8ARRxN3xu?=
 =?us-ascii?Q?lk21901Jvy3+wezwAzvFI4Li3dwJa19/qWs+1f3EH25PKMZQKKhmsyjHxqsT?=
 =?us-ascii?Q?rHDu+XnBnmSVZFq22+ZzVsjoZkRf5vYUgovmoB1Fi3ovTUSDtLwlMs3huEsh?=
 =?us-ascii?Q?zm0TFEjk5p4XIcvV7ZZJMzWKirORIznlE9gRSkkCbMgqZ4P0zJz9zU46A+dN?=
 =?us-ascii?Q?0Q3CALv71wyxz9mGc+B5eMj4ks4XSUA/55coSVsDTSM8SKLOmLcTQWKmfeSG?=
 =?us-ascii?Q?+1UatukRukh/JrKYghxEnrJYCBhkAQRo5yYMza6SAO3bmUsv6+W6Z3bYZyIl?=
 =?us-ascii?Q?qRblxd03MMCn386u0REwz0Z1705bMmcBcVi5GyABhYrJE8CbIGpfUDD9Y+1n?=
 =?us-ascii?Q?vVap201kApTRiVbdIwa+nitAOKCumfdb5386dqfyorZD0bEQu+d9+0kGUKjn?=
 =?us-ascii?Q?pqgnDD5CuQkBtrTMhCCzISzlhZ7PCGbE6rDs5zdC1L66VhqT1HxMEv1b/6Og?=
 =?us-ascii?Q?AYKtUImr+B8RVOv+mY0l781l6uEtLQOv3bt9t4qsgW48gpRkxb61ftPQekZ3?=
 =?us-ascii?Q?Sgr9Y7zT7uN8HTT8KdW8ubJA/33kE0P9+UhCTExbvU4mDL8PLMW9q0BI1McG?=
 =?us-ascii?Q?G0JpgwyIT5LigI6ONhgwTjbp0D8zMDb1LSa4kRr+6nMUzeql1WMIFlDdwMJC?=
 =?us-ascii?Q?rklGijEK33YowUQKctYd4WRzN/nbTNgb0jB/ZSbHO633a+JhFqZ4rlxmXsIJ?=
 =?us-ascii?Q?nHQRaqgqxhqZ2sC0NdUBxqa/nBDvNugrk0aBZHov4+Rg8IOmv7SvDFI11FXl?=
 =?us-ascii?Q?fThF+JS2kAJjUV9E1CbrR7GDhxMkfIKStUuxSd9MIVrfUCb5k/M3mf/Ko/4Y?=
 =?us-ascii?Q?L4qINIyg7vjEWXVpx0xym0LBvbSXRqZT84rmQsj9TUKGXEObqMZxUBqpU3aC?=
 =?us-ascii?Q?Jw2VTIMm+ib/g3AwjvOxu6vCazB0ASrWz8avGgSC0Uyb+HjUUFuYhWF1m6wS?=
 =?us-ascii?Q?0Bqn18fnEhKDU9K11B9IEHiWzX+T639niCVflYsfiEiaWX1AfwIkX0CqagMO?=
 =?us-ascii?Q?9nsjj/l5ONiXmhyZqQ/h+S9/J2eq1yZDPpwl6qXtwQPorr6yfUPYOJVbB9oB?=
 =?us-ascii?Q?YP6TkW+DqKz7RsHJx2SlNCdtttweuNMtxcFTzxQoFmm5KfjMdLfr65rZ4+Ya?=
 =?us-ascii?Q?1yPyJPgUdXgQ+2PIy8QUR7ZefqxVWpljoVSO/Ic+MsrlHSYiZVY2/KSE89F3?=
 =?us-ascii?Q?M/vBrxAfduWo869SkxjA2JS8mD6CPemLMaPrvH5W3U80z7WeJ91YzBj34oi3?=
 =?us-ascii?Q?nuw/JZTFClV9AlMz9zdoJHJ/zqRuLbjW2jjhpfbZhksXfocgR/9kEYW2rXVm?=
 =?us-ascii?Q?U2gOdkPzS9BDyBJB6dglV+IgLoB8H21ba3WXuhIXlP4A1HoStm3+5r0wRpF/?=
 =?us-ascii?Q?t2N+BlPwoH0fvxZRG5qpkvYQCf9zyG/W3E8bXPmleyTYLCfCH0A3TZ7Zn1oz?=
 =?us-ascii?Q?sZnT1H0nlUF31KRY/1w1O72Z0dxYweITBtdEpGxb3X6TvgXndg+qsLwRJ+Wa?=
 =?us-ascii?Q?O+vteK2UOMejoe8IQe68c9ThDvyGKwDg2fZa4sQb?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tV3V9beuYKZEZtgpRVBea5ppYqJiQKAgTYfBLWnBNJqjyy/aoROhReLNY6FWbuGXIPZb+tgjA9DOJMD7pXltXbUSBE0Xm7EdPFuXPDl4CldJoaf2gXmN32KuJvtnrJ1r03HMtvgpnbk78kQSBQrgsJwCuGlkGPJ/a4gjbHDRperj7r9bm6O2X00MPso3B/LCmr5t8TSMlGtOSfU47ntYt1uIwWqUmQb8G3Kcd8pc0+MzHCcdRxpRX5oWuBro8gOoIem9IB0v+dsMeRAEFfmomyu4yOmXX4hSYYRQKZAPgDkTGOzlRXd+s4UohDY10lMAnEunEeacVohspQKwc/CmTvCFWBv2pvGer1fcAZrBrUnLSZaTtn+QDawxEd2G0lVOsOsY9VlzEt8yRgzCglsPgseC4I1DW6tL9oE2fciBPX8SMTwNXvdu715dyj8jUWBJGa1gfPa5mHoFSXTAUwN2luUEo+OLhxr710305z+BBQ4kqD/8spqBM6Kpxj9CEBe0tVJDVPX/SjiQpHlCoO9CkShr0zCTc3qUybkA7I1Zfsoqmm751PPI4p2Ec/1oVSxX5tHJrc15agUUS6ZM+wnGjgMDaYR2nGImjGE4PaU5GVc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41b605d9-bd0b-4293-dcd9-08dd97a2feee
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 13:34:07.7563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fA4D/LbvtEXcR9x3JguxfmahjoHriU4a7sDjXujoD6EVADV5MmBFrT1wOruxGtlumY3crHJ3CCgz1GcUVQRTJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5788
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 bulkscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505070000 definitions=main-2505200109
X-Proofpoint-GUID: N4xlxrId3RTunE8IDi2jAB74w4c0iDil
X-Proofpoint-ORIG-GUID: N4xlxrId3RTunE8IDi2jAB74w4c0iDil
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDEwOSBTYWx0ZWRfX4OHILsjMPy+l fjlE+UOGanbbFF+vssvtisDvxw/m+yRjtThNQa9xG3kJT0qdGlxexFSceeLSrgSIQaIxJvom4LY Vw/o6RfTQ1yXgzBPNEiulT+2yUF+uXJQtJgEhX07Ed2ODREVwzz4Ba9iaBl72X3lG04vQHO14C6
 cnjdG5dpWiAJsx5nxY+qbrABv5mEHwI3Lh0ReQngLK8j4cBUhkCizRO5NtjSzDCK8Lyg5tntSUP 2ABjH7/EGNgF8T50InvUh4VgICdGVID3eCOw+1pKCI0noEUtnq4hgqtk76Uj2MCmYKnrOEX5Oxq Wh78+BHtcGVTlo/RgsfY2+JpRfs2A8oYKmGUF1trBPVHTaHkCj1X5HlE6n3QV98zm5U/+zWvT99
 TBbmAxx9P+Dzrf+rBW2OWvhqa8eSxnyEnRpVkcyKPkcaWffnHzIqAZiZx/+RnLz2tVeeDhf8
X-Authority-Analysis: v=2.4 cv=SqeQ6OO0 c=1 sm=1 tr=0 ts=682c84d9 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=6rgnd9x369qDhlBk5v8A:9 a=CjuIK1q_8ugA:10

On Tue, May 20, 2025 at 01:25:47PM +0100, Usama Arif wrote:
> In memory bound systems, a large number of warnings for failing this
> allocation repeatedly may mask any real issues in the system
> during memory pressure being reported in dmesg. Change this to
> WARN_ONCE.
> 
> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> Reported-by: Vlad Poenaru <vlad.wing@gmail.com>
> Closes: https://lore.kernel.org/all/17fab2d6-5a74-4573-bcc3-b75951508f0a@gmail.com/
> ---

Hi,

Please Cc SLAB ALLOCATOR folks in MAINTAINERS on patches that touch
slab code ;)

>  mm/slub.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/slub.c b/mm/slub.c
> index bf43c403ead2..97cb3d9e8d00 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -2102,7 +2102,7 @@ prepare_slab_obj_exts_hook(struct kmem_cache *s, gfp_t flags, void *p)
>  
>  	slab = virt_to_slab(p);
>  	if (!slab_obj_exts(slab) &&
> -	    WARN(alloc_slab_obj_exts(slab, s, flags, false),
> +	    WARN_ONCE(alloc_slab_obj_exts(slab, s, flags, false),
>  		 "%s, %s: Failed to create slab extension vector!\n",
>  		 __func__, s->name))

I think this should be pr_warn_once()?
I'm not sure why this was WARN() in the first place.

The coding style guide explicitly states that:
> Do not WARN lightly
> ===================
>
> WARN*() is intended for unexpected, this-should-never-happen situations.
> WARN*() macros are not to be used for anything that is expected to happen
> during normal operation. These are not pre- or post-condition asserts,
> for example. Again: WARN*() must not be used for a condition that is
> expected to trigger easily, for example, by user space actions.
> pr_warn_once() is a possible alternative, if you need to notify the user
> of a problem.

And failing to allocate the extension vector can happen during normal
operations.

panic_on_warn users will be unhappy if they notice their kernel panicked
just because their kernel failed to allocate slab extension vectors, which is
a totally normal situtation.

>  		return NULL;
> -- 
> 2.47.1
> 
> 

-- 
Cheers,
Harry / Hyeonggon
