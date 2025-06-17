Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963355C96
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 11:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750159524; cv=fail; b=qzSWfTjb21Pw1UqKFpZclky/f6ecdaU/TR2XHyf6iYq3RgN8sT/IyQ1LLXZgllHis7R2TnFud4fsLp6t6+qaxSU/p8tQcnpQ1TwC8UPjLdGmuUr9iUL5tb7LVeMqWMbkyEB1fVML4p+vPnQb7cQztA9oLaD1mtgVmllPNIk9MiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750159524; c=relaxed/simple;
	bh=7tqCBKwI+esa+KlvIx0ifek1sgU+rbCGM7+oVD8Qqso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=O1tKFUKk4SQVPQCI4663vEx+ryhXAeQaDvv11OQ+TN5kLlG2ErqaQr766O66qWANNsQmWJNGgag4gIFFJA+UrBcy49zhiCyfVyqHNR1K2TgbAsXFMfLOMIS2FZ/LeY452muQ+VXyt0LcaLU4X7XrtLK3uTI6yDq9w536FMrUeSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MycMKaOK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ynJ/oDqQ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MycMKaOK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ynJ/oDqQ"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H8tYOP026714;
	Tue, 17 Jun 2025 11:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=5hZSmA6Ku+G1EHHGhF
	bZ4ufRdE66hjysZmCCOGFCWck=; b=MycMKaOKNyhiSPJ9tZZrqoRMhKd77YQ5j0
	gqFAs7hgWQvpRl6OE9TdYC3GtyWUy1k8aYTMmKNIpeORD9wRKPxgiuCtZKQHL2FV
	TnraRnTwnX0S+bT65XpoolnjZUKIo5m2zt+vQh/4v6ZD0y0VGFV2fmEoJ+ryP6AL
	Uy6jBg00IPGwVciGjawpIQCCmTyXbBprUaKYVPvlKdbXpFcn9C47werGhvzaJBpd
	ro+g558imR6klS4RLVp2AIkSLfcXNBzv51Y63CWEqrBoDYe4X/gn/fKgHzLFXDxb
	EJFDrV9pwERVHcwapH2y5mU+4kw5XJoi7aGMVDnZQuVSV92a3M/A==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47914en1kp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 11:24:34 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55HAUmts032037;
	Tue, 17 Jun 2025 11:24:33 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yh93quy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 11:24:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QNMTKy6tGll66+KKwiPhZqyJKAc6ZZg5iUjfXRBLbRsBQGkjkcTC5AzLxK/tF5iRllwxz6z5phHyprR2isJH3EBWLtUnI7W2ybmpzcTchhXok+uvXjS4NwwJO5omueCCR3M8yyJ650QYv2+mLwsd2luu4Q+kGnPdxeLj6fzepUIQKu7lptxaKg/6TxukjnNsQQSLaSnAhi15wmdr6H9+cwRYgVuohS04qzBVWBPjJe57AD3qaDbcnHAHgdK3sUTN+BEc52xnpAtkNOZJNli4N6MKMfRF2GDAuiHauHQ6CArhgFn1DEsMl5QYKJNVTdV7QYM+RmXFQrIxkBl1Wkotxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5hZSmA6Ku+G1EHHGhFbZ4ufRdE66hjysZmCCOGFCWck=;
 b=jvvYgqOfPV59Mb2gYHnxM76pQmSUEbyr+JHDrmz+EkqGNxmtMFoxlWopiYOZvq0YuO5r60gN0nTQkEvrHuC2t/+YF/YsM5yOfKAwhYUxDLsGch+jb3VJKehKyYkia0O43gk/0PRkdF5P1qwgygL5qZrOZlOvZPVoDnP8WjYt0UqsetxaQB3AxoA2FvpUdDYRTkKYB1V8md+kBBgviyYAPkgqlQaHgU9gugecKMNpaVs4uywnUPVzukg7vWgPN803jtJPgirlBtD/27edqLBre3Zra7Er7TJutRvpPwN+eH2/lwV5+x1P2+v+5kJmvtFBOJ0WY+JRUIMcs3lhNOLN4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5hZSmA6Ku+G1EHHGhFbZ4ufRdE66hjysZmCCOGFCWck=;
 b=ynJ/oDqQGC1E9lZwom1L0uyHSz8NH0xwZ5SdJWJpydoPF/yL9Bi+Pgg7xkjg8r+uAjdPBByl47GhYWqatLqCVEIyj0PtfvBTQc8uq+2O8kmtw3inKHRqNOzKY8gqUqCd9I6BmnBo1Vef/Sc93biFtNxHx/Ob71GrcAwuH2kGK54=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MN2PR10MB4222.namprd10.prod.outlook.com (2603:10b6:208:198::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 11:24:29 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 11:24:29 +0000
Date: Tue, 17 Jun 2025 12:24:27 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Harry Yoo <harry.yoo@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
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
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/11] mm/mremap: introduce more mergeable mremap via
 MREMAP_RELOCATE_ANON
Message-ID: <7f22dec0-680b-4e3d-9aab-cd516dda8ed7@lucifer.local>
References: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
 <22a80f22ba2082b28ee0b0a925eb3dbb37c2a786.1749473726.git.lorenzo.stoakes@oracle.com>
 <aFFOTjLtPNp7S8sP@hyeyoo>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFFOTjLtPNp7S8sP@hyeyoo>
X-ClientProxiedBy: LO2P265CA0295.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MN2PR10MB4222:EE_
X-MS-Office365-Filtering-Correlation-Id: 85757e8f-0185-45d2-5b55-08ddad9186a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?p9jYKEnkRP7Zr4nvUPAqeTQC/rW3JGJs7oe4NDHslQEmigEr4apZCKgMcQt9?=
 =?us-ascii?Q?+GBXXToKN6tZNjQdIRYw0VWubZqjos+Ye2Hn47IJCebBAFj1sFpUrXhkZtCR?=
 =?us-ascii?Q?PNTfIkX9JkuVYXFIDPOTesSL5oKtP98SowohXC3GTJNTPU30i5BpHmXPGeAY?=
 =?us-ascii?Q?xh3Sa6WNDYElRtzPvYxbsMPlJ+04Mj+Kx7T+epKVSS5BmGMz2LrW/eKAESu8?=
 =?us-ascii?Q?KB5SLGznVBlg/keGCf6plKE/uAipzxZBQwXbfReD96q4xfhNU/VWWTjZpt03?=
 =?us-ascii?Q?q2OERp2gZj4Y4q223T+SE3UcjDndgGjcSVpBaDtueyHFlNDvmQ42neby/fph?=
 =?us-ascii?Q?Mr8tjkBvnuJdfXQy4ZOK/HduqZKpUiE834ko2emDzLK4N5XpxDG6S+QShigX?=
 =?us-ascii?Q?HXVGUzD0anVgShOx64b8aS1nWOTayWQb2thIFgcfMuophXUuz/2p5ePhyUud?=
 =?us-ascii?Q?YSrv8RxnHVomF25EphXJ5aqMgQdkprGXm0XxKXPkYRBEOZz+k9Nz1K8rBfIS?=
 =?us-ascii?Q?rgpzB3vaPq5UZRi7HKObWPSQ30zIjT78Be7JrCgSipaTWYUuVO5Wor+u+Bf3?=
 =?us-ascii?Q?TeFZuQS8JKSk10J4WAezUVintMuPIEHsWTkZAoZ/08XQsn3BZ9H6EXJgKL3N?=
 =?us-ascii?Q?JrFkt44HjavPG5NW1jywuXCfSAv0vloJ+pjDIot2xvOfrIT1ssPVx3A3cG3O?=
 =?us-ascii?Q?synktgAp+zstt7QhDzaw+gBCo83h9tR/5m3hcJMNQyS6Udxie70IrtTCEbor?=
 =?us-ascii?Q?UXlLTBQXH/25MT0zrPPFIbjaku5plw+G5x+AnfqyWLHIKBvP1loHPL3FT0bK?=
 =?us-ascii?Q?ntUHu4IDNutZgLdHDFREtSk0fhZ9KJd5wCvMDtxOcyFwcKv+jtHHh7HnHdAQ?=
 =?us-ascii?Q?y9UE4h1P6QbyddHrllxRpc1SwCadTNcAVn1wt1sQQSC3ov4rR1oZgO5pQMGG?=
 =?us-ascii?Q?bRFzgxWyxr0FnaZMtxXIGlM8HZEUeYvqXSNpTSBquaOyApNsYRfmTW1BTbRs?=
 =?us-ascii?Q?hCC2fXQCvrX8vZPC0ZgYEuYvMDk5kKPohqOGhVIbnmACfcTx7zH5P147S6T3?=
 =?us-ascii?Q?1/pgUm062AXax4N7WRjny3NtpS0Ie2QYusCTwQ3W0OSg7XlP+F/guDBuxkk9?=
 =?us-ascii?Q?qJhhus5yiGffxYus965/8IEEuLpmMwBnakcDUdEBU9HkGXs9KKGHgFUXRXFH?=
 =?us-ascii?Q?QaM1KlE8tSiw8596ZY/02wRXBfYXcws12ykQLZ3uLeB6qyM+5CNpjJ2XkpLa?=
 =?us-ascii?Q?Vz0hOJpiH0DKNW9YC9KOnxl0ailZgnr3ekcLJDXj+m3G0w4BuH6PV22saQGB?=
 =?us-ascii?Q?0OVFTbU+gmzy7kP/bOro7CYRA+he3BIjJb1J8myQyLymxc1mGKkuOfytI1Cs?=
 =?us-ascii?Q?S33wlXwFHGBBks8tQCmkURhMtn77DfiSBad0ufWE/5EFagGobQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3vguTl4pAlpxBVvRX4VoSFRl5mvINf80aUyM8DFKRVUVEngZ0NtgePF+Wwwy?=
 =?us-ascii?Q?bB9at698n9B+OZBkT+DvaFbNOvjJHgRXieDXYRsr95abZA6J+GM9Fnxgasak?=
 =?us-ascii?Q?sVCF24tZSGD7X9n+CVR4xrIoK6UzcLXe+5Yx0xi2yrSuSGyZizb4kG+AqfYC?=
 =?us-ascii?Q?7gO/e5pFpb32TQWWooL/6qo8J6mCDLPdEChY/Cq6CV5VzjjITWHmS6CXaKSQ?=
 =?us-ascii?Q?ogZGi9wqhge3mHA9RxhKFLbl1k1sLrLp2V7EPeXPsLYOzoxMCbl4lMkI++cI?=
 =?us-ascii?Q?5y3GyS1he/vOIB8HchuNcXseTXcqY02zkY67z9EX5ax7vebMg/q8Ozbl/OLx?=
 =?us-ascii?Q?2N2rupIKYm7H3mxM0zu+9U/rxRxir4T7hp3IneLkhglCuolH5JMHBGmokez5?=
 =?us-ascii?Q?9dyrYlgbCf7vSmVVUzGTj/0fD53Fc88uMMBUMxhSQDNayRlmgzGWb4lFjeRY?=
 =?us-ascii?Q?IDr8gBDUr2+IbQO93FRhSPTFFaIyudQnqtQHb8paCeePoIUNKoeWmwpcyTE+?=
 =?us-ascii?Q?RWQSCoooftOWDJ+qbodTbOmnf1okYlhZJTCkG7TEvpxnL0S3DFkpdAVS2iXF?=
 =?us-ascii?Q?fex+RQM4mxJW2g1YvQK65FM+fl8BCAlvsnhz31XS3tO9HxrqpJ0MFOcC1en1?=
 =?us-ascii?Q?iKwpWqFozhSi1DKZwKkoRAUUSn30L8i1pJAEtO8YTt8mBtSQeJnNl7KjjxAE?=
 =?us-ascii?Q?fmc8jJ+bZgsUXPfdlXwfVRrpODAuBKkwmNB2WlEKY0WJpCDGXk8tEDwDAFxQ?=
 =?us-ascii?Q?Rk5xlo7ZkW5+efCXt2MhhRHM5OEOb1HGFYoWOgw91DfPlN6lsanP5ng5Jc5j?=
 =?us-ascii?Q?++cXmODwEl+7fon/VaIrZEYiwhcfMrV0/f3rEg/LdnA6J2JYo+y0Pu4N4Y2o?=
 =?us-ascii?Q?MgjtGciFnh+isW5xvrVJ/OgYW+CmSxwh6ufnkNUXpv+lF3I6qQIvg2keEMRO?=
 =?us-ascii?Q?3h7TwtZ9GCzSDSgn/jGkmDu/EQy0Knq/YWdc6wgeb0yD9MqlXLjuo0f6Punx?=
 =?us-ascii?Q?GpyoaRByjbsLTicW8fzjL0D0xZp1aUva5VJm2fa9upDJuulam84pzqdww62J?=
 =?us-ascii?Q?J7T5iU2nwx6bBiDni3bjuI+6y+tmgkZFqK50o+sKat5CsL0QQXP3tO0IU5QJ?=
 =?us-ascii?Q?qQBSMqxb7NAPBB58h5V5jN7ihwzwi00AtAPW71aKYOWeMM9f5YYVNZuNgAV7?=
 =?us-ascii?Q?cYvL403D+NFj6mltwKGtx/zS1ozFVOnpl0is5t+x5LpSA9vb/iYuFva4IBd8?=
 =?us-ascii?Q?6uwmoXN8CqMHMb51LTEol8rxSP7Gd4SRw1fUQdClli9URCbDDARPp2viqaUw?=
 =?us-ascii?Q?XQGNhkbGLxWWGbz7oTd1S2V+j9SfTXghRcF89+FB/uBag7eSKCyZn3Z14/9I?=
 =?us-ascii?Q?Erwn7vUgRQPiv9UgS5X/UJV5kjy+TLlidQrxRoosdmnpnPrUUHtcfHvNjpHD?=
 =?us-ascii?Q?f+lGxQjQ+X74LofW7AsjQN0uHZObFZd84TmOwuXdFfxKJ3yk66nDjLSTv9Ga?=
 =?us-ascii?Q?vgXtpZbVdK0oMmBBUbrnqpjyWfYVIpo6BDtsj/qZtna5LC0PB9GOdSyt5NZS?=
 =?us-ascii?Q?3ylnj6zmdXOLrPZpwIenBRAqbObX02qAB0Lxgo2Qas/MkyciuzF18Lf1psAG?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	c9xq4pTi39dRNTT5QIhQdNy072Ii7CR4I3h1QAH6rUGH1prtaoe11YZdmCNVUjG/9zvCp4TF8ZqMWM3FqdSyoHakf0Nih1cjrz59e03/edEjyWhXi0kd3PjDbMM7nqDbpeONmq2tr3NpIF6wGmn6EusqutZriAjoLzOdKT2ReAmLW6qWKk2fv5voDpcbn13G07h8DtpEchhRi+F46zjFImVRZJ3bD2Oe86bmQVD+wlLnE5eyFAN214SMKUzBgfpxevv2G5FWnm0H35pQoKDo5ug8x7bx2HzTqH4Y9tFsqOmoRJ2L6G6AkUqauKOfczGu6vnvDRwP5SosAJ6P2uD5SjvruSC32IVZzBtkyILrmPd+xyxAh5usdeVv9oGVkemQTGW2/EMRDq7d9wO60hHdbStY3TvvlCgZa2Rd+3R5OzmYz32/cb5mbnWS47MViUWXBYgPbbcajcYV9OdxbTdg2yBPqNNLjsDd8UjqCeIWUw9SXQcr1yVYf5Z7VvK7/aQeuT7QuHaFs7BBCCxuXxz0aoBfLAyqKCwCIIClgQEngTF9Ph72D38T1ya6A9hCDdYOMiT4wmo5VWHtexRin4UkVrcYEBRwJR31NHvEhA8NVm4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85757e8f-0185-45d2-5b55-08ddad9186a3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 11:24:29.8282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ypHVlrZZt1xoPVWVcsSUhUrOIvigehJJ1ErT9vovbaxEKeXyCsc9Nm94Ymzt3PeXhVlj8abKbvh40ZznFVaS7rDVxF16angVGDdBfeKPM/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4222
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506170092
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA5MiBTYWx0ZWRfX9hjXwfgsi3Y2 oh5RvTRqJFOctcYtp4PniELIPqLWdxwYflwafE0Cq82VlRwPcSvmoESjr5JldP21EU2bH/7xrYb yKy47clWvaW0yCSaSeQix3ljqoRdun0ZSlxGOms9AWVUM/U1uazv9ge6TUjfQRNlYY0rrRWVFSi
 y2MhZ0Sz7ak1FlpsBEcdx6D0iAU9TcfnmFah+ATVFte0ILH6UDdC584/pO0mwJEumxI9j0RGW5t teQBg949Szs6MCacvWvfehB62CjMJmtgqrADMWi4dbeBpCMh4NNLnEWjsU3HnOc/nd16zqL/yiv KY1VlMJpK+rFGMP4lLRpt6H+B1gR23qZ0B6ktbEjJpZhJ1i64dk0WVgDLss5lkZJ9tApguuTa2y
 6PhZsizSq49UWuVjsBh5bbhcTi8IhBqyGM3YNvtLu49rMJ6AC0ndjxndYohWHU84KT+G0CE5
X-Authority-Analysis: v=2.4 cv=U4CSDfru c=1 sm=1 tr=0 ts=68515072 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=TmgJmu3BUI0K2YUzAq8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: iuxWOqlaDVjFIpIZnzi_82Gqn_K16oUh
X-Proofpoint-ORIG-GUID: iuxWOqlaDVjFIpIZnzi_82Gqn_K16oUh

On Tue, Jun 17, 2025 at 08:15:52PM +0900, Harry Yoo wrote:
> On Mon, Jun 09, 2025 at 02:26:35PM +0100, Lorenzo Stoakes wrote:
> > When mremap() moves a mapping around in memory, it goes to great lengths to
> > avoid having to walk page tables as this is expensive and
> > time-consuming.
> >
> > Rather, if the VMA was faulted (that is vma->anon_vma != NULL), the virtual
> > page offset stored in the VMA at vma->vm_pgoff will remain the same, as
> > well all the folio indexes pointed at the associated anon_vma object.
> >
> > This means the VMA and page tables can simply be moved and this affects the
> > change (and if we can move page tables at a higher page table level, this
> > is even faster).
> >
> > While this is efficient, it does lead to big problems with VMA merging - in
> > essence it causes faulted anonymous VMAs to not be mergeable under many
> > circumstances once moved.
> >
> > This is limiting and leads to both a proliferation of unreclaimable,
> > unmovable kernel metadata (VMAs, anon_vma's, anon_vma_chain's) and has an
> > impact on further use of mremap(), which has a requirement that the VMA
> > moved (which can also be a partial range within a VMA) may span only a
> > single VMA.
> >
> > This makes the mergeability or not of VMAs in effect a uAPI concern.
> >
> > In some use cases, users may wish to accept the overhead of actually going
> > to the trouble of updating VMAs and folios to affect mremap() moves. Let's
> > provide them with the choice.
> >
> > This patch add a new MREMAP_RELOCATE_ANON flag to do just that, which
> > attempts to perform such an operation. If it is unable to do so, it cleanly
> > falls back to the usual method.
> >
> > It carefully takes the rmap locks such that at no time will a racing rmap
> > user encounter incorrect or missing VMAs.
> >
> > It is also designed to interact cleanly with the existing mremap() error
> > fallback mechanism (inverting the remap should the page table move fail).
> >
> > Also, if we could merge cleanly without such a change, we do so, avoiding
> > the overhead of the operation if it is not required.
> >
> > In the instance that no merge may occur when the move is performed, we
> > still perform the folio and VMA updates to ensure that future mremap() or
> > mprotect() calls will result in merges.
> >
> > In this implementation, we simply give up if we encounter large folios. A
> > subsequent commit will extend the functionality to allow for these cases.
> >
> > We restrict this flag to purely anonymous memory only.
> >
> > we separate out the vma_had_uncowed_parents() helper function for checking
> > in should_relocate_anon() and introduce a new function
> > vma_maybe_has_shared_anon_folios() which combines a check against this and
> > any forked child anon_vma's.
> >
> > We carefully check for pinned folios in case a caller who holds a pin might
> > make assumptions about index, mapping fields which we are about to
> > manipulate.
> >
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > ---
> >  include/linux/rmap.h             |   4 +
> >  include/uapi/linux/mman.h        |   1 +
> >  mm/internal.h                    |   1 +
> >  mm/mremap.c                      | 403 +++++++++++++++++++++++++++++--
> >  mm/vma.c                         |  77 ++++--
> >  mm/vma.h                         |  36 ++-
> >  tools/testing/vma/vma.c          |   5 +-
> >  tools/testing/vma/vma_internal.h |  38 +++
> >  8 files changed, 520 insertions(+), 45 deletions(-)
>
> [...snip...]
>
> > @@ -754,6 +797,209 @@ static unsigned long pmc_progress(struct pagetable_move_control *pmc)
> >  	return old_addr < orig_old_addr ? 0 : old_addr - orig_old_addr;
> >  }
> >
> > +/*
> > + * If the folio mapped at the specified pte entry can have its index and mapping
> > + * relocated, then do so.
> > + *
> > + * Returns the number of pages we have traversed, or 0 if the operation failed.
> > + */
> > +static unsigned long relocate_anon_pte(struct pagetable_move_control *pmc,
> > +		struct pte_state *state, bool undo)
> > +{
> > +	struct folio *folio;
> > +	struct vm_area_struct *old, *new;
> > +	pgoff_t new_index;
> > +	pte_t pte;
> > +	unsigned long ret = 1;
> > +	unsigned long old_addr = state->old_addr;
> > +	unsigned long new_addr = state->new_addr;
> > +
> > +	old = pmc->old;
> > +	new = pmc->new;
> > +
> > +	pte = ptep_get(state->ptep);
> > +
> > +	/* Ensure we have truly got an anon folio. */
> > +	folio = vm_normal_folio(old, old_addr, pte);
> > +	if (!folio)
> > +		return ret;
> > +
> > +	folio_lock(folio);
> > +
> > +	/* No-op. */
> > +	if (!folio_test_anon(folio) || folio_test_ksm(folio))
> > +		goto out;
>
> I think the kernel should not observe any KSM pages during mremap
> because it breaks KSM pages in prep_move_vma()?

Right, nor should we observe !anon pages here since we already checked for
that...

This is belt + braces. Maybe we should replace with VM_WARN_ON_ONCE()'s...?

>
> --
> Cheers,
> Harry / Hyeonggon
