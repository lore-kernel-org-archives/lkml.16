Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D580233728
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747833253; cv=fail; b=aXT2zuA8+qWonoork5RMthfVCSGd+GI9SsNnaMMDSFPHAx9IGDpdqRBD7ivR2NrcbFTSLjUjCDGnMC9THLAbqO0La+hkMs0br/w2c5CzpgykEtB8OuLJ9ST9qZugnXEogUKDpttXi6DZhws1XtLuqheaxEMvy3kpISoM3sHzpgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747833253; c=relaxed/simple;
	bh=BUbkWq/R9a5Kb52zRoRi5cHRseKOY8b8LOVmcIGi684=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IMN87CaTYWYVPLfrqkM7zUtX4iAmTciE2kkI1UG1h0Bwii2K2s1cjiHzu//mrWmdMGu0rFYmtmcilCGsSApG+In3mzMKq9R5UdPhjndy6kIbMeNqlVDcIaOVL5XMfsY/FRP+6DntNV/KPNMGJxpHhlP8DX1Ff4m7m9XfTGF4Op0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jQmfysMm; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZYUz9SGU; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jQmfysMm";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZYUz9SGU"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LD3VuH027921;
	Wed, 21 May 2025 13:13:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=KUxtGp/27MpnEaYZ/D
	Qo9/WxYoa9aurtqgrZNPjnvyE=; b=jQmfysMmTNl7pMoyMbo8FGqFdvdRIoEA6X
	U0TvoP0kyyHAqzthRaCOH1KFh4A/81RGlMezzZ95M1PRbbau/FSi32vlE7nu9zXz
	tllFZz70L7ZtxrWRJDSf7e1+9VFJcPFWUciIcZFuDWGIVZzfssb7EZ+N6evakVc1
	/0lK27W1l2ktXfLOFtdCzE6MdETc6zSedpLUg6gbhDI8lU+xuzVvkRuefSqS3reA
	FYMtVQ3RwHQWfLA0pn5CPd0d4t/Uca9BliaMg2oct/uCoA/DYJZBGTAnR3f9cg7k
	EdAYLe5mvqHKRWsQ1OYSO2bStRuXkCTvUlJ8Rqqwfrr51lVMHXHg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46sf77g19w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 May 2025 13:13:41 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54LCFupq032202;
	Wed, 21 May 2025 13:13:41 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2070.outbound.protection.outlook.com [40.107.223.70])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46rwembbwd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 May 2025 13:13:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m8ee8h6Ei4VXFu0VShVwyXmvmD/KPUSk+xUYsizb4w+Vz1lw7W1KXTTnsULaWEyE6LxUjHFIVjz5s/UMK0YuCzqfYPEud4sZ7/+BVMYk5DHkwqc0ufnyHHsJ2wVU6MTW7jAgRkvMrgO5hg+L1skrrWf0HSznj+OmXr5V80kaMtdMfu23wkti9HMnDEsqrAb7HUgq3erpm5SXsNgOptBa1lY2eM9TndbGYqbaETNcQ+SaWdlLTJE2/WhNBfcPikEVULp3EHf3Zil8Sl/W88Fxi15MvMnuCkX8r8FmlkTwLyZ2o6DaFcwEq1Xd9D3I1lqVYcS8Qd3WsZi1+m+MeieFZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUxtGp/27MpnEaYZ/DQo9/WxYoa9aurtqgrZNPjnvyE=;
 b=Kxe+nAFsMzlWcif5plPkBYv9sdLAXC41ggImINA5nd5YhizSu+v8j6hD5obBtP5ZXzacdhdZ7YDdd3z+D7e5HIivv0buXcnIoQm/zIC2MV5XE7HvCO8aN3/gjgmM6dMNZmb/VnEiVMEZYmZVX65/3EBL4O7Rd28QCEuEfXxgjIiKOTrxyL/ZlQbdnEIk105uHmdlpdHf7kB4CbZzMVxsAosYyzd28xVKYWOzV3w8EVtvMr177RPm6d/Bi/uOGhfcl8UxCg0fl5Giek4ESNwEyOrXfngA1ZWxA5AvxXp5la5uknSfjKLtzoacEzMIrzKsMiXEaHyRXEaxu0wdi6vwaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUxtGp/27MpnEaYZ/DQo9/WxYoa9aurtqgrZNPjnvyE=;
 b=ZYUz9SGUN078frKovUiOOQI3idvBaSDR3nSex+ByTTpu/vzimEeMW220QkJc8PusXxUiq4oJDi9XBaLz8GYKmUxmrbryR0adC3T8/rws+xZqrWX9lCUQ0+nmrk/DxyiPHHHMTosAnYutMtV6PmGolyN3HZtR7ZaljkMK7/Md7CU=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH0PR10MB4469.namprd10.prod.outlook.com (2603:10b6:510:32::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 13:13:37 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 13:13:36 +0000
Date: Wed, 21 May 2025 14:13:34 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: mhiramat@kernel.org, oleg@redhat.com, peterz@infradead.org,
        akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
        jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, pulehui@huawei.com
Subject: Re: [RFC PATCH] mm/mmap: Fix uprobe anon page be overwritten when
 expanding vma during mremap
Message-ID: <a55fd3c0-cd53-43d9-a200-290d64dcf04f@lucifer.local>
References: <20250521092503.3116340-1-pulehui@huaweicloud.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521092503.3116340-1-pulehui@huaweicloud.com>
X-ClientProxiedBy: LO4P123CA0394.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::21) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH0PR10MB4469:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d6e6f30-9390-49e0-f1fe-08dd98694bbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/5XfyfeieMyv9j+FA0n/yJ5y1vuA9QdeZxRoMuCGCXA0J85K3Iy9nF71I5W6?=
 =?us-ascii?Q?GY329AHx/N8kbPA5QNtPPrSrQxg0+qRLl8VgMMFgG2faEBsOiDuUSSd334IB?=
 =?us-ascii?Q?+xbzXTtWzuF9GQjstqhf+/2A6624myIB8kym7/ZYPmSlltnFDGNZW9c5fO0T?=
 =?us-ascii?Q?ECHwQJ4tNth0cqcmVzqcjjA7OUkWXlapr5DHZuUI8ZA5+uNmgSOkbGefHQxh?=
 =?us-ascii?Q?abqBZxTt6kFKP/9QaFdwKP6wmFO7Wf14Jo2m4w8T9+iTUMaWKL9v64SzZm2k?=
 =?us-ascii?Q?wV5k51J2AUTK+gEQYgqPIBnGYXeAltJxUL9H9ZVEnHJTanIEHSfgUoWEsr/y?=
 =?us-ascii?Q?PZRzXz7mbZs2jmi/SK5/0RFBlVaMc//7Opi5wctprF5NgiG81LiHEmJKuWki?=
 =?us-ascii?Q?TfQxG6sPqGW/kETCoo6Ir8n0RhxGgc+JEg3VJ0Er05fSlO0plrEUzSiUN7pp?=
 =?us-ascii?Q?HTxNAojKpPTyqhUq4Nt8TVEU1hgCYg9d3BRF6h07AlGfVQ+4zn4eC/aBuNEU?=
 =?us-ascii?Q?Ha064iwC7csmYv/qZNQwPKJqGG0Mmtkw9QIGPyYvGCJj2qaqLgr7+/93raKz?=
 =?us-ascii?Q?sWGecW6Un34UXzZEbhvVqVXM4N3Gs+jvo2kjobVb2By89F5F7Z9BYycou5s+?=
 =?us-ascii?Q?v6Ea0IMKEArOzc0SZ6Y/tPn+eZM8RtmvUiBXUEEiNYSpaSL0lNMeZvDiRCdV?=
 =?us-ascii?Q?NU1ZEbjHSF+cW2Jp6xL5YoMA8g2vr6NjuvfbzJT07iLeGc/pfEmfjbb/9VDl?=
 =?us-ascii?Q?lQX0NgI8IHJ0mko0A3EMz1VHfUbhf5OTvuFLmwi3QWW7yeSPGT0DJJFE0R4j?=
 =?us-ascii?Q?xHwVygH+S1TMSrxUUDkNmkCcM16sGOAswQdPgCYNy1XboVUT3n54Cea2oK6N?=
 =?us-ascii?Q?IcNwZKhz1hW2Ug7xVWir/opNnGhcT/Rd7AjZjMmmbT4BWfiWTv+YiGClF44K?=
 =?us-ascii?Q?ErQOAZeXuxNg2XAswpxq1prX5+ot8BaMlCy+kUiPKa4j/fF18ZB2DWz/KMnj?=
 =?us-ascii?Q?gjpGjDmChBVz1CyT0Kd1QEyl+73oIrOVo3i/ngbpXUO6jE3PJWv+ubiMvmeD?=
 =?us-ascii?Q?FYPILiatFFZ/RaH+dMCVRfgeydyvKUjjzou7O2qV3oUqIYf92MNclrrA7gps?=
 =?us-ascii?Q?PjeLt0gPXxrRuev+ew0KfiZCgqv1IdYVBqwc0dlGTfYt0ElVSWAhn4eSrDeT?=
 =?us-ascii?Q?l8D6Wmko1X9T216tnzA+86mKEGnaegMzr5LhXEMuP4uR/meK3aP/y20Ye926?=
 =?us-ascii?Q?M8Bu5Fzo2dNN6hNMxYQSI5EoXPGOC3bu/6nA5VZHzq1WVbPZIfoVSaoDqdVc?=
 =?us-ascii?Q?t2L1zSikP/V4GLJf9ViOBLyqZ6G2ANbI7KPjuCC3PvybhA1aheI0s0WTEK7a?=
 =?us-ascii?Q?htEnLwmKkwgxAPT0Z0LfmDp6x21z?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0B/qDVFsTVIplZaq8QQaEPd9uYliXODdWj8OMoUOofkTZrIRaCBLJs4C4EZQ?=
 =?us-ascii?Q?m/9qqsnoaGuLhfDgyNKyhmw18zIPd/Acri0acrNNlJDBSx4RrMK3uTzbnP4J?=
 =?us-ascii?Q?zebuXiR/EtaG0D3rlEZcMLhgpGdod9DpqG2rpjdjdfG2vK+XQmWyD3GcAz2q?=
 =?us-ascii?Q?xJ/HCBZW+JklAFMKmcSA7fCAJtQBb1CCsW1XZduPBw5iA5IzGdyP1ognvpS8?=
 =?us-ascii?Q?CAvQMuMsoQMPtpYoWkdt+7MIyeB1AQfU0kT9mXgR5uoFjWwkWm2s+R7fzNZL?=
 =?us-ascii?Q?skf829QY0cEwcObwfgUriumBENfAdTIspVm7QeOvpF0R3rwSsnPVS/rbyZw1?=
 =?us-ascii?Q?px5kUhIaR4hy0P5SeEkM8++xz1QmpWgrveOGl55kSpYy/hNW4ItklPwzCg+E?=
 =?us-ascii?Q?brEfGY2Tfcezot6R5d8uP96mfpOgwtqW2b3ZEPmLauS1/BkIgfvXrkkUwOSq?=
 =?us-ascii?Q?TWOXlBZypi9oqW7s4V5GXespS8FKOFc05xvpcccvjLB9zDzEJu50msUvLD6p?=
 =?us-ascii?Q?W/nHz8e7oa3eKriBRsaITwoFOY74fEk/kuQ9gTMOEHj0TPPQ8G3Gjq6Jxcd1?=
 =?us-ascii?Q?r1OZLjLZ6O2rfKmJ9px/C6/8jLmyv1+IRWO4EfccP5JY8+1ywz7Le1l3MnWg?=
 =?us-ascii?Q?vKxgsSe8SWD1NTf0/OqMW0i1G3mA2G+w6yQKFBvALPyHAPEESi5ad+T/odt0?=
 =?us-ascii?Q?Tcu4TfeZ3iE6PGpSJkEfhisxe+lA0lm+uwvy9jwXwzw4M2vz6nZy+6ILSeCq?=
 =?us-ascii?Q?oieD03DXlxlpYbz0ozbEuawRqkYMicece7RK9HPQiuSEve271mUwHLZhQEpj?=
 =?us-ascii?Q?XLTSejEsZiGMbm4n27EHva7QeR6gSuths6Y7tk73E+9bXGoai54f0zKFZLVh?=
 =?us-ascii?Q?e0CHjok4RIhph9R6opb6wRy3iyeVO1UWu+yJNloUHrtf4se+83hdCECmkfqU?=
 =?us-ascii?Q?c1VK2h3sZEIAhzYOhJgvOfIiRZrkK17IRVybRtnzuKnjLW2J64ls+ofQccZn?=
 =?us-ascii?Q?+cqslL6RSUPU6aqgEAEmT/5fDfO29htNaTaOhneJ2rDjkiFXKTGDi7xhBZrK?=
 =?us-ascii?Q?N8qyEWc9eJ0MRnA0jSatoA5wqXw3l2Nr3QsTlgyONfD8OsqRIQaVPOKbTI2r?=
 =?us-ascii?Q?07KG5udITz/bEslnu8qOhtR5lr7/LOiVS1HXpvWgsBolttWuZXHBfbdJkSiv?=
 =?us-ascii?Q?pZWgNPCeFXFe0tWHLOgt/yJX2jioTP/ptGhjIgyXcaRZHYkhMqkWLN6NOEHg?=
 =?us-ascii?Q?L4UXymmyI+Dr33+GxwXfuHBmW26oTSVb1m5GCx1KJv+UDQ9y+dNa5gR/2ji8?=
 =?us-ascii?Q?nDJE/ss4nYxVsm6PrW3YagSsm8gCOJuEer/RWT7NKG1oMtUKRAIZ3CSaiYpI?=
 =?us-ascii?Q?R/P/kTBcMziceISbhtd+8GR8iEanafE3KaHAgPt1dcuzU+PPq7SWhHJl7l6D?=
 =?us-ascii?Q?a8gGkEWAn32Uw51uiiGSRzubkzfO/ZvtHxkUFhT4BFtId9Qhq0ni0zvIXOiL?=
 =?us-ascii?Q?7jUZMMbGrSjEYLkgNQBoN8/w0g3xN3j8WFzbfAOE3XcmvMekvk6o52gjalGj?=
 =?us-ascii?Q?IlFjo2EiRNSChjO6K96bZD1PZP48EWOcnLN4V9D5OfurISIx+Fw/ZYRkVgu2?=
 =?us-ascii?Q?xA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MZ6INIkVbWibQB0AGNxVsuNacYRuW+EviwxciIgdxqcvJ1z0pMBmMd0NAGsZD1tGPAWzx3yROnXXbTLQ7PXdkMLbeZg3txDl011fKkiAAVmZJU2EaWIQmbLmfM3ZDHNHMpeDIAKtd8k0AoIhfM7osrm8ZsB3g9q6hIkBO31obQj27Zi8Fu2FpUPcQdcqUjJKNGnGNzgb75po5NLIMAzob+Yod0ipiCsXMqmn+lIIRFKEjXe4jERCnHJ4PoAR9MNboqDpaz2G/lCZw143n7oUJiY6JJYz9CcqIUc/Lstt+985/cCLPPe8ebomTBjCqL86SVAEX4h+DgCLTVo8tmgSaO/9NPbMcxcBtjhk19GDNVnMjMfTFuLtpDS052WRr82lkOzz+UJKFoZe0PGJ8yxQafgXzlykdT6nhMij0c3WBH+N1MDPqLv4y5z6S6B6WfxP1KnYDZGHgCimQwaJaXrjvdVPHhgXSU8zJBRIZUOLF+ZdElfsPE0MepNIjm+vmSzil1sUR/SgJK9/VCUBSTfa35pMxv/eO3uK8G8I/4QDHFGyNIwVMAVUWMZw5srKHQPrSMpfmRlrdDDA/Y97/+hbFmXIx/HrPzoQCHAWnK53zh4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d6e6f30-9390-49e0-f1fe-08dd98694bbb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 13:13:36.7077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FFgHDv1WlQfMGUwpyGsTSLH6D1fVDnU1o0Rfh+lYj5HrJXtS/F7kZYLLBhMUCyx6sfmK1M6sKM0RJrOAoOaPhUiw75bj2ZTFOAqI7hyOqOc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4469
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505210128
X-Authority-Analysis: v=2.4 cv=Vb/3PEp9 c=1 sm=1 tr=0 ts=682dd186 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=i0EeH86SAAAA:8 a=WiMcvJobxE9NRb-wyiMA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: 351Og7vSmjFXQNk6ZLstAj0YJtS9aiOY
X-Proofpoint-GUID: 351Og7vSmjFXQNk6ZLstAj0YJtS9aiOY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEyOCBTYWx0ZWRfX4CTUfp6Y6BH9 2XLO8zZJqWf2ERD80+QJAMwu213tS21SsLSKJx9f3NdqSUnafWc3lMtw8DrwPb7alhx6bAW/27Q +se83LzDG7FFDE6ItZ0lGDgs/6zsgXzRtqlWN+AeapXjTONCkKL1oPcYYtKyOVp0JjPm/kqTHeK
 gcgyAnToMlLvJoy/Ge8Egr7zxRUY6LywjIAhtcZ66X2LnhYOcBgB5j3PUXl/5J3u/5ZjoHp4ldN H1l9Z3CHj5XT8dO5hGdIrk4q8fDjlgC3x+UsELwiamPj3l46Dy0QUQa7PH+dktQmxCWoic+XEl8 +KfsBPAmmwm3tZVlwP0AFLTII5ASd96Tk2zub0rTpEYrNvvqnQi0fVH3jAz1AbwOnnRr9xQ/gz2
 QErajCkEwLrQ4BnUrZgY4PATxMzAw/SRvf5SkoAt6ZEtOBAr4yqTRIIZaCAm+My8/EwXbMtW

Overall need to dig into this a bit before we come up with a final fix.

Has this _always_ been the case? Or could you bisect this to a particular kernel
commit?

If you haven't dug into that, could you do so?

Thanks!

On Wed, May 21, 2025 at 09:25:03AM +0000, Pu Lehui wrote:
> From: Pu Lehui <pulehui@huawei.com>
>
> We encountered a BUG alert triggered by Syzkaller as follows:
>    BUG: Bad rss-counter state mm:00000000b4a60fca type:MM_ANONPAGES val:1
>
> And we can reproduce it with the following steps:
> 1. register uprobe on file at zero offset
> 2. mmap the file at zero offset:
>    addr1 = mmap(NULL, 2 * 4096, PROT_NONE, MAP_PRIVATE, fd, 0);
> 3. mremap part of vma1 to new vma2:
>    addr2 = mremap(addr1, 4096, 2 * 4096, MREMAP_MAYMOVE);
> 4. mremap back to orig addr1:
>    mremap(addr2, 4096, 4096, MREMAP_MAYMOVE | MREMAP_FIXED, addr1);
>
> In the step 3, the vma1 range [addr1, addr1 + 4096] will be remap to new
> vma2 with range [addr2, addr2 + 8192], and remap uprobe anon page from
> the vma1 to vma2, then unmap the vma1 range [addr1, addr1 + 4096].
> In tht step 4, the vma2 range [addr2, addr2 + 4096] will be remap back
> to the addr range [addr1, addr1 + 4096]. Since the addr range [addr1 +
> 4096, addr1 + 8192] still maps the file, it will take
> vma_merge_new_range to merge these two addr ranges, and then do
> uprobe_mmap in vma_complete. Since the merged vma pgoff is also zero
> offset, it will install uprobe anon page to the merged vma. However, the
> upcomming move_page_tables step, which use set_pte_at to remap the vma2
> uprobe anon page to the merged vma, will over map the old uprobe anon
> page in the merged vma, and lead the old uprobe anon page to be orphan.
>
> Since the uprobe anon page will be remapped to the merged vma, we can
> remove the unnecessary uprobe_mmap at merged vma, that is, do not
> perform uprobe_mmap when there is no vma in the addr range to be
> expaned.

Good spot... lord.

>
> This problem was first find in linux-6.6.y and also exists in the
> community syzkaller:
> https://lore.kernel.org/all/000000000000ada39605a5e71711@google.com/T/
>
> The complete Syzkaller C reproduction program is as follows:
>
> #define _GNU_SOURCE
> #include <sys/mman.h>
> #include <linux/perf_event.h>
> #include <linux/hw_breakpoint.h>
>
> #include <fcntl.h>
> #include <stdio.h>
> #include <stdint.h>
> #include <string.h>
> #include <syscall.h>
> #include <unistd.h>
>
> int main(int argc, char *argv[])
> {
>     // Find out what type id we need for uprobes
>     int perf_type_pmu_uprobe;
>     {
>         FILE *fp = fopen("/sys/bus/event_source/devices/uprobe/type", "r");
>         fscanf(fp, "%d", &perf_type_pmu_uprobe);
>         fclose(fp);
>     }
>
>     const char *filename = "./bus";
>
>     int fd = open(filename, O_RDWR|O_CREAT, 0600);
>     write(fd, "x", 1);
>
>     void *addr = mmap(NULL, 4096, PROT_READ | PROT_WRITE | PROT_EXEC,
>                       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>
>     // Register a perf uprobe on "./bus"
>     struct perf_event_attr attr = {};
>     attr.type = perf_type_pmu_uprobe;
>     attr.uprobe_path = (unsigned long) filename;
>     syscall(__NR_perf_event_open, &attr, 0, 0, -1, 0);
>
>     void *addr2 = mmap(NULL, 2 * 4096, PROT_NONE, MAP_PRIVATE, fd, 0);
>     void *addr3 = mremap((void *) addr2, 4096, 2 * 4096, MREMAP_MAYMOVE);
>     mremap(addr3, 4096, 4096, MREMAP_MAYMOVE | MREMAP_FIXED, (void *) addr2);
>
>     return 0;
> }

Thanks for including this.

We can probably refine this down a bit though (let me have a tinker around).

>
> Signed-off-by: Pu Lehui <pulehui@huawei.com>
> ---
>  mm/vma.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/mm/vma.c b/mm/vma.c
> index 3ff6cfbe3338..9a8d84b12918 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -325,7 +325,7 @@ static void vma_prepare(struct vma_prepare *vp)
>   * @mm: The mm_struct
>   */
>  static void vma_complete(struct vma_prepare *vp, struct vma_iterator *vmi,
> -			 struct mm_struct *mm)
> +			 struct mm_struct *mm, bool handle_vma_uprobe)

Nity, but please do not add a field here, add it to the vma_prepare struct.

>  {
>  	if (vp->file) {
>  		if (vp->adj_next)
> @@ -358,7 +358,8 @@ static void vma_complete(struct vma_prepare *vp, struct vma_iterator *vmi,
>
>  	if (vp->file) {
>  		i_mmap_unlock_write(vp->mapping);
> -		uprobe_mmap(vp->vma);
> +		if (handle_vma_uprobe)
> +			uprobe_mmap(vp->vma);

You could perhaps make this simpler by making uprobe_mmap() take a vma_prepare *
parameter, where you can check this?

>
>  		if (vp->adj_next)
>  			uprobe_mmap(vp->adj_next);
> @@ -549,7 +550,7 @@ __split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
>  	}
>
>  	/* vma_complete stores the new vma */
> -	vma_complete(&vp, vmi, vma->vm_mm);
> +	vma_complete(&vp, vmi, vma->vm_mm, true);
>  	validate_mm(vma->vm_mm);
>
>  	/* Success. */
> @@ -715,6 +716,7 @@ static int commit_merge(struct vma_merge_struct *vmg)
>  {
>  	struct vm_area_struct *vma;
>  	struct vma_prepare vp;
> +	bool handle_vma_uprobe = !!vma_lookup(vmg->mm, vmg->start);

This is really inefficient. We can't be doing a maple tree search on every
commit_merge(), especially not just for the sake of uprobe.

Let me have a tinker around with this and see how we can do this more sensibly,
I'd say as part of the vmg.

>
>  	if (vmg->__adjust_next_start) {
>  		/* We manipulate middle and adjust next, which is the target. */
> @@ -748,7 +750,7 @@ static int commit_merge(struct vma_merge_struct *vmg)
>  	vmg_adjust_set_range(vmg);
>  	vma_iter_store_overwrite(vmg->vmi, vmg->target);
>
> -	vma_complete(&vp, vmg->vmi, vma->vm_mm);
> +	vma_complete(&vp, vmg->vmi, vma->vm_mm, handle_vma_uprobe);

Again, having fields means we can drop this and the below changes.

>
>  	return 0;
>  }
> @@ -1201,7 +1203,7 @@ int vma_shrink(struct vma_iterator *vmi, struct vm_area_struct *vma,
>
>  	vma_iter_clear(vmi);
>  	vma_set_range(vma, start, end, pgoff);
> -	vma_complete(&vp, vmi, vma->vm_mm);
> +	vma_complete(&vp, vmi, vma->vm_mm, true);
>  	validate_mm(vma->vm_mm);
>  	return 0;
>  }
> --
> 2.34.1
>
