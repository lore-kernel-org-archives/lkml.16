Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7E022B8B0;
	Tue,  3 Jun 2025 10:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748948225; cv=fail; b=VG+drVYS/7Jd4tgD6tUK4VVLMGDaRBwWHIuUdH2O5QRHQqKLD0/lXV3Ib+i6gh/j+yoAUVKpgEXPlmGMAOXa5kQEp+noyxRVZexfge+mZ4UwD+cgsEaK2Sfi7aH0slbUt2TgxlOPQG5W6b3puq8JV5rzUXXDj6Upg+W47E4jwwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748948225; c=relaxed/simple;
	bh=fUI4pAxeMxfaxPElMF0ayHuYs/Zh7f/Thm1BlfUEkdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=skHxUwDeIUabqZO/IBxzV4+3DqcjTy8raZhbYIHbXJsg1Gd/JJhGy3mVk/Y5hceFtUmr8hcNo8a99QthFviJRk+ICisUV9x6nD/EV8+an0EMyfysByVi1rYwlTRmWZd/ZCWoxc5f/515kIx5rv2L9uZBo6nNo4yLS9wytejrGu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iaEDL/sk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=bqrz//Oo; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iaEDL/sk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="bqrz//Oo"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553AEqQT028239;
	Tue, 3 Jun 2025 10:56:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=U4j2smpAHwrXK/Hx46
	o7m2gSshrZg0cj1L7W43hKcgg=; b=iaEDL/skfRl5t8TQNkN2+1TpHMF57D6k7R
	XN+KMHgEI4TsDq+GnVEdK1KmAK8U23OaeBSfPDVTlcAxFbPruXPlzuhy99yDKuJs
	d1wHNk8wYy8Fvv1hGtMui+QdKM3ynxfzTa9TpJ/A3YuzB7atAjfL/CtsxFMVVntQ
	IfFYKD5PIgEbTqkBxPDV+F/FIu6JiQSMBPUYsrStVDkQEshOJvcR1E51C6SgQpbR
	bcP8VUUzOu3MXJjD4ngOF2i/ljdZxg20zqQWOiTxSrLUqdgenNWtMtDka0DhtMdf
	YKZr3Hd8D9LWIoBkeSDrcVWo+QmiZ3mIP5xyf781xqFNXQd6qW4A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8j1n1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 10:56:43 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 553A66g1040645;
	Tue, 3 Jun 2025 10:56:42 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011039.outbound.protection.outlook.com [52.101.62.39])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr79cs10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 10:56:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fFkT5xR6GKV2c9PaijEEa8vWyTEVO+o3C0yHz5hcObBiW6yjkFihE+pH6GJ8U7UMo2SCOA65IL3VGWyhNPAmGLX3GBxkfaHTTfv4l4ZXjQQVv+myvPHjPK3C065VP7H17+nFUMe2ZMOBsxP5qOT4STyhupVkuKddXCr6lBj8uVoaPuyKeZrSd8drNW25XwxHrLhepDU636/du/CBozM5bJxTdFtKfHxSkNqTDdUh5lBaI4qmF34zpFiOqueV9saIwvH6+mgLLYo5yHXFo90X0KuxAG/s55HVlXNckSseSVVFnGFydcgc8sVuOSEMwDopJRns77fwOlkFCu4YQhX8iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4j2smpAHwrXK/Hx46o7m2gSshrZg0cj1L7W43hKcgg=;
 b=giRkdqHlXbufiwBz0HZRNlHrFRTq5CyuYilakm5ybMg9lHaWpNQIpgDUpyLGTIsoOiTi3P+5l4+XGVbz2ORmSl6XfQlc+U1FUSqAmKqeKSmQDGC8DjYA/sJTuxw4b7EvXRCIo56+jn8HEeCdyMWU1Oxs+purI3JSW3fLIJnpr1GmzY6Biw3Q/+R9ItjR+eIVLP3G1BETg82t2yQ2xDA05HDtcEavXnM6ax5iiBwFbTxmEU0x/L9BiqEtaGZhRZcRIA49Mjaak5dba6FaM1EnDwXVeeAoHX4X9qa7DEtWYtmA85bXu1TXMvuIYYb41V6NaF1oxt94QXKEpDhjHCwe6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U4j2smpAHwrXK/Hx46o7m2gSshrZg0cj1L7W43hKcgg=;
 b=bqrz//OovvfX1vSXOlgwj00YTB7haC0POHWcytay305ZGW6m4794uAIthfGYrA9BlhCdTNhAS+XddEPcu7M5yhEgrSxphFyCs3oFh5Woi7Wwxd/dbo6ls1B5dV1nOxDM/CmyCo6To4wORQrL+xizNepSZvfiNtK8POOPOT6nXUM=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM3PR10MB7926.namprd10.prod.outlook.com (2603:10b6:0:3d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Tue, 3 Jun
 2025 10:56:40 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8746.041; Tue, 3 Jun 2025
 10:56:40 +0000
Date: Tue, 3 Jun 2025 11:56:37 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Suren Baghdasaryan <surenb@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Shakeel Butt <shakeel.butt@linux.dev>, Jann Horn <jannh@google.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/mm: expand vma doc to highlight pte freeing,
 non-vma traversal
Message-ID: <9fc9ac50-abce-48bd-979f-2e00b26917b5@lucifer.local>
References: <20250602210710.106159-1-lorenzo.stoakes@oracle.com>
 <87bjr59634.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bjr59634.fsf@trenco.lwn.net>
X-ClientProxiedBy: AS4P192CA0035.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::18) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM3PR10MB7926:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b5e42f9-7cc3-468f-acea-08dda28d51af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pqfJIz5/voITn0ZZEdgSpPL6vnrBgUBjmFSb3xclMQzZkXhU+BynqVU7BRfk?=
 =?us-ascii?Q?yQK4ydqrJKgNAkAncpd/ry7GMXTmIKmcndXhf1J40wFFafBzT4lkcuXwInCf?=
 =?us-ascii?Q?ZzbvpYsDSe0tTLCLNWSOe8FKRsrEJGmfRpcNSDsZAesbKpbjAgsgMUZpTdQq?=
 =?us-ascii?Q?z5KiSC8H3IxU0kDXW0OMuhL/IXY3qxMJYvOn4blA7FLkGdadAiPozSf3ed3M?=
 =?us-ascii?Q?3cJxHOoLY1/jfH67KIolDzudeRHRh/kBltazL8RTkDVbwn9pHijiqSJjvlCo?=
 =?us-ascii?Q?skBZ5FOXE6wV/h1nHwlHM6t6577S+6tMteevQrlV+BDq0rCZAfnGfgvDlgkY?=
 =?us-ascii?Q?E4gJQjs0+NIKw84LRxHzYhqHR05UXfq9QprEc1J6gob4yOZNdZ6upklnxA2M?=
 =?us-ascii?Q?9WvjsmKONgvHqKUeFN3iEHZ8XqIbHE2X8HFal8ST12lKH1tDMwS+ibBzyFrC?=
 =?us-ascii?Q?MOxkXYyvTSg371QA1MD7FHMO/jxmdyZJ/5095j/wAQjD8iSFARv1sWjLqmx8?=
 =?us-ascii?Q?wdIyLiU6a8XJItbAW6R85w/6RHTPJRGl3wPp/XpX5zMi15gqbkKvYQwxdC++?=
 =?us-ascii?Q?fbbdn4MZrYWx1V89AihM/RVL+pUFj8N52zvdo/FeJV9YJpLI2Y6G/zOaFGiE?=
 =?us-ascii?Q?dOTA1GmA8TxAWc0cnGbRrYoWbpV4r+30NLpvlXeDzOnmsW3LbZIPtY+4wbYS?=
 =?us-ascii?Q?gIllhAVU63hDVivWd1/P9yPYpHj7//uT36tAPrzaJ7IILbyEQaejquvLJVw9?=
 =?us-ascii?Q?UWoYXhwUJMfC6c0Q7es8Nm+Lm7ZLn4a9b+zo0reC0qp9D086RsRpoGH19plw?=
 =?us-ascii?Q?HeNnc1uEOvOpUztNU021/09wmQi8doBh+f8GxOmOQEGnaGp357S2F0JOzr5B?=
 =?us-ascii?Q?4in+R7UdkGBcNRfWYT0xKJ1HQiF6zGYDEocM8QAONynd7Ts+ma0QMlegIy9n?=
 =?us-ascii?Q?FzNAGVVAPWo9ryYDPOWXY5jfbupu/hAH/Jf4B4HNK5mo0uV9owMTdEDRw6/J?=
 =?us-ascii?Q?Nhofj/iDxq8hktaO9Lizo16OVcf91BeF4D0oJLSiF/kEANjRIKZW7HOCyf26?=
 =?us-ascii?Q?+rvD867P1zNVw3HSAFdlNyEM6gwRLufPkpPGzyjVrZWoJzeNzNpvSS7j0pkL?=
 =?us-ascii?Q?Pxx9fKkpHe9OhJn1wFvp/B5jREsYR79nLm0MTzJ9SBGG80gHsHoiDp7HV6w9?=
 =?us-ascii?Q?6+dq1wOo4k+aKzntssTjagUSR1PreV7G8hhnqI+7eMy15KoBQLYq0WO/LuMm?=
 =?us-ascii?Q?8zeK/o5zP/nJdelZSOBPku/cA4Nib/QhJTbF+XKPaGmYtu9TtQ3khbSP+yYX?=
 =?us-ascii?Q?1bsYxJFZXfYHHEFvbaTfN3kNkbrdqVk9KNXqT5g3vgP6oNk8nUBLwJmnTw4g?=
 =?us-ascii?Q?U3JjhkpkzO2lWVycv/PxKRBPqP6tgQhkPFB5q79ywAfEQ9Mjy3Bptm2oQp5v?=
 =?us-ascii?Q?Z78QIXuW7eo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c/UqP3o75mtXZQmdQp0yJVOqaifN/LD59CN1wtUx5p0nKpeSMMq3Z/btusVN?=
 =?us-ascii?Q?Yk+LC+cwHOqJQnBE+FqR5XtWVdF5HnfyDbfWJ7WueN/QKi0xsDTrArt6c5iP?=
 =?us-ascii?Q?p4KW6LFANzLQ+kYpHg6eebR1RHM40DwRFFMGZ7lIWJrzbjFnmFxn4K2Rs64T?=
 =?us-ascii?Q?B6gR+NK6IfNVeIfCqESgFOHZPQJNxHdwiFOs84xl7o9yvbgdbXSZig17dan5?=
 =?us-ascii?Q?uY8cv5qZL7JRyjVFNAw5uMQVnES4tzSc6vO8ouxumVB47Sh59/4bQIJPwBfC?=
 =?us-ascii?Q?1z2I6AbZ2Ql49V1mt+GYTt/RFBTPcKkdjynDebuFpUGz1J1t/znNYF/DeXjQ?=
 =?us-ascii?Q?YhMb8dpuD9amI+ejF0LDsXNF299KLSUbi4yAc9ZFzyhTNpYnllIXwta9jRPt?=
 =?us-ascii?Q?eSjYJ4HX19floHcoJGNnySzaGjm9nsYC9vqcwULFnfduKtZrDr8Ox9irlI/k?=
 =?us-ascii?Q?9oa61yem1lc0Kya+qeiJ43r49XzFEtvByIb526ghmnwNOieOoLN+YPo5XJX1?=
 =?us-ascii?Q?zMd/CiKRk+z5LHy4eYKdRrZbKu+EY8GJtDFJipfArZrb1cIfWKK24oSY2u9G?=
 =?us-ascii?Q?dqHsP9FX5/hNFaInW5AE1gvdF4Seby0oiZUGSxFYdZT+HWOBJDT5iPVx0Eau?=
 =?us-ascii?Q?5CXmGyVmNozV3YMkMUvy6WLYm946vTBBc4xYDBGrLk5dVaFT+AsrwYAn3Ae5?=
 =?us-ascii?Q?iAau/k4W/RzUBtkEgKI+e/YGnU38nlE7FRgPLCFLBKNWhSSEptspic7bZT9w?=
 =?us-ascii?Q?mJ0VJYrWfOqeF810x1ZsSBETEyx+897x86p5AF5LoX/7tgdDWN7e/JeD92hm?=
 =?us-ascii?Q?4yEnD3icWySM60p+t9Co0P1lChkfdAf+Scaw+AQ8unC3HYFKvNQZ0yxQMA50?=
 =?us-ascii?Q?TdR5VnfPh7NkIZOlCW+OKUAF9l8Fpm4nYDiTk2rgLIP5IgX7D6cktx2Naduh?=
 =?us-ascii?Q?3vOZwYMAPk/pBpZHYddeiB/igAYQShJeegFA0WP0qn/Y7a+32Lp4JAJnFLex?=
 =?us-ascii?Q?7GAwMhWOCqRvGiCICh2munwoai1Jz2JW8og/nxsn9SJxt8h62lXBQlrNvupm?=
 =?us-ascii?Q?ursaaoExlSx6Dq5y/Jrwfk8Ll16Tn3cYLzW0+SEKGvgESVG6eMa8uQRzpTxr?=
 =?us-ascii?Q?vgwUd1+tlSHOtjqqztRu6U43SxqpuH09q4+d/nCiPTO/VaQH0ekjQWt77S7/?=
 =?us-ascii?Q?buKsN/245QZThQ70dlru5AJTaQOvFOqzzGCa8wQGAPPZqGgoycZCdbSBQyoA?=
 =?us-ascii?Q?1PRS8zYXZtBgA3DdM7Xyj5FM8mVr921Vd5G+oUVC5gktAXzwFBkhz52gV2kD?=
 =?us-ascii?Q?cuwMfjlc3gK3gQoKp9Cynwmfm5v1KJ6WSrTVLtXIxqk+7cUIPPrB+tfbz858?=
 =?us-ascii?Q?NaeiFllAp9i5/LiwhxAoEKWBBoZpWevuxmf5JNf0c6R3xCq49NjtIE6TyEK9?=
 =?us-ascii?Q?WJOtm0i/4J4LQCyexJUp1awH2Rt6Veg0IOM6xAr3fe6oOYnXOqdu/I5xaxJF?=
 =?us-ascii?Q?+4hVMi63ieQQIzWffBy/SfLZi8P+Ex17EH3mTN1XCr+Ok8uoEdtEXXDelV1P?=
 =?us-ascii?Q?6UlCVrZcSaQo2gPItyFz4rtFAFofUdu46G0a6Hy700BzzJ5IyXXn1j35bZKc?=
 =?us-ascii?Q?BQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VVSeuyFU/Za9oh+b4NpfWTsQgiPN9PQiobJ0XqvIKTrExQqfXKPtJSA0tVVSxU4tEhbRMJI+WWgz7KtySzv2QUB/qr8Xt7ncPjtgHv6JYgFz/HyGyD1Ps1jehI5NO8/3CJBN5mORQMTFruFW8Qd/LOL23GwzWbDR6TMCZFQznI81ghWeJC9GS3iX6hqeGdL3W8JFG3PCZYGjf0GQJobgJl1116RtfqYVn6/ZilajRWTWaQqJ1u54bTy9DDo0QqpBiJbszbgc7rsygFpvEnHMEVJG82cKSBGJOvjA9UM0CmDxwdWyFVH4PLqOxwYT9E1t1ee8Lz2PecjfUZO6Ktwah712mL7/+Z5587WQ9TXS6brzUNqxvIXPqp3lQGLeuVNikQaYP9KabTHqXA1V1h3DKeeYjIjWtpmjk1TVPJHqnwSqH9y/8qXMR5xB0/y+8HHmTftee6HbOwrXL41BCcm5RzmhFjm2wf4dnb33WVvDutiZwZ6wTWfxoKOvzjR++YyZf7Da32s6L5dpwc+isc+JsoC+KR01HjcapqcTNN6CX1pckjn2xJBAMz/0n8FkaX+kxXP31rzXq+MJ9oJfPTiAL3UGzOoCYgeQuhQXQ8Hi8wk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b5e42f9-7cc3-468f-acea-08dda28d51af
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 10:56:40.1992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8gbpeOL+0wIMsrir8NOlx0/QgIKXFxiaHxDDi8YvqKOkbz73SUs4iPQZtpA1UTbgxUA/eZhN6bfx5K6/B4TYiBA27GvzGCERyyGIfGlp5qo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7926
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506030095
X-Proofpoint-GUID: 4HNX10PRGzm84_gaaE8Cee1yAI_lO6q4
X-Proofpoint-ORIG-GUID: 4HNX10PRGzm84_gaaE8Cee1yAI_lO6q4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA5NSBTYWx0ZWRfX7SWfQJK7qFbb n21BY3Dtii+/d7AGtINes+eI/JliQwDy3/qAH/Xx9GUiZEYu2J0amcqYPE6RHSND5p2CStZOh5z VaHHJvqrjGSDy85BZqffoohUQoDQtmKLQrDN3rfiScNfDwMPJg4VOnFrUwY0LhoJmVz9FFDp341
 xMXseKWqqyJ3Tn9HpWnoOu90O+sTrDXIDql3iPMJ5y2WzMSAXSf07G9foA4Yaqgyc6yCn6jLchC IeKjnExorjMW0zYBhGIkHDY62T6vg/YgAieN1ZCJn6vZOeL9YnhOOCy1n7QsY5AAYzpnYPkiQL9 4aPB2fqJT9HjCCoDPHjs83KQJMf/qhV9AoGyLzxz/nJylu0gUKg0KXAsxsFtbH16ahd5Km3OllM
 Rk7UFDYHcc8uqD1UwQ2GMNbsOk/UM8Ywal9lWmPSflg6bGwCntvNZomY0jCTsFVdad7WxeQO
X-Authority-Analysis: v=2.4 cv=QI1oRhLL c=1 sm=1 tr=0 ts=683ed4eb b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=X1B4bhp_suYpz5SoF0kA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13206

On Mon, Jun 02, 2025 at 03:38:55PM -0600, Jonathan Corbet wrote:
> Lorenzo Stoakes <lorenzo.stoakes@oracle.com> writes:
>
> > --- a/Documentation/mm/process_addrs.rst
> > +++ b/Documentation/mm/process_addrs.rst
> > @@ -303,7 +303,9 @@ There are four key operations typically performed on page tables:
> >  1. **Traversing** page tables - Simply reading page tables in order to traverse
> >     them. This only requires that the VMA is kept stable, so a lock which
> >     establishes this suffices for traversal (there are also lockless variants
> > -   which eliminate even this requirement, such as :c:func:`!gup_fast`).
> > +   which eliminate even this requirement, such as :c:func:`!gup_fast`). There is
> > +   also a special case of page table traversal for non-VMA regions which we
>
> The "!gup_fast" caught my attention - I was unaware that Sphinx had such
> a thing.  Its purpose would be to appear to suppress the generation of the
> link that turns the cross reference into a cross reference.
>
> The MM docs are full of these, do we know why?

Removing it from the struct vm_area_struct struct immediately give:

/home/lorenzo/kerndev/kernels/mm/Documentation/mm/process_addrs.rst:11: WARNING: Unparseable C cross-reference: 'struct vm_area_struct'
Invalid C declaration: Expected identifier in nested name, got keyword: struct [error at 6]
  struct vm_area_struct

And given C's weirdness with typing I really prefer to be explicit in
referencing a struct vs. e.g. a typedef.

At any rate I'm not sure it's all that useful to cross-reference these?

Any such change would need to be a separate patch anyway or otherwise this
becomes a 'add additional documentation and drop cross-refs'.

>
> I would recommend removing them unless there's some reason I don't see
> for doing this.  Also get rid of the :c:func: noise entirely - just
> saying gup_fast() will do the right thing.

Re: the c:func: stuff -

Well, the right thing is making function + type names clearly discernable, and
it just putting in the function name like that absolutely does not do the right
thing in that respect.

I feel strongly on this, as I've tried it both ways and it's a _really_ big
difference in how readable the document is.

I spent a lot of time trying to make it as readable as possible (given the
complexity) so would really rather not do anything that would hurt that.

>
> > +.. note:: Since v6.14 and commit 6375e95f381e ("mm: pgtable: reclaim empty
> > PTE + page in madvise (MADV_DONTNEED)"), we now also free empty PTE tables
> > + on zap. This does not change zapping locking requirements.
>
> As a general rule, the docs should represent the current state of
> affairs; people wanting documentation for older kernels are best advised
> to look at those kernels.  Or so it seems to me, anyway.  So I'm not
> sure we need the "since..." stuff.

Sure, I will drop this.

>
> Thanks,
>
> jon
