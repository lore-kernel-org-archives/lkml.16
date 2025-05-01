Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823E020C01C;
	Thu,  1 May 2025 18:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746125721; cv=none; b=SBgjNTZnz3lJtVwTo58iLXZbLY5QMf2uKj6esQfU1zlXgulNx6epcC1He9Qgj9Rje2RlHVcyn5noqx+sd5cNa73rGD+TeR+mUyjq07+mQgtNblNtr/sIjRwpBm0RCre6n/5diYHeHB0OdRHxpgTN80tHHuExQs1irDllo+16f6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746125721; c=relaxed/simple;
	bh=tXvbeZok1hYfXQkxmYbsv5Z8LeAe0bJ9qHE1ZCq3P6E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BBI3LzcsrHKPUd3PY50/7NXbBay16osg3VsYQfAOJxlIo/Z/WrPFv8JuPTfiDA+APY533HrSwFD+iZ/lN/WzFLzRSmH+UQgVgfIj0z9EGPIuxhcpiVmfYzZ/CIWualg9c7SFkxTO0pHMlmN2ADK4TU+W3Z+ZRh0rfX663fJVcT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H8lB1LYu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H8lB1LYu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DC14C4CEE3;
	Thu,  1 May 2025 18:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746125721;
	bh=tXvbeZok1hYfXQkxmYbsv5Z8LeAe0bJ9qHE1ZCq3P6E=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=H8lB1LYu51j43XIJh7oUbxObBRZk7Xp9WSexAxayYIo6BqOns0lc9k/qBkKWgepLC
	 leGNrFMBcGgjNRbVOINC+OcVUevSeOuCWlFQ+qtg0SUz3A7FhCS9iEMS99ySu63Hs3
	 0ORIjy+AhhxFf53vWGwzOqRl0gV5QYoJx10e+GKW/PFNsVSadjoxTl707PwNPSVSVQ
	 uFRzbEcFR8Ns0AOBGVNy6Pp0VFkPYqmON0E9eB+cNvzMcB5IleNQ3QsCQAd7eEzhAN
	 asR0jdLg9DgRKVfUwdbri0WKOfYdJA46ydEe/hEYvZv4nObIg+ZWefNLIuqRtV+SP0
	 7RhoBLha5PBtw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 May 2025 20:55:16 +0200
Message-Id: <D9L1WOB7LYI2.1JNEDXOGQ4F9U@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Ralf
 Jung" <post@ralfj.de>
Subject: Re: [PATCH v2 1/3] rust: add UnsafePinned type
From: "Benno Lossin" <lossin@kernel.org>
To: "Christian Schrefl" <chrisi.schrefl@gmail.com>, "Sky" <sky@sky9.dev>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, =?utf-8?q?Gerald_Wisb=C3=B6ck?=
 <gerald.wisboeck@feather.ink>
X-Mailer: aerc 0.20.1
References: <20250430-rust_unsafe_pinned-v2-0-fc8617a74024@gmail.com>
 <20250430-rust_unsafe_pinned-v2-1-fc8617a74024@gmail.com>
 <22f6f12b-d002-4ada-834e-00ef0073bd9e@gmail.com>
In-Reply-To: <22f6f12b-d002-4ada-834e-00ef0073bd9e@gmail.com>

On Thu May 1, 2025 at 7:12 PM CEST, Christian Schrefl wrote:
> On 30.04.25 10:36 AM, Christian Schrefl wrote:
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
> [CC Ralf]
>
> Ralf has replied to me on Github that this will most likely change [0]. H=
ow should this be handled?
>
> I would fine with submitting a patch once it changes on the rust side (po=
ssibly waiting until the
> feature is close to stabilization). I think it is better to only add this=
 guarantee later as it
> will be easier to remove unnecessary `UnsafeCell`s than it would be to la=
ter add them back in ever
> case where they would be needed (in case rust doesn't change `UnsafePinne=
d` to act like `UnsafeCell`).

Agreed, unless Ralf suggests a different way, we should do it like this.

---
Cheers,
Benno

> Also see to the tracking issue [1] for the reason why `UnsafeCell` behavi=
or is most likely required.
>
> [0]: https://github.com/rust-lang/rust/issues/125735#issuecomment-2842926=
832
> [1]: https://github.com/rust-lang/rust/issues/137750
>
> Cheers
> Christian
