Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1501FFC7E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 18:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750443705; cv=fail; b=QgMw1HHud0N3Oeox8KV/wE4HhRBphiAwtrdk9maj/uKuaRjAHcb7w7XTExQERbjys2Dbw1Njr9Zo6EPsJIz2ux/kHPs7mM0C2dgUksoMA0gG5rCMuce4kaUwDh7ah+8/L3keLYKNX217lpztDM+MP+mW0Dtvvw/As6p47fjlyl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750443705; c=relaxed/simple;
	bh=EpY6qrNf5+ZtNcqHUvSzUGXwkOed3JY7t37UR7fxH7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JiyAL6BKsF5i6i5J7L5lIQz/G+12arvSGAmzV+NTohKJULQu7436M9AH5CGsOTRECNnwZzdspfjSXwzo50glYN5ziF+3T/AOy16MDG5dfXxMabfX9kpnzPLECx5Owk9K/8EWke4eFlbdFU9CHGiMCK24oZf0Ffu2curkKdv+XZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QcYhNwZy; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qIaVViIy; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QcYhNwZy";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qIaVViIy"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KEBlXt010407;
	Fri, 20 Jun 2025 18:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=cVOHlMhT+a+fElL1Ha
	ZSdcEOX/CimoRWi+sbp1AuNe8=; b=QcYhNwZyb5Iu9+AUOo6c4K2PvwuLLpBnws
	6QaGdCLbAouTD/AGn5CKxZxquDjUMRietHSqvbI0SYk6tsiqs8VCBzmmoePHXNI5
	xu6MYUI/LFfUBu1d2M5UeQcfpnjuOEnq3RKyXaQFVLDcjvl8KXgPnABRl0rQexpP
	koUMcGavYPK0ZYx89UTpwjV86iaDKQShVQoJG9xVVKzWJj4IuaED4cYLzDX/wMUs
	OyP3JK08oA2XIwmFG+M+ReHdnsHH5ozc0I3Z826mfY9f905vaAxA0MM72CSj5wTZ
	ZUFGKzkYfNHkNnvlU1MyHk99MVD02HxTlueUHDDdvv6UcHS7PYrA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yp4v9nj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 18:21:08 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55KGw1CR022761;
	Fri, 20 Jun 2025 18:21:07 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2082.outbound.protection.outlook.com [40.107.94.82])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhkfp6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 18:21:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sa67kLISJ/BUd1GOWCUgThKdSjEwP3szTsOgF3hLGzVAhAVumPY+mWk+1LtKMdsiBPAzVdJSU7h0WYYpcxoT6SykWjRMhz8+58CPToY8+zqVFb+UQFQlaOG5ywIvqYOvAEvCDtvc1Ho731BgIz1VNByLooEM6UOf1bAi3VavA1VT0ORSBtbtYd6j4NOQfHLXoSmzyTIUqGYTlIgYyCBEnEttRi/A8TVZfKVi482eaLRX6LjjTz+QHl3bGZZcgytk0pgyFfEyqUVud+JB7BRI4yGrUuHazrahMXKnehd5lnuiUmQWLZBSO792w1XcynK4BMp695M0Batyw40o7ThoPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cVOHlMhT+a+fElL1HaZSdcEOX/CimoRWi+sbp1AuNe8=;
 b=UPDNaOWGCIDKOVn9p5AkGMYvHnMBbSuKUfbXU2Q48jvMKzRRFI7QM13+B8kcsC/421R2tZ7lFJuCK8ZV9LyqkweGOW0zezAVzQMuYkUYT1eXm9s3FkJ+O99GtyoMZMX0U4Bi7wbayjpkBYxXZGbPsMjNiaGiQ0SnqP9UI/Of6RCe/m2E3k+8HMSF8SBW1RV2t6gZsJl07SbiBCS6bYYfQIblG+fCnxcqUbVhpIpeIp3pyPF+fHMvbiYzZ152n7ae3yfa9J4qd5ZLxUWbewxq5uD5TsVOMa/hOQ5IRhodK5wjPUj/GXqgoTw7mn7x/Ffq1YIWIxqeTPo93lsRf3Ywpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVOHlMhT+a+fElL1HaZSdcEOX/CimoRWi+sbp1AuNe8=;
 b=qIaVViIyrmvajRgACwZkT8CPrn/ONOoYHLFuwdYn5yT0w72Eh4zkkf+FX35BxkRWppRAMvco067vcqMrLDn7PiyQEmXG+8ZbS+zPfOOU4TxQxQvCwaHCU4p0txwK0IKi+AuklfsRUAYSXhmsfYxw1UUjiUs57iDGEglwwvbfswM=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by BN0PR10MB5141.namprd10.prod.outlook.com (2603:10b6:408:125::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Fri, 20 Jun
 2025 18:21:01 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8857.020; Fri, 20 Jun 2025
 18:21:01 +0000
Date: Fri, 20 Jun 2025 14:20:44 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: maple-tree@lists.infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, stable@kernel.org,
        Suren Baghdasaryan <surenb@google.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Hailong Liu <hailong.liu@oppo.com>, zhangpeng.00@bytedance.com,
        Steve Kang <Steve.Kang@unisoc.com>,
        Matthew Wilcox <willy@infradead.org>,
        Sidhartha Kumar <sidhartha.kumar@oracle.com>
Subject: Re: [PATCH 0/3] Fix MA_STATE_PREALLOC issue
Message-ID: <7s4xwshwjlsn4e3r4ndxwhh7nz2ztcd4t3zsnjepeludto6j6x@qf7b36dayfvv>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, maple-tree@lists.infradead.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org, Suren Baghdasaryan <surenb@google.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Hailong Liu <hailong.liu@oppo.com>, zhangpeng.00@bytedance.com, 
	Steve Kang <Steve.Kang@unisoc.com>, Matthew Wilcox <willy@infradead.org>, 
	Sidhartha Kumar <sidhartha.kumar@oracle.com>
References: <20250616184521.3382795-1-Liam.Howlett@oracle.com>
 <20250616162404.9f37908a11f5bd46f2362fb9@linux-foundation.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616162404.9f37908a11f5bd46f2362fb9@linux-foundation.org>
User-Agent: NeoMutt/20250404
X-ClientProxiedBy: YT4PR01CA0263.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10f::15) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|BN0PR10MB5141:EE_
X-MS-Office365-Filtering-Correlation-Id: e983e2b6-90cd-486c-4b85-08ddb02735ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ssZvCaxN43ckVK1W8Pxa60kYISAZxPh20j6xqcofw9YW8Lf2Um+cmvNC5DqQ?=
 =?us-ascii?Q?e1+qjfoPIvWbbYEKqrXvieSQylSiIQLlxA9u4nE/I8wt3HX81MX5B6vDBRfl?=
 =?us-ascii?Q?GkiKUPntgxK2C4VccfEQJxQF8sVIxYXkwOeF+wNcQLhqp1/xJMbusLY3Gxo9?=
 =?us-ascii?Q?vIcRLG4nKWFJGTjRlzQ2wl71E6z2BhedbIcnJ+Wx/PyvabjsffsB6sK9B1pN?=
 =?us-ascii?Q?+QlQvSRMTutcuHIFi80vWaUQT58hMcqOkNJYK9/bTXJZQ9lI35er72yXcvGB?=
 =?us-ascii?Q?5NpgedvZkqzkxEHtg0n/TVXswHYWxL0fkb5DXjFHdbjACANg/WSCfine+Gsl?=
 =?us-ascii?Q?awHUzV7SFK+EhASAFHvOnQ4zk8Z0i79b4N8pox+rVPZVBhca1Fo6FFdkK8QB?=
 =?us-ascii?Q?PU9k6vDLlPVtk4R2M9dvDqw+lIV6zdmVv7OaHNdyzMjKcnY1Wyguq7hqAcKc?=
 =?us-ascii?Q?wRNbCtU3Eo2IxKtYL+m3XF4po4R3MFVrZMTD4Vltc48VRSgglayzQlpAxk6O?=
 =?us-ascii?Q?zYFIIDP21dzMaZs2JUaXM0ooH5GvhQcqLNqmHOrngJ/9i2h4qfOFgFoJhVOC?=
 =?us-ascii?Q?n/yh3/omcFwnXlAev/LiUnuD8ExgQ2fNCRQpdD9dwhLlzm3KoRM0qzXZCQD5?=
 =?us-ascii?Q?tadXESl16kP91lfQi9ku+XgZI/IMKb0Bq0URLdD0A0S4BuKtY7vGaMeG0rA8?=
 =?us-ascii?Q?1FxWQNCESFAvqGfbBmy1HCdaXU8c15LuBxZBuvUcQOIC6yeHyNZZFlKjrfyg?=
 =?us-ascii?Q?Ou3spNnBh1bxyVrpSdRtBfBO7Z14gF9Xz3T2Ok49tmjF7NLoc1qLCgs2W6l1?=
 =?us-ascii?Q?k+nZ7AIZJqt/lh4CCHSS7JfKip3EYYbrdgJ6pbSADKJcdvG13nmq4C90VyNG?=
 =?us-ascii?Q?3ykZD9/HfTf35Ha8lLlk6hnFj5hcpKzp00+fiE0HWil04DP5tvQFwjnfacRF?=
 =?us-ascii?Q?rT//yAwnTKUuQAzPcnjbkZ5YPLOQDEl/nmf1jOYOzxejXM9g97ULoM7EKAlm?=
 =?us-ascii?Q?LRTk6EwPAwXYBdwf0mqPLkwhqPnOEvf6/WqkG5NeBK2/2NmSOe/BlIxUx7lf?=
 =?us-ascii?Q?+cGCWU+tAF/ri4RLWMLonwDVCHK/tIv0wPI71wRkCQrVOkAOWv2kYyio0ALQ?=
 =?us-ascii?Q?p1ko68dkcWSgU9vBLKCADPwdA9nxgFHhLD+VDzslHutCRhpCJ05ER1Us5c3L?=
 =?us-ascii?Q?ked8FJDFJbRgQyq5r5XIkYiobLHnbhI8GG/DRzr2XseMFfI2qnIEjC/I48Gh?=
 =?us-ascii?Q?1ulJc7O7TgIu79UDob6ORGvWhf750NOi0idFG8+G2hS/WkSa2ehGHfoDFHdG?=
 =?us-ascii?Q?UQ7J0M3vuScgP4Ro58Q9GMbUvC5DMsr0JCV9LwLnHyPQy9gOBcoH6q48mW7E?=
 =?us-ascii?Q?SA57xRKLxMh/IkVvhw9D6xg3EWjWvnsGwVoYFFKiPGIlrDFv38GPDNKu/3Ro?=
 =?us-ascii?Q?0uDnEMfbWoI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?96a4CwiDYXq+9giueq+DoFu884LX86tQD3KMZnGwGztDRMXbCmtWbHMfMHZ0?=
 =?us-ascii?Q?4EsdOT2fSe7Ye95OKdZ0zWduh889mqQdpl0ha8xqLNJ2kP0wZXNhX7FVRdX6?=
 =?us-ascii?Q?+sGswSKE505mt6v+hcl4SFEIdULiO4fKbQJxxSyxSpBALkWTXO/GSs1mVF7N?=
 =?us-ascii?Q?nunGXpNrNJcsYjVX7a2GJbG75qe00HosEtLLMdMzLQBmNv6P+3es3jDjdkbU?=
 =?us-ascii?Q?CG4os0t2G4McPKm8h7hQYr9pbdV0mNww9CK1S++FlQXqFjTWEhxhnfOIlc2y?=
 =?us-ascii?Q?1IrOT9C217v7FRrmn35Tk3YwAGT+cBodwXrQu3AwncSEit83Q9FdOECpP6mr?=
 =?us-ascii?Q?Xwu/I2j8Q9am7Phdchozw5giSJQl3npCsBZuvmXXWXKBR56x8petZPZYdmFH?=
 =?us-ascii?Q?HtG0ChLHHjbKNMQLTSN+KfiG1Xv1lXRtNc0bvKMgKYwA67Vc/VL97htQlDXZ?=
 =?us-ascii?Q?Eu2vD0LJzUpiZYnZ9FNns9GZjTUm63lU80jAx5aq94Ut/YUVvGHzGu10ymDR?=
 =?us-ascii?Q?pw4Mezi2Id+iUVg4mvHNpJZOWOKgPd/vv/Rq7BjKO9dSsZdiI+IoZxtb7YTC?=
 =?us-ascii?Q?ZZOCtuBTlAzL1Tv0Hcci7itCh2ecPgnqVL77eiTv4irrUA5SXILubqSyJPIM?=
 =?us-ascii?Q?SVeoR4IPXJY4b9STEqz2lA1GgLuIKZGIB7kmEKZT3G3VvJIykHbPGynZ4tMh?=
 =?us-ascii?Q?3Parcgee6MMR9kES7Jnl8OwzDTsADT8iFY8kIXTgKwHyfPhJ5XuQpL89agil?=
 =?us-ascii?Q?nxMks5qP4rxSAOyz6l6LjrTwvQu/0ACnHGZMRfI8UtLYHtPaFHoIT6Qehcks?=
 =?us-ascii?Q?/A91YNQ4sXgOfwegeyfGocY+vkEt0Vl7ty39Yt1q0rtY9cav098U3df2qq71?=
 =?us-ascii?Q?vRWFbyrwieTR1XkaHNydwJTrx6DUurug6JhZkFyD4YZxF/FxCasyOZd6Hh60?=
 =?us-ascii?Q?iHneMitz0ntwdcQjyhvIGhy4zq4JYcKl9JsCHvsP2azLhMZ5Qcbm09VaxMac?=
 =?us-ascii?Q?Qzh3CLTtSQcuTt56lfqQAzKEB6e053S9aBFkH1VXl8+OZ+wT/1nI0peOynmU?=
 =?us-ascii?Q?4ZCYP2DCBe/Ka1bwVIkIfrjIpoLVHj9nWTGp8QjHgZeO7CP7zHH99zxwG9GN?=
 =?us-ascii?Q?nFQUNykviM94zSvHUIKeY7INuXDRRN2QthiLW5OzzJIuvV1Ujfh9ZVzdJYZk?=
 =?us-ascii?Q?s/8DFq4lcKeePqu5fDue+XWPpSgi/xvX3n6m3PTVoPQvcUzqEAKE/qm5bAFu?=
 =?us-ascii?Q?PuuydOKBI95QRHfphJKLAVedQ9HAo4Z6IpvUTb50Tus5yqXADBWzBTZe9zeh?=
 =?us-ascii?Q?DztkTkPqiYqme7nZKRFQpGSdeBC7JXxZczMhRs7BROfDIw93G/UmhkG3089z?=
 =?us-ascii?Q?twjB72mhq8+qC7QSW9A4FTL1zfDS3qR0HErdwouKMUqVr3wJMeg0itCQbH8h?=
 =?us-ascii?Q?lGi2b4GmkDc6Cn6qqz87pmULED74qgCjNDZIsmMut5C213xNEJxuj/Cx1kds?=
 =?us-ascii?Q?apbazUbkND6X4GTDa971k+HYbALoHqnWBU56Th+Wi1ez5erHgvUkemiDx2A6?=
 =?us-ascii?Q?/Bf83OayTIOuqlWV7lf55AXi1LMpwNPuhq8IB7Fq?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fW/crgdGCULqaIeVLkPfx1hBak+dqSSATfFlJ981oIrTj2SRTxQEuGvpMHlax9LpA/GYm+7BnMX4PoECls5EhzDgt5pEtV0fjb/znH1jJW5cgObC4h8SN+S28v43hzXmJH+W2h4fW3rrPsjq6UP09yBmk28ygT5B3lnydc69efN0j+jqfQqMuXwoexvMsAvsIpAKJJ9yuS5e4JG94UbK1B6PNxzfua6oyoDd1Wx1Uw689rBtVQMxl8XjMsERpn85wMuChywshtc7zSySPGwoEK6fw4j5LiY/U7jStz72TjZlo6EXggxdkgIA0QwuFKpw8Lrxvad4cS1Ok+WHI1A36Pud/DropG6lOqwELRE7k2PlzT3M4Ji8ICACdfyHNrIXAnifO2CjQLi81OVXiZa4p+4VzqHflPwM0IxSxYXEjT2HD+EesOtVWkSEYPXc1+3SsViWlW49c+8d47pNdlHmmKzq8XWWxuCDWS5ctIlNtTXrWqQYEAUlAIXQUsG2bI4CaUrJWBb+xb5ac2fnOVHkoaN9g17SqRdRR4HAQ1ssBxj2/pp6ttjMiler4SznAR/9V/3lfypF+TDJRU/PKlwX7SejN/qYCD/KfB+OBx3UyPc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e983e2b6-90cd-486c-4b85-08ddb02735ba
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 18:21:01.1976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8TP2V+rZ6/nBgX7v/W84kunxZSkx3EOl0C3m0pivCbAoacfvRRHmVxIC6c6pXRlsCme/xznZdePzmvyl2g+Zmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5141
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506200128
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEyOCBTYWx0ZWRfX6AQ9OyO8/Du+ oFkP+5uj5RTZOZ/25VCuplU3DGYLLf+lUCFBITOSY6lMGqo+z0IJlWSXQiR5OapJI/jBJ9jv0cD y+Rb1saU23pNlOzpeCEIRVdY2/mFJLqam3aTRs2dvXNkQ0IHKaiDFYIQE02VRriMSYqMYGy4rRi
 aVVlSY2Scq0bSyl0VEwYVHClUPOZIx3KK4iYRKnq6lSmUD4saRqn4AjNWIR44YBe4X5oBPfqUAl venWBReeiz1UH2NSg7jck6V8eEwxk73QnNV2a4VC6mMb5iyt13RFLwtv+Gv8Lnhw1uinPDBuTr4 JPrDygtT/GqcKfBFujTecpI13A3E2KbcCoozRqNKXRfzRGMCVreA3uFYXuiwlq4Hz1S3cpxfcxI
 EM1uXySHF4h78jgu3xsuSq4HIwX0cCNUoopVq/wjkcPKdpMj0sMRnxa5TGYmx8TdlQoL/S3K
X-Authority-Analysis: v=2.4 cv=K5EiHzWI c=1 sm=1 tr=0 ts=6855a694 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=Z4Rwk6OoAAAA:8 a=yPCof4ZbAAAA:8 a=CRw10E434VxNtBuzmngA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10 a=HkZW87K1Qel5hWWM3VKY:22 cc=ntf awl=host:13207
X-Proofpoint-GUID: 2xpQZTaSZGJ6vNA9IAoTydyarPyKp5qq
X-Proofpoint-ORIG-GUID: 2xpQZTaSZGJ6vNA9IAoTydyarPyKp5qq

* Andrew Morton <akpm@linux-foundation.org> [250616 19:24]:
> On Mon, 16 Jun 2025 14:45:18 -0400 "Liam R. Howlett" <Liam.Howlett@oracle.com> wrote:
> 
> > Address the issue of reusing the same maple state for multiple
> > preallocations calls caused by MA_STATE_PREALLOC, and add a test for
> > this use case.
> > 
> > Included is a change to the testing code to reduce false positives in
> > the rcu race testing on faster machines.
> 
> I split this series into
> 
> - a standalone fix for 6.16-rcX and -stable.
> 
> - two standalone selftests patches for 6.17-rc1.
> 
> Is that OK?


Yes, should be fine.

Thanks for checking.
Liam
