Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6D63085D7
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750320956; cv=fail; b=Sf9jBp4cLxqL26KOYFWPk74G06qfSBTbzZL0o2hUF/KixqHkPrSk+ldiuiSJvpxvCf6NLETsVwa7TYnTvQ3wjPef4ttb4nwVdzhqRplsQXsgrsHeyL4Z7HrtC04wv82sr5ZeAQwTmddbE0L2cij69YGV38cdOCzd0DstMoZnBDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750320956; c=relaxed/simple;
	bh=fT2IZEmpfeBh5/HvsAfUq7eWSjv9wNmd8cAVmstb5fY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RI83jUWhF5aGf5QlOdYAq0pIXFvgyYpJq663qZi2AuyNssPHQd/qy+sIq/sfJMuprmSk/TywT9YmTiQ8xMgbtaHlXTwWLeY++kg9K4r5Ui41DZ3hzqqn0FsLbKVKYwKdpPF6m8jJIGpBJga7aQ6iHyodkTaZEGxHboI1A66Ukbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PTmePx3B; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=D7OQxJXg; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PTmePx3B";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="D7OQxJXg"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J0fb4N027889;
	Thu, 19 Jun 2025 08:15:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Vt630QXAwy5SA4UHfb
	isZZupxr6Jbuo0fUGsecSTYEY=; b=PTmePx3BYMgdWHyV03yRUQHlnKXAL4PjJk
	jVjve48eNNhwRayvlmPdxzx/iEzS4brbxnMdwclUySoCgqcuAWVgD1SAi9XkylzP
	c7weuElp69eXyuVZ3cfzxgMnFOqRvIsPAvVnSsaGoIczBe6R/l5n8pVmgjQ1vGxC
	zahl4F9fpYTMX9/JCttlUGM4fxEgg5YBCBBf0z80464sjCg/DuNBEU7FU3Zpqy01
	Czf3T1ygmwx3GhkCzMi4XtedYB1ERTEUBU7EClQvFTi2m/47m0yHTjDBhIwgP/Nd
	z+KguSV1ksAlg0ZCXvfZ8kTSc4shY+3XGZGIuyWpGCCSsS60kwug==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4790yd9dys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 08:15:00 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55J6KImA026040;
	Thu, 19 Jun 2025 08:14:59 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011063.outbound.protection.outlook.com [52.101.62.63])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhhweyp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 08:14:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hEx+H17SNi9aUQ71I1+SYvPq7I9NMKH3yDiIG4Q2tWJAGDtU47XA9sT/7VD3+Yl+kC8JQhd866xPpkRcmIfchPfRyjqc2SJFmBJP55avhnlRnP/jqay2WPfl/Gy0tbfOfi1rPefilct0XN+xDvXC0y4fGA4Buw+bl+3oF/5Ib2QLznacjm2D1UUMGD1LcMUXwgHxLcJCE3P6ETi4jT1jlB8xlOD1DOb7zy0ILMMaQPi5doJ5I9cLA1jyrchcH76349/pZp6YvMf3QjXKIevRnCXwNm03644SGNCYlwbSJiBNTSkUsPQ1qlFMRJIeJkfQa6b82Kca6KwODtgdpJIqGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vt630QXAwy5SA4UHfbisZZupxr6Jbuo0fUGsecSTYEY=;
 b=iftXV3aqkDDUmjukGX0JM41FZ2BYj5BBRrUTyijByj0OUBXf5/KFT2iVJngkPtgKemj5z6UrdbDJ7OvnEtsWum1pq7Lg7r8Cu1ib8UqAI/z3RQfjYOfrcEfghIT/7WcTyWP9HssnDE663AJgJ5Vvu+JJ6SAEeHVMOsu3xuJn72ELI0f2B5JiIMxZeUjG2/ZwousKarZlxXhnchogN4ZqPJVo3k2ieX9/Zp9z+cqnNTQaLjMl1NJGlpdEW9sYQ9KD+I+0g+72AXVrOjhhPUHDoOyipA9vXGpEHcZl7ejkIRUc4CleHfH32zMDklB7nZVk97E1DoLPxGBLrzeIzuRHQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vt630QXAwy5SA4UHfbisZZupxr6Jbuo0fUGsecSTYEY=;
 b=D7OQxJXgA4e4EIa8KpyDupImeU6y3aI8UqcdgUV94NNxivxvEAxL1gk94pG92G5ausutnENYrIUZY7S8/XcxYtLlp8yF6BX66WliuOBeqx+5kKG1bE2Qi9Z2uQIyVeofU3Jh5wmmSckJJ0NAjViEh5o0jfoPVeBy+oSwnZNNNdQ=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA3PR10MB8562.namprd10.prod.outlook.com (2603:10b6:208:57a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Thu, 19 Jun
 2025 08:14:56 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 08:14:56 +0000
Date: Thu, 19 Jun 2025 09:14:53 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Ye Liu <ye.liu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>, Ye Liu <liuye@kylinos.cn>,
        Xu Xin <xu.xin16@zte.com.cn>,
        Chengming Zhou <chengming.zhou@linux.dev>,
        Rik van Riel <riel@surriel.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Harry Yoo <harry.yoo@oracle.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/rmap: Add NULL checks for rmap_walk_control callbacks
Message-ID: <e3e56221-5bfb-48b0-84df-37891dd5d98e@lucifer.local>
References: <20250619075040.796047-1-ye.liu@linux.dev>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619075040.796047-1-ye.liu@linux.dev>
X-ClientProxiedBy: LO4P265CA0248.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::8) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA3PR10MB8562:EE_
X-MS-Office365-Filtering-Correlation-Id: 3df8f7d3-e3dc-4cc9-b91e-08ddaf096051
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?akkliI/Lc8lPgdSjsmfuoEpDJgwgq9u+jAmbQLwxMMNf4Yv1CiW/N+cvbVN7?=
 =?us-ascii?Q?iZxwp0f5JL98pyf7/yPuq3Voyka1p/b3rlu4/Px6t4wwOWptimypRXKKJ596?=
 =?us-ascii?Q?tZf6aGkXAgzaP3w4KTFUqmzu2w3xKSrJSPraQWTw1X5QO8Z04C0xhgrDN0zI?=
 =?us-ascii?Q?7KxADKcMKZTbimqaum0ZRv2KIfxgjC94W+J+Ycm8pDZZYENZWk8guexxNx30?=
 =?us-ascii?Q?UXLCBHL6qzt0AQpSFUuCRuIv2TWTxddnrJ5n7as65NyZGKkx1xFNZ7gxALr8?=
 =?us-ascii?Q?C+kmjAcUmkx+CEbFfzZ+bFfMDohMBvHw8KUtJurt5EcRolIJ4FvTxHPXwBT9?=
 =?us-ascii?Q?V48Sz1HJ8pdcoew8Opan/SIvKgskjfPrcHjamJLkeEm9CYaAXgRt+EPTLw5e?=
 =?us-ascii?Q?MLgTuN9Uj3jogl/r6w663mjZj4jPYTaTcZhZlL22MbyrrnEqSaC6j+JGOS38?=
 =?us-ascii?Q?s3ZbR1BLAAhdlgyRD9oU3i+bY955VBrTUHWS1sNejMFidSZC21TA2crth4fn?=
 =?us-ascii?Q?J5XY2KSD/xaPtdFvpj7CJGmhT1y12Wva8laydEOfHfuI5c/OFqfS1W/yoqDF?=
 =?us-ascii?Q?x7Xw362TNrURmaz4VpRKsJxrbFuy6T0V1ALqVcKpEVKz7id5FdCDd4rhKT8F?=
 =?us-ascii?Q?lW6aC0nKQWeSo6VNhdnhKql4n7/fG8jP8oiYVKMwd+zcCo7L5bZoBervkyg1?=
 =?us-ascii?Q?0dG7X3SNNREFUPziIvKczLCCqClX7k3Y5HwIwzzwWA3SgHxrCmDHanXcJYvv?=
 =?us-ascii?Q?xuo3uAV/cJd8T58ZEql5oeuw5Qvm6YQeI/IMI/ZJ0KiTKFXjDn/tDklshfAK?=
 =?us-ascii?Q?H87QLmBDqFx9Mb630xFHglVJ2EPukf9GrkBdpviu/zwXZRTAyQ+jjViGgJOA?=
 =?us-ascii?Q?yg8NEHrQ7zj6U0SbpJZagKaHHIMw/kxbIlQObQ4IsFbNB8/wpJBEKX1BtOnV?=
 =?us-ascii?Q?wNjHcw08yobhR0Jr6FPsnko9ohkDQhbf/w3u3SjDebTKDdrlRUJ3d/JeFs3D?=
 =?us-ascii?Q?gJi7rsWs9FW1aILlIlqNwyN8sD2rckuKskm9KwySYbrtvlNon+WaZ0c3Cgn3?=
 =?us-ascii?Q?aHg3qX9X+lpJdEji0BCBf9lMvH4RZU6LyvH9Fo2ilUlkvP4V96ssge6iHcn6?=
 =?us-ascii?Q?fQBCglhg2sPoktbHUP0NPTkGiiZDAafND3gejXvmewt4ZW3cSjtbVS/5g4I9?=
 =?us-ascii?Q?A3nOgl5djZWbljMjGVvwQZ7rdOpRzLLequca0CkbTbNe0pMfWuU4uFdPeO/p?=
 =?us-ascii?Q?WsvedUiNK4WQpc+hyMVJc9jvu3c20xUX1w38jTs2476+1TL/BL2NT/6ngq0j?=
 =?us-ascii?Q?R7IWuhl7P7JTcp6wKvTDJOco41ensDJ3znnhaOlRonYaz+WhFh1gezda01q9?=
 =?us-ascii?Q?tzxI1iH1DkGZbcb09ngN2oFJFgyUK2gNihJGJAkHkfI6y+uflMVqDBZOagcg?=
 =?us-ascii?Q?MjFudXzf4pc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hLyWZb3i9gkDnh/ABGwcHZeKDrXcljznya94q6qBQkmpv6xK46ZnFSzd6g97?=
 =?us-ascii?Q?dnb5rO9mnTyWrK82aMrXqmbdQqH3aYzRc2bCFzPK6YTPbOGI5dQSQyZO/O7P?=
 =?us-ascii?Q?pMCYLWc76S5v0Y9EDqlQGdO8yeX1CvHKuaaxlYfz+ChzlClLr8343EtBRFKN?=
 =?us-ascii?Q?Lm8b5JhtNVUIxSfr54RKiXqiuSo7XJJPLky9e/qUsNUBqOjFjV1qTF++j/U6?=
 =?us-ascii?Q?WjHicbgCouKjFmydUf3LzXAi+qf/ah3wEb3Xj+BmYktVMIYGMo2i5Zyaxdz7?=
 =?us-ascii?Q?wIiVjwWvurTUpj72Zfst3BfwwuRvAxPA77nLtM63URhhX6bUbAXCPfJtEGK/?=
 =?us-ascii?Q?31K/x/kL/upvM5YlF6oBMpHjeQGjspaupVs4WVQwZqKePqEUO/sVegWCi8MP?=
 =?us-ascii?Q?otIIezitUaibGQyOCmvdbLWTpNOl8bl9sROeIHzq3Xgw33nYqsIjbnJYs6VB?=
 =?us-ascii?Q?O1fuCy4l3COR2oii+F9iA5p8FdQnNB2C1cJq9JbI1LHHsZjODixNC33xm4bs?=
 =?us-ascii?Q?f2su7kCSeE3PPjPBimxw/zbRYyEehQygcphjUsJ0sMO5DRDLk+LrSRb2qJzq?=
 =?us-ascii?Q?GRX8ffgk0yRW1ALgQJsveD/pcYcGLoFJSTorOS1gBIICt8AsWHYp2qF0VThi?=
 =?us-ascii?Q?xeMu97mZkLbczYwkX7BGT7k3nTOnQKUj2Kd3hrlUHCX2/WoDcTrpMuNcYCgD?=
 =?us-ascii?Q?pybqAPnpdDcyFU4FVd9hLB6wmgQWKvB0PXOOCVvrxbJ9Et2+Tw91EER4C5Jo?=
 =?us-ascii?Q?ZSNJWnzN8x1jI+ZlJobg/1EHnihV9Ah46hMc1GS/GMWpUdcMzwHMxgZQ6fA5?=
 =?us-ascii?Q?1VF1UFzGKFeg6Mbw9pk0MkT0hRdbF3M937MvNbHmJf+x9QlAoAq3l+F55isi?=
 =?us-ascii?Q?vNEi7qZj7eVi288vylRF3onFtJKASoAejSFWmkaks8Tdhc1u9fQ4oPu+xLLE?=
 =?us-ascii?Q?9S/C8SpcQgosYYw0FEUXyBhqHB4HOcIQ7tQ9EEUzutwIhMIWLFL94BNRguCz?=
 =?us-ascii?Q?aNzlv6X15CLVqoLQChoNMurrkYW3NImAzt4k1RroBM/VkxmMEN/Sab4pZAFC?=
 =?us-ascii?Q?NMGuljz247FimwfwGJ4Ia3AVZszPwlJkR5ugium4R4+hWCejowl4C5NjYSOu?=
 =?us-ascii?Q?bEYqB7o1abmtiDlrxGCQeF0Ygk8BXz53DJdeHATMfdlH3GuM/5xNkL1mxENM?=
 =?us-ascii?Q?pVW6SGmKDDoYaNe1mOpdjRkDYw2WFx174CJgTuOKH3L5ecGR2xYOsaJ9j9aI?=
 =?us-ascii?Q?IdHusNWwWDkfzyrVX5ezWdJcJ1xTO85aophZoD2aiXRxdZGx01ewavT3im3T?=
 =?us-ascii?Q?e4DkXiE/t3nApCi1N2R4qEN6a6wnAz4P9y5JDOD3y8NZB1/tfNlrdhywINaf?=
 =?us-ascii?Q?6dShk4gbLlCB6Otp6awCZMlpWkOldFqif+oXejAc3vteEc08Y+V+OJUjTKGJ?=
 =?us-ascii?Q?TR9A37MPyvd8nHw+Ew7V0fISOJ0iasUIRzLxi+Tcnnub3agn89A2ggTThvLd?=
 =?us-ascii?Q?Xp688Qohoxx8qWpJsQJj59N9c+FXA7YoCIwsGR/PDbcPXlUDfh7NJfsLHoqG?=
 =?us-ascii?Q?z10CePsCZUt3td+CU9o66USAljUUiUV6q3fEet7WF+W2xgZM4UiiRQ3Rl5qo?=
 =?us-ascii?Q?Jg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	D8JjFl4O0+A8Zu0WPcKKfezH7BI6HYFvAH8oU5760mZt1RVd1wR0hBfPWv3dje6FlGn3IIjCUKui+Cygv12P5a5S2jjSplykyS1NGpBEAz1EbiOan1ZXziIeJ1eN+E1yXIj7cpRiaasVzoV6fmWagpxLQu46EvFyzJu4KM1/Pab35DmOC9j50qT/phG3b/HsSzzGh0leLIb2paNyRjqy1DXrDa4Cw/Z8dvMJj0a4EcNbdWLEE7QBw5p6jP2blmCRdhLEW2BTzvnxohErBqjb1qDIMLHlcOKYOaifxoA/PQ1x1NbYXOPdwu9ZhSN07bpmIwUm3ITg0IeD8uqlZM02sK8gz6x0iwAFx1eruEh0tr2sRh7HYEFhQlaeRPq1CG1qTO2FdKLxrlET6HSSj7gACTo0SUM7eOoYBzpLYuwxs3uSLtrIbVNDWOJ1YQZbrvyhoQCufacDqcV6TVJVOPtT3GsdupgZssxJlM4vvb5BRO1zHMNfEQE5uexqHFxSc4whSHcoLrWwZ2aLLqi5/lIqh6cQnZyeg22DhvhBd/PujSZPsbzCOgGRHLlzNlWyIor9XguJWxSKR5Vl8Q/IVmnmXWMMVfKglKy6HbCzQihO4k4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3df8f7d3-e3dc-4cc9-b91e-08ddaf096051
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 08:14:56.3014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dg4e6DrsAXgpezGEmy9mBM0iKcR4GsgBUgVuCPdZSZmmatfyX1oNh4bWRslmFV41n/o0e2+rdYZtGMG+EbYGf7AM+dqNEKBlIh/in4P0nMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8562
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_03,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506190069
X-Proofpoint-GUID: QXmwuQO_7lwYDcUZOZM73pRY8bolBVk_
X-Proofpoint-ORIG-GUID: QXmwuQO_7lwYDcUZOZM73pRY8bolBVk_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDA2OCBTYWx0ZWRfXxjpC1/krsHJd hz3wvvTckgwi+0fAWWPtAqISW2t9m/oMfBPfS0hSW1hbNKK0FY/MUVrL/C51vZf+/z/Pq4bEzQ4 CwqbDmmnQdKSDo7PFzxaAvEUjss5srB9oM2YfmLl10B6ZwNFV028vEcDN5W6qgRfH8iBmGh6Iur
 p/gvy518ouJkuXSWomNMrBekkJpfAJ1YFxRu2/hACC+Cz+HALereLKR0Qz4jOYonS9uUw3CNMkv 9hIlIiEJn4C4CO1gYX4YWHgGy2w78A0TAz2b7gSsxdkfVXMTm/eN2OWl8YYx7mNkIPNGXsAUWYR te2aDhaRAzhMPFXW14k65i6c2+/8+KA8MQpqlS4jImbeE03MyWT4v63+fFbVpu5bHmuyb0QPLaq
 N6Y92zInSUTkh8o41W8J9XKV5NaFef6Qfn6wR6XQVxmFLyyHLytEi90EkKZ2jRPXB7x/EQYY
X-Authority-Analysis: v=2.4 cv=XZGJzJ55 c=1 sm=1 tr=0 ts=6853c704 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=gmMf7PjEMO3WN5haTKwA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13207

On Thu, Jun 19, 2025 at 03:50:40PM +0800, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
>
> Add NULL pointer checks for rmap_one callback in rmap_walk operations
> to prevent potential NULL pointer dereferences. Also clean up some
> code by removing redundant comments and caching folio_nr_pages().
>
> Signed-off-by: Ye Liu <liuye@kylinos.cn>

No sorry this patch is no good, none of these changes add any value.

> ---
>  mm/ksm.c  |  2 +-
>  mm/rmap.c | 14 +++++++-------
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/mm/ksm.c b/mm/ksm.c
> index 18b3690bb69a..22ad069d1860 100644
> --- a/mm/ksm.c
> +++ b/mm/ksm.c
> @@ -3068,7 +3068,7 @@ void rmap_walk_ksm(struct folio *folio, struct rmap_walk_control *rwc)
>  			if (rwc->invalid_vma && rwc->invalid_vma(vma, rwc->arg))
>  				continue;
>
> -			if (!rwc->rmap_one(folio, vma, addr, rwc->arg)) {
> +			if (rwc->rmap_one && !rwc->rmap_one(folio, vma, addr, rwc->arg)) {

It's convention that this will be set. If it's not set, a kernel developer did
something wrong, so why the hell are we checking this every single time? And why
if we are are we just fine to do nothing?

This is not a useful change sorry.

>  				anon_vma_unlock_read(anon_vma);
>  				return;
>  			}
> diff --git a/mm/rmap.c b/mm/rmap.c
> index fb63d9256f09..17d43d104a0d 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1202,8 +1202,7 @@ int mapping_wrprotect_range(struct address_space *mapping, pgoff_t pgoff,
>  	if (!mapping)
>  		return 0;
>
> -	__rmap_walk_file(/* folio = */NULL, mapping, pgoff, nr_pages, &rwc,
> -			 /* locked = */false);
> +	__rmap_walk_file(NULL, mapping, pgoff, nr_pages, &rwc, false);

Please do not remove /* x = */ prefixes. This is not redundant in the slightest
and aids readability so you know what's being referred to.

>
>  	return state.cleaned;
>  }
> @@ -2806,6 +2805,7 @@ static void rmap_walk_anon(struct folio *folio,
>  	struct anon_vma *anon_vma;
>  	pgoff_t pgoff_start, pgoff_end;
>  	struct anon_vma_chain *avc;
> +	unsigned long nr_pages;

I don't think there's much value in adding this at this point to be honest. It's
not expensive, the compiler knows what to do and there's two invocations.

There's a trade off with noise here.

>
>  	if (locked) {
>  		anon_vma = folio_anon_vma(folio);
> @@ -2817,13 +2817,13 @@ static void rmap_walk_anon(struct folio *folio,
>  	if (!anon_vma)
>  		return;
>
> +	nr_pages = folio_nr_pages(folio);
>  	pgoff_start = folio_pgoff(folio);
> -	pgoff_end = pgoff_start + folio_nr_pages(folio) - 1;
> +	pgoff_end = pgoff_start + nr_pages - 1;
>  	anon_vma_interval_tree_foreach(avc, &anon_vma->rb_root,
>  			pgoff_start, pgoff_end) {
>  		struct vm_area_struct *vma = avc->vma;
> -		unsigned long address = vma_address(vma, pgoff_start,
> -				folio_nr_pages(folio));
> +		unsigned long address = vma_address(vma, pgoff_start, nr_pages);
>
>  		VM_BUG_ON_VMA(address == -EFAULT, vma);
>  		cond_resched();
> @@ -2831,7 +2831,7 @@ static void rmap_walk_anon(struct folio *folio,
>  		if (rwc->invalid_vma && rwc->invalid_vma(vma, rwc->arg))
>  			continue;
>
> -		if (!rwc->rmap_one(folio, vma, address, rwc->arg))
> +		if (rwc->rmap_one && !rwc->rmap_one(folio, vma, address, rwc->arg))

Same comment as with ksm.

>  			break;
>  		if (rwc->done && rwc->done(folio))
>  			break;
> @@ -2894,7 +2894,7 @@ static void __rmap_walk_file(struct folio *folio, struct address_space *mapping,
>  		if (rwc->invalid_vma && rwc->invalid_vma(vma, rwc->arg))
>  			continue;
>
> -		if (!rwc->rmap_one(folio, vma, address, rwc->arg))
> +		if (rwc->rmap_one && !rwc->rmap_one(folio, vma, address, rwc->arg))

Same comment as with ksm.

>  			goto done;
>  		if (rwc->done && rwc->done(folio))
>  			goto done;
> --
> 2.25.1
>
