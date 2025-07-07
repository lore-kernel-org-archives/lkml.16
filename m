Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C65E29C353
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 13:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751895141; cv=fail; b=P4ugo3Ep0EkCmTJSPlE/5XQmBiZhBbtBi7K+MIhrT4EK7TioEj7UOA35k0CZrozsL9XnMcFkhkQbw9H+vqqssfuW7TZjChPVJoFUR2nSyq4Vb0560cUhpdbh2yjSZI/wrYulGYyXFW0Ozq/F5RdHUHo7gVCoyUXmyOd6PztjB6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751895141; c=relaxed/simple;
	bh=GJY/5CmqBl3NMxwl5RWpGhKq08TSefe9RQmp9rlaA14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LTfXhsqv7Y7izW6qt3LObT/PBV3F9B6ec9UONdXiEdMeod0YshlY2+v9gl4rnvWeN8MdZU7TG93j/DPeB7BpLWE8YRuYV3L12agv6gbLIVNV9YaZmSQFaMwoWXg+JpSqC4aEon7LCQzsusxyZf74MANWB4pLPgSyP9nvXvuAfeg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qY8TGRQu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=l6ymaOqA; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qY8TGRQu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="l6ymaOqA"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567BMk12027341;
	Mon, 7 Jul 2025 13:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=0D+akqNzAYSCUr0Ylo
	AK/6et6pCRDIe/01WgQcoRu4A=; b=qY8TGRQuosiwlDvLw93jy9xPIhm1ETx4eV
	RB3Wly77nqFQ0p06eVLTQozwtzlyT8GRheskTyAppZ2Ho+63biQ8McC6HkeIr5J/
	5okL/V9CCapCJMmVmZ5A8Un9kirXqPM08VExDKaZtxZfzKAi8HBN6PzRJukqGe1Q
	g7BxhYgvyRKNh/xCjEL/avsxyxuaxPCDrfk9oKPAbxfPG1xc8gDfSaVClVFsqcPH
	CB4Ebt68i0S3DmYbwjjxBk4mWh8KkqEB3JmytI0egTV2XjDDSLcCdLXJb1qshoca
	1oGhi/P/f20EiRtgMd6q9Co8TzY5M+bu825adJB1irdvrm8EBL3w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47rda188vm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Jul 2025 13:31:54 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 567DAN5t027080;
	Mon, 7 Jul 2025 13:31:53 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2047.outbound.protection.outlook.com [40.107.94.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ptg87vxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Jul 2025 13:31:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E6TKuLZw6I6PulIeqVmnu2mU+GpDgmyPbmMJYgfCsVpvkSE2Pu3NfA3TqcX/clasU/HQuzkgHXmoVequuza67rWftxrVA8YPolBunjrPKu3s1Akaa91hM88O6vLz1IIJNYjD9pX1ScEXZ6NGOuo7J67MN7Ko9Ddw+j058t+l0KMb+JdbNHAXWQ83YrJKxNRYDaL+Mx7m9cj6AOMqBg4djvaL4xRozPrqQoKtx8ct2BtcaZcBFWbEvuiWMdPu8UrE47zadEKMNXyQ2WPvt17twtAITdsRuG5/qGHXUWJLq+XzRjP7ZYbXR0VDPIji3xAvacQiz48AhyUnLLBAvh5VhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0D+akqNzAYSCUr0YloAK/6et6pCRDIe/01WgQcoRu4A=;
 b=YTNLqUBgsReFsRBJarAFr29hM22bZAwOtQgOt2sQP+BBNk/6HpgmZuSmt2ieuOJCG4jknNzqs1LHfvvIdWsYbv7tjLwtazyGQ6fc8baOAv3GnNCnv8gemCBpGmTEU2SAr67Egy6K+erXJYRpUcgNTvm0CqspIYJbVe6rEw4cyhpYyOg/DpdeBX8LIytXvYThk7sLiufu+B/7sVd9XR4In+70tZthXYp46UdegbtQiv2O0+f9um04HrBU74ISrzKiM30YFSaM0ejXzAUMxePGYFiQOf6iI8gimdD/yNdKx2iY7FTasA1ukjZNC8CrngMKEKKMkLUAPGf8YBxi9ry7sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0D+akqNzAYSCUr0YloAK/6et6pCRDIe/01WgQcoRu4A=;
 b=l6ymaOqAbPduxmaC4am5wIl3WAgPWaxHnLgvAVbmv/DvtyP8UB02HNRccNp8AoUJ/NBeAk2m69bhkLTcLVFzxpsyU5F57rsrOzAF7L6hoPUMCZpJDbjpY+9WekzibMHs9pIeVWwg0laOMMO/9TcsbYeBIxOgbNuwt/ROtBXIEbY=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH0PR10MB4453.namprd10.prod.outlook.com (2603:10b6:510:37::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 13:31:50 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 13:31:50 +0000
Date: Mon, 7 Jul 2025 14:31:48 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, hughd@google.com, david@redhat.com,
        ziy@nvidia.com, Liam.Howlett@oracle.com, npache@redhat.com,
        ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
        vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm: fault in complete folios instead of individual
 pages for tmpfs
Message-ID: <4d210475-d908-4851-97f4-bfbdf838e6f6@lucifer.local>
References: <440940e78aeb7430c5cc8b6d2088ae98265b9809.1751599072.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <440940e78aeb7430c5cc8b6d2088ae98265b9809.1751599072.git.baolin.wang@linux.alibaba.com>
X-ClientProxiedBy: LO2P123CA0098.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH0PR10MB4453:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e8ac933-5e2c-4c14-b565-08ddbd5aa127
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?X9uqykshRO5wozTf+0P9LgsgB5Psu6VfQTc03iJL8tM+Qi+HbyQAUEHZIKjX?=
 =?us-ascii?Q?cZOyz0bhP9Q3h4o1w+gGj/gOQvwzy+++0/04T3Uh+969KADvKKrdgd4aMK2m?=
 =?us-ascii?Q?E6NiZmipd7NPYko0ykgelmvyVhyTJTmi4FRzreYkG6u9rzHHU5z2IFdHMemx?=
 =?us-ascii?Q?IqByR2U4pZBh5xRu1YNwOV5VDkZyw8Sqfuhnyox9IKKKQy/00Bh7HSVY0SV5?=
 =?us-ascii?Q?QiO1qfz/44HAh0xUiLwQo4v+KDqUpk9lGDcN9VMYer0PZDwN73EONT45KayH?=
 =?us-ascii?Q?/lyMqxd76KWUmkYIGFkXu4gJ5E3aLXdmmD0V1D/Zh7EY1odeK2Hl58ycY21r?=
 =?us-ascii?Q?ETRKGsPvvufIQSH3i468wON2L67syhlSF4wWU1GHU6L3j7tbEZI5t+P13+6f?=
 =?us-ascii?Q?mYUs3AwtyjHJKOaPo+3eaVG54miDKN4oDrV+MmMSGs7blqb+pPmrykAr83Un?=
 =?us-ascii?Q?jZ2tN/cRb/8XsAFZ/BZvJ915fKZBZY23DDgkVWRtqo7mZ0POK7TIvQZa17iC?=
 =?us-ascii?Q?ejaWaIaXU59jdKLBMS3rJMI1x1r83pIS/9Hc19joDg0VyP5EoX/9JDHVuAWl?=
 =?us-ascii?Q?Syz9Iuid3Kk5WCPFuQpB0MUxT4yAV/zc0TWw3ujdsoHazFDmkovv1OTyLsAz?=
 =?us-ascii?Q?fAabDthSqWVLfnj/s/oA21OrR3ZmgIuioV17abJdRAdsLBGO4ueU7qMes72c?=
 =?us-ascii?Q?WPrEFVQHy3nBCN52xO9btOhjAZ01IwJ2wOK9BHY3Q/VWzFcNI4fGaweD0MRt?=
 =?us-ascii?Q?CSliPo6ZTg7YlD0orFTOa1OC3TG9N32ytNmH4pcn2mucdruXeHv45gOEhJUl?=
 =?us-ascii?Q?4Ol0XwOdlmYcQHJ1vxTR9HQNV5AdFq8Jr4aXVax7gwG+V2zf99ajF23uL0Na?=
 =?us-ascii?Q?gjjjymV5QMf3t6IAp0sQxRT5FAIu+6dhXudAV6i270Dx83ZHvbOzlRsLxptB?=
 =?us-ascii?Q?8HzFSiUqXD38hJCDaTUCRPwo7ctkjx9rZezCUcKAc9bfJB5xlzdGFioA1RJV?=
 =?us-ascii?Q?89+ovYHydmYi9SdujfDgZoxzwk6z73+SWAXhSzlpkDT3LL4JTEkIQKj55bjU?=
 =?us-ascii?Q?qbncDL0WIBHGAjAoXq1mXtsHyK8J4DojFN+oeAjsdL9IuhguG+C9O7OS1qA5?=
 =?us-ascii?Q?8xfV/Bv/qJE7jUIvMjMO+OJBzDGKqn+CBAbI74xX+0+LWAg02NiojGn7c2nG?=
 =?us-ascii?Q?UAYaOypt+yAiGD3YwPJWcKuPi89rabNNXuj9kROtg18clr6fLT/tW16Q7SMX?=
 =?us-ascii?Q?zyaBMBHkfF1t8c2Ke1UF+Ej8/FOhITgJbfJbsmWFspea1XTEiyeSpJ1LT2On?=
 =?us-ascii?Q?aUhE15+yHcJHAe6FUr77B78Zcq50mIvmWmN1YULdg5SY6flOS353PLy4zZSp?=
 =?us-ascii?Q?ZGeEbyl0TwsSh+Z9upKC9KCfA1/a2y4CbDwyenMSTmTodLJvtov2c5kGtRR0?=
 =?us-ascii?Q?7gX0h4fFia0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I+SrB8nLpS6amaob2E7zgY7aTXL0UBXF8w79BxD5rZsCvL2NxXG13SVOxjg2?=
 =?us-ascii?Q?Uyn/m6vSMkk3WMxgpj5smtr3HHlrV89MYm0iKXlddwDcTlcN5GpAsVfvkFOQ?=
 =?us-ascii?Q?fwlqG1W3Ex7bdpkU7WEIYMmqkF9X4tQAJZdqb7boDbfZlxCzXRGQS3h6IftE?=
 =?us-ascii?Q?mBwJLGdJq9owbtptzLd3DVANMxEmeK6Ic5IY2AAgGK88zFiwAGLy8r0V9BTT?=
 =?us-ascii?Q?uHyoqe+XfMqffjckCFh4cxPuZTVGVBy83i16DchQoYS6da3rNw8muNLFXWM6?=
 =?us-ascii?Q?95+qIGi8tnnNoZrlbNUHu2+PUyH/l42yd9kFrnQrXCrlgfA1mXhflpyXIA2W?=
 =?us-ascii?Q?VM12UX7HTOyAVOne9KWCXRJoujS811hDvPgEj9E7dTP2nctUWYicz8BnU5bD?=
 =?us-ascii?Q?C90s5T1LmkMB0Vbn7fg4WkZ6UXwdEEYyOKpf0o2o5rFT8MY9v6xcPOUffqtO?=
 =?us-ascii?Q?bJz8qR8G7dynlZNJw+zQ0wNf7aUFI88UyFhMzbfuhpOXsPp+HAewJYTYrMLK?=
 =?us-ascii?Q?kN0/nv7DeH0yYFWHoYUb2+/ruR5cACTGzOF17d8NJ5X+TqSjKmDBKNyQi16E?=
 =?us-ascii?Q?zFgUCeKUUBPIYZa2Tiup7U03erpOcFi206pePEA1uxkNtOa3CPXtrvqRsjMJ?=
 =?us-ascii?Q?2+it7KmYkajbvY6dErslNyqycY1HPxuVXJJKwKjZ/wx7I3rSz9QB0cjy6/mp?=
 =?us-ascii?Q?KFkwjND1QJ1KJ4Jt4TKfNG1ZeYiWOijtzTm/GlbrrQGhNqD00+OWRzr10QNu?=
 =?us-ascii?Q?jTpCIDmWDBmkw9yIQxeiNS/8BYNuH5ZXT1aG56JfH2gEwTwF0/Sd4j/f2kSu?=
 =?us-ascii?Q?tJJ/gXPhEgdeAC22wor/yiAtntZ/W/QluIsHSUO8SH/2X/XmyZeIZJd163Cv?=
 =?us-ascii?Q?M9UwL55xu5+UlgVoBOOl1gvbLhN4E4kPdae+GCNRvhy8+Rvp5y/Ur8E/nK3h?=
 =?us-ascii?Q?txJF9V3O5S1Bh9AVvsyF5hjPWek6iMGPEL4iOnxVppbdsBGDVJud4lpFDQte?=
 =?us-ascii?Q?U7aqXTIhkfzpFNQl3Z3PC0+Ughe0CPOV0za1KfMKst4j01mtXLPJb5e6mLyO?=
 =?us-ascii?Q?8VuLrsUUNE99/jV+ubxZlZTnFRwirU1VNzxmBT5+cLjrEqAvRvt9CNt07Fpy?=
 =?us-ascii?Q?lSOZwr80LRzqxGFdDav+coX/so/EHR9v+Hm7aXILkPk9Igbi6gr6/26WnOQx?=
 =?us-ascii?Q?hotvBKzahIw2rHkABulXUSz3Q/EkLiBdbqBVW5YPY20QZLvw9DgnJhz53PvT?=
 =?us-ascii?Q?ymPknCkFz/kiUXT9zlQimEE6KfHVf0zeExZTIV/dpceZVc23jhPrqur85WO7?=
 =?us-ascii?Q?bXSXXM6SaihxznXIV2Csli9HgRJVPKdr4q3zTRR4z+iHgjCYXC6O51rhmqp0?=
 =?us-ascii?Q?7prPNadDtZBWGgM8A4gT1WGZd2FFU2cqxG8ZIvbk5g2WChuzegIxTncuQaGE?=
 =?us-ascii?Q?EaM91IOhoQo1Di9Pb4z2awHTx/QBGP35Qh8odG5NV/zlJcJz5FO+TbUYbfUB?=
 =?us-ascii?Q?FTItzkMn9oI2TSPopkzyRCscr8dHC5BHv/TTRzVCJ9nsL5ZBaQ0LFd7i+75v?=
 =?us-ascii?Q?LuNVlmFMiC8HuWUMDR/34azxXWfSwo59Uoo1gvdpPFcvYhSgnqHhm1HoeL8f?=
 =?us-ascii?Q?1g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	y3Uje28aQQXWxN4HK4+CgzRsKaU6AOY3+hRfvx6Y9yEqDanYmUATR7TiCRjql/hK0CQnilqijCozuCuFPXtmiX4+cOMNYeUn8anqWQnpL2AHAp2fFHcsxNnDCyCoN3ztrSu5Tv4W3cCJdHcRJLzEhCoMnZmtK0kBocLP24a0j6CIh4I6gb60Jd1H80FYQUlbE+9iF0jEDAsG3fwvMNhNCuN2/XTSN/PgIOsCpQdsif6UrpHuWZN+2KXdES9Buv0bluJY446sQP1Fk10trU9oYX6hbbqTe4/TInH25pHZVT50lqBt8ndUnyDAm9oSDrucacgcFg23WonuoRxkyg9mHSSv10Um2PcsBLOjLSgsEsv0Le0fHZlz8Ey7Ldrdvo3ydGaN+GTfUe8DNwAV0LbrQm6IiqcDJNSfOW22JvXo8EgzrT6GplNUZxv3rKh1uOaEerjlH+KZOp6fp16ZvRa2hZsmrWl8jjx31AWOVNk4JHDJZeqNR41fsaNgssYWAPXb7kFDYO9fqd/brTyvicVKoYPjCnYVxle4GPQrMCzsNPgs90eZjm4jrSNfXSFcqy3XxD3oVYJ3zmOqSRU9ZTuceZAuSeD+UL+N2QHkQFxE+mg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e8ac933-5e2c-4c14-b565-08ddbd5aa127
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 13:31:50.5619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nvE5lsCKxyVsZ0EMydUkLq7Q1wQF3sEvkg78OFcybSj3KiImFF4Bwj4qsJoaooOUDt9cbFWDlqBrT4BEMYwCXs1QqMxC/ogJ7ftsTv4eCEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4453
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507070079
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA3OSBTYWx0ZWRfX2lfrvSltVn+H 43gZ3/fHYbLohSv8LGkNBzKR4v99C/NKYhxNSwYC2Nb6ZnXIEz6W+QhfI4pAUsH1e6oPCZPBlaZ QB/ifbZzFvmWP3pGMbqiOLtd2Gyanm/jPM+BVAWMzvk/iSnPmyAk6xulfUYwwNOJzOgheVapiea
 y+PhdK2EeOgIPcOp1vh0bHfZQlRL+S8ozXpAt26qSIgGV/8GccwCQ81BXjrMOyhChIOTkYzjp86 nn2Iz+vQ6T7IQYQQgcrj3nc7ZybtlIxpML+fdfm5ZjuPTbWAQ5sUdEE64Y2oaJ0jNxgO/BZIvur s6ca4TToSq8n2YdcbhEt/34THYeoTRijEH2cgLivi978i6/ckHiM/whCjNbLZId2VZER8JLDX8L
 DKZKHw3yhFDh6Rl5JJzEB37OhdgCAG5i3VsIvK5nkjNTfxt9dEUhoR1Hp86EV5YLD8Led13u
X-Authority-Analysis: v=2.4 cv=QMNoRhLL c=1 sm=1 tr=0 ts=686bcc4a b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=SRrdq9N9AAAA:8 a=yPCof4ZbAAAA:8 a=5vQ8xbWtzla9ZvRONr0A:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:12057
X-Proofpoint-GUID: XrjmBgbN2HhV-hclBtzmPdjeMfDujXjp
X-Proofpoint-ORIG-GUID: XrjmBgbN2HhV-hclBtzmPdjeMfDujXjp

On Fri, Jul 04, 2025 at 11:19:26AM +0800, Baolin Wang wrote:
> After commit acd7ccb284b8 ("mm: shmem: add large folio support for tmpfs"),
> tmpfs can also support large folio allocation (not just PMD-sized large
> folios).
>
> However, when accessing tmpfs via mmap(), although tmpfs supports large folios,
> we still establish mappings at the base page granularity, which is unreasonable.
>
> We can map multiple consecutive pages of a tmpfs folios at once according to
> the size of the large folio. On one hand, this can reduce the overhead of page
> faults; on the other hand, it can leverage hardware architecture optimizations
> to reduce TLB misses, such as contiguous PTEs on the ARM architecture.
>
> Moreover, tmpfs mount will use the 'huge=' option to control large folio
> allocation explicitly. So it can be understood that the process's RSS statistics
> might increase, and I think this will not cause any obvious effects for users.
>
> Performance test:
> I created a 1G tmpfs file, populated with 64K large folios, and write-accessed it
> sequentially via mmap(). I observed a significant performance improvement:
>
> Before the patch:
> real	0m0.158s
> user	0m0.008s
> sys	0m0.150s
>
> After the patch:
> real	0m0.021s
> user	0m0.004s
> sys	0m0.017s

Wow!

>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>

Seems reasonable, if we explicitly support larger folios in tmpfs now as
well as anon shmem (what a concept...)

So,

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
> Changes from v1:
>  - Drop the unnecessary IS_ALIGNED() check, per David.
>  - Update the commit message, per David.
> ---
>  mm/memory.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/mm/memory.c b/mm/memory.c
> index 0f9b32a20e5b..9944380e947d 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -5383,10 +5383,10 @@ vm_fault_t finish_fault(struct vm_fault *vmf)
>
>  	/*
>  	 * Using per-page fault to maintain the uffd semantics, and same
> -	 * approach also applies to non-anonymous-shmem faults to avoid
> +	 * approach also applies to non shmem/tmpfs faults to avoid
>  	 * inflating the RSS of the process.
>  	 */
> -	if (!vma_is_anon_shmem(vma) || unlikely(userfaultfd_armed(vma)) ||
> +	if (!vma_is_shmem(vma) || unlikely(userfaultfd_armed(vma)) ||
>  	    unlikely(needs_fallback)) {
>  		nr_pages = 1;
>  	} else if (nr_pages > 1) {
> --
> 2.43.5
>
