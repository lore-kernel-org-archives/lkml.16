Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330E1253F13
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748353218; cv=fail; b=uP+JMxTk7WgK5arL2Q9/SqqWycjB2HxamZGXe4K5l2y1Yeu5YlfBu59G4seOGU5cu+/Uh3xzON3uyDDSwhQUS6/Jv4/11P/YRVpdKa+fUCOHpWBiDyzRgdoajtcFj4vg18PRuw1gLj8/gkusHLFRd8VGNEfnnZAJSlFXEvZDexA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748353218; c=relaxed/simple;
	bh=nV/dYkRDMSsBE8PvC4dtEWH0cdGsLzbEQDivpm9Y7es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oKwOuNPKWOs1gco8Ss/tCYoiMSeIwk23/j0ApFin5c6FL+PaAZ9FG85wP+6ampXN4uC1wU6rzTWPcmdqY7U0rP3nyPoaO039y6m7CBIR2b2fk0htUQta5JPag66/u1lBCskZoYS2UjHH3Rk5EX1UoMi8oaLVmqJ+k62oxw1XKKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HkpBAh0y; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=v8LS3Eps; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HkpBAh0y";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="v8LS3Eps"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RCjcSu008377;
	Tue, 27 May 2025 13:34:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=l82jh5QtsPxSz/K40Y
	6MvY5YnfizXH8afLu+rFsF+sU=; b=HkpBAh0ytnQLZd3a2WmEGxPUNgRn9SJ4/8
	VKwC2itbOwIQOSIuMZA7deZ/8+YelEuC0doTL2MIGX+cPuwU4bnvdlBY5szHrRnT
	iyD1sO3m7ut8v+gphc7R7Hb4HKgj+UgBX0kKcS7VGlthzA23J4SN45xouC2gGr7z
	GMQRTlULlDKWqbzmxtHHS8oAa+qODYcBu8pR9/nOKWjl52vcxKT5VnAe19/DmeLA
	QHF89AWKjpa8xnRmt0dlvPcApKBHk+0ErQu8UlqWci9jQTlneGro0iwy9lwbr/SS
	xWSJL+++kCCHCqJVXLEorCkwogrALJ0IIQrMUnvbXxLPAw9R/X6w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v0g2b8w8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 13:34:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54RDG8OA024368;
	Tue, 27 May 2025 13:34:47 GMT
Received: from cy4pr02cu008.outbound.protection.outlook.com (mail-westcentralusazon11011024.outbound.protection.outlook.com [40.93.199.24])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46u4j94mrr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 13:34:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sGrD2PwkTA2+21BS9aiGedqZjIl/RkAkCrcBT7WklNmCNU9VZ5C6foWWUEM7HKHk+S1C1Gq5n5Ioah4sBKjK49XLUAYsfk1MdkGeEdU26jvEBIgYqha+QnHGn8Z0NWVlUy/jRoHwbG6bBUI7okb5Q6BjfKQBKODSLYbU8xfmmA4TDcGVclISe0JimslTIkM0Wyju2e1hULqAupY6Xv4xbbYCXXh+Rrh0iTtqAnQ3jtiXIyqBINfe2jRyETILKumrgiBMfZimnVE/+pd2vIVq9W3WlAzzVMiLfJuXommpoM9ELJvYWgAmhRp4A5gFFmnX25S6rr0SU+A2Y/dJpHm7CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l82jh5QtsPxSz/K40Y6MvY5YnfizXH8afLu+rFsF+sU=;
 b=LMD7AiXLncIVqO62O7XxJdJ7Z1FhrLORsCy7zWxIXTOYIvLu/D46wQVokRHbyNVICd/OHdw2fKM+pphdO6s8uqicPSoPfmdMCSbKjeZjVCo1R1WURbl8HIDWzvVh6Rd8mPbsvwcbXBGngVQNaZY2ZZzSRAftzi9GMEJsJO5aHmpk3/JN/3FxIkW8chkua6Lq9RyYqgzB29cLhheg2XCWgJcyNQfCp3xgWYLZ/JsIfEJ05uHm1hEpKCn7aZRMO4FPpLaI079LmDbme7Wf6XwKSoGuGj56PCYWOI7Xpi0Zb2fXaQ2oM0PkSBsij61g3cZuq1Ffkp9rrdq88mXs4inSHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l82jh5QtsPxSz/K40Y6MvY5YnfizXH8afLu+rFsF+sU=;
 b=v8LS3EpsmuaC7KcszZpasKCZFGvaiyz2uqsoELnLdtX8ArayD5VSl6WdHdziL/Rrhl/tDXn1NvD/bBbn3pdMEC7zG0jzqNry+y9fJGqHt4pniS5HcJNUifkWFSQmgWC6TZ6WwXHecP1FFnOauTjS9GhiGSMqwg87RRKfr1M6oM4=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CY8PR10MB6658.namprd10.prod.outlook.com (2603:10b6:930:54::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Tue, 27 May
 2025 13:34:44 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Tue, 27 May 2025
 13:34:44 +0000
Date: Tue, 27 May 2025 14:34:41 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: mhiramat@kernel.org, oleg@redhat.com, peterz@infradead.org,
        akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
        jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, pulehui@huawei.com
Subject: Re: [RFC PATCH v2 1/2] mm/mremap: Fix uprobe anon page be
 overwritten when expanding vma during mremap
Message-ID: <cd02ea34-0675-4324-aa84-2696e834d922@lucifer.local>
References: <20250527132351.2050820-1-pulehui@huaweicloud.com>
 <20250527132351.2050820-2-pulehui@huaweicloud.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527132351.2050820-2-pulehui@huaweicloud.com>
X-ClientProxiedBy: LO2P265CA0095.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::35) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CY8PR10MB6658:EE_
X-MS-Office365-Filtering-Correlation-Id: 1736b184-87b1-41d1-ed20-08dd9d233d89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mynaV/czFVdamMM+fpDOBAKhK+CHq1diOnLZTUbW3WFQp1w+lBMZkou0t7k2?=
 =?us-ascii?Q?ercMXwe8ZU7ou4kAB13ewpYJEqf0Bc0h3V4yquiVQln0u39EMGBOiXcR+gTN?=
 =?us-ascii?Q?QYokWp4I1fRAfHIOz4G83ZcJuZwqiz3pvfrZOqbgctR8X9p2M0tQ3zUAy/0p?=
 =?us-ascii?Q?xfv46YBngIJloJMaLFCTvjhrvcrIPe1ysbdWzhJ6d3UUn+3MIgrI5GRFLoAp?=
 =?us-ascii?Q?YV8fISkUJZW/7UmNAa33gjfc360tq9LC/tbYFASmqVIMLWrM0MDBLr/x/TGN?=
 =?us-ascii?Q?Y6ASysceISKqypUJ14YlYq6dJvDcuMrda3d2aTd+zg0zFCbJ9u6YlTybNYdD?=
 =?us-ascii?Q?M+B/uYFIFwd90wz8JlVBf9wECe5XQB1cvDn/1ERQZqe2WQnWNHT6KCs+tY6E?=
 =?us-ascii?Q?54TPLYTl4z7156YP1vXwukg4vSwrbIXVCKNnZ0e/n1NQv+mUgShSG5FWCuT8?=
 =?us-ascii?Q?IlI4Zg6fwrH5JFh6FIQV0PPP9vNMOlomMpc27Sfni6Sdduv7KULT+YyXiPM2?=
 =?us-ascii?Q?6o7bPg/taXbwa08kPG8XT1acopHV9p/TOWyyzYf6AsTNqKDnDcMmTo4ATpMr?=
 =?us-ascii?Q?CfuZhN4TUoHwDSyZpCbtf8nbzHTnH5ft8fLiNozgf9iJNwkb8zy68+q4WEb4?=
 =?us-ascii?Q?EPDKKSUeX0OKBAtMccfEzoiZnuO+vOWZKxvH6XQ5geTU/EDrW01CIT3A2HsB?=
 =?us-ascii?Q?gG84ZIw3jaCd5C8huEb0Utot8t0hAsYkQxbWIIuxbgKfhrqWMzg2mLWUur7J?=
 =?us-ascii?Q?BjumWQ6dNRPNaVJar1OEv/MtxEGAtOo5rHPUkS9GwB6DAQ8Ox4rOr15fKtiL?=
 =?us-ascii?Q?cEEsOx67JhiTZMLLYI9J64EgkXtkREuzMKEuUo0U1p2d2X0fX9OEHnyg4cvR?=
 =?us-ascii?Q?lucOFpgMhfj2nDrnE6G7qxiS4TAPtdF7rGYIkd5/NDjSBvwT4mNMCf1V7n7X?=
 =?us-ascii?Q?Wcfz/LNs6nx57e7IINWMM+p9a9LIVSDWZu/rV0HA6/pOu8oPMEHmyMEymaZ4?=
 =?us-ascii?Q?UhxEB00kvhzYF9HkGTawkLORniVov3KZmfIZbUVPXE/EkOWPi7670OyyWJdn?=
 =?us-ascii?Q?Sf2X/V7YHgV4ICR0z5FapyDeg3ELWtlGdLthyLKXCR+ckNCQx/BhQorpDv6f?=
 =?us-ascii?Q?TucqGr0pW64x9wYgv/+UenAgx/QTyGa7La1gmgvhhw4N41OXNQ75foirktED?=
 =?us-ascii?Q?VfrO9uBACyJUgvbAYNJzRmzcWqZiN8fcv3vknJZVwNxC0g20tbpMndNmzP6G?=
 =?us-ascii?Q?BgF4hgEL4Z0w5/eJxIvRYI+ADgk6Udcq7bxRrb6BN3x/8AuiSDpHfQswnZyp?=
 =?us-ascii?Q?QHDccsJmRZBQRM7tafYkXhSBwf2Ex28/SkgcwAwBDhdpvcOFnE/5bFAxf0di?=
 =?us-ascii?Q?8s2ZaEbvkEl5Y1wuQdZ+gHDmDzkR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xwUBguZ7JCsiX9FAEPenhzKEXkF6XtMlX4bpl7U2Y3rzHQyJQhav992aXNoq?=
 =?us-ascii?Q?UEAT1hiqh9y/zvXjP5mb1a9HZhYVHrNk+q+bWtTwpZkI5HxEQwHXuncI/Hkk?=
 =?us-ascii?Q?QGx5SY0AtdEjl/tfEob7YkpYlKGBip7/oLd+v8lqnadXxeKWcT5ARdGkC0mD?=
 =?us-ascii?Q?73RVrtHX7M0bo3LbM8m0K9T49/zJS5eyg9TLYXoe+lTplswICHTSaSGcwN4Z?=
 =?us-ascii?Q?Sv3wEFkDd62ioEL6npUwGpjCyJnqMMMYApaxmheHk/sIY4udoNFfMJrpJB7l?=
 =?us-ascii?Q?2KfJA/iDFIIMORvmFu7es78v5aweEoyEfedwKhprEXkTsjfd2s3ZSy4yfi6t?=
 =?us-ascii?Q?oFJSuj0LM1Rx2643RNyC0GhDM+IXeIdcLkPtTZHevcNmATG8+ypRCTtXSIA4?=
 =?us-ascii?Q?aUgrWe7p2gLLwLvpwnCzq0qQAyQO6k6bFWVCYjDVrbSeewSNJzF0XXDkOs7p?=
 =?us-ascii?Q?KKlYfr/g1ts+e3ndYENYvtMUCBsgHJaSsFKtXsBJF7qVJxN1SANF9kuDHj+K?=
 =?us-ascii?Q?uJdh/lT99Twj5DqduCoXPd6bEsMdBzuUapF5QdxluGUQIHS0ZuN2xn077uzo?=
 =?us-ascii?Q?9dv+UfNVR9GMSrvl5DqdbGQ5mJzqTnNCcbweHv1HClrZ75Nz5zTiJ1XSMs8x?=
 =?us-ascii?Q?0pcXZa2ohzQIPN1K1jiis88FMYsL63pmQB5W3JEoAn2JV2DG+lWWaCOgNOG6?=
 =?us-ascii?Q?vX8NaL8L1zu3HCeDP3voXxAYkPAPuad3BGNwtivu+45Nn5JfemQ7V0O9CPwc?=
 =?us-ascii?Q?vu6A0sP8PxyemjEuL/307B2t6DPkCeV95ZmVOH3e3m2/g1jVxlzfP/wafjGG?=
 =?us-ascii?Q?45ieSM/z7+lCADu49EQW5Xo2zKounfjEcmmYxSZRZWEMXUyKDcuRJPUfSQ8G?=
 =?us-ascii?Q?rWmt47AB1ma+Xzjt+gCe7x106tc3tYL7fWliFeNv5l5IoU31uU22XUYlM91G?=
 =?us-ascii?Q?5QXwWohG/VcaEa/GN+eV7EwCqPAHEhLV44P+GYYyK9rIxMzTTOV6JZDx/6RV?=
 =?us-ascii?Q?Uc1R8TupXeEPZOuDnlxwF9iOkpdd7nslkB/F4deqSWisOqnDPm/OyBNNpvCk?=
 =?us-ascii?Q?6RB3kbpT5vDzQBeg3jQw2GGutffri7nwZPipIC9w3MLGdKfhadgut1GUa/mB?=
 =?us-ascii?Q?TdHOoAJiqr3vetxBDXl7wmFxzamO+RziVbE8J7CWBP0NUObGxIO8SK7+CNFv?=
 =?us-ascii?Q?6f1QhsH2a3dWcXpRzeAkJJ1XcjMeaQNdPn1f+qf75EQMWqNy5TaLIK/pvg1i?=
 =?us-ascii?Q?hNVgHoJhOZh3KEcCxAurryeSQB+POlmU6uXzB+u71WJzro7kLQuiW+kGeREI?=
 =?us-ascii?Q?X+7ivF5zq107z1nfRBa9f7en4tZUQy3vNKvrzfkorR6fYGrpp1URrf4t/tXV?=
 =?us-ascii?Q?2LGquB/ik+dyudYKSvkfROq1eblY5OnQLGChLmxgBC0Z7Asv37OdP+ltMZmb?=
 =?us-ascii?Q?BGNnqlJdWM447EN0NQcchto7CLAw/M7S0CABjd8j8oPUCRsGxb7zfVOHd6BF?=
 =?us-ascii?Q?WgXi6MOWC8+maUtldD4Yjtyr5AvC0mQshsEjJWYXpMjZN2NT37/Jb4SpRRgK?=
 =?us-ascii?Q?0gyFw4P5phLweS26tPKAJnEuwUavLgCeO7c8ItGKoqsR3IDw3UkemwJfASoe?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	n+VL1Qh4h1TnieCkhhPJbljUb2dO0qTAjcEDMK+2TP1Vs6gX32xQlqj0KNUmPbV9iZ1xJ+FEoYfAdQXcmNv7mEf0AFwuQdmlXgakqq70fRPKDoMan8FCq/tkY0XkvqZVcQx8x3dwJerjm4h44M9HCo4LThfFcL9eY/ZwaIXZaiSJ02keTFnDtC8Vw+Bn/vykNb/2TJcZvRJX3eKQwhSpujWNtm+yBvmXTEsNpIZBflTZYDvBdrvhviVNFInlJ6qfDIIcOuHj7WEoT/1oUAVs2aXkZTPjDD0neAp6Hq1JcvfxPj8eL2JH+OaiV9WIYgRXkynwIQvUpmMnMv9nkf8gMKAc8L6CxlCv1shXD1vKAqat4E9e0qN3fZIGvC8fCuaqqNLxfVvP1SOtA1QDL/fCQe1PzDFujQmcJ98A0JrJgMnMNeP3AfvSmclZmYm9LbIUMve6D5XoQLSuzVIBXynsVwZV+DNwg/4OZ6rTu0Y21kLgE0aUmmWbi+yspgN59ifDsSr78i2fc7TXQxCmKBrZlu/s+vg90BF4USVwyGZE1wnfLxC0eG5Hlv17YQvDbEOx5zhen/fTvN87xYOe+GaRTK4YrhW+qmu4sSSLuV41JxQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1736b184-87b1-41d1-ed20-08dd9d233d89
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 13:34:44.0528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A9V3twbU4r+WcST8evyK1NG6/sa8jRdwPwKCOO+Oh1yEfYIOAfpsHvRVh3n/QfzfC5HkZcZOm0/3oG6AfV1OipcONfJ9JfQ8R83pwf86MFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6658
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_06,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505270110
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDExMCBTYWx0ZWRfX9IqSWr1YDurO 8qHejKE7lqsm/6RIaI0ZAaIWJWuSQuhuJSUHmmATeoot0SaCwNfinNXUM4/dK8nVDByA1cN/iom ZJctivNVbtC2b2DdOlfeUQ1uJGNI20n1wJDAE1IMPMhJaEwxpLBTQUgWgmIE9QDpuqmzUPBVQkD
 GSGJZikQBqE5qwYxgo5sJFV9akOexcamVnf4c8ujoZtL0umXUNdpF2re5c1trPwOl79lmFpwZuX oaPiu4xOPO4oALaPAXpzrpDphDLZqVj6bpsQsVYme3XgaCwAaWqhRhznWTB0c8ASFW/wn5eyfuS Z0R5YXFlsAIfMyi0v4dB3Q6ZBAgDt/GcOFjAex+Y60DEFo/J5YGjw9ORJfWKffCc3Lqe+szHhGp
 8LevEmSrbnQSsUThBbHdXWngUMGqM5w8JuYJu0cMKIhmYvHovDRGOeMzOln67UjytbsGxAql
X-Authority-Analysis: v=2.4 cv=NJLV+16g c=1 sm=1 tr=0 ts=6835bf77 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=i0EeH86SAAAA:8 a=yPCof4ZbAAAA:8 a=BonHd_nQ4ZLIl2RKxQYA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13206
X-Proofpoint-ORIG-GUID: Qv3FlHZZg5UNpw26r4ThLX1VIMGRUQa-
X-Proofpoint-GUID: Qv3FlHZZg5UNpw26r4ThLX1VIMGRUQa-

Hi Pu,

Just as you were sending this I was about to send you my suggestion :) That
is hilarious haha. Maybe some cosmic connection? :P

Anyway I don't know whether your approach is _quite_ correct here, you are
generally disabling the uprobe behaviour on all VMA expansion (that is -
new VMA merge, relocate_vma_down() (unlikely to be relevant ;), it seems
sensible to only do so in the circumstances we know to be problematic.

I really do not want mremap-specific stuff in general merge code, it's the
move page tables bit that makes this broken.

So... :P let me attach my suggestion as a fix-patch below.

TO BE CLEAR - I present this in this form purely to make it easy for you to
grab, PLEASE take this patch and rework it (if it makes sense), I don't
need any attribution other than a Suggested-by, maybe.

They are rather close other than where this flag is set :)

I am by the way assuming that uprobes work by installing a special PTE at
page offset 0 and only in the case where there is something installed here
do we need to worry.

Please correct me if I'm misunderstanding here, I am not an expert on
uprobes.

Thanks! This is a great find overall.

I'd also quite like us to make your repro a self test if possible? Not sure
where we'd put it... could be in tools/testing/selftests/mm/merge.c
actually, new one I created explicitly for VMA merge scenarios.

Cheers, Lorenzo

On Tue, May 27, 2025 at 01:23:50PM +0000, Pu Lehui wrote:
> From: Pu Lehui <pulehui@huawei.com>
>
> We encountered a BUG alert triggered by Syzkaller as follows:
>    BUG: Bad rss-counter state mm:00000000b4a60fca type:MM_ANONPAGES val:1
>
> And we can reproduce it with the following steps:
> 1. register uprobe on file at zero offset
> 2. mmap the file at zero offset:
>    addr1 = mmap(NULL, 2 * 4096, PROT_NONE, MAP_PRIVATE, fd, 0);
> 3. mremap part of vma1 to new vma2:
>    addr2 = mremap(addr1, 4096, 2 * 4096, MREMAP_MAYMOVE);
> 4. mremap back to orig addr1:
>    mremap(addr2, 4096, 4096, MREMAP_MAYMOVE | MREMAP_FIXED, addr1);
>
> In the step 3, the vma1 range [addr1, addr1 + 4096] will be remap to new
> vma2 with range [addr2, addr2 + 8192], and remap uprobe anon page from
> the vma1 to vma2, then unmap the vma1 range [addr1, addr1 + 4096].
> In tht step 4, the vma2 range [addr2, addr2 + 4096] will be remap back
> to the addr range [addr1, addr1 + 4096]. Since the addr range [addr1 +
> 4096, addr1 + 8192] still maps the file, it will take
> vma_merge_new_range to merge these two addr ranges, and then do
> uprobe_mmap in vma_complete. Since the merged vma pgoff is also zero
> offset, it will install uprobe anon page to the merged vma. However, the
> upcomming move_page_tables step, which use set_pte_at to remap the vma2
> uprobe anon page to the merged vma, will over map the old uprobe anon
> page in the merged vma, and lead the old uprobe anon page to be orphan.
>
> Since the uprobe anon page will be remapped to the merged vma, we can
> remove the unnecessary uprobe_mmap on merged vma, that is, do not
> perform uprobe_mmap on expanded vma.
>
> This problem was first find in linux-6.6.y and also exists in the
> community syzkaller:
> https://lore.kernel.org/all/000000000000ada39605a5e71711@google.com/T/
>
> The complete Syzkaller C reproduction program is as follows:
>
> #define _GNU_SOURCE
> #include <fcntl.h>
> #include <unistd.h>
> #include <syscall.h>
> #include <sys/mman.h>
> #include <linux/perf_event.h>
>
> int main(int argc, char *argv[])
> {
>     int fd = open(FNAME, O_RDWR|O_CREAT, 0600);
>     struct perf_event_attr attr = {
>         .type = 9,
>         .uprobe_path = (long) FNAME,
>         .probe_offset = 0x0,
>     };
>     void *addr1, *addr2;
>
>     write(fd, "x", 1);
>     mmap(NULL, 4096, PROT_EXEC, MAP_PRIVATE, fd, 0);
>
>     syscall(__NR_perf_event_open, &attr, 0, 0, -1, 0);
>     addr1 = mmap(NULL, 2 * 4096, PROT_NONE, MAP_PRIVATE, fd, 0);
>     addr2 = mremap(addr1, 4096, 2 * 4096, MREMAP_MAYMOVE);
>     mremap(addr2, 4096, 4096, MREMAP_MAYMOVE | MREMAP_FIXED, addr1);
>
>     return 0;
> }
>
> Fixes: 78a320542e6c ("uprobes: Change valid_vma() to demand VM_MAYEXEC rather than VM_EXEC")

Nit, but we'll want to cc: stable once we agree on a solution too.

> Signed-off-by: Pu Lehui <pulehui@huawei.com>
> ---
>  mm/vma.c | 7 ++++++-
>  mm/vma.h | 7 +++++++
>  2 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/mm/vma.c b/mm/vma.c
> index 1c6595f282e5..6445f515c7f2 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -358,7 +358,8 @@ static void vma_complete(struct vma_prepare *vp, struct vma_iterator *vmi,
>
>  	if (vp->file) {
>  		i_mmap_unlock_write(vp->mapping);
> -		uprobe_mmap(vp->vma);
> +		if (!vp->skip_vma_uprobe)
> +			uprobe_mmap(vp->vma);
>
>  		if (vp->adj_next)
>  			uprobe_mmap(vp->adj_next);

I think we need to cover off the adj_next case too, strictly. See the
attached patch :P

To be honest the adj_next case won't be relevant, as this is not set for a
new VMA, but it'd be odd to have a 'skip' or 'no' uprobe option and to not
obey it in both cases.

> @@ -737,6 +738,7 @@ static int commit_merge(struct vma_merge_struct *vmg)
>  	if (vma_iter_prealloc(vmg->vmi, vma))
>  		return -ENOMEM;
>
> +	vp.skip_vma_uprobe = vmg->skip_vma_uprobe;
>  	vma_prepare(&vp);
>  	/*
>  	 * THP pages may need to do additional splits if we increase
> @@ -1151,6 +1153,9 @@ int vma_expand(struct vma_merge_struct *vmg)
>  	if (remove_next)
>  		vmg->__remove_next = true;
>
> +	/* skip uprobe_mmap on expanded vma */
> +	vmg->skip_vma_uprobe = true;
> +

Yeah this doesn't feel right, this will make this happen for all
vma_expand() cases (including new VMA merge) and that's surely not correct
for non-mremap cases?

Again see the attached patch :P

>  	if (commit_merge(vmg))
>  		goto nomem;
>
> diff --git a/mm/vma.h b/mm/vma.h
> index 9a8af9be29a8..56cc0364d239 100644
> --- a/mm/vma.h
> +++ b/mm/vma.h
> @@ -19,6 +19,8 @@ struct vma_prepare {
>  	struct vm_area_struct *insert;
>  	struct vm_area_struct *remove;
>  	struct vm_area_struct *remove2;
> +	/* Whether to skip uprobe_mmap on vma */
> +	bool skip_vma_uprobe;
>  };
>
>  struct unlink_vma_file_batch {
> @@ -120,6 +122,11 @@ struct vma_merge_struct {
>  	 */
>  	bool give_up_on_oom :1;
>
> +	/*
> +	 * Whether to skip uprobe_mmap on merged vma.
> +	 */
> +	bool skip_vma_uprobe :1;
> +
>  	/* Internal flags set during merge process: */
>
>  	/*
> --
> 2.34.1
>

----8<----
From 30e39d0f223ae4ab5669584593071f5f7266beeb Mon Sep 17 00:00:00 2001
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Date: Tue, 27 May 2025 14:11:26 +0100
Subject: [PATCH] mm: avoid orphaned uprobe

If, on mremap, me move a file-backed VMA mapped at offset 0 that possess a
uprobe and it merges with an adjacent VMA, we will then invoke
uprobe_mmap() once again to install a uprobe into this newly established
VMA.

This is problematic, as when we then move the page tables back into place,
we overwrite the uprobe entry and thus orphan the merge-established uprobe.

Avoid this by threading state to explicitly disallow the establishment of a
new uprobe upon merge under these circumstances.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 mm/vma.c | 21 ++++++++++++++++++---
 mm/vma.h |  5 +++++
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/mm/vma.c b/mm/vma.c
index 1c6595f282e5..cc18d1dcdc57 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -169,6 +169,9 @@ static void init_multi_vma_prep(struct vma_prepare *vp,
 	vp->file = vma->vm_file;
 	if (vp->file)
 		vp->mapping = vma->vm_file->f_mapping;
+
+	if (vmg && vmg->no_uprobe)
+		vp->no_uprobe = true;
 }

 /*
@@ -358,10 +361,13 @@ static void vma_complete(struct vma_prepare *vp, struct vma_iterator *vmi,

 	if (vp->file) {
 		i_mmap_unlock_write(vp->mapping);
-		uprobe_mmap(vp->vma);

-		if (vp->adj_next)
-			uprobe_mmap(vp->adj_next);
+		if (!vp->no_uprobe) {
+			uprobe_mmap(vp->vma);
+
+			if (vp->adj_next)
+				uprobe_mmap(vp->adj_next);
+		}
 	}

 	if (vp->remove) {
@@ -1830,6 +1836,15 @@ struct vm_area_struct *copy_vma(struct vm_area_struct **vmap,
 	vmg.middle = NULL; /* New VMA range. */
 	vmg.pgoff = pgoff;
 	vmg.next = vma_iter_next_rewind(&vmi, NULL);
+
+	/*
+	 * If the VMA we are copying might contain a uprobe PTE, ensure that we
+	 * do not establish one upon merge. otherwise, when mremap() moves page
+	 * tables into place, we'll orphan the one just created.
+	 */
+	if (vma->vm_file && vma->vm_pgoff == 0)
+		vmg.no_uprobe = true;
+
 	new_vma = vma_merge_new_range(&vmg);

 	if (new_vma) {
diff --git a/mm/vma.h b/mm/vma.h
index 9a8af9be29a8..4c35c5ab1aa2 100644
--- a/mm/vma.h
+++ b/mm/vma.h
@@ -19,6 +19,8 @@ struct vma_prepare {
 	struct vm_area_struct *insert;
 	struct vm_area_struct *remove;
 	struct vm_area_struct *remove2;
+
+	bool no_uprobe :1;
 };

 struct unlink_vma_file_batch {
@@ -120,6 +122,9 @@ struct vma_merge_struct {
 	 */
 	bool give_up_on_oom :1;

+	/* If set, do not install a uprobe upon merge. */
+	bool no_uprobe :1;
+
 	/* Internal flags set during merge process: */

 	/*
--
2.49.0
