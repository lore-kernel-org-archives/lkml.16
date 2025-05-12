Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41995522F
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 13:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747055212; cv=fail; b=MnlWsmHnXLxNDK8iSMVyO8pWK4cbXLfbM/vJFLdhi/SXw7fhKz+rFM0uLnSwoK3Qr9bczdMF797+TeZQs4uIVsKxJRsvkR5K8/c9nyDGn17qHFHkVYCNQh5rTldqN1El3+I4fhb90rqng3kbRJic8Ms6LuZzWD5lhQD8c9cddz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747055212; c=relaxed/simple;
	bh=i87Sl7DHJNK5DA3aOMRy78I87keXTiC/YAbK0ngiP3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gMgimMDeCva9wwECtkvHZEnHeRANIefcgWZatqvBXGCsIks17IQPGPy0WsKn4JQfmtrYDG2eMfMDMdCsiIqIdJf45RuaWToNjDSCAjp+fuDNBoYLpPe2qNLyAUJK3hLarEKVmf5beeePYA3t2zL3GkEtwv4TP+mCyPNcvF5eE4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EHT6bPdh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wO0/ZLbg; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EHT6bPdh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wO0/ZLbg"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CC9sPe004037;
	Mon, 12 May 2025 13:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=i87Sl7DHJNK5DA3aOM
	Ry78I87keXTiC/YAbK0ngiP3M=; b=EHT6bPdhBHdbT7QQ9QYo9fZ8rAL5dfYr2F
	aUEwSQQYpk7x47y6qWxyAVcB7TKQHe3zZoNbzB5DKa6JBTRBZJ6ID1i3K27JJJbm
	7zHqsaP2UhEfUSOU7hGZL3rr6d0KjAyVhXFlv+9ksl7bXTkc6x4dBFOG1TdfpJiQ
	c0s8PIJyDF6G5lj+UvnT7KP0p+sL5eWmeV3fYjldoYLQCpTcpka29CWNm0ZZ/uZ8
	u0bKYzf8Ycue7B9ddKzhweR4zVY1KgIV8ctFLd+WhwY1z1lemCoJmNN3LAVPv2bb
	NOvDGuru7twzYgVU1W5vcOdvPRzFA9ITt5LsuJ6KCKovOUJjohCQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46j0epje2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 13:06:36 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54CCigdh002030;
	Mon, 12 May 2025 13:06:33 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2042.outbound.protection.outlook.com [104.47.55.42])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46hw8dv41y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 13:06:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xiLIHzgDJCUPV+CMlrLXQJr8kcvV80h0y0I2AWSxBm1YsZlDIQGqMyTnpVF53tKA9fu41Vt7WpXddF4fa5JbBAQhEursT4ZU2E/pA9m/n1OPBJaYqO3Ci/gy9MSRiv8CviUfnyDO4/JVLtDvLhjCHPCNRqECYf7+NjYKNN8gqF4ZG82ysxLUZ4ynEE/dUdW32X422w504i8gi9TyolV+vaUS02vdvMoY86Q8GBgD4bOJo84hMp4ZmzBjCVvLA9XADmOwAjaxz8zohT1oe5d6QLro67wRIbr0eEFqMIOtW9u32pMzZxax1ZqrljCri2zt1jWpICd2N/w0+9q+WgX24A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i87Sl7DHJNK5DA3aOMRy78I87keXTiC/YAbK0ngiP3M=;
 b=Vf8dFAnnIHyTskbpXDAxawjuXngmPVOclcPxxwg07ZObh08ndxIMjOUH0ynEzQzliYUDrt7FhGPMfVQBdwIiTKNLDtp6nmNsk6DN/5Suu9zHHr5ERMNBVGqYNKxrcp4VnyU6sURiIIso9WxaUurWJiNdsu+O7A/o1Jio2XaIpMGruOuO7hQWkRuDDbov1lHXb3dcljNwlVaIbfAYI0f3cn309ix+0tJ1XiMIeYLpDv0PVDve6+UTTW4H6kAmF05QsimTjjQBZUAlMg7SZ2XblSWeTxZraxA6+OL/BKPbeuXYuzt0WJrQLfXCc3MeLThmtoUQk1G0rcp8p2WZqL6NNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i87Sl7DHJNK5DA3aOMRy78I87keXTiC/YAbK0ngiP3M=;
 b=wO0/ZLbgxCsYB8kXvwH/3hbZaP17XuMtfg0vM9ib8prJ5MAW5yG7pwU6fURsgyWSIxdTCzE5bKz0vmukRiLUhV8MxxI4d0YyqHPeORnHop/s1r03IUpjylPeWGEe2WytDqPtG5oRR6Pb/87FufGW8bNqzMdbWp9ALcxvFD5aQbA=
Received: from CH3PR10MB8215.namprd10.prod.outlook.com (2603:10b6:610:1f5::7)
 by IA1PR10MB6267.namprd10.prod.outlook.com (2603:10b6:208:3a1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 13:06:30 +0000
Received: from CH3PR10MB8215.namprd10.prod.outlook.com
 ([fe80::e4f5:cb34:9b58:be90]) by CH3PR10MB8215.namprd10.prod.outlook.com
 ([fe80::e4f5:cb34:9b58:be90%4]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 13:06:30 +0000
Date: Mon, 12 May 2025 14:06:27 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Zi Yan <ziy@nvidia.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, David Hildenbrand <david@redhat.com>,
        Uladzislau Rezki <urezki@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
        Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add mm GUP section
Message-ID: <e2ff3d1d-aa15-4444-aae2-598b24605b7a@lucifer.local>
References: <20250506173601.97562-1-lorenzo.stoakes@oracle.com>
 <20250506162113.f8fa0c00e76722a1789ec56a@linux-foundation.org>
 <c4258dfd-14ee-411a-9fa7-c4a1fa4fad1c@redhat.com>
 <aBshiBX_N6hhExmS@pc636>
 <13a32f52-dc5c-45ef-b45a-585586868509@lucifer.local>
 <e3e2663b-2749-44c7-8452-ffcbf2167572@redhat.com>
 <28428030-1178-469a-a4ab-f1e7179d9106@lucifer.local>
 <eb2b0bce-6012-4019-8ff7-c35c24ba7aa1@suse.cz>
 <9AF9CF7D-D4A3-4D97-9B7D-F259E33E982C@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9AF9CF7D-D4A3-4D97-9B7D-F259E33E982C@nvidia.com>
X-ClientProxiedBy: LO4P265CA0088.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::7) To CH3PR10MB8215.namprd10.prod.outlook.com
 (2603:10b6:610:1f5::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB8215:EE_|IA1PR10MB6267:EE_
X-MS-Office365-Filtering-Correlation-Id: a8a03ef0-2204-4e29-b90b-08dd9155cfc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5MuAoa77P5vVuxe9H8i3QKI/8P3T9JlKsc4Yr5wpfRvJbXjm0GTVTI+f4cLu?=
 =?us-ascii?Q?Og1Y+Oncr0re+xLbwOnUxSjdsVPibIo7l/h8hTjm78v4vzeqV+Lfkt0pUQVn?=
 =?us-ascii?Q?RJj8t3sB902MbnE0IDZaMFbisbM4gsfr1EV+wUTzI5L7BMYi3IU/A4U3JgUo?=
 =?us-ascii?Q?jcpnHlZTglQUapy4D0zSLTmQXUiyE0w57cnOmFTOCLEG/FwS2QGySXk0RUPf?=
 =?us-ascii?Q?m9AX11GX9pE3rLdD/Nm/sbXG5GAu9LVf9wdZdqwyJVn5zkqtAnLDVp6NWEWR?=
 =?us-ascii?Q?GQVGys5JFVAHaF636JBHqcOWue8ko5f+ypRxBWeoRsVz0UMsRWZ1AC/4Wa6W?=
 =?us-ascii?Q?nea8vfZ/emAAWnXZdIUVlWUhxTVnL9c6ot2IKoLXi8wvUHcBk5CC36xLMGWf?=
 =?us-ascii?Q?KAHbeKdgEpFz+P1/DckcVPZxbPT5JhEDbbYwe+XLo155uHAUgc3nE06jSBWQ?=
 =?us-ascii?Q?9jypuGEX5CHItA8h8Hye5ZymTEDDdsBdxC2jBG3i2oaukUhRaOxef0JcBWSX?=
 =?us-ascii?Q?e0qEhDh5jU11v3gocyFmrmrJlxheZJhvNCjJjlry7cDPpzG0Ya0nT4vm/Fgs?=
 =?us-ascii?Q?mHfmYzHMe4pkALRB050LBdn5kqc66Ohp0VOkO5C6/qMpbBZN3oRwOUdT9cuh?=
 =?us-ascii?Q?tEZZ2IGasQHW4kItKYV1AsFykUhL4AWu8Js0TXgDsi2PF3Q19brPbRFtCyAF?=
 =?us-ascii?Q?pcO2OSmnorC5vPNB7E7jm3uhiDg1b6P5W40O7IHZQISgT3i6xHNuKMTbyP5U?=
 =?us-ascii?Q?beTdmuhooaaRpmpcE5+bXVYEQ5xPoU4cLwGIiF6AYw2fASkShnU9gTodPwQX?=
 =?us-ascii?Q?SLyJjTmn4k30JL0eRn+KMII7XmgvkpyTR0Nx2NHTuzb5wYWRj39hG/SrUdCd?=
 =?us-ascii?Q?sWa5IGGw8mKGi0EVsiBJSQviCUe3zfXbNzfoaA/O6oBswJTKmTwT+FObwtaf?=
 =?us-ascii?Q?fSTSpSLPlsamHwuITbCFJCSz11YgSDjiyaML2NCVOitiDAK0QMIMey/GrVYN?=
 =?us-ascii?Q?HucHzW2jFv7OpYQLc2og/9to8Ke6+VMZAjeLRENR53CNhNb3PzvBm/p/2bCA?=
 =?us-ascii?Q?r1ZRqrreEIwECMIiqHaMcEH7F79yc+8p4lkqQ6crkyvtJ6OhF74mXBgM0eyB?=
 =?us-ascii?Q?WufkuC/iobAzG3crloWk1NycEuaxi6gLx5O3bTJBImv8/li4EMY8QXsSsRym?=
 =?us-ascii?Q?ypLyOEJ1b6h+xesx2Ktb2LNencCXj139mOWm20CNquUZMnyccmEA0RV/pgKK?=
 =?us-ascii?Q?AaeJ6AfJhuKGzFORsFDC9pYWNEX0GAGl6qeB6p7aBkhhtGhSpE4YnjNPh7oX?=
 =?us-ascii?Q?JZMT+0xPOKpgaZCd8fbpKMA1Qu9eFlyV17lGiRksqakDUxPti+xiFG56MIKA?=
 =?us-ascii?Q?QZMsTkC0kQUHiJAbWW8ddL60WHzNID6KLb5bBAErPh2pKTGObfKcdbV6WyEn?=
 =?us-ascii?Q?tKXR4GnGGXU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB8215.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/7my5ECdrBD2p1GGyaMBESpy5CaYwzqorWf+FnSRuKPxDjIMF+evpIliRfQE?=
 =?us-ascii?Q?Btb8xrt+xTVt5NObxCQ6uzF+vGyPoihlZzaSz09lrm85j0ol/XFWK/g2wPCD?=
 =?us-ascii?Q?a1AZXXJ2QXrcpqfEogCQvK5KpiiRp8rn4L9PDUAH/h0af/sVwkVgtkwwBa6Q?=
 =?us-ascii?Q?inRSFesgQoh2QuwstF2h+7hwko/96hv7OGLitoNVtJ6TZZ8KtjCLoU5p3ixY?=
 =?us-ascii?Q?wXY91JSnnqwnlpUUhYV99IRsehbBOfvN2H0ZKaJtMZUP3+Mo0msYy/m7lmNk?=
 =?us-ascii?Q?DBrfqg0orxkXrz6FxPrMdnBBYL77roPH9HGPlRmpOimm/UZyDUfCh69IS0qR?=
 =?us-ascii?Q?C+Rxuou8OMpw08rAqtTwNaZRr9K47b/bL+rfUsYjHQcLnRpjfxYdS/ZgEHdy?=
 =?us-ascii?Q?ANja02tllVL72Qr1ewUqx30OEbVqcz9m5NTrK2aPPo9W0VeytvBWTOXeMlCv?=
 =?us-ascii?Q?dUVzodDcH2EbiXOJ4gq2D0eOfQH1FiuUMXJiCoShMqX8CANrfyc8dFINKpyD?=
 =?us-ascii?Q?I5cPd9xyUZ0mbyrX4nBglTRtmfB0RQ+kIhSbYrecNUkULiSm1SQeEOd9sQ4i?=
 =?us-ascii?Q?yGfMVVPfp8ZNI3vZhwf8IaD0FTfypfPaC0pRqwMzt/3VmSTdAaIeuVGBoQ74?=
 =?us-ascii?Q?fKHAZVXOW+AZ0UeQoRuwerTp9M+aK/8lXscIjlNVTpAHBqzRh0LQgbg7mvkS?=
 =?us-ascii?Q?Zyq3TP0uasCpH9mH2vqea7hrBkSR691dqXRqNH61lB7p9X40mONOxM7qZqC4?=
 =?us-ascii?Q?vnRW0hXU/1HIv+xCiYOR5klU7HfR06MKc0WAS/WVZzbKWmuaHh8zOxClWMFq?=
 =?us-ascii?Q?o8A5JYdzL2wWE+lCTy/wpaXRqIi8++BIh1JYoyzSfNESzJm9HYTvljyad7o+?=
 =?us-ascii?Q?LHG2lYztdEnLo7od1oFA40G8ONmdYvD6mj+eTFrduxUQ2h+8ft3VyR7odmtH?=
 =?us-ascii?Q?sfui4bhe72kbKIF/AkdcIw8T+60YjwDKkQsEJs4jgFA8jwf4M81Oia7znQW+?=
 =?us-ascii?Q?YvFpr7llY0/zQ5/iIY/d6i+fXZ91gpAG2tUIyrSp46L/bBXaDOUAHY8TDKLN?=
 =?us-ascii?Q?3F0uoOWD72X6vYu5XmNXwVqbIgkfbJtPMz5t3kPqiPV2Yp8KfRhZ/wYH/EeZ?=
 =?us-ascii?Q?BKHeM8bnnHPTPLzYzac/W6HpI9YHdRz+KdZusycACTQKuQzDIOdBHXegq4ga?=
 =?us-ascii?Q?i3YbJmL2k91LRVqvrCsv4g9QfdPhWqrv7dtTupX6jIfUnuiN3LWkuPCKQnsF?=
 =?us-ascii?Q?MsxJSi+Uq6pKykqAuiOdtjE52+7rCFt2Ks3c5zCH6ZwdLsJI7d6UR20rrBH4?=
 =?us-ascii?Q?BUlOdkQYw+WncHbTsi33JOYta6xqNc5xi/BLDNZ3E2KVFkP9tDIsOfms1QLl?=
 =?us-ascii?Q?QUMNrDVhSF7uGJbCROGS8pENUu7fQ8MR50I+25+Sxom6+lWFT1JqcTQnAhiO?=
 =?us-ascii?Q?UCducQUBcVgPCo3/jScjTC6VXIP4k4hdN4phDDiAQzyouLxGb9gjky0rDV6U?=
 =?us-ascii?Q?tl/8YMXvy7WUyOP8XP0oGHN7ekoCIs34eA965P6mcwpFNYeF8N9SWm8yAGpv?=
 =?us-ascii?Q?HuCfvJrRm4ba3mWjy2mIrkCFFE5VKHp4VyChOUJHdaieCZtNN6FmxkObpJSl?=
 =?us-ascii?Q?ug=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gWvDtwL70+eRsTJXLH9USzwLIy1pSf4/Nmgwes4pTghlad29kLiLnrITMNONzdM2aaqmkVGPRqj3swH/A+mzQfItwWeoKiIqWnFhuNvcKSsfe612oQ9VyTwR3DXnmTOlNTzo+8jzCjx2eneBFPoIp/nI5Hjx7bvXcKOh2BMDQ0pPr2g/Qa80NUKwyhVYaIPMfxSkmXvIaP9tPdn/FAFoq6Wx6k1IrNPQYS2keSUkTfuSZdgqNnGzXxnnT+n1NVaZ5gVdXsuucRifm7QE0H+a99qX6FCCL7laHw/8ex/usR3NHNUjvTEd01WG2K6slnCjQr/zguz8H9xfuEq8WLbq+vCSChdrKNASwpzdJr/Zb3mcBnCZFKZpjFK0HZvR39DYNYFIoa7FO4fgtzNB0fIbuG5S4BaSM1LHYBfcGAQP3kYC5uA4m4uWBHJaZQgGqnC8d7iA6cwa5IMV0n4BiTQZEkeQkArHStAoy8aXYHEJXQs1fo1BbS9cFdQAG9/0PL8PcFs9U1Q47D/At2nSiY71DGkLVdIsR5uGF0tvvdZwNDLxOa5by3dnTM1kV8uU+AbL79RXjkSRVaZ5l6vhKIEIzrqEbbTvr4Mvp7fVgtaawE0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8a03ef0-2204-4e29-b90b-08dd9155cfc6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB8215.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 13:06:30.1413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SKhCo3FLJbgv2mIY5iMpBGvkqflYd2M3Lb7EShcIxZtlZV7/k0Iw2M0Betl+59Wwp/jD/Nb4rL8A9vm/X9I+VwYJ0Gq7+NeWNmI7Sj1fNDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6267
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_04,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 mlxlogscore=720 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505120136
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDEzNyBTYWx0ZWRfX1xAW8P0sp1PP Mt2tsEDejecUxkOO2LmHWfRiUjJGkrHBOPvSiIWEdAZHasnx2sutVZ+W5THwiKTzNqi4gS02q6K hFOfUAv9KpjXIwDRGr61M2esSBulQQGK4Beup/UrWjMiW/3vN5xtix97P3myutregUlKn6OhEta
 WbjkCHBILt1RfGbLxzxIYfBcGzShhdeNhPtPVLLh9uNn4B9/SAYyl1sbHq5Cn5ySEOiBFgiNY3C ZuhDFKcHsS135pqLisfdYfraLSeLtEVu0nKmABj2e7SlvQMYUj7mwV1t4tuXBXvKKhkAbl2uKix gewfscoeSTbeUXrC1VPALOHCJ/tIAgnVV17YxCwVahRKLqjFM5TAb7Ss6Is7iDMWpgJtuasiFVV
 nuhmP5HqlaxYf4vuljcVq1ujt6UlaQjMnq2D93FgAyTAMzYKLz2ZPFdv2pSpjiKDEr9FNH56
X-Authority-Analysis: v=2.4 cv=DO6P4zNb c=1 sm=1 tr=0 ts=6821f25c b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=Hp-GUBcxg1o1Y4ij_iAA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13185
X-Proofpoint-ORIG-GUID: hrT8wlrd-ObCCVWWAoxHeGQ83OU-J1-j
X-Proofpoint-GUID: hrT8wlrd-ObCCVWWAoxHeGQ83OU-J1-j

On Mon, May 12, 2025 at 08:54:53AM -0400, Zi Yan wrote:
> On 12 May 2025, at 3:38, Vlastimil Babka wrote:
>
> > On 5/8/25 14:23, Lorenzo Stoakes wrote:
> >>>
> >>> M for "PAGE ALLOCATOR", hmmm ..., I was hoping that Vlastimil might have
> >>> capacity for that? :)
> >>
> >> Vlastimil? ;)
> >>
> >> I'd certainly support this.
> >
> > OK, can do, thanks.
> >
> >>>
> >>>
> >>>
> >>> Not 100% sure what to do with
> >>>
> >>> * include/linux/page_isolation.h
> >>> * mm/page_isolation.c
> >>>
> >>> (I hate the word "page isolation")
> >>>
> >>> They are mostly about page migration (either for alloc_contig... or memory
> >>> hotunplug). Likely they should either go to the MIGRATION section or to the
> >>> PAGE ALLOCATOR? Maybe MIGRATION makes more sense. Thoughts?
> >>
> >> I mean it explicitly relates to migrate type and migration so seems to me
> >> it ought to be in migration.
> >>
> >> Though migrate type + the machinary around it is a product of the physical
> >> page allocator (I even cover it in the 'physical memory' section of the
> >> book).
> >>
> >> I wonder if our soon-to-be page allocator maintainer Vlastimil has
> >> thoughts? ;)
> >>
> >> I'd vote for migration though to be honest.
> >
> > I checked the code briefly and although migratetypes are related to
> > migration, it seems rather page allocator code to me.
> >
> > In fact if I didn't miss these files, I would have included them when
> > proposing the PAGE ALLOCATOR section.
> > Zi Yan has a series on that topic now and is one of the R: in PAGE
> > ALLOCATOR. What do you think?
>
> I agree with Vlastimil that these two files belong to PAGE ALLOCATOR
> section. Page isolation (actually should be pageblock isolation) is
> doing work on pageblock migratetype, which IMHO is an important part
> of anti-fragmentation mechanism for page allocation.

Ack, will send a patch! :)

Thanks!

>
> --
> Best Regards,
> Yan, Zi
