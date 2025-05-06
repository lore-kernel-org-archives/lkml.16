Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208B52820BC
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 14:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746540918; cv=fail; b=eIDGO3JG0XU2EK2j4DZOHVb/+QwuBr/be/F3HWWyibDNL6KDftetQ6cLVS3cUym2FRcTIZ0X1AMyU+4pnEkaQfIWNwP4qJ6k+GS0CWUNzPvKNW3gudDY7VhPr6K2AMe3oPSQDoJ2v3yEUB4FWYHAMsc16eKvPPfS8lDaouT62iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746540918; c=relaxed/simple;
	bh=13PrUoJNIXeHOe19OiAclfRI6DLcizk552t/RjlUqt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=k9tpBsfQRVP2X49026ZZIX6Ub49C9lzzrwWnVLIWaF3v+kI1btzybTPAP8vkr9OIYldyEZiioNBU8NWp/pNGvEmoswroXQ2zTvSBiWCZAgLLOEfjBtRK4crEquYdAttzZMCUywO9aiI2HF0B4WEXUkGxiSWnirlD5qaFAVtKXRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qUu8ITOa; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=c8xjYMC6; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qUu8ITOa";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="c8xjYMC6"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546DMdMe026102;
	Tue, 6 May 2025 14:14:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=wu7i4xyAjuWx24UpmG
	5E6wDKvu2gw3nOYRvM1qEWR+I=; b=qUu8ITOakDr4c3MMlIaqm34pMon5gXgIAP
	uM+HQf60mv90flAyhXWcubijfSYB97ZXvp1y2y96x644yU1XaQvEtDZjUc5ckLz+
	9B5oVTRDByZXYlgntkBtFTsRHdaABD2tBqdAr88BH7jvaCtu1F5EQWnCvVem8oPo
	ck2ZbyzDCO1ol3wc2FeBAFBoR08yLrPr0dTNQ7Iy7d4pYDxYWOk9qmTTFNSj6v8r
	7sfVN1O40zvevda1nW+mTNDwW2WSAPF3ebmE/1eAtM7bpjtGnKSS90Hdk9sPM3So
	NI4VwtIVlcICMa9+vk+qLEmJz8qTCtOeUaCJUqCQRbLxfF7wGUXg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46fk8bg4ww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 May 2025 14:14:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 546DeCXP024474;
	Tue, 6 May 2025 14:14:32 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azlp17010023.outbound.protection.outlook.com [40.93.12.23])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46d9kfafws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 May 2025 14:14:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ilyLdCvfyKBngOQLDCgi46Ijux9CSfM8XctJPLvha3mwqH22hcgji9lfQgLPbRAUouC2YrXCa8x+tVNDb1/ExHMFTTX1AqZ5OqJ8U4r82rsrtpy5OVMhO6ZELQfsHuuGjLzdXkKEj0SUbcgNGY/3njp4UzbdxNdafzNSLsuH4FsmDRi/neWz5vPENeDnuGJ7Pmtwf7u4ajiS7Qp9iSF5+iakrsHh00oo9zxg9EogsHLl/HHQ2g8knGEzsVDD981da3Wt6d0ABOqRkhka/7WvHzZrPhu+F5bH8GeGjFr6qkHfCA3ZAhMoAgPv+mDFfiO4qXgE85cv4b47f2itLhPUTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wu7i4xyAjuWx24UpmG5E6wDKvu2gw3nOYRvM1qEWR+I=;
 b=dm5Bk617fzLyKSr2lpsXUKNp63z3upRdhU8t0CkorLOl7oVb2L3NE8zvR7pbS87duKzrwvbdpZicru/6FF0KjPTVHIQQTM7F85MYQonioVs2UPQZn5mJD/BGRmnNTNSsmcLFUl1Xwj+Imv3N8ivWAa9puXdQnPIkeibMKuqBb6zp8rBzvijxy8SGMxs+ZNjJrGBhTyKUAwxqeFNmfpTSmrJ0sgFkx6HuXzPtNOzllfqKMQYSOCY4mO2Xz31CdIlyePs4zoyiFuedmoEggjMKKsODIn4mklFLw/0uhAV8JLOmp8C/BqwqmDQsCLZcUzBpHsPE3rMPyoBHIn03rs9iRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wu7i4xyAjuWx24UpmG5E6wDKvu2gw3nOYRvM1qEWR+I=;
 b=c8xjYMC6stdoBdyn92PvQ3l7cp3aR+R4+PfA0OXdphDYDAvqYCka+lP15J7pDoDUGKai1LJIrVzrmQCgEmHB5RzZdjBNgjAGGmPM3ofvehSODJzTPz2s258fegbtmu1wAtyMBzdZf7BYiA08sU4eABG4OfY9HTXMly2wp7i6L1I=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM3PR10MB7969.namprd10.prod.outlook.com (2603:10b6:0:45::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Tue, 6 May
 2025 14:14:24 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 14:14:23 +0000
Date: Tue, 6 May 2025 15:14:21 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
        jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, david@redhat.com, peterx@redhat.com,
        ryan.roberts@arm.com, mingo@kernel.org, libang.li@antgroup.com,
        maobibo@loongson.cn, zhengqi.arch@bytedance.com, baohua@kernel.org,
        anshuman.khandual@arm.com, willy@infradead.org, ioworker0@gmail.com,
        yang@os.amperecomputing.com
Subject: Re: [PATCH 3/3] mm: Optimize mremap() by PTE batching
Message-ID: <84defcd3-0e52-42e8-951d-6301713f344f@lucifer.local>
References: <20250506050056.59250-1-dev.jain@arm.com>
 <20250506050056.59250-4-dev.jain@arm.com>
 <7c6e61fa-2437-4c99-b1d3-97af5e2b37a3@lucifer.local>
 <9c2844c9-5c1a-4250-a89a-0c4d01d47d5e@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c2844c9-5c1a-4250-a89a-0c4d01d47d5e@arm.com>
X-ClientProxiedBy: LO3P265CA0022.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM3PR10MB7969:EE_
X-MS-Office365-Filtering-Correlation-Id: 7502289d-167e-401d-3386-08dd8ca84d38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3w3RDXuFlZGV6zuPG2toLStAyw9Hj9SCO/ODFC18AZGBkh4aWjeaeAo7F2T7?=
 =?us-ascii?Q?wRkHFd3L5buKG0XLgCeyuOiwot+9x2l28uocDyXO0QdE0HwNxtiLG/lDpkeV?=
 =?us-ascii?Q?Phih1Z85XYd9Z4dzDy6/frwIaotHzwkDT7Gg71oFX/glVtFTGY71L48I2Tj7?=
 =?us-ascii?Q?6WVPvoh4AEiQmm2TD88TxTUweO9tt9YTJEJElyjYmcXdSXO582FmrLdfbMnt?=
 =?us-ascii?Q?/8dx5tH2gztJi8hcr7idT/wSJYRN3u9YVMhgdjmUZRcr35rk1YNZVoIpl0gc?=
 =?us-ascii?Q?3aL/YJbdhVcxdS5zSoZDdN/umRmkI93zSJeP2HvqaDSyWy5NEVXzYMufkzWJ?=
 =?us-ascii?Q?MxArfDlLYHa4ZVr9PnuRF2KtPc5R+WxbDfWoLnEdeNRRwjwQfOZ+EC/t9GPo?=
 =?us-ascii?Q?hAjJF8jsDDPqn4tpH7xyLzC4YGY2pwAGbnP/bVUNkv09H1o+TMiLKL+yKEj3?=
 =?us-ascii?Q?EHGcAR2AWr5auqGjnGrc/VmtitMFIGFXRRmqUyqnoOapafYRGWe5RPkgD+QB?=
 =?us-ascii?Q?EvU7IUXOtdyfAQPaytILiZ2680auiQLEUpnnnA/0v2cGTUKxBj+KEEdEIjyw?=
 =?us-ascii?Q?ZRAVukngZ4wTqdDb4vGK5xn7c1nY+9LDVUsQEnUdwfXl+kCNAj898TYoWjNh?=
 =?us-ascii?Q?ts+/uiB7i7JYLdykAkufTWKGexpRqfN73/EPeslYK/4EU3Ew2FuuJXmmeGCU?=
 =?us-ascii?Q?JzwqldC3sB4CMp4KrL8maHSVunZK0uSLlMHu18QeKfknVQFyKPxN6HiuQBri?=
 =?us-ascii?Q?YwLxqadgts+lvN6Bf+M+DGs/DMMo90kykoKw2ZqX/6sAhMJaS0YURB+zag6p?=
 =?us-ascii?Q?440M9L3CU23pcdjoeqW+ptJ8qbjvdj7cik0xdDzv3FHF7B2wWx4H/vxRYZDa?=
 =?us-ascii?Q?lWR7VErNixf8lbwWRCVwIs59b2N8RlvgNuSMYX1XYEMQaKdB5VhOHxk99z0p?=
 =?us-ascii?Q?gvHrwlTT68CrfdPYnVcg+L8IimM0Rk7Lgy69Uu+r0KIaFiEuZuAEpff2jp8V?=
 =?us-ascii?Q?/IGa8c4jQxEUmE+JG1JQ+1PhVs21x5JVKBtMIbDYuDEonwSFcPbNCZjkaAip?=
 =?us-ascii?Q?kiFknymyQykJ5oMiTzHSRP1yHNs7mA3FNFLPqjuOeOAwTGq1jlOEtRigMotK?=
 =?us-ascii?Q?nGaRy4cljG7f61jYT98hl6QxIG8uuhOj4cYaw6ZtEqPW6hRrO8mYuh2M/TDF?=
 =?us-ascii?Q?cpzuoFFNW2bO1tLDPveZVvdWxvJ1tc84P35IXSSiISgd9gA72ZPcdmvktVyJ?=
 =?us-ascii?Q?JkNnkFJCGbU9ulLlcUUlrEBzUeveHJ0Ywqh5HoMFt57bWVlyVZp7oZ6w19sF?=
 =?us-ascii?Q?aB6TXXqmZbLvNyFfXPmjktFjy2vDBR02zo6ANml7PSxRlOqxwJfQcXOSRTqz?=
 =?us-ascii?Q?mYuk8sd5DUqTfV/33eFzo/VWi0AIMb8EbRWiGtarTA5my7cxvQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K761bU+mxKhGjuL9GHL5cjYKVgIeDXGPCX5qL3ceZkzsF40iRA2CpOX1xtLP?=
 =?us-ascii?Q?nzzcSexrrjkiSGVjeijR5GQjvIN0T0JNek4ptgmirVhqJmdqRtQXSDbNwSq5?=
 =?us-ascii?Q?FYBBylghu96JbeUb92qHOor2GA2J+UOsauIsPQcXr6GbRc2Zka1eUum/M1fv?=
 =?us-ascii?Q?7g7M2Zhdckl4LMBkLmdn+0xTf7JhgXkSRaJkR/oLvwL2epWLvwpe3CJXxFnM?=
 =?us-ascii?Q?9TMhYLXLyl/pTNplrHh/n5OGpjo5MTme4bzNHNv7D5mIDvNbh+gaSmgaFjMH?=
 =?us-ascii?Q?mrbr0m0vxrL+WX9pjv2vhGHrY3SDEU93L/NzfnfhPlc4atmvljtFCEMk2YeM?=
 =?us-ascii?Q?K7hE5/TVO7fDL5kKpw8zyopQSVkF8f1UUqQNDt1wpGrBavQXG4AjQfAe3EV3?=
 =?us-ascii?Q?AYEsfBByEgYT23VGoNBtY51MIBaV5rPv6PpXck1NcZ8Q76ZkoRp3pOfwoTyU?=
 =?us-ascii?Q?Jez/IBIMw8Sd+sW5hjJHoBr8o1n8x6YOnh83H+6/s0NFXNOPjhJVrMkzsGIk?=
 =?us-ascii?Q?GAFH0UUV49lW6YxJIxkXAB22+tvfybMymcH4Vt1LVjvSHiIovyi96knDXXcg?=
 =?us-ascii?Q?OyO79bMmdW99kI2e6sMUjSNgnH5RZvqakAwc04x1NwKLur7LAjSiyjnHI8Np?=
 =?us-ascii?Q?x9b/Tl4e0C6camnJN3HPnnnfv/uLQEMwO+cEZA1V0wizvSb9lInPO1fh9gdm?=
 =?us-ascii?Q?GGw/15Exr/ghaR2McJuHKXYq4NzkQD54QEuLYlgsy9YnmQ+I5tjOc/nY/AvE?=
 =?us-ascii?Q?wAfMLCxadEmg6qVqiz8nWghb1bXtB/vo547SdmHM8d+C6kwgljBdg6X43ymL?=
 =?us-ascii?Q?0Ntl20JhhRk90cRBZhBIRTLmjdpeNm282fDoL+ddMUciYKHB+xuYTMyFTCpM?=
 =?us-ascii?Q?WYhywOr27nyT+2ibmZb/uek3LUR+qimX2xZ5TOMTngcLTPQ45HVtL+0LDuTH?=
 =?us-ascii?Q?s298jIKQuXclTf7xICGeT3h0wOLTBuyFkcoZJWGxqN+ky+9BufyxdNBVGi/e?=
 =?us-ascii?Q?4M6c3jkucPaD1qV3k3jeiWwMT2zZI/WCQqHuLStRai1mMWYPCs5l9Dgd2FHa?=
 =?us-ascii?Q?oTkKjdPBIFxDLFA2RVxsbJjFbAE2mPDIXT41NgdwSONx17lQCDIAYz3Nlgg0?=
 =?us-ascii?Q?80iJqI1AzfUSSTJXHIpazavuHBStl0r4Xig/xHxPxUBruaE385C1BCfQwqf+?=
 =?us-ascii?Q?dlCrEbsaDdvZxkj4IJ7ELrgqNl1EZWIudAg1J+N57UGfBoRHCT1erCThHo9J?=
 =?us-ascii?Q?TvRi0xpkIxpl8UAUH7dpogdQbwbMocZGc+9AmfLqgwc750WiOiPCHNkOcTS+?=
 =?us-ascii?Q?uq/DpbOC+k+dRNCVmds9gCXrXghaAPyFYVUAtlwNPiXAFhWW4BxrEwH94hWs?=
 =?us-ascii?Q?LuQz3ZvwBQMSNct+VMDJ/qy0yqGr6FCTyqJ8xSVnuU6+79cbYBF06luDaqm0?=
 =?us-ascii?Q?9+h2nDYGhEx6ZOMxKBF8hbxIoQcYpXwCKB5jFy8qSvjLuxduKUL2iarDzsKU?=
 =?us-ascii?Q?Gh0ELO4C6mW7JqM03hE9HFsxYhyPAkq9aRGD6FmF8oDmrGE6jDrXy9qowVea?=
 =?us-ascii?Q?3TqyV6fWoemw6AEuUMOSQ4suxSVtdtLN11bQuTgRy74lKDzsI3E2OF/y0Uxl?=
 =?us-ascii?Q?TQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LttDKjhXn+piDGMVNaEXLZRbEqzy2jC9pMYZJBwJKXuqTgYl7jsuOswWxOfhIOpxLMot0KX5sTvlIxU309vUmgiJZnsSIsrDpzH3xMB1pAVe/cJW58NK/5qXX2J/r7mr8sbCSQhldJmCkowEGWZfDW8/n4CpG1FYgyqho3jKecyy/6kzCkZeuB2Xh2dzvjpUdJAyprO9hXGlP9ONfquhG1NO2ZEEdhAczUQeHYbBWFgYpJ1OPLmLa18VBpPQG9WW9AnGkRI+/c9vexWzuw0IBBcHkzdjxHgKbu8/Anc6W9D0NAXtZ0QvoeUG/DFS7/lMmWUvlV5Ut//e8ROqMYhF9JeHn1r/+iB4Gh5n8jO0wzxJwFB+BXUBNmY2CmahGv0gaVVgND0RcmIzWDhPvrdiXAMw5JZFm7gDziztYQN/WAYnupRrlBOaahUARdHUcUzExEHKwQWs2sCKSGPkyfK/ThO0J0bT6xzH65e/qKpecI8zDbrFHl9RM6R9lB0M0ubA4pHTydJEI6i7nvj1iHl3GzF2c07RgmAMHZwTWLsovhFrlg7mTKbVRvMCV83PIJIvQlMlpZu5+G4QONkgFNXxBPBbs6S+a7kNUYaaR/rnMFw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7502289d-167e-401d-3386-08dd8ca84d38
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 14:14:23.5223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5IHRtFfe/j4nhk66i1eflaSeYqpQ46xCqUuD/MQJGT8c75jprY7TU5nMMWEQN33VgqpDbW8I5jkUYkaiUpfMFh2yRLkwXrG9/6i89ttr/wk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7969
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505060137
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDEzNyBTYWx0ZWRfXwSchkSeIJLHX CIK4MXGCODXiYMx1c7xUnmxokPNRCajyZrJFRQ284F7Sn54MJxwcJGh19KHloEpwBV2UinS04Zw DFCCWNNGKhFsFdSdZ4RaUp8wRPdIhwGtnh15NR3tTUt29+UM/EcKDo8kHAhvqxKxen9UOPIwjFN
 OIg2xU+nkHJa0nQ0QmyQCEJ5YtMOdQZZ4mh/DeW7kA8cYU5hrb5T7tCB4Hl/q/lReagQunrGiVB epSdDsgRQVwW9Ajy+yrEEPWSMwqb3OLpvj77DN5vpgkkq0XKfv3os6MoVIR5XsF//mOGBb2oWQk T8oCKSTDlfR4Hw7VcIZS74fUGEIMvd9+tFZZwC8F5d1GmWMbuHcYRntgBi/+cI8eoHd/uIr9are
 CT6nkAotXvPfsWyfcBlFvyJPnBWPdIYSfBbyoFejJHbsJ63U+7J6FOSj49sRqfIyRZGi/1Yt
X-Proofpoint-GUID: 8-Bmd0dmDc3ztr0Nt5W_tCQLwo-nufgF
X-Authority-Analysis: v=2.4 cv=crmbk04i c=1 sm=1 tr=0 ts=681a1949 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=7A4OcXqbft8wN_Ln7yEA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 cc=ntf awl=host:13129
X-Proofpoint-ORIG-GUID: 8-Bmd0dmDc3ztr0Nt5W_tCQLwo-nufgF

On Tue, May 06, 2025 at 07:40:49PM +0530, Dev Jain wrote:
>
>
> On 06/05/25 7:19 pm, Lorenzo Stoakes wrote:
> > On Tue, May 06, 2025 at 10:30:56AM +0530, Dev Jain wrote:
> > > Use folio_pte_batch() to optimize move_ptes(). Use get_and_clear_full_ptes()
> > > so as to elide TLBIs on each contig block, which was previously done by
> > > ptep_get_and_clear().
> >
> > No mention of large folios
> >
> > >
> > > Signed-off-by: Dev Jain <dev.jain@arm.com>
> > > ---
> > >   mm/mremap.c | 24 +++++++++++++++++++-----
> > >   1 file changed, 19 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/mm/mremap.c b/mm/mremap.c
> > > index 1a08a7c3b92f..3621c07d8eea 100644
> > > --- a/mm/mremap.c
> > > +++ b/mm/mremap.c
> > > @@ -176,7 +176,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
> > >   	struct vm_area_struct *vma = pmc->old;
> > >   	bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
> > >   	struct mm_struct *mm = vma->vm_mm;
> > > -	pte_t *old_ptep, *new_ptep, pte;
> > > +	pte_t *old_ptep, *new_ptep, old_pte, pte;
> >
> > Obviously given previous comment you know what I'm going to say here :) let's
> > put old_pte, pte in a new decl.
> >
> > >   	pmd_t dummy_pmdval;
> > >   	spinlock_t *old_ptl, *new_ptl;
> > >   	bool force_flush = false;
> > > @@ -185,6 +185,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
> > >   	unsigned long old_end = old_addr + extent;
> > >   	unsigned long len = old_end - old_addr;
> > >   	int err = 0;
> > > +	int nr;
> > >
> > >   	/*
> > >   	 * When need_rmap_locks is true, we take the i_mmap_rwsem and anon_vma
> > > @@ -237,10 +238,14 @@ static int move_ptes(struct pagetable_move_control *pmc,
> > >
> > >   	for (; old_addr < old_end; old_ptep++, old_addr += PAGE_SIZE,
> > >   				   new_ptep++, new_addr += PAGE_SIZE) {
> >
> > Hm this just seems wrong, even if we're dealing with a large folio we're still
> > offsetting by PAGE_SIZE each time and iterating through further sub-pages?
> >
> > Shouldn't we be doing something like += nr and += PAGE_SIZE * nr?
>
> This is embarrassing *facepalm* . The crazy part is that I didn't even
> notice this because I got an optimization due to get_and_clear_full_ptes ->
> the number of TLB flushes reduced, and the loop continued due to pte_none().

Haha don't worry, we've all missed things like this in the past (I know I
have...), this is what code review is for :>)

>
> >
> > Then it'd make sense to initialise nr to 1.
> >
> > Honestly I'd prefer us though to refactor move_ptes() to something like:
> >
> > 	for (; old_addr < old_end; old_ptep++, old_addr += PAGE_SIZE,
> > 				   new_ptep++, new_addr += PAGE_SIZE) {
> > 		pte_t old_pte = ptep_get(old_ptep);
> >
> > 		if (pte_none(old_pte))
> > 			continue;
> >
> > 		move_pte(pmc, vma, old_ptep, old_pte);
> > 	}
> >
> > Declaring this new move_pte() where you can put the rest of the stuff.
> >
> > I'd much rather we do this than add to the mess as-is.
> >
> >
> >
> > > -		if (pte_none(ptep_get(old_ptep)))
> > > +		const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> > > +		int max_nr = (old_end - old_addr) >> PAGE_SHIFT;
> > > +
> > > +		nr = 1;
> > > +		old_pte = ptep_get(old_ptep);
> >
> > You can declare this in the for loop, no need for us to contaminate whole
> > function scope with it.
> >
> > Same with 'nr' in this implementation (though I'd rather you changed it up, see
> > above).
> >
> > > +		if (pte_none(old_pte))
> > >   			continue;
> > >
> > > -		pte = ptep_get_and_clear(mm, old_addr, old_ptep);
> > >   		/*
> > >   		 * If we are remapping a valid PTE, make sure
> > >   		 * to flush TLB before we drop the PTL for the
> > > @@ -252,8 +257,17 @@ static int move_ptes(struct pagetable_move_control *pmc,
> > >   		 * the TLB entry for the old mapping has been
> > >   		 * flushed.
> > >   		 */
> > > -		if (pte_present(pte))
> > > +		if (pte_present(old_pte)) {
> > > +			if ((max_nr != 1) && maybe_contiguous_pte_pfns(old_ptep, old_pte)) {
> > > +				struct folio *folio = vm_normal_folio(vma, old_addr, old_pte);
> > > +
> > > +				if (folio && folio_test_large(folio))
> > > +					nr = folio_pte_batch(folio, old_addr, old_ptep,
> > > +					old_pte, max_nr, fpb_flags, NULL, NULL, NULL);
> >
> > Indentation seems completely broken here? I also hate that we're nesting to this
> > degree? Can we please find a way not to?
> >
> > This function is already a bit of a clogged mess, I'd rather we clean up then
> > add to it.
> >
> > (See above again :)
> >
> >
> > > +			}
> > >   			force_flush = true;
> > > +		}
> > > +		pte = get_and_clear_full_ptes(mm, old_addr, old_ptep, nr, 0);
> > >   		pte = move_pte(pte, old_addr, new_addr);
> > >   		pte = move_soft_dirty_pte(pte);
> > >
> > > @@ -266,7 +280,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
> > >   				else if (is_swap_pte(pte))
> > >   					pte = pte_swp_clear_uffd_wp(pte);
> > >   			}
> > > -			set_pte_at(mm, new_addr, new_ptep, pte);
> > > +			set_ptes(mm, new_addr, new_ptep, pte, nr);
> > >   		}
> > >   	}
> > >
> > > --
> > > 2.30.2
> > >
> >
> > Cheers, Lorenzo
>
