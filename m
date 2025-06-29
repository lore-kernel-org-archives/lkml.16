Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFF41DED53
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 16:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751214452; cv=none; b=XMLynzYkgFUU9QAClkpDruz9ZDN/yfAsmz9zXpUVH3r+WIzwWOnwKOm+DyBY1RwjTo3pVVpNGZbzSjj6fKsWMG0pHQooLXFUH6T1YW5trvcyRpTKadBhUwDA05Cr4jDjvrdZgN9N7lAgH/SYUtHdoY+J86U/aCb5/B6aZRwOmPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751214452; c=relaxed/simple;
	bh=qbCfx31CCDAjS2NOwef7V/4aEIRt//36ksST5HF+hO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y87+89iJRKz6bxFNzo37f4jex2vCGFimUVKYWXzlQIBC/PvS5ZDSu2xtD6aXxclsbq/1XT5ZhBmHBWUCzSOtnc6ePnbfSViAFzQwKyGFa1T0eWGXn+ciJ4armroJPIf4H+nBSaSIrnUMf4rzqKj4FBdifhSkcVbHFMyl1E157jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=T/IcS6Y2; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="T/IcS6Y2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1751214448;
	bh=qbCfx31CCDAjS2NOwef7V/4aEIRt//36ksST5HF+hO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T/IcS6Y2Ih8Czf+yuApqnPxm6xpsnD9PeON9Qbx3FJt2KKxaf5Ayph7CGl1pNf1RH
	 5hzdwEoKs8aa5WCQg5yVfv2az/NXPdnpga6ynHz1U8Om0Br56FvhjHP76JzZaqJPbb
	 omV67QnARUCl0F33fTenWxWtF3MlHunZYfd8xZc8=
Date: Sun, 29 Jun 2025 18:27:27 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] tools/nolibc: move FD_* definitions to sys/select.h
Message-ID: <38b487e0-4d72-4a87-8fc4-c13b4fb35feb@t-8ch.de>
References: <20250629084628.GA7992@1wt.eu>
 <d8d9ab91-0617-468e-a82d-9f271c5e6a7f@t-8ch.de>
 <20250629092552.GA30947@1wt.eu>
 <029f24fa-3512-4736-94a0-e158c158cc8e@t-8ch.de>
 <20250629094048.GA26861@1wt.eu>
 <20250629151006.GA16826@1wt.eu>
 <e2513e72-5949-463d-a950-0778609141d7@t-8ch.de>
 <20250629160823.GA2302@1wt.eu>
 <2322d3a1-a5ff-40ec-ad7e-1580f85d95f4@t-8ch.de>
 <20250629161908.GB2302@1wt.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250629161908.GB2302@1wt.eu>

On 2025-06-29 18:19:08+0200, Willy Tarreau wrote:
> On Sun, Jun 29, 2025 at 06:14:01PM +0200, Thomas Weißschuh wrote:
> > On 2025-06-29 18:08:23+0200, Willy Tarreau wrote:
> > > On Sun, Jun 29, 2025 at 05:54:02PM +0200, Thomas Weißschuh wrote:
> > > > I saw the same issue, but only because of the changes to types.h.
> > > > And these should not be necessary in the first place.
> > > 
> > > You mean fd_set definition ? It's solely a matter of includes ordering
> > > in fact, since it depends on FD_SETSIZE.
> > 
> > No, I mean the '#include "sys/select.h"' in "types.h".
> 
> I had already dropped it as well.

Hm, then I'm not sure where it commes from.

> > That breaks the dependency order, as it pulls in all kinds of other
> > stuff into the beginning of "types.h" which themselves depend on
> > definitions of "types.h".
> 
> It was not just this. I'm pretty sure that what unbroke it for you is
> keeping fd_set in types.h.

But I *did* move fd_set to sys/select.h.

> > > > The below works nicely for me:
> > > 
> > > OK. Do you prefer that we take that one or just a stub ? I'm personally
> > > fine with both.
> > 
> > I prefer moving the code.
> 
> OK. Do you want me to merge your patch or will you take care of it ?

As you'll resubmit your series anyways, please pick up my proposal.
