Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884D52AD00;
	Wed, 30 Apr 2025 03:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745983068; cv=none; b=HAH0+h5xVptCrkRICji7swoD+XumMD5al+nAlVSvPuZx18z+6jchn9Kd7pLcqYbnvXPniyuplRuKm85K//rVVC2Llw9+xHpsxsCg1bTX02XjNZjQoC+MmR0+QxxRiT6FKOgZmQRQnf0H1Rj0GKWfsallcOZBDF8ourC88B4uUvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745983068; c=relaxed/simple;
	bh=Qo63JtNVY7oQAet+NyN8R6tYuQzMD7epfMAs7GtEKdY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qV0MWf4UwQRgca51Q3NHCVr2xSv8lxevsJvGY+3aAYy+mq16+BnDkpqw4RBsT+ccyWLxlsArqL3bCQJwr+Xu59XMrzvFHaiu8HfZJqLhqI0L6Ze9TgxXDWpklVtDLu8mtUpu4taG6vB6Q65CkJ3ClZ2o6q8uSR8OyZnaaDypFSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m02/4mi4; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m02/4mi4"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ff73032ac0so728774a91.3;
        Tue, 29 Apr 2025 20:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745983067; x=1746587867; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6O9QxlxrNh2HOxet95zgNCBApLK9wVpsROha8yPFbCU=;
        b=m02/4mi4Py/Mc/twQIGjpfRp3U68euPHviL2ytbXr0GGTa+RIyzqdmx577adjWu2iI
         MrCCSCsxK3aHpVxA4cIqZEMOWHpqv8C+uYElxeH9x+GBWdAopmZkRtn8TmvXJyG7QVRM
         IglyFVygHM2CtF+uX7E8RXV2k7FBZ1tQKGHUUI9KXcYbJn8EemF3zsu8cbVID+zPnE9f
         ylYnbqSoFGd7uT2xJhW+3ADoHKFVURiNXxngeU/EsMZ5YBTJpPs/iCvP//9z0pizrCWX
         LkvCgwmXlQ8oN2gzhUQOASfXDmswAemUXgYPrK+msynzvjweGxoTfLgQ2gOwd9BlYkR8
         B2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745983067; x=1746587867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6O9QxlxrNh2HOxet95zgNCBApLK9wVpsROha8yPFbCU=;
        b=NHZfBFYJFMXINL7m6WNiav2Dr8c9SjdjmoydUZIMq8gMRinvay9kPNA/l1eHQLXL2r
         U2oDIYJl1bQqYR1ERflLdWr1n/SuLOnTUYDpcwO/mj9oeybGCBDnTELbyIKYbVtyEHr8
         hayDrhzez5L44+XMwxcj8QcMFCih6393MN86bYM598KNwS38husQ1RMRb0Hm+AOjL76H
         /OHqpC3zb2tnXa06c1o2sAhKMGoDHtyKGEV73OcbkV9xdl5rdT4K0zTAahdfI75KoB21
         I2DP298D3rHJcrUeFztoLzLbuhMvNAst+NQKZY2x4V2g3QqKd9gTe+KYpVmyxVD1a6km
         m+0w==
X-Forwarded-Encrypted: i=1; AJvYcCUdqRX7W5AiTlAmtgLo2FRnY0jzlt3FDpeOO+pDsHGRL3Po+9o6pIOhRWEU5B3kapwAB375V5eFx/hn7qcz6+Y=@vger.kernel.org, AJvYcCX0aIVWqOU54kZykUS08nR70HQSylvpM7OhcbTfD3OVrM8L7wZZP0CARtj4SmLUl3Di+UGLl/Il4ydQL0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeKZejbezab3zooj5BdLODE45COS1dDu6JdXs2NCRiQrDFgDd9
	ktSbblKB3BX4qeoyQW9P1jGiE7BXnJzCnqXjLkR71Y91eBjJux2gNlPlFYPuCdTs/QJZ7qYNfLq
	h26eVfHD7mDCvuhdNYDjoOdXasPI=
X-Gm-Gg: ASbGncsows9yRMbfOsrMo1ehuBBOm6o0+pDp2OI+6b8zR9c368Jlo8CW67fBSZozfn8
	/6SrKpXf7eTask6foDpEq0sj/VfAKgbicTUqOwEsrC3wN5QZHknceRhHy9PQeu0BMRoBOpAmawh
	6+8Cfz4UbkLNgcaSsa3VaEWw==
X-Google-Smtp-Source: AGHT+IE+D3eoSIAlp3TcZAEt30QBbcZ9MbWwe/8KgctCyNW+kDB0GLEpWXGczD7O/IyHBnt9Eb/+o9WOG1x/hJqxO7I=
X-Received: by 2002:a17:90b:4a8b:b0:2ff:7b67:2358 with SMTP id
 98e67ed59e1d1-30a349d0db6mr519135a91.2.1745983066569; Tue, 29 Apr 2025
 20:17:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com> <20250429-debugfs-rust-v1-5-6b6e7cb7929f@google.com>
In-Reply-To: <20250429-debugfs-rust-v1-5-6b6e7cb7929f@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Apr 2025 05:17:33 +0200
X-Gm-Features: ATxdqUGxo1VbB8BkpJoOmigPkbZLot8nthKg8lE7S4FEFulLpV1YaI0qBjn7akA
Message-ID: <CANiq72=vM9Zr-q=BWvE258=9BV1Q4S_9sYo+gfCnaUUj_E09ow@mail.gmail.com>
Subject: Re: [PATCH 5/8] rust: debugfs: Support format hooks
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 1:16=E2=80=AFAM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> +    /// Create a file in a DebugFS directory with the provided name, and=
 contents from invoking `f`
> +    /// on the provided reference. `f` must be a function item or a non-=
capturing closure, or this
> +    /// will fail to compile.

The first paragraph of docs are the "title" ("short description"),
which renders differently. Typically it should be kept short, e.g. a
sentence. So I would probably move the second sentence to a second
paragraph.

In any case, is it true that it will fail to compile? Please see below.

> +    /// # Example

We use plurals for these sections.

> +    ) -> Result<()> {

Can be `Result`.

> +        // We forget the reference because its reference count is implic=
itly "owned" by the root
> +        // builder, which we know will use `debugfs_remove` to clean thi=
s up. If we release the
> +        // file here, it will be immediately deleted.
> +        // SAFETY:
> +        // Because `Builder`'s invariant says that our lifetime is how l=
ong the directory will

In our usual style, this would be e.g.:

    // file here, it will be immediately deleted.
    //
    // SAFETY: Because `Builder`'s ...

> +// INVARIANT: F is inhabited
> +#[repr(transparent)]
> +struct FormatAdapter<T, F> {

For invariants, we put them in the docs, as a section, e.g.

    /// # Invariants
    ///
    /// `F` is inhabited.

> +        // SAFETY: FormatAdapater is a repr(transparent) wrapper around =
T, so
> +        // casting a reference is legal

Please use Markdown in comments too.

> +/// # Safety
> +/// The caller asserts that F is inhabited
> +unsafe fn materialize_zst_fmt<F>() -> &'static F {

    /// # Safety
    ///
    /// `F` must be inhabited.

(I simplified the wording)

> +    // We don't have generic_const_exprs, and const items inside the fun=
ction get promoted out and
> +    // lose type variables, so we need to do the old-style assert to che=
ck for ZSTness
> +    [(); 1][core::mem::size_of::<F>()];

Shouldn't this be:

    const { assert!(core::mem::size_of::<F>() =3D=3D 0) };

to prevent a runtime panic?

Or `build_assert!` otherwise, but the line above catches the issue if
I try to pass a capturing closure from the sample module.

Thanks!

Cheers,
Miguel
