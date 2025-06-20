Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BA22980A7
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750433657; cv=fail; b=MyEPneZYLXjUTjHgqhepC901Z6wd+Ap7eLMIBHrZ3h0RoZikNctm/7GFeokxkofP1FXTbqo9Zfhph/LO9c7B+sGoiCkH+R2xncqk2S2btQtCB+30fKVu2J4fNrC4pV4b6VA7NJeh+DE53Dqwe+Cev6eCR2Q6VgJxifgpm8wl69o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750433657; c=relaxed/simple;
	bh=oRzl28FbVPkBPb9ccBBSEtTZqKDWXSU8la3OpchJ/I4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NkCa0BtxSv2x5J1RRaHZeQ5+03Ko1m5Stoy0fjqHqBW2sJkIXQpSgV65l/Nb8KZdZFZHUAp91B26DoLbKIRYemmhGnaNUvPeKp9Jh0MKXMJJXFTq7yC+B1cjiVCnqx3A+TgN9pQetOmmT88Jgcio4xXOuFmdfkR5n+FefyIh4Tc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BOFEKHlx; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nhGACB/5; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BOFEKHlx";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nhGACB/5"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KEBlLW023317;
	Fri, 20 Jun 2025 15:33:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=K+aX+Eb3nmRI4ka7SsyaogwNVOPsV+C2P4l6858MmEg=; b=
	BOFEKHlxqpLKEzjNmHz3F8VoCNqdQjckovGO9NnaDcHv6+RFRvPIghWZe7ObBPqF
	f2JJm4hiSI3NRc2CCKkA5gMjB/hZSojNCwqCEpI7/11PKEtaoEoxxchrFo0q7bd+
	KW0HYNgbfS1OQwU1uxIxaGcl1zTg/1cbEGZ3VFvqr4uvxVyMmDEOocYowa/ErvEV
	CuHuWXxmYED+vd8YgISHU7gTNA1QAwAvSdwc1ZYe5vnRdEd/Rm9T+7h+Z8AodAeR
	3ZyCn43OCFSudA7ResbJ9pH980PNkxM915x4ojqrBX99ipeLUDrICVfws01Q54uK
	O44nIxYjZ4C4157A8mtxWQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47900f3xs2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 15:33:20 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55KEUPx3038193;
	Fri, 20 Jun 2025 15:33:19 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhd22y0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 15:33:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DGTpRLOLq068ffQzffOizXnAczcpnjRHLi//zS918khO3ADbLhW0J8hAsrcGWZiz8oiNCv2VnsfgfyoDHAdm42crHA72+qnnoO8k23D1sFpH1iEnjIEmavMMEoEu9GzeG7bhGnWE1NWFWlSGwOXdLWFGNjaBMKmnObw4bRnksOIm2T/2OGdRcup5CUz++Zd1Zg5cFX7nzQRgxiCAXzjsNOr8DlBmUTz64wQvM336K5zYTOhRgREVEnqiFki/iQxJsdzQvJHNdBt+ZWdl1CIp5RlzZJ1YHHJxHj2DBwWUmsgYotUF/MWKgMX2DgeXIXd7+EAodWY/JBmqn0D7zgbT+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+aX+Eb3nmRI4ka7SsyaogwNVOPsV+C2P4l6858MmEg=;
 b=fQScJkiDlFDOMt8nCJbhHZjtvWWz4gHH9gsO2NV6iqCUeg/QLHJgWJdhbE4xnnx6lhzZAOwclmu4vq6uvYfbouW78XkqG2fQbMNg2Bok1+3ZwePbNtRoupIhz258uWv45Nw6EdeVGZzuOeLB3IcdxaxYZUcMl28/W3Pc4VzlsfUdebni0c/do2qyea+UMd61t18XlGEqhnrSbt0gsWKM7Ml7nZ77WlhpXGzwOfw7Y9zKVaQp9M9y7EcD/Ye6qB4A6Pyq3gp1dn+1dviFw7vkcHWuUWUT3BiCy36JfCSeiAXbKnmCFh1WVXassBCnihECgw5dnEBWp3cZQHGTYMoWQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+aX+Eb3nmRI4ka7SsyaogwNVOPsV+C2P4l6858MmEg=;
 b=nhGACB/5oFWTbEbdVKLXTGv1bmBb8XhlXuq5c/Cn7paDAgrALnZGbfu/wEoGUAd+n15DjW80wrm7m9LL643+aFuylriak6Bq60WaTh2on98uWSwaysjxyEdLjAtVcoKMuHvyBlIs1dIvUPOc4ClYOIJlIDmwPe5Hhi6pUGg+0Po=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SN4PR10MB5591.namprd10.prod.outlook.com (2603:10b6:806:206::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Fri, 20 Jun
 2025 15:33:15 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 15:33:15 +0000
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
Subject: [PATCH v2 3/5] mm/madvise: thread VMA range state through madvise_behavior
Date: Fri, 20 Jun 2025 16:33:03 +0100
Message-ID: <518480ceb48553d3c280bc2b0b5e77bbad840147.1750433500.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750433500.git.lorenzo.stoakes@oracle.com>
References: <cover.1750433500.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0130.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SN4PR10MB5591:EE_
X-MS-Office365-Filtering-Correlation-Id: e9677312-b303-46c0-8704-08ddb00fc67a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qWyPF5bsjL3d3GRH8Oryjf4u1g9ztSfbJmF18twnEJlnzNI+oOa00NHY4PT+?=
 =?us-ascii?Q?xOysOnwe27l4xjUmtUwCwUmJf8vlo63jeVa1Axm6q9VVHl4ui/Qb430PHxo9?=
 =?us-ascii?Q?mXpnVFviOxDfX1LB9LORCxHatsgqicnUJmUReDdqqHdOM9BGFoZgWkMdtCh0?=
 =?us-ascii?Q?qy598wSQ8s2ua4QeBZkV6wiZJyH4jh9n47650D9vHmFPLFbCmHqnOXD8wBPR?=
 =?us-ascii?Q?8YzzGWwJAbKlez3SIyzhnrcvXaRfb9ZItk+zH9yIjxy9ilCZ/I0XZZDbFmxX?=
 =?us-ascii?Q?a2Im5cT5wEW8cmXO1ClG4Cpw2aDcLqr6fB+6LoiHZzGd2J/ZDvEqEXx8Kz9F?=
 =?us-ascii?Q?16gk31vLKxsJq3JbiaEb6dhDXsGZfX88urRQwLdcs9OZMcZGfPQ99b80DJf/?=
 =?us-ascii?Q?k3/PRKOx39w7GlBkXM+5WIEWpo7fN3GdGFf3gMLUL7f94A+4HUOiMS1Vapn/?=
 =?us-ascii?Q?/kSy1j1PYYPhN3YhIpE6Ehj10qiLal4wJwPs1/j3KeSpJQXNDByVsYqgmMlf?=
 =?us-ascii?Q?q/+uJWCoa6IpFiIhh3B231xk9/7Pf3jb6RbmB4DfPSRWKAZ86R8nbPI++j81?=
 =?us-ascii?Q?/wnJqL2ucx+dg4NPcqrovZUZ00++dLT4dNagQGyhmrhz5D7XKMea3/qZ/x/4?=
 =?us-ascii?Q?MT7MbWRbHfHRKiH9U+Xjm4LoTt60iuALV4oLgPiPHNyJzGURE4jFgx3oElmh?=
 =?us-ascii?Q?phtb/WyEYgeFQVhzmjvSNxyUf6B2HIQh1yJR4IkzMCLPtEkvxg/xDAGV8Ugt?=
 =?us-ascii?Q?IBLXpKNJdAPzaCyrh42E4F5g3kybWd6XkC7Fs6KKid1/zYcxTysxwDnty7i9?=
 =?us-ascii?Q?H8TzOxUor4uysIhFYwhabIJjCJGboKOa1rpiPds/Lj0YDcaiwWVJIAq5HXAg?=
 =?us-ascii?Q?YiAlXpPe5NYpxVHAg2mhreUWe6yitiCPLqObkPcysyTrg8ZpjjJU67ppBjN2?=
 =?us-ascii?Q?goUQ9xLM19VfusdN7sLyLuTQ23az9mvvqMA/+kBKxYc+TMk0kjB273qCHXRi?=
 =?us-ascii?Q?sQMffOWcWuOBO3GBYPrm5uUMBExzYDqC2jzzDKV/XuanM5/H08Us4EteCK7i?=
 =?us-ascii?Q?RU5ZNxd4fAPbNk68IFMkhXmB1QNv9zfSxpRZmLoNfH0OCrgbQiWK1SWhScXW?=
 =?us-ascii?Q?1M7NYH8Whw0oj1TigfcZKwa83mKL3q3e74rjWDrBSKSAEfCBDYizlvhvuUVv?=
 =?us-ascii?Q?h3em+ayxmY5XrDQNu/CX8Ari5WW8HCnhrLR8hZw663aG/fHzqzA3Q+skJ+P7?=
 =?us-ascii?Q?TJ0S4t94S7Gy5CVkoQZXP5bNUqcWLHoxaoNEQFsVFEhHMKyw48ngzUj4W1PX?=
 =?us-ascii?Q?HHqPCe/NYmpOfy1tXxgmELY2wbVTl4bx1Ed8e8aplwIT+ENrbjoKcYYS7gys?=
 =?us-ascii?Q?Ky/hKNWM+rGCJ30vRN92mF/dT9dTcYfHeGmVGRXcb5EGLyQFDgrCvrGm1q3M?=
 =?us-ascii?Q?Mc9p2ZhK0T4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IIh8Okq12/dXJBf1upaa4G3bImzMDchctdL7r48WvaaAHT21rLn8Xr1OiWqm?=
 =?us-ascii?Q?EYwH47OBALCrteReJsIaqEAHnxMJhbl97aMZ/rk10UNGB8loZKNHn/5CTaFR?=
 =?us-ascii?Q?17EOs0Db2gi8owEwLpMuQxTsL4XcHCROGwAIGF6kmvnhcEt7QfKyP3lj6n35?=
 =?us-ascii?Q?y0yEMH2tzlhqp7YW6P7SlFyMXHaCGLkXDF5LZ87e0S+i5SmqjF1+bl9pxz9g?=
 =?us-ascii?Q?xjsJ/YTp43GYBas1ZcvY95h7cmdrgcFwe71BmhJeZbyHHwODaFNqzQPcQcrL?=
 =?us-ascii?Q?gAF4X7hYqahpYV623ZaawVzOHqygP4ceg8v7+W1WG0tigitO5mOvcs7VIfOx?=
 =?us-ascii?Q?Co0WjAjnqnskvZDckIZK2Yl+85YkPy9gJW0AQdrNb/w870YigGjLLr+s9uRR?=
 =?us-ascii?Q?QGRkKtVFxUh35lyN5Xa3KZJOHFFw4Xrd3Bfkrd6sEpur+muPc1VJ9xp6fQ+Z?=
 =?us-ascii?Q?DnNClPzzzpNsn8hYUID2czl1vxnPAp6jBWN8vgGfXAmeCdm5JW3FDpSgZkV7?=
 =?us-ascii?Q?7+w5+Ru/gAXv+LmjQXxdVQGSgt+2hQku4CCHTXZJ/x5CQFyVzEtRs4CwkIX6?=
 =?us-ascii?Q?g23ZQ3M5/kXixFjYuo309y0jgX2OdbfBeYuL3uaXbWCYKzbJam7E9zZAvNGt?=
 =?us-ascii?Q?GgrHzWjxtODtE8P4dCBCAPVjykTGp9FLd3u43KIR0yvede50kcojeSW+mZot?=
 =?us-ascii?Q?ZGo51DzBYWJZvze9ffDXCWK9zkbP+vYo4pWMFWWY+mdEsnyKuiZX4FsuciD3?=
 =?us-ascii?Q?G+1eLGWodhajlffKfbnT6kIp7Ll/nUW6IDNqKaJYNN746wXE2driqCVvu4R5?=
 =?us-ascii?Q?RQypfzPdCSyQ0f9LjUXENplNYG8MKxuMZaKsvHT6Ex5htDInrtbwDgTA1BdV?=
 =?us-ascii?Q?9ikxXS/t02i1pGvHz+6ggQpzdCgxcnM1pS3sRpu9TtZvdfCH/9c6IKRKEIcW?=
 =?us-ascii?Q?SzMw1NFEnoT3u5e7bryWQ1QLcsVunxZSIUw5HBJzDwna3BHM3i+HtWpv9VDa?=
 =?us-ascii?Q?xAjodthNXWLZJ734Ng+nU8agnEOFvFa5kDXYui5I0EOf/BHVUrytu+BxofXo?=
 =?us-ascii?Q?GOTwsZdDRF35lnUI+/UFq3/TU+6McUs/OU5O5nQ1WNeuaPmhFSCITzVe5F2f?=
 =?us-ascii?Q?DLgjxjWg8NlU/pSPw3vsVol6AVX+e4oMDJE71w9y14RfaVguUn7VyjX/3nz/?=
 =?us-ascii?Q?4pblpNz6OgXNJEHSISC+Y6qzNv041fJh4AITms50wkEH7iTTLXtwc5dfpwv9?=
 =?us-ascii?Q?oUV4VKAZuq9XuVubi3Uo0FXeEhYN7/Z6hUEp5XyZlnFIry9r/GkgcGAHjt0i?=
 =?us-ascii?Q?IF+sJN9var+lNAjOsz7eoBgc0RiLc4c1gmktNcMyKP1/8VH5wiFD8wthXgSW?=
 =?us-ascii?Q?qTe/5gOKIBMysH7WcI+glhFSsZr2nGCPquQ7/sWhnX8qzYveBBG/KpRaCUZq?=
 =?us-ascii?Q?EV1BFxXfPcOiJWTipL4BWGuNtzMtwuiUC5xvTKB7zwY3jWrhxuBT3Br7mhKb?=
 =?us-ascii?Q?TsT25CRab2nf9VhvBg0sVtkfCGNMgxBZca6lBN0WcGnD70k6+ayjllRHu7Jx?=
 =?us-ascii?Q?DLI6Viw9nBCsI6ZZlMGtVnbIUWzGtoGEwEGpwArjhwZ4QyptuQ2grGAECryp?=
 =?us-ascii?Q?pA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GnkXeY3CGe03YxF7aWacU3iZDfKH3Gei+elBvgfyJar4lU3tjRPdUQumsuPbyINUX+0/Ol6WGK/drGmWx7bvLjg+eD4UjClMrv/piuZaqZWm6A2xxDBMeZePqZsGiju07Aj2ah5OfD44phm5YkwYxOCp5tUAqyaLD/ZGPLMNdc0W15Ga5WK9q7W7a2AjmY8MDXXvVqr1L8zz1rk19e60STwhCzhiYb6hT6ullIXsUo6CGoMsAry5EAsu0drJNp7md2oYJz5H7b3xdrzbL9PeQXBSYSmW4xkxWGfdVOPHX24R8QZojlxB7ar17l4FA6RmeALX5+GBSH4SO1rznCqc2QCRSS562IyILj9k/h8yqZ4YrgYW6YpxhCsaFkZF2BJzPI6fMKEntHcLsW4GjvQwV/yrkenVYqWjP6/sK/l1X3qlCgAxT/fp+GTsSfJArFES+dMYHn6u6rMAEr9sblGqTxudF/aN8mwfQfo1vOg/Z8zJ8BLZZPQgQFnmMW/nTkq+CQggXgvW3q0FSbM2QgiHcwcf7rglBK6p3loYLL1lh25y/ys7/lYS+wlcL3L0mYj6PGBlKp9sGEJsteiLpS7xtxg9i564SUzkOso7JOr/Pz8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9677312-b303-46c0-8704-08ddb00fc67a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 15:33:15.9260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pIxdNsUkfWIwyqrNM54TsaLrVUXXDtWGwMvb1RDrqICb+h8UQb+JLz95NA43tuerNhqGi6NfgA71oCslLtJxyq1nbXajY2hVA5R6CjXh3fc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5591
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506200110
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDExMSBTYWx0ZWRfX6XowdeQgfQb1 30qPl++k0idpPfyg8uL60nV128+v7NBsTnzocz0WeO7mFu+AnhznF+E8FAyJlZUdjWgjE/5EyI2 NvOHIRhiDBCYc3J1goXq5jdsHl1Y/KtuM0/kP5RLVdw+vyeep7Y8hjN8KOdapb9aRGzPlrqUivS
 aQ97ocTgSuulxcEhVqwDgMZBSSX/NCFuWeIvnTj2OezRUf+F3mj4jsph35BZ1NFMlS5iiuNDnHr Vfc0VVVPRXRk+OPNUZXWY4YgYGc87jJx3rFhn5enSwGfsvGTbvq/qTOoaMEqwrBQRs+Oir/x89v J8uXTI4J7gG1QBxh+69vo9/9nb85WebOt673L6viJd9OqfRVyouNgRSzk5HJqSRrFvNeAbU1Gae
 IhBNBm8M7PZfUI6gLDecd4+HFpZqO3DBM6IKxcnFZ4Pbfp9/5fYU2gabVvL8rDitfihKpwyJ
X-Proofpoint-ORIG-GUID: D-XWZ8_ivnWDk0c3PhbkuoTKS5ttwGZE
X-Authority-Analysis: v=2.4 cv=X/5SKHTe c=1 sm=1 tr=0 ts=68557f40 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=vYuUfPEG4t8TmVnAmMUA:9 cc=ntf awl=host:13206
X-Proofpoint-GUID: D-XWZ8_ivnWDk0c3PhbkuoTKS5ttwGZE

Rather than updating start and a confusing local parameter 'tmp' in
madvise_walk_vmas(), instead store the current range being operated upon in
the struct madvise_behavior helper object in a range pair and use this
consistently in all operations.

This makes it clearer what is going on and opens the door to further
cleanup now we store state regarding what is currently being operated upon
here.

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 mm/madvise.c | 103 ++++++++++++++++++++++++++++-----------------------
 1 file changed, 57 insertions(+), 46 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index f1109c2c63a4..764a532ff62a 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -57,17 +57,27 @@ enum madvise_lock_mode {
 	MADVISE_VMA_READ_LOCK,
 };
 
+struct madvise_behavior_range {
+	unsigned long start;
+	unsigned long end;
+};
+
 struct madvise_behavior {
 	struct mm_struct *mm;
 	int behavior;
 	struct mmu_gather *tlb;
 	enum madvise_lock_mode lock_mode;
 	struct anon_vma_name *anon_name;
+
+	/*
+	 * The range over which the behaviour is currently being applied. If
+	 * traversing multiple VMAs, this is updated for each.
+	 */
+	struct madvise_behavior_range range;
 };
 
 #ifdef CONFIG_ANON_VMA_NAME
-static int madvise_walk_vmas(unsigned long start, unsigned long end,
-		struct madvise_behavior *madv_behavior);
+static int madvise_walk_vmas(struct madvise_behavior *madv_behavior);
 
 struct anon_vma_name *anon_vma_name_alloc(const char *name)
 {
@@ -147,7 +157,9 @@ int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
 	if (end == start)
 		return 0;
 
-	return madvise_walk_vmas(start, end, &madv_behavior);
+	madv_behavior.range.start = start;
+	madv_behavior.range.end = end;
+	return madvise_walk_vmas(&madv_behavior);
 }
 #else /* CONFIG_ANON_VMA_NAME */
 static int replace_anon_vma_name(struct vm_area_struct *vma,
@@ -993,12 +1005,13 @@ static long madvise_dontneed_free(struct vm_area_struct *vma,
 		return -EINVAL;
 }
 
-static long madvise_populate(unsigned long start, unsigned long end,
-		struct madvise_behavior *madv_behavior)
+static long madvise_populate(struct madvise_behavior *madv_behavior)
 {
 	struct mm_struct *mm = madv_behavior->mm;
 	const bool write = madv_behavior->behavior == MADV_POPULATE_WRITE;
 	int locked = 1;
+	unsigned long start = madv_behavior->range.start;
+	unsigned long end = madv_behavior->range.end;
 	long pages;
 
 	while (start < end) {
@@ -1289,12 +1302,13 @@ static long madvise_guard_remove(struct vm_area_struct *vma,
  */
 static int madvise_vma_behavior(struct vm_area_struct *vma,
 				struct vm_area_struct **prev,
-				unsigned long start, unsigned long end,
 				struct madvise_behavior *madv_behavior)
 {
 	int behavior = madv_behavior->behavior;
 	struct anon_vma_name *anon_name = madv_behavior->anon_name;
 	vm_flags_t new_flags = vma->vm_flags;
+	unsigned long start = madv_behavior->range.start;
+	unsigned long end = madv_behavior->range.end;
 	bool set_new_anon_name = behavior == __MADV_SET_ANON_VMA_NAME;
 	int error;
 
@@ -1411,10 +1425,11 @@ static int madvise_vma_behavior(struct vm_area_struct *vma,
 /*
  * Error injection support for memory error handling.
  */
-static int madvise_inject_error(unsigned long start, unsigned long end,
-		struct madvise_behavior *madv_behavior)
+static int madvise_inject_error(struct madvise_behavior *madv_behavior)
 {
 	unsigned long size;
+	unsigned long start = madv_behavior->range.start;
+	unsigned long end = madv_behavior->range.end;
 
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
@@ -1468,8 +1483,7 @@ static bool is_memory_failure(struct madvise_behavior *madv_behavior)
 
 #else
 
-static int madvise_inject_error(unsigned long start, unsigned long end,
-		struct madvise_behavior *madv_behavior)
+static int madvise_inject_error(struct madvise_behavior *madv_behavior)
 {
 	return 0;
 }
@@ -1551,21 +1565,20 @@ static bool process_madvise_remote_valid(int behavior)
  * If a VMA read lock could not be acquired, we return NULL and expect caller to
  * fallback to mmap lock behaviour.
  */
-static struct vm_area_struct *try_vma_read_lock(
-		struct madvise_behavior *madv_behavior,
-		unsigned long start, unsigned long end)
+static
+struct vm_area_struct *try_vma_read_lock(struct madvise_behavior *madv_behavior)
 {
 	struct mm_struct *mm = madv_behavior->mm;
 	struct vm_area_struct *vma;
 
-	vma = lock_vma_under_rcu(mm, start);
+	vma = lock_vma_under_rcu(mm, madv_behavior->range.start);
 	if (!vma)
 		goto take_mmap_read_lock;
 	/*
 	 * Must span only a single VMA; uffd and remote processes are
 	 * unsupported.
 	 */
-	if (end > vma->vm_end || current->mm != mm ||
+	if (madv_behavior->range.end > vma->vm_end || current->mm != mm ||
 	    userfaultfd_armed(vma)) {
 		vma_end_read(vma);
 		goto take_mmap_read_lock;
@@ -1588,13 +1601,14 @@ static struct vm_area_struct *try_vma_read_lock(
  * reading or writing.
  */
 static
-int madvise_walk_vmas(unsigned long start, unsigned long end,
-		      struct madvise_behavior *madv_behavior)
+int madvise_walk_vmas(struct madvise_behavior *madv_behavior)
 {
 	struct mm_struct *mm = madv_behavior->mm;
+	struct madvise_behavior_range *range = &madv_behavior->range;
+	/* range is updated to span each VMA, so store end of entire range. */
+	unsigned long last_end = range->end;
 	struct vm_area_struct *vma;
 	struct vm_area_struct *prev;
-	unsigned long tmp;
 	int unmapped_error = 0;
 	int error;
 
@@ -1603,11 +1617,10 @@ int madvise_walk_vmas(unsigned long start, unsigned long end,
 	 * tentatively, avoiding walking VMAs.
 	 */
 	if (madv_behavior->lock_mode == MADVISE_VMA_READ_LOCK) {
-		vma = try_vma_read_lock(madv_behavior, start, end);
+		vma = try_vma_read_lock(madv_behavior);
 		if (vma) {
 			prev = vma;
-			error = madvise_vma_behavior(vma, &prev, start, end,
-						     madv_behavior);
+			error = madvise_vma_behavior(vma, &prev, madv_behavior);
 			vma_end_read(vma);
 			return error;
 		}
@@ -1618,8 +1631,8 @@ int madvise_walk_vmas(unsigned long start, unsigned long end,
 	 * ranges, just ignore them, but return -ENOMEM at the end.
 	 * - different from the way of handling in mlock etc.
 	 */
-	vma = find_vma_prev(mm, start, &prev);
-	if (vma && start > vma->vm_start)
+	vma = find_vma_prev(mm, range->start, &prev);
+	if (vma && range->start > vma->vm_start)
 		prev = vma;
 
 	for (;;) {
@@ -1627,33 +1640,30 @@ int madvise_walk_vmas(unsigned long start, unsigned long end,
 		if (!vma)
 			return -ENOMEM;
 
-		/* Here start < (end|vma->vm_end). */
-		if (start < vma->vm_start) {
+		/* Here start < (last_end|vma->vm_end). */
+		if (range->start < vma->vm_start) {
 			unmapped_error = -ENOMEM;
-			start = vma->vm_start;
-			if (start >= end)
+			range->start = vma->vm_start;
+			if (range->start >= last_end)
 				break;
 		}
 
-		/* Here vma->vm_start <= start < (end|vma->vm_end) */
-		tmp = vma->vm_end;
-		if (end < tmp)
-			tmp = end;
+		/* Here vma->vm_start <= range->start < (last_end|vma->vm_end) */
+		range->end = min(vma->vm_end, last_end);
 
-		/* Here vma->vm_start <= start < tmp <= (end|vma->vm_end). */
-		error = madvise_vma_behavior(vma, &prev, start, tmp,
-					     madv_behavior);
+		/* Here vma->vm_start <= range->start < range->end <= (last_end|vma->vm_end). */
+		error = madvise_vma_behavior(vma, &prev, madv_behavior);
 		if (error)
 			return error;
-		start = tmp;
-		if (prev && start < prev->vm_end)
-			start = prev->vm_end;
-		if (start >= end)
+		range->start = range->end;
+		if (prev && range->start < prev->vm_end)
+			range->start = prev->vm_end;
+		if (range->start >= last_end)
 			break;
 		if (prev)
 			vma = find_vma(mm, prev->vm_end);
 		else	/* madvise_remove dropped mmap_lock */
-			vma = find_vma(mm, start);
+			vma = find_vma(mm, range->start);
 	}
 
 	return unmapped_error;
@@ -1834,22 +1844,23 @@ static int madvise_do_behavior(unsigned long start, size_t len_in,
 		struct madvise_behavior *madv_behavior)
 {
 	struct blk_plug plug;
-	unsigned long end;
 	int error;
+	struct madvise_behavior_range *range = &madv_behavior->range;
 
 	if (is_memory_failure(madv_behavior)) {
-		end = start + len_in;
-		return madvise_inject_error(start, end, madv_behavior);
+		range->start = start;
+		range->end = start + len_in;
+		return madvise_inject_error(madv_behavior);
 	}
 
-	start = get_untagged_addr(madv_behavior->mm, start);
-	end = start + PAGE_ALIGN(len_in);
+	range->start = get_untagged_addr(madv_behavior->mm, start);
+	range->end = range->start + PAGE_ALIGN(len_in);
 
 	blk_start_plug(&plug);
 	if (is_madvise_populate(madv_behavior))
-		error = madvise_populate(start, end, madv_behavior);
+		error = madvise_populate(madv_behavior);
 	else
-		error = madvise_walk_vmas(start, end, madv_behavior);
+		error = madvise_walk_vmas(madv_behavior);
 	blk_finish_plug(&plug);
 	return error;
 }
-- 
2.49.0

