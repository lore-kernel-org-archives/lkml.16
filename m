Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B6D278E7A;
	Thu,  5 Jun 2025 17:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749144646; cv=none; b=b8waJ1VChoKgEMb8ApseMQsHwv8jZWrtdwCu9HNGWhoC2rf647ljrOP5xfw8YHRZO17r6JNlg5SJB1koZR1ltiGX3zuWqWsZV+AMoblxXoaY+LftsywwqsneG5N1NGNJEsAJn8r/yQHKch9xqLqLfDAp8VU8E+HNmzIliOv15ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749144646; c=relaxed/simple;
	bh=iVeuKT9g4qIU2SS3gVoZJT6OGFbjdSuSpj8u0pAAnfU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=IimKfODYVSHQA78aQ9k5zXIwRP/Ph6jMJftUn+1Bvre9GKIhAU7E5p3NU6y0RTs2F41OSW3cnWYtxZzlCXjDnzemJyHjg2xMREeRFPv700QvAFRgHYgLjrSxOEIsurgYpPhokhuB9tZf7M9jm7aP8TAkHz2wlpEHbROxpUB71k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ukykh5rt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ukykh5rt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06A42C4CEE7;
	Thu,  5 Jun 2025 17:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749144645;
	bh=iVeuKT9g4qIU2SS3gVoZJT6OGFbjdSuSpj8u0pAAnfU=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=Ukykh5rtahNiWIg95gPqqUduHq8LFf7IFgi3KuQ8KIlb4NHUxQBL1xcCaBGkanUP6
	 iY03dUH5S2vxPOd557v2M+tAKlCe5NvnytRzuMlsHXhR2nQqoZVUn7h+UgHCWnQRmV
	 XZx7ZsAbcAFXPm5B+hMYeYrc1xKwTRbT9JQ2kH9/bUXzSrVr7WZOQhoA8ee6cVNzdS
	 AXgCVCoKuBVjquYFqtjxwwUBxIg6qa/krQiJ9HrG1rRtS+7LSprrNasQBc5CpwSQTG
	 YjaNe9AXVFkro/Z0+XDcaFDAEpUNduBafRHkYVrfReVAtgc5hzRsa99lw+mnIu//kR
	 aESvmpOBFEGJg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Jun 2025 19:30:39 +0200
Message-Id: <DAES0YHHTRQS.3EGLTCPLP3SK3@kernel.org>
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
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <llvm@lists.linux.dev>
Subject: Re: [PATCH v4 1/3] rust: add UnsafePinned type
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250511-rust_unsafe_pinned-v4-0-a86c32e47e3d@gmail.com>
 <20250511-rust_unsafe_pinned-v4-1-a86c32e47e3d@gmail.com>
 <1553eea9-9ced-410a-b6e7-886e11e2edba@gmail.com>
In-Reply-To: <1553eea9-9ced-410a-b6e7-886e11e2edba@gmail.com>

On Thu Jun 5, 2025 at 7:03 PM CEST, Christian Schrefl wrote:
> On 11.05.25 8:21 PM, Christian Schrefl wrote:
>> +/// This type provides a way to opt-out of typical aliasing rules;
>> +/// specifically, `&mut UnsafePinned<T>` is not guaranteed to be a uniq=
ue pointer.
>> +///
>> +/// However, even if you define your type like `pub struct Wrapper(Unsa=
fePinned<...>)`, it is still
>> +/// very risky to have an `&mut Wrapper` that aliases anything else. Ma=
ny functions that work
>> +/// generically on `&mut T` assume that the memory that stores `T` is u=
niquely owned (such as
>> +/// `mem::swap`). In other words, while having aliasing with `&mut Wrap=
per` is not immediate
>> +/// Undefined Behavior, it is still unsound to expose such a mutable re=
ference to code you do not
>> +/// control! Techniques such as pinning via [`Pin`](core::pin::Pin) are=
 needed to ensure soundness.
>> +///
>> +/// Similar to [`UnsafeCell`], [`UnsafePinned`] will not usually show u=
p in
>> +/// the public API of a library. It is an internal implementation detai=
l of libraries that need to
>> +/// support aliasing mutable references.
>> +///
>> +/// Further note that this does *not* lift the requirement that shared =
references must be read-only!
>> +/// Use [`UnsafeCell`] for that.
>
> The upstream rust PR [0] that changes this was just merged. So now `Unsaf=
ePinned` includes
> `UnsafeCell` semantics. It's probably best to also change this in the ker=
nel docs.
> Though it's still the case that removing the guarantee is simpler than ad=
ding it back later,
> so let me know what you all think.

Depends on how "stable" this decision is. I haven't followed the
discussion, but given that this once changed to the "non-backwards"
compatible case it feels permanent.

How close is it to stabilization?

If it's close-ish, then I'd suggest we change this to reflect the new
semantics. If not, then we should leave it as-is.

---
Cheers,
Benno

> [0]: https://github.com/rust-lang/rust/pull/140638
