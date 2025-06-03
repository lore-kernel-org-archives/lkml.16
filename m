Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C7B27F195
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 07:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748937121; cv=none; b=U1/FdUxtt2RaMMRGE7+l2b9RkVH3oHRS3aSB/r9ZEbJXJtN1NmeNyMk/dUBJhpEYM8JRBmM1jnLlGAmDEZ2sVmW4VSeyaaT/kdSgAniJ2KCeAYe9T2julCEj1mk2HIHdbNvoN6GvdkWME663pUi/Fz4st+6Y3wzJgyrC9m/YqUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748937121; c=relaxed/simple;
	bh=1VZTPECcNuKsfjSalFIkkoDUKwqs1I93C11iSA7bCok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jsT1+w8FtkMcFTneGx571FmwBH+fADisM83rAElX3VrMBuVk9UuQEz4BEVEAwWSiT2hYEQX4AviDp+q0d+dvewfy+k5MndSPoVCJBGCYRlkrAN31CZFwqlxnsFFfs65uwNYa/dUyH69VcTxr33VdqqVRQU8FoDhiH6sSznjWW2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FPZMcDrr; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FPZMcDrr"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5307e208234so2921631e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 00:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748937116; x=1749541916; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJ5G99A6DX6XXkgPgca6WYFZcoU8J+uLWkvPstKPeB8=;
        b=FPZMcDrr2c/fl3k9mLtiknjvuuKlMFnAf2i4fSgMFFV8Vzhm8kMMuBU9cifVEDIlVY
         eNwqjqSVXXFQRtbh9510m1ru3J+fqwlPhY/5i+1m+d5BzSAXvDXgKfoed8S5iy/Rb1Ua
         j3Oj2BcgiJbBnQckfhtBxjxk5v0hU+xXdwjwtwERegG+njiuqLZRWC3mbrdBa1pMI7dJ
         8mFbyLGl+vQPenu87W4XCPOtFvH886raPiL8TKe5ZrZQ5pReoz7sPsYRaNwQl7sZxN4Z
         WzLbEUFpcPyGAlLvkZl24D9WEM1En0YansxHBtcSBb2Ya2yZ51/pooH77hq/rsfgjof7
         aLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748937116; x=1749541916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bJ5G99A6DX6XXkgPgca6WYFZcoU8J+uLWkvPstKPeB8=;
        b=nfV12KW0sXQKt5lv5MpeesPeqpBpUviqGJpntKXNOAPrpazArxquMB8cgv2AUdGILK
         uMMBCSzQzK2O3BFrdM73NRIUSRVfA4xIknpV2SnMjQJRYz0jn8NeYmZSsBDWArjznKMr
         hmLxIieGxU0oNmqDLX39e9mooLkM2n/FxBNrDbuSVrwWMGtRiudphGFrfokkQL0rjkau
         fl3GJBBWjoMKKRTmNMdnBAhiRzqHi7vVsIc/34SP74BZIqvym/JYk/w6VUpziFk8uv+4
         MlT7gnudSWGOAhWizJ+zYZbH0TUS/yHx6+8Gchf39sfH5PCme1sU7kGVN4kbroHq3OeO
         cRoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiYal6iOY82FaQiAzgYk4HwL2HwR/Z/HWPviA6eIaEalV6EiV2r3CvO04dYb+4k6YRFVbNbqyz4Z9mEHU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSlvvSo+U44lvlDiymmgxBHg2ZA6eUpXD+N511IXpjjlqd7MrI
	/+rA1IN5MTPtoVWcvgfwta4r7c0J/oF4ZHt5a0fVb4i1lNG2LCtRR8ylssOl5z4f59ZhsSdp9WT
	Y5QUA+Npms70fqogjuq2r/Nt+42xB+cs=
X-Gm-Gg: ASbGnctIFpTqLiD8QfPeDqYCQ7T1FCeMhw64oZzBWi4sBN42IBbza8eYadjrkLLtHjV
	tj3ySCVcm2ZmaVOYeaKEUcTYVLjMLXp9B7dgrNKazOq8JoHo2vaAncV2PPrDaHjYVb/Lrh/r7vQ
	bpl+gnDB5WLT//3CK5iUZYKR1u4yEpX52f0bfgS+3SRgF4
X-Google-Smtp-Source: AGHT+IFI+8PL3m+wRaSraIEh4OjMXLGOtYxdVSBEACCFQTgu8YiYVC4//ksyCFn+uah9r+h5K9GPa0I8qscbTpypuHg=
X-Received: by 2002:a05:6122:17a1:b0:530:65f0:7fd4 with SMTP id
 71dfb90a1353d-53080f57ffamr15240623e0c.2.1748937116257; Tue, 03 Jun 2025
 00:51:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530104439.64841-1-21cnbao@gmail.com> <CAG48ez11zi-1jicHUZtLhyoNPGGVB+ROeAJCUw48bsjk4bbEkA@mail.gmail.com>
 <CAGsJ_4zMcptS5iJGOn+17KSMpM4NcS9F_PW0jMicK6UC7cAbKw@mail.gmail.com> <CAG48ez1ZKEkHHx5muofnc=wTsfCpj__3wMROCR4Wy8-GEF_Ogg@mail.gmail.com>
In-Reply-To: <CAG48ez1ZKEkHHx5muofnc=wTsfCpj__3wMROCR4Wy8-GEF_Ogg@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 3 Jun 2025 19:51:45 +1200
X-Gm-Features: AX0GCFsxD1f5K8klZlqF9swRtjX9af4CaD0TVcTpZ0zoJfEvfeQET56ZXV57oA8
Message-ID: <CAGsJ_4wwyz-21UZL6kONWTTfPUWR+yXK2vL3BwVMydD15cSP+Q@mail.gmail.com>
Subject: Re: [PATCH RFC v2] mm: use per_vma lock for MADV_DONTNEED
To: Jann Horn <jannh@google.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Suren Baghdasaryan <surenb@google.com>, Lokesh Gidra <lokeshgidra@google.com>, 
	Tangquan Zheng <zhengtangquan@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 2:56=E2=80=AFAM Jann Horn <jannh@google.com> wrote:
>
> On Sat, May 31, 2025 at 12:00=E2=80=AFAM Barry Song <21cnbao@gmail.com> w=
rote:
> > On Fri, May 30, 2025 at 10:07=E2=80=AFPM Jann Horn <jannh@google.com> w=
rote:
> > > On Fri, May 30, 2025 at 12:44=E2=80=AFPM Barry Song <21cnbao@gmail.co=
m> wrote:
> > > > @@ -1714,19 +1770,24 @@ static int madvise_do_behavior(struct mm_st=
ruct *mm,
> > > >                 unsigned long start, size_t len_in,
> > > >                 struct madvise_behavior *madv_behavior)
> > > >  {
> > > > +       struct vm_area_struct *vma =3D madv_behavior->vma;
> > > >         int behavior =3D madv_behavior->behavior;
> > > > +
> > > >         struct blk_plug plug;
> > > >         unsigned long end;
> > > >         int error;
> > > >
> > > >         if (is_memory_failure(behavior))
> > > >                 return madvise_inject_error(behavior, start, start =
+ len_in);
> > > > -       start =3D untagged_addr_remote(mm, start);
> > > > +       start =3D untagged_addr(start);
> > >
> > > Why is this okay? I see that X86's untagged_addr_remote() asserts tha=
t
> > > the mmap lock is held, which is no longer the case here with your
> > > patch, but untagged_addr() seems wrong here, since we can be operatin=
g
> > > on another process. I think especially on X86 with 5-level paging and
> > > LAM, there can probably be cases where address bits are used for part
> > > of the virtual address in one task while they need to be masked off i=
n
> > > another task?
> > >
> > > I wonder if you'll have to refactor X86 and Risc-V first to make this
> > > work... ideally by making sure that their address tagging state
> > > updates are atomic and untagged_area_remote() works locklessly.
> >
> > If possible, can we try to avoid this at least for this stage? We all
> > agree that
> > a per-VMA lock for DONTNEED is long overdue. The main goal of the patch
> > is to drop the mmap_lock for high-frequency madvise operations like
> > MADV_DONTNEED and potentially MADV_FREE. For these two cases, it's high=
ly
> > unlikely that one process would be managing the memory of another. In v=
2,
> > we're modifying common code, which is why we ended up here.
> >
> > We could consider doing:
> >
> > if (current->mm =3D=3D mm)
> >        untagged_addr(start);
> > else
> >        untagged_addr_remote(mm, start);
>
> Ah, in other words, basically make it so that for now we don't use VMA
> locking on remote processes, and then we can have two different paths
> here for "local operation" and "MM-locked operation"? That's not very
> pretty but from a correctness perspective I'm fine with that.

Right, that=E2=80=99s exactly what I mean=E2=80=94we may hold off on remote=
 `madvise` for
now unless we can find a straightforward way to fix up the architecture
code, especially since the tagging implementations in x86 and RISC-V are
quite confusing.

It=E2=80=99s particularly tricky for RISC-V, which supports two different P=
MLEN
values simultaneously. Resolving the untagging issue will likely require
extensive discussions with both the x86 and RISC-V architecture teams.

long set_tagged_addr_ctrl(struct task_struct *task, unsigned long arg)
{
        ...
        /*
         * Prefer the smallest PMLEN that satisfies the user's request,
         * in case choosing a larger PMLEN has a performance impact.
         */
        pmlen =3D FIELD_GET(PR_PMLEN_MASK, arg);
        if (pmlen =3D=3D PMLEN_0) {
                pmm =3D ENVCFG_PMM_PMLEN_0;
        } else if (pmlen <=3D PMLEN_7 && have_user_pmlen_7) {
                pmlen =3D PMLEN_7;
                pmm =3D ENVCFG_PMM_PMLEN_7;
        } else if (pmlen <=3D PMLEN_16 && have_user_pmlen_16) {
                pmlen =3D PMLEN_16;
                pmm =3D ENVCFG_PMM_PMLEN_16;
        } else {
                return -EINVAL;
        }
        ...
}

It=E2=80=99s strange that x86=E2=80=99s LAM U48 was rejected, while RISC-V=
=E2=80=99s PMLEN values
of 7 and 16 were both accepted.

Another reason is that we=E2=80=99re not too concerned about remote `madvis=
e`
at this stage, as our current focus is on high-frequency cases like
`MADV_DONTNEED`, and possibly `MADV_FREE`.

Thanks
Barry
