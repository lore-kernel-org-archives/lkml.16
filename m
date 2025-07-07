Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A88B293C7B;
	Mon,  7 Jul 2025 13:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751894516; cv=none; b=deKTZS2M4aYn2z2xk5Z04CCbyHdlI+cLTpiWtfB3ufMHkKUOY9lgasygQb0nSJEgGVE22YfVbkT2v5U7HZd+wQ3Yu85SlVfL1OZsuiXd2+GGPkzmKrubbaC+vY4deIUiE5ssPz/Hs1LpSCMG8CtxkVOkOzkFHN+0CD2Ttbk5joU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751894516; c=relaxed/simple;
	bh=O8gKTPusiNWU2XmABv5gVEiO4iBU5ihMnEudx0J/PpM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TBRkW4iG4Nc5rbYhT/1KKHz3dujUG69G8OUJx+4vfA3J0kcJxPoo/jSKZVkvmGFFf133xUSRRUFY2dnEa2dl5HQVK7R0PmX+WRDRw/OTU2FuOMEUfimaMr9S0Zoo9axPc8VNAoZPNRxfFo973ySNj7AV6EBLHFJijmVx5LZLMv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UTVboYih; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UTVboYih"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BEC7C4CEE3;
	Mon,  7 Jul 2025 13:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751894514;
	bh=O8gKTPusiNWU2XmABv5gVEiO4iBU5ihMnEudx0J/PpM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UTVboYih8KCZp86e7YK6dkzIr6DOvjLXy4zl7OVQoGbYT177ZlLMav1Y3tDFEYM9g
	 gg5JaBMJLCUukpFEBJbqR8Ve77MN8CvvmOtx79Gg61RSRPgBPEi+xfla8H/PSsX8Hq
	 SdVTQDDUJloTZOvGTKZbXOjeYZd6zfQygvJ2iyD+vnPagiSj83/MJ66Y190iXEG/nF
	 EcPorWDR5r6mr6azPXcRn8VD4HPLMtfLPGgJSKSTQPR4Z83+L9LiqJw5u/Y8xjMxVb
	 lmM+DbIIi+HTSQvGRWewy7o5t4w16o3m9F+hZb9OKQkbZfG1dKCUUrm3I98xIYza3q
	 Le/Hg6o2U8IQQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Benno Lossin" <lossin@kernel.org>
Cc: "Oliver Mangold" <oliver.mangold@pm.me>,  "Miguel Ojeda"
 <ojeda@kernel.org>,  "Alex Gaynor" <alex.gaynor@gmail.com>,  "Boqun Feng"
 <boqun.feng@gmail.com>,  "Gary Guo" <gary@garyguo.net>,  =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Alice Ryhl" <aliceryhl@google.com>,  "Trevor
 Gross" <tmgross@umich.edu>,  "Asahi Lina" <lina+kernel@asahilina.net>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v11 4/4] rust: Add `OwnableRefCounted`
In-Reply-To: <DB5SRE5S7AR3.QUF369W9JYGJ@kernel.org> (Benno Lossin's message of
	"Mon, 07 Jul 2025 13:47:10 +0200")
References: <20250618-unique-ref-v11-0-49eadcdc0aa6@pm.me>
	<20250618-unique-ref-v11-4-49eadcdc0aa6@pm.me>
	<DB1LPFAX66WG.1QL5JDCWI7RN4@kernel.org> <aGuAR7JCrlmzQrx4@mango>
	<gFz7glX0UIHGffQdm4_vD_XkT5GZEKB0Lx0cd8-TCR8glMzIIY7VBIvppFVr2RURNBnGx9lKJqrE5av7xSUcbA==@protonmail.internalid>
	<DB5PX74OB3DX.1UNT8MIBWNC2G@kernel.org> <87bjpwqmo5.fsf@kernel.org>
	<gUxXEpuPZ0HXQ-cptykcSOV4dVbZNFvDq4Ey5YR1GT8exNFK0qhYAg4HFgWTvTpDk8HXMGl5XThvR7f4m-T6Sg==@protonmail.internalid>
	<DB5SRE5S7AR3.QUF369W9JYGJ@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 07 Jul 2025 15:21:44 +0200
Message-ID: <87zfdgp253.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Benno Lossin" <lossin@kernel.org> writes:

> On Mon Jul 7, 2025 at 1:12 PM CEST, Andreas Hindborg wrote:
>> "Benno Lossin" <lossin@kernel.org> writes:
>>> Ah right, I forgot about this. What was the refcount characteristics of
>>> this again?
>>>
>>> *  1 = in flight, owned by C
>>> *  2 = in flight, owned by Rust
>>> * >2 = in flight, owned by Rust + additional references used by Rust
>>>        code
>>>
>>> Correct? Maybe @Andreas can check.
>>
>> We have been a bit back and forth on this. This is how we would like it
>> going forward:
>>
>>
>> /// There are three states for a request that the Rust bindings care about:
>> ///
>> /// - 0: The request is owned by C block layer or is uniquely referenced (by [`Owned<_>`]).
>> /// - 1: The request is owned by Rust abstractions but is not referenced.
>> /// - 2+: There is one or more [`ARef`] instances referencing the request.
>
> Huh, now I'm more confused... Could you go into the details again?

Well, there is not much to it. We found out we can alias "unique" and
"owned by C".

We initialize the refcount to 0 when we initialize the request
structure. This happens at queue creation time.

When C block layer hands over a request for processing to a Rust driver,
we `debug_assert!` that the refcount is 0. We unsafely invent an
`Owned<Request<_>>` and pass that to the driver.

The driver has the option of `into_shared` to obtain an
`ARef<Request<_>>`. We use this for remote completion and timer
completion in rnull.

In most drivers, when the driver hands off the request to the hardware,
the driver will stop accounting for the request. The `Owned<Request<_>>`
is consumed when issuing to the driver, or the driver could simply drop
it. Refcount goes to 1. An ID is passed along to hardware.

When a completion comes back from hardware, it carries the ID. We use
the C block layer `tag_to_rq` machinery to turn this ID back into an
`Owned<Request<_>>`. In that process, we check that `refcount == 1` and
if so, we set refcount to 0 and invent an `Owned<Request<_>>`.

There was simply no need to have two separate values for "owned by C"
and "owned by Rust, not referenced".

Best regards,
Andreas Hindborg


