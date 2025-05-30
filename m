Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E981E0E14;
	Fri, 30 May 2025 18:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748629013; cv=none; b=Jci/RIBeL3EAGX2nueYDECse/ngJAjShlMLicS5xwLsqESV2npQua9I0bGVShJWUmz4NzzDo5yhAcOGskhdO9efxlojUjqsJQ1SCeAbUQC+5PMArpqM1xOJRQZZ7Zg9Co2zvkHOQjevBHngpW3PfW5XPgxbbnU5o0yhWJj0zRhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748629013; c=relaxed/simple;
	bh=Q0UTwuo5BhxYl6fEszLjBcA1mdRM9zUc+h/bZgGSl4k=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=tENSkfuVyxOKI10S/4OvZla4+IBI5ib0gvDURBp/Bkrc90sTt4GiQY+o2NcvuAzY+pJajepuQ1wwaeBkNChLXYr/4ybHL4wM43//u8SwcFapdQUWdkLfW+sVj8ekp2sriJRMja2m7MdgGcLrmzs83o4Lp2enZAzx3n8yzBNqZok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z60I4gG8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z60I4gG8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3B58C4CEE9;
	Fri, 30 May 2025 18:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748629011;
	bh=Q0UTwuo5BhxYl6fEszLjBcA1mdRM9zUc+h/bZgGSl4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z60I4gG8Zs2+PdrVAAwNsJVPckvR3JPx9FZuci+RlFGMcCwOqUi5S7W2dc0bPgYBc
	 Je7JD3XWT9kPInJsikspj7awioMOr/Q/RH4RuBjwEeiG4yZBsgogZ+OV6LOTSZP/Jq
	 TkcVlPgpY/ycMwwRNksmBh+L5cgQAXY9R3XfiqHmLMks1TKRHhKNcCf2jGkrKPrSIa
	 0ugscGTM/Qf6BrT0t3TrGIRWdMOE1VNXn+2nQFNeeizCP0ivecbOmxNTE/4pEpEOjW
	 c3hjK3vdVoSIyN2IbmArYYo/nPS3AsX49DhUqAMluZECS1ENORt3KFmZAB/PDPaFzB
	 p1wRffEcg9z2A==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 May 2025 20:16:47 +0200
Message-Id: <DA9P904SL0KL.1QNQAI240QLH6@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>, "Alexander Viro"
 <viro@zeniv.linux.org.uk>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] uaccess: rust: add
 UserSliceReader::strcpy_into_buf
X-Mailer: aerc 0.20.1
References: <20250527-strncpy-from-user-v4-0-82168470d472@google.com>
 <20250527-strncpy-from-user-v4-2-82168470d472@google.com>
In-Reply-To: <20250527-strncpy-from-user-v4-2-82168470d472@google.com>

On Tue May 27, 2025 at 2:34 PM CEST, Alice Ryhl wrote:
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
> ---
>  rust/kernel/uaccess.rs | 56 ++++++++++++++++++++++++++++++++++++++++++++=
+++++-
>  1 file changed, 55 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> index 9b1e4016fca2c25a44a8417c7e35e0fcf08aa959..e6534b52a1920254d61f83494=
26d4cdb38286089 100644
> --- a/rust/kernel/uaccess.rs
> +++ b/rust/kernel/uaccess.rs
> @@ -293,6 +293,61 @@ pub fn read_all<A: Allocator>(mut self, buf: &mut Ve=
c<u8, A>, flags: Flags) -> R
>          unsafe { buf.set_len(buf.len() + len) };
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
> +            // This implies that len =3D=3D buf.len().
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

In this case you're overwriting the last character read. Should we give
`raw_strncpy_from_user` access to one less byte and then write NUL into
that?

---
Cheers,
Benno

> +        }
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
> @@ -383,7 +438,6 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Res=
ult {
>  /// initialized and non-zero. Furthermore, if `len < dst.len()`, then `d=
st[len]` is a NUL byte.
>  /// Unsafe code may rely on these guarantees.
>  #[inline]
> -#[expect(dead_code)]
>  fn raw_strncpy_from_user(dst: &mut [MaybeUninit<u8>], src: UserPtr) -> R=
esult<usize> {
>      // CAST: Slice lengths are guaranteed to be `<=3D isize::MAX`.
>      let len =3D dst.len() as isize;

