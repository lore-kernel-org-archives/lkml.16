Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D07255257
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 17:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744910097; cv=fail; b=RocP5LF7AJ8W+mO9pWbdjuUnTPddgOfeVL2hUmoltjkOKBoglqd/WXL1jKNSJX7NLOp1euVpgKso2cIbmzRX9D+rleBv7mrxm5XoMxRe6xJEpCYwEnc3LP2vqGNEHMYyVa94Nv8XQkUo5ERWi0JOCihrkLeYI5TDH9z0GmJ/Wb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744910097; c=relaxed/simple;
	bh=6M+PP6djtYnrhdnqPx6AYjxLLUKKIXSfERs0D6nPOag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GS1paKrOfsgtWRZYN9meYGgg9uLEzN7oePI3wi5z69KtbxHdTMgOwoCa+VNVrl4lsB/a2H5fMNeM3MmFo1IP61xU1fMuwTTPgMSslPqpX0SJBnzsYfnGcFrut1jvRPqDudXWihqZVAA4vHerFfEoR6fbI/CMRNI6L8UWph0rZhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ifJF/K9M; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OJ1O9ZvJ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ifJF/K9M";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OJ1O9ZvJ"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HGMqxn004754;
	Thu, 17 Apr 2025 17:14:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=rjDQfVboYaikJbEBWQ
	9jESmdoGeT9EOwkkko5AJ14Js=; b=ifJF/K9M3ssUhLillfONnn9MqptFZG2xOG
	qQ2vIBVXHftd9fFTK/zaj2RVrKsMWH8zGUDSIf6LWl90T3jEIEVNv13Mxngcpu2e
	jnXs269e3NmUJZG7+JHPY4KhXkocEoaQxdqPKdOdnjwUgQaB3PatLywzzH3lqVXV
	M4ckyugQ6cb2B26WJh44s7zz/3PZweV5ANnN+T1gVC44fdiabCvTQNO5luWWPDwm
	Jk5Dhcme+RvYQctn4T6pRtQHmZaaCEZTx4taEgFdLztQuzeyZ7qtfb1sVPiJVJGk
	V2vXFAP6Vr8tVOaP+aqNPqVK2nKdBPNfDXesGRW4iUBgEJiuH4wA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46185mxtpv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 17:14:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53HGcuWv038784;
	Thu, 17 Apr 2025 17:14:46 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazlp17010000.outbound.protection.outlook.com [40.93.13.0])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460d4uu0jr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 17:14:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d9YIp9NZsQ7VKrdIQ4QpMXZuIoCMU2/lUxj8o1dxpS0N3h+SFTH5gwCvP7O8IPyQEETbnlvrgwL1n6gcfamlIaD2cLsqXhBt3l2kJtj3gaY1bxZJL7ft+ZKMqVdx1HZV+xkyJ2Zfz7749qjhHyBip8af8SpPceEpRonXabIog5CiA4tVenFIFEGRg/H9R3qyCFplkjiclkibvmTvoEbvXgn4SLcJdOes4cCxJaTcjuVGewW0Uyv6MgFxxFsH0LuQW1r3CT3fEk8SyYSzD/MOACVhIzAIXnjjg4mHh86bT2b1JLQ0yw9TqMVPtv8+0ysnQjybSEweimdhJVxENJg7TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjDQfVboYaikJbEBWQ9jESmdoGeT9EOwkkko5AJ14Js=;
 b=S3C3EiFUMZThwZKoUX1A3Yx9bA7EtQMDJscOAJIr/SqzuPABN3XcAAzWDhdXYjd3OPClxYf0TVQHCUWpA4d0wWKDF8D/3/JXJsPWjg6Ub/pyp+HlqNTIH4VzIMgPdlyOjxuaZjSv7bt+LTckx63YtWL/EMhJWn9WGXcAr+T1heRCjlWPb9KRq9SyvIjkI3wbHhiLfl15HvZI2zyt4X0xrt6CIP/EHr3HEqe71mFMd2x8/26E6HefI0u1DUBYDNohY7vYlZxYUffFGzURJnOWVuGIhjezOLtccbjuSu7iunzH/D+UeBHz/AGG5XMffD7NJFQ/5b/P/5n+aQUKwn183A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjDQfVboYaikJbEBWQ9jESmdoGeT9EOwkkko5AJ14Js=;
 b=OJ1O9ZvJdh7uy0dm/v1PPvM31eNoxBUgn3pyyMXLGX75JV1y+XOkQ0KFkDPOnVLa2toiq9CVMX4jWtnnvhL8q6MPIwQJYUXVzPxVjYl7g8soNOBbtKfb9WN+BFPnqYSFivbx/ucAOr81AFphe0cn5jRnbU+6tixK87rjhXsmZPc=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by IA3PR10MB8020.namprd10.prod.outlook.com (2603:10b6:208:50d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 17 Apr
 2025 17:14:43 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%7]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 17:14:43 +0000
Date: Thu, 17 Apr 2025 13:14:39 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
        Harry Yoo <harry.yoo@oracle.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH] MAINTAINERS: add reverse mapping section
Message-ID: <nllv5dg4p64u3gkvvds7chgb65nq3uhj5ftsrxq2y6a4gyyrbh@fnbxsg2wgvva>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Harry Yoo <harry.yoo@oracle.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20250417084904.16806-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417084904.16806-1-lorenzo.stoakes@oracle.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YQXP288CA0032.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::42) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|IA3PR10MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: 7885b69a-8a58-4c07-3443-08dd7dd35848
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CwImTDmUONbxdBliYiClEO6ipO4Iig1uEh9MyWK0Wh5F3nFmkkSNZsatcjx9?=
 =?us-ascii?Q?ZlCsDhTgSe6aquZZ/jOj09IultH10Hb1z/U9+jK0SkbKthHsHJlpdENNC0GK?=
 =?us-ascii?Q?T0TpE7FXeKj4xYMWieHam2pylSc9xrkmHAHnPQsimh4U+uFguXiokZNGOZrS?=
 =?us-ascii?Q?iwvj1L7sPte+qGNoM8/UHAysOsM4D5RsiLAsIsseF/yWsTOxemy5dqws2dNv?=
 =?us-ascii?Q?GYOYm2h2kIBONAMQnDfAbRzdNCMMnDzAopT+dj451xQIGnu26jgeTsg92kyf?=
 =?us-ascii?Q?//j3GsUOKQntr0i6X1V7qp/7J09wm+ku7KJiVczrw/NY873vOiFSw9nNe/IY?=
 =?us-ascii?Q?V83Ozc5YsrXrS13lGFcnyLSCbRWIQrRCrdv9y/yHH9PCiaMxNnz/URzMXJvK?=
 =?us-ascii?Q?+W9Mxje4Ih5+tm+bMc10oeCmUCNWx+V2fiFFx9L8yebjAvHHd+rF18Dp3mCz?=
 =?us-ascii?Q?aU0oju76PIcbnJsc4SCPiCnmD4mSxWqy6LMFV3pT62VSCuITcuI6aXuYip4P?=
 =?us-ascii?Q?Js/FRDcQaPXnVDNUjsSBtb2/k4Proe4HhttVGNsDff44uPdBu+L9M8xOJkJk?=
 =?us-ascii?Q?XlUCvxN88aQLd49Fnnttn1zAcKrp3iPY/J9HNt9Gz4dSuDiMqEto0NTLGTi1?=
 =?us-ascii?Q?t4mzOal0ISsD5alwT39evF0o9Kr+DqcOL4DMqX837iDVaX/i8xf1S+fsnaBw?=
 =?us-ascii?Q?T33Am+NjZKyNeNAO7nVRuP7fEEfFSyOt0SCJrv7n0MtjIz5tclkecDFAa72G?=
 =?us-ascii?Q?vEVHNFN+NKWrWIoVt6DBG4ixC+LmzxwYI9WN6Wi2M1XfCFN9P85WgqQTZh8/?=
 =?us-ascii?Q?nPaZBGom0meyluCT/NUeMHVQPZNkqs9/cPfXXJtwm+yCcSb1PcsMWS+yLIp8?=
 =?us-ascii?Q?AqKVaXXrjfljJ3PX6DtZ0DsV9Xy3hXEROij/k9rFt07+S2o0sLBB/s4JckBQ?=
 =?us-ascii?Q?ZiZwGScjw7Q3/WLDGQleIrevgMuQcuc8qSl3FxEQlrpIJFJcdh9p4+U+TV2P?=
 =?us-ascii?Q?OWKeo+0uq8ft1VGbKeyencMcLZJFpo6ZRNkYBr1/VaqmsZpwQuOkxOS0eUBH?=
 =?us-ascii?Q?Cs5PimEW7x61d+buOWExkgUiQvbnrZhbrh63cV0eCZ4tqGSZ/IlxTIJv8n1e?=
 =?us-ascii?Q?nq+E5v7RD4E9sbTifRZ+2FYI4zmtFgW649ARRiracbjwN5GOHwNdJ79KKx0v?=
 =?us-ascii?Q?2zF5A2Lr/lIZbsZLNf6RR1fUhk5FSyvatDDJhCTimgHTdKijLfvYcaAlwmny?=
 =?us-ascii?Q?DvaTdYS3msxzSL1PgP6urucKwmLFJq0DYnIoK3XyJ89y/e83gtnvO+qLcHgn?=
 =?us-ascii?Q?tSlyZLvv/PX+pYDFB3S0P9K3BvbFGJpuQFaEKzjTlB48e3Fhs9xfh6ovR7ui?=
 =?us-ascii?Q?6QPUEz9uv0KZOhBJV05S4YTbHcZS2VypNUEFfRGUbPWHd6lSpWot7VgyHPlT?=
 =?us-ascii?Q?EHzIz+lYEOo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hs7Jnjhg4GWx3dv7ThGM+xzw3hnfYwjA6US944Ikdpy4X2uj00ykX7QKFKyP?=
 =?us-ascii?Q?+9k5YhLv172yquMEcu65RwofSaIBqDqesP/nzIwumxqPIE5KhpKrWnZ02QjO?=
 =?us-ascii?Q?Wp/zRF5g42A005L114w4rzyyMEqbfyDFAFY09eu0NfmbpBPWEEhzDtadGwbl?=
 =?us-ascii?Q?VJTvhx7fedUQyfYJ5NCgMTKQnTFXC5O5u/zEv1yLpNJ9Je+u9phx9GIuIVGy?=
 =?us-ascii?Q?S9nLMiD3JAC08ykFwNVYM8N+2rhH0ADfb0++U3puujtMHn2P+99EE31P6aB0?=
 =?us-ascii?Q?TYOY/xGnYpbmz1TfTK2ldlktOc8R6z+E/x/zaQ+OVzCAS1zaVKUwEj1Qay7q?=
 =?us-ascii?Q?qll2vr1s6HBS5nNWyGSlxYhp2KCmI9rsT400bqd2mXAxU5bzcaquMor5Nwjg?=
 =?us-ascii?Q?mJRb0KMS/SaMvRyuhYwURO4wugckE/ojorRQvDGV8jF4Anjgm7uMq5C6tUiy?=
 =?us-ascii?Q?Ex7/YfAnhAVFu3dJv3gb2G0aieNhMp2s68wC33n7YNQZhArT3Dn5OfYfsJCV?=
 =?us-ascii?Q?UgQJL36vWNkcuMPkPPmEtf7MFV2ScJm0DCxTM7XGYgBEAouAWrjV5eASDkYW?=
 =?us-ascii?Q?Q+W8nM+fqWSkzJ9ZbTKEd1hzn59MXdHBzYFyuhrJWRFIq4sJ5ifuEnJNUUZJ?=
 =?us-ascii?Q?juUpqRejrCWyJro7RXdaa+uOqJ2792A3phEJu7WqwB5aFsOqMSDjw1MJrQNP?=
 =?us-ascii?Q?orMdUgRunEi1a5H9y30W/XzKIJWz89iMnKu1KI7KhltccVnOg4AQOU7RAPmv?=
 =?us-ascii?Q?ya2i53/Efe4VowdOkrvqOBbsUXgBRHXWFhqzACnVF+VgFhXPuoOP/naAOP4p?=
 =?us-ascii?Q?QP7kgmoysAWOV0PbbRK8H+PCWpcRRv6epMxJ5t/bNF9Cq1+aY3WElXYezBMP?=
 =?us-ascii?Q?8fRgVje9K7QTaGVK8bNB45VSrsHTDGErb3Pm1Rt+lP/VOpqYMzW18BKrbgxM?=
 =?us-ascii?Q?Troh8WF2Ox3yd9EIlieqkwkO5bmkKynUpQ2WaJXzU2BQ6bFotXOAB5u3mlgw?=
 =?us-ascii?Q?pHJF9bu+ilGfdMC/RC2dH/yEgN6/QwHbgz6SqwN2AKqoKleU3rSvq2ZiIe9C?=
 =?us-ascii?Q?Kx0tNCu4U8HovzYaEM2QusC941p6+wX1H0bn6pEFX3H/6saydNjldi4jfoPX?=
 =?us-ascii?Q?kj01gl4h9OwD/mVK5JfsxHSgBtLKOq30A4XMCoQA6HSHE/1PfTp7vV0VnCjK?=
 =?us-ascii?Q?t6AwuQ3H3YDZmoYTx924oJ2ixGR2mJ2yWDseZpXWAmhza+gM+AvenaJYWG09?=
 =?us-ascii?Q?RwHfAQBtsJfSm9264vVQ0gA45RET2DCS4an7rernky60pp4iJ2yN8GtO7+j8?=
 =?us-ascii?Q?Wb7C39l/gvEdBzi4/8tWe+chH8G/3NdvfLib5rG8XbxW2IXBbu42ApCkbXgl?=
 =?us-ascii?Q?dD6cJOF/4hjKHjilu8FPTuVmC8bgZVXhsl3O2vyEcBTwFkQ3VUyar1x7cyWJ?=
 =?us-ascii?Q?P5mNinsPsdqhOj4GDOxNWY6qOroRUVykGAsKtLesyik4qoDXncSICSPiVwFj?=
 =?us-ascii?Q?NMNBoFpsyMR5fKkX+YkYYR7cf1+hEtuL58G4DEPPXh6ThikxS1ygLoA9kWUB?=
 =?us-ascii?Q?Vy8em5chI2DgA4iA2UWjhDDObX03cUdbnwc2WJmA?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	G8IYvfmIr5/ARTxTp5kI0C3IqtGbDjUjBdyZ/1ZDX2AnG+j7OXacoF7mieaqEzXnTZ7jB0v8JvS5+PNB06kXGXMsSZEtgJg4S+b5YOV++sclf5e7CsBGEPSNf82BjqdcBk/mkwSlCYdk6XRTBJGFgdqyJohxyxN8Lu0mTGJ6aDg9l4X1uij04T9pvAUe+mT79GIQwgpKAVZPXH6K88qtnjsSOSrlrpuXJ4Ap/DW/fKxBLFXzfFpPOhlCobE63MigFgFjI4Rp7LLSYPi8azVC0ZgJI/hOBWO48V+I81H+pYMYxXRZpnd6vifeqZqMp6OMq3rRpf0Y7afQlSKGy9YE4GtbvwK3MQDdhe1UiBIZ8YXrxcVfyNRMDME+IKvqK6tOMnhNUEk36XqVq/QpGHK2h9I5CgLR19C1iCZXGQbYG8J+s9cgYZc0CSzn8SIJmhU/WfmSF98S2WnBE1asVhDPHOZe8ax3JveGQ5wOd9nRNM/eBiAgbwoYF2Mq3K5Ks2zw8YXrn/SGR4as7C6JIKAF2SAl6Sb9SrqtPhnvXlepEHKchSE66XyjedxiQXSPqHPfO4G/dy/NqKvYzZ2ZWlsyMi4omAXWT8XKyriCFcf5LYU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7885b69a-8a58-4c07-3443-08dd7dd35848
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 17:14:43.0534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mSlwsLqu/jpmddGDDoek6/RP9UBkDwQj/7CUbbDuQkCDg3kU4rzQv4qlN218vaQUKqQOmKz3rJFNErO3+38LVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8020
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_05,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504170126
X-Proofpoint-ORIG-GUID: C3-xmvTIYYol4qlyKZgCp1CESsyVFJRS
X-Proofpoint-GUID: C3-xmvTIYYol4qlyKZgCp1CESsyVFJRS

* Lorenzo Stoakes <lorenzo.stoakes@oracle.com> [250417 04:50]:
> Separate out the reverse mapping part of memory management and assign
> appropriate maintainers and reviewers.
> 
> David has long been invovled in work with the reverse mapping and continues
> to do so, so is well suited to maintain this area of the kernel.
> 
> I have a lot of experience working with the anonymous reverse mapping and
> continue to work in this area, and also have good knowledge of the walking
> code and code related to VMAs.
> 
> This helps people identify who to ask for help, and also additionally makes
> life easier in review.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Acked-by: Liam R. Howlett <Liam.Howlett@oracle.com>

> ---
>  MAINTAINERS | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8d834514a047..4f6d09c3fd9d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15499,7 +15499,6 @@ F:	include/linux/mm_*.h
>  F:	include/linux/mmzone.h
>  F:	include/linux/mmu_notifier.h
>  F:	include/linux/pagewalk.h
> -F:	include/linux/rmap.h
>  F:	include/trace/events/ksm.h
>  F:	mm/
>  F:	tools/mm/
> @@ -15539,6 +15538,18 @@ F:	mm/page_alloc.c
>  F:	include/linux/gfp.h
>  F:	include/linux/compaction.h
> 
> +MEMORY MANAGEMENT - RMAP (REVERSE MAPPING)
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +M:	David Hildenbrand <david@redhat.com>
> +M:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> +R:	Liam R. Howlett <Liam.Howlett@oracle.com>
> +R:	Vlastimil Babka <vbabka@suse.cz>
> +R:	Harry Yoo <harry.yoo@oracle.com>
> +L:	linux-mm@kvack.org
> +S:	Maintained
> +F:	include/linux/rmap.h
> +F:	mm/rmap.c
> +
>  MEMORY MANAGEMENT - SECRETMEM
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	Mike Rapoport <rppt@kernel.org>
> --
> 2.49.0
