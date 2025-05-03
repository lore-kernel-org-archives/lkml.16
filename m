Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695EAC13D
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 21:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746306857; cv=fail; b=PKNjFLDSAsyKTK1MYut+/qN8xdGIrN/OwzQyDwsus1sSE2HwrzQPGw/K8VcfL2N+Ab14x/jtq0qs+h0tn1AN6E5IUGyneOdiKlJz7ZpXHPTEbKUC0niGvC4uhr8UP40FiUxS+RlwFR6oau0UOGlqDAFQQJgN4oLvetM8fS8ONMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746306857; c=relaxed/simple;
	bh=+7zTREBCiqvY9h69dXMwcf1kRws47q3rlu8Fb8FYZp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sLqQkveGNMBN2PrCocSOqozV9sS5q7ClQvjUIPiKRAwnK+XTSIqY3eNJymaCaLrRsu0TYE9I74nhv5B8Dn5AENHyHUgszmF6TeQKi3vZBtP5epumpcbadLtcHdUJL/vdTcrEN4JpTOR3L2cGYnL+MxXAnqVy7JdhRFWdpXeyN/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PQKHJ+FU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Y+spOOUf; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PQKHJ+FU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Y+spOOUf"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 543L2jtY017846;
	Sat, 3 May 2025 21:12:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=HqWPu4vlOVCphmTjxWn+AsLAW/zIxRucRyYtin5TDCA=; b=
	PQKHJ+FUtUfQf6llYUZMpdUx6YWp7kj11GR2W/vXzKw8LGeIw+HZCXfV86iihiJh
	68nrwGP5vr3YUa1TAsZUGDb+cvSB9+IDkZuYVJUs2Ja8IC6yIAp6QPLDAGPVysnx
	VjDzt6uXQZY+gHumJXAlxEymWboyjy8IzTH7/6ys6P9KXZnB5Bq8/1RwsYUm480P
	/2VVe3UGIAVt2NnRUwwtIc6R1Og76LoiMGqwxWGSDfOyvILSBQqWJOENBiJCJHZn
	WP5RxaiszN9hGx9PdEF2/LAAC/bzFLfCDR+VO7MMIiLGFzW2CO4xkE14x4cv33hW
	RmUSV4uZjiCug236YmpBag==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46dtpvr03w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 03 May 2025 21:12:54 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 543I10Td036013;
	Sat, 3 May 2025 21:12:52 GMT
Received: from sj2pr03cu002.outbound.protection.outlook.com (mail-westusazlp17013075.outbound.protection.outlook.com [40.93.1.75])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46d9k6f60x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 03 May 2025 21:12:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RozjRyX67bF4m8nSrP2BwteVFuKQCNy1m3SuFow6zR37zU7KYcT11HvD2hrZ+0pyCnC9G2qH80wRXhBRjnI2+SWpfXqMuAaBC5xjG9PS3G1sNg0KMcmShsKXzSp2WLNaoj0ryMU2iNp00TanNlJ/yEulXTtd2OwxdYEFnm86ug07i5+HqftuoNVx2LPhRZ/Scbr5mUDoFfAPyfw9SyeB7+T9wSEbEfPuxAMJu/PxCpRZGU9mnCbiU2UfANKLPoK/DE2pq28EFg9ngP0ulYm9QbaAFeofGdHiXjS0nCFm01orwb9bps9Yhz0rAZbVfoAlogeFcVpfx54zrwZthVtUBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HqWPu4vlOVCphmTjxWn+AsLAW/zIxRucRyYtin5TDCA=;
 b=J83dn/2p0Ctx+faf4vfvDbwEyvBs2zXPRWMORtjPF9hEHR5y17kjTy4XDIua1C//1IYXRhbyQ9lowgQKIGeqW705Yj16TZaJD4uMZcRNILJqcbHNnS6xcg11X0f4njFAPKsj+dSA4ITBAM8cLIzUa5Y8khG1eQCZWPNBVLgx/8Clf2ILfyGEOA+jCyysmvSOWVuDjdd0EyEJkKCVx/mrY2KhTBMaQGm0no1xpinAU5QsbDoUil5sqr0B2o9q0tP796W7mssXVMKnwLzefM+mAlAM95snhRCYWXzKoR4zUfgk1/YSF2QYzAxqhBcBTFjtTwcqGH2PKcdyeJbdY4dCWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HqWPu4vlOVCphmTjxWn+AsLAW/zIxRucRyYtin5TDCA=;
 b=Y+spOOUf6eVH7Hhh91HV+lj0zwefJxMLmMcTfSluQWMmq+sESlRDWg1PHye5CSrldHBPkt06LGdddOVhDv6sW7AZmAQLCl3tMPlglt74Onv4lVCbqSnecpYQmUcCr8uwhTClQICM6iRotquvFv4q91jTaKsr/xMH4r0z7/1zMVY=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH2PR10MB4373.namprd10.prod.outlook.com (2603:10b6:610:a9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Sat, 3 May
 2025 21:12:50 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Sat, 3 May 2025
 21:12:50 +0000
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
Subject: [RFC PATCH v3 02/11] mm/mremap: add MREMAP_MUST_RELOCATE_ANON
Date: Sat,  3 May 2025 22:12:24 +0100
Message-ID: <8141b4013644e4b8533d69ee297bb00516468ef9.1746305604.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746305604.git.lorenzo.stoakes@oracle.com>
References: <cover.1746305604.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0225.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::10) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH2PR10MB4373:EE_
X-MS-Office365-Filtering-Correlation-Id: 1519698e-1581-4002-9ee3-08dd8a874303
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hLUuQzYI6U5eDAQH/ioDkwBZZQZsDPTMBT1w32jeC7IzI1R5JjaVrLydcfgN?=
 =?us-ascii?Q?Mg9tl1LfrHgPDNLxQeVcB2B+qlCo06uP38Z7aZr7MD+T1w9xT4PDO+w0r3z+?=
 =?us-ascii?Q?u1yAi90Hs//XvZBf4lJVqxYp9DAbeod3zMjejxjggPvduo+zYCNT4OhBbbkn?=
 =?us-ascii?Q?8QhEkPgBeJiN5v6BmTQdFmhsMecYjmsdhwLqMZr0Xtf8sLQzVaDZo8qY6vsy?=
 =?us-ascii?Q?HdvcDlKMW9taowbyHid7JdiBpPwJl1McoDLHW7A11R4CwBmsrwhAS/SCWpD8?=
 =?us-ascii?Q?6GhJn+p7vygy9z/PWLJZx8YSpY0Ba9Kcswc4yfepPIZZbNO/qhg7GGu7BafT?=
 =?us-ascii?Q?dF+iQmg5W9T2z5YGE6f1Fx1w4AiK/SnpFYEaYpxkCs6pxT+JEVL2yGP206Sj?=
 =?us-ascii?Q?7DPAzV1ZmnQlYiOwQBUJvEWNDT+ThXLcAnCcfqy99Et2a5leAmYpFX9ku6t+?=
 =?us-ascii?Q?GzV5zqyXYE6Za1ent5muQ0P0FYIiaNxv7Imnb2P3Iv6KeiMWAiuCl6EfU3bR?=
 =?us-ascii?Q?xkYJU5Rby3u9q5EOcRbVGQUgHWf+lYB4/M4Q6lQLO79dt1c7HDZlU46URNaK?=
 =?us-ascii?Q?rarykAuPkPtzsbAB0AwSB3VLWkU3OGHsLrEWMfhqfwiY1l2EXXsx0+zHhwoM?=
 =?us-ascii?Q?7N5rOTr7qaJyZHqHA5PfTppxAq/tHJPHbJi9ySVcVvfrsibKpPd+fhM7QPGj?=
 =?us-ascii?Q?Rv9YOPw6FDrPb3076a2Z5AB6rHNb535San3KQgDoYf+bjsdBFMKn19Nfx4ly?=
 =?us-ascii?Q?3eX93rjt9C0POHuKMM7GOH3kDwSLYyIo1BzIwFSJ2VStz4ysL7qACZ1r3SMG?=
 =?us-ascii?Q?ETUqMGZIDn3j0+1aWEiUIP4HkPEGe2E42yVr+hweaQ67awkA7+8cCNMz5KMq?=
 =?us-ascii?Q?DZhXYB6UF1sjH9W8OxI1RpBJbmV/GiIcZE7odbEGL9CEliB1NRMgOX6RtMXM?=
 =?us-ascii?Q?E5FkbzDwSpkrHd1/H4Ve29AV6gafw01qaWglGP7IG0Pfjg26PUHwkpZYxyhA?=
 =?us-ascii?Q?zOOzuR1FgvkKi+/xUhBiCU13ssSbZUcubR/lYYvMtLDeSDsrF6drIElgNRKp?=
 =?us-ascii?Q?cPiOgmm7vNuV/aEfOqvks/0v+J7Jra24skmygUO1Jc6/h21E/zIlEi1Z0qcc?=
 =?us-ascii?Q?wp5XhOgPkZoVBVna/CgUEWQAz+nioMFzeRVYmRTUryfiLvjYCuiWLV8OgQYn?=
 =?us-ascii?Q?mn/m3qQZ6TWULTdOZo3Q5lS62linmw89kea8R4FGr8B0/WiTWFS7nvCIOlNF?=
 =?us-ascii?Q?xCizRM152qswjojv3PEEWXAOcu8eHhgJ3hZeFf6/iP1xR+9YzaaqhyBtofKN?=
 =?us-ascii?Q?YZQoBEcCqD7XXx1SxUWplg/1s+KPX3HDnn5AYdaZKOc8nODmLYBOBoyNE13b?=
 =?us-ascii?Q?mnl13Cq4WW+/ftedS8zmfTs35ywxa7i19YaSYGuwk/fFGAUVMwSkutl6v9e7?=
 =?us-ascii?Q?HQKrtfTkQzc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DRHww+Vnt7YAV2oCP86GY9dtSkcTp0pNoZH91dsrlWStZM+7opLZe8PdSjVn?=
 =?us-ascii?Q?ZhsYfyWbjcb66bIBhqNJlXEZLlwqxX7IEpomzdQIC6TUC3YI5+qWWHi0XGss?=
 =?us-ascii?Q?nrsjtsq3RHPvP3Kzb6c653anWwJk+tH8/RDA+d7M3NwX6N2Ezy8sJV8mNaFI?=
 =?us-ascii?Q?ALY8Yf0okPlIA22gg1QluJfwtRigBrf3lQ/09n3Xp4kPw3ihdQjyRPEyV+yd?=
 =?us-ascii?Q?fZmfqRvOM9UEvNoJxMqDecgb+6n8BgmYHikOMAc+ZCxzpNt42zPe7KhzEAIl?=
 =?us-ascii?Q?qc8Lyznz7AG8QNtJmBp2K0xAA6vSS4i+CgQZZdJ6A0ZEANK2yij0URyPgBgn?=
 =?us-ascii?Q?iUfnmt+61ouaR+iywc9ygsEKyTJsqCJHi4g7MYeJn99EMt9NQuV9SfPhecFR?=
 =?us-ascii?Q?mWypEBwJZIvEt+4U/nVMGw1fq1Il9aFQDLUcmAdDObMRyobjSnrAtr6LzQqy?=
 =?us-ascii?Q?GpFekHRy6bNmAiQPGVsuXWRByROI8+v2uBcIyG1hzg7JHC14QbF+rOurXF3T?=
 =?us-ascii?Q?9TQe+oCq2jp8lzDQYwMka87DIIcTxPtrrP+Pg9X7YSX3A4oTgJLDFvO2s43/?=
 =?us-ascii?Q?G7jk+YVFFIQO/Rjtd3+FNClpAqnRTA/CDuWLX178n4t7l5r1RqMJ67FxdiWj?=
 =?us-ascii?Q?3w9xhpGZY74LpNtZRkInghNl6/Ov+mN6TFJX/9S6lEQXkoS3tROGJLBkrQys?=
 =?us-ascii?Q?QnNrGMCtF4KHbHg+LPtF8RZz5kT5Pkqf6ilnMuLM/SknVLlvr+VUkFYtxp56?=
 =?us-ascii?Q?NS/VQxFlT7Pra3i+86S1BdKvCC1aavr7OI2lWWJw0jLmSS7p6wYdRl8NWEBg?=
 =?us-ascii?Q?WZXbgAYAA3uqJ5z2Nmpppumuniy4htd0r5+xf5avLVRCY2crErhEWlUv6mJs?=
 =?us-ascii?Q?7hqLUPryQTDcWJJKZwEkrmhe3bwRN4BI3XQkXBlAUjOeje12EuEfcDCZrheB?=
 =?us-ascii?Q?gQBtF9bO1B6ot9Y5Bw+yct+Q+oik8tYQWRGjJG9dxdSbBqOvfxqm9afWsWPU?=
 =?us-ascii?Q?ZE4vHPZlMOxScP4laSGR6HEh6jSlVo1Ypco696PPVG+u9KLJzsUFj+FfKOzz?=
 =?us-ascii?Q?/+fPzZCsTLK1jYJhV0695Q/dULeVIvQoXw2fwoPSAyq+pJCK+yJ3twQEjIyf?=
 =?us-ascii?Q?p80gVvwVH25plhe2d31M0MKu+7BelasipBy40bps1xhsN1SKzw3amvNfS1IB?=
 =?us-ascii?Q?GfTYr/ZcoFmMijb5F5OQNAEtHqq9N/olMFL6nkZ4PhexsGnEAwGklnCyqKOa?=
 =?us-ascii?Q?NjCrFuCI7gMQfDP0+Rys3RqGUDLAOBa/gG0pdojOv64E7DqzHCHzcRQe+MBa?=
 =?us-ascii?Q?KGTamwbpbg2G5QytFo+x5hJxo2fsvHTj8aDbUeawa/913yEPXtu4V0TOllkE?=
 =?us-ascii?Q?CkPhvrLsZzkFilBIFxFT2i8H5A0GBK5JmnDWTK2/YNHQcQ5Xqs+ac9QH0pi6?=
 =?us-ascii?Q?YbdwDZi0e2a7oF4qQyw15VGYJ+jaJw0y2Gk2RGzuy97ODcwsNFzJLsofrX/O?=
 =?us-ascii?Q?MPofg3afoyIf1FFzqIMOW+ZXDoi8zv9oaO7boVMZw9hdWXaPwu1FP7BwgdKe?=
 =?us-ascii?Q?PaZPArP9YV0xjtK+OvrXZnlshrZunhy/2CfwVaT+jm2aU+0Elk8L7bkfevS2?=
 =?us-ascii?Q?IA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XYIiGQXwwV5LbWcr1unrpUQgjV5yn9P5dPcY/FGThlDqGLH2qApsw6+TwyKkzhC14CiwDpnU9CrldLqKK4iCAqrEx59ZZYVvXvJ20/J3ADfXju9KbWWY2YI12ljHGv+IBeRyXVjj75KGqVhZoJwdrUmtdpO0PvgrsadrWbhfNK3IPiEv4cmh+QVCLaPk6CGJgyMFpE61egnA3yrx7nVsxHqecsslv8CpW3arQer6j+0kLHNgY9pV5sC+ALvXIIG0m2zPg56LRAZyCOIYlGcilo+uE9os331wHiSSWmoMVIra5VMirb8Mb6Ts8cy2Ut7X5wSh0fSqjcKRnNIOjhiof5x79mJADFY2rbebk+Z1rByDwzCB6noKlXzx2W1LVhXeStUNoHn9Ihn6ZP3h1y2B8i2ygketJFKGiYP2F4F/g9JL/0qw+1Bs5VMaJ13/56iAI6EkQK8YWf62lurVfX7ekxbaw4t525ks0H5S87k9mBecQWDR1tfdKVbc9lYwYn4riKlm8DCOpj1GqS2pE8OuEgWrVlnoYazbziTbL/q41k1koPGqbdLfKEwZJeXOJdB59tKUEVFhWG/v+uCsaORLOXwMbfToOI76kvRL/uCXHWw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1519698e-1581-4002-9ee3-08dd8a874303
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2025 21:12:50.8021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z+2mKsq6lQVR4CVHFD0FQL5giOzKCTA4ueh6TbM8fsiKLL++WSsL3lAeg7jkcCNBrNxLYg1dZ6bzMBwEpHhJ8r6DuMjYq9GSW8fWDqTgb38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4373
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 bulkscore=1 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505030196
X-Authority-Analysis: v=2.4 cv=UcFRSLSN c=1 sm=1 tr=0 ts=681686d6 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=qNC_Z3nAvvFLoNyIVMsA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDE5NyBTYWx0ZWRfXzZN/uLQvKkaG 0heTU3E07H4JQPYZ4UPe5m48VRYtNO65cxU3yCMfc98bNc9sBK+cc8TUp94JdCPdSsXeFjdzfP9 8zavL9GdHG9WbCTcIFBvDS4Fb17otEReRBzNtONMXbjVR/wGz/81X23229ohZyVU50vzJ3nAEcL
 WM+hJ23cNzl4RMt8ghnCDhF1La/WRPP4SQxGLsg+Sb8DGrRMepiE0DeRojkBMkRbDfDh6AeZtq7 oLdsXz0KKs2b0Iy1t6KPUJQ0GdnfxnFwRwJgRZvCQ39g1dCZhk765WbFyFvjr9Bvj1CxgsfEzV6 zTaDQV6Xfsz548K9mKJCasGfrOSHUeEGEXGJnmsxbfTbjNObUVY4fFev9WrkZRw0M+bZiIlka2a
 HGJlI+p7V4D9TvceVyUrUR4NRzFkvWgGBsmpNIE7GrmUdGRGJu8YdCyhtUh4CnYUORGmfW0l
X-Proofpoint-ORIG-GUID: G3ig-q38caEbYH2_VQcx2UduMje8tEyD
X-Proofpoint-GUID: G3ig-q38caEbYH2_VQcx2UduMje8tEyD

This flag is the same as MREMAP_RELOCATE_ANON, however it returns an
-EFAULT error should folios not be able to be relocated.

The operation is undone when this occurs so the user can choose to proceed
without setting this flag at this stage.

This is useful for cases where a use case absolutely requires mergeability,
or moreover a user needs to know whether it succeeded or not for internal
bookkeeping purposes.

If the move would be a no-op (could be merged, or folios in range are
unmapped), then the operation proceeds normally.

It is only in instances where we would have fallen back to the usual
mremap() logic if we were using MREMAP_RELOCATE_ANON that we return -EFAULT
for MREMAP_MUST_RELOCATE_ANON.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 include/uapi/linux/mman.h |  9 +++++----
 mm/mremap.c               | 35 ++++++++++++++++++++++++++---------
 2 files changed, 31 insertions(+), 13 deletions(-)

diff --git a/include/uapi/linux/mman.h b/include/uapi/linux/mman.h
index d0542f872e0c..a61dbe1e8b2b 100644
--- a/include/uapi/linux/mman.h
+++ b/include/uapi/linux/mman.h
@@ -6,10 +6,11 @@
 #include <asm-generic/hugetlb_encode.h>
 #include <linux/types.h>
 
-#define MREMAP_MAYMOVE		1
-#define MREMAP_FIXED		2
-#define MREMAP_DONTUNMAP	4
-#define MREMAP_RELOCATE_ANON	8
+#define MREMAP_MAYMOVE			1
+#define MREMAP_FIXED			2
+#define MREMAP_DONTUNMAP		4
+#define MREMAP_RELOCATE_ANON		8
+#define MREMAP_MUST_RELOCATE_ANON	16
 
 #define OVERCOMMIT_GUESS		0
 #define OVERCOMMIT_ALWAYS		1
diff --git a/mm/mremap.c b/mm/mremap.c
index 35a984977f85..efa0d3c2ca20 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -1383,14 +1383,18 @@ static void unmap_source_vma(struct vma_remap_struct *vrm)
  * is being moved to by updating index and mapping fields accordingly?
  */
 static bool should_relocate_anon(struct vma_remap_struct *vrm,
-	struct pagetable_move_control *pmc)
+	struct pagetable_move_control *pmc, int *errp)
 {
 	struct vm_area_struct *old = vrm->vma;
 
 	/* Currently we only do this if requested. */
-	if (!(vrm->flags & MREMAP_RELOCATE_ANON))
+	if (!(vrm->flags & (MREMAP_RELOCATE_ANON | MREMAP_MUST_RELOCATE_ANON)))
 		return false;
 
+	/* Failures are fatal in the 'must' case. */
+	if (vrm->flags & MREMAP_MUST_RELOCATE_ANON)
+		*errp = -EFAULT;
+
 	/* We can't deal with special or hugetlb mappings. */
 	if (old->vm_flags & (VM_SPECIAL | VM_HUGETLB))
 		return false;
@@ -1399,14 +1403,17 @@ static bool should_relocate_anon(struct vma_remap_struct *vrm,
 	if (!vma_is_anonymous(old))
 		return false;
 
-	/* If no folios are mapped, then no need to attempt this. */
-	if (!old->anon_vma)
-		return false;
-
 	/* We don't allow relocation of non-exclusive folios. */
 	if (vma_maybe_has_shared_anon_folios(old))
 		return false;
 
+	/* Below issues are non-fatal in 'must' case. */
+	*errp = 0;
+
+	/* If no folios are mapped, then no need to attempt this. */
+	if (!old->anon_vma)
+		return false;
+
 	/* Otherwise, we're good to go! */
 	return true;
 }
@@ -1458,7 +1465,10 @@ static int copy_vma_and_data(struct vma_remap_struct *vrm,
 	struct vm_area_struct *new_vma;
 	int err = 0;
 	PAGETABLE_MOVE(pmc, NULL, NULL, vrm->addr, vrm->new_addr, vrm->old_len);
-	bool relocate_anon = should_relocate_anon(vrm, &pmc);
+	bool relocate_anon = should_relocate_anon(vrm, &pmc, &err);
+
+	if (err)
+		return err;
 
 again:
 	new_vma = copy_vma(&vma, vrm->new_addr, vrm->new_len, new_pgoff,
@@ -1489,6 +1499,12 @@ static int copy_vma_and_data(struct vma_remap_struct *vrm,
 
 			do_munmap(current->mm, start, size, NULL);
 			relocate_anon = false;
+			if (vrm->flags & MREMAP_MUST_RELOCATE_ANON) {
+				vrm_uncharge(vrm);
+				*new_vma_ptr = NULL;
+				return -EFAULT;
+			}
+
 			goto again;
 		}
 	}
@@ -1843,7 +1859,7 @@ static unsigned long check_mremap_params(struct vma_remap_struct *vrm)
 
 	/* Ensure no unexpected flag values. */
 	if (flags & ~(MREMAP_FIXED | MREMAP_MAYMOVE | MREMAP_DONTUNMAP |
-		      MREMAP_RELOCATE_ANON))
+		      MREMAP_RELOCATE_ANON | MREMAP_MUST_RELOCATE_ANON))
 		return -EINVAL;
 
 	/* Start address must be page-aligned. */
@@ -1859,7 +1875,8 @@ static unsigned long check_mremap_params(struct vma_remap_struct *vrm)
 		return -EINVAL;
 
 	/* We can't relocate without allowing a move. */
-	if ((flags & MREMAP_RELOCATE_ANON) && !(flags & MREMAP_MAYMOVE))
+	if ((flags & (MREMAP_RELOCATE_ANON | MREMAP_MUST_RELOCATE_ANON)) &&
+	     !(flags & MREMAP_MAYMOVE))
 		return -EINVAL;
 
 	/* Remainder of checks are for cases with specific new_addr. */
-- 
2.49.0

