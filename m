Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B772B264F8C
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 22:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746138609; cv=none; b=N97UuICHhPhv7R+Vht72/8Kw2Ve+ATQwboC2WqsonUcYolmO5wtiEipaANb6WQpBCHVkseMUAeKlqIA9k/0vX7WNCyuAM4w9YEffI8Nu9giR+5RjG72AvtPcK00TYS6adFjWRd2YVn5CUY3ulILJtc2qFeU8HOfVlTGHDkAtIqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746138609; c=relaxed/simple;
	bh=mTOvX9Q8JMcVRX4Zr+LHrs8bBzz3kb3bT+B3d5w97Gs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=appCggCMGs9wQUtIyv7OcgdTTwf6tF6JRDa488Fsy8w0kFmIKx2Yk4ghHatyBRinhCi5SoIdTSC/5CLkAIdIm2xH/sX+JYaz/EiF+ohn10sGl6jvuBGz8AqUPuOnW78kCWKteAcXLd3SxCFeB3JH/nA3fTRz16cL2RybXcS4wwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HKjOqQMg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HKjOqQMg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746138606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xSA7qrEENLsT9vO+347Cgs8GdRO1/pgbFqo1xZrRAbM=;
	b=HKjOqQMgrZNCKPhNIMY18FTQSlJWBJB4P2f8ad1kpy8KUBcMPds4QrmrAbcEHrQ7DwClJ5
	pg7wiM5dp1UdPv51wFaTT+qQZ/5LiEbdcMttKEbx8WtT6lJuCHvEZy+FHFUtwqLeZm+r3l
	XVVdgohcg5J6SJVd89Qf3d75I22ok7M=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-HltlE-KzMymblnn0tASKog-1; Thu, 01 May 2025 18:30:05 -0400
X-MC-Unique: HltlE-KzMymblnn0tASKog-1
X-Mimecast-MFC-AGG-ID: HltlE-KzMymblnn0tASKog_1746138605
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-706b9f19d8bso17875977b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 15:30:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746138605; x=1746743405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xSA7qrEENLsT9vO+347Cgs8GdRO1/pgbFqo1xZrRAbM=;
        b=wOkYfD9lkG2xROP1te4w79lv37eg8+BJNkcBILD6TA3/SP2UJ7OFouLZ1lKxqU96iv
         a80VapmhC/c6PL+4tmlNUePwuyGGxJPrGobPer1jGxB+EazC47RVtEMBx/3HGl33/JWJ
         VE5K/CLHvC47tPeqvrvMv9LLQEKWbkTFpzM/9UGVcXzcPVLevUtXp1R0lSPU6P4lPrZ0
         pXjTksCga48rFJ88A0KPsQ5w0akjVQhIJE51GqftU/wl+Nd7k9mr9ZpA7+2OjyGsXlt/
         xgIPe6GQAznp53AnBMXq7zsd/jQ6g02uqqxBv+inMcxXfjYW2CN71eXb6KbXxSJs97Rs
         7Kxg==
X-Forwarded-Encrypted: i=1; AJvYcCXcju71GX2j7/9Ev5UhFZGl2exDwG5J5V3IKPzvMMpmG1Xw4KShs/gLxPT/kMiIqYsTRDMMhZ5RhU4Skwo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBEUorb1Z1Yr5fpk8MIIJywgaHqIDLLTgNOU3AURQOKskA4ehI
	CM37bn7FK8gdkzVgVJRlLOtLdJ2xjZTLYCVDqVdKkN1uGJMeMC1iCiqli1brZZf7DVv5q71ofSy
	0CoOejyG1ADvF7yeBj1EIzM7+JPRTztGhTsdS5t67Tid6Wl+wOy1jJUG5zy3LG3jTKA/Dz8zrZS
	XHKLFNxU7vp+gpgSkmNZghuxq+GH/6JlTtAk5t
X-Gm-Gg: ASbGncv6FX75RmWb5w/Lf0BwiUOx0Q8evbZJut0e240eobLYqlvC2SPKIplPl6yL/qS
	iOuzB7z9JjEmCTP8f3V4Sdn52bfHOESD173pbOpDVEmAbKh76LOmpGCqkOs08BdVlIXI7o10YpA
	vrjhXrACw=
X-Received: by 2002:a05:690c:9993:b0:708:39f9:ae22 with SMTP id 00721157ae682-708cf22111fmr14887507b3.27.1746138604899;
        Thu, 01 May 2025 15:30:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnhQhsdK/pUl5Ep5trnkbOHq20FLtQLGswtcLzNbSGWgsVqB6zCIXd1Y2WGiMg/2+ingdL2FSVSDCMuR/Ikcw=
X-Received: by 2002:a05:690c:9993:b0:708:39f9:ae22 with SMTP id
 00721157ae682-708cf22111fmr14887027b3.27.1746138604409; Thu, 01 May 2025
 15:30:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428181218.85925-1-npache@redhat.com> <20250428181218.85925-8-npache@redhat.com>
 <CAG48ez2oge4xs1pSz_T9L46g=wQnFyC63kQKsXwbHGRWAxQ+aw@mail.gmail.com>
In-Reply-To: <CAG48ez2oge4xs1pSz_T9L46g=wQnFyC63kQKsXwbHGRWAxQ+aw@mail.gmail.com>
From: Nico Pache <npache@redhat.com>
Date: Thu, 1 May 2025 16:29:38 -0600
X-Gm-Features: ATxdqUEKwzN7AUPendRf30QvugXPulXaFgyWPRdBbqxwd-i4pO_KPKRotBGLrUo
Message-ID: <CAA1CXcBHJbs7_DGVR929NOD5G4nkJ3LguDrL9itV8-QS+BNUpg@mail.gmail.com>
Subject: Re: [PATCH v5 07/12] khugepaged: add mTHP support
To: Jann Horn <jannh@google.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, corbet@lwn.net, rostedt@goodmis.org, 
	mhiramat@kernel.org, mathieu.desnoyers@efficios.com, david@redhat.com, 
	baohua@kernel.org, baolin.wang@linux.alibaba.com, ryan.roberts@arm.com, 
	willy@infradead.org, peterx@redhat.com, ziy@nvidia.com, 
	wangkefeng.wang@huawei.com, usamaarif642@gmail.com, sunnanyong@huawei.com, 
	vishal.moola@gmail.com, thomas.hellstrom@linux.intel.com, 
	yang@os.amperecomputing.com, kirill.shutemov@linux.intel.com, 
	aarcange@redhat.com, raquini@redhat.com, dev.jain@arm.com, 
	anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de, 
	will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org, 
	jglisse@google.com, surenb@google.com, zokeefe@google.com, hannes@cmpxchg.org, 
	rientjes@google.com, mhocko@suse.com, rdunlap@infradead.org, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 2:53=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
>
> On Mon, Apr 28, 2025 at 8:12=E2=80=AFPM Nico Pache <npache@redhat.com> wr=
ote:
> > Introduce the ability for khugepaged to collapse to different mTHP size=
s.
> > While scanning PMD ranges for potential collapse candidates, keep track
> > of pages in KHUGEPAGED_MIN_MTHP_ORDER chunks via a bitmap. Each bit
> > represents a utilized region of order KHUGEPAGED_MIN_MTHP_ORDER ptes. I=
f
> > mTHPs are enabled we remove the restriction of max_ptes_none during the
> > scan phase so we dont bailout early and miss potential mTHP candidates.
> >
> > After the scan is complete we will perform binary recursion on the
> > bitmap to determine which mTHP size would be most efficient to collapse
> > to. max_ptes_none will be scaled by the attempted collapse order to
> > determine how full a THP must be to be eligible.
> >
> > If a mTHP collapse is attempted, but contains swapped out, or shared
> > pages, we dont perform the collapse.
> [...]
> > @@ -1208,11 +1211,12 @@ static int collapse_huge_page(struct mm_struct =
*mm, unsigned long address,
> >         vma_start_write(vma);
> >         anon_vma_lock_write(vma->anon_vma);
> >
> > -       mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm, addres=
s,
> > -                               address + HPAGE_PMD_SIZE);
> > +       mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm, _addre=
ss,
> > +                               _address + (PAGE_SIZE << order));
> >         mmu_notifier_invalidate_range_start(&range);
> >
> >         pmd_ptl =3D pmd_lock(mm, pmd); /* probably unnecessary */
> > +
> >         /*
> >          * This removes any huge TLB entry from the CPU so we won't all=
ow
> >          * huge and small TLB entries for the same virtual address to
>
> It's not visible in this diff, but we're about to do a
> pmdp_collapse_flush() here. pmdp_collapse_flush() tears down the
> entire page table, meaning it tears down 2MiB of address space; and it
> assumes that the entire page table exclusively corresponds to the
> current VMA.
>
> I think you'll need to ensure that the pmdp_collapse_flush() only
> happens for full-size THP, and that mTHP only tears down individual
> PTEs in the relevant range. (That code might get a bit messy, since
> the existing THP code tears down PTEs in a detached page table, while
> mTHP would have to do it in a still-attached page table.)
Hi Jann!

I was under the impression that this is needed to prevent GUP-fast
races (and potentially others).
As you state here, conceptually the PMD case is, detach the PMD, do
the collapse, then reinstall the PMD (similarly to how the system
recovers from a failed PMD collapse). I tried to keep the current
locking behavior as it seemed the easiest way to get it right (and not
break anything). So I keep the PMD detaching and reinstalling for the
mTHP case too. As Hugh points out I am releasing the anon lock too
early. I will comment further on his response.

As I familiarize myself with the code more, I do see potential code
improvements/cleanups and locking improvements, but I was going to
leave those to a later series.

Thanks
-- Nico
>

