Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7E328852F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 12:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749213492; cv=none; b=aLjgUHkvEHefVRURaNZ+XzN5uNaEwbFxgCX0m7hyIA0Rja5wdGLqknTCTVxWzJcpjXFNLP6kAE9quSfyhinJPxEMauG0y2tLWCyX9vL+0gaZ3VWM60wYELnCV3GitX4mwpFELPs8zb36/kPxiUAsCxRgy5jphGBaNu4OsbcJGT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749213492; c=relaxed/simple;
	bh=76ceGAtoe6msQi7Co3W0+hpA8OF7n2ceHM3GHX4Q6is=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=snwA0ga1t/uJgAWjgbfQrlKUgGdHhRWc1ubRDsT3VyAob1gu7ky/IdRcn9l39Te+lAntV8eVg6QQ7v6Ppfe5jQzlXG2C7Y19cUNkBqBGTTfFR+jR/b4PZzF6awNYsxZZLv+uEUI8NqjzEOzNC/6BgWMUvPg6MYTVBX8njtdJrCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wUhpu31R; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wUhpu31R"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6024087086dso9852a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 05:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749213489; x=1749818289; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FeOQnwFRu1+Kj/2MlWTCn9hMSyDZ7M1MsWilhgviDz8=;
        b=wUhpu31RUtz1dPzebSVTy51HPG9j7LqL71+XHHkMy+yHxg/W8zYQgKB6yofETPDUim
         HuQvAWWv6SqdXC/YFAetMG//HLMC5YuusLQ8iDEEKZ/Ysj2n7PQ6JvhNeLA9NHAz4QR1
         UOt5Wm8sIuqP11m846Gbrga9ocy1cPZQhQqFAryMNqE9wcgA7XaUs53yuUU5mYXZM7Ze
         WQy1qRiQ7VuCss563lp8CIuKjFLNIUjjkSBh2mDD4xnejoaffMU3rhRuMwvBeN2lPd4t
         M7JP25cBO+eK5suTBSs+s0lkNVjNvxKUw8e8ooSk//ATpCaEni2RQIZ1TE4xMr3HrZWL
         LJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749213489; x=1749818289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FeOQnwFRu1+Kj/2MlWTCn9hMSyDZ7M1MsWilhgviDz8=;
        b=v07qyMLXvSClUcMePEkQnw90rKSgcb2qB4/IWQx5vrf3dVkfL47hMUgohFoqpj0RED
         dmEpJl00jLYN5eb8sa1db5WiF/CAfNqy3kGN5eJqt7Q0hkm3nsZcIlmLWlKCsShkADe4
         E6pW26PKaMr1r/YOpzvkI19kgMsFb5lVggSPx5zCWp9W5BQTMQGUekd8VI4MKDNScvwN
         GAfl5tAPYpylgeUobNH2IABxYNCs8MBI2iVW+SqXplifbpoXBZxoN6LY04m0fXJ5tWCy
         L4fCuHymx66iDBpWcbj9Hc8UC50+y81ykjOtM7V2dosStivGMoTJtKnLC3Zu8RJDS98I
         hxTA==
X-Forwarded-Encrypted: i=1; AJvYcCWfSIspsobVE00amSxY4ZV+PZclcUUbW2OJKmmHL+JCcig28xbSPtp/hz9GDMqiS5yaiYK3QrYlMubroZ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLM7N1sDRnRIXt9Z40McJUob8uRZdKU+a0wG+4Ka0F5f3fcLcZ
	zoueHF6FA1kDh2/3cqz7rIvkRABb8HcQGi4l0/iBn14x8K4qLycDasOQYuKWpMJFD62YOc0M3yw
	sB/toDb4nMENsl8HOwjo0RQfuGCgwwH2BRvJxrbVD
X-Gm-Gg: ASbGncs/XA5IA1PYsbj7UnB6sB17VHi5OQwqPd42pEya0LIhiq1RM5awQ6n0nY3QbtS
	AIV2J5QRSZtZHBiOza44uwTYEEqO0Uvwzbc1k5CuA3tQekZlfn2T5PC+Vw+/i5eI7FKIKSWlaz7
	K/A2+s5gdZVxo/lBR/52uruounMoaL/t4cGdUcFx/mOJU95+p2MNcE6OA/nuzOvIK4RNLN6A==
X-Google-Smtp-Source: AGHT+IE+fznf396DEdYbm7FDbiMqK8DD7+M7vFeKn4D5k96LIDFgmHNB35OHueWQZma6dil8qwRaIjQmLGcvzLI2aTE=
X-Received: by 2002:a05:6402:3887:b0:600:9008:4a40 with SMTP id
 4fb4d7f45d1cf-6077498ed18mr90476a12.4.1749213488536; Fri, 06 Jun 2025
 05:38:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606092809.4194056-1-ryan.roberts@arm.com>
In-Reply-To: <20250606092809.4194056-1-ryan.roberts@arm.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 6 Jun 2025 14:37:32 +0200
X-Gm-Features: AX0GCFvlWBvUofLsMql7uPnqlPQ_I7AwEatSw2rWNXAV8LpXKA2kOKqETQmhfQc
Message-ID: <CAG48ez1VHfcTJNDLZcoupQBJQ5xpKzEMss8oBhmGYgHFidRU_A@mail.gmail.com>
Subject: Re: [PATCH v1] mm: Close theoretical race where stale TLB entries
 could linger
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mel Gorman <mgorman@suse.de>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 11:28=E2=80=AFAM Ryan Roberts <ryan.roberts@arm.com>=
 wrote:
> Commit 3ea277194daa ("mm, mprotect: flush TLB if potentially racing with
> a parallel reclaim leaving stale TLB entries") described a theoretical
> race as such:
>
> """
> Nadav Amit identified a theoritical race between page reclaim and
> mprotect due to TLB flushes being batched outside of the PTL being held.
>
> He described the race as follows:
>
>         CPU0                            CPU1
>         ----                            ----
>                                         user accesses memory using RW PTE
>                                         [PTE now cached in TLB]
>         try_to_unmap_one()
>         =3D=3D> ptep_get_and_clear()
>         =3D=3D> set_tlb_ubc_flush_pending()
>                                         mprotect(addr, PROT_READ)
>                                         =3D=3D> change_pte_range()
>                                         =3D=3D> [ PTE non-present - no fl=
ush ]
>
>                                         user writes using cached RW PTE
>         ...
>
>         try_to_unmap_flush()
>
> The same type of race exists for reads when protecting for PROT_NONE and
> also exists for operations that can leave an old TLB entry behind such
> as munmap, mremap and madvise.
> """
>
> The solution was to introduce flush_tlb_batched_pending() and call it
> under the PTL from mprotect/madvise/munmap/mremap to complete any
> pending tlb flushes.
>
> However, while madvise_free_pte_range() and
> madvise_cold_or_pageout_pte_range() were both retro-fitted to call
> flush_tlb_batched_pending() immediately after initially acquiring the
> PTL, they both temporarily release the PTL to split a large folio if
> they stumble upon one. In this case, where re-acquiring the PTL
> flush_tlb_batched_pending() must be called again, but it previously was
> not. Let's fix that.
>
> There are 2 Fixes: tags here: the first is the commit that fixed
> madvise_free_pte_range(). The second is the commit that added
> madvise_cold_or_pageout_pte_range(), which looks like it copy/pasted the
> faulty pattern from madvise_free_pte_range().
>
> This is a theoretical bug discovered during code review.

Yeah, good point. So we could race like this:

CPU 0                         CPU 1
madvise_free_pte_range
  pte_offset_map_lock
  flush_tlb_batched_pending
  pte_unmap_unlock
                              try_to_unmap_one
                                get_and_clear_full_ptes
                                set_tlb_ubc_flush_pending
  pte_offset_map_lock
[old PTE still cached in TLB]

which is not a security problem for the kernel (a TLB flush will
happen before the page is actually freed) but affects userspace
correctness.

(Maybe we could at some point refactor this into tlb_finish_mmu(), and
give tlb_finish_mmu() a boolean parameter for "did we maybe try to
unmap/protect some range of memory"; just like how tlb_finish_mmu()
already does the safety flush against concurrent mmu_gather
operations. Maybe that would make it harder to mess this up?)

> Cc: stable@vger.kernel.org
> Fixes: 3ea277194daa ("mm, mprotect: flush TLB if potentially racing with =
a parallel reclaim leaving stale TLB entries")
> Fixes: 9c276cc65a58 ("mm: introduce MADV_COLD")
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

Reviewed-by: Jann Horn <jannh@google.com>
