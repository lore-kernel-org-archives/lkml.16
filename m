Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DB627CCDC
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350265; cv=none; b=jVn5YAfu0WupuqGOT1mlDRJHRmEjfo9DnmR3wCujHNtrlpGGgEGb3lBl4Tscrv/4mga2lwhUk3QrL8gjWBbdY81fHWXOxoR/a2GdJM5JSeS5seXhqyTF2kjoOM0iYNxrldfXfDyQp28cAowIlzRtLkvUTfbhCqSgWbSBhlzhYdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350265; c=relaxed/simple;
	bh=bJayqT9PLYf/Eavx+FSV6PdwXiUM9NaeuJAMdksPK5c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SZlWPVqaV9ejZsWIRVioPXwGiQMfKmBBTpnsTAtMGi5mOMZqnHauIt67DW7RG4JeXuFpyxLs2Ap3lSQCTbxJsMpwa3LRviQ+7rkiN7DdTnlQlvBvFIZksLG22x9As+vqLRvpA2N9gJX6K3QZcKrO7E3CpN/vQzSzx43aP9EIFjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=VOngdkjP; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="VOngdkjP"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53ALB1ej004517;
	Fri, 11 Apr 2025 05:44:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=g/9oFaxoRt7zlOW90/wBFLuDkMSAFcU7A0l8UeUUQ
	ZU=; b=VOngdkjPrlCwCTdU9yx0LT/hEuF0aySRH2URy0UxlQTecwzIEQVTXKE96
	GrmfRu+wtTouvwGsSzAddt3BGOwqawflxi7dQU59D+GNWwWfnEXqju4WDelSBD+E
	UudoSvBBCbkNBsUuiQXkVhW9tyhbdz89f2pfJNOb7mtLhrBVHT4z5Y5EHTrh2Ygt
	sOikJRWfty+icIjwziljuqEese9SJNVH8tyzlOC34gEyaBZDwV1HITkDCFH3uHE6
	PRL8xKCKYqbfm7NpR7qZICh/Wix7Lo9wKbUWRK9rQZSgpeRdX4R+09GVWQubJP2g
	7TYX7dMuOeRIBKlMwpddw9ytZJr5w==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45xe13vft4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 05:44:04 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53B0p97m013925;
	Fri, 11 Apr 2025 05:44:03 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45ufup1j26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 05:44:03 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53B5i10628836368
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 05:44:01 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8DAE920043;
	Fri, 11 Apr 2025 05:44:01 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B753C20040;
	Fri, 11 Apr 2025 05:44:00 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 11 Apr 2025 05:44:00 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (haven.au.ibm.com [9.63.198.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 1AC76602D4;
	Fri, 11 Apr 2025 15:43:57 +1000 (AEST)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: x86@kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        pasha.tatashin@soleen.com, sweettea-kernel@dorminy.me,
        christophe.leroy@csgroup.eu
Subject: [PATCH v14 00/11] Support page table check on PowerPC
Date: Fri, 11 Apr 2025 15:43:43 +1000
Message-ID: <20250411054354.511145-1-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XFTub1w76ddUJcbaUFbHNKeD3yEsbzlg
X-Proofpoint-GUID: XFTub1w76ddUJcbaUFbHNKeD3yEsbzlg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 phishscore=0 mlxlogscore=999 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504110038

Support page table check on all PowerPC platforms. This works by
serialising assignments, reassignments and clears of page table
entries at each level in order to ensure that anonymous mappings
have at most one writable consumer, and likewise that file-backed
mappings are not simultaneously also anonymous mappings.

In order to support this infrastructure, a number of stubs must be
defined for all powerpc platforms. Additionally, separate set_pte_at()
and set_pte_at_unchecked(), to allow for internal, uninstrumented mappings.

(This series was written by Rohan McLure, who has left IBM and is no longer
working on powerpc.)

v14:
 * Fix a call to page_table_check_pud_set() that was missed (akpm)

v13:
 * Rebase on mainline
 * Don't use set_pte_at_unchecked() for early boot purposes (Pasha)
Link: https://lore.kernel.org/linuxppc-dev/20250211161404.850215-1-ajd@linux.ibm.com/

v12:
 * Rename commits that revert changes to instead reflect that we are
   reinstating old behaviour due to it providing more flexibility
 * Add return line to pud_pfn() stub
 * Instrument ptep_get_and_clear() for nohash
Link: https://lore.kernel.org/linuxppc-dev/20240402051154.476244-1-rmclure@linux.ibm.com/

v11:
 * The pud_pfn() stub, which previously had no legitimate users on any
   powerpc platform, now has users in Book3s64 with transparent pages.
   Include a stub of the same name for each platform that does not
   define their own.
 * Drop patch that standardised use of p*d_leaf(), as already included
   upstream in v6.9.
 * Provide fallback definitions of p{m,u}d_user_accessible_page() that
   do not reference p*d_leaf(), p*d_pte(), as they are defined after
   powerpc/mm headers by linux/mm headers.
 * Ensure that set_pte_at_unchecked() has the same checks as
   set_pte_at().
Link: https://lore.kernel.org/linuxppc-dev/20240328045535.194800-14-rmclure@linux.ibm.com/ 

v10:
 * Revert patches that removed address and mm parameters from page table
   check routines, including consuming code from arm64, x86_64 and
   riscv.
 * Implement *_user_accessible_page() routines in terms of pte_user()
   where available (64-bit, book3s) but otherwise by checking the
   address (on platforms where the pte does not imply whether the
   mapping is for user or kernel)
 * Internal set_pte_at() calls replaced with set_pte_at_unchecked(), which
   is identical, but prevents double instrumentation.
Link: https://lore.kernel.org/linuxppc-dev/20240313042118.230397-9-rmclure@linux.ibm.com/T/

v9:
 * Adapt to using the set_ptes() API, using __set_pte_at() where we need
   must avoid instrumentation.
 * Use the logic of *_access_permitted() for implementing
   *_user_accessible_page(), which are required routines for page table
   check.
 * Even though we no longer need p{m,u,4}d_leaf(), still default
   implement these to assist in refactoring out extant
   p{m,u,4}_is_leaf().
 * Add p{m,u}_pte() stubs where asm-generic does not provide them, as
   page table check wants all *user_accessible_page() variants, and we
   would like to default implement the variants in terms of
   pte_user_accessible_page().
 * Avoid the ugly pmdp_collapse_flush() macro nonsense! Just instrument
   its constituent calls instead for radix and hash.
Link: https://lore.kernel.org/linuxppc-dev/20231130025404.37179-2-rmclure@linux.ibm.com/

v8:
 * Fix linux/page_table_check.h include in asm/pgtable.h breaking
   32-bit.
Link: https://lore.kernel.org/linuxppc-dev/20230215231153.2147454-1-rmclure@linux.ibm.com/

v7:
 * Remove use of extern in set_pte prototypes
 * Clean up pmdp_collapse_flush macro
 * Replace set_pte_at with static inline function
 * Fix commit message for patch 7
Link: https://lore.kernel.org/linuxppc-dev/20230215020155.1969194-1-rmclure@linux.ibm.com/

v6:
 * Support huge pages and p{m,u}d accounting.
 * Remove instrumentation from set_pte from kernel internal pages.
 * 64s: Implement pmdp_collapse_flush in terms of __pmdp_collapse_flush
   as access to the mm_struct * is required.
Link: https://lore.kernel.org/linuxppc-dev/20230214015939.1853438-1-rmclure@linux.ibm.com/

v5:
Link: https://lore.kernel.org/linuxppc-dev/20221118002146.25979-1-rmclure@linux.ibm.com/

Rohan McLure (11):
  mm/page_table_check: Reinstate address parameter in
    [__]page_table_check_pud_set()
  mm/page_table_check: Reinstate address parameter in
    [__]page_table_check_pmd_set()
  mm/page_table_check: Provide addr parameter to
    page_table_check_pte_set()
  mm/page_table_check: Reinstate address parameter in
    [__]page_table_check_pud_clear()
  mm/page_table_check: Reinstate address parameter in
    [__]page_table_check_pmd_clear()
  mm/page_table_check: Reinstate address parameter in
    [__]page_table_check_pte_clear()
  mm: Provide address parameter to p{te,md,ud}_user_accessible_page()
  powerpc: mm: Add pud_pfn() stub
  powerpc: mm: Implement *_user_accessible_page() for ptes
  powerpc: mm: Use set_pte_at_unchecked() for internal usages
  powerpc: mm: Support page table check

 arch/arm64/include/asm/pgtable.h             | 18 +++---
 arch/powerpc/Kconfig                         |  1 +
 arch/powerpc/include/asm/book3s/32/pgtable.h | 12 +++-
 arch/powerpc/include/asm/book3s/64/pgtable.h | 62 +++++++++++++++---
 arch/powerpc/include/asm/nohash/pgtable.h    | 13 +++-
 arch/powerpc/include/asm/pgtable.h           | 19 ++++++
 arch/powerpc/mm/book3s64/hash_pgtable.c      |  4 ++
 arch/powerpc/mm/book3s64/pgtable.c           | 17 +++--
 arch/powerpc/mm/book3s64/radix_pgtable.c     |  9 ++-
 arch/powerpc/mm/pgtable.c                    | 12 ++++
 arch/riscv/include/asm/pgtable.h             | 18 +++---
 arch/x86/include/asm/pgtable.h               | 22 +++----
 include/linux/page_table_check.h             | 67 ++++++++++++--------
 include/linux/pgtable.h                      | 10 +--
 mm/page_table_check.c                        | 39 +++++++-----
 15 files changed, 226 insertions(+), 97 deletions(-)

-- 
2.49.0

