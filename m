Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED1622171B;
	Tue,  8 Apr 2025 19:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744141853; cv=none; b=FU/52tuamRNDp+deTY31tL+dGmGbf6lburoH1oYanXHIjba13UQQzLzASHCg5Z1+o6UKSp+HY6BkIN7EaXXQnO1AkbDFtf3rCMVPrWR5PusBL2Cmd9Bfb9tJ1fTh2IcfiquBSR92bsrnyaOYWTM6Fj5rrfdTxJg3vGaHdWmVLis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744141853; c=relaxed/simple;
	bh=giVAVFoeNVH2SFVtj34+X8fTg2iGgmYYrbfsEJ6awgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HCNIEYWRfgGXXlf2OfkSNJZtvC/kWajiK7+9OwGuQGxk1cPfgAAdGfJL3GcN5rcX3l6PnWAbi+DJa4+Fb6YljHDOfGjIYFgrTFFLvWwbkVMDENHxytlr5VWpiUugmk1YjQtMxHA9Dx2MnOGKvhb2xoqQ/I6xk3K6EMLOPxK6u4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxByfPQO; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxByfPQO"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ff67f44fcaso1096173a91.3;
        Tue, 08 Apr 2025 12:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744141851; x=1744746651; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6B+Hwh5TNkQCP/8ffLcLMbOiZOrHOmcWY8lhoumvUw=;
        b=cxByfPQO8wYphy1MpPXL8AKFAqOx00ylffTMKKuy1w9fBxDyNGQwT6y3nzyeClnIAp
         E4EJMsif90OXzE1Yu8snD5SMNUjexD+RocTjsYBLqVAydB4wnq6ctjKrqsTVoGTYbYAk
         QRsLB7qJLRlM1VUV4jA1ImdAoId9xednhtQGMwjg4v229236jbNH+sJZOk27gr3OUmRR
         ldXyvAbVLC4CR2Isz4FgUqeudsQz1WMPPYffocb8U6/Zo0T+CitF5XN80pmucMFEeYlM
         ok7921+l04hXrOd0wuej0f5OBwm0c+k+PuKsqOJIsJI4O3Rxh5OJPb+nwBEaS5c6kyse
         i0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744141851; x=1744746651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H6B+Hwh5TNkQCP/8ffLcLMbOiZOrHOmcWY8lhoumvUw=;
        b=JfjvDgK3w8JbL3xvm89OkGOFjiNUZXEKIcgvIWQMSFsbbWIWzRivRwVh7KO6jr+LmZ
         QghAK4Sr25//fGuqywu6SlHnz/141jCJl9BnP5pYGWxAETZMUUkFPzJUwgN3bBvTfbXV
         fdOFOQ74lPfWn5x4jqFfJKNuWZGZiF2xUHc2bnTcSJsK715OHUS0+RtXN0Mr4VMWhxKe
         v0dmd588Rd8M6ysxqc1R+JuL3+E1eTpL+hxyZBLWSIq37WLRhv2XSCbYIVyQMgmxDFuC
         Y2Y+NWirz9QGYbBjCjDjxkNNugxSFVn2eVN8p509ENXsN1SJXZSDaeoD5SXIQPU3+HA/
         pdag==
X-Forwarded-Encrypted: i=1; AJvYcCUN0A71aVhkyJ6Q+SHj7ndlCaNuBjSNMPF2IhXXWlZrQBVuiiAk6gjp50P1n+BH7lfMfNCHYmB5HoSPDWVaX+4=@vger.kernel.org, AJvYcCVHg9LKPXQ8wP7T+aK3XSsKZUltoEFaxTwglnQNJqAbFTwuDQXHGNsK99TxHBofHeFwo/znDcJY+YzHZww=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo68MwSnGJYRw2V4FqvTxIg0k8821HsxPBQ5z4+UDvF2x4owzi
	MpKVGJfa6xqBLUaRAjSAnYsB84EvRjftLIrNSnfs6+wZQwUVnEP5Y0wQhvBG4XcP9DWyzO1pUPa
	MNE4A7UaBZ7EUEkxqi1aHd9aqghc=
X-Gm-Gg: ASbGncu3szjkX1Uli5DXfCagumfrJjuX8YdsrLbXKs/pa1VPOP1s3swstWGaPeE0eX2
	oA+4O57avPJnmWEug5j4kuy1Gqila5dgHwvy/qqdwRyZ8UKZiMb8eQzD4ydRjR5Zec0rQzaQQYB
	fjVZ24cb3mXsiqqQBjVhG0u+nnuQ==
X-Google-Smtp-Source: AGHT+IHOYXolupWhWsxwhEEOJo8TjdCpe92ry2lf4qFvs2e1j6zlvrRXWkZ41riy81YRvTKtCz18qXSpTrj8Zoc2TVg=
X-Received: by 2002:a17:90b:3a87:b0:2fe:8fa0:e7a1 with SMTP id
 98e67ed59e1d1-306dbb68d94mr221223a91.2.1744141850898; Tue, 08 Apr 2025
 12:50:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318231815.917621-2-samitolvanen@google.com>
In-Reply-To: <20250318231815.917621-2-samitolvanen@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 8 Apr 2025 21:50:38 +0200
X-Gm-Features: ATxdqUFfW4UI2cM3_g752Xcqne16cFmzin16fA8kArKSY6nOuq2LOuBfiB9Ik_w
Message-ID: <CANiq72mrteWUqCPBP=hULfiaPh2US+x-O4hg_K8Ljb6t9fdUkw@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: Don't export __pfx symbols
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 12:18=E2=80=AFAM Sami Tolvanen <samitolvanen@google=
.com> wrote:
>
> With CONFIG_PREFIX_SYMBOLS, objtool adds __pfx prefix symbols
> to claim the compiler emitted call padding bytes. When
> CONFIG_X86_KERNEL_IBT is not selected, the symbols are added to
> individual object files and for Rust objects, they end up being
> exported, resulting in warnings with CONFIG_GENDWARFKSYMS as the
> symbols have no debugging information:
>
> warning: gendwarfksyms: symbol_print_versions: no information for symbol =
__pfx_rust_helper_put_task_struct
> warning: gendwarfksyms: symbol_print_versions: no information for symbol =
__pfx_rust_helper_task_euid
> warning: gendwarfksyms: symbol_print_versions: no information for symbol =
__pfx_rust_helper_readq_relaxed
> ...
>
> Filter out the __pfx prefix from exported symbols similarly to
> the existing __cfi and __odr_asan prefixes.
>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Applied to `rust-fixes` -- thanks everyone!

It also gets rid of a lot of `modpost` warnings too at link time.

    Cc: stable@vger.kernel.org
    Fixes: ac61506bf2d1 ("rust: Use gendwarfksyms + extended
modversions for CONFIG_MODVERSIONS")

Thanks!

Cheers,
Miguel
