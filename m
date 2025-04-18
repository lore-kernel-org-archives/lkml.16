Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EB32686AA
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 09:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744967962; cv=fail; b=HcN0Ntz0v/bmI4lhGw9hns6eTb2sW+DusGcbzFwOhaxbaxN4g12nSbg+AsA7xsjkRNu7RSbcHFx1xcqspid7UR/LZqAF6WJ55FbmlxLkfJNF9WbgKsGGtVQ722xL0VW/pZmJHXf9mxOVu46LUMit1Du0lNN9CMuOKcOQdDVJbpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744967962; c=relaxed/simple;
	bh=3p3PB03ROFIe3i/bHnnj1VDkE5LT+im/8pfz3Uux68Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lrHr9GGvgomCWsS4DEi0vAgBQIaKCn0pFL1qc0jZJJQpjjcGaLeqSONhsZMEl4WNHkHDlhltWVHO29UBZp9D5wiIrsyZ5PtcaDJsAJ5NBqFeJTJgDEAhETBmVkImaRJihYT4FoFqvOAFwdADzRkPUmjPDYtN7FM6nqps9PaHyBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FMfz1jfu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=b4g4MFXT; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FMfz1jfu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="b4g4MFXT"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I7uo6a023659;
	Fri, 18 Apr 2025 09:18:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=WEulJkeW1gmTcNScUA
	2AzA8D4nQFDgwPrpCCdJNudGw=; b=FMfz1jfuJDCDHsLYWpbcXyv/Hjwq5JLxQg
	9QUeRVNKerkOlQ1JA1NvCyGvnRPQ3xyRr2rVO7ljAROHXQe1hMvUywFo+B9T80BZ
	GXSKD2YmeYvLI/U+HSF8GjtiTk/Ac33lYmgEXENtFsj5TzImILylc2znN2YuSUSk
	v1aBZMSaR790SAxxVIhs8E0H08u5rIGQ5aWbQcu1e6IDstzZwtaa8k1YpuHeu5E/
	MQfGdEUt9ktNB8fpeHYMs9AzYGpc8x0PgU80ivYjqFpobEJCK/pXiqfkZgHZau6n
	E/lgrVBxAVn1zSYNU9yL7lPUKI0d0uCu4FPNqk6H7A2SnWucUsZg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46185myw06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 09:18:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53I8LPk9024754;
	Fri, 18 Apr 2025 09:18:29 GMT
Received: from cy4pr05cu001.outbound.protection.outlook.com (mail-westcentralusazlp17010001.outbound.protection.outlook.com [40.93.6.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d54nu39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 09:18:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wyGhXArm6OnWRXGHuio0xkJp75s6+3UPh16MD/D6Fownf51An+FIkvTGq7egyE7IsNiUNwTur7kcSrq6ybm//YFR4XGpm2J+NhZ0d6sjWHP/1nVn+nrK0u6q6XWRIe7FNs+u0LBSnBY0ZUYghH+H05gLyy2aQ8Zrchopc7zLKQkZZ0CiZCJ65gsj/LICjeOvfsm6EG5ZoqIUL5YsQCX1H0qqSsk73gk/SZdL0aG1tWoHeIhK7vh5rtbFZdlQUPQeOLK5nGeBbZQPKPKcrswU9vBUvcgLIeVHcbeh7zt0IH1XOVzs/Jm8q8oxEOikY9h+9c5ayTMjbrBdqr6LGmE/KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WEulJkeW1gmTcNScUA2AzA8D4nQFDgwPrpCCdJNudGw=;
 b=o49H6tL4rYoOzri3/z9pqFa1F4qd0bCY7lLSQtIe+lGqNsi2zAdQJAc/hwrcd0Gec6+ofUpDCAryL+VkCdVWk4DSCbeK5jusivX/byy/3xuPWZcRJA3P1RnFVn+3h/ydEjD2f060qqz/mHz4RT8666295A/4voVG0TMhn/qxFhH/E892bROfb+n4nOXZ4koy5UjAMYPvwpV2IgXHGlO0x4lb8/zsOwatGRkHJHWqPn5LaKro7pczcN59wRbraQx19Om+CkWYkg+pxlKhyLZT8j/SFLTPbtRMJEYse6xjAdCnO/0Hwubj1R6blbMLVaC9EpZ2Ypp1dS3kc+JAmRua4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEulJkeW1gmTcNScUA2AzA8D4nQFDgwPrpCCdJNudGw=;
 b=b4g4MFXT1shh+H+6esDFOZmbMfmTnhF33IO4OkzNGr11kyZ9ALXt49cowwapYq6wMrBOuXkc8VRKhNGj8ta7x8li5hywDzQrMgB5n1KR6DbfKTd95YuqD2SIyBg7QlyvIh9i12UrivQ5XrtFvbkmH2HNWHXu8Ov6lh8KAK//ClE=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH4PR10MB8148.namprd10.prod.outlook.com (2603:10b6:610:244::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.21; Fri, 18 Apr
 2025 09:18:27 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8655.029; Fri, 18 Apr 2025
 09:18:27 +0000
Date: Fri, 18 Apr 2025 10:18:25 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Ye Liu <ye.liu@linux.dev>
Cc: akpm@linux-foundation.org, linmiaohe@huawei.com, nao.horiguchi@gmail.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Ye Liu <liuye@kylinos.cn>, David Hildenbrand <david@redhat.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Harry Yoo <harry.yoo@oracle.com>,
        Rik van Riel <riel@surriel.com>
Subject: Re: [PATCH 3/3] mm/memory-failure: inline add_to_kill_anon_file()
 logic at call sites
Message-ID: <2aa34178-7002-467e-bbdc-c1f7b22dd310@lucifer.local>
References: <20250418075226.695014-1-ye.liu@linux.dev>
 <20250418075226.695014-4-ye.liu@linux.dev>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418075226.695014-4-ye.liu@linux.dev>
X-ClientProxiedBy: LO2P265CA0366.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::18) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH4PR10MB8148:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a088eb4-f360-463e-8ca2-08dd7e59fa2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ke6Gp/iG6StH0gBWIP4LqMDXE9A8YQqKStHPceey6QLmw1WQ4p7LHZ73WMDY?=
 =?us-ascii?Q?OaNyfgcWr//uU70PPh3/Oa2L4HQnAg4mshF3bxmoNmokUpW4wJYDBKFdaCQY?=
 =?us-ascii?Q?q+oY09DhM1XoMjuZD0trwCZaFcNj5nQ6GwYbVQMUvtYLVitVqVHFYAC/DcuX?=
 =?us-ascii?Q?HCo3gG5fibhk9/4jznQ17rw4+f2oKxpHZU5JUdK+duM1TaRp5Tt/TRfb1TSX?=
 =?us-ascii?Q?qqWsRIc43x/IKbfuZBiR5h66x8KnO8iVgixw3ubjUBAVvf0ydh+vItp8ZDQs?=
 =?us-ascii?Q?vFzk2UGE+r2f7RTHff9vhzxhzosrIom2sH103j6AbSMR/8pAyeHfSqA1MqQH?=
 =?us-ascii?Q?yxIGim7/ie7Bd1M4VcHYhQm0jyv5D6rOBTYtKRSOvCeOMApGiEB/dMgzMmoa?=
 =?us-ascii?Q?QJGNriA4XTwdEcXfwATuHaR8zEzfOb22bUAuKXTtqfN9N01rXtylP5sZhpET?=
 =?us-ascii?Q?3LQI2lWKVzI8O1lTEbEsmo02PSdeyUQi+CyFwMNyGt+OEXqf5TsCvUFialj4?=
 =?us-ascii?Q?yUo/RGKX81XYeGSSnlbUail3x5zT9qV2mYLCasv5qm0vVlplQPadm/sbZQP8?=
 =?us-ascii?Q?fjqvx3IGjqoSTNQssJjBU9iggBnVyzjpsD2CoWIq/JKBvet4nlAef6UZcqhM?=
 =?us-ascii?Q?ZlcFD1dyjoyxHJAzKs/pB63FhhmPK5FIFu0yTRu4FDWwXWNKA9IxTMDa/yVZ?=
 =?us-ascii?Q?mJJonXUrYKzP6KcvtDh7L/Tw/OCFP0LoYSpJuplkMumNBZMfCVCZbPD6dxbV?=
 =?us-ascii?Q?l6GHd8gqO5xqUo94TZu1tWJzhYteVsojuI2Tn04I3gQry4IdqOXRepoTafAi?=
 =?us-ascii?Q?Q5kXGEt8IBTcHvaygD9y0MEm4UARkIihew29MdqmpayuyNcBHGUdcbxqFGxN?=
 =?us-ascii?Q?PSZ2p7KTFHser5VGkcfYRpk9BtPGDCDOt54Tg14UTEt2Kgku3q6w1JvJhEc9?=
 =?us-ascii?Q?5G6dtSTImiGN/ltDrX0lPpIzOMt4V07PvSostb4TGEL1ADjS8uzL9Chv5dXV?=
 =?us-ascii?Q?0LZg94Kef0Z3oXvSFow/I1z5uaaXwn4YimFY1AlmNLtAnVfaSM1c3TPxwjOs?=
 =?us-ascii?Q?B5uMqSACHTjMK/TwfcqD2AvmVY6nAyoOSlRQsrqrxpASn7QfuCxYQ1YMkVpg?=
 =?us-ascii?Q?+uWlNHb5xarAfn6kRYy97O4a4OnrGf23SP/Nx4gsKvOteogqW8FWKKL+gQn1?=
 =?us-ascii?Q?n5O8zjNMpN/a5FUe96JAqZE9kqG4KuwjBHSLXqFxWZex+csrNm+xqTpK0c5T?=
 =?us-ascii?Q?EUsoNaDe8BQ4JHhfNtsuEaIqBPQcptZ39b6FeplbWFWivDBcL+GT03lKDwok?=
 =?us-ascii?Q?lK78m702a8KGpID/6cAmwP0mnlGMu/QA8KB54MKoMKP9z3K/71WgjwKFlHWB?=
 =?us-ascii?Q?Bhe3Hp1cW/V1wE+ESdmDAHvjPnJCPnm2WFk9XzOMSJDdwc3A8A+rzr0/DVgE?=
 =?us-ascii?Q?P7iUeGG4kpM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ln5qM/n2Aq667rA5d8rz4qBIP2HGgGzOGx5fAMIZmD9xEXZNzZVEZETXFnpm?=
 =?us-ascii?Q?WUGfW8U3PZD0k756TmGF4QiqH8ehI3l4BjhsTz0O/qNrDKxEso0Z2WJgWDU5?=
 =?us-ascii?Q?XGB3ZrBBwx703vcx7GKRqdpkVHGTtlShlY97cqICFgzV4NMlduZSsev4siRq?=
 =?us-ascii?Q?A+ZX3+9ltnigVYuKFsXfhAFbYMpezpqlOk9jCMKMuhxdJ54pyxnNnSBX6qEd?=
 =?us-ascii?Q?Ru0JLLe4BUvbUa5HtB6J2u1FnMSNrMeqSdHbGSlNJs0qMj9R4K03VULjI1y3?=
 =?us-ascii?Q?rU+oN9XA2ypZ5nzZbzGBonSwqxY4G54zzTR8ul0jEo+Y97VcxdnF+TXkMkax?=
 =?us-ascii?Q?BTW9Zpob7QhNNQwn+aW2HxzJ0aS6/RJUp5CnRu8ndcgktZdTPznAOLfNbDWx?=
 =?us-ascii?Q?tyMBvDEpPhLC8Sk3ncKfMmZK1M3lNU+Ht7ShqsUmtH0aQPbmkUWCuHlg5WVh?=
 =?us-ascii?Q?c6EqGQ/Db4jiLWToB+ZOLMKhn9UCrSvRgr6cvduVRBVK5mkcIbXEwvH3rkQu?=
 =?us-ascii?Q?7GpG8fkltGGh20a4fmbL9c/5c7kiIbvfnYvIwuNmR7GegFLyaMNtZNzj4Hp1?=
 =?us-ascii?Q?riwsg+SOs4bTT2nvkNbr7C+ZcjAHRnON59215xXlXnudPG8Xu0h9zzgCCz4x?=
 =?us-ascii?Q?WgXGXEQC3d7tjX0+vsBlYZ4tMIQ+LGcolOWpe5cortWj5VsO9BgXxDAASPxh?=
 =?us-ascii?Q?rzUQcjGjF2QjI3jVDCkI/9cZHdwKsLZfj3dpmd0YciEYHKoPuH5Bcb4zy+I+?=
 =?us-ascii?Q?l1isKsaay7skJpvgHjeO2+i+Y0wi9bQdxR1pZjxl5/9x4eoC+HbTw8ZrOGpj?=
 =?us-ascii?Q?Cfm6W3bxI6QV2GEnZQ/7k0JiYTJHVWX0tQL74rABDeU7FNyAA0I3ouTO9/G6?=
 =?us-ascii?Q?byRqM9BaGUmeajWUs5eQ4M3D7u6OMZeODS+MwHJE8Yo7RX8M0o1BscBR+wjD?=
 =?us-ascii?Q?JSljioAMWyk+AdJvm1qO0eWsQP/JQHstPaAM4CUaTw36OG4UU4KmE+gPNPo5?=
 =?us-ascii?Q?OP4SvdKQBxSJfckli2B0zaV8/aUWp/OgWNa9SOgCFptdyfzlYhjl1toDikTT?=
 =?us-ascii?Q?79yFZwitXEilhjsDk7or4ZdcaWLGC2rSfkxn25eh+QUv8s43Bgq3jDkzsBz7?=
 =?us-ascii?Q?y61Wk4injfToVHONQT+c00kszsj46a7uOe/WLtLvFp9OvC0qbbx7BciL+ujU?=
 =?us-ascii?Q?BboCy0SMJJwxmAQXOHBOWA8G2KErFK7eHRkN8v54/oAUbUTFach6h1hw3qkZ?=
 =?us-ascii?Q?XZd/504jodW8E0Wdd7Yv20ml86eNyohFy4mD57AVFFP981aC8FvbwWijq37x?=
 =?us-ascii?Q?VXA1Yn9T50QH4UpIiB7faDUU8Jssl2GCuoyzzuwHdohIZcB51KkjpUc7YnGB?=
 =?us-ascii?Q?p/NC6nu9sS5m+C2jOm4zfX3lSdhXQGujvfZFNt6w9xccVvlham0h6tYeTSjd?=
 =?us-ascii?Q?vvYaYBW/9ksXPK/HMzkj4lXB+nb2vWoUB0PUmdpZbbhd3KAMaCgKUYGqG3bP?=
 =?us-ascii?Q?3fwKdDvVN5Ta18iA6/TSyocaapXzvpQ60kJQkh4hHAFKxWRCNqTaO2nqYQND?=
 =?us-ascii?Q?uO1zPtUISTtGKQ/6+eTtkM/3qUR/CdzgTYRRgpWhS1plU9+JrRB/S8PqNuJu?=
 =?us-ascii?Q?nQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3C9hFO5Hgx1b9NqUP82+I4ZwPaeUlChDNkK4P01kZDkub4vZ9VJbwWVTDT/CbSMlWmh4eYs5Sdxm2Iq99vEZ6N8z8lcNlbUD91TL8Uq8jm8mEO+6OKZbagU8NI4p9Z/qaR+DImt2ZhyqGszndBnPhpt5qgqRT3Hiv7y2N1gs20XPxuOSE4PWcfSrQ2oRmkWosfVHQ3UqGQb8/nRv/Fd+6dzR3ChZ5jCsHHygFNej289W89dIFPOEhz1YpdwHay/Elre7yAuGUyBE2iDdlK846nNvZDXt3/iqVwv4Wh6uNbTCU8+OUo0odTPj5HOT2hKKIsSYsUelVJYdqmTTQekJs7z0m2KsQFI/IV53j8rWH2Nomvyc7lrGzR4UBgMJW2rnn075V9vi3/o2QiiblvHjJ7i9GtCFRubAIcIBPYvPF0PfDLAgf76KPlExlSN3mQPNDmBQzvtcc34eTHMUDVRgDpzjAyqAKvKJQAzB/iMqeI/v53rVvEpAmOJAuxTbfyLImUEUU9CvBAWdqfbx93S0IuhpzwCHcaIeYF7XfzbUV4G/p+RWKjzL9RcFztVGCI/pGm4ZB8Fe4GkT3+mmKDZbbaK/PdrXrcWMEfh6eaVZONc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a088eb4-f360-463e-8ca2-08dd7e59fa2e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 09:18:27.4419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W08vSaopZUCD2DL1HNTZeXJF/4woaID6cSoQBK2DCkmwn84G0ktEffLwheudEnFXEZjpEjJaZHWVrQe7TVpSgznKhe2KPSPk8Qvo5WsmkEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8148
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504180068
X-Proofpoint-ORIG-GUID: Je4GiESxrIavbq1fNzeNtZPCWAI3ZCOp
X-Proofpoint-GUID: Je4GiESxrIavbq1fNzeNtZPCWAI3ZCOp

On Fri, Apr 18, 2025 at 03:52:26PM +0800, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
>
> The add_to_kill_anon_file() helper function only checked for -EFAULT
> return values before calling __add_to_kill(). Removes the unnecessary
> wrapper and moves the addr == -EFAULT checks directly into
> collect_procs_anon() and collect_procs_file().
>
> This ensures that error handling is performed close to where the address
> is derived (via page_mapped_in_vma() or page_address_in_vma()), rather
> than being obscured inside a helper function.

Yeah, no.

You're duplicating logic here (the old classic - what if we change logic in one
call site but not the other etc.) and removing self-documentation of what's
going on here.

This is actually a net negative imo. Please drop this patch from the series +
send a v2 for the 2 good patches (with correct cc's ;)

Thanks!

>
> No functional changes are introduced.
>
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> ---
>  mm/memory-failure.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
>
> diff --git a/mm/memory-failure.c b/mm/memory-failure.c
> index b91a33fb6c69..ec0041c95b27 100644
> --- a/mm/memory-failure.c
> +++ b/mm/memory-failure.c
> @@ -486,15 +486,6 @@ static void __add_to_kill(struct task_struct *tsk, const struct page *p,
>  	list_add_tail(&tk->nd, to_kill);
>  }
>
> -static void add_to_kill_anon_file(struct task_struct *tsk, const struct page *p,
> -		struct vm_area_struct *vma, struct list_head *to_kill,
> -		unsigned long addr)
> -{
> -	if (addr == -EFAULT)
> -		return;
> -	__add_to_kill(tsk, p, vma, to_kill, addr);
> -}
> -
>  #ifdef CONFIG_KSM
>  static bool task_in_to_kill_list(struct list_head *to_kill,
>  				 struct task_struct *tsk)
> @@ -634,7 +625,8 @@ static void collect_procs_anon(const struct folio *folio,
>  			if (vma->vm_mm != t->mm)
>  				continue;
>  			addr = page_mapped_in_vma(page, vma);
> -			add_to_kill_anon_file(t, page, vma, to_kill, addr);
> +			if (addr != -EFAULT)
> +				__add_to_kill(t, page, vma, to_kill, addr);
>  		}
>  	}
>  	rcu_read_unlock();
> @@ -674,7 +666,8 @@ static void collect_procs_file(const struct folio *folio,
>  			if (vma->vm_mm != t->mm)
>  				continue;
>  			addr = page_address_in_vma(folio, page, vma);
> -			add_to_kill_anon_file(t, page, vma, to_kill, addr);
> +			if (addr != -EFAULT)
> +				__add_to_kill(t, page, vma, to_kill, addr);
>  		}
>  	}
>  	rcu_read_unlock();
> --
> 2.25.1
>
