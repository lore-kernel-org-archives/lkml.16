Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0791F277819
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748425015; cv=none; b=eisI3jtDEbSsf6EwTB3IApFYzsWyo/zNcVtSOdtK1UgPVuXs0eXjXFQaBc/WfVYDKIvOUW8ju6CRYdzdEXzjnuW0JdAsOEXmm0CbSJDzmDNLI2MII45ytC6hqqnj0fFWSsCMV8OA2ZQiYZIr9+hV4ALjAEwuTqrLxpPKn820fQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748425015; c=relaxed/simple;
	bh=AgYApLVxIa3sGlbNqPoIBAF/ed9Jlp4pZfwvLIU3bNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kxr5gogE45f+xlJgZpQZA0cLaf5lxpySO9zjzl3UF3nYKSXPow66tE/Vh2smqbHm1nm+ZDm1JFgU2fmfNfU3RA9A0qZIHS6aJDi77TdcrpUBaNBoLdUwkV8ZHyZuzKwvFSarRe2egY6ne/LnThxRZqcOK29r/2wDQiMw0QWKHwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fDfAqUJj; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fDfAqUJj"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-87e0ce80ed4so1134429241.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 02:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748425013; x=1749029813; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4H4mltHWA4Hz50a14glpW/QRK0obPDlc6uSYk/4ZI4=;
        b=fDfAqUJjP5KDOxQKGet0Vx4IVVKPmtzzlEnpHeYcbNXXob4R+O9UerAa5a5K7SqaIi
         fa4xrIuds3vyYG9QhdXd1vLSneWgKZRhgVvIMHfPpqfkmYpo3Mk9xEpU/Qy6Ih1a28Br
         NXLch6RtjzyDhlloJbBAq6Ab09kAEaZsl97M4b5pd8BwFNtrlUQz3Ww5x6mWIW1g138P
         AS0EkLLru5H4qkxdJRO8ktAKQ6oXcBWEaWzMIiQjbtNoJ2ZptnJa0RBvNZFtHskmqRHE
         tRkJuGwKVD5QjX+1R0EQPOo+5m/fwahmi/MljqgzrKPI93R+FTMazYvIKZZs/eEwWYED
         vfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748425013; x=1749029813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F4H4mltHWA4Hz50a14glpW/QRK0obPDlc6uSYk/4ZI4=;
        b=uweAhvICt7OdZs19pbZXR97AU4CtImr4kIagPaWct/fSFpGo4X18uVV3zxm07tDR5D
         XGKoTlvlCzdjSoQ6FYCtur69NvcvaOkzJ0q/p/omgBTER/sOeu6qpO8z6Tk2GWGZgIg9
         NuQnQrf1UXJMnxhbf+0j1Qr7rLYY/lm0LLflP0X7FG2L8HA+lLgUk5mXvgh+X8mTOgtZ
         piLbOHXikU8n1dUEZsZVOE58rNrnjJKM6CLH2xrHqeJxgjSkq354IbPuEb0x3lGmQjv/
         jTJKoXbSCAB5i26MWf5vFcEWwSC2d6awnT2+hxqRpIpMr87eqZRg515zAFlmXodpOdX+
         2oFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhGeZoqgDbfCKxD36sfA/jzk/4MpGCnVNNK+bYYCp4+HGKJ+bOlGs4a2dW9cPt25QzK9IwWIg+qu0fYa0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzumtuk/P/1eCwDbsKr5rdUTF79eUheqbqZfaSPB8pvzGlYO5Kk
	QqgSWLYsnsKYp4tHKdWkQuuJ/fL90BtLR267dvl5+ZbzuTmk+q5JuT8hy3f91DRN+iMC/nWh44v
	r/7YnJH7uku+VEwh4ZowehXX47LnFe3c=
X-Gm-Gg: ASbGncuz4AlmjN29gufwxV9sOGg5s1NpVq3VRgdxgzEy5bYospoT6qyySPcoYXMQl8m
	Pyz4fHrv39Q6A9oOEST7rAuMNUBuB56mFUGwz6Ippqyo3LYiVdPLyxwrmM543U0Ii2C8H0NtAbN
	h2pZgzPJOfX7Z5g8y9zkwTohdLJhF6pIFC0A==
X-Google-Smtp-Source: AGHT+IFPS3+nOyu5GsyZnyt+mdeoMYzphKgXldIOhAR0xUYhOH++PX1IaDSOYuVo4ytjgwf46RsusX5qk/oLVlEUV7s=
X-Received: by 2002:a05:6102:161f:b0:4e5:9c06:39d8 with SMTP id
 ada2fe7eead31-4e59c063b13mr1566237137.5.1748425012652; Wed, 28 May 2025
 02:36:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527044145.13153-1-21cnbao@gmail.com> <93385672-927f-4de5-a158-fc3fc0424be0@lucifer.local>
In-Reply-To: <93385672-927f-4de5-a158-fc3fc0424be0@lucifer.local>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 28 May 2025 17:36:40 +0800
X-Gm-Features: AX0GCFuEZj13XFVajxQytEEJ3CxbWz8WhpholMp_an_EqsoYNNGJof5-x-h5N-o
Message-ID: <CAGsJ_4yHQLmUF7ZRMjaV7c1JQ9-Sr3ccWMTOBwAyKUSaB7CPhA@mail.gmail.com>
Subject: Re: [PATCH RFC] mm: use per_vma lock for MADV_DONTNEED
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Lokesh Gidra <lokeshgidra@google.com>, 
	Tangquan Zheng <zhengtangquan@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 5:20=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> Overall - thanks for this, and I'm not sure why we didn't think of doing
> this sooner :P this seems like a super valid thing to try to use the vma
> lock with.
>
> I see you've cc'd Suren who has the most expertise in this and can
> hopefully audit this and ensure all is good, but from the process address
> doc (see below), I think we're good to just have the VMA stabilised for a
> zap.
>
> On Tue, May 27, 2025 at 04:41:45PM +1200, Barry Song wrote:
> > From: Barry Song <v-songbaohua@oppo.com>
> >
> > Certain madvise operations, especially MADV_DONTNEED, occur far more
> > frequently than other madvise options, particularly in native and Java
> > heaps for dynamic memory management.
>
> Ack yeah, I have gathered that this is the case previously.
>
> >
> > Currently, the mmap_lock is always held during these operations, even w=
hen
> > unnecessary. This causes lock contention and can lead to severe priorit=
y
> > inversion, where low-priority threads=E2=80=94such as Android's HeapTas=
kDaemon=E2=80=94
> > hold the lock and block higher-priority threads.
>
> That's very nasty... we definitely want to eliminate as much mmap_lock
> contention as possible.
>
> >
> > This patch enables the use of per-VMA locks when the advised range lies
> > entirely within a single VMA, avoiding the need for full VMA traversal.=
 In
> > practice, userspace heaps rarely issue MADV_DONTNEED across multiple VM=
As.
>
> Yeah this single VMA requirement is obviously absolutely key.
>
> As per my docs [0] actually, for zapping a single VMA, 'The VMA need only=
 be
> kept stable for this operation.' (I had to look this up to remind myself =
:P)
>
> [0]: https://kernel.org/doc/html/latest/mm/process_addrs.html
>
> So we actually... should be good here, locking-wise.
>
> >
> > Tangquan=E2=80=99s testing shows that over 99.5% of memory reclaimed by=
 Android
> > benefits from this per-VMA lock optimization. After extended runtime,
> > 217,735 madvise calls from HeapTaskDaemon used the per-VMA path, while
> > only 1,231 fell back to mmap_lock.
>
> Thanks, this sounds really promising!
>
> I take it then you have as a result, heavily tested this change?

This was extensively tested on an older Android kernel with real devices.
As you know, running the latest mm-unstable on phones is challenging due
to hardware driver constraints. However, I believe the reported percentage
is accurate, since it seems pointless for userspace heaps to free memory
across two or more VMAs. How could it possibly manage a slab-like system
spanning multiple VMAs?

>
> >
> > To simplify handling, the implementation falls back to the standard
> > mmap_lock if userfaultfd is enabled on the VMA, avoiding the complexity=
 of
> > userfaultfd_remove().
>
> Oh GOD do I hate how we implement uffd. Have I ever mentioned that? Well,
> let me mention it again...
>
> >
> > Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Cc: David Hildenbrand <david@redhat.com>
> > Cc: Vlastimil Babka <vbabka@suse.cz>
> > Cc: Jann Horn <jannh@google.com>
> > Cc: Suren Baghdasaryan <surenb@google.com>
> > Cc: Lokesh Gidra <lokeshgidra@google.com>
> > Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> > ---
> >  mm/madvise.c | 34 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> >
> > diff --git a/mm/madvise.c b/mm/madvise.c
> > index 8433ac9b27e0..da016a1d0434 100644
> > --- a/mm/madvise.c
> > +++ b/mm/madvise.c
> > @@ -1817,6 +1817,39 @@ int do_madvise(struct mm_struct *mm, unsigned lo=
ng start, size_t len_in, int beh
> >
> >       if (madvise_should_skip(start, len_in, behavior, &error))
> >               return error;
> > +
> > +     /*
> > +      * MADV_DONTNEED is commonly used with userspace heaps and most o=
ften
> > +      * affects a single VMA. In these cases, we can use per-VMA locks=
 to
> > +      * reduce contention on the mmap_lock.
> > +      */
> > +     if (behavior =3D=3D MADV_DONTNEED || behavior =3D=3D MADV_DONTNEE=
D_LOCKED) {
>
> So firstly doing this here means process_madvise() doesn't get this benef=
it, and
> we're inconsistent between the two which we really want to avoid.
>
> But secondly - we definitely need to find a better way to do this :) this
> basically follows the 'ignore the existing approach and throw in an if
> (special case) { ... }' pattern that I feel we really need to do all we c=
an
> to avoid in the kernel.
>
> This lies the way of uffd, hugetlb, and thus horrors beyond imagining.
>
> I can see why you did this as this is kind of special-cased a bit, and we
> already do this kind of thing all over the place but let's try to avoid
> this here.
>
> So I suggest:
>
> - Remove any code for this from do_madvise() and thus make it available t=
o
>   process_madvise() also.
>
> - Try to avoid the special casing here as much as humanly possible :)
>
> - Update madvise_lock()/unlock() to get passed a pointer to struct
>   madvise_behavior to which we can add a boolean or even better I think -
>   an enum indicating which lock type was taken (this can simplify
>   madvise_unlock() also).
>
> - Update madvise_lock() to do all of the checks below, we already
>   effectively do a switch (behavior) so it's not so crazy to do this. And
>   you can also do the fallthrough logic there.
>
> - Obviously madvise_unlock() can be updated to do vma_end_read().

I=E2=80=99ve definitely considered refactoring madvise_lock, madvise_do_beh=
avior,
and madvise_unlock to encapsulate the details of the per-VMA locking and
mmap_lock handling within those functions:
madvise_lock(mm, behavior);
madvise_do_behavior(mm, start, len_in, behavior);
madvise_unlock(mm, behavior);

However, I=E2=80=99m a bit concerned that this approach might make the code=
 messier
by introducing extra arguments to handle different code paths. For instance=
,
madvise_do_behavior might need an additional parameter to determine whether
VMA traversal via madvise_walk_vmas is necessary.

That said, I=E2=80=99ll give it a try and see if it actually turns out to b=
e as ugly
as I fear.


>
> > +             struct vm_area_struct *prev, *vma;
> > +             unsigned long untagged_start, end;
> > +
> > +             untagged_start =3D untagged_addr(start);
> > +             end =3D untagged_start + len_in;
> > +             vma =3D lock_vma_under_rcu(mm, untagged_start);
> > +             if (!vma)
> > +                     goto lock;
> > +             if (end > vma->vm_end || userfaultfd_armed(vma)) {
> > +                     vma_end_read(vma);
> > +                     goto lock;
> > +             }
> > +             if (unlikely(!can_modify_vma_madv(vma, behavior))) {
> > +                     error =3D -EPERM;
> > +                     vma_end_read(vma);
> > +                     goto out;
> > +             }
> > +             madvise_init_tlb(&madv_behavior, mm);
> > +             error =3D madvise_dontneed_free(vma, &prev, untagged_star=
t,
> > +                             end, &madv_behavior);
> > +             madvise_finish_tlb(&madv_behavior);
> > +             vma_end_read(vma);
> > +             goto out;
> > +     }
> > +
> > +lock:
> >       error =3D madvise_lock(mm, behavior);
> >       if (error)
> >               return error;
> > @@ -1825,6 +1858,7 @@ int do_madvise(struct mm_struct *mm, unsigned lon=
g start, size_t len_in, int beh
> >       madvise_finish_tlb(&madv_behavior);
> >       madvise_unlock(mm, behavior);
> >
> > +out:
> >       return error;
> >  }
> >
> > --
> > 2.39.3 (Apple Git-146)
> >
>
> Cheers, Lorenzo

Thanks
Barry
