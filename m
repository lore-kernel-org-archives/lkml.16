Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EE91F30BB
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 09:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748943720; cv=fail; b=bT5CQOFhBR8QYCdLf5Bur2ZdDtBYuHRBtNXnBVHFrP18wfXwsidcA6SvzqCSrkQ86pVurJp58i45XUUT8CV8t+W2JKH62GmjcB514pq1odmcai8eNBUIQCglEpWqo3vrrqsGkB0H5elkdedu9r0cv91kkmt6VJtXyEfcEVWTDr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748943720; c=relaxed/simple;
	bh=Av2knrYBEQloCWHsu8QNDs3g8auSeiuAaGT2dmUScWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XhV0lk5Dt7MCE5x8Ds7CxRrCN3P+zmGoDyZc8UqVS0yFiXI8ZIQP+JNgsLkXhT72KUvhhHKIw+9ceclorVVoK/irY4oxY3HSp7owYyKOg1aFZktQhgcW3LRTIPCSw8U68ip0lENBAtG45c8InoGxWcFaVcaPbeYaAE2QeSZ8x7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZZmrf0U5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ObzDnMNN; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZZmrf0U5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ObzDnMNN"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5537uG31008115;
	Tue, 3 Jun 2025 09:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=jNRUs/IouGKFTOaD/3tdr42r1EJdm4t2+IgaBNVfUdM=; b=
	ZZmrf0U5tz+d9Qk9fiUvHQNMfGgI89/2s8gxi3qmUZVr6QQmrqfoAqr1wtbxEYrs
	EMm4uZvqwJjT7CApCZXt0n0XZwEg0oQcbIes9bwXXPTtwrhtWlSTeSo/yi6F5qWg
	XzAyD+OO7SON8Hst7GjySDNw96QE/qB+O06UQA7LhyzRSg60WP6yvrM0ohee5p8a
	1MemTKJQOuV1St+7YYxfCnKevME3KKeSgRXYNlRXZL/mh+FsaK5rSChxGaVeQBMH
	49xs2CUzPQqAY1USHsLCSTr55/18Rku7NDloHskbDofiKQpG5bv3rn+Oj1hVDU8i
	Xmbx2DKNVeD8ewaV4UYjNw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471gwh9cxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 09:41:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5537j1O5039288;
	Tue, 3 Jun 2025 09:41:39 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012030.outbound.protection.outlook.com [52.101.43.30])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr793qxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 09:41:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E9i3MpElFMAcA4oMgSGG1xABaZcoH6mHOolkiR9BnGpBqltgzsAeBzhc+kKY/Vvgz+SFs5d8BOvq5JprhRH89M5kxYYa9oVQchsRgn4FfIiFj7GLDAHLU32tGVSY3ky29SSqz25SbVHxboplPvkmI9LQsy9QKSavr5RMUOxhIUDikA20LnoG+mZE52gAukS8FyARwPmNVb5zr/suZaH2c5327FmwP6rgTRJXbjkq0BgWHF2NAXAEkUs0U+2r1gjMjE44HjZPYuKUk7sf6AEqlCFvT/IqvujQo94lB1UGk/I8x9bhq0X1rS00ctUOSQ6kAu9fju4qdYmcUb7ZOrE3GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNRUs/IouGKFTOaD/3tdr42r1EJdm4t2+IgaBNVfUdM=;
 b=v2gG0yWiUJhUZHDb02bnPfr9suj7ldOeOcIV9bRtpAI3pi6lYdnk/m3GsXk6OHscrGo1h5zr+yrBFQ+vCeTME9tLOi0NeDpoJdBeUppEMA3qYDHjYRXcIm0DVXwiAgX6CBV6xCb2ncZp+DpgpBLRlaF/GE3cImA/dYa4kOIn3nzRPk05TAiWMWqa755U36JQt4kpZkgzIuz0H/AdPKoJUC2xVBMM56OZoImHeIrlcVTECoAjFAhmAL58r1gG9V7F1HiCxuM34/oUXj/N3JqLLuQLL3I7iW+HknyqAji//0ISDSi2nr82M69lVa3dsdqv1ifaw3591WPFFR3c7w8xjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNRUs/IouGKFTOaD/3tdr42r1EJdm4t2+IgaBNVfUdM=;
 b=ObzDnMNNy0fB3Bas6yBHvSfje0pIVUFE1jNr4pjuGp7NWJk7xpo8kKShA4BNeHm7aEnMXJcL4vorsPKaG1uQHUQcxKola85rKLdejiOPn1WqhjBa+380MwDcT8eBHwY3n4M7vQfW3NjKoK2aq5F4O3HtHBrAEQLHFXAt1T9eFMk=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS7PR10MB4990.namprd10.prod.outlook.com (2603:10b6:5:3a5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Tue, 3 Jun
 2025 09:41:37 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8746.041; Tue, 3 Jun 2025
 09:41:37 +0000
Date: Tue, 3 Jun 2025 10:41:35 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Barry Song <21cnbao@gmail.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
        Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>,
        Lokesh Gidra <lokeshgidra@google.com>,
        Tangquan Zheng <zhengtangquan@oppo.com>
Subject: Re: [PATCH RFC] mm: madvise: use walk_page_range_vma() for
 madvise_free_single_vma()
Message-ID: <bd61e018-5fbb-4aac-8672-0c16254ba09e@lucifer.local>
References: <20250603013154.5905-1-21cnbao@gmail.com>
 <7bd57eba-42a0-4bf3-8632-b91c401b7316@arm.com>
 <CAGsJ_4y3zWS_rHY4=WWuA9BANYwR=r-j9nrfiX2TAQwuo11JdA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4y3zWS_rHY4=WWuA9BANYwR=r-j9nrfiX2TAQwuo11JdA@mail.gmail.com>
X-ClientProxiedBy: LO4P302CA0044.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::10) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS7PR10MB4990:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cd812de-6d91-4708-c31b-08dda282d5fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TTZlcGhuemNZUEVYN3BNUGhFWkFvRWd0VlRsSkZKZ2VUWlIvTVo2bU1SK3Nj?=
 =?utf-8?B?R0ZGa1Zkc0JlWGZlaCtSaHg0eit1RmdwZndJTGlEdkFWVGJhWGZ3RGg5cGhn?=
 =?utf-8?B?VDJ0ZTU4ckltbHZWbkoxYXJQNVVwUkprOGdHelBUSmYwZnE5WTAvdElRcXpE?=
 =?utf-8?B?dDdBMGVKZTlEUHR1NEQ5cW9BZ1FtcTBRRUxVaXJhZndlVWl3elZPclFKSDdN?=
 =?utf-8?B?b3h5dFdHMlRiTCtFVFFGclFOUGZvQTg4cXN2aWdpQ3hkVTJBL2l4Z0JjVlNs?=
 =?utf-8?B?dTdlZDVmTG1ZUDYvelY5NCs3alZsLzcvbmhVRnpBc3FUbFQ4K3FsNU4wdmlD?=
 =?utf-8?B?ZTVyRFFYcU4vOW9jNE1Bc1p3Z2JLZnErQUhYbmdibkdIdnV6ZlE1bVh5TmU2?=
 =?utf-8?B?RHlYdFBBRHBJd1cwT2lzOWlJdHAyT3h6TzdRaC9YTC9mQVN4L21ZOEVUUzJu?=
 =?utf-8?B?djkzOXRYZUhZaDVGR1JUNmF4Tmt3RW5GQVlqeHFzM1gyemRGNmc1WG4veVlQ?=
 =?utf-8?B?Vk1uc09qczZSdUxHY3gvRWNKdFRFWURJR0VnanFyWEdITVBBdWgxUGw5SUZE?=
 =?utf-8?B?ZFRuWkR2TTdhTkIzTDYyOUVVdkxEK0V1d3VjL1pkdUgvV3E2ck4waUZJR0Z4?=
 =?utf-8?B?OW1jUHVSQW1EcGxNS1pVT2t6QVF6N05abjdyR2s2TWN3aFF5eHZtUk10N3Fp?=
 =?utf-8?B?Nm5HRFFUbGNmT3BFU1RrVjVLSHNqNmwyVmdWQ3BqZ3M5VzBRNFRoMEEzL2Vk?=
 =?utf-8?B?QUYxYXhMQ21CS3VhVy90a2tPYzdQUXBWUjRTaWlxWncwcXhJVks0M2hvdGlq?=
 =?utf-8?B?UU5OS2V5b1psOVdPWHlNTlhJVVFra2xlSFhJQWZhNG9QYWRpeU5hZnl5eENO?=
 =?utf-8?B?bytFSlNFUnNDdjJiK0lUb0V2NWlFU29ieHM1NVdjQXRhRGhrWjRSMUxDNUY1?=
 =?utf-8?B?V2x0SlArZW5mRDE2NFg1NGUrOE0yT1FWbmhlcmpXOFZ6dDFuTzlmODBucFJq?=
 =?utf-8?B?cGFWeVkxS2o4ZGE4cW9SYjN4WmJiRll0ZDVVTlNNdTYyZHQ5emt1dThrTndi?=
 =?utf-8?B?SmNmSFgrNktSMXh5dmNtR2NHQmxMQk4xR3dGK21ITHQxU3REWDRzWVhZL1Zo?=
 =?utf-8?B?bEw2bHRacnlzeGJRWWxiVTQ2RkI5bEF5b0RnZzVBU25rWW1PakxRM1NMejAx?=
 =?utf-8?B?QVBWdWE0L002aTJTeGNjVjVXcTB0eHFlSG9DOEc0eXRDWTFMK1NwK0RLYmNB?=
 =?utf-8?B?OGVheVl1V212ZnJsQk40UFkxUUh6R3VFM0NHczVONEV5cm10enBCSDNoQkY3?=
 =?utf-8?B?WmtTc3Bmc3IxaUhHZmpBQnQyc0ZKSTVxZzhOUnZlK0N0eCswWjdSRVUvdE1S?=
 =?utf-8?B?MllNc2JrUDdrTHRYSERObi9vQzM3Y1BVRWMxNVJnL2pqWWRtWXRzaHdPWDhX?=
 =?utf-8?B?Sk9vSzBFaThjS2ZRZ1RjbWp5dHBSNysxWGgvM3JGYXBwanVVbkw2QlVLNVQx?=
 =?utf-8?B?M0RaRVBxMUkybjV6bGVhUVFkOVl1Nkh4Z3NKU3liSGFNcWxXMkpTa2dxUTJ2?=
 =?utf-8?B?blg1S2xkd2lNOXVkYno3UUZLY0ptTkFXVHJpQ09uOVNPeDNObGIvVFhVQm93?=
 =?utf-8?B?bHR2aW1TQmkzQXhIZTE0TTFsRGRmYzUrS01nMFNIY053RFB4QmRIbkRvaElO?=
 =?utf-8?B?T2xqcTcxU3Y0RkF1QkQwajY2c1lTU05QU0VlZzBTdDBoVDhjUHh5UmdPRzZo?=
 =?utf-8?B?VC9lUytOL0RDSlVWTHAyMHdwY0lmWlJIRVpMMkp4K0hBeTdKaFIxT3pnODlr?=
 =?utf-8?B?M0o2M3czb2MreUlSanJ3cDhYZlk2VkdtNlFjNkxwekZOclBVWjhyRFJ3eU1W?=
 =?utf-8?B?WDRSRFJzVzF4NzdKUzZoaE5LZXBKZlA0cDBXZlFTZ3krdDJzU2Z1dVllNzJq?=
 =?utf-8?Q?Jg99Fy1ly28=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHlBMFVMNnZyKzl4MVVBaVYycXJFMmFPTEUrWEVRdWdHVDUrOEVST2JvQ09K?=
 =?utf-8?B?TUdObVplMXFkdjNTcFNNdlQ3T3VENWQyMmZpSTJLeUpDRXdkbTFacXRLRlNh?=
 =?utf-8?B?U3BTZXgycForN0NCSU4zTWdGMWhUUXFFKzBDdnVIcldqVlFCN0NxTE9haVd5?=
 =?utf-8?B?NjVpc0tnTDVVaHZ5U3NVYTNuaGxzangxZVNJd2dLSG56MFFobmdQVHRIUVZC?=
 =?utf-8?B?TlhVaVJLRng2TTF5dllTWFlkUnp6Y2F3Mk9MUjJnTGZMbmdLTlRvdWZJZGZM?=
 =?utf-8?B?cFlTSk5vMmVXMEREZ0NOOGlyT2pmdHBlcGZiclhjSndyRXVKOVVrNys4T1FG?=
 =?utf-8?B?a09DZ0EwdFpaa21YSUpBcndDQUMxNmNhQXpxcXdSbWFYRFFHbGhwR28zNGtG?=
 =?utf-8?B?MDUyNmtPM1ZYODNYS0hHYUpJZHEzM0E3c3ZrcnpZbERQQzk2UjBPU1gzMWNC?=
 =?utf-8?B?bWsydk55ZTFJWmdMcS91YndCSjc1azJLRklZS09Va2xWQkgyZEJ3NldYNWdT?=
 =?utf-8?B?Rm85UWxMN0RPZm5YME9Nak1NMXY0OFlGNDVCajhoVEdiQlVtRDFGS25mY092?=
 =?utf-8?B?bkdUZEtMUlc4VHZqdUVudkcrczNiTldNblpoNDRDSWdpWnNzd0FDUDlWVXpU?=
 =?utf-8?B?VjhSZG40UytpdHBDalBUbVVWS2NZTEtsTUMvV043RUdlTVh5TlVhaFg4ZDVG?=
 =?utf-8?B?WUN3VWtHMUQzWDBDL3IyQnk5ZGptdnZhS2p1WktGMHVGa2xaMHF0K1k5ZzZz?=
 =?utf-8?B?N1l4Mkk3MWNpcjBYTGxDdU1tdG5acnptOTlwVjRIMmVGdDByT3lieWJ2NElZ?=
 =?utf-8?B?OC9yc1k2YWxHZXJMSEhYbmVONEh0R0lLMWF2cWlYM3JLam1IaDdwVFpHWEww?=
 =?utf-8?B?bXRwbDExVlVSdTl0TUtNVUVUN1ViNnp5V2ZZZzhTR29kV3M4akdvWkpFSmty?=
 =?utf-8?B?NGtqVHhsbUdSTWxnSDd0bFIwalpzL28wQU02OVdET2pPVTNOSWo4dzVvMUNL?=
 =?utf-8?B?Y2owdCtpSkMrU0VwZ0pCb1pxc2ZsRDNKamlFbW12ZElIWWQ3YmNhbTZWT2dp?=
 =?utf-8?B?cUpWMm1rZ0g3aHBNTjRIZGhPUVJobXJYK1NXRHVnK0EyS0lwbmZSdVlFalZM?=
 =?utf-8?B?ZWdOZEZKdlpINFRDMzhQWUQ5UWVIVUFtbndtaUphY3hzOFZCVEJaUGpMQXgy?=
 =?utf-8?B?cS9NT0h4ZnpkWU93UERHMCtTanlTZk5XQ0FWdHk1aGVCYldFd3lIT0dXbG1R?=
 =?utf-8?B?Qitna3NOQ1JHNmVjbHNOQ2hPaEt1b1pyU3FLa000MmxaK2NGZEU0aXlxOFVB?=
 =?utf-8?B?cjRuVDczeW9KRUFsQnRDRHVYZUJuaWRrMjZKWjRMV3ZwVU5kNkhicnR3OEtu?=
 =?utf-8?B?VXpNWW1TVGJkandLMFFYT1N4UjVGVkNaOGhEbjhYNTV0QXVDTmdxanJ4OXZn?=
 =?utf-8?B?T3ZjSnRDVzJZZk45aWI0OHVKemZDQisvNTg3a3gzcGpibzhLdHF0RDJleHM5?=
 =?utf-8?B?YjlPVGgwVU5oUlNEZGpWejFPdCtrRTd2eVpIdS81dWk2SHJVQXZSemJaUTh3?=
 =?utf-8?B?VmlRd3d2Sk0rQy9INWpaSVFVb3lVRnE3c1JFaERPZ0RTZUd4TlVDQlFoN0tT?=
 =?utf-8?B?eFpiWTZtS0JnL3YwdTVvL0RqUW0zZjVPRWgyaXBLNFhBOTMyVUxlc0swcmxp?=
 =?utf-8?B?S1JSTW1sTEMwN0dSWkg0d3V4UFF6WGJNcmtLanlucTJJcWNFaTRickQwd2t0?=
 =?utf-8?B?NnhITE1QUGdGbTNzT2MwV0QzRmRjaGVJdEJJdnF6cVJ1bXpOY1BGcTNLTXk3?=
 =?utf-8?B?YlV4aW9tV20rNTFHeDBURkRDTzFRd3NEb21Edklxb1NEY1lnYUZNWWRNemxW?=
 =?utf-8?B?cnZibHdtQk5TU05rZ3o0UTlnNmNBNFVhVzdPMDZpMGc3MGdhbkN5ZEdTRUdi?=
 =?utf-8?B?VnM3Vjc4Z0dBWTVPeCtjS3k0a1MwdHVLYWdrY2sxa2svdWxsd21za25XNEMx?=
 =?utf-8?B?VDU3Qy84eFRqWmRTT0ltYUtuQWRVdnBVVCs5b3NWc0pZbHZVRVAxYU81YWRz?=
 =?utf-8?B?aDVvb0JhNFNIV3JXUit0aTY0UFpoVG9zdnJBTXZLcnVUTHdzanNSYWd3bE9Y?=
 =?utf-8?B?S08wdy9HRDJPR0ltb3lqVklZUjdiRlkzN0pIVWdLblpBOU16RThHdU9TOUth?=
 =?utf-8?B?TlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Wf1PqFVKwOnMTdVQgjRWKtAjZiFb2QYGyxrePwtan4QI28Ubt8uwGqY5QYIZbngcWVgmtLcgb/76S6Z3jk+n8I+Y16JkE6ljSqLv4OdWm5Xda4UVMipxkCpOSoyd6DZspLHI1hRRujLmTGGHHf5Z6bubTizSGBtR9gMQDnboE5JQWWyi4IIyfmObYY2jN+G2MdAPjaObgnYwBAgN2knxUZuj0bIY15pwtUrLcCnGPz8QoVVLrAmZgKq/nm/ECdAntqOvo4v78NrxqOW45q20VO7EN+mU8kHzmU4wDUJZBbvVtZ4XLftWQ/9I+wG9LNSw4Pc+6k1h1/z/srJ8M09kDOQC7YAOWKXH9HvlTUUKrBQmXuh19F8JGLpqk2RWQg/9QhAEyNLvDNsy1IWjwbLGfLkarFFpSnjeaXb09w8GrkPtNhdKdj2YO8M6nYh2n25JcqwHSyhWfpVAdujJf9bGbSeVG0m20dO7kTyinDw4v5UX6ah3+mwERiUCWyWLSvDitlZeGIumR+YQzRBETjL7FDE3H4Jd6GlvUYO3F+thNJAghnXuZkrL/bLOE/M6mzN1HyZ00fLpF69AOGRN5pp+93DTP5Nl8OFfAXSB+2RB5ek=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cd812de-6d91-4708-c31b-08dda282d5fe
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 09:41:37.6698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CUPYbWoyjfAuZXuRcNOeNV7soI97iWetLuVU2PIlTiFdJxU+9MiG+PazhOvPXNJ9ULXotot+FIefR/8VKaFNbUHebWEa9CVxT6ANP3rs2cQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4990
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506030084
X-Authority-Analysis: v=2.4 cv=Wu0rMcfv c=1 sm=1 tr=0 ts=683ec354 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=A2pY-5KRAAAA:8 a=yPCof4ZbAAAA:8 a=20KFwNOVAAAA:8 a=1XWaLZrsAAAA:8 a=rJyT6b6ges45llXj1sgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: j6m-D1TvbfGZvJbttBxTyG4JPRdwzQZf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA4NCBTYWx0ZWRfXzK4WViESgk12 URecL9dyYFxs8q4QLfI5JSRSuMVIYKbiQvF7Qt9d75c3hBycOtswRC9aUxYGa+7eBeXDpgVmiY1 nXiQCLeUVvgXKyOvKqIbGkz9OdB0Bj8I3y2xhP3YcMaac338FAF5+xqwMgrKTsv2lXKGNE34QAz
 mKelJXDo9vrLn4g6lRwbfe0SvCQ09nC/yOXaHIYxwOTVUW1ffNQwyUDId2oLk7/VUHpg92Kg4cg zKybVFh+anUQkezCvpZ8yugGHeav/eEwJOq6kpP8kfpB2HyFE1SX8hoV/Nvfaj+L/iaJ63tU7M2 bNOVbfSegp6sREZqeGZFxzNw1HhhMzSedW9cQegC9sZuqOdBF79DQC6csfL4rss3kLPd2SJCpMv
 PhGE39gP8DSka1nR7rfPCpYP/odf6yfkstIal6LyBetAkPgQbgqPvD86mTKgHlLWb0GVHSg4
X-Proofpoint-ORIG-GUID: j6m-D1TvbfGZvJbttBxTyG4JPRdwzQZf

On Tue, Jun 03, 2025 at 08:47:04PM +1200, Barry Song wrote:
> On Tue, Jun 3, 2025 at 6:11 PM Dev Jain <dev.jain@arm.com> wrote:
> >
> >
> > On 03/06/25 7:01 am, Barry Song wrote:
> > > From: Barry Song <v-songbaohua@oppo.com>
> > >
> > > We've already found the VMA before calling madvise_free_single_vma(),
> > > so calling walk_page_range() and doing find_vma() again seems
> > > unnecessary. It also prevents potential optimizations for MADV_FREE
> > > to use a per-VMA lock.
> > >
> > > Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> > > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > Cc: David Hildenbrand <david@redhat.com>
> > > Cc: Vlastimil Babka <vbabka@suse.cz>
> > > Cc: Jann Horn <jannh@google.com>
> > > Cc: Suren Baghdasaryan <surenb@google.com>
> > > Cc: Lokesh Gidra <lokeshgidra@google.com>
> > > Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> > > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> > > ---
> > >   mm/madvise.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/mm/madvise.c b/mm/madvise.c
> > > index d408ffa404b3..c6a28a2d3ff8 100644
> > > --- a/mm/madvise.c
> > > +++ b/mm/madvise.c
> > > @@ -826,7 +826,7 @@ static int madvise_free_single_vma(struct madvise_behavior *madv_behavior,
> > >
> > >       mmu_notifier_invalidate_range_start(&range);
> > >       tlb_start_vma(tlb, vma);
> > > -     walk_page_range(vma->vm_mm, range.start, range.end,
> > > +     walk_page_range_vma(vma, range.start, range.end,
> > >                       &madvise_free_walk_ops, tlb);
> > >       tlb_end_vma(tlb, vma);
> > >       mmu_notifier_invalidate_range_end(&range);
> >
> > Can similar optimizations be made in madvise_willneed(), madvise_cold_page_range(), etc?
>
> Yes, I think the same code flow applies to madvise_willneed,
> madvise_cold_page_range, and similar functions, though my current
> interest is more on madvise_free.
>
> Let me prepare a v2 that includes those as well.

FWIW Dev makes a great point here and I agree wholeheartedly, let's fix all such
cases...

As an aside, I wonder if we previously didn't do this because we hadn't
previously exposed the walk_page_range_vma() API or something?

>
> >
>
> Thanks
> Barry

Cheers!
