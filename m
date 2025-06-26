Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9F627510C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 19:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750967906; cv=fail; b=a0VhZfE/nRkzvMEpoii2MIY9RdAQKQAy8m0Hm1v8BOg8Ytf30fmOzXkh5pqpBV699HyICvpxOWcArEkbUYzwPUrXHtj7aWH/QCL7e+gAeIn5anC5w+Q+aGDd9M7bvSlE/H3fFoai8jrtWtB3B/2SClr4EYtAHGc560Qmy4dpZfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750967906; c=relaxed/simple;
	bh=GKdom/pbVzaLxJoR4v703pMIfpuAQsQqQS1Ag4nVUQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hRV3aEo+6V95VT3X7rXK/5fZkyExnPOviyIsgpicpkyh+oM1inuRRWuR76SfXPcKonb0nbLIHW+XWZCkghbSw6FjEV6XaPxI6N9MYZ7l4g27sKIfdh0obKGQywzc5uVfHYK7Ef/vchL8kSwEGMzmUWJ9tfMSd8YrPGduCW5aCkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GpkKo9Ym; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gIpghZKC; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GpkKo9Ym";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gIpghZKC"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QFtg7h000910;
	Thu, 26 Jun 2025 19:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=UyWE7ZlYmZsa9D4loN
	7V1fpyDQ1Zrbocsdz2aVUWq1w=; b=GpkKo9YmKUV4rcZ0nkvE6Ra2Tmgf2pZq0r
	s3+6lCSY43s+1uWbt07piF7TbTXhKq4rLBIn3nKRNw3YEv8BE8+wJeWz8zNhIE7M
	U1rkq0Inwwk30L/RTaYCuima/FZT6D+ovqieDBPRn19eMsxYpTxiWZEnCOU3vvC/
	yJPFIJjAfZHkqJqe6PKjHdOSa4A9VEda/K2fVj1oQNofD3ON6kbJHt84Y29mBEey
	YQVp5Jf6SXO9WiQP1034Bbq31vtcRe78m+aPzbnNLX4lYhzRdBLddRU3XU/aKa6R
	83iEDxaQxCTZA8azL49ISsR0s80X6v659G08bc9VYwTjIvdRYumA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds7v2s0m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Jun 2025 19:58:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55QJ3NAg034153;
	Thu, 26 Jun 2025 19:58:11 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2080.outbound.protection.outlook.com [40.107.93.80])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehptf42p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Jun 2025 19:58:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GlKQl6oEpFZCSuyv+soWfilDy1qkUB/U7upP7oFfaxj6PQpjy4+BO3CByAJMkXzua3FWDtcoRVEBpHBxfItZSvsZ/y0OpsEAOj95kZ1pIcr96faAZNbaO2fIxbEeZKjncBYyASNaloNFF9sM80L4CyEknAewnpITgMPGL+CX42OfmL4aRw1wKEPGb+b5xsTkhBWCdWI+SDL3ULvUuSOIGhRU+/9TnuVS4G9nBkgL6QeTq2hEmripgTszGCQbGzEhHVIEprRKqmJEnwfUsLAFFasEbQgstjws3O9P8n7R9eRCF8ede1+YAI47Qb4y+b/Rt4vLuwgkpqSIMUho/hmcQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UyWE7ZlYmZsa9D4loN7V1fpyDQ1Zrbocsdz2aVUWq1w=;
 b=C/hs8bkcxfmeAMzxu52d/NImtfHEwvIPrdVFEsL0lwwS1w5NxCvFicvNZvUh3kl0CRecrNhGucWIoXmB3fXdRRtPjLOcFeiR66mHlQUamSmNtaIvAdUHD7Uv1JB8i+Le7o/eUk3xv0zaLqX3QWk1sWaGaZoTYHVANO1JmZ0GpiV66/d+xhmQJyggyhTgFFDp08oPYfB1zVeMtFjZlGuu5Oxe4Vd6y6QT9l+5J8AbBu7iVMxicfgYqWpExpq5IKmgyzYYVDJYz91lMKZp7Q7wmi62e0743W4WxTEHQIMClJMlvPyNJK8B8hqCZ1y9BERAxsvc6mtf7DeesM9De4B4QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UyWE7ZlYmZsa9D4loN7V1fpyDQ1Zrbocsdz2aVUWq1w=;
 b=gIpghZKC3Kfm0slxiov01urHboYjBj5wokN2n7SFIxO7Nsh63G3f+weeM2wI5oLg1Hl0hkqdqrnoaWCTeeaCGBQHYl5uEtQeRqVuP+jHk57qjA6CVNOikQym9c5VH+WdDHJ1aRYo9bDer4a19esITLC8lNtTMM/g0QrUJbLYQPU=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by MW4PR10MB5726.namprd10.prod.outlook.com (2603:10b6:303:18c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Thu, 26 Jun
 2025 19:58:06 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 19:58:06 +0000
Date: Thu, 26 Jun 2025 15:58:03 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, richard.weiyang@gmail.com,
        maple-tree@lists.infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] maple tree: Clean up mtree_range_walk()
Message-ID: <3yrtyxb6mwtwrov4vngtcy34pl77easph6hueo5m3nxlqx6o5c@f4frvl5cxees>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, richard.weiyang@gmail.com, 
	maple-tree@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250626171918.17261-1-dev.jain@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626171918.17261-1-dev.jain@arm.com>
User-Agent: NeoMutt/20250404
X-ClientProxiedBy: YT4PR01CA0460.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d6::24) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|MW4PR10MB5726:EE_
X-MS-Office365-Filtering-Correlation-Id: 414d29a0-8322-46a6-7b3b-08ddb4ebc464
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tDFXgzQSNP2x6vmPvDFXmCES3Z6owShP93x7oYgMPXIUYh8gLuKASTlah436?=
 =?us-ascii?Q?YS5cUF/pygsTs40+ysMcww3L/wRLDhO1xEHowAk0Wh7sOqwBSd1gkf7QEdq7?=
 =?us-ascii?Q?aI4mX3Uo7CcNTP8uM/6dbUcXmXnFRpnI4hElarbpn9mpmW1G1/xWLuI1fvzu?=
 =?us-ascii?Q?0dtJl9CIdE/N/96kqHFjygzXSX/h/RggqH0eFYvOMfQfA8GZULKGm5ltBbo8?=
 =?us-ascii?Q?XbJcOr7NsP7Z2ZNdIWg4oN9fAorLLI46WPvn25bZ4ES6H8p/8NaLYgB6xiL0?=
 =?us-ascii?Q?L3Tm1p2pn9rvDESa/+80+tFdhADKBGRR85QAqLN7AG/iOTfTDb3nAKVq+zCu?=
 =?us-ascii?Q?do0/t0VJ/kLNA5PqLABuixgm1Ap4F6e6mqBIRFTmEV0ZSVF9DQsaXTxtyv+a?=
 =?us-ascii?Q?MoidzVYwoaiGlRriJwFKCdNuAPZ2gFowVtfpN+jMDrmlCjfTQaAjUibmBTfX?=
 =?us-ascii?Q?88SAGrwsgbPFmFecCrGr7sEcZN3eF+FTJWuSFK8S3EK3ERRbhOyuSLhykVTZ?=
 =?us-ascii?Q?iwuMmKEUuktXyq8NxStmEdkbQ925F+2nMfp7p0Osg8nsGaeI18yjyJSrhBZJ?=
 =?us-ascii?Q?iKufDP/jikbCZk6b2P6a4aW2CproEgC7AB2SRFj0KtNtX9liyo0lFwBi7us4?=
 =?us-ascii?Q?6RbqrVLcNZN8u5zTgE/vKbjWZQ0qG62PrtloFs9y63gQ9I9/H0aS7rEszHaZ?=
 =?us-ascii?Q?phCeAJKJVQniCSqFcymSa7Pi50JE0BaDrjeJ0ZFYPVX5W/qZmllropAzu6YE?=
 =?us-ascii?Q?z/P+XuDxlYoelocPTImAoZI+cZ3vyEbMqjnIL1QVOo2ZYLwO4tQLomphQo8G?=
 =?us-ascii?Q?C8mU37zgpwyn+WNoAKft7FzisbqyCc3PAbyYsmMf/hxzlyW/sLMhEcL+IntU?=
 =?us-ascii?Q?BjdaubgunVrcd/4crgr0I9Az3uAQ0Je2E8cCPAmwNq/YNhJDFkLJlpBokIUd?=
 =?us-ascii?Q?rp+sYgE4CCz2m7PKbCoAAtfRks4iZTPHRfkKHjB9dmnpFXcFkRLFY3aTagIF?=
 =?us-ascii?Q?/Kw3bNywuNGFF1c7/YeiMjiA1auMIF+W4kbpUb/VfyP0QG2bZqpfMmmamjKw?=
 =?us-ascii?Q?hoRx3pszZ2HEZ0kxKTcKkdUk/cq2DsQZ+NFp9es/HJ4h0JTV0e6R4rus/wpt?=
 =?us-ascii?Q?AL82IPmuhZsyLcuN/NXexAIt4b15wS7p2QO5vJMPqAUvzOjYcgAi5z1xQP7K?=
 =?us-ascii?Q?vpsOBWLBHV0s2M3q4H1Z2bQAvilwktKavMUJkThEfgToaxhSza6UM1X3jsqu?=
 =?us-ascii?Q?ey/vDfCSj/jQ2Snzo5VVTFyfRKktN3ll47DOivskzqnKnEwf3OK72AQTlA4c?=
 =?us-ascii?Q?jsl73I5k6+ihIFHorAv6oVQDE1MS9cOeJWTXbH/vqWXokijJQGw7QvjSLYLg?=
 =?us-ascii?Q?W99T6q8F8nm2UD5MvM29gYAQODKxDRFCkikzyQWdR1q5YCNHqSBTHe1nlQw9?=
 =?us-ascii?Q?EY7AOhaTM0s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JyoRfEQZXPsG6teJqmJ37FGoefST1sDxpa15/eRi035dWoZHNlJ6lHS3Xdw2?=
 =?us-ascii?Q?R1xfjQh0SPTusthikbFLjPIAgAg6pnZsLd2pennrqKWrLguetI6vlLJE6/QP?=
 =?us-ascii?Q?Td29Dbxv2p7bbFl1UnlNn3ID4qNG9pJmR2UbdM5h/gmGvVRrSQkR3/hLhCNh?=
 =?us-ascii?Q?p9UHq/4lB3phOBvFGY9gy95Ev9eOPPndtBMPb4hWy9Bo0Bliv9b953yFuIV+?=
 =?us-ascii?Q?U8Bs3eXT7+DDqj9zoWAlDfT/vKFiwAYfJworMuSEOqx6EeCSzpEJ93aok85V?=
 =?us-ascii?Q?Z0MQBtjtxMYwaaMsH4sqvdU0zIx9eJXrWdtAKlp6tY6ECK/1EPXdALLZsQ4i?=
 =?us-ascii?Q?3alUGcaRZeH9A/j2LCX+wgUeA+/di1KZ6yihWNmCyVbEBjphX7zFH/H/L9Jp?=
 =?us-ascii?Q?T6V/xlOMyWH8FmPgCAjxMtOSSTRSPvtGszHNgQnaISGzgk0UwA1z5p7eURuP?=
 =?us-ascii?Q?mlWmkbP2Wdq0k6o1RHA1dnB+vpwlsSk0pbJ6MchINhb4S6NEIVUUGXsH6ULf?=
 =?us-ascii?Q?r5HrDlJS9Ko2oMNlx8i7aw7SEysHl53ArT+5XHtn2xzacmT2KCiao/uDcItS?=
 =?us-ascii?Q?S3uola9M2tM97JLIY7Rzrelu1wmzVXVTl/mIJcX0/UVgS5FEOAPZgJeFF0wH?=
 =?us-ascii?Q?hHRCUHbbs6qcuPHjxzjeayH9JOKglQV3y5fYnJWRuoKljFoDanpIkzE7Phmn?=
 =?us-ascii?Q?1D4WmMS0aYEpKcqRifb4LJu3maSaPpU/xzXOMZ3+d6G6t/n5jN+R1+Lb1+oY?=
 =?us-ascii?Q?ulEwA1c1i67RXvVO4G03LwJyRDiTQlBoNCP1Akx/6TLIwzEz5IifEbeItDXR?=
 =?us-ascii?Q?XvZ87z+y3JIWNaql/x2A0fDcADVrf2b7N1fVOsjj4zbTgo6JEMrErxILFiwv?=
 =?us-ascii?Q?0OKsougqA5xFk5Inx4a6wlwHDok7a/RDqp0cSvo2wZ1ZytBB++/KXhUwyFyy?=
 =?us-ascii?Q?VGFpJX4XtVV41XgwEtdZc0WQJv80bj++Bxm4uX1KtBC1JoLum0NBJSWxdDBj?=
 =?us-ascii?Q?6Tm1uPeouxJ4GoWiWr/6vjO0eiFyFKeiyAoutEOun1YMVafYY1G9c5j+HqRQ?=
 =?us-ascii?Q?W8qO5nyzFU4rC/8wLLysDuEKV+Z2SNlpHRigYgHJRsXG+T2JwJzDMJYKyYBZ?=
 =?us-ascii?Q?T8FgybyD1hgWfVjnDJihhVg/ibG/GZnsXZMM6tMX3lS1DIyFaVJJfl0Mf8zv?=
 =?us-ascii?Q?SqdRqwI8YpT4QAEwxpjDwvtSFQIJ+5JAAY3hYqFG4dyY7JXgOFWCRCVdwyk2?=
 =?us-ascii?Q?v/IacEvKisVJQkcek6vuq2S8vn0G/mu0FR5Oeb69Q/pPf7mwVWK5Kl0fq2Pd?=
 =?us-ascii?Q?XUu0TeV/PX1O6JMmr8mGBNu/K8UpWTqskXmThWJuMLBQdC7a4oVEEp/w1i3p?=
 =?us-ascii?Q?m/hXb6tIvezACTRwUcQujy5pgAlDWT2X2S49Uk7LnIiabSYlL6hHlehRiXqu?=
 =?us-ascii?Q?QuOOcBuOf/jKzeMDsvnOiCq57qD6tHS0WhJas3E+PG8dhU9GLQY4bUXikL73?=
 =?us-ascii?Q?HmYGIYGdGgCju70YAQY4tAB/KuWeQYgIahsF11iTwwbfsTtgiKCSGQhe2Skj?=
 =?us-ascii?Q?KXjGHV2AHjoBE5AqSEL3ljhkrpydxbI4UvVZeem0?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hd81gn6tgRb1s/ZMqd3BlnlgVLzVv/0+rT6/U8JC2mtlaCakiioSVO3mF6o8oxMIHFNB7mwAC7E5LwZGH82C3p3QUjXiwUo+KsqjIurvLwOvlJv3p+HYwlVYzGqHiewKaQE/6VqtKTo1FMAYA0XJMplesusGm0IF/sjfgJJqN1XO1uLRZ+p8MqOIr22k0oVNpNd4S8vW/cjCdLLjqmnGJnUQ7Ha0YUrdpzwFMIlpbEQLdnTo317CDcY3PqDVLL7NehzZmbzE/+xSYCgXV4Lyii65B/B3wg41Ekwzf3x7tqlA7q3FpShWNWcdik9/qV20mlFVSyqq4PVNqWAqsx+dG48b0VxFytpPv6UMmORZ+seJG08dm9uBuwhyG+Nti8YSGEaDhslNA3xq4Q5sp7jy3vwsK6mo9lKE1hGv2AfgrrBoWEANmFdMiqYvtBQIAbGUEDCTdhbxMQ6D8fxIIwHa8jy8w29V0ESDdHN/liU2JVJUJAn07fNh1ENJ1UstAGKaYD6lJ8EgSeCtMW96l0vGop8WfLu/we/5jAIL5V8lewWxSwWRHGefHz6VFrzPSIZOpIS0eUvwuus+NPBG0Osskidy1TOM2gEt9c8g4dUkAwA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 414d29a0-8322-46a6-7b3b-08ddb4ebc464
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 19:58:06.3898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EwQI6QxWSsob0swZRGNRFIA6vlZOu/nT/ub6kjDsyiQqpnn62oPt/AhcGjVTwsQlxD+ccnipmzwA7A5lPzOSuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5726
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506260170
X-Proofpoint-GUID: qegU0VNY0q2gY2eJhaDgAeiDxcigj75V
X-Authority-Analysis: v=2.4 cv=CeII5Krl c=1 sm=1 tr=0 ts=685da654 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=qN1ux8NReD5Ndi17OusA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: qegU0VNY0q2gY2eJhaDgAeiDxcigj75V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE3MCBTYWx0ZWRfX7RqsiCLyuV3T 1niUTD3Kj3qz3V1ONcc6AtugW2D6PjKiP1Pxz+lXpPjfG+Vk8Ne1xQMc9N7oHXLgLc0MiCwy8c0 0TIyPIzBasYEBlMAWARha3RITFZHGeeL0O+Hy8agVs0Cn+a+HVlkBrPmb8zx19dOm2trlpQv9Hy
 dUQ2zLK1jWoQ81kivFiiqJyXNwgKH7bGR97xzSRCbzw//QpZNHNVz/42rhjPYuTpetJURvOkG8V 7KB1BJQ2Z3w6ge2CJjX+CNmMxDse4yJsMxt+6iUTgu66+lkokL49+7bFWHth53hywt4qR0GDV+P 5znnmxgoh3lulv07ouunfN5psiM14vJroLoX0efl9Jo7EjuWq/e484PrO/wvNVBYwdozdqLSJ0+
 usg9td0Ip0eHhf+BI3MCXoNWmiRiG2VGpqy+x/Bap61o1ZOSymlGCYDE/zGeLBy+BVAXZPPK

* Dev Jain <dev.jain@arm.com> [250626 13:19]:
> The special casing for offset == 0 is being done because min will stay
> mas->min in this case. So refactor the code to use the while loop for
> setting the max and getting the corresponding offset, and only set the
> min for offset > 0.
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  lib/maple_tree.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/maple_tree.c b/lib/maple_tree.c
> index 0e85e92c5375..6c89e6790fb5 100644
> --- a/lib/maple_tree.c
> +++ b/lib/maple_tree.c
> @@ -2770,13 +2770,8 @@ static inline void *mtree_range_walk(struct ma_state *mas)
>  		end = ma_data_end(node, type, pivots, max);
>  		prev_min = min;
>  		prev_max = max;
> -		if (pivots[0] >= mas->index) {
> -			offset = 0;
> -			max = pivots[0];
> -			goto next;
> -		}
>  

This new line should be dropped.

> -		offset = 1;
> +		offset = 0;
>  		while (offset < end) {

This should now be a do {} while();

>  			if (pivots[offset] >= mas->index) {
>  				max = pivots[offset];
> @@ -2784,9 +2779,9 @@ static inline void *mtree_range_walk(struct ma_state *mas)
>  			}
>  			offset++;
>  		}

There should be a new line here.

> +		if (likely(offset))
> +			min = pivots[offset - 1] + 1;
>  
> -		min = pivots[offset - 1] + 1;
> -next:
>  		slots = ma_slots(node, type);
>  		next = mt_slot(mas->tree, slots, offset);
>  		if (unlikely(ma_dead_node(node)))
> -- 
> 2.30.2
> 

The current way will check pivot 0, then skip the main loop.  Pivot 0
has an equal chance of being the range you are looking for, but that
probability increases based on a lower number of entries in the node.
The root node, which we always pass through, can have as little as two
entries, so then it's 50/50 you want pivot 0.

With the way you've written it, it will check offset < end (which will
always be the case for the first time), then do the same work as the
out-of-loop check, then check offset an extra time after the loop.

If it's written with a do {} while, the initial check of offset < end is
avoided, but you will end up checking offset an extra time to see if min
needs to be set.

If pivot 0 is NOT the entry you want, then the current code will check
pivot 0, then execute the loop one less time.  In the even of a root
node with 2 entries, it will not enter the loop at all.

So, the way it is written is less code execution by avoiding unnecessary
assignment of min and checks (of offset == 0 and offset < end).

Thanks,
Liam
