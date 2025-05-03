Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FAA1B3F3D
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 21:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746306900; cv=fail; b=qkGx4coKsJTG7HIxsGfAjdr83OoFgYVTd+qap2K6eTrcDx4NEx4R+MGSWVWOcRbR6HuRJqDi4r73Z0XEdN77rFQGYlRWx5YdziVHiWXPK3GBmPaCYBh3N2XNO/G85s3Os5Gb+OPKRuAR/Xljou3cHG+6wqrllukq8uTZC6Xj6gY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746306900; c=relaxed/simple;
	bh=kCmARXBD/fKrsi0pim8tUNY6DjZN0F2nQm3WOOazIFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gmHMwUXMorGSfodl5AcvcCF7ozPnx8UZEuKIXA5OVuEBhR0R2zvGnTpknfevktj+hVNrqMhkqRqj4Csx5xc5lDJAipIxa3blTzY8DUSawHg1LiiauFcx+n6Xx02m6kohwr0B6aQ6MMde0i63uVN9uNY1WX8dASmrdfUaT2I+Lno=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cz6s/TUw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Q71a6RPt; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cz6s/TUw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Q71a6RPt"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 543L2L7D000499;
	Sat, 3 May 2025 21:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=49C4IEW9mDvC+0A+Ji8uvlehZPCs4Q60woSqBCHMaRo=; b=
	cz6s/TUwN63tAmzUYN0t191ZARPZBpgPeYQva2X3HQcldLvpKx5PJrV3vGqVYN9M
	EZ9fSA5kNredpGT04c7b+/gCIjyR0VW5hi0Zq8Fw3Mu2yiH+mbmdEnpydkbIgDPd
	+9wPHN55cxCPpJrNs1N/RmrmRK4YCrnVrr7uXNc33RoILwDAOK6j3bHdjGHDeQHU
	aEfcn5HwhpCQofR76oY3QytvoSe4EVUUNWppJw0PjqAjQakLOE9UbA8lnJQhmyjI
	Py5dPnu+g+1qRKXu4ZG5VgfJdwSlgYSpYSDftWUhne/ftxM/VJXaLWWDLm8LHivS
	4wbKAMRmVbMhptlDUxcBvw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46dtja007s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 03 May 2025 21:13:35 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 543GhE9o036206;
	Sat, 3 May 2025 21:13:34 GMT
Received: from sj2pr03cu002.outbound.protection.outlook.com (mail-westusazlp17013077.outbound.protection.outlook.com [40.93.1.77])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46d9k77456-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 03 May 2025 21:13:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UYiBLCdljJjSndBkcSTOmY5wLE97UUb7hTlM31qSeFPaJHBnHvvqfdTssTcMh6gOkRCL4YzEKBuwhA/uS0baapdDwE/M8LovDLROgcsp51g13IUoKVaIvNO1TWrrTxdLWAS3+TRsQVhDnIlJK2unQCagL2DS8TvJ8ayTQBk9HU3lNFW0WwoA+6qlu0z+1iuMI7A1mcKhpj5q9IxAWF3PkT0HFgm0QmMUphsDI6+8D1isnS4tLsIO1aT0rbzjIAtxtp7JS4ddHN5FfJGsWbHQhT5Z/BkCxcT4LFVIEQD3O3zrZmqfxo/a9MXuD6SV4KU83acttJKnIX7/zRhAld80ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49C4IEW9mDvC+0A+Ji8uvlehZPCs4Q60woSqBCHMaRo=;
 b=awvKFBcAlmC8rHSahENBIBtpDuwT2TvmHROHtIr+YESVSU9wYcSrbJq8nxiUepW6WtsjOlL8ppU5HHAqPejfECm8ABfDTTSpx89S/lMaoyMw/fNYd3jtXYkc21NlEEbMTKhkBzwUe0b9nj+y5QwBrzL1MtAoys0R0zNc5SsM326LimMjQdzvTy50aONgmZzyuEATGwcyCPvAZoBOMvyK3Qnm2MW/jlzrT6N+hxD9MxWqBf9G9yFIVgbTt7aDImpWN37lf1aTOnd+YKNrw+sIqRUETPwhdTbs2IkSBD/K4jqlQmi85giPvflDKZoP4lopTjGn5uJqA5To6DLgsDiryQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49C4IEW9mDvC+0A+Ji8uvlehZPCs4Q60woSqBCHMaRo=;
 b=Q71a6RPtY50GS0pFKtry1SvlKdWhCWQhQ91VDCugCTf4id7hTGx2pPiZsfpor1jD9Yvyo0laLr9Ir8MBS0HxvMJzDuONJJlI6jtAsfmpK7Q3X7iyzrolke01HbegqOAVPM2wGwhepLMxbrnaSVbSxR22m8puTYnEUengTAE3Yc4=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH2PR10MB4373.namprd10.prod.outlook.com (2603:10b6:610:a9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Sat, 3 May
 2025 21:13:10 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Sat, 3 May 2025
 21:13:10 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>, Pedro Falcato <pfalcato@suse.de>,
        Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>,
        Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Jakub Matena <matenajakub@gmail.com>,
        Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 10/11] tools/testing/selftests: test relocate anon in split huge page test
Date: Sat,  3 May 2025 22:12:32 +0100
Message-ID: <addb58ea6525e099253a84e86d780f066e556182.1746305604.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746305604.git.lorenzo.stoakes@oracle.com>
References: <cover.1746305604.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0406.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::15) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH2PR10MB4373:EE_
X-MS-Office365-Filtering-Correlation-Id: ecc5f729-7901-4d83-2f35-08dd8a874ea0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Circt0XMrEBSivG06EwTIhTvDKi+jO0fqsPLGG/WslDJWXy2VQ5rF25N9KK9?=
 =?us-ascii?Q?9gjpAguN79NJbZ0LruGZVScvliJYmUmw+DTYRW73AGHcfITzl9ICq4Vy2fc4?=
 =?us-ascii?Q?PKGjNA/ziWT3TcLT4sVT/AOILgFyK8Y8GqW/I6W9M6tSOvftmx7KELhwV6Is?=
 =?us-ascii?Q?/CCZBaUf6UCZCs71Ta/XPXUjnS/a1AHLufgDy9q6SSV+pBR+YxOYVdXQz2XQ?=
 =?us-ascii?Q?Yvns0E7oATS/TQ2IsXvR62cxv3g59EOl0efgrIuRy2U7M8l5xvfsG17mQUIq?=
 =?us-ascii?Q?jJZ5M9TjcR3Kn2RTclEYolYem/6EIBG1g4kNd7oebwPKlI75+6Qx0g6R3JWf?=
 =?us-ascii?Q?lmBcgR1OlFDmBhfpfiF67KfpvTPR5w5pMEVdGqaFf62+1pyEb63K4Blg6Xgq?=
 =?us-ascii?Q?usRiykPIWxRtdIgElkBbZjqRd53DZu98Q/HnKGSNoWX7v/j5syOh9QkjssEf?=
 =?us-ascii?Q?aaNzpUiDLkVlWTzpFoOrp70QxXYboZFBJ65AYSzFOkdsOZp4FQsk/9L+RBBi?=
 =?us-ascii?Q?HNVHHtf1q8dOI1rwGJNRPIHiaL5RYl/svUwck2/w33tuYrlbequt/Md2PhDA?=
 =?us-ascii?Q?RLt3lScOR69J3fhShcxVY5GDnMPf3IdE/RNuA0Rh2s4mYs/NvkrO07ffFKjH?=
 =?us-ascii?Q?+lIowOG/wbSNoAzzWMJrIkiT/Mhuvdj5GTzdoBLT5t/7eEBacO99HVZdPsF2?=
 =?us-ascii?Q?gHk9U/eKw2+x0Lh/Lz+1SsNAr4q4lsuStEpVnbu/q3YctRr6wtl1owjHJ/hz?=
 =?us-ascii?Q?HzW5adTwm1AOyydGKb11Ed8KLpQM9k2egWTMRwfr0A1o+TP+5TSW4+l6HYQU?=
 =?us-ascii?Q?892b0VkQQj7GCp+kQGq11q917NkchpH9p/3s4XqH8G1XII76FP1nPamiahjH?=
 =?us-ascii?Q?0QSNydUnQYrbYGvNv9yJ7BxoFeG5dYDht+RblBED5SNTQNySkGmmNMVGFfMh?=
 =?us-ascii?Q?ZZzw4oZr+L9EuNwqAyGiaPcLq5pA8baDn9Ak/0SpT7YLsnlWs9ljt/3jjpl0?=
 =?us-ascii?Q?qbFdDsCfFLqxXfmgfRBu9O0jpGlt/G49kBtjMDx+6/YUMbcV4Sk/NAo88r6N?=
 =?us-ascii?Q?z+MUwIq5klYGMPQyB0O1UfB1s+DSHrgG9eYnt9KqjnZYoZZIPbZxdLmfgt+5?=
 =?us-ascii?Q?ieOWDZaMLBgs0w86GHvnoykeVIHSxF4EIh/rFUtrBQoXtTVCCIOhvOrRs0Mh?=
 =?us-ascii?Q?oiSfrCJ93uDOsqddL3E3itBacpG709oJQ9VFB3zpnu1YVk9hKNpGH8dvR/s2?=
 =?us-ascii?Q?d4INF7iBYcbQ400XgYGzvtqC0buekVgWAXg1xjMTH6zS5T8LubfY8OYFdhKQ?=
 =?us-ascii?Q?IY9jBkNPffyDCuB8NQ5yfAcPIeZi15Of2CaxpJZKL9nTeqGtpORm0uR8zhJ1?=
 =?us-ascii?Q?B+AP12h5T/M0C3hI57NDG2vQOyPvVoh7rjonpXRHqD/65R5ONo/Zm4ouZzvg?=
 =?us-ascii?Q?JD8bH5vj5q4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b5QTFrmHVKCuAToLZGD5NJ9a3bDlbyZyBYQN8U4opVPRKiIFAtkmZwOwvnGA?=
 =?us-ascii?Q?xryrwGIUvGW4HBk3w7ijvYqWu76vo38cJQ+bt1mnY8M9nISO4i5f2QpliR+t?=
 =?us-ascii?Q?dmAZ17j8k0sFPvZfr2An7TWBke4OGpj4x1PqC8zzYI0zAt4uWJUzSRri3yzN?=
 =?us-ascii?Q?X42a4847LFf4VCZO+4EqQ2z6TyN/PBLUsrPgodrfVczoNXvMuHuL+Lie4W+L?=
 =?us-ascii?Q?as9gAsUDr46gHFfKuxGJpcSY2SfFDiLHWx3hV99NQsLlW//AedIPyJr5Ez8l?=
 =?us-ascii?Q?anYA0FQtVwRioyeQdqoYr2UI5BmGnBjM0DKRNCNsRQFpX9j7q0WA686FbZCv?=
 =?us-ascii?Q?1FrDhDz9ycNOSPJE4U17nlsJktbGa1EaDyI/R2KRHAuBmnj7zMigD6jov3vN?=
 =?us-ascii?Q?DjptjhfIeJUy24WaPifPajW+25o0XFEc2HywFo+EM/nXMhGhxrvj3gF+GV5Z?=
 =?us-ascii?Q?zcC/79jL/K2wSLalkm50pKqLzN0EZG2m8CbGdjV6POL+onKVsCs6BlYgGfjK?=
 =?us-ascii?Q?PUyXwzHhzKYtSLQJ0iSCTigPF8T2C3CsTlZIQ+LU5whzMKCh4iDqpMnRo+xm?=
 =?us-ascii?Q?tt4VO4kQVL1pekd71YXuaJL9vlPFS4eX5GWZ8rEBcmWf4mh3mGsUIU96LSfS?=
 =?us-ascii?Q?B/qGntfQ07u3CJxZ05RwDBvmIvMVcCVsUJNv8cQC/gAV1vRm859auNOnwoMm?=
 =?us-ascii?Q?58lxkKGsUZoWEefHo9rhpqTiultyo5byKMdtYS5cY2VH6Ztfhx8yuSvEttsx?=
 =?us-ascii?Q?EB21ejiQ0pL65W3A6RmbwxIp6s70/wHzO/nWXnBk+/DUFZ+iuoTOLzLK35d4?=
 =?us-ascii?Q?ukkrCxnAHTMHqXr4kpvl5m21JmyT/cfPuRg2BUv5KbMsmQWYhB92CyG6dCFv?=
 =?us-ascii?Q?brjw2PqU1RJHGXyVhaLBSokfHX5oO2UddPBwlRaLeiYSKIo65J37DNpz1N7K?=
 =?us-ascii?Q?CmMDkAAKhL+yBZtcc/RR5TIR+vSIgt91mnvXZvSaMEzMIKWJnL+A416NlxsQ?=
 =?us-ascii?Q?QX/zGW/z+SdYsgL/qDzwZ00eFUX/wHRRjgNZJJZYu3lfJR0CfKQvH0RM5tUN?=
 =?us-ascii?Q?Va28D0hWZxlTLP3j5CwPGN2dr3K5S5w+OGE40jNyeYsh3mMPi+FcvTDlV0iz?=
 =?us-ascii?Q?3k05ef9yBtjjauHldWEHRCj0bPucyPWiZIgrFmr13JNFkVvsfGdKNUVxq25M?=
 =?us-ascii?Q?xknFGBj4+sQzVOnKJ0m/7qI22W7nQodZt8w/2E9PBoZZmjGuw2Bwe3e+VJG/?=
 =?us-ascii?Q?q1sf59Srj8HjRPgTpk6dRI5bO+RSppg9bpn/vRmkFRiodvmkazZCphOttG9j?=
 =?us-ascii?Q?9Cxphw0ZbFsWBJgcgWgx44jtXtUWQy9Cti0O9nSiZVaCiIGk7JwndH6I/iS1?=
 =?us-ascii?Q?GPrrSEewHZ2PZxhPa1fPt/nt2eQrcBuPUcvdqrZIMlqkzICg6YTUni8mwF8M?=
 =?us-ascii?Q?gT76SX/qKMKmAel2l8wrBTocQxGUVOaT5K8vNwecm40sdNr1vmxfIs8+Ftco?=
 =?us-ascii?Q?v7ps0aJqNK1ePyQI+58OiXZH3JLwm/Tn+8CWYQDx328a+/mtGNhJJeBfqU11?=
 =?us-ascii?Q?dittu5MBiPpTA/3yIRhJ+NVdKRhk7TNEd1fxT5aIsAOtimpqC7WdwEdOK+Qr?=
 =?us-ascii?Q?xA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fPuG0ZGH/L/a/pcJTasznchm4Qf1zU5xuod+DCT+KeAbieAUUArAY1QIXBOPDzluXFso+t7d/JgybVOZ9UtvKRD1QMht3a9c5+vQU+Fye/bno8Hz+KtNt/l3AUqAeaUCANucjRpRm/c2Ii9WcjGHf08t4qpksCKzjMQYRGGLMtTI8P5mjS2BgaRBT6AFbCQPOr7h5RsYhiNXgPO8Em0V4rqqQjmwSKeNSkug7s5gwIw6eX4ERAt3ma6Y+P3AtB4246FI8YUUqvvFtWAhHe7Yaoh1N8XqL1TKqpHaSAVjIgeYnEvCaoO7E5/qzFzoYFFMX5J9HBFqkt+NbIcIxt8FYf1Zx0ppM38VWpX9lJgDSM73nI3KSZmQENaTom5jCwk5wDbo/NTupNUcJ7gfjc8GnsXXRym0xfJJpszqyir8P21YSv8mFy0nReKCfQQz7zF09PbDAaphRx/sM+rQs8CZturAzlVesyYWPYVCaN7+5VCIs6NuiGdtD6ePl9THjW/gb0MMSW09FtnjkZYJLozxHaFvE8O2lP1sj01BDgmQqYEbqq9abYUhSAmppOSk4wJNEuiA6C9a2h0CuerH6JOHSRpzT3g7qDQaW4Plizms6go=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecc5f729-7901-4d83-2f35-08dd8a874ea0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2025 21:13:10.1808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DsKQODYKXZgOsv5GjpdwrUr7T9XcPit+7YjVT8i/AOxqL5TigKo9nRQG+UGLEG6dQoBEO75ma0gt54dvXgd/5NAVEHgW/91cY/TiXcPP78w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4373
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505030197
X-Authority-Analysis: v=2.4 cv=fu/cZE4f c=1 sm=1 tr=0 ts=681686ff cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=eNrB-mthgvSI1smxAGAA:9
X-Proofpoint-ORIG-GUID: 3EDfXQCMKr1B8tIJEXa-fDVcqBZH3f4D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDE5NyBTYWx0ZWRfXzuz8Y+3BWBSe LjJoTXyqIJ2xtuAQ2mM4jgy/lXfdNYBELYaQGwahWtdHl9t949yClgMeVpXJbnUwo46jm+mk2CS 283hqm9gistFsPmYYiEeKYdK+mFrDYuLV+vpSC5rZQuSpAOgBqUGUWwJCCXE9Gx0/iUKH/2woTr
 1oWFcAi6RW6t2dKFBfTF8sapuTpBZ+Ln6XfoXer80Vhqvz9ONGaZauey6Mf/wp0DqQ1BCGKQFTe NqDY0SSwL5xXt8VyvHoF9b5MLY5G8To7KwZgUC7BNRkCrowxzX1wwvA6qQnbHiqCv2M12NmF3rN T6J3OFxg6/V1v+TbhhmXrKd4BmBe3bIeC+80QMcSohJqlVTf9irymAhL/Q2j6ina7SfRbG58Xcr
 w4QUJVP1HYIs78J8F23LTU/AGzBClUBuhDkb5VDwOwpQysPP5p2qC5MCY8cEYRkxjg5eSxtq
X-Proofpoint-GUID: 3EDfXQCMKr1B8tIJEXa-fDVcqBZH3f4D

It's useful to explicitly test splitting of huge pages with
MREMAP_RELOCATE_ANON set, as this exercises the undo logic and ensures that
it functions correctly.

Expand the tests to do so in the instance where anon mremap() occurs, and
utilise the shared sys_mremap() function to allow for specification of the
new mremap flag (which would otherwise be filtered by glibc).

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 .../selftests/mm/split_huge_page_test.c       | 25 +++++++++++++------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
index aa7400ed0e99..1fb0c7e0318e 100644
--- a/tools/testing/selftests/mm/split_huge_page_test.c
+++ b/tools/testing/selftests/mm/split_huge_page_test.c
@@ -19,6 +19,7 @@
 #include <malloc.h>
 #include <stdbool.h>
 #include <time.h>
+#include <linux/mman.h>
 #include "vm_util.h"
 #include "../kselftest.h"
 
@@ -180,7 +181,7 @@ void split_pmd_thp_to_order(int order)
 	free(one_page);
 }
 
-void split_pte_mapped_thp(void)
+void split_pte_mapped_thp(bool relocate_anon)
 {
 	char *one_page, *pte_mapped, *pte_mapped2;
 	size_t len = 4 * pmd_pagesize;
@@ -221,10 +222,14 @@ void split_pte_mapped_thp(void)
 
 	/* remap the Nth pagesize of Nth THP */
 	for (i = 1; i < 4; i++) {
-		pte_mapped2 = mremap(one_page + pmd_pagesize * i + pagesize * i,
-				     pagesize, pagesize,
-				     MREMAP_MAYMOVE|MREMAP_FIXED,
-				     pte_mapped + pagesize * i);
+		int mremap_flags = MREMAP_MAYMOVE|MREMAP_FIXED;
+
+		if (relocate_anon)
+			mremap_flags |= MREMAP_RELOCATE_ANON;
+
+		pte_mapped2 = sys_mremap(one_page + pmd_pagesize * i + pagesize * i,
+					 pagesize, pagesize, mremap_flags,
+					 pte_mapped + pagesize * i);
 		if (pte_mapped2 == MAP_FAILED)
 			ksft_exit_fail_msg("mremap failed: %s\n", strerror(errno));
 	}
@@ -257,7 +262,10 @@ void split_pte_mapped_thp(void)
 	if (thp_size)
 		ksft_exit_fail_msg("Still %ld THPs not split\n", thp_size);
 
-	ksft_test_result_pass("Split PTE-mapped huge pages successful\n");
+	if (relocate_anon)
+		ksft_test_result_pass("Split PTE-mapped huge pages w/MREMAP_RELOCATE_ANON successful\n");
+	else
+		ksft_test_result_pass("Split PTE-mapped huge pages successful\n");
 	munmap(one_page, len);
 	close(pagemap_fd);
 	close(kpageflags_fd);
@@ -534,7 +542,7 @@ int main(int argc, char **argv)
 	if (argc > 1)
 		optional_xfs_path = argv[1];
 
-	ksft_set_plan(1+8+1+9+9+8*4+2);
+	ksft_set_plan(1+8+1+1+9+9+8*4+2);
 
 	pagesize = getpagesize();
 	pageshift = ffs(pagesize) - 1;
@@ -550,7 +558,8 @@ int main(int argc, char **argv)
 		if (i != 1)
 			split_pmd_thp_to_order(i);
 
-	split_pte_mapped_thp();
+	split_pte_mapped_thp(/* relocate_anon= */false);
+	split_pte_mapped_thp(/* relocate_anon= */true);
 	for (i = 0; i < 9; i++)
 		split_file_backed_thp(i);
 
-- 
2.49.0

