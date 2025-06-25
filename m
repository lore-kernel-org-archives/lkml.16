Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287B825D53E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750857174; cv=fail; b=gA7+K3KIR1B5+A7Bv1J2Epm4oFT7TTS/0/k7kozl2Lb/YPePyuDOauw41Oba/XdR9aPHZgaM5L7TCqKHcX5QwcW7kQz+tJgmxWVWCopLhKQ50Isvon1+GeBpQ8Ulp1TPbZkrAip6FOIvsa+tiIK8PzY3E20j27joJoNKjSb6Pc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750857174; c=relaxed/simple;
	bh=fPAXAyAn+Fgnuj4aUDIHsGbutAYmbGB8oMpLtJl15OY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AULsCU0AeLgL8ENpRMjE6Iakem/XDvPnCB8AJ1SYlAUxmonWhkL/qrd2xwiBj/wr2wTMqZaN0fIt4aJuU/6DS/yYXMvDJG6IodI6PzRRjWoW4A2GVOA+3PXPz72im6MPR2tkqENeLJTO7owsJ83ZT6WOQEFt9icY0OpJfZ5pqTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=I5XSJllA; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WF8O7vFw; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="I5XSJllA";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WF8O7vFw"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAq9Mr011688;
	Wed, 25 Jun 2025 13:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=rONhWUCG7O86EFWy5Z
	ccJIzopHrujgC2YDZRcGgVXYQ=; b=I5XSJllAgD0GsIvWWH0IgtKLgcUdws/5lp
	2u/msGjt0p34g1aN2grNrtF08GEfqt3U9bP2aynWuKzlRSrCYzEnrOoQ5M2B515q
	xnT2n79UyEsGpeTV188h2zrWtiglVKEqzVLo+CwDkkP5EZ7wFxOj1+3eG2nBXQ7G
	dVdNps/eE4chnPgSQm+DVotJA1XyHSS4qpIGqqZ2SK0HBKiX7HlHGLIAFdDwigx5
	Sn8Nv7tRlCQHyFGUMiu+ofdqKTg/oJdmK4C9xMeDsK/7k6vOZvHsbYj3elG6Fn5t
	seFbakFEQH9GRVpo/dKbWV1j8NWNc4TB6l3pz0CjdeMxEsKapyMw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egt5pc8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 13:11:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55PD4jL1034506;
	Wed, 25 Jun 2025 13:11:18 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2062.outbound.protection.outlook.com [40.107.212.62])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehks2ka7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 13:11:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r8CAJMckxSJCRVGRUsTG2VG8vCiBJ9XEZmUlbFNv4thJtoBqFbTkHZ2152pg9RdjyMDgWviZtKM/D+VpfLkvzJCTflbHidAEqSzqDuKYHbsWaU61KzCytvE/LpsPsVqGYCtP9AyPm8Ige9yZjUDP+a/AAFfbF2uCZgHvRlTr0JtWcPixRQmIp/dvYixPJyQ4UeuQ4XCRpRI6QkhJDecFtc1RRHcQbQW93uRkq9cRjEbhnW9Ol+T+oLs1qTH6ruHHC8Eq8aUKIw+qh/RHwKql0pJ/2iFnlAt0fkYZDqhc19/YvdM4MshjsHNia7GhETSRzkvDAfQXqVM1+GqsGTR1IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rONhWUCG7O86EFWy5ZccJIzopHrujgC2YDZRcGgVXYQ=;
 b=b+gSwPg/8Q+cUdJiIDspIpPCrFvs//CN6t907/b5AuW5XUAYUgVEBICp3K8kVqSvrWhOMgpsHt4GnZgymMJFcs2I5LD1aKdMjhtW37FhpznPatVoBzBo9y9ZAMup6VvLnCrXmNRlYRglxGgMV0a4pRoIpvzNY2HmvJu/zM2NOIQdhziQNIzNHL6aDHCQvE/+NMaFYzVmuMNhbxMobOl/E+0T1gS+fLqZXItGfHFdmkBHjoqb/BuNKYUTtgusSzDXx7cWjqn1xVBpC4+3QHFDuvgYGcRiUuQ633A9Cn3Knb13wUAUlkwGcWYjDVevbsIMw/SNAIVZ3pZc629QdtvWTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rONhWUCG7O86EFWy5ZccJIzopHrujgC2YDZRcGgVXYQ=;
 b=WF8O7vFw8/Rwtpu45jTDX1JH93xJMx9lH8RIrqyNWiudfiBHyAirDAwjKeeAcrHgd/2uY3tJzDXfBOH09BspRF61yXIcNmAabjHx6rcJC0Ktq1QwNWK9887KJs4WSxzGsQDF6yWdDSCTdmWZUthFbkdNN0EqEwwYYXXJOsj6Vio=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA1PR10MB7700.namprd10.prod.outlook.com (2603:10b6:806:38f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Wed, 25 Jun
 2025 13:11:10 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 13:11:10 +0000
Date: Wed, 25 Jun 2025 14:11:07 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com,
        baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, baohua@kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] khugepaged: Optimize collapse_pte_mapped_thp()
 for large folios by PTE batching
Message-ID: <71350398-b5d8-45b9-b05c-d2b63030f766@lucifer.local>
References: <20250625055806.82645-1-dev.jain@arm.com>
 <20250625055806.82645-3-dev.jain@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625055806.82645-3-dev.jain@arm.com>
X-ClientProxiedBy: LO4P265CA0201.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::10) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA1PR10MB7700:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b951ed7-f39f-4e93-1a2c-08ddb3e9c129
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6jf7+rBin4FmLPIvxbeq+n+m1loRvj3HVexR30U481j0kULZ7zJM1dDANux3?=
 =?us-ascii?Q?iQrvBzVKSXubkFem25koa31vJMlstY05V4dJjB7lpv/GD31nICbR/KeOeEk0?=
 =?us-ascii?Q?k0Xh/1hc8E0EibLoeU9Ua73ru/6vQt/dQ/t3XUK7MVJHPCDudX00xpPtMls9?=
 =?us-ascii?Q?B+nbwU5PVGWmXz3tCCNegZTjXIp4gjBqit8P0nU5gPUU/tUsaWHlMYFetnST?=
 =?us-ascii?Q?eRkowqq0HYOTw+j3D7mJBA9gx8z12bdV5JPWHYNI9KtM0p6lKYHZXX+pMxUI?=
 =?us-ascii?Q?4CPIxDMv6HiGQ+CYwU/5cg0ujMU5afGJ5BEtMA6XgdHI/OqNhMFVSgOD0QtE?=
 =?us-ascii?Q?NFEzQt49yC3w7dTQlMKG7yELayIxNPEkFWj7CcgEBLzySEmchsTkBQvLMiCV?=
 =?us-ascii?Q?4+Om1EJKjPSKgnCZ97remsh0CYbEd/NudsFaOjT24fFrF6Tk9hzB457aSMkJ?=
 =?us-ascii?Q?1Zv8eMw6xchfiAAnlFxgH68Vn8mX9i7BpRJvor0ZEYYVsnC5jqVHNjeXGSO1?=
 =?us-ascii?Q?B4vXcYLzPMXx4LREXmLIo8WAJMf0/JVvLn5QtQjmOAZUMWCQL4Z9RT395A8U?=
 =?us-ascii?Q?Ye0S8k3a/BicSKfeR7/2btrX3172AQfrtR2k5iJ7whoP1mPmtIrAx5RylZS6?=
 =?us-ascii?Q?glRJdJ03DmIXUktclHd5pW/cS1kJRAtFTM33aVKR+ut3Kss/xYUPJ24Fm7x7?=
 =?us-ascii?Q?DM1Wh4aFbIG9lrCBRDTSb+MhomO7faX+YYnxKowuf9t+8GSTeL28KY/IEMgn?=
 =?us-ascii?Q?PGsvUPp2h5pSpZ4G6b0HGiBu581fgduJuyOL3yDjT1n67wGWExoBVDet/16t?=
 =?us-ascii?Q?8P2sWK1i0T6AdX0Z/swCwpOxA9bBkH1Yua3W9P7x2QjfnN5ysg2zmE8DVIuX?=
 =?us-ascii?Q?5TUuLCeD7t1LP8S1kg+F/BXccH3Z+DpxE4kgWTpRkwL03GE5evM2VlGhDmjm?=
 =?us-ascii?Q?BAddqDam84DkQ9CYqNu7TmYNEdFQuWVBkd+8QPC5H823MVSdBcjMAp5zGWxL?=
 =?us-ascii?Q?rJW3iv2fcqZPDkcIEzc7OVKf8WWYCOuuHkYPS9t9cdnBM5JSCFxMA00qBysm?=
 =?us-ascii?Q?pq0F80y8TV9CkGgmV3ly1oB3KQBZnxOIJ689Cia606YLvAdNRgafycaU/B9b?=
 =?us-ascii?Q?hzpR9pVCcrYng7jOpc44GUbKbhJB1z0I46uufJMdOpzsECqutxJ9eu05chZQ?=
 =?us-ascii?Q?6tt5lauXqZnMd+MRHzHAr6k1DBRqzMHEbSKYWx5z/txvNh+hOOr6DPBReba0?=
 =?us-ascii?Q?y92UrGv2jWgUY6fYnQwQTl3GhF1QqqjQCoejm8fE8SGUcEkzO0x8XCCLZFJ8?=
 =?us-ascii?Q?XSzybcwXKt6fD7qYs++tbVHf6b/mWFxTijtYD0gfns7jIgQC5CPgG67hnaEt?=
 =?us-ascii?Q?mYlwudvMpg2lkHMmKzV0nEcd4aXAarSrkPPk3tSVQGKFhK7b+A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c7ynPQOBB1Njel0QcJpX+xGm2cocW1yl4Hmp7mvoy5Y+gY73bK8ZpSvKpkbw?=
 =?us-ascii?Q?xJo0KuZVZiKaCPLaTp3jRa7MNwUp/gk954P1wU/tszKmFuJjaAb3aVylTBj6?=
 =?us-ascii?Q?hvzLAT5Zxwjwni4pmONHX/vrN6ltqjY5xMcGI8UHVZQBfDL35M1P1ebx1dh4?=
 =?us-ascii?Q?5gneYLCtjdWDLTUL3F7ZpSw+kLogpV3OewOvotNOWH67PrEL7I1JzBStPYFE?=
 =?us-ascii?Q?o/mcOBKLMxqGNUII2sDrNr3TV9bVkfLtiKHZc0weackzQxtADk+sWsiv9BaB?=
 =?us-ascii?Q?vAW1OBM5pWtZcCkBg8QVf10QLT8ko2NGRuuMpRg66lAXtd0d+jcJs15cCVmF?=
 =?us-ascii?Q?OBs3bSnMLPWZiRPhngJoEbH71zHADPfRjbOBLLRcyt8nJrqFZLFaRmWguu6d?=
 =?us-ascii?Q?2JDywHGEvOa/cIzFTFksJSt86HjAwP4AZfNcGLwQJyXmowEKWCWB7Qk3N5Ds?=
 =?us-ascii?Q?xfWX78UrNqHqGNkK4g4hNQQWpACMfsY1jXWmzGS4sc9s7e/cdJA5hcxwmLoV?=
 =?us-ascii?Q?5FY1XoSXAgrZDa4j+xwIGrK3o5iVU40dF4ukClxLczjTqpbDoBuxAy4gI8QM?=
 =?us-ascii?Q?bXsyysVkz9yMmk8pAJAUdw5tQGwHfKs4BBtEd+slKks/S2BnjmvOuXW+ZTc9?=
 =?us-ascii?Q?Uit9L947mqeBrFaeWk541Jil2cUgewVmnzcekLWd1DZxj+SPCks4pwiSoEEf?=
 =?us-ascii?Q?1g6EN3ER0BtkdPtPh3wKK8Fqy8yO7XMmyRRh9/axhCEZ9oCSGO1EgFtkQQ10?=
 =?us-ascii?Q?jH8n6yAOsJSp2m9U/TFlWPz5k9KTVH7SJv15yU4iWuX6O6HBlKVqFosdfpzi?=
 =?us-ascii?Q?niy6B4gZcXZyiSjOGoaAkuinLCJBXkMrgxrjWM+ELXMQD6/dCP+qIeLRalFb?=
 =?us-ascii?Q?buaKH1iiZK+Cn7HGyVr262R1UgIYYO3GrwbbsaRMqQrkNucfm23Z1Lyfs/UO?=
 =?us-ascii?Q?uaVub/VN4ibxK6sLHVbv1+jr5qV/CKXpRLh4PO+pV0g+abmDF6uVw9gczalS?=
 =?us-ascii?Q?cxFv3Bo3Gd/WdXHmCEK8zEhtWrWmfXjrNcEnA1Zc+qf7otXo85D64Vthc63Y?=
 =?us-ascii?Q?dWNj8B/pSCpCLcvf8b/VpAWbUANIWvAUMQr28ssfDJv5p6vnNFBRw/x8v8Vg?=
 =?us-ascii?Q?xIDhpoRopmQuize3uv2lVMmbIMPDug91uXJChGPhwUQ9sP3ZsSFgS230oUle?=
 =?us-ascii?Q?1gb9oY6myy+BJFAISwnY0iwPGaA8Kb37MutY6xCaq8u82ct2+8jJS3RlD4Bp?=
 =?us-ascii?Q?eRctx7Q0j1mL2/opcSMuUZuP6vjRc/b2tPSY2qXwbve5v4b79Hm5QW/wKsFB?=
 =?us-ascii?Q?aJE0nWhe+fIVucdUSgjpO0kw3sH2pU7DRfQ5OyTIVp7qJnq4ed5GtXxJtLh9?=
 =?us-ascii?Q?mVnvzr/ORsPDm3S6eAABNwR6WQOpMXK1egcdZP/815NdQlKTQx2wUIlEiu6z?=
 =?us-ascii?Q?2wL16ALAczz5aLsZKesDYM+vi2AZfJlVNic70pS4o2KLGhvzzKf2Av2bg3Gh?=
 =?us-ascii?Q?swlOlzJP4/LotcN4YG/tf2C0yJx7xszxpUQ3phSQ5xMynT0DYoNRrAF4JtBm?=
 =?us-ascii?Q?SNy+CIn17sTf9YdFRTFAiuKs3bpV1ina81xjlafNR4l/jeBJ2t4DFeNVAELk?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	l2yml8GNSFM/mgsbnEyBm2BBIN9XadUHgqb+bxEn7LdPNYWlE9hhcmWG/yEQX7IjHY/IeIXE8YhCqZ3e3Sw59z9TarM7bdrywEQKiebwjOtaFHkM+gdJdoYQccGbYEcCtduxgxsWKhqt1Rb13w+jn6DZznRUjkqlYM7wms2jaepvaKMFix6LMORfzvEzdC8odNj1/lI3SUOfsCS8lDZQVld4qdgyanTfgR7+iZ0CtF6Ng7tcrWvFJvlFbQ63WuVCQu1vrUMSQpcSls6Mj5s/DieCicOqYRiVMhcLuKWn32mYQwl3M6PViOCQ7WUDBWd5QG/A0aXctnxehUNju4YnKqN2vEiUZH2rI9h0zRFbVN3VE9ECzJ3PKXjeVyc199UKCU2/5BDxZExefiIgQkm/JSUDSAtSt1db5g5weqsuzppojlA3lo+dBJ8CttiNAiU7qtAOyB6mg+xaqmzXe74M4c5vBUGhfJtOeqSI4U0rgFUriAEkoZQKpt09lHFvV5Z0NNNnaz63AGpTnHWACCs28KODNLd4XW8gSCYEJP5ct10ePVUp4JSaoaQdnL6kJciCHj+2v0/Klkf+J52u5LIFXHbThRt0mEjOx3ryz/LkmcQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b951ed7-f39f-4e93-1a2c-08ddb3e9c129
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 13:11:10.6576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IZ6KQpqYV91fgg1K+E4c5saL7Yuff0Fy42TeB+L7vFLguBqzyVkiprSG3hQ0bcJKvKjx2v6YPEDajGW6nMo9phVcqYBAYvcQY/P7jruiSkQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7700
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=954 bulkscore=0
 suspectscore=0 adultscore=0 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506250096
X-Proofpoint-GUID: eyQ2U2OIjNSk8kucdV6EkwvlPO_vk_0R
X-Authority-Analysis: v=2.4 cv=PMYP+eqC c=1 sm=1 tr=0 ts=685bf577 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=f4_-Xsd2_II-RSI_TIMA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 cc=ntf awl=host:13216
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA5NyBTYWx0ZWRfX4tQhWC019qHX jCELyGfN80j5GmudC/q8sWfRB2Pm3gYa4arSUHpv9mzXcn3vjXnGzowLcWpicycGSlt1e0qguWn Y7SDuSFesiYg3//xMTFH09MP/FGn7Wy4fMszYWt5RYaXe5IT6YVhwuXMkvhtN7hXDKeNgu3ugsA
 1S+b+WS069q/CV9qBpLNA2TQWF5SJqs8scTOZiFpqZx9sxz0MZDtdm58GWWd1MN8Ha0jZSUJSYN iSD/sQUa5YUdgqewEMcDckC031sQ2HJ0oHlTK/Iml3+fSLylltQ1MlbPgorjlInjA4AjvH2KGZV Y86uPO/No0x72aHDwJR9An73ENFgi/dA2VsoGWyxoN9lt4TZV+6CFS0iSlaAHynChN6DHiyanY6
 uEj795K/cg3rVLcUb4WQduMCzSicdRWCBnXPWGP9iSEXF/PpshmcQKA5GGLqWnE4IgN6IZ8F
X-Proofpoint-ORIG-GUID: eyQ2U2OIjNSk8kucdV6EkwvlPO_vk_0R

On Wed, Jun 25, 2025 at 11:28:05AM +0530, Dev Jain wrote:
> Use PTE batching to optimize collapse_pte_mapped_thp().
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
> Note that we do not need to make a change to the check
> "if (folio_page(folio, i) != page)"; if i'th page of the folio is equal
> to the first page of our batch, then i + 1, .... i + nr_batch_ptes - 1
> pages of the folio will be equal to the corresponding pages of our
> batch mapping consecutive pages.
>
> No issues were observed with mm-selftests.
>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  mm/khugepaged.c | 38 ++++++++++++++++++++++++++------------
>  1 file changed, 26 insertions(+), 12 deletions(-)
>
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 3944b112d452..4c8d33abfbd8 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -1499,15 +1499,16 @@ static int set_huge_pmd(struct vm_area_struct *vma, unsigned long addr,
>  int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>  			    bool install_pmd)
>  {
> +	int nr_mapped_ptes = 0, nr_batch_ptes, result = SCAN_FAIL;
>  	struct mmu_notifier_range range;
>  	bool notified = false;
>  	unsigned long haddr = addr & HPAGE_PMD_MASK;
> +	unsigned long end = haddr + HPAGE_PMD_SIZE;
>  	struct vm_area_struct *vma = vma_lookup(mm, haddr);
>  	struct folio *folio;
>  	pte_t *start_pte, *pte;
>  	pmd_t *pmd, pgt_pmd;
>  	spinlock_t *pml = NULL, *ptl;
> -	int nr_ptes = 0, result = SCAN_FAIL;
>  	int i;
>
>  	mmap_assert_locked(mm);
> @@ -1621,11 +1622,17 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>  		goto abort;
>
>  	/* step 2: clear page table and adjust rmap */
> -	for (i = 0, addr = haddr, pte = start_pte;
> -	     i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE, pte++) {
> +	for (i = 0, addr = haddr, pte = start_pte; i < HPAGE_PMD_NR;
> +	     i += nr_batch_ptes, addr += nr_batch_ptes * PAGE_SIZE,
> +	     pte += nr_batch_ptes) {
> +		const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> +		int max_nr_batch_ptes = (end - addr) >> PAGE_SHIFT;
> +		struct folio *mapped_folio;
>  		struct page *page;
>  		pte_t ptent = ptep_get(pte);
>
> +		nr_batch_ptes = 1;
> +
>  		if (pte_none(ptent))
>  			continue;
>  		/*
> @@ -1639,26 +1646,33 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>  			goto abort;
>  		}
>  		page = vm_normal_page(vma, addr, ptent);
> +		mapped_folio = page_folio(page);
> +
>  		if (folio_page(folio, i) != page)
>  			goto abort;

Isn't this asserting that folio == mapped_folio here? We're saying page is the
ith page of folio, so why do we need to look up mapped_folio?

>
> +		mapped_folio = page_folio(page);

You're assigning this twice.

> +		nr_batch_ptes = folio_pte_batch(mapped_folio, addr, pte, ptent,
> +						max_nr_batch_ptes, flags,
> +						NULL, NULL, NULL);
> +
>  		/*
>  		 * Must clear entry, or a racing truncate may re-remove it.
>  		 * TLB flush can be left until pmdp_collapse_flush() does it.
>  		 * PTE dirty? Shmem page is already dirty; file is read-only.
>  		 */
> -		ptep_clear(mm, addr, pte);
> -		folio_remove_rmap_pte(folio, page, vma);
> -		nr_ptes++;
> +		clear_full_ptes(mm, addr, pte, nr_batch_ptes, /* full = */ false);
> +		folio_remove_rmap_ptes(folio, page, nr_batch_ptes, vma);
> +		nr_mapped_ptes += nr_batch_ptes;
>  	}
>
>  	if (!pml)
>  		spin_unlock(ptl);
>
>  	/* step 3: set proper refcount and mm_counters. */
> -	if (nr_ptes) {
> -		folio_ref_sub(folio, nr_ptes);
> -		add_mm_counter(mm, mm_counter_file(folio), -nr_ptes);
> +	if (nr_mapped_ptes) {
> +		folio_ref_sub(folio, nr_mapped_ptes);
> +		add_mm_counter(mm, mm_counter_file(folio), -nr_mapped_ptes);
>  	}
>
>  	/* step 4: remove empty page table */
> @@ -1691,10 +1705,10 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>  			: SCAN_SUCCEED;
>  	goto drop_folio;
>  abort:
> -	if (nr_ptes) {
> +	if (nr_mapped_ptes) {

I know it's ironic coming from me :P but I'm not sure why we need to churn this
up by renaming?

>  		flush_tlb_mm(mm);
> -		folio_ref_sub(folio, nr_ptes);
> -		add_mm_counter(mm, mm_counter_file(folio), -nr_ptes);
> +		folio_ref_sub(folio, nr_mapped_ptes);
> +		add_mm_counter(mm, mm_counter_file(folio), -nr_mapped_ptes);
>  	}
>  unlock:
>  	if (start_pte)
> --
> 2.30.2
>
V
