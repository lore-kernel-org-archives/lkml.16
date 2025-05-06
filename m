Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF773C2F;
	Tue,  6 May 2025 14:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746542763; cv=none; b=fU5EuGkcNWNWw1h7tsoXNkuvKSWxjGq0Ar7B1wxWGMOkvl7gsY7KgV479idjCHuCJS5H09T5LGREOPBwXf3R95XMdZ+73X4iV+0GGuy27Ca7a9b1dVvVjHz6TG0NzfWoZHyyhIU5YvLEtLQSGuNFCZi2ahqQxazjDUIyyInv0b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746542763; c=relaxed/simple;
	bh=fIJbfUQctiq2wDcZ/jqu77lTV9KuBWzOO/CYwNRPkwY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tFMqX5jSSV28XuGpxzagh+K7+6OdkCpB1rTjEgJuDZv8CzzKXSW5wdgRLUjuyD0tu2pFVKITYyy8Klau6t2JhP3S5BYTfbBd1QsRjJjrc4dyRILpDKh3pag+xnh0Z7c/2M7hUcybmm5SXVeFGY6+PiW4XM/EwwcvVsn1bYuO3y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kp/ATNZQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kp/ATNZQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6443CC4CEE4;
	Tue,  6 May 2025 14:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746542763;
	bh=fIJbfUQctiq2wDcZ/jqu77lTV9KuBWzOO/CYwNRPkwY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kp/ATNZQLl54jmyulrFpKZ+5Z3A+Cuip1zA3bhq2jLZVHK/TzXExvC4i+hMPXyiwc
	 SRYPppBCZ92dEWyuvVQ2BsxOu19m2EaSkC5mIRqRnNUrq+pRJUeGF8M2jQyDNC9qmK
	 ny4vLXqXB1dmse2NYvFj7YJTg7JwII6JCS50tLPm20Fq5MrkYGe1NvhUMy/rmCWTlj
	 IeiQrUG/fAONNIA8Jv/kRT/emUCd55xB0lSoNQLDI+2OEXc9LTwPeSUpRnb0PcXj/U
	 b8Bw5o4bGL+pZoeiBxa1lnfBmz5ssN8zfw/DQGSHhucSTsf2co6Rogh/NGfpLd7kMb
	 3Cd1sReFtw6Lg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Boqun Feng" <boqun.feng@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Gary Guo" <gary@garyguo.net>,  =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno Lossin" <benno.lossin@proton.me>,
  "Alice Ryhl" <aliceryhl@google.com>,  "Trevor Gross" <tmgross@umich.edu>,
  "Danilo Krummrich" <dakr@kernel.org>,  "Oliver Mangold"
 <oliver.mangold@pm.me>,  <rust-for-linux@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] rust: elaborate safety requirements for
 `AlwaysReferenceCounted`
In-Reply-To: <aBoYYzj7sGEbsQzw@Mac.home> (Boqun Feng's message of "Tue, 06 May
	2025 07:10:43 -0700")
References: <20250506-aref-from-raw-v2-1-5a35e47f4ec2@kernel.org>
	<-FILHsjUNOHid0QC-VLnnlLwag2varq7O6v_N8hj9fxOE1z0mRuRY8OKoEx0Z3yKvXskBEWotxngdTMGLvay6Q==@protonmail.internalid>
	<aBoYYzj7sGEbsQzw@Mac.home>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Tue, 06 May 2025 16:45:45 +0200
Message-ID: <87r011pzl2.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Boqun Feng" <boqun.feng@gmail.com> writes:

> On Tue, May 06, 2025 at 10:29:02AM +0200, Andreas Hindborg wrote:
>> Clarify that implementers of `AlwaysReferenceCounted` must prevent the
>> implementer from being directly initialized by users.
>>
>> It is a violation of the safety requirements of `AlwaysReferenceCounted` if
>> its implementers can be initialized on the stack by users. Although this
>> follows from the safety requirements, it is not immediately obvious.
>>
>> The following example demonstrates the issue. Note that the safety
>> requirements for implementing `AlwaysRefCounted` and for calling
>> `ARef::from_raw` are satisfied.
>>
>>   struct Empty {}
>>
>>   unsafe impl AlwaysRefCounted for Empty {
>>       fn inc_ref(&self) {}
>>       unsafe fn dec_ref(_obj: NonNull<Self>) {}
>>   }
>>
>>   fn unsound() -> ARef<Empty> {
>>       use core::ptr::NonNull;
>>       use kernel::types::{ARef, RefCounted};
>>
>>       let mut data = Empty {};
>>       let ptr = NonNull::<Empty>::new(&mut data).unwrap();
>>       let aref: ARef<Empty> = unsafe { ARef::from_raw(ptr) };
>>
>
> Hmm.. I would say in this case, what gets violated is the safe
> requirement of ARef::from_raw(), because callers are supposed to
> guarantee that an refcount increment was passed to `ARef` and in this
> case, and unsound() cannot guarantee that here because it's going to
> clean up `data` when the it returns.

Right, `unsound` is not following this part of the safety requirement:

  and that they are properly relinquishing one increment ...
  callers must not use the underlying object anymore

Freeing the object by returning is using the object.

So maybe we don't need to change anything, we can just fix up the
example for `ARef::into_raw`.


Best regards,
Andreas Hindborg


