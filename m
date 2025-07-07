Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5698F1E9B3D;
	Mon,  7 Jul 2025 11:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751886786; cv=none; b=LN3bB070RigTJBYARvh2tySvvAX7amxieDySlJeU/vvzAzM5+mFdoCx+/Lz5dL+TLpnIB+yPnycEwQG1i/A94oZwtFpGTi58TkxBeb8CX+BdAxn4gV/6PhfSFVHwn2GnLoRB9mH/p+LSbc4nfgDukCKBQs6+WotAQxuFVe/2RRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751886786; c=relaxed/simple;
	bh=oEMxpyyF7HEXd1TbvNnCLN4sJmwmDNoHjaIaSlSPtJ0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lgJFkjEEo9r59BAibam8tZHbwfJ4B7xPYhDBdcapDAPky1ptkDeM8F3tnC+hJPTeCTW2E5NFVL16BVGEoP8NEbY/Hd7fGRAlprC+eI096ay7G48BlHLpdPiFrVoiWtuqmGS2EM19E/kzr+A6pn2gvWq59nYEk3tX7Sdv6+yqJzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TMYfl5wp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TMYfl5wp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F2D6C4CEE3;
	Mon,  7 Jul 2025 11:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751886785;
	bh=oEMxpyyF7HEXd1TbvNnCLN4sJmwmDNoHjaIaSlSPtJ0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TMYfl5wpuHGnp96VhRoqffArQ2iGrUthLG7gCHUw6U8xcq0ZcIS1H2fxqFOOiSy6D
	 qSKzp5+fnVI3fKQwMUxOZHAc+UDltV2O/wFg4G4KTFbjhc4FpLKViGlIIZaNYa4G5T
	 ME89UcaQRGBOCDwGfelddVMyx+fVOUIaVCH822ySr9f4vKkJi8O+A0VU98tfZHss8f
	 pi4K+F5zzJUD1043KUxy7zvuVAI1kP56/a3MEfNWAy+EodZTShdDduOABc8RpbTvU/
	 ShBuk2YU/LecI7ixfJSJ886Hq80mMwpZitZUJG5JMl5C/obvgTONcugLmn6JSl7cxY
	 0/XwdE6KVXVhA==
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
In-Reply-To: <DB5PX74OB3DX.1UNT8MIBWNC2G@kernel.org> (Benno Lossin's message
	of "Mon, 07 Jul 2025 11:33:41 +0200")
References: <20250618-unique-ref-v11-0-49eadcdc0aa6@pm.me>
	<20250618-unique-ref-v11-4-49eadcdc0aa6@pm.me>
	<DB1LPFAX66WG.1QL5JDCWI7RN4@kernel.org> <aGuAR7JCrlmzQrx4@mango>
	<gFz7glX0UIHGffQdm4_vD_XkT5GZEKB0Lx0cd8-TCR8glMzIIY7VBIvppFVr2RURNBnGx9lKJqrE5av7xSUcbA==@protonmail.internalid>
	<DB5PX74OB3DX.1UNT8MIBWNC2G@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 07 Jul 2025 13:12:58 +0200
Message-ID: <87bjpwqmo5.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Benno Lossin" <lossin@kernel.org> writes:

> On Mon Jul 7, 2025 at 10:07 AM CEST, Oliver Mangold wrote:
>> On 250702 1524, Benno Lossin wrote:
>>> On Wed Jun 18, 2025 at 2:27 PM CEST, Oliver Mangold wrote:

[...]

>>> > +/// - [`into_shared()`](OwnableRefCounted::into_shared) set the reference count to the value which
>>> > +///   the returned [`ARef<Self>`] expects for an object with a single reference in existence. This
>>> > +///   implies that if [`into_shared()`](OwnableRefCounted::into_shared) is left on the default
>>> > +///   implementation, which just rewraps the underlying object, the reference count needs not to be
>>> > +///   modified when converting an [`Owned<Self>`] to an [`ARef<Self>`].
>>>
>>> This also seems pretty weird...
>>>
>>> I feel like `OwnableRefCounted` is essentially just a compatibility
>>> condition between `Ownable` and `RefCounted`. It ensures that the
>>> ownership declared in `Ownable` corresponds to exactly one refcount
>>> declared in `RefCounted`.
>>>
>>> That being said, I think a `RefCounted` *always* canonically is
>>> `Ownable` by the following impl:
>>>
>>>     unsafe impl<T: RefCounted> Ownable for T {
>>>         unsafe fn release(this: NonNull<Self>) {
>>>             T::dec_ref(this)
>>>         }
>>>     }
>>>
>>> So I don't think that we need this trait at all?
>>
>> No. For an `ARef<T>` to be converted to an `Owned<T>` it requires a
>> `try_from_shared()` implementation. It is not even a given that the
>> function can implemented, if all the kernel exposes are some kind of
>> `inc_ref()` and `dec_ref()`.
>
> I don't understand this paragraph.
>
>> Also there are more complicated cases like with `Mq::Request`, where the
>> existence of an `Owned<T>` cannot be represented by the same refcount value
>> as the existence of exactly one `ARef<T>`.
>
> Ah right, I forgot about this. What was the refcount characteristics of
> this again?
>
> *  1 = in flight, owned by C
> *  2 = in flight, owned by Rust
> * >2 = in flight, owned by Rust + additional references used by Rust
>        code
>
> Correct? Maybe @Andreas can check.

We have been a bit back and forth on this. This is how we would like it
going forward:


/// There are three states for a request that the Rust bindings care about:
///
/// - 0: The request is owned by C block layer or is uniquely referenced (by [`Owned<_>`]).
/// - 1: The request is owned by Rust abstractions but is not referenced.
/// - 2+: There is one or more [`ARef`] instances referencing the request.


Best regards,
Andreas Hindborg



