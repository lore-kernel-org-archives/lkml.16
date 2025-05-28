Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F8827464A
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748422917; cv=none; b=bMr3XQSqAJ5yqSNGijuo1tnPyPiwmXq1+6/7LXb6yxsR0q9CHzHS21vmPqBtd+HDS+Ruk3QBaODi5ByJmsx3G0m+bSVxJ2VOF+9/4gMDp9vl/UlCKQH5luAaNUDNEzALshpXVZwhqr/FjQ2Lkw/l1K40dwIoPgZEgGLjH0Ip6rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748422917; c=relaxed/simple;
	bh=HP8Ku0atWer+2x+h/ZQXGid5Z3Vov/p8zXSr3bXjB6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jo+L/KrXshwoDAxobinC3E6f2oPZ8Qr/E7R43448/z/wOgrOklO99wZYsSTEVmZ8WXFx42MeRWnQhpMkTfv3ZOaioSLwWQ2H1FtRYtB3jwCfV/1id24szDfoIYlXFjJsBT9S/Doi9ZeEI/e8bdK8LArHtFOGDtN2oQoJSa2hJsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BSSWlsEh; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BSSWlsEh"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c9376c4bddso457609985a.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 02:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748422914; x=1749027714; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAO2Idap4modZx0HiEJ1tVpbkOJVus0Rb2W6b2Sfxvk=;
        b=BSSWlsEhQ7ftiAuGXHQMYdRiF1pIfmZroMvS8XYuefy6WQPSfxVuSgAHFUcGdr1ilK
         wqrRLTTf9Ig62QB9QjNshUzPMT2QHgSKYQ9ubV1JmI7BDfPsiFMne0Gq5NGqLyckshDM
         NH/Szv+Xv5t7qdSVWbdPe1z/V7vAP++Kg1/xfAAoG5GovkTm+lZDMAoYuugchSN2WonA
         PqkjrJTzmgJ4fMcGyTBNB06TGpBv5b4tGdLYj+mSanILoSx2QL3PNgCO6Ek3at+pJJs4
         Z/0k1Zz1f/289zz8KTdQfBRuTjJVETxEbVjwD2gsyEg1I9IaYY/PAepEUhbALxzD/Oyt
         heuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748422914; x=1749027714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YAO2Idap4modZx0HiEJ1tVpbkOJVus0Rb2W6b2Sfxvk=;
        b=R7OMOXTvV7L1DtFZIJBBhAhMGsKLAr2cv96BdKAOCF0OGP/ATRxlgEtHhmEfCu3FOn
         Oi2c1VGYeFYpckbpPA/1oAhuH9gym5z1Wv+QGTOHUEKUyt62sDKu5wHURqmIc4qjDeC0
         pkQZTeSy5hW3FujdUEVTVJyK71frw8SFzcnuWDn6+L44c2e6PxSRSf9u2y3Gl7X6saD1
         U68AyoMy7miUkh/TIO6Hec681NP3I9Y+LBIZ1YbaFel4cc6+asWwb54ktVfzmF2vK53S
         86XmYFCt/Iy2fM2WUeeH+8Qio+I99eOYlHXx1DMkWiBOhONsvPhywM8/sNPQ75jx7oZz
         ycfg==
X-Forwarded-Encrypted: i=1; AJvYcCUarbjUivW1I5mCDTjsUJcGwVSHukSKeyiwUMXjcp1VfrI9OKPH0JNYVJJK5z3g52g7ynyyjwjE6ABh6I0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOrmC41unu07rKq1e8kq9yk18P3J9x0mPnARNlz7685EIrQ+ik
	+n+txnkHso8kpbvyBMy4Iq0JABcJ8qHWEwJ2Ntmd0nht+k/T/ycs47fs7/jmqKn7BV23/Xf+wsH
	ON3hnHY94AcgGBey7G7tvDl0yMM86LO6rbXBI
X-Gm-Gg: ASbGnctcVCVMJ//T+lGKKrSmzlmBXVn1GDXUgigc7R6hxqT8iZH0QnceZuMwiEz+EUQ
	QA3dFBl0EyClpO6EUJb6H81TNQuvkaUJkCeEFgEbWdzO5/F8TNsjuhtyyUSKmZCkfCm38R8Mz3v
	Ovf63rGyaYr++Qnsk2rCFVjrN/yWbjq0vJCA==
X-Google-Smtp-Source: AGHT+IFddMdN8TkEBUClv4I5WFEHFYLjzV6G6ueXzSvoHY+GpT78N8JnSl7g6bM0Y0VifL3kAybwNTXqtaBQwaXDxUg=
X-Received: by 2002:a05:6102:4b0d:b0:4e2:86e6:468a with SMTP id
 ada2fe7eead31-4e4240d0da9mr12093790137.6.1748422903970; Wed, 28 May 2025
 02:01:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527044145.13153-1-21cnbao@gmail.com> <93385672-927f-4de5-a158-fc3fc0424be0@lucifer.local>
 <CA+EESO6_RBX=nvrWO46aR7Q7xibh8fM-BX2p7_ihcbYyMfpVYQ@mail.gmail.com>
In-Reply-To: <CA+EESO6_RBX=nvrWO46aR7Q7xibh8fM-BX2p7_ihcbYyMfpVYQ@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 28 May 2025 17:01:32 +0800
X-Gm-Features: AX0GCFs1VQUR8Htw0bjd4lZQvxMrXGcQOnANQhmXWqLyxp0YD-C73ZtqKV4bL5Y
Message-ID: <CAGsJ_4xHH6hnksBgHgwqDTtHt4Py5sEu9zCFNSsr9J3cKhWU9Q@mail.gmail.com>
Subject: Re: [PATCH RFC] mm: use per_vma lock for MADV_DONTNEED
To: Lokesh Gidra <lokeshgidra@google.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Barry Song <v-songbaohua@oppo.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Tangquan Zheng <zhengtangquan@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 4:40=E2=80=AFAM Lokesh Gidra <lokeshgidra@google.co=
m> wrote:
>
> Thanks a lot, Barry. This was overdue.
>
> On Tue, May 27, 2025 at 2:20=E2=80=AFAM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> >
> > Overall - thanks for this, and I'm not sure why we didn't think of doin=
g
> > this sooner :P this seems like a super valid thing to try to use the vm=
a
> > lock with.
> >
> > I see you've cc'd Suren who has the most expertise in this and can
> > hopefully audit this and ensure all is good, but from the process addre=
ss
> > doc (see below), I think we're good to just have the VMA stabilised for=
 a
> > zap.
> >
> > On Tue, May 27, 2025 at 04:41:45PM +1200, Barry Song wrote:
> > > From: Barry Song <v-songbaohua@oppo.com>
> > >
> > > Certain madvise operations, especially MADV_DONTNEED, occur far more
> > > frequently than other madvise options, particularly in native and Jav=
a
> > > heaps for dynamic memory management.
>
> Actually, it would be great if you can also optimize the MADV_FREE
> case. There are quite a few performance critical situations where
> MADV_FREE is performed and are done within a single VMA.

Yes, that was definitely on the list. However, the reason MADV_FREE wasn't
included in this patch is because madvise_free_single_vma() calls
walk_page_range(), which requires the mmap_lock to locate the VMA using
find_vma()=E2=80=94which feels redundant and awkward, since we already have=
 the VMA.

We should be able to use walk_page_range_vma() instead, given that the VMA
is already known. But even walk_page_range_vma() asserts that the mmap_lock
is held, so the issue remains.

int walk_page_range_vma(struct vm_area_struct *vma, unsigned long start,
unsigned long end, const struct mm_walk_ops *ops,
void *private)
{
...
process_mm_walk_lock(walk.mm, ops->walk_lock);
...
return __walk_page_range(start, end, &walk);
}

MADV_DONTNEED doesn't use walk_page_range() at all. So I'd prefer to
settle MADV_DONTNEED first as the initial step.

We need more time to investigate the behavior and requirements of
walk_page_range().

> >
> > Ack yeah, I have gathered that this is the case previously.
> >
> > >
> > > Currently, the mmap_lock is always held during these operations, even=
 when
> > > unnecessary. This causes lock contention and can lead to severe prior=
ity
> > > inversion, where low-priority threads=E2=80=94such as Android's HeapT=
askDaemon=E2=80=94
> > > hold the lock and block higher-priority threads.
> >
> > That's very nasty... we definitely want to eliminate as much mmap_lock
> > contention as possible.
> >
> > >
> > > This patch enables the use of per-VMA locks when the advised range li=
es
> > > entirely within a single VMA, avoiding the need for full VMA traversa=
l. In
> > > practice, userspace heaps rarely issue MADV_DONTNEED across multiple =
VMAs.
> >
> > Yeah this single VMA requirement is obviously absolutely key.
> >
> > As per my docs [0] actually, for zapping a single VMA, 'The VMA need on=
ly be
> > kept stable for this operation.' (I had to look this up to remind mysel=
f :P)
> >
> > [0]: https://kernel.org/doc/html/latest/mm/process_addrs.html
> >
> > So we actually... should be good here, locking-wise.
> >
> > >
> > > Tangquan=E2=80=99s testing shows that over 99.5% of memory reclaimed =
by Android
> > > benefits from this per-VMA lock optimization. After extended runtime,
> > > 217,735 madvise calls from HeapTaskDaemon used the per-VMA path, whil=
e
> > > only 1,231 fell back to mmap_lock.
>
> I am quite confident that this pattern is not limited to
> HeapTaskDaemon. For instance, I'm sure the Scudo allocator must also
> be calling MADV_DONTNEED within single VMAs.

That's right. We've also optimized the native heaps.

> >
> > Thanks, this sounds really promising!
> >
> > I take it then you have as a result, heavily tested this change?
> >
> > >
> > > To simplify handling, the implementation falls back to the standard
> > > mmap_lock if userfaultfd is enabled on the VMA, avoiding the complexi=
ty of
> > > userfaultfd_remove().
> >
> > Oh GOD do I hate how we implement uffd. Have I ever mentioned that? Wel=
l,
> > let me mention it again...
> >
> > >
> > > Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> > > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > Cc: David Hildenbrand <david@redhat.com>
> > > Cc: Vlastimil Babka <vbabka@suse.cz>
> > > Cc: Jann Horn <jannh@google.com>
> > > Cc: Suren Baghdasaryan <surenb@google.com>
> > > Cc: Lokesh Gidra <lokeshgidra@google.com>
> > > Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> > > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> > > ---
> > >  mm/madvise.c | 34 ++++++++++++++++++++++++++++++++++
> > >  1 file changed, 34 insertions(+)
> > >
> > > diff --git a/mm/madvise.c b/mm/madvise.c
> > > index 8433ac9b27e0..da016a1d0434 100644
> > > --- a/mm/madvise.c
> > > +++ b/mm/madvise.c
> > > @@ -1817,6 +1817,39 @@ int do_madvise(struct mm_struct *mm, unsigned =
long start, size_t len_in, int beh
> > >
> > >       if (madvise_should_skip(start, len_in, behavior, &error))
> > >               return error;
> > > +
> > > +     /*
> > > +      * MADV_DONTNEED is commonly used with userspace heaps and most=
 often
> > > +      * affects a single VMA. In these cases, we can use per-VMA loc=
ks to
> > > +      * reduce contention on the mmap_lock.
> > > +      */
> > > +     if (behavior =3D=3D MADV_DONTNEED || behavior =3D=3D MADV_DONTN=
EED_LOCKED) {
> >
> > So firstly doing this here means process_madvise() doesn't get this ben=
efit, and
> > we're inconsistent between the two which we really want to avoid.
> >
> > But secondly - we definitely need to find a better way to do this :) th=
is
> > basically follows the 'ignore the existing approach and throw in an if
> > (special case) { ... }' pattern that I feel we really need to do all we=
 can
> > to avoid in the kernel.
> >
> > This lies the way of uffd, hugetlb, and thus horrors beyond imagining.
> >
> > I can see why you did this as this is kind of special-cased a bit, and =
we
> > already do this kind of thing all over the place but let's try to avoid
> > this here.
> >
> > So I suggest:
> >
> > - Remove any code for this from do_madvise() and thus make it available=
 to
> >   process_madvise() also.
> >
> > - Try to avoid the special casing here as much as humanly possible :)
> >
> > - Update madvise_lock()/unlock() to get passed a pointer to struct
> >   madvise_behavior to which we can add a boolean or even better I think=
 -
> >   an enum indicating which lock type was taken (this can simplify
> >   madvise_unlock() also).
> >
> > - Update madvise_lock() to do all of the checks below, we already
> >   effectively do a switch (behavior) so it's not so crazy to do this. A=
nd
> >   you can also do the fallthrough logic there.
> >
> > - Obviously madvise_unlock() can be updated to do vma_end_read().
> >
> > > +             struct vm_area_struct *prev, *vma;
> > > +             unsigned long untagged_start, end;
> > > +
> > > +             untagged_start =3D untagged_addr(start);
> > > +             end =3D untagged_start + len_in;
> > > +             vma =3D lock_vma_under_rcu(mm, untagged_start);
> > > +             if (!vma)
> > > +                     goto lock;
> > > +             if (end > vma->vm_end || userfaultfd_armed(vma)) {
> > > +                     vma_end_read(vma);
> > > +                     goto lock;
> > > +             }
> > > +             if (unlikely(!can_modify_vma_madv(vma, behavior))) {
> > > +                     error =3D -EPERM;
> > > +                     vma_end_read(vma);
> > > +                     goto out;
> > > +             }
> > > +             madvise_init_tlb(&madv_behavior, mm);
> > > +             error =3D madvise_dontneed_free(vma, &prev, untagged_st=
art,
> > > +                             end, &madv_behavior);
> > > +             madvise_finish_tlb(&madv_behavior);
> > > +             vma_end_read(vma);
> > > +             goto out;
> > > +     }
> > > +
> > > +lock:
> > >       error =3D madvise_lock(mm, behavior);
> > >       if (error)
> > >               return error;
> > > @@ -1825,6 +1858,7 @@ int do_madvise(struct mm_struct *mm, unsigned l=
ong start, size_t len_in, int beh
> > >       madvise_finish_tlb(&madv_behavior);
> > >       madvise_unlock(mm, behavior);
> > >
> > > +out:
> > >       return error;
> > >  }
> > >
> > > --
> > > 2.39.3 (Apple Git-146)
> > >
> >
> > Cheers, Lorenzo

Thanks
Barry
