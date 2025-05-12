Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBB519ABD4
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 16:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747066425; cv=fail; b=pjtJ+10tAbjFtFbTg4Jk6JFo+gye7VNYnIachAbBxDkAJBsGFxVS3S/sgAUP2NPb5d14gGXW2Nkf9DddYrbOAfehccmIE4t5gypJJ04Aon0lByUb027QQZoDnTpqdYOYL+PkbCSHeZMicnP/4tUVIpUwj/s4MNUgM+8uAiIQYvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747066425; c=relaxed/simple;
	bh=7VMw+8/0sV/SPGy79HSvBJJO3HkePtIzK7nPKwraqvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dVPZW9GjdkU8I8xPLTFg/tyMsR6WLZnHx0pHL4xTHwTMiV793tYMwtH1oPfeSa8kW/CAvUrVyk7OTDRDqEyVvswDgGmBvgGYd/gfLpjPIVzYwl/H1jf5vo8vrRSpPyX75Cyd7zubPpaG6SV5XJter7nl+97OS4UUwmYZq6jOCZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=F8EDcVri; arc=fail smtp.client-ip=40.107.220.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="F8EDcVri"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FM+k9bu+7t9wMy96sDZ2v1FHxYER7rvzF7eVg1PZOcWkgzNnpCTjV+SqeOYT/AflQCHpWXxfjw+qRWPH+lruXShb683ArD2drLySBqn5lVDETf4fXjQfFTxfEWEaRMNEFfbah5p103aspa+Dedw325A5jMFbtRw/khwaKlrevjkL89p4wmWORqFiI8QHvaPZj8YNv1m4ptE5pRzthC4Cz9PpKom4Y2dBRpD4+bVMdRQHSfeyrnJCF51h3sbSfcDrKJjmF7NuUmWASSM748rz/KztgQUIBrOl24K91Fguel5yEsLuyyJGzaYlD1PqTxtxsIQ/Ecdyv7lOYr/mvgBIvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Y/RRWtkJcqzRvxOdbjX7nYrd1Xfz9gUJXOLO4HPFmY=;
 b=C7G0lTwz9l76dLhrqycbXI5wnvYTJLKj4T/N+ljcDqhSFqNctXhM65tLLWrlTGEs1P7k//yf9tu244nD2J4U5634e8EfFotuVSMY1mWkPxqZIXLxrrIm05ajMRORu2quw3mBNFu5fEkupRUCaZQb+et8iaT8KU2c9Y1/J1h7On4V8zXzv0eBqoDAHf+pLSBdaoIGW34pRCdB7gBS1IpU8+L8s/xHFHiNbop8KfgZC3Bj5H8QJ0m0KGeX8z7I97wykbeOJ/DXeibnrLkNBHJ4Or3XGsOK1HsyxDD2juvh9I0zowC/cnsqJu76TGfPPi1P098sU4FEcIfYLopSdjDQ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Y/RRWtkJcqzRvxOdbjX7nYrd1Xfz9gUJXOLO4HPFmY=;
 b=F8EDcVriEKpmVQWgza23EQNwOAFRBsNbf+PiiitkrKYywLDog2vLUcJoDSoU/2OkNmE3IAnG9AeYwJloZ45+/b82KWWpLIAVpwtyt536v/BcobGAsWBDE3qfeXT73HMjaZpCVeMhz3SWFDn/gNZAiN4X6ywuC5Cdoob1knW2clI/zg7yjRp+Sw7YZiZEuB1hpeFjLMLapWSqqkRxWBAMbTSCduRekzHLGym0o6EYMULcUSrY5SBm4x5yjjI625juSDy08g9SIC4xIyUQqmlQV1TnuXvyREiHG8gBmXahikDp1vC5KCz9HHDUQYDCLsEqUIe2fHL3N0RiXS0jAlJWrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 PH8PR12MB7256.namprd12.prod.outlook.com (2603:10b6:510:223::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 16:13:38 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 16:13:38 +0000
From: Zi Yan <ziy@nvidia.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: David Hildenbrand <david@redhat.com>, Oscar Salvador <osalvador@suse.de>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang <richardycc@google.com>,
 linux-kernel@vger.kernel.org, Harry Yoo <harry.yoo@oracle.com>
Subject: Re: [PATCH v4 2/4] mm/page_isolation: remove migratetype from
 move_freepages_block_isolate()
Date: Mon, 12 May 2025 12:13:35 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <534DC125-A15E-4190-AAE9-663D6B8283F5@nvidia.com>
In-Reply-To: <ef5f6776-b405-48e8-9fa9-c56af392bc4f@lucifer.local>
References: <20250509200111.3372279-1-ziy@nvidia.com>
 <20250509200111.3372279-3-ziy@nvidia.com>
 <ef5f6776-b405-48e8-9fa9-c56af392bc4f@lucifer.local>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN2PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:208:c0::17) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|PH8PR12MB7256:EE_
X-MS-Office365-Filtering-Correlation-Id: ec9e69c5-aea6-4d54-7ad7-08dd916ff40d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A2LmS5piykhVSdvxDkmG4hTPxrwrlCMfjjNM16i96XfbXw64YizDccW8NSTr?=
 =?us-ascii?Q?sxs0XyegCa3TGPdokyjxlo0YeN5lD7BwxeAz08hUot6SlO7fLQtxc7csFd/E?=
 =?us-ascii?Q?AC6oDjd6XxELunb0vRG+bZ7QTEWA1bhPuZUyGJmdvvpMkbm0sseUGsI9pAMk?=
 =?us-ascii?Q?AmvO8Mu6QbqnyuSRh6O6+V+45Ay/oyE2tDQVHdtl9jLXGExE7lylWAyjF0hT?=
 =?us-ascii?Q?M0B27ZUiEJNRoiA3SMBeqDFRsKRdEwTkubNMaW2oYL8WlUAwV0yXDE52t+Bm?=
 =?us-ascii?Q?Yuz0S4vssYCAMejzH16NlfZMG+zS2UPoBE5QsUi2+gZI1lbmioopuBrTijX8?=
 =?us-ascii?Q?rSLsjbSSOxOkqB0kGG5mEBSD5ZfwsMY5XGAi+62NIXFVtkM56C1tc5/KZNKg?=
 =?us-ascii?Q?2Gbmy0VNMXStH2NMzwiktR1vr3g4drLElpVOsnX95Ks66b/VrKT1b3+A5cWD?=
 =?us-ascii?Q?vyC5hVz8WwmNbmb7X7ZOmkFxxNtQvAxxMs41n0TpTbaA7VC2GSij9arwQSTT?=
 =?us-ascii?Q?ccXjdw++jYAUnOIW8TRI0uJMxrcWgMTU2Pn75/jpfD0wslAu72RMuIOEw4pT?=
 =?us-ascii?Q?lPeNDUfHO/RJPqK4lU2EXsNyojNuTmrZQQE+I5sL3znxYwbydcP0obGF5cmH?=
 =?us-ascii?Q?gIwsXY2986Cj/wN61bW1mi2oAVyvqLKp16THnpwWse4KhUPu091S2rFi+Hr+?=
 =?us-ascii?Q?R0f6yytxCQEZS5h3aSIp6faKgAeDIjqJPX2OfMTI75I8g/SYvPxt9T//AyPc?=
 =?us-ascii?Q?oyXoWXyVxdHZqH42YBl3C+Hv6qK0B8HyF4x1pbyXLM9iED/u2+/PfNabDJe5?=
 =?us-ascii?Q?IDO5M3+kH8ZJbaZ4+nea1V51eH9DzjBGWYx2Ogb7LTLNoQvvtmuIP9aBXvnD?=
 =?us-ascii?Q?QsKUYZo3MHdMpIDnhUW/2yWMg+p1tbT/jhKpxVepKSbUP1DcqyxkmlybKRGg?=
 =?us-ascii?Q?1RMqzeLqVmuwRIskM/gyiRQUhRGe0XjwAr949VKZQ0ct/4Vu+Apq2T5kXYO7?=
 =?us-ascii?Q?zFGTF3je0wX1wbp/owxaR3ZWCAs28pXqaN21DyGj+ZpZqw65f1ayRf22UAXe?=
 =?us-ascii?Q?ePpxBCwSG9qfvTtBBrVxtY5pKZDc+lh2FJYQsZM4gS+Yn11oGyhoQuDoYK4+?=
 =?us-ascii?Q?eWlWNinuOvwFLOXP4M77lV7zjJD5t9Kxn1ka5qCOeUpo2n1CyViJym+bfW2o?=
 =?us-ascii?Q?rQLtRVhJd0V0ovJl7z8TuzlaHvSJ3wWfm7c2LwN1VrTNGBBnHsbuw3clCSIK?=
 =?us-ascii?Q?1nPZpEO62Xv9PzZKNDC0sWsj4NKGzOlsja694/yt/eTFUs/h98bsZCkuKfNe?=
 =?us-ascii?Q?u3BM3eOtL9jlweFAWMYkH38wt1eFrd99OJ/9UXB7DRzLMeqiSBV2agYlN+/s?=
 =?us-ascii?Q?ckiFwgPFs9ziW+2/ufDFW/opqBn4vXRLv683DgMautEQQWYFLpBvX+cquLU9?=
 =?us-ascii?Q?3JHC8DuBVDA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vbR2b3UoaCVO7MSHESA1Qea7xt44FxSTFfJJuY2geYnEZ3swNlTrwNReJc18?=
 =?us-ascii?Q?M42G69ac72NtzqBMchGH/is8dVJ8qQU1aqzrLGCD6CefgUeqYrFr4oqJlF+4?=
 =?us-ascii?Q?E3JlxSqqEUJDqf+JDJ3YOLVHhkSOSZnS+yazg/uxivJqdjNvqeqQTZpKBp63?=
 =?us-ascii?Q?HOtvqdOvDspYBaQ4fo7Pq+O7pm+Q+i6JK4N0jZ0hI7Fi5wqXmdkdJdt0Jglx?=
 =?us-ascii?Q?jo0aF3oGOY1QT1wUsvaxe7kbyjG+Bc1oU7CG26x8EHWSPIuLWx0xxT54yx/m?=
 =?us-ascii?Q?3AcNIf1mknmS3tgxQuVqT2RO+9k3cqlBuiVdezo9F4thAIIRymCehdrfS7mg?=
 =?us-ascii?Q?M093ULbaQvCvdsz+/GKT6a27j+cJ7G1x8jEnqgV1KSbsQKr12s6wGdFTZRJ6?=
 =?us-ascii?Q?M9mZ5nx5bc8GtCbFfPzb0qc9XiDz54fqMtO+RNisj3wWfxx02U/qCW8KGRmp?=
 =?us-ascii?Q?v9IkssyFMgcwHBWl3Tfo17+/wm/ZYBoBzppPPhAxlKN5J2NCfYqtDEK/rdjM?=
 =?us-ascii?Q?a28ApaYt1dbclvDVtX7XDDlRboFTfAkTUlq7H6puZHSdNHwEG61nvafSSBin?=
 =?us-ascii?Q?ezpK3In0CUv63sSw6krfZ1/1sjoJPF8duJVVpjTeM6aIFpdEX/aBlnj938vQ?=
 =?us-ascii?Q?8+prU19IsmHK2Vx1E/9uPgeDwHnWidSP5rFX+sHKjTpP17JyfjI/lcpG9auj?=
 =?us-ascii?Q?4XUpqObj1ricPlQDK5sz8Xar8gguyPTBjCH6MwiKXDIIoE74Qn2nxWwP+rq5?=
 =?us-ascii?Q?JJJqM74uPt+XYmQlGqjjR8zH1TBSTZiNUd+COirT9Zb2DhFl09ddhOiKRbd/?=
 =?us-ascii?Q?e/Jmo2UcIP1oxYJpsMu/peQJtfMsGku6SqWRbiApW0gQoJ4AIjYnC5SLzEF9?=
 =?us-ascii?Q?lOPvUezuyle5Ui7rBK2uiaJ0GnlQOFJcgRr4EiezF/McIumAUHGuNQQyxr8s?=
 =?us-ascii?Q?xNDF8saMeMv8ny6/nnCVID7O04ljjqqKrT9eAQNCOKsQPRysmI/XyEv4+nQO?=
 =?us-ascii?Q?OK1TrW62cKmptSPEsMPIIZm2N297t7RExB7Wh+VHaYuY/PWQ79nAnLushmdv?=
 =?us-ascii?Q?vFUqZVBPQynq8m67SdkYkDuN/yR5juYJV1xowyZBkeP1UqvKhBCpDyRwQqP3?=
 =?us-ascii?Q?7oiMCqo4nMRUdtx0yv8mhwODwQiA8ujT5usPCKwu2k/9oC3Jz6SxYt+0kThi?=
 =?us-ascii?Q?VpwkE+RumbPpcFTZ8QSz8Xq/XC2siUs4/eg0jiGFkMFyysek1czWBB0h89Bn?=
 =?us-ascii?Q?AfRkMwds5Ohc8SVHSyEFxuJYT1/IzVFwUZqZg71fVtx3CUcTFWeABaECKG8m?=
 =?us-ascii?Q?3JVRB+Bt6CJcp8719XWjvHKeKNm4Mgyta2B2lT5p1vWhmd5yRW+Bm2X6OrEp?=
 =?us-ascii?Q?Yo5HI2pYXCzqHJfjRozhABVB35F+pXSqu9oo2V18gT4eSgqdW39Vm8aDbgdY?=
 =?us-ascii?Q?8e975TkoZLloEdNfsAcJwpgZ6Ic8M4AlnC7OUrnFNAkWzwuv2pfc3SWgXn3I?=
 =?us-ascii?Q?gXV4VQPNAaNnUNB7y5tEjYWLi49q0w4a+vikf4L2L1LPKwr7/tyGmplef1jV?=
 =?us-ascii?Q?UdW+QvU4ewH+JOYooi+qRHlxVuJd7u/1hDHUzMYH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec9e69c5-aea6-4d54-7ad7-08dd916ff40d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 16:13:37.9947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fed5gQn836Ldlg041EhTYO4YiMvZUMvzozbeCDI7zQloI4jqJuAFy3w6elNVV5uI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7256

On 12 May 2025, at 12:10, Lorenzo Stoakes wrote:

> Andrew - please drop this series, it's broken in mm-new.
>
> Zi - (as kernel bot reports actually!) I bisected a kernel splat to thi=
s
> commit, triggerred by the mm/transhuge-stress test (please make sure to=
 run
> mm self tests before submitting series :)
>
> You can trigger it manually with:
>
> ./transhuge-stress -d 20

Thanks. I will fix the issue and resend.

>
> (The same invocation run_vmtest.sh uses).
>
> Note that this was reported in [0] (thanks to Harry Yoo for pointing th=
is
> out to me off-list! :)
>
> [0]: https://lore.kernel.org/linux-mm/87wmalyktd.fsf@linux.ibm.com/T/#u=

>
> The decoded splat (at this commit in mm-new):
>
> [   55.835700] ------------[ cut here ]------------
> [   55.835705] page type is 0, passed migratetype is 2 (nr=3D32)
> [   55.835720] WARNING: CPU: 2 PID: 288 at mm/page_alloc.c:727 move_to_=
free_list (mm/page_alloc.c:727 (discriminator 16))
> [   55.835734] Modules linked in:
> [   55.835739] Tainted: [W]=3DWARN
> [   55.835740] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), B=
IOS Arch Linux 1.16.3-1-1 04/01/2014
> [   55.835741] RIP: 0010:move_to_free_list (mm/page_alloc.c:727 (discri=
minator 16))
> [ 55.835742] Code: e9 fe ff ff c6 05 f1 9b 7b 01 01 90 48 89 ef e8 11 d=
7 ff ff 44 89 e1 44 89 ea 48 c7 c7 58 dc 70 82 48 89 c6 e8 1c e3 e0 ff 90=
 <0f> 0b 90 90 e9 ba fe ff ff 66 90 90 90 90 90 90 90 90 90 90 90 90
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:	e9 fe ff ff c6       	jmp    0xffffffffc7000003
>    5:	05 f1 9b 7b 01       	add    $0x17b9bf1,%eax
>    a:	01 90 48 89 ef e8    	add    %edx,-0x171076b8(%rax)
>   10:	11 d7                	adc    %edx,%edi
>   12:	ff                   	(bad)
>   13:	ff 44 89 e1          	incl   -0x1f(%rcx,%rcx,4)
>   17:	44 89 ea             	mov    %r13d,%edx
>   1a:	48 c7 c7 58 dc 70 82 	mov    $0xffffffff8270dc58,%rdi
>   21:	48 89 c6             	mov    %rax,%rsi
>   24:	e8 1c e3 e0 ff       	call   0xffffffffffe0e345
>   29:	90                   	nop
>   2a:*	0f 0b                	ud2		<-- trapping instruction
>   2c:	90                   	nop
>   2d:	90                   	nop
>   2e:	e9 ba fe ff ff       	jmp    0xfffffffffffffeed
>   33:	66 90                	xchg   %ax,%ax
>   35:	90                   	nop
>   36:	90                   	nop
>   37:	90                   	nop
>   38:	90                   	nop
>   39:	90                   	nop
>   3a:	90                   	nop
>   3b:	90                   	nop
>   3c:	90                   	nop
>   3d:	90                   	nop
>   3e:	90                   	nop
>   3f:	90                   	nop
>
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:	0f 0b                	ud2
>    2:	90                   	nop
>    3:	90                   	nop
>    4:	e9 ba fe ff ff       	jmp    0xfffffffffffffec3
>    9:	66 90                	xchg   %ax,%ax
>    b:	90                   	nop
>    c:	90                   	nop
>    d:	90                   	nop
>    e:	90                   	nop
>    f:	90                   	nop
>   10:	90                   	nop
>   11:	90                   	nop
>   12:	90                   	nop
>   13:	90                   	nop
>   14:	90                   	nop
>   15:	90                   	nop
> [   55.835743] RSP: 0018:ffffc900004eba20 EFLAGS: 00010086
> [   55.835744] RAX: 000000000000002f RBX: ffff88826cccb080 RCX: 0000000=
000000027
> [   55.835745] RDX: ffff888263d17b08 RSI: 0000000000000001 RDI: ffff888=
263d17b00
> [   55.835746] RBP: ffffea0005fe0000 R08: 00000000ffffdfff R09: fffffff=
f82b16528
> [   55.835746] R10: 80000000ffffe000 R11: 00000000ffffe000 R12: 0000000=
000000020
> [   55.835746] R13: 0000000000000002 R14: 0000000000000001 R15: 0000000=
000000005
> [   55.835750] FS:  00007fef6a06a740(0000) GS:ffff8882e08a0000(0000) kn=
lGS:0000000000000000
> [   55.835751] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   55.835751] CR2: 00007fee20c00000 CR3: 0000000179321000 CR4: 0000000=
000750ef0
> [   55.835751] PKRU: 55555554
> [   55.835752] Call Trace:
> [   55.835755]  <TASK>
> [   55.835756] __move_freepages_block (mm/page_alloc.c:1849)
> [   55.835758] try_to_claim_block (mm/page_alloc.c:452 (discriminator 3=
) mm/page_alloc.c:2231 (discriminator 3))
> [   55.835759] __rmqueue_pcplist (mm/page_alloc.c:2287 mm/page_alloc.c:=
2383 mm/page_alloc.c:2422 mm/page_alloc.c:3140)
> [   55.835760] get_page_from_freelist (./include/linux/spinlock.h:391 m=
m/page_alloc.c:3183 mm/page_alloc.c:3213 mm/page_alloc.c:3739)
> [   55.835761] __alloc_frozen_pages_noprof (mm/page_alloc.c:5032)
> [   55.835763] ? __blk_flush_plug (block/blk-core.c:1227 (discriminator=
 2))
> [   55.835766] alloc_pages_mpol (mm/mempolicy.c:2413)
> [   55.835768] vma_alloc_folio_noprof (mm/mempolicy.c:2432 mm/mempolicy=
=2Ec:2465)
> [   55.835769] ? __pte_alloc (mm/memory.c:444)
> [   55.835771] do_anonymous_page (mm/memory.c:1064 (discriminator 4) mm=
/memory.c:4982 (discriminator 4) mm/memory.c:5039 (discriminator 4))
> [   55.835772] ? do_huge_pmd_anonymous_page (mm/huge_memory.c:1226 mm/h=
uge_memory.c:1372)
> [   55.835774] __handle_mm_fault (mm/memory.c:4197 mm/memory.c:6038 mm/=
memory.c:6181)
> [   55.835776] handle_mm_fault (mm/memory.c:6350)
> [   55.835777] do_user_addr_fault (arch/x86/mm/fault.c:1338)
> [   55.835779] exc_page_fault (./arch/x86/include/asm/irqflags.h:37 ./a=
rch/x86/include/asm/irqflags.h:114 arch/x86/mm/fault.c:1488 arch/x86/mm/f=
ault.c:1538)
> [   55.835783] asm_exc_page_fault (./arch/x86/include/asm/idtentry.h:62=
3)
> [   55.835785] RIP: 0033:0x403824
> [ 55.835786] Code: e0 0f 85 7c 01 00 00 ba 0e 00 00 00 be 00 00 20 00 4=
8 89 c7 48 89 c3 e8 4a ea ff ff 85 c0 0f 85 51 01 00 00 8b 0d b4 49 00 00=
 <48> 89 1b 85 c9 0f 84 b1 00 00 00 83 e9 03 48 89 e6 ba 10 00 00 00
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:	e0 0f                	loopne 0x11
>    2:	85 7c 01 00          	test   %edi,0x0(%rcx,%rax,1)
>    6:	00 ba 0e 00 00 00    	add    %bh,0xe(%rdx)
>    c:	be 00 00 20 00       	mov    $0x200000,%esi
>   11:	48 89 c7             	mov    %rax,%rdi
>   14:	48 89 c3             	mov    %rax,%rbx
>   17:	e8 4a ea ff ff       	call   0xffffffffffffea66
>   1c:	85 c0                	test   %eax,%eax
>   1e:	0f 85 51 01 00 00    	jne    0x175
>   24:	8b 0d b4 49 00 00    	mov    0x49b4(%rip),%ecx        # 0x49de
>   2a:*	48 89 1b             	mov    %rbx,(%rbx)		<-- trapping instructi=
on
>   2d:	85 c9                	test   %ecx,%ecx
>   2f:	0f 84 b1 00 00 00    	je     0xe6
>   35:	83 e9 03             	sub    $0x3,%ecx
>   38:	48 89 e6             	mov    %rsp,%rsi
>   3b:	ba 10 00 00 00       	mov    $0x10,%edx
>
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:	48 89 1b             	mov    %rbx,(%rbx)
>    3:	85 c9                	test   %ecx,%ecx
>    5:	0f 84 b1 00 00 00    	je     0xbc
>    b:	83 e9 03             	sub    $0x3,%ecx
>    e:	48 89 e6             	mov    %rsp,%rsi
>   11:	ba 10 00 00 00       	mov    $0x10,%edx
> [   55.835786] RSP: 002b:00007ffd50b1e550 EFLAGS: 00010246
> [   55.835787] RAX: 0000000000000000 RBX: 00007fee20c00000 RCX: 0000000=
00000000c
> [   55.835787] RDX: 000000000000000e RSI: 0000000000200000 RDI: 00007fe=
e20c00000
> [   55.835788] RBP: 0000000000000003 R08: 00000000ffffffff R09: 0000000=
000000000
> [   55.835788] R10: 0000000000004032 R11: 0000000000000246 R12: 00007fe=
e20c00000
> [   55.835788] R13: 00007fef6a000000 R14: 00000000323ca6b0 R15: 0000000=
000000fd2
> [   55.835789]  </TASK>
> [   55.835789] ---[ end trace 0000000000000000 ]---
>
>
> On Fri, May 09, 2025 at 04:01:09PM -0400, Zi Yan wrote:
>> Since migratetype is no longer overwritten during pageblock isolation,=

>> moving pageblocks to and from MIGRATE_ISOLATE no longer needs migratet=
ype.
>>
>> Add MIGRATETYPE_NO_ISO_MASK to allow read before-isolation migratetype=

>> when a pageblock is isolated. It is used by move_freepages_block_isola=
te().
>>
>> Add pageblock_isolate_and_move_free_pages() and
>> pageblock_unisolate_and_move_free_pages() to be explicit about the pag=
e
>> isolation operations. Both share the common code in
>> __move_freepages_block_isolate(), which is renamed from
>> move_freepages_block_isolate().
>>
>> Make set_pageblock_migratetype() only accept non MIGRATE_ISOLATE types=
,
>> so that one should use set_pageblock_isolate() to isolate pageblocks.
>>
>> Two consequential changes:
>> 1. move pageblock migratetype code out of __move_freepages_block().
>> 2. in online_pages() from mm/memory_hotplug.c, move_pfn_range_to_zone(=
) is
>>    called with MIGRATE_MOVABLE instead of MIGRATE_ISOLATE and all affe=
cted
>>    pageblocks are isolated afterwards. Otherwise, all online pageblock=
s
>>    will have non-determined migratetype.
>>
>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>> ---
>>  include/linux/mmzone.h         |  4 +-
>>  include/linux/page-isolation.h |  5 ++-
>>  mm/memory_hotplug.c            |  7 +++-
>>  mm/page_alloc.c                | 73 +++++++++++++++++++++++++--------=
-
>>  mm/page_isolation.c            | 27 ++++++++-----
>>  5 files changed, 82 insertions(+), 34 deletions(-)
>>
>> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
>> index 7ef01fe148ce..f66895456974 100644
>> --- a/include/linux/mmzone.h
>> +++ b/include/linux/mmzone.h
>> @@ -107,8 +107,10 @@ static inline bool migratetype_is_mergeable(int m=
t)
>>  extern int page_group_by_mobility_disabled;
>>
>>  #ifdef CONFIG_MEMORY_ISOLATION
>> -#define MIGRATETYPE_MASK ((BIT(PB_migratetype_bits) - 1) | PB_migrate=
_isolate_bit)
>> +#define MIGRATETYPE_NO_ISO_MASK (BIT(PB_migratetype_bits) - 1)
>> +#define MIGRATETYPE_MASK (MIGRATETYPE_NO_ISO_MASK | PB_migrate_isolat=
e_bit)
>>  #else
>> +#define MIGRATETYPE_NO_ISO_MASK MIGRATETYPE_MASK
>>  #define MIGRATETYPE_MASK (BIT(PB_migratetype_bits) - 1)
>>  #endif
>>
>> diff --git a/include/linux/page-isolation.h b/include/linux/page-isola=
tion.h
>> index 898bb788243b..b0a2af0a5357 100644
>> --- a/include/linux/page-isolation.h
>> +++ b/include/linux/page-isolation.h
>> @@ -26,9 +26,10 @@ static inline bool is_migrate_isolate(int migratety=
pe)
>>  #define REPORT_FAILURE	0x2
>>
>>  void set_pageblock_migratetype(struct page *page, int migratetype);
>> +void set_pageblock_isolate(struct page *page);
>>
>> -bool move_freepages_block_isolate(struct zone *zone, struct page *pag=
e,
>> -				  int migratetype);
>> +bool pageblock_isolate_and_move_free_pages(struct zone *zone, struct =
page *page);
>> +bool pageblock_unisolate_and_move_free_pages(struct zone *zone, struc=
t page *page);
>>
>>  int start_isolate_page_range(unsigned long start_pfn, unsigned long e=
nd_pfn,
>>  			     int migratetype, int flags);
>> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
>> index b1caedbade5b..c86c47bba019 100644
>> --- a/mm/memory_hotplug.c
>> +++ b/mm/memory_hotplug.c
>> @@ -1178,6 +1178,7 @@ int online_pages(unsigned long pfn, unsigned lon=
g nr_pages,
>>  	const int nid =3D zone_to_nid(zone);
>>  	int ret;
>>  	struct memory_notify arg;
>> +	unsigned long isol_pfn;
>>
>>  	/*
>>  	 * {on,off}lining is constrained to full memory sections (or more
>> @@ -1192,7 +1193,11 @@ int online_pages(unsigned long pfn, unsigned lo=
ng nr_pages,
>>
>>
>>  	/* associate pfn range with the zone */
>> -	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_ISOLATE);
>> +	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_MOVABLE);
>> +	for (isol_pfn =3D pfn;
>> +	     isol_pfn < pfn + nr_pages;
>> +	     isol_pfn +=3D pageblock_nr_pages)
>> +		set_pageblock_isolate(pfn_to_page(isol_pfn));
>>
>>  	arg.start_pfn =3D pfn;
>>  	arg.nr_pages =3D nr_pages;
>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>> index 04e301fb4879..cfd37b2d992e 100644
>> --- a/mm/page_alloc.c
>> +++ b/mm/page_alloc.c
>> @@ -454,11 +454,9 @@ void set_pageblock_migratetype(struct page *page,=
 int migratetype)
>>  		migratetype =3D MIGRATE_UNMOVABLE;
>>
>>  #ifdef CONFIG_MEMORY_ISOLATION
>> -	if (migratetype =3D=3D MIGRATE_ISOLATE) {
>> -		set_pfnblock_flags_mask(page, PB_migrate_isolate_bit,
>> -				page_to_pfn(page), PB_migrate_isolate_bit);
>> -		return;
>> -	}
>> +	VM_WARN(migratetype =3D=3D MIGRATE_ISOLATE,
>> +			"Use set_pageblock_isolate() for pageblock isolation");
>> +	return;
>>  #endif
>>  	set_pfnblock_flags_mask(page, (unsigned long)migratetype,
>>  				page_to_pfn(page), MIGRATETYPE_MASK);
>> @@ -1819,8 +1817,8 @@ static inline struct page *__rmqueue_cma_fallbac=
k(struct zone *zone,
>>  #endif
>>
>>  /*
>> - * Change the type of a block and move all its free pages to that
>> - * type's freelist.
>> + * Move all free pages of a block to new type's freelist. Caller need=
s to
>> + * change the block type.
>>   */
>>  static int __move_freepages_block(struct zone *zone, unsigned long st=
art_pfn,
>>  				  int old_mt, int new_mt)
>> @@ -1852,8 +1850,6 @@ static int __move_freepages_block(struct zone *z=
one, unsigned long start_pfn,
>>  		pages_moved +=3D 1 << order;
>>  	}
>>
>> -	set_pageblock_migratetype(pfn_to_page(start_pfn), new_mt);
>> -
>>  	return pages_moved;
>>  }
>>
>> @@ -1911,11 +1907,16 @@ static int move_freepages_block(struct zone *z=
one, struct page *page,
>>  				int old_mt, int new_mt)
>>  {
>>  	unsigned long start_pfn;
>> +	int res;
>>
>>  	if (!prep_move_freepages_block(zone, page, &start_pfn, NULL, NULL))
>>  		return -1;
>>
>> -	return __move_freepages_block(zone, start_pfn, old_mt, new_mt);
>> +	res =3D __move_freepages_block(zone, start_pfn, old_mt, new_mt);
>> +	set_pageblock_migratetype(pfn_to_page(start_pfn), new_mt);
>> +
>> +	return res;
>> +
>>  }
>>
>>  #ifdef CONFIG_MEMORY_ISOLATION
>> @@ -1943,11 +1944,17 @@ static unsigned long find_large_buddy(unsigned=
 long start_pfn)
>>  	return start_pfn;
>>  }
>>
>> +static inline void toggle_pageblock_isolate(struct page *page, bool i=
solate)
>> +{
>> +	set_pfnblock_flags_mask(page, (isolate << PB_migrate_isolate),
>> +			page_to_pfn(page), PB_migrate_isolate_bit);
>> +}
>> +
>>  /**
>> - * move_freepages_block_isolate - move free pages in block for page i=
solation
>> + * __move_freepages_block_isolate - move free pages in block for page=
 isolation
>>   * @zone: the zone
>>   * @page: the pageblock page
>> - * @migratetype: migratetype to set on the pageblock
>> + * @isolate: to isolate the given pageblock or unisolate it
>>   *
>>   * This is similar to move_freepages_block(), but handles the special=

>>   * case encountered in page isolation, where the block of interest
>> @@ -1962,10 +1969,15 @@ static unsigned long find_large_buddy(unsigned=
 long start_pfn)
>>   *
>>   * Returns %true if pages could be moved, %false otherwise.
>>   */
>> -bool move_freepages_block_isolate(struct zone *zone, struct page *pag=
e,
>> -				  int migratetype)
>> +static bool __move_freepages_block_isolate(struct zone *zone,
>> +		struct page *page, bool isolate)
>>  {
>>  	unsigned long start_pfn, pfn;
>> +	int from_mt;
>> +	int to_mt;
>> +
>> +	if (isolate =3D=3D (get_pageblock_migratetype(page) =3D=3D MIGRATE_I=
SOLATE))
>> +		return false;
>>
>>  	if (!prep_move_freepages_block(zone, page, &start_pfn, NULL, NULL))
>>  		return false;
>> @@ -1982,7 +1994,7 @@ bool move_freepages_block_isolate(struct zone *z=
one, struct page *page,
>>
>>  		del_page_from_free_list(buddy, zone, order,
>>  					get_pfnblock_migratetype(buddy, pfn));
>> -		set_pageblock_migratetype(page, migratetype);
>> +		toggle_pageblock_isolate(page, isolate);
>>  		split_large_buddy(zone, buddy, pfn, order, FPI_NONE);
>>  		return true;
>>  	}
>> @@ -1993,16 +2005,38 @@ bool move_freepages_block_isolate(struct zone =
*zone, struct page *page,
>>
>>  		del_page_from_free_list(page, zone, order,
>>  					get_pfnblock_migratetype(page, pfn));
>> -		set_pageblock_migratetype(page, migratetype);
>> +		toggle_pageblock_isolate(page, isolate);
>>  		split_large_buddy(zone, page, pfn, order, FPI_NONE);
>>  		return true;
>>  	}
>>  move:
>> -	__move_freepages_block(zone, start_pfn,
>> -			       get_pfnblock_migratetype(page, start_pfn),
>> -			       migratetype);
>> +	/* use MIGRATETYPE_NO_ISO_MASK to get the non-isolate migratetype */=

>> +	if (isolate) {
>> +		from_mt =3D get_pfnblock_flags_mask(page, page_to_pfn(page),
>> +				MIGRATETYPE_NO_ISO_MASK);
>> +		to_mt =3D MIGRATE_ISOLATE;
>> +	} else {
>> +		from_mt =3D MIGRATE_ISOLATE;
>> +		to_mt =3D get_pfnblock_flags_mask(page, page_to_pfn(page),
>> +				MIGRATETYPE_NO_ISO_MASK);
>> +	}
>> +
>> +	__move_freepages_block(zone, start_pfn, from_mt, to_mt);
>> +	toggle_pageblock_isolate(pfn_to_page(start_pfn), isolate);
>> +
>>  	return true;
>>  }
>> +
>> +bool pageblock_isolate_and_move_free_pages(struct zone *zone, struct =
page *page)
>> +{
>> +	return __move_freepages_block_isolate(zone, page, true);
>> +}
>> +
>> +bool pageblock_unisolate_and_move_free_pages(struct zone *zone, struc=
t page *page)
>> +{
>> +	return __move_freepages_block_isolate(zone, page, false);
>> +}
>> +
>>  #endif /* CONFIG_MEMORY_ISOLATION */
>>
>>  static void change_pageblock_range(struct page *pageblock_page,
>> @@ -2194,6 +2228,7 @@ try_to_claim_block(struct zone *zone, struct pag=
e *page,
>>  	if (free_pages + alike_pages >=3D (1 << (pageblock_order-1)) ||
>>  			page_group_by_mobility_disabled) {
>>  		__move_freepages_block(zone, start_pfn, block_type, start_type);
>> +		set_pageblock_migratetype(pfn_to_page(start_pfn), start_type);
>>  		return __rmqueue_smallest(zone, order, start_type);
>>  	}
>>
>> diff --git a/mm/page_isolation.c b/mm/page_isolation.c
>> index 751e21f6d85e..4571940f14db 100644
>> --- a/mm/page_isolation.c
>> +++ b/mm/page_isolation.c
>> @@ -25,6 +25,12 @@ static inline void clear_pageblock_isolate(struct p=
age *page)
>>  	set_pfnblock_flags_mask(page, 0, page_to_pfn(page),
>>  			PB_migrate_isolate_bit);
>>  }
>> +void set_pageblock_isolate(struct page *page)
>> +{
>> +	set_pfnblock_flags_mask(page, PB_migrate_isolate_bit,
>> +			page_to_pfn(page),
>> +			PB_migrate_isolate_bit);
>> +}
>>
>>  /*
>>   * This function checks whether the range [start_pfn, end_pfn) includ=
es
>> @@ -199,7 +205,7 @@ static int set_migratetype_isolate(struct page *pa=
ge, int migratetype, int isol_
>>  	unmovable =3D has_unmovable_pages(check_unmovable_start, check_unmov=
able_end,
>>  			migratetype, isol_flags);
>>  	if (!unmovable) {
>> -		if (!move_freepages_block_isolate(zone, page, MIGRATE_ISOLATE)) {
>> +		if (!pageblock_isolate_and_move_free_pages(zone, page)) {
>>  			spin_unlock_irqrestore(&zone->lock, flags);
>>  			return -EBUSY;
>>  		}
>> @@ -220,7 +226,7 @@ static int set_migratetype_isolate(struct page *pa=
ge, int migratetype, int isol_
>>  	return -EBUSY;
>>  }
>>
>> -static void unset_migratetype_isolate(struct page *page, int migratet=
ype)
>> +static void unset_migratetype_isolate(struct page *page)
>>  {
>>  	struct zone *zone;
>>  	unsigned long flags;
>> @@ -273,10 +279,10 @@ static void unset_migratetype_isolate(struct pag=
e *page, int migratetype)
>>  		 * Isolating this block already succeeded, so this
>>  		 * should not fail on zone boundaries.
>>  		 */
>> -		WARN_ON_ONCE(!move_freepages_block_isolate(zone, page, migratetype)=
);
>> +		WARN_ON_ONCE(!pageblock_unisolate_and_move_free_pages(zone, page));=

>>  	} else {
>> -		set_pageblock_migratetype(page, migratetype);
>> -		__putback_isolated_page(page, order, migratetype);
>> +		clear_pageblock_isolate(page);
>> +		__putback_isolated_page(page, order, get_pageblock_migratetype(page=
));
>>  	}
>>  	zone->nr_isolate_pageblock--;
>>  out:
>> @@ -394,7 +400,7 @@ static int isolate_single_pageblock(unsigned long =
boundary_pfn, int flags,
>>  		if (PageBuddy(page)) {
>>  			int order =3D buddy_order(page);
>>
>> -			/* move_freepages_block_isolate() handled this */
>> +			/* pageblock_isolate_and_move_free_pages() handled this */
>>  			VM_WARN_ON_ONCE(pfn + (1 << order) > boundary_pfn);
>>
>>  			pfn +=3D 1UL << order;
>> @@ -444,7 +450,7 @@ static int isolate_single_pageblock(unsigned long =
boundary_pfn, int flags,
>>  failed:
>>  	/* restore the original migratetype */
>>  	if (!skip_isolation)
>> -		unset_migratetype_isolate(pfn_to_page(isolate_pageblock), migratety=
pe);
>> +		unset_migratetype_isolate(pfn_to_page(isolate_pageblock));
>>  	return -EBUSY;
>>  }
>>
>> @@ -515,7 +521,7 @@ int start_isolate_page_range(unsigned long start_p=
fn, unsigned long end_pfn,
>>  	ret =3D isolate_single_pageblock(isolate_end, flags, true,
>>  			skip_isolation, migratetype);
>>  	if (ret) {
>> -		unset_migratetype_isolate(pfn_to_page(isolate_start), migratetype);=

>> +		unset_migratetype_isolate(pfn_to_page(isolate_start));
>>  		return ret;
>>  	}
>>
>> @@ -528,8 +534,7 @@ int start_isolate_page_range(unsigned long start_p=
fn, unsigned long end_pfn,
>>  					start_pfn, end_pfn)) {
>>  			undo_isolate_page_range(isolate_start, pfn, migratetype);
>>  			unset_migratetype_isolate(
>> -				pfn_to_page(isolate_end - pageblock_nr_pages),
>> -				migratetype);
>> +				pfn_to_page(isolate_end - pageblock_nr_pages));
>>  			return -EBUSY;
>>  		}
>>  	}
>> @@ -559,7 +564,7 @@ void undo_isolate_page_range(unsigned long start_p=
fn, unsigned long end_pfn,
>>  		page =3D __first_valid_page(pfn, pageblock_nr_pages);
>>  		if (!page || !is_migrate_isolate_page(page))
>>  			continue;
>> -		unset_migratetype_isolate(page, migratetype);
>> +		unset_migratetype_isolate(page);
>>  	}
>>  }
>>  /*
>> --
>> 2.47.2
>>
>>
>>


--
Best Regards,
Yan, Zi
