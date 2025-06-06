Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7253E1F3FED
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 18:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749235636; cv=fail; b=OH2GEfMecdBSlKKc/gXhrRC6aND5rRWa+VDgmjp0K/Mtfjm5U4Y+LqyMZ526hVjQVVfp5gZqvO2aoas+6DyHZrfJIEPDs38x4ef7bB+9ZNjenj7U4L0yxQMgq+2o07slydVxUh5D2dbIPvzkw4UIBZy3sUZnhbK1k8FWqc322Xg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749235636; c=relaxed/simple;
	bh=6ZIwNbfPo0V0yVJa7M0cqIQ7fsQTnUysD5BDD8ykFTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=miuIpr2eBuXxJyTWkHYHdL5pwGDcQRyuzuP9HA/dgojWrnvQPSwrR7yg8j/avlL9wDQejH1nv5acSZ2F+VLfHvUr65gBRp82hh9iYlrkdUjZXsL6lh3n8FynzSrGjOoa4PKeg00ygPANouydNUHTKsVbYFtASoWZMcL+SHj0KuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lWmv1VTa; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Si2JE3xN; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lWmv1VTa";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Si2JE3xN"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556IMZE3018601;
	Fri, 6 Jun 2025 18:46:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=6ZIwNbfPo0V0yVJa7M
	0cqIQ7fsQTnUysD5BDD8ykFTs=; b=lWmv1VTa4YSyMHaeJYC8bog9BYUfPDxtrp
	7HaJ3ero926G9lRuElJGho87QgFw7JTzn1A8nsvSFOtu+Ds6babtw71X4NQ7oIKj
	AFgtW+EHX4XzkSTmjfEVBsbek/zAsBW1jesi8sJI9uGnqqwmNMAF7Kz6cBvStExi
	6L9e6Ig2fwMRnPRC9ROOPqQ0K5kYxgZsHzHkcbmZAdlonGCkKcqlKesoMwt9/8ch
	YD7jDNP0H42BP2namS+tW3+ZJ/mK72DK43CG7DX+wq0YiDDbaOrdqw+28vHP4nGA
	GTHX4dQXdYeJr7hItSXeQMiykHC16tY0zqCeU4dnqh6p6II+yHMQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8kgjtc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 18:46:58 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 556IJhg2016175;
	Fri, 6 Jun 2025 18:46:57 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7dkssw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 18:46:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WyhwdNYQ4hFUUCOF9aaK9j9mkcaoHN3SXy4U+oINb0uEcsFynNlpIy5vCw5vEkWhgIaDzdHJpS6FYRKd5hY8H2ZGm+0ldc4ZyTFL1tFoV1IfD8/3bp+aftpoDz5j1SYhFiclwIrywhr5fBt5LD5zokrjwiPJXHTjD/G8fe0lqarZ+FkVVd6/CZKXl7j/a7a6A8GHKjbbOwpFzqWwc+3zh93QW9FfLrgykr+I6q/7gGuf5th1MZslyLout817rgRa25Ewah7n5ifsHrWdDWoigvo9hJW60TPTBKjuk4+s2x3tBjITBe15zz8Y/lidPSmJJX+s5WyC6e1EKo1pzn1qvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ZIwNbfPo0V0yVJa7M0cqIQ7fsQTnUysD5BDD8ykFTs=;
 b=X3h6ToDkERkfILOOw/V3oDoFY4eOysb+hlc+AiIXARa8wOBy60dy1S5poVD0+ccJV0K3mgMDsFo4SFug3SfgCihXn9oF3tSKqYMoLT3BRIMX7C8IN929/I2kTjeyV+qo5ZUQBKghT5VDyHS+2X34+wTpUWQJ6w4DqBLuKhwUUWZtzHoD8+ylNt0KFSkUCtKuUOqXSAT7olFZ4Bi2ttuqynkvuEx21JhGwHaEDam3Nk2pwqBDJr2ebpl6fM5bGtbkRG6RQfiPTZUUe/bS94K0Wbb8sYia4sXStseQw8dthcxOISIO45i3rBComEd7q/EjpMT2kuVaBsf8RkX/h67p1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ZIwNbfPo0V0yVJa7M0cqIQ7fsQTnUysD5BDD8ykFTs=;
 b=Si2JE3xNjRKcQbD2+vzHfo3uGwT0YHVLDZzH0qmDOcgLoRwMqYKTDwstQ1FFiDXd57iu9HjS0SwXhcaq0KDahEXVbO7AQvmuyF38b8l1S4d/vPPyvbbv8FdWHun86XZwyaziqDfv/Hf4/MSgKT/B2wpoHLNWWKUHK2AbS2yTZo8=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH2PR10MB4262.namprd10.prod.outlook.com (2603:10b6:610:a5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Fri, 6 Jun
 2025 18:46:54 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.022; Fri, 6 Jun 2025
 18:46:54 +0000
Date: Fri, 6 Jun 2025 19:46:52 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
        Michal Hocko <mhocko@suse.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
Message-ID: <f2d8febc-cf95-44dc-9f01-b28151fe1282@lucifer.local>
References: <aEK_R93gihEn-xW6@tiehlicka>
 <50ff9149-2824-4e57-8d74-d8d0c063c87e@lucifer.local>
 <e5fa4a36-2af8-48e9-811e-680881c06b86@redhat.com>
 <1a7513cf-4a0a-4e58-b20d-31c1370b760f@lucifer.local>
 <e898e52e-a223-4567-9514-b4a021b5d460@nvidia.com>
 <72bb36f2-65b6-4785-af9d-5b1f8126fc78@lucifer.local>
 <2f866f12-2aa0-4456-b215-08ddc9b13b1e@redhat.com>
 <3dfbbd63-697d-42aa-8906-539d74df9123@nvidia.com>
 <44af8f5a-2d94-498b-a3e0-31f5dde74538@redhat.com>
 <20250606184212.GB63308@ziepe.ca>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606184212.GB63308@ziepe.ca>
X-ClientProxiedBy: LO2P265CA0236.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::32) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH2PR10MB4262:EE_
X-MS-Office365-Filtering-Correlation-Id: be3ebd48-9b03-41ad-9de9-08dda52a81e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lbWByLp/NCXYtnImUQ+U3hkHvOOlFDS7DPFUXR6K+IDS7Cm9eQPXXjFWCpbA?=
 =?us-ascii?Q?piML3kLeZ0nBV//E2qG7EtYM4/hZPMee6jAh7cCJpVmy2+lwCwKydVEyu/Dp?=
 =?us-ascii?Q?kn2Ob/DBw8Ld48vbW1HojwFD7Xki1aI1WcV+2bkRvTr7M2/dAm2Q/JjKA/hM?=
 =?us-ascii?Q?utpipTqYeJGeVLcw9hz5OlCZD60IOGk4SDnhSos/5xBs6UIrdCiTbObHHB3e?=
 =?us-ascii?Q?/HVSIoUBOHeLUweMhfpCIUUEy4ReYYg6sPbHARdGUN/Sp/eKB12UTaP+D7ML?=
 =?us-ascii?Q?q/Sv/7eT9P9banA2/KUeinBYB012ZEj2UJRqem88HLO3YesdcC7CXKWWnqYh?=
 =?us-ascii?Q?lsue3F1SRegrn/kLKQQxRmeXqn5jlaRofvhtznP6APMtY3+HHDNTgjP0agfp?=
 =?us-ascii?Q?7uBhirUYdqYidqNyuZPMf+EBmfEDkRyJf6vMrqP26icc4Q3xjkx3wIGg8Bp4?=
 =?us-ascii?Q?vclLCZSpqlKaBfWj/wpMfGScGCzJ9C4EsHqey/HI9MgNq8q15EPGwbeQVKtO?=
 =?us-ascii?Q?DPsQx88RZP4pcAtnn8XjjeXyITRxmLK+dTatuB5P9pKiPEk8aatkiH/7HDxW?=
 =?us-ascii?Q?A3bs5wv4GTmiAcdnkz9UXRa8IFMnh2LKVbKXfombenJ/q1BWQa+HO7IPDIsb?=
 =?us-ascii?Q?hNb06yefffn4yjrONrt/IEg0M/bKg2CA5NuVVGA8BhaXlmQA2Sp/37dcb+Jw?=
 =?us-ascii?Q?hMxUe92mZRsj/1nfYiFOAhHeKayySD15xrJirna8Uc/Qnuqk8oMxKiZkeJ28?=
 =?us-ascii?Q?WO1gG1xIMk6QpUccUEUMsGHPPDx7oGYTSGKrFSvEe3JpTBq0e1HcAxfRQayj?=
 =?us-ascii?Q?UL9YDdMRi9sVvpHYVlTOMNQsCZzjkSOKcZitWTOKDz2q5utGlvv1apMKqRSq?=
 =?us-ascii?Q?7C5edijlnFEmNqAChE9dHNYXoEuNY4SVbbmc6QUX1HpSCe7TmxmSSXu0esTj?=
 =?us-ascii?Q?oKd1A1qW8EoZHtZi223hCIagcNuaXzeXP2d8vUqb1l+zE9+CgONVuREAA7Az?=
 =?us-ascii?Q?kvR3Tt2x1Z+IOcHipdYY38d0cv5BWnF8a8pVSlr/MQbkeSLV4YpNp0KxxuZ0?=
 =?us-ascii?Q?skvvs81rFqlhUftTPdh3QW2weYIQdVLMr3KjuY7QFTq/wjwJuqK2lTHyqmD1?=
 =?us-ascii?Q?tSeEdk5zm6kyT0M6ToaxqI8zY36i0lRUS5x2EEgTSV27DMSmitNG2qxJBlNJ?=
 =?us-ascii?Q?OA9wEIrx8bfqzFKKy+uwzJeZs2vSGb85jdLOXaZ9GWaYCXdDFkqI7E1gH1Fp?=
 =?us-ascii?Q?bp+8yidb7E4do6g0etwdVvSBRK8auwL3wDf+mHvYwCZXr3ubUlu8TgO/VkDu?=
 =?us-ascii?Q?ELP3VWk+LmAhx0XBdsUI8mQafV1GHA6pYcLjL8Ue80tU9sSu6CKi0QE8mo4U?=
 =?us-ascii?Q?RG409+ced8hEkAKUWZRET/mg0h9TMcQx5huidA2kA43SuzQKBeFgj7PQO2Ah?=
 =?us-ascii?Q?BLC7Ijuufj4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MCRI2dOCs2kIl04jLS9/gN3sBwpGWxdYil3MyGj6nmM37CU0R10v3xhGiIKl?=
 =?us-ascii?Q?cL5rHBxTFXXZnMucUJn93Vx8E+KUX7A4o2FJcne6F3YHbVXBRVLfe+qPkkug?=
 =?us-ascii?Q?iEe/RrocFZME3axDrFWaxVndTZ2LPior144R+IhgXazQTldPiXR47QOd2jfE?=
 =?us-ascii?Q?/IrCMmMvmm0UFXHvLGaL87vZWnX02KLvqnRfDeZBrV0QdjFQh6wvcMYLH+jg?=
 =?us-ascii?Q?hetltSZH3x+8QhfpZ0uvCed3dnDMpXl+Y7ueVX3jCWr0aqvPn1P+U3gtUwV8?=
 =?us-ascii?Q?G+2uDHHEwZuMYx+KoSVYWdPST2ewH3TZjI6TU/5vv7WFZbYrJN2BvPzT3cQh?=
 =?us-ascii?Q?FUF16ymScj98LaKLYBqnjQl1UkbdPmWqlWnIx3SH3/ZE4yqW2QYB8j9G1KgW?=
 =?us-ascii?Q?IqMRWhkNC32td8fKnDeg06h+soiNzHYE1fPqb+4GlvEMUShHJ0JGfy6UVYRR?=
 =?us-ascii?Q?/f4p53plr28rM/vvkutTI7MtqLiAj5CTD7FJADqhhoepnxKjC5USt5CyDbyn?=
 =?us-ascii?Q?ewpZpuB2ADzQ1r7SejXRoI1YSGHFxb3mfRNpngrY8wtxpi4ZO8V90fHIciyR?=
 =?us-ascii?Q?LkDYt/EUWgujI8XwBMiq1P5aMBLu5Kz4iwMGAvhsDba6+E/ZcK5qGUlNrgiK?=
 =?us-ascii?Q?uaXRDRMj8rTa10cqPe0NvRz0JoCYiab6LuBer4e30aj+pwmUYF/Mans+yE/C?=
 =?us-ascii?Q?JOVjV/qVAQx7N6N0qbWcotWHVYqgGlL7b3JpuUYqaxIt2aSys92LegzYOVET?=
 =?us-ascii?Q?CA0PDBE/dTKgSuFAviQC4m/YgA57+H9ytB9ywXf/ifoKWn/8jodh0VKcg1it?=
 =?us-ascii?Q?aR7a4IgvfTj8pZG1ypqLSmfXCbLfnkUb1+ABTc1zp0uisreB6BY1EC7JS+Qt?=
 =?us-ascii?Q?7F1ozkk7pb+XfasaPEASvaP8VrRwPb28WKnechNasH5uOgRar4D3g3PNwJ9a?=
 =?us-ascii?Q?XA9iqDntRaGNGZuq8BFkxEKsTA4qajfmUCemm5COW6h1RXn5HAratDTo+4hf?=
 =?us-ascii?Q?tg4UB9UaMBT3e9DtVQQBMMLy5rolvNqWlPXtR9YZw/8moxq9kIT/w9C3Ud6U?=
 =?us-ascii?Q?vHZq6xI2+GY/3XeCd0w9SX1XthVM9nMA26YOK55MZWOmrQUCQe/5SPfzMIYp?=
 =?us-ascii?Q?HmFuhhS/EpByjWnkH5NHC30W9F7ckDvQ8sa7zXhyPtw3z3OFcw2VXSpYiOOJ?=
 =?us-ascii?Q?swT9E6JYlniVL3rtzGuUJ1mV8lg9XGJkWQQ76vSJk+Go+LJjl31Yn2fQLYMz?=
 =?us-ascii?Q?Cls7A/K8+V4jr5FbFOhtkBB+Ki1GqQb13vdv/l/ObfiSSvCqrpvjjUzvNS7m?=
 =?us-ascii?Q?PK07vEoqOZEaUCxadYeEekYLsutHfgjvolJTWe8GX1caOH41aUzApTXSQQ7l?=
 =?us-ascii?Q?KVhh9lmhLbfGjYp8fugWDt093VJRNlejaSxY6lXmIYzlC6Za9HzPJh8xbKTI?=
 =?us-ascii?Q?Sd2iV+wls5bep1Q1g1jlR6mn/go6Rcel4M+Fll/TsrGx6AOGwgD9AoiUqbmG?=
 =?us-ascii?Q?NgYkEyXkJcndsxMAzZBcUhX2GJcvwChTdmmtDkf6niM8crSiYYczPEbb4lxp?=
 =?us-ascii?Q?dJsDzy6P5s2PS0wOesBZ3brzyIfzenSotrizrsroPDWETwy5KFihJStDjbtA?=
 =?us-ascii?Q?nQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kN9OJgCWla+NO+jc5n65zE+7bi/MXsBjT64uYP8p4tQzFxHD9gQeaNky6Dyan+Mbaf9Pr/iIIpAN68qgogwTTwSdPF+SFj4gqTzWFRVzIdymWfjVWIf1w1B2YNR6r67WAV94ace0ijNcbpcaqOkH8g24Gsg2IFkxDlI44shDxzH6dxVQLHR66K+F50RVT9MpnLaU0T9CYKYAI99ezXYpO8QrKrvVbjNa3k3b1Fd59M4HsZNKvfkN8Rv5TQKmz1l6GwbM5dmLAQ4JZTb88fwQQNkRDMy6YRHcaVgNPwsD7VJS7O2A7aFBKoxQ3B228jylFc4QDUJcp6Pdi52/M2t083zqsbMun+gTLAKIQsjqgUkQRtd0IryPh8SfLA7/KJ+I+4TnUPvtS/MgGKa80vfg/nCgUVpwWibNnc+SXINmRgydGFJbqhkXcKiIGCORaDVT5z/oqAGrJHrZngygWvt9Q9LeqDe1yqKVdVmWQ0E+rMTQ7kgw6C5Y19P/HfPqUOQjAcd2JejjjQKbqQxgKMAiePUIjereuI1xsEKHGjeqlDZR5P6hJDz2T06sClajPWzI00FW6s2zQl/Dy8/rIykzxW4ywIoe5/LeKGMm77zuJN8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be3ebd48-9b03-41ad-9de9-08dda52a81e2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 18:46:54.3472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w8cdptfTMvdVsBOFd0bQwJ3odG3VeewW6ENAJPa1pLoUjDtJsGLoKZHH2gmK3IZEg8ai9td0sod2Oge6iEIwkE/w1bl5l83InXRkAepmJno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4262
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_07,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506060161
X-Proofpoint-GUID: KQlqDN8tbq_k5PAsxb4nJkzKjuwwbwje
X-Proofpoint-ORIG-GUID: KQlqDN8tbq_k5PAsxb4nJkzKjuwwbwje
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDE2MSBTYWx0ZWRfXwItpg/o1ZiKW 42c+jK4DewrtbN9Au2hu4891HTXLEDXqKd7lm3xrGCtIyejrr0Ua1yUTS/aZBdnSTl2Mp4kTVPl 0nnW+ppgyLxPBUfiO3i/LtR/EYsFdwGU0KSrOOVOdhVHHEyB9KGoDX5SrpQsSxKjsAB5+K2f8/x
 2NHBt+iR5z6DUtVHdpZLfkQ1gARjxoNqa210pXXmrxN6WYf3D3CkLmG+vA9BjYljse6vDx2hr6u dto+AuIewJN4Nem+z4pK7T1MFNilAM6UDje30egG3TbcC6qB8q2oOZ37va+0qEQxA+vMk2okWJr ODRjVPkPUeNhXQtDCryaoD+dTrMLQ+bOnU1d2bvkPREOHHpSaPse9luSUtsTqGTn2PZLL7JpgjE
 4mpiwMjVVTsNMs6ZmK4ZH4Fu8mQKRXM4Ik7/roDO1Y/B3d3ccuyG5NA+IqHgkQ6+XKi2YSyh
X-Authority-Analysis: v=2.4 cv=FM4bx/os c=1 sm=1 tr=0 ts=684337a2 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=wPwb6I6EMfc4Ls4vSKAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10

On Fri, Jun 06, 2025 at 03:42:12PM -0300, Jason Gunthorpe wrote:
> On Fri, Jun 06, 2025 at 08:23:25PM +0200, David Hildenbrand wrote:
> > > One last data point: I've often logged onto systems that were running
> > > long enough that the dmesg had long since rolled over. And this makes
> > > the WARN_ON_ONCE() items disappear.
> >
> > I think what would be *really* helpful would be quick access to the very
> > first warning that triggered. At least that's what I usually dig for ... :)
>
> That's basically my point, it doesn't make sense to expose two APIs to
> developers with a choice like this. The WARN_ON infrastructure should
> deal with it consistently, maybe even configurable by the admin.
>
> Keeping the first warn in a buffer is definately a good option.
>
> Otherwise how is the patch author supposed to decide which API to
> call in each case?
>
> Jason

To clarify - are we talking the first instance of a specific warning, or
the first warning in general?
