Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DEE1E3796
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 15:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738339156; cv=fail; b=EZ95j+goXlQPBmj4mIEB5QcNhiLEYLLf2/dGHmcQsIQ9/CDHclO+Y//4J5bRie1RUWgFywTJwiR/AxkOdiYgCfQTEDL9VDk7C71eeMSi8IU9/9bbas07ZelUVn03NnhfS80Z1nmPH5bTxWrCuhZcPHomQ9DscaX9r0j3z5HaylY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738339156; c=relaxed/simple;
	bh=fSJOc1BB4FLWCoc5e4XkUYsFWfpdg3rorWZAReTWa20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=o3/bta5ih35awXZwFwTAVFoRMkRI+k8sHbCkyeLrf8B9P/clQppBiqXtJd+lvZVNmtirC2RHhxNNuQmVURYPp5vLgCxpbfhMbVBTwYhtYq+LdLoUUch/gQsaBl5kHey0FKDAfSYbB5f6t3MMWcfpjWtg5tb2cN6L3vy3hsBmzPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QaRJAsRf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=N363wvqB; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QaRJAsRf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="N363wvqB"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VFvO6G020792;
	Fri, 31 Jan 2025 15:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=w7YIgGttC06fLvkxoI
	e67OC1gCiPMA3VsQKXMuWBO8Q=; b=QaRJAsRfFSv3CRlJ0aaS7VbIMIBka9myaL
	24m5eG1f17YjzoiiftHLNNe2Wkgi/UkaOouHkcjSBI89rHriyY5Tld81ZGgebjLD
	bhE9uq0wc6DbeEWmy6N437iAFptcyUiO5HnsaqNNGzW7O+fSEiuHIO7nsEkV8iUq
	BLSkcH+uKE19gy4r41sjTENbhb0KGCJzJdzqfveIFC9rKlJNu1kGUkc/KxvAJBGV
	qLsk3t2Sr6kPiUtBJrUB3s6RQcY5Bvxpn0f+eFnnhC2U5qCGM8JUDrVNr8GLDDe/
	NQ0AQyBk13/28pqP/tDW4N7sBo/nC0tRCFACk1Q4gZPxIZwlgonQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44h1kx0057-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 15:58:53 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50VELloc016688;
	Fri, 31 Jan 2025 15:58:52 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2174.outbound.protection.outlook.com [104.47.73.174])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44ggvkf99r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 15:58:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8/yQQUhm1abtJzEzgXrVVi9+MHHFyZpsM8wjoRP2cjDhW0Pk5Sui4N28KK8f2vnatqkT+hIE2mGw7H4kSXV/MpLdlZv9WGHu503dt5UQoIAwqjPvd78z6r4JHh8VC7gmnGKPmeMaLNDQu3ZKekJb/hi/ySwPvOdRvumTbC/ZET4pE+i4kq8SCOSYfpKjibrfLuEmqP98XXgGjQgD3SrqeWdgHf25gZQyMYoFwXY6wNQVWBb1itlJ4jDmzCv5y943qr6XjMR7OK3UY13Eh9SQD4swnOyz5SkyFIDiDux90xLlXc8sOKNPxAZ3+AwDTDSkMKli5RzVox+6xP7ZxTiRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w7YIgGttC06fLvkxoIe67OC1gCiPMA3VsQKXMuWBO8Q=;
 b=jj6towcD2GIDv8eSliuOi5v28qgWAb7R9AEhesbNhA8qRHT3n61E0kTWeM+jMgflqGYjTYpWmIxs3cl6419Rk3CSV4+ZXYi2TggPCibJ+odU10hAplm0tQz8YBd7AQUxShdF5x5gDzPltolr2/l6CZKR4yhdclAbb17lkJ3A12VDlQdZibr5vEjScWQLdx9vLby+8nxN1UJN64HWIuH0gieZUYfL2QAUkQuDjGi/ehmEin1rYn+QcFU1qVIfw9FLr5R2Zz7zKNBDzKGSiztr9Np4rsX8SkD699TG70ofm4s0DxP/cYpvhxSGC9cUrM3PlyGbOZUsLMClcvxpQ4857A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w7YIgGttC06fLvkxoIe67OC1gCiPMA3VsQKXMuWBO8Q=;
 b=N363wvqBVxvRMKKUpHy+YO/IGOpu0P1O+WgPrCtPgPgANan8rRgTQRlMi5BQo5uqViZP9Fg1STa7iqAI99hHdUa06pYnLsAr2lVtv0nioMKo9bKKMl++dQnz+I18ylgC/fBFtCs1X/jdI/7ZVi7ElCJJwYmfSy9uBH9NvSKtJjA=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by LV3PR10MB8083.namprd10.prod.outlook.com (2603:10b6:408:283::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.22; Fri, 31 Jan
 2025 15:58:48 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%6]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 15:58:48 +0000
Date: Fri, 31 Jan 2025 15:58:45 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: SeongJae Park <sj@kernel.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [RFC PATCH v2 1/4] mm/madvise: split out mmap locking operations
 for madvise()
Message-ID: <e24df578-992d-4a89-89f4-04a6d7307a10@lucifer.local>
References: <20250117013058.1843-1-sj@kernel.org>
 <20250117013058.1843-2-sj@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117013058.1843-2-sj@kernel.org>
X-ClientProxiedBy: LO4P123CA0481.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::18) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|LV3PR10MB8083:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b6b07ce-4e03-43c5-dff5-08dd42102641
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PDyn5JGIlTLRyYjJbnPyixQVTcQnuNGPciK4T9DRhfVXdevLQgAOB+FINVop?=
 =?us-ascii?Q?p5mVZ7V6Qhr5OsM4b0FNDdQXcNOxeqkldMH8MpWScnCmMD5oEldq/SDMb3M7?=
 =?us-ascii?Q?d6q5wICS5Qfal1UiHk9pHDQvgkSwFsiPw7tvtDcUI1ctVGCSuIc5N8TtmbXa?=
 =?us-ascii?Q?5mimKuuG/VCCoGutD7V9UGiPrY31e8fwBEHghIJszI8J8UiP5d2bSZtn1Zgu?=
 =?us-ascii?Q?pogKBbZT5REzKIfT/xZwob57kFiCSpG32R8fNTj+G3k8+CTOLDTw1kS7J5ug?=
 =?us-ascii?Q?oqp/HstFvMhf0dD/Pa/xhMQlTNJl/gUE74xHQdUSoMFYq9N1eSBldq9E0vdY?=
 =?us-ascii?Q?f2SyuvU5Ymt5IP9sgmg/skBGrlqS2JRZuw1w1GyWroSZvt2G/23NzTNLIV1p?=
 =?us-ascii?Q?pPU9yQHvWN7HJGrmVepI3TG9+E1YkkGfvfC2YoALgQYbkA1deGL+lL95tm/g?=
 =?us-ascii?Q?pI1uC+qC+EmJqa5ZfZdy5ybvWVxQpOD1dh8pf5XJqxqs4Er8vLYruZs88I1F?=
 =?us-ascii?Q?oM9M+82DoF/0r3LvLIgnGHCcd3L0AeHXvYU2eo3LONyLKceWVfShlFt+yFb2?=
 =?us-ascii?Q?l3AF0irQcRcFsrPKQbE6WpN/u4h2nHQ5owBlEhsCLHdzbX7HOMc70Pq2MwKT?=
 =?us-ascii?Q?H4CIdc8qGM2R47kkpGseYcAcxjp3zdCgFYqKTp3YdLAIwh1Zzx383Bvqw8iz?=
 =?us-ascii?Q?48dujw5v6IwI+Jr+jKfJlfbb7aUuT+0vxp4JdwV82UNnSLi43h431iciLLWj?=
 =?us-ascii?Q?pJATEANx8fW8jZA23tQUNmmZSMU4jW4NCpMfprYVs3NHOmWSEsoiCWtLg5n0?=
 =?us-ascii?Q?YjKDi8R8xNbReQD9wr8s0Fmx+6RWJ5zlyovgz3lw2wuyk88Iotaakb4Wuro0?=
 =?us-ascii?Q?wfFhzAtXQllABmqwYdc/bm5idtLC1q/1lQOIv8MPMBEkx31NVxenzqW0uqnI?=
 =?us-ascii?Q?jB8jQjT+34kVtFq/i+RVYV+H8HkV02Kmphxmuh8aVtgkDBemil8pyWRWiq4N?=
 =?us-ascii?Q?AGUS/3LmKXiFVRhtRY8XUulrLqPY+B441ELPUZOg2Pcgf6zr7U2dtnXPJkHx?=
 =?us-ascii?Q?xDOukIkYxIUzWGn/yUDkq6Iyv3LZCPH6KfWeAKCtSyMqzLZW4k+AvafrydrV?=
 =?us-ascii?Q?iSAHSNDOdW6rPkZQ4JRaQEs/XZjFJ5IsGRKEqyMAaCmwrvXg2Qqqhn2uFOK9?=
 =?us-ascii?Q?WGI74OsWcvNKtcDj6Q+d+ke/9Js1/atCpfVSq1H/7hb6thD6LbWktDNblq17?=
 =?us-ascii?Q?oW37HDef6mZPz130xpTa3MWfjJooSi4YheUNueEJBQR/vBgx5/RvvmUFuv6O?=
 =?us-ascii?Q?QocDY0oXQ2etPIcY3YMztGkhn3gRp7XGxxymtQLK0V+e7q9QOkG8/9lnsPzS?=
 =?us-ascii?Q?AWNuund4OkfIm+48NUeuyscdcipF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VhtT5nHEbpwZg5SjzeIdpCEtRwdtpA03Dt5IkZeBZvliFJqd6E+E/LSAT+s/?=
 =?us-ascii?Q?9gXkdI3ily5nqjM5krEMkh/JI5fgc1uKgGXxzAMGnXcx/uJkfr93wFhE/Bk9?=
 =?us-ascii?Q?Ph0oYlqGLzsw3tjvMoSkxliPycmrXvrrhNzYkyc4kEQbJ/KGrWzapdWzKqWf?=
 =?us-ascii?Q?s7zoqczxkih4SrWh5noQO++gi3AtcwKTgPrXq++i/Y9/62IAMhIGEEDeYq/a?=
 =?us-ascii?Q?BqKGI4FsOFVWdeuBrgjGCkJyn8OG/fYuyD/Au6JfvDo1705SHfjr3/KVb92d?=
 =?us-ascii?Q?tQE3nwfou43WcOJyNVsviExvIR3an2Q83LHO54k0uVlSz4NPtB/wCuJ1BsT1?=
 =?us-ascii?Q?6E7lJ55lkQjpDMZ8jCTgk/rEUudvix3hFTr3yyNCnQJORNaXzfGlEgeTM+/E?=
 =?us-ascii?Q?G3MPB5Paz0XxulaW9W1U6vacI5PTOsjNKTDnPvVvPWk6Yk4ai2CL8lbJQfew?=
 =?us-ascii?Q?7gw5FIwlzr5CXOPmCz7zmwG5KsdWUI/EGyUVMH0GCLqae5449XJiPd+qEpiz?=
 =?us-ascii?Q?m7jcKvPSFqZ9Nx7UtcDziKcl8714ANUBcftprokExMfNiav1bEcMKvZz5ctZ?=
 =?us-ascii?Q?oNxPzbXebc83ukM2+rW79dZnl4stlckqk3LiZ3ULtBuaOEi8K47ousYbb8pw?=
 =?us-ascii?Q?tSiL1el26dNYQ9NgXrioQgjTTywYE9QTd8QUV/wb5iTKoZfyuuM6HiN/Kxg/?=
 =?us-ascii?Q?YBGjC6bWEp23UPYcLuYBezauix3z5885v8Sr3+i8nvj6PbJxFxHdcmgWcumC?=
 =?us-ascii?Q?wLbbDtFlx28+8dwpqbHJALPafe9S+9YeDVk5uPTz9bzeAKiEnaCiQhhUp3HX?=
 =?us-ascii?Q?OJUO+VrXXIjsGtdSETFKBv+FaEO1rrAHOM7Dumv0qIxUI/fKL3i0N1ePEI0W?=
 =?us-ascii?Q?Tz6Q7W4w97VKf4oqMKhdsXrSgZVMi2PzkrUq/6efDZ0dnPRl4OPsy5a4rOwG?=
 =?us-ascii?Q?qF1qC3QUAMpm4oDN3czNTE9SUdnL4NL7/iUR6Zmn2Cd6cklvo4szi7NciLd8?=
 =?us-ascii?Q?yqZNiPzGJBS9HmYNdvOLIEdywY/wbK0RWtJDDH1C45Pj6hKO6Y4PYb2mIe44?=
 =?us-ascii?Q?kqgdD97SoyauGHIxRt5XfaVfPYQROEbgkrYaePctbGCPBSBAvehWWTeHgv7O?=
 =?us-ascii?Q?JVwiTh2Al08+HEvfT3N0ZQuL/ceWI0Eh9ltkpwY27Zfr4RnEUrqq5E3Ee7JH?=
 =?us-ascii?Q?lNFHvDt+DLjt2kJGr7QWG2RT5sAqSEC+kCUUV6Kd7AJJaZTqEdxkY29acz+v?=
 =?us-ascii?Q?wZEu08REesjslPwbyj77k3jyCCJkNSxxS64YYTFmJGIaiw1u71GvoRm/8Bxl?=
 =?us-ascii?Q?V3kJ1+Wj7mTtTUoJ9AjQHMpui5Q/sRIN3Lc6kWngFkdg+lW4KoF5z9V6V9q3?=
 =?us-ascii?Q?fRJng2OTvTzeY/zgvIxth6Chz7OQday/uV7YHFzHsHeGeSB0RaCL5B4fCwK8?=
 =?us-ascii?Q?5ch7qJnNSntw+rX+genvo1oDzwuhOE5cbB9WmnJNVNMVvmMcg45EUIN4c5uZ?=
 =?us-ascii?Q?sSQHpghbS8WO+mjuGCFw24eynCLkaQndr3vaXS6K4nwIDb081rneZte1fAAU?=
 =?us-ascii?Q?x0TbmMk98XJByB8hyFO+Wq+lGHbfU5/vLz3OwRYmtlvKwthGD9N3cQJUvtox?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zYHB53VLY5KPy3w82PjRZr9DWY02AIJyW0Wofz3U+QMOYjqCfzEQ8VAYwzs2EOEHsKLTLHuecIF8sgUZYwLgB4ahn9mGPcWfeNwLLN9qN1C0/DML9KYApl8KyjATZh2g+uclHorY+bXQ4Z1MR+FpXVInRZvd22hBTeNn/IIS+9LYXd8lVW17rJ203Jem/RlFzToHsGbsAfgtWy+4PP4DLiCHl6fbq+uwDMBvP+/A5bmApxiy+cd+hnMUllUXHLB3OvTxth5e+ntv+N9t0GnRZz/DMukFXU4P7Fft/ZIWJL+qZTTSUP5iOSo6BK5e5U5BHEZlu98dC/jRqZbZVQU/z1ziXhb6Ss/t7SXWPlZ4Y/4ZgxyBcwdpBplK+SrgCWMUa7dW9jIvmzd+4mvPGfzOi+dwG0isE+WrSEMf3jSexN3Q5AlPjjomGmwekcNS20kQ81XUNpgbxco0Hf9GZTocdEglZ4mcMOuxmPszPN6nOJolQqfk21W17ebZVpHt3pCTCc979y4+hl5l/8PVcxa35lXmgwBwwDSlJDBa+T24s2NzDb1s6cXAG6vJHsvPogU+GS0BdIkc9ulgDMK2A80fTvIFZ4Pq3ZJiJFe+E1c/+Po=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b6b07ce-4e03-43c5-dff5-08dd42102641
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 15:58:48.6831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ANWGwfA6Mg4VUzTq4VmrQ5X5DZhUwBzEPrHwPk0vU1YJJqqsioBsp3frd/LxsBx1X5YYmX+MwN2DR6bSXYxygqM5rFKGGN6TWX7ptragJ6g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8083
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_05,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2501310123
X-Proofpoint-GUID: R7aoggcKYXbo550GxgCkDFPupZihcbxY
X-Proofpoint-ORIG-GUID: R7aoggcKYXbo550GxgCkDFPupZihcbxY

On Thu, Jan 16, 2025 at 05:30:55PM -0800, SeongJae Park wrote:
> Split out the madvise behavior-dependent mmap_lock operations from
> do_madvise(), for easier reuse of the logic in an upcoming change.
>
> Signed-off-by: SeongJae Park <sj@kernel.org>

Looks good to me, a decent cleanup regardless of application.

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  mm/madvise.c | 45 ++++++++++++++++++++++++++++++++-------------
>  1 file changed, 32 insertions(+), 13 deletions(-)
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 49f3a75046f6..ae0964bc4d88 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -1565,6 +1565,33 @@ int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
>  				 madvise_vma_anon_name);
>  }
>  #endif /* CONFIG_ANON_VMA_NAME */
> +
> +static int madvise_lock(struct mm_struct *mm, int behavior)
> +{
> +
> +#ifdef CONFIG_MEMORY_FAILURE
> +	if (behavior == MADV_HWPOISON || behavior == MADV_SOFT_OFFLINE)
> +		return 0;
> +#endif
> +
> +	if (madvise_need_mmap_write(behavior)) {
> +		if (mmap_write_lock_killable(mm))
> +			return -EINTR;
> +	} else {
> +		mmap_read_lock(mm);
> +	}
> +	return 0;
> +
> +}
> +
> +static void madvise_unlock(struct mm_struct *mm, int behavior)
> +{
> +	if (madvise_need_mmap_write(behavior))
> +		mmap_write_unlock(mm);
> +	else
> +		mmap_read_unlock(mm);
> +}
> +
>  /*
>   * The madvise(2) system call.
>   *
> @@ -1641,7 +1668,6 @@ int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int beh
>  {
>  	unsigned long end;
>  	int error;
> -	int write;
>  	size_t len;
>  	struct blk_plug plug;
>
> @@ -1663,19 +1689,15 @@ int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int beh
>  	if (end == start)
>  		return 0;
>
> +	error = madvise_lock(mm, behavior);
> +	if (error)
> +		return error;
> +
>  #ifdef CONFIG_MEMORY_FAILURE
>  	if (behavior == MADV_HWPOISON || behavior == MADV_SOFT_OFFLINE)
>  		return madvise_inject_error(behavior, start, start + len_in);
>  #endif
>
> -	write = madvise_need_mmap_write(behavior);
> -	if (write) {
> -		if (mmap_write_lock_killable(mm))
> -			return -EINTR;
> -	} else {
> -		mmap_read_lock(mm);
> -	}
> -
>  	start = untagged_addr_remote(mm, start);
>  	end = start + len;
>
> @@ -1692,10 +1714,7 @@ int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int beh
>  	}
>  	blk_finish_plug(&plug);
>
> -	if (write)
> -		mmap_write_unlock(mm);
> -	else
> -		mmap_read_unlock(mm);
> +	madvise_unlock(mm, behavior);
>
>  	return error;
>  }
> --
> 2.39.5
