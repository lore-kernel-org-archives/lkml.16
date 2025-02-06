Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 699A01F91C7;
	Thu,  6 Feb 2025 05:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738818250; cv=none; b=a4xCVZch7N9l+2rnTInnC3tSdqZzyemzuXbheqAP5RGMYmMAN58FaH9UwV1kzPL9qHweWaQXhaGCa9OygSWualesiLyHuoUHCKzxYTc1v207s5KYVoETNwJVlxrBwNklSa9ku3H1HgN4ak0baVB9wvVnX6UD0DyTS6T94V/AbPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738818250; c=relaxed/simple;
	bh=6xzbrppa6un+Hr484YuSU1+C6Rt7jgi8gZJnBEATVnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TJsbtwBTGhT3K6F7Ets4ngKkNnVXjGw5JknqGx/ayVOv3ZWV63wbyj0CIMEudWw8fvmOgQIzhu8or1c8vng9KZS3QvDDxLP41UzK1cliog0WS/o+djQFtRzk/yZuyNFkCGXqdGTxPYCyoNR3Qw72Uo2IdlOICc99reFkmhSAHOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D88401063;
	Wed,  5 Feb 2025 21:04:24 -0800 (PST)
Received: from [10.163.34.115] (unknown [10.163.34.115])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F04D3F63F;
	Wed,  5 Feb 2025 21:03:47 -0800 (PST)
Message-ID: <d8ef8240-e202-464c-ad16-1a34953cc872@arm.com>
Date: Thu, 6 Feb 2025 10:33:34 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/16] mm: hugetlb: Add huge page size param to
 huge_ptep_get_and_clear()
To: Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Muchun Song <muchun.song@linux.dev>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Dev Jain <dev.jain@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Steve Capper <steve.capper@linaro.org>, Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, stable@vger.kernel.org
References: <20250205151003.88959-1-ryan.roberts@arm.com>
 <20250205151003.88959-2-ryan.roberts@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250205151003.88959-2-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/5/25 20:39, Ryan Roberts wrote:
> In order to fix a bug, arm64 needs to be told the size of the huge page
> for which the huge_pte is being set in huge_ptep_get_and_clear().
> Provide for this by adding an `unsigned long sz` parameter to the
> function. This follows the same pattern as huge_pte_clear() and
> set_huge_pte_at().
> 
> This commit makes the required interface modifications to the core mm as
> well as all arches that implement this function (arm64, loongarch, mips,
> parisc, powerpc, riscv, s390, sparc). The actual arm64 bug will be fixed
> in a separate commit.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 66b3923a1a0f ("arm64: hugetlb: add support for PTE contiguous bit")
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/include/asm/hugetlb.h     |  4 ++--
>  arch/arm64/mm/hugetlbpage.c          |  8 +++++---
>  arch/loongarch/include/asm/hugetlb.h |  6 ++++--
>  arch/mips/include/asm/hugetlb.h      |  6 ++++--
>  arch/parisc/include/asm/hugetlb.h    |  2 +-
>  arch/parisc/mm/hugetlbpage.c         |  2 +-
>  arch/powerpc/include/asm/hugetlb.h   |  6 ++++--
>  arch/riscv/include/asm/hugetlb.h     |  3 ++-
>  arch/riscv/mm/hugetlbpage.c          |  2 +-
>  arch/s390/include/asm/hugetlb.h      | 12 ++++++++----
>  arch/s390/mm/hugetlbpage.c           | 10 ++++++++--
>  arch/sparc/include/asm/hugetlb.h     |  2 +-
>  arch/sparc/mm/hugetlbpage.c          |  2 +-
>  include/asm-generic/hugetlb.h        |  2 +-
>  include/linux/hugetlb.h              |  4 +++-
>  mm/hugetlb.c                         |  4 ++--
>  16 files changed, 48 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
> index c6dff3e69539..03db9cb21ace 100644
> --- a/arch/arm64/include/asm/hugetlb.h
> +++ b/arch/arm64/include/asm/hugetlb.h
> @@ -42,8 +42,8 @@ extern int huge_ptep_set_access_flags(struct vm_area_struct *vma,
>  				      unsigned long addr, pte_t *ptep,
>  				      pte_t pte, int dirty);
>  #define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
> -extern pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
> -				     unsigned long addr, pte_t *ptep);
> +extern pte_t huge_ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
> +				     pte_t *ptep, unsigned long sz);

If VMA could be passed instead of MM, the size of the huge page can
be derived via huge_page_size(hstate_vma(vma)) and another argument
here need not be added. Also MM can be derived from VMA if required.
