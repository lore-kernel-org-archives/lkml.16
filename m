Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5B5215056
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743433860; cv=fail; b=RhQJ96rhH8JlPfBa91dF9iw9hTHsOFzNhcUKcVLH5hPpCpn1kPnATjcbLIfgcn8URQxarpK+LRuZygQbMYfevEJDNKzTUFgNxqh8c4tJMCP9kaTQOU+0PwFHzon4uuNNnHjl9NlEJ+2NbRUBQkAheOCREdDzogZeDt+yS+Uzvgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743433860; c=relaxed/simple;
	bh=ibrXTRNjpInYXmQ2T2o2FU+2aWEGz4gmhULvaJAIFWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=o/0YHOwr7DCzc2/TjkRDMWf8BI/Y0s2X4QFM2k7YLxSffSfjiAAjcSXUpM4c9cPNM+d1DO4V2IVr79aaVTZQekM4BcdK+XUFWfaoQNehl7VMrp7WjgclsOyT4QfLXljA1UD/qk0Pv5+dTcypft9dz5RgNO9DLcgh77Af1wcmkTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Pt0rz10Q; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gCqY3LNF; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Pt0rz10Q";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gCqY3LNF"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VEC2G0002225;
	Mon, 31 Mar 2025 15:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=na7rbBrlDWiI4XUH1Q
	TmeaCiKqGZRb9/z3FSFTU50z4=; b=Pt0rz10QHESIhdbaQq/9AzoKd+lq7g8hVJ
	2+1/eoi1wUG1hbUoa4LQPOQliAYXBpR0t9JCi2cyUgW8w0LVQctzpgZxu0MXzI5y
	shgc767aK9gPUhiw2685RBGtdMw5UiA96WE7xiN/tXHg/y67XexbcV5M/osXUsLE
	TDpcuz9td6rDkvR8V0X22XFY80+K0E1z1tyUifQ5kcE+VK4dUxBg47ZzWTXCDM93
	V5WUCUAbkcNxlabWUtVf5PfaOPQQ9s7aqQCCNFf4dHVt604vcY2Fl/FEg7ugJy0l
	CAhfdVSmKet2S8dCtMa7tS5o4H8xAOts+YZPVQflTrC4H7f03q8Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p79c3f73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Mar 2025 15:10:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52VDoHM3004236;
	Mon, 31 Mar 2025 15:10:46 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2045.outbound.protection.outlook.com [104.47.58.45])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45p7a81whp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Mar 2025 15:10:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQ+JuoSQMarjsQFSuUd7yC4WWP3F1iqJ+95RojEFfRjvWAzrvPtxo39jV29jrtS9lJlwy9Qgvd2/D7+pQfZmWeSLVXvwSp5JyqJHkBLJnALsbabTgAYqJ3Qe19EEc4l2Ei9mcZy9AUVK09c+vHZXphqt9BiEMB9IQrRM1I9e464SVm9oIzpke6hEYhuxAIYrBdVowqwVPOqg16Kf/rEsXLO+GoGgAf4rLJ56DaTvq03+iDi5xXZflHNZ7Z6/8A4OYTvDp52PbDMjpLV+Wg2B+hnRruwnTc8pNtSfmpTNJ5D7/P98QuWHjA0QbloVnvzvEXpE89OCCFuafGtZFOABVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=na7rbBrlDWiI4XUH1QTmeaCiKqGZRb9/z3FSFTU50z4=;
 b=baDPMOlzILDzVwyxAUajKPR2MR0e2nG6CeDEDPvwsrbQcE1/S71rp13ofOXuzuiKoiyCpqEul/zf0BNX74p7TwCzCRWsaBMXYnap04/8HNds398KhPudldFRQYrWMjBS3JvVeUp+NuGpV6J52Lz/fSuOPBUbRLyTReIvtDtnCy7pQT8NpZz72axs+S87yhhYJ8nm5Y4EjbGwc8hTn/mNOCJNbw5cD6sGeMAZQqcI3JGQTk8TS4pWZwdgUM2SjuM2H1YaodYeQTdYI1LSaZOAjIlMOmvORnqJmqZb2xbBgAKYiKbtBQ6qg4iJ1h9y1Pg8RpM/cVY1E8LOzEQjUX0c4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=na7rbBrlDWiI4XUH1QTmeaCiKqGZRb9/z3FSFTU50z4=;
 b=gCqY3LNFNqbd54WD8qzqZgv1TWe+M2bHMhA+agVMmqOiuSnX6NQ2NRvTJLLbzvRBLgaSVbWzo0goqB/gosi7u7vbLgu/t7OtNMIZ2U/U1fmBpPwJdSpWqWmYEGJ6Ss+DApNo3lxWrnHIUqtJsEOqvqUtlMEyKi4DSlA/6gcle9g=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by LV8PR10MB7846.namprd10.prod.outlook.com (2603:10b6:408:1f7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.38; Mon, 31 Mar
 2025 15:10:43 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%7]) with mapi id 15.20.8583.038; Mon, 31 Mar 2025
 15:10:43 +0000
Date: Mon, 31 Mar 2025 16:10:41 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Pedro Falcato <pfalcato@suse.de>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6.15] mm/vma: add give_up_on_oom option on modify/merge,
 use in uffd release
Message-ID: <1f9436a5-65e4-4027-a22d-9e5500e34dba@lucifer.local>
References: <20250321100937.46634-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321100937.46634-1-lorenzo.stoakes@oracle.com>
X-ClientProxiedBy: LO4P265CA0106.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::9) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|LV8PR10MB7846:EE_
X-MS-Office365-Filtering-Correlation-Id: 25f63655-93d9-425c-0461-08dd706634e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Jy58nmNpTKTjU+h8GjPUWqgw4kRJpXNd5ejThPgMsvODM8eVG2ievYfFmEiY?=
 =?us-ascii?Q?hbRE5swaces3pmGfkO0O1FUHx30UA/XxAPRx8C/6cSJ1rLPpQgKglstAofpw?=
 =?us-ascii?Q?bfSjlJtzRGZr4v8bgCBPHfrQzPsXRJj7M5NTXkbLehc6BXaC6b+n46ulp8/n?=
 =?us-ascii?Q?i8i4+Hu8x5XZOQdZRiLbNLJ+0BJqsPJGxzXxHgwqh+W9CrIejoZV44B8wPHe?=
 =?us-ascii?Q?Bq1vcaecJ5Ow9Va8GnLpHui3kOJMLhdNKpJ5WtEdbO3wXZADc/i4G7y0TSXS?=
 =?us-ascii?Q?Ro5GE0VDT6vcO0d3BX7hovmYAB5jmrWxRxQylYzacvIROBDuJ50bUwnr5auR?=
 =?us-ascii?Q?oPdd4hhvzu9FQyGs33tLcJHaHMgxO+JduLrZzT4O3m7SaRgiG1EawDsn+uQ3?=
 =?us-ascii?Q?cwHKXkTEzub69I55tVNDyL9ETZAHtNy34Gtz+LEY0MTtC7A+Oj1K+wLVf3JG?=
 =?us-ascii?Q?K3IHOFiS2WjPKsPyPJbxe6xKTktWpg/PcESOZchp+DVCUmfFK0DVm8hFHM0V?=
 =?us-ascii?Q?un4UTadVGnc8PJyVKe1IDInwHOklgtVdKiEoNzHpmg5LS0+vqsNFWs8HhApJ?=
 =?us-ascii?Q?XP782veGmABMO4XmnXODV+XTZQv5sWDmWSdeFRJsOkGIhznk9XbqEIdxX74j?=
 =?us-ascii?Q?dtbKH4GVgp3xILXFMJkjAF+TERkgEpw7ljDMR9mNjgIRvEPykZFbUJWrl7G+?=
 =?us-ascii?Q?yOoowoAHy+C+gLP+6r4m4+ExpLfdQX0owUCtp4wNzJi5no1UlDHNEiftwoYN?=
 =?us-ascii?Q?v9j1G7PABDc7/atiwTqNENJ6kvZq4H8HT6gF5JVmJKZcH8/xwm95buae2Fje?=
 =?us-ascii?Q?McjRwIX6v4RRdehZkoZvPX6SOdyiw+2eTX3yMHWnjo2cIjOVLsRcjaPq5DWj?=
 =?us-ascii?Q?D47oBnHDEnjeWzTRTAtoTpzXVv/rVl9+eeqJWVGEbg5glJ/qxwV1Cuj9aMnF?=
 =?us-ascii?Q?8nMp8qmKOvX/6rj00TF5W0wZAaVh9Z6OqvMxB1pwiPbcHRX2fzuH41j/1kJj?=
 =?us-ascii?Q?eGFg62B0EcRFYcbTL6rcYIXcERn0gT2sjtN4x6N7UuxtRLN1fBPJb9+TR1JW?=
 =?us-ascii?Q?cjwMcsfdC4kvyZy7dKjLgleY4L4VH5rmXNjLbDaqUIMWlJ2sZ+G36IJDo5Hk?=
 =?us-ascii?Q?3LKcxi9owjsp1LxLjZ5/KBDiVxETu9tWH+Y9iI0syGvS54U+b1x440p61qkM?=
 =?us-ascii?Q?+Umgx//EeV+ZQmeurKYMPpKs9JEjnwM/NX3VU1/kkiXTmPPHJ7JZqnFbXWKX?=
 =?us-ascii?Q?X4xtf+fB6/3TeGKQ1c7aT5aKZ9pmfwvCjj6QsCU/+OdYwX+WGmp68CSc5gc/?=
 =?us-ascii?Q?fkFcRilwu0qRzP0Cx/PByoXNgMwLU0+n5j/GBnfvKvFdmJtclGWdrCb61ZQc?=
 =?us-ascii?Q?36Vpkaarg9lik4VgeLje5gGlleea?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O1ijwQ3iSnxMYdPJqZkaH3YmZFrJ48jSg/muF/jR0vLFLgm9E5t5kwMRJst2?=
 =?us-ascii?Q?hTHaYKXgSmRchhydvPoU0jt1qPnu+kmdw9Ni0Lz4rNMLeXZhBt5TKdF5qwMY?=
 =?us-ascii?Q?ua0N23o5HN+Arq6o3o96QhCzxj1PVQBDHCiHQBdSEdoRF7V9/X/p+JZPpFm/?=
 =?us-ascii?Q?wxS2GIfsKoyqkuOfCnYcmMThtpCjhAnAQt5V2B8boAGoTS3GzS6bf30t05WB?=
 =?us-ascii?Q?YXWu9JpJLBleFQSilXi3I1CziE9z6GRKVTcodmF+Y24D94ZKjtjYYh1JOpmV?=
 =?us-ascii?Q?pnyp1nbDDU+yS3pAoNz0bmqfsU4xYn8gZ7phZrfV5+KyQi59oLGziVKT5M/V?=
 =?us-ascii?Q?xIXuI5VKSnyVm+9C9qHgFmLj6z/u2ZeGR6x8HGW7ONrkM4DBs6bI2O49tXzy?=
 =?us-ascii?Q?1naoiwVJR+rWcU+df6CzM4cyr/EEm6eS3JxFuIBT+y/66b3r9gDByP7qFrz5?=
 =?us-ascii?Q?0PeeZkGOf/FVSN9fm4TGwlrI3Hds3uTV9fI09w0vx+QdYOfMyZrZxOMKDiW7?=
 =?us-ascii?Q?NyQterBHUJ8/Y3ldyWb7m//DFPLX70h2d4ZBZLTTCecmFt/DKfPaQr+aPv4l?=
 =?us-ascii?Q?QfWURgjz008xFLNzbmxTvsWmhx6eZfjHDSCljQHHsjCBPzCY14WCmRJPdw4f?=
 =?us-ascii?Q?02HujHWcwU2ZkTGaqKAVOOgEJ2d+1leG2Jl85KqhkfU7ylhxv2uXL9qOkJGd?=
 =?us-ascii?Q?bB+KANs0CKXLqboiFxJllk53V1NUTkvG0CYYwCpQ1UoBPOPMb8OZjT0Q0bhL?=
 =?us-ascii?Q?Uu+bQMNlfbsjQ6qlSQI0YW7GZrC5jt9PwhP/+n+UNOnjq0YEVJyLb2nO5G5X?=
 =?us-ascii?Q?BXVOZBlhfuGwv0YXQX5xRRktIz88T59ggCsajDBXBQZf0STf4sPfJle5OFAn?=
 =?us-ascii?Q?Lj+VaGNTo6ST6NI78uYFRml+i8xmTBtxgnpJbJPWZ6zQc0iesXHuBz866FxT?=
 =?us-ascii?Q?UR3X9JjBZH2NknY29kjUBDmjYsx2aR8Y6oFAEFE08B5hOyiex7hJr4qVEcsK?=
 =?us-ascii?Q?AdVQVruunZh/vAhBX/3FAOznUl23Qm0eNChZbC325HXziXW0bOrrRTkViiGb?=
 =?us-ascii?Q?GP+WFv9zURkZKQJbjTtSkuFi4nXIlu/dPfrYJ1M+2pg0x4D5mvt1+E14dIGy?=
 =?us-ascii?Q?Z9Q86TJkYNGE9kFxGgbW+YDZUUFhEtiT7UNumHPHgdORDV7uuT4AiFnpuuO2?=
 =?us-ascii?Q?v08s6s40aVfH0QaTXTGetLCDIxOQqH8n3qZJ16lmUT1PJgMafeYV2eGeXhY+?=
 =?us-ascii?Q?UMvLGHgZTVl69iYXtanWrdtBiLHqLniuz4BNfE+nFoal4lK91fYt/loUGf/u?=
 =?us-ascii?Q?lvULRwkW/zWmDFzwgPuBd77JdxRehRqb5k+Rb/cNjFsGt6UqtsRy17aK0n6C?=
 =?us-ascii?Q?BmXu8Tw9wletc6BVj3q9+qUUWqYgLeBHmbrIKeNE85YBHHriEIBiGtpXJiwy?=
 =?us-ascii?Q?V7gwGnKZ3tKNYg2A7wC4JF8JisHN4lqD/ePf+NDjlXoQaw7awtWoRCjHE0LN?=
 =?us-ascii?Q?4EmVZAT9lLSr1e+f+TAsTH4dplxwCYSVM34IsEAqmXM8pHMFrjo0xKr/7KCx?=
 =?us-ascii?Q?uoJGA0wVX618IgnI8Exba4U1qUGpL5Cv9z53HYH/HK1EHuzzdqGuqMy8/rvn?=
 =?us-ascii?Q?QA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dTNzobc6iueaihU8xNM2pARJvwy85TCTZMROreLioGZeRuTrDgJAT5bxmofHWo0U8e7wYpCLGswPNzIdrNSvZGT6BBC3P9+V60IIIqjiOKW1nmdStAYsp2AeVuJ2bo/EAw6rUTbTPUxECeipl3nKaQyZPG26BFdP9FmJL6g1qDsQZeYA48H6avN7ThQeMV0WpBa4BimmolqofBBdwd5RovQNRuB8DM0gZ0x/MmBriTkKwqV1REJOLJd/vW/MgLbe+ctuVPAmK5yns10mz4F/wUCGpS4RD2nD4GAd4T7I+REw9HPe7YwYRC6ZSqh3IrgJe+NRmifj+BcJ6j20kXDoc8WPOAEI0xBbj0ilD4d6pVK+PyE91ux20S39f+i8m+JEULgLnFYG5GjXdS+cMNM8npNxycMizeRm/lck2IYT+yAnOqOiT/qM6h+1LnjFT0yiFPfJymw21BR4FrL94JrTuirkqBQDaQnPjeLb9iAlHSJVGLrSBW37yjpZikEyexfrEDBCaLOglnFCax0BfJt+5twCCYAwNf2igrsUSFlCG1ZF93ImRkkVWBsH+vxWcc/mchvg7mgvR1f8497Zw4roC/pM8cmpg5Xn91iJbglgtL4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f63655-93d9-425c-0461-08dd706634e3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 15:10:43.4822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vc7j08RM/EzJs8oo++pru/2g08VNmLv6ekg90p1gl+fvFaGx82FkRGkfSw+vQ9sHagvYYO9CbxTcR/IU75qk6s0vyQU5PJ3VD9dZi4IDePQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7846
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_06,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503310108
X-Proofpoint-GUID: KwT4pWCKo-lc87rVHUkwjM4_EJqn1R5a
X-Proofpoint-ORIG-GUID: KwT4pWCKo-lc87rVHUkwjM4_EJqn1R5a

I know that none of us love this, but seemed to be consensus that this was
a viable, if semi-vom-inducing solution - can we go ahead with this?

Would appreciate ack's (even if queasy) if so, so this doesn't get
stalled. We can always revisit this (in fact, it's on my list...).

On Fri, Mar 21, 2025 at 10:09:37AM +0000, Lorenzo Stoakes wrote:
> Currently, if a VMA merge fails due to an OOM condition arising on commit
> merge or a failure to duplicate anon_vma's, we report this so the caller
> can handle it.
>
> However there are cases where the caller is only ostensibly trying a
> merge, and doesn't mind if it fails due to this condition.
>
> Since we do not want to introduce an implicit assumption that we only
> actually modify VMAs after OOM conditions might arise, add a 'give up on
> oom' option and make an explicit contract that, should this flag be set, we
> absolutely will not modify any VMAs should OOM arise and just bail out.
>
> Since it'd be very unusual for a user to try to vma_modify() with this flag
> set but be specifying a range within a VMA which ends up being split (which
> can fail due to rlimit issues, not only OOM), we add a debug warning for
> this condition.
>
> The motivating reason for this is uffd release - syzkaller (and Pedro
> Falcato's VERY astute analysis) found a way in which an injected fault on
> allocation, triggering an OOM condition on commit merge, would result in
> uffd code becoming confused and treating an error value as if it were a VMA
> pointer.
>
> To avoid this, we make use of this new VMG flag to ensure that this never
> occurs, utilising the fact that, should we be clearing entire VMAs, we do
> not wish an OOM event to be reported to us.
>
> Many thanks to Pedro Falcato for his excellent analysis and Jann Horn for
> his insightful and intelligent analysis of the situation, both of whom were
> instrumental in this fix.
>
> Reported-by: syzbot+20ed41006cf9d842c2b5@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/67dc67f0.050a0220.25ae54.001e.GAE@google.com/
> Fixes: 47b16d0462a4 ("mm: abort vma_modify() on merge out of memory failure")
> Suggested-by: Pedro Falcato <pfalcato@suse.de>
> Suggested-by: Jann Horn <jannh@google.com>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  mm/userfaultfd.c | 13 ++++++++++--
>  mm/vma.c         | 51 ++++++++++++++++++++++++++++++++++++++++++++----
>  mm/vma.h         |  9 ++++++++-
>  3 files changed, 66 insertions(+), 7 deletions(-)
>
> diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> index fbf2cf62ab9f..7d5d709cc838 100644
> --- a/mm/userfaultfd.c
> +++ b/mm/userfaultfd.c
> @@ -1902,6 +1902,14 @@ struct vm_area_struct *userfaultfd_clear_vma(struct vma_iterator *vmi,
>  					     unsigned long end)
>  {
>  	struct vm_area_struct *ret;
> +	bool give_up_on_oom = false;
> +
> +	/*
> +	 * If we are modifying only and not splitting, just give up on the merge
> +	 * if OOM prevents us from merging successfully.
> +	 */
> +	if (start == vma->vm_start && end == vma->vm_end)
> +		give_up_on_oom = true;
>
>  	/* Reset ptes for the whole vma range if wr-protected */
>  	if (userfaultfd_wp(vma))
> @@ -1909,7 +1917,7 @@ struct vm_area_struct *userfaultfd_clear_vma(struct vma_iterator *vmi,
>
>  	ret = vma_modify_flags_uffd(vmi, prev, vma, start, end,
>  				    vma->vm_flags & ~__VM_UFFD_FLAGS,
> -				    NULL_VM_UFFD_CTX);
> +				    NULL_VM_UFFD_CTX, give_up_on_oom);
>
>  	/*
>  	 * In the vma_merge() successful mprotect-like case 8:
> @@ -1960,7 +1968,8 @@ int userfaultfd_register_range(struct userfaultfd_ctx *ctx,
>  		new_flags = (vma->vm_flags & ~__VM_UFFD_FLAGS) | vm_flags;
>  		vma = vma_modify_flags_uffd(&vmi, prev, vma, start, vma_end,
>  					    new_flags,
> -					    (struct vm_userfaultfd_ctx){ctx});
> +					    (struct vm_userfaultfd_ctx){ctx},
> +					    /* give_up_on_oom = */false);
>  		if (IS_ERR(vma))
>  			return PTR_ERR(vma);
>
> diff --git a/mm/vma.c b/mm/vma.c
> index 5cdc5612bfc1..839d12f02c88 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -666,6 +666,9 @@ static void vmg_adjust_set_range(struct vma_merge_struct *vmg)
>  /*
>   * Actually perform the VMA merge operation.
>   *
> + * IMPORTANT: We guarantee that, should vmg->give_up_on_oom is set, to not
> + * modify any VMAs or cause inconsistent state should an OOM condition arise.
> + *
>   * Returns 0 on success, or an error value on failure.
>   */
>  static int commit_merge(struct vma_merge_struct *vmg)
> @@ -685,6 +688,12 @@ static int commit_merge(struct vma_merge_struct *vmg)
>
>  	init_multi_vma_prep(&vp, vma, vmg);
>
> +	/*
> +	 * If vmg->give_up_on_oom is set, we're safe, because we don't actually
> +	 * manipulate any VMAs until we succeed at preallocation.
> +	 *
> +	 * Past this point, we will not return an error.
> +	 */
>  	if (vma_iter_prealloc(vmg->vmi, vma))
>  		return -ENOMEM;
>
> @@ -915,7 +924,13 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
>  		if (anon_dup)
>  			unlink_anon_vmas(anon_dup);
>
> -		vmg->state = VMA_MERGE_ERROR_NOMEM;
> +		/*
> +		 * We've cleaned up any cloned anon_vma's, no VMAs have been
> +		 * modified, no harm no foul if the user requests that we not
> +		 * report this and just give up, leaving the VMAs unmerged.
> +		 */
> +		if (!vmg->give_up_on_oom)
> +			vmg->state = VMA_MERGE_ERROR_NOMEM;
>  		return NULL;
>  	}
>
> @@ -926,7 +941,15 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
>  abort:
>  	vma_iter_set(vmg->vmi, start);
>  	vma_iter_load(vmg->vmi);
> -	vmg->state = VMA_MERGE_ERROR_NOMEM;
> +
> +	/*
> +	 * This means we have failed to clone anon_vma's correctly, but no
> +	 * actual changes to VMAs have occurred, so no harm no foul - if the
> +	 * user doesn't want this reported and instead just wants to give up on
> +	 * the merge, allow it.
> +	 */
> +	if (!vmg->give_up_on_oom)
> +		vmg->state = VMA_MERGE_ERROR_NOMEM;
>  	return NULL;
>  }
>
> @@ -1068,6 +1091,10 @@ int vma_expand(struct vma_merge_struct *vmg)
>  		/* This should already have been checked by this point. */
>  		VM_WARN_ON_VMG(!can_merge_remove_vma(next), vmg);
>  		vma_start_write(next);
> +		/*
> +		 * In this case we don't report OOM, so vmg->give_up_on_mm is
> +		 * safe.
> +		 */
>  		ret = dup_anon_vma(middle, next, &anon_dup);
>  		if (ret)
>  			return ret;
> @@ -1090,9 +1117,15 @@ int vma_expand(struct vma_merge_struct *vmg)
>  	return 0;
>
>  nomem:
> -	vmg->state = VMA_MERGE_ERROR_NOMEM;
>  	if (anon_dup)
>  		unlink_anon_vmas(anon_dup);
> +	/*
> +	 * If the user requests that we just give upon OOM, we are safe to do so
> +	 * here, as commit merge provides this contract to us. Nothing has been
> +	 * changed - no harm no foul, just don't report it.
> +	 */
> +	if (!vmg->give_up_on_oom)
> +		vmg->state = VMA_MERGE_ERROR_NOMEM;
>  	return -ENOMEM;
>  }
>
> @@ -1534,6 +1567,13 @@ static struct vm_area_struct *vma_modify(struct vma_merge_struct *vmg)
>  	if (vmg_nomem(vmg))
>  		return ERR_PTR(-ENOMEM);
>
> +	/*
> +	 * Split can fail for reasons other than OOM, so if the user requests
> +	 * this it's probably a mistake.
> +	 */
> +	VM_WARN_ON(vmg->give_up_on_oom &&
> +		   (vma->vm_start != start || vma->vm_end != end));
> +
>  	/* Split any preceding portion of the VMA. */
>  	if (vma->vm_start < start) {
>  		int err = split_vma(vmg->vmi, vma, start, 1);
> @@ -1602,12 +1642,15 @@ struct vm_area_struct
>  		       struct vm_area_struct *vma,
>  		       unsigned long start, unsigned long end,
>  		       unsigned long new_flags,
> -		       struct vm_userfaultfd_ctx new_ctx)
> +		       struct vm_userfaultfd_ctx new_ctx,
> +		       bool give_up_on_oom)
>  {
>  	VMG_VMA_STATE(vmg, vmi, prev, vma, start, end);
>
>  	vmg.flags = new_flags;
>  	vmg.uffd_ctx = new_ctx;
> +	if (give_up_on_oom)
> +		vmg.give_up_on_oom = true;
>
>  	return vma_modify(&vmg);
>  }
> diff --git a/mm/vma.h b/mm/vma.h
> index 7356ca5a22d3..149926e8a6d1 100644
> --- a/mm/vma.h
> +++ b/mm/vma.h
> @@ -114,6 +114,12 @@ struct vma_merge_struct {
>  	 */
>  	bool just_expand :1;
>
> +	/*
> +	 * If a merge is possible, but an OOM error occurs, give up and don't
> +	 * execute the merge, returning NULL.
> +	 */
> +	bool give_up_on_oom :1;
> +
>  	/* Internal flags set during merge process: */
>
>  	/*
> @@ -255,7 +261,8 @@ __must_check struct vm_area_struct
>  		       struct vm_area_struct *vma,
>  		       unsigned long start, unsigned long end,
>  		       unsigned long new_flags,
> -		       struct vm_userfaultfd_ctx new_ctx);
> +		       struct vm_userfaultfd_ctx new_ctx,
> +		       bool give_up_on_oom);
>
>  __must_check struct vm_area_struct
>  *vma_merge_new_range(struct vma_merge_struct *vmg);
> --
> 2.48.1
