Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A34D2C327B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 15:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748878033; cv=none; b=by+q0ZmT4LB2wICKG0K5k8s/I1pB3Ewok/A9CConrJ6E1SRYfphxF04Njp0NmxfAXFGf78VQrCtsdE2LnXaPhjoygl7O+0dGqfNcdG48ajk8E4mOknCvFciZ/wPRCfxdg9N+1fyykUCtyUEazQWC9fZUwUCsSZwwPaB/xcR02tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748878033; c=relaxed/simple;
	bh=1rj2sQDyariKlENRwVnpUEuuscsrU93/V7MTbMeQzXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RWOBaZ2JefhONWDKtj2I2aDM4raIxgIoE/GIjsamuYuDw5Vn2/ANI1RY97zeJGSEQO2MYY/Z9eLYMN4zfYVp7V108DLOY+xOpHmTZuUsIKX/cjIZ+mKEUZDSukcBnEO+X2JMtGAs/j8vftY+czQfsdzwVOY2jQ9VyeUQHLCHCU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z1cWWZFu; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z1cWWZFu"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso13897a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 08:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748878030; x=1749482830; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zbjOjEHHvX/w+qCD0FUvqPgmxnmWutifPueg1K990TI=;
        b=Z1cWWZFuKOjh0UKJqdwE2tuNfmpj3uck4DzES5JOhunVYMgXk9hwYKnMW0nm2FBKeM
         E7QecL8HHMNk7j17cwlW4TpIDKD0onLyVTQzGBIKdw+1mv7e/TUK8m1zeOYXV9RiiX8p
         fvp4Wt25gvWlUKHYzTaHJQhQjsgc1YpWfTePdeR8UzK46Wj91YJ2HEnpVy4LfAvGXpVw
         3aJL0LP4U1Y1pw3vr9fH/roxxwf57CmDVN/05d13gsrjKrBRp0vKxO2xNpDtRM38JxRz
         j0DNliVEhWg41cXmZQSQF452Vn8XNMhl9FhPhuOl+EGMRTqTwcbC3oBMxIUazLDi7SIy
         WTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748878030; x=1749482830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zbjOjEHHvX/w+qCD0FUvqPgmxnmWutifPueg1K990TI=;
        b=KnUpMTL1fNjFR4ROUjH8+l4rFuoaQd2N8PwF4n42SYZ7AvCBWhcsBiCco9AkKEqlsg
         bLWUexUKYD3njD1wdn0ZGPlVghMxLbFlMeBvJfGZalIig8zi5Yn92PKV1Ow80+2sMM57
         KWxTKKgLDmkAkLk3ifxxMwuc/rjMHiF9opBkgQkPL+gKvr0S/Ol4JzfIo1gdPDcjrOYq
         UcfNOA7XlDXoKUDtC68JJolKqF4W4DYfLN2Qm9kzslFdhmQMKUAC1LVrGZ1ZrLxdjOga
         +YrkMReFIsA4lpMCknYdz8rU9yKjQ2Wz0g7D0+cik3RfdQX+S/RakSDoQ/1di4ahWUdq
         29MQ==
X-Forwarded-Encrypted: i=1; AJvYcCX40/E3DTI0ZDVdDQaOY21Vkekd7XgvnawGx7JnuBZWfG4z3VQLjBa6XwfYfhcQg+aU8B3OB/Gn1GNjLbw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsn7evV9j0WojeH4nTDulFyuSRsQNx8lgk+blFw1WoE0CbPg7k
	S4OQtML7BEYlgGMAkV1g6vV268K2kZGy4ZIyzvXyZAqejmyncKoY1coCGoTFFH/doyvlGYjStyE
	mqc1uQwrKZ4yDfr0mg3dcHwCTeh4IqKacwJhkHnex
X-Gm-Gg: ASbGncsrm3PrrCHW2t+WKcrxwOgJRyWxwjgaTAKQQvWgOUF8AqPwqjUH4nVR+2qO9nS
	Zn9VWpomihjGIO704UbejvBKZBJvU4lHvpZV/rQ5WrEmParAWNcR12zTseNTyzrApYte05pb8Qm
	FEiBW7bzOljYoo3hApduhdfWE+lVyzU3VIWI5cehr4hGACrwJ3k/mF7fO/AAoNmy2hjRLQnrCb4
	+53NlJxoTE=
X-Google-Smtp-Source: AGHT+IF3SAgzgTfIOEAJCNnqf61hto0sKFw3fKSTwkwoYpTJCVLFGMjBKRqPHWQ1Mav84AP7exchd1mgkGE4qK2qElY=
X-Received: by 2002:aa7:d58f:0:b0:606:9166:767 with SMTP id
 4fb4d7f45d1cf-60691660795mr32275a12.2.1748878029454; Mon, 02 Jun 2025
 08:27:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404021902.48863-1-anthony.yznaga@oracle.com>
 <20250404021902.48863-13-anthony.yznaga@oracle.com> <CAG48ez0gzjbumcECmE39dxsF9TTtR0ED3L7WdKdW4RupZDRyWA@mail.gmail.com>
 <7fb16136-947b-4a72-8134-60d95ba38c1a@oracle.com>
In-Reply-To: <7fb16136-947b-4a72-8134-60d95ba38c1a@oracle.com>
From: Jann Horn <jannh@google.com>
Date: Mon, 2 Jun 2025 17:26:32 +0200
X-Gm-Features: AX0GCFv5I7J5q1_pTQ4ODWbpUYmffUV-gnSyvK2emUPO7QHiqsiByiseHqXWo8Q
Message-ID: <CAG48ez0i527ibBCvZ_TF_PVt4OxfVTpS=_TYUKrk0cRQ10Bpxg@mail.gmail.com>
Subject: Re: [PATCH v2 12/20] mm/mshare: prepare for page table sharing support
To: Anthony Yznaga <anthony.yznaga@oracle.com>
Cc: akpm@linux-foundation.org, willy@infradead.org, markhemm@googlemail.com, 
	viro@zeniv.linux.org.uk, david@redhat.com, khalid@kernel.org, 
	andreyknvl@gmail.com, dave.hansen@intel.com, luto@kernel.org, 
	brauner@kernel.org, arnd@arndb.de, ebiederm@xmission.com, 
	catalin.marinas@arm.com, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, mhiramat@kernel.org, 
	rostedt@goodmis.org, vasily.averin@linux.dev, xhao@linux.alibaba.com, 
	pcc@google.com, neilb@suse.de, maz@kernel.org, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Liam Howlett <liam.howlett@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 6:42=E2=80=AFPM Anthony Yznaga
<anthony.yznaga@oracle.com> wrote:
> On 5/30/25 7:56 AM, Jann Horn wrote:
> > On Fri, Apr 4, 2025 at 4:18=E2=80=AFAM Anthony Yznaga <anthony.yznaga@o=
racle.com> wrote:
> >> In preparation for enabling the handling of page faults in an mshare
> >> region provide a way to link an mshare shared page table to a process
> >> page table and otherwise find the actual vma in order to handle a page
> >> fault. Modify the unmap path to ensure that page tables in mshare regi=
ons
> >> are unlinked and kept intact when a process exits or an mshare region
> >> is explicitly unmapped.
> >>
> >> Signed-off-by: Khalid Aziz <khalid@kernel.org>
> >> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> >> Signed-off-by: Anthony Yznaga <anthony.yznaga@oracle.com>
> > [...]
> >> diff --git a/mm/memory.c b/mm/memory.c
> >> index db558fe43088..68422b606819 100644
> >> --- a/mm/memory.c
> >> +++ b/mm/memory.c
> > [...]
> >> @@ -259,7 +260,10 @@ static inline void free_p4d_range(struct mmu_gath=
er *tlb, pgd_t *pgd,
> >>                  next =3D p4d_addr_end(addr, end);
> >>                  if (p4d_none_or_clear_bad(p4d))
> >>                          continue;
> >> -               free_pud_range(tlb, p4d, addr, next, floor, ceiling);
> >> +               if (unlikely(shared_pud))
> >> +                       p4d_clear(p4d);
> >> +               else
> >> +                       free_pud_range(tlb, p4d, addr, next, floor, ce=
iling);
> >>          } while (p4d++, addr =3D next, addr !=3D end);
> >>
> >>          start &=3D PGDIR_MASK;
> > [...]
> >> +static void mshare_vm_op_unmap_page_range(struct mmu_gather *tlb,
> >> +                               struct vm_area_struct *vma,
> >> +                               unsigned long addr, unsigned long end,
> >> +                               struct zap_details *details)
> >> +{
> >> +       /*
> >> +        * The msharefs vma is being unmapped. Do not unmap pages in t=
he
> >> +        * mshare region itself.
> >> +        */
> >> +}
> >
> > Unmapping a VMA has three major phases:
> >
> > 1. unlinking the VMA from the VMA tree
> > 2. removing the VMA contents
> > 3. removing unneeded page tables
> >
> > The MM subsystem broadly assumes that after phase 2, no stuff is
> > mapped in the region anymore and therefore changes to the backing file
> > don't need to TLB-flush this VMA anymore, and unlinks the mapping from
> > rmaps and such. If munmap() of an mshare region only removes the
> > mapping of shared page tables in step 3, as implemented here, that
> > means things like TLB flushes won't be able to discover all
> > currently-existing mshare mappings of a host MM through rmap walks.
> >
> > I think it would make more sense to remove the links to shared page
> > tables in step 2 (meaning in mshare_vm_op_unmap_page_range), just like
> > hugetlb does, and not modify free_pgtables().
>
> That makes sense. I'll make this change.

Related: I think there needs to be a strategy for preventing walking
of mshare host page tables through an mshare VMA by codepaths relying
on MM/VMA locks, because those locks won't have an effect on the
underlying host MM. For example, I think the only reason fork() is
safe with your proposal is that copy_page_range() skips shared VMAs,
and I think non-fast get_user_pages() could maybe hit use-after-free
of page tables or such?

I guess the only clean strategy for that is to ensure that all
locking-based page table walking code does a check for "is this an
mshare VMA?" and, if yes, either bails immediately or takes extra
locks on the host MM (which could get messy).
