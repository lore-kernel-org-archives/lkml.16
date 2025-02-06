Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2051.outbound.protection.outlook.com [40.107.92.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BA17485
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 02:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738809179; cv=fail; b=CZBeauO33DLa2tjBeInInIUhK9Vj2uvqA1JSKpQO2tdLsUn0+/k8oYyZG5nU8XsIVH7cTtSTADwDk7zPEFa+qk9HsS0bXs37aWd2fpkFW5PL7YIsX0zR+1N1agq+pcWDZjswN/NNJOGhWL3Qx/i4Jwd6kb4onSfzN0Obi1cfqGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738809179; c=relaxed/simple;
	bh=aEn9hyrLtRs7FoIEpGQUzztXF3oZLZWs9Ui27Kfv7Vk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=IxefIpCDM25y5UjoG1DXexlw6kKWlsKroThhtpi1BjRISZd44NZS/sZaI5u1hsUjMblkcwylhPx3aMqVo7zPtX32QB8ih4mHPpuxM8B9FB/hKVIfgHVvvKhHi/UTfjz6FahfV+P2H3RpFq0bLPcCE6GZjxVu4/7L6/i0SE0PuxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TlvLImOw; arc=fail smtp.client-ip=40.107.92.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TlvLImOw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w5KedNjTjclXuqnM/0DmBv+tO6eUl1jTSNP6G/bVnyLsbwXiI0o30nxyyOTd//RxfkC0PsQIOzhRBEIqNlXcq7pE6EfqkWlezETtJoajDMH6oT8lyt4Y0WDtJrCqAbuexTghxk5oQGCSUmZLXceY/4pm27S/vVYazcNHhjg0NOs3l254zw95Lmhn9aSwuQeAZAp9beoaC4lx1Ji2O7wbYNFuk/uj7PgGhtokmVLDyq2/mgap/lWUlvUVQP2fc6Es047lfoz03kK+fbYFUUuYRstbl+IDO+4v8PnHxOBX0oDgLkkbpUUS8ZPP0I7WeJl+S/6EX3RT/w6sJKjz2frs1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/khah/80qDDd8ttqFr/Y3Nv1TCT3gVnYJuhyLfaQ18=;
 b=mzzV988Da4YqybuVePsS46drqFXBQLnhjf3s6HbLA56eP3fWdZkOoVf0WJzCsa3jZRuHAtJXlZP77jqnsqXxGugJl0f8cyjnwf5vZaVQkckAgbXUkljIM3RcEGeUplxkbzTii8GNo8ERig/Bq6OCHAi+2Vz00UYqyhgRzBNGK5YaBTzLdjV8XQrUvUL8HJHSnlba7Cz3Qhb4vhFr7pwjGZUbimMsK4Z7MglRYmSNPuZPTXNJrXPn2Mmgv1zOMV4nbDnDdb9oAL1dCS3x0X+f6/nHQRE03zjssQUiWgMN+RiI3eD3XSdSMkktRrDCQtl3fg6EadFOY3Evh4upBAq7Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/khah/80qDDd8ttqFr/Y3Nv1TCT3gVnYJuhyLfaQ18=;
 b=TlvLImOwOB6eYcGj+BIwwgsdctJ09JWGUti1PQVHTclSV4pQ3b7Sb5aFPDOPg87yoaITsuS0rW7j0zEQa9rrhVY5XOh7vvU8GEyU86R9ygew34Hugk4AhPEWUff8f+BybzFhI/uypp433zmVAnTgUetucYLCsywAjKxr4yhQe8MbNQpdymNVhGy7BmgGGTr6pnBTAfR1SRXjdwX4HtdpQUGzcasYYK4JVAQ77QFUCq0bINpiXyuQb/vrvtz3jEDDKt2l+Z71Q2btUs+qZcYwD2ctaBg1xDagpFlvbSIfpPMT/gcjJUi4tBD4yGiOvC9p1YfSRjCZ7+dco9En4acyjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB7272.namprd12.prod.outlook.com (2603:10b6:806:2b6::7)
 by MW4PR12MB7312.namprd12.prod.outlook.com (2603:10b6:303:21a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Thu, 6 Feb
 2025 02:32:54 +0000
Received: from SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868]) by SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868%7]) with mapi id 15.20.8398.018; Thu, 6 Feb 2025
 02:32:54 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	apopple@nvidia.com,
	jgg@nvidia.com,
	jhubbard@nvidia.com,
	Balbir Singh <balbirs@nvidia.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH] x86/kaslr: Revisit entropy when CONFIG_PCI_P2PDMA is enabled
Date: Thu,  6 Feb 2025 13:32:01 +1100
Message-ID: <20250206023201.1481957-1-balbirs@nvidia.com>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYBPR01CA0014.ausprd01.prod.outlook.com (2603:10c6:10::26)
 To SA1PR12MB7272.namprd12.prod.outlook.com (2603:10b6:806:2b6::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB7272:EE_|MW4PR12MB7312:EE_
X-MS-Office365-Filtering-Correlation-Id: 4838419f-fab4-4189-7ae4-08dd46568f6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xEZvlAjK+gSHKUXN+bDMfUD4r/X6Bs7/yWh0sX9B/q2Kay/Xe/Nqq6MI9+hj?=
 =?us-ascii?Q?WfpX+j7JH1MNXjKT38SlHbVzFJwui5DTNSxQBkbGO8KPQyPYuVN5qvwWqZn3?=
 =?us-ascii?Q?q/Y4BPqCdIqzpLhqhG/+wtPLlf3dvKQz32ZxjocIHSckAvBkwMgltoWIT2l2?=
 =?us-ascii?Q?8KQNFwWAKO/54rRvqfmzG/7yoOquU6vohkVufgqUrKb5Ngi52FotjneuXzJZ?=
 =?us-ascii?Q?XBgaRg1ep+ohmoDkvu1M0SAtPkjY2AnHlktDS+35PKtSxFrrHYRGOAc3iT0S?=
 =?us-ascii?Q?tPSpoRpGk6kjJI0UkljqQhAmpZiFiLKsoLSCH6l0fWA6LCW0IT6l8CvRHwTW?=
 =?us-ascii?Q?s7PWXH4VE933VA5yLK2S1SHqI4Yi24kRMMdOAXqJeqbZHBdkew8zkAkQQtTw?=
 =?us-ascii?Q?5b9MjHv8dzxzf/3NxU4IWlRBfIk/LlV7Bju59LPSH6rHnHz51nYL4pb6aXtR?=
 =?us-ascii?Q?o8KinjvlmivRxA2usKRgmj4PElZffsqYJeIoTgQaiA/MNUoxe/3Q55mnWev+?=
 =?us-ascii?Q?WpS6ytMTOXAYU8KMve1mBPir6giUoyhDgl9q/bTucSLKJpoa6JIaipBzL8ig?=
 =?us-ascii?Q?AmiauhdjiKDVNPgp2xL9Wdw/jZYzTNst+tOIHZKnz2UY1AXqYmhGchSV8QUy?=
 =?us-ascii?Q?jqCEuG7N/q2kSUTUTfVTztMfjRYsJDeN03+v3m93Tbg2TqXL/iDVNrTWhw4W?=
 =?us-ascii?Q?IpK9tnxqMgKWgldsJffgfqhWjbsGDOckNgLjtBMjBDSKwJ1uK6CYoPYoKyp1?=
 =?us-ascii?Q?zILsBhxKGXa43on8UD6rkZepNOuafuWg5HDy7TzrtTedUXHweDoFu1eHcNmN?=
 =?us-ascii?Q?XPvZOuFXx5wqCnWkkx3dV7H3OCOek+IkqdVyDGFyPsNRtJmFsWbF+i2/1+yr?=
 =?us-ascii?Q?NR8k4qKdoOYhn5hC5IYAki7XWhbZSHya3r4qEGpndnIRsoPijtQR/x8a08KW?=
 =?us-ascii?Q?CCaOYE+FUc5q4qnxWuX8xDUW7UpaJsvrKW9j/OsQ6xc+c8jweYYocM/wofhO?=
 =?us-ascii?Q?KFH3pgFSQoojAVYmz3N8B1p1Oc3EK4eDN5+YLkLm5d6uJ1fLgnG8LfcVm8pi?=
 =?us-ascii?Q?z/w9VdZl8chtbpVQP/oxYHaZ2KitF+rVIToeLcEIOk2ofdOUyl9mgVaaovkT?=
 =?us-ascii?Q?W9lRTWy1ShbFk4Jfc9WeNk+M7gyvAl80B4/TXKtS8SYLvfrQVPySoDb+t6E6?=
 =?us-ascii?Q?VnCTbQDOaCGoIeEPC5HRAVGhuqCEY3lO7SDaUghMh5DyFWhNYE/ZwHMH8ivF?=
 =?us-ascii?Q?qSf0V/apbLFfrQuzFCgm2b2Kk/owBKtWGhYQcvERYWXigQTg/keuyWlH5pTE?=
 =?us-ascii?Q?nIaJJ84R7OI2NoWfMZNRA0Du7VgHDS2hHYwDUqOWH5M/BeQZJadP0wnRCOhV?=
 =?us-ascii?Q?YvkdhDmRB9OVmNSwWiKBCXKq87dq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB7272.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EMhNgUyEBv/eL03Guo0Aov7kDzdlCVGTgqLgg6b2Z0kNmlr2+PgZqX1N4BU+?=
 =?us-ascii?Q?cfn5ZaLQVFnv/UDw8u2aq2rSPKaXhAM+tRIKRpe8rOMaCBxMUGvgjtPeL+fm?=
 =?us-ascii?Q?1Q+pxIhQ9AYIYWtNlwvZuON9VNiy+qhkTEN/MIQ06tIYSOfUfTPw2t4qtf1G?=
 =?us-ascii?Q?EbrvakdtbFo8TFF39gmGiCDeRgKGCEdGCPJR84OYkJM6/2eoSOj21oqWOS5l?=
 =?us-ascii?Q?nxDLeCRYYy+t6xf1wJChBVVOrPVvycuqos9DRI5QUteiQzzWRXYk6vUusgeX?=
 =?us-ascii?Q?7hlaRb0GyHr0kuOcSesSRJBjOsLqkHcHpzMtpF47IJj58AEumRZsEPaTUDpx?=
 =?us-ascii?Q?QKYhlgVWSYT26RzUcsPOcewq0ClV2nYyQti8SMMNAPgs1zyIluhRrCahQ7oq?=
 =?us-ascii?Q?vzmzKNEkhPcWZR40QZGqdIgyt1IvEr9kxX4jVSZ6752DeTl97HXPL+3UR6Zz?=
 =?us-ascii?Q?mMWsCT9N8wY3utjjz/Po8EtBzgTCSARZAVO8YYMiDKCNPW/mQrW8TuoumO52?=
 =?us-ascii?Q?UHicDv6gJf9c+Y8RgDpitghPIO3d3D0oV8X/VKkPWuWIEALxt3uWnmljR0gn?=
 =?us-ascii?Q?d+yqEWHevcs/ch0x0yPrZeRpIss7f0ANuEnR5tMVNSU+2oa5CSnIYhUt5TUD?=
 =?us-ascii?Q?TkHrs96zpcQ7Q1QuEbOjwmyPNswKSAKXXeN4Toy6YO/GtfuwmYcL+OJgVL13?=
 =?us-ascii?Q?2QKaLkYco/oHcDoKvLZdxqMvY5+DTygXLASh5pdBWaEqOtnD0EVoxjkeBeq3?=
 =?us-ascii?Q?9KsAKQNMwGmha0ehWenAqHPQXiSxnwb464VCatAI0kBev7nabFCVDeF/szU+?=
 =?us-ascii?Q?0CNQdyBGG7MvvPwLnAzNWrCC9MHot8uJpG1VtTow4LUxyakQHNbojyscWzyQ?=
 =?us-ascii?Q?1vJT3T6mMcRytrlOKr5sCPjvI9Ubq/gQLVxZmAM20GIhtpb7hkCK9ZTXriZ3?=
 =?us-ascii?Q?4DkQLOJh3Vka6ctHtl7MglsR56Et3hQrG1eDDQm9jyBpqGYT0D9EeAjMsNXW?=
 =?us-ascii?Q?T1jQlNVBIk2w1YEeMmDXWza8XDwdCqNyPwHSb2La5SnaE/EmvhFGw/YkWwxt?=
 =?us-ascii?Q?Nbno7RyWEDemstFYn1zF++5lvZ0OHkJ4h83Hclb9PyqGDmvBHd5ukBaDB8yS?=
 =?us-ascii?Q?kDJmZ6kr57uvQbUJwAyY3fJqEFo/DEcSIy/qavpdl8Wto5FiEBeY4ultVA20?=
 =?us-ascii?Q?QKjJShuSWmYNkOcWF/WUrRhfDKXz9qbrvqvk0ZoeImbQfWPmHTK9nEaNM7ei?=
 =?us-ascii?Q?WAt0n8wv/RnUU3GNajl2mDl/sfVl2ybrMNlvRwL+B24Al2r5KzeFeeC0bD4v?=
 =?us-ascii?Q?DcH5gcu4sUGBnQfIVz0A1O7ByMSQOcmx8kAxss0fx0lBFXersqIS+Qnkq1V5?=
 =?us-ascii?Q?U6ZlSK7OtTkFP0yRH9jzDjw+HVa8oUTxbmNWLkGtMM84c/i5YklSyPZiOfAP?=
 =?us-ascii?Q?HE11Q4tgf+w+I63m7L+v12x7j8Cg9esV/KDDTQdL+6CNy6ICR2yAdBExWS+r?=
 =?us-ascii?Q?Hb72XAeYTJ9Cw2TfBOYhEwyZW2Ti5AjYJ+6cenAjFdf7peMtszCfVTvGZc/g?=
 =?us-ascii?Q?OYl8VqIzAeUYaj3/DVh74fzDAJT2sCgXFuMC72MU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4838419f-fab4-4189-7ae4-08dd46568f6f
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7272.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 02:32:54.5275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SNPZmgcqpiueOn7H4P+f43t1NmZ0rjp07sr5T83n3uzQAgqA70LHDfysPC3274IMCYoHKie2SbervOIUmVlAjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7312

When CONFIG_PCI_P2PDMA is enabled, it maps the PFN's via a
ZONE_DEVICE mapping using devm_memremap_pages(). The mapped
virtual address range corresponds to the pci_resource_start()
of the BAR address and size corresponding to the BAR length.

When KASLR is enabled, the direct map range of the kernel is
reduced to the size of physical memory plus additional padding.
If the BAR address is beyond this limit, PCI peer to peer DMA
mappings fail.

Fix this by not shrinking the size of direct map when CONFIG_PCI_P2PDMA
is enabled. This reduces the total available entropy, but it's
better than the current work around of having to disable KASLR
completely.

Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Link: https://lore.kernel.org/all/1462225276-106993-1-git-send-email-thgarnie@google.com/


Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---

Testing:

  commit 0483e1fa6e09d ("x86/mm: Implement ASLR for kernel memory regions") mentions the
  problems that the following problems need to be addressed.

  1 The three target memory sections are never at the same place between
    boots.
  2 The physical memory mapping can use a virtual address not aligned on
    the PGD page table.
  3 Have good entropy early at boot before get_random_bytes is available.
  4 Add optional padding for memory hotplug compatibility.

  Ran an automated test to ensure that (1) holds true across several
  iterations of automated reboot testing. 2, 3 and 4 are not impacted
  by this patch.

  Manual Testing on a system where the problem reproduces
  
  1. With KASLR

     Hotplug memory [0x240000000000-0x242000000000] exceeds maximum addressable range [0x0-0xaffffffffff]
     ------------[ cut here ]------------
  2. With the fixes

     added peer-to-peer DMA memory 0x240000000000-0x241fffffffff

     KASLR is still enabled as seen by kaslr_offset() (difference
     between __START_KERNEL and _stext)
  3. Without the fixes and KASLR disabled

     added peer-to-peer DMA memory 0x240000000000-0x241fffffffff

     KASLR is disabled, kaslr_offset() is 0.

On my system with 46 bits physical address and 4 level page tables (no
LA57), the remaining entropy dropped from 49 TiB to 20 TiB

 arch/x86/mm/kaslr.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/x86/mm/kaslr.c b/arch/x86/mm/kaslr.c
index 11a93542d198..3c306de52fd4 100644
--- a/arch/x86/mm/kaslr.c
+++ b/arch/x86/mm/kaslr.c
@@ -113,8 +113,14 @@ void __init kernel_randomize_memory(void)
 	memory_tb = DIV_ROUND_UP(max_pfn << PAGE_SHIFT, 1UL << TB_SHIFT) +
 		CONFIG_RANDOMIZE_MEMORY_PHYSICAL_PADDING;
 
-	/* Adapt physical memory region size based on available memory */
-	if (memory_tb < kaslr_regions[0].size_tb)
+	/*
+	 * Adapt physical memory region size based on available memory,
+	 * except when CONFIG_PCI_P2PDMA is enabled. P2PDMA exposes the
+	 * device BAR space assuming the direct map space is large enough
+	 * for creating a ZONE_DEVICE mapping in the direct map corresponding
+	 * to the physical BAR address.
+	 */
+	if (!IS_ENABLED(CONFIG_PCI_P2PDMA) && (memory_tb < kaslr_regions[0].size_tb))
 		kaslr_regions[0].size_tb = memory_tb;
 
 	/*
-- 
2.48.0

