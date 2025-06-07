Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92ADF1D5CD7;
	Sat,  7 Jun 2025 15:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749310964; cv=none; b=F+v221GkGjIOVFwhNEfCby3bA5H4ds+HOr+7OIFtvG6wCT9cz9ZRL9hGJeDsFc0AwuX8GJDKZ3k8bOmI+n+dkjOPV1rgTPI7cHjcOWYKD5qQMT/StSSiR2diMlehOKuqyERRiJmL5faXFKv7/7cCz7eDSK0wZWCiggQOVMsrUgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749310964; c=relaxed/simple;
	bh=K7N1yZ/ACyy0cnPfQJ3bvI0ju0eq3ZaUwsSAruKdVHc=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=nFpPK16DqJJcGXaMB7ZSPNQwhIE5ENs49Vj+Kr3bwcErfdUJj815Zx5UdYwoZjhRSVXUTxz5pXSNbDmudLS84Shz116d2w4ViUepEru9JqMF4uPa2LBEfth78CouVoBaxXDhdqwrjua1voWB/GX/NVHHJvdBd98rYlaXj27y+Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mUyUjrL6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mUyUjrL6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF58FC4CEE4;
	Sat,  7 Jun 2025 15:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749310964;
	bh=K7N1yZ/ACyy0cnPfQJ3bvI0ju0eq3ZaUwsSAruKdVHc=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=mUyUjrL67i2wNj/nX3TSyBJba1sEh8Zmp9YUkehU99GXwyLlmklnPpJOpXClK0EFx
	 avk1ckEAwHtIOEklZ6PIxCKAyO+biGkKsIdKSid6JBQnVZO3W3RZkBiRk5OcejZDbK
	 AkDOtRte8s3ZH5s4COXUWbRzBPsAlmd8X4K+ypUK0IwIpk3m6oXvuHDTo1862TMJBI
	 kHy6Ml+Dw77yufBTpiXKrEjvVu9uOQ5b6rqZNd3ZvvD/lUWACfie/NvBjk20DCytve
	 UF0zw+oOPyf758dXYPO5EaE9RkQPsT8CezL71N3PihafnDLqQoG/AXlnAsGEcuygVN
	 yGyO1p7UrEkng==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 07 Jun 2025 17:42:39 +0200
Message-Id: <DAGEZCRR61A0.30H1MJQXW4CV5@kernel.org>
To: "Christian Schrefl" <chrisi.schrefl@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: add `assert_sync` function
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250607-assert_sync-v1-1-b18261da83e2@gmail.com>
In-Reply-To: <20250607-assert_sync-v1-1-b18261da83e2@gmail.com>

On Sat Jun 7, 2025 at 3:02 PM CEST, Christian Schrefl wrote:
> Adds a new file `compile_assert.rs` for asserts during compile time and
> add the `assert_sync` function to this file.
>
> This will be used in `miscdevice` to avoid regression in case a `: Send`
> bound falsely gets dropped in the future.
>
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Link: https://lore.kernel.org/rust-for-linux/20250530-b4-rust_miscdevice_=
registrationdata-v4-0-d313aafd7e59@gmail.com/T/#mdf3328834ce1d136daf836c9e0=
89b5a8627a6d53
> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>

Thanks!

> ---
> For now I've only added the function.
>
> Some things that might make sense to do as well:
> - Move `static_assert` into `compile_assert.rs`.

Sounds reasonable.

> - Add `assert_sync` to prelude.

I don't think we need to do that. At least not yet.

> - Add `assert_send` as well.

Sounds like a good idea.

> - Use these asserts in various places around the kernel. (I'm not sure
> where it would make sense)
> ---
>  rust/kernel/compile_assert.rs | 24 ++++++++++++++++++++++++
>  rust/kernel/lib.rs            |  1 +
>  2 files changed, 25 insertions(+)
>
> diff --git a/rust/kernel/compile_assert.rs b/rust/kernel/compile_assert.r=
s
> new file mode 100644
> index 0000000000000000000000000000000000000000..2a99de1ba919dc3952d7a1585=
869567a44106b44
> --- /dev/null
> +++ b/rust/kernel/compile_assert.rs
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Compile-time asserts.
> +
> +/// Asserts that the given type is [`Sync`]. This check is done at compi=
le time and does nothing
> +/// at runtime.
> +///
> +/// Note that this is only intended to avoid regressions and for sanity =
checks.
> +///
> +/// # Examples
> +/// ```
> +/// # use kernel::compile_assert::assert_sync;
> +/// # use kernel::types::NotThreadSafe;
> +///
> +///
> +/// // Do the assertion in a const block to make sure it won't be execut=
ed at runtime.
> +/// const _:() =3D {

s/_:()/_: ()/

> +///     assert_sync::<i32>(); // Succeeds because `i32` is Sync
> +///     // assert_sync::<NotThreadSafe>(); // Fails because `NotThreadSa=
fe` is not `Sync`.

Can you split this into two examples and mark the failing one with
`compile_fail`?

We also could provide a macro similar to [1].

[1]: https://docs.rs/static_assertions/latest/static_assertions/

---
Cheers,
Benno

> +/// };
> +///
> +/// ```
> +#[inline(always)]
> +pub const fn assert_sync<T: ?Sized + Sync>() {}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 7e227b52b4d8ff23d39d5cc9ad3ab57132c448d0..e1630e5079b2436eda6f8b712=
25bd5371af337b4 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -56,6 +56,7 @@
>  pub mod block;
>  #[doc(hidden)]
>  pub mod build_assert;
> +pub mod compile_assert;
>  pub mod cred;
>  pub mod device;
>  pub mod device_id;
>
> ---
> base-commit: 7a17bbc1d952057898cb0739e60665908fbb8c72
> change-id: 20250607-assert_sync-62fddc5a0adc
>
> Best regards,

