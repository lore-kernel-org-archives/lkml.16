Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F3E1DF258;
	Tue,  3 Jun 2025 14:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748960697; cv=fail; b=E20gr6syRZfy8+JptctajGYTjCWXJMRKX0AJ+OsD8AIOEb8b1JKlds61iG/ji6w1NmgYsUQFKJzsqXauS90E6yllzSdjh+W/nPfIO86lLLWbTrj5IOny1V6IrxERqKqtiCkXE9ke4hDWmTAI8tCwqLjdMs7hD+9/ZLe6fZz5TDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748960697; c=relaxed/simple;
	bh=KisbNFsIS5sO2/QRgW5/Me0kn8gu+3W6nbLVat1wr38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LNigWeYvexVrPyUfE3M/M1Eq/GDVhdJ7GL3eB6U9HxP+FRQIooGHlEjz1jYdpP11DdvMhsWPvy1aBhpZHAJRLz6C7GtHcFb2dC2ycLmgagO4XRv9gW/SFVDlf+NfQgexY99rNzikwRvyZcIaHTTzormqT5NCJtSiwdUWpOaGib0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SfNhWcgx; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KXTo05q4; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SfNhWcgx";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KXTo05q4"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553AEmix018642;
	Tue, 3 Jun 2025 14:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=bx4c652otOv5o/CdrY
	XLqLhJFa55BOrMi45s7Q1Un/A=; b=SfNhWcgx3O5OntwQivJ+plX6dQRrVPqy6n
	YOW3vPz0C2x2M/Vw2Dc1zJ4tjPeOCJbZslkwdUNM7Y0JHfbkts8CMI2G9o4ufGdD
	cqc/gbBwU8RYXLStgrR4VNNjbtu9UNTFgz9SrwLIWhncjwBqyb5LT8LKrzZaSNHV
	ytIIW5/+1+ct5hwdSAd7jOct5bFZwG3dtb/Lub8qUJSTVJlpHAADXzHOyOrAPn/+
	X4+dAWQV0hr8YZETDsV8yjtF4NP0j0UAp9SheytxgQOPeh7A9IVHqiCSCnHi8cbL
	0tBsERSD7zcjR4ZXM1eXSULwqT5FfP6wuOFVCC9gcyye5MtZIpzA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471gwh9vxm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 14:24:30 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 553ELKsV040691;
	Tue, 3 Jun 2025 14:24:29 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2068.outbound.protection.outlook.com [40.107.101.68])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr79nuqk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 14:24:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wvEDxu/nbFfzRX4Hfb62O0D+W++SQR9VNXg6tB5l4+ATnRe9wvtk9GLFkColBTKID9HdQ5+uK+7CqjTGcJEffQKtHtb6Tvi1F56TjCKiP4GmVMnE87aqlOAqbDWKZalF9uPgi18Zh1nU59ImFvaxPSrRPBLaaRGW9P+uk5O6jGqlsbH1TpzWJ7hJ4xWP/gh9UJLmcoBRSs9c0197t9d5qFFpq7S8kUutj94QzBPEZGe9hNgitGRhCTK0iFlt7fSxqFWuWsILti/TSX/M0xCgnmCrq1Qiyj90a/7VCVDNhdRc0A4cVdS7diSN+zi0lO64TK3qJqNNOJJw4QavW++CdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bx4c652otOv5o/CdrYXLqLhJFa55BOrMi45s7Q1Un/A=;
 b=bmdGR4l+i6fHLAoj+F77oSEUb8SQ1zZgZNYYak0KX6S31GZheCRb3QL0Va+biK06ICU2A2MVuQyAdno5Bw8jfLNeu63WmZmRjp5SKa07/xC5CAEXZeqkMqF0GYB7y3sGxGvsM+7OLoIrZlDSCUAhFAa4D4ltElrT4a3UWEHMrcCd1EWz44DxO4o0KGni0RAfhv2UYT+7Kt2GRXuaVzE/XAOLToqU0o3hM/2iVikGDXuCtD8hmkwny4ia9zggliTnrdVDl3c1wEr77Na/MVxXlmaaud6JTBBvtKQdTwjLfknCKn8rWj0Fwe0XvxtDbNqoZ0TsTWTYU6oRXKWuIV638g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bx4c652otOv5o/CdrYXLqLhJFa55BOrMi45s7Q1Un/A=;
 b=KXTo05q4HrBa3tonLDAna1rNS/p66iBFZywS/WFy8Q/4FlZGd7fl844nax3ycgUruIhiX8AP/SmiLyJqndP09b99O5zuf1+QeM025wt6uWH7BaSJVJACQyRoTFh3BKgXn7GkYICbODpw9uJnJQe0dKzm9uaBOFZ1dc8Nw6wTT6U=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CY8PR10MB7170.namprd10.prod.outlook.com (2603:10b6:930:74::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.41; Tue, 3 Jun
 2025 14:24:25 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8746.041; Tue, 3 Jun 2025
 14:24:25 +0000
Date: Tue, 3 Jun 2025 15:24:23 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Suren Baghdasaryan <surenb@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Shakeel Butt <shakeel.butt@linux.dev>, Jann Horn <jannh@google.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/mm: expand vma doc to highlight pte freeing,
 non-vma traversal
Message-ID: <ea8c2be9-0af0-445b-b7fe-fd9e80bd6a65@lucifer.local>
References: <20250602210710.106159-1-lorenzo.stoakes@oracle.com>
 <87bjr59634.fsf@trenco.lwn.net>
 <9fc9ac50-abce-48bd-979f-2e00b26917b5@lucifer.local>
 <8734cg9auh.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8734cg9auh.fsf@trenco.lwn.net>
X-ClientProxiedBy: LO4P123CA0073.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::6) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CY8PR10MB7170:EE_
X-MS-Office365-Filtering-Correlation-Id: b3fa9fe9-4927-44af-0f9c-08dda2aa5798
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QG4oh8rT6F88p/SEg8X7Y8jur7VEzItBvAx5kHPldBDQU3wUkH5T3GLlNasZ?=
 =?us-ascii?Q?8NAZDOVitnN6tfdBk44FX8BWteGjOrl7jZ1Q4EiXBDLmNI1EGOoyu/3WdAV+?=
 =?us-ascii?Q?ft/wROL3fX875Xqg0blWUpw3gwP/LzH2X7JP5GKhXhl0UL6b09KChv9Td87V?=
 =?us-ascii?Q?dvJTgHjXPwciWuyZXps5N5KfqXuRz1GtBDc7DSaeDXxd57etg8Eh9dDbOO5+?=
 =?us-ascii?Q?TUJOxyQXVlgfUE3VKote/ofQrz0Q4pJx/dVbJNSeJbawe0Xo3b8URUyZOEr5?=
 =?us-ascii?Q?18QlZQloeW6JZyDH0RvN+a/LuZR36Oj+WQ+02HuV+U7XVAfY/j9NpxkwBdas?=
 =?us-ascii?Q?50B2mSXdoDXhIzm1o2jlcYM/bbHov3MXDRbaCak/yKUGauzd7WtAsiirZ6AC?=
 =?us-ascii?Q?1kuro9AbF0lS564Z37bHjS7QAD5u2B+GHba/MpYnHTHTNtufWdGOJrNTvr0k?=
 =?us-ascii?Q?YSaIaInU98fEluJTD6NZl1IylsEYfa2MIy3lYUXQAPWAnrMrww8avlJn82ft?=
 =?us-ascii?Q?keZGRVl89DckDTUnu3auQjD2BWrequwNj0Ya5Gewgd60XCi4KM60htCM+UqC?=
 =?us-ascii?Q?SXUX9+1jspDLbNh/hxKcTuAPA8Rh0yVlxC0nedkysvr1caKJVwADQpMKtJuy?=
 =?us-ascii?Q?4RkPCNNcuw3g5IrrEMtSt8D0Z2PiE0xinLnJV3xCoTB7CDJa38OjJSsqPHxA?=
 =?us-ascii?Q?r1NB9UthKCnwvLepRzAtDfMJ17b/dUDNWeQoJQZE9kuZAH+xCzoosN1vlVga?=
 =?us-ascii?Q?Yjfv0KDqS66hSoYaeLDgxCVyXp0CkvYrbUC8og4bKB+/lcSPLzaEK++r97Wy?=
 =?us-ascii?Q?18svJIYwLPgRjhiaOnAw+ryOkO/sJXU2Q7fru8JyudXq4Pld1IW/wOaLlfuV?=
 =?us-ascii?Q?QCjDRHYwJfb90tJEf4Ngys2w++SIMi4HBjSIOIGF+o90noUfKUL+V9hbYw7f?=
 =?us-ascii?Q?iareOGaPkfnvxvinOhdLH5pSiI8kezTSfxbIe63uUb6Q3nhljeaIcALr2sAj?=
 =?us-ascii?Q?vq7lALF7fnYAxoKap9XMEzUQ/MHQ+lbGPjGtCiaiI/0Vg99eoeQDZWXEQcLm?=
 =?us-ascii?Q?TvqoptEQhMfKKIYFHXBIvxsXXZ8BEduJfS2s7pus3mW71ZE1fbVa09l8MhCJ?=
 =?us-ascii?Q?+ky6LiBzd1hgRcJB8ecBLJr6gKsicxblk66uTWKp8TfwZ+SEq1X19cnTeugO?=
 =?us-ascii?Q?6EDL+xtRVHP0SUo1hYjxyS+n2Va6mL1cicHyDPsrFpPl7XYjN+HDVPxC3+YT?=
 =?us-ascii?Q?XF+5+KEiGA8hZZcFwM8tIfF1xJ7uxgV+B80DCER1wqDL7ynrTyHQjdQOVRCW?=
 =?us-ascii?Q?Rlx04zhGjVtYug7AZWNtwiQDwg4PHXroxlcrwAcRKSDESnZ/yj+6zThlcvMb?=
 =?us-ascii?Q?ExusikLtbhFsiywXd0skUc9BCaZ/KmuwlaGBgNmNYXLBk2wjLurytvxjwdcn?=
 =?us-ascii?Q?C/gUhqvxJNM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FTRP1l0zLQWkDgVRjEe4byt2zm4rLDEOSdv4gwViBfAdglptf5qeZFNQM5X1?=
 =?us-ascii?Q?YBdb4XMIxWEDig4UKGBPVSVbbcMcLAs6nREWS3UVc3GFE5vj3aA3UUl0MHfr?=
 =?us-ascii?Q?jGfWofdBdYThLmRplfXjydqeBxXq9W3SDs8S5buzXO+vszN5weTSol79hcet?=
 =?us-ascii?Q?Wct3MtIrb1e4dv3TbSZP9wdkLz0cBTe95loSTpZGSeii7pjyBkt7pmecLtTf?=
 =?us-ascii?Q?8yfQNXoNeBP8LSS5RidmTQZ5UorI4508V8Ng8ccoC4jN52TFVesNh2BDqUHw?=
 =?us-ascii?Q?SUt4FFbp0/EIYAUEgDsosxirIJe422Sw8ojoGe/NKXXbO6hprsVvadv8RseZ?=
 =?us-ascii?Q?+roo62BkjdIFufqhCo6cGLHIpGSuo5gT6cNsiJtKEuz9WhOmt6UCJCSeOnD0?=
 =?us-ascii?Q?JTqYbCQvR6+0TnTjYWiAAGfEmgYbHhRRne8WHF92gkYuLJIvQ+z9SewjBKNx?=
 =?us-ascii?Q?B0lCOg/XwJv/yF9uRjGuIIQF0V7Zh7CH+Z6PFs0h28eR5f3fz6XZSdzY84ab?=
 =?us-ascii?Q?jfzAoEyRT7dgnGRiX+Rae/dt9zOE64TGAS1nRl8uB0u94RvXN+6A5lUBX4AZ?=
 =?us-ascii?Q?rlinchtKG4skA67sscXSvoozkdccEBv+zG3X4EB0uITXOjg6lPswSKFRtoF5?=
 =?us-ascii?Q?LxC7gu+apfA5MbPEEsyyuZ84w83kIyuPegp9pCOH9ddsRN2i+AIw4lI0Ry/s?=
 =?us-ascii?Q?JGhmssMk/4XsTFga91Szowjj58ak2YZ7EITMYN7Ne0gnU5SxLO9BEQ0owDG5?=
 =?us-ascii?Q?Cd+KC32Rt5f3YzCi8qnfFpxZoeFgjhLh22bEoQ+h8gXFeX/Z5AcnYG0gXsd3?=
 =?us-ascii?Q?drXJc2uY20cfbSqe/+Mid5f0VyeGSUP3+UI9fMp8IdRaQUMJeKXGSs/scRak?=
 =?us-ascii?Q?MYJJmWOldSTp25hziA0d5ipPrGupmaeLKYlRWIwIaJSy4QUGl9vscH4vjh8w?=
 =?us-ascii?Q?/a2X4gx/qDGXsOBjmP503q/tSzoCrtcqPKfPnWgQrN0Lm5dtos0Wk65yzC+F?=
 =?us-ascii?Q?ZxPqGo47EbIR6o4JjcymwNqFRYuQO2cNpXRJ2j2h3vbw/tWIosQ1Fxr7S7B/?=
 =?us-ascii?Q?GpFT5FlCAi5cq8NhdBRDyqxI0XEcUT8GdZpNdZ5G9u9brMVixgFh4jwJD/HQ?=
 =?us-ascii?Q?LYd7T0os/dlVPOrxLx7jvrgko69DtauNJD/lmZdBV7BSccBOb3DL0O3W2UVa?=
 =?us-ascii?Q?5zyOX6jVtRA4LNSODBr8hdpQG7Lm/FTNvzPiOHpGnqnXbDoCtwFAGReWXzEy?=
 =?us-ascii?Q?SO/pAkgNauwUl0n7DKZ9rx11oOtqURTwv5qtVpvUtFgZwyYOtfAmKk2Pf9vg?=
 =?us-ascii?Q?O+lXqTGkf0eBojSiq5tcscUO+5jFcX9tylm6B3gwS+1WIiHTsTTNTvGWtp4f?=
 =?us-ascii?Q?KMBpvb8Dx1iI2sfEgFN/BQ7QSZ3mcfOQ7WP2fJdEZ2dAqukR3EYCFAfJTLIz?=
 =?us-ascii?Q?IUd1u/eEK6d08OzzClwpQiv71jY4IE6FpnIWlReN+iA8lZWKAGAz2+frTULg?=
 =?us-ascii?Q?Qx+Bzu8gZXerdOk1ZP9nMwwJjGt4K8fXvmwfYTGTZEwp+EwI1IAlJbbq4ZXp?=
 =?us-ascii?Q?aYHE7/DL2L7UPfDKfnmGHoi9YUIyS7X83c3nKzIZvI8VRtRqctF+P3kAYCIO?=
 =?us-ascii?Q?BA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rnb1o8YiImElSGEdiKMgRobCsOSPNZvNXp6DxJWa+7ulg3jSt8dG1Kjl83yZgKSejJbf5d1NNZFUo3DgLr4BgKO9naFpge0tqL0JIooenETHZFEcOXZsGxH4VYv+x4xgwa5R+A2ENtunmSB6pvSzr578nqaVNwLqzTH21WsjDG/9oiZMfXnE8FgXf1/sa01MSr44AWUQrgbyMklDLpoqKZIykC4FSfB6ACYENkaPJptsfHFIcDkHJYNUJIU/VZX/vCwWlMkTXWYTr1/XmUeQ/tdABxAn4s2kC/pq6QKe9zm62DWqRD2CXvQdFvKQYjZVPsZXOQ8++m0TIU2/Fo5kYgMKlZDmBCR804yn2sovTbkKXMkZdBcmtN03nXMv75iynz6WioR/PlwXcQSw88t7Co03qA7d2CpN0m6HqOtOO3jRYPJCJMWweg/mruUjDxlxt8DmEhKNXhjFcWQ166tByTDZeT0a3SOndwPUk05/sLdF9J0W28r/P7z8Sq82LeWwmYcyAlHXs9T27iYk5OMz+fSb7kj980GDVXRfNydx+Vk0Cy5P36HkTN7ijaA6ItwP/Vivbk8NLMDHRFgRBJj8LUnXKF06Jv/4Ri4qGuVQq7w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3fa9fe9-4927-44af-0f9c-08dda2aa5798
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 14:24:25.4889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4bR+hkpYijnawodfWwpd/D6m0zAAvzrnhikhrx0QkhW3NftYwU6auGj5BIb1ZLkKhjCvxN4SnWmvqZ8YgqVTJVQFjW8ckevqRQdFnUOLEcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7170
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506030125
X-Authority-Analysis: v=2.4 cv=Wu0rMcfv c=1 sm=1 tr=0 ts=683f059e b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=g22-OFcxI2nFkwkJKpgA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13206
X-Proofpoint-GUID: el7iVGgOfZireYfNhbXUlEerIGCO6wzC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDEyNSBTYWx0ZWRfX5eGFDBL3nvAm OTWNYrSjsT1n7Do6nTd10BoOkX1VJyMspKnLpaMK4IDXNABCLUDipv/YyAv+/iSABHtmspMMOnH xyXP5YCqGDVqxnrFdHhsnGUxdUxq1rkrNeyBbR5a2OHMS5AR5nkZU6mQnKbVpZHGvLwEBbgOC/B
 yRidq8ibgw13bQOQHPjFqZER4WWCmsjP1npe2iOgA5JsLMm+SN8iTIdDF0IgCWQSaLtc3T/T+y1 vAN/zvZmtvZse7lbzQd3a5tzCxP8YlAuPie9qcJqmmkmwaEvwKAB8VPIWCVDiugIH8E/keA9tv8 DDAnCVR22eCvH7MDuxVtX6Yll2IJd3mm0cJWMFdMcJDeC74JFUMMA4ASxkhpYbfLkWTqF3N9xCZ
 n+E+k+S3Qa9WUjbwCy//M2pjHhU85n6WDt8Zu6/r+1hHfstdIaNl9UYgev57/iCHwOGft5Wg
X-Proofpoint-ORIG-GUID: el7iVGgOfZireYfNhbXUlEerIGCO6wzC

On Tue, Jun 03, 2025 at 08:08:22AM -0600, Jonathan Corbet wrote:
> Lorenzo Stoakes <lorenzo.stoakes@oracle.com> writes:
>
> > On Mon, Jun 02, 2025 at 03:38:55PM -0600, Jonathan Corbet wrote:
> >> Lorenzo Stoakes <lorenzo.stoakes@oracle.com> writes:
> >>
> >> > --- a/Documentation/mm/process_addrs.rst
> >> > +++ b/Documentation/mm/process_addrs.rst
> >> > @@ -303,7 +303,9 @@ There are four key operations typically performed on page tables:
> >> >  1. **Traversing** page tables - Simply reading page tables in order to traverse
> >> >     them. This only requires that the VMA is kept stable, so a lock which
> >> >     establishes this suffices for traversal (there are also lockless variants
> >> > -   which eliminate even this requirement, such as :c:func:`!gup_fast`).
> >> > +   which eliminate even this requirement, such as :c:func:`!gup_fast`). There is
> >> > +   also a special case of page table traversal for non-VMA regions which we
> >>
> >> The "!gup_fast" caught my attention - I was unaware that Sphinx had such
> >> a thing.  Its purpose would be to appear to suppress the generation of the
> >> link that turns the cross reference into a cross reference.
> >>
> >> The MM docs are full of these, do we know why?
> >
> > Removing it from the struct vm_area_struct struct immediately give:
> >
> > /home/lorenzo/kerndev/kernels/mm/Documentation/mm/process_addrs.rst:11: WARNING: Unparseable C cross-reference: 'struct vm_area_struct'
> > Invalid C declaration: Expected identifier in nested name, got keyword: struct [error at 6]
> >   struct vm_area_struct
> >
> > And given C's weirdness with typing I really prefer to be explicit in
> > referencing a struct vs. e.g. a typedef.
>
> That's because the :c:struct: markup doesn't want the word "struct" in
> there.  In this case, the "!" is being used, essentially, to hide the
> fact that the Sphinx markup is being entirely misused here.  You would
> be far better off just saying:
>
>   **struct vm_area_struct**
>
> and avoiding the uglier markup in this case.

I can go change that.

But to repeat - 'given C's weirdness with typing I really prefer to be
explicit in referencing a struct vs. e.g. a typedef.'

I'm not doing this with an intent of Sphix misuse, it's with intent of
being as clear as possible.

>
> Once again, taking out the markup entirely will cause the automarkup
> code to do the right thing, with the proviso that undocumented
> structures (which, tragically, includes struct vm_area_struct) won't be
> marked up in the current implementation.  By far the best solution here
> is to remove all of the markup and add a kerneldoc comment for this
> rather important structure.
>
> > At any rate I'm not sure it's all that useful to cross-reference these?
>
> Why would you *not* want to cross-reference something and make life easier
> for your reader?

Because it apparently requires me to document every function I reference?
Unless I'm missing something?

I may be misunderstanding you.

If not then fine, I can delay this patch, go off and do a 'cleanup' patch
first, that will drop the '!'s and come back to this.

But if I need to document every referenced function that just isn't
feasible for me with my current workload.

Please clarify!

>
> Thanks,
>
> jon
