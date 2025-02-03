Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3783C209677;
	Mon,  3 Feb 2025 15:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738597534; cv=fail; b=I1NG5q5a4kM5Hb1wcryyaZbl1GiiabbWMfYUH2pvrZtm0/Ssip6NWRf59s3Np5pepvd6AcSiOtWKoMJU7xU6AjKWBL+YxCVMs+9mADOGKsSTkvIG/3Ue3Eeb6qN9Xt9wV8+U6cudA3iLOKBNqC0WzPovOCmMrCxVokQu8AirwqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738597534; c=relaxed/simple;
	bh=qXwB5weDf+sCzbV0B7i/sEg1lqhp4CtwD/WCDZCCSu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iIL6hoKCCZsz05tH8gBBXX74BXtuBFfYe13M/XbfRvIqfdyPC/6gSIRiC+GYaIqh1kl+o6uCynmXNzY2LuHRmqXA5x0DX7pAx+uP3PSZVRDv9LKo/9wJskBeQGJG1ll5qMm7iTxNfDB/z4P8/2MeNGeGJkbS1aUmclIpUND1oBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Qd960XDK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hWTRKA4h; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Qd960XDK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hWTRKA4h"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513EBqwL021844;
	Mon, 3 Feb 2025 15:44:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=vLg+yAyJ9yrlE2alTI
	++zuch7g5ozhWQTbKehwGTt50=; b=Qd960XDKwtAR3bXNAEXnRFU1Z4d0ppjOkC
	r5/ja00uULBXV4am5p847dHN7jtngY/tEM9FxjZpiEFqMf9TVXYq+Mr30Nu08FYn
	hz8t2WPwqSKwvpDujMumnm0dZQ675AeCfIP4PL3RUb7EUigx5qAEqykM/LnU+t5c
	HHTVz8x7zMBn5gksCV4qlNQe2p++D2OfKYTdkamUMj9uLCygAYRVLzmoowNNjO3x
	MM8MVuQzgr7L0axiAJ5uM1bktv2BGGHQiigSXffEsAI3yzRsggL6Fneju0K4PYRq
	BLSWsdA4+HnC6z+O5tlIkvKKE8RrBRDe+9DdDKXVxbOQe0H6lyiQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44hhjttvkr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 03 Feb 2025 15:44:50 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 513FVq1I036259;
	Mon, 3 Feb 2025 15:44:49 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2047.outbound.protection.outlook.com [104.47.58.47])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44j8fk1n63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 03 Feb 2025 15:44:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9OVlPUcCnRv8bh50oyZ2PQeEtIKkbwyKu+umb6JylpauWo/j2VgQPPCOQLP4m58NLA4RkSsF+VC3vPDJL6FKbvZsq1z/s93N08mMODgoBVigAqK1smzR+e7afltP8emaZiRIteDY52hR8NnviUmcLV23L9jgQKZphA1/MxzUrd1/ZBwjJco7p3Hq0IyWVs1MJapnMvlW+L+rlxZtemFWaOK8LeCacdPo+SC1pGsP5XTmPNHa0CDyhiNDEDU1bfDPUppvCBei9y9Gi/PT9NUwFanjqbTPJxoN1t+utr3ohvxHTA2BRc8iHLW4R98YBF5FwSow75nOO/nJMWNMxNnbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vLg+yAyJ9yrlE2alTI++zuch7g5ozhWQTbKehwGTt50=;
 b=Vw54K2CZUuZFkAFfH95bfUvTje9nbhBL3IiC7X+UWcv2E8zPtC9NhP7++9BPNAaDCCdOGs6cqnn/ZpyIj+bhx3zUjn5u15HWmyZEDR7/u3PXd2x8fupnGfnQ7niFXuSkIpWn32vraHoOpY7lwVoyLBl+MJG57kRnFlx401NjR4LCPriWOxALJhJh+Pdu5xBlzjhkmWfYkghBqgSDGhMN7W05OfPGl8yAcVdnzRneHnqjWZY+G78uslWcuRkQDJSmVDX1DJ8ZEVoQ0qtqXCueK7nqLM4QovxOPPfD9z6aTnq/BNe3URuHEosov7w7HgCUuVvTxAZBRB9dnJcr8CldKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLg+yAyJ9yrlE2alTI++zuch7g5ozhWQTbKehwGTt50=;
 b=hWTRKA4h6juRTHr75Vo17vLHiRTcPLVEl9n7oeJnjMix24aCq1pQo+2d++S4xqiS7yp4h1aUQtFlgukMLvW8zE16jLwefb04mrFd1SLVjm+ySagljTSz0HesOQJEwVZqk0xIz2g2Qm/tFE49FdQv62geg79I7gpLiKwzUnGWt9s=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by DM6PR10MB4188.namprd10.prod.outlook.com (2603:10b6:5:21b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 15:44:46 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%4]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 15:44:46 +0000
Date: Mon, 3 Feb 2025 10:44:42 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, John Hubbard <jhubbard@nvidia.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        Andreas Hindborg <a.hindborg@kernel.org>,
        Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v13 2/8] mm: rust: add vm_area_struct methods that
 require read access
Message-ID: <r5xkc2i3tk4za3xkrrvbeqto4kf5l425ursytc3n6tmcy2gylb@eusudybb5dqa>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, John Hubbard <jhubbard@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org
References: <20250203-vma-v13-0-2b998268a396@google.com>
 <20250203-vma-v13-2-2b998268a396@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203-vma-v13-2-2b998268a396@google.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0010.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d1::17) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|DM6PR10MB4188:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f554dc5-1420-4c28-9597-08dd4469af6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Jn9LL+B1Pa+eMx5CEaac6HaO70HArOAPzkqDLXpaxElHwNDBnKpNBd2Oic1M?=
 =?us-ascii?Q?eo/rZV60oL5/eOVq3O9iwncgDS3OY3Y3frnG6zNPJvZBJBwZOUqhF0DRRriN?=
 =?us-ascii?Q?+IO2DTaIpjafVM5CQVlwuLWrIz8HPX4TTnaBzUQgIVIhoa2CVhuwWwu5Thja?=
 =?us-ascii?Q?97UlErIj3XHZobZUXuVFHIA7yCzGCjXbyX1f68CZr7RKMlx9nD2hTtc8+DQ3?=
 =?us-ascii?Q?n0mnjc5uHWaiPiPLLWeKyYcDvgFEjfUiYB0jgIvluVKybztNBO0XkGxkbBjV?=
 =?us-ascii?Q?uQTqHc7Qgr5M8nUumsyyWE0t7GnjDJEKLH6RiqacfFenkuRiq6mCNjYEdMCL?=
 =?us-ascii?Q?AuZS7iy77z5fUaPBR3CibDEYJrLBzKGL+U0tbn2+x5edCwGmVOaqhLR9SoWY?=
 =?us-ascii?Q?KpsZOrsy/Z1G5t+SYlBckA8nOF5PpvVBLUdqk8gEiv5Kaap1uSnGdAabqy5n?=
 =?us-ascii?Q?LJ9lUb2FFls8l/OVvKNnf7fOjLlOVF0y0ALjFJzhukFGwGke/mSUe+8DBVRK?=
 =?us-ascii?Q?FHPwEBGneiDDUjuFc4jdVZTB78cVUgrubLh2osZeaJ+JsqyIWkH+iS76Lu43?=
 =?us-ascii?Q?8sjyJ2N8d06hDoCMTrqG4tO0DHp/42vgD3HPWpc9r3YsKvA+ccOOsRfZ7KKo?=
 =?us-ascii?Q?eY5t8lqEZv8LCURDjK6jGz+nWEO25PACa+FaO3n3AfdQs/wv3W5WOgLEzg6q?=
 =?us-ascii?Q?2oWuOfrTc+It1J8JoZEyIcm1DVpOuXTw+mjOu0R60ONklezLdMYlm4eSvepO?=
 =?us-ascii?Q?dcTPGlIZtTptg1FF7crUoNi5LT19YXGCRj2Hu0BU1+23hWoEdzPmASB98Xjo?=
 =?us-ascii?Q?xZJeG7CZ1o8epxHxdfgPN1lb8hY5S9m7bA3A7xIIaKySvr0C1P2T34vrup21?=
 =?us-ascii?Q?mmOVWSS9AAZhsPLj5Qg6FBSMainvqnqQlJasKDP54r5DYRhHTVFRYCjrrGma?=
 =?us-ascii?Q?ntvfhqA8dKHpDBgNJRBUdRSJzv5PK/Shqx4/aiYvUJCzkbnwFpfLjoolT3pv?=
 =?us-ascii?Q?vE1tf7gM1dZP9dyXT7Gd13QijUvsMn5AmuBKPlM5+BZ/bxVGV2d//YsZ+VK6?=
 =?us-ascii?Q?9t9/JNXsCZTS5X2a02ZoWct/oX1ruf5UL6VZibntmeULlFgVqMjSyPvAH63Q?=
 =?us-ascii?Q?YDXcZv/4WRbmwop9MX4m2TODsbT9u/iU37G5a8Hh+fCS+Wl/4KrPTKL837F1?=
 =?us-ascii?Q?w0NvxUyYJ4HPd+oiMLFAilA7eBjbYjcsCc1GbgGh694zgrcg9CY7wb7++dqE?=
 =?us-ascii?Q?SZNis1S0sQuUetk4rorV7gm2z4skFfB+0DmbaJ4t4aJzSsjTw9SETT5LmNWd?=
 =?us-ascii?Q?Ghog1FMRGeztYH6R5dAycPWpRt3q3dWK1gJy2IYFcB6Hm092GO5xPxynd+Wp?=
 =?us-ascii?Q?5lhxMuDY6E706WU81HwcyyIfiG3L?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d6Zy1kad1pBeayHxr9j8/5YNtrxZY7NHu8AldqkTz76WG///KxuDCSr3X3F4?=
 =?us-ascii?Q?5OiD9A4FU0AjNUXfaiim8ep7TeqDWLwMZ6UVqnXhiZcL5b27/2JoVGNrkLyN?=
 =?us-ascii?Q?cuxPaclERf8aOZGHjWIlZ2/V9fy3YEc7voBZPbCyYy9H2pQdQvsnVLX862fA?=
 =?us-ascii?Q?ZkeclribTd0l2DNJkuYIeHUm38tCvCG2oAjCBzHwItsEGPwrvL8mfsmqTdyH?=
 =?us-ascii?Q?JF+h9rvKxZLHQS/cY807mp11Ow070/+Mp5FUDAYxf5l5rJub5TskaE3tMpol?=
 =?us-ascii?Q?IupAWcqMrEn+edY5H64mEYiF0XqtH2ZmzVkyjxb0C30pmom1PbFtzvVdyy4u?=
 =?us-ascii?Q?euS2/U+B3Iw/15W55/UaTccfvvMk3hOtt5+sPV+mciY6Kvfa37+sG23NxGKY?=
 =?us-ascii?Q?HbTXN0lstuPaxwuZ3mesAZqc9aEaj87Xe0oWRm86h+WovfH8le/lmB4n2Y0d?=
 =?us-ascii?Q?HqPdEdj8l3BadR0Hm2ExgUMbpPJsJtaHA1Us/wSqkPFmlKXf+wR2CDeCi4G6?=
 =?us-ascii?Q?AfxwnhUzLkK0s5SA5ztopvQHfvpQrzWHX78s1se7r90VuZigjmyQud3KLblF?=
 =?us-ascii?Q?xM1qSlQKeS3btNRYnZqZqubiCJjFGMLLTCn6rreVM0S/SdwKcEz+r6EuJGBk?=
 =?us-ascii?Q?SbMcNMnbLFABE8l+ujADwN5YTgANO8/YND4iexgM3GxHeVjGnb1yU3BzUR7Q?=
 =?us-ascii?Q?91Uzey0UyAJwPQETGHx7qsRcMl6ssGNqbFpsOYWYs/Qkc2WJp6vLGjtKqyNG?=
 =?us-ascii?Q?89lcTdDM8R6imk2jjxE7D/nw/nuDuFa8nOJsAL945ur94SxaTxcNKJKlJ/93?=
 =?us-ascii?Q?MIzdiJHhx4Z0BdeQ4DCKj3wKLPkcMC6I4LVxx7KoqwaDMQaleB/EVpKLWOYs?=
 =?us-ascii?Q?1wbYLr6rK4+h5OOUSxqeuQTYZMbp4gMzGDpaSgo+VCz52emdBa/KfYSNKNi0?=
 =?us-ascii?Q?eJi/RwwIS53qARf/hH98bFFosZ/YbY8Um3DveJ7wfB4GstHB7kc7BPEy5Dw6?=
 =?us-ascii?Q?hQ7K1LM+ULN+3eaHTWLat1VlNdtKyujjUxO/EwzOZupJNSw4NuKq2x9uCxdu?=
 =?us-ascii?Q?ujncbwOFAjHLY75ppdciurjcZ4sxo3o4zVxtHsNR+z7EFZiEeuMsvwmGJz59?=
 =?us-ascii?Q?7QYXoazX5v9UohManDlWvWwc7PZPORzVTpLeJ8XQg9mg4i8KBMnMmaqciura?=
 =?us-ascii?Q?Vg6hfUwQfEwICdSZHa1QhnlnD3sBbnXc9z+y5/C6U+gexIjXXDp8e1fG3YYV?=
 =?us-ascii?Q?vfD4tEPL1T9jM1l5+VK7d1WDmgzaTqDPx27OWfcVVtWKED33bPvfjSitMJP3?=
 =?us-ascii?Q?f0BOg3RtU/98ikKsgA1rYHz7AR6+8qFiT583Srw8EonLqFMf/7as8NYfa3yC?=
 =?us-ascii?Q?fzmpJFOQeGUA/xrH7p0b/N7bODZiAioa6EQ9szows0qucmTUCNTUbq1YyFwr?=
 =?us-ascii?Q?XVok73YEelpccsBmrzshrDNH6oStr+icmJUXdN+SQ2dxr4ZlKDib+OCNTruh?=
 =?us-ascii?Q?iTDZcbrN/uRuJGnVRW/qd8RqfkouRrU5XCcNalsEXaaoEfaJ8YjydadyI2uA?=
 =?us-ascii?Q?NmO+0GvQSL79JYmmZ2b/HQ1d0X7lqZQRlUlaNVQS?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mSsm+nPEcBPh7kKNW88UpTBEBn7ajE2pBk/i2zg0G9GoUOgp7FvUZ4+nV6U2tplXQVzV2p4If7/VadXQSrvhNJWBi2McGK1A9IepOawPpftwuhCJnF4i5J/Hw+piENY59+NtV4dVm5ux0nNiZ7lKaEjxLDJjXT/oGf8cgRZ6/o7iLTL5skSZBdn73R3Ukl6POpp/X9pdY2DySyjrT6NskCtK8vjta4PSEWyHx6sKZjVJvIOkyT0MnfkmdISTdGObiWd3xrA/5mcho6X+2FEcshL1rZ+Lhj28fcd8sOQJWF7VrLaEbKCMJtFdqCX6XF4tUCZ04okMOkaGttqgonV/VVmoyOzy7+JgU0TdhDHUrLH1pktmod4qhCKsJOHVJxNKZIRPsWN0DU9+IOxyWMHyhaG36LtIOARTEGoBVbpBBL03xrcTC3e6W9m/19DJmSPGSgVJBiUMDnjy/bqYLPp6Jb2Q+OQSG2gZGKRyBZi7qfb0+b2EWSv9BaHU2x5hDuP3HSBgUD0LOCqNdf1vYlWjkmersAIwEH+a9WnR5Hk/wy+tjt/qlJI58ods2Ga1WcpoV1VG1Ldj64Y+q4M8TG99lFDtxRNTfM6FoaDBFuJCMs0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f554dc5-1420-4c28-9597-08dd4469af6e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 15:44:46.4951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pgmMnLvWlbwUxt4wlpEVt6jvK4iRlIke8kwTGLaFa2/W0xovmwo1dtK3pNQRdAe9/OzSkstExgnph4PSe+uQ7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4188
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502030115
X-Proofpoint-GUID: VmtkOsfLvVz5cmwSAuRL1xbpECkVjl7_
X-Proofpoint-ORIG-GUID: VmtkOsfLvVz5cmwSAuRL1xbpECkVjl7_

* Alice Ryhl <aliceryhl@google.com> [250203 07:15]:

Hi Alice,

These comments are probably for my education.  I'm holding back my
training on naming and trying to reconcile the snake-case and upper case
camel of the rust language.

> This adds a type called VmAreaRef which is used when referencing a vma

How did you land on VmAreaRef?  Why not VmaRef?  We mostly use vma for
vmas today, not vm_area.  Is it because the header declares it
vm_area_struct?  I'd be happier with VmaRef, but I'm guessing this is a
direct translation from vm_area_struct?

> that you have read access to. Here, read access means that you hold
> either the mmap read lock or the vma read lock (or stronger).

I have questions.. they are below.

> 
> Additionally, a vma_lookup method is added to the mmap read guard, which
> enables you to obtain a &VmAreaRef in safe Rust code.
> 
> This patch only provides a way to lock the mmap read lock, but a
> follow-up patch also provides a way to just lock the vma read lock.
> 
> Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Reviewed-by: Jann Horn <jannh@google.com>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/helpers/mm.c      |   6 ++
>  rust/kernel/mm.rs      |  21 +++++
>  rust/kernel/mm/virt.rs | 215 +++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 242 insertions(+)
> 
> diff --git a/rust/helpers/mm.c b/rust/helpers/mm.c
> index 7201747a5d31..7b72eb065a3e 100644
> --- a/rust/helpers/mm.c
> +++ b/rust/helpers/mm.c
> @@ -37,3 +37,9 @@ void rust_helper_mmap_read_unlock(struct mm_struct *mm)
>  {
>  	mmap_read_unlock(mm);
>  }
> +
> +struct vm_area_struct *rust_helper_vma_lookup(struct mm_struct *mm,
> +					      unsigned long addr)
> +{
> +	return vma_lookup(mm, addr);
> +}
> diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
> index 2fb5f440af60..bd6ff40f106f 100644
> --- a/rust/kernel/mm.rs
> +++ b/rust/kernel/mm.rs
> @@ -17,6 +17,8 @@
>  };
>  use core::{ops::Deref, ptr::NonNull};
>  
> +pub mod virt;
> +
>  /// A wrapper for the kernel's `struct mm_struct`.
>  ///
>  /// This represents the address space of a userspace process, so each process has one `Mm`
> @@ -200,6 +202,25 @@ pub struct MmapReadGuard<'a> {
>      _nts: NotThreadSafe,
>  }
>  
> +impl<'a> MmapReadGuard<'a> {
> +    /// Look up a vma at the given address.
> +    #[inline]
> +    pub fn vma_lookup(&self, vma_addr: usize) -> Option<&virt::VmAreaRef> {
> +        // SAFETY: We hold a reference to the mm, so the pointer must be valid. Any value is okay
> +        // for `vma_addr`.

Is this true?  In C we hold a reference to the mm and the vma can still
go away.  We get safety from the locking on the C side.

> +        let vma = unsafe { bindings::vma_lookup(self.mm.as_raw(), vma_addr) };
> +
> +        if vma.is_null() {
> +            None
> +        } else {
> +            // SAFETY: We just checked that a vma was found, so the pointer is valid. Furthermore,
> +            // the returned area will borrow from this read lock guard, so it can only be used
> +            // while the mmap read lock is still held.

So We have complicated the locking of the vmas with rcu and per-vma
locking recently.  We are now able to look up and use a vma under the
rcu read lock.  Does this translate to rust model?

I believe this is true in recent version of binder as well?

> +            unsafe { Some(virt::VmAreaRef::from_raw(vma)) }
> +        }
> +    }
> +}
> +
>  impl Drop for MmapReadGuard<'_> {
>      #[inline]
>      fn drop(&mut self) {
> diff --git a/rust/kernel/mm/virt.rs b/rust/kernel/mm/virt.rs
> new file mode 100644
> index 000000000000..dfe147cafdb3
> --- /dev/null
> +++ b/rust/kernel/mm/virt.rs
> @@ -0,0 +1,215 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +// Copyright (C) 2024 Google LLC.
> +
> +//! Virtual memory.
> +//!
> +//! This module deals with managing a single VMA in the address space of a userspace process. Each
> +//! VMA corresponds to a region of memory that the userspace process can access, and the VMA lets
> +//! you control what happens when userspace reads or writes to that region of memory.
> +//!
> +//! The module has several different Rust types that all correspond to the C type called
> +//! `vm_area_struct`. The different structs represent what kind of access you have to the VMA, e.g.
> +//! [`VmAreaRef`] is used when you hold the mmap or vma read lock. Using the appropriate struct
> +//! ensures that you can't, for example, accidentally call a function that requires holding the
> +//! write lock when you only hold the read lock.
> +
> +use crate::{bindings, mm::MmWithUser, types::Opaque};
> +
> +/// A wrapper for the kernel's `struct vm_area_struct` with read access.
> +///
> +/// It represents an area of virtual memory.
> +///
> +/// # Invariants
> +///
> +/// The caller must hold the mmap read lock or the vma read lock.
> +#[repr(transparent)]
> +pub struct VmAreaRef {
> +    vma: Opaque<bindings::vm_area_struct>,
> +}
> +
> +// Methods you can call when holding the mmap or vma read lock (or stronger). They must be usable
> +// no matter what the vma flags are.
> +impl VmAreaRef {
> +    /// Access a virtual memory area given a raw pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// Callers must ensure that `vma` is valid for the duration of 'a, and that the mmap or vma
> +    /// read lock (or stronger) is held for at least the duration of 'a.

What is 'a?

> +    #[inline]
> +    pub unsafe fn from_raw<'a>(vma: *const bindings::vm_area_struct) -> &'a Self {

This 'a?  What can I look up in rust to know what this is about?

> +        // SAFETY: The caller ensures that the invariants are satisfied for the duration of 'a.
> +        unsafe { &*vma.cast() }
> +    }
> +
> +    /// Returns a raw pointer to this area.
> +    #[inline]
> +    pub fn as_ptr(&self) -> *mut bindings::vm_area_struct {
> +        self.vma.get()
> +    }
> +
> +    /// Access the underlying `mm_struct`.
> +    #[inline]
> +    pub fn mm(&self) -> &MmWithUser {
> +        // SAFETY: By the type invariants, this `vm_area_struct` is valid and we hold the mmap/vma
> +        // read lock or stronger. This implies that the underlying mm has a non-zero value of
> +        // `mm_users`.

Again, I'm not sure this statement still holds as it once did?

> +        unsafe { MmWithUser::from_raw((*self.as_ptr()).vm_mm) }
> +    }
> +
> +    /// Returns the flags associated with the virtual memory area.
> +    ///
> +    /// The possible flags are a combination of the constants in [`flags`].
> +    #[inline]
> +    pub fn flags(&self) -> vm_flags_t {
> +        // SAFETY: By the type invariants, the caller holds at least the mmap read lock, so this
> +        // access is not a data race.
> +        unsafe { (*self.as_ptr()).__bindgen_anon_2.vm_flags }
> +    }
> +
> +    /// Returns the (inclusive) start address of the virtual memory area.
> +    #[inline]
> +    pub fn start(&self) -> usize {
> +        // SAFETY: By the type invariants, the caller holds at least the mmap read lock, so this
> +        // access is not a data race.
> +        unsafe { (*self.as_ptr()).__bindgen_anon_1.__bindgen_anon_1.vm_start }
> +    }
> +
> +    /// Returns the (exclusive) end address of the virtual memory area.
> +    #[inline]
> +    pub fn end(&self) -> usize {
> +        // SAFETY: By the type invariants, the caller holds at least the mmap read lock, so this
> +        // access is not a data race.
> +        unsafe { (*self.as_ptr()).__bindgen_anon_1.__bindgen_anon_1.vm_end }
> +    }
> +
> +    /// Zap pages in the given page range.
> +    ///
> +    /// This clears page table mappings for the range at the leaf level, leaving all other page
> +    /// tables intact, and freeing any memory referenced by the VMA in this range. That is,
> +    /// anonymous memory is completely freed, file-backed memory has its reference count on page
> +    /// cache folio's dropped, any dirty data will still be written back to disk as usual.
> +    ///
> +    /// It may seem odd that we clear at the leaf level, this is however a product of the page
> +    /// table structure used to map physical memory into a virtual address space - each virtual
> +    /// address actually consists of a bitmap of array indices into page tables, which form a
> +    /// hierarchical page table level structure.
> +    ///
> +    /// As a result, each page table level maps a multiple of page table levels below, and thus
> +    /// span ever increasing ranges of pages. At the leaf or PTE level, we map the actual physical
> +    /// memory.
> +    ///
> +    /// It is here where a zap operates, as it the only place we can be certain of clearing without
> +    /// impacting any other virtual mappings. It is an implementation detail as to whether the
> +    /// kernel goes further in freeing unused page tables, but for the purposes of this operation
> +    /// we must only assume that the leaf level is cleared.
> +    #[inline]
> +    pub fn zap_page_range_single(&self, address: usize, size: usize) {
> +        let (end, did_overflow) = address.overflowing_add(size);
> +        if did_overflow || address < self.start() || self.end() < end {
> +            // TODO: call WARN_ONCE once Rust version of it is added
> +            return;
> +        }
> +
> +        // SAFETY: By the type invariants, the caller has read access to this VMA, which is
> +        // sufficient for this method call. This method has no requirements on the vma flags. The
> +        // address range is checked to be within the vma.
> +        unsafe {
> +            bindings::zap_page_range_single(
> +                self.as_ptr(),
> +                address,
> +                size,
> +                core::ptr::null_mut(),
> +            )
> +        };
> +    }
> +}
> +
> +/// The integer type used for vma flags.
> +#[doc(inline)]
> +pub use bindings::vm_flags_t;
> +
> +/// All possible flags for [`VmAreaRef`].
> +pub mod flags {
> +    use super::vm_flags_t;
> +    use crate::bindings;
> +
> +    /// No flags are set.
> +    pub const NONE: vm_flags_t = bindings::VM_NONE as _;
> +
> +    /// Mapping allows reads.
> +    pub const READ: vm_flags_t = bindings::VM_READ as _;
> +
> +    /// Mapping allows writes.
> +    pub const WRITE: vm_flags_t = bindings::VM_WRITE as _;
> +
> +    /// Mapping allows execution.
> +    pub const EXEC: vm_flags_t = bindings::VM_EXEC as _;
> +
> +    /// Mapping is shared.
> +    pub const SHARED: vm_flags_t = bindings::VM_SHARED as _;
> +
> +    /// Mapping may be updated to allow reads.
> +    pub const MAYREAD: vm_flags_t = bindings::VM_MAYREAD as _;
> +
> +    /// Mapping may be updated to allow writes.
> +    pub const MAYWRITE: vm_flags_t = bindings::VM_MAYWRITE as _;
> +
> +    /// Mapping may be updated to allow execution.
> +    pub const MAYEXEC: vm_flags_t = bindings::VM_MAYEXEC as _;
> +
> +    /// Mapping may be updated to be shared.
> +    pub const MAYSHARE: vm_flags_t = bindings::VM_MAYSHARE as _;
> +
> +    /// Page-ranges managed without `struct page`, just pure PFN.
> +    pub const PFNMAP: vm_flags_t = bindings::VM_PFNMAP as _;
> +
> +    /// Memory mapped I/O or similar.
> +    pub const IO: vm_flags_t = bindings::VM_IO as _;
> +
> +    /// Do not copy this vma on fork.
> +    pub const DONTCOPY: vm_flags_t = bindings::VM_DONTCOPY as _;
> +
> +    /// Cannot expand with mremap().
> +    pub const DONTEXPAND: vm_flags_t = bindings::VM_DONTEXPAND as _;
> +
> +    /// Lock the pages covered when they are faulted in.
> +    pub const LOCKONFAULT: vm_flags_t = bindings::VM_LOCKONFAULT as _;
> +
> +    /// Is a VM accounted object.
> +    pub const ACCOUNT: vm_flags_t = bindings::VM_ACCOUNT as _;
> +
> +    /// Should the VM suppress accounting.
> +    pub const NORESERVE: vm_flags_t = bindings::VM_NORESERVE as _;
> +
> +    /// Huge TLB Page VM.
> +    pub const HUGETLB: vm_flags_t = bindings::VM_HUGETLB as _;
> +
> +    /// Synchronous page faults. (DAX-specific)
> +    pub const SYNC: vm_flags_t = bindings::VM_SYNC as _;
> +
> +    /// Architecture-specific flag.
> +    pub const ARCH_1: vm_flags_t = bindings::VM_ARCH_1 as _;
> +
> +    /// Wipe VMA contents in child on fork.
> +    pub const WIPEONFORK: vm_flags_t = bindings::VM_WIPEONFORK as _;
> +
> +    /// Do not include in the core dump.
> +    pub const DONTDUMP: vm_flags_t = bindings::VM_DONTDUMP as _;
> +
> +    /// Not soft dirty clean area.
> +    pub const SOFTDIRTY: vm_flags_t = bindings::VM_SOFTDIRTY as _;
> +
> +    /// Can contain `struct page` and pure PFN pages.
> +    pub const MIXEDMAP: vm_flags_t = bindings::VM_MIXEDMAP as _;
> +
> +    /// MADV_HUGEPAGE marked this vma.
> +    pub const HUGEPAGE: vm_flags_t = bindings::VM_HUGEPAGE as _;
> +
> +    /// MADV_NOHUGEPAGE marked this vma.
> +    pub const NOHUGEPAGE: vm_flags_t = bindings::VM_NOHUGEPAGE as _;
> +
> +    /// KSM may merge identical pages.
> +    pub const MERGEABLE: vm_flags_t = bindings::VM_MERGEABLE as _;
> +}
> 
> -- 
> 2.48.1.362.g079036d154-goog
> 
