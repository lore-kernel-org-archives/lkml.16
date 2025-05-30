Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1304822D7BF;
	Fri, 30 May 2025 18:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748628805; cv=none; b=cXPGPROd17McnyoAGyn1dZ9pipltx+VvCYDnzqypI5uHhhr32O4ZPewOIWwKLV2lvpMAfsHTWgTOexEw7Co/nIY5QKOJkwhLUd8pXRy4/ekIzfokoJHYJ+GJFsFYP6DwuTNulILjvpzEwQT7NB6zLnW3KvhfgGHl0QiWbda0dJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748628805; c=relaxed/simple;
	bh=6Uu4JDOtA/oJ7T/hSTt8ii+u9NVEV5G00HIMfiylB10=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=DfyLV22Bpwc/4u6eYwUhbCx1RiZDPEEBpcqn1VuaaCrBYD9L+3JTe1jIDaenSCG6LRz1qypS+yXGKRM0mPxs/K3dA4nBCY7A2dj7/u4w/eBZWPgAG9v+INUnCmy1tT82wthZBvxMNSFMccxNiJdRETyCBnq4rAdZwQQv6ChxSnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IdKvAkmi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IdKvAkmi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFD9DC4CEE9;
	Fri, 30 May 2025 18:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748628804;
	bh=6Uu4JDOtA/oJ7T/hSTt8ii+u9NVEV5G00HIMfiylB10=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=IdKvAkmiTrIQxU9jHgn2PSeeQwXPh4McJATjn31UmVgyQdhYM/Zk8ThhXS2blSGER
	 BmMDiDl5aVc7WuFbinPzI22McM/3v6emN2UUJlpr/S1AlfJXs9RFhRgh9JegndccF4
	 fg3Q7gbGq64v6EdjLTiUelTPKJ73kBmDKuJM52oReIyxl3jzwGXPYBc4PJLhQYHl7w
	 ndktQFbJElBSRxnJkbMyGTPO5tAAv8km9fRA7TOy+Jv2ByLULG49x0MWgSIjUeWaSt
	 hS51BDefWjJl79g9cxoYllWCAxrV1/G7ZY0NVMNKCGnBOUwbvDb6ePweTSOOdr4bY6
	 PmrjO6BxhIl+A==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 May 2025 20:13:19 +0200
Message-Id: <DA9P6CSP6563.1OYPZXIP5S7N1@kernel.org>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] uaccess: rust: add strncpy_from_user
From: "Benno Lossin" <lossin@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>, "Alexander Viro"
 <viro@zeniv.linux.org.uk>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.20.1
References: <20250527-strncpy-from-user-v4-0-82168470d472@google.com>
 <20250527-strncpy-from-user-v4-1-82168470d472@google.com>
In-Reply-To: <20250527-strncpy-from-user-v4-1-82168470d472@google.com>

This patch's title should be adjusted, as it's adding
`raw_strncpy_from_user` and not `strncpy_from_user`.

On Tue May 27, 2025 at 2:34 PM CEST, Alice Ryhl wrote:
> +/// Reads a nul-terminated string into `dst` and returns the length.
> +///
> +/// This reads from userspace until a NUL byte is encountered, or until =
`dst.len()` bytes have been
> +/// read. Fails with [`EFAULT`] if a read happens on a bad address (some=
 data may have been
> +/// copied). When the end of the buffer is encountered, no NUL byte is a=
dded, so the string is
> +/// *not* guaranteed to be NUL-terminated when `Ok(dst.len())` is return=
ed.
> +///
> +/// # Guarantees
> +///
> +/// When this function returns `Ok(len)`, it is guaranteed that the firs=
t `len` bytes of `dst` are
> +/// initialized and non-zero. Furthermore, if `len < dst.len()`, then `d=
st[len]` is a NUL byte.
> +/// Unsafe code may rely on these guarantees.

I would remove the last sentence, it already is implied.

> +#[inline]
> +#[expect(dead_code)]
> +fn raw_strncpy_from_user(dst: &mut [MaybeUninit<u8>], src: UserPtr) -> R=
esult<usize> {
> +    // CAST: Slice lengths are guaranteed to be `<=3D isize::MAX`.
> +    let len =3D dst.len() as isize;
> +
> +    // SAFETY: `dst` is valid for writing `dst.len()` bytes.
> +    let res =3D unsafe {
> +        bindings::strncpy_from_user(dst.as_mut_ptr().cast::<c_char>(), s=
rc as *const c_char, len)
> +    };
> +
> +    if res < 0 {
> +        return Err(Error::from_errno(res as i32));
> +    }
> +
> +    #[cfg(CONFIG_RUST_OVERFLOW_CHECKS)]
> +    assert!(res <=3D len);
> +
> +    Ok(res as usize)

We probably should add a `GUARANTEES` comment here, no?

---
Cheers,
Benno

> +}

