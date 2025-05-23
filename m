Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C9F19BBC
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748022403; cv=fail; b=n+LOhCzhfCMoPiXDIbtjIyn7nJhtIob4jg6mybHGabwmUukdofkNUW6ILgLA+SPxh/wTTSZKsJSLVCTj7EzO7cok50+ZMQHRGoqvxeTIN8LiL/+ibVC4hwUxRTbfz38CGCbUs1mFcCMQm2WSbMgWOSrOXHIUAnu38v1CttTbkuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748022403; c=relaxed/simple;
	bh=nL8k5fG4fyIKBUZKf2spNioZtvsSL7EwwYaLzWFWUBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EFZyB6FTim2z7VFH61u44fUsiV7uNnV/s0VEw5rESyGrmxDwwDGEiHAHR9vKpLiUHc5c5wSW1YOP/kU4eFtLe7vpNqQCFIowYK+SALuz5D9YzenRg8SABcggDXxRlzV/Noc8kvrvs1U5Hs5uWZCic+4fEWJfWGXH6lfe05axE+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=shArc/ib; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZOqXxujP; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="shArc/ib";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZOqXxujP"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NGreXu024547;
	Fri, 23 May 2025 17:46:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=mInt1nurqApVky4wEK3tGgbOXzZ8UiEa7bDUH0wP3CM=; b=
	shArc/ibwF/jUOvyq8hG7KvxWBX8qWt2a8ZggLociTfMWaIxeAeDwa1MUaoxOHF7
	yg3MUrhQN4L2LOU/BneO/ySO5cGA1ciqgjMpYmH/TdmL/WNeVAmvjrrvJDDLnE6Z
	DaRo1QBhEV2Zh7OuFX4oiXdy0clr7QyInqyXz9pkTDDnyVllWotm25Qt5lORSH7t
	fCfDytMLvTM3/gOHLUKIXIEUGtsrGbxSh/0bHkmMOh40dDCbajdhvufCSRTvrvTY
	oB5E9jbZD2mx06WM7ju4Pl0+LoqEn6Hww9pXlCK+FNSaDB91vrcheNYP5mBy4Z2w
	YFblllTQ2XIZfeUKQvjMiw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46tvxdg4dr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 May 2025 17:46:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54NGpNgj034531;
	Fri, 23 May 2025 17:46:16 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11012067.outbound.protection.outlook.com [40.93.200.67])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46rwest63x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 May 2025 17:46:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PUbMV16X6tG2GJXjM9aNNPFdnHcP9hHQtGGw8rFV6MJUFnMAUPnPq+hAjRGsXFU6DRoduLAjQ2PrO5tYCx4rNlfCuhzA3fZ75jgm3wAh9AvfcX35aBevAdzzARe77yLxwA3o+yiusLe4ywNkXqtaDG7pA1JWFuOb6W9gAG4D1cyAHDBdeSQPYFWAXVYjED8hM8V9RBJA3OkoVS1+r6KJT5rzgr/Rbb6jjukZuU9lUvlog2o1oz1GsDvD8oNUPWr5uOlsvnHV9uAXkB/sMaENpwAS3zYsOeEEmszx3c8Sr63V8vwlcutWCQ/C3UVTgNcbAFU8JLwG2JyyfC26mJ0I1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mInt1nurqApVky4wEK3tGgbOXzZ8UiEa7bDUH0wP3CM=;
 b=paDwDnPx9FZyCasBhImjmtdtX4Gxz1T5d1GUjS2KcWD2KzoxTyykRuL+QDYjGY0Cbd/hI4tp0mYi/TlLxVAouVr6orYe/CLHCeXHxq8b7Jox6uMrUecw2cntMARSIHdBR+cK0wgZHjaInmLr+lBOFYGxGyBuIpCUzCHrQLkuEUDV3O95K3QKSHTFXkOCLKZAyVKOcyK+QzYaWEiJgGtjMIIpDRGSfF1mSnyd+mCfvdPa6eYwL1JuTWhfSYwQi0eJo43/LsaW8vO5/yNU1Qw6kJVaQgPvkVWSYHbxrYC8L+KYolERVts3Lv9QioyzQvltAfZMzdDPQ0Df6pFTXcnkCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mInt1nurqApVky4wEK3tGgbOXzZ8UiEa7bDUH0wP3CM=;
 b=ZOqXxujPXzkl7r988m3Oa4Ku49J5Y5PFIyoIa4Jfvku+9OE1WoWEg8cPlC57YkZEgQicpy0kj7QD6dRGrWXNRi43v7KKzTKuf4TnhGmEZ5R+0HT565jwJ5SYO8jFuibiUYYIIjNkXPNb7NSDMYnWOCAiPzbIeIFuhOkKUaC5ZWQ=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by IA0PR10MB7276.namprd10.prod.outlook.com (2603:10b6:208:3dc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Fri, 23 May
 2025 17:46:13 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 17:46:13 +0000
Date: Fri, 23 May 2025 13:45:47 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Ricardo =?utf-8?Q?Ca=C3=B1uelo?= Navarro <rcn@igalia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        Pedro Falcato <pfalcato@suse.de>, revest@google.com,
        kernel-dev@igalia.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH v2] mm: fix copy_vma() error handling for hugetlb mappings
Message-ID: <fs2zd6syrdpyrsqkfmzjjz3y3rricscyr3bnx5trnr6p5nbhmy@l6zyiaccoknt>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Ricardo =?utf-8?Q?Ca=C3=B1uelo?= Navarro <rcn@igalia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, revest@google.com, kernel-dev@igalia.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Oscar Salvador <osalvador@suse.de>
References: <20250523-warning_in_page_counter_cancel-v2-1-b6df1a8cfefd@igalia.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250523-warning_in_page_counter_cancel-v2-1-b6df1a8cfefd@igalia.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YTBP288CA0027.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::40) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|IA0PR10MB7276:EE_
X-MS-Office365-Filtering-Correlation-Id: a626296d-dd60-46d2-901c-08dd9a21b5fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?Wk7yX7EkYH11VCfZWP3Yec4NBfZuXcdAg2/7a/BjMGeWMNHOB29bZmUUxE?=
 =?iso-8859-1?Q?/ENtU7wqZ63AIfDXe4QG1Se7k/MfxHmyUMmSKaRr45zmPordE7DV1KOdZl?=
 =?iso-8859-1?Q?MctJQQ5YV197ijn2Soc5q9BmLMpADScuDJxc9Nfcloypz7HlpTClxxdARU?=
 =?iso-8859-1?Q?BQWQ3apv07vp0JjARhsKIKwT9hlYglPn+x8hOEbRbbJUVuM6EsYv5dogVq?=
 =?iso-8859-1?Q?jiz5DhHqyVugcerRUCaY1PUPB/uXW7PxS16vCuNnUu/llzrZXvDFt4WpRw?=
 =?iso-8859-1?Q?r35WUxjN9sSUXlAC+2LG+YSHtLmraby9mik4nk+LqTB/tKxWkUyZMDZq7C?=
 =?iso-8859-1?Q?pIZ1XakWy/hJEVz9vHmNaac0OORx4idDZ4BEiaERZKM21Wh+xgPsvqj0cX?=
 =?iso-8859-1?Q?P90+p37zmie/YlyOzMw7ImQsm2XK3r60DB9SMAHjLucdEPO6BL3+IPpy4f?=
 =?iso-8859-1?Q?cUqjj3T5mmQUHb4N5ndbtiWEDBstBUNkaz+Er9U+38BMGWFZ5hbssUit8C?=
 =?iso-8859-1?Q?wqwphsgUGN3TL2qOwh+pyydcWAkiI1AAXmZYy493ph3Ji9A+RYcXq7U/Pr?=
 =?iso-8859-1?Q?xJfG1AYw0BFCcC9xtSivXINaPHkesFJqgg95lSrh35/TzCTPSTR8fYCEB9?=
 =?iso-8859-1?Q?fEUkqQTn7MVs/0jmBq18vi5mfu1tGzx0waOwAi42Odv4uHXU1z5pnzCfty?=
 =?iso-8859-1?Q?J847D3Ni6ctitiM5QfBOYDHZeeJfRPEiv2eIf93GZC80KrKvGq6QtPQZvI?=
 =?iso-8859-1?Q?kRj+iBIQpclGIHoVZpf2th/43vALj0OssWt7VWjo0zuiUx0C+BHQkrlH/4?=
 =?iso-8859-1?Q?nsg81eTlJsMUbHkrHe9EuxcEwPeGhKNf0nwXiTagiHgRN7Q4Uc6uApIY0L?=
 =?iso-8859-1?Q?6tcLgkXfwmmESJzSvNJzQUU3N4Fe0DjQkpDRz6klzFsOxkjU3Q16aD8uIG?=
 =?iso-8859-1?Q?UHwlLTfTiK0DAGd+u4ypFgDJ1XEZreb73NzUY1ZUfQIuUpgMrUSuMFj6j7?=
 =?iso-8859-1?Q?FlcpMXZrwUlToWqTCKRRq3JaWHsggck7ZBP8zSQwscAoH3WUuHRg502p0E?=
 =?iso-8859-1?Q?oecscm0aecrzoqhSkukasBKLIsNCjgoYuSTKey3ulkyxhgsFWRaERQz1lo?=
 =?iso-8859-1?Q?5XZFDC3wWqSuwsJebxpl/kEsmPMaRzuDJvlR7KJGn7oiTCROrkrprlpOEw?=
 =?iso-8859-1?Q?2tLSFkNDVI++aTTwtEeGtWUsCMmnZFkaKetiyQLqfVJrpNc0b5wldCoYNW?=
 =?iso-8859-1?Q?Q9dziHsS0qsmChrI+cuq2e92t/YOf9lDGJAJwcpNojDa7ekkuMUEjSTdtD?=
 =?iso-8859-1?Q?LNYbJladmfUROPjNwHpIofzIs2tlcmuCj7LQpOBwJyK56nkWEtJRcYhB3O?=
 =?iso-8859-1?Q?c/shLJxRse9s2Fy113I3+svymF1ocUjauGifqeXU6CJlpREEjy3Xn0QGWL?=
 =?iso-8859-1?Q?cAM0eDnaH3kdQlYD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?2URYKh8BaHYVDuoTW9uaI4FYltF/G06rT0h2vRl39FJupkfM7N1OjLvMJc?=
 =?iso-8859-1?Q?mlhmTUA1/qlaWtgnIaoeglcTXT3SOTN1Kn1t3N4DZOR/1ATtzBbUWTCzwc?=
 =?iso-8859-1?Q?z/wjKiDpDREIBqKpLt8J7RkAbz2ozax6iUCDngUDxsVCzdB38SBwXwdXxo?=
 =?iso-8859-1?Q?B3HzXqO2XUi3fp6eItgwH3iosg8oSDxn/sFTCgEoyS1QR4zQdc0vdgEB7N?=
 =?iso-8859-1?Q?posAKQoCUdcfxV6lPK6khaFThsG5SdoitLbvt0SwYuQsD3Zkjc2tmsFgHO?=
 =?iso-8859-1?Q?jqZWowaErbI91bQA/ToMPB1vfwSilndjueFWqHKQJbnH6oNcq4OdshW+op?=
 =?iso-8859-1?Q?8NToNTT0uQPM/lLpcSk7nDqiqopePUjIp/qa91x09O6SdBPx3bIHaOxFDv?=
 =?iso-8859-1?Q?KSqhr+MpI9TyEFuQkIQ1BpPkfp1iS+ZSSgla/cclZ3UcCXba4HczEG2+US?=
 =?iso-8859-1?Q?kueQ5mT/7HJzhZJpn84rbU+h2v4DqHHxVkyENMyE8nhH4swHMh+qGWNs8N?=
 =?iso-8859-1?Q?w3SRll8/Gy+itHJPcXS9GjAqYoLkTYO4KUZUHGlYiL2gYbuB14hvX47SrN?=
 =?iso-8859-1?Q?3ZzCihv3IXSwbD0SyTN/tV1JV3K4o0VVvl40SBkjfv/1reksl31/ILuVNJ?=
 =?iso-8859-1?Q?/qcyp+46AgFNcAEXoDPoxCUdBRMaNWnYLdPquDH2839NMGLsCOM9m5J6XW?=
 =?iso-8859-1?Q?Zw4hk+HdYKToq0Gnm0y3hNIQwLxsogKKW+UXfapogz/Bb+R/y9SANCkVDE?=
 =?iso-8859-1?Q?DDe8DdqmJ3U1kwW4QWrZAsa1aoyFf1CGIWPapK6ZUi1wviEDnASr6/cvn7?=
 =?iso-8859-1?Q?zGe7BrqadSjyYqgxUY6w+JXjgeUDCreddNcixOd2heocfQrBUW9Apek/zF?=
 =?iso-8859-1?Q?bZTEs6cBLU5fJDiIxcvOEileMs/MTdZE3ggXY+vP2Nkoj4tpTE8dV4Q7de?=
 =?iso-8859-1?Q?5ADmSyWIMQnf5Df2N7ruxRute8XflgEUCIqQO1WfJwoIrh4KXdOufehw1l?=
 =?iso-8859-1?Q?aaTpVCd0M9BNKl+5ivSD57JkLiWyeK7HFvDJybjAi6+rGrgqlfXvHjnJ4g?=
 =?iso-8859-1?Q?UOBv1cp9AVGeF2MOKb4Fwows/yNX3la8MWPwfBWrugrE/d+oOCCJpMm0Sy?=
 =?iso-8859-1?Q?IiQtyoE+FmBL5IcgowpwUqMIsNXI6tXLL23AH2XVftA9gSzYhOwT8AmiAA?=
 =?iso-8859-1?Q?7dyfRQnKYOqFpC8/P9M5tTIRMun5bhSPHAbkMhoBhNqStZW6hDtNBAA2xw?=
 =?iso-8859-1?Q?0ilxpjm7rj/DA729AA0p7bpLrbJuUCKfVkJMw2qMIt6YfsNr4qRhr+oK8S?=
 =?iso-8859-1?Q?sqh2CS1cLeXb+L0qousUtFwtl8tZGLPJYmXoHa93V3uNOYMj50quTC6c5j?=
 =?iso-8859-1?Q?50O9WG4/Ij8kGgWU7+BJCG+WfHunmnuRgAz7715GEwuG9+Qw8fxZe/qlP2?=
 =?iso-8859-1?Q?OoP+Uv37q0KJVk13Hy6dBeAk9v0R2NHi+bbLng6DOEP23BVoBQ38e7pIni?=
 =?iso-8859-1?Q?O+F9lyt80HqZ+m9yxQXM34KE4XrwdCTwNrb6DPdG1oGygOcD44awYpRaJX?=
 =?iso-8859-1?Q?uLtlmLNEGhb8brgy2wfFfXUxRrR4HxHGm7sGymuLz54QgnYk3x6Nx+CF9z?=
 =?iso-8859-1?Q?vZggcgcenpEr8TVEZS34JW7JLWRt85XvKb?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VcIHDHbItmlR/1OlhHlImiBBNXmzRYR3mtCx9ck4DIOBFmz+iDlz83YYbXQ+XTOLUlAiIc9OLBgYe0DwT7oeGub54wnH1Rm9cxDf2DGp7IF+9BZ0fjUEdVm2hWX6WnT6kv2II+9r4hyAbYl2BOIjSL5FME0baFXwfi2FnZCqcLAO1sFQM96MD9Mdj9v7deFhJVioj7UG5BXQ5CA+43MWqM2DiplU4TsNXb2Md3PQQX+t2bI1YPWXtT55HbbCpzHPLqHsluyews76gobs9SasMv7OMBS0IpoGOO1SGF/VkBbCX2GLRE3Rbc/UbBeXRDQsSmPI8L4o7bIr55PA9tfXgXRVU5ygQIv1Q5hMfzrdg0ED9nmpwUWTFYwQi9SOSKP1uf80XRg7983tSe5VXQ5pWEDCAogOgCjQQQYIkcG1A9z4oRl81BM4snOsEoPc7tBp8CW5auXullLzFu8yZlepDYY39zCKW30XlNU4mBT4JA8kSV5Gc7rBpYb2iHKbhzxfwgLOpqU4Q/ax/ptPj6b0PpKC5xczzFuZPSvYi2ebctFyKu5SGjPcSw8BqHN7G0tQCg3xfpNXvbGOSvEEf/xGvSn2wuCv+AftudUrO7uzuCs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a626296d-dd60-46d2-901c-08dd9a21b5fa
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 17:46:13.6529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MpdGDd0/M1O3L9umI6iVFE0FalWb5f/bix3u60cqwkHpLCua2Mo1AlzVB4qHa4g4iSpynMeroYqQZ/4WanZgJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7276
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505230161
X-Proofpoint-GUID: OJS0FjF3V2CIkmI6NB5SDHjw-c21DI_Q
X-Authority-Analysis: v=2.4 cv=WdoMa1hX c=1 sm=1 tr=0 ts=6830b469 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=V2sgnzSHAAAA:8 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=ID6ng7r3AAAA:8 a=yPCof4ZbAAAA:8 a=R-MHEow0R-kqRniyxSUA:9 a=wPNLvfGTeEIA:10
 a=Z31ocT7rh6aUJxSkT1EX:22 a=AkheI1RvQwOzcTXhi5f4:22 cc=ntf awl=host:13206
X-Proofpoint-ORIG-GUID: OJS0FjF3V2CIkmI6NB5SDHjw-c21DI_Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE2MSBTYWx0ZWRfXy8pd0JOdxR5E GwUJsN7e6MBkX9zm0KmRxK0Nn90q1rSVWtnnO1ZPFacMDB2LwYcUHDszAql6KfbuUfz5vaYFM/0 jjZcmPQRKVc6Nagb5/Kbnlo/ZNlOJZnkjV6c89EmQeiCR+ZtHC+q9OxuntN32abVs2si1cS2jj0
 2Z/ZWA1ySGL0hUAiHFNAwePVrtAq25nafOkUQcjnw7PFciZ5p96R1pEa/5j3jW52LS1W/x0f2tZ uTlKD1sn/1+SQQdMws1byBvt7ihgk2eIqP+VRVGYrCm9c5d1lOiNc0LnaANrZQuOaa7ut6ty2oY sFtaXSDWl5Tugbm7wfHznlX+Wai2AIYn7qQaameR+eC3fL9JxwzWtEeTz6P/udB44DgY9EDlxAU
 fQa+26h5+x712xmcDeSC/gWkqa9sEpCUczAzUoowWRjal5R08AZlSxPWfcQupu615uUEPXof

* Ricardo Ca=F1uelo Navarro <rcn@igalia.com> [250523 08:19]:
> If, during a mremap() operation for a hugetlb-backed memory mapping,
> copy_vma() fails after the source vma has been duplicated and
> opened (ie. vma_link() fails), the error is handled by closing the new
> vma. This updates the hugetlbfs reservation counter of the reservation
> map which at this point is referenced by both the source vma and the new
> copy. As a result, once the new vma has been freed and copy_vma()
> returns, the reservation counter for the source vma will be incorrect.
>=20
> This patch addresses this corner case by clearing the hugetlb private
> page reservation reference for the new vma and decrementing the
> reference before closing the vma, so that vma_close() won't update the
> reservation counter. This is also what copy_vma_and_data() does with the
> source vma if copy_vma() succeeds, so a helper function has been added
> to do the fixup in both functions.
>=20
> The issue was reported by a private syzbot instance and can be
> reproduced using the C reproducer in [1]. It's also a possible duplicate
> of public syzbot report [2]. The WARNING report is:
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> page_counter underflow: -1024 nr_pages=3D1024
> WARNING: CPU: 0 PID: 3287 at mm/page_counter.c:61 page_counter_cancel+0xf=
6/0x120
> Modules linked in:
> CPU: 0 UID: 0 PID: 3287 Comm: repro__WARNING_ Not tainted 6.15.0-rc7+ #54=
 NONE
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.3-2-gc1=
3ff2cd-prebuilt.qemu.org 04/01/2014
> RIP: 0010:page_counter_cancel+0xf6/0x120
> Code: ff 5b 41 5e 41 5f 5d c3 cc cc cc cc e8 f3 4f 8f ff c6 05 64 01 27 0=
6 01 48 c7 c7 60 15 f8 85 48 89 de 4c 89 fa e8 2a a7 51 ff <0f> 0b e9 66 ff=
 ff ff 44 89 f9 80 e1 07 38 c1 7c 9d 4c 81
> RSP: 0018:ffffc900025df6a0 EFLAGS: 00010246
> RAX: 2edfc409ebb44e00 RBX: fffffffffffffc00 RCX: ffff8880155f0000
> RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
> RBP: dffffc0000000000 R08: ffffffff81c4a23c R09: 1ffff1100330482a
> R10: dffffc0000000000 R11: ffffed100330482b R12: 0000000000000000
> R13: ffff888058a882c0 R14: ffff888058a882c0 R15: 0000000000000400
> FS:  0000000000000000(0000) GS:ffff88808fc53000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00000000004b33e0 CR3: 00000000076d6000 CR4: 00000000000006f0
> Call Trace:
>  <TASK>
>  page_counter_uncharge+0x33/0x80
>  hugetlb_cgroup_uncharge_counter+0xcb/0x120
>  hugetlb_vm_op_close+0x579/0x960
>  ? __pfx_hugetlb_vm_op_close+0x10/0x10
>  remove_vma+0x88/0x130
>  exit_mmap+0x71e/0xe00
>  ? __pfx_exit_mmap+0x10/0x10
>  ? __mutex_unlock_slowpath+0x22e/0x7f0
>  ? __pfx_exit_aio+0x10/0x10
>  ? __up_read+0x256/0x690
>  ? uprobe_clear_state+0x274/0x290
>  ? mm_update_next_owner+0xa9/0x810
>  __mmput+0xc9/0x370
>  exit_mm+0x203/0x2f0
>  ? __pfx_exit_mm+0x10/0x10
>  ? taskstats_exit+0x32b/0xa60
>  do_exit+0x921/0x2740
>  ? do_raw_spin_lock+0x155/0x3b0
>  ? __pfx_do_exit+0x10/0x10
>  ? __pfx_do_raw_spin_lock+0x10/0x10
>  ? _raw_spin_lock_irq+0xc5/0x100
>  do_group_exit+0x20c/0x2c0
>  get_signal+0x168c/0x1720
>  ? __pfx_get_signal+0x10/0x10
>  ? schedule+0x165/0x360
>  arch_do_signal_or_restart+0x8e/0x7d0
>  ? __pfx_arch_do_signal_or_restart+0x10/0x10
>  ? __pfx___se_sys_futex+0x10/0x10
>  syscall_exit_to_user_mode+0xb8/0x2c0
>  do_syscall_64+0x75/0x120
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> RIP: 0033:0x422dcd
> Code: Unable to access opcode bytes at 0x422da3.
> RSP: 002b:00007ff266cdb208 EFLAGS: 00000246 ORIG_RAX: 00000000000000ca
> RAX: 0000000000000001 RBX: 00007ff266cdbcdc RCX: 0000000000422dcd
> RDX: 00000000000f4240 RSI: 0000000000000081 RDI: 00000000004c7bec
> RBP: 00007ff266cdb220 R08: 203a6362696c6720 R09: 203a6362696c6720
> R10: 0000200000c00000 R11: 0000000000000246 R12: ffffffffffffffd0
> R13: 0000000000000002 R14: 00007ffe1cb5f520 R15: 00007ff266cbb000
>  </TASK>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Signed-off-by: Ricardo Ca=F1uelo Navarro <rcn@igalia.com>
> Suggested-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Link: https://people.igalia.com/rcn/kernel_logs/20250422__WARNING_in_page=
_counter_cancel__repro.c [1]
> Link: https://lore.kernel.org/all/67000a50.050a0220.49194.048d.GAE@google=
.com/ [2]

I don't like the fixup_ names, but not enough to hold this up (or look
at it again..). I also don't love the idea of moving a hugetlb..

This isn't the only call path for vma_link() that doesn't unwind the
hugetlb case correctly, but probably the only one that may need it.. I
would hope special mappings or __bprm_mm_init() wouldn't result in
hugetlbs.

This seems sufficient until syzbot figures a way into those insane
ideas.

One small nit below, but thanks for this.

Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>


> ---
> Changes in v2 (suggested by Lorenzo):
> - Move the fix to a separate function and use it on copy_vma() and
>   copy_vma_and_data().
> - Paste the WARNING output in the commit message and remove the link.
> - Update the comment in clear_vma_resv_huge_pages().
> - Link to v1: https://lore.kernel.org/r/20250523-warning_in_page_counter_=
cancel-v1-1-b221eb61a402@igalia.com
> ---
>  include/linux/hugetlb.h |  5 +++++
>  mm/hugetlb.c            | 16 +++++++++++++++-
>  mm/mremap.c             |  3 +--
>  mm/vma.c                |  1 +
>  4 files changed, 22 insertions(+), 3 deletions(-)
>=20
> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> index 8f3ac832ee7f3894e1445fe7cfa657f3844a62b2..4861a7e304bbf4bd588e41754=
af63b23af037a60 100644
> --- a/include/linux/hugetlb.h
> +++ b/include/linux/hugetlb.h
> @@ -275,6 +275,7 @@ long hugetlb_change_protection(struct vm_area_struct =
*vma,
>  bool is_hugetlb_entry_migration(pte_t pte);
>  bool is_hugetlb_entry_hwpoisoned(pte_t pte);
>  void hugetlb_unshare_all_pmds(struct vm_area_struct *vma);
> +void fixup_hugetlb_reservations(struct vm_area_struct *vma);
> =20
>  #else /* !CONFIG_HUGETLB_PAGE */
> =20
> @@ -468,6 +469,10 @@ static inline vm_fault_t hugetlb_fault(struct mm_str=
uct *mm,
> =20
>  static inline void hugetlb_unshare_all_pmds(struct vm_area_struct *vma) =
{ }
> =20
> +static inline void fixup_hugetlb_reservations(struct vm_area_struct *vma=
)
> +{
> +}
> +
>  #endif /* !CONFIG_HUGETLB_PAGE */
> =20
>  #ifndef pgd_write
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 7ae38bfb9096c4b610bc2e723c6c08d826c68830..757c5187d65ea3f158cd0c3dc=
1106ce3890c6dff 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -1250,7 +1250,7 @@ void hugetlb_dup_vma_private(struct vm_area_struct =
*vma)
>  /*
>   * Reset and decrement one ref on hugepage private reservation.
>   * Called with mm->mmap_lock writer semaphore held.
> - * This function should be only used by move_vma() and operate on
> + * This function should be only used by mremap and operate on

nit: mremap(), do you need the ()? (is it literally this function or the
call path?)

>   * same sized vma. It should never come here with last ref on the
>   * reservation.
>   */
> @@ -7931,3 +7931,17 @@ void hugetlb_unshare_all_pmds(struct vm_area_struc=
t *vma)
>  	hugetlb_unshare_pmds(vma, ALIGN(vma->vm_start, PUD_SIZE),
>  			ALIGN_DOWN(vma->vm_end, PUD_SIZE));
>  }
> +
> +/*
> + * For hugetlb, mremap() is an odd edge case - while the VMA copying is
> + * performed, we permit both the old and new VMAs to reference the same
> + * reservation.
> + *
> + * We fix this up after the operation succeeds, or if a newly allocated =
VMA
> + * is closed as a result of a failure to allocate memory.
> + */
> +void fixup_hugetlb_reservations(struct vm_area_struct *vma)
> +{
> +	if (is_vm_hugetlb_page(vma))
> +		clear_vma_resv_huge_pages(vma);
> +}
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 7db9da609c84f0a0efe7ee86f7b42b8e0eee6380..0d4948b720e22e6c77123707d=
5199401aaf5d661 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -1188,8 +1188,7 @@ static int copy_vma_and_data(struct vma_remap_struc=
t *vrm,
>  		mremap_userfaultfd_prep(new_vma, vrm->uf);
>  	}
> =20
> -	if (is_vm_hugetlb_page(vma))
> -		clear_vma_resv_huge_pages(vma);
> +	fixup_hugetlb_reservations(vma);
> =20
>  	/* Tell pfnmap has moved from this vma */
>  	if (unlikely(vma->vm_flags & VM_PFNMAP))
> diff --git a/mm/vma.c b/mm/vma.c
> index 839d12f02c885d3338d8d233583eb302d82bb80b..a468d4c29c0cd4141657a3b32=
1f5da2871708bdf 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -1834,6 +1834,7 @@ struct vm_area_struct *copy_vma(struct vm_area_stru=
ct **vmap,
>  	return new_vma;
> =20
>  out_vma_link:
> +	fixup_hugetlb_reservations(new_vma);
>  	vma_close(new_vma);
> =20
>  	if (new_vma->vm_file)
>=20
> ---
> base-commit: 94305e83eccb3120c921cd3a015cd74731140bac
> change-id: 20250523-warning_in_page_counter_cancel-e8c71a6b4c88
>=20
>=20
