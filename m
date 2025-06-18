Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDB5285CA7
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750242640; cv=none; b=mbIuwEfIzuf+hV0sISdnDxSy0kK7qEeXR64ut6xqTuHkG9JzmcIF+RaVPiFPBTyTGaaBVhSMClM7jWs8s9GNhpJVqWfVUWpVfu0fZqncLwM50p8JNQZlpCyqCzyA8QSzMZgmoNOB2T1wtHtIACfZNRuRSC9C/zP3O05GkdgJzcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750242640; c=relaxed/simple;
	bh=2NmOtIaNyzEuXFXQ8/GlBm7Zz/Nj2G8T4Co/avh73AE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jt8Yf2CFO6Dnb53h+bZL9QreDjyK73/5avjDd6n2PHKfzl03IoihZXdwN+LAgAKrUu7OJ0wFbX6zpG801oZvjZSE+P7RweCe5tDrEnsUZRFgzfzNku0vmXIp6T5eCFqJxOh9ptWiic7WPFPNQnZEYBO5MqBC7tEvrIIWGUm1Rcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MC5rj8m/; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MC5rj8m/"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86fea8329cdso3606022241.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 03:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750242638; x=1750847438; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eT/12PZKfSu2SPGaB3McbmJPaBjlQ9tOE7JomTG4kVY=;
        b=MC5rj8m/OjpUGq0P70wD7jikpvlZeLdeX0+PTTm68v1RBfViOvueD5OhdQx8EZ/Jio
         cDDG1fLC631VGHJbpKo5Oq3KQlnkhITsDF5U17la0QBAQl+jzdl606L8l9XnMhuJDLgz
         JSZDJz3JEERxJ6p0NQP3hng9Hp4L+dzCIpHcCzJcO2UlaynjysVNwikx9W10a8yL8PWP
         Agz8ETFWrSr1qXiDaFidOE9hs7NgkzFclbAs4+vFfPKyfbe9F9/Y1QP8UGaDlgjxytg5
         TEZE2Ic5dc1ANRU9dNgQKCpK5JXkSbLL87+7coyZUsaH3x5lUCCuPVcxodXqOfbRCVb0
         SY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750242638; x=1750847438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eT/12PZKfSu2SPGaB3McbmJPaBjlQ9tOE7JomTG4kVY=;
        b=DuatQaszZC4nQgJ108O1TFyiO17KAYqEJm5V6NlIrhGdSk/DqRA7vhic5QuPYw0kg7
         Ts5gDhJVnY3Flt7OFXUqgfnRvcib0YC7K/RfjZebimvmYBtxdQFuD1ixR8WFgRNs6t9+
         FZYedeHtkORAWsGyQM+sJRPBi2AAoWDEpkYCfkEy9+hDzl+Cpi89jdou1+mKy1CvviBQ
         FSpuSFvTr25tgNXVJTWuzc62TWg6Tomkp7VqoUoxwKhRykshqYZ5fa8F225gt2EUxiRv
         6lwVGtTqOdkYUa8Mb0yH80fikdHloW4OSCD3LMWxjppxSTdWlCXPanoNz9zbXl8rzIbq
         JYNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhrgXDdjvHZYPmp2MBP+zM/SX34+V+QysIC/Kan7KlDKbHkeDlcr8ulMQmvDdDPFm7u/nHnTHOcesZU8M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyULXAHIfQxYSREMn7Kdrsl3uHOGr399N85Gpq35ObrbZTvAsHY
	YLGKcShIqo4onJ+LI1v7PtjFhs6f1mlWve3i2+INlzbUAy4Sd+4h9nz/AYVrSfbcf0vadzwsa+q
	2TlSAo+iqlfkwF4osC1/bQziBiTdRXXQ=
X-Gm-Gg: ASbGncsTrFOG6tRZSXUwuSLfh8Z3poxnBgLQyvJIunaS5KcvfYjtTTYZ/I5rWxTEvs2
	ynkmIDFf6pCXBMKkHA+yMd9zvpGAckNcCyvsnCylbYMmAEa3yPcA9zgefJfkksPuScq+wYfOcqx
	nPQHzrQ00dOdHS1m4JFbmyQB0WHb/WmKLgBj8mIYDeeW0=
X-Google-Smtp-Source: AGHT+IH7RKRvCm6q1PrSG+d31xlc/PQvpYKmyeQnmWasX0yTBn6nbvTFur8gYIrv7DGT5XaouyCELPVDrMUMs/XDbts=
X-Received: by 2002:a05:6102:442b:b0:4e5:9c06:39d8 with SMTP id
 ada2fe7eead31-4e7f60f09fcmr12152465137.5.1750242637715; Wed, 18 Jun 2025
 03:30:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250607220150.2980-1-21cnbao@gmail.com> <309d22ca-6cd9-4601-8402-d441a07d9443@lucifer.local>
 <f2a43ae1-6347-47e2-bcc4-845dc7e7ed87@linux.dev> <CAGsJ_4xVH6DT_8t=oDvHCJ-iDwrpms6FhMn9UdKWMwDRv+hunA@mail.gmail.com>
 <deb5ecd0-d57b-4a04-85b7-e6d11207aa8f@redhat.com>
In-Reply-To: <deb5ecd0-d57b-4a04-85b7-e6d11207aa8f@redhat.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 18 Jun 2025 18:30:26 +0800
X-Gm-Features: Ac12FXwWS54rOJl_kJC8BwUmeIH64jUFLRXblV-c1oAAypuMBEE4BMLagbfjl_E
Message-ID: <CAGsJ_4yeD+-xaNWyaiQSCpbZMDqF73R2AXjzBL1U--cOg6OSjg@mail.gmail.com>
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

On Wed, Jun 18, 2025 at 6:18=E2=80=AFPM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 18.06.25 11:52, Barry Song wrote:
> > On Wed, Jun 18, 2025 at 10:25=E2=80=AFAM Lance Yang <lance.yang@linux.d=
ev> wrote:
> >>
> >> Hi all,
> >>
> >> Crazy, the per-VMA lock for madvise is an absolute game-changer ;)
> >>
> >> On 2025/6/17 21:38, Lorenzo Stoakes wrote:
> >> [...]
> >>>
> >>> On Sun, Jun 08, 2025 at 10:01:50AM +1200, Barry Song wrote:
> >>>> From: Barry Song <v-songbaohua@oppo.com>
> >>>>
> >>>> Certain madvise operations, especially MADV_DONTNEED, occur far more
> >>>> frequently than other madvise options, particularly in native and Ja=
va
> >>>> heaps for dynamic memory management.
> >>>>
> >>>> Currently, the mmap_lock is always held during these operations, eve=
n when
> >>>> unnecessary. This causes lock contention and can lead to severe prio=
rity
> >>>> inversion, where low-priority threads=E2=80=94such as Android's Heap=
TaskDaemon=E2=80=94
> >>>> hold the lock and block higher-priority threads.
> >>>>
> >>>> This patch enables the use of per-VMA locks when the advised range l=
ies
> >>>> entirely within a single VMA, avoiding the need for full VMA travers=
al. In
> >>>> practice, userspace heaps rarely issue MADV_DONTNEED across multiple=
 VMAs.
> >>>>
> >>>> Tangquan=E2=80=99s testing shows that over 99.5% of memory reclaimed=
 by Android
> >>>> benefits from this per-VMA lock optimization. After extended runtime=
,
> >>>> 217,735 madvise calls from HeapTaskDaemon used the per-VMA path, whi=
le
> >>>> only 1,231 fell back to mmap_lock.
> >>>>
> >>>> To simplify handling, the implementation falls back to the standard
> >>>> mmap_lock if userfaultfd is enabled on the VMA, avoiding the complex=
ity of
> >>>> userfaultfd_remove().
> >>>>
> >>>> Many thanks to Lorenzo's work[1] on:
> >>>> "Refactor the madvise() code to retain state about the locking mode
> >>>> utilised for traversing VMAs.
> >>>>
> >>>> Then use this mechanism to permit VMA locking to be done later in th=
e
> >>>> madvise() logic and also to allow altering of the locking mode to pe=
rmit
> >>>> falling back to an mmap read lock if required."
> >>>>
> >>>> One important point, as pointed out by Jann[2], is that
> >>>> untagged_addr_remote() requires holding mmap_lock. This is because
> >>>> address tagging on x86 and RISC-V is quite complex.
> >>>>
> >>>> Until untagged_addr_remote() becomes atomic=E2=80=94which seems unli=
kely in
> >>>> the near future=E2=80=94we cannot support per-VMA locks for remote p=
rocesses.
> >>>> So for now, only local processes are supported.
> >>
> >> Just to put some numbers on it, I ran a micro-benchmark with 100
> >> parallel threads, where each thread calls madvise() on its own 1GiB
> >> chunk of 64KiB mTHP-backed memory. The performance gain is huge:
> >>
> >> 1) MADV_DONTNEED saw its average time drop from 0.0508s to 0.0270s (~4=
7%
> >> faster)
> >> 2) MADV_FREE     saw its average time drop from 0.3078s to 0.1095s (~6=
4%
> >> faster)
> >
> > Thanks for the report, Lance. I assume your micro-benchmark includes so=
me
> > explicit or implicit operations that may require mmap_write_lock().
> > As  mmap_read_lock() only waits for writers and does not block other
> > mmap_read_lock() calls.
>
> The number rather indicate that one test was run with (m)THPs enabled
> and the other not? Just a thought. The locking overhead from my
> experience is not that significant.

Right. I don't expect pure madvise_dontneed/free=E2=80=94without any additi=
onal
behavior requiring mmap_write_lock=E2=80=94to improve performance significa=
ntly.
The main benefit would be avoiding contention on the write lock.

Consider this scenario:
timestamp1: Thread A acquires the read lock
timestamp2: Thread B attempts to acquire the write lock
timestamp3: Threads C, D, and E attempt to acquire the read lock

In this case, thread B must wait for A, and threads C, D, and E will
wait for both A and B. Any write lock request effectively blocks all
subsequent read acquisitions.

In the worst case, thread A might be a GC thread with a high nice value.
If it's preempted by other threads, the delay can reach several
milliseconds=E2=80=94as we've observed in some cases.

>
> --
> Cheers,
>
> David / dhildenb
>

Thanks
Barry
