Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0D1214234
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 17:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746725944; cv=fail; b=kMTJhWvJsU4LZtgvn0t1SMiCY9/+59EHRtQssC0j+SPTkX1gx3Vbyec/SYyjWQCYJPESMHdwIPLjTbsACOua29vxfheK5g/qT7WlgVqz62DuTvjM9YQ4lBRccgn6q2F+PEoOcxVDng1fvMdCgBdYmSB3h9JFs+S6sNXuZDD8A4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746725944; c=relaxed/simple;
	bh=XmpTeOv8l+EJ8z3QqiFVSnia98heDiiyBR5l66B/0Js=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=uGBrG2WEuLgwD90PrLfdi04D30U2eNv2lUY90NosJg67mL0BXXwCSjAYeowJFs+Ix2A/5rb3SFZrRIpoCym0hvzgj+E9r1thI5kA+/yhb0Rq9FB3cxAuZiOMp1l/dpqdsdG6q3nYFJV4FwfJpK0eL+eTpVR4NhEfgiOh+O2Nm3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gVGxpsFi; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NbDcwi3f; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gVGxpsFi";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NbDcwi3f"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548HMMOa004311;
	Thu, 8 May 2025 17:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=HS4C072V3p6+iTVi
	CZYYj4iiI2Iubnr1j7a72STxfic=; b=gVGxpsFiAd+8hLlg6pQpNoWJfuFfnPOl
	c343XuDsrkNGsqgI7XYWu9hks6wf35eKgchnby8VTMrC8F8IUmOId8WSyzx+ymtP
	4urP9ERftAA0M4tKjetCNrDEsXYW4/oNgRGipmQ4AkUj9gkdh5l9yo7uNVk4qNLz
	tT6RCJcagzKz/1+YvyZEtynUMvmgsSHmNbRPrV7rZHILUMQ68d38hUUdhQir2glS
	Px36vnMza7p5sBTQJRK8n6Mok9jIH0WOA/7UHnsYIFQTj3ANbmIoeTwD0PoQn/Sd
	rbOtiBhEqkulAcBEozjuVXUgKppCQ9dQhB9IcgwTNWWiI8HPytMWJA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46h0xv8170-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 May 2025 17:38:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 548HTNvd037596;
	Thu, 8 May 2025 17:38:30 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2041.outbound.protection.outlook.com [104.47.55.41])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46d9kbqw6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 May 2025 17:38:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t5jNU6xTDnz1rHvVWZApMAwdW78O3RhNtUlU91SrqFYwdL9G/Q75dkobSK4F98A+ABAzxlxbfXXZGRLR6o9PhEr5V2DnbrW6ZIIcdHj6uuYDzadv1+sYmyInxaZGdJIKGDbJyv6IHXogWsD64aKrJmAndN+w8R6Hi1Fe7jqP+YFHmjNJBJy9ttnyGS4YXTIJEwKPfs+yxhIDk6IMko4LeDNrZqMHFRvnzEPB99eSpJGrnZJat16m73mFiRLmcOegidv5d3xX+NUnOyeuWY9spTEso7krztr08sLny0PZi4V/aFdzEghIe9O6WNMWxTHHqLUO8nQs+Wiq/BvKVeA71A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HS4C072V3p6+iTViCZYYj4iiI2Iubnr1j7a72STxfic=;
 b=Y0Sjj+N7bqFY+LG4ZYEt1uZVCSok5n15Gsb8T//37rKsfxQzGDPPdsi3ioDwR2vzio2gclLlZFtSN4NLf0dXKkdfq6LIa/4BNCMflISrsldzWmFjqml3dAkU4xYFLZwDgruq/QJ6rXbZawkDfiXKeIQA63nJR0PM0ANttESRWopkXJVamZ9vufbRy87nFg+kQAKqUmjbwBAbjGzOssxb68X+o3l07GectrwZLOGOEGtZ+wXCAmRkJikFSNZySTPAQ4lGhanjAqKatMmUSAQ8Yt+JE6WHA5ztXz2BMFDsnr8nq3twFScUMC6c2VvNPVPxN2LZjA2fNpc0zCUc3JuMog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HS4C072V3p6+iTViCZYYj4iiI2Iubnr1j7a72STxfic=;
 b=NbDcwi3fSLT8qa0HDOphgo9o1WmN2Eqcl58HRyEJRjxKbhbxMXFwGwt2qoCUb6nc++iPXvPoCKX0ViLJXM/0tOfBCuj6LZ2gpcc0bL0uGEjWL1de8ZISDTMySEYjz6GWUvaqIc0Yfwzc4+F84qH/W1p1Pq7jlyQUo8Yf/oTghJw=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH7PR10MB6274.namprd10.prod.outlook.com (2603:10b6:510:212::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Thu, 8 May
 2025 17:38:23 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Thu, 8 May 2025
 17:38:23 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@redhat.com>,
        Michal Hocko <mhocko@kernel.org>, Yu Zhao <yuzhao@google.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>,
        Shakeel Butt <shakeel.butt@linux.dev>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH] MAINTAINERS: add mm reclaim section
Date: Thu,  8 May 2025 18:37:35 +0100
Message-ID: <20250508173735.173502-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0085.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::18) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH7PR10MB6274:EE_
X-MS-Office365-Filtering-Correlation-Id: 09577be3-4d27-46a3-eb03-08dd8e5721ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g7yGfYdjYJjIRxD4tPG2b8C3RghTWdb7f9ByWUeawtfojeFFFVvnppd9BrO5?=
 =?us-ascii?Q?UAUZNZO7YPZCiJs5l2wGEUP/J1Njw2fTNkS27hNB8o7gkRuot8JpHdcmMmqs?=
 =?us-ascii?Q?HIiUzTv31fv8NhKhrbB2yy5IJGA/4PGl4fwGFmj4yxMCLhxb0TN1VgsQF1PH?=
 =?us-ascii?Q?1TaXFct2zZ0D2L5ax7To6AXN8smnh5yg1MKTGkpYkHCTy+uejCxv3pSLE8vW?=
 =?us-ascii?Q?rvdZV1/3R9x5DggDpUmH3cKTNbIPZEhGfOA7idDMcCq8R/dCO9Ig6HMb1TNB?=
 =?us-ascii?Q?PA2aRIb7jjRu79zORTfX0ElblljfGjDBBVbdFjpABx1L/BU8mtTT3E1agqqQ?=
 =?us-ascii?Q?72vEmGfnNKBgpozW5S4YiFnyI7p0Go4AweeD+gVH1APrMqgmjDgLsrDPXHjm?=
 =?us-ascii?Q?kwzpJK06REIaVqnJQML3414mkxN37KX1mRSCMGMsI0uCuwypXHJXgdhbXkic?=
 =?us-ascii?Q?EzCm4clY7rsPzm868yqTVmPyU8lId94nhuNCowzOdfpGRrXD+EvJbAi0keUh?=
 =?us-ascii?Q?fhHwsFhaibOA8kh5mVbyH1uR4e8HX6IzLxQFreC62adbzGQbcxCHWMaHacji?=
 =?us-ascii?Q?P83BovkSoYNn/yixOen/BVWKwzelu2Un4ItUfLwDUiF0ySPTrnkj3IN4hJfC?=
 =?us-ascii?Q?FAVshE8kKirp6c+nO1E1MKesgL3adSY/IIQSutIG5xjzo/1Yn0iMf+XbYrHN?=
 =?us-ascii?Q?3ct//1YiLHg/I9jLoP1P9Flpulmw02gKjlKYRWJVdEbQI/uvMTo0Cl8JTJWK?=
 =?us-ascii?Q?0sQIrXRM+h8crEUmWv1cEUv3MDSJC5KkmtKFrzMU++W7zWf0ZktFYSJQ5tUj?=
 =?us-ascii?Q?LDm9aBZAu76SKBcVl0vmVJFay2TlWTuTa4gB+UgkguqeJTsZeGYjDdSFv6Fw?=
 =?us-ascii?Q?lSsnI6+JdJXFaT2IWMW1OiRTbZGc8y6TS7E4NrukivXrgpzC0SfeZOZ43TCC?=
 =?us-ascii?Q?WHULpaRKXrTaXMeRLaDqcghzS0hZOhOdj+WxTVsTgRc2LeGZTI5E+ula6rgl?=
 =?us-ascii?Q?7FU2QwQPxl6hS1ClCLxE7IDtEARAg4Ym1xtYaKgJXCDPIkXEm9GKMs64mcPS?=
 =?us-ascii?Q?ljUId6i96TQAt5e3gC70/Ng/BZV6nX+rlaxePf7TlHrVlQeYKpRD4ellP0kO?=
 =?us-ascii?Q?j3rt5dbGtsJtyE7D5p2on1hPqKQgNcaHVEK5sN5t+JxrhmBBG/KgTJs1q3xZ?=
 =?us-ascii?Q?O0oXxp7d2ogdaAayUFg3tsCOG7ayXn28qbQreXq1p1yB9BHQvyAYHGD/pfdx?=
 =?us-ascii?Q?5mD15FdEYc+0Sdj2ARJEN5jqamA6Hv21owxJrbq1i6rHgQ1z/pbz4gfBz+HC?=
 =?us-ascii?Q?gaq+9h4bKMXTlp8zO2Vc4TamFST+fzG4S0VeyAX9wRJ2s/SAFcgagzgA9bz7?=
 =?us-ascii?Q?YN/djG8JFtByKs+Aj1ampSJG8fqEVw4Tu+AhYOnxZFEGdI8JN2wb0BtMtcYz?=
 =?us-ascii?Q?AjQSy0MUJ6U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2lnKCMG3WD1Z0/pNLtuNsyBkav3ih62pQzluefzg1lPZvJym7T26RQWifORD?=
 =?us-ascii?Q?2nH3D6xCgr1J6B5ai3Tqkh5pZxnyn/KH6c7eJ2NTcihbcHLMQMT2DyhiFd5h?=
 =?us-ascii?Q?QtvRbMrTg6RfXspqoBbHmuJdA9HNv6l7jypSWXz0L8sbjqiPPwKjeESCztHK?=
 =?us-ascii?Q?N51ViRsyhifJL8BWT5keVeHhQ40+/vMRt0tMMkhGxI4NdL6Bm4joSuQqR7nW?=
 =?us-ascii?Q?MLF/vv+gwe01iN8sUqsRDElSdaxRkou3CQHu8ZZbYULliReHQ+63XuW4rQ2l?=
 =?us-ascii?Q?dmGRQt/vqIceGtXYMmVwbkXzlds3tl5OPjJqZ1RKHIvDECuU9yWhnh0Bk5lH?=
 =?us-ascii?Q?cjAmZNLzUNHI6NaVg/yNH2g5Dbbu0bcD7zDvOPTvJxiMzgppoU0CFBPjD652?=
 =?us-ascii?Q?LkwfAM00+ZfyE0fkocMiqKDCwkdlNvQ31xULJ5rpQHcJneuDHmvp9KQeSzSA?=
 =?us-ascii?Q?3o15wfjF04EQNnx8QFr9ouD2Q8WDfxAu2CvFAwTkIgcCGMWqQwA6qys7D3Kd?=
 =?us-ascii?Q?sTAc2j6vOR28yQSnxBYrid/H3+eAep67HVu6KWHonIqs7zyI0HTxYm0oge+s?=
 =?us-ascii?Q?U84+oHvEQ5r46VCZzDgCQARkqLKtSXca47SDK9v7KGJL3X4DQMngluQMhQAc?=
 =?us-ascii?Q?o9X/FQmFwoq1NK/CMe1kgO5cLjkrRXGwgPy0mvV6ahiMkwqg9k3QZrMp7qRI?=
 =?us-ascii?Q?4SFjC6I2zIImtOnLJWSbuwdNBCF3D7J0N77MQK6nPphCVjai1sgA1M1U1oAu?=
 =?us-ascii?Q?ArhoBN6eOTGZWPB73kXObrfZcYMXuVnqwS85JV9PuqDdkcFN6UfbGQE4+QQz?=
 =?us-ascii?Q?a1H9e3D41472bSV0amNqu3105noWCxRmkCZE6wdKt0EoIK0UbcC4+dPYmZAB?=
 =?us-ascii?Q?iigysMD0zyqGG1PrpeQsVwwTb7INlGqvdCoLw1ZRT2unirn4AhmKUTwMYfWi?=
 =?us-ascii?Q?Iqzb7m+KSMsTW7lG0w6WoMUT7rJ43UKOKXp4pBporXo/vbG7XD3A32IEjCUI?=
 =?us-ascii?Q?kYgMmLV6ykVQrJSrk8aR9iil5dTFCkQRgMMaupQxy8TXqa64KhM1WwFW+MjJ?=
 =?us-ascii?Q?ckoJ5na7Gu3fPgOTEzAtRMGQbP8H7dE7GLjO/3VL2oZQOXXf4SBdc9CpyZPU?=
 =?us-ascii?Q?SwkeZ1oIqA3IWHjt5c7diakUQwiHpo/cpcds0iqQJQ7vMCOmHYqYR1Imafa0?=
 =?us-ascii?Q?US1dIIP0sDLe/MQIFySenao+C1MDeqiqAOAPgGIDXp20bIzDrvmwYOH/nnMt?=
 =?us-ascii?Q?lz4IY3SeFG/M0KZQUTf6mq5fKBsEZGGq50pDpdJ+M9dyvF/6Jb1Tl9j9nSsP?=
 =?us-ascii?Q?OcBUu7kHTzEeXD2rZG7MCOCyavRN+Z7J0n8++GSU7T+2tuEF4zTARjjixDch?=
 =?us-ascii?Q?Ptft/8AkN0ngDP9NRX32vo+GCbyTqUPVllSrF1rTUIlgmHDCbx6XA6OpB/cZ?=
 =?us-ascii?Q?L2kQG4b/LN4Azk8tTMcI2pBP7TAYDOmLQ+h1M7/p9wp4AKRm2ZcJeq6MYB+d?=
 =?us-ascii?Q?lzP0a8nNkwJncYltWA+jtOAgRm3qK4InB1zXg3AqDnxDj6DZxYZDZsjbtKlG?=
 =?us-ascii?Q?AB2nU6rYj5B8PzSo8fydGwavgrFvOA+d97p2zSV6ZGvkJAWlLYGIOcM66u3M?=
 =?us-ascii?Q?LQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CvtVKeFQNUnwnozI6zmsr4GTjyDn188Qj/qAQYBLYnyZ39d/zvaGFh61uYooMyXgfnZd9yjRo5cx8X3Hp7V4haPRssOUdxBcdt/Bw5k5qcmfblYXIkJLRmypp96wmpWuNtU2kutoUClIhaFhNGYnfx90cryjs0kUGt4ncFGpdi1BXRTJDXvfV9Mw3VOqx88TvgPiWa8EHUIAQlukdsMnGe9De5xVhgC4zLAIXoLvwh/FiWvAI40U24uHExiQYg5kwpXZozAf9mWMLKx/mPZpVdauQqv2/ZeikyLnW/AVByNGTFRmIBFDN3onNGClZ8lh6mkjQyiQmg04kYN8RaWSpdPoTW7DFtmvYPNcxiKdVq4+y5bZLCrmyS5Lx0JrfLIS0UDakOH5J8Bjc05dBe5/ZK4OuV4S3lEvEn/bfkaVcIggIQssLt6UD8DBX0ZQR8XZu0xjdSC32DLOUeBjCYLdkLcAuJ8cO2w/c3IDJZwCYmDrTPfbisROkO2494QGJUQDgdPAmu5x1INb6iQXywN8zw+z5CeBWhEbz2KMfJa86Z2TBAaofY21ScJTuHjHvarYa6wE9Qb10vAO4oZ+vuXSeIUZEnultO4znOOLWVhrjH8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09577be3-4d27-46a3-eb03-08dd8e5721ae
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 17:38:23.5897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ScDMNuJlatOVqV7U7Lt2vJ7y6HQsX9SBOITD2s2I7cQS+fZnuQ1XiwgsaaxKFsCiUgkqMEZFgunHdU8Jgot5ZjAY4fV5wX10cuGQbcDzN8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6274
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-08_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505080156
X-Authority-Analysis: v=2.4 cv=SJlCVPvH c=1 sm=1 tr=0 ts=681cec17 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=Z4Rwk6OoAAAA:8 a=ufHFDILaAAAA:8 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=968KyxNXAAAA:8 a=37rDS-QxAAAA:8 a=b6DAsu_WYAUdAcEJPFMA:9 a=HkZW87K1Qel5hWWM3VKY:22 a=ZmIg1sZ3JBWsdXgziEIF:22
 a=k1Nq6YrhK2t884LQW06G:22
X-Proofpoint-GUID: 473KBX4J9-4ChZEI5NvhxSrPeXjKGj93
X-Proofpoint-ORIG-GUID: 473KBX4J9-4ChZEI5NvhxSrPeXjKGj93
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDE1NSBTYWx0ZWRfXw2VDMUR7+F3X HmaCp+k9ni4R8w+pt2esi6ZgqAVNIbEO3ZZHD2BSuSwm9cgC6MqmC7SnFnQrdD5JBxjxxkEEuBi PcVb+ceMsvN5BG7Z6y1O0O7orPq7pSUly44FNjK8bDr+X067kDzK5Rb4VOFtPqyak0DFqSkV319
 /LkFHvS+DQP29TLLYxbaUnFYAnU4d8ZXUpyw5P7lxeH/5DoHf05krEkaU1Iaqr4usC0dIISW0D9 2IK5fTQ3K8FgjzmIjroqEt4B4TLe2nrJXv/lMBQUGhtWUGQpeMvwCkFDI2YfvgM6OO0Hs0Ua8sA eIz5b97dhCW6a9DhIiVg7VHtMiTsQbVNQEEJGWb1sNMtn6dcZkeaec7t8DlnAKF34i8uMx9QGDt
 983CtHCT9XGlL+N+Gf8hw9X3xyKGLR48w3QNLQRQRKiIGY9vMURJELkxYHzKnqs8yK0LCyqT

In furtherance of ongoing efforts to ensure people are aware of who
de-facto maintains/has an interest in specific parts of mm, as well trying
to avoid get_maintainers.pl listing only Andrew and the mailing list for mm
files - establish a reclaim memory management section and add relevant
maintainers/reviewers.

This is a key part of memory management so sensibly deserves its own
section.

This encompasses both 'classical' reclaim and MGLRU and thus reflects this
in the reviewers from both, as well as those who have contributed
specifically on the memcg side of things.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
REVIEWERS NOTE: If anybody feels they ought not to be here, or if I missed
anyone, let me know!

 MAINTAINERS | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ccc45b0ba843..a755b9dbf6cf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15577,6 +15577,20 @@ F:	mm/page_alloc.c
 F:	include/linux/gfp.h
 F:	include/linux/compaction.h

+MEMORY MANAGEMENT - RECLAIM
+M:	Andrew Morton <akpm@linux-foundation.org>
+R:	Johannes Weiner <hannes@cmpxchg.org>
+R:	David Hildenbrand <david@redhat.com>
+R:	Michal Hocko <mhocko@kernel.org>
+R:	Yu Zhao <yuzhao@google.com>
+R:	Qi Zheng <zhengqi.arch@bytedance.com>
+R:	Shakeel Butt <shakeel.butt@linux.dev>
+R:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
+L:	linux-mm@kvack.org
+S:	Maintained
+F:	mm/pt_reclaim.c
+F:	mm/vmscan.c
+
 MEMORY MANAGEMENT - RMAP (REVERSE MAPPING)
 M:	Andrew Morton <akpm@linux-foundation.org>
 M:	David Hildenbrand <david@redhat.com>
--
2.49.0
