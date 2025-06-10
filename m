Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A576121D5B3
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749541842; cv=none; b=tZzhezIrEG+RZGaRSN5ymH9nTnT8RSMSuPEyTeL5wFiBmt8gkRlWNC+Kf+wX1o1yobiDZLU+jxR1jQHb+DwkDRLc/J3N+6xCRBGlJ1ViNtwyEXn2AxNze+VemI6jVeaf0qfS5Lehtyg0hTishhV80SR3HJ2mtSsVfydlEPXVIiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749541842; c=relaxed/simple;
	bh=QwXNzrYA3XbUsYG2wY6D88d69xcz9+dTsEAyn80rNcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LnXRWGOTvznlaZTwvq8QQOWRsCMxw8Smw9g+Wl1aDINNZ37j5P0dt1ZU8EeP9bV3pKXjT42zj/flWEJBxTxpvVaLlpo4WWBdlgLyqzhJ9M44my78eBT8l99tWQTorbOi/dRI2OqmN7gP3pJcSsDs6cj1qxJFRbxd7vLZi7qMBYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bGgWw6GWqz9sWd;
	Tue, 10 Jun 2025 09:33:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IomiIPVP0wtF; Tue, 10 Jun 2025 09:33:48 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bGgWw5Tdpz9s9J;
	Tue, 10 Jun 2025 09:33:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B6E718B778;
	Tue, 10 Jun 2025 09:33:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 9xzMDpp4MJkO; Tue, 10 Jun 2025 09:33:48 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2AB3F8B76D;
	Tue, 10 Jun 2025 09:33:48 +0200 (CEST)
Message-ID: <cd96d70b-1eb3-494a-912a-52d479e3df87@csgroup.eu>
Date: Tue, 10 Jun 2025 09:33:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 00/11] Support page table check on PowerPC
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: x86@kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 pasha.tatashin@soleen.com, sweettea-kernel@dorminy.me
References: <20250411054354.511145-1-ajd@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250411054354.511145-1-ajd@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 11/04/2025 à 07:43, Andrew Donnellan a écrit :
> Support page table check on all PowerPC platforms. This works by
> serialising assignments, reassignments and clears of page table
> entries at each level in order to ensure that anonymous mappings
> have at most one writable consumer, and likewise that file-backed
> mappings are not simultaneously also anonymous mappings.
> 
> In order to support this infrastructure, a number of stubs must be
> defined for all powerpc platforms. Additionally, separate set_pte_at()
> and set_pte_at_unchecked(), to allow for internal, uninstrumented mappings.
> 
> (This series was written by Rohan McLure, who has left IBM and is no longer
> working on powerpc.)

This series requires a rebase after commit 91e40668e70a 
("mm/page_table_check: Batch-check pmds/puds just like ptes")


Christophe

> 
> v14:
>   * Fix a call to page_table_check_pud_set() that was missed (akpm)
> 
> v13:
>   * Rebase on mainline
>   * Don't use set_pte_at_unchecked() for early boot purposes (Pasha)
> Link: https://lore.kernel.org/linuxppc-dev/20250211161404.850215-1-ajd@linux.ibm.com/
> 
> v12:
>   * Rename commits that revert changes to instead reflect that we are
>     reinstating old behaviour due to it providing more flexibility
>   * Add return line to pud_pfn() stub
>   * Instrument ptep_get_and_clear() for nohash
> Link: https://lore.kernel.org/linuxppc-dev/20240402051154.476244-1-rmclure@linux.ibm.com/
> 
> v11:
>   * The pud_pfn() stub, which previously had no legitimate users on any
>     powerpc platform, now has users in Book3s64 with transparent pages.
>     Include a stub of the same name for each platform that does not
>     define their own.
>   * Drop patch that standardised use of p*d_leaf(), as already included
>     upstream in v6.9.
>   * Provide fallback definitions of p{m,u}d_user_accessible_page() that
>     do not reference p*d_leaf(), p*d_pte(), as they are defined after
>     powerpc/mm headers by linux/mm headers.
>   * Ensure that set_pte_at_unchecked() has the same checks as
>     set_pte_at().
> Link: https://lore.kernel.org/linuxppc-dev/20240328045535.194800-14-rmclure@linux.ibm.com/
> 
> v10:
>   * Revert patches that removed address and mm parameters from page table
>     check routines, including consuming code from arm64, x86_64 and
>     riscv.
>   * Implement *_user_accessible_page() routines in terms of pte_user()
>     where available (64-bit, book3s) but otherwise by checking the
>     address (on platforms where the pte does not imply whether the
>     mapping is for user or kernel)
>   * Internal set_pte_at() calls replaced with set_pte_at_unchecked(), which
>     is identical, but prevents double instrumentation.
> Link: https://lore.kernel.org/linuxppc-dev/20240313042118.230397-9-rmclure@linux.ibm.com/T/
> 
> v9:
>   * Adapt to using the set_ptes() API, using __set_pte_at() where we need
>     must avoid instrumentation.
>   * Use the logic of *_access_permitted() for implementing
>     *_user_accessible_page(), which are required routines for page table
>     check.
>   * Even though we no longer need p{m,u,4}d_leaf(), still default
>     implement these to assist in refactoring out extant
>     p{m,u,4}_is_leaf().
>   * Add p{m,u}_pte() stubs where asm-generic does not provide them, as
>     page table check wants all *user_accessible_page() variants, and we
>     would like to default implement the variants in terms of
>     pte_user_accessible_page().
>   * Avoid the ugly pmdp_collapse_flush() macro nonsense! Just instrument
>     its constituent calls instead for radix and hash.
> Link: https://lore.kernel.org/linuxppc-dev/20231130025404.37179-2-rmclure@linux.ibm.com/
> 
> v8:
>   * Fix linux/page_table_check.h include in asm/pgtable.h breaking
>     32-bit.
> Link: https://lore.kernel.org/linuxppc-dev/20230215231153.2147454-1-rmclure@linux.ibm.com/
> 
> v7:
>   * Remove use of extern in set_pte prototypes
>   * Clean up pmdp_collapse_flush macro
>   * Replace set_pte_at with static inline function
>   * Fix commit message for patch 7
> Link: https://lore.kernel.org/linuxppc-dev/20230215020155.1969194-1-rmclure@linux.ibm.com/
> 
> v6:
>   * Support huge pages and p{m,u}d accounting.
>   * Remove instrumentation from set_pte from kernel internal pages.
>   * 64s: Implement pmdp_collapse_flush in terms of __pmdp_collapse_flush
>     as access to the mm_struct * is required.
> Link: https://lore.kernel.org/linuxppc-dev/20230214015939.1853438-1-rmclure@linux.ibm.com/
> 
> v5:
> Link: https://lore.kernel.org/linuxppc-dev/20221118002146.25979-1-rmclure@linux.ibm.com/
> 
> Rohan McLure (11):
>    mm/page_table_check: Reinstate address parameter in
>      [__]page_table_check_pud_set()
>    mm/page_table_check: Reinstate address parameter in
>      [__]page_table_check_pmd_set()
>    mm/page_table_check: Provide addr parameter to
>      page_table_check_pte_set()
>    mm/page_table_check: Reinstate address parameter in
>      [__]page_table_check_pud_clear()
>    mm/page_table_check: Reinstate address parameter in
>      [__]page_table_check_pmd_clear()
>    mm/page_table_check: Reinstate address parameter in
>      [__]page_table_check_pte_clear()
>    mm: Provide address parameter to p{te,md,ud}_user_accessible_page()
>    powerpc: mm: Add pud_pfn() stub
>    powerpc: mm: Implement *_user_accessible_page() for ptes
>    powerpc: mm: Use set_pte_at_unchecked() for internal usages
>    powerpc: mm: Support page table check
> 
>   arch/arm64/include/asm/pgtable.h             | 18 +++---
>   arch/powerpc/Kconfig                         |  1 +
>   arch/powerpc/include/asm/book3s/32/pgtable.h | 12 +++-
>   arch/powerpc/include/asm/book3s/64/pgtable.h | 62 +++++++++++++++---
>   arch/powerpc/include/asm/nohash/pgtable.h    | 13 +++-
>   arch/powerpc/include/asm/pgtable.h           | 19 ++++++
>   arch/powerpc/mm/book3s64/hash_pgtable.c      |  4 ++
>   arch/powerpc/mm/book3s64/pgtable.c           | 17 +++--
>   arch/powerpc/mm/book3s64/radix_pgtable.c     |  9 ++-
>   arch/powerpc/mm/pgtable.c                    | 12 ++++
>   arch/riscv/include/asm/pgtable.h             | 18 +++---
>   arch/x86/include/asm/pgtable.h               | 22 +++----
>   include/linux/page_table_check.h             | 67 ++++++++++++--------
>   include/linux/pgtable.h                      | 10 +--
>   mm/page_table_check.c                        | 39 +++++++-----
>   15 files changed, 226 insertions(+), 97 deletions(-)
> 

