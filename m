Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB94241CB0
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 11:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745581219; cv=fail; b=kTLPji4VAaN3DasiUCY+IwQQuCz1aabjdyvAaLEQbDYgVs9Hm7Nw7pvUjUQXaBnI+BpeQlkxXjrJhXOl+9+nZO3QoGYjvnrEjJA0x6bkI7ENGwdeMP/72g3+8sYNUa1b0gf2ixsV4+9TApgdjFmuiy9napn1Rf/awWyqXi5t50E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745581219; c=relaxed/simple;
	bh=IzsRPC6/DZl5CtCeQA1EuFHArJa35qQMpHwz+8tPnUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Fz63t/r2LIiSH5v0AV8mejXe5Xe0grGfUeD6zL0o1eUH3fQjAfQphpeUll0rI0svdJ8OmrCRSaFeMKagl8siAcFrzqOWCggT5esJafp74TToZYV+JWw15/HmV6snspYXCCfeG1PaKopiFN0PG7dfa9Xtq47Q/z/2cCNVvMIJA90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jRjFnpe+; arc=fail smtp.client-ip=40.107.220.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jRjFnpe+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D3vRqblYgVjNiz/STl+jdHYZHmwinM4WsJh5AOwza5PtXGcsM0ENM6tP8CWN4sY3WiOVZYMp2y5x5r/fbtvKXkgmt/5aUFBG/CNZoajdK0tuBfftbSZOWPhDQJaOrVeeyyUHhQjGlj2fD2o1j+q3JTgKfZyrzpeU5xTLDYiYHk0xA9tm1udFTnuaVTXpY3sTCwLHffiA9Y/gTVeBY3KEpbVpWd82yuIAnjCRJ0WBlIC94Y1cCv74DXIYATRNWBfTqJoZnDDX5YHJJYFS5vjVERym7dnFgfsnpV+PTD01ZodRclAw1aROLdgJgtyu42CrESrWowK4TWaFgKRblg531w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4d0gJd8cHK7q5mKql+OR+fArTnx5oNfj55Xl95V4434=;
 b=xyOxIXvE0mbZNkqSCk2VYfmpdBhHuuNwWcx0ngZ0fHUcdaPZJIAgbCZU8z3LABVqg9IDua6MBDSNQOU5JFhd6njdJJ6XCWmBcGX7UYRRR+idCkXTohmOklrKl845lX/9umhOrAPN7c7PBiG5El5uk8+F2o8bXXLF7pnoHjGMEcrnYyJTx/k0xcBGE10UuwMzKuZstwJGJRX85zZEtprGHM/Of3LFpvpDZlx7pvN+d0nqIcFBBzbSJ9WXMKnjz50F0wyj6cakkjooVzrVfAGi8lV5HEKbjpLeFJUJLiybwSTVhDRY5JVYBJVe4bAt0wckLPRusRdUD9ChDlM22wGuNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4d0gJd8cHK7q5mKql+OR+fArTnx5oNfj55Xl95V4434=;
 b=jRjFnpe+jltzQiAMKP7zHom71s/OJU+qt3bvr4ZR+MjDI49ZINM9OaqA9hwSPiI3BfC4+zKYdB9sBViEp8Y/R80QFSy67vXHYNmYHQx/ajV/K3TVT0CXV7Exz0FbuR8J3uzXgoW8DBkUEQQ0Qt/pJUUu+LaCMHxaZD9ziBDsy97hNFOYik/ExmbCl8040Be+h8B+NCpisPvJswvfkwhN6dxhtr4Bm/wVWCBKkYG+cYgJ8Yj6FgOX+APU1CPePKi8jY6e/+RObdnWVWrd87hIHD+QWs5yviQt6GO+T+LOalXbu7hIeDE7ySxPaeBY71w3Rg4e6Mqg1jWywbF3hj0TuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DS0PR12MB8319.namprd12.prod.outlook.com (2603:10b6:8:f7::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.27; Fri, 25 Apr 2025 11:40:13 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 11:40:13 +0000
From: Zi Yan <ziy@nvidia.com>
To: Gavin Guo <gavinguo@igalia.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, gshan@redhat.com,
 david@redhat.com, willy@infradead.org, linmiaohe@huawei.com,
 hughd@google.com, revest@google.com, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mm/huge_memory: Remove useless folio pointers
 passing
Date: Fri, 25 Apr 2025 07:40:11 -0400
X-Mailer: MailMate (2.0r6238)
Message-ID: <618D4D49-EAE3-42EC-9B51-BB45996B7D2D@nvidia.com>
In-Reply-To: <20250425103859.825879-3-gavinguo@igalia.com>
References: <20250425103859.825879-1-gavinguo@igalia.com>
 <20250425103859.825879-3-gavinguo@igalia.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BN8PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:408:94::20) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DS0PR12MB8319:EE_
X-MS-Office365-Filtering-Correlation-Id: 25356bdf-cb2f-4184-b443-08dd83edf154
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dKaS2TFt0+9uon7iKKvV0//A8euX/vE+fIOjOfCzY8sP7g2ItEA9MHc6WRKq?=
 =?us-ascii?Q?xkJ29e5zpI8KnY7elc1oMzi3hiHHicPEMhZDOUgpID8baQ3RE21TnexSBjAG?=
 =?us-ascii?Q?NfUC6vwf1Rhiy94CEyz8677fRoUT5GS7AhnlV11vC8HPk9sjCwcqItjZnsT2?=
 =?us-ascii?Q?A9bsQOXnv4yyWXgodqVYi42frbQ8MqI3SyoFSf+3CD2W3UKy7a1Qym6rM1oW?=
 =?us-ascii?Q?7QeTIGhPBzeoNcnb77Mk3hA+nCaT3rA4wZDBOoiC8OJ0uRejSFkyOz8oEUFn?=
 =?us-ascii?Q?H1CjWNQ5U128MVs5O1aLv8AZ9SVyIsSfWaoMRqJjpo/Pv8VDp1nOMpanX7Ta?=
 =?us-ascii?Q?q+uppeHxnKVAvrWV4bEHEzY1gcMj78JT1+yS66wgvmOp1fY9WzZbfWpgE6Bj?=
 =?us-ascii?Q?8eOZCBZIL0aoHwSY8my7BcaTnenvCpa/qZSqRTJcIiksb/d1RKoN00TVtxFP?=
 =?us-ascii?Q?/Y+vMfSJyqrxF8JYUaf7YmRX9d9vuFX38h64fwAbzjLJyNM5siXbp9JR3puL?=
 =?us-ascii?Q?f136KbTfyKmLtiYwtNmP1nHonLwbuJe/mmlrvydQKiDLQIp/bpYpfdPyJRCc?=
 =?us-ascii?Q?O6VUQmiIoL6vJeqjEqelO64kgDR6WLb/otn0G+4SgKy+C6MMBUYGzPvuXK6D?=
 =?us-ascii?Q?lD1YQVEZ6KfiOWuHASFVbUP1zAkjIk9nvdyPOPSKAXniJd/RYem6R1EBB2na?=
 =?us-ascii?Q?9TObD4AeF6Lf4YNYgyhNriQEaQi+VfSY5CAbre8w+/oZAQJBmqrw2eSQgChn?=
 =?us-ascii?Q?taHfRNCrrcgcOVZPwDriAca8bKiLQMJivQqOH5wHIQwgctLBaxs5aBoqFkGi?=
 =?us-ascii?Q?Z2NrVBNpCoN2lVTE+CVXc7TQe92v3LVOQiZ/FYDnwLsu12e7/wuGBZQAVIFW?=
 =?us-ascii?Q?el286wUzKxKr8yeGXIW/8UytqIHcL1kPC/NceTEE4RE7HEF1oGihLwSd/0p6?=
 =?us-ascii?Q?Sd5SLpt7X334HO8WcmF+fTs2eZY8no/pGAnxCh7hLfp9RPGS7mHmHo6H8zXD?=
 =?us-ascii?Q?a/ds6gilCWXSIsiyi7X0kWftDus/rXm6rnkuGsGxzq13lPknuWOiNBfjhBwQ?=
 =?us-ascii?Q?/G9uWOthflSr1gfmC6rb6Z4m4O4YjJAu3f72S3j8WlHSPVKu8SfsgKHOxpr9?=
 =?us-ascii?Q?NoRRswSSW7EARN2Pbn+brJofAK1QMg7rgs/4Dipm4bjP8g7LBVj9TzMlXNWU?=
 =?us-ascii?Q?3UpA0dXVi701AnV001/mapze+DsQ4NZgNx22A7Is04p3DDLHVlntfT2EujrJ?=
 =?us-ascii?Q?pDzxOFQkPq5ylqNVdC8nPTAoqbCXMA+Vx9ZIL0DLFw6VQXk94J3EKudoztmb?=
 =?us-ascii?Q?yK1C0R/daNBJYQI4aNs8pdLuIQQPLWo3LRZ4UYcOhioCJS848HxY650SM7AF?=
 =?us-ascii?Q?axEx4XoVB/0/Sbu3K9fH1RzvGcYp+E9OZV7+IbJuxscyqqukcDIKi0H9k+42?=
 =?us-ascii?Q?Hg2ljrbp/xQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XyF9u5Rc0VE5Nv2ndCahgpYo7qK85X0NEb2V/K2oEHTb5HNlS1qtbUwESyks?=
 =?us-ascii?Q?2/Y3KukV1nLuHkbcjHRLVBWkUfS3pLtkIEYDq/+Q/TKTd6m57B7+02e4iYCk?=
 =?us-ascii?Q?uBx8qlev+BdA8A/CeVB883z43dXD7fYvJAbCggeIuO8cn3x4/WPPH3OZxXbO?=
 =?us-ascii?Q?0pPWFi5JsDg3k0SOZ9YO6oGD3wokHOKtAzxQcDCsmi7iAMOkr/T838IFo1gR?=
 =?us-ascii?Q?+QYG62N2fkEE+vuey48lmYv3EUblaA+5JTLyWot1H1egL03iMq8e/UnQ7U+g?=
 =?us-ascii?Q?87OI2iZheadnPOQwDwd3WxeqoMdryzs2n6cm5gl+QmtRH9ohQHKcOWSjZXVm?=
 =?us-ascii?Q?LC1a+Yp48GYpSUSzaIRfCqTuBjgwZm4/DuSXkHfOLNMX43e1XOrWC379F2+o?=
 =?us-ascii?Q?/gnYDXyH3lwb30j9KNtzGAZVLDGi8CaACepJYFNmeuvE0GlgJXFHahkFcXHb?=
 =?us-ascii?Q?LMcbpoHLloQ+qCt+X3PdMJfzRENf3skmeflUOrP4C2VDtobqmFbsoOODNncA?=
 =?us-ascii?Q?BMrugrNhqVX/31iJHUXaKhuj/9OFvrWf8IfBqfNtePuFwT5W+JaZX2Af5pYX?=
 =?us-ascii?Q?hKSKaUZVZ6wJAVAWbk7ciGB2aD9LUnADqs5fJl7fy+PfS8R1zbWCPocGAXK9?=
 =?us-ascii?Q?jBVW6MeDpiSo1H97HiWUoQXsdF+Hof2Sqr2l7p2YNS4StCQP7MLsbMKHYxZO?=
 =?us-ascii?Q?M4OmxHj71yab1qL0NvoL4upBdGYTle6bEbUe49k31siTm2p9MkEJ/fm4XwuU?=
 =?us-ascii?Q?n/VWczGIKZHQUJD+pdGz2Qf24TR6km+LXO7KrzjLL6bm7/a4hAR5b6fsvr3D?=
 =?us-ascii?Q?0+txjhetCQdA3BQVPTFxgM55lnhFnIDplHOu1CDnGaU5NeMc87rEqlsT+J3G?=
 =?us-ascii?Q?VwEK6i6WY2zo9xz53TJ3Sj6v/XYbfMRtXdaznhDc7rqqzTGTX8j2K+0i8ydz?=
 =?us-ascii?Q?lqfQvst4Qxpu80V8vWySfxrd4OzYQ4jjf+kmVPq5H3hHMYWpr8W+zIR3Ix7e?=
 =?us-ascii?Q?q4DPq3MNJTz0T3EQ4uBSWOF6IrsPqK0HWzXpSXtMoTGS+aBpWyF2wqmT3/Wr?=
 =?us-ascii?Q?u4xPn6NczDQy0vblb6hXfsgKGzel85YFUphR+aatgBJ8lXGOWRV+8W+HOV3H?=
 =?us-ascii?Q?WnmbL/s+EvqXzFQBgFt0txkFRlPwtU6Kt7Lo2OvJOILfaWZS6rWI9mWWTQGv?=
 =?us-ascii?Q?x8+S7aUH7HJTZqrcnOeJpeQecdh6G7Ry2qZeq2bxljPrmk+vu2fP8f0V4Nz+?=
 =?us-ascii?Q?tuc4PQb9F3Vd1O5i/2fjQM7oej1XAjT4DLW35NrEYbXV0rlPJFRajyDLYNpl?=
 =?us-ascii?Q?/xUEesoKDrXOXGsXy1JEQk7htLxjsjYVX4QCdGyQaHnyHgklSg1Oi8mPmBp3?=
 =?us-ascii?Q?SunP5SBKVwexYpQkg28sHF4TCZbaVze0s/lPB35kT0mH1Q8pU1rtHrxekptL?=
 =?us-ascii?Q?fL/1z7Pwz4VXAM9IiQsUJhxjL56e2t4l2a4wx6lVWPSt++6WmWYMzPMB0tKe?=
 =?us-ascii?Q?mkmvElbz/N9Rbfbs1AFFTzX+tlcrVMvd+woT6tjrjT893bYV4mTLAeuM6N93?=
 =?us-ascii?Q?9YseN0ZZBCNiCvIsrPjawhDh/r75w3k7LPWr7Sca?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25356bdf-cb2f-4184-b443-08dd83edf154
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 11:40:13.6927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sFQGtpRQTUClm7ReTL35WpwqbfT+05bEbdDthhDJhVKSUnuoT6YgGQWqYDt2NjiX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8319

On 25 Apr 2025, at 6:38, Gavin Guo wrote:

> Since the previous commit "mm/huge_memory: Adjust try_to_migrate_one() =
and
> split_huge_pmd_locked()" has simplified the logic by leveraging the
> folio verification in page_vma_mapped_walk(), this patch removes the
> unnecessary folio pointers passing.
>
> Suggested-by: David Hildenbrand <david@redhat.com>
> Link: https://lore.kernel.org/all/98d1d195-7821-4627-b518-83103ade56c0@=
redhat.com/
> Link: https://lore.kernel.org/all/91599a3c-e69e-4d79-bac5-5013c96203d7@=
redhat.com/
> Signed-off-by: Gavin Guo <gavinguo@igalia.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> ---
>  include/linux/huge_mm.h | 15 +++++++--------
>  mm/huge_memory.c        | 16 ++++++++--------
>  mm/memory.c             |  4 ++--
>  mm/mprotect.c           |  2 +-
>  mm/rmap.c               |  4 ++--
>  5 files changed, 20 insertions(+), 21 deletions(-)
>

LGTM. Thanks. Reviewed-by: Zi Yan <ziy@nvidia.com>

--
Best Regards,
Yan, Zi
