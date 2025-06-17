Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783D62E889D
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 15:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750173026; cv=fail; b=Fc/RyFb9AAtbITwHfn+3zyT8az5OPjXQLPHznXKsNlRryQMbq96VloXCsZBANEm+bZRdbPXc2pTD9ngJ+YATEuz25Ae5W+1PmLGA5fPUH3g0yjmgO87GPY3vk06HngNgLxrz06E14QGMT4QXuH6uBjpfc0SQ+vYFa7esYFu7dBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750173026; c=relaxed/simple;
	bh=0a5nfS41c/JWNvKqvbDkxV3gAXVQLoL6+zn3X4o6u5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WdwuCfF1MDwvU54eWom11o0yileRRjnxXbo/9XJjT0JVocXAFlXIj8YnCLMVXHCFdVWZ+EB7tiE6kDBL8iJ4QhyjCMu133UF/eM3EbkWlVCr4O+aD9gilwGLLt7nE+4ajAwtJIUnXpYQzsEhpdTeEeDcR2H+1LPkMSP7Rr5sujk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VP08vwmU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KynaPUk4; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VP08vwmU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KynaPUk4"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HEWvVK026874;
	Tue, 17 Jun 2025 15:10:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=maXk8G2BxHA/QjykAI
	DJOyprWcO+A0lkWBa0RCek4wQ=; b=VP08vwmUw+ALMIyLwOjBXZkoQZtsCyqjpI
	u+CxoVeHTddpmrrzDd/eX8cqwKYr1Ko9BDzPZq0nmr0cwqYhe8irDGCyDLFZAu/4
	3XlyYPgYhEZRMMF6QeU8fu1mVQDGiu8ZF5sBq9aTAGHHfRulEnslHsuZnJkKUkyX
	vUi98s8HakL8IUfWosGQIdVBEzLIr9PERzHFy6RZx1p2JmIukEphlx1rjDIiTLCa
	t7B4QH71v5R1hSnq3m3q8XyeCB1Z7qzSTLz0I2uCa6nA3WPjPHHSKT6Vy1DIMuL1
	aYMdq/IukmBFbFG2aJ8v/Ba5dX0MzSBdlGdFZD8QoAySvSBg1Obg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 479hvn4wfs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 15:10:13 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55HF99Jb036326;
	Tue, 17 Jun 2025 15:10:12 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2076.outbound.protection.outlook.com [40.107.220.76])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhfv0x3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 15:10:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fLViE9+IwodsvJwJj08QfE0RMzs8WnnYCVdUBmiyWCgkwyOk4svQvy5PRm0lnn7wjqapsnNSs5UW5hYdi+nueRc+/0GY6S8hv72fTjRXRWBIpqgvqpGWG9/nyREfkrH52OlPfalU7giDLXlnaHr6kY+ge7+gVVelSXvlcCWNLfgat+BlTVCAmB9npxSuTIQjUB6+0kHrni/hFfen7x26f0wJ0yvQ04/PgyOQ7TRvjIPMVxawReL5H8IX2IjVyT+1EaFJJnYSGqr2qdvEASZajJOZu3ueo8uEh7BoYBMn0f3Qx43pcOp6y2G6PDccZlzkM6kdF5coMuDo9q+Ef1Ws1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=maXk8G2BxHA/QjykAIDJOyprWcO+A0lkWBa0RCek4wQ=;
 b=yAM7v4apMzYbp7RI5z2x469y5rhL0zD6WgRS4tUOtH8ZyYgEnCbT1oG7OItBb2ppTX3UXp9Zh53pBnavj8c3/YdbZ9w3uMEzarHRZh+LTvoYnqSPn8fgkNFnUsrofI2JyoAqq85S0wvec103yVFUBQxZADOFBBF1OLD+ukN5WilhsW7vl1IQ6C5YZUIwDD3J0yZlZ0/yU8HU2Xt8ervU2DlmzLvBuRtKJgOVNdUii7BM4chgFa8W/0awUu+wJoE+5w3BfbZMl0zw+K6g+ZwaBMfFGs489kKvEuvBEGwfstlBprT3HclMoEHWYfEb8SLnDlzfzediqIwmmg+FOClUAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=maXk8G2BxHA/QjykAIDJOyprWcO+A0lkWBa0RCek4wQ=;
 b=KynaPUk4YiPM2XmHTaRK7doijETUsI/e3PGtVcYvIrCP/YTw7fVgeyeUnF7pEd6g/OqtHEsirZwC8a7f0oG1wPCPGB/UnTR8yNxpc6aBBnVVyjY3hJT0oMjoXLkruag71zc7zfMssi+blydblYUULFmkVVyzRIBAiZI3sExGhts=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MN6PR10MB7421.namprd10.prod.outlook.com (2603:10b6:208:46e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 15:10:09 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 15:10:09 +0000
Date: Tue, 17 Jun 2025 16:10:07 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Michal Hocko <mhocko@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Rientjes <rientjes@google.com>,
        Shakeel Butt <shakeel.butt@linux.dev>, linux-mm@kvack.org,
        LKML <linux-kernel@vger.kernel.org>, Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH] mm: add OOM killer maintainer structure
Message-ID: <002eac51-1185-4a51-94f9-49987db84202@lucifer.local>
References: <20250617085819.355838-1-mhocko@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617085819.355838-1-mhocko@kernel.org>
X-ClientProxiedBy: LO4P265CA0191.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MN6PR10MB7421:EE_
X-MS-Office365-Filtering-Correlation-Id: 1127f1eb-e21b-4f32-7ce1-08ddadb10cb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pcOG9qkZLf8mHloXm1bWPj7z4j+ZySlgXWVuKioL5fvkGmgbWQ48f60Zll6P?=
 =?us-ascii?Q?64S9EPImoYzuKUCtdJNXTICj3Z2JFaTymRXuVwBRa1SLUYL3B2NibArp6xOz?=
 =?us-ascii?Q?UcV7KSpBGY8NPBe7jdHy72UjmNtXdnHvnKYsIeAEGjg9251o5g4dISj9uVUy?=
 =?us-ascii?Q?eg0BiloA9vYkBJiH+5URyTwHYYUlhBzKu1n+VQ9K4S4b75943nc5EeHMsdHz?=
 =?us-ascii?Q?HU8xR228gaaVfthWxdPNNZcgov/BQpdQZnxzNseKLmciKuHkGUU2CCR9xBH/?=
 =?us-ascii?Q?JG+38Hz3Uin1MIAi9jsozDCYLHtgdbAWu62pSlccs/lI6qhmpM+0CSK2KQCU?=
 =?us-ascii?Q?VBiJfx17HqAJ2+mAiiKc7M0pKDYrSow7WrQnFlnLwxWVWFvUWLFEC5J2f+QQ?=
 =?us-ascii?Q?5YDPBD3f/eQHZos++PUFysrBc4sqDeMpiGacuLClkSRF87Jf3Bzy+w5s4qRN?=
 =?us-ascii?Q?g4q/hM6dRljWMr12+6No46fUvFTu4WbHZB0nJ85vKDWBNZ/g4oytaHVUKW49?=
 =?us-ascii?Q?JaDz396OFpl6hEO8OQl9anpOvYuk6ZLkxpo3uIK2JYTQzVLpZHF1K6NsbBZC?=
 =?us-ascii?Q?KIRqUSIPeK+8s3iyEjmwDz1VO2XQHFaqYV4v69xw4ZGcCfefp0Z9XK4Wl9z6?=
 =?us-ascii?Q?bOIgA2ECQWOE/teQpqpcTRwafuUhM0v9rjNgzVg9knKT6uvUKatt1Lvnb7yC?=
 =?us-ascii?Q?EpJKvWnA0VeiFFTMqEfwQTl9gfHiwW2zScYMYuifHasEgvljSmyIg+gHsglN?=
 =?us-ascii?Q?Kc6OYFyCHYWiR39yVAVlJkVo7Krt9e+7eAjnMY4qd9NUKQ8VDLLhFWFLhxDf?=
 =?us-ascii?Q?2N1CJ2YMbRXQAUH8lVJ7IsszhB4vMauDdfyPhYXtHVWmCgacrSPXVDOFSasH?=
 =?us-ascii?Q?7xeUk7RBosk39o1WIOeDPE3eXpRRgXClEj/Gjhs6wXhHef5lJnPKu1DhAsPR?=
 =?us-ascii?Q?QBz2vhvtENc3YMQpwgNPm55H7WGNYs6C3A42S880L21t+Oc0YE0+fg5XGug/?=
 =?us-ascii?Q?j6LTomk1+5F/7c6jnkGwSYpxJFq/GoSRi+iUOiGPNBP6zrI2WmsEveuxGb63?=
 =?us-ascii?Q?P5ges6IMlMkmieRtSB7S3aF8Ty/XQYobd42VX/1ZzN1Fy7BtDOcX7a/sKUuQ?=
 =?us-ascii?Q?1+CiOxlMKtmZ7QccF1K3c88dnlbxRdq2bu/Y50L5gsxAXEguIFfa5lYgtuAJ?=
 =?us-ascii?Q?2PtrIs6mgbLVhH411nW0CEmWz69VL9FTZQaV5ixVBoevZ3eWe+LtTZN4JoqQ?=
 =?us-ascii?Q?UyBwoMBlKBbJ60XrAfhea1dcLe0scVpEM5YcBhF03L5uC3S+QYnVzwhnrZv2?=
 =?us-ascii?Q?+3UGFxdpp5XCUT99vffj0uLEnjTsP3aJZXISeAto0jAV81b4opu0fcAKV0jr?=
 =?us-ascii?Q?iY8ytlj5xOXBgLnzhMMfTQwZ9zSD5GQnBcygBsFb9bBd7/PizeqQEWzdmcjM?=
 =?us-ascii?Q?PZuoxL5dB60=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zVdg86184mLGM7e0E25IDTufCRtydhpb8Xzcw69BcUQabPa0F2SLMmktJa5/?=
 =?us-ascii?Q?MJzQcRW8TqHFO72Y95zCRvD12uwTe4WzqQp0OHz/peCr8b+7rWvlrafPCaAj?=
 =?us-ascii?Q?NHvQkVbN2Q67lCPn2SZeuald8ooeacdTUIcw3xSFBUOshDLsYduiMKo7lpbq?=
 =?us-ascii?Q?eAnHGKXkZ+dmDLOV4lJ6ajvnyf8sCzK/I1wlI+Ln/FwdF/mh74DmsNy0mroy?=
 =?us-ascii?Q?AMFLiIJv/tuhOEuXAkKWcgQsnun4FAM7tf+Kmai4BcQTcJD0fLKH1inhh/FF?=
 =?us-ascii?Q?WIYIqZk4dVE5Ik9I75bM81wBburmEk3byHnQMyvyqAM4j+tq5oyTFVQYnJCA?=
 =?us-ascii?Q?hQxdcjaYDNWSrOtFoZviUqkf4IYonIiwcPt1PfBXDpbGLHohnx1k4uLaDXe8?=
 =?us-ascii?Q?dROF22bbGBvs/xUsuRAhBfu6/4FqXjgdZskjb9ihKVe6qNTU/X4+3cmwjWIa?=
 =?us-ascii?Q?pUrKbwyDBYPt1bse9VeVpKMsqS6R98RCJXsgDuNnydavbSb5sTV8VH3zk9eL?=
 =?us-ascii?Q?0evcEnWe3D/zOkapxKsuZLP7LyT1aITh+fZo/XbVL1IqOUATvxX3YDha9ZGA?=
 =?us-ascii?Q?U3fte5RQzZTzJ+DSzUr0YXHIOUO8VKZj99ctdlqrRRBfBF/ZymJfhjfOugNp?=
 =?us-ascii?Q?udIFcPa8lcX144Iq2/PdXQx0QZIVuh8jttYkC+dhGqu0FoxgqTsdqytfchbl?=
 =?us-ascii?Q?Lztj+JgvWGlTaxLwUF5tO2aVCKjBgLxSpba3KIUkMk4nsMBQk3uLj9JjCFGP?=
 =?us-ascii?Q?JxvCLkL/YvvBdejakkhzFndlo9wJNlracjCYmHRLyYUI8yrGx5AgPndV6sLy?=
 =?us-ascii?Q?d+RTL/yqjbe6i9W9nURTetsvk0Az/GiFOJcn7VP6+gXsGiDJbZKbc6zcY3Eo?=
 =?us-ascii?Q?SGWMHLOHj1tLGVE8iOx+5Pvf8Bq9mQq+KJXPLUnT35bsREYiNka/pwWRoBSR?=
 =?us-ascii?Q?O61QjTNX5M1Bnr1sqshHn7oylKNui59Uq8YH/CKug+AlDyKFqSe3cxllYawS?=
 =?us-ascii?Q?NoxRAfLaxzaGOPGeTgZgFULOsc83Vl962BIY5Aw8kmKtugf7yvi5NZI1owIr?=
 =?us-ascii?Q?wPjZ/WepkdZQgYDa807CESpfiu7EX8oKCuBlDcnHS4iDwljUQnIYSIP2AVsY?=
 =?us-ascii?Q?/iKrChLQFHmha2DENBS0xR30pnKWvC59F33XvRZJfd9fask5vmAqYcXcPzYQ?=
 =?us-ascii?Q?F4Jt1mdKIXmRoWU2sbccGLeKtnM5psol3o9KO1yn3w4LFgx+aAqSSCzh76I8?=
 =?us-ascii?Q?IFkhCjFBsFsWhs9tzPURz2+8g7vMLkIWcUmigxsXat25EZag/tlckyV3RYiR?=
 =?us-ascii?Q?RUoLR19+vceazTprI8phuZ+q5rbv3qeUxfQlfhRGGXOKzaMXRrQcfMHSYd/F?=
 =?us-ascii?Q?VUC/fC/V73i83C6YoAFQEK1EpwZ2AcVcisGrvE8M5WjzSvBw62YdUbyCmMyI?=
 =?us-ascii?Q?08SxaK7t8FTTniWnaQ7j3jdqXPMHS0ObL54OWVeCtxUINOnZ6MQKAeIVhptb?=
 =?us-ascii?Q?n8nJQMiUbyRjMNLvV4avsemE4TVYKmlOB8imUapgwPkTDa9bf1SdNDa77MCp?=
 =?us-ascii?Q?8CFC+FQ613wpqsbirFNjPW7bxzQYyvnatqCda4sAZdfeSt4ovpmWOvVlw2mm?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hjGnybN+X8A1kIBE2M8A5fqCK2AvrdgZdeCjG1hqBK1h5kTUkQK8Mv8dYC+T10LqTBWxIDWXpEyDpPM48FthT+ZSMlsqOf9QicR+Ncjl6/4nawTRKgG37bCVvnWUWcAYPUzIKE0uRXVPlVl1vbAeCVlPiVbMRYO9VN9wAcxTccdvZyKrTpIOshLOgQV9HbHaIiQgraQ+c+NS2LPNLgE4kLE37zMLP90dOmCNT8lHsTc653MlQBoNGFGBOTTlHgkdbVbO6ogXTnLLjKGN/696oxMzoFiRSmmtEyLwUzHqS2eQlhN0amKVPNh4sOA6QWbBwW/4LH8dugiQzrtS/UYwFtzJ8J5oH7xDzsKO/HKCqG6eA37j9LMlx8fieTAXKHuNO9HB5Uegcuios1wNRiNTyjmovNa1faJfdZEs6mWjkhgbToGDnSfYpFyQIG3YnSqsxk2hPSAFP8bDTCdjLRiMcusFt4rXq6l9k2fJxlMNfxvSrKhE6WuOeXdMAGLgKHvhLRYMPwAFn/GqjPoj3J8cln/KiTx76U03P+WnoeA9F8SidblXeEZeEUt9wa0q8BzM3ZkcqsjqE4B5yw7h/EapBIdlLVkvJaYOOoVLKA1wL9I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1127f1eb-e21b-4f32-7ce1-08ddadb10cb4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 15:10:09.1808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /fq6fQUL/BDfx+d05wiKKizoIUaicXht9GN1hu5Rq3G5N+zUGLjFaCszH+e2sxMy7rILLZ4M98P774RRHZvy+k0fbtpj1rD6zhJ4CgvtWrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7421
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_06,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506170118
X-Authority-Analysis: v=2.4 cv=XeSJzJ55 c=1 sm=1 tr=0 ts=68518555 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=iox4zFpeAAAA:8 a=1XWaLZrsAAAA:8 a=yPCof4ZbAAAA:8 a=37rDS-QxAAAA:8 a=Z4Rwk6OoAAAA:8 a=uJC8FWyqNxr6Kw0NzTsA:9 a=CjuIK1q_8ugA:10
 a=WzC6qhA0u3u7Ye7llzcV:22 a=k1Nq6YrhK2t884LQW06G:22 a=HkZW87K1Qel5hWWM3VKY:22 cc=ntf awl=host:14714
X-Proofpoint-ORIG-GUID: plIYHpHR5FMrDhfFfxmuJ20C8b1Go32o
X-Proofpoint-GUID: plIYHpHR5FMrDhfFfxmuJ20C8b1Go32o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDExOCBTYWx0ZWRfX4/66/4cdzM4c /crwpqScpwEaMuIwpg5rO68oN867dpMUYHxsX4DPgSR/J+uSq0gwTYf7OhSAlgq9Y0iu2bBspIp a4K5Hdd4I4haRnuUkvkgnWk/EDh9KNvqU6lRam0isF8p6IMz05UOB8s0ynZQD7gpOBzEBL9v3MW
 TZjJ85z/JoJtRDs/xkgh1gdaIDgeWmJ7YYC3RtucSqPt5SWVa1zVMmE3fFm4kUSWRen6R7GGbup cohoeTNdt4z0/ReFqL2nlU7hCu4nUIrJKfdeEN8dbYSfEnCWjS7WduY5HwRwQUiLL28Nqm92old /XaTG78MSrJoXQmoo8Vj4MHc6T918vuRZ2pNigHtazMjr0Dm83RqgyCnxQvbFL8MclW2RNx6Yl/
 mVNwEh+TM/nXJEYxsUUjNMAHNrGejiT/lRCm5jEeH+jzV+eu79TcmNfhqUIlVKanBbKXHJFA

On Tue, Jun 17, 2025 at 10:58:19AM +0200, Michal Hocko wrote:
> From: Michal Hocko <mhocko@suse.com>
>

No commit msg? :P

> Acked-by: David Rientjes <rientjes@google.com>
> Signed-off-by: Michal Hocko <mhocko@suse.com>

Thanks for this, saves me the trouble of doing this one :>)

Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

But you need to add a few more files:

> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0c1d245bf7b8..5e339c1457ff 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15841,6 +15841,14 @@ F:	mm/numa.c
>  F:	mm/numa_emulation.c
>  F:	mm/numa_memblks.c
>
> +MEMORY MANAGEMENT - OOM KILLER
> +M:	Michal Hocko <mhocko@suse.com
> +R:	David Rientjes <rientjes@google.com>
> +R:	Shakeel Butt <shakeel.butt@linux.dev>
> +L:	linux-mm@kvack.org
> +S:	Maintained

Also need to add:

F:	include/linux/oom.h
F:	include/trace/events/oom.h
F:	include/uapi/linux/oom.h

> +F:	mm/oom_kill.c
> +
>  MEMORY MANAGEMENT - PAGE ALLOCATOR
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	Vlastimil Babka <vbabka@suse.cz>
> --
> 2.49.0
>
>
>

Cheers, Lorenzo
