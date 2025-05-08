Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB274B1E6F
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 01:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746668225; cv=none; b=K75fwxPcHU5AZG2+nxIgo2qkzRKlFgOx/LtZj86l/rMqTXPbWRiyrcdEf6oysIkhjvah6Zx7j5yMmN/93lSCLnCa+Q01NhzCWvAvL+Dc1QEQ3pQuDQ7LEdguYpw7sAzwv51Ti6jI7cfDH0kPh7ylvltcReh2hUMirVjHjFcuijc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746668225; c=relaxed/simple;
	bh=pRYTX2VLsUqyiCzLvT/3wIsdfY9m1XZvdCfmiQ9A7oc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=LJ0S7hx4jryddCR1oc7nzjyeRO6uojRWYdc3baTBapOuH8/ud1EiHVXpCCPB2rrddq2aLXHzKazHenSIcPwgDFOzMfcuQA3eMweJyVnNFwK0mOUulFIu2t+IZ6RopysbUGsB1l1m+bxixIaG/JZP2Hh6K+YEY8PKEVunutTuTLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dnycdlAc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dnycdlAc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 776B6C4CEE2;
	Thu,  8 May 2025 01:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746668225;
	bh=pRYTX2VLsUqyiCzLvT/3wIsdfY9m1XZvdCfmiQ9A7oc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dnycdlAcQBEsRwACIHbVv+OpVbHm9G/xV/5/2F/Mc0n9IBSODnj0B4rG+NP+wp5TT
	 DlAPZzhuYe4sK5vDAY3opv0Ad5ebj/E/Od/2+4xOMXQMx825p1qIxbOuzZs9ElVsrX
	 998bwUASzpodCI6zLanlhPUcjHnFaOPerALKFgME=
Date: Wed, 7 May 2025 18:37:03 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Dev Jain <dev.jain@arm.com>
Cc: Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, david@redhat.com, peterx@redhat.com,
 ryan.roberts@arm.com, mingo@kernel.org, libang.li@antgroup.com,
 maobibo@loongson.cn, zhengqi.arch@bytedance.com, baohua@kernel.org,
 anshuman.khandual@arm.com, willy@infradead.org, ioworker0@gmail.com,
 yang@os.amperecomputing.com, baolin.wang@linux.alibaba.com, ziy@nvidia.com,
 hughd@google.com
Subject: Re: [PATCH v2 2/2] mm: Optimize mremap() by PTE batching
Message-Id: <20250507183703.43d7b53d5e2e263566cfe80a@linux-foundation.org>
In-Reply-To: <20250507060256.78278-3-dev.jain@arm.com>
References: <20250507060256.78278-1-dev.jain@arm.com>
	<20250507060256.78278-3-dev.jain@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  7 May 2025 11:32:56 +0530 Dev Jain <dev.jain@arm.com> wrote:

> To use PTE batching, we want to determine whether the folio mapped by
> the PTE is large, thus requiring the use of vm_normal_folio(). We want
> to avoid the cost of vm_normal_folio() if the code path doesn't already
> require the folio. For arm64, pte_batch_hint() does the job. To generalize
> this hint, add a helper which will determine whether two consecutive PTEs
> point to consecutive PFNs, in which case there is a high probability that
> the underlying folio is large.
> Next, use folio_pte_batch() to optimize move_ptes(). On arm64, if the ptes
> are painted with the contig bit, then ptep_get() will iterate through all 16
> entries to collect a/d bits. Hence this optimization will result in a 16x
> reduction in the number of ptep_get() calls. Next, ptep_get_and_clear()
> will eventually call contpte_try_unfold() on every contig block, thus
> flushing the TLB for the complete large folio range. Instead, use
> get_and_clear_full_ptes() so as to elide TLBIs on each contig block, and only
> do them on the starting and ending contig block.
> 
> ...
>
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -369,6 +369,35 @@ static inline pgd_t pgdp_get(pgd_t *pgdp)
>  }
>  #endif
>  
> +/**
> + * maybe_contiguous_pte_pfns - Hint whether the page mapped by the pte belongs
> + * to a large folio.
> + * @ptep: Pointer to the page table entry.
> + * @pte: The page table entry.
> + *
> + * This helper is invoked when the caller wants to batch over a set of ptes
> + * mapping a large folio, but the concerned code path does not already have
> + * the folio. We want to avoid the cost of vm_normal_folio() only to find that
> + * the underlying folio was small; i.e keep the small folio case as fast as
> + * possible.
> + *
> + * The caller must ensure that ptep + 1 exists.
> + */

Gee, that isn't the prettiest interface we've ever invented.

Is there any prospect that this function will get another caller?  If
not then it's probably better to just open-code all this in the caller
and fill it up with comments.


Anyway, review of this series is scanty.  I'd normally enter
wait-and-see mode, but this:

> the average execution time reduces from 1.9 to
> 1.2 seconds, giving a 37% performance optimization, on Apple M3 (arm64).

prompts me into push-it-along mode.


