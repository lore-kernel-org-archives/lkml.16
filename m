Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC8623C8D6
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751281756; cv=fail; b=RwQIPlvdZj5u7YERSZHdSbeViDrGbSWNs4660IkI908T7MK5t/zx1p3U4ZdGG1cPK9o35UqhKxG+kXHfRwopjaxFDggsUYHOUxy7M4T6cw/SG19HM+P8ELlrweo80xKlKIRypb03VQV25nqF757H40MB2z11e1np0Zc4HQiv9rI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751281756; c=relaxed/simple;
	bh=1uEoLGM7zs2HuxubkTMI2kFxhSQ2b2LPvBJyXujCqc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JpTfJKpF3aeiK3DKkp7GZkKYyWmHg5E8JgiHd/rGHZ9xWLU4gbvF1ZY1bhMXVEpBeo7ehjVveujp1+bAN7ERXHOKl/GL4v9CtgdwgNisv+QLdMF5Hu6TGhzJlUB/PWl8R6YLNtAQCOhOaZtQWUAXRLo7exH8kQzKZZGVEFNyXuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OP3UrNT7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vQfsGnII; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OP3UrNT7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vQfsGnII"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U84jAC004528;
	Mon, 30 Jun 2025 11:08:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=0gKV2FZwxPv0uh2X9z
	Z1w/H9je/fb+BUCnMoJKVChmU=; b=OP3UrNT7q5d9INCX5RNNmxVZGE8Xxvrg7y
	A1ga9jemLCkfQFHv13PLU9m2gG82OagB62773Fwdd+04plwrRrbf00oK/P25nY/E
	hQYBEWM6wlrrY8FGVZ650+ac3uzsDOWegfIlOdG0OZQdJSDLGnhGNEwfOOAI7+Sw
	M/CMnebVQNsgJUsnTRDnDVKsW0vmaKunoMKlykh4Yh17nNuAJSBDXBAJkB/woWaR
	Q/XGHx3JH6r3MKlj1jLXuWDxBru08I5P8G6IlKKj12rHLPD9bbEy+6lRN8gK0m+O
	IU4LzE94WV5dafT1XNxGCKysNqLL77cPIHMF67y4Qy4LDWDSB0Qg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j766a9h8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 11:08:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55UAu17p038473;
	Mon, 30 Jun 2025 11:08:28 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2055.outbound.protection.outlook.com [40.107.100.55])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u86h03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 11:08:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Df8DPDGkjTZ1CCQc9Avwwd7lySGCSAhDKTGzk+xUlHSWM/3lJfdWk77he3WkAqdHHBOMtNhlqUcHwOn0xyBhqF0yvt0jhXylX+68Wwq74C0HbDGciYko6uvQ6wZfT2mT50j6guC/2Fthel9PBsOeAb3alc0djILUIXH4SDz83k8GEDdfGv7uBBxYcEGEDbb3jCwCgCvZkgWfcQVAfHWZVeUdSr6UNzb3zGxA12X5VA5ZObCK2hStFsAmQEz/eYRmku71ZRUpMwZeh/gI65091pS1CUx8VdsWVkGDH0FND6Cyq0ijsb706OINiSnxrwYRUxZOhz/mTOlFirB5yiBKTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gKV2FZwxPv0uh2X9zZ1w/H9je/fb+BUCnMoJKVChmU=;
 b=W3bP80IqOKXzEoZoFjE5RT3n7F18dZhUdQdlTD1dxIz8spBCvSLJKpSw5PIGoUJDqvGbzRCzTm54MXJjs3oLmdxIosJtLC8nbjrSuZXtzAzKbEEyrZ/n9aVkzv/P31z3pyiJNfLjQqDndKiPE5DjXOai1mPeTi7VBSKjObcBHFuhgdqIzS8VrPfsyp9KgenUH1HGqzE/NBkVy75Ycx21DiMcUCDQQq70/K6G9Jej5PR7Myk7gfndxMZkw3G2PLRNphl1sG5byxuGWPP+tCwAO3fcjUR11150dbk9XShm6Y0PFxrXr2z18Qf+aQPXuRkx9YJaiN1Vo88ZQQwzDDqq1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gKV2FZwxPv0uh2X9zZ1w/H9je/fb+BUCnMoJKVChmU=;
 b=vQfsGnIIF0MB0CNtDcZdhR7Jcwf6tXINILEMDJ4NB76g6coEuwkx9pgWgC9MZWdy9f9yxcr217B5sw14sTPDSfLHQct2FJy4w8k9w6/O6OP3t88jC/agxkZsVuDHRfF3d3PU4yJtDYoJSYSE1bbJctPcjik1guWxJYsxXfR5wzQ=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CY8PR10MB6876.namprd10.prod.outlook.com (2603:10b6:930:87::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Mon, 30 Jun
 2025 11:08:24 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 11:08:24 +0000
Date: Mon, 30 Jun 2025 12:08:21 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
        Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
        Ying Huang <ying.huang@linux.alibaba.com>,
        Alistair Popple <apopple@nvidia.com>, Pedro Falcato <pfalcato@suse.de>,
        Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>
Subject: Re: [PATCH v1 4/4] mm: remove boolean output parameters from
 folio_pte_batch_ext()
Message-ID: <4500541c-dde1-41a7-81c8-ac1573d05419@lucifer.local>
References: <20250627115510.3273675-1-david@redhat.com>
 <20250627115510.3273675-5-david@redhat.com>
 <b6ccc61b-2948-4529-9c9d-47e9c9ed25ab@lucifer.local>
 <997a3af4-0c8f-4f8d-8230-08b43d0761b6@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <997a3af4-0c8f-4f8d-8230-08b43d0761b6@redhat.com>
X-ClientProxiedBy: LO6P265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::14) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CY8PR10MB6876:EE_
X-MS-Office365-Filtering-Correlation-Id: c977dd07-8570-4fd1-ce8b-08ddb7c66e33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XDrvQPrk5Og3+U++7dvtoZwrHZtoZo2nas605CZQKq2/AVTDLyl6qSunR22E?=
 =?us-ascii?Q?iu7TnyEPBiFKBu0fTFzulHfFKNYzBf4yqwuLw1TypkjttXoT6tri+wCZmDJm?=
 =?us-ascii?Q?oJnjeT0/wYHdjvCEJ4b52r/45fTLHrA+IThHvjIKNRIEoBKhHzEuHFTEuXGw?=
 =?us-ascii?Q?fWx0C+8X40ZuyElxajlEdC9gzKKnLiymIDvNMGoPWu4JzPZJXe1Gy3/FTqtw?=
 =?us-ascii?Q?FNd/pVjUBwddUc9rWiRfozwJbSPUrEtjnQy5ohhuJIedgVFF8lAmia7Hzb4E?=
 =?us-ascii?Q?JGob7aZlsiByhJDbMT9wyvNED35onrI4dH1kTA/+MCxlnR3c0QHKbr/ZFXYM?=
 =?us-ascii?Q?fV6J2qam0Ce063UABQkBvpEZgwJFV41gkMFMmIG/uDzOnnD+/WMYvsOcOn5O?=
 =?us-ascii?Q?GRjR+juP08h1bobsa6oxnyu5staJq+1oFU5NZC8wFAc7402CbAhLbgcX44jG?=
 =?us-ascii?Q?Nlxy0aYc3RDaXSg7sj6mlHu7fxu+rDBl35N8oy74mG9EULWZBOxqSykl9MDp?=
 =?us-ascii?Q?zVQDbHIrt3bpRbzqCV5aLOAn+vyUbP03MxbnJVp99j1HCRSFqZS/I1ASuvTO?=
 =?us-ascii?Q?sHCetvQtvWocZ0sG32dgDfahTSsm337Hb3cgvvynS7mKMK27CvlwJFh6d/1Z?=
 =?us-ascii?Q?jQHmS015ZMZ1U1ub5XjJnNxTK9O0AOOu+sRNfvCvX2Sz1rkNzK/NA5nBeDbk?=
 =?us-ascii?Q?43K+RfWs4xePhWNHR9OZveC8bqaqz6NMXMLeruRiH7kS0Q5I8jFVqRA977Fj?=
 =?us-ascii?Q?1DOYUUA5IGdCyjYkfgWB7SsDDnoC4RUxQ6O3+QWdhXuDPmt/QR7AXit68CQE?=
 =?us-ascii?Q?1QMQic+HdN8QRIBAxDX+E+argvYV8JuxHxPEDAm6MiRzbsfIa4DTdQltbvqI?=
 =?us-ascii?Q?ka3Rtqud+2XjigKIyiZ1vU7YC2KnMgI3vWe5h7vO5q+x/lG+CN0fYDYEi0j4?=
 =?us-ascii?Q?SNYtUZzQwIV0hOjuNIM4shY9y+jTD66LET2fTDH0sWMTDihfHLusMSEeC9ka?=
 =?us-ascii?Q?3oYHRq/PKPPsAYYmJAKLcYqVRIsm0izqGxnUBd+MHbvQfQi5X/9EcYuN7n0g?=
 =?us-ascii?Q?Vig/2FmVTRWUbF9ytS4btyWcz5ojhKW7WtqzMA9oxLit9rkBJTtaNmwRjen5?=
 =?us-ascii?Q?6f1fP6zU16kAePqtMIvkYsqWB/zHmiF5PT/XrWqidm1OPCCahNlRVs3x/MNy?=
 =?us-ascii?Q?wDQ/WJe2tUJsjD/L+eMP9/KpPV7kZWxV3veNqeBoVnyJInXcs4/yGUHldP89?=
 =?us-ascii?Q?orpwjyTuhNmHbWM6fLTXcHUpaWDMZnXNShtCSRF8qk5ZzED/sIISIN15xB21?=
 =?us-ascii?Q?iEMKHa/8WxcIO6sDneQI2miIs0I3rkwict3c1kw5mSANGUwQmzEoHGcLRJou?=
 =?us-ascii?Q?EIuRfRRHDGKO9QkPK8l9Wvkck3ltL54wFEb2CIdAkYE6UA4AukvpFbYnuRNF?=
 =?us-ascii?Q?Q2UMA9p20fs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ncV6bF5tzrBofc5GwNu0yJQkpqbW/r1BL5/qek5STkr+vJ9gSg58qzEEBQGK?=
 =?us-ascii?Q?y3Mc3k/A3z0s+jFRKkRadmL33CI0NB58ujtezsHwUVwwL1ylCwFUWZXqLIsr?=
 =?us-ascii?Q?g+wBO1ptACjX/VbOeXhaKhHc0lfYpDYiX9jevs5s6Jv36a5/+03mx1UurEMJ?=
 =?us-ascii?Q?d+mtwq0eCY8Z3xZ/SbZVftiWthGwMuslwdJe5kBc0d8/TZcHzSjuV5tA0xiH?=
 =?us-ascii?Q?ESAtOdohYSvL3QjeTCQfKjlOONe3MEFAU+0lIjI4Ww7RhM64GiWigPs50Se0?=
 =?us-ascii?Q?mclA8VKGpNrGn04Cxsgb9RZRZ+3XG0cojxAs6fUkcRT0086NEICMl8k5MYea?=
 =?us-ascii?Q?Uh4PjL8L9uXj2izx9yCWhtUtCkCNXrOvJAohIAFDaPaWdXj+7aycb/a9wsEC?=
 =?us-ascii?Q?kSdXsI4O1DWqEKl2XjIydp91Hgc6QQ1IV41lzKWl76AscV6v5hbo185x8/yQ?=
 =?us-ascii?Q?xWADlo3y9N9XC32nEieZWtKpjQ+7S7qqzw/wnN4uRJH1qY8BUna1vkzEPPXp?=
 =?us-ascii?Q?dlH3Ay1aTIoiGiZLpD9ivOy54rXYn+E75jCwQNYF0I2fKYbVq4AHHvdOHBBO?=
 =?us-ascii?Q?avVGzhIjSQ3XYcIw79SaoILS3mGugdIW6dAxgRXDF0pgaUy0XFTiOsiq1ilS?=
 =?us-ascii?Q?jpEZdyZqCh8qNpzAyeAvSvXYLwAHXeaphjmw+xQp5UhC/ml1VbYOA1l7mAlx?=
 =?us-ascii?Q?6Wf3rpDZFXKYCh4BcKIz0gOeaowozEuv0+2MRgLbdd+F87TEI3Ugk5HAWlRJ?=
 =?us-ascii?Q?zV8XmLutDhlldQep6wVl1GEeWug9hzlFJzwee5dVO/TIVBNj7lojiuGUBG2E?=
 =?us-ascii?Q?kQRJ1frdTSF3e7/+bmP0RkX+E+KwMDTOkoxzjf71DNpU0IOrUfu5Ajjzk03q?=
 =?us-ascii?Q?0RCNz9OIINqKdFOXO2dLoerZBEYTwWK4ktRX/V7rzc1b3yP5kAgZXZSETmez?=
 =?us-ascii?Q?zHtXDSB8i2MSnE4QT7dP8gYJMWcqaBz9rBL4d+MPcZteveJSVL2Pe4JFQMVs?=
 =?us-ascii?Q?azdJO0gaW61IqRm8T7IagHQO4Fd48U9BF1NNBjsRcLmHq/Nt3Vlw/gViQiJf?=
 =?us-ascii?Q?ezSMhsIGq/lN5WhDNGAWcpgU5Z3CVtuPCG68J9yENrvDQw72qADiGEj1qhFF?=
 =?us-ascii?Q?3xK5mYfpDl/Ek4gju6D+It6s3irEC3PTn2kQP8GPBtSFHQWlCmPeriBLm6bm?=
 =?us-ascii?Q?P0GWo8Y/E1NflYXxwt6aTm748625z9CRbm60uK7Qhg7xOA9obbNZhGzTF4z1?=
 =?us-ascii?Q?c8VFDwoW3XO8FrDbjOsholyqJmPkFEGy/GAmHrKtmntcSw7JHqhySFDZqGgD?=
 =?us-ascii?Q?eG0nCvjQsJVhYwqm86UuX53O8AIg5cOW79Cc/VydLRwEnrJht3Mm+2Y9hw8z?=
 =?us-ascii?Q?WzKiXcCOjWgUf7LQ2s0Kc46ozafDyH+Q7yIKF0nJ7JQSMdHuQm/Q9WRvmUhX?=
 =?us-ascii?Q?QX16EzZyftqapFu2owOOuRRkizkZOx62mqwjhjKNQc6LBcCl3pkIQNitFNhJ?=
 =?us-ascii?Q?7G8yiXJiglN8QCUKh5Eb3iOKOSnulufkyub+wi5SPWz7idQaL+vUy8ENcxC7?=
 =?us-ascii?Q?G5lQfKHbgvrYPoPmqi+v2EM7/itQOzpuZ52/th/UEvZty9HFT4P/kOnnE289?=
 =?us-ascii?Q?4w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8IaHzkBJYa/8jlrOSQjuc7X97SlhC3LJXb3Ke6MKfpoj4vLDE4Fn4O4pbjHoigF+0uier2GSF7ft6zCq4Otubb5nngJhdxtZm4pgHXDwq+HgF85vy6roKSYBuwvIuX8dEDbcBLmDx6Yb7ZNvr93HjUP8xf+5kLQNwyCRFj+DerkCMOxe5R13nKKjFCdnEd/1neesxsDTfVySbuCBuC6d8rJaK0M28wvX8szMD1KnqEmlh/nQz0wut+MKGYsf9rY9BieLXLcNUeP+8rmtTCXeq/ojjbwyxltEvIvC9U/4bgXJRjSZuAoXWNR6yPXCs/GccgiVeTu/0t2Rt6nVEYRb8rvC/1SAWTaAnLtdcFj3pAR29nRE5yx0V7M6/FS+UGqPkLZfro+wUEm7WE+r927hhHp0yBzhjUxiNZBlLmo53VSgBeNTZZMYfjLD1+vjw8t5TtJdm8IXwTXh+r///VNXda9J4Nt516vrtPj5RRmnEo+N8hOorYmDx1wkRjzPzxXW0VcTIRbiVexdUTLfxtdjt+PMixMMmS+M/S3tTdTwmQVwIdjydWiIRhXwlf9c5kaokxuY0ixDbO7f7p589Lp7UVLKrewXV6OIj756hoBMaXw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c977dd07-8570-4fd1-ce8b-08ddb7c66e33
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 11:08:24.2905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VlUhkRkQK+U2r09v1ua6Cg+MGJmwvlevGxd7qoqHmTqrYCwhkExfhqppVzRcOdU7lZeShtFONHfmlHNNGBpkQnv5KYWzUkJD7bNe6PgeI+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6876
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506300090
X-Proofpoint-GUID: Irw2B9HCFWYPQ4ENCt7hTta0Tgbgrw7N
X-Proofpoint-ORIG-GUID: Irw2B9HCFWYPQ4ENCt7hTta0Tgbgrw7N
X-Authority-Analysis: v=2.4 cv=b82y4sGx c=1 sm=1 tr=0 ts=6862702d cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=20KFwNOVAAAA:8 a=nWTmyOoNL3GYHSEzd3AA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA5MSBTYWx0ZWRfX/+yXtCYID3q3 xDwv1GH+TB3FKZrsEKDsNhJ52HwbsyoctMi/ucjjAYwyLdQsNqOggeSdcN6YIMy4/HfHbcqAF62 pr2Xw5uKLp42c8VbXODNCeKWyqbWutwONpGtvgrd9+ytSwnvyT9QtbLVxKN9b6gitADIzhDL8sc
 9OAGH4ZOhXF2cE3A1PXZb/dafZylSMFgXjRXmcyCx7lbi7WnZwoReLofp1ET1QaAABGn7RiBor2 lAesQfhN2KSHwFaTId/qMTqtvK0/6WKuSX8FYH6qFK14fvYfC5VHrAHNyeKimt97J9jpwnWUiNr OUFoYHsYsj/BnRSnWfefns/0nS6wBk9esp5uM/HHnHU+qX5EBZQInI5OCXGayVbDtR5I0B7vZkG
 HEGNVJBOMqlV3NcneY9i+ZOIf8+7UWTBXpmyvPjZvGRNUAz1oAc1bU1wmiOrXzIUUIizkg58

On Mon, Jun 30, 2025 at 11:32:40AM +0200, David Hildenbrand wrote:
> On 27.06.25 21:04, Lorenzo Stoakes wrote:
> > On Fri, Jun 27, 2025 at 01:55:10PM +0200, David Hildenbrand wrote:
> > > Instead, let's just allow for specifying through flags whether we want
> > > to have bits merged into the original PTE.
> > >
> > > For the madvise() case, simplify by having only a single parameter for
> > > merging young+dirty. For madvise_cold_or_pageout_pte_range() merging the
> > > dirty bit is not required, but also not harmful. This code is not that
> > > performance critical after all to really force all micro-optimizations.
> > >
> > > As we now have two pte_t * parameters, use PageTable() to make sure we
> > > are actually given a pointer at a copy of the PTE, not a pointer into
> > > an actual page table.
> > >
> > > Signed-off-by: David Hildenbrand <david@redhat.com>
> >
> > Overall a really nice cleanup! Just some comments below.
> >
> > > ---
> > >   mm/internal.h | 58 +++++++++++++++++++++++++++++++--------------------
> > >   mm/madvise.c  | 26 +++++------------------
> > >   mm/memory.c   |  8 ++-----
> > >   mm/util.c     |  2 +-
> > >   4 files changed, 43 insertions(+), 51 deletions(-)
> > >
> > > diff --git a/mm/internal.h b/mm/internal.h
> > > index 6000b683f68ee..fe69e21b34a24 100644
> > > --- a/mm/internal.h
> > > +++ b/mm/internal.h
> > > @@ -208,6 +208,18 @@ typedef int __bitwise fpb_t;
> > >   /* Compare PTEs honoring the soft-dirty bit. */
> > >   #define FPB_HONOR_SOFT_DIRTY		((__force fpb_t)BIT(1))
> > >
> > > +/*
> > > + * Merge PTE write bits: if any PTE in the batch is writable, modify the
> > > + * PTE at @ptentp to be writable.
> > > + */
> > > +#define FPB_MERGE_WRITE			((__force fpb_t)BIT(2))
> > > +
> > > +/*
> > > + * Merge PTE young and dirty bits: if any PTE in the batch is young or dirty,
> > > + * modify the PTE at @ptentp to be young or dirty, respectively.
> > > + */
> > > +#define FPB_MERGE_YOUNG_DIRTY		((__force fpb_t)BIT(3))
> > > +
> > >   static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
> > >   {
> > >   	if (!(flags & FPB_HONOR_DIRTY))
> > > @@ -220,16 +232,11 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
> > >   /**
> > >    * folio_pte_batch_ext - detect a PTE batch for a large folio
> > >    * @folio: The large folio to detect a PTE batch for.
> > > + * @vma: The VMA. Only relevant with FPB_MERGE_WRITE, otherwise can be NULL.
> > >    * @ptep: Page table pointer for the first entry.
> > > - * @pte: Page table entry for the first page.
> > > + * @ptentp: Pointer at a copy of the first page table entry.
> >
> > This seems weird to me, I know it's a pointer to a copy of the PTE, essentially
> > replacing the pte param from before, but now it's also an output value?
> > Shouldn't this be made clear?
>
> As you spotted, I make that clear below and for each and every flag that
> someone would set that would affect it.

I still think this needs to be made clearer. As a reviewer I had no idea what on
earth this parameter was for honestly without having to think quite a bit (and I
try to avoid that these days :P).

And as a user of this function I'd be like 'weird it needs a copy'.

See below...

>
> >
> > I know it's a pain and churn but if this is now meant to be an output var we
> > should probably make it the last param too.
> >
> > At least needs an (output) or something here.
>
> Well, it's an input+output parameter.
>
> "Pointer at a copy of the first page table entry that might be modified
> depending on @flags." is a bit mouthful, but maybe clearer than just
> "output".

Yeah but even then it's not clear :)

So yeah it is both, and we get into vague realms here, actually normally
'output' means we never read it either... ugh god haha.

So maybe:

@ptentp: Pointer to a COPY of the first page table entry whose flags we update
         if appropriate.

And then update the description of folio_pte_batch_flags() both the brief one to
add 'updates ptentp to set flags if appropriate' and maybe in the larger
description bit.

Then we're as clear as we can be I think.

>
> [...]
>
> > >   	VM_WARN_ON_FOLIO(!pte_present(pte), folio);
> > >   	VM_WARN_ON_FOLIO(!folio_test_large(folio) || max_nr < 1, folio);
> > >   	VM_WARN_ON_FOLIO(page_folio(pfn_to_page(pte_pfn(pte))) != folio, folio);
> > > +	VM_WARN_ON(virt_addr_valid(ptentp) && PageTable(virt_to_page(ptentp)));
> >
> > Hm so if !virt_addr_valid(ptentp) we're ok? :P
>
> I had the same question when writing that. Obviously,
> PageTable(virt_to_page(ptentp)) faulted when called on something on the
> stack. (ran into that ... :) )
>
> Maybe "VM_WARN_ON(virt_addr_valid(ptentp));" would work as well, but I am
> not sure how that function behaves on all architectures ...

Well you wouldn't want to limit callers to only working on stack values...

I guess just add a comment, or rather update the the one below to something like:

	/*
	 * Ensure this is a pointer to a copy not a pointer into a page table.
	 * If this is a stack value, it won't be a valid virtual address, but that's
	 * fine because it also cannot be pointing into the page table.
	 */

Which would clarify.

>
> > I also think a quick comment here
> > would help, the commit message explains it but glancing at this I'd be confused.
> >
> > Something like:
> >
> > /* Ensure this is a pointer to a copy not a pointer into a page table. */
>
> Yes, makes sense.
>
>
> --
> Cheers,
>
> David / dhildenb
>
