Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83ACF29899A;
	Thu, 15 May 2025 11:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310124; cv=pass; b=dz5sGrFvAmTy4d03GiGon/P2r5olIbs92dzmK0tpwTUl3YQJUxDVpDIWmH3Ys1sNM9EB/sjUMb1NIzM4TEVHuITKXMW0CLAzmw3nko26E51ItKY/emYovNolSZxJ4F4ONSD9ebpc6m006kKMKClezgqXrHKKtRqhYww7EJsswgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310124; c=relaxed/simple;
	bh=jOjgSH42Zt+Lh/WxJYrlCQqxuKGHDd4OScgdbmzvKgE=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=fJAkHdlctnRv9hq2uKdvYGoEJY6fI4l3ECZ6I9Zrr1tPq63m06cBo5bk0vBqIghdNMxwLu0mVYcMsxWfAsolIju27wxqgVrMtPGkR2/OUqUWlF96Pzn/PNMcmpnW0FcfsXCLdgSWIbxujCChpPC8ffyHVrkefZtam70YhbCkQbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=P1Cv2Odx; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="P1Cv2Odx"
ARC-Seal: i=1; a=rsa-sha256; t=1747310092; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=K67XT3xufeGY4zKjiDJAfMYIooP9iFCuBgyFeODoEUtUGTo/efkiGv+/JQJw4urkvO9rdMSkDAUzS3/WOqMA6JBRREn5RII/ad7mv+qQIT35VI33TgX5L5RcCA0bK+Fcq76kI8OWROwLxce2jFK+uiK3QZpZNc0AysIA5NJDbeU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747310092; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=X7bUNRfzuJO+T4PVgYRu8D54tQVKV9Q1fN0/yr8vrzU=; 
	b=frNm/Wb2z2GhbucqMXdqtodp5HdTHgmrGKhiLfhPIeSaueeCrznW5vAq1mNEG1Kyt3Kh6L6tEPnGcusjeXBTyMrSsac0QCIW8uME87qllN87RJKeKddhFnkebiGFBiar6yUxAVtv0ZNPJt/bw0ibRq6YNhWVf2Ul9MrC1bAsdoM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747310092;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=X7bUNRfzuJO+T4PVgYRu8D54tQVKV9Q1fN0/yr8vrzU=;
	b=P1Cv2OdxKXsvf44/wXgclSsrfiIW68rtMFhQSmOi9Pg0gWM6sobOt/FqBHIsAl1+
	MtOKpfYUh8mRA/oRLiEK+bt+hTnNtcEQllZPIVThfyz9WoAan0nVuUFtRTGzSQXOIIl
	5d7+xBME398fMdMNaSWT/FjCaLnRBrd3uBfrw7OA=
Received: by mx.zohomail.com with SMTPS id 1747310090926796.9101269819287;
	Thu, 15 May 2025 04:54:50 -0700 (PDT)
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
In-Reply-To: <aCUQ0VWgoxdmIUaS@pollux>
Date: Thu, 15 May 2025 08:54:35 -0300
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
Message-Id: <A7E3A124-AF77-4A4A-B4E2-AE7DDB1CE007@collabora.com>
References: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com>
 <20250514-topics-tyr-request_irq-v3-1-d6fcc2591a88@collabora.com>
 <aCUQ0VWgoxdmIUaS@pollux>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-ZohoMailClient: External

Hi Danilo,

> On 14 May 2025, at 18:53, Danilo Krummrich <dakr@kernel.org> wrote:
>=20
> On Wed, May 14, 2025 at 04:20:51PM -0300, Daniel Almeida wrote:
>> +/// // This is running in process context.
>> +/// fn register_irq(irq: u32, handler: Handler) -> =
Result<Arc<Registration<Handler>>> {
>> +///     let registration =3D Registration::register(irq, =
flags::SHARED, c_str!("my-device"), handler);
>> +///
>> +///     // You can have as many references to the registration as =
you want, so
>> +///     // multiple parts of the driver can access it.
>> +///     let registration =3D Arc::pin_init(registration, =
GFP_KERNEL)?;
>=20
> This makes it possible to arbitrarily extend the lifetime of an IRQ
> registration. However, we must guarantee that the IRQ is unregistered =
when the
> corresponding device is unbound. We can't allow drivers to hold on to =
device
> resources after the corresponding device has been unbound.
>=20
> Why does the data need to be part of the IRQ registration itself? Why =
can't we
> pass in an Arc<T> instance already when we register the IRQ?
>=20
> This way we'd never have a reason to ever access the Registration =
instance
> itself ever again and we can easily wrap it as =
Devres<irq::Registration> -
> analogously to devm_request_irq() on the C side - without any =
penalties.
>=20
>> +///     // The handler may be called immediately after the function =
above
>> +///     // returns, possibly in a different CPU.
>> +///
>> +///     {
>> +///         // The data can be accessed from the process context =
too.
>> +///         let mut data =3D registration.handler().0.lock();
>> +///         *data =3D 42;
>> +///     }
>> +///
>> +///     Ok(registration)
>> +/// }
>=20

Up until this point, there was no need for the data to not be inline =
with the
registration. This new design would force an Arc, which, apart from the
heap-allocation, is restrictive for users.

Can=E2=80=99t we use Devres with the current implementation?

IIUC from a very cursory glance, all that would mean is that you'd have =
to call
try_access() on your handler, which should be fine?

=E2=80=94 Daniel=
