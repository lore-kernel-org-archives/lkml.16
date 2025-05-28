Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A7C28BA8E;
	Wed, 28 May 2025 16:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748451315; cv=none; b=FZ1kntP9lyjmgacnyxBeFZJVgYf9li8/2mGkyz/4lgax+O/KULX7c4Pw9LjcBnYn7LQRf+EXq2jo/gRfGyyqGNo4sVVYcM8nst91OHAiyjEZibePVHbtILNELRu6QTrudM7IQPQBGfINyeH4675dpEvg3SkaGAB5gLeatNh7ZO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748451315; c=relaxed/simple;
	bh=5Hke1jdgkb7E4JB+nI/3vbEv9WPdF4VEQmJVuDrr/GE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=m+luLE/T31AdB1m5HvF7p6DeyBVqH9thgqYin/RuZ1mxKug0AV+4RSgCDZeBiMaifXiMioPYejI+tbDT9gRSgjfa6P9jjuFpJ6rlHdizZMb1gR4OAt9Cm6yBvS3t9zex55nuzljA60VtodiHtVhDQpWSUU1onpEZzlMu0ksd8fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HnwijIyC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HnwijIyC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23E68C4CEE3;
	Wed, 28 May 2025 16:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748451314;
	bh=5Hke1jdgkb7E4JB+nI/3vbEv9WPdF4VEQmJVuDrr/GE=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=HnwijIyCWH7NYuGFX/L5P6hnuqkbRt4g2GbUtjxQarWIJm03VpnQLzfIEyZQkA+8R
	 DoMjBBuZmUkxIEueYcy1g6x6WCC1vLVUCJ5Ja/8VY8UCo7tri/6daLWggEi96J6j7S
	 bHyQX79rRNq5oSPHQfLWlZmgIO7GrfGB8UIG5zdp8L4URgupE4X7TgcEeMqCrWiCL5
	 UGP3RPPPkheJc1aMHXyLNYKn/0eiiqQLOm9diKCjCKNzGNf9PUMaA/3LuOvS39a6q9
	 XoGzXyXxVY3vrzvt/NnVwLY77jtf+trszI51hd1UoApy2wsiNobVTInN1HaILTWueR
	 8Zx7cmcOAUIMQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 May 2025 18:55:08 +0200
Message-Id: <DA7Y9ELFKI6U.32MUDCD0VQEE2@kernel.org>
Cc: "Andrew Morton" <akpm@linux-foundation.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] uaccess: rust: use newtype for user pointers
From: "Benno Lossin" <lossin@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Arnd Bergmann" <arnd@arndb.de>
X-Mailer: aerc 0.20.1
References: <20250527-userptr-newtype-v2-1-a789d266f6b0@google.com>
In-Reply-To: <20250527-userptr-newtype-v2-1-a789d266f6b0@google.com>

On Tue May 27, 2025 at 3:53 PM CEST, Alice Ryhl wrote:
> In C code we use sparse with the __user annotation to detect cases where
> a user pointer is mixed up with other things. To replicate that, we
> introduce a new struct UserPtr that serves the same purpose using the
> newtype pattern.
>
> The UserPtr type is not marked with #[derive(Debug)], which means that

Should we still implement it, not printing the address of course? So
something like `UserPtr(/* .. */)` or whatever people print instead of
showing the address?

> it's not possible to print values of this type. This avoids ASLR
> leakage.
>
> The type is added to the prelude as it is a fairly fundamental type
> similar to c_int. The wrapping_add() method is renamed to
> wrapping_byte_add() for consistency with the method name found on raw
> pointers.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

I left one question below, but it already looks good, so:

Reviewed-by: Benno Lossin <lossin@kernel.org>

> @@ -444,7 +484,11 @@ fn raw_strncpy_from_user(dst: &mut [MaybeUninit<u8>]=
, src: UserPtr) -> Result<us
> =20
>      // SAFETY: `dst` is valid for writing `dst.len()` bytes.
>      let res =3D unsafe {
> -        bindings::strncpy_from_user(dst.as_mut_ptr().cast::<c_char>(), s=
rc as *const c_char, len)
> +        bindings::strncpy_from_user(
> +            dst.as_mut_ptr().cast::<c_char>(),
> +            src.as_const_ptr().cast::<c_char>(),

Should we also have `as_{const,mut}_char_ptr` functions? After a quick
search, I found that `char __user *` is a common type for user pointers.

---
Cheers,
Benno

> +            len,
> +        )
>      };
