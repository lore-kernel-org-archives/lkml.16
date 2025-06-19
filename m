Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023381E8342
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750344257; cv=none; b=gF1NcR1lWqU7Gu2GjhZB/2LkSaEWBzUQyyjnvQkYdXfRds0MsejDYcYh3X7AyKR1cmGbLynXkqtyYj3bXqCaMc7ow8b/8gsKrq+5tyFBH2xc8yAZh7uX4MIxY6Bu7KzOY6gSCb8nnHacKZk9Y5fCC46e3B3KstyeThZEh60jKFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750344257; c=relaxed/simple;
	bh=XcwXvx+KTKGOkOisPCG0xqUIuO+jeGgpgekvwvZ5tBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YWTlLgCcuydqvyCzvyvf5nR/fEdrdXXke0dYjxJInNUIa+9STRTD/QgHkBGktlXQhq0mH1bQrR6Vmb/tTihoTRitugdCKl8MU1N8Z42Gi1K7Jwccg9hbe+rzSo2NYfHIHrCVyVH8dBBQwzicwsa+nSzDYuLNIYjcxU7PGATDTJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cCZjNDD3; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cCZjNDD3"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a582e09144so636469f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750344254; x=1750949054; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EVMqsQRe9rYHlObyTkfPf+JCwJJxn0mjlS9ZABuzrNY=;
        b=cCZjNDD3UyjYmG8rqZlmfVV/6kHzInqQg5Sh3YZx+MIwkSGPoj5I0KApQYYxXHtRin
         CzZTLcXX43+rZ6Qma1GTvYc5cyevOA3d3+zz1wBt8YdN2icC6eFmqKl0giwvZd/xpxzV
         9GhzIW+F15bW2ZuEeh34qaO996ZkuzSTz3pPGpRsXvl/D6X0ySjt4TphnLxnRWRKhqVh
         RVm8qG+18ZkERbgePQnhrmfoxXeI3//rCLrJiNc52CwUqdcJ91bm4CxGDE/3Pu2jCrUg
         V5Gq4GKOgAtbvGxnUg+i0G167Apmo75/XXSljPGiur/S/c6S6Rz263hiA5ldo+Vq72kr
         KV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750344254; x=1750949054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EVMqsQRe9rYHlObyTkfPf+JCwJJxn0mjlS9ZABuzrNY=;
        b=gzfcH+UAYC7ggCBRsY+OYV78VlJTGky+IiCusWDC0EANTHQ7jXIVyOxza9T5/GIv33
         StNOD67/qMyfebDDWPQYVi3X3bf7qlXoxcyX1z5JhVMgys/Sa3rx+hlm4253lMAh4Ikd
         SPWp/zTzqZCdjUmuvd9GFJoiu5Aw/hqmefcdP9cVCBGfB8NdyLVS44U0f0MO08QmP9qC
         c8RC/GHSV3LYh37LDs3ODMI+eI0O6lhTm6u2yJ+PoD6wAoQCYVwJJ8eI/sUol+m9+gVv
         Fky5rwCQcdBs2atFkg5Q8YpEZ4jt12Qkvh706dXJy7pO5oFfk+J5yZQZ3QI6nPQansDD
         eKAw==
X-Forwarded-Encrypted: i=1; AJvYcCURkXppjmQjVFBFj1/sT21m+3tGDrokQU99T1d/RKwXOwzUwiiDIpdaxEhXlNVSaWrt3OU9YrfjHNWuPYs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv5mttsByh2YbkChe6ywNpLKBUzTdMKCdafHnKP+cwQfcEU+H0
	dL26Y1mg3R1PhqD9jAqKyEesG39DjqXRTNuOtFl2B/4IWMyzuj7sdG4YR0We/yO09FGDou3wyNL
	7pUtQgCel9bYpZrcS+s5SU7b8AVQsvsmZFay9Rsgz
X-Gm-Gg: ASbGncs3Wol1MX7Ks5dhpT2XoAYZuzsMI6Zz2+cIrzIuwew/2izAR8vunrG3M8Kt/hK
	6K9BWh3jMacw603cRpKypjAD9JzooNPpPTAznUkWPRDhJFZ8J5XFJWR5hoOS+IPXEAaK1UGXR0d
	rbdGtTcyBJWwZ9aJpwqVRD2KYaBHR84RSlTKyWRsQM32ReeXt1U/pjM68rqmYPoYT7/vlzadP1o
	YrtqW1ReSXg
X-Google-Smtp-Source: AGHT+IFolUKIJpNOwvo6YbqeRvkbUyZ0UB57Cu3isdwLbs+TzWq4hnGEeJOT+f//vxWUlBfYnyXOTLlhgASVn3iykHg=
X-Received: by 2002:a05:6000:290c:b0:3a4:f35b:d016 with SMTP id
 ffacd0b85a97d-3a572367993mr16248379f8f.11.1750344254287; Thu, 19 Jun 2025
 07:44:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619140656.498-1-work@onurozkan.dev> <20250619141401.GI1613376@noisy.programming.kicks-ass.net>
 <20250619173344.6c72c48a@nimda.home>
In-Reply-To: <20250619173344.6c72c48a@nimda.home>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 19 Jun 2025 16:44:01 +0200
X-Gm-Features: Ac12FXymE55CREO4hachgxG9Df6IxIrwgv1201IJaKd3lfeHyLxcVoX1imNXr3s
Message-ID: <CAH5fLggxqK+aZcynsq0koWZG5DD=Byc+DrqEZ9ZCr4+pdScMqQ@mail.gmail.com>
Subject: Re: [PATCH V3] implement `ww_mutex` abstraction for the Rust tree
To: Onur <work@onurozkan.dev>
Cc: Peter Zijlstra <peterz@infradead.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, will@kernel.org, 
	boqun.feng@gmail.com, longman@redhat.com, ojeda@kernel.org, 
	alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	thatslyude@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 4:33=E2=80=AFPM Onur <work@onurozkan.dev> wrote:
>
> On Thu, 19 Jun 2025 16:14:01 +0200
> Peter Zijlstra <peterz@infradead.org> wrote:
>
> > On Thu, Jun 19, 2025 at 05:06:56PM +0300, Onur =C3=96zkan wrote:
> > > +bool rust_helper_ww_mutex_is_locked(struct ww_mutex *lock)
> > > +{
> > > +   return ww_mutex_is_locked(lock);
> > > +}
> >
> > Do we really need this? In general I dislike all the _is_locked()
> > functions and would ideally like to remove them.
> >
> > Pretty much the only useful pattern for any of the _is_locked()
> > functions is:
> >
> >   WARN_ON_ONCE(!foo_is_locked(&foo));
> >
> > Any other use is dodgy as heck.
> >
> >
>
> It's an abstraction of `ww_mutex_is_locked`. Since this is an
> abstraction module, as long as `ww_mutex_is_locked` exists I think
> we should keep it. FWIW it's also quite useful for tests.

We're not just adding copies of all of the C methods - instead we
focus on the things we have a use-case for. If you're using them in
tests, then that could make sense, but otherwise you shouldn't add
them.

Alice
