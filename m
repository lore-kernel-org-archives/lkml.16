Received: from forward500a.mail.yandex.net (forward500a.mail.yandex.net [178.154.239.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AFE322A;
	Fri,  4 Jul 2025 05:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751605704; cv=none; b=t0vI0xtcfHQ26TBxPoda0wLitGYa8aA9ZPqjLlEKO0ctNllSO9tAfBJqONkq+Mrpif9lvsUM17YzNejR1uj6jlGa7A5V5AkVk3E4KmAOj8XzjjwAay7vpxLlzFXgpmKQ3Fa0JVozXFbApMTs0v7q0NaEffskAWremxueM6fqo0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751605704; c=relaxed/simple;
	bh=y1gPNZj/q88bfYBuvkxThRzZpt/n3D7A1dyvXz3xKww=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hngktCSmXj28+U3a9AmWPyve3fwxvr+mLEIC4UbmGdzY1eOMmroBiGki1F60v+iMfXjPTmfNjDkfQ29hHId88gu8xJOJyAAQwF+HO1WRDFtLxGbzj67LfHB0lDeEMou86URPQaab9vZxwceM1Gy2VHNN2gsC0nDDRsLnUIUTs3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=gbw97eqi; arc=none smtp.client-ip=178.154.239.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="gbw97eqi"
Received: from mail-nwsmtp-smtp-production-main-64.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-64.vla.yp-c.yandex.net [IPv6:2a02:6b8:c1f:1984:0:640:94c0:0])
	by forward500a.mail.yandex.net (Yandex) with ESMTPS id 9ACD5620B4;
	Fri,  4 Jul 2025 08:02:15 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-64.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id A2Vf089LriE0-WHwM9yJw;
	Fri, 04 Jul 2025 08:02:14 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1751605334;
	bh=xiN3xK1QCQB4ufzRZmASOp1MO1WSMZ7q2pXVsqlbvFc=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=gbw97eqib7MwQ+doUdFtrYVDglHAQgssMZKbtEEN6ogK6tAhGx7QpQpVcFoFxXbg8
	 VY1zTir1qjsJ9/eMV/RT400gwPucFmRqt9yMMGh/kHG06OIWcL6mOz6T2xumXydVr/
	 hacVqhjYfkGn7Jy0dOs7dUqr4OAwh6LRkiZU3M4U=
Authentication-Results: mail-nwsmtp-smtp-production-main-64.vla.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Fri, 4 Jul 2025 08:02:08 +0300
From: Onur <work@onurozkan.dev>
To: "Benno Lossin" <lossin@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <dakr@kernel.org>,
 <acourbot@nvidia.com>, <joelagnelf@nvidia.com>, <wedsonaf@gmail.com>
Subject: Re: [PATCH] rust: fix outdated safety note in
 `Revocable::revoke_internal`
Message-ID: <20250704080208.0a6bd4c3@nimda.home>
In-Reply-To: <DB2ONAGQF92H.1ARBZW47KMVV8@kernel.org>
References: <20250703172605.28891-1-work@onurozkan.dev>
	<DB2ONAGQF92H.1ARBZW47KMVV8@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 03 Jul 2025 21:55:44 +0200
"Benno Lossin" <lossin@kernel.org> wrote:

> Something went wrong with your TO addresses, merging Alex's and
> Boqun's...
>=20
> On Thu Jul 3, 2025 at 7:26 PM CEST, Onur =C3=96zkan wrote:
> > The code used to use `compare_exchange` in the initial version
> > but it was changed to `swap` after a reviewer suggestion (see [1]),
> > and then the safety comment was not updated and became incorrect.
> >
> > Link:
> > https://lore.kernel.org/all/20241211104742.533392-1-benoit@dugarreau.fr
> > [1]
> >
> > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> > ---
> >  rust/kernel/revocable.rs | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> > index 06a3cdfce344..5c0b7afa76fb 100644
> > --- a/rust/kernel/revocable.rs
> > +++ b/rust/kernel/revocable.rs
> > @@ -163,8 +163,10 @@ unsafe fn revoke_internal<const SYNC:
> > bool>(&self) -> bool { unsafe { bindings::synchronize_rcu() };
> >              }
> > =20
> > -            // SAFETY: We know `self.data` is valid because only
> > one CPU can succeed the
> > -            // `compare_exchange` above that takes `is_available`
> > from `true` to `false`.
> > +            // SAFETY: We just used an atomic `swap` to check if
> > the data was still marked
> > +            // as available. If it returns `true`, that means we
> > are the first (and only)
> > +            // thread to see it as available and mark it as
> > unavailable. So no other thread
> > +            // can access or drop the data after this. That makes
> > it safe to drop the data here.
>=20
> I think this is already addressed by this series:
>=20
>     https://lore.kernel.org/all/20250626165927.66498-1-marcelomoreira1905=
@gmail.com

Yeah, seems like.


Thanks,
Onur
