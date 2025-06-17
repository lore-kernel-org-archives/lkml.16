Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C3B220F34
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750149814; cv=fail; b=jCbyj55XdUfZcIP/tBqoCdvoAJrDU/54/x8FFrib16OhP2ye+372TPcGq+OKtO4A3sWg/tIkolWXqR21YF48yBoNyhWvTZiCWL6/9mnzqeN6s31YHiazKhWldmt8Q41U3GAEU6VMHVlqZj5P69slSlb+NCoIpy+JmbjwqjwYihE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750149814; c=relaxed/simple;
	bh=fY9qsDhIMrwmYn0WiAVk2oXCpGqOAnpYHuPdf6c/sXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Z5553IJsxDb36UT8kUl2IZ7kkR3DEqEA2N2o/Gm9lIJ35wBZ/Eq7cQ896ipdEq/ddLZu5AG7qRsuvp8JKKe1Wrn35rBjmSNmOh8sgVhI2sflBVITycyE8deO23cm80SGRw0uS7a8OCZ+2Gx7bNGOPqvHCwItL8K1SjGpAjsRZwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=X6QogZpZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uqPHOKiT; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="X6QogZpZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uqPHOKiT"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H7tV7p000953;
	Tue, 17 Jun 2025 08:43:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=dihT+zwAI3kh8IPyWJ
	ebC55m9+oq7aIK7FzdkbO4nes=; b=X6QogZpZI/Ie3nXYOGdRUCSodu2cQgzVJm
	gpwiJaIcA5Vd2ORZii8QoD1+nO0rh7XPILgVRsOM8URtf2aBAr2bGtebkfxGV2s2
	SbfLskA8IrNLemGiaO9xtRk30OwMtDQta6Knb2qm/JUYrdvbQgzcVStjNS3q1mGn
	HLMxhv5hjIgtF5RYI4KyXrqXcrQoNggccD0f67Rgi5Ys3x6d5AWqkd/THGjBffLS
	cnZfho+Vj1YWlXKIqK8F+5AuCrFwiuhVgEUW7FsgOXQNHkol9i0rEpLGsfY1o6TS
	hhfmHbmN+ySWicuysVVe+0fou9EtaN+3e51XHyhRFnqRpkEQ4EGw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47914emsww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 08:43:11 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55H80gdK001493;
	Tue, 17 Jun 2025 08:43:11 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010051.outbound.protection.outlook.com [52.101.56.51])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yh8y5rm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 08:43:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WwblwITS5vKwzehR5/Sk7fwgBMxCaRa1lZNux1J6pe9qUUVuMyGcfWzYNmuE2PiHg5OFNbtPswytuGWo0m1BWoHJydBSa+76Oyoc9O8RlW4UkRpdfDdXLgwXKHS5aoRHzMldOH1tfFBKLXHuFNl/Q2NP22pJYnYEba8nF8No5Q9AP9LHGyZdb6kf2SN8YLmMMwVufA5262Ay3mWmIWvujwDkB1/j7QMs+Ylt6Joks0X2JdmZGf3k7IvAXEMISZDVZG3D5cTX493TMAH0koaJFW0fzm8/wzt1Rvtp+RKI/hXYWRATFFNCNbJVCRqkmDscjsIfAnav9JZfZPNlMDbHgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dihT+zwAI3kh8IPyWJebC55m9+oq7aIK7FzdkbO4nes=;
 b=hMyqnmv2NzVUS3RBf+fm2Jb4kxx0ZU+irqaE2xmv/VhSWpRosarvspJSUWequBgCfPssMBhE18RCCXpwqxbhsU/Z7D1AUABGayXsTfql+Z/6Q/x28JMYI0f8SWutroMSM3gqK7F/Nq/MoXm/EfcDohNIn54E2i+u4Z+2CqsLbf/dtyy41Ph4e+gxTI+I38DPvuXutLJh+YDlmcaPmTsPacSsR6dRQDZh9NZZJWVNAOtiENOKR3psgJZNYU2jEMejf+oilJ87rrq37VZ/4QyKSjl38mu6haZY2b/HIpudnVb/AVEOpGnIM6/kcAoklmVBeyag/iwTUQBBZDan3U/n9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dihT+zwAI3kh8IPyWJebC55m9+oq7aIK7FzdkbO4nes=;
 b=uqPHOKiTwDb3qALS4GKIoQ5cBog6KwrKedYVHjIGLwr3dtC8fiV3XOS6I/6CyuX22Q39fg9oMfYkUeaCBh7wmMwDSUCph7jKRWMVcda39Yl3xsDCfUSPxHG/s5G0bzL1j/pjl0nTZTnUmLo7I3C5DblCdDRgGAYrClMUQa5ViwY=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA0PR10MB6748.namprd10.prod.outlook.com (2603:10b6:208:43c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 08:43:08 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 08:43:08 +0000
Date: Tue, 17 Jun 2025 09:43:06 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Lance Yang <ioworker0@gmail.com>, akpm@linux-foundation.org,
        21cnbao@gmail.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
        jannh@google.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH 1/1] mm/madvise: initialize prev pointer in
 madvise_walk_vmas
Message-ID: <291a3c4a-3156-43e3-bcb9-e0299d258e12@lucifer.local>
References: <20250617020544.57305-1-lance.yang@linux.dev>
 <ab78f4ee-dfa4-4c49-8944-a67546a739ca@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab78f4ee-dfa4-4c49-8944-a67546a739ca@redhat.com>
X-ClientProxiedBy: LO4P123CA0396.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::23) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA0PR10MB6748:EE_
X-MS-Office365-Filtering-Correlation-Id: 282bd2ee-d842-45b0-3822-08ddad7afc45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AI+My64hrJrz/SEFPJIRV3oJOwhzha7+X0oO5zDJIiwkfr6rEJ2c0FdZEDoa?=
 =?us-ascii?Q?8y1g7Wi9TwCoyTHwIq9LEaf7VSXBj0rOEdJYlRZ9giWLdzxOOjnQpfOLM0ec?=
 =?us-ascii?Q?vSZ5Xunya4BdBbmnJyQYa5LMsA0gDnpY/xz+BRJof3UAe7seB4hKXnjfws5Z?=
 =?us-ascii?Q?IJNaREj5km6Elak53Ua0KdHHCkwsFHjhSUwf10Qq9Y8GISNDkFJt66iwHBen?=
 =?us-ascii?Q?9zxfxj5k8AaKAUw+kQOYcEQ70SfRxBS3Rj7qKpyGtYhd4F2vaTFxQxfZz00o?=
 =?us-ascii?Q?fWPUAVsQGeLB/zAErIuMkvBjQEcdMOMP3INiWJ2m3YJeivPFKcOcDiEAoUeR?=
 =?us-ascii?Q?SAmf5CzRX3ouotwRLY3Nf9maelk/FqWpiGCWms2YL4InfjrNZz5pznjrZ3CW?=
 =?us-ascii?Q?oarXjAv2fd3MHDkGHZudK+Z4uz6CsuIvDwV4zA0AHyNNAMpCFSi0HR4JImug?=
 =?us-ascii?Q?SEsjMcBR9nYAcODzqSBMRh6jF3QIynopm2TbT4H9rGsd1NfNh2AlqOHpHR4z?=
 =?us-ascii?Q?pTGiTadKsRRlDR1Np7BJR7+bDsQ0zjzbj+3gu73DhzmEH4FEM/kqfoSbL5+R?=
 =?us-ascii?Q?/O8AmfSb+F5IXOPxns45Mrylvba0k74QB3JoTf3mkeN/RLNKjmOiH2ugpmTj?=
 =?us-ascii?Q?WrJieUtpNez+HupJjMFmIt4A+J55VozAMFXdGoIbmqrTP6NAB475fQMdYvS3?=
 =?us-ascii?Q?eNM002yh2mxL+x+eIyH78xY34XovGM8QIQTq4HFQkO0e6Z0grOMN6EYFbIEY?=
 =?us-ascii?Q?+XEpj7khmGdXV1XsZbNyqaJLmbOJ/eUtXNGufM+ctNDvsJH9Q/ecXjn6AcgE?=
 =?us-ascii?Q?rtHIIHGqnKomL7Wg9KgGhzCXXWWX60b4mPVFBTACFI4sUsH7iQg2ywm/Syg5?=
 =?us-ascii?Q?wR2XSK+0C/bw/61RSAgHFmWfimo9hFogNeMIHYurPYD/oAyPeTrZx7rYcNqC?=
 =?us-ascii?Q?1hpOIJDjKieGQCiJo3n2qpoBvCoMlj1Z9hoIfZlXxZ6AzWBThe++zCpMDdaj?=
 =?us-ascii?Q?7UyfwZotlXxOsi5b64x1kKZl9mKrBFGS0ItoXhHNaQp2zVJrDsu8n4mM3gNU?=
 =?us-ascii?Q?PAiOdY90LwKRNHDTUfpIRSyTwU8dK/EQ4psYSNfbnb4nnatGL8GOAHXvKCeE?=
 =?us-ascii?Q?l4azFZP6OXF1pyBWm+/rKrHS0YOPhHde+P1fPNQJw2jD5grhmCEqqwQTR7m9?=
 =?us-ascii?Q?pTTrVNMoACK5OLfDQPKs1LZzozJxVe44WRn0grYv+Bt99LQhWA//eV+wQxn8?=
 =?us-ascii?Q?lb1WalhYE4FhpuSl4MgfiPKGwo3M2J+OwUWcSOcvygptF5bh2IvcCVteMhu+?=
 =?us-ascii?Q?29Ecu6aMJjvpzUyFKH+myhxTb4hpiCdeC0JKJRfNglZ8o0AD+0jEZZl6Q+DQ?=
 =?us-ascii?Q?6IoarCjTg3cV4hXK+7SP7cd3l0k/AzFter/vn9g3phrlGmEjY/lBk8cRlDto?=
 =?us-ascii?Q?fTCDDlOOtUQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9OmqiqimLCF+tjVooUBW+reKa154QQ75QzvwlRFNWVPF/kQ83jlqo6LGsnJJ?=
 =?us-ascii?Q?Q9bHdL4I9UHfsiQE7DP4edA4X+aW4zfMX9AWTPF65IafJHT1I4tsIOwlpKR1?=
 =?us-ascii?Q?cr3AAOAwcXxxnB3GlrnE3lUqgEqwTdD+NApuTm6kWw0BJK9JlK1zF0U2ngD6?=
 =?us-ascii?Q?kUkHmtQXqVWkXyQKMYjYtCseORKUfQiTvoLzWVzAJ/ZYN+1gm62zKF5xVNfw?=
 =?us-ascii?Q?8mq4sKSDHv5IFrDJQ9AGQ/mpySyxPYjcjtZgFSeAtCCluwkKeRoaC2nEBjBc?=
 =?us-ascii?Q?ZgaoKja0SHafIHHhE5FHDCM4GCFMbSyeIQhRYkRFjo5yHfYl5zFYYR8Xjpsr?=
 =?us-ascii?Q?1/OhYi84cJAWfgLyZhHpqzBONj9AKWml0RqJk3Z9Y1Pwn50NUH5ZjFggfyz7?=
 =?us-ascii?Q?YMZs+Ugb/gIlwGeOzo4mUfGCLmAJwaAWGJn749jJ4koW+G6/OSzFTH8JZvVs?=
 =?us-ascii?Q?RUyulo4UQlGYXEeH/+fpp5RdX8AVDi2V3IYZ3ANSoY01A4LO9d+Q5Fl0yMLY?=
 =?us-ascii?Q?xvnjNUIjXQV0v6jcli/OAtJl2bKjSO3HZ6XVg62e8gvPHsFX9dLuC6x78HI4?=
 =?us-ascii?Q?LRWwY7E5Iv74LPxNjE94Ssipnfciky3NL2VhSYRcH8SOX2sh8YmFAgvoynme?=
 =?us-ascii?Q?GGMUFMdOKlpGm9X/toc1/vVsS2FK8uSJ2a4YhndWYoIb7zrK3fFXc6EEUE9Q?=
 =?us-ascii?Q?g+txYUQpTdPWDjGJVxmtA+nWHAcyHFuKRVN32fvZ+8OIJvW+KZzHHuVhK092?=
 =?us-ascii?Q?bxA8MpNudTiDys+nOChF8itFBpJukfAtMBq+CUXWVIqZV23AbjL1VItoWl90?=
 =?us-ascii?Q?a6bmACK04x7o0yYNzzfuavh/dcYV7LUmULzuErQSfmTkoTO1mwwA/J1lm92i?=
 =?us-ascii?Q?qOhl2n2Swww7eqjuPkvT5HLZkYrlamvH48MNOp0XVVOf4pxbBr4Jb4Ub1vVc?=
 =?us-ascii?Q?DPOCUJhrybOdXCqih/D8zQlreOAa9RomuKWJVc9b/fd5hJJrWrGq4k+X26jC?=
 =?us-ascii?Q?5lB7zgR1Y96WKoQjFINWgriCiu7fx0gpPSKo++LvjwQW79pVdyUC/YrpOAID?=
 =?us-ascii?Q?mya6v1dgC/ywB5A8ge4YfWzFVPPqXLCuuhS5D/dDYZOFWT9kbv9bVE106pon?=
 =?us-ascii?Q?JOSnKAi6eMMDCLcNfCKcolAPNJrReh5q58DyOdxxHCCFbThBHo7BaBAgwV5b?=
 =?us-ascii?Q?HpgpbXKyC10fXG+IRrumqBQPtILLvOjI7kdmgSiSt3zAFsY1njyJ/7THfwFg?=
 =?us-ascii?Q?u+/PBqgRLJ0+0ld29Jk9nqJ0OR8xXfU5DITo+eYl8GsExu9WZxR/twnJ/mq7?=
 =?us-ascii?Q?66+SoKPPMIdRRdW7mZBDAgTgxJqiira7A6PZteXkDVc6PJRBEACJHUZrdipH?=
 =?us-ascii?Q?YSc9OaCBA9jJscKSrG8hkAJODlN7ta4a8vye0obUReXGloBMIlKyo5OYNRwz?=
 =?us-ascii?Q?Uh8ifE6uzuNkWHt87eEY2E4dKMZHGRRV6qzjwRUs3MmRtI8+vx8U/2vfy56L?=
 =?us-ascii?Q?tqehs17OP8xSQ70XfvRenQ7pOtNGAUxUgca3Yv/AseuyDexQGA/84vaTxRUP?=
 =?us-ascii?Q?yWw5gsk7qtDb9duzoF3V3ZN4JrsI+9oBmnIb6Ircl2WFeeK0s9xmvVkLncc1?=
 =?us-ascii?Q?zw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	C7zr6kIYzr5f6fLOoAbnh9VnYVr1IPGOKSctsSY1vtV9jFQxw4FGMdQ6gg2GrKdNas7xjFAgbA/5NVdrB7iTf2ozZwiK5e5OgsE4W/Ex9+YBVGcXaoZ0ov1w3QaOlWzSmXLN6Sx5xETQEtTTCDsgUy21O0TAo5x79YKBDHaLAuzR4zKpPLGctZow15esxojOpAbHtHClVXK/SCV3+eex4yoYoAq9To+yvMrQdAF7yC6rMtYKl7tPgx4jUm1VADDgJpTfufHawDH3ibwYZWAAnpHP3ThnZzNYSCx02tE4Rk7DvGUPnh7PVITGfWpC2QuTUm8hHTITlC9dgHYMqB440VaBV4GbkEsAgzfoaWPSNxSSI/kff+ld4KJJVwGAEjcol55redDYZLS3novlRd368nCU2ytint3GQxgtDQUe7pXBQq4Md+qdb5OA3jeVQXYHRBK35sOf8jYd4PiKB0Qv+lOpgQzRkuZRGicStBknUq1xWOqEOmTFIgWZgTVlYk0gCBEZKSygflA9p+QjDsKOOuYol9qY6cLW3PxqecIPnezhw2kzOw91ZDYPDkgRg85EqpfEV7+tY9UbOvlt9XzNcPOoSYu3AyRwEmi4u/LhnZQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 282bd2ee-d842-45b0-3822-08ddad7afc45
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 08:43:08.7248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Omal99d78wE7wKfFfrCSZa5mfB+8S+n3QdGy3F8Fq16D0BDtjOUV3BKLaMjwvd0m3IQgunwxU5SoJcgVIs+OIYFrjIKJF+7pHb9+HeS/v/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6748
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_03,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=729 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506170069
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA3MCBTYWx0ZWRfXwlhxFXbsj2ba s7B5+2D5Mko72JclOGccdlDf3rUC0ItpZhu3CB+VNemRXMPq9XqVPRg7DzkwvKaEViGc1YhO5AI orKmOsfi6hyQQFdn1KTLKSvw34VcRdOA/WjNCVEIVjR6sySdwYVZ/88wcYypClP5T+bJVx4wFb8
 Jb+h28JHh3WTSLzmPrxEnSrI1zKLN5J2eeaA1OuOyoF6S8T4G3Ck8Qc6T+sy7gJk07QQvXcr3gP 5dYi5P9FP/VirxB+dhiTfd2rw6da7mWwOtKRA6mZ6ADF5MvrL4gG6P8i9Y4YLl0eki4fQhdH60m ohbWHeQJkULb6zHm0o2SgW+dQB+QiKhRa2w0QPFKJjn1LAXVfdHmdl1bTh0TxAa6cfeXMK8MDJD
 emcMm2dpuyeZHRKBFiva99uubAxd4cvwPyt5qmpuNeR9w9ImrKNlZx8iDW6F43vERZ352yvg
X-Authority-Analysis: v=2.4 cv=U4CSDfru c=1 sm=1 tr=0 ts=68512a9f b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=20KFwNOVAAAA:8 a=i7BY_OxQR3VRiiwTakIA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13206
X-Proofpoint-GUID: 8v7Pa0Eh9wOAsS09ReuTTuk9vtLfRt1F
X-Proofpoint-ORIG-GUID: 8v7Pa0Eh9wOAsS09ReuTTuk9vtLfRt1F

On Tue, Jun 17, 2025 at 09:54:29AM +0200, David Hildenbrand wrote:
> On 17.06.25 04:05, Lance Yang wrote:
> > From: Lance Yang <lance.yang@linux.dev>
> >
> > The prev pointer was uninitialized, which could lead to undefined behavior
> > where its address is taken and passed to the visit() callback without being
> > assigned a value.
>
> So, we are passing the pointer value to visit(), which is not undefined
> behavior.
>
> The issue would be if anybody takes a look at the value stored at that
> pointer. Because, already passing an uninitialized value to a (non-inlined)
> function is undefined behavior according to C.
>
> In madvise_update_vma()->vma_modify_flags_name() we do exactly that,
> correct?
>
> 	vma = vma_modify_flags_name(&vmi, *prev, ...
>
> We should use Fixes: then.

A note if people were hoping to blame 94d7d9233951, well before that patch we
had:

-	*prev = vma_merge(&vmi, mm, *prev, start, end, new_flags,
-			  vma->anon_vma, vma->vm_file, pgoff, vma_policy(vma),
-			  vma->vm_userfaultfd_ctx, anon_name);

Note the *prev...

>
>
> Acked-by: David Hildenbrand <david@redhat.com>
>
> >
> > Initializing it to NULL makes the code safer and prevents potential bugs
> > if a future callback function attempts to read from it.
> >
> > Signed-off-by: Lance Yang <lance.yang@linux.dev>
> > ---
> >   mm/madvise.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/mm/madvise.c b/mm/madvise.c
> > index 267d8e4adf31..c87325000303 100644
> > --- a/mm/madvise.c
> > +++ b/mm/madvise.c
> > @@ -1536,10 +1536,10 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
> >   				   struct vm_area_struct **prev, unsigned long start,
> >   				   unsigned long end, void *arg))
> >   {
> > +	struct vm_area_struct *prev = NULL;
> >   	struct vm_area_struct *vma;
> > -	struct vm_area_struct *prev;
> > -	unsigned long tmp;
> >   	int unmapped_error = 0;
> > +	unsigned long tmp;
> >   	int error;
> >   	/*
>
>
> --
> Cheers,
>
> David / dhildenb
>
