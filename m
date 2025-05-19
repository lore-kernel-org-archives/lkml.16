Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B008215F5C
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 20:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747687939; cv=none; b=l2sZpEdqqzYFh+33iMPtHoPU4v8qApwzBABenCOGydJOKO08Pj5MlSoickgmadM/AwIOVoKqUbb3O5htMfHCmf+vk3vTzrdBlHpg4YGxv5qqYom+tZflcCiqAz3Gkunn4pYS7mNoJSTXwkoNavtKjdouJVIv3+r9fjkJ914gPrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747687939; c=relaxed/simple;
	bh=gotcqngVU/LNJrmk3BD7vjAbx35qGYtgx6w9I0sm2iM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M2EfMMGB1bfrSd1eVnhGfWdw6l8ZNqWJQ1ZliQb5PArqZuGkFrfnqYQ9agNv86vCYNU6YzABEqwTE0TiOvS3hcH7vFOM3th+b63NfxGIhW/1u3u29diVws1WYSWCQwYR9QrQ8BJ10+qyubPOhelhRnD5qhQrmBHcwkuU7Bw1UZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JQSVDob+; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JQSVDob+"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-231f37e114eso524155ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 13:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747687937; x=1748292737; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OIiiqJ1mq9rZeGtSY2YNeLL5YQTHcmPfr7M6A0TZvU0=;
        b=JQSVDob+80I+UwecKk4nVlrMKhK/JY2SI6BE9gzqU46mGZ78YUIOStmJvHxwJIpAiy
         dGTpZdI442S6LTyR/atNJR3zkKQX8R65OmwS+Y1deCiHGIivo95nMfJd3y3gOt9ESOow
         GWwTaOu7/sjqiPN9G1Ni713v5OSP0BpLkeokjLA0zQ6L7dIMZmg7bwcrYEhpywU7YkgR
         eschxmfoIOuDqeWdXEUrHZV4D5zYNKIS9QR9O6eniUUG5iTAxqI9BMUwCkNFXaYWnl0/
         1SHQn3ho9cnrILVGuZgby/J0jNC1fH825MTvFOu5yGKLDyNJD5v6mtPtwh/fCcxvsMdw
         w6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747687937; x=1748292737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OIiiqJ1mq9rZeGtSY2YNeLL5YQTHcmPfr7M6A0TZvU0=;
        b=iXSGsSLCc8SvjN7G7x6tcPQqAhb1O5I7Qze4QnGHRm7+s0v5Z8kiaOpPzOmreRYDER
         XMdHG+3Sx8EyRhUQWpLVkOzY3nu3Z/dEUCG73d8v4mavib+vrT52a2eAvEYd6XSfLx3O
         UiZg9+LLJsBmMTUKDL7SpoFyithHq7SlW7U27S1L0QUWh6hr8dWzpl7tBjOjsJTaCE1O
         8cLBBHx2xKr8fERKdEyCmrRKLFJJwSU3HcCyzmvgXa9YO9cwEacmQ12fjnheSPbO3Vaf
         AeWS7WycnNPVfuZdFpuGnHR73TY/fOQ7Aqqlfr/H0TV7Q3aD+W43WjV6dqN8+ArHd0wl
         hEOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJ4tioL6rhwLKSheWHWUAYbcjEJAMdlFzJYeWSgbkFBrmo0XCpXf08GManQsYxh2mijrg6NWzOxHgvpEc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlJV7YUeyYZKUO3Z2FzOK//x30ym3XbPk4B0Wq/HAGK8s8SpGB
	INYAIbLZd0njutfl+C3PY1Wj5eXMSPP3DAwl+2cMxPNhCnm3jN/9UQa35yfVLNGwkg08m2FWLcl
	ZJZKHwjsrYVngPbBvRpdeM65xNJYRiXQcUWKub0Yc
X-Gm-Gg: ASbGncsXds1BxbaE+BOiTzHhXrpD5nC8KRc90Nn3vs7QwTYEdbwJLToUDHcR1kEP/S/
	1WCVuo6/EQAj9w4F0+FEE+elMELT8ihXkz6cmqWTrNpIf4dqKvh+QLhK5uT2Vs2TfTkMy6O9Lbi
	82h1RAhr+hinAxE9HbSWVwIWvA81CW2EKX/bKi/7FpmXf7n9V1vo5qEb7+st0=
X-Google-Smtp-Source: AGHT+IGxZCvW5ilyWe4G2aJ3s73rSdZKGMvO3ZakFJUNOl2mQD609UI/QNd6ant0eUVyMVuoIqykCtNvIgjuCK3LvWk=
X-Received: by 2002:a17:902:eccb:b0:223:ff93:322f with SMTP id
 d9443c01a7336-231ffd192c0mr5758425ad.2.1747687936496; Mon, 19 May 2025
 13:52:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519161712.2609395-1-bqe@google.com> <20250519161712.2609395-4-bqe@google.com>
 <aCt23djKOzUiP9L4@yury> <CACQBu=XQ9QrHwzfXZiJf6-uSLTucpr2k=BwRhrDCkVA3wX7-ug@mail.gmail.com>
In-Reply-To: <CACQBu=XQ9QrHwzfXZiJf6-uSLTucpr2k=BwRhrDCkVA3wX7-ug@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Mon, 19 May 2025 22:51:38 +0200
X-Gm-Features: AX0GCFvywXFtRKxlB3xYrJMhJn5q7nT3YMayIgLVBsF9n18XEC45GTPOn8bRz1I
Message-ID: <CAG48ez1NM7B8Vk7GOwhsitCipmfHi9eK6JNb3ve8aR4m8Cj0gA@mail.gmail.com>
Subject: Re: [PATCH v8 3/5] rust: add bitmap API.
To: Burak Emir <bqe@google.com>
Cc: Yury Norov <yury.norov@gmail.com>, Kees Cook <kees@kernel.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 10:42=E2=80=AFPM Burak Emir <bqe@google.com> wrote:
> On Mon, May 19, 2025 at 8:22=E2=80=AFPM Yury Norov <yury.norov@gmail.com>=
 wrote:
> > On Mon, May 19, 2025 at 04:17:03PM +0000, Burak Emir wrote:
> > > +    /// Set bit with index `index`.
> > > +    ///
> > > +    /// ATTENTION: `set_bit` is non-atomic, which differs from the n=
aming
> > > +    /// convention in C code. The corresponding C function is `__set=
_bit`.
> > > +    ///
> > > +    /// # Panics
> > > +    ///
> > > +    /// Panics if `index` is greater than or equal to `self.nbits`.
> > > +    #[inline]
> > > +    pub fn set_bit(&mut self, index: usize) {
> > > +        assert!(
> > > +            index < self.nbits,
> > > +            "Bit `index` must be < {}, was {}",
> > > +            self.nbits,
> > > +            index
> > > +        );
> >
> > Shouldn't this assertion be protected with hardening too? I already
> > said that: panicking on  out-of-boundary access with hardening
> > disabled is a wrong way to go.
>
> I considered it, but could not convince myself that __set_bit etc are
> actually always safe.
> For the methods that have the hardening assert, I was sure, but for
> this one, not.
>
> Are all bit ops guaranteed to handle out-of-bounds gracefully?
>
> > Can you turn your bitmap_hardening_assert() to just bitmap_assert(),
> > which panics only if hardening is enabled, and otherwise just prints
> > error with pr_err()?
>
> If there is no risk of undefined behavior, then I agree that checking
> bounds is hardening.
> If a missing bounds check loses safety, we then we should not skip it.

There are no bounds checks in these C APIs, and there can't be,
because the C side does not store a length. bitmap_zalloc() just gives
you a raw array of bits (represented in C as an array of unsigned
longs), it's a very lightweight wrapper around kmalloc_array().

And if you expand __set_bit(nr, addr), you'll see that it turns into:

bitop(___set_bit, nr, addr)

which turns into:

((__builtin_constant_p(nr) &&
  __builtin_constant_p((uintptr_t)(addr) !=3D (uintptr_t)NULL) &&
  (uintptr_t)(addr) !=3D (uintptr_t)NULL &&
  __builtin_constant_p(*(const unsigned long *)(addr))) ?
const___set_bit(nr, addr) : ___set_bit(nr, addr))

which (assuming a non-constant index) is:

___set_bit(nr, addr)

which is a debug-instrumented wrapper around

arch___set_bit(nr, addr)

which just leads to a raw assembly instruction (example from x86):

static __always_inline void
arch___set_bit(unsigned long nr, volatile unsigned long *addr)
{
    asm volatile(__ASM_SIZE(bts) " %1,%0" : : ADDR, "Ir" (nr) : "memory");
}
