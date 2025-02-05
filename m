Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7101921C19F
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 12:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738757434; cv=none; b=BNvc9shIyFscB12Uk8jQPos0FgEGJ7sCCpY+1GkDOvVjtY5hdOpsH4QQ9XweiRxaz0zS5SsaKHcrNgUPQFUBLvdYPDSjdbNV6B9c9mKO6w1ZaEYtDrjg3GKP772kjHipDMnOczcFpRzCU8zqaTc5E0PtJadt/d4ctoeSayF+q7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738757434; c=relaxed/simple;
	bh=LAJkZr3j590h9Mmjm3sT0QGmWd4n4HFqQNH1WXZZWwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=fP+r72BvsRL3P7BGOV/Q5X3ZDiU9vCYvuT9aCgpkLarXMczZNv7OSrtYneIlyxHFCnq0/RYYCb5hh9NIuL0AZ04U36mAv6uOmDie8vwrXjO/E7FxH6YMZgOllwO7uXYQSZtHV1JOO5l1f4K+mqqFgbTMilRKQJbEgdWZHx6t15Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZCTQDt1I; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZCTQDt1I"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38da586ef14so1232072f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 04:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738757430; x=1739362230; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CM9edJiBMXn21mPbe8Qk4uoLTtdcK1HokgiZWsmiPV8=;
        b=ZCTQDt1In4NJq11mC03sJj9DMXGt0nY6PiPfhI/cWLFLo3JXcOGBAWvO5yMENIY4iP
         26U63ac94q/Ce6AXuJ2Ox+iuAmgS6Fm4V0OoFEoRq3cWhFyFlCO2vscwm4+hHJ1jTj3q
         YFZBGT4EoWGWlKrGuaJ/0qIf3lFa2qkO74j1zevEMLQpTGapMjwcIn1YYiT6J875FfRS
         HBoONKCVX0VtQYdCgbiah+5Mc7z6MWijcKEANclXTnMPCykh5KQgM+iLAC1CdTikT7YR
         wf4CPAxEPXm/FoQfxSTKlkW79qm4nGeWa1R6nOjOVRGCLyYH5Z/LGMhDK4kpN6oh2X7L
         xiuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738757430; x=1739362230;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CM9edJiBMXn21mPbe8Qk4uoLTtdcK1HokgiZWsmiPV8=;
        b=sjA/Z72cL588Qvy48eRsfnGHmUROlY9kKj8FUxdARxjursuXiSD5+Ou44gdm43V9SE
         XtlGlfiWI0NnR5a60gCl5eTvUZhh1O+pKAScH2dGgbiVYJeTQj0Ijv+P+xSeD/BNuX2m
         SlgHJfIt461Rcj1iSvomWAw8rBMki8bzpQBV4quLQ45NMthUKoPDuI20f71xnvW+/D0r
         K1j3oZYDO+TQMM1CExtlPuiJpROuxAe6ll3NIzRktsf7MpJkdeU2Zw39wsVjVrFPYyZD
         FUC1q8F5xiC49DciTgV8T44gjnGhbsydiPjTVq98V8faT8OK34lpzrO00IoG7inYQ2cg
         MMtw==
X-Forwarded-Encrypted: i=1; AJvYcCV26nDreSdWjxrj7UOsaVH9ydNAuro2fL1nw9sSm/msJRbAwh4Bwr1DISA66aIpzYp/firNua06hCVar3c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+/DSeByiCSYRiDcNKhys4TJshN2nDbCILHOJmECAG+kNrWsNI
	28P5ktqWB/BC3rFp8C1qnSCKh8D2yzKTMeFoxCQP9CToWbwRwODCsbHyTubnRRpz9eAamI1C8Zb
	lmKv4g3RCSFxes2XiG1MoTF1NQsfV3yPMxU8y
X-Gm-Gg: ASbGncts08uyzh2Q8o1u+fPFSMzroX4c0P+9DCA0oX3tszKGIPEe8M/u+TqSySEgFok
	rTELeYU8rQC0RGVg+80K5Q+CMRyEQE9/zfwE30q07Oj/H9CIcAJXA9oK2vGypD3oMz8L9ZbtG8Z
	BKDZwjE1xfXfZk42Z1mKP/KGlb7iY=
X-Google-Smtp-Source: AGHT+IEJRX8Gawq5uTZWc7gghQE3VD3b5s1utE8n3fNb/Dxuk/7Rl4NYgvzDN4Jo2pf/N+jO5EMKYukFZfnclOVEP6g=
X-Received: by 2002:adf:fdc4:0:b0:385:fd07:85f4 with SMTP id
 ffacd0b85a97d-38db488960amr1453466f8f.31.1738757429509; Wed, 05 Feb 2025
 04:10:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203-vma-v13-0-2b998268a396@google.com> <20250203-vma-v13-2-2b998268a396@google.com>
 <r5xkc2i3tk4za3xkrrvbeqto4kf5l425ursytc3n6tmcy2gylb@eusudybb5dqa>
 <CAH5fLgj00hRAEBvNc8RR8iBwKQ2okDqmWWQ+kqmNkr9mOjfU0w@mail.gmail.com>
 <ymjkf2l2otosunrs3e3mmsj2wr3tvrfmgl4aav5dcpm3gtdulh@dzz4njdwkspc>
 <CAH5fLggd75BvB6VXPjR=_jxn1u7kOfix2rynvMHU4CeUUDHnVA@mail.gmail.com> <ebwiebbxomsjamv2uk6gnpg2uzjpqw25llvcz7njadklfi66nk@ab5uyq4bvwlb>
In-Reply-To: <ebwiebbxomsjamv2uk6gnpg2uzjpqw25llvcz7njadklfi66nk@ab5uyq4bvwlb>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 5 Feb 2025 13:10:16 +0100
X-Gm-Features: AWEUYZlj_xoYsvNCca0RfpQ0eQ7nYggzNeG2vXSDC6JyOIm_4a-qi1ks5bLCsaM
Message-ID: <CAH5fLgh2Y0rG5ntpdiK-ycn9eBvrSXekxPsjDaYWuHBDUYNppw@mail.gmail.com>
Subject: Re: [PATCH v13 2/8] mm: rust: add vm_area_struct methods that require
 read access
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Alice Ryhl <aliceryhl@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 4:46=E2=80=AFPM Liam R. Howlett <Liam.Howlett@oracle=
.com> wrote:
> > > > > > +        let vma =3D unsafe { bindings::vma_lookup(self.mm.as_r=
aw(), vma_addr) };
> > > > > > +
> > > > > > +        if vma.is_null() {
> > > > > > +            None
> > > > > > +        } else {
> > > > > > +            // SAFETY: We just checked that a vma was found, s=
o the pointer is valid. Furthermore,
> > > > > > +            // the returned area will borrow from this read lo=
ck guard, so it can only be used
> > > > > > +            // while the mmap read lock is still held.
> > > > >
> > > > > So We have complicated the locking of the vmas with rcu and per-v=
ma
> > > > > locking recently.  We are now able to look up and use a vma under=
 the
> > > > > rcu read lock.  Does this translate to rust model?
> > > > >
> > > > > I believe this is true in recent version of binder as well?
> > > >
> > > > Yes. The safety requirements of VmAreaRef is that you must hold the
> > > > mmap read lock *or* the vma read lock while you have a VmAreaRef
> > > > reference. This particular method achieves that requirement by hold=
ing
> > > > the mmap read lock. But there is also a Rust lock_vma_under_rcu(), =
see
> > > > patch 4 for that.
> > >
> > > Right, okay.  Thanks.  You can get the reference by only holding the =
rcu
> > > read lock, but you should hold the vma lock to ensure that the vma
> > > itself (and not just the pointer) is safe to use.
> >
> > Hmm... To modify the vma, you must hold the mmap *and* vma write lock,
> > so holding the mmap read lock prevents mutations?
>
> Sorry, I think I confused things with my answer.  Your code is fine.
> The phrasing of the "only be used while the mmap read lock is still
> held" made me wonder about further clarification on the locking here
> (because the locking is confusing).
>
> Yes, mmap read lock means there are no writers that can modify the vma.
> Essentially, you are using the lock to ensure the entire vma space isn't
> changed during your operation - which is heavier than just locking one
> vma.

I could extend the safety comment like this:

SAFETY: We just checked that a vma was found, so the pointer is valid.
Furthermore, the returned area will borrow from this read lock guard,
so it can only be used while the mmap read lock is still held. This
ensures that there are no writers because writers must hold both the
mmap and vma write lock.

Alice
