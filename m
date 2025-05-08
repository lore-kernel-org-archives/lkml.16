Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD5C5A79B
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 09:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746697287; cv=fail; b=NZJz846dLOC53VhW4aKHPdYNkG1wVHiAlHTCfLJFkjNpLDLfLkya6XEUuineDlZHWp+MUD8h+whiBjw2aERU8tH/4zlTX08rnh9LDEWxTQ00Dnxoo/LV66NSFM6OLmyz0UD7v8YYJPSEr9/rsFU57H8EQVCLvoHqYCOBiBuA3m0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746697287; c=relaxed/simple;
	bh=o1KAPQJeY20TXxdphskQNsZgD1HK6bruDEGZWcginnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rqxMnJybn80IzAXQmGcaix/64KLsTUA3YIdKfHJHH2gj5VAwf5BysUAvQSWkx+/hUtCDXxhPEyaXt9VeTgdn6D0HyE0JbC5iDvPu/lIRb6+SNVhKwMv+3YgDKVCBW0ue+zOfrTRU2bps2Z1kaDkWjXGKAjGlHcjOO7aKGPzsb8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Wbk+aDGq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zAo/KU6a; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Wbk+aDGq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zAo/KU6a"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5489IvdS012826;
	Thu, 8 May 2025 09:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=unFXpfcVCdS3t5BG3p
	KgjkD3GzzE0qMshx0jX1qmIVs=; b=Wbk+aDGqL0+xzAdteVhmKS+1MzO59CRoTy
	ogZoBBcJF10hnMDRsbF5knK2SzYUjyezIjdxLJv0v4O9Pf2yVITwitguY01HWNsn
	Hb6GHOWwsttDlZEEDGc5k5sJ5JEHVEe7Pu8iYAqQrvzN6BhqAD1JLIjbBbtRSNbB
	IcHgQ6GPkHoiqYql1VgkUP7v2asN/2hEVw4UOwXX5FWPgwDb7S1iYdFyaerBs9H/
	9Y837hDTUKvRwGjB5aizly68avGpYojhJtmAWV9N80z2EtmXmqKcH8+iFVhHg+ce
	nKl9WigXU/Wib1v1n2IkuQjdlP7Kd//3BjTBnTyuBMhtk03d8XXw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46gsvd0149-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 May 2025 09:40:40 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5488LYLt002696;
	Thu, 8 May 2025 09:40:39 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazlp17013076.outbound.protection.outlook.com [40.93.6.76])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46gmcbhwqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 May 2025 09:40:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n2D13YwF2navAQI7TfgZCpCZgBukjYCXmYIMkmAZwzLQ3mBIfZfRYW4k0rz0ddB32Vefox6wUoZAgax0P19lHUBqbr5Azt0MJnXl6iOYmy0kgu4jXy+jB94sm4uFsfP+F4vNLAa58BWl6UqcQeOzj1u/5nGiyGzdxW6eQTW1rFoJtU7qPQI+7UxOt/eCWod3YE5TskFU/iYjVFSruGooyQeNS7JR4ifljlUOi7R6hhoDM2/sGhm/FJzcohj8Orw55dAs3JaNgv6XSb7xZXtbc9IiXOtnzz/itvtRsFDU0JANWuZtWIGs2P9pGm8VkCpLhgpRTg470iEzJemQqrQx3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=unFXpfcVCdS3t5BG3pKgjkD3GzzE0qMshx0jX1qmIVs=;
 b=Gyf2W5yuFoq2/oQ4hkA5VsgpTkU1VYtGtm/zW92OZeAPi4GorPChb+V3jkUizrbw89L1hKIczOgltmzFYf1GFnx5w/xgs7OFJtnc9NYJB3WKCNVFU9xM8v+ccVNhgiTX2J9nJZEP/uTH8L6B2w28L6W8lcaa9li1qZwQZedKYcLutJlyeLPIt++cLLL5F+y0xBzwg9sf3c8t95uhsYCjZESdOGmQ5W+FaywkeNq5dORr+4/UJdN24BQ0LFKppFfkcqB7QnydmgTROoPw6YwbirriLHGhfqRu1i/0eY0xmPI9sKEHwZcYi/vr6D1FwKO4WAGclJL5QYSp9LZcfEvhfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=unFXpfcVCdS3t5BG3pKgjkD3GzzE0qMshx0jX1qmIVs=;
 b=zAo/KU6aWBEMS4GI+d9nYQfcScYZj5HgF2oCkxH2QF8iV05GLfE0egikpWFRJD5/C2u5QktC+Ge81Jxro0AI3GvqU6XDCEFAQ/G/fmQY5N/NiCcIlHG9WHKxFTLhaxG0BR+iRv7ubj6526GGNyleB73yqLUqXUYSZmkfjjq0+WE=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by LV3PR10MB7914.namprd10.prod.outlook.com (2603:10b6:408:21e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Thu, 8 May
 2025 09:40:33 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Thu, 8 May 2025
 09:40:33 +0000
Date: Thu, 8 May 2025 10:40:31 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org,
        Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
        pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        david@redhat.com, peterx@redhat.com, ryan.roberts@arm.com,
        mingo@kernel.org, libang.li@antgroup.com, maobibo@loongson.cn,
        zhengqi.arch@bytedance.com, baohua@kernel.org, willy@infradead.org,
        ioworker0@gmail.com, yang@os.amperecomputing.com,
        baolin.wang@linux.alibaba.com, ziy@nvidia.com, hughd@google.com
Subject: Re: [PATCH v2 2/2] mm: Optimize mremap() by PTE batching
Message-ID: <69d84b71-d90a-4a5b-83c4-984432b4999a@lucifer.local>
References: <20250507060256.78278-1-dev.jain@arm.com>
 <20250507060256.78278-3-dev.jain@arm.com>
 <f8c21905-a03a-4e4b-b897-71beb6b8b393@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8c21905-a03a-4e4b-b897-71beb6b8b393@arm.com>
X-ClientProxiedBy: LO2P123CA0023.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::35) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|LV3PR10MB7914:EE_
X-MS-Office365-Filtering-Correlation-Id: de29fcb7-6477-4d38-5287-08dd8e146108
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GVmkaSFKkmcpW6lquKwGRHEfuDHZKnrTH74Uaf9ssZ/pvnchar6L5qMrU3E5?=
 =?us-ascii?Q?oqsRUGcUCiNb3u5ij0GRJEieMd93JmozLIgtaEhPexul12UtY/Y/9U8SdyNK?=
 =?us-ascii?Q?X0ypDWevoKfpE0sIjtN0apToGx6+2BDPtYlU8ftQXF21r0jjLZFgUnQqsMt8?=
 =?us-ascii?Q?0hDH/6Wm1ePKw0BMAv4AxbDaWvZUW2g4dKq3BkYa1sxEuadZhb+uIoE8ivJe?=
 =?us-ascii?Q?bDsNwR4HWwKv6S7o4yUwPqDo3Up4WBeqFmMLQfvlJwbUt6zEn6nBqpQCIRGc?=
 =?us-ascii?Q?bkM0SfLffHKpJrQpaRECfuD4Snet2AAwkcpptXrOiFQD1yrA8YZwE15REse7?=
 =?us-ascii?Q?dTfT7zHcYHbGbY1p77WOxe8scRYA87qCJ8wzBmLq9+IX74sTo0azpC63sNcZ?=
 =?us-ascii?Q?ZFrpLpQKRiK0ftoGZmUYJ2bvb+8eXLuLxs+pu+UjWaWzcJwkS6mXlN4rEgYL?=
 =?us-ascii?Q?QBk/adn2STTGKUDnxt8+P2GN1wYBnqx5eN5hiAalAZpojaZCHxc4I4h1hGc7?=
 =?us-ascii?Q?l0Hxc6DCiRUQYNH2cyZfq7Kg8AHCPoca1LblKSRrvuYD2I1D+PRGcTHdrAJA?=
 =?us-ascii?Q?3CRF/ZAEvTFXMowD+NhcjBTDWafd00E21NPyD6IGQtJXugb1WOTdmoU5V7Yd?=
 =?us-ascii?Q?1l0PLMyIkWdFpH7e9YLojkMjrvKFRT8UcyKvrTE9/cBNek6YtD6pt5TZCKN9?=
 =?us-ascii?Q?TbgqawUzOjmp+YjZaMsPbhTGxYPs/i5FUm4fGoI3UtF1kjGHswKU2badaR9s?=
 =?us-ascii?Q?8tYSYajdJZwgWNGfTZtxsIakyRYifMFEeohnHQAdmouIgYJ38XatZjdxPTPi?=
 =?us-ascii?Q?yqnKPdvmvqG0075F+cvH9glF71bhPNHDENeZ+VhJ/RsHiaRLxMZc3ePdxkvt?=
 =?us-ascii?Q?jTHXTBLjX+8XldtE/gTkGNgkPlPSN+/uoV2YAP12e3nFGjg2V3La4HofbH3n?=
 =?us-ascii?Q?Tg8M+hIWSe+HaTEKbde5ZA5SACkTFPITjxHjNWQae30ecAwvN+5xIfutPtpi?=
 =?us-ascii?Q?GSMYRvDrs8XYAhiDCcUgkq5xd3ByNGC8aoRB341jXCRPJ8I79dXxD7XQ7rEf?=
 =?us-ascii?Q?57w7i0wU1TX8tth+8uT4JP207xSfCDO/xsJieOIsdPOu8jQtDcuQKYlcG21V?=
 =?us-ascii?Q?PzPFtZswS5I1SFuaM7uExsz6S2Q+blOCYgPonfoUj9oRrFo8+LByAYqhHWKP?=
 =?us-ascii?Q?UrvbrhO20WRfdHJc5K80b1h6nrjPuAxYs4Fk1K0nQcrnWv0OJ9z4rc6YH/fl?=
 =?us-ascii?Q?pOpsn4cHBFYXSVX4kk3brzugR1ojdHTvXRaMN40RF2QXj8ssBggoP4Hw1Tfy?=
 =?us-ascii?Q?0PthHHF17Wefr8Q4tjwmQBCN1aQ7qi/rp1IyRjLUbDgPynq8GkbmnYFpoQC7?=
 =?us-ascii?Q?8Tu/07CV+tYCjvaGEbOe5sQeX3NoIHETSBzEFlLrRsewrWBooPUDb/GMUnYW?=
 =?us-ascii?Q?ApWtOMwjxY0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cpG5nmiIg0WFn44m/2amP3P4JxNOv5WtY7M8w1UfNUxGXeQMK2tmI2VTevVT?=
 =?us-ascii?Q?Dd8NIWZg5w5X7ngpppd3apo8HLx0kZ76vvYQNxtVgFnJvReQvww/TSqGFG5z?=
 =?us-ascii?Q?WQk9CzyThXRFw5OozfXEyzjFn/HXbwK/O3FZOK7qZH4huK1bu9PRBDiDfcUG?=
 =?us-ascii?Q?+g0oiZH9rXAK/DL1xDzW6+uj11W+ADm2eFtUudtyfdS+eW2ut6R6bUznuoPW?=
 =?us-ascii?Q?sQzxZ2jl1Qg5Hse1p39Dp+umMqDn0R2RWZ72OeqVUQVVWx9JHptwDOW0eknS?=
 =?us-ascii?Q?YbE/veCf3uF8Dw1Omeo+W3uNAjMFqYQnBFdOgvPzCV+qeg9dj/cMZ26okNlk?=
 =?us-ascii?Q?v05bZiSxH4q+aKmmR9tuCatSEk1ZP6svmJbKuyOMlo3dhLP6XS/KrJa5macE?=
 =?us-ascii?Q?XX2zMUBmS+q3n936ZXshw89f7KYa7eOCVl/xzetVzsswdl1l6bQHms7lDL+K?=
 =?us-ascii?Q?mh7fVExaq97XmIB4XbuAv3OmCRKNjyClwFTdHZBCmkM0+uxVL7o1t8dWSCM6?=
 =?us-ascii?Q?78J8qn5kbGaWHFL38QviDmA3+5VmRvxXe0u7iMTm7xAieSFP7uKcLo097ncs?=
 =?us-ascii?Q?UVzHHFetx7wdezsIArmxrBb9qZpXWY12CCyH6zf15muALWOzhYRc6n/1VOF5?=
 =?us-ascii?Q?StlgMsD6YW+w0hpkGbb4WXkGAzqAxDgBTKO3KPrDTgkePvSzeX4OCQ7922iH?=
 =?us-ascii?Q?WNVPPq8/q5OwOaCSgkQUS40Fys+fVUVSFa+GFUesK14T3NCtvqAESv6/mEUW?=
 =?us-ascii?Q?R7tjAI0DTplpYBeAXwyKLVziPv0YMZf47Pnd4DZ7KrtNedou2dKAuMOTgPLN?=
 =?us-ascii?Q?3SY+o+HytoXzEKE9Yizw2mo9P6i0XPhcM1hxE4bPpYnZDElv/XjZCPbENRDD?=
 =?us-ascii?Q?HDJGNanxs9NDr1/8bUf+TJZxkTTuXRofAhjVT9j6Pwb+rM+OKqXNnanJUYpu?=
 =?us-ascii?Q?tfknMyUEhzIdQ4cTZdcuTNFfiACBC/PryVI2ZXXakg0LUFS+Rk/rsj4urfP5?=
 =?us-ascii?Q?0fJgAyCckufwkFHKKqlziZt5XqRfYQjRukfcOlYEygOwncupkHmVSf9C7A6e?=
 =?us-ascii?Q?T2XawXk+wZL3NCGYr+HJ8TVH0H/FUa+rm6rVs3CZvop50F7Q9cvbrjIT98Al?=
 =?us-ascii?Q?D06YkvvOQS7w1MHhLjtESSq48hXa4xpqn9SbJ60zW/a+/CNgJq3oE8AUF/IX?=
 =?us-ascii?Q?gZIfa7agXeGhcl41NsPsZuMKgAaPpMjoGmVTtlzD9zMOxv5H3R+e2A6VBo6q?=
 =?us-ascii?Q?xKijoMMX8Wb4olpzRyUwnoZrdc9uYGarWGyh1UOcKJf8rWLWxxg+RWM1PbLB?=
 =?us-ascii?Q?OKec/Ka8j7pGOulZCT7nIDuyKozAG6G633rZswfEV94HevEagS8Kpe3VUV+G?=
 =?us-ascii?Q?iq9KiZZpESHr5qDPYd1ZYnYyt2tzCukJy3h4HtEfvmR1hI4iFCTSutKV2rt6?=
 =?us-ascii?Q?S+GbUHsK5kCqo5/To7WXkMA7C1DqVKCcHF5UgozV+s9QH/KDUAsHJ3KFFiwd?=
 =?us-ascii?Q?6aSV9eDQm1UUzzUVve5sfOOlGF3HZy1CgSM2rbT8uB0miZNI8YN23RZ6HuCy?=
 =?us-ascii?Q?TpThwgF2Yj3yI1w3/d1gF/3TZnLCCxj2iZx1ZlGWOV+QzOJnHkSXF18Y6zEF?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	68z79XaUM/Tl5Ipf5gb1mvq/w+UZSN1F/DPRYkEXO3u+j7kg36ZL5hmV2WC8Nbak+kF6wD8/ikbKfYph6FYFOVKVk9n4SnGY8O1lDuFxw0Qpl+uIChv8gWrIcpDNLNiKNLYyEZGYn9P6/qJwLjOQlMY2e8N8FL8ruh3BlRVamh5Qnj58+MtW9HHZivA9YQ/wGV+QhC0bqm/BspbuvmDFFKdufBcSGbBR5Xwjj1cjZlNV27gT+Zmgk91OlKpuEfcNDLO5KqLeZJtsyxm/Cc+ZeFnGP446dSpoJ3vdvTHBMDOHYJDXwe8m9+1QYFNFvNaMHfub7iAU3rFC1Sv6hCle0OHUa4+NpWhJ6AES4w4FZkYrJ2MJyOy/By3LLIlI1bTbidMej12yP8PPSkNAjVEXsviC5Fz0TM/nhR51QiB1BsklVXrtLDypK+dttsiQ4hkvVs8INatSN2UeAI2X0CPaBvqhNvTOnp4RK0k++rDdTXpyjfh0ZfL13yx32zhUrvAfw2k3vR7NOxJDkOlD4ngVYAshJHWRjLYQvqHX5PJ1Herr/rdaRy2n9bvOOWDin18/htpYGJAfE9Jk5mhOptppTWHPFNG00ltRkX3oGoO0mQY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de29fcb7-6477-4d38-5287-08dd8e146108
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 09:40:33.5833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qLuRFGnwi+19OUx6+NkUC/2ls5LyrVSTLnCsgyt9U8H2HUPIqouYzCPPhKG5GL/mdXi1SL4Pb/qAZ2TPITgPDUWBSSZcom/35zf0LdWGXKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7914
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_03,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=950
 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505080087
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDA4NyBTYWx0ZWRfX1L+FXk4EOb3e IL+fW1vQkou8CNTJJXGeoizoQtxJOdP8of3hGEybBPvAtur0+C4DGB4Z+5hxF7/eIbTWxCHIF9J NtBtv1L4U6xeAXIpDjEE0aQapbktTYxi/AHR+jDmBEcqv/tJMDQ6SGXvSEuj0jiMtARkwuXoxQO
 f9SfNCMcoKmH8LrDpT89zUThl+auVRZOD0tleIpUXBckspFDWKVcFBD8P0OzOn/RRUlCe+tj87g Z0eXuhM12SFiFl4XWeH4Zj9y1No3qMQxFj5MIbCv81un08hYUmCscj7HmTisLUnYTUJtw7fgg6J TI2fD5cAQGDPQD7SrhQOBuWICgV0UFoTEIzXKOaEnw1RWRXqG6KGhKVcSjsjeGfyDoKv+fziIJG
 dse1AkVPpIFIM0aqVNhsZOPyroX+L2o1kxYymbJ0Ozhtq4W9iy2/0GEGeB7tj2NPHVGVUKO6
X-Proofpoint-GUID: 7Ozy16m5ra0XpHJC7NytJa1uhkBzpx1_
X-Proofpoint-ORIG-GUID: 7Ozy16m5ra0XpHJC7NytJa1uhkBzpx1_
X-Authority-Analysis: v=2.4 cv=R68DGcRX c=1 sm=1 tr=0 ts=681c7c18 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=5gbfV246DXSej5NLGpgA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13186

On Thu, May 08, 2025 at 12:46:41PM +0530, Anshuman Khandual wrote:
> On 5/7/25 11:32, Dev Jain wrote:
[snip]
> > +/* mremap a batch of PTEs mapping the same large folio */
> > +static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigned long addr,
> > +		pte_t *ptep, pte_t pte, int max_nr)
> > +{
> > +	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> > +	struct folio *folio;
> > +	int nr = 1;
>
> A small nit - s/nr/nr_pages ?

Agree in principal, but I think nr_ptes is clearer. You might not even be
dealing with a page, if you hit a pte_none() pte for instance.

So max_nr_ptes, nr_ptes.
