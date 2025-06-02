Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C439320E6E3;
	Mon,  2 Jun 2025 14:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748875298; cv=pass; b=jI0yZ03b7d+sGlkH0/R/G28h6Mf6a6bl9oqxGJth9N6fOORPeSJIvs+9Zt8vNwqqNVB4n96qbdW4J6DaBnkcXFJttcqa0NL6xuZY8nn4Ng5P2o68lNusP83D1CcoX0rp4cs4AjGgW0RP11RVj0Cv49jhs3k+B0Nq00AecFuO5v8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748875298; c=relaxed/simple;
	bh=5WVenTmoa5TTU/MD1JJjX5B70QxApWgt4Q80ak6CXgs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=WDXoXI4mI5J/eFjHwZtaL9g7EjVXdh3VPbfx0S20+gPW67iOwdVC5SU9b2Z7JBCx5aMzIDConQ6yM2ODJ8hxvgD4+t6jRCvS/J1kP2eLkbOh4C7wxGoaUJTCi/0ACrHJi5DtpVrvWq2ribFxnw9fGRzZ5cV1JA7G5/3RQy1H4ns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=eieLBwZa; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="eieLBwZa"
ARC-Seal: i=1; a=rsa-sha256; t=1748875262; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IurCQZowWQ7DVk1aMDNPnhleQ1UnlpzoqmVWwf8tAg+uB+YlWupn9JlNkBlSbM8a1AURbgXewqYpYvdIflQzsI+kcbMCYUdp+fmeoC7OaT062MbzDOF0Pk3ADzmWh42wA29+Q5EjQKVSnbHmBLsKcH20ZatIAddBCDl3LJWgYtA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1748875262; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yAP4nEvzkvKipuKZ8I4LuAwMeif0jM6XM9ojDsGXtFI=; 
	b=IVNaUHnZMj8Mwt4VQwtQzNHurkB1sgd1ZsPE2FIK2IYEPG6ZWoJXu70C7QnTc2tAecVeM3hOmc1hjO1nZdQWsxLYQnWKQi2m2jME8wM6nk31T7BqsFkrtLrCE7EwaRDH15gQHbnQmm6/D6mkQAyyn9zBz/+wJTsCFeMicU1PQd4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1748875262;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=yAP4nEvzkvKipuKZ8I4LuAwMeif0jM6XM9ojDsGXtFI=;
	b=eieLBwZajIX02Bc3fZGX5e58OdEu9b9KW7QVC1Pg8DxoegVKYr/hMfj0eSWWak0T
	N95LY60N8fxy3YCv2Tg5iYJE331lDstw+88vEhG9pzoJ8m6r92HZI+3nS6vP8gvEEr2
	bgXq1u792FLzmUq5yrIxnuASB1Ixb+s0kl30D6X8=
Received: by mx.zohomail.com with SMTPS id 1748875259269248.6443780135536;
	Mon, 2 Jun 2025 07:40:59 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v3 1/2] rust: irq: add support for request_irq()
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <aCXxnUdO8--5y8Zo@pollux>
Date: Mon, 2 Jun 2025 11:40:43 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <1FCFF2CD-9CF1-4716-AFDA-78A5AFAF113F@collabora.com>
References: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com>
 <20250514-topics-tyr-request_irq-v3-1-d6fcc2591a88@collabora.com>
 <aCUQ0VWgoxdmIUaS@pollux>
 <A7E3A124-AF77-4A4A-B4E2-AE7DDB1CE007@collabora.com>
 <aCXYaCGvO_tI1OOh@pollux>
 <39C56E3E-07C6-44BB-B5F6-38090F037032@collabora.com>
 <aCXh1g5FWNiz7exb@pollux>
 <BEDD659F-B222-4150-9018-3B59126140E6@collabora.com>
 <aCXv86nAARGgoqEq@pollux> <aCXxnUdO8--5y8Zo@pollux>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External

Danilo,

> On 15 May 2025, at 10:52, Danilo Krummrich <dakr@kernel.org> wrote:
>=20
> On Thu, May 15, 2025 at 03:45:28PM +0200, Danilo Krummrich wrote:
>> On Thu, May 15, 2025 at 10:16:33AM -0300, Daniel Almeida wrote:
>>>=20
>>>>>=20
>>>>> Well, not really, because this impl PinInit can be assigned to =
something larger
>>>>> that is already pinned, like drm::Device::Data for example, which =
is (or was)
>>>>> already behind an Arc, or any other private data in other =
subsystems.
>>>>>=20
>>>>> IIUC what you proposed has yet another indirection. If we reuse =
the example
>>>>> from above, that would be an Arc for the drm Data, and another Arc =
for the
>>>>> handler itself?
>>>>=20
>>>> Can't you implement Handler for drm::Device::Data and e.g. make =
Registration
>>>> take an Arc<T: Handler>?
>>>=20
>>> No, because drivers may need more than one handler. Panthor needs 3, =
for
>>> example, for 3 different lines.
>>>=20
>>>>=20
>>>> The irq::Registration itself doesn't need to be allocated =
dynamically, so it'd
>>>> still be a single allocation, no?
>>>>=20
>>>=20
>>> Right, the registrations don't, but the handlers do.
>>=20
>> Why does the handler need to be allocated dynamically?
>>=20
>> What about something like the following?
>>=20
>> pub struct Registration<T, H: Handler<T>> { ... };
>>=20
>> pub trait Handler<T> {
>>   fn handle_irq(&T) -> IrqReturn;
>> }
>>=20
>> // Could be `drm::Device::Data`.
>> struct MyData { ... };
>>=20
>> // Implements `Handler<MyData>`.
>> struct IRQHandler1;
>> struct IRQHandler2;
>>=20
>> // `data` is `Arc<MyData>`
>> irq::Registration::<IRQHandler1>::new(data, ...);
>> irq::Registration::<IRQHandler2>::new(data, ...);
>>=20
>> With that you can have as many IRQs as you want without any =
additional
>> allocation.
>=20
> Alternatively we could also do the following, which is probably =
simpler.
>=20
> pub struct Registration<H: Handler> { ... };
>=20
> pub trait Handler {
>   fn handle_irq(&self) -> IrqReturn;
> }
>=20
> // Could be `drm::Device::Data`.
> struct MyData { ... };
>=20
> // Implements `Handler`.
> struct IRQHandler1(Arc<MyData>);
> struct IRQHandler2(Arc<MyData>);
>=20
> // `data` is `Arc<MyData>`
> let handler1 =3D IRQHandler1::new(data);
> let handler2 =3D IRQHandler2::new(data);
>=20
> irq::Registration::new(handler1, ...);
> irq::Registration::new(handler2, ...);
>=20

I am trying to implement this, but isn't this what we have already?

I guess the only difference would be removing the handler() accessor, as =
the
caller is now expected to figure this part out on his own, i.e.:

In your example (IIUC) that would mean accessing the Arc in IRQHandler1
and IRQHandler2 through some other clone and from the actual T:Handler =
in
the callback.

=E2=80=94 Daniel=
