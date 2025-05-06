Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E694277817
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 11:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746531743; cv=none; b=m4ykGS3XBGsQ3c4cNHiWKZKh9+kDxOYeOdxH69Zb8k4mTiEBXVOTCb4uY0LvSVdyIhrR7S2GCfi/Ng6fKmv0MEo1G+wjMWF2AqOQlu0qvqcppfUxhK51ojfuLIT31s2mm5FasmLVTr0hZsAvOy75wtWJ0p16bE+3+aohcZQPjWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746531743; c=relaxed/simple;
	bh=Nh8Gg52gry0VUBrDzDbsggmHAdjxMbxxP86cU1KTFHA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EZNeQaM2gsBfLVTrLY0sJ6ectSgrVDGtF5SNzqa5AIbK+Fcvpgz7ekQyrNnTcVPYPYHNKft2V0lIaBjG40t9WDHIJlyA0vAhK360vGAsvvusjzoHRZlRzssUN/dUC5bB4Af8pP/ggW6vNUJgWxyG90OpSFyzOY1M3JWMsmFKqT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=FiGoKJNS; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="FiGoKJNS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1746531733; x=1746790933;
	bh=WesEUseaVDIR9tdbVnoG9PdxLaoq0ZROE0/xylVBFZk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=FiGoKJNSptC8gyYMaBT9z2bnc4yH5Glqln6nijTDwgHs7D07B2fUrg1az0T92hobp
	 LXcVgQ3DjJdqdLH06YpC5ZCvzcbKSBcm+y4swBYB8fORrNK8kJtpPMZmqZlH695SpN
	 wET++AzVbZj8zDB4EUhHqmgZvzbcpedreN0Tz212GkixAYCqpThFpJVgb532aSZ43C
	 baMhQToogU7YwrIh65AkIn5yNY1G74gHtMRBlRjp/IespB06eIGNh6SfJ5S0EDsRFo
	 MjhTaIjV8NJjbW5eAHhCl6up20qsBuqWnJ7XmW0OPWuLvR2V4GKexnf8xbldByAdl6
	 4YrajD6donRfQ==
Date: Tue, 06 May 2025 11:42:08 +0000
To: Alice Ryhl <aliceryhl@google.com>
From: Oliver Mangold <oliver.mangold@pm.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Asahi Lina <lina@asahilina.net>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 5/5] rust: Add OwnableRefCounted and SimpleOwnableRefCounted
Message-ID: <aBn1jJBRToyElrF3@mango>
In-Reply-To: <aBSv0w5x8qhBfOM8@google.com>
References: <20250502-unique-ref-v10-0-25de64c0307f@pm.me> <20250502-unique-ref-v10-5-25de64c0307f@pm.me> <aBSv0w5x8qhBfOM8@google.com>
Feedback-ID: 31808448:user:proton
X-Pm-Message-ID: 1f9f6158af9c54de0ef378363581205d08980101
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 250502 1143, Alice Ryhl wrote:
> On Fri, May 02, 2025 at 09:03:04AM +0000, Oliver Mangold wrote:
> > +pub unsafe trait SimpleOwnableRefCounted: RefCounted {
> > +    /// Checks if exactly one [`ARef`] to the object exists. In case t=
he object is [`Sync`], the
> > +    /// check needs to be race-free.
> > +    fn is_unique(&self) -> bool;
> > +}
> > +
> > +#[cfg_attr(RUSTC_HAS_DO_NOT_RECOMMEND, diagnostic::do_not_recommend)]
> > +// SAFETY: Safe by the requirements on implementation of [`SimpleOwnab=
leRefCounted`].
> > +unsafe impl<T: SimpleOwnableRefCounted> OwnableRefCounted for T {
> > +    fn try_from_shared(this: ARef<Self>) -> Result<Owned<Self>, ARef<S=
elf>> {
> > +        if T::is_unique(&*this) {
> > +            // SAFETY: Safe by the requirements on implementation of [=
`SimpleOwnable`].
> > +            Ok(unsafe { Owned::from_raw(ARef::into_raw(this)) })
> > +        } else {
> > +            Err(this)
> > +        }
> > +    }
> > +}
> > +
> > +#[cfg_attr(RUSTC_HAS_DO_NOT_RECOMMEND, diagnostic::do_not_recommend)]
> > +// SAFETY: Safe by the requirements on implementation of [`SimpleOwnab=
leRefCounted`].
> > +unsafe impl<T: SimpleOwnableRefCounted> Ownable for T {
> > +    unsafe fn release(this: NonNull<Self>) {
> > +        // SAFETY: Safe by the requirements on implementation of
> > +        // [`SimpleOwnableRefCounted::dec_ref()`].
> > +        unsafe { RefCounted::dec_ref(this) };
> > +    }
> > +}
>=20
> I wonder if this is too limiting. It will limit our ability to write
> other blanket impls for Ownable and OwnableRefCounted. Using e.g. a
> derive macro might be better?
>=20
> Alice

You might be right. I don't have a strong opinion on the matter.

I'm not really familiar with procmacros, though. So maybe I should just do
away with SimpleOwnableRefCounted for now?

I mean Andreas doesn't need it for his current use case and this or a deriv=
e
macro can always be added later if it makes sense.

Best regards,

Oliver

