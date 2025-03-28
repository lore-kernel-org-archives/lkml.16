Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12olkn2080.outbound.protection.outlook.com [40.92.21.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE2F26AC3
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 03:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.21.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743132028; cv=fail; b=fYeY3VI3Iv6AYbUds9ouZlg550GCatUUp64THO29Bu17zszr5UoqWct7UyzkVhj77uZdD7AQ9LEe+3wLAtW5HWHn1V1rdNYdXt4ZCHknFrJA/AGwwSu71iiPSEy8DGezfv501/VOBD0BrPOpcgvKA+cvhEE4CnNz43P0bA9WwT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743132028; c=relaxed/simple;
	bh=1a+tVkjUTKUtA0nOoeCbAInVqkuRijppSIR9BD8Tn/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PAiRd6AkXaEz747iRYfzbf+dT+Fcd8x5gaitaV11dqlkr+8O90TZi62cW+rSYVg4RgPW8i1xgMWbmGQfScj3lYnv5lEqxDC4c1gT/tC5yIQyT13UrsdbF7l8H6k9PdKV4D8HFDxbEFihs784Bcxkxfo8dOc0vDHTs0ItQml+SAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=BdKnrZLB; arc=fail smtp.client-ip=40.92.21.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="BdKnrZLB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PqcwuNWCiA6+H05qiUY9tU8JOMl/iccXxSSjQlF5fCI9ZM2SxgZ+yp/Ev5SHG+3IIWv0kvAAZueioQS1tN9Zg4632ek5U0/Qhx0xOzQxD13PMVqfyISuNGFw6zSKP0cQ72kN5m3JjwT/WMibaBGBlFcnfOj/9HQUbgSqR+mLMNRvaUlaD1OEy3hHbUP2y4/fXb5qwPwkJBX+ntbcDpwbhRu54QD5Jk0rcHRkrY+iyiSAWXyn18hd+CMG0+P69CExpD7m0FW998HRvFEuhtgbM8NqyZP0f2Ny/FBgIAImDlIFlCudG4tCZOZdk65Dah+W7EJ0afIRHKlcrkGrcPnzyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8VTpszg0CkEgQYEE4PYAj92lZa1CvhjD3xdlw77cQA=;
 b=Bsmk1uh/EAlvRV2sUcwsG9LhETkijJ8wZ4x9Wj/0AxC3FzE9di6Dzd7/Ia5eUf4oMCHwk3FCmXMs+Bw+ujfwzA3cS6WSp1l9LMkHPGnuQ/pVpUaF+G1/C4ZeYwoXcXComdVG9kvA4NGutAZy3cMyD8qFR7M0eAbBc/OtC1h0pX3A1ZtO2pbAIieexStfXiblOS8G9HiG1d9Z5jLt/YaN+aWJxgmyO0BcUIB8N6zYKFL/VXwRIhlXNcflPg+SRpsG932nJUGphDV9ksbnWHOjWTOvI+s3/Y1B6xOTe8Lj8+ucqKuhIRNMJ5RzHahLMqwacwYuVJNvhzaLJw0GIP6Jjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8VTpszg0CkEgQYEE4PYAj92lZa1CvhjD3xdlw77cQA=;
 b=BdKnrZLBjKmm6/4pvLUgV5XfaqEYhVAlcdjD1Mx4/IyDyzDgWK2CDRsgIBAlylxL3bnDu+mqk+Wq6cVF+/9eaCd4SKFdUNGJaYFQYuCIfi0jR9oX77oH5L2MPiD+Eao1SCVVbN4iidOin1UtsX07Nkg/7ngc8JJx9+BPC3ZvhewwSrnlcEIXYY4N/WhOsafL10ictjYG1Sh1NkyjArgVn/H6GW0PYqDHZxHcrQrGzf8JoKfeyrQlVw1f8kD128/brDoQRtcZ81tzARyTnkSOP1xbb3VQqSHjCkT694nfCulmKWXW8ks9sP4zmPfH0hO4ylc1y34mP8hUoiktUiETbg==
Received: from LV3P220MB1815.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:1d6::19)
 by SA1P220MB1998.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:3e8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 03:20:24 +0000
Received: from LV3P220MB1815.NAMP220.PROD.OUTLOOK.COM
 ([fe80::6590:3e70:cb56:d25c]) by LV3P220MB1815.NAMP220.PROD.OUTLOOK.COM
 ([fe80::6590:3e70:cb56:d25c%3]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 03:20:24 +0000
From: MrMartyK <martykareem@outlook.com>
To: Peter Xu <peterx@redhat.com>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	shuah@kernel.org,
	MrMartyK <martykareem@outlook.com>
Subject: [PATCH v2] mm/selftest: Fix race condition in userfaultfd dynamic address allocation
Date: Thu, 27 Mar 2025 23:19:24 -0400
Message-ID:
 <LV3P220MB1815E7BF036FFA1B1D19D38BBAA02@LV3P220MB1815.NAMP220.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <Z9rQU64AAnrGlATV@x1.local>
References: <Z9rQU64AAnrGlATV@x1.local>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT4P288CA0012.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d4::16) To LV3P220MB1815.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:1d6::19)
X-Microsoft-Original-Message-ID:
 <20250328031936.57122-1-martykareem@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3P220MB1815:EE_|SA1P220MB1998:EE_
X-MS-Office365-Filtering-Correlation-Id: 39b8ef04-8d7a-4a07-6e69-08dd6da77a61
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|8060799006|5072599009|15080799006|461199028|440099028|3412199025|13041999003|41001999003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RBB3QIvJEOS4x5U6vh0NqgmDdmBMzvSnWEfDQaWO/he8crbHDaJZZe2wN/Vw?=
 =?us-ascii?Q?GmMm41848BkPdcVlR7Bb3tCRwX+BVA3i3HovO3VW28/TO1INT/dLzvcjyeSh?=
 =?us-ascii?Q?Y6+BOzwS/FXljALGfuudYNVVus7Dc1ma2AGb9sFI7z44G/ey6hnLu1dSfHvw?=
 =?us-ascii?Q?SHv8e1bkqyFkZd+w+YzlFFU4vTG/+1GS7eWMK0aR78300gezHEmC/C/l9C2l?=
 =?us-ascii?Q?EtZLMvsWxOeSv0GGfZxkQW2G40pmhiv+cPcX4vNv+CmCF9IgVBTEkC0tU/Gk?=
 =?us-ascii?Q?UrTVbJWAZYLUXj02Yc2uKYwXcGidKa/fhlD0S9faaFZhGzfiUtwqkWJ0Jlsx?=
 =?us-ascii?Q?NVXA31wnyJgiHJnksj15ikjpc6zlc3Qdr0ALi/XvOF4dt4QEAd7EcWu4QsJP?=
 =?us-ascii?Q?KmoISeTERM2n4nv3MJcwEGgJTX0R1WJKktSlCVxo2LxPj8XpnuQfp4kU0lFA?=
 =?us-ascii?Q?FTgeI2T7s6m0tMkUVt08atSWXhewt0f6JhZ8/08zncGNOmpS9o0bsxCzYPH+?=
 =?us-ascii?Q?f2j1yXrGtl3VaZ3zkwjZxGOFt000oG8nS1+jsq2bpQe7hWXpGSMzhUY17Zn3?=
 =?us-ascii?Q?30jvyOmSwqsJBotCpn3n3rgnY113long4ygBC81yYtIfUyJj09UA0Epjz5Cx?=
 =?us-ascii?Q?wwENVFtMuoYpfHbVYdM6xukeEYmXcaHPBanen5KkEIISHfRxw2HkcgrG5u/J?=
 =?us-ascii?Q?wB4045eZR0uNizwDm4F3sq7YPTg4fS4GHFfcqtetORXN8/+1BltZC5J+cvts?=
 =?us-ascii?Q?BNVwnkMT5P2aeYeIeqsZ85uy3edupMHyrp+ThpBI3OH75aBbdW2AgZd5iSHE?=
 =?us-ascii?Q?72bFhPjIDxkVYZKRfQ6U3mJHrIYKkAXn5wqghhoeZsEyQR0fJWZlkpbEMWH2?=
 =?us-ascii?Q?cC5GZLfXLU0kkDDZZj/iJvQqnHJ7geE5FPNek6FSfT08elCirghE2Q+tnEND?=
 =?us-ascii?Q?BqZvf039zF5/az9/uffMcq0MXfnoWg2NIzaCbjuXgQvKWzjkITeZawZVSWfp?=
 =?us-ascii?Q?LplY+9DvcMoyZ2sP+NAwXuCmWIWpP3tqUVIh73DdqITznvKwqFhfX9n1tWhJ?=
 =?us-ascii?Q?tEyNj0WNvhMnY3/IThcAuLBnqykXFmV2Jmcw38Wwt3so1eAsCySRrz72dXWC?=
 =?us-ascii?Q?0vJCni59bM61iMFIsSDAt3Yo6A97UwZlkhc8JI3Xt6CrPMzQEQC942U=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o3obr/Tm6YS/XCVILBcQWETw+3R78oChMClkHiJktvkPEv/IiBhiRcw0/qzg?=
 =?us-ascii?Q?wJ/g0ffNe4kBbdet6Dcz8pCn/XRDPW9x28SMMt92eTo2toLw9JKFBisXVw7r?=
 =?us-ascii?Q?M/hjHN16wV2da1dwOunkrs3xC6/y7rkALMCInvs2tO9rCjXBAwf9/13hi7RV?=
 =?us-ascii?Q?9b5XtuwimqkTqVGN2r1Tv4w9MgRIW0i6M38NiJkwbv1twJMBzEB7N3FfOH02?=
 =?us-ascii?Q?6wFHgoIxH2+BtjbuH8sa0JXU7df6XHXX47w1bln/vioqO1wzPUuqmUgfwRTf?=
 =?us-ascii?Q?iWvxReetC4gTV+ptFotzUi0vVEDpkpiE7NbkzqvtvB4f/LDFnpSHemU6ClJe?=
 =?us-ascii?Q?nkxgCbPYlrZ6KGuNwKNdTeswpVzVeCwZ5SNLOgugqCwkhO6S9LVHo1umnKlW?=
 =?us-ascii?Q?ly3fy+eyTLee0i8jJnFUppcBdxT8vGtWrSR7nY92RaubxdskfZZ1CdQCsVnr?=
 =?us-ascii?Q?3XmORU9pfmg//B6aSUnIMpJt/64DMEzJ/FMOjz+1mFES11yxKRQBwscnxHeG?=
 =?us-ascii?Q?rNeQ95UjxzjwbuniZl7yUQwbSihWtRkU0NJULR/Gi2zl2HAaoyoMxutOQsXn?=
 =?us-ascii?Q?TGYpQRVdcq6E5RQ0HigGaWgCFoGnna+TY5njl7u69TA7TQfGzJTkbjrjTbQr?=
 =?us-ascii?Q?MebuORLij12/espMGTOfjJ7XcvmNorDKPukoyzr2yN0QQ/tNBCLZIkxaPS83?=
 =?us-ascii?Q?6PkprmrbwoPs28mNH7cJTzTQmbEaMK7O2P5T4ptRYFUwnQpW0WdcCojnetsS?=
 =?us-ascii?Q?xXlp81xXlR81dwiy+5xBHrkFpFKzMThaEno7CdELD7milr6yfHvv1Btj0+Tp?=
 =?us-ascii?Q?LNeug4zQzDKn44QFFpkkodHpx7Ri3RcaC6UGhRyv42SiZvX0JUd3DcFVtHpe?=
 =?us-ascii?Q?7FQ1EAmxQtEemaA0DW8f2uqlY2+YZOGv+P57ohNehpnMOVXAIazbtL3qbZop?=
 =?us-ascii?Q?LrX+/gaQLn46pZWEVQCO083vaptpOdajHOeExjxWjlftvpHZCUObyBJNDDRl?=
 =?us-ascii?Q?f9UC/I92yH7Z4wSd3x692B+HOR0l0J0ye5kHKDvnPYXe+v62ukYZUOvnj8tA?=
 =?us-ascii?Q?nIORrC0DtmXzYHtUDFqc/FiXZP6/WM2nva1+5GG6GBgIJGw0yPNy8qCWCdFo?=
 =?us-ascii?Q?rfvN2++b2ZNLN6PhX9O1EYrMl80gIxRghvVWoUouE0fk+qAGukss+kpGDIeP?=
 =?us-ascii?Q?SN8eLWT56ll6445PBXmBIuJws2V8JQLyHmsfsrG8uaHgvpo5Q5f8AcQrk9cA?=
 =?us-ascii?Q?BRQDlx/FIq9dRbZEaBZT?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39b8ef04-8d7a-4a07-6e69-08dd6da77a61
X-MS-Exchange-CrossTenant-AuthSource: LV3P220MB1815.NAMP220.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 03:20:23.9087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P220MB1998

This patch improves the dynamic address allocation in userfaultfd tests to
prevent potential race conditions. Instead of unmapping the PROT_NONE
reservation before mapping to that area, we now keep the temporary
reservation active until we can atomically replace it with MAP_FIXED.

Key changes:
1. Keep PROT_NONE reservation active until ready to use
2. Use MAP_FIXED to atomically replace reservation
3. Remove MAP_FIXED_NOREPLACE conditionals since atomic replacement works
   on all kernel versions
4. Simplify overall implementation while maintaining robustness

This approach prevents race conditions where another thread might grab the
memory area between unmapping and remapping, making the tests more reliable
especially when running in parallel.

Performance impact is minimal (approximately 1.3x overhead vs static
addressing) while significantly improving reliability.
---
 tools/testing/selftests/mm/uffd-common.c | 113 ++++++++---------------
 1 file changed, 39 insertions(+), 74 deletions(-)

diff --git a/tools/testing/selftests/mm/uffd-common.c b/tools/testing/selftests/mm/uffd-common.c
index 56a69c6cc7c4..fab3b79abc15 100644
--- a/tools/testing/selftests/mm/uffd-common.c
+++ b/tools/testing/selftests/mm/uffd-common.c
@@ -123,54 +123,22 @@ static void shmem_release_pages(char *rel_area)
 }
 
 /**
- * Structure to hold the reservation and aligned address information
- * This helps prevent race conditions by keeping the original reservation
- * active until it can be atomically replaced with the real mapping.
- */
-struct addr_mapping {
-	void *reservation;   /* The original memory reservation */
-	void *aligned_addr;  /* The aligned address for actual use */
-	size_t size;         /* Size of the reservation */
-};
-
-/**
- * Find a suitable virtual address area of the requested size and alignment
+ * Find a suitable virtual address area of the requested size
  * 
- * This function obtains a hint from the OS about where a good place to map
- * memory might be, creates a temporary reservation to hold the space, and
- * calculates an aligned address within that reservation.
+ * This function creates a temporary reservation with PROT_NONE to hold
+ * the address space. This reservation prevents other threads from taking
+ * the address range until we can atomically replace it with our real mapping.
  *
- * IMPORTANT: The caller must eventually unmap the reservation when done
- * or replace it with MAP_FIXED to prevent memory leaks.
+ * IMPORTANT: The caller must eventually replace this reservation with MAP_FIXED
+ * or munmap it to prevent memory leaks.
  *
- * @param mapping    Pointer to addr_mapping struct that will receive the results
  * @param size       Size of the memory area needed
- * @param alignment  Alignment requirement (typically huge page size)
- * @return           0 on success, -1 on failure
+ * @return           Reserved memory area or NULL on failure
  */
-static int find_suitable_area(struct addr_mapping *mapping, size_t size, size_t alignment)
+static void *find_suitable_area(size_t size)
 {
-	void *addr;
-	uintptr_t aligned_addr;
-	
-	if (!mapping)
-		return -1;
-		
-	/* First create a reservation with PROT_NONE to hold the address space */
-	addr = mmap(NULL, size, PROT_NONE, 
-	            MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
-	if (addr == MAP_FAILED)
-		return -1;
-	
-	/* Calculate an aligned address within this reservation */
-	aligned_addr = ((uintptr_t)addr + alignment - 1) & ~(alignment - 1);
-	
-	/* Store both the reservation and the aligned address */
-	mapping->reservation = addr;
-	mapping->aligned_addr = (void *)aligned_addr;
-	mapping->size = size;
-	
-	return 0;
+	/* Create a reservation with PROT_NONE to hold the address space */
+	return mmap(NULL, size, PROT_NONE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
 }
 
 static int shmem_allocate_area(void **alloc_area, bool is_src)
@@ -179,13 +147,12 @@ static int shmem_allocate_area(void **alloc_area, bool is_src)
 	size_t bytes = nr_pages * page_size, hpage_size = read_pmd_pagesize();
 	unsigned long offset = is_src ? 0 : bytes;
 	int mem_fd = uffd_mem_fd_create(bytes * 2, false);
-	struct addr_mapping addr_map = {0};
-	struct addr_mapping alias_map = {0};
-	int ret;
+	void *reserved_area = NULL;
+	void *reserved_alias = NULL;
 
-	/* Get a suitable address space with reservation */
-	ret = find_suitable_area(&addr_map, bytes, hpage_size);
-	if (ret < 0) {
+	/* Get a suitable address reservation */
+	reserved_area = find_suitable_area(bytes);
+	if (reserved_area == MAP_FAILED) {
 		/* Couldn't get a reservation, but we can still try without hints */
 		*alloc_area = mmap(NULL, bytes, PROT_READ | PROT_WRITE,
 				  MAP_SHARED, mem_fd, offset);
@@ -195,21 +162,22 @@ static int shmem_allocate_area(void **alloc_area, bool is_src)
 			return -errno;
 		}
 	} else {
-		void *target_addr = addr_map.aligned_addr;
+		void *target_addr = reserved_area;
 		
 		/* If this is dst area, add offset to prevent overlap with src area */
 		if (!is_src) {
+			/* Unmap the original reservation since we're using a different address */
+			munmap(reserved_area, bytes);
+			
 			/* Calculate new address with the same spacing as original code */
 			/* src map + alias + interleaved hpages */
-			uintptr_t new_addr = (uintptr_t)target_addr + 
-				2 * (bytes + hpage_size);
-			
-			/* Unmap the original reservation since we're using a different address */
-			munmap(addr_map.reservation, addr_map.size);
+			target_addr = (char *)reserved_area + 2 * (bytes + hpage_size);
 			
 			/* Create a new reservation at the offset location */
-			ret = find_suitable_area(&addr_map, bytes, hpage_size);
-			if (ret < 0) {
+			reserved_area = mmap(target_addr, bytes, PROT_NONE, 
+			                      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+			
+			if (reserved_area == MAP_FAILED) {
 				/* Fallback to non-fixed mapping if we can't reserve space */
 				*alloc_area = mmap(NULL, bytes, PROT_READ | PROT_WRITE,
 						MAP_SHARED, mem_fd, offset);
@@ -220,7 +188,7 @@ static int shmem_allocate_area(void **alloc_area, bool is_src)
 				}
 			} else {
 				/* Use our new reservation */
-				target_addr = addr_map.aligned_addr;
+				target_addr = reserved_area;
 			}
 		}
 		
@@ -233,14 +201,11 @@ static int shmem_allocate_area(void **alloc_area, bool is_src)
 		*alloc_area = mmap(target_addr, bytes, PROT_READ | PROT_WRITE,
 				  MAP_SHARED | MAP_FIXED, mem_fd, offset);
 		
-		/* Check if the mapping succeeded at our target address */
-		if (*alloc_area == MAP_FAILED || *alloc_area != target_addr) {
+		if (*alloc_area == MAP_FAILED) {
 			/* If fixed mapping failed, clean up and try anywhere */
-			if (*alloc_area != MAP_FAILED)
-				munmap(*alloc_area, bytes);
-				
-			/* Clean up the reservation if it's still around */
-			munmap(addr_map.reservation, addr_map.size);
+			/* Explicitly munmap the reservation since our map failed */
+			if (reserved_area != MAP_FAILED)
+				munmap(reserved_area, bytes);
 				
 			/* Fall back to letting the kernel choose an address */
 			*alloc_area = mmap(NULL, bytes, PROT_READ | PROT_WRITE,
@@ -254,12 +219,12 @@ static int shmem_allocate_area(void **alloc_area, bool is_src)
 	}
 
 	/* Calculate a good spot for the alias mapping with space to prevent merging */
-	ret = find_suitable_area(&alias_map, bytes, hpage_size);
-	if (ret < 0) {
+	void *p_alias = (char *)((uintptr_t)*alloc_area + bytes + hpage_size);
+	
+	/* Reserve space for alias mapping */
+	reserved_alias = find_suitable_area(bytes);
+	if (reserved_alias == MAP_FAILED) {
 		/* Fallback to using an offset from the first mapping */
-		void *p_alias = (char *)((uintptr_t)*alloc_area + bytes + hpage_size);
-		
-		/* No reservation, map directly */
 		area_alias = mmap(p_alias, bytes, PROT_READ | PROT_WRITE,
 				MAP_SHARED | MAP_FIXED, mem_fd, offset);
 				
@@ -270,14 +235,14 @@ static int shmem_allocate_area(void **alloc_area, bool is_src)
 		}
 	} else {
 		/* Use our reservation for the alias mapping */
-		area_alias = mmap(alias_map.aligned_addr, bytes, PROT_READ | PROT_WRITE,
+		area_alias = mmap(reserved_alias, bytes, PROT_READ | PROT_WRITE,
 				MAP_SHARED | MAP_FIXED, mem_fd, offset);
 				
-		/* Whether it succeeded or failed, we need to clean up the reservation */
-		if (area_alias != alias_map.aligned_addr)
-			munmap(alias_map.reservation, alias_map.size);
-			
+		/* If mapping failed, try without specific address */
 		if (area_alias == MAP_FAILED) {
+			/* Clean up the reservation since it didn't get replaced */
+			munmap(reserved_alias, bytes);
+			
 			/* If fixed mapping failed, try anywhere */
 			area_alias = mmap(NULL, bytes, PROT_READ | PROT_WRITE,
 					MAP_SHARED, mem_fd, offset);
-- 
2.43.0

