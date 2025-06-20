Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFD42D29AD
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750433623; cv=fail; b=DOug/FRIJAEAItFaF3hJg51VjluBbFuvdrDw+L+omYZPEvZfKo7P0CllTd0eyB/eAOCILerJ/oFYl7LYkyMs8b51QW9PJ3PxfCAhsTb8iGucOeESQTuCbRvsp8gAc/TmAiaefVzndsVs9tUFTBPCG99FrPLsa5uV4Ln6TNwvScM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750433623; c=relaxed/simple;
	bh=ECroMz4Ko1RygwNec3t4xjnqUxP4m3zcDV6uvwkf058=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n6PEbW83YzzH1IYKy1xGjwt41eDuuhmwRxJc5NGUyf6C1F79yMgJoNNUsZ+P/uvYNvDd8516EE0WKyVEP76npbnvjwAYgum5BumOZC6vq0Cih5n45Dd9gR/+hH7xhauZGhn7uxHkqs1Zycun+GZ8eaijcWT7fjJFOvcyXUdZ57Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=i43Sf6q7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=aWvRKSEC; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="i43Sf6q7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aWvRKSEC"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KEBlLU023317;
	Fri, 20 Jun 2025 15:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=SJhdf6QFs6FVWlb68JWfzs8CrvG1vVvhp42y3/6Tpzc=; b=
	i43Sf6q7NzyjXi4NmVXuznuuKsS6mXW+HtEu9mPr7kt5X0Y3j45OKvHsyBwRVqTU
	1H788qKdMW7sku6MVOc6/ZG8ZFeLGPKeYoZWcPZNnB0rJUkySj2DOympQs63u5J0
	8K2d/nIndRKm76J+OdD4o8Vv5LawGqtIglea30ouNi5oWtwpPTe8IQyB+kFgsYb/
	/JDG1jAifTFJ5+fS/Qj4NSJYAfVVJHGrF3NbIAk4bb6h61itq2kCOQi7IlO4hHd/
	GFCD4znJYBmmDmh1v7z3s0e5Q+xmtC19Q0DUKSe9MwQ5jn8wpgurHoZlxaAlNqlP
	FVekP6h5EX3O5P19FKzQYg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47900f3xrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 15:33:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55KEY1CA009836;
	Fri, 20 Jun 2025 15:33:14 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhkjd24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 15:33:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MGd0a9ql6ign8sBcFXKRBifJD+Xws7rH6cmGNqDC7hmh0hFrBIYVh37vBEZYAZ7SLrM1ZAQnC6K6R0uWl0Pwp7Zo/CK4tQB6/2XQCqwTWz6CTZl+cSwivrGh3eUO+xJCYho4X6qQ1DIHmEEQvRMQOvukicJ5zJCSm2e5S3Kproefo2YDcVhFwrHd1gt0QnoOdi4OwKCavwaB24ScHnmROuQXNq9qNauFcKYLU/X2S0ijFn3TluWB8p7H0qlbz2AzWCdklJmyu+ZV5rE/nZHQfdHMRf2EUfjEutrfamdyEKQYpm7P91ul5LhgiUSNc0bcv0Mzt2/fpo3gXSAq8asADA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJhdf6QFs6FVWlb68JWfzs8CrvG1vVvhp42y3/6Tpzc=;
 b=yd812bSqs3PWDdno568c/4OzlZznQk0VW+mpMX1uMBaN2qVqsXHZrMyI3jZgVzf79WEr9h9q0Q4Swo+EUqjO9gUMp7GeP/n/BDd/u3OSSKhKe27iXj//+g6echye3pBLmXgfG3dOBxMBijcRWNRTIg1gZH9eE/E0mwzUfJwe2/CloSVjDZMBm/SB7aj2ctQg6OkUR2zXfzpt8sGvkIW2rCqgrPk7ii5NolwCMdImHxsKybLVU6epK8aeA08sPCKNcBK6Imhg41ojWdFDRUQlmgRNmktUIpCxIes38Q21U65utQVpEgfIjLoXqqa9T9oo5ABfLXh77XfPdvUgGZMblQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJhdf6QFs6FVWlb68JWfzs8CrvG1vVvhp42y3/6Tpzc=;
 b=aWvRKSECH7aH8iAenfZHuM+DiMKSGvcVMl98/+UN6iaWNAoOS2se58qs9yi9qRTKhkFvRRiTzfD1w6O1qJYP1/uEie/4Dz5RtfOga2sBBIg8Scf1w7iIptdYPqwc9wNL1pqfDZ2CU77ZeAP5hpCYjXWg2OT+do0V3gKK+eiPEII=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SN4PR10MB5591.namprd10.prod.outlook.com (2603:10b6:806:206::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Fri, 20 Jun
 2025 15:33:11 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 15:33:11 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Lance Yang <ioworker0@gmail.com>, SeongJae Park <sj@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>
Subject: [PATCH v2 1/5] mm/madvise: remove the visitor pattern and thread anon_vma state
Date: Fri, 20 Jun 2025 16:33:01 +0100
Message-ID: <c5094bfccb41ecd19d4e9bcaa1c4a11e00158bba.1750433500.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750433500.git.lorenzo.stoakes@oracle.com>
References: <cover.1750433500.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0126.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SN4PR10MB5591:EE_
X-MS-Office365-Filtering-Correlation-Id: f1d25894-dfb6-4c72-c1f1-08ddb00fc3ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Fvljr6YuglZoUAZZZ6umZxfLvXeZ8jZzj62iNMFrWwqJJiPh8bosM+cipavz?=
 =?us-ascii?Q?Ql7/NYIjaKroGuB+AWorIJx1Po33dQ5oPlVD2XbBJlccl0tB6LFx4f9yx9Zc?=
 =?us-ascii?Q?2Gik1Gv3u63NuWLgysDK4+LI60jexV48Fv9ZpfVgSPNjVY1NxmpwRnMOjnR+?=
 =?us-ascii?Q?RNnTANSyzMuNo8Q6UqFuGepgYasHL4pHBRksMDVEivhR5UB1wXahdoQf1p4x?=
 =?us-ascii?Q?qeX7/gZ6hzCmqVMpDq1APM+PVhY3HPqp1KQN60PQESvZV2h5lzX/pQJ49K4v?=
 =?us-ascii?Q?T2cQ6S+Yl4BL6iunNlWolIU4MOZLxCA8068JQG4PCf6yB13QcvpAw1IEorpw?=
 =?us-ascii?Q?esE6KwgLnVlD8vxLMUg+RKiwpgayni0mpD0tz5h2LxJ+Jl9pkfT+hD5xJNGI?=
 =?us-ascii?Q?8xrwa1d+l0v7CcdzfTt4IRdKYJloKCXrqldCLUuOzNAJTFmO98705ogiCctx?=
 =?us-ascii?Q?SlBpkrvs87xKbEC/FgV9Dmx15vPYzMDVU4x6aZaAgmmNnhYjeFtuxOBqmPZk?=
 =?us-ascii?Q?Pyn4Yqq63TPNisiy2E7mPN6dvSyVzgdtBLNAWbciEdxEmCPLwutBJtqNRVfI?=
 =?us-ascii?Q?Fw7iGgKkT3dV8OV0GZpnbWGvkMpn93ilxYiBPVJQiLvM4yLFYcWdchI++rfM?=
 =?us-ascii?Q?msRFs7mF6KlWLPootOBtUc7e15fIBE/bmo/3y9/efp40Holiz1P0ECejnoxX?=
 =?us-ascii?Q?wYerAkgwT9Z6+RgCwaBVgArkWTLpQaDAmnZAke6coq88X0uqrVmNjhjy4+mY?=
 =?us-ascii?Q?LOhc/R23Z/s4J4yn74kAYXbUw2N3CzjJCXZh7BOgoJQg5C8lYQek4ZsHalk7?=
 =?us-ascii?Q?aHnombpisP8xgvjQWoenkSfBtDkFBQipq/F5askKvPZzg8ul9232Fuofn9uZ?=
 =?us-ascii?Q?Xxw9G9E7mGNxKuKJk/UwwLB5Lgm0ZBrxWCmrVL+kU79ozSgYiSJpN1tPTmSN?=
 =?us-ascii?Q?ixYN7Th9pMo7e3+qVJfpq6IUxhmvtP3E10J01Z/M2egz7iGD7OFgt9t0fMlx?=
 =?us-ascii?Q?Nmc7cpxJeEZQ1hFqq5H7/kRii4re22AXFFj+6uhFRKd0tZdW11EWv5WQhEs8?=
 =?us-ascii?Q?yj1Q/RxiFC1z/zyqoUXLqRp1qHxq9RUI+VEd6iu2EEvfD+u4Qmi5fO9DemyN?=
 =?us-ascii?Q?0pJvSsBiM9hZmaYJHvQhoLAbbxbeSl5ajRPP2dnkJOlo6WAZFz9+St7NgScp?=
 =?us-ascii?Q?wANulgsykEJPOkrPoK7M9K+eqASwUbYMVzi/aY5+orgIXiQ7SsFFaHeJ8k1X?=
 =?us-ascii?Q?HMgtalCWckt5Kaf1RZA3q1lSQadS/vLSqkFJ0vCg2K+k0XzOiUldK/aAQtTB?=
 =?us-ascii?Q?96SDmCagOKiq9Sbdfs11sXwhL72y0hyfgjoasxbhBtSIW2fYwSCsnjH8FEQD?=
 =?us-ascii?Q?bX3ciVEQ8j4/FDRlecuQJjoJn5Ys9qpqpo2E+IOza0B+C/phQ0a/k0PTIIG3?=
 =?us-ascii?Q?RHCA1eAz+iQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aLFNa/WprpzLgwgZFs0N0hYRfmF/G48ev7jQO1jssWXsejvTLY9h1o7WDGzk?=
 =?us-ascii?Q?HAvSp3N2s9ZDyEOMCFAmWEzFqym+58UKP1AIrEfjLwj48CqjRkWJj74WvA0B?=
 =?us-ascii?Q?PmG08dxFghkF1lHVi81crl0dECiVt07dHuU3xB0EDCtINHienasJoSO7JDPz?=
 =?us-ascii?Q?2veoZLiqHuZUg14wHWfFk11YKqGgO6rkX8u1QHlD+oRwcjhB758ZnSVX30JC?=
 =?us-ascii?Q?d2SStVgXprLI51SSkOhRtd+QiHWqNxG2+w9qXQdwXbL+0MIlaD6O21hhNlJ2?=
 =?us-ascii?Q?TXmYeGCicuLi7HnTkHjbLu4m6BFYWGVT+I88HNmZ3L1spbqWrIYDSkkdu6TT?=
 =?us-ascii?Q?TfgKqsyKHYsg+Y7lCCfyGy7uBhm0pj52B8waxOoqm5qNGJcWiLqcHwVl1nNR?=
 =?us-ascii?Q?wTLhBH41/FoxevId8VfFvhJ8Dtacn+7NNR/J3qPWwYiCZpYpB8Z6gfnpVUT0?=
 =?us-ascii?Q?REhUjafcuRWREOyaONCJCnYSo3ec5dqbLnVLbHVHmP/tgL0DVMJ97VtZOVBW?=
 =?us-ascii?Q?FcMIWp4thQpSSBOR6Id6/dlth61MO2LfLB4VpsX0a2Dcg1y8AuWUAurb0uIe?=
 =?us-ascii?Q?6prhjZeOhhF079sTlmMtQFWiZ8SD5Fq04mgd9d3X3/XMPvSdSgbphC0OAB4g?=
 =?us-ascii?Q?dZ+6cPGXoCP5tXdiFfYvazEGUCY/WljVU7PhheBZXMD4Kep5JutEB3LdccrN?=
 =?us-ascii?Q?vOLyqJNSxxZjyUY/77hsMLRZ1m6BWaKM7uXpMY2h7AKkYkwtbtIzOD1MjQoa?=
 =?us-ascii?Q?OUKhz5mymacIwuVzC+B2aCM03l1Yk7RW/Ec96r5BRyRcK160hwBSpwS3H8Te?=
 =?us-ascii?Q?OqhRE0B08WZW22JOByoW4ngUndCeQzptFEcYfzVOmx+07ZUaX+TNxG/oO1Ve?=
 =?us-ascii?Q?IfYCl1YbjMKAc0Cx6G31aDMGY9IvJhb7iMQdeK+U54iqV4ag7u9YbkAqWDoe?=
 =?us-ascii?Q?Y4uAs4E5B/7VjgVroTmShec+QrcQBxmd72c5T4EuZvraGKFNCeEqV+ai9jO8?=
 =?us-ascii?Q?B7cVk9WBU9CJJ2CW5co+oArgkJVoTofAJbOXBiPA8sArMLOdWeb0BUWsO8fN?=
 =?us-ascii?Q?TUczXQtWoskxgSO+TeDElWAF6RvF3R1m1W/BnSmLYjoFml6bKmkDDBGRAZxy?=
 =?us-ascii?Q?b5ZXOyGs7YhzviAQClYeKgrfcfLhqzd348EXj4EHS6C4O0zpbfBtZJDGD9Og?=
 =?us-ascii?Q?wy62ZBTAZb4ofnR+SvRKhmhxtx+kc5BgDKqIijPnwLPO9knJNoWBvLhzjXBh?=
 =?us-ascii?Q?f9x1+G3e/thTdPQX9G2HKvkhJmNv2LUUInKf2yry+aqU/FZT6NaO1Q5xAHZm?=
 =?us-ascii?Q?ZIN+/LKALTTebd+K8eShrIcuLayjC14ix8C/hvZSt9EWD7u5YyKs8hvAA31a?=
 =?us-ascii?Q?0l5f0G4dC26E6mMq8vscjaKTvAseTh55/sC85ri8DF+uYcrRF/G+GVjiGGDT?=
 =?us-ascii?Q?kNLCdcgST/CEzJvQlJK3D5FVmCiGO8X40U+vfEpjhczqyDyedo3FO2gatDo5?=
 =?us-ascii?Q?EPOnCfWQ7EcNa4VZdJ0V/+/1EQ7s6tK4JnCMGfGT0o+KPJVIP0a/JZ5PVcYb?=
 =?us-ascii?Q?X9/VZhHTPZbzTCMQj6XB9l9zBQGmJS16J0gZzErCgKxS3FRz6cp2bM9FDn0Z?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CESlupSq4wgXICbvg2yHKqWe93jX47cLHW5HDTH+H2RAGqyqO/qXHS+l3Udf9FMvE8mjOAlp8xtr9P90py8bPApKFREKZHH0jM4FgCriXFVhrEkj7J0pP9NDiYO3rfG7QmShquB7eLKztHJmpzZPzrrj1Ms3XahHNErjIUmoWkVrnFYbi70ndhnK353GZIT1dsvINyrfiiWVAmOUocyGNktB6v94HgZVOomASE8gt1qg9Pc33CkntKyqJmWFFWk+iDoCRmUWPXRamzv4g9P4ccsxClpyqUQR5aX1F0R3gvvv/bXRVZhMN+MW2TnAshqT+9Mr51LAkyhmAGmPOtWpu2/kF1zWbs8PU5KrZMyooVG3ZTuWEQx+mEwt7NbVF2Nv0bRJLCrFI0ofN7/jb8WnDiBZ2w+szdJDfyOEgsGlrE3f2XOpBtDAmEUyBz8JML7ual3KKdVKwRKIutA8yBLrUpTlSauNeL3AHhy99DEVo6tKi2USKGbEncJ2awjwPFrGyHOiv/eiO5SMMkzja8/GGf+fs2jqkUJHI7EZ40Wwpqj2VBa69ey2nr79QHul6QhORC3A1bg30AmHl7k54pZucU0tIVwiajfMmqwkqeselBw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1d25894-dfb6-4c72-c1f1-08ddb00fc3ac
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 15:33:11.2002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qSM+LLccnkxRUITdQWAmT1WFIouBUj1KsEPvq7ZRAZS4NX3cPJMG2j5x4S+Z4AdG4gpfuNZk9WGF77aB9Aco7GzRxzgnnuBX4dXdHlarxcA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5591
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506200110
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDExMSBTYWx0ZWRfX2crGuU1HW+59 AnvqmfB8ERMyZn29VICYK/shFzviigiuxAFUzZAKpmGwbATsfRKWGMI1ZW4DroU04CrUSeGRohr vywunZvS88Q8DMTEdtYHeNs0A3CBpw9qa09I2zo2TgCgTbFwBewcqwrgB/8ouDOsC19ZXvFp+oU
 ytbqc8KHCaysJoTQ5LtipzhgNTg9TWUiAEyRf+BDCEsfhWPNoUrmQzgRa5ofn5QTjU/o58QqVgj BcTRwITg4y6HvWG5lPdYzaWGiI9eg4WcSw5dKXPucCT5o9/MNvgbGRE5joper0KglTg2hXgAhAn 1wS0dw4G3tjVgc4xGREDftRi2Lp3w9EKP5Y/fKbs1tdNXy1RBqyzbfjb02Kn91q1E6ey8EA7tTW
 MGdw9f3SMVnxq/yFOeak6YStrWxvRgynIIOizxUQaQy+vIRXx2pQS0vgpmYa2BCQBnULT6Sl
X-Proofpoint-ORIG-GUID: JR9ZsLF24DlSZ2gJu_t1ry9Q_wZZ-xdi
X-Authority-Analysis: v=2.4 cv=X/5SKHTe c=1 sm=1 tr=0 ts=68557f3b b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=ATqnVohNJs7nKIk7dY0A:9 cc=ntf awl=host:14714
X-Proofpoint-GUID: JR9ZsLF24DlSZ2gJu_t1ry9Q_wZZ-xdi

Now we have the madvise_behavior helper struct we no longer need to mess
around with void* pointers in order to propagate anon_vma_name, and this
means we can get rid of the confusing and inconsistent visitor pattern
implementation in madvise_vma_anon_name().

This means we now have a single state object that threads through most of
madvise()'s logic and a single code path which executes the majority of
madvise() behaviour (we maintain separate logic for failure injection and
memory population for the time being).

We are able to remove the visitor pattern by handling the anon_vma_name
setting logic via an internal madvise flag - __MADV_SET_ANON_VMA_NAME. This
uses a negative value so it isn't reasonable that we will ever add this as
a UAPI flag.

Additionally, the madvise_behavior_valid() check ensures that
user-specified behaviours are strictly only those we permit which, of
course, this flag will be excluded from.

We are able to propagate the anon_vma_name object through use of the
madvise_behavior helper struct.

Doing this results in a can_modify_vma_madv() check for anonymous VMA name
changes, however this will cause no issues as this operation is not
prohibited.

We can also then reuse more code and drop the redundant
madvise_vma_anon_name() function altogether.

Additionally separate out behaviours that update VMAs from those that do
not.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 mm/madvise.c | 166 +++++++++++++++++++++++++--------------------------
 1 file changed, 83 insertions(+), 83 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 070132f9842b..93837b980cc2 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -37,6 +37,8 @@
 #include "internal.h"
 #include "swap.h"
 
+#define __MADV_SET_ANON_VMA_NAME (-1)
+
 /*
  * Maximum number of attempts we make to install guard pages before we give up
  * and return -ERESTARTNOINTR to have userspace try again.
@@ -59,9 +61,13 @@ struct madvise_behavior {
 	int behavior;
 	struct mmu_gather *tlb;
 	enum madvise_lock_mode lock_mode;
+	struct anon_vma_name *anon_name;
 };
 
 #ifdef CONFIG_ANON_VMA_NAME
+static int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
+		unsigned long end, struct madvise_behavior *madv_behavior);
+
 struct anon_vma_name *anon_vma_name_alloc(const char *name)
 {
 	struct anon_vma_name *anon_name;
@@ -112,6 +118,35 @@ static int replace_anon_vma_name(struct vm_area_struct *vma,
 
 	return 0;
 }
+
+int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
+			  unsigned long len_in, struct anon_vma_name *anon_name)
+{
+	unsigned long end;
+	unsigned long len;
+	struct madvise_behavior madv_behavior = {
+		.behavior = __MADV_SET_ANON_VMA_NAME,
+		.lock_mode = MADVISE_MMAP_WRITE_LOCK,
+		.anon_name = anon_name,
+	};
+
+	if (start & ~PAGE_MASK)
+		return -EINVAL;
+	len = (len_in + ~PAGE_MASK) & PAGE_MASK;
+
+	/* Check to see whether len was rounded up from small -ve to zero */
+	if (len_in && !len)
+		return -EINVAL;
+
+	end = start + len;
+	if (end < start)
+		return -EINVAL;
+
+	if (end == start)
+		return 0;
+
+	return madvise_walk_vmas(mm, start, end, &madv_behavior);
+}
 #else /* CONFIG_ANON_VMA_NAME */
 static int replace_anon_vma_name(struct vm_area_struct *vma,
 				 struct anon_vma_name *anon_name)
@@ -1252,13 +1287,13 @@ static long madvise_guard_remove(struct vm_area_struct *vma,
 static int madvise_vma_behavior(struct vm_area_struct *vma,
 				struct vm_area_struct **prev,
 				unsigned long start, unsigned long end,
-				void *behavior_arg)
+				struct madvise_behavior *madv_behavior)
 {
-	struct madvise_behavior *arg = behavior_arg;
-	int behavior = arg->behavior;
-	int error;
-	struct anon_vma_name *anon_name;
+	int behavior = madv_behavior->behavior;
+	struct anon_vma_name *anon_name = madv_behavior->anon_name;
 	vm_flags_t new_flags = vma->vm_flags;
+	bool set_new_anon_name = behavior == __MADV_SET_ANON_VMA_NAME;
+	int error;
 
 	if (unlikely(!can_modify_vma_madv(vma, behavior)))
 		return -EPERM;
@@ -1275,7 +1310,17 @@ static int madvise_vma_behavior(struct vm_area_struct *vma,
 	case MADV_FREE:
 	case MADV_DONTNEED:
 	case MADV_DONTNEED_LOCKED:
-		return madvise_dontneed_free(vma, prev, start, end, arg);
+		return madvise_dontneed_free(vma, prev, start, end,
+					     madv_behavior);
+	case MADV_COLLAPSE:
+		return madvise_collapse(vma, prev, start, end);
+	case MADV_GUARD_INSTALL:
+		return madvise_guard_install(vma, prev, start, end);
+	case MADV_GUARD_REMOVE:
+		return madvise_guard_remove(vma, prev, start, end);
+
+	/* The below behaviours update VMAs via madvise_update_vma(). */
+
 	case MADV_NORMAL:
 		new_flags = new_flags & ~VM_RAND_READ & ~VM_SEQ_READ;
 		break;
@@ -1325,21 +1370,29 @@ static int madvise_vma_behavior(struct vm_area_struct *vma,
 		if (error)
 			goto out;
 		break;
-	case MADV_COLLAPSE:
-		return madvise_collapse(vma, prev, start, end);
-	case MADV_GUARD_INSTALL:
-		return madvise_guard_install(vma, prev, start, end);
-	case MADV_GUARD_REMOVE:
-		return madvise_guard_remove(vma, prev, start, end);
+	case __MADV_SET_ANON_VMA_NAME:
+		/* Only anonymous mappings can be named */
+		if (vma->vm_file && !vma_is_anon_shmem(vma))
+			return -EBADF;
+		break;
 	}
 
 	/* We cannot provide prev in this lock mode. */
-	VM_WARN_ON_ONCE(arg->lock_mode == MADVISE_VMA_READ_LOCK);
-	anon_name = anon_vma_name(vma);
-	anon_vma_name_get(anon_name);
+	VM_WARN_ON_ONCE(madv_behavior->lock_mode == MADVISE_VMA_READ_LOCK);
+
+	/*
+	 * madvise_update_vma() might cause a VMA merge which could put an
+	 * anon_vma_name, so we must hold an additional reference on the
+	 * anon_vma_name so it doesn't disappear from under us.
+	 */
+	if (!set_new_anon_name) {
+		anon_name = anon_vma_name(vma);
+		anon_vma_name_get(anon_name);
+	}
 	error = madvise_update_vma(vma, prev, start, end, new_flags,
 				   anon_name);
-	anon_vma_name_put(anon_name);
+	if (!set_new_anon_name)
+		anon_vma_name_put(anon_name);
 
 out:
 	/*
@@ -1523,20 +1576,17 @@ static struct vm_area_struct *try_vma_read_lock(struct mm_struct *mm,
 }
 
 /*
- * Walk the vmas in range [start,end), and call the visit function on each one.
- * The visit function will get start and end parameters that cover the overlap
- * between the current vma and the original range.  Any unmapped regions in the
- * original range will result in this function returning -ENOMEM while still
- * calling the visit function on all of the existing vmas in the range.
- * Must be called with the mmap_lock held for reading or writing.
+ * Walk the vmas in range [start,end), and call the madvise_vma_behavior
+ * function on each one.  The function will get start and end parameters that
+ * cover the overlap between the current vma and the original range.  Any
+ * unmapped regions in the original range will result in this function returning
+ * -ENOMEM while still calling the madvise_vma_behavior function on all of the
+ * existing vmas in the range.  Must be called with the mmap_lock held for
+ * reading or writing.
  */
 static
 int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
-		      unsigned long end, struct madvise_behavior *madv_behavior,
-		      void *arg,
-		      int (*visit)(struct vm_area_struct *vma,
-				   struct vm_area_struct **prev, unsigned long start,
-				   unsigned long end, void *arg))
+		      unsigned long end, struct madvise_behavior *madv_behavior)
 {
 	struct vm_area_struct *vma;
 	struct vm_area_struct *prev;
@@ -1548,11 +1598,12 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
 	 * If VMA read lock is supported, apply madvise to a single VMA
 	 * tentatively, avoiding walking VMAs.
 	 */
-	if (madv_behavior && madv_behavior->lock_mode == MADVISE_VMA_READ_LOCK) {
+	if (madv_behavior->lock_mode == MADVISE_VMA_READ_LOCK) {
 		vma = try_vma_read_lock(mm, madv_behavior, start, end);
 		if (vma) {
 			prev = vma;
-			error = visit(vma, &prev, start, end, arg);
+			error = madvise_vma_behavior(vma, &prev, start, end,
+						     madv_behavior);
 			vma_end_read(vma);
 			return error;
 		}
@@ -1586,7 +1637,8 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
 			tmp = end;
 
 		/* Here vma->vm_start <= start < tmp <= (end|vma->vm_end). */
-		error = visit(vma, &prev, start, tmp, arg);
+		error = madvise_vma_behavior(vma, &prev, start, tmp,
+					     madv_behavior);
 		if (error)
 			return error;
 		start = tmp;
@@ -1603,57 +1655,6 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
 	return unmapped_error;
 }
 
-#ifdef CONFIG_ANON_VMA_NAME
-static int madvise_vma_anon_name(struct vm_area_struct *vma,
-				 struct vm_area_struct **prev,
-				 unsigned long start, unsigned long end,
-				 void *anon_name)
-{
-	int error;
-
-	/* Only anonymous mappings can be named */
-	if (vma->vm_file && !vma_is_anon_shmem(vma))
-		return -EBADF;
-
-	error = madvise_update_vma(vma, prev, start, end, vma->vm_flags,
-				   anon_name);
-
-	/*
-	 * madvise() returns EAGAIN if kernel resources, such as
-	 * slab, are temporarily unavailable.
-	 */
-	if (error == -ENOMEM)
-		error = -EAGAIN;
-	return error;
-}
-
-int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
-			  unsigned long len_in, struct anon_vma_name *anon_name)
-{
-	unsigned long end;
-	unsigned long len;
-
-	if (start & ~PAGE_MASK)
-		return -EINVAL;
-	len = (len_in + ~PAGE_MASK) & PAGE_MASK;
-
-	/* Check to see whether len was rounded up from small -ve to zero */
-	if (len_in && !len)
-		return -EINVAL;
-
-	end = start + len;
-	if (end < start)
-		return -EINVAL;
-
-	if (end == start)
-		return 0;
-
-	return madvise_walk_vmas(mm, start, end, NULL, anon_name,
-				 madvise_vma_anon_name);
-}
-#endif /* CONFIG_ANON_VMA_NAME */
-
-
 /*
  * Any behaviour which results in changes to the vma->vm_flags needs to
  * take mmap_lock for writing. Others, which simply traverse vmas, need
@@ -1845,8 +1846,7 @@ static int madvise_do_behavior(struct mm_struct *mm,
 	if (is_madvise_populate(behavior))
 		error = madvise_populate(mm, start, end, behavior);
 	else
-		error = madvise_walk_vmas(mm, start, end, madv_behavior,
-				madv_behavior, madvise_vma_behavior);
+		error = madvise_walk_vmas(mm, start, end, madv_behavior);
 	blk_finish_plug(&plug);
 	return error;
 }
-- 
2.49.0

