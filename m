Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8542198E9B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 06:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744786088; cv=fail; b=Z6OaA55Jw4QM6c+Amb0T45PrYmN0mj8Qi6Rwt3YIDlWEQUbwSIuhLs2DxCj/WrDrUAdduzmFE8ywtNDdvmy6H8rE4yJdwlCXnxNoI7rpDqQqvq/5fTd61FoegFRY1V1VNW291WuQHUtxx6RDNWLpsWVJc3SWG/fguaKiGr0uze0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744786088; c=relaxed/simple;
	bh=nitkPIEH+2phqEy3wQJF+KoY8p/C8qWDEB/SQA7Y2hA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ayo+KzzoAVmwkMs3azw+sSrPyNlYjLXCL18xoEBsBKyH+iivTWqm/RxbCr1i7VKbbOd22F9Hv+nY+UIoTtpmNT3WjFBiAlTxRcuLgZj6DZnOGfAItqVqLPyZKOCNDGlvaDAyth7LpS5s2KaFNA7FRuWEg5R35cTarCGhFG2muzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XmbwYj61; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vSPy+kue; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XmbwYj61";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vSPy+kue"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FMNde7028658;
	Wed, 16 Apr 2025 06:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=M33PlL4/N9+LxtjAQe
	IE+YAVd6f5KMUqaEhDaiukTwY=; b=XmbwYj617LneI2JnvCyKZ45K1hpWg6ekLr
	cwboo8hW8V3LUUKKGNTwTAhtWyohGyhlR2pnbN2lcWcnw66+qcCEcNmQ2dRn/zyX
	hQ1TlsOS7pAfhm2/kS90fxNXFsJdgrlJseWoeUhe5WGDiHbEC7WSJgppmBBTtZ6R
	YdjcVRbDMPVNI1LTB42GYDQrGMZjKSsnNQ006AnPW84kvtM/WXzobLbjzqXvh4hA
	K9wd9BdXaOaMq3wwRg5fKu7brv1078XTiveNs+tuBIdX2awUei17mXk8jow1PSsO
	ed4qkMZ9cZQkLW7EQaEU8nTqSZ/W0oJ0sKKrSKD3IXWAMPcXaOww==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4616uf3jv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 06:47:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53G6HTIX008636;
	Wed, 16 Apr 2025 06:47:31 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazlp17012051.outbound.protection.outlook.com [40.93.20.51])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460d2r6r65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 06:47:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uEgWWD3RktPT2e7Q3vvTXx8ZbH5PV5hjo9YaoSgLoTGjWxs7UCVCnvhv5hZVsrfsvVOjY9AOHOpXhRkDukhAgN40GhRgHTi/qajH2O+0MR4jdlFTNHGQ1biH78srfH6+DHgieuFlIRCWv8bkJwtgKB+iJPIg/FY6MkdCCCbvizq15y+N4ziN873ysHBsEopjOTzyoQR+zwHibvwooon/xPcuTNgFmM6D4gAnCtT9c1mhBq1e32kfgz84+9JZ9yQgRLlZMMRDwWgpmYrg6WZbUtqIFEwz0KtAaAlMYpENIoN6S/jo71hLGPBwpJeP+w/aZjFlFQHwoMvXv0AgFr2u8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M33PlL4/N9+LxtjAQeIE+YAVd6f5KMUqaEhDaiukTwY=;
 b=Wk62OhEJmqSk+cBx7Ur1U316uoI8VjK04A7RmKmVCrHI/1zVlNoz123dKlToA5CWUMGHIA9o9ktKns1YXea8wT5HsQE0aNZAfCnbqYB8HjY6XrM9R4wYORvK/2ilQu2PGh+Hu9c9XlIDHsIT4DYE2o/bRr9Eyjjj69Ma69CjcQ71mQEEoDjwcHbPmaWD0HPwagpXJlIB+lmrRUnjMmMjQcii6K8z7uZb53b5ySVTg7jKZLgX9QWXJtZe7gswhit4T71dW+803yY99qokvOvmfw1fLGzun9vTGxMBSMEZVvQ3oCsZaAOb3rIiYXULuQ4izXinambCusdyS/bdJJvSFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M33PlL4/N9+LxtjAQeIE+YAVd6f5KMUqaEhDaiukTwY=;
 b=vSPy+kueSWdsZwnf4690WeSMXOMZzJoPPGtcw60ADkmeA51eaRobYrMhzhhSskabMLG/WxjgUEtv/pYZwgjWhYSXhO3lEGFtNjoHHeuyOfUVjIBApFrvyFYCUqxK7VEXfv/ooJ+XwTUoLTo22Xjyv2k+Q0V9oSYOQ1ax+qV6tQs=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MW4PR10MB6420.namprd10.prod.outlook.com (2603:10b6:303:20e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 16 Apr
 2025 06:47:28 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8632.036; Wed, 16 Apr 2025
 06:47:28 +0000
Date: Wed, 16 Apr 2025 07:47:23 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Jann Horn <jannh@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Vlastimil Babka <vbabka@suse.cz>, Matthew Wilcox <willy@infradead.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        SeongJae Park <sj@kernel.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH 2/2] MAINTAINERS: add section for locking of mm's and VMAs
Message-ID: <5f24262e-dd11-462c-abc8-29b71c0e820c@lucifer.local>
References: <cover.1744720574.git.lorenzo.stoakes@oracle.com>
 <0722c3fe0cb4c1e54ce01c7689ce4615ecc87e16.1744720574.git.lorenzo.stoakes@oracle.com>
 <bxgksbw7qplw3pp7gpve2ir63oyds7mxsnvprz45fj6oadotm5@syvchqjd2n6z>
 <0e796032-4f6d-4b7c-9ce6-6519f8f245af@lucifer.local>
 <g6u6f5euahanr5tmhjakxude6eswz6vl245sdzmhsjwv34pz7h@cleoudcjnwfr>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <g6u6f5euahanr5tmhjakxude6eswz6vl245sdzmhsjwv34pz7h@cleoudcjnwfr>
X-ClientProxiedBy: LO2P265CA0402.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::30) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MW4PR10MB6420:EE_
X-MS-Office365-Filtering-Correlation-Id: d0a0eaa6-3cdb-43be-165f-08dd7cb28e0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B/j9/gJY3v1LUwp056b4Cua48Gd1X3QaEnyB7DE2AlCjJ7gEeMQ9UHHoF/b8?=
 =?us-ascii?Q?Xm39JPLHu4TkJ1im/BsBDP3y21ZYpDiSVcH8huTP4niXisjr7TdNb2J6OoR/?=
 =?us-ascii?Q?mEidYAp0i4NfHwG04eqWqxYIPQTl4bZx2B9rMdq7795IB34XDTIoaiGNfmYE?=
 =?us-ascii?Q?6amxwe8CQrVNsijl5YmYVkeUUJTFONXs4N2OnVrnagCDt9PkDCm9tnGJidAm?=
 =?us-ascii?Q?OfeqoR62aqJRcL790+ybiUtRiadWPhDea1JE1UWGK/gEky2yPtOZIxQBlnnM?=
 =?us-ascii?Q?vslZbzmQj7lUmAZUcmq0fW/azsDqvr5cnz0BBC3q984mfGUZpceXHPvivZlY?=
 =?us-ascii?Q?ZolJ+seZp0vqFa8hahL0jYxJeOJRBdqfb752XbKRBYcHEQmCL7+SThol2Pwf?=
 =?us-ascii?Q?NToqNsiWei8lcIt3GaN0SMGQUPwffisRUPJxmiunpkGYNXLMCbYyvicsTb/e?=
 =?us-ascii?Q?u7CvvXMlbhgxW5xk4WeqffWhjkHWoHM5V6gzyv8rHFWPoCPO3i6l3xaKBz/t?=
 =?us-ascii?Q?Ef9mD80IspGBBZwSeTggOg4r8N4AIiLwX6eKMVFTFP/rXvsNyFKMnDgHvEZq?=
 =?us-ascii?Q?rK8bJhsQ3TAiIB+GOZMoT5ajj0lX8xzsLVuZAC3JVwECMyGpaEYf6EjLFLjd?=
 =?us-ascii?Q?6t8OeotXiWyvK4/SOiOLb8nNzwT6TyUMOV0lC90AkBQYcm3mPjTRH6ZVkDxe?=
 =?us-ascii?Q?J9y6Eu9VvJHO+U/rlPsJF/COwQHhwZPmCtgff3+/DnD/zXN1P3UwgGZCyWt+?=
 =?us-ascii?Q?nfTrGm99VH1Umj/TYefpQgsKjJBXZVp8BYSbKGE80MveNZoRFteLsLu8xBmy?=
 =?us-ascii?Q?BYa761MKil/pNTCVh0siFnNVNUNZUmjsaoLdsbRAUma1o7WxmZoBmt7No5xM?=
 =?us-ascii?Q?MUKyrP8ly1d5oIvP3dVaEW1u9tNMvTyyc31P0M0rkRfNVyME93zJDlRjDoFB?=
 =?us-ascii?Q?ZrN6MweW+PIBc+qVxbjyLEEyMx+DukMzwAAv8W3cRbHsTeaIx5VTnjcpYnTg?=
 =?us-ascii?Q?dH9TwOXKQMfsNRgfMyB12xsp3BCGr2UG1OXW5m5DVC2V33E8pio3zGafIQ49?=
 =?us-ascii?Q?zF7VZ7McESjSQlbM3EJWmr0svI1DrCLRhoJUGciOQTsNFNZFRmvRVDJDpGGH?=
 =?us-ascii?Q?FKZDvTxbp+uGRhHll9ikbTdTeysAlHml8zxZuWJfbNcsH5oO5iN9u92WNIO4?=
 =?us-ascii?Q?qJFb9NmqqcjphuoCodNvCV++jrYi/jVJzSSi2PZbrFD2Rqmd/XB0SXNySZqr?=
 =?us-ascii?Q?dcaIgLYAfKGuoVQjO7P0/EMcTz5pxqXQE84XkG/aHQXMxNZCQMc3+GfjsLvB?=
 =?us-ascii?Q?K56FRsxZKPwVtp3qORn1nsRcGhIsaJmRg9RXZvr0KWEK+jqU+wstVaCBVgQ3?=
 =?us-ascii?Q?W4CsCFk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cnakfEjM8/I4SWOuWApTrSiIAU0+whZelOT8YnqYGHyECienz9Mkv6s3HCXw?=
 =?us-ascii?Q?WvhlVN8jHeusfQtRcL5akMAcTybamT4h7JGj2EBHq/MEZRq5g+pHpUgTgC/Q?=
 =?us-ascii?Q?U9kMrgeZX861g3FuCgIzQbyD7JY2mMNFd0Qr3aTaFXfpBaM8Rpb0RcsmkVbr?=
 =?us-ascii?Q?bHpWhzjD+45JZdevS2jP0iY3ETkZqJw5qwAPcyU14PsnLa9uzr0X08iFR8Qg?=
 =?us-ascii?Q?s98eapHNH0Sw6QBIiHLqwoqpSqoFZRJEYwj0QQRSDK0wtzjHqkdMZ/IzGQQm?=
 =?us-ascii?Q?Z4pF2H5ofKuY9tKeI5LtfHrrodxa1ZRilev8pVgcglEEE+WmvoXkvitMCLbQ?=
 =?us-ascii?Q?YQfBoTlUFX/2rBi4C6IC+l9iB7+aJ7dNueyQOEMOu2ZGxLfeLSZ9MxelGVhz?=
 =?us-ascii?Q?HQAK5J6fN1zCCyQIifTX7JkBJxk/6/CzXxVBt6r0YuV4m3Qt6Kx/4B+ZZ8n1?=
 =?us-ascii?Q?fDixg1J7yuXfaIt4msG3eGSiDC/0chiJ6cUqkBevT89vSIDGqIBQsXGPCWDn?=
 =?us-ascii?Q?svbNh76U9pS6QW2D3b7i7R3h7bVFvIFZKSARW/Qs2yaGgnZdRbNvcdh6MObc?=
 =?us-ascii?Q?S8076fiM9fnjasEFSV+7AeHGX+a7fwUeZNPR9ykqWe1YtRVtEP1j21CIDeBh?=
 =?us-ascii?Q?RVUW09vstf1o97T0K6yM0Moru7uliuiyz9nkw2+uv0rKWfi30NOMrUchXALU?=
 =?us-ascii?Q?wcPiS168v3EJYiXtH7ZR8NEOxH9E6v7n4hXfmVl3Oeipi0InEg9hcUCEUZGL?=
 =?us-ascii?Q?cpPbVEaprx0nHREZ9N1K+/cBF5hBDiJ5/CPGe8xQLQ1ryG3PG4/9+6Lx+iCj?=
 =?us-ascii?Q?OmLsegunHfO+1N6eAcUIIP46iHZ7/aL1MnZBpXXzIx/ee+ey2bEHBx3Zm86o?=
 =?us-ascii?Q?wsIB/9wiB8Q+SN+35lYlU/vBcqaeHWwMkQS25XqTTB2FUNxj9pQmPVnKFxOW?=
 =?us-ascii?Q?FsQIAKdbKW8FBh5Nf8zSot/b2zIFSugyoUfKEfTJ/ySfioEojFj1pvi6d8w5?=
 =?us-ascii?Q?9G4chluqMbIye7JSBPcIic7bnArYXR0lWm2a8f4HCPRwGXcozVT/DcZdGd+o?=
 =?us-ascii?Q?XPeN7ySSv2+DElP3iA4wZ2VhWnbhWEUwQZcGEO+Cvbl5jmC0iuQa2xNrZiKs?=
 =?us-ascii?Q?qqYiDUjL2y/PCn6Se8GDHaPUE0/Oiwt4TpIgLuQUTIy5DHVcK7SPE3guZrQr?=
 =?us-ascii?Q?DnYzmpG58rMkKkdMW/B1P1v4J82MEpvLFkZLEu9aZb0DGvbBVj201eNB3rrD?=
 =?us-ascii?Q?667TeHL51pxn8N2MVZ9F//RWvN3R86ZyGcCfJwOUSpMJqAL+RcGCxwbnnPPJ?=
 =?us-ascii?Q?mUnJqJPzUrd7EaICAQ2PDiry/3+z6YhJgIneZfNPtj48XI7m23QXXM0HJETm?=
 =?us-ascii?Q?T5H7AuhWCxuACMjvMguTRwLnsI5RqlWhet/L+fvtRpcbTIDDZ1quK4o9+FjW?=
 =?us-ascii?Q?+xjev86YVZIYTCtxKh4ekPKqjsKJFmjrIGsTQZw9tQokOOJ3GV3/rWszcO78?=
 =?us-ascii?Q?a1y/yssaQIEgZ9/rj01fcrm26ffibezhVoGggVjw3VlAaHc0Lf/KYPae0OXD?=
 =?us-ascii?Q?V/Sb1/JP+RikUcA0YwTtb2HPuuR98jngu4zmmFQwAw2KCitGIPo4BSlYCq0j?=
 =?us-ascii?Q?oQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jbYGIF2R53UyUzKDDQvE98MbVgIbtJH1U7mJIfAi+uiNAFVZMjYDqITGw+T+lhxj7b5yVGX2UVgd2gDfN6ZRPl3ZjTwE5UVSIfwFHp04fake4ybOyU8b+TbxN4boWtKCn+crQ619SRfnH8RrsE5oZxBo2vzP6yN9pwg/ev8bUXlzSZpZsXT/52YEBK4mnLEPBbATBN2OlYtXkgvGj735sHuGonw6FgQpFlmD8LV4iLYnfUNPy1T9tKvVKzyrdr8x8CPCF7zjgQFCdQnGz7N6tZmDS1KnjOQAq2JJPd0uvXoJK63+ayP4/+H2PBlpbmG0J1CthpPs1pmd584mLku039tr0jEe8arTYI3RFewqjL4kbnwlMOLpjVCfB+iSxn6+6kcsrzSBF8bdrayqYLXZp4+yRMPhArZItuw/IaIg9kVAuhUXIUkZmBUO0sDncbElZnCOwQlUSYPGTgZRcMWjDAXXnwn7N9miRf0vREb5sYo9flD0uqfpLYd5E9XlBVLuTcalR/3jZHHY+sUm+FUmp1KOUPYZ3Bc9Kg1VE4fy2KHEPQksfexKd1UKZ5tVpIfWlmnnNpaD2YIrTtlgIkEZDGB0IM1KPziskL4h8zBLa1o=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0a0eaa6-3cdb-43be-165f-08dd7cb28e0a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 06:47:28.7089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: an1lISFtGlO4aChyDow2J+HYoWis6qqBO/yuElHjbiZpQRhD9NEsCQzG0JCFMl2Pf/9YUt4EFY7wFTtn0hOk8jM+SrnzBwDMux2lB3mSVSg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6420
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_02,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504160054
X-Proofpoint-GUID: X1AY_cb5AjTsENQZML7i6OqkX0Ye71bp
X-Proofpoint-ORIG-GUID: X1AY_cb5AjTsENQZML7i6OqkX0Ye71bp

On Tue, Apr 15, 2025 at 11:00:52AM -0700, Shakeel Butt wrote:
> On Tue, Apr 15, 2025 at 04:43:41PM +0100, Lorenzo Stoakes wrote:
> > On Tue, Apr 15, 2025 at 11:37:04AM -0400, Liam R. Howlett wrote:
> > > * Lorenzo Stoakes <lorenzo.stoakes@oracle.com> [250415 09:11]:
> > > > We place this under memory mapping as related to memory mapping
> > > > abstractions in the form of mm_struct and vm_area_struct (VMA). Now we have
> > > > separated out mmap/vma locking logic into the mmap_lock.c and mmap_lock.h
> > > > files, so this should encapsulate the majority of the mm locking logic in
> > > > the kernel.
> > > >
> > > > Suren is best placed to maintain this logic as the core architect of VMA
> > > > locking as a whole.
> > > >
> > > > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > > ---
> > > >  MAINTAINERS | 15 +++++++++++++++
> > > >  1 file changed, 15 insertions(+)
> > > >
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index 8d834514a047..ce55676a16a4 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -15595,6 +15595,21 @@ F:	mm/vma_internal.h
> > > >  F:	tools/testing/selftests/mm/merge.c
> > > >  F:	tools/testing/vma/
> > > >
> > > > +MEMORY MAPPING - LOCKING
> > > > +M:	Andrew Morton <akpm@linux-foundation.org>
> > > > +M:	Suren Baghdasaryan <surenb@google.com>
> > > > +R:	Liam R. Howlett <Liam.Howlett@oracle.com>
> > > > +R:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > > +R:	Vlastimil Babka <vbabka@suse.cz>
> > > > +L:	linux-mm@kvack.org
> > > > +S:	Maintained
> > > > +W:	http://www.linux-mm.org
> > > > +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> > > > +F:	Documentation/mm/process_addrs.rst
> > > > +F:	include/linux/mmap_lock.h
> > > > +F:	include/trace/events/mmap_lock.h
> > > > +F:	mm/mmap_lock.c
> > >
> > > It would be good to have more M's here in the case Suren is away or
> > > whatever.
> > >
> > > I have worked on the mmap locking due to the maple tree addition, and I
> > > have helped with vma locking in some areas.
> > >
> > > Lorenzo wrote the locking document, which Suren pointed out last mmap
> > > lock meeting and does make locking changes.
> > >
> > > Are there others that could be M here?
> >
> > I mean I'm fine to take an M here, based on having done _some_ work in this
> > area and being involved in the meetings and documenting, though I'd largely
> > defer to Suren who was the true expertise, and I also feel Liam has better
> > knowledge than I do.
> >
> > So I suggest probably, unless there are other viable and active takers, we
> > should M myself and you Liam?
> >
> > >
> > > Shakeel and/or Jann might be good additions to this list somewhere
> > > (looking at the edits to the file).
> >
> > Don't mind R in these cases if Shakeel or Jann want of course :),
>
> Thanks Liam. I don't mind an R here if you decide to send a new version.
>
> Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>

Sure, thanks for volunteering, happy to have you :) am going to do a
respin, will add there.

I believe Jann is currently out, so he can let us know at a later date if
he'd like to be added, I didn't want to presume!

>
