Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FE92D3A86
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750434729; cv=fail; b=KUgga40qrSQd4X+Ehd7hwN6QQj1J+FsRPAhXJUdEyVQCWPE/zQUYTcr1rIWBA3QJ5qYsQMfpUhAR5pa1X0nxjA72Mb+Iz1baiwJKqlKD0IKu5yFCPY5PnzhdnHE2spKl2yS8sAOyafT9oq3qoyCwHNQCNP5ogAs+PGzlXEwO2Wc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750434729; c=relaxed/simple;
	bh=yD6PIdOpD75x4226p72M8wdrr3QkiOfPS3JFsreNkvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BVGRHO1S9S4odT0F87IvYoaTvStgquU+WqFZMAPMUg7djPShVTJAPtG6KzmOVSLFCb9D3x9lanhtmakQTWIjp8BiYIp/E8Sj05OSy8O7XLjv9sovQZtZo4PHgE/loVO9O9fAUF6NZuHQlWRTuT5s22wS7ZYgLpABaAYKODb7NQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UHUSwkLZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NDztRQeO; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UHUSwkLZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NDztRQeO"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KEBkPY021410;
	Fri, 20 Jun 2025 15:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=hWs721V5P5E2k80/vS
	hqNhYF5TfmaSiso1hYkIgZUOM=; b=UHUSwkLZA0UK14vGoEkJrWref9vSK8kGzy
	YxFiyWj5980/9HKyUpsFIfLBUcffZ1vshzuQ2cDCpWHu1DSKb9RcVcNlkMrmITWI
	ZRsRWYZR0ppXRAHEztQqrcCVSLc3xwSZoviiZ0N5emKZgqmcqhBIFcPXPiyAzOLT
	GBMPkJRgrgCOPFfx+DF5vjANfh1/bp862zl5QaMvsI8HWucY/0jdhZCmD+muCS2V
	xJ/4PpZ98x0k84bYQmKdhYTSKMBrbway8QPceuRAeKQUYXG5CE262CkoRcdKUZxC
	XaU1m1qe5koyzNgTwBTtGuukq4ikvl3eF/XeQTP2bFtFuMbFDSQQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47914euxw0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 15:51:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55KE4R1Q009839;
	Fri, 20 Jun 2025 15:51:35 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhkjxg3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 15:51:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LcbIty816lDqmPly+SjNLasJbNIyBTDkw4rG0tP352EcARql4Aw66Ewc529bAB8me+/wMn4OouOujS9sb9ecmcDLkEQOfz8tjH0omchAa7ZPOXgb5xXXoUoi6Z6aRYxzpdf7xi9ElZcA4QmVeKa9cICYKsrAIpWMh0r9LCv2kDBxbZYm0O77+ZIwhF+XyXu3N0Db/L107yOQouIjEQd4kAyWblpCJVWI3L+XJgM5zzAH6hRwLWW4yOitOgEJ/p3tz8ZeB2r+1tqGNL8tm+FUvJxdpNT1+rJ2yU1c2TqW1NDCpWZuCF8f5yZ9hejScdOYIWa3VUkLNs5h5iAk45Abjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hWs721V5P5E2k80/vShqNhYF5TfmaSiso1hYkIgZUOM=;
 b=YZkbBi1RsQ7PNecDzzKlc7HR+riXG9KcpkbnbeDTyftegUBkd/HPLzbhxsg50yRkHi932C7UeV1TjS5/lGGog6uYaSR3isxuw+xhMrMSO7MXIiPDdukkGhXp/JU7jPVj4H4gnGpPCRcCEvB08GfbKn128KV4Yyn74eINGy+spWl+GXeFxIlq2oBjgA39b5G/1QGAITfsLN+3GkDaSym7cE/5PoH5t1k/eJ8hy3dTyEBnhe3OlOoSbEwBybAFHEgybesuPYp2Fas/YBVBYLKOHsUK3DWhP66qZtaQgwDcJRw0I7QA/LrPOfq5nB6prdiroZYvD2qkqvE7jWJkAAf31g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hWs721V5P5E2k80/vShqNhYF5TfmaSiso1hYkIgZUOM=;
 b=NDztRQeOa1XrtBfWvS9byEzEYW/t+iHmKp6ln/SCFKMRYK1RerduZ4fnMw0QAwqtuo1HNOzS90ET6FnwgSbODWsedeqqPytvpZNc/os9bfgZ9yHiSAnOv1d4wNGPHbjhAuN2hx+2AZSCB0bMVVzYwi55b8fXNdXj4hRHetKssdI=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM4PR10MB6813.namprd10.prod.outlook.com (2603:10b6:8:10b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Fri, 20 Jun
 2025 15:51:32 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 15:51:32 +0000
Date: Fri, 20 Jun 2025 16:51:30 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, maple-tree@lists.infradead.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org, stable@kernel.org,
        Suren Baghdasaryan <surenb@google.com>,
        Hailong Liu <hailong.liu@oppo.com>, zhangpeng.00@bytedance.com,
        Steve Kang <Steve.Kang@unisoc.com>,
        Matthew Wilcox <willy@infradead.org>,
        Sidhartha Kumar <sidhartha.kumar@oracle.com>
Subject: Re: [PATCH 3/3] tools/testing/radix-tree: Test maple tree chaining
 mas_preallocate() calls
Message-ID: <c1ccb6b2-a981-478f-ab7e-91078a6d31ba@lucifer.local>
References: <20250616184521.3382795-1-Liam.Howlett@oracle.com>
 <20250616184521.3382795-4-Liam.Howlett@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616184521.3382795-4-Liam.Howlett@oracle.com>
X-ClientProxiedBy: LO4P265CA0273.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::10) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM4PR10MB6813:EE_
X-MS-Office365-Filtering-Correlation-Id: e391d963-c668-4420-630b-08ddb012544d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lGO6Asay0Mz2rjskTxQxACt6cVpjoPiPHQTQeXZFye/P6J4zhj1Vz1FgfVeB?=
 =?us-ascii?Q?llHdWxt4FoZYbIyZlffCOKxlH9+72RQHinRV3L0gogqTjiUgl7oo3aokl0AJ?=
 =?us-ascii?Q?0vdJEKNeHW+lXPZ+yi2bc4+SUo/HRYLkx3Y84OCU2f9t4jl5WwjYWOaghzxZ?=
 =?us-ascii?Q?jUlvf+LLkM5QpvmjQwk72vO8L4XXgp+04pUP/m9eeUEk6Fsd0k6kPbKaDLXf?=
 =?us-ascii?Q?cVUsJ0YQ0tSUpviBZD1IHRGpmZScWehOsWch8/4bI8r4iDul5AZ6+9AndQ4n?=
 =?us-ascii?Q?an2zzCgX6zWC9Ai0Vfgd9TohS7I4nLz2vu671q1nJZnm7m+9lDYWxt34FP8L?=
 =?us-ascii?Q?z2Ct28RyHIakgJn8wzGvsp/EcvhBLCliL8CLsgNCf2t6zKd5RgIYHb9hDx0V?=
 =?us-ascii?Q?UJcvZAfBjgigMwUopceP9bmPKJgHRlClFPqAl066iu9MlqkNvAAeys2ohIyT?=
 =?us-ascii?Q?yvhOoHYXyk3NJk4DmiJt55pwsMm5P37c4SfFz16c+NwZ4RkCGPHIdCMeLkNJ?=
 =?us-ascii?Q?8TEuRjW0CwS2pyiUKl0KsJHA0NyhGsvSo8zSOEXODp6XHWj/syH8sKlFblhB?=
 =?us-ascii?Q?AYkBZ6DJlyTTuApng+eGwN2rZjMoRkd2+Xo+4QEuADd+BBRmzhmpcZAKd52A?=
 =?us-ascii?Q?3oOc5AtqyMwFV0JLLbNn6s+RvTBuHAhXxV12AE+BaSUDILHPhvFxpMp0IX8T?=
 =?us-ascii?Q?Cd12EL3Holl0nuiDZhRU6zMFU0YUmUms5UCTwG3Wn9G2JD2PkbQWOfCK+XdO?=
 =?us-ascii?Q?pjS3GzDQR9pS1hr3JdFlHVAtL4r4J3VgZ2YETOkZt/gcRoUpfnem8YdrYG85?=
 =?us-ascii?Q?l31/7a6IrUySdpf0TNNCue9RfqgkibidKKNTkM4YmZ7cZRSyH3fYVLdgllrc?=
 =?us-ascii?Q?OKGbj7ZSPAKLTmKpOZmC4o03IqZaejQbIX3uy91fz7//+1O3I5yotmd0iOOs?=
 =?us-ascii?Q?lKmX0UZrFULSElnheCu3dqW1hvEHvfOdXijAdI5VER1yZT4mgKAWVgJZU7KF?=
 =?us-ascii?Q?fA+74PamlRamhqZ1QmbgX+MJWglMNPFhJbTtkVHWIZ+hmfAuKN5zMqs32csF?=
 =?us-ascii?Q?Lo9Ixzw3yLwoCxp6BcaaNJDvxhCM6UgBKeEZim4STpbRnsXKU0C3NRdWDgvU?=
 =?us-ascii?Q?iILYpQEnZ5Td+OiqJe1SC7ULW/BWR1Z3wsCEKGr8qSqrafcYf2Mnq86HH+Gl?=
 =?us-ascii?Q?ozwCj2RrV1EhH84bI0rM8QxDD2/glvZov7T3GhdytYHCMHRko2qCWbaDCTrv?=
 =?us-ascii?Q?W8PBsSvkudXrHqI+5QYGLgEuqwlxqugJKO9bUqJt/LsVwD2wPGbGoz4SPLY9?=
 =?us-ascii?Q?MLtUit+YIiWgBwTeV3FATpBGaUg5oN2/PTzclj/5fYlWjivIGwusJHW2dhSW?=
 =?us-ascii?Q?Dyv1wTsrHk2wmm6hCVdDSFnRNlfCCeur8rkAyndmA3VxyHe7xLXau7DT0In6?=
 =?us-ascii?Q?CfUfqUwon10=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O71ifMPcJx2RyiXHrLW+POo2ulFTZ4/nw6RHHH3rE1TTIgdKizG0k/ZKNdy0?=
 =?us-ascii?Q?B+wfuidhR70Sd87YRTp2pK9JZXW9MwfKR1AlZURC3CcaJtLGUkT8h1bk8dxe?=
 =?us-ascii?Q?SnCFIZEEAXfapTYjUSz2wuIE5jFZe6ScHnA3TvcDlSyqCw9BRxh+MMpAFEzC?=
 =?us-ascii?Q?SZmnxC96e6Ypbom+wwS26lLR7ff4FhJ6P3d2atKwnD3kEyG5GFD+y+B/kXQg?=
 =?us-ascii?Q?DjDOk6t/XiCXnNjEZ/cKa5LEOLL76nkrugfFFV7hLSgF8mdZVE74vE0fp7oU?=
 =?us-ascii?Q?UqkhlLTWxY0C+zcpAQvxMpIYqlimg/jyF4PWnvAEkmPIX+QImIEhDleddbKf?=
 =?us-ascii?Q?7GhCAJtDZ8FtC5on/3mtX0GLsmQmizUVlDQNHPBfu/QDPrLtZjodF0u89zhs?=
 =?us-ascii?Q?y7t3F/BXT3XeD4yGaT5N5MmBh9+egRy6hA4gVLILJSkiT6zLqBp6w5x6NT86?=
 =?us-ascii?Q?gx8GStILdsM6p+gD7mbaLe3NHzBLJkWKoVtykdzJH2r+zypimtOvhn9fR68l?=
 =?us-ascii?Q?xY0vkWvZ91WjnFQ3iUYYB/jyme97TgtiWtapfspS6hsIKEK9gg5foXL7PViD?=
 =?us-ascii?Q?POHnIyTb41jCSFpTf67ozg8AlUhCGka+Vy+0Yk1d0k6kYLPHouFQeafnfCFy?=
 =?us-ascii?Q?YnskuI5lCSm0jsBfmFw+8V1I5ZBYG6TG6EMo1wEZV+39+DJe36fJ04aiygqh?=
 =?us-ascii?Q?lgsjgt6a0FBRdhbekpUdDz9OUQ5mlNjMEvr9o+8yUX+7tk0bg7UNMiEJ74zR?=
 =?us-ascii?Q?3sXfelfXNwvJm3Wmwx4clowxCzqeynhEoiD4dkHuymI7sSfo7Y5tLWlxbl73?=
 =?us-ascii?Q?jsECdOohMJREGVZYD89KqHZ/RyrAilkSdRJoOvFdPnn8g7Ie7Eb+IF8HQosE?=
 =?us-ascii?Q?7Ah+lTggqNbKXdncW/WhbhEXJP8QjHFQQ4t4KEAMWauYFqNcC1Bt7BjDNL4Q?=
 =?us-ascii?Q?8b9yPP7cNDbFqOguhqY6SsPih1KyinkmmU6csqbS0SOKU5z8NY99t27eutri?=
 =?us-ascii?Q?3dCc4Cvf0wUaf5HzbxXBXGTAMEoxzPXUEcvxXF11RK7OxIWWhbCIamx2cGC/?=
 =?us-ascii?Q?wkcEgfZyXZTFYSp1IDWNFaSyemCFWLnhtgYVw+/YvnisGTxPWsThFiBe2f4D?=
 =?us-ascii?Q?LoiBE4sOGPR05T0XlS8vLyXfia4U23uetfMO2v97xJ4UeAAkIDHONP1W0rGM?=
 =?us-ascii?Q?KuBoLeXvlDPLxByLXOqPmk1cqW0tYJDHsqtfW5BlfInOJvvJIIru7drpWSmV?=
 =?us-ascii?Q?knt8lH5CjGJzX6x3xppD1qZXG931wg6dG4Y/rZRWcXT79fncUHtwiHBZpy+o?=
 =?us-ascii?Q?3Ru1pX51Zusr0mfcD1OcSjC7SwxpawRuByttHxq74IeouuRd0TLwd4TxSpyk?=
 =?us-ascii?Q?50zcZwqohn6NmRqLOuvTFvW+HBbSOc8q2R5SiJgfu0tMizWIw2kD+4s5iebY?=
 =?us-ascii?Q?ljoh+9e3gAqGT45697Y2j545dZFWyosrvind+uSeJxlvVjLaJpG8QO74oVWI?=
 =?us-ascii?Q?buOUjw9FsPPlbXufTpdbVvx5DSXUBU1UqU82kyn/NkWqcGV6OiIPlfnkFTMV?=
 =?us-ascii?Q?XfYvBhz3+vUlzKvqxQMLtT1pPaY32nU+w6c9OH5OOcsugZ7p2HFx4n0Pv3YN?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LWNo+6bYq40R16/LG6PELjSK60XYxWGLQQPrnUuu63ocRr5BvehR1yc1Ht5A5j4WE+Tc4DVDwZHDyLXtecUtD0LgnZUylJJZY7XduNuJF/1pvhURWPkVeUQXVGSBCUADuZlX9vUTF6MMDrWHDsMazAl2/Bpb2HWXcpkghqpC76sRdDQSvzXurT0366wON3d7+6zA7KgT6cJK4FSgAeIOm+TLxwqHOdBPG5//jh75IRQeobW4o6nJyHR/QDxluqnp1n5VkLaJhS0YNrkylM03+JNlp1zZEi67pdvNH5fIUR2f2spTLaTkzv+pHWaHiY8MEK8LDnotP4HweynyisTgV+wpwcjDzOtpzPdFAXwjxYfoCynOGaV7Diq+xGEDSyk1rMj+uVjUzv3vM0BzatfB758YJQljc1hjWyViFfbDzWvsZ0rcjvurt8pAxI+Gulc3MeTMBD+hCT98smG5MdHT2tRffHOn5mmzmm9+TxihiReoSTBxl24AJlbp6xljDFwJ0E8/xccItn2uR4/v8QiawKcsZSBLMq3GR6d4Wp+mMAkz891+1LDW7RHc2BJRF0In5yNq4i/lRmRPc3pQScJeBDjOwf1fZnC4+xF7Py4yiUA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e391d963-c668-4420-630b-08ddb012544d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 15:51:32.7438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PlTLSXAJ1raUFp6L63Zv8IcumBS1I3YMprdVFXC7pUj9c6yOYvdLgvfcmZtWs01SABQC75lDJMuBqJQaZnaeDzywmLzGICiTUeQfEw9OmGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6813
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506200112
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDExMiBTYWx0ZWRfXxRHiSD1mxH26 ih4RkAFGKgaqH8ikkVzAAzRi758XSTOJpq7UQePmtDblqbow3XZGTELhB78PhS+498ukLr+Au06 P0icn/WOphvFEES45eUETJ3+m665hBvgGBF0RvMJEsE+CsT/FIWA80+9ihLvtCdNWvAFaLTHQgJ
 fMBytpGZ31WF0q443OFp+YcxNw4K5yjRbEvdjL1tkF2WysaviC9vEJkPkI16y7ouZS5Mwx9q6S0 OlPuBALkqfoeKLzw/lXlmlpaJJh5QNLMOnc6uWv6kRivl96T3SL6WMj6TIpzaQrD4VdqUV/Gs9k PxogGUqXMbkqLSs5AgikhvFtYvxXqB82k8JARtXPdwOoC6KAGpLPRQt3W/67uCv/xbI70ZPn6V7
 C2KiRG+5uQnOCbcUgtfuGWwjh1Yd2Npbs60ny4aX8TgH3czLhzAEv94A1bOEBcvW7p4r8V/G
X-Authority-Analysis: v=2.4 cv=U4CSDfru c=1 sm=1 tr=0 ts=68558387 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=v4gRHTqEJbC_qimFZAAA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14714
X-Proofpoint-GUID: 9W6W0wKwB-BzmmIDs1BrGWowvb8Aim_q
X-Proofpoint-ORIG-GUID: 9W6W0wKwB-BzmmIDs1BrGWowvb8Aim_q

On Mon, Jun 16, 2025 at 02:45:21PM -0400, Liam R. Howlett wrote:
> Testing calling multiple mas_preallocate() calls in a row after
> adjusting the maple state.  Ensures new calls to mas_preallocate() will
> change the number of allocated nodes.

Really helpful to have a regression test for such a fiddly thing!

>
> Signed-off-by: Liam R. Howlett <Liam.Howlett@oracle.com>

Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  tools/testing/radix-tree/maple.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/tools/testing/radix-tree/maple.c b/tools/testing/radix-tree/maple.c
> index 6a5b0342941c4..49e89dfad950c 100644
> --- a/tools/testing/radix-tree/maple.c
> +++ b/tools/testing/radix-tree/maple.c
> @@ -35693,6 +35693,18 @@ static noinline void __init check_prealloc(struct maple_tree *mt)
>  	allocated = mas_allocated(&mas);
>  	height = mas_mt_height(&mas);
>  	MT_BUG_ON(mt, allocated != 0);
> +
> +	/* Chaining multiple preallocations */
> +	mt_set_in_rcu(mt);
> +	mas_set_range(&mas, 800, 805); /* Slot store, should be 0 allocations */
> +	MT_BUG_ON(mt, mas_preallocate(&mas, ptr, GFP_KERNEL) != 0);
> +	allocated = mas_allocated(&mas);
> +	MT_BUG_ON(mt, allocated != 0);
> +	mas.last = 809; /* Node store */
> +	MT_BUG_ON(mt, mas_preallocate(&mas, ptr, GFP_KERNEL) != 0);
> +	allocated = mas_allocated(&mas);
> +	MT_BUG_ON(mt, allocated != 1);
> +	mas_store_prealloc(&mas, ptr);
>  }
>  /* End of preallocation testing */
>
> --
> 2.47.2
>
