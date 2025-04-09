Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946911FC8
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 05:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744175835; cv=fail; b=hS/DStOUl6YPeHFFsh0IIIrbxYnYNKxFlVed+ceqV5rkwyxJP8J0bN66ZPEFSCFrv5Z2Qo6HMdCMBg4re79yPULE844z+Mvp0p9LIe746T/svxTRdbNsQBb4VEzsr0ejrYM+Y4niWA3fOq1NGLpFfjvOJuLh5R1gzceU9LXq8NM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744175835; c=relaxed/simple;
	bh=K9fOCVWrKTakWii9rgqqffenU/sZbSTTYbcPiHRkv0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YD62voU6RfIyi2o6gCA6m5MNoMuQdoFTK4jeFT+iqRM50a/bvAWDncfy0akEfFTKc07uBAhRFnZoLKE/cws1cCLL4jVIoZ1KLbk06HPNSmFFwmRV3VeaBbJb/NpjJ7hRA1OeZ3Hv8qYz7QPEh3KbBMGlZr+izTE+ghBuo8NbO0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kPBHvkHV; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=v4TO3A0W; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kPBHvkHV";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="v4TO3A0W"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538LAG3x024746;
	Wed, 9 Apr 2025 05:17:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=fx73xYyErPMNaLiajN
	2UzcGHoumW3/uo68lSv1bg8cg=; b=kPBHvkHVblh4pGFrSeMUe0ju5i17tEawCm
	izn2tt/v/FX/Eu99cOX3V03m8g0HV1Kg9gPuF9LsAFbV9lqOfnp4PnCWmL9XtY2n
	x7m+chYtsGPZTDIP3c5w3Ap4sulFQ8WsI8TnTxUmpwUO1tjbBYBMjyeAXxlrA1N0
	61Ld/HkmaBTF05qMaAm3Sih8gq96E/wxT2WnW6O+RCdNL93hqcWHrUrLDaDB7krr
	7JuaXocXmbpSHk45y8T281iVI8HQdRX1PEhmGx26KW6T5v+yQq87Th/0dm08Nsma
	nZlYWBolpb4v6MdBJWoXwelE/LcKqAtdqHUEvWoNsbECfUxgxR9Q==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45tv4sx9k9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 09 Apr 2025 05:17:01 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 539513Hk001340;
	Wed, 9 Apr 2025 05:17:00 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45ttya9xf8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 09 Apr 2025 05:17:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TNA9KVcCVwbpR4Gr/U8UdfnRr/1dFDLddMMY/9FuF/v8CJqttKmmCiFofG1I6Sokc3Lbjfv8piDODC1vvWoWl6s6zNYOW5VtVL1Ajao/PkY7UV+ThKIJGUKvdz6OqOdgZhOEbmZkKkGW/KoqubhSe0cazjmog3VNAghz0BV42irnmJT64IkFxxYrLwBJplryN6q+igoYrRiZ+qxpDcmH4bBLQ5tiAEaAqNVOyRSBTJQ78tPZYo3vzlkdJf+HOXjXCA2F4mIMK6cX+m+IxAMrEZfxBaYjWJIKZIZcXYw/AQhDWyn7Eb8Dhaubf2zdFrqCUwln5L4kgb611BjfYSufgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fx73xYyErPMNaLiajN2UzcGHoumW3/uo68lSv1bg8cg=;
 b=eIr0DhAKKPK4cdDVPREXKfCEQP8bf97j99v+e3BUimyeEdaokYcRpzD2okIXhvkzvQ8OmqbmdWAEiP1Gx+s5Xki29mjuLGDzQGXYBLro4xQaH94lYEqBHSBltLzX5IqC9RqOUlKmetqrbXaHlN7IbGWe9Yd5jAFNixIHt+rRujItUSAtd8pfWSH+D0EGeLo+hGn4rQ2AEi8LS0Ze52mcbZ0T39R9fyXDM4bTWpwAzznCP1eoOVTha0tLCX4b7oMNi1n1OkocMyPADspgbZnWw0E23CATAxo+sq8qq31MURzgXtT+Y6uXuOHuh5BszpgkZokzf+cQG8CAvOTSi2cwWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fx73xYyErPMNaLiajN2UzcGHoumW3/uo68lSv1bg8cg=;
 b=v4TO3A0WLHVEwyR+5002wkNGnUyoVZKEvZ5jXUNjfcIh0HBArJIqZ08pY6XRBqplMsfoeBw1XG4SlvMZCoFZW5e4lSaDx+mZ1oOW6bcXk19QrRI3Dqhm5irLnnGEMwbIynKH0wdcL8lhrNU8hl/yWbREqPBctfPwDvVMlbf2HnY=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BY5PR10MB4257.namprd10.prod.outlook.com (2603:10b6:a03:211::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Wed, 9 Apr
 2025 05:16:57 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%4]) with mapi id 15.20.8632.017; Wed, 9 Apr 2025
 05:16:57 +0000
Date: Wed, 9 Apr 2025 06:16:52 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
        Jann Horn <jannh@google.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add memory advice section
Message-ID: <f61f8a45-83dc-43cd-abd2-e182e5085359@lucifer.local>
References: <20250408161105.156350-1-lorenzo.stoakes@oracle.com>
 <acwykb6o3cqda46aq6li6jzjq2rovjlsuf25didyln7mfcguws@z3c2p5n6aand>
 <20250408141918.64dadfbb41ada324b042d843@linux-foundation.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408141918.64dadfbb41ada324b042d843@linux-foundation.org>
X-ClientProxiedBy: LO4P265CA0210.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BY5PR10MB4257:EE_
X-MS-Office365-Filtering-Correlation-Id: 59afbd79-9003-45c6-9548-08dd7725bfca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LOY37bRGm7GFNymBm1yBRFRkknCyeUPUNqpOlVR+r41lVW4sVecmmsymwLsa?=
 =?us-ascii?Q?mtVz718pHkUIg7DMnSamWXn+jgdThPatiHt7VIfzvXGoWrtpRDxK2qJA9XP+?=
 =?us-ascii?Q?y1Uq23PYxvb7janR8cxeUFZod7pp6wphjesWFLBIr2cCsMm4VLON/6DcWKVi?=
 =?us-ascii?Q?hFlN8+gTcktbTfg62ToZM5ivWiwDZMpsMbapNRYnRODhwBwLGMPF56gYoBJW?=
 =?us-ascii?Q?TVZXHhXZWw15gRt/DVpNz2H+IzCciudORue92HzZ196FWcEhK79cGVABKeVJ?=
 =?us-ascii?Q?/pY6EbA7jSHMsobc23ZXYCaPkFhFI0YpX9EVU90acvogfwa6fejw9fqbB5et?=
 =?us-ascii?Q?YfXIDSxCawpZ4JZvWW+dohDTV53Nb2TV2ZAz51XO5U/QqvgO7fli6WXvFPu3?=
 =?us-ascii?Q?u47/w8UXpVgSIEKk7jyyon3OsCXqCkUvpFpyzfG7xIumwnQjh1xd3SGdxjIe?=
 =?us-ascii?Q?8jt735XKURxWGLd5dNY+WfnAUCCE8HjVVDS+ubMp3KjAMRtKxtUeRrJQ8fIU?=
 =?us-ascii?Q?1mm8gRmLNCEAb3/hdNpAVt/DtW5mHNBxBFD6q4nCi5E2YrZOoJ0FMB3rknzc?=
 =?us-ascii?Q?CtTe5Y2EGX9sOOKmeuG43rV1GaDxJqEGoX1Hafmr3EhaBj2HTL1TexueMtGR?=
 =?us-ascii?Q?YsbEaThdQudNe+lwBL8/daxnhdCrV1vMww3jIfQ5nNmvGS3dFUId7EVyrUMk?=
 =?us-ascii?Q?ZlxRIio+eyA1h53W75djdJH6fz5XUxY06/M2eUpNXdL3G07bAkVojOjRuWae?=
 =?us-ascii?Q?hCrDyT5YZ27v6B5z1kleVh5bSGNfT7j39mSkCj+Y0HIBQIdxWRmCZdShJvek?=
 =?us-ascii?Q?mMh5PUf9XELaWPWPG0ovd1N0ODWlQUGLVTLhA8bg2r4tx4n3yDXnpl3KNwkw?=
 =?us-ascii?Q?Y3e52F63Hty06r4Ztnk1ZE0zQKGN8CaEMGUKvsdYRuCV8YYuCdIaDBNsgDGf?=
 =?us-ascii?Q?1D3ExuT/0KmViW5clbNDSdPip4GbKmsDzdPG/0pbv0mnm3ga4r0LvQoeVdrC?=
 =?us-ascii?Q?8DM6k5DU0yOJLkqUq8L0VLhC+MhaJKaGnChmQ4gHcJY1w3gvvfBW4z7ykhu3?=
 =?us-ascii?Q?QxMmtGIJ9hsXZ9/OdQQN4fs6K7uROrEpChHwf2PY1YL6vltDACBp4SVnMrCF?=
 =?us-ascii?Q?YlDRRWys22nD0ZLmZWjn2qg1eaMiaU3bQ8BHCK22eguDyxxfD27whtr2nkC6?=
 =?us-ascii?Q?A2WurUzaWV4q2PTqNc2jSKKvWO1JnFnZ2nrh4E+zMfQOWM9zg1g49g6WWiB+?=
 =?us-ascii?Q?3IOmp5kvaPRipeiBjRfvFp8trCmZevqns1/2BApX/ocX+7f8A9P74yMo0TGG?=
 =?us-ascii?Q?QeJO2BO9iHfoSECY3/RXT+gW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GDZlzbtko7Z3/d59qSUvXQ1EwiXz2OKElU17b+mZD9T15L4ZY3CLfSuWC2SQ?=
 =?us-ascii?Q?JtAz/vKTW5BBC/nRx21xbKK8d9GnD+kZjcPSANyGxosvc2Z/9+WOVgQ0juqA?=
 =?us-ascii?Q?zCble8vL7EYNkLgltieVgqQqMS86SzwhnXxWG1NX8hAGpYBrzVPh+RAgt5mY?=
 =?us-ascii?Q?5ruc82QakHvPPZGsJpW4kn+/j9C8R103irZUg3a9BdK+qazqP5uZd2O/uRYZ?=
 =?us-ascii?Q?ndTXlConeCtIZPUg+tc3w/gdg082ZEUiKpF/6Jb5B17AmbGUoKCpw5okwb4F?=
 =?us-ascii?Q?7elRP5C2Ws2gl3y1guT8LxnAWEBg5HXGt+U35Afl8cPkKo02UKCINSHtTuRK?=
 =?us-ascii?Q?q+3MqhbyFhnQ4CkBes3MjwsKOsbmEvwNuBRax24KfY2w/FIeEj06HFjnR004?=
 =?us-ascii?Q?iqXCkfTy2aATXKdxVV7Vbbprsw3ELAr9L4BZmvec2r3u6ZSa4zOB8nGFsg5j?=
 =?us-ascii?Q?DpGXn/UHHDU9kHVwb3IdA+oE9jWzfG+PippbszZk48AeYHHfRCRJ2+Put0gE?=
 =?us-ascii?Q?OS8kV1R7D0zpRXVeJqJs+3w5pX2HZtjGMZLe8ZAeFtlBpBJqudoJRjN0vrhC?=
 =?us-ascii?Q?0jYSwmlinouGVG3To18zmOi2Z0C03IgHGwA356po4IzCYPyoaGaSskd6zyWu?=
 =?us-ascii?Q?zgWtAyqwZtwtyVHpC4at3NuCftqkmHbdt20832T/ZC76ulbIUW0fHpukPkQe?=
 =?us-ascii?Q?8RqYZt6/F12kiLE7XwkKoSRJwxUQ8+z2U9ml3wSTv3BE2OHoc5lCPIQQGk1q?=
 =?us-ascii?Q?ID63moCGTfG/FCTXLOjGoAPqQOMghq2hfhMBdrweDoiMHPqj4NhhwMBF+nn3?=
 =?us-ascii?Q?8Quh5tYzuHiOw+etWh4ZskxdfPBMpD14vBWN8mVzwZAsxcNO3luMXYnNtUhu?=
 =?us-ascii?Q?PnJ1nAbU6xparGSER2+pezPp+yx8jHMlAqvREC7mS7u6ruCCgaymYyFqccq5?=
 =?us-ascii?Q?Km0NKt3oIYu5ak6jXGsH67FkDSjOLa+m1xZ73Ox4Xwy/qlcCMX7ErSKIgEsS?=
 =?us-ascii?Q?2pIqCFK7FmxcN8ijkvVV1jT/KzNj9ElHDcl6mOoUxtX0EiVhLoaQqi5MHMtu?=
 =?us-ascii?Q?AqdyOVk5L+hLOLl+wjOVHCskpFQ9xOeTRAPgRp+dM/4HLbHW9IRSLwXWolLk?=
 =?us-ascii?Q?lXJUH6woSgV9qIQ3JaxbhaRMLyK9P4053iJGE/B77xKHw9ETe5CgFH+rjF2Y?=
 =?us-ascii?Q?yn3d35V1i2iOS/CUtTQl9jAlVWvnTpDZ/Q9P7H8P4D3CGyYLBn4YaNp0HjUp?=
 =?us-ascii?Q?3GwkZuIpAN+8avc6x3Dy47dhROt5aWBSQP1Mb+V8XrkSAssBGW6NQC+QzLUM?=
 =?us-ascii?Q?sciRER9B4tFpOL05+riU4+5Z4JyWUelmHlRA6EKhSCAMhKXw+SdVwe7fVaQV?=
 =?us-ascii?Q?jfRn3BVpoa5aQ6bS2GOyiBp5eWZMODkoRbroOijL4HRwx1TYQ6iwgb2rdKOC?=
 =?us-ascii?Q?0oJ/XqalbVP2oc317F9arWGpdcUFG9wGXOPzx4Pu0V3fdaJfamBYZ63dVSLA?=
 =?us-ascii?Q?vMVQtm6XzSd12D/5zK9+nlnXrXRBoDHgDkPeyZFXmnw5aSfPyCU/ifVkb43g?=
 =?us-ascii?Q?ovfqrYiZ4LRq0/DxlWNqwKQ54t/Xk6+xiCW5jasZSkOAYbPqndYaYRPxig4T?=
 =?us-ascii?Q?7w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZOOc6DkINb7r6FcZ+4oxbUy+929ooeOaDy6aVvDsfNvlmt7eXNUCWNZSEy2ufp36om/uuCHNSEAbZybuPj5eV6igPHQC+vVuZq665euRrF2pA+Nkk4wSX+YYqXYraRpmSigd9KGdR4yXt0eKXihl4zvVIquuquGsF/ksvdT5PlsGXSh7RB0NTPF1ceZ6680NleybzTqWpWrxslYzKUqxhEYx+f/HmjIrjtkLPbdV010aHOMwE+bSdxGwe783iMmzbE2gDqokun/q5jIm4GWKXWt7/JVh2F8HtwnRJQv8ect1n+g1rxyk5U3U0cPtfyJ4nreDmK+xA7HrzuPyawNZt9V3ivTivN0INTIi6hT5Ok3fdeOgD3pt22V+QteK2NaQUyIzS0vMbBbhw07x27JTWWh9WL0CI+uEg6mNJSQ6nxHAT9QJSag/Wu4mkbYWSmVwYDEIMD926MHOD5fJ8WTdrP/7MzTD69sD3G1I9hKyEE3HsZVBSZjt/nymOP2e/bJQaI7S9Ff1lYIvkhga8IlFsOCRlMGYBoniuQzc1BQfHIak4mX5Y4O22T/zWsRsHuTG5DY3Dm4Cj8linphNHEiKLY2l4mJzAFR+25S/hRPro8k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59afbd79-9003-45c6-9548-08dd7725bfca
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 05:16:57.4276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z79IpmMzcgyFepDNvwjOSPBDQ5sJahNrFbhlFUNN2m3pA96GkNARFB2UpHs8SPaIDdwG92YM+7Wdf4EojiwEaPcz6CspY7AYfaip+A9//Q8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4257
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_02,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 bulkscore=0 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504090019
X-Proofpoint-ORIG-GUID: -BdXrqj4NZKAKqHNwg9t4qvnxqgliSKZ
X-Proofpoint-GUID: -BdXrqj4NZKAKqHNwg9t4qvnxqgliSKZ

On Tue, Apr 08, 2025 at 02:19:18PM -0700, Andrew Morton wrote:
> On Tue, 8 Apr 2025 13:00:41 -0400 "Liam R. Howlett" <Liam.Howlett@oracle.com> wrote:
>
> > > +MEMORY MAPPING - MEMORY ADVICE
> >
> > Advice or advise?
>
> "madvise" is what people will search for.  Perhaps
>
> 	MEMORY MAPPING - MADVISE (MEMORY ADVICE)
>

Yeah, this seems better, also as Jann pointed out I missed off the L line
by mistake, can you apply the following fix-patch? Thanks!

----8<----
From cc37203d68dc9bae87e313fed9590aa3f63793c1 Mon Sep 17 00:00:00 2001
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Date: Wed, 9 Apr 2025 06:16:16 +0100
Subject: [PATCH] fixup

---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 325424a53acf..526ecbbbb560 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15552,13 +15552,14 @@ F:	mm/vma.h
 F:	mm/vma_internal.h
 F:	tools/testing/vma/

-MEMORY MAPPING - MEMORY ADVICE
+MEMORY MAPPING - MADVISE (MEMORY ADVICE)
 M:	Andrew Morton <akpm@linux-foundation.org>
 M:	Liam R. Howlett <Liam.Howlett@oracle.com>
 M:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
 M:	David Hildenbrand <david@redhat.com>
 R:	Vlastimil Babka <vbabka@suse.cz>
 R:	Jann Horn <jannh@google.com>
+L:	linux-mm@kvack.org
 S:	Maintained
 W:	http://www.linux-mm.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
--
2.49.0
