Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3E62744D;
	Thu, 15 May 2025 15:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323993; cv=fail; b=T3yoiYi+nYPxxSeDL50xYSzCzywJkL9hEOdAz6C4gaA/20UZs3zUr7sVO9sIHbTBAexJExAPS0NEouZJ1sqWdEG926Ku7FtMWcqbbPBcaOnmV1HhWa0TtnVpzkCisHvzVKzxViAtImzu+exGYiGxqrxij9dnJXjmj/EtQcKebOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323993; c=relaxed/simple;
	bh=AxFDhIA7oexph9FEuoPqoPO2XdTravOdhh8lq7V/mIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=REbIOYE8HtmqmHQ0IC7b885VJoSAjww38Y3RGaT1x/Bid28VG+OLWp6+Y8q5O5vlj0n8DANksz4YZMRGrmaBzUz/n5ob2O+k6DhLQ1IDYArDPCqPZEie2YP7cpWZfJSImlC04YHIcWha2og7/S/dQ3fFjJjb01f8EmBVsoagBi0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GFeTsKOx; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NiWxjJpY; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GFeTsKOx";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NiWxjJpY"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FF1mJd023175;
	Thu, 15 May 2025 15:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=TCfygpPl6WVd/DURUv
	7TwPLCIBUxtqoFrL5td0vrxIk=; b=GFeTsKOxJP1tjwBud/irBX7N6tcc+yDZ1G
	qRfUC3xYbo5Eus7X8ebEsTz3C+Pa/tKlLzPKqFIF6SCODzxruZGYKtdCMFFyg236
	S38Vo11TKdtAvpyWb/cTPtqmRQYBguWPjFAPwYWRmoeis5TvVmwICfJ0KQrXR0jE
	KVj0ooDi37UdvcF7w+Oj2pQatq32xI9bAULwbB4HGpmpAvx4ALh51WWd534cGkTz
	5zmlJG3ZodoQBgL2kjYdJDYRHv2XmrRYVtmvL9dkPQjQjH1eTQOIiroY5dQXbe33
	epQtWTLPy2E4wN0Mp3PqXQV2ewLIRO3d/Q78FW3iVEQ8OlD80Ijg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46mbccvkr1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 15:45:45 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54FFJ0Ce027151;
	Thu, 15 May 2025 15:45:44 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazlp17012038.outbound.protection.outlook.com [40.93.1.38])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46mbt9gnu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 15:45:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dNSZPgZwW56rT8ytytLXbH/E0tZljtDKz18D3LyL48JgKcIVpZE1MgYrDGnv1nct1/x2CjRPIY9fZHxbB0DIFGmAl+Su8VYBUqeZmRJhW3r+3/P/dS2iTS2wopByzp7iFzvb2emupHP0zJ7P8rYu7jLgULSNDKJ21e0330NPSAkzViqqIjf9y3Tcaft6jA9r2ws7Nr3DgFsfDv7M2endF2WSNhMl0pdQiaUAW1qZpA9iAzz7MKdJo2ktZiGvLs5hJC/87ye82oE8Y67COYgsP0V2Q0hSR8jSDncnGfL3/ZLLbt8WFNcVUCRpAfz/99wpxqWgzUoZ2+JdWu+lCqHa/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TCfygpPl6WVd/DURUv7TwPLCIBUxtqoFrL5td0vrxIk=;
 b=Xkn/r8BhY54JaKIHDVYEAU2B+Fmy+wrKNls8zoNfAPiFsRDoN4bQU6Kw8IpTBztOdgf9mY9FJvLPxAoOzb4kn9WV4jXpdnWf/HMCIAaOOwXqFV+0A3D+ozdOcgWo91SYmAcTXF2VYzCobdtDPzpFsCTr5uMp83UEpGNbvB+v+S9jyh319QeDxBmwTdSCgfDONQnwvDMK4e2vmlNVBA90GfAyFudbwCeylDAlOhpVLyAsm9TBZEguIj2jfW7+tCa6Dd+BcTYcSSyP50SXUeVy5l26tnqyVN6RVPQBWUuLVNlAfvdDOF49ZfRMd8SwxMm5dHlgyj4aRXwQNVaDOCWvig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TCfygpPl6WVd/DURUv7TwPLCIBUxtqoFrL5td0vrxIk=;
 b=NiWxjJpY239qdbbmyKXK7HTIOHU2t6soKcL5/Cu+5KntyI0jf4v7DO3bi+x8l2nEihEJ6kgMKrd39FvPbxNAjgQfER0BRqrTw9ojGZ4sF1dWUvVbBCE/fR2KTx/7sqMY30XjskxAmvLIBS7eGsXit42gn7/fr3u0/Sh3Y075wh4=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by SJ0PR10MB4783.namprd10.prod.outlook.com (2603:10b6:a03:2d9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.25; Thu, 15 May
 2025 15:45:41 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 15:45:41 +0000
Date: Thu, 15 May 2025 11:45:30 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Usama Arif <usamaarif642@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
        ziy@nvidia.com, laoar.shao@gmail.com, baolin.wang@linux.alibaba.com,
        npache@redhat.com, ryan.roberts@arm.com, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/6] prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the
 process
Message-ID: <kuxzxh4r6fapb5tjbhvm7fsw7p2g6vlasdv46j2ggedmbbsec2@zgt445q4oob2>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Usama Arif <usamaarif642@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com, ziy@nvidia.com, 
	laoar.shao@gmail.com, baolin.wang@linux.alibaba.com, npache@redhat.com, 
	ryan.roberts@arm.com, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kernel-team@meta.com
References: <20250515133519.2779639-1-usamaarif642@gmail.com>
 <20250515133519.2779639-2-usamaarif642@gmail.com>
 <c0af0eb2-d10f-4ee3-87dd-c23cca6cfd1a@lucifer.local>
 <2d30bcce-6f80-468f-945d-b63eff726db5@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d30bcce-6f80-468f-945d-b63eff726db5@redhat.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YQBPR0101CA0266.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::31) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|SJ0PR10MB4783:EE_
X-MS-Office365-Filtering-Correlation-Id: 1307c9a0-709e-444b-3f7b-08dd93c78c2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SL+eo5wiKFz85o75RuVi4LOgrKMWgp4B7HdWuGHmec7AKh71NvBQCOVcY363?=
 =?us-ascii?Q?vn2SoFGYd4bhT4G5wGOVwJEjb2eeRPph3Ml5aoSBfeoaVnjQVt9eB2JMTH4Z?=
 =?us-ascii?Q?QSuHKj4PAe3yFboqMcfnyl00gpFrqIezK9qH3c0KFXZtfw77rM2lpJT70hch?=
 =?us-ascii?Q?p+owlrIf+/9TI2q5AyHvXInsTWxMOZd95pvscJeUV0njIhdOoaD5e02u6Lm0?=
 =?us-ascii?Q?/SCIrjEKb1o4ly0JHcS0YPYD4Hp7ieYWvc8alnfep6krtILUL0qaL3oxkW4V?=
 =?us-ascii?Q?v+RTUd+nKO9QG2CBeHQVtOgLzKFC4+EgBwJuiTrLiaQBZg0m8kEg7BhgtpOC?=
 =?us-ascii?Q?3Y58fZVPBIY3wKMUnS3lOsaO9fL+ctIKRO0ezSEtItEHzLjpI5Xf2F9sUYmA?=
 =?us-ascii?Q?Os+cGRna5JbnLVFcx12HVAhe4Zsf5Sk1bYH4oY9snFmuQsawbnOJAH1GUTxw?=
 =?us-ascii?Q?xJErhqPGCgD/Si8bRpaPhQnNoWOGhO7IRh0EEq5oI9qbnnYTRZE5asv/czMm?=
 =?us-ascii?Q?Del/0mkGa8ET/WeW9e9nuJDw0xxxWewhcd00sASH9ABhi/mJNGlKRV1p2Z9J?=
 =?us-ascii?Q?z/rLo21GmqOp0WOEIHDGCk3MzDeQ5IyWqvMd4eD4qYxjz/MEo4O1NSnSKk4n?=
 =?us-ascii?Q?oQfNZ5ujXfWg9MziGpcCO8n002F9I2eOdS/6+mngyx7OhMQJkvzTJg8CTVuC?=
 =?us-ascii?Q?vgjK7GJvHg/Uo7cBbYwYxDQUYiWRinJF2uUOYgj48swHiGsLMzagN5IioaRq?=
 =?us-ascii?Q?KpYOkJxcSg1hJAiJevW0IGyk64kMg5u3IenUrrd34A7iDrF86+EYT42u0zXq?=
 =?us-ascii?Q?tLBAwKh/S2jrqHz/yAFQufNoWiouO2iwIqcBcFSsMBBdkZ+61WcxcFh/3jFu?=
 =?us-ascii?Q?mKopzAXDAi5YET8Ej80TZQhvvWozW591S7eRF//GprbMAtbWcUoBW8y7saAG?=
 =?us-ascii?Q?+/DMXn7TeqpCMK849uZ6j30k3TUAVWhtymtl6I5cIbeEsVUZHQIFMEjml8LT?=
 =?us-ascii?Q?OCL6fnIX6Ri9UWctAX6emj/HPH02PhJ6wiSkMohSYRLxDM7SQONmT97U0Jkz?=
 =?us-ascii?Q?jdLDUcEFBQo4DSCXCsoq6cvhgv3RkbJZzlIBd6mgh6jOgv0DRmqS55wwjREB?=
 =?us-ascii?Q?S6JtinjkIbGsyV6MHtYPkoGvKxC9jXTaCpdp1dXW4xwyEB+dV1D+VpOKq5g1?=
 =?us-ascii?Q?HgaUKiKM3d4IFaNfeS8bwXofk9fguJ79IQxGeJNutqRHeASma6JW8CmAuDMe?=
 =?us-ascii?Q?XJFagNGFCbxQqwm5hwWUgbtV8XO5kBew5e9T6L1SIh2UlyPlgC3LWIrtANkh?=
 =?us-ascii?Q?u9pqqe5nAAMvQGV3MlnDAUotE05HWyJIgxMDavaLYpILIvEa87E7fCqrp1/R?=
 =?us-ascii?Q?P4Ysvd103MS4wfc6qP9H/FY9+XgStk9y5O7whhGTJPjHPesqbqcyRGfKCcYD?=
 =?us-ascii?Q?QBCXRyaKaM0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XAKycVI0ENwZ6NR9NBoSiesp5J5mnwUXBJ02UXtRMarJDwHMWvpsO9woDEkl?=
 =?us-ascii?Q?cM5WAPVtXi89mS9p2Eb8AX9T2bxFXDLYQlEyWIq9t6CXMc9+TuRdX9TjhT8v?=
 =?us-ascii?Q?R6gacNcflqdsJ3mcsgbYaZ8SNQ9iBOcwn5srwwZ4KpoU/tABvr4PI1BNr5Rx?=
 =?us-ascii?Q?4vj6OBxAwSomjReol73cGAV63d3Iyul9syro3JnoGxDICfINVUqdBqckGpcK?=
 =?us-ascii?Q?WTsmTvnhZoWRa8PQ0ejji7AqckAWM1Cifgw2pON3H4ILzsiq2Sc5IN+qZFW/?=
 =?us-ascii?Q?CgRDzxhQhFxXiX+HtDF2TDlHrC6uuoZ89bScFzfb3plZKsTQFhXz+6moFaBh?=
 =?us-ascii?Q?uT+LZQO4nY9O46vSxkkmNZf6ztQTPRGFhaLXjIOCx8xbCGdDKgYsX99folSl?=
 =?us-ascii?Q?PWD9Rs5AkMELLpJE9XO9sZNkukNtjESzZ+N8vyqfZmJz+A/ZsDfy2u6ccCjf?=
 =?us-ascii?Q?rJlgEGU4xW3gB+HhkvmMoNb5K2Z7Zex6lhV0lsEsGvPAbo8mgML8RzmOOFt2?=
 =?us-ascii?Q?dsYFxhAjE903uE9tBMxob0IEk082kflHdsxRNGa6lmVRidA8sU2KkPUW89hQ?=
 =?us-ascii?Q?aeNJNVSAUFNt67k6G3B2EwypbdfvpzZogOhNnK0WIfWtcJ/rtK/EGj/ropIh?=
 =?us-ascii?Q?VRAx3dLQHsbfP3F55Kmgu0W46IQ2iSbA6ydlYvHTKbPRhck/SDT9ZLaumo1D?=
 =?us-ascii?Q?k/HqiXPXnP3OKHUdL+uEXEWRPg4uf/elgmhs2E0mnQ6yVBPR5mJxL0lFU+aY?=
 =?us-ascii?Q?CHFiQtVhZbrV11eQDhobGunwH+IMUxaqxgYM/oZG71MZGpluTKp1wuNqIdCm?=
 =?us-ascii?Q?PXe51yuNXD3YJo4w0qYqwobDedfNQJuTNzKkzZq5whz+aEyErUqaAfXHAc+0?=
 =?us-ascii?Q?J7lF4wD1ItTCpc34pEuTutI5vKQmkziwXXWOvgfMjKcTCmFAV1vgFmaBJI8I?=
 =?us-ascii?Q?Mgoou4oXk0GoIgDMzdyHSFxsl4ojbFc9GPZxFd0V+62wIl8lFUxrdM8wNCti?=
 =?us-ascii?Q?70zzBbCx8XZjprs1P2Am3D+RhHFxi/t1VKaQvVA0n6wqVveYe7d0hXeJ48QW?=
 =?us-ascii?Q?159ov4t6KB5CSAH4J4EpxkVKXeQd9/vpPwgDO8MMFyx7VDXXwrV/NpatcAcN?=
 =?us-ascii?Q?lbXP2r8qk1CsC+n/CFKKGMYgzulrbudysZf3095Vw2eWU1HJe92JCNIMcXDz?=
 =?us-ascii?Q?Xax4f0jUIye3XHQegifPoPfJA8sJS1BKkZSXV0V2u7HbYBAp83qBoaawi9Li?=
 =?us-ascii?Q?wf2BKOu0oSeGFejmrtV5MabGkdbyATqCWkvJe7qRzzp5dJAxgI2XMWbd98ED?=
 =?us-ascii?Q?d9Ki9GOP5buAUV1wXk0usRvnhJojKY8Mj2UJ0H/KKj4DynRXjjgv5/yuHLbN?=
 =?us-ascii?Q?0N+Sb6NPXAQm+U5Jh18/tRp4ATx4d5NtponvYS4V5VXHfl5zyCzDIl75hqwR?=
 =?us-ascii?Q?wicWKUCjtyYlb+GIfRERmdLttFnEO1TwiKOa/kt9+8/1gw31J2XtiuYmw6Wy?=
 =?us-ascii?Q?eKt6lYfmDpQdw+mF/qOFg1buWIFxkJV/AcCiIAUsEnjGFdrAxnPqVkY9PPIX?=
 =?us-ascii?Q?rRD0JD+u7SZG1wv+BOjdum0ZPXFIPTvh1OFa8rl1?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	q06M+5TdFMvrAaXLtIS04m4c1yuSxhGQ5g/woAdwtZr122dUhyCJSYhFQnUcV4DwbrPXnt1xvsAGftI/mAMRTA9kVIFEa8eketmGYXv9jBxjT/F03Vb60OLDYtThGWcs5W3GaXtbD06ZZQjKKtW8WDx3O1UHaIs/T4oDziAqN7YqjrYrMZcIFbqyiclVGQHeI+rHZsRkI20lbCT0FrTqABy0AiNVlD3o4SI1BP/91C96boPCZzEhN+vcwchRD1yEhSqub81X5Y/EbtwCOGIeGnEMHyChwM5J9HSNKtUZS5fRaDpiweyaSLzugf/BRW6q0PheTc6rcUAuMTlOI+VKXPiu6EkBA+jjAtzHcMY7P197L/hlWyidoZS3ASAkM1KDp1JzZz4jstE3DbUQxBItRdP/zaUA0Gdwfrn/GbGRDPNgPdz+MCB5ZiLv/+9TS4+Z35c7dCzyc3tSv0IWWQAvh0AU7w1w4E/45EcevWFhs/dirkEm6wDpc+z7B66TPnU/3iUK86llENGDBkzC+y52JZNBu52yxb1EFL7FFUPN6Q4GdQozwB5NtYD06wdQ6yGaCAK50vh2p3SSRr1KL4llFhemgUTqc0avLL9b5BtT08A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1307c9a0-709e-444b-3f7b-08dd93c78c2b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 15:45:41.7767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M1z9M1EwCPazF1OKjgmANeXTmnVPLpXTcj/LCOM+Rg/tsCgTvHZtalcq456tCdlTnczXV+gWPNU9ds79DKCThA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4783
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 mlxlogscore=736 phishscore=0 bulkscore=0 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505070000 definitions=main-2505150156
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NiBTYWx0ZWRfX0zzjyuKR+5qX 69GnDIrUKjYuI9NCD2nxagPVQTi3zyrrd/1W1uLAFJsbKoHAQS9+dN1e5ZVQqyrZM5SzSObYwUm CtsBf3H5OGMpjKT8IflKvoGyg7l1iTWoUazLS+DEKfANb6vq9Zjt687evs8gShDodX0XtrdnU/C
 Zro8yMiij7ZkQVo8P6Fk4XT5vXkRKuxIJ5d9TZdiBaZptzavqZHCVbgYrd48/6EdzbjNHNlI1Lj LwP+TRi84890gPyZCe11szrthKXe1mPpt7kiBjj6VaI2nnkewN39PTLVq0vBvgHw5bq+0r20fmg 07Pv/0gCoPwzSRy3FcAcVcZQW7KWN0KEHTlcp59RUckHGa3l75zcPPlb2Fjk/5MnvYKij4iY+Yr
 jIBuO5JzoekwVpPvFhHqn8kdP751JDnH85YwyBkstfsOr2mPSLAGdqLgm1Ct5rjsxjQSiwlA
X-Authority-Analysis: v=2.4 cv=Y+b4sgeN c=1 sm=1 tr=0 ts=68260c29 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=Kv_4dIsssirVP7x-D8oA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14694
X-Proofpoint-GUID: UxQ94wNY7AxiIo9yfWz3RgnPu-2ooUg6
X-Proofpoint-ORIG-GUID: UxQ94wNY7AxiIo9yfWz3RgnPu-2ooUg6

* David Hildenbrand <david@redhat.com> [250515 10:44]:
> On 15.05.25 16:40, Lorenzo Stoakes wrote:
> > Overall I feel this series should _DEFINITELY_ be an RFC. This is pretty
> > outlandish stuff and needs discussion.
> > 
> > You're basically making it so /sys/kernel/mm/transparent_hugepage/enabled =
> > never is completely ignored and overridden.
> 
> I thought I made it very clear during earlier discussions that never means
> never.

I also thought so, but the comments later made here [1] seem to
contradict that?

It seems "never" means "default_no" and not actually "never"?

Maybe the global/system toggles need to affect the state of each other?
That is, if /sys/kernel/mm/transparent_hugepage/enabled is never and you
set /sys/kernel/mm/transparent_hugepage/hugepages-2048kB/enabled to
madvise, it should not leave /sys/kernel/mm/transparent_hugepage/enabled
as never.

I just don't see "never" as the shutoff of the feature that I would
expect if it is overwritten by another enabled setting?

Obviously the need exists for a usecase of thp setting being inherited
as this is the 3rd(?) attempt at it.

We have control groups for resource control.  We have decided THP is not
a resource but a policy (right?) and policies don't belong in control
groups.

I'm fine with this, btw.  I just do see the similarities in the
inheritance above and the control group layout.  Also, the cgroups name
doesn't exactly limit the control to resources.

I agree with Lorenzo that discussion is needed because navigating what
we have now is difficult to understand and it's going to be difficult to
make any additions understandable.

Thanks,
Liam

[1]. https://lore.kernel.org/all/97702ff0-fc50-4779-bfa8-83dc42352db1@redhat.com/
