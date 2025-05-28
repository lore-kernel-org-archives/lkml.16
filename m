Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40998288C1D
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 14:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748443253; cv=fail; b=K6/x9M4ZM+THiOArFmHje4ZcIpVVaSANFGYAwJZ0hFUGalKtR7bkMUovBV54b9ioU98VzXJJQJ1zZr3thor+/LXRg1U/9poo3UKzlbdk1qwCd6i0v9yfb0iA4gVQDoZzZIEcT9cJiqApTQWUDeCUC69Xigxh8unblUWX4cjvtcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748443253; c=relaxed/simple;
	bh=WOLTYOCRQaRkNGSN09Qqcu1gh4Ap4T2ka2TKxR6zgoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hhUyLmTVWLWWhoqzagqjhv5gE33x79UBpTOqOkp50krClqKqvax5Dt7T5QkgsvbS+aWl+8Qb3F2j8DjyfB682TGh3rP/lIMLCe7WalIgUtU/wXlJveqGO3umUa/2qMc3XNg+IscX9c3QMnnSSe5Y84rqlBQvSV7pVa65bt44TKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=q13dAWkW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=0NQTSWS3; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="q13dAWkW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="0NQTSWS3"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SCq9as031340;
	Wed, 28 May 2025 14:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=w2fU5bqcNOMReRL1tg
	6iOuNtmSQ1rprfLIYARE/jzt0=; b=q13dAWkW6rR7T8WpsSGwVpbdGVN2UznwVt
	CYGYiM2gsKKVdgaJkT6mkGzPkp6F+ar6L1RQgrreLcHX2QtLtJPYaJiD63rm4dOP
	gRc683LtZQ/n0Tkx08bk7q9jDKLnavjlZ1yvpAQmozSRj/xjM4nXIexITDUH+RaF
	jObYg2XnvVtAZlX3TC4uk4gzwmGnpSKS1x7fVDjN3kyrlnXlhSGqlDhpa+Z8llyE
	1tsae9+9+bZp3zos3y8OF2q9dWXwbpf7N0dKNTjxF0n4KsoxvE5ExqlEhhnvWw7/
	vZv/9vigDwmV2iRnRQAKQ8GHR0uQLd1wo415HDsCYEesq01eUnaA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v2pewuxv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 May 2025 14:40:42 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54SE1JRq028430;
	Wed, 28 May 2025 14:40:41 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46u4jah0a8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 May 2025 14:40:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dCsyBplFV/gWUW7PvOABc8oM0OEny7jVr/RHnGCk2IP/PfdGzMtgWi5BL9YxQqIsneY8JrObKJE463hCaLSg4P7jUM0C2KlFMZmKYpe+ZmPEBArZTY54bAONw8LFAGYJW9ZRNDVf8vpm5phI11gO5UzetvCQcQdwZToJ1LAq4tFCEco4yXUldhFGvuMsv5k1LDDs6ybKnegi0xLMuli5YxazfmzeXSrfh/xirkR7EQ/XVl1PgpM039Kr9OLZ9xiYuAuIBkkAUT4he6abHIUyEde+xONXMWd3dwF456iN8tQJOLh5LZ1SnOpsqRIK4mmPtE1412qRTuZLBxlHQ85YRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2fU5bqcNOMReRL1tg6iOuNtmSQ1rprfLIYARE/jzt0=;
 b=wvkAMB8w/6wMdfFts1lzrI0NjWXPIAitRL+3UXsj6OXZTyVLPNct3eIM3S7+CVVkqVAjqJy4w186mf6jW8QjdptTqb0ixz51ZFIChBMJvCageRMDxnosKqVpjZUsRPvKkmMD/IEi4CFQ/fWvHp3xR7cAOTeBCDNjq7ZM9I46dKiPHmbj+WGaY+eE0nbijLcfdMh0Z4g9d5rgJdlosaBH9A+DIhExzmDwZKM6Zqpxcrk+DryiSpoz6C3B8aNbSXTfcfQ4ztImSC/AsnpE1/A5OMKc3vDm+h1RMLhg8jKkyfpHbgpNtg0y0pkovK8lK1bFd+cxAxF2iuzy454l3JSPKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2fU5bqcNOMReRL1tg6iOuNtmSQ1rprfLIYARE/jzt0=;
 b=0NQTSWS3UizoNWv/iXbqQJdyyXncRukpz7R53+kmGwTXsawD8k4cDhfhmeNfK1RnLYXVJU7tx865cVYG83BHiDcT/SCB48xNCFk/2arEoypTED9sPWidmuUWFRfVX43lNfEiFLOBa5VwVa57qWVz5z3OztxoK94Z07l0dJle/zc=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by DM3PPFBD8703CAB.namprd10.prod.outlook.com (2603:10b6:f:fc00::c46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Wed, 28 May
 2025 14:40:37 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8746.035; Wed, 28 May 2025
 14:40:37 +0000
Date: Wed, 28 May 2025 10:40:34 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: lorenzo.stoakes@oracle.com
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        Pedro Falcato <pfalcato@suse.de>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools/testing/vma: add missing function stub
Message-ID: <2zr7b6mawiqiwczuyfolwdqw662binsxjnwv7ou25reqvbmhqv@5ije6q7b4mom>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	lorenzo.stoakes@oracle.com, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250528-fix-vma-test-v1-1-c8a5f533b38f@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528-fix-vma-test-v1-1-c8a5f533b38f@oracle.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YQ1P288CA0013.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9e::9) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|DM3PPFBD8703CAB:EE_
X-MS-Office365-Filtering-Correlation-Id: c744c888-ce37-4c6d-47bb-08dd9df59c7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sWzFSIMeP/fU2MQ/jtyr7rbJiZjordPgWHqI4P8mmffGzXYBy//qCDwyNbUt?=
 =?us-ascii?Q?chTUBD5vTxfKXsMqEkiQ38KB3RRwYevlet8gpQE+eg+2Jj4oN1UVzSwVeE8s?=
 =?us-ascii?Q?/1vH3U5blcQTYv4BmQ2uRf6De7SGDQvUU+IutelV0VLv5pw0Ja3UjIQ9ylDR?=
 =?us-ascii?Q?VfM7ihU+9qaeTZdp5TR2Y9PvUyQX/SMLE7ET4xofMN5wOgB7VF3bT6eK0LJR?=
 =?us-ascii?Q?sSz3WKGyOrCG+Ki6G0FVTB9rkz5QFwo0NrvqQf1+989TWgidB/ZLjOY6dyru?=
 =?us-ascii?Q?DxjxOUeDv6fPKVM+j27W68lohNzYEg81RaD8GtAN7FDFigXAObqDkxBvwyRr?=
 =?us-ascii?Q?klm4Wm0XUWVvyFE8EXuQB5yrn/4P2CEWSvX1gSdOORZgAtXjHr82xmkIcHdO?=
 =?us-ascii?Q?61TRBQ03w7i5sNilv2nr4YinnRySVjXYUBW0kPEY7ZaIGbhyliyadSp34+B+?=
 =?us-ascii?Q?POGEM146qo2dqjBqEYCZr7NRSFxeYf4zP6iWKyY8zf6I34+LPE56fbnXR5az?=
 =?us-ascii?Q?DPZhBByfYyt+pVBEKn6trh9V2SKXYCdtufI7Rxy6YMEQN9fv6L9NnEu+xUih?=
 =?us-ascii?Q?+0rtKvWaPWRta58b5JdNQzJG/7DXKnbgZqgFzNGoP9T/U+IbsocozVZqHtB8?=
 =?us-ascii?Q?UGqxZcjXIrHX8L94q6lSrvy1ERgMpAPm6JvkZF8sCPCzkpfeeQ+tf0A+s8hz?=
 =?us-ascii?Q?DNDF5Z68Xx0rnSBz8/evDEDxaLaQAKVflidIF815ns98lBqdZsktWuS6tiKd?=
 =?us-ascii?Q?NQ/CTlBckTSZlYBAF+TvCa3tZVjYxKlWyJy7RU/2ZukPL/b+RnMVwVn8Gp0i?=
 =?us-ascii?Q?V8KOn4Oz6Im2kJxCq8TwlrYco2cvwo2O/XQdT+jItl/2PB6Q5vf1TE1W8BQJ?=
 =?us-ascii?Q?CO20XL/rdMeWeVsei82NOu5if6JotVvrYviOGBDLiQG7k4rrvcWLqT0TexFO?=
 =?us-ascii?Q?Q70/NJc2ZjQOiwHk8dcGfZZBVyg867KMqRy6Gt/8gzHIalvnC8k87aGZY/88?=
 =?us-ascii?Q?pvn1xof/j0xWlQf2I4o2r6QTw+9G0FMizBDAhTBGCwaQiHyN4U6cDBNwjcoi?=
 =?us-ascii?Q?lGXsJEGfjKgiJffuuzckk+utfL2eZtlJGSw3UVzAaWE3Vn373QNdV56+5GTe?=
 =?us-ascii?Q?d8u7zskNVt/1o5BI0Hs15RyjGUxnJYkqkeE0mkamnaBwEJvZ+KMfgFHEfqzu?=
 =?us-ascii?Q?TJ6izQszYOQlWF+gzsQgXQnRi8cDMT/3bTDhJ0EIkG6yN0jVKXlxAqfTaYHi?=
 =?us-ascii?Q?X5OCdi6HA/6UsIxwFthvtE1iikT4Tyy8wBShp775AOQ1F30wlaCmRb8MuC/J?=
 =?us-ascii?Q?ItMcUhZtEcpArgeqckxhHfo5UnkLDs2U8/gLT1cqGZPp1DQ0hl4UsB7jb848?=
 =?us-ascii?Q?vUr5OIZ4iKqMjVri4640Alee8AxFrgOLLjb/rzHuTMKm9OI3e4j+KZvBEYFd?=
 =?us-ascii?Q?MUzpKmho+YY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZlIL9nq5Bb5Bq9UV3yPjZMndPw4XOPInSvZOHhshAagcGgUZLt8rFtqCgAbr?=
 =?us-ascii?Q?jSM1wOVkalzmKvs7TVDS48qvRA8vr/CVNyotICG3qAVJ9oXajHOSYLEH9uJ1?=
 =?us-ascii?Q?Uj4qPCnDjvkTGLjU21WYZPXI3ukOl4anaBSTIgZB0yp2+w0PDO/AyhOAvFiM?=
 =?us-ascii?Q?00hI0UmOfOhjgz6zOs59Wi+/sEZ1wCByHgBV3cvg/jnADe57A+hjg53knu90?=
 =?us-ascii?Q?Utd1V0NLbseqfdZiL7HOdqHLV3ZenTibeWI8cbFbHqEltKwwwGC/aUImDGQD?=
 =?us-ascii?Q?3UV47OypDBaUYbJN+2tKkFTNbGxaLjYDvWvECHgMHAGDs43u61G1FkFRKG9p?=
 =?us-ascii?Q?9ImeLBZI0Z1lrkjWp5YG8mbiFHA8o0GJGbsD+/S6CV+3JuxJcscXxO10x99r?=
 =?us-ascii?Q?h0eEg6nB6lW7O41zgRElGsniFS+qnHcUrl84UUjx1TjH5rc2SheKwRi2DFx/?=
 =?us-ascii?Q?Yfl9PQRMY4VLt7u9dc+H83fU4cZsqigLOMA4EREWnDVDzX+okZeJbKLeiBmB?=
 =?us-ascii?Q?u1pd7D4MkQdMjbuegXTt2XwnKYzTjfcNSmC3Ogcgewt8rTDtfTSokqT3kFIZ?=
 =?us-ascii?Q?BtQlXbAcQ8YX8+mfxe7Tdpk7bJbQ5r+MZAn0y6y3pTV+9bnFXwfQHBdlWqxM?=
 =?us-ascii?Q?JdP8a75OBSF9SXUWYTYDJ+ALj8zPy5L3lOvDO/+QDgxaIfvlBS64mgLHuujZ?=
 =?us-ascii?Q?DJY6eKaobK7LLAYWqvWjjnIJ5VDQDyRtzBb3w4aLeNBWgIz0vkUkVJug1Nfr?=
 =?us-ascii?Q?kcGY7xKaK2M8sItnXIBKxSJF4haudiZOHnjuPFkRKpZPMrpv3lHs8Vd0O1gu?=
 =?us-ascii?Q?pJebQmjrB+ptqqTnyCGisdOp2usaiTQvhuDPjviCmX/qyaUJA24CfIsQbifP?=
 =?us-ascii?Q?Ku2cIME1sMy/bEv5Zi0c0Umzq+UJ0V5vAhv58HfjLMnqDHc+y9IlHI3/1rjE?=
 =?us-ascii?Q?bqGc1UwQtwt/00Fr7rfV356KvENZNkHKox73lrCXnl9pA700C13dVMqVZ4DO?=
 =?us-ascii?Q?kuY7Qv6fg2IPcJM0gJWylzUTgdRfXSDAwUv9Ufp7fq0W7Tqhc4Dh6l49B/iU?=
 =?us-ascii?Q?LXIOgM4SSsx8zvzlla/yMErSew/tOVPZzzgMdOEOpPWQR3MPAXO4u7vOwEoZ?=
 =?us-ascii?Q?wGrE3BhaSxFX57M9ZkB5UUA28JzwWdOtpzBoibk5hb7lTjYfA8QxbZJSADFw?=
 =?us-ascii?Q?AoN1u036rYRjeR8R8Wg54x19Gb8r6nqmUhbLTHG+H3Br8X5M29xHfnT2Tn3P?=
 =?us-ascii?Q?3CggENxvNfr8CE2neej8Hu+VCicdnVHp8kPoO3XllBIr+jqHqA6cGI83nK3l?=
 =?us-ascii?Q?DTvQ2AuB87lxXiBTcR4Aam5ke+G07d+wjeUBzoQkN8lpHFqSIzznzJ1e9aU1?=
 =?us-ascii?Q?W6fKxJngX5q17LOgVx5EGl+h6yJ3xNN2P0dVtZ6N+0s2pQr9G9BxUW/n54JX?=
 =?us-ascii?Q?uQjfPjINfAJ81LFoHuFoj8gsCiEDoVZ+omzAkcPxfYg+8y+oIwgod6yH4QnJ?=
 =?us-ascii?Q?Y77OGIHXrG4knApJ72weMoBU+ondEIL9hFMLNwxM9JBwIYFFBCrlLDFjPEek?=
 =?us-ascii?Q?4YX38ZB1Uh/lInlIzXVdqAdkIgbK/2b6ZCzsnvwZ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VNrb+lw2VXgBgFnMeBijQoH6NKjK5bqKCzu3MdvpstBQPy2YiyxGpQu3udUA6HK7Pig69KJnYGdixdBxC7LQRfnBp7PGmA1RIHzz7n/hJ6P/R5wbAEs7rS9HQNtKo7rjmOWYZLKwXu+5AYrDRChv7kLTzOEP5J/WzWH+6hlwDXYLi5KXEDr3BTs/KBWt/DPK3utM/7Z5EwjrIUl73kTSYWp+STlv3ROH9/mS/+c8iLNaT9eeh/Nq6w+GDE5+yyr//cT9jbMMaUOGzkVP1LnVzleJl/VPWSKUDD8ZlllihBtuhmgfogPIJ4IBvtUtpJaHL9m7Go7Nj39/XomNdsUfQMKeh7zZ129UKYb5Yhn1xklj+O9ACiFE/OuG8gELAgrq6+WGLbPHDVJfxkidyh9A8Ts66AK8k1V2UXhiPQe+3tb8kfGSpbYgwRbgT5+NtzGu3uJZ30uRHzUKWzh97x18UfQzJ8YuykANi2s2lHthjgqZQbs4uTlpxzR5MmoeR29R2EgLNhO7hfH+mUvh6hweDRkS85AA5niADM+GvSKjAfYIDZXUwzLFnHU7KS+B8NrVM160qvITeMvxD7XeUqbuVX439YpHHBrYiLxmVIbU6IM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c744c888-ce37-4c6d-47bb-08dd9df59c7e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 14:40:37.5879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 30bpdaP10egac/65gPx1Z/rK4DaTg1r1OqKCDqDVPkNVAmpJ+gNdFytI8hVoLbvCP39VSYop4kAWBPB4bRY9CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFBD8703CAB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_07,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505280127
X-Proofpoint-ORIG-GUID: zW06jEKFsERG900gOv3jB4D1ftCsBeA8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEyNyBTYWx0ZWRfX4XUCjfA/wd4J fPb4dha1cPqMa8tB9IZnSrdqNEWlmfJ3ct07MMhycyU+u+kGTVoRD1mb92RaKH4ngSkNZxrQnWP bSYujZalNAt8KXYb8Ybzf+o61cjwfLHlnKfsJlRDHVH9eAiO5pdnTLsp0ciWY/A7evtdtPwUJn3
 U4uns/95lgXNx0A6kzbXPKmOZOvdX+ZKGUWPMZF/lNh96x8KTkVzepESSFig6s4p2eFnYD0XRl+ AEzP6yJmgonc9r+x5K3ysl8VzbWUwYr4OFrCIPRGf+Pka9yTbZkI6jeAzvfHy0ga83UABM+V0l+ 5UArjeejB18QwTglkndvE/LmULWCH306C2KaIZGNM1YOEYaenQpkb06oyQISqPF78gIbuEaMBww
 ckZQLwtr/VcIKh/5701PDvn6hQgS9TQ6oxq6cMAT6VyzLmnbTaWjK3361MxorHCJZ/JFrGAl
X-Proofpoint-GUID: zW06jEKFsERG900gOv3jB4D1ftCsBeA8
X-Authority-Analysis: v=2.4 cv=TdeWtQQh c=1 sm=1 tr=0 ts=6837206a cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=StxAKNcFnPo4rBptOFAA:9 a=CjuIK1q_8ugA:10

* Lorenzo Stoakes via B4 Relay <devnull+lorenzo.stoakes.oracle.com@kernel.org> [250528 10:16]:
> From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 
> The hugetlb fix introduced in commit ee40c9920ac2 ("mm: fix copy_vma()
> error handling for hugetlb mappings") mistakenly did not provide a stub for
> the VMA userland testing, which results in a compile error when trying to
> build this.
> 
> Provide this stub to resolve the issue.

I need to be more careful in reviews for these things in the future.

LGTM.

Reviewed-by:  Liam R. Howlett <Liam.Howlett@oracle.com>

> 
> ---
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  tools/testing/vma/vma_internal.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tools/testing/vma/vma_internal.h b/tools/testing/vma/vma_internal.h
> index f6e45e62da3a6ee007b7431573f27ef5c2533865..441feb21aa5a92b7edddb07258c7f368171de15b 100644
> --- a/tools/testing/vma/vma_internal.h
> +++ b/tools/testing/vma/vma_internal.h
> @@ -1461,4 +1461,9 @@ static inline int __call_mmap_prepare(struct file *file,
>  	return file->f_op->mmap_prepare(desc);
>  }
>  
> +static inline void fixup_hugetlb_reservations(struct vm_area_struct *vma)
> +{
> +	(void)vma;
> +}
> +
>  #endif	/* __MM_VMA_INTERNAL_H */
> 
> ---
> base-commit: 1637eadc7fdf2fa4069a149b1e836656a3b64150
> change-id: 20250528-fix-vma-test-57b138f28f46
> 
> Best regards,
> -- 
> Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 
> 
