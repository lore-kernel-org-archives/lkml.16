Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D902E567;
	Wed, 28 May 2025 15:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748446693; cv=none; b=YLFoXZo95Vy07Zu9jeIiDAQvyNpeKWoOwHLLzdprvX2xVRUYpBO1CjgEe2zESF9mXr5LXwyQXrB622dHZaa//+WmzDgKd2AxDfhIXTL4poZ60OHDG1zOMsh6olgs1jPImaT2cn3yZepT/ALE+RtTrwHSYrl/h8nO/WAwmoXs51o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748446693; c=relaxed/simple;
	bh=DxUiu34y960Pp2icfPC+3P8sA4wh8Nmjsq4tuxZsZ+U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ry2+jd1VBacDsvdRNKJ/Hvi7IVy3Y4CXtasdCm7xiW669SzuM9Rgteh2fVmbmmosyWDC2EL/RA1PCe51PKO9KTZx5L4eRPgpnx+t6FftDtGE8Ieie8VM0eHkIO88JMMVCaS3v140IjfMwiGrW8m6+NOzUloXvtO928kq39BlB9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BUC/kyK4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BUC/kyK4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F27C0C4CEE3;
	Wed, 28 May 2025 15:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748446693;
	bh=DxUiu34y960Pp2icfPC+3P8sA4wh8Nmjsq4tuxZsZ+U=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=BUC/kyK4OV4UlweEG7n3yg1xl1oLI1ZYzP/0AwTVpWwKf10Vwv6ctk9j/37uM/A3x
	 pVNC8ACUtbBk2m5un42TYR0S8pLdsYG9GiOHa0ij0PELn//MF4J/ChIkn32VArL/yW
	 NhETXln+j2IBnca70fev+DKWahbeWj/ebRJWRHTHTb9ppwPspgh727T3BvEWXf8Gt8
	 P1+T54H/M6giYh31s3iXcgvnJZFSb4RBF634eMftJ2jXnflK8TUStY0TZPRZdvxaf9
	 5oSHDVFxhBwGR1MDek6Q4MtSoDJ1hDDHlAWYPlm3hIC4F7tQqEhZyNt2PTT5toxFYG
	 AiBP4CZ6VEB8A==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 May 2025 17:38:08 +0200
Message-Id: <DA7WMFWY8I6Z.2EADXSPL111PP@kernel.org>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Arnd Bergmann"
 <arnd@arndb.de>, "Andrew Morton" <akpm@linux-foundation.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor Gross"
 <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] uaccess: rust: use newtype for user pointers
From: "Benno Lossin" <lossin@kernel.org>
To: "Boqun Feng" <boqun.feng@gmail.com>, "Al Viro" <viro@zeniv.linux.org.uk>
X-Mailer: aerc 0.20.1
References: <20250527-userptr-newtype-v2-1-a789d266f6b0@google.com>
 <20250527221211.GB2023217@ZenIV>
 <68364701.050a0220.48858.0017@mx.google.com>
In-Reply-To: <68364701.050a0220.48858.0017@mx.google.com>

On Wed May 28, 2025 at 1:13 AM CEST, Boqun Feng wrote:
> On Tue, May 27, 2025 at 11:12:11PM +0100, Al Viro wrote:
>> On Tue, May 27, 2025 at 01:53:12PM +0000, Alice Ryhl wrote:
>> > In C code we use sparse with the __user annotation to detect cases whe=
re
>> > a user pointer is mixed up with other things. To replicate that, we
>> > introduce a new struct UserPtr that serves the same purpose using the
>> > newtype pattern.
>> >=20
>> > The UserPtr type is not marked with #[derive(Debug)], which means that
>> > it's not possible to print values of this type. This avoids ASLR
>> > leakage.
>> >=20
>> > The type is added to the prelude as it is a fairly fundamental type
>> > similar to c_int. The wrapping_add() method is renamed to
>> > wrapping_byte_add() for consistency with the method name found on raw
>> > pointers.
>>=20
>> That's considerably weaker than __user, though - with
>> 	struct foo {struct bar x; struct baz y[2]; };
>
> Translate to Rust this is:
>
>     struct Foo {
>         x: Bar,
> 	y: Baz[2],
>     }
>
>> 	struct foo __user *p;
>
> UserPtr should probably be generic over pointee, so:
>
>     pub struct UserPtr<T>(*mut c_void, PhantomData<*mut T>);
>
> and
>
>     let p: UserPtr<Foo> =3D ...;
>
>> 	void f(struct bar __user *);
>
> and this is:
>
>     pub fn f(bar: UserPtr<Bar>)
>
> and the checking should work, a (maybe unrelated) tricky part though..
>
>> sparse does figure out that f(&p->y[1]) is a type error - &p->y[1] is
>
> In Rust, you will need to play a little unsafe game to get &p->y[1]:
>
>     let foo_ptr: *mut Foo =3D p.as_mut_ptr();
>     let y_ptr: *mut Baz =3D unsafe { addr_of_mut!((*foo_ptr).y[1]) };
>     let y: UserPtr<Baz> =3D unsafe { UserPtr::from_ptr(y_ptr) };

Shouldn't this use `wrapping_add` since the pointer shouldn't be
dereferenced?

If we don't use `wrapping_add`, then the field projection operation for
this type must be `unsafe`.

---
Cheers,
Benno
