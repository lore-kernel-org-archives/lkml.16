Received: from forward501b.mail.yandex.net (forward501b.mail.yandex.net [178.154.239.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F3723A58E;
	Fri,  4 Jul 2025 15:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751642076; cv=none; b=XRIELG/K1jULJV+iZL3iv8WdCs4XYKVGAEo5sjxeAj9gszd+nyJE3+kA6vMzlg9cbnbyTq9xH5Lgl9novVONgIEBJ3H+3WNWFvUHXLGwjM4g3UucDF0LJ5CJnJjFAccR+wEiI4CBAj8aPD0mzZ/56r4nFQPOPCL49nQhp04Wzk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751642076; c=relaxed/simple;
	bh=jF3Inlj3JG/E6BYFBEPp9WN3HpHGhw6OMBNAHh2KZhA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mDexoKL+p9tXHbjY173dMOWZ8puCAZMLncxLTnj6kQnpilRzjIoKJA9qp75QvsJ4LXIzxGWDpJxu3wDplwxb97OCbvrfbPCpiOYbGVFwOzcQcVg8zdZPEliPhNmtMbi72nhSlhEQl8jG6fX5VTRJmOVjUhHOK0M/n0i7dsXVCIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=BCzccpvN; arc=none smtp.client-ip=178.154.239.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="BCzccpvN"
Received: from mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net [IPv6:2a02:6b8:c24:1820:0:640:7e2f:0])
	by forward501b.mail.yandex.net (Yandex) with ESMTPS id 37AC7620FE;
	Fri,  4 Jul 2025 18:14:25 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id JEfrFgXLrCg0-8kXO3A0w;
	Fri, 04 Jul 2025 18:14:24 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1751642064;
	bh=r3cC44VV953qYGUiBvgDLhMT0ZcikyuAe9Lipi2US5k=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=BCzccpvNGN1KSvPgJMpAGwht7xC/2+UW6iaqnQXd3QnDbwOb0Q/iE3imkRoO9syJq
	 5bNt9woEXngoOaJB+1kxjV87/ebSNStuWCPLNIv5sZVvp2l9GTpSL3nVcbch2i47vi
	 upyLPF95Wmz3tgoPlXrYECYsFCIpM886jIQKZQq8=
Authentication-Results: mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Fri, 4 Jul 2025 18:14:19 +0300
From: Onur <work@onurozkan.dev>
To: Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org,
 mattgilbride@google.com, wedsonaf@gmail.com, daniel@sedlak.dev,
 tamird@gmail.com
Subject: Re: [PATCH] rust: rbtree: simplify finding `current` in
 `remove_current`
Message-ID: <20250704181419.0a6a4d97@nimda.home>
In-Reply-To: <aGeEcOEYXiLju-Lj@google.com>
References: <20250704054539.7715-1-work@onurozkan.dev>
	<aGeEcOEYXiLju-Lj@google.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 4 Jul 2025 07:36:16 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Fri, Jul 04, 2025 at 08:45:39AM +0300, Onur =C3=96zkan wrote:
> > The previous version used a verbose `match` to get
> > `current`, which may be slightly confusing at first
> > glance.
> >=20
> > This change makes it shorter and more clearly expresses
> > the intent: prefer `next` if available, otherwise fall
> > back to `prev`.
> >=20
> > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> > ---
> >  rust/kernel/rbtree.rs | 14 +++-----------
> >  1 file changed, 3 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/rust/kernel/rbtree.rs b/rust/kernel/rbtree.rs
> > index 8d978c896747..8f1052552132 100644
> > --- a/rust/kernel/rbtree.rs
> > +++ b/rust/kernel/rbtree.rs
> > @@ -769,18 +769,10 @@ pub fn remove_current(self) -> (Option<Self>,
> > RBTreeNode<K, V>) { // the tree cannot change. By the tree
> > invariant, all nodes are valid. unsafe { bindings::rb_erase(&mut
> > (*this).links, addr_of_mut!(self.tree.root)) };
> >=20
> > -        let current =3D match (prev, next) {
> > -            (_, Some(next)) =3D> next,
> > -            (Some(prev), None) =3D> prev,
> > -            (None, None) =3D> {
> > -                return (None, node);
> > -            }
> > -        };
> > -
> >          (
> > -            // INVARIANT:
> > -            // - `current` is a valid node in the [`RBTree`]
> > pointed to by `self.tree`.
> > -            Some(Self {
> > +            next.or(prev).map(|current| Self {
> > +                // INVARIANT:
> > +                // - `current` is a valid node in the [`RBTree`]
> > pointed to by `self.tree`. current,
> >                  tree: self.tree,
> >              }),
>=20
> I'm okay with this change, but the INVARIANT: comment usually goes
> before the `StructName {` declaration rather than on the field. For
> example, what about this?
>=20
> 	// INVARIANT:
> 	// - `current` is a valid node in the [`RBTree`] pointed to
> by `self.tree`. let cursor =3D next.or(prev).map(|current| Self {
> 	    current,
> 	    tree: self.tree,
> 	});
> =09
> 	(cursor, node)

Looks nice. Do you want me to send v2 right away, or wait couple of days
to give sometime to other reviewers?

Regards,
Onur
