Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FE615D1
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750242770; cv=none; b=U7vuztk20ccNR9+glJD+9DfauYiiM5phIG3vp4Yu8hVkCEyADC0W8rZ/7gzh/j4isz/0Eft4k8OGtI4vk8Ht0sQVpOQxYLjpyEHYn7tm8MURB0/69wKv/NtVj4+GcvkeEjEqozzQAlOPmk+RZEVjzCZiKox7tHRuOUjwRj7LHdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750242770; c=relaxed/simple;
	bh=+X7SfI7H0it0qra2ohxRbhzR346nR7Q9xO4PPOUUmSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IJu1Q13mtEfofA2/esxE+knEo8QF7qYqs5hTmQj1JACA4T26B4lyB1MUE3dRadWlVFHo7a2AVI+BVkOjf/sBqRp6HaNOi91/G+r0MN42xRjTRn5CBEyp0a5Pylr6hQjyK1APNioQYIP4KyLYCczDIx8Rp0O2SBta2wCRauuiJ2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RtEkLcJE; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RtEkLcJE"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4e80ff08dd6so440965137.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 03:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750242767; x=1750847567; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lU+pzqvL/Yt+cxi9AuUllWrZ9p+aLRr7tJP24I45bHI=;
        b=RtEkLcJElOwcnarnlPjSnsTw6Mid+b0A9pbUrZN5UNAT/naDDyys6z4fFaMv4JbyU6
         V/CJC3efzaxm/hzo1lvhkt14DXM8wowVrY6O/F2mqma8u0a2l7aYnzJIFNvcGR4Qv7Oy
         AqVdt62J5m2Pe77CSE8eicWn0ra29FurM9p8E4i2V4isBfz7rG7dL3/8taulX6ayvA/t
         VDmR6EdOcIzCvk1VElXRrJrd+x26qRuzOqbxAV7xpYLD8F2/cU25MQx8h8mJYvEIptsQ
         iUHNaiAGwla2vwyZnm4lYKk3S8zGZMWHsH/J7nBWkhPqRERcd1+9TNDXWStr48MgxGKK
         d+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750242767; x=1750847567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lU+pzqvL/Yt+cxi9AuUllWrZ9p+aLRr7tJP24I45bHI=;
        b=JMZuAUwx4htDGyg/tGaXK8nPE51/emqAfhKOBmJsiyRH0W5I6VGn3I0fk8tKwZao6B
         e6TV4MD7EGZnOyhGsEkl5Z2c7EjRBNnYSSpP4ALhTwiGMjSF/a8z+02M4hJXep9cqHfd
         4EfyD4eNq17JqM6yvoONpAPGDv4jlQG3fZGve+f9g69R1PNQpl6ofJHN6LsLLQk8ibt2
         cC8eHpcdIQFmbkS/rM6PonWmizRunxUNF3kUor64DxXhHruqallTSmZtluSfuOg//2ch
         ENKBIU72K6sZRXd94mbHYkIjcPot+u6HUOrPqsoJwOwfHbWMnE+ecBdiM+mrTFvyZvxS
         qO/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUOnEDfgeJB4qeaBYhOJ3OXzCTkMXoMvqlzMvuNmjETEmTx8g0aDP06ZMP8TWGow1z+AxtZRlSObkp+C8c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyR5FvnNx8PqRFZPttVW7z9XJSbrkRWLcpMIp2E5Qf55yhkVNzp
	q75L64AMoGz8iNBQMkMrrb6T0mutf7q0EErp63hjjDjDrg+xVHsyTBotwwkcKzH2Z2eOT5VZDzG
	lrS4bHXAnX5CLqLcevIXPfGddEeJxnag=
X-Gm-Gg: ASbGncsGPWdF7ljQwgm5HLrj8RAPDt5G97KVuvadgwxch/MCvfOeclR/BVgWiNzMhUt
	D9QHnN7s7z222NzQNpnHOGrUNaYn+xis0pYFuPLKiFvFvQ05d5pbcyzLPaj/g3KS0T0T4mXjJ4F
	eZAToRSt91avlMPeOOwD1Gn6JlzVca/ZzMXFDR6GGfEp8=
X-Google-Smtp-Source: AGHT+IEaJVB4tMkw2x2fbh5d1EW9KLwKMc6MKqks+45BQkwMs1+F9WOytNwvsjJPa3MWwnNKWhXs6HULpjYYlnTxqJQ=
X-Received: by 2002:a05:6102:41a6:b0:4e7:866c:5cd9 with SMTP id
 ada2fe7eead31-4e9980aec58mr1095888137.11.1750242767417; Wed, 18 Jun 2025
 03:32:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250607220150.2980-1-21cnbao@gmail.com> <309d22ca-6cd9-4601-8402-d441a07d9443@lucifer.local>
 <f2a43ae1-6347-47e2-bcc4-845dc7e7ed87@linux.dev> <CAGsJ_4xVH6DT_8t=oDvHCJ-iDwrpms6FhMn9UdKWMwDRv+hunA@mail.gmail.com>
 <deb5ecd0-d57b-4a04-85b7-e6d11207aa8f@redhat.com> <CAGsJ_4yeD+-xaNWyaiQSCpbZMDqF73R2AXjzBL1U--cOg6OSjg@mail.gmail.com>
In-Reply-To: <CAGsJ_4yeD+-xaNWyaiQSCpbZMDqF73R2AXjzBL1U--cOg6OSjg@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 18 Jun 2025 18:32:36 +0800
X-Gm-Features: Ac12FXyP3am24e1zyR-C769M7_eQzhr2bUBOnfWcFSv8jkQbj6h2MA7umGMWpn4
Message-ID: <CAGsJ_4zBKho=vdwfP89XvvouOytckBkFJc9h5G+-+DGDL803TA@mail.gmail.com>
Subject: Re: [PATCH v4] mm: use per_vma lock for MADV_DONTNEED
To: David Hildenbrand <david@redhat.com>
Cc: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Lokesh Gidra <lokeshgidra@google.com>, 
	Tangquan Zheng <zhengtangquan@oppo.com>, Qi Zheng <zhengqi.arch@bytedance.com>, 
	Lance Yang <ioworker0@gmail.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Zi Li <zi.li@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 6:30=E2=80=AFPM Barry Song <21cnbao@gmail.com> wrot=
e:
>
> On Wed, Jun 18, 2025 at 6:18=E2=80=AFPM David Hildenbrand <david@redhat.c=
om> wrote:
> >
> > On 18.06.25 11:52, Barry Song wrote:
> > > On Wed, Jun 18, 2025 at 10:25=E2=80=AFAM Lance Yang <lance.yang@linux=
.dev> wrote:
> > >>
> > >> Hi all,
> > >>
> > >> Crazy, the per-VMA lock for madvise is an absolute game-changer ;)
> > >>
> > >> On 2025/6/17 21:38, Lorenzo Stoakes wrote:
> > >> [...]
> > >>>
> > >>> On Sun, Jun 08, 2025 at 10:01:50AM +1200, Barry Song wrote:
> > >>>> From: Barry Song <v-songbaohua@oppo.com>
> > >>>>
> > >>>> Certain madvise operations, especially MADV_DONTNEED, occur far mo=
re
> > >>>> frequently than other madvise options, particularly in native and =
Java
> > >>>> heaps for dynamic memory management.
> > >>>>
> > >>>> Currently, the mmap_lock is always held during these operations, e=
ven when
> > >>>> unnecessary. This causes lock contention and can lead to severe pr=
iority
> > >>>> inversion, where low-priority threads=E2=80=94such as Android's He=
apTaskDaemon=E2=80=94
> > >>>> hold the lock and block higher-priority threads.
> > >>>>
> > >>>> This patch enables the use of per-VMA locks when the advised range=
 lies
> > >>>> entirely within a single VMA, avoiding the need for full VMA trave=
rsal. In
> > >>>> practice, userspace heaps rarely issue MADV_DONTNEED across multip=
le VMAs.
> > >>>>
> > >>>> Tangquan=E2=80=99s testing shows that over 99.5% of memory reclaim=
ed by Android
> > >>>> benefits from this per-VMA lock optimization. After extended runti=
me,
> > >>>> 217,735 madvise calls from HeapTaskDaemon used the per-VMA path, w=
hile
> > >>>> only 1,231 fell back to mmap_lock.
> > >>>>
> > >>>> To simplify handling, the implementation falls back to the standar=
d
> > >>>> mmap_lock if userfaultfd is enabled on the VMA, avoiding the compl=
exity of
> > >>>> userfaultfd_remove().
> > >>>>
> > >>>> Many thanks to Lorenzo's work[1] on:
> > >>>> "Refactor the madvise() code to retain state about the locking mod=
e
> > >>>> utilised for traversing VMAs.
> > >>>>
> > >>>> Then use this mechanism to permit VMA locking to be done later in =
the
> > >>>> madvise() logic and also to allow altering of the locking mode to =
permit
> > >>>> falling back to an mmap read lock if required."
> > >>>>
> > >>>> One important point, as pointed out by Jann[2], is that
> > >>>> untagged_addr_remote() requires holding mmap_lock. This is because
> > >>>> address tagging on x86 and RISC-V is quite complex.
> > >>>>
> > >>>> Until untagged_addr_remote() becomes atomic=E2=80=94which seems un=
likely in
> > >>>> the near future=E2=80=94we cannot support per-VMA locks for remote=
 processes.
> > >>>> So for now, only local processes are supported.
> > >>
> > >> Just to put some numbers on it, I ran a micro-benchmark with 100
> > >> parallel threads, where each thread calls madvise() on its own 1GiB
> > >> chunk of 64KiB mTHP-backed memory. The performance gain is huge:
> > >>
> > >> 1) MADV_DONTNEED saw its average time drop from 0.0508s to 0.0270s (=
~47%
> > >> faster)
> > >> 2) MADV_FREE     saw its average time drop from 0.3078s to 0.1095s (=
~64%
> > >> faster)
> > >
> > > Thanks for the report, Lance. I assume your micro-benchmark includes =
some
> > > explicit or implicit operations that may require mmap_write_lock().
> > > As  mmap_read_lock() only waits for writers and does not block other
> > > mmap_read_lock() calls.
> >
> > The number rather indicate that one test was run with (m)THPs enabled
> > and the other not? Just a thought. The locking overhead from my
> > experience is not that significant.
>
> Right. I don't expect pure madvise_dontneed/free=E2=80=94without any addi=
tional
> behavior requiring mmap_write_lock=E2=80=94to improve performance signifi=
cantly.
> The main benefit would be avoiding contention on the write lock.
>
> Consider this scenario:
> timestamp1: Thread A acquires the read lock
> timestamp2: Thread B attempts to acquire the write lock
> timestamp3: Threads C, D, and E attempt to acquire the read lock
>
> In this case, thread B must wait for A, and threads C, D, and E will
> wait for both A and B. Any write lock request effectively blocks all
> subsequent read acquisitions.
>
> In the worst case, thread A might be a GC thread with a high nice value.
> If it's preempted by other threads, the delay can reach several
> milliseconds=E2=80=94as we've observed in some cases.

sorry for the typo. I mean a few hundred milliseconds.
>
> >
> > --
> > Cheers,
> >
> > David / dhildenb
> >
>
> Thanks
> Barry
