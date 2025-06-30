Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C688328C006;
	Mon, 30 Jun 2025 15:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751297029; cv=pass; b=TC8+9Sv8luQ1ENnVrFxmI1xj5ckFPa/9Tz93/Khu5WfVUt3vYcPMm8JthAIyIJm9JWz5pOpZ5rqEmbvgMEeaa45frSjgKc/FJmoLUXa5qz3jMSx0Af+MEiR76f/L4ZP58YFK0oaVNn1xOQc46SrYcYa3d3Q/O8Zk+HRRdnudqVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751297029; c=relaxed/simple;
	bh=8tTwO9ZYPc6bdxdTPWEIP4Q0K9Y56w0NyN2VSbUDB5E=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=huwsC1+XHSsfaRqwUI9dwjhDJQ4VuXkDjUFqpQAITFqO2IFT2jnuMzQb//dIK9AjJqDjbUQm5lCSwJxJk2r0KJwthiEvaI3lDZ/c6PUzlrjFG9K4RRu/bQJE2Kpr76xbZByku4C2s3z5f5CgGqhHQe9xXZaX7VO2WbWmWJIUBD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=f8GAnrnQ; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="f8GAnrnQ"
ARC-Seal: i=1; a=rsa-sha256; t=1751296991; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TSmuYDpWN0AjuNdpYKZxbSnnShxLnDH/1d11PN7tgQlw9la9QvFqR5LeJujLR8W+SaiEeUOnsWOe+lyXmHI5rsAj4foOVJp4c8cB5T/UlyRTxi9Shn8OqzFp3Y4vWWvzt0CUc8dohZL1orV6y4z/hZqps8hkjMAKBLtJEM0AQAM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751296991; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PTIIe1Aef1zTvIAq5zModAnt55M2pKA3V/rGHZYwSMA=; 
	b=gJgmeANLvuTPqLP8MEbmkL5qJT5CGjCET2lfKhAGLkqEfgsAf5TrMDLn6lu3D3ezxRakbpTsxcOcFWmw8UAw8BD6cC98opifG2xHeUWHjAMz7JoAf5f+a2+841uMgVJ2kCkT0LaKS/KBzufSnwOi8ptw1mQk0zTW3HDdskiXumk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751296991;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=PTIIe1Aef1zTvIAq5zModAnt55M2pKA3V/rGHZYwSMA=;
	b=f8GAnrnQR05FfuTHIf8ITMcIQe3nsndxc2Ukc8rK2fi6spJU6Fg/xZsDgDYJg85i
	ZxApeQbHeE23FwpGVt9I2HWFXXNgwpS+2T8lwu8TvF5taKEtL/X7ALB1rCNxS3ak3zY
	e2lsVmGoxKFvZAT9csDI/Xsghm4746BINUxHGpfE=
Received: by mx.zohomail.com with SMTPS id 175129699030831.897741607410353;
	Mon, 30 Jun 2025 08:23:10 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] Introduce Tyr
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <CANiq72kWGUbpDW+WjKki4JUYX63j_GFBcyQse-rgddwyoFw7cg@mail.gmail.com>
Date: Mon, 30 Jun 2025 12:22:52 -0300
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Stone <daniels@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Alice Ryhl <alice.ryhl@google.com>,
 Beata Michalska <beata.michalska@arm.com>,
 Carsten Haitzler <carsten.haitzler@foss.arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Ashley Smith <ashley.smith@collabora.com>,
 linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org,
 kernel@collabora.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <5F5F10F8-C082-44AA-9126-3436E14D0855@collabora.com>
References: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com>
 <CANiq72nJcEM09HbQB3_NpKGxr9x8Ah0VE+=XS=xvA26P2qg=_g@mail.gmail.com>
 <48605183-78B6-461E-9476-C96C8E55A55D@collabora.com>
 <CANiq72kWGUbpDW+WjKki4JUYX63j_GFBcyQse-rgddwyoFw7cg@mail.gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External

Hi Miguel,

>> Hmm, I must say I did not know that this was a thing.
>>=20
>> Why is it better than [#allow] during the development phase?
>=20
> I have some notes at:
>=20
>    https://docs.kernel.org/rust/coding-guidelines.html#lints
>=20
> Generally speaking, we default to `expect` unless there is a reason
> not to (I list some possible reasons in the link), because `expect`
> forces us to clean it when unneeded.
>=20
> Not sure what you mean by "development phase" -- even if Tyr is under
> development, it should still try to conform to the usual guidelines.
> Of course, if a particular `expect` would be a pain, then please feel
> free to use `allow`. But is that case here? i.e. you will want to
> remove the `allow` anyway when you add the new code, no?
>=20
> Thanks!
>=20
> Cheers,
> Miguel

When I said "in development"I was referring to "dead_code" specifically, =
as we
will invariably have some of that until the other parts of the driver =
land.

Just as an example: IMHO it doesn't make much sense to only introduce =
the
register definitions used for this patch if we know for sure that:

a) the currently unused definitions will be used once the subsequent =
parts land,

b) they will not change, as they're derived from the hardware itself

It makes more sense to just sit down and transcribe this part of the =
spec at
once. It lowers the chance of copy and paste errors too.

As I said, I was unfamiliar with "expect". Can it be made to work on a =
module
level? Anyway, I can try to make this work with "expect" instead of =
=E2=80=9Callow", no
worries :)

=E2=80=94 Daniel=
