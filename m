Received: from r-passerv.ralfj.de (r-passerv.ralfj.de [109.230.236.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0C322576D;
	Fri,  2 May 2025 09:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.230.236.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746176849; cv=none; b=c+mnVvv+PTB65w9kwmNayHLoBVAf70GuaR3tMaiws0twLV15NhuxWcC6FxEE/WizAwUXqXkRDJDIcJtFN18cyXJi0fEaKK7H7AJ/ZmIlEmk2Yu7FjEUnhnAvjMcJiKW0n33Mm2IgnFAUEpkX8hSN0HAna3f6y87ArU9Fv7ynA+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746176849; c=relaxed/simple;
	bh=8V2LMlhIR6jtrHPIFw3siQfwtc50CNo0M2ewnkYj3uo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i1LD/OrQb0AP39H9xI++C9yAxmFOUBw2H22to7qQvA1A/YhldoiOMrlnGfmLWIYnX/ncAvEqMjgxB/2TWH4/J4Kozi9OWOwVNBgrgyqRJZ+pptwPFvZouK/Uui7uTinYr/cuhQdbu9gBKP1KXnTKehlWS5h/mbc6QrATiPiUZx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ralfj.de; spf=pass smtp.mailfrom=ralfj.de; dkim=pass (1024-bit key) header.d=ralfj.de header.i=@ralfj.de header.b=3KxdsgQi; arc=none smtp.client-ip=109.230.236.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ralfj.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ralfj.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ralfj.de header.i=@ralfj.de header.b="3KxdsgQi"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ralfj.de; s=mail;
	t=1746176277; bh=8V2LMlhIR6jtrHPIFw3siQfwtc50CNo0M2ewnkYj3uo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=3KxdsgQiEFZ9GDjPKSO03SGwMWvYiGtZ8i09NutZ3PZMILTSWgOlw7Xash8zMKxJx
	 7vQ5WX9wlG1vCdpC90ds0ZIgfSxuXx1pqjRPBA3cosbEAyyOEYHzacALn5GmPbk6El
	 fmtVz3B3duse6GoCdNEq9vw6UbKX2+Vp9mWBarCQ=
Received: from [IPV6:2001:67c:10ec:5784:8000::87] (2001-67c-10ec-5784-8000--87.net6.ethz.ch [IPv6:2001:67c:10ec:5784:8000::87])
	by r-passerv.ralfj.de (Postfix) with ESMTPSA id A8B872052D0F;
	Fri,  2 May 2025 10:57:57 +0200 (CEST)
Message-ID: <761a05ce-b711-439c-bbb5-44c570867a50@ralfj.de>
Date: Fri, 2 May 2025 10:57:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] rust: add UnsafePinned type
To: Benno Lossin <lossin@kernel.org>,
 Christian Schrefl <chrisi.schrefl@gmail.com>, Sky <sky@sky9.dev>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20250430-rust_unsafe_pinned-v2-0-fc8617a74024@gmail.com>
 <20250430-rust_unsafe_pinned-v2-1-fc8617a74024@gmail.com>
 <22f6f12b-d002-4ada-834e-00ef0073bd9e@gmail.com>
 <D9L1WOB7LYI2.1JNEDXOGQ4F9U@kernel.org>
Content-Language: en-US, de-DE
From: Ralf Jung <post@ralfj.de>
In-Reply-To: <D9L1WOB7LYI2.1JNEDXOGQ4F9U@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

On 01.05.25 20:55, Benno Lossin wrote:
> On Thu May 1, 2025 at 7:12 PM CEST, Christian Schrefl wrote:
>> On 30.04.25 10:36 AM, Christian Schrefl wrote:
>>> +/// This type provides a way to opt-out of typical aliasing rules;
>>> +/// specifically, `&mut UnsafePinned<T>` is not guaranteed to be a unique pointer.
>>> +///
>>> +/// However, even if you define your type like `pub struct Wrapper(UnsafePinned<...>)`, it is still
>>> +/// very risky to have an `&mut Wrapper` that aliases anything else. Many functions that work
>>> +/// generically on `&mut T` assume that the memory that stores `T` is uniquely owned (such as
>>> +/// `mem::swap`). In other words, while having aliasing with `&mut Wrapper` is not immediate
>>> +/// Undefined Behavior, it is still unsound to expose such a mutable reference to code you do not
>>> +/// control! Techniques such as pinning via [`Pin`](core::pin::Pin) are needed to ensure soundness.
>>> +///
>>> +/// Similar to [`UnsafeCell`], [`UnsafePinned`] will not usually show up in
>>> +/// the public API of a library. It is an internal implementation detail of libraries that need to
>>> +/// support aliasing mutable references.
>>> +///
>>> +/// Further note that this does *not* lift the requirement that shared references must be read-only!
>>> +/// Use [`UnsafeCell`] for that.
>>
>> [CC Ralf]
>>
>> Ralf has replied to me on Github that this will most likely change [0]. How should this be handled?
>>
>> I would fine with submitting a patch once it changes on the rust side (possibly waiting until the
>> feature is close to stabilization). I think it is better to only add this guarantee later as it
>> will be easier to remove unnecessary `UnsafeCell`s than it would be to later add them back in ever
>> case where they would be needed (in case rust doesn't change `UnsafePinned` to act like `UnsafeCell`).
> 
> Agreed, unless Ralf suggests a different way, we should do it like this.

Sorry, I replied only on github since that was easier to do more quickly. ;)

Yes I would recommend for now to keep the `UnsafeCell` in the kernel sources, 
until the compiler actually implements the change that removes `noalias` from 
`&UnsafePinned`. And even then you should probably keep the `UnsafeCell` when 
building for older compiler versions from before that patch (or keep it until 
you drop support for those older compiler versions).

This is not a spec-only change, codegen really has to be adjusted to make 
`&UnsafePinned` properly compatible with mutable aliasing, and I see no reason 
to risk potential problems here by prematurely removing that `UnsafeCell`.

Kind regards,
Ralf

> 
> ---
> Cheers,
> Benno
> 
>> Also see to the tracking issue [1] for the reason why `UnsafeCell` behavior is most likely required.
>>
>> [0]: https://github.com/rust-lang/rust/issues/125735#issuecomment-2842926832
>> [1]: https://github.com/rust-lang/rust/issues/137750
>>
>> Cheers
>> Christian

