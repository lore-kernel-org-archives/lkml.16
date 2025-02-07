Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D8D1990C7
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 17:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738949108; cv=fail; b=Q2iXGNwAQ/U8V+hrPt0BoIqWa8voWvpXax/i0R+kXc2jPgd3PcKHVk4y/yvt2aMcKFA1QKpvcuRtTlXY/ovfGJKQrfI0NCi4BCirvI16173OoIqelM6//OjOpCBu9z4HtPLhGwf+OknRHqgCRgsRzSVLx9ZsMSGzh4YRaGafj1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738949108; c=relaxed/simple;
	bh=uD+pfjLgY5NxhZuZgRHyoEC8u2oNLgYFU3FezppOm50=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=elKuZVSxYVAxtXK3IFHCKM2fK/LZyYHrXbPDQ6eeBpCO9IJlK3wu/u0v72/l1J/HyFPUcpLofNKEjM8B8W8PGJ1BK4wSaUIz0StHINQNG53F9idHZ/eB6mssx1555a4LTGTYUsTqcsthCyDJpb0yCQHWNghZ+i7pzpJkpUW640Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=C/ALbgSg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=whHzAVQy; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="C/ALbgSg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="whHzAVQy"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517EmiLJ016876;
	Fri, 7 Feb 2025 17:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=XZwLZtahrKlyxfpD
	NBBCbgjoN4mmLQn7VLcwtioZ76s=; b=C/ALbgSgri25tNavb0Fv16XeNqg5v2IH
	WUtsI4iy1iqTRoWlZfDFQGbsq4D0rHGgout57oM/mjjfcfeWc5yYQDXk0TDaWzpv
	f3lbz4eKa+yzaCOz95muKlv1ezp8vlW6in9e+mivTZs/XfIUX7iy9vk+riD66kIB
	+24wkaFhlnB4ywKN9VZcoBmOh/5woT3sRjBqWom7rgXNlyMon4FylV0QCtQyf7ZG
	W6ZcH1EJ93N8G7dIbBDNy4S2w80Orcu3j2R2o45uz6NhzrV5cyQT9k2wE0j0ni+K
	lkxhgTQNdyGpl7TNr9cF0a4BlzeDLH6ViM/Lz9aE8ykJguKIEMOFrg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44n0fsj6j1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 07 Feb 2025 17:24:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 517GPx5L022517;
	Fri, 7 Feb 2025 17:24:55 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44j8ec5df1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 07 Feb 2025 17:24:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CpO87EUCKcNBWUNrXzadZstM7fyF5mdSN8N8PyiJ41fbjN2beRkDmGiw0101lYfOaDDvI03PIIhhQXJ5T0Ayw1OQ2dg+ByeFOA37cRsXJfRn4PcOUCZJYDUpeLvJmlskxq/tFH950gfP0tXpZOf2OPbJAq1m9cRaCG8VEX5NwilEz+8R5VFO6MyBW/+08PGXLwgbeyqf970XbFYhhb9JuLEkFurgv9TmV5HSFpn1H0REP/jl30KLEfTpTpLXT7PbMDhMKdn9J9gbvTbPSSF1tjnmaLVHybhvRNJGH97iFkdzP07kB0uSCjETCADL0rovQWZecht+tpE2n+sNQgQcog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZwLZtahrKlyxfpDNBBCbgjoN4mmLQn7VLcwtioZ76s=;
 b=s0X77l/nPcuMOcP4bAj59xha7+dKhvr3fI9q1+9prYcJcoZLDjdhWZm0TIlG4401/hhl7EKBhlM7Nve+umEGWXcB6JNTmjmI8j5xlDwz1+YqX8c0KDLdNjD4T3EFC5LP/dUk2ABhKoraPBgOHzATpjiVcyNndIUHYC1uBYdDZjbqvmpqfwRyl5do7rU4oSGZfzIQDPaYnddX+lkZwJ8iz/aexPALe+r+jQgMg4XPz176XPreSxXMzVyaAgDNcgesiWjWSS7xjjtgVy6NDdblLzEKklfKYH4Uc6McpzG1qWqaUFpVkLIyhxNxUEy88ioSQqwN8sTURGQlKoj6Eu40AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZwLZtahrKlyxfpDNBBCbgjoN4mmLQn7VLcwtioZ76s=;
 b=whHzAVQy4k1m+H8Q27EoMH1MCTQfMg/kIowpDGVDZuqt95GZCf407YX2cN6i/Ny9J1s1h3PddC9rwjzvWiSCHb8yFxUz27UgD+yUhDz5JwolSmFUC4udxbPAkPV3eetudnxMdfLeYTNF5YpDkM/qDX1V2xRR449jMDvlNLNVRd0=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by DS7PR10MB5117.namprd10.prod.outlook.com (2603:10b6:5:3a6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.14; Fri, 7 Feb
 2025 17:24:48 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8398.025; Fri, 7 Feb 2025
 17:24:48 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mm: use READ/WRITE_ONCE() for vma->vm_flags on migrate, mprotect
Date: Fri,  7 Feb 2025 17:24:42 +0000
Message-ID: <20250207172442.78836-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0370.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::15) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|DS7PR10MB5117:EE_
X-MS-Office365-Filtering-Correlation-Id: 526d2f76-d462-439e-e702-08dd479c52d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nXy7KmDfVXxjUnPNrx6x8VXVpkvkODzzt07LOO7RriW8g1mzrN9ye2+JF4Fy?=
 =?us-ascii?Q?roHY1DuyexKrDpD//Y0iRGchaJZevJKZiD/+FvnCd9JbnlIq/1z6tcvafhPh?=
 =?us-ascii?Q?O48cJu1kJAyttEn0qk7TmwTWGxba01Nhs4dQljpZQVzftbhNkPmr+uhDrEba?=
 =?us-ascii?Q?gzeUHRO8P1Yu4oPj1wQADEFlPkZBO/2MWqwsKdJRMEOItEM+tUzqwXuFHGp9?=
 =?us-ascii?Q?Be/JtGQ7aYPFThFBXPoRysbtF0xC/eRlaZ0ax/vVEEBV6OhU0/WHnaDduDrr?=
 =?us-ascii?Q?zcRM/85EalsjtP9vz4lVt57Z+9w4bZLNjfO6CpyZ1Ol5GFOEotjOjCNZ/W34?=
 =?us-ascii?Q?SUxiWEMU6JAfJuVntpcN/NOdK4hsnQ0usROs8MxtAqtjRdYIckYPnBfsOdhF?=
 =?us-ascii?Q?4lAu3BGbR2DD8y41elz4JtujuEka7mU4Y/nlQ9LUq36cEIQKTm/DKcL2iBNO?=
 =?us-ascii?Q?sld1FhDNITPrUkkPCQqw/mfb44mg9r7fTikdczTIUrkiPIhmn2VRYQUF/28X?=
 =?us-ascii?Q?VqFD/nZ6LPLYjyNsuVswKAGP4aLuHZrgDplLu34v0X+fa5JAhgCYBZN4DP6B?=
 =?us-ascii?Q?U0BAU/sw9FxTzBGA7ItUB/oHDHBt03f/JUXFa8IYJwjcIGQf9NaUZoYPB8ZL?=
 =?us-ascii?Q?EtBACM/jkhHJdPDSq8OFTel5KNAs+J3BiWtFpP4FwNpm2hCesjFMYWKudX3r?=
 =?us-ascii?Q?9U1+ZyY5Qn3DWog294Ltxh8ReUtTaDyUdP1Un0ZONoMFk8SXimk7ePuQF9Nw?=
 =?us-ascii?Q?eKsohON0vTum+muMY2EeasFDu1gWuRFuh3Us+h+PzKAi7TylygOKAYPZLSyo?=
 =?us-ascii?Q?aALvAVVTr2LXE7iBIJ2JDvTKzbpFb1YQNTqblDrtFJeNutpcrISi3EwDoFw8?=
 =?us-ascii?Q?n1cxjzesWCjkL3R/dA3rBPKLB+aIjkvNNBOi8KPtTI7xbbQVs9lV2s0idikF?=
 =?us-ascii?Q?Nki6YYyLmMrc8g82KbaVD9zjgmjWarE0Ylxfqw3OssO5cIiA9oaRTn34+3oz?=
 =?us-ascii?Q?g6NNcpyaL2mVTjpZ47G3x/h/231Z/aSE/6l2qaP9rEGo01iZypzlP1Du3D0s?=
 =?us-ascii?Q?1RjmjgDTUyBNSZ8W386h0IC6fh8RgbzYC3YZsG03vbClUOnorJWtUGZNPUi0?=
 =?us-ascii?Q?YXLW7SBcMQhJgZomZiHgFu5Qq7Tg2U5lEslouNJKpX/zvDfT2bY6BFCbb3+n?=
 =?us-ascii?Q?UbSPmyhT0tczODX+LlNHfmBesOT3DjimZig6AeArQbXVTgDY93Kc0c+8D8+O?=
 =?us-ascii?Q?zCCxDoQq73dvnJtZIEobBgSlmBK+ViMScaGDsj0ZsEWSLzVNkcMKNM3x2D90?=
 =?us-ascii?Q?nJ3g4GVYqKJyjyFpW7+wS6Ffy0zP8BSwZVvnzGRwWND3K0X969NTGvs5+f4m?=
 =?us-ascii?Q?nHlD5f4TjiPdG+3pgWurkDS95xbo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H63QQGHNM+wth99glrklAEBS9tTmTtQY2ae3CZyLpWoTxVxtfHVcyDvideeb?=
 =?us-ascii?Q?bBX3GlBYNp9ka++TLTVosx9UH7WQbxyHT3gvtZA7BPUjcDB3cCeJXCayj5J/?=
 =?us-ascii?Q?iMpRzH+m+LwjLl+VmfNvK+We7sMKLjFpo8er36SiQIXh3vbbNFWZrgOk8kxf?=
 =?us-ascii?Q?VmwlW4f+N9Pe5EEYLjYF5KFFYwOebnW0N0ZrHD1F+nNMiU7vAxwKinCBmD02?=
 =?us-ascii?Q?wcykq1IuBQNs71LCnSCuPkIJfHVoY0vpiDZrkFCPxjnJtipR0Q1Xdl2wKA7c?=
 =?us-ascii?Q?eE1Rbxqz/Hr0TUPxH8uYVgtwtNrPpDCWe4g6QwzvQOAujVPz8DbVV6gHg/e6?=
 =?us-ascii?Q?d38PuDMswFgT4svz/FmnCqWRt+0GYlZv2EhertvwoV+bNoldH4yCXjWvJoQO?=
 =?us-ascii?Q?fMobNv5ErfrRVSuuz+JfQu/RRQmmC4xoLgksTUzamHFidCwbmj+VIeQpPJqL?=
 =?us-ascii?Q?oC4+GmzfMx6pCOh6e1Ts86mtYxo/Wi/jUrp59SoCD5oaAD9ntKBTlM04KoH/?=
 =?us-ascii?Q?7fwHmHEPdhb+K26s61sIuq2GIVlqde8UIwVLJvzCzN5qoG2svE0pZc+qEQHs?=
 =?us-ascii?Q?ERDc8rxoY3ZUMqPikJVDO9ABsY+pwWc6r1HTkYbIlt1xpsn69bkWvSJjHsAx?=
 =?us-ascii?Q?XEL4HPPpcUgu/AoT438mbDbalTk8Z759r9TM3XF3ddfd7BR4VmmzBe6XFUi1?=
 =?us-ascii?Q?eMDuQniWE2AJOH8zhjsgQbjS5T9Che1ESlWbQHI0RzLN0m7+KRrPgk+l+C+P?=
 =?us-ascii?Q?h3pBTvzIKpkBvk3t4d6pIAyQOQq0TLZWlVnOOGqFyb+5TnbL5xg3rXyOjkT/?=
 =?us-ascii?Q?a18P9QE/AsCvXDEKCpUwgrD5bD0kjFpgziSJjNBR2DW/8d/RX15K79xZpWBU?=
 =?us-ascii?Q?dV4eyb70+Lu9sRnNnnssy7dFrRlHeP4wi+IVYISgWHWPiCR4ybAZBWlDv9Y+?=
 =?us-ascii?Q?wFeHe5Qn8Y6vuGf0M6lTIVJQWqCwz1ilutsXYptM1rX9NJJ0bKLx+uJhNo/D?=
 =?us-ascii?Q?F8VIq8Ne/xwaAvisZ2AQJPsf/r2w0RWBLdgUedumHTLgRYQWBwaiLVCFDhZM?=
 =?us-ascii?Q?OzFIXUZSfJ+RMfzJwskhVGnoe0kKO7v80bncmr40X+fACuo+fF5bs1o6ITHj?=
 =?us-ascii?Q?JNErtKc+SBaymvfQ7MT7CLO+VthuJf7pJbgpA4kubcTV+gMMkyONnIFmw6/z?=
 =?us-ascii?Q?G7yce22rwUoeEB0qNi27RECst74Xk6PfGFgySg1VaIWgZsAVCVTj/cxjFJdI?=
 =?us-ascii?Q?Gn3UzxHQROWlnXfTFuSB8Y/5BkFVNTRYqZI/UmQjOt/jdxg4VXTwaa+5j3Uv?=
 =?us-ascii?Q?071SewMetiwFtdiX59wm0AI3s0/2tbLw3bR9QofOM1aOOrTSCq0DfLJ9duUa?=
 =?us-ascii?Q?acF60ZtjRI/KXhx3vMDwQ4ZLcnHmDrUXVpDUuCC28vyDwxw3L+dynlgtboMs?=
 =?us-ascii?Q?MZ3WcqWlp9RIa6lsheq7pFfd3a774j4QLhUfhmbvzBch/e0kAA5pIBmP/fOw?=
 =?us-ascii?Q?dbNIzLCiw4BIc5ed7UZUCrO6WkUaQXFG36CQ76b2PL65ZVI6+zEuEmrqMt+l?=
 =?us-ascii?Q?LL7HHEP7VSoTT50ooAMlKEtXNbM9J90ls3JClYgm/1LLmFOFmfTYh2vGVKUV?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	L880Q6EBQcsdq5H97PQL11wU8RIJ2mLmcTqaD8c31wArtw3wLFBj7szqGbGjZZJuDvD2CMRuhFV2Vb+mlZqUQsJis7R6dRuCdUpJA0vYimCVKALiEg7afW8IzdrSJfDStWKBTjErV/gBQe98ySPcUBp95pXvfkwYs6FuWUC4wT6+9cWcpgFJDN27N0p0/lOiiGnudKqGb3Awp+oqAIgfPOBaJi1iOj/voi3lh0OiCQ9YAOE7BAPlqVYdSmU2BfIdxyTcP7AGWx3lnftGpEeGpcXUZw52UfzSU3nE3PtdSyjubt3Ln2vEcBCKjo5P/jPttcwBuyfukg2StjZPiLd9+k/6ISGW5bKZkp2way4YHd8Hg7Ux07a1JJY8z5i51gvoHayVB1JQPyW8XuZ+Y0Lf+cI0Wj+tLvA/rxh2rVpj2F2tzjwjtKYEC89gLSX+5nriVOnPTU7mCiQkFnqkxJ64rIP8C6yu7/zFz4w72mTDCq0/eUiWrAeRXKbhNB2gD/91idDFXmO0tV18rar6iUNl7aKT6oCorl8tixoxkQFjVX8vJJ133M+AvP/SFfaJS+gICJ2zwTPXtpTLTfrnEwNt57C8BF2MZWSdIeEaWvVIBFw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 526d2f76-d462-439e-e702-08dd479c52d0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 17:24:48.7514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O79NBBKF3pvIb5kpfyfBE5uCr9CxEgPpmBPmQhbfLWd0G+eRF39v8zZSXk3GNB5sBfAqibvR0aEOt+xxZry9FLQaIgvDqzdA1K9heDkVv60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5117
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_08,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502070130
X-Proofpoint-ORIG-GUID: 9XR0a2ggBFOMEUCX4ReybQV5_4T6W_rb
X-Proofpoint-GUID: 9XR0a2ggBFOMEUCX4ReybQV5_4T6W_rb

According to the syzbot report referenced here, it is possible to encounter
a race between mprotect() writing to the vma->vm_flags field and migration
checking whether the VMA is locked.

There is no real problem with timing here per se, only that torn
reads/writes may occur. Therefore, as a proximate fix, ensure both
operations READ_ONCE() and WRITE_ONCE() to avoid this.

This race is possible due to the ability to look up VMAs via the rmap,
which migration does in this case, which takes no mmap or VMA lock and
therefore does not preclude an operation to modify a VMA.

When the final update of VMA flags is performed by mprotect, this will
cause the rmap lock to be taken while the VMA is inserted on split/merge.

However the means by which we perform splits/merges in the kernel is that
we perform the split/merge operation on the VMA, acquiring/releasing locks
as needed, and only then, after having done so, modifying fields.

We should carefully examine and determine whether we can combine the two
operations so as to avoid such races, and whether it might be possible to
otherwise annotate these rmap field accesses.

Reported-by: syzbot+c2e5712cbb14c95d4847@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/67a34e60.050a0220.50516.0040.GAE@google.com/
Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 mm/migrate.c  | 2 +-
 mm/mprotect.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index fb19a18892c8..365c6daa8d1b 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -328,7 +328,7 @@ static bool remove_migration_pte(struct folio *folio,
 				folio_add_file_rmap_pte(folio, new, vma);
 			set_pte_at(vma->vm_mm, pvmw.address, pvmw.pte, pte);
 		}
-		if (vma->vm_flags & VM_LOCKED)
+		if (READ_ONCE(vma->vm_flags) & VM_LOCKED)
 			mlock_drain_local();
 
 		trace_remove_migration_pte(pvmw.address, pte_val(pte),
diff --git a/mm/mprotect.c b/mm/mprotect.c
index 516b1d847e2c..84cf7689c5eb 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -607,7 +607,7 @@ mprotect_fixup(struct vma_iterator *vmi, struct mmu_gather *tlb,
 	       unsigned long start, unsigned long end, unsigned long newflags)
 {
 	struct mm_struct *mm = vma->vm_mm;
-	unsigned long oldflags = vma->vm_flags;
+	unsigned long oldflags = READ_ONCE(vma->vm_flags);
 	long nrpages = (end - start) >> PAGE_SHIFT;
 	unsigned int mm_cp_flags = 0;
 	unsigned long charged = 0;
@@ -627,7 +627,7 @@ mprotect_fixup(struct vma_iterator *vmi, struct mmu_gather *tlb,
 	 * uncommon case, so doesn't need to be very optimized.
 	 */
 	if (arch_has_pfn_modify_check() &&
-	    (vma->vm_flags & (VM_PFNMAP|VM_MIXEDMAP)) &&
+	    (oldflags & (VM_PFNMAP|VM_MIXEDMAP)) &&
 	    (newflags & VM_ACCESS_FLAGS) == 0) {
 		pgprot_t new_pgprot = vm_get_page_prot(newflags);
 
@@ -676,7 +676,7 @@ mprotect_fixup(struct vma_iterator *vmi, struct mmu_gather *tlb,
 	 * held in write mode.
 	 */
 	vma_start_write(vma);
-	vm_flags_reset(vma, newflags);
+	vm_flags_reset_once(vma, newflags);
 	if (vma_wants_manual_pte_write_upgrade(vma))
 		mm_cp_flags |= MM_CP_TRY_CHANGE_WRITABLE;
 	vma_set_page_prot(vma);
-- 
2.48.1

