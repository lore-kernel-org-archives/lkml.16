Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E800B1531E3
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 05:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748497175; cv=fail; b=uF2cTV9Rdq6Jt6x1pr9HotoqCznADPmhIl48BfYwcnGxShhz5cX5wAhqMLsFDzJCX6iqzjTY+X6Bel4fb3GuI94sZm8qXXcQpBwjYzTr2+1ycAh1Kb2L/u9AhE7T5q0sOeNXQLADXNhasU82raNM3eGQuCa0+ZBalPWe8KquJTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748497175; c=relaxed/simple;
	bh=mIIFGJPse/ajGvuVHtazy86/cY+bWbBVlp4csRgizFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tczjVUUb3B9VUvC+tojmx51uqMP5YYtDVF9TIgQz6WoPmX1LcteSxSGUyVDoWr/07DC9N9T0A1cjl/6FvvlIiFOYSYWrZtpg+V2Hs1L4V769c9mqablCFbB4+uoKZUs0Ci7y9MWtlBPTAg7/SL6Vqgg7nmIN1gTruUM5yu4UlwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kWQ5G6HU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=I1WMjd0E; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kWQ5G6HU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="I1WMjd0E"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T0N6TO023348;
	Thu, 29 May 2025 05:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=oq14LFjiwHEbkUm/l8
	0p3HDhTyVGiaPSJa0HpLTb3pQ=; b=kWQ5G6HUnkukcaQd2+R35bkzJiYEXCDEa7
	NY353sTTkLK9DjdWX/23OmzVO0SJR/Jh9gjyl82caMBU9iNQvKl9KMKusqMkmMF0
	Oq5pRw9yGMJCpq3PwGgWz2JYzPlr8XJr0Y6dJYVfFrkTFrZwbLKQVHEXQBu6CBEi
	fxAEl/pspVab2JAaVHcx9X3S6UkAf8bjyOESMjjbu9dbSmCVjKLzDMxo9sqlmlYx
	CWwQEQGjA7U+bwEFnDSyNoJhl6LXezPXmN4qNBxB3WOjCZonDaVB5B34jYwJBQqH
	RNMJ/kB4PJW+IMRKcUnYqPjF/85PQXoyMULyp7jXca0+4Sf6gmRw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v33myj0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 May 2025 05:39:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54T3UKHC007198;
	Thu, 29 May 2025 05:39:18 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46u4jbh0ad-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 May 2025 05:39:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P2+zAU/nUcarbF++HhkMypjtQ9nLgvslqutDPG2c4VwZFZtD+opuyUIjSHNqtv8fSfax9HiAyhRFAWZAm8FkKHx4JWC6AOUVVW+8ExaNRz2w/DArCRgw+ABG9ERXXdP7VfdnnEIml5Joz+P4rMn+oA3JpQ3MLW0SLKna4f/5xWqEkG72DNm6eatgpVtN9nNAUs7qOK9KHDlOADcDFBsRONHu5S6/5uBUM0oYB7wgyE94JEKPD0Fc4fqXRERIjiTeOMh2adWYFZ12E+oRRnkP6BwyoJqE0ZK1zQZ8i1COe26UlVslwlVkgpP36G4jChNK4SBsIhMzhB64QpThZMt98A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oq14LFjiwHEbkUm/l80p3HDhTyVGiaPSJa0HpLTb3pQ=;
 b=Z5+GQiSiwnXe60zNqwjCJVgD23dBkZ/cSmVs11wl8NamboGYjqsgBs1kR4VzkN1kOHeotu3O3C0OFFLO9D7mR8lRbtz8udC7ZhSj9AiR2gjzYRNbssvYnPSTnKizZoWGJk299clMWLwooXLvGMRgoxMRYVBMlz6fslUgGc37tLS/58xfZs4TUUnIW855Jw0VssItkQkpm+PyeLVUSEJyiibzkVbnJbphibe3Q34HYxU+BHdVJkD5OoPRHLFGXYN2WqRisXVKkxawx2cTFr8hIU6sn3gMWqsJpHWWY1JkCKsEDYpzhW8jEhW6eYaA1ibzT0MYJFBUu/DCKDcvOr60kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oq14LFjiwHEbkUm/l80p3HDhTyVGiaPSJa0HpLTb3pQ=;
 b=I1WMjd0ErEISQODdLlYo9GR7hzXCZWrIwIvOFpT0JpPwUt02nKPYgB7gVQyWi2SM4sWAeOThNznybsnV6J4JCJXlYjRjnB2jZ6w7Eotf/cuEEoOq+UEFGhz7DXsLpYnYKK8Fv9ouU+waPK2tuF7Yh2q324Ej+QTzE1bvE59ajuI=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH0PR10MB5753.namprd10.prod.outlook.com (2603:10b6:510:146::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.35; Thu, 29 May
 2025 05:39:15 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Thu, 29 May 2025
 05:39:15 +0000
Date: Thu, 29 May 2025 06:39:09 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes via B4 Relay <devnull+lorenzo.stoakes.oracle.com@kernel.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        Pedro Falcato <pfalcato@suse.de>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools/testing/vma: add missing function stub
Message-ID: <8bcf5f5a-a4e6-41cb-84a8-e2919b0785cb@lucifer.local>
References: <20250528-fix-vma-test-v1-1-c8a5f533b38f@oracle.com>
 <20250528155218.a8b755912d1eed25148c59b4@linux-foundation.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528155218.a8b755912d1eed25148c59b4@linux-foundation.org>
X-ClientProxiedBy: LO6P123CA0027.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH0PR10MB5753:EE_
X-MS-Office365-Filtering-Correlation-Id: af36cdfd-580d-42a9-c595-08dd9e7325fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IMUYyBjIRacoyomhE3+dkE5MMWB9NEjqJrqcx/kXPo9shxicXKMdik7okDr5?=
 =?us-ascii?Q?vp8L3BsqgFQOMvB+sVVpbofSe+YYPKXZizUnlQ/yPGD3iP81LcWEvkb3h/SX?=
 =?us-ascii?Q?ZHQ8MOI2N44ockObgEnsAlrNtWsL+2KzPlf8n1U6+BDDrmc2AktK7v/Dkc88?=
 =?us-ascii?Q?D7JsNRGV/t0FCn0AYUIPh3vwB0g5tLwfQK5aB5P35CTVyVUOrBUWYnBUBaeh?=
 =?us-ascii?Q?6julVQGkAHFjhBgUphefuuU/hxNuH1Vs0iEr1KxxnEkZsr2muCxM470l3cVT?=
 =?us-ascii?Q?aiVY9RkzrA9B9bBvg+H5nYOvQcZnH85R1jYSGipc3QCYbiYlERmcHxWJT8h+?=
 =?us-ascii?Q?xvB7YAHDuCOrHwrF4UWef1GMQZkd09voPdQSgYQFM4bpawSHsuOPmw/YKVll?=
 =?us-ascii?Q?H5MxgAho7CSZ3Bk6v3Jv8Uq7dz2t7gypsttQrNSjQhxqgf42WloV9P9Oeseo?=
 =?us-ascii?Q?K/tvVLCUfNKnXds5ymxytVD1F/RGRA+dW42V7jCjL01H3+dBS6omIIl4wSAg?=
 =?us-ascii?Q?/ExtvNgnTgT8Sw9U7Qv4U4VuAuo3sEfVZ6hU5LeDQiJpnCla8PvOMPZyKNOM?=
 =?us-ascii?Q?WfhYcdG2icOCFfrzjO0ARcEQMPgmJbfAc3uK1iZjdsuQuxviibBrvbCE5iTJ?=
 =?us-ascii?Q?dEQADGhoWExtPF9mwcKlUVkz8CU1o5a/ir57QZgafhysdF0NxUSpZo0Pou0y?=
 =?us-ascii?Q?OKAir77wFuMcMtxR7leNUWDgJc7cer/isaxfjq50z1IHidd9d+UKoilQYqBL?=
 =?us-ascii?Q?yYWi6gXkDLoZvabY5U+eRGE8RWH2nV0u+uFf3tzLXSeqYK7XsfPWVH5dxBwa?=
 =?us-ascii?Q?Y2uKdNOTvB6fVq7uUoPYxskAc3FAnycDFt41e8pwpt4ze4APKoRkHaV8S7UT?=
 =?us-ascii?Q?bYll9DXSo0f8WNwWPf5E7DJT3CUAf5uEQLTzprMQuDG+isU2O7J6fcuEAjdI?=
 =?us-ascii?Q?Unwa67/lZT3JU2EJn6ReNwTXBXADpvVX3Yi1aKl8EzQBImD7e0NlskcTGE3C?=
 =?us-ascii?Q?m/E1h1AEzATPvEMmwbhtWQi2CRbMvGAO3YU9vMMgliMr/ewA60tHVhzSpQnZ?=
 =?us-ascii?Q?qHH8llt1lZxP6D6hbKyNROUXALrbgUSV8hxEzpj+4ggFcCKsE/TeZ614XsOc?=
 =?us-ascii?Q?cTq2Z3+T4SaYRwuzIFxXsNRxQp5trjTYXikO0O0dF7+KeLT7jFI5d655mL2K?=
 =?us-ascii?Q?Ge97aJg0pkmaY/7HwwlAnl3sNjzvbpMaMWW7+2fOEjH6/bhEQnukuXPpPsYs?=
 =?us-ascii?Q?91AsihMst4I0bZkqoxQrcv6JIXvBz+wrUMFXlnz6baeLQ3Fliwr83mb56mt2?=
 =?us-ascii?Q?EnvFYAP2U5wu45URnwcy8zX2u/90BOllEdgduWFJbmDtbgBhs1sNXZhL8CxL?=
 =?us-ascii?Q?kHdJl42odPDuuofp6CzA3kp9hlwo+PNXyuD/i0vaYj+F32hvMM8h+uFN5KYS?=
 =?us-ascii?Q?DmWLXzouojo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iqx2D3UAt+khPDfhvo7+3k1W7Ak5282Nk/yMYF/7h9Zz2Wg4TKLHAFKpahmE?=
 =?us-ascii?Q?ZZNXkTI8cy8vx9xd8mxLtGshWNiZIam88il37x1CHYXFITU/n1zGip55Iacn?=
 =?us-ascii?Q?TFmQK7uR9KkbBymmL+XjqGK+XWfmQ9ucEdv4hp9Z+vNvY7XGnYBRGRSPIvo7?=
 =?us-ascii?Q?u7m5kDQWhIGGSMruhnP7BnUJ3Lf6VzHBt0Aj01l1t2Ha/iTVFNK+Onrhel6f?=
 =?us-ascii?Q?RaZK+7OmolcKbRUd7lcdc88DaezGNmn6WUajQ4/lKJdaDaxs5WhO2GzjSpka?=
 =?us-ascii?Q?J9qj+oHpd+BjzeM6Y0/vpcxxSfVNFo/IxJIXgBgSZr2kvPirb8Z+k6zz5k9I?=
 =?us-ascii?Q?I6aYaI7Tkr3wqGyWnN2EkEC8P4Yf7QnzKakgQnDLPFkDF508pvh3N2UzEMtD?=
 =?us-ascii?Q?Re7klsht59uc/dnzNYy0PR5d7PUehCtUPAlOdwRYPhJYHbkqJci8wD+t8kf5?=
 =?us-ascii?Q?8TlARxUMYLvFX0Spy9knEv6BnQbxotVh9G8SuQnHz0X+onw23PMD/1KA9CEH?=
 =?us-ascii?Q?2VRz4iewNmFj2DAbjBceNv/RYe5WwQIWVBCKkQDgsZDTm8MMTQhR63HAg5ub?=
 =?us-ascii?Q?nVQIDUFJSUX8C0Df1ZaknC3Ksoqgsv7rpTnX0u7g/LzCpKTdOPKUfGT+xqty?=
 =?us-ascii?Q?iIBa/up2XoTIr3rJmVEWsqZqM0Xf+LFD0Djkec/Baut93inZR6XBOkWK82nA?=
 =?us-ascii?Q?hI/8bqU6+pRHWSjDnlhShlu3uBsGq81kcumYr3QsURoAkaLUaMOkGDUdmB6p?=
 =?us-ascii?Q?T4NatDmWZJESPdMqhwoVDS5VVjQGSrpphThtbh8fLmPPjvC3+6A4+7HgbOqv?=
 =?us-ascii?Q?nlssdXVcVzMwnhvEzzPbMhQrSf0IpO+cAByjjakj+FJGP4F60Me0lCBZOd+5?=
 =?us-ascii?Q?+3t7/V9/JtAS67K3D8pqhZLoeqTMA1QUu6EF7iTsFtUX2VUKwZqb378GWGEw?=
 =?us-ascii?Q?4SEY4Pq7fmbEciEAeC8EPgNtAhGA1r9NDhYGDwawIPXAbEe736Yyridgw6V+?=
 =?us-ascii?Q?oFUGRG1roqOTh+bvQ0+dZ9Jh/NrNMnDgP/3aUhrCad4K9vK00c7EpKkzKxVW?=
 =?us-ascii?Q?dBlf8t11TLzmCoJdoceKcX8MQp9BxTUedwBhFRGK1VS49K66K3b2vVPHC7pS?=
 =?us-ascii?Q?2dUm3J5YQpHGGoqByFRGjKnRuAmNAOamKyLsTGmMoABL7Qo3r7pOcrjN24Px?=
 =?us-ascii?Q?qAPddyQZKZIG+IpbTlwlpqliJUke8pVq+YfCNqzUIn72bcB1oLhpmhXcWF1T?=
 =?us-ascii?Q?QaHajxKWyD5QJZmn+YKYZUxMei8lUhx87A5d8uU0g/tMGDLw13d6nSHig9Tr?=
 =?us-ascii?Q?j1BwnTj4e5/bwz6sS1JPinEeRAbG1OeZqdvutxbsxIHzIl58/zZNm1iRgHKp?=
 =?us-ascii?Q?hsVm3kdx6Nh9mfsqoTtm5BCblY/oom+XN/R65O04kBYNkWrxKecxYG2P2HQT?=
 =?us-ascii?Q?t6utg3RMHL9xCWor0CdhpiIQvQNyH5337my6aY+DFNsPVAbmm0NB3FgpAMfG?=
 =?us-ascii?Q?k2Qmhlnst/Irh+NtssN4xDccPhcPy9zMe70UO1yGKS1R26KNN71tmJFJU78/?=
 =?us-ascii?Q?z8jK7BupRft3FAk1ZydrRqYcSSJOIcMTXY2eQtdm5NORZxeadTDF/5AYzAp9?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	W06n6hhnPsyRMhGgUyCOcm8BSel1ULV+6Ho6FesykI1tf0fZM7ILSSzslDuo3EVG0hr7KvFKJz4vCP1wLyeNC7Fosk0XXZTKGUOkCSLI0uJhUNSa0xwh94l3b0T1pON0G+pQ/lwF26LUQb/jqhoh+nxSeNj9mUykzwH+ymsgaPeUBvnBroaTqIKoP4PvHIr/WSS6vUrpIyPDmWlVDk6LlFZbS3nyHd3ydH6C1aDVgQnavWLFwgdhWYBwsjDL32S3RaO7WaXCMLTdNCTZUm96vGwkfzzU+duW6+NNJKVMx36dEh6Xcthm0Sp3v1fMoVnPYUPqbhiVElhPAOia0W8b6LYpt9RWqoX9Chqrf5Z4aW0433ge1vIbSC9gHg95hKGvYAMFQR81iL2RJzSSXe6Mg3NWaJqX1XACj/23kBxZUQQ4UH53Ebiq/iQH9+a9ASKwc0q9R2MHsrZzYamCCDtpQ0q5caVkQFTx3OuZCTKcWAG1mkFXl3jrYEWaN17bYYDmw/CpUNnTSKrHKofUT66VlwKZbcD3SRW4plVQ9UAldZM0VGdrByH4mQVLvJz3TPmP+bokzgjG7IZeTERKRB4Tf0I0KD3g4wvT08gZ29FWJpU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af36cdfd-580d-42a9-c595-08dd9e7325fe
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 05:39:15.3228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 97kEsMNd9UhB8JVkSXZ4etzn7hpUm34Sk9PVcYJbYXl7Ba7+QCr8yVUxuU4vOXczSUAMtAWAwvByDtNm5vy3tEa78Wa0tU/BMnLASwWj7xA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5753
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_02,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505290053
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDA1NCBTYWx0ZWRfX0LQSqmq7eODc pXJnXqWgueSGosF8aoXqLTPB5KppayfivxDZ6CV2isS4GouFVkkHTZ+0SsZtBy9bY/iRNT419Lx 9Ais/Aafcgxa1zu3RsunnczOsHLLCJ5spMlashM7hWsraGqLf+SSIDqwEpPSgfpZ9j9aW/gUPTf
 U3Kcn5F25ozS/H2s/+Z7zEpPiQBMZjysbB5Gr72mUnH74+xzx/qGl6FTUbU+libRWs+yqtHmLYV aJ+8a7P3verfbz/5N+/zVJTkS6ykTZ3tYPfjv3DCz6xK3I88X0DTsGERqp5EUg/vZOfK7yXCjeB QeYTSLleZOKBtGkR6BuAmJTZ5HTKRd6w5nZNuay5cTYrUUjq28HShh0n8Td6HnZ6IFUx+z7d3VK
 M3ChS9Pgrs4RPO+D5S4mAMAZvUtrDLhfph8k+Np4Ff3xEpA60nYQ3F4zRlSrAgr0n3jtjm7H
X-Proofpoint-GUID: wo4EUkcKJ2PytO3tF2yX8bHbHxutlVGP
X-Authority-Analysis: v=2.4 cv=aO/wqa9m c=1 sm=1 tr=0 ts=6837f307 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=6YXJ6j-XRUv44xt_W3IA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: wo4EUkcKJ2PytO3tF2yX8bHbHxutlVGP

On Wed, May 28, 2025 at 03:52:18PM -0700, Andrew Morton wrote:
> On Wed, 28 May 2025 15:15:39 +0100 Lorenzo Stoakes via B4 Relay <devnull+lorenzo.stoakes.oracle.com@kernel.org> wrote:
>
> > From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> >
> > The hugetlb fix introduced in commit ee40c9920ac2 ("mm: fix copy_vma()
> > error handling for hugetlb mappings") mistakenly did not provide a stub for
> > the VMA userland testing, which results in a compile error when trying to
> > build this.
>
> Thanks, I'll add the Fixes: and the cc:stable (because ee40c9920ac2 had
> cc:stable).

Yeah I intentionally excluded those, as it'll lead to some backport pain
for something that isn't shipped.

I'm not sure if we generally backport test fixes as a rule? Though I
suppose it might be useful if somebody is investigating an issue in a
stable kernel.

>
> > Provide this stub to resolve the issue.
> >
> > ---
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>
> SOB goes above the "^---$", please ;)

b4 decided to do this :) first experiment with it. Will look at options, I also
pinged Konstantin.

>
> > --- a/tools/testing/vma/vma_internal.h
> > +++ b/tools/testing/vma/vma_internal.h
> > @@ -1461,4 +1461,9 @@ static inline int __call_mmap_prepare(struct file *file,
> >  	return file->f_op->mmap_prepare(desc);
> >  }
> >
> > +static inline void fixup_hugetlb_reservations(struct vm_area_struct *vma)
> > +{
> > +	(void)vma;
>
> <Curiousity> Was this statement found to be needed?  Normally we just
> use an empty function body in such cases.

I _could have sworn_ I was getting warnings in the gcc version I was using
the past by not doing this.

At any rate, it's consistent-ish with other functions here.

Since this is a churn-friendly file, I"ll probably do a pass to make all
the signatures consistent (by just removing variable names probably) at
some point.

>
> > +}
> > +
> >  #endif	/* __MM_VMA_INTERNAL_H */
>
