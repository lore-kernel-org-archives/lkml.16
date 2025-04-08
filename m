Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4662227CCDF
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 12:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744117146; cv=fail; b=WOjNoYOlejzVUPvKJ+/4H2Ot7VvPayYrH7sq0N5gen3GNGr8sIEnqYCf8vsg/q5irurdXIPyL9gSZAMUFYORBWcQ9yMHZAtFrb6xmoRLPOVh6Md1inDGAQxG2berLGjkd5rJyjs4VC1uNr9/dwosqLy6e0D0R6IzWdQrVkV/1p8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744117146; c=relaxed/simple;
	bh=8b6qLNBXQCJHEpUqy9k0N806XHGKPR4T6vlNyszHoeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WOvk0VF0YpP4cnoTU+S1o+2cfwPDqoFMOvR7dSMdiX7eWF23F7g0xFdnt2ucTgLgukexAHh+5KAY6RbD+gPlED0NfjJE6A/c/Jn1gvlbfrGg5gwtn4LMHAXUca4L6RUWFLOHbtAcXkVIlWh0H01OTQ5/RmqKUYjEmZH8msSZ5bE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=X/naku5z; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ahLkx5cs; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="X/naku5z";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ahLkx5cs"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538C6pXC021844;
	Tue, 8 Apr 2025 12:58:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=AtUyRE0X4cT1poYcIG
	nMLYocuPX8x02cTxhfRCRlYpQ=; b=X/naku5zXgK/nPUWjak13MvxCa1fg1sw9Q
	l0J6VfQdQ1cUjV+bWkikfNsQP5dQdQqrqvcL5M+sUaQOr6NJ2Voh89AFOI2+GHmW
	KaBFHOOQPsmhUex7wk0L8q/sldCPwxSEL+MECeK6cgDIMITn0ic57I9xKWHI53ty
	p4vrun/NY3zet4pI/GusILu/h+rIGduwe8lagFAJPCL4OjU+xQXVqeRpBojrY0wZ
	oYENRPDXVDy+GpR7iOgOAgcTxrcQGQVZv7bGUGZtd6at98kN2kS1MVMHjh8Xue75
	gV4i2dDkNiHAYILPCNzHU04u7VmBB5BAo6I1w8XCL0O29BLNHyyA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45tvd9vmh9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Apr 2025 12:58:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 538CdGZY021074;
	Tue, 8 Apr 2025 12:58:23 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazlp17010003.outbound.protection.outlook.com [40.93.13.3])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45ttyfhqpe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Apr 2025 12:58:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SWayn/SnIiI4LrHYN4r6MmVv0KLTz3p0PWRKgqJX80PiWTq0wQWNPI0JJs4ZgBb1hHa4T75zcU2f4PjQIsptr1n5HJLN9M0rgNjKBtxnL8WKm0+l/+GKnfOonTCRox99l6cTDNSj92g+mheKjRF5eRnsO5wkswucgb72E/JhMQjgCwLqbqgbz5unZ8dVXJ8WVVsvvfKwARgH4yTgCPVLme07jAEACMRNaP9y3p26tF2IHCIKnTKVVk8JP7EwdF5LnxQWOpsvqwm9tHDkMQxxGCnCqz6x3RikZ7IuwR3+GwdgX2KHTzANnQhrxy/tO5oPkRLr4yZB7R5AeBcm0bX+2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AtUyRE0X4cT1poYcIGnMLYocuPX8x02cTxhfRCRlYpQ=;
 b=kzQv+95444VCoPNqKALdpymBtQ7q/UBj2x2uQzAr3vEaU+wuCjZcjRsmomJkLzdVfbuHGv8zYV+0dKSAf56FHmtBX4/dr0R8RQ1DpISe4SdPeYPYksDc9w2jPEGNxxnfssSOawjEOmfYy0xtTGxnqabmvVGrlIxda9F7DCUiTNKyQ8czLvsT1iHOe0F3q/5BP8HFtjT68/Zn36HPS5cggM8kvjsBjVRZuPecYcb/LYhN/wDnDxLVpJiCW/D7L4i/sUB/cXR6YuZIEMi0wWa/F1v37fBU18yWGGWsGt7Dc6PNPBarIk/SHGHRZE4954RlPD2y6X5IPGO0TAGEyNwHfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AtUyRE0X4cT1poYcIGnMLYocuPX8x02cTxhfRCRlYpQ=;
 b=ahLkx5csmPSAoYeYKX+Y4no/GmCf9E8X1P8ibtvFIbZoO1wD1SXGZbmt9LF+zBUhuARwNqoYF76iRXEtTx6myvkxgiOTmNzycT6ps/IzRxcWHuJJ/QURHGon75UnHEdzXjbK1ckXUj+/bnHWBbpKIpVbaE3OmamTHMverE7uI9U=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by BY5PR10MB4242.namprd10.prod.outlook.com (2603:10b6:a03:20d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Tue, 8 Apr
 2025 12:58:21 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%3]) with mapi id 15.20.8632.017; Tue, 8 Apr 2025
 12:58:21 +0000
Date: Tue, 8 Apr 2025 13:58:18 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R.Howlett" <howlett@gmail.com>,
        David Hildenbrand <david@redhat.com>, Rik van Riel <riel@surriel.com>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Vlastimil Babka <vbabka@suse.cz>, kernel-team@meta.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 2/4] mm/madvise: batch tlb flushes for MADV_FREE
Message-ID: <12a8989c-c4f3-45a5-a66e-06ef7c2ef876@lucifer.local>
References: <20250404210700.2156-1-sj@kernel.org>
 <20250404210700.2156-3-sj@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404210700.2156-3-sj@kernel.org>
X-ClientProxiedBy: LO4P123CA0627.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::15) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|BY5PR10MB4242:EE_
X-MS-Office365-Filtering-Correlation-Id: e1949e5f-ec64-44ac-e8ba-08dd769d0a23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zXK5n0i4oCSku0PNdsBjkJgP+CgHiolAavQfljZY/JbQZsZLdi/GIUYnE9gG?=
 =?us-ascii?Q?m8soImAnj6dtQhBJ+4FE8HS8C+XpiBLJ1NYr5x+dlVsKGObrrtDQd/PlQsbc?=
 =?us-ascii?Q?wPv0uhltNxCotrPgFGksgNotIev4XGIcgu0/9RpQ8ZE+Mcx/QzkvJ5/seVeD?=
 =?us-ascii?Q?H9qvlsUeCE+0KIToQmv04vbGHg7KsDnfC1iz6s8RK6J/3Y56lZktosAzJI+h?=
 =?us-ascii?Q?0XGLAkuo7BacZrhVqBJtxls3RLyg/5Ywd2qsntrsKYqrXed7CcdRsJQWqrAM?=
 =?us-ascii?Q?WL20mcGq4UtNPXHBclNsY4vymG76tXlOV2WIqTfKTciCtRqF756SYkN2QI1n?=
 =?us-ascii?Q?CVMQvUn+RHDFOpJTUJwcwywY6NH6E7GO6wL8tT6TVe4QBzTENp0hPIJmNeyC?=
 =?us-ascii?Q?0REqw77TDh6QzlldP2A7V0roBAY4z9THZRIr4X/z7MwOsLIBcDv/7r0ICAgk?=
 =?us-ascii?Q?f6Bvg7Xps2v1bjZVrJG/CFLrMuZ/hloDxuDz6hok0QgRfTzC1CrVCuHAf+gf?=
 =?us-ascii?Q?N1uIo366QIsnC8WMlt1Z1w2tlmJdCgcDtzfKWTMWsyWNkjuyjsWBZI5Sgo7L?=
 =?us-ascii?Q?1BmhlqnJ9ZJXHh2ExM8lQtPqNJQnmqrd89naWjOycc2ww4i8ikp/7yR5DNp0?=
 =?us-ascii?Q?75IlgGz2uufVQNd2KphzwZ2eG8AmGD2j3TgS/GB/AZfVe39Isop0EurHNDjm?=
 =?us-ascii?Q?Io+9w73ojCpCWvcYjpZwCZu6MfTYRkqiXpztGXa8ePd3hVGnmNhZgsDMJhH0?=
 =?us-ascii?Q?MN8RTZPZaVU9dq0mchoh0GlMimvyMeW+vYmgPkfDkSA9FfZ7IBH2Eq44Asn0?=
 =?us-ascii?Q?d4P4cQgF3wpClj/29tHEc7WAPoaj6DkIfiaL3Ng/XCrgCoHsztvgHmFXqOIm?=
 =?us-ascii?Q?6sc2APD+noSCf0v+AjZynLIJMhoQ7/7H+jQbxia9x2XUZvnFQCBUlkP2oUVA?=
 =?us-ascii?Q?NQymtBCBDACdHOAihIzLAvjyL276Gy2+N+NsaRVSsKDhipYHfRaISZJH1ZYq?=
 =?us-ascii?Q?DyVDAgN/ehXLlzQM83un/OS1/EPVtz/6n9tjKuaEhezrsRyzUrP4rr8TzHGk?=
 =?us-ascii?Q?ifTi6LHbvofSzRAuYpacrWm6POryCCatpmfj/J1W/uTgojCTVEv5N5eKp9JI?=
 =?us-ascii?Q?SHuME62GjIPBCl+4zblwW5byt4SlEYNQueZtPV/jk+5mtVPBHpfsCFE6pG0J?=
 =?us-ascii?Q?asP8SIn0SofNGXxOGmR44QUfs1RlMp6CBQUuRAPj4S/VUwb9fUBIJhYsbJqZ?=
 =?us-ascii?Q?rAcN8RkQHWcdF53eUlF9sNjF4KoA4YLdVPsObU+jzy6v+xxcSuouDXEuAxjy?=
 =?us-ascii?Q?SZnWB2E4tGfmG82tPUC0nbm8S7qSzJ45GdnxMsLmdTbIK/qN8h3u8lWDKbnl?=
 =?us-ascii?Q?MHvfi6Ew/hbnEByIUEPMCyYXiGT/nbCavCYakxZyqDerwurBOA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?msLBtEXVWKB9BMXcut4Bwt39WBV6fmhMHxtxETsjkEPbdhBjN9opq3vK8U6Z?=
 =?us-ascii?Q?Lw0fYHPu4AexAcBS6qQu3wVj3JEQ/Mi470nJ57D5QiDX27dtO+BY8agyoBFb?=
 =?us-ascii?Q?FYKZpGyX9dPwo9Z9+vS1WZjObeDweAaUIMNeK5NIFevZz/niLUWokesGsrJ3?=
 =?us-ascii?Q?sGmyW5nYt8dMBVN3EtipluuBhfotarLPqRpt0E/4GpNMp55Ua8zRY8xj8Poa?=
 =?us-ascii?Q?mYwvTSSzGTjzkwyIDW7v8Ca1QKAeb6YDMDC5Z4Z9ggzQIkU4R0iBW6SJpx+B?=
 =?us-ascii?Q?2D+eIgxbWUKhFJ7yi68MXnTFBBOLo22FEa378QnXyCp+Q5+SRuZe51qPeJvw?=
 =?us-ascii?Q?fdZHgfhRw/T61QqKPoG5CCGBLv0AitIXjQnVRkiCXCekq7Tp8p4nUdSVeifz?=
 =?us-ascii?Q?L3eeiB7Ejcv2gWagI3vZaA/CbsMH2tkEHzU/ZSPl3HW5yZh3T2z/zddjMwka?=
 =?us-ascii?Q?shp9wH3Fr85Erl4/4+DxmXUEo3xweOgmUVT9DqV2qiPLLg0FDfJtxWNcD4/z?=
 =?us-ascii?Q?c2LuseM7IRt7p7NAHpbaPEMVMlSwCE/26JuLtjNGemqOfIES5YHzUbE5wnWy?=
 =?us-ascii?Q?7LL5tMxl0+463RgkewfZoH000+xzj87K0UICFOETi5sbwyW+t6Y15BoVp8N8?=
 =?us-ascii?Q?Hu6EWos7KiZPMmNnbK9307w5pKqCSabsNFJ0HK0+8Mw1uQFrFcFefvbrm9Nq?=
 =?us-ascii?Q?f0/TDf2ZS237KtYdTQnT2iXklJ/ND6MmKARe4y+1PTWciM8m+tjPriHHVqtr?=
 =?us-ascii?Q?Kh++YcWqFiosSerzj1or6UrL/YYy8trJgOgFgApGtiAuWXkr7F+ggqJJUCWd?=
 =?us-ascii?Q?wuFFztdE1xTzWA7adjYZOPfqowQNZqeafYPdB3ZK7t6HjSK4J0kVYnx8giU0?=
 =?us-ascii?Q?i+umxLgesJCsPBSoxr9KNuMLnCzFqjP7VBNQpOhxLrWM4PAMu3D5e4nAsePS?=
 =?us-ascii?Q?+2TjS75LkgNNMeS+8eoxcA0uApnN9jaxtYu0vl6ebA2ilVLqE8qXo+r7Uhvn?=
 =?us-ascii?Q?2QbOVlKil7qf0l2ksS8gqRMXOcu3Z5DRKivPAH947RC9MIsj0XiC2ulfWOOJ?=
 =?us-ascii?Q?YGQi7LYq2ONH2/uzc4hFtH8A+/dwypBlIRHjcuj+XDveA4nnJLKPEV+bLptM?=
 =?us-ascii?Q?/1iVSGCdi9jlpHCbmS9tZbiWIwk8NF0qCDLKKVFIkLfxyoCoUXpIM8HCzlEb?=
 =?us-ascii?Q?g7GJV9xhipRaRbAdd2b6+cIelPY81i+v3QBKUfh6YPex/oAdiJZIS0Ta8s62?=
 =?us-ascii?Q?gzsyfbXdKYNJSkWXIR1jvBGnAa1QYPlRVR6mteo6iUQPu+dNsvLqf3qG1oK/?=
 =?us-ascii?Q?Sj/xWUH7egN879siAkzCrnLd/1tlLhOPeT1Ifbds4MRbteH2Tsn2+1NOd/vJ?=
 =?us-ascii?Q?4q5iKgIxX0unU6/W0dlJo19X1jMc9BkeZrATJNMsvGSvvqIFKe5gNCCSkDjF?=
 =?us-ascii?Q?lO3TWN9hyOgGkf6nvrcLpGYaZ4U2Ay2N27YDdSmLWUkCv5+bvg+lvYLA1gNG?=
 =?us-ascii?Q?7M+sLL6kzIwGOZDsGuYkqTaz6daUvzu8qSgWeXMwEGrD4/XPyhauX40VCpMb?=
 =?us-ascii?Q?uNuqQhjfl39B41rU3TyRgfnos2aVH76FJgbF3hNrEvcawfxw8rlaexxxzqAj?=
 =?us-ascii?Q?7Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MAnjmphlRpOUHmMFyxJ8/o1QjsDJ6fonNMfxO9R+4x+EtGpU0HfPZj7yyjnRT8rOJkYLRKXHPerMuHG5wb8XRHbwgTSQ5gPwq9q+RC/pGXGG+ofeUgxaopOg+SVzcNqRIJfeo4OiO89jgxhDnysEInFhhYNeTCR4FomibrlcK6hINa++J7IfXJT7sFXNqWy1ZYEYkmRloGX+GYRXlomA7/ri2zwbgskRd6aPSg3MXuYWMxX4s3FBfjwou1UAHPRCK0/58LxgYkvrrf2QozqwDX4W45DaAD+TTRdsW2ccEY7xOSaR617sxYk+6cs2azdckMFzDjGpuJvEsBwuI3Wt8q+L0Fl2qsCzVFgAgtUxgmIz1vDRmOaHxe897+OR+v+ub8ErXFVPiDUsLIPr5DSTw9X4qaaCaHVvh2WIo4QHccBnk3fC+3FPV6spnipjqJ1bVeVGQ6A74hxMTx4Yo1JKhiUYk78yhyJrAvW0GSSVB3ZN0WiY8qfUXlZw446eU1HR6RD2k17scfCOSsQNZbnpa2bMt8lOYCsSADzFAUfHjcQ/buDMdr6yJEwYerDEt1WVRJ5dqYTz9+KhtVGuPp0gXw9ZbYbn5wQ8AqtNkmDMsXg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1949e5f-ec64-44ac-e8ba-08dd769d0a23
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 12:58:21.0914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uZpiOFSKX7Vpb9Ydr32aGooO6yaafCuJKlk8duEaLh4ebeB9m1q9wc+1AfldK2KjYpIBd3kFsh6kL+LjbxT/V80nnNO6wav9cZ4znH3tQIs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4242
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_05,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504080091
X-Proofpoint-ORIG-GUID: mjj3MhFv00pKeImx9zEMi9elgfg_vWN5
X-Proofpoint-GUID: mjj3MhFv00pKeImx9zEMi9elgfg_vWN5

On Fri, Apr 04, 2025 at 02:06:58PM -0700, SeongJae Park wrote:
> MADV_FREE handling for [process_]madvise() flushes tlb for each vma of
> each address range.  Update the logic to do tlb flushes in a batched
> way.  Initialize an mmu_gather object from do_madvise() and
> vector_madvise(), which are the entry level functions for
> [process_]madvise(), respectively.  And pass those objects to the
> function for per-vma work, via madvise_behavior struct.  Make the
> per-vma logic not flushes tlb on their own but just saves the tlb
> entries to the received mmu_gather object.  Finally, the entry level
> functions flush the tlb entries that gathered for the entire user
> request, at once.
>
> Signed-off-by: SeongJae Park <sj@kernel.org>

Other than some nitty stuff, and a desire for some careful testing of the
horrid edge case that err... I introduced :P this looks fine, so:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  mm/madvise.c | 59 +++++++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 47 insertions(+), 12 deletions(-)
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 8bcfdd995d18..564095e381b2 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -799,12 +799,13 @@ static const struct mm_walk_ops madvise_free_walk_ops = {
>  	.walk_lock		= PGWALK_RDLOCK,
>  };
>
> -static int madvise_free_single_vma(struct vm_area_struct *vma,
> -			unsigned long start_addr, unsigned long end_addr)
> +static int madvise_free_single_vma(
> +		struct madvise_behavior *behavior, struct vm_area_struct *vma,

This is pedantic, but elsewhere you differentiate between int behavior and
struct madvise_behavior by referringt to the later as madv_behavior.

The naming kind of sucks in general though.

But for consistency, let's maybe rename this to madv_behavior, and we can
maybe do a commit later to do a rename across the board?

> +		unsigned long start_addr, unsigned long end_addr)
>  {
>  	struct mm_struct *mm = vma->vm_mm;
>  	struct mmu_notifier_range range;
> -	struct mmu_gather tlb;
> +	struct mmu_gather *tlb = behavior->tlb;
>
>  	/* MADV_FREE works for only anon vma at the moment */
>  	if (!vma_is_anonymous(vma))
> @@ -820,17 +821,14 @@ static int madvise_free_single_vma(struct vm_area_struct *vma,
>  				range.start, range.end);
>
>  	lru_add_drain();
> -	tlb_gather_mmu(&tlb, mm);
>  	update_hiwater_rss(mm);
>
>  	mmu_notifier_invalidate_range_start(&range);
> -	tlb_start_vma(&tlb, vma);
> +	tlb_start_vma(tlb, vma);
>  	walk_page_range(vma->vm_mm, range.start, range.end,
> -			&madvise_free_walk_ops, &tlb);
> -	tlb_end_vma(&tlb, vma);
> +			&madvise_free_walk_ops, tlb);
> +	tlb_end_vma(tlb, vma);
>  	mmu_notifier_invalidate_range_end(&range);
> -	tlb_finish_mmu(&tlb);
> -
>  	return 0;
>  }
>
> @@ -953,7 +951,7 @@ static long madvise_dontneed_free(struct vm_area_struct *vma,
>  	if (action == MADV_DONTNEED || action == MADV_DONTNEED_LOCKED)
>  		return madvise_dontneed_single_vma(vma, start, end);
>  	else if (action == MADV_FREE)
> -		return madvise_free_single_vma(vma, start, end);
> +		return madvise_free_single_vma(behavior, vma, start, end);
>  	else
>  		return -EINVAL;

On error paths, do we correctly finish the batched (botched? :P) TLB
operation?

>  }
> @@ -1626,6 +1624,29 @@ static void madvise_unlock(struct mm_struct *mm, int behavior)
>  		mmap_read_unlock(mm);
>  }
>
> +static bool madvise_batch_tlb_flush(int behavior)
> +{
> +	switch (behavior) {
> +	case MADV_FREE:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static void madvise_init_tlb(struct madvise_behavior *madv_behavior,
> +		struct mm_struct *mm)
> +{
> +	if (madvise_batch_tlb_flush(madv_behavior->behavior))
> +		tlb_gather_mmu(madv_behavior->tlb, mm);
> +}
> +
> +static void madvise_finish_tlb(struct madvise_behavior *madv_behavior)
> +{
> +	if (madvise_batch_tlb_flush(madv_behavior->behavior))
> +		tlb_finish_mmu(madv_behavior->tlb);
> +}

These are nice.

> +
>  static bool is_valid_madvise(unsigned long start, size_t len_in, int behavior)
>  {
>  	size_t len;
> @@ -1782,14 +1803,20 @@ static int madvise_do_behavior(struct mm_struct *mm,
>  int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int behavior)
>  {
>  	int error;
> -	struct madvise_behavior madv_behavior = {.behavior = behavior};
> +	struct mmu_gather tlb;
> +	struct madvise_behavior madv_behavior = {
> +		.behavior = behavior,
> +		.tlb = &tlb,
> +	};
>
>  	if (madvise_should_skip(start, len_in, behavior, &error))
>  		return error;
>  	error = madvise_lock(mm, behavior);
>  	if (error)
>  		return error;
> +	madvise_init_tlb(&madv_behavior, mm);
>  	error = madvise_do_behavior(mm, start, len_in, &madv_behavior);
> +	madvise_finish_tlb(&madv_behavior);
>  	madvise_unlock(mm, behavior);
>
>  	return error;
> @@ -1806,13 +1833,18 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
>  {
>  	ssize_t ret = 0;
>  	size_t total_len;
> -	struct madvise_behavior madv_behavior = {.behavior = behavior};
> +	struct mmu_gather tlb;
> +	struct madvise_behavior madv_behavior = {
> +		.behavior = behavior,
> +		.tlb = &tlb,
> +	};

Again the naming is kinda yucky, but let's just yeah for now stick with
'madv_behavior' for values of this helper struct and 'behavior' for the
actual int value, and we can revist that later.

>
>  	total_len = iov_iter_count(iter);
>
>  	ret = madvise_lock(mm, behavior);
>  	if (ret)
>  		return ret;
> +	madvise_init_tlb(&madv_behavior, mm);
>
>  	while (iov_iter_count(iter)) {
>  		unsigned long start = (unsigned long)iter_iov_addr(iter);
> @@ -1841,14 +1873,17 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
>  			}
>
>  			/* Drop and reacquire lock to unwind race. */
> +			madvise_finish_tlb(&madv_behavior);
>  			madvise_unlock(mm, behavior);
>  			madvise_lock(mm, behavior);
> +			madvise_init_tlb(&madv_behavior, mm);
>  			continue;

Have you found a way in which to test this? Perhaps force this case and
find a means of asserting the TLB flushing behaves as expected? I think
we're ok from the logic, but it's such a tricky one it'd be good to find a
means of doing so, albeit in a manual way.

>  		}
>  		if (ret < 0)
>  			break;
>  		iov_iter_advance(iter, iter_iov_len(iter));
>  	}
> +	madvise_finish_tlb(&madv_behavior);
>  	madvise_unlock(mm, behavior);
>
>  	ret = (total_len - iov_iter_count(iter)) ? : ret;
> --
> 2.39.5
