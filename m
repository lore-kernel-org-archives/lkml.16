Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C720B21C16D;
	Wed, 14 May 2025 09:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747215536; cv=none; b=CkA7AOe0n//JtGBgXAd7El46X+a3ZqFQPqjM+iAlwYpgss53DMO5w2LIYVPOyM4Zrg/YZf8DGmsfSB9gr0oMAlmCHmEOEHRTv+qte/+sXEFktY2/xfcf7mXiTjZWj8AyYsChjQgbKvq/BIH3NIYDHJVtHiVM2+ciqQydCwGFUQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747215536; c=relaxed/simple;
	bh=/HtRjQVvBFILgrC0Hi5f/Rs7A+6DOr3qwrunJOTC18A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Fp+pz4gDJgvOdWhKoaOE4fIpKC3q+pLJox4zBnLAxTcQvCTJPDUZQyrbCuJHOz4PtSZ0I/0zJkpk1YryT/tIQk9jzL7/RC5+7nqoCJOb3AuQvL6OXyIfi2LPBNASbOBCAdyuyDNtMbOfylMmBWnxckuZXvt9KQQft6R8y1MMABg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PDgYAL4Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PDgYAL4Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48677C4CEE9;
	Wed, 14 May 2025 09:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747215535;
	bh=/HtRjQVvBFILgrC0Hi5f/Rs7A+6DOr3qwrunJOTC18A=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=PDgYAL4QCpqxzaUFU7HIqjmKxnVK11e8ppHvbMfn1Zbcg2eqGbZlS8eR9OW1A2Vle
	 qN5Ht1MP6WvBk22zYLZnjmISz7jsWspWDB22B+Ilh5dNTsBmAypBCfDYZaT1Sc6s/W
	 UDMVwjBbvvjpI3gL/lV0fjilZaRHPgKrdomzQbmLWAiawJTT+0Wu/86ju4QQ/cjmRt
	 2ESiBHlrhqt3F1m4f8sm/mvzlypwE7opAUqdRmAKZFTY8xrWRr9OY72oAMLDtz66pF
	 /Y7SUExgAPJjpQ/KDWWNJFSTq+KZ9euY3YlKpwAiWrooxyCokS71r4S8xbFX5Msbez
	 b8/aRT7qrN8Jw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 May 2025 11:38:50 +0200
Message-Id: <D9VS7Q1LVMU0.14MJI8ACKVXLU@kernel.org>
Subject: Re: [PATCH v5 1/4] rust: debugfs: Bind DebugFS directory creation
From: "Benno Lossin" <lossin@kernel.org>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: "Matthew Maurer" <mmaurer@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Sami Tolvanen" <samitolvanen@google.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
 <20250505-debugfs-rust-v5-1-3e93ce7bb76e@google.com>
 <D9VPJFJ44PUP.3D0HGIEJC9UGY@kernel.org>
 <2025051451-charm-lankiness-8d59@gregkh>
In-Reply-To: <2025051451-charm-lankiness-8d59@gregkh>

On Wed May 14, 2025 at 10:49 AM CEST, Greg Kroah-Hartman wrote:
> On Wed, May 14, 2025 at 09:33:05AM +0200, Benno Lossin wrote:
>> On Tue May 6, 2025 at 1:51 AM CEST, Matthew Maurer wrote:
>> > +impl<'a> Dir<'a> {
>> > +    /// Create a new directory in DebugFS. If `parent` is [`None`], i=
t will be created at the root.
>> > +    #[cfg(CONFIG_DEBUG_FS)]
>> > +    fn create<'b>(name: &CStr, parent: Option<&'a Dir<'b>>) -> Self {
>> > +        let parent_ptr =3D match parent {
>> > +            Some(parent) =3D> parent.0.as_ptr(),
>> > +            None =3D> core::ptr::null_mut(),
>> > +        };
>> > +        // SAFETY:
>> > +        // * `name` argument points to a NUL-terminated string that l=
ives across the call, by
>> > +        //   invariants of `&CStr`.
>> > +        // * If `parent` is `None`, `parent` accepts null pointers to=
 mean create at root.
>> > +        // * If `parent` is `Some`, `parent` accepts live dentry debu=
gfs pointers.
>> > +        //   so we can call `Self::from_ptr`.
>> > +        let dir =3D unsafe { bindings::debugfs_create_dir(name.as_cha=
r_ptr(), parent_ptr) };
>> > +
>> > +        // SAFETY: `debugfs_create_dir` either returns an error code =
or a legal `dentry` pointer,
>> > +        Self(unsafe { Entry::from_ptr(dir) })
>> > +    }
>> > +
>> > +    #[cfg(not(CONFIG_DEBUG_FS))]
>> > +    fn create<'b>(_name: &CStr, _parent: Option<&'a Dir<'b>>) -> Self=
 {
>> > +        Self(Entry::new())
>> > +    }
>> > +
>> > +    /// Create a DebugFS subdirectory.
>>=20
>> I'm not familiar with debugfs, if I run `Dir::create(c"foo", None)`
>> twice, will both of the returned values refer to the same or different
>> directories?=20
>
> You can not create a directory, or file, in the same location with the
> same name.  The call will fail, so don't do that :)
>
>> What if I give a parent?
>
> Same thing, it will fail.
>
>> If the answer in both cases is that they will refer to the same
>> directory, then I'd change the docs to mention that.
>
> Nope, that does not happen.
>
>> So instead of
>> "Creates" we could say "Finds or creates" or something better.
>
> Find does not happen.
>
>> If they refer to different files, then I am confused how that would look
>> like in user-land :)
>
> Agreed, which is why that does not happen :)

Ah that makes sense, thanks for explaining :)

---
Cheers,
Benno
