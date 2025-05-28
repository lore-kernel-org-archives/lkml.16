Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05358F6B;
	Wed, 28 May 2025 20:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748464507; cv=none; b=qqRfAIHmhK41XJZOqvjOVeKIF3FJdRX65AZ3d4PEJDUNyDHMgXW/T5yubZEwLkBdBY0cyTZ8MM6oVjwu/VpjQOhopfK88AjhBK5VrBhwfjEI9Ft6ACyEx3/DlHx3XKuvPHOKlRSc40ESTPkKy7kERZwt9B3YwqeaWE5I1E+Q5oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748464507; c=relaxed/simple;
	bh=6mNI6+5X2ZfP/LGcaBZDGWjzIzPRAkxIlDtsurqBF5U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=smlO2qkCd1BHQaOwLhPDElzQTIhKF2iwcYozWd/EyEmO2ewXMIpoTzgCxbm9VFeV3eDElf/QAyMjAMsFTNblXY+DhQiwWKmCXShsrqJV0LMlwOv9UsbQ4LzB/QMMucgPhDoY837IyzSW25xIUfafABIYh45lTpaZ9pnfMqX2/Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u8Jbe5r9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u8Jbe5r9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20843C4CEE3;
	Wed, 28 May 2025 20:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748464506;
	bh=6mNI6+5X2ZfP/LGcaBZDGWjzIzPRAkxIlDtsurqBF5U=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=u8Jbe5r9O2itgEsB0A0s4v3vbgwUxB/9coRnZ7PxRcgnB1LDmTcUBJYDZ28N3iFpd
	 LBHx8tDWeMMhzxqFUPlZ0XN2JshDc/q9aLPiC0Al2OywUM2Ki6etxwnpxPDlpXwQDf
	 H884mvUcVXrwjuJr0bGxyMroSnjciGkOYaiV4MGkByLKrZdVLcMMHmY9P2S09H/9pw
	 559Bd3b9yz215tLSF+hUca9JZtQslKomRgZ3his3Qeaokt1J/GxdmbYLbXlHm2nRcz
	 kl4vD4WvJrGTSfkrIA/z7grGxhjMuqvtQdT8gaggUmK5hPwftBENfD1am3xKQhqH0p
	 BRiqqRy+YT4JA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 May 2025 22:35:01 +0200
Message-Id: <DA82XR7C0NCM.DPN2F8RHAB3Y@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Arnd Bergmann" <arnd@arndb.de>, "Andrew
 Morton" <akpm@linux-foundation.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor Gross"
 <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Al Viro"
 <viro@ftp.linux.org.uk>
Subject: Re: [PATCH v2] uaccess: rust: use newtype for user pointers
From: "Benno Lossin" <lossin@kernel.org>
To: "Al Viro" <viro@zeniv.linux.org.uk>, "Alice Ryhl" <aliceryhl@google.com>
X-Mailer: aerc 0.20.1
References: <20250527-userptr-newtype-v2-1-a789d266f6b0@google.com>
 <20250527221211.GB2023217@ZenIV> <aDbpsB3ayj6tFfbI@google.com>
 <20250528174546.GC2023217@ZenIV>
In-Reply-To: <20250528174546.GC2023217@ZenIV>

On Wed May 28, 2025 at 7:45 PM CEST, Al Viro wrote:
> On Wed, May 28, 2025 at 10:47:12AM +0000, Alice Ryhl wrote:
>
>> We don't currently have any way to perform that kind of pointer-math on
>> user pointers, nor do we have any users of it. I imagine that this type
>> checking is only useful if you can actually perform pointer math in the
>> first place?
>
> What you want is something like
> 	x->field::UserPtr(beta) iff
> 		x::UserPtr(alpha) and
> 		_.field::beta where _::alpha

Not 100% sure I understand your code correctly, do you mean that:
`x->field` is of type `UserPtr(beta)` given that `x` is of type
`UserPtr(alpha)` and `field` is a field of `alpha` of type `beta`?

If that is correct, then I have a proposal called field projection [1]
for the rust language itself to support this kind of operation for any
custom type.

I also have an macro-based implementation [2] and I could cook up some
examples with `UserPtr` [^3].

[1]: https://github.com/rust-lang/rfcs/pull/3735
[2]: https://github.com/Rust-for-Linux/field-projection/tree/new
[^3]: Here is a quick sketch of how the above would look like in Rust
      using [2]:

      #[derive(HasFields)]
      struct Alpha {
          field: Beta,
      }

      impl Alpha {
          fn write_beta<'a>(mut self: UserPtr<'a, Self>, value: Beta) {
              start_proj!(mut self);
              let mut field: UserPtr<'a, Beta> =3D p!(@mut self->field);
              field.write(value);
          }
      }

      A couple notes for anyone not too familiar with Rust:

      * `'a` is called a lifetime, it says for how long a value is valid
      * the `< ... >` are generic types
      * the `ident: Type` is a type annotation used in parameters (not
        optional) and in local variable bindings (optional)
      * the `self` parameter is special, it allows one to use the
        `val.fun` syntax (it's similar to `this` in java and `self` in
        python, but without the object orientation stuff associated with
        it)

---
Cheers,
Benno

> Generated code would be "add offset and cast to pointer to type of...",
> but doing that manually would really invite headache.
