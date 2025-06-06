Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E409A2857C2;
	Fri,  6 Jun 2025 08:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749197569; cv=none; b=u1E6FqqkHH9bDUwufc8kEym4kc/m11q12Z3XwZ/ZU3aV3aXwYIKK8ckTc+cGzBQmx9gJtcaphcAn9ywU2auWPkTIlWCOSOkmWc2hl8cBYsRoduN7G+FDoTzwJBVpxtezNq0dSFxfFeuMtpfHEB7+Dybo0eN/5/nrcEMxS9rgTM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749197569; c=relaxed/simple;
	bh=VlqTV4+xXtbihYWvuELF0s4cfdGlf+PlWTqQpnCJ048=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=TvJBwvaiuAf4gUYiPJ4lcopPI1wy5GQA0Ns9KLspjTn3sbxXxiTO8s0vdzV9F6h7o4Ae6lr4jLKAaYT3KYVF3qx5Xl1WMG6WsRwaSf+qUuxf3JGBY3EoO5aDRwlpCAgm1g2gQ5RDNC48SVEh8cI5LBsNqspoCCb8NhrnqeUVBuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L0gW1xyw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L0gW1xyw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BC50C4CEEF;
	Fri,  6 Jun 2025 08:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749197568;
	bh=VlqTV4+xXtbihYWvuELF0s4cfdGlf+PlWTqQpnCJ048=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=L0gW1xywgZ6oiBJLJtIa3zKdz8sbgU6PkRfs3tij7k3wme1kA/uYdUthXs/WyBIho
	 po7j1xKcfdVCj4uLGL47zLXsmsaHhcgAzWX783Nd6Lr86J2fu+MfYVX0iLpDRvs0DL
	 iFBhHgISXlumPnnT2gJaxztLXd+hH94nBoc4lnAao3tRKfSmhxjoukicETn1nNmNfp
	 qpTRny7dBMoEWMnvOYgSh3y79rN68OjEtQkrUfZVrz1VLfJ0WZhuM9uEI8+nkMTZO6
	 cR9zxZtjbHKrTIL3veJA/LqZ5QeSGTmvMocddnLLfLPzHh0SW0DgZMXgIY7Pdk0DKC
	 07GlnkaPlKZ8Q==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Jun 2025 10:12:42 +0200
Message-Id: <DAFASAX0B837.1YDWHXPFR3JCT@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <llvm@lists.linux.dev>, "Ralf Jung" <post@ralfj.de>
Subject: Re: [PATCH v4 1/3] rust: add UnsafePinned type
From: "Benno Lossin" <lossin@kernel.org>
To: "Christian Schrefl" <chrisi.schrefl@gmail.com>, "Sky" <sky@sky9.dev>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, =?utf-8?q?Gerald_Wisb=C3=B6ck?=
 <gerald.wisboeck@feather.ink>, "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>, "Bill Wendling"
 <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>
X-Mailer: aerc 0.20.1
References: <20250511-rust_unsafe_pinned-v4-0-a86c32e47e3d@gmail.com>
 <20250511-rust_unsafe_pinned-v4-1-a86c32e47e3d@gmail.com>
 <1553eea9-9ced-410a-b6e7-886e11e2edba@gmail.com>
 <DAES0YHHTRQS.3EGLTCPLP3SK3@kernel.org>
 <63f92378-dde9-4bee-b2ae-b994052e8fd0@gmail.com>
In-Reply-To: <63f92378-dde9-4bee-b2ae-b994052e8fd0@gmail.com>

On Thu Jun 5, 2025 at 7:57 PM CEST, Christian Schrefl wrote:
> On 05.06.25 7:30 PM, Benno Lossin wrote:
>> On Thu Jun 5, 2025 at 7:03 PM CEST, Christian Schrefl wrote:
>>> On 11.05.25 8:21 PM, Christian Schrefl wrote:
>>>> +/// This type provides a way to opt-out of typical aliasing rules;
>>>> +/// specifically, `&mut UnsafePinned<T>` is not guaranteed to be a un=
ique pointer.
>>>> +///
>>>> +/// However, even if you define your type like `pub struct Wrapper(Un=
safePinned<...>)`, it is still
>>>> +/// very risky to have an `&mut Wrapper` that aliases anything else. =
Many functions that work
>>>> +/// generically on `&mut T` assume that the memory that stores `T` is=
 uniquely owned (such as
>>>> +/// `mem::swap`). In other words, while having aliasing with `&mut Wr=
apper` is not immediate
>>>> +/// Undefined Behavior, it is still unsound to expose such a mutable =
reference to code you do not
>>>> +/// control! Techniques such as pinning via [`Pin`](core::pin::Pin) a=
re needed to ensure soundness.
>>>> +///
>>>> +/// Similar to [`UnsafeCell`], [`UnsafePinned`] will not usually show=
 up in
>>>> +/// the public API of a library. It is an internal implementation det=
ail of libraries that need to
>>>> +/// support aliasing mutable references.
>>>> +///
>>>> +/// Further note that this does *not* lift the requirement that share=
d references must be read-only!
>>>> +/// Use [`UnsafeCell`] for that.
>>>
>>> The upstream rust PR [0] that changes this was just merged. So now `Uns=
afePinned` includes
>>> `UnsafeCell` semantics. It's probably best to also change this in the k=
ernel docs.
>>> Though it's still the case that removing the guarantee is simpler than =
adding it back later,
>>> so let me know what you all think.
>>=20
>> Depends on how "stable" this decision is. I haven't followed the
>> discussion, but given that this once changed to the "non-backwards"
>> compatible case it feels permanent.
>
> It seems pretty permanent, from what I understand its hard to
> define the exact semantics `UnsafePinned` without `UnsafeCell`
> in a way that is sound and because of some interactions with
> `Pin::deref` it would have some backwards compatibility issues.
> See this comment by Ralf on github [1].

Oh yeah that seems like a done deal.

> [1]: https://github.com/rust-lang/rust/pull/137043#discussion_r1973978597
>
>>=20
>> How close is it to stabilization?
>>=20
>> If it's close-ish, then I'd suggest we change this to reflect the new
>> semantics. If not, then we should leave it as-is.
>
> It's pretty new, I'm not sure how long it's going to stay in nightly,
> but it's probably going to be quite some time.
>
> I wouldn't change it if it would already be in the kernel, but I think
> its probably good to add the current state of the feature. This
> would also reduce the difference between docs and implementation.

Makes sense, I agree with changing it. Thanks for your work!

---
Cheers,
Benno
