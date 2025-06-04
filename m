Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4326328BA8B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 09:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749029364; cv=fail; b=p2ymHlyVVd3pTAoO5ML2tq4jJxjysv98vDn1PgzS10uWB0w7dFht5P+pLwc72cMen/0juXikTE4MchAMwhoZt66GDNPMZ2VYjlkUTdqihPSapIKYG/Mtp/g8X7vittZysvi/FD0Eip6anld6eiQA8ZksAF98uGvuVAuV5vcRwTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749029364; c=relaxed/simple;
	bh=Wx7qDpAPpwdVsLN5qPpqkq97ynoDKLEMnJW33xQ/9ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZXEJ3DBjKmMk9kFeMnRtzY2l+62MzBUadLWVIQaWAi5aSARKl4BEDSk/Qo2cXDxQJ+ve/VW0kFWRPDlGyS4oNTYTfLM+IQnsMs5+rsfgKQriltY3xrO2/jn4sx0GAxc+1nCiGE+hD21NOR3BNtwwHVpLZ+O3JMsfqbQowj0Gl9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IuzB7YAu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=l8mVGHiM; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IuzB7YAu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="l8mVGHiM"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5549MvbY029822;
	Wed, 4 Jun 2025 09:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Nvmp1rUXn/SwRXMoyv
	ldlhTMvrERjs+RK2HuBA9u4RA=; b=IuzB7YAuSK0ZKhk0FoP5eRdB0dHFJ/86qZ
	dakCBY5g+7Daooudufc2xjYDOTv+23ofqcIKRWe3Ha/oLw3FpRdbgKy/Yq1FpAw8
	7i5KME32P3GXx99FNFx1hV5zXP4Nt0lCjMv8t0V3L0CrH3IdP4nUPV5bb2FpAL4X
	+A1I44I8bzuZ5wBYU7D3rqDU/rKWbRAq3Fvkim8cgj4RaHLoyu/+DcZHvTtKSBh8
	fBN1KBkJZ+LEnw/sr/MG9W571dF282D6h9csWA/QDJ/0EdL+drjDaaJX3Yf4MXQe
	bAE6RX6p1R1fPgx9bVaQuVurD7hTguFKu7irRxFoW6OONlESAfIg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8j3nf6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 09:29:02 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5549PnVQ040721;
	Wed, 4 Jun 2025 09:29:01 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011031.outbound.protection.outlook.com [52.101.57.31])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7asg0k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 09:29:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r3c+nwZt+WE48mfdSmW1AyQrpTIEyBDFxCRCEI5J2gORY7rA5AQ4LU5XrgG2AAs0RrvgHt3PyN4+QKRZKTdOC/HzKi78fJsT9l/rVBMzLag8Ik/NHvkocBeqfBBjS2h4kXCpxpZHmxlSr4LQDOEieWDdrRqH2Fqg0XCmtB6VqAwAYHOGCJ9yI+qXrvoPlhfhOqndIogeDWK1DHIyqc6uO48ng3gnv23Wo0fV2voV7pC7NUkpVObiSNVAIZFsafgjy3bbjqMmLNZmLptwefFEnh3xap0dmvR55IrT6BzPpIjd8IS5i1zTukbx740cW69Y1wcIC/QKzIxqtVASc9mstQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nvmp1rUXn/SwRXMoyvldlhTMvrERjs+RK2HuBA9u4RA=;
 b=MUy4+uCZkPSyulku6OkNFuf2kOrScG7HmDs/zoQ1viZkghe3NVCIB18rcWR+BZc8Jdh9nGqIiOgxvm3nRbNVy9AgA4y0X/I6CoJyOWRdRU4YRUvnshCH33T6BN80soWz9QRXWULuvrzq2oBxjBdpfHPh3zaHyASmjItSX7IXJNcsuqrE4UA0ZLYtcqPy5H9nq4mMEfO+OPbvj1tjVwy47Vt9+uj/yIypvrophq6jEvtLBeUWO0bgYxrFEWv/3z11ByIPuX0jmj70Ruz1HeoxV2vX/+cHCJc0ZQwkpAWWBatXV/4E6wHZDJH5QDQqVBhki7DExMx/s2MFfj+3jlYwaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nvmp1rUXn/SwRXMoyvldlhTMvrERjs+RK2HuBA9u4RA=;
 b=l8mVGHiM6BIaD1FdQ/mw661CXM+pJSEEvt5uaEoYMdbfsFyZVne4ETAe4nvxUQINmqEzzJPuIyg0vVeiW56DOD+JNONEhFPTPjfWrBjpvpqHND/bpG0hgyNBCbDJpAoCsC8y4qMskpDODrhmigSNkt5hEiuEzBwBInqe5xUY6s0=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by CH3PR10MB7186.namprd10.prod.outlook.com (2603:10b6:610:125::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Wed, 4 Jun
 2025 09:28:59 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23%4]) with mapi id 15.20.8746.035; Wed, 4 Jun 2025
 09:28:58 +0000
Date: Wed, 4 Jun 2025 18:28:47 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Rakie Kim <rakie.kim@sk.com>, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] mm,slub: Do not special case N_NORMAL nodes for
 slab_nodes
Message-ID: <aEARz1yOtGfudqNk@hyeyoo>
References: <20250603110850.192912-1-osalvador@suse.de>
 <20250603110850.192912-2-osalvador@suse.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603110850.192912-2-osalvador@suse.de>
X-ClientProxiedBy: SE2P216CA0097.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c2::16) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|CH3PR10MB7186:EE_
X-MS-Office365-Filtering-Correlation-Id: fbd836ab-7331-420f-ef67-08dda34a3b9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZfC6dWMOR5Rc5BxIbH+0rXbYpHn2E0d8sVhUpBjpBpLwoX6+t6r0k65j255C?=
 =?us-ascii?Q?miX0m8FQNzBsZdXAbZ5ASW99dE0GrasjbUrIxhbo/hLIOvZyb//LVOIO/7FV?=
 =?us-ascii?Q?sVyfjAXirDypFWxlT15wJk14SsXXpfVfbOs4HlnViMCk0I7w7TC7iiAX5cCu?=
 =?us-ascii?Q?9kjWAPlhKrCbPCGc8UW5dHzsB1VT9HVvHiwLMJDJ6q5THC96yA7UBMN6Pc++?=
 =?us-ascii?Q?ubLWOGG+0QLFU1w8Tg2wOsxEzvqDyks2CA7AbrtSyN8m5nhNTOsYkcZEl5Qx?=
 =?us-ascii?Q?e+RVrYlWrC+N9qravA+uV1M5uuBDEXUBPe3UCfRMj3mX/VD/SEHlg0r7oE1F?=
 =?us-ascii?Q?aYZjO+rD/JFZo0rPrCNb6Y1MdPNrCKQB8UYxKI5ZNSk5sv4KzDVWY5c8I5gE?=
 =?us-ascii?Q?t2hGPjIyl1s4j3xyKQPN/iZTZKe5jmEMYyl9yAsj1r7c8Kuqj2m0hXNI1BHe?=
 =?us-ascii?Q?+5VFL7A+CAAD+/T2qdL3whiO+mRvEiQo/lD+Erfragg1u6GQgtxWR+Z8RrEz?=
 =?us-ascii?Q?bXPMKhxSJz1o+A3vl1Q7qsLjX4TfWtFKKIP+3x4fGrPO5HD5fNhQNPAVMfLx?=
 =?us-ascii?Q?8rMCkrMR1C5//NYIWKPtelQ7AFvGHmSWS1JXOnO3H5kLVhhPJU8msHOt9C01?=
 =?us-ascii?Q?P+F9hiAWdtQFJoMzAfiBF6TODAcPE+iciOy0QCqsbywvn3Txw4cZ4BYwyvxE?=
 =?us-ascii?Q?nkmRSeLKqgStfg0Jj3f8z5OJJsWfpLrv8Ehzs8RNUXCu2j1sAi2bbSl4AosR?=
 =?us-ascii?Q?225KBzV4GqvQ2H+hhWe5B0r7H/HFu+jOcQBB6JzH1QBM4eEuBwV8WCBcddXT?=
 =?us-ascii?Q?bDp3wOXN9k//cERUmuRlBcSL8zMyakxHQFsQpiqhalImcvrNxcULk+D05/nU?=
 =?us-ascii?Q?HAS3PGKOny14g+crVWeIC76eikG1pjwgeVwJJ8D2MHRzG1Up0RdSYkgrRUMx?=
 =?us-ascii?Q?DHnh096P+G1Xx19SsBH8PNljlys90+K6rqeNY5JVsBL5vBdp0V7m/b+q/GBe?=
 =?us-ascii?Q?6L9YQhGVho6uBJkwccutNGh1geN4piod/N70oJrsxYdOKwfGUVdocba7zYJX?=
 =?us-ascii?Q?ogeDZxQFWc/0qx24xNjxGMGmjRWRT2enmkRaB+nFsiUmY7wTNOD+F80BNSl5?=
 =?us-ascii?Q?oE0IrZZZSADA9TLn2qnfjq14mh8R/tHPWQ2/Zrvw7t5WtWH4kJTcbnCuMlSD?=
 =?us-ascii?Q?RwqiVFPcB6BgUyn643dtMOPOq3FGrtRDSkZqDkg1wJKZUEpxctC120+L5DyL?=
 =?us-ascii?Q?CkjEByDNSVLWnxvg7QPcxIHmw27maGfbinp7Um/g8AlAT6vkfM7avHGFzzE7?=
 =?us-ascii?Q?f7vA+e0IXWzFj8ikZvMJjpw7vcDZ7+em5pgUBzJCf6sLpsjVRp+mDKdZADQj?=
 =?us-ascii?Q?52RoppHcPvwY51tIeJYjlnO8b/ZMKLdPIXP2cfKCCWE/BNjGu/hR3tG+dErU?=
 =?us-ascii?Q?J5sSfSBHGtY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fU4M72PLfG3uc/7CGq6A+IwiP44LAKi24rzSZJ9qnjb+IWKZv2ofAnBkjBap?=
 =?us-ascii?Q?2WHxlPUqjcq/eKVzGbVZXD7wN+ivP98uI6r0YUPiuv48waWHJjO4c1+H+riw?=
 =?us-ascii?Q?ZXa5FLiWpbpF9kcn4bpw9vkkQWGRu23CfzUxb4+sgvQSYBUFSqx0stqi55ho?=
 =?us-ascii?Q?oSo+QqiiPcR7t8qKdc4eyvSDJ5NA7JVF9bVmgzE7kIvjelyCtwWXf41Or5l8?=
 =?us-ascii?Q?khIGMdhcsEcrBtwt43O4gByL0nmS1XCNsOI/T5brRPTtmCYMJ+mfq2J6ZoYk?=
 =?us-ascii?Q?RxaH42k8EiPl8lejXrVHevvmJ3ImjLGLhZwjvZkLM0Epa6NDTsgoYgr7sSKM?=
 =?us-ascii?Q?TGd+lxh7ngSJtsE/f0dvyYbewQ1zGb+cu3Be5zFCR+mBecQaq9LD6WLPE3xA?=
 =?us-ascii?Q?KChSnOIsLcXepeGPpQ+c3sYWBdENBR0bSZY0DXeMAaFSmeFC039qn+dHQ1Ys?=
 =?us-ascii?Q?cPuO6oWwUEquyfQddkoHBGWMmGCfh4b9VfWHy3+cZq9UxgA3YFfESVoizROn?=
 =?us-ascii?Q?iJZtdeq9v26KR9/tO/+SjNTFbkqBb/RV6vpymzv3Lcznqm9Idemxv9whLMU4?=
 =?us-ascii?Q?CvPDRJGZ4pRT+n+TemnOn3Hp80PGYHe/NZo/D1l1suSufaesxOj0DfQvpzE7?=
 =?us-ascii?Q?lBZ3AVqjwYK3yxC9/BXcsH8CknMG2U+EA/upGe4ohEIkR4pzd/zP/0GIes4X?=
 =?us-ascii?Q?HxQtF3zPYza6A7J3GI9xNsfdYissaAEsMO8vIL3Phm5/n6H99pFxyBuGeBrB?=
 =?us-ascii?Q?nfZauOWqf7IsR06E4CqbmljfAukDQrYYzTgWFmSG4b2aryif8WecVHB7Ktu6?=
 =?us-ascii?Q?q3WzgvSNq16s94ScixGlwXMW524v5dBfuAOVTLKMWR5uqPs0Oiz2wSogmkAc?=
 =?us-ascii?Q?dDHlWY5iPiUdD9T1OMhYzdO8NgvyFIq3oabrrvLleadqRQxrQlmvaTUe3hb1?=
 =?us-ascii?Q?qOcIzkGRxHZN4496y+26bxEqkCX1+XfZ6n7cJrAhF7IJ6J+PjAzmsU7VLPFR?=
 =?us-ascii?Q?CZEWBDUhstIXwESHD1JfBYRrnCitejLfsDpx7+iiM5bGBrp4AkKyP8ZMzmdZ?=
 =?us-ascii?Q?suNkVbMvubbQDZVgejuQfm1J210RvJb6vA6dVQ1ngtW8QvuYYBLSyeu3BeLn?=
 =?us-ascii?Q?JsdYWt7ryzgynLktIjAb9U8x0PSk91a4r7CX6uQLnGHdX1ls3BtfEGjcD/y0?=
 =?us-ascii?Q?j4b93f1TJOugluxjL6oBp5JdZdCvMBtdyjgkyU8E8YwmWHVRUNjzImiw3erg?=
 =?us-ascii?Q?X+flutgKgDY5wyC+c0EmQ7lDKsvWgmK4VQ9m37INkU/FlxPelVY4QJ8GXe7n?=
 =?us-ascii?Q?lF/SJBIUfyXOXLZpderUhgYtSmd31beh5qOaGfMe7qkymNs6GAreuxCVnc29?=
 =?us-ascii?Q?r3+vbrjnMgAiP0HNZ24bvpcIp81itfExOn9qPFr+rDmvZYURX9YU14krzKsG?=
 =?us-ascii?Q?s6hcV2Uzv3lazK0aQ9+p1wpnAh2nGxsyzWkqGerssdKv5bDdg/5Dp00XOL0o?=
 =?us-ascii?Q?uJgGLe3kpXb9WglFFAlNGKLhZmoYyHkysrxsCYICR0GBf+GI2DJkJgpA/eaN?=
 =?us-ascii?Q?2NEK7KrXl9hWeuQUhx6sJw8a3Yel/YKvMdmDfjpx?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+cvy/0z6wfmruHtnVVDNUmGndVadvUUBtbyNz97PeOhcMaPdaqHyBE6U+PVjpvTR55WL+k7+WkFzlxvVfVg1Eq4aSsNEsb7afAxfGmYLdDqiLHmd/IY9YTsbM4co3Kh1rk9YFjVvKw9itjH5f0SnwKm6bIip8v46qQiqMEYw0MAuK80TxhSNbsYHf3hCDw1Eq7pPA5y1hs4GnzAvG6Z9wWGEMf4MvD4lo9ZyxvQw5UABJ8T1V14ez7esahvWItPjApFopCk42Lo2TGZKu3xx05arYzSdu/1ycPIYvyyFTEvI0zvLAuAoEaifRh/tR1/2KAJc5qnnnFdp0jgfj00KfTB3Fm2HWBVD98Vyzoz1X8xOyhsZcvn6cs5x2jGZ8EQsHTIcAZJSG1dzxcp8koZYLFp2wVMZyCzkNAt9odggpFg2TVBpnvdEsAl7aAjzM42M6BYrYCVLy5ubLHD3ApVXKDfAUO32l1qpiEopLQGtMPprkOciZJSCseAetH4+2VAi8y36AlsEeuqFPi8Ep2DiQRMqnPpzWqEEjt/wmphVtncBiIf3Sd6KNgklT9RmM9gx7DJSAFzigEf/ur7oN94f/shkxcatgBkyy8jK97WQOzE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbd836ab-7331-420f-ef67-08dda34a3b9a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 09:28:58.0979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1XH5dqFKn5fAKm0LSrXkkiaSCyK1cKzbxHzzR8PfWBidGxRavEZO0YYEY84EWJugJUClWUvy5rVRA+9KDXjXTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7186
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506040070
X-Proofpoint-GUID: bLaBzGbYslG5yqgnV-qJZT1gnDLe_aXw
X-Proofpoint-ORIG-GUID: bLaBzGbYslG5yqgnV-qJZT1gnDLe_aXw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA3MSBTYWx0ZWRfX2juPiSAyfe5R 2/JKYBKTrmjKm+rm7xEvn3jbGcnr+7/4KPVp81+tp6Ejk7dbZA2BKDsVnDa5oxQYEiBPjRKMJTp bxDL3YoQ3ww4aENXPcgbPsqWclc0tmyDeWMjZ/q2pK5PoGIUrBsE69sdS56hGqAmDwh5ag7ekVR
 PgrBUTqn66evYzHfuHteD9IyZZnmrUA2YX5TGZdqJg4Y5A2RJ6aLxmCell/qIRnaAEirib/pvN5 cEEdGxC7Ge4B0yJtFGswmKX0i8hNSf+ZLQ/U+JRfs404Jms/KVTnpPjXNE5Hgt+yJ/oxD1C9K+z 8X+3cMWK/yQaaOd0K7BxNwfxQWknFyPgMoUi7cm+t9+38nDDMf6GS7j2LRmIRtYsK775npcWJuJ
 7B8rZoz2SE/cc+RjzSNuq7kgELj8fssFZhHeldna7emQxusguPJ7phawuu8lYKpVlKPsHXfJ
X-Authority-Analysis: v=2.4 cv=QI1oRhLL c=1 sm=1 tr=0 ts=684011de b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=20KFwNOVAAAA:8 a=yPCof4ZbAAAA:8 a=auUSuxBPB_sHxqnpj54A:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13206

On Tue, Jun 03, 2025 at 01:08:48PM +0200, Oscar Salvador wrote:
> Currently, slab_mem_going_going_callback() checks whether the node has
> N_NORMAL memory in order to be set in slab_nodes.
> While it is true that gettind rid of that enforcing would mean

nit: gettind -> getting

> ending up with movables nodes in slab_nodes, the memory waste that comes
> with that is negligible.
> 
> So stop checking for status_change_nid_normal and just use status_change_nid
> instead which works for both types of memory.
> 
> Also, once we allocate the kmem_cache_node cache  for the node in
> slab_mem_online_callback(), we never deallocate it in
> slab_mem_off_callback() when the node goes memoryless, so we can just
> get rid of it.
> 
> The side effects are that we will stop clearing the node from slab_nodes,
> and also that newly created kmem caches after node hotremove will now allocate
> their kmem_cache_node for the node(s) that was hotremoved, but these
> should be negligible.
> 
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

Looks good to me,
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>

-- 
Cheers,
Harry / Hyeonggon

> ---
>  mm/slub.c | 34 +++-------------------------------
>  1 file changed, 3 insertions(+), 31 deletions(-)
> 
> diff --git a/mm/slub.c b/mm/slub.c
> index be8b09e09d30..f92b43d36adc 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -447,7 +447,7 @@ static inline struct kmem_cache_node *get_node(struct kmem_cache *s, int node)
>  
>  /*
>   * Tracks for which NUMA nodes we have kmem_cache_nodes allocated.
> - * Corresponds to node_state[N_NORMAL_MEMORY], but can temporarily
> + * Corresponds to node_state[N_MEMORY], but can temporarily
>   * differ during memory hotplug/hotremove operations.
>   * Protected by slab_mutex.
>   */
> @@ -6160,36 +6160,12 @@ static int slab_mem_going_offline_callback(void *arg)
>  	return 0;
>  }
>  
> -static void slab_mem_offline_callback(void *arg)
> -{
> -	struct memory_notify *marg = arg;
> -	int offline_node;
> -
> -	offline_node = marg->status_change_nid_normal;
> -
> -	/*
> -	 * If the node still has available memory. we need kmem_cache_node
> -	 * for it yet.
> -	 */
> -	if (offline_node < 0)
> -		return;
> -
> -	mutex_lock(&slab_mutex);
> -	node_clear(offline_node, slab_nodes);
> -	/*
> -	 * We no longer free kmem_cache_node structures here, as it would be
> -	 * racy with all get_node() users, and infeasible to protect them with
> -	 * slab_mutex.
> -	 */
> -	mutex_unlock(&slab_mutex);
> -}
> -
>  static int slab_mem_going_online_callback(void *arg)
>  {
>  	struct kmem_cache_node *n;
>  	struct kmem_cache *s;
>  	struct memory_notify *marg = arg;
> -	int nid = marg->status_change_nid_normal;
> +	int nid = marg->status_change_nid;
>  	int ret = 0;
>  
>  	/*
> @@ -6247,10 +6223,6 @@ static int slab_memory_callback(struct notifier_block *self,
>  	case MEM_GOING_OFFLINE:
>  		ret = slab_mem_going_offline_callback(arg);
>  		break;
> -	case MEM_OFFLINE:
> -	case MEM_CANCEL_ONLINE:
> -		slab_mem_offline_callback(arg);
> -		break;
>  	case MEM_ONLINE:
>  	case MEM_CANCEL_OFFLINE:
>  		break;
> @@ -6321,7 +6293,7 @@ void __init kmem_cache_init(void)
>  	 * Initialize the nodemask for which we will allocate per node
>  	 * structures. Here we don't need taking slab_mutex yet.
>  	 */
> -	for_each_node_state(node, N_NORMAL_MEMORY)
> +	for_each_node_state(node, N_MEMORY)
>  		node_set(node, slab_nodes);
>  
>  	create_boot_cache(kmem_cache_node, "kmem_cache_node",
> -- 
> 2.49.0
> 
> 
