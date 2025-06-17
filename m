Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44C73A8F7
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750152881; cv=fail; b=WwM6C9NpxqDoB89SNCSlLXicIzumXP15iKl2yJTWJOjwgEZX69kb5qWq34266pJYS8wNYhT8J3oL/5RITYhyk9LRg1qAcVsIVfHEv2PqUHdg9kA0FL1/D8xmBkFMDqBro0xly1x/GvceTZcIBURoOKS4QsjPiz7XRcXlaOnajiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750152881; c=relaxed/simple;
	bh=M/RUp4T6xK/PAEbviP+UIijBfThIXeNHJq85psYi3Tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZOx9Y59ZByJq5rmN4b5fmT7zyV7Qo5DIMCoAupF131oZ7QrjQPDxcnizG2lWUlkH6fITaW16FKpjv9/cvLXz8ALYEEPxnS+9utp8Q4rHERMrZlD9Adxfx+uviP42HGyktISEMRO2yjiGe0NjbAMb0GxfIoJ1swTSUBCBL7K+hXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=sHryBaQo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SW5C8/sJ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="sHryBaQo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SW5C8/sJ"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H8tanK022975;
	Tue, 17 Jun 2025 09:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=WfSDdQ6FLluV2s5MNI
	uOYA+D3878KdBDap6LopTaB1k=; b=sHryBaQovKTB7XCTOWpvbrSN+kgHhMy94X
	cvt9PVCL9dFgjy85mOInsDnljrAvMjcxiDLiWc/lU/RdfyRAaGg4WIi3JSfNN5IQ
	Tvf0yLyqcPBV3RdQEE36Oh1KvasSVj1DXoa4h7cwuBdQc7lVTAxGibOBrX70cyRr
	fifM2JpRS4xj4WKOXqSQeJh4RHSfl1f1z2hWOFkH/s8vsfXXKAp7BFWARifFg51I
	vkeyuPo9J5CBPE1DMSy86z7R/6eUaQMjpxZfnNiAjigxT6SIX7C6Slz4GbTgTmJD
	sRUTCjeEBqz61yDUi3/7FRnjAjqGgx3SE9wTDzmL/NGNGOQp00qQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yp4mynv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 09:33:44 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55H8i4e5032130;
	Tue, 17 Jun 2025 09:33:43 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yh90hkv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 09:33:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fUp06YkTVKNp64oNB+S1g2X5eUn7RL88KVPIhfgfIzXQVTkSXs6NvR8d0YmGl9T8cisqR3P637Fv1mgSXFbEQ3zAK0XlGb047FygyhMTVUc0DRcvWjBi/I9ZtiQEfQL/dvjNqi25AYnNHEXC4Ui8TJk5Z3a6esfc7CWCNShi73QYxe7pHJssOTBYEFjybWSLEjPXznjWMaCKyq5i8bht1dJXVt38e485drBUJlaFk/nsel7aF2ewnsOjJPT+SzX2nNAj8IYS0vIhiGsNMSOkG3TZHNw/pqP4g7Oc09xEZmQOx2duRDUTpLyrc+SiT/UA+OJtd6uNteSVkVvVyFwfpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WfSDdQ6FLluV2s5MNIuOYA+D3878KdBDap6LopTaB1k=;
 b=xP7DzjzcGyN5NqJZUtvTkOemODWuUpa/tImg4u3HSXj9ADr6N/dq/np1CW0G6aB9Cjgq5aNtendJALodcSRZxRxF4P+y/F1281g6Hk26j8XiQMu0oxF850A835kcoBxO/uFoSVVCl2hXgdrcRDZbsAJWnZwjgtdE9P47h3OP8D2Y62TPM4zwU9Kv/mvE5mPGPVnVn1Xb9J+oBrjYy9feuSBcnQc0Ju6Xu9ZO4KmVMaOzjZxNgxgcFKttpvAnJvVEoV9Rs6Quulr0uQGE2yHrLqAQZXsFiltbpUvScPotVORM8uDqDuf6GKqGXfV9lUZOZtxXKTnCmJzOT33va56DAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WfSDdQ6FLluV2s5MNIuOYA+D3878KdBDap6LopTaB1k=;
 b=SW5C8/sJAFDBRfyT2TL9UgzXOn49FlVktLw4DTS3IKAguCcott23NyVuTFNMl29Mm9EgcJoZwUnWAzSvrMxUHavYJB+j/uis5qWMYWEqzyOrCQtcmKd0F2o6KKnXz3oY1Dkzwhm3OcVUUMtQQ4Yhqn/NjhKudcCHbr3PxyjNI6g=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH0PR10MB5084.namprd10.prod.outlook.com (2603:10b6:610:dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Tue, 17 Jun
 2025 09:33:41 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 09:33:40 +0000
Date: Tue, 17 Jun 2025 10:33:38 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Harry Yoo <harry.yoo@oracle.com>
Cc: "Lai, Yi" <yi1.lai@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>, Pedro Falcato <pfalcato@suse.de>,
        Rik van Riel <riel@surriel.com>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Jakub Matena <matenajakub@gmail.com>,
        Wei Yang <richard.weiyang@gmail.com>, Barry Song <baohua@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org, yi1.lai@intel.com
Subject: Re: [PATCH 00/11] mm/mremap: introduce more mergeable mremap via
 MREMAP_RELOCATE_ANON
Message-ID: <6104da31-5ae7-41ac-8c43-87a6f94977a8@lucifer.local>
References: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
 <aFEAPOozHsR1/PLI@ly-workstation>
 <aFEPFTWFqguLHyAs@hyeyoo>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFEPFTWFqguLHyAs@hyeyoo>
X-ClientProxiedBy: LO4P123CA0099.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::14) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH0PR10MB5084:EE_
X-MS-Office365-Filtering-Correlation-Id: 23b051bf-95e3-439b-c3ab-08ddad820b84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hXCbWV+2Y1DphPFu0gIJHG2HddIPyjbX2fuJjtBZVO4aM83qg8vqZfBuQAbU?=
 =?us-ascii?Q?7eOXN0qqpBK+IIhWcffdYfCk71XV4ZD0Npp6IDKXixKOWh8RQgzROIMf5bRc?=
 =?us-ascii?Q?aUE6lgtchSfCMliWxXPPDh7OxkBaMm6ndbi9BIi+DZ0XBvtkOykKj5ksxnS4?=
 =?us-ascii?Q?A+fr5QcHM0IUb7OghVs+7+4F39sxNgPsxwgkQGMrpPfdruKw+xT9cXHn7d4m?=
 =?us-ascii?Q?OvY469xHEm2VJWA5/uxRnus2p0b1cBEK9Jg8mwdHxrvgPHNKgvBiKBb8wEFk?=
 =?us-ascii?Q?RTk+paJ6gSt4qbefKAeUlcUmyywTKlrMJN+YJ0OGHc95nDMnW1B2E3NhjEu7?=
 =?us-ascii?Q?C+jcXsF9M93GCVlLaFLg+dnwDCLs3SsyUG9/ChWmwpxYr2AT4BVALDjvSZS0?=
 =?us-ascii?Q?mxDM7IA9E9CGw0s8gWDCXUF5RV2kT3bOcg1wsHtdP0e9gPscfhMA0a+32TVu?=
 =?us-ascii?Q?4FqGvcP/RCDjNziBMn1yw4xINCB3nGI9LFomZ2P+82IIjJWFqNfPIVeZAA2s?=
 =?us-ascii?Q?jNEuy4xQxH6tU8Swz4xfC+cDkaeGVwwqT782YgrDuDCYlT6dNe//oS/uqOmW?=
 =?us-ascii?Q?C0Y+cJSGIeSC/S/04T1XSjI18gR19UH4LOv/StKuSATQI1QndycRki/HIoSz?=
 =?us-ascii?Q?WrEKdI2ftHTbKS2AB6eG1izbdZkCG/jzq/920aDNiy5AtJ1p19vFTDHIRgYK?=
 =?us-ascii?Q?K0t7PgNDYEE9jU7ROjzgAmDe5bmFNQHmS0T5f1nXkFSVCuSxZRJSPQRwLiIv?=
 =?us-ascii?Q?ZE2Iif0Ubq3W8ZMtob0st0F9TtP52xja5V7YmMU9biBdrKgMdqlfWV2DhYLZ?=
 =?us-ascii?Q?KwHTgiqVYLGCWfTXKi5Ub+6xCK3E4UnUV3lSHilKWn9qhDN6aw7/w1Q5v4i2?=
 =?us-ascii?Q?uMAPgdjbFiMKYVUsoIy4FTB+q9X5Rgzj7z+dseNJjxWBE3VMEqNgXxhqN4Dp?=
 =?us-ascii?Q?45/oKJJjJn2n8S4DFT5VmVMsAp2ZCqXDA0bnU/qa0ZkinP7v5ptqruiIelvb?=
 =?us-ascii?Q?ZRI0ORDdaMxuc8pMuU7Qcm6VOO0hlR0j34eWBGquUrF/EdcMi5bzwcBYw6UM?=
 =?us-ascii?Q?xjz3GzFgEv7kDkZasLUzGuU8Du9tY994w5VAK8LCqw+9CCnyCC3PZ+hwmURN?=
 =?us-ascii?Q?ELseicV1Exy7UQWxctTtommncx4H8kH3ly4fIwOO/lXZ2DnSk8EfYVDv5rTP?=
 =?us-ascii?Q?4SCdndmRXQkmRBYMznS3EjMrEMe2yd3zZ7rjqwa1xvMuN26kTsGxhw8ui9H5?=
 =?us-ascii?Q?VaBtGxrpJYHSb80gri6f3UGed7h252By8MYlebpbFgWJ3d8FDRWezEgHTvtQ?=
 =?us-ascii?Q?s7jBfGDdUwGSh8e/x5OdsI3jbDoBEXjlxm9o0tv2jpCZOyNaZOV7PVirHh6o?=
 =?us-ascii?Q?ma+IVw+P06aSmS++yVW/VKCSn0pW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BmgB6Mxs6f71B/dO1Rp3nw2GJwWak2VSWLrZKQITtOJFyYIoD48DVDdtiaha?=
 =?us-ascii?Q?mnk53OP+3PFby1JxgWaOH+uBxCn7zkIjqBWDmpoO4j9zXE7lbgURONlVVT4b?=
 =?us-ascii?Q?P0yDa4KfAI5KU/sJ1YO4hDCL8h5+GS9G3IRtQe+aIFGfdlEN6c5Z/6iqLE//?=
 =?us-ascii?Q?9nBEUcckIYFFuwAj4nKW3jZcHzYmF4BpzXr7fSs2XwQ1oYFWJomHCNfnyvq+?=
 =?us-ascii?Q?y2DPPzdo7CaR0JFRV8q49jktLhHipZT6yxkgMIxnlmVx2asiJSAPutd6buso?=
 =?us-ascii?Q?QdVLL6ScUiDvvY3T+TnJT8v4GsoOpMqbODxK5FmJw7B2fclG7Q5Q9CAsCqv1?=
 =?us-ascii?Q?nYMSEPGd6O3S9kMcKm2ZLqw3n3AN0Im366X7wO1S8dQvhjqxw6A5Z0dN0Pl2?=
 =?us-ascii?Q?VTOBxiSFiBNFi1qi+A8pXuwB3DYNrxCZR3shOK5lfi0B1KpS1oXCS9LwWQFE?=
 =?us-ascii?Q?GOFUEiblXKRFNzzRAf9gFUvlcitKDszDJnPRvp4giF6qjfzfeC9cKrb/zdhG?=
 =?us-ascii?Q?PxsW7aqHRMTdXzE5xQI5uZLiLNSB7Fb3oJ4XdA9DtLk7ZHC+iWHKh7xm29uv?=
 =?us-ascii?Q?YrwePkEh0yP7fUcIRtbQgnJ99io34w4pXuZ9DTux705wSMnWcFM11ZmLAeZ8?=
 =?us-ascii?Q?HoMi3Ix3tou4ga7cYWclavsJKsSEPUCSAR/j26W/NtCCrRfU1wsJQuVMyaCr?=
 =?us-ascii?Q?nRUaupmMctHgX1a7Qx2Y9z3CcwOEMdR4mbsey0fPxVvgCcmSLTb3iB2RtFib?=
 =?us-ascii?Q?B5U5tBpE9Bf4rX0ME0QZCAjUlJrYeBe98VpW3LSqJuOGH55Dum82tLXo2/n9?=
 =?us-ascii?Q?r1JzPg8MXK0WDYPPiC0SVDDn41jtPQU+UbQcyx2fI4Jus1+UXqTwLdY4ihhh?=
 =?us-ascii?Q?ZNAC1nIie8jrWiK0df4P96b9ozTvyldpxJqwQw8KnPph52/TaQ9Wqcq/DVwF?=
 =?us-ascii?Q?OulmwZ0uoSMd+qBYNZFy3EeNAZloM1l/fYO5MPIAt8MItfZrkFY9147bHPWo?=
 =?us-ascii?Q?ZCKgQyKGh56SaGs/QIdcvjZxhZD+x2LciUjn1XIvW8Oi5mqmkoHhUsFIhhIc?=
 =?us-ascii?Q?JGbPtvkO8ZU6eB6yby19RpZzDebl9UEVvz7htG3AkEa5E+yy0fiMapV5a/5x?=
 =?us-ascii?Q?LII1y1CAs0PLh0x5Fb6Ytjb1cQBT+mMDckukk65MdlTKDIHh4fYL+Im3SFOu?=
 =?us-ascii?Q?NOsiG9iCIBKOz8pFGAMxMOOIiQ4cewCx2JQGbySorvQkwn/LmOuYy6Gt8Wc9?=
 =?us-ascii?Q?wWJaPmx4SFq7gaEDrNTJ052ULVS0f006bmbw3ytP77Vk7wnUzlds7F4tseRS?=
 =?us-ascii?Q?ylW23mxenvkBGfkw0hqoMax6GKAk9cByje4Gm8MdNKpSxhj5hoVZ83dnjCJn?=
 =?us-ascii?Q?K+06cx/1SSbPS0/NKjqS35JuYaiQjTIc1iFKRs8MQ5VQMzt6YtkXj9ZggeDy?=
 =?us-ascii?Q?RF3aoUdWNUpFdDIvYpeqeQChntXgupmZ0EK0JE8E88E/hNkrRxoXkFbJjPva?=
 =?us-ascii?Q?cnABVJwsWWze1z4Z3wFyKErlyJt+3Z32bozsCyHqPAOb9QW9qHgxq9cWlWcq?=
 =?us-ascii?Q?iLJlfyKlTsgtmPNH+3qFClKTmzmZ2w+tHe6RnhS8zlMgB4wBUs65unmSKH52?=
 =?us-ascii?Q?Cw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zkt+okcMcPNM4LTnycXjymuEENkWIXMszkmQu/OQs9vRhh/hYxy1TNhoYx387GAk/nw+fL+xPdflJHQqa8XvI+dv4Nr3zm30VEmK1JOIhDapK1MAGljqOpmyxs9fGwD+GeVhoXI1DFLN8W8TIevElkhF01YUCvwfxQQAvbwLV9dSYqNXT72D1WmaW8Cp00DCgtswPFbMUbZxOPJnug4U3gPg4VMYoR4bNKd9K18YjDO31urgpu/fiNv/nsQSLzpgzwAXw01+3oe5w7h0bHFLxf+eKrV+0MMKip9tAHMJsrhi7JGlBAorT1JGFIgk59BxxbTUkyr+vxVyovJbtSfsudXWWpqhP6nVW5RGrl9AUMiLReqxvIKRnYtwQuQM2o0fiZoPvLflw9/cGayMw5mh6zqM7oeYtUIONvrScQin37DD5iePDzJsn5w7U8hmHFHjOx1L3foA79O8uOU+MT6TXKguHT4w24MTe7dHSuCutYQ+4Bc52qaGBBGk/bxyEsOPwDi5gK5w+DrCdEWR+8LBqqWMDxvsLM3l8KMCYxSfmA2zR78i0rnfwf1q3sLS+iGWy33VFaay/TBKsPZ3o1N4+mCFTJVPRCm20w/kYrHTi9Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b051bf-95e3-439b-c3ab-08ddad820b84
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 09:33:40.8919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bFez5HkZgVLtj6MQ+k8c4RX6fLfvOQt2AN7uy3n34g69GgZalDkuzzjVOqY0f1+ax7FZZKTfI7ylSnMbkOkKV86R3VAJLYUTu4C5i8wCsbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5084
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506170077
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA3NyBTYWx0ZWRfX+dWWBclT4kGv aIqbmW5DnCzETzhvsZs9mPlF+1f3xk6VvLH1XCvMU+Tc42NDG+SOEimta1MZeDDthHGKQnAZ+ij 4d2S855LnmhLCjd3A7Yq/KQR/7VXcPjYmVYgbP1D64sFA2SHbw4XzP8D3sNNYavkehd/hSZB+j9
 eEfzR8MTu5gAmO6yTlfjXvxX0KN2bYYh7EHv3iGOXJLVgPZ2egFe0XpQcU2LTOGe8HYdJ7//GBB vQlSfzq7RCcjspoS4M95nxM6VLD/0bTt1tDhRE0E+cVzLceLkGLnLyltJdmpQL6RseRdL3+akAM y2BgqNUiao9gt5gcXkF1kOyblCJPWUk2GIae+s7p2bK/hCt386Q2YQ4EmWTMDOhMURswaL1eGKy
 A1m105/g6Ob2HF6YpLapKjpwvQ8tshJfypBhrtfaj2tmlV3IXOZuOX1YGquIOrOZ25o9tbyE
X-Authority-Analysis: v=2.4 cv=K5EiHzWI c=1 sm=1 tr=0 ts=68513678 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=NEAV23lmAAAA:8 a=p0WdMEafAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=yPCof4ZbAAAA:8 a=ID6ng7r3AAAA:8 a=7dM_o2dMLPV3wY1Se6cA:9 a=CjuIK1q_8ugA:10
 a=AkheI1RvQwOzcTXhi5f4:22
X-Proofpoint-GUID: OqWdwbdyfrI50Ve2EbCWKN6PFF4nZ5tp
X-Proofpoint-ORIG-GUID: OqWdwbdyfrI50Ve2EbCWKN6PFF4nZ5tp

On Tue, Jun 17, 2025 at 03:45:41PM +0900, Harry Yoo wrote:
> On Tue, Jun 17, 2025 at 01:42:20PM +0800, Lai, Yi wrote:
> > On Mon, Jun 09, 2025 at 02:26:34PM +0100, Lorenzo Stoakes wrote:
> >
> > Hi Lorenzo Stoakes,
> >
> > Greetings!
> >
> > I used Syzkaller and found that there is BUG: sleeping function called from invalid context in __relocate_anon_folios in linux-next next-20250616.
> >
> > After bisection and the first bad commit is:
> > "
> > aaf5c23bf6a4 mm/mremap: introduce more mergeable mremap via MREMAP_RELOCATE_ANON
> > "
> >
> > All detailed into can be found at:
> > https://github.com/laifryiee/syzkaller_logs/tree/main/250617_015846___relocate_anon_folios
> > Syzkaller repro code:
> > https://github.com/laifryiee/syzkaller_logs/tree/main/250617_015846___relocate_anon_folios/repro.c
> > Syzkaller repro syscall steps:
> > https://github.com/laifryiee/syzkaller_logs/tree/main/250617_015846___relocate_anon_folios/repro.prog
> > Syzkaller report:
> > https://github.com/laifryiee/syzkaller_logs/tree/main/250617_015846___relocate_anon_folios/repro.report
> > Kconfig(make olddefconfig):
> > https://github.com/laifryiee/syzkaller_logs/tree/main/250617_015846___relocate_anon_folios/kconfig_origin
> > Bisect info:
> > https://github.com/laifryiee/syzkaller_logs/tree/main/250617_015846___relocate_anon_folios/bisect_info.log
> > bzImage:
> > https://github.com/laifryiee/syzkaller_logs/raw/refs/heads/main/250617_015846___relocate_anon_folios/bzImage_050f8ad7b58d9079455af171ac279c4b9b828c11
> > Issue dmesg:
> > https://github.com/laifryiee/syzkaller_logs/blob/main/250617_015846___relocate_anon_folios/050f8ad7b58d9079455af171ac279c4b9b828c11_dmesg.log
> >
> > "
> > [   51.309319] BUG: sleeping function called from invalid context at ./include/linux/pagemap.h:1112
> > [   51.309788] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 670, name: repro
> > [   51.310130] preempt_count: 1, expected: 0
> > [   51.310316] RCU nest depth: 1, expected: 0
> > [   51.310502] 4 locks held by repro/670:a
> > [   51.310675]  #0: ffff88801360abe0 (&mm->mmap_lock){++++}-{4:4}, at: __do_sys_mremap+0x42e/0x1620
> > [   51.311098]  #1: ffff888011a2f078 (&anon_vma->rwsem/1){+.+.}-{4:4}, at: copy_vma_and_data+0x541/0x1790
> > [   51.311526]  #2: ffffffff8725c7c0 (rcu_read_lock){....}-{1:3}, at: ___pte_offset_map+0x3f/0x6c0
> > [   51.311929]  #3: ffff888013e8adf8 (ptlock_ptr(ptdesc)#2){+.+.}-{3:3}, at: __pte_offset_map_lock+0x1a2/0x3c0
> > [   51.312375] Preemption disabled at:
> > [   51.312377] [<ffffffff81e14222>] __pte_offset_map_lock+0x1a2/0x3c0
> > [   51.312828] CPU: 0 UID: 0 PID: 670 Comm: repro Not tainted 6.16.0-rc2-next-20250616-050f8ad7b58d #1 PREEMPT(voluntary)
> > [   51.312837] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 044
> > [   51.312846] Call Trace:
> > [   51.312850]  <TASK>
> > [   51.312853]  dump_stack_lvl+0x121/0x150
> > [   51.312878]  dump_stack+0x19/0x20
> > [   51.312884]  __might_resched+0x37b/0x5a0
> > [   51.312900]  ? __sanitizer_cov_trace_const_cmp8+0x1c/0x30
> > [   51.312917]  __might_sleep+0xa3/0x170
> > [   51.312926]  ? vm_normal_folio+0x8c/0x170
> > [   51.312938]  __relocate_anon_folios+0xf97/0x2960
>
> Looks like it should call folio_trylock() instead of folio_lock()?

I guess it's because we hold the PTE spinlock here... ugh.

We shouldn't be seeing contention on the folio here tbh and if we do then
that's indicative that perhaps we shouldn't proceed...

We could either try for using the lockless PTE stuff or trylock and abort
if can't grab.

Will come up with something...

>
> --
> Cheers,
> Harry / Hyeonggon
>
> > [   51.312953]  ? reacquire_held_locks+0xdd/0x1f0
> > [   51.312970]  ? __pfx___relocate_anon_folios+0x10/0x10
> > [   51.312982]  ? lock_set_class+0x17a/0x260
> > [   51.312994]  copy_vma_and_data+0x606/0x1790
> > [   51.313006]  ? percpu_counter_add_batch+0xd9/0x210
> > [   51.313028]  ? __pfx_copy_vma_and_data+0x10/0x10
> > [   51.313035]  ? vms_complete_munmap_vmas+0x525/0x810
> > [   51.313051]  ? __pfx_do_vmi_align_munmap+0x10/0x10
> > [   51.313064]  ? __sanitizer_cov_trace_const_cmp4+0x1a/0x20
> > [   51.313074]  ? mtree_range_walk+0x728/0xb70
> > [   51.313089]  ? __lock_acquire+0x412/0x22a0
> > [   51.313098]  ? __sanitizer_cov_trace_const_cmp1+0x1e/0x30
> > [   51.313107]  ? percpu_counter_add_batch+0xd9/0x210
> > [   51.313114]  ? debug_smp_processor_id+0x20/0x30
> > [   51.313131]  ? __this_cpu_preempt_check+0x21/0x30
> > [   51.313139]  ? lock_is_held_type+0xef/0x150
> > [   51.313149]  move_vma+0x689/0x1a60
> > [   51.313161]  ? __pfx_move_vma+0x10/0x10
> > [   51.313169]  ? cap_mmap_addr+0x58/0x140
> > [   51.313182]  ? __sanitizer_cov_trace_const_cmp4+0x1a/0x20
> > [   51.313191]  ? security_mmap_addr+0x63/0x1b0
> > [   51.313203]  ? __sanitizer_cov_trace_const_cmp8+0x1c/0x30
> > [   51.313212]  ? __get_unmapped_area+0x1a4/0x440
> > [   51.313223]  ? __sanitizer_cov_trace_const_cmp8+0x1c/0x30
> > [   51.313232]  ? vrm_set_new_addr+0x21d/0x2b0
> > [   51.313241]  __do_sys_mremap+0xeb4/0x1620
> > [   51.313251]  ? __pfx___do_sys_mremap+0x10/0x10
> > [   51.313261]  ? __this_cpu_preempt_check+0x21/0x30
> > [   51.313276]  ? __this_cpu_preempt_check+0x21/0x30
> > [   51.313300]  __x64_sys_mremap+0xc7/0x150
> > [   51.313307]  ? syscall_trace_enter+0x14d/0x280
> > [   51.313320]  x64_sys_call+0x1933/0x2150
> > [   51.313332]  do_syscall_64+0x6d/0x2e0
> > [   51.313342]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > [   51.313349] RIP: 0033:0x7ff58583ee5d
> > [   51.313361] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 898
> > [   51.313367] RSP: 002b:00007ffd1f3a23e8 EFLAGS: 00000217 ORIG_RAX: 0000000000000019
> > [   51.313376] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007ff58583ee5d
> > [   51.313380] RDX: 0000000000002000 RSI: 0000000000002000 RDI: 000000002022e000
> > [   51.313384] RBP: 00007ffd1f3a23f0 R08: 000000002038d000 R09: 0000000000000001
> > [   51.313387] R10: 000000000000000f R11: 0000000000000217 R12: 00007ffd1f3a2508
> > [   51.313391] R13: 0000000000401126 R14: 0000000000403e08 R15: 00007ff585bab000
> > [   51.313403]  </TASK>
> > "
> >
> > Hope this cound be insightful to you.
> >
> > Regards,
> > Yi Lai
> >
> > ---
> >
> > If you don't need the following environment to reproduce the problem or if you
> > already have one reproduced environment, please ignore the following information.
> >
> > How to reproduce:
> > git clone https://gitlab.com/xupengfe/repro_vm_env.git
> > cd repro_vm_env
> > tar -xvf repro_vm_env.tar.gz
> > cd repro_vm_env; ./start3.sh  // it needs qemu-system-x86_64 and I used v7.1.0
> >   // start3.sh will load bzImage_2241ab53cbb5cdb08a6b2d4688feb13971058f65 v6.2-rc5 kernel
> >   // You could change the bzImage_xxx as you want
> >   // Maybe you need to remove line "-drive if=pflash,format=raw,readonly=on,file=./OVMF_CODE.fd \" for different qemu version
> > You could use below command to log in, there is no password for root.
> > ssh -p 10023 root@localhost
> >
> > After login vm(virtual machine) successfully, you could transfer reproduced
> > binary to the vm by below way, and reproduce the problem in vm:
> > gcc -pthread -o repro repro.c
> > scp -P 10023 repro root@localhost:/root/
> >
> > Get the bzImage for target kernel:
> > Please use target kconfig and copy it to kernel_src/.config
> > make olddefconfig
> > make -jx bzImage           //x should equal or less than cpu num your pc has
> >
> > Fill the bzImage file into above start3.sh to load the target kernel in vm.
> >
> >
> > Tips:
> > If you already have qemu-system-x86_64, please ignore below info.
> > If you want to install qemu v7.1.0 version:
> > git clone https://github.com/qemu/qemu.git
> > cd qemu
> > git checkout -f v7.1.0
> > mkdir build
> > cd build
> > yum install -y ninja-build.x86_64
> > yum -y install libslirp-devel.x86_64
> > ../configure --target-list=x86_64-softmmu --enable-kvm --enable-vnc --enable-gtk --enable-sdl --enable-usb-redir --enable-slirp
> > make
> > make install
> >
> > > A long standing issue with VMA merging of anonymous VMAs is the requirement
> > > to maintain both vma->vm_pgoff and anon_vma compatibility between merge
> > > candidates.
> > >
> > > For anonymous mappings, vma->vm_pgoff (and consequently, folio->index)
> > > refer to virtual page offsets, that is, va >> PAGE_SHIFT.
> > >
> > > However upon mremap() of an anonymous mapping that has been faulted (that
> > > is, where vma->anon_vma != NULL), we would then need to walk page tables to
> > > be able to access let alone manipulate folio->index, mapping fields to
> > > permit an update of this virtual page offset.
> > >
> > > Therefore in these instances, we do not do so, instead retaining the
> > > virtual page offset the VMA was first faulted in at as it's vma->vm_pgoff
> > > field, and of course consequently folio->index.
> > >
> > > On each occasion we use linear_page_index() to determine the appropriate
> > > offset, cleverly offset the vma->vm_pgoff field by the difference between
> > > the virtual address and actual VMA start.
> > >
> > > Doing so in effect fragments the virtual address space, meaning that we are
> > > no longer able to merge these VMAs with adjacent ones that could, at least
> > > theoretically, be merged.
> > >
> > > This also creates a difference in behaviour, often surprising to users,
> > > between mappings which are faulted and those which are not - as for the
> > > latter we adjust vma->vm_pgoff upon mremap() to aid mergeability.
> > >
> > > This is problematic firstly because this proliferates kernel allocations
> > > that are pure memory pressure - unreclaimable and unmovable -
> > > i.e. vm_area_struct, anon_vma, anon_vma_chain objects that need not exist.
> > >
> > > Secondly, mremap() exhibits an implicit uAPI in that it does not permit
> > > remaps which span multiple VMAs (though it does permit remaps that
> > > constitute a part of a single VMA).
> > >
> > > This means that a user must concern themselves with whether merges succeed
> > > or not should they wish to use mremap() in such a way which causes multiple
> > > mremap() calls to be performed upon mappings.
> > >
> > > This series provides users with an option to accept the overhead of
> > > actually updating the VMA and underlying folios via the
> > > MREMAP_RELOCATE_ANON flag.
> > >
> > > If MREMAP_RELOCATE_ANON is specified, but an ordinary merge would result in
> > > the mremap() succeeding, then no attempt is made at relocation of folios as
> > > this is not required.
> > >
> > > Even if no merge is possible upon moving of the region, vma->vm_pgoff and
> > > folio->index fields are appropriately updated in order that subsequent
> > > mremap() or mprotect() calls will succeed in merging.
> > >
> > > This flag falls back to the ordinary means of mremap() should the operation
> > > not be feasible. It also transparently undoes the operation, carefully
> > > holding rmap locks such that no racing rmap operation encounters incorrect
> > > or missing VMAs.
> > >
> > > In addition, the MREMAP_MUST_RELOCATE_ANON flag is supplied in case the
> > > user needs to know whether or not the operation succeeded - this flag is
> > > identical to MREMAP_RELOCATE_ANON, only if the operation cannot succeed,
> > > the mremap() fails with -EFAULT.
> > >
> > > Note that no-op mremap() operations (such as an unpopulated range, or a
> > > merge that would trivially succeed already) will succeed under
> > > MREMAP_MUST_RELOCATE_ANON.
> > >
> > > mremap() already walks page tables, so it isn't an order of magntitude
> > > increase in workload, but constitutes the need to walk to page table leaf
> > > level and manipulate folios.
> > >
> > > The operations all succeed under THP and in general are compatible with
> > > underlying large folios of any size. In fact, the larger the folio, the
> > > more efficient the operation is.
> > >
> > > Performance testing indicate that time taken using MREMAP_RELOCATE_ANON is
> > > on the same order of magnitude of ordinary mremap() operations, with both
> > > exhibiting time to the proportion of the mapping which is populated.
> > >
> > > Of course, mremap() operations that are entirely aligned are significantly
> > > faster as they need only move a VMA and a smaller number of higher order
> > > page tables, but this is unavoidable.
> > >
> > > Previous efforts in this area
> > > =============================
> > >
> > > An approach addressing this issue was previously suggested by Jakub Matena
> > > in a series posted a few years ago in [0] (and discussed in a masters
> > > thesis).
> > >
> > > However this was a more general effort which attempted to always make
> > > anonymous mappings more mergeable, and therefore was not quite ready for
> > > the upstream limelight. In addition, large folio work which has occurred
> > > since requires us to carefully consider and account for this.
> > >
> > > This series is more conservative and targeted (one must specific a flag to
> > > get this behaviour) and additionally goes to great efforts to handle large
> > > folios and account all of the nitty gritty locking concerns that might
> > > arise in current kernel code.
> > >
> > > Thanks goes out to Jakub for his efforts however, and hopefully this effort
> > > to take a slightly different approach to the same problem is pleasing to
> > > him regardless :)
> > >
> > > [0]:https://lore.kernel.org/all/20220311174602.288010-1-matenajakub@gmail.com/
> > >
> > > Use-cases
> > > =========
> > >
> > > * ZGC is a concurrent GC shipped with OpenJDK. A prototype is being worked
> > >   upon which makes use of extensive mremap() operations to perform
> > >   defragmentation of objects, taking advantage of the plentiful available
> > >   virtual address space in a 64-bit system.
> > >
> > >   In instances where one VMA is faulted in and another not, merging is not
> > >   possible, which leads to significant, unreclaimable, kernel metadata
> > >   overhead and contention on the vm.max_map_count limit.
> > >
> > >   This series eliminates the issue entirely.
> > > * It was indicated that Android similarly moves memory around and
> > >   encounters the very same issues as ZGC.
> > > * SUSE indicate they have encountered similar issues as pertains to an
> > >   internal client.
> > >
> > > Past approaches
> > > ===============
> > >
> > > In discussions at LSF/MM/BPF It was suggested that we could make this an
> > > madvise() operation, however at this point it will be too late to correctly
> > > perform the merge, requiring an unmap/remap which would be egregious.
> > >
> > > It was further suggested that we simply defer the operation to the point at
> > > which an mremap() is attempted on multiple immediately adjacent VMAs (that
> > > is - to allow VMA fragmentation up until the point where it might cause
> > > perceptible issues with uAPI).
> > >
> > > This is problematic in that in the first instance - you accrue
> > > fragmentation, and only if you were to try to move the fragmented objects
> > > again would you resolve it.
> > >
> > > Additionally you would not be able to handle the mprotect() case, and you'd
> > > have the same issue as the madvise() approach in that you'd need to
> > > essentially re-map each VMA.
> > >
> > > Additionally it would become non-trivial to correctly merge the VMAs - if
> > > there were more than 3, we would need to invent a new merging mechanism
> > > specifically for this, hold locks carefully over each to avoid them
> > > disappearing from beneath us and introduce a great deal of non-optional
> > > complexity.
> > >
> > > While imperfect, the mremap flag approach seems the least invasive most
> > > workable solution (until further rework of the anon_vma mechanism can be
> > > achieved!)
> > >
> > > Testing
> > > =======
> > >
> > > * Significantly expanded self-tests, all of which are passing.
> > > * Explicit testing of forked cases including anon_vma reuse, all passing
> > >   correctly.
> > > * Ran all self tests with MREMAP_RELOCATE_ANON forced on for all anonymous
> > >   mremap()'s.
> > > * Ran heavy workloads with MREMAP_RELOCATE_ANON forced on on real hardware
> > >   (kernel compilation, etc.)
> > > * Ran stress-ng --mremap 32 for an hour with MREMAP_RELOCATE_ANON forced on
> > >   on real hardware.
> > >
> > > Series History
> > > ==============
> > >
> > > Non-RFC:
> > > * Rebased on mm-new and fixed merge conflicts, re-confirmed building and
> > >   all tests passing.
> > > * Seems to have settled down with all feedback previously raised addressed,
> > >   so un-RFC'd to propose the series for mainline, timed for the start of
> > >   the 6.16 rc cycle (thus targeting 6.17).
> > >
> > > RFC v3:
> > > * Rebased on and fixed conflicts against mm-new.
> > > * Removed invalid use of folio_test_large_maybe_mapped_shared() in
> > >   __relocate_large_folio() - this has since been removed and inlined (see
> > >   [0]) anyway but we should be using folio_maybe_mapped_shared() here at
> > >   any rate.
> > > * Moved unnecessary folio large, ksm checks in __relocate_large_folio() to
> > >   relocate_large_folio() - we already check this in relocate_anon_pte() so
> > >   this is duplicated in that case.
> > > * Added new tests explicitly checking that MREMAP_MUST_RELOCATE_ANON fails
> > >   for forked processes, both forked children with parents as indicated by
> > >   avc, and forked parents with children.
> > > * Added anon_vma_assert_locked() helper.
> > > * Removed vma_had_uncowed_children() as it was incorrectly implemented (it
> > >   didn't account for grandchildren and descendents being not being
> > >   self-parented), and replaced with a general
> > >   vma_maybe_has_shared_anon_folios() function which checks both parent and
> > >   child VMAs. Wei raised a concern in this area, this helps clarify and
> > >   correct.
> > > * Converted anon_vma vs. mmap lock check in
> > >   vma_maybe_has_shared_anon_folios() to be more sensible and to assume the
> > >   caller hold sufficient locks (checked with assert).
> > > * Added additional recipients based on recent MAINTAINERS changes.
> > > * Added missing reference to Jakub's efforts in this area a few years ago
> > >   to cover letter. Thanks Jakub!
> > > https://lore.kernel.org/all/cover.1746305604.git.lorenzo.stoakes@oracle.com/
> > >
> > > RFC v2:
> > > * Added folio_mapcount() check on relocate anon to assert exclusively
> > >   mapped as per Jann.
> > > * Added check for anon_vma->num_children > nr_pages in
> > >   should_relocate_anon() as per Jann.
> > > * Separated out vma_had_uncowed_parents() into shared helper function and
> > >   added vma_had_uncowed_children() to implement the above.
> > > * Add comment clarifying why we do not require an rmap lock on the old VMA
> > >   due to fork requiring an mmap write lock which we hold.
> > > * Corrected error path on __anon_vma_prepare() in copy_vma() as per Jann.
> > > * Checked for folio pinning and abort if in place. We do so, because this
> > >   implies the folio is being used by the kernel for a time longer than the
> > >   time over which an mmap lock is held (which will not be held at the time
> > >   of us manipulating the folio, as we hold the mmap write lock). We are
> > >   manipulating mapping, index fields and being conservative (additionally
> > >   mirroring what UFFDIO_MOVE does), we cannot assume that whoever holds the
> > >   pin isn't somehow relying on these not being manipulated. As per David.
> > > * Propagated mapcount, maybe DMA pinned checks to large folio logic.
> > > * Added folio splitting - on second thoughts, it would be a bit silly to
> > >   simply disallow the request because of large folio misalignment, work
> > >   around this by splitting the folio in this instance.
> > > * Added very careful handling around rmap lock, making use of
> > >   folio_anon_vma(), to ensure we do not deadlock on anon_vma.
> > > * Prefer vm_normal_folio() to vm_normal_page() & page_folio().
> > > * Introduced has_shared_anon_vma() to de-duplicate shared anon_vma check.
> > > * Provided sys_mremap() helper in vm_util.[ch] to be shared among test
> > >   callers and de-duplicate. This must be a raw system call, as glibc will
> > >   otherwise filter the flags.
> > > * Expanded the mm CoW self-tests to explicitly test with
> > >   MREMAP_RELOCATE_ANON for partial THP pages. This is useful as it
> > >   exercises split_folio() code paths explicitly. Additionally some cases
> > >   cannot succeed, so we also exercise undo paths.
> > > * Added explicit lockdep handling to teach it that we are handling two
> > >   distinct anon_vma locks so it doesn't spuriously report a deadlock.
> > > * Updated anon_vma deadlock checks to check anon_vma->root. Shouldn't
> > >   strictly be necessary as we explicitly limit ourselves to unforked
> > >   anon_vma's, but it is more correct to do so, as this is where the lock is
> > >   located.
> > > * Expanded the split_huge_page_test.c test to also test using the
> > >   MREMAP_RELOCATE_ANON flag, this is useful as it exercises the undo path.
> > > https://lore.kernel.org/all/cover.1745307301.git.lorenzo.stoakes@oracle.com/
> > >
> > > RFC v1:
> > > https://lore.kernel.org/all/cover.1742478846.git.lorenzo.stoakes@oracle.com/
> > >
> > > Lorenzo Stoakes (11):
> > >   mm/mremap: introduce more mergeable mremap via MREMAP_RELOCATE_ANON
> > >   mm/mremap: add MREMAP_MUST_RELOCATE_ANON
> > >   mm/mremap: add MREMAP[_MUST]_RELOCATE_ANON support for large folios
> > >   tools UAPI: Update copy of linux/mman.h from the kernel sources
> > >   tools/testing/selftests: add sys_mremap() helper to vm_util.h
> > >   tools/testing/selftests: add mremap() cases that merge normally
> > >   tools/testing/selftests: add MREMAP_RELOCATE_ANON merge test cases
> > >   tools/testing/selftests: expand mremap() tests for
> > >     MREMAP_RELOCATE_ANON
> > >   tools/testing/selftests: have CoW self test use MREMAP_RELOCATE_ANON
> > >   tools/testing/selftests: test relocate anon in split huge page test
> > >   tools/testing/selftests: add MREMAP_RELOCATE_ANON fork tests
> > >
> > >  include/linux/rmap.h                          |    4 +
> > >  include/uapi/linux/mman.h                     |    8 +-
> > >  mm/internal.h                                 |    1 +
> > >  mm/mremap.c                                   |  719 ++++++-
> > >  mm/vma.c                                      |   77 +-
> > >  mm/vma.h                                      |   36 +-
> > >  tools/include/uapi/linux/mman.h               |    8 +-
> > >  tools/testing/selftests/mm/cow.c              |   23 +-
> > >  tools/testing/selftests/mm/merge.c            | 1690 ++++++++++++++++-
> > >  tools/testing/selftests/mm/mremap_test.c      |  262 ++-
> > >  .../selftests/mm/split_huge_page_test.c       |   25 +-
> > >  tools/testing/selftests/mm/vm_util.c          |    8 +
> > >  tools/testing/selftests/mm/vm_util.h          |    3 +
> > >  tools/testing/vma/vma.c                       |    5 +-
> > >  tools/testing/vma/vma_internal.h              |   38 +
> > >  15 files changed, 2732 insertions(+), 175 deletions(-)
> > >
> > > --
> > > 2.49.0
