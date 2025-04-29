Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012032.outbound.protection.outlook.com [40.107.75.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AFB21CC43
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745912938; cv=fail; b=WUxCMX6Gdh4/+F6jdWoEsGyYjNx48fwsDZeXHtbchmAshGb/SdKBoDX7er95rF/g+yJcGaUDJA/aVMkrDGaAzxVMfrPbakTy9DEsU7ZBqMDpcmCvFnaQc7/mmebk7kP7ARJUF1KIjJzAr4are0+bzdakHcnkIXq9MtXWbiVVr8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745912938; c=relaxed/simple;
	bh=XVeEr/oe0hVJYrNN323sd33tpF1gKEC61pFwCUnjBYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EACP6HeNth7iBr+7nsVZ5ALQnIY5Vvj+SXG7qVrn2Bjf55n4+KuM/Mdk5R1glzaZqzUTeedgKRtImckdKdah3wQXpZn4S/l49ThyOyLtKFO2EqxRj3FesHBl+PBHiGg5sPh7x0GDbKR9oIEz4NpmQYiXtFEeaDT6ZtneQFjzcLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oppo.com; spf=pass smtp.mailfrom=oppo.com; dkim=pass (1024-bit key) header.d=oppo.com header.i=@oppo.com header.b=RhU+YUX6; arc=fail smtp.client-ip=40.107.75.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oppo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oppo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oppo.com header.i=@oppo.com header.b="RhU+YUX6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BLlYcxBe+EOsg8eJuUuP7f3z2nxZFF6oIygKMKjn0Oaygl3rBX45LlSmjPEr/wt5c7KfMZs4v+u60PkgoDympvkv9v6sfewe5JKLrJ07/O/GvCv1avAS93WSyBE5HzlxVBqdER6K7nbRqYd4wM6vxPETJ6oB/koNpI1mz3dEELq6deCx/QuqzxCsWNw04y5Yc8hsfs0lx0KHY1auLaasLLIECFQaBovvBS3sj9scH2pFYV4RBi96oW4ry7ydhlMDPke3A6cyPHsfgQI10MQ6nJGT1fjIjp0dPljmjCzyiuamcM/sDfU5TtwtY1J+GrDFf+EGfsj4ynlhT1jEC1PA4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62N9BMBL2XezM2COpIpvRbFjk/ODMn9tCvBtY6KBwto=;
 b=QjNr9dTlfdSmP+97qdPcWOjmrgUJnrf7ZbjApI0vv3I9kpUKKH7V8fyLz1fOYEHf02cx81D2dykKw1wAOYxLe8j0PXBc8nMgHwtuAfTXAj0sVy3djZUJnmdHhgpRSijXadaQb2lG8+/B+ijf9nBA87QuISjoDL0ZlgUrDeP1GL2o8QMDUFFygWfQzqAJaHDnQ2Q6pTX3J7ctpKhNfL7qc7SkCsNf0DH/1TUg8UvhNRJRIY6ieUxu5ZEDLmvS2tqwEXRAEktfVSuJ1JCtt/kWDWXs27x1yEOW6WmF2D334OXXvKmY9SQbaceaXddwZ+eC2RTL9e8g+V3zkdfG1X9tdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 58.252.5.68) smtp.rcpttodomain=oracle.com smtp.mailfrom=oppo.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=oppo.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=62N9BMBL2XezM2COpIpvRbFjk/ODMn9tCvBtY6KBwto=;
 b=RhU+YUX6VZwCAUK4aGXpvGMOak/s/lQd3WQdDKZf864wRk3ATJqDjGShzOLImNyv1v+9tFNuY8N8WNaVpYyuk/sQRbVdbrpuVR0ZI3THY+PjkTb7I7mIQhi/wqQFC+vIRd4kY6iP1lP9wMg2hsmS/XMgq9SuK5w+QEJYD4e/5/Q=
Received: from SI2PR02CA0022.apcprd02.prod.outlook.com (2603:1096:4:195::23)
 by TY1PPF0A1E09BC5.apcprd02.prod.outlook.com (2603:1096:408::947) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 07:48:49 +0000
Received: from SG2PEPF000B66CC.apcprd03.prod.outlook.com
 (2603:1096:4:195:cafe::74) by SI2PR02CA0022.outlook.office365.com
 (2603:1096:4:195::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Tue,
 29 Apr 2025 07:48:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 58.252.5.68)
 smtp.mailfrom=oppo.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=oppo.com;
Received-SPF: Pass (protection.outlook.com: domain of oppo.com designates
 58.252.5.68 as permitted sender) receiver=protection.outlook.com;
 client-ip=58.252.5.68; helo=mail.oppo.com; pr=C
Received: from mail.oppo.com (58.252.5.68) by
 SG2PEPF000B66CC.mail.protection.outlook.com (10.167.240.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.33 via Frontend Transport; Tue, 29 Apr 2025 07:48:49 +0000
Received: from [127.0.0.1] (172.16.40.118) by mailappw31.adc.com
 (172.16.56.198) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 15:48:48 +0800
Message-ID: <de327c4e-67c6-4e7e-a40d-bc0e936de17d@oppo.com>
Date: Tue, 29 Apr 2025 15:48:43 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v6.6] maple_tree: Fix MA_STATE_PREALLOC flag in
 mas_preallocate()
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
CC: <maple-tree@lists.infradead.org>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, Zhaoyang Huang <zhaoyang.huang@unisoc.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Suren Baghdasaryan
	<surenb@google.com>, "zhangpeng . 00 @ bytedance . com"
	<zhangpeng.00@bytedance.com>, Steve Kang <Steve.Kang@unisoc.com>, Matthew
 Wilcox <willy@infradead.org>, Sidhartha Kumar <sidhartha.kumar@oracle.com>
References: <20250429014754.1479118-1-Liam.Howlett@oracle.com>
Content-Language: en-US
From: Hailong Liu <hailong.liu@oppo.com>
In-Reply-To: <20250429014754.1479118-1-Liam.Howlett@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: mailappw30.adc.com (172.16.56.197) To mailappw31.adc.com
 (172.16.56.198)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CC:EE_|TY1PPF0A1E09BC5:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e75dcd2-12bc-48b9-1ff8-08dd86f2473e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YWlzOHJrZVB2OXE3dmh2aCtHd0JxSjlIY3FMMGNzM3AyMEN6S2pSU0xtWExi?=
 =?utf-8?B?MDJDZFVuK2RySHBrOUlQQnh6NE5BTFZobXNKaWQwZkJWd0FzdTNSUVJVeWZB?=
 =?utf-8?B?c1NFQ3FIN1NXZnVCZVZtTC84VjcwWWpnVUNONGhkVnpsUThNcVhuOEVTeHRG?=
 =?utf-8?B?K2xvbGVtaFhnSy9USGtOL2pZSytRYUZtNGZWSFNzMlhzT1UvQXlZK2FlNFNW?=
 =?utf-8?B?RnVYRk1BNGp3YlgrZElQRlF4RXVuSTZoZlhvaE5nOS8reXNjZXBjV3NWQS9o?=
 =?utf-8?B?MDdlS0Mya3Z3YTFkcXBENXk4QXptMmxKWGlwUmRQcVJGMkZiVHVQNTNRSWQz?=
 =?utf-8?B?cWJNSTFBUTNWcmZNbWZQdmZ6ZGd0b2x0NTFMd2lwRkJrZjlDR1hWSk50Mjlo?=
 =?utf-8?B?dmZvbFNPY1JTdUtMUzdtd296S0duMG1GUzlWN2FNWkduM1NuRUNXZTJTWXZ3?=
 =?utf-8?B?Vyt3d0VnN1ZjbFU2NWNDbkpSODFFakxoSG5xNzJhQmN4N2VWT3c2RkQra1g0?=
 =?utf-8?B?bW15aFlPby9tc1hic2JVamFUd3NUbGN2SmJNbU1GM0JCdTBCL0NWVUZVYUI1?=
 =?utf-8?B?MWNpeEJwUjZBZXZ4QUY5ZXhzcjlFSEV3Vjd2UXJTZmdNSjUvQTJGa3BzY2hl?=
 =?utf-8?B?cTFJZ3VkSzlJbXZHMW15TGRMZitYQzlrWVRSRTZWdE1ObGhGbS9ud1RaWGgw?=
 =?utf-8?B?TEpwaXJyVjhCMVA3b3JvWHV1N2J2bUhTY0ZYMVNHTnhCanZkSDI5SnRQS2t3?=
 =?utf-8?B?UTlIcWd4Q3ZzUGlqRDB5L3duODZ4RTdqbCtib3c5ektXd3BNbks0clhxemJX?=
 =?utf-8?B?S1FHQktFM0dnUXpxcnJpeHNwMGQ0aExITWthZWpyQy92eUNPb3hRa0ZtaFdk?=
 =?utf-8?B?Q2c1bVhmcndFQk5PSCtWdStUZm9NRE05MDVodm9salJkY20xeHR6QUNURzlG?=
 =?utf-8?B?SXgzVUJOOVdUU2d1aFFCY2ZCdjdLMHVmNHNNOHdpY3k2NTFIR3pqMXhrc0E3?=
 =?utf-8?B?WnBFY3VjZUFOK0ZCSmR4OVY3NzkzcityV2huUis0QW1KNVo3SVZuZkVmN0xs?=
 =?utf-8?B?SThIMTFqeTZ2UW5USHZlL01tNUhJT1JkMTZEWTMyU2lVcHg1WmJ6OXkyZysr?=
 =?utf-8?B?RTREdHJYOVp5ckRiR1crZ3lyU2Z6OHEybTQxZHlzdVJWUDRUWFNYU1lPN2JI?=
 =?utf-8?B?TG1XLzkvb205VmRKOWxGL0Q0T215dTNQd1V4K2o0NzZtcC9oVjRNMGhUMVdK?=
 =?utf-8?B?TzEvT1JyczEvVmJodVpWWHRwdldyRmRMN0ZFam5yVXdUcWIxeHZGNjVaTmdr?=
 =?utf-8?B?SzZwY2VKbGhCaWovMWtveGdtZUZtL0R6RHpta21lSE5uRU44TG9jdnhVbFcr?=
 =?utf-8?B?ZXp3dm5FbHVwNHlqbkVpMVBBREZUZ1RLSVRGa3JzRnFHcEVYaDIwdnBkWnMz?=
 =?utf-8?B?ZmNCQlRBUDJVNHFaUkhLTXRmd2Z2TFFIa0hnWk41LzFhY1l4MTlsOG51RFB3?=
 =?utf-8?B?Z0hlandpVWFsaCs1UFV1dWs1bHRLaHJUZVhUQzYyMnk4Tmk1U0puU0xVN0hM?=
 =?utf-8?B?NG10bG91VXN6NUU3cXg4K0ZTTllQT3l1blpPa3lOdmVJSjNNbVJGaFgrWmVU?=
 =?utf-8?B?NWZhS3htMDJ6bnAwT1ZBYmlERGkxZkpTcmpXOWhQTXNlcEF2czdsNGF1bi9K?=
 =?utf-8?B?M3dCUTJTSVJPclQ1ZTJaMys1Yi8reUo4ZEQvZ1dVOXRFVUpXeDVWVkgxTzVy?=
 =?utf-8?B?Tld5bEpYc2VLcWp5Y2NYYUVNeXFlYVFjYTFQTWZVQlBSZG1iMERQazMwV0JS?=
 =?utf-8?B?Um1PK09sb1dYZmhCZ2Y2RWJBTnp3RURTWS85aFlmaU5Rd2lqSGdmdGhnQi9p?=
 =?utf-8?B?R2xWTHlqcVZOYjNXbFp2TmtIZ1g3NnpBRUhUQnZvN3c3M2Fhc0xreE4vWXJS?=
 =?utf-8?B?akRsZkZXSHhJNWRjYzZWTm5HeGZRZjhiemN4dHBHOHlma3VzT1hNeEpvWjc0?=
 =?utf-8?B?S3BlQVlSeElwWEVtaENpN1NNcWRMdWI4SmErVGN1c2ZMMVJPVzdTRWpjNXpS?=
 =?utf-8?B?cWJ3LzhsS3BEYU9GR1k1Q29nYUVuNksxOGpuUT09?=
X-Forefront-Antispam-Report:
	CIP:58.252.5.68;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.oppo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 07:48:49.0930
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e75dcd2-12bc-48b9-1ff8-08dd86f2473e
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f1905eb1-c353-41c5-9516-62b4a54b5ee6;Ip=[58.252.5.68];Helo=[mail.oppo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CC.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPF0A1E09BC5

On 4/29/2025 9:47 AM, Liam R. Howlett wrote:
> Temporarily clear the preallocation flag when explicitly requesting
> allocations.  Pre-existing allocations are already counted against the
> request through mas_node_count_gfp(), but the allocations will not
> happen if the MA_STATE_PREALLOC flag is set.  This flag is meant to
> avoid re-allocating in bulk allocation mode, and to detect issues with
> preallocation calculations.
> 
> The MA_STATE_PREALLOC flag should also always be set on zero allocations
> so that detection of underflow allocations will print a WARN_ON() during
> consumption.
> 
> User visible effect of this flaw is a WARN_ON() followed by a null
> pointer dereference when subsequent requests for larger number of nodes
> is ignored, such as the vma merge retry in mmap_region() caused by
> drivers altering the vma flags.
> 
> Reported-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> Reported-by: Hailong Liu <hailong.liu@oppo.com>
> Fixes: 54a611b605901 ("Maple Tree: add new data structure")
> Link: https://lore.kernel.org/all/1652f7eb-a51b-4fee-8058-c73af63bacd1@oppo.com/
> Link: https://lore.kernel.org/all/20250428184058.1416274-1-Liam.Howlett@oracle.com/
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Hailong Liu <hailong.liu@oppo.com>
> Cc: zhangpeng.00@bytedance.com <zhangpeng.00@bytedance.com>
> Cc: Steve Kang <Steve.Kang@unisoc.com>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Sidhartha Kumar <sidhartha.kumar@oracle.com>
> Signed-off-by: Liam R. Howlett <Liam.Howlett@oracle.com>
> ---
>  lib/maple_tree.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> Only the MA_STATE_PREALLOC flag needs to be fixed to avoid the vma
> iterator issue.  Doing the minimum change here mitigates risk in the
> stable kernels.
> 
> If this fixes the issue, I'll resend without the RFC and add Stable to
> the Cc list.
> 
> Thanks again, Hailong for the work on this issue.  Your testcase helped
> me narrow the bug down in the end.  I appreciate all the work and
> support provided by the Android partners, especially the involvement on
> the mailing list!
That's my pleasure. I also learned a lot from you :)
> 
> diff --git a/lib/maple_tree.c b/lib/maple_tree.c
> index 4eda949063602..d9975b870dadc 100644
> --- a/lib/maple_tree.c
> +++ b/lib/maple_tree.c
> @@ -5508,7 +5508,7 @@ int mas_preallocate(struct ma_state *mas, void *entry, gfp_t gfp)
>  	/* At this point, we are at the leaf node that needs to be altered. */
>  	/* Exact fit, no nodes needed. */
>  	if (wr_mas.r_min == mas->index && wr_mas.r_max == mas->last)
> -		return 0;
> +		goto ask_zero;
>  
>  	mas_wr_end_piv(&wr_mas);
>  	node_size = mas_wr_new_end(&wr_mas);
> @@ -5517,10 +5517,11 @@ int mas_preallocate(struct ma_state *mas, void *entry, gfp_t gfp)
>  	if (node_size == wr_mas.node_end) {
>  		/* reuse node */
>  		if (!mt_in_rcu(mas->tree))
> -			return 0;
> +			goto ask_zero;
> +
>  		/* shifting boundary */
>  		if (wr_mas.offset_end - mas->offset == 1)
> -			return 0;
> +			goto ask_zero;
>  	}
>  
>  	if (node_size >= mt_slots[wr_mas.type]) {
> @@ -5539,10 +5540,13 @@ int mas_preallocate(struct ma_state *mas, void *entry, gfp_t gfp)
>  
>  	/* node store, slot store needs one node */
>  ask_now:
> +	mas->mas_flags &= ~MA_STATE_PREALLOC;
>  	mas_node_count_gfp(mas, request, gfp);
> -	mas->mas_flags |= MA_STATE_PREALLOC;
> -	if (likely(!mas_is_err(mas)))
> +	if (likely(!mas_is_err(mas))) {
> +ask_zero:
> +		mas->mas_flags |= MA_STATE_PREALLOC;
>  		return 0;
> +	}
>  
>  	mas_set_alloc_req(mas, 0);
>  	ret = xa_err(mas->node);
Passed local test, planned to aging test. 

Brs,
Hailong.

