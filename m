Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76AD17548;
	Wed,  4 Jun 2025 18:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749061987; cv=pass; b=NqdX5FGjaJx+7XYyGAUnh4B0lsjC7IX5H1ykcrWTr31lfWYSm7er3iRv9cEuTsu0y0WJV4Fl7Z9XP9SzEX3fD3yqtNjz37US2zbPBO0U8xDRv06l2X6cuhzDl/m+dH3Cjk5DYkVT8R9LokzqkO50QfDneFyCtGMu8DuqTTeZXrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749061987; c=relaxed/simple;
	bh=g19MeXRU+rscVzn3kEVKqmdQsZAslzgh3/qHYf1wHOw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=SaF1HzzlrBPzDe5rgf1RJUxCCCecoZst9vJujOlYNcOFInpnyWGcnmVPNLk3NNr+lDbHg1fWvvRcl2Kmre39dJ5Hq7PCcI/50NjNgahb3S3hWzmKCBcpHNPXFKwI1DDPySXUn2FWzHGj+tHN6x2i3+BbC889zqc24hmV5fbUAZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=YS9Y7Xb+; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="YS9Y7Xb+"
ARC-Seal: i=1; a=rsa-sha256; t=1749061955; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Hb4JqnD1EvmSlAnGcF9ukNOP3kkyeMUQH+V74cqBL0ktYk/QyeHwuxnBpjZ/CcALBFD0zxLW2NS3vaBvwVwfogr8B4KeQ2J3eBbWPeNShpImowkuBWFhLPllqGl0XPwU1/Vpmd/exy2Mi4UiwVLm3hCDcZp8dUj/krqEd7rtDhA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749061955; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=g19MeXRU+rscVzn3kEVKqmdQsZAslzgh3/qHYf1wHOw=; 
	b=mdm/PtzeJei4bakK35wq5uZfZLIqCB2tM6yZ4t3rfCBYnJIEGOQ3jPddZBzBMuyEet0g0Ue53KLBESkwGoLOVxaNk3EnnjknD2sC+lVKuJiO6iE0Hv50bUfxKYPBsLW+DUlDCQqyMuo8iJym1CxKQCGLQy6VeUl0hQeMxL0fBA4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749061955;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=g19MeXRU+rscVzn3kEVKqmdQsZAslzgh3/qHYf1wHOw=;
	b=YS9Y7Xb+4lwL9SqO9gBaJvl7Q3Pah2XC5Fc0JjelxCFPNPoWRjhDQJEueZyQAy1t
	dmX8VsVLbxw7pZ9cuK6R2imFjcBkOAXSCEUgQfrWgFZAbLBi0TcCIEJjVcGLEWVLTGc
	5sw7t0coNTai9aH1TsBCGJyynVWi+LX1Oewu/iW0=
Received: by mx.zohomail.com with SMTPS id 1749061952658107.47512305279179;
	Wed, 4 Jun 2025 11:32:32 -0700 (PDT)
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
In-Reply-To: <aD7Lhsjh6HPXedjT@cassiopeiae>
Date: Wed, 4 Jun 2025 15:32:16 -0300
Cc: Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C6A531ED-B464-46C5-A1B1-BD4A87528CA1@collabora.com>
References: <aD3PCc6QREqNgBYU@google.com> <aD3f1GSZJ6K-RP5r@pollux>
 <aD6yOte8g4_pcks7@google.com> <aD62ZGBwqXxTroeX@cassiopeiae>
 <aD64YNuqbPPZHAa5@google.com> <aD68BzKRAvmNBLaV@cassiopeiae>
 <CAH5fLgjweugttOtuiyawNp5s2N9JPoo5FTJ+Zs9t_S87ggC1Gg@mail.gmail.com>
 <aD7DvBfAxKi7Fpg_@cassiopeiae>
 <CAH5fLggKL4jMjrJJEYV=Snqftu+oc4-sTNj9spinON5kHVP9xg@mail.gmail.com>
 <aD7JuyVRVr5dSqE9@cassiopeiae> <aD7Lhsjh6HPXedjT@cassiopeiae>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External

So, what is the result of this discussion?

> On 3 Jun 2025, at 07:16, Danilo Krummrich <dakr@kernel.org> wrote:
>=20
> On Tue, Jun 03, 2025 at 12:09:05PM +0200, Danilo Krummrich wrote:
>> Yes, we could solve this with a lock as well, but it would be an =
additional
>> lock, just to maintain the current drop() semantics, which I don't =
see much
>> value in.
>=20
> If we want to keep the current drop() semantics we could use a =
completion
> instead.
>=20
> // Devres::drop()
> revoke_nosync()
> complete()
>=20
> // devres_callback
> if !try_revoke() {
> // we end up here if try_revoke() indicates that the object was
> // revoked already
> wait_for_completion()
> }

This looks like what is going on here [0], so should I implement what =
Alice suggested? i.e.:

> > Based on this, we could imagine something along these lines:
> >=20
> > struct RegistrationInner(i32);
> > impl Drop for RegistrationInner {
> > fn drop(&mut self) {
> > free_irq(...);
> > }
> > }
> >=20
> > struct Registration<T> {
> > reg: Devres<RegistrationInner>,
> > data: T,
> > }
> >=20
> > Here you can access the `data` on the registration at any time =
without
> > synchronization.

=E2=80=94 Daniel

[0] =
https://lore.kernel.org/rust-for-linux/CANiq72nfOcOGJuktzSpNAUWwekaZ98JL7c=
1FhMKCjPSG80JMPA@mail.gmail.com/T/#t=
