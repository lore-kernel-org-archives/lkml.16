Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE3A25DAFC
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751282754; cv=fail; b=nuLdJNwoAIZ7PbY5FKMnHmY4q+4hllwJSk+mY+xc4pyIYUJkbvTu5b1rQqbHbkoLQrmocS0qoFyqZuekwboFUd4ygNwbdgtffZw134dp9OShvAy9aPfOCu/woq5OlNpg4FTsPc2EimREW0jz4ry+C2J2bdg7KAuDxf8xDQqctpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751282754; c=relaxed/simple;
	bh=GCA0dR6i/kOhXVEeaxZvDtz0h39yfY7pXnuzziefAJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nKl1fM+G5WVtrskeSqbsIne125+VnidlW3c9ZIYwvgL9EyHgxf1Qa66i+19M/Y4+Guc2Y1xgn1YCydaCzsl9Ze7BVIdhGZnpkXWxfQ4mTvRpETUahu/1CHlG+mNQggT9ucQy7NOWC8DWsDclSip9mY/JbPF1v4CJi4dX+uIyK7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YDgwwyAT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oB3OxYjY; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YDgwwyAT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oB3OxYjY"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U84bu8000857;
	Mon, 30 Jun 2025 11:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=IZrpePPI9+NnAgIyJZ
	HizV0Wb0uydQxAAeW3Nn+Wubo=; b=YDgwwyAT7kQIeXTvhSJoOx58DbgiaIZoDP
	hYvfu174FocGvq30X3SjXCu+gY0jlhLy/mITjblxlo9d2/ThbBnLh8l6qZLVsmEO
	YbOGqvGE7/bn1mCPHfkz5/sDoWrNI5k3UoZSZg7R+NvKAjSHe5I8Ni+DO0vWpIZ2
	5m433J1bfSCCtyxDXRzT3cZJsCbeslB/2XQsjjR1ibCUdGZIZ4O4KkgOyUcqWOoR
	KU5J2IZJkbYn+Kl8kkcdQKDx4vK+1fJHrLO+zZEgqyI1nhuiLiIWdVCYOVVMPOME
	oEBzdyXWuGQUZhc7xqa3YScZzU5DLqpLLtbNDSFtVDEOiJF5qV+Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j80w28wh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 11:25:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55UAcUf0021581;
	Mon, 30 Jun 2025 11:25:20 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47jy1cxw5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 11:25:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qXQdhbi21uPcTwQaqLN/VdoamsOUvdtvTy5M5Yk92ev5gLJbyXoTLEkqzMze6y2dJAvzVeuro8D8TBhSpwF393HdGFIL7CpVKvJv0e7DsV/ZugjNBuluN+Aw3sXQf/xt1hLlku+mFL5ay1E7yXDoQtcccgU22PXtwXvaOP2NIjSFumgTFz/Sytd7dgjyBczf3WDttWQ//4D4ZDgXpRMFi8u14ZuEUPuVDdDjvSBgLC6xQR/XsbbQZw9Toe1GeG+/w0mriLjxNGFw14ovHyHbe4FM0QzCYuNl8961FMQLCLrnIjUB+NzlKVNAziHtasZIjEHZ2pdJhE/TTFYWF1Px7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZrpePPI9+NnAgIyJZHizV0Wb0uydQxAAeW3Nn+Wubo=;
 b=DW8TRVCs40HDKDh21VWm0a1DOP1gz3hOV9w3YXRk/ggOy0cT9RMNWjuVVV2VWxj9cp2MDiLUr9i0MLJidiShjddMuQ/cEkhlx5Hdm1Gjs7AVBY38OvT7gdRzUAXB2aIw+PS5xoA6KG0eTxB5d+fIPVVqivSl1D1CJfhpJ2Cssf0D3Tsc9amL+D8WazUnQUficJLdF9QMJUxM0oP1rNTh12abvT9sWjUhSpJWq3lEmFbtualXHVK/r5nORHDy8qmVNdjl//0wb40d7AImaraRzMi2VmAN8en93sb4e3o+U18YD/JX4WbYz2AMn39K0qIBsMjASgLT3HEHGgCdEGaO9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZrpePPI9+NnAgIyJZHizV0Wb0uydQxAAeW3Nn+Wubo=;
 b=oB3OxYjY95uklzSbhopPTt0QUCaNjdj0KJrY0pLJZceeFn/zAJye7AkxYJirfgNtSB6AJtDq0MhNlBHwPJqpxZW26pZmHdBAb0nRB/K3wtl8xuHhZgo3UN/2UZx62aqGHhwoZOyDyElj/EyqRmpcO//F7jMXIn5NDQOY9sAWg5A=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by LV3PR10MB7915.namprd10.prod.outlook.com (2603:10b6:408:21a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Mon, 30 Jun
 2025 11:25:17 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 11:25:17 +0000
Date: Mon, 30 Jun 2025 12:25:15 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, david@redhat.com,
        willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
        vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
        peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
        baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
        christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
        linux-arm-kernel@lists.infradead.org, hughd@google.com,
        yang@os.amperecomputing.com, ziy@nvidia.com
Subject: Re: [PATCH v4 1/4] mm: Optimize mprotect() for MM_CP_PROT_NUMA by
 batch-skipping PTEs
Message-ID: <79a48c48-53b1-4002-a8b2-447e69d96e49@lucifer.local>
References: <20250628113435.46678-1-dev.jain@arm.com>
 <20250628113435.46678-2-dev.jain@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250628113435.46678-2-dev.jain@arm.com>
X-ClientProxiedBy: LNXP265CA0088.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::28) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|LV3PR10MB7915:EE_
X-MS-Office365-Filtering-Correlation-Id: ae9283a1-321d-4e75-2333-08ddb7c8ca54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eRCIN1YZeNOf+9/a88sxwSS4L6i3eVQfHOvc9ZNzryicDpkpWOMHf2zsVC2i?=
 =?us-ascii?Q?Vjqwi4NmJuvrtCBwahBst5qI9tuEhuK1bLmVOiaZASEbplRb+cJ13zhRgcB1?=
 =?us-ascii?Q?+UEE9ut4J/q7T/6uSMAL3OhdUbhJeQ0o0g1rcKZ/iH4lBvhYGMPrCsgH3gv9?=
 =?us-ascii?Q?tJmjRaJIJTsmTx2tQwAEjLuo6Sg2GduKCXaarML5M4YnQmrV8Tb0BqR6/FET?=
 =?us-ascii?Q?42mvuq3RyijTwu2zCRHO4nZcnKP0fBRlh5Np2VVCMNAfzIkzKbHpzVQcB+zQ?=
 =?us-ascii?Q?YMFlKxVPonwi9STg2tUhDjieunxnpnji0MjGdSPFU80nq0qdPxarExI77EqP?=
 =?us-ascii?Q?Cs/Rgh3cftOIpFotJkPFLB3NlVez6HmN/xTlK0TasA3SdV1teS2ffo1O4zEg?=
 =?us-ascii?Q?bm8x2/jqM4NlAMBfK8MG7JHAzzucDMh+ppbvoAxscYBCt5NqkqUGfNvQfWaj?=
 =?us-ascii?Q?E8OHWPRNLy3Sz8/k6pFIn4FsYiNGsb1eKQ7MLuHz/lD+zyk92FWLQADwPZHW?=
 =?us-ascii?Q?UJlqJ4XSq1fw0EGepH1XMfZ5W1Jt+hb2YkXqkre64YgGEK5vJEJbkFePlgte?=
 =?us-ascii?Q?16uhlKaZBQNiE5QZvbEoPrhZWNas9exI0Gu8rtQ+utWkJTcK72h+Pw8alrC2?=
 =?us-ascii?Q?w5SkQOVEo3rypUf/mUPvF8eeJM5C5CLZVdzEG0FAt4vOYaQx2uWjGT9VWW1g?=
 =?us-ascii?Q?e+5KIyDDAjfsh18mHM4T2z9W6KMtlIO1IyHYedKQjP+3hBIq6pkYAdQZZ5KN?=
 =?us-ascii?Q?FXXcyZDdI5ICkApPeiw3/g6YqKUSG9UKigvVN+vFoNAcI/xxjanEnmAdo+Lb?=
 =?us-ascii?Q?OEIYSd6dH/CD4TBMfsitbaMaKFZ2oFe6iYeB5GSvYl31NAyQriK9T87FrbLR?=
 =?us-ascii?Q?dgkmFL32pbNAZ19lafiTK9Vzyk6HpyE18h1gj+78h5IgLpbwUDY3zxNZdKL/?=
 =?us-ascii?Q?S3naV4IBu7ZN7ES5UQTemkd/agOW29f4VNgvEkYZTOhcgkIlJS0WUhEHJL0M?=
 =?us-ascii?Q?ZISuOoALzwvSSr3/VtoTm7Q6KxMTyXIrHyAZPy2WfDLYza+owOvDM70r0Yrl?=
 =?us-ascii?Q?8g8RJArw5Xe/aFNYpSaV78MQl2H2Jqr40miXn/SmQgA9zSTYUU7XPXCqi07b?=
 =?us-ascii?Q?BxMx7cx8KfMjbocAYT+C01UZI6uIe2ywKA4W6MuNIFvw5xHpH1OW1jpuByct?=
 =?us-ascii?Q?sPF90dtp1RNZ7L/5PkHnQEFLxjihZw5rQyp0sjGgugn4mvGI4Blltlb2wCgm?=
 =?us-ascii?Q?O54nQ1nHYjME+MdMDXXZKHRT4ZqzbVZdkegN4MhynaMpyYYVKqWjbeoS0LRY?=
 =?us-ascii?Q?JieKsD65rNmf3r3D1IAzlO5nInhv6cYPIbt8N2CE2aBTosZE6p0OVWYPpBKM?=
 =?us-ascii?Q?VPYKbhDE9tFXXoqjbbX6i7BoBL1yXnQ6GuPExH8BibATNzkezQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SsZyztC8LIvDJFSkGQFPEF3cX6Fm/4xk+ex3YQDyLC0HsoBIExd2fdph0GIS?=
 =?us-ascii?Q?Ajh3tzhe/rslsHGYijTCxjl8qU8dOiR/wcfa6h/I1E6HN4HsJjQHadSizRNt?=
 =?us-ascii?Q?J/lEo+AepAJp8Gn5zMJ/tvEaddPZiaO3W4ufr9pu2MQlxOkIwnGPnOZxtozH?=
 =?us-ascii?Q?xnkqXLJXTZvhTLLSKzWStYBT05/UkCh1GjXkqYZr3mbHDeFedOx3zAOKdlu8?=
 =?us-ascii?Q?H7aTgpZQKk8NB9Jh3TwEO7ZkwhqRCha/Y8En4j+VLgtY9NwtQaPEjAyVBVzg?=
 =?us-ascii?Q?h4hHoFLtnhyIHWV7LCvRQ2cI8TXD1onMtltmLj0E4fnfGJUn9FCES9+ix2yk?=
 =?us-ascii?Q?W8pw5iFmnQmaT39pLnVjUF4IhTCRiwZVnF2QIQ+iMzF/ED6hafeh4ngPqiy9?=
 =?us-ascii?Q?/TSAJ78iLJ0j3srbqcNPBKQxDJTUqikDXL9qyTMFzRvZtHB/33qOtXFEgkUF?=
 =?us-ascii?Q?3rnpANNKILMg2spXEQZvX9fnnZFyANOENfspBe/RlSsDVNUdQtS/TAPtsut9?=
 =?us-ascii?Q?8dh1Pv2MljEuNaEMx4KIOQtc21ghNHym+lQ/Y99b60NOx/ZX9By6cGnb5aEr?=
 =?us-ascii?Q?spoO1MUnnhYza0lTa3M2wdDwj9iU/APh2IG0ABuUl6x3ucUFwYs2ls0ow1zo?=
 =?us-ascii?Q?5k6oqTm5isZZ0vDplc/b/GK4wA8XLsnUJ/c5yO/xELqBj9oL1hhvJeYSZg1q?=
 =?us-ascii?Q?ZgP4xj7g9R+ygEunSnzoANgm7UyDkiHupHJMhHbrlaBm/Cm4qffGxTAkfOm+?=
 =?us-ascii?Q?BzD7Jq/D5la8xp1xYQR4DfLoD2mBSbvxRosK/UtfBoEdhy9Jsk27sHG/5E5Z?=
 =?us-ascii?Q?C5oEupulTS0ptsuPRp92Q1o2Ae8uCkvUq6Z6GEedeOxAySVM/Qc18Rcn00zi?=
 =?us-ascii?Q?1QOd1gEgvd4FQp+qwQoDGePXR8EoKTb403iRcj9Mr6Q0ebtFdh8aGlQD4fAW?=
 =?us-ascii?Q?h5uIAD03jolGjc9R44cyf/S2kZK7qvDaaa4aETxv4xKbUO1G+lNVZ4FvShSw?=
 =?us-ascii?Q?b6LIcvdQD7mMB+dPkW2GQ7llY/3tJLyeU64QysYAr1kAhQLP04SktXgH6oXg?=
 =?us-ascii?Q?BWPHIfgIXFrZQ2BdFtRMVlJVrVycf7102j/6nAPUMhys0mRZvu/eCFMYVwI0?=
 =?us-ascii?Q?ZILvtURNqhhe1u+AJBRUq6nn0IUxDy+y8K1fe94um4OpONA8mDGiou07hgRN?=
 =?us-ascii?Q?gDwayprDqVUvRUv3/kB3+7N/k5fOGr8X4zO94quKf5Kh273nW/zBAKVEYto4?=
 =?us-ascii?Q?Pft0VYsjCx8nuYhcYNRSoHkwIPECqIMRX9vFGQSzGtCBrHcW6i6KnFM96GJC?=
 =?us-ascii?Q?yamlpsDxI3jhx4rA62eZ99YbMpK3g8TBmP/8Ftgmdsb9BvxxBmprQ4iaNGAV?=
 =?us-ascii?Q?l0kJaMtzhCqcQttI1CxfVbdjpMK1FXBskPzn1YxLguaOZQQydk74SUgJJIOg?=
 =?us-ascii?Q?4oMwJhpF0ujgoCjrMFTNPxpx8Voovtbz0NPD/iDQeCR09XxrbYqOantVDpZh?=
 =?us-ascii?Q?+80Mjml/Es0Izz/upVMe7L9DgVeyLD11vtlxh6bZLkpN7AFTBWGJVAgPUeBo?=
 =?us-ascii?Q?79jHKD3GUyQt186gmVUlIo1O88Rajm3VldR280N6KcrcmZdUYKXrsthy66XE?=
 =?us-ascii?Q?lQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rL6JyW0VA+ropeH/EHEkWuCThpktboSxn7BamzQbJ+vu76jfRPUPh8/ql+0Vs6cNudnatjiKSPzf9mtCvnMraQ1jrK9IgW+UTRWt/9EEFj3ayJKl1/D00zvgxhZi04ene7CUGmN82p4kn8croJpdHZTuu2/6YUIEQ+pBJzHZ5rDuTTyB9IgjB8V7OQGyEZNnRc87+9TeHb/rkcIE+ZdbXfn+LBN74d0SvVNK8SxDfE5Gw06PjxxzdWRJ7A89lfh7Tza/8h4eTOuBc0Zp+UWY0yI/EyeMmsQZak1aH0G5s1m1LNesOuRfsdXoGngp8MCeVTDmW9b/WUSYujzicbO8TktvLAjC7rdWaIrw/iGUKDAKXWAcjJkUTYnW7ssap9adelIKLFs8lXVvFYT4B2GvWfYsOPLqGEMV169VErnInsRJxwqxjcyg2JIROYyDR5roIq3whN6Uf5S3gGvtktPN0XuFR6d6ngDlR9L3JUqCA6Fn4NGwzt+kGS3gznKeK16J4bhnTPmLW8ujJRP8JP/D0wEu1VEVoUJ4xOnSGes6PlmfZpjVEqgYfZMmWdf3rQVxpV4MiaYVY3RTr8ogeygkzLotiz36gddidSCI5+5SyAI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae9283a1-321d-4e75-2333-08ddb7c8ca54
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 11:25:17.2987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WxjHh9ltr+pNhGcXWQos9LJXD4pG/EcRuEZlQttpujxlE6R3kcfanf8nKf69f/VYT1+E9Gg7bdbYcwGV0S02rzbqcwlQ+ETLmjx3H8qoHjw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7915
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 mlxlogscore=857 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506300093
X-Proofpoint-GUID: c-4j60u0KOyW5Z9ceTrbXQsb_HlSI82M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA5MyBTYWx0ZWRfX3/t4nqmEiYRh QieQ1ijhim0aUrld887+5PLNxVtkazkfFbmObtecABm6sGiIaqNVMIqnbrAzE5FdTqsSQjM676E xf6MOZIpuFcil8OWNYthy63hi9Usmg/12bnSXCzl17iUvA7DXhs9pq1JrfOnAQ8jb4C7AxnjtJR
 5/782ACWul4DiO3bgh+wEDmwzlVhLm2AZcsyyaqqfq4dcpje45XrZT9Rr/xW1nfnd982LMDseRF v+Xao7ca70u5ZyREyIRNcF3mtMgcQ5VZ+lmQ8lgVi1LcnXwq3LsgsTvLWyJzX2I3ir2v5F9r3r7 ZyAdh6x7rLX9gB0SlIY3lFb14qWS8XrVIYxObMS6EbzDpEfthN5VgsD7In154RFAqrs2UBTVi4F
 uQ9mYGzGU/J2MqmkBoc+xIKXylA983u++u2CPCgkltK/bq+YdNAchE175Nd4y5BpGIbbiy8K
X-Authority-Analysis: v=2.4 cv=D6hHKuRj c=1 sm=1 tr=0 ts=68627421 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=2XixvYKan0GiDzXaLgcA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 cc=ntf awl=host:13216
X-Proofpoint-ORIG-GUID: c-4j60u0KOyW5Z9ceTrbXQsb_HlSI82M

On Sat, Jun 28, 2025 at 05:04:32PM +0530, Dev Jain wrote:
> In case of prot_numa, there are various cases in which we can skip to the
> next iteration. Since the skip condition is based on the folio and not
> the PTEs, we can skip a PTE batch. Additionally refactor all of this
> into a new function to clean up the existing code.

Hmm, is this a completely new concept for this series?

Please try not to introduce brand new things to a series midway through.

This seems to be adding a whole ton of questionable logic for an edge case.

Can we maybe just drop this for this series please?

>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  mm/mprotect.c | 134 ++++++++++++++++++++++++++++++++------------------
>  1 file changed, 87 insertions(+), 47 deletions(-)
>
> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index 88709c01177b..af10a7fbe6b8 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -83,6 +83,83 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>  	return pte_dirty(pte);
>  }
>
> +static int mprotect_folio_pte_batch(struct folio *folio, unsigned long addr,
> +		pte_t *ptep, pte_t pte, int max_nr_ptes)
> +{
> +	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> +
> +	if (!folio || !folio_test_large(folio) || (max_nr_ptes == 1))
> +		return 1;
> +
> +	return folio_pte_batch(folio, addr, ptep, pte, max_nr_ptes, flags,
> +			       NULL, NULL, NULL);
> +}

I find it really odd that you're introducing this in a seemingly unrelated change.

Also won't this conflict with David's changes?

I know you like to rush out a dozen series at once, but once again I'm asking
maybe please hold off?

I seem to remember David asked you for the same thing because of this, but maybe
I'm misremembering.

We have only so much review resource and adding in brand new concepts mid-way
and doing things that blatantly conflict with other series really doesn't help.

> +
> +static int prot_numa_skip_ptes(struct folio **foliop, struct vm_area_struct *vma,
> +		unsigned long addr, pte_t oldpte, pte_t *pte, int target_node,
> +		int max_nr_ptes)
> +{
> +	struct folio *folio = NULL;
> +	int nr_ptes = 1;
> +	bool toptier;
> +	int nid;
> +
> +	/* Avoid TLB flush if possible */
> +	if (pte_protnone(oldpte))
> +		goto skip_batch;
> +
> +	folio = vm_normal_folio(vma, addr, oldpte);
> +	if (!folio)
> +		goto skip_batch;
> +
> +	if (folio_is_zone_device(folio) || folio_test_ksm(folio))
> +		goto skip_batch;
> +
> +	/* Also skip shared copy-on-write pages */
> +	if (is_cow_mapping(vma->vm_flags) &&
> +	    (folio_maybe_dma_pinned(folio) || folio_maybe_mapped_shared(folio)))
> +		goto skip_batch;
> +
> +	/*
> +	 * While migration can move some dirty pages,
> +	 * it cannot move them all from MIGRATE_ASYNC
> +	 * context.
> +	 */
> +	if (folio_is_file_lru(folio) && folio_test_dirty(folio))
> +		goto skip_batch;
> +
> +	/*
> +	 * Don't mess with PTEs if page is already on the node
> +	 * a single-threaded process is running on.
> +	 */
> +	nid = folio_nid(folio);
> +	if (target_node == nid)
> +		goto skip_batch;
> +
> +	toptier = node_is_toptier(nid);
> +
> +	/*
> +	 * Skip scanning top tier node if normal numa
> +	 * balancing is disabled
> +	 */
> +	if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL) && toptier)
> +		goto skip_batch;
> +
> +	if (folio_use_access_time(folio)) {
> +		folio_xchg_access_time(folio, jiffies_to_msecs(jiffies));
> +
> +		/* Do not skip in this case */
> +		nr_ptes = 0;
> +		goto out;
> +	}
> +
> +skip_batch:
> +	nr_ptes = mprotect_folio_pte_batch(folio, addr, pte, oldpte, max_nr_ptes);
> +out:
> +	*foliop = folio;
> +	return nr_ptes;
> +}

Yeah yuck. I don't like that we're doing all this for this edge case.

> +
>  static long change_pte_range(struct mmu_gather *tlb,
>  		struct vm_area_struct *vma, pmd_t *pmd, unsigned long addr,
>  		unsigned long end, pgprot_t newprot, unsigned long cp_flags)
> @@ -94,6 +171,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>  	bool prot_numa = cp_flags & MM_CP_PROT_NUMA;
>  	bool uffd_wp = cp_flags & MM_CP_UFFD_WP;
>  	bool uffd_wp_resolve = cp_flags & MM_CP_UFFD_WP_RESOLVE;
> +	int nr_ptes;
>
>  	tlb_change_page_size(tlb, PAGE_SIZE);
>  	pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
> @@ -108,8 +186,11 @@ static long change_pte_range(struct mmu_gather *tlb,
>  	flush_tlb_batched_pending(vma->vm_mm);
>  	arch_enter_lazy_mmu_mode();
>  	do {
> +		nr_ptes = 1;
>  		oldpte = ptep_get(pte);
>  		if (pte_present(oldpte)) {
> +			int max_nr_ptes = (end - addr) >> PAGE_SHIFT;
> +			struct folio *folio = NULL;
>  			pte_t ptent;
>
>  			/*
> @@ -117,53 +198,12 @@ static long change_pte_range(struct mmu_gather *tlb,
>  			 * pages. See similar comment in change_huge_pmd.
>  			 */
>  			if (prot_numa) {
> -				struct folio *folio;
> -				int nid;
> -				bool toptier;
> -
> -				/* Avoid TLB flush if possible */
> -				if (pte_protnone(oldpte))
> -					continue;
> -
> -				folio = vm_normal_folio(vma, addr, oldpte);
> -				if (!folio || folio_is_zone_device(folio) ||
> -				    folio_test_ksm(folio))
> -					continue;
> -
> -				/* Also skip shared copy-on-write pages */
> -				if (is_cow_mapping(vma->vm_flags) &&
> -				    (folio_maybe_dma_pinned(folio) ||
> -				     folio_maybe_mapped_shared(folio)))
> -					continue;
> -
> -				/*
> -				 * While migration can move some dirty pages,
> -				 * it cannot move them all from MIGRATE_ASYNC
> -				 * context.
> -				 */
> -				if (folio_is_file_lru(folio) &&
> -				    folio_test_dirty(folio))
> -					continue;
> -
> -				/*
> -				 * Don't mess with PTEs if page is already on the node
> -				 * a single-threaded process is running on.
> -				 */
> -				nid = folio_nid(folio);
> -				if (target_node == nid)
> -					continue;
> -				toptier = node_is_toptier(nid);
> -
> -				/*
> -				 * Skip scanning top tier node if normal numa
> -				 * balancing is disabled
> -				 */
> -				if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL) &&
> -				    toptier)
> +				nr_ptes = prot_numa_skip_ptes(&folio, vma,
> +							      addr, oldpte, pte,
> +							      target_node,
> +							      max_nr_ptes);
> +				if (nr_ptes)

I'm not really a fan of this being added (unless I'm missing something here) but
_generally_ it's better to separate out a move and a change if you can.

>  					continue;
> -				if (folio_use_access_time(folio))
> -					folio_xchg_access_time(folio,
> -						jiffies_to_msecs(jiffies));
>  			}
>
>  			oldpte = ptep_modify_prot_start(vma, addr, pte);
> @@ -280,7 +320,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>  				pages++;
>  			}
>  		}
> -	} while (pte++, addr += PAGE_SIZE, addr != end);
> +	} while (pte += nr_ptes, addr += nr_ptes * PAGE_SIZE, addr != end);
>  	arch_leave_lazy_mmu_mode();
>  	pte_unmap_unlock(pte - 1, ptl);
>
> --
> 2.30.2
>

Anyway will hold off on reviewing the actual changes here until we can figure
out whether this is event appropriate here.
