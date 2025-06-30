Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83D9722127B;
	Mon, 30 Jun 2025 20:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.107.17.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751315044; cv=none; b=umWj6HbruiFppjiZFvbyOpvXn9xNy23kLbC0CxfEJP+Kn0d2gD0jGZIwcmSJ/ENMx3kObftG5fZTnW04HMVN8BLVwQzx8/06ed3mqr8Hkq2vmhZZ8D6S9055X4EyutzqMnNE7pKfbCSP+eBurrU+lQYFffln7mZHdpVmXz+0unU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751315044; c=relaxed/simple;
	bh=dcOBpGBQ6bkWoNCkqrVUtjxk7acgmlRLeMunt6W3N/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fn8gDfe8D4V/jFdsOx66+bXttr9KBaPBV+tx3MIFFtFoZ9m053YYC6HSn6pLLrTc8qntkwpgPgonR7ydIdSDhxIeUiB+GpF1ea/ogYxAFiAaHvoHrGpywzjspoLSyxrisftjEzEHaKt38m/ETe9Fwq065SpYI2Irk2ceCdR4Mdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=194.107.17.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 44D5A72C8F5;
	Mon, 30 Jun 2025 23:23:54 +0300 (MSK)
Received: from altlinux.org (unknown [193.43.10.9])
	by imap.altlinux.org (Postfix) with ESMTPSA id 2EA7E36D0184;
	Mon, 30 Jun 2025 23:23:54 +0300 (MSK)
Date: Mon, 30 Jun 2025 23:23:54 +0300
From: Vitaly Chikunov <vt@altlinux.org>
To: Jann Horn <jannh@google.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, stable@vger.kernel.org
Subject: Re: [PATCH] x86/mm: Disable hugetlb page table sharing on non-PAE
 32-bit
Message-ID: <dzxh7vq5xca6ymyv4xnf7zpr24@altlinux.org>
References: <20250630-x86-2level-hugetlb-v1-1-077cd53d8255@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
In-Reply-To: <20250630-x86-2level-hugetlb-v1-1-077cd53d8255@google.com>

Jann,

On Mon, Jun 30, 2025 at 09:07:34PM +0200, Jann Horn wrote:
> Only select ARCH_WANT_HUGE_PMD_SHARE if hugetlb page table sharing is
> actually possible; page table sharing requires at least three levels,
> because it involves shared references to PMD tables.
> 
> Having ARCH_WANT_HUGE_PMD_SHARE enabled on non-PAE 32-bit X86 (which
> has 2-level paging) became particularly problematic after commit
> 59d9094df3d7 ("mm: hugetlb: independent PMD page table shared count"),
> since that changes `struct ptdesc` such that the `pt_mm` (for PGDs) and
> the `pt_share_count` (for PMDs) share the same union storage - and with
> 2-level paging, PMDs are PGDs.
> 
> (For comparison, arm64 also gates ARCH_WANT_HUGE_PMD_SHARE on the
> configuration of page tables such that it is never enabled with 2-level
> paging.)
> 
> Reported-by: Vitaly Chikunov <vt@altlinux.org>
> Closes: https://lore.kernel.org/r/srhpjxlqfna67blvma5frmy3aa@altlinux.org
> Fixes: cfe28c5d63d8 ("x86: mm: Remove x86 version of huge_pmd_share.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jann Horn <jannh@google.com>

Tested on i586 over v6.1.142 (where the problem was surfaced).

Tested-by: Vitaly Chikunov <vt@altlinux.org>

Thanks,

> ---
>  arch/x86/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 71019b3b54ea..917f523b994b 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -147,7 +147,7 @@ config X86
>  	select ARCH_WANTS_DYNAMIC_TASK_STRUCT
>  	select ARCH_WANTS_NO_INSTR
>  	select ARCH_WANT_GENERAL_HUGETLB
> -	select ARCH_WANT_HUGE_PMD_SHARE
> +	select ARCH_WANT_HUGE_PMD_SHARE		if PGTABLE_LEVELS > 2
>  	select ARCH_WANT_LD_ORPHAN_WARN
>  	select ARCH_WANT_OPTIMIZE_DAX_VMEMMAP	if X86_64
>  	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP	if X86_64
> 
> ---
> base-commit: d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af
> change-id: 20250630-x86-2level-hugetlb-b1d8feb255ce
> 
> -- 
> Jann Horn <jannh@google.com>
