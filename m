Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753C016A395
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 10:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744540045; cv=none; b=UYWmkiNfbqBgUNhlmmcAMJoUqoGktb4xY3yJrgJQA0mHHyUxVUzGSAdqbcmBKsERiehAND/33o2IUx/RtftIWvnKUxRiyLF0Yv73sZYz7JNd1i+1UPoQAOKFdH0Kl2j+jXhJb2BVMeSRBpXy98zmgSStb4YQOizc7TjCfJ1DdVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744540045; c=relaxed/simple;
	bh=sPDAKDyO1vG+j68JQ5OFsc1uXXtzOsMoyAfVMADSyv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k7/S+zDx/2ugj7cqi7Mw78jUYLXzP/xRfcYQ3qRcWAuNqfwIr54AxCT4nfiW2eXa+k4xDWUz3PiB64oAe4flm5Yf1IuNONNBprAvMrCmQxMjMCg5o+LKTQlAZemXH05DnFceeq8jm/YFmH+C1OqOAoNRUK9ueJBHvvh9i6PWXEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JOIurfZL; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JOIurfZL"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e5e63162a0so5490606a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 03:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744540042; x=1745144842; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jd4upcUcfzhoKKCd8gyGkHUUEfo7cXF0p4D0ste2Qms=;
        b=JOIurfZLiDJXhf954KhVVkCn/nIEOS/6Oh+ShF9AelWipJtJD7gxRkG370JysvkbS5
         VUEJcU/HJkmwtw7f/XOdQ2cXwzbDCiPTIyg8BuEVtNCPfPYB8Rn5sTlWVi2YZGdMBSi1
         8MPuH0CzQFmgJ+oIgEGZx3p45Kxw5fCSXLjelemRasSg3adbclTghCNATLHJMvOKFRDO
         gmfxnz5N5GWDXQVOrTscZ5efr37V/D1BUxEndugY0yisA5EBwSpjdFoif0RupCi9/s9R
         LjYh37c4TDcAOIrciuTUdMncPWJrHEQm4zeOyQG37b+uDLZI7V0pPabXs6mIb/xdFTBt
         PVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744540042; x=1745144842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jd4upcUcfzhoKKCd8gyGkHUUEfo7cXF0p4D0ste2Qms=;
        b=IShP3kzEnKtq3HLHsEsStTk58oeVMFXPQjbxxkeZwKSTjLLEEFNPIEuJiyl2qHBdYY
         ptu015BR+fQ5IgtbgKdYhOIZVqMooAT9X03GxadVMOh3vHC1WRKqowfJARvOL2hE3lwy
         i9V/b91lh/cdOTOupAucXd27T2DvKcjQZvzvkP/ngXsGo4k+rAWbVhYbftypvhpetXIG
         hvQknfkuRwAf9N/3/F09R13J+kRDeyM9e3/GAmnGB1TTcWatXzMKi4b8MU7Iu4MrZzYZ
         xKGqoA8SJvsTgksFRRZBj2sCBaYfVGxqeuRMWHXCiIBq8XZ19ampPvI+bIhDfVLwT5qH
         UHpA==
X-Forwarded-Encrypted: i=1; AJvYcCXexlti048Z0N2hGEImbZSBS/mWQhI4dqXIedBAtFhakiZnOea8XEubyy1SDVbSsGnc+X8Nl5NHGW/2IPw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/X1pvPvA3v/GHpMVKjf7W7Fhef3VmhdHvo5RNQFk5fvmB+BBQ
	bqDwtTT+1Nmu8rkNnjlvshZczz6apSPj4T9mVTRZ/u4buIjRO4uBclCbiBeZQYVeC4PGb667J3T
	JGcAZswoTO89+MqwigA7AsERyUEQ=
X-Gm-Gg: ASbGnctcSnKpIELfTqKwQSgvAKnwJXWAXypbdiBajZmbxrUDVnmAvWCMMYPO4C6EpTZ
	JjBVAtFjbPTQ11W39F6uFjazTBVZnS4IOE/TjIC4ugsbGBTWU+ywbjHkMCH3tL+3U0LOvXZnKdy
	Lum4XKdu3fprbnHD2d2AYU
X-Google-Smtp-Source: AGHT+IGSmD/1ocEyYCCvWtIRlXeUOYfxspl9WUnwfGHJgbodwFDre8xJpPzYUkY8vAvKrOK7/qTqvkrAeS3MsuoyA18=
X-Received: by 2002:a05:6402:13c1:b0:5e4:b874:3df7 with SMTP id
 4fb4d7f45d1cf-5f37015b8fbmr7595335a12.25.1744540041311; Sun, 13 Apr 2025
 03:27:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <xmzxiwno5q3ordgia55wyqtjqbefxpami5wevwltcto52fehbv@ul44rsesp4kw>
 <CAHk-=wgk+upuXn7-wsDs4psxOJO4wW7G2g-Sxvv0axCibFua1w@mail.gmail.com> <CAGudoHEV-PFSr-xKUx5GkTf4KasJc=aNNzQbkoTnFVLisKti+A@mail.gmail.com>
In-Reply-To: <CAGudoHEV-PFSr-xKUx5GkTf4KasJc=aNNzQbkoTnFVLisKti+A@mail.gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Sun, 13 Apr 2025 12:27:08 +0200
X-Gm-Features: ATxdqUHn4aVJ3uJPcU8AN2QUX1bmEIhS2ScS5hp2skJX5skKqwVwHaEeJPhVRFU
Message-ID: <CAGudoHFvPqE=Sby-ttn1ar8b+abj15X2jX3FvgY3ca_TRqoc-Q@mail.gmail.com>
Subject: Re: [RFC PATCH] x86: prevent gcc from emitting rep movsq/stosq for
 inlined ops
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: mingo@redhat.com, x86@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 6:27=E2=80=AFPM Mateusz Guzik <mjguzik@gmail.com> wr=
ote:
>
> On Wed, Apr 2, 2025 at 6:22=E2=80=AFPM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Wed, 2 Apr 2025 at 06:42, Mateusz Guzik <mjguzik@gmail.com> wrote:
> > >
> > >
> > > +ifdef CONFIG_CC_IS_GCC
> > > +#
> > > +# Inline memcpy and memset handling policy for gcc.
> > > +#
> > > +# For ops of sizes known at compilation time it quickly resorts to i=
ssuing rep
> > > +# movsq and stosq. On most uarchs rep-prefixed ops have a significan=
t startup
> > > +# latency and it is faster to issue regular stores (even if in loops=
) to handle
> > > +# small buffers.
> > > +#
> > > +# This of course comes at an expense in terms of i-cache footprint. =
bloat-o-meter
> > > +# reported 0.23% increase for enabling these.
> > > +#
> > > +# We inline up to 256 bytes, which in the best case issues few movs,=
 in the
> > > +# worst case creates a 4 * 8 store loop.
> > > +#
> > > +# The upper limit was chosen semi-arbitrarily -- uarchs wildly diffe=
r between a
> > > +# threshold past which a rep-prefixed op becomes faster, 256 being t=
he lowest
> > > +# common denominator. Someone(tm) should revisit this from time to t=
ime.
> > > +#
> > > +KBUILD_CFLAGS +=3D -mmemcpy-strategy=3Dunrolled_loop:256:noalign,lib=
call:-1:noalign
> > > +KBUILD_CFLAGS +=3D -mmemset-strategy=3Dunrolled_loop:256:noalign,lib=
call:-1:noalign
> > > +endif
> >
> > Please make this a gcc bug-report instead - I really don't want to
> > have random compiler-specific tuning options in the kernel.
> >
> > Because that whole memcpy-strategy thing is something that gets tuned
> > by a lot of other compiler options (ie -march and different versions).
> >
>
> Ok.

So I reported this upstream:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D119596

And found some other problems in the meantime:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D119703
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D119704

Looks like this particular bit was persisting for quite some time now.

I also confirmed there is a benefit on AMD CPUs.

I added a new bench: page faults of an area 2MB - 4096 (as in just shy
of a huge page). With this I'm seeing 17% increase in throughput.

Profile before shows sync_regs at 11.81%, after it drops down to below 1%(!=
)

That is to say, the 'movsq' and 'stosq' codegen is really harmful and
I think it would be a shame to let it linger given how easy it is to
avoid.

Even if the gcc folk address this soon(tm), users wont be able to
benefit from it for quite some time.

I think it is a fair point that the patch as posted completely ignored
-mtune, but this particular aspect is trivially remedied by gating it
like so:
+ifdef CONFIG_CC_IS_GCC
+ifndef CONFIG_X86_NATIVE_CPU
+       KBUILD_CFLAGS +=3D
-mmemcpy-strategy=3Dunrolled_loop:256:noalign,libcall:-1:noalign
+       KBUILD_CFLAGS +=3D
-mmemset-strategy=3Dunrolled_loop:256:noalign,libcall:-1:noalign
+endif
+endif

Given the above, would you be ok with allowing the patch into the tree
as a temporary measure? It can be gated on compiler version later on
(if gcc folk fix the problem) or straight up removed.

Here is perf top from that page fault test, before:
  22.07%  [kernel]                  [k] asm_exc_page_fault
  12.83%  pf_processes              [.] testcase
  11.81%  [kernel]                  [k] sync_regs
   7.55%  [kernel]                  [k] _raw_spin_lock
   2.32%  [kernel]                  [k] __handle_mm_fault
   2.27%  [kernel]                  [k] mas_walk
   2.15%  [kernel]                  [k]
__raw_callee_save___pv_queued_spin_unlock
   2.02%  [kernel]                  [k] clear_page_erms
   1.98%  [kernel]                  [k] __mod_memcg_lruvec_state
   1.62%  [kernel]                  [k] lru_add
   1.60%  [kernel]                  [k] do_anonymous_page
   1.39%  [kernel]                  [k] folios_put_refs
   1.39%  [kernel]                  [k] unmap_page_range
   1.28%  [kernel]                  [k] do_user_addr_fault
   1.22%  [kernel]                  [k] __lruvec_stat_mod_folio
   1.21%  [kernel]                  [k] get_page_from_freelist
   1.20%  [kernel]                  [k] lock_vma_under_rcu

and after:
  26.06%  [kernel]                  [k] asm_exc_page_fault
  13.18%  pf_processes              [.] testcase
   8.53%  [kernel]                  [k] _raw_spin_lock
   2.19%  [kernel]                  [k] __mod_memcg_lruvec_state
   2.17%  [kernel]                  [k]
__raw_callee_save___pv_queued_spin_unlock
   2.15%  [kernel]                  [k] clear_page_erms
   2.13%  [kernel]                  [k] __handle_mm_fault
   1.94%  [kernel]                  [k] do_anonymous_page
   1.93%  [kernel]                  [k] mas_walk
   1.68%  [kernel]                  [k] lru_add
   1.65%  [kernel]                  [k] __lruvec_stat_mod_folio
   1.53%  [kernel]                  [k] folios_put_refs
   1.53%  [kernel]                  [k] get_page_from_freelist
   1.45%  [kernel]                  [k] unmap_page_range
   1.33%  [kernel]                  [k] do_user_addr_fault
   1.19%  [kernel]                  [k] lock_vma_under_rcu
   1.18%  [kernel]                  [k] error_entry
[..]
   0.91%  [kernel]              [k] sync_regs

bench pluggable into will-it-scale:
#include <unistd.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <assert.h>

#define MEMSIZE ((2 * 1024 * 1024) - 4096)

char *testcase_description =3D "Anonymous memory page fault";

void testcase(unsigned long long *iterations, unsigned long nr)
{
        unsigned long pgsize =3D getpagesize();

        while (1) {
                unsigned long i;

                char *c =3D mmap(NULL, MEMSIZE, PROT_READ|PROT_WRITE,
                               MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);
                assert(c !=3D MAP_FAILED);

                for (i =3D 0; i < MEMSIZE; i +=3D pgsize) {
                        c[i] =3D 0;
                        (*iterations)++;
                }

                munmap(c, MEMSIZE);
        }
}

--=20
Mateusz Guzik <mjguzik gmail.com>
