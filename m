Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3847E2BF3E2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751582414; cv=fail; b=J+7KpjHgW4agOJkKg2Pv6VFUAr4yBvL1QVC7MVPv0pCIrVzil3Qlv6NyBKxc42TINdAZUUFI6RH8fG/ie7uQeg/tmD5V9rjfHc0s4/5fzcSFlUWgWbvnq1M3CSbu09kjysNJsW70hW/AfZSDhFAa5zAzS0q8TwcIjkdoDtbaHTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751582414; c=relaxed/simple;
	bh=6NRWYhxYy91r2DFraFj+vzEDoJtxqdwj/R+M2s9VtUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kaVsnOh/QKSrfHRax2Epwxu2ZNdH4RXrr817esKsHVpju/n1qAa7b5DVJFSDVDPFeOe17XNlXIqEMJvOfMbwMg9dKJ+g5BOwKfFmA6Doo1mJvEGHaCt7MAGm+fekJe7zLSLWIGzLgoaD4cv8P9bR0RBzfz6hzaivU5NsDW+tn2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nzBUUC7+; arc=fail smtp.client-ip=40.107.220.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nzBUUC7+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vzscZ+d6wTPwL15lexH63RcQjHM3bwA+4fJpJeAX4NwBxj/b2SulsP/YCDnqA1xb6Wsd66Cs/cD+8Lj/zMWMlIegZ4imYS1QUAUwT1DNHCQdVnRQeh7GyEGcVeMJZJrXG5X707vduHBR1IgwjISQJY0MKRKCIDbFxf/8b8Wxi2NP9xWmkBKRQHOW3Sz9OiRg2vDoMPwz1Qiu9DRAnYS5h9FGXI/5rfuoaGw79kImGT149AGzH477H3LpzIb7eDqZy+6c6YrBKPBZr5m+xJH0y4x4tFYd3oMOIvqv4yHJSs+FFHxzk59oTIO6q55dtD6crYeDIKVN7rX6cUewN0SuOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAxLWPQk0B4pczAPHUodW0uub2Gj62Wx0i+XndW8dsw=;
 b=mHuAylel09I+HcwBY+JCQhliyKPtPv2gKv1CcrYWofgQ6qy3PDTuq4gyGvuG9iUJUO9k30J1W5BKzJBZtGdOocw6seHY0yqc1vYxXlu8OE8K52VTTtq3909O3MYdMj7wMpeWSXsZAY2EfmcR/NWiSkNiwvOo0TkEYRLcvAhvH6elnT9tCX2l/Gel7vCKAQlvo024+1KJ0v0tBlzJm3Vll/CfMsVoSvWwXAQ67AGN4J3lWFLbTaLoRaKqzRSPTCSSu1ouRocsBulofD6OC81a3NYqip32sKrZptOXmsearW9qZdBF9TNaAy1Sw9y+koe7XMr2XBvlPBGXuy8fmXd6Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAxLWPQk0B4pczAPHUodW0uub2Gj62Wx0i+XndW8dsw=;
 b=nzBUUC7+gjCVrsYQ/ZRPsbniT5gY3V6zCaGf65WGu58pnrhFb59RxZtp5y9Z5HkO9sZsgvm66fwWALR5ZODeunwuo9dr9HMROKpR5nd5ZNcXObUtm6F/VThz7sDJ0y1jQEkCLlHpYSkk9cNwcnioaJztzRb4qhOxhS5+QACAYewECVoBf8wQWT8JxPXenbAt0PFJUUyciub6etgoKiT+raEnV30RDWL5PfEBFb4VH2qM8JRJJ0HRYWYoPW40Ej1UT/tsHpozHkYyVgIVWko8uielOdUgL6ASEKO2erOcvASkEcX0qDYz1LOSMdQHdmG72MzAgODx5BQ33F/sDBLG8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by IA0PR12MB7722.namprd12.prod.outlook.com (2603:10b6:208:432::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 22:40:08 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8880.015; Thu, 3 Jul 2025
 22:40:08 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Balbir Singh <balbirs@nvidia.com>
Subject: [v1 03/12] mm/thp: zone_device awareness in THP handling code
Date: Fri,  4 Jul 2025 08:27:50 +1000
Message-ID: <20250703222759.1943776-4-balbirs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703222759.1943776-1-balbirs@nvidia.com>
References: <20250703222759.1943776-1-balbirs@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0158.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::13) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|IA0PR12MB7722:EE_
X-MS-Office365-Filtering-Correlation-Id: 10392953-07b3-43b9-fe47-08ddba828feb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GK4Ad8xJQVC+uHs7ANOCjwWYnTYn9tJbQJXWDM4uYCCuOk/14Dj2GJNPZivX?=
 =?us-ascii?Q?RTxTgHvWkFxWigcJe64Firv0Y4gtHMRJrTkClBF7tUqKDMffl5NTYVRIHLxx?=
 =?us-ascii?Q?E2J6yadh4buluq7QVOgtH1mAdJizvhk/NIJ66DJCjWe+hqjZOx+gNCOR40hc?=
 =?us-ascii?Q?49Vz0k4o0lKcrrlVFcgqcTKdOZ5Q91/dVA/hluig+myJ4lXHieXUsqqjL4yb?=
 =?us-ascii?Q?/ktZMeqpG+5AoqxNCV1qAUV9hzrc09TRstgC92yJ6WgRFcTBXB+75i4dOtRR?=
 =?us-ascii?Q?HZGhZXuhCXB76yzZGqdA+XqFl0OR6YFJWsJY+3Y0Dx7V3Y6iMglHXzKm3z1r?=
 =?us-ascii?Q?rsbhfpNdwbJTRh//dj/W7lt9QjZeLw7uTOSCpreZq/empCPBxiHC1VUaJseP?=
 =?us-ascii?Q?imnnCBVY36SxHPpfveWwBUD92F800FR2YwTx4xfGPL0jl5vw7+mP2HiU1jz3?=
 =?us-ascii?Q?8+RCRPrJYMJb538e2Af9NTJ0Dk0qD0/Ck/oijsYheLbK2YwWiVWk8nNsZFDT?=
 =?us-ascii?Q?hLTodf4xVKZklDFFHFHKKVtm7d7tXgBJs1SCYfUS5PuzCwFbh1Ug/efdFZ3b?=
 =?us-ascii?Q?UppFQp+VoKfMA4ANWXE1jlBWbXp++o3ftO45bhjIG7ZqnDFnE0JbCIT2yOJJ?=
 =?us-ascii?Q?ptJZIA09s2yubp8ouY+GdicUyXzHZ+U4hFtUkOuSOqP+trrBAJn4UgjADWry?=
 =?us-ascii?Q?VvNYIS/22U14K1pUxwtEOQ3jAMMq8u2fqRV+0YHMJoq7g4/VYgslZyAwIret?=
 =?us-ascii?Q?i9kaLL/+InDK3DqjJtEyBdDTXsmwuKWEt/VSpjI9ITdA1ad9c6zxVuD/G9KJ?=
 =?us-ascii?Q?PEvKJ1t3JpqKJ6PYSUW7I5qjJl3zs+S6Z+i17fh9/gZBKph+yZqQQM4PwRxt?=
 =?us-ascii?Q?R/5mx+4UbRFCIiFDWUbMXWD41h9z9eIuT6nGRPhmgm6h1H67xHi/lgu8hBOT?=
 =?us-ascii?Q?2Na+VCTHDBqynicAJ4cPJvsDuFABGTMmtmdE5XnLx24w3fSjnwt0lslSpwx1?=
 =?us-ascii?Q?4JuTBk5KYVFbQ45VvsNm8zGvLriTySDzBYQFJCAok7pUqDofL4SIigahhIAL?=
 =?us-ascii?Q?5dGrI2R78pq4+S+sbMcP9BgOzuI7LvvQUJrqUHt2QrqRV3GZ+i/V61G6V/pQ?=
 =?us-ascii?Q?b/MXOoNgCKq2SlaAIt5YaRA8A8xxHLYCCg7XC2gcFq2/lG2jN2J2lYAzKxK/?=
 =?us-ascii?Q?IBWmCAVayqcgk5yTEm7Zpad5vzol6MvKfYQ4KQpD4Lh7xkP0Nr3LPSOjQq+3?=
 =?us-ascii?Q?1d77erijQRnqoKVJubyNxWWwJ/WaxODxmcG1ekUTeLTsA2DpbAtAQc5DiD63?=
 =?us-ascii?Q?DiIDgUad7/SZU2X+66qOAACDmsVzRprr27ylK10YrvbpBS7ZZqPbUDfeRPxE?=
 =?us-ascii?Q?xL0cU2jGdT7NrbaMxbgjLo3pS/LZasOha2DOJUqAYzH5R1v2jELl2XCVxEK/?=
 =?us-ascii?Q?od5id5iU+eI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8M34kQGhyRKsn+Ntd6dR/GdvL2HM4njD69Xww0qDbH/uaOJnXZehR9QRJoVF?=
 =?us-ascii?Q?jwVA9OhDwv2fByHSsrCvaJTE8h30gnV30X4zNVuwE0Lqg3gexJ3As50hKE7W?=
 =?us-ascii?Q?Br3uPonrQPP8fw/XKsfo8jR/Dszr90avvdEBogs5JoAiMwOPw45FdrArA5AZ?=
 =?us-ascii?Q?j5D/AjUnQTVJ48aTjp4/WIfnitgOjtKWqn/XuXQiSZmn1aFdmNGO8m+t+nq4?=
 =?us-ascii?Q?b/wbTYWjDNM0jT3dIylZvS6pFX/ZVtbzZyJZw5rajwAxG0Lcml6wDxkzgw6c?=
 =?us-ascii?Q?9KiHh38viJwevzLqMf7hED4Nco7r3RxC7/Mrjz9U9yIZmi0e1w+HSPPW2QzE?=
 =?us-ascii?Q?iyY2TWJ4wJhHP+Fjo+ktDRzyudJ8mlV5CgYZg/TwL5228nAXbC62VRtNBWEc?=
 =?us-ascii?Q?7zTKMafL88doIZQUCRRYliO4Rb4H/WbK9bLVvAr0SSyPyr/STCcW+sBr76+n?=
 =?us-ascii?Q?xLxwhcZDs2OI7R5u9BbK4VTb7qswO0IhNe2AjdRs+ec9tvQjD12t49Pu9utX?=
 =?us-ascii?Q?kb3xQdVxDKmLRXrABjh7Ogn1Cmy/nOfLUZ0f0Fr92P96LWH9Wy4o0b36DeJo?=
 =?us-ascii?Q?o57W9Y+fFNDGEsWc1WGvisnxCGCOqhZWfEya7eCLvUvzcWsGgWn52s9E73wq?=
 =?us-ascii?Q?Q8aPiBiD59OQDA+ukRzKUlFvkCetqHGgNbiwEn28pxsVs3LDvlK7qJ5iMw0E?=
 =?us-ascii?Q?ue4IJp/U3JswVAqiSZd8uM0TSXUxAmgvaihpxxVP/828mHyNCIEYqQOQlwgd?=
 =?us-ascii?Q?Tv3MYBRTCfXHS5WEcu6cbnEmAeToGFyoUIj7iyxQBUm15RVKA/ncc3TM33up?=
 =?us-ascii?Q?yfuK5RI3a+kX/mDjPsyXpPvZVhEuIzLZWZIf6RwSuzzhhFAL6DnQgIdpE207?=
 =?us-ascii?Q?UYfW04778lMJivZ5duAfud2HV8I3vr038kksL+MOypljxeU5UxK12F5TqrFH?=
 =?us-ascii?Q?nFS9Y+yC4ys77trJYpKMGf+uPIYTOwGgtYy9fhUOv8NIF5URCxAMGfXuK25a?=
 =?us-ascii?Q?sWRgNPA6jNdU68cMYCk3Tp2wFjRgWvblmr9XTajCO+9NergL9bc3K/u7CgMs?=
 =?us-ascii?Q?RE6rf74sxIzW8nFJLVRhVpqTdLd+Jatjc2R7rZReRJpG5qRB/wbElCMaRVnw?=
 =?us-ascii?Q?s0hv3rQbIyXoj5KnJUPSz56zmXb/VKKPvmKqWYI5XfrMTnMRiAlOBBVIDAvk?=
 =?us-ascii?Q?yBzh3po2VEME8dSlK1RmQDf1ycZDL8dBVPSyk8y/bnOWiQMY0yP4d7/Z0/dz?=
 =?us-ascii?Q?yyRY8CqgOTwzxfRYs86HoUJIAGZLx5Im9Q/4AFrxuLqcSWr6ojV13zMKqsyM?=
 =?us-ascii?Q?xsaQcwBPADvsn2RlFs0QsvS4tcEg+e40xMrnJVpX2uinJun7WceQ3Jvbo1K1?=
 =?us-ascii?Q?AnEnLilXOeGX/2tIXgclpepYsBH518K3iDt4EqNIEfvQM/B5P3T1GLk6MotL?=
 =?us-ascii?Q?uxC42gHLVWLtFlldHX6MzsrBh7qD3IutYoCkvKmtVt8Sn0e5lS79c57Eng+d?=
 =?us-ascii?Q?Ho8wd0n+ouWTpJi08PoNGHyD8aHTz2cPVWRsshQUN4u6a98HoGH0EnSFVn2N?=
 =?us-ascii?Q?TUW17N7tGKTE/siMZsv9zjs47RM4C1BaTguShksV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10392953-07b3-43b9-fe47-08ddba828feb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 22:40:08.1991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SrgKRFbRzWlqup/wnAATVI6rjLiffoQxyPuRCTE8dGNc/90p1J438UjYxDbQFDbZlwHauOTKq0Kqm/FVPMjRAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7722

Make THP handling code in the mm subsystem for THP pages
aware of zone device pages. Although the code is
designed to be generic when it comes to handling splitting
of pages, the code is designed to work for THP page sizes
corresponding to HPAGE_PMD_NR.

Modify page_vma_mapped_walk() to return true when a zone
device huge entry is present, enabling try_to_migrate()
and other code migration paths to appropriately process the
entry

pmd_pfn() does not work well with zone device entries, use
pfn_pmd_entry_to_swap() for checking and comparison as for
zone device entries.

try_to_map_to_unused_zeropage() does not apply to zone device
entries, zone device entries are ignored in the call.

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 mm/huge_memory.c     | 153 +++++++++++++++++++++++++++++++------------
 mm/migrate.c         |   2 +
 mm/page_vma_mapped.c |  10 +++
 mm/pgtable-generic.c |   6 ++
 mm/rmap.c            |  19 +++++-
 5 files changed, 146 insertions(+), 44 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index ce130225a8e5..e6e390d0308f 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1711,7 +1711,8 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 	if (unlikely(is_swap_pmd(pmd))) {
 		swp_entry_t entry = pmd_to_swp_entry(pmd);
 
-		VM_BUG_ON(!is_pmd_migration_entry(pmd));
+		VM_BUG_ON(!is_pmd_migration_entry(pmd) &&
+				!is_device_private_entry(entry));
 		if (!is_readable_migration_entry(entry)) {
 			entry = make_readable_migration_entry(
 							swp_offset(entry));
@@ -2222,10 +2223,17 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 		} else if (thp_migration_supported()) {
 			swp_entry_t entry;
 
-			VM_BUG_ON(!is_pmd_migration_entry(orig_pmd));
 			entry = pmd_to_swp_entry(orig_pmd);
 			folio = pfn_swap_entry_folio(entry);
 			flush_needed = 0;
+
+			VM_BUG_ON(!is_pmd_migration_entry(*pmd) &&
+					!folio_is_device_private(folio));
+
+			if (folio_is_device_private(folio)) {
+				folio_remove_rmap_pmd(folio, folio_page(folio, 0), vma);
+				WARN_ON_ONCE(folio_mapcount(folio) < 0);
+			}
 		} else
 			WARN_ONCE(1, "Non present huge pmd without pmd migration enabled!");
 
@@ -2247,6 +2255,15 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 				folio_mark_accessed(folio);
 		}
 
+		/*
+		 * Do a folio put on zone device private pages after
+		 * changes to mm_counter, because the folio_put() will
+		 * clean folio->mapping and the folio_test_anon() check
+		 * will not be usable.
+		 */
+		if (folio_is_device_private(folio))
+			folio_put(folio);
+
 		spin_unlock(ptl);
 		if (flush_needed)
 			tlb_remove_page_size(tlb, &folio->page, HPAGE_PMD_SIZE);
@@ -2375,7 +2392,8 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 		struct folio *folio = pfn_swap_entry_folio(entry);
 		pmd_t newpmd;
 
-		VM_BUG_ON(!is_pmd_migration_entry(*pmd));
+		VM_BUG_ON(!is_pmd_migration_entry(*pmd) &&
+			  !folio_is_device_private(folio));
 		if (is_writable_migration_entry(entry)) {
 			/*
 			 * A protection check is difficult so
@@ -2388,9 +2406,11 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 			newpmd = swp_entry_to_pmd(entry);
 			if (pmd_swp_soft_dirty(*pmd))
 				newpmd = pmd_swp_mksoft_dirty(newpmd);
-		} else {
+		} else if (is_writable_device_private_entry(entry)) {
+			newpmd = swp_entry_to_pmd(entry);
+			entry = make_device_exclusive_entry(swp_offset(entry));
+		} else
 			newpmd = *pmd;
-		}
 
 		if (uffd_wp)
 			newpmd = pmd_swp_mkuffd_wp(newpmd);
@@ -2842,16 +2862,20 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	struct page *page;
 	pgtable_t pgtable;
 	pmd_t old_pmd, _pmd;
-	bool young, write, soft_dirty, pmd_migration = false, uffd_wp = false;
-	bool anon_exclusive = false, dirty = false;
+	bool young, write, soft_dirty, uffd_wp = false;
+	bool anon_exclusive = false, dirty = false, present = false;
 	unsigned long addr;
 	pte_t *pte;
 	int i;
+	swp_entry_t swp_entry;
 
 	VM_BUG_ON(haddr & ~HPAGE_PMD_MASK);
 	VM_BUG_ON_VMA(vma->vm_start > haddr, vma);
 	VM_BUG_ON_VMA(vma->vm_end < haddr + HPAGE_PMD_SIZE, vma);
-	VM_BUG_ON(!is_pmd_migration_entry(*pmd) && !pmd_trans_huge(*pmd));
+
+	VM_BUG_ON(!is_pmd_migration_entry(*pmd) && !pmd_trans_huge(*pmd)
+			&& !(is_swap_pmd(*pmd) &&
+			is_device_private_entry(pmd_to_swp_entry(*pmd))));
 
 	count_vm_event(THP_SPLIT_PMD);
 
@@ -2899,20 +2923,25 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		return __split_huge_zero_page_pmd(vma, haddr, pmd);
 	}
 
-	pmd_migration = is_pmd_migration_entry(*pmd);
-	if (unlikely(pmd_migration)) {
-		swp_entry_t entry;
 
+	present = pmd_present(*pmd);
+	if (unlikely(!present)) {
+		swp_entry = pmd_to_swp_entry(*pmd);
 		old_pmd = *pmd;
-		entry = pmd_to_swp_entry(old_pmd);
-		page = pfn_swap_entry_to_page(entry);
-		write = is_writable_migration_entry(entry);
+
+		folio = pfn_swap_entry_folio(swp_entry);
+		VM_BUG_ON(!is_migration_entry(swp_entry) &&
+				!is_device_private_entry(swp_entry));
+		page = pfn_swap_entry_to_page(swp_entry);
+		write = is_writable_migration_entry(swp_entry);
+
 		if (PageAnon(page))
-			anon_exclusive = is_readable_exclusive_migration_entry(entry);
-		young = is_migration_entry_young(entry);
-		dirty = is_migration_entry_dirty(entry);
+			anon_exclusive =
+				is_readable_exclusive_migration_entry(swp_entry);
 		soft_dirty = pmd_swp_soft_dirty(old_pmd);
 		uffd_wp = pmd_swp_uffd_wp(old_pmd);
+		young = is_migration_entry_young(swp_entry);
+		dirty = is_migration_entry_dirty(swp_entry);
 	} else {
 		/*
 		 * Up to this point the pmd is present and huge and userland has
@@ -2996,30 +3025,45 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	 * Note that NUMA hinting access restrictions are not transferred to
 	 * avoid any possibility of altering permissions across VMAs.
 	 */
-	if (freeze || pmd_migration) {
+	if (freeze || !present) {
 		for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
 			pte_t entry;
-			swp_entry_t swp_entry;
-
-			if (write)
-				swp_entry = make_writable_migration_entry(
-							page_to_pfn(page + i));
-			else if (anon_exclusive)
-				swp_entry = make_readable_exclusive_migration_entry(
-							page_to_pfn(page + i));
-			else
-				swp_entry = make_readable_migration_entry(
-							page_to_pfn(page + i));
-			if (young)
-				swp_entry = make_migration_entry_young(swp_entry);
-			if (dirty)
-				swp_entry = make_migration_entry_dirty(swp_entry);
-			entry = swp_entry_to_pte(swp_entry);
-			if (soft_dirty)
-				entry = pte_swp_mksoft_dirty(entry);
-			if (uffd_wp)
-				entry = pte_swp_mkuffd_wp(entry);
-
+			if (freeze || is_migration_entry(swp_entry)) {
+				if (write)
+					swp_entry = make_writable_migration_entry(
+								page_to_pfn(page + i));
+				else if (anon_exclusive)
+					swp_entry = make_readable_exclusive_migration_entry(
+								page_to_pfn(page + i));
+				else
+					swp_entry = make_readable_migration_entry(
+								page_to_pfn(page + i));
+				if (young)
+					swp_entry = make_migration_entry_young(swp_entry);
+				if (dirty)
+					swp_entry = make_migration_entry_dirty(swp_entry);
+				entry = swp_entry_to_pte(swp_entry);
+				if (soft_dirty)
+					entry = pte_swp_mksoft_dirty(entry);
+				if (uffd_wp)
+					entry = pte_swp_mkuffd_wp(entry);
+			} else {
+				VM_BUG_ON(!is_device_private_entry(swp_entry));
+				if (write)
+					swp_entry = make_writable_device_private_entry(
+								page_to_pfn(page + i));
+				else if (anon_exclusive)
+					swp_entry = make_device_exclusive_entry(
+								page_to_pfn(page + i));
+				else
+					swp_entry = make_readable_device_private_entry(
+								page_to_pfn(page + i));
+				entry = swp_entry_to_pte(swp_entry);
+				if (soft_dirty)
+					entry = pte_swp_mksoft_dirty(entry);
+				if (uffd_wp)
+					entry = pte_swp_mkuffd_wp(entry);
+			}
 			VM_WARN_ON(!pte_none(ptep_get(pte + i)));
 			set_pte_at(mm, addr, pte + i, entry);
 		}
@@ -3046,7 +3090,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	}
 	pte_unmap(pte);
 
-	if (!pmd_migration)
+	if (present)
 		folio_remove_rmap_pmd(folio, page, vma);
 	if (freeze)
 		put_page(page);
@@ -3058,8 +3102,11 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
 			   pmd_t *pmd, bool freeze)
 {
+
 	VM_WARN_ON_ONCE(!IS_ALIGNED(address, HPAGE_PMD_SIZE));
-	if (pmd_trans_huge(*pmd) || is_pmd_migration_entry(*pmd))
+	if (pmd_trans_huge(*pmd) || is_pmd_migration_entry(*pmd) ||
+			(is_swap_pmd(*pmd) &&
+			is_device_private_entry(pmd_to_swp_entry(*pmd))))
 		__split_huge_pmd_locked(vma, pmd, address, freeze);
 }
 
@@ -3238,6 +3285,9 @@ static void lru_add_split_folio(struct folio *folio, struct folio *new_folio,
 	VM_BUG_ON_FOLIO(folio_test_lru(new_folio), folio);
 	lockdep_assert_held(&lruvec->lru_lock);
 
+	if (folio_is_device_private(folio))
+		return;
+
 	if (list) {
 		/* page reclaim is reclaiming a huge page */
 		VM_WARN_ON(folio_test_lru(folio));
@@ -3252,6 +3302,7 @@ static void lru_add_split_folio(struct folio *folio, struct folio *new_folio,
 			list_add_tail(&new_folio->lru, &folio->lru);
 		folio_set_lru(new_folio);
 	}
+
 }
 
 /* Racy check whether the huge page can be split */
@@ -3543,6 +3594,10 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
 					((mapping || swap_cache) ?
 						folio_nr_pages(release) : 0));
 
+			if (folio_is_device_private(release))
+				percpu_ref_get_many(&release->pgmap->ref,
+							(1 << new_order) - 1);
+
 			lru_add_split_folio(origin_folio, release, lruvec,
 					list);
 
@@ -4596,7 +4651,10 @@ int set_pmd_migration_entry(struct page_vma_mapped_walk *pvmw,
 		return 0;
 
 	flush_cache_range(vma, address, address + HPAGE_PMD_SIZE);
-	pmdval = pmdp_invalidate(vma, address, pvmw->pmd);
+	if (!folio_is_device_private(folio))
+		pmdval = pmdp_invalidate(vma, address, pvmw->pmd);
+	else
+		pmdval = pmdp_huge_clear_flush(vma, address, pvmw->pmd);
 
 	/* See folio_try_share_anon_rmap_pmd(): invalidate PMD first. */
 	anon_exclusive = folio_test_anon(folio) && PageAnonExclusive(page);
@@ -4646,6 +4704,17 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
 	entry = pmd_to_swp_entry(*pvmw->pmd);
 	folio_get(folio);
 	pmde = folio_mk_pmd(folio, READ_ONCE(vma->vm_page_prot));
+
+	if (unlikely(folio_is_device_private(folio))) {
+		if (pmd_write(pmde))
+			entry = make_writable_device_private_entry(
+							page_to_pfn(new));
+		else
+			entry = make_readable_device_private_entry(
+							page_to_pfn(new));
+		pmde = swp_entry_to_pmd(entry);
+	}
+
 	if (pmd_swp_soft_dirty(*pvmw->pmd))
 		pmde = pmd_mksoft_dirty(pmde);
 	if (is_writable_migration_entry(entry))
diff --git a/mm/migrate.c b/mm/migrate.c
index 767f503f0875..0b6ecf559b22 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -200,6 +200,8 @@ static bool try_to_map_unused_to_zeropage(struct page_vma_mapped_walk *pvmw,
 
 	if (PageCompound(page))
 		return false;
+	if (folio_is_device_private(folio))
+		return false;
 	VM_BUG_ON_PAGE(!PageAnon(page), page);
 	VM_BUG_ON_PAGE(!PageLocked(page), page);
 	VM_BUG_ON_PAGE(pte_present(ptep_get(pvmw->pte)), page);
diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index e981a1a292d2..ff8254e52de5 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -277,6 +277,16 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 			 * cannot return prematurely, while zap_huge_pmd() has
 			 * cleared *pmd but not decremented compound_mapcount().
 			 */
+			swp_entry_t entry;
+
+			if (!thp_migration_supported())
+				return not_found(pvmw);
+			entry = pmd_to_swp_entry(pmde);
+			if (is_device_private_entry(entry)) {
+				pvmw->ptl = pmd_lock(mm, pvmw->pmd);
+				return true;
+			}
+
 			if ((pvmw->flags & PVMW_SYNC) &&
 			    thp_vma_suitable_order(vma, pvmw->address,
 						   PMD_ORDER) &&
diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index 567e2d084071..604e8206a2ec 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -292,6 +292,12 @@ pte_t *___pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp)
 		*pmdvalp = pmdval;
 	if (unlikely(pmd_none(pmdval) || is_pmd_migration_entry(pmdval)))
 		goto nomap;
+	if (is_swap_pmd(pmdval)) {
+		swp_entry_t entry = pmd_to_swp_entry(pmdval);
+
+		if (is_device_private_entry(entry))
+			goto nomap;
+	}
 	if (unlikely(pmd_trans_huge(pmdval)))
 		goto nomap;
 	if (unlikely(pmd_bad(pmdval))) {
diff --git a/mm/rmap.c b/mm/rmap.c
index bd83724d14b6..da1e5b03e1fe 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2336,8 +2336,23 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 				break;
 			}
 #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
-			subpage = folio_page(folio,
-				pmd_pfn(*pvmw.pmd) - folio_pfn(folio));
+			/*
+			 * Zone device private folios do not work well with
+			 * pmd_pfn() on some architectures due to pte
+			 * inversion.
+			 */
+			if (folio_is_device_private(folio)) {
+				swp_entry_t entry = pmd_to_swp_entry(*pvmw.pmd);
+				unsigned long pfn = swp_offset_pfn(entry);
+
+				subpage = folio_page(folio, pfn
+							- folio_pfn(folio));
+			} else {
+				subpage = folio_page(folio,
+							pmd_pfn(*pvmw.pmd)
+							- folio_pfn(folio));
+			}
+
 			VM_BUG_ON_FOLIO(folio_test_hugetlb(folio) ||
 					!folio_test_pmd_mappable(folio), folio);
 
-- 
2.49.0

