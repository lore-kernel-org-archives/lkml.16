Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE57235044
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 11:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748951864; cv=fail; b=HVf9Yp5BDMTvsultfnFw6cSB/AboyG8BsifjQ5i9Tnl3iuC1CES7jaDKBPYEvcbEED56y1qEqjChAByN7l25GLiIWEejd4OFyaoASUyvrg4ok4VavT83oSRCSUneseHbaRI58PVEc4w6buxUEpwSH9wTQQZZtlmsaTcf/i6ktcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748951864; c=relaxed/simple;
	bh=H5Mm14ELQiZtYk9Y1n6Xm8iBxVP//UGJwC8CydE3Bhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MYM+wcHUvBVRygMSvkh67px6P6ZxppKG77KPQl8Z5NqxodSN5oBhnEdOZxWzzsIjNWz9j10ODmoE/q7+uSVAGqgzBsmnr/RsT2dFi8WvKEJhujxnBJwVEGqL6qXuuI1SYf6L7UpMB5Kei6Y5+Hu7nQWmlmRbLE9Rram6aIJbBuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZttcUKdQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zY6UPwH4; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZttcUKdQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zY6UPwH4"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553AFFx8009856;
	Tue, 3 Jun 2025 11:52:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=nTnnCOibHsf2ICTNyr
	v4IaWnP01H4wmTWumecUm/s3A=; b=ZttcUKdQwF/ryFMRJi0PsCq8PUepjcqlhq
	YyePriqnL5L60Yjapnc7QHqIu5HUTPf2ojvs9oAjuXCxiFC+6ZJixazC23L/ZJo0
	UN1aNaONIGb2Zxb1w2wXqkjNHHHtHFh1XhQfpVvu2vpG63VTxUD7VL0yqnirrzcR
	FvvRYxitGfqganZQmyKncvjDKf+YusvSycqJJl6TNIRXD4E/m7A7e+qX/RCvQxcW
	PZViCNmAkfBtRcCxCcmO0oCqZl81HI2cYp14Az4FFvjeq/AtlhdT7i2graENz6WX
	foG/ceJl1p6YoZANY3RqfQqoR1movIXFSFv9XTYSPkRlzlJTZALA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471gah9qem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 11:52:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 553A3apx016444;
	Tue, 3 Jun 2025 11:52:15 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2052.outbound.protection.outlook.com [40.107.94.52])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr796bes-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 11:52:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tjyybVbIqibhsR9yF4ezy3rz04kF8gMaQ1vMPu3qDi5uZoevapKUCLmA+S/xS9QVeO+Hp5yv0udUUsFLkAr8U3mF8rW0mmcXtSwBUvucBJus08j0cpW3PO5rn2A76DWERFsJfNgojg9ejDHDfD4Y9NFS7CCQJLRpZ9f8qhidUWUzySaI907R9nB2hlrsA+I1DtmJHjB3O+Njs2owaxw1fbQd6kELHHg5gEzMJzMYtrw9d4Cts7o7mL+lSZg7ClbJ3p7uUFmrMiLu1QucocH+Lo7uDzW5rh+acvTGbAcVNmZgICSkeIop6i3XonUZuBtuFJ1YSJfrNE71WgWXHRxyVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nTnnCOibHsf2ICTNyrv4IaWnP01H4wmTWumecUm/s3A=;
 b=abeTT0FYWYvqOyNkkjwaCXfsdl1fJTxetvlmWMNrhRGPqIul9vedj3IILC1BeyvMcOI3feFeQ8ZVmnZEqBI/bOLr7mt3CPpVGMrxI0CJhgGirLUux23QjMc50xthHpNjjjsTuL/JNZ4y17b3WAFObnkuWfB/OZYLbVBzILF26iTkLCDnErYMrY4mSpK1CQatKsiHuAeLbT9+75R55EXicTd+HUhiLHFkJ4eQa51uidhATvEH2l3mqkezwmM3uHd0tr9e9ImrKlMr3V7JNlKAG6zCw6vD3VhzNYjHLgbBL0PJuAZheyAXuEAJT2rmkvjjexYueVu74IivAZY2n44UsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nTnnCOibHsf2ICTNyrv4IaWnP01H4wmTWumecUm/s3A=;
 b=zY6UPwH4xpiCxtP4szrbRPwmu7UEr91BHMD5YmlyTgxpc/JXU7O7RsuY1hbM74CZVjxjA3/qKz5/V+xQ0rCbJFRQLkvVtsoZ30U32v2j4pqRcgt/WovaxpUcHlZHMryDxQbYus1HttysTSA+pr9XhManE/QeP2y0u/0cu0Uy9uE=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS0PR10MB8078.namprd10.prod.outlook.com (2603:10b6:8:1fd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.41; Tue, 3 Jun
 2025 11:52:13 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8746.041; Tue, 3 Jun 2025
 11:52:13 +0000
Date: Tue, 3 Jun 2025 12:52:09 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Baoquan He <bhe@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Yu Zhao <yuzhao@google.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>,
        Kairui Song <kasong@tencent.com>, Nhat Pham <nphamcs@gmail.com>,
        Barry Song <baohua@kernel.org>, Chris Li <chrisl@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] MAINTAINERS: add mm swap section
Message-ID: <29c2ba4f-4099-4427-9721-cf9d5a728d20@lucifer.local>
References: <20250602152015.54366-1-lorenzo.stoakes@oracle.com>
 <aD4/4pAxrhb4bRoI@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aD4/4pAxrhb4bRoI@MiWiFi-R3L-srv>
X-ClientProxiedBy: PAZP264CA0203.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:237::35) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS0PR10MB8078:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ab7cd45-a9b2-4392-5f25-08dda2951434
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?52fGKspsrzcEe/2KoN6fMkbeoBqn4u9xBMdThBAgiK/MLg2j1z+nDPZfl9UT?=
 =?us-ascii?Q?gqbM6gm0zRua0xq/Plq4LYIkd3CvjZQRMkpzQYfMZL8ZaK/4gkIob9zCV7Va?=
 =?us-ascii?Q?vR/REC7334lPh1XwFGbDoIIH21sH67Jn+7txmZj69QE4FEn/tR653alCXnS0?=
 =?us-ascii?Q?so007iGnqfAMGeDBVNQOceYtYSiChYjx7PVFHmIQQVbdA0eENplTcxV0QcII?=
 =?us-ascii?Q?BVeimjJ8QSc06wpdjD8gnLFMo/6ADbRoBfkIlSho8n5StXaKqO2Psqz6qD46?=
 =?us-ascii?Q?sejF6oWP2KIkzYgXSIC+v9+GhZPxfF9thhCSq8W7Dg0NuBIgBr4dn8OhKEsL?=
 =?us-ascii?Q?2RDBPJ1q8CXe/QmmnX1mPBov9DoFTNe7T3utSGQ3VLNI2hH6Eo1BNtbPzlkD?=
 =?us-ascii?Q?sKti3+u6fzr09/SxlN9EvoWhBFr3a9eoobUGKYMEPnt0Pit1bFCDr56AV4so?=
 =?us-ascii?Q?hU+f1had7GEXZ+uxs+z4AMrP4hIx12/jlrslOgZrSOgjPKfBUoJzWMHzxcgA?=
 =?us-ascii?Q?RPF5GT+0h4XP4g5eyEPsTX+eDpALiYYgCN/OfOt3eXaE5NIQQfGAOFl26Ss7?=
 =?us-ascii?Q?IyClTlMoBF2fhRyerbg3IOJEJ7P9lICTKVhEi/NtQbcg3/xSiOSclRsWVJwu?=
 =?us-ascii?Q?sEh6Y+cCCY5GyR3uabk2Imt1FKi0qwksM7WjaXgt+3GsAjnEFBvwINodOHv5?=
 =?us-ascii?Q?hSimGOCANAAcdmcQrC+IgvgUQYeim1cv5HY0/XdHh1yrvVaeagOLVMn6VdME?=
 =?us-ascii?Q?Lb7B+KdlTlQJNJU6+43LK2Pj7DL+YVSA/z310IE1hpDCCRFN8Q8ftyWWT+x0?=
 =?us-ascii?Q?bLZ6vwjpeOYLRNInSrsORZHixYGWCydb9UUVddBXqgyw/Q3IddrFyev7tWgp?=
 =?us-ascii?Q?mHqz1wGyazyNQY9TQWXXdE3q4a3KLN/M4MBWzTobOGhlIZTHsg6sqiGvXyHU?=
 =?us-ascii?Q?9BeUD7OFlRLnpd40/feCwnpPVH3r0eRZr99UxRuVG/+bIFLXVxXGwgLm8ph0?=
 =?us-ascii?Q?B1K8DG5d0oyYgN2BPK3dKLPqSD4s1aq8U5Qi3oiPe6qwspRBc3jfsMGRZKge?=
 =?us-ascii?Q?bMPz9hRxGnpX+eZt5VjQQ1upel2biyDR4gmZoz75jC3BEIVNgVjrXRGVwcn2?=
 =?us-ascii?Q?jDulJYUBxaIVk5j1aUDVLgj+vLOMnCnkeDV9GvSnbwyyDvWwY1MrH7I8eNJ/?=
 =?us-ascii?Q?9JazCSVDiLJcBnPk97n6n6zWVjq4O+6JioHcqPv8ciAO0LLXtl4HZlRwVBYL?=
 =?us-ascii?Q?FrYbgWVuQzx/cu6C2r7oh/x2cUtTkcI1rOhvXJnjBFmSEODfbPiuREtEDnTe?=
 =?us-ascii?Q?4dkNh+7XGVlpd8WdLPW4Xd5TKo1nNvXKbX4WfhLJ2fK/RwRUC8kOP5oh16Ok?=
 =?us-ascii?Q?Dc2RWDZlIw92VDLNGiJueIVo8jOlbUyumDyH5KHImvyZKbI/HYnFsTHFqV/Y?=
 =?us-ascii?Q?2P+k85hLYug=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rkIaMGvAkilO+ZC3zLvqID7wRADN7itTMdrD+f/NoS3DtkG2kwRbdlbnFrAb?=
 =?us-ascii?Q?o2qBQcJs0FjY81KQG9H7JGIFaUDOnDUmsNhb5WDknVhBo5VhtRqD93xmgVbO?=
 =?us-ascii?Q?tBwtX+jAUPzUkxFUSu3VMlQS+ECsE12p7kCEWLwXazeQdUqF5ZwPgMx+yglu?=
 =?us-ascii?Q?4gocneTMYwnbDu5fexaJUt13Yuv8g6zbt3Bw+fNK5IH/si69BPrB7IWEXHds?=
 =?us-ascii?Q?/Hb0uSlOaAntSH9SbPE4mN2+YtSj24goFae6FVky7HFhWkGEfUjfy47fwlcx?=
 =?us-ascii?Q?6GSF7R1gmzNyFe1fSCsrKCRzxexzD6wb4b4sNUrwICqAYymWaEJBhD0g3nnY?=
 =?us-ascii?Q?VTM/e0Ls7vVB5OHEhMXbM1VX/l58J739/8B+jGxIOZQuQLGs6jxj5omPGEZD?=
 =?us-ascii?Q?RAs6PENl7U/QVis7Rq3xAA7JoR9SxVqaiJIw9zAj08RWdD634/kyUJKthPmh?=
 =?us-ascii?Q?BQs3CGn+/vIAImsOvxU3OdCqiTdS+CbDHHiHK816b26cyENJbLtQr3ee5g/F?=
 =?us-ascii?Q?w2LCIQCo71bOOUuGR6lOHm8LVueu1wc9Qtq9fsxjJt/8ptJG+DJRSULZHPhs?=
 =?us-ascii?Q?n6Vk5NkibfSo9zgE4SLKtJs59oeDgJn4vRcdePtD1b/TJAsBqUJHtEucGz6e?=
 =?us-ascii?Q?arTrmDIzDl6NxDNSclSrHq6setLLmTKDefJQRG41bGGue2LETwGZd60Wv2W/?=
 =?us-ascii?Q?0MDboiLgDpUsnILwPPKb2CRRwBtqCFP3EZGlVnTdhABg3OHXO5A+niLAeaX6?=
 =?us-ascii?Q?G/p5okua8+lO99F9F5TAcdooFzaPdMbGFnxQMwC6zMtOi/M/f0HDIlwvVmGK?=
 =?us-ascii?Q?Wz5KaNPI13NKsvVYm7h5inhQfSWPZPze/4aS1j9xexrBSl3K0OMoh48m2MwQ?=
 =?us-ascii?Q?bxIuNdAmU4BUXSxBqjJo5Zkxmw6gsGm+RKd4v5gqU59iEfWZn5hjqKJEYqMx?=
 =?us-ascii?Q?CEufWxLVG7/Bxji0BwniFzKfMyZdIfoRRUz6wuWoaasy4pxo4Ddh+q+opnmZ?=
 =?us-ascii?Q?uq2aGbW7Uz3yYwh7bECMRfWoaEe6IsrX/H0eRhyfaZCcXgYkmTujgEzdWoyx?=
 =?us-ascii?Q?Gzt4gANnajZ+wfc6E+XU+dWws/sCUG9U7kSr0Fc0GKu/G2GUkQuvkeUmEYPx?=
 =?us-ascii?Q?20vabPAHvc9h1rrj8m1INy7kGPO/xNAER0JfF6+XC5pRvPOOjJ67ZoqjPLPm?=
 =?us-ascii?Q?YltyW09wK+qu4LaOWaGgKL/j9f+NGTouO6NkTLtlMc+GThSu59fXCPtFN1wu?=
 =?us-ascii?Q?xmLcvtrOow7nLLEa0XKHGQaDG/D/67s38lGMAHlv/ZBzPd2dZNWpzruEeKNp?=
 =?us-ascii?Q?X1g/tYhahp+LKgLutqdrjgILC2urCprtH683ZGM9P9mS0MavPnERf7sTi53I?=
 =?us-ascii?Q?6U9cjC4/x2A6bDkyJnZADQRBLcC+nBCLtSEVJMi2EswGt1wDqmHBIsIHOiGZ?=
 =?us-ascii?Q?bTJH4U0iMNmMB7tPYOEpiTAwC2b7bvkKmpmdwaq7ySj0esSSbgMDZlxHSLLg?=
 =?us-ascii?Q?ifreiCBSLPK1XhSBEbgot/PXsWxHowxSJ2A5cW0vtaYayPT0cISoM3Il9Cl1?=
 =?us-ascii?Q?74114necCvL6UYx8M9KmOgoK9VPqvTLrz8J/NtMgXgHsUpqSuaYTsasHDhub?=
 =?us-ascii?Q?BQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VORXO6nKrShMtuV0NJWUeRus6w1ibJignnLv+lt4wQHC2oUsfYVfVXqfEx7ZS/2ixku0uAh75wHJiW+y4h0o2dCMAhaY5zF9UMoNPEBS9AdeGmNtAoZqS6DEJz1Ab5txrgMROeJXDbDjT1fE6VHO0/6Xww/xTsqY8PVGUZZpTQsNzctJHZmd+yVVkO5o2kCs/UELFnV5QECxyWFlVlAAITqzC+mRK41oT/wnGKBy45xFzVSvU61un+i3JcksWcpxPPEl6iWg4mIUhCsEbsdZTJ8F01RAKBEwfOWZDK5aYmZ2zpvLXCajBL/Sddgs0IoMQtEvdC01AaZ7xTKJyVagvY51lEABElPUv0jC3jq1xdau3UEUi3LRiB70037fwYqsIzKg7LwoHNcZ4Hj3QSR771S2H3wDBzIdLlbQ/SFtVIzhLb4cwf7VUCLJZcoH6afgjoIBGx6ofgT5JSBI0nRpkIyiV4cwgfx1c9o1/yn3aGzHmNuY5VmsjWlH+qSmCuGhtczhnxVXSgtAmp7Pd147rIqktpQoeZXjZitFInp2WNYxdlYPSmG3kgVPJdz/3gXwPpTdaACFL3s0ZANYU3vAMjumFhCbsSfNa9GYebhGdfQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab7cd45-a9b2-4392-5f25-08dda2951434
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 11:52:13.0029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8hcmIQmVR+iIoLVv3+9D+wV6NfBBUnetxMMOjI8JJdz2zP4GbItsq1ju1I9WgNFS4+76JXDDm0hyXoYzTq/u8Vr8CEShYGQWpX8qOc2BIvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8078
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506030104
X-Authority-Analysis: v=2.4 cv=aqqyCTZV c=1 sm=1 tr=0 ts=683ee1f0 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=Z4Rwk6OoAAAA:8 a=1XWaLZrsAAAA:8 a=AiHppB-aAAAA:8 a=GvQkQWPkAAAA:8 a=pGLkceISAAAA:8 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8
 a=37rDS-QxAAAA:8 a=ctVG6Rb0u_-QYV_cuQkA:9 a=CjuIK1q_8ugA:10 a=HkZW87K1Qel5hWWM3VKY:22 a=k1Nq6YrhK2t884LQW06G:22
X-Proofpoint-GUID: ngrpiVCkfOQPP40iZrUpqFs-uhwiC05c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDEwNCBTYWx0ZWRfX/z07D9iT+GrW t3Laf13q4CLQx68RpFqRm0tTxGSGu1VGV9ATyhUovFSWG7FEeDKDg73WkYBuRIX3gWTOH1yQES0 k77cL111MjMZ7Uo0+3XvmM5h2tfDvGwyVtCKRs3l/VkTdZyX8ddQx5Hw09nY3qxlDX7uwTq31D9
 Iu4+wPzybK+DSTc0djcm3N0apKFGVDYjX1hKkIskx4DIOKxVl6rQsQfk4BU++K+iWBDBJBrZL3G I4tHqpb3NNdY40p5YMT039qORko9iCmWQF7vxRuGtTw8oZJB1D7rYjhT7euE02MpEfV/wpXtm+8 Rm727pCCLUMNz6vulJ9zL629x0L7bF+Y5Y6DPrsKRw+ipH6UYH3LSSI/xaeHBKhnHbU4i6kt4zo
 kUegQRGFZKNoDN2t9X+THt/by1SS4Am9fe5ZbAHI/fvLriCAXm0QSIdeWssudBXWwWwg2j79
X-Proofpoint-ORIG-GUID: ngrpiVCkfOQPP40iZrUpqFs-uhwiC05c

On Tue, Jun 03, 2025 at 08:20:50AM +0800, Baoquan He wrote:
> On 06/02/25 at 04:20pm, Lorenzo Stoakes wrote:
> > In furtherance of ongoing efforts to ensure people are aware of who
> > de-facto maintains/has an interest in specific parts of mm, as well trying
> > to avoid get_maintainers.pl listing only Andrew and the mailing list for
> > mm files - establish a swap memory management section and add relevant
> > maintainers/reviewers.
> >
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > ---
> > REVIEWERS NOTE:
> >
> > I have taken a look at recent work on the swap and chosen a list of people
> > who seem to be regular and recent contributors/reviewers.
> >
> > Please let me know if I missed anybody, or if anybody doesn't wish to be
> > added here.
> >
> > I also realise we have a bunch of non-swap stuff living in some of these
> > files - we will have to address this separately :)
> >
> > Thanks!
> >
> >  MAINTAINERS | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e66460861bdf..3386272f6bf4 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15674,6 +15674,25 @@ S:	Maintained
> >  F:	include/linux/secretmem.h
> >  F:	mm/secretmem.c
> >
> > +MEMORY MANAGEMENT - SWAP
> > +M:	Andrew Morton <akpm@linux-foundation.org>
> > +R:	Yu Zhao <yuzhao@google.com>
> > +R:	Kemeng Shi <shikemeng@huaweicloud.com>
> > +R:	Kairui Song <kasong@tencent.com>
> > +R:	Nhat Pham <nphamcs@gmail.com>
> > +R:	Baoquan He <bhe@redhat.com>
> > +R:	Barry Song <baohua@kernel.org>
> > +R:	Chris Li <chrisl@kernel.org>
> > +L:	linux-mm@kvack.org
> > +S:	Maintained
> > +F:	include/linux/swap.h
> > +F:	include/linux/swapfile.h
> > +F:	include/linux/swapops.h
> > +F:	mm/swap.c
> > +F:	mm/swap.h
> > +F:	mm/swap_state.c
> > +F:	mm/swapfile.c
>
> I am happy to help review swap related codes. Thanks.
>
> Acked-by: Baoquan He <bhe@redhat.com>

Thanks!

>
> And by the way, mm/page_io.c may need be put under swap scope either?
>

Yeah I think you're right, will add to un-RFC'd version! That is... an unhelpful
filename :)
