Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48FC1AAC4
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 16:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738339520; cv=fail; b=POK51OKkssn4G+UkR1+pxd73vXU9wYWSeZ0OYgaP++P8LHjmIjcbCtGdvCiTiSSXV7L5bHE4IN2JvWQWuF9+csYX5XCAAplU5QW3mt1GZaGWszJF4SlaNRtaEGDg1Hx8+Z459Oo1pVqTCbLXIa2vaZsKMLrwuPtjO0QJMb9q/uM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738339520; c=relaxed/simple;
	bh=ft7Do9EEZutPpSqqqsaeKpiPMKcnWsdyONuSxBDIUD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CeZ/pa27xp6Hcx8PBZQjq7c1mq/S5Xt5dxpcaCEW4m/CQ2I1seDy4aPq9PNoGIQS02whIfiMX7wBga6o2186VrAJPLfgrEk7Gb7wn+qoSJDNSCqqU5Zx5Jr5i0qROGujG0OLTLqb3O7T2EscqVlkZI7Xv39ucJb4IOTZRaJaVZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PFC3CYvc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nLlQYlJD; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PFC3CYvc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nLlQYlJD"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VFvE1N020699;
	Fri, 31 Jan 2025 16:04:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=NIs/odvOdbryOC67GI
	eplLSP67Gaq5IiK9OHmxvdHNs=; b=PFC3CYvccDQjQz8aABz8PJMVtHoegVSqng
	PAxkbvBX9AAVOd0UAYczNVEwgw+pT+NwqBxBr4pYE/gvSu5jn/kMk4YnKLkC0e5i
	/Mfa1DQL5WKAsDDruoiXIXSfAKL/fe8YEiqhhnfPq7SAx8w1WSvykOd+NIikXKPx
	L+oJwUXWSVSU9vLUrmnkFpDj84ho1AExk2cTZavfV0jVFyC2nrS/GGpkbreVx1qp
	qzho1vXgMQBN+SuoevFiRtwg4Vavy3c0U+th7kSmswQdV4O0VN+T4jcfzwuaGQZA
	gA4VMTE+lKlqg8o0otWXcI32YZAqjmnHbw39igczvO/x2FCaNcXg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44h1kx00mp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 16:04:57 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50VEvmrX022605;
	Fri, 31 Jan 2025 16:04:56 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44gf93b6hy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 16:04:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ocP7kEqHKo4K1nNsuC60t/elx98wGaBVJ5KC1gt+/2EP4rxxF9BTvQbj6LfF4HSWSm9AB4OwtCszEpy5N5UA1Akjw20MFi0n7ANYBhai6buSNfLmEKOmEe/3/VaXZyb6PhE89Q4MtB7RVgYp/A3d+RyJM0bEFdGcZaFFrDU4gW7M7q2pefL3XwUdTD8jm37u5PWcy12gmKC374mwTTwxVLRksWJ++ZsrUdWfPtQpdi6yGeWDfMS1Ej6s+db8BBme+xVMJGyRXSrLZ2SH/qcNGI8S2tRNLQqXtwauM9S/KiT1HlNMeiH0cd9kfKPU4/sThSNMDbJgICapbBUHxB1jjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIs/odvOdbryOC67GIeplLSP67Gaq5IiK9OHmxvdHNs=;
 b=imZlnd8UlTeNJWwT6G2eMIaJ2UwhwkC36Vg2v6GN0dToJB1YjcqBc+lq2WFMQRKm0M8IhyBJE7ApBCRMBih6e+yfHpk6BISL6/EUqw72IkkVZSdZxHHbAxKro9TyFptRxyvcFr72FhvLtyvXOMupfU9LY6y3s5OBFlC/BcZKP7d8n4o9i1EK7YrwFOfLrgoVUvMk+uZyLpoB3hASsEo6kFfC0bKydz2JDC+czhRFnjNTKpkTp0beGTm/rNJtrpbzvQGvR2o1nEeqscrvYNgd0BI97W13k1LeQ4ON+m8TOw0bP+zYy6epAP3StO/tZi6zzxcOW26Wc4xSEc9x7sPm5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIs/odvOdbryOC67GIeplLSP67Gaq5IiK9OHmxvdHNs=;
 b=nLlQYlJD+TBCfz1lbGnoGrxflFMwa68qr1X0jZLCC4znukbla4DpHTQlXgnGKh12A2IlTCE8NrdE/ga7dpXbautivF2Ki5CeWpEwRYPPOjoyBrw0WiuDBjAxneaoYcN+mOUYVIS6Dva/pKBnggUwvhd9pY27aGMSSaG48AWJXgk=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by IA3PR10MB7995.namprd10.prod.outlook.com (2603:10b6:208:50d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Fri, 31 Jan
 2025 16:04:54 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%4]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 16:04:54 +0000
Date: Fri, 31 Jan 2025 11:04:51 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [RFC PATCH v2 0/4] mm/madvise: remove redundant mmap_lock
 operations from process_madvise()
Message-ID: <yp26taqjxput2k5w6jekhnexbp2isqdksckrv2jjxomxswjh6g@f57mxzd62fyt>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	SeongJae Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
References: <20250117013058.1843-1-sj@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117013058.1843-1-sj@kernel.org>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0161.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ac::11) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|IA3PR10MB7995:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bb7a4ab-d362-4955-37c5-08dd4211002c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fnu3ieNyOaB8g2uxrpImhsK1a+P2ysTYk2SHNTb3mP+rcaciMQCHZtrlIzjA?=
 =?us-ascii?Q?bNAEF2nO9Oilk4X1xuNNUX0q0zYFwiA5nm5fQnAIyrP0Xw6SwV0fe4HRigRP?=
 =?us-ascii?Q?cd3ev0oMCWVqVln45Rzupt26wlhhAZty2hgKXpx6U2JbjTLS8p7jD8esYD0y?=
 =?us-ascii?Q?ySK6VN0vtCt0u/jmtM2vb4HGYZxrGCEVETo/qGOjCxH79Of+VG9BOTUrpnRw?=
 =?us-ascii?Q?10vwkdwH1bElJu0UlZFUYugpjTD7aYIwJr+u93HCtqW32I6zGfSRhi02KAbT?=
 =?us-ascii?Q?FEHIi/JTbHAd0JX4tJe0AiU6jnX3T5LTYCK4NwybYHLR7rzFxiGfW7MLmnMx?=
 =?us-ascii?Q?sEi5f+63X0xexEyYQ8Dq7ektW2eoPvXFdJTwmj8vqbIrKcS9gdBw63R7eobP?=
 =?us-ascii?Q?RMmsj1tWOW95M1AvE86rO8WNtlBEoKkxqEQINEGKBpxz6ZAkfHB+Q+aotYUK?=
 =?us-ascii?Q?6NTrJNooXQ4bWxwjW1A2oEOKq7sjnc4HBJq47idAB9g6sWSfcRACaJU2r68k?=
 =?us-ascii?Q?1ErqKRgN/QqaDgjX9WUCxtK+XgaTNxaGQQ1B1D+vbGGRq9ALrul6kiGiWthQ?=
 =?us-ascii?Q?HweZdBK4DGGVARZWrmVRXrqyFu+i4XrSgWtxyBe0eVv3P3PrRq6tcEOeBKRw?=
 =?us-ascii?Q?LPx18/AzJZKg1Xqxep0z3SbOFQx5037APn7jhFcgEfAFpqzyZU4L3CNWeaUW?=
 =?us-ascii?Q?0vqZjiNv/nHG3xaPWGXYe36jz9CTA1fAdugsEzeKR+06335cXW10NJ8kN9z4?=
 =?us-ascii?Q?Cn3MRPbMffMV1PCERcMGLSPitRjHlo8ZTvG60tdT92IZP4i4qAXvrmQL+l9y?=
 =?us-ascii?Q?WcVTxS+9MOfhzl5WDMi6/c+ejok30wt+kOGrnJC+2OixdwPR7VMl22KguXjk?=
 =?us-ascii?Q?IlYsd6A1D/kllP28Zs0Q5iD6YXTX/2cThyaaas0KJ5RbpMbn1ZFyHkQAIGBe?=
 =?us-ascii?Q?8yLVn6e4Ss2BbnNj14r6XLLdsqS1di74jR9JRdDPXgk4rCMYsnhQRU1fJOmI?=
 =?us-ascii?Q?uNXnH6B5T4/BwHd0DF3GS5QzOeIezrpKyylGBqh+k5ob5qvhz4Pcn8npeqT7?=
 =?us-ascii?Q?34f6++wKxYHUWgpcCI4vLgy5upcAcO0wWZBgKcq1a/R7S2MqnvR91SE5bYIU?=
 =?us-ascii?Q?zovs/gHTS0aDC5zrg44yQI3FGECHuSulNSqDGYA91zqjdK/GlqJmsEOaHYMS?=
 =?us-ascii?Q?BniTyH8CVZzjG5DcBREKSvAkZvzmag3jSel9gCPNpl+oMXlIY10bzVS2AaCn?=
 =?us-ascii?Q?Eodi60F6Sbsh1TIIkz1UCtZaDyBAQxzBXpZ163T8lG80gg5bSCOPwTxFc/4E?=
 =?us-ascii?Q?wS45DkHRu0hE8aBWXSnPU3ytCqGlzYZrCSizvUuUwA0/Ayf/fExzq23zMovR?=
 =?us-ascii?Q?2yCpw7xS5qUHSfmRfJtRzRcrYhf6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qIlT+prxkGGzUHjeqB0/tzPeAP587zBKIBI00irqUypRq82971OIfnwWSW20?=
 =?us-ascii?Q?vRBtPUL+SYz95IZv9NZjXmrPjt4IzOY7humPWwkV7Tyb18/Rt4uJVrXRwlcC?=
 =?us-ascii?Q?Sq5g40sapYnSmNaVV56r7cTIH4ytDdgx7rJbyPyKR5Y8INl/s2VhLyjdWYYe?=
 =?us-ascii?Q?gVSpSoorQC+sf2doEe/Qk08USEZnzRSAKiofImuRlO7z+ZBeTfAa7vLvJpdh?=
 =?us-ascii?Q?Br4tS9vMU7v0Wz5oDjZktzaNCDp2fqmBYJCXi40+PafTKhI+49kV//Ep5o8o?=
 =?us-ascii?Q?dMkGk7eoTsvGxDRcmoACLTWwUY/+1KIMORoT53f49sKmJCMdnV72pyQulwBu?=
 =?us-ascii?Q?zEE4PmwgG+fxBb29ERI2vGcJ7znoMmEQOa0y8NwMfVBtbInRGHUMb38odzJh?=
 =?us-ascii?Q?tq7FYUYOjjvnWQdUaWdmNJKBA+8TBSHRSuacrjtZPYbhsrYbnHKOFax1s9h6?=
 =?us-ascii?Q?OzGbK9n+xf4a9DV9BJBNDWla9iP1dUsgwN5VzOQp+Qi0ZnzFRiCHBNe1KVMD?=
 =?us-ascii?Q?q3vmAK/R8aoCQDL/hKhpYoQ24lgJI/pqlGR44152sfITabmOLinQgjOguqq/?=
 =?us-ascii?Q?iR8g0UdXq7aVskz+/+77iWDqYn9Iry41DYjxIdYLA1lt1NWynoExJ51HDmvg?=
 =?us-ascii?Q?sBSmMy1fnLRqr9RiUyikwQsbPFhPBQo0bTJTgGv1ePd5LHYniwLMfuhnw9HG?=
 =?us-ascii?Q?yswq0nCMVJlqn8vGujniMewwIXC8JHjPUvF6UKyEhORHHzdNp3G5kBfOURgn?=
 =?us-ascii?Q?RIIZJYXRyMSXVwEUnuwZ20/j8iMQy5GaG/meFpU9dhY/mcC0REAJe5uuWrza?=
 =?us-ascii?Q?TaqbvoquFrmtieg2gEiYeNxv/U2jEBxQzrym0tOnkj8HFOaSrfu1/olKPole?=
 =?us-ascii?Q?ljAfdp4v2qouwCtpnowRoE/uz0SAQAP9++tQVxV6Nx77OLVGFlrsmzWHZXm4?=
 =?us-ascii?Q?HmK1exvvd1KvpQDOutrSDWc4JW59UXbs3xgLwHLw05s875qYXJ7jUJHtvRKd?=
 =?us-ascii?Q?5teItwadeiPFUOeV2zd4X0oHUtrwJ1epTdIc7LJ+t3qGUccEwI79foiEQSMw?=
 =?us-ascii?Q?51TvdONovV4rUJQlaTCvsFii6f4/CWH+2z0YrcXIjAOLroh1oaOSZTgNbhHD?=
 =?us-ascii?Q?FFG5QB/IUhn5+/twxym3QGaUFXu8bua1SeLsIse6qIQUTEvNS4nbkAy+K0LY?=
 =?us-ascii?Q?zFfYxFK0hKQB7COSQWzpMHdx4m9Pk0PeEz6W92EFuNtNq67wVE4Kz0bB7uuE?=
 =?us-ascii?Q?lAvfb0ZC1RgrqA1d2hb/KFCPCEgWRepczCQPUVtlGljO+zjoiq6fTjRXg16a?=
 =?us-ascii?Q?8FJfngFcKjHre+aSBGN9c6RqE8B0z7PlmM2CUTtv1COaOuCSAtzAfatb5wLB?=
 =?us-ascii?Q?m/F0baJSRiG/qz9WLV2wxF9/o1AwE1nJACY3ELfxCus2Zu2H02huhIeHD+Pm?=
 =?us-ascii?Q?vvxrio+ETXt34lFhr/aMOS6VprTSyjHgiFSJWG2bMjv+D6LVP9/OTlHxAjOJ?=
 =?us-ascii?Q?P6SOaQgaVoAUEjUH1Me4zVe/vJEW9P43mx9EtBJVaKvSs1+/m58z2O6xlTQs?=
 =?us-ascii?Q?Hnf82sXF9RQueQ83S9HMMVBtN75cJ6YAHuV8ow5q?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uZvTw6jZ5NHCcPfHql+bwifA7MnBXaSQBapSSxioyod+a4C+4Ym5VwNpVZ9pkl1JnqRAy108rS3eM5sEV3X58nwznWCEf2pQEeUz22vBY4z6UKarTqfQmQdqW3NjJSS7vHX1OgHc6zTl7GJ0yweq+c+umGqdzX9BPsq9TBjtmMd6hXVBs8aNG75sB9XaR1WSRSx3B1HW57BR+Mtw46tATSMgpz0NzDpBQz4kWzxES4/1mOSoi8o1ogIp9R64mPq/anOi1pTAh5KN7pc1CFwO3t6YzJA0IAXFhjl+r6FY+kWGw/0x3qskyyC4weqgh+gcfg0aDe4BxuAj+Md5B3BUyHfIJbPA4cg6onAQ837d7PIBiU0h37ojK+f2qdLkAYSVomYEjPVV76xaiHlbwN9V4tORLH+u4i6jWIix4Dn6vLPQPqJ22GJdCBXu2TgpWjUSBggxfYIzTZMWbaQry9ey4PVqBW9ihSRTKi/I4lCAMBZZ82DVd22KUTCN8Pb+EyAYtf2fpgn7tJkHMCIRMpD7E50zC/bldjWudxiyIIuu62/H9y72QqYT+9Hm6LNoFj8agARnsBon8geOs7prpOVHYWw3yE+wqTyJorLgRFy4CsA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bb7a4ab-d362-4955-37c5-08dd4211002c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 16:04:54.2947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M1dyWSWPNMPT+5NMuWHqJLofblPrISPNHOjVwoQfve5Q5PBJkOwUQ+hvXV7ZlXewm2PsdRXkFCup5KtX3NnlfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB7995
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_05,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=786 bulkscore=0
 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2501310123
X-Proofpoint-GUID: 7-98epRuuzvxJUd6KezoWIm1ah1iKeZX
X-Proofpoint-ORIG-GUID: 7-98epRuuzvxJUd6KezoWIm1ah1iKeZX

* SeongJae Park <sj@kernel.org> [250116 20:31]:
> process_madvise() calls do_madvise() for each address range.  Then, each
> do_madvise() invocation holds and releases same mmap_lock.  Optimize the
> redundant lock operations by splitting do_madvise() internal logics
> including the mmap_lock operations, and calling the small logics
> directly from process_madvise() in a sequence that removes the redundant
> locking.
> 
> Changes from RFC v1 (20250111004618.1566-1-sj@kernel.org)
> - Split out do_madvise() and use those from vector_madvise(), instead of
>   adding a flag to do_madvise() (Liam R. Howlett)

I was waiting for a non-RFC to re-examine the series.  It looks like a
good clean up.

Do you think you'll send out a non-RFC version soon?

> 
> SeongJae Park (4):
>   mm/madvise: split out mmap locking operations for madvise()
>   mm/madvise: split out madvise input validity check
>   mm/madvise: split out madvise() behavior execution
>   mm/madvise: remove redundant mmap_lock operations from
>     process_madvise()
> 
>  mm/madvise.c | 150 +++++++++++++++++++++++++++++++++++----------------
>  1 file changed, 103 insertions(+), 47 deletions(-)
> 
> 
> base-commit: b43ba6938d01ad4487028592109d4116a28b7afa
> -- 
> 2.39.5
