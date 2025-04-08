Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248F222ACF1
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 16:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744128701; cv=fail; b=NSJXCaUDq/i/pSC5WgAmf02OJ991CoKTndpnRpc5djjKEEYTtHzpMJzFSdIKML32rmUohxEKv/oMuZdZiEqClH5R1vW7B9bcz502kcKD1SmS3dMXYUD2qRGNhSmHrinCdivfJyyHW79PzVnnSKc9zDA8SrUTMyb6x9UYDMx5qZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744128701; c=relaxed/simple;
	bh=zMLS5atSOJaMSk6kBII1pU9nwcUpwE70vOwaHkSDQJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=PDY2FKKOMvwptD/pEZlpQDAHGeFa3iig5bSo4jW0RiO6IRxjz686hT6vdxEtVGspSuE6JyFqteTIuKbkFYEuxHEr/A29tIxVL78MR6vXTMCthMtv8KvfoUaF2+2Yp1eJ3tVShX5jiG5wcCUtatFGiUW3ujfJYFVDSSFVVx1JuRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NRi2ASZk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Wh62ODjf; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NRi2ASZk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Wh62ODjf"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538G5BNS002314;
	Tue, 8 Apr 2025 16:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=pZZDxRppPz3tcmrR
	hTgu+5oC7H0r2YHgiv7u+U5uYtA=; b=NRi2ASZkfO/ze3/AYk3x7aLxCnerQqRh
	3gZYsUEIUNe9n6Q4KnjUd79MsH3sCKYxNuk/H2c8qJEw7sJV2m2mKgsl6srYfQWk
	A361EohCNOd7VqljTPpr5Lniu62c0kApDntzKDJLHIm0E86NyUOOkzQ6SzG3KhCt
	+RHak/GBMIpL5bLL+dfPgWSVXVhRfczYjgyq+gskBZiIo95xsXajyYwFbJBNDZxc
	71ooUCSKGJwN5H27rJ6ZAr8z9dPCOJaCb6aOxnxF0DWwPPAgFS+KlGWUYOaTW24F
	6/7aWuHJq6XiypkVty5fICUe3sHyfj7bVMFie5TzO16590E7JQexgw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45tv4sw6vx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Apr 2025 16:11:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 538F6BLu021176;
	Tue, 8 Apr 2025 16:11:26 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazlp17012053.outbound.protection.outlook.com [40.93.20.53])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45ttyftugg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Apr 2025 16:11:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bnLDtO2eJAjEfxfi8hkehD61QM4JkmG2FGoJHF3m6KYt+sKKsqbBE/cfATEfZlFrr7v4u6vgbP5b8YYWwIqllCn4J/D4j8cBQgkAbKTyYfozbfdrlLCWl3doiBZGGrtcceoRhKvahnqgtw7UX5FnnfYihAEAFqt4RfoDKuDzHceUdmY4ZVMBtEVGttBd8pNw8y90VXb4YtUSSZGdU9tP/TKxekNbVlrfQKCS8/PFYk8o5S5jG3MtfdgKwW3EEMRFpGUZhS4PYuEgsUlhvtKTZ6ZG6EZhD4P4v+5U72tz2Sv2HV/rNia1x6ocVV3uyde0KPhp6IBpK3OxjnAvi2HMkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZZDxRppPz3tcmrRhTgu+5oC7H0r2YHgiv7u+U5uYtA=;
 b=TLiBwtHJRPd4Y1pl5n8pdAhXrGJ20Hgy6b1UISmVgfYSok5tPYIqyQHdobefqcsCvGaJGBPTNp5VCxxiyagRJW3BJWl80/3UOLpYAcxPTMG7AWpZ9jlADT0tY9iW1NqP45LCF0qE6oxxMWN54PpxOcYRsJAV0/Bw9vaWTumLSy8WSboYasYJFB48GiYvnmzSy4HL2WubGLswGzq5FZ78f2oChyIuldhsLtUyw7cDf3k2DC+WnqBCTpys1MPzfp2ZKar1EfwU2k1pp2qvwSA5/d/r+NdTfXiWlR0YsDRPSKTVo+HYTDOVPCxFTBFzq4xAPuyOko2DbYTHYYtIDqCLtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZZDxRppPz3tcmrRhTgu+5oC7H0r2YHgiv7u+U5uYtA=;
 b=Wh62ODjfpfyRBwtOyiY/voF5XZDk55T7jAFeWYpworkcT9qDG/3vGT4Y/a6Zq9ziPygFQJOhbBSNdrpjv8vDGU9vk2g8FeGiUnlzFOU8eA51+2Pxa2PcO/W/ylr5/mx3/zY49HuEyu+pQDe5UEdFiULRWpq9qCglxN/mOrJdlnM=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by DS7PR10MB4927.namprd10.prod.outlook.com (2603:10b6:5:3a2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 16:11:22 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%3]) with mapi id 15.20.8632.017; Tue, 8 Apr 2025
 16:11:22 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: add memory advice section
Date: Tue,  8 Apr 2025 17:11:05 +0100
Message-ID: <20250408161105.156350-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0042.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::13) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|DS7PR10MB4927:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f208ed4-451e-4525-e37e-08dd76b80132
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tWbJ7IXE0IE2VeIZx1+qps2tzj5n4T/gkRhp28igyTd88Wh/VjFrPx8PHqu6?=
 =?us-ascii?Q?JSMnOgXgiYL5UHKeQJicFvVoaEMwGoDIZdi91jwBJiQH37wEHK34JHAr3i8J?=
 =?us-ascii?Q?ztHa8nJtvV2/EC/Zzu+SL9497fqwN7DE4yBX+dDi51f1yJeAnKz/E9U94DvJ?=
 =?us-ascii?Q?KXvJAs7IfoA0iyfQOUsaXSgYo6xwYBdKymV/qq7+YAM6dH4nGqIFHVzfp1bg?=
 =?us-ascii?Q?pqKylz+md4+6M4VvCPqBU0peUapGnQKOWx2yLds8Av/bgPjDjAzNsBewP5sW?=
 =?us-ascii?Q?ALK1chBU3D/awgZNSRCfAuG488uaAk/97fVu5T+HWS6R/n6y5bbQaMPfrNUv?=
 =?us-ascii?Q?yMmzOrDSTFTibXHFFYNnF36Xgo5JIMJSuPHaQ28w+M9WN82WrMwSBjGtiX+x?=
 =?us-ascii?Q?Oysf6q1LeLZMXV5rVnWs/Ko/l17QyxQUcGJIcPIqdoVaR/DP02I/PnZAfd2y?=
 =?us-ascii?Q?ATYLHQVU/R4oQsKonTnxBS/+NrTGfnqTIyuwW43Wc7SPn8W9iY5IDDSfDIPW?=
 =?us-ascii?Q?iU4GKqSMmGJqvSbNfmATzLhC/HlfME6r1vr14icjdhXaPDtrZMkwOjIpOoeY?=
 =?us-ascii?Q?cggH5KLKn6UrXbdPkrATGRpENQc7dDBDcFeLYh8fNoQB9nsKoY8pGoumk/NJ?=
 =?us-ascii?Q?RSgnzgAnAuilMRdnvelQ31Gfh+BvX7Lf0ZVzX/8WH5AYLjZA/L05zPEGlJ39?=
 =?us-ascii?Q?2jOhWA9XAVnnBtA/qwsHXFg/3aWgW4fSS+5fENU06tIc4o0faBy9cj6kd8Fz?=
 =?us-ascii?Q?/r/tYqJvTD+N3IlzT+6Bpg0uUpPmL5bS3BATL3e7nY6s2qIx2PmY7lb6+VIt?=
 =?us-ascii?Q?k7a8dBnWKsJ92pKGPUaFeGextS5TnOnW+420TcRK4d8S8f2SuRd9tBhzyofr?=
 =?us-ascii?Q?W5C9fC1uWnsbJS0OzB+WGx9+Zlda+NTRauHq4aAWJYXrwwlrrLZfnx3UV+eO?=
 =?us-ascii?Q?qxuCVMhxXeGGYZABNNCMDi5GyFHrOdNV8FphoVh86bNnI9ZmRMc0GVxxVGv4?=
 =?us-ascii?Q?2IvflBXsiJh6nBT6eqPDm5OACUlIeoTMBfHTod09pfXrNHep8iJ9Dstb/VFi?=
 =?us-ascii?Q?lISbsqPttolfN/7Z5DakjXvqIDjWjg49ckqMYF53PeHRUxwZZcTDaYxunFfR?=
 =?us-ascii?Q?w3J3D/3mR4lafd3l7kldxGsGgkCE8AluVjCgY8jBbo2YkAYfEj5cpuqn8Wdz?=
 =?us-ascii?Q?0sv1QtpKiVpyj7OMR2Xxtwcll5YNlu73uOWEuVreBTgRSaNBb/nArXhfw0kJ?=
 =?us-ascii?Q?EgomwhIF2MsF8Zp5vTaGkSVYPh2buGT1caE+ZKtFX5r5tEIr7iPWL4pEvP/u?=
 =?us-ascii?Q?liHbnjClLFDHaLwAKqUDCvBOMatMfp5b1jmVx3dx0I3lSPoy4KhBSezZBjgB?=
 =?us-ascii?Q?ggWDQBs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Zupu80M3GgXb6LGdHQU44M5SZLdX6gx+9yUIs9tw5ua6W3uK0lSnPwy48RzI?=
 =?us-ascii?Q?6RNSY6pomMXAeZKIcdkdFrZbfE3aaIkuNF26wxx0mgdG+uyN9WCkFwAF6o76?=
 =?us-ascii?Q?MFaNLuigBPVfUiEZcc32PXiJg+e914MRPayT1iisIUU2nc86MPQfDn7iX6kL?=
 =?us-ascii?Q?sfTvaK9IV+cqKmNULlWbp+VRc7ClcIsFHm6tqNljpZx/B05CIjVHyj2iNoke?=
 =?us-ascii?Q?b77ci8Ogadhjg0wiun7naHvyQTMB0GHKzcrL8PLz1HZnDJnPXI2L/bquNzwK?=
 =?us-ascii?Q?mp5y9O1I+lm6BrakBHRxK3Afr75Th4msnD+q8FV1WIPUAhsHrXYkRhS7ONLa?=
 =?us-ascii?Q?ct39r8I3oFMo44rAy6Nn5w8udz7AK85QXDaTP9aA8wYDfOs176iSt2hHjepO?=
 =?us-ascii?Q?YqurDIhoWTTK8P7yGfw2UgyITHa6ZOdvvfcsb607JjxULesqrr5qqag1zrkP?=
 =?us-ascii?Q?dCFz74Ibvf21j5tMjjCULPdPemTJ5rshrotua53OIMTwqKOP1nlRHvSiPJmF?=
 =?us-ascii?Q?vZSnnmMHP9flNntTtOjTb3PpiH9r0Zke9VMOrIRMxmU/3e4oPu1wsF+REPL3?=
 =?us-ascii?Q?D9x0WMpptKtTZI/41nAz5dGmJztOOY9dtOmrHCPMNlWzEsjnGyZ7ttJgiz8T?=
 =?us-ascii?Q?nBDsS2PrXKOYfp2VNyyjtJeK9RQ0lSDu6msiOW7dxp7Ph3zjyZtI+cx+A103?=
 =?us-ascii?Q?tASOzgKtz6hrg/4dvUn/UHcIeVu1i/9gbdeEfOieBoQtg81oZ+riKBaY1WHs?=
 =?us-ascii?Q?+hlisnGO3+SqJyv8TC6OxnsiSOoZ2jlpFa5nClvu5nCYqj9QAomRiIePRuii?=
 =?us-ascii?Q?2RwLFVvlD6WBL8viU4/+umDyqsi6acbND+UO8AZcnqhnzZJXA6Ut/lxAJjzO?=
 =?us-ascii?Q?8OCSPcymGxbMwGbbtBTPpaErN5k8Rktkd3uFAr/hma6cPcN9laFJoRBANuTo?=
 =?us-ascii?Q?0nVRgUqkjJd3dIVAiUGCT6c7RELE+Y+bRiTasSTDT61/2FrPCz2hsKOnahue?=
 =?us-ascii?Q?4JCRTsCb7yyK+AbH0qUif4xWbekH9gaa79XLKIL06VH68Qd/A5L5Sr7JyjYU?=
 =?us-ascii?Q?JzFS9zm7Q6/7MVhs8lM86uSeN4SAH+vDfP5DXdY35y3oP0mtXUtc13SnNr04?=
 =?us-ascii?Q?TJa2GX+hhsynyJpzaxT/1M/uUoxyLmigu4ERGzq8p4wg9gC7BbB61AxbMwnh?=
 =?us-ascii?Q?hkyB2/eu1srGl5jE047+Nn8UeAnI/MYNwhsjklUHv5y5tXk1Td73w1mezJqj?=
 =?us-ascii?Q?yodWSnxMFZVI62xCOJuzbx4spop07jDuDxrYeP6/hq/advHeJW3VDz+K82Zd?=
 =?us-ascii?Q?jJDd4E3lglufPOcgfSCnKGOWCbtcT9fC63+pPV5nFgAetHiLCQgnrGyXFWCg?=
 =?us-ascii?Q?sCtFyVUfRwAo9bXlCGEH2grU69I5DHBjbKoBndY5n4aUkHT6kkqlhGpyC7WV?=
 =?us-ascii?Q?r52LMsukzOhMxQAIzbN1QvowUPi9Bsf/gMPBM1Sxx5WbXVj/f+PuIx/0VVc5?=
 =?us-ascii?Q?SCdJWr/MJpB0ocWn7BIwG7KEZK3Xw20ybVpmIIq0/zkD60+/7w4BGnjUuaYy?=
 =?us-ascii?Q?/xuk9c0Hg3kle3GEB3Hx9l1pyfirL+6jixrhnusEC62bz6yXDq2S3J6zr52Z?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XMlxzBrCTh41O/rIP6M4fNUxN2uMNiv1xfJRDLofIKX5qLpyB7f5OM8NZ5rNJTdkQF4kA6fkflLJokcdN0g3n7Xrnj+C6IeKQugvTapq40uyztRmG0h1DhiEe3w2ZZeQ7oJQjWhVSqieABMoOFTxmnuEqixGWPhsv64wyCZ3dOu5PBETfFuPPmo03YOoHgRHdIesbV4clr1NIFLgfRhtj+9sKSdycOues4KFVmxjQ/XD0TbyAQjvIDJUiDlJkhuOptAS24EzCi92Rcn5eZ87pxLWk1GgZbUPyHHwceTN5MOGf06ofOL0HmXfl5zQLl0Sau0OtO681EjZO8zgD1cGyH2UDPJ3KDjaqJo469oYkncPVrTIhNSkp1Vfp4AAHU9AUWfNRPe9oUtqZwv4IVjrycXQkDEZnFq9VtTb2nuw8IUwc1R3vawCspXiKHB4/+sC13vdjBDSp1qOwOtLTUW5tM0ZLIcFOFW0XIP6igec8g8ZFBAyYCsibCnGttM7zvisVpwT9qb6yual5bFgYU9kq3lGIESVYAS9YO3b2wXbe5FnWPdhi8v4ORcB7csZ0tBRzdztHnF4SMaTpvGBI/kM5SIVzNnz7EWfuwtFhhvurh8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f208ed4-451e-4525-e37e-08dd76b80132
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 16:11:22.3527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2HJG6MQ6mAwxnt4kbKIMDgFjlR14X4x2LxS9H3V9jliOwRlyLJwYczALnHfN3stAmH+aahexcArK+PJhv0yKsI0yyjoVVjvW0pyKVycALfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4927
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_06,2025-04-08_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504080112
X-Proofpoint-ORIG-GUID: fnAYJjNBTi4dtioMXqhFLA4_owinF73M
X-Proofpoint-GUID: fnAYJjNBTi4dtioMXqhFLA4_owinF73M

The madvise code straddles both VMA and page table manipulation. As a
result, separate it out into its own section and add maintainers/reviewers
as appropriate.

We additionally include the mman-common.h file as this contains the shared
madvise flags and it is important we maintain this alongside madvise.c.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index de97cd54ff24..325424a53acf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15552,6 +15552,19 @@ F:	mm/vma.h
 F:	mm/vma_internal.h
 F:	tools/testing/vma/
 
+MEMORY MAPPING - MEMORY ADVICE
+M:	Andrew Morton <akpm@linux-foundation.org>
+M:	Liam R. Howlett <Liam.Howlett@oracle.com>
+M:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
+M:	David Hildenbrand <david@redhat.com>
+R:	Vlastimil Babka <vbabka@suse.cz>
+R:	Jann Horn <jannh@google.com>
+S:	Maintained
+W:	http://www.linux-mm.org
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
+F:	include/uapi/asm-generic/mman-common.h
+F:	mm/madvise.c
+
 MEMORY TECHNOLOGY DEVICES (MTD)
 M:	Miquel Raynal <miquel.raynal@bootlin.com>
 M:	Richard Weinberger <richard@nod.at>
-- 
2.49.0

