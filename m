Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5831FF5F9;
	Sat,  7 Jun 2025 08:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749285361; cv=fail; b=RwARTcZCW2rpqRepFluifSQmCDtozbeEilctC/DEwF3iNAX3PgOcJAnuIDn9FtiWQzJ+mmojWiFShKs9P+2jvV+k3vihiZ5Dt13fOn1VHRy5GUv/IkBQmuQf3hrF4vLJQV60IvQGREmA0AFSGuIjcV/PVTZGqM9KVsk87WOQt58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749285361; c=relaxed/simple;
	bh=7rNhM+myVyPALWxid1nvi16f24KLfwM7Gu1EuznJ5Bw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gRmsByadOIMgARciCuuUSvEMdQws2QbAhzr+NnnFgt1nTD4p1xeonjbfkaKHa1j5CIIKlD640bLphyQghMWKexx59g8Hw34hihXb+XPBF9SJrlNwIigCevObrIaFN7XT9YFFrAeM445f/NxlpH4UCDC79Uq+9JaVdvtA4cDdkX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZN+JSQkQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=eSLhASWo; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZN+JSQkQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="eSLhASWo"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5577iYif027528;
	Sat, 7 Jun 2025 08:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=UNDor8zJvPL9ZIjQFt
	XpcQICif1WDbKmQfdCqnEhirE=; b=ZN+JSQkQNlFZurFJ5NXKVSJ6Knt014SOko
	HI6+A6Vc7x8tPT4lCFWYsQzXDQYCk4RL9HH9hvTpzWjcBKi1kh0OvRo4vBticMy1
	gpWL2Ltsvw/QR0cyAct4mYZgdpUqMqkWoNwt1JNPl2Dak+NkRA1SBF8ptNO1xaHk
	tJMOvd7offd1eGrZRZ/UU8GMVA1ZTgRDZTZD3jFl1hRSU2C365tIAbiK1B1GNGEJ
	77clGpCyBeA+/bxt9AJLQnZIwBeQ+2ULotQrqQqsfZvuIdyuKcQPH4k1VuLDtVhV
	ou98NG7NLIcIAA+m6MRmxwKma0DC8c/SR/D4+2ooHys05paK97aw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474d1v04fc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 07 Jun 2025 08:35:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5576OBiw020255;
	Sat, 7 Jun 2025 08:35:04 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2051.outbound.protection.outlook.com [40.107.93.51])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bvc5xcy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 07 Jun 2025 08:35:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x+tyWcTLHbG83Wagr5ccyE3WrGjXR58ck/kK9ZcG6jOPUoeTyBAcHbnAqDzMucFvzieEsad62xju4vjceH3XxXm0lVMdXnZanIUr26fPMF/yK5kPYLW0j5CO1LiW80eyCnhuwGpXU6/njQq+7lLIPrdXT9cI9W3aQi4ChoiRT4K+ktkJzs1NM6GgI8d1/eNjAi6NgI+wSpG81InZzTVEUGipZsw9eYRrRaMqT3YZwOKnu1zeLRy4poznbhqKgS7+mn6DorODnZk4w3Dhhu+d4NAAFpUPBxDgDMiIh/KKYRFG2oVrx6h4BmN9AJKVp0QXnePOsLL5orkt6CtME+u3KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNDor8zJvPL9ZIjQFtXpcQICif1WDbKmQfdCqnEhirE=;
 b=RF/BD0tSOQnMWm93HAgEJ59ILRegVCOxS+C2uc8vF/qDFmO4pymIJ6J1awWDQPphzO2z55Umkc5mD26xd9rpe/otjYnGiGSHOuQbB2+SaWvR1aBrj1YzBEslLLV3z1Vpuqw2+T+BNW1JhmkKBakfrhtJydZWNXStsFDwhVsV4B4RUqMOIYlZ/Z+MllDntv/JajZ+2FiAThCJOU1mD0P+FrCvv9UVrAhYp/QSXsLumeES2idfvXeSI1NLcFWaJwVgxlKw/z5gi6fQolg6rj5YxPZUdajX3jdw8fYa/G2fU0GfV/lyXjnt27DUn8dPeq9f6EyzRRx5F1FhMymaVce7Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNDor8zJvPL9ZIjQFtXpcQICif1WDbKmQfdCqnEhirE=;
 b=eSLhASWoXFhoqjFiedERERkwTiQsT2r6XSjYrfG3UYxRGFclIpSL1TKcLU2L5DZvTFaNjvptNEoLyfPmc6eLbgCQrPtbI+hmde1T06bgIT8RIDNo5oSWa4NmXJzlOVpQeYLsmFJigDpcEo4ZNyWf750YMzy2BnkwFAw8+gVN1/Q=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by IA0PR10MB6769.namprd10.prod.outlook.com (2603:10b6:208:43e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.25; Sat, 7 Jun
 2025 08:35:01 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%4]) with mapi id 15.20.8813.018; Sat, 7 Jun 2025
 08:35:01 +0000
Date: Sat, 7 Jun 2025 09:35:00 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Zi Yan <ziy@nvidia.com>
Cc: Usama Arif <usamaarif642@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
        linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
        riel@surriel.com, baolin.wang@linux.alibaba.com,
        Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
        dev.jain@arm.com, hughd@google.com, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, kernel-team@meta.com,
        Juan Yescas <jyescas@google.com>, Breno Leitao <leitao@debian.org>
Subject: Re: [RFC] mm: khugepaged: use largest enabled hugepage order for
 min_free_kbytes
Message-ID: <c6f3a80e-b5d0-4790-a783-69f47c31c39c@lucifer.local>
References: <20250606143700.3256414-1-usamaarif642@gmail.com>
 <A409F7B3-A901-40F9-A694-DC3FB00B57FE@nvidia.com>
 <b807deec-99a9-4691-9001-c2f3adf586b9@gmail.com>
 <35A3819F-C8EE-48DB-8EB4-093C04DEF504@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35A3819F-C8EE-48DB-8EB4-093C04DEF504@nvidia.com>
X-ClientProxiedBy: LO4P123CA0346.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::9) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|IA0PR10MB6769:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dd4053a-f933-451c-c48b-08dda59e31eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r9YI8md2STwBgKB52lLJYSeyK14HDtF9Lg8cgoUEd+PPlqGrKeaUwSrwDU8j?=
 =?us-ascii?Q?ebLdBV2UZp4gIc55kWeqI+/9wc9XqtE0dCmrS4eIlwJWuFcc/PL43zCQmoxf?=
 =?us-ascii?Q?0rwIFA6wqA0r3RlSjphY5qr1suhzqRVg4Hp7KyCYTSuEYh9TmlvVSNUxuHdD?=
 =?us-ascii?Q?ZHd0Tt+1K9SOkNh+F/o9e2bWEgNzlFUXJjKI+/BiZrEeVDsqyF7/zBbRyz0S?=
 =?us-ascii?Q?Bva5i2BSgeX8yv/8GW9BLfRgnsIUc+wk36Be39+NR2EtKS1u8bTOf+C+HBiQ?=
 =?us-ascii?Q?4t3caeUzKqdIQicOSaIhgGLcO3nFwyIk4D2knBwGEOH9qU9zVwd4CocS4NQs?=
 =?us-ascii?Q?+q5BTkGrVBDzvBkl5hxdQIzMwDg47NiOpvwO3G3uNLX3RNhsHLFenG0QVx83?=
 =?us-ascii?Q?GTwqBpykclnzRlT4TWyq3mBXbA6gDj9tNHBRTINeLfkp2OQ32ElnHP5m/OSN?=
 =?us-ascii?Q?vf5QhBcQpZuXVhJxjCSK8PQZtU5+LhPLsGXgs8F2BJXN+O9grT0rMN/UqmJr?=
 =?us-ascii?Q?yKgECQTZ5j9Giho8bKsbncrh+USXxyda/GSAQrYpIVNPP9OlwNOke667SChj?=
 =?us-ascii?Q?YDu1W33vyuvnAE6QyZCZSxoo09cPwedaS0wIehNlWjjTZ7iQFFnKOxa84YX6?=
 =?us-ascii?Q?taEKGYPF4urR1hPfWvcgJYBS7dLvmCRPQdDw9ORPCNZXYP8fgHtw3kXSPH8Y?=
 =?us-ascii?Q?UxQTeYp8g0yN1cDQaQXEykwb+9vM/NRHnv1+bzPToU6tGgO8WBqaXwOqURph?=
 =?us-ascii?Q?ow4VnBmVoL4506f0s4h2etbPPvx/VnCg0yzDAZyqU4KulryGiON3pmGKJXkH?=
 =?us-ascii?Q?KLfVxnny4L8FvhS/uV3F68WUx/w5CgX3N/CKCJf8NkSlx+IZlyVHoHwRnjfb?=
 =?us-ascii?Q?ZNzi9NB4yWSr4PrrC9DdaAxDAT1ry+qRvDRl2/dD9Z4y71cQtD+tg7AQbRB9?=
 =?us-ascii?Q?xq4v+gtkeNX5kmn0LJhTIllgVJlmdLj/Q/7Kd6KstdIXsEx9Gvd4Y4GvAu03?=
 =?us-ascii?Q?Iw0M8qRdL+I9Ma8Ghn0dTt/zIiFT4YDqu6cgNCEpM0QRlYqsfZeWS89Yu7WZ?=
 =?us-ascii?Q?IYC3y9hpqImSBlN4eqhX7BtDqncWIz670eHxIFlPlyKWV4NYRZIOEZcLuHjY?=
 =?us-ascii?Q?pi3wTFI8aNzaoKymAAjz25rCDTwUYt5McWGXEtU9b7OY8h43HuDSY/Uq5w9x?=
 =?us-ascii?Q?F+aNjK7jLfFjfwt7zdlVh7m8cc/pdDFsZ8pDGXF7UsbUgx+I7LmkKO9Gj5q5?=
 =?us-ascii?Q?YnHM3pHeX4u8xVcp+tsidFp4Dp3U/Oia4obBv/eKhlzhHYEjiR14Xi8miaW8?=
 =?us-ascii?Q?4K3aZriRIsyyap0I0BxBw9DupBF1gF5Dq0WZczhenIELilx55wzE3THti5yh?=
 =?us-ascii?Q?nLtg+FAqFJsa8Mwq+Uf4cg2lcVM5GUYuq18nt94U8q5RmvPNPT15v6Lnn022?=
 =?us-ascii?Q?bAQgca+y2+4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jVq/LpERdtwnX2+b+QB83qgh1M10iWR7yZQrUUnJfxWJWUgWZTtuD/O9ofH2?=
 =?us-ascii?Q?YifhqF2Tj7eVwTtXPhXVC5sDY6NaWdtRd0es++igog3Ajghd0x907hECl525?=
 =?us-ascii?Q?0FoFlIoHQC4yM8LzinPLPe/6L1SN1xcxAjXprCbyKgrIF0lMCb6S2sXIcN/y?=
 =?us-ascii?Q?9WsFVmG0sOc5KOEWc9FGdnMXfstYyxiO59c2eh+1PO6cxjLMdtwyu4GJcd4r?=
 =?us-ascii?Q?shjm78pqWoC8+DmBFOeofnBXiu0tthR8fLw7tGe0PrTjZ1lW+RlWsjons4vz?=
 =?us-ascii?Q?G+/pOoGcMR7/epA9HUZnSqlHi0kyPwNaoCNu2dLsYcRH9+f1o1eCMX5cwMuW?=
 =?us-ascii?Q?nHljoO8a/0XYVDipUITj74o8bQ1/EVkaG6zMpgJDa8MUfcRJm8ehfKaCvZ9v?=
 =?us-ascii?Q?FpfJpN7i6rYgx6eoGyUIJqgKP17lSGQcFm6/9XbAcZs2EySt/yU1FYwBIgoO?=
 =?us-ascii?Q?M6mC6Jsf3UbV5DUjLAHNoV9cSVomQixnWC+w0A6DZWHFjauKXlV1R6r2TSBH?=
 =?us-ascii?Q?topyEowr1R60RQI1ME5u3m5yX4Zp0vCmJLk59OkOr4Cz59crwSWtPzzgO7qA?=
 =?us-ascii?Q?dxs+P6fLoD0wT4GVkZKNraY3UG2/n3JWnz9yTqCnrpb6Rf0B8+FaLjgG/G6Y?=
 =?us-ascii?Q?r/Y7PhXoOTi3CwwagShXJcn98HdnuIhdYJIDNk7Xo2eDfcdoHMww9NezNzcc?=
 =?us-ascii?Q?BcwRXqGPI86DNLtk75CfGJAeF1ABu6NpHCLvamZhXz7YtJRG2gfM4QRGfs6X?=
 =?us-ascii?Q?sabC6U8Ot/CjvqOJ4aFP5Ogp3jdSTkV8Y33DQd140JhTl62U7ENbgltsS0Oh?=
 =?us-ascii?Q?q/PphjdLSP+2TcoJYcQpUdlcRSfQ+lXjyQVFzQvgsa4K0uU5m51Tfptzrm/M?=
 =?us-ascii?Q?qfRmvnKjUOaYcRTdQyco3QcWmKhq4d6U2VFRpqihmaOqVAfAS5Sn7De9X56H?=
 =?us-ascii?Q?wlh1AadhxdjjzNVWoGJmt+Mz+Ffan8sfLk1Wp6s8v2ljtrangzIMYLkM0PtA?=
 =?us-ascii?Q?8Fc6wGV3XLQpjCCCgtKxCSmHfogIzUXG4Yget3uRVGuHn+4Q0UTdOguD0bTj?=
 =?us-ascii?Q?sr/ohaxDv8Vc5xu9Y5rLHl7UUHerb1A8vkmJ1I4V8e2otmFU38wBbFS27o2m?=
 =?us-ascii?Q?Z1yQpqNBPYYToo27/hNcgim6xCo0NgtsE7HnHSDS793rZ/rK3IKrS5h0EvqX?=
 =?us-ascii?Q?JEj2gaumZixV8k1rIWO+sEL8HlJfZfwMF8gmf56jK+hR+iYyGizenOlJ0RKl?=
 =?us-ascii?Q?iB2g8ZprGxTSStFL6qlLEw6V0jNcwlG2SO7hOcy/N1iQmzzGAHnZH9WaC3PH?=
 =?us-ascii?Q?odw0Rr60PnAGgv7u7qEUVjNkzMKfFhTMorZ9IVTKEc3GeEV27t7tGsZD5IHa?=
 =?us-ascii?Q?kNeuaYeM2PjiddYjpDhs31qN93yakoATsT6JB8jPuuF765Nm0UNjTIX6ZTWV?=
 =?us-ascii?Q?AkgnkqxCbSq/Xt+w6ZtVkwD+twT+nZGKAEvYpVyrxpKEfr7LDwCjM8MIFsrA?=
 =?us-ascii?Q?YQnc1jPu3N8urazGHfIujrxgHgkWdcqknSRrJKvuMljHRFArte+K/UZikACx?=
 =?us-ascii?Q?xAPrKFynp116pb1MdOGaKe83zItUpYUKmQIR5j6e/G0MqNY/pfbsabJg1lpi?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TZVlPGCg755ZLISbTy9bO/oh2GyFB8Wtvl7D/wYtmz+jJC0fnKdAC5A0UjTwTP3kpJrcOUMBy9I/eisAAd6yxD+exZSP3M/201benhSYbaryzIalc7oPQfn+sVLascfCjonMyIvyQrroSa+gCXDrM9JyxE73x3uckAfW3fsHBlyvE6mU2Fu2De5TXS8BLTEwBICM4+PvRlLnLrDWVNk0l8YjYyS5Tn4DoONcBihY9ff3ibzsA38zQawyN+7ItI3wWR74Ga2CemSDNnszv4bzktpXiKJmWoaIDrWPa6ScDKdjzFV/CReKbEquqRuYMs3U45D6m3SKNO29nsaiGl8n+VT+lpBOJThdL7TbwRWkajDfz+NiB++Q5b4e/6DqzTEqg+/ami0UMpjkl0vOpuDIJJP1mLBcrO5Iakgx9PB9kkJ5U7jqTnIu1Sg9g2KT5YJkOE3yqLb0dvHP00T75Zo3WHsVq/VFQALFJ/xpxkmjRNhsVYSM67XfXct71k8a/bfUw7wIz81NOKzA2j2F6oFI9jZr8yOzyqlRTgjl7nfYHuh166n5cXQV8LrvuMx2hrZosKR4BpbOZ78/0jUdjJu9iBC+unR8LxObNi/f6P1rLOY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dd4053a-f933-451c-c48b-08dda59e31eb
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 08:35:01.8420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZaRF9hSSUYCcYtSJMlHUjZZjtvMYh6rDPOfAZ8/hmx12uNXPPhDBUy8Un+2i09VFEbKr1u8cUviRcmu7q2CX3SYjZDuIYo7IB2gUNVivDfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6769
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506070061
X-Proofpoint-GUID: ljtMrnB-2qpIJVUxVfmxccuyrljATNa-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA2MSBTYWx0ZWRfXxMN73XlbFXcu 60tjg7erhyPfsL5OGv5L63cL1Cb5vj2t98VJ7ufj9VBFIoAdcMOoddiQNVIRzu4YNZxKAikrobB MgAlosUdFU4mTpa3mIFWzgZERANBC4om6FeeRc81ndHiaRAniUYnKc6feNRlku3SAnRkK6eqWP2
 SeO8rHP8fCQYk4VVnPTvspdYcFwxIKdhRG/LdUCgTsGmx3whlNAw4AbZkgVV5a1YxdVAzZAcRgC q2rILp+hnwGGyYAl3UfatsbW54bQZXtehlAp+h9T3MaPhTTWe6DjaArIZcpCT9jvLS03jyUIcwq geJiqaNhkG0NklZeyoPXSChqT4YruUBvHXMkYeeTi3mTxZxC6UrOhpcaHsY4FC+fUGT31tYyPti
 +5HEEn3AYqYK0I8B8aO7TqWnF+xuErqnkngAi8/RwIHUnJJ15w4iTK8cvg5X5Mf0uYE1C7VV
X-Proofpoint-ORIG-GUID: ljtMrnB-2qpIJVUxVfmxccuyrljATNa-
X-Authority-Analysis: v=2.4 cv=d731yQjE c=1 sm=1 tr=0 ts=6843f9b8 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=2ODr4BAumaqrhBJ9y9AA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13207

On Fri, Jun 06, 2025 at 12:10:43PM -0400, Zi Yan wrote:
> On 6 Jun 2025, at 11:38, Usama Arif wrote:
>
> > On 06/06/2025 16:18, Zi Yan wrote:
> >> On 6 Jun 2025, at 10:37, Usama Arif wrote:
> >>
> >>> On arm64 machines with 64K PAGE_SIZE, the min_free_kbytes and hence the
> >>> watermarks are evaluated to extremely high values, for e.g. a server with
> >>> 480G of memory, only 2M mTHP hugepage size set to madvise, with the rest
> >>> of the sizes set to never, the min, low and high watermarks evaluate to
> >>> 11.2G, 14G and 16.8G respectively.
> >>> In contrast for 4K PAGE_SIZE of the same machine, with only 2M THP hugepage
> >>> size set to madvise, the min, low and high watermarks evaluate to 86M, 566M
> >>> and 1G respectively.
> >>> This is because set_recommended_min_free_kbytes is designed for PMD
> >>> hugepages (pageblock_order = min(HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER)).
> >>> Such high watermark values can cause performance and latency issues in
> >>> memory bound applications on arm servers that use 64K PAGE_SIZE, eventhough
> >>> most of them would never actually use a 512M PMD THP.
> >>>
> >>> Instead of using HPAGE_PMD_ORDER for pageblock_order use the highest large
> >>> folio order enabled in set_recommended_min_free_kbytes.
> >>> With this patch, when only 2M THP hugepage size is set to madvise for the
> >>> same machine with 64K page size, with the rest of the sizes set to never,
> >>> the min, low and high watermarks evaluate to 2.08G, 2.6G and 3.1G
> >>> respectively. When 512M THP hugepage size is set to madvise for the same
> >>> machine with 64K page size, the min, low and high watermarks evaluate to
> >>> 11.2G, 14G and 16.8G respectively, the same as without this patch.
> >>
> >> Getting pageblock_order involved here might be confusing. I think you just
> >> want to adjust min, low and high watermarks to reasonable values.
> >> Is it OK to rename min_thp_pageblock_nr_pages to min_nr_free_pages_per_zone
> >> and move MIGRATE_PCPTYPES * MIGRATE_PCPTYPES inside? Otherwise, the changes
> >> look reasonable to me.
> >
> > Hi Zi,
> >
> > Thanks for the review!
> >
> > I forgot to change it in another place, sorry about that! So can't move
> > MIGRATE_PCPTYPES * MIGRATE_PCPTYPES into the combined function.
> > Have added the additional place where min_thp_pageblock_nr_pages() is called
> > as a fixlet here:
> > https://lore.kernel.org/all/a179fd65-dc3f-4769-9916-3033497188ba@gmail.com/
> >
> > I think atleast in this context the orginal name pageblock_nr_pages isn't
> > correct as its min(HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER).
> > The new name min_thp_pageblock_nr_pages is also not really good, so happy
> > to change it to something appropriate.
>
> Got it. pageblock is the defragmentation granularity. If user only wants
> 2MB mTHP, maybe pageblock order should be adjusted. Otherwise,
> kernel will defragment at 512MB granularity, which might not be efficient.
> Maybe make pageblock_order a boot time parameter?
>
> In addition, we are mixing two things together:
> 1. min, low, and high watermarks: they affect when memory reclaim and compaction
>    will be triggered;
> 2. pageblock order: it is the granularity of defragmentation for creating
>    mTHP/THP.
>
> In your use case, you want to lower watermarks, right? Considering what you
> said below, I wonder if we want a way of enforcing vm.min_free_kbytes,
> like a new sysctl knob, vm.force_min_free_kbytes (yeah the suggestion
> is lame, sorry).

Hmmm :>) I really think this is something we should do automatically.

I know it's becoming silly as Usama and others have clearly demonstrated the 'T'
in THP doesn't stand for transparent, but I think providing a new sysctl for an
apparently automated system is not the way to go, especially as we intend to
make it more automagic in future.

>
> I think for 2, we might want to decouple pageblock order from defragmentation
> granularity.

Well, isn't pageblock order explicitly a heuristic for defragmenting physical
memory for the purposes of higher order allocations?

I don't think we can decouple that.

But I think we can say, as the existence of PAGE_BLOCK_MAX_ORDER already sort of
implies, 'we are fine with increasing the chances of fragmentation of
<ridiculously huge page size> in order to improve reclaim behaviour'.

And again really strikes me that the parameter to adjust here is pageblock size,
maybe default max size for systems with very large page table size.

The THP mechanism is meant to be 'best effort' and opportunistic right? So it's
ok if we aren't quite perfect in providing crazy huge page sizes.

I think 'on arm64 64KB we give up on page block beyond sensible mTHP size' is
really a fine thing to do, and implementable by just... changing max pageblock
order :>)

Not having pageblocks at the crazy size doesn't mean those regions won't exist,
it just means they're more likely not to due to fragmentation.

512MB PMD's... man haha.

>
>
> >>
> >> Another concern on tying watermarks to highest THP order is that if
> >> user enables PMD THP on such systems with 2MB mTHP enabled initially,
> >> it could trigger unexpected memory reclaim and compaction, right?
> >> That might surprise user, since they just want to adjust availability
> >> of THP sizes, but the whole system suddenly begins to be busy.
> >> Have you experimented with it?
> >>
> >
> > Yes I would imagine it would trigger reclaim and compaction if the system memory
> > is too low, but that should hopefully be expected? If the user is enabling 512M
> > THP, they should expect changes by kernel to allow them to give hugepage of
> > that size.
> > Also hopefully, no one is enabling PMD THPs when the system is so low on
> > memory that it triggers reclaim! There would be an OOM after just a few
> > of those are faulted in.
>
>
>
> Best Regards,
> Yan, Zi
