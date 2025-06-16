Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0333C2853E5
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 18:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750097942; cv=fail; b=MvMeMB1dYOp/2EGWhXairmVwp/0K49EpdsphzipTKVbdCUmg/PRNrSyIMcqzAhJ3Vs5cPo6T9MFbuMW/7Tvfjm2KEarVvyg6DwwOm5S1l4H6oEWnC7vD8k8umUhDzN4unucriS/e1Jwi5+b9vNGlt0ibbDPOF72dvN7PSpU5ba4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750097942; c=relaxed/simple;
	bh=ohtuuRsWem707+cNudH3pyyAhOI9CY31Ff08eB1i6K8=;
	h=References:From:To:Cc:Subject:In-reply-to:Date:Message-ID:
	 Content-Type:MIME-Version; b=JLdKczAsEnmk5yNJjmeSszjeOXCbaBO6JoF0c0kzQqIeWposFGCc/NUIBydubYt2xLuc1TRpBVxG3rXxoBjanmEgm32NuAHcRl7cGKEtvV5csXwWu7+z5SxhJKKVa1m7pvphQXLb9J6Dj/7EaNp2WhsTc7ZiDBjPpTLL0vbrXUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iuJLqVyJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NvuOw11e; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iuJLqVyJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NvuOw11e"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHuUhL027739;
	Mon, 16 Jun 2025 18:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ID1vNK5h8HR23wnlc2
	5MRD5EHuWPf8pTX+qA7SXAc0Y=; b=iuJLqVyJDMrC6VGwh1t8+Ytzk7udpaYe/n
	Rx0fLiQCMFzTtkg0IeMbvc6bdfHSbAhNoneO5JOsk5QtDcVo7J9QyHA4FvDYB1tG
	AON9ZM4P7njVlhTKrb989lZ+b7w2Y5NjulO5mXy544Vf+KIFqW7LhNyXxjthcBE1
	8rb6M1LIEPA3jCybODRi3kSJPaEAAR7+tRNcsY9MQ/oJoaNB8nu+ZaSwhoUA0dj/
	OmK+1KqQamYgPPCy2V/3tDq4s4424MvvpHjkrUA6J4RgsoYwUq8A+5sEAgkyjXWH
	LbrbSkaDzCax1aKs+qcp4T0kP+FvJoE0GGzk880zQvHiEwtgPnfQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4791mxkeqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 18:18:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHH8uf036446;
	Mon, 16 Jun 2025 18:18:30 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhersff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 18:18:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GCv3i4kNlFRiuARow1m74GZWCH5joQbODjHFih8UnZBPBdq1Wb6jVD7h97LorXnF1V8OsORmIXHfGMwyCbSVnBSOCjHdPdiiXxgG2xzQllKCvT4oeX6y9tt6KK59GRjuNsguVOb3cLHIny3yRWfMIa9q7QjXsqRcS3Y9jtVsdjNn6/xuoJgbncoKWVly9ajeJpmyV8Tms+ui8DkkF/aJmDoj05t2BJqsglxLjGeOf5zrpQURd5wmBnP5s3eD4mDNXBHrqfuv59DG6R8k4DGaMAJz8QE9Uus3xjhAHDiZ4o4E705HMcTZ0zbrvoMbt0JnWSguuxkTvtSKrVKwq77x6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ID1vNK5h8HR23wnlc25MRD5EHuWPf8pTX+qA7SXAc0Y=;
 b=kAOo2YVCyXbSc0zObIazDWTO2NMZw7x722kQvn6jtkDL1UlhljDjVZJVMhcrryWOBCdvzS2MyN60qkZS5JIXwY1YU6oZOUqbOSyLtSfJe7Qnd6l9bYP6wQCAzAW8js3nFUOta8CJlx5GZorB4JAvjYculCm9r0E2+xGbTr2ATF9nXpGoz9iJRyB0boIylm8aQpkorDta0dyBtX4Hx2qs8050ANqBWUCmF+9vUb9Z6tCTk+Kasd09dTxPpwrg+Sxngrtka6CNPzIkZCqSd0sy44ndo4OMJL0Q6jo2QPmsTj/PLnzOnx+MIPtvk8WgSGWW46FhVa4xEpp1sHAzdQRk0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ID1vNK5h8HR23wnlc25MRD5EHuWPf8pTX+qA7SXAc0Y=;
 b=NvuOw11eUvxaFxhWYgSddvM0WVUmWhAfsAtXi0/dcqPMYAxUH500rgFPC/rEfo48s9duikphJZ7SaXt6KbVOsfIN/yJ0Q8WnDQbr3No1mI6sNe4WAB5ya/5oGYpiiBtjUFM118FfSPcaVfAEF3e3THVzSEjmLPHyT2YGZzvmBiY=
Received: from CO1SPR01MB0016.namprd10.prod.outlook.com
 (2603:10b6:303:15f::20) by IA1PR10MB6853.namprd10.prod.outlook.com
 (2603:10b6:208:426::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 18:18:11 +0000
Received: from CO1SPR01MB0016.namprd10.prod.outlook.com
 ([fe80::16ac:12c3:7112:db4f]) by CO1SPR01MB0016.namprd10.prod.outlook.com
 ([fe80::16ac:12c3:7112:db4f%4]) with mapi id 15.20.8722.027; Mon, 16 Jun 2025
 18:18:11 +0000
References: <20250616052223.723982-1-ankur.a.arora@oracle.com>
 <20250616052223.723982-11-ankur.a.arora@oracle.com>
 <b53d59de-1aba-41f0-a908-e574f3db5958@intel.com>
User-agent: mu4e 1.4.10; emacs 27.2
From: Ankur Arora <ankur.a.arora@oracle.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, x86@kernel.org, akpm@linux-foundation.org,
        bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
        mingo@redhat.com, mjguzik@gmail.com, luto@kernel.org,
        peterz@infradead.org, acme@kernel.org, namhyung@kernel.org,
        tglx@linutronix.de, willy@infradead.org, jon.grimm@amd.com,
        bharata@amd.com, raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com
Subject: Re: [PATCH v4 10/13] x86/mm: Simplify clear_page_*
In-reply-to: <b53d59de-1aba-41f0-a908-e574f3db5958@intel.com>
Date: Mon, 16 Jun 2025 11:18:09 -0700
Message-ID: <877c1bzh26.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0242.namprd04.prod.outlook.com
 (2603:10b6:303:88::7) To CO1SPR01MB0016.namprd10.prod.outlook.com
 (2603:10b6:303:15f::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1SPR01MB0016:EE_|IA1PR10MB6853:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dc49db3-e993-449a-9b4f-08ddad0226be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?w8H1AA5pHJg7PhZO1KRQJii1QUqTKWcJ/Xj/VJ31srI3ie9ekRy3Ci6x33Sy?=
 =?us-ascii?Q?cL4Cptz2xSeD66p+GrMIpe5TvM2/M79o+dNyTdcy05wV/dw5CckDNXa1yg8y?=
 =?us-ascii?Q?dD1T3sRF0JEjMEVTXm1nT9w/0qiWgOb1xU/rvVXdcjXuVsSA7aarqlQrgD7n?=
 =?us-ascii?Q?CCgeyf+493ivt5kOM6DcRzeBkl9B0Cu1THIWt0m4m6fMPJZu9diINqMZ2Z8M?=
 =?us-ascii?Q?DWiD6SSAJhIaaK1Ccs4cQ6TKDso/Ih8cH8btRkSU1evHuR6fkBCjI6M+Oqcq?=
 =?us-ascii?Q?a7XotIk877CqaqNMbEted6u4rbHGJ2bPF7ZfTBM31sxci+qPs5RzWqHvlC3K?=
 =?us-ascii?Q?IHsWEXUVNtSszYBvKQ5qKlXagPl1s7aQmxvohNFKWl2my0j5GEesjHNDJ7bg?=
 =?us-ascii?Q?z6R2THnzGF7kAPV+zOlkdG7hJEDgw3BQpE1aCJGJB5i0dKGN34N8CZNUb1oF?=
 =?us-ascii?Q?Z4H6JoxLPmLszShlLW+PweL1LwnvJYs4uduL1aubEItgDsDODCKU/X4A2teu?=
 =?us-ascii?Q?ebp2XQiuIdFaJ2B2/fGocwopHI1tTmTl7mOn7wNIWsqWuSOHsTqb2XLRLZWR?=
 =?us-ascii?Q?k80LnYqJ1xHl5cVLi86DnJmmnFFFiekKUs4F8/wv9foqVr2vLdGeyXJciX7m?=
 =?us-ascii?Q?3GFPl5QOiemnjdYKnhMVBuSUgcBrMLWcpot5yYB6LFPRKRdROCAHZch4RWnr?=
 =?us-ascii?Q?QaVFyTa6LUDdkgSQVkxdxHoYFc7KWDEVZqLK8Hqn9o6NwsbUomQ8xGz0o9LX?=
 =?us-ascii?Q?4FY4jeRMC7U4dF3n5dzjJDqZ2oeeadvQarlVzSd1eM+sbehyQ8hNufiYMFks?=
 =?us-ascii?Q?hKUrd2MZdnQwVpHGhPsqt0m6gHF+XkY220HhOg2Q5uqMjB/iGxut44ZoWLNo?=
 =?us-ascii?Q?piJ3SreMQnyQ6VIapno7HgWqry40mq9xs8BjCoP+CsERFXjOrOet0J6A51Iw?=
 =?us-ascii?Q?qT9swtaMj155N1ixtPu4vxN26wFEBrjQFapJSo2IGcxLNGnDNKswx/ymAeXK?=
 =?us-ascii?Q?VkpChn5VFDG6CHTr206bAHqgB+qr5XVMGs3sntx7ZPgMjv1kQUkMn4SjpxoU?=
 =?us-ascii?Q?tyLOFz/qP/WFF33qUEmRCUc8ZYFq5Ca3Cr1y1+Ki+j5kGh3BZSd4DqACNbyg?=
 =?us-ascii?Q?JsF0xgfjE4LLKpS4X3DiWqmz0fhVm/0Hxv/cYJC6dCjo4UEORckiCGKO0aJe?=
 =?us-ascii?Q?lvq5oILM+PXVrgy9xr5H6t0/ed1YhyUnVp9MgvyQ8Ego9Yq3t8FgseoaLtmC?=
 =?us-ascii?Q?sMokAinvPG4AYBLV1PahpZa2nwnbylCLi8qYupAwkVq+zWb/jCY46qEm2wdr?=
 =?us-ascii?Q?IxVWl27cqi4o+UYZ1KmsbsziuhRrfMrMbi6w+yyKb50ofg6Xlhp126tcwZjw?=
 =?us-ascii?Q?uKm55qt+Iw1Hvw7uMqgzd8k0/ra+IkxoJzV1Kbo4azKUNzTxU92EvfDfPTmB?=
 =?us-ascii?Q?LrWSO/ABuII=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1SPR01MB0016.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BNlimOJucwut+RygiqoBGPLlUyLOgNtuFjqloqZl+9HiON4Z+87KVAgybVKj?=
 =?us-ascii?Q?DbKq2Pdx0WvCI1pgnCreZwNpPrrN21KEz7FGD/njS/bvr0+Iho+jQRZZRXQk?=
 =?us-ascii?Q?v95EkqltrKqM0Xyqpl9DqsuYs7ZSwvDoMeENJjDBIizNQGgpp05Ww971ZlHX?=
 =?us-ascii?Q?mJivH2ECVJtDZdXh0+La3BRx5uqHuyD0D1Ylbpie02L22X0WuFnIUUKL3Ekg?=
 =?us-ascii?Q?t3CSYTgWTQqe0GPhcFKrmfYWHJeOs6kxK0quxFoc6tLeXLhoFPMLMIJhG/nK?=
 =?us-ascii?Q?YE+q845xuzZ5ZS5Rng6G/5iHf8NAQw00yXh830MtximMi/1DFqw6MbnxEoTr?=
 =?us-ascii?Q?4FkeOnoAq5HhzxnTuYSE45UP7r+G2fuJxx9TPfnqEWDT8SlxTg+cT5R30pql?=
 =?us-ascii?Q?oAwwc3UyDYwNtJkJ8U2/1pBbO+xd2iHrTbLUcCFYh9XKIv+EnEaPQK6EuZV6?=
 =?us-ascii?Q?mWgFCvzPU9dsPCQ7LyemVxp7UsXoS7t6Gd2M4b1Mhv+PUvNgVR/pOHWR9Iw4?=
 =?us-ascii?Q?8vavGlDguKQu1L7Hlx0TUs810KZUPNjLWTdAEJbpd538vyP2o4eng4l9GiMd?=
 =?us-ascii?Q?b2jAq5ieUCtgT4d9r3pHw0mZ/R3eYbh0bnHVcA0wCbCaLVV0rQHTKs1vD/3y?=
 =?us-ascii?Q?xmYr2Fz2sGuMf9bWrGu/QtMZ/1nw+7JwuePmn67+HL8V4rHh65CpoRd8FJAu?=
 =?us-ascii?Q?ITA0fgp1TQbu591nVUT0TuWVY3zH1LpUhOLSALVhaIDdQ9EC2IyJwm28pAvx?=
 =?us-ascii?Q?VyPSwt8Zsfbcl+tVHqt7JxEm9MhjHRNpHy7GKI6IR8LuX2LqdnD/3Ou53QEr?=
 =?us-ascii?Q?8Xqw41xcmVAzGgLTlbWjMvjcGSbwGYw3esWoa9yuULYkcKIXIocZ0jlBPAcU?=
 =?us-ascii?Q?UJfY0+CjCSh6W3l2kQVyspaSgwy149ZjCZKO4iLXuDRhq4+dEBnwy1TO4/qt?=
 =?us-ascii?Q?ZuTVkws+ShI5ts/I5QvxVe1knz3h1Q/BojlAAsTUV063BequpfOChKUNaIi5?=
 =?us-ascii?Q?p/SzKA5esICypDzQR1jdXD+Dr95nWorblbZ4GsDPie7HnVuqyZpltKUJ7/hC?=
 =?us-ascii?Q?bR28hCMHKZaZyp5J9vU8rO75JpNBdEOPap5w65URWhGfZDE4QouSOdtQ/Y29?=
 =?us-ascii?Q?QBwM4AZdvnJZ+Rewmub8dH2x7+AFWVI1v+LAtjd12nbPpjC92UBqNmtyMbvx?=
 =?us-ascii?Q?LJLQz8ln06S28fwCRAa0LRmzBim3jVosS4l4A5ufmkBVQ1E4hYDGj2zPezoe?=
 =?us-ascii?Q?4DHKlSd9w9duXcZdJFa0Cg3syG76Kgs6mPK7pDtJTtfQf9spIAMH2Mi8ltUP?=
 =?us-ascii?Q?lSXVN7IMJpg+sYsLbRq4zTOMP1UxnHlqWJZfb7NNZx93Nq8srsfYPZf8sATC?=
 =?us-ascii?Q?jKFoux2pI33hsC8BLZsu2OiFUjPv+hYPdrHrKMQ9P8xr1bCxCNIaEHVbjd+C?=
 =?us-ascii?Q?UmsQaP8vJKqBKxVID3IC6nhrjiSsXNp1+oVbl0DByWi6MI2y1TA/jhtEAmnV?=
 =?us-ascii?Q?hxLUYtwIJhibWc+mSFZzb+EWX6dV18rggumm3fos9HCP3bUlneY9xYKtpl6S?=
 =?us-ascii?Q?kzNirgb/kGf+ayolkfFP1lwGO2xqdv7AtI+KmciDleq0oL8ehbKnxmyF2HGq?=
 =?us-ascii?Q?RA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gYV6HETSzraVhgyb4mQ/H0Z/kblm9jrV/+TOdmJ5lbaTu3FoozaBxQ/lkeNsihwchfUKqi6okk13YLCjBRrQ//madoXOK7qdTXXfLtH2f4cCwX8YUvQw8mJoWIFZEPgtMnIkTPMtKbpWGW/U91ofbY4gP/wd3kquG1qdJPi4hZAjOH3eD5N5sqRJI+2zgNnuAIi8xFYuZoFChkbhDgxoTD2aQsZExEjqiQxnki0UFG7eDGlnrFgrFlFnHjcl75L0mpsP9WK49AY8NFPaAfXf3jrZUL1BgiHwJwfeqGd65bT8oKPWbwYLYU15Q21VxWfEAsO5JBHUctTQuJUjpRI1rrtidnZ6lZjwtvElEpenjQgENXxuY1+Ei7Lv9Fg/6sag92rOSgx1qzsT07e1Z7boKTWBrC8HfSjdwv6UC2PaZMOC9yr766gJXhMStnKrhg3Ugl/stDg0WQWXb3onHSBOKH5gSZxOrHB/VhYFjH4n3g1eJHIw9LawffncuK1UxHD1HYOJsjStQUF/aqEm1AFMSW8KMk2vccJxekBgwE9oiZoSbC5Fb8O8G/14SEE6EygOv26M4zGQv+SS8p20SY3YzWB0dhV5FqRN3ox4HBUqb1U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dc49db3-e993-449a-9b4f-08ddad0226be
X-MS-Exchange-CrossTenant-AuthSource: CO1SPR01MB0016.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 18:18:11.0212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +mgNMeZxbbO4s25Q05zDiMjSUr9VgtiTVVW+JOzrrj2pN+LuoVwQ2Anwk8J/szrBvheaRNcbzVtoBABkQX+u/6Is3OWSDoH7m/1djHEtZVA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6853
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506160123
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEyMyBTYWx0ZWRfX7f2rUyY6YAvn 3evhAqlgreGr/Oyi7AIaLp8l7EiKuLSQ3121N2CdmPknZfs4OmtrWoCUp4oNAZf0S1Ni0lK7sJl zwrWfI9W5X0Fyz7zWgy66AoiXvYCp7PqY+AyURviZH6KLb5Dk8GWs55YcX2wfYbNNAr6ephcTkh
 +q0fMXtjV8YUi6rL0Jw694wiznfy8WSjObkXMoHNp+7y6qza/dXbzQKF7I+VT2dFNKx/L0yV4qe 9ZH/nDnzqCMr82AEyfsYyWHERGaLmFO3BG8rWK9iiXSJXA0Y08rPjJHGAMfSOWPV8LWPtJvvFEL //5fOQH7Hpy2c1UVl4jhVT0u/bHAoLhdJ9PQK0nNV9nQX4/4qyFqldHViYktN0IXOoSLDe9bAo8
 2rGdDDjE1Hjxzm5i+/1POAuzKKT2HtuIpUehfAJUK8ElemCvPlRKvI5psRaF8uESR1Ir/JKF
X-Authority-Analysis: v=2.4 cv=HvR2G1TS c=1 sm=1 tr=0 ts=68505ff9 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=QyXUC8HyAAAA:8 a=k09We9uy3oXjljxLRswA:9 cc=ntf awl=host:14714
X-Proofpoint-GUID: g8r0WQEBxABP-Axrn4YPNDpuJ5LoBnD0
X-Proofpoint-ORIG-GUID: g8r0WQEBxABP-Axrn4YPNDpuJ5LoBnD0


Dave Hansen <dave.hansen@intel.com> writes:

> On 6/15/25 22:22, Ankur Arora wrote:
>> clear_page_rep() and clear_page_erms() are wrappers around "REP; STOS"
>> variations. Inlining gets rid of the costly call/ret (for cases with
>> speculative execution related mitigations.)
>
> Could you elaborate a bit on which "speculative execution related
> mitigations" are so costly with these direct calls?

I can specify that we would mispredict on the RET if you use RETHUNK.

>> -	kmsan_unpoison_memory(page, PAGE_SIZE);
>> -	alternative_call_2(clear_page_orig,
>> -			   clear_page_rep, X86_FEATURE_REP_GOOD,
>> -			   clear_page_erms, X86_FEATURE_ERMS,
>> -			   "=D" (page),
>> -			   "D" (page),
>> -			   "cc", "memory", "rax", "rcx");
>
> I've got to say, I don't dislike the old code. It's utterly clear from
> that code what's going on. It's arguable that it's not clear that the
> rep/erms variants are just using stosb vs. stosq, but the high level
> concept of "use a feature flag to switch between three implementations
> of clear page" is crystal clear.
>
>> +	kmsan_unpoison_memory(page, len);
>> +	asm volatile(ALTERNATIVE_2("call memzero_page_aligned_unrolled",
>> +				   "shrq $3, %%rcx; rep stosq", X86_FEATURE_REP_GOOD,
>> +				   "rep stosb", X86_FEATURE_ERMS)
>> +			: "+c" (len), "+D" (page), ASM_CALL_CONSTRAINT
>> +			: "a" (0)
>> +			: "cc", "memory");
>>  }
>
> This is substantially less clear. It also doesn't even add comments to
> make up for the decreased clarity.
>
>>  void copy_page(void *to, void *from);
>> diff --git a/arch/x86/lib/clear_page_64.S b/arch/x86/lib/clear_page_64.S
>> index a508e4a8c66a..27debe0c018c 100644
>> --- a/arch/x86/lib/clear_page_64.S
>> +++ b/arch/x86/lib/clear_page_64.S
>> @@ -6,30 +6,15 @@
>>  #include <asm/asm.h>
>>
>>  /*
>> - * Most CPUs support enhanced REP MOVSB/STOSB instructions. It is
>> - * recommended to use this when possible and we do use them by default.
>> - * If enhanced REP MOVSB/STOSB is not available, try to use fast string.
>> - * Otherwise, use original.
>> + * Zero page aligned region.
>> + * %rdi	- dest
>> + * %rcx	- length
>>   */
>
> That comment was pretty useful, IMNHO.
>
> How about we add something like this above it? I think it explains the
> whole landscape, including the fact that X86_FEATURE_REP_GOOD is
> synthetic and X86_FEATURE_ERMS is not:
>
> Switch between three implementation of page clearing based on CPU
> capabilities:
>
>  1. memzero_page_aligned_unrolled(): the oldest, slowest and universally
>     supported method. Uses a for loop (in assembly) to write a 64-byte
>     cacheline on each loop. Each loop iteration writes to memory using
>     8x 8-byte MOV instructions.
>  2. "rep stosq": Really old CPUs had crummy REP implementations.
>     Vendor CPU setup code sets 'REP_GOOD' on CPUs where REP can be
>     trusted. The instruction writes 8 bytes per REP iteration but CPUs
>     internally batch these together and do larger writes.
>  3. "rep stosb": CPUs that enumerate 'ERMS' have an improved STOS
>     implementation that is less picky about alignment and where STOSB
>     (1 byte at a time) is actually faster than STOSQ (8 bytes at a
>     time).

Yeah this seems good to add. And, sorry should have threshed that comment
out in the new location instead of just getting rid of it.

--
ankur
