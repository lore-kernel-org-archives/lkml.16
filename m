Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9F670838
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747154601; cv=none; b=WrOPlNcqfGqDS0rhpMjBsqLstEwykOANQ/UKXx/VLPY5rWuNNhgwUi73nXdb2CIPkcMuGzs8Xpg2gLiz3Q7eweawRPnj1/WtcGJ5kOoWjIKqbJm+ls4nnm7pT6QXT9Iip1o/QMXVWiVoQh8sAlQAchl6SFXhQ6W2lYC6wnNYcm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747154601; c=relaxed/simple;
	bh=+W4TV0sTX95v75nkcscF8K+yngw5GjXkV9rhsDRFnu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SJaJbqdg0TIgwEJbk9nxo0fKfLg9zxSQe3saAAiMznJtZyoAShx5azGrtJkGnw6yTTowUAKe78jy21OtFehHgr7/sX5BsplHt4dJscdVyKqV9wPJNhxzmKjK0zornv9ER2xg7RGyZyUmEvcQOAmQCG1w/pSmtxfGLAGySv42w6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=x/J5RWCg; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x/J5RWCg"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso50a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747154598; x=1747759398; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=heTvZeZKBDMFCc+tl4VLXOpKgOKmSz4ZD8f3fu37cZM=;
        b=x/J5RWCgY19OdxPCn/8lfRBI/gJmAscR2tJPOg1NJwn4qgNIxTppKlyRxHvNzFuWcX
         u7CUYlOZO/oTQLEe2FSp8eCXeeA4BP7RBE7J/FjWbf7/b/rz2L9SLPEcAP5BR+SdS9FQ
         Dlm2EY11oFu8Cacv0avnE7/jk50H0iRuAgXSykGstv163X8RvA9iaiJVbUx4jqkM8xA0
         Q7ZD8hVMPA9hSIyAiYhvUm0SoiO8um6A0fAkJjKqyFM96zO3N9WKaZJcLVednjHcAE8d
         TsvujITqwlkPfXa2pdV6ygwNaCcNvCd2K9PaeK4iuG5zKRRK3r0hVBqiOxsNnhMXieAL
         9LBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747154598; x=1747759398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=heTvZeZKBDMFCc+tl4VLXOpKgOKmSz4ZD8f3fu37cZM=;
        b=nRTuwrrmUWYd+QqXzbcvs1kFWdKheFoSRwvMbd0LcekmgRgcQy18TmSkHOuROzZ4U9
         LmFMdXtsobfSbgk9B8P9GiADq1Eo+upzS9beryQnOYgOQIL6orW3adbBYZrcZW2FHbxY
         3C9/C0mX96Glo0u6tj1WIxMO5ZAn+nS1LY8wqUWR5qn31UO3CVxy0VWpZnqhj8yay7Le
         rYrFpEh7LTmdWHrgxPTlCX07903MJnRotWWpzBLshIhUyo+f7nsnLF/JkjMh0u2LBGhl
         g2xKq84qli3RIRSd4DukejhextB+oe6pfnHH0/btKIwA9QPkFprMW7zILpa8cDTK1ILZ
         BHdw==
X-Forwarded-Encrypted: i=1; AJvYcCVclQChGJjkzeP63VTRfMFoo/+G8o1Igj5bvUS0vHGV2jvN7p/GgmKqSKA9r3tihrq0q60yS7jukQpi8PI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyWRQ3J4lDfeAnHbwavRkk/PlrUv76QVnBCjbiqwR4Jg7imUr9
	XCOMjTE9V6hpd22Ftjo2shxF4ufROu5xIWPddAwZtSQaM5f/rMsEaCLyaJKW/eHMPtr45f8O/YV
	Rl+a3yV5LH5utb3U/zkHxokFm2CcwdP4DFG/UUjsf
X-Gm-Gg: ASbGncsjIsnCdPzM0l9FhYLE1mWvM5JxSnmXSWroV8KAmG0rB7aQS98m9mpqSTuGiLF
	mVHzpMVEhwUpLSNKozE8wKN4iqCS4pHTl+DPRTnUZId6xYVotiJxXAb75OHkdQXK4shk5s0EdX4
	VPULgjTrDn8HvqKHdqvMcqLTUo0AbBSZzOp+mUbz8t5Zprt1zDYOS7mbiOI4f5
X-Google-Smtp-Source: AGHT+IFeEf+wYDiQSLYXA8vSEx5H+GjNIVfh7GSbHCZEImJ0hwAtol1+2PH0Y5WNR8LdkXYys4dD0Jo0Elwhr8KUVVA=
X-Received: by 2002:a05:6402:b2e:b0:5fd:2041:88f7 with SMTP id
 4fb4d7f45d1cf-5ff2a33cf76mr130110a12.2.1747154597587; Tue, 13 May 2025
 09:43:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6819bfbb.050a0220.a19a9.0007.GAE@google.com> <CAG48ez2pOt_Zf28CnLbVCzo1uBhWfqUjgh4fzDaQo+qceM6kSQ@mail.gmail.com>
 <CAG48ez1BGFn7jw+FYZJxRyyjnR+rrqx1AtNQoR_Jup3tZ-dADQ@mail.gmail.com> <CANpmjNP7Ktjq3gUGKqQKgn1tbNZLj2ALRNvF-ZcERZ42KRD6Aw@mail.gmail.com>
In-Reply-To: <CANpmjNP7Ktjq3gUGKqQKgn1tbNZLj2ALRNvF-ZcERZ42KRD6Aw@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 13 May 2025 18:42:41 +0200
X-Gm-Features: AX0GCFtCpxRj54oeo16LCjjTC2SyZKIbrjHlloWMXBSOgMNNMebHrFeou52UKTI
Message-ID: <CAG48ez2_u9F5YX9TNyLACyzyGq=sK8YTH+nOdPe4f4DZumLYNg@mail.gmail.com>
Subject: Re: [syzbot] [mm?] KCSAN: data-race in copy_page_from_iter_atomic / pagecache_isize_extended
To: Marco Elver <elver@google.com>
Cc: syzkaller <syzkaller@googlegroups.com>, 
	syzbot <syzbot+189d4742d07e937d68ea@syzkaller.appspotmail.com>, 
	akpm@linux-foundation.org, baolin.wang@linux.alibaba.com, hughd@google.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 10:52=E2=80=AFPM Marco Elver <elver@google.com> wro=
te:
> On Mon, 12 May 2025 at 20:33, 'Jann Horn' via syzkaller-bugs
> <syzkaller-bugs@googlegroups.com> wrote:
> >
> > On Mon, May 12, 2025 at 7:44=E2=80=AFPM Jann Horn <jannh@google.com> wr=
ote:
> > > On Tue, May 6, 2025 at 9:52=E2=80=AFAM syzbot
> > > <syzbot+189d4742d07e937d68ea@syzkaller.appspotmail.com> wrote:
> > > > HEAD commit:    01f95500a162 Merge tag 'uml-for-linux-6.15-rc6' of =
git://g..
> > > > git tree:       upstream
> > > > console output: https://syzkaller.appspot.com/x/log.txt?x=3D17abbb6=
8580000
> > > > kernel config:  https://syzkaller.appspot.com/x/.config?x=3D6154604=
431d9aaf9
> > > > dashboard link: https://syzkaller.appspot.com/bug?extid=3D189d4742d=
07e937d68ea
> > > > compiler:       Debian clang version 20.1.2 (++20250402124445+58df0=
ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
> > > [...]
> > > > IMPORTANT: if you fix the issue, please add the following tag to th=
e commit:
> > > > Reported-by: syzbot+189d4742d07e937d68ea@syzkaller.appspotmail.com
> > > >
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > BUG: KCSAN: data-race in copy_page_from_iter_atomic / pagecache_isi=
ze_extended
> > >
> > > I think this is a problem with the KCSAN implementation.
> > >
> > > This is a race between writing to a userspace-owned page and reading
> > > from a userspace-owned page.
> > >
> > > This kind of pattern should be fairly trivial to trigger: If userspac=
e
> > > tells the kernel to read from a GUP'd page or pagecache on one thread=
,
> > > and simultaneously tells the kernel to write to the same page on
> > > another thread, we'll get a data race. This is not really a kernel
> > > data race; it is more like a userspace race whose memory accesses
> > > happen to go through the kernel.
> > >
> > > So I think the fix would be for KCSAN to ignore anything in such
> > > pages. The hard part is, I'm not sure how to tell what kind of page
> > > we're dealing with from the kernel, some MM people might know...
> >
> > Or alternatively, if we really do want data_race() operations around
> > any memset() or memcpy() on userspace-controlled pages, I guess we'd
> > have to pepper a lot of those around the kernel.
> >
> > Also, I didn't really think about some of what I wrote here - we
> > certainly wouldn't want to ignore unannotated accesses to some struct
> > located in pagecache that userspace can concurrently write to.
> >
> > Maybe it would actually make sense to do the opposite of what I said
> > to some extent, special-case userspace-mapped pages such that KCSAN
> > _always_ alerts on plain access to them...
> >
> > > distinguishing normal pagecache/anon pages from other pages might be
> > > doable, but I guess it probably gets hard when thinking about
> > > driver-allocated pages that were mapped into userspace vs
> > > driver-allocated pages that are used internally in the driver...
>
> There have been cases where user space was doing something unsafe, and
> KCSAN caught it. While technically it's user space's bug to keep,
> KCSAN is still telling us something's wrong here.
>
> In the past we'd just ignore these bugs (never release them from
> syzbot), but I think we recently changed the rules for some of these
> to be sent to the mailing list. They can safely be ignored if deemed
> "user space is doing something stupid".
>
> I do think we want to surface such issues in one-off testing
> scenarios. However, in the fuzzing/CI context it's not so helpful, so
> we might need a way to suppress them. If there's a way to tell by
> looking at the stacktrace, we could teach syzbot to ignore such data
> races entirely.

Hmm. I think it probably requires a kernel config flag then, I don't
think you can easily filter by stacktrace. In fuzzing builds you could
maybe do some basic checks on the folio to see if it's pagecache, an
anon folio, or a folio mapped into userspace... that would filter out
_most_ but not all cases.
