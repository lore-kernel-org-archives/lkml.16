Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A781E13AC1
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 12:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748520892; cv=fail; b=a4jFeZrnUGxkPdMAe0mZcCgGQLCI+EhTrmFYWbw9q+Nql06VVKffFJlr4LgwGU4Vg01h+oRHML9eyzcRay1bfe+Tlhgq0lXA7WBjSc7V59KJNjF8AitXLyvBS/1YT9gM8hHY57CrEP12tiezAbLl1vR5LZRzck4M0AqoV/Zh5w0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748520892; c=relaxed/simple;
	bh=+RT7KDL2uq4EA9fAUy/0Hoe4G2HFgYpiAGkgiuYZ1Fk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eGNNsy99edix63rWqsJFuTpB0UZhUNV16yVS4bts5ehE2k92vnPZdRydcnN9CMSvJ91s53f8Z2UeGtXsQXCvuBGAU8lQbSVH6zDcBzGL2LLAu6GHdGDOmXmsDY81Z8NJ/wVgbBVi9Zt1QKO5K5Mj4rtPacViu5qXKKVBq/v23RA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lccsdRXN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=AfiC8oaE; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lccsdRXN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="AfiC8oaE"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T7twiv026879;
	Thu, 29 May 2025 12:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ptSdUYSIN42YKW0EJP
	ty4M/oF6rHifOcL8zj7nyPmaA=; b=lccsdRXNI7LCHYnKeQcOGkanfAB8VYuyBd
	pvYZj1wrDCqTXvPvw9DH+9uZdTO3xOO1iHjPfm+6cCokrjgfEhPIJF3KPNzl1H3E
	W+RJaJHn/2BZH6TkkFSgr38lYSy7hRJdOvns+jjDPD0Zg2Y6HjN9AzaaUuUqylpZ
	xncgeMfFu5sRyxmSp+xyAjSOgqkcKPE6ktPzKxHxTMCh/scFvmaMnsF0EdhKaUh+
	mDiVZJurRXsYYTWe8zADqviH5PslldxKvNnht8Ca6ZF/lM8MRZiTiw9qvE454+8q
	8jmpY2YOzsSmS2nu0NwNaK0n72rPJiCY+ijNclvVL/XvH03VA/RA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v3pd7we5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 May 2025 12:14:35 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54TBgvQR028661;
	Thu, 29 May 2025 12:14:34 GMT
Received: from cy4pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11010066.outbound.protection.outlook.com [40.93.198.66])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46u4jbn03a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 May 2025 12:14:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CV/qr2MQyPUeNkkCESp49TWfW2kAGms+c9xC4DB+wEnSipjQ0kyAvNKFAlLlaAeaDecZbyRJ4raefVtOgd1j6y/fB21tOcvnfoQKq/aiHKoAite/jLENZEk2LaXjvoAPLJNmq6FmWdHt9iK5XXJzAzzFk8Ggv+zWhIGMzJoaY00ddh0ICj72prLHPgbV+y4sf+UqD6/IFmXgeIwf7ns3eM34RUjxg0oc4xXsqaagwrk3akbfYbfJDuRZsE8zPlAleWotN9HUYNgfUS/J592vbI2JqTwukBxsnF9E2bdY/nAQL1NL/0ww25Kv90fhtl+mxzY2+pRQS1EGr0L0y6TfPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptSdUYSIN42YKW0EJPty4M/oF6rHifOcL8zj7nyPmaA=;
 b=ruBNibYFXN5yn9N8ZAwI9QUogJbc/VFcbyF7oPthTPKieoM8OE5Inayk+EXWvhV1FA6LiVnTCqUrFHCIdsXqeGX/nviuTv6z/hGNc/q/BDBmyYXUdLduAgJG/7jD6VU91iDF9zi/miIZAtVsqpnAiJN1aOUWv0RjIiWQqosZTSdTERdIKycmgVD5gsKGV24fn/Vo3YC6oxoUleIruoaLr8iWPy0OATk2M0a4Pj6djXPbFuto1tD4rBicgCaS1O+BWBFdJVodZOEfKj0vRXaavdoUrwJ3y2ApUAkY7yaDzAEQOcLm7dxDO6ldhOdy7Or5dfoJ0pvZBT7GtzmAl788eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ptSdUYSIN42YKW0EJPty4M/oF6rHifOcL8zj7nyPmaA=;
 b=AfiC8oaE0d9kexDbixNdyiHLm60weIudQcDqqIhjnvS+vAgO71x/OweZwR6alhtg3tVBI+quZ6qHIdgyinBk/iegiKk1gSDKq/cqp/QlwLGtFTTa71DYycbYZsI8mAe+5e+okOfPds+wNFG28hs9sPuOyl7qi7QFTMBEtIJ6kLM=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS7PR10MB5072.namprd10.prod.outlook.com (2603:10b6:5:3b1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Thu, 29 May
 2025 12:14:32 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Thu, 29 May 2025
 12:14:32 +0000
Date: Thu, 29 May 2025 13:14:27 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
        Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] MAINTAINERS: add mm memory policy section
Message-ID: <449f6faa-d858-4ce1-955d-021005677f1a@lucifer.local>
References: <20250513160007.132378-1-lorenzo.stoakes@oracle.com>
 <xuk53vslmg2lserkjew6rudlgrjipmoiybsu5swhoxcdbiaken@pnv3dsuhfoef>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xuk53vslmg2lserkjew6rudlgrjipmoiybsu5swhoxcdbiaken@pnv3dsuhfoef>
X-ClientProxiedBy: LO6P123CA0043.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS7PR10MB5072:EE_
X-MS-Office365-Filtering-Correlation-Id: 90ab9d7d-974f-45a4-a30e-08dd9eaa5e83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6oN2THJJOWgoj4D3boimDMSRWjoSyVvNB7dwTsMMXr9DiHAI1/F81NpdAHhQ?=
 =?us-ascii?Q?xZZLhz0uQ8EQxOjWZtgAFl0L+ngKxf/yzMZiNt4gDY2WNrDXyp0pqIodtqi0?=
 =?us-ascii?Q?q9MHzqodRY1SVdtHpBcaWXqiFiFdWWjtYxc6S3hlGL1dO68ZYjSsx3JlLkch?=
 =?us-ascii?Q?5YAOltVfGVZKLRLHsFFmQ/GXH4gNMOeNs555eiqV5xO0PVITS2h3cwAsymob?=
 =?us-ascii?Q?wakmR5cGTEnQciOQYpBlmhFiApXk49+LHuIL3Q9YQsGoS0DKF6jbbEc+wBPH?=
 =?us-ascii?Q?8miqVTIkBaUlW+uzUZ9GRHu8cQ+3/wzswTHPPZT5MzG1mXI06VSuL1x6ExqD?=
 =?us-ascii?Q?7o90TPXHapUQGyO0okcqytKXFG0dIhntsuM6vv9KQ82uRvQfSj9FqP0sL8pS?=
 =?us-ascii?Q?B/gvWy55G/bRccrKuJcjZ/vY49xt/TfvU+SPwMAjuvuwCFEwTHq/08HkAgNH?=
 =?us-ascii?Q?a6ji1vSAgT642KR2+wZcMlmFoq39pj/viIp6kdAzj9YRqif0db0nnCt1Opz4?=
 =?us-ascii?Q?w31pT73MuIk1iLuUb1tFmhRBlqtI57I0N5PdXIL+LB24AAsRzzeKZarBMQMH?=
 =?us-ascii?Q?sUeFn/aSVuZh9F/Tt0BN1VymKLD5dnGJz/EjAvkkB8UmTBeeSloP8ME/5VS9?=
 =?us-ascii?Q?HrKd9NSQYn/i2YSxvJ3+kv9DvlWMqSiqur4o1pSQMeyLC1+gV9+KGf27vUJA?=
 =?us-ascii?Q?AjOW9xhMSmBOTH24clpFu4ND/tSuIiw/Nj0R6NB+V9wPTv26RpnjHDWv2jgp?=
 =?us-ascii?Q?6iM7h7wAtPquN7EZHI2VdxyFhsWSOXJ8WFX0sNFcKwLyPloaU5pr77sVuKt2?=
 =?us-ascii?Q?Cb0eF4deP2cCRH6QPPImhGZz+t6wpJbuPMoQcEUwxrRPH8fb6QOSVvYyV4S+?=
 =?us-ascii?Q?p8PGs7m5ScJhvpvqICYUNyld2ZbTo0sqQONjIvyH9hiiVgHvX/wf/jfx8cuf?=
 =?us-ascii?Q?+fjYfbypnUyQDGCAnuodW6rypIoTXt/AGFi17Q5AFpJ6EA0qSww9ALgub5sv?=
 =?us-ascii?Q?0eVIuJYlHnnKJxWj1LNGRjqbLlThpujP3KjB6UeND/7nnZzyD5Uw65VxglWL?=
 =?us-ascii?Q?zpvS2FuHs/Ny1vw96ksuajWctX5XovVd4RaYSJ/KPWqTHWnUjPtI7lXeLbnm?=
 =?us-ascii?Q?x8BoeS2nJwzsayFDFkFnT34fIAz+4hxfFKGTe3Pn6wR6hOgvCZVmJx+93rl+?=
 =?us-ascii?Q?2tNXMch6tVRjnCtbd5/573ViV8c9FQ6cdZ/gwVPj8htlNRw47ywXCInS8Ngk?=
 =?us-ascii?Q?kq4F5sGZ3nt/iT3aqyturDi5X1Igou98LrNWIatQ+viV0MgzVFFvKHWgDgO6?=
 =?us-ascii?Q?Y2iKWYzqbZ2OfidpJoFU6+JXdgvr6/lkXAFMsWIXs4zH3yfs5cBeYLMF+6Xn?=
 =?us-ascii?Q?idMnWrk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IhLhwBuatX8aAnpd46o3Xgnt+gJvZmOCBtCBDTh9s1XhpFtQvkFCzAG04yLp?=
 =?us-ascii?Q?50AvdgrFn0Yoqrt/a5hvtl13PW7fa2369+rPDyYLSVYDfvsNzlvGwDN0NuN2?=
 =?us-ascii?Q?PIyEmtrpuHOgEUjoRpUhPq9z0sTOWF6VAqqWeO5To+/A4tJfp5rGqdHL3AuH?=
 =?us-ascii?Q?HS8o4WEb4NnOYphWZ0K4iO4f5HFzd1Izh23fTuUwJARnxDFQ6S7eb+qGFADp?=
 =?us-ascii?Q?fzaW7/izAEIguCYv7kklNa14K/pOu/S6fnHLZjIVinffn1frKZTnNayeO8+p?=
 =?us-ascii?Q?7vUS9GfAxvmw7JgqucQ1hpniCnJm5MJs8OeEYJh7nE2jqq5j1CIAqWNtMNbU?=
 =?us-ascii?Q?PISMsg5T4pv9r4cDO1a9mPuucjU65GnUIZShsplU/2sgMGoy7e2G4gbOP6KF?=
 =?us-ascii?Q?zfiteFNWsFCWmitrfhc8rk4y/ClOWUNOZAsxLfuTVRDDvAQadpmZU9bNc8zh?=
 =?us-ascii?Q?fBH14CjHN14+euYe/p7dAaV54Y31EnYJvUtr681bOgBzvFJYz3TisyAAki65?=
 =?us-ascii?Q?siVzOVOQvGE1CCAkiMNhrcAth6xXdQBohBKES5jm9EOyvg2Tyj4A3ITWDk3I?=
 =?us-ascii?Q?oJzWoI5+a3wGsZDRHgsXeJwATSbnw16SGVRLaHLSLEdI38M1i7tRsyK+80DT?=
 =?us-ascii?Q?dEeZlT8f8SEoZDNgWCexCd+0wE0kJOWpff8LPfBxh91c5eAliH5XcQ8WWMop?=
 =?us-ascii?Q?KMDxG3IIZ5BX5pNfeTvKq3l9HNqgc2p7XFf9WgmOMWjyhPTnoHviLTlThXJH?=
 =?us-ascii?Q?zomjAqnQMAPMgTGzxUHVorZjkFdkDbfs/WdLAoThnSP6ylaVdWSAEF4vVOKT?=
 =?us-ascii?Q?ofVkfaXQcVJq4Tk821FS8Y3uF6soalB7X6C1aVMcCQ6ajMTRLnmbITupcz1W?=
 =?us-ascii?Q?d5gJFchd+N+mv3aPmMXXgA41HVSfXEdyVvSM6N9rc/r5hcgykZ06+wdgNWo/?=
 =?us-ascii?Q?0xpZUAuNJYourUYOlB09YVDOoZ8JOMR0h5DRHSq506l4cHwH4eqfnVXOUdy6?=
 =?us-ascii?Q?J+oIp1WCquFPs4vFgt9unk4wfqIXdi8Ynq8AtyGiGmsc4ZVzqvTHJUKUIa1B?=
 =?us-ascii?Q?nO1EhCLUhCTxTEyq6igsSVGWIdmUuPIKZLt37cQ/zzbOdsl4+XEWn8/DQLWn?=
 =?us-ascii?Q?LHZY+EoNTNt+s2uRhE7a2dtw2qdhwUWv0zP9b6/UHvdFxeBKPQ6VPFCjXCWJ?=
 =?us-ascii?Q?HqkNQ+c6CHDqBZ/cS2C+oYNSVdEU5rYmbwu/vT6dWePRxP+r25Y3GcWUOsGo?=
 =?us-ascii?Q?MR0UhnMScOv9fOivUdvwocpIVQLqj/yV8ynOsBUpF1jNBIAPHvDU8XujAlJP?=
 =?us-ascii?Q?B6wDQ6dL+6Rhj9dYO5eWUSdBNGS36hOciGxxV0s4qv9MB9KpYdfmy7oBsL3o?=
 =?us-ascii?Q?4L1uzN6gtPmnlhVghu1mvMcwLcBrML2sDxpC/Gxz22K7xGMJa+psuJLTFYYu?=
 =?us-ascii?Q?N0R4nnqIZ4c83fMtCcyLO1OV/wh3U623SUS0AsyI6sqyuNrux0kjxA3Gk1fD?=
 =?us-ascii?Q?14X47u5Wmhni6nJ7liZs9Fa47Yb3+tVZOkL3iWaHXe9TvtJfBBCdRZXNEjnn?=
 =?us-ascii?Q?r3IQyj34N2ILIu+ffkvN2MIoCyDdWSJP+HcjwsJTHPPP4AbqbRpVnOtqfL9W?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	U95g0u6PxH5Kau5RLlDLbx3X7wgPltvowUKArGef6QjgKWhD6V4WAkvgf9MNG6AS4sYE1vhDSRHfFQstCLTAhXq9nJ2t2EJHiwyjpNeNMevhgzNdd3kvQdVy5EI996zhIGrzbBWJd0t5qRmmL1dDYzw8mhxYodbQxx23cXAkzzGGlyzU2qcLnTGFKWBudvS5gEjARLUcuX9mkTlkUs81a+5o6MbQK9qI2NqW5bFGsFsQC7poM14Pyl59o2Kuy+scX9QJp1o4D0qPalHYZkUAywYqdm+FiNiNGSA31RNovoDkxAGW7fyXWo7gPg3Z+EnzBdqAmfACpr7clkrEyMoNWX2ibdCvJBHX+L6RVIyoRc/NrdGAGk2QkvZdepJaPbQnjP1tAIlE7phQ2TqY/LoVotAH0UhkEx2qeLiKhZHlMD9J26826QXTbEjQYVk/fRzpGrj49j9sfbEjhJmtF1P7+EhiSrLb1Dy2Vx8tK88V6yG2LP6DhMjwSI9XDzkQFYiYh3tGWY3KvoDvzIgplBiPeUvdeW9BuFyIeR2aW/rNOEcqTEHmp+E5J2uq8z+7tIH8ForYB3GGLOWEduBYDzj7fxEXeMICLsOmkOkAIL8et5w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90ab9d7d-974f-45a4-a30e-08dd9eaa5e83
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 12:14:32.4530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K8E0sKXk72U4zfrx6y+dYEswmvCK/ZTKelQzRv+cbTAX+0SG9n0Rj2fQcHaX83mlKUOaiE62rKgLYD4MGOH1xfN9lY/Out153BI6AdT7SZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5072
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_06,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505290119
X-Proofpoint-ORIG-GUID: atOB_jwnXFSc8S4piwWfeZ55icmmO9V6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDExOSBTYWx0ZWRfX8mu3c61PDorC mdBA6CqPwADnRc/kswoNtYrNOEvRrqiPU+6boWriGa8623+XRFtJLA1mQuVt3Pf71nHSJSVxpp2 8xhNlyjbu1Izbji9T0kNoZzzAgoDWhfBYttYhORlTQDHlsPeJY4gZfH/cCFYRVEgmXIKAbirkSF
 6MkPm780Hta3Pc9jAcO15pGoZ1CB24dG2t1W38tTG8aFVWdb1/wXN03zucw99u8aXberhw/q2Aw eRO9U6XNQE/D6tDr5pN0vi1PQXnmwZLJERjaY/X8fXb7b/+znYHz2BR/e8QakJdXuV38rtmZkve sDdgDv2dJSJQFX1aS4DyaEV3FIKqu7wVMDhDMcDZ7X0LovuPmO04L8KyNRuld61KvqGhJ7YDweb
 HHFag6BFBIhIsoA7V5Ibbwfa5UmSbw0VP16nAJd6MNvAwC3sYgd5axnvfSpghXyue52jf4bw
X-Authority-Analysis: v=2.4 cv=UZNRSLSN c=1 sm=1 tr=0 ts=68384fab cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=1-S1nHsFAAAA:8 a=yPCof4ZbAAAA:8 a=VwQbUJbxAAAA:8 a=Z4Rwk6OoAAAA:8 a=20KFwNOVAAAA:8 a=Ikd4Dj_1AAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8
 a=ph6IYJdgAAAA:8 a=37rDS-QxAAAA:8 a=nOxXOvtx0BQsksFG-DYA:9 a=CjuIK1q_8ugA:10 a=gK44uIRsrOYWoX5St5dO:22 a=HkZW87K1Qel5hWWM3VKY:22 a=ty6LBwuTSqq6QlXLCppH:22 a=k1Nq6YrhK2t884LQW06G:22
X-Proofpoint-GUID: atOB_jwnXFSc8S4piwWfeZ55icmmO9V6

On Thu, May 29, 2025 at 03:54:58PM +1000, Alistair Popple wrote:
> On Tue, May 13, 2025 at 05:00:07PM +0100, Lorenzo Stoakes wrote:
> > As part of the ongoing efforts to sub-divide memory management
> > maintainership and reviewership, establish a section for memory policy and
> > migration and add appropriate maintainers and reviewers.
> >
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > ---
> >
> > REVIEWERS NOTES:
> >
> > I took a look through git blame, past commits, etc. and came up with what
> > seems to be a reasonable list of people here, if you don't feel you ought
> > to be here, or if you feel anybody is missing (including yourself!) let me
> > know :)
> >
> > David has kindly already agreed to be co-maintainer for this section.
> >
> >  MAINTAINERS | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 80aa09f2e735..29d73593038c 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15567,6 +15567,24 @@ W:	http://www.linux-mm.org
> >  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> >  F:	mm/gup.c
> >
> > +MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION
> > +M:	Andrew Morton <akpm@linux-foundation.org>
> > +M:	David Hildenbrand <david@redhat.com>
> > +R:	Zi Yan <ziy@nvidia.com>
> > +R:	Alistair Popple <apopple@nvidia.com>
>
> I'm particularly familiar with mm/migrate.c and mm/migrate_device.c so:
>
> Acked-by: Alistair Popple <apopple@nvidia.com>

Ah sorry Alistair, I ended up having to leave you off as you hadn't got
back in time and I couldn't send this upstream without your ack.

You can send a patch adding yourself and cc'ing people here and I'll
happily ack, or I can send one for you with this ack attached, let me know
which you prefer!

Cheers, Lorenzo

>
> > +R:	Matthew Brost <matthew.brost@intel.com>
> > +R:	Joshua Hahn <joshua.hahnjy@gmail.com>
> > +R:	Rakie Kim <rakie.kim@sk.com>
> > +L:	linux-mm@kvack.org
> > +S:	Maintained
> > +W:	http://www.linux-mm.org
> > +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> > +F:	include/linux/mempolicy.h
> > +F:	include/linux/migrate.h
> > +F:	mm/mempolicy.c
> > +F:	mm/migrate.c
> > +F:	mm/migrate_device.c
> >  MEMORY MANAGEMENT - NUMA MEMBLOCKS AND NUMA EMULATION
> >  M:	Andrew Morton <akpm@linux-foundation.org>
> >  M:	Mike Rapoport <rppt@kernel.org>
> > --
> > 2.49.0
