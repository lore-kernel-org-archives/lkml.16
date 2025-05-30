Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D605B20B806;
	Fri, 30 May 2025 11:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748604769; cv=none; b=tjjtSvo5evH99Rv+6FaqG65BKUT9jvjIRjGK7akWU87+2WSFnflXJNBpZRJIiDOvcrwR3PfUV6xq+zxlh2/vjFUlPMTRksAC3Zac4n9CJpY1gnVT/DKbtBv/l3bZ2wkp08duy1W09KyOzDlA1naCfQ3l9lPhTlTKsmByPjn14C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748604769; c=relaxed/simple;
	bh=a8XNENRhPEER1zJ/fXO1Ztz5FIS/pmhzInRNHavnfmU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=YttkDluneRy2IaNM1ydEeihF3tFNKvz5zviNzLV+tTMR1q2ISNcKVOAtXYlplmKVZU60L7pFEJtTiVUQTm4JcnZUg+1aojB8I5btvui4JMtMGmQu3MMNuS6tjPkTaTDgXIgKvj0ZroSnIdMOUDg0toAqI0BKstZZXO4f0Y27Imw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UUKawgLt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UUKawgLt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C795C4CEE9;
	Fri, 30 May 2025 11:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748604769;
	bh=a8XNENRhPEER1zJ/fXO1Ztz5FIS/pmhzInRNHavnfmU=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=UUKawgLtJ45B9cZlyBZkWyeLVrCYSJKjo0G6hGxYnRjpKXIGiBGa8Z8KpBWnGu4ub
	 DRRLNgvZTdJexH3yvbLpeIor2uD9sHHPKrshJ28aLnbbuLETkhCx5rURsifJ47Wwx1
	 rmo/Z57oPWyxLGwkUoh0qgAzd+7jR9fK90js8pfxc7nqSHPY0PCq4dyPraNvWdm+1e
	 YGhf9P8AaQ2aEeTydXp7MXmrzpp826YNy4FMoo9uz3aOodGh811WxlnezpfYXMOBu3
	 M6f4pEcOwTi1PXj3MB3PThCrZP/ER1/L7/K+W4m49I97QkMfPowkEU9RF48IR1sShY
	 t7TsadEVVuNqw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 May 2025 13:32:44 +0200
Message-Id: <DA9GNN7GH1VE.2NDPJZLNHAUP4@kernel.org>
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

On Tue May 27, 2025 at 2:34 PM CEST, Alice Ryhl wrote:
> This patch adds a direct wrapper around the C function of the same name.
> It's not really intended for direct use by Rust code since
> strncpy_from_user has a somewhat unfortunate API where it only
> nul-terminates the buffer if there's space for the nul-terminator. This
> means that a direct Rust wrapper around it could not return a &CStr
> since the buffer may not be a cstring. However, we still add the method
> to build more convenient APIs on top of it, which will happen in
> subsequent patches.
>
> Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Benno Lossin <lossin@kernel.org>

One question below.

> ---
>  rust/kernel/uaccess.rs | 35 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> index 80a9782b1c6e98ed6eae308ade8551afa7adc188..9b1e4016fca2c25a44a8417c7=
e35e0fcf08aa959 100644
> --- a/rust/kernel/uaccess.rs
> +++ b/rust/kernel/uaccess.rs
> @@ -8,7 +8,7 @@
>      alloc::{Allocator, Flags},
>      bindings,
>      error::Result,
> -    ffi::c_void,
> +    ffi::{c_char, c_void},
>      prelude::*,
>      transmute::{AsBytes, FromBytes},
>  };
> @@ -369,3 +369,36 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Re=
sult {
>          Ok(())
>      }
>  }
> +
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
> +#[inline]
> +#[expect(dead_code)]
> +fn raw_strncpy_from_user(dst: &mut [MaybeUninit<u8>], src: UserPtr) -> R=
esult<usize> {

We could also return `&[u8]` here instead of the size. Would that
improve the users of this API?

---
Cheers,
Benno

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
> +}

