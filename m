Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136A01C75E2
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 12:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749643622; cv=fail; b=a5Dc/HC/D3xIV2Q8HHNN56w+fpUC82QkVwoQXSVSrW+PJHfUMV+jie59r69mbWhFeA2jXytmlwWysmeajSswC28eoeBZiXKbiGwZRiB9yiAPkQLUoIQDreyXXZBIKluZzg5IHall6ctTyEkFUIYru1JEsTljm1VRuCFi7ImeQ+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749643622; c=relaxed/simple;
	bh=/E/6BVipgCadsT+qYPUZo1Uhl3qYQm8XwUMT40x/7H4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZHlDvGlYInW9y503MYMEwf0TFspabx6PzY/Enu7+6Q+kUUq5m972iu542kKtOBNw78TpDFNrmeLnNS0FCZrGsQl0P8khbquzTk2ZlEXQr6ezmrx6vWBswlL0cXYOfEITYcJwHOQ9qdHKejOavhtYhsSzAyYy8JR6/GxynRoFvSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DRIucfKe; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XUNEs3a8; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DRIucfKe";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XUNEs3a8"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B1BxnY028841;
	Wed, 11 Jun 2025 12:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=/E/6BVipgCadsT+qYP
	UZo1Uhl3qYQm8XwUMT40x/7H4=; b=DRIucfKedj8PQGONI/kE8/QcXJv9pKubiW
	O4TbI/s6AIlrV0pqzgj6/VPYv5zMZl1HLwM3WxK3cYDVAjNFPyxu4rc63LCb52h/
	3ZHe1rpSDVKQkeqklL3PCHOtcsj3+jdMITodScaSKdaUEWLoLlf8VrfzhE18aJah
	qPAecr6noKFIC9A4pKcuoutESMeXd0W8Sn0+R3eWqcp/tQXMJFP4QTmYGu9PxY9Z
	PXnFLxwI+B2QyDHvggMVQ+G6oFZ77W6coJGiwrAoej7ucit/b610RncGnen6eOC9
	K0HGo0VJ4eCtv9F6Hr/smrF6CKEm/2z9SQxJdI79NIGIjPlImgAQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474buf666n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Jun 2025 12:06:47 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55BAuDke031360;
	Wed, 11 Jun 2025 12:06:46 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2047.outbound.protection.outlook.com [40.107.236.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bva2gaw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Jun 2025 12:06:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w6B2eMpvz2zlmGW8djcDo9LgWV8hVu52mDMC6n70RFK4TwD+9Prhyr9xCgohBJ+CltgF7+PfS9eQPHYwa1kbItK7oV+cuNcIEK7UghQZgcXGeEp+4S0sn07hK6T9kAhWyp911FWYGJSQJ1M7WniIKTzJn5FDAClfVMihccN8aiNfw6KhLwI2k8Ap5Un204E6VKtXRMXIXhseNe9aibJ+9LdO8p4HuNQM1umP0IJvjS5rOsPL3Ahw1/qKyjwgwj+83/wmANANTqKt6O0a5DnCnuL7wFgzW9LR1LHhrUEPKdtdYlZiHsEez7OdHTeIcsL4gGn3nebsHtCQjetsTnVS+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/E/6BVipgCadsT+qYPUZo1Uhl3qYQm8XwUMT40x/7H4=;
 b=xTW9CUbHy906TmWPuPzUHUSMWLzaLBRWxIaIqM22fNngCmpREV4J7PmxnXu+jA50Accc9MH1tYoHy9wQlwE3AMv0h1SXutjVcvk9OIf3RcXX9mXTn85EnJQFz1dYGAuT4MpYQB3JOxxa7oiZlOPxJw8bq1CGY4JfErhQS/kTb9A2aWhBdTMSZkg7pYMDiow2GlAMY5uCof1UoW515gSoHTk109V+pWIv4+DnNtllQ1qTbrLjX4ofV+dQv1GOUubtDAb0rED021Qx65ALdREsO5KobfjFlKRG3Ml36rAUXyqJDYz36oMC8E+0cEsMYpq3D9JvtsM21UZW3+uzRPf0ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/E/6BVipgCadsT+qYPUZo1Uhl3qYQm8XwUMT40x/7H4=;
 b=XUNEs3a83KPyDJggQGIduISg4Ks3IcIgCN7KwoIixYsQWDp9L6pVdNUpXjjgs/zgqtzmDV4B37d6PCNb/OdgxgVK7K/XdFRIlguO2LmJHBZFaZcfAMnPbVhuzTIPF6e/awsETwJwKorlj8BT2RhqsOT36CfP3CbQsFtPU5OnUwg=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SN7PR10MB6475.namprd10.prod.outlook.com (2603:10b6:806:2a2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Wed, 11 Jun
 2025 12:06:42 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 12:06:42 +0000
Date: Wed, 11 Jun 2025 13:06:39 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
        Michal Hocko <mhocko@suse.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
Message-ID: <6e81fd7f-2208-4614-bec8-22bf4ee63147@lucifer.local>
References: <3dfbbd63-697d-42aa-8906-539d74df9123@nvidia.com>
 <44af8f5a-2d94-498b-a3e0-31f5dde74538@redhat.com>
 <20250606184212.GB63308@ziepe.ca>
 <f2d8febc-cf95-44dc-9f01-b28151fe1282@lucifer.local>
 <e5e88da7-d7c5-4a10-9318-76c1e38dd0a6@lucifer.local>
 <20250607134214.GA158671@ziepe.ca>
 <04f52d21-baeb-4286-99eb-99edead514b8@lucifer.local>
 <8ce6c104-d2fb-4fed-a108-224a6113c227@nvidia.com>
 <e3db61eb-6dda-44f7-94a7-97f43c19093e@redhat.com>
 <20250611120324.GA858324@ziepe.ca>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611120324.GA858324@ziepe.ca>
X-ClientProxiedBy: LO4P123CA0384.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::11) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SN7PR10MB6475:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c8d90e0-7558-4b79-4139-08dda8e06db7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?is08Eu2XeW+TFL1+bUcFk7siVG/szrOw2TevdxHEWQpTziICa5+KVAWH8Ta3?=
 =?us-ascii?Q?LjR/gYClmtUqRhYavJ+1KFO6TOMYJ7p8kkPWtIIq4jBKKgDb9hLnXveDH/PO?=
 =?us-ascii?Q?zscvqZpR0la0azjcIsZ+Ks3Ry4iNWTsVyWF8wjE+sihLF74e/MwgAE0F5HBj?=
 =?us-ascii?Q?MN4y39xj16DE/QTWrqoSZT3o516HJaSUdbbjrXEKsCkF4/IwMKA9c+2SFOB+?=
 =?us-ascii?Q?ccQWYBeZymzJYqbK6w9cXS7h6URzLCYeUfwwihxQABX06LKC3Hx6RCf8MbWu?=
 =?us-ascii?Q?vIDEYybgX1KuN8x9TBzTdtPCHrgjk3sNdz7AX/+4v6yspecYZTanm36c1YMt?=
 =?us-ascii?Q?N2jLm5YafdkZZVZvobpWAs96FLRfpKd/DHfXkEOUed2odnQGejB+T9NiE0Rt?=
 =?us-ascii?Q?WsT8GhMmzBjl+EdowIxLcUs6v+sAew+1ToZdsOPjKPxoclZ1iqRzW/0cumHX?=
 =?us-ascii?Q?zD5aN/nLsU3wD4weGDxXAwUAckstDmokh8k6//PagCKaQnViy7tJGCarSjQ6?=
 =?us-ascii?Q?5fG/TDs4dQA+pW2VFNQG1rhGeZSdA/BFZNTCMqkuATO3VnMgqjV9yRMgFifP?=
 =?us-ascii?Q?UaX9QU1CknP6lirC6ejC3ZYf2PA15qCyYN9jOjbOwm0FjTuxvbrM/y2AuVLH?=
 =?us-ascii?Q?VlnQKKlTZvNPXhsWhczQyKX00379dzyBd7YWf2lw97qmJmO/0pUQT+XLJeAf?=
 =?us-ascii?Q?IBfBTuCCkgZe6wnnzKH7Iid1kJdZ0eBn3AUmTGuHzEzl5mmceRE0lvOV4coW?=
 =?us-ascii?Q?7eupEYtUUhKXgRPYVxqhReXRvHjRoSOMtp2bXaqkjipRkJqw1HebTbFsZZQR?=
 =?us-ascii?Q?QqPyk+RhisF17qZaMmxRXZc8pQ1yBMXti0Z1cRX5MeFN7hs78/CaUYvkqrxo?=
 =?us-ascii?Q?fz1Inh3x8FKIa03sXPW/ssscqSgh6BT3YIiWaks2nLYruQtIY7A6G62Et4uK?=
 =?us-ascii?Q?09H8oTBpU+5cBmB7haOyIeIaMSEtefZUC9b8NTgNk/29d3Ock3wZp14GmDOB?=
 =?us-ascii?Q?EpgK8Pzn35gsraR5Tgv+LtJ2Fya4nRVn6YcO2yvTX9upKtuhOpIZqkAYsIFg?=
 =?us-ascii?Q?ujWeZXl3r3oQm6ATnV4sc6Jprd9VwaTnbH5mf1jkC+BbP+L1Ik6UP6a43sBU?=
 =?us-ascii?Q?hU0UaFTu7ZWT4cSW3x+ZQTbDAZgU5f30AQoZS1+ejyww1+Q3As6cV7qX/wLe?=
 =?us-ascii?Q?xeaRzK4mLoS/Dl5xOj4r8mYVoNONitvmM27EtIwbFDBjOq2LHbhIkwXGF6BE?=
 =?us-ascii?Q?uvzCOcHmg/4bzCeu009I+PC3+DHwCCq4UAoHa4izFy86oPGtgRHSngUMTro5?=
 =?us-ascii?Q?AlVSIDj5obl+Wh3jCcbHcMbcR5Mavdiaj0ztVW3IVNomMMKIo62xFLZbxYhI?=
 =?us-ascii?Q?uawOpGtfKg98EikoaaSAfuSZ2hJKJQDtjE72+mVFPSXYfgS50d2E9hBomBdh?=
 =?us-ascii?Q?97BIaZLcYKs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3tDwA/7OU0umD08QUytxK2mzujII0Rur1mNUEZh4aYgVlMHV1IgQN9k4bus9?=
 =?us-ascii?Q?vnP7DbCqGUPh6+yqFySzJMwTNTjdcrDPReYEP4dvchH9QTL6sCH4WJRmb8A1?=
 =?us-ascii?Q?VrdUwKDSu7bivQfhiIG3Y7o0HTlptnW2Ap/jgqoeLOIJvEdaButzF3beOc51?=
 =?us-ascii?Q?96sDMtUL1rJnSyS/cDdzv4HCZKkl3iawZEe4Lsw5jIaieHV4ONDMYg6ctwAF?=
 =?us-ascii?Q?BUiB2YUiI/EIoHUw138LFTkgRbmZ30TYQfGdpuaen50KP8CPFdll5tnD0bki?=
 =?us-ascii?Q?tpGBKCi2r333NgmvayPFIRqPnk4Q4jpcYdiOSHu3XWieTFi6JMc8l0rYcuOs?=
 =?us-ascii?Q?JsThuxyF0v/E3cBlhgHZzb1ls/6OLXD3Bfq8uYR9DHsyxkeaRA7l5JEGCli7?=
 =?us-ascii?Q?8sD85OcmTMo37RF6Ftb7uTbmfQCWd0DwqwrciwzLwnmVujsPHzCLE2RGCm1z?=
 =?us-ascii?Q?S3PaQV4GT5QCrmFqYQq+QJ2TeWh9tCzJTRNR4Ungu9GKaz+TVXG6i4pLmw12?=
 =?us-ascii?Q?As54jLAKdfHkhintraUS9yfrm632Z4ajK2R3H3eex0VM8QVvguyRYKzlWNdQ?=
 =?us-ascii?Q?vYaF62c01ENx1ffNp2945bFVgFOMfK9ZLmy5eiVHR9Aty3uCGAPssJVRu/V2?=
 =?us-ascii?Q?i89z1x67PoiYxqSjkWEdWXKaMVdirL7RHIrRx3PmmCW88VkNmi/sPa22f+ei?=
 =?us-ascii?Q?QYIaXdCyB8GLfQij7ZhlRwYfrftU1sUBcbq0c4clUdwzK7phPtP/0HyhgD7A?=
 =?us-ascii?Q?oAQuL9sORMhtHpFF4YtRWqlJu9fa0cZJF8I75DcYnmsegxEEGPW6sHFRmCmn?=
 =?us-ascii?Q?xNhHJ20iGyTQ9MsKw80w7AJnEbiPWTNlhguJGKyQs6l1H8ac6y6+iu2Nxo0j?=
 =?us-ascii?Q?+xURTYsEwWllgCsI2IH9/r8G3RXimJAT9QFXpq2Z0l9bWX8LpKXfh6H2DzaO?=
 =?us-ascii?Q?Z0wOPFpmDaIU6F89Xo+gXVZT9SA/kmdQ9O4x1uYP6S+oPcXgiBFN7rAA1eSo?=
 =?us-ascii?Q?Jgkk6J2ultNK7POlXV0cfCdwPyO/tsOM7P9Zh03UKlNoXA/65+ez0m7q+850?=
 =?us-ascii?Q?u04PA6h8UlIwU1QVA+P/2krNyKo49Ktnuy99LZlanGHHNH2wzYU+MCMEtGog?=
 =?us-ascii?Q?9lhUyuSgfbKl85DtOY9si7fBYiK+IoBOE4d7hk6tz8wgH/ZmRcoVq/C6n5nU?=
 =?us-ascii?Q?TF8HEa5WNULNUIQ/bHFCD5zdFa7UQ337isXueA0O085OetOdBu9GrFD0yTRE?=
 =?us-ascii?Q?L45yTJrzqUGrJBbyWZgr5bTVIVCfP6GBmYKJVkRdvJ03+s7NmiJzri6OMkCG?=
 =?us-ascii?Q?RqZfneHpXb6bEHjRPv1RQ/Y2iLOaJu66vZFN9FjRRITHArZ7vRdaqJ+CAQUh?=
 =?us-ascii?Q?pY6bPQq7siGqNQT8qf5TC5r4nixLDd86UrxU2xI28b0fesSMPOILLFgluwcv?=
 =?us-ascii?Q?vSHjX0Ubl8uRRyODNuF11omYyr9E8D0gRt4Kl2D1HSdKsWSawyLrueSwzVg2?=
 =?us-ascii?Q?zLTNFPDcIoLenzky6AEPCKOIqU0bH8mjSsjxMM8/BhhvkoYcg9cd9+9hdo5H?=
 =?us-ascii?Q?v7Fnpi3pCDkGAXZYjReP3kgy3RMJSsi9vyEP5p9RyzJ4S88fcZB1MwoeBRuU?=
 =?us-ascii?Q?xg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RUlVFlYZoHQMrybk/lzV06zXuw8/zS99eYWETEydnOhXSzv2LsW8786ubQwaHgHzpz6/WYuOZys63JoXDu4ikNhRHj/gUXxdhsdErBczj3++HaEaFxqHYqG2ZVpSQAjrlPa7FBIEhkdAgCkBxk3tNawujhgAW0F4euOgso7v8j5rhnzoBizKRua68Ra9TUHzNtKDrcsPGlUEBoRw7IgMMfpqgccRlsYSL/26KZE4V0kx/OGn6u1LuUTQJQ3RN2SAnj7O6ASqpWd/zu5+d6yGypmj+1u8d7ABf1NJeMpk8r/6sGoDM8e/1yuCez5hEjP13cy/W/wa/22FTkv+3SYuZJvErQ924EaA2fpFt93eQ0wQHjTfx8PpMYDuKmBkmxxrpY6UU59auSBHdCOC0ltB9RcX6fsNhSg6pCwMoriG433o5F0Wo7qEyVD6TEb1lUZJPkP97I78dD1vM+OnfCerIXP2Bq2kvq1HHa3blx6Uu3EPAHtInGrxUlf02ab9hIvT/vJz7WSZpSMJ/j5FOsQcXGt8LIvDEJer30vAPgswGgryiyX6ZMWtN3BEt41ayuVaCg2l5vLNj17yXqufFVwSFnfDA3s7YUl/vCiy75l31Uo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c8d90e0-7558-4b79-4139-08dda8e06db7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 12:06:42.4217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3IBGVd1fySzSaB9luWHwtYjiaExeES2tn51MA/Dv1omG1qemO1HgXaZgl+d8KrU5ZNaaqPYM/Adry7wFf6Ll8uUkG8TGvBvg7aGeoQmvZwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6475
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 mlxlogscore=816 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506110103
X-Authority-Analysis: v=2.4 cv=RZGQC0tv c=1 sm=1 tr=0 ts=68497157 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=bdwO9hUZLDJuS3sCs-AA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: WIM_p_VMtQPwxS5IzZXFTOZ6xVnKAmHM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEwMyBTYWx0ZWRfX1ifUe8KVLJ0D ZVZIXbvpTnFM8Nd+13NyS5Lf4YCGuTXGxbZkycldxOZ9y1IPmtTzSTQAhzKy7IjNjTj+HTRoa1U 8BRRZS9NcK144vw4tpGufSF7hOn3ZmeqBKJ3cQzNXQARWabUlegzjQbyu9euN8WTIG60p3r065Y
 O8kPmXHLiyCJrO1pUzSTdpXrsuiqkljHHwO+MUpAX9bsT/341u2vPufuiVhBLiXXXFsWfKOC6T2 iTVS5HmZ0q/g62/B63FkRuSr4+vm9fTjCgK7QdOtpJY+boEDQ2gNdHsXjiExaOXqLu8UfZRXJdF qFmc2kmvLYoLbdO20Nwylj9/+D8juRm5gk7o6ru/Gd4Dbghry7fNSvJDy9amPLQtdasyomie45k
 jUXcquVY5mgKI6+vYKlhE1apXrovmBmiujC7n4JWBLP02ObxD40BEcE97F0Y4sOVsD98d3y8
X-Proofpoint-ORIG-GUID: WIM_p_VMtQPwxS5IzZXFTOZ6xVnKAmHM

On Wed, Jun 11, 2025 at 09:03:24AM -0300, Jason Gunthorpe wrote:
> On Wed, Jun 11, 2025 at 11:32:07AM +0200, David Hildenbrand wrote:
>
> > Later, we can do more advanced stuff, such as storing them in some other
> > buffer to persist them etc.
>
> Yeah, you should go ahead with this series, and hopefully someone will
> be inspired to separately do some work on the WARN framework..

+1 fwiw :)

Big believer in doing the practical iterative 'next step'...

If I get time + nobody else is looking at it, I'll look at doing the big churny
BUG_ON() change also!

>
> Jason
