Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA9A28399
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745924471; cv=fail; b=DgeLs8eaCeWvCRj831WzfZEW7tmkr+9XQrLb90P1+WEW8Q7UTN64TV57gD0vvLTf16BWfCOG6g7sjeEVgUxbXpGeG2zgss+VR1TWNXs7/xTPOJS/xgK/kcLnDWh7q2btHb1ji3aqXyqquhaHRcAw39wEDGtjlpGeB3AxL7z4zHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745924471; c=relaxed/simple;
	bh=laTbe578FGE+MkI2tK1olgxO8u4ygZ/fR3UTUlC629E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HvHK7xXdhrh6dR95eOhQN4FvoC2TQA88r1wNE95lPfVKE+L2vQ5yskBVp606DKJhpVV9M/ueThlTgscgskQrnKdCGELy9W0UckbgEqfFSRq8S09rFUB/UvTCYbUb2zLTpd5kH22I8ri1Uf1H+mwtOVkJnCBnsC4jfVfAbsaI6PQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=W05rPCJ5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RJmHjxV1; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="W05rPCJ5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RJmHjxV1"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TAr8oW022470;
	Tue, 29 Apr 2025 11:00:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=KjZto1b7tTkKJb5UVq
	pycLq31hDjzC2UkSbpCVLhauQ=; b=W05rPCJ5EmWhJSMjkcoKsDu8Pj2ryN/rhR
	7LkrowfwnivqJwVhD1KXdfGF06R1/Nkxy9gDFhlu1qepkb26blcMYXsh/hWe8V4D
	G/KV06cvCxbBWejev2LjtDt1jfRvwLIsoaghBENbCD57GERLU83M9N+aLShCaR1C
	wHk5SEvicbfpP6ccXbBvVqPjEcygC1vMl5bWt4KNiPcmwjuAEPv6bSpLnFLLcvgX
	WXTkEnyLSzoBqdotRTkPTSu7qNASGkgEzauFeKV0DbAium9BhawzpUTSV/Zh0nw1
	UF4eubjgy0NoopchzZPd+lBSi+aG1g+EpAU7MhEeQl6p8zcfsZyw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46avc90488-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 11:00:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53TAixcP023907;
	Tue, 29 Apr 2025 11:00:34 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 468nxfwphy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 11:00:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LYBzc/sJZriWEMhV6tjQ+YOaYXZkE7BsQZrxMBUpgJ3UoIVj1TUhJJ/p0CIyk5x3E8eme24BqRWnX1OWK7LlXrN/QH4NBmAG2PCgSB5j/8DeRQzp7XganE0SPfWJV3c9v/77jeVHD2tLenl3dBs1etiAYV1QWnZ6cRjchOYGLRs4Wtxk4xXdOrBp5is8VPC5so8AdvEuY7Rp1W4DEEqlR3MVo/XRck5cu4gZINT8zkgeLMCgVEI6t7d1EX+0EMb7j7RdWF3WevRsf/ns0yvXDD6hB6AFp6tJXb75vjIXcAWZgmI26Z49iUmBXp7uThSIkaLu+avasS/CJmlqLJzJLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KjZto1b7tTkKJb5UVqpycLq31hDjzC2UkSbpCVLhauQ=;
 b=G303yP+x7laJyODlCW1ZbVeEFDCF9h1kpX8fx+mf+cdJsBECy2NfoDp5hzrR9ogojTa4v6JI7pONNsW1Pm6uuQ7/84g4cqlpucU7rX3Xcoc560XgmxxEe8cw/0rwlZlvdKo8qcIopQYNxNNlVH9I9/4gaTLFpcMAoiNy8Xl9AGc/AGMHelET/Ykiir1Tm1n2pl+aCHGnLbhtaHVKZuQltubCg8F2iFoE5QsfdTSZ8mt0CuXuVrfvuF8HFy4FE7RzdT2HiH4dYvsrI1oNyA8RDqS6IpGVV06fpJQWaFpZn8Xnb8HJY2aoxW3mEJRqiZFx0Rsgvdkv6DDw1md9TFxVhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KjZto1b7tTkKJb5UVqpycLq31hDjzC2UkSbpCVLhauQ=;
 b=RJmHjxV1BQNu8Zfz7+XLTEsrcHFTyPsOkn/D1PYeguqQzgKa6IEwaDV602yBF6wxqaptZJViL85XBxqv0/VE3FGpCzhmLN7OeAmzRk2P9EY9lAdDxj/e67lmjfF0eI5/XpAsLvgSgyVJVbt/F4B9vyAKT3SaorjhkrVhND+Qvi4=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM4PR10MB7507.namprd10.prod.outlook.com (2603:10b6:8:187::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Tue, 29 Apr
 2025 11:00:30 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 11:00:30 +0000
Date: Tue, 29 Apr 2025 12:00:27 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, david@redhat.com,
        willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
        vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
        peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
        baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
        christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
        linux-arm-kernel@lists.infradead.org, namit@vmware.com,
        hughd@google.com, yang@os.amperecomputing.com, ziy@nvidia.com
Subject: Re: [PATCH v2 1/7] mm: Refactor code in mprotect
Message-ID: <ffecd4cd-32ce-4c3f-a5ff-0ced14b13f8d@lucifer.local>
References: <20250429052336.18912-1-dev.jain@arm.com>
 <20250429052336.18912-2-dev.jain@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429052336.18912-2-dev.jain@arm.com>
X-ClientProxiedBy: LO4P265CA0145.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::7) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM4PR10MB7507:EE_
X-MS-Office365-Filtering-Correlation-Id: 46e12eed-0b9e-4b6c-6552-08dd870d0e58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?N8ROwn6vYDPiOYNAI3g/+0B6ZqbfuE15mI+1/qxfwq+50b61kN5Su9AIwQHU?=
 =?us-ascii?Q?1vy0I/uC64dujpKYfZZRsg7MBcm1c3SjYWr4jSSW8XlR9xEiHEYT0GBLHnIO?=
 =?us-ascii?Q?re2tOYu1Bi1XCHY5SkylzKofmpOLo6SVlWrd9Iv7TtRex8J+D9oL1KypA3AS?=
 =?us-ascii?Q?A/2YvTVva6m9EQNTSth82kDOMc66hdqU4vSCmXB2uXv18LJ6VSITov0fGJnT?=
 =?us-ascii?Q?GBwT5ePgqrXrMTO0YIU4oxq3gJMzdPTsdcefZf8aC4ZNUYmZxnSoXEqLoh/8?=
 =?us-ascii?Q?K5yTtU7HwST1PQclO5X9moSN8KHiOuNh/tB0ENQ4+m6fPxSdz/F8KctLWX/t?=
 =?us-ascii?Q?shek3qw4wZUJPIuXGNRcRGuzmHt6TTSShI+7t6xJTc05SSFvnhPEmawDjpB6?=
 =?us-ascii?Q?dlo02Z1rz79yVcuf/bwQaJxJbD2rtwV5lEEB+BvvRddjS9VTzaMba/Utmva2?=
 =?us-ascii?Q?P1hnMP4ua9JG2vQuEORS/PdQdsKvRKEAVEifGYts4gOWk8q9TOhtBNtdWXTP?=
 =?us-ascii?Q?7NM+WUQpSojTWuCZvsPHzCWBZ2lnrjoHea/fN/ufOtqkgQ9DK+swqCI6yn9/?=
 =?us-ascii?Q?W94wYN/UtUReomEWaWa6VbKMUwv0YKInIS1lX5/k5lJfV3QdY+FQR73Al+ub?=
 =?us-ascii?Q?22yzRWEg07iom+DeHzP5mxsTkbYKG9bQMgqTeMqJn8bXy/fnILijlcxmFpE/?=
 =?us-ascii?Q?NmZ64640JLZavupbwTRiqfN1VipyCuJEOiL+12b6hoqbbgBVUwTHw0/9ptN8?=
 =?us-ascii?Q?vtOtJ7sxwwDKAGp2HT3wQ5uTI4atTJ+2CZ5pA6alcswxmJ6oTMeRFqn7DyEk?=
 =?us-ascii?Q?ex3z51aYEGqNQ44+l9biRlXqocF/s3v6rWhVIjG35+viYmGTSTW4aKSqYf4H?=
 =?us-ascii?Q?cRh2XS1RC54wWAssOgfeL5vPt5lDVqLfkX4FefKL/7iePBoZYwIO1k7xgek+?=
 =?us-ascii?Q?ROw3NUN+qAWK9JgxusD2ZAskTPILNHev1sFP6lBp73pQNgLVLnmmtb1t5zQo?=
 =?us-ascii?Q?NU47TyvXNtkhH949NwbtrVYHZbY/5zWh3RDFPqVmM9OOUy3uqk4QwfXNhZ/5?=
 =?us-ascii?Q?cfhEwBs9IHNt8tox5eWjKm/iGi50B1zHjyjl0UFRgu6824Rgg/3XULLLGTu8?=
 =?us-ascii?Q?NUF0jIReAKHvcBzeXIqnESpSXKz9DrwLW8tqqlQwh4qnXbPWImisEoMcJjx7?=
 =?us-ascii?Q?RiyIviDuuBKd+N096K+mhQ/jENkUKSn/vtca+7TTttmleqKPykHCLC+4pGXx?=
 =?us-ascii?Q?jj3+fE+R2bGStjy+6q6ulIxjgQYU00PKieqo8ongx/oA/LDx9I1dzo3+qU4l?=
 =?us-ascii?Q?qPArU0uh06Oqr6SjDXloj2g/qCMSNnbOpM2dHAuaxGsmhQMYfQG4fkcko2HR?=
 =?us-ascii?Q?IjlzyIqB/Q27rPPWl032U3kNRf1tIab4OyhbFAGqdC9VG0Gsv+Wx6ogrul5a?=
 =?us-ascii?Q?ihCxe1iLuUE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0TtI6PEQo/pScLPGMKErEeCX3Wjv0xcrnNWQXqoT+ZAyjRnNdH9VTOfPDbjL?=
 =?us-ascii?Q?omzB3q/3GKfT3d5aguwQbN3bSYP0aFBjlXeuI67M6CzjjenrdKN1kBFGNKFm?=
 =?us-ascii?Q?qU1QkfAI6io4TdWg5DxUhS4JpM7ZVl/fGS9oqo+wbK3EfzbaTNuVX/AWu4JY?=
 =?us-ascii?Q?i1Z3+DPcsu6KZeFv35azQVk+nKqN4aq0ZFVgO3AX6sxH3K4euBsa2889Ets4?=
 =?us-ascii?Q?xWadCUPDEhoOSO02sHdcTvF6KBezJowQvR9O9iuqm5swJnRpEFQeAy3ckAmE?=
 =?us-ascii?Q?8TW+jtNOisd1Mwa/fd0FO4C8kdQS7bMUJY8EwEgacaW5yjEVpAjGzEgrwXFH?=
 =?us-ascii?Q?WfzEo7pvdpIZ7rpN9VwPilURSQOdBUZBskjGS6gMYnByfLv34TvGTJjnjKTV?=
 =?us-ascii?Q?3+3XOXU6NT1WksU/3nOb8Dwcu6aL7zxBYi87a8vb7UZ7HzpDO+P8h5m4AS/c?=
 =?us-ascii?Q?cceMtLgvWoqRa/7QCSSRTeXInZ2cVC+asdQtmQ5qheBtzWLvCDpfrEEBerK0?=
 =?us-ascii?Q?eg7YFeHiBZbMuAZw9QFw8uls02A4cu7IEV4WvZm4m2yznefvrY1xsGgSkCPb?=
 =?us-ascii?Q?1zaYQzr/4HZHP6UKCJGSnUvdKnFn7QFXPQ+6uEGiY4N38kEd4yyjkPTBYy81?=
 =?us-ascii?Q?lqDO8F9gWiIy2agBAa4GmT9ZxMp1g21F7qeUMrIyRD3GpFhpn7wb2BfRWbkc?=
 =?us-ascii?Q?1vx+qH7c68rKyDJtqsjcga7ahTgwoFUHzh3J7Tw4QtPiKDhDIkrR1AHMkxV7?=
 =?us-ascii?Q?szUJna1ODt2XHodGR82pqgbbIyMfhf/+9+jkzAOLKdWuaScTQ0PrZa/8biOv?=
 =?us-ascii?Q?4cwdWUHLejmsih2oLQTqKNe9mE2lYwmd5EJD+Mp93v7dYPpHpFPWCImAE17g?=
 =?us-ascii?Q?LEphP3uMhjaPINviEevWx3hegXqBn54QLZXPc00n9Xyx3L87Itcxsj7YUn3d?=
 =?us-ascii?Q?sQ+Kl4veLaX4nL5irfHYf+NfKsvChLJCQsL50QjlG8pCyOKnicB/8PMg5CWo?=
 =?us-ascii?Q?agaCxSRW7I7RYwK0iMorIdg+8mDLYkimLhPbgVaf2Sl8RLo26mhomFVtoVMk?=
 =?us-ascii?Q?y11dsg3KXjK1qbpO+p0nddQyNaHa6JrhoC0F3tybA+5IkhRNCGLa3K2q9uCt?=
 =?us-ascii?Q?M//JgCOb70zyZc5LANN38My6KOR873IL0AVnrOsBacmROfGTIo0iU4hG00AW?=
 =?us-ascii?Q?gXdxd4Sr0ROlXgR4Itf1A+3BLB/jiHRQ6TwCsFnarIHbSPih1XTYFcQjhArZ?=
 =?us-ascii?Q?fG4OJ4SF0zhyEw69Zz1NkU+XTLC9bDnN57kQ0Cv3w4Jil2A15f6og6nyeTG3?=
 =?us-ascii?Q?N759rbHlUWDxZuG8ryXMkQH5JAvui3ix1VrrANdbfWLyWOeKMDt1YSb+JVI6?=
 =?us-ascii?Q?1V08jcdRZNLL1noCF2HCwkFiS7d4JhjWfone5IaKCZzNGpsxsqTTBJmUnsJ3?=
 =?us-ascii?Q?CX9mi5fGl0rxPlHyXsyPqaG3eLaHD6jKrbr+WqoxAg6h4Mj7IiaJgASNSE/v?=
 =?us-ascii?Q?IUFKzwEOA21tzM25sVaCjV8Jam55dwS9qAWeqQMuwBthEaehmnwSC8QG9HCl?=
 =?us-ascii?Q?BWMFcIwbc9rb/XGSfKUn8S7Vn4So7zxRyKy0icCYSaN/ChJt9jiBBma8d6xa?=
 =?us-ascii?Q?0w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fVOBcOjucBB2QL4ZyS9hp2L4oQdX3e26ER5VVno5T/vNPSYszNP15URQtMJhkxvjSHEsU1v44iV2MdXFareQDt0i0jeve4lYpI2p/kaEiOa9k++8YLfpBVR8FW2y7mvnJ5jJwO2X8kruTM3rAZutOeGHEf4QPDkNybqUKbU7nBQBs1Z9MsAFqDFhtGS/B3D//bN1eZ1/iFda8k7ZSk6zhU4HMZuoMrMBAz4xs4XTlqDYHYTCaKwhI/9OBHYBOGiCL+cnqKeMOvAfePTTMexmb8PeoH2PzVgz8U2fz5orkbwnibdihLBboUM++f9bJBuXZVRha0EwVeWzVwBNuoS6l87e0Li+i5cUpzF1erPuMAYhfz/NVTPa+2o5Pu7Hf5MFBhA0oLIC094qdiOlE6ycQa+waxT/3z8UjnaYPK9JrVxrTH23MnP2JGJec7w41e/xXE2NW5AOBaa2JsxBdUv937AtYKoVd2VlCfjd7feWD5TOsMhYm6M0DLURe3eYfsc48s5WaZRoOB4FAi4T9KQOptdJozbW2xVx38o3SBB2uMPKJ9rNlwUAMqBMwLveciOWeDVkuUp82On1eAjergQ9OCnQLI55h7EBPKsCTepRTx0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46e12eed-0b9e-4b6c-6552-08dd870d0e58
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 11:00:30.2331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c7gXxKZN7732vM1cpIMCcT06zC+0DP8e7TrOhitUt+E//JAoAoZ6ZQ6X1KCj1X82FwcZfH0mx+13e8TvWwMNZfT7izX6cMebV5G2GmTQB10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7507
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2504290082
X-Authority-Analysis: v=2.4 cv=MqBS63ae c=1 sm=1 tr=0 ts=6810b154 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=CjpvJm_e8IrRhqNg0NwA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 cc=ntf awl=host:13130
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA4MSBTYWx0ZWRfXzYvBckMK686Y TJY6ehQqsqKZe5uafmJFNo1qT6wnngCWKBm1H2dgSnOXYawaVzU8B9Dm3Mub2AZ/cQ6HWVneM1t 7S/NvZq/DKFUcJ3xKTp8YHiHBgmsEnGuE8AHSfPSC4et1hAy79H2x35zMsqZkQsO2G+ypcDDTUi
 AxJ5iM1Qx6+hFPBP3THk47aHEO8xgAcDuB9LuMmDJiZ+fgpXL9TZv36Oyhd5yNb6/SML3FFcrGl wn/1M4hrVdc/O83EB04tcYOF9Cc5s2cfKk8PfzOMeMyVTO9S9FDqxKInD70ZAmDJ2Jr0p7owCHE 3NsDTLif8yH6WkrjkMoh0hbi6JfThpLPcTPdOlLEDSZCmZhQX09L6tDIXLDADmKwcnIUOCkap/F pPVs/ReP
X-Proofpoint-GUID: ITlPQqIaCOEI704GZ0iAhpDc7sezEufj
X-Proofpoint-ORIG-GUID: ITlPQqIaCOEI704GZ0iAhpDc7sezEufj

For changes like this, difftastic comes in very handy :)

On Tue, Apr 29, 2025 at 10:53:30AM +0530, Dev Jain wrote:
> Reduce indentation in change_pte_range() by refactoring some of the code
> into a new function. No functional change.
>
> Signed-off-by: Dev Jain <dev.jain@arm.com>

Overall a big fan of the intent of this patch! This is a nice cleanup, just
need to nail down details.

> ---
>  mm/mprotect.c | 116 +++++++++++++++++++++++++++++---------------------
>  1 file changed, 68 insertions(+), 48 deletions(-)
>
> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index 88608d0dc2c2..70f59aa8c2a8 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -83,6 +83,71 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>  	return pte_dirty(pte);
>  }
>
> +
> +

Nit: stray extra newline.

> +static bool prot_numa_skip(struct vm_area_struct *vma, struct folio *folio,
> +		int target_node)

This is a bit weird, it's like you have two functions to determine whether to
skip a PTE entry, but named differently?

I think you say in response to a comment elsewhere that you intend to further
split things up in subsequent patches, but this kinda bugs me as subjective as
it is :)

I'd say rename prot_numa_avoid_fault() -> can_skip_prot_numa_pte()

And this to can_skip_prot_numa_folio()?

Then again, the below function does some folio stuff too, so I'm not sure
exactly what the separation is? Can you explain?

Also it'd be good to add some brief comment, something like 'the prot_numa
change-prot (cp) flag indicates that this protection change is due to NUMA
hinting, we determine if we actually have work to do or can skip this folio
entirely'.

Or equivalent in the below function.

> +{
> +	bool toptier;
> +	int nid;
> +
> +	/* Also skip shared copy-on-write pages */
> +	if (is_cow_mapping(vma->vm_flags) &&
> +	    (folio_maybe_dma_pinned(folio) ||
> +	     folio_maybe_mapped_shared(folio)))
> +		return true;
> +
> +	/*
> +	 * While migration can move some dirty pages,
> +	 * it cannot move them all from MIGRATE_ASYNC
> +	 * context.
> +	 */
> +	if (folio_is_file_lru(folio) &&
> +	    folio_test_dirty(folio))
> +		return true;
> +
> +	/*
> +	 * Don't mess with PTEs if page is already on the node
> +	 * a single-threaded process is running on.
> +	 */
> +	nid = folio_nid(folio);
> +	if (target_node == nid)
> +		return true;
> +	toptier = node_is_toptier(nid);
> +
> +	/*
> +	 * Skip scanning top tier node if normal numa
> +	 * balancing is disabled
> +	 */
> +	if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL) &&
> +	    toptier)
> +		return true;
> +	return false;
> +}
> +
> +static bool prot_numa_avoid_fault(struct vm_area_struct *vma,
> +		unsigned long addr, pte_t oldpte, int target_node)
> +{
> +	struct folio *folio;
> +	int ret;
> +
> +	/* Avoid TLB flush if possible */
> +	if (pte_protnone(oldpte))
> +		return true;
> +
> +	folio = vm_normal_folio(vma, addr, oldpte);
> +	if (!folio || folio_is_zone_device(folio) ||
> +	    folio_test_ksm(folio))
> +		return true;
> +	ret = prot_numa_skip(vma, folio, target_node);
> +	if (ret)
> +		return ret;

This is a bit silly as it returns a boolean value, surely;

	if (prot_numa_skip(vma, folio, target_node))
		return true;

Is better?

> +	if (folio_use_access_time(folio))
> +		folio_xchg_access_time(folio,
> +			jiffies_to_msecs(jiffies));

Why is this here and not in prot_numa_skip() or whatever we rename it to?

> +	return false;
> +}
> +
>  static long change_pte_range(struct mmu_gather *tlb,
>  		struct vm_area_struct *vma, pmd_t *pmd, unsigned long addr,
>  		unsigned long end, pgprot_t newprot, unsigned long cp_flags)
> @@ -116,56 +181,11 @@ static long change_pte_range(struct mmu_gather *tlb,
>  			 * Avoid trapping faults against the zero or KSM
>  			 * pages. See similar comment in change_huge_pmd.
>  			 */
> -			if (prot_numa) {
> -				struct folio *folio;
> -				int nid;
> -				bool toptier;
> -
> -				/* Avoid TLB flush if possible */
> -				if (pte_protnone(oldpte))
> -					continue;
> -
> -				folio = vm_normal_folio(vma, addr, oldpte);
> -				if (!folio || folio_is_zone_device(folio) ||
> -				    folio_test_ksm(folio))
> -					continue;
> -
> -				/* Also skip shared copy-on-write pages */
> -				if (is_cow_mapping(vma->vm_flags) &&
> -				    (folio_maybe_dma_pinned(folio) ||
> -				     folio_maybe_mapped_shared(folio)))
> -					continue;
> -
> -				/*
> -				 * While migration can move some dirty pages,
> -				 * it cannot move them all from MIGRATE_ASYNC
> -				 * context.
> -				 */
> -				if (folio_is_file_lru(folio) &&
> -				    folio_test_dirty(folio))
> +			if (prot_numa &&
> +			    prot_numa_avoid_fault(vma, addr,
> +						  oldpte, target_node))
>  					continue;
>
> -				/*
> -				 * Don't mess with PTEs if page is already on the node
> -				 * a single-threaded process is running on.
> -				 */
> -				nid = folio_nid(folio);
> -				if (target_node == nid)
> -					continue;
> -				toptier = node_is_toptier(nid);
> -
> -				/*
> -				 * Skip scanning top tier node if normal numa
> -				 * balancing is disabled
> -				 */
> -				if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL) &&
> -				    toptier)
> -					continue;
> -				if (folio_use_access_time(folio))
> -					folio_xchg_access_time(folio,
> -						jiffies_to_msecs(jiffies));
> -			}
> -
>  			oldpte = ptep_modify_prot_start(vma, addr, pte);
>  			ptent = pte_modify(oldpte, newprot);
>
> --
> 2.30.2
>
