Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB8426A1A7
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 21:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746306860; cv=fail; b=madEj/naAyebAmwwR3rzBB3uNlwwRvu0Un3czadJaX8Ems0OTE/kyZKv860M86RKJ3JQQPZVbtP2I8dtaZyDT3d0peGMllIq4zYPZo3UfERiCLyiFo6CBD/24aeXW0dExGBDI1sr5TZqjyxnIDmIYCIKBNYtBwwVyYodVLPvnzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746306860; c=relaxed/simple;
	bh=N9VWcreQKIkKQlQxYTdQkEYZjvCMC9v9olqXlRWcwAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bKVpqmeew3NY+o01BPATyJCM4VvXQ0pHZ+Jj7+40kkfQef4YByQHnkVMlugMcRSNctPd2cn7F7UtCr4c9qq4IHJ17oG9CCmZCp54KyL2Q4B1mnPAciGxAUdsd6tPju/NwuxXKugX+KpN2BvvtSVBgtD3RY9z/3UTNOE/MeSmAmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TZOmtFJ7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=B0P75xnu; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TZOmtFJ7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="B0P75xnu"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 543KVB6R002900;
	Sat, 3 May 2025 21:12:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=UvUEHwgbvWvHdYKMZiKN9Ao8MJG4FEQMhAk1hOqsSdM=; b=
	TZOmtFJ71p0AUe9igeI/efV3RG5kBIMrCQ79sCwzJs6BPhzQYnkwPuInhfMEsGLp
	Eb1pJY+cvitcH24s++kYLIkLlSgQ5eOwWW5DBjNIKkvoGChVRDk9A2a5FuspL26x
	5RetpcHyX2eyeWNylrRGVA8ODyYawUojAaiwQSxqQYm6TGWFCPDjBfVgcKJmFFcI
	iz/Pa4icJ8MNIQFlP+83vpzE6HQerqinpsNrhybVhd4eCQSKQNp4VTYShK6M8Pyx
	l0cHL+iCQmivOie0VkguVekWZG/LOJVXnKKe6KDtbmPpq+po7Wke1XZPssRwY1Ez
	tzqC9kYGxHq96V1i0v0klw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46dsp300xu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 03 May 2025 21:12:58 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 543HQ1xl011247;
	Sat, 3 May 2025 21:12:57 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazlp17010007.outbound.protection.outlook.com [40.93.13.7])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46d9kcq2j7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 03 May 2025 21:12:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yeR531f/L1lF0u3X64AQjw2w8iZeCa2WvywGfWIOOnSiAQxaofAT5FXIAQTpEYOIRLi9wwZkZFcL3VsT/jEJreEOTgdCAF75qn+BqzwHd1nkCX2AeorovnalS0o1/HX42MrXlnp9EQ4rkvTp60Za1D+yST1A3hS6An1d0NNxhhUY6n2PmB40IlLQ1heDYqITAb89IIR+JqudD+IDY+zdmpV36eknUfNzVJVMPMqrDjfJ6CFr7S4KMOhsADSl35tGacIO9NKAQsLaz3B7wcNGgMy4p2ietlKguw3tGW95vJxI0rZQc4kLL9VLyYlzJ3dcrAWx6W5l4cURP32Fco4Ljg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UvUEHwgbvWvHdYKMZiKN9Ao8MJG4FEQMhAk1hOqsSdM=;
 b=hq3Z5NH4uU9lk5DPKrZ6YYYIAqDLdOdX/8/Wce9frmfBwF6JJSwBiw7Q5utIUKPSqXyvsn0FeDsp94R9fxMSGwV8sJ/MrFOwkuRST7NU9n0KYYBdDWTg/nXNRsLrcppd0+MyGgkWcni2/IePan87GAPeIxf6BxrFnO4mVDymCVHpcmHTvWKo1UPtisCfhmdEr3p6J0utLfat0yle838QirQ1lHtQHEWlp8CFsAy3ifrTboN0MDL2VTN3yZzOx9N90OEZ/H6eW3wtY7y4UaqcuvPEOtjnGgP7h/LorpKEP056VGONT73RhDe95eqY6235fx+4w9QjVmI2dtGTLUmLkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvUEHwgbvWvHdYKMZiKN9Ao8MJG4FEQMhAk1hOqsSdM=;
 b=B0P75xnu/Gjj2zOu/3D8hjDSJ4xQVAyCz90tBX/RMyZAVTd+Nb+pwvEKyz6i6+acjgEOECqXtiIKfydwWCk9UMWiMbChcRR3CDJznYLwsiwjMK02yJd05G8k9g5QtrJ6oTU4HMLKfpBwuzPxRj4C+kY1KSx3UypIsjn18yCsJeU=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH2PR10MB4373.namprd10.prod.outlook.com (2603:10b6:610:a9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Sat, 3 May
 2025 21:12:55 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Sat, 3 May 2025
 21:12:55 +0000
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
Subject: [RFC PATCH v3 04/11] tools UAPI: Update copy of linux/mman.h from the kernel sources
Date: Sat,  3 May 2025 22:12:26 +0100
Message-ID: <cc77e736d094f9a694d8e04c02f978f04415596b.1746305604.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746305604.git.lorenzo.stoakes@oracle.com>
References: <cover.1746305604.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LNXP123CA0002.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::14) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH2PR10MB4373:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c3b3407-b5e4-4d1e-2e95-08dd8a8745e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zu2akdN+odVy74y+6FJMcF9yJaAk5nJhfHofAj9Oqz4vEt8BtfYB0ObbBvtp?=
 =?us-ascii?Q?Gj/zfNt/f77snXjgcXvV93qvJakenJEvMzQGX1124qpW/urRcTSe6Xq4b/zp?=
 =?us-ascii?Q?Ex0AY51ld1mlHhXX6wCH3R7/U8RCbZ/DdLpgR+y0OYbf0wt3DrzmX0Wwf8Do?=
 =?us-ascii?Q?x2Ml6HVph3wECSg+lQzGcuU+pABsIFJ2lNzg6wVkU2NwMhmVOoZbF+VhWVfK?=
 =?us-ascii?Q?sQHJTi1AJ+ZyXKv+voDN5gv3TLAMuMb0+TEwgjMxIevwv/OVrvaEJaCmZYXj?=
 =?us-ascii?Q?z/KSHImFYKjsGN//XQxHSMy2h+tx45J09y5TknRLlRGg1L0swWRO13mdWs0U?=
 =?us-ascii?Q?rXa3bnuoP9e9Qw6rlZZBAeAPz9TTBfmGoWizmqMv/vgLx9fdxAlJnMOa4mh8?=
 =?us-ascii?Q?W0+YZklYGa5DkFFLCMRCeov5P79/oKAxNBUVrFintELAbMia84yM7XX8bJUC?=
 =?us-ascii?Q?/JlGWl+UYGrsxXewGKgT5Mftk5CukQmofWtYdQDKxf9mhzwQPMxvu19juGkR?=
 =?us-ascii?Q?tNiShVLSfef1Zqu9mILak1W6rKzASNZ3Zmg8FcrqfsKGBt1N54qfGZnEL1nk?=
 =?us-ascii?Q?h7uEVEP9YaW8ABfzTxVXZW7fsSiUsAVSsr1N7fEStGQsJ4hl4EUREAjDmyE4?=
 =?us-ascii?Q?wXjIucg2lfsQPP5Ld8olHBfd9MIMf3oal/gOBgPDv3HDcGCbLakcDGW+i1eg?=
 =?us-ascii?Q?4sQBRvtewqFlZoG+U8C9FpXWlUErm3fa0qA1khtUE4LFrv9SVuE5mSQYt4Cd?=
 =?us-ascii?Q?u6CmrmdKmT/7IUAkTvH8rfJe+vK/e81BzLiAzmxVnpTr6EGPC4SroaRNFssE?=
 =?us-ascii?Q?BCyGUgZ3PTZLZfTV8GynptU7OZ91OfECD+okgXMW423whwHMWanAcl92b3No?=
 =?us-ascii?Q?I4yzSCiAsLKMEh9zGCGBEDQutlMFTLAzcTT3jJCN3chcfhWuczar1LHrlLiJ?=
 =?us-ascii?Q?I+BTqQ+gt0E29qeoSdVGfTp0OAn+gIL2uXgjJ7f8ryDgMNwBSKUUfH+oaOMx?=
 =?us-ascii?Q?emStOBLpSnyEXWWwREmOsr6FJCUDqTFyXMV6brOiKQV4ACrQnfcq32FaPaiV?=
 =?us-ascii?Q?/Uze1wfNzjkYGtFI+ADKmaPI+KmNCIpRqq7nQlMYgTOq+iXBp4p6IzPHxh48?=
 =?us-ascii?Q?EB74/LCjS3tE4Hdqj8zSn6kvLV1UNkQFnOjgkUmkk2+vcDtFYB+CLQbiBtAi?=
 =?us-ascii?Q?ZGn+5alGFV0mWo/9MHDfA26ZAuKn0WKDTk58EUdIdK/5TVdZfwk2C4rzMkut?=
 =?us-ascii?Q?um/CKZ5CLrG+b6kPbywsJLH1WD2e2cZr/l+8kvHBE/zEduPCcmpREkO8yAD1?=
 =?us-ascii?Q?z/Xvoa9X6+HjrTReuhlKSpCBcRo4hSQ44W/OjHBDNm/bB6UQGh98A+nqCq+H?=
 =?us-ascii?Q?bH7SRtmPyFHtRdEQivn1FMP7n0eLFuvzjgpD4xj9r0VxhPlyUQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KTRqnEb2iZjVgtUMEuX95Es3+8t1uTzvc4mYWD3vUCeSoh8ihpDcZ66xMlTy?=
 =?us-ascii?Q?c1u7JMURn+7oJ8DWTj5JwNPd3qDuXKI/m+0C3xCF7Kg5XT1Nb0egN7YAOI8p?=
 =?us-ascii?Q?YILtjB2CIwTVdiNWRz3ULYrB2ALZ6RrSNN4c+DOIoZ6Bh+GiRG6Eb7fsi4/M?=
 =?us-ascii?Q?9LfevX/9Ht9qpBE3wnPRT3UiSXsXswxDiTPHnhFJ5Pie9i9M4YjpfS4Psuky?=
 =?us-ascii?Q?rMTw4CrEKcCziC8tyN+D7snCLRsi7mF4BV/BHblYJJ+zVClmj+pvylDga4AT?=
 =?us-ascii?Q?O0sQe/X2zUoB5PbZHk9ggHSAbCkMTsIAb6vyaAnCz9hdbSi6dqBUuruzIiAr?=
 =?us-ascii?Q?eK0LPogo3oPIhhdSH6DJYpfo9ei7bRQpmwto3n9fp2+uLqlAB6kvyf6Er+y7?=
 =?us-ascii?Q?uqh4parziVBPpilbKY7RfmnFTtcx4M6qcEvcmsUORy4aKERn1PwLoPopdmNA?=
 =?us-ascii?Q?7zc2Spv1iOK7t0Fh6CKb3KwsJNzpsqEFTuT63s884nTg3jTT4ceGxKbIGMKC?=
 =?us-ascii?Q?6EH4xxtFKFHeCAKjazneF7Bi7Jkao3oAeoTFT4t0zCuAZF7A35ze6gJn8zpt?=
 =?us-ascii?Q?keWYqbIl/yDg2V5Nq2w9AUmLVtmkuRF5VK1l9Lq67QP3K4X1iuMqUo9VUlv7?=
 =?us-ascii?Q?0o7NmCTCWCXZLqieuIxkIFqfBrS9wKZ5bakgo6huLmsZIkRKvTgomivDjwWL?=
 =?us-ascii?Q?6OmmZE+xQTNdDqbTIWxmergCMnXZY5MY2CdxFW3rEJq58eQpVQP7dTXFIT0C?=
 =?us-ascii?Q?EYZZFfzUZbtldzOEUc9Lgnjgg0dTNuL8r4hMVJfryjOhyN2ip6pPp05tPheL?=
 =?us-ascii?Q?5xXWXsKvAZO3vKsY0o8dXEnYs74fXIfG/VPtMPYFZ7ENBPNH2OkoQyFgSPcM?=
 =?us-ascii?Q?2cQM476JoVp0BBJXw6n0xs2/JOESS86aB+CODVj+9fZQsYr48lcu/1FuO/Eb?=
 =?us-ascii?Q?odMrasdBxFh5/p6WYeeXvgjkacS33X/Y5FtD4+p6mWUOIlQFQ7/Mn9HJTCxQ?=
 =?us-ascii?Q?/XPH6MYHyjRcRRftkeQILhkbvR8wNM7P6CD2grgvodPO3xbuFODyAin950Sh?=
 =?us-ascii?Q?oSe9ccb0EoszGcbI2fQIzewauqwwKbdyXklo9DHx9YK34on9ocYWQ9GvlhQ8?=
 =?us-ascii?Q?6BC+mCMkwmJCKJPsV/m7xzR+0e3C7i9bmtBwLY4KRgJ2wii5CkKkzkbYEJvr?=
 =?us-ascii?Q?x5dkmcW/ZwUdaPADJXZVY0QqpQ7UyVsSGLdnzwxY8ysfdCRYM4uZYRiBYQJ2?=
 =?us-ascii?Q?TK3C4i+DQkUc2Rr86GMpcKlcgBSDzYCt2SJqvT0yaBZLtWkbGHW2Cxi77+Ut?=
 =?us-ascii?Q?uS+IgOZopym5B7bKdkPU9QOk5oeHpkUv/zTS7nX1KWCqDAtx3tbnr0jW48SG?=
 =?us-ascii?Q?AxLttA7WoPZl7mToEZfFwVuXn9ZCu/TKuyJvqkwH1UJXOBvcAkBsc7oWePBX?=
 =?us-ascii?Q?FkFTIDVtq7W7MWX0Nmj3t09VwN65GDbfFCVq3KXfm3b2VK8nBRPsoQ49WK40?=
 =?us-ascii?Q?7h5prIaJs1Vuw3o9cYXoNYNjVTJN8RyOONcpLivuUVbOcgk65btGT1B789/h?=
 =?us-ascii?Q?auXvYBRzoepWDHtzh583x9+Nq6QRfyfZc9Q0uEtLqwwb6r4Ajw6WQpfFVGp5?=
 =?us-ascii?Q?7w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sJ3MJAfB83uxbTmpDHyhSCbg6e3AOQmt1sW1rbGBGB3DnOVe0bPBvMWWuye6I8PElf4CnHNT6H6Rro7Ri7IrFF00nECaWYzhwq/2kCehvAqN0Nq5mOi9lATndkKeQqd2/gfWz4C2a+fq9F3idrlxgEE7jPxzrTPp3sl5OmBQqTER2YUINqFxizk5ocrrLPX8AiMDJ67iaJw8a/qcwz+pz32Uoav95iZ+AJ4gF9kwP1oQf9Bhbtv/VMhcOux8ONULncbPp8y+49hRgInwgcYK9gfTqyRgGOvl1fet99VPHt2S1DHnI3MvNx1rMghbTUOp+IOnrXjET/Djf26Lu/sozZZlB+6smEGjmWY8meqb8aPjVjt4yRwgZ4yWRpR/wSFy0btehDmRDrImG4v/LgmfQc5DdGcGjovJE17QLbAtfFO6PawM0g/nXOmxbc0GEW9tDsKMeDXsF9IjmQO6xBNx71ngUZBuX0NzNqm4fXbE2J2dyitYCmGGdGNRNNgvEdw6xzynsyPsMLyL9Sy5rfzkV6auIawxfymnMvhkdQqdwTeT/B3PGufRSgUOTP8JajFmHEPXGvOpBBBQTxtJtimphUEBBTAYteIXwuI4U/k7ONA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c3b3407-b5e4-4d1e-2e95-08dd8a8745e3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2025 21:12:55.5106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hw9Vwgu1BEDNvruQhK/gqmpGva53pyZ2aJ2OEcJPQCRK7igkcg53Drhg8y06UqLnrJ0wL9QwcHaRpy8+AUn9CdcsiLI5lm2lNJ9Q1FzGZXA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4373
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505030196
X-Proofpoint-GUID: LvCBV-6zkbXedAOe_PUh5eBz56uBH67s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDE5NSBTYWx0ZWRfXyNT9roKvW9VA 9DW+UbtoKo25YkP3eaPoZMXlJyotJWSzsRsa7gkK45b7qnfqEKZGFOeIxQIR23X2pzJU4lmF9ol YEmAYcrtJgmDPazrpHhiNR7hf7dqpqBCwdQiBU89fe2BtCuPpR9dO6oHeLG8jhR7E07u3aRZyKr
 Kk16H6XNH5hn2qSYGG5z0Lf8FBkJsaNVlIoPhzY5itjwzLaPMolqxckTVHWXhvIqvhl7OvycXf3 E3LJAfHmOaOCQTuISaDhLAv4NGzbn/lQV2Ckr65KFt9lvkKv4vpEE8Py1vVEOmO6jRQLpn61JPA K3OIDCpf+9rstXmLPgSRjug/Z7vH48ITjadenRiPTnWF7XlUOpfWvq7D9Oal/zdePt+XLiHMkHj
 yLOfwPDZ3kFHawjFxFO1WosI3NwvUSsQwyNJ7lWzM9j+zyc+mAv3X5ngXHQacNoN3i/JiT0H
X-Authority-Analysis: v=2.4 cv=NN/V+16g c=1 sm=1 tr=0 ts=681686da b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=I4nLmWgRydlkl3k3lWsA:9 cc=ntf awl=host:14638
X-Proofpoint-ORIG-GUID: LvCBV-6zkbXedAOe_PUh5eBz56uBH67s

Import newly introduced MREMAP_RELOCATE_ANON_* defines.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 tools/include/uapi/linux/mman.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tools/include/uapi/linux/mman.h b/tools/include/uapi/linux/mman.h
index e89d00528f2f..a61dbe1e8b2b 100644
--- a/tools/include/uapi/linux/mman.h
+++ b/tools/include/uapi/linux/mman.h
@@ -6,9 +6,11 @@
 #include <asm-generic/hugetlb_encode.h>
 #include <linux/types.h>
 
-#define MREMAP_MAYMOVE		1
-#define MREMAP_FIXED		2
-#define MREMAP_DONTUNMAP	4
+#define MREMAP_MAYMOVE			1
+#define MREMAP_FIXED			2
+#define MREMAP_DONTUNMAP		4
+#define MREMAP_RELOCATE_ANON		8
+#define MREMAP_MUST_RELOCATE_ANON	16
 
 #define OVERCOMMIT_GUESS		0
 #define OVERCOMMIT_ALWAYS		1
-- 
2.49.0

