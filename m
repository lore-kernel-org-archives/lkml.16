Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779DE1FAC54
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 11:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748951609; cv=fail; b=mGzS/duHaqGCgQppvqrSGdeLAW+W716pOd192/e5+3/eInOLaosUdOrPaxvx+g3FMkNQaE4K0vs9/6ntrGijfzLd6qGbSiOrW31IJO3gsU7kwLAaRDxrKED3w9b+YqVJZEnY5l7Ge+wQBuDnbwA0/bhZJuPAG3Jjig4jw9vT0nE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748951609; c=relaxed/simple;
	bh=hpkul1H066aUzsQz2BJ3YvxuwHchAmXDeGw6jibKzz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Er4bU8QCCGYilAENyLRBGm4SwNtERzO54Tw/BkD/wsf5EJTKqKf6btF+lxModDv+lqxRBoA2h7J7ZZrQW6mu7mlaIAmyVOIfMWMmcK0tBKJUFvC5oPnh7Mbie9A5ViaYBlcuu7LVqOVv0olAKdNjgJbuAOGK3shZyNf59tCxsKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ksbcjqd4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XqWUgdWT; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ksbcjqd4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XqWUgdWT"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553AEowP009177;
	Tue, 3 Jun 2025 11:52:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=N66PR5jELjMj45Phpo+qAHb8lce3PgvPCOprzjNap7c=; b=
	Ksbcjqd4jFXr72Dh8jc9v7Ok5masItd1c5GlpGCTWjByKjqaW9YiAuV8e31XRfZD
	geidaDg8yrXOQ+RuEq5YgNU2fUEsgEQPniRUtNdyUn/zqQDlROTeNht6BYO+Xl27
	edWeEjxl/ZJvt9EZ4uwVpFAtb1slzOfpw8HLZ+3I83gtyiG7Jkd+QL8eR82ieHS7
	lXsd6wiF1aDArLD/Xc8ii9xRAzlQUoy05rWbC71rv7cYgvakht1qxqgcO1119YRH
	lNonfyb6Wfm18nqWNFQrcmYf3Q/V+MPQFDoGh2AUrrhtzcHXIqkFFJdkajHzLpoJ
	FH1HC5Hbt3EfEpBbYLs2IA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471gah9qfx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 11:52:55 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 553BQtmM040666;
	Tue, 3 Jun 2025 11:52:55 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2052.outbound.protection.outlook.com [40.107.94.52])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr79eb03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 11:52:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X3CdXHsvqfBo/ynlwWf7M4TygmX4eJA+M8CflfoAsIjNntKl8kDDehuf16RYbIClw36iR5/eCBBZySZ5CKRuC9H9fmV7uL2cYor9wqxRPg6ekM7VlnlzD50V3tQjb6wqpDU7rW77BEhx+XNHm1cOPGvT/jZSyZcUtUCfcJMCikl46145NY+UM0SCxrxFEkELghnnEI9Ph1lefEgt7/ntx6e3Jdts6QeWUgp0BjmGRhawAxIuP7bh5vIwHZZ+aki0CuowhZiCACuRyKmSOjkUmVg4NGsfpXxBvEZECXcEeaGP9MxtVCnuzIG/PXKORMleuTH4QEFcdZePXgGHqordCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N66PR5jELjMj45Phpo+qAHb8lce3PgvPCOprzjNap7c=;
 b=smEXc6EPUvAhAMG4+BEJU3uGOcyrN4WjU/4wWfYl+m4mS8RfCW1TzBjaLbC/6VNf/wIq1g6TmuKmLPc/RKwMz/k0DItiWtUUqE1vlOaqGmnxBJ3QblIVIOCFGBVXXdS3z0m8I25Rpg5Zeor7y7ulVMXAr75m4pw4q535oJvoBM3KGzyevwlia+JJOwEEhV0R5dBQggXpc59EtyrK0facOSLF4NnTLVN1Bx7eiwtNk1O7UIhQ4yqqrJMHDwldkcq4p0OTE6OMoisivw6i/MTa0svsFBV2bCa5DFTVyCGXNbatPObAbtnzVmOyELU50P9zYrIThlOysAQCMf+3fxnKoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N66PR5jELjMj45Phpo+qAHb8lce3PgvPCOprzjNap7c=;
 b=XqWUgdWTPRz9p3CcqWC+i6Cv5KR/lBkbR8nNtyq8Jpry3UjjyGg+spm/FXPB8QKndsiRelZmAFy8uCfo33MvwzlU40gIGVAxNaeFt8XOaZk1RZGmU/dy/0WqvNCM4RHbvCHx7o/QL9imGaIMsUHm8S6uWm3GsGMNt9C0hB8arKI=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS0PR10MB8078.namprd10.prod.outlook.com (2603:10b6:8:1fd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.41; Tue, 3 Jun
 2025 11:52:53 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8746.041; Tue, 3 Jun 2025
 11:52:53 +0000
Date: Tue, 3 Jun 2025 12:52:51 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Nhat Pham <nphamcs@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Yu Zhao <yuzhao@google.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>,
        Kairui Song <kasong@tencent.com>, Baoquan He <bhe@redhat.com>,
        Barry Song <baohua@kernel.org>, Chris Li <chrisl@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] MAINTAINERS: add mm swap section
Message-ID: <b8a29b77-5a3e-4c2a-b9ee-bc0f75a8ba5c@lucifer.local>
References: <20250602152015.54366-1-lorenzo.stoakes@oracle.com>
 <CAKEwX=OVMc1__uNzwfk+DBU4zLF+KQQBG-STWF+h8aB1mdCBLQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKEwX=OVMc1__uNzwfk+DBU4zLF+KQQBG-STWF+h8aB1mdCBLQ@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0484.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::21) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS0PR10MB8078:EE_
X-MS-Office365-Filtering-Correlation-Id: 25aa318e-01b2-45ca-13a7-08dda2952c04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cjdmbkc5SnlTNkhJVEk1MVNONG8xSUI1bXFIbDZGeTR4L2FDT1pRZlhndjRh?=
 =?utf-8?B?amwwdlVaMGw5RFR3L1NyVlVWclRNWUY2ckNsWUZIMFh3Y1JnMExEb3YvU1dC?=
 =?utf-8?B?NnZPRmxSbktVcnMweUpYZlRrS2kzRXNaSGdFRFRRQzBqZUZsYmhkZFBOYXk5?=
 =?utf-8?B?aXpKWmwzWC9lVStNWXZlb0pjcy83d0FXNGlDY1plNzgvdzcvdDQvb09BWk0r?=
 =?utf-8?B?ZE5QbkRPaE9pc3lieENCVytmUDNXS2pvdkJmU1Y1aGMrQmZPWVBJV0UxaWZu?=
 =?utf-8?B?clkybUd2Z2lqZnZVRnFnTXh5aTdhNm5RWVZzT29Uc0hiRzhWY0pZVndqT2Q4?=
 =?utf-8?B?ZTh0NVdDVi94YXVadVY0Skx2QzRzeWtDSTFvelB6TStGa1JqSllaQ3pwWkxZ?=
 =?utf-8?B?RVkzVUJEOE94S0NrVWRkbGsyVURReXhzRjd0bEQ5Sk1IUm14VUpza0FYRWY5?=
 =?utf-8?B?c1B4ZWlRTVR0TWtZa2U2QU9oeUtpV1psZGdab2tBQnlXdGYzc0UvREx3bnFZ?=
 =?utf-8?B?eFA3TFpPT1RURzR2aU5MeWJXdm1VenRKald4elBFYVZNVHhCL1d3SitYNWRC?=
 =?utf-8?B?OENIRHZiV05aZEMzb014b3lkQVhCRTh3eGVUR0x3T216Y1oxYWJyZGRqNGpy?=
 =?utf-8?B?Q3NYYUdYVHdyd2dldUdQWXV2NlpuME1oTnNneVFyOUNGUlIwWlJ1WFlBNGdt?=
 =?utf-8?B?RVBBUnUvQWFqWnduQVUyRGI5OUFGdENlQmZ4Z2F3bi9qV1ZSYk9QK3ZhUWhk?=
 =?utf-8?B?VllvY3MyNlJwT2RtWldiY2xqVDZWNlNEM1JNQWVUWklMenh5LzQxVlRCbE5S?=
 =?utf-8?B?dDF0TXdLaFJ1K1BvcFd6TVZ2cTVLTzBwM3pUOWNMMVgydGhQYWQ2YjV0UzZO?=
 =?utf-8?B?WGQ4aDZwTTZIQ0hCTzY5TUUyQjVOUy9tODE1dUlTMlhXR3BWUmNkTzdmcW5J?=
 =?utf-8?B?SjYvaHAyblRCZ21WOCtLSXlIU295ck9VcGFNeVcwdEY4RnhhMElSaFFzbTU1?=
 =?utf-8?B?MVVUbXNqSjl5RVZEMXlRSTdaSjFRZC8wTS9Md1ZVSC9kRTdVQzdiTzA5OUNM?=
 =?utf-8?B?MmVaOWxveW9WcHU3Mk4vN1RSUkg2dVpFOFdrR24xQ0lZRHN0SnVuNnFNeWxa?=
 =?utf-8?B?cDFYTGk3THV4SzBoNG5YRnBBc2FNa0c5ektmUW1nMlpMajZia0xiWmVkQVpI?=
 =?utf-8?B?NzdjMHhMK2NqMWgwYmphcnRZYWFCMnM4VnhUVERBQWp5SW91bUZKWE9lZWRE?=
 =?utf-8?B?bjQzbUd2NHUwaHVHbEVVNmZMYy8zZmxzNHRPemQ1cWNua0Q3aVNhUWZvZy92?=
 =?utf-8?B?eGxGa1JFYlV2Zm03NWdoUGJzRy9wVldoTEpGOEVCSXlzTnZYTGFocUQrZE42?=
 =?utf-8?B?QUNJYTM5VERFZm9EaUZWNUNtbytmQlVtaUh6M05zbXFaKzVubUhRa05mQ2VL?=
 =?utf-8?B?WW1LbHJ2b2I2UGdqVDhUN0hKT2t6VEROUFo3cVFIdDdENjB4OWVEek4zZ0h3?=
 =?utf-8?B?bUZVWDFjNjFXejR0OVdXOFdjaC9Wc2RJNjNSS25vZWRIbVQ3UFFzdThiOUJD?=
 =?utf-8?B?MWtiVnFIc0J5aXRXTWJHNytCZWxDNldQdXpyS2ZlaGI1elU3SXVVc0pvTzd4?=
 =?utf-8?B?V0wwODJpc0h2RXg1aEZid2FmS2hja0V2WGx5SS81OFFvMDNxQ1A4NGt1ZDdG?=
 =?utf-8?B?Zk4reTNpL09BQzhaa0pWMDB5YWZ5Uy9SRzNWWXdjUnlVV09qMWRBN3VoRzFS?=
 =?utf-8?B?T1Z2L3ZnTmtYUGcxbjNJajBwVGE5QmNPejBGQllPcFc1ZUJtSXU5VVBweUtH?=
 =?utf-8?B?cFpJTk9XZmdnZ20rR2hsVGxtTFplVEFFdXRkOG9od1FHekg3bWx6eCs0dGJv?=
 =?utf-8?B?SmZqR1RMVjErSzVBSkUwMXJtNGxpYVYyblNDZXVLUVNrMG5Fd09FVTBHZUMw?=
 =?utf-8?Q?mLtYq8JFBbQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGZ0NTNySktNSWlxTUdQOG5sSS9lOFdCZmlVNmR5WWZCN1BNSUVsdmNZNUpj?=
 =?utf-8?B?ZUtBMXZSQTIzdGpNYWNjZ2RNYmJzUGFOazc2S2NvWit2b2ZkdzVMUWx1NFVE?=
 =?utf-8?B?ZFYrYnZ4TExFZFJiWW5zNEN3UEw5M0RLTFFvR2UrM3ZtRUpTMGIyZ2hFOGcv?=
 =?utf-8?B?eU1VWDNJRk9MbUNaeDJ0Q1hUU1NqSE01MDlYdTNsaE1sblBqN2RKM2s2Mk1n?=
 =?utf-8?B?T1JMbzFKaFlKanVCTmNxQjYxSlhPcUdLMW1Zam5TZUdjZmJLR2ZzWS8wbmRL?=
 =?utf-8?B?dzNPVnhNOGFzYjJsV3ViNVBHbllkZzNhU2dZNTM5RDY1c1ZyUDg5WURqQVRo?=
 =?utf-8?B?N2dxVGhiZlhIQTlaYkxyZkVRWU5qUlcxUXJnekJvMjRTbmxja2hIQk9Rc3Qw?=
 =?utf-8?B?ckE3TUFuc2RPMUhhTWJ5S01BQmpvenVWcGVPajhJQkhOOEQ2TjBzUWJNeEhp?=
 =?utf-8?B?eW9ldFRzL0xTMEhNbjVkQUtIcE9vbG1XaWx5MDJkWFFpNlc0R3poclg4bEZt?=
 =?utf-8?B?Z0gyK0dvOVArWmxlOFA4ekJvOWxRSjdTU2tVZFVhbHFlNUFlZjlpc1FmUjBn?=
 =?utf-8?B?aTd4YjBKS092cGV5cnNab1Z6dUdWd1pLa1ZIdEhRY0FxQStSSXQ2dlF3aXJ6?=
 =?utf-8?B?TE84Y1FRai9VWGRHRFpIaURwUkZkaklISm9tR2JCQXhuc1BDQzl1bVFxdFFx?=
 =?utf-8?B?d004SXN3OTdheVdJSEhKbmpVVFBoempxOFc3dG5HWkN1WEpBa0E5aWhaR0l2?=
 =?utf-8?B?TTdGTEtZeGdUeGJlUjQwZnVNdW12RmRzcWNNRnZPOVVVbjczb0xBTjhUbTlw?=
 =?utf-8?B?NzRFdTBJMFdIYUQ3SUZtSDdoaDU3WmcwcHl4NllOSVBtaEtYbkpnQkFZeHNT?=
 =?utf-8?B?cEg1RHpSK20xOU16dE91OUVzVmF3U1FjQmdKN3ZYTlpFNTN1ZmNKeG5FeUo3?=
 =?utf-8?B?ZXhPcHlHKzhQanBkVzdTeEtxWVUveUVkbnMzS0NRWndPY1pYNFNOeFBmdXNZ?=
 =?utf-8?B?YlVORTBEVmdQUmlDY2xTYjlkT2dGZVQzQnVxUFg5bUNqdm5mTkxUeGxpMi9I?=
 =?utf-8?B?UXJUWDlCY0tKM25HWG1WdktBUnRzck1DTFUzTUtoaWI0SFdGV3VhU2ZQRXJ2?=
 =?utf-8?B?emVwQStMVWNPVnR4Q3hRY1FRU3hNdDlNenB4dzBicDQva0hqY2lJME1CQm84?=
 =?utf-8?B?QURnWW1MNmM1TnEzYWk4elFNWXVFd0V4aWpyN1pEMHFrV2JMbG5CcW9CdmtH?=
 =?utf-8?B?QVJwWTVJTHdmQ3Rld2xUODZSczFQVzcwMkpqOEw4eG9raU90ZEdtdG1hcmJT?=
 =?utf-8?B?b0F1MTNnL3l3YTUyWGo5VHZEU2haaVJ6K3Q1cUJ4N2gvU3hmbWxKTXhOa3hV?=
 =?utf-8?B?YUVudUY0WUxQbGx5UXVTT1dsdlJnSTNDV2xCR1diYmJNTVNkN1lwQTNtcHVB?=
 =?utf-8?B?Zk05WW5KNjFKcUVjUTFyMzBJVzN5SHF0WFgxRkp2SXV6T0lRTEY4NUhFUGx6?=
 =?utf-8?B?RHFtMlFxbmtwMVZTWGdvWnUyZ1NuWjd2ZEttTElNeklnK1REM1dSNjMzS0xR?=
 =?utf-8?B?VnVoc3BveGlnWDdua0JWTnJQdVhTWTJ6UytRejNEQkpFWlYwOXl1NW9Cclk4?=
 =?utf-8?B?VGxEcVZlVVNRSVp0SzIxTURJTXJFSnJWVVByV0Q1N25vSHE4QTQ3Ui9JbFlz?=
 =?utf-8?B?djd3RWZXYjRPeTVkWlJqUnhETmhnMTVqZ0s5UFQwdVVDMHU0ZFdSNGVrNXZz?=
 =?utf-8?B?QVRxbEtSK1hkZTR0cnFPZXpDZzdDb1o5OW4yUVl0K0hFc2tSRkVzR0pDYUdR?=
 =?utf-8?B?MStjaHI5aXREL01CR3R1MXgyd1VhUHRKUUlHd2FCWUFmbnVvd2Y1S3J4VUhs?=
 =?utf-8?B?bDNhRktVc2krMzVMNXRQcy9CS3dxb3BCWllqNWNvejNiU0JlUkt0bjZxS0ph?=
 =?utf-8?B?TzBxWGJabHBQb2ZTaXpOVExaVFJvRkpIcGd6YjE4WmxZeHk0cEoydDlVRnRM?=
 =?utf-8?B?RFovc0JuOVpzOVVjQU05VXAyUHhRV3d1bjA2Y2o0R3ZMY3R5Mlk3Vkt3TlRr?=
 =?utf-8?B?bVdzQko2aWhnVXAyK1JmS3paY0hRWGl2eFlScml3ZXRyWmxZc0lHMUF4b2JQ?=
 =?utf-8?B?ZUErU1VMOWJ1OFBDNUEzVXVQVE9pU3kzekFxQW9yVlVzTGRpc3ZrWDdSU3VR?=
 =?utf-8?B?Umc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bdHGhupHbWBpmKk1J5wZsSc2NPGYI7fKLehAvqnSuM0mA0xTUzUjkwbAMpRDxyABJH67T65B7UqsesGcPN8dgmgwav5gI10AP4edYFn0xuvbzUnEpU0ir77KQDHganpKWLlfxXzkGwSeAbqPAfyb7NmFkoMjbX5ixCoqlq4lNo836SKmZlLtXw/3CiaN6OZ83qynWultMhxHA0An2c/KEBoYvMYogQJWG6fPtd+Uf1Qrym51+t22A0YR8YP8+v89hqhVdBBvU2W7qEZ0WBwIpTQ65l58xhCn0xcnhjNvQkB8yyAK1n4C+Ee1q2o4/nFoBfn3XA1Uwr59zS9LTh0nZT8mIbcQv4BzVqfK9Jv8PxAACckqNSayBh8Hx4aYozMdgDciHQEU84+o4VhaGfWE7FP/kyZmkpUPjv4ZSpr/8DZ7yDGfFs7QMp9ejAOQpa+ssIhhiXdyo7YbAemwQGzJLkOfs2cYB0trydSmFxXFe0y8RZpnI/wRb1twfUTQFry5+Xw7vinV3nQa51zp6320wu3zEucZjY1PZ2BpiNxhvTt7oU4qrZEYt5XSaGYDCixp7vMn5Xr6LYdwyW9uJlZe0t4ThEp4Ep10WDlWsgDIEgc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25aa318e-01b2-45ca-13a7-08dda2952c04
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 11:52:52.9578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MZp5lWBhhbrytEOfzOUswPqiwR3dj1atgGki6+0NpTdKhSgJGC7QKuCv43x5nLdDiYEpJYPfrKR5qGajRQVvj0r+6vJqGuCKmEucZD1d9QY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8078
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506030104
X-Authority-Analysis: v=2.4 cv=aqqyCTZV c=1 sm=1 tr=0 ts=683ee217 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=Z4Rwk6OoAAAA:8 a=1XWaLZrsAAAA:8 a=AiHppB-aAAAA:8 a=GvQkQWPkAAAA:8 a=pGLkceISAAAA:8 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8
 a=37rDS-QxAAAA:8 a=KZbMiOdU0Ycv5RSRWL8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=HkZW87K1Qel5hWWM3VKY:22 a=k1Nq6YrhK2t884LQW06G:22 cc=ntf awl=host:13206
X-Proofpoint-GUID: uzYwWf-14CsrFEHlcF2NyM1ScPtbnitb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDEwNCBTYWx0ZWRfX9uXuEAnPfvW7 uwE5JLde7xdB8ZS1Czod8JvkZDet2FiOzQlEGZQGFlxdei2IJZ6EpTuPSdJAumzyNo/DRCzLOIO g8CfVr/gn1BBA2lZicxfyZN7tZhg4PlTWwZ2rakdfLYnGpXZ7k6jx0wexKc4CpbyWGnlYFrbSoA
 voxQgLRGb4DikHM0BT8c1fWXM2rOHTC6QrOSqQjJRHfY4J5iOnOlRUZ1uhEIDtGRmnNU8MnLUJ+ pV6M4EfVtBfKe5OsfTT3S1trYf2vY716aM3CXS2jG8SZy4+BABrV2Q84Pdj3waQhWishJJf7Ev3 VcEyo91mkqjybXC7cnfGSH0JwoFVZXJ6A8d6gzRMyHDokQLmZW/eGTGjGn5gFudMFawX8klmtoU
 7QKMKMSyxoQ4ui/hpAkX0Q7mgUwASyjFUi8tBelaxJx5SxNxVckPWovcSgaHiRrAp7k06jsK
X-Proofpoint-ORIG-GUID: uzYwWf-14CsrFEHlcF2NyM1ScPtbnitb

On Mon, Jun 02, 2025 at 04:52:43PM -0700, Nhat Pham wrote:
> On Mon, Jun 2, 2025 at 8:20 AM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> >
> > In furtherance of ongoing efforts to ensure people are aware of who
> > de-facto maintains/has an interest in specific parts of mm, as well trying
> > to avoid get_maintainers.pl listing only Andrew and the mailing list for
> > mm files - establish a swap memory management section and add relevant
> > maintainers/reviewers.
> >
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > ---
> > REVIEWERS NOTE:
> >
> > I have taken a look at recent work on the swap and chosen a list of people
> > who seem to be regular and recent contributors/reviewers.
> >
> > Please let me know if I missed anybody, or if anybody doesn't wish to be
> > added here.
> >
> > I also realise we have a bunch of non-swap stuff living in some of these
> > files - we will have to address this separately :)
> >
> > Thanks!
> >
> >  MAINTAINERS | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e66460861bdf..3386272f6bf4 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15674,6 +15674,25 @@ S:     Maintained
> >  F:     include/linux/secretmem.h
> >  F:     mm/secretmem.c
> >
> > +MEMORY MANAGEMENT - SWAP
> > +M:     Andrew Morton <akpm@linux-foundation.org>
> > +R:     Yu Zhao <yuzhao@google.com>
> > +R:     Kemeng Shi <shikemeng@huaweicloud.com>
> > +R:     Kairui Song <kasong@tencent.com>
> > +R:     Nhat Pham <nphamcs@gmail.com>
> > +R:     Baoquan He <bhe@redhat.com>
> > +R:     Barry Song <baohua@kernel.org>
> > +R:     Chris Li <chrisl@kernel.org>
> > +L:     linux-mm@kvack.org
> > +S:     Maintained
> > +F:     include/linux/swap.h
> > +F:     include/linux/swapfile.h
> > +F:     include/linux/swapops.h
> > +F:     mm/swap.c
> > +F:     mm/swap.h
> > +F:     mm/swap_state.c
> > +F:     mm/swapfile.c
>
> BTW, should we add mm/page_io.c to this list of maintained files? All
> of the functions there are swap-related.

Yeah Baoquan raised this also! Will add to un-RFC'd version.
