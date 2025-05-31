Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3524D1537C8;
	Sat, 31 May 2025 20:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748723887; cv=none; b=kZzK3OFnwfo0JM7y3ox6b6XUxe83NQv/yHKYvAYB4fXWMiyeL5Lr/+0Ik902lxfcGvv6VMSkDjiHjNz8kdvV28v9jTh4duextFqa+vfidMNuz4zjIu5Z3/p1ehdezdZu02G8pPJcRuubzByx0RA4b0crCVwZhG5n6sWx5hSWw48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748723887; c=relaxed/simple;
	bh=0Xtv3fU2Y6hcXhrv+D+tBLu8tfvnxa/3aHdyLWNjrRU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=twXMOFFRfyW6bq7xTVdIA5g3V4z1qA7as2NRJxB6LTrElbiLg7CrhW9yPpq+FzE7jMx7lOmoe5EhK+u3wLCwAQpNCqW+sRwgWehQIk8sFoS7P22meRgNaY7HVRADU8RKLoLJ1317s6ZQZ3rp7v47be9Q6d2XAJM0AOqcKF0QLqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PIhX+ad0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PIhX+ad0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE7C0C4CEE3;
	Sat, 31 May 2025 20:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748723886;
	bh=0Xtv3fU2Y6hcXhrv+D+tBLu8tfvnxa/3aHdyLWNjrRU=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=PIhX+ad0xHjJAsGjquYIrOtftX4+Xg2pP+iGc6+WPKIXWwUOT6g1zphtuQ15K3bNz
	 Gpo/R2VYnJEG7e0KcVPCycnlRqyeSB1Fe3MOgFECjOZQN0TeZgwm1l5yV9qN+yRetR
	 F5/SccNWFjQEwEjq+HLQCVkaVL1XVAT6fsZigxQSPAWbLqjSgUlvFGxGB9bnK3B+54
	 ITWcyN1YhBzKUROJ0Rgw/lmz/8VQJRSkhG4TfTEu+QLAjxEUwOoiFjORMdLhH6d/2h
	 YLOB7ioYbnxcAZIPU1g/AUe4pbPr7SMnZqyqtNJ1yBd/IZ30RQcLYkjHtrHFYoTLz4
	 obkyR511crJxw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 May 2025 22:38:02 +0200
Message-Id: <DAAMVOZJDNNT.1JR5YY3ICI0Q5@kernel.org>
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
From: "Benno Lossin" <lossin@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
X-Mailer: aerc 0.20.1
References: <20250527-strncpy-from-user-v4-0-82168470d472@google.com>
 <20250527-strncpy-from-user-v4-2-82168470d472@google.com>
 <DA9P904SL0KL.1QNQAI240QLH6@kernel.org>
 <CAH5fLgjZrJ66VnW0J_CHc-3yUFOt+DRWgTCNxoftACga+Lw+fA@mail.gmail.com>
 <DAAG8AUG7GE2.EVO9Y6PZTHDI@kernel.org>
 <CAH5fLgjNCQV8zsfdeq21iXiu_VOpt=WGnm9nMp-B0bOEMEBctw@mail.gmail.com>
In-Reply-To: <CAH5fLgjNCQV8zsfdeq21iXiu_VOpt=WGnm9nMp-B0bOEMEBctw@mail.gmail.com>

On Sat May 31, 2025 at 7:38 PM CEST, Alice Ryhl wrote:
> On Sat, May 31, 2025 at 5:25=E2=80=AFPM Benno Lossin <lossin@kernel.org> =
wrote:
>> On Sat May 31, 2025 at 3:25 PM CEST, Alice Ryhl wrote:
>> > On Fri, May 30, 2025 at 8:16=E2=80=AFPM Benno Lossin <lossin@kernel.or=
g> wrote:
>> >> On Tue May 27, 2025 at 2:34 PM CEST, Alice Ryhl wrote:
>> >> > This patch adds a more convenient method for reading C strings from
>> >> > userspace. Logic is added to NUL-terminate the buffer when necessar=
y so
>> >> > that a &CStr can be returned.
>> >> >
>> >> > Note that we treat attempts to read past `self.length` as a fault, =
so
>> >> > this returns EFAULT if that limit is exceeded before `buf.len()` is
>> >> > reached.
>> >> >
>> >> > Reviewed-by: Danilo Krummrich <dakr@kernel.org>
>> >> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>> >> > ---
>> >> >  rust/kernel/uaccess.rs | 56 ++++++++++++++++++++++++++++++++++++++=
+++++++++++-
>> >> >  1 file changed, 55 insertions(+), 1 deletion(-)
>> >> >
>> >> > diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
>> >> > index 9b1e4016fca2c25a44a8417c7e35e0fcf08aa959..e6534b52a1920254d61=
f8349426d4cdb38286089 100644
>> >> > --- a/rust/kernel/uaccess.rs
>> >> > +++ b/rust/kernel/uaccess.rs
>> >> > @@ -293,6 +293,61 @@ pub fn read_all<A: Allocator>(mut self, buf: &=
mut Vec<u8, A>, flags: Flags) -> R
>> >> >          unsafe { buf.set_len(buf.len() + len) };
>> >> >          Ok(())
>> >> >      }
>> >> > +
>> >> > +    /// Read a NUL-terminated string from userspace and return it.
>> >> > +    ///
>> >> > +    /// The string is read into `buf` and a NUL-terminator is adde=
d if the end of `buf` is reached.
>> >> > +    /// Since there must be space to add a NUL-terminator, the buf=
fer must not be empty. The
>> >> > +    /// returned `&CStr` points into `buf`.
>> >> > +    ///
>> >> > +    /// Fails with [`EFAULT`] if the read happens on a bad address=
 (some data may have been
>> >> > +    /// copied).
>> >> > +    #[doc(alias =3D "strncpy_from_user")]
>> >> > +    pub fn strcpy_into_buf<'buf>(self, buf: &'buf mut [u8]) -> Res=
ult<&'buf CStr> {
>> >> > +        if buf.is_empty() {
>> >> > +            return Err(EINVAL);
>> >> > +        }
>> >> > +
>> >> > +        // SAFETY: The types are compatible and `strncpy_from_user=
` doesn't write uninitialized
>> >> > +        // bytes to `buf`.
>> >> > +        let mut dst =3D unsafe { &mut *(buf as *mut [u8] as *mut [=
MaybeUninit<u8>]) };
>> >> > +
>> >> > +        // We never read more than `self.length` bytes.
>> >> > +        if dst.len() > self.length {
>> >> > +            dst =3D &mut dst[..self.length];
>> >> > +        }
>> >> > +
>> >> > +        let mut len =3D raw_strncpy_from_user(dst, self.ptr)?;
>> >> > +        if len < dst.len() {
>> >> > +            // Add one to include the NUL-terminator.
>> >> > +            //
>> >> > +            // This means that we could not fill the entire buffer=
, but we had to stop reading
>> >> > +            // because we hit the `self.length` limit of this `Use=
rSliceReader`. Since we did not
>> >> > +            // fill the buffer, we treat this case as if we tried =
to read past the `self.length`
>> >> > +            // limit and received a page fault, which is consisten=
t with other `UserSliceReader`
>> >> > +            // methods that also return page faults when you excee=
d `self.length`.
>> >> > +            return Err(EFAULT);
>> >> > +        } else {
>> >> > +            // This implies that len =3D=3D buf.len().
>> >> > +            //
>> >> > +            // This means that we filled the buffer exactly. In th=
is case, we add a NUL-terminator
>> >> > +            // and return it. Unlike the `len < dst.len()` branch,=
 don't modify `len` because it
>> >> > +            // already represents the length including the NUL-ter=
minator.
>> >> > +            //
>> >> > +            // SAFETY: Due to the check at the beginning, the buff=
er is not empty.
>> >> > +            unsafe { *buf.last_mut().unwrap_unchecked() =3D 0 };
>> >>
>> >> In this case you're overwriting the last character read. Should we gi=
ve
>> >> `raw_strncpy_from_user` access to one less byte and then write NUL in=
to
>> >> that?
>> >
>> > Why? I'm not interested in changing the implementation just because.
>> > It needs to be significantly simpler, and I do not think it is.
>>
>> Sure, but then I think we should document this behavior.
>
> Document what? I understood your suggestion as a change to the
> implementation of strcpy_into_buf that would not change its behavior.
> Did I misunderstand?

Maybe I misunderstood the code, but if you do this:

    let slice =3D UserSlice::new(ptr, 1024);
    let mut buf =3D [0; 42];
    let s =3D slice.strcpy_into_buf(&mut buf)?;

Then it will read 42 characters from userspace and (if there was no nul
byte) overwrite the last character with `\0`. If we now do

    let mut buf2 =3D [0; 42];
    let s2 =3D slice.strcpy_into_buf(&mut buf2)?;

Then that will continue the read at index 42, but effectively one
character will get skipped.

(Now it's not possible to call `strcpy_into_buf` multiple times, but I
see no real reason why it isn't a `&mut self` method. Also a user could
call `clone_reader` and then manually `skip` 42 bytes. Although they
might only skip 41 bytes, since that's the length of the CStr. But that
runs into the problem that if there was a `\0` at index 41, then
repeated uses of the pattern above will yield empty strings.)

---
Cheers,
Benno
