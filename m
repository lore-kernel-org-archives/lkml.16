Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2065.outbound.protection.outlook.com [40.107.96.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CB21EE00D
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 13:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746277832; cv=fail; b=ByNMggpZL6vpTKuVDJYvXtkzi8inXZRbLeLNmoIEWp1GuNr2uBnkQg0I9+MIGnHCxeVSSuzme7xqDhWBXReVk1giB+WFBTn1AlG/O8wigyEEZcbqu5sVuaMoU9zlBI3TQ3prAQzMFJZjWKrFGrgVH7uy4E5Avn6Vow70IeZX7L0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746277832; c=relaxed/simple;
	bh=uyACSWra6aaRLiu3I4P9BK+THM3ud/KSpqWqLCa7qTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k6cJ7pUg4QkXPER3AfWxopcVztXWGosWqlcMhqT15arwycmO7pza1dN7TTsrid6DCo05GzfMy9oVhZIxZPzI4pTO0DKkwFfCxIwsfN+CnSxNRk2dymSOaYie+Qz/O2QTbzbtfYZLy+PilnBgH9rdb+z4sewP8U9s3UOMOMaC5rE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=InxSHSrc; arc=fail smtp.client-ip=40.107.96.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="InxSHSrc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8sjkg+/2CgXuP6L/x/RTyZjnhJBXI26Om6PhCz8g0VowKLHFq1UczEOGWgqC8LwWzW4E6ZHc23h3aSrV+3p2T5uMJmVkGARjKxCVvLqH9sYeS073hZmJH8T1+eYUeLiP66+fOZ7AJ9TOZpuF8t2FmXAVdrbRZ09CvQFoY8ca6OhyQB4IUnHPhoRBHVQxklj1xHmpYzdFtVPi2LcezQwA4oLhfzDzjukTNhFKzvWWWFtEaS8ghOm8daho+2Ig/gGI4UJUbzjzD2IM51gasjtR6wv1G9MV2OShwIGz1xW8XSfhjPBC9t75CycoDW2WdKV1DzGddAjQPsRfCud6D+D0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fwcs+7KI2hB5on1rY/QNcw72wu1Wg4z4mB4REWgGyxk=;
 b=ywTNq1sK4X1aMo3e7YWX3t58cjb+3ZAuJrD0VMk4SOkQsDDFJLaFe19DweDKmbV7161wBnusMC0Xr6ZpGM4YaZr9/Q6vXLyydzZSbLAUde82SZ+kV9oMV/mzj6eC5NXDVNp1w2P84s7hIH0k/FaOmiXQ1mWUHWM+p/VeRUjnd8Y8BYI6JtFldLx3RhJV7HoxAFnctWr0APeRu8SEfD5WqRswZInItk/ANpbwpAfFseDyttlP6cIRJw0/zX95fbsK2NJ2iqa8GnWBYk4k4vCo+Zpqo5FVZ242UzPgXZ56zduK0SC30OOIOkcIflLZwbPAd9WuiyAfUZEVBXTUo6rTLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fwcs+7KI2hB5on1rY/QNcw72wu1Wg4z4mB4REWgGyxk=;
 b=InxSHSrcBquCQYFe7sN7/neGYvevZ0aL6edD76k6I8WgtUsemHCJkDv3zjw17ReHG539WstoYpS6GY5uQSboHG3FEqbk3GYXbmrmSReuetG/16q9XtJrXwcZzK6OQ7QEyixWlrMr/qInSDoPdL+EaEEljL8GuaEd1Nawlj1Y8d+mpBzBijYnLzWYmIBBxLDc+jAJLcciJ+vz6PW2IL7aE/YbEdXGTzL7bvP/bSa/IZ3vi2yQLWjsEWUvxFhUysnM+nJJhYcwqiClZbgCOk+R/cLsHNeW/LdusBUjIPyO8iWUfCRlKQQ4au9QQ9RGxRHXl4taSthRNeU0qkzrMS90mA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DM6PR12MB4220.namprd12.prod.outlook.com (2603:10b6:5:21d::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.24; Sat, 3 May 2025 13:10:27 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8699.022; Sat, 3 May 2025
 13:10:27 +0000
From: Zi Yan <ziy@nvidia.com>
To: Donet Tom <donettom@linux.ibm.com>
Cc: Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@redhat.com>,
 Oscar Salvador <osalvador@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, rafael@kernel.org,
 Danilo Krummrich <dakr@kernel.org>, Ritesh Harjani <ritesh.list@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] driver/base: remove
 register_mem_block_under_node_early()
Date: Sat, 03 May 2025 09:10:25 -0400
X-Mailer: MailMate (2.0r6249)
Message-ID: <32A5F5E1-7654-4176-8EDC-2F3616FB321B@nvidia.com>
In-Reply-To: <871e79e4583fcf5f28ecbb37f28297098f1ac748.1746250339.git.donettom@linux.ibm.com>
References: <b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com>
 <871e79e4583fcf5f28ecbb37f28297098f1ac748.1746250339.git.donettom@linux.ibm.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BN9PR03CA0046.namprd03.prod.outlook.com
 (2603:10b6:408:fb::21) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DM6PR12MB4220:EE_
X-MS-Office365-Filtering-Correlation-Id: e62495e8-a4b3-4590-d8c9-08dd8a43df33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b3kh2RCwsGOE7HQQrduNtgI4+QBjB0K79C8hWv6cuiX6UJM9P7A5Rl+PVJIX?=
 =?us-ascii?Q?6osBiEi52wggAXt3Vg20O2qhktsqNOZjg4G6nmDSLG5PG07ROTqtHK3uTF8A?=
 =?us-ascii?Q?UNbv7eZQMOIlOmReX+5EaOOmS09Sg2rR7//vYjkRmbr92apsb8IR/MuOcFzl?=
 =?us-ascii?Q?rBn6dp9txCYLpfa0XuJj7iyg68DfwCfavSOTtSctyqo5WENO4NYO+lw7Y/Je?=
 =?us-ascii?Q?7o4XuMs+BySwuNvLySRKcjxNkRY0medI1DmnqpXB0t82r7cpYuWuFD/Bb3vd?=
 =?us-ascii?Q?sHOhFC3sAvm5AetDpdWKFRGnrA56VYiWF4YNyF3sAJ6h4RpwqzlLcyBnlITs?=
 =?us-ascii?Q?WJpYxPx/4NCXJ3JaNx7guqUbm75n29Hu6CGmKlbxZTelLqg9G6OBhyiTMvcj?=
 =?us-ascii?Q?UqSg3UuGSKoFqFYJhmnoySNiekPPEjF786eLlrplJVIIAMvjzrvgtjhZKgkf?=
 =?us-ascii?Q?uoID3VbpDz0uJne5fSVTI9a8GRc0CP6FSiEDyw34go1JDOfDjHZo3HM0ZrhH?=
 =?us-ascii?Q?OaD2K3n8GFnInWPwnjpUcuIZijU15uVF2Eiz0pquVT3CEERzcD4XabsWbvjA?=
 =?us-ascii?Q?vdLXgnVckiLSEmngqSa+8uscmZltYUGsXbb+Gt2v8IHJZUHdt5xE1vOoQY0h?=
 =?us-ascii?Q?tipSTPJ3vDzaZeGKFEaKHyzl+jXUu48VFXFT4NqZDsEIPDa3vKHP+Js2I7K5?=
 =?us-ascii?Q?2204L+0kmzza9ZqIvwLEpFpSyCghJc5+McQLqDaT6U/eenJLJzy4XeKCzL9B?=
 =?us-ascii?Q?VJZ+WkKCQTUgxGbylPRZ9QSunK1vVyrN7pEy1iK30l7bYRmpKske01Sv5aFp?=
 =?us-ascii?Q?S8IGq041BFqUDx2efnZ78W/TB7XEhOUIckozewfMmVFgSuAhR2TiIKKMwWrE?=
 =?us-ascii?Q?SpElG5QHsoLNR/PfYDsPdFnkRzns/3NBfXjDrV/nANPlHhqzU1+ZYCepFYSN?=
 =?us-ascii?Q?By2X+R86em/wmj3AsN9Ocbz1yJWJYKhrTyp3G6CYfixInTXtM1vq5e00b8aV?=
 =?us-ascii?Q?XjMgPqcXdVeT/7iBODVJNsGH+uhs5W4EDAZ8/peVrdqO+A9nsh8m1YxXQ0VG?=
 =?us-ascii?Q?iwFrXqGDj0kwiZHKkhNM44wYoQx32E586ZzGmaAJ+jI/UGw1zKUkaRtdWFYJ?=
 =?us-ascii?Q?afdosWWYTv5sQq/FF1vVttyeUt1fvltwdUtkcieWscTJ55luJywZyYhk0AX7?=
 =?us-ascii?Q?tsxbJ47VH5MGxPcpM/IZr79RRK3UvgBcPgH5z0nGayxZ4/RYu1QZ9NuVu219?=
 =?us-ascii?Q?EnmbeAbaBYS1Ky1HCzKB+ml9IjT1KCzOqkavmVKscphIzTWE2RZ6feJM/mI+?=
 =?us-ascii?Q?QlfEfvDbFbD0mkEthZaaax682zFbT0gq4XqwsAIseJMHmqgJ0k80rlG+aPIy?=
 =?us-ascii?Q?DacRGkoBF/2eKUj5McZrciW9uUtoMTrLDpDgMFIVcqtXcUCTuFiv7wr4+s9k?=
 =?us-ascii?Q?vQzMvFL4m5Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aJiogBA7fCt6frSXrx1wxP8VIIh6ksatlZwF7r4uSPijDJX8DM3JLi0wvtRW?=
 =?us-ascii?Q?yUeotPQXPjZDk/Zuz790gZnRCesugzvNOinNmNA60OsxoJJWHmsZY5pyKCHK?=
 =?us-ascii?Q?qLUroHsYPc+cTim1Xd8hYXkxOASS9DD9LjVL9MouAdF0yePm30NotTnfQSkh?=
 =?us-ascii?Q?8cN4glshT7BQZMtEEDRMRyh1srKjBX87NT9SVdAAygGFN3gPZjpsCZqTwVbo?=
 =?us-ascii?Q?uZaEjZN3ikfDLiMU7oiVCi32wOlTDPEshp+UkYt00Z169FniRLbNj15Y8UBR?=
 =?us-ascii?Q?JbUKry4iNnH0Om2Y+Df5wOsoDfTmLTSVHUfMpu/6fL3YRDlCyId1XHdqFDgz?=
 =?us-ascii?Q?SJXzHFgsA226V6FqHf7omrlicLXZcShWdnXbhA5kmL3WUGkKWEnwlQiz9hnY?=
 =?us-ascii?Q?Ivn149Jb1/cg6ZNvtxw1WveLwkXT+XqApJnuWctriVwZWcNyC82WCA2yZbY/?=
 =?us-ascii?Q?I4IsRJDKHJkPMZnlr/YJRSm+Rkod1Y0K1dkcCLYryE+8LKDQrz/uX9WOTMHD?=
 =?us-ascii?Q?h3WlSatcDNKuNEstFy4/OtYyvmWVfETl+HYaEIGcgn9fwMSXqI6e8LDaPzOK?=
 =?us-ascii?Q?PzUZpfF3i4KeqaYOHur1t6YbEW14LMAvR1KpHqtv6xcGv+46VagEoek/FciE?=
 =?us-ascii?Q?fzuP/M1r3Fv9yOwO2Gfde1C/rq0QX0KvkSpebCRVHERCWzPx/W5XQGvwDUM9?=
 =?us-ascii?Q?kkNxYw02Xy3XrNkvkIWXQrShYY0BPNBjjeIGT8M4EDeBuGLG9flFUswyKtqn?=
 =?us-ascii?Q?IR8GGD3r2HFumX/p6ti6EJBJe0vS9Jzjs8KK55a1A4HaO1XgWVyJwKhfM01L?=
 =?us-ascii?Q?7WwGAK5XWiM6Xg3ladgWkQmSbtrMvPKbKINuxwZtzgLXWTgyVm0VCIVruZsG?=
 =?us-ascii?Q?Aj4U3Dzg2/gXrzsIUj4vaUqDUUxg16bGAjOjrnR4SMcYhIYxu7RxXh1b5mQV?=
 =?us-ascii?Q?vDgq9EoF/RIZgHxrIqw6hY8HBVpo6N9jNSIu/bFvz5iInY63jW5s2de6erhQ?=
 =?us-ascii?Q?ZUz2MKHdLhQP65nH9zgLKoWpPzejZa1nHdwwXsKBGmbdnLNnFAaWjjdazUz8?=
 =?us-ascii?Q?LhVVzASgBuvttUHkmcZzVaZeom1jfds/eERBP32zaORn9wzqK4eOkWSMY/fC?=
 =?us-ascii?Q?O3UG3uBc7Hr4WkW+OCMgt6VZtquGwhlLAhxIZ8I1sjqKhohaFGLvO+hflaCu?=
 =?us-ascii?Q?YMmguchWabadDX0Ag/leZNgfuxc1TovBZG3ePCfYvVnqPS++zzOjCQTl5Dos?=
 =?us-ascii?Q?YnZ90k1tMhuH7VAN3mq2qLNeOiYqSsOxg5J+U08vSmHwVcdrlYh45dN8kb3+?=
 =?us-ascii?Q?bufY3IQmVQYZTYTtwG5It+Xk7dWfBfWaBr5jGztX3EJmQGr9GG+stFPRobGS?=
 =?us-ascii?Q?9q47EB/z9iMdxGllJ7AORpDPPIV+T1f3enMH569604do/FaW21YWlDm9Ttti?=
 =?us-ascii?Q?yeFVGKs+PJFLKjwQvgN26BktSXUcNUeo9kPYX0TvwozQfPdx4xzjTwTNFyU3?=
 =?us-ascii?Q?lUsMt3zVdcclkWk4+QV1xXR2PrPt/PQGznU8YGaHTeiLbtAPLZX9DVoY9gxn?=
 =?us-ascii?Q?eZC7ilkD+3D8v7oBbqscNYFcR3Mb6htwXMNH8JL9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e62495e8-a4b3-4590-d8c9-08dd8a43df33
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2025 13:10:26.9618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FXLPVihTJ/S0hH+1NWShXaiVwsGkJ12dwBOizXpMdsBJa/wn4NjgfhbmVIPHE/J0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4220

On 3 May 2025, at 1:40, Donet Tom wrote:

> The function register_mem_block_under_node_early() is no longer used,
> as register_memory_blocks_under_node_early() now handles memory block
> registration during early boot.
>
> Removed register_mem_block_under_node_early() and get_nid_for_pfn(),
> the latter was only used by the former.
>
> Acked-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
>
> ---
> v2->v3
>
> Removed temporary variable(fun) and passing
> register_mem_block_under_node_hotplug directly to walk_memory_blocks.
>
> v2 - https://lore.kernel.org/all/fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5a=
c7.1745852397.git.donettom@linux.ibm.com/
> v1 - https://lore.kernel.org/all/50142a29010463f436dc5c4feb540e5de3bb09=
df.1744175097.git.donettom@linux.ibm.com/
> ---
>  drivers/base/node.c | 58 +--------------------------------------------=

>  1 file changed, 1 insertion(+), 57 deletions(-)
>
LGTM. Acked-by: Zi Yan <ziy@nvidia.com>

--
Best Regards,
Yan, Zi
