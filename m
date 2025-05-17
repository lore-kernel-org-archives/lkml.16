Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C0B19B3EC;
	Sat, 17 May 2025 19:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747508576; cv=fail; b=nCcShP8uCxarIps4cLNRYAU3OIdPDDiAi1s0kMsoKcszxVxGRL8MWoGAurq10e8BoKalbmi1X465vPEhC3+3eGSijIjsEPeZsGSTKYC5cbSRIpAQuX0OFTEVSKa8yTAYGuNFLQ8lzv3r0pGRVqiRVUwKn8uRJ0T74EI6gmZkybc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747508576; c=relaxed/simple;
	bh=RgFzI/lWW0oUGR4vDRfs5KUhV1vUQ0bhIlWcSLdzgvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pPVW1cEa79hnnInK3hE1ySCGibLEoGY054TpTSXBrTbI0DxEb6NEd8lqAIAIQ4XFddenjxMTesBbWd/GyhKjgvBKBMdr6fvgfNE+tdj0rzWXACHDlW0RVfA3uBHiOaKv7bEr0a3SEGZWyUyYD1Ui/WQQvAOB/Q+Tlq+qKyopCxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cJwKYiwd; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=M2+XnFP4; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cJwKYiwd";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="M2+XnFP4"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54HDFPXr001461;
	Sat, 17 May 2025 19:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=JJsldmu8oVRpeBXr4r
	Xyuw3BYnDYKzyGwXnLV9/plTc=; b=cJwKYiwdfEpHEbAV+C0alGCaXDpRLOQb6o
	AT05jV5SywMoLOReMpKJ4nNr1CDsX++dSu13hodyT8AcVC7h4LycXuOR7tIgF/ho
	89wMtya46DVMmlQ2x8CvyWsoQmkGk5xkMA6HaPL2xHszpoLJZiAObknQ7BxjHdTw
	35Bb0xqZhHNmqJV3PbbJXUuu5GvQwVt3cjUBXbKYO2P3otQ2Q9VWcKUvCUGTGsY8
	+dTBaUFdFzCF7+ISvwBxVKN6D74mZ4hnVL1IS92waIdFzXv+HkCqORVCfO9TcAP/
	eOT/llyI7zyHTYPKQ6G7ZEh4UAVoBrApI9cuRQHx3zgrCLo1Xk5Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46phcdrhwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 17 May 2025 19:01:59 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54HI2LIs010783;
	Sat, 17 May 2025 19:01:57 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazlp17012037.outbound.protection.outlook.com [40.93.1.37])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46pgw5dh33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 17 May 2025 19:01:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cwr9QLXMhFiqdlVeMCajSF+FBh4I1a2eaxoyLsIaP2q1SVRvQOJO/q5Ud1xPxn6vy/Pd6J71LarQqyUVfeoZcXVxa7aMqNiA5dguPlYoaw64tIKjNuRRRvMCIpb0h1wPnV46l60oywZRHek9F+bhGoPpcHJjAtN4O+0FOsQft/FfdwqPFMyWrPXiuTq3UQkPfjOtRe6TVt4WYSi2PahuneacJRlAFtY2GIgQILpifskjO0Chufg7mVj7wsLmi+Hoa7g06RXtgkoXXeE8IfEQrhV0N9tWewHTgy/180MiGLmGa2u846Iq7RIhQJfxz251nOD9aLIAffAXD8dX0JuA/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJsldmu8oVRpeBXr4rXyuw3BYnDYKzyGwXnLV9/plTc=;
 b=X8/k5njC6prlbGgQF2QvImBLaHcpSNzYI38HsKYIwLWZkywfi3eHLqAPINfOAz5VbZfm3JMXHPdFMWKlIrR9mV7Z7Uua9EgGwOXMSJOYAYXr2ghZ66cTZ9nG3iJ4XYRjMiza5VmxJ64cFZrQDfv65t4T5m0P2QjnWKtMg6IHqITP99oDeAKs4CuHXYFX2RI3pxoHu9ZcIDyZFEm8xHLVuqRaEg/xH1gaAB94a9P1t5vUwWSX1fpubIm5KpGS3/QAhZ32qjH3UO4xNhLFlnBi7HzpgCchRMsmIE3RUegY+TrbXzkrdov+t9tIfu2TwO+QwXDBkxBSC0UKyN1x6vqdeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJsldmu8oVRpeBXr4rXyuw3BYnDYKzyGwXnLV9/plTc=;
 b=M2+XnFP4kXeACzEMolYtQvVtPc5UexT0DaxnjS/MS/CSddA8CJG3WGHgZCh8kRSrjMmPNj50InyH4nJUbcMrb4DChWfxJpK/1xrZFGsMRBC7oKvKdN7ECscLDNRDAl+mWHSo1eX9i5CcLU6Vc2ODLGBL7A8rmYYKQ4PFT/nmd3c=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SN7PR10MB6668.namprd10.prod.outlook.com (2603:10b6:806:29a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Sat, 17 May
 2025 19:01:54 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8699.022; Sat, 17 May 2025
 19:01:54 +0000
Date: Sat, 17 May 2025 20:01:52 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Usama Arif <usamaarif642@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
        ziy@nvidia.com, laoar.shao@gmail.com, baolin.wang@linux.alibaba.com,
        Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@meta.com, SeongJae Park <sj@kernel.org>
Subject: Re: [PATCH 1/6] prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the
 process
Message-ID: <e3ba284c-3cb1-42c1-a0ba-9c59374d0541@lucifer.local>
References: <ddc0dd46-8541-4d4a-ac59-287e11e1d3ff@gmail.com>
 <02ead03b-339b-45c8-b252-d31a66501c39@lucifer.local>
 <3a2a329d-2592-4e31-a763-d87dcd925966@redhat.com>
 <8ea288f2-5196-41f9-bd65-e29f22bb29e8@lucifer.local>
 <5f77366d-e100-46bb-ac85-aa4b216eb2cf@redhat.com>
 <cbc95f9b-1c13-45ec-8d34-38544d3f2dd3@lucifer.local>
 <8f0a22c2-3176-4942-994d-58d940901ecf@redhat.com>
 <1a175a2c-8afa-4995-9dec-e3e7cf1efc72@lucifer.local>
 <d8a7644b-6ec5-48bd-9789-cb5017075690@redhat.com>
 <c390dd7e-0770-4d29-bb0e-f410ff6678e3@lucifer.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c390dd7e-0770-4d29-bb0e-f410ff6678e3@lucifer.local>
X-ClientProxiedBy: LO4P302CA0020.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::9) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SN7PR10MB6668:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a81d5eb-fb11-4c22-8b6c-08dd957549e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Jun+J5QvV5MC2EyJLCH4dVy1FLAYQ7zrGQnRnURL9iat9fj4P3r5mBYOg+n/?=
 =?us-ascii?Q?6M0AZhbgL7I+PkmlWRKqTMr8z27UISxlB7aGA+eWlBqPshNwhVPtBgB+gqtQ?=
 =?us-ascii?Q?q6PpvizMss29WKcn3mltsALLWOQJowIjiQsUOKQm8I532t5S6W+xkEoKgEro?=
 =?us-ascii?Q?NKHPLpmoeTX1cUvcZem61Juu6P5ySIKpUPUT0bFkk38i8skycIYnz2zEyFTG?=
 =?us-ascii?Q?+HA+nUcKxtDUENqJzUrPBG8bfsjskRpzq8wchJl/UMTqyl8lCa4TOWMn19g0?=
 =?us-ascii?Q?UNmaAmgTi7bPn25uArY0nbbVnYqsKWMSmMplJWeGiqcw35nKnYwVlbP7Fw8S?=
 =?us-ascii?Q?kKTO/lGdgphL5D8vd+0nj37z1g48nvr63/JM35GxxIf7zfZLOUZOzZWFQUM1?=
 =?us-ascii?Q?WaIOLhzQDJ15Gp2UjnRCy93ILsCgZ5a88/j5FqvDb03wu65lNWLT5fKuB6Ph?=
 =?us-ascii?Q?5KaXmL5YJQRCwXXZPm2FTAnAK1Bqazxbr8HNKmoXeMS0JiTJumXL3UZEXBx8?=
 =?us-ascii?Q?TMpxWxn7OCyqoExI309VsbxSOf4eTRLClOzKfIHrjM2Rce+O1WVfevcaf6J4?=
 =?us-ascii?Q?UsYdrgpG2T1eYR2JdtA+ht8AKoXknamSIlAd74fjH5e6dL73BYAal6sMtRw+?=
 =?us-ascii?Q?zZXyqDOKFUStr1PC6LCz20zH7Y3yyMmtGjOZtzMWd1wVuN1AMSYr7kDIDECf?=
 =?us-ascii?Q?CAw92QVh1iuN+78axb28SU5OhMncj0o97/rVm+D+bKN37DWLXvcopsaJ/cFm?=
 =?us-ascii?Q?jD7ms4ahCy5oUrc7m/UESai1Powkh732U+e2LmIDvvbKES5jg19aixiqnMmd?=
 =?us-ascii?Q?wgbvXwxMbi6tK8scyjhLmsF/gvutIbl684lxOJO5JWOQdn1AJPErNAK2tT6L?=
 =?us-ascii?Q?LjQiK8kaa8nwsrnBRwuBneD1QFICEBDwjMqSJRPp+wtKim9eVIgNdyh4dbpP?=
 =?us-ascii?Q?sLWauDwomUXh92uKLnmulSZ4081e+K1tNqm1mg0eFLV2vzRmOPYjNaQr4Hsp?=
 =?us-ascii?Q?vGY1nqPhhE+JMAqGCtZgu7vkWXIGVXLOKcdy1foneUlod8wGjboKKhVG1fFF?=
 =?us-ascii?Q?lK4b3so9eJGBwihpXv9rl7ygkkl0uqITnXhlKS3du/sNVVwLPQy+3mH9Nlej?=
 =?us-ascii?Q?m5FIkubA33H4WWoLQMSLhLjAeD8yXHSEh9H0x04u//EgqxeHhw1nNlJnuCzg?=
 =?us-ascii?Q?EU3RVBxtX1/B0tze/X8hXtSi1u5jLfigHLtNehFiMoGXHG6B2VKQZD7xzo8s?=
 =?us-ascii?Q?hOJwOiHnn+BHkjYDkfvm5UI1XQxQxA1LFWBDixdWgxQIhglhCJVLK4ufn0yO?=
 =?us-ascii?Q?9faSick2HAFNs3D7weSCODnzIskd3DGDbzUseREw/K/tYYxtNgXd0lIf3IJO?=
 =?us-ascii?Q?SQdUFdpDmmRWfM1hlt5T5TO1Fr29p4nt1xX9q+RjFc0ODFLWVb61qVfStLnR?=
 =?us-ascii?Q?ZQGY3zprnJc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8JXyGyYUZwNeDdYnEpHYgtWlri2mZDMnDWfnGLzHvfVvQVjNqhpoOQRe4DNc?=
 =?us-ascii?Q?PSbwnSXvCrQ19SnfPGeT6BpE9U72bG6eIDwb2c7YjFBh50etlyWJv11zIi5Z?=
 =?us-ascii?Q?yP80/r21nYmrKTa+aAo9/kIrk+GiEDAED+Ap3EY6S38+/XBZQJEbQkGWkzP7?=
 =?us-ascii?Q?4YNY8Ey3qUrhcK1k70SNacO3EV7kLCLNWnWAox+6Vv36wdGeZIsjY9J0s1LL?=
 =?us-ascii?Q?q20erMeFMXxTBYmZRLx6usnoSd3e5Y7WtYfVH4dzhNQCqhGAMSi1+zmbxqkU?=
 =?us-ascii?Q?4rE0JScMEWLBjL1riKjPY5IY9bBPI/0F97WhL5ykt5Mw53ZF4K80mydsprRN?=
 =?us-ascii?Q?XbMyCV5GuEIsZBNJE7WPeGBaOw2cVPTSqnw63dXi1tq3/CjDl3Nuju2kYlH9?=
 =?us-ascii?Q?1ShNHKhjJkRPRhQ78D4RDY2O1scZSfCKaVAhj6Wloi0IvWlCcTETtV5ys+Hz?=
 =?us-ascii?Q?kO4JirxARxVMo60nxDjWrW8enW1hxqwtUVDV39Z4sJ+LRO3TGzjVh22f7/RU?=
 =?us-ascii?Q?qUcWHIBquKzez56HmI+cP4ga1EIt85mGs5/z731qRM659mel50cxF0566BiJ?=
 =?us-ascii?Q?hzwGw3P5foTESn+Y4WGvlYAWIE3kG9qMb7YotOCRu0PTbUwUnDdBHngYILW/?=
 =?us-ascii?Q?BvY0CWz0UYF2vR3T+BSBrQZc4pKnsS1p/J7mp9F1gjwS+lvHn9NOxfRwCahz?=
 =?us-ascii?Q?CKYRTLuk/bz5Z83KKnArVF9y8RcAyaBgw0G449jt1/dCeJ7xmG1NcefB1NGp?=
 =?us-ascii?Q?dPgPfEGPrw3WUuhMLxxQBWh1P48nI2YuT/QQr4Po8iBacakZw7vfYdTj/70r?=
 =?us-ascii?Q?m7wQEPpC1osW6yTcsMKBuUhH6xDOx8acng8EGla88rzFsG2QEGI3EBwxa1Hb?=
 =?us-ascii?Q?xnPOwDOJk4Pf9WXG1IoWoPzYiP0u7fkitsljUFBA/tkzXpJmdEsMrrpkdJnL?=
 =?us-ascii?Q?S8TkIrhBh/XziRAYrSdDsAp9/aeLfddbXNi6JUJKVznIWoqDoJNoxTM0Bwd/?=
 =?us-ascii?Q?45+9/mYFrmFHKKm/BkQMOh5TY8nA1di4Xw4sV+8JFcO1i4BTFFgOMyl2/dbW?=
 =?us-ascii?Q?w7cFYQbq/CKIG6FpnX/9GjWSnNpvk5nCEJqXWFAKIZmY9tPiQG0fx3VmKrdZ?=
 =?us-ascii?Q?p8icfcx79gDAUnOaqpyhFrSohuS+m3uSDQ/Byaau7CKUGv69CxjXhvFEdi9b?=
 =?us-ascii?Q?uv2nv/eRhTQbQ76b9rW+XIK0wUIwy9moUJF4LSMNu2lAjQJnFRxTB57aYGxT?=
 =?us-ascii?Q?qUrKR7iU304jg2+FK7e/t73Zsla2odr6yLMSkXu0YEqbQVuRoukPq0NTlHkm?=
 =?us-ascii?Q?qk6sWHP1dXvqeDsr4GMEOyOzErbDEvKhDmDE6xzJO5p0fjRIYeH2U0MWnQ7A?=
 =?us-ascii?Q?gwx0BkTCQrtigXioxDdLqafHeD4yr6BSrbnjoC9h34PJOnI6XiyDXAj9XNjW?=
 =?us-ascii?Q?7DpotiIryY4Fc0Pm+X/djTOwgqxnw5k/OqGFOdIKQ58gM6cIi7rzLH9Td3MQ?=
 =?us-ascii?Q?/GryiXrDBMgDd3/K7UH0rYqMS4leB4+guqnlx6/YC8ZhQSqjy/2xCEE18Z9a?=
 =?us-ascii?Q?Lh6HwmztE7tieHBinnSS6BDougS9MLFlunH/HR2i9t0WlpWqsOfgXkO4agaw?=
 =?us-ascii?Q?SA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	y6nZm8IjCbohYlrIU/94W3LwdSN1cNPnyv+VszVCYyKq7GSRov74vw5QBEBkMUqTWxtf9o7bEGgNUA2Dze7UxDFdMEzhihJ9iz6qEAzgDQmmox/gVgRA16VzdbhcckD9hI+bD896eYuKilbdS8/6Ceto6VYpGpymurQEEeJTnh/B6sXU/kmqYoUI6wjaeGMr29Ryul8Z03gj9YLuTpuWNI2YKRP4T9yeM1aVr+BhBYscGx/BJNVaNwC/v8CL7MARQvc+i8aIezSbq5Ak+lN3z54hyqNoPq1ukhJlF1JU+XOPgvgWfZ70dxKCT7liiDZoSaNZbalOijF0L6V+dSkqYBBl6We1WU+GWVkU1v4m1+M/r2aGsX/leV/7cVLjSRDyAJZqmm7CNEEcSv50vmDWur2on7NLPK2OeDLaVwCC549uFfIxhfWXJdkKFnzgW5XrcYZ/oQgUNB8DzcH4dCeEh20JjbGO1aHq2Le8GEAu2G3a12QD27aGJftSQDWX2Roy9cLfHX6dh2NOHQ3GSbsYEMpDDkgclKT8Hd1yTKQO2T+JF906u9HBcAzvapeQEMGz99KU2gD/l7qV1XVrBW7mgajJsqBDYtycrW5UQ0IIcAc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a81d5eb-fb11-4c22-8b6c-08dd957549e6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 19:01:54.0955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dcN8T/62ZKsDq5LpqUm/kbj1yGpKQzX+QE5ooSrjKN1VYe37vXWXT16oWq+SAuUBX9y2ef+N2IzmcbRRoPDUKA8/FRBxuH/HXH+29bIt2JY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6668
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-17_09,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 adultscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505070000
 definitions=main-2505170188
X-Authority-Analysis: v=2.4 cv=a6gw9VSF c=1 sm=1 tr=0 ts=6828dd27 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=5wUg_z5pde_nhKtLdxEA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14694
X-Proofpoint-GUID: 2BiLFvx_yFgtknSbRzdZ6J-Vew_rWURH
X-Proofpoint-ORIG-GUID: 2BiLFvx_yFgtknSbRzdZ6J-Vew_rWURH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE3MDE4OCBTYWx0ZWRfX2tkIAJ/Rp2qf tJ/nqR7be+pz9tXBHDUptU6JDhQZ2o4RYrOKHGxpiXF2OsutlGEkyyQuigsD+TFY9O0hPc2CNcF MrmI5JOxnIQAmuCYqrkrThcYuS7btZ/hc8adGgDLgfphoMH6vHmKFB5UUgaxz0E30AOer77mlef
 G3dKhCwCaj+uzMTsX2Ry4JvHlB+5lkbYmje79MWcGysHOfzGfEa9tnCCI32US71JpBJfVlIIUi9 lZ6CQkukCH09ALObfksmo88kD3yNYLLIy56RW/+oX/fh4ozUv1Lo/AdfjdA+J0l3zSGeOqGrDls QDFLr6SSMOTvJbQaT99f0VzMCL+xet9ZYpyaWh6APYZIrg7KVoujKfVJSftmmxg3or/RX7goJfC
 rOZhlzaPcobzIhwUsc4IsBbfIpCZTosZngpm1YPgQrJD1eKzucX0sxhzcj1DsB7b2xtusQJ2

+cc SJ.

On Fri, May 16, 2025 at 01:57:18PM +0100, Lorenzo Stoakes wrote:
> On Fri, May 16, 2025 at 01:24:18PM +0200, David Hildenbrand wrote:
> > Looking forward to hearing what your magic thinking cap can do! :)
>
> OK so just to say at the outset, this is purely playing around with a
> theoretical idea here, so if it's crazy just let me know :))
>
> Right now madvise() has limited utility because:
>
> - You have little control over how the operation is done
> - You get little feedback about what's actually succeeded or not
> - While you can perform multiple operations at once via process_madvise(),
>   even to the current process (after my changes to extend it), it's limited
>   to a single advice over 8 ranges.

SJ raised the point that I am just wrong about this (see [0]).

So this makes the interface even more compelling in my view, we can either:

1. Simply remove the 'madvise_ranges' stuff below, and replace with an iovec,
   and simply forward that to process_madvise() (simpler, probably preferable).
2. Keep it as-is so we get to perform _multiple_ advice operations in a batch.
3. Use an iovec but also have some other array specifying operations to get the
   same thing, but maybe extend process_madvise()?

I really like the idea however of just - using the existing process_madvise()
code - picking up all the recent improvements - avoiding duplication, etc.

The key idea of this interface is more-so being able to control certain
behaviours (such as stopping on gaps etc.)

Yet Another (TM) alternative would be to use the -currently unused-
process_madvise() flags field to specify options as mentioned here, including
the 'set default' thing.

Now _that_ is really interesting actually.

It will give us less flexibility, but require a much much less major change.

OK damn, that's quite compelling... maybe I will do an RFC patch for that... :)

Happy to hear thoughts on it...

[0]: https://lore.kernel.org/all/20250517162048.36347-1-sj@kernel.org/

> - You can't say 'ignore errors just try'
> - You get the weird gap behaviour.
>
> So the concept is - make everything explicit and add a new syscall that
> wraps the existing madvise() stuff and addresses all the above issues.
>
> Specifically pertinent to the case at hand - also add a 'set_default'
> boolean (you'll see shortly exactly where) to also tell madvise() to make
> all future VMAs default to the specified advice. We'll whitelist what we're
> allowed to use here and should be able to use mm->def_flags.
>
> So the idea is we'll use a helper struct-configured function (hey, it's me,
> I <3 helper structs so of course) like:
>
> int madvise_ranges(struct madvise_range_control *ctl);
>
> With the data structures as follows (untested, etc. etc.):
>
> enum madvise_range_type {
> 	MADVISE_RANGE_SINGLE,
> 	MADVISE_RANGE_MULTI,
> 	MADVISE_RANGE_ALL,
> };
>
> struct madvise_range {
> 	const void *addr;
> 	size_t size;
> 	int advice;
> };
>
> struct madvise_ranges {
> 	const struct madvise_range *arr;
> 	size_t count;
> };
>
> struct madvise_range_stats {
> 	struct madvise_range range;
> 	bool success;
> 	bool partial;
> };
>
> struct madvise_ranges_stats {
> 	unsigned long nr_mappings_advised;
> 	unsigned long nr_mappings_skipped;
> 	unsigned long nr_pages_advised;
> 	unsigned long nr_pages_skipped;
> 	unsigned long nr_gaps;
>
> 	/*
> 	 * Useful for madvise_range_control->ignore_errors:
> 	 *
> 	 * If non-NULL, points to an array of size equal to the number of ranges
> 	 * specified. Indiciates the specified range, whether it succeeded, and
> 	 * whether that success was partial (that is, the range specified
> 	 * multiple mappings, only some of which had advice applied
> 	 * successfully).
> 	 *
> 	 * Not valid for MADVISE_RANGE_ALL.
> 	 */
>  	struct madvise_range_stats *per_range_stats;
>
> 	/* Error details. */
> 	int err;
> 	unsigned long failed_address;
> 	size_t offset; /* If multi, at which offset did this occur? */
> };
>
> struct madvise_ranges_control {
> 	int version; /* Allow future updates to API. */
>
> 	enum madvise_range_type type;
>
> 	union {
> 		struct madvise_range range; /* MADVISE_RANGE_SINGLE */
> 		struct madvise_ranges ranges; /* MADVISE_RANGE_MULTI */
> 		struct all { /* MADVISE_RANGE_ALL */
> 			int advice;
> 			/*
> 			 * If set, also have all future mappings have this applied by default.
> 			 *
> 			 * Only whitelisted advice may set this, otherwise -EINVAL will be returned.
> 			 */
> 			bool set_default;
> 		};
> 	};
> 	struct madvise_ranges_stats *stats; /* If non-NULL, report information about operation. */
>
> 	int pidfd; /* If is_remote set, the remote process. */
>
> 	/* Options. */
> 	bool is_remote :1; /* Target remote process as specified by pidfd. */
> 	bool ignore_errors :1; /* If error occurs applying advice, carry on to next VMA. */
> 	bool single_mapping_only :1; /* Error out if any range is not a single VMA. */
> 	bool stop_on_gap :1; /* Stop operation if input range includes unmapped memory. */
> };
>
> So the user can specify whether to apply advice to a single range,
> multiple, or the whole address space, with real control over how the operation proceeds.
>
> This basically solves the problem this series tries to address while also
> providing an improved madvise() API at the same time.
>
> Thoughts? Have I finally completely lost my mind?
