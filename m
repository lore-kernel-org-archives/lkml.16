Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E21E2DC781;
	Thu,  1 May 2025 10:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746096745; cv=none; b=GetL7+z30m4iiFaG2aetr3qvI0Z6v6brvM7VoaH5E359Oyl1GgLCGjZrRretHESL/+jYhK7lZLA34raIi4tnbYjZ7FBzEFyduwe4fazwOY9nfkA27XNOdpiybu0BFfAXuLNw9yjAdi8go1Yw+4HcNIb+minCFhq9KJFXbRR0BOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746096745; c=relaxed/simple;
	bh=KYYOVgOv6k0NY/HEuwPgZ3XpRW0eNT2ljNL4q0/BkPs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KJZUJZNb+EQBkzbDoKzC16QIdns68aomoQgWW75XvAjwUohRGVHGOcJL/+nEL6InKA7CnPGy2RjE1rAN+BEQbg5KoViMTiyuf6PIur8gk/jt2+Y4cDooUNIcZICRmU1/fb7hYm7cYTbdjXe1jTznUXwaLAgpGxRFTB5LtYJpD7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lq2F+rSq; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lq2F+rSq"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-73b71a9a991so158433b3a.2;
        Thu, 01 May 2025 03:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746096743; x=1746701543; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=js4SN6Nskn7fC5RtPgLavjvHBNpEVKmi9zwcknFCjVw=;
        b=lq2F+rSq8onXnrOMRONZ0Fyk7HlU3TqwVZRyb3pOraW+CWM2cLRc7tSjSi9rgbRIH4
         SFiokmzb1gi6nCYV7gufheNnU6ytDNRBjYVj8xKn6b07821dB4/6xEecSMci0Djlc8kx
         BS4Z/y5eqjvIkpdUpBBmqrzFEAcfgtTP6v7saMG6VbNyuBZyssLuUKxKWrUisLk4ADnE
         3GQU8R8Pa2MVf6qPyKyYbWFDwN0TpnIf44WmOXc3+apiz1u+v2DQrQoid/H2lYzSFCPy
         2yymkYMDpj5VhRwU0jf9hXVA/nYPt8uEjd9thLvECbk06nHtatdz2wRm2fsm8OI+p31S
         deIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746096743; x=1746701543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=js4SN6Nskn7fC5RtPgLavjvHBNpEVKmi9zwcknFCjVw=;
        b=IAAhiaNUVZThOdCAk+6J/xQlJ4PKMeWfgnLF85YB4TuTEoE1eSJT6uzNWYfB7oncRm
         gwopHrzBWdMnJ6LjPlB0ZDups9NZdmhT9AVTBGcoAHPkbVPteRKDydEtBubkPYWEH8Iv
         8TjXcUl7ujKpqZLzlB2VvNrlYeViiOXJsJnILRHQADJTX/JXyiV6ciHNk/4vMM55ulU+
         FY+0HI/L8llbnME8Mvy+XjTchlOM5XbQckxxrIQlgkLaHmVbiinCC44cX5IScWoIDZDU
         wWrZVNy4H2Lbc7E8FA8MqpSmyVa3h9+XL+hRUfwLlL+PsukDzVarTBvhhNwnVhxLyCxK
         bNjw==
X-Forwarded-Encrypted: i=1; AJvYcCU+nQcC2Lm6Ocr4rK0xVuzi1JhsIonYOlAQurdOJW6d0C7NneiUaHvfl9K3QfLTzFjWEP2S5SiRTxJlGQw=@vger.kernel.org, AJvYcCVl8JfMyTFQAQUWSj0znlptZdl5Ogj64/q5Fy+4ZTOxVvpG5+QIinxhQ1SxbraKgtTyIHp2aMd7Es7oZ+d1YEQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiWJ2nQRJnJF+KE/O5anVo4/uGmkTz/pPJK6bvBNzmPUubmL50
	H0Tks/JxWmx63NdFv0HalWMdVB6NY4Sl/UN+iKShszEO5oabL19Q1/lBHRZnKflV654aAVSMb+g
	mFW62zIU2mWLc28SU++gWxPlUYLQ=
X-Gm-Gg: ASbGncvLYLUR+O/qHHdT/S+wKYzoO7nhaF5KdDyghByIwUaacgBmazMakYA+pfOi9u9
	KtFHzIxtXNxzkTABasvvqfjt/arjc/YqwHxkiA7/1wlbWlKbrQut+zuuHwzBn/OQHcvZsvAkX1A
	lJr2z6h7jzo61gU9mB5Qcg9w==
X-Google-Smtp-Source: AGHT+IFS7I1WUW9voxDRLlHeCzQDd8VsbdOpCDtovQv3CWaO16KjE5g3hFIszo9O0Zz4lr9vH4tsdFpxxGgh3YhIZKQ=
X-Received: by 2002:a17:90b:3e8b:b0:306:e75e:dbc7 with SMTP id
 98e67ed59e1d1-30a348d5a83mr3711994a91.0.1746096743381; Thu, 01 May 2025
 03:52:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501-configfs-v6-0-66c61eb76368@kernel.org> <20250501-configfs-v6-1-66c61eb76368@kernel.org>
In-Reply-To: <20250501-configfs-v6-1-66c61eb76368@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 1 May 2025 12:52:10 +0200
X-Gm-Features: ATxdqUFTzIyyMmfehg-YwzaARa1cf7IFMynd_x5ZXIxySyknRFTPpHQtdeYZ3aM
Message-ID: <CANiq72mS_HV5rDjP+t+k0jX9QeAgF2SB9_xX54iEBTH-GoPuEg@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] rust: configfs: introduce rust support for configfs
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Joel Becker <jlbec@evilplan.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Fiona Behrens <me@kloenk.dev>, 
	Charalampos Mitrodimas <charmitro@posteo.net>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Breno Leitao <leitao@debian.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 12:15=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> ---
>

Spurious newlines.

> This patch is a direct dependency for `rnull`, the rust null block driver=
.
> ---

By the way, you don't need this `---`.

> +//! `configfs` interface.

I don't know if configfs is supposed to be written in code spans, but
I appreciate you are trying to be throughout in your Markdown use ;)
It may be easier to read to not have it in code spans, since we have
many already and it is not code anyway.

By the way, you may want to mention somehow the title they use in
their docs: "Userspace-driven Kernel Object Configuration".

> +//! See the [rust_configfs.rs] sample for a full example use of this mod=
ule.

Files are, though, like the C header below, so: [`rust_configfs.rs`]

> +/// with configfs, embed a field of this type into your kernel module st=
ruct.

Either with or without a code span, i.e. being consistent is best.

> +    /// Return the address of the `bindings::config_group` embedded in `=
Self`.

I think you may be able to use intra-doc links for [`Self`].

> +        let c_group: *mut bindings::config_group =3D
> +        // SAFETY: By function safety requirements, `item` is embedded i=
n a
> +        // `config_group`.
> +            unsafe { container_of!(item, bindings::config_group, cg_item=
) }.cast_mut();

It doesn't work to put the safety comment on top? (We had issues
similar to this in the past, so if it is intentional, that is fine).

> +/// This type is constructed statically at compile time and is by the
> +/// [`kernel::configfs_attrs`] macro.

Sentence is missing something. Also, we never used `# Note` yet, but I
guess it is fine.

> +    /// Null terminated Array of pointers to `Attribute`. The type is `c=
_void`

Intar-doc link(s)?

> +        // We need a space at the end of our list for a null terminator.
> +        if I >=3D N - 1 {
> +            kernel::build_error!("Invalid attribute index");
> +        }

Would the following work instead?

    const { assert!(I < N - 1, "Invalid attribute index") };

(Please double-check it actually catches the cases you need)

Thanks!

Cheers,
Miguel
