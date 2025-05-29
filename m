Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BC5A55;
	Thu, 29 May 2025 09:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748510473; cv=none; b=Frz3ugIVUqORWLKyVFjwtiKQAacFZqxil5vMu234qZ7TPdvx8TqRe29AnVJqMt4Pm2VoSiUf/0O7QnsAho3dPrlMxwq0u5t8d6gDv37gI4C8/p9h/qoNFx2c1BQGN4TNboA2n5sKrLdT6PUt+oy4EoSHK12FywuH2idqJS7+K7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748510473; c=relaxed/simple;
	bh=1BWuf5GwypVzVnJaQNR4TuFejVewmz1nogJhTtrWZrk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=BWS4SrjqetZKtfr5hvwEpiMd0KiskBBO/2Jcfb6RlRn5LuYbL8dRg+RyaIZq3g5U94LZyHYVRwXdvtgNJB8HVqba+HmPSCJGBPOf3EnJWuSuqUQaYgCZ71S/TVLX2Ckpg3b6ifmJHA09Y8wc3MQQs+U4v3tUl2qrxrUcKug9VLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IMiM/pbb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IMiM/pbb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43660C4CEE7;
	Thu, 29 May 2025 09:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748510472;
	bh=1BWuf5GwypVzVnJaQNR4TuFejVewmz1nogJhTtrWZrk=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=IMiM/pbb8w6RTnihHCBAdPtkRUfm86DBMVoozK5GXbXtn28Wf5+ip7LSheg3+rOc3
	 1C1Lhiim2SnXyxOZSIJ6fzzyaAWif4IPK72oxXft6tnpB8UtI04UXvmEflaSn7CFW7
	 C+8hi8ek6BBXcRNDkD+5lwUFQSZjQDGPFzeZepg/MZVxwzZYJV8og7HY8HuH09fnvt
	 TA02AsCG04EslZ2VyqfR1hNKdVFtHyPuGvmfaB8bboJ1+Af5xLGp2SLAVYCv3wqGh0
	 j4KJrBHhy1QUCEYBByobMJf4/l1gM6pgJbC7Z9IT3Cx8rv460auz0dYcePakgwkmis
	 9wZJFwmFBiF5g==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 May 2025 11:21:07 +0200
Message-Id: <DA8J8BHPNBAM.IUBJ8TL9L6U8@kernel.org>
Subject: Re: [RFC RESEND v10 04/14] rust: Introduce interrupt module
From: "Benno Lossin" <lossin@kernel.org>
To: "Lyude Paul" <lyude@redhat.com>, <rust-for-linux@vger.kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Boqun Feng"
 <boqun.feng@gmail.com>, <linux-kernel@vger.kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Wedson Almeida Filho" <wedsonaf@gmail.com>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Xiangfei Ding" <dingxiangfei2009@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250527222254.565881-1-lyude@redhat.com>
 <20250527222254.565881-5-lyude@redhat.com>
In-Reply-To: <20250527222254.565881-5-lyude@redhat.com>

On Wed May 28, 2025 at 12:21 AM CEST, Lyude Paul wrote:
> This introduces a module for dealing with interrupt-disabled contexts,
> including the ability to enable and disable interrupts along with the
> ability to annotate functions as expecting that IRQs are already
> disabled on the local CPU.
>
> [Boqun: This is based on Lyude's work on interrupt disable abstraction,
> I port to the new local_interrupt_disable() mechanism to make it work
> as a guard type. I cannot even take the credit of this design, since
> Lyude also brought up the same idea in zulip. Anyway, this is only for
> POC purpose, and of course all bugs are mine]
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Co-Developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>

Two nits below, with those fixed:

Reviewed-by: Benno Lossin <lossin@kernel.org>

> diff --git a/rust/kernel/interrupt.rs b/rust/kernel/interrupt.rs
> new file mode 100644
> index 0000000000000..e66aa85f79940
> --- /dev/null
> +++ b/rust/kernel/interrupt.rs
> @@ -0,0 +1,83 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Interrupt controls
> +//!
> +//! This module allows Rust code to annotate areas of code where local p=
rocessor interrupts should
> +//! be disabled, along with actually disabling local processor interrupt=
s.
> +//!
> +//! # =E2=9A=A0=EF=B8=8F Warning! =E2=9A=A0=EF=B8=8F
> +//!
> +//! The usage of this module can be more complicated than meets the eye,=
 especially surrounding
> +//! [preemptible kernels]. It's recommended to take care when using the =
functions and types defined
> +//! here and familiarize yourself with the various documentation we have=
 before using them, along
> +//! with the various documents we link to here.
> +//!
> +//! # Reading material
> +//!
> +//! - [Software interrupts and realtime (LWN)](https://lwn.net/Articles/=
520076)
> +//!
> +//! [preemptible kernels]: https://www.kernel.org/doc/html/latest/lockin=
g/preempt-locking.html
> +
> +use bindings;

This shouldn't be necessary, right?

> +impl LocalInterruptDisabled {
> +    const ASSUME_DISABLED: &'static LocalInterruptDisabled =3D &LocalInt=
erruptDisabled(NotThreadSafe);

I'd move this into the function body.

---
Cheers,
Benno

> +
> +    /// Assume that local processor interrupts are disabled on preemptib=
le kernels.
> +    ///
> +    /// This can be used for annotating code that is known to be run in =
contexts where local
> +    /// processor interrupts are disabled on preemptible kernels. It mak=
es no changes to the local
> +    /// interrupt state on its own.
> +    ///
> +    /// # Safety
> +    ///
> +    /// For the whole life `'a`, local interrupts must be disabled on pr=
eemptible kernels. This
> +    /// could be a context like for example, an interrupt handler.
> +    pub unsafe fn assume_disabled<'a>() -> &'a LocalInterruptDisabled {
> +        Self::ASSUME_DISABLED
> +    }
> +}
