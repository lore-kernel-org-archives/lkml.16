Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B753F290F
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 05:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747115054; cv=none; b=jZ+4GMe+JFn1/GiuF6vYBJUgTnCxuUiv3+f9wvNKA8KbqUHReo6E3xxlbrrM7LbK7vk+kDqXJ8VrRXrgYBwxeDxPT7G4PEMUEMeZfAaW66D3lf9wQNbyHt8D9st4l6pNJuQDAvjnrvYqtpWAxSA3n5rfbrUfVu2fjkWK62pzmYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747115054; c=relaxed/simple;
	bh=Zbe4N+V9gh1vmUPPZLRGR3H+As9dFItK32maREHtCZo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Po9uWmdLvg+fBnhocEsb06gFl0I+eligGBL7iXFDS/uGODQo5Ay3kgSHY5JxvTastixyQq3gKyH8FS+NuLD8lbmoLeOE06dLg7iWS2M9ZB39BCrLfpKbo0cTv6SP8aZBhxEqMTFPMP9QeXqK02Zys7uIbx1kcGZmFnpeI9XOeho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=pX/IWIB1; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="pX/IWIB1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RXLrrUA45o48lUj74g2mAx4QnGmChzoR8goPgjw6V/k=; t=1747115051; x=1747719851; 
	b=pX/IWIB1stk1ep1B/XgMsCeycTIroREG+KqDA4ICbP/sXj5la/1ZWeo5X4n3GhY4eupoyw6m4rS
	MjPIsm+D3vdoK+4s6rVfhtFxQCN4bpDDcM8lQ0bPHJ+mrxLo9eXEDcNxb1gYOTaUnvRBI69nsOZoa
	nBoEUP8JUy+61s1BOH1rE1v/0oQyMiGusluP1OSISM2WDwTv3J8s+GDVDmeWplgKNHoTkGOpn1ksI
	ZYlst2yXSPAYfnht6MVqKuG/Q9EafpRt7wh2S16IYIvs0ML29/OPVd2P93voDMwR0i8DUWeP6iX3e
	+qBa8+LiATRUTbAWqr/tCnzPrn7IWoZsJuvw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uEiQn-00000000LUR-482Q; Tue, 13 May 2025 07:43:58 +0200
Received: from p5b13afe4.dip0.t-ipconnect.de ([91.19.175.228] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uEiQn-00000003hgg-2zpI; Tue, 13 May 2025 07:43:57 +0200
Message-ID: <a719b6ec1ccba2ecad7421a2cdf1660d1be16888.camel@physik.fu-berlin.de>
Subject: Re: [RFC PATCH 0/15] x86: Remove support for TSC-less and CX8-less
 CPUs
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Linus Torvalds <torvalds@linux-foundation.org>, "Maciej W. Rozycki"
	 <macro@orcam.me.uk>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo
 Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, "Ahmed S .
 Darwish" <darwi@linutronix.de>,  Andrew Cooper <andrew.cooper3@citrix.com>,
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@kernel.org>,  Dave
 Hansen <dave.hansen@linux.intel.com>, John Ogness
 <john.ogness@linutronix.de>, Peter Zijlstra	 <peterz@infradead.org>, Thomas
 Gleixner <tglx@linutronix.de>
Date: Tue, 13 May 2025 07:43:56 +0200
In-Reply-To: <CAADWXX8+-=pcOUeu_cwX_vkkkGp6jn0GQLUhZX8MxGGRjKz=Lg@mail.gmail.com>
References: <alpine.DEB.2.21.2505050944230.31828@angie.orcam.me.uk>
	 <98C88CE8-C3D5-4B75-8545-71DD47C67614@zytor.com>
	 <alpine.DEB.2.21.2505051356340.31828@angie.orcam.me.uk>
	 <1E50C160-EB89-4C5C-B9F0-6441026EE380@zytor.com>
	 <20250505205405.GNaBklbdKLbadRATbr@fat_crate.local>
	 <alpine.DEB.2.21.2505060059010.31828@angie.orcam.me.uk>
	 <20250506141631.GEaBoZvzPCWh88xDzu@fat_crate.local>
	 <alpine.DEB.2.21.2505062228200.21337@angie.orcam.me.uk>
	 <8C172B63-38E1-427B-8511-25ECE5B9E780@alien8.de>
	 <alpine.DEB.2.21.2505121225000.46553@angie.orcam.me.uk>
	 <20250512134853.GGaCH8RUjJwgHq25qx@fat_crate.local>
	 <alpine.DEB.2.21.2505121810040.46553@angie.orcam.me.uk>
	 <CAADWXX8+-=pcOUeu_cwX_vkkkGp6jn0GQLUhZX8MxGGRjKz=Lg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi,

On Mon, 2025-05-12 at 19:00 -0700, Linus Torvalds wrote:
> On Mon, May 12, 2025 at 10:29=E2=80=AFAM Maciej W. Rozycki <macro@orcam.m=
e.uk> wrote:
> >=20
> >  Thank you.  It seems it'll be tough for me though to fulfil the GPG ke=
y
> > trustability requirement.  While I've used PGP/GPG since 1995, I haven'=
t
> > been active collecting signatures with my more recent keys/IDs and neit=
her
> > I have appeared in public among Linux kernel developers often enough fo=
r
> > me to be identified by face over a video call.  Oh well...
>=20
> I don't think this has been insurmountable before, particularly for
> anybody who has been around for as long as you have.  Even your
> current email goes back to at least the beginnings of git.
>=20
> If "two decades+ of active kernel development involvement using the
> same email address" doesn't make you eligible for a kernel.org
> account, we're doing something wrong.

I agree. Maciej does a fantastic job saving old junk^W^Wretro hardware ;-).

I'm sure there should be anyone in Maciej's area that could sign his keys.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
