Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413FB226D17
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745488229; cv=fail; b=ikIqWzLHaL/7nhp1nSJRu9bcPgSNlLfq3NG/68T3YqzSvByBiM6vgnR3qlnByW29lkaZuHatpQzdc70hjNxk+HAJgWgEgnBb+s3GzHeXxx3A1y8RjFBLHDc3DtHC8IuD9jQ97rxTm169SGy797vwP1u5r6Kd9aoFjX2UhHafc/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745488229; c=relaxed/simple;
	bh=rZlljGTaQtmXr8fLXh4Y/MQjgr0T4fXhZpFo9UEvyqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GZHZY790XZQOy64SMLw2vrHGi9r/0x1lDWa5Uzcvmgy6LcnhzGvuY1g8eGcbi2WJICHLoZ/w8uGnZo+2nyc4Luj7cI9HCBrimmUM98i5iZGFi1OBEa8lJN3o7AWdrJlM9yrb2/7JBhpx6o2bnFwZfAYspKfgA/EQDNepM0eksPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=V0Psngvu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YYsWuh8x; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="V0Psngvu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YYsWuh8x"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O6uidH008899;
	Thu, 24 Apr 2025 09:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=Sn+4mzO8BE649mMHkN
	FOeiUSbfClkbp9t7FzUpnrYHs=; b=V0PsngvuZSN94Q9Jafy3iDUkkFTl2As1oe
	1+ouhVYTi+djZWwRqvcMeG6HvODPMmAJ3IFP8UcsuqF2SKP2nBdl9GVJp2F1iwGQ
	KiTRuXxSA4T7+0595hNhnLX3UhauCMyDgiVIbhjpwOSlnRxbQS+rkulsY6AITJZR
	8sTcDU40XWCTTtJOnz4HZJ+Xmy67EQHLiKKNW/Yq9lOYN+nXukhmn34p3B0VeseN
	iooaHS8+dYebAlOxRdN4zwvG8E/XiyEjQMwgbDXc8SbDUnfZq4rg5DubJAY5awC3
	ATDhTgu4mUCcdMUou05F5ouYIBMJbtvEtm0ax2DlwEF9VomWHUzA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 467fw2gcpk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Apr 2025 09:49:42 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53O8IgaT031173;
	Thu, 24 Apr 2025 09:49:41 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazlp17011031.outbound.protection.outlook.com [40.93.13.31])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 466k071jtb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Apr 2025 09:49:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q8PNVRmK6vLkG7bIObjbCosChtzTqvUy1cKj6Pb+G9o8BtjaBI4QeKcUsyyP5A6yF3tvGHw6v/PngGTlGh7pnvTiGdeXQPg++RjQRVXvAmWTvS7hYSrBuRqw0PMIvEMGWxtLeC9BHnV/1c1+NGkU4mb83Qsn3SSkCG0YYxfIE5JpyW5bbW2Ly1+Z1RIs+AOtI2twTkOIp5DNwNo3usNQnj8r5nS3cFU7I3I1t5lhb4NxnWqHunf2M8VwR8bE7UWEO7fRLYYC5/SkKuMKco2t0rrOA2BMsKdodH22wlEECoEmOcT9p4jt74mZDy7oLF9FRaos3NLj0BGlYc0mH8/R2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sn+4mzO8BE649mMHkNFOeiUSbfClkbp9t7FzUpnrYHs=;
 b=wVdy235lzCcgT7DozH8wR9V0lfnP0pi+d+4Pg834GgBO1PH3LqneC7Ag3uUjPsRIEsCUIZ8YLZpdJBCyiGWJTW1B0wy2N+pWGk8x5b4Wk4CSCegELBM+TNgMSZWP2kcg7NkbGWvyBpivVxRIOXId3D2NInNQ7wRDQW6uisBXmnnmuFYkMdwlao+jt9zeyYqYDzg/K9Ff5gwYpWvZqUuMlUj9E7ovw7dhpr00ivhvJEf/bLMPbWow3R1t4QHM09wkk2cMPlpG21dYToZp4Ethm94O23asjUQtSL4KMdd7r2RYqNUzKRRwFeIST87rh31EPmormFwQjgpkiX8nfylKOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sn+4mzO8BE649mMHkNFOeiUSbfClkbp9t7FzUpnrYHs=;
 b=YYsWuh8xPynrXad/+OAUhLH+JeVbXayR2VjwaMb/tLdvaW5rAxZiQDTyC3L+KjS8caaQLKqEJq6F6H0W9td/i9MIwuwQ3Q7ySOsiYIiXYU5gfX8BUQEHe2e6mbcQpr5g17G6PvoAooSVQtEfqbfDAwQ8L8aYraLHswN3Br6+Y/Y=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CO6PR10MB5539.namprd10.prod.outlook.com (2603:10b6:303:136::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 09:49:39 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8655.031; Thu, 24 Apr 2025
 09:49:39 +0000
Date: Thu, 24 Apr 2025 10:49:33 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
        Rik van Riel <riel@surriel.com>, "H. Peter Anvin" <hpa@zytor.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v1] kernel/fork: only call untrack_pfn_clear() on VMAs
 duplicated for fork()
Message-ID: <7aeaa30d-3fa6-4edf-82a0-e0c494ef3df8@lucifer.local>
References: <20250422144942.2871395-1-david@redhat.com>
 <45b26168-93c9-4170-b7e1-4b51078a04f6@lucifer.local>
 <d3f71458-8c0d-44c9-9a03-868efceee93f@redhat.com>
 <33b972a5-a137-4b5f-846c-614e5f83409f@lucifer.local>
 <0101d903-af59-478d-b0e6-af5ba6619eff@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101d903-af59-478d-b0e6-af5ba6619eff@redhat.com>
X-ClientProxiedBy: LO2P265CA0452.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::32) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CO6PR10MB5539:EE_
X-MS-Office365-Filtering-Correlation-Id: e9dafcf4-1559-466e-c635-08dd83155468
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B8oFLc6OHDwXF5qrr0d4Zi3F2e9tXsqBaKb9DZdWaCzpndCu5IgQS1YxKSUb?=
 =?us-ascii?Q?cAacfadWhs/8Ey2WYz3vRcpiMSly/IPkmaFMFbgN3Jzi6Bfq6G4lHADsVrF0?=
 =?us-ascii?Q?lHJXhsuKsfH6vjNOjayOONffs1oHdA16jgBx/ghArLGchG6HVCgDzYrrEwYw?=
 =?us-ascii?Q?oOL4zUcaB7FQB1fkz/hjb4n1lK0KBi0fDO9gdAQ9gaU5Z9qzShQ9mPiQcPfV?=
 =?us-ascii?Q?//xcIlCJ/6tTNyVbESPWoCv4DKQg56sSLEb3mtAkbxXMCGfESqy7kuxkZzl8?=
 =?us-ascii?Q?qFY/GWgwrShZCoGHOFCyv4M7lyuXw38JutML9BeZaqKac6v+mkl6fJM6rOYV?=
 =?us-ascii?Q?NiThtxi1rNoK4beYslyUlTo+b5QImbYgfPF1I9qzmPvwLJ2dRGp2ITqr2gDo?=
 =?us-ascii?Q?9xd9lc5RKn2OtGyiaHM9AbH7tt5feIKwUVk8iO/JF26UKRS+aKUwLy43Ne38?=
 =?us-ascii?Q?y8VYwNPH66iRvOANZ6JzvnMFFVPITQ1pItGlRZP09PWl9zdhlIfIr1iaiUDn?=
 =?us-ascii?Q?BISHTIvuPPLUF+YdAzLf5G3vIQtCrIT5Qbpz/UR5grFPrrGT2oSEi4GUZhSM?=
 =?us-ascii?Q?/Lr6EmFDDZPXVxWMnu/tDHXG5aXA6d2LaQh5kivxbUSclHedCO+QYaLVpdJA?=
 =?us-ascii?Q?j8QdAPePA7s4x6wf1SyJ/NFC6KiYiGvMZ449JiHkj7obmfOun3Bgyb+nB2sT?=
 =?us-ascii?Q?lDcohu8SpJCLsAmexmXHlbONgY/aOA8qDbcEhitDqLZxPIGA3GZCtNcBsM9K?=
 =?us-ascii?Q?cjvD5LvPA9Mcgl3GnwzIk0dyTEAtop8qjN4VlEKavnRD9Rga92yPSpcX0qGQ?=
 =?us-ascii?Q?wD9vTpfzgJ1eAt/0FZ24qB4Vef6CusCpWVjJt1KS/BtRFc2hM8xUfrmwozbZ?=
 =?us-ascii?Q?/eQDUz+F2hASepYwJxcwvoVxrBAofLmFoxS4lwEWVU96AGSZIDusLjWUsiT8?=
 =?us-ascii?Q?w2NiwFGJOl8nZs2YRzNnBEJOvJYAtztSaeKXpWmSNn3BBLW2nm07Ke3qbNsu?=
 =?us-ascii?Q?fwAAvBBBRH/CY/tlZP7HmXuB3ftorvSJACLDVIShpao/jOlnI2H28eYx24+1?=
 =?us-ascii?Q?fS9FDmRDngfE4hmS0kVpE7X0S8XFqEbKLF6B3xmCLX3E4b5POK8lUS8paH40?=
 =?us-ascii?Q?YSiBUhBVvcpvZUtcdZenzAz3AtaItQ3fgZ6/NyiTc86CuZIdTMzclTol6L3a?=
 =?us-ascii?Q?E2pKjRtOeVnWBcohGVJJmV2tvtSHqywxYFdhqgh63kgVYh/4pDAFmnIIAeNM?=
 =?us-ascii?Q?zTFfO+mL7vg/gS33wIohHPpfRX504cR8EBSFruHojkC9cSRt40HAW7KJq1K5?=
 =?us-ascii?Q?FnEu9+SEhOi1XZ0Vlcbr6DoU2hkWqY6pwUhVkDCXLi+0+IlwUqV21rENOklT?=
 =?us-ascii?Q?aMA2s6iJp0Q0osLde5tX7XJiggctFzb510Z5gr6UCAzEn0L2q90KzfPWSJ20?=
 =?us-ascii?Q?/DEIXEYagLY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PKVj2J0AGxl56w+VkGRGHIBaaq9L1U+zDQTxcTjkLUvpHptoYW1phH0C3Cpl?=
 =?us-ascii?Q?0dCdbuB+gSYn4DxtYP8ad7kFSmuDGEq6hfDYyH/U0SMzWDrzxAA9yAFLx0q4?=
 =?us-ascii?Q?b4xox+vzNh6xKAyl1uI0654YlnCKFAzzOziH5ujQT2bb4DrxR7nfF6XWYfuh?=
 =?us-ascii?Q?gs7jPpOsMmDIOSE0vJ7CTpOjRQld2V4BGTK3YvokmXAGigFHcAvIH5Yq81gg?=
 =?us-ascii?Q?rIUoDq2NJ3745RL6dOQctfROrUxw1ZTHvTWZpDCqMUXddhF4jDf0mUPSSPpI?=
 =?us-ascii?Q?5Mg2EfuddnJLtNm71Y9UeIve0hANIHGRgSlpxkS29p3jX7583R+OhfvN+kQ4?=
 =?us-ascii?Q?b9J9I8Fs0cmL742Cv8JWrQAMUDLXxV9VQ8KO2Feh4PE9QAR3S8jG0j9D4iIQ?=
 =?us-ascii?Q?4JvJkGa9zoCyfBTOi4hfmRMt9QaZJVOVAljp8ypohsIwYw0Z3C1n4yyr606p?=
 =?us-ascii?Q?ZcbagKnft88yEK+AvYfHe0X6lZz2bJaWrsN9Bp+vfkHksovVTMtkS7NZDfYd?=
 =?us-ascii?Q?7DhT074+CzRU6t6SMfWfQE8625s9ss1g9je3UI1i5DxBw0xRaMHe93HuxSA4?=
 =?us-ascii?Q?gMikHmjHzpIO2FRYH5abXj9NYjJgj4F83C1BQjIJpyX0lY+UqqqinlMu7tw8?=
 =?us-ascii?Q?FTVQiAZlqUmjOwsEAl42XPVVDE4bVH08BY+uMtbNvDl3uUQmE8sJLX36G6Pe?=
 =?us-ascii?Q?Yqwqh//dSH2YGvF1ysNsMs+6GcGYK87frVfCuRJJhgRndb4+y54hh3hwwIVK?=
 =?us-ascii?Q?ButIh+bFZvj2w4jehfUpTUfH7uF2LeoNZdOs4zwKU8ZSu/6pAVCemlnzWgXE?=
 =?us-ascii?Q?TdPD+f0NrC6e/25fCIPE12CtQFtyQpA2s0cFnkUzOJK5ZCSCXqbKK+QMyH6x?=
 =?us-ascii?Q?hbzYLBaDyRljVwMV52E0ZlEyZ+OdWd+qZt298Dhay0J10F1gIJLYACxukxFr?=
 =?us-ascii?Q?L8UzPZRyR4F/e6dPJaLftFU3q7nUd6d2OA5gQjH0oocSkZdcEv6GaWB9fl18?=
 =?us-ascii?Q?w/3eitEP2pqs86HPlIeHdKx7UQZ0e0b/yUl2ZorKW18kvxFr0s4Kk7DGMctT?=
 =?us-ascii?Q?Omhu4nOJJpS+Ehu6sd2Am4ame4miLPEzdBGx1FntxalxHY60y0yeH5jE0YC6?=
 =?us-ascii?Q?orDrKQbc4ncHLrbDUFg5EyNag7zD2jRoDuG8NHEjqBKfQCEHSogRx1+u3p2O?=
 =?us-ascii?Q?qlHTqawFaKMNS0kx78jmrgLguFXVbIocXaVk+eYEdUHVOLnuYxhfpOacixd0?=
 =?us-ascii?Q?dKBMPVt33olj4+jhibmoG+1vVNGpAN0f1SG7YyL7C5d28NkJKhccDJNlkVIv?=
 =?us-ascii?Q?Qi/97NFrWYVgezq+4xRRXBeFwDCTRW1y2FJ7gzRuB5/JJ331nMXsWG4f5jXU?=
 =?us-ascii?Q?UdQzDvZqXA8fJK6NL7wTiwAXa1QD/khNvBdZuxeelrAwMZ/eTpKl+fCtOHEC?=
 =?us-ascii?Q?2VSIn3JdKy2n31dL+WckbGYrmajsuOVXqIDEdfhWkPJ0k4CBCa7yJooul+eX?=
 =?us-ascii?Q?C8hd2K7wE8fpYF2ERAs2r/1E8FxA0AmKr09QKgXvk28dx/0We3PULiAJG14S?=
 =?us-ascii?Q?ubwffEESRrsX4qYGlrXSu6HKDTXA17xnQcRDqpIrSmbbBQfGS3ScYO4WBFcN?=
 =?us-ascii?Q?XA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UaGQMR4rhUB0cBKSW36cyXXNvfZucqFzGIoECaewD3UVy5YAd2Mcd0z5DuJcsmmx+IUskIk7yyHkc6DH3g0H+LcaBjy/XFAVehqNaJBynIedj4eCXHldV2Dsd4zzV4vsS2Mp6C8xUFzoEIsZWh+uDR5UsWcEroYD+6jcS+dv4n+C1Q1tGMowP3a0GIJhHsORfNJ9q3QznSsJiZCYEgaCGy5BP1WhnBTCq4p+aaVmRdN4auazKPdjq679AocoyBSZQ0p7rjJIpWAvF57UKeZWI/2PSEnhDp9uJATUfRk/QjaghtpDG9oUHarQsimFfHi2CMVDjhhDoMfkJcE+if2adCdXRyuIMWNKbc0tDJEtmpUXxC97hdXOMHUp1n+3/NQbFQrVGUAg+lBDW/HbC92F7muWAly/U//gZHFvFw6AHqQCHmeblJaxvBvx2TaEEboUUAg0jXtR2UiVrXrOHTjFhDfK2bLDxTp2yrTJSL/8sudVaPcekhRnF1HbbJIaosDNEETvLj2IAIHkTS0KvUiY3JeRGeGd69Opf5h9Js4423MiaC22Lz0uTPJ6BJut0vQc/hD8j9/eY3AjNHTmzuGx1Tii/4TLlV3eJdMTim8reRs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9dafcf4-1559-466e-c635-08dd83155468
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 09:49:39.1182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cBj3qdJn+SgEAdkzkewYriEYzI8d4+bToPGkAA09HKFOSlUZUgYUNxDayXl56ET4uRVcksyelhbEn7jb/+BEQbme8Jv00+kRjmMdR/4Zhjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5539
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 mlxscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2504240065
X-Proofpoint-GUID: yT12w1N1D6OqiLqpXAvPSmCzhr9jV5yo
X-Proofpoint-ORIG-GUID: yT12w1N1D6OqiLqpXAvPSmCzhr9jV5yo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2NCBTYWx0ZWRfXyM1tP0Xi+Pdk pGB5IltEFst2yHMeOp5E+LFGTDkhcDEHjeVZbUPkaKGe9mOXyk1Sd+Lw2/2xN20/pHYwnwCsa46 XHB5oQw5Q69kTMdZQCszG7AXTVNODUM0fjRKt8/lEjiz75yQp0/4pKw40zNAOnATW5XwBa/nOb8
 YTef0Ibt4MqUxT3kSwys66nhx3yNlxLSFC8Bdl+1/BsoSVtv/14lG5wp4Z1Ee3CDdZeUndUYZqp RGvDdRsiJhCmu3oIWVRBWEUGyJ9bLlcXqPZ1ojRpjDpHAqDJ3ACnsn3XNIB3SIWYDgaYE7oXM+j vY4oXUgwcVmwdLLuhzb5qx8WyJKfsQIVta/iQNh2AzvPbz1J+N08qcv/r0NqIKyABc1PHTBvFef VZbYzxwZ

On Thu, Apr 24, 2025 at 10:45:36AM +0200, David Hildenbrand wrote:
> > > Probably the right way of attaching such metadata to a VMA would be
> > > remembering it alongside the VMA in a very simple way.
> > >
> > > For example, when we perform a reservation we would allocate a refcounted
> > > object and assign it to the VMA (pointer, xarray, whatever).
> > >
> > > Duplicating the VMA would increase the refcount. Freeing a VMA would
> > > decrease the refcount.
> > >
> > > Once the refcount goes to zero, we undo the reservation and free the object.
> > >
> > > We would not adjust a reservation on partial VMA unmap (split + unmap A or
> > > B), but I strongly assume that would just be fine as long as we undo the
> > > reservation once the refcount goes to 0.
> >
> > Yeah this is a really good idea actually, almost kinda what refcounts are
> > for haha...
> >
> > The problem is we talk about this idly here, but neither of us wants to
> > actually write PAT code I'd say, so this may go nowhere. But maybe one of
> > us will get so frustrated that we do this anyway but still...
> >
> > Then again - actually, is this something you are planning to tackle?
>
> I hate this much with that much passion that I'll give it a try for a couple
> of hours, as it might fix the other issues we are seeing.  So far it looks
> like it cleans up stuff *beautifully*. Even VM_PAT can go ... :)

To quote a film, let the hate flow through you :P

I mean I am very familiar with this - vma merge, anon_vma, etc. there's a
pattern... ;)

>
> ... and I think we still have space in vm_area_struct without increasing it
> beyond 192 bytes.

Hm, so you're thinking of a general field in the VMA? I thought this would
belong to the PAT object somehow?

Though getting rid of VM_PAT would be fantastic...

I wonder if a _general_ VMA ref count would be a bit much just for this
case.

But maybe I misunderstand your approach :) Happy to obviously look and if
not like some crazy thing just for PAT (you can understand why I would not
like this) will be supportive :>)


>
> --
> Cheers,
>
> David / dhildenb
>

Cheers, Lorenzo
