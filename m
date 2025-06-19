Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EDC23BCF2
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 20:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750364847; cv=fail; b=UgcY+TjnPkPPkLf81hsVwWUgSzqTTDGnNyL2Fw4Uttlo8JZqdrEIK8WXktYJtqtqe4dc3O4y4mRirNoehiQLl2zU5CoFr8cyBZlO7FXO4Aqs1hDBy+RQbDsJVwSmdO8TW6ZHOBjmaayu7fpTd+8NTFf+TeNATXKZ+mdjkV7fR9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750364847; c=relaxed/simple;
	bh=KGqFFyYQ1QsMxyzWDF+W2JBxmigGZmBp3ilN/AJDN/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Iheatiqsd5wwoCXj0G98th55rBG90PA2+c1L9PnofeVChAMuxejwo0I54d6PjlRWvQCmzUX7sIsLxSd3Y/wsomcPUgZzyHEiqTv3Sub7bnPeM91MDiPoYP5iB7au1AXwxM4oi+px1XH49TkQA7eXsDDO/LMX4dwgaNRPC65yg80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QgzDFFUt; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=D6fxJ/Qq; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QgzDFFUt";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="D6fxJ/Qq"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JIfgMu016807;
	Thu, 19 Jun 2025 20:27:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=p7R0fg4+xqLDcTdZ58xDYS8x5FJINy7YkFTN1rFRqjY=; b=
	QgzDFFUt0IFbbNhvVYvHzW1xYKR8XqvYjHqE9wJfnCbV2WNt3u5/6E4XlqBRJRcQ
	P+2ONzlFCb9aT+fS0NboE5FaqMkEfQS38PrMc8MastKZdkVC+/KjOA0v3MQoLXVa
	ejiSlDzN9l3OsQaUBk6FHoSLUUmmLTMYjXR5rg1xHl/buXUpnCzZ3DVC4lvXRLNn
	i77sw1YwgUJ6IUjFMbm/8X+96SCXZYAVEigOaHF1CULggvnReOIPcTgWn1e58Lb5
	cA8eBgbvLjNaVxmA5yaqSoZ/yLM/Ls0iLONdv+z6Q9LwYM2n8FtBV+36MXOnN/ua
	61pOXwRjDu5uU/5NRyjKcw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47b23xx221-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 20:27:07 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JIeTtH037480;
	Thu, 19 Jun 2025 20:27:06 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011016.outbound.protection.outlook.com [52.101.57.16])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yhbywv3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 20:27:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gUA3nmAbF8sWT377Z6CVGFPOcWGyZ8N9F38QhCdFok5f52kSbCy0i1xDa6bZe+S3ntlq3hb0JLMUb/5Fsa3/lgw/JalCb3yyg8B4tAYo28TzRx5h9muZwdqAnTrNjVqLAXJLZp8z7kQpaC6W77svPLq+ridIlhBnmcNhDoP08IABgyorUdXmMy10PgC4rsQu0GJG5YSPCqdi5HriMbsNgnci6+7m88MaCNRbWm+VaTtNblO1zwiij7JxznEPkNFedTv7IJRbhgyPMaDXKN0d8mtW9K/CpRwf7Kv4sgOYnhXwrNiBGHO+0uuRPWPwtv8hqUPpR8ymM5O/do2RY989uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p7R0fg4+xqLDcTdZ58xDYS8x5FJINy7YkFTN1rFRqjY=;
 b=WRQO0+jLNWV8tFkNKtOtcJtxVFmxgDL2zlW7higAKZbJJjxD8GETXQZECIhpbeUkudVrpzEJ+D8/Ma+9YfgiHWe+FtuEA8SA7sUb2+6d7XA1wGdX4YfoYLxXxqz7JnFv/s3KL+ivxl4wOMesDgWhb0Pa5bGAtKxZfmrUKZnXfwEP7eRNUnjWTSoCXhVpHlfzfglc8l+rhaWRyvHYFTIiSwxdJd55c/MevGZu/UCG5BAiL80dHsBs2Pf38/ogoB4vkvcxkI0hCSzb7alYFnTDJYWZLK1xXXa0El+g2WMui7hT7ut22y4gCBgLDXNU2Ojp/FIAbU1jO4uwgojuKxfk1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p7R0fg4+xqLDcTdZ58xDYS8x5FJINy7YkFTN1rFRqjY=;
 b=D6fxJ/Qqk1Y+17+lFyIw3GgnCWgcFGlL8v6guX2pJeaUA48b9pizTlAUmqbLNz+faMfYs4xU+KEH/NlD5R26VChUNjcl/WXfYYyTrE6YUdsJx/YZsM9eSpwcLyhf1CsdlY48SvhqZ6dC0WAx6VDG1jv7J3t5RIxG8/naPErFojs=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CO6PR10MB5791.namprd10.prod.outlook.com (2603:10b6:303:14c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Thu, 19 Jun
 2025 20:27:03 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 20:27:03 +0000
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
Subject: [PATCH 2/5] mm/madvise: thread mm_struct through madvise_behavior
Date: Thu, 19 Jun 2025 21:26:27 +0100
Message-ID: <1be4352e1d414712e876cff4b5d982cc24dc7692.1750363557.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750363557.git.lorenzo.stoakes@oracle.com>
References: <cover.1750363557.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0092.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CO6PR10MB5791:EE_
X-MS-Office365-Filtering-Correlation-Id: c31e543d-7cf7-4378-296b-08ddaf6fa6b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4qrH3DhmBb0PatyLMu5rGHqvBxIUDHUUhYv1JHWOCgkFR01UwRwy9JfEnoWm?=
 =?us-ascii?Q?ag3u5uK3LlrI6v15rtBm7stpr+mnHlDwSyXdJQGJpLTfcwuFwKP+aXgnNMPM?=
 =?us-ascii?Q?h9UA+muQUS/5hZoxc49QhcVMF6UB71yb52NoCdVa5nxUQyUEy50SXT7hMYh4?=
 =?us-ascii?Q?9mQuHbIVyj5nT4sO4quUNFbdF/DkbMqoxrHKVeHr/F43SU6jB5U/lbRmKPBx?=
 =?us-ascii?Q?/uDDAD/Uh8g6DTcIi8k+1CGBiuLpHNTB9nbTaxDEAIP585CrQzdOqNDaXyFf?=
 =?us-ascii?Q?zMs+BzjGepbjIN7Gl1YT6/23SFugHjn+r23Om+GGwV5QCMpipZpPtvicToSu?=
 =?us-ascii?Q?8MMjhb+i8Gg+rVToN+zcVVd/a2gaofKaMWpcCQdiLNhMdbQAfNjfOcUy8LVF?=
 =?us-ascii?Q?zfpiLgg4FRgwlm4XYVpu5nAZEG/ewKYzY5LaOAlAbfF3SUIaxMT10GZS5dFB?=
 =?us-ascii?Q?BEvKdcmgzQQGHnkO6p8lo9FnA5pJFM3WK9HNmBlXkxC1mxw/eoAQXbt0E5zf?=
 =?us-ascii?Q?7LUVBMI+WFTza54omAXgW+hgw1W0pKQLJTc0aY6nztQ4OQC7Ncu1AuCYj3Cn?=
 =?us-ascii?Q?v+Ymfh5tVSORJ003gCkZopNjms+glNhNsEzbbrJGw2SePKD+MbMgH6za4596?=
 =?us-ascii?Q?J9r2eqAeC2lDFL+bnkpXwN84kZt3dxwkpdOlJRKvwXt0yyeF+tkDBMuqwwXe?=
 =?us-ascii?Q?MZuOkmiwo6X9FFBiIcRp379ainpK+sxeOsWjjhZog6676S3n9ZQVRn+oM8YC?=
 =?us-ascii?Q?z1RMzvTrCADfFiCMHBRKJi+NaTetbHsjaVuzDdrzzM6vzsuUv4yoS1RHEDOT?=
 =?us-ascii?Q?oZoE44bDgBn0PZOM5f30Y1wdJnfhHtysuPGPeIdgoIt+h5r2+IXjcE6Q1ETx?=
 =?us-ascii?Q?Miv5GIQ30NyUgciHqMzl0J9uf8rN/z7zGUsaPJFP4iohIxbX+EuEv/yZV511?=
 =?us-ascii?Q?a+frZ+Ozup3WNVh1oRcI8LaN/UsPnhrj0AP4HbvkQUDkxnKGeckucVxEIAc7?=
 =?us-ascii?Q?Mv+jtJ3NutJBIrK2Ps13o5Gk7XnIhBRLZJGogypZwubYRH400lxtanFTHnNL?=
 =?us-ascii?Q?YQwxwEDlKY2qz5OFQEpNd4UNuA+GsnHgg5wbLGcvifCDegjoA+7DgqWeit1o?=
 =?us-ascii?Q?4OlrtfH+pqpZAhuP9/8L4gjUjM/L0Hga47Oplp+7HyURQRaRHBfoLMKNFILi?=
 =?us-ascii?Q?noXqthUKDK7ziWYgBztKdrxb5ridv07yYVLptk8egoe6iDdnIFBdvcDXU8a1?=
 =?us-ascii?Q?6o7fc/xj/yzxVrtcVIvgwbxXsbp5EDYcT0pzAH7LV1Z3B3Ai7IjLcTIevvxb?=
 =?us-ascii?Q?NxLtVB6wOT4MGS+KEJ2wlfTlxHUat2xLBDc/GGXpRZasEIEtaA8ZGdewDGm1?=
 =?us-ascii?Q?dK/1XCEDmUGgePUTFmtIXZQMeZYm/Fx2wRFlnCbF4gID5Ra5K/+6DOIiOJgO?=
 =?us-ascii?Q?w1dn6NHWQ4A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KgmObhJxpCC0jQbg8s7/g4ksJJvNDIK9TQxY8bIjNHTzQ2iM0tgtqe49bdss?=
 =?us-ascii?Q?MRa8FBFgYRESkjf92pVVOO+kZzOVxc6jhXjC6bJOBstu7ddR4rnS0OwAUx8h?=
 =?us-ascii?Q?A0/SZonGhQkU7OIu1Y1Boia8qAZ+KN+dZ8DGvhFJD7VLVpLwP0mppF5/OYou?=
 =?us-ascii?Q?oHsKxX/zuSkir7iwxulmq1DJDLmo1FiiCbBOMYi6SRCbDqab9Bu6ctDjUS7f?=
 =?us-ascii?Q?CtkZFnZjD9LfwmK8+1Bmjr4CuuK61U4xpHzyKgcM8NJXpnsVpzz/6BgQML/Y?=
 =?us-ascii?Q?TeOBX0DcomXU0jnurwB2PHn6w5PcPg0ADtX+hjis7lUvEhtm3/MZvszuqhSH?=
 =?us-ascii?Q?1D4L428jYDrALTlORVNXYRaSTA3Fb1jSBOVSrWmcVyU3cCXkzHaVJTKUHvoi?=
 =?us-ascii?Q?zc1QRVjpM5lNp8fLpsnnERnthsDWmci16ORTpQXnvggN0wneNNiAy96jUbXr?=
 =?us-ascii?Q?gJiUxIg1mEjFMf0ogoeW6R2BH+orRyZuVPyTq7UTjdzeEhY+jGumjCRC/63c?=
 =?us-ascii?Q?2EoiL2fJ16PHVA6Y0+Dq2BRKW26mUZLsl8MQtLBwP5PSlvh4rAnfLgGJDoCb?=
 =?us-ascii?Q?mxtbv/Vn7qwPQshXGWmZsG2+wJ2/rzbElp+yigjxkSSO2YJDMKRAhZeji/dZ?=
 =?us-ascii?Q?E0TrR3cl9dicGpJ1entpRvkMoVb7kuoOthm0dyPmnbWT4JzSiIfm/SprXDzk?=
 =?us-ascii?Q?FmMKAZP8DJaryxrjjMphD4WsnsobgO8hetB9LxfcEwIcwxHs8mKH/TONgoCX?=
 =?us-ascii?Q?4eHVBGfl0QWqYP4TMmhekx+9ZB6H+ff2osfq9+FctYTV7STC1YeI05a3SV06?=
 =?us-ascii?Q?p/S54goJXXU5VQtv8Yt0hawggSzNw9gnJRKukCmGUEA8Cup9YiEN0ZxEry46?=
 =?us-ascii?Q?zCsLOH3DcwOyFdyIRnEl3vWvg40dsHc2Fz+np09ehWV0bf7Ca890exDFneIo?=
 =?us-ascii?Q?O3bI4Sz21bgJQPzigQiFH2ps1FYxPLUaj/nM+4onsLztMUJoiGb4DYb1gwaz?=
 =?us-ascii?Q?8mrk/qrf4bHTjj5SLPQlZokem9+AQJFhijGzhkKwn2aDtBuBuQKtKXNY3rZz?=
 =?us-ascii?Q?PCKNOzHTJ67olTKiHtSSFcIAgQsVCLikLCbqoOVx7Dp984XiaM6RskXKdwDH?=
 =?us-ascii?Q?H3FtNJQfSba8+yj3WjYdLUiLdAoDRjFFmgJgc6fqq28DdNu5tO/tvQyw3PnT?=
 =?us-ascii?Q?gNn+Qa5i0UBxK1xY3XhObCGFRnYRt0Awog1bJllzBFJ0eeUeu9KqzpqZIt+X?=
 =?us-ascii?Q?+ldRtp41nueBR/Hh6RFW/ELsDhtVUgI11qTuIkOmB5BvqRnp16RevW+KQcg1?=
 =?us-ascii?Q?uijcBOyetEmKIkisKgu7J2nhWuFggXUN+qnvF8k/iZjiEbuxpUpwo6x1AgJ+?=
 =?us-ascii?Q?zooXX4w1az8nSw+0eoF08vVQNEXOdRRpeiMJLIu08VSVCN5PTTw8WyNYipJr?=
 =?us-ascii?Q?yABpDlX6ME/bTnG0c/Qo9Ts6xkAntHdNQWT2ptj8CIgVW4ANrInprjSU4d/s?=
 =?us-ascii?Q?8YO9T+Yp8rtMwCt4JDFbdisfsBr+H1u2E2ytA5OSZE/go0Z85wjhjAcTR0WH?=
 =?us-ascii?Q?/0AIkZGnW1KGOydZEEFzzQurIVzhRBBsXgk8a91vAeCSvky6vyR8Th6T87rC?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	l5x4thKY0XvG9TzIDJj0kbqWuUEnacMMPsCUkgaY6d6M7OhgWOWUIdg49kQZAk6aSZwOdfabe/pnGb9U55MKzxPVkK5/a2ANOvCRXFREyv0ufbHw4DFnmf20WR07LaOAeN1ZtuUmjheRSwZd40hKu/uSNV0vQQiBYuPnb0/+vnQX02lQnj3dJFf61zdW8jBTTTFQPdlrWnI5cE3Qr7/l0YnzAcuXKZ+SzWcae55dcGNQmNqMqSaWamSM/hPAgeh8/aCikRdgqaTFZaKFD+NtLWVwZp3q86vw0xvMd8MSahWTWtNGfIqWF4bFi2RA8mL9VQtxKIQc4Wp4Nc/xoTFqOZid4ZzD4QRq+xvpkdLMxdi1sdp/15hdlrvy0nzzaS9fwcUq9n8+MPovOmzGAWA1zID/22ifB32PGOMcHb4+o/g56KlwanJ5J6h2TO9j8tRjbarxePf50WwmzrVPso1rasltY8YME/UT9Ix12FQn6qUd77Kh7FNCcSwolVh5aOfqLVNQtcSRJhb6iVdVIkOEOB/Q2bnFloaeFslvLOUymmqwARtHW7r+nwCD/Zu8ORcsGqDsk8qTnlJtobDI2mDAVzFu5paTx/3/pPN4Neh03w4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c31e543d-7cf7-4378-296b-08ddaf6fa6b6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 20:27:03.1315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JBz9CrW8g3NWFQZwqdV2QGLtYaEY9LbeGS/52AZOX65nud5yvefuK0IIDmP2XAaFV3POAHddJwk2ChMMa9TxpaZYBu553hU29HCxXmqKIEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5791
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_07,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506190167
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDE2OCBTYWx0ZWRfXwST1/Hw5S337 C0vttWXKbr3ccbMnrH/IEuXYX4bpD37bntR2UfsFUj+lj4d5LKJvQPpgAveI79iFDk4/KDS75uE r/IlwyyS3pqijliezOFGxuaUEoBLjykCy3BYMsxrU7M+IdgNj+IOWSO+hS+npfEXzeu82ukkwcR
 DYtnh24ABxdHyVkaQ43+aOJTKyDVM5Zu/LXkdm/3prEYrCvPd6vIJKxeyawwPEz4I02Pq0+Gfry 1fr5534bMCP4c9o65DT59r+8kjEQfpaYJ7vB9O6QqHF1fCDizwVK/bL2NTwrOvLwODO4deT4liJ YasPYKruA9S2UcT9unn6FvduQ9L+/L4VILnLbhd3TkN3ac6scTSsbuGpMiiIznQdl6gOvQnPjEE
 DtiTQ3KPa9nbj6AVLuKH0/oVWZavoRGMAUk9pMP+rO32x+zRRMpNVfx7r2R4+VaqH609C/8L
X-Authority-Analysis: v=2.4 cv=DM2P4zNb c=1 sm=1 tr=0 ts=6854729b cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=HdukbOKCL_F7UDQY8x4A:9
X-Proofpoint-GUID: aVrWkyxuIm4-rrgv-MZh-0bITpD9XxV9
X-Proofpoint-ORIG-GUID: aVrWkyxuIm4-rrgv-MZh-0bITpD9XxV9

There's no need to thread a pointer to the mm_struct nor have different
functions signatures for each behaviour, instead store state in the struct
madvise_behavior object consistently and use it for all madvise() actions.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 mm/madvise.c | 105 ++++++++++++++++++++++++++-------------------------
 1 file changed, 54 insertions(+), 51 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 9dd935d64692..47485653c2a1 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -59,6 +59,7 @@ enum madvise_lock_mode {
 };
 
 struct madvise_behavior {
+	struct mm_struct *mm;
 	int behavior;
 	struct mmu_gather *tlb;
 	enum madvise_lock_mode lock_mode;
@@ -66,8 +67,8 @@ struct madvise_behavior {
 };
 
 #ifdef CONFIG_ANON_VMA_NAME
-static int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
-		unsigned long end, struct madvise_behavior *madv_behavior);
+static int madvise_walk_vmas(unsigned long start, unsigned long end,
+		struct madvise_behavior *madv_behavior);
 
 struct anon_vma_name *anon_vma_name_alloc(const char *name)
 {
@@ -126,6 +127,7 @@ int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
 	unsigned long end;
 	unsigned long len;
 	struct madvise_behavior madv_behavior = {
+		.mm = mm,
 		.lock_mode = MADVISE_MMAP_WRITE_LOCK,
 		.anon_name = anon_name,
 	};
@@ -148,7 +150,7 @@ int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
 	madv_behavior.behavior =
 		anon_name ? __MADV_SET_ANON_VMA_NAME : __MADV_CLEAR_ANON_VMA_NAME;
 
-	return madvise_walk_vmas(mm, start, end, &madv_behavior);
+	return madvise_walk_vmas(start, end, &madv_behavior);
 }
 
 static bool is_anon_vma_name(int behavior)
@@ -1010,10 +1012,11 @@ static long madvise_dontneed_free(struct vm_area_struct *vma,
 		return -EINVAL;
 }
 
-static long madvise_populate(struct mm_struct *mm, unsigned long start,
-		unsigned long end, int behavior)
+static long madvise_populate(unsigned long start, unsigned long end,
+		struct madvise_behavior *madv_behavior)
 {
-	const bool write = behavior == MADV_POPULATE_WRITE;
+	struct mm_struct *mm = madv_behavior->mm;
+	const bool write = madv_behavior->behavior == MADV_POPULATE_WRITE;
 	int locked = 1;
 	long pages;
 
@@ -1422,15 +1425,14 @@ static int madvise_vma_behavior(struct vm_area_struct *vma,
 /*
  * Error injection support for memory error handling.
  */
-static int madvise_inject_error(int behavior,
-		unsigned long start, unsigned long end)
+static int madvise_inject_error(unsigned long start, unsigned long end,
+		struct madvise_behavior *madv_behavior)
 {
 	unsigned long size;
 
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
-
 	for (; start < end; start += size) {
 		unsigned long pfn;
 		struct page *page;
@@ -1448,7 +1450,7 @@ static int madvise_inject_error(int behavior,
 		 */
 		size = page_size(compound_head(page));
 
-		if (behavior == MADV_SOFT_OFFLINE) {
+		if (madv_behavior->behavior == MADV_SOFT_OFFLINE) {
 			pr_info("Soft offlining pfn %#lx at process virtual address %#lx\n",
 				 pfn, start);
 			ret = soft_offline_page(pfn, MF_COUNT_INCREASED);
@@ -1467,9 +1469,9 @@ static int madvise_inject_error(int behavior,
 	return 0;
 }
 
-static bool is_memory_failure(int behavior)
+static bool is_memory_failure(struct madvise_behavior *madv_behavior)
 {
-	switch (behavior) {
+	switch (madv_behavior->behavior) {
 	case MADV_HWPOISON:
 	case MADV_SOFT_OFFLINE:
 		return true;
@@ -1480,13 +1482,13 @@ static bool is_memory_failure(int behavior)
 
 #else
 
-static int madvise_inject_error(int behavior,
-		unsigned long start, unsigned long end)
+static int madvise_inject_error(unsigned long start, unsigned long end,
+		struct madvise_behavior *madv_behavior)
 {
 	return 0;
 }
 
-static bool is_memory_failure(int behavior)
+static bool is_memory_failure(struct madvise_behavior *madv_behavior)
 {
 	return false;
 }
@@ -1598,9 +1600,10 @@ static struct vm_area_struct *try_vma_read_lock(struct mm_struct *mm,
  * Must be called with the mmap_lock held for reading or writing.
  */
 static
-int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
-		      unsigned long end, struct madvise_behavior *madv_behavior)
+int madvise_walk_vmas(unsigned long start, unsigned long end,
+		      struct madvise_behavior *madv_behavior)
 {
+	struct mm_struct *mm = madv_behavior->mm;
 	struct vm_area_struct *vma;
 	struct vm_area_struct *prev;
 	unsigned long tmp;
@@ -1675,12 +1678,10 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
  */
 static enum madvise_lock_mode get_lock_mode(struct madvise_behavior *madv_behavior)
 {
-	int behavior = madv_behavior->behavior;
-
-	if (is_memory_failure(behavior))
+	if (is_memory_failure(madv_behavior))
 		return MADVISE_NO_LOCK;
 
-	switch (behavior) {
+	switch (madv_behavior->behavior) {
 	case MADV_REMOVE:
 	case MADV_WILLNEED:
 	case MADV_COLD:
@@ -1700,9 +1701,9 @@ static enum madvise_lock_mode get_lock_mode(struct madvise_behavior *madv_behavi
 	}
 }
 
-static int madvise_lock(struct mm_struct *mm,
-		struct madvise_behavior *madv_behavior)
+static int madvise_lock(struct madvise_behavior *madv_behavior)
 {
+	struct mm_struct *mm = madv_behavior->mm;
 	enum madvise_lock_mode lock_mode = get_lock_mode(madv_behavior);
 
 	switch (lock_mode) {
@@ -1724,9 +1725,10 @@ static int madvise_lock(struct mm_struct *mm,
 	return 0;
 }
 
-static void madvise_unlock(struct mm_struct *mm,
-		struct madvise_behavior *madv_behavior)
+static void madvise_unlock(struct madvise_behavior *madv_behavior)
 {
+	struct mm_struct *mm = madv_behavior->mm;
+
 	switch (madv_behavior->lock_mode) {
 	case  MADVISE_NO_LOCK:
 		return;
@@ -1756,11 +1758,10 @@ static bool madvise_batch_tlb_flush(int behavior)
 	}
 }
 
-static void madvise_init_tlb(struct madvise_behavior *madv_behavior,
-		struct mm_struct *mm)
+static void madvise_init_tlb(struct madvise_behavior *madv_behavior)
 {
 	if (madvise_batch_tlb_flush(madv_behavior->behavior))
-		tlb_gather_mmu(madv_behavior->tlb, mm);
+		tlb_gather_mmu(madv_behavior->tlb, madv_behavior->mm);
 }
 
 static void madvise_finish_tlb(struct madvise_behavior *madv_behavior)
@@ -1815,9 +1816,9 @@ static bool madvise_should_skip(unsigned long start, size_t len_in,
 	return false;
 }
 
-static bool is_madvise_populate(int behavior)
+static bool is_madvise_populate(struct madvise_behavior *madv_behavior)
 {
-	switch (behavior) {
+	switch (madv_behavior->behavior) {
 	case MADV_POPULATE_READ:
 	case MADV_POPULATE_WRITE:
 		return true;
@@ -1841,25 +1842,26 @@ static inline unsigned long get_untagged_addr(struct mm_struct *mm,
 				   untagged_addr_remote(mm, start);
 }
 
-static int madvise_do_behavior(struct mm_struct *mm,
-		unsigned long start, size_t len_in,
+static int madvise_do_behavior(unsigned long start, size_t len_in,
 		struct madvise_behavior *madv_behavior)
 {
-	int behavior = madv_behavior->behavior;
 	struct blk_plug plug;
 	unsigned long end;
 	int error;
 
-	if (is_memory_failure(behavior))
-		return madvise_inject_error(behavior, start, start + len_in);
-	start = get_untagged_addr(mm, start);
+	if (is_memory_failure(madv_behavior)) {
+		end = start + len_in;
+		return madvise_inject_error(start, end, madv_behavior);
+	}
+
+	start = get_untagged_addr(madv_behavior->mm, start);
 	end = start + PAGE_ALIGN(len_in);
 
 	blk_start_plug(&plug);
-	if (is_madvise_populate(behavior))
-		error = madvise_populate(mm, start, end, behavior);
+	if (is_madvise_populate(madv_behavior))
+		error = madvise_populate(start, end, madv_behavior);
 	else
-		error = madvise_walk_vmas(mm, start, end, madv_behavior);
+		error = madvise_walk_vmas(start, end, madv_behavior);
 	blk_finish_plug(&plug);
 	return error;
 }
@@ -1941,19 +1943,20 @@ int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int beh
 	int error;
 	struct mmu_gather tlb;
 	struct madvise_behavior madv_behavior = {
+		.mm = mm,
 		.behavior = behavior,
 		.tlb = &tlb,
 	};
 
 	if (madvise_should_skip(start, len_in, behavior, &error))
 		return error;
-	error = madvise_lock(mm, &madv_behavior);
+	error = madvise_lock(&madv_behavior);
 	if (error)
 		return error;
-	madvise_init_tlb(&madv_behavior, mm);
-	error = madvise_do_behavior(mm, start, len_in, &madv_behavior);
+	madvise_init_tlb(&madv_behavior);
+	error = madvise_do_behavior(start, len_in, &madv_behavior);
 	madvise_finish_tlb(&madv_behavior);
-	madvise_unlock(mm, &madv_behavior);
+	madvise_unlock(&madv_behavior);
 
 	return error;
 }
@@ -1971,16 +1974,17 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
 	size_t total_len;
 	struct mmu_gather tlb;
 	struct madvise_behavior madv_behavior = {
+		.mm = mm,
 		.behavior = behavior,
 		.tlb = &tlb,
 	};
 
 	total_len = iov_iter_count(iter);
 
-	ret = madvise_lock(mm, &madv_behavior);
+	ret = madvise_lock(&madv_behavior);
 	if (ret)
 		return ret;
-	madvise_init_tlb(&madv_behavior, mm);
+	madvise_init_tlb(&madv_behavior);
 
 	while (iov_iter_count(iter)) {
 		unsigned long start = (unsigned long)iter_iov_addr(iter);
@@ -1990,8 +1994,7 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
 		if (madvise_should_skip(start, len_in, behavior, &error))
 			ret = error;
 		else
-			ret = madvise_do_behavior(mm, start, len_in,
-					&madv_behavior);
+			ret = madvise_do_behavior(start, len_in, &madv_behavior);
 		/*
 		 * An madvise operation is attempting to restart the syscall,
 		 * but we cannot proceed as it would not be correct to repeat
@@ -2010,11 +2013,11 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
 
 			/* Drop and reacquire lock to unwind race. */
 			madvise_finish_tlb(&madv_behavior);
-			madvise_unlock(mm, &madv_behavior);
-			ret = madvise_lock(mm, &madv_behavior);
+			madvise_unlock(&madv_behavior);
+			ret = madvise_lock(&madv_behavior);
 			if (ret)
 				goto out;
-			madvise_init_tlb(&madv_behavior, mm);
+			madvise_init_tlb(&madv_behavior);
 			continue;
 		}
 		if (ret < 0)
@@ -2022,7 +2025,7 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
 		iov_iter_advance(iter, iter_iov_len(iter));
 	}
 	madvise_finish_tlb(&madv_behavior);
-	madvise_unlock(mm, &madv_behavior);
+	madvise_unlock(&madv_behavior);
 
 out:
 	ret = (total_len - iov_iter_count(iter)) ? : ret;
-- 
2.49.0

