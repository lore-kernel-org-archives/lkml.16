Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15E3192584;
	Tue,  3 Jun 2025 16:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748968253; cv=none; b=hj+gd/vmB4kCdmjGJVgC+QTdRrMFvvC+IgPYf2s4hcX0MDeJ4WflPlPLSz0asWTfI5Osm7KDTqH+thEdHcYAX0hUxSYNqWsnS0oOjgRxyZzOKNRH+OtKrbdNDJkl2nVDIEbLQ7e8Xx0sNYUlIr2Feqc4Y85EjtHJ+071INsTzzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748968253; c=relaxed/simple;
	bh=VakH29ZlMouOtB4a3xThI4GPGWQ6lenTCF6LOCe3J9o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HjHGOCP12nwJ1AdRSjK5azJBd2ongvkU/o+idpYEs4TuQSNNp0Lnn2BLhFwe7LwYZ5LEHn6K0TTrzD7Rm3JBQ90Sbq2FcErvTYo5r0fRC2m3+isN/tPn+hz5eQHNUTdw9L66nhpjTuH/GJ9YjnR7fF7ITI5lneZjW4Zpv3DkxQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gAWePvLz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gAWePvLz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B77D3C4CEEE;
	Tue,  3 Jun 2025 16:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748968253;
	bh=VakH29ZlMouOtB4a3xThI4GPGWQ6lenTCF6LOCe3J9o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gAWePvLz++FzEdnb4CI9ExB3zI2sYeogn1OgtJCMGR9iJIS8N6UcwAINb+43ANf7E
	 W0UdMajSDYJR5/mEPAJ+aRVeUYnAtZBneMtxnX8LaB4HrIlEnUcH3PqcvzOUz6/QIQ
	 42hzaC9s2nqG7XYIAEkFgAysif6nWfAPUESaRiRtDuZLI0+68BMUAT8JYyHuGGESpv
	 Hi2DcfHZpO/OcVhiT2xANdVjp6uDra3Tng+VJCtZvbTsqEP3qaSg9zOP1jJHiB9oJV
	 Bh7vrG7iq2WjgVPusor/iI4ukYJWGL7cjjIf0wSvcx5udcvkzztF54tzjX2QS2Ta4w
	 Aj/VmotOEBFdQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>,  <boqun.feng@gmail.com>,
  <frederic@kernel.org>,  <lyude@redhat.com>,  <tglx@linutronix.de>,
  <anna-maria@linutronix.de>,  <jstultz@google.com>,  <sboyd@kernel.org>,
  <ojeda@kernel.org>,  <alex.gaynor@gmail.com>,  <gary@garyguo.net>,
  <bjorn3_gh@protonmail.com>,  <benno.lossin@proton.me>,
  <aliceryhl@google.com>,  <tmgross@umich.edu>,  <dakr@kernel.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 3/5] rust: time: Add HrTimerExpires trait
In-Reply-To: <20250603.225143.1147206358060510971.fujita.tomonori@gmail.com>
	(FUJITA Tomonori's message of "Tue, 03 Jun 2025 22:51:43 +0900")
References: <20250504045959.238068-1-fujita.tomonori@gmail.com>
	<20250504045959.238068-4-fujita.tomonori@gmail.com>
	<87ecw61c8v.fsf@kernel.org>
	<rAqrmy9vCIFRwqGIzvQuVlv1F-jKMF8QBKvfhxqPCqygqE81k9JkbIFhWFgg7VBeq6rfYTy_WtlBnBMOdhTCxQ==@protonmail.internalid>
	<20250603.225143.1147206358060510971.fujita.tomonori@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 03 Jun 2025 18:28:04 +0200
Message-ID: <875xhc6b8r.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:

> On Fri, 30 May 2025 15:04:00 +0200
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>>> +/// Defines a new `HrTimerMode` implementation with a given expiration=
 type and C mode.
>>> +#[doc(hidden)]
>>> +macro_rules! define_hrtimer_mode {
>>> +    (
>>> +        $(#[$meta:meta])*
>>> +        $vis:vis struct $name:ident<$clock:ident> {
>>> +            c =3D $mode:ident,
>>> +            expires =3D $expires:ty
>>> +        }
>>> +    ) =3D> {
>>> +        $(#[$meta])*
>>> +        $vis struct $name<$clock: $crate::time::ClockSource>(
>>> +            ::core::marker::PhantomData<$clock>
>>> +        );
>>
>> I think a macro is too much here. The code would be easier to read
>> without the macro, and the macro does not remove much code here.
>>
>> Could you try to do the trait implementations without the macro?
>
> Something like the following, right? If so, I'll do in the next
> version. I'm also fine with that way.
>
> /// Timer that expires at a fixed point in time.
> pub struct AbsoluteMode<C: ClockSource>(PhantomData<C>);
>
> impl<C: ClockSource> HrTimerMode for AbsoluteMode<C> {
>     const C_MODE: bindings::hrtimer_mode =3D bindings::hrtimer_mode_HRTIM=
ER_MODE_ABS;
>
>     type Clock =3D C;
>     type Expires =3D Instant<C>;
> }

OK, let's do that then =F0=9F=91=8D


Best regards,
Andreas Hindborg



