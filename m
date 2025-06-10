Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1955040C03
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749562046; cv=fail; b=nLXWVj58bx8xFCkQJ9XnH2AOHg0m7BzJJJcuA8P0R9jrgCsEvBPQd2TuwJmwD52AgjBUg44AHG4nIW4niuE72jb3JIYXuNCJoen/Qo36IbtuZ3hRkltwKE9s8V6V5q3sG/JQAOtifi51vSSFFcvZst2/yYZUtoyQEYnY7HKZDUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749562046; c=relaxed/simple;
	bh=ANh8Eq531M9UoYccRJ43MDRGep7VPIXpfUP8QPTDtgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DL7n+khjmNOduo7yHB9VamEn/VFVYj9GYl2j0Zc5pUk6MfTiZy58KPJ3WBQ2bKGY7TkbN8ZFeFmmdKrhVSW9GEOMIOc43bK+8WuE96RKypk8oDvoNVbAVumHc7GPpr6OYZ8FEAe86YwmKSJPEU6FH4zSeqJh1r4CSNPo+4c/NMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=inCus76b; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ttYAF8wH; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="inCus76b";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ttYAF8wH"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ADBaw7002196;
	Tue, 10 Jun 2025 13:27:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=KUG3BMAC1PHYk7XpPg
	f10fnFamLcBlTYZshkHKbmXMA=; b=inCus76b9yPmhZv5lRCZUbvU3WTUbfpehA
	uxwGr4ZrDWs3DUiNvDEeaksigf1ezGexXy5WowJTu7J+q/JaqE9ycrOmT+4651BS
	KcnKom4WL1TFLVoCRMln4fzMaq1mbQbjVsnBdEzVv24BISp22OXHw4CG6zk4ulnR
	KPzNc81EdGZMJXLPHbBGDI34gOTLWhn2Snq80T5rNCH3r5I0k8F0mCPWNoemS8s6
	B7nP1yxfba3AdsbGZunzW2HwzvMydE773gqsXjWACOH+ZGlqs6Xb4Sb5CLZR4Hca
	8pnH3J18W0c6FPocnKV+I2yf6C4fhIZtY364laHWEK4DQEl5D4UQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474d1v492c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jun 2025 13:27:07 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55ABmXAM011872;
	Tue, 10 Jun 2025 13:27:06 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010002.outbound.protection.outlook.com [52.101.193.2])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bv9qg3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jun 2025 13:27:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xhLZV0GjDogYLxRD+pfI4DGn9RPRc2XgyEMFL6ObXcUfwsYogDazotXjRo2RP6PzJ+Pi6Eivkj7PgnosNIbYr4xLgu2bqFgebkEHO/GzRqH9csEbNZJ4wknifliL7FH42za87FSIk3nEhDYODIupGO2CJ0I40yKMQZzVlhqxbZcu1uLkLEPjQGxzNOl2JSck03TWdsQ1lL/odwxlYNhaOlAN4DMGqoAFVpemqIz3mYSzr4OBCrPc1vTU3yVCzU+q8ZxPXZKEWJ4+gY9w0r1tht+3o4SG7/chu+hGCfvNHx8xFw3fc+9eydBPVMgbdYkCahZni0B6QYNocqRUPDeD+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUG3BMAC1PHYk7XpPgf10fnFamLcBlTYZshkHKbmXMA=;
 b=O/R4jbYNtrERbPYBf/HD+48Gy+ZDizSPLM3tS/HiV3fsN7GeAh1897Mu9zliEPzOabzrTJWawy+vfAXA6r5mt9NQKULvI5z/F8b4hg3nPAetq0y1DMg1c65YPWTx5wMZnaDpQUKKxDXNjdqcHJbucIxpFp1v9rQ3g9XdZqEj8P1iW2Ep6WdA9q1XDFVqSmrrwdh91ymqNzVweyHuwtTI1fzgevpvB7hOg+EeL2D/pcC1/U8KuC3XbvZKjQNa+xTEh4hX1yJYlpKlC87hH5prLcRCunxzU7RiV/dJ+wlWgieRoLhjhB4PRicEJUMRFQSU+JTADOkitrwdP1JzaiEv0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUG3BMAC1PHYk7XpPgf10fnFamLcBlTYZshkHKbmXMA=;
 b=ttYAF8wHfv1ZoBoD5+rezdiVl8waqu8PTTtWR7NjCRMC9dwJmheJGavb2oWv5iqB/hDpa1z9oKgQHCO5DBzaQoTBb/NJuHSwtK3NFq2xvxT311WOWQ3zrdjmDkROh9Wta7azc0Da1qLzWn7qQMugilYHWu958u4u9gZF2ALTm9A=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MW5PR10MB5667.namprd10.prod.outlook.com (2603:10b6:303:19c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Tue, 10 Jun
 2025 13:27:04 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 13:27:03 +0000
Date: Tue, 10 Jun 2025 14:27:01 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org,
        catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
        vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        suzuki.poulose@arm.com, steven.price@arm.com, gshan@redhat.com,
        linux-arm-kernel@lists.infradead.org, yang@os.amperecomputing.com,
        ryan.roberts@arm.com, anshuman.khandual@arm.com
Subject: Re: [PATCH v2 1/2] mm: Allow lockless kernel pagetable walking
Message-ID: <359668fb-df61-4135-89ee-2675a06a5c1b@lucifer.local>
References: <20250610114401.7097-1-dev.jain@arm.com>
 <20250610114401.7097-2-dev.jain@arm.com>
 <db04bd02-0090-4aff-bb2e-0d1e023757a5@lucifer.local>
 <970e1b84-7f47-4a51-ad99-4df9026b8f7d@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <970e1b84-7f47-4a51-ad99-4df9026b8f7d@redhat.com>
X-ClientProxiedBy: LO2P265CA0295.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MW5PR10MB5667:EE_
X-MS-Office365-Filtering-Correlation-Id: 48f5cf9b-8872-4c06-b9c6-08dda8227cf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IC/N9yLLcdQ6apZbKOTERxIY6DdDy6xYfsSaVzWl2Y8lqsdPFLPR9bFpE0eQ?=
 =?us-ascii?Q?F9cqxrsWiKAI8we8MR4+UP2q6mqitxziXS4bhbf+NkIhDvfBw2TLJEjdnxPv?=
 =?us-ascii?Q?Gae81j2DJuDQsPOe90czDF1YUvw1w4p0rFWoZP3t8h2+tx9bzFlRJghBTm6q?=
 =?us-ascii?Q?/nijOvHTftrDTccdOt1FGHtedC8oqpgtdbqRk1teBRMLWbxwKBIt/T9ItQrU?=
 =?us-ascii?Q?ZH2EcoRoLQbF1nr1q6bQpzKqhf/Hxg1mEPtWnAdahSLMhpQqjNyLwbnFSv2k?=
 =?us-ascii?Q?JH568lYfo0K7MgQkYZizqs8+o3w8+tZ5n2MlzAw6G70+gtakDf/RPjQ5HNBm?=
 =?us-ascii?Q?sFjPg8aDsdPnThsouJdiFVW//oZdF+hqLQZT99rMSyfPMSwU55Afl6I1e19m?=
 =?us-ascii?Q?Gt0TDXbvp/tOnm7uv46CcUhSj6eLZFdOwxmZddM0sTtPqsqZxz+latt+GVEf?=
 =?us-ascii?Q?PKTiDXARthvmfzwtLY+2fuS3ixpsfAA6AIYRCJtEvvVqtUbWSdWCBonNe7hx?=
 =?us-ascii?Q?dvDysLnrd0cKOWifcfJTy+ZMR/KRHYG/1IyDGTYiu3QipXPOqR8pcRiFFK/r?=
 =?us-ascii?Q?+mLHDbMJdJ7/O2XDm8uJVWhnIujunazMgWViW8sZuEOr1njYP7eWnayMioq2?=
 =?us-ascii?Q?xzhcI2woNULkNYCKx7fH4qTe574qLY8wv2az2nYlZ3DoeeIGZE1wVMSJXbVh?=
 =?us-ascii?Q?pJenm9Oi3Hyvpz9jBXjmXz6AzmHDNTcHmZ8y9QU8az0RNZG/oBZh7LBktoxV?=
 =?us-ascii?Q?qMR8fuZqU1TAc6WGJrPFRS/mnTIIOfKxlVO5CC6Bgi9EBgsv/v+bOIKCZvI+?=
 =?us-ascii?Q?LPzRMfBPP3Gya0XwKwnrumyCa5zNPFDQOi8Itf49se7/1RymqkiAbwv6mbvc?=
 =?us-ascii?Q?Tux3lvfn+MuD6KTvJSNXKszOPbFOSsXnFO3x1OWp/8imIsuufcPowGBthfrb?=
 =?us-ascii?Q?xOxpYcSZ6eaqAmEdC/lp8IdEyIj6poj8uP3PNtATBQORhiZleW8pliaG+9dC?=
 =?us-ascii?Q?IrQB1sEa2raUKlDDNfj9dldjykDkQ4cz20IJxJ5ierLz3D1Njts069QZVVld?=
 =?us-ascii?Q?BqpZYroWz2iflqMWZ9vs7BrmTqum+ZRvaWqQihenW1F3lNypBK8wS/+R+ZIp?=
 =?us-ascii?Q?nIkojHSxqnNvyftfxZkzhG/PPryIkKWldOekpxdQ8cmjmy/6MJ7QNmvoTXvr?=
 =?us-ascii?Q?bigRwhF3IWLEl6W2ZyWCRsiRa0rNWYtLLrZJ2gC1pHllvr+7vFFzPULm9WpP?=
 =?us-ascii?Q?mfb/P1jUVzY2nBSXnacM/wXPLiKs9zvHhL+sIt/bnGa+P6Wn7nC5V1BoAQb3?=
 =?us-ascii?Q?u7izqZZtgBf2qkr8MlbV3tf62Hh3Aa1y8YVfHd9wLOWRhFduYgh+duonxoRF?=
 =?us-ascii?Q?rIx1fYjOckNavxwvWe5q1R9zV5tyHXQwsxXcxc+mAtpicmzYcyUE/Qcl22nE?=
 =?us-ascii?Q?/cS/jRCD5NA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w/kKFmbrkrgm/6sl88swV3xFM1WmN3qcJxkG2ZGRP++ixKwefzagVhMj8o2h?=
 =?us-ascii?Q?BD1k9THDqB/DZcs5o23TkCZphTcFLhqQZqMy2+RgHZtlNnIIhNEGhV0Gm0zq?=
 =?us-ascii?Q?lQ+HlQRBUbYL4idhaAS37W4MPvCCbjhqU/zSxD8Wf5Le24DRm2en5lpLZuTj?=
 =?us-ascii?Q?J4WXHJ1WDIsBy12iB8CVSH4pab+rG1jdQstEtJCUdz81i6jR2T1ObpZbrL7M?=
 =?us-ascii?Q?4g0cl51anfBce4N9Rw9QdFdxs5Tx0sSWBCe63JDVMFcUtegtAfydq1JLK4hu?=
 =?us-ascii?Q?B/8eiod3lKt638kOHlkhsm1M79yP4oLQG5W22mLhXpj4Zp5OkhlwqK5JH0/l?=
 =?us-ascii?Q?F4mmI2AsfZKuFj44xDy+cp0kz8WYY59JMv9r9G3G8gr1sCJeGIifiUVpBjrh?=
 =?us-ascii?Q?7y0S7mBnPVRmjIujeyINNWQYeVWcH/QowhE1aZ73YFHS221MTZ7xEPRhIYyr?=
 =?us-ascii?Q?yeTpTrMjWKgnNY6ZELPTNaBGM0Ez0SUByHqZOnmLCU8me1lIjFATdT4MXxrm?=
 =?us-ascii?Q?4cpbS/OyexGLuuNGVOR8hYbF9hvtp7TAmX70hHPIdMguVsEDF7Q2yW7ciGdT?=
 =?us-ascii?Q?Pg8fQ2omubSI+hMgpTbKmg4ewC5OWbdcTqGSW/2IM0Uskwuh+b8BeV0mrm3r?=
 =?us-ascii?Q?Ny9fNh02BIqLcuSjL3nah47PYLmJ+h7TPIVVkfZwDErAhIx00x1kAcoFn5HS?=
 =?us-ascii?Q?sAUxXLRyJlFxDeGVaI1CN7aTyOinY2R6x8hyGnNzN/AH1pmQNr6hjeWDm9Fg?=
 =?us-ascii?Q?wdqTPUPfME3hWJ8T4YeIfzKZ9JhPgZvviRx2hf/nnwK0D1C2scD/+bZn96b8?=
 =?us-ascii?Q?RTx3bZIKQa3MTu5e9JLN1Q9GeNGxu1CQrGBMpIt4bwmDE6j4xNkGPePdHsFS?=
 =?us-ascii?Q?qWdgHGbg3MU2B5Hb6RItQ5bDiEtQmk/TB6Ot1Ii1dKzASkY+3YdpkWB/ivWY?=
 =?us-ascii?Q?6cjgxuY0O0a3XlEdlx+//PLw5odd560roWtunfikUeTxetjLH1tBXE0pU46j?=
 =?us-ascii?Q?QIzEgPX8TV30tqUimsk2eDQZndgucbDNooVOUllHycKhaLNZ2GtsH4ier1es?=
 =?us-ascii?Q?sVrRaci3wqJkne9xhA2RBbOOYaq7U4+Mnzz+mkjxlkLLexdR2QBNES3lWnrE?=
 =?us-ascii?Q?kF0rIbPO7o3NOw/Fc0bn2fm8MQE1x151JHqHFaprTa5HxyUQi7d5VlfDyjxv?=
 =?us-ascii?Q?k7cMsVgVOK2cB6ETJnXwUCNbtKEhT3P6tyvoZr3JjrcYFHKHB8C3mzqNt10k?=
 =?us-ascii?Q?Y/fJ9zJVX1wsVTG8nsvmqHjRAOtFyM7eN2Sk5k7Yrj14LkfiJM+YFnZIkSL1?=
 =?us-ascii?Q?fmJ7M0CRshT4j+xzL0uEdwclOyITt7ztIJ0gN9eZqbtqrd4d2uzkzhrT6RpR?=
 =?us-ascii?Q?hKKK93R63zC1rIyIy507s6ow9T1B2INYgyyZsh5UjZhrMmMdThta10AQhOx7?=
 =?us-ascii?Q?gS3+7Qk/LPK6vi18WYz+eGZPi5QzPri7C/1CnqXOv34SGjeeZG+PXS6lqgz2?=
 =?us-ascii?Q?8kSZh+FsjIvLbgVy86h0HiSa30hhFdw7ZuPij20mhbUTrlWco65k9W7g6JLv?=
 =?us-ascii?Q?UUlua3ukBSkiI/Ziwaf6+V2WCNMdw+yOpmap82s3AFmceBENn/WFWK2hEEVI?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	X1Id8QYq95GIYuZmQCbLIl01Ey7VaMDddvn3jdffrix+ZX1kitcT3ouYSMPXonvy3KCv35OKCOj9xLbrQPVBPCRcGarETkaK3v3rwrfZyocWutfD0mkK39JYm7rD7hiMluEiodvwWnJSt9lMczx96Hd773XTMnEfBcu884j+DAwmH7ITDWABca48/ZltlM8xf/oyLz85f55eqgZvb7QChODQXykhy1wh44jRWBDf7K6JtrI4ExT6DWG0PEqJLqtW3oOxi1PbBko1EZfvSkZ6NvFrB+ww9Jm65AXICmeJE3GrtNJLLZqL42K1vxQxakewtwPUQE+QWijSWuWAZiCFh/zMZWTqh93QgHgZOM9wgSK/5W85fPTg3ynTEb08n+C/Q5gbHmw+sjZXYTfqKdQrmosupglCLl0p/JAGO/DUgLzpHPRg6HXU8qpWdripbaziuWNEtgXfy8B/XK8Zjln1IpcexdBG7u8qYtDQHXnW473XryaFnq3PvuQUDEm1Jbk+hwNVhMtFPGwznZ0ilmI0jPk8js82xN8ufJRXccbqifJqsdcU9UAcyYL7Cev7PlWDXA5F0YaSJ2ZHFqHJvyP987BMnSYbL9cT0K+Jb2sTp7M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48f5cf9b-8872-4c06-b9c6-08dda8227cf1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 13:27:03.9177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jB/K6gt+OnY6McGp7iKJjxzWxnISF5eDjCaR5d1qlOr12N1safHLR5rdc/ULMiJuhwJMYmnp2LutpI3vAJoIH0XH/2hBlZEOQ21GRXvX7Hg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5667
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 mlxlogscore=918 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506100105
X-Proofpoint-GUID: dS91u9vKgecddW_rsMNWqLYy5RSaHr95
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEwNSBTYWx0ZWRfX7hFxAbHiX9i2 tlaUwGsnW2bAEU3JlgE4pSlusWhT3dNMvJVQl0luBxlkQvrsJKpoqsZUgh3B29wQH4wupaGGX+C zNWjwQjWHjtwOa09/WlC1zdJcqtibNZYs5r1b+0r5qaxTSq2rD1T93TrA6uNfu7X7R3A01pNMkr
 B2HSxUbFKr8meBTcMLvn4xFIpEZcSaYYpRze4GIvtO7FwgiITQiQQW/1ckr6G7DgficWOE8uiqo TqdcGvN1/733VTwOFSXHSKel9OjP7uZSo6nGOFAj+fizeJZd1bwBuzRmqP/YKI3b+secb11bQMV 8V7Y/d2ud1+5qxd8T8WPS17bqaTCyaOG6O8lalN0oTRxpxqwn3CkWn1f0qK8lCf6vbRvZ1frvGu
 YEJ2lkz4nkk8OmvULjyOUPkgX7wjTwBZZtDS5mg8gQVJRoXgm8B87OsGgYYl4olRLookyhaa
X-Proofpoint-ORIG-GUID: dS91u9vKgecddW_rsMNWqLYy5RSaHr95
X-Authority-Analysis: v=2.4 cv=d731yQjE c=1 sm=1 tr=0 ts=684832ab b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=7zPY-KFWKS08kDV-ugwA:9 a=CjuIK1q_8ugA:10

On Tue, Jun 10, 2025 at 03:24:16PM +0200, David Hildenbrand wrote:
> On 10.06.25 14:07, Lorenzo Stoakes wrote:
> > OK so I think the best solution here is to just update check_ops_valid(), which
> > was kind of sucky anyway (we check everywhere but walk_page_range_mm() to
> > enforce the install pte thing).
> >
> > Let's do something like:
> >
> > #define OPS_MAY_INSTALL_PTE	(1<<0)
> > #define OPS_MAY_AVOID_LOCK	(1<<1)
> >
> > and update check_ops_valid() to take a flags or maybe 'capabilities' field.
> >
> > Then check based on this e.g.:
> >
> > if (ops->install_pte && !(capabilities & OPS_MAY_INSTALL_PTE))
> > 	return false;
> >
> > if (ops->walk_lock == PGWALK_NOLOCK && !(capabilities & OPS_MAY_AVOID_LOCK))
> > 	return false;
> >
>
> Hm. I mean, we really only want to allow this lockless check for
> walk_kernel_page_table_range(), right?
>
> Having a walk_kernel_page_table_range_lockeless() might (or might not) be
> better, to really only special-case this specific path.

Agree completely, Dev - let's definitely do this.

>
> So, I am wondering if we should further start splitting the
> kernel-page-table walker up from the mm walker, at least on the "entry"
> function for now.

How do you mean?

>
> --
> Cheers,
>
> David / dhildenb
>
