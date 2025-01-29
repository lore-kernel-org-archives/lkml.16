Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AD81DF749
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 18:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738175100; cv=fail; b=g3SJbt7tn2g5E6iW2xGlk4pHFJHkrVC+Bk3upRFZcz6pNHUcwC324e4PhRXxX3qZQVQeNldfCuV2IfRfRN+xNlkSBkU65eJWaO5sE7bS6oG2ryAF/7+eAjKQ25/8Y5UtUH/bEub7tUK+kDPz8OppjQeSrVCPRS9BiHHuLsAgQto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738175100; c=relaxed/simple;
	bh=gZdQF0GLmZS8HpRkcztsKnV5Bz5FZWab1n37eSRyU6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uoXsORkBYiDTkQwphNTNZAnErVX6BZGk/i9eVz1I8ajko9nfbxKWHKYKN5HT09MhVfoGRXhwvj4HMeDdGrW3csYYYfkjGoGSETlogYzybOoUYHyZSB22XzcQmxI7SctsBLciPmnBv1v60epy8jGBOr1Q3sRXMjQM/91Jhb8nCUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bOJ3UOF/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vm1nA8iy; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bOJ3UOF/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vm1nA8iy"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50THYtm0016128;
	Wed, 29 Jan 2025 18:24:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=DilCm9XBnp8XWMupCy+6NTrWjbHp0vBZ4/BrXG1qvEo=; b=
	bOJ3UOF/ozlIxRQUoF3UaUlAYLfrUnhvjQG6xNyODkPqI+jphWmStM168RzyJ2oZ
	lqxnfEKsrb+R2VYlcKlFRcP0LarsESiCA0ROHF4grTfMXRFAEXIXycXi6FV1dr/I
	nvAIo0Uk63YnVA1TuWZSXv/sPaQnjY7rsSInLtPK/tgbB4DwAtripUcFpUMj9LiW
	C4fl5t0SnGIFAwsJDWI1/4Uu4HmaxRuqfCZRxb7moezdN5MSh6SiqKP6RMngYhh8
	c+PLIBiryQMANpCTqlSdajXnpxhDQF9nG94j5Ygo9PDMCuDKI4LCrVEoET44opfO
	Bcc8uoWj2qG6pRjS0tMQKw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44frus04sf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Jan 2025 18:24:47 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50THE7h2036170;
	Wed, 29 Jan 2025 18:16:50 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44cpda2s9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Jan 2025 18:16:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fVyFBderEedWM6tzFyKhJwiTjEq6Y7N+JQJBXFzP3sR2tkCbis9QKDo+qEO/bUe9oHn2e7Rc/JnCa73Oowv3vqFurmXkdTHHoLGdADQFmZhJH8br8WuWKxfdYIYRSJwRRzGNrKETkxOFa0FYQu4jy4wqRlvD1Xu5HKtHlulhIYAFhuDB5dcafBsr8pq+M17jbwk2EXaQhzyLAP9Pw0DAnOFddKfKXMfLkxbRMCih6OeUJDoDBP07eVkVPFnTRUzhN+itPEzO0k4eXUXUm3khDnvJuiR7reNhzz2EeFcUmmU/F0RXN7rthE6mOSAiVws666oprux8d5CcO1fKbXaxBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DilCm9XBnp8XWMupCy+6NTrWjbHp0vBZ4/BrXG1qvEo=;
 b=pKIXRsC7sDeLtdaqUGt++9+lWq2iFoul5xNWY9qLOFV09VbsMC6CEV4aAoFT3xHg54vir2lSB/4wf1mFY+QmwEESKrl8FfK5hP5Rqgb+8VJQdmIMgj34UsHR/oDF9btsBTFYK09exSq6rjny7VWwM1XASAtxe+vEQvGdjxNT45aG2TXUCEdk+8C3PuBRyq70MhCy64YKBFWKYnDy+pIUiHGltgbNh29ZWeLNQEK8Mo+fmPMjRWtwVhfYerBKWx1tKUggblbvUFiHiDI5p7fiuwlxbPY46VXlCIX+Ozi5ajP0QdS+kHabszGlaKEJEfOzri4WStb4XJoF8vFaUpAiHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DilCm9XBnp8XWMupCy+6NTrWjbHp0vBZ4/BrXG1qvEo=;
 b=vm1nA8iyUyWJymJEarYmZaRzE3C9pQg1kw+cuGpzesfVzvsNoD2xD5KBdU5fGrj08MkBefNmBwOCC2qzpL2A125OazoK9jPKlwfl2ywaOdS3YzPjKExljYB0qZObNPigMCtZAV/JUNLMTiHctR1Qvt6xRf9N9n5aHnBJoiry3LY=
Received: from MN2PR10MB3374.namprd10.prod.outlook.com (2603:10b6:208:12b::29)
 by BN0PR10MB4919.namprd10.prod.outlook.com (2603:10b6:408:129::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Wed, 29 Jan
 2025 18:16:46 +0000
Received: from MN2PR10MB3374.namprd10.prod.outlook.com
 ([fe80::eab5:3c8c:1b35:4348]) by MN2PR10MB3374.namprd10.prod.outlook.com
 ([fe80::eab5:3c8c:1b35:4348%3]) with mapi id 15.20.8398.014; Wed, 29 Jan 2025
 18:16:46 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] mm: simplify vma merge structure and expand comments
Date: Wed, 29 Jan 2025 18:16:35 +0000
Message-ID: <e1e30142920abb79a398ab4ef0a1c647d3379ab1.1738172812.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738172812.git.lorenzo.stoakes@oracle.com>
References: <cover.1738172812.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LNXP265CA0069.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::33) To MN2PR10MB3374.namprd10.prod.outlook.com
 (2603:10b6:208:12b::29)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB3374:EE_|BN0PR10MB4919:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f5a0b02-b9a2-4b4d-6e24-08dd40911779
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wEHJAREt22LW4YtkxQLplyj3VHuh1JHyvKF5R5jB+5zOdKRPXtEY/YipyY+D?=
 =?us-ascii?Q?OY5QbOGVjYlJdssrRsJnUjTBJAv9484kHDSrs51LAt9lxMobxWTjiW/kEeB0?=
 =?us-ascii?Q?7gMKt9H6oajZhUru4C5L6BB9BAt0SVKd1oxT8s5RO9fsbvPQ2BoiGG9NAwtM?=
 =?us-ascii?Q?Gw4+gvKmdTlypWsnk9Y1p/ve/ZEQSbjmYscL8suIFbqYKtVaGVipmL+ve0DC?=
 =?us-ascii?Q?R4EcUFoQJSmUWsjnnot5uSqyCVWUpzvn6w4RIIvOEgiSjmmqpMzwL64yqEK4?=
 =?us-ascii?Q?gh/1vME32e9VCqAvqOvtF6GtXWZWhnGzxFG9QCsc/fqstHGlu5JPsXVjIvkB?=
 =?us-ascii?Q?pijgXHPntIgMpOy1zDnBeTfefJcaOG/q8uuZsCBWK9WIgyIzTZX1v2MScch8?=
 =?us-ascii?Q?X/d3+GxGncjVp/DWlqdNez0/fVPH8MMLftRhHQhsmf9TNlnROnns8e6JpgXC?=
 =?us-ascii?Q?hNtu9lcoEEnkP3zf+iG55ArhXvsp5I1maK+BGJ9MJ+VjNOPD9RmpCUOpnKKI?=
 =?us-ascii?Q?l6ltd36l9kczhUyj4/cq51EWIlmqSR10Aog5MU1e0Wff68L8HW5QekvDXhfK?=
 =?us-ascii?Q?0ShCDCczUl8qQwK82Gy5cLkrqvQ5o2So5xOcg1SAp7GOGVowfFgWNU5wY1G5?=
 =?us-ascii?Q?CeSFgJWn4VqEOkDEuR5JHb6K7HNS7QnD41KcdjPW/9gcdh7QXhgvYb0nnEDM?=
 =?us-ascii?Q?OH0ttR/HCYVZmYMEFHCB/dJKRKFEM06uXB99F+tFpZCtQALvCcro6ozm0wNB?=
 =?us-ascii?Q?f4ZTzvWjgkF2vNGu4hjdAET2PJgPPddMx8JrMoLgMk36gGCt0+dcbgxL3Lgs?=
 =?us-ascii?Q?DSdoS9xpUXMXTHnftBoASFjzn+mhuurVsFAmOEqGFz+jxh1RBhD+823JmuFb?=
 =?us-ascii?Q?vR4oym4jIhSS5EiaiaVryH5e3oWnD38nCsJyxBzWd44+2gLM+tx3JLrzusTj?=
 =?us-ascii?Q?Aolxi4lV+hFcYgpK3kWoQ3KIveVwta8XYRJ81DYe7EI/dTkxWkpmY78Jv8tn?=
 =?us-ascii?Q?2Pv32+i6AecXqFqwBNzNkIVEQUHZscQxMNRohP6N4u2H9tRl7pdDUVsWKicW?=
 =?us-ascii?Q?YeAD6ikBNQ54HGLOL0fJptu6rjdxAgguMxJqMQzVO0nowu+10x4iuh+xa4Mi?=
 =?us-ascii?Q?h2BaseO9EsRzmDN/5WHnPuBIwvP9d0QtLlty3WTKvxBQLtrUwqBfIuK23Vjg?=
 =?us-ascii?Q?VL9B4i2GUVCxHzbxddroRJ9iNw+GAf2GAIh8KOvEiOb1ED2qAYAvleb123J5?=
 =?us-ascii?Q?9fu8DnC17z1jglnCJDq3YbHguDOuT/6DCvJJPpRQSQ0dueWevC+y+aOA7C/C?=
 =?us-ascii?Q?EdTACpzrRgwQE3kuFQiLV9v2AcZZimuKJLWq9PsNukCxem3FvR0OmEsGSgPt?=
 =?us-ascii?Q?wOQGltHHrLuMDStHWRlqTA5Ykv8A?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB3374.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BvHvVGYmzsB9mofyzfEz6CXjY24K3lK6MiRg/JFmnzwkq1KSBjMOlGyfOVKQ?=
 =?us-ascii?Q?nUpL112OFyNTIK8mw4XJldc/RJ98qSaUOvYWizK8sq2V6+eHbpk5E9ZQRPS3?=
 =?us-ascii?Q?EUnuAmZVmKVZUgjIovU5bkb3W+5gdsRF8JdlsaZhyI/tbCbTKM2LACgD3Kq/?=
 =?us-ascii?Q?3fakcyNqXJ9m6gA7gF2PmQB6Xe+6VB0STXInGH+/aSA0MGs3kekn3U/bDSxd?=
 =?us-ascii?Q?MWa2CuUBtC/MXtaHz38SfVw6Nx7r4lywDLO27rWfA00WleAdhY3qqPHENq0p?=
 =?us-ascii?Q?c4JZibhg4D/LlaaOCUcZqv5lf8prd2/P352uX8If9w9MTAJoTiPmpZwRYUvq?=
 =?us-ascii?Q?Xi9FoQucdpeuLqpbfuo7YreyvXULZIEj07oJcf1kKJdSjLhGR5b7FYLcUnlR?=
 =?us-ascii?Q?TMitE31Q9HCDJrOou9EyvYHEQnk7YBBq/BYEMZgAzB4y6amhGJR1lpwq2DcD?=
 =?us-ascii?Q?4YrBSm28QfwGIeQLrJpz4l2yKG9UtMhD/GB33biqMX80A4/RI3r7vsTNBMGd?=
 =?us-ascii?Q?bLB/eqVkZML6Tx3cmFRzb9+FTG77vZLZ61WHbKx9IVqtbSPW4DFmNSsPOWrZ?=
 =?us-ascii?Q?HLM1meij9p3kMTLXiLokNnZT5UWXn6BgMQGrbRAPo+ay9mmhMiOrygEfP1Fn?=
 =?us-ascii?Q?zAQicEYXDwoTnWfD+NGepY2s5sHPkpcLHxcLLY1Z9EyuE58neunINSGGtDVH?=
 =?us-ascii?Q?uOvQEBfhq9t9V7hDcl7hQLIsc/+pop8s+A08ptPdeHo0E2yYUAaxEU3dZOaY?=
 =?us-ascii?Q?bDScgvBWT7za7tJgT9RPR2DITJf1QPPmKfudHo3uA+r4UlweWC8YfjbWojtg?=
 =?us-ascii?Q?cqZXbrEw+XYtMPmNTPRLM+3azsnkdUIcSVKQ7G7wPVh1NvwgWIBdo8aaVwC1?=
 =?us-ascii?Q?Fo2JAYdU04s/47sLALjyIEOSfH/H4t2ZmhsqxPjwIi6AQOq91PcfdaJQoZgx?=
 =?us-ascii?Q?Y+IoBCBi6a79RRjVynpSL1tSvh1JguXMN9O6wK8On1c/KeaBSWxQLZ5Rv3/h?=
 =?us-ascii?Q?SMXPlNMRstwklnAL25AKLEaDbw5yv5ghV5pLFgU5up1MP0uAtsgiq68z+p/5?=
 =?us-ascii?Q?scCXYdIN3zaj4j3uzCJTLiEtwL+g7cxouqJfONN/fqGi2/koH8uU0zr7PRvn?=
 =?us-ascii?Q?LV/w6h3c+OCeYXvdSMh/Hb5uUW1PGS5nHk5slCvMWF/Gqjw3uclVXdgzGjIp?=
 =?us-ascii?Q?X48dTPJoi8wM+pRV/FytCVhga7kkj0xZWymMiMSLpfrwIx1+0caqB4235qRP?=
 =?us-ascii?Q?82Nc+VoVYgw+YZbMdVQqlQrSgDn+HhSWMSYtsDQCy5Vste14waNMZQ6Bwo6u?=
 =?us-ascii?Q?s7O69oaa+Y+k7JwfDo/+4qP4zjg8rYG7cJLUcWXZXHABUytEnqSovt9tLWUB?=
 =?us-ascii?Q?TUzf2eM6opAuNzgF8/8r8OuUUgZWAJdqHeEwxgDJNh34vw4E9mhfO7Vy+GEf?=
 =?us-ascii?Q?IbwdJjai1xcvjVBHIr/AmokRdShHeXXLm9MEFJq+AulMGDNI6+jqdNEPEdGI?=
 =?us-ascii?Q?dpnQxmeGu71iPC/6azN+5/FiJYzZC3K00WxiE6h4JMls/K+hK+x6yC8fjsJE?=
 =?us-ascii?Q?gkrPTskCg6Tu/UBejO9byX42tP9QiaY8BCfb5ywO15H+oxQE4JhbVmiHannv?=
 =?us-ascii?Q?1g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0/NZGeml3UfpCdkAYFNwEkW2gsXwcc4kt0UpdGKiH46jZ3HqhP0fGV4RutavWTk7tehvFHdLqXCidiEYxqHbMjBKeZs5HIcz8d1Y2k+ajIIY8IQhHvRkw3s9Ofwd3pDwis0cQj73CoqU2oDdW8dB8P6ETDeNx2sMKnof9U/PYqKypmqF78at786TuW9Itsy2j1ZtN2O9LsQYoj4O+3WvDLCzfR7n92mMNkHMAviqWDF+Kl3k7sD6L4VUaAseBmjJnW6zVi+2aM5bJm8FTmY3+DmLEcnpEsgn9Og5Xa9FEqT7PwiZQs2c/a75vCbYiJbiLGZW6QX2cdRRIkKqqdx1t0IKrwTDZzs86AsQLb393mj0Efx4ALxWmktDeP+inVZM3iXOPHjOOsWkTfQhar3uPLsOukv3Wjw8bbDG56YF9N8xBMhV/Nax8/UrB53CznS93/l4vklle++y3RHpXSxSF2tuW4+P13a9Df0T/RjpfuJczyg4hj5QsOvQ2rPHuVQ0/qPw0SmMBqy2ES3sAr7rdaPLHQTY3xlGtgfIE8vWVBJzoNusiA/hv96rltoiVxilsYWX7TDRbuFoF8dFIfTypL5k0qd2+FlQWvknEq4m93o=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f5a0b02-b9a2-4b4d-6e24-08dd40911779
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB3374.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 18:16:46.8404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: asgHDZu1vBBQlhXqKTGbWzz/A2H/02g3mhC/vgJjhImP/aXZ7HfBpp67oZF8LjxwZ4UeMnKrm2Va2W8nTaq4t/StlQz0DB7iLshIPam6nhc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4919
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-29_03,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 adultscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501290143
X-Proofpoint-GUID: bCSSXDRnesgWi9riYY-AJnK5onjOO6Jp
X-Proofpoint-ORIG-GUID: bCSSXDRnesgWi9riYY-AJnK5onjOO6Jp

The merge code, while much improved, still has a number of points of
confusion. As part of a broader series cleaning this up to make this more
maintainable, we start by addressing some confusion around vma_merge_struct
fields.

So far, the caller either provides no vmg->vma (a new VMA) or supplies the
existing VMA which is being altered, setting vmg->start,end,pgoff to the
proposed VMA dimensions.

vmg->vma is then updated, as are vmg->start,end,pgoff as the merge process
proceeds and the appropriate merge strategy is determined.

This is rather confusing, as vmg->vma starts off as the 'middle' VMA
between vmg->prev,next, but becomes the 'target' VMA, except in one
specific edge case (merge next, shrink middle).

Int his patch we introduce vmg->middle to describe the VMA that is between
vmg->prev and vmg->next, and does NOT change during the merge operation.

We replace vmg->vma with vmg->target, and use this only during the merge
operation itself.

Aside from the merge right, shrink middle case, this becomes the VMA that
forms the basis of the VMA that is returned. This edge case can be
addressed in a future commit.

We also add a number of comments to explain what is going on.

Finally, we adjust the ASCII diagrams showing each merge case in
vma_merge_existing_range() to be clearer - the arrow range previously
showed the vmg->start, end spanned area, but it is clearer to change this
to show the final merged VMA.

This patch has no change in functional behaviour.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 mm/debug.c              |  18 ++---
 mm/mmap.c               |   2 +-
 mm/vma.c                | 166 +++++++++++++++++++++-------------------
 mm/vma.h                |  42 ++++++++--
 tools/testing/vma/vma.c |  52 ++++++-------
 5 files changed, 159 insertions(+), 121 deletions(-)

diff --git a/mm/debug.c b/mm/debug.c
index 8d2acf432385..c9e07651677b 100644
--- a/mm/debug.c
+++ b/mm/debug.c
@@ -261,7 +261,7 @@ void dump_vmg(const struct vma_merge_struct *vmg, const char *reason)
 
 	pr_warn("vmg %px state: mm %px pgoff %lx\n"
 		"vmi %px [%lx,%lx)\n"
-		"prev %px next %px vma %px\n"
+		"prev %px middle %px next %px target %px\n"
 		"start %lx end %lx flags %lx\n"
 		"file %px anon_vma %px policy %px\n"
 		"uffd_ctx %px\n"
@@ -270,7 +270,7 @@ void dump_vmg(const struct vma_merge_struct *vmg, const char *reason)
 		vmg, vmg->mm, vmg->pgoff,
 		vmg->vmi, vmg->vmi ? vma_iter_addr(vmg->vmi) : 0,
 		vmg->vmi ? vma_iter_end(vmg->vmi) : 0,
-		vmg->prev, vmg->next, vmg->vma,
+		vmg->prev, vmg->middle, vmg->next, vmg->target,
 		vmg->start, vmg->end, vmg->flags,
 		vmg->file, vmg->anon_vma, vmg->policy,
 #ifdef CONFIG_USERFAULTFD
@@ -288,13 +288,6 @@ void dump_vmg(const struct vma_merge_struct *vmg, const char *reason)
 		pr_warn("vmg %px mm: (NULL)\n", vmg);
 	}
 
-	if (vmg->vma) {
-		pr_warn("vmg %px vma:\n", vmg);
-		dump_vma(vmg->vma);
-	} else {
-		pr_warn("vmg %px vma: (NULL)\n", vmg);
-	}
-
 	if (vmg->prev) {
 		pr_warn("vmg %px prev:\n", vmg);
 		dump_vma(vmg->prev);
@@ -302,6 +295,13 @@ void dump_vmg(const struct vma_merge_struct *vmg, const char *reason)
 		pr_warn("vmg %px prev: (NULL)\n", vmg);
 	}
 
+	if (vmg->middle) {
+		pr_warn("vmg %px middle:\n", vmg);
+		dump_vma(vmg->middle);
+	} else {
+		pr_warn("vmg %px middle: (NULL)\n", vmg);
+	}
+
 	if (vmg->next) {
 		pr_warn("vmg %px next:\n", vmg);
 		dump_vma(vmg->next);
diff --git a/mm/mmap.c b/mm/mmap.c
index cda01071c7b1..6401a1d73f4a 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1707,7 +1707,7 @@ int relocate_vma_down(struct vm_area_struct *vma, unsigned long shift)
 	/*
 	 * cover the whole range: [new_start, old_end)
 	 */
-	vmg.vma = vma;
+	vmg.middle = vma;
 	if (vma_expand(&vmg))
 		return -ENOMEM;
 
diff --git a/mm/vma.c b/mm/vma.c
index af1d549b179c..68a301a76297 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -52,7 +52,7 @@ struct mmap_state {
 		.pgoff = (map_)->pgoff,					\
 		.file = (map_)->file,					\
 		.prev = (map_)->prev,					\
-		.vma = vma_,						\
+		.middle = vma_,						\
 		.next = (vma_) ? NULL : (map_)->next,			\
 		.state = VMA_MERGE_START,				\
 		.merge_flags = VMG_FLAG_DEFAULT,			\
@@ -639,7 +639,7 @@ static int commit_merge(struct vma_merge_struct *vmg,
 {
 	struct vma_prepare vp;
 
-	init_multi_vma_prep(&vp, vmg->vma, adjust, remove, remove2);
+	init_multi_vma_prep(&vp, vmg->target, adjust, remove, remove2);
 
 	VM_WARN_ON(vp.anon_vma && adjust && adjust->anon_vma &&
 		   vp.anon_vma != adjust->anon_vma);
@@ -652,15 +652,15 @@ static int commit_merge(struct vma_merge_struct *vmg,
 				adjust->vm_end);
 	}
 
-	if (vma_iter_prealloc(vmg->vmi, vmg->vma))
+	if (vma_iter_prealloc(vmg->vmi, vmg->target))
 		return -ENOMEM;
 
 	vma_prepare(&vp);
-	vma_adjust_trans_huge(vmg->vma, vmg->start, vmg->end, adj_start);
-	vma_set_range(vmg->vma, vmg->start, vmg->end, vmg->pgoff);
+	vma_adjust_trans_huge(vmg->target, vmg->start, vmg->end, adj_start);
+	vma_set_range(vmg->target, vmg->start, vmg->end, vmg->pgoff);
 
 	if (expanded)
-		vma_iter_store(vmg->vmi, vmg->vma);
+		vma_iter_store(vmg->vmi, vmg->target);
 
 	if (adj_start) {
 		adjust->vm_start += adj_start;
@@ -671,7 +671,7 @@ static int commit_merge(struct vma_merge_struct *vmg,
 		}
 	}
 
-	vma_complete(&vp, vmg->vmi, vmg->vma->vm_mm);
+	vma_complete(&vp, vmg->vmi, vmg->target->vm_mm);
 
 	return 0;
 }
@@ -694,8 +694,9 @@ static bool can_merge_remove_vma(struct vm_area_struct *vma)
  * identical properties.
  *
  * This function checks for the existence of any such mergeable VMAs and updates
- * the maple tree describing the @vmg->vma->vm_mm address space to account for
- * this, as well as any VMAs shrunk/expanded/deleted as a result of this merge.
+ * the maple tree describing the @vmg->middle->vm_mm address space to account
+ * for this, as well as any VMAs shrunk/expanded/deleted as a result of this
+ * merge.
  *
  * As part of this operation, if a merge occurs, the @vmg object will have its
  * vma, start, end, and pgoff fields modified to execute the merge. Subsequent
@@ -704,45 +705,47 @@ static bool can_merge_remove_vma(struct vm_area_struct *vma)
  * Returns: The merged VMA if merge succeeds, or NULL otherwise.
  *
  * ASSUMPTIONS:
- * - The caller must assign the VMA to be modifed to @vmg->vma.
+ * - The caller must assign the VMA to be modifed to @vmg->middle.
  * - The caller must have set @vmg->prev to the previous VMA, if there is one.
  * - The caller must not set @vmg->next, as we determine this.
  * - The caller must hold a WRITE lock on the mm_struct->mmap_lock.
- * - vmi must be positioned within [@vmg->vma->vm_start, @vmg->vma->vm_end).
+ * - vmi must be positioned within [@vmg->middle->vm_start, @vmg->middle->vm_end).
  */
 static __must_check struct vm_area_struct *vma_merge_existing_range(
 		struct vma_merge_struct *vmg)
 {
-	struct vm_area_struct *vma = vmg->vma;
+	struct vm_area_struct *middle = vmg->middle;
 	struct vm_area_struct *prev = vmg->prev;
 	struct vm_area_struct *next, *res;
 	struct vm_area_struct *anon_dup = NULL;
 	struct vm_area_struct *adjust = NULL;
 	unsigned long start = vmg->start;
 	unsigned long end = vmg->end;
-	bool left_side = vma && start == vma->vm_start;
-	bool right_side = vma && end == vma->vm_end;
+	bool left_side = middle && start == middle->vm_start;
+	bool right_side = middle && end == middle->vm_end;
 	int err = 0;
 	long adj_start = 0;
-	bool merge_will_delete_vma, merge_will_delete_next;
+	bool merge_will_delete_middle, merge_will_delete_next;
 	bool merge_left, merge_right, merge_both;
 	bool expanded;
 
 	mmap_assert_write_locked(vmg->mm);
-	VM_WARN_ON_VMG(!vma, vmg); /* We are modifying a VMA, so caller must specify. */
+	VM_WARN_ON_VMG(!middle, vmg); /* We are modifying a VMA, so caller must specify. */
 	VM_WARN_ON_VMG(vmg->next, vmg); /* We set this. */
 	VM_WARN_ON_VMG(prev && start <= prev->vm_start, vmg);
 	VM_WARN_ON_VMG(start >= end, vmg);
 
 	/*
-	 * If vma == prev, then we are offset into a VMA. Otherwise, if we are
+	 * If middle == prev, then we are offset into a VMA. Otherwise, if we are
 	 * not, we must span a portion of the VMA.
 	 */
-	VM_WARN_ON_VMG(vma && ((vma != prev && vmg->start != vma->vm_start) ||
-			       vmg->end > vma->vm_end), vmg);
-	/* The vmi must be positioned within vmg->vma. */
-	VM_WARN_ON_VMG(vma && !(vma_iter_addr(vmg->vmi) >= vma->vm_start &&
-				vma_iter_addr(vmg->vmi) < vma->vm_end), vmg);
+	VM_WARN_ON_VMG(middle &&
+		       ((middle != prev && vmg->start != middle->vm_start) ||
+			vmg->end > middle->vm_end), vmg);
+	/* The vmi must be positioned within vmg->middle. */
+	VM_WARN_ON_VMG(middle &&
+		       !(vma_iter_addr(vmg->vmi) >= middle->vm_start &&
+			 vma_iter_addr(vmg->vmi) < middle->vm_end), vmg);
 
 	vmg->state = VMA_MERGE_NOMERGE;
 
@@ -776,13 +779,13 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 
 	merge_both = merge_left && merge_right;
 	/* If we span the entire VMA, a merge implies it will be deleted. */
-	merge_will_delete_vma = left_side && right_side;
+	merge_will_delete_middle = left_side && right_side;
 
 	/*
-	 * If we need to remove vma in its entirety but are unable to do so,
+	 * If we need to remove middle in its entirety but are unable to do so,
 	 * we have no sensible recourse but to abort the merge.
 	 */
-	if (merge_will_delete_vma && !can_merge_remove_vma(vma))
+	if (merge_will_delete_middle && !can_merge_remove_vma(middle))
 		return NULL;
 
 	/*
@@ -793,7 +796,7 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 
 	/*
 	 * If we cannot delete next, then we can reduce the operation to merging
-	 * prev and vma (thereby deleting vma).
+	 * prev and middle (thereby deleting middle).
 	 */
 	if (merge_will_delete_next && !can_merge_remove_vma(next)) {
 		merge_will_delete_next = false;
@@ -801,8 +804,8 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 		merge_both = false;
 	}
 
-	/* No matter what happens, we will be adjusting vma. */
-	vma_start_write(vma);
+	/* No matter what happens, we will be adjusting middle. */
+	vma_start_write(middle);
 
 	if (merge_left)
 		vma_start_write(prev);
@@ -812,13 +815,13 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 
 	if (merge_both) {
 		/*
-		 *         |<----->|
-		 * |-------*********-------|
-		 *   prev     vma     next
-		 *  extend   delete  delete
+		 * |<-------------------->|
+		 * |-------********-------|
+		 *   prev   middle   next
+		 *  extend  delete  delete
 		 */
 
-		vmg->vma = prev;
+		vmg->target = prev;
 		vmg->start = prev->vm_start;
 		vmg->end = next->vm_end;
 		vmg->pgoff = prev->vm_pgoff;
@@ -826,78 +829,79 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 		/*
 		 * We already ensured anon_vma compatibility above, so now it's
 		 * simply a case of, if prev has no anon_vma object, which of
-		 * next or vma contains the anon_vma we must duplicate.
+		 * next or middle contains the anon_vma we must duplicate.
 		 */
-		err = dup_anon_vma(prev, next->anon_vma ? next : vma, &anon_dup);
+		err = dup_anon_vma(prev, next->anon_vma ? next : middle,
+				   &anon_dup);
 	} else if (merge_left) {
 		/*
-		 *         |<----->| OR
-		 *         |<--------->|
+		 * |<------------>|      OR
+		 * |<----------------->|
 		 * |-------*************
-		 *   prev       vma
+		 *   prev     middle
 		 *  extend shrink/delete
 		 */
 
-		vmg->vma = prev;
+		vmg->target = prev;
 		vmg->start = prev->vm_start;
 		vmg->pgoff = prev->vm_pgoff;
 
-		if (!merge_will_delete_vma) {
-			adjust = vma;
-			adj_start = vmg->end - vma->vm_start;
+		if (!merge_will_delete_middle) {
+			adjust = middle;
+			adj_start = vmg->end - middle->vm_start;
 		}
 
-		err = dup_anon_vma(prev, vma, &anon_dup);
+		err = dup_anon_vma(prev, middle, &anon_dup);
 	} else { /* merge_right */
 		/*
-		 *     |<----->| OR
-		 * |<--------->|
+		 *     |<------------->| OR
+		 * |<----------------->|
 		 * *************-------|
-		 *      vma       next
+		 *    middle     next
 		 * shrink/delete extend
 		 */
 
 		pgoff_t pglen = PHYS_PFN(vmg->end - vmg->start);
 
 		VM_WARN_ON_VMG(!merge_right, vmg);
-		/* If we are offset into a VMA, then prev must be vma. */
-		VM_WARN_ON_VMG(vmg->start > vma->vm_start && prev && vma != prev, vmg);
+		/* If we are offset into a VMA, then prev must be middle. */
+		VM_WARN_ON_VMG(vmg->start > middle->vm_start && prev && middle != prev, vmg);
 
-		if (merge_will_delete_vma) {
-			vmg->vma = next;
+		if (merge_will_delete_middle) {
+			vmg->target = next;
 			vmg->end = next->vm_end;
 			vmg->pgoff = next->vm_pgoff - pglen;
 		} else {
 			/*
-			 * We shrink vma and expand next.
+			 * We shrink middle and expand next.
 			 *
 			 * IMPORTANT: This is the ONLY case where the final
-			 * merged VMA is NOT vmg->vma, but rather vmg->next.
+			 * merged VMA is NOT vmg->target, but rather vmg->next.
 			 */
-
-			vmg->start = vma->vm_start;
+			vmg->target = middle;
+			vmg->start = middle->vm_start;
 			vmg->end = start;
-			vmg->pgoff = vma->vm_pgoff;
+			vmg->pgoff = middle->vm_pgoff;
 
 			adjust = next;
-			adj_start = -(vma->vm_end - start);
+			adj_start = -(middle->vm_end - start);
 		}
 
-		err = dup_anon_vma(next, vma, &anon_dup);
+		err = dup_anon_vma(next, middle, &anon_dup);
 	}
 
 	if (err)
 		goto abort;
 
 	/*
-	 * In nearly all cases, we expand vmg->vma. There is one exception -
+	 * In nearly all cases, we expand vmg->middle. There is one exception -
 	 * merge_right where we partially span the VMA. In this case we shrink
-	 * the end of vmg->vma and adjust the start of vmg->next accordingly.
+	 * the end of vmg->middle and adjust the start of vmg->next accordingly.
 	 */
-	expanded = !merge_right || merge_will_delete_vma;
+	expanded = !merge_right || merge_will_delete_middle;
 
 	if (commit_merge(vmg, adjust,
-			 merge_will_delete_vma ? vma : NULL,
+			 merge_will_delete_middle ? middle : NULL,
 			 merge_will_delete_next ? next : NULL,
 			 adj_start, expanded)) {
 		if (anon_dup)
@@ -973,7 +977,7 @@ struct vm_area_struct *vma_merge_new_range(struct vma_merge_struct *vmg)
 	bool just_expand = vmg->merge_flags & VMG_FLAG_JUST_EXPAND;
 
 	mmap_assert_write_locked(vmg->mm);
-	VM_WARN_ON_VMG(vmg->vma, vmg);
+	VM_WARN_ON_VMG(vmg->middle, vmg);
 	/* vmi must point at or before the gap. */
 	VM_WARN_ON_VMG(vma_iter_addr(vmg->vmi) > end, vmg);
 
@@ -989,13 +993,13 @@ struct vm_area_struct *vma_merge_new_range(struct vma_merge_struct *vmg)
 	/* If we can merge with the next VMA, adjust vmg accordingly. */
 	if (can_merge_right) {
 		vmg->end = next->vm_end;
-		vmg->vma = next;
+		vmg->middle = next;
 	}
 
 	/* If we can merge with the previous VMA, adjust vmg accordingly. */
 	if (can_merge_left) {
 		vmg->start = prev->vm_start;
-		vmg->vma = prev;
+		vmg->middle = prev;
 		vmg->pgoff = prev->vm_pgoff;
 
 		/*
@@ -1017,10 +1021,10 @@ struct vm_area_struct *vma_merge_new_range(struct vma_merge_struct *vmg)
 	 * Now try to expand adjacent VMA(s). This takes care of removing the
 	 * following VMA if we have VMAs on both sides.
 	 */
-	if (vmg->vma && !vma_expand(vmg)) {
-		khugepaged_enter_vma(vmg->vma, vmg->flags);
+	if (vmg->middle && !vma_expand(vmg)) {
+		khugepaged_enter_vma(vmg->middle, vmg->flags);
 		vmg->state = VMA_MERGE_SUCCESS;
-		return vmg->vma;
+		return vmg->middle;
 	}
 
 	return NULL;
@@ -1032,44 +1036,46 @@ struct vm_area_struct *vma_merge_new_range(struct vma_merge_struct *vmg)
  * @vmg: Describes a VMA expansion operation.
  *
  * Expand @vma to vmg->start and vmg->end.  Can expand off the start and end.
- * Will expand over vmg->next if it's different from vmg->vma and vmg->end ==
- * vmg->next->vm_end.  Checking if the vmg->vma can expand and merge with
+ * Will expand over vmg->next if it's different from vmg->middle and vmg->end ==
+ * vmg->next->vm_end.  Checking if the vmg->middle can expand and merge with
  * vmg->next needs to be handled by the caller.
  *
  * Returns: 0 on success.
  *
  * ASSUMPTIONS:
- * - The caller must hold a WRITE lock on vmg->vma->mm->mmap_lock.
- * - The caller must have set @vmg->vma and @vmg->next.
+ * - The caller must hold a WRITE lock on vmg->middle->mm->mmap_lock.
+ * - The caller must have set @vmg->middle and @vmg->next.
  */
 int vma_expand(struct vma_merge_struct *vmg)
 {
 	struct vm_area_struct *anon_dup = NULL;
 	bool remove_next = false;
-	struct vm_area_struct *vma = vmg->vma;
+	struct vm_area_struct *middle = vmg->middle;
 	struct vm_area_struct *next = vmg->next;
 
 	mmap_assert_write_locked(vmg->mm);
 
-	vma_start_write(vma);
-	if (next && (vma != next) && (vmg->end == next->vm_end)) {
+	vma_start_write(middle);
+	if (next && (middle != next) && (vmg->end == next->vm_end)) {
 		int ret;
 
 		remove_next = true;
 		/* This should already have been checked by this point. */
 		VM_WARN_ON_VMG(!can_merge_remove_vma(next), vmg);
 		vma_start_write(next);
-		ret = dup_anon_vma(vma, next, &anon_dup);
+		ret = dup_anon_vma(middle, next, &anon_dup);
 		if (ret)
 			return ret;
 	}
 
 	/* Not merging but overwriting any part of next is not handled. */
 	VM_WARN_ON_VMG(next && !remove_next &&
-		       next != vma && vmg->end > next->vm_start, vmg);
+		       next != middle && vmg->end > next->vm_start, vmg);
 	/* Only handles expanding */
-	VM_WARN_ON_VMG(vma->vm_start < vmg->start || vma->vm_end > vmg->end, vmg);
+	VM_WARN_ON_VMG(middle->vm_start < vmg->start ||
+		       middle->vm_end > vmg->end, vmg);
 
+	vmg->target = middle;
 	if (commit_merge(vmg, NULL, remove_next ? next : NULL, NULL, 0, true))
 		goto nomem;
 
@@ -1508,7 +1514,7 @@ int do_vmi_munmap(struct vma_iterator *vmi, struct mm_struct *mm,
  */
 static struct vm_area_struct *vma_modify(struct vma_merge_struct *vmg)
 {
-	struct vm_area_struct *vma = vmg->vma;
+	struct vm_area_struct *vma = vmg->middle;
 	struct vm_area_struct *merged;
 
 	/* First, try to merge. */
@@ -1605,7 +1611,7 @@ struct vm_area_struct *vma_merge_extend(struct vma_iterator *vmi,
 	VMG_VMA_STATE(vmg, vmi, vma, vma, vma->vm_end, vma->vm_end + delta);
 
 	vmg.next = vma_iter_next_rewind(vmi, NULL);
-	vmg.vma = NULL; /* We use the VMA to populate VMG fields only. */
+	vmg.middle = NULL; /* We use the VMA to populate VMG fields only. */
 
 	return vma_merge_new_range(&vmg);
 }
@@ -1726,7 +1732,7 @@ struct vm_area_struct *copy_vma(struct vm_area_struct **vmap,
 	if (new_vma && new_vma->vm_start < addr + len)
 		return NULL;	/* should never get here */
 
-	vmg.vma = NULL; /* New VMA range. */
+	vmg.middle = NULL; /* New VMA range. */
 	vmg.pgoff = pgoff;
 	vmg.next = vma_iter_next_rewind(&vmi, NULL);
 	new_vma = vma_merge_new_range(&vmg);
diff --git a/mm/vma.h b/mm/vma.h
index a2e8710b8c47..5b5dd07e478c 100644
--- a/mm/vma.h
+++ b/mm/vma.h
@@ -69,16 +69,48 @@ enum vma_merge_flags {
 	VMG_FLAG_JUST_EXPAND = 1 << 0,
 };
 
-/* Represents a VMA merge operation. */
+/*
+ * Describes a VMA merge operation and is threaded throughout it.
+ *
+ * Any of the fields may be mutated by the merge operation, so no guarantees are
+ * made to the contents of this structure after a merge operation has completed.
+ */
 struct vma_merge_struct {
 	struct mm_struct *mm;
 	struct vma_iterator *vmi;
-	pgoff_t pgoff;
+	/*
+	 * Adjacent VMAs, any of which may be NULL if not present:
+	 *
+	 * |------|--------|------|
+	 * | prev | middle | next |
+	 * |------|--------|------|
+	 *
+	 * middle may not yet exist in the case of a proposed new VMA being
+	 * merged, or it may be an existing VMA.
+	 *
+	 * next may be assigned by the caller.
+	 */
 	struct vm_area_struct *prev;
-	struct vm_area_struct *next; /* Modified by vma_merge(). */
-	struct vm_area_struct *vma; /* Either a new VMA or the one being modified. */
+	struct vm_area_struct *middle;
+	struct vm_area_struct *next;
+	/*
+	 * This is the VMA we ultimately target to become the merged VMA, except
+	 * for the one exception of merge right, shrink next (for details of
+	 * this scenario see vma_merge_existing_range()).
+	 */
+	struct vm_area_struct *target;
+	/*
+	 * Initially, the start, end, pgoff fields are provided by the caller
+	 * and describe the proposed new VMA range, whether modifying an
+	 * existing VMA (which will be 'middle'), or adding a new one.
+	 *
+	 * During the merge process these fields are updated to describe the new
+	 * range _including those VMAs which will be merged_.
+	 */
 	unsigned long start;
 	unsigned long end;
+	pgoff_t pgoff;
+
 	unsigned long flags;
 	struct file *file;
 	struct anon_vma *anon_vma;
@@ -118,8 +150,8 @@ static inline pgoff_t vma_pgoff_offset(struct vm_area_struct *vma,
 		.mm = vma_->vm_mm,				\
 		.vmi = vmi_,					\
 		.prev = prev_,					\
+		.middle = vma_,					\
 		.next = NULL,					\
-		.vma = vma_,					\
 		.start = start_,				\
 		.end = end_,					\
 		.flags = vma_->vm_flags,			\
diff --git a/tools/testing/vma/vma.c b/tools/testing/vma/vma.c
index 04ab45e27fb8..3c0572120e94 100644
--- a/tools/testing/vma/vma.c
+++ b/tools/testing/vma/vma.c
@@ -147,8 +147,8 @@ static void vmg_set_range(struct vma_merge_struct *vmg, unsigned long start,
 	vma_iter_set(vmg->vmi, start);
 
 	vmg->prev = NULL;
+	vmg->middle = NULL;
 	vmg->next = NULL;
-	vmg->vma = NULL;
 
 	vmg->start = start;
 	vmg->end = end;
@@ -338,7 +338,7 @@ static bool test_simple_expand(void)
 	VMA_ITERATOR(vmi, &mm, 0);
 	struct vma_merge_struct vmg = {
 		.vmi = &vmi,
-		.vma = vma,
+		.middle = vma,
 		.start = 0,
 		.end = 0x3000,
 		.pgoff = 0,
@@ -631,7 +631,7 @@ static bool test_vma_merge_special_flags(void)
 	 */
 	vma = alloc_and_link_vma(&mm, 0x3000, 0x4000, 3, flags);
 	ASSERT_NE(vma, NULL);
-	vmg.vma = vma;
+	vmg.middle = vma;
 
 	for (i = 0; i < ARRAY_SIZE(special_flags); i++) {
 		vm_flags_t special_flag = special_flags[i];
@@ -760,7 +760,7 @@ static bool test_vma_merge_with_close(void)
 
 	vmg_set_range(&vmg, 0x3000, 0x5000, 3, flags);
 	vmg.prev = vma_prev;
-	vmg.vma = vma;
+	vmg.middle = vma;
 
 	/*
 	 * The VMA being modified in a way that would otherwise merge should
@@ -787,7 +787,7 @@ static bool test_vma_merge_with_close(void)
 	vma->vm_ops = &vm_ops;
 
 	vmg_set_range(&vmg, 0x3000, 0x5000, 3, flags);
-	vmg.vma = vma;
+	vmg.middle = vma;
 	ASSERT_EQ(merge_existing(&vmg), NULL);
 	/*
 	 * Initially this is misapprehended as an out of memory report, as the
@@ -817,7 +817,7 @@ static bool test_vma_merge_with_close(void)
 
 	vmg_set_range(&vmg, 0x3000, 0x5000, 3, flags);
 	vmg.prev = vma_prev;
-	vmg.vma = vma;
+	vmg.middle = vma;
 
 	ASSERT_EQ(merge_existing(&vmg), NULL);
 	ASSERT_EQ(vmg.state, VMA_MERGE_NOMERGE);
@@ -843,7 +843,7 @@ static bool test_vma_merge_with_close(void)
 
 	vmg_set_range(&vmg, 0x3000, 0x5000, 3, flags);
 	vmg.prev = vma_prev;
-	vmg.vma = vma;
+	vmg.middle = vma;
 
 	ASSERT_EQ(merge_existing(&vmg), vma_prev);
 	ASSERT_EQ(vmg.state, VMA_MERGE_SUCCESS);
@@ -940,7 +940,7 @@ static bool test_merge_existing(void)
 	vma_next = alloc_and_link_vma(&mm, 0x6000, 0x9000, 6, flags);
 	vma_next->vm_ops = &vm_ops; /* This should have no impact. */
 	vmg_set_range(&vmg, 0x3000, 0x6000, 3, flags);
-	vmg.vma = vma;
+	vmg.middle = vma;
 	vmg.prev = vma;
 	vma->anon_vma = &dummy_anon_vma;
 	ASSERT_EQ(merge_existing(&vmg), vma_next);
@@ -973,7 +973,7 @@ static bool test_merge_existing(void)
 	vma_next = alloc_and_link_vma(&mm, 0x6000, 0x9000, 6, flags);
 	vma_next->vm_ops = &vm_ops; /* This should have no impact. */
 	vmg_set_range(&vmg, 0x2000, 0x6000, 2, flags);
-	vmg.vma = vma;
+	vmg.middle = vma;
 	vma->anon_vma = &dummy_anon_vma;
 	ASSERT_EQ(merge_existing(&vmg), vma_next);
 	ASSERT_EQ(vmg.state, VMA_MERGE_SUCCESS);
@@ -1003,7 +1003,7 @@ static bool test_merge_existing(void)
 	vma->vm_ops = &vm_ops; /* This should have no impact. */
 	vmg_set_range(&vmg, 0x3000, 0x6000, 3, flags);
 	vmg.prev = vma_prev;
-	vmg.vma = vma;
+	vmg.middle = vma;
 	vma->anon_vma = &dummy_anon_vma;
 
 	ASSERT_EQ(merge_existing(&vmg), vma_prev);
@@ -1037,7 +1037,7 @@ static bool test_merge_existing(void)
 	vma = alloc_and_link_vma(&mm, 0x3000, 0x7000, 3, flags);
 	vmg_set_range(&vmg, 0x3000, 0x7000, 3, flags);
 	vmg.prev = vma_prev;
-	vmg.vma = vma;
+	vmg.middle = vma;
 	vma->anon_vma = &dummy_anon_vma;
 	ASSERT_EQ(merge_existing(&vmg), vma_prev);
 	ASSERT_EQ(vmg.state, VMA_MERGE_SUCCESS);
@@ -1067,7 +1067,7 @@ static bool test_merge_existing(void)
 	vma_next = alloc_and_link_vma(&mm, 0x7000, 0x9000, 7, flags);
 	vmg_set_range(&vmg, 0x3000, 0x7000, 3, flags);
 	vmg.prev = vma_prev;
-	vmg.vma = vma;
+	vmg.middle = vma;
 	vma->anon_vma = &dummy_anon_vma;
 	ASSERT_EQ(merge_existing(&vmg), vma_prev);
 	ASSERT_EQ(vmg.state, VMA_MERGE_SUCCESS);
@@ -1102,37 +1102,37 @@ static bool test_merge_existing(void)
 
 	vmg_set_range(&vmg, 0x4000, 0x5000, 4, flags);
 	vmg.prev = vma;
-	vmg.vma = vma;
+	vmg.middle = vma;
 	ASSERT_EQ(merge_existing(&vmg), NULL);
 	ASSERT_EQ(vmg.state, VMA_MERGE_NOMERGE);
 
 	vmg_set_range(&vmg, 0x5000, 0x6000, 5, flags);
 	vmg.prev = vma;
-	vmg.vma = vma;
+	vmg.middle = vma;
 	ASSERT_EQ(merge_existing(&vmg), NULL);
 	ASSERT_EQ(vmg.state, VMA_MERGE_NOMERGE);
 
 	vmg_set_range(&vmg, 0x6000, 0x7000, 6, flags);
 	vmg.prev = vma;
-	vmg.vma = vma;
+	vmg.middle = vma;
 	ASSERT_EQ(merge_existing(&vmg), NULL);
 	ASSERT_EQ(vmg.state, VMA_MERGE_NOMERGE);
 
 	vmg_set_range(&vmg, 0x4000, 0x7000, 4, flags);
 	vmg.prev = vma;
-	vmg.vma = vma;
+	vmg.middle = vma;
 	ASSERT_EQ(merge_existing(&vmg), NULL);
 	ASSERT_EQ(vmg.state, VMA_MERGE_NOMERGE);
 
 	vmg_set_range(&vmg, 0x4000, 0x6000, 4, flags);
 	vmg.prev = vma;
-	vmg.vma = vma;
+	vmg.middle = vma;
 	ASSERT_EQ(merge_existing(&vmg), NULL);
 	ASSERT_EQ(vmg.state, VMA_MERGE_NOMERGE);
 
 	vmg_set_range(&vmg, 0x5000, 0x6000, 5, flags);
 	vmg.prev = vma;
-	vmg.vma = vma;
+	vmg.middle = vma;
 	ASSERT_EQ(merge_existing(&vmg), NULL);
 	ASSERT_EQ(vmg.state, VMA_MERGE_NOMERGE);
 
@@ -1197,7 +1197,7 @@ static bool test_anon_vma_non_mergeable(void)
 
 	vmg_set_range(&vmg, 0x3000, 0x7000, 3, flags);
 	vmg.prev = vma_prev;
-	vmg.vma = vma;
+	vmg.middle = vma;
 
 	ASSERT_EQ(merge_existing(&vmg), vma_prev);
 	ASSERT_EQ(vmg.state, VMA_MERGE_SUCCESS);
@@ -1277,7 +1277,7 @@ static bool test_dup_anon_vma(void)
 	vma_next->anon_vma = &dummy_anon_vma;
 
 	vmg_set_range(&vmg, 0, 0x5000, 0, flags);
-	vmg.vma = vma_prev;
+	vmg.middle = vma_prev;
 	vmg.next = vma_next;
 
 	ASSERT_EQ(expand_existing(&vmg), 0);
@@ -1309,7 +1309,7 @@ static bool test_dup_anon_vma(void)
 	vma_next->anon_vma = &dummy_anon_vma;
 	vmg_set_range(&vmg, 0x3000, 0x5000, 3, flags);
 	vmg.prev = vma_prev;
-	vmg.vma = vma;
+	vmg.middle = vma;
 
 	ASSERT_EQ(merge_existing(&vmg), vma_prev);
 	ASSERT_EQ(vmg.state, VMA_MERGE_SUCCESS);
@@ -1338,7 +1338,7 @@ static bool test_dup_anon_vma(void)
 	vma->anon_vma = &dummy_anon_vma;
 	vmg_set_range(&vmg, 0x3000, 0x5000, 3, flags);
 	vmg.prev = vma_prev;
-	vmg.vma = vma;
+	vmg.middle = vma;
 
 	ASSERT_EQ(merge_existing(&vmg), vma_prev);
 	ASSERT_EQ(vmg.state, VMA_MERGE_SUCCESS);
@@ -1366,7 +1366,7 @@ static bool test_dup_anon_vma(void)
 	vma->anon_vma = &dummy_anon_vma;
 	vmg_set_range(&vmg, 0x3000, 0x5000, 3, flags);
 	vmg.prev = vma_prev;
-	vmg.vma = vma;
+	vmg.middle = vma;
 
 	ASSERT_EQ(merge_existing(&vmg), vma_prev);
 	ASSERT_EQ(vmg.state, VMA_MERGE_SUCCESS);
@@ -1394,7 +1394,7 @@ static bool test_dup_anon_vma(void)
 	vma->anon_vma = &dummy_anon_vma;
 	vmg_set_range(&vmg, 0x3000, 0x5000, 3, flags);
 	vmg.prev = vma;
-	vmg.vma = vma;
+	vmg.middle = vma;
 
 	ASSERT_EQ(merge_existing(&vmg), vma_next);
 	ASSERT_EQ(vmg.state, VMA_MERGE_SUCCESS);
@@ -1432,7 +1432,7 @@ static bool test_vmi_prealloc_fail(void)
 
 	vmg_set_range(&vmg, 0x3000, 0x5000, 3, flags);
 	vmg.prev = vma_prev;
-	vmg.vma = vma;
+	vmg.middle = vma;
 
 	fail_prealloc = true;
 
@@ -1458,7 +1458,7 @@ static bool test_vmi_prealloc_fail(void)
 	vma->anon_vma = &dummy_anon_vma;
 
 	vmg_set_range(&vmg, 0, 0x5000, 3, flags);
-	vmg.vma = vma_prev;
+	vmg.middle = vma_prev;
 	vmg.next = vma;
 
 	fail_prealloc = true;
-- 
2.48.1

