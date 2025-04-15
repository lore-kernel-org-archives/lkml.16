Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F2624C67A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744716567; cv=fail; b=Z6bOEb3JqyZJJPFwB20K+51yGccy+82jm/C87i67/s5vTJX+xMaXEJvPv3RpS9J0zoqy3LnhfD0uF4U33m+XfneHH/27lKMujGRx056Qc2PatZmqftwNFObs/IaPCduFqH8N4QtPXYx/1FthRWa6lx/6o7+DsnL5wOToFWuv1q0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744716567; c=relaxed/simple;
	bh=x4nMv0bctTfMOD9hb3dKEHcw4K6lEWG1zKsuxriUrWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=O+azgWlN3zJY+wiDP2hpQ0GdHpJaBm/JYuJ8TEzdctTcM2Oox8z8s0KLha6eaffld4T8SqErXZkwe9TTJvRJpTKxGEiHXvNHRSWdTRKVq0PwJq/OHytQwHVmLvQHFkysRYfvwxKz2RHSGH7PxeqlyM/AIS67CpEyo6aXa/xc7Es=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GCQIKozk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TVilXsHT; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GCQIKozk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TVilXsHT"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F6fop0006409;
	Tue, 15 Apr 2025 11:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=aFq42Mj5IWxPqX7QUQ
	IHAmDRgFsKtOa6pIJ78brCQYQ=; b=GCQIKozkKFtVcJB31qso0K9zq1IL7w1kIi
	9421Y0I9LfBLF4DyJtdHaOQGdxldqdzysMLbfzvSAG4Fwqi+jNXBheK5bOIKO+38
	zAF/VSHbz96JhvxJC3fJqaloQEKwYbCVbK3cdn7b2pgoAGo1rLHDGi22MYr052zG
	3dcO7GFUWV4tuv6QWOVA+DXqgdtSryWoeThX6W5x6k5df3ARo1tYz3tXcj04PBsF
	KAoN+uya/9iS3ctrwAte/kUqwfQpbtqdoRfOxByb6GTrezGbXNrXjiroD+yRT4i1
	1fwIfPYrmaTF+rCXfUycdCk/I/GJesykegvrqh9aTR4nyGqjACrw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46187xscwm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 11:28:57 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53FBQcYF009292;
	Tue, 15 Apr 2025 11:28:56 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d3hv5sj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 11:28:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ctib5MMjxpruQenef7Tg9czbT0j4TNlUrldf7HZE8b/CY1+7QcCRwYrekMKW2O7bpXeJsnbLqPGwD5/HTnW4gbBkV7zda2B3c4HKzbPllbeZDIDQj8boNw6pKlwxectQKLCq/THx4cz4Mw2dv8hN22P55vM7rCzzTNmkIWNRSsMH5H/cnnCLlqLpLaNkXX1pOGX1LIPzI4xcxpYGLTsbtUvGH8UwokgtT3eqzMsgLgfCOjOO+8utO6fAOvzJPhFSPOuHd1+pMMieFA70n9cJ7JihWKjWHnTAnQQ2AWrowGSRcl52qZab39+jpRMek9qto+0FTYELE8qimXsW2lwRrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFq42Mj5IWxPqX7QUQIHAmDRgFsKtOa6pIJ78brCQYQ=;
 b=yG/Hks1HrHbnL1KpGO/2TuOWeEEwxWIGJuL4pp9TbZBNVG2fUSMZdQrOExiSKc/vmc7fUdIIf6I0GQ8Wn/6E34ChBAqYwqK/mccpSVyPm5VKu78NFp/Cj/yV0YvGBkVNpSpcfJZsEBhiw3mRJPvCNhq4eaBbTcZONjeh1Qups6GsgdO6BgJhXOfiPGync+WI6bubMF7ThNfUd/pz5rsVqCIf6vhHY872BhQb7DQAMdwCiRkxHf1XsqeiSn/t8+TY4AYiyfHT16IemgP/+c5jsD4c3D5taG+wleBihNz7limzgkKhc7KuDWB6ocFmHUJanl47V1WkdWtPg39AEHLfdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFq42Mj5IWxPqX7QUQIHAmDRgFsKtOa6pIJ78brCQYQ=;
 b=TVilXsHTtA0WjzlGxlYU6JbMgZbbvgTwqQBaD0TQM9jTT8AXqLtFc5Jj49o/qjOvULLlc4BewuLOee2JED4cHdcvNosr+3Shjl80UiyrOxSWhy/Egi7obURTbRh8lj4mu2CawjNEO1F7QU0+emxMc2IOSvcHTAw0DogZKGpsiWQ=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by IA1PR10MB7538.namprd10.prod.outlook.com (2603:10b6:208:44b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 11:28:54 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23%7]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 11:28:54 +0000
Date: Tue, 15 Apr 2025 20:28:45 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: Ye Liu <ye.liu@linux.dev>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Ye Liu <liuye@kylinos.cn>
Subject: Re: [PATCH] mm/rmap: Move anon_vma initialization to anon_vma_ctor()
Message-ID: <Z_5C7YNDwZ4pdwQn@harry>
References: <20250415092548.271718-1-ye.liu@linux.dev>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415092548.271718-1-ye.liu@linux.dev>
X-ClientProxiedBy: SE2P216CA0008.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:117::13) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|IA1PR10MB7538:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e7798d1-1bc2-419d-6099-08dd7c10b45f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qgNOuv5nUYMcDLj//mCjd7Qzm+4wkXZCSMwSeE4WwNYVGLFQOIGS26nG6yk1?=
 =?us-ascii?Q?ImW7X34noISDRsQQW/U2KpYaiZYgK8pu0Xj64d5ea5rkXTVvU1GVrMUdsEdm?=
 =?us-ascii?Q?5jaiML/nrFeNQK2hi2Tcb8uZw0fOkms7weSbog6RILksIIjnWdk0y2J7rtvI?=
 =?us-ascii?Q?bsUJVPJZw9HLaTU9VrC0Rx2cRp3p3GNG6kjA+sWJSUZYni+qLpu3B/Z1XMQt?=
 =?us-ascii?Q?kQTgbKyRS9zuDycI/h5ieafLrlnOKwqszyE8AX6h9qQNC5FouyOh0e9s9KHx?=
 =?us-ascii?Q?n1GGahMRfd1GlufhFILeAeDy2xFmxhwOhE2Z5Vhwiu46SyxYHOcDJ+HdFtcD?=
 =?us-ascii?Q?+8R9bFyFaj6zbm1NoWGuLj+hCyRTMPcMhDgUB1g6x6zSfBaKIPK66SE+NDOD?=
 =?us-ascii?Q?RGZG/nLH7RxMbjOtQchCEiMUuqqVTY/QaSuVsvEh43JcOIlp/flui/Zxi6NO?=
 =?us-ascii?Q?DNC+QGCjnMvS2lJdVJ7xhbb0iZT3rpHCzuWLCeGuytDJYnlCZylBZEsdV07K?=
 =?us-ascii?Q?55JRle5yboyze0NaPZy1UvgQap6xOttWs6QgW/uPAHOJbdI68yjjfPcesTN4?=
 =?us-ascii?Q?D0iH7P8NOk5qk9I1lP8AFiqWTHASTPZL/KnFUnrNKEhqpud0azrCkBgSUttV?=
 =?us-ascii?Q?a9hZnlLZ5bXmjuV891sEarEb3e3koxQE32WziFpVUiFw+uzEhaUc0Aj28M/f?=
 =?us-ascii?Q?wl3VbJAzY0UzwPMM3A5bSZzf4Zsz08nQSd73pTu54Gnp5aBIsjFoyMhnYPTN?=
 =?us-ascii?Q?Zn+ZTq8dUo3FB1931Horm2PM8G7i41R9ReeYP+eKqdnbHH4Kq6L6GL5iqNAP?=
 =?us-ascii?Q?vwQAuPNhEBHAZSdBFp4d70imEj9LUugYlPITdqnxZAjdlJrc8RmJWTM/TPtr?=
 =?us-ascii?Q?KD8ZH/L88984yXhdev++BK8oDbu4XAyTB+8LbnwqJgLVcFw11/sk2FPYm84U?=
 =?us-ascii?Q?KBJOSnHxXbSOfA+6na/adF/TEzgQDD3mjnAuOE+liQupxNJbuG+80bthSlS4?=
 =?us-ascii?Q?3CLrFVnmyGEhMbSsrg4D+3sbCISYgtPqBgdOhXIX7/EURxLB6ajI1+D7S46w?=
 =?us-ascii?Q?Kh6Vam0GO1SvGWMfweEKBdc5E1yv9jVCFhKgDwbtJFIQHpJupRBtO7gucm4X?=
 =?us-ascii?Q?c9YAXzvdAV+pKrelfdpHD1uROyIpozFoOlzp8KXCEJ2jzCLZeGJc1YmrSwEj?=
 =?us-ascii?Q?g7eCZ4bVOnRVVd5pEzyUSy3L/8+1POtE4e4CFLCGj7e90r49FokRBVK2cLh2?=
 =?us-ascii?Q?0N8G3GKd5xCOHKIEYtWFN8okPPa346WJ/Ud9hlWHfKuTwyaa5E/cD6rfRrIH?=
 =?us-ascii?Q?Bq91pOmOqQr+tBhgUdmrWZDBQlqlcqnso7oVPsEH7ys48bXWXgRdkn1wOLX/?=
 =?us-ascii?Q?pZXoMyH/GypyRvrDR/SDos0D5cKeHx7zRMCv4XYQXtwaC/wW5mjS1V6ybHau?=
 =?us-ascii?Q?sbHku/Nbbj0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5Z8Db/RNhEdhP8aJvh25LFDwMNslpEZxF4WNsJC0Qn27EFneH/66aAykfFXR?=
 =?us-ascii?Q?yFZWmFQOjjbJnxa1gpBPWIqK5LlBR6IsX3W60JveG99q2CKXwTIXw/SnH1hh?=
 =?us-ascii?Q?5jDg+9SmpTQT1eF4/+XD7C9UA9Qkl2cyUtMDgG/c94yGK4e4gSp5XBhG6aGG?=
 =?us-ascii?Q?sDs5M264F3aMan+2Q++yd8uNHUngDRX+DalSFJPvQ+gHqun0fut7MWmGIhJ4?=
 =?us-ascii?Q?9rVcJMjJKYJUy9LljiUL3H0vPUq9MphtAtnjtChNaae66KX51nnW4481DkJd?=
 =?us-ascii?Q?1KgKkLau8D9dtDK3lru/xv6jQdXNnASBp2C2GM+fUYpt/kIiaaPv80Xl401a?=
 =?us-ascii?Q?WNVp2i4ysxlV79XXYM747aK4VXqQiwQhlBwFYFMan5CufKD2TMrxPKWoH4y7?=
 =?us-ascii?Q?NNmiu930xC/NguiqdRuhFi+Mfq/AVRRy+lsBuzpXwtaM2yy4pVXWM2EcuUYH?=
 =?us-ascii?Q?8dK6XlhBGH1TgiIPSkyst/HkqNNcgbXtmDOkLC2D+5HWEgvG6uqAdeWi2Er3?=
 =?us-ascii?Q?2NQwYs3TfC3fAW1vtyaIe/L9s7Xo1T8mxXv6dIKxMxcFmwKdZDe1CquXI1wK?=
 =?us-ascii?Q?BVrm+7LCqN1bGEkSwyOdgmMWdle6TAEOPjjYF1vE8b9Uxl7qyfzSoKzykss2?=
 =?us-ascii?Q?RurBesn9yNSn+rR4ElU1Ryc4sp11KRh6FozlfR9szvSe2d03R6PqolKYnMhk?=
 =?us-ascii?Q?Gff/MxeXoyrnFRmlPSSADUh0HMFBJ4y+IIzX6VTl6kE2kIMx8B0ByIvfDLKh?=
 =?us-ascii?Q?TIJLEtIEG9dt4fVjFuiKbqzKxLerM/L0fNal6eVvW9rZ3EiempbQ5038cF+o?=
 =?us-ascii?Q?Fhvcv/uiLmcJLKZe2eNuWEciAF7jbS6eGvlXjiSE6MfkzUpJxL5QbGyWYfws?=
 =?us-ascii?Q?2HW6plJdz4v2dChkXzBP6xRPXd0geQuLEg0YOaZGuit8Wdmvs/R6ypHdwDuA?=
 =?us-ascii?Q?6gt6XwoE5YTqnwgPAAAmZl8Rxb9VM8LHe8WnFTMSm61p/gPY9j1Z6KGXV+27?=
 =?us-ascii?Q?K92S4tNGPcAgdojDRnngvxm3vQbMwousao+w7YE9Ju5oiT3FSw/HgHTZNbW5?=
 =?us-ascii?Q?pTGOu99RtXFoJejkqzPGMVoKZDcClJnqZU5y3cej/GHFSJnG9+WuhOoG+4Xy?=
 =?us-ascii?Q?U5nEPgkdQmQrXSKNs/lrnnJlowgq2XrdLuJMEAv96uD6nyxkjw+o7KZkTvmT?=
 =?us-ascii?Q?/u0ToplpKYyhVQ+jTNOeQ7RlWWY5r1LbHQimmxzEq2O1spBep/tVqlhvrCAn?=
 =?us-ascii?Q?hatKN35Zkgaz725q4zQUHhZKph3p6QQqkehHgU4sF/I2M0CN3jkawZKKARWk?=
 =?us-ascii?Q?/bREl3BdHGWUIc6s5AW14gfOQI8nccpc3eHR3+WCSevYnw3k4lmQH2LphLmF?=
 =?us-ascii?Q?w2rbBOWCPmsU53Zwg/RdqJWZT01LKNmk6F8FnPdlO6k604wOPZA8iCAOkwCK?=
 =?us-ascii?Q?7uglTAA0U5AF8+VIB/7RgjaY8EtMqLU4MqzZU5pj7Wo/xeXcjjGPBEtvj2nA?=
 =?us-ascii?Q?Ohm7caqZIgBruTcUArNpbzHf+y7fwPDB1I1KDwQ6NV9bLtO1OZv68DV3zVbl?=
 =?us-ascii?Q?gkc1994FLb9LqknwL8YT8I42GBYAKzFEjnn1sUr5?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Us/ba8B5u/Zt0cpK8bFvBI5zrl/UQLmulikLDBjysEUNiPeUnqQTL6Xx/cBlT4f2j7hemUAsTQXbfopGWkiCYDVjzy8dU7RLxuPoi1Zs4wKoHAHdoAvbXRL/oU6E9SEX9KnqRDZUERG22W9yWH8dhM4aZDHz4EPudRyOsyigrBeZdY4PRGfBiZbdVd0MXMDHsTznVd1iN8IJvtQMMOkRuEQHo3eUq5mANXIpoCz2jFjE2s/WQdDWubD4dXPWv2N8UWAsYmpkdWVKhglcY/x4C8DuzpqDi3oMthlSxegoJr5VMiaprCm7Fa2wdK0ojP8YCG35NdM8BjwYp/nihUBrF/eXbMK/F+Paki8GBD0AenYE7sJIrjnd40ooVhJgH8jgrF/c6BEYV4oQAUOf3BkL+OAD0gx0URfkhyTg2GdeMtrkZTvlJxAjIMD+nKUNOTKbpvf2Iz3a0OJoMg0vZQdQ+0f9n/3pPU0DZFl2kScJVt9xofYFPKgJfz9kpqn6Kv14UsSNQOfigmmYHaef1QUjcdfb9//FnTgU3AV8stW+jKkb9Ge6WxIK4RxYbepG2TuT5vCAkkGrd+C1ToVCu9zpnRwv31PIuW2FjEsTPIDVyEE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e7798d1-1bc2-419d-6099-08dd7c10b45f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 11:28:54.5254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oe/TwooMcnOX9j96iVlyfSsq4emAWQTdxclLfAqPl4hS2qGc3gQDDp4CGwzAWct+jVDRdSfTnAqT74m3m7sGKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7538
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504150081
X-Proofpoint-GUID: jzgpGD8tNk-TTfcL5sPlaxncoj7jYzN3
X-Proofpoint-ORIG-GUID: jzgpGD8tNk-TTfcL5sPlaxncoj7jYzN3

On Tue, Apr 15, 2025 at 05:25:48PM +0800, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> Currently, some initialization of anon_vma is performed in
> anon_vma_alloc(). Move the initialization to anon_vma_ctor()
> so that all object setup is handled in one place.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> ---

NACK unless the patch explains how the object's initial state
('constructed state') is preserved between uses.

anon_vma_ctor() is a slab constructor. That means it is called only once
when a slab (folio) is allocated, and not called again when an anon_vma
is allocated from an existing slab (folio). In other words it is not called
everytime an object allocated via kmem_cache_alloc() interface.

This patch looks very dangerous to me and makes me question whether you
tested it before submission.

-- 
Cheers,
Harry / Hyeonggon

>  mm/rmap.c | 27 ++++++++++-----------------
>  1 file changed, 10 insertions(+), 17 deletions(-)
> 
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 67bb273dfb80..9802b1c27e4b 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -89,22 +89,7 @@ static struct kmem_cache *anon_vma_chain_cachep;
>  
>  static inline struct anon_vma *anon_vma_alloc(void)
>  {
> -	struct anon_vma *anon_vma;
> -
> -	anon_vma = kmem_cache_alloc(anon_vma_cachep, GFP_KERNEL);
> -	if (anon_vma) {
> -		atomic_set(&anon_vma->refcount, 1);
> -		anon_vma->num_children = 0;
> -		anon_vma->num_active_vmas = 0;
> -		anon_vma->parent = anon_vma;
> -		/*
> -		 * Initialise the anon_vma root to point to itself. If called
> -		 * from fork, the root will be reset to the parents anon_vma.
> -		 */
> -		anon_vma->root = anon_vma;
> -	}
> -
> -	return anon_vma;
> +	return kmem_cache_alloc(anon_vma_cachep, GFP_KERNEL);
>  }
>  
>  static inline void anon_vma_free(struct anon_vma *anon_vma)
> @@ -453,8 +438,16 @@ static void anon_vma_ctor(void *data)
>  	struct anon_vma *anon_vma = data;
>  
>  	init_rwsem(&anon_vma->rwsem);
> -	atomic_set(&anon_vma->refcount, 0);
> +	atomic_set(&anon_vma->refcount, 1);
>  	anon_vma->rb_root = RB_ROOT_CACHED;
> +	anon_vma->num_children = 0;
> +	anon_vma->num_active_vmas = 0;
> +	anon_vma->parent = anon_vma;
> +	/*
> +	 * Initialise the anon_vma root to point to itself. If called
> +	 * from fork, the root will be reset to the parents anon_vma.
> +	 */
> +	anon_vma->root = anon_vma;
>  }
>  
>  void __init anon_vma_init(void)
> -- 
> 2.25.1
> 
> 
