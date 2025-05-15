Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076352222CB;
	Thu, 15 May 2025 12:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747312111; cv=pass; b=WUz6I9TGr/7eB8VAL2uaHMQshzos58BMTRSHRfwwOTLaFwpfOnj5uLeISxTNZnFcY1+cclN9Kf2/KXyYBZKrz7ex6YRqP50P8C/QtYgaA92TEz+rOBKwZ39QuU+G8WQDIif8cJ/FU5UifQ/9s5MB6Fp3yh74VT7G1eBjQxcmAro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747312111; c=relaxed/simple;
	bh=1KmjICqAPMW902hFnhxBalK1v+p498bQnPm22BLWGEA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=RWkOVKFt9VwfW2jlj3/dOYxAKK6fxWbytTcBc0idHoPkO57+qv51E/ozPjy/D5LbyDxmAjpf/VJs0KDhg9QCWH0Rr5lwrjSDEbZF1r7kPfgMA1L9ZXYxueoBAjnqKL84oVwA2GtfiGPnXL9BB9gjvQcCgRv4DO9GNORnOfkACc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=CSTl+sl+; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="CSTl+sl+"
ARC-Seal: i=1; a=rsa-sha256; t=1747312088; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hE5Ahuoe3liWlEt3Ayxmaghi/Hr2Qj9XuMC6VMi+Tz4gk8Ql4v62rGUaopNfb0rLiGnLFSJxjpGvsU4WEx2BYBtvxKnPHcwJzxdAL4f6cHoReJJrpUR8y6xTRJ2BqMgJpvufaxFldORC7rQ4S4NMykGtmVWKhfi0d6wJ8Zl+Rq0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747312088; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pL7tEiHHFxsDRCPZMIVsmA66s8fZk8HT6WlwVxESBm0=; 
	b=DyKuI//dykh19/JooaAa4gATHB76KhGYTN2rL7iWAjwDBPKLTXPvBNUB1Ar6CwcgYdKSWMonbrqvZfFB4iaPIJaSx+XlXyTF8voTxk7hAvHYMFNhI2vr5Gvguf9Vlem57jmOcBGWdpaMrfyE6P2gc42kBB103b0jefnHr1F28C0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747312088;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=pL7tEiHHFxsDRCPZMIVsmA66s8fZk8HT6WlwVxESBm0=;
	b=CSTl+sl+Z03hAt+YSxSsu5EOkFiolwIldIjtRwcxPT244jSd3OUE+YtYvncYTgiC
	LzG0uTph4z+EHiqg1xHhdfxaYhq45qu57zM33jbo3VW1qVbXR4HfGR3LKQWbf1O3Nuz
	IaD+Y207lzkDwBeLzoiG9xKnLMo3y87/pxUUuPjQ=
Received: by mx.zohomail.com with SMTPS id 1747312086918595.3368740394998;
	Thu, 15 May 2025 05:28:06 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [PATCH v3 1/2] rust: irq: add support for request_irq()
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <aCXYaCGvO_tI1OOh@pollux>
Date: Thu, 15 May 2025 09:27:51 -0300
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
Message-Id: <39C56E3E-07C6-44BB-B5F6-38090F037032@collabora.com>
References: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com>
 <20250514-topics-tyr-request_irq-v3-1-d6fcc2591a88@collabora.com>
 <aCUQ0VWgoxdmIUaS@pollux>
 <A7E3A124-AF77-4A4A-B4E2-AE7DDB1CE007@collabora.com>
 <aCXYaCGvO_tI1OOh@pollux>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-ZohoMailClient: External



> On 15 May 2025, at 09:04, Danilo Krummrich <dakr@kernel.org> wrote:
>=20
> On Thu, May 15, 2025 at 08:54:35AM -0300, Daniel Almeida wrote:
>> Hi Danilo,
>>=20
>>> On 14 May 2025, at 18:53, Danilo Krummrich <dakr@kernel.org> wrote:
>>>=20
>>> On Wed, May 14, 2025 at 04:20:51PM -0300, Daniel Almeida wrote:
>>>> +/// // This is running in process context.
>>>> +/// fn register_irq(irq: u32, handler: Handler) -> =
Result<Arc<Registration<Handler>>> {
>>>> +///     let registration =3D Registration::register(irq, =
flags::SHARED, c_str!("my-device"), handler);
>>>> +///
>>>> +///     // You can have as many references to the registration as =
you want, so
>>>> +///     // multiple parts of the driver can access it.
>>>> +///     let registration =3D Arc::pin_init(registration, =
GFP_KERNEL)?;
>>>=20
>>> This makes it possible to arbitrarily extend the lifetime of an IRQ
>>> registration. However, we must guarantee that the IRQ is =
unregistered when the
>>> corresponding device is unbound. We can't allow drivers to hold on =
to device
>>> resources after the corresponding device has been unbound.
>>>=20
>>> Why does the data need to be part of the IRQ registration itself? =
Why can't we
>>> pass in an Arc<T> instance already when we register the IRQ?
>>>=20
>>> This way we'd never have a reason to ever access the Registration =
instance
>>> itself ever again and we can easily wrap it as =
Devres<irq::Registration> -
>>> analogously to devm_request_irq() on the C side - without any =
penalties.
>>>=20
>>>> +///     // The handler may be called immediately after the =
function above
>>>> +///     // returns, possibly in a different CPU.
>>>> +///
>>>> +///     {
>>>> +///         // The data can be accessed from the process context =
too.
>>>> +///         let mut data =3D registration.handler().0.lock();
>>>> +///         *data =3D 42;
>>>> +///     }
>>>> +///
>>>> +///     Ok(registration)
>>>> +/// }
>>>=20
>>=20
>> Up until this point, there was no need for the data to not be inline =
with the
>> registration. This new design would force an Arc, which, apart from =
the
>> heap-allocation, is restrictive for users.
>=20
> Does the current design not also imply a heap allocation heap =
allocation? With
> my proposal irq::Registration::new() can just return an =
irq::Registration
> instance, not an impl PinInit that you need to stuff into a Box or Arc =
instead.
> Hence, there shouldn't be a difference.

Well, not really, because this impl PinInit can be assigned to something =
larger
that is already pinned, like drm::Device::Data for example, which is (or =
was)
already behind an Arc, or any other private data in other subsystems.

IIUC what you proposed has yet another indirection. If we reuse the =
example
from above, that would be an Arc for the drm Data, and another Arc for =
the
handler itself?

I definitely see your point here, I am just trying to brainstorm another =
way of
doing this.

>=20
>> Can=E2=80=99t we use Devres with the current implementation?
>>=20
>> IIUC from a very cursory glance, all that would mean is that you'd =
have to call
>> try_access() on your handler, which should be fine?
>=20
> Well, that would work indeed.
>=20
> But people will - with good reason - be upset that every access to the =
handler's
> data needs to be guarded with the RCU read side critical section =
implied by
> Revocable and hence Devres.

True, I totally missed that.

>=20
> We can easily avoid that in this case, hence we should do it.

=E2=80=94 Daniel

