Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9DE218EB8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 10:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744020779; cv=fail; b=JG2rIigXPYv5rgXgL12tUpEHCMbhXzi1359RsKCFmQofeRiW6hXQ3T212A+kOm37ZQNLid7rgPhLT1Q2/3ljE5OmunO+1+VnMMC3XZ6nZ/H/t/3qejhyy210UejQs24VccOTK4INQQ6Z0mq7MJZvSsfD1Ot9Vl6WdlW8TvfPtqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744020779; c=relaxed/simple;
	bh=78WEaSjga8Fiym8ge8PtkerpAQkRJux+UeA8sMtvmUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Qz4OZSAAMpYWEOaMgZ0CR4P5Sf1F5p47Db9RYFS89hac4qpYPmpzQ66ic3nLrH69Xr4FiZAbCG319IRQTjyQouhmwCMcb1BTRn6nLB7KEVVwP8mLH+5yvP6XoAnFQqw76T4f1y29xUYmHzDE6rxNz/Wzyt/KnlNN3Lq/tLPi6rw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TowST1Cz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=guGkXGOe; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TowST1Cz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="guGkXGOe"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5376Y8vK028235;
	Mon, 7 Apr 2025 10:12:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=fZ08I2wI2k1tQpRHbd
	x/5pdNR2jaHLVgtd+CSNJd1Cg=; b=TowST1Cz4v6ClThIjalBnb/VHAInT8ULzm
	1xGs9G9nnA2PankWwL7RSwBN6Cw/HtvumA8/ZJqHZ1sn45zYR7FPofdcR6QoGuAy
	+VH/2KQ6ntBjV0Ql3sHIB/ruSq6NI7IgN8vwpFv3oEb65G6BX4D4gJUjKBubrVTL
	KIFULdNsO9YucKeMIpnmXJ8XYmyvVRKtr5t9cYPFf2+qGkMofXi/OdnrF+EwCJEH
	Fa7FiJ/W9pF1HU/4h8eg8ywTY8NQN68MMXXXVwfhcxcptWG5YzUB7IDqfSq4QeDP
	K3t145OYDrodyZWRN33d+PSe74Fan4Sc3lD9gu4XkgPr88H1/Kzg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45tuebj8dc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Apr 2025 10:12:53 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 537A8jAI013779;
	Mon, 7 Apr 2025 10:12:51 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45ttydu3mv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Apr 2025 10:12:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j0fsQIn1oQrYFj3BZkBa0jHR0dmRJS49nFpwLF2uAhqXCoJcsKkX5CwTH33/AYMYnjKG2cnKMQQHiWtwGy8U5GXGXj98EblH5d2WAQhQ2tvQrYPk7LRMBVn63T5zShr6yUnbhjHtXFH0HyIQxcZCvnZZE5lp5zL37jw8tl5j6eBUNDUVmjjnJH4fM9kpwc+vDlHjMvRu2MCIgSZm+oDJkIimxq639pQPnbMFpWTSUuhU36oC63WguVZuJwPqUaUCfGOrcMPRpVrmr02BNrRQ+T+nc8xO9j1Uw8MT84GMdkhzpDn7G/bdcBGZ9VDjS2G9DiaNVrDMH85nu7YKTy8XgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZ08I2wI2k1tQpRHbdx/5pdNR2jaHLVgtd+CSNJd1Cg=;
 b=uuJZ0wUHMt+lLMZKVcWaTH6laUBkp9JmAZEMyeHSYb122vMD/HyNrsELZyhSjoEmQ+922vJgpZ9pGARcO02XXgZDm4gbAUXiQ0ewV44Kj94CTt5bOLOq4/fZDJIFQj6I0qxIlk7TNYW7z5Uh9tO3Hxhz7FahteUapA7GPI1AKkzVwISNiMD48JYcbv2jCx9n4PGMzRD0+lSNMc7IbG9A7M0d4p7DJ//SRnEXo/Ar7CwDN8YJccPlUvcwzWHvVP8wqGwRMR2uUPaq8I1FQDyVBchmCQDZ2hyDMVUkqx+X/Tter6SfR1jAa8UiWAsCPhJGqo3ylJjMav16Hf57l8MhuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZ08I2wI2k1tQpRHbdx/5pdNR2jaHLVgtd+CSNJd1Cg=;
 b=guGkXGOeqhR9FjROYqjqK/avM7gjkxgXVGG5+T7dKD50nHGj+lpHMv2i1dOQJT4yAnMcYaqhuqmPvmpsbYTXNqC0/62BUzTo+Q55Kso2b6T+9aeU0XfedTDnoAnueXyp0IsaY3n8iucFgMQ+S5dCZ+Fdrh0/TSLBUfu8rzWzxXo=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by PH7PR10MB6335.namprd10.prod.outlook.com (2603:10b6:510:1b2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Mon, 7 Apr
 2025 10:12:48 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%3]) with mapi id 15.20.8606.027; Mon, 7 Apr 2025
 10:12:48 +0000
Date: Mon, 7 Apr 2025 11:12:45 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: syzbot <syzbot+5250c4727db03e3436cc@syzkaller.appspotmail.com>
Cc: eadavis@qq.com, linux-kernel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [mm?] general protection fault in mremap
Message-ID: <89747f09-4edc-4225-9556-38fc683df1b3@lucifer.local>
References: <tencent_58BA62BBDD331C9E981BDB4B611B6725A508@qq.com>
 <67f1f3d3.050a0220.0a13.0259.GAE@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67f1f3d3.050a0220.0a13.0259.GAE@google.com>
X-ClientProxiedBy: LO2P265CA0388.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::16) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|PH7PR10MB6335:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c9104bc-7d60-456a-7932-08dd75bcbf67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NdcF+JwYPTyNPPp2MaC1DIeuDwgoCCJrLZsmabOmFXDtR7S9esSoe6zO7ZHT?=
 =?us-ascii?Q?IQ391wBVEMoTc47gzUaSgopGhnpNCmn/r6ZiBb1hbbz0TmUdN7zToe1WdjGG?=
 =?us-ascii?Q?HGwWBU7n1gf6XVdzs/wLAl9/YqhNbP7fkbQbyVu1WlaneQmkDTkglWXb6xkR?=
 =?us-ascii?Q?Hl4TxN68lx6/qPUi/+8PwObKOA7LgVX3zwJid2HMjyTRNHWBN9KwmzGNDDUd?=
 =?us-ascii?Q?2YZsOdgUsqq5Acz/Ql02+KSg9zylF5QHu4vZA68VGcbiW22jIx5WXYOhRjIt?=
 =?us-ascii?Q?DY55gk/WuCBQge4w2w2yQqFSXGHJ22Vmsj67jzjYLjxTljdf+tbhuGg6ii9I?=
 =?us-ascii?Q?Buj2YrJO4TAmVhRCklJg4eEbeToxpCy2Q+LhrL1NpBPCfn12MRtUQvU34+Jn?=
 =?us-ascii?Q?g/vRxealBZDfCGAyAZjdh4DdGj3PLGQL3zgx9I9mB7Tr0SUNDlhbYiryJTWE?=
 =?us-ascii?Q?dzeBwN/mcuJB71JzGoZ4KqqkD0x4Ddc7G60PHawfgA+3KNHMr15XZRXmNs6p?=
 =?us-ascii?Q?6wcU3qdV28jS3yXYodlhdD1qvkpAT6673WmpGeucNGhGXEJMQYb8+6H2v7jX?=
 =?us-ascii?Q?09BNxNotOk1gIa9WmLjuRV/bS6ImZrAqz0g3UCM0eeo7UCfijJiXiACE8r5/?=
 =?us-ascii?Q?mj1P4ZYJh4O0xpgHN3+Vzmu27tYoVEd3o+27FXnV2JqAQI0id8teup5LBJ9Y?=
 =?us-ascii?Q?EMPpE+JYypvs3ZuoS9MQZ2OVjGXLFRm0wbx/aHChu/dgiyM17VuR/i2LCH0f?=
 =?us-ascii?Q?xSzJv9ZF7lv54UIj6x08x77eoexteakPKiZtGmSkEr7A/davEK72K6xv3a9r?=
 =?us-ascii?Q?VJsja7k81wqnapcZVIkJMnzuCy/WEeMDntcDt2kPrUuuHN8BMeNde7Wt7CIe?=
 =?us-ascii?Q?gh5TcljSCPRnAeNdFHUO3Erlrt95dcrGWmpR7D6m9vMTIFEI6Ea+c7PzWz6f?=
 =?us-ascii?Q?xMoJYy1PdvJY+rcLC7Z9d4r51ndDmOArUVf5aIbPNmpnOgd9CFjvcs7FRhR+?=
 =?us-ascii?Q?/d/67oz3fMxnUpMwhOQdonpsTY3TV3qBC/TipbnMQxWz2XKlzDzlFNE5dVa1?=
 =?us-ascii?Q?7kkNYyF9coGog5Ij+dABc8qPZy/gNeHW83BMS8mTUKuwvMYHQPRkxj4qR2x3?=
 =?us-ascii?Q?u3dTm5UWBFXwl5MLVi3G43XTzmuLqTmhAbQSMc5ZO0POrhRGgtHIMjZkXUZP?=
 =?us-ascii?Q?5jCVgD1piMHqf9BSdVFBVWEUozW7NR1Riabx6SioVBTq+vDAl5SkGBE3cWGm?=
 =?us-ascii?Q?4FAWSlVk7lcBZuW/3eEcSS7izQIxYE5+x3dLqA6Fv1MN267MQxJRwws5IvUm?=
 =?us-ascii?Q?Iwt+ylvNVq3rir8FVB9E4c0eHBy77SC0oCC3pB7utQQuUA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cFtC+QyxEDWXc8tb54GmhcTK+CrfEhrDxAYFxILIKK/vQEqw+AqDn9CBRNOF?=
 =?us-ascii?Q?Ff3OPuKSg9gatpcNvEsXYebNkWqrERSPPPmN6o7e6EshhsE+O3AvgXToTPeW?=
 =?us-ascii?Q?2FG0b/oDY321uKKzQ4/83xgqB2TINxFBUMbtTXmGclRm0QLaKmhx8gS6i/vO?=
 =?us-ascii?Q?HKdLuJPqXPPvs0HJrVcvt8RC5b8KqZoCAYIW3cVnJsg+26NodVIvq/NO5QSm?=
 =?us-ascii?Q?TVUqlw2Yx1oMqAsVx3y1bZfeCWc314wlVayPRw9ky1oZGDYFTpXdBnca6loC?=
 =?us-ascii?Q?C/3+c1TzTi5xFza8O/P04s91sTMhCI0dJLZFjkKyNNjGit8f/w7aJHYQyTED?=
 =?us-ascii?Q?VgBfNylaZ7RawgcF9prPytoEK66boMMFr7a7m9As7ExH9f/WCTj5GiBGmNW9?=
 =?us-ascii?Q?wCPVjBBeYkD2o/T4mwHzMDxNiafNZIkBxW7jc3U7WnxId9KbnZJ7o3eJK1Nq?=
 =?us-ascii?Q?RPga4YLMBzl9jOTJlxjlFmrWKBCeWlPcTCFZs3hjEBkHzvt+14RtEL6L8X0S?=
 =?us-ascii?Q?xcNOnCRxQccBE8e4Gd93XjDJd1u8YLI/9DAJSi/3L+2qN06L+t8VkH8z/Qkf?=
 =?us-ascii?Q?Dp39p2dPI2/KgTKKvKertY+Oa2sbV09vdcSOm4xCCUUBk/3NvNlAN/v9siK7?=
 =?us-ascii?Q?MpamYgd6lDFa/93Gv9VLKatmRP9oIziuUrh9Xsxm+M1BhOBePJf5H7CMZOKh?=
 =?us-ascii?Q?QxjM4ZzaOOwuOPxFphXCn1/RS+Worrk6CxIrIu+B1Uj5q+59X57pu71poGsr?=
 =?us-ascii?Q?h+Gf40OiHEuqYY1y+qEUHd7TQTqeQy80CXKxfTmbC35sJls5gVbs68B+gqPp?=
 =?us-ascii?Q?rULCkeI5vliWlBRP7HrUfw1kkXK1ftJvvTmD5wd9lekEOdlaVAFjeJWlFnsT?=
 =?us-ascii?Q?Cf6AWsGlcBta5auoulUKVzt8uoi7nb3JHZTBumXMiSrb26q9NYikbHkF2tXw?=
 =?us-ascii?Q?Fhuqx153ZlTBjFsQDFM24usK1Pd3I4qAmQxhf98bFenHp/1M3LEs/i9WTyR4?=
 =?us-ascii?Q?5XSt/UOSfSNKQwjKfmQdvOKNbny7B9KSFbG/Yda9fBzRoGa13VoF1P+d/O+6?=
 =?us-ascii?Q?4R4FtqtvuBtbSpKaZNn2ZBfgTlUu5x3hwmF+jDHZeUalk0bJXse0w4E7fwKp?=
 =?us-ascii?Q?dRDq5MvooFDHOoc/b8wQWK4fxNQSjbBLsuM50zvaCP7rZrGK/IxyzkC4s1d7?=
 =?us-ascii?Q?dHME8IMPuG23Xn6aAfFAUZPg8Ov5c1j28b/R6DVC5XhReCkFpToUS3yKNNWy?=
 =?us-ascii?Q?cv4GA17mrmtgDd+3V0eu1vVmy0oKju+jJrKtYQoR2x62z0FuY96HPa4WaPsA?=
 =?us-ascii?Q?vvYS2ZhqHm4lot5JtxQ/OO+d8zKpq1ZCZ9+dbKqZP+UTpRHmhTAVGeaPMTdm?=
 =?us-ascii?Q?5pWVEpGkIZcmW0/mE6lO8ZgmkdvFFqhE5Xwi/XjGjZCA3y6VHn5Ax7uqTQFf?=
 =?us-ascii?Q?stFO/NSne3ccg6GtTUpdXpZKZbpKAVNEmT4pcS6J/qFJavrNNoWkUVcEgQvN?=
 =?us-ascii?Q?m8z+CUak1cLaaHfHe4kC3aw/N9pvuRonsw5TrO8aHGWNqiiIvC68krEBl/L1?=
 =?us-ascii?Q?mE+tupzZXn0eQmrBEpEjilePt+8UlOcexPU3eK5o4D1pW8gAqwfKgMGYAyya?=
 =?us-ascii?Q?qQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WMLlghRIvxRHAOuC6FM6nDAkwrAf/VwOF4Mbkjyd+x3X7Bls3z8QpOmOOm668497BRe/4J4L6vqm+/1IIDGOA/POLDj49RRoloSqGFRcjaUpbOyCDvmlL2qSYZtDEt8SH3fScELlmo6k/KSqFNROsJssHBAFtTiSkyH7Hx6YrHYqc0tC3LBe+c5r7Fzn5TNj6dV1SXtLt8HlFOzpjGnzg5CvZrulQaZO37bfS/2ukddR6pnaus9Kl5HOQX/WoCvKYr5wKnJ8BL1/zqYQVqZund8wZy8D7IAsH56ST0gFi0Z6hAhT+8roLzxMt6lxAT1qXhuD/rwB4ZQsxHThhPGZtus13XJ4d0C099KcUg6h9PXPzurKny407Fudo2jh6i2KZ7+6XXWi7zgRoj5PSrXSJfd00OA9xeYEh3Zv0RbqJLlqWZHpTbP/RAc+5pn/8Mr3JojJ0nmIlpKphVp1v8BOokP50sirdzy60ldIga/LCxxDbjTyL1xkKpcttkSJrbM+3dEDfInn0RvsBdlySTI2oiU6+ikuuij7mdj3H/aelWz9TNKmLFPMwjY1NOuHRvxFkoT6YCzHCJhKoZwh5I+JyBa6JVvznm2lzZJ3w4A+zmg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c9104bc-7d60-456a-7932-08dd75bcbf67
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 10:12:48.5069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tm6t0Q7UiNy9HEhPXDe37H2eXcJb/pIHXHw7dejAr3lrX2pu8dME1SaFuYFPM/dkuM4dFjx4kh9FYCJ+P2lrLyLvsLbJXFB/5VMurt3PCEE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6335
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_03,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504070073
X-Proofpoint-GUID: Kt2LOKANK-9eJ2MsQ1xhqOAxPDDmw52Z
X-Proofpoint-ORIG-GUID: Kt2LOKANK-9eJ2MsQ1xhqOAxPDDmw52Z

On Sat, Apr 05, 2025 at 08:24:03PM -0700, syzbot wrote:
> Hello,
>
> syzbot tried to test the proposed patch but the build/boot failed:
>
> patch is already applied

Not at the commit you reported on syzbot...!

Thanks for trying Edward, but I guess maybe would have been better to just
point it at the fix commit, though having said that, I tried this last time
and the bot couldn't find a working setup after I think 2 attempts, so I
checked _manually_ and confirmed fixed, see [0].

[0]: https://lore.kernel.org/all/bee2d5f5-db93-42f1-829e-3fd250649ca8@lucifer.local/

So no need to further test. If we get a report post-the-fix after all this
even with my manual checking then we can deal with it. But we won't,
because this is resolved.

Thanks!

>
>
> Tested on:
>
> commit:         f4d2ef48 Merge tag 'kbuild-v6.15' of git://git.kernel...
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=adffebefc9feb9d6
> dashboard link: https://syzkaller.appspot.com/bug?extid=5250c4727db03e3436cc
> compiler:
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=1529dd98580000
>
