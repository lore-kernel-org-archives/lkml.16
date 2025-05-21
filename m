Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2530326AE4;
	Wed, 21 May 2025 13:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747835133; cv=none; b=jtzlGd8+u1Rp/DGb2T9czOEMG8vgQdcFoukt8gBIKPuPuhziADkSvEasVSl9Ay/a32WFh0YnYrkBdCBvg3iaRssx++VjVDf37Y9Aduh0CE4hji2BCu4iQnJ8faAC44X7LuWkjgsOnPc21ICLdEyzkR4/2kUZkX/0rtav4xLXpUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747835133; c=relaxed/simple;
	bh=FxQfM36iuvDamyyfqC0jliSjTLRBVIUW69BqTmz6h/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=txi4ULV+2X6ATJcdZBhd4vO877H6JYrivFWSWNYA8/TAR4zhlnbselkkDLsCZ2hnmoyfPfhQCXQH2bOgBMTCB6nmdtgFKL1BjcO1RDCOscV+Oaam/ahmIjTsDYWztT3yD3qP779hxu79wx5jLe7uKvz5AZg3OdM+wcgqJYrNx+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LWtJfAFz; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LWtJfAFz"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22e17b7173bso4483925ad.3;
        Wed, 21 May 2025 06:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747835131; x=1748439931; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tqeO+b0MwZruALSzGBi/axWBZuamPPMaMT8p8zPZkxQ=;
        b=LWtJfAFzyizp0o/hTSXBqwv1TcCzoYp6a8sPOqE1bWwaGam1/7nqGyoCdTij2boJnc
         Y9X/cCFjohzpzsv3PVej2loMdZhUa8EuTRT1HgIoeDYQqLoct2YIZMvLmBjkQ2fbB8U6
         njLRUNz5dJbp/OIw+Fsgr+CskB9p38wCrNjxmSXqsqJC+XQ98NnNhPe6y6yXQPqeGbVq
         +t6Dfvx+woM97tFvcTnnGcUX6lGdgqLEf8flVXYtMltO4hnVHQisizf6DSkHm2ZYQn+e
         yYwfgkC7YJEnQ9yl5fDysQXYvWmbZrN6Afq6OR8HvWpRReor0e/ZDMC3E8/QAtLFCQc4
         SnrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747835131; x=1748439931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tqeO+b0MwZruALSzGBi/axWBZuamPPMaMT8p8zPZkxQ=;
        b=S5nZZ6Ljm2JhF8xr8ddMH1guRdSGjFy/c3P7V6yhaiXyKGz6deHQdXRpts54HqlTmS
         NKqMq3+VvvrUDvTiJ3hj6a47Iy1/wTjLp4NOv52qkdiFYCVdNRaBiB5UwDDKofgOBgbK
         1Dkv9qhmZ9MjhVQpcxFHVys3/9lLsr6D9nEcBjBR5PJeBo9+r0B2tLaLShzyFPqnFObc
         UaqTKNdW+rUJgBFwxg7SUPv96/8IpV2afK/ERXAFKgh7HA+nUXYHAzvXOv6p4lJSAFut
         wC+eA94D+Zb26kpSUSc4fVom/GcWvr6ejYCN8GIl6RsvfISbn8IZoKfcjAYG7/gNlQRs
         ND7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUsoHA3pBHb4JIBVZmqLT45audQHSGnkQs2dBLa5ldgCaZpq7TFpCZQwhr2h1WwgNMXGhkl8p3Vuwb11rgqXm8=@vger.kernel.org, AJvYcCW9WC5OziFkUwclxKZVf6RVqUzEPu54O7CnJZja2l6jCei7miwrkJmNa43DNrMDDP2p07JDl3gp9t7kUGY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmk1vYJz9q411eycBVkJEGeVap3yZW/mvthvI2a7nnnzjciP34
	vEJ6Vbn1Mh/zuHhPbiLPQBd3nTsMZvDkR9c1LWPTbjydpR3wU5h0Mr9aO5r0F3zmKp47X/rKO5f
	i3iXy42lGSmbXL6V6w+AXM+UNwMylbjw=
X-Gm-Gg: ASbGncv4h8bv6xkLtnLOVWMw8T7B9gOkytSFZzfMg1nw+aA+liuUZx3YzzxF0ABKP/q
	tnRrzY0PFfTpFGDlPpIHo0VAi/YHo048y80HVxzw4t/S1adRQvhs3TBYFZ2abPq+aVyR4EByQlD
	qG12zoWgVaEwSHf4hdwBZXnxoyDi8ZnuZl
X-Google-Smtp-Source: AGHT+IEd6DsdwrSmmjCd7810ousDSSQK3PDaq3AuoW7wry1YdEav/d6efL+6DobgheFh5YsZPOOvlPQ1fuaqgwzW2gE=
X-Received: by 2002:a17:903:24e:b0:22e:62da:2e58 with SMTP id
 d9443c01a7336-231d4526b5fmr115017765ad.10.1747835131225; Wed, 21 May 2025
 06:45:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325184309.97170-1-ojeda@kernel.org>
In-Reply-To: <20250325184309.97170-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 May 2025 15:45:18 +0200
X-Gm-Features: AX0GCFurjaXVVR2SMph-zlE4anDutDZ-hG_2Vo7FkceNywf_0ew3Zm4BUxeccDQ
Message-ID: <CANiq72nDtkpC6zKLT3dNH-u8uUXRqTGpS+GPotOrSV=pNR-39A@mail.gmail.com>
Subject: Re: [PATCH] rust: workaround `bindgen` issue with forward references
 to `enum` types
To: Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 7:43=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> `bindgen` currently generates the wrong type for an `enum` when there
> is a forward reference to it. For instance:
>
>     enum E;
>     enum E { A };
>
> generates:
>
>     pub const E_A: E =3D 0;
>     pub type E =3D i32;
>
> instead of the expected:
>
>     pub const E_A: E =3D 0;
>     pub type E =3D ffi::c_uint;
>
> The issue was reported to upstream `bindgen` [1].
>
> Now, both GCC and Clang support silently these forward references to
> `enum` types, unless `-Wpedantic` is passed, and it turns out that some
> headers in the kernel depend on them.
>
> Thus, depending on how the headers are included, which in turn may depend
> on the kernel configuration or the architecture, we may get a different
> type on the Rust side for a given C `enum`.
>
> That can be quite confusing, to say the least, especially since
> developers may only notice issues when building for other architectures
> like in [2]. In particular, they may end up forcing a cast and adding
> an `#[allow(clippy::unnecessary_cast)]` like it was done in commit
> 94e05a66ea3e ("rust: hrtimer: allow timer restart from timer handler"),
> which isn't great.
>
> Instead, let's have a section at the top of our `bindings_helper.h` that
> `#include`s the headers with the affected types -- hopefully there are
> not many cases and there is a single ordering that covers all cases.
>
> This allows us to remove the cast and the `#[allow]`, thus keeping the
> correct code in the source files. When the issue gets resolved in upstrea=
m
> `bindgen` (and we update our minimum `bindgen` version), we can easily
> remove this section at the top.
>
> Link: https://github.com/rust-lang/rust-bindgen/issues/3179 [1]
> Link: https://lore.kernel.org/rust-for-linux/87tt7md1s6.fsf@kernel.org/ [=
2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Andreas: are you OK with something along the lines of this change?

If you don't have anything against it, then I think it would be nice
to put it in, mainly so that the issue is documented, and so that we
don't forget about this possible workaround. Plus it removes an
`allow` and a cast, which is also nice.

The only downside, as far as I know, is that the workaround cannot be
always applied (see my sibling reply), but at least for this case, it
can be.

Thanks!

Cheers,
Miguel
