Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E1E23ED56
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745309412; cv=fail; b=pgX8tSYQclDykm2uQ6xoISyYhpV80iCz9ro6wRcM35ixuh9KtYqAxs1pj+yt7pK/9XcqoFIixoZNFQ86q8H/kb++RlZ1xNUtUiD/UXrPCVlEFby15liVlG0cbeXlmZWsOLrkmdy3yWbGZBXdUXyLUdgR4ta+Bocmwat9ooJkJsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745309412; c=relaxed/simple;
	bh=N9VWcreQKIkKQlQxYTdQkEYZjvCMC9v9olqXlRWcwAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oToFPmiEBpB5h7zno4YA6Tb9m8QiNSgzqwVjvQrFXW85iJjP8wJc5mgbAa2pjbgvMyn5hvAFkEsY44kxTm7Go9MlxorqeyRlztg21wceVEUcKtPkkmmc2KgvoV54e/TIIafxx/IfyROoPr6FFcQMKOZT0Db1g3pDR4RKcyGW6qE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SXuP3z4G; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mL4k6udi; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SXuP3z4G";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mL4k6udi"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M7NO4L008045;
	Tue, 22 Apr 2025 08:09:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=UvUEHwgbvWvHdYKMZiKN9Ao8MJG4FEQMhAk1hOqsSdM=; b=
	SXuP3z4GW4OjmTn0wFwqOCmbTqUoFfz2vxLBGR9cAVwvxn35w7LCzvAiO0rPvjoG
	DfRVF7qTD8P6FD6vX3SMbm/yc71/p5OZoINaNRcHR3ycV65uQFZrkIxOQPmGiXdy
	jNw9RYRIMwOxoV/sYb1O7JbafTHMztjXVtULNZHOZ52nINNh2Vtjn+z4+Gs/DCKi
	fzsncp/kqVGs1vex++FGMvsQ7Flwwgpx+BSh9uInz6EY6UC+yVIN3za9D23qMLN1
	HUbYoJRUV9YzYankhEv2wXjOoDK/Z8o/ijJHjpvcWC753gIigoP313JMyQuns2dE
	y9azjRhtSljb6CMXg8TdfQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4643vc4143-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 08:09:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53M6T6Ms002279;
	Tue, 22 Apr 2025 08:09:55 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azlp17010006.outbound.protection.outlook.com [40.93.10.6])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4642991r4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 08:09:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UU2wR0KqVskO1HV2oqQ3jwHZULlxI2xAbE/wLO6gZBazXObnzGQ1NoM8w5ghpjx3xc7BdzNzggPtzUv5fkY/ZViXOmeP8ppQcQPkhJjF7GmH3oLDqOYEiY9Oy6jgNq6Dd/Q8HU9e8HSoiFkGLYW5GCy9ZTu5BIHIotv/4xVEvNs//QQJP/I2Kym5eP2xteE4xoWW4qle05wpi789CsRYzIaxJpIqdBDPpVlOvpwxP06YhMFbhaYkcy+M8dDayJBhi+iK/D8+P8dRwV9RfiC7P4BsFhAI0bjpZwg82jaeIZZGkkPzHxZj3R8vha+K33SFULU/Trh2ZRJ19C7Ur2KyjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UvUEHwgbvWvHdYKMZiKN9Ao8MJG4FEQMhAk1hOqsSdM=;
 b=uXDI+TTykx3qz3vmixrxMWGv57xLfylMAHh0RpS8zPWSlNWx1VoskeimPEc94DbvK8mJk2UscliqaFyB8QBrDnrmFjafn0H6EUnShlf3HQ9bXtWMjFBe5c7PSf0A0lv6F2jzHoQ6dpj3fqvkZ7DAZlO7/+0RuvymdLA1mEI7U1M0ehzOiqOevJlOyR3Phq8xnt9JGIdpgDVIing5e2IZbS42n0wMqP7i8amTE/vcuCqABNxkwxkmuWb3TQ1KBTmOBL1mlpNLyVzilp53LwF169TgXV1mZ6kKdHFDGJz1VdrBoJldFPEtki7aSKWlFyTjTKFWWHBIOZlUQtMUMlBBgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvUEHwgbvWvHdYKMZiKN9Ao8MJG4FEQMhAk1hOqsSdM=;
 b=mL4k6udizAYaJ0KSDxYfvmepJ5cuUJaA8Cq0NL62WiddLMs0CWhV0/o3Ewo9FNWFOgEyYEpNNF9fpoSGG4UCGKgIqMJHCZvRZIBRKjYFSqWnhNPELKEoBs67jBqnF+ffhnjIjdPTvNYQ3he7bKHLsZ/O1LH3kBrAf+wsAd3oM1M=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA2PR10MB4587.namprd10.prod.outlook.com (2603:10b6:806:114::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Tue, 22 Apr
 2025 08:09:53 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 08:09:53 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>, Pedro Falcato <pfalcato@suse.de>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 04/10] tools UAPI: Update copy of linux/mman.h from the kernel sources
Date: Tue, 22 Apr 2025 09:09:23 +0100
Message-ID: <cf82eb8741458b474ea32b1e03a7f9a7ab97d9fd.1745307301.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745307301.git.lorenzo.stoakes@oracle.com>
References: <cover.1745307301.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0144.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::36) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA2PR10MB4587:EE_
X-MS-Office365-Filtering-Correlation-Id: 96dc4851-12c0-481e-6531-08dd81750fb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lUBum8WbKb/iv/8dQDzBB8z3q2jPLLryJBCv7wkzTPvSrusGUP18KqZRRABU?=
 =?us-ascii?Q?by4PjPS9RkX5/tYX8JDP8EpTTC7h5x4gfJB6uP3Y85E6eKRxX8GmXfBVcWCC?=
 =?us-ascii?Q?yd7txuXg4svSZezbIdaYBH/PhtIYFxV4C1ZZVKNh5CNEFvzvJje3dpVFT8qI?=
 =?us-ascii?Q?TZ5LiPG3tOR2XOqiP0V5RjiBNcvP8MzAlanS8N/5jX6DPVHvDJng8BcZBsjW?=
 =?us-ascii?Q?7h/lFaiK7NlSaBU++HHbDujKk29yEG79mg3nxX2SrAbav46nrR81Qm8bG5yb?=
 =?us-ascii?Q?cRnBeFQuzeSwHTUQ7IaOAHa7vIfmmoZg7cML42B29jRI+Pu8wTnqntKIj/P2?=
 =?us-ascii?Q?mRBKJPI8x83D5xxXs6Dnarz65SCb0nHlN131gjPULs8g35aojCUSw2PhETH+?=
 =?us-ascii?Q?BQTBJKF43QgT/sd5OGgJYye6CUVkOHtumJm/Ry72zhBabxpv9w3mIUiZlESt?=
 =?us-ascii?Q?MJ+y8mJPcIXpn2zu5niuCxpLiuQzeH+P1cNMbuHf8atAwN49vUoVlKk0YWUJ?=
 =?us-ascii?Q?5qIudnyIPWZNCZDvzdCq8yfXxTRQht7yJ7Ccx6jVqBL2xR9R0sce7JaT/g6p?=
 =?us-ascii?Q?/nVXTDIo83Qb9IzBzB153aeRL1TD0IrE23lfvLcJ60p1Y2HJP21PyvCJQViX?=
 =?us-ascii?Q?3YI4bMXpw+F+kY2D3ENaEKqe1bxjG8SNairkBiwyA9O3DsazDh9NOm1a3JG9?=
 =?us-ascii?Q?im88nLtdESWG5cUHmQuc9RjlsU9jWWdCviZaEHBW0VtvNzyPWSvrf7gjeB5z?=
 =?us-ascii?Q?WwFfJbiIWzy/w8xHqyg7nwE5GtxtsHKa0ZouL4mQKFQIzV1rSCZkK/j2yasF?=
 =?us-ascii?Q?m1gAwG0ZiR+BmymTF0fy11G3gCoTyar8w4o3H432fTv+Tt1UufzrcjC/TsWh?=
 =?us-ascii?Q?2bQZiQ9LmpX5lnAhqpxRiK1kX533qMEfb45dSoAuYPtmmN3iKE3AlKTx8VsE?=
 =?us-ascii?Q?xWwQnradK5Ew1JH18s9TsLce7BNG8NkW/eCGH2wIgc2KuzySZdxSO9Hbo43B?=
 =?us-ascii?Q?CbEZB/c8u49M8xZhEJ+bzDDk0cE/MESi+02fPXvPNqHfu/9eItw4WomDoFxU?=
 =?us-ascii?Q?zZbS2f6IiJBaNTsTuRVvudGg3U1XpX0WJSpLK9oVWJpVxf4DlKYGpldRz+rV?=
 =?us-ascii?Q?WkMk5p63mMqsl7KdrxDjS0Sl+fpttXLAJS8je9QSsbQHdQKqHwgOld5wca49?=
 =?us-ascii?Q?qSq0TqGy6qTNrX+1n5dGOHGqWd2WFSkkFEa8HkrYglfjCiyzrnrwtsT13+w4?=
 =?us-ascii?Q?2i5UAkowJ++njgbQRRXu5q7/iaqrYGu7+r0K6pNUxOZpuck0AigYIaCPTk/4?=
 =?us-ascii?Q?B3z/r+MUCbrpZoHPgGCil95qYAuOwFL+Sk8I92OgQ/A3eKE28xDtPPA5EP3r?=
 =?us-ascii?Q?iOvzpVHuQhhMMeh2+S2+1piHBJVd4cPTvwM35UvhnB/OPjPdQg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GVQfS2olUSbNl6N+ZsZ3BhlyBnCLCRgfhlwbbt4vmLwwIXqhq0WZOzfD5xKa?=
 =?us-ascii?Q?KRK/ahcpt921V2Pxb7AAxPinWQ5JkToOwjhdU/pncBQAaAKaq+F7u7gLSWA+?=
 =?us-ascii?Q?th2pzNkGA8eZ2et6OGcg1ZRRQi3fJN7WYKeuvHgyvn6Qo3gFY606jocSkXF9?=
 =?us-ascii?Q?anOx0qx2lstYIXRRAnQxghTSu+qD8BFuVnuPZi7kuCajOrPVB+OgBeIknPfS?=
 =?us-ascii?Q?crJ9UxpvZwm7CDaumtEwJb6bnphm4MOvA85hcWTUCRuWykOANsbzAOEa12d0?=
 =?us-ascii?Q?TNLSQu7aTd/wVue53Qx8aMtXOcwcOHws4pFUtUL/1Ez0JIbVbQSU65BLfVuu?=
 =?us-ascii?Q?QlxpJsHwfMRGy/JV8nYIBM6X0t1aWU3by1YI7mvqeZlr/sDcSsiPWBZ1gz8p?=
 =?us-ascii?Q?xFSLa3PAaLo0e10muFermoXNU4RuqIMCvsxD6LksRhwh7/jssOZEO1Ta9ulL?=
 =?us-ascii?Q?Zr/vORlL+gVjBZPYKK5rMoavThz4mGmyBOWBHd2wFp8cdYAWaswoIL0+0zVV?=
 =?us-ascii?Q?UYuSFhSkrmyWuZRHlzDTlgTl6yG8etSE2qu9w1wClz4Zo5DpdsOYxUCvscEr?=
 =?us-ascii?Q?r8qEO4TnMoVOyRD+XcY/IaRtu8S7oy7wYaLuo5uvliP5jhOUuVlnRD/djh2C?=
 =?us-ascii?Q?rx3EbC0Wd8OGt4JYkJ5cKnYdSB4w8m6W1ueKF+aX4TzqHaojc+M988Wp1Ftk?=
 =?us-ascii?Q?GLrhqGck1lsDOWGMWl7S38jhxAA8IgOs+eJIwXUY4tWvO8lsdznYoRrf5s7n?=
 =?us-ascii?Q?64lnmw56BlkFaH+dOd8Ig7Ykm7XL4e2G/NNMNUCToxhJzYXkc8OmRSf0PRtR?=
 =?us-ascii?Q?GCCmIvyT9W+01vaoXvyga63maZAcWCmOv64KwBVlK/2N71EwyykQQUYii9p/?=
 =?us-ascii?Q?R1ltmnuzU+k2soyCWVHI7Ota33kD8ird3IL8Xjo22ONVp9EQt5jWaij6VfX/?=
 =?us-ascii?Q?m2FFbjlUjyrG3NDB9uxYx9mNBm6XztHzYd3L1N0StzjbXsXUABl/J/QW4F/7?=
 =?us-ascii?Q?6Xur1mqSdDVKeCgj1l8yH69jdtz6zMH/1uQ2DlvBWWq6/yJSw9RyV3E+pZBy?=
 =?us-ascii?Q?RcOt/vJkwSxqtD781WguBaCR1FbNp0mF+t4AM6KFHjLLkJg+kOWLtuxNSrx3?=
 =?us-ascii?Q?xUbyAz7nhlMR0NlSVoZxbohnygjuGDiV5NBwWk7mokBjT18G39TfZoD151Kt?=
 =?us-ascii?Q?y7+1JOSNHMWt8Vc8O5/woTVeSpzErWIwP9tCcslbIxyu2EO/ZzBUG3bnqh38?=
 =?us-ascii?Q?Qh793TxKlq9bi1A80BRgFxfn+61icwdLYG2Tq0/FFwIrAvkd1I06EAsIcpK9?=
 =?us-ascii?Q?Qv7xl9Q4lYNG5qtCTG0DsmRO3UKTN8KJ/IZRnvHw0nbZM30ZIfVJSYSX3Uvn?=
 =?us-ascii?Q?vXPM8wECIynb2IG+Qh0VtEMfXPUhguNXK1klI3GUCpOeAuq9YWbSLhh7OlAe?=
 =?us-ascii?Q?eY14mOt6dB2zF0VNCqwpYldCk9ILGEblZaltK2G+Zo9ZHGYtadqhXRMZQNCy?=
 =?us-ascii?Q?BS1/yG6lNeyNl1aexo+ETVi6n+KM1qYjDt9FF8tYWHLzJIS0rG/MzR8tTCQo?=
 =?us-ascii?Q?ztMixsj1X3pnqgbESRKIsWL7ZEzc3PypRn7Q/nhKaNLhAwsvQAWzfIzbN2Ca?=
 =?us-ascii?Q?jQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	w5dX4amHMT00Y3stW6AJoHqCoPdb1uzpFNj8jSAh3wS33vokfqKjGJCK0tDKX+p2fZTdjfgbYvSzScwTPqbrIjJYWlE4IiEqJrWPqkbiVbU0Pit/8OHQgDPaQ7XDJvL1HDYDLTWVJ3PC3gM+tR8H3yII4XAixd8C998jJRrFLUZhiw55Hr4wpL8I7A0B++YP4f6mPOg51VPJsO8j8en4ZfuSZ/ejXDmSy2beRlfYnwjJ6axWoIMxIiFra6nGp0piXy9IKxkmJZ9Hn6AWja6nmSPXAXDutUIFbbl8FazcFFm7gA0YBgtsOdLtbeSbaNpwh3EnzXwSknoRjrRXslI81SahJKUfDAJyEmruQr8+CVoWWQ9tBlF6yjV6yPRId8NeXElyv1Nt41bQ/GvfXdWSfSALq1IZqp4r9YyVoc6EOrxbN4gBG1H5hNrxmmmZvraVm1UGWQ3kfZWjRlb3Sc9Z2PT8qZPkXJsSuQSFUAub6Zt+w6bjR62Nen1nW3UzLaP0w2oCj/pe1HkpsKeSU5FVJ6azuaAviuQyv586Qg6/l37RiuxtI/2J0SSGvF+8BTh5tu9RsOGKAPsBm/Xu1CHL0ASdQuYRqZGZjsvT7MtSrAY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96dc4851-12c0-481e-6531-08dd81750fb5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 08:09:53.1804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sae1o16edRUiqjRzg1qKbe0mN7/p+6uu1PGOdhrgPGd0MOzumeL+12FZMO98vTEmarRFgnBbxsDEIzIoQbeCAUPHbT8+BQ8bQ/q3jdZsI64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4587
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504220061
X-Proofpoint-GUID: w0JPJM_dkK9H4fbIPeFYweZecKVGwb5Z
X-Proofpoint-ORIG-GUID: w0JPJM_dkK9H4fbIPeFYweZecKVGwb5Z

Import newly introduced MREMAP_RELOCATE_ANON_* defines.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 tools/include/uapi/linux/mman.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tools/include/uapi/linux/mman.h b/tools/include/uapi/linux/mman.h
index e89d00528f2f..a61dbe1e8b2b 100644
--- a/tools/include/uapi/linux/mman.h
+++ b/tools/include/uapi/linux/mman.h
@@ -6,9 +6,11 @@
 #include <asm-generic/hugetlb_encode.h>
 #include <linux/types.h>
 
-#define MREMAP_MAYMOVE		1
-#define MREMAP_FIXED		2
-#define MREMAP_DONTUNMAP	4
+#define MREMAP_MAYMOVE			1
+#define MREMAP_FIXED			2
+#define MREMAP_DONTUNMAP		4
+#define MREMAP_RELOCATE_ANON		8
+#define MREMAP_MUST_RELOCATE_ANON	16
 
 #define OVERCOMMIT_GUESS		0
 #define OVERCOMMIT_ALWAYS		1
-- 
2.49.0

