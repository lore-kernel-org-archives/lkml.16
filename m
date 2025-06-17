Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DF0143C61;
	Tue, 17 Jun 2025 07:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750145887; cv=none; b=o0e30TXdoZOyxsn8jN8ooQfscGJkpGZi60+FkEI+f4w1oK7N6c/HTxknnoQYA/v/8ybpMIrSRvNFULpKgjAJ0yTexe0elHNj/BYOm29ehkWD1GJRMv2YcSUpFrWHR6KN6ekc0wUm4d8B0S9Td4PqlUjlu2h1t+iESGa/hrHtLTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750145887; c=relaxed/simple;
	bh=Myb/a2mx0UY1Y9+zH78gK82S4/j/1Vy28cbhy55CR/4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Wo5OdCaSJqdZ02RIrJ27r3p5n9hMEW9JD2wA3JC+kt5/79NSnE2hIzXI0IQ6YjgZi+W1iM/DXviD4JFpvp5UWTj2+YeK5PYwznZTAuytIiE7TICvhITk+20N0k82bv/BxrIQPQU3V/UhjSK7R4j0Lwq+38+v5mBMui8ATg3AYz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lTzhnvp3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lTzhnvp3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D037C4CEE3;
	Tue, 17 Jun 2025 07:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750145886;
	bh=Myb/a2mx0UY1Y9+zH78gK82S4/j/1Vy28cbhy55CR/4=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=lTzhnvp3f/BVpu8OuHLsP0JHLieV3MSB92WOzbotDM2mIm+hCo+e1YEguVW70Ir6V
	 n7MaPbWYJ6gt/txGDt/cQ8O9/bpmEI2EJ5WDejXYXSrV4OR+i9TRuMzQQpdV4a6nGs
	 j4ZT9qE3RXCbigVKLRDGy+XqkFMcXEHEAGBDatJBywhfcRezxSgoAHaMiJoNnRXNl6
	 L+ahUyh4H+qDj0c/TI0WtKPUvcKtPzErv+DLYh75q+CY9NEBSoaAHU23T8TE2nT2XZ
	 XO5O+/DzriWBxdshp4Z9KFg8VkO7xHt5t5tFok6/iwi5dzGDOFXR/3ez4QvY1MMdKM
	 yoY1EZfbwcLUw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Jun 2025 09:38:02 +0200
Message-Id: <DAOMXR37F36S.2P4ZRUYF7E140@kernel.org>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/2] uaccess: rust: add
 UserSliceReader::strcpy_into_buf
From: "Benno Lossin" <lossin@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>, "Alexander Viro"
 <viro@zeniv.linux.org.uk>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.20.1
References: <20250616-strncpy-from-user-v5-0-2d3fb0e1f5af@google.com>
 <20250616-strncpy-from-user-v5-2-2d3fb0e1f5af@google.com>
In-Reply-To: <20250616-strncpy-from-user-v5-2-2d3fb0e1f5af@google.com>

On Mon Jun 16, 2025 at 2:41 PM CEST, Alice Ryhl wrote:
> This patch adds a more convenient method for reading C strings from
> userspace. Logic is added to NUL-terminate the buffer when necessary so
> that a &CStr can be returned.
>
> Note that we treat attempts to read past `self.length` as a fault, so
> this returns EFAULT if that limit is exceeded before `buf.len()` is
> reached.
>
> Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

I have one concern left below, when we fix or resolve that:

Reviewed-by: Benno Lossin <lossin@kernel.org>

> ---
>  rust/kernel/uaccess.rs | 60 ++++++++++++++++++++++++++++++++++++++++++++=
+++++-
>  1 file changed, 59 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> index 635a03e0989f3fe99be80987aa47763782de1d3f..106aa05ea1b88868fe48f64ca=
9c86b20ad7db68e 100644
> --- a/rust/kernel/uaccess.rs
> +++ b/rust/kernel/uaccess.rs
> @@ -291,6 +291,65 @@ pub fn read_all<A: Allocator>(mut self, buf: &mut Ve=
c<u8, A>, flags: Flags) -> R
>          unsafe { buf.inc_len(len) };
>          Ok(())
>      }
> +
> +    /// Read a NUL-terminated string from userspace and return it.
> +    ///
> +    /// The string is read into `buf` and a NUL-terminator is added if t=
he end of `buf` is reached.
> +    /// Since there must be space to add a NUL-terminator, the buffer mu=
st not be empty. The
> +    /// returned `&CStr` points into `buf`.
> +    ///
> +    /// Fails with [`EFAULT`] if the read happens on a bad address (some=
 data may have been
> +    /// copied).
> +    #[doc(alias =3D "strncpy_from_user")]
> +    pub fn strcpy_into_buf<'buf>(self, buf: &'buf mut [u8]) -> Result<&'=
buf CStr> {
> +        if buf.is_empty() {
> +            return Err(EINVAL);
> +        }
> +
> +        // SAFETY: The types are compatible and `strncpy_from_user` does=
n't write uninitialized
> +        // bytes to `buf`.
> +        let mut dst =3D unsafe { &mut *(buf as *mut [u8] as *mut [MaybeU=
ninit<u8>]) };
> +
> +        // We never read more than `self.length` bytes.
> +        if dst.len() > self.length {
> +            dst =3D &mut dst[..self.length];
> +        }
> +
> +        let mut len =3D raw_strncpy_from_user(dst, self.ptr)?;
> +        if len < dst.len() {
> +            // Add one to include the NUL-terminator.
> +            len +=3D 1;
> +        } else if len < buf.len() {
> +            // This implies that `len =3D=3D dst.len() < buf.len()`.
> +            //
> +            // This means that we could not fill the entire buffer, but =
we had to stop reading
> +            // because we hit the `self.length` limit of this `UserSlice=
Reader`. Since we did not
> +            // fill the buffer, we treat this case as if we tried to rea=
d past the `self.length`
> +            // limit and received a page fault, which is consistent with=
 other `UserSliceReader`
> +            // methods that also return page faults when you exceed `sel=
f.length`.
> +            return Err(EFAULT);
> +        } else {
> +            // This implies that `len =3D=3D buf.len()`.
> +            //
> +            // This means that we filled the buffer exactly. In this cas=
e, we add a NUL-terminator
> +            // and return it. Unlike the `len < dst.len()` branch, don't=
 modify `len` because it
> +            // already represents the length including the NUL-terminato=
r.
> +            //
> +            // SAFETY: Due to the check at the beginning, the buffer is =
not empty.
> +            unsafe { *buf.last_mut().unwrap_unchecked() =3D 0 };

What about the case `self.length =3D=3D 0`? Will `raw_strncpy_from_user`
return early with a page fault, or will it return with `len =3D=3D 0`?
Because if it is the latter, then this will result in UB.

---
Cheers,
Benno

> +        }
> +
> +        // This method consumes `self`, so it can only be called once, t=
hus we do not need to
> +        // update `self.length`. This sidesteps concerns such as whether=
 `self.length` should be
> +        // incremented by `len` or `len-1` in the `len =3D=3D buf.len()`=
 case.
> +
> +        // SAFETY: There are two cases:
> +        // * If we hit the `len < dst.len()` case, then `raw_strncpy_fro=
m_user` guarantees that
> +        //   this slice contains exactly one NUL byte at the end of the =
string.
> +        // * Otherwise, `raw_strncpy_from_user` guarantees that the stri=
ng contained no NUL bytes,
> +        //   and we have since added a NUL byte at the end.
> +        Ok(unsafe { CStr::from_bytes_with_nul_unchecked(&buf[..len]) })
> +    }
>  }
> =20
>  /// A writer for [`UserSlice`].
> @@ -380,7 +439,6 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Res=
ult {
>  /// When this function returns `Ok(len)`, it is guaranteed that the firs=
t `len` bytes of `dst` are
>  /// initialized and non-zero. Furthermore, if `len < dst.len()`, then `d=
st[len]` is a NUL byte.
>  #[inline]
> -#[expect(dead_code)]
>  fn raw_strncpy_from_user(dst: &mut [MaybeUninit<u8>], src: UserPtr) -> R=
esult<usize> {
>      // CAST: Slice lengths are guaranteed to be `<=3D isize::MAX`.
>      let len =3D dst.len() as isize;

