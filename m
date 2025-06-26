Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56145479B
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 04:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750913294; cv=fail; b=Pwzx1pqbAka51UC710ak2r10ziCiLKsCZavAQSW9eReyXNO3bcis56nOs2slmyuTLmArEOYyEM7HioxlUc2XWcf1U29ZMSsWvmg6/rouZV2xz+hRYvSoVEx0wl6gkplJF0UIE2Jsyh43SHTiS0fufwhsYnQAVjSVkgU5OjbjFFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750913294; c=relaxed/simple;
	bh=IyXPsnlaYikP5FmBcb0TjF39UvzcV6X6lGsPw3nqMpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cGiHnON0Q57W9uE9WQvH56Y8A+A5wyBvLhP7n159lXfLdpKEjag/BENDn9t/BPsu9oiyW1QiqNrO8oAzdXjmK/qxnP3IHhY7HNIP7N/806u2f8t13ydDLTUUxQNhnAe0wWmvVjHSQjKZ/cskkev6KL4OL2aKS/nEwqSWaVjO9Uo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YxPssu+6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TB0igf4F; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YxPssu+6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TB0igf4F"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PLBeZB008014;
	Thu, 26 Jun 2025 04:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=I7PWoHNSDnR7nnLpXo
	g6ZY/IeEfN8y7Iw3IlwPJ5pts=; b=YxPssu+6fHVRTWKNxIeBYmHZol7ra7v8qv
	lwsFQZbEfuZUXiPnG7buEQpOJ2/4XUgkAEuLgScLJkp5YiRGEVSuXH86kW+WkDlZ
	EEZlVIaOTD8hV747x1w8qzg+taefY2ZZD0R62omXfT7/hCOZku3g+VAx63Wy1Jcd
	ncWQ8n47cwjqyqA/MZ2f0ndEAKSWxuwf2oF//Wh0WvcWuQ3n1/wSSDLYRhhGJhhX
	T+5FFh77RLOg43ABDfz6COicIi0OnwajjnRbmkLsbyMy04jDQ7CleNoSsT7zbCQK
	YcPUjIyyYaBRztEwVDJah1qKJ8H9IEHCgx5QsBEAZX0ymnAVjlZQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds88110v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Jun 2025 04:47:47 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q2OGJl034640;
	Thu, 26 Jun 2025 04:47:47 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2052.outbound.protection.outlook.com [40.107.96.52])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehpsfbye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Jun 2025 04:47:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GnFSvnhs751yZaDJx9ZHWM/P6CqBVe4NmeWFIFqtojyiSciA+q4MKrVOwetiDiWZUbUEnFuHKgNaJLj6n6bC47Nqw5emyYIgZshKGFFnIDzD9qv2kWf+mRPyL8bSesoZSJq1ByQ2oZUmiN0u991pjs21kml7CNF6LYwIBu3u1FvJg0wYMUqUG3AD1WFK5gmEn1N8+ViCUf4FClkpYiq/Bm1VBjnRWI0I3cal1AvH+lFQugBbbVxS0BFVpWYV2mpgF/wIjvJ87IYeUOKuwV0Woihoy0/DWDnyrjPDg4Mb6teEOwSh5TB/aLfh0kgAthKV8LfM5pJFW7t3j8tjktY8YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I7PWoHNSDnR7nnLpXog6ZY/IeEfN8y7Iw3IlwPJ5pts=;
 b=F+DNaO39jFqArjA2phkFj0EzjS0/XYqo4yZQVMdCnlciMLNO9SA5K6ppABZ0SM7a+Oh1lxe5TVx/LfDdu5X6s1LEbz2CsmYwkqnS++U6PrvFXHvaVNhpg8CRmdzMQLRJ9ZLszCQWHsuAIdoWKYL14vL4HR9eRHCouQuwz9/05sfuebHw/i6uzYlqqTofMcHfNhh+rhXYjw30O0BFbODq7EXxggcVOyI2EbSuNWXpBdKEobntSFP2f6fjqhjxUQKUzCmnNICzOcu6t279jOil59RZ8Y3/gpi+dpmxNSVKQYuO0nkICTckpI6qcVdfi3/duazWFmAxhqINSk8XVyaYdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7PWoHNSDnR7nnLpXog6ZY/IeEfN8y7Iw3IlwPJ5pts=;
 b=TB0igf4Fa4CXqY53dLGORX8dqr2DEyxYMy2RMTOvVOsG5RXdAfjFwOq469vftle5Niw+KWWKZ4x9kgHAfQeXHOJvaXrX9pKoHZzXuysaK48uEJwSvpiWHsGIE+v2yXJzDgB6agbaHKFbFo3qCKNDD7EOMUp9oIuPoj69wKo1VO8=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM6PR10MB4140.namprd10.prod.outlook.com (2603:10b6:5:21b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.32; Thu, 26 Jun
 2025 04:47:45 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 04:47:44 +0000
Date: Thu, 26 Jun 2025 05:47:40 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com,
        baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, baohua@kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] khugepaged: Optimize collapse_pte_mapped_thp()
 for large folios by PTE batching
Message-ID: <e9b027c8-9db9-4950-8d25-9984ae0a4de1@lucifer.local>
References: <20250625055806.82645-1-dev.jain@arm.com>
 <20250625055806.82645-3-dev.jain@arm.com>
 <71350398-b5d8-45b9-b05c-d2b63030f766@lucifer.local>
 <8109236a-9288-4935-8321-dbff361dc529@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8109236a-9288-4935-8321-dbff361dc529@arm.com>
X-ClientProxiedBy: LO4P123CA0440.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM6PR10MB4140:EE_
X-MS-Office365-Filtering-Correlation-Id: aa06806a-fca3-41d5-74d1-08ddb46c977d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fiWJaK4Ns9p527oCYLoTGkQf4xJ40gfPhOem3YPCgUTPwyaRwfw2WE6NnLdN?=
 =?us-ascii?Q?HcBhvbT1ziIrKq6x1AJJbH3v4vh5aR9J7Z6mT1PV/zGSs/TL8zDAdWW3OHQ1?=
 =?us-ascii?Q?AKs0i2C9//+u0Zjs0Pau/HpmJ7C8bxqpbIcKB9Ck7VLomRqn7Fe9Y9BhF1uu?=
 =?us-ascii?Q?Pg43v3HKl2Jqsa+6X5rL2YIsBiLfX1ddA3aZdMNfADIhYiHmHvnQKDhBeYwJ?=
 =?us-ascii?Q?FP/GUN5JOF7a+QpW+4ZaFHGo7qpi/SEmm/GJBHq45tPbp4KCZEHaoC/zCNKf?=
 =?us-ascii?Q?9/pQA1wxK80A+p+RNMhm746IYYGKQjI9jmCntWzRBJGrQFn6K5smqB25AM6O?=
 =?us-ascii?Q?lRnjmdM7UWwbJ7RBMRB/vSSxIBRtVDyGAzqBTSEZbIWaBbMQjncR5cEbd25Z?=
 =?us-ascii?Q?bPy7kf3cxB21IhBJ1t54yNnVrctc3AxpgRP8JyxgEoQA51EZXAsK1eVR8cuB?=
 =?us-ascii?Q?kiTSZHffB/1fVTmtqIPEwKLE7KjgAEQy7ZWZ/sD0bJdNMr/NEpNUSGf7bgGa?=
 =?us-ascii?Q?eu7Kp3TMwze4s0fof5Hxrmwz+7IMv+5QLrb3z9WKJFqJoY+wn5dlRvlXfnXa?=
 =?us-ascii?Q?1znr9Z6kpwCKWORoBjrXZ+1tgdfLhHZUphsrJ0e+xOFUAlsGPUanzf7gqNno?=
 =?us-ascii?Q?EasU86IoCpHzjvXRcjL/GCch4s4C7Enchm5+tFsu/pRRxQpdOZacMTCNliB/?=
 =?us-ascii?Q?vlhnHADv6zcNdL0CzX2jleICPZ6wVH0ON2DMW0UFSHuismGyzd1J1juXWKGm?=
 =?us-ascii?Q?JXdcdAGnp2v0kfGNiaHPgQnwh16bMdew3SKHCVDU4FrfMvOt4N/+hQhB0BcC?=
 =?us-ascii?Q?Eumb/dj+pguK+0qPXES3y49DWb/kc0w6uohT6QVJkwyvCmOOidfHgGA44jb5?=
 =?us-ascii?Q?ApKfUVG9vIxF8a05DYy/d6313wBDqLX2KTGHMbWTJhXYqSp7csAxjFGjB07u?=
 =?us-ascii?Q?xEDFoHmAoABu2F8cgiFU0Fe7fb7eeTVWIYY2t0KILNXWkpkqCtgYrau3E9pz?=
 =?us-ascii?Q?Gi1gmwk/CY+fn32YRep8mXG7OVwcQ9XDXwA857wAWWgkY/UT5yIAlbM6b1cZ?=
 =?us-ascii?Q?bQtThRjUoDL8LPMxQ8h+tiMCDrS9PNnBG+pgEaDApEk8a63+/ugY8ZwkOaIE?=
 =?us-ascii?Q?/o4ld4iSX8NF0T3Rt2SDfWGn1jKI0joz5M7euokG6hGJPfq+1a1Qqjzy/eLu?=
 =?us-ascii?Q?Ns53ygMhVD3E5OVgjC3/PKrMyjAEmqndZXBZWAZP2Yh4ESFP3X34Ig1opSHo?=
 =?us-ascii?Q?CQ6voQc3KDNO4noSFMvxheNF/7XxUhzhwOhj5yjCWHZ31cT4NmhgsoGSWmbt?=
 =?us-ascii?Q?lZyRiL6/8cMy9A26fq7PBW7O4uoqcQnyWoCexZZkCcw+L2fSGhlHvcpoA/pZ?=
 =?us-ascii?Q?/+hANxkuDtQSZFtpFFkyUT8ibh5OK/A+9GrtjcU8mkqsIGvWJg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HEoArLZI+TH3HOp/Dro4WEC58SCD8cQu32oWLGRuXj3xjNYVxEPaYZwoHf81?=
 =?us-ascii?Q?o8jlJbgVH2CEFEshZN+N4wFT8gIuxVlVgr5+Qj546m7MSThQkroWYqGfKpV+?=
 =?us-ascii?Q?0rpundvD0sSRdLeoRjMRblXGSDfgUsSpDaEKIYV3QIgIHe3YTB047rfHpCNF?=
 =?us-ascii?Q?b11xFlnPi2j4i8ue1I53AA5xdDOuFLqVYz2B/IN9qmE8Kwlh9a7j14RsbEJL?=
 =?us-ascii?Q?yeyirhMM9DorJg9k0v+9ayG3tWMWuzTUeA2zrZzYEYxqgHzxtWggxP81U/wE?=
 =?us-ascii?Q?jJh2+GRBik6ifkIuXoSGJDYFiGOUsTA0vQC4N0XWwi5Iz/C1NukDwkg2Fr2I?=
 =?us-ascii?Q?iMDUFsfnZdvbTP7RapHpRvPCrZsa+w2Codd8B/c8QlltO4zBdUWG7jQo2H9X?=
 =?us-ascii?Q?1FaAJFdHOvnNypSnDECH+JO/hUcWDP7sM+ZhBcLElKyiTKE5LX5qzaAxNtsI?=
 =?us-ascii?Q?CoYZBpeIJw7sz8/NE6JVdvt9E20Fftn2XPRss0duPFCiVlFY2mcHEPhDiHJy?=
 =?us-ascii?Q?eXTmyGmzxNNC5zAloxyJcEc6kUrzR6MmMBjOZac7NR+mupu6VjR+vfY/VJcP?=
 =?us-ascii?Q?OMaORAoW1u38QTJOZirtDDH6oJth2fLd1E8SvZyb9H0LP2DKXyEOSeFZ4lZA?=
 =?us-ascii?Q?oKn+j6BFYmSc+0WyCQRdCwkUeS2L3MbtGbMTa2DV5wnxVDvcmu+TRZyKtaxi?=
 =?us-ascii?Q?6pXuSXLI8evY0p7+7oTv0/TRdjgHub7wxQ36JAkulAvoGupmzf61OXzPUTG9?=
 =?us-ascii?Q?PF45AgpjJKYxbFW66+x7Hlbd9BbrGoLPB+GovMEPG8znpL6h4egLoKmN5r1+?=
 =?us-ascii?Q?MahuGQ0HitUQdHTKGREyg/ZToQOwrYrIIEXyZXT0jWxTgtu+MXUEEo1xiHj8?=
 =?us-ascii?Q?eQzjygbYQnVUv+N8IWsSHts+f2Wlyj1Z2plt8kAC/jKsvSBx4Lw6AZeh1j8u?=
 =?us-ascii?Q?ZhDD8qNX6WehnMEoD+F5pkGsGm01cWdYpnQANmKcRCUjQXJtRRqtHANqVZiX?=
 =?us-ascii?Q?P8+tQGfRBMffI0BH5SOtT/Axv5EpQdSrp6UHbTJUmJG7XOjmKWgDRl4JzgGw?=
 =?us-ascii?Q?7eQ09YR8alQyXbJRDM0nI1UJhbxoYROFmohXPlG1CZX3JnAoa2cHfltHgZFQ?=
 =?us-ascii?Q?7uItyc84k6tUnrPW9DpCHH0NAKuzjRxDLfcSbD1JGMk7w2vqo7VswISxXr9w?=
 =?us-ascii?Q?9egAzIQl5M6HzdBDIaIewKX0iOiGlr8swqrmnNDbrLak8tP5N9toSg5u/5q2?=
 =?us-ascii?Q?svItRSQbcJPTi6ePAOtNMZzm+Xusnu79DAOZSYLZnE2mBAbBHsqNkySQKtT2?=
 =?us-ascii?Q?C+7Yn+pByjCvvBfNY6VigmW7YnXKFms5NlrjiV2jYkUZLSE3TO12GFRYKqqW?=
 =?us-ascii?Q?r2CDkbuXnA7srjSYnjFDGFL1pm8S6ngb27n3RvUIy01H6gn9v+Z9Av8zYa5+?=
 =?us-ascii?Q?vL1AcIuSX+sUaf5PIqnTkcbUTNjO1qYwj4KCyUKuOLKpfaekHFPO9Cik33Bk?=
 =?us-ascii?Q?OZFrgR3Pv1mUBQzUEDH+7if/kv1i8dOv6d9Mo1pa7EHLmgsrb8/gABTK1WWZ?=
 =?us-ascii?Q?j47n5AK0L/8oV8tDcu3JAefhfOg3dT+t5hheSzOl1xqUi3Q0kJINnI+2PdU8?=
 =?us-ascii?Q?Ug=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gENe82QL+7bvibS9guGLHEZ9HW51kQ2tHn3DpFvwTiYef0oMUkO8SN1RrZwUKejioNwMRtvW63CK7Dw9EkhRLITUlAkLyB94zFy7PYoN+972+35kjM3a/DUMOv3ConpwqJuMMfirWwZHQLuPNwzDOx8rwFFjA/xpbLHRJAKsiHrGT0bO6Zo2TkB0Z5O65ozHvwx+isPWC5hq+7MZ/CcwTM40Z5JFEIg2wV+XVnz+xaI7OM59+XOExI4eVsFy/6wl7DgxrkODejSq7euh+Z8F2sdzhoJfcJDOa7D/kGj2bfZtEQ9N+5ujU6skMRgvkb2BlezyTOQZhTs5/pCOmCMZ/IsGs0VIEAeu8NhmHPEPtNpr0ceiHPbokf4ct0YXUxCj484jpXRNzM2SrWCdQi1zlqiXZfiRJmwy9DK/ZJ2kn26+/CnwKuqCXMorZx+iufaHdb27Js3u5UWAoVGaYj6b3Yougz4I8ktR9pDyJTTsM4lSBisCAyZejsvS/MlgeHSmBc1DFZsv6mSBXTmKVlwIelswL2FvOqalMKlysqr7ZkppvTbFyXffMLzDJkeGLJEMLZeYzzVs0sIXDMywHCw3CrVghuYxeKyy7V3Fgp/S00g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa06806a-fca3-41d5-74d1-08ddb46c977d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 04:47:44.9044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nJsQmZHaXsrkV0jmfZRDURUmCZEHTFKzoEruuZSHpF37shdWygw3SPEVa28q9ZyfMnkR4WPiey7YbDGbmhsf27LhAyZVgUrE0NJEzHrJXjI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4140
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_02,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506260035
X-Authority-Analysis: v=2.4 cv=a8gw9VSF c=1 sm=1 tr=0 ts=685cd0f4 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=BJWgnSjz5l2HvNc8uP8A:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDAzNSBTYWx0ZWRfXy1EzsgQPGihV biKWd/5uXpMiciwsNiw/9tlgIMCR2oJfhuxvGHmVDnsmQKcSLfonXqaIFhEVsW7eGv+ilBhiW6T feyxaZLSjzyua1NKxDiH6Qq1y/lR6tERMe3MvFdwzbqJte2MuJcLcwT3QHIhS4H3KUAt8zBjZ+l
 hQBoSzsw1/kPX58hCNf1BvQUwq8BMbiZSTEso06NoCwHY4gKP1EYZFeiHlVTyZXB25KIpY3T11Q +pUmWAXjychXNv6WO9j+obNZ2XVajqPgEjLuMCbj2BKRSRK5TGSdtlhqH5wHlGdKrBNdChjonni /9MpBpxLtPywFxXhNDyYj5VW0L5/uugL5Jku5TPaPM+p3BMuxnzyZzaYMSkkM7JPG75yrgJ6q97
 Nr1i6LhNx4BsfNnUV8HmGzRa9vQL0lRysFfr9M/98KSUqfrwNmycSCCim9FW+/OnsFqNSz74
X-Proofpoint-GUID: pw1crAhIyqHc-ZuIcr0DBaH51y-8JePy
X-Proofpoint-ORIG-GUID: pw1crAhIyqHc-ZuIcr0DBaH51y-8JePy

On Thu, Jun 26, 2025 at 09:18:47AM +0530, Dev Jain wrote:
>
> On 25/06/25 6:41 pm, Lorenzo Stoakes wrote:
> > On Wed, Jun 25, 2025 at 11:28:05AM +0530, Dev Jain wrote:
> > > Use PTE batching to optimize collapse_pte_mapped_thp().
> > >
> > > On arm64, suppose khugepaged is scanning a pte-mapped 2MB THP for collapse.
> > > Then, calling ptep_clear() for every pte will cause a TLB flush for every
> > > contpte block. Instead, clear_full_ptes() does a
> > > contpte_try_unfold_partial() which will flush the TLB only for the (if any)
> > > starting and ending contpte block, if they partially overlap with the range
> > > khugepaged is looking at.
> > >
> > > For all arches, there should be a benefit due to batching atomic operations
> > > on mapcounts due to folio_remove_rmap_ptes().
> > >
> > > Note that we do not need to make a change to the check
> > > "if (folio_page(folio, i) != page)"; if i'th page of the folio is equal
> > > to the first page of our batch, then i + 1, .... i + nr_batch_ptes - 1
> > > pages of the folio will be equal to the corresponding pages of our
> > > batch mapping consecutive pages.
> > >
> > > No issues were observed with mm-selftests.
> > >
> > > Signed-off-by: Dev Jain <dev.jain@arm.com>
> > > ---
> > >   mm/khugepaged.c | 38 ++++++++++++++++++++++++++------------
> > >   1 file changed, 26 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > > index 3944b112d452..4c8d33abfbd8 100644
> > > --- a/mm/khugepaged.c
> > > +++ b/mm/khugepaged.c
> > > @@ -1499,15 +1499,16 @@ static int set_huge_pmd(struct vm_area_struct *vma, unsigned long addr,
> > >   int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
> > >   			    bool install_pmd)
> > >   {
> > > +	int nr_mapped_ptes = 0, nr_batch_ptes, result = SCAN_FAIL;
> > >   	struct mmu_notifier_range range;
> > >   	bool notified = false;
> > >   	unsigned long haddr = addr & HPAGE_PMD_MASK;
> > > +	unsigned long end = haddr + HPAGE_PMD_SIZE;
> > >   	struct vm_area_struct *vma = vma_lookup(mm, haddr);
> > >   	struct folio *folio;
> > >   	pte_t *start_pte, *pte;
> > >   	pmd_t *pmd, pgt_pmd;
> > >   	spinlock_t *pml = NULL, *ptl;
> > > -	int nr_ptes = 0, result = SCAN_FAIL;
> > >   	int i;
> > >
> > >   	mmap_assert_locked(mm);
> > > @@ -1621,11 +1622,17 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
> > >   		goto abort;
> > >
> > >   	/* step 2: clear page table and adjust rmap */
> > > -	for (i = 0, addr = haddr, pte = start_pte;
> > > -	     i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE, pte++) {
> > > +	for (i = 0, addr = haddr, pte = start_pte; i < HPAGE_PMD_NR;
> > > +	     i += nr_batch_ptes, addr += nr_batch_ptes * PAGE_SIZE,
> > > +	     pte += nr_batch_ptes) {
> > > +		const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> > > +		int max_nr_batch_ptes = (end - addr) >> PAGE_SHIFT;
> > > +		struct folio *mapped_folio;
> > >   		struct page *page;
> > >   		pte_t ptent = ptep_get(pte);
> > >
> > > +		nr_batch_ptes = 1;
> > > +
> > >   		if (pte_none(ptent))
> > >   			continue;
> > >   		/*
> > > @@ -1639,26 +1646,33 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
> > >   			goto abort;
> > >   		}
> > >   		page = vm_normal_page(vma, addr, ptent);
> > > +		mapped_folio = page_folio(page);
> > > +
> > >   		if (folio_page(folio, i) != page)
> > >   			goto abort;
> > Isn't this asserting that folio == mapped_folio here? We're saying page is the
> > ith page of folio, so why do we need to look up mapped_folio?
>
> We need to check for all PTEs whether they map the right page or not. This may
> get disturbed due to mremap and stuff.

Right but I'm saying mapped_folio == folio right? You're literally asserting it
here? So there's no need to assign mapped_folio at all, just reference folio no?

>
> >
> > > +		mapped_folio = page_folio(page);
> > You're assigning this twice.
>
> Forgot to remove, thanks.
>
> >
> > > +		nr_batch_ptes = folio_pte_batch(mapped_folio, addr, pte, ptent,
> > > +						max_nr_batch_ptes, flags,
> > > +						NULL, NULL, NULL);
> > > +
> > >   		/*
> > >   		 * Must clear entry, or a racing truncate may re-remove it.
> > >   		 * TLB flush can be left until pmdp_collapse_flush() does it.
> > >   		 * PTE dirty? Shmem page is already dirty; file is read-only.
> > >   		 */
> > > -		ptep_clear(mm, addr, pte);
> > > -		folio_remove_rmap_pte(folio, page, vma);
> > > -		nr_ptes++;
> > > +		clear_full_ptes(mm, addr, pte, nr_batch_ptes, /* full = */ false);
> > > +		folio_remove_rmap_ptes(folio, page, nr_batch_ptes, vma);
> > > +		nr_mapped_ptes += nr_batch_ptes;
> > >   	}
> > >
> > >   	if (!pml)
> > >   		spin_unlock(ptl);
> > >
> > >   	/* step 3: set proper refcount and mm_counters. */
> > > -	if (nr_ptes) {
> > > -		folio_ref_sub(folio, nr_ptes);
> > > -		add_mm_counter(mm, mm_counter_file(folio), -nr_ptes);
> > > +	if (nr_mapped_ptes) {
> > > +		folio_ref_sub(folio, nr_mapped_ptes);
> > > +		add_mm_counter(mm, mm_counter_file(folio), -nr_mapped_ptes);
> > >   	}
> > >
> > >   	/* step 4: remove empty page table */
> > > @@ -1691,10 +1705,10 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
> > >   			: SCAN_SUCCEED;
> > >   	goto drop_folio;
> > >   abort:
> > > -	if (nr_ptes) {
> > > +	if (nr_mapped_ptes) {
> > I know it's ironic coming from me :P but I'm not sure why we need to churn this
> > up by renaming?
>
> Because nr_ptes is an existing variable and I need a new variable to make
> the jump at the end of the PTE batch.

I thought you eliminated nr_ptes as a variable here? Where else is it used?

Oh how this code needs refactoring...

>
> >
> > >   		flush_tlb_mm(mm);
> > > -		folio_ref_sub(folio, nr_ptes);
> > > -		add_mm_counter(mm, mm_counter_file(folio), -nr_ptes);
> > > +		folio_ref_sub(folio, nr_mapped_ptes);
> > > +		add_mm_counter(mm, mm_counter_file(folio), -nr_mapped_ptes);
> > >   	}
> > >   unlock:
> > >   	if (start_pte)
> > > --
> > > 2.30.2
> > >
> > V
