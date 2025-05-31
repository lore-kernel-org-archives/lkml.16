Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D997523C8AA;
	Sat, 31 May 2025 15:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748705082; cv=none; b=jZ9GX5i4dHdQV0B078YNBgI7InffijS9wHqhw/NTNaFVgtg3OxGukNOp97uUDe5XXDejqR1C4YrtsgWAerAcgMl+gYkNxaE79qGVaGQMehs2uNfawT1/qCJbp2h/Er0yEySOQEsfv0DkI+WPBpFPYvKXqXDjcXmYdlt+r4X0UQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748705082; c=relaxed/simple;
	bh=yd4Pp8qjfcD/sAUM0i3LEQZurmg2V7XgoLJekg3Orj0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=qQGwSoR8kNRTckEE7rIsaLNRdTeYKXr5UWX1AWGlEh5xOAzM1m7ipRkTmhErqM4nXp/Vp9OcdQ+WetItDF94XXZuoL+sxkHa0XPsGLV5D5jOEClUlbMbU7Znlasiz1EU3zxz0NlX9sCkC2rXvKFNaYB6QGtKX7TgzrZBgx+UDao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=agO2V/6f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="agO2V/6f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01574C4CEE3;
	Sat, 31 May 2025 15:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748705082;
	bh=yd4Pp8qjfcD/sAUM0i3LEQZurmg2V7XgoLJekg3Orj0=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=agO2V/6fRY1XWP94nVkXBvN2DhBauOPIah8KJAaCsThsapwPzCh1c4iTbq9SejxJm
	 d0RMFWsAHYO/v/OnqtodeV2JfpegB0iDCjmN8WWQe2JMSf7BbbmWaM1+CPK5VgLxMz
	 qMGnS4HaHGFSYgvrzuzQ0Y80VrdrLABL+EoJS1OWDXUniB5NhQqxm9Cg5aEAauV11U
	 4NWoAPm5UzJP/uhM+ryZg2B5tRwhQsuxt4FJv6+RxVBSwQqLHK44+Cci6NC55NCs8m
	 5jXBSFdBl9+NBaj7TW51JiRuQ4oeRKIdAZ2E64/uuk81EBsdKMZChIa0yOd6zswJFh
	 H/YiBAYUvs9fw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 May 2025 17:24:38 +0200
Message-Id: <DAAG7QOYXDFA.37VBAYSFJYJCF@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] uaccess: rust: add strncpy_from_user
From: "Benno Lossin" <lossin@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
X-Mailer: aerc 0.20.1
References: <20250527-strncpy-from-user-v4-0-82168470d472@google.com>
 <20250527-strncpy-from-user-v4-1-82168470d472@google.com>
 <DA9P6CSP6563.1OYPZXIP5S7N1@kernel.org>
 <CAH5fLgjoX5AEO8NvDdj+05HUtpoVUPpOa7ri5UG6Djp98vQDxQ@mail.gmail.com>
In-Reply-To: <CAH5fLgjoX5AEO8NvDdj+05HUtpoVUPpOa7ri5UG6Djp98vQDxQ@mail.gmail.com>

On Sat May 31, 2025 at 3:27 PM CEST, Alice Ryhl wrote:
> On Fri, May 30, 2025 at 8:13=E2=80=AFPM Benno Lossin <lossin@kernel.org> =
wrote:
>> On Tue May 27, 2025 at 2:34 PM CEST, Alice Ryhl wrote:
>> > +#[inline]
>> > +#[expect(dead_code)]
>> > +fn raw_strncpy_from_user(dst: &mut [MaybeUninit<u8>], src: UserPtr) -=
> Result<usize> {
>> > +    // CAST: Slice lengths are guaranteed to be `<=3D isize::MAX`.
>> > +    let len =3D dst.len() as isize;
>> > +
>> > +    // SAFETY: `dst` is valid for writing `dst.len()` bytes.
>> > +    let res =3D unsafe {
>> > +        bindings::strncpy_from_user(dst.as_mut_ptr().cast::<c_char>()=
, src as *const c_char, len)
>> > +    };
>> > +
>> > +    if res < 0 {
>> > +        return Err(Error::from_errno(res as i32));
>> > +    }
>> > +
>> > +    #[cfg(CONFIG_RUST_OVERFLOW_CHECKS)]
>> > +    assert!(res <=3D len);
>> > +
>> > +    Ok(res as usize)
>>
>> We probably should add a `GUARANTEES` comment here, no?
>
> I can see the idea behind such comments, but I do not believe we've
> used them so far.

Yes, but we also haven't really used `# Guarantees` all that often.

---
Cheers,
Benno
