Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666B915CD74
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359928; cv=fail; b=icv3g1hAo4swLJ7nq0/ukHMAfF4/bTxXReLmJ6baMI1fQkKjQBIbnS0mgyQG33yMxoxcthOyNqK0X2pKDNCg9NqAfIrqYYnZ6CRHD/nvQX5YsSdeNbjrUAmb8aAkU7LqhdvPzFy7e/EEmLtDwFY3TlihjCH/mGKqHS2OsRj9aoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359928; c=relaxed/simple;
	bh=w4NZfgY3ZpCfkjGDsfzDaXyxdgW80fpnF5yZXja2QNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VBQH4L5q5x+s2LuibZBi8gemWVxt3kaZFFENeObwqT7x9trTs13r6iezjqoMHxTvxDMIXFxh/7lDBHMV9A8KJjxIV09RCRrakTZnz7rFPbK5aFAeo7wVM5TXbszN0Q005cB9YKKAtNOUgYdpGRFa8ahi/3w+lTaPy6m1Ua2U85o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=O6Pk/b9D; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RiMdVoRf; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="O6Pk/b9D";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RiMdVoRf"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5611NCk2009515;
	Tue, 1 Jul 2025 08:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=w4NZfgY3ZpCfkjGDsf
	zDaXyxdgW80fpnF5yZXja2QNA=; b=O6Pk/b9DPhzHL3dm2VW+R0bRh2R+LTDt3T
	glQqZQkU0R0/hZii5p3yzLdrKqQdQDCYGcL2I2Y9Y9uZcW+bO6bH1GOsjcEHFlkh
	M4ZpJBOKWRmXcXzD+/e1jBKBVmyhIbXc/gypkjrL2eC4ngyZP3V+wG4do3EhEw/x
	G5+Ze/JiXPmk4f+grdsFaycfw673AkxlQ4QG+peR6UWv8/m8C6NZ9bRImaTRPfa2
	5pzHTSN8ETE0QUtr/nGqaOBTPTwlkznHg8LTuslAK7Auq8n6GYg5GpmVHHZlSlCR
	Qir3jtI0tzWUAaqUPP8boLLqlUoAkhS+2sxtoMukmxANtolYW6yw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j766ca9n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 08:51:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5617542F017487;
	Tue, 1 Jul 2025 08:51:34 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47jy1e7kf5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 08:51:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KCaq0eyCk9VisA90I6xGIzgzEJFDBFShRT5BcaMeCgJOEplaKY6NIm6YiT9rERv4FcRuE0CzzN6wRTWRlFkmlgKSxA46a6ocKSCNmkHclZs54h23/VhwGiLU63pgvUz9S3iL0TIQ3Kxbq6u4t4Nx7QN4RnlgkXNwjmAoJ9IheBLMMDPYz+2iOVW6azN/uIz5DIjyRUkRJgi6p99WCO/S5IsvjrS9+UNYQAYARsPRjYL5/KtHbi+PgVMLsW6gEC2g1UDvksx+vqbgElcaoiyMbj0fssfT+6YbrhaMAf6sRqv8ToiGP4l/xggrrD5u/YZix8nI/QX7P5Fa2PpYEvuKLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w4NZfgY3ZpCfkjGDsfzDaXyxdgW80fpnF5yZXja2QNA=;
 b=FAGNA3rmWbzhIPxKSgt6ih5D+c+lecUlilzrZhaQfqj3zmaUUc9iGoOY1M4NZCGJRAA7wqwAjO3KmFjO60wjuc37S6mY+M8P0nkBIDG/cFWvuRQXnCgOM+PCSaEEUZV2SYg1Fes9+RN9Y44NUYfI2L8be/rpFAc//rdXhs36z4OCkGir426AliNS7xt1/OrHpUruMVddTj1xlD7wgZ5WYow1B4zympL5wuPrmie6jGS2yZctK34O4x/OUSIvuPZQd9/XUxxfPqRGQVl/xbOczrPXSZ4k0bz/0b1knO3Z15hJ/TFhuzqiHHCRCnqNZmashLIhXAIl6sIAhaWFQaQoxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w4NZfgY3ZpCfkjGDsfzDaXyxdgW80fpnF5yZXja2QNA=;
 b=RiMdVoRfvJgifUSnN/b0H1VBTKTFAU8Nz8NNizF4HBuEEH/bAouQJxC91TfpKU7zj1LWW0460ibR4XbV3bcEDlryw0QdDUOiMtVKaebhP+tsYcdeZFaYrllh/GXp1NHjkPczDP5XZ/8TfJjbrhqL2qFnPrt1dxaelnKu3ra2Cig=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM4PR10MB6039.namprd10.prod.outlook.com (2603:10b6:8:b7::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.19; Tue, 1 Jul 2025 08:51:29 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 08:51:29 +0000
Date: Tue, 1 Jul 2025 09:51:26 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, david@redhat.com,
        willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
        vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
        peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
        baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
        christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
        linux-arm-kernel@lists.infradead.org, hughd@google.com,
        yang@os.amperecomputing.com, ziy@nvidia.com
Subject: Re: [PATCH v4 3/4] mm: Optimize mprotect() by PTE-batching
Message-ID: <64c2ec85-87ed-4793-b0e9-a68eac1a8020@lucifer.local>
References: <20250628113435.46678-1-dev.jain@arm.com>
 <20250628113435.46678-4-dev.jain@arm.com>
 <0315c016-d707-42b9-8038-7a2d5e4387f6@lucifer.local>
 <ec2c3f60-43e9-47d9-9058-49d608845200@arm.com>
 <5900e978-6349-4a3d-a384-758889b678a0@lucifer.local>
 <3776ac82-4cd5-41e7-9b96-137a1ae6f473@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3776ac82-4cd5-41e7-9b96-137a1ae6f473@arm.com>
X-ClientProxiedBy: LO4P123CA0682.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::7) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM4PR10MB6039:EE_
X-MS-Office365-Filtering-Correlation-Id: b4330b6d-6763-42fc-d4a8-08ddb87c789d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?n4vBLOExP4xPHSwk+FuWEKyhF8aOrkz+NZVtn6SUrarwHVfYVKGhLXGaI4ce?=
 =?us-ascii?Q?hGldK43zsnWnyaWZ21zbkYgHIkAOgb5vcGxGfABaZbxWEKzKOmbM8gpUiggz?=
 =?us-ascii?Q?1aiifgr1oQTur+NesFdE+5vhLgZWzCE/lU94i0HMDgItrv7gxai4rnuL0yHK?=
 =?us-ascii?Q?+R3X1XcgEQCBvwLeSd9/8OeeY8u59fauSpBAcJJw7Sd9lt0sWNdZaZ9mJ+Zo?=
 =?us-ascii?Q?NF+Do/IP/8kaN8SLy598ffNILxaVasOfTbeW95DbRAAB+4TCfbKjU/WLWmXm?=
 =?us-ascii?Q?xMwoWQPnlJhHDIRe5lld6ncquT95HNQjRwe77N6yBtGAcgRvtE423LvEXeMf?=
 =?us-ascii?Q?T9ZZd9RvtOVMI8iaN1hWZzkQJ+teovSGdthrzIazgI05n4uF3VIbSn2QUcQA?=
 =?us-ascii?Q?VSgGt9ClSytXNJ0sYNaswZT/mDKCN6fcUN7rMvhoE+hCu4QK4VsI6u8OBYHg?=
 =?us-ascii?Q?LgJL0+ZjgNNXAxdU9ffsaO0PRNw4HEXi7ZpowsCS2f56bjGevReT+FAS9hL9?=
 =?us-ascii?Q?X/lCNpcwPhMHytpp4EVca0ybssClch8DbSrP3bpPN059lxdEBiwpc2SgiZxq?=
 =?us-ascii?Q?S51UTXBc5rwhlhSra3AoCcZFZbs/ftwjkpIKihi2zbyqCFmQj5YOu1x8H2Pm?=
 =?us-ascii?Q?YJDQ4DRoZUsr+q1F3NhzxFmcBkYLUmzFLhyNVd6mVh0LiblGIJ4FJrSTgz1p?=
 =?us-ascii?Q?W0nMG1BO4i36lVM+wA+/78mWEC3qI6u/jbdTpC6drvJdSkj7gxmW+k5LvY8X?=
 =?us-ascii?Q?ZQx/n9SfAOe3xH5P8d92hVyPSmUjWVc1peC34V8Oj4fqLgwNjX58uvIRCrDe?=
 =?us-ascii?Q?rjkPpT/fjajnqCU1utNrZJJrYwoXrwPQY42oDa3r3u0U/sd3+xKlWAVGoJca?=
 =?us-ascii?Q?/F/sKH1xhoyuvF489vcGJQjhrBWIUkkAEHBacksKzx1iY3fPen72Z0koD4WJ?=
 =?us-ascii?Q?Fle/H1stSpN3OEUIIF6CR4IPdXPALjFIThSW8Js9IPJIp9WhbtSnvhngJvNn?=
 =?us-ascii?Q?rzIzbYlOE1hoEsPDqrp8Kuog++EPp7GRwvLXGN/aj8v1qWHEg40V7WbxwY1W?=
 =?us-ascii?Q?utIL/Q6T6rWt/wAzXdntmQEJ9yaKJfDVDqbk46KULmE7m0A61ecrdJfJTuqW?=
 =?us-ascii?Q?fNpFC7hDBCvwsQKKI2Ct07h5qJ4fDgvg6ypcI1uLog9x8oTIkNvj4kUzD46R?=
 =?us-ascii?Q?9OW1n4hjskpHITRdTfkHx0xa4dKaeQcK6M/Wb4dTn25q7Aty0ejJlmK1Nc3+?=
 =?us-ascii?Q?pTmjzm85us6eCP3l+lp9ALhCtbp7ptwHxear1t/H6I96dt1gP+vpgkjJQzz8?=
 =?us-ascii?Q?juRxIgx+n2N5+sS9HXKZzf3ci2qaQFUC35PoWgGbFtEYeLU7Epiz8v3gUWJS?=
 =?us-ascii?Q?nC19OH5nSM9Op5bBg4OzqzcShcuuFL+ROkmYxX/hs1gRvC8MIZZv6U/UaBEK?=
 =?us-ascii?Q?X7zPhaEJZpM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UvjO/1ouBbskyWlBlc4vy0Vx1cPMY9ho7nzSuGb9KySRvnifb9TVyZ1TlnEN?=
 =?us-ascii?Q?Cuuo6EfSsgMdpEkwicbgyC4csYoeip9Ua06WrPgZk72mi/5E76muk2CcopsF?=
 =?us-ascii?Q?5hu9uAw/Nkc11Dh+qiEY6KiH/9jNh8ouul2u5MG1bXhtuRkb8fJJ3X1Uw1do?=
 =?us-ascii?Q?PizUoNQ4q3BK12KcTJVlmsjd4mKbTpENoh/mhkczla92hSO0RGwUa0K45G6V?=
 =?us-ascii?Q?wrf+2q99UvLSbviTwiUfUEXYUuiyh/W8Gorb+er6ig8zKG4WzYmdxRMkM/XM?=
 =?us-ascii?Q?cUVVKMHJxe9lmfFx5+NL5DguRE5orxT/MJKM164lu/5BsnGzQMae8oAvBGeG?=
 =?us-ascii?Q?GUgoGSKQLuqb6ZrKuZLygbiYYG9DUuwf9KkA/zxU18Dx5+6sINimEtMJB2hR?=
 =?us-ascii?Q?iTuNMA0cKWaEJskkT8PuOeTvYtoi+X8isJ5VsdmjZK/An60sZoBXYaKQx/hY?=
 =?us-ascii?Q?Cn4E0VFsaSTSKj3kmuVaIcP4ZwiUflj9szZisd9L2mwQMljHhrpHiC3b0wYr?=
 =?us-ascii?Q?GLSVo+vl0WOYcTWPy/HObcCbJ/VPm0Y4f1x6PEk0haEFjgzYjZi7JTvs/S9u?=
 =?us-ascii?Q?qETw04YsNCPW6pAoKCRO9YK057iVWwB9qGDmxSaF/pBs/KMxOfrvVnMus81V?=
 =?us-ascii?Q?ZOdRZnmhN+K90B5gHITMlntqye8Xsrff5jsHHQ008tTl8fVHg4GUbPGSGmDq?=
 =?us-ascii?Q?Du3gxpDnaWsh8GbcdE+USJsoVN2yUpzQDPcJgaEv5JB5vqjVlPogFibXcXIH?=
 =?us-ascii?Q?AKXtEsHJ2EQKhH1yH0QxuJoRw25ZGLbF2UwmnOmZ6Mi0rfV2pU1KkL1Dg+1x?=
 =?us-ascii?Q?x1mZ4Q6h9FVXGKyJ3dxravvs+IBTrAHhNDDrifyC8lfqdxlQH/UEXbRjw9WX?=
 =?us-ascii?Q?zyOKcgKaDtLY8Rz+ObP+fa3o8XeBk2MRWGj7Tqu3iegZBoqxwN5B9n5VD5H3?=
 =?us-ascii?Q?VnXSkSMidC7au10tCakCr1lN70+zdP+CNvhmQ04Xp7D09cl5lclSQ4v9yz1k?=
 =?us-ascii?Q?7wekl70iUCeVxyOh63Yu26n+bYc5CPHscFPSMufy/vvRJ86RK0Fb1Yv2sMNP?=
 =?us-ascii?Q?8Sq+5/AxZlOBF9vjHApOI9MgD3InjDK+E5M1YKD7IPvD22ANjjn97ePpM3SY?=
 =?us-ascii?Q?Ta6lPyTocH/LYy1k7uMokkS7Ah8Su3vDb+cyeU+HvMVyOCrEuQI/FlqNXUpJ?=
 =?us-ascii?Q?8uyvgfvsjVo4HVQCshs6k64193s2PrrhD6tChylktOqMQ8KBScvprxs4rqPY?=
 =?us-ascii?Q?LRB75eGd73pShyHDkLfxKsC/ysFtTFfj9ouaHlJ/TQVWy6jyODhsdNkdIXe0?=
 =?us-ascii?Q?NVEXs2nMwM19eE3gUtf8cYklCBg9SvhWNgTvnX20xYCRSHsC42JarZXWoSZo?=
 =?us-ascii?Q?bmNuZUzRkHCVqPLSebJcv+iakc/9j70EltkPEW51P2BUmxeqSSnQEOIp1K6Y?=
 =?us-ascii?Q?XhKgbqWoPh5YhdD9GoqSqf5snrbqFDY2esLfwJ8h7igvmNWYBF801L3k/Km9?=
 =?us-ascii?Q?Ht1R3KiB9P4pT4QncV2/WAY0UYYPvsU0woiGnNW3s/YZBzAdZOROTTfOL9ep?=
 =?us-ascii?Q?K8ea7Fr1q+Qdvg8gXNYhvEqqHEC+zLeiGpBqCN0NH7M3cAFHmO8u6Wo3wXNV?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	C3voH5NLK2GpooGZF+LM3O/FzWddLSDmXYXoQBhLHlZ9Ev0F7b0Gy/5K7Z8ERV0As08/rWB4JQBNN4Z3vr0vWwnaDRpGXRsWw3Ou1ib4pG6HG6/ZbOWVjjvWR3Fw9zqB2PVTMOXyn7HpFQmn5X0wLY4/GOCS3XK2j1/2hwmB0KIzEH/EMRuN6gQ4dFLVSiwSZ1SnKdN/qI2DSzGrltZgxawST4cwi+yyWRKHC1Gbiwlp4pXU53V5krtBSe88X6sdvaNk5OnBGtTws32nACgr2CpCLao/jqjE1eZRNGmoK8A+slbCplSfDjIr1mii+QyWjLZStyR/9F977QAKPmkltcLSB6KUCAl4PoNMXoCMpZXguWjJwQFGJIlDlx/eqlFaEUlTFXYA66luipawpZx+dCV5VMFXT11/ONUIZWEy/WBCmb2WbxSv6i2/ZKnxAE+wy4RDgldKGccOjts8QrkZMsFhRii+MIEI6qhk8s6vh3tLUVOoNkZeY+cn1VMDnfVMzeyG4AEQI1boslBK5nBjGfIGj8ZsOuk+sIxfv5EhQ/+EnVUD3R4kcSmZUusryf0UIbmhuVAbxSoPKJJQJ5cOT7a22halQrqJQwC1VURkhn4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4330b6d-6763-42fc-d4a8-08ddb87c789d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 08:51:29.6164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7LaMjslnm5S8YMvfOY8H9y/l7o4BWWE9r+UeiOfP2q9ngIaAtnCd5w/g0t6H7G6BCczdzLk/nHl/eYQbccAlksHIBybKEmLQSEsEUV6Ox18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6039
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507010051
X-Proofpoint-GUID: Yl3G4W3TFh2E2y8QXO6sqa3zkFvgeDFI
X-Proofpoint-ORIG-GUID: Yl3G4W3TFh2E2y8QXO6sqa3zkFvgeDFI
X-Authority-Analysis: v=2.4 cv=b82y4sGx c=1 sm=1 tr=0 ts=6863a197 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=ZmlBPHrp7NTkakYfUGAA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13216
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA1MSBTYWx0ZWRfX+QmjLS/JVmiP AoyY/1pIYSL2qw2QZMnWhodOU9AiDx8N9X+QM5bAuqJw846GUDbJqm0O7bgUarngbeLT1lBNMvS Lejwvl3rxgV0A/DfXe+T/p8nmhSXdzjHOoZLdgSRmj3VfZvVQbSjeVTwCihiF0tGAIX1kEV2rRm
 MPWVGw37RJoEabs3ePE1zW4zIemhpqiB8/h4mJNsfRUrJhsdYIy2vSki3RP5paCvblxnA6Z8CXD w7Q3+HKPonF6D/d17UvrfX7jnuYBneRV6bWOWj8pVcU8/uC9fZcnQ1M2uIpRNqD7jZ5K78vtowM KyD/NduR1Nwh3YGRw/bo1wQrTgT/2vOtt8q5tDX93pC6lQSZeS/Yu/eMNtK+20m68Q/+2ml9cU0
 jYUMzs5eWSjhfJL0K+edEv+qs+kFcCx3SBF86Opmeulq3k6lEN1bjS/sIEALeeCYU6+WBOKC

On Tue, Jul 01, 2025 at 09:30:51AM +0100, Ryan Roberts wrote:
> >> In an ideal world we would flatten and just have mprotect_folio_pte_batch()
> >> return the batch size considering all the relevant PTE bits AND the
> >> AnonExclusive bit on the pages. IIRC one of Dev's earlier versions modified the
> >> core folio_pte_batch() function to also look at the AnonExclusive bit, but I
> >> really disliked changing that core function (I think others did too?).
> >
> > Yeah let's not change the core function.
> >
> > My suggestion is to have mprotect_folio_pte_batch() do this.
> >
> >>
> >> So barring that approach, we are really only left with the batch and sub-batch
> >> approach - although, yes, it could be abstracted more. We could maintain a
> >> context struct that persists across all calls to mprotect_folio_pte_batch() and
> >> it can use that to keep it's state to remember if we are in the middle of a
> >> sub-batch and decide either to call folio_pte_batch() to get a new batch, or
> >> call anon_exclusive_batch() to get the next sub-batch within the current batch.
> >> But that started to feel overly abstracted to me.
> >
> > Having this nested batch/sub-batch loop really feels worse. You just get lost in
> > the complexity here very easily.
> >
> > But i"m also not sure we need to maintain _that_ much state?
> >
> > We're already looping over all of the PTEs here, so abstracting _the entire
> > loop_ and all the sub-batch stuff to another function, that is
> > mprotect_folio_pte_batch() I think sensibly, so it handles this for you makes a
> > ton of sense.
>
> So effectively turn mprotect_folio_pte_batch() into an iterator; have a struct
> and a funtion to init the struct for the the number of ptes we want to iterate
> over, then a per iteration function that progressively returns batches?

Is that really necessary though?

Idea is that mprotect_folio_pte_batch() returns the nr_ptes _taking into account
the PAE stuff_.

Would this break anything?

We might need to pass a flag to say 'don't account for this' for prot numa case.

>
> Then we just have a simple loop here that gets the next batch and processes it?
