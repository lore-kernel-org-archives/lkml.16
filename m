Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF47176ADB
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747758052; cv=fail; b=i8xBoJS3ezB1Uj7Iuj5owVjhuKhv9wNJGA+Z6V27Ferfvk3d87+3LtfJVlcQ7u2Z/z8oBtVAplkM1M2epjrT5a9nomsK20gJbWywAH7k4rEWnIEqCQ2GeT4IcauBbAIqXL4IrX8MRqgeS95d5oO8q9duE0+ztbBBVAIDuH3TODA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747758052; c=relaxed/simple;
	bh=5xRJ67eSAhlPrioyUh8j7dq9/p0hUUqd5sOT4lJuvxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hdoWp5vksE7EuLZRS+b8cPJGMLk+zy0rKxCYEmHIL3oJOaTZ24SRyjuEEK5rdr5b6nKsqMRfNWzS/6fJbpxqVyWQEjT7qKwiW7TO/AQLzsbTx+LQnKHFp9WmPYSqeYhCn1i46Rl/nYzr+h4Irs5xQlNpib+7yVx0seIGPm6X2Hc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZsBziUJH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=F3nyMv9n; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZsBziUJH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="F3nyMv9n"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGDuhM025754;
	Tue, 20 May 2025 16:20:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=wW6dpGXoBs/2PjsFtc/nwn8Pf54RYXtySLPFDYJLfCw=; b=
	ZsBziUJHQOLWwJX1v/veOih7P3IEbQUTpVW55mqVVEjXVs2AEou1S3pUfqSPk5rd
	L/Pb7uXcSwezJw6PVaNPEnzYd1Vm3HUwWnrULe4dwHkUFkW007aTO4rofF1nxFJz
	l1DPerFvGOOolzWzTvudzW/ffh+kOYYp7OK+O7EWbwvAelZb2lx+xDTHdE+XWtae
	7pxkE/TZyiXh1iO+jPfxX0aS+jlmbAVuaITV5wUW/txi5aUeKzDu5I5fDlhRwILJ
	nSyCXYX7wJruYguNV1DbvVh0Rtl8XqLaA490354E/yy5qQefRAFkerujfTjlPDOA
	yTPeR2mgMS9xAh9jBrxmqQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46rv5tg5ef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 May 2025 16:20:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54KFLn2Y001022;
	Tue, 20 May 2025 16:20:16 GMT
Received: from cy4pr02cu008.outbound.protection.outlook.com (mail-westcentralusazon11011035.outbound.protection.outlook.com [40.93.199.35])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46pgw895kw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 May 2025 16:20:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uCmBW1Dwf3PoPwUu5t28G/Qowilp7QxGnvrdyJey9fmHpTNrLfkc5Cl5deogCUxiqvTBhgAhXe1842s86LYVWuj5ueG7sMzbCrSKe9ZJY+mKxzZrc3gsFdxRrtfpZcwFhwAe+Lsk3YDoJtWKNjC+n0J7OlKh4tWZfJizBMM1dxqXHemNzAeS7V/HICc0FdC20Q8lF5xVjNt0A+bXhSlSzNEXorm1h+1NgaFbP7UiIQlH3lCi7tWFUa9BnI/ZLI0wuNTXOPXJD+NlzN9HnK6USUwdfgC1CP/wyTE0S1kvwMqPTatfDg6Ogk31Nyxv48XdIo/ghlwJ+KT5XlV6P9cyUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wW6dpGXoBs/2PjsFtc/nwn8Pf54RYXtySLPFDYJLfCw=;
 b=Oj4VdzQ7daFeRAS2ModHs0pOREAvP1sX75+6L64tR7zV2POd/UyMFPu8S8qNSe6QX5zD6/W6MGShG/VD/wol+C/amOc2leU0lXpP1b+1qlJSYcP0e/L0RDHaSMl22nuwR4zchBYgcEIZI8Ke15gf9Fqw4WFzPfA6eoHuQPy1V7EuHBqn42764WU6cIQBuZnSl52XWz/qXBp+s4Ns63Bgjx+Y7gEyEGZqaJDyeY/DWp3sFhVbIGVwbAQSy73X1tZpGq0owDAu8IsX+RoGpRx6lD9niFId+TwRQ9AgwU7pE2crU1vlHuyHrgSR26PamLKGy8NIOsHJ9lht3DI43+Y9xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wW6dpGXoBs/2PjsFtc/nwn8Pf54RYXtySLPFDYJLfCw=;
 b=F3nyMv9nLTaiv5/nmlo6fnBotUWuLmiyChOyCA043nVhJZjkA4fI+h4FnZCpPOOBd6uFu6z48TdHY/fdRmi8aAdXu3zyPqcrH9+EVQ8A48c8YKdJBh2KND7LqyS3uiy2/7BXS4v5CvQGkEi4EqORq3pLTb1zwPIUmhCfMV+n048=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by DM4PR10MB6719.namprd10.prod.outlook.com (2603:10b6:8:111::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 16:20:13 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 16:20:12 +0000
Date: Tue, 20 May 2025 12:19:58 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, zhengtangquan@oppo.com,
        Barry Song <v-songbaohua@oppo.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        David Hildenbrand <david@redhat.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Matthew Wilcox <willy@infradead.org>,
        Oscar Salvador <osalvador@suse.de>,
        Ryan Roberts <ryan.roberts@arm.com>, Zi Yan <ziy@nvidia.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH RFC v2] mm: add support for dropping LRU recency on
 process exit
Message-ID: <xymq3lezzjc3hzh2eduogqpn6okrbbkodjdwu6ylpeszakb22a@ck6yhdfdcayq>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, zhengtangquan@oppo.com, Barry Song <v-songbaohua@oppo.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, David Hildenbrand <david@redhat.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Matthew Wilcox <willy@infradead.org>, 
	Oscar Salvador <osalvador@suse.de>, Ryan Roberts <ryan.roberts@arm.com>, Zi Yan <ziy@nvidia.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>
References: <20250514070820.51793-1-21cnbao@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250514070820.51793-1-21cnbao@gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YQBPR0101CA0081.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::14) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|DM4PR10MB6719:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c4c429f-cc5e-4520-736d-08dd97ba328a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEtoTVBpdk1GN3lsVzJkVTdScS82R25qY3FENlhha1ptcEVaZDNsZGt6R1Qr?=
 =?utf-8?B?T1ZDb05DS1RMK0hBYk5xWGNzY0dDcng2eitHRXRhNUt5QlpvYzVLYUg4OUNm?=
 =?utf-8?B?NUZaZ2gxZ3p3bnlGaXF4d3Y2QnZLblQxYTJQd3piQlgreHJtbTEraG5jY3Vw?=
 =?utf-8?B?VGpmME4yMnVpbFZoUGU1SWZBVmhrcWQyYmlYL2hrZGQ4SmdJa1JXSm5Mam5B?=
 =?utf-8?B?YkhWOHAwb2JMb0U0SVVvYktYU04ybTdzcU40VmtvQjZPQVpEL1Y1eU81ZXpr?=
 =?utf-8?B?emtCZzNDM01KQld0V0o4V3NsT0MxcW9rSnBibmxtZWZsQk9Ka0oyUG5FNkpZ?=
 =?utf-8?B?T2p3MW4rZlhXeThWeERsRWNZcFpNaW1yM3lURnA1L0JoQVBxTHdlWnlmRnl2?=
 =?utf-8?B?VERoQWhIcExvbFhlTExjVGdGdGZmYTdIL0Rob3pZRzFtMXd6TFdpeVhxOWpT?=
 =?utf-8?B?SCtPV1RRY3hqdm1BRnZiYWdUWmxyTUN0d0ZpMkZPeThZc0VMOWZ6eVRab0RC?=
 =?utf-8?B?TExITVgxSEtrWFFRVWNqQll6di9aWUVHNzhRcHJFVjZwZjE1bjdEajh0NGlI?=
 =?utf-8?B?K1dhZ2RMTjBTYkJxM1JRQk5McVdoSm1jSG0xbUFFRUMvYXRhZk9pWkZCL045?=
 =?utf-8?B?UUtwSzAvNFNhZUJMQ0JwNmJDTkpJZ3hsa1lWWWZSV2syVy8xTHFwU1Bwak01?=
 =?utf-8?B?SHd4aVUxcjNZVklHWUR1WTBqRXMxYkJZVnRYNXBJQ0R4TUVJK0tNd1A1RWNS?=
 =?utf-8?B?dmV0VFBMcDRTRnRMbE9kMFg4OGcraEkzczdsV1hiRFlUWWVVbVFmMEQyWjhl?=
 =?utf-8?B?R3BwVUdJdXhyQ2xMdjNUQVpKWm14cW1hU092UnlodDd3SjFuLytLcXJISTU5?=
 =?utf-8?B?Yjk2TENVenBUU3FKWnp1VElTOXpOU1hQSldWWW0zM1ZCc1JOL2RNcEdadGsy?=
 =?utf-8?B?N2dqaU1veDRFenNBUk4wMlJyWVA3OVFVTmZ6SVlQQURyL05idHBGREljODRs?=
 =?utf-8?B?bVpRM3cxZWdZNVN6QVlOQmthOWlxdFZZbG15THVnQWdqaFN1OGNhamw1VXcw?=
 =?utf-8?B?bUtvbklSK2hnUEo4MXF5UU9WNGZEY0tEclN2akRLanlic3l4WjFzOUwyUGFz?=
 =?utf-8?B?MzIrUm9BUjRkTzQ0SmFEVjRQbVptSGFzQ1FUOUxjS2pwTVdsK2FpMTJJNlFQ?=
 =?utf-8?B?ZU9xK3ZZaWl2WXk0UzdGenBCWDh6YmJ5cHNPU2hWaXZuS08yR3Zjd1JTbFVt?=
 =?utf-8?B?cGFnYUVhekxtZ1hDZngvcGpFdGt5Qmw1M1I1Z29mZ0FLZTgybThVazFTZXR3?=
 =?utf-8?B?TE1nMFFwU1Vja0VqOHVoc0lpMWxBdi9ORm9YS2pxR1JmcXZrMnNnRk4yNEti?=
 =?utf-8?B?eE54cVlEWDhVWTl3Wm9DYmVKOVd1L3lydW1nb1psQ0YwNUJrNnF1eHJBSnZN?=
 =?utf-8?B?S1VReXVVOGlMcmFibmJaNUl4WmgyVTM5c0lJcHByRGhONDgwcWNlb0RXWlNJ?=
 =?utf-8?B?ZTJkK0NKWThmNEg3ZnJNcjhSTWZlODJDUXljMEtJdlEyeHBwWEpuaTJnVEJV?=
 =?utf-8?B?S3hzT1lheUl5cE5xa1VzbXVuaXA5NWtqN0Y0V0QyNFlqMEpQSlpxbHRRTWhV?=
 =?utf-8?B?YVJLQmZka0N4UE9DOVh6Qmd3QnRudkNTRW16bE9hL2tkVms1ZFZPUE14eG43?=
 =?utf-8?B?eFNUUWVGU1J5R2xMZ0lUbnp4WGxHcFdiZVA1ZEtmWnlrbmYyOVZRVVlqeDQ3?=
 =?utf-8?B?czN0VTNkbDB4emVqRUJjc2RxUFBTcHl3R2pJLzg0enFRa1BIZUttV2dXUlZp?=
 =?utf-8?B?aWQ4TjlXTFZmcWNGT3hIdDU3VEc5cWh6TG94enRlM0hDZ2FTeDJvZmVkNG51?=
 =?utf-8?B?Yk9Rams2TGQveFRYU2VBSGpBWDNSWnk2ek9OWjRidDJDdHNhaE9YTXgxVXFW?=
 =?utf-8?Q?60kQVBmzYyk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEh6NjFSSzFlRXZMZ09lcnErT1p4ZlBwQjRrcWx2VGFTT2YxZ0NMVnBpbGg4?=
 =?utf-8?B?QWhYeUQ0cXlFQS9HOWY3TXJsejZNVTJ6SlBvU2tuRzJ0bFg1VXoyNlg0Rnl5?=
 =?utf-8?B?a0hzS3pGSm9TdGxmVVRTbDZySFpubldVd1FOYzgwM3U1RGg3TE8vZlNTblVU?=
 =?utf-8?B?M2ZENXdIL3FIeEtyVVVZNTJSNXlBTXZzVmUwc3BQblN3WXhPaG5SYXJrUTUv?=
 =?utf-8?B?MEZSZnBhcnZFQW5pTVRNZWRLSDg3Z2xRTzZiRkVDTEp0UTIzN0REYW9vbnNR?=
 =?utf-8?B?ZGNTdzYvSEdCbGF0alNFL2pzVVk3S3Z1MnQvVFFuUnA3a01JcDE1WDlVeWJl?=
 =?utf-8?B?a0JEN215ekUydnNOZXkxUHhMZHFvbjhGWTN6WEgyaHBWQWtkM1A4OWVtUHBz?=
 =?utf-8?B?QWVYWDFkM2JPK3lLL0lVR2hrNkpDakt2bzRJUUFqY0pKZUdXREJNd0l6YVNs?=
 =?utf-8?B?MmdLeVJvYmdja2MxNWtwVG4wVlU5b1lCYWV0ekhqR2RGWHE3U21YMlpBcEdF?=
 =?utf-8?B?bmE1Mlh0aFNnUjJDNmVzellKUFI2czlPcGhyTzBrS25FcW1YTWgwYzhDVUNT?=
 =?utf-8?B?Vkg2QndjOTlOMUhSTWNoelRiZGttVjBUL1BTckhkdVlvWkJwbXI3MUFkUVNa?=
 =?utf-8?B?NGRjM0dkK21xVXNPc0FHTXJDSC9iQkdkOEp1b3laKzBrNEE2Z1FYTWpkemtZ?=
 =?utf-8?B?YVEvRjhwR0x1cWtlS0Mwc1dKSEdiOXRHZ2R2VTM2NUE3ZC80VGpnN29zajl0?=
 =?utf-8?B?a1BLbE4rSkJ4YVgzVmp6K1FFQWRjT3BtbDVnTU1qQk1UZXQzQVBpMVRjQW5D?=
 =?utf-8?B?MlJVbTVmdkRxR0lHRXFtNkpOOWxzNFdXMHVZVDV3MU0rdTVDTTZXby9GeTAr?=
 =?utf-8?B?aVhwcnJ6alF4eEVweVM0ZjNWalp1V2VJdmVhTFltdG1LUk14YmYvR3o1N3FB?=
 =?utf-8?B?RS9kK3U3c2NJdGNzTDIrNDRDSTdYcTN2TUplZXFpRTVRc2lhZ3EvRVM5azZE?=
 =?utf-8?B?MU5GMlFVUHpLbkFEdVkvRGVXbUNSUUlka2VCSHdaeWhDSGZaVU1nY01tcUY3?=
 =?utf-8?B?eEhGak10c1JpUUNiWFBVS2JvWFRPaU8zaUMzT1g0a2o0U2Z2aituSlh4QnVy?=
 =?utf-8?B?NVFyTS81emlxM0pnUTVUTmFQdWRxTW9tMDJpRVpjWEhyb3hyVFRQN1o0VjhK?=
 =?utf-8?B?MzIxd3YxM1RUaDl2K1lVRGJuYTJtbUtXNzY0UFJBVi9YR2VPZlZnc2RKREJG?=
 =?utf-8?B?SlJWU1ZlVVZzLzcreDBBN3BlbDh3ZHIvbG9DVG5PL3BaZGczclczdE9WUjIw?=
 =?utf-8?B?SVVFaUZ6RFc0VTRUdjdDcEZNVjZxWGhDODNTbFZ0RkhWSHNrVENZaDVnSENu?=
 =?utf-8?B?V2xTMzFveVNSREJwUUJnb1BsdVRlTXVRUUhEWk5QVTdRd2pYT3FhNGZobTdW?=
 =?utf-8?B?OVBvZzc0Q0hwUjA4R3FYaU10UHBvM2drTXdyTll2b2pCanh5aEFLbU9aTHJT?=
 =?utf-8?B?YjZ5WTNSQ3VYdVJpWXQ1Zk5tcVFSMDRNSDNSTW1ScU5vcStLZFFMaEM2b01S?=
 =?utf-8?B?cTF0N3dEeG03ZmdxUTJ5UERGMG5VUEdXWFlhMjhSaFZobUhHakI0NWpJQ3Y3?=
 =?utf-8?B?ZVRiMk1iMllWRHZ3NVFVNDN1cUZKMmRFYStNYUF3VEdxWm8vdFVaay9tZ1Np?=
 =?utf-8?B?QTBqSTBQNWl5TmpWMEp4NTFWOWVlQTNlRWRhTi85dWRzczJMM0lsS0RxUXE4?=
 =?utf-8?B?eDZnZTZ1YXNMV0QvNEMzb3o1dWxjRUVacCtJUkJkaDFUSHpBMEdIT29waWg2?=
 =?utf-8?B?bm9jTlllcklRdVZwWERVWXhWMm1TOGdxYkRhUnZkUVYrRDlQUkU0OHZmVGIx?=
 =?utf-8?B?Y21oQ3ZKU3R2UzFmemRPTGQ1SmpBcGhGVExDYlhpRGhVRmh2TjM2a2trUGNh?=
 =?utf-8?B?R0NtTGQrYUdzQ0kydVpyOW5lTXpFS0lkVlpOeG9idmVEaFRBN2VMOWNDN3pu?=
 =?utf-8?B?QXFoMUZSWFpLREdMQkRqSDh3dDVGVWZMVWhMQ2pSWlZkQVhsckdCb3JOc1J2?=
 =?utf-8?B?T1g0NUwzSnlkalJmS1lhbWIzUzJ4TnB6d0dVa2dMQ1VVd2NITUZTOXYvVVZN?=
 =?utf-8?Q?HIQA9syaN+ZjHdhI0zlSkWvpE?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gn4vfoOQMxcr5jpi/IMnrn2n1PJAoqrjULnVvZbFvqwZsfVy/MehKcVxX8MuqdwmNyHiOFHzmjyqibpBG/32LkaPe2o9xlZGNNdDEtuoX0kWu0MYi9oipkiWhVYrYnZVH5/joCvP3zIpQJkUy6oZumVmsftouTNihblD7EF7kajovIWxcEedcdOpaWzJl1xtJapzrJv5lD8jz0iGS/yKdimPmWQWAm7yiWAgLtdVd2qUGrLKK59dZtr6ceLLsfLIW/Pl85F0jP7kPbCALH5Aba0bbgRvITWVXLWPDrIWKMxq3uf7DaMFva9kf+LzO0wZ9kpPOxAiF+y4zkQIj8/+7UR7OO5V28d9eBLjhgqzzbzDoOIk0chaEEXc+ICFwMDkWnPlR+j3eX9rTo/YSi17dFE360///BB8Q8N3ZRsnbnkIh8KVeSrdtKNpsjjS5Sdn7sjiEyma+H3/NH8cORtIw5qxwYeK36ezo0PORY6Ic8pGed5QJBQcVGrIdwwk6+DqNz21J5ZIe8l/K63M+dNSaDvvTRb/ysb0q4OEsIQjggTi24jbb+6bLUKwmbNcA1ZHRkP2lhVWEFDct9CFd1GGlTW6mu7YS9dHsXIzwoHbr8c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c4c429f-cc5e-4520-736d-08dd97ba328a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 16:20:12.7442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Jc3zN+z41x2Th6x7qXmJfEED/RIefygzsjbnsZYbCtZIOXPUGQMOowEedsGzuYMPF5M1a7uwMxwC56tAkZNAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6719
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 adultscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505070000
 definitions=main-2505200134
X-Authority-Analysis: v=2.4 cv=EIEG00ZC c=1 sm=1 tr=0 ts=682cabc1 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=A2pY-5KRAAAA:8 a=SRrdq9N9AAAA:8 a=20KFwNOVAAAA:8 a=ufHFDILaAAAA:8 a=JfrnYn6hAAAA:8 a=7CQSdrXTAAAA:8 a=Ikd4Dj_1AAAA:8 a=yPCof4ZbAAAA:8
 a=1XWaLZrsAAAA:8 a=iox4zFpeAAAA:8 a=qI9vNis-NcdLKqQEFd8A:9 a=QEXdDO2ut3YA:10 a=ZmIg1sZ3JBWsdXgziEIF:22 a=1CNFftbPRP8L7MoqJWF3:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=WzC6qhA0u3u7Ye7llzcV:22 cc=ntf awl=host:14695
X-Proofpoint-ORIG-GUID: -JRRbXKBYk7oZZg5FbZ8WtPUFHEbRzp1
X-Proofpoint-GUID: -JRRbXKBYk7oZZg5FbZ8WtPUFHEbRzp1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDEzNCBTYWx0ZWRfX15yJJrKUtORh Xdpi9C/aYJNks/fOUooGVkBu6dTc1NTttQQazIvNCKNs6QwKS3bPxzblSjGbyFGREi4AX2zUtlJ b8uD1NPjJLxmpNYT+Evs5x2cI82qZLNMRvVC4sYJPKMNLuXJZaVg1xD1HoMPywLgDAAtxiH8URG
 rUjl+oW/xZA/nkfFRSSO4hBxxgnaWbEkNtHP9WmW24MSLAkGJu92gA054Qcw8lrpllDYX6F5oBw QHmqIPUQ30i96mNlP06QI60Z+wDjx7klBUYoYt+i/zq8VYwAPG1p4iyT/bUODHYcd343GwYEp1y 0MH47gwtSdEwk4JinHhFT5/ZR4WAz1d/Z7fCZMCnQTzqk5k7t9od2YYwh+yerdzo4/bI0+boGhv
 n1iKjjd3s6Fz52mtWYPg9OzlPevv9YJIyH1RF00ncr+xEZILcrPupxCDC6k8DIIVAsvxCw4I

* Barry Song <21cnbao@gmail.com> [250514 03:08]:
> From: Barry Song <v-songbaohua@oppo.com>
>=20
> Currently, both zap_pmd and zap_pte always promote young file folios,
> regardless of whether the processes are dying.
> However, in systems where the process recency fades upon dying, we may
> want to reverse this behavior. The goal is to reclaim the folios from
> the dying process as quickly as possible, allowing new processes to
> acquire memory ASAP.
> For example, while Firefox is killed and LibreOffice is launched,
> activating Firefox's young file-backed folios makes it harder to
> reclaim memory that LibreOffice doesn't use at all.
>=20
> On systems like Android, processes are either explicitly stopped by
> user action or reaped due to OOM after being inactive for a long time.
> These processes are unlikely to restart in the near future. Rather than
> promoting their folios, we skip promoting and demote their exclusive
> folios so that memory can be reclaimed and made available for new
> user-facing processes.
>=20
> Users possibly do not care about the recency of a dying process.
> However, we still need an explicit user indication to take this action.

Can you add why?  It'd be nice to capture the reasons pointed out in v1
discussion as they seem important to why this isn't set as a default for
all tasks.

> Thus, we introduced a prctl to provide that necessary user-level hint
> as suggested by Johannes and David.

I'm not sure it really makes much of a difference if we update the lru
or not in this case.  Johannes point about this small change having
unknown results for the larger community is certainly the best argument
as to why we need this to be opt-in.

We should probably document it so that people can opt-in though :)

>=20
> We observed noticeable improvements in refaults, swap-ins, and swap-outs
> on a hooked Android kernel. More data for this specific version will
> follow.

Looking forward to the results.  What happens when I kill my app and
reopen it? (close all apps, open the one that was being annoying?)

>=20
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> ---
>  -v2:
>  * add prctl as suggested by Johannes and David
>  * demote exclusive file folios if drop_recency can apply
>  -v1:
>  https://lore.kernel.org/linux-mm/20250412085852.48524-1-21cnbao@gmail.co=
m/
>=20
>  include/linux/mm_types.h   |  1 +
>  include/uapi/linux/prctl.h |  3 +++
>  kernel/sys.c               | 16 ++++++++++++++++
>  mm/huge_memory.c           | 12 ++++++++++--
>  mm/internal.h              | 14 ++++++++++++++
>  mm/memory.c                | 12 +++++++++++-
>  6 files changed, 55 insertions(+), 3 deletions(-)
>=20
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 15808cad2bc1..84ab113c54a2 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -1733,6 +1733,7 @@ enum {
>   * on NFS restore
>   */
>  //#define MMF_EXE_FILE_CHANGED	18	/* see prctl_set_mm_exe_file() */
> +#define MMF_FADE_ON_DEATH	18	/* Recency is discarded on process exit */

Why is recency not in the MMF name?  Why not MMF_NO_RECENCY or
something?

I guess we are back to no space in this flag.

> =20
>  #define MMF_HAS_UPROBES		19	/* has uprobes */
>  #define MMF_RECALC_UPROBES	20	/* MMF_HAS_UPROBES can be wrong */
> diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
> index 15c18ef4eb11..22d861157552 100644
> --- a/include/uapi/linux/prctl.h
> +++ b/include/uapi/linux/prctl.h
> @@ -364,4 +364,7 @@ struct prctl_mm_map {
>  # define PR_TIMER_CREATE_RESTORE_IDS_ON		1
>  # define PR_TIMER_CREATE_RESTORE_IDS_GET	2
> =20
> +#define PR_SET_FADE_ON_DEATH			78
> +#define PR_GET_FADE_ON_DEATH			79
> +
>  #endif /* _LINUX_PRCTL_H */
> diff --git a/kernel/sys.c b/kernel/sys.c
> index c434968e9f5d..cabe1bbb35a4 100644
> --- a/kernel/sys.c
> +++ b/kernel/sys.c
> @@ -2658,6 +2658,22 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long,=
 arg2, unsigned long, arg3,
>  			clear_bit(MMF_DISABLE_THP, &me->mm->flags);
>  		mmap_write_unlock(me->mm);
>  		break;
> +	case PR_GET_FADE_ON_DEATH:
> +		if (arg2 || arg3 || arg4 || arg5)
> +			return -EINVAL;
> +		error =3D !!test_bit(MMF_FADE_ON_DEATH, &me->mm->flags);
> +		break;

Is there a usecase for get?

> +	case PR_SET_FADE_ON_DEATH:

Could you just check the value prior to setting and just return if it's
what you want?  In which case, the setting is just change_bit(), and
there probably isn't a need for a get?

> +		if (arg3 || arg4 || arg5)
> +			return -EINVAL;
> +		if (mmap_write_lock_killable(me->mm))
> +			return -EINTR;
> +		if (arg2)
> +			set_bit(MMF_FADE_ON_DEATH, &me->mm->flags);
> +		else
> +			clear_bit(MMF_FADE_ON_DEATH, &me->mm->flags);
> +		mmap_write_unlock(me->mm);
> +		break;
>  	case PR_MPX_ENABLE_MANAGEMENT:
>  	case PR_MPX_DISABLE_MANAGEMENT:
>  		/* No longer implemented: */
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 2780a12b25f0..c99894611d4a 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -2204,6 +2204,7 @@ static inline void zap_deposited_table(struct mm_st=
ruct *mm, pmd_t *pmd)
>  int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>  		 pmd_t *pmd, unsigned long addr)
>  {
> +	bool drop_recency =3D false;
>  	pmd_t orig_pmd;
>  	spinlock_t *ptl;
> =20
> @@ -2260,13 +2261,20 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct v=
m_area_struct *vma,
>  			add_mm_counter(tlb->mm, mm_counter_file(folio),
>  				       -HPAGE_PMD_NR);
> =20
> +			drop_recency =3D zap_need_to_drop_recency(tlb->mm);
>  			/*
>  			 * Use flush_needed to indicate whether the PMD entry
>  			 * is present, instead of checking pmd_present() again.
>  			 */
> -			if (flush_needed && pmd_young(orig_pmd) &&
> -			    likely(vma_has_recency(vma)))
> +			if (flush_needed && pmd_young(orig_pmd) && !drop_recency &&
> +					likely(vma_has_recency(vma)))
>  				folio_mark_accessed(folio);
> +			/*
> +			 * Userspace explicitly marks recency to fade when the process
> +			 * dies; demote exclusive file folios to aid reclamation.
> +			 */
> +			if (drop_recency && !folio_maybe_mapped_shared(folio))
> +				deactivate_file_folio(folio);
>  		}
> =20
>  		spin_unlock(ptl);
> diff --git a/mm/internal.h b/mm/internal.h
> index 6b8ed2017743..af9649b3e84a 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -11,6 +11,7 @@
>  #include <linux/khugepaged.h>
>  #include <linux/mm.h>
>  #include <linux/mm_inline.h>
> +#include <linux/oom.h>
>  #include <linux/pagemap.h>
>  #include <linux/pagewalk.h>
>  #include <linux/rmap.h>
> @@ -130,6 +131,19 @@ static inline int folio_nr_pages_mapped(const struct=
 folio *folio)
>  	return atomic_read(&folio->_nr_pages_mapped) & FOLIO_PAGES_MAPPED;
>  }
> =20
> +/*
> + * Returns true if the process attached to the mm is dying or undergoing
> + * OOM reaping, and its recency=E2=80=94explicitly marked by userspace=
=E2=80=94will also
> + * fade; otherwise, returns false.
> + */
> +static inline bool zap_need_to_drop_recency(struct mm_struct *mm)

This name is confusing.  We are zapping the need to drop the recency? If
this returns false, then the need to drop recency is false..  It is not
very easy to read and harder to understand how it translates to the
values it returns.

How about mm_has_exit_recency(), like vma_has_recency()?
Or mmf_update_recency()?

> +{
> +	if (!atomic_read(&mm->mm_users) || check_stable_address_space(mm))

FYI, failed forks may also set the address space as unstable.

> +		return !!test_bit(MMF_FADE_ON_DEATH, &mm->flags);
> +
> +	return false;
> +}
> +
>  /*
>   * Retrieve the first entry of a folio based on a provided entry within =
the
>   * folio. We cannot rely on folio->swap as there is no guarantee that it=
 has
> diff --git a/mm/memory.c b/mm/memory.c
> index 5a7e4c0e89c7..6dd01a7736a8 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -1505,6 +1505,7 @@ static __always_inline void zap_present_folio_ptes(=
struct mmu_gather *tlb,
>  		bool *force_flush, bool *force_break, bool *any_skipped)
>  {
>  	struct mm_struct *mm =3D tlb->mm;
> +	bool drop_recency =3D false;
>  	bool delay_rmap =3D false;
> =20
>  	if (!folio_test_anon(folio)) {
> @@ -1516,9 +1517,18 @@ static __always_inline void zap_present_folio_ptes=
(struct mmu_gather *tlb,
>  				*force_flush =3D true;
>  			}
>  		}
> -		if (pte_young(ptent) && likely(vma_has_recency(vma)))
> +
> +		drop_recency =3D zap_need_to_drop_recency(mm);
> +		if (pte_young(ptent) && !drop_recency &&
> +				likely(vma_has_recency(vma)))


I really don't like that you are calling an atomic_read() and two flag
checks every time this block of code it executed.  This must impact your
performance?

How about this:
1. Check in unmap_vmas() that the range is 0 - ULONG_MAX, and if the OOM
flag is set.
2. set a new zap_flags_t flag (mmf_update_recency, maybe?) if
test_bit(MMF_FADE_ON_DEATH)
3. check zap_details->zap_flags if that bit is set in this function.
4. (hopefully) profit with better performance :)

Since this really is a zap flag, it fits to make it one.  It also means
that you will not need to check an atomic and will only check the one
flag as apposed to two.

I think we can live with some user (probably syzbot) unmapping 0 -
ULONG_MAX and incorrectly checking a flag and, in the very rare case of
actually using this flag, does not do the correct LRU aging.  If you
unmap everything, we can be pretty confident that you will be on the
exit path rather quickly.

>  			folio_mark_accessed(folio);
>  		rss[mm_counter(folio)] -=3D nr;
> +		/*
> +		 * Userspace explicitly marks recency to fade when the process dies;
> +		 * demote exclusive file folios to aid reclamation.
> +		 */
> +		if (drop_recency && !folio_maybe_mapped_shared(folio))
> +			deactivate_file_folio(folio);

Thanks,
Liam

