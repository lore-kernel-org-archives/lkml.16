Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F1B204F78
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 09:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744969398; cv=fail; b=py+uokE6QkLMP8VUizf5hHShJcFAGFRGsPPcv7LjxGyc4mPK1JfPMGBdnQVdmKW2QdfsrFC+DriwIP+OnvD/l6LgfrtZ1gYQEA5B7wlwui70X1VuLbkzm4gSvOvInrT6tgasxXocSXNQvcl1TWysaTWpd5AvNVMBU2wN4ntOob4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744969398; c=relaxed/simple;
	bh=dQIBDfAMtzO2/tVRND7KPeJg3IyEC5WdbXdp8au+ctk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NIibSGiaK2RUTryLgmAr6UvJJBFDml0lfDb+ND0leCSwwyVidJj7dfEphIRLpxe+5g4FM+bj9ksJDxnxqHj4qPr6Di6Cza9NntWDVDdAjatAQ7SvgE9gzad1WcQ7oFgGb210bJBBLTUoMvEyGyx9LfnJj45XzNt036CouYdTN4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WDuETeUP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oMT3xz3q; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WDuETeUP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oMT3xz3q"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I7ubFE031811;
	Fri, 18 Apr 2025 09:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=/1MyR8jds9MoBCX/Fj
	HAFE7w7/dCSUHYE1mhV3/KLrU=; b=WDuETeUPFmm7s/4JbsjaFkj5p7RtJ8BCo9
	WaervZA3cGjaryVs3yhPa+WOgOddhfRSYoqrW0qYxgou19Ix/T5iEriF0UjqCya6
	IOZEvggGkQ2ae6Pg8Esabye8gs9k6J8QzsOizlLkkc4Nv9eg2IO/fUe3WxBjxAgL
	oykNqkPGssixymFLY9hDIR/8AOLM0VafNWsMhxiH+BJ2HWdrt9Jw2b2JzocqgB2N
	0Q0YpylZmk5BD8xjL2sMA1U2/AzYPPP3cJAyAZLfZDsjOpU+PM0mEoI0Cyv19lIM
	O7PM5Zo6VPo3B/aByuq6GOASoZleZ2wHplZYTp93QIpIN1pRVanw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4618rd7wvw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 09:42:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53I8hurJ008543;
	Fri, 18 Apr 2025 09:42:28 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460d2uf6bj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 09:42:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FSYGP/0Dnbdvid4rzNP9ImMrvfhkeuaPnvqGcfPhE8PTNcUuH2oh3eW63gxOQN+qMEe6pNYjL1js0aq+H4RmhsLVKrO20fZFwt3w0UP55WvvT0aNTFBgVd+memDGsa2W6W8xrcV9qblvPt+yNMWqncuYrYcmW6w75oDu0Jk/SnoqnIOQ5bnHW7OeKnvWCsYQOtyB9106Wdr6a3U3DhltZsIKzxp6a7EKBeWWSvHDEZC1qhLz59kIm/r0J1QSO4YGgFrcers9DLKnubAOE1/uUTwkP3WGO7wJbfmwtNc29IZ7Jo7WYZh94/y5Jkiw1qxHK4I/ylhXCo33thfZPhnxLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1MyR8jds9MoBCX/FjHAFE7w7/dCSUHYE1mhV3/KLrU=;
 b=AnAPLiuwNDOQZPX/KeoUQzsPaySFKizyHhmpI1UwaUM9yZT1ZoG9VM3EpVpN9WU+hy1MKg8qYtJKMKNs1iwU/2Qn+wnX41HPZ/Rsxb2Dw67Y1POs8q55GXM3rNwbps2oSF7wTsuJSM+uv4tsygEl+Q25OqW+lg+xgt8od7T+vCR89xxvfznPkjW9GQNf4M7KXf4Ofpkhg8vkULRtxiq1AgB3WWWAvzuIoJ90PRl9AgS27T2lO0hxkjC6W6lFE+rQcNcvJzXZaFp59lzuHLpeYQ3B5Ehx/JKc6CyokC7SSCnb0tCEF6bkWiu67/XLqtA14DW4VmZ+/uNSTBEXA1ShBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/1MyR8jds9MoBCX/FjHAFE7w7/dCSUHYE1mhV3/KLrU=;
 b=oMT3xz3qG8QynvDx7nJ3CRKXW2o8+SonOxdsUbZSzGwEU93ymdc0IN+xODZYCQ6V/70p78a+lw6pcYjjnwhoBoOVD7/C5lag1teoBhnuYOYBQN2wyXsgd8vVpY86GRF6jfmmj6YyBpC1cl/7ere+V3wHrttp/3yGVR7DMArD0us=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MN6PR10MB8094.namprd10.prod.outlook.com (2603:10b6:208:4ee::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Fri, 18 Apr
 2025 09:42:26 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8655.029; Fri, 18 Apr 2025
 09:42:25 +0000
Date: Fri, 18 Apr 2025 10:42:23 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Harry Yoo <harry.yoo@oracle.com>
Cc: Ye Liu <ye.liu@linux.dev>, akpm@linux-foundation.org, linmiaohe@huawei.com,
        nao.horiguchi@gmail.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Ye Liu <liuye@kylinos.cn>,
        David Hildenbrand <david@redhat.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Rik van Riel <riel@surriel.com>
Subject: Re: [PATCH 1/3] mm/rmap: rename page__anon_vma to page_anon_vma for
 consistency
Message-ID: <a8dce603-013d-48b2-9d17-08c698dbfbcb@lucifer.local>
References: <20250418075226.695014-1-ye.liu@linux.dev>
 <20250418075226.695014-2-ye.liu@linux.dev>
 <ffb0d633-84c4-4c02-a4b2-021ff8c9b6da@lucifer.local>
 <aAIddlu9x5RTZT8k@harry>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAIddlu9x5RTZT8k@harry>
X-ClientProxiedBy: LO2P265CA0224.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::20) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MN6PR10MB8094:EE_
X-MS-Office365-Filtering-Correlation-Id: 1791de30-67d8-4b28-2fc8-08dd7e5d53b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hs7fXc2qtJ/W5QeY8WQluSsvDtwRhtrlKtw3UMEYD2eisTnL9AwNKJnmPuz9?=
 =?us-ascii?Q?2waSGojnp1JKCE+9sY2sjvVPb2uFvXRMhmRknFkifhOGPa1VduoflbLyyZ72?=
 =?us-ascii?Q?43rOtP+ASvfU4z50y8i0xWE5RCExhHCT8p4W++TgYKnzgaAiiyaxKVpgWB0x?=
 =?us-ascii?Q?NxkaJj95g/9L2TFmZyV3mJeLrRxCyZIEoIYY00UxXiceokpnG/uVBQBYVgm5?=
 =?us-ascii?Q?eOtuymlILhY0BSidA3TydkSSu45ms6aQzk27AZval4LAPAOuWwH3tQk7zi+c?=
 =?us-ascii?Q?kAj3TbETAbQYUJQDTCkb4JyUqrO6fj4GP76REg4ovLStI2dbaW0K2uXdzTx1?=
 =?us-ascii?Q?YAixRKUArWmMZoML/5FvF99aPXtvYFZmDQr5U1jgJIPdgKXJHRgTF8itpwLf?=
 =?us-ascii?Q?CQc4BrEov6sLpO/ruM9xg8Ln3g2rMYWdlffSUHmWqggVO8e24fU2OUf9KrwW?=
 =?us-ascii?Q?MFkj9t2V49zALnnOiFZAmqQjigSv8PxD4enEnp7se3enkBCX9iNXa/5PJxrG?=
 =?us-ascii?Q?FSW2dRpYaB7G3Q6Y9Q/Jb7DXBJXjg9Z9H4cHkMUDS4QiOILU8upwtQaxS1Dj?=
 =?us-ascii?Q?GsmUBW/twnZ3bTYq+9ud8dfS/OFW6xlEwqjeFSFOD9PQ3hjzpKBkstn9bnX7?=
 =?us-ascii?Q?EtO59Mlf85YHTaXeUO3jH4e1CnrVxTtt2HQFLeoUFO9Rf+9P0ee8eMNeE30U?=
 =?us-ascii?Q?K662RbiU0bjuP4DCtx7hdWY8msjHpd1BuSKrBHHnncmezVvakFfuX9ZnzywQ?=
 =?us-ascii?Q?5/b0/TdFDiTqkxYXAFDsmVLi1CiSov3aldVesQU7YAol69mrvrZsQB95+LT5?=
 =?us-ascii?Q?BcAIZsammMZBZlESOjltygkUsvjagUo7AKO1GzQGkIi3KSEv+t70QIW/CSu0?=
 =?us-ascii?Q?HKe49pokY3Hsyy+y1ocCFJIybEdKmPYrT4sC9Dgscq7BQG2dTCZx8KDtk9j7?=
 =?us-ascii?Q?qYlkF0L50yq8uAO1A67f+unAiGCBrMFVgeKnwT1KGtjFqpZEaONU865hVBoO?=
 =?us-ascii?Q?XDtn5DFlJ1eaBnMTKye63MYpHMUs7GYh2akVKKMFOvoHxk1y27DvX7mTv3jv?=
 =?us-ascii?Q?VgmM8a2I4m+J+Op6IIGZwUl4Qqv7N1+VUxgp579lllpiR5gk1NkXBOHw6NyT?=
 =?us-ascii?Q?gCBXcd6mfGnnqQXNMInWgl/nI5khQnustK8r4FcV0l3GVlVANoAFbHqVNL/J?=
 =?us-ascii?Q?c2UFG8hMZiPXsBykJOvsgiykbPC0Ct021Fss6jCzyplcHjdfLik+yezvlg5O?=
 =?us-ascii?Q?aLG0Aj/4QdHFRnutBoTAk70rAhfTADcMaYRLBGzSZslbEWkDo3itUCBlfRkx?=
 =?us-ascii?Q?FG9RiQCvxthzIX03uRXsCOwGcLi00DMI4ahjToF1DnA7KOnMig5587URmb7Y?=
 =?us-ascii?Q?qH/JryRn1EXJOfb1OHS5Mbpo0VYh95zm38FX+2QlRZ22+YkTvA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kodlEB6feuCG00N7a6UdvyaGwdlXEohF/oUaJQW1X9LQ9VnUSLQ+Amtd1ekX?=
 =?us-ascii?Q?icRIcggGK5v6iu9XO2ERGeRrWV+nu5umFMT/3ZphFbRNoe3AI2T4LSFPMmKg?=
 =?us-ascii?Q?34Ni0a5I9ZvYD2z3irAA+6d9WNa2a/uM00GYDH7BTu6u2pGI9+RK+etNMHnQ?=
 =?us-ascii?Q?AzAVJF/cSLKk30yYD/a6JqbQScjIHfyS4jdvmCNjtIBcSV6x3K7FT/J9NVHu?=
 =?us-ascii?Q?lmQHdBDw7VJlIZZMDDFwldQ4x+tgQPATa3JGb8l8k2ywND4sGdSFgTZwtXMD?=
 =?us-ascii?Q?Oe1/0FIxRb6W1YlQu6smTReGrzQIXfPXYOzNUBT+4sHV2L7+SiNxi/jQqtmP?=
 =?us-ascii?Q?zkXlm8reXoXivetU8fQqWNAHmltsGc5QN6bEfo49mS2es0HVMMCXt2kuSnzk?=
 =?us-ascii?Q?SuOERfu6T+BeedwolYC3BPeAQ9LSCubtdlARDCUU4UZwher/Ykj70gV06J2G?=
 =?us-ascii?Q?dP2fKJrgbYzU7UCTbr7bD/GMhKlvj1mO1vD2G8bkduOcamRCfR7qYEzVXZuG?=
 =?us-ascii?Q?omBplxAb6y8SrfepkuakUPrAcPg0YtDoT3hWLaGZ0+2GiJ+dpZ3YBmxit18I?=
 =?us-ascii?Q?GFg92Oz3vRjtQHunZPQMunaZb76h0n9BhCRMSQC6JqbBGYkWwOIkm9BzPU5f?=
 =?us-ascii?Q?OM/fe/SLZ/3DuA6PPTGHifHv3o7d7LyT92ZJWYz9yBEwPr01ozMRmeo0h72E?=
 =?us-ascii?Q?MBUiGY1tfotoOOyL6PN75QAVmfdE2dS/nYbjRVrvTb8XMqEtGq5Skop7jq0/?=
 =?us-ascii?Q?pOSY2LBI/XpZiQkRP1n5Kf66t+0AV6rxJj8oAanc2P4u5fwRWxA2rgYh1QMd?=
 =?us-ascii?Q?XnmL6BTsKe/9LHxgE3GCFRgMfTofzWOi38hxnhatABVODE83idKhofn3MxSC?=
 =?us-ascii?Q?QJ0D1ET20vPb/5U/2sRIxEyoBmNfnYsaxHcTPB5glZDiOm/DDuKtDGURWQPm?=
 =?us-ascii?Q?GivTJXtd0sucw8gAtrai4+hAdDQlLVHC+Nb5XmgUVnAo2sWMYlKRMsTYN4ta?=
 =?us-ascii?Q?XvXrM3bjaG8/lQk2uKB/1Scv9CG2QHw4hTSdnoG6hSe3KBTMfjWgVPaQuLXv?=
 =?us-ascii?Q?bth6OPbu0q9TNlDazl7eml/wnR1zSAUuGLhmAEE+KG2iewFSnmFFuxMQmjjC?=
 =?us-ascii?Q?L6BJx7prswxbJxhosPsTTmCIJAF23f3t5PK9B3Tp7rF/rEBsskBSvryRpx4D?=
 =?us-ascii?Q?rtAC7/PkEG1ysBmhNT7x5pEad/wYCxZO4fps4ecVfwjQVzSgzb2YlYpc9u49?=
 =?us-ascii?Q?bV95tUuw4Y9QZcZa6G4fwEYs4ZE20fB3W55Py6+93VsB8DhR8q4AiWCHqi4x?=
 =?us-ascii?Q?fr8OvqTblqFhe0gd021eQ8qF+Abl/W8dQX43WTsNEuDxQjBz8CjoyaALCD1N?=
 =?us-ascii?Q?39DsSMsD1JhpWVtWy+A8N9B7I1027CBbv8akxjlFMr6wvV67D5d3aqzfycHC?=
 =?us-ascii?Q?6sb+pd+ZfGT1Hu2/tjaRzWUFgt21VELM1LQvdggxppIEM9ymYtMKbebtjBBG?=
 =?us-ascii?Q?FjP5HmErkNJYqMcvQO20tRspT7iz4O7uHfKsJbfYB+BXz7yt7dbDtlt32oM8?=
 =?us-ascii?Q?srkqfth8RV4DWrKd1ZMPyXkN/K6bqbuId1ea6OBV3GVUljTuTCRTtBLhFuYa?=
 =?us-ascii?Q?6Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IInqBuonvDSahfNunNwc0eNaDWLU5eyPzCRU9ZmNc1niacVyf0OJRpwAYAfbjfXrswrlfDsQDdViQzqCOhjx9nmPelzF3Du4O0/uTuQOgZjrb/Cf+9cMAStCmFJCpfu8fnDN+6nrc8o5/UBC5AyF3asERZpHQ4UowQY/zySRHQ1XOzdiCxiWk3kmCVx6EsxC2aslr6oJyrkdLhIkGLElLhda/6hWXi7Qgo5yOjHNTev4aR+AvZnD7rYjok1r3vZybAFq/iSPmSwJKikD7TrGFXHZSdhHL4Y77aQ0sbc6fqFNdLzo3IwXYuUiT4TNC8IVnJl98G2Tz7bz3r++9SZyYVAQE/UCtRgzb9PHk90m7yy/LJQuTlc5FzYmy0M9s6XU5GBZN6wD4wePMjtRty5A9rIJ65YW8jpnPqjs0fMp/Uqy6bEJEwPNSiC50GAwgdZXOKUvvVmlzd/gWW1ubZDXtlBwzFRnUp93tdKOJ0+DGHvZUy7fD03KMirx1v/UdVXyLoDggBGpwlFFcE4WWw0dl9y4v2/TVpEp+jW/XYP/Jb4XCLhuO052mQph8KDJygen0f/De17zR6urPREerHldrvkraMgOnaKNeJNXLzKKt5M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1791de30-67d8-4b28-2fc8-08dd7e5d53b9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 09:42:25.8930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7UX2ueYLI/JiGY6LxaXGRlWNFGga+oHb4GRZUYQZoPjvbHnJICNCa2Ra1bcVXvdXP5n4sVMABOYtKCGuiurcjRBk0+RysvGkTpXJgsj+MA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8094
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504180070
X-Proofpoint-ORIG-GUID: qclMO1c_OCQBB4TTXi_BJyKRnfAYIGNF
X-Proofpoint-GUID: qclMO1c_OCQBB4TTXi_BJyKRnfAYIGNF

On Fri, Apr 18, 2025 at 06:37:58PM +0900, Harry Yoo wrote:
> On Fri, Apr 18, 2025 at 10:14:25AM +0100, Lorenzo Stoakes wrote:
> > On Fri, Apr 18, 2025 at 03:52:24PM +0800, Ye Liu wrote:
> > > From: Ye Liu <liuye@kylinos.cn>
> > >
> > > Renamed local variable page__anon_vma in page_address_in_vma() to
> > > page_anon_vma. The previous naming convention of using double underscores
> > > (__) is unnecessary and inconsistent with typical kernel style, which uses
> > > single underscores to denote local variables. Also updated comments to
> > > reflect the new variable name.
> > >
> > > Functionality unchanged.
> > >
> > > Signed-off-by: Ye Liu <liuye@kylinos.cn>
> >
> > Thanks, this looks good. I don't know why we named it this way :)
>
> At that time there was page_anon_vma() instead of folio_anon_vma()
> so the author couldn't name the variable page_anon_vma :)

Ahhh mystery__solved! Thanks Harry ;)

>
> --
> Cheers,
> Harry / Hyeonggon
>
> > Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> >
> > > ---
> > >  mm/rmap.c | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/mm/rmap.c b/mm/rmap.c
> > > index 67bb273dfb80..b509c226e50d 100644
> > > --- a/mm/rmap.c
> > > +++ b/mm/rmap.c
> > > @@ -789,13 +789,13 @@ unsigned long page_address_in_vma(const struct folio *folio,
> > >  		const struct page *page, const struct vm_area_struct *vma)
> > >  {
> > >  	if (folio_test_anon(folio)) {
> > > -		struct anon_vma *page__anon_vma = folio_anon_vma(folio);
> > > +		struct anon_vma *page_anon_vma = folio_anon_vma(folio);
> > >  		/*
> > >  		 * Note: swapoff's unuse_vma() is more efficient with this
> > >  		 * check, and needs it to match anon_vma when KSM is active.
> > >  		 */
> > > -		if (!vma->anon_vma || !page__anon_vma ||
> > > -		    vma->anon_vma->root != page__anon_vma->root)
> > > +		if (!vma->anon_vma || !page_anon_vma ||
> > > +		    vma->anon_vma->root != page_anon_vma->root)
> > >  			return -EFAULT;
> > >  	} else if (!vma->vm_file) {
> > >  		return -EFAULT;
> > > @@ -803,7 +803,7 @@ unsigned long page_address_in_vma(const struct folio *folio,
> > >  		return -EFAULT;
> > >  	}
> > >
> > > -	/* KSM folios don't reach here because of the !page__anon_vma check */
> > > +	/* KSM folios don't reach here because of the !page_anon_vma check */
> > >  	return vma_address(vma, page_pgoff(folio, page), 1);
> > >  }
> > >
> > > --
> > > 2.25.1
> > >
