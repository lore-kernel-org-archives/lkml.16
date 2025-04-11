Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955F586329
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 13:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744376974; cv=fail; b=JxkmDWh7fcs+JzmntN/312pAT0js5FQKMyZNMYaUFXXMJWSC4i07Ck9FXOX0yP18WjZAJsBCpQ/TzLqui75+enZN4Ud18356I5X3KK+oPU3yDLTZh248f/CzBYKPfx0oDllqr6sWgY7DFaXfuRjNf6AiXUSrVnsjt71lthAfSAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744376974; c=relaxed/simple;
	bh=IJJuuiXEG5Mn0pzMpY575Bx7jzMNHwD67UgYSvr+GLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MoisqXcm9rVqN3X7yxG6ZhCcbN1td7VbCV2Ddb4A6QJfML1k+NjwFUiqig5VU6at0o4KApaY9Mb/RWsBRbegJWxh/U3vbipRNcL3FZwk1897GzLBKC3GhAlvFsbioZHnpa6RIzCjyS9xLsLY4UN/5E+2RKmP9RQuIZVTDcNGkC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TICTBPR+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Zk5XlLp+; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TICTBPR+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Zk5XlLp+"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BD8lSu012535;
	Fri, 11 Apr 2025 13:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=xtVpelRcJev0HCbhof
	yTzYtJJfYCgThi3EiBEBV0XhQ=; b=TICTBPR+egcQnzfYvJ+keh5xQZSVTvcsLK
	i/LLjubURO3bBrzzlmpDwLcMd6GfHAPQxXEiCbIA2m4x3R5ckMg7fuwvwyIGnp8s
	k7zGBNIPgQRHxYWrlmWNmKQpYvu0YmAQEj5sGBddnWA34tjANDKJrFbRmjKihAVF
	9odPj/ZO6XU6o0McWCQbbsUSLCtfjYLI0yRSGJqPb++gJCIwcWmhSwuwRnfJSxXF
	hpWyYs2KaSmn5aKCOH5ZwYzuhnx27X4icNxxb6Fw9qd69NuqMjwIPQqLYRudt5DG
	921UFJ/bQDxFJORqHd7uluCkvoSFUfGY3W0/BLhyazwci5lZse7w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45y3pa001k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 13:08:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53BBb3aa023885;
	Fri, 11 Apr 2025 13:08:45 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazlp17010002.outbound.protection.outlook.com [40.93.13.2])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45ttym1hss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 13:08:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UV2M2qubVou+clMgZ+LIxooOXJYvl4RBWwiKftfPXNdW5Y1BDzz4RvVmzzIpcK0HIBckcZBl7i3uR0RPeqoQ8LoNvfYu76+P9nYOU/HR0SZmE6rQ/dxh30Yy0LJ9NhSonZTllw1AeDr9uZj4buM4/wuwyhXdCXXiqa7r7BjfEdbaR1J+7GZgiIwXIDrofsf99RNrY/Hq9G7m/kkJx8tqyD4BU9aB6alZ2G8ihD4PKLkYNwvb4ur9ynJPKUK4oh0MYpbwjXYrUgkib1Yz2GnGO6BvaReZeL8wxyGuntUmjD7K02/Qa7TD9DAq8F5ucSzbwOVDrLMHb9/4cOmxFtP1bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xtVpelRcJev0HCbhofyTzYtJJfYCgThi3EiBEBV0XhQ=;
 b=iDEuRCV6MdUxeX5NZTVU/2YEbBqKLKs6PyYdmEc9u4iP/D9U3ROsajNX09dWCYbLGx6RPrb2S73j0fPV4ezO6eMc0RNw8HBHsQlXZZUlYHGIsdjWIvTsFLYQoGfB0blMAarLKpJkobmQINADDXuE5x+2SJkQSGlDsXRoSprp1hCH54DmPdZ0TeMq8LmX3Z6GY2xLjC7daMgWF6vwbc+E/RlYgpLZhBydN+hTKQjSjVSdRb2Ufl/LMK33A7dD/hB5/izy9+2AMLHrhYY7JGfMZAM5FSoUu0lZoPFJ6IPcinmADzCVjYpi+2efrFm5147vudM8FH3cxjQifN1Sbu6r/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtVpelRcJev0HCbhofyTzYtJJfYCgThi3EiBEBV0XhQ=;
 b=Zk5XlLp+0AvJq/5IXhKL+C/QryrLUDmWAzZUuohF2ByclIbcY7EaZHtskZxTt8d0xOq4tzhaU5hp23oyXakf9SVca7A80DqdqlURyKdLwJELNpp0MWPjKwEbtGCXPg23YJWkqOaDQgRRdX9zCbnfyEuv+67JDhNpH6Ww3zSuWEI=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA1PR10MB6493.namprd10.prod.outlook.com (2603:10b6:806:29c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 13:08:42 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%4]) with mapi id 15.20.8632.017; Fri, 11 Apr 2025
 13:08:42 +0000
Date: Fri, 11 Apr 2025 14:08:40 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R.Howlett" <howlett@gmail.com>,
        David Hildenbrand <david@redhat.com>, Rik van Riel <riel@surriel.com>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Vlastimil Babka <vbabka@suse.cz>, kernel-team@meta.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 3/4] mm/memory: split non-tlb flushing part from
 zap_page_range_single()
Message-ID: <7f8b30e3-8c78-41c1-8b42-ef05ed01a8e3@lucifer.local>
References: <20250410000022.1901-1-sj@kernel.org>
 <20250410000022.1901-4-sj@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410000022.1901-4-sj@kernel.org>
X-ClientProxiedBy: LO4P123CA0639.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::6) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA1PR10MB6493:EE_
X-MS-Office365-Filtering-Correlation-Id: be11cbda-6093-490d-f056-08dd78f9fbba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g7tdXfpdx4/JI681796tHaTjY7QkYdVsCK0eh9I8alSPp6THlsiXWBFUM8ux?=
 =?us-ascii?Q?nd4x5TjbS/wIS5BCdfzNhOFoHc/dR2lNwmVsvB7M/DV7vj/qno4jpcftu64O?=
 =?us-ascii?Q?DS5RAy64T/aiT8+HIhhnoXpScKNUR6DraExNOQl2gfOBUPgS8z7CqWtrZ6WL?=
 =?us-ascii?Q?NgBbRMh/lqCbd4Ou5PWEWMMOeLFmuBX0NjRoQpF8H0g2dysmRw6MTzAEcV1Y?=
 =?us-ascii?Q?IOGaqiHBLnrZ90Z9vnKsPvG2g+kFLWXJYQrb7ywPaIaCQEHVmYdeRTDmQ+YQ?=
 =?us-ascii?Q?gq0o9bE8MH+vNw1Wc9WgNIgI3XwujxGjTHfWv4slMpg4qzpkXw5uJShg4pjt?=
 =?us-ascii?Q?gyvhCTUFL487MXNxEc6ukzmcFM6tAOutvJKKmpd7Tyng2Fc0toWk7dvI/gIu?=
 =?us-ascii?Q?mrU1tV3bIx2MHuDk+x4RYxigvByOtk/RDSsZCS+SCG7G/e29uaPiAjxwIxuD?=
 =?us-ascii?Q?UBf/TYkG9diHor//TYdbvEB8C0aUAPf1GAYXcduXgJOCNc8ic+5F+7xw93zS?=
 =?us-ascii?Q?GiRpkcczEWmRb7u4NQYJY8KIS7zwMoVrdG7CeHDQNjJwheavy8b4QV+zWG8m?=
 =?us-ascii?Q?dz17uK/NKpAXiy61V4Je4To+IYfs2fKeq2F8NVRTiAGALNdVChN5xqekazDS?=
 =?us-ascii?Q?FIoo4YEW1Z7t7TzKzkOTb6i2+zXMzPGZgrUp3+0C9wxYnRG/NwcowVjHsd60?=
 =?us-ascii?Q?jiNlfvXHNhtsGM+nPnX743v/Lwfh9J7bJymoc5UNBeahu5DAMisq+GzwLyQ3?=
 =?us-ascii?Q?f8wHdAvaU/CRiB3c8pfHbc8aNM16tSLm6f8tPSnPJlB1KxafGHinQhQPnh0j?=
 =?us-ascii?Q?PJfbKyK6LX7fGWIVtk7jkEa4YVmzphWkoXd65zjQSuLpmrvZ83Ba1yIYones?=
 =?us-ascii?Q?JCZ2/AzyxXD/RvKt8mcz6EvTFHqXim5U+b1hmJ8o6ZkYbiM23bGpenVS0Wqd?=
 =?us-ascii?Q?XHF/UOeK7qhaIZdio5Rr2He8ty0NcHlxTfjgKN7PLmKPbFjcXWXssvUTFZTA?=
 =?us-ascii?Q?N1JnPz0u7pi9RvWyPRULZ/jWZ0wjb2+MV1nMa6I7oDAe/qZftYEW/WkIA6h+?=
 =?us-ascii?Q?Lp6CbP0S8wsrfKXuC35UjCfi/K1srHW6AxZtUvOA1nsqS/uvsNxUGrnQ9jcf?=
 =?us-ascii?Q?r7QnZC/A9MdKnoZuD4/Dq1KGravmdBCkjfRSHh9eANn49p+3/3RBMkPhZ9X8?=
 =?us-ascii?Q?brq33TgorQV9Rye/gVxSerId+QGxnZWyfkui2MZwKS+Qd7PgF7m9DR1OKsn6?=
 =?us-ascii?Q?87ISVleYedik7k9KvmPh5I6z7YiU7yH66wAkgjXOfGm71Rw7q08GGc02Ybh/?=
 =?us-ascii?Q?vgzNe7z4RITwKGaVyWcymli1Ur6bstqoaCiRdEVtCeN0y2etV0P9HOuUibuD?=
 =?us-ascii?Q?dYFsUEEEholnpb0pSC/8nuYJCAF71poXcyesPiRxTsN92oCbKH1kur0nMVWi?=
 =?us-ascii?Q?oDkeCYUGeig=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iHfE0tmSjWtcNQIxXVdO34FUXJQeFzhM/GYNrqcPlD2qz8nhglU4ij9gtnUp?=
 =?us-ascii?Q?T+YhvYNOnUsqq62e78KzaMPy515gazA0LshZrdPXuySv7cMY12YEhI+qvYag?=
 =?us-ascii?Q?A3j/EFJ6G7GWtey/XfUJ+U0ACuEg83csK3Jhxzylmr6D16o9QKaM/yQSzifX?=
 =?us-ascii?Q?8Fs5cW//ELpz6mK0NVhHYPvAG3Y0lbmboKI7/a3D2w04Fs+tJeP0d2Bz94lc?=
 =?us-ascii?Q?1kQOvrJvuiWnX6thCU0Spf/kvqbJdk6eK+6BKy13SaED1tylLfHToxJuxhpN?=
 =?us-ascii?Q?8KBLkaIzZH2N4+Riv2WFzDA2jgPLCUr6N37h2opv6Ir/GZV71IcUNkS9kRTz?=
 =?us-ascii?Q?sA8Dfxukg03VMxr3H+QjJt/xWYRgDth5xRmuefM56U40EvHLHu9vmDrEKQsO?=
 =?us-ascii?Q?deZ0dN3ab6zxUvyHobYuSoC0SJE95KM9rueIoE3ZMOWxWPMeYMvxM+B5J9p5?=
 =?us-ascii?Q?me9NRmTF5BwAXH9iBKlVPO8VmOUynMuHbj6NXTs25iHPdlCspkkzc0xrwAtc?=
 =?us-ascii?Q?YCJgwVcEXtv8pqhXqOXR80B9L/TnZWtYlUTjrMjbE2W/qd+RoGJnUMg5h9E0?=
 =?us-ascii?Q?l9yClADvEbmt8Tam9CBQM5noLLNyibLezlvapjleyMIhZebj3JG+M1VngOA0?=
 =?us-ascii?Q?5veCwMpGzpo7RlX5RorzGbcq+eRrj1+nK4bUH+6GDiGbHSebwhc+9V7KzcK1?=
 =?us-ascii?Q?umYMUlChqIUOZhsDj8e6SbiGFzmgLHsblEMCBDvnLD/d9YyP8nJc2W2A4Mib?=
 =?us-ascii?Q?r1qyFa9VM+XysQ6PD7hqhcfy2f4xlmvN3+NySS/8Dm9JtPisqQL8wjNIlp37?=
 =?us-ascii?Q?0opgFmQ5vXJBE/rpCtuEqpnp9SHeriiavIJqeihrzrotsEu2gfpLv0nTXcK2?=
 =?us-ascii?Q?eH62Ne8fCkYZ6/a92f+aVkT9OpEPWzmGB0is8PbCJYlL+x+cy6Fc4pS3UbOq?=
 =?us-ascii?Q?bJuF/e4eTkY/TyKdsD8HWBvEz8cd0vJuGgXUH7ksw1g6F+j82PnqX0ZNotQE?=
 =?us-ascii?Q?MBjltrtnO19+Z0vzXnXz0wI/5LIEqxS+peNtS1bcBMWTQNx9M1fXP+BdEUc+?=
 =?us-ascii?Q?yM6R/xRQ21D01GmmAGeDElw2n2QymRK8ALBlWuNxZDazMb/lpTtUryAV5T5X?=
 =?us-ascii?Q?Ct6MhSF5xv7l2A3LyrZt5ZmE3HDIIcHGgntOVcpGbzJtspCmd9cPbzBn2Axd?=
 =?us-ascii?Q?q1fC/khHNLheumEys0DtvAZ9Hbahs192xzdmMxWLatvkaXyO9J0qxiqAykqY?=
 =?us-ascii?Q?OsW+YweerDEMULGpJJxi79vhY2OmPx4QWVw9dMxWQof4UIkHWjbvgtTjG98t?=
 =?us-ascii?Q?wV8feXvZln5BpT96aRG8Svob3uaYTAFyLa9J4km7TTemuGVBOa04sKHHgklo?=
 =?us-ascii?Q?vk57P8irOkffVnIW+mTVaokc5gaiFkp848Bw2eZkCOif86N3RmrbSt13kZvE?=
 =?us-ascii?Q?6csllJWdJ4oP0qU+MmNpT2mjk4/Zt58vIUsFiC549KTJaUpYwsTSyNS/Egd6?=
 =?us-ascii?Q?WWWOnhH30WNJoC/cHL1diiN4xU9P4cxZHhsLhSzF30eZr1qNYCsfa+s31b49?=
 =?us-ascii?Q?WiIO84FKTWbfHH+9SXMQ6UB/grJxZ9bdfxgxLQcXHgc1x2hzm9QJ2q+p8Ybb?=
 =?us-ascii?Q?dw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZY1GM/4Bl5p22Fnht+IqqTGs11o5r3aRkFoJePmt0ayOmceegW7iApOSZAZ71qsFDWwqZfhvpj/roR59roiB/Jfcpaqay6ksgq6nWzCNGAwT+zrQcqvw4P43c2g8Gb8AS2b8pqlSaOajzQA/iYceg6alH0YQ4xZl8rqgQIwwRlsA1SRUK1esqf3WNcUVFtBZa2hynvBRTfHmDU5INvpCWLzo4LQ12AEZYMHab8L7mwpht9op4FXV3lZ62gcLOEB/QKofOixcqg1fAqEPsQjycimd1pmNgVmdqzcC8aSWvFpMR9zV7rtjD56lGkMp0UJ+7uokfIVt8jzSmeVnArbu90br0SPOB+psUCjVzh9y0FMvezWJPwGYxeiZf4PwJbx42NI4Z+Tz4AgZKRk7dSvwy2vOhNJBPfA2DQn8A3Ld+aFSJakhhEgc0OncrtlY1cwkDXXVYJGiVSINr6gWuxgU7Eq/7mWPQlufVgAZPhksXOxEJyTxdEBAqGnmoT4eh0Dk3sYkGIDj2kpMWqnno8vm8uV4s6IfNRBD2hT8u2L1TVwtG73SdZ0ihtnPbiNidHqK4iP18aTfFBMzuGNFpAN4Fg2g4+XC2jpULAQ8sVZRwNI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be11cbda-6093-490d-f056-08dd78f9fbba
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 13:08:42.3041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TkEdUcRt0bcaMDXqwjUayDCRTXnQGQs2/cnjUW/AplFVGMaZ1jugboMLtKmpuH25bZn5OC3VbTPGMFcge4dIgc7HjEuOINfR4MjistsFDag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6493
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504110083
X-Proofpoint-GUID: hsfybI7nvZR8O5K6Ej6oE1Gy3QhW4BMp
X-Proofpoint-ORIG-GUID: hsfybI7nvZR8O5K6Ej6oE1Gy3QhW4BMp

On Wed, Apr 09, 2025 at 05:00:21PM -0700, SeongJae Park wrote:
> Some of zap_page_range_single() callers such as [process_]madvise() with
> MADV_DONTNEED[_LOCKED] cannot batch tlb flushes because
> zap_page_range_single() flushes tlb for each invocation.  Split out the
> body of zap_page_range_single() except mmu_gather object initialization
> and gathered tlb entries flushing for such batched tlb flushing usage.
>
> To avoid hugetlb pages allocation failures from concurrent page faults,
> the tlb flush should be done before hugetlb faults unlocking, though.
> Do the flush and the unlock inside the split out function in the order
> for hugetlb vma case.  Refer to commit 2820b0f09be9 ("hugetlbfs: close
> race between MADV_DONTNEED and page fault") for more details about the
> concurrent faults' page allocation failure problem.
>
> Signed-off-by: SeongJae Park <sj@kernel.org>

LGTM, thanks!

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  mm/memory.c | 49 +++++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 39 insertions(+), 10 deletions(-)
>
> diff --git a/mm/memory.c b/mm/memory.c
> index fda6d6429a27..690695643dfb 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -1998,36 +1998,65 @@ void unmap_vmas(struct mmu_gather *tlb, struct ma_state *mas,
>  	mmu_notifier_invalidate_range_end(&range);
>  }
>
> -/**
> - * zap_page_range_single - remove user pages in a given range
> +/*
> + * zap_page_range_single_batched - remove user pages in a given range
> + * @tlb: pointer to the caller's struct mmu_gather
>   * @vma: vm_area_struct holding the applicable pages
> - * @address: starting address of pages to zap
> - * @size: number of bytes to zap
> + * @address: starting address of pages to remove
> + * @size: number of bytes to remove
>   * @details: details of shared cache invalidation
>   *
> - * The range must fit into one VMA.
> + * @tlb shouldn't be NULL.  The range must fit into one VMA.  If @vma is for
> + * hugetlb, @tlb is flushed and re-initialized by this function.
>   */
> -void zap_page_range_single(struct vm_area_struct *vma, unsigned long address,
> +static void zap_page_range_single_batched(struct mmu_gather *tlb,
> +		struct vm_area_struct *vma, unsigned long address,
>  		unsigned long size, struct zap_details *details)
>  {
>  	const unsigned long end = address + size;
>  	struct mmu_notifier_range range;
> -	struct mmu_gather tlb;
> +
> +	VM_WARN_ON_ONCE(!tlb || tlb->mm != vma->vm_mm);
>
>  	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma->vm_mm,
>  				address, end);
>  	hugetlb_zap_begin(vma, &range.start, &range.end);
> -	tlb_gather_mmu(&tlb, vma->vm_mm);
>  	update_hiwater_rss(vma->vm_mm);
>  	mmu_notifier_invalidate_range_start(&range);
>  	/*
>  	 * unmap 'address-end' not 'range.start-range.end' as range
>  	 * could have been expanded for hugetlb pmd sharing.
>  	 */
> -	unmap_single_vma(&tlb, vma, address, end, details, false);
> +	unmap_single_vma(tlb, vma, address, end, details, false);
>  	mmu_notifier_invalidate_range_end(&range);
> +	if (is_vm_hugetlb_page(vma)) {
> +		/*
> +		 * flush tlb and free resources before hugetlb_zap_end(), to
> +		 * avoid concurrent page faults' allocation failure.
> +		 */
> +		tlb_finish_mmu(tlb);
> +		hugetlb_zap_end(vma, details);
> +		tlb_gather_mmu(tlb, vma->vm_mm);
> +	}
> +}
> +
> +/**
> + * zap_page_range_single - remove user pages in a given range
> + * @vma: vm_area_struct holding the applicable pages
> + * @address: starting address of pages to zap
> + * @size: number of bytes to zap
> + * @details: details of shared cache invalidation
> + *
> + * The range must fit into one VMA.
> + */
> +void zap_page_range_single(struct vm_area_struct *vma, unsigned long address,
> +		unsigned long size, struct zap_details *details)
> +{
> +	struct mmu_gather tlb;
> +
> +	tlb_gather_mmu(&tlb, vma->vm_mm);
> +	zap_page_range_single_batched(&tlb, vma, address, size, details);
>  	tlb_finish_mmu(&tlb);
> -	hugetlb_zap_end(vma, details);
>  }
>
>  /**
> --
> 2.39.5
