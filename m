Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE81A1AAE01;
	Wed, 14 May 2025 14:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747233904; cv=pass; b=jPGXjTBqetpMNYFPYueIQ3eVE0M9+bIuxVx12XM+BGCFLK1wd0oOpOq5Sw/KsBxaDO8Di72zrq+pdQy1bp4zsBC/SHDEwnhAZeLB730TYNaj8oRgnt9YFeYcUMc+k8h+gpOgEVw5Ci/egnWNv5xY/H5oK0NdB7yqxO+b5qUMMc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747233904; c=relaxed/simple;
	bh=G9Lr9h/qzKBSsvh36KkaPVUOYavbtRCU+dcCcXojJ7M=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=YiNjgI7ieEuPbSQ7NMTlNNBbgViyJSIZ6Nc2uK8y1rH+rkvEHr6O3H2kVH7oL0IBuhLZSLvHT/1NUdmVnLWywpqpcgIdKUu2aCRAQLBQqXae9bOnDtpVLLx0SMnxcHWotEChL6kYj3gCdEsWmwxBlITRCfdGqPGuZ81y+m6F2m0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=k3eLODiR; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="k3eLODiR"
ARC-Seal: i=1; a=rsa-sha256; t=1747233878; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TcNwq0VOstVJcv753zkvRm42a/UqrRnVZJKoqYTkDLvBXNLCwubcaR+LeExq3NZIxCCRt0Q/7uGm0bfhR+urd9qs1Y92CBAyeTFPIk2uuiGTla8Uqu2VcavtzE08h71QSa4xb+ycKU6Xt0LT0eK7i7SJVqRxp9FR7ZFXL0VDdlY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747233878; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IuVj56x7vLncLy3xZykI9+zK4SpK9TOpJL2h9C3nusA=; 
	b=aleo8XW2N+gnGc69GOeUJQFvYf3PFeKCp63elC3ItxcXyPDIX0pjknSQT5IOERb2q5sOMRo4tPh5BZmeg/7CVXuqPXLy0JkkA1vSPBYoPCrXPo+R68hfGrOMhkQcS6pf3g4ZW2FI9LD+6saLL7Qn0oBnXkOU72HZSIWzR04etNI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747233878;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=IuVj56x7vLncLy3xZykI9+zK4SpK9TOpJL2h9C3nusA=;
	b=k3eLODiRSkzeyuwio/QtYjni4sNeR55sYwm/GKoZlAyBBYfw+fMfux0Fn4vsN44G
	7U2t++MrW0t6ZabgqMJ23A5mo6ptrF1MV3RAPn/PYo7ILMMYLIFLqjUhwqp/1+3LS3D
	9gm2O+F2B6DNjScgKEl8T8oykRKUgH+eBr+mWddE=
Received: by mx.zohomail.com with SMTPS id 1747233876983440.3664498519365;
	Wed, 14 May 2025 07:44:36 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [PATCH v2] rust: irq: add support for request_irq()
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <CAH5fLggSET--eSW=rA_hw2jAyAO6_fa82gm0X3qeanXEvmZscA@mail.gmail.com>
Date: Wed, 14 May 2025 11:44:22 -0300
Cc: Boqun Feng <boqun.feng@gmail.com>,
 ojeda@kernel.org,
 alex.gaynor@gmail.com,
 gary@garyguo.net,
 bjorn3_gh@protonmail.com,
 benno.lossin@proton.me,
 a.hindborg@kernel.org,
 tmgross@umich.edu,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <3753EBEB-8538-403A-BEFC-768390EB2D9E@collabora.com>
References: <20250122163932.46697-1-daniel.almeida@collabora.com>
 <Z5HtHVMipAdNvOcj@boqun-archlinux>
 <CAH5fLggSET--eSW=rA_hw2jAyAO6_fa82gm0X3qeanXEvmZscA@mail.gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-ZohoMailClient: External

Hi Alice,

> On 23 Jan 2025, at 06:07, Alice Ryhl <aliceryhl@google.com> wrote:
>=20
> On Thu, Jan 23, 2025 at 8:18=E2=80=AFAM Boqun Feng =
<boqun.feng@gmail.com> wrote:
>>=20
>> On Wed, Jan 22, 2025 at 01:39:30PM -0300, Daniel Almeida wrote:
>>> Add support for registering IRQ handlers in Rust.
>>>=20
>>> IRQ handlers are extensively used in drivers when some peripheral =
wants to
>>> obtain the CPU attention. Registering a handler will make the system =
invoke the
>>> passed-in function whenever the chosen IRQ line is triggered.
>>>=20
>>> Both regular and threaded IRQ handlers are supported through a =
Handler (or
>>> ThreadedHandler) trait that is meant to be implemented by a type =
that:
>>>=20
>>> a) provides a function to be run by the system when the IRQ fires =
and,
>>>=20
>>> b) holds the shared data (i.e.: `T`) between process and IRQ =
contexts.
>>>=20
>>> The requirement that T is Sync derives from the fact that handlers =
might run
>>> concurrently with other processes executing the same driver, =
creating the
>>> potential for data races.
>>>=20
>>> Ideally, some interior mutability must be in place if T is to be =
mutated. This
>>> should usually be done through the in-flight SpinLockIrq type.
>>>=20
>>> Co-developed-by: Alice Ryhl <aliceryhl@google.com>
>>> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>>> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
>>> ---
>>>=20
>>> Changes from v1:
>>>=20
>>> - Added Co-developed-by tag to account for the work that Alice did =
in order to
>>> figure out how to do this without Opaque<T> (Thanks!)
>>> - Removed Opaque<T> in favor of plain T
>>=20
>> Hmmm...
>>=20
>> [...]
>>=20
>>> +#[pin_data(PinnedDrop)]
>>> +pub struct Registration<T: Handler> {
>>> +    irq: u32,
>>> +    #[pin]
>>> +    handler: T,
>>=20
>> I think you still need to make `handler` as `!Unpin` because =
compilers
>> can assume a `&mut T` from a `Pin<&mut Registration>`, am I missing
>> something here?
>=20
> The current version operates under the assumption that PhantomPinned
> is enough. But I'm happy to add Aliased here.
>=20
> Alice

Aliased? What is this? I can=E2=80=99t find that trait or type anywhere.

=E2=80=94 Daniel


