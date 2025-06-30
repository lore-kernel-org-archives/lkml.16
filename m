Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115E3226188
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751282386; cv=fail; b=Cyaa+iWcqgmyW04aWLOPpl46/YCglrB8BXtlo48+HAr7Ws7oFEHE16a/94CceEXfZkeMuRr8Fdwmyf92BdrZOTPUTtQ34CZ/hEWrGqnMknQgFH9ucxwdwHeQFuvPcCxpqtohYvUq/gWppB78a3rXkNDaQVafO7jxRn587O52ItU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751282386; c=relaxed/simple;
	bh=tuKUvyIlmY8esOFxWRLuigmhrbguxPZw56l5L43h1fw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dCvAD/LlNMyNvnl/AL3l9rpxESKR5YvApYs1UOLfE53+RKgBNMelr4NruW1cm9CO4glUVTKSKpMxEFCKJqX6gtnFE5geYUn7o9qel1FVzAMI4zCHx04LnG+Qxe4iQ5lybsKHaLteGTF5U/iAs18cGK2HrVOaABjVnhAtLSJn860=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=a0biVraw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=0IY2OTjN; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="a0biVraw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="0IY2OTjN"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U84miW029654;
	Mon, 30 Jun 2025 11:19:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=yyBpYMX2XlrSrYbwo5
	Y/ygaaxrBbOUKAyN2VTdqBTXg=; b=a0biVrawe6A0eTb6fBtGTNDvGDS+IdR45m
	ODmLyJ4Mj0oG2189TpNt/xMaeozQuj0728nnhDCwZfs7YRuTUpZ+fKjafgjdeyhn
	XNLw+hi5ItEOX3/2x2xNrqey7sZGw2+ZzAy/1jrFCBBnEACAp8MmAtmaL6/rVYjc
	ULy5uciaFBjuv2l9F7yj0Bpiv1GJRiu1a57UKVxpyzMVoLl6sjKn7eXO3ybsmOZb
	aGud0jrxUTrnPW/VplnhgzcW+pfICzJBulx+2boaFQkaF5O2yDk37haEVxWmYqDK
	/p1SebydW3H+RIEaVMvMFMiOi5r0gitjVNgKbWE3kcltRwRoL1hA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j7af29dg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 11:19:01 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55UAckmQ038416;
	Mon, 30 Jun 2025 11:19:00 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u86u7n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 11:19:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uVStzEn4Md1BTuaqHzJLQALvnqflB6Zg0QimfSZ8tuszDPHByQ7h5v05v5Dta3XPK1kcZHu2mjlfj8/luXkbbLofehxg/NyrvpIozdp/0DweQeyjvdahKREtPV3b+80U9q9rNBsvwmH1bpmos9rWyBoojEfYx0heIwitCBPpJGt8YKD430Tcqwhq8wCEd7sfoJSFsUjFb1wZkVxSm2u2TAazMAdVIUqaeWAeMhVY5LFAk1GfBq8BZWgkr05LoKEACr77T81NAnsyKUwGhwLgNUwjYNm5kNJziAKB/TkMhw2iSBMBDjE6fJPMCOcF5B31Ox5HMdSxgbTkHtbwsnM3tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yyBpYMX2XlrSrYbwo5Y/ygaaxrBbOUKAyN2VTdqBTXg=;
 b=xqgywvMVU8aLjzsdsyqJlMH2zcR33xhpfx2zpUG8wCOdNdGSHdV7h8ntmIXEidp7+IarKJh8PzGOHUywLu7sHKx6veSWmrAMhIwoc4qVupA6FXO3z1PivcVDWs9IZkuwKFe2+iJlzoaeVTCOMcaXngZG1dFgzToJAQS2RqnU2MYipTFQiNVwzaeLNTNiBdvv7j7nCLeckBGz9UghCkQcFQ7LT6W+64m1g3C0qzXKLPl0duVEp6KRey3BIxgLm1oj9Nm1VmeVG1M+dAueompAzowcfeLhIXYbZSqbkqqdyEOchbnUKeO8TknzuP+RetddeqLbXb4PphywQP5ozY1ftg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yyBpYMX2XlrSrYbwo5Y/ygaaxrBbOUKAyN2VTdqBTXg=;
 b=0IY2OTjNd24k+lqXzTqQEwj2c4UFWXtFsjCUT6TCH4ckbLYqcEfTqq5d8Gai2pCfDtF/vB7SBsJOhy6ho0BNOio/KhJe7R7EONKDdb2xD7dSMCsg8IYKjg6/oMdr0K9GfKYSjx0QnlFot4McipM2Q8Pq7HrOCDG3JReW+2PG7jg=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MN0PR10MB6007.namprd10.prod.outlook.com (2603:10b6:208:3c9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Mon, 30 Jun
 2025 11:18:57 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 11:18:57 +0000
Date: Mon, 30 Jun 2025 12:18:55 +0100
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
Message-ID: <428257a9-439f-43a5-8590-4de83d45e185@lucifer.local>
References: <20250627115510.3273675-1-david@redhat.com>
 <20250627115510.3273675-5-david@redhat.com>
 <b6ccc61b-2948-4529-9c9d-47e9c9ed25ab@lucifer.local>
 <997a3af4-0c8f-4f8d-8230-08b43d0761b6@redhat.com>
 <4500541c-dde1-41a7-81c8-ac1573d05419@lucifer.local>
 <5513d9ba-80bf-49a1-9a50-e1a6814925e7@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5513d9ba-80bf-49a1-9a50-e1a6814925e7@redhat.com>
X-ClientProxiedBy: LO4P265CA0212.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::12) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MN0PR10MB6007:EE_
X-MS-Office365-Filtering-Correlation-Id: e679c56a-5335-4d5a-5e7a-08ddb7c7e82b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ypc/1YfP0xy4B4n6EcLZ/BXQtjERpO4l01OaSonVYpPWbTzBj8it0NbML0ie?=
 =?us-ascii?Q?g6ANJBoKOc1XLtbYSj6ptTeaNZFFael2kRjnsyxHh/EpuhtCg97wO46vkPIu?=
 =?us-ascii?Q?ReGaViWaEsmIhdlgzixSqG3iDLoGwpw+3QpaklczHOOFMbV1HESZHSW2EoA5?=
 =?us-ascii?Q?Pg0RMIX7PQVyfOAQvCtq5zjzfNVmul7pd2KjZfV2Yf71CRr+MTabjjGUgwQt?=
 =?us-ascii?Q?QC/6nqw4OKKzW8siyil2IW9/H40qjCJmzl9V+iVvXgIeEoEsQwls8O2fQ0xT?=
 =?us-ascii?Q?6HimAr+Vmor510VdCfIgSxwkcLHOmA//t3Eup49Grj4Z4+Vi0w/xu8IqP/3d?=
 =?us-ascii?Q?CObLSxUQGzEKS1BwfNcaap2thjS7pDcicEcfnd8K2hDV1n0YsmSjCSG/7UUb?=
 =?us-ascii?Q?nyHoK5ORgpXXujCGxlHRVQ/BveXKbW9b7xsCPTXJUZYagdSLPlKiPlKeTcnW?=
 =?us-ascii?Q?sWOdiNQzRYs004ViyI+hbwhaY4QqWc5cY0KXjri2t42XkOiEAmX6nKx0oNAu?=
 =?us-ascii?Q?mktmWgCP08ZM70b0jPzBBLU3w4MX5U7ZR4JTjSq4l3ViKX/silu39ZkO656J?=
 =?us-ascii?Q?6j03LIitW+5OY01GE5k4dgzEaGlfOJCnP9rF+nxlu55TAD7MWt0ZofTSjbLQ?=
 =?us-ascii?Q?wsRDyl4eTmv5AbgKshxJ5C/ADvNWy6oBKIwtZCymWaQiO6i/qGu6KNtWeVS+?=
 =?us-ascii?Q?qu5gGN/X7TMxzrgCTlY96prewiTcMmS2/b8OfgGUjISf4Nwpk9DqfcAolBAt?=
 =?us-ascii?Q?ACL8ghBSR8EpSGfM4O9eeHhipdjHdKUH7nlfIY+sw796uu8X+ccScmTh8Uyu?=
 =?us-ascii?Q?6Ao3BhPDLF0qS7XRbKSo9wORbO8M2iPBY5mxk9AwMpvgIvUhTG275KVfYqa/?=
 =?us-ascii?Q?BPjVjIxelenIFn6de8G6OKTigdl9T/c7WagjzeUF7v8wVZYp3blZuVIsDUow?=
 =?us-ascii?Q?cDGOA6yWxt3Q4xpDSTbo4FSdArwLPZ8miL3msWhOjUvRAQ2ixxAERwBdqg2E?=
 =?us-ascii?Q?o8WCZudOQS5TP8w6eYPIj+3hj0XkjtGuIJEV0ya0wRNzMWBTmJbBBcSXa+xw?=
 =?us-ascii?Q?z7uDTom+iTaGDnZTaaxfoyt+llCocnrLXsWKDrI4c1x61FhN0QCWsNO3M2jf?=
 =?us-ascii?Q?Ca4gAjFqg9dU4D+TXjNehpwWsD5so+1Kv8LQOxH2jKJNOzAnrERyKhUZuyMn?=
 =?us-ascii?Q?IuLOlK7QjbFNOC2PJpxAmSIN2xvrfen8eVG//rlCZ2NXKRGacZiuHmfr9qTA?=
 =?us-ascii?Q?lKPWMRc+K0Gx+ZG3aJKXmAjCyS4D9uJWgpzzzC0mJIx0jQ8XuU+jvi+TJQJU?=
 =?us-ascii?Q?lcPlNWMIbPIhWC/gMFDPqylE/QW7qhblECDuV+EzndhGoosFn6utTcXD+9ir?=
 =?us-ascii?Q?4gR8G6y3k6ARjt6QnKdHvyshdngfVKkpQrrjNh6Gse44fc8sFQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BLXecQ9P8dibA/3cgVr1ieesESvAnthtDAd5cSDge4BF7LDjTWU4W6adhbgg?=
 =?us-ascii?Q?ep3dNEnfClO67awuGjeJHVQxlrlo7HJYv7RG6TRWsS/KJPh5lkL5+fYo3LDM?=
 =?us-ascii?Q?fwXu7BpY2u/zsprX7tEmlmv8Yk8W6oYjYJCaGnSCtk9qmcQ/B4R6rln2fq7b?=
 =?us-ascii?Q?pBvj3t+noPX+C6h8d/9HP1FowT3Y4zYi/MxLkpJ1dR1b3y3GwBEuM3iC17Vt?=
 =?us-ascii?Q?75uuyg1RtAtuVnW/IlVWTwQVEHXN4aFGo2BGCOhDjpf4oQ8+fBRparyIOlOW?=
 =?us-ascii?Q?Dx5CVd9QMt1SPjBK/0hAm4jEJIowlvCP5ymvCTnaznrZI4H8J2SOTpMSL7/+?=
 =?us-ascii?Q?CX/9niItWrhqqKOkW8LPGgPX7qaBNwEfvXatBiD9vuOKCdA+TTsdQr2a4Q85?=
 =?us-ascii?Q?IpNRnLOPAEEhJfzSA8P0UA/qEMs7+WBUvG3UR+FwOB69FtOYTnDSw6g0aj+s?=
 =?us-ascii?Q?oYlAiMAcg0ptlWsolSpc9RqbQmcM/rchTaOFd7vMxvp17v4j0krakvIiC91w?=
 =?us-ascii?Q?Hnq0IUTFwEbGPxV+cLDH3v1RSG88azHDfAEPLGN4EBrc7mRQVwYwJ11+Lz34?=
 =?us-ascii?Q?NEJOj658Y8KFZtbuOaw5h59ToncYryVv5ORnvbb05fE3AE6G3RHbhYdeitRK?=
 =?us-ascii?Q?v8Ey1/0ahaq/Tg4K7n3jUmHSsEN+VK3osIjxSa48Ly609KsFsz+kd/qX+MP1?=
 =?us-ascii?Q?iQkAijZSam2MNs67G5ur7m5ScrHijRA9n0pmPAXu3VrTiWqCZYk3NmdMbpU/?=
 =?us-ascii?Q?Pr5sTv3mJsjeBrDAf4vZFGWW0MMAlkMJp7Dkl9yHD3cDYgtiv5tXmq2bzEaW?=
 =?us-ascii?Q?tKGvIaIE+W7LidD40iYooAgrvkfKfA+hTk6bMAMqY78wyrvH2ZS4UhbbhIsQ?=
 =?us-ascii?Q?FovRQHQuwkg7Kx6hkh+REPiXUGnLcM/BkvV05uDardvMxFZDO8gezQUpUYEw?=
 =?us-ascii?Q?qq5eotbkS+iY2bFDhtm58LNMJqjmqdRJYen/zqxVltxXcCJ2Amto+kYf8Nv0?=
 =?us-ascii?Q?3mave8e9FdqPbb3vaYB2AukX+pi953bw/qecxcw9ObmPErG4iQAaLKzkL9+a?=
 =?us-ascii?Q?IOUb2xQo6xbfuEEhVmvx3CIk1MWOZLTD4pwTm4enUk1kNp9H3hhcnkP6HCeR?=
 =?us-ascii?Q?0VzVUP4mwnCxlurE6pSeaBk7fr5kB1wfoELOkQ8V2ckxKib4ZMr4176CSu9X?=
 =?us-ascii?Q?OlPw4OgNLrk4GnDq5zFHfTDS5QAfTziw5Avilgd8iVwPyz1FcUzX6PqP7Hvl?=
 =?us-ascii?Q?qf1s4qF/YhxXHjL6eDlvTf/oYuVfHF3dgS9kWO4o9oqffFmx5GbnqMhSXCc9?=
 =?us-ascii?Q?7dzcyIsneWTelNunhJ7+5dkqe5rQJoCxSPS2WGdn8JZzo5l5esAT5Ss0unLX?=
 =?us-ascii?Q?2W4y6NyXsrC/zenbXlRZHHIjy8TbMLC9/rf3ojWjIVZ7BfrhFPUW5V1D7+z5?=
 =?us-ascii?Q?a/JjU29EI/xA9d7Q54CF8DLZRGkUV13ZFJ4Bs+LO5Rm8/rvwrKwfB25qByhm?=
 =?us-ascii?Q?f5stPiXXDVxevhPULqw2RTtLFgTmVspQQNCKKsCtDkmDtOpMr8Gk6+Gx8puS?=
 =?us-ascii?Q?wtmz0y83HPqpOkvsZUFbOCaJmvW30dYYQ1BGuKMvwT/E3iD2M1dBHFIPCJ5X?=
 =?us-ascii?Q?UQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6i8QnS+cUqN+CgLb08H+UJ17SI2M4GQZfjtfEhcsTdkmEzDhev/d4715sOxRij91pM4nwBnndu3PD7f/qfzQezwOUV7e5zSEngTMEhJOnlE9t9wxXabVtgueLwi292nNZOmKxvkT8WUjWDCMGOgWgVe7q/RxNbuQ7qkfDLm0+80TSczJmr1XfU+xVPb2ORBXhT22HD7sksrUq075tz5j8+R57Ng1dQNaCBQN//uN6wH1xgESM3zPZszyd2d2FF2oOEYbrj7ZBzBSpweGaBECeZ1phUaSCMU320kSk9sG4NFDKSuKgmJ22P6rWtcGouZWdYTsOJW+AjCLrs/YaDskZh+KyMPFh/71F4XY6+48Gu2OIoiTq9oUaEUeD10+73RxvaXQ6LeGbx5mEKiSlLAB68fVhso5jhW9yKn4Slvat5fRUes1YF8yiMNSTq5gDPLJiV1vZxfH8XJy+gmSyxTk4FxkJ8oP5rBbJb62LcN1A4B65wpeJiq7+G4n8ML16R04snXnrN0k6757njPVJ0LdNLy+yiPCvzzfojFwWRXz24YiWM/V9LsO+upyUfjU3BoYOsgayObbOXnh4hVlGI40CjVQSXk+7sentWBBw50TZos=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e679c56a-5335-4d5a-5e7a-08ddb7c7e82b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 11:18:57.8663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8cjMqBVVCzhzLTsSE8piydk2Cl9NQ6mmJXFnq+cH6yukPpPgKQPPm8fHJB6Lf+WuEsV5Nh9FlUnxchv7SguHfYDIEVKaeI8t2mHK0moqKPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB6007
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506300092
X-Proofpoint-ORIG-GUID: hQ-Q8v8KrXBUoMzFYp09ijDIb37mETC-
X-Proofpoint-GUID: hQ-Q8v8KrXBUoMzFYp09ijDIb37mETC-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA5MiBTYWx0ZWRfX3bekDNeZQnrq UPtuNmBn96qkUmiHhlD1cgkKVT+1WCoiW0M1uXL1lSvz26v6PZQp1EN8Wjqd0ap0Y7uIG5CeSy3 Ko9QMZDG+o/vf107gU/GY9FI1wgJv8tXgbFlcs3KgNoAeyxTR0KzEDyWslo1kBokk85Nt5PrGJW
 eiaXhqN2DbyCY+rZCwyMb/DUEYlFEmgMoCZRuuFRaoQaoZGZdXrFta/7PFrPIQFqhtBLX2az8vK 6iTnjCylcKeXtAhQAOnTk27tHEpi4iZIR37S5EAoXJR8sORdnYMy/OTnLUeCoNxXA5XP291Xs/I mZ7ZZ5lUoagmUxoHBVvD/UIB2wv2XwkCr4mclxHW6+gjVMo5t3bdGHpXvgRywEVEmYALLOTYKyr
 0WVc/26NJT3K2qCfOU+TNty9j4iOUJVDtcZxFfVi2Rg5vVJu+Z0+wqgKkpZBKX7DaNLD7Tqh
X-Authority-Analysis: v=2.4 cv=b5Cy4sGx c=1 sm=1 tr=0 ts=686272a5 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=d6kN_PDZA63Hpd5UUyUA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10

On Mon, Jun 30, 2025 at 01:16:52PM +0200, David Hildenbrand wrote:
>
> >
> > @ptentp: Pointer to a COPY of the first page table entry whose flags we update
> >           if appropriate.
>
> + * @ptentp: Pointer to a COPY of the first page table entry whose flags this
> + *         function updates based on @flags if appropriate.
>
>
> >
> > And then update the description of folio_pte_batch_flags() both the brief one to
> > add 'updates ptentp to set flags if appropriate' and maybe in the larger
> > description bit.
>
> Not in the brief one; the other description, including the excessive parameter doc
> will be enough.

That works for me! Let's not hold this up on trivia.

>
> FWIW, I briefly though passing in an arg struct, or returning the pte instead (and returning
> the nr_pages using a parameter), but hated both. More than these two stupid pte*.

Well I love help structs bro so you know I'd love that ;)

This version is fine with the updated param doc though!
