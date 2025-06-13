Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58032D1F44
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749800325; cv=fail; b=ZIcbVL7QtGMWgkfHw41b9VRr9TSHokJD5KvanKeYFtHdhvXN4vh87RfL23C9Ni8os4Rjp3ag8i4E9QyRUFoG+vygSzwJIo5AP0VxjpqhqKrlK8dS0pmmdjqhLYbISnaGVL7hKDPlaETSU5maJcK6NH4/nNqCQQ+Oqoy9QBlVthc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749800325; c=relaxed/simple;
	bh=K0ZNqcmzsTWLAxL9mURWvTQV0TNhgkB7C2SsxuwA2SI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lu1t0rsDFO9drGLONLUUUqU1XbSQajwbUPLxAzkWcw6CkapYpfOEiUO/Xw+eTqHKsKmZ63U0CpZRxCP0lYTsWj0T65IPc1R6W1QdvSaZ7Ok5iqnZ9twh8L1daP2+vqwjPEwzx29nJsUd6k3fcjYtoGZJo+ft061TiwU0DTKTWGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=sazQtQrZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GepKVsci; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="sazQtQrZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GepKVsci"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CMBqde030227;
	Fri, 13 Jun 2025 05:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=i2udZkZxpHXZSVaXZt
	2QU3nvR54NaUfqilO6Xj9g5BM=; b=sazQtQrZnc52mFYjBWEMKdzm+DkgYUTVVE
	Xfvh5zgbrFNgjohiP2f+QBicbPrjF74CGOetLSp9KbLvBAEdc/YMWIOV+G1jey2K
	vQBxy6iX7KQuuKvYnV7vnAu7c7ZFRuU+Ruga3d1FkLfMeWuDzRkZSCTlhRLYu42L
	Sw3Q4gNmvQC1TTCJfz59MO1usc3LHjzQny0GhLksay+ZCHad2N5M7yQfeiNbijjQ
	ZwivGK0mLz6tpQSRzlRcARjeZri++kIUHn06Jc2Gkzzd7wlZbyfjT/pBE1Wxg/1m
	TPPv8zUNBKzpExReu22bZBn18FYLkGRrNT2EHD5JySVAQo0vp8Bg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474c14jxvv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Jun 2025 05:18:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55D4o2Pu040709;
	Fri, 13 Jun 2025 05:18:28 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bvdfg58-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Jun 2025 05:18:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GyV1I1enVVMNdhIs8O+1co3XMezR60ADsUQXBTsvIG+DMFVIajYzuf7IpXyXPwfj0DFu2YU/t0DtlkhF8bMxHa11xtOalrKn6CdNJgBW0hZHpwm3Wu9C1LHyQ2RJZeJAK2Cy8LlM65if5WPW4lPfuXlOQOr60X8XDhyyqKPWCXvtrzttsJx/8H5FiNg0bbjz/rxJQZGA+8pgbNqyMDfGPs35zRQB+2znszK7mvYELMXt6j2wkoQPBSR//f+dwF8br548j4/OwKKpQbAFYxpuAkUEFn3ov78qXlXxkWwsnUCzrjpu2nhXD4AsEdG3/7K5etZQcNTeDz1cTgKt0vDApg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i2udZkZxpHXZSVaXZt2QU3nvR54NaUfqilO6Xj9g5BM=;
 b=wrSDXO1Idh9F+0VbH0huPIhsF3g56zRCCF3mvjus+BK7K+3hkxkikW7YFURpkZiFCUHdwHdxous6qZ6EkVHeQqmlxRTWRJFwvEibMo+pKdx5RFe6/H2uto6RZKWS86YEFWmeudYZMmDfgArJ+dx+XRmoosv+qkmigzk0fRclTMfkrD10oIAFM1v89hoVQT8TgtXFpk3Q3qkpEV/HQI5+p0xQu/zTp6Zcunrk8ppNec26boUoZjRShvl4i31oPVbnCfhcKf2qB4ttR/PJUJDWdBxh3SEcnfjrFYjONbNBRlg91cDC1fiqtNI+nNkubQ55h3GDBkVuC38eu93hLwkoIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i2udZkZxpHXZSVaXZt2QU3nvR54NaUfqilO6Xj9g5BM=;
 b=GepKVsci3ePr9XoKKAurg5riw94EVdNbufYdfX3I1hdK8w2rF/QdpvxDHC3HY/ezE8HivUKeKmZ6lqZui4nMbA3I0EMcCatMPSyJyKT8cYzuVag8ioZdTnfJ8rlZEWJmf/hkzTG+ZndoCrAq2PvojN8ORmmaGONy0riqhMgcUew=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH7PR10MB7732.namprd10.prod.outlook.com (2603:10b6:510:2fe::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Fri, 13 Jun
 2025 05:18:11 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.024; Fri, 13 Jun 2025
 05:18:11 +0000
Date: Fri, 13 Jun 2025 06:18:07 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org,
        hughd@google.com, Liam.Howlett@oracle.com, npache@redhat.com,
        ryan.roberts@arm.com, dev.jain@arm.com, ziy@nvidia.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mm: huge_memory: disallow hugepages if the
 system-wide THP sysfs settings are disabled
Message-ID: <3ec2bd80-50e0-4256-a34b-dd44bdc1ae31@lucifer.local>
References: <8eefb0809c598fadaa4a022634fba5689a4f3257.1749109709.git.baolin.wang@linux.alibaba.com>
 <1ec368c4-c4d8-41ea-b8a3-7d1fdb3ec358@redhat.com>
 <2ff65f37-efa9-4e96-9cdf-534d63ff154e@linux.alibaba.com>
 <953596b2-8749-493d-97eb-a5d8995d9ef8@redhat.com>
 <97a67b74-d473-455e-a05e-c85fe45da008@linux.alibaba.com>
 <b8fe659e-8a84-4328-b6d6-6116c616cb3d@redhat.com>
 <ce58b08c-0ac1-4ec2-8ff6-cf8e651709b0@lucifer.local>
 <ee646bca-e77d-4452-82f8-0bdb4b241f9c@redhat.com>
 <815f383d-8636-490d-8994-486be51f3123@lucifer.local>
 <7c911fff-aaf1-430c-89f2-5e7925e90a04@linux.alibaba.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c911fff-aaf1-430c-89f2-5e7925e90a04@linux.alibaba.com>
X-ClientProxiedBy: LO4P265CA0138.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::9) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH7PR10MB7732:EE_
X-MS-Office365-Filtering-Correlation-Id: 04e5b0e5-c875-42be-e85e-08ddaa39b0a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9hxW/gFDCwM4oOjTpaXWS5zBuRhdvVHKjybZm8S5bZ/UTXJhVJjd0brnLjH8?=
 =?us-ascii?Q?UzbbHS0RDlaFgE9GTebJSVCrzfzCMZud9uokbp+6ioPmepmoRFtn6CSuRMFj?=
 =?us-ascii?Q?ECICv7En8I4poqT4BSHgIBi243pga+epQlWtVKiDku36Jbvnr45Soihhb6bI?=
 =?us-ascii?Q?NZaE86QvqAAJ8L/hmZs3xxR1IZiPGZF/bAGDHuMY+18XMn6OHBouI6akY3Cj?=
 =?us-ascii?Q?gA5ZQzQm26IVntZY3mg1UetVfeYUfL1ZpDuFK7iP5S+I0Ybuf1Xf15oStzZt?=
 =?us-ascii?Q?15uVNt41LMBPTrpYV8lWLPxfhngi0ZS8ItvKgOyRjaJFT+h+IOBhNnqiOwL3?=
 =?us-ascii?Q?/h+V5gdyMoiVDergmJWbYovrsHSvuSjU5ZIOwS7cBDtvoe+NZz/e5RDIZj46?=
 =?us-ascii?Q?CXoPIYHKBprRi3GHfjjVuvGurJbtuH0hF+Eji4Jrb3Z10p4hkHJ7IFfCrQeT?=
 =?us-ascii?Q?eTksoyhBUBPl5D8HVex03/U6kiA48wfGKQi1SkO30zeoMzLuOkmHDdIaxIlE?=
 =?us-ascii?Q?TK32aYQIGgOqtEX9tYQkVns6v4QYrJfJeRKOudfSkdd0cAkGTEQE8YUubeeM?=
 =?us-ascii?Q?8RDM2YYzJ+bLuSS3O8ERljIr7vywOImoI2hvPbDRhOk5TxGoTD4yz5zveTUU?=
 =?us-ascii?Q?pGSYHH9sYIsWRcri4sSvALFYyUw+/5PSNfq0zYdBrwNuCDxVUy66yzayPdyO?=
 =?us-ascii?Q?uWhphSHrxysOfYiDO5eYTdTiaZtVFQkgAP1m7J7nmk1KQk3LXbv5nRLZP+Gt?=
 =?us-ascii?Q?47WbTZCpEopAD3SDZCxG+ry62DzuFXOTzbzzHyQPRWmt3UZXDO9oURHuPW+7?=
 =?us-ascii?Q?4TQQIHu9QwdGZ8IkC+7EiLuCuJj45BwqB0COh5n2oeD6HPleHdd1Qxd1cWc+?=
 =?us-ascii?Q?sR7HbuG7ScQUDdWbdjdy8NPJSsgRUlQjLuCNvInH4XHH0nJjr64sW1jTdKrM?=
 =?us-ascii?Q?hWWxHs5GaSPR71f0QIOkOEXcBGebTFaVae2WAyPb+LyUW0YNKC4DA+De7Dmt?=
 =?us-ascii?Q?/ZCJfZKKlnFHWK9Y3YZLM5ItXayC/lmfMlNMkKNtp0uYjwOliaLEmBowdVPn?=
 =?us-ascii?Q?kLkvy28q8Bv8AAabx1DN2LrGL6cB9jrWOj82RkJzBdtmUaXFIEAdokFgta0n?=
 =?us-ascii?Q?Psn7ZdJ7roDQFjmna6YoYKGMq5vyYQUEq8PDu6QfCKrC+s+CEU6ptqpXAGvF?=
 =?us-ascii?Q?gWN0ScVYxs79HV8pnEfK41MZltBVbbKKwybyzUNVxQPbyBlHT6o1hJAYN4eA?=
 =?us-ascii?Q?RHUbOXcAke5T1zb6SF0t3jZGxpPO/8xuOFZprrx0tDxM6QbEVWhbnarn5r8q?=
 =?us-ascii?Q?Y5QqyYK1D+D1fEtNzcbOJw2jLsf0sXYiJJhEJgglpMlBiDthpZkI/dlkYV1v?=
 =?us-ascii?Q?JaHJRyLQ3ZisW1qsZJnt7JMYMn1sNdZkrKRRKUv5Jm5XF7cJBKEzkPs9Hns+?=
 =?us-ascii?Q?Ipd5mJ1WRus=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VDb57gSZTpz5Oq+vbK6L8hQg53RtywU7nuAAN6eveEOFbgzPCi5/bvqDDyT1?=
 =?us-ascii?Q?OeZ3ICLneKZp9lb9QBJiUMKKLURKFUgfWzPUHZ02QcBrp3KXWcb+m1YxQmw1?=
 =?us-ascii?Q?G89aD6DAvHXY97KKUYcTvdxSOP8TJvOTE2MxEag80InBtU+t5TqaIQKS+WmB?=
 =?us-ascii?Q?4fqptntpp9q8hNyIYqP5mw0kqtIdIlwyV2Ev7gRsneBHhb+ChMTLYbkSXz70?=
 =?us-ascii?Q?6DBtIfDvD38HmnLDXPQFja0CO/XNV+5ODtNg7dGUv317SMLFepP95Ufo9Gbf?=
 =?us-ascii?Q?wTjbbtlWtB23mN3v7ILjBztQD/jctIbPhvWLFBZp4epX23d9WG6XiYTPpH16?=
 =?us-ascii?Q?yV4l2ypHWI/HVhJyhLSWfcRF9XkMnwnAX1jUPVt8xvcuOXozEcHC17DsKpqZ?=
 =?us-ascii?Q?MtlajvHGHAlTog1Z2xGn6a6iKK4Vdau/uhYPDvqTr9ZKSIiN9ITxK+k9yHN6?=
 =?us-ascii?Q?qA0V7QC7jQPsANHVspzcMUbvkasSbMlobZrwscumPjDc+yQhTTXMlMT9Np+N?=
 =?us-ascii?Q?oymF+SbUPkaNIqlBI/qoTohjU1aPTXRCl6J1/0JicCZyPWWSdOMXWyzTmGg8?=
 =?us-ascii?Q?ir+bQpBXaOf2e0NrV4rksb7K4WSVGwQLmt+5LJI7VpKOVOiAyoOoWibxd1+E?=
 =?us-ascii?Q?Y7hQ+qDkjdhiI+uxu9+xi2BB4AXbzlmmBoWkldYOYSEebLBPd3fO74otA9cO?=
 =?us-ascii?Q?NTYd/cuW9nyH5bd3wpzsIZaO2OlwP+a0AonXj4DXDrGipGpKKIPdMwKjO2Sz?=
 =?us-ascii?Q?BPEkUg22rO8F0/yJ9jCthFLuftCmqiIAPuMUbKtSfAUdYmzyk9HDaBzBDuB/?=
 =?us-ascii?Q?oGwOFIPSmtpmKtUu3ZBX4AcS2M97F4/OlcErgQN2MiTfck+N04dw6Hosy8Zr?=
 =?us-ascii?Q?Ac+Aotltf41VnEbeWpB694scJs9JU1DDS5IjN6Ozf4MNbCGC3/OnPhM0MxkU?=
 =?us-ascii?Q?ohEs60tVtocgySTD9mlqBS3/aYK+QRnMVFwTZnQC7n1iTjdpCrFFcAXk9AJ/?=
 =?us-ascii?Q?pN+0DaE21brSau+6RdqpFBs5L2PqiXYj1x5MTQ2k7e/a/qIgGoYzo6lnzCv1?=
 =?us-ascii?Q?bAN0IZwlLMo0tIBUHqFGgeoETlGOn9qJgcNXIJMa4Ctd1j3YUw8hs4d6rXPa?=
 =?us-ascii?Q?6SBQ5ZKU3fTS7tCX55fLdJwRBYBrgN5cQ5il5SX7FC6mjZbzkYYhcmaf3GiO?=
 =?us-ascii?Q?wYUaq8gJn0wdHACwh3rgRyryGs49FAV6dF6EcKePtuqoUoo3Y+1MBgSFx5hT?=
 =?us-ascii?Q?vDKKvFCWVngxSJyaSEPXugmQEvjEFRPgzx8NGojx9wt+ywFOgOKNn3tcVI7+?=
 =?us-ascii?Q?HF84gXHarakzLBpBcFXH4f1sbSrjWAA444Q8pTt8q/oc+0iZD/1c/V+tTfdd?=
 =?us-ascii?Q?T2BeGXE295g61hAMvjlo5Py4LSTKmbq03jf5zpJNHhZ3kbetbTVfT27pP9QY?=
 =?us-ascii?Q?YURdNM27lTxmRMDgF2+AJvl1Nx2QTSbzvvnj6O+iXVZn9tLr0y1fX5F+t5rd?=
 =?us-ascii?Q?uRBHAjnkemX1s5FM/vaCqJNpvQcU1JqZAWnNH1nP0CO7zoTvJRQZ6tU5eDRl?=
 =?us-ascii?Q?Sg2KKbNWpQcl9IAuDIHoK33KIhk0Wqpp1cWmXzoUFb92Rg+gP2+l7bgEsoog?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	G1D4l9vPJkfsrvaCR/bhv/Tt+3lcqYUPvxQtL88bS7QvCMgwiW0mzhpPh7Mw9wEq6hdQJjWZqetR4YYIS0yd1XDld7L892qJUrW1JIIz5fpEJJCdM1dLh6/71VPxIey//C7EAeAMBX6Ee5TKAjdRrnSL/luCEKVvXBsgqR1rHYyfUl11byr6m+iL78Wb0gty+D6Q2HZ37T5Xry1zaeW7pLmkzoKS/emjyjOj3hhhkpCwl1QOe8GnC5eT4tCe9tcAW8IhzoQdELPmPPK1mWotMFi9Kj+N6qmdCYFnnMxda3RHSBp8KFDHwUcYHldAWGcuSE7fFEYxCuYp81D3vaAjQgFrmj4ycb5t42EXi4TKey2mWsmLgsGqCodOq3jhbd79+SRhOK5R9/SShphw4ZJRqEXnxzgHuPw3d9IW0mpjZJYyUkcRXT4jCvGKqxZwBEUXYnHBoxrsaj7l4myu2+Fo2vuwyuKQgIwbVyz+o3kCWuGiP6o+gcDs1lfuvbpJPGGzF2CJoIiMINUhKSLWM2NNAYUVAxWfmwqHVLHd1ax23/135OSBMLiBnhyFaXaqcMxWMoKo2i55qbpiAKSwXjFZqARMrKTZbOxngSRj/U0scOo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e5b0e5-c875-42be-e85e-08ddaa39b0a1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 05:18:11.1621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YhsrCokZRPGevjg8wDz4gBxVbZYAtaf6HNUX2rmgJO5BBMtvxpus2Yne3FBDTC+kNwLb4+xpsO/tYqvNXprJDEX4pol3lGwQXetEpIUFzRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7732
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506130038
X-Proofpoint-GUID: FMCrJZ1P0h3Yw_r4WgfosErEIytmfdXO
X-Authority-Analysis: v=2.4 cv=GcEXnRXL c=1 sm=1 tr=0 ts=684bb4a5 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=nUNbO_RF3Xpq0mGgzcsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDAzOCBTYWx0ZWRfXxM89+r9nBEQT EqkE0RrU3vEgL6RsUT553c1ckuq4/Y1csoEUpadJ91UDy3v9pkypPzSWNZazrXWMsY5ak8RLizW 1/622AoXK0Wa1aaOGvcXu8IviNGa5So3Kyasj1AFQSHJ24K4T4f85qBZPBM+f8aws7fX5G/7QLZ
 Zrq595lsg9ZOjo+ImxgddqDYaD46xPPp5LBeXZYxZ3jzCwNuK9yK+JOZVFK6P4uixUZjKl3uQtq dkEFACyL0gtzvXBtih5tuAhZzapZ01851HjsiId9oNgTsjZZCPzQK1BE45+KjCnD5b3RxsyFOlu mvQzHRhLcDDn34JApUbYEEb8DB60fWwPEngoopc3BPtLj141GOCReR1swyWo0FsVAzPocbCdLj4
 rcnij/aC3h1dS9gqIHxYkHshn4hBoH7ZC5oyqkjHs/v6dW/pHnh/O91Kr3Mie800Ggut+lK4
X-Proofpoint-ORIG-GUID: FMCrJZ1P0h3Yw_r4WgfosErEIytmfdXO

On Fri, Jun 13, 2025 at 10:07:20AM +0800, Baolin Wang wrote:
>
>
> On 2025/6/12 22:49, Lorenzo Stoakes wrote:
> > On Thu, Jun 12, 2025 at 04:09:27PM +0200, David Hildenbrand wrote:
> > >
> > >
> > > > > @@ -265,6 +265,42 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
> > > > >                                            unsigned long tva_flags,
> > > > >                                            unsigned long orders);
> > > > > +/* Strictly mask requested anonymous orders according to sysfs settings. */
> > > > > +static inline unsigned long __thp_mask_anon_orders(unsigned long vm_flags,
> > > > > +       unsigned long tva_flags, unsigned long orders)
> > > > > +{
> > > > > +       const unsigned long always = READ_ONCE(huge_anon_orders_always);
> > > > > +       const unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
> > > > > +       const unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);
> > > > > +       const unsigned long never = ~(always | madvise | inherit);
> > > > > +
> > > > > +       /* Disallow orders that are set to NEVER directly ... */
> > > > > +       orders &= ~never;
> > > > > +
> > > > > +       /* ... or through inheritance (global == NEVER). */
> > > > > +       if (!hugepage_global_enabled())
> > > > > +               orders &= ~inherit;
> > > > > +
> > > > > +       /*
> > > > > +        * Otherwise, we only enforce sysfs settings if asked. In addition,
> > > > > +        * if the user sets a sysfs mode of madvise and if TVA_ENFORCE_SYSFS
> > > > > +        * is not set, we don't bother checking whether the VMA has VM_HUGEPAGE
> > > > > +        * set.
> > > > > +        */
> > > > > +       if (!(tva_flags & TVA_ENFORCE_SYSFS))
> > > > > +               return orders;
> > > >
> > > > This implicitly does a & mask as per suggested previous version, which I think
> > > > is correct but worth pointing out.
> > >
> > > Yes.
> > >
> > > >
> > > > > +
> > > > > +       if (!(vm_flags & VM_HUGEPAGE)) {
> > > >
> > > > Don't love this sort of mega negation here. I read this as _does_ have huge
> > > > page...
> > >
> > > Well, it's very common to do that, but not objecting to something that is
> > > clearer ;)
> > >
> > > I assume you spotted the
> > >
> > > if (!(tva_flags & TVA_ENFORCE_SYSFS))
> > >
> > > :P
> >
> > Lol yeah I know I know, I just think I guess in this case because you're
> > negating elsewhere it makes it harder...
> >
> > >
> > > if (vm_flags & VM_HUGEPAGE)
> > > 	return orders;
> > >
> > >
> > > Would have been easier.
> > >
> > > >
> > > > > +               /* Disallow orders that are set to MADVISE directly ... */
> > > > > +               orders &= ~madvise;
> > > > > +
> > > > > +               /* ... or through inheritance (global == MADVISE). */
> > > > > +               if (!hugepage_global_always())
> > > > > +                       orders &= ~inherit;
> > > >
> > > > I hate this implicit 'not hugepage global always so this means either never or
> > > > madvise and since we cleared orders for never this means madvise' mental
> > > > gymnastics required here.
> > > >
> > > > Yeah I feel this is a bridge too far, we're getting into double negation and I
> > > > think that's more confusiong.
> > >
> > >
> > > Same here ... I think we should just have hugepage_global_madvise(). :)
> >
> > Ideally in future not have these stupid globals all over the place and rework
> > this whole damn thing...
> >
> > >
> > > >
> > > >
> > > > > +       }
> > > >
> > > > I propose a compromise as I rather like your 'exclude never' negation bit.
> > > >
> > > > So:
> > > >
> > > > /* Strictly mask requested anonymous orders according to sysfs settings. */
> > > > static inline unsigned long __thp_mask_anon_orders(unsigned long vm_flags,
> > > >                   unsigned long tva_flags, unsigned long orders)
> > > > {
> > > >           const unsigned long always = READ_ONCE(huge_anon_orders_always);
> > > >           const unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
> > > >           const unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);;
> > > > 	const unsigned long never = ~(always | madvise | inherit);
> > > >           const bool inherit_enabled = hugepage_global_enabled();
> > >
> > > Can we just have hugepage_global_never/disabled() to use instead?
> >
> > This would be nice!
> >
> > Could be a follow up... though again would be nice to somehow do away with all
> > this crap altogether.
> >
> > >
> > > >
> > > > 	/* Disallow orders that are set to NEVER directly ... */
> > > > 	orders &= ~never;
> > > >
> > > > 	/* ... or through inheritance (global == NEVER). */
> > > > 	if (!inherit_enabled)
> > > > 		orders &= ~inherit;>
> > > > 	/*
> > > > 	 * Otherwise, we only enforce sysfs settings if asked. In addition,
> > > > 	 * if the user sets a sysfs mode of madvise and if TVA_ENFORCE_SYSFS
> > > > 	 * is not set, we don't bother checking whether the VMA has VM_HUGEPAGE
> > > > 	 * set.
> > > > 	 */
> > > > 	if (!(tva_flags & TVA_ENFORCE_SYSFS))
> > > > 		return orders;
> > > >
> > > > 	if (hugepage_global_always())
> > > > 		return orders & (always | inherit);
> > > >
> > > > 	/* We already excluded never inherit above. */
> > > > 	if (vm_flags & VM_HUGEPAGE)
> > > > 		return orders & (always | madvise | inherit);
> > > >
> > > > 	return orders & always;
> > > > }
> > > >
> > > > What do you think?
> > >
> > > With the fixup, it would work for me. No magical "mask" variables :D
> >
> > Thanks!
>
> Fair enough. You both prefer the 'exclude never' logic, and I will follow
> that logic.

Appreciate it, sorry to be a pain and thanks a lot!

>
> > > > > +       return orders;
> > > > > +}
> > > > > +
> > > > >    /**
> > > > >     * thp_vma_allowable_orders - determine hugepage orders that are allowed for vma
> > > > >     * @vma:  the vm area to check
> > > > > @@ -287,16 +323,8 @@ unsigned long thp_vma_allowable_orders(struct vm_area_struct *vma,
> > > > >                                          unsigned long orders)
> > > > >    {
> > > > >           /* Optimization to check if required orders are enabled early. */
> > > > > -       if ((tva_flags & TVA_ENFORCE_SYSFS) && vma_is_anonymous(vma)) {
> > > > > -               unsigned long mask = READ_ONCE(huge_anon_orders_always);
> > > > > -
> > > > > -               if (vm_flags & VM_HUGEPAGE)
> > > > > -                       mask |= READ_ONCE(huge_anon_orders_madvise);
> > > > > -               if (hugepage_global_always() ||
> > > > > -                   ((vm_flags & VM_HUGEPAGE) && hugepage_global_enabled()))
> > > > > -                       mask |= READ_ONCE(huge_anon_orders_inherit);
> > > > > -
> > > > > -               orders &= mask;
> > > > > +       if (vma_is_anonymous(vma)) {
> > > > > +               orders = __thp_mask_anon_orders(vm_flags, tva_flags, orders);
> > > > >                   if (!orders)
> > > > >                           return 0;
> > > >
> > > > I pointed out to Baolin that __thp_vma_allowable_orders() handles the orders ==
> > > > 0 case almost immediately so there's no need to do this, it just makes the code
> > > > noisier.
> > >
> > > The reason we added it in the first place was to not do the (expensive)
> > > function call.
> >
> > Ack point taken!
> >
> > >
> > >
> > > --
> > > Cheers,
> > >
> > > David / dhildenb
> > >
> >
> > For convenience, I enclose the fixed version + tweaked the inherit local bool to
> > be inherit_never to be clearer:
> >
> > /* Strictly mask requested anonymous orders according to sysfs settings. */
> > static inline unsigned long __thp_mask_anon_orders(unsigned long vm_flags,
> >                  unsigned long tva_flags, unsigned long orders)
> > {
> >          const unsigned long always = READ_ONCE(huge_anon_orders_always);
> >          const unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
> >          const unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);;
> >          const unsigned long never = ~(always | madvise | inherit);
> >          const bool inherit_never = !hugepage_global_enabled();
> >
> >          /* Disallow orders that are set to NEVER directly ... */
> >          orders &= ~never;
> >
> >          /* ... or through inheritance (global == NEVER). */
> >          if (inherit_never)
> >                  orders &= ~inherit;
> >
> >          /*
> >           * Otherwise, we only enforce sysfs settings if asked. In addition,
> >           * if the user sets a sysfs mode of madvise and if TVA_ENFORCE_SYSFS
> >           * is not set, we don't bother checking whether the VMA has VM_HUGEPAGE
> >           * set.
> >           */
> >          if (!(tva_flags & TVA_ENFORCE_SYSFS))
> >                  return orders;
> >
> >          /* We already excluded never inherit above. */
> >          if (vm_flags & VM_HUGEPAGE)
> >                  return orders & (always | madvise | inherit);
> >
> >          if (hugepage_global_always())
> >                  return orders & (always | inherit);
> >
> >          return orders & always;
> > }
>
> Thanks Lorenzo. Let me follow this logic and do some testing.

Thanks, much appreciated!
