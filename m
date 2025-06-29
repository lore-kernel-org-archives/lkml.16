Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EC513790B
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 16:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751213647; cv=none; b=Z85D7ebkt9SJl8aKrZ5wl45bHmi5YVPuelyN3BxNvwvA+lZfCM6cnu/UTw4MNz8qBWOO5DE5h3+mNYprrqevsCIDMOhgGeQ02dO2CtO9EDH/+udOuNl6NXrYyT1Ojxe+16ciUy8ioswRLa7aJIf5fMXc3qM2/sDjgB+pkZiRq+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751213647; c=relaxed/simple;
	bh=c2uNjp77GZFOIkPT/mwzGnv1uJe0HlWkMI5MtwreWcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IiLKmilF9qmVwAnnazNLoKy8S0TehbaUgpppHhVmho+vrKUZs1m5LsII40zWfjJd7RggnFU7Gw9G6805Xd+Kbnuk8lvC7ctC4TyfGazWeNHC4d4Vy/gfvorsXeKoi7K5u2/sVoSoUNKd3n0J33x16T4A8EuufxQdrSoxArgW874=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=GlpdH2iE; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="GlpdH2iE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1751213643;
	bh=c2uNjp77GZFOIkPT/mwzGnv1uJe0HlWkMI5MtwreWcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GlpdH2iE+5CtLws8QT5pqqOl3OROsh1i4GZd1l3dHQReKOouvlOC2cowWTkOxN104
	 LxoAdy2X1c1wKgjDUFDBzyp09JBH8bIaqN6t/I/cB4IxQgJg3JiFUfNTesQCMyHSWu
	 oS5m3UhpCo/NeENBvvFD1xo5bSDpFxIJVKaqsExk=
Date: Sun, 29 Jun 2025 18:14:01 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] tools/nolibc: move FD_* definitions to sys/select.h
Message-ID: <2322d3a1-a5ff-40ec-ad7e-1580f85d95f4@t-8ch.de>
References: <07f5fdb4-2c5c-4723-b12a-abdb0c9f33b7@t-8ch.de>
 <20250623025618.GA29015@1wt.eu>
 <20250629084628.GA7992@1wt.eu>
 <d8d9ab91-0617-468e-a82d-9f271c5e6a7f@t-8ch.de>
 <20250629092552.GA30947@1wt.eu>
 <029f24fa-3512-4736-94a0-e158c158cc8e@t-8ch.de>
 <20250629094048.GA26861@1wt.eu>
 <20250629151006.GA16826@1wt.eu>
 <e2513e72-5949-463d-a950-0778609141d7@t-8ch.de>
 <20250629160823.GA2302@1wt.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250629160823.GA2302@1wt.eu>

On 2025-06-29 18:08:23+0200, Willy Tarreau wrote:
> On Sun, Jun 29, 2025 at 05:54:02PM +0200, Thomas Weißschuh wrote:
> > I saw the same issue, but only because of the changes to types.h.
> > And these should not be necessary in the first place.
> 
> You mean fd_set definition ? It's solely a matter of includes ordering
> in fact, since it depends on FD_SETSIZE.

No, I mean the '#include "sys/select.h"' in "types.h".
That breaks the dependency order, as it pulls in all kinds of other
stuff into the beginning of "types.h" which themselves depend on
definitions of "types.h".

> > The below works nicely for me:
> 
> OK. Do you prefer that we take that one or just a stub ? I'm personally
> fine with both.

I prefer moving the code.
