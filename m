Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2070.outbound.protection.outlook.com [40.107.244.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E473EAC7
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 01:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749432890; cv=fail; b=Vmp4yifOUbHmTNBqEypBqqJS4jdT8YtK37oVxImbPi1z5bLm6L8jF+ol0gpkOI3qCWgjYIFrbTg0c+e7cDAgzHZx9f6/rRpOvv5DhNd7Vo/w6a2Wm/H7kL13YfygARvJWaHa89glG8IcT/XWy1UBcecFVpIo22921ad2WHAM8Uo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749432890; c=relaxed/simple;
	bh=jJfhEgl9qUSrHjTHOpBfa9zln3sTloPWtTYS70fIUiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mhF3T9ljKsGeduXjN4UAE/wUzcgNgT0H6Mgwmpn9XDgWXj3mqus6+6NbyktIcrBxzbzpUrZ9FUrqEompFV2464qbWWUJNhVHjIbkuwmVr2lx9Fn/oBD9QSl3OTSfbCLEelyVqe474U8ib1SINUlvzbZ0/QLhkbh1g+tm2TqDdhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IcSlA42L; arc=fail smtp.client-ip=40.107.244.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IcSlA42L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QeqQ7TG9+VO6bZEWauzXa8R/RyLNv5CvjIxDE1YcbU0ld7qrbVB4G85ypDV8ov7d53DiySyKqEElmZdBKwicLg4/zf5E1G4lCtu9fRG5Mj1yzYR48t50eXZrYHhe6hmP+d/bwFYaLDoCAp2O4rK2j3IzAX5b135Q02tp8Z7flsAa1kbQYGqRZvdBF6u7lUWZ+OnelBybzFughImmF9Mf29TPS418l5vdlFjCHzQl4YwY9yq3RQ7oisebhfQQXOt3mA7Hh/MA2RyGVnX57/m6xCIAwRRNeIt4qv4L1Va6YmXeslBLYMBqfVY0C9A+JuPiQEqZuxBN5DAvZIVv7WbS0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QtLKeJPPEuYI8CjhsnjA9ab0szVK7Vxw5SFTTYWqumY=;
 b=GCLBsvD/be34GxN9YpM8t4LW7rWGdt2CcRClzeXz2wqLjjzDjHRxlb/4U/1XR84mK0NUZEtGiJ8kSLC75zrpFvyxO5V64EQtx5SY69TN2eaNlZjJC0CV/eTj6WBOFj2Mo+vmoCP+0Svycv6OncO4LNbJLgWPsYNH79yS01wEU2lr5pf9E5BCBgwbeW/arGH8aq3qtTDVlPIeul13Z7e1gNOvAPj5wUtWrjrHatbExwJxjT94BHehT5OziU4UVdBi9v7/yHoROTlx6GSDRIdrJACD70OS0mmTiRi0zkPIyoIn009f+JvZjTvIvjixcTsvyOKsMzgwgR1SHE2Z3SSOnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QtLKeJPPEuYI8CjhsnjA9ab0szVK7Vxw5SFTTYWqumY=;
 b=IcSlA42LWMTmARxe3j7JWdX0caFXAJbiYzzxK3P53pxxl2SuElziFreTviR5+3N4At0c48rC2uQDEB+aaF0uaSTIPU+LuiyDM4ngSWDXKMOP9yCYV5Rau/B+U2XFASlG9wGdqSvNyWLWyoaosXZfqgU1L5GWZgWiyrlOSl6sHSc3sP//JLh/LFuFzsMNKHN0WEDcoiP7ETBX4u9CtTozvDLFa2AuqP9QTBBJPpIWNuaj2kY6Tq5RIGvZnTD9zs5yUXLkuWXXGAC2P7u87Wh6InygY/VoDlaiO8XA/jMRt9rxy5nY+GQLJwIA0K4o3OwjrlFpQ72QdbY1A4iQ4o7U3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ2PR12MB8925.namprd12.prod.outlook.com (2603:10b6:a03:542::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.36; Mon, 9 Jun 2025 01:34:46 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8792.038; Mon, 9 Jun 2025
 01:34:44 +0000
From: Zi Yan <ziy@nvidia.com>
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Barry Song <baohua@kernel.org>,
 David Hildenbrand <david@redhat.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>
Subject: Re: [PATCH] MAINTAINERS: add myself as a THP reviewer
Date: Sun, 08 Jun 2025 21:34:41 -0400
X-Mailer: MailMate (2.0r6263)
Message-ID: <9186BDC0-44DE-4140-9138-8373EB816C2A@nvidia.com>
In-Reply-To: <20250609002442.1856-1-21cnbao@gmail.com>
References: <20250609002442.1856-1-21cnbao@gmail.com>
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0982.namprd03.prod.outlook.com
 (2603:10b6:408:109::27) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SJ2PR12MB8925:EE_
X-MS-Office365-Filtering-Correlation-Id: 110f58ff-4157-46e3-b99e-08dda6f5cfd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rud5rv2fiLCFTC+CWlwNIt5pkqFsNNwB47qG7nXH61ZegSXhCW3/TyPHGO3S?=
 =?us-ascii?Q?XzhnhMDh66ODwUacz3osvSkJHtY7uW2ksfBKx5EW7pIL7s63CDVsNzWQjRWH?=
 =?us-ascii?Q?Ei9jCL694ZevGZ2XVURlBHIFX6504FKWRhGmywLTcuZhaUQOU+nARrhU2mLs?=
 =?us-ascii?Q?LAq4IdzVfHUFyVBqoX+GJN0KwG3F3crQp8SN5hg9+Lv13qy3Q14CfTM7sNl7?=
 =?us-ascii?Q?uva+gQx8T/3PnAmNKA34ewQvvDY9CsDDyY+/ILEIphB50oL7ZNrpxY5Kwn/K?=
 =?us-ascii?Q?hnn2PYnUCEr9UKkaebnI8UUwf9+asUcwxZGufbnOC4G/j2xwR6G8/CvpkLxo?=
 =?us-ascii?Q?sFp+oHEL5VIxOLdp2R4Ry4o5Ujt1NxhtIgzJd1SR6SYLOSpeYaw+FtYZ0O6q?=
 =?us-ascii?Q?w5Z3VifCNp+7plwdOMr9vw/ytDRi7TOolFanA4U89t4ujk8VRcMlVrNFtHZM?=
 =?us-ascii?Q?7nCGtTfSQmzB50cNVp+6+mfoSQqsmJ1NLANQ0J1HVv9wmz6KLWIliuWzJRdD?=
 =?us-ascii?Q?Wpact+Yg1Sodcb9yEFTsSrfsL9hcaSLwc3s5UiSPD2pcDdzPLwj1ZMnaVEvj?=
 =?us-ascii?Q?Om7fZ/jRVXlWw4Z4krM6ccCJwQO9RdH0/aaa5e0WalUYT3vW6GHkM7x0YW4A?=
 =?us-ascii?Q?wyAKzN2lcFAMPi/E937RcPBNkAvXr3w4uDyHuEa2WkOHlrISoC1Pk15UDysk?=
 =?us-ascii?Q?QSMW9ybguHeGBnrngZ9cfPQg5pRKxerNryoTRsGaJvJj8xOAAX1iT8/xRYk5?=
 =?us-ascii?Q?0zLa9bfXISxfIzivIsX7JcDWgXLQxQUPlBZqIW39zvZ4vRPHLxZH6d26BipL?=
 =?us-ascii?Q?peIBHkIsqNR/i3LoqrCncxJ09scmA/6KD4ZQ5lLUVcTGpA/bLRAz9q3DiXn0?=
 =?us-ascii?Q?LlUttbkT1nw7gDeKVxPg+deBAVKEToTTYXWdln3AKqPxmziCtGlYE2OsXtS6?=
 =?us-ascii?Q?Ao3vPyndBTe487hBd2QxBTgKEZ2mwHYGzpwf3emLE3UYA9cjd2PCd+CR35Mq?=
 =?us-ascii?Q?y0Rch/n/RcLwKtVgRSG4d33HO9MFHbljsxniyS+uUOhU2rrCeiBC1hJkl6wa?=
 =?us-ascii?Q?u0B1vNrmtsH4TFpVtTCyUpx45u6AzXJGRMPluhGTWsh3gGu1FEdPmzdQhRbh?=
 =?us-ascii?Q?FwdTCRlHtgKvoL+/E5b5bqhd883QTHCf2OW39GOFdzT8X9Dmq3NCohjoGDTH?=
 =?us-ascii?Q?CD+WE5xzkXKODviMzyi50dnhIe+HjH37k1WgIm2uZbeq7KWMCbxR3j/Y7CNT?=
 =?us-ascii?Q?5UHGpF0GyVXAXc98LgecAgLkTHaKTo6MszBjnzxed+g0EhvoTs8zDCS2Cc/A?=
 =?us-ascii?Q?teyYn5Ypf2/412ZvUx+RSxDEhEN7fngs7BK01NOSM1evN50Bw1JxNLJrs/1D?=
 =?us-ascii?Q?JxbcgI6NJdMlJ39e9usvt+SUbeYhzkywe1UT5BGfvoPeTGDxe7pZTGEOKcQy?=
 =?us-ascii?Q?GKRJ7ScKVJk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zaHffcFB/z6J9mP5xVtyBGUJLOjsP7R9PAfmSZXD5lZr6YWZIioKeoHdCcWg?=
 =?us-ascii?Q?AvmcfKIefPC6/9qofG3FAtJlTFM4QN9zcQkwczxV2A1PBItwWHq6kheN4F2E?=
 =?us-ascii?Q?0S72CCi+nI/2tXf9o+slU7tSvAvUcOGr9VsMx3GLd46jg2CwvPQ8PJ3VsBgL?=
 =?us-ascii?Q?OMNBZqrRdpbnpxpy5DIkPn1T+sKckh0h66AV/zjzsCQ+1sxE/Joj5jvRjtiV?=
 =?us-ascii?Q?D02S5YyTzoRrNaa8ra+JfPwrErlmFhI3Eq3NsDYClP6sIVG551wUbKocp4S2?=
 =?us-ascii?Q?/0wiD18xL5ol9L8I6Y6GpfVc6I/uqfkN5PY1SPbia4esJHvg264Ss7FciapN?=
 =?us-ascii?Q?FtMkL4qoe31T99RiGdzCjvnD8K/QUHw835ruZj2QGttESaCOkLW0mX5xpuZZ?=
 =?us-ascii?Q?txO+59YA/yTBGjKqxBdbWD15L35GSsstUIDoNU+S08BrrvuuT1QBOl2uEHiH?=
 =?us-ascii?Q?gzY6pO1vKWwOVM2CmRnCuSvc63ahBAzo1i4dXJbZ30Rmk7qrP1hQ9Nn3wcye?=
 =?us-ascii?Q?QZQFNTIa69yip4wQeV3jOyJPrJcoOhW0cFdYyqJZcxss7q5h9PTfEuMtHl3N?=
 =?us-ascii?Q?maPmIGYXGL3em2UCLd8AV+xmUCUTqg+kexqwu9VOc2sxrkfW7y2vPlGrlShG?=
 =?us-ascii?Q?FvUqqX72QWgTgvA/NxxT4svqkxLL763gvWdBVqWwBoJUJ1VjOCftb4iUMyW4?=
 =?us-ascii?Q?m3kR66mKmjCzxQAcQL78D4IpW1pDyouUgl/vXp54u+iJlYl2TVDOazdKnl1W?=
 =?us-ascii?Q?LT/98Ov5OYfwm5MvXBGv5kSI2BBqX8dUvTszJMTu5Hl7S8hMNcYGrSPHXhw1?=
 =?us-ascii?Q?PxMhAKpHfvTY9nM0ZtOfn3Jy3KnhQ7A0fYtRXi0LdSeqS0mv2Dp6ABATAMrY?=
 =?us-ascii?Q?BJ81LiJ/lRj+GkLTKOcNIEuceGkNFF93uVSvCfQAc+FDWc5PceSvZKsXf40N?=
 =?us-ascii?Q?i6Rc+uPdsP/XSs1BPVGBRjCNOA1NUefhXqNxUwmymLbCE/wrUY9vRAbYJkGx?=
 =?us-ascii?Q?/JCl9F4IWqD/y9hhOEc5A5ZXDzHCbzMaL6LkSe6zvD8ELNRD9RkajA7WFREx?=
 =?us-ascii?Q?IBRDn/Z7BdS+gjCVbZO3ZVjAXH4YQGtevfi+5J/3KRZOpSp8jgj8OZQTXESo?=
 =?us-ascii?Q?Ro6XMoJI9NhAPIYnx+XaHvexswsXGiTgO7jhcYoDHdEjRW8apDmQa747hqEn?=
 =?us-ascii?Q?T6QJUoMyztLfrxUtAnH1cMzsxQiTfWOWug0di50e4M5WjXasT4h24ORUGJAw?=
 =?us-ascii?Q?z91WrDkuPAiTh6KsSx/uGrngWfT5SvNtXrzheaN//wf1J47DFcl6oxIJBB4x?=
 =?us-ascii?Q?2VXxIrdfNscUvrj3lYvFlF6QSeFewDW+ahabyi+938gnGw8CqSab7NUid1aT?=
 =?us-ascii?Q?CZbNuB0pgnRcVOYA7Z7tu6Gd90i9OU+fJuUcherAPnmjDbpn16nKA1qbAq5V?=
 =?us-ascii?Q?ni28a8EVumiWoAMxlJGk1y87+qPi5ApJ4jhjN+lNvzQ12EJ2ELzbJ+lhZ4KB?=
 =?us-ascii?Q?cL8yo0zLlXcljdZ47Xw1qj94JoaiDCnFTvXG28WDfyQ7UHp3vCEl6Aq12qEf?=
 =?us-ascii?Q?XqocxxkEWJuFcTFUeLU=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 110f58ff-4157-46e3-b99e-08dda6f5cfd6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 01:34:44.1917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1N8TSyaXTVJkWVSVKA17SsKVDiHLupl1sBthgeX9nalrRbk3BtjvwZcEoxZcd4+y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8925

On 8 Jun 2025, at 20:24, Barry Song wrote:

> From: Barry Song <baohua@kernel.org>
>
> I have been actively contributing to mTHP and reviewing related patches
> for an extended period, and I would like to continue supporting patch
> reviews.
>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> Cc: Nico Pache <npache@redhat.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Dev Jain <dev.jain@arm.com>
> Signed-off-by: Barry Song <baohua@kernel.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 99dcf9036b9d..c6770ebe2927 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15845,6 +15845,7 @@ R:	Liam R. Howlett <Liam.Howlett@oracle.com>
>  R:	Nico Pache <npache@redhat.com>
>  R:	Ryan Roberts <ryan.roberts@arm.com>
>  R:	Dev Jain <dev.jain@arm.com>
> +R:	Barry Song <baohua@kernel.org>

Acked-by: Zi Yan <ziy@nvidia.com>

>  L:	linux-mm@kvack.org
>  S:	Maintained
>  W:	http://www.linux-mm.org
> -- 
> 2.39.3 (Apple Git-146)


--
Best Regards,
Yan, Zi
