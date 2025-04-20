Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569761BD9F0;
	Sun, 20 Apr 2025 19:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745178527; cv=none; b=mBcJK8Q9XQ7wSPVjv4d5sSLc0AuhEUDmjecJhfDTWKkXyCGG4tL1sweiGXPzscb/j7lArB3lQmYBZzTRJpFzLEhkHg5ozYysWtNSoeM2d55C4u6bDGudExHnCjeqXEy8esRMeSN08v53Ig+zhf/rT1BwrYawbrFYDwA3yjGCboI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745178527; c=relaxed/simple;
	bh=rrMYwMnlrmdWpZrJ4kdBxP9ePBTeqAF3k4w/V3+8Kfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WYGQ05SlwCYuVWhn/LbrBKxTEvkDLNpMs3A2J4AAWaOrkAoa6HVoLf4egzZOD1A6voXQNIWn+W+DakFJW1Ihu/NFkm9T04dtLs6dqPoy3lEtExkLrssZU41cF8Xhh9/E1omIl3VIOSHsp5Te7Ey3o+eJkgR/YgvL2PEBLSysgAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SkkIS8p/; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SkkIS8p/"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3032a9c7cfeso407920a91.1;
        Sun, 20 Apr 2025 12:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745178525; x=1745783325; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRibRGPlM/02qOR9HcoY4oCMNCshfk4pYbOUB71XnBA=;
        b=SkkIS8p/ms/qFKcgTWTZXMRnyZjz2wmssWpbSjvfZKGKcfOAv5rW4/hNzBeWl/rHPs
         gPVoMXofpeYkl7pAs5R0N7RS3fsKPhm+ff8LXJtcl3k6d5OUr4TOd7vzKxkj+OhuJQIG
         7a6E5+RR+N7XiroA9S+L6rB9WQeSVco07fAATI9m4l36p+yobRlYz+W+DcrKxvrNohzB
         tf1ZNZqTCMJIsjDo+vZuSBq4mLrDYsbG9qnRQQnvhb9fl2m6n4MU91CcBPgk4IRNP57S
         AWsTE2oB5HrPJWrUTnRtzcpYsokXFM8RALwfHSyg0CrUTmS0NdHFzIwS8AUk0wNCV3Xx
         numg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745178525; x=1745783325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRibRGPlM/02qOR9HcoY4oCMNCshfk4pYbOUB71XnBA=;
        b=Mx2ddkd8p/XS5p8GL1z9icjwB6aKeOyBgx1vExX5qpoztC+s8GCam8+ialFyyjvHnn
         cEYqa2KNTSdCWD111M4zWSm/cZVEU2kWYVE3sDR2M/2WB4+QtexKYhdmaN8ZAcXHkGJx
         BESuhUkgJ67uprLXVc74ngWAQ6sLa/WbKxGJ0mzVugX5AOjcWIggxJHD+5/pmQ2wdH21
         Nnz/bYuXngMXxSKyKDGFOsSWga02PmC5ep/4eITbQNOl1zXSaU+8di7uLRYu8YGtF6Sq
         gdj6tng9AwcSadpRs2bRJE9g/uZZljwuKfne0IbKCh7wC0xEVSuzqT0eEulCqv5PjdDD
         QfoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfymfr4/xIDiaGPSUDtZlPGJq1PSYX3b6ZCI10Up+LX8jhUNL6JutBeCLvBcs1C4KKLrunxGFrlSWCwT4=@vger.kernel.org, AJvYcCW8poDygNcGE6NtF+0XV9kCV5pxVZ1wd7zatRs8hvcYZ5vm1l/6PdznE/B3Gwii2mn6Co340AIF36GxXA8c+UE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrlXzTG7WF2eEwkXnSpzwfraUagXLvQ1IH6LmuGardzL8Y2QY0
	5FMFwsH1fdDUhKWqE8pKOCaC/Hlr0AbKcWABUGrgst1vatD6jRqyLo4k6mnZ6Yd5hW+4se439v2
	nmdoPSH1R5d1MDWkq8JQadHyuh4c=
X-Gm-Gg: ASbGncuvIRSqhrE5wdtjj8g8ktVoeRo1V8ZiwYpIdm4CRG58A9WPU/GkFxLbHdW2YRD
	lv2Wu7n3SB2JPF++f1T6mUPXdI+SazuQ9U1YLO6iJEL+1iHmxIyjqcYrt4QsPdhAEk2jaCCCNCY
	fPG2JsOnvL/g6jnYBqqfex9Q==
X-Google-Smtp-Source: AGHT+IHUf8MxGXvEMHQggz21sFqv2EdwY+ocyAL74RdwapFcFoaxWiIRVtxfetoljJK98wYSr1Ymf/+7P2Akzd1KQWA=
X-Received: by 2002:a17:90b:3b8d:b0:2fe:b77a:2eba with SMTP id
 98e67ed59e1d1-3087bb426aemr5723618a91.1.1745178525504; Sun, 20 Apr 2025
 12:48:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250420184700.47144-1-contact@arnaud-lcm.com>
In-Reply-To: <20250420184700.47144-1-contact@arnaud-lcm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 20 Apr 2025 21:48:33 +0200
X-Gm-Features: ATxdqUHcVK0N1mNr_8KS6bGNiAiT-Za3XXwOOGYlTUvAwClu7WSCO2gTmQysaCg
Message-ID: <CANiq72k4RJw3YENvQj5Q7LCG-v+nhZs=QhVa1AthUfZUoHmYdA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] checkpatch.pl: Add warning for // comments on
 private Rust items
To: Arnaud Lecomte <contact@arnaud-lcm.com>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 20, 2025 at 8:47=E2=80=AFPM Arnaud Lecomte <contact@arnaud-lcm.=
com> wrote:
>
> The Rust-for-Linux project currently lacks enforcement of documentation f=
or private Rust items,
> as highlighted in https://github.com/Rust-for-Linux/linux/issues/1157.
> While rustc already lints missing documentation for public items, private=
 items remain unchecked.
> This patch series aims to close that gap by ensuring proper documentation=
 practices
> for private Rust items in the kernel.

To clarify, it is not that we want to enforce all private items to
have documentation, but rather to catch the odd `//` comment that was
supposed to be documentation. (The background here seems to imply the
former.)

> // Improper doc comment for a private function. - should trigger
> fn test() -> u32 {

Since this is just a `checkpatch.pl` warning, it may be fine to always
warn, i.e. the submitter can always decide if it is a false positive
or not -- I hope it does not become too annoying :)

(That is why the issue mentioned perhaps using some heuristics to decide).

> WARNING: Consider using `///` for private item documentation (line 33)

This text seems fine to me, although I wonder if newcomers to Rust may
just transform it into `///` when seeing this warning, i.e. the
opposite mistake. Perhaps we can make it more "conditional" (even if
the "Consider" is already there), e.g.

    Consider using `///` if this comment was intended as documentation

> To: Nathan Chancellor <nathan@kernel.org>
> To: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
> To: Bill Wendling <morbo@google.com>
> To: Justin Stitt <justinstitt@google.com>
> Cc: llvm@lists.linux.dev

Should the LLVM subsystem be Cc'd?

Thanks for the patches!

Cheers,
Miguel
