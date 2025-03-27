Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3061A8418;
	Thu, 27 Mar 2025 21:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743110868; cv=none; b=PLRzbuoewm7gfVSk30NPe2kiOmR1VW0LwM2+k9Hvcj8T3rj/XSD1Dl8jdwhiUR3yFPB67/21PfGcgIu3SBuyvXllCUKlTNyIqxCuhn2T3/ghq3w/JPv52ucQI87kqmCDo6vCykZOJ/BdfF2QfLsSjig/UroKXgbbJcH+JVIqsLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743110868; c=relaxed/simple;
	bh=mzO6TlYvpCcsgHCtdzRZWF7q6fjXidij/YnDo77jK9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mXpnfOVqUoY4w2LmgZvz/mrSD2my3wgs9hLViqjjf0o7m6AAPNhYeq6e7QfDTYTSHHuWORCfmhAIR2tKrqqfJWZbFISGWmj4kObGxO0jg3LsG+aDDBa8FeDvhZICI8octKCJSTEzV/ylf3snk3+oFuEnjbEJb4OR/f/DEvpgl8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eq8PG5b1; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eq8PG5b1"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-30363975406so304958a91.0;
        Thu, 27 Mar 2025 14:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743110866; x=1743715666; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wE3bwjdheiC/MNEGJyk/opgX6NdwvbHJyEFnCfH1pq8=;
        b=Eq8PG5b11r/G776a0X8oqr9asmJcuyGgmSO3PZQ362PbvwYrQ2sRA7QgNXMJ13z+8x
         ijnyYeOVFqwDURnljKlndkSpHpF3q1ZfhnSLpfLpdZPfBERprD9KssSbDa9OZnz80uMc
         X5RJ/b3aag8keUYwtTwPK+BN54wCf4ikopD1OfjzUZvwLDbs5Qw1IL2Vjar0gWOUQNzs
         Q2ZByp0RSootncvN6lc7oZUB6aIjP7NC2XhpkuCEuaLPDEIpYUQTTm9E+r4KUZqqMIX4
         mPQXJu0Xwnwv4jeHWsJ45xOBPwpjOH5KKXi9oWG4KkB4c9/G3lDgIU1XQn89jQL8bwIW
         ykCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743110866; x=1743715666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wE3bwjdheiC/MNEGJyk/opgX6NdwvbHJyEFnCfH1pq8=;
        b=U/Bpekz+QW71AXRcuRQd0q0okXZgn3XX8zffHHQ6K/UyutPjZ5gnUukQc4tkBpkO/H
         qymPByhJwIIFr3mwlKldstW/UtNSD5xFJn1VzQdxtD9fmLEDZp9UbcahOMGweX/hlieY
         ZkybbsOzbNswA+IhgZDR/Y81H/yhGchRZ1wQG+1AT6NP8L179Tuk93YPcgU01W5ZMAM+
         ifZ+3C7qyEQ1dwj5rGAAWk3uIItaNk6QemqvHU+fKzpEFx7SxDDGJnnuRgqMmx/JaNvr
         u4TyksXjyqxZrfX2WbpD7X4Mx79atiPrfMzrgyRfBeX7xdrmUokKpmLb7fBZMgaC/L7m
         +PPw==
X-Forwarded-Encrypted: i=1; AJvYcCUr30C7rX28k3k3ksJ3g3Ova5xJZTn4qpkFYQxyP7LhifPlGRLoZnfpLOGSDfLT0HCJMw8T1X8IuMoyYR2hlvc=@vger.kernel.org, AJvYcCW6H1lxAPFbVBaSmKdl4kHEYFdPgvJKg1dBXgynAMrpQiaJqgwtYo4XU6J25FLN3aLEIjBdHxcc7+LMa0Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBk6H8K4MVg2xOvVrnL/W0UZnnPugw5u0lzq4DJDPNv0d8MmGk
	daqapPhAuV/V0y4cYX/LnlkAM2qUjXCEHGjrqrP+w/gGq+sahMcgS+qeRf0PnINnbGdYgYCw/rk
	nXQ1ZJfWAp/s6glm71NWEDYi3CmM=
X-Gm-Gg: ASbGncuhfIog1dW5SKJuPekAlZ3ii1rW2bFVqn9SJbFtFQ/R4gVffZQF+YtzEOIgYeu
	RBGDuej1xdMCsqRLNk6Q4He8WY8pPPjvp610YaIEILsfZssfJbAOuA3xfx+BLhP0Rw4hOpJ1Htg
	CEUYhWXl8EudWOAQ6v7jsaTMmv4tlcIMzKZyym
X-Google-Smtp-Source: AGHT+IHseV5LI2fbMCtNieCQxJtP/5+INePZ/4ozx0Jkw2ykgR0+w7R29qBuW7MYAJ6XAXE6nFroYJ9itWMfFaygdWc=
X-Received: by 2002:a17:90b:314c:b0:2ff:6941:9b6a with SMTP id
 98e67ed59e1d1-3051ab84235mr356116a91.3.1743110865739; Thu, 27 Mar 2025
 14:27:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326-topic-panthor-rs-genmask-v5-1-bfa6140214da@collabora.com>
In-Reply-To: <20250326-topic-panthor-rs-genmask-v5-1-bfa6140214da@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 27 Mar 2025 22:27:32 +0100
X-Gm-Features: AQ5f1JqR9pPPRdsS3Lb-1y7FA50rzNTM3sAftgsRrCyk-pWbY9_HzUHCkvDWZ6k
Message-ID: <CANiq72kkgBtEWNQtu_tZpUYC+b-_3RsnWFO2biHPB74mrKE=AQ@mail.gmail.com>
Subject: Re: [PATCH v5] rust: kernel: add support for bits/genmask macros
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Fiona Behrens <me@kloenk.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

My usual docs-only review... I hope that helps!

On Wed, Mar 26, 2025 at 3:07=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> +/// Equivalent to the kernel's `BIT` macro.

"To the C `BIT` macro" or "The C side ..." or similar -- these one
would be also the kernel's :)

> +/// Create a contiguous bitmask starting at bit position `l` and ending =
at
> +/// position `h`, where `h >=3D l`.

The first paragraph is a "short description" / title -- you may want
to leave the details to a second sentence, i.e. in a second paragraph.
Please check in any case how it looks in the rendered docs -- it may
be fine to have all in the title.

In fact, given you `assert!`, we should probably mention that very
prominently e.g. in a `# Panics` section. Or, better, avoid the panics
to begin with if it makes sense.

> +/// # Examples
> +/// ```

(Multiple instances) Newline between these.

> +///     use kernel::bits::genmask_u64;

(Multiple instances) You can hide this one with `#` -- when the `use`
is just for a single free function, I think it is not very useful to
show in the rendered docs, i.e. it is clear that you are showing that
one since the docs go with it.

> +///     let mask =3D genmask_u64(39, 21);
> +///     assert_eq!(mask, 0x000000ffffe00000);

(Multiple instances) The example is overindented, as if it was inside
a function.

> +///
> +pub const fn genmask_u32(h: u32, l: u32) -> u32 {

(Multiple instances) Extra `///` line.

Thanks!

Cheers,
Miguel
