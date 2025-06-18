Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8A72853F2
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750243209; cv=fail; b=f2LDvMxffCO95jrl8BEcRCAVFYmYEN1iUWx8pDRjYoqnOowElS85dNGI5iZWkf+x0pPaIJUytU30KzHVI6/xkTcBzjykJF0MJL0tVgOcr8Yl4gfLp9EnBjyOK/kuUpQQRQAG2nIAjtpQAOLbjQkKFbf3vsUlbRwek1ew6AwqLWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750243209; c=relaxed/simple;
	bh=ez1DAW++5ilnzdN3vzfooqWFp/Z28ClXe4DU1LXakvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=X1Q8r+Z9ISkvQz5rYVWkhrDVNFifiQm1VPwfdlBtl8pm9RqMmvOmbGTiC4xXIjdntUAwgF88RfEq6P4J+AJd1Ckmz+pW8tjC6OqdPT/CR9BeleG5pVtqgW4SY/+mhmRUrPmQXHmSW8AYicLHVYAx4uwLtzMJMe2/5Xux1kdiHGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AkXf9Amh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=AzloJ+4O; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AkXf9Amh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="AzloJ+4O"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I8fcmf001131;
	Wed, 18 Jun 2025 10:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=CeyfqfQ64gXsmuTbjE
	jflTn81NkYfEBwYnvPJrJ0Xt8=; b=AkXf9Amhgps2iyGOdBJlIQvL76ozJaZo55
	bA6+pv1wLxC4YDXPvlOy0GGsgtwA2mexCdxSi3WSQwOIA4z81NDpdLwnfN8ofyHg
	PO17wYeeZ76otlIN986DdmA1yVYsr66C9Jzr1RjNg5RPJriceY89JhBe7fmFoFuw
	rKeSl042zK6G8TLeTjZ5XcehdOKtnYLD7rCFLvRvxXoUxGHfzOn+aeQvOSX5RjxT
	yoRgojbQzcG70lKUUOhKA1ljKpBoyjpCuA752MGcBjEMFgPu/ZroYluvk0P9QyiL
	eALmdDpe4L1CZaV7PE5dJqfqsRp9KWXiYntclTi5GiHHTR738G1Q==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47b23xu0qw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jun 2025 10:35:57 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55I8hASc034407;
	Wed, 18 Jun 2025 10:35:56 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yha83jf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jun 2025 10:35:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D3nTLoXAhOI+8lsYU0IKJjzfOiLcaltu0fGO+7sgduoRRpFWdj6KXTWUDYILQEIMDrJfS/EEY0nKJfzxTv6/SD9mBYcpPsl4dp7b/PWq18F2saHd8ZQeH1MtKCvDPziHm4RwfKQAGjpqKwIPm2y5UZ2mqjEioDZDKF1K5JovBDO0MX19dZyfy1wKGe4sh2qCbV01Y7+PYra4shNSLLcax9bPe4IJhBemNhQsqiIqfJSned1KMfJjgYXtkzqJ6AIwfh6Ecec+HlHnEwXk2CC7tOR75UZNiz6ypWXX1Nm55SbP0JDJz5cObeUexIxibQJMqJpUJb/EM0AVrRWFDCpIEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CeyfqfQ64gXsmuTbjEjflTn81NkYfEBwYnvPJrJ0Xt8=;
 b=j+yNobz81LVm5kcrdSlRoLUiU9DUlBVWx+8dJ7cVi9BOPE3msJSo6sRMEwingk4WHjikPm35HXRO0es5Fi6TVdEbIEkgyXrOpVXEzZwTCNiIYo8pu+29pfpAc62bqlQ7mp9a9VV1OB3fVciOHPKJwMHkolg7e8njpoS3Mugw/TC00d5MMl6CJi812sFZ2xHDqNwRTzkHdQV/rDv0tt+A3effzlwf+B9btgGoVBMoRHhA5H7C+qCt74shz7Yru08+75fKqZPY/EKND0VolkJ7Ef9FCoUmrHey+zda4FCIbAa+qjXN7YmZLJPCfzHjsIFrXk8JJ9UTBaXJwO2hMAOYuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CeyfqfQ64gXsmuTbjEjflTn81NkYfEBwYnvPJrJ0Xt8=;
 b=AzloJ+4ONzhx0I0p1pb4Q/hMC6narQSKOVGMC5wwIX/pFLKnqSsh8OVm9Ycju9obX2NqN/848Xg+H83a/hWSFO+VBbIR58bD4+8hUYoxGMdLO59NLWZTh1bio0UQ+yhiNKSdG1USvPkM+WzsDg41HM+WPzzxIMpBYCfiAgnaUf4=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH0PR10MB4709.namprd10.prod.outlook.com (2603:10b6:510:3d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 10:35:53 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Wed, 18 Jun 2025
 10:35:53 +0000
Date: Wed, 18 Jun 2025 11:35:50 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Yunshui Jiang <jiangyunshui@kylinos.cn>
Cc: linux-kernel@vger.kernel.org, linux-mm@vack.org, akpm@linux-foundation.org,
        david@redhat.com, Liam.Howlett@oracle.com, vbabka@suse.cz
Subject: Re: [PATCH] mm: Inline vma_needs_copy
Message-ID: <5d8477d9-fdb8-4a85-8978-1c0fc4074158@lucifer.local>
References: <20250618014209.1195734-1-jiangyunshui@kylinos.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618014209.1195734-1-jiangyunshui@kylinos.cn>
X-ClientProxiedBy: LO4P123CA0267.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::20) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH0PR10MB4709:EE_
X-MS-Office365-Filtering-Correlation-Id: e79106bc-524d-46fb-45af-08ddae53e70c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AnIMKFxKD1DWSerFhO8O2ZxedLIc19Z6SM3gVAN61Z3qk7Gl49eFTvETCMRh?=
 =?us-ascii?Q?LW7abAN7RqRhiQ7TE9zRIHmsC9cMiH4LwuMkSXMYlGPkGhkcbmZVss16596n?=
 =?us-ascii?Q?FBhu841KPqh0jIUMdBnghjgcJwlghqnVKG3b8qjCum4z1JcCG33Nyel3/fWC?=
 =?us-ascii?Q?ST09ykiuHyaV8jLvU9i/er+KtTXvzMIIweEuEhoC9vLirOPlXcSAeMQXfktk?=
 =?us-ascii?Q?gbGnzz3LJ7YisL0v6SkXY056URMhpsSslNXzDcLbLeSDlG0BDdtwkbn3CpvU?=
 =?us-ascii?Q?xQEbLqL+qjTdfNMUFDkuydLSoGv/dsvOIfkquoKyI0XsnxFO0wVA7WEt+brg?=
 =?us-ascii?Q?xavWsLLXYb1JUpfyUQHliGiZaP+S4IBfbcHkEgmCVNzkJkBSkU12HUBBmL0j?=
 =?us-ascii?Q?fECilHKwDOnAYz4l7+LRxCFHBtZxEOdg9m6a4UdbX1FWTAfV4ZLYfsOy+RIq?=
 =?us-ascii?Q?k36uScMu5rJrgAnKsizzShpFD4zjZoE+NaXggSY67TM9rp3llFJV1kNNUJGs?=
 =?us-ascii?Q?NcJLoHVO6eYyeGzNfhFZ3gxxzbfi4edAlT4gwp0uy9VPQsBUrntYQW2X6eCe?=
 =?us-ascii?Q?q9lTBWAq2DJFsDm0pMrWEltcyS7zeCCCf+iTa9HxmEX4+cphucMj8HftNcM0?=
 =?us-ascii?Q?1HiIyxZOKHbAY0IS8AjKHoQb19RD+z5nzr+RvVAIQ2ZigzrObq48pcBf9S1A?=
 =?us-ascii?Q?9FqXqCIlrgyEEHKAMhZB9hHiryqg2BKGqHT0X5JR9e6L1tb3vAwe4WFSjKuz?=
 =?us-ascii?Q?rX7bHxTgPxBNDE1SMORQHlq9gkZV2v6MhedaijPaDAQ0+978GPFiRhgaMQ31?=
 =?us-ascii?Q?kUt/LetdYSnCFuFA49/EuA09WiuP/UkzTMex+Gn5KcJbGTMVzS2c9rV/PXn6?=
 =?us-ascii?Q?R/wIiIM90HERtimmsoP0Ln7wU+H+WfXAAwvgEHZpbcPoGAD246b9OlmybsPv?=
 =?us-ascii?Q?iFxrP3PYCvHgUovnnwjg9Ww9VHzKv+3sfpXZiXXy7+dOg1RFX0fibhU0BMWA?=
 =?us-ascii?Q?bj1XdjCD7HLhlGj2Z3+Hj1qTFgZsvqAxGQB2WVeNFdjuBirl0VtzoubxsHPr?=
 =?us-ascii?Q?57ccA1/dJRZvyNmk7U6BhJLjzqZkbb+uesrYxLOzFSZNNVl0gXK6PJiW/Mh2?=
 =?us-ascii?Q?y+Gkuj9TpfpyovWHIeB01AiC7Lj2AqNgL69X44J2zCYbASXgrTt0myXpk8Gh?=
 =?us-ascii?Q?iCB6xvHeySb5zmxlbel6ftG2sLl2ErAWjU+1K61JN76aEC+Qs069LroN9NV6?=
 =?us-ascii?Q?tclEAB1HS/wiEqbmmEnalB9dj5L9jc5Wm0S6MJFFN3xV5ePhlUIgE/mGsEo7?=
 =?us-ascii?Q?0JxZv6uZMAVPEKel11ZoMeQqwZSMvkqne44SbCvgm59H66AQQDYd4BAxVHyY?=
 =?us-ascii?Q?LiGlQwP0SHZiRE9yD9WUl2FB5fk9cKLmTLk5vUY8EsMmjZ3PN8Ailg69JY8r?=
 =?us-ascii?Q?cEi3aZ6T0P0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lqvUN5F5NcWVqo8GzVl0RZhh8eS/69TAVdfbfHnJZ3Z0F9MiYCr5wJJXtYK5?=
 =?us-ascii?Q?YDRR0i+D6ys17wKULHwBt0kctuvZ4IN0XkpLp3g/2LRwIQDdVeWy116rGkWg?=
 =?us-ascii?Q?Ks9xOriKrUcVPAqflk9idP4jcIuYWdisajL5uSRkLtxMMe1j+zETdpKlyYpw?=
 =?us-ascii?Q?5UzqQD7asBsKHtS0FYR95ehkEkegMalxUBzIwkpmP+DcMTd1qGardufEu25o?=
 =?us-ascii?Q?17mBd2RSQPgHtZH2PEeGsCeANrXaQQZO7Zp0Vukx/y7diiYkea07H1pB3l7i?=
 =?us-ascii?Q?jOG0vFl+EVUqtSriTDRcWoGz6ib+cfsdy3k54YBOSOcNaBDPXscE0Zltzzdy?=
 =?us-ascii?Q?EaxzQUb/nrVlq/rBXSvezBsjfGhDDkobAECQbYJRDTQf1yMhgfnzDLOFX30m?=
 =?us-ascii?Q?383438s4Gzw7yO1FKOpmraGBePAlVsU+Emn6+6TvLU+hunNZ2ObQrD6n0lnh?=
 =?us-ascii?Q?qpEkB90+I/3cQ+aSDjIKMl3HPzilwln8Otf7+4Bva0VhAJO2IoUyV+vwQRef?=
 =?us-ascii?Q?Qia1IfBqYmvX++URwKZ17tKkgKEbDgWExHOGhRgcJ6m/Jo+UsJL1A4jbrfBy?=
 =?us-ascii?Q?buW97Wn7q9TWDZWvZrWGTXO+NeXZ0kpvtyrpxVvHq3x0keFDv0h/UBey5SEQ?=
 =?us-ascii?Q?GWo9gFVNOvq7T6bEy/J8SNrA2srSkkKYboUlhE57f/JKeeJG7ymeSJFBhCpD?=
 =?us-ascii?Q?32bAlphBYRlzenN1pmkYQx6OgVwriDj6eosC0F2HDKa8LWpO9jQBFLlhdf5N?=
 =?us-ascii?Q?mWX1XpkobWmtAdAmen/CyBmGSqQDq1Q9+jjoWhefcsXBarAhK/U8PfN2Rq+n?=
 =?us-ascii?Q?1XT6IRlIV57Zr40s440fUplHC7jySd21bJJZ2jOTHJkZFZ+HhBmUs9owIwO0?=
 =?us-ascii?Q?mQRXD4CCvRYI391Y5ma9XBnDvzc4Xkh0NwpYsO688kMhKeU5wde9zqsQGNeL?=
 =?us-ascii?Q?/SWElmiBYAHtvEKjoj5xfFRKi634a0+/Zz/h6MnfMexCFH1tdkSSjPbbDdEw?=
 =?us-ascii?Q?BaWKoOK0HMa5HvjEhNusqmvonZrTNLIZ8Sn8bZK3YbqUEF5JugSzA3khB4BW?=
 =?us-ascii?Q?PjPlP02Pzrp/L1ZnbTJopxLyu5x4pu4zfRAjsQqxOY/TAT5GE8DtYGl4rY81?=
 =?us-ascii?Q?+X0dWCPzx0HRHeM7sMwj4PEh6gwX2mdiCzLuQJuiJLyuAJMM+Ek12i8SCqxa?=
 =?us-ascii?Q?K1UUx6lI/oUSClPr953dee7wGKnsHUxTL1WMHgNOPd4jcmfZhSzxyIXf7TNi?=
 =?us-ascii?Q?MrlqzvZVxwEI/479QUq8O+nlg7sMmOqEVkax+8DCqFGTiari8V7gR8HaGWGD?=
 =?us-ascii?Q?xSDxlVpyT5YOYo6WGNAZBrNrxOOMNq/TO37XHTFnWw+XfPX1H+ZQVoifQITZ?=
 =?us-ascii?Q?mz2VCb455vXoQ8ncjU+dyZlxWMC9m7XtREMvTcer6dUUUTQgWiwYTD68Vctm?=
 =?us-ascii?Q?hxO4npdi4eAwoM5Pf6zjwl0kvpgk3nn6d0mlYH3f798bGorrZk29UKHFPIHQ?=
 =?us-ascii?Q?Ez9laDfeIrnqwOzzukOFgeP1I97bRTSRExyuCsABHNviXB5CQg9YqqhQa0Ga?=
 =?us-ascii?Q?ION3fne1DRlaqcLJOPrqkIh+sr05o24N4V1gtGdDOzKTZE4Vt4szPo841+4w?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Kdcy3rK3TMNAPP2NNon6bQXKjGKdxObd1OzfU49jIJmA2Q8uUVhNkwZZK2KgknUEPO1brycsPu2LWLhFtq/0M9gCiMJNOMt25FPXgNx7oKE6vR6DQe/J4OsRRi6Se5oKlmransjsU+Zmwh9LxXeT+KCXaaYnVZYITlrp6IdWel/3+Q69SvoJK4ISaZcPaxrz9DF6vv8PQI/xUoOgdzH2vwueg8o6j7h09jptbL95gE9CW1/OgeUqzv0kh4ya93gC7R3HB7dcwp+lvMS8IczbNnEs/qewlCbCCqIWOPo7jNsoPZqhCjyviZgwUHq9H8aAtt+aYuZUsKmFEzEL3Pd3wyJx82R/MRytojKlNtdC/Zb0ndBY+3jg/IhzNU18iXmQ0XXvw0yCM1dJ/Dj++z62Ge02zgLkNWayxu94TAdL7vSUjn/Y9gPhBQOErh2kgoGyMWa31VTDaOiFu2hhsYDnTBZCD7bCPYBbMxKoh9AYyxJ8vBf8+o6ewhAHfEyMEbtsfXdUWilVK0n7kkFwcV3Lg8OpbpZ5R4hApfQBRZDL9TmJ4uK8X2iJYD40gwf2h83Tcdsknfn4YT3FGdMkZN1458tQE/VaC0M3CfXgwHDKPck=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e79106bc-524d-46fb-45af-08ddae53e70c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 10:35:53.9024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FJp5SQtAobr8ReXWl1wE9JKk0uPhdHfZeKSX6MWeppMI4LYdXC0Iqq4gdWSsJjIZrMEKJ2ZnnNdQ+QzL6ltGGAjMyjyCXMoe3WApg06Okck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4709
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_04,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506180090
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDA4OSBTYWx0ZWRfX3yMO5vn13frE EJWdQQzmgXiqWjpn40COwvVuNBpgCqLvBaSDu7MvEZKX6qY9qdZln/mVz8EeTiiVG1MAowUQ+7/ NRgzv/jTrgRdn5CX9l0sca+h1JV9nD+kd90rzRdRNfhWAc6F/U4ubpxVJFiKXA66CrklOfkHQyW
 4cd3vlPn/G3neFOyf+gAr6q8Bq9giLWI8kXdCK+HtHAIGwABVSJLsREIYvyLuNW8n35PQ8JMT4T yCbPr8Mjp06bAiyoydlOUQ+wiVM5K6po+L3+MJ6BKF7Kg6hc3mwhFCLKqoV0goVJoWNBgLsQLzI 0BnXJ4Nore43Cg3wGHIyer4NFWrKWXGJURazWvcV/pFgIwQIrrNWXCygH2o3aNv9JZzw6dwo53U
 9I1nNh9dJvQ+j0flpidEw41hHrGR/Rxfa3m+jmBHRn03qB2+uYWiGuvslqJ18vV2NMeLER+D
X-Authority-Analysis: v=2.4 cv=DM2P4zNb c=1 sm=1 tr=0 ts=6852968d cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=8nIee4S1PvsaDspnmgwA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: -pHKB1j8X3Oe0JEiYZvqlivrRaiAAB3F
X-Proofpoint-ORIG-GUID: -pHKB1j8X3Oe0JEiYZvqlivrRaiAAB3F

On Wed, Jun 18, 2025 at 09:42:09AM +0800, Yunshui Jiang wrote:
> From: jiangyunshui <jiangyunshui@kylinos.cn>
>
> Since commit bcd51a3c679d ("hugetlb: lazy page table copies
> in fork()"), the logic about judging whether to copy
> page table inside func copy_page_range has been extracted
> into a separate func vma_needs_copy. While this change
> improves code readability, it also incurs more function call
> overhead, especially where fork() were frequently called.
>
> Inline func vma_needs_copy to optimize the copy_page_range
> performance. Given that func vma_needs_copy is only called
> by copy_page_range, inlining it would not cause unacceptable
> code bloat.
>
> Testing was done with the byte-unixbench spawn benchmark
> (which frequently calls fork). I measured 1.7% improvement
> on x86 and 1.8% improvement on arm64.

As per others you are going to need to provide details of your compiler
setup because modern compilers are inlining this already.

if it's ye olde compiler I'm not sure this is justified...

>
> Signed-off-by: jiangyunshui <jiangyunshui@kylinos.cn>
> ---
>  mm/memory.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/memory.c b/mm/memory.c
> index 8eba595056fe..d15b07f96ab1 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -1337,7 +1337,7 @@ copy_p4d_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
>   * false when we can speed up fork() by allowing lazy page faults later until
>   * when the child accesses the memory range.
>   */
> -static bool
> +static __always_inline bool
>  vma_needs_copy(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
>  {

This needs to live in vma.h probably... todo++...

>  	/*
> --
> 2.47.1
>
