Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0552186294
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240363; cv=none; b=Z/FWB/c7ev2N/fUTAXgHwZ4hjGPBUmJd3fz2OxAE92fl1lgALAA7Hp2yMXGBAuMk2/i7jnJ4ybb5L+MRnzW5nRVox1nwLiMA5JRIKEFyiaP+Ja8xQyRnWRVnyLJClVVTR+1EeplDy2auU0OSe1Txgzr1zon2ONjoGtmiJl854A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240363; c=relaxed/simple;
	bh=Mw4RqggIhkIW6LA5F5dC5RIw7XNCP/yell2saKdiFV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NtlYRVLeh363JdTn10Sx5FlwADZXh28tTr/D1+vN1TJKWj2fgwxBGAu24MZDo0cTRS8YrbWwxKz/qAYQ0ruXyrySvBmIA2JE5KgyBQ6Arzogrxk9hELZfQ2AZ9DEnFEeApsaWpOMotgA2CAnjS1DdR6GYnLH/UChmPc6n7mbACw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=llAcUDeR; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="llAcUDeR"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-877d7fa49e0so4373587241.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 02:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240361; x=1750845161; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=muzPKRA0oXpJ18M/OJ/yeBi5jJNJKBY7O/8ZgYL2clQ=;
        b=llAcUDeRmvFwKjWXKPPtsibVtyDldC6N3+464G7qCq/8zYgNc4Wb9KAyPf8MHhW6ym
         TRKqfgxeHVL623EjjOw5ldtGtnD4doXnsX2GJIoowjiL3+B/VmenBF+pFtxvysRospz/
         bJ+AgP3IjTeP+G86+AejQFSWWnpbhJ1XLv1NBhd+7CmRdyISMVUfOVbj2WVL4p+X0qI4
         vm3VqkOuqNFrtkgodj9JWhsiaPPU0PZL3Z22VP2oLUgh20quumEf2CeWtwVI+xFt6AnR
         WEFyYdkL2twLixsHGYqFKxTQMqQFO0czbDH8CQdGb11pz/vwthmDIpJJEam6kHZyJs3U
         3SOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240361; x=1750845161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=muzPKRA0oXpJ18M/OJ/yeBi5jJNJKBY7O/8ZgYL2clQ=;
        b=KFE2+tS1PIqq74+7uw8xYqELNCDIsFa+hbIRoAiUDPPTho/+jkDplJy0cuGMS8fWlE
         djhPBVJCzbi7TvsfD8VgIExrD1Pf5wyXIXOP+fgT50RDQR6CG+8s/flz9zKeMjvsoLfG
         AS4UZPZUfmf0A1BZBj2I6dZjGDTm1LlKufP3EY6Pp/l0+/oodi2jdcPDvk/2fAn3uQLG
         z+1gkTmQFoYZ8fkpMrbqFEXRsLO31YXv0nvGrBWnf5j8+NagPs0PYk2tRR1jnvyS1+u0
         hauTemiD1DXdoK9/x8bVEOkj7afKot6KO6Mpwg1jyMpD2TSAxpQ21M0opY1Mu0xbXrAD
         uIlA==
X-Forwarded-Encrypted: i=1; AJvYcCUDdoIzl51ShDNJEHbwIdm3gLjlbsNEAQP2ATmJwxsyAJFttgi0q/lgUa/cJOgYvlFfcd6BWRNZynwF8/E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk4dKUBheyjrABPvoIYtA6M88MHilXNeHBYq7sgMxj7KZR3U7X
	WjORoqnXMlF++lvjJXLg7WX+DOftEcRzitw/lr3dHXfsI6sriFA5aFiUO+bqAn0AJO2kcjGD02d
	8iw26KXhEl632sdC6a2/2Y+jkoAeLkzc=
X-Gm-Gg: ASbGncvQ5OZpNJaLecWrgcDIyWBkJ7ueh3sD+Wrgsq63Z2tPvncTrqkvSY6NJOQ21Fp
	QTDiVdThuvpWGI3Aqpo62hSgTi22S4y1aBC9n+02WJP4n4844QFHuoCHR4YjGbIBlHumB64l00X
	GO8dzg5IKazrSmtxOVo0wwTwBC5zoCni0z13urGI1AQO4=
X-Google-Smtp-Source: AGHT+IENCLY7tb8wCgeKdSRxaRBa5eDJ5oqLt2UY/7tfrWQQhCiff7S5KElIHcvGO9Q37IJcQ5Hg26gnlGHrF+Lm1oE=
X-Received: by 2002:a05:6102:4bcd:b0:4e4:5df7:a10a with SMTP id
 ada2fe7eead31-4e7f6207960mr11453168137.16.1750240360732; Wed, 18 Jun 2025
 02:52:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250607220150.2980-1-21cnbao@gmail.com> <309d22ca-6cd9-4601-8402-d441a07d9443@lucifer.local>
 <f2a43ae1-6347-47e2-bcc4-845dc7e7ed87@linux.dev>
In-Reply-To: <f2a43ae1-6347-47e2-bcc4-845dc7e7ed87@linux.dev>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 18 Jun 2025 17:52:28 +0800
X-Gm-Features: Ac12FXzvMFuQyJcjxcM9DVZI3g5FK4SRq_miWgwgHfjO7ZltaPDxc2PlzJBo2NE
Message-ID: <CAGsJ_4xVH6DT_8t=oDvHCJ-iDwrpms6FhMn9UdKWMwDRv+hunA@mail.gmail.com>
Subject: Re: [PATCH v4] mm: use per_vma lock for MADV_DONTNEED
To: Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Lokesh Gidra <lokeshgidra@google.com>, 
	Tangquan Zheng <zhengtangquan@oppo.com>, Qi Zheng <zhengqi.arch@bytedance.com>, 
	Lance Yang <ioworker0@gmail.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Zi Li <zi.li@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 10:25=E2=80=AFAM Lance Yang <lance.yang@linux.dev> =
wrote:
>
> Hi all,
>
> Crazy, the per-VMA lock for madvise is an absolute game-changer ;)
>
> On 2025/6/17 21:38, Lorenzo Stoakes wrote:
> [...]
> >
> > On Sun, Jun 08, 2025 at 10:01:50AM +1200, Barry Song wrote:
> >> From: Barry Song <v-songbaohua@oppo.com>
> >>
> >> Certain madvise operations, especially MADV_DONTNEED, occur far more
> >> frequently than other madvise options, particularly in native and Java
> >> heaps for dynamic memory management.
> >>
> >> Currently, the mmap_lock is always held during these operations, even =
when
> >> unnecessary. This causes lock contention and can lead to severe priori=
ty
> >> inversion, where low-priority threads=E2=80=94such as Android's HeapTa=
skDaemon=E2=80=94
> >> hold the lock and block higher-priority threads.
> >>
> >> This patch enables the use of per-VMA locks when the advised range lie=
s
> >> entirely within a single VMA, avoiding the need for full VMA traversal=
. In
> >> practice, userspace heaps rarely issue MADV_DONTNEED across multiple V=
MAs.
> >>
> >> Tangquan=E2=80=99s testing shows that over 99.5% of memory reclaimed b=
y Android
> >> benefits from this per-VMA lock optimization. After extended runtime,
> >> 217,735 madvise calls from HeapTaskDaemon used the per-VMA path, while
> >> only 1,231 fell back to mmap_lock.
> >>
> >> To simplify handling, the implementation falls back to the standard
> >> mmap_lock if userfaultfd is enabled on the VMA, avoiding the complexit=
y of
> >> userfaultfd_remove().
> >>
> >> Many thanks to Lorenzo's work[1] on:
> >> "Refactor the madvise() code to retain state about the locking mode
> >> utilised for traversing VMAs.
> >>
> >> Then use this mechanism to permit VMA locking to be done later in the
> >> madvise() logic and also to allow altering of the locking mode to perm=
it
> >> falling back to an mmap read lock if required."
> >>
> >> One important point, as pointed out by Jann[2], is that
> >> untagged_addr_remote() requires holding mmap_lock. This is because
> >> address tagging on x86 and RISC-V is quite complex.
> >>
> >> Until untagged_addr_remote() becomes atomic=E2=80=94which seems unlike=
ly in
> >> the near future=E2=80=94we cannot support per-VMA locks for remote pro=
cesses.
> >> So for now, only local processes are supported.
>
> Just to put some numbers on it, I ran a micro-benchmark with 100
> parallel threads, where each thread calls madvise() on its own 1GiB
> chunk of 64KiB mTHP-backed memory. The performance gain is huge:
>
> 1) MADV_DONTNEED saw its average time drop from 0.0508s to 0.0270s (~47%
> faster)
> 2) MADV_FREE     saw its average time drop from 0.3078s to 0.1095s (~64%
> faster)

Thanks for the report, Lance. I assume your micro-benchmark includes some
explicit or implicit operations that may require mmap_write_lock().
As  mmap_read_lock() only waits for writers and does not block other
mmap_read_lock() calls.

By the way, I would expect that per-VMA locking for madvise_dontneed or
madvise_free would benefit nearly all Linux and Android systems, as long
as they use a dynamic C/Java memory allocator.

>
> Thanks,
> Lance

Thanks
Barry
