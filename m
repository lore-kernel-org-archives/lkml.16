Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA873252289
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 17:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745947504; cv=none; b=BWs4Ha82fyuNmcb1BU6Bk73USbMItWzZVY+qqQklK5KAb2T5trlitMT5qbGe2WlnUQjV3ZwQz1PNjwtgB0INNhnGu78wu5V10aiV8A4oGRiuheGK3A5RgRSx++yD6RLu8bkgphoUOFHUMGrKGeIxubURpkuhut5AaZmundBCbfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745947504; c=relaxed/simple;
	bh=YZNlpWTu45BvxqqIxegtjX5fVfVe1MKL/1zgFUmY1E0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C7dAM3N45yR0R6C8BiqNlIRB9CFzm1H1jZYAKtR2hEMhY8CNztTLzODV1fNgGl7kyRWN7omvW5mQQnoj0rp1ExYbLd78falLrEiJhXoPglNEXaeCiDs/qYSWgWSECi2dcDIs96FL0V85Kn5UwHaglzzyEfYBPpo10SHsGgrTDUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KJwS9nVH; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KJwS9nVH"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5f88f236167so719a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745947501; x=1746552301; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZNlpWTu45BvxqqIxegtjX5fVfVe1MKL/1zgFUmY1E0=;
        b=KJwS9nVHG5K+LQbyX2Lp+PZQUbtfikrRqqcHsKzT0LyaKErYQvPtkzHES3CGd9ARnG
         zVDfrtmA0/tJCf8HzvIilnMJNBtidqIL5eI/HyKpac9FQBvpMoHQomTI3l3LwSCuBb9c
         EXpcLMJuibNgDG5DKELPSIIR8qM0nra+Sz52lLI7PNXQVaR/UeWi+gDfHe6TIErORFvS
         EVrQtyQnbaRtpAP4HbdvzZ37CFYxccclQm43wAobHQ7jKztawZMV7zNxuoBq4nZtuPDT
         xF9moi/ktWK8R+h42Z9L+9i/wYpQi4NmxzQmcHpUzkWNqR1dT712wOLXUEcibDHBZTUr
         65vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745947501; x=1746552301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZNlpWTu45BvxqqIxegtjX5fVfVe1MKL/1zgFUmY1E0=;
        b=J8BBOAN9zH0Z/rT6Ak4AB7NFlmt71PLuqIlRm6HKGYvPk85Wd3GN/21weeHrnLhcyW
         WwhKkd/+ga5637u4HspJ1g1rgyHvBhMXtP08yWQPMpXzDoujsLEQLN7B/6tXKn+YLcIh
         wCvXiDuFPF3xF2ZNcGF4YuJCdURvrex6UVSWLrufhn2ATQ5l99EYJfwBi5hPJFUD9rb+
         kXuyRK5+K4eFHtcfFZmw9+u/biZksPtGwmU6UVRqHDeEEDbcEIhtKtomojA1aK8T3GFC
         ElPiPXQkvSbQ3sB30Y9yL8GwtTo9f04gqKtg2Pj7WVOsXN+qkQOHGKVeXjw46ftIztuJ
         0vzw==
X-Forwarded-Encrypted: i=1; AJvYcCVSLVbo+Twao1+FtPkmAAocnjnJHWr+KJvQKsxgrhzp4g5HbtDlaobt6/Z7/4PS8V2M6LjTlF7/vU0Fq3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaR9048G8/EvRcU1AkHiV6AzXME7imO+m5QYcciIrRf/TsBcPy
	vPA1hAlPFJ6ulyzSlUK/hTCCcPP+wVQFE8iRb5wDw/QxLbvy7+hWKOZjugltmMyQCntSKP2n4PN
	uhfL7E0LG3FjUn9qOgoqgKQKHQdnKcnD8LWk3
X-Gm-Gg: ASbGncvwiISmjuhf4Ys30Y+TBz6JpRwE+qYJew7t6IuXu20Xs9cNAwxFHC+Stoc0RBc
	OoszkkPZ4LOkCt2HLQr93/x92ELfj8/ny1AayFE49FBk0lZxaTBtxN15Junh5VCxnXrfYlRsKwK
	rKK+5+WZNU1iRagYRfi3Ez2DBYYarJzOVB990enbIEvLKdO978Jg==
X-Google-Smtp-Source: AGHT+IFQ4OT/08toQML4e1ydyufT1IDTka9yb0vrhYlgRKfv7FERG5Kbei2OqJYLX1P6Hv4sTwQ29rgIx15PTzGkeeg=
X-Received: by 2002:a05:6402:516a:b0:5e4:9ee2:afe1 with SMTP id
 4fb4d7f45d1cf-5f83933ac06mr118420a12.2.1745947500781; Tue, 29 Apr 2025
 10:25:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250418174959.1431962-1-surenb@google.com> <20250418174959.1431962-9-surenb@google.com>
 <CAEf4BzabPLJTy1U=aBrGZqKpskNYvj5MYuhPHSh_=hjmVJMvrg@mail.gmail.com>
 <CAG48ez29frEbJG+ySVARX-bO_QWe8eUbZiV8Jq2sqYemfuqP_g@mail.gmail.com> <CAJuCfpGxw7L67CvDnTiHN0kdVjFcPoZZ4ZsOHi0=wR7Y2umk0Q@mail.gmail.com>
In-Reply-To: <CAJuCfpGxw7L67CvDnTiHN0kdVjFcPoZZ4ZsOHi0=wR7Y2umk0Q@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 29 Apr 2025 19:24:24 +0200
X-Gm-Features: ATxdqUFzhZAitfkhicfO9Ve5tnFVPmDAwtXF6C9iK9LMhQflCPc-OR-WEacaXck
Message-ID: <CAG48ez1cR+kXBsvk4murYDBBxSzg9g5FSU--P8-BCrMKV6A+KA@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] mm/maps: execute PROCMAP_QUERY ioctl under RCU
To: Suren Baghdasaryan <surenb@google.com>
Cc: Andrii Nakryiko <andrii.nakryiko@gmail.com>, akpm@linux-foundation.org, 
	Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, david@redhat.com, 
	vbabka@suse.cz, peterx@redhat.com, hannes@cmpxchg.org, mhocko@kernel.org, 
	paulmck@kernel.org, shuah@kernel.org, adobriyan@gmail.com, brauner@kernel.org, 
	josef@toxicpanda.com, yebin10@huawei.com, linux@weissschuh.net, 
	willy@infradead.org, osalvador@suse.de, andrii@kernel.org, 
	ryan.roberts@arm.com, christophe.leroy@csgroup.eu, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 7:15=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
> On Tue, Apr 29, 2025 at 8:56=E2=80=AFAM Jann Horn <jannh@google.com> wrot=
e:
> > On Wed, Apr 23, 2025 at 12:54=E2=80=AFAM Andrii Nakryiko
> > <andrii.nakryiko@gmail.com> wrote:
> > > On Fri, Apr 18, 2025 at 10:50=E2=80=AFAM Suren Baghdasaryan <surenb@g=
oogle.com> wrote:
> > > > Utilize speculative vma lookup to find and snapshot a vma without
> > > > taking mmap_lock during PROCMAP_QUERY ioctl execution. Concurrent
> > > > address space modifications are detected and the lookup is retried.
> > > > While we take the mmap_lock for reading during such contention, we
> > > > do that momentarily only to record new mm_wr_seq counter.
> > >
> > > PROCMAP_QUERY is an even more obvious candidate for fully lockless
> > > speculation, IMO (because it's more obvious that vma's use is
> > > localized to do_procmap_query(), instead of being spread across
> > > m_start/m_next and m_show as with seq_file approach). We do
> > > rcu_read_lock(), mmap_lock_speculate_try_begin(), query for VMA (no
> > > mmap_read_lock), use that VMA to produce (speculative) output, and
> > > then validate that VMA or mm_struct didn't change with
> > > mmap_lock_speculate_retry(). If it did - retry, if not - we are done.
> > > No need for vma_copy and any gets/puts, no?
> >
> > I really strongly dislike this "fully lockless" approach because it
> > means we get data races all over the place, and it gets hard to reason
> > about what happens especially if we do anything other than reading
> > plain data from the VMA. When reading the implementation of
> > do_procmap_query(), at basically every memory read you'd have to think
> > twice as hard to figure out which fields can be concurrently updated
> > elsewhere and whether the subsequent sequence count recheck can
> > recover from the resulting badness.
> >
> > Just as one example, I think get_vma_name() could (depending on
> > compiler optimizations) crash with a NULL deref if the VMA's ->vm_ops
> > pointer is concurrently changed to &vma_dummy_vm_ops by vma_close()
> > between "if (vma->vm_ops && vma->vm_ops->name)" and
> > "vma->vm_ops->name(vma)". And I think this illustrates how the "fully
> > lockless" approach creates more implicit assumptions about the
> > behavior of core MM code, which could be broken by future changes to
> > MM code.
>
> Yeah, I'll need to re-evaluate such an approach after your review. I
> like having get_stable_vma() to obtain a completely stable version of
> the vma in a localized place and then stop worrying about possible
> races. If implemented correctly, would that be enough to address your
> concern, Jann?

Yes, I think a stable local snapshot of the VMA (where tricky data
races are limited to the VMA snapshotting code) is a good tradeoff.
