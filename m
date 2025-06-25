Received: from forward500b.mail.yandex.net (forward500b.mail.yandex.net [178.154.239.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A5A285C95;
	Wed, 25 Jun 2025 08:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750841018; cv=none; b=SX6ThaRyWbr4FKSEgO8D/de2HDM33IQPFuHlAoh1ZfzRRzXjnCGnm7izJaGVtyC6Id07Mm49SOCqARQW8MHO4OZTQaOtDLx3jy1WKDg+4YaRYiz4qj1uB1S7bdl6xirgMNggxNcV+eNZekAeJnf3NDUMUxoCjQwDuu0k1tOWKLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750841018; c=relaxed/simple;
	bh=Kmjw/sEqs7FMYsHa4Eb74upYl9Drag+iPdh6H3DgEKw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nSZtHo9WBOJCaXXj1FOqelL+A5p/dD6keIqrKbXrjZkZCWVAFmmbnfEgA3QT9MrQMdrTaP6w3rbZePmK0qjfp0WVhFcN8QFl20NzpmXDs0kxi9m8ZkzR5It6+ffdfiiW1wVJto9s/Wzk9PAuqfO2+XoscsgZBoB3fGYjtYIbyCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=S9yRZF4s; arc=none smtp.client-ip=178.154.239.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="S9yRZF4s"
Received: from mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net [IPv6:2a02:6b8:c23:23c6:0:640:5e87:0])
	by forward500b.mail.yandex.net (Yandex) with ESMTPS id E74A6619F2;
	Wed, 25 Jun 2025 11:36:08 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 4aPD9A1LaGk0-i5mfQuPq;
	Wed, 25 Jun 2025 11:36:07 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1750840568;
	bh=eiH/JiqtJBziHS6aXO1G2AAC4szfxmuQl4LgCpv/bVM=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=S9yRZF4sw2RvUCoMxIiH39YP2HsOD7+6usSiXuZ00Oh1aMZqt+dNZLuiuQsqdcVAi
	 +0gvobYfHG4sKEfHm2TCJz25n2NMmsZkcd+qx6WB9r48xym4gwF955MZh0PcH0Iwep
	 MCz00s+/kuCX6BkXeM0FfyyVWtI30XCDb+mwfqX0=
Authentication-Results: mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Wed, 25 Jun 2025 11:36:04 +0300
From: Onur <work@onurozkan.dev>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu
Subject: Re: [PATCH] rust: simplify `Adapter::id_info`
Message-ID: <20250625113604.21a6ec4a@nimda>
In-Reply-To: <aFux2MUDAGEYY49I@pollux>
References: <20250625043630.7677-1-work@onurozkan.dev>
	<aFux2MUDAGEYY49I@pollux>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 25 Jun 2025 10:22:48 +0200
Danilo Krummrich <dakr@kernel.org> wrote:

> On Wed, Jun 25, 2025 at 07:36:30AM +0300, Onur =C3=96zkan wrote:
> > It was obviously unnecessary to check if `id` is `Some`.
> >=20
> > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> > ---
> >  rust/kernel/driver.rs | 7 +------
> >  1 file changed, 1 insertion(+), 6 deletions(-)
> >=20
> > diff --git a/rust/kernel/driver.rs b/rust/kernel/driver.rs
> > index ec9166cedfa7..1036755cb27d 100644
> > --- a/rust/kernel/driver.rs
> > +++ b/rust/kernel/driver.rs
> > @@ -178,11 +178,6 @@ fn of_id_info(_dev: &device::Device) ->
> > Option<&'static Self::IdInfo> { /// If this returns `None`, it
> > means that there is no match in any of the ID tables directly ///
> > associated with a [`device::Device`]. fn id_info(dev:
> > &device::Device) -> Option<&'static Self::IdInfo> {
> > -        let id =3D Self::of_id_info(dev);
> > -        if id.is_some() {
> > -            return id;
> > -        }
> > -
> > -        None
>=20
> This was intentional, since I anticipated we'll get [1] eventually. :)
>=20
> [1]
> https://lore.kernel.org/lkml/20250620153914.295679-1-igor.korotin.linux@g=
mail.com/
>=20
> > +        Self::of_id_info(dev)
> >      }
> >  }
> > --
> > 2.50.0
> >=20

Even with that, it can be something like this:

fn id_info(dev: &device::Device) -> Option<&'static Self::IdInfo> {
    let id =3D Self::acpi_id_info(dev);
    if id.is_some() {
        return id;
    }

    Self::of_id_info(dev)
}

or maybe even this:

fn id_info(dev: &device::Device) -> Option<&'static Self::IdInfo> {
    Self::acpi_id_info(dev).or_else(|| Self::of_id_info(dev))
}
