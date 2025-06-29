Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55990186A;
	Sun, 29 Jun 2025 19:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751223714; cv=none; b=sXlrj8DGDci5BUNZUXDa9yarYAlrqk8xM3mdMpMWiGEnJ82C6miDNBh6CLg3LT9UFrxxb0X4gZTGahW1lthhueNG7Ayk/j9brtPs541XSSi9W9DpSLV7296vukQvAtJchs4DMHAxLNMZyjAkeQ4JKAvnf3EJjdiZqqIgYDDGwfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751223714; c=relaxed/simple;
	bh=9M6CFZ/2R5nno9yztXxect8YV4KqNZ1T1L9nBrZW8kM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qVhUgCokpl6Cl4lYW6pyNYjwVICzX0cDzTslZOijVEb24gOeSJ1EipuHBfANKKx7fBiWpWKlX10WimNLx8P+8a51In05/aP7wVvCd3B9b8YB1b5E+lTSK2wgKcqLAtX8L47sBdTbDtxpN0E3L9Lugkxvbzfdn7iWU9olttYAkT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NLg3dKYh; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NLg3dKYh"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32aabfd3813so14292091fa.3;
        Sun, 29 Jun 2025 12:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751223710; x=1751828510; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JgarB99rx/jpIsjX1rTBgNR+GmtLMJURI6x2FhaKEGw=;
        b=NLg3dKYhdrxk38tIQ8Z5WU8Vb1T4um5WNJ9sjViW/VVv8pNlss3PSddIL8k33l2g6l
         kejCz6FKvZQYqNNEm+d8fsqbBGEs73HJj+/OhxfxNqdzQt86RmOMru0Ov5iGvHCjeI2r
         vgB2rP1k+XFfCdSq1h+x4UtxSWIEKcUel2SyeS00Zghckl5/yM4fuM/1YNkZ+fsc5yR5
         mAN5ut7l1kJtu5xcjzS2qGPkAlJn+tkz28AOlOTRCaWyVhdbUSOlDDBKTwLbXulqw51F
         RTJCgo5kYPq53YwHZ+qbWv3I+IropNcjWFjj0/R2iduWYRmalVL6qTZoDd1kJoZQ0AjY
         WKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751223710; x=1751828510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JgarB99rx/jpIsjX1rTBgNR+GmtLMJURI6x2FhaKEGw=;
        b=ueMvj34BmRjECerh56h4QDInvirggwI31ss8nmLHYTTsnPOXNHyDhp0pdcx7cPU7oT
         23v4ttUW66SBs4z8ZvuLPLHjVIdxq6aaCulCuXpQkuqENs/2yGI1PN+ddI+GPwtjmDvU
         OMK4Ph9VmNOCORUYcyt2bdNPvE6OpFxCOciYe2y0C/J4TccLmI1Rb8NxEE852gVEv+YM
         5IZZh9ILHmH9WgE3XVJQLRUw9r9K0BCQlnMp6n9zosEE3dkfeQTfyfUbxJvQklSD0IoL
         VnNNE3Ag62uO4uFlDLPCfQghVzrK/L3Zgx4zWMEZEZWw5yEhr/9mqG5lY3rhyDSOl3dF
         YB9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVAG5fXQCJ7koiirOk9kbBi3M1YhTvfue2yXUpiMdRhxqmB31XhJZicRSHAsa6HtZeIkGVziItWW0nSumCNa0I=@vger.kernel.org, AJvYcCWD8hOeUBI7UUC4ODtzV7vVhq/I2DDHtjHBktAO62SjdgddTM8t3YXAHiOK0lzc8FF7RHbu2N8ftEcsiPQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIhB0Bo2XSxpeD27br3+4Z+b2zBOek3HDjSsEJJCYz2le27a3x
	I+HRO3axDMeWSmvnFAiAr4S909aCxl95Brdu9lukujsg40Buyes/tXmScnqkez8RmJotDYL9W88
	ZOdvLVCt+W7TlQOT+NgMyIPBUM2aO3VN+ooE5Hxk=
X-Gm-Gg: ASbGncs+yreR3iFp8LF+gfKj+oDXAzjLUuZpQG0ExkDQMjUmXEFniRv8sQUCL2njWcn
	kZzKnzZ3PsBwLnxs02GmcEwA/eoxKkxuTm9FvMAPbSe+wPtdNQeMKCSOb+k2co7x/dapHbNx4pb
	JLGP8V7FJ/DcYAQalgGFL02mZFk72S/cefFXdVRa7QGstprneeCKmNah4oAHXbwwpT6FZdtF/VG
	o9iBQ==
X-Google-Smtp-Source: AGHT+IEXY/rEK5ytjcjtDmD4qw/HpGpvu/ii+x+V7wipTEbrdiU64Dxa3NwO84ORTH6vfihSMW1s210D+UboPocucjk=
X-Received: by 2002:a05:651c:20db:10b0:32b:73a8:9f75 with SMTP id
 38308e7fff4ca-32cdc4516demr19547661fa.9.1751223710092; Sun, 29 Jun 2025
 12:01:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250629024310.97937-1-contact@antoniohickey.com> <20250629024310.97937-3-contact@antoniohickey.com>
In-Reply-To: <20250629024310.97937-3-contact@antoniohickey.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 29 Jun 2025 15:01:14 -0400
X-Gm-Features: Ac12FXxOQ2n5YVGqubbZIzcSmExfcD9pFxmRcZj5Cb2Ch_FGcPb7V_qS-qeTMk0
Message-ID: <CAJ-ks9mhc3CqDnZz3BMXFDxNPW0KgYZrXHvKwTGYKhSF_rDDMA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] rust: uaccess: refactor to use `overflow_assert!`
To: Antonio Hickey <contact@antoniohickey.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Cote <danielstonecote@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 28, 2025 at 10:44=E2=80=AFPM Antonio Hickey
<contact@antoniohickey.com> wrote:
>
> Using the `overflow_assert!` macro here adds documentation to
> the intent of the assertion, and avoids local `#ifdefs`s by
> encapsulating the conditional behavior to the macro itself.
>
> Co-developed-by: Daniel Cote <danielstonecote@gmail.com>
> Signed-off-by: Daniel Cote <danielstonecote@gmail.com>
> Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
> Link: https://github.com/Rust-for-Linux/linux/issues/1159
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> ---

Reviewed-by: Tamir Duberstein <tamird@gmail.com>

>  rust/kernel/uaccess.rs | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> index 635a03e0989f..452a5e0d76d2 100644
> --- a/rust/kernel/uaccess.rs
> +++ b/rust/kernel/uaccess.rs
> @@ -9,6 +9,7 @@
>      bindings,
>      error::Result,
>      ffi::{c_char, c_void},
> +    overflow_assert,
>      prelude::*,
>      transmute::{AsBytes, FromBytes},
>  };
> @@ -394,8 +395,7 @@ fn raw_strncpy_from_user(dst: &mut [MaybeUninit<u8>],=
 src: UserPtr) -> Result<us
>          return Err(Error::from_errno(res as i32));
>      }
>
> -    #[cfg(CONFIG_RUST_OVERFLOW_CHECKS)]
> -    assert!(res <=3D len);
> +    overflow_assert!(res <=3D len);
>
>      // GUARANTEES: `strncpy_from_user` was successful, so `dst` has cont=
ents in accordance with the
>      // guarantees of this function.
> --
> 2.50.0
>
>
>
