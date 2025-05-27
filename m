Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98006253931
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748346198; cv=fail; b=WwAx0GuEWuuRxuohVXjxhRyT6z6KeKTUJUKs3sIy03Qx6bZgBGVkqS6OC5aIBDrk9X4KTCXw5c1jgARyZiDyqAnVGDBlRJeyEobABhqX7Bq6+q2jI/svcKyRgQcK/YnhI3F4SBv09lU7qYnVTYbiYmsuu8XJvp7BGtQE0DejKKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748346198; c=relaxed/simple;
	bh=3I2n1HLUAOUkdqu7yiWOZI3glVKGMzsEbbJ4vSeT89U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=r8oXbuyJvRif9VfckiSCmp7P14wAE2nRkpR1yYcOMHhZ6sxeD6ePrg5vP70GsO7lCRKW5XsdHWywPNQozmwp24BQy2hNya+KuwMyKnRDMzNoUByiArl6fSlS9e/eXZB/KWLCaq5n18/UAithLEfqq4PRhE756C9hT5T+QD6iLYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cADj5qwm; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IEoWWOA8; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cADj5qwm";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IEoWWOA8"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R69YYd007325;
	Tue, 27 May 2025 11:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=S4L/rpbpWYswqgznr3
	alcCVMIEOhx+kWFot0wvXPwH0=; b=cADj5qwmevN6n6H8TqU2/WJd426K/bBa3r
	R9pDIo5HpjhLOr8PNWjeTsa/CxcoMlgvbKtAqg3NDlVMniRECR9hEsS5aijEpM7/
	H2FZdcZZANAqfRcjjPAqJwwDtIppNmQ4lxY8pseOrOo6vsG8vw7l5OoTVZyfiUGX
	nFY0R10lbCG83QGUzoeI24Pnxk/+hx3L262QrvZ0IzSgjQYIESIPnE1asG14IGNO
	B5k0kP8TilCsvNSrZWTwB2MF+wa8sSBZYWTqQhCnQd/gV9RGv6r/4HqvcY0+XVsK
	E93rpFK6O+z7jyLx1KM3+i9u0TzJzvmLu0bjmcKOXNk121AdZu1g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v3hjtwjf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 11:42:45 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54RBbvFV007248;
	Tue, 27 May 2025 11:42:44 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46u4j90ag0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 11:42:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SHQ/WfzskLk5FJhCTQSZc9VkAuhAQmCqa44pxlZVujqg/+HjkGurJACeS5GucxWtv+z6QVtZrg2tU4yWQkl4mufHLV1xF6Icdbetg7qyGG+/hltGFtVxfNL3EzA60xH+wiZ43lZOIDpRUoGGmryh7ilhprlb4qxW0HxgyJVYnFqGIYteZmGfRZ89LYXSM/Ax8JkCu4aTBvTSKM27/9X2X+FdNcgGrCOikz5Ezngr3QkJw3HXZ5afRhn31+VVElKw1w4WlqaJfB64y95zN9Dpoa9z5cbi6W/wUeNjAoiG4SqWoddddLH4mukcAKlwS6Ocn66S74t0NfdapzEBdTijLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S4L/rpbpWYswqgznr3alcCVMIEOhx+kWFot0wvXPwH0=;
 b=Esh+qQg8VEyeH6uPoK9Mc8EPS9M98105qByducVnMJv2jjrbiz3nE65uUTIWq0ft+49GPWIIULnnuLmVs+uraTgzsFNiP3EzUkurMI5pFzPHxIHpJKnveWJoNiXaowvemGfMKe7P6KiXUil3FUjucn7OLRhlAR/CA1kGG98K2wEhVkEPX8DO5L+BsT45vneMu5BNd0D3NDrq4IxBbKGKPzyzvgqtsE7b6X4bO15N19HUMDssh8S2huy0cVOVcVcW/9QE4X4XHlLPTL8Rz68JvY5YNm5ghamcoE/tzzyTfnESMKY2qoEodDO1IDQl09SZCb02G7q/F/06xWmSBhcZKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S4L/rpbpWYswqgznr3alcCVMIEOhx+kWFot0wvXPwH0=;
 b=IEoWWOA8eA7Dolz70foRZEvnMHwSX35ZYcjFwZTAo4hm5qVjSkw1GnsSZ4eoS4OERLjQS5NgDoIj2s1TMXVgFHhqlxUgDy6F/BUkKFJsOd4F6p+y17OtXVpFX9n2pIgUjZwyrocm7RlVCTqq5scK2VLwz928PmaLx3epLilZ4fI=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA1PR10MB6414.namprd10.prod.outlook.com (2603:10b6:806:259::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Tue, 27 May
 2025 11:42:41 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Tue, 27 May 2025
 11:42:41 +0000
Date: Tue, 27 May 2025 12:42:38 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Oleg Nesterov <oleg@redhat.com>, Pu Lehui <pulehui@huaweicloud.com>,
        mhiramat@kernel.org, peterz@infradead.org, Liam.Howlett@oracle.com,
        akpm@linux-foundation.org, vbabka@suse.cz, jannh@google.com,
        pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        pulehui@huawei.com
Subject: Re: [RFC PATCH] mm/mmap: Fix uprobe anon page be overwritten when
 expanding vma during mremap
Message-ID: <b84f00c8-966c-46f2-8afe-d09465153217@lucifer.local>
References: <20250521092503.3116340-1-pulehui@huaweicloud.com>
 <62b5ccf5-f1cd-43c2-b0bc-f542f40c5bdf@redhat.com>
 <afe53868-5542-47d6-8005-71c1b3bec840@huaweicloud.com>
 <13c5fe73-9e11-4465-b401-fc96a22dc5d1@redhat.com>
 <4cbc1e43-ea46-44de-9e2b-1c62dcd2b6d5@huaweicloud.com>
 <20250526154850.GA4156@redhat.com>
 <06bd94c0-fefe-4bdc-8483-2d9b6703c3d6@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06bd94c0-fefe-4bdc-8483-2d9b6703c3d6@redhat.com>
X-ClientProxiedBy: LO4P265CA0208.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::6) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA1PR10MB6414:EE_
X-MS-Office365-Filtering-Correlation-Id: c633517a-b8cd-4dd6-5aa5-08dd9d13965b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4Q4Bzm8U90Srd/ACUrT0aFKYM74STsccRM1rnG8snwi9SJuSwz7O9ngcBYdD?=
 =?us-ascii?Q?oz7ye7JJ9+d2kSmg7R5UMjd8BayJA2ShXQwFOk1pV77pjXuKhRKvoA3MYnxX?=
 =?us-ascii?Q?7KKzq3Dj58XkHBiZsVHX1ZLo5+oh95yksnMEfqrAghXumY73bCXupqVi/Hah?=
 =?us-ascii?Q?cvkuz4has5WKyywLMTjUm7l+pp5zW9Vu8NeD1qxPc68qpiem2J+tzoi9tO3u?=
 =?us-ascii?Q?Kr9cBjqfQUwtZWSm1ciWGoHXBDhcS6NE2jZIP419o4Xt7UsAqmeSr/Lcb0CP?=
 =?us-ascii?Q?C+GQm+m4DxN1XNq3qWt63iKvaDrHAJ7Fn8URQjh/VJ4B5BWMgiRDI93sRbvN?=
 =?us-ascii?Q?+JUjWriaccQgK0badhBcQ8mVld4KuS1IVRxrwIAAxmFt06ldU4u7kQ5vGa/k?=
 =?us-ascii?Q?/CvjC0hecyzMitRChWo5HF2UfHXakve1C6Qvuaxd5Ft/oXWuYVPEo/WHf4SX?=
 =?us-ascii?Q?RwoTWTo8ADHro/IZBsS8Z9kcECEd7n4kGp8mIb4jvoy+FU4ObotKVdCz9rTp?=
 =?us-ascii?Q?FCqPlwDij1q66BFARtbaKAxBZE/B99yYrpywhKV6TuGuUDyL5R0SnAoIk1EP?=
 =?us-ascii?Q?trmDYwPMgN2JXE2VrCSish67mED0mu/IesugwnHfABFIzJ9m63jy5Qmz/X+P?=
 =?us-ascii?Q?PhZzK5d0wNvC2PkmHw9AWJ5wUSZCmNpqHDPnRgrguJ+FCgR889pJiD6xIMfv?=
 =?us-ascii?Q?CDpTFQwzEvVaSsPgPjRR/pCFSraxdFBFF43wnP2sSshCn5pErUTp+xBEZFVl?=
 =?us-ascii?Q?7y4QM/RWs7AboRIvXYnlQpK5KeWGqA88lm3ESnWYTSKrXSTzCs83uUrv9PIU?=
 =?us-ascii?Q?+wTdMJ4E2s6NHQd3yzivwk5n6NpQA+nb4p7tjZxn78l1d/mmszFwPctBSW2K?=
 =?us-ascii?Q?cw06Sz3F2I9kRbmcVbsXYOXQgJgHVOH/XYIhTOcxANbEKooKNoV2ytJIixZJ?=
 =?us-ascii?Q?4f2Dt/Al+WP6qpaBdLeZW/H5klE5NN9tFpuY4jOHvq8ef52R8MFlLOXhnDMj?=
 =?us-ascii?Q?gTXLu9LaLM9vIiOb8RjLuj1LLwLhITzc6JEgK2F9uMweGyjiX4uqE/iqwDv3?=
 =?us-ascii?Q?eTZssMXdRvgbeI0vW1UnuYi70QldFjZqeXbsI6wGFSi4Xc7OGJJbEzh/LGtb?=
 =?us-ascii?Q?a73uYZCQ3v3TPMBbl0w/aby1Dqy5qVZlfp4Qqj6aD0fCgwbGi6VEfuQBe8uG?=
 =?us-ascii?Q?vJej79XLSSnpByqDh9B5bVBdSJ/Fx2vyjv02nWEsLY3flEjJI0xgk2nFwJ+b?=
 =?us-ascii?Q?rN649UmFdpOCMOv7DdGvwEsBevSOKivDE/wwoI8OerrjIdMri6cLubNdb/H5?=
 =?us-ascii?Q?p0JpQ03r9/nLVp0NnOKCKEXPB0Yil56X4VtoUt1uUh7AYvO+T6OV3iQdJued?=
 =?us-ascii?Q?+9hL+3NkLCIOmubYkgtaZzSiLHjrH/TImML744qFb+8iDq940AiaTND8hXI5?=
 =?us-ascii?Q?kNcFlt1vxCI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mntvWboC86kr4MXB7B0WH/gHT5tySUjOvH+Pvdzfz7T56Rn+tyQXLkIiKtIs?=
 =?us-ascii?Q?PmqPAmx8tki/Gk49C8I0V57LM2hiTctdKJBu5fUfxafiWDbjffV+ofr1Xodk?=
 =?us-ascii?Q?NQp8bVyjZo4Q3ZOCum7UYp9ZOcyjjrUu1Xa0LWCdFrRXOYNcGizGs3k1GiwJ?=
 =?us-ascii?Q?iQszD+oo6jwchPx1kB0NoBSCA+0Xx6wargp8DaKmhVJuSNcGclM3ZfRaH/G8?=
 =?us-ascii?Q?dC4ukOorw2xPm5GgKnTk/83REqOeZ35615rjbhJc2NsxXHubjAs5B3jfJJlf?=
 =?us-ascii?Q?IMQ9HodErB43iFkeWoB1ga/BKOVLQz0y5B/ykGKCd1yNJjqA/WGCxdVGdKI5?=
 =?us-ascii?Q?KMCWrxpyoz8dz2nt7TAL7Ns/vjXe7pdOMUe6B5yTXrl5IHwB54EoeT6ID/Wx?=
 =?us-ascii?Q?/Xg1UsHIbZDts5sHUfJKndPQzVhfO80vKpHOGfYe5QvwfaBjbHsCpXNuIScN?=
 =?us-ascii?Q?cNqCvU7lCjnfXbmH7rOjxs2Th0QeVw3A8jCDbLfzBt5ZkepaELDPelHmkCvK?=
 =?us-ascii?Q?C+MCBErARZdWjQxe7jfHtNWgPbcxpxXOZjBmGY8ojrEbDIbDQo117/JP0Uxr?=
 =?us-ascii?Q?gJveuWZBOUZb+FmYkEES4B2k4i4b6SNhQoKZTQuFqE86Ai5MEfWA9n8RVBEc?=
 =?us-ascii?Q?Rf/g+vAWNByeGF9x+nqBxH21S8h408er88KjnkfLr+LYjmRl11VILH5oi3P8?=
 =?us-ascii?Q?jawQdov+o2J2LKP+y2LvFz4LMTQn5XUV7fDsiiC7hiismZaw9voCpRyJbjZc?=
 =?us-ascii?Q?+VCBEzIg1KMZ7XyX0KG7yX1Cf9pY9GA0qN/HMox4sAwGDdIUI0wmw3mhvzq1?=
 =?us-ascii?Q?d02HXXkJC7k2RpATWTlMn45Wullshpi4/ZAX23JvSw+0Q/buFpNUgkzSwWlY?=
 =?us-ascii?Q?UQiYPUyQSJ8dKuI7e2lAKm69Zl2674mrmb6zNAenCijRZ8lrEknvooY8KvdS?=
 =?us-ascii?Q?Edd3diKCIFKMuHobOMqxGes3iuxPHyxcTdN8cBqncV19mUhwLrhjPMYpOZhf?=
 =?us-ascii?Q?yE3OWQcLreEIBJSqBOV1pl2e1w6S9huF/pGiB2b/tBinfcfPWo1Hxhm6UAa0?=
 =?us-ascii?Q?EcSE5SkgjspGdZmBuhum11pXtTP5MzDBniLQCpaY0f2kebXGbnGo0JCG5lD7?=
 =?us-ascii?Q?WnWvJDPeIUyOgkiV2+MAr75wGKt2Hj48oUk9xoIHLgJsBS7fRkenL8hmm+pJ?=
 =?us-ascii?Q?qk2veaOykHJoPCpWinpDzDYkpC7SzycD1vrn16ER+QXSboHdPjCg488cKSKh?=
 =?us-ascii?Q?kHLpxZZ6sxp/0u57SlnPtzC2URdUrFBHduPFj3BBDDXMtRCKG5l2gJGBwlWu?=
 =?us-ascii?Q?thUjoUvZ79u84gmjqAmZhdi3H8TpOfxlnzjRSGLzSbiPh+dgQymAZGZFnWrH?=
 =?us-ascii?Q?HbfD3vM5dH6QYt6LVoxTpPDgA5dILx6ZJ4L+VBUVlUT7JNsuuCUj9nWW433F?=
 =?us-ascii?Q?08pA2UbXQa8+jk8G8WHUEDTKJz8r9m1A9+JIAWn12HLtZ0+83u1JqQ3xPdH6?=
 =?us-ascii?Q?Dm2WEhaFo0V2YZejUtQk+QOnRLYYPq9paFoWvr9rt6VfryMl/EcxtpGgNYfF?=
 =?us-ascii?Q?R9Jhu0ZHq8JoFQLTDVfXAy/PEX9qhq5GVGRNl1swaAEyaYJuWsd6M7hvDS1m?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YiNb3htDGdIqX++8x1/QWc3EHbK18uLXRDCaFeeIq5la7lZX8tAupi8lXMIaQOfO7NFHmVL637gffgX7MGo5YfUQMc1M4sLU2xxsDuTKIw/5AMkjcHduwolSqTiOhyUSoM8BXWIXLbiLB4eXNizzgsnqGAKbHuI8t7+SXl7F9n3PHr7sbvA+UUDg4Zwt+3rWftHFHkTLCRM2gexfskjnAM5U35eUD6qWGA6PbiP1ZfBlcqPMMSVT8iJSw5wrXhyvJen1huG1XSvAHwUn/IHMV96v2w53jCdIim9FZIW2BbRFjLtIS3IDW0MUiHXyOIl5mdg06cCUUWt7pUG9Mky+fB+WMdWosl+iClYuJYyw+0mudUedo7nZpGVj6O2Xry5Z0WX04Hcgs74EmzX/fXleO2wN3+N1TAZdRrY6d57UmrqwjNx2ACLfHy2iKlpy0ub7zBonjUZgEN+6ttAmz/SOsAUJJ7DZuX2UYHMZkwhNJf0KJ94t7dMMOXczGF8i8vfBI0kki3n6ENF9nBaon3Y5obXYt4nJB3Pum2Y4Apuu/+R0CmH2Rf2u3lpAZzotGtATFEbIuUMIqSKfJQHkUWCLMoeqKPcdZ/50m/Hrpg+Mo7c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c633517a-b8cd-4dd6-5aa5-08dd9d13965b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 11:42:40.9805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NCUt/HhCQ4AomSnftXWeTmTk6JSdfnTR2bKQvH+VWZDnjE29C79beb0IFfUqNvKbTaJcqeYmpmi/SRDUISm2hj48g2Wi1OS5y0o+QeZ6FaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6414
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505270095
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA5NSBTYWx0ZWRfX1uuus1xbAq8k D0JoNJni5U0zhgYYZX8qSg5xR6xvxg/DRC8NBa8ih4mq5W7leG9GboMxYa5GIycOUPAefPtiM6D fU/Sx+KS/hSr7nAAGXI/Ckfe0RlVoSvSsUi33jW+V7d+MtcdRpDjZX2oKvDYZjWdFaALU1t5d0w
 wJWN42FJGZpRGzfbLArBTYVspPkR0VXkqYjvNx1vD9zzSvet8nECyagToAT5IwmoMIXZxUXcKEL ZD0nUWDySzbkxcLV57DxKxdnWxU87P2LBwIcCsmZjbAKStDRNgI+FlEwcg/39ShSEgIa4vgvZjT wMdpEiKQwnaQGuwDemSWR56g+giy+vrfB2GZWsmmyRTSm7hMRBKYqR5tIrqbHrzbPiDFMot8sT4
 mEhLt2l9SOsnvuYYCZNdVNUXwbQRbBpImW+kxWRqxJG6kopLWTzSACE4EWsOUc1BHCV1RbWI
X-Proofpoint-ORIG-GUID: zeMbgBQOZAB3djGk8aa3jdKML_xcF4PJ
X-Authority-Analysis: v=2.4 cv=CcAI5Krl c=1 sm=1 tr=0 ts=6835a535 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=ql5gkLrcWhyoymD4w1oA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: zeMbgBQOZAB3djGk8aa3jdKML_xcF4PJ

On Mon, May 26, 2025 at 08:46:07PM +0200, David Hildenbrand wrote:
> On 26.05.25 17:48, Oleg Nesterov wrote:
> > Hi Lehui,
> >
> > As I said, I don't understand mm/, so can't comment, but...
> >
> > On 05/26, Pu Lehui wrote:
> > >
> > > To make things simpler, perhaps we could try post-processing, that is:
> > >
> > > diff --git a/mm/mremap.c b/mm/mremap.c
> > > index 83e359754961..46a757fd26dc 100644
> > > --- a/mm/mremap.c
> > > +++ b/mm/mremap.c
> > > @@ -240,6 +240,11 @@ static int move_ptes(struct pagetable_move_control
> > > *pmc,
> > >                  if (pte_none(ptep_get(old_pte)))
> > >                          continue;
> > >
> > > +               /* skip move pte when expanded range has uprobe */
> > > +               if (unlikely(pte_present(*new_pte) &&
> > > +                            vma_has_uprobes(pmc->new, new_addr, new_addr +
> > > PAGE_SIZE)))

This feels like a horrible hack, note that we also move page tables at higher
page table levels _anyway_ so this would be broken by that (unless uprobes split
huge mappings).

If it's uprobe code that's putting the new PTE in place, then this is
just... yeah. I'm with David's suggestion of just disallowing this scenario, I
really dislike the idea that we're ok with an invalid condition being ok, only
to cover off this one specific case.


> > > +                       continue;
> > > +
> >
> > I was thinking about
> >
> > 	WARN_ON(!pte_none(*new_pte))
> >
> > at the start of the main loop.
> >
> > Obviously not to fix the problem, but rather to make it more explicit.
>
> Yeah, WARN_ON_ONCE().
>
> We really should fix the code to not install uprobes into the area we are
> moving.
>
> Likely, the correct fix will be to pass the range as well to uprobe_mmap(),
> and passing that range to build_probe_list().
>
> Only when growing using mremap(), we want to call it on the extended range
> only.

We might be able to implement a simpler version of the proposed patch though
which might avoid us needing to do something like this.

Having a look...

>
> --
> Cheers,
>
> David / dhildenb
>
