Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27821E47A5
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 04:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748580767; cv=none; b=r9V//4EMukxbx4MEVCd8+Vg5z2GavrYSAqTFm7Fx6NTcsipNv53FKr/Cfw8F0bbyFsHWvutZ2Q/wO5Mh+UlrMGQvXkIiXWX1byGSHNyV19aVF/aPMqSsmp3ocPpmb4cTzhcYeMFtgySCp5SJrCUUUKwtMsuxHdz/3MFDVAZCRDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748580767; c=relaxed/simple;
	bh=uZ58h7NhhitrVp6n6KjO0SYskciVHlxu5/lCxSESQ2A=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YAdYD2p9mT7Q+rwM3dqy/AEm+tnk4L0P9V/GoRUUJvusokjlb4I+sG/1OX0Qr8K88cJsLXxA25kL1JrCpcd2OAEGuZFYwl14Ng6IJCCqH1fl3xU+HAoMX7c8bJOTYN2ZKEvgAKarjjLh7xJmxVNe76w9Uf5sXXsUYf3cEdfJx2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gUxwswtv; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gUxwswtv"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-73502b47f24so1006899a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 21:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748580765; x=1749185565; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=H70bHAj8tBT7LUiVVlkKXsAA1R2ro/jkyCMIyaBzqvs=;
        b=gUxwswtvm0GplFkdQ3Pkwb1BUhgYq2iHS21hLZARvKX4DZyOGgkAmw/93wjdO9I9ux
         MHs5kHjOd/6Rd1rr53gU/xTb8g5PvvP+msm9BgbcG5KP8eXJBzPHIrXxT+lwE43py+OS
         VSU4GLcArhoHvQZXhaABXqghgZ9Uy8avOtJ+0m/tAoKWj5eM+FLQ4HyOA6hWLS//hI9D
         QuqhDgGJd84O5V47Q+nuNs+TYKiryFUa1h6LymlhvRmiL/pvIxOQg4N0LAK22ECTGOwf
         bJxE5+riSpoy6LDlGz+fclJHpCj3r/alp5RXX5er7oQhqFp7N3qNJGh/qLBt/p4JSxiT
         8oRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748580765; x=1749185565;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H70bHAj8tBT7LUiVVlkKXsAA1R2ro/jkyCMIyaBzqvs=;
        b=XMqAZdq7UX2lehs7vDatYBa4F84O8wVVdxe3a0MExbtX7uNIoA5Vj186uhE+HviIa/
         Q5xZ44Fs6ZgCqMs6i3/7qAO1CeAOoJ87seFk5zvg6E0oheObmbfq75T968HuY9mpSNYS
         zGpagopBVGfeSnmedqKaMDllSfBGEVn8GE0TWL8yGRxU37c7CYAj07zKA9AcpGaf0Ck8
         w8uXw4FZPEpz8gqnw21NjpqtzYYY5l5xeTy6rFP5txWy3fTeDC/WtjPpis5YpZcTmFI3
         +9SBXQupLqC/psYja+x5NVw5pO5MTOtyPawf9aH54PQuQC3AREUnhvlzatQJZnau/M/A
         hXGg==
X-Forwarded-Encrypted: i=1; AJvYcCUVc4ob7vht5i4CvvUSOI/Eh/6GLYxGhrvFwHoHweDuSQCrak1Tsu7B37bSdb+Vtqri4XWCIizBCWoPR6E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgFWUUknnjhGu3D7BZg2mujdcmmf2Gee2NOY78N1uRjVp05A/J
	2S8Sxjbah/AXdfRfPL2Xqk6RFjmzGmQVEGm/N+fuGk0eWWqy4bMpxsQWRJrTt+Furg==
X-Gm-Gg: ASbGncvUwb5kKReg6l2dXQr0VWOXcPkJgPEBbfbh2sy8XhxbyjpXYky7VzMb5A0/9f9
	O48bE49Y4mbPcj7szfto5AAh1D7GVOXmHqXldUFzoF3Go6O5ep5JYLZ1TwOMxvJd/5sAGI1ADTN
	YoQrKmqgQ9/07QJ7twiifRQ8Zpem1z6OYhxftfxrhG8lgwuRKNowJZ64dbD1StCTxkCNgTcxK+K
	s8uSImBfv9d/pbbE8rHl/t/uIMYs9S1EtNHREIrrRZngi5s3n2A8mUlnSrFs2g9X+upJidY8sXt
	8GfnqtjmOnT6yVBk3YkUjpzef6BhEt5NV3lOpLy87KAAEvEYEGj7IMnBd1UEGwPkk1Q0BTtK/jr
	O+WM4Q9I3w6IadpsdG6BSeZ1FYmCyKtUlAcoIrExTvi2rdw==
X-Google-Smtp-Source: AGHT+IFnj/A2ltdxYXWgvJCcX8wPSmvYsWm2u+S8jbtStwL2IXVXHD6TrFshXdvgB7U2R5ac9HuVhw==
X-Received: by 2002:a05:6830:3783:b0:727:ec1:73ab with SMTP id 46e09a7af769-73670a08670mr1157404a34.19.1748580764703;
        Thu, 29 May 2025 21:52:44 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-735af82d2b8sm494958a34.3.2025.05.29.21.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 21:52:43 -0700 (PDT)
Date: Thu, 29 May 2025 21:52:31 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
cc: Andrew Morton <akpm@linux-foundation.org>, 
    Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
    linux-mm@kvack.org, linux-arch@vger.kernel.org, 
    Jann Horn <jannh@google.com>, Will Deacon <will@kernel.org>, 
    "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
    Nick Piggin <npiggin@gmail.com>, Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH v6] mmu_gather: move tlb flush for VM_PFNMAP/VM_MIXEDMAP
 vmas into free_pgtables()
In-Reply-To: <20250522012838.163876-1-roman.gushchin@linux.dev>
Message-ID: <9fc25829-fb3f-8a13-94d0-786127bf12ce@google.com>
References: <20250522012838.163876-1-roman.gushchin@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 22 May 2025, Roman Gushchin wrote:

> Commit b67fbebd4cf9 ("mmu_gather: Force tlb-flush VM_PFNMAP vmas")
> added a forced tlbflush to tlb_vma_end(), which is required to avoid a
> race between munmap() and unmap_mapping_range(). However it added some
> overhead to other paths where tlb_vma_end() is used, but vmas are not
> removed, e.g. madvise(MADV_DONTNEED).
> 
> Fix this by moving the tlb flush out of tlb_end_vma() into new
> tlb_flush_vmas() called from free_pgtables(), somewhat similar to the
> stable version of the original commit:
> commit 895428ee124a ("mm: Force TLB flush for PFNMAP mappings before
> unlink_file_vma()").
> 
> Note, that if tlb->fullmm is set, no flush is required, as the whole
> mm is about to be destroyed.
> 
> Signed-off-by: Roman Gushchin <roman.gushchin@linux.dev>
> Cc: Jann Horn <jannh@google.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Nick Piggin <npiggin@gmail.com>
> Cc: Hugh Dickins <hughd@google.com>
> Cc: linux-arch@vger.kernel.org
> Cc: linux-mm@kvack.org
> 
> ---
> v6:
>   - tlb->vma_pfn is initialized in __tlb_gather_mmu() and
>   is never cleared (by Jann H)

Acked-by: Hugh Dickins <hughd@google.com>
