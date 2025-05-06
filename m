Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA0228137A
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 14:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746540279; cv=fail; b=DvuA6hXtGh7wBUdgWz6gTWtlwfiFLnyyYc+eCdk8GDtVXclHTIJLNMn3538X1boMCh+4Ny02RwFUAl55DNlq/95z3vd/b0wu9tLWL4GA9GGiWIydzv1DixVXofJHJgg+DaDj2zLXQKk4r94SsvTWEZ2RrnoAA7xrwiW8Qsu01BA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746540279; c=relaxed/simple;
	bh=ZxfphYvG3ztTIhIexdu/SWPZUoLQDh2/Zu/j/hd8NdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FgWCh9Gm62SlQ3lbSodRu/H6UobZw6FlqYSSibF4PkvwJfS1ErtsCTP/ZsrIXxLK+OJhRrXnfeQHMskNagqrT3HO3p4x3g3C33ulPFqN5ABWGTdndZHRo1B4Yd8rGAjsrM97OLYdso/qdEJg+z5mgkMSrXZ1CqkfDIu1O8HBeoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=T294s29C; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=t1NQNzSe; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="T294s29C";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="t1NQNzSe"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546DWPfJ021617;
	Tue, 6 May 2025 14:03:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=osEGpcXtVX80Qw/ZCG
	098it/1CeMb06i11Hql/FGw28=; b=T294s29CDnhHt2/owfv7WfLbF2MQ6cFwOF
	PAc4DQjzwpiKA5xzudbOFu8J+DXjFOJ6zYWTZP8NEIgh7uZdyYyk5B+rEjsCPK0e
	b8dze6klvszxXK0FnVqjcN0qKrnmfRCAeGjmy7MtnwIz5sVF9VR5OStDsA12zj5N
	pULpYNoQL9C0M/ALtWC8dh/HDKpy3hlRhz0MgaQw0d+MtTOjtNzq3b79+L7ryUC9
	qbJ0WH1qA0piN9TasBZVAMcvBqiZt1cJpSlQrn/MW3W2quW6fHDWdZmPKT82wlYL
	5HqpjaKW21MY9HDbjSUWegu85Vl5raTS/tPmzc+y+2IM6J1vm6nw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46fkcy034k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 May 2025 14:03:53 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 546DQMR6025424;
	Tue, 6 May 2025 14:03:53 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazlp17010006.outbound.protection.outlook.com [40.93.13.6])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46d9kf9xh1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 May 2025 14:03:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WazhIi+nVkclD/C1g7jUu/68TA2Jwu2IgprUoMPBvGXj8+IkmRw/Nhh6021vLipKDRZcta3F/HDVH6oHGp8i6Q/Nyb76L5lslIlrMPRkLrVOMdSh3HhKzBG88NJ+VnHY+17WfDndHo2ScJSiZXeFmSGlao7966cqb38om5qcg5QEVpp1MgntAypxCqGx220A4HksX24o3ORYJG3smVcPEAAgybC6Af/KZgPC32m5ZHa7poA+xxACC4hjiA0znsf5KzRSFm6atbpmfD6cwLAYZIwT0IBV0vt2Jev5jKZ/QxciwItlbzSD6UrIkZXUTFS2NScRHTROnG18GSmi6PxWvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=osEGpcXtVX80Qw/ZCG098it/1CeMb06i11Hql/FGw28=;
 b=dRhbR+7NvwWW9Zc+gOc69NAj1xJm8cBrrQ7zgXkQ1nmO9tvgidf5+X4xSVk4q70RBoaFFo5GGPrW6gZTzchAp+G+BXMA/Qiqwuz+YVaiNvOdwjE22oxBcmYc0d3BUc9YmNJLbSk871pmQz697ECKGIGSFIC4E7cPbFArka0Pri2RCkRHmbr7UvXn0+RWZM4HfOgbcDbxTRawNiSH8fzCUPVLZO6yNewLRcZl+H3sq3kmlxxvMsHi1e+S41WGRtoiE0tDwfyHbhQS5kxTKLRaSYTtVxGzNMChV+fxQse84l8+6bliBOzpKH2P9i8fHl6PJvt510EaOkIGYAW1F5Mhrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=osEGpcXtVX80Qw/ZCG098it/1CeMb06i11Hql/FGw28=;
 b=t1NQNzSe7N4MIGcteXa/cocv2wSWpL4MTqEd0i43riQqVIgGBalVyURTrGn51Y5Emi+GFGo5clJSeiNghg5rMuZwrqOGdmZbvGTtcqPb246euL/kIcwrLDjhRqjdEuoS0P0jYFqAuGXxiAPMU49pZtpZQ4wxObEhJVJb6+vvl5U=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS7PR10MB4959.namprd10.prod.outlook.com (2603:10b6:5:3a0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Tue, 6 May
 2025 14:03:46 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 14:03:46 +0000
Date: Tue, 6 May 2025 15:03:42 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
        jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, david@redhat.com, peterx@redhat.com,
        ryan.roberts@arm.com, mingo@kernel.org, libang.li@antgroup.com,
        maobibo@loongson.cn, zhengqi.arch@bytedance.com, baohua@kernel.org,
        anshuman.khandual@arm.com, willy@infradead.org, ioworker0@gmail.com,
        yang@os.amperecomputing.com
Subject: Re: [PATCH 3/3] mm: Optimize mremap() by PTE batching
Message-ID: <eac79ede-731b-4b00-acaa-eb045ffd0e3f@lucifer.local>
References: <20250506050056.59250-1-dev.jain@arm.com>
 <20250506050056.59250-4-dev.jain@arm.com>
 <7c6e61fa-2437-4c99-b1d3-97af5e2b37a3@lucifer.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c6e61fa-2437-4c99-b1d3-97af5e2b37a3@lucifer.local>
X-ClientProxiedBy: LO4P265CA0219.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS7PR10MB4959:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f3e1d5d-2ad7-49df-4a8f-08dd8ca6d191
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sjjW9jy5ahfSQuD4yJFz6F8AAlSpIvnLdUvZkLIw5POQyGRCT1nwkSyeWNSI?=
 =?us-ascii?Q?urmCJctK6LOJBoTjE8rsN1+RwJ+YhLLiP3CJ8EUd703qPBWPmc7GWGII2Gtr?=
 =?us-ascii?Q?w3uG7xsooASOjdN/TcyGy57E631jn80TVtciY8x8/nj4EUOrX2/aVGATBHt/?=
 =?us-ascii?Q?uJcW5u1tsTi0RBV5o2MZL8/XgFjPRSlYNgIzjpZuRc1W1Wj6snYjUucdCdba?=
 =?us-ascii?Q?b0DWwJJ6nAJzq7L02RahIYFl98ztwFKtvpI/phdGycVmP3ymWLqBqOcLIS6Z?=
 =?us-ascii?Q?aJZmyfOxqMvPqmNFBAonUIY6gv2nzCWUzYnK0Ci1B4NvZXzhl2pTx6lRMglK?=
 =?us-ascii?Q?8KNz3s4mj5FQH1kNTkxKY/waVmjLWsMdyBbePCAcz9nwc0+u/SpPcUcj1QYY?=
 =?us-ascii?Q?SgMoj0e2dmFJf3ohNKoe1+zrn/UczZF9+avu4gaA68JDjJ6aGki2aMl97Ltw?=
 =?us-ascii?Q?gF5jKDIGt9UROAn1CeHW5rA4Qg7JvyWlN1BtHgHbGqjwJyJhNy8dXtAo0yLR?=
 =?us-ascii?Q?k0y93z+n4GPZ6ZshvsPsUCLM9xnx7WDx8tQCu5phenEHAzJL8fR257Nksj2F?=
 =?us-ascii?Q?TvSS2bEWHMWJHjwlwPUqxTJuRcdbOUkbfyoiiW7039dEs3Tg1J1c7KqgA11n?=
 =?us-ascii?Q?9J4EYFS3B7LsrBwkJZ9JfG1sFnoKnwxtI3LMmGlRf3QDNiTA9daWKRt5EXXo?=
 =?us-ascii?Q?uGtQekE3tAEoYMxV926ceasEUeOuURIXAQI5rY/1JO1bu9EQvGLZLVlBvQRY?=
 =?us-ascii?Q?iy3Cvud3tge52VmFNA+gC2myy6Iis40H9wGcFnT32pP+7x28vll5/dgmkOKA?=
 =?us-ascii?Q?DhyIE2fOJnaEzGRWxVNgNFNqBilVBmY1/Go46MJwt3BgiPUbZ2RuXBm9Bb4Y?=
 =?us-ascii?Q?gSouKcnj+h7TtbHN3QbZpPBHCjpt+MVKHtbqTBCZ1rb02rFsb9sDGjSs0SEJ?=
 =?us-ascii?Q?XAp5hPsAOGGOtNQZsW2oiysBQKCBrSHOLpxQbJXEYlULeAiUpNQ+Qn3m0wjp?=
 =?us-ascii?Q?0tw8/AJfQtwd2eVRz4JlgJz4cthGVqFLl3mb5RCFB6PxNRrFCcBL4T/6OB/V?=
 =?us-ascii?Q?0p60/DTIKKLRtPs5Oe6WRYqoX4BbLHvQGXK88YrkZedJOR38m3VaHYvdtGe6?=
 =?us-ascii?Q?BalZ2wRLjKNOZx2i4Kw3J4CWqkSWQw70LHWFbTUmfI4hryoBSEspwqHTTJSc?=
 =?us-ascii?Q?hxGW4RoBlXCmGdlTuUyb9BgKBC0Uu52xXZCT1KiPKn4K5P07Hisfpr4i76kn?=
 =?us-ascii?Q?5ERAe8u+cZEWXayUt6OtsO/zLJ2WBZcIc0vvTyd+u/tmiL+9plxxn0Y+D215?=
 =?us-ascii?Q?B7moda8yrGCl4pHoeHf5hqpadEMpvNn0FIJW6ewwhwqeipSLBVgG52P17Iru?=
 =?us-ascii?Q?RQ3MVn6cOFWypfBFeOxePzNgNt6kuVlQB8tOKFjFOWdPfhUGN4Y/4Mq3FqKK?=
 =?us-ascii?Q?nLWtFOTx27g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QARPIlQWyWXKqt/SNVdsI4b7vNZwCvPk1ISD/ODsSCUYcjtUz8rxqdwI/Pyy?=
 =?us-ascii?Q?BqsqO9SYHbTabk8LgYsF0l2oJCtlKWP8Z31iI/uUBeUvA3Q0BCb9iGA5DvJ/?=
 =?us-ascii?Q?uZAscjhpQGz9zXXCr82mFkFRvuKm9HS2X7CJEPxwW2mjxgtMqAbzD2f9fxeQ?=
 =?us-ascii?Q?rfHqqB9fIvlQfMOUPtGDUxZ+TTArBdALdZmNY4KPok7vTAdLgo7pkZhcxI+7?=
 =?us-ascii?Q?oYKpPytMKU0hiIFTpVaYW6tZfaHlte5kxdnncOWwd5+RJLW2I5WkkoMe5orz?=
 =?us-ascii?Q?A1uQJRRt/dJRNO0AK7lEsCmkmqvNopFFJdHQrkQ9+RB0WHus0oACSkcLhNY2?=
 =?us-ascii?Q?FMXyMu7f2qlAOXbTxz+EBmYso44kLtckI142gu3+3TmUW+b8y6nDT1oa+lT5?=
 =?us-ascii?Q?nWpiW0/bqmhIULednO9YgrMaqVBn5yKHeinADwaCOBDgfRJTL3AjK0GbMLId?=
 =?us-ascii?Q?xQmCKVbW9r+bIB6IBvXKlDaBvjOVcMRs7oXHM3TSEMeRnIQjA8wSBhmhyyLY?=
 =?us-ascii?Q?f0fRqdHD81Fr5XXoUp1C25o5fMSUQH4UAZIIcWvSn6WINSS2Iy82lTnoANpq?=
 =?us-ascii?Q?Tb8qt9Pbox8YRBukfhpl7fZoIuvvOWE6cPmCUzPa2KBtXEIgItxEoGXAn14/?=
 =?us-ascii?Q?X59ah3J61E6tBWTJ/HfrRYTRi1Q3vaLE3YiFFjPzhQIInvqQ6Xy5Gbo9wLqZ?=
 =?us-ascii?Q?66/oblxZ50a/Pns2KTJ5987rRmPqN/DTt3W9Y72vXBnTs3aFQy4FpQlsAlqE?=
 =?us-ascii?Q?CiDM3jFzka5TCScRk/5GsuXASikQein9c6mM9C02nl/uYJ1sb05Ia4j7vJXO?=
 =?us-ascii?Q?ZjL7T13/hzwO/SiP+J/aDIOuMpT2/w4HDlRGMjRVGiiFAGi3op7e+lNVL4dz?=
 =?us-ascii?Q?m914PbtDgH0aGb2YFm8h2WxHXuNvXBSPuSUcK75oaDfYABW42Alrwu747tal?=
 =?us-ascii?Q?utx5QxFStcL0ivlqgZ/KIrKkxbXNl/goCsg1nZaJcecDTMKYwhCaIDIPjlc0?=
 =?us-ascii?Q?J6u3JI19zmzZTAakd4GtHjHlGgJ/TXwfp0nkxKBEbhweYG1r3JapMbm2w3aA?=
 =?us-ascii?Q?/Wl0mUXNPpBIy7A2/utfSW9YnVSoFQwqV4RxjB+wS7UeqCWMJ3m8cmNDDz91?=
 =?us-ascii?Q?fLQFzqMBIeKpPgSXTYCSiXw1FeQ7nDtV+Da6EY7S+A6n8Xx3OkaIss2MX8mb?=
 =?us-ascii?Q?XcuIVk3evpI1eWaairOKSXgfxSZBeW2n7Ah9Wf93jusrF/QIrEoQvrLztIqC?=
 =?us-ascii?Q?6u0quRz7BOlSg2DXBeISqPefv4UgU0onSqtM7vAyYpSGBhxkRQzKV39mzOme?=
 =?us-ascii?Q?4vBdX7+tyii2gUjcB1nA6Aa7yzBmXnxavIWALtJ/iGKUtfYlX9ccY6MPLFhZ?=
 =?us-ascii?Q?BqhMZsuQg9VggyNBxoVHklLAQWTVJxelwY0Fxwk0G5dAzTnrFO6slizWm4cn?=
 =?us-ascii?Q?ZW00FP9/ZgiotrgxsRjQ22SfqqULWYNCZoHDE75dv2PJhk4fMOaM34jpDYSc?=
 =?us-ascii?Q?yV1oeRFNUWK1F8YZyRdjQAi8JId7/ctUZFi7HPM1hoP1UBtmwmNo3Xnsh6v7?=
 =?us-ascii?Q?uc0TRq/oiSAT+slcy4sG5nrb31B1RRktFpg+Smro+ZA7mJgRxtp5I4Zse4Sn?=
 =?us-ascii?Q?Ow=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oUvJ8a1Rlst3fPDPxq3b0Gpf/MBxE0pXH+emUWHG9W8nHSv1tv2VCTTjXSybcFMJHazZYaKvL76FzqiRoDzNWU4RstQBhFN+9sL8saFnDVd4+bSkroperG/L3ng4tdcQEEyqh6Pb3nszJH/VKiOsWahQaCeOMKEWHdqljiFarIRITO/NO4Rd0u8t1HGDj3/pkcglUGYYMX2btDVPTGiOvEYu4V122+v7BVCXas4BB0fZBm9OPndVh7Nme1ersPd4U5urtP79Ml59t29kXVc0y70NdxxalLkuW80tPfr796IV7y+Sa5QsOUM0u4drCZMfKonIiUuioGQjieyUnLHsKlSma3jTgZ6u2nZqLNF71GAr/+Fpw/f82SlM7fjjfGRkAe7ga8l1wNbm01wF4mp82seFR7BE3IgC/u6bTDen9QuS74WeOrfzpLw97tzR2iZz41wsn8ak8RvYSG7F0YdU828qc4ucgYAADrTYrVxiddyNMY2Kun5ssvnnK3Y5gAsfAXSSVtnAaDPLhaVixces4PVYaM0Vd0Wk1no7H35Dovbw6KKNdQ64Da0V71dy/9eR4TXBYm23XizKjpbeSCqXBbMJIza6UI/MHnhNwxDxS5Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f3e1d5d-2ad7-49df-4a8f-08dd8ca6d191
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 14:03:46.5833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fPRurLRbG3L6zq4Uidj2Q/ljPBE/8aaGapffDTznN2qJRvNvvrbQ4Urw+CzLjuR6wTo1F2bcfR5U2HvvZRkQQWc0eg9D/bz5xH4PVgJXog8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4959
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505060136
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDEzNSBTYWx0ZWRfXxzqZyD/tHvrj isO8yB5f62ptl0icvZ0gZ77VEa2UkDiw6EfrYeIaIcSz5B0+GUv83UX58GnLT9ENVs84DCq6Ntu hjIfzyViTGGMF228vLnCaTa4OZm3FT+LxZ0/7sEeIOxdyuwSNhpG5bj2tLTzkpKhqTQRORGKbou
 TtRzHlTftgj68gMm7bEMELCzuAk1kSlJ1YDxEH49X33V66SERxnvHb6hYg9VqaPzZyQWp1QnIWE AE5B8cZPHRvJEp30fEk7d6jtgCZua75EeifakxSNmRden7sMob0oyr/acRqUbZBohL7/32xS4aE Xs7gsJB0ueiDbZrekgl2KJ4aqQzWvIdFQhdobMKJ4sG82E3lEOZGJSsUhTplL2i81Or/FTQWrvN
 VqnCOC9mFq99qIGfO9mMxdStZutLBFgGKYniy2RwXBKVCqUyydzgey1jOrDu6YUT+rLIhKsc
X-Proofpoint-ORIG-GUID: zPWOPdAuxW3nyf32K7bY5ty8wG718-Xm
X-Proofpoint-GUID: zPWOPdAuxW3nyf32K7bY5ty8wG718-Xm
X-Authority-Analysis: v=2.4 cv=eYw9f6EH c=1 sm=1 tr=0 ts=681a16c9 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=7CQSdrXTAAAA:8 a=8QNIM-f7sUFKjrUHFP4A:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 cc=ntf awl=host:13129

On Tue, May 06, 2025 at 02:49:04PM +0100, Lorenzo Stoakes wrote:
> On Tue, May 06, 2025 at 10:30:56AM +0530, Dev Jain wrote:
> > Use folio_pte_batch() to optimize move_ptes(). Use get_and_clear_full_ptes()
> > so as to elide TLBIs on each contig block, which was previously done by
> > ptep_get_and_clear().
>
> No mention of large folios

Sorry didn't finish my sentence here. I suggest you add more detail
here. Again the 'why' and what is this for etc. etc.

Equally I don't think having code that seemingly randomly invokes batched
functions is a good idea, I think the relevant logic should be separated
into functions that explicit reference large folios or should have comments
explaining what you're doing.

You can see some of how I separated out such things for my
MREMAP_RELOCATE_ANON series at [0] for instance.

[0]: https://lore.kernel.org/linux-mm/8ca7c8219a2a0e67e1c5c277d0c0d070052de401.1746305604.git.lorenzo.stoakes@oracle.com/

Thanks!

>
> >
> > Signed-off-by: Dev Jain <dev.jain@arm.com>
> > ---
> >  mm/mremap.c | 24 +++++++++++++++++++-----
> >  1 file changed, 19 insertions(+), 5 deletions(-)
> >
> > diff --git a/mm/mremap.c b/mm/mremap.c
> > index 1a08a7c3b92f..3621c07d8eea 100644
> > --- a/mm/mremap.c
> > +++ b/mm/mremap.c
> > @@ -176,7 +176,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
> >  	struct vm_area_struct *vma = pmc->old;
> >  	bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
> >  	struct mm_struct *mm = vma->vm_mm;
> > -	pte_t *old_ptep, *new_ptep, pte;
> > +	pte_t *old_ptep, *new_ptep, old_pte, pte;
>
> Obviously given previous comment you know what I'm going to say here :) let's
> put old_pte, pte in a new decl.
>
> >  	pmd_t dummy_pmdval;
> >  	spinlock_t *old_ptl, *new_ptl;
> >  	bool force_flush = false;
> > @@ -185,6 +185,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
> >  	unsigned long old_end = old_addr + extent;
> >  	unsigned long len = old_end - old_addr;
> >  	int err = 0;
> > +	int nr;
> >
> >  	/*
> >  	 * When need_rmap_locks is true, we take the i_mmap_rwsem and anon_vma
> > @@ -237,10 +238,14 @@ static int move_ptes(struct pagetable_move_control *pmc,
> >
> >  	for (; old_addr < old_end; old_ptep++, old_addr += PAGE_SIZE,
> >  				   new_ptep++, new_addr += PAGE_SIZE) {
>
> Hm this just seems wrong, even if we're dealing with a large folio we're still
> offsetting by PAGE_SIZE each time and iterating through further sub-pages?
>
> Shouldn't we be doing something like += nr and += PAGE_SIZE * nr?
>
> Then it'd make sense to initialise nr to 1.
>
> Honestly I'd prefer us though to refactor move_ptes() to something like:
>
> 	for (; old_addr < old_end; old_ptep++, old_addr += PAGE_SIZE,
> 				   new_ptep++, new_addr += PAGE_SIZE) {
> 		pte_t old_pte = ptep_get(old_ptep);
>
> 		if (pte_none(old_pte))
> 			continue;
>
> 		move_pte(pmc, vma, old_ptep, old_pte);
> 	}
>
> Declaring this new move_pte() where you can put the rest of the stuff.
>
> I'd much rather we do this than add to the mess as-is.
>
>
>
> > -		if (pte_none(ptep_get(old_ptep)))
> > +		const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> > +		int max_nr = (old_end - old_addr) >> PAGE_SHIFT;
> > +
> > +		nr = 1;
> > +		old_pte = ptep_get(old_ptep);
>
> You can declare this in the for loop, no need for us to contaminate whole
> function scope with it.
>
> Same with 'nr' in this implementation (though I'd rather you changed it up, see
> above).
>
> > +		if (pte_none(old_pte))
> >  			continue;
> >
> > -		pte = ptep_get_and_clear(mm, old_addr, old_ptep);
> >  		/*
> >  		 * If we are remapping a valid PTE, make sure
> >  		 * to flush TLB before we drop the PTL for the
> > @@ -252,8 +257,17 @@ static int move_ptes(struct pagetable_move_control *pmc,
> >  		 * the TLB entry for the old mapping has been
> >  		 * flushed.
> >  		 */
> > -		if (pte_present(pte))
> > +		if (pte_present(old_pte)) {
> > +			if ((max_nr != 1) && maybe_contiguous_pte_pfns(old_ptep, old_pte)) {
> > +				struct folio *folio = vm_normal_folio(vma, old_addr, old_pte);
> > +
> > +				if (folio && folio_test_large(folio))
> > +					nr = folio_pte_batch(folio, old_addr, old_ptep,
> > +					old_pte, max_nr, fpb_flags, NULL, NULL, NULL);
>
> Indentation seems completely broken here? I also hate that we're nesting to this
> degree? Can we please find a way not to?
>
> This function is already a bit of a clogged mess, I'd rather we clean up then
> add to it.
>
> (See above again :)
>
>
> > +			}
> >  			force_flush = true;
> > +		}
> > +		pte = get_and_clear_full_ptes(mm, old_addr, old_ptep, nr, 0);
> >  		pte = move_pte(pte, old_addr, new_addr);
> >  		pte = move_soft_dirty_pte(pte);
> >
> > @@ -266,7 +280,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
> >  				else if (is_swap_pte(pte))
> >  					pte = pte_swp_clear_uffd_wp(pte);
> >  			}
> > -			set_pte_at(mm, new_addr, new_ptep, pte);
> > +			set_ptes(mm, new_addr, new_ptep, pte, nr);
> >  		}
> >  	}
> >
> > --
> > 2.30.2
> >
>
> Cheers, Lorenzo
