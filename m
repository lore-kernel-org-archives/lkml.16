Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E134B1DA53
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 12:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749214183; cv=none; b=eG9pFqGu8ZPzSvDSfHeEe/rR9vaY1/xiYNQBUTGnin6rShC4ceM/wtOqtbEAiCnIcpQElyRfq7nnPC8mKGp7V++QWusq31KmUiN3MVF68EwFsdvzAKc9ohKb3FunKgnOnx3MKOfxI38h42NeEv2R45nj/Pt9fx5es0jAC4pOO04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749214183; c=relaxed/simple;
	bh=Kl162rCV+ypEM/wfn7pzFhevVmvQmQXR77cvA0nqf9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MPG16bTRVBKmT1roGkolUjgPBa3I+QVrzIOMQXoWBM5m9XEzXfNDfHVEuQSIU4hUU7XBYXaD0U0pYvDpeMC5+ZCMqaQ/j4DZ81sAj/OQx3Hx+/lLa247Wf+yIha3wh93LbCaAL6bLigUvRxB4CS8bMnqayZwBBNT4f3lH5UrOGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xEYH2/qf; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xEYH2/qf"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso8538a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 05:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749214180; x=1749818980; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BT+AT6MqsJ3M+MYT3uZEthRD6VpQnEM0vp9KYd7MzOw=;
        b=xEYH2/qf1sHLXnOM81CDAF563Fwd1m4Nikqw992j5v+bP4mDVuri3cRtaHhTnQhnlO
         A4qUsVfNATAh3cxDfsIjD6KlnSlSEWRo0HcStf+4npQvreyRKUXjKYxsABx6zzWMw6Mz
         oywWwF4Fei1EE5QIdj0NoVqDa8p+g3ngN0C0yw1Gv4+ea1XFgGxmp4J6HwfR+quax+RS
         WHqEX3je4nSVb7+gXFcVMHX6rpszDKLPekJEMk95CxDHcPkJ/pI60b4yiXC73/dfatc/
         cRKELom3GnuDSZdiWka9YNwtisu+ct2YGQl0aTDt5fgsqphzDj9lak0vLQTn1ubBvFdm
         +hCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749214180; x=1749818980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BT+AT6MqsJ3M+MYT3uZEthRD6VpQnEM0vp9KYd7MzOw=;
        b=Epcw45zeT6D6ecCQo6z4aBZhGTsnncqDJ2xmSecMka9hmyeZKP3IlyK7SrGR8ckyNz
         kFQrd4GWAAZtZVaWAwV/N7F7js3jW1jdZ7E35BGt19lGbdILgAXcVfE3wIR5qnJY4mbT
         eYVVt3A33/9h7uRAAT55nrfVAtMRpmjzSbHkSsCJNNBFElYSGzCcaVd6rNZs7hxjBQqO
         2DJjAgAAGPfl+IdU8mxR0EhvkBL4wnpwnllI8WgfsVwbAKmrt2KJ5U+GdIuL9TCsLEB+
         5V3IzHn7HPBI8JG1gb5WArYb0gCXaqRoS9LGXeyHThXAtVfuG+cUO2SPaFGkEM2FfghJ
         g/2A==
X-Forwarded-Encrypted: i=1; AJvYcCXedEEYF5hBc4p8wSUZ5khdia6vBHnx/WE8HAHvlCwuTNO4fqBnhu4XwCbtp7vmZn4p78w4iyn/MEkuvDA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1kwnJAOg6dQBh7fre3UnD2CrU32itCfMO/U4cAtulju7ZOAkB
	jtsGAoMJfXINF089uuuH5YJLbqbxFR8iiDzAM2hg0kFm7k8L2mWNeTid6pevtSEESfVlQQLBtT7
	xvc5TPN5JojH4vhazxQGqsj640u32gWmj/TSSg8HF
X-Gm-Gg: ASbGncv3knsno2IwBjnus1drCL1ColkJjCK+1o1zKxTmfdKlI1ZpX3NBPGtWs0u3Tu6
	pPqKDVmetpy6JreY0Xzv8oOreAHJBIQ7qaphsd3Ozh3uzuvr+r8JGR8UfX6Rk3m67hx3a1htLZQ
	xjobuUEuQj3/V1SjRvAYgRK/sbWFRHtz++x0KjvHXV3AU2IS4vLl/DzwlYm882PQysJR87Zhr61
	70wlsFZ
X-Google-Smtp-Source: AGHT+IEj+Za0UCwvZRT2mQseG+6UqOCA9QEGxUq6fGXHr3bK5GUTUQ0XMmeQy0xVJPsfoDBqZGJWVfK2y2vy3sqMkxY=
X-Received: by 2002:a05:6402:344:b0:606:9166:767 with SMTP id
 4fb4d7f45d1cf-60773eca718mr76167a12.2.1749214179846; Fri, 06 Jun 2025
 05:49:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603-fork-tearing-v1-0-a7f64b7cfc96@google.com> <20250603-fork-tearing-v1-1-a7f64b7cfc96@google.com>
In-Reply-To: <20250603-fork-tearing-v1-1-a7f64b7cfc96@google.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 6 Jun 2025 14:49:03 +0200
X-Gm-Features: AX0GCFt0UyWLtHOJ7Xl9oT_PxdylGZdccUKq5b21dR__hVZmMxZwE8eGyyenLKQ
Message-ID: <CAG48ez0eGkBCNSy1Lp7Fz41uyQym0UMvik9vVVjD1GKGhvGpqQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm/memory: ensure fork child sees coherent memory snapshot
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org
Cc: Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 8:21=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
> @@ -917,7 +917,25 @@ copy_present_page(struct vm_area_struct *dst_vma, st=
ruct vm_area_struct *src_vma
>         /*
>          * We have a prealloc page, all good!  Take it
>          * over and copy the page & arm it.
> +        *
> +        * One nasty aspect is that we could be in a multithreaded proces=
s or
> +        * such, where another thread is in the middle of writing to memo=
ry
> +        * while this thread is forking. As long as we're just marking PT=
Es as
> +        * read-only to make copy-on-write happen *later*, that's easy; w=
e just
> +        * need to do a single TLB flush before dropping the mmap/VMA loc=
ks, and
> +        * that's enough to guarantee that the child gets a coherent snap=
shot of
> +        * memory.
> +        * But here, where we're doing an immediate copy, we must ensure =
that
> +        * threads in the parent process can no longer write into the pag=
e being
> +        * copied until we're done forking.
> +        * This means that we still need to mark the source PTE as read-o=
nly,
> +        * with an immediate TLB flush.
> +        * (To make the source PTE writable again after fork() is done, w=
e can
> +        * rely on the page fault handler to do that lazily, thanks to
> +        * PageAnonExclusive().)
>          */
> +       ptep_set_wrprotect(src_vma->vm_mm, addr, src_pte);
> +       flush_tlb_page(src_vma, addr);

Hmm... this is actually wrong, because we did
arch_enter_lazy_mmu_mode() up in copy_pte_range(). So I guess I
actually have to do:

arch_leave_lazy_mmu_mode();
ptep_set_wrprotect(src_vma->vm_mm, addr, src_pte);
flush_tlb_page(src_vma, addr);
arch_enter_lazy_mmu_mode();

(arch_flush_lazy_mmu_mode() would look a bit nicer, but powerpc
doesn't implement that.)
