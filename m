Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5179127F75B
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 21:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746306874; cv=fail; b=If+ZVIDyhCcT75RBtPqVOWzJ+FbmyfUFgyVRUR2rngrwf+RXqi43pDONItEuXr2vxpN2gFhyFR7I8bGLdZTjmKZW4eGKX+m1M49B0AQNqQoBf9yUFvOWnK2cx2DrgdDlHIs2/vlzoiWpGZY1iY3M/4ntD+bK3IyIF3KtdMDqvnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746306874; c=relaxed/simple;
	bh=pPI1vmYeUYrc5+YozPFLzNI5agegrnsYCWVDOXPURqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eTZ9k/COOr/ZljKYt2IW6syQrli7+d14P07u5pNqRAP1384FGEFvvN4YxHGos4a/DwfXPZ5DJ0AXlx5bKg9ic6EKHxoAxfSOEMQuy9W2mh05P3R/10bKlF89I3kkFhXPxPhIE285zsVWqNndpZK8u/wyzUlU0Dkei+Ve3v1vOyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SgxekxAz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wbkHxQgm; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SgxekxAz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wbkHxQgm"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 543ImaMG000921;
	Sat, 3 May 2025 21:13:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=55AlPUUE8TEbDwrhF3KgcH9bxqg16uTOTWsEfqmFR6s=; b=
	SgxekxAzKRTCND7JfUlvMJ5uVAKA03LD2iKJN3I5Y3kZX8s11yUBeYR+SMul6o4Y
	8GwLv3voD7Z3ipDzZf/jNnKJSElLGxqsA1LhY6Rt+YGERd0Cv0lTcylF4PVJpfun
	Gg4BwRPG56A+aS+IRlC/fjZ+ydnJZtEmh6mvzaKEEa30ylGr5/O4PLXTWgT458Ac
	1u9EL9lfeg/rLahdq/cqFCoY+VfnsI5ywI6jnOXIEzs3UIn9h7n7sUBX7yHHQqxz
	Jxr3dcmhsCVYJf95mxwozmNDVB7tGkPdKrz+zKNXpq3ZvissmekZv1mcKqKPfLCs
	gusa3MWNsiM26nEdbmSYmA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46drqp81wv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 03 May 2025 21:13:09 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 543IK1EF025089;
	Sat, 3 May 2025 21:13:08 GMT
Received: from sj2pr03cu002.outbound.protection.outlook.com (mail-westusazlp17013079.outbound.protection.outlook.com [40.93.1.79])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46d9kcpyfb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 03 May 2025 21:13:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tVWrMjotBmPMaeS1e+ybTeTedG/PYSyKq3c7zfLBRisesftHi8SAzShSZfoCwwqOeqgFrpEDbfg4GGT6u3GLqOdPM5BGBkhp2aHlgwwy9DTKoGXaZdx41GVX2cECDSg0OwodDDJBd9qwrdsi00cp7PHJmG/fLw+NBn5v2GXjplEAFph/DMx30RRIg+vmToRMrTvjNzD6OOcP55kW+dPhZopV8ePvylVLMyr9j5kLiWnUYF2hb0m+HD5oXFQm24zzI51VdZsp39MelSemee1ViekSvlKsq0g3HUWVnYG0yLO/AZYE/i36LENwZOKwT4r+aq6WCfmlj4Z8QDExqhcslg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55AlPUUE8TEbDwrhF3KgcH9bxqg16uTOTWsEfqmFR6s=;
 b=IWaQSY0a1pYNX1leDlFaYPsu1NkquLMWmuMTXVGr0JWghrKm6HNVgpZT66MjmC3/L3aUBqr7C0k0UrW0A9d/5P/ACssdPzcNkq2/PoT00Vj4/H1Td3kkjntlN8wIdI1pqLQ+QiB95UHNk8w+JOFXk7qMrYl9KYUTOoCnuALsMibI8EHCisBjjRhY4+elXPHVyPZdrPtoWENdaOAJVxut6N92Z3alWwAXK4keGt0PzQ7LPmAAkWQqemfVunXiQQK90I4Nfd6xfZZGBk/Bah+6byHzPQ17TbcVtpyVyssiVmM4VdYHEnR4yROv5b4xNXykbLrws/M5Y0E8W6aEWpbHBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55AlPUUE8TEbDwrhF3KgcH9bxqg16uTOTWsEfqmFR6s=;
 b=wbkHxQgm7XTLDbBNzJQ4wgQfk9JwGGzvXM+b2GVQ1SJzDRBeZPFToyKVtiMoBL4kdf/0PCjn9350xXOnGfWMSwS+57NUYrhy7x7O3gfTZLspHgHNKnZt9e4STsusG4fs57Fs6V651MP6Bwtt5a1Px07gTtDTQHCp0LCYcIK4+GI=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH2PR10MB4373.namprd10.prod.outlook.com (2603:10b6:610:a9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Sat, 3 May
 2025 21:13:05 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Sat, 3 May 2025
 21:13:05 +0000
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
Subject: [RFC PATCH v3 08/11] tools/testing/selftests: expand mremap() tests for MREMAP_RELOCATE_ANON
Date: Sat,  3 May 2025 22:12:30 +0100
Message-ID: <2337586c68b82ec38f600727ef41b485b423150e.1746305604.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746305604.git.lorenzo.stoakes@oracle.com>
References: <cover.1746305604.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0297.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::6) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH2PR10MB4373:EE_
X-MS-Office365-Filtering-Correlation-Id: 993e7c74-3e79-4dfe-cfb2-08dd8a874baf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FAtwqQl+5aAQMprulgckAE6NgmJrn/g8eLHFyDjJCzNz/rSRyvmwqdIAyy/2?=
 =?us-ascii?Q?HsZnrN42aLmdxOpfcdlYxi4KyRNXc/cDvGXyKpwt9v4jgY8UMngCVA9zd/WR?=
 =?us-ascii?Q?CsB/KOHWQIX7t62QrS9NjpfA65/lUnnlc4CIACyYKxR4VTydINmksGsCLf1y?=
 =?us-ascii?Q?F/kMtMP+J/Mww4laZULTmQ6VV0ndQlADDDh1y8V+24xHbweD6Zj6di+ZZGjB?=
 =?us-ascii?Q?xCMafzpGO0kgTCuwUKvIc7ZhZLtrO3DPa25Em5fZPozbWdRDf4JPMkwF91ju?=
 =?us-ascii?Q?RWsD2CPgbiqp4FEOHLqkR028vXjAfIoYop/utkWwv5dvZKGyZD4FabNdfZKI?=
 =?us-ascii?Q?ZJ5ZlJM4IBbkliju6vpOKvRNmgVdnUeWG7siCoNXYmpdEokn8kPnFduTdKlb?=
 =?us-ascii?Q?IHqo+Syhffte+BN5yS+gs5Dv1cRCeOl2oSWuzF6Ckr6lmkfiyYwFsZcr0h3G?=
 =?us-ascii?Q?SulRZP40fTV2rKcqZjA5OdoASanvo/cUYvyivYbVt7vHEjaIGrGTrtjHaiBB?=
 =?us-ascii?Q?drKqMi1pNC5+0+s8Ds3u2gQ566yzzspltKYKy2LgJJz4ryeQ6MTE5ZekRYRe?=
 =?us-ascii?Q?70vibA+7l8xUWzNXZiRmOrPtAJZXmlmfE3xbIDKuHdqC6HHrjthQCSgHF0ij?=
 =?us-ascii?Q?mZGGpDxJNWtAqXsFvwjwHxBtI+X2B06wr89tLWJIefRT+KernHp1L0WN1azi?=
 =?us-ascii?Q?fiYIS8/DdIiwB1M5O5nmjQ+/DlkB7PJFQVpQG6R98ahFSGQIasG8nkJHs2Ob?=
 =?us-ascii?Q?dDzFgQ0Rfr5tp040Peh3F5sh6mESHHEHxChzFuAbscq6WaDr5QMzvg9TULAk?=
 =?us-ascii?Q?Czqchv8QN8GOgxIadLRft3JN3GBP0gqIyIRQ+r+j19X4mRco4hmpnZgDKfY4?=
 =?us-ascii?Q?bg1zGdx6cmH3wBIlSRpSgowy7B779lI7i7j27LbVcPS4zjvNqYj9Wdpsg5kG?=
 =?us-ascii?Q?aQLabmiLalY6HyEcoJPKBYh+/NDRZwE+HvmYeiLZGkzp6S2TXnCvzDSI/5bG?=
 =?us-ascii?Q?IGCTSDS95OCpphR7O3RydBJS51CuF8MFLlS4s8zX2uG8MiuE8UkRaI0OoXlx?=
 =?us-ascii?Q?i7Z+sVUyvy5TZ/DS4s+NeWTf6NKgzkb8FFdB25cbNaPrHNuLcHN9e3bDI2fO?=
 =?us-ascii?Q?3kqetZvY/x3x8hraGy8/Dxy4/IbL91t/Wcmq0q7BaASaqao85mnV+FcyXBEX?=
 =?us-ascii?Q?kHwc693MU5gK0SFAGml//KiijL94cKJR+v6Np5Ifckep6KYtVa50+O/sI5Cf?=
 =?us-ascii?Q?fhWqtsXze6O8PLf18ZzfeIZVY3ffPgQt/IajbdiPZCFTtmFhOvYRPgrgu+Ci?=
 =?us-ascii?Q?BrmAzxY8YyUPNSp1c7QUEAJV5Zxj7lGHEJ+pnkZPvOXsrFJ8naXTO8YgUPAK?=
 =?us-ascii?Q?JtM8Pwqsntq0DuvXAEtFpl+dJ6b9uqLdy6EGGGS5HVuEYe3NvmlxOkDtLj1P?=
 =?us-ascii?Q?cLFkrKP+iNM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D8ET/z8u3k3yVd8KpWmhtw7hPuEFLqrpgR/oX8DB7BijSGorD2zbCY3Na8jN?=
 =?us-ascii?Q?cVw/1RSeuo3LlJ0jIYni36r0heQ3KBN9RReCux4WO3aKTa+5HezBptItQSMZ?=
 =?us-ascii?Q?Ovi99z6vdFIRWugMTOYHac+GwnLt39kvxzqix2icALKmy+KNAhemEAbIivhr?=
 =?us-ascii?Q?T4jKTi6PKoCtnKE79GsKet44A7osdc2Wua35KgYCH+XhHH8pi6la2pxRn7ZH?=
 =?us-ascii?Q?h2IczhNBZSICUhGYQK98hztUwtU82MEVASEphXRKuSMOEKv4x9he1TueXaaJ?=
 =?us-ascii?Q?q4k5pnp+a99Hgqm3HYntCky86aL71RYcKGucc3uK8xLNqSlS8myyzLfzjZmI?=
 =?us-ascii?Q?IO0UBI72cTiywX1NWCddSEvFEzzLwnKpJGHOrxchqKEWrdU86c6t6TsHQGv4?=
 =?us-ascii?Q?r6Lfyh7+ThISXPZ+T2EdzOJT7cI4UgiV15hIXBgrEOb+LTiX8H6hdHb/kq0m?=
 =?us-ascii?Q?rrHSdEghAxdjP/C3QrCztHDt/d/w5p0n4eKnIA2g32jyIwqZSlO/N+AJ4HYA?=
 =?us-ascii?Q?W/GBtBJUsiugQQaLvSFb01xkEyWO2n9nj8ncNlDVtvZM7Wdim6IQl31V29e3?=
 =?us-ascii?Q?X/eBw+sxFU63VtlGFh+ttUA37CMVMXJw8zExISgq8xMNE5fP2sqi2nuMuoch?=
 =?us-ascii?Q?ZhxYn+MxyJzLkno978uLUltPylfGnswVQQzcP/JqZFS2iGPZzhRg6ygsBKkw?=
 =?us-ascii?Q?AFQD3t5Z6fLRZjcSYTC1EATc3pEtbQ8k61/ha9l1yQ08tvSF+4u8DMH7rCjK?=
 =?us-ascii?Q?400cP93Xll5DHqcnuXRHD0JVCXWFqFm7ujPkSyTnHo6gejVTjno7Gxca/bO2?=
 =?us-ascii?Q?zSwy/iFwTSq9HlOIP1t1bm9TqrFqmU2nc90FNoo7sW8YGFfRXJvyTBvQ8jTI?=
 =?us-ascii?Q?Etg2VDNp1Y0AYrfwziRVuWSuZipAg5OCfVaw6i36vbGtmOfZWeqzPqAJVKxZ?=
 =?us-ascii?Q?alZYj0cOTXLohs6G/+q8tLBr0G+NLxw1mXTp7m63S7+T6EBER9aMsKIj6rVV?=
 =?us-ascii?Q?Tm4cmjpD+aLO4eaNB23MgeDTRJfSwVvtqclvzVPe8szFzY7vur0N92/CvrjD?=
 =?us-ascii?Q?+K7IGQnG1ALuQ/aUSB8O8mKJp2f8ZnQWh32WIk/hbsG0QSY44qaOOcyFDx9J?=
 =?us-ascii?Q?JIXitESUXFixrwiCoHfP8x9j9IrhylSghph43JQzqBPZpJfiI1J8lqorOTr+?=
 =?us-ascii?Q?QCUy/ZG4E5uaUI8cHPHMmcvlf4pzJw17phfU9GH1/2Srp7M96MtdpQzfRqzI?=
 =?us-ascii?Q?q6AdXBCbe17Moe45B/Zib+pGU82f7GU2yXLrLmun/K6/9kw4JI2fnqSIYv8O?=
 =?us-ascii?Q?hXSfoSUm1naMafnpFTFy40ieP0nK3bcyaHCxd+RzeTY2PswtqOQL5dB3Eegy?=
 =?us-ascii?Q?gQAe8NPw4fSltY1k2q7cOM8sYEBAuewTr9/ms8BZUPUw8JxJZjUK9XwZFzEY?=
 =?us-ascii?Q?stjMlLWJ4UB2Ems4XWz9FzafcnNr8FV6JRcEnawBL1RRMCoLLdiF1TprvZsF?=
 =?us-ascii?Q?1YxCMwMrfbHIPg+LGdQmJaknQ2BZitH4JUid4y3kOKN+J5efLRnu1LOcI3G9?=
 =?us-ascii?Q?xoc+9+6ucCcG7eExZz+YDDLBISKBa7RYI3CDwY0yTp79n5EBA3xRPYvJoRGs?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wWlKY4e1Gn603UE0/XGYqXuq3RtRGWvyKmMjn2SOsKCR4zy0gD3w6zuXfGyislwAiiPQwsaqDhrE0XEWnKfgEM7ebmg3Xz55rrmlhxxV15Un2pRXLANf9Q8WgkR4c0f/F1lQI29iwpG5e5TW2j4+LNM5jx9tKJUoHO54roto/oM8QbVvzr5w80flQnRBksxRR9mXKiKX1hjngLYET1rYTVR66k0fPn4OYuZV+nfWKmMdKGKN07NSETMrTIWaZTbzaCo+gBSkdpjZfsx065u0O6rUXxYCEn+to9rr+00L8uY5Z3JsfnxQSChkQfaF/JWeJTZRZYQ3pGap6cqoKLHIIQUuudaPKJHB/vh0Pe6VOac1OU98H27Y+PLbWP38h0z8lJv7CASsjKe4yVFQysg8jNLHVU9CGMJcQTNNFIoaIfM+ZM1Jr3iQ1eg8C4eIenc2rrVvSFX4Pe8dSNhgIrPHabrN9JdFOpeDVqfuBFJUL9V5Jn1aItrJJRqOhjAauo6DI2g+TMyabPVgDe1kdmgilIGwzcWqZAoKIePe4+PGEzdOUgaHzmucXWBJ0/HpwP0meHt9vNdjldY+LOFeQ/ak0EV/joCtzGBRSHeiqGX1bho=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 993e7c74-3e79-4dfe-cfb2-08dd8a874baf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2025 21:13:05.3468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FV/1Mx2yLgR72t9Lcl/y/Qt7kIY/NykcWZI+KgTqw7OaVt21MfMVOIXWQeynnXvqAvtjPGtKCo8X9PHgrMPDPO5S/fy4RuoKKdTIgBvLf5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4373
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505030196
X-Authority-Analysis: v=2.4 cv=OYaYDgTY c=1 sm=1 tr=0 ts=681686e5 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=R-bQzvCybzszNUzdUgsA:9 cc=ntf awl=host:13129
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDE5NiBTYWx0ZWRfXwT3DV2O21Xpq LikQeQMOrHX/KO5bo9cIuDwcokpp+ivefj96oFKE6wzWMqXV2cgeYCR7X4rFsOJx0DQU6qTZHYd 0v1gqruKIclLn5V1OxD0+L2S7zev+MFUSABcyY4uqBmieB51oLsaLYSgl5wwBaBuvtyXolRJ2wo
 IpL4SGEiJdEYWyDRY2L7tIAHVOVIq+ah6MIvk19eP2kUxYCqgTCOYqw8mFiSR59rjWsmJP2w3by S2iYIXt+x26zmY3XiUREMJcMjILYzfeSfvNl9xQJsdVLOM3nGjlfrkrrpEscGTVhGWCuEv2y0Az LGpINFjgxeZQJGcPUv6BpuCInrYtyVEKIz8i5jCn2oCQdAtlVnaYvH+WYnkYhunQtFMbb0wI2J5
 7HpbaaLj5uBTdaZ5wr7Ykt2R5GoikmynSnNVTk2ADmS384oqcbL1FE/oTee6BVcs0kSKy5s3
X-Proofpoint-ORIG-GUID: WEpp56FpAquU5cPQDpfOfa8LG0LtI_cs
X-Proofpoint-GUID: WEpp56FpAquU5cPQDpfOfa8LG0LtI_cs

Adjust every relevant test (that is, one that moves memory) to also perform
the same test using MREMAP_MUST_RELOCATE_ANON to assert that it is behaving
as expected.

In order to avoid glibc not being up-to-date, also move to using the
mremap() system call direct, and import the linux/mman.h header, which will
use the tool linux header wrappers, to get the latest mremap defines.

Also take careful precaution in the instance where we might unexpectedly
fail the 'mremap move within range' test due to large folios mapped outside
of the range we are relocating.

In these instances, if we test with MREMAP_MUST_RELOCATE_ANON, we ensure
the folios in question are not huge. If testing with MREMAP_RELOCATE_ANON
we do not - this asserts that this correctly falls back to non-relocate
anon behaviour.

In cases where MREMAP_MUST_RELOCATE_ANON is used, we attempt to immediately
trigger reclaim to also assert that the rmap state is uncorrupted.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 tools/testing/selftests/mm/mremap_test.c | 262 +++++++++++++++--------
 1 file changed, 168 insertions(+), 94 deletions(-)

diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
index bb84476a177f..5d6ff0d1da7d 100644
--- a/tools/testing/selftests/mm/mremap_test.c
+++ b/tools/testing/selftests/mm/mremap_test.c
@@ -8,11 +8,13 @@
 #include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
+#include <linux/mman.h>
 #include <sys/mman.h>
 #include <time.h>
 #include <stdbool.h>
 
 #include "../kselftest.h"
+#include "vm_util.h"
 
 #define EXPECT_SUCCESS 0
 #define EXPECT_FAILURE 1
@@ -34,6 +36,7 @@ struct config {
 	unsigned long long dest_alignment;
 	unsigned long long region_size;
 	int overlapping;
+	bool use_relocate_anon;
 	unsigned int dest_preamble_size;
 };
 
@@ -60,7 +63,8 @@ enum {
 #define PTE page_size
 
 #define MAKE_TEST(source_align, destination_align, size,	\
-		  overlaps, should_fail, test_name)		\
+		  overlaps, use_relocate_anon, should_fail,	\
+		  test_name)					\
 (struct test){							\
 	.name = test_name,					\
 	.config = {						\
@@ -68,6 +72,7 @@ enum {
 		.dest_alignment = destination_align,		\
 		.region_size = size,				\
 		.overlapping = overlaps,			\
+		.use_relocate_anon = use_relocate_anon,		\
 	},							\
 	.expect_failure = should_fail				\
 }
@@ -184,6 +189,12 @@ static void *get_source_mapping(struct config c)
 	unsigned long long addr = 0ULL;
 	void *src_addr = NULL;
 	unsigned long long mmap_min_addr;
+	int mmap_flags = MAP_FIXED_NOREPLACE | MAP_ANONYMOUS;
+
+	if (c.use_relocate_anon)
+		mmap_flags |= MAP_PRIVATE;
+	else
+		mmap_flags |= MAP_SHARED;
 
 	mmap_min_addr = get_mmap_min_addr();
 	/*
@@ -198,8 +209,7 @@ static void *get_source_mapping(struct config c)
 		goto retry;
 
 	src_addr = mmap((void *) addr, c.region_size, PROT_READ | PROT_WRITE,
-					MAP_FIXED_NOREPLACE | MAP_ANONYMOUS | MAP_SHARED,
-					-1, 0);
+					mmap_flags, -1, 0);
 	if (src_addr == MAP_FAILED) {
 		if (errno == EPERM || errno == EEXIST)
 			goto retry;
@@ -251,7 +261,7 @@ static void mremap_expand_merge(FILE *maps_fp, unsigned long page_size)
 	}
 
 	munmap(start + page_size, page_size);
-	remap = mremap(start, page_size, 2 * page_size, 0);
+	remap = sys_mremap(start, page_size, 2 * page_size, 0, 0);
 	if (remap == MAP_FAILED) {
 		ksft_print_msg("mremap failed: %s\n", strerror(errno));
 		munmap(start, page_size);
@@ -292,7 +302,8 @@ static void mremap_expand_merge_offset(FILE *maps_fp, unsigned long page_size)
 
 	/* Unmap final page to ensure we have space to expand. */
 	munmap(start + 2 * page_size, page_size);
-	remap = mremap(start + page_size, page_size, 2 * page_size, 0);
+
+	remap = sys_mremap(start + page_size, page_size, 2 * page_size, 0, 0);
 	if (remap == MAP_FAILED) {
 		ksft_print_msg("mremap failed: %s\n", strerror(errno));
 		munmap(start, 2 * page_size);
@@ -324,20 +335,35 @@ static void mremap_expand_merge_offset(FILE *maps_fp, unsigned long page_size)
  *
  * |DDDDddddSSSSssss|
  */
-static void mremap_move_within_range(unsigned int pattern_seed, char *rand_addr)
+static void mremap_move_within_range(unsigned int pattern_seed, char *rand_addr,
+				     char *test_suffix, int extra_flags)
 {
 	char *test_name = "mremap mremap move within range";
 	void *src, *dest;
 	unsigned int i, success = 1;
-
 	size_t size = SIZE_MB(20);
 	void *ptr = mmap(NULL, size, PROT_READ | PROT_WRITE,
 			 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	int mremap_flags = MREMAP_MAYMOVE | MREMAP_FIXED;
+
 	if (ptr == MAP_FAILED) {
 		perror("mmap");
 		success = 0;
 		goto out;
 	}
+
+	/*
+	 * If THP is enabled, we may end up spanning a range which has large
+	 * folios not enclosed within the mapping, which will disallow the
+	 * relocate.
+	 *
+	 * In this case, disallow huge pages in the range.
+	 */
+	if (extra_flags & MREMAP_MUST_RELOCATE_ANON)
+		madvise(ptr, size, MADV_NOHUGEPAGE);
+
+	mremap_flags |= extra_flags;
+
 	memset(ptr, 0, size);
 
 	src = ptr + SIZE_MB(6);
@@ -348,8 +374,8 @@ static void mremap_move_within_range(unsigned int pattern_seed, char *rand_addr)
 
 	dest = src - SIZE_MB(2);
 
-	void *new_ptr = mremap(src + SIZE_MB(1), SIZE_MB(1), SIZE_MB(1),
-						   MREMAP_MAYMOVE | MREMAP_FIXED, dest + SIZE_MB(1));
+	void *new_ptr = sys_mremap(src + SIZE_MB(1), SIZE_MB(1), SIZE_MB(1),
+				   mremap_flags, dest + SIZE_MB(1));
 	if (new_ptr == MAP_FAILED) {
 		perror("mremap");
 		success = 0;
@@ -375,9 +401,9 @@ static void mremap_move_within_range(unsigned int pattern_seed, char *rand_addr)
 		perror("munmap");
 
 	if (success)
-		ksft_test_result_pass("%s\n", test_name);
+		ksft_test_result_pass("%s%s\n", test_name, test_suffix);
 	else
-		ksft_test_result_fail("%s\n", test_name);
+		ksft_test_result_fail("%s%s\n", test_name, test_suffix);
 }
 
 /* Returns the time taken for the remap on success else returns -1. */
@@ -390,6 +416,10 @@ static long long remap_region(struct config c, unsigned int threshold_mb,
 	long long  start_ns, end_ns, align_mask, ret, offset;
 	unsigned long long threshold;
 	unsigned long num_chunks;
+	int mremap_flags = MREMAP_MAYMOVE | MREMAP_FIXED;
+
+	if (c.use_relocate_anon)
+		mremap_flags |= MREMAP_MUST_RELOCATE_ANON;
 
 	if (threshold_mb == VALIDATION_NO_THRESHOLD)
 		threshold = c.region_size;
@@ -431,10 +461,15 @@ static long long remap_region(struct config c, unsigned int threshold_mb,
 	}
 
 	if (c.dest_preamble_size) {
+		int mmap_flags = MAP_FIXED_NOREPLACE | MAP_ANONYMOUS;
+
+		if (c.use_relocate_anon)
+			mmap_flags |= MAP_PRIVATE;
+		else
+			mmap_flags |= MAP_SHARED;
+
 		dest_preamble_addr = mmap((void *) addr - c.dest_preamble_size, c.dest_preamble_size,
-					  PROT_READ | PROT_WRITE,
-					  MAP_FIXED_NOREPLACE | MAP_ANONYMOUS | MAP_SHARED,
-							-1, 0);
+					  PROT_READ | PROT_WRITE, mmap_flags, -1, 0);
 		if (dest_preamble_addr == MAP_FAILED) {
 			ksft_print_msg("Failed to map dest preamble region: %s\n",
 					strerror(errno));
@@ -447,8 +482,8 @@ static long long remap_region(struct config c, unsigned int threshold_mb,
 	}
 
 	clock_gettime(CLOCK_MONOTONIC, &t_start);
-	dest_addr = mremap(src_addr, c.region_size, c.region_size,
-					  MREMAP_MAYMOVE|MREMAP_FIXED, (char *) addr);
+	dest_addr = sys_mremap(src_addr, c.region_size, c.region_size,
+			       mremap_flags, (char *) addr);
 	clock_gettime(CLOCK_MONOTONIC, &t_end);
 
 	if (dest_addr == MAP_FAILED) {
@@ -549,6 +584,10 @@ static long long remap_region(struct config c, unsigned int threshold_mb,
  * subsequent tests. So we clean up mappings after each test.
  */
 clean_up_dest:
+	/* Trigger reclaim to assert that adjusted rmap state is valid. */
+	if (c.use_relocate_anon)
+		madvise(dest_addr, c.region_size, MADV_PAGEOUT);
+
 	munmap(dest_addr, c.region_size);
 clean_up_dest_preamble:
 	if (c.dest_preamble_size && dest_preamble_addr)
@@ -565,16 +604,19 @@ static long long remap_region(struct config c, unsigned int threshold_mb,
  * down address landed on a mapping that maybe does not exist.
  */
 static void mremap_move_1mb_from_start(unsigned int pattern_seed,
-				       char *rand_addr)
+				       char *rand_addr, char *test_suffix,
+				       int extra_flags)
 {
 	char *test_name = "mremap move 1mb from start at 1MB+256KB aligned src";
 	void *src = NULL, *dest = NULL;
 	unsigned int i, success = 1;
-
+	int mremap_flags = MREMAP_MAYMOVE | MREMAP_FIXED;
 	/* Config to reuse get_source_mapping() to do an aligned mmap. */
 	struct config c = {
 		.src_alignment = SIZE_MB(1) + SIZE_KB(256),
-		.region_size = SIZE_MB(6)
+		.region_size = SIZE_MB(6),
+		.use_relocate_anon = extra_flags & (MREMAP_RELOCATE_ANON |
+						    MREMAP_MUST_RELOCATE_ANON),
 	};
 
 	src = get_source_mapping(c);
@@ -583,6 +625,12 @@ static void mremap_move_1mb_from_start(unsigned int pattern_seed,
 		goto out;
 	}
 
+	/* See comment in mremap_move_within_range(). */
+	if (extra_flags & MREMAP_MUST_RELOCATE_ANON)
+		madvise(src, c.region_size, MADV_NOHUGEPAGE);
+
+	mremap_flags |= extra_flags;
+
 	c.src_alignment = SIZE_MB(1) + SIZE_KB(256);
 	dest = get_source_mapping(c);
 	if (!dest) {
@@ -599,8 +647,8 @@ static void mremap_move_1mb_from_start(unsigned int pattern_seed,
 	 */
 	munmap(dest, SIZE_MB(1));
 
-	void *new_ptr = mremap(src + SIZE_MB(1), SIZE_MB(1), SIZE_MB(1),
-						   MREMAP_MAYMOVE | MREMAP_FIXED, dest + SIZE_MB(1));
+	void *new_ptr = sys_mremap(src + SIZE_MB(1), SIZE_MB(1), SIZE_MB(1),
+				   mremap_flags, dest + SIZE_MB(1));
 	if (new_ptr == MAP_FAILED) {
 		perror("mremap");
 		success = 0;
@@ -629,9 +677,10 @@ static void mremap_move_1mb_from_start(unsigned int pattern_seed,
 		perror("munmap dest");
 
 	if (success)
-		ksft_test_result_pass("%s\n", test_name);
+		ksft_test_result_pass("%s%s\n", test_name, test_suffix);
+
 	else
-		ksft_test_result_fail("%s\n", test_name);
+		ksft_test_result_fail("%s%s\n", test_name, test_suffix);
 }
 
 static void run_mremap_test_case(struct test test_case, int *failures,
@@ -640,13 +689,17 @@ static void run_mremap_test_case(struct test test_case, int *failures,
 {
 	long long remap_time = remap_region(test_case.config, threshold_mb,
 					    rand_addr);
+	char *relocate_anon_suffix = " [MREMAP_MUST_RELOCATE_ANON]";
+	struct config *c = &test_case.config;
 
 	if (remap_time < 0) {
 		if (test_case.expect_failure)
-			ksft_test_result_xfail("%s\n\tExpected mremap failure\n",
-					      test_case.name);
+			ksft_test_result_xfail("%s%s\n\tExpected mremap failure\n",
+					       test_case.name,
+					       c->use_relocate_anon ? relocate_anon_suffix : "");
 		else {
-			ksft_test_result_fail("%s\n", test_case.name);
+			ksft_test_result_fail("%s%s\n", test_case.name,
+					      c->use_relocate_anon ? relocate_anon_suffix : "");
 			*failures += 1;
 		}
 	} else {
@@ -656,10 +709,13 @@ static void run_mremap_test_case(struct test test_case, int *failures,
 		 */
 		if (threshold_mb == VALIDATION_NO_THRESHOLD ||
 		    test_case.config.region_size <= threshold_mb * _1MB)
-			ksft_test_result_pass("%s\n\tmremap time: %12lldns\n",
-					      test_case.name, remap_time);
+			ksft_test_result_pass("%s%s\n\tmremap time: %12lldns\n",
+					      test_case.name,
+					      c->use_relocate_anon ? relocate_anon_suffix : "",
+					      remap_time);
 		else
-			ksft_test_result_pass("%s\n", test_case.name);
+			ksft_test_result_pass("%s%s\n", test_case.name,
+					      c->use_relocate_anon ? relocate_anon_suffix : "");
 	}
 }
 
@@ -703,8 +759,8 @@ static int parse_args(int argc, char **argv, unsigned int *threshold_mb,
 	return 0;
 }
 
-#define MAX_TEST 15
-#define MAX_PERF_TEST 3
+#define MAX_TEST 30
+#define MAX_PERF_TEST 6
 int main(int argc, char **argv)
 {
 	int failures = 0;
@@ -721,12 +777,15 @@ int main(int argc, char **argv)
 	char *rand_addr;
 	size_t rand_size;
 	int num_expand_tests = 2;
-	int num_misc_tests = 2;
+	int num_misc_tests = 6;
 	struct test test_cases[MAX_TEST] = {};
 	struct test perf_test_cases[MAX_PERF_TEST];
 	int page_size;
 	time_t t;
 	FILE *maps_fp;
+	bool use_relocate_anon = false;
+	struct test *test_case = test_cases;
+	struct test *perf_test_case = perf_test_cases;
 
 	pattern_seed = (unsigned int) time(&t);
 
@@ -763,66 +822,71 @@ int main(int argc, char **argv)
 
 	page_size = sysconf(_SC_PAGESIZE);
 
-	/* Expected mremap failures */
-	test_cases[0] =	MAKE_TEST(page_size, page_size, page_size,
-				  OVERLAPPING, EXPECT_FAILURE,
-				  "mremap - Source and Destination Regions Overlapping");
-
-	test_cases[1] = MAKE_TEST(page_size, page_size/4, page_size,
-				  NON_OVERLAPPING, EXPECT_FAILURE,
-				  "mremap - Destination Address Misaligned (1KB-aligned)");
-	test_cases[2] = MAKE_TEST(page_size/4, page_size, page_size,
-				  NON_OVERLAPPING, EXPECT_FAILURE,
-				  "mremap - Source Address Misaligned (1KB-aligned)");
-
-	/* Src addr PTE aligned */
-	test_cases[3] = MAKE_TEST(PTE, PTE, PTE * 2,
-				  NON_OVERLAPPING, EXPECT_SUCCESS,
-				  "8KB mremap - Source PTE-aligned, Destination PTE-aligned");
-
-	/* Src addr 1MB aligned */
-	test_cases[4] = MAKE_TEST(_1MB, PTE, _2MB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				  "2MB mremap - Source 1MB-aligned, Destination PTE-aligned");
-	test_cases[5] = MAKE_TEST(_1MB, _1MB, _2MB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				  "2MB mremap - Source 1MB-aligned, Destination 1MB-aligned");
-
-	/* Src addr PMD aligned */
-	test_cases[6] = MAKE_TEST(PMD, PTE, _4MB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				  "4MB mremap - Source PMD-aligned, Destination PTE-aligned");
-	test_cases[7] =	MAKE_TEST(PMD, _1MB, _4MB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				  "4MB mremap - Source PMD-aligned, Destination 1MB-aligned");
-	test_cases[8] = MAKE_TEST(PMD, PMD, _4MB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				  "4MB mremap - Source PMD-aligned, Destination PMD-aligned");
-
-	/* Src addr PUD aligned */
-	test_cases[9] = MAKE_TEST(PUD, PTE, _2GB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				  "2GB mremap - Source PUD-aligned, Destination PTE-aligned");
-	test_cases[10] = MAKE_TEST(PUD, _1MB, _2GB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				   "2GB mremap - Source PUD-aligned, Destination 1MB-aligned");
-	test_cases[11] = MAKE_TEST(PUD, PMD, _2GB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				   "2GB mremap - Source PUD-aligned, Destination PMD-aligned");
-	test_cases[12] = MAKE_TEST(PUD, PUD, _2GB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				   "2GB mremap - Source PUD-aligned, Destination PUD-aligned");
-
-	/* Src and Dest addr 1MB aligned. 5MB mremap. */
-	test_cases[13] = MAKE_TEST(_1MB, _1MB, _5MB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				  "5MB mremap - Source 1MB-aligned, Destination 1MB-aligned");
-
-	/* Src and Dest addr 1MB aligned. 5MB mremap. */
-	test_cases[14] = MAKE_TEST(_1MB, _1MB, _5MB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				  "5MB mremap - Source 1MB-aligned, Dest 1MB-aligned with 40MB Preamble");
-	test_cases[14].config.dest_preamble_size = 10 * _4MB;
-
-	perf_test_cases[0] =  MAKE_TEST(page_size, page_size, _1GB, NON_OVERLAPPING, EXPECT_SUCCESS,
-					"1GB mremap - Source PTE-aligned, Destination PTE-aligned");
-	/*
-	 * mremap 1GB region - Page table level aligned time
-	 * comparison.
-	 */
-	perf_test_cases[1] = MAKE_TEST(PMD, PMD, _1GB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				       "1GB mremap - Source PMD-aligned, Destination PMD-aligned");
-	perf_test_cases[2] = MAKE_TEST(PUD, PUD, _1GB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				       "1GB mremap - Source PUD-aligned, Destination PUD-aligned");
+	do {
+		/* Expected mremap failures */
+		*test_case++ =	MAKE_TEST(page_size, page_size, page_size,
+					  OVERLAPPING, use_relocate_anon, EXPECT_FAILURE,
+					  "mremap - Source and Destination Regions Overlapping");
+
+		*test_case++ =	MAKE_TEST(page_size, page_size/4, page_size,
+					  NON_OVERLAPPING, use_relocate_anon, EXPECT_FAILURE,
+					  "mremap - Destination Address Misaligned (1KB-aligned)");
+		*test_case++ =	MAKE_TEST(page_size/4, page_size, page_size,
+					  NON_OVERLAPPING, use_relocate_anon, EXPECT_FAILURE,
+					  "mremap - Source Address Misaligned (1KB-aligned)");
+
+		/* Src addr PTE aligned */
+		*test_case++ =	MAKE_TEST(PTE, PTE, PTE * 2,
+					  NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					  "8KB mremap - Source PTE-aligned, Destination PTE-aligned");
+
+		/* Src addr 1MB aligned */
+		*test_case++ =	MAKE_TEST(_1MB, PTE, _2MB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					  "2MB mremap - Source 1MB-aligned, Destination PTE-aligned");
+		*test_case++ =	MAKE_TEST(_1MB, _1MB, _2MB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					  "2MB mremap - Source 1MB-aligned, Destination 1MB-aligned");
+
+		/* Src addr PMD aligned */
+		*test_case++ =	MAKE_TEST(PMD, PTE, _4MB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					  "4MB mremap - Source PMD-aligned, Destination PTE-aligned");
+		*test_case++ =	MAKE_TEST(PMD, _1MB, _4MB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					  "4MB mremap - Source PMD-aligned, Destination 1MB-aligned");
+		*test_case++ =	MAKE_TEST(PMD, PMD, _4MB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					  "4MB mremap - Source PMD-aligned, Destination PMD-aligned");
+
+		/* Src addr PUD aligned */
+		*test_case++ =	MAKE_TEST(PUD, PTE, _2GB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					  "2GB mremap - Source PUD-aligned, Destination PTE-aligned");
+		*test_case++ =	MAKE_TEST(PUD, _1MB, _2GB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					   "2GB mremap - Source PUD-aligned, Destination 1MB-aligned");
+		*test_case++ =	MAKE_TEST(PUD, PMD, _2GB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					   "2GB mremap - Source PUD-aligned, Destination PMD-aligned");
+		*test_case++ =	MAKE_TEST(PUD, PUD, _2GB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					   "2GB mremap - Source PUD-aligned, Destination PUD-aligned");
+
+		/* Src and Dest addr 1MB aligned. 5MB mremap. */
+		*test_case++ =	MAKE_TEST(_1MB, _1MB, _5MB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					   "5MB mremap - Source 1MB-aligned, Destination 1MB-aligned");
+
+		/* Src and Dest addr 1MB aligned. 5MB mremap. */
+		*test_case =	MAKE_TEST(_1MB, _1MB, _5MB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					   "5MB mremap - Source 1MB-aligned, Dest 1MB-aligned with 40MB Preamble");
+		test_case++->config.dest_preamble_size = 10 * _4MB;
+
+		*perf_test_case++ =	 MAKE_TEST(page_size, page_size, _1GB, NON_OVERLAPPING,
+						   use_relocate_anon, EXPECT_SUCCESS,
+						"1GB mremap - Source PTE-aligned, Destination PTE-aligned");
+		/*
+		 * mremap 1GB region - Page table level aligned time
+		 * comparison.
+		 */
+		*perf_test_case++ =	MAKE_TEST(PMD, PMD, _1GB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					       "1GB mremap - Source PMD-aligned, Destination PMD-aligned");
+		*perf_test_case++ =	MAKE_TEST(PUD, PUD, _1GB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					       "1GB mremap - Source PUD-aligned, Destination PUD-aligned");
+
+		use_relocate_anon = !use_relocate_anon;
+	} while (use_relocate_anon);
 
 	run_perf_tests =  (threshold_mb == VALIDATION_NO_THRESHOLD) ||
 				(threshold_mb * _1MB >= _1GB);
@@ -846,8 +910,18 @@ int main(int argc, char **argv)
 
 	fclose(maps_fp);
 
-	mremap_move_within_range(pattern_seed, rand_addr);
-	mremap_move_1mb_from_start(pattern_seed, rand_addr);
+	mremap_move_within_range(pattern_seed, rand_addr,
+				 "", 0);
+	mremap_move_within_range(pattern_seed, rand_addr,
+				 "[MREMAP_RELOCATE_ANON]", MREMAP_RELOCATE_ANON);
+	mremap_move_within_range(pattern_seed, rand_addr,
+				 "[MREMAP_MUST_RELOCATE_ANON]", MREMAP_MUST_RELOCATE_ANON);
+	mremap_move_1mb_from_start(pattern_seed, rand_addr,
+				   "", 0);
+	mremap_move_1mb_from_start(pattern_seed, rand_addr,
+				   "[MREMAP_RELOCATE_ANON]", MREMAP_RELOCATE_ANON);
+	mremap_move_1mb_from_start(pattern_seed, rand_addr,
+				   "[MREMAP_MUST_RELOCATE_ANON]", MREMAP_MUST_RELOCATE_ANON);
 
 	if (run_perf_tests) {
 		ksft_print_msg("\n%s\n",
-- 
2.49.0

