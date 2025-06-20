Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23CD2A8C1
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 05:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750396150; cv=fail; b=anR9zOPxMnMWqonlcKldCdbDGSVOuVrf/6pjafwcrmsoedNAF2u2Nb4e5Qna9Ddq920q2L+OZjqqlE8V98GKxj3+NDLl5ibC0Y1+da21E19EfSsjg6bHeiEUJ0awfE0N0WSPpSLVUZ/zGstvuLF75hz5TAc+N5nbmhIJ8135g6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750396150; c=relaxed/simple;
	bh=+mYCwwE7N8OE+XEw/ITf41QH57zo9jt9raUiiJboKQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nG4D7quWht9b4I15Uxyw+dRTmF0JTD54NsdkLdwZU99l7J9KUJdXnabfbmM0NuG+GAl4jP/WtsSC9Dp1xzb1PKk6RgNTloZgaw+uSNXl3MgrgYu9T1ptMKC9Rk+mVcCosB/73SXPLYjnZg4G/DpNbPetQmP00DKr9/yA5WzrMaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oCVo6ui3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SsLGJwXI; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oCVo6ui3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SsLGJwXI"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K2upFu013760;
	Fri, 20 Jun 2025 05:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=SwrQYsA6NjlzJfdf/5
	nu+A2OS7sSl51ni3jG+s1sHZ4=; b=oCVo6ui3r9ChJa317WT1B2CMqHcDQWkteZ
	foQi5YREGYKxIrt74CAaq5HorhZQEAlEotsgDt0jyPp5DOFN/h8pRRK9PoW4iE8H
	uGJwv+wbLH9RfEG3zFb8P9cRH0BMbSzTVnGm28utTHm0j7fjfk/ixtUaxpnPiMR2
	caqxK0HIBZiedN7hr7cIx1XlrRTHrSqFImyUEEDinM4RHiG8nEPSsYt8EJh6B0IZ
	X9vei3KF/3/S7oT9TI/aRR6pbhPSv7zWXH3NuMmltyfyHaRSHxLa0yNTTRCJ2VUK
	tzW2h0kSTEKpcb7lh81t5hymaM09bX2hZnTuCJp+14Hn3VRBIOOA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47914etyck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 05:08:47 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55K504UG021567;
	Fri, 20 Jun 2025 05:08:46 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yhc9r8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 05:08:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ea9nlIVoX9J9ujgtJdQllP0GYx9HiiygmIIL9I2qxLLjkZ2mOq6vjgYWpuNz0j1/218L2O6+k5V8X4MOYclcDKddLCwnh3PGMdM+s5CK+hU9p6SH3ji0vfJ0hWoc/21yq1IZjepEhMa5+OQe6iEQCes8pNpt4FiozmdWKfJwbm+p6i1fwbrWyo5gAy4xRxImkyAmLzqHE16ITr2lMovPkOrQqudB8HRV8ANfr0ao0gf0s2WPT5rKlysjJD/bEjjI/gU4rlwfoGYaF9OCDYDnUAEvGGZbvgpoJlPZUcN5nuTVeaTkIbMf5HPNhlKw8GXPJsCyLwKrB632fUlj80uK6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SwrQYsA6NjlzJfdf/5nu+A2OS7sSl51ni3jG+s1sHZ4=;
 b=TmOi7yxeTEG1t9hTBTlDbOwacPQkXkqThYfy08qO7mpF/XSFBja2+VGav62lDpo1Tfw/OW0j0sWHMdq+1V5SNgfYSmw5oPHbo6S46/FHkhhFerK555jws7lMf3S1Vei/tCAVZWvUU5gIPJ2zMQH9CTArBMBs0475w7fLWL3zfCJZKRi2mi61sqyHPUbX0okAeAGPrB4G28EzgfbNioD1AxcJvoZ8j+sui+Q6FHkYXqCiI62vvzpAKGvMxW9QSZLc3C6W5a6W7SR9FsWs0RmSW1HW+bUF6DqQDj/00vz1l9Yhoe91UUQLmMT/nYITwufbfipi7c1ZnWSKM4g6Q0a+bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SwrQYsA6NjlzJfdf/5nu+A2OS7sSl51ni3jG+s1sHZ4=;
 b=SsLGJwXIpmpEMWgFi4YNFFe9KRtQUAUemtDRA6yKpczEjwMJVUCgyg/TjOqBxPg04EixfTCugBHNdAAczHDQWqhXCHOnK3/drK9O6istKN7UyqCGwcxO7iVVkldiCr+ULwtW5iuseDeVo39ETqelXYA6DHf3MsUNdQ1LyOwLY8w=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by SJ0PR10MB4767.namprd10.prod.outlook.com (2603:10b6:a03:2d1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Fri, 20 Jun
 2025 05:08:16 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%4]) with mapi id 15.20.8857.020; Fri, 20 Jun 2025
 05:08:16 +0000
Date: Fri, 20 Jun 2025 06:08:14 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Lance Yang <ioworker0@gmail.com>, SeongJae Park <sj@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 1/5] mm/madvise: remove the visitor pattern and thread
 anon_vma state
Message-ID: <6cdb0ba2-b340-4849-ac32-876e31beb87b@lucifer.local>
References: <cover.1750363557.git.lorenzo.stoakes@oracle.com>
 <4239e727b98763856b86cbd9eeaa0ba792eb2394.1750363557.git.lorenzo.stoakes@oracle.com>
 <85146A1C-767D-4761-A37D-3F2248F0C7E7@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85146A1C-767D-4761-A37D-3F2248F0C7E7@nvidia.com>
X-ClientProxiedBy: LO4P265CA0227.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::13) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|SJ0PR10MB4767:EE_
X-MS-Office365-Filtering-Correlation-Id: 06042980-7b0b-401d-36df-08ddafb87704
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fXdR4cjrxgl/C33fDQ38VTZt3QcQ4pHX/gpSXFcY8ZDWcLuuBk4qtSVMal7a?=
 =?us-ascii?Q?neZ4C5PfsNZy/68N1JJ1b1FjTPGF2VeVsSG0m0KfvWs2xaRueToFEzr56/AB?=
 =?us-ascii?Q?DFLhYe4tS8OAZhoeT0fh7sUZ3CJPJDShfimbLUHSXh3uW7/qKTE3+39WluYV?=
 =?us-ascii?Q?8CD3hmmDJI8jCHe9bBl6qoPIHgS0saFN5SsPV/wj9KuKWyXtqPPoZqyHJrNc?=
 =?us-ascii?Q?nqFveydxdrTtCO9qlAJWVOIXhfBXADly8D7QPpc3FFNPm3K6Tt8U+PfmuDAO?=
 =?us-ascii?Q?Y3ZhbgjEkU9nZrTCIz3y5WiLbKO4bvHr1NF6PqKGCCvjTr9cLIAJUEisgJIY?=
 =?us-ascii?Q?B/5meTfvujjKdTsLUkq8VAVDpUToWvXUrklZmLAaOpY8njrN6gc2t74v16QK?=
 =?us-ascii?Q?WJOonWMPkLF9B1++OT1jEe1WdkdTtXNgfzM2R13bPG4HVcA+bHbqzUx8SEA9?=
 =?us-ascii?Q?/giMYWbGTuSaP3ZGMkZrcTDlvlflMZCinIA2TYwgZLKWwitZTMhXuztlLeV0?=
 =?us-ascii?Q?3KSJ1qjPuagy7twsRcjxbFP7TFRFvb6HwhsEVzZZO1LFMCr2tyBbyK6+aO8J?=
 =?us-ascii?Q?Acpfr4kTreD/K9EwI8Fr5CkPfprfio8fWfBMtcFvrf/SORsWKuRJn/h+sSQU?=
 =?us-ascii?Q?DlwJ22B06mfBrID5TxZZiL1S6d7k+IKF10dQpQJKNgyF5fX0LlAWoKiPSRpK?=
 =?us-ascii?Q?JBwAZPEdd8FZhsZ9WS/xJZVogZ7nSUf7bQlyR8Aa3cSkg09zleaqsqbXIoCM?=
 =?us-ascii?Q?3mou3CEQQcPWFTYoF6BjLYp6SMMVYZMzzbMyCW+HMBwMbGpVkP3ORQS5rdEO?=
 =?us-ascii?Q?vCySvT3/CD83ORdRU9BvdWQqYwSXQ/godIUqZRAwwScNvEgLUMdnWdpW1H4i?=
 =?us-ascii?Q?zKGRwXjuVzLlvcvZ+7AlBPLbew1noWatCE6etn6oTTy+7DF9A42M/oATs+Ab?=
 =?us-ascii?Q?rvxCGBjymITqTsujCoBOqQT+ZawHRQkPPYpHuaAH7WFRLfuci9OIyNbnmmjD?=
 =?us-ascii?Q?AemYfN/TjKn2voGjEtiSrjdLzemTXr+vO0FuJzKYltDOGva8aXQDUB4KqvQU?=
 =?us-ascii?Q?lBBxgNeaM1BEGdCj7Lm498DFhS3g6jIWU/UkMkU6fmXOcNI6gEhJQpH0Qta4?=
 =?us-ascii?Q?jmLvFGHPtrXdp04MfLSrM5mW0Pm0OxTta/6c1NgS2ZxN3cmMPxdFj+qXndIZ?=
 =?us-ascii?Q?4O+L3F1KsfAatX8MyM1/wUnDrqcfOyhWPY61l5IT/TvYkx3m0LjhlZ3TMNEg?=
 =?us-ascii?Q?vk/L8nDka12TZX7LhE3Y3r3nwx/KkFFfrvjKhLmX5B/MqwExi+IA+3NJR4Ti?=
 =?us-ascii?Q?8a445LUCxJeL9MpipCnM/dY/LpCt0x4Wuv+iTrnXyKtWcrEdWYHD3N3ag6KA?=
 =?us-ascii?Q?qbpzlWnz1wVvJ2oaJBakgdFubRKPbAYtPrrW4eAUyTanH870BkRCYrAVTIrw?=
 =?us-ascii?Q?aMxwLGfNdQ8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rpo790SAymDgdKeYsowei8Wc+SVR8Cxcvf+/CoTAVLIpiXiKUT823tScE1+t?=
 =?us-ascii?Q?bsnQ1XnrvSRyVYhOqGQOmyMqLD3r7TwLbcZ1iQalePyCFho36oVPkAS8vx01?=
 =?us-ascii?Q?FCAOMyOWafsWj9PVmOxzC4bYi4pu/HpTCI/8bUwfjj4HTcKrTO1grTb8gW1A?=
 =?us-ascii?Q?LMIl0G9a0Lm1p9ewoevkJEageBvDobpeIAGP3X8HIwY8jJUm8H0DtUmPQgjx?=
 =?us-ascii?Q?+7N/g2iGD9uOcE+GJWnFE6o8cy3KHxZwIKwC72MJ1CnDlpFqythfse5fcGMF?=
 =?us-ascii?Q?hYclTj3Jw+j6oL/lZ0mw3DAf8klL2ULEwxtWGB8cNoVAh41EarReZRe1rm6r?=
 =?us-ascii?Q?X0vozQXXG7m0EwOgmrrZURZ7JiBRRhR3Om2DplLE+O8d9CVu+9s4qDcxEdCC?=
 =?us-ascii?Q?u4V2z/8vZgIhfzLfIPJqN0V3VEbN6rwaehmLOeWTWg5AkhQo7mdUhwD8t2I1?=
 =?us-ascii?Q?V7x10xjEgFa6QZ7/8slS2NyjO6HBeTkLG+SS081MFUttdACNHtByvrUwk2oG?=
 =?us-ascii?Q?URgcwwo+VhqVHvx4xMIfLrIKSlu50Y2wN5vj5vxbrh2JR7m2q3Fd4QD49OCA?=
 =?us-ascii?Q?TdFmJceunxhdg7v6jn3R0ElI561uLMlnxHx+DCH+sGA/+pnj559zJJuAXZOt?=
 =?us-ascii?Q?lNdQHw+7hiBUql8Zk3Q/bodQE2xXUMBNefzeTcdXI5eDZfhu1pue2apjKvXh?=
 =?us-ascii?Q?3gyXOo+wGa9eM6xFWcR/N2bBlle5q8433yOPpPvfVRR8nWd+dhv+yeewGNJs?=
 =?us-ascii?Q?l9YmP5/Tu9P6zzZhwAU5/cAgLGhbaL1+j6PoUCGtnPVaC2/gJlgmGwvAmBm4?=
 =?us-ascii?Q?zNfCFGAF/V1TdFP8ybaFPhJwJiyhKJdcOFuxqbopLJXGJuNmc92ZHRvEi4Go?=
 =?us-ascii?Q?PksWOl+G6Uhduq1T2yZbA7kl6X6eTt6Sr7OArjdNU0kpknCZy24qmrzozZdS?=
 =?us-ascii?Q?BTbzOAvG4LN0NrITGliTumI4egYefutqyyZoo/kHnzBn3fmpTtPdeYKW54tA?=
 =?us-ascii?Q?6vj7I+3ZWpBC5Cabjzzdr/IUGpggRGR+kU0gF7QjpP/XABaYe0d2BqT1rE//?=
 =?us-ascii?Q?TwaV8MIfv/N8SxwWeV0fTMkN0V2PPYt6tAylpZlXaMy0wAoZ1/sderG/ulRO?=
 =?us-ascii?Q?tBPlEFMfIWH/beR4jDereiWDzjN3blGz12qFfzlES2PXaSuVL+wwg0jT221b?=
 =?us-ascii?Q?KOxR81Qve0WSqEmZuyz9y9NA6t34ZfVCCVJpKq6/4GLfAWOzWzA8fkN6JzTm?=
 =?us-ascii?Q?P5eQOFYs5k4iBhdXB6xVeulihsyTph5oPsaPAluTibQLnJX9doaOIFFp9I/Z?=
 =?us-ascii?Q?ctaYmynWWbSHLPn5kBrBaBQpvBc2jsl7/CJfkhrTCTfzUH9297ro0sLsBrkx?=
 =?us-ascii?Q?0A+HEQ/A2Y5LWZDmJuPV517kZtgWn/sXpa4N4t4/k9Nu/GTa8K5qoKulXf9R?=
 =?us-ascii?Q?SkPm2Qwjlz7poIkOQMDS8bnDeNGBzbbVgycxvp4ldFpD4zCGvAN4MbIxcpG8?=
 =?us-ascii?Q?vzzIYrfGspfqe5V4Sa6I9M55Sj9KpcGEYfuQ4qia1FG54TXpWcEi/Gg9vFTs?=
 =?us-ascii?Q?sNuCSzjZI4nmGkFeaAoeEXuTpcORhdAwXQ492WRLks4TQwF2r9Ix4XQAOLhq?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RQu+T4w1Lgh5RM5gIFasetCYH14jEXRJZIEWR4pB8aUU3DU0jj6kBCnFlz+7IXgOhDkEAgRl9kkWFOMyzBxJHERPgvr7YDDYhOhISkL1WcDa4gRSwSSY8oh7FHNCH2ma5E87oZ0x0iybSxDfk3nIujCdvGLXRp1nyyxCfrCqtPEW0cTpW+6dDD+LXR1aoHn4ugZsf26ivt+m5bUnyjtCuZtT/24OGEJwHLTLy7O5nWYLSLjQOTa1IZuwEx/isMvg7gL3IURzmAssIevZQ51G8Ol3ouZkBsrWSl3Svvg7qlk3A3deopKjxJmgPDtPnMBn/A2u3woee6/0IAvt8fg9emmo1K1I5IdTcJ+UTdvFdom8zjFsX9zc+SGlQSN7qSEvl9O+WkEbr0PexI1xaIRy1vQzE5JNj1miPWf3wAggwrh4cqB6VQAXXcU8A9H/D1ZkmCJZPNT3kJsxfWQnDfv321sIV2DgprhSG9uQIQdXJPvl2glo+xPFkaYtiiii/9plLPmMauhRoR0Aydzx542CIfA4gojfpaCWzp3vQaZYdpuoV7gIBHM8ZaN8dScqBrRwnq19T/c7tzjlGaENGpHs+1XBnnymIM9Cae5AvKbSwo0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06042980-7b0b-401d-36df-08ddafb87704
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 05:08:16.3591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qMKvpn9ZLwtWctvrf33imOzXINkv7BGSKgRQQPtpAPUSTrviG+OpmGCW4ICLJVpLMXfVuJy4Y0rEgZuaRhWySFgBCaSbmgbBi8gUP1Jl3jw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4767
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_01,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506200037
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDAzNyBTYWx0ZWRfX9iBshge0/lgE upyFMyqDzjZKINFa4KfE3cq0xJUvu0i3cP4B1QjXFbeTeAwn+hY6E33yjI1tn3km2TLgwFpDTq0 FrvuL4hpxwt5hLlkpg1CVuhxpnUP/NPflIxWOR1oL6NBxWf/Abude8/uXuS58gd1UTecsoM41RO
 WcWXSBNFmayjf6K68r/1GqjHclu5LAGwCmmKTuVDDSADvBC6NX+Mv9x9GshYzUEKuHbdW1I8gkB yZYTTjfQ9kouqT6u7J5a98XbBBx11nUAKAyrfO0ivgVaIbHsr7f8ZQJlCCiZzx8QclOfFdpmD8G BFVpGSIKKp5dxqDH+HevhXlMDmtiDx58wkDIE5OXVVNW8cJYyIUFvBN9PbfvMdvxvBjIuqp9FV0
 50UtgoBHXtdOq/By1yuVgb3s6QNH07MoNSSvEZBqrndKe3mRrNEeyp5OKpj3q0AKd9Z3gRJN
X-Authority-Analysis: v=2.4 cv=U4CSDfru c=1 sm=1 tr=0 ts=6854ecdf cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=XeNmJj5z-VNVUji6zZcA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: MKLCACbPrXAn_1HIn3yL8tqRBE4_YRlW
X-Proofpoint-ORIG-GUID: MKLCACbPrXAn_1HIn3yL8tqRBE4_YRlW

On Thu, Jun 19, 2025 at 09:32:43PM -0400, Zi Yan wrote:
> On 19 Jun 2025, at 16:26, Lorenzo Stoakes wrote:
>
> > Now we have the madvise_behavior helper struct we no longer need to mess
> > around with void* pointers in order to propagate anon_vma_name, and this
> > means we can get rid of the confusing and inconsistent visitor pattern
> > implementation in madvise_vma_anon_name().
> >
> > This means we now have a single state object that threads through most of
> > madvise()'s logic and a single code path which executes the majority of
> > madvise() behaviour (we maintain separate logic for failure injection and
> > memory population for the time being).
> >
> > Note that users cannot inadvertently cause this behaviour to occur, as
> > madvise_behavior_valid() would reject it.
> >
> > Doing this results in a can_modify_vma_madv() check for anonymous VMA name
> > changes, however this will cause no issues as this operation is not
> > prohibited.
> >
> > We can also then reuse more code and drop the redundant
> > madvise_vma_anon_name() function altogether.
> >
> > Additionally separate out behaviours that update VMAs from those that do
> > not.
> >
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > ---
> >  mm/madvise.c | 167 +++++++++++++++++++++++++++------------------------
> >  1 file changed, 90 insertions(+), 77 deletions(-)
> >
> > diff --git a/mm/madvise.c b/mm/madvise.c
> > index 070132f9842b..9dd935d64692 100644
> > --- a/mm/madvise.c
> > +++ b/mm/madvise.c
> > @@ -37,6 +37,9 @@
> >  #include "internal.h"
> >  #include "swap.h"
> >
> > +#define __MADV_SET_ANON_VMA_NAME (-1)
> > +#define __MADV_CLEAR_ANON_VMA_NAME (-2)
> > +
>
> These are stored in madvise_behavior.behavior field and used
> internally. At least you could add a comment in mman-common.h
> about this use, in case someone uses these values for MADV_*.
> Yes, these are large values that are very unlikely to be used,
> but who knows whether one will use them. :)

These are signed integers, so somebody would have to overflow >2.14bn, I don't
think this is really worth commenting there without adding confusion, and at any
rate, even if somebody did do that, madvise_behavior_valid() would catch it :)

>
> >  /*
> >   * Maximum number of attempts we make to install guard pages before we give up
> >   * and return -ERESTARTNOINTR to have userspace try again.
> > @@ -59,9 +62,13 @@ struct madvise_behavior {
> >  	int behavior;
> >  	struct mmu_gather *tlb;
> >  	enum madvise_lock_mode lock_mode;
> > +	struct anon_vma_name *anon_name;
> >  };
> >
> >  #ifdef CONFIG_ANON_VMA_NAME
> > +static int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
> > +		unsigned long end, struct madvise_behavior *madv_behavior);
> > +
> >  struct anon_vma_name *anon_vma_name_alloc(const char *name)
> >  {
> >  	struct anon_vma_name *anon_name;
> > @@ -112,6 +119,48 @@ static int replace_anon_vma_name(struct vm_area_struct *vma,
> >
> >  	return 0;
> >  }
> > +
> > +int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
> > +			  unsigned long len_in, struct anon_vma_name *anon_name)
> > +{
> > +	unsigned long end;
> > +	unsigned long len;
> > +	struct madvise_behavior madv_behavior = {
> > +		.lock_mode = MADVISE_MMAP_WRITE_LOCK,
> > +		.anon_name = anon_name,
> > +	};
> > +
> > +	if (start & ~PAGE_MASK)
> > +		return -EINVAL;
> > +	len = (len_in + ~PAGE_MASK) & PAGE_MASK;
> > +
> > +	/* Check to see whether len was rounded up from small -ve to zero */
> > +	if (len_in && !len)
> > +		return -EINVAL;
> > +
> > +	end = start + len;
> > +	if (end < start)
> > +		return -EINVAL;
> > +
> > +	if (end == start)
> > +		return 0;
> > +
> > +	madv_behavior.behavior =
> > +		anon_name ? __MADV_SET_ANON_VMA_NAME : __MADV_CLEAR_ANON_VMA_NAME;
>
> How are __MADV_SET_ANON_VMA_NAME and __MADV_CLEAR_ANON_VMA_NAME used?
> It seems to me that madvise_vma_behavior() treats them the same.
> Why does anon_name is NULL or not make a difference?

Yeah you're right, I separated out because at one point I thought I needed to to
correctly handle the update vs. other updates but that's not actually the case,
will change.

>
> > +
> > +	return madvise_walk_vmas(mm, start, end, &madv_behavior);
> > +}
> > +
> > +static bool is_anon_vma_name(int behavior)
>
> Maybe update_anon_vma_name()? Otherwise the function reads like
> the behavior can be anon_vma_name.

Ack will change to is_set_anon_vma_name() or something like this to make
clearer.

>
> > +{
> > +	switch (behavior) {
> > +	case __MADV_SET_ANON_VMA_NAME:
> > +	case __MADV_CLEAR_ANON_VMA_NAME:
> > +		return true;
> > +	default:
> > +		return false;
> > +	}
> > +}
> >  #else /* CONFIG_ANON_VMA_NAME */
> >  static int replace_anon_vma_name(struct vm_area_struct *vma,
> >  				 struct anon_vma_name *anon_name)
> > @@ -121,6 +170,11 @@ static int replace_anon_vma_name(struct vm_area_struct *vma,
> >
> >  	return 0;
> >  }
> > +
> > +static bool is_anon_vma_name(int behavior)
> > +{
> > +	return false;
> > +}
> >  #endif /* CONFIG_ANON_VMA_NAME */
> >  /*
> >   * Update the vm_flags on region of a vma, splitting it or merging it as
> > @@ -1252,13 +1306,12 @@ static long madvise_guard_remove(struct vm_area_struct *vma,
> >  static int madvise_vma_behavior(struct vm_area_struct *vma,
> >  				struct vm_area_struct **prev,
> >  				unsigned long start, unsigned long end,
> > -				void *behavior_arg)
> > +				struct madvise_behavior *madv_behavior)
> >  {
> > -	struct madvise_behavior *arg = behavior_arg;
> > -	int behavior = arg->behavior;
> > -	int error;
> > -	struct anon_vma_name *anon_name;
> > +	int behavior = madv_behavior->behavior;
> > +	struct anon_vma_name *anon_name = madv_behavior->anon_name;
> >  	vm_flags_t new_flags = vma->vm_flags;
> > +	int error;
> >
> >  	if (unlikely(!can_modify_vma_madv(vma, behavior)))
> >  		return -EPERM;
> > @@ -1275,7 +1328,17 @@ static int madvise_vma_behavior(struct vm_area_struct *vma,
> >  	case MADV_FREE:
> >  	case MADV_DONTNEED:
> >  	case MADV_DONTNEED_LOCKED:
> > -		return madvise_dontneed_free(vma, prev, start, end, arg);
> > +		return madvise_dontneed_free(vma, prev, start, end,
> > +					     madv_behavior);
> > +	case MADV_COLLAPSE:
> > +		return madvise_collapse(vma, prev, start, end);
> > +	case MADV_GUARD_INSTALL:
> > +		return madvise_guard_install(vma, prev, start, end);
> > +	case MADV_GUARD_REMOVE:
> > +		return madvise_guard_remove(vma, prev, start, end);
> > +
> > +	/* The below behaviours update VMAs via madvise_update_vma(). */
> > +
>
> Great comment and code move!

Thanks!

>
> >  	case MADV_NORMAL:
> >  		new_flags = new_flags & ~VM_RAND_READ & ~VM_SEQ_READ;
> >  		break;
> > @@ -1325,21 +1388,25 @@ static int madvise_vma_behavior(struct vm_area_struct *vma,
> >  		if (error)
> >  			goto out;
> >  		break;
> > -	case MADV_COLLAPSE:
> > -		return madvise_collapse(vma, prev, start, end);
> > -	case MADV_GUARD_INSTALL:
> > -		return madvise_guard_install(vma, prev, start, end);
> > -	case MADV_GUARD_REMOVE:
> > -		return madvise_guard_remove(vma, prev, start, end);
> > +	case __MADV_SET_ANON_VMA_NAME:
> > +	case __MADV_CLEAR_ANON_VMA_NAME:
> > +		/* Only anonymous mappings can be named */
> > +		if (vma->vm_file && !vma_is_anon_shmem(vma))
> > +			return -EBADF;
> > +		break;
> >  	}
>
> __MADV_SET_ANON_VMA_NAME and __MADV_CLEAR_ANON_VMA_NAME are
> used here the code below. I do not see the functional difference
> of them. I understand a NULL anon_name means clear the name,
> but it is also just set the name to NULL.

Yeah you're right this was my mistake :) I had previously felt I should
differentiate as previously the code below was

if (madv_behavior->anon_name) {  ...

Which would have become:

if (behavior != __MADV_CLEAR_ANON_VMA_NAME && madv_behavior->anon_name) {  ...

But then realised we can just check the behavior flag and anyway avoid the
unnecessary get/put by doing this.

Will fixup.

>
> >
> >  	/* We cannot provide prev in this lock mode. */
> > -	VM_WARN_ON_ONCE(arg->lock_mode == MADVISE_VMA_READ_LOCK);
> > -	anon_name = anon_vma_name(vma);
> > -	anon_vma_name_get(anon_name);
> > +	VM_WARN_ON_ONCE(madv_behavior->lock_mode == MADVISE_VMA_READ_LOCK);
> > +
> > +	if (!is_anon_vma_name(behavior)) {
> > +		anon_name = anon_vma_name(vma);
> > +		anon_vma_name_get(anon_name);
> > +	}
> >  	error = madvise_update_vma(vma, prev, start, end, new_flags,
> >  				   anon_name);
> > -	anon_vma_name_put(anon_name);
> > +	if (!is_anon_vma_name(behavior))
> > +		anon_vma_name_put(anon_name);
>
> Otherwise, the rest looks good to me.

Thanks!

>
> --
> Best Regards,
> Yan, Zi
