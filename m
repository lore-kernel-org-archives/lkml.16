Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D6D22617F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745494492; cv=fail; b=siqHpc96yVhJnjegUbk8kGrNgjjTN9XTO+EnK5idsNfp6QRlm3XNRdbRhZu/DWEcpSxOI7it9lPwU/GPzUZ/1r6P6a3XV4aiEJnPKTgJpfcb/VsMfMu4OsQQixcGl22U0fQAddQQf6x82JHD4AJZ1Aw2bTAkiJwlEEd44PydrcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745494492; c=relaxed/simple;
	bh=wzLUybumk0ujMCnY51FUMTysa6ux3eTsPTf1+GXWKg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OOr0SgfbSs5cKtXiuTJVdm9yMJ+p5cuxJCDeEgoYJl+Srz/JR/5nskC8r4vbzbrkWa0ddVrzVJYRGjCfLA4pRxIofw6mcKzWVqDu98It3ZYB0ryty4WDtkmKewCRFVxpyPQiOziRHCnLuCjr7MgJkcKVXEdVMvgkTe4j3dskvXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AiIIRtMj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=N0UPEu3+; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AiIIRtMj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="N0UPEu3+"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OAVv3C012098;
	Thu, 24 Apr 2025 11:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=I1HsWnBAyLcR64aIFx
	EgZNqRIdiwLV8WotfDl5yyaQs=; b=AiIIRtMjKQ64jDYu3R/ek1QmgaKNE4t0F+
	0p77kfd29H72vSNtZCLGprPVOF3rc9igvj3xhhsFyvzWW6ZFy6JDHNYgMerMjEQ1
	Avf299teOHHfpUz+5pYIKx3J2CX6i8+7H1a3u7zsfcmyQkLdU83vUyMUMp1VB5yR
	sL+NxfSbDYueCLka5Y2wQPjCbkrv0Hjaa2DRl1SR72vmgtX3OQiAEIGUIBMFhoZO
	+eImqAvtf6tSBcpHO/KfmZizqMFNKuj7Gi7Pm7lhVMpXd2tfYusHnAtvepNAdOX7
	alqkkHzuvpDeOKG7dZQS7w9ii/ohrEhUhMcDsMd9L4JHRK37TpzA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 467kmh83ag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Apr 2025 11:34:34 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53OAUT7m014162;
	Thu, 24 Apr 2025 11:34:33 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 466jxq4r0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Apr 2025 11:34:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w/9rLR9UALMFe+36i2fOv6+ERv1OrMVzXHhc7KUuvSiwO9hJJu7LWCbEQ0bhTgzHWWEodXvu3jfzhG9EYPkVZ3PQP2QxwbdxTmx0vny0dGbP6aXoErNEP33uafflEFniKXlFbpC2qSDKe6+Dn6GKaXi78rJPrvYQlajEV227wfgfGIJp9S0blhQNllvZxkXUk3XgUQS59eCoAb2WbiPfoOS2xn3tUZbr7qgxfVybbt4DfABMhhAYC6qnYfE7aqaiXxY698YSbSnHM0RVzG8N8J4KM7DrbX9/5+vaGvGEWaVEc2x4rCcVLQpp8zem54YNkhrItIhGEgA4RkGx9TtSrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I1HsWnBAyLcR64aIFxEgZNqRIdiwLV8WotfDl5yyaQs=;
 b=jV8YV8j6qRIhTMaZ80lyYEycbbchsx26eWmJDOnJNud9oVpLwVlImu6L5fOaW4V7n1LNGTTmgOuXjZRzoomv+uW34oPeur7Vxc1a0Ub52+3eUBt0WoFAzu69C0CMMBp0f1qzGI121mw1ccyZmlYBicyJnl1kpBT431p1JEQdt/8oLlHOoHkcDOOSAAR0uYD5NH8vtzDxvOVGaVs36oLnabX2dJozqBxXaKNaDrwWHI1R5TPnbOO+aPxsMAQCQvz8bSg4ELYnPy85v5+JPWvWUzzKbCim1/H3u9iOrEzbBp0OxIxu35JbiVfBTmZwKmvqdmyIyyUKVHtwgqjaTYTS5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1HsWnBAyLcR64aIFxEgZNqRIdiwLV8WotfDl5yyaQs=;
 b=N0UPEu3+S1eJIWraywC1sQJNcLiz3T6/ySvejUZWwSASSId2ALYpuNEBjBeOkOcKiWBCMog6bWRxLGlEg16O2jrie4yM/0H61EM2R6znYEhEyv6XORTHvvAWQsM9zRN+px7Z/xejnJVgVFJZd0Ep3NQ7yGY7rKRqGQinw/JtuyQ=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ5PPF61CA724C7.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7a2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.26; Thu, 24 Apr
 2025 11:34:24 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8655.031; Thu, 24 Apr 2025
 11:34:24 +0000
Date: Thu, 24 Apr 2025 12:34:22 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add mm THP section
Message-ID: <3ebfc536-9312-4609-b2ce-89c2d1499eae@lucifer.local>
References: <20250424111632.103637-1-lorenzo.stoakes@oracle.com>
 <45a10934-f8af-49c5-8d8f-dbd97193158d@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45a10934-f8af-49c5-8d8f-dbd97193158d@arm.com>
X-ClientProxiedBy: LO4P123CA0284.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ5PPF61CA724C7:EE_
X-MS-Office365-Filtering-Correlation-Id: 0371947e-0cb3-4a73-f267-08dd8323f6f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tEEnOF2f63Kn6Y8gchlqHthFZlfQCB1Af6bbU1KVzUDWAeCpjeVSiIDjYh+s?=
 =?us-ascii?Q?KNPaig4M90/zv0GtOFZ/KvrHsEcrCk5smSXBNID4FE3q4KfQG5EdfNSWEJMc?=
 =?us-ascii?Q?icdg8djg6mYIf9qPBCbJnUbfd5D29z5lmRZKLq6ePZv1Y2Zr6cqa97jdleIe?=
 =?us-ascii?Q?mxbRA63mk33lAs2tCg+CnuYE460y6xN6mlKehnYL2Q/7MllXF298JhqGj73l?=
 =?us-ascii?Q?BQkRtdeu/bIY93Xl4pxQIbxlOCksjq5AYHvFaoTS3iR/XILeCbXRLTuZz3cj?=
 =?us-ascii?Q?uV2xSD6IQrciVlhgLqGKAUYtvUGk457Xs/WHGK2vcT5Gq1cZhPEemdkaT6eU?=
 =?us-ascii?Q?bKcGjv8gA6+AOzWJR+FPnDnTd9TBmXNiwJsrY+5ByKUYDwmNlOCsbKEGtUCG?=
 =?us-ascii?Q?YhlQ/HeMeYX7/urG50yYY9C3cFqw+qaXVpDMdipmuJgoVlPmKKgWtvck2szS?=
 =?us-ascii?Q?Djd3iqmScGa8bbICSVoQm1GdG1wXRtUKDgOhMXCfqZvEE9JIR2m+rrEqYG2i?=
 =?us-ascii?Q?VquI48kG0ac5YX0lPnglgvscF+kTWJKYiZ06qCAUDxzu43ymiiHbMc4WK9fF?=
 =?us-ascii?Q?9X+UELNM+iQMvc5HlDjrmmyiHnxrCi3FsFVtJn6tdXFodNKQrx3ljltllOlQ?=
 =?us-ascii?Q?72ZhvvGCcmZ0z93eDqwdUCPfnzLJ4P3zkWgg4eduvIt3DgW6weFHWYN9PFle?=
 =?us-ascii?Q?Jr72tyCtPRmi1b4/KQZZ53PwJXP2VZwQRCMVZS6LvUQ+Y8PkysE9ZBUQuZ09?=
 =?us-ascii?Q?Mtqo+IFXZPNg9ECie8+ANa7oe4ONSeCz/Mil7RtnjsTRpXfsLDdp0MLdiFjt?=
 =?us-ascii?Q?o4X0zj1xqvSkynMz6432qDzenyaAPxCR6QJP46P3Bg4c9hUAX3XIzky7dcDZ?=
 =?us-ascii?Q?2fPEi1kWT+j9NArb9k3R5z9PYqJV7HMhrpVYRSDCpE7yEZHwryQtCwoSWthL?=
 =?us-ascii?Q?i8xqjYFVle3AQGljo4AbMiNB7hAZm3EvDw6vZM7KxEdY/IS1ahk5C4DidU9B?=
 =?us-ascii?Q?w1T5dnA6EVZBtKt4Bh9Jz6N2byqr73Evh6ves35BGn+pLnJeHQR0Bx0YferT?=
 =?us-ascii?Q?p7lerAN43KhpHY5L43/qSMIzGebc8UXzEbLmhWVMM/Ilgsx23C7oSoCmK2A4?=
 =?us-ascii?Q?8diXtqtWmWehMzOyMc2pBUNQNgL26UazaAQIR65vb9YwMaNaZ9jbH4GnZiRa?=
 =?us-ascii?Q?uSCzNWnrOi2jLzzYKQyIbtnWMKLRzCoRAcA2U4lNVAN/4iZqN7eStXkpQAA4?=
 =?us-ascii?Q?j3KihZgnJwXhtSdC3iLDGj1oqJ0YYKdTDCDo+j+5mZU1ofYNRc+NsRtDWRVU?=
 =?us-ascii?Q?xKoi/hT2PNSLgSiSljqqQtrHYxnaIp4VNZpWIABeSGwrgv3AcyHX96EG8zVp?=
 =?us-ascii?Q?0sdsdqg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wnXPtVqUIot51rjIwTP4BQpmEWb6CGScz1upwo5oj53yu8VJGNg8INAm3Lr2?=
 =?us-ascii?Q?blhcwb+eD6usAwg2uAjRqL+tU2LsbdVUaK9hAeTm3F2spHSvWBIjwRERT02e?=
 =?us-ascii?Q?Vhf6p5O9wIlgNn5cS5tOdSHQYMEV9/Sv6Eo7dQRSQZOf6/Lgc51YGEDGmv/7?=
 =?us-ascii?Q?qEjVqFVHU9yUB7ELyKzWm4YMCsnYTudrmW6OKwYgGKTTpJaJR/opK9udqZwf?=
 =?us-ascii?Q?9OMDZZl3IBNmwGPBeXrYhtLoLB3dxpB9UaNcbQOX7177ZVTH9FI2Sg9QdX0q?=
 =?us-ascii?Q?pkPjVt5L79ejtbnJHfq7em8mzeJ1a7q4ZldbggAS6KJN1mkl1UviewdzkReE?=
 =?us-ascii?Q?yYVh1vUbfWDlVtZssVXgzFzwTRgTJD2FcgGh4puFFhdOwFJaSjYKs0q39aqp?=
 =?us-ascii?Q?lLeoOWSCLM+U+Zv7HfX5EzrllLScRNRbjYsE+nZyqj6RdKQ454qB+oXk2qOd?=
 =?us-ascii?Q?5QCSeU4vw5NOTLic2rYeDyGkOGXSUvV/MMncok93NS1itBfm/ccmBn61243N?=
 =?us-ascii?Q?JUiae1dGd/dunpbDkObwfDXFxv/5CiawEmbjtuNMWazFU6nMyfUnLS3f5RFR?=
 =?us-ascii?Q?imX0j9ldoQSFsBI1jfPlxrVV/Hp7zZbAYA89giBQZ9qtp4f1EYJmeufz31bo?=
 =?us-ascii?Q?fejNlVwNWkbNWt57vq36bELuVAL7B8cCTV0Du+sGL1tTn9UJloy1ly53Vg8o?=
 =?us-ascii?Q?05UrJdkgUmYyLCl6r0IO5HYErBfqOmmM9UAvZGtFg1/ojI3Or1FhnpEscEw1?=
 =?us-ascii?Q?1lZe33t+gy7RG/gJcXKeXdgW+/AFLy7R6vdh+PSgI5VVcQZDGBI8E0VOhhza?=
 =?us-ascii?Q?UrT9r+vZy9DerXBBjrQnrCMhNZuhxofCMpfBLCMtb+09TsF4KJFFZhmqb6kd?=
 =?us-ascii?Q?nIYz1ehIesEhP56hrsVHKRkf8SJ9mdVfpDE3XwAa8eU1vnGWsQGG1FN6OMvv?=
 =?us-ascii?Q?ytMqncbGz6A2hC7XiNO6OxK3181yw5lE06GbHRcDuRpLKCTFA1itYP80vSH9?=
 =?us-ascii?Q?K5EiVrezpZy5ABCAYRXsK5Y2yuQg3j03wRh6xL70jm2XMEeQ6GiTF2hx3IIc?=
 =?us-ascii?Q?QqhzGYr/LktaPzcWH5K0Q3Bzo3zIAQLgDEwh87+hbtnYafBi/2Umszz3O1zR?=
 =?us-ascii?Q?/u81FYO+J6xCsEvGJikIZlkKjm4OPyvFMBVlGuYCBXMDQ2yAyBSYZa1Mc3+E?=
 =?us-ascii?Q?BE7KkOIybYncDouc0gAgwcOzEOw5Wdrq/WpkdKraGZ1ZD9a3PhCgYZ6nq+ZR?=
 =?us-ascii?Q?OXLPnNR2QfazAyYBMjhH3CKV5rnCuSZBnfsyNBd6pW6vSIi7dy77nzkIqo/4?=
 =?us-ascii?Q?yMw4pVzW3joQMq1jHvR5Yb/LWc0FNk18CR8S8dBCJ7cmT0sSqk0iTfewXb33?=
 =?us-ascii?Q?/qRRxrgic9hy7t1Fl4xNilD7H6QS0jM/UK80mLKtxlIH3WNH7Nc7iqBnb2pA?=
 =?us-ascii?Q?tEuJPGBLI79OUhuqvkz9n4Legeus++dF3CsqEtyiSJk8JhOgSotpYc0Go89/?=
 =?us-ascii?Q?uUUQ58TC00lfZFS5qTRlKgBhYFk0QdRXY2L692Mh8Avjx4TUxNnjMkoIdKDq?=
 =?us-ascii?Q?UDyJGpR4cHaRIYc9bKAd4q3UFiu5tSzr0r8A1ZcUyPcozwK56ON2HdlODgfH?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AKP1YYzYYk8R8UOs03crOP5WPgwroH9N14GgEc2ueT6Dd16pvsfhN0su7SRUYQHJ0K5sb5eiGbcHg42EvtTL6dqo00WvOueQ7ehSpUpDonSh94zvQDJqj3BaSbYXuuX3L/2n7RZWTZz5y2/gCv7abKqVwJEmBzS034AChBlKUJKjZnp3j9g/nQEJsnYg0cwSAvO96we4uL52m0azQ1DRk/8l9nHvM9S56ZuID6l1NoVKWOp0sgQs4i88HEZMTyKQ1D34ooPsbLKzY7FQatpABCPaYWXhB5tlf01JFWB7P9H+jqXiLTnA18s8MZZE/6Xcylued/L8Hf78zYmDSUfuyuS/F203AXp7QRH5NjX755Wtk15ONp7cJNWWXWd6HgebDBhJ75n5YT0+Not+Yok4LkIuNN9JM02noTfxg25AqbCsWOidyaMaPM9w1YGOwCZzsKTT8G0oAqiiMBP/V8K9SJ8LybwLOMxFey9ocSqdeHojWLvw29nDV3lNoBgOnxPE90y5rUa4NQJ0SA7jVrbjJkgYVy+fiNR8gr3U3PPUD/ubg7kNBEC1lFC/47Qa84E/KBV6/Ez4T7BMysqWE93Q87mY5EOMH9IOiOhUkHeontk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0371947e-0cb3-4a73-f267-08dd8323f6f2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 11:34:24.7656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G42xCYIedw/39Wm6GC1tgyVRt5j6JbnXmXchGeKCJ4IIZGUAl1b00857TKrETRohc/817YLaxPIWpd6Tdgvq2fHXwjj84FxxSosjtuJjFpA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF61CA724C7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2504240077
X-Proofpoint-GUID: uJ9yFJE8Vt8CX503KwqvEaiEwEPT-jVM
X-Proofpoint-ORIG-GUID: uJ9yFJE8Vt8CX503KwqvEaiEwEPT-jVM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA3NyBTYWx0ZWRfX5ldQSV94MyFE Q+c9pIskwVRbe+YL5rwQNQpz7w2LxRqabJ5iGKzy8DIvkAtfo6cqIDf+0w2YZWBCeGdoKMf+Pgy cOgsR4astJqjIKA/Xg99MEzdLYk0Qrp9lpuRkC8ndiofED43/3Wf+6sKKjSW60pYREt/07Gavmt
 k+ROsQR48XKNdiHh1f0KVYjjorH5IPbblY3p/6QRfl55aNb9rMru8wy9ZR2/rZULj5q1Ske7bbo ScUohNC7HIs1Vst3JwRwB5avrGEiLVyq7Yxtp/6i4iqU5UfOMS7WYmA0w4WNgX9f8x2BkOdWKhk t1zVeWaT0RQ4XmDXmIHOAE7i9kNOymybYUqotb+KRezEc51JuApkHDwoST5+tjVN+TMf32KwWc9 g+Y7Dw8L

On Thu, Apr 24, 2025 at 04:58:20PM +0530, Dev Jain wrote:
>
>
> On 24/04/25 4:46 pm, Lorenzo Stoakes wrote:
> > As part of the ongoing efforts to sub-divide memory management
> > maintainership and reviewership, establish a section for Transparent Huge
> > Page support and add appropriate maintainers and reviewers.
> >
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>
> If you don't mind, I'd also like to be added as reviewer, I am primarily
> active in THP stuff : )

Of course! Apologies for not including initially, really just squinting at git
at guesstimating here :)

Will send a fix-patch in reply to top-level.

>
> > ---
> >   MAINTAINERS | 23 +++++++++++++++++++++++
> >   1 file changed, 23 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 4015227645cc..85cd47a28a0a 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15563,6 +15563,29 @@ S:	Maintained
> >   F:	include/linux/secretmem.h
> >   F:	mm/secretmem.c
> > +MEMORY MANAGEMENT - THP (TRANSPARENT HUGE PAGE)
> > +M:	Andrew Morton <akpm@linux-foundation.org>
> > +M:	David Hildenbrand <david@redhat.com>
> > +R:	Zi Yan <ziy@nvidia.com>
> > +R:	Baolin Wang <baolin.wang@linux.alibaba.com>
> > +R:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > +R:	Liam R. Howlett <Liam.Howlett@oracle.com>
> > +R:	Nico Pache <npache@redhat.com>
> > +R:	Ryan Roberts <ryan.roberts@arm.com>
> > +L:	linux-mm@kvack.org
> > +S:	Maintained
> > +W:	http://www.linux-mm.org
> > +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> > +F:	Documentation/admin-guide/mm/transhuge.rst
> > +F:	include/linux/huge_mm.h
> > +F:	include/linux/khugepaged.h
> > +F:	include/trace/events/huge_memory.h
> > +F:	mm/huge_memory.c
> > +F:	mm/khugepaged.c
> > +F:	tools/testing/selftests/mm/khugepaged.c
> > +F:	tools/testing/selftests/mm/split_huge_page_test.c
> > +F:	tools/testing/selftests/mm/transhuge-stress.c
> > +
> >   MEMORY MANAGEMENT - USERFAULTFD
> >   M:	Andrew Morton <akpm@linux-foundation.org>
> >   R:	Peter Xu <peterx@redhat.com>
>
