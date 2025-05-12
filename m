Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D52D2918F4
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 11:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747049096; cv=fail; b=KBdMyaMncC81G5Fb9711/Lu9slZGh+jdccVCHuZd0jU4ayEVkLcxK+xj0gUO3/YlCOAFdPBN+63Hp6HBIlWT66bCqukF++n+eSCCGNRkDIhZ02Ihoc873GbU/O57AjN41DT1lSzFtx8tZQGjGjynSKdM0xxtVCdowkJe8yJUvQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747049096; c=relaxed/simple;
	bh=2ASV8+xlgAahpR7MS50J+wNZhInqw24X2PpOZRSODf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XXA6l9pVL2rg8Q+KGxP4ktclWCCUOWskZGae1/cKJlVtlpWho73dTaM48uFpjlFMfSnSZKIvYPe/uy2vvu+uP7QvJpENHhTiyov2tPF9vJMAZUpYPwQGiXYZ3zogOT6gps17URRsozlMFY7DRkkkx1kIBb57E4PcL3/TcSlITfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Rwgyi4SZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pRf7lXM5; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Rwgyi4SZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pRf7lXM5"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C7g2g1006729;
	Mon, 12 May 2025 11:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=PkViLMrCOMm3Vm1cBt
	fWaFFwEePueOQ2Dp9yz3iVBSY=; b=Rwgyi4SZtBF0rOeuEvSqvVjg2Ga7k993CI
	Tn1pjoJ4H25MFAVdt8r/21im1a78iGSZO7IBIwNsKefbDZkkeZd/OoEkqXy4RgVb
	Jda4pB8WT7RVyy+FiT2vXZXRKaH2cOjIEjxk0K7DYBQ05R/Ep9A9/hQxwg8g2a/N
	xUdwSfFO3meewlIy0IodJ9grpgUhCjqOiqRKx4J6Ye/+Tu53p3gmRjfb3ZJXqg/p
	RIJeDDlkMP2mu/JgMWWAZnGW9NTap7RT7fnROfFdsdDpt/4DvBs23k+B8vP2O+L0
	h+p82ODwDWhHS/ADq3SzfnliSiH5/6PnBHpEA2ewFi4pZ3ieLOSA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46j16629wh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 11:24:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54C9pXvG036183;
	Mon, 12 May 2025 11:24:16 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46hw878fh8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 11:24:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GqKQDTNulAvUGXLkI8gQp3kW2RFx8lXVbjxESVzaeURw4SMoWUTHILvhbdKxeZlXFu6Tt7Np+1Zb5bTq+g7pqY6RGkzsI1dMb7AnmlUalmMdqHGddUuVoxFESJenB+TCxfiCch/JQ78xkUDADs48xErCVPSwMmcK/zl48l94+GtbkILUsL3gYyEEz8ybuzxHsqDAtua0SenVWVf7BFQkDGGUeK+ZoIqdMClh9cluDaaQeyi4T/UrLWoGIl+RRizOpK50B2HYalyF4c8tsFnIuLTAbkrm+fus/EpnwAN8kCppT5knn5+bxqHxOa0lCIEcH3qjzULbpexCctFeqLsHTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PkViLMrCOMm3Vm1cBtfWaFFwEePueOQ2Dp9yz3iVBSY=;
 b=L23XBNk0KkehLS6jQB8/9jtPVnYCpXF7fYeglBFt6BqsgfpXDqFVSY/S2p7R3qYkikAMjgX30kxwTNxYRHLTfn28t7yTLYDEBr58LrqrJhw65kBsy3QmOkngGnyK93rwdZy8wuZlBwCnhQZ6ohReD/yFixp7NH9ehhNVNPr6y03QPbDHMPrrZnCo+24M8ZBfBTPUaUmApcJKw/XvYxxmU2qJqqIePJwpFqHHrtWrtPCuj1xAjwOceXGvziY19BVFaB6jUYLFRjc1AzsNulBX/JFcZuHwSllDN977rLzyMVtroBydSBrQn3T3+K8vGHawrnu6KAA5pug+3wl3f9V4fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PkViLMrCOMm3Vm1cBtfWaFFwEePueOQ2Dp9yz3iVBSY=;
 b=pRf7lXM5b8REA00hKA0Q52BmfMnHyOmfiNGUcpeG1qq6C/bIlvjrnbb74AK+PCTfjc3SYHZj0rUTzmJm9fD0cb/8VNYkhV0TSran4XCjgdZz6cudaXR9E2OWBzVJefPeHiorpUqvrfLR6ldrWvK7hREZeZ8cDDXeydT81bUHh5M=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA3PR10MB8760.namprd10.prod.outlook.com (2603:10b6:208:581::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 11:24:13 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Mon, 12 May 2025
 11:24:12 +0000
Date: Mon, 12 May 2025 12:24:10 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Harry Yoo <harry.yoo@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        David Hildenbrand <david@redhat.com>,
        Matthew Wilcox <willy@infradead.org>, Rik van Riel <riel@surriel.com>,
        Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] mm/vma: fix incorrectly disallowed anonymous VMA
 merges
Message-ID: <44fd6f72-a5c5-471e-8044-3bbcea6d8338@lucifer.local>
References: <cover.1744104124.git.lorenzo.stoakes@oracle.com>
 <18c756fc9eaf7ad082a710c91133b8346f8cd9a8.1744104124.git.lorenzo.stoakes@oracle.com>
 <aCFfVHFq_4enEgsL@hyeyoo>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCFfVHFq_4enEgsL@hyeyoo>
X-ClientProxiedBy: LO2P265CA0192.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::36) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA3PR10MB8760:EE_
X-MS-Office365-Filtering-Correlation-Id: 507790ad-dd7a-410e-0dc0-08dd914785a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0Inu7IwGz8+gcn2g2MjXgH6x0qX9WC/9TibLE8WGwYqmVht4hszDi4brShph?=
 =?us-ascii?Q?SdIu1LItdfrsDtYK70v1+VSs8noUxWTukVwID1sfhTopPFPDHK01F0mABZDE?=
 =?us-ascii?Q?7Mrp6Z654p+6I0xyTozPYxO8puN7mnV+GKY6hWWWv5sQQYnrjW6P5sD6sg1b?=
 =?us-ascii?Q?qnlbECQJKOfUrs6Z7RjIklU3gFDh/0Fr9TCAgF42kSwziuqCJVQEZLgwH9sC?=
 =?us-ascii?Q?InrM1X1BeaZ+zPCtZ5ByYnEoc5Q2RL4jTfDIySK1KmcSWTOxqbZOs2ckP1v6?=
 =?us-ascii?Q?GLHKLc578Gz/vNRWmhjCvjokQETq3cXPMaCLSg1GzFjPrnXFYj9gRyzTF0nD?=
 =?us-ascii?Q?ZCTbVpQpY28W3W3ibHNlxcPA7rP0K/fmtzh6mFdVwin/81GbQmwx2MkYq3+L?=
 =?us-ascii?Q?DZieBdy/nbYIarMoeGl6larfuErBofhAMF0OjjfbSsr6F6pIE1QOw2xvbKgX?=
 =?us-ascii?Q?5tL6lomdqNR+RlUz/8g/nIlByqo1TkjqnJiLF+h5ZGbdDXIKhYNmvuuAxvVM?=
 =?us-ascii?Q?khDB5PuifUqVfIUpqlGcMPw5eHU2o90CAprtHkUgQx8NJFTQXy2dQbJcmsUh?=
 =?us-ascii?Q?58bFWoBfcVKj3yVohC1H1uZuQoc51esTniFuTVa6nlLmexfUM27T5U7wIviN?=
 =?us-ascii?Q?DZufNG5S02O8R6JRoNHCKO5U+hl4cxe+ENKk/Hio7xuu184W/KS6bkIFIYXN?=
 =?us-ascii?Q?DnBoNSYmSYFST8Ja/+QmHDphwYOs7ma7sndEH+itvtSRwrloVS2gcj1uZASB?=
 =?us-ascii?Q?xkDv6qQLN548H72BoRHvI1IGMfM7zt1MCmqK3ZhPPYZBeEfSq/ABNDKKPH0Z?=
 =?us-ascii?Q?1aa0vMSw1jHpSrPP4N+etAqSd4OSsb81csOa5qaNxWrDJHitq8A0xl4vicGY?=
 =?us-ascii?Q?cpiL29gyyD05UBdDSp7/H3Y49ZNoNGL0l0An3zfPky7Sx7rM1EbFxNHFPz80?=
 =?us-ascii?Q?1BtQl5dmbio+oB05V4zbNlyCQCG+P04xG3LW+LESCmmwuXlllPEz5KfBkFy5?=
 =?us-ascii?Q?NKb/6d55XIiOLoyIPwkJtBAyEgLU7kJJ8JdF2kkP1FK40wZ5/YzgicAW26dG?=
 =?us-ascii?Q?m1CB3jv5A3xgXW7ExZFY+b9bqwm/zu+HblGmoNL7TJBukPsL0+r6Q+CEqTCI?=
 =?us-ascii?Q?YkFBcX2HW011r8TbaUHIYjLVSkaVL4lTtGc6LdgRjxUMoV9xNDIIosqw4+Nm?=
 =?us-ascii?Q?25b6cF6Hs4dwOM2eSenkzelIiO6sCfmKsePOCgPK/KFUf0dEB/DfaLNO3iP/?=
 =?us-ascii?Q?BBOlAmdUg+Bmr4jsVNy5eeCAo3T64Tk2+0dYbrrlxM7ApyK2NOMZNT5aUWI2?=
 =?us-ascii?Q?iWTih6yi2YwTxO/UtKI+/aBcEJZLEp+iHXsubGv+oYJzS1PUn0BtIm1/fIbV?=
 =?us-ascii?Q?sjtCKRxWMEiw/nLT4tT98vgYbNC67uwdK6v7MI0ZQhHBpMNQ+aWAXp8UO1MC?=
 =?us-ascii?Q?J9zAp63MeIY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EZLwVB4nTczqS50InAATE7mLGEMayB0P7XIC0WVeAKjFZvq4MkWlS/vXhd9o?=
 =?us-ascii?Q?1lxX5RmWKV7Q5HbeqqIGHK4GYligaVm5qXDxyoMyTjKRkTcK374ejgK/Zwoe?=
 =?us-ascii?Q?QC0c6CXKiRO84tsbuAqX+l3RO2GHtfCTGqAMZ41YPZgiSmfSkrHjgpgVfVuO?=
 =?us-ascii?Q?D1HAIvQmH/j4E+t3ExFGu/9lg5gzMGkQhKLju/ca+1dJyn6/C9REuaULN7eB?=
 =?us-ascii?Q?RVk0yVcitck1aA6pMRFLGzzeDGjMpIaUjPYoU923pI5rVYef26Y+rb/Kpeu/?=
 =?us-ascii?Q?fwFxDswvqEm0N+AR0cy3Y0t8Bv7KofMbSQAOku7/T+qtX/vwyrFvhhbwHL8c?=
 =?us-ascii?Q?6KESJRcs/+e38JJNEWIU+5lNVX7rOtd+vO6uUYJiQ/+WlLFLKwXDr4Y+Noy4?=
 =?us-ascii?Q?nEZ7r099hM/7Sw7YcCrWxBYNPAJpVf3eGtzJs7Sv7AwSh3/rsKyBVYyYAOmg?=
 =?us-ascii?Q?OugjPIxK2YEVYaJ/ylEUTF3BrQk7jJqMd/EDmXryLwnfGugXUDfTFcoJ4+aH?=
 =?us-ascii?Q?1n4/joP8H0TwWkZ1Z289YsGEKnFj+JlMd7dBIQf4jFHUFf1menJ+WfY+Y/Sd?=
 =?us-ascii?Q?4pnBvLIf7qO+yMPOMPkFmxAKdwiyRjx1jld0pG/JDOCmm42bSYCpDRIBCEKd?=
 =?us-ascii?Q?IPRVkXPiyRxwlOMLfPKFG2tNQ5fkV273WleUmX49QS8Dgtq+ayGZrDj6gFcj?=
 =?us-ascii?Q?T6rJcAtJZkamt0iavCtgVWx07DtMcuR8txUHhVjjUQGafjStcGAVMuYZpJZK?=
 =?us-ascii?Q?h0bR3vLHziTiD9qWBk4Gp8sd3SliXQPJrSPweSMs/oLNjbQYqDjzmUHPRnDl?=
 =?us-ascii?Q?c/rluu2n9uGEi0s++E89Ccot2o/RUZ3XkaDcz++6HegkAeHJ8nrCVGSgGdXT?=
 =?us-ascii?Q?nhq+glvsEC2HeOqG18L9bxuGw+ADJyMzsPJliiaZXHfahJpm/lZA+ERDUk3k?=
 =?us-ascii?Q?lS+YAGzWZSeyfAdbbALn/+DXptOvK8cXRIAs5ZnQr65Ec0+ww5D1eigq6nPL?=
 =?us-ascii?Q?0l5meheA+MYJp+3nWQygjC4Zwu275OmMHOXctyoGgnL08BmAdGeDdv+dpHtX?=
 =?us-ascii?Q?doQ+khCRIgLDLBiDjrAVQY8qlsr5h1OiLQLUDMJ77A/VIQ2N+ZoDWoyG+VPQ?=
 =?us-ascii?Q?ajtYBX9V9sBSe5iFnVvsC7BoA3g8br336e0cGGI36BltV2e+7OYtMCb1eP3e?=
 =?us-ascii?Q?puwY54M2jcdbKuWgICzr1K6B/Ng32jquM+ELLKU5nJzjhCLoAMrmThPHOfMh?=
 =?us-ascii?Q?eutSZ6PzyEF5oY4tIjSN6qW6tFg4oF4dhkPMEkVOkM9P9QTL7f7P5+c/1h1c?=
 =?us-ascii?Q?JENyscrcvVMZQpVrOP5PRWMqtgu3lrBKxueZ8jyc7ZA4o6m2B1puUN+Y/4km?=
 =?us-ascii?Q?5dGA7ZA+cQ4IzOF9ZHbzKEBTzB25CCEU5c7N3ACN8u8v9SSz347mOqnN78fl?=
 =?us-ascii?Q?PKxXFR2Vj+bVnlLXa90RyazwvN6JlbKGB+WheufDcdCBFRHuYQRrezkWhOBX?=
 =?us-ascii?Q?CMVyt7l9xfkCd5n0RUTStxsfPL0GfPUrlaRwSt4Cq03WbfM/3wTtPP+5U9i5?=
 =?us-ascii?Q?T12ky2hmWipRcZsQSNxqg5VzZNSuILT45gO55T2Jq9yxnGk3zDt0ii4mYubu?=
 =?us-ascii?Q?Fw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1evdT2m4fuJq70pqAq/BmZEVebV9mCnMNgqACKt2kR38UnsATGi4KE4wz06ZXjtGIsihiRq/TqdvxV8gf5pVDTHPsCE2vQntH9/2pMjlb/GxkQ46FZdBQUDPt8bwJLKm6Xp+dPocGyG476QXZlCyc7CB7PsBFxAG5wut5vSB530yPuPJGL3iu/sC5M4OhQDOREcRu2FtWqGaE1rFHZMq7hZmd1XklUwCKSzmJlX8r+WBq6UQJoOSDsGUXTxwffG8B0DquMrzooN39LMQrPwWUvYq0/4X5OHb8JgFikX3CHsDRGm+t4SWbenpS5yaohS+yIzn+l4kT6NOREsI9fRDCYVc+w/A2V2Yh4qQmNEtx8rgzPTnyHxl1uSc2UbfFSh+TwJf6ATxHou8k6tn/ET7pRkn4YMPvKxbew7Dt2AAtSMNTAsKyXJLBU6ziwQ/XKTiuzRmn/x4GXeg4ayykYT2SGZtyBO6hP5ebi7JkhUIgI62xKUo84ZzAmSupJHxi6lepgdhNmeAJz0sEJ9FeNlGo6MhdgSfCn0o1gfqUf39Urb64xyy426b7DWkPy9sqUFtdZcRTCvPPJZuD29yl4K7WumuUx3yjb+2d634PCu3roc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 507790ad-dd7a-410e-0dc0-08dd914785a5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 11:24:12.8194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jdCYrgsRqnxTghkEcOEiXOBELkMaH4l5h6kjoluKF/PaU4FRT+mzgeRobUcl047GuSwI4rvTksQm2DY0EemexNSO9AzFXL+EK2a+CpqWuxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8760
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_04,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 phishscore=0 adultscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505120119
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDExOSBTYWx0ZWRfX7emcqxs4psai 1r8GE94khrS5CeD/pty33vqh+Be9Ls6JYhch3AllNhQEflNNOAtQuY0IvMr3RMJuGlzpkiwVTeb ML+3tkqsWHz6rLjQinGljkr0O0pdgaSIE6EP9upThHM7LXpJddnRtrgxc5KqXZROREXxqRDBimR
 TbLSjsOgnepmTxhKeCDNURwsHjw6RC/FXrji1nrOhRz8eEw/x9FcAHKdUM5ExWX/aFiaxPeOnLn gY/WaBPBQhWfDi/dW0BpP7lHovkOpdaOvQYuBumOkjoPqy4G1p5BNVefRe1008JdZ/mi8EVBWpp 1C3S1X1lBcdLsDmrbH6SeiHvn1oB1xCgZ7PZC3w2sxtEB8c6cpzdEGAAZIzT54N+GWA4DOUtcPG
 2PYOjpxRAcwoVTf5Q7S+tmZtiOoOwRY2DcnrZDsWwS28SVGpZu/9oQYbrzVWm7lc2FVA7Fgs
X-Authority-Analysis: v=2.4 cv=VMDdn8PX c=1 sm=1 tr=0 ts=6821da61 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=7CQSdrXTAAAA:8 a=HvF3FlWtVw7Q1Te6DVAA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 cc=ntf awl=host:13186
X-Proofpoint-ORIG-GUID: 33EFrPyg7MN3Xygf3CY4lWrmiGXG4J2-
X-Proofpoint-GUID: 33EFrPyg7MN3Xygf3CY4lWrmiGXG4J2-

On Mon, May 12, 2025 at 11:39:16AM +0900, Harry Yoo wrote:
> On Tue, Apr 08, 2025 at 10:29:31AM +0100, Lorenzo Stoakes wrote:
> > anon_vma_chain's were introduced by Rik von Riel in commit 5beb49305251 ("mm:
> > change anon_vma linking to fix multi-process server scalability issue").
> >
> > This patch was introduced in March 2010. As part of this change, careful
> > attention was made to the instance of mprotect() causing a VMA merge, with one
> > faulted (i.e. having anon_vma set) and another not:
> >
> > 		/*
> > 		 * Easily overlooked: when mprotect shifts the boundary,
> > 		 * make sure the expanding vma has anon_vma set if the
> > 		 * shrinking vma had, to cover any anon pages imported.
> > 		 */
> >
> > In the modern VMA code, this is handled in dup_anon_vma() (and ultimately
> > anon_vma_clone()).
> >
> > This case is one of the three configurations of adjacent VMA anon_vma state
> > that we might encounter on merge (where dst is the VMA which will be merged
> > into and src the one being merged into dst):
> >
> > 1.  dst->anon_vma,  src->anon_vma - These must be equal, no-op.
> > 2.  dst->anon_vma, !src->anon_vma - We simply use dst->anon_vma, no-op.
> > 3. !dst->anon_vma,  src->anon_vma - The case in question here.
> >
> > In case 3, the instance addressed here - we duplicate the AVC connections
> > from src and place into dst.
> >
> > However, in practice, we very often do NOT do this.
> >
> > This appears to be due to an inadvertent consequence of the change
> > introduced by commit 965f55dea0e3 ("mmap: avoid merging cloned VMAs"),
> > introduced in May 2011.
> >
> > This implies that this merge case was functional only for a little over a
> > year, and has since been broken for ~15 years.
> >
> > Here, lock scalability concerns lead to us restricting anonymous merges
> > only to those VMAs with 1 entry in their vma->anon_vma_chain, that is, a
> > VMA that is not connected to any parent process's anon_vma.
> >
> > The mergeability test looks like this:
> >
> > static inline bool is_mergeable_anon_vma(struct anon_vma *anon_vma1,
> > 		 struct anon_vma *anon_vma2, struct vm_area_struct *vma)
> > {
> > 	if ((!anon_vma1 || !anon_vma2) && (!vma ||
> > 		!vma->anon_vma || list_is_singular(&vma->anon_vma_chain)))
> > 		return true;
> > 	return anon_vma1 == anon_vma2;
> > }
> >
> > However, we have a problem here - typically the vma passed here is the
> > destination VMA.
> >
> > For instance in vma_merge_existing_range() we invoke:
> >
> > can_vma_merge_left()
> > -> [ check that there is an immediately adjacent prior VMA ]
> > -> can_vma_merge_after()
> >   -> is_mergeable_vma() for general attribute check
> > -> is_mergeable_anon_vma([ proposed anon_vma ], prev->anon_vma, prev)
> >
> > So if we were considering a target unfaulted 'prev':
> >
> > 	  unfaulted    faulted
> > 	|-----------|-----------|
> > 	|    prev   |    vma    |
> > 	|-----------|-----------|
> >
> > This would call is_mergeable_anon_vma(NULL, vma->anon_vma, prev).
> >
> > The list_is_singular() check for vma->anon_vma_chain, an empty list on
> > fault, would cause this merge to _fail_ even though all else indicates a
> > merge.
> >
> > Equally a simple merge into a next VMA would hit the same problem:
> >
> > 	   faulted    unfaulted
> > 	|-----------|-----------|
> > 	|    vma    |    next   |
> > 	|-----------|-----------|
> >
> > can_vma_merge_right()
> > -> [ check that there is an immediately adjacent succeeding VMA ]
> > -> can_vma_merge_before()
> >   -> is_mergeable_vma() for general attribute check
> > -> is_mergeable_anon_vma([ proposed anon_vma ], next->anon_vma, next)
> >
> > For a 3-way merge, we'd also hit the same problem if it was configured like
> > this for instance:
> >
> > 	  unfaulted    faulted    unfaulted
> > 	|-----------|-----------|-----------|
> > 	|    prev   |    vma    |    next   |
> > 	|-----------|-----------|-----------|
> >
> > As we'd call can_vma_merge_left() for prev, and can_vma_merge_right() for
> > next, both of which would fail.
> >
> > vma_merge_new_range() (and relatedly, vma_expand()) are not impacted, as
> > the new VMA would never already be faulted (it is a proposed new range).
> >
> > Because we already handle each of the aforementioned merge cases, and can
> > absolutely therefore deal with an existing VMA merge with !dst->anon_vma,
> > src->anon_vma, there is absolutely no reason to disallow this kind of
> > merge.
> >
> > It seems that the intention of this patch is to ensure that, in the
> > instance of merging unfaulted VMAs with faulted ones, we never wish to do
> > so with those with multiple AVCs due to the fact that anon_vma lock's are
> > held across both parent and child anon_vma's (actually, the 'root' parent
> > anon_vma's lock is used).
> >
> > In fact, the original commit alludes to this - "find_mergeable_anon_vma()
> > already considers this case".
> >
> > In find_mergeable_anon_vma() however, we check the anon_vma which will be
> > merged from, if it is set, then we check
> > list_is_singular(vma->anon_vma_chain).
> >
> > So to match this logic, update is_mergeable_anon_vma() to perform this
> > scalability check on the VMA whose anon_vma we ultimately merge into.
> >
> > This matches existing behaviour with forked VMAs, only we no longer wrongly
> > disallow ALL empty target merges.
> >
> > So we both allow merge cases and ensure the scalability check is correctly
> > applied.
> >
> > We may wish to revisit these lock scalability concerns at a later date and
> > ensure they are still valid.
> >
> > Additionally, correct userland VMA tests which were mistakenly not
> > asserting these cases correctly previously to now correctly assert this,
> > and to ensure vmg->anon_vma state is always consistent to account for newly
> > introduced asserts.
> >
> > Fixes: 965f55dea0e3 ("mmap: avoid merging cloned VMAs")
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
>
> A little bit late to review, but better late than never :)
>
> This patch makes sense and looks good to me,
> Reviewed-by: Harry Yoo <harry.yoo@oracle.com>

Thanks! Appreciated :)

>
> --
> Cheers,
> Harry / Hyeonggon
