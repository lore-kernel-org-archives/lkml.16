Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A6B27B4FD
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 15:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748360048; cv=fail; b=HvK0rY7DYr0xYDTWBeisH/qg53lAZ0u6cVkqdz9/+FfjfGN5FBo5NP45xECRpuEXzLEdrLbE+cWbu2zuHJEtJhX4+0S0ZH6bwcIoI21lTZnivMTR9MGPOVvZcU4q4PCUAnqb+u+9STQGwvWToCmLJnjXxoe5qsDTCXyFzKDBvU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748360048; c=relaxed/simple;
	bh=b6AJJ593jm96trde7sXT7DqdKnYVpgE7LfXuBEPvHxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ro2XOBtR0Acex23RTlYW2k++80nuRhSKFI6d1QF5XN0ru6XvCvfGDsn+Fq82ZTne7mvA2FVZqDRIZFbmhDDaBl4EQqdb453h/HiofgXWviU9koaqIDAeD1jR104bsP0gZ/EyhJ+iyaWt+ZAiEsYl7wPUARAFNajWcE79G6E1kxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nHIos2Q3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JotBliAM; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nHIos2Q3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JotBliAM"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RCjhS6017469;
	Tue, 27 May 2025 15:33:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=MuJd5Az8tLxUE1YZ2Z
	iEMu1fOxlxAyn9sL8weBARum4=; b=nHIos2Q3mFsXnsd6FCLmPb0jT7Hw3LGdeD
	UPAUZKuUvSy6A1uBYmeavZRPtQSDfbHgUs5ntBlnNO+RCjSb9oD9qIDh8ec0eaqO
	3sRpSxTbMIasaXYCm1sfowjTtEYmJB5OtLiJcA3UPJi0ZIJtRBF/sv8hiIEzGTB0
	XUuDyTzBFl0oAukyWbQU7XPpgZBegs0n1BPWCsXamZNhlZe86BR5lNC6qWdrgroP
	otw38UCMlnXf+FLtjwC3DYwcOx8JSE66r642dA1Fjk6xFifrH5AMI6xhbg6EzHy7
	9GTSdBWB7J8BMGcrh0ODnmBDzDJDfYF6Vrl6ENXeStSvJr2ckXig==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v33mug89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 15:33:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54RF7Qvu021220;
	Tue, 27 May 2025 15:33:36 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2060.outbound.protection.outlook.com [40.107.100.60])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46u4jfhgyj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 15:33:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kuHpQTcQcHWDZ8DYJ8+Ls0fUpJ++KVXQagTkQZqFw/ruydOYWGLTIkogbla4IppXuATZZPzMYjd0Uo5shQDVG+PipeSxSbsqWAOSXwHX/j/QuMEihuuhdRVz9uFJr+ASif4iDiJko6p/MWWAeEcaGGGAkjVjh3QlBmWDWe8S5t5W45ipwoGH8BdnWAFEgq2T18ByIVf47JTLZMaDxQuZYtM9Qr4yLq13mL42THhsQOAhFAxhAg0PKoksh6H7BG5Nk4D3V3RwOvnP1GNRmUQvdeoAAcyKzLLH2qbZSuIUKmkQkvv+vgoErevqzygUVxCc34OQTEAt+a7B+uiLfT+eVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MuJd5Az8tLxUE1YZ2ZiEMu1fOxlxAyn9sL8weBARum4=;
 b=h629gRJAHPNZTmqzIb2AMJbG692A1Tw2AlIUV+TlENnv1KnRHpxTbgBp59r4r4gnnNDSCMVdZNQYpeeamY0xwCynJHE0q+YNAHrdHgIBR0EU/Y06YSDL7A4BsnWOx+p24HW/YS2iwq7ogav0TMDL8nk7NtW9FrkfPTkVEKU9yYNCpwpAcIsX3YCO8tko7va0WkmiSQ3Sgtw7tHqT44lCK6pCBMqWegiZPzvgpssODpUSlZvuzGaekrE0dLqldWtIoJCsgMid4eIQ0qN8IlpOWZu8MXhcoQ1Kqvzencrl2sNSijOTyJ/+hO5IF4ipseDZhcsy4MnhZGep560idcoh8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MuJd5Az8tLxUE1YZ2ZiEMu1fOxlxAyn9sL8weBARum4=;
 b=JotBliAM1KHayyK2oqkGXD7G5rOvy+jmUoCp1xnXLs6UHg6YRbBmBtvyv9SqdngKYGaXsyWXX6gT9y7OKLUhwjErM0fNBRj1/J88zy9oOCNhI+oi+6Hh+3BYD66GG0jRM9Fd94GvNoNWBLQJ2Oi6c2SImAguOeKxYr3JgMA7RTY=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA0PR10MB7371.namprd10.prod.outlook.com (2603:10b6:208:40b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Tue, 27 May
 2025 15:33:34 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Tue, 27 May 2025
 15:33:34 +0000
Date: Tue, 27 May 2025 16:33:32 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Pu Lehui <pulehui@huaweicloud.com>, mhiramat@kernel.org,
        peterz@infradead.org, akpm@linux-foundation.org,
        Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
        pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        pulehui@huawei.com
Subject: Re: [RFC PATCH v2 1/2] mm/mremap: Fix uprobe anon page be
 overwritten when expanding vma during mremap
Message-ID: <b16e6120-9f02-4a3a-8f85-394ea55bf516@lucifer.local>
References: <20250527132351.2050820-1-pulehui@huaweicloud.com>
 <20250527132351.2050820-2-pulehui@huaweicloud.com>
 <20250527153007.GD8333@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527153007.GD8333@redhat.com>
X-ClientProxiedBy: LO2P265CA0477.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::33) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA0PR10MB7371:EE_
X-MS-Office365-Filtering-Correlation-Id: 8df132fd-bc3e-4b01-3b7b-08dd9d33d770
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wO8rllExAxRtZm45/X6RZC31KKAlDID4B8bQgH5ckeu60RSZP0aCqheU+X14?=
 =?us-ascii?Q?Jz6NW2zIGhRfIoEnKja2Dfe1qkR7lhEQYVA/KVuEydb6BFYBj5R3G35mxeOi?=
 =?us-ascii?Q?Ixy2QbgveRtec9SZxsq+RVNBHuOB6/1aT/TwEI818hSPVQQtmAu1S4NoPW13?=
 =?us-ascii?Q?HYq0Sl/0Jeeu2TsrM1NjgGnD4c8NNiIapGVwES2rgWzC9dVnNFGCC8LaZQDt?=
 =?us-ascii?Q?XgsbtNGFQyR/A5y4BORpuq4EB6j0b995OZ+nc+0OiAfz7Wc1JIg21lX/tDAt?=
 =?us-ascii?Q?ovyKxsS8icbCqLHYfXCPAePvqa6WvKwa74d0cAP8p5G0MELKat6VZ6kOYBpn?=
 =?us-ascii?Q?ljfuQaU+z5Ump1Huuai6B5fEywHLKHOgDTtWIaGGoCq0CxCmNvVvERPulhio?=
 =?us-ascii?Q?XYWXbAmhJ64epkvWU1wWBkskAf82x6FwmaAFIccwGRzm8P2Hx7uUjRiXmFnT?=
 =?us-ascii?Q?ttS6pQbZsey8ICkjqOGBLsfS3Gg7vNO+BWwTBdk/WQ0vUhphlbfiNzHq5fzQ?=
 =?us-ascii?Q?48ZNAA0+5a0k+zq2A8b7UumYCfc0sppk0cTehUVwl9y6+oIaIoAH7Fi/6Dim?=
 =?us-ascii?Q?WhakVpA7FKLq9+OHgm7SCr5Q2GTGxD9UeW5NT1Z2Vnyok6Z3CKVPXmjJ2vxP?=
 =?us-ascii?Q?bVTFYN5no0iMaMNLIvY57iFjI5csTz1y7mbjWocNwhOK4CLVWe3waEXoNWPi?=
 =?us-ascii?Q?4Wi545P5Yn5165Uk0/tppIAN8LBvzCHk8AvYXjPFQe5jgfptkjeMS0sG3b62?=
 =?us-ascii?Q?CUcqfQNPGfDhOYiZ253GtLZGLEzlUzdT9WqBzJXED/Ih3D1jnlvICCb7zZJK?=
 =?us-ascii?Q?CAr9qADSoc/7An90thSiXNcLIO/HQxY/Pv3hOIrZNEZow136j0Uqh18sERfK?=
 =?us-ascii?Q?1SazpJhzvK5gaWLOyW9q8vWsHq9VPN72fnkxAIkobVpz6mhY/utuKFqrjovb?=
 =?us-ascii?Q?mRR2UQWNuzZvoAVp0HeQTM1/ANaBjtqxkAWGlSD9RfGq/GTLfdBidC4nESSm?=
 =?us-ascii?Q?6siqbI347JgHrVyZk8R7YFnLoPYzzW9l/IUHs4crzvxyp69YBLchYaBknlRU?=
 =?us-ascii?Q?6dTwOTCiMaU1wBPbRzIEM1rSx0Vk+BdxzFHQKNlg1NiY7bAd1RFnGm6/KMsg?=
 =?us-ascii?Q?dhGBk78oX4TCLQQO0X7kpMNJnngW3sYCT0Ew4Zbv5xJa9XDYojEnpQ8uWjVI?=
 =?us-ascii?Q?frNqcqQwUq2lYbogcWFnyOuQZ5roeNI9Vmebn7bV4vARtKa/lZFMARM/1KOw?=
 =?us-ascii?Q?Mk0/C+2+wxf7roZj4GinP5aNJn3+NL37XbZ5fbXYPqBwlPxiPRFT7IEIJPhQ?=
 =?us-ascii?Q?eluvI2L/u1fg8cd9wIcByhsZJTsSixdd8roB/vWVLeIyHPmVRxoPN0g21Jy3?=
 =?us-ascii?Q?E1qJyaGWMvq1+jkEvc1rGAmcgUsFIYNIuiHLcRfzFcTiI3RTCc2boshseuA4?=
 =?us-ascii?Q?+LwovIoDj5c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KY8haU7Iwq2YV0XgEjwDy+dLYvbl8t3iHvby5MgM9CxHVKu6T86ypugpBit0?=
 =?us-ascii?Q?bxItU7GbHTTIUJFGUveYvUWPGLfvkAL/wVCkD/I1X2TVLtupxEx2Y7WW6OMy?=
 =?us-ascii?Q?pXf06Hn0Zq6cv5Z4k6YKjn5IMYcmM9I2rK6iV9GimJErgFnGaLeoe9619OrG?=
 =?us-ascii?Q?/xmVGFdGO83U31BNZA5wz7YagN8R8HDqLMhhMWooiE96AGlZUuqsQe8Wxr5P?=
 =?us-ascii?Q?qlmexKqQkY6ovI5ZxNEptLzBoYOHIppPgLR64pptRzI+HSa+SkAer9eNz6Tz?=
 =?us-ascii?Q?nD3j2MgPTdNS38S6m0JddOaAiE+gqyjxBy0CkyrkUwjYLWs+ZYtiFcURWG7Z?=
 =?us-ascii?Q?+M2krNyQU2mTjowyKn8MC3/IPLhy8HYys7BzjB3YPOPMcHepWVOhJrt+AVwD?=
 =?us-ascii?Q?56hhDk7Hc/iPOZjuJGLPoYlOKx5BppBpW87x2p7tdnRy1PpShPpTzxBGbu7Z?=
 =?us-ascii?Q?yCto0xAJ/G1jJVEP3ow6bKUmbxMfJ/d3ttGjYP/NQ6jzNkC7JAq9P+rStQvp?=
 =?us-ascii?Q?P5IjBKFSRTsyOm16Mtcfb4zDAbGnzzzpjdUTtr7l1+z+QXcHU3HO0f538xS8?=
 =?us-ascii?Q?R/Tb5H3VN6c5w4aaCTJ1fwU09v0u2idq7BmPnGDPD+r7OM+9STFJTsy+TWjL?=
 =?us-ascii?Q?L8nDe9Zlp402gJ7bDOpafH1+yLuVqJfJBLO3DkScccJpS2gGz3aMr2M680Yd?=
 =?us-ascii?Q?0vyKTVtDVNJ4N8AzmuitI7Wbsh/mRRoUGOzrNGC2kXJU6PzzN/RZcdi/nI9f?=
 =?us-ascii?Q?8xip1K9wToJjMqbgD+m4ExK1pOsfTbz/x1c7DSwxU+Z7j+kLdGVXB4SVLaMG?=
 =?us-ascii?Q?j/Qe1Oo6SRcAySZw6sqwLYU+aRLdjd5TeVmHWWxMM3h9nLbn+Sh3QKAiyRRw?=
 =?us-ascii?Q?yrwH7lYby5sCE7dVao2dtG0Bvq70CBbePGaJpdM/2UzP7kDkKm6F+AXJ/2Ub?=
 =?us-ascii?Q?iOpzaEP9arYHMh799Tz+90FMShhraN3aNjEzZrS22x+8/fhIwUX/xTiEs8FI?=
 =?us-ascii?Q?KNGY1tWk43+ehfkIfleqCCkiP6MIz/dnN/e16dbqrXC/CAqzkFfnwTT5e5TX?=
 =?us-ascii?Q?Ttmmy9r4uJRGtttU5KDRi1bJeLgblIV49KX+rZeeXzyDB4E94VHaI1b7JbsB?=
 =?us-ascii?Q?Ern4fdasVroDgpm5KdSzSpXyY3VdClxoiIEdppRWS8Qjk4iJMxnmDTD/qOBC?=
 =?us-ascii?Q?/SRX54g2kubMYcATECtCb64HpzKiNIyyRB+laGptcjsfDhfASzlC4eECJ1Qs?=
 =?us-ascii?Q?qu23gwBJ6FZh5uyNRLIgA5NONRPR0hvJ+SCPMtUsIkVYBdXKD8CUUQcOCKzb?=
 =?us-ascii?Q?MX/hqhezI5DokUIh0p4HJhDbdSJNzhwL/j88HK7qGt0mD4ngKeTT8FwURUPE?=
 =?us-ascii?Q?Wheaw5l1KG/syTYSnpKdis7/FuLeykJfOqA5I0iiKwGZi8ict40ajKUebxyr?=
 =?us-ascii?Q?gmf+vWXCmZE0A4WvevF8sIa/1xG9ff1jONIxIZW24tXWMSH3NaWDL6WWYZ+y?=
 =?us-ascii?Q?y9B4zC5pN0dyLFNdnCvCWiw74hf9em4UeslAUO0QC8yOR6mqflvW8tsJFcOV?=
 =?us-ascii?Q?RBOdLP9Bx6oWXO3/1qe4rOQ2n2+qz7e/6Rt/WV/BcLERO8BU/hhh5g+BMFSc?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Rk/lTWZnbZgYfuwMgfA6TcdVJuEos5BLiXwBIknVUjak1NjH7Y78kZvox7UMQf40Lx95F1dK92d11MRMfUVfatgI5bOcOOhBLFg/zpLJFmk36C9kG+u7hATlesOVPyFfh6QTVTvSKDpac54+yzV56pgc2aE/uyV5W+4emFvbPqpNxBwaPq5NNCTruZ1+fhQQ+/1hRIxexPfipo433BTwGO1S/RTHNoB3DwNFo/KmQRkLEMbQoTq5TxMVlJL7GmDfLGQO5h4XJRsZMkzBoXFKx+pLYWHqZJaL6fcfYvLrEXPoGLgCl+t6FmkIiHkAQh9ykdkBg7CqrMnKIGNnOk+foqnWViDKa0cH1hwvCmoziL406XgH+OFmTLrJk7gFKKTNw/v1MCXIEueirHMIx98+xpeWuHDx+s0CjDO7+Ca0Sam0j84S2Ol5TYTBtw76ofGSE/gAbgdV1fmwzlEbXOxOy2NcnnsJM8hQYxsEHlJaA4CT9+mA9i9qKJNX+6ehKUAgk/DWzGrLAd5YKdnukyS0e95ZRzetAP9FGWxftUytY6D7OB/JMxp70tPo+GTtjr6MWvoQbysmkFtOy11wXAuHry/6Y9xenXtjxprvkDMz/BE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8df132fd-bc3e-4b01-3b7b-08dd9d33d770
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 15:33:34.0820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XC47iURAlYVQj7EtD6G4pVhtoAItSHmloyGjev5AAl9aV6CEhOIFDpLO36M0CSc0gAIZCo5W52xPciKqoO3HjMV+85DDxLuZdQx+M7V2spQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7371
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_07,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 phishscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=935 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505270128
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDEyOSBTYWx0ZWRfX2+Br8HuhNVR6 reeI6EBhQUymWZWpd9t+CvTZveZcGPOt3GCnqllekcxPu2WuZ5GqUUf23VvpeOd29uUqnTiQJf/ sPm0nzw3XRiRIH+fR+KS4SdZqI7Nv2+df3WxgNoO4QBRGUdyhHtw8wuucUQ0s+KqNQnuF1+s51Q
 lvwyen7OOdaPhs+3ChZjDxdhP+vrhkRP8PLv8e/d+ac5L+ucpiFbPzJ/KMBPNk+McJuVyE8ZpCj cWnOGH2LOaRB1L4zNkvZALe11Xav33Y5wk8et0Rb8riZ29LClZ9gTy3whVXFMIOYNlkiAzj89Nr R1BNlouMm+X6ltHd1gRMRztTqQW2fWbJFGxpNyfQ9JxSJFHQXJ/h/gKESnHxXvuTPfpfMfp+gB2
 8Ycszd371Ahos/4twQJWNM1d1g7VWOuYqvvEkDIFVHdFIZPcp7IVAKG6AZX2mG11Dm8vcMHP
X-Proofpoint-GUID: WY_DRsGxhQL3ynrtpjKBGH-SZiZHnX1w
X-Authority-Analysis: v=2.4 cv=aO/wqa9m c=1 sm=1 tr=0 ts=6835db51 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=Zd8XHg-qe74k55dEgQsA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13207
X-Proofpoint-ORIG-GUID: WY_DRsGxhQL3ynrtpjKBGH-SZiZHnX1w

On Tue, May 27, 2025 at 05:30:08PM +0200, Oleg Nesterov wrote:
> Not that this is really important, but the test-case looks broken,
>
> On 05/27, Pu Lehui wrote:
> >
> > #define _GNU_SOURCE
> > #include <fcntl.h>
> > #include <unistd.h>
> > #include <syscall.h>
> > #include <sys/mman.h>
> > #include <linux/perf_event.h>
> >
> > int main(int argc, char *argv[])
> > {
> >     int fd = open(FNAME, O_RDWR|O_CREAT, 0600);
>
> FNAME is not defined
>
> >     struct perf_event_attr attr = {
> >         .type = 9,
>
> Cough ;) Yes I too used perf_event_attr.type == 9 when I wrote another
> test-case. Because I am lazy and this is what I see in
> /sys/bus/event_source/devices/uprobe/type on my machine.
>
> But me should not assume that perf_pmu_register(&perf_uprobe) -> idr_alloc()
> will return 9.
>
> >     write(fd, "x", 1);
>
> looks unnecessary.
>
> Oleg.
>

While I agree we should probably try to do this nicely, in defence of Pu I think
this is adapted from the syzkaller horror show :P and that code does tend to
just insert random integers etc.

It would be good to refine this into something more robust if possible and
ideally add as a self-test, however!
