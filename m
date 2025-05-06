Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F1B267703
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522400; cv=fail; b=Q9j/BZmmPKTRZqqry4Hip52kvrtH/r95Dcei3yeGiI3eDwd8wnal3vyHTcuN85tiMKcbtmk+nzq7CuN/2njEr4QUxcoACP1yHevU5eBKI7veP5cr4WnhSLwDLqPpfn82FPy2Lj0BG9eGU1+TSvAXcWk0l6+j/B580+DZW/m+wl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522400; c=relaxed/simple;
	bh=StxzbKLSXfXH1MOjD0xWPQRzC7s6OGbK5XYuZzGcOho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YLbdFKIMRnZxX5AK4UBJWlhkzRYniOIk49uBOSD3aMW7Xn8Et8huaelCjiwTPzfVEJolnIK8bcJhciqkKbKEuXzkH4HZvUrjpFPAtSrEhNsKNGpL8aLZQNtq12eO/TiZSCBMJT4Rnlr2R6PJJbj5jeThClokho65M2XzdiLs6Xc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=p3+PLckn; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gFQCrUrS; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="p3+PLckn";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gFQCrUrS"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54686atW031313;
	Tue, 6 May 2025 09:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=StxzbKLSXfXH1MOjD0
	xWPQRzC7s6OGbK5XYuZzGcOho=; b=p3+PLcknTH5+EdoPluQphV/6RBPaAlq94p
	1rnqUe3vQd3JcKiETUfuXd2rcd4iOBpXW6YWzVRL4Op3ZWxp2G8VczEP6HEV9x67
	tQMHqZKdzGLvIHObGWcUCCw6iNn7t/d2x/SZ16afbnnY3DPf26vXnkH7f2cnZoDR
	EdzqBqaDgA6mBsLTFqbkINfXzcQclHOVwgLDgzs0C1TcffeeBpHVZSi7TMEWHf66
	a6V8AgJR5o/VVFPa7Q7SJV/0ptrNWf69lEvWkob6JP1PEtLwy6I4+9+x/Nvz3mTt
	ixFmBS1emFkgYIC3r5AAInlxLAzoZbFFvktIZqfOk5AHQaLpiZ3Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46fema04u8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 May 2025 09:05:51 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5468kGcV011290;
	Tue, 6 May 2025 09:05:51 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46d9kf0c5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 May 2025 09:05:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qRlWdIOH2k8IVxTSVcZZGGRPoeCIxAlpo0XQzcnWh6TGaWEQYYua5EsE+VcHq7boaD5gr5nzh8EyFqW0N2lVPGqQYWXKwMUl6S4Ft8jiJPS1rYQWgBKZtT8Jg+8b8R24nVuUFYqaM8/YG//koGoPBWUz7Olxn6N28Fe4J7A7799YI0qSacGsBVWE3eBSYmArc+qW20n5zqqPX4d1rfr3e20h4Tg19A9X0OyVVO0gcgll9SN5GqrsM/1mAXZcKgfQDXww2hFKz8331vYRPLqXeSVEjZQ+qqLykZysx907OKzHo3CCekU8mPObw9Eb6LLXQtXcJTmcwiEirOcp2zTjxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=StxzbKLSXfXH1MOjD0xWPQRzC7s6OGbK5XYuZzGcOho=;
 b=Q85I3UALo9HWA7gw7Pv/T/qUYHeLbf5WJmTn/4WbQIdlWACwfki6jHkLgJsFYd1Mv7Yz4gnXAnKlr3sXXv3J3BE9NjxRvm3a31IHd38MDIAJ9cgKXx+uTgNQ0rGfgZHxhspYEHtlr3Adq7bT4/qqxRp0zBn7nZ5wuqmwRhk0QRaP1czM/T28+iWtm6ypLHT6fCtwEBbnHM+ndYd7i6p7jcqm0pCbzKrsQBNOmzaVmCPycHrWGj2L/vF2sKgjQjXjXQk0H2ThdNEu4MRpPmbCicTQ/qOx5cc3whebhggHVY+BdRIY4M6/38DjKL+iQBk8Td1Ein0Hk8QBfu+SFxXPoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=StxzbKLSXfXH1MOjD0xWPQRzC7s6OGbK5XYuZzGcOho=;
 b=gFQCrUrSP0YovtlHW8wb8q83XN2dfc1lnkU+7VPkUrG9OwN2wSVO5Z5lkWrKd1so14AwmxMU8Fk0fmCJrJdCVNeRhmi3iFdlqVummKK/dPq7otozIR4LrD0mVfKIvmERN5RlRKRR+pNGxjlCCuFZNyfaHLK2QBBmLCFMs9KHT0Y=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MN2PR10MB4206.namprd10.prod.outlook.com (2603:10b6:208:1df::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 09:05:44 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 09:05:44 +0000
Date: Tue, 6 May 2025 10:05:39 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org,
        Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
        pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        david@redhat.com, peterx@redhat.com, ryan.roberts@arm.com,
        mingo@kernel.org, libang.li@antgroup.com, maobibo@loongson.cn,
        zhengqi.arch@bytedance.com, baohua@kernel.org, willy@infradead.org,
        ioworker0@gmail.com, yang@os.amperecomputing.com
Subject: Re: [PATCH 1/3] mm: Call pointers to ptes as ptep
Message-ID: <fe5c9272-c8f9-4d71-b8e6-d17678cd23ef@lucifer.local>
References: <20250506050056.59250-1-dev.jain@arm.com>
 <20250506050056.59250-2-dev.jain@arm.com>
 <4cee3168-cb9f-4b73-a2f5-51ac177c35dc@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4cee3168-cb9f-4b73-a2f5-51ac177c35dc@arm.com>
X-ClientProxiedBy: LO2P123CA0041.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::29)
 To DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MN2PR10MB4206:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eb73fcf-b0fe-4d03-a682-08dd8c7d2ed6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kPuZQZPuqqczq5R0yT3Mp1zjAIl7YRS1v87LG783viII0EDgNX7t4LF5YwyK?=
 =?us-ascii?Q?8jVHkEb2lvg/wrEbQS11idjcZGwqd2mwiYVJ5SV5g/38Y755owmc3WRppy29?=
 =?us-ascii?Q?ComiRs9U76GNEyWzEkOci9tJG/5gSaYHFBQHrryfc2mFtOKlrVNtmvUTLfan?=
 =?us-ascii?Q?g/QTAmBT0dTaIPeonAv9wm15IbP23SQ7ohHuSQzD/f0s9fe+JEMqXZc01+We?=
 =?us-ascii?Q?20F5Y4v1w/lHGua2Xx5E7TCPHqGVX/DDzoqwoPOP9f/WScL7wprit4oY2niC?=
 =?us-ascii?Q?G9sxNwnI7AjjQAtHlx/VPmtDoJ49260ffGG9oELUi+iv/mL4HxdG0U/PW4md?=
 =?us-ascii?Q?Mw72pVSI5HlFNZDkv2ANTFyr9f3uzS4EiXyXx0DJJ0C+4YD4z67kKapAUGt+?=
 =?us-ascii?Q?Ic2k2snnRC3Kxig0EfKfHvSceAuzh2IPFTI+1pntEy/QbyR6A/Dxdrp2EhFi?=
 =?us-ascii?Q?4pnt7kEyVGOxx9k7qvec7WHv4Lu1WXwtn5VVPPGsYlAMFhF3bTsrW+T/cfuR?=
 =?us-ascii?Q?stEwK+Zlwv98vPmxEBlSan7zVFBZ1L+2eq9A9O0x4n0wYpFOOSH8D8xW4Iyb?=
 =?us-ascii?Q?s3BQC7yfZXoIdA/G0Dg+Rpo119A9ZH2Q5X6F6u8k/dA0PbtgEpEcP/M04uHX?=
 =?us-ascii?Q?WaNnSBSEiFMalGG0K1cJ8L/v/fLj4p33qGSPjf1pNLWKyie0Zuh9zioPs3ka?=
 =?us-ascii?Q?lNSTQTpAfVNMj4WAm1RZ3Tbe9ycFtDMGYfFcpx3m6iWdzgayLAzz31Fw6NL6?=
 =?us-ascii?Q?jlzrVug234ZpPFxKFAD5UoUZjTBKKvOYnNTiqYbQ3VkfT2iE9FIuTNl0cWMK?=
 =?us-ascii?Q?OUi+rKutIQ6cL696vv8CptuaBe+dkaqHmIB1sKcmH+TKO2qLkMuDepYuoJja?=
 =?us-ascii?Q?4C2N/2MN7oyU4WvERS6Xt1C8P4rjvWELnjhdOTO9qj+Gqk/cnVSr4HNEHOcu?=
 =?us-ascii?Q?JDcwjoIYkfEnsNzYinrLZQEQBu0wB8eAi0HOATJuNP0Ze/1wWe/SimLagkTL?=
 =?us-ascii?Q?gEfQz5SB+HVfw7OT6pPSAfJFVpS+v/5edkznOHD16dN+mhljJn++Dv1dIwqY?=
 =?us-ascii?Q?sDoaXfRAMMAy7jN5dcxAhNMo8uQix/3wtfgYvSQEK8Vj1TY1sQhTreHkGgXe?=
 =?us-ascii?Q?gRoMsTQgZ+tirQfTIWxH0qN/qwCZvW5LvMndSlDRZICAknWNdX2y3BJmOUoJ?=
 =?us-ascii?Q?mNH1ajrR9T+klR5RVyoTyDdU4X1y0g96+mEJPSm6Z3tT1xIMI/pSVTgnEoET?=
 =?us-ascii?Q?9N42mD3+iGmNKR//+KmTzv33Sgf5KSAU01IO2RUkV4mdZR6HVrAYPVJ+q651?=
 =?us-ascii?Q?AQ0zeS3ej0mHGM5cI13bPIGIWkQFa+c9Q8fNlFPyjbq7zV1XF9hp3DWBH6QU?=
 =?us-ascii?Q?KOv0gZrzXCXmzJMj6xj9alyCw27EARp7cwMkvtWA2NLAHilZE+oPdo4bfI9q?=
 =?us-ascii?Q?09pgSOab0/o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zJHuEzcToSPnwGijneS4snfmeh/incWVbRxz2SbbNVO8c8BObcpPY+zSda4N?=
 =?us-ascii?Q?+wo0aQsIfCzzCoPN8Fu6xWR9flUCIuyXq9jmG7jOWjqxj3B4J0QbFALO6OlP?=
 =?us-ascii?Q?gBs3BXV7Fp/2rHDZJxQL7UFFtVHOUl+sggjQgxs1ky7V02Luj1PQzkSU3TgY?=
 =?us-ascii?Q?iKkolE5jMTdqrNmmeNlXgZXYs2xvFatyIdL4bcLEYnZgNGEJzkvH5+QGuTuN?=
 =?us-ascii?Q?N6TT3ofdcpU+r+Ywa8ikKYKSsih/brbWSWQbq0nN4C/oWKx7DdWnvH7CODlJ?=
 =?us-ascii?Q?y9zdEelMI4WyVUAv3lJQeXUGbtACi92WNG2rd67DHGvljRd+PbN6mc43Svdd?=
 =?us-ascii?Q?ajlQbC2/mP/lmUKXM30K6bvIYDd/2wq1ySSZmfZyBT6wKafAtDGxBtKJziUt?=
 =?us-ascii?Q?wgTA5tNZimw0BRnmpD1+U32ta2+5lXbF5c5G+nlDTNmK5FPblQsUCFkbzwGX?=
 =?us-ascii?Q?9X5wyP8Mgm1AGXh2paXatDedcVpJ0xvm88USmnVcPyL67/89UrJRS55FwbL1?=
 =?us-ascii?Q?6JQFr7Mp30suYGfAMBcA8ZtocoR9cYNqTxdu+1Xh9kMOBn6Fr67Z9JTy0Lot?=
 =?us-ascii?Q?Sij3PuRqnI+Z1ii7/CdsarzcIHbG3ncGle8w88MzA0gVOAn95V/tJcrrnG7R?=
 =?us-ascii?Q?fgt7iBz7vlIp64juOvz/GV5qtOXZL4Ca9MHRKIwkyj7lSh7YSy15iyhmudtf?=
 =?us-ascii?Q?upB++4hVPCeq4yJQ7hDz9dMvRLbWVPzOU8Q76k/yukEicXgmA/B/EqlQxgIn?=
 =?us-ascii?Q?o1Ct6Rq4+znLebzP3s8LbfQyN9/PReRdFRBmYdmZlPcdIECMeATyNtAdJCWx?=
 =?us-ascii?Q?Gsl+jkj54bCwJ6bl8LtabPiGiTYJ8dnO7ppJaKqU58yIpMgh2SVUoo29HKtZ?=
 =?us-ascii?Q?J2wLnMPMiCerUOYyp60sjy/4GOvVEDOYYYYWJ+9YBGxmKOxdTEBfy2cMO6ko?=
 =?us-ascii?Q?LHGWvr4lYgylhYKwhvJhOSsQDqZanqT1QEr5Lux7xLX1Gny80Zi6efYcdh3D?=
 =?us-ascii?Q?D6eCmVtBuQqt8mBoGHxzJyWlKLWMHZEEKmmP/IyZlLAAM1B0TOUoYa4XpPvV?=
 =?us-ascii?Q?YQnFj9WAvXwz/Goi/5uXEJIkd5EmWQXcZPykCiZxuAARxQ14lwPj0trUP63f?=
 =?us-ascii?Q?9iP19VHM4QQS8DAfbE3P8hteq01ssmYYj8uAgRiCYEs+tmosObj1Qw5RgyqR?=
 =?us-ascii?Q?RdhFtios9eQJ13R6Y/rD0M4KK4PEK+uaRZQX/wwqbc4CwSwhuKM6lt4k0aqb?=
 =?us-ascii?Q?fY6/v4ekXVJue3M3gYkhQWhd6pbAyu3PT12r+2zy8oOv6VATCQ/wfRLbyKVm?=
 =?us-ascii?Q?yt05efaHavG/HpQJsVZlZ50RHA4oswY6NR2mB+U7yOMPwsw7lJ4ghLfsm8zQ?=
 =?us-ascii?Q?pbCMB8RtBAIAq2ccxhGC85sNezzB3L3ZFMy6ymcY4W7dJZGBVCXOeNN+WSkJ?=
 =?us-ascii?Q?E/rnKDDnbL/iuSqwD/M06K9MxLMr++VI9BAe3nLm81NKL5xT1fz7+PHEPL//?=
 =?us-ascii?Q?gAfqYYV9Kk0UWeRbrUBHtxQW3frbMroaV83Hz5G1PyTsNs1tlATIRteFaLmR?=
 =?us-ascii?Q?BYgSK6dvC1q61In/HPnaw8URzBXv9x7HPmabjma8yn7L/stst9hxXAnKH5JE?=
 =?us-ascii?Q?GA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	26L44vfUX7rIcv/Jxv6JhsxyTmehXidI6u6QauHWYBSzh/urkpCFjZoIsStLQ+G0L8p7rUpm2dlPQbnBSx6KmaNOv+XWprxTRifpa85u7XTOHa+8d3hKY1P+MWd7wPFwRLQdd4XJqgqYjnxno4ZwfG/yR02cUSlw6DktsDaZxWzDCGiKibSjxlXmU3R5mBF3nHkQaoekNE5ve8gB/a6xXYw2k7FUj6BmP38xEsqSl1pNvixHgvvWnLhCUE5I5u2hPE/tjJRXUTHGrZu0WEOZmHx5VqNbmzYShnVXrZ/STEMt+k8/zBqbPTrifW/3Q7uMrck91jzR1YRPsUS44uMoq/tNjUSwFvOPuDlo+TeaGnFrNcHhOlXKY/h9M9kZ5ujwL+ezRH1DxLQF0OnzKdoT7JdC25vsNavg5YGO76gL6r8S3ywWT5rZL1HIHwK3TfMepRRcHiWeeeO4aGHL2vQWREwQpT6X/eKrTmlEot5QhKXxFqI2u4UhT7PJOUPjbEfmDdcM2eFOY1zGAvNN70jnWJQBAklmQNwUFJPN492thZNOVGPzZWaKIQHgetECbfZL/1fXjl5HWYjx9OVFrfllo0O5nZRg3ZVph35z7WkDLfo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eb73fcf-b0fe-4d03-a682-08dd8c7d2ed6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 09:05:44.2146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fCUkixjSTrtI05UC9BpvHZVtemqeBLHNiiF6g4HbVRNnNx7Oc+a/cReGsCZy+CvX+q/x4/7k6lku4w1nUOaVDXLDSuBhyJKnnvldYp4dwmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4206
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_04,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 mlxlogscore=634 malwarescore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505060086
X-Authority-Analysis: v=2.4 cv=f/hIBPyM c=1 sm=1 tr=0 ts=6819d0ef b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=lARGhP8x7wrKYmPymz4A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=a-qgeE7W1pNrGK8U0ZQC:22 cc=ntf awl=host:14638
X-Proofpoint-ORIG-GUID: 1UUTyUHFDyk4-Hu3MFvDTSMK2ZMRswRF
X-Proofpoint-GUID: 1UUTyUHFDyk4-Hu3MFvDTSMK2ZMRswRF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDA4NiBTYWx0ZWRfX2Oxa/5Mss41G 20jpDybfuYULd6PcbaeLSEvqTqoxsGYvh4pB62+Vc8ejStv1WdheEjv+1P2iXLtAFjc0Pj6PGGY RlDMyCbSfSDLAp2euKOLTrd+zhprTgGECvTPyTIIrEe+Nwd7YgLVRMC4g1iuikK5mVmw+/40JzV
 bBZvo79DMseiV7OqEcsz91gaVGoGubkUotZyVb3Icz/OFyHD3JRNpsprJQRWWMiVlKzmLV/Pwb2 mKy1SjZSsoxYAlaXoqItlfP6yDqpVkv9Hk+h5AqCB46KDJDUd2W65Bwi5b8BNrauAaKQNN1U3ct uWNypxokmoqa/aUaIjS88qV8xoNRoW9mt9iyKO8k9QBKcWqqfODq2IuH6WJpkYnXt78z/mJqP5y
 9S/hCVIkuMDp3ypjlzDF+uaJnxSdWJ1NDgAoenYprXRbYbBg30YYHWUazLdOAk4CddakQoVF

On Tue, May 06, 2025 at 02:20:01PM +0530, Anshuman Khandual wrote:
> On 5/6/25 10:30, Dev Jain wrote:
> > Avoid confusion between pte_t* and pte_t data types by appending pointer
> > type variables by p. No functional change.
> >
> > Signed-off-by: Dev Jain <dev.jain@arm.com>
> > ---
[snip]
> Although this makes sense, mm/mremap.c might not be the only place with such
> naming confusions regarding page table entry and page table pointers. Rather
> than fixing this in just a single file, I guess generic MM wide change will
> be better.

No, let's not please. that will be a ton of churn. This confusion literally
already exists all over the place so it's not egregious.

I am sympathetic to this kind of change (I really _hate_ this as an issue), and
since I recently refactored all of mremap I am likely to be ok with this here,
but let's do any such change iteratively, please.
