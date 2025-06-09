Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A302325C6F3
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 13:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749475734; cv=fail; b=EWmGG2CLzL6OmJuBnrqj+BdGn+xsNBK1Vq1eOdxHAZNqQkexkE9RbTTGhCfOUDj5rLoeY1YxSHGkwWpijDS5nUHBnTo6ck04ZFacAcfUIYzqGIJDElFbtNKV471cE43ZjgmJoKucYgk6JGuf4lLyTfLMcB26myp/Ss/bDfHKUG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749475734; c=relaxed/simple;
	bh=teh+pp+DZHC/mSogWyf+96TF5iJWTCOcIy9pWNrQm6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZISCLt5b1+FdJy2Ky7Jgt8KufeTCe4bhALOi/5Hm8fbh+x5euJsmSHvZZWiPIM7+4TrtzqxQ841XPuDxvYFyV08AGmHLFj9qIXK/5VEax67AfC5Ia/s7pYig52zKKBTadft8WUn70AbgHQI81aMPVGb0OAj7qECvj4ketk+MXy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Rb2xQXc5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XaBLgZLS; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Rb2xQXc5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XaBLgZLS"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5593jmGr013108;
	Mon, 9 Jun 2025 13:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=qenLDOfPapKT2/6yOEYVy7rqLND9VyacXUr+STyU4jg=; b=
	Rb2xQXc5n6w8OX+mOWP/doD/7BuvV+PATAZ20mP33Y08govYOGqI4463yMSPZu46
	EGIuVdVamucDWTpe+0KpJJ3bbgMGaLIWrIOU8sNxeEiOPDSThpUO2U9oB/Y/tWMg
	pTmB7DTL1Hc6t6RREGs9xzoXk+pBKTOXxC7kJ3PMaj236vnADwoQex7hKgmA01W8
	oyOM8HXyROvthTKhLC1C0MkWEgxIXEuvfJkeLctgWYOGPF7INK0/Y5E+ohbtBn/S
	1VGwF/XIGc346eFR3+zNb8fWsLTr7873LjwLgNKrrfrr1Gx1k8/NI7b7zABKYZGv
	L9kp6a43klKXfilRaFna+g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474buf24yh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 13:27:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 559CAUJa021320;
	Mon, 9 Jun 2025 13:27:27 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv85t7q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 13:27:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xay2ihQMhxxYjKQXekIiEyp7cl5WweDEhPhPs7/yVLUcDqLSgdOUwc+2iVk6kJ5cMXW2OPckOSNiHlUMqOUJPPYeFkGCPjMpIuh3XIwTZUXuYZJQjVWy0abYFx9US4M0t6VB1fhVh+WRM0oXEOpJ30ZxIUIi2AeSppQgyxi1ffC+fPTe7E/YXROAVUlzZCg321P80Ujf6Soxzd4SZnC6l6phD9yzkAl+6dOmL+pStuUQe64+qVy0idiiSylzHXhMvkNviTSBqOoqevBX4Zkorw5TSBIQXydne3NW7EY+x177evaH6XjHUTkb569Z8HuXjE1nzWiTqHWlRic/BTn8rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qenLDOfPapKT2/6yOEYVy7rqLND9VyacXUr+STyU4jg=;
 b=D7ZdlQjVAZCFYPegvdScvCtr6cNLLCIH1BMCu8So848PA4e6ys3lcSkm7expm5coiqLb19TdTUYC1txeHXvXvFSJYdqFLoyxuKDk/H/DySiMvwolHZkz4/ZgCYxsn8wja1y5d5sxmJb1EkwQ/i5svPQO0UgeuSapoQ3LZvr/iYR9SgIi2ZCY+R+M3VEeZVQVWgAtDKrUm5st1Z0yBZ0bO2WCWMpuRVD0kMkj6B45U+InfhccAB8lZnfO+R04RFpd+gwkEAgR+9rbPjqgtP2MqtRABdR7UG1EwmtVZB9mt6OS10kJkh9Ef4d2gKrbE9NUo5W2m3K7V92Ld2ANEs649A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qenLDOfPapKT2/6yOEYVy7rqLND9VyacXUr+STyU4jg=;
 b=XaBLgZLSFXsF8QcRbVe7A2t8SEAsmFvsSreLV8yF5BX+GwzQjCt41qq9x8u1JogR6H7IL74aHuRs2sJMebmtVjNEIOXK7HNwnYrHapdJc2xDYIrjX38cdOJocDFLoawhYFOBRkczFL6mTdx5C40DT1VwJx2U7xrIadT71hXbjHQ=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by DS0PR10MB7953.namprd10.prod.outlook.com (2603:10b6:8:1a1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.41; Mon, 9 Jun
 2025 13:27:20 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 13:27:20 +0000
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
        Wei Yang <richard.weiyang@gmail.com>, Barry Song <baohua@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH 11/11] tools/testing/selftests: add MREMAP_RELOCATE_ANON fork tests
Date: Mon,  9 Jun 2025 14:26:45 +0100
Message-ID: <d52a781999622ed2f1de073d72ea4d9debbfe198.1749473726.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
References: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P265CA0031.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::20) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|DS0PR10MB7953:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eaf5d6a-4161-4396-cd16-08dda7595c9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?374IrTeAuZcH0YuWygOzUVB9SyBsPRRqa5OgrMKfFan+Z/8f06qiTDRF//TJ?=
 =?us-ascii?Q?y6ROtSDOVcI+DuKp72K2DvGUSLx+oo0niliWpDmOScJjUR86xIqMyM/gLhGn?=
 =?us-ascii?Q?+4SF1Tf8DVC2eDkb1fyEzcBR6/Vm5YKdSjcMA7iEwIBv1uhFhOPDjmy2ORWq?=
 =?us-ascii?Q?nK84oiaKWh1St8r39Td1TM7qnfR1LALHKjQiDr5cWr44eQUxeG49Pxl64akJ?=
 =?us-ascii?Q?FBb4swuclVvhaebtfIeC8qGcAbOeSaQ2VLM7qUPBBbKqpWUQuXQTpmhrEH0R?=
 =?us-ascii?Q?UCB1BgKYgc3ujKC8y7FhiHRPQ2UaU+nignhgcrZh5IzcFuNeVG4GijCOl8sp?=
 =?us-ascii?Q?v7EwK2VvtqtlMoOmpnYb0QoGE/NvrOm/XX5OWZGuD9V7Ca2d25/C+y1EwYqh?=
 =?us-ascii?Q?YMye4yC8+Kmnf3x1oLvRc13Mkox/p3MewejCb6S2RROqXUGcHRc3bROA9JWE?=
 =?us-ascii?Q?/XJ9YE1IHBSJVyGz6qWKE70Ouftd5tokclFbBpBdLLMlfqKsjqDF/7d3gOGM?=
 =?us-ascii?Q?x1UeW8k7WiYY6bsAQXCbZIipCkBEsM0SGxS7PW2FXUrLFip/T06ahFG09Lc3?=
 =?us-ascii?Q?xSEzcBnoWTDj/dZsesGucOH8L/a0udWHoejWkQnTQMj7Ei55cF0Fnb4tCD9J?=
 =?us-ascii?Q?boiL1gJ2m+AJymR8e3JSW5nFU9IslmMMQpNe0r2k98gkKbE80YYx4VzxuFMw?=
 =?us-ascii?Q?QMWrwCECiuAUMfFeZLHIpkfua7lXRRtLvOiG+hALSI1O0mSKmOdkGFnsJDtn?=
 =?us-ascii?Q?22RBcOo1SzuL91WpD3bwwMhPscKHZZhfFJ3+nRoiav2LZhFV/j5erL2MeAPk?=
 =?us-ascii?Q?IgtofEFj5IFxL6aANnJNpdsQLU5LYT6AJ9L9etg2G4EidY5JpjUeIFrIumwA?=
 =?us-ascii?Q?xOae7wLfSLknHEhOxZgvybKO83Bvr/KUbAMD+SaUl035WlABXsACCDEVa995?=
 =?us-ascii?Q?lylNHaBCq5GGQhSnBcF2ebgdCetCZkA+EipPUq04AnmRKedxO/c+DzbqY/Ta?=
 =?us-ascii?Q?+8wQobjQfFIF2KFP9TUeg/wQ+q4fzGrAqrL29PidKKYxke0+bBoFYkHHD7Or?=
 =?us-ascii?Q?6QUIr03twO3q4xXDgiO2yA/JYE/bigYsb6NDo/fZKhkSLY//TYZmBtLJy+Ca?=
 =?us-ascii?Q?3D3lodMUggUo3QblEyBavY5vdrGAQzzvV8Bsjk9weVsMGidDjJay8Fz8UUJI?=
 =?us-ascii?Q?h5l7lUufGO1IWoOjB9+EkDp8r2KF9COz/XfU8ryLMLkz5bvKiIcT8C7XMNP7?=
 =?us-ascii?Q?N84IZ4wK5ALRQhyHgIdTyvIZg2ouoEQxryhyXCvWGYHyYhuJ135QWd5paKm1?=
 =?us-ascii?Q?5rsWuVs6wJqhbyqH0k/uP2IfL0bnayXQhpEqMAauAJpp2n6/v/VfpSw2beUO?=
 =?us-ascii?Q?CflgEGE5njeQXHIx1BMBryQ2v7GxBX8htn1/xE0epJsLAHldqdaVUGG2G7c8?=
 =?us-ascii?Q?LWahUtspGg0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UgpJTdm4dlYMqL7GPwN6P4IRDzJcf0uoNEWzdi7t/aagyBwC0vNCrrMCs9sd?=
 =?us-ascii?Q?jD839riPJ66FjXARc+wiCZfoC78uVP7M6QeQykXF5TOa0CaYHXe/sq3F/3vE?=
 =?us-ascii?Q?b0ZRr/4iAGTxhDAw/PpkUAWBCEF5vSc0EUHBmZDv3nT+DsEr/R0tai3ma8h8?=
 =?us-ascii?Q?K0hiW5WWOqSnCoEwBzkPCskWB2Sk052LvY1zQKYJTYgOWPHtvhSkS/VaCDTR?=
 =?us-ascii?Q?1PkCAjxb7uHsOdcp01Tb4i+oSF8tbNxrpAIJ3/ph+51k4LJ14+ZFc+KsApKf?=
 =?us-ascii?Q?97hOeXa6BTVQFiiceY18sXZOU3Gu/6QOTq0pXDbVpuzMEQ+LUcir/AsSB4ge?=
 =?us-ascii?Q?TEYpD350KqHcMdC6+BiQRVAYaNiJ+ZVykp8dRlvH92cZa0Flc6ToXgWnq6vX?=
 =?us-ascii?Q?XYjPw1V88TqcC204bhXyzvOFKpfD3POquL61zVu0dtvo7mKHSrCfUXvZM/qL?=
 =?us-ascii?Q?ZzeeDX5gmErZ3bt9m6i8WLUwfHoM+fdyCitt7DtXm+V3qKV/Mlenv6/I1GYW?=
 =?us-ascii?Q?nNkCoD4+1qJEcHRwowOHib3FJcxyY/8sHF+4IUyRZmSfhSZnrrrY0toJXBG0?=
 =?us-ascii?Q?7hFR0+GfXSQIMcsv0rfVTmZK2BSBU7wgs37KCiVMPGM/BF2vXiDfxvZxioZF?=
 =?us-ascii?Q?aG9UJPqaHjJvhE/QFZTmp3yz9zL3sjmmGF7upBo9TuWh8eAtqALhe0Xys4on?=
 =?us-ascii?Q?Zozz/1cXKzG5rRlhobPEiJ4aJ9NCnkk1wlDczMp2CqE/9YrjlYXWUjkv3+sP?=
 =?us-ascii?Q?D3U/v0JQkwfJXUvD/AFZW2qiPGu+oTW666T8MYWEr884cdmycbQafxmCA6C5?=
 =?us-ascii?Q?N7zO3I1uq628HwqQH9wBI5UN7hpaAiwilm2/kR7x0272cmpVch22k+06bEL9?=
 =?us-ascii?Q?+AP2QVrxRrM9nA2TCdb8UcioHSyoFxO8ce29DvCEtEaexFgmN+9h3epBox8d?=
 =?us-ascii?Q?fsxABmK/BOUgs/YJnMBVB6HOt0zaKXWR6XEZm+46uulyXzLkAoRI9SIYorpT?=
 =?us-ascii?Q?Kj8dv6QkiDrNnFayu7V0igiVGH9xBYT7LrYvdjcVwZhiYEom/pOh9Y4vGWAN?=
 =?us-ascii?Q?fMfTZ2zJ+vXrlWWkIAOQMGP9dw+fJ9DDvXQQCEh1gopqtVRLscjZPsiYb5Pj?=
 =?us-ascii?Q?879rkpZGkkqnFsX1olFFaZrQRLyfKS+wHh3ZIS45UskTO5HA88Fex0OQ9Iy9?=
 =?us-ascii?Q?0Zk/fv4+8ECEF/gjsxR32a289W8LEWQSgHqeC8pidfiQDGfiyxRamWUR/jNE?=
 =?us-ascii?Q?suPOtYZSbyUQgXtB9sZ5NvKxMq0pDlGr+3fUM/iYdK2hdaT6qjfcDAHN3bbd?=
 =?us-ascii?Q?Y8FY4qX8Tn/u6h4psTKxnH6N4Rt/kBc472sihgn1B3eiKwMJsWCCIdd4SI5p?=
 =?us-ascii?Q?HnZ5dO+qRx6EK4pLjIBLQ9EEkbvCAKCDf2T4BpB/Y/bSIvwbWqidQEDDMrPj?=
 =?us-ascii?Q?d8N7hNkMhtHGoaXp2XLt286egniSZmMBkMcp2ASPSSphSqO55iesSNzrwMZZ?=
 =?us-ascii?Q?ks9X1x7yjgCGye2Lue5GmD2OSXeqJpeDOcTfgMU94D+TjwjUK6xPF9G463pQ?=
 =?us-ascii?Q?3Cah7qD3zVS+SLD4qaRfNkcZ0ODSKN0A7h/L9ba22w7AFFgxSltTArR0CWjB?=
 =?us-ascii?Q?0w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3IRRZ9IkFEddJIOqpypjfSMS1IdWC6cisXi91hNNY/NAZQx5a/s2B+e9gry6Gj3mEjXQk18G35w05+jbhDX2qn6fub3GJh1CgVxcXsY6Pgv/cOgCTKw6Wbz0tfH2FzeqTb8xQOasySoNCw8O0cVCIeZ99G23bwX5PW4e2kMz0djoJDjhE5JeUww4Cmp8M77mUiR+FUTuQqtGYAwnxF9jllp+d/sEFFwXEbhUFJCJl+uRyKUml+6gStyU00zbO3Mp6HjNArqkfTraObtwt+sSGCA2uhlnpgnsI3SXSEYpZCrNyL4z81B5VtFTCnclOih+aVqSXOgSfWYgQR5HAK49heplMPU4IwBICEKhtcowcQBQmWVJTaxdKc1SNAs9Itz4x9ODwTWnOnOIHP0Rjfn+Dffk/MISOJ9ecahfqzDbzKUAAOlaDN3H5wi0sUohrabRk4jAQFdIc37rnmK9/NCgH7mJtdinthTZikb3V1YqMeMCjfFSv70cep64pRX/TF6Ll0F93ryS8ygZd8cqLwfOhKWCXeO8oPYcvuKJy5qF8ptHkZS1aRrmN6LloOrvRS/38WIgWqg0sjV+5Pah8Ga5kbVIab7aZlLjpLRkhodxwQ0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eaf5d6a-4161-4396-cd16-08dda7595c9b
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 13:27:20.5711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hneT0WLQUIuU85rZDbSL2YQykHf9RBWri+6DrSaZiJuFmUg6qCsHgQAVW9ZGNXxjnPzz7g7CQkpU5uNVigKrIkjq31alvlyQnj3/qGObJ2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7953
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506090098
X-Authority-Analysis: v=2.4 cv=RZGQC0tv c=1 sm=1 tr=0 ts=6846e13f b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=6_Ml3dIg780BFGbKHqYA:9 cc=ntf awl=host:13206
X-Proofpoint-GUID: Nsai20aAg6Zzt1l932ZR12C1qcGnWJD2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5OCBTYWx0ZWRfXx/6m9bR5XkCP DcbPnMgg6L5NwEjjCB79lr384h7v/THJHSG28usUWfq8Sujh2fO3dKxvfxYApbXyifnOVYNJ2Np rMJ8/WNE0XK/MumFAsOeNJeTAf1B/uu6wC52S4ohkISn3N5A1Hx7yUctEpoJbrYSAvhPpcCkhwA
 vFbfBzmy57kpy2qRrIe9Uc+pZ0RnrHeHmtiIAsGIwxc3IcUctfvr2BKinaR0RSNiUfrlZ9RBYm0 c3nH2UtudUmKcdfmVum8ti379BzUJpQRsRblNTgUj24+2TOq64PAifbQepfVBLOX5Lt30WELwne kKFsFBd5YnX8rkRjzRl+VhBrkqczY/FsOd/Eh1RGXKvhi3uoOjB1MgbRXWVAcEMP4h8X+WX5omK
 yge8CvONsGzN1BVSyM94p0T2FrOH8Wt10vXGK2P4SWKzzls4xokE20HcmQ+9baWKCnc18AJZ
X-Proofpoint-ORIG-GUID: Nsai20aAg6Zzt1l932ZR12C1qcGnWJD2

Add tests explicitly asserting that mremap() fails on forked VMAs whether
they have parent anon_vma's or whether they have child ones, as these are
cases where the folio might be mapped by multiple processes - in this case
we don't even try to relocate folio metadata, but rather simply disallow
the operation.

The tests use MREMAP_MUST_RELOCATE_ANON so we can detect the failure
correctly.

Were the mremap()'s to succeed, a merge would occur, so it remains
appropriate to keep these in the merge test suite.

We also explicitly test the anon_vma reuse case. This is one where a
munmap() occurs on a parent anon_vma which still has children. We keep the
empty anon_vma around, and then attempt to reuse it on the next fork of a
VMA whose anon_vma references this empty anon_vma.

Consider the first case over 3 forks:

FORK 3 TIMES ONE AFTER ANOTHER
==============================

Process 1

     |-------------|
     | avc*        v
  |-----|   vma |-----|
  |  A  |<------| avc |
  |-----|       |-----|
     | anon_vma    ^
     |             |
     v     rb_root |
  |---------------------|
  | refcount = 1        |<--|
  | num_children = 1    |   |
  | num_active_vmas = 1 |---| parent
  |---------------------|

FORK

Process 1

     |-------------|
     | avc         v
  |-----|   vma |-----|
  |  A  |<------| avc |
  |-----|       |-----|
     | anon_vma    ^
     |             |--------------------|
     v     rb_root |                    |
  |---------------------|               |
  | refcount = 2        | (self-parent) |
  | num_children = 2    |<--------------x----|
  | num_active_vmas = 1 |               |    |
  |---------------------|               |    |
                           |------------|    |
Process 2                  |                 |
                           |                 |
     |-------------|       |                 |
     | avc         v       v                 |
  |-----|   vma |-----| |-----|              |
  |  B  |<------| avc |.| avc |              |
  |-----|       |-----| |-----|              |
     | anon_vma    ^                         |
     |             |                         |
     v     rb_root |                         |
  |---------------------|                    |
  | refcount = 1        |                    |
  | num_children = 0    |--------------------|
  | num_active_vmas = 1 | parent
  |---------------------|

FORK

Process 1

     |-------------|
     | avc         v
  |-----|   vma |-----|
  |  A  |<------| avc |
  |-----|       |-----|        |--------------------------|
     | anon_vma    ^           |                          |
     |             |--------------------|                 |
     v     rb_root |                    |                 |
  |---------------------|               |                 |
  | refcount = 3        | (self-parent) |                 |
  | num_children = 2    |<--------------x----|            |
  | num_active_vmas = 1 |               |    |            |
  |---------------------|               |    |            |
                           |------------|    |            |
Process 2                  |                 |            |
                           |                 |            |
     |-------------|       |                 |            |
     | avc         v       v                 |            |
  |-----|   vma |-----| |-----|              |            |
  |  B  |<------| avc |.| avc |              |            |
  |-----|       |-----| |-----|              |            |
     | anon_vma    ^                         |            |
     |             |-------------------------x--------|   |
     v     rb_root |                         |        |   |
  |---------------------|                    |        |   |
  | refcount = 1        |<-------------------x----|   |   |
  | num_children = 1    |--------------------|    |   |   |
  | num_active_vmas = 1 | parent                  |   |   |
  |---------------------|                         |   |   |
                                                  |   |   |
Process 3                                         |   |   |
                           |----------------------x---|   |
     |-------------|       |       |--------------x-------|
     | avc         v       v       v              |
  |-----|   vma |-----| |-----| |-----|           |
  |  C  |<------| avc |.| avc |.| avc |           |
  |-----|       |-----| |-----| |-----|           |
     | anon_vma    ^                              |
     |             |                              |
     v     rb_root |                              |
  |---------------------|                         |
  | refcount = 1        |                         |
  | num_children = 0    |-------------------------|
  | num_active_vmas = 1 | parent
  |---------------------|

FORK

Process 1

     |-------------|
     | avc         v
  |-----|   vma |-----|             |---------------------------------|
  |  A  |<------| avc |             |                                 |
  |-----|       |-----|        |--------------------------|           |
     | anon_vma    ^           |                          |           |
     |             |--------------------|                 |           |
     v     rb_root |                    |                 |           |
  |---------------------|               |                 |           |
  | refcount = 4        | (self-parent) |                 |           |
  | num_children = 2    |<--------------x----|            |           |
  | num_active_vmas = 1 |               |    |            |           |
  |---------------------|               |    |            |           |
                           |------------|    |            |           |
Process 2                  |                 |            |           |
                           |                 |            |           |
     |-------------|       |                 |            |           |
     | avc         v       v                 |            |           |
  |-----|   vma |-----| |-----|              |            |           |
  |  B  |<------| avc |.| avc |              |            |           |
  |-----|       |-----| |-----|     |--------x------------x-------|   |
     | anon_vma    ^                |        |            |       |   |
     |             |-------------------------x--------|   |       |   |
     v     rb_root |                         |        |   |       |   |
  |---------------------|                    |        |   |       |   |
  | refcount = 1        |<-------------------x----|   |   |       |   |
  | num_children = 1    |--------------------|    |   |   |       |   |
  | num_active_vmas = 1 | parent                  |   |   |       |   |
  |---------------------|                         |   |   |       |   |
                                                  |   |   |       |   |
Process 3                                         |   |   |       |   |
                           |----------------------x---|   |       |   |
     |-------------|       |       |--------------x-------|       |   |
     | avc         v       v       v              |               |   |
  |-----|   vma |-----| |-----| |-----|           |               |   |
  |  C  |<------| avc |.| avc |.| avc |           |               |   |
  |-----|       |-----| |-----| |-----|           |               |   |
     | anon_vma    ^                              |               |   |
     |             |------------------------------x-----------|   |   |
     v     rb_root |                              |           |   |   |
  |---------------------|                         |           |   |   |
  | refcount = 1        |<------------------------x---|       |   |   |
  | num_children = 1    |-------------------------|   |       |   |   |
  | num_active_vmas = 1 | parent                      |       |   |   |
  |---------------------|                             |       |   |   |
                                                      |       |   |   |
Process 4                                             |       |   |   |
                           |--------------------------x-------|   |   |
     |-------------|       |       |------------------x-----------|   |
     | avc         v       v       v       v----------x---------------|
  |-----|   vma |-----| |-----| |-----| |-----|       |
  |  D  |<------| avc |.| avc |.| avc |.| avc |       |
  |-----|       |-----| |-----| |-----| |-----|       |
     | anon_vma    ^                                  |
     |             |                                  |
     v     rb_root |                                  |
  |---------------------|                             |
  | refcount = 1        |                             |
  | num_children = 0    |-----------------------------|
  | num_active_vmas = 1 | parent
  |---------------------|

We can see that at no point do we lack either a raised num_children count
or anon_vma_chain list count.

Equally with anon_vma reuse:

FORK 3 TIMES ONE AFTER ANOTHER, UNMAPPING AFTER FORK FOR ANON_VMA REUSE
=======================================================================

Process 1

     |-------------|
     | avc*        v
  |-----|   vma |-----|
  |  A  |<------| avc |
  |-----|       |-----|
     | anon_vma    ^
     |             |
     v     rb_root |
  |---------------------|
  | refcount = 1        |<--|
  | num_children = 1    |   |
  | num_active_vmas = 1 |---| parent
  |---------------------|

FORK

Process 1

     |-------------|
     | avc         v
  |-----|   vma |-----|
  |  A  |<------| avc |
  |-----|       |-----|
     | anon_vma    ^
     |             |--------------------|
     v     rb_root |                    |
  |---------------------|               |
  | refcount = 2        | (self-parent) |
  | num_children = 2    |<--------------x----|
  | num_active_vmas = 1 |               |    |
  |---------------------|               |    |
                           |------------|    |
Process 2                  |                 |
                           |                 |
     |-------------|       |                 |
     | avc         v       v                 |
  |-----|   vma |-----| |-----|              |
  |  B  |<------| avc |.| avc |              |
  |-----|       |-----| |-----|              |
     | anon_vma    ^                         |
     |             |                         |
     v     rb_root |                         |
  |---------------------|                    |
  | refcount = 1        |                    |
  | num_children = 0    |--------------------|
  | num_active_vmas = 1 | parent
  |---------------------|

FORK

Process 1

     |-------------|
     | avc         v
  |-----|   vma |-----|
  |  A  |<------| avc |
  |-----|       |-----|        |--------------------------|
     | anon_vma    ^           |                          |
     |             |--------------------|                 |
     v     rb_root |                    |                 |
  |---------------------|               |                 |
  | refcount = 3        | (self-parent) |                 |
  | num_children = 2    |<--------------x----|            |
  | num_active_vmas = 1 |               |    |            |
  |---------------------|               |    |            |
                           |------------|    |            |
Process 2                  |                 |            |
                           |                 |            |
     |-------------|       |                 |            |
     | avc         v       v                 |            |
  |-----|   vma |-----| |-----|              |            |
  |  B  |<------| avc |.| avc |              |            |
  |-----|       |-----| |-----|              |            |
     | anon_vma    ^                         |            |
     |             |-------------------------x--------|   |
     v     rb_root |                         |        |   |
  |---------------------|                    |        |   |
  | refcount = 1        |<-------------------x----|   |   |
  | num_children = 1    |--------------------|    |   |   |
  | num_active_vmas = 1 | parent                  |   |   |
  |---------------------|                         |   |   |
                                                  |   |   |
Process 3                                         |   |   |
                           |----------------------x---|   |
     |-------------|       |       |--------------x-------|
     | avc         v       v       v              |
  |-----|   vma |-----| |-----| |-----|           |
  |  C  |<------| avc |.| avc |.| avc |           |
  |-----|       |-----| |-----| |-----|           |
     | anon_vma    ^                              |
     |             |                              |
     v     rb_root |                              |
  |---------------------|                         |
  | refcount = 1        |                         |
  | num_children = 0    |-------------------------|
  | num_active_vmas = 1 | parent
  |---------------------|

UNMAP B

Process 1

     |-------------|
     | avc         v
  |-----|   vma |-----|
  |  A  |<------| avc |
  |-----|       |-----|        |--------------------------|
     | anon_vma    ^           |                          |
     |             |------------                          |
     v     rb_root |                                      |
  |---------------------|                                 |
  | refcount = 3        | (self-parent)                   |
  | num_children = 2    |<-------------------|            |
  | num_active_vmas = 1 |                    |            |
  |---------------------|                    |            |
                                             |            |
Process 2                                    |            |
                                             |            |
                   |-------------------------x--------|   |
           rb_root |                         |        |   |
  |---------------------|                    |        |   |
  | refcount = 1        |<-------------------x----|   |   | We keep empty
  | num_children = 1    |--------------------|    |   |   | anon_vma round.
  | num_active_vmas = 0 | parent                  |   |   |
  |---------------------|                         |   |   |
                                                  |   |   |
Process 3                                         |   |   |
                           |----------------------x---|   |
     |-------------|       |       |--------------x-------|
     | avc         v       v       v              |
  |-----|   vma |-----| |-----| |-----|           |
  |  C  |<------| avc |.| avc |.| avc |           |
  |-----|       |-----| |-----| |-----|           |
     | anon_vma    ^                              |
     |             |                              |
     v     rb_root |                              |
  |---------------------|                         |
  | refcount = 1        |                         |
  | num_children = 0    |-------------------------|
  | num_active_vmas = 1 | parent
  |---------------------|

FORK

Process 1

     |-------------|
     | avc         v
  |-----|   vma |-----|             |-----------------------------|
  |  A  |<------| avc |             |                             |
  |-----|       |-----|        |--------------------------|       |
     | anon_vma    ^           |                          |       |
     |             |-----------|                          |       |
     v     rb_root |                                      |       |
  |---------------------|                                 |       |
  | refcount = 3        | (self-parent)                   |       |
  | num_children = 2    |<-------------------|            |       |
  | num_active_vmas = 1 |                    |            |       |
  |---------------------|                    |            |       |
                                             |            |       |
Process 2               |--------------------x------------x-------x-------|
                        |                    |            |       |       |
                   |-------------------------x--------|   |       |       |
           rb_root |                         |        |   |       |       |
  |---------------------|<-------------------x--------x---x-------x---|   |
  | refcount = 1        |<-------------------x----|   |   |       |   |   |
  | num_children = 1    |--------------------|    |   |   |       |   |   |
  | num_active_vmas = 1 | parent                  |   |   |       |   |   |
  |---------------------|                         |   |   |       |   |   |
                                                  |   |   |       |   |   |
Process 3                                         |   |   |       |   |   |
                           |----------------------x---|   |       |   |   |
     |-------------|       |       |--------------x-------|       |   |   |
     | avc         v       v       v              |               |   |   |
  |-----|   vma |-----| |-----| |-----|           |               |   |   |
  |  C  |<------| avc |.| avc |.| avc |           |               |   |   |
  |-----|       |-----| |-----| |-----|           |               |   |   |
     | anon_vma    ^                              |               |   |   |
     |             |------------------------------x-----------|   |   |   |
     v     rb_root |                              |           |   |   |   |
  |---------------------|                         |           |   |   |   |
  | refcount = 1        |                         |           |   |   |   |
  | num_children = 0    |-------------------------|           |   |   |   |
  | num_active_vmas = 1 | parent                              |   |   |   |
  |---------------------|                                     |   |   |   |
                                                              |   |   |   |
Process 4                                                     |   |   |   |
                           |----------------------------------|   |   |   |
     |-------------|       |       |------------------------------|   |   |
     | avc         v       v       v                                  |   |
  |-----|   vma |-----| |-----| |-----|                               |   |
  |  D  |<------| avc |.| avc |.| avc |                               |   |
  |-----|       |-----| |-----| |-----|                               |   |
     | anon_vma    ^                                                  |   |
     |             |--------------------------------------------------x---|
     |                                                                |
     |----------------------------------------------------------------|

We reuse the empty anon_vma from VMA B. Note that process 3 is now parented
to process 4's (and 2's) anon_vma.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 tools/testing/selftests/mm/merge.c | 361 +++++++++++++++++++++++++++++
 1 file changed, 361 insertions(+)

diff --git a/tools/testing/selftests/mm/merge.c b/tools/testing/selftests/mm/merge.c
index b658f2f3a94b..f03ee15cbfc5 100644
--- a/tools/testing/selftests/mm/merge.c
+++ b/tools/testing/selftests/mm/merge.c
@@ -4,6 +4,7 @@
 #include "../kselftest_harness.h"
 #include <linux/prctl.h>
 #include <fcntl.h>
+#include <errno.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <unistd.h>
@@ -15,11 +16,18 @@
 #include "vm_util.h"
 #include <linux/mman.h>
 
+enum poll_action {
+	POLL_TASK_RUN,
+	POLL_TASK_WAIT,
+	POLL_TASK_EXIT,
+};
+
 FIXTURE(merge)
 {
 	unsigned int page_size;
 	char *carveout;
 	struct procmap_fd procmap;
+	volatile enum poll_action *ipc;
 };
 
 FIXTURE_SETUP(merge)
@@ -31,6 +39,11 @@ FIXTURE_SETUP(merge)
 	ASSERT_NE(self->carveout, MAP_FAILED);
 	/* Setup PROCMAP_QUERY interface. */
 	ASSERT_EQ(open_self_procmap(&self->procmap), 0);
+
+	/* Quick and dirty IPC. */
+	self->ipc = (volatile enum poll_action *)mmap(NULL, self->page_size,
+			PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
+	ASSERT_NE(self->ipc, MAP_FAILED);
 }
 
 FIXTURE_TEARDOWN(merge)
@@ -42,6 +55,7 @@ FIXTURE_TEARDOWN(merge)
 	 * fails (KSM may be disabled for instance).
 	 */
 	prctl(PR_SET_MEMORY_MERGE, 0, 0, 0, 0);
+	ASSERT_EQ(munmap((void *)self->ipc, self->page_size), 0);
 }
 
 TEST_F(merge, mprotect_unfaulted_left)
@@ -1898,4 +1912,351 @@ TEST_F(merge, mremap_relocate_anon_mprotect_faulted_faulted)
 	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 10 * page_size);
 }
 
+TEST_F(merge, mremap_relocate_anon_single_fork)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	volatile enum poll_action *poll = self->ipc;
+	char *ptr, *ptr2;
+	pid_t pid2;
+	int err;
+
+	/*
+	 * .           .           .
+	 * . |-------| .           .  Map A, fault in and
+	 * . |   A   |-.-----|     .  fork process 1 to
+	 * . |-------| .     |     .  process 2.
+	 * .           .     v     .
+	 * .           . |-------| .
+	 * .           . |   B   | .
+	 * .           . |-------| .
+	 * .           .           .
+	 * . Process 1 . Process 2 .
+	 */
+	ptr = mmap(carveout, 3 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	/* Fault it in. */
+	ptr[0] = 'x';
+
+	pid2 = fork();
+	ASSERT_NE(pid2, -1);
+	/* Parent process. */
+	if (pid2 != 0) {
+		/* mremap() fails due to forked children. */
+		ptr2 = sys_mremap(ptr, page_size, page_size,
+				  MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_MUST_RELOCATE_ANON,
+				  &carveout[3 * page_size]);
+		err = errno;
+		ASSERT_EQ(ptr2, MAP_FAILED);
+		ASSERT_EQ(err, EFAULT);
+
+		poll[0] = POLL_TASK_EXIT;
+
+		wait(NULL);
+		return;
+	}
+
+	/* This is process 2. */
+
+	/* mremap() fails due to forked parents. */
+	ptr2 = sys_mremap(ptr, page_size, page_size,
+		MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_MUST_RELOCATE_ANON,
+		&carveout[3 * page_size]);
+	err = errno;
+	ASSERT_EQ(ptr2, MAP_FAILED);
+	ASSERT_EQ(err, EFAULT);
+
+	/* Wait for parent to finish. */
+	while (poll[0] == POLL_TASK_RUN)
+		;
+}
+
+TEST_F(merge, mremap_relocate_anon_fork_twice)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	volatile enum poll_action *poll = self->ipc;
+	char *ptr, *ptr2;
+	pid_t pid2, pid3;
+	int err;
+
+	/*
+	 * .           .           .
+	 * . |-------| .           .  Map A, fault in and
+	 * . |   A   |-.-----|     .  fork process 1 to
+	 * . |-------| .     |     .  process 2.
+	 * .           .     v     .
+	 * .           . |-------| .
+	 * .           . |   B   | .
+	 * .           . |-------| .
+	 * .           .           .
+	 * . Process 1 . Process 2 .
+	 */
+	ptr = mmap(carveout, 3 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	/* Fault it in. */
+	ptr[0] = 'x';
+	pid2 = fork();
+	ASSERT_NE(pid2, -1);
+	/* If parent process, simply wait. */
+	if (pid2 != 0) {
+		while (true) {
+			if (poll[0] == POLL_TASK_EXIT)
+				break;
+			if (poll[0] == POLL_TASK_WAIT)
+				continue;
+
+			/* mremap() fails due to forked children. */
+			ptr2 = sys_mremap(ptr, page_size, page_size,
+					  MREMAP_MAYMOVE | MREMAP_FIXED |
+					  MREMAP_MUST_RELOCATE_ANON,
+					  &carveout[3 * page_size]);
+			err = errno;
+			ASSERT_EQ(ptr2, MAP_FAILED);
+			ASSERT_EQ(err, EFAULT);
+
+			/* Strictly, should be atomic. */
+			if (poll[0] == POLL_TASK_RUN)
+				poll[0] = POLL_TASK_WAIT;
+		}
+
+		wait(NULL);
+		return;
+	}
+
+	/* This is process 2. */
+
+	/* Wait for parent to finish. */
+	while (poll[0] == POLL_TASK_RUN)
+		;
+
+	/*
+	 * .           .           .           .
+	 * . |-------| .           .           .
+	 * . |   A   | .           .           .
+	 * . |-------| .           .           .
+	 * .           .           .           .
+	 * .           . |-------| .           . Fork process 2 to
+	 * .           . |   B   |-.-----|     . process 3.
+	 * .           . |-------| .     |     .
+	 * .           .           .     v     .
+	 * .           .           . |-------| .
+	 * .           .           . |   C   | .
+	 * .           .           . |-------| .
+	 * .           .           .           .
+	 * . Process 1 . Process 2 . Process 3 .
+	 */
+	pid3 = fork();
+	ASSERT_NE(pid3, -1);
+	/* If parent process, simply wait. */
+	if (pid3 != 0) {
+		/* mremap() fails due to forked children. */
+		ptr2 = sys_mremap(ptr, page_size, page_size,
+				  MREMAP_MAYMOVE | MREMAP_FIXED |
+				  MREMAP_MUST_RELOCATE_ANON,
+				  &carveout[3 * page_size]);
+		err = errno;
+		ASSERT_EQ(ptr2, MAP_FAILED);
+		ASSERT_EQ(err, EFAULT);
+
+		/* We don't retrigger, so just indicate we're done. */
+		poll[1] = POLL_TASK_EXIT;
+
+		wait(NULL);
+		return;
+	}
+
+	/* This is process 3. */
+
+	/* Trigger root mremap(). */
+	poll[0] = POLL_TASK_RUN;
+	/* Wait for parents to finish. */
+
+	while (poll[0] == POLL_TASK_RUN)
+		;
+	while (poll[1] == POLL_TASK_RUN)
+		;
+
+	/* mremap() fails due to forked parents. */
+	ptr2 = sys_mremap(ptr, page_size, page_size,
+		MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_MUST_RELOCATE_ANON,
+		&carveout[3 * page_size]);
+	err = errno;
+	ASSERT_EQ(ptr2, MAP_FAILED);
+	ASSERT_EQ(err, EFAULT);
+	/* Kill waiting parent. */
+	poll[0] = POLL_TASK_EXIT;
+}
+
+TEST_F(merge, mremap_relocate_anon_3_times_reuse_anon_vma)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	volatile enum poll_action *poll = self->ipc;
+	char *ptr, *ptr2;
+	pid_t pid2, pid3, pid4;
+	int err;
+
+	/*
+	 * .           .           .
+	 * . |-------| .           .  Map A, fault in and
+	 * . |   A   |-.-----|     .  fork process 1 to
+	 * . |-------| .     |     .  process 2.
+	 * .           .     v     .
+	 * .           . |-------| .
+	 * .           . |   B   | .
+	 * .           . |-------| .
+	 * .           .           .
+	 * . Process 1 . Process 2 .
+	 */
+	ptr = mmap(carveout, 3 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	/* Fault it in. */
+	ptr[0] = 'x';
+	pid2 = fork();
+	ASSERT_NE(pid2, -1);
+	/* If parent process, simply wait. */
+	if (pid2 != 0) {
+		while (true) {
+			if (poll[0] == POLL_TASK_EXIT)
+				break;
+			if (poll[0] == POLL_TASK_WAIT)
+				continue;
+
+			/* mremap() fails due to forked children. */
+			ptr2 = sys_mremap(ptr, page_size, page_size,
+					  MREMAP_MAYMOVE | MREMAP_FIXED |
+					  MREMAP_MUST_RELOCATE_ANON,
+					  &carveout[3 * page_size]);
+			err = errno;
+			ASSERT_EQ(ptr2, MAP_FAILED);
+			ASSERT_EQ(err, EFAULT);
+
+			if (poll[0] == POLL_TASK_RUN)
+				poll[0] = POLL_TASK_WAIT;
+		}
+
+		wait(NULL);
+		return;
+	}
+
+	/* This is process 2. */
+
+	/* Wait for parent to finish. */
+	while (poll[0] == POLL_TASK_RUN)
+		;
+
+	/*
+	 * .           .           .           .
+	 * . |-------| .           .           .
+	 * . |   A   | .           .           .
+	 * . |-------| .           .           .
+	 * .           .           .           .
+	 * .           . |-------| .           . Fork process 2 to
+	 * .           . |   B   |-.-----|     . process 3.
+	 * .           . |-------| .     |     .
+	 * .           .           .     v     .
+	 * .           .           . |-------| .
+	 * .           .           . |   C   | .
+	 * .           .           . |-------| .
+	 * .           .           .           .
+	 * . Process 1 . Process 2 . Process 3 .
+	 */
+	pid3 = fork();
+	ASSERT_NE(pid3, -1);
+	/* If parent process, simply wait. */
+	if (pid3 != 0) {
+		/*
+		 * We only try to mremap once, before unmapping so we can
+		 * trigger reuse of B's anon_vma.
+		 */
+		/* mremap() fails due to forked children. */
+		ptr2 = sys_mremap(ptr, page_size, page_size,
+				  MREMAP_MAYMOVE | MREMAP_FIXED |
+				  MREMAP_MUST_RELOCATE_ANON,
+				  &carveout[3 * page_size]);
+		err = errno;
+		ASSERT_EQ(ptr2, MAP_FAILED);
+		ASSERT_EQ(err, EFAULT);
+
+		/*
+		 * .           .           .           .
+		 * . |-------| .           .           .
+		 * . |   A   | .           .           .
+		 * . |-------| .           .           .
+		 * .           .           .           .
+		 * .           .           .           . Unmap VMA B, but
+		 * .           .           .           . anon_vma is left
+		 * .           .           .           . around.
+		 * .           .           .           .
+		 * .           .           . |-------| .
+		 * .           .           . |   C   | .
+		 * .           .           . |-------| .
+		 * .           .           .           .
+		 * . Process 1 . Process 2 . Process 3 .
+		 */
+		munmap(ptr, 3 * page_size);
+
+		/* We indicate we're done so child waits for */
+		poll[1] = POLL_TASK_EXIT;
+
+		wait(NULL);
+		return;
+	}
+
+	/* This is process 3. */
+
+	/* Trigger root mremap(). */
+	poll[0] = POLL_TASK_RUN;
+	/* Wait for parents to finish. */
+	while (poll[0] == POLL_TASK_RUN)
+		;
+	while (poll[1] == POLL_TASK_RUN)
+		;
+
+	pid4 = fork();
+	ASSERT_NE(pid4, -1);
+
+	if (pid4 != 0) {
+		/* mremap() fails due to forked children. */
+		ptr2 = sys_mremap(ptr, page_size, page_size,
+				  MREMAP_MAYMOVE | MREMAP_FIXED |
+				  MREMAP_MUST_RELOCATE_ANON,
+				  &carveout[3 * page_size]);
+		err = errno;
+		ASSERT_EQ(ptr2, MAP_FAILED);
+		ASSERT_EQ(err, EFAULT);
+
+		/* We don't retrigger, so just indicate we're done. */
+		poll[2] = POLL_TASK_EXIT;
+
+		wait(NULL);
+		return;
+	}
+
+	/* This is process 4. */
+
+	/* Trigger root mremap(). */
+	poll[0] = POLL_TASK_RUN;
+	/* We unmapped VMA B, so nothing to trigger there. */
+	/* Wait for parents to finish. */
+	while (poll[0] == POLL_TASK_RUN)
+		;
+	while (poll[2] == POLL_TASK_RUN)
+		;
+
+	/* mremap() fails due to forked parents. */
+	ptr2 = sys_mremap(ptr, page_size, page_size,
+		MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_MUST_RELOCATE_ANON,
+		&carveout[3 * page_size]);
+	err = errno;
+	ASSERT_EQ(ptr2, MAP_FAILED);
+	ASSERT_EQ(err, EFAULT);
+	/* Kill waiting parent. */
+	poll[0] = POLL_TASK_EXIT;
+}
+
 TEST_HARNESS_MAIN
-- 
2.49.0

