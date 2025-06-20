Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067191E376E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 17:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750438966; cv=fail; b=S1K/Ip+GM6VYLNwxi+M1JQE4KmJb3qztROseeBxAPzLvGQWLphUCRv8YbuPGA4Oy2/+b5McXYlCLODLhyLx4dmde06026GTTkL4NmEReUO4bhXusLgDW/Ss08UMHt8hVliFgsiK6+r+W7R6wU/AKiZiH6Ne+rZILk9QXHt6sA70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750438966; c=relaxed/simple;
	bh=NGkA/KzFMbdPShhjST3Ok+AlTUjmG6UvUZiOq90e0Os=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dNs3UQsBzPRf3frwTQp+lF6frOrVsuJDjnGl6jonJihOQHcmf3SfRtAGMx9TaQIrX9qsfdrWTMN4jqN03NoU51A1tSe/JHfeGlKZFqeFG+JAydkVhctzyYPHXW4v43nAgIYOiMCGQ2bTC9qU2s9UuIuuk9kMZRvupIGlvchDvyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MPtM1xP4; arc=fail smtp.client-ip=40.107.92.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MPtM1xP4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pmJIZIE2Jn7TIYIrCdvPMqNoSGrq2nEVKWuLCItjYmCCdelR44LVjkn9wJBMSrb/XYvvQGpjuCkwixCpmW5NieKE0wFO2u2NkpLVY9itXCfX3/tY1DfNuaRl8UYfori1TGm8X6wKezwixatn5Haea2t37X9vkXc08MNcKk0U9Cm8bj11dcPoppkPkPnkIsotgcXSD6bxjJi5Q+vWxsa4nJsMR9RjrR0RDwBt2lxislVLeBH1RhNSjh6Co7odoxCtDQB8AGSPy6kYIYNTHqZRS46+AraxIlD7jWBPs2y4AFcKP9COsLo5pF+YIBJ7ZxXENc8LhcEJgfj6oK6zeYWKBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c9n1KmOKFMv4yg23ad+I1506oniUefwWE8XfexAfDVM=;
 b=KGrfApqIBCrkKV6gK9xEIUfaWeOEF2lpZz8A+E01xEYJP7K4wez8F0dGSiJRifBm3viJEDL+VCx7ucldHeW6dx6wiMbROJjIJJsQDqx6iUSag6r+1JU+M7WdqEfoWf7xnHrFoBO8khYJDSreCTKEWr/ihNdMab+XhImj017I2ePrI4ztQWqWsa1TwUK2fPVa1cNJRCtZfR0u8F/r8OvqTHk05kasO4eqcyr7wIYqLOxqhPesLA7L2NCSKCm6AVOrLInkxP1EaJ3UGdWD6oseLXWqxTAqJErO04TB+tsoRU2KsMnMFe7is8YuEwt+YocFm1yBZk2/Hw1a7SfIE2wx7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9n1KmOKFMv4yg23ad+I1506oniUefwWE8XfexAfDVM=;
 b=MPtM1xP4F2dfEUTp8ZeUiPjoiGLaMs/VW1kpu6VlUgQFkf3+skkv4VllYNI/SPkNc9AcGk+Yu0aBE4CC5YWzyJq2eI4Y3jEgXWSA3tfrA/ziGD0uh6J9UUH/F5idhrRIUpX3OQIOUzuKskwlRxiRFZfErWR95JsfKJ35w9Nh/crJnTHJVFGjZbcGE5hqiWQ5ySaQVdaTmAwdJwczSIQj3n8Nops6tzqDnWKg/AS7eyDd/wb1y55g02VyaFhdK6f0/+UD1D04WzqCTMCfkjLn13ArndxIEiOpHaAw/4ruF51HAhGt02tXT1XRx99paeGIvdHAsdTufAdat/aSMHZpwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 MN2PR12MB4078.namprd12.prod.outlook.com (2603:10b6:208:1de::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Fri, 20 Jun
 2025 17:02:40 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.037; Fri, 20 Jun 2025
 17:02:40 +0000
From: Zi Yan <ziy@nvidia.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Jann Horn <jannh@google.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Lance Yang <ioworker0@gmail.com>,
 SeongJae Park <sj@kernel.org>, Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v2 3/5] mm/madvise: thread VMA range state through
 madvise_behavior
Date: Fri, 20 Jun 2025 13:02:38 -0400
X-Mailer: MailMate (2.0r6263)
Message-ID: <E4B93300-C21A-4F08-9CB6-3C1F0357394C@nvidia.com>
In-Reply-To: <518480ceb48553d3c280bc2b0b5e77bbad840147.1750433500.git.lorenzo.stoakes@oracle.com>
References: <cover.1750433500.git.lorenzo.stoakes@oracle.com>
 <518480ceb48553d3c280bc2b0b5e77bbad840147.1750433500.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR01CA0039.prod.exchangelabs.com (2603:10b6:208:23f::8)
 To DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|MN2PR12MB4078:EE_
X-MS-Office365-Filtering-Correlation-Id: 866206f7-f362-4dba-ace8-08ddb01c43ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DL7n2cGWdEJ7er3j8x4EVl6CfE8EJThNrNMQhAXMVHjwZxovYtn5mMj1L3GS?=
 =?us-ascii?Q?R3oJCk4P5PkwDehym0WWI0I0YEwjLcztVCrBHkz0tJFp4Kzwp90MQVuoTr8Q?=
 =?us-ascii?Q?OmTIVc2WrrRkBkrhfqslCNbirz6Oaq+0bxA4Ds0IFsCkJH6ehIEQACxOq1xX?=
 =?us-ascii?Q?vZ07zMansknwzD9RPp7tmF1sKSnNBtMMzYuFcquEhFW0PisfIrUwVpLq5mpd?=
 =?us-ascii?Q?JFUjFA433C5DcZoeHRiHOy1K2lpSIP/WrOy5o00YeYfTHeTZzEPAIDShNjSx?=
 =?us-ascii?Q?ww0SYlo9mu6zyUo0ejRX1aHsoU11fhb8zxV+sI6883CZOlKKhMeM5mY9il7V?=
 =?us-ascii?Q?3YaEVYobWygbqq/UfbWiTf+vOQhVl4QzmNBE4hiKv4cM3Qdr8jT71hNQV0kV?=
 =?us-ascii?Q?YohsmmKKzoG6BjS+w+R9P7gDWnawreePh1PGL4UcBTMfCqYLV5bHvMqRIM2v?=
 =?us-ascii?Q?sEw91JJhoQ0Tujjv1xzUHump4ajAHImza+JwWxjdD0tygZ/Ax47XUOzjKDyG?=
 =?us-ascii?Q?J0biJG7WO2haJAmkFmM9z7U3k4I3fcbkYu9PpanrmOsjIBNeUYGOZVZz1CHL?=
 =?us-ascii?Q?3dzf/njX97Bdu5PsLvpmTKqrKMjFwAT9tyUv3v/nlH9Yn23e3z2kb+kVN+8L?=
 =?us-ascii?Q?DTG9wtOEy9cBfps4m1GpfO+oIW4jGhkYL3ad/JZJQcGL/S8blz2XaM/w98/j?=
 =?us-ascii?Q?DtLLP99Mw/twPnwDB8Q2JWx66Z+XLsrOz6IDnkEiaB7Y8+9dcHH8X2tBl86g?=
 =?us-ascii?Q?RjrEkmeSWpREgI2w78OlIqbaSqm1sTwx5ETqdZ+Yka26Urqae8lheM/NJTtL?=
 =?us-ascii?Q?P4t+arTfQMmPno5lwzHsHQ4fFFbjtAh1dsz0QiKLUz6epToZs0vsJL6paNbf?=
 =?us-ascii?Q?3M4aEsiG13tEwVTuN+gRKDIdZ60DG/L4y9SgY6QfZ2S7s000WU46M/gv0Ph0?=
 =?us-ascii?Q?SLQc+flqkRhQdpK3So6jHF7j7ns3ySruRdbXpoKz9u684Ezpl1Eb2zt4mvB5?=
 =?us-ascii?Q?cKtaxb9nOf9jpB+KDmV265qeQ7JjQeecS3mWYN8TGQ3QbLx5ra1pzrAerDzl?=
 =?us-ascii?Q?pXew0k1VXjmJrLLElCGp7swrNEmjAXaZkxCBQVudPVu64HSRD2f3zG0YChLW?=
 =?us-ascii?Q?cv7GbbjJr4RePjMr4ZoAfWGk2iiE2pBC00xD7S9EiFU5exNiWlRUfhqrzWV8?=
 =?us-ascii?Q?CAn+A2Do4ODpmFqy9QL/cA2sH5L/Se2Zu9Waq+juwaX2n8XQ5O6RB+Dj8usM?=
 =?us-ascii?Q?a4gmrM194kHKDa+U7vbiMdUnDufNRMbpTeXY9MxLoujIrkB0mqFNb+cLTxyz?=
 =?us-ascii?Q?SeuUXGcvSrFoXnjjjIv2pJNDJYhW9qlhnUIgW4omVa6UUpba7sTEMLflhl+n?=
 =?us-ascii?Q?mtTB4ibOMBF0F7B+r1AQiwsJPwr3Ko5ubJ/BBGXLV66dUUzYkpJwuokOHk6o?=
 =?us-ascii?Q?AtXGVlwaLHs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?28D86Hbdy7m9YsjwzO8113nlcLPB2E1SyA9nNpwXEpYkKIHLZgzLWELP+725?=
 =?us-ascii?Q?BlXOk/B3iZFTQJ8wWNDw4VZM06K/L7ufK4G0tQaj6VprMOnbfl1wmbN8+EG9?=
 =?us-ascii?Q?P5iRRdr/7RkhZNVwdJv1mQOfB/BvOk+JT9+6lFHa3knAc2USBllRhUaQU1zn?=
 =?us-ascii?Q?UQ0nz/KbVrO/Csxqw0ip6wm6Tn4j+jgSCZqbIR9ND9ZQzvmax0zVhxoZ/9QL?=
 =?us-ascii?Q?N2YR7J5zrhJLTMVpGXMhoNdERI36Sc9ApDH8DosCW89I9SKQOgM0pExG04oi?=
 =?us-ascii?Q?t/a7Z3nrCr5Welt/t/sXuS6D5mikRKUOVJ4NgUMeOWUjf7mBqTAVpnGzWV59?=
 =?us-ascii?Q?uJ/lyc6rkysG6GLOMEb7bB9LmcKFHAL/If5zqoX9/V3G7I3/5ZEN6VZ/oiw4?=
 =?us-ascii?Q?9MtEcUVHsNk6Bm5v5DcgKy6ryssBVAbICzg+A8obo8zwgDpK4Oo8Op9V2nTM?=
 =?us-ascii?Q?4iwtmlsLzAmDiz6cSDyJSsE/TMc751BP3Q0p86uckoBIKpAwad6ZdWypuoFS?=
 =?us-ascii?Q?TEwGoBGCPRvccCHUvZ6GW1xVRE/1JZzUMXqZqZp1SnbPyOA2RbvGmIqk5FCu?=
 =?us-ascii?Q?zkwxS1mpZ+pdrnJ4blctZpl4AZmY93X6lUpVcURQxOn2hhhd4CkM6OaZX3ll?=
 =?us-ascii?Q?4cR3PDb7tuFhV7jam5vIjHtDAq4xvDujPrn0x+FDZ7skfJnuSeJsfq+wyYUN?=
 =?us-ascii?Q?PL8BQmOYVDFOxV2KRY1dtRUAOI/ukS73DtFDvVSsvGbu1lN0EpnopzckD5Hm?=
 =?us-ascii?Q?N/g+iEkGKG6c4GoAfRjFWqR1vqmZqZf+wbPYs7UyL3TTcp8Rn8Ybmdvy1pd6?=
 =?us-ascii?Q?BHfe7QjNkZ0tsGtJbqkdAToz7Li3VcAinBOaxv71yumRgh0UqupSPJ5+gfli?=
 =?us-ascii?Q?Q9hP9UG0y24LPC+bS5F5MEcgawPPYpTSuV2PAYJFdFsCgAuwAzlEhePoRYWi?=
 =?us-ascii?Q?DOKJU3hG0xRuyWtVM1oQke3jO82AsSzTFVS/egLiS6y81bCqEGva/6q624c9?=
 =?us-ascii?Q?YKtDwAmbqmbN2BQyp5CaGS6drMIpdMRX4jHiGX8iIxDlSVPnNh5TzqtcVPRy?=
 =?us-ascii?Q?U+iBAP2QdmPpW5eDs5JAFg7KDMWLjct39iIN0NidmXVQ8ukaPZp3pFW64WpH?=
 =?us-ascii?Q?KhihYlXh88y+L14QzGw4T1JqNj685TBa2TYY5QNaMNzoj7lrVgJDI2BSIe8m?=
 =?us-ascii?Q?zhpnCC48v//DHgHJIkU5jJDSJsF04jw8o25egUE1BQlk86NTAUQy8dJgL3AE?=
 =?us-ascii?Q?iitcpJMkIuiY+P2sHmReXZgJr3679SvhOsfTzSoHZb4kcSSwKKii3IixSTrz?=
 =?us-ascii?Q?nXJ1azf/9mK80ZrhuKoiqSmLlu+oPswff5CRQZmKQ5nlLePmwptjERM1Rh9B?=
 =?us-ascii?Q?Aeze3tzoOdULESLUNipk/xd9zFd11bIwZBV1jp9BLhSfzBJSm2RLCUVS6oa1?=
 =?us-ascii?Q?tv9m9BB/O8fFcrzq9CcZaL+t7CV3NhTtjtUkDXJqH7NTMM49AdANultHrFPk?=
 =?us-ascii?Q?slfZRk7H56fvRD+EysY0T9HUxKOTGZCGX10YJyO09n9J6HtLmax/YNiV2aEb?=
 =?us-ascii?Q?uxTfYiWf86VyPfmqzy6MtP6AGVRb/nhZXFG3E0xY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 866206f7-f362-4dba-ace8-08ddb01c43ef
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 17:02:40.4241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CtBRdxdghRVw6BP2ICTvohjke5ck6VmCz6On2dZAsxc86DUhyL/aRdDfjLS8Uxdd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4078

On 20 Jun 2025, at 11:33, Lorenzo Stoakes wrote:

> Rather than updating start and a confusing local parameter 'tmp' in
> madvise_walk_vmas(), instead store the current range being operated upon in
> the struct madvise_behavior helper object in a range pair and use this
> consistently in all operations.
>
> This makes it clearer what is going on and opens the door to further
> cleanup now we store state regarding what is currently being operated upon
> here.
>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  mm/madvise.c | 103 ++++++++++++++++++++++++++++-----------------------
>  1 file changed, 57 insertions(+), 46 deletions(-)
>
Reviewed-by: Zi Yan <ziy@nvidia.com>

--
Best Regards,
Yan, Zi
