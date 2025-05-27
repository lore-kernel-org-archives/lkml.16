Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033532F5E
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 20:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748378420; cv=none; b=hSxUHnsTJmgN2/RM9PiVBpPJUS8aZirYgVLkip6HESCnrMPzTPjTie4Vt+Wk0lO2gT2a6apM6+qXPH0Fdd19iDdod2GLZ0GFfvCHNdPADTGkXHLaJWSilJT2Z17aXUeaDOD+RRjC22eeYKva4H1TKRDgbgGObz5oYBCcuJIYUi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748378420; c=relaxed/simple;
	bh=X9iiZNXtXw5g3CbfG+bUNwF6YH2n4JPbFjaQJQxs/CQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CHBQ5LG5T2hwp5KRL5mmX2tY2UaI4lxEBzKVUnW0VF6v+7HQJlBS4uHlnlOlEQvY3Ku/bjiZ8Ud/tEwHCbhsMn9sqEqgIzJRPyGlmYNfWr0HySxnSswllKQ9KIgLmLjBGrj5ODCVirpyCgwlbOH4pFC/Msyndo7oksQZNZNdSi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RbUOLzTy; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RbUOLzTy"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso851a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748378417; x=1748983217; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91mdXzjYrGvaj7Dh9A9yl2QArCWVP/eA86xKiPghOcI=;
        b=RbUOLzTy4ATV2qSJGLf4VnJRJtuyofI5/DeL1bhxp0Ue4+VM9kTYUDOdTYHDN8etUK
         tBTZNECSDkaBPI4B4c4jfSDtThBABtwOTM0X8CEGeLmXeMs71rpNKrnG7W4IjABcuVny
         55vt5I4B3oefTsb2kIwwfLEPAm5rgT4EqZLGf+lP9Mj3OY3KMAM5Op/ytBqlhNs+yeIk
         bTI1KtzsIl835IHe97pwQ/BdElr09BcLcX0QwzTguyJxo2OgCFmkWYqo7Xxn7bmv9iHB
         bvqtUSD/CvsmiH8Z8uhexyEisdZOsiC1H2jv8rfmVrDyylZTfud6UMIxKdzYXMeLYTC5
         Ngzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748378417; x=1748983217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=91mdXzjYrGvaj7Dh9A9yl2QArCWVP/eA86xKiPghOcI=;
        b=USIwNr215LVOyNZUMNNMkg+cEtsX4oDEcU/bTn+wTBIoCy0Px1xGmWutrw9eeG8UAh
         cr9Qu5jzH0JULJXnunVGBSipj3BbrlE74V4IaanMXxpIQjcGclazr+B0LsXMjcq6MMta
         H7DzcapBNB2ru7odawYVRrTtltFhg2YQT0tY+DJdSRWLina8liTe2CUVDHwpS0KLxMfY
         bTNtmM86YqoNAgSNWivBnNcywusynrqGSUzRjiRsdIUAvlZq2MQgYfWJddATFBVGowx7
         ip8b6mpNx0dNs0iveDxpueFYzwmEBjhPB59z7f1Xk83jriNRCGAVON5PT7oYWWLHg8SY
         a8KA==
X-Forwarded-Encrypted: i=1; AJvYcCVr6sdhkgt4eY1OnTBYGKFHZUZIdA7YUrNIOhx4RZ3SzVqfDbfPk7g89EEzn2bqrAPp6yRfnGJ/RPQA0hI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy6Fnozufp+MfsGfSIKa/H1iv1uDelJjoLDBoKchO1P0/6q7Jm
	jNNyw/7VfDLL3vGLp3wydkUm/QfW55pFvX4TKg2MXD1J3DwYSsRKsDsQRlBuKCB7UzdCg6st6oo
	XV9LwtGsX5tBlYbPlW8Vw4azTzTu7GYIlHYM/NM1B
X-Gm-Gg: ASbGnct6g2DqdTHd6j7pxLKXJYXwlj0Ga/d1fQsbeCPz8wBqR0zZXcjfMm+DZ9n1nOk
	oHv/uyhnyDrLAK/FQ+b8k/cste9tHko9Ix7NLSPAgduyk1i8c9lmvft2z3cuv1BtzWedPE2sKSO
	WVzL953+a6qM9pouRAt+wm7RlaPJy8Hg/mbAnDxJ5tpx0unHVbn6aVN7roo+deAgSQ7tH2q+e8
X-Google-Smtp-Source: AGHT+IEyQdVjEh01ByN1Gy4wyq+UouMQztZNI3UXZcPd8rFwNBK7jeF6QdKgHLHKDSNEfhZEV1rUngjqYE7RKwuOyXI=
X-Received: by 2002:aa7:cfd4:0:b0:600:9008:4a40 with SMTP id
 4fb4d7f45d1cf-60515940cd3mr27335a12.4.1748378417078; Tue, 27 May 2025
 13:40:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527044145.13153-1-21cnbao@gmail.com> <93385672-927f-4de5-a158-fc3fc0424be0@lucifer.local>
In-Reply-To: <93385672-927f-4de5-a158-fc3fc0424be0@lucifer.local>
From: Lokesh Gidra <lokeshgidra@google.com>
Date: Tue, 27 May 2025 13:40:05 -0700
X-Gm-Features: AX0GCFvsqylKcHHDepKynOdNf6b-SwzsoF1wjU3y-l44a5LLCSguH4yWv1a1Tvw
Message-ID: <CA+EESO6_RBX=nvrWO46aR7Q7xibh8fM-BX2p7_ihcbYyMfpVYQ@mail.gmail.com>
Subject: Re: [PATCH RFC] mm: use per_vma lock for MADV_DONTNEED
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Tangquan Zheng <zhengtangquan@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks a lot, Barry. This was overdue.

On Tue, May 27, 2025 at 2:20=E2=80=AFAM Lorenzo Stoakes
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

Actually, it would be great if you can also optimize the MADV_FREE
case. There are quite a few performance critical situations where
MADV_FREE is performed and are done within a single VMA.
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

I am quite confident that this pattern is not limited to
HeapTaskDaemon. For instance, I'm sure the Scudo allocator must also
be calling MADV_DONTNEED within single VMAs.
>
> Thanks, this sounds really promising!
>
> I take it then you have as a result, heavily tested this change?
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
