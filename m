Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B238301126
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 17:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751477044; cv=none; b=gPifV/EeDhwlNyfjM8TV6fKU35Q1YELoaWWFApnaxNf8I15q5LY1R1XXP9pFgRu4CgEn1evNZHn1VbtVubYPVgmSifCvlLAlzKCEGJpa1hhskyzZ9hAdEwrtKL4cCUd7bNjKGQuKe9HsgqKYLmKCSm5qz26yM89p0Tl/gl4O+D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751477044; c=relaxed/simple;
	bh=lc7FQuZuOEdhQ/+bFNzzIBgXCgJpXHUHrf+51LMHk0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DoIGYbMSwd34OKwSjU0X8I/lXnnS/N+VYZ0BT9bYlZ2jZBenHtsx22jamGpUH1rAt2xWGdVkCpp7SWoXhyyV8dJ2EhxqCxgqzw+InuUZjwwSM3/CkyUy7xkF1OwsMu8DinneRBV3GgqpQCJrrUbFWxKC2c2EjSnSorI2lHvRhY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M7ufDSDb; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M7ufDSDb"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-609b169834cso958a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 10:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751477039; x=1752081839; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lc7FQuZuOEdhQ/+bFNzzIBgXCgJpXHUHrf+51LMHk0s=;
        b=M7ufDSDbpagjxAdXh7X1Ln+1x9ArX+M9vYvgYt6iE5N8ZoYVf5w20Nuh6EvgtXdA3f
         FQmXzrlvAc9claQ++1oFbvuvd8msIE68n2MfvLRW/L5YMsglvHl49vlMj1Ysj7PHJKhw
         1zQns0d+45sNZZ4cd4uCqHNdAfR5Qn0b2PqwWcyHh41jL9Ci9DFc2dJpM/dIoyNHrPpr
         8QnxYPvp3lUntb9Z2HRsPmTBCemRu9KZDLu1fX1opUHx6hhNwTT1LMu2mHV5R2crQll5
         LjaIiaVYTHvFfid7z9qmZTk4bkMGcL7SLyfIacyet/lYbBLDjOxl/7J2Fxt8DG0HVWSQ
         wj8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751477039; x=1752081839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lc7FQuZuOEdhQ/+bFNzzIBgXCgJpXHUHrf+51LMHk0s=;
        b=jkQlGz7/jnEsIDQqjO7ntLSLcA9bT97EtG6xe/Bx348VrT+eJMRaLJAe4VGmWF3gkp
         AxPSK3UcZB3eZlnCsMhekHgPp5OURnQXdtIvBFQoObHHB0AWnl3gL44KDrnM34rNWH9O
         57QHixcxg/C7536oug8KP3OuPyGkgaSfWuZa2fi0QA7P5yY1o6kpqXUGPQiligvrEPaK
         PlZmK2PQsO+TdViDb066hmaceSkk91tvD6vAK/Vrg5xWtlvrt+oJ7apeA6+WupxzhogE
         oaEMGOTl93udN1vyAs34gLxdoMQnvJXAHOSEgnI27KSrecgg2JUpiNGDb2L/iDS3gv8w
         +YXA==
X-Forwarded-Encrypted: i=1; AJvYcCXCL/EKxMr5XIyr9GV9C98uMllPT6KCV+/AqfU3wgy13KXHz+JoD2NjyuMaIDOy9JUPfubBQjz7NtG3VRw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjmuPuEBIHHBc8OSFVdTR7ndcxAJcoeddtNq2KUwKoTo2Ej3oR
	/lYEjijl/xJzOC8IBymvbziRX0clA3Vf6aC31V12r2O1D8NquRsED+h6ByigjMj1TxZkBaWCypm
	B3cYuDHJQIB2Z1PGQMpa4DXV0dQLy6yxIZLtyADpG
X-Gm-Gg: ASbGncvGuPN/RxTo0HnbqSY1j7gM4glDVlEc7Ds/GfsiDHWtSZhn2H6zegK8HoxtWhC
	F5hYkpSi9TyIVk5nnZMlIv+wIGV53HJkbrCZDZ/ebD/KfdaYJsZHHTl28Q/heZXaU2aRJJ9zvaK
	B4RXuPyXq3c4sxLdWez1piD3/WzYUBJeWGboxt+4oXuNmns2YAFtcJNBWV+jhioMLLUWaB9qI=
X-Google-Smtp-Source: AGHT+IHaodZ7cjZxka4kYXLWRNwy+L6ZA5R0dFAns+l+OcTvehr4dp6/Zj6PwThDq8GYu0h+vgakJDBlxyquvtCXU+0=
X-Received: by 2002:a05:6402:4496:b0:5e6:15d3:ffe7 with SMTP id
 4fb4d7f45d1cf-60e38a8846fmr277279a12.7.1751477038351; Wed, 02 Jul 2025
 10:23:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <68653927.a70a0220.3b7e22.245d.GAE@google.com> <366d45aea0b64cfc82c0988ae5fe6863bbd28261.camel@surriel.com>
 <CAG48ez2_4D17XMrEb7+5fwq0RFDFDCsY5OjTB7uaXEzdybxshA@mail.gmail.com> <f73e23f363b780a0e33e8b0ab7171a2128e16df6.camel@surriel.com>
In-Reply-To: <f73e23f363b780a0e33e8b0ab7171a2128e16df6.camel@surriel.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 2 Jul 2025 19:23:21 +0200
X-Gm-Features: Ac12FXyB9Anplx5cnMnTg4bBoj2Dn0cKAJJTQ19mkLrsyMhGVPsX59rV-enwtKw
Message-ID: <CAG48ez1DgJg0MvrdYy7xTeAbZG6mkiGRU=6vvEdvwos26bNsMA@mail.gmail.com>
Subject: Re: [syzbot] [kernel?] KASAN: slab-use-after-free Write in flush_tlb_func
To: Rik van Riel <riel@surriel.com>
Cc: syzbot <syzbot+084b6e5bc1016723a9c4@syzkaller.appspotmail.com>, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, linux-kernel@vger.kernel.org, 
	luto@kernel.org, mingo@redhat.com, neeraj.upadhyay@kernel.org, 
	paulmck@kernel.org, peterz@infradead.org, syzkaller-bugs@googlegroups.com, 
	tglx@linutronix.de, x86@kernel.org, yury.norov@gmail.com, 
	kernel-team <kernel-team@meta.com>, David Hildenbrand <david@redhat.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 7:17=E2=80=AFPM Rik van Riel <riel@surriel.com> wrot=
e:
> On Wed, 2025-07-02 at 18:53 +0200, Jann Horn wrote:
> > TLB flushes via IPIs on x86 are always synchronous, right?
> > flush_tlb_func is only referenced from native_flush_tlb_multi() in
> > calls to on_each_cpu_mask() (with wait=3Dtrue) or
> > on_each_cpu_cond_mask() (with wait=3D1).
> > So I think this is not an issue, unless you're claiming that we call
> > native_flush_tlb_multi() with an already-freed info->mm?
> >
> It looks like there are a least some cases where
> try_to_unmap() can call flush_tlb_range() with
> an mm that belongs to some other process.
>
> I don't know whether that is an issue.

try_to_unmap() relies on read-locking either the anon_vma (for
anonymous pages) or the address_space (for file pages) throughout the
entire rmap walk to ensure that the list of VMAs attached to the
anon_vma/address_space stays stable during the operation, which
guarantees that those VMAs can't go away, which guarantees that the
associated MMs can't go away.

If the caller passes in TTU_RMAP_LOCKED, they promise that they've
already taken care of this rmap locking; otherwise, rmap_walk() will
do it internally.
