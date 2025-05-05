Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2135.outbound.protection.outlook.com [40.107.104.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEF8263C8A
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 15:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746460440; cv=fail; b=CEAFvWKb0XnISP8HVvX01dASp9QEs6/VghGNJnr+ZYbiOYetLzNb5jcYjcnN2Gu+LMcjY9PSMfR/cThfJP67+BWonR0DnnQ1FvSEiNCHAdJ0g4Oh1A04zsYQuJLvZ7PcoK+wrLFFUuO67+CMB2bqqdcprDHx+ozO3upANQ7zTY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746460440; c=relaxed/simple;
	bh=LHzEp8Or7Giqh0QzBbcrCD4cJZCBrwEfHfVZQYt7hiE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k3GATn+rx6r2ipuYxKivWWQWLaoL6QxcF1O6dcQY6Nje2H3pEMpBVho8pU98Jf22swuzx1IBbKcRNbESWrE3lhJRdfxEHsrASWtmgy2BpUPADB1aRGJT0JoXvrSgYF4pWiWU179DIQHEnK0JEWLQWJ9LYFko3bTsDuBDin+n+NA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=santannapisa.it; spf=pass smtp.mailfrom=santannapisa.it; dkim=pass (1024-bit key) header.d=santannapisa.it header.i=@santannapisa.it header.b=rqtaI5kR; arc=fail smtp.client-ip=40.107.104.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=santannapisa.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=santannapisa.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=santannapisa.it header.i=@santannapisa.it header.b="rqtaI5kR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQduhSMlbe2/v0s+0dmUhAb9X9JgF5QN8mIRCIozBMf7y/rNuViR1he9BUCpX9BvyLz+CS5fc7s3h9fGsK8S1+HNQxM8OF7W2tZ7fLrzt/KRteiKdo8cNLBgDiSklXRZmaoNhWj9tKfxdgK3waZUvstX0gfoLEfVIN/xJwipvMMArYASPt73m4wWdUEJrYcOqchRW9dNLwhEZjPlr+G6Hyd/EhUyiaUeMIn/hg3xU3s0xEJ6hUzPIh8g0p9bGLjOSi3e0Y+WAu9/j1WBha3oRWNpp7fLh30aOuqT7J8eJNd5U3cGLpnvpxArN2FdTDY1z1mkxZ78BnaaWnzQNppMMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zV07Y8A6z+yewaUh/694BLDz/U8SSUjUxJ7ryGCWd64=;
 b=P2UmU5xIkMkCa/Ax2jKnbc2YvNXbT5SxIG10FmUcHHfDEcJ904R1F/H2aF9GINl1AoeTXD3mmx+viAwC9T+UbFv0FWkkJTN4LMUmOJsIUurKQ8pgDRELug7alhN9Xr5sflj1jmi4to71qoF+84/i9MvnyweT/mIneDfPzxOeBMjVRYnC8Ws2d/mu1crr9KHO3eJCwaXpoORgbSOpAEDRnUZeVHPecT8t0sdXcMi2uw2w6i6aFIZCYLWF/jWbAsoP+A4Di05E5ZZ4tEIy+Ta0ZboujkHFifTiUdTlvczIE4bPclndD32tT2oQVbYQd//wrC3xH9TlBC5jakPeBALihQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=santannapisa.it; dmarc=pass action=none
 header.from=santannapisa.it; dkim=pass header.d=santannapisa.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=santannapisa.it;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zV07Y8A6z+yewaUh/694BLDz/U8SSUjUxJ7ryGCWd64=;
 b=rqtaI5kR7hmZ+YFcwvg8kPaOgiLscCLySbSVQPRZesoIDybIbvyv15manIkvUFmFp/aUOY1fBTPJI6JwJcmK3dg3EBhGploeXQD9weBLkWk2OxzUXBvsMP+ImsZA/sjJ8La6AE9LrgP+fTcuLWoBvp/j02FiubDDejfTTHBcmYM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=santannapisa.it;
Received: from PAVPR03MB8969.eurprd03.prod.outlook.com (2603:10a6:102:32e::7)
 by GVXPR03MB10383.eurprd03.prod.outlook.com (2603:10a6:150:157::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Mon, 5 May
 2025 15:53:52 +0000
Received: from PAVPR03MB8969.eurprd03.prod.outlook.com
 ([fe80::6bbe:2e22:5b77:7235]) by PAVPR03MB8969.eurprd03.prod.outlook.com
 ([fe80::6bbe:2e22:5b77:7235%4]) with mapi id 15.20.8699.021; Mon, 5 May 2025
 15:53:52 +0000
Date: Mon, 5 May 2025 17:53:48 +0200
From: luca abeni <luca.abeni@santannapisa.it>
To: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-kernel@vger.kernel.org, Ingo
 Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Vineeth
 Pillai <vineeth@bitbyteword.org>
Subject: Re: SCHED_DEADLINE tasks missing their deadline with
 SCHED_FLAG_RECLAIM jobs in the mix (using GRUB)
Message-ID: <20250505175348.47dbd120@nowhere>
In-Reply-To: <5c2f8c8b04e1e36d721c1f90f39c02dd5d971580.camel@codethink.co.uk>
References: <ce8469c4fb2f3e2ada74add22cce4bfe61fd5bab.camel@codethink.co.uk>
	<aBTO3r6Py_emwf1Y@jlelli-thinkpadt14gen4.remote.csb>
	<20250502161033.1ed7ddef@nowhere>
	<5c2f8c8b04e1e36d721c1f90f39c02dd5d971580.camel@codethink.co.uk>
Organization: Scuola Superiore Sant'Anna
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MR1P264CA0084.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::7) To PAVPR03MB8969.eurprd03.prod.outlook.com
 (2603:10a6:102:32e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAVPR03MB8969:EE_|GVXPR03MB10383:EE_
X-MS-Office365-Filtering-Correlation-Id: b83fa1b7-adf0-4180-8fdb-08dd8bed0856
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oc1QwQi9KQ33f/GTSADZLcHMVhL8L02C9ef+VhjzJs4ibU/LbKjJRujHNDXr?=
 =?us-ascii?Q?DCcVhpGLbMsO4JYkwe+xsJG24yF6Y2N2jSiT8DdGygzTOru+jDC3e5k2U0RJ?=
 =?us-ascii?Q?HWcQG91Em4tXrCZiZs6rm9AnqZbovGdnC/SXyL5BVONMu3LvaJGPJGlZYieF?=
 =?us-ascii?Q?1XJtcjF1i4QELc99LyM37pTLdKSGS97IlZToOEoBhNqWjwgDCVlLvJKSdNZ3?=
 =?us-ascii?Q?MrU1XuwURAsizD8Z6o0u3pSgzNzNZdnpAm8DKFEcdyIhWa1AYvSjbF5Vd1OC?=
 =?us-ascii?Q?2Vh8uLjeFiwhAI5cgLFdM+cpjnQ7aoS5zoC9J61zmhCmBoQFaQAtg9fx4M2Q?=
 =?us-ascii?Q?eCfDVHrRD31Ok7IMxXDYL9bPWkmRRVnKiQtPJQLG+wlWY+OKazz4mkIgq1CH?=
 =?us-ascii?Q?kRVehfdZPGOTpR7Ip/qT9sljoPxYjOYJkg+nWmKMqdXVuAzSCPd3kJsqtlXg?=
 =?us-ascii?Q?WuAw+KqSQ9z+k0Pdl/a9ENw92vZcgS37HtlefeWrvnr2FDr0euOWKA6afHo6?=
 =?us-ascii?Q?7vZ0spsO+4RaKO16Qg1GF8n9Tg6wQiXWCfH+jl4sAoa1RMA5KjhE+IFavmKz?=
 =?us-ascii?Q?G5dcC5IKYTEt04hO1YzST/KcqysEUaAaSwMjog5Ih0tE7M7D+q3pPBtTffkW?=
 =?us-ascii?Q?j7eGY7npEuoYvxZF0eATUVF0wzBoieKCGDknA8SYZyEiBe1Gi/hUkksmzGUh?=
 =?us-ascii?Q?QC9l2zPYfy5M5GR+DHOgDJDmtdhBk+LT1DDF+D6cBtQ1uE5jLfBdBtKlzdGL?=
 =?us-ascii?Q?R0FsNBLFZHcy3C32rlUSxy//sdWW7DdsnlbL6MRvIyO8E13rPef+uOs843t1?=
 =?us-ascii?Q?XTyixm4EiEJR44nTkTyRpTQ1Y1HWd1UO1z3tPUqStbWoDPRJUaTSUdUNX38c?=
 =?us-ascii?Q?+WnI5Gx+6gfTfIdxWYPaIaLVRRLiHnFr4ZfVfmXc/zdXVKrfJpfVekd0/Tyt?=
 =?us-ascii?Q?ECetq7uThYPcbYbHSv8Po/GgefSU/pvHmYbLTbn32G+PB5LZ60egNZyWShZ6?=
 =?us-ascii?Q?r4xAWVjtScA3zyIAuOUCYMGT9R+KVdWfQgT8xl2cwZ0cXHzbC/QDtpX9OQ5+?=
 =?us-ascii?Q?N82a0590JmbXDuP/Zpm+kJ4WY3fwOQsJ7ofp6aZ0Dz+eACWi2xdx0pxPEtYf?=
 =?us-ascii?Q?jSzg7ZSc4xnNpGosLhaKncHM/3XyoaVxaD8y24OmGOh2IsZXK0HblxdyI/AH?=
 =?us-ascii?Q?pjnpWbhi8jFNPpyt7kNim+Odset/HX8ZNrDxdEyOyPL5lvxjtge2zMd+PKP+?=
 =?us-ascii?Q?kq3xOs8kZyioaOKOhsVEr8FJw3F8wS9IO0qiBWW6w0gtJEwBjWvxnoZaqjOD?=
 =?us-ascii?Q?CXY5rMgIlhagfacy9+rDLM9+5Tv6AyDJJZ1pWm0u9AKEZUA7/S6/7C+W11ZJ?=
 =?us-ascii?Q?CLKDjzA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8969.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GEvJ4T3sbVxqMaeCD50FbDjJkHI/o44DQkEE741wMNWetI0td20q0IPkn0eB?=
 =?us-ascii?Q?8+e9Yi18lUR+YYUrW1qCngAQZyBuTjioGlwSUI48t5tcjurPXVcj9PSzpQGZ?=
 =?us-ascii?Q?75CxVKSZwn7VAga5O0iiLNkYTQTqMKY1f8/3TCpmyyhKMcfgCl8VOnegCKnx?=
 =?us-ascii?Q?AWv7FRyfmdyKM6m8i+woMlA1UMPN1gQ6/TknS5MXF8VT5JrFJBI1eKGb5Qtc?=
 =?us-ascii?Q?N2rbNeyuOAUVP7EEH+i88XSAqA3jz7QfZcGAGNOfg/sHHY+QCTWvnC81ZIHC?=
 =?us-ascii?Q?yApLvdBHig/5mK3D+8odGVeocmpXdprL5OtDJFq/xChLy/4S/x5wan7XBLrp?=
 =?us-ascii?Q?NLTXop/eNebJeP+A12dERLQB5UFkNZNN5wTXXJ3JznPOjJesRcC9uXUuJkTb?=
 =?us-ascii?Q?7zf2YfNiJXpstptbc4Nh/pQHMXPWA4v268n5MyXQBMm/uHnb6HpN/Mb5VH0T?=
 =?us-ascii?Q?uSqKdAUFLfEsRwbg20IVsz4guQUfHBjtEWJR5Y+u+wwKMXB3TbpcwDjVISbq?=
 =?us-ascii?Q?rT/Yk7sLVaXSidgaQbmGBfUSiswcjqFZEXytRRbWtEBg69jJMA6082YUtnok?=
 =?us-ascii?Q?y9nRuf7ean8+h+Q+akj2rVLjMWdALfdAWBHpNPBgj24ulmfE7lS2CI5NipFO?=
 =?us-ascii?Q?eq4oK56xAWv6Y4bv5rxA+x61/SayttDkY+4xR2jUAKY2JA5DiJrLcHOwa2aM?=
 =?us-ascii?Q?wET3LsusrcD4d6uRYH3FCk/RAZpozYtbRNTBEWd02C2Ui67eY8lkPsnnFKeF?=
 =?us-ascii?Q?WbQizBLU8HJmMWdK/SahkwSr7e9ucIP3uLvSYg9m8f4uDQ5aUkCLt9WIaXg9?=
 =?us-ascii?Q?ve//pwoOmGYQFv+GCJ2FuZpEHjWEKlqZFpx2sRVULtoMdKG5fLU6lsEThRo8?=
 =?us-ascii?Q?PCYSuPKREsnA7pji+57MOoj58pbiCvY79lEisKil1sgb3y1OOZG6a06x+3Lc?=
 =?us-ascii?Q?tb8PilCWwwkGA7phSe4FpoS67dHJpK/eNvBO8AaMN/IWMGayEEWTVcPkgvDS?=
 =?us-ascii?Q?nLTGKiHlY1qdHgVG1ndRlEuDjHK1/Exev81woqYmX//1rdCKQfSw00vA3qvS?=
 =?us-ascii?Q?z7T9rWhEcr26FdQXiVpzxpigtxnj1UZQgeGT4At4KFFI7HB2FjSBImyOC0p/?=
 =?us-ascii?Q?Ss12iWieKDaSbSmPtyI4KTP0UNm0APQJWwlLGa0lWBaGuUAYzOt+EZCH2aQY?=
 =?us-ascii?Q?xGaN+kxphQ3vSJP11zjYjODoyk0AnfFDsvv1h9oDMkzD+7zYDAZc/fbh4rjB?=
 =?us-ascii?Q?CfyNVyyfds9WsubbfpMNK9EtxsdJtckVz29iwMXKYwSa7gscvzRfImW5Wnvq?=
 =?us-ascii?Q?2rGCgmfOPbYmJoOiVLEZxKSH+hHLfgNiJBV9GIGliDC6bfDC9m371Oza9fXH?=
 =?us-ascii?Q?EppkBFmf2fkabSYAc9bV/l+GamGgoHTpDBwMqPQo/XWbdggqqPnm7x7OXJTD?=
 =?us-ascii?Q?Uot/65BswofZCNYYeJ1/TBtluiCcasAY2hH/Yp8CBgZRfu5WfZ8w2xY0FYQg?=
 =?us-ascii?Q?6DGD8CNj6Q/3uqKR73+oFvUuCVn3HexSYh1qkNt0ced800dV/fezUjoXJi3A?=
 =?us-ascii?Q?IwnKtDiCnFSwwizVJeg41oN9be72HhpYx2LQMzENBweRZHm7jyBHW9ld1d9a?=
 =?us-ascii?Q?MQ=3D=3D?=
X-OriginatorOrg: santannapisa.it
X-MS-Exchange-CrossTenant-Network-Message-Id: b83fa1b7-adf0-4180-8fdb-08dd8bed0856
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8969.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 15:53:52.1482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d97360e3-138d-4b5f-956f-a646c364a01e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kyafEOfaT/3Y4UeqrQqZ8JkoBKQeRFOCCMhs/i13Y+tOf04MsWtSfO9kxKSqQtSZZTlnWGq32mtsDXBcU2XTtdtN2AKj+RKm3k9MXDFRsaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10383

Hi Marcel,

On Sat, 03 May 2025 15:14:50 +0200
Marcel Ziswiler <marcel.ziswiler@codethink.co.uk> wrote:
[...]
> > Marcel, are your tests on a multi-core machine with global
> > scheduling? If yes, we should check if the taskset is schedulable.  
> 
> Yes, as previously mentioned, we run all our tests on multi-core
> machines. Not sure though, what exactly you are referring to by
> "global scheduling". Do you mean using Global Earliest Deadline First
> (GEDF)? I guess that is what SCHED_DEADLINE is using, not?

Yes, I meant global EDF (and, yes, this is what SCHED_DEADLINE uses
unless you play with isolated cpusets or affinities).

One potential issue is that global EDF does not guarantee the
hard respect of deadlines, but only provides guarantees about bounded
tardiness. Then, in practice many tasksets run without missing
deadlines even if they are not guaranteed to be schedulable (the hard
schedulability tests are very pessimistic).

When using GRUB (actually, m-GRUB), the runtimes of the tasks are
increased to reclaim unreserved CPU time, and this increases the
probability to miss deadlines. m-GRUB guarantees that all deadlines are
respected only if some hard schedulability tests (more complex than the
admission control policy used by SCHED_DEADLINE) are respected.
This paper provides more details about such schedulability tests:
https://hal.science/hal-01286130/document
(see Section 4.2)

I see that in another email you describe the taskset you are using...
I'll try to have a look at it to check if the issue you are seeing is
related to what I mention above, or if there is some other issue.


			Luca

> 
> Concerning the taskset being schedulable, it is not that it does not
> schedule at all. Remember, from hundreds of millions of test runs
> over the course of a full week where we usually see absolutely zero
> deadline misses (without reclaim), we see 43 million deadline misses
> (with that one rogue process set to reclaim) on NUC and 600 thousand
> on ROCK5B (which also has double the CPU cores).
> 
> Please let me know if you need any further details which may help
> figuring out what exactly is going on.
> 
> > 			Thanks,  
> 
> Thank you!
> 
> > 				Luca  
> 
> Cheers
> 
> Marcel

