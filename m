Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6C661FCE;
	Thu, 15 May 2025 16:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747326311; cv=fail; b=cKFgATquCcZ29CNJ+yhYrp/wc9vIU+HjJrSTGjOLhX3i3GUITl2GuHh2QV31fMpZ/Dyc7rQwjZfTyYHziZdwWVUPUATWp7ON0Va9MfNotkE3UTeNao3SHfteXwZKuPMkMMQi1eIO0ny/mjtUuGwVNB2nix/yHLgR4cZc5eQ+wek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747326311; c=relaxed/simple;
	bh=RRpq6YtMCwBcdPgkPKCRNcGjWqiJ+l1erqhKFBaS988=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QxYKJ1Hk+1oFCz90wxYs+p1BfO3n3Plj0mFmpmx93UbF+4xCFXUEox4m3z/P0pwrGVCeesu4G5p6X8HfGFgzpGMORvoIybZwn//BCRH22o6DkrczA8oANlta0Afduja/1iEGTqgKYA9WZD5KYKzlk/o4QHFcj4E9QA/mcVoJT9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jdW/1K0S; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OsnIMrFc; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jdW/1K0S";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OsnIMrFc"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FF1oLn022187;
	Thu, 15 May 2025 16:24:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=AReuBEE8MocTP5PGn5
	4/eyBqLMOE8ymcg/elXNtNpRE=; b=jdW/1K0S1TkBes3+n6UMAu+wdj9UdpTZuh
	aHIxwl3uER0u6KgqvoUZaRYIqqrDYvTD/QuXPkmN/4tspuqbR5pt22gZb5Yrxj2F
	QdmveA9qtGScZssgjM9eJZLHDRXyTexBDyR9uh4u3GqyH+Uw0QzF1hdMeNkY+Keb
	0bDVcAQ5HngpyYZvmKbaMR0uRniiD4EB0ePYFkAyOcfwe/Mf7Ea0HRHB3bBgwDtU
	YVPwyxIe8ZKPUwxfEMomHnVATy4XVcoqaVDCkaequ2qrXyEu1IL/YI7V8pET8+Bv
	VX6aeyAiuCx1nND5feNLg89Gkn2Fis3vQ8jeWQPm7jrE9AAOCazQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46mbcm4k85-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 16:24:24 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54FG49eR004484;
	Thu, 15 May 2025 16:24:23 GMT
Received: from cy4pr05cu001.outbound.protection.outlook.com (mail-westcentralusazlp17010007.outbound.protection.outlook.com [40.93.6.7])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46mqmdn5t6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 16:24:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AYLeBCSZz2aIT8o4efLyP6WCl3u5yN6L594YXp9chzamqED1lkPRtHq1AaOaKHG2Zx9WFTLDUm/7L4GSrKRTU0H/Jp/u9t5vgMIQ/dMnVcCJntPFSsh+VIMWXuBhfi/s+K5GxPR5Lym12mvtXhzeCs+w8H86L6zLsYls3QvbMUFPBkHBm1fPzazPn4nOc3+E3sMu+Yv05NaVYL7RMwlsPLXf67NdquA1YmiAf3NmLBAZR5RgmbU/z8vyapW4hOFTojmyNWpty4gwcSyELTgUbvxgphYUQC4AYpXP2OqOGxqCKCUAUlY35hSROC5VgO1VEouqqmbu9naafd0Lny7Nvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AReuBEE8MocTP5PGn54/eyBqLMOE8ymcg/elXNtNpRE=;
 b=g1lGlI6sANgds50bzibdjBllfC4la2E/Xv2Q0WmH5MlVflYDNzPnNS4Oqs02Lv2b4vHjiyoeC5Ya9027G4I4I9Ja+Ls9okEJyRieFsoLRX5s06eRQj6F2U5dzXn55kviz6Ji2gFLC8DwWv8FHHGw9HFY6MEZMN7TzHOE9vIvWwTJO3lS1E6dvR5LR00rlx3B7wu+XFbxrgjLm5fcwSuA5ccHz174IMJVgTyXwvt4KskOKFQXTFNpGTDACRfU1EKRle8xy+Bhwsp0xUq14fhoFJn7BkEXu6KZBfb8soRpDVwyNRDGkLqWIo9aDfisE3YUfNXdvk51/DoKye8KD5kLug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AReuBEE8MocTP5PGn54/eyBqLMOE8ymcg/elXNtNpRE=;
 b=OsnIMrFcmQJFxTt6x/aG/JHikej+QAcG4HvYttLqqHs1WP6vVz3rRtANolHsfnVKd3q+98OFt6VRUDJegn1lvklL51lOh4MrU+bwgW2knW859ou3kQcroVOmVdtsi9JEr6NSqmVUkoje0ILUdPWl1n6oM3/BCH1oz0Hq1zszpJo=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ5PPFDEBD75B51.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7d7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Thu, 15 May
 2025 16:24:20 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8699.022; Thu, 15 May 2025
 16:24:19 +0000
Date: Thu, 15 May 2025 17:24:17 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
        linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
        riel@surriel.com, ziy@nvidia.com, laoar.shao@gmail.com,
        baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 0/6] prctl: introduce PR_SET/GET_THP_POLICY
Message-ID: <54b9e8de-8722-4d60-a9ed-3af62467fe7c@lucifer.local>
References: <20250515133519.2779639-1-usamaarif642@gmail.com>
 <6502bbb7-e8b3-4520-9547-823207119061@lucifer.local>
 <5e4c107f-9db8-4212-99b6-a490406fec77@gmail.com>
 <e3efdfb7-d309-43c8-be39-c02d886c5b45@lucifer.local>
 <ef6c91e8-19e5-4e86-be1d-dd066a141ec6@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef6c91e8-19e5-4e86-be1d-dd066a141ec6@gmail.com>
X-ClientProxiedBy: LO2P123CA0098.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ5PPFDEBD75B51:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bb4e20a-f2bd-4d2f-9a53-08dd93ccf1db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mgJ0W/D7grbQxEManztHRpAn7A7hyFKfcxMspRqXhXJ3O4GOx83cGvkj71JO?=
 =?us-ascii?Q?5Aufj5qwFxZxdKE12SG8yk5nLlfrEZnQGJeFUL2fDlruS1ZWxbPai9O57d+Q?=
 =?us-ascii?Q?vMpgpwZonEPCylK/lOralIFCY8Yf4WGcpgWRbmFs44LcG5CFpA46s3oQ8D76?=
 =?us-ascii?Q?Z6ziETnpO4qvX4gL4opxUrtTJnb1sN64GJuwt/rWS1OPIe55Rh7fNC7Cpugb?=
 =?us-ascii?Q?1A2K9lOfbw1g/lSPvh1UBNb3rYbTOgF05xduaPxeMf0Dh0+hFxa6yBeGf+vs?=
 =?us-ascii?Q?/BWIxmpvzto6ePGhPlCeTpLWYAGsybNX9hnEbQvZkOj7uWLGx3WymGP1Opbp?=
 =?us-ascii?Q?7B+S35hfJm8gxtpuIx1dBGnrzQpgVt52rhVgjBInGavjhRKZbxMwUwnVUkMb?=
 =?us-ascii?Q?C1tlNZEaYblBDoLadXM0RaG/GnD1gUysGNyU8FlNTogpYaRRPApawLY3TtMV?=
 =?us-ascii?Q?OSlC6CDvvBbHR3JBF8wtGsQeXo7e0hvXhLQdfTwmiUKgeh4DAmzdN8GqoKjS?=
 =?us-ascii?Q?L+p4osMRM8+1uCNluQtBVwOP49X0Jedw4qd7a5bVlaa/db57urr45BeuvIxh?=
 =?us-ascii?Q?8oR5LXgyKZTkLTHnWKQC4LnLMmOLEgaFqReju1dQSj1MTML0urqsk0rBjspJ?=
 =?us-ascii?Q?+hX3NRqI5ANvrCCm8CjL+6f63YC1HW0WmVwpUGhx4sgYrYWkqYB5w6H5mOSv?=
 =?us-ascii?Q?y41R2lPKGjlXGayA/4lTFnv6p7zCdVIOTDUpivH9Q/2NxpBwTfwp58km+pSI?=
 =?us-ascii?Q?mohbiiiJ4Bw0zTe5D2sjw59tdq1XOz3kDjypKw4gME6KafHDy1sREFGeYTdF?=
 =?us-ascii?Q?kCsi8aeXkJ+BXxVkM+0hYvbVOu19XIffV7Jx+rAy6/dlxRXKTRECcTIv2by+?=
 =?us-ascii?Q?BrjUz7c/uoQOY3Su8TKLXewpysoSNnqUmUp+LRwy6HHJkjyQiMuZTaVVAgxm?=
 =?us-ascii?Q?J0/AE2yQguGQL+ilj6mNKqLTEi3gj+hxrG2sg+jydvAOMMPCfn4Hd5492m0y?=
 =?us-ascii?Q?9VgywC4hFv5vpbcuF80Ymgp1zPP0WsCoduFANvq7TsbzUB6rHIIxXfwtMUD+?=
 =?us-ascii?Q?EUNlCMtAleh1wimXtRzF58W1TOH+WFKep9d+I1ZhFcqKqkIYx6Vge1uhUro+?=
 =?us-ascii?Q?GXyQdVoc1Pw5M+5t6j3vpWksTehgbf5JSum/JzPpMrnrWhGxyJhhOfihyGoI?=
 =?us-ascii?Q?BhTKI+2dYBHkU2ky1o9e+4VQbg1ArR1ml3hadbGGe3jWbWMuAIJdfq6ZKrkR?=
 =?us-ascii?Q?1u7ufqmxkpsuEZhhmrPIZiqGc8YhffdDemcIP5dqt3+LlO4wjgF9aZ90CxB0?=
 =?us-ascii?Q?KYQ2XRlTQiw/N/8AbPB9mf1XpZ+BBNvqeUk1kISNCHhfE+AFuq9RR80UR32z?=
 =?us-ascii?Q?PC3upeHwKZVxlbTlfxgTkBjl4q0kOIPov+1UQysv20ZoyX477DWK6uc8PsOR?=
 =?us-ascii?Q?TPrlwD3SV+8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zkRA+rupasEQq6+8BCBduQ3Q/DTfW7e8hLkgQKM07wF+rEEkGtgarh18Xy7O?=
 =?us-ascii?Q?amELF89hm/0Ubw/WN27QIxB1kmTcb3NxWsQpa06QDhCdNr8W/nyqC5ggxvz4?=
 =?us-ascii?Q?tYHvm2vEsKxO37K5YBDKd9/iEZcUbWEs9B76si8DqezO0FQRUXc1+MELZ+QQ?=
 =?us-ascii?Q?BvqYUmU2wgQC4a3dV3l30WrleY9NJuXQRCwV/aeyCPCp1YC93EA5T+Pog0DV?=
 =?us-ascii?Q?92k09ESr1N3nJ6Wm4UA1fgAaLEmHFH0q4SLd4Mtvzi1NtsihYEWNO9NmBwx+?=
 =?us-ascii?Q?WZM4HIp0gPg5BVOnMAV/RpxEAF09QdALZr4htKLSYzaDf0BDXNqeGh8AndoU?=
 =?us-ascii?Q?50ykdl78qu16Zc+6S9Au5bPM7U5+gLGh5fpU0KDOLj/yzAnEJKy+9en4tjnX?=
 =?us-ascii?Q?X8c2QCKTdkOp4lrP/3PzVIa3JIGOevCi3WTGyg4hQnmjTqIsGWrbDXwGalW/?=
 =?us-ascii?Q?124y87Z69xhAoEbLX+TS9X+4p7aKd1ytwfAGGPO6MEzjVxoLMzhPbNftEy2/?=
 =?us-ascii?Q?CNlwcO90kzf8EHlv1OAkw6+RZ5vbJN9g+Ix0tpI6fkg+DPNyWZ+eURfvNd5f?=
 =?us-ascii?Q?Q2ySJilFtPij9Yk/Jeh0+YhZdVB3q5GiiqiawgRrZeHeI8Xlaf5g3F89buPb?=
 =?us-ascii?Q?Td4cehvxpDOCTjl7fVv4dFWlCMhsmPYiq1EAEArCV05i9azK7+6RX3mbHY3V?=
 =?us-ascii?Q?tTcJsuDsD9azvwb5f5sEwRPZTRz3jdNQhoKRaCuoZRJqDg1aoLCtGm/udmYu?=
 =?us-ascii?Q?UKU/QRVsb1Y5HmQjKB4zYyfRAztIn6QlOVi18Let8JcJAhTV1RUkDFMGqmLs?=
 =?us-ascii?Q?b4BKcz7JI/wHF8oQI/FLZMR/HFpbLlxjUu0kz/Oay9rZgJIMncVQzaVTBkEK?=
 =?us-ascii?Q?OLTE79B/V2xYK9OqriqG+kZwerS5wjifMpRUICcA24r48t5VWpatr+k/TJFY?=
 =?us-ascii?Q?0Vt1Ir5wuEoxjU3a2BnDTHyLNta1X9oHpp4lxuA6FveRyBcnPMlsc/B+Skm6?=
 =?us-ascii?Q?6s41l3cmndSzNcolWKZVrGIEC0QwRbCcwC2dnCjYDaF/11P4A0lY7iu2cqRU?=
 =?us-ascii?Q?CCShTsokE+KU/284M7zGwW867Vh6kcpHCwxbVdP7I4C0rbg31qM100m8OXpy?=
 =?us-ascii?Q?pJNK+SKuztPXumiAZLta3S6TCIdq2Dp/7aq0Z99Q7pJVhpSh67n3STfvxdOI?=
 =?us-ascii?Q?DZAKqp+XRkYl66UL8yr3ut84tHWqxnYFvMT3X+56xL9B0zTsst9/AMy5VTIy?=
 =?us-ascii?Q?L8jRF+TvoxOH13v6i7EhwObYMnLdhcJULtyGt3OUn3wmb1xeAwDm9JhBgv94?=
 =?us-ascii?Q?DGsTFbNiwlAeJVLs0asZ89P9AG9DQBbFFwZ/ysIpLPYj0fcBaiUgOlB/21FZ?=
 =?us-ascii?Q?zi0RyT+f9iRSrhTfX2kYz3rtZqirYQLjEwX18Wxv6uemhSo/Xx3XN+xlcbLF?=
 =?us-ascii?Q?8+j+KwpdUFxtFtCVFA3jZzzNYBU3/6NxEkuxq89Q/pX9XV02KCQtSR7znshZ?=
 =?us-ascii?Q?JXvOPkwBEuJcEohsjLHGwLgqiWluWnVfhiJ82b5shEoFYBFYHC3bt6HWztJP?=
 =?us-ascii?Q?DZHwzfSMhqRQ4XwnSwRH1KxaC1JKAgX/YTqfrI2n0lnS4g5jbhdbe6PXnuxs?=
 =?us-ascii?Q?CA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TaxRrI9h0+pBhXEyBrc5noo4Y5GFyjKALTE4ZLGH7Ya1JtjALTJzWqOD3IEKkLzrd/z5zVc8NZ3cE6ueJJxInO723XlCI+j+2WzPj+umQcez0/dXr4TpRnhLqtDNtW9Anol+t97wKyN/1Uy6Ktgi7xCJn7XOgc21mh1+z8XhelYb69HE7175Rd3tE1wB7PGqIT8x6qYYwFZUeBHOUG1RFDDMynnT/HtZk1twihp074Cy5g3lUqXb9d6BFaQXdFQtpJVe6sHKRKY2dY8jxGpakPWo2+bYhAwY9ECbmhMSHnWYrpyfu78w27fb7yQWLKouG9IlDPFoqmKViwhv68te1qOmGSa4CNJtmLsz18KfCbQaqxooTGz+QKPdJ7kc6bDMfUdAkZC16O/3EIMg+scGueuidvBxHnAvYZ9xCl5wE5jfkpttjPWeyOcOXJ1zSuj8emNCNsIrqetcan5mGqJ8G52+Hzc0ZLi0NiJCyWlfZO8OIEZQmM6ADYYadKmDHrRc8jbr4l18+0sgiM7D8vnFisGALTKcOay3fl2jhVw/8AeQEVzqSZ50/Q6rmPintCBXcKvxpclvg0jMjLdbLc842ZWWlr9XI1/mHrnH69vJX68=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bb4e20a-f2bd-4d2f-9a53-08dd93ccf1db
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 16:24:19.8817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3v+FyTIzJA8ChzsxQ1NlgXRibORKSA/Y8RDJB0OeOxks8eCQhcL4KXspaQcfUqSMKXxjMnxgolEVKhfgPw42ILk0R8aG7kVKBcZLHBukc0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFDEBD75B51
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 mlxscore=0 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505070000 definitions=main-2505150163
X-Authority-Analysis: v=2.4 cv=DZAXqutW c=1 sm=1 tr=0 ts=68261538 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8 a=UOoWtHHyIRfueYSLnUAA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE2MyBTYWx0ZWRfX8UZJu0g8+dEU UOci4qBjs5o6D8S6W0TSthXeIEWoQc3XQ4gBU/12bdyrYdH0lNCzMoCJwXH7DSpwwkPLssFycwL qtCX1beaoxJ3pEETgBk9HFB5OMj0xNCmi7T8XsiO15uxRy+J+VADxtTSafrypE421cDgEu0XfZJ
 HuPqdEA61R800uyyxqmmNyCF0zCGDgpwCIGJL1ryYdkTj3agcgDkSKZjb4S0rlPdwfEBvnQVV4Z bLepSTjqRLg5tVoz6fGMKOadC/L68p+J05sC+OKQRquWV5+J38ccq87byB5+AdkUKV7KuGTA4T6 1m23cKKTxtaqYyRDsgweS6Ky+pJ6irlhpekY15+wbOFq25qrlRa8PQ0BUb3gt21Euds2vgQRrID
 wBz87v2DiOeQ899Sh6Y2mGxafRaoyvo4Hb9GGxl/7N9pRvmaAMrdEpLr5HuYbXt0YUchiBeh
X-Proofpoint-GUID: OwrlB_XnzFo8Fahiz95HUBm3FC7-xkia
X-Proofpoint-ORIG-GUID: OwrlB_XnzFo8Fahiz95HUBm3FC7-xkia

On Thu, May 15, 2025 at 04:54:40PM +0100, Usama Arif wrote:
>
>
> On 15/05/2025 16:15, Lorenzo Stoakes wrote:
> > Thanks for coming back to me so quickly, appreciated :)
> >
> > I am reacting in a 'WTF' way here, but it's in proportion to the (at least
> > perceived) magnitude of this change. We really need to be sure this is
> > right.
> >
>
> Lol I had to rewrite my replies a few times to tone them down.
> Hopefully I don't come across as aggressive :)

Haha this is literally totally normal. And something I do a lot (I thik we
all do :). Ask me about the time a friend called immediately prior to me
deleting a sentence that I had realised came across badly, then forgetting
to do so, and then sending the mail... ;)

No it's fine, equally apologies if I seem aggressive, it's not intended, I
am just passionate about _us getting it right_ - and I think the healthiest
approach is to be as direct as possible, which maintaining professionalism
(not withstanding star wars references and comments on how prctl() is
simply the dictionary definition of deep, unmitigated evil).

But it's vital in kernel work to be able to be absolutely robust, in both
directions, while maintaining civility :)

>
>
> > On Thu, May 15, 2025 at 03:50:47PM +0100, Usama Arif wrote:
> >>
> >>
> >> On 15/05/2025 14:55, Lorenzo Stoakes wrote:
> >>> On Thu, May 15, 2025 at 02:33:29PM +0100, Usama Arif wrote:
> >>>> This allows to change the THP policy of a process, according to the value
> >>>> set in arg2, all of which will be inherited during fork+exec:
> >>>
> >>> This is pretty confusing.
> >>>
> >>> It should be something like 'add a new prctl() option that allows...' etc.
> >>>
> >>>> - PR_THP_POLICY_DEFAULT_HUGE: This will set the MMF2_THP_VMA_DEFAULT_HUGE
> >>>>   process flag which changes the default of new VMAs to be VM_HUGEPAGE. The
> >>>>   call also modifies all existing VMAs that are not VM_NOHUGEPAGE
> >>>>   to be VM_HUGEPAGE.
> >>>
> >>> This is referring to implementation detail that doesn't matter for an overview,
> >>> just add a summary here e.g.
> >>>
> >>> PR_THP_POLICY_DEFAULT_HUGE - set VM_HUGEPAGE flag in all VMAs by default,
> >>> including after fork/exec, ignoring global policy.
> >>>
> >>> PR_THP_POLICY_DEFAULT_NOHUGE - clear VM_HUGEPAGE flag in all VMAs by default,
> >>> including after fork/exec, ignoring global policy.
> >>>
> >>> PR_THP_POLICY_DEFAULT_SYSTEM - Eliminate any policy set above.
> >>
> >> Hi Lorenzo,
> >>
> >> Thanks for the review. I will make the cover letter clearer in the next revision.
> >
> > The next version should emphatically be an RFC also, please. Your cover letter
> > should mention you're fundamentally changing mm_struct and VMA logic, and
> > explain why your use cae is so important that that is justified.
> >
>
> Thanks, will make it RFC and add that I am making changes to mm_struct and VMA logic.

Thanks! This isn't sort of 'another way of saying no' by the way, it's
literally because, as is obvious already, we all need to talk about this :)

Once we stabilise on a way forwards then we're good to un-RFC.

>
> >>
> >>>
> >>>>   This allows systems where the global policy is set to "madvise"
> >>>>   to effectively have THPs always for the process. In an environment
> >>>>   where different types of workloads are stacked on the same machine
> >>>>   whose global policy is set to "madvise", this will allow workloads
> >>>>   that benefit from always having hugepages to do so, without regressing
> >>>>   those that don't.
> >>>
> >>> So does this just ignore and override the global policy? I'm not sure I'm
> >>> comfortable with that.
> >>
> >> No. The decision making of when and what order THPs are allowed is not
> >> changed, i.e. there are no changes in __thp_vma_allowable_orders and
> >> thp_vma_allowable_orders. David has the same concern as you and this
> >> current series is implementing what David suggested in
> >> https://lore.kernel.org/all/3f7ba97d-04d5-4ea4-9f08-6ec3584e0d4c@redhat.com/
> >>
> >> It will change the existing VMA (NO)HUGE flags according to
> >> the prctl. For e.g. doing PR_THP_POLICY_DEFAULT_HUGE will not give
> >> a THP when global policy is never.
> >
> > Umm...
> >
> > +       case PR_SET_THP_POLICY:
> > +               if (arg3 || arg4 || arg5)
> > +                       return -EINVAL;
> > +               if (mmap_write_lock_killable(me->mm))
> > +                       return -EINTR;
> > +               switch (arg2) {
> > +               case PR_THP_POLICY_DEFAULT_HUGE:
> > +                       set_bit(MMF2_THP_VMA_DEFAULT_HUGE, &me->mm->flags2);
> > +                       process_vmas_thp_default_huge(me->mm);
> > +                       break;
> > +               default:
> >
> >
> > Where's the check against never? You're unconditionally setting VM_HUGEPAGE?
>
> So this was from the discussion with David. My initial implementation in v1,
> messed with the policy evaluation in thp_vma_allowable_orders and __thp_vma_allowable_orders.
>
> The whole point of doing it this way is that you dont mess with the policy evaluation.
>
> hugepage_global_always and hugepage_global_enabled will still evaluate to false
> when never is set and you will not get a hugepage. But more on it below.

Yeah, I mean I kind of hate this, but madvise(..., VM_[NO]HUGEPAGE) already
does this, regardless of whether the VMA is in any way suited to THP or
global policies say otherwise.

So maybe I can put my criticisms of this aside and wonder out loud:

1. We want to make this behave as if we were just setting madvise(..,
   MADV_[NO]HUGEPAGE) everywhere.

2. If so, do we then take the semantics to be, in the case of ...HUGEPAGE,
   'these VMAs should be considered by khugepaged for collapse if and only
   if global policy is set to one of [madvise, always]'.

3. If so, do we also then take the semantics to be, in the case of
   ...NOHUGEPAGE, 'these VMAs should NOT be considered by khugepaged for
   collapse even if global policy is set to [always]'.

I wonder, since this is at mm_struct granularity, why do we even bother
applying this to VMAs?

I guess the reason we are doing this at VMA level rather than mm level is
that we want the user to have the ability to override this per-VMA.

But couldn't we just more efficiently do this by having the khugepaged code
check both mm->flags AND vma->vm_flags, and have some function handle the
override _explcitly_ there? Is there some reason we're not doing it that
way?

Forgive me if this was already discussed.

>
> >
> > You're relying on VM_HUGEPAGE being ignored in this instance? But you're still:
> >
> > 1. Setting VM_HUGEPAGE everywhere (and breaking VMA merging everywhere).
> >
> > 2. Setting MMF2_THP_VMA_DEFAULT_HUGE and making it so PR_GET_THP_POLICY says it
> >    has a policy of default huge even if policy is set to never?
> >
> > I'm not ok with that. I'd much rather we do the never check here...
> >
>
> I am ok with that. I can add a check over here that wraps this in:
> if (hugepage_global_enabled())
> 	...
>
> > Also see hugepage_madvise(). There's arch-specific code that overrides
> > that, and you're now bypassing that (yes it's for one arch of course but
> > it's still a thing)
> >
>
> Thanks, I will put
> 		if (mm_has_pgste(vma->vm_mm))
> 			return 0;
> at the start.

Well, hang on, let's maybe try to reuse this code if we can :) we
definitely don't want to duplicate this.

>
> >>
> >>>
> >>> What about if the the policy is 'never'? Does this override that? That seems
> >>> completely wrong.
> >>
> >> No, it won't override it. hugepage_global_always and hugepage_global_enabled
> >> will still evaluate to false and you wont get a hugepage no matter what prctl
> >> is set.
> >
> > Ack ok I see as above, you're relying on VM_HUGEPAGE enforcing htis.
> >
> > You really need to put stuff like this in the cover letter though!!
> >
>
> Sure will do in the next revision, Thanks.

Thanks!

> >>
> >>>
> >>>> - PR_THP_POLICY_DEFAULT_NOHUGE: This will set the MMF2_THP_VMA_DEFAULT_NOHUGE
> >>>>   process flag which changes the default of new VMAs to be VM_NOHUGEPAGE.
> >>>>   The call also modifies all existing VMAs that are not VM_HUGEPAGE
> >>>>   to be VM_NOHUGEPAGE.
> >>>>   This allows systems where the global policy is set to "always"
> >>>>   to effectively have THPs on madvise only for the process. In an
> >>>>   environment where different types of workloads are stacked on the
> >>>>   same machine whose global policy is set to "always", this will allow
> >>>>   workloads that benefit from having hugepages on an madvise basis only
> >>>>   to do so, without regressing those that benefit from having hugepages
> >>>>   always.
> >>>
> >>> Wait, so 'no huge' means 'madvise'? What? This is confusing.
> >>
> >>
> >> I probably made the cover letter confusing :) or maybe need to rename the flags.
> >>
> >> This flag work as follows:
> >>
> >> a) Changes the default flag of new VMAs to be VM_NOHUGEPAGE
> >>
> >> b) Modifies all existing VMAs that are not VM_HUGEPAGE to be VM_NOHUGEPAGE
> >>
> >> c) Is inherited during fork+exec
> >>
> >> I think maybe I should add VMA to the flag names and rename the flags to
> >> PR_THP_POLICY_DEFAULT_VMA_(NO)HUGE ??
> >
> > Please no :) 'VMA' is implicit re: mappings. If you're touching memory
> > mappings you're necessarily touching VMAs.
> >
> > I know some prctl() (a pathway to many abilities some consider to be
> > unnatural) uses 'VMA' in some of the endpoints but generally when referring
> > to specific VMAs no?
> >
> > These namesa are already kinda horrible (yes naming is hard, for everyone,
> > ask me about MADV_POISON/REMEDY) but I think something like:
> >
> > PR_DEFAULT_MADV_HUGEPAGE
> > PR_DEFAULT_MADV_NOHUGEPAGE
> >
> > -ish :)
> >
>
> Sure, happy with that, Thanks.

Thanks!

> >>
> >>>
> >>>> - PR_THP_POLICY_DEFAULT_SYSTEM: This will clear the MMF2_THP_VMA_DEFAULT_HUGE
> >>>>   and MMF2_THP_VMA_DEFAULT_NOHUGE process flags.
> >>>>
> >>>> These patches are required in rolling out hugepages in hyperscaler
> >>>> configurations for workloads that benefit from them, where workloads are
> >>>> stacked anda single THP global policy is likely to be used across the entire
> >>>> fleet, and prctl will help override it.
> >>>
> >>> I don't understand this justification whatsoever. What does 'stacked' mean? And
> >>> you're not justifying why you'd override the policy?
> >>
> >> By stacked I just meant different types of workloads running on the same machine.
> >> Lets say we have a single server whose global policy is set to madvise.
> >> You can have a container on that server running some database workload that best
> >> works with madvise.
> >> You can have another container on that same server running some AI workload that would
> >> benefit from having VM_HUGEPAGE set on all new VMAs. We can use prctl
> >> PR_THP_POLICY_DEFAULT_HUGE to get VM_HUGEPAGE set by default on all new VMAs for that
> >> container.
> >>
> >>>
> >>> This series has no actual justificaiton here at all? You really need to provide one.
> >>>
> >>
> >> There was a discussion on the usecases in
> >> https://lore.kernel.org/all/13b68fa0-8755-43d8-8504-d181c2d46134@gmail.com/
> >>
> >> I tried (and I guess failed :)) to summarize the justification from that thread.
> >
> > It's fine, I have most definitely not been as clear as I could be in series
> > too :>) just need to add a bigger summary.
> >
> > Don't afraid to waffle on... (I know I am not... ;)
> >
> >>
> >> I will try and rephrase it here.
> >>
> >> In hyperscalers, we have a single THP policy for the entire fleet.
> >> We have different types of workloads (e.g. AI/compute/databases/etc)
> >> running on a single server (this is what I meant by 'stacked').
> >> Some of these workloads will benefit from always getting THP at fault (or collapsed
> >> by khugepaged), some of them will benefit by only getting them at madvise.
> >>
> >> This series is useful for 2 usecases:
> >>
> >> 1) global system policy = madvise, while we want some workloads to get THPs
> >> at fault and by khugepaged :- some processes (e.g. AI workloads) benefits from getting
> >> THPs at fault (and collapsed by khugepaged). Other workloads like databases will incur
> >> regression (either a performance regression or they are completely memory bound and
> >> even a very slight increase in memory will cause them to OOM). So what these patches
> >> will do is allow setting prctl(PR_THP_POLICY_DEFAULT_HUGE) on the AI workloads,
> >> (This is how workloads are deployed in our (Meta's/Facebook) fleet at this moment).
> >>
> >> 2) global system policy = always, while we want some workloads to get THPs
> >> only on madvise basis :- Same reason as 1). What these patches
> >> will do is allow setting prctl(PR_THP_POLICY_DEFAULT_NOHUGE) on the database
> >> workloads.
> >> (We hope this is us (Meta) in the near future, if a majority of workloads show that they
> >> benefit from always, we flip the default host setting to "always" across the fleet and
> >> workloads that regress can opt-out and be "madvise".
> >> New services developed will then be tested with always by default. "always" is also the
> >> default defconfig option upstream, so I would imagine this is faced by others as well.)
> >
> > Right, but I'm not sure you're explaining why prctl(), one of the most cursed,
> > neglected and frankly evil (maybe exaggerating :P) APIs in the kernel is the way
> > to do this?
> >
> > You do need to summarise why the suggested idea re: BPF, or cgroups, or whatnot
> > is _totally unworkable_.
> >
> > And why not process_madvise() with MADV_HUGEPAGE?
> >
> > I'm also not sure fork/exec is a great situation to have, because are you sure
> > the workloads stay the same across all fork/execs that you're now propagating?
> >
> > It feels like this should be a cgroup thing, really.
> >
>
> So I actually dont mind the cgroup implementation (that was actually my first
> prototype and after that I saw there was someone who had posted it earlier).
> It was shot down because it wont be hierarchical and doesnt solve it when
> its not being done in a cgroup.
>
> A large proportion of the thread in v1 was discussion with David, Johannes, Zi and
> Yafang (the bpf THP policy author) on different ways of doing this.

Ack yes. I think this whole discussion underlines why it's so important for
you to _summarise_ that discussion. I'm repeating myself from elsewhere but
the cover letter needs something like:

We considered the following alternatives, and none of them were workable:

[list of alternatives]

And ack on cgroups maybe not being quite right due to this not being
strictly hierarchical.

>
> >>
> >> Hope this makes the justification for the patches clearer :)
> >
> > Sure, please add this kind of thing to the cover letter to get fewer 'wtf'
> > reactions :)
> >
> > You're doing something really _big_ and _opinonated_ here though, that's
> > basically fundamentally changing core stuff, so an extended discussion of why
> > you feel it's so important, why other approaches are not workable, why the
> > Sauron-spawned Mordor dwelling prctl() API is the way to go, etc.
> >
> >>
> >>>>
> >>>> v1->v2:
> >>>
> >>> Where was the v1? Is it [0]?
> >>>
> >>> This seems like a massive change compared to that series?
> >>>
> >>> You've renamed it and not referenced the old series, please make sure you link
> >>> it or somehow let somebody see what this is against, because it makes review
> >>> difficult.
> >>>
> >>
> >> Yes its the patch you linked below. Sorry should have linked it in this series.
> >> Its a big change, but it was basically incorporating all feedback from David,
> >> while trying to achieve a similar goal. Will link it in future series.
> >
> > Yeah, again, this should have been an RFC on that basis :)
> >
> >>
> >>> [0]: https://lore.kernel.org/linux-mm/20250507141132.2773275-1-usamaarif642@gmail.com/
> >>>
> >>>> - change from modifying the THP decision making for the process, to modifying
> >>>>   VMA flags only. This prevents further complicating the logic used to
> >>>>   determine THP order (Thanks David!)
> >>>> - change from using a prctl per policy change to just using PR_SET_THP_POLICY
> >>>>   and arg2 to set the policy. (Zi Yan)
> >>>> - Introduce PR_THP_POLICY_DEFAULT_NOHUGE and PR_THP_POLICY_DEFAULT_SYSTEM
> >>>> - Add selftests and documentation.
> >>>>
> >>>> Usama Arif (6):
> >>>>   prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the process
> >>>>   prctl: introduce PR_THP_POLICY_DEFAULT_NOHUGE for the process
> >>>>   prctl: introduce PR_THP_POLICY_SYSTEM for the process
> >>>>   selftests: prctl: introduce tests for PR_THP_POLICY_DEFAULT_NOHUGE
> >>>>   selftests: prctl: introduce tests for PR_THP_POLICY_DEFAULT_HUGE
> >>>>   docs: transhuge: document process level THP controls
> >>>>
> >>>>  Documentation/admin-guide/mm/transhuge.rst    |  40 +++
> >>>>  include/linux/huge_mm.h                       |   4 +
> >>>>  include/linux/mm_types.h                      |  14 +
> >>>>  include/uapi/linux/prctl.h                    |   6 +
> >>>>  kernel/fork.c                                 |   1 +
> >>>>  kernel/sys.c                                  |  35 +++
> >>>>  mm/huge_memory.c                              |  56 ++++
> >>>>  mm/vma.c                                      |   2 +
> >>>>  tools/include/uapi/linux/prctl.h              |   6 +
> >>>>  .../trace/beauty/include/uapi/linux/prctl.h   |   6 +
> >>>>  tools/testing/selftests/prctl/Makefile        |   2 +-
> >>>>  tools/testing/selftests/prctl/thp_policy.c    | 286 ++++++++++++++++++
> >>>>  12 files changed, 457 insertions(+), 1 deletion(-)
> >>>>  create mode 100644 tools/testing/selftests/prctl/thp_policy.c
> >>>>
> >>>> --
> >>>> 2.47.1
> >>>>
> >>
>
