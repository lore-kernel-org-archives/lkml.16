Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F89D1DF270;
	Wed,  7 May 2025 11:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746617217; cv=none; b=WTXur2yJ50hBkeDCjdNZ3oeFneML6TksEtkVFh9014H/Ujx+TDLGcnnrD21woaiH/ucB8MsNXbVfsfIsEeeTOzcmsbex2LvgCb/SlsTUP7HlEuaj9YQ5i+MMMVeNN5GvnzhpsiZI3q65BHInKUINmMQrkD0+FVVndQy+dKaq1E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746617217; c=relaxed/simple;
	bh=3OP80T1TUr1RcBZZRe44AoSvO1VcM/ywxxkRLXR8834=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=HtZxMQNfErbfZb42KzbB1rLzB2GFVpLPMghfUxa3dwq4xncAXuAxN3CWugVi+dxtNJDBKCVheYvR7AWssNtzOFx9Jt4H/VLYeytoOKWG1a53/wM4SrqpLIdBza7sAg9SVzSEOFGB6xzVGKq/2LXG0n/Dqy6ESeThKH6Z6n503FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q38L8S9S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q38L8S9S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C6F9C4CEE7;
	Wed,  7 May 2025 11:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746617216;
	bh=3OP80T1TUr1RcBZZRe44AoSvO1VcM/ywxxkRLXR8834=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=q38L8S9S+wve2b5pG+K/5t5A5qxlxyLzXDtbSG1idYmWYm7B0pa5wJvoq+Sx7WkfM
	 DkWdl/PgZJd1eTXt8RmLRO2hCbOAJHofDUPV8WcZ8Z69LHyAn7ccFde/96RC3pM9ys
	 ozeckDk2e2JwX5DZnAWfD/CB16GMF4tHahQqezTig1dfwpNMgFoivSAQePFckF36rE
	 uuUj/DJvZUagpGDN4bmba5CxkWzeB54sRO4skiR17n9y+9rlG12C5+KFS690vkTgiS
	 OT0Yfzv8PaWwJ9e1bZ+HDtJ9kvabW4KWNkMiUTlPYi3u4H128FshaW5U5XiL9b2gxf
	 1UwrMyGl1ahvA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 May 2025 13:26:52 +0200
Message-Id: <D9PW4M8X6TMK.33M9WF0S42KI4@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Oliver Mangold" <oliver.mangold@pm.me>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] rust: elaborate safety requirements for
 `AlwaysReferenceCounted`
From: "Benno Lossin" <lossin@kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>
X-Mailer: aerc 0.20.1
References: <20250506-aref-from-raw-v2-1-5a35e47f4ec2@kernel.org>
 <D9PSH8MJ48JO.3OOA3Z3NSBGC9@kernel.org>
 <P0Vs61xa67BWtC_H9sCVioTN9Eb9G0N6w23IVMhek_I0QzvNsTQYYs269Ud_VBv72bWdMab3i8z8YsOeYkCEvA==@protonmail.internalid> <aBscvBwCD1o0OC_v@google.com> <87frhgpym0.fsf@kernel.org>
In-Reply-To: <87frhgpym0.fsf@kernel.org>

On Wed May 7, 2025 at 11:19 AM CEST, Andreas Hindborg wrote:
> "Alice Ryhl" <aliceryhl@google.com> writes:
>> On Wed, May 07, 2025 at 10:35:16AM +0200, Benno Lossin wrote:
>>> On Tue May 6, 2025 at 10:29 AM CEST, Andreas Hindborg wrote:
>>> > diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
>>> > index 9d0471afc964..52683d686c8a 100644
>>> > --- a/rust/kernel/types.rs
>>> > +++ b/rust/kernel/types.rs
>>> > @@ -409,6 +409,10 @@ pub const fn raw_get(this: *const Self) -> *mut =
T {
>>> >  /// Implementers must also ensure that all instances are reference-c=
ounted. (Otherwise they
>>> >  /// won't be able to honour the requirement that [`AlwaysRefCounted:=
:inc_ref`] keep the object
>>> >  /// alive.)
>>> > +///
>>> > +/// Implementers of this trait must ensure that values of types impl=
ementing this trait can never be
>>> > +/// owned by value. Instead, values must be owned and used through a=
 pointer type. That is, a type
>>> > +/// that implements [`Deref`].
>>>
>>> I don't think this covers every case, if I modify your example above
>>> with Alice's suggestion and using `Box` instead of the stack, I get the
>>> same problem:
>>>
>>>     struct Empty {}
>>>
>>>     unsafe impl AlwaysRefCounted for Empty {
>>>         fn inc_ref(&self) {}
>>>         unsafe fn dec_ref(_obj: NonNull<Self>) {}
>>>     }
>>>
>>>     fn unsound() -> ARef<Empty> {
>>>         use kernel::types::{ARef, RefCounted};
>>>
>>>         let data =3D Box::new(Empty {});
>>>         let aref =3D ARef::from(&data);
>>>
>>>         aref
>>>     }
>>>
>>> The same should be true if one uses `Arc` instead of `Box`. So, even
>>> though we store it in a "pointer type that implements `Deref`", it is
>>> unsound.
>>>
>>> I think that types that implement `AlwaysRefCounted` must only be store
>>> inside of `ARef<T>`. So something like "Values of this trait must only
>>> be exposed as `ARef<Self>` or `&Self`." I'm not satisfied with the
>>> wording 'exposed', maybe you have a better word or can expand the
>>> sentence.
>>
>> I mean, in some sense the problem is that Empty violates the existing
>> requirement:
>>
>> Implementers must also ensure that all instances are reference-counted.
>> (Otherwise they won't be able to honour the requirement that
>> [`AlwaysRefCounted::inc_ref`] keep the object alive.)
>
> The example holds, even if you implement `inc_ref`/`dec_ref` properly,
> right?

Yes.

Although one could interpret the part that Alice quoted above to mean
the same thing as I suggested (only giving access to `ARef<Self>`, as
any other smart pointer isn't aware of the inner refcounting of the
value).

With that interpretation, we could argue that there is nothing wrong
with the safety requirements. But I'd say that we should definitely
mention that one is only allowed to use `ARef<Self>`/`&Self` and not
hand out any other ways to access `Self`.

---
Cheers,
Benno
