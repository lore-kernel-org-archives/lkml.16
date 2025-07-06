Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2631524F
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 10:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751798813; cv=none; b=QpQ8HTLGlPwOQbk1F3X/UQk9GZM36Z4BnDBAqtCzZZ7fJnim6/PZP2xx0Y79VqBWharGGdGbI2viLdGtPyNkbVFfY91n1VDtyehkHo1WeTHjRtInG3PhLKTL2xX5itZUrhGgNz0E5h9VMHb/i7Ew/6CZEjj0NroOgnRU+VK0Wjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751798813; c=relaxed/simple;
	bh=1csdPJkrYHqiTa7aBB4h7tPO9DoYuuIveSxw3PXJbts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jrpAnHwO5jygrXiO0zt8Fb7U2WftPoNIIrHz/Mr7GHb22uTD18sglLDJMYO6OUkbGjhvsYmE95EcjGYNdBD0oNaDLAKHIc0Flk9fXsuk6lLjCDhfHM81/HiDdYpGFq23UmYMHzPj0T6/tMrVHR4KfRA6KpTkwC2gFlHo/VspT84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Fv7E4uY+; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Fv7E4uY+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=1csdPJkrYHqiTa7aBB4h7tPO9DoYuuIveSxw3PXJbts=; b=Fv7E4uY+Zu9UYX7fPZFpy6q6Fn
	4qZleqGkmvnnsKgTWZalmNha82+2YZxq21TUUsgBclr3OO9eQ2wEcv5puHoYGgVyP/J07OZBhRsAY
	uCy5DyjvCYgO4yuiEfLjAHOaMC/PWOrfEJ4MkFk6vvRP3ZMkF0q3Oa/HqWRjVFvqr4vwB0Fr4qm7O
	BRXdTRhGtCmeL5El4kJ7JJ8J1PsQMORmIw7bZe/T6jyqegTYDJCsJgzdY/CBbSzSq34+Yy+/C+LWx
	RMFzxrAK4NrmIUo/Oaq+s+yTBJAipo/tyvE8PKUDZhXsvDVMmBx+vrve3XUiIIDxhTqMGj6xxAtIh
	T1KPJGzg==;
Received: from i53875a35.versanet.de ([83.135.90.53] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uYMt8-0002wB-6E; Sun, 06 Jul 2025 12:46:26 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Piotr Zalewski <pZ010001011111@proton.me>,
 Diederik de Haas <didi.debian@cknow.org>
Cc: hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rockchip/drm: vop2: make vp registers nonvolatile
Date: Sun, 06 Jul 2025 12:46:25 +0200
Message-ID: <4207630.fIoEIV5pvu@diego>
In-Reply-To: <DB4WNMVBIWYS.273Z54K6O7DTM@cknow.org>
References:
 <20250706083629.140332-2-pZ010001011111@proton.me>
 <OWFHI491RHadO01jlQPA34GX28LC7SseKfNRwqQy4etkkJyP1YeF_0EDdAgpSXx5RW7go62EAOkedW5nbyn_hlz_K-NUrnNJeDFWv0OOSO8=@proton.me>
 <DB4WNMVBIWYS.273Z54K6O7DTM@cknow.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Sonntag, 6. Juli 2025, 12:37:40 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Diederik de Haas:
> Hi Piotr,
>=20
> On Sun Jul 6, 2025 at 12:20 PM CEST, Piotr Zalewski wrote:
> >> With a new version of a patch, you're supposed to add the tags you
> >> received for previous versions, like my Tested-by tag [1].
> >>=20
> >> (unless the new version has changed so much you feel they should not be
> >> carried over; you then need to explicitly describe that and why you
> >> dropped them)
> > =20
> > Forgot... Should i send it as PATCH v2 RESEND?
>=20
> I don't think that's needed; the maintainer will let you know if that's
> desirable or that they will add it (back) when committing.

The problem is then remembering to manually collect the tags from a
previous series.

=46or my reference, it was
Tested-by: Diederik de Haas <didi.debian@cknow.org>

So hopefully I'll remember now :-) and there is no need for a resend
at this time.


Heiko


