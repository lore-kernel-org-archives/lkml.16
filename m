Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56531293B53
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 10:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750157490; cv=fail; b=K+MwqhsZ5VBDqwElYGtSRUmNhK+gyvp2f2YR3qPRAM45mKjuKmHGOorRhENwXPQYjeDcJb8TYPduMv7eH/KxsC5YPx0Ol1/eGTCUj/ygwgfeKgyxb7orKi2o/ULEYXKZz4yI2DD0gUuRYkC3vfPytaZC0gjTkQaaimRC4Uywx5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750157490; c=relaxed/simple;
	bh=fgebtVh/bhoRIadbS0/8OqSlobmI0RNt26ZKphIgNMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MGtWsDkQ+ggrLsd5C6LzRpcGzvcryWxaiKQ/KVw8jDjh5WEPnq7hbPt3/HCEo1uQ1v5Bu2iK/z5Z5razudRep5Qdl0pbGVf0JPyM0wrFr7EgRFSDt6eansXLL3fZ++RbQFStFVd6LCTSIA5Bmj5lvDuKW2O9VgrvvQpCQb/PIbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jJ0qBL0L; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wfDnuxIP; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jJ0qBL0L";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wfDnuxIP"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H8truF000992;
	Tue, 17 Jun 2025 10:50:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ZhQEwE5kWyNi58VlXH
	J1EhoL3Ptl4/eqYBKa9a7aFvQ=; b=jJ0qBL0LhcT1OO6V4ihJUIrb3QeYqV6q5i
	pfqc87shVCUwEZKNqwBB2n5lVdZNPMLNdFEYAbIONtZhRKxAvSyuX4NUFBO0MEHx
	+XlzXsR2GX3J2hDj+Tlg2YhwAVb3O0bqxU7LhqwOe/n4TD+NKNuLdOUCwARe7cn4
	h4NkbdhCnSNuMBVdQqrlIK459yqFbncYaKf0zCuI3yRAMA0Hxxc9OkMEv4jzdVXx
	534uvoBhf69okyehjUe7NfWt5Co2Ut1kMArY1MTCFcEgPd0ij+2+5gUMJgxiDjwq
	wUpE7mPxQL4PZ+H+CGz0i3O/sbqH6fpArsNNRhEcfsvRg6gT77dQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47b23xrgcq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 10:50:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55H9kpWb001502;
	Tue, 17 Jun 2025 10:50:32 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yh92x4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 10:50:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RPp5SxoVEzlLXJvlrMVVu8Rt/GA7sdAes8nDG0hMES6+N54Q/s4Aov5T5+4r7TFk/14ZkX4DAE1PfEKOQzuHzXno0WRh72LWeswjdGAD7cMjSzoRkHQJPkg+11dFwewybm6Im4wstsCezLPtubwU+tLImUnS8aftaw6c/hPLGe/5NN98PYkv+o+13TmEsREsb6WhM0J5GIsr/W6s8+DLJrjZtslYyH1S3uExCWTDx5f4AqAZa0g6SsraL1KyxsFFArx6uP4PD4hB93zXMcOPcFaUqOebUjbYo6BxKxXkgV2061OYKb58Y8MIcw8goI0G9s/M80bhw4ahZnbg3BFN4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZhQEwE5kWyNi58VlXHJ1EhoL3Ptl4/eqYBKa9a7aFvQ=;
 b=Y1XrcKif3CdZkPU6751zmIP1gjYYuIp5eRj76FnlNy8IDOXtKjh7oZ/0N7YL8XR+WCJ4GkdpmeO4817ZyJZsmmPk7K+zFk5iD8Klq87qNZSlCD9pccDCTzjOX1BFtbsf+EC3pdlscTrFj+lISs769gMQWMocJB6gX4XxWsVqW1ylusyIsL/Saj/nEhxmCAAFCbB1axvCQv670E6IwWVYhLYAC0Tb2cT9vFZ2WDwrNazJrJX1rEMIOMfzxlE2Fpns8FomgVxdPjBnSGoyDHOuN+D1C6kZPpXCPAETsXtHq/YcP1yi1OkeVdtwda7dvJvLgIEbVMO3xBMuBHQHQOVZVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhQEwE5kWyNi58VlXHJ1EhoL3Ptl4/eqYBKa9a7aFvQ=;
 b=wfDnuxIP7rcjBWoUFy3/E68eMGzwMAbaNtCQrovmulFs0ZphQqlDXuXszGEK8Panjx2QJhNJVrVDdbpu4fPWz1LKRf26btPe1DLdMSVW/sii0Mg/dNuDum05poQ3bof+J99390JmiNnY8/PrlcuJPF8j+1aoBAzOl9GSVKmYz1U=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by LV3PR10MB7915.namprd10.prod.outlook.com (2603:10b6:408:21a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 10:50:28 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 10:50:28 +0000
Date: Tue, 17 Jun 2025 11:50:26 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>, Pedro Falcato <pfalcato@suse.de>,
        Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>,
        Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Jakub Matena <matenajakub@gmail.com>,
        Wei Yang <richard.weiyang@gmail.com>, Barry Song <baohua@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/11] mm/mremap: introduce more mergeable mremap via
 MREMAP_RELOCATE_ANON
Message-ID: <c9075468-f8c8-4114-85df-c8b6afc6d8b4@lucifer.local>
References: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
 <7e51e1e2-7272-48d5-9457-40ab87ad7694@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e51e1e2-7272-48d5-9457-40ab87ad7694@redhat.com>
X-ClientProxiedBy: LO4P123CA0442.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::15) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|LV3PR10MB7915:EE_
X-MS-Office365-Filtering-Correlation-Id: be7c5c33-8bc6-49cb-dcb6-08ddad8cc5d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Clk0b0FzC51uIhzbBdWN7fgzFhNYO7AFrHyO1zeJ2pC2keYOM24NQyzKtjPt?=
 =?us-ascii?Q?eR/byubUi3UGvhXrlDVRQbvZa6PMBR/tIDcZ8ddroCDXn8x1KL9GiP4oN2LK?=
 =?us-ascii?Q?kk9fY6dfQ+buQg18Cn10OG2EIWvWTUHj7LpGhip3vjVcqw4tNiVm2Rp2GHeG?=
 =?us-ascii?Q?9q1wlE43/DL9jJ6BfIuZ6MgviKlxjcHPcfRMfg82RR65OiJTZ5Lj3HNNgQ0/?=
 =?us-ascii?Q?OmFB+JpXIgLqaiFb7znCJo54hERqUn5WWGYwYmhIlaQ+BPlvmXqjeN0w7lbg?=
 =?us-ascii?Q?udI+Fo65CgMO3PjQzGPXdcZBWSeINH3Qh7evT2yDyBJ7eYQVj8Spl+T3T0jA?=
 =?us-ascii?Q?bMaOrYNjy2x5ksrRzUfDLV+J80UvI5eCKNa1CBM6ZAWs+7eIuJcxb/RlZfgV?=
 =?us-ascii?Q?K3hAy3BpS7gqT3tLSPjbw/ryZ97rfm/RcYWHNAn+OvAtex16kV5pwo9DTV5a?=
 =?us-ascii?Q?PrSxRYyEFG89O2nX+gG32wWErkwhbUikP1vlhhdGSNhuER3wRpJ8bv4gWv5B?=
 =?us-ascii?Q?HnTlGmyJI34IK3ITNj/24kyKVt4F8vD4SazQCYdZSaN2ckfvGBcw6kuBYrum?=
 =?us-ascii?Q?OnGKbAIA08eSk59r2HSPklbg75NB4vYHPm5e/Z8kZGqEZ5CcMWZdRA7a7+Cm?=
 =?us-ascii?Q?eTea4a5K0xMrN/dUbHgAHeKe4mAbaiB42Q2pG6cpn/5whbkUpopm0Pm//Pg3?=
 =?us-ascii?Q?rQukxyo5Qona9A09TlW4VKfq8tt9iTnka2JggdV1jwh+cM0Nb1Sd3cZjmk5L?=
 =?us-ascii?Q?ajAvaCyyHMmYGv3OJAg0K6zwSx0rBUvvrZKakWhJEMHvvyFab/+LR3q4ChO0?=
 =?us-ascii?Q?gNDF6jd1yIg5Wi1/IR+Bc62SgIj6R78f44yLVA19BohrSGcwbQn4SJarioAh?=
 =?us-ascii?Q?TaACSUfqxmV5yFpw4UxjoKOoT6MZQtHrQjgXo2JrMr4oBZhpvy9b56LGPXst?=
 =?us-ascii?Q?Ra7kEd44HNzS7NaLBBRuB3f8OdfSplV15FgCUADiPD3N52J119fWI3gjPv23?=
 =?us-ascii?Q?+J3h2ZlYJaO7rbx3GtxCQXjdt5fGpDOUo1w62Kuu4U4sB1J9zM6sNHVNVufu?=
 =?us-ascii?Q?T3auMTkcd2pTrm/aUDX94qIhq/HnSJihI1QmIV2ZOI3h1A/VcJENYvhQfU6D?=
 =?us-ascii?Q?bEwgqbCC56kbXcyXBU+b6W6lP9ppAU1zQNIecY4GFuuNDf2qvlDpqJGv+L4n?=
 =?us-ascii?Q?fkoNTB16oXZphJnybg4yREvcJLZ6aGpsbDkGAD/fnz4Pc1/SiGt3zfuVR40y?=
 =?us-ascii?Q?lwju1UuhSKfKASJGBn7u44rTU483h7a/CZ75Ol3SEfPs+9zgRmWgga+idruW?=
 =?us-ascii?Q?S6E5VijiEfPclZayN/c6flShbgeVdA8RuTld3WfKRSvspub9KW1sLsfWcH2i?=
 =?us-ascii?Q?ke9tS9nYtEZu7BkWh4/k9S693jvi9rs8a83Q7i6PcPqvEoffDHU/cGOJMOQd?=
 =?us-ascii?Q?RdcDoOCNdWc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fcmtDD+Ug9HBA2j1s73e5t8F6jbRUK5CIzsWMYTTutfDJa+O9U5YK77j6Cxw?=
 =?us-ascii?Q?4wGWuRNeT9p0Oc4ZMtBXz2pQTvpHSMZAfrsMcGLi5lFl53sWMr8GhqhZFTQW?=
 =?us-ascii?Q?YOcaeopKoUPrBCFgMFHAb3xxX/5XepL6MJvjYRVmB+9TIm+Sja+2uQDHHNmz?=
 =?us-ascii?Q?73J6Joq0RZJlzl4a5s79o8MQBH3XXAGNg1NJGVRhXLK3GBqdUf5qbByOOHj5?=
 =?us-ascii?Q?fdtETlUsshVWSMqmiKAmbuaIFZ0lK3LaY/PfAyanC99XcuvtgTysIc6OQR+e?=
 =?us-ascii?Q?t1Ierll30TjaJBE+FWDAkB3q12TVjWIY/83HA8XlzJxNzFj2NCjP5P8rbJPs?=
 =?us-ascii?Q?WGcBugLpLN6ArITGSBhyLM70/d7Mx/sl1Ws9MR16t0yXwq8ZuY9vhj6TuGs8?=
 =?us-ascii?Q?8n7Yh62kGlmicaJsiZdSD6aulqBEG9GxkhtCLeh/mzjWzu5iu2G3OJz8YQ4P?=
 =?us-ascii?Q?ev7z3nQehyJCSVgIE54C5QBoLpVB76ej95ZLs+Imk9d6/yytH/jyEGSMDwJN?=
 =?us-ascii?Q?5ii+fR0wkXWCem5tMZ303i4nIOI+hJwzN032SrGhHMTykq0OKlbB6mM6mN1x?=
 =?us-ascii?Q?K5DnqjxeTN2TlJVU66muB6Seapjy0+scn/r0jZhG7/JUsAMMKTbTMn1Eiufl?=
 =?us-ascii?Q?hp09QVs2ibrdrHmu3rXjtHqRL4TE4HH0lwTsPeVXxm1Ung+kQkjGOShca8eC?=
 =?us-ascii?Q?ImXxOQk+33LFQZp/qetbhLTgWS9U7W6QsFFNOkmA8WhhWwiZz3gu9mTgLrk1?=
 =?us-ascii?Q?nVu7+apSBjfiLnOiuNCKc3dBrQYkh3sOaHp5ZyHlJusiQcLABermAdkB1G6v?=
 =?us-ascii?Q?iT9l8brrmiEk8MCKzTF90d77dxPVD6sYmzfTOL4+OkHfFJoWpe5K8bPPWkzV?=
 =?us-ascii?Q?sqAtEhna0lgWfiCajl6rWnymt2t7jtqHFoHjOPTQ9ycxKVFRMjD+IkATb7YY?=
 =?us-ascii?Q?aTq6b8w/OBoOUiZdotMeWrQwWhna0rrTXloYE8VD6ilU5+x10j+OV2z7sA9X?=
 =?us-ascii?Q?PDzQ9lbhkqf4hM6xhBcN/IgWRqiSBdu6CoSTV+8LJVIBeTYlxAdUmuZ1DYw9?=
 =?us-ascii?Q?coxnUTjgKOtFNkvdgDJqvlkQZTkccKthL/lX7nenPJY+/i0RAxetNymL1IYE?=
 =?us-ascii?Q?+2BdIgTbIBOJHHZKMeWE2tc4YC6dre8g5kBtKj91aQTA5KVDnRAPRKNb/APR?=
 =?us-ascii?Q?1sl1k0F5/5NIyk7kAXj+GasbJbBzKqA96vH/iVbDuIYQkb3zMZToGZfmqrCH?=
 =?us-ascii?Q?f9D6RSGRoJmbBSlD0QBaUJtvWfNV3BRpm1ACow+Hm0Im3x6xcw0MGYYncXlL?=
 =?us-ascii?Q?XCDEqf0bksREPxdYmuhhPe+NOPdTQgTn/m7dbECd55KxhTXqC4hSWs6Hl1gt?=
 =?us-ascii?Q?mPoGoMKGih80rsgG/PaLGXLueJYxaxzl4681QAgfIE3K+8yfI7MqU+UY4ZuA?=
 =?us-ascii?Q?6X1KPYEZzn9aXtp9Odgpn/MEQ7xe6iT4xjfLioY8iKgGzXwHHPyIG+GYLE7X?=
 =?us-ascii?Q?xZ0OI6GM23p8Yi7Q4lhwoVlS11pKj1DI7g9XJ3syNqrUInn8yZAMKLw/WWXs?=
 =?us-ascii?Q?i5/XV2FP8IZJqbp1SjtBbcGWL3zt2QHZp2tlVjE0kk+qea1apjUjoocn0S5G?=
 =?us-ascii?Q?cw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DqSWMrvYvagS56j9w8yRdHz1azLyfqcjXvFePg5uhtwLStn+Xmw6DAKJ0k/aDk2hRjoKLIfPkfzFZUimcEDR4Y6TiKRPLa2Yg9egV88VGFHLiLTlHV+dukbTR2fi4o+uphlAmRSkk0R6sg01/brTxNqrlNg2CpZmrBV9G1JhFLDmZPFQEaZ14fokKolBdRSzlW3GD+9V4rhcIn3PZvUPZkZ93y6sGROvIdY2vnl0iJAfrfSAh6pTDFoLLhmhYu7HJG3bwZQKhhSr1IiYEGhlf89w5bPtEBSYGn4ttouqNHCYHMVpjIwkg/lu8lxeTuAJoYWuDh6riXRUtAXms1rEkVg39x+egbHOWyxYbL4oFsF0W4m9JOsCJ17q5RqZvSEiR77YIGVG2ICKtYtaqOQaLOSoG4TXHZR0rXeofjGNAwgwPWpvwoS2wkObbsieeXEXN4kecVMyeSA3Q5guDQavCP22274LwGfBcwB5NoB30GFIrHRY3ga7opeHN9Wt/a8IVF8cv7jf68K2ePQYoLAwMe/G2ffOfOsV7IWe68Wb9MmSLJFG1pBTUoi/AwgySmMVjZRoKJWBKZHSZSwSVcpav53qezJwPzZyzaUkBPrMbp0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be7c5c33-8bc6-49cb-dcb6-08ddad8cc5d2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 10:50:28.4667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TM2OIEpN+xa+jHnHwh/SZxF5uQvFNMVoUxIJliolOVhbvCPpbCzWtjYED0QAtzEU0ka12xMD57Dq0oFLVxGIYJosKvgJsjHvHsrLpcmzQ1A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7915
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506170088
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA4OCBTYWx0ZWRfX3+ezm6uPbqn5 qmjLU1tGelzSgj8WfoE5griKYmBVuYbIYpB5PNZ+kaKxeOx0Lup/ax/oQu8Ek8TmQb0xRxHJsXe sPhVjyOHqA/X9he9NwhGHQz2rrp8YHy4djyrPU0c1ydZEN6AFlX9SAwyK271Z0LFTxf9a762LFV
 1mVIQ1RJDO6ySRQnRx8sbXMR6tTujXxO5wV6pRYgHUZzYrUbncmKyK5QoBzRBhxlIms41EQw5jL 42i++zxTqSGPE9kmO6hpDizW8hykXKvJfetT0M/8Bv9dAu2zs69lruXmINJPilVOganoFvT5mca ZzGRMUZzc1c9MX2Zqw8ULh1MEQvrxxIdvM9CcFDDisruugtP2a0ynJBlalap0n+MswVv16mIJ4t
 aEj6fTEB7Wpql9YrxL5oXbi6daPy3he+Ar9KbsVfC9AMSlkhmjYDneOetfBi2MHQJSajcjFl
X-Authority-Analysis: v=2.4 cv=DM2P4zNb c=1 sm=1 tr=0 ts=68514879 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=TipcoH4CVeqwZx-5f9MA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13206
X-Proofpoint-GUID: hPCVFn2HqjQDNYJZLIVdOR7Y3DD-cMUf
X-Proofpoint-ORIG-GUID: hPCVFn2HqjQDNYJZLIVdOR7Y3DD-cMUf

On Mon, Jun 16, 2025 at 10:24:05PM +0200, David Hildenbrand wrote:
> Hi Lorenzo,
>
> as discussed offline, there is a lot going on an this is rather ... a lot of
> code+complexity for something that is more a corner cases. :)
>
> Corner-case as in: only select user space will benefit from this, which is
> really a shame.

Right, but this is why there's a flag for it. If you don't want to use it, you
don't have to.

I mean one can argue many things in the kernel are attacking corner cases, I
don't think that's an argument against a feature. mremap() _itself_ is a corner
case :)

On a longer-term aside: I'd like to address this in a far more broad fashion, in
fact I literally am now co-maintaining rmap with you largely because I want to
do this :P

So believe me, this is something that will be at least _tried_. But in the
meantime, the idea is we provide a means to work around a very major limitation
of anon remap.

>
> After your presentation at LSF/MM, I thought about this further, and I was
> wondering whether:
>
> (a) We cannot make this semi-automatic, avoiding flags.

I've addressed the suggestions from LSF/MM in the cover letter below.

I don't think this is possible, largely because of the issues around how we
figure out the anon_vma to attach to.

>
> (b) We cannot simplify further by limiting it to the common+easy cases
> first.
>
> I think you already to some degree did b) as part of this non-RFC, which is
> great.

Main simpllifications are - we never touch anything CoW'd, we only allow 'true'
anon.

Well we focus on 'true' anon first (i.e. no MAP_PRIVATE) so we simplify that
way. Otherwise it's pretty complete.

>
>
> So before digging into the details, let's discuss the high level problem
> briefly.
>
> I think there are three parts to it:
>
> (1) Detecting whether it is safe to adjust the folio->index (small
>     folios)
>
> (2) Performance implications of doing so
>
> (3) Detecting whether it is safe to adjust the folio->index (large PTE-
>     mapped  folios)

I think you're forgetting folio->mapping also.

This is where a lot of the complexity is - it's rather chicken-and-egg. You need
to:

a. Know that you cannot currently merge with another anon VMA (and thus avoid
   having to do any of this).
b. Have a new VMA with an anon_vma to which you can relocate the folio.
c. Have that anon_vma locked...

>
>
> Regarding (1), if we simply track whether a folio was ever used for
> COW-sharing, it would be very easy: and not only for present folios, but for
> any anon folios that are referenced by swap/migration entries. Skimming over
> patch #1, I think you apply a similar logic, which is good.

Right.

>
> Regarding (2), it would apply when we mremap() anon VMAs and they happen to
> reside next to other anon VMAs. Which workloads are we concerned about
> harming by implementing this optimization? I recall that the most common use
> case for mremap() is actually for file mappings, but I might be wrong. In
> any case, we could just have a different way to enable this optimization
> than for each and every mremap() invocation in a process.

Yeah we're getting into prctl, mctl hellscape here if we go down that road. And
I want to be conservative here. Having it as an mremap() flag doesn't prevent us
from later doing something policy-ish.

>
> Regarding (3), if we were to split large folios that cross VMA boundaries
> during mremap(), it would be simpler.

The code does that.

>
> How is it handled in this series if we large folio crosses VMA boundaries?
> (a) try splitting or (b) fail (not transparent to the user :( ).

a.

This was a painful thing to work on...

>
>
> > This also creates a difference in behaviour, often surprising to users,
> > between mappings which are faulted and those which are not - as for the
> > latter we adjust vma->vm_pgoff upon mremap() to aid mergeability.
> >
> > This is problematic firstly because this proliferates kernel allocations
> > that are pure memory pressure - unreclaimable and unmovable -
> > i.e. vm_area_struct, anon_vma, anon_vma_chain objects that need not exist.
> > > Secondly, mremap() exhibits an implicit uAPI in that it does not permit
> > remaps which span multiple VMAs (though it does permit remaps that
> > constitute a part of a single VMA).
>
> If I mremap() to create a hole and mremap() it back, I would assume to
> automatically get the hole closed again, without special flags. Well, we
> both know this is not the case :)

This is a profoundly confusing thing for users, sadly.

>
> > > This means that a user must concern themselves with whether merges
> succeed
> > or not should they wish to use mremap() in such a way which causes multiple
> > mremap() calls to be performed upon mappings.
>
> Right.
>
> >
> > This series provides users with an option to accept the overhead of
> > actually updating the VMA and underlying folios via the
> > MREMAP_RELOCATE_ANON flag.
>
> Okay. I wish we could avoid this flag ...

Me too... hey I've run kernels with this flag just turned on by default and they
seemed fine ;)

>
> >
> > If MREMAP_RELOCATE_ANON is specified, but an ordinary merge would result in
> > the mremap() succeeding, then no attempt is made at relocation of folios as
> > this is not required.
>
> Makes sense. This is the existing behavior then.

Yes, so we have a sane fallback.

>
> >
> > Even if no merge is possible upon moving of the region, vma->vm_pgoff and
> > folio->index fields are appropriately updated in order that subsequent
> > mremap() or mprotect() calls will succeed in merging.
>
> By looking at the surrounding VMAs or simply by trying to always keep the
> folio->index to correspond to the address in the VMA? (just if mremap()
> never happened, I assume?)

This is actually address future mprotect merges for instance (e.g. immediately
adjacent non-compatible VMA gets mprotect()'d to something compatible), or if
other VMAs are mapped adjacent to the moved VMA etc.

It just means, if you set this flag, and the operation succeeds, we will still
change vma->vm_pgoff and folio->index such that the VMA is mergeable with
immediately adjacent, compatible VMAs.

>
> >
> > This flag falls back to the ordinary means of mremap() should the operation
> > not be feasible. It also transparently undoes the operation, carefully
> > holding rmap locks such that no racing rmap operation encounters incorrect
> > or missing VMAs.
>
> I absolutely dislike this undo operation, really. :(

Yes me too. It's a complete horror show.

>
> I hope we can find a way to just detect early whether this optimization
> would work.

Well, the problem is if we encounter something at the folio level right? If
something is unexpected, what then? No matter what we have to clean up our
mess.

We do try our best to ensure that things will succeed.

>
> Which are the exact error cases you can run into for un-doing?
>
> I assume:
>
> (a) cow-shared anon folio (can detect early)

Yes we should.

>
> (b) large folios crossing VMAs (TBD)

Addressed see later patches in series.

>
> (c) KSM folios? Probably we could move them, I *think* we would have to
> update the ksm_rmap_item. Alternatively, we could indicate if a VMA had any
> KSM folios and give up early in the first version.
>
> (d) GUP pins: I think we could allow that ... folio_maybe_dma_pinned() is
> racy either way (GUP-fast!). To deal with GUP-fast we would have to play
> different games ...
>
> Anything else?

Well given the bug report in the thread , we also now have a failure to
obtain the folio lock because we hold PTE lock as a thing.

We could address that with lockless PTE traversal though.

Or we could do what we do in the folio_test_large() handling in
relocate_anon_pte() where we drop/reacquire...

We also have the case where, upon trying to split, we encounter a folio
which already has the currently locked anon_vma set. I can investigate
further how this can happen to determine if we can detect ahead of time.

Finally the folio split can fail...

I feel like we're on thin ice if we try to make an assumption that a
relocate can always succeed.

>
> >
> > In addition, the MREMAP_MUST_RELOCATE_ANON flag is supplied in case the
> > user needs to know whether or not the operation succeeded - this flag is
> > identical to MREMAP_RELOCATE_ANON, only if the operation cannot succeed,
> > the mremap() fails with -EFAULT.
>
> How would an APP deal with these errors? Do you have a user in mind that
> could do something sensible based on this error?

Well it's the only way to know if what you wanted actually happened or
not. I guarantee you, that people will complain if the issues they use this
to fix aren't always resolved by this.

They could also use for some retry logic potentially also.

>
> I'm having a hard time imagining that :)

It's useful for testing at the very least, very useful indeed so on this
basis it's worth having and doesn't add too much complexity.

>
> >
> > Note that no-op mremap() operations (such as an unpopulated range, or a
> > merge that would trivially succeed already) will succeed under
> > MREMAP_MUST_RELOCATE_ANON.
> >
> > mremap() already walks page tables, so it isn't an order of magntitude
> > increase in workload, but constitutes the need to walk to page table leaf
> > level and manipulate folios.
>
> Only for anon VMAs, though. Do you have some numbers how bad it is? I mean,
> mremap() is already a pretty invasive/expensive operation ... :) ... which
> is why people started using uffdio_move instead, to avoid  the heavy-weight
> locks.

I got a whole bunch of numbers, I mean things were always within the same
order-of-magnitude, however things are much slower if the existing logic
could just move a higher order page table entry rather than having to
traverse folios, obviously.

I do feel that mremap() perf shouldn't be a consideration given how
heavy-handed it is already as you say. But I'm not sure everybody will
share that view...

>
> >
> > The operations all succeed under THP and in general are compatible with
> > underlying large folios of any size. In fact, the larger the folio, the
> > more efficient the operation is.
>
> Yes.
>
> >
> > Performance testing indicate that time taken using MREMAP_RELOCATE_ANON is
> > on the same order of magnitude of ordinary mremap() operations, with both
> > exhibiting time to the proportion of the mapping which is populated.
> >
> > Of course, mremap() operations that are entirely aligned are significantly
> > faster as they need only move a VMA and a smaller number of higher order
> > page tables, but this is unavoidable.
> >
> > Previous efforts in this area
> > =============================
> >
> > An approach addressing this issue was previously suggested by Jakub Matena
> > in a series posted a few years ago in [0] (and discussed in a masters
> > thesis).
> >
> > However this was a more general effort which attempted to always make
> > anonymous mappings more mergeable, and therefore was not quite ready for
> > the upstream limelight. In addition, large folio work which has occurred
> > since requires us to carefully consider and account for this.
> >
> > This series is more conservative and targeted (one must specific a flag to
> > get this behaviour) and additionally goes to great efforts to handle large
> > folios and account all of the nitty gritty locking concerns that might
> > arise in current kernel code.
> >
> > Thanks goes out to Jakub for his efforts however, and hopefully this effort
> > to take a slightly different approach to the same problem is pleasing to
> > him regardless :)
> >
> > [0]:https://lore.kernel.org/all/20220311174602.288010-1-matenajakub@gmail.com/
> >
> > Use-cases
> > =========
> >
> > * ZGC is a concurrent GC shipped with OpenJDK. A prototype is being worked
> >    upon which makes use of extensive mremap() operations to perform
> >    defragmentation of objects, taking advantage of the plentiful available
> >    virtual address space in a 64-bit system.
> >
> >    In instances where one VMA is faulted in and another not, merging is not
> >    possible, which leads to significant, unreclaimable, kernel metadata
> >    overhead and contention on the vm.max_map_count limit.
> >
> >    This series eliminates the issue entirely.
> > * It was indicated that Android similarly moves memory around and
> >    encounters the very same issues as ZGC.
>
> Isn't Android using uffdio_move?

I stated this only based on what I was told, I didn't dig deep.

>
> > * SUSE indicate they have encountered similar issues as pertains to an
> >    internal client.
> >
> > Past approaches
> > ===============
> >
> > In discussions at LSF/MM/BPF It was suggested that we could make this an
> > madvise() operation, however at this point it will be too late to correctly
> > perform the merge, requiring an unmap/remap which would be egregious.
> >
> > It was further suggested that we simply defer the operation to the point at
> > which an mremap() is attempted on multiple immediately adjacent VMAs (that
> > is - to allow VMA fragmentation up until the point where it might cause
> > perceptible issues with uAPI).
> >
> > This is problematic in that in the first instance - you accrue
> > fragmentation, and only if you were to try to move the fragmented objects
> > again would you resolve it.
> >
> > Additionally you would not be able to handle the mprotect() case, and you'd
> > have the same issue as the madvise() approach in that you'd need to
> > essentially re-map each VMA.
> >
> > Additionally it would become non-trivial to correctly merge the VMAs - if
> > there were more than 3, we would need to invent a new merging mechanism
> > specifically for this, hold locks carefully over each to avoid them
> > disappearing from beneath us and introduce a great deal of non-optional
> > complexity.
> >
> > While imperfect, the mremap flag approach seems the least invasive most
> > workable solution (until further rework of the anon_vma mechanism can be
> > achieved!)
>
> Well, at that point we already have these new flags ... :(
>
> >
> >   include/linux/rmap.h                          |    4 +
> >   include/uapi/linux/mman.h                     |    8 +-
> >   mm/internal.h                                 |    1 +
> >   mm/mremap.c                                   |  719 ++++++-
> >   mm/vma.c                                      |   77 +-
> >   mm/vma.h                                      |   36 +-
>
> ~ +40% on LOC on mm/mremap.c :(

SLOC is a terrible measure :) I'd suggest counting how much of those are
comments... :)

The mremap() refactor added a bunch of SLOC but a lot of that was comments,
and breaking out very confusing logic into logical parts etc. It also added
more lines than that...

Unfortunately though trying to do anything like this involves added
complexity. I did try to keep it as minimal as possible...

>
> --
> Cheers,
>
> David / dhildenb
>
