Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB262D600;
	Sat, 31 May 2025 15:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748705127; cv=none; b=m60IYUxfXJe4hL/L1zThYhQBPS94NqnXkfTicpMDaAbziS54h+RC1lr+yW4k7v+p/iISfx+NqER6xbBJPDYJjH03LQblJsR95FYvZ14lJZBrmH440PMHoYnWq/JqMnwDMa9IPS8fe8y6Q+3HM6wmghRTz1X8NxkRfPv888uUZ4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748705127; c=relaxed/simple;
	bh=wft+J8TL24I3IwuPe2nf3OWSwEu8ht1cNDHENrSRZCQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=Vta5fFeNidji3+SbXPEBjsGeVkbSZLmEhcV8ZsmgFA4R1SyCtiVLd2HsGKN82b+QmoAnOpDgrrcf2IE8B71UeERjifAP7IY1q33QJoN5pnd/I7zO5/p1+K7IfqwFB82IoU2DBiVagKZh1p7tligxgfhxMZsuTSGTtI8f9it6Jzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oK98iY+c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oK98iY+c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E11D5C4CEEF;
	Sat, 31 May 2025 15:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748705127;
	bh=wft+J8TL24I3IwuPe2nf3OWSwEu8ht1cNDHENrSRZCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oK98iY+cNAhz3uLA5VcHWnAtz9hq3q9j5jKdefIgP648xJ6PJ3d1zajgubpal+0Ji
	 ieuKH2f/JojeD8YCxSfdHEkuvN053xwrn0jxfum1DqM2y1xN/hEbxABD//mw2xv/eU
	 MyGhHX5B2QoXf6bfVCEU4PjATmOYR1V/Nv3wAlAh74XXpcSUXDKZXl0zU32ofvbHT0
	 rfo322vLR8i1tbC6MUCQhNN0F5g60/54xXVgP+QpBxABheVp8X3OtHQZvMjHdjfJm/
	 6r3oGOwhx0MJ0ps8sE2kfCuT44UmS1d3dSfKaeuxgcvxn60lM+RtslA96wCDFueDPm
	 XiAxFJP4O4bzQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 May 2025 17:25:22 +0200
Message-Id: <DAAG8AUG7GE2.EVO9Y6PZTHDI@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] uaccess: rust: add
 UserSliceReader::strcpy_into_buf
X-Mailer: aerc 0.20.1
References: <20250527-strncpy-from-user-v4-0-82168470d472@google.com>
 <20250527-strncpy-from-user-v4-2-82168470d472@google.com>
 <DA9P904SL0KL.1QNQAI240QLH6@kernel.org>
 <CAH5fLgjZrJ66VnW0J_CHc-3yUFOt+DRWgTCNxoftACga+Lw+fA@mail.gmail.com>
In-Reply-To: <CAH5fLgjZrJ66VnW0J_CHc-3yUFOt+DRWgTCNxoftACga+Lw+fA@mail.gmail.com>

On Sat May 31, 2025 at 3:25 PM CEST, Alice Ryhl wrote:
> On Fri, May 30, 2025 at 8:16=E2=80=AFPM Benno Lossin <lossin@kernel.org> =
wrote:
>> On Tue May 27, 2025 at 2:34 PM CEST, Alice Ryhl wrote:
>> > This patch adds a more convenient method for reading C strings from
>> > userspace. Logic is added to NUL-terminate the buffer when necessary s=
o
>> > that a &CStr can be returned.
>> >
>> > Note that we treat attempts to read past `self.length` as a fault, so
>> > this returns EFAULT if that limit is exceeded before `buf.len()` is
>> > reached.
>> >
>> > Reviewed-by: Danilo Krummrich <dakr@kernel.org>
>> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>> > ---
>> >  rust/kernel/uaccess.rs | 56 +++++++++++++++++++++++++++++++++++++++++=
++++++++-
>> >  1 file changed, 55 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
>> > index 9b1e4016fca2c25a44a8417c7e35e0fcf08aa959..e6534b52a1920254d61f83=
49426d4cdb38286089 100644
>> > --- a/rust/kernel/uaccess.rs
>> > +++ b/rust/kernel/uaccess.rs
>> > @@ -293,6 +293,61 @@ pub fn read_all<A: Allocator>(mut self, buf: &mut=
 Vec<u8, A>, flags: Flags) -> R
>> >          unsafe { buf.set_len(buf.len() + len) };
>> >          Ok(())
>> >      }
>> > +
>> > +    /// Read a NUL-terminated string from userspace and return it.
>> > +    ///
>> > +    /// The string is read into `buf` and a NUL-terminator is added i=
f the end of `buf` is reached.
>> > +    /// Since there must be space to add a NUL-terminator, the buffer=
 must not be empty. The
>> > +    /// returned `&CStr` points into `buf`.
>> > +    ///
>> > +    /// Fails with [`EFAULT`] if the read happens on a bad address (s=
ome data may have been
>> > +    /// copied).
>> > +    #[doc(alias =3D "strncpy_from_user")]
>> > +    pub fn strcpy_into_buf<'buf>(self, buf: &'buf mut [u8]) -> Result=
<&'buf CStr> {
>> > +        if buf.is_empty() {
>> > +            return Err(EINVAL);
>> > +        }
>> > +
>> > +        // SAFETY: The types are compatible and `strncpy_from_user` d=
oesn't write uninitialized
>> > +        // bytes to `buf`.
>> > +        let mut dst =3D unsafe { &mut *(buf as *mut [u8] as *mut [May=
beUninit<u8>]) };
>> > +
>> > +        // We never read more than `self.length` bytes.
>> > +        if dst.len() > self.length {
>> > +            dst =3D &mut dst[..self.length];
>> > +        }
>> > +
>> > +        let mut len =3D raw_strncpy_from_user(dst, self.ptr)?;
>> > +        if len < dst.len() {
>> > +            // Add one to include the NUL-terminator.
>> > +            len +=3D 1;
>> > +        } else if len < buf.len() {
>> > +            // This implies that `len =3D=3D dst.len() < buf.len()`.
>> > +            //
>> > +            // This means that we could not fill the entire buffer, b=
ut we had to stop reading
>> > +            // because we hit the `self.length` limit of this `UserSl=
iceReader`. Since we did not
>> > +            // fill the buffer, we treat this case as if we tried to =
read past the `self.length`
>> > +            // limit and received a page fault, which is consistent w=
ith other `UserSliceReader`
>> > +            // methods that also return page faults when you exceed `=
self.length`.
>> > +            return Err(EFAULT);
>> > +        } else {
>> > +            // This implies that len =3D=3D buf.len().
>> > +            //
>> > +            // This means that we filled the buffer exactly. In this =
case, we add a NUL-terminator
>> > +            // and return it. Unlike the `len < dst.len()` branch, do=
n't modify `len` because it
>> > +            // already represents the length including the NUL-termin=
ator.
>> > +            //
>> > +            // SAFETY: Due to the check at the beginning, the buffer =
is not empty.
>> > +            unsafe { *buf.last_mut().unwrap_unchecked() =3D 0 };
>>
>> In this case you're overwriting the last character read. Should we give
>> `raw_strncpy_from_user` access to one less byte and then write NUL into
>> that?
>
> Why? I'm not interested in changing the implementation just because.
> It needs to be significantly simpler, and I do not think it is.

Sure, but then I think we should document this behavior.

---
Cheers,
Benno
