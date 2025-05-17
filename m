Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D894C2147EE;
	Sat, 17 May 2025 18:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747507905; cv=fail; b=ATwUx+m90HQTwUp7Aglzn7aK1mVQrYv2ruAEEI31FHD5fcFiCYDT4ZJVVpPv9/L9+PQuMsPPsxchi9M/bTGGjH3AKrgnJW8bCeScvRUPdhKSdjdjvV2hXe6+MQCOX74SXjHEB4Zu+sxv04NKCC4H5h3FxEz/KNVVLCZjPKvKXck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747507905; c=relaxed/simple;
	bh=78GthYmIkVmYaO55FW6tW4nWEKGp/2DSEfaEdGfb8gY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EwXyjYq0heF2iI1bkM/1SYttkR8sj4Y5pcu+MwEEN0Gdf+dqyMeitrnQe44JVyMYtYLBsATbaXRvDLsuaXcu//+RFGyn7HO152aOx4EY7a4H8JAG9i8FwGXIK42wxzhjjYtEk/BY05gp91t9JJwtIIvHB1rJL1qOd8gmYMo1fjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KjKQRaCF; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=M8dpMmpH; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KjKQRaCF";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="M8dpMmpH"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54HI4ClT027274;
	Sat, 17 May 2025 18:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=xF6JvaE1/7yLiuGwPx
	PlAWVdzQEszMFeLlvFTc4B4HI=; b=KjKQRaCFRA2FVhg5uckxf5+dxyi/Zw4LpN
	0JJh7JVmai5G/0oUL0CHYyXMXqezJuI8addLw3z8+rStw5tzXLAkgy62oHSd6e+N
	JOGSPWSGZcWLLkAtp0IoILB5TqK9p7w/DnbjwQlkKvtgNMLNLxqnU1dORQkliXDu
	auU4FHcQQ8ZNk0ceZ77IHOYLIeIh8rqU2sicAgiyun2oNXCyS5Fwg6YYathlwezz
	yjeKM75Gm4WypPcdBP2LjXVqZMUov1QDYmlPisLeXRYtrZz+00y6w3QTioHz+dLF
	KmTOBgDxwjUQyfKbQtC4hrkyO+RbZ2Gs7zQHTmPGa6JGnQMRFioA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46pk0vrfhg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 17 May 2025 18:50:43 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54HIe83Q035192;
	Sat, 17 May 2025 18:50:41 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46pgw6542f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 17 May 2025 18:50:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rVRKB9Zf9ostCUay1noXQVOB6FiRmwLPeY7VfSEk6vqzi94oIcc4XyrH1A6z3DTPw/c80NF/FdSgi2aztFz2WpBU17Z3uhttPoS5lItGZuvjvheJ+itXptiO4icCwA23cLtQhMbLdIHiV5DXoVidGDKt2cf0gwU6QZlpvJqrA0U71aIFF44U9ZKh1pp/Ov7U4xLenCqHopF0wwcA2WXOUxU25fAFzJ64yivPVmYJ5Gq+S9Iv2a0rM+eUduJV+AYHlNaQUxD10GLhbmLZ5IfE+zx8Xi//RDgXV73NRSBIoI6CCmmMbWJqskb83Wp9ryBWMNw0sp7huQpYc0XlGgAlwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xF6JvaE1/7yLiuGwPxPlAWVdzQEszMFeLlvFTc4B4HI=;
 b=MsKaNNq70P2s5sbIhTNhq2FevoPP+41rbqozJLE6idnpsUMT15z7A0kAsEHbogEwXJRBLFGL57rNhiN4FOjyi05LfX0w8dQO16CpOK3Im3yfXQqUWvEvOAYMMEyKa/fNH5RoFU2ZQCiUc/NbG7gOu/mxnqGoBO0DPs0wknedpN+Osa92iQwo/hptRb55QWDca2c23fKiGS3O1SBuwh/JXEQYeRxvvWPXglVJjQ03v2zA3MyDfFCSFRi8bwgdOUKIhIGcdQwvepzEVTNZ6JLFm13QbYs+2mhyPSqYLB9VM0ZwSb3jVmKcYDqr7ZAiIKA0HBvxZUh0adbH9rgTBqCW4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xF6JvaE1/7yLiuGwPxPlAWVdzQEszMFeLlvFTc4B4HI=;
 b=M8dpMmpHNKim/fpoXwsSl2pUUcXMGxaQkRi9M+WeTvYzBMWF1Az4oJHnXu4ad3YP5Qz/soAd14MXZCfHm7InuHaoaMBg+wENp/sBWmqeiQXt5dputXMMz8zDnZplczxSniMA3s3X+s8xZK1AuAsBePtwE9hZHTUISdEB2jABk4Q=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS0PR10MB6125.namprd10.prod.outlook.com (2603:10b6:8:c7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Sat, 17 May
 2025 18:50:37 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8699.022; Sat, 17 May 2025
 18:50:37 +0000
Date: Sat, 17 May 2025 19:50:34 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: SeongJae Park <sj@kernel.org>
Cc: David Hildenbrand <david@redhat.com>, Usama Arif <usamaarif642@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
        ziy@nvidia.com, laoar.shao@gmail.com, baolin.wang@linux.alibaba.com,
        Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@meta.com
Subject: Re: Is number of process_madvise()-able ranges limited to 8? (was
 Re: [PATCH 1/6] prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the process)
Message-ID: <005161f7-d849-41a9-8350-f56e52c49e7e@lucifer.local>
References: <c390dd7e-0770-4d29-bb0e-f410ff6678e3@lucifer.local>
 <20250517162048.36347-1-sj@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517162048.36347-1-sj@kernel.org>
X-ClientProxiedBy: LO4P265CA0084.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS0PR10MB6125:EE_
X-MS-Office365-Filtering-Correlation-Id: b1840c55-b2c1-4f81-77d3-08dd9573b665
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Mw/73fVmptAONVjUgrnHMycRJkCY1/qqTEs3O6H9ZaROWWnwHx1cnwkhDvip?=
 =?us-ascii?Q?VukjaPlI1MFHS+oCEHvZHJm51Pyznvz/pmIwFG7LSACs6GeVGA75ax6QzHBm?=
 =?us-ascii?Q?ZuJlMk8s8y7fnnbhPGqKTNtRF1t4bjObigUJ6HoQC3rbRCYa+n81e7jQvYiq?=
 =?us-ascii?Q?hD8PibTv3gMbjxR/V0Nmcpa1XcdKM2Unl0hRKOVo5248728cTHFR6PyQTXFt?=
 =?us-ascii?Q?Jnu88kKzOelju/rvGeHPtj6Ywftvny9tea/kaEXSRnnYQYMmb3O1IKQORsnQ?=
 =?us-ascii?Q?RQyr9WeqGWx8WTkaX7IaI5gPDyChJHRHvSkUr7alAPii5aB8YBUdgfFT+xk6?=
 =?us-ascii?Q?c2YTgNqb8cHJpbXFf8sjN0DIGWPrZjDIVYqYFo2A7+JgcdKs2ylcQ7CZmdA+?=
 =?us-ascii?Q?ueMFiCHH6NO0AmMKfbx9vVqCMQ6d+uApyHzanrYmOW+7bDG8yEFnhMF9dtRg?=
 =?us-ascii?Q?lHmsmS9tUHxSXjZz13SBP7BRTJiwH8q5q+HlWAEfW36eVtQN5j5laXKSF5nP?=
 =?us-ascii?Q?UA+jsNPOxB0rYi4MABx/0M3mjO4iF5xyUYoMaCMFjOPtr9R3/WpSKuh1IKpg?=
 =?us-ascii?Q?V55m25Wduu7ywGS5VxWmr8QvICsvF3MRfBvd6xpXhjjICu1SQdzPSvvSiMfq?=
 =?us-ascii?Q?g+eQX+IBqFvSdzRiaWk3giGOZTTsio/mRtFbq5RWjfuIM8IK6pck+F2rNZPw?=
 =?us-ascii?Q?Y9mtHC6IjMzEQOlU2hMQK615tjqLp/VhrvvYDDvNaEqy+YRgitjWSXIUl3d/?=
 =?us-ascii?Q?76UsiB9SJPVKytjX0bRJcQv4UPQJBjnSBy0tRVsMnzvv5jdtpB86wsjclFy0?=
 =?us-ascii?Q?uTWHd2SmutPb0C7mVGcFal8R6i3C7mExooXQCSlaGel+hHRlI5ZTOdwkYy7w?=
 =?us-ascii?Q?MWsRjJ6S7OOCJUUhH378VTC5rt8HNa+1zcdVjoIIuEhVgkxejfIrRzqMRTWF?=
 =?us-ascii?Q?xHea67rcR0JBQWapSza2/632hVuBzrp+HOANjpqBv9bXXZhenPRcJhj6uUxt?=
 =?us-ascii?Q?GD3GIoI5kuDanaufTMmbqtZXkp37+j1Q74WUBqYuRaazMThXgSFqy8Y5ZrWA?=
 =?us-ascii?Q?KGc6RuBMol/HX+t6oVfZHEBIO4lwTY1kb0gUxULEeoCFyZdHmoGx2vgdIYXa?=
 =?us-ascii?Q?H7pD23WCCjItMcdkK9/nHabbydwy5E2P8pwB1P7WIktbKSgSovEYAagy9O/Z?=
 =?us-ascii?Q?Y5+ny0r8OU9Is8QRv+ZTV+X8WH1/aFS5us17TTwptv2WFFmzk+rWqWQKLYYC?=
 =?us-ascii?Q?m86u7QvSur937CFBsy8md0+Mwo0zoSUZRJhypE5EOQzez1bkeyA2TvCS9Y3s?=
 =?us-ascii?Q?6AJbfZrasNN9z9P67wzP0UV7ZMmUuJ5ucNLo6KiILGYG5GdGb+lS2fmf5n7M?=
 =?us-ascii?Q?1edoMYsBB14vvu5YSa+wJmHSDVI92L5MWSWfzJ0arau+7u0iaMmewRSlwNMg?=
 =?us-ascii?Q?DU0kJ/l5cUk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i3OkplHNPMbvheqtkPzawgJfBys6tR9I6lvpkHJd98LNMd+VmH20PuyAl/1g?=
 =?us-ascii?Q?NYbcZFnaf57t/V4LWE/6RNa1UC8OpPaXtpfEVtifRX8GA/BDZfAhWaXSIONA?=
 =?us-ascii?Q?Rx3oFCM/lLz7NIyRyIerEaEBzVjov5g+dgT6qdBF5XE5EghOIMcvA3rtgp6f?=
 =?us-ascii?Q?Pq97Brn8d5Dw9BgiP0xsz+p04K8kU7rZUpMzTMCtgmGI2QM5cTjc7LpjEWzr?=
 =?us-ascii?Q?w23fhJSEa0rtRR+yzzm0H3jtRY1aYS8IM1PCkD0Xt1roU0K1JxZjc3IUhdfj?=
 =?us-ascii?Q?9G535oiMcfA2t0GoKBn3/Eh8mT4/DPNWp1tqWFB7fuwTxaUDcinStsNigg+Y?=
 =?us-ascii?Q?+8QgH5mNPRknQAnE1+81u6ddYKWDt5jHkb3frFf83H0z3Sht2c5UMJ1q4qCA?=
 =?us-ascii?Q?lVb6GihvFaybDgiNZYDugGZTek3bmHlaJLl7RNCljeJJ/YP5VXekuzLR4VV7?=
 =?us-ascii?Q?JooTpw0pTolZUo9EnuPTNcYxFD72OCpDz1Z9CeSeMov6SOnNQd8VwlRk/DvV?=
 =?us-ascii?Q?igpMUHi8HTAgJwVjhgDe/m/J0wccGZ6h9/X252WmU22eyyxGMn7fd1uHEbtw?=
 =?us-ascii?Q?+C5xMxi7wXaTLp8NKSKPK3ATnjBk+gaogubiZQg6M0mc54o860qpMTy9pnoD?=
 =?us-ascii?Q?DuSXqWPfOzkdrdcAB7qzcxWKbHiyHzngROZ5d29k6O697SxzzYEk3K513WaG?=
 =?us-ascii?Q?cKWz6xq/mqXg119AzzlhIoS2JfNlk0cHCKFG6acW773pt905jENBX9Id6tQi?=
 =?us-ascii?Q?iEjGB5gP4PVB7hPaOGzUpm5hlu+vpxON4XaZM3UNq3DaRiPpjSJqGFzxzYDI?=
 =?us-ascii?Q?msoUUgy+ye04BfS8dQK9Vb0F4KInpYcUAImahBS/CVK0BY6Ctunj4J9QKV1s?=
 =?us-ascii?Q?7gZKpLXbzayJrSEPk9Q2SfI5zZgchrb5jnbnjXHlN0BBrVFcm8zK646E7oVF?=
 =?us-ascii?Q?2tCzbx2wzIFXAj+YsFl52zKWBC7GsO/sbnzW8NjaZjwgI/GIcMz3+1c7FVjk?=
 =?us-ascii?Q?mfOJ9rIiJMuLrtjn/X+l20tKdlempX03uZDAs2KxZfXsLLAupORwwwUAEt1G?=
 =?us-ascii?Q?xwKOXmH/Rc3eMLrNXDLbPNi+sKD0xC+pI4HSx2HVpvuW0aml62vptDYCWtr3?=
 =?us-ascii?Q?5hOuAaf69mwdKr0ZJ5OnZWtmnzNltEDIHfZxR9J+jnRnyZhIDT/DP6KrVcY4?=
 =?us-ascii?Q?RHNQC3nnbYG/Se4NZojk76Y8Yu+UOLj6AjItiN9n84mkIwXQlTzmwXENxp/c?=
 =?us-ascii?Q?2GVDXpC8yJVtkyTapKPz8IuvytDfwtHbCWAoO95LwL4bstK12JSF+jCQRaEq?=
 =?us-ascii?Q?iguNe+KEAYKYVBqTnuimoSm0WsDPho+oHjkbPjgh1tt1m1eBfNFNJ92SztAx?=
 =?us-ascii?Q?vzobeXjpc7GHBiqzzEjw+Vc2snjS1iu7pWXpzvCL+N7A1jTLBEb1v8V8zZ3c?=
 =?us-ascii?Q?nKGsGRUqdPWxwQOxa4OwbW4uq+8XI1KL8UMNhDF14GroRo8FJ7rpFiUhKLFu?=
 =?us-ascii?Q?Fwro1WjzDf5v6CaiEOj7A+5KEecxRpVuCY237oI9RDAkSUGKEeLts8om/Dvo?=
 =?us-ascii?Q?rgmXbmCPK39uMik7c+2nGFcqSIOnuMP5iBGAp7fcKAFtxOD04sZBFlY85C6K?=
 =?us-ascii?Q?Ag=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MR2XFSNLUl9OQQrooZARteuU/bbyHu1bvI44j1w2jGQdMsmUmQq5jVsQx2wvblaPb9lKdy0YEaMT2KT3blKHzyvoAByQLClPjf+++YZgeSu0FfzZkusjMinumtlhZdPDXXcGAVwDCD3DXMQM0ZbxCafgEqOHSdRBaAL5RUjYN8lpztQ83JpGmpB5ZM31YEKnDCiFXFeO4J32aqmXXrrKwFsEUSY2OVIydOgHrc++LfMjdnUFiUEh3N+JSEHE3z5t1A2/dQLHeOrtan/7xqeLgMMv7YcRKsLBsg3mkelyhM5BFFvNYKuhYcOyuhAyJq40Z6C76jXhsln5J+LLjAqYqaMMIB7ei1YwhvKk/QkQrXPRUn9AEm6qXQ/mIheu/PxXAnSUWW/YOgHzhluGGa5jPlpgfha53a4R4Y4TORGmfdhdytf8g7sQ8ji0YX3ziyuyxbX9P5gt7gm+NE8oRTCVKkuHVQs/jLcxPAjJrSI5sO5fB3WVrunVrSyX2BNJJaMT5c74KmtgTeQ2N2KNZ5rEQnoh4cMRQe1xz9d3BpBoNvLtdYBcLh1mE2b4VN/yuGONfbjW4xyS1dfga+aCdcRNupj3xarNMyZGsJOC7sh5ZbI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1840c55-b2c1-4f81-77d3-08dd9573b665
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 18:50:37.1167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wpueS3U7mCN02pqxygeSSh/RaPHDi6C5Dr1jt0rwd0IiIIgNHVnFqGtG08fQ/oGpeR+d8/ZQxdng/l70rEnxmzmFDPUoqar5Hq72I0ytAJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6125
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-17_09,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505070000 definitions=main-2505170186
X-Proofpoint-ORIG-GUID: 62Qa6QolH4JQfevinPSDV_jIgs3Bpima
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE3MDE4NiBTYWx0ZWRfX5VORwgGOGVRb u/grufuOgPQv5ddjO6BHZECNTtakq+QWRNqqxAet3E2sRIdQ0wlTZ6HeJk9RUnyU2PyQpzPd1Qb 8wE7q4PsEJp5AXvYhJbVu+THFP3FMsU0FjJQvR0tr73lTaxhikpE1NdT7ku+e+1OJud93L3Z9Hu
 0IGaA79ZKTKjQvSx74aDPH8RFwlz/PatZxxTsaEHnHw2McKJAkjNHKATuwq8FbB1jfRKURzWJ2A RCg1eunv9G48WQKL4GkRDhDcKiWP11l6UXRFZtrm8rIXKBaKecFDHDSNJyYErmkIxHlEKjupb4r Zu34tqN9lgBVwVF5AF1GQuxNC9VRF1ZlcjHeC7zi88LuvXrAMhbAiWDsUZyyjLlfLa8q5Xqhaty
 YUqh2jXmuMmOOFTnGLoT27PsewNd7TE8I1UYZx0BThJNperN3mtj7IZ8yaUVYlYnFxpybKR9
X-Authority-Analysis: v=2.4 cv=CMIqXQrD c=1 sm=1 tr=0 ts=6828da83 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=sVSeoCMNU6pQoqmA:21 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=_AayY_MTX8lKVe3a2g0A:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13186
X-Proofpoint-GUID: 62Qa6QolH4JQfevinPSDV_jIgs3Bpima

Hi SJ,

I'm happy to discuss this, and reply below, but I _think_ replying in this
thread is really not optimal, as we're digressing quite a bit from the
proposal/issue at hand and the cc's now not quite aligned, potentially
creating confusion and noise.

I know you're in good faith based on your (excellent :) series in this
area, so I presume it was just to provide context -as to why you're raising
it- more than anything else.

This is more of a 'email development is sucky' comment, but I _think_ this
would be better as a [DISCUSSION] thread maybe linking this original one
back to it or something.

But anyway, getting to the point - my answer is simple so not much
discussion _really_ required here - you're right, I'm wrong! :)

I go into detail inline below:

On Sat, May 17, 2025 at 09:20:48AM -0700, SeongJae Park wrote:
> Hi Lorenzo,
>
> On Fri, 16 May 2025 13:57:18 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
> [...]
> > Right now madvise() has limited utility because:
> [...]
> > - While you can perform multiple operations at once via process_madvise(),
> >   even to the current process (after my changes to extend it), it's limited
> >   to a single advice over 8 ranges.
>
> I'm bit confused by the last part, since I'm understanding your point as 'vlen'
> parameter of process_madvise() is limited to 8, but my test code below succeeds
> with 'vlen' parameter value 512.  Could you please enlighten me?

Let's keep this simple - I'm just wrong here :) apologies, entirely my
fault.

We have discussed this a few times before, where I suspect my incorrect
assertion on this has led to you also assuming the wrong thing (again,
apologies!).

But it does raise the important point - we need to re-examine your changes
(see [0]) where this assumption reduced the urgency of considering
contention issues.

Let's take a look at that again on Monday. Though I do strongly suspect
it's fine honestly. We just need to take a look...!

[0]: https://lore.kernel.org/linux-mm/5fc4e100-70d3-44c1-99f7-f8a5a6a0ba65@lucifer.local/

Anyway, let's dig into the code to get things right:

SYSCALL_DEFINE5(process_madvise, int, pidfd, const struct iovec __user *, vec,
		size_t, vlen, int, behavior, unsigned int, flags)
{
	...
	struct iovec iovstack[UIO_FASTIOV];
	struct iovec *iov = iovstack;
	struct iov_iter iter;
	...

	ret = import_iovec(ITER_DEST, vec, vlen, ARRAY_SIZE(iovstack), &iov, &iter);
	if (ret < 0)
		goto out;

	...
}

My mistake was assuming that UIO_FASTIOV was the hard limit on size. This
is not the case, it's just an optimisation - if the iovec is small enough
to fit we use it, otherwise we allocate.

We can see this by examining the comment from import_iovec():

/*
 * ...
 * If the array pointed to by *@iov is large enough to hold all @nr_segs,
 * then this function places %NULL in *@iov on return. Otherwise, a new
 * array will be allocated and the result placed in *@iov. This means that
 * the caller may call kfree() on *@iov regardless of whether the small
 * on-stack array was used or not (and regardless of whether this function
 * returns an error or not).
 * ...
 */
 ssize_t import_iovec(int type, const struct iovec __user *uvec,
		 unsigned nr_segs, unsigned fast_segs,
		 struct iovec **iovp, struct iov_iter *i)
{
	return __import_iovec(type, uvec, nr_segs, fast_segs, iovp, i,
			      in_compat_syscall());
}

Where nr_segs == vlen, fast_segs == UIO_FASTIOV (8), iovp is &iov, and I
think iov referred to by the comment is *iovp (only sensible conclusion,
really).

Looking into the code further we see:

ssize_t __import_iovec(int type, const struct iovec __user *uvec,
		 unsigned nr_segs, unsigned fast_segs, struct iovec **iovp,
		 struct iov_iter *i, bool compat)
{
	...
	iov = iovec_from_user(uvec, nr_segs, fast_segs, *iovp, compat);
	...
}

struct iovec *iovec_from_user(const struct iovec __user *uvec,
		unsigned long nr_segs, unsigned long fast_segs,
		struct iovec *fast_iov, bool compat)
{
	...
	if (nr_segs > UIO_MAXIOV)
		return ERR_PTR(-EINVAL);
	if (nr_segs > fast_segs) {
		iov = kmalloc_array(nr_segs, sizeof(struct iovec), GFP_KERNEL);
		if (!iov)
			return ERR_PTR(-ENOMEM);
	}
	...
}

So - this confirms it - we're fine, it just tries to use the stack-based
array if it can - otherwise it kmalloc()'s.

Of course, UIO_MAXIOV remains the _actual_ hard limit (hardcoded to 1,024
in include/uapi/linux/uio.h).

The other points I made about the proposed interface remain, but I won't go
into more detail as we are obviously lacking that context here.

Thanks for bringing this up and correcting my misinterpretation, as well as
providing the below repro code, and let's revisit your old series... but on
Monday :)

I should really not be looking at work mail on a Saturday (mea culpa, once
again... :)

One small nit in the repro code below (hey I'm a kernel dev, can't help
myself... ;)

Cheers, Lorenzo

>
> Attaching my test code below.  You could simply run it as below.
>
>     gcc test.c && ./a.out
>
> ==== Attachment 0 (test.c) ====
> #define _GNU_SOURCE
>
> #include <stdio.h>
> #include <stdlib.h>
> #include <sys/mman.h>
> #include <sys/syscall.h>
> #include <sys/uio.h>
> #include <unistd.h>
>
> #define SZ_PAGE (4096)
> #define NR_PAGES (512)
> #define MMAP_SZ	(SZ_PAGE * NR_PAGES)
>
> int main(void)
> {
> 	char *buf;
> 	unsigned int i;
> 	int ret;
> 	pid_t pid = getpid();
> 	int pidfd = syscall(SYS_pidfd_open, pid, 0);
> 	struct iovec *vec;
>
> 	buf = mmap(NULL, MMAP_SZ, PROT_READ | PROT_WRITE, MAP_PRIVATE |
> 			MAP_ANON, -1, 0);
> 	if (buf == MAP_FAILED) {
> 		printf("mmap fail\n");
> 		return -1;
> 	}
>
> 	for (i = 0; i < MMAP_SZ; i++)
> 		buf[i] = 123;
>
> 	vec = malloc(sizeof(*vec) * NR_PAGES);
> 	for (i = 0; i < NR_PAGES; i++) {
> 		vec[i].iov_base = &buf[i * SZ_PAGE];
> 		vec[i].iov_len = SZ_PAGE;
> 	}
>
> 	ret = syscall(SYS_process_madvise, pidfd, vec, NR_PAGES,
> 			MADV_DONTNEED, 0);
> 	if (ret != MMAP_SZ) {
> 		printf("process_madvise fail\n");
> 		return -1;
> 	}

To be pedantic, you are really only checking to see if an error was
returned, in theory no error might have been returned but the operation
might have not proceeded, so a more proper check here would be to populated
the anon memory with non-zero data, then check afterwards that it's zeroed.

Given this outcome would probably imply iovec issues, it's not likely, but
to really assert the point you'd probably want to do that!

>
> 	ret = munmap(buf, MMAP_SZ);
> 	if (ret) {
> 		printf("munmap failed\n");
> 		return -1;
> 	}
>
> 	close(pidfd);
> 	printf("good\n");
> 	return 0;
> }
