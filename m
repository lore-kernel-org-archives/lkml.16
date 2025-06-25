Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643EE800
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 12:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750853707; cv=fail; b=lD8FJNCj9P00AttOXSFylqnQ/dlCWguwN++XUoZd8a48mvJ2MkzgglgjdPvx9u2gRWNKhWdLn7SEAXTxdlf+rhvslvCn4+8P7MVysFWlZHGHJFSZpFcAfGUTW9n5x7y/0n0yhbEoPvrNl+yV0P0IHhCWaicDr06x5s8MiFq+cK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750853707; c=relaxed/simple;
	bh=o43edHWuE8QpbPNcLUHtyyZRdJ3VcYioH7E6GNDLSeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sbY+PSQ6uaMrDgUkSdWtgUlqcmxVOs1FhGkkqL+qMS7jDsyVHX5o0WMhlGsgOaNpSm1NtUCTYaQrwnPjh4oTTCLEH0QHu5kdYkkHxY8w3EoZxvyIx7W5isIxfqXvzbR5UJbx7uG04vs533q8Wa/ng7mWrL5l0gNTprIABlps0Ho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YkO/GZkc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Cqn1iEjK; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YkO/GZkc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Cqn1iEjK"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAqPRL012951;
	Wed, 25 Jun 2025 12:14:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=/dFKEpP++eoTgZQZEi
	BagDaoW0S9oMy5hQUVN5hdTns=; b=YkO/GZkcqz4yQg7Vzj86xdquT1Pg+EKrkc
	6nEZOtoWccHl5E3/VqEY/ATUMx1laBHX1FHKdW5w1p4dvVcb50K7rpuTMJxW0Poi
	p2wQGFR1HeGl0SnWVkhZi4UGF+8OsaI7PuSwmpN5rJbDyGQdZUDgAASkR2SFnSLu
	NrNOgxnapccmHmJRMmiQB9fEJfE4AHy8O88/COzxTZwFDmpW8gPZH/BvU8dD9xcZ
	Ho+zdhyfyHEaw6ZcQA3lzvk4BRysFcoMtTD6wKwq2l5pMxRPEz19lKYh7Qov+CdR
	YQz9Ek5XBDI1PrTFZIvGyBjq2ypyY4mA6B0Qe3ot1Z8SfwsO39PA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egt7e6tn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 12:14:47 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55PB4C8T034640;
	Wed, 25 Jun 2025 12:14:47 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2077.outbound.protection.outlook.com [40.107.95.77])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehprg7ce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 12:14:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cbFeO8/ZYalYl5mwQ0QMsXabFSYAb0dbYW+QVbbDpZ8syLswU+k8egd9A+AiEZ/f6g9vHX5J/SIE/zK1z48eNquwavj0ZVT96rZGumgQqS0xItzjs68YA0TtJPcJvfa4PrFSjYRCs6DAG3fckARpOy7TvWc4GZF8xN7+ECmNwUscyLYsvySBROvDpiamLDIu5QqQDB6URe96c/joEHy7PdHBpBNseHVftpABPd6FnQMH7ILa9ZR1LbTqnvs5cCsGZoMRsGCknLYKEXr+m3Q/116xSdSaCNi255wr8yO5d9InuYR2aH0n8k3I02tse/3hnwnzIb4so3Df6BtNa7LcVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/dFKEpP++eoTgZQZEiBagDaoW0S9oMy5hQUVN5hdTns=;
 b=Otb3wHEpCw77I4ZNH/2B1VjpId6cFFGMnAKnpgwd3r5Em6ZXXMHQwF/vwKvREALJyzu0AD0LYWHFURc8F3WY0t1dBFlBu8IGVtxtd9pIEUudbF8xvNZvie+ufcp3yg+mSL7fSwk8s2btzOcmfXDJgRcq5gedkhpAuB1XMYZMtGRGdfdcVP1PUUM6cBRzWm5KqXF554mxPz4PcCDKOK43k6smlEUtnoF0C4yAWARPkuZkyqSPkGn4NGjEEjPzcCeK/CTCNetyk6anPp7lGHaAILkTTiK03s9b7TzTdFTo9BRFdHLuEC5frh0rG2KNZlpdUbCfd6t9OSbSMp70Xz7nkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/dFKEpP++eoTgZQZEiBagDaoW0S9oMy5hQUVN5hdTns=;
 b=Cqn1iEjK67gfaCZTgDCyXJ9E/IXGy7mj8ydCgz4WsVVwPVqxGoqmnqaerQC5KNQjsAL7hrIfZH6Rr0TZHac3a+asqfTp10sxcDjDvz9bGSBOqp0Gva+xVROpA/+AsgEnjL6UIydc3U/BjyFkZoj/l5KJBTVAkfEbI1UTyybC+eQ=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH0PR10MB4440.namprd10.prod.outlook.com (2603:10b6:510:35::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 25 Jun
 2025 12:14:44 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 12:14:44 +0000
Date: Wed, 25 Jun 2025 13:14:42 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com,
        baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, baohua@kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] khugepaged: Optimize
 __collapse_huge_page_copy_succeeded() by PTE batching
Message-ID: <f350b114-c932-4516-98f6-caf3599208f8@lucifer.local>
References: <20250625055806.82645-1-dev.jain@arm.com>
 <20250625055806.82645-2-dev.jain@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625055806.82645-2-dev.jain@arm.com>
X-ClientProxiedBy: LO4P265CA0179.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::7) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH0PR10MB4440:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b6dfe4f-2658-4525-cc20-08ddb3e1deb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pSCUfkjDwCUSbL7ct5GSF75wcYeHPBOkR33A62NpAXxjUzwvqAwxozJVorsP?=
 =?us-ascii?Q?Wh5YIrujgPmfwj1LbxRBFtCMb6csAGlgeBRcvUh98LgjR+3aR7+oK1S4FSuC?=
 =?us-ascii?Q?p2h3XgYRy2uIVFDLVHVkctT8JNjXQk6gSkuQ3QUrXwyQr7Apg19BBleu62ZK?=
 =?us-ascii?Q?O/6KnwvrCoGLxnsyjvjci5R+UvtP5MIdOxJBKRjIf7ndrPn4TDEdh08E7reU?=
 =?us-ascii?Q?aTGpaCc+7EkkwZotCS0v/m7+3LR42eB655gOWVBogPjOZep9TAZOk/M8MdUu?=
 =?us-ascii?Q?x82vfhQUs5evBVe11SQOF/vOHZDBYEizYrqZXdnQoHHB2mjCKacxAie+yLOj?=
 =?us-ascii?Q?KX4tEwYZRhlpSq7xR4RliVpFJDqwGt8JmseARbMM5rQ9rPXI1KQUjUejHVUQ?=
 =?us-ascii?Q?3X/WFp5FfTcTOf5fA7Ka1nUkxJln1A7Sv6vBD34qWCBxJ362POE2WARYFjfz?=
 =?us-ascii?Q?i961daoyppbgHgB5US/LGiUKvPgblxEZbhUr9EBplLzuQyeQE1/HAeczhlhy?=
 =?us-ascii?Q?NfXCGFaW+8tvyPqc8AbK4fLzM7j/vpWcEeQNtlyIYQOn9aOA2TZWOFXx8DZn?=
 =?us-ascii?Q?8YXvaSL+zxWcg6bnGoSJBWzCE9Arqc22n7c9GI9fOQrDVwaiwv1m+Ei2hh2A?=
 =?us-ascii?Q?0gpyNEugdQDbHzY6tRAWJHR/YJNygfyseQ1E9GA9zxANj0Sw/3/RDexDPoIq?=
 =?us-ascii?Q?/gFRlmuKVaVZ7lHDZ9TJakUMra8srjIIV/eQlUG8VTSZDUa+rTURIVBMfgFH?=
 =?us-ascii?Q?Z08x4INz2KeXSaxi4AljvIpG5CP39mevUENgF3jXEWlRzcjIdPEE9f8TqoiY?=
 =?us-ascii?Q?LQNa7eIVWU1X2upk3E1MphCUUH2L+/41qnX4HD6utezWy2t8IhNrPlb9yb+h?=
 =?us-ascii?Q?rnB4i/W8F23G/FYT0ZXbAQhBz+f2jVsmaif5gfA0v87TH86aevJ2t8yVAucH?=
 =?us-ascii?Q?7LhYZh+Lsc43ucY+Pv5tQtdCc7w4tUYut/n8dNZiK5IehchK1Yb7P2vAspfV?=
 =?us-ascii?Q?pnue/0x8TpmNL1npcfweMDo1SPruTAJSXgU6W91DLpV0GSBziLG5Q7e/hQCD?=
 =?us-ascii?Q?4S9edgYUYfOrcqdDnp98DiPGILaQpIyZcMhHl9eBpRYPJzYTkpdd7wRqIayx?=
 =?us-ascii?Q?P7cqNjnsPojbsr3yC3AzhvZoU6JsSFaBmW9Ruko01M2OYMmYvAPD0DgmMzZo?=
 =?us-ascii?Q?ussNcpPTSX6Sf6L66UIQ3LuEzX1raokgaB4jB2pTmaClAx9WjnibZdSxtE4M?=
 =?us-ascii?Q?Jmm8vcOoun4LnvFX3dshYzKoN5o6ZZmblb223bwXYOpxlEtoZUpniVCiEUek?=
 =?us-ascii?Q?9KMRzi8wpIwaw7hUNpUWr+7mIH5JhLKBTOEwkOThH1pcMlKdmW411gEhnCHX?=
 =?us-ascii?Q?5ljhHh8jywRKrOwYJ97EVOsjEpV2nuAAimJsgme/PaZ0Ag5vz/7qijnWMvYY?=
 =?us-ascii?Q?RP7rbfqiwZo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LSifj2lobdXT/oXYd5HOSYsq3KRFBDEwmoyctxgPeMKB4L75AeEGT99xIcUz?=
 =?us-ascii?Q?euPcf+702VFPBMaOPw3rxpAjTFmDsgCLfdYXF17HKZMselDmVuwaGpyESLWY?=
 =?us-ascii?Q?DgGx26ovpNK+Xmq259OQW9Pi5bt2gQTmkK5bsQ4uMMFOtVxi0T5XYnKdVm3R?=
 =?us-ascii?Q?gU4l2peC1hmGAK/Fl4K190Lq/x0d0rhwNtSRTIaoirAyf09+JX7MexD3B7gr?=
 =?us-ascii?Q?FlCfyL3pP4Oq2PUqZuagxP1LP2+mVdwOzDB7viyfk4Puwx9gpoiXntsowBE4?=
 =?us-ascii?Q?eZzV8oSBlzvc9Ahz/eo3FA+GAcm3bZAbqnpb8hV1m2UXQ3RAis4dwOSXWcup?=
 =?us-ascii?Q?EGl94Vg2YJAyrgLN/1IbrAmX79qwWNqL8QnWApmf/AFzlJzZsCYLPXl6pjg7?=
 =?us-ascii?Q?VAJvYB8ZjuDq2sPf/V6vCUNU7CeUvPhTM6CGf82Jfs3R+r7PHXN3N3mnaNFr?=
 =?us-ascii?Q?QBHHB5+9Z3kAfw0/MD09gpq61/AnJXI99g8OUT170/Lf0M3nUolaUSSo8mG2?=
 =?us-ascii?Q?tdJkP9VzFBYWep9BcEzg568TtCr05EqSZ0CzLiWZdMYkr4ncAGBIJCATheJl?=
 =?us-ascii?Q?D10JTZpvoDSoOHV/7HAgoqVsIV6c7B8gLtoJht3G51sO7D0O11lQUp81p06V?=
 =?us-ascii?Q?1heFZ9HPELQOwJzEzGxue5yaa8OCmNPT8L1GKN1RDkAI/xqm8vGNlmvDA+TS?=
 =?us-ascii?Q?emN/EYsFei9hckbc00+ujnN1rOMXIrPAGNoyk0q14PCGn9JtY7wJ5+l53NuO?=
 =?us-ascii?Q?+QXZAxlsLX5z5PYehFNGSiBUgkNfgGWRjjWZqhwSB5T/IPVhDyJgK9zPfJnd?=
 =?us-ascii?Q?FUsAhOFUamjE9NhSDhe97NUM84n8Ajt/fgndBwhBdUj7D6FkwLLXFEIbpNtb?=
 =?us-ascii?Q?QJz+d3c9K956OUzJYpavKXKVltKheGzjSm1veWVZzjwOX3KmWA3OFtYm9kS6?=
 =?us-ascii?Q?sUPZ3hklBDxQ6+McfkeDtkz5FO76EuTl5IAddnETC+3JfdfJNtCO4QTqVHaz?=
 =?us-ascii?Q?5esbHgBZElwsMC+Bb2LgUbQ7Pru7pxHoSZQdsvGp7Oz6jv8ZFISYtgKbu0XO?=
 =?us-ascii?Q?Z3yzbLzc2pbZZyDvwuRAkhzZM9QV+paKt1CKdR4ZI9d6w76RtB1M71bNmJ5S?=
 =?us-ascii?Q?WjQfXYV/CFJo79heZmgjBTRllyEhpNfmi64aPVc89MfadRcKPkE53GwpKygi?=
 =?us-ascii?Q?/d5H9ZMfgknYAv7AHdy2HPRau6xT45pVLbr8GnZ9s5OMnFY1Qc1J46EXAiKT?=
 =?us-ascii?Q?odZwKGDhGx/nIAvJW0YA7uBFKJ/xDSOo+HpZ2YuTqpJqzUOEMDUxyvhIplk2?=
 =?us-ascii?Q?2BczQeWk0sU1p8k2dN7hgA/y6xCku5SwGNlLUPffVxAQVYoRVhx/puPiyd70?=
 =?us-ascii?Q?0+BqEHELSbx4mPz8zN4lsagEofzcbo9hp/F6DwlXdaEcauxcxGt/9RZBjPrv?=
 =?us-ascii?Q?ya/fKvDO5NQGiOBiSocGe8jLCfoVOLAvEP0oGmOqvfoco3DfXSrSdZcUdWY+?=
 =?us-ascii?Q?cZwSlUuHDj4/Tx0Nw0JA5dwNaemprVcoL9ybKBF7tg2aYuxvhGQqMsqtRkp9?=
 =?us-ascii?Q?fxAYF7ml0ucNe7CmuNeKsYHHJbDC2DNcsUhmjvC350OPG5sUnftxKf4WJuVq?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/n9MJiHjUwrzLVIEyyU+mHjFb6S8I74vFh/e1XDy1AhRe2HQ6nbGtlXazNDLHhGL7xb31HRtj56wuMHAt1AebALy+NccLi1q5mGQPnL3m7z8WuCTVGwu6wTKttL9178mcHqpjfuBdymBKM+ceoQHYFaY6AvfeOpGnUDzshqJXIab8dQWYFHDR4sHdLOAkhC5hROVqZeiES5iC/nz54NNSObBn1WfuC6KvCcsGD2eeMBz1XlgfFqO4cSrU8XJ7+QVPTuEGVitD7OXfUDTKmTot4oSNcWl2mBnfEST0mdfcVIS7CH9FFEpABgqH4qMw/IYyK2tDepCx9EvUKjWtvGxsbK0RjXpqZslVRtrrDA7iEdk+1etdJjwPxGEQQceZ7TdoaIT/x5NEjt3/7bnBN8xALA1xvOEWe8fuJ++qqWAEnP47yl23yq035p2pH4/ej2RxiTIFmS2W+jvmSXQqpt/zuLUGH8Lv+ms6Y3WlQWAOU5W+r4yZ8EyWtHh1hYTLPF/DClBT7UYWw3v0Rwvh9d5N5crJ/aPjINbcW95pQvfwHcs5S5YXkJGF6Og+0JqPbSeiXLrxNUa2o6Sike2s8Nlq3FNLllfqtPWBZI9b2HvfEs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b6dfe4f-2658-4525-cc20-08ddb3e1deb6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 12:14:44.2804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sNk8GZUjA2ACcBHw0esrGRraCDMp7sI2hSiZrglgSio1tOn3dMdtZFXsSOZxj8t2MLQD/asTan09mkF6B+CgbnhjIHQlvqNqIv0JGV3w0f4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4440
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506250091
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA5MCBTYWx0ZWRfX2T3WiZJVc44+ KPZuWQlyDNecp95kXIB3fkliEvDRQGTS0sqUji3IFiXYlXmiRiMn/rte8+Xoz17qRAcYhDuEbzw ohzg5X6RQP5pccCl3YDtHaL9aY7LDakDD7WljQzVXdlNHcV9+1DZ1nh+fQGNskJvBNyTXCQcZE/
 ZJ2gGg+YBiI9qJr2XIb+1ihdn6/QRPqxQ2PwvRlaGh0614P5fmPnIzih59bS00uWWtIX4sT7u8y rE3otuEn3BIIBHuZcamsq1ST/YsY+/45ULSNISxoNfWQz3PLYYcIYAiAsU4ZkMyAHIK8BjtsICH 8dVIGniTuZRRorsSR379Fz6HH1njaD6WLI5kHZQuTW+2J5YeWAGgiCzrV4YSHsLFINIwnv8iQ2g
 KacPndBHkHW0hsh8VmGXxe9tc0R8fgfFUusjKRXYqgGh97EGt+PWwqcg9svaM+vdVU6EGax7
X-Proofpoint-GUID: 3NL1MSu6uA9daR3l5MbWnktxQ6MQvAwN
X-Authority-Analysis: v=2.4 cv=QNpoRhLL c=1 sm=1 tr=0 ts=685be838 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=upFldcBJ65eVWYA3pEcA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 3NL1MSu6uA9daR3l5MbWnktxQ6MQvAwN

You forgot the v2 here :) this breaks b4 shazam...

I managed to do this on the cover letter (but not patches) of a series
before. So you're in good company... ;)

On Wed, Jun 25, 2025 at 11:28:04AM +0530, Dev Jain wrote:
> Use PTE batching to optimize __collapse_huge_page_copy_succeeded().
>
> On arm64, suppose khugepaged is scanning a pte-mapped 2MB THP for collapse.
> Then, calling ptep_clear() for every pte will cause a TLB flush for every
> contpte block. Instead, clear_full_ptes() does a
> contpte_try_unfold_partial() which will flush the TLB only for the (if any)
> starting and ending contpte block, if they partially overlap with the range
> khugepaged is looking at.
>
> For all arches, there should be a benefit due to batching atomic operations
> on mapcounts due to folio_remove_rmap_ptes().
>
> No issues were observed with mm-selftests.
>
> Signed-off-by: Dev Jain <dev.jain@arm.com>

Overall looking way way better! Just some nits below.

> ---
>  mm/khugepaged.c | 27 +++++++++++++++++++++------
>  1 file changed, 21 insertions(+), 6 deletions(-)
>
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index d45d08b521f6..3944b112d452 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -700,12 +700,15 @@ static void __collapse_huge_page_copy_succeeded(pte_t *pte,
>  						spinlock_t *ptl,
>  						struct list_head *compound_pagelist)
>  {
> +	unsigned long end = address + HPAGE_PMD_SIZE;
>  	struct folio *src, *tmp;
> -	pte_t *_pte;
>  	pte_t pteval;
> +	pte_t *_pte;
> +	int nr_ptes;
>
> -	for (_pte = pte; _pte < pte + HPAGE_PMD_NR;
> -	     _pte++, address += PAGE_SIZE) {
> +	for (_pte = pte; _pte < pte + HPAGE_PMD_NR; _pte += nr_ptes,
> +	     address += nr_ptes * PAGE_SIZE) {

Thanks this is much better.

> +		nr_ptes = 1;
>  		pteval = ptep_get(_pte);
>  		if (pte_none(pteval) || is_zero_pfn(pte_pfn(pteval))) {
>  			add_mm_counter(vma->vm_mm, MM_ANONPAGES, 1);
> @@ -719,21 +722,33 @@ static void __collapse_huge_page_copy_succeeded(pte_t *pte,
>  				ksm_might_unmap_zero_page(vma->vm_mm, pteval);
>  			}
>  		} else {
> +			const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> +			int max_nr_ptes;
> +
>  			struct page *src_page = pte_page(pteval);
>
>  			src = page_folio(src_page);
>  			if (!folio_test_large(src))
>  				release_pte_folio(src);
> +
> +			max_nr_ptes = (end - address) >> PAGE_SHIFT;
> +			if (folio_test_large(src))
> +				nr_ptes = folio_pte_batch(src, address, _pte,
> +							  pteval, max_nr_ptes,
> +							  flags, NULL, NULL, NULL);

Nit, but we only use max_nr_ptes here so could declare and set here, e.g.:

			if (folio_test_large(src)) {
				int max_nr_ptes = (end - address) >> PAGE_SHIFT;

				nr_ptes = folio_pte_batch(src, address, _pte,
							  pteval, max_nr_ptes,
							  flags, NULL, NULL, NULL);
			}

BTW I think David raised it, but is there a way to wrap folio_pte_batch() to not
have to NULL, NULL, NULL here? :)


oh and if we do this, we can also combine this line with above so:

			if (folio_test_large(src)) {
				int max_nr_ptes = (end - address) >> PAGE_SHIFT;

				nr_ptes = folio_pte_batch(src, address, _pte,
							  pteval, max_nr_ptes,
							  flags, NULL, NULL, NULL);
			} else {
  				release_pte_folio(src);
			}

Which is neater.

> +
>  			/*
>  			 * ptl mostly unnecessary, but preempt has to
>  			 * be disabled to update the per-cpu stats
>  			 * inside folio_remove_rmap_pte().
>  			 */
>  			spin_lock(ptl);
> -			ptep_clear(vma->vm_mm, address, _pte);
> -			folio_remove_rmap_pte(src, src_page, vma);
> +			clear_full_ptes(vma->vm_mm, address, _pte, nr_ptes,
> +					/* full = */ false);
> +			folio_remove_rmap_ptes(src, src_page, nr_ptes, vma);
>  			spin_unlock(ptl);
> -			free_folio_and_swap_cache(src);
> +			free_swap_cache(src);
> +			folio_put_refs(src, nr_ptes);
>  		}
>  	}
>
> --
> 2.30.2
>
