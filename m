Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132964B1E7F;
	Wed,  7 May 2025 08:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746606922; cv=none; b=oz7MNuDDd33zlVMid5Vi1eCNghAdb0vMtO+JRjhXXXDfJBF2scshyrJnOo3LOI6IYBy87XdqvHSl3ZbQhuo4D3sZH6X6veHUqkMpFMpYdn+btu7ojbvCrge+QFRY9vzbXtNMqOatowpgP99aPUziF5r+Ytua2FbpwJJQa9AWH2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746606922; c=relaxed/simple;
	bh=/aLzKK1+TXgtaI7bR9R4XJusdghzOZn9kA1gh/iG+ks=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=CxYNRR880kgcnTNfkFLl1t4jWJmJU3ASO3eYHvq/FTU8rJcTWxdckFr8dR4wHPHYLKv6glMCWV0XkVDWq2KeeFPul3yTfLHkNPoMeFVG4kGExNelFkXGaOFw9m95T2nbMZ8I46go2FpRnPfUH06fKjHvfLYu5LBUccqzsLvFcTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OWFQ2YoA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OWFQ2YoA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05904C4CEE7;
	Wed,  7 May 2025 08:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746606921;
	bh=/aLzKK1+TXgtaI7bR9R4XJusdghzOZn9kA1gh/iG+ks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OWFQ2YoA7dbFehw91o+AWB8FGNjelKsjGEd+GJu3EqTJvi5BSfIijU9KcmKNoMI1/
	 v89B1NFt2HzbF79JZr/YbPWGTTRAQoEy4V0K6nr1ICMdckmV7sHwVnAdMObyQ7VJml
	 UN1lBZ9oJob6tGiEAqLzLSZO71hSEx1/1cG51tNsJ/4yB94i+3GjlHKhoKYRONTKUk
	 B4gXqGuVEqjQgvTykrjKyE+xMYIt7UcqgAwSAsRym1e0nZEu7eKQHfOmod4BLa5xc/
	 bC+f1nS3bqfOUU5Sze2OXGOHSY+DTwZ930bj/YzfFn86oER3002ZuoKAV2sjptfsqj
	 I5OjtHAGFLb1g==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 May 2025 10:35:16 +0200
Message-Id: <D9PSH8MJ48JO.3OOA3Z3NSBGC9@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
Cc: "Oliver Mangold" <oliver.mangold@pm.me>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] rust: elaborate safety requirements for
 `AlwaysReferenceCounted`
X-Mailer: aerc 0.20.1
References: <20250506-aref-from-raw-v2-1-5a35e47f4ec2@kernel.org>
In-Reply-To: <20250506-aref-from-raw-v2-1-5a35e47f4ec2@kernel.org>

On Tue May 6, 2025 at 10:29 AM CEST, Andreas Hindborg wrote:
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index 9d0471afc964..52683d686c8a 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -409,6 +409,10 @@ pub const fn raw_get(this: *const Self) -> *mut T {
>  /// Implementers must also ensure that all instances are reference-count=
ed. (Otherwise they
>  /// won't be able to honour the requirement that [`AlwaysRefCounted::inc=
_ref`] keep the object
>  /// alive.)
> +///
> +/// Implementers of this trait must ensure that values of types implemen=
ting this trait can never be
> +/// owned by value. Instead, values must be owned and used through a poi=
nter type. That is, a type
> +/// that implements [`Deref`].

I don't think this covers every case, if I modify your example above
with Alice's suggestion and using `Box` instead of the stack, I get the
same problem:

    struct Empty {}
=20
    unsafe impl AlwaysRefCounted for Empty {
        fn inc_ref(&self) {}
        unsafe fn dec_ref(_obj: NonNull<Self>) {}
    }
=20
    fn unsound() -> ARef<Empty> {
        use kernel::types::{ARef, RefCounted};
=20
        let data =3D Box::new(Empty {});
        let aref =3D ARef::from(&data);
=20
        aref
    }

The same should be true if one uses `Arc` instead of `Box`. So, even
though we store it in a "pointer type that implements `Deref`", it is
unsound.

I think that types that implement `AlwaysRefCounted` must only be store
inside of `ARef<T>`. So something like "Values of this trait must only
be exposed as `ARef<Self>` or `&Self`." I'm not satisfied with the
wording 'exposed', maybe you have a better word or can expand the
sentence.

---
Cheers,
Benno

>  pub unsafe trait AlwaysRefCounted {
>      /// Increments the reference count on the object.
>      fn inc_ref(&self);
>
> ---
> base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e
> change-id: 20250502-aref-from-raw-e110b3e6dbf5
>
> Best regards,

