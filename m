Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F5D27BF9E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745499002; cv=fail; b=ZgGyHhKTD4uQaGsGWZF6ytS5NbarfJUSSqHYqMiuNR9V/rRX4rN/HUNaOiB+tPc1yWQ5EgMF5X0nD9v9R68UToGRCkN05walHOWZogL0R3UGX8+d4IyYtfGfA0rjM/8NdiD5y2jlnwIC+fWJ5KXvBDhTnabH/W7yE2kGOzPFfJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745499002; c=relaxed/simple;
	bh=NM5C9sc+1VjdE2b89bIdmI8ho6VgnANNdEFbx/Nkh5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NRuOSFIRM82oeOPE07m65SkVuw5ffl+nGuHUiKxWg1nbUi6jrq5fXt7DD9Izk5Rvsb6PPfiuvrS75kr8G9Dv23NdOO4H5ycNTl8VgOmSvLcSWHzFRpADch7CfAzTE+IclcThNpKRab5iLeYMHUtyq5qkTg4vVHW+x1BlR+rJOHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EimuEY+3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=y1PtpJax; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EimuEY+3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="y1PtpJax"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OCMr38024649;
	Thu, 24 Apr 2025 12:49:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=NM5C9sc+1VjdE2b89b
	IdmI8ho6VgnANNdEFbx/Nkh5w=; b=EimuEY+3SpTqRrqLGS/dzjeqOe8v8AP6Fp
	EMDzlVfrYQdc/4zD84/bObpsQa+nYfSmr9QlnIoZh1Zqw8XhGqSCMHvZ9YRQ6CfE
	KGzAqZ2pB1WDg3IyLcnM+H6YbNZqnGmUbFhlQP41iyrVnm+DME1igLqJBN7z9QDn
	7oT+w8Dfm/hZu0yfKfkU0E7+XO6YW0U8ZpZJ0dvXSP37dRUFpnF0RPZxxPrOiIG4
	NYdGuoquZFXyuhvAmFeNpo9GEBmm+drCZAcMB+X5Q/JrZkuAcxW3I8ZNSvGEptsX
	74vQsVFQgs+446iZj4OJeP/LNjNqFV8oVwHguL3XbVtZTgNrxTNQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 467n85847m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Apr 2025 12:49:09 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53OB95Gd031677;
	Thu, 24 Apr 2025 12:49:08 GMT
Received: from sj2pr03cu002.outbound.protection.outlook.com (mail-westusazlp17013074.outbound.protection.outlook.com [40.93.1.74])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 467gfrar2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Apr 2025 12:49:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OdaxqBBQ/t0JrYmu7drn2LbUZmJqsYxciKQECJBtAm6jvrMc1lSQgYFvAQT2LnBJpSnCEAy/pOsPO9FXewRESFL6FCQIOhB54CUhfLqBl+PIvEDajO3BPVrIiwlhYD2tcL6QVHNBefXDP3IQmb5fUkVjZzMCY/xKUdLCDS1jx6sgQ/2bhmaMl40y346EjZCSFcNreT937GiWqztY02IwcnlQHTvd4Tt9TBO0Xc9U/mrGX5R4UTCZ4EZKAhgye89BKYaBEsyI3O+YKZ8cPyQJLekM62NmeaElvPel7+YKTBWKckXbqyG0ZPSd1YcnIlCGPt/vx4/+9kuTfiEYPYVK9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NM5C9sc+1VjdE2b89bIdmI8ho6VgnANNdEFbx/Nkh5w=;
 b=cJbvxPG9hezTdvutlMNJn9XXJ2FiB+EpYnWW/9amwWRspLk8dCTcwSI8fVlddVeQ2Z6iyIEqXoivrTlgQntwyjtYqaeoYwfCjpMa1wRfuIoPpNjFJHqqSz2F2DDP6sy5umjAdXtB3Rp2jhYaaSrFL91f/dAVqlPmpMUykiJhi9hhDnZpF6CS9k/PLhLV+/8lnzUYnJl1mGYmmSDtJofyvLuqtAo7vjZEDH9z8EQRVAG8aq1y/xgd8gdni1pvMbLcmlV/r/IoZXOLXMazQUhvzOSxqDAUimGz+4mGT3ZOIQs23427fE0/M98a+KdobJeHboJF6C1LvcbCP3aeq6f/Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NM5C9sc+1VjdE2b89bIdmI8ho6VgnANNdEFbx/Nkh5w=;
 b=y1PtpJaxHussDceWdheSVVd+b3NEuXDryG9i67c32X2+wl/nqvkX3Y5n+yBV54bMU9No6XJH4qVG0Hkwa1KYdV5s/Z8oQUeMIgkHohNK6UV8rCVzrheiDlGdbGQowWs7AbQIZVxYzGjYdi7KKndv4h1Rcr62tz6k3T4zWAolTx8=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH0PR10MB4534.namprd10.prod.outlook.com (2603:10b6:510:30::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Thu, 24 Apr
 2025 12:49:05 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8655.031; Thu, 24 Apr 2025
 12:49:05 +0000
Date: Thu, 24 Apr 2025 13:49:02 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
        Rik van Riel <riel@surriel.com>, "H. Peter Anvin" <hpa@zytor.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v1] kernel/fork: only call untrack_pfn_clear() on VMAs
 duplicated for fork()
Message-ID: <9a9103db-95ca-47d4-921e-42b8368ffcaf@lucifer.local>
References: <20250422144942.2871395-1-david@redhat.com>
 <45b26168-93c9-4170-b7e1-4b51078a04f6@lucifer.local>
 <d3f71458-8c0d-44c9-9a03-868efceee93f@redhat.com>
 <33b972a5-a137-4b5f-846c-614e5f83409f@lucifer.local>
 <0101d903-af59-478d-b0e6-af5ba6619eff@redhat.com>
 <7aeaa30d-3fa6-4edf-82a0-e0c494ef3df8@lucifer.local>
 <9f78fd5e-a785-4473-8c6b-8267821db446@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f78fd5e-a785-4473-8c6b-8267821db446@redhat.com>
X-ClientProxiedBy: LO6P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::8) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH0PR10MB4534:EE_
X-MS-Office365-Filtering-Correlation-Id: c8e5f715-98e5-4b4e-9d75-08dd832e657e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FOSiYmdt6Am4kJ7s8stVIQaK1afKjb0JtzvbJhMXaPV5fjnTbp9BJXYxgqlR?=
 =?us-ascii?Q?HVzDIT4v20RHqmSCxaqvQ9px1F8Z3aNt0fxwWNCvePhC4rH5LP7uZOilDBBE?=
 =?us-ascii?Q?I+jwR2gLXk/0o3UV1J9AXI1YuOaNjrH+HintxPwWLkYwE1CCmlL1+bcUfUwx?=
 =?us-ascii?Q?7o6xCsQ70au9zkYZQaQpIjHhfJu/aNRLdPQl3sHKB0CHuBEAqjnI6IGOIiOS?=
 =?us-ascii?Q?on5cHD8/by7lzpl5FXqQZ313m5WFtM2bjBfEH7wSHhHMQ/oWo10FE1S1BlJz?=
 =?us-ascii?Q?d+Iw0NS6nk8/M0QozJ5KJwL2dIbYQqpIP6iV7aJ5UVs3nyZfabIKSeJBAAYv?=
 =?us-ascii?Q?V4F+jx23ZW70OEZ3H++/1j4l6iLD19AEp40x82/Iuf8wL/OuqXoWzt8gdz3w?=
 =?us-ascii?Q?GCIN1WDV/K671ezQ8YLFApa2tHhj57yjuCMyWjz49tIn0xYupuS1V3G2ILvp?=
 =?us-ascii?Q?VN2K2LEDPDd+Km2hfdtvxCJZPgAyqVjp67LhSpmWWdFO6gNh7iOhCmPSEjWx?=
 =?us-ascii?Q?mR5EPOxz1dGk30Xi0aoIDQRFrrLA0Zsk7CVsJwQ+TiJXve0o0tYWfOKhBnRP?=
 =?us-ascii?Q?tielpleUBOZ95gxuoX0g/XJ/RO/JAjIMsMZsgAFA2lNhZlurxl4+VuNNozj8?=
 =?us-ascii?Q?NcBGYQhwd6GyxjoTFYp9pGdiCzpjAZJ2bPE7CTwElr5DhZJ+E9Rg3qDPzlqb?=
 =?us-ascii?Q?ky0jko30NFyFxYo+UG5/v4ChtFVzs/x25sd5X6LkDSbQE8vYkziiPT5JXdbn?=
 =?us-ascii?Q?DsTLBqVjDk4JLEdKIY7WwY1GKiyCMFQHbTJYFYBLngGgknzh0Wqoas/X1lAw?=
 =?us-ascii?Q?Spb+BsuPVkoO+vz3FJ0+c0oS1qLgTS/H/lFhfR+NTCvmK/rDYhjLrPV1ZP42?=
 =?us-ascii?Q?PEijuaS3ltuQFX66x6MhzbDQ8oXVG4cW27v3tG+dpTs/bPUmVt1LXx5KAnwC?=
 =?us-ascii?Q?C9ycLDBkbZUDesUKlZgEMBNQgrTa3HY8xjAd6gHmE1PPps39GT0STQ/J3S5k?=
 =?us-ascii?Q?SPHWWMmHebVaYB3stUphcg0iSG+/msEUN9xpe0y4HjzRnQbUesaGj8kNeKoP?=
 =?us-ascii?Q?uG7L8nOFHUSjT3dhrdDP5HkOO9+55TIpb5WtC1zteS+ZZnV5aGhGhB69NmJq?=
 =?us-ascii?Q?+btCBvo/GE2q7Jzc/Jz7LSxOWrFAN6jkmpGGwrKtPLsHiP8sM6iqZaSLuKUb?=
 =?us-ascii?Q?CefWjPpFOfXKJvH4WVbxDDWo1nHWeFxDTfkO7/cp7M9iNjxPGV3AUI5dtuhw?=
 =?us-ascii?Q?VcDd7AymX1RykkvrSQsODcfUmw4zwJkiTsA5/v8+Rf3N/VTcT9LMJCxMWaNk?=
 =?us-ascii?Q?HVHkxwT9xgc9AH2yiCwybGSp6Zup11nXrDmSczcDGENSNmzTNL3Q8l1o9sNJ?=
 =?us-ascii?Q?a8FWKwr50rX3qZalxEEfFv7YU5ALjGPCaEGNJ/Nq5wvFSKDdAsJOVGGwij73?=
 =?us-ascii?Q?fs6v4D/WitY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o+BrbmHpqQl321CcaXepe7NwpFsn3JBbDTri8R6LsA+r1eCTV6sZXy79xSYn?=
 =?us-ascii?Q?uHKJgx7RTKcpnAufl5Hx8lWb5EviHV6mxDO7PhvboaCJIOkhbPLsI9noz9Pt?=
 =?us-ascii?Q?6SsJ9lIw87JeUBc7TiTFtG7/w25TJamQppxH2GJAkMkxMDcXlInwJ8cUiMCV?=
 =?us-ascii?Q?2UmqcARp0WKkvk4ekEYhb/UNFozZYYiih8GcGPQy/wMvsXpToZPMrQKikbmH?=
 =?us-ascii?Q?bcJ85oreZDr8TcTXIlTG1M5GVjRXOG4f06qCxTGJRwAAwUrfM+ov3o8yUHO9?=
 =?us-ascii?Q?qTQ5VtE4+8A8QHFshpzuPbWlHYzAVoBaXgDaPBQAbDrZCk7QD2NYiurbGIrL?=
 =?us-ascii?Q?tpyqrXMNF+sVTwMGcR8swGpSnwH0YuVGBDdL5LyZHSU6M+Yn0YOXgd4BiVEL?=
 =?us-ascii?Q?bXXJi42eVs3S54mcNiQOeMaPaDbHpDdy3ahjtCFxD0Vy2pzx6BS0aSMjL5sg?=
 =?us-ascii?Q?EmmCHoFSFC7u2ZqhGEKe1Z4zhE5dpEEcJ6fDQYPk7zqH1qWuMukfRHNer+4C?=
 =?us-ascii?Q?Xx0V4ARM8lhsA0vu8eSQkLVkJAfGZEG3mzVMzipmNagXOp037T2ozFT4O/eN?=
 =?us-ascii?Q?I5FJdfBO0iCdbIdPBQ6QMHT3ct0LoF7iJMhWDDwefAw0ZXlf+GCy2sON6Ad1?=
 =?us-ascii?Q?jQ7p7QqQViBMqA7WOZCLRolX22mBnCOjI0Bmyn0bQRMqB4mf3EBiDFUbfklH?=
 =?us-ascii?Q?WubiUM7kGjIlMbSuuRJOWn9HiuXhnQ3agceG/A1PKVuvCEMQJuQW+P9wvdz5?=
 =?us-ascii?Q?79QYYH2iJNIwpgY40pUq8bO07GoaPvxoOQyzrAHYUkDN7lLP1MaZMY+Mj8Ko?=
 =?us-ascii?Q?KTqY7ClnyfkQltxD6BV/P2k4C1IZeTOI+pLGOAHAMZ8ebh/R5pZFQMuQolbc?=
 =?us-ascii?Q?d7SjpS3I2UOJOWQjaM2P+da4Ux9/8cfNvGYD21q2rU7pz02Mwqdl45uDt5zl?=
 =?us-ascii?Q?HdbRo9TbdYcU6M/hQwZyTOy9+eDY/igY1f8jL+wPe7rOUEAfHX3sBtEz2sgY?=
 =?us-ascii?Q?09wYgigRu2ScSLV518+EDHjLwE7HGX0iIDIeit5bF1yT+WUITSzoIcgn7h8I?=
 =?us-ascii?Q?90Kuk5eczYqMkC0wAsQctEiE4dGo6Rg4REXCw84lsxckDn6lu5R4Cl0aBsu3?=
 =?us-ascii?Q?EzMRc0Gqt2r7QtAMGkRNczN9MkE2LTxKp6yxzb+8sOnSDAGZtev7Jf1Qd+8S?=
 =?us-ascii?Q?RFi0KJuOMJPNN0C7PXE1fCLK4NiTgsprIHPlof+oJ83VmhfKZBnhIVGJowxN?=
 =?us-ascii?Q?HRVX6QsvgRTguEjXlVzcLJ8+2frKLmXu4A5M5vb3SABNFgROtNRwwK3CjB16?=
 =?us-ascii?Q?B64BDbmKc8TgeWoRxcSGVWrA2rkezptkeKJvLJ5Xb6H9QpfSeuSIPZjIvIyp?=
 =?us-ascii?Q?3o8/ZqgQBVvOeoKZb9DfErUl8zFLoHs/0dFWl5VVsoIoh5i3RjHGYLsp8ypq?=
 =?us-ascii?Q?jY/5vQJnxuRxSYnBU7ZXG34UDAhipLqYiCzMxukd1D4wu5FsyvtR9eu35uu/?=
 =?us-ascii?Q?cEq5qS1wCi6bGgZfIrBjopjAG9v0zSUBlHelk2rl8hZP64Yd4pKlpB8Yu+02?=
 =?us-ascii?Q?xofEBU3KMvqlxcis55BByabaYPaYbIuuWhB8lVqlfQAkCATYmkIZlfZyGzHy?=
 =?us-ascii?Q?pQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fk14+XyjLX638ch0n82zm69XwLCCqzIny00/bIBNNVWkhmCwqugFhpHlmTCZ4YUghklx9j3VXiBDDFWO3Q/ng52VbYKALvcaKch8PxLMNkM35Ao23b2ZN+7bNP3okIEpxpBReR/NvS+KOV1cl2bfIxwxoS/4AKUj5SjFxIEQCPbKXKBJUSRgufk44PxOsmp9N03hjuldBJoXVkkGCYWtX1pXGKe5pBXh5OyWVtta3Grs53OijBqu85hVOSBEG7gOG9cKWKyQe7oWUSBqzQcSZwO/KL2dIIj5sVXQs+mQSy2WETv/sDPHyU5G1bIzBtgKtPKXw2vdGaGqo74MbFrVzufKZSyCC+jeD+TSbK9/4MgddHz0aFI9gDqp0+Hyz3IfHBDbs0qnRfDDaxfv/B2qwmX/eYMF5HY1lbhpyPpPHEvrvnYDUQNCQZrPcfIbhCHfUtFKvydgNXnNlkImJ+LkGwR95nMHFQ080f8h51MFPFO3KzoH+0AqWvsWJAyPYvxmBwJ+NumoZtKdEAXy1ex41f2fNpQta4p1P5uZ1Ri7rmQ+45LRK0y2DlNYd317KxObFkWO6WDQgPgX7z5ey0qzR5P7igURio07Uyy2Hy9wohQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8e5f715-98e5-4b4e-9d75-08dd832e657e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 12:49:05.2303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6P0Ti26+6uTGGfn0DCupe6PRmXTfwv47nELJPmzgY+h+UiloKWZjj1cNsVTETFXwfZXpKhvazHE403NlldaC+4ssagOD/0ZH5l+btyKiNWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4534
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_06,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2504240086
X-Proofpoint-GUID: 5OFEm6chfSxFZaf5FxkV7JWSD9XbfTsD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA4NiBTYWx0ZWRfX0USlOjIM5/KK MW+KlVv4CPhALx+KBqO9wWFZTUg4UL6ypYWt3f4zd+sb/CchSVeyKdnqbzxLaOQ4OoyUT7SCMk5 QsTFN/jn5Hbf5IJK7FF/QzXezAncUDCSS8YwhrtGgmhlyp39nDJ7Xw+OBNVQNxoMAecl4Jw5sST
 pXtirrTDyezTb5cyLPSKMa3DNWR+3++MEfg9tgfj7FmhixC6RlWiVpu/4M2A+FzhqS8GId6oreZ mCI1Wzlan5yC3Y2W+eMwhbPZ5Z3etrg6+ks+sRDZZaqA/figQhe6abUVvp0Q/UrcFUufMXuwYJd K8poiOdNcBOOWsDHyS5TM7GuZNi/RrC16Q/gXaLFBN9fzZ1hg3Jkh5subsfKzrVT/kiVKCAkwd5 mTYjr6+O
X-Proofpoint-ORIG-GUID: 5OFEm6chfSxFZaf5FxkV7JWSD9XbfTsD

On Thu, Apr 24, 2025 at 02:33:54PM +0200, David Hildenbrand wrote:
> > >
> > > ... and I think we still have space in vm_area_struct without increasing it
> > > beyond 192 bytes.
> >
> > Hm, so you're thinking of a general field in the VMA? I thought this would
> > belong to the PAT object somehow?
>
> It's glued to a VMA. The only alternative to using a VMA field would be looking it
> up for a VMA, storing it in an xarray etc ... ends up complicating stuff when there
> is no need to right now.

Yeah no, that'd be crazy.

I guess we are stuck with this so need to think of a sensible way forward.

>
> >
> > Though getting rid of VM_PAT would be fantastic...
> >
> > I wonder if a _general_ VMA ref count would be a bit much just for this
> > case.
>
> I don't think it would be helpful for this case. It's much more similar to the anon
> VMA name (that also has its own kref)

Ahh I see, adding a field like this, that makes a lot more sense, obviously
could put behind appropriate CONFIG_ flag.

Given cacheline alignment probably have a bit of wiggle room there to avoid
increasing VMA size also.

>
> >
> > But maybe I misunderstand your approach :) Happy to obviously look and if
> > not like some crazy thing just for PAT (you can understand why I would not
> > like this) will be supportive :>)
>
> This is something quick (well, longer than I wish it would take) that seems to
> work. There are smaller pat-internal cleanups to be had on top of this, and
> the new functions shall be documented.
>
>
> Observe how:
> * We remove VM_PAT and that weird VM flags manipulation + "locked" flag
> * We remove any traces of the nasty tracking handling from mremap+fork code
> * Just like anon_vma_name, it hooks into vm_area_dup()/vm_area_free().
> * We remove the page table lookup via get_pat_info()->... completely
> * We remove the VMA parameter from PAT code completely
> * We reduce the track/untrack/sanitize interface to 3 functions

Yeah this is all lovely!

OK this should hopefully be workable then!
