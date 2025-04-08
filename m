Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512A9190674
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 13:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744119655; cv=none; b=GjH84gi5av9X/XQGXVVPxfGMhhddzrOjWCmxgZru90T/PKLb7clYyUx6HcdXC/Fc/TkriNwgmamcPzJ0Yv7qqN/kbShwxBBIknzlIaFtphImH/NKJfW8nXSlWmcNg8v0bBHrg2ErOUZtFK8zdCW2Hhf7l8M0dNAuqHQCFi+AzPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744119655; c=relaxed/simple;
	bh=0PXxni6fsewK1S4ZVVBO5KssS3Qt+9QyBqP4u4gWtG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PVJe2LWe6ng8lVVGY8fCk5J0/EuvGYr4sg31CHb9Z3v0Nz0KpMK0JwxRI2Hi620BxC8c4iAoh553lPqxfiIwUVWIEB1zyACsk8L11LK9sZmbOvEuGAq2rimXLLcXzybctmW8PalqBO+QyKZ23gmDTRAvzYoZta8aC/Z873wqT4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SbstPJDL; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SbstPJDL"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso3418497f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 06:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744119651; x=1744724451; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eg77wDzokPhOUUiNUpCayNpB51AV/GCoS3X3s8Fozm4=;
        b=SbstPJDL3rKxcMmbQETCbFqBQMBQRP9+NSDhDlldfyQFvMHDTeEV7/AIFQJW4ZL8/q
         WcCo7gyAxOv37GoNqixedFSTv9bSYNbW1Bv3UWjWb5eA6lVM6YbMu3FM0aeGnVXjsOzI
         RmoOmTB41kCoPTRYeUs9KMy3/4BgC6VvgCaSfJ1fleMOTEQ7/ZyIUxkqMxZ8Nclxk/+Z
         +INegSokZ5Dz3OgIbWXbXXt6QdJarJDQDF13tYnnxMfGv+BSYBlarzR3RETMqGNNREc0
         lUpmtjG9LDPZhIGLZUVmjZVliQkK+ROKSscnm0wpZ4YtW6p380RZ+JF0eDbyIK0DmVZa
         SbgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744119651; x=1744724451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eg77wDzokPhOUUiNUpCayNpB51AV/GCoS3X3s8Fozm4=;
        b=RtLrb+se6edEcop0GtREnAkJyC4NTy30HLgIqJehL7wWOvYfMbUnFHACSfMbtCFEBW
         03Gv9CzEHbT6WGMmz7DIGiRDvekWAMXiwFkSpbZ5rQc6Hju+Zz7PkXTCtG9tGrLIoPnz
         wAo3rZw1IttpB1SPOQUMGlwk8hFBvNKMHpPeyXYt67zSdP02D537Ltc09BMajVBXi05w
         eba16P1l70mhY2BrozSHM6ZJ0F51bTeL8vmMG3V6Ei/UaIQSdL5n77cpS7178tJXsRGm
         r6Jwo9NTC4vbXFuNNOgWIxeSVv2K+S08QZ/wYNANMBXZ23XnCQ1iuMORVNrI2W6SyAd9
         qrXw==
X-Forwarded-Encrypted: i=1; AJvYcCUszfnOsND1F9J2OaD7Z2bE+tC7hlYOkJlICEoRPi3GSKUOER76plm96omAFLEBc6kzZEUaIvv6O7DRzqo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb/kZpoR+zD6id29KDRHcPsqDtysk5eFxiG1/c3y8cwh7viUYU
	qypwJMBtu3F8x36pwZ/VvI/5TffuA++gXPdB0mu7KiND828JReFfo/HMydQEQMOLlqIjl1y+CvG
	bfAHHnfY/7LpiL8MpNDjsCAvuUMtabRgsP/+E
X-Gm-Gg: ASbGncsxKD1bWJYT2HQxAmrWBUNywWj2tNKg49VR8omPiux6eKhHQPqya0POeJMIKNA
	dpcHw2Ipbuy4f0JUAI9YTjVFp4DS36XAmJaEXdbpBJ6cpkXRwyOJLIW5Pj16/CE6BI6CMsqD8Te
	Ii/oyn4kGrWC7F0k5y3/51isy1yGQc9fX2WdE7v7rYBZNanh9J40DDBiCEfkFE+AuFHY0=
X-Google-Smtp-Source: AGHT+IHUdwAYXndD2IxBfvKUGB4B2WEZU1eWNr/IWvZ03v1DbWS9pIy/StZEp1VYuQeeYss8TTBcqfwHh4Ai8pVKE74=
X-Received: by 2002:a05:6000:2509:b0:39c:30d8:3290 with SMTP id
 ffacd0b85a97d-39cb35b196bmr12354472f8f.7.1744119651284; Tue, 08 Apr 2025
 06:40:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408-box_trait_objs-v1-1-58d8e78b0fb2@nvidia.com>
 <D916LG7Z9Q31.5RVNMYM38E2D@proton.me> <CANiq72k9Lo-M5v338iWWSiwrnU+JwP+aEZeLiR291xc2c+ESOg@mail.gmail.com>
 <D91ACTUAWQTF.2AZ98BUA5ZKJ6@nvidia.com>
In-Reply-To: <D91ACTUAWQTF.2AZ98BUA5ZKJ6@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 8 Apr 2025 15:40:39 +0200
X-Gm-Features: ATxdqUHcSfbrhbrkbAA3P6H8qVSDNJBnahQ-PQSx6ciuIP6ROiS3xSXuswsTLlA
Message-ID: <CAH5fLghYwmTO6KmoSPQxjmN=nDrQOCRoigQA9OWYnPve+sYL0g@mail.gmail.com>
Subject: Re: [PATCH] rust: alloc: allow coercion from `Box<T>` to `Box<dyn U>`
 if T implements U
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 3:19=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> On Tue Apr 8, 2025 at 7:35 PM JST, Miguel Ojeda wrote:
> > On Tue, Apr 8, 2025 at 12:22=E2=80=AFPM Benno Lossin <benno.lossin@prot=
on.me> wrote:
> >>
> >> You forgot to add the `A: Allocator` generic here and in the impl belo=
w.
> >
> > Yeah, for this sort of changes (ideally, all patches, really), please
> > test with both the minimum supported version and the latest.
>
> Apologies for that, I had no idea how to build using a specific
> toolchain and did the wrong thing, which is sending without proper
> testing.
>
> I had some trouble finding how to 1) find out the minimum supported Rust
> version, and 2) how to build using a specific toolchain.
>
> For 1) I eventually found a hardcoded version in
> scripts/min-tool-version.sh ; and 2) is somehow documentated in the
> Quick Start guide that mentions the `rustup override set stable`
> command.
>
> I can send a patch against the Coding Guidelines adding a section to
> encourage testing against the minimum version and explain how to force a
> specific Rust version if you can confirm this would be helpful (and that
> min-tool-version.sh is the correct way to check the minimum supported
> Rust version).
>
> >
> > For instance, there is another issue, `#[pointee]` is only applicable
> > when you have the feature:
> >
> >     error: cannot find attribute `pointee` in this scope
> >      --> rust/kernel/alloc/kbox.rs:66:18
> >       |
> >     66 | pub struct Box<#[pointee] T: ?Sized, A:
> > Allocator>(NonNull<T>, PhantomData<A>);
>
> Mmm that one is trickier to address - I don't know of a way to make this
> `#[pointee]` attribute depedent on `CONFIG_RUSTC_HAS_COERCE_POINTEE`...
> Only solution I see if having two separate declarations for `Box`, and
> then we have the problem of bindings the rustdoc to the declaration that
> is picked at build time... Any idea for how to best address this?

This might work:
struct Box<#[cfg_attr(CONFIG_RUSTC_HAS_COERCE_POINTEE, pointee)] T>
