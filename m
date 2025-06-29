Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B8112E7E
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 16:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751213954; cv=none; b=DQWD1WVlnlnsVavMY6Htlo8vgrmeUhMA+9yZAFF7c1yrWLiyFDXBZD/dA3647OK07d/O5uUqmVmnRDI+sPDlm1mfMtotX47b204u6qOcUB7GBMDGrqux+s/NtFTGWRACV/AxnDiLa+Ppk+Ige+UUJ+mpA9nHRxodoM1LwUGbr3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751213954; c=relaxed/simple;
	bh=E11GX/Df3KMiSvnTHk23nP/Q7iQzuNxG3GyGJQVF2As=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qof/4PaBqmt3uF/Gbyhxw2uFWSSzQM3lOOACGuoTXBZ3MmqblHjNeilX1gVe1Ey8NIDj35JUr7ZjK0DDmzpoKw3K9pKi+LP3fnPKYJrP0oeqIhqaMQIekYcoX41kDgQVvze/4s25kW5jog5+nxVF22L3Mdx7iv74/FilfJjVky8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 55TGJ87l002648;
	Sun, 29 Jun 2025 18:19:08 +0200
Date: Sun, 29 Jun 2025 18:19:08 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] tools/nolibc: move FD_* definitions to sys/select.h
Message-ID: <20250629161908.GB2302@1wt.eu>
References: <20250623025618.GA29015@1wt.eu>
 <20250629084628.GA7992@1wt.eu>
 <d8d9ab91-0617-468e-a82d-9f271c5e6a7f@t-8ch.de>
 <20250629092552.GA30947@1wt.eu>
 <029f24fa-3512-4736-94a0-e158c158cc8e@t-8ch.de>
 <20250629094048.GA26861@1wt.eu>
 <20250629151006.GA16826@1wt.eu>
 <e2513e72-5949-463d-a950-0778609141d7@t-8ch.de>
 <20250629160823.GA2302@1wt.eu>
 <2322d3a1-a5ff-40ec-ad7e-1580f85d95f4@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2322d3a1-a5ff-40ec-ad7e-1580f85d95f4@t-8ch.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sun, Jun 29, 2025 at 06:14:01PM +0200, Thomas Weißschuh wrote:
> On 2025-06-29 18:08:23+0200, Willy Tarreau wrote:
> > On Sun, Jun 29, 2025 at 05:54:02PM +0200, Thomas Weißschuh wrote:
> > > I saw the same issue, but only because of the changes to types.h.
> > > And these should not be necessary in the first place.
> > 
> > You mean fd_set definition ? It's solely a matter of includes ordering
> > in fact, since it depends on FD_SETSIZE.
> 
> No, I mean the '#include "sys/select.h"' in "types.h".

I had already dropped it as well.

> That breaks the dependency order, as it pulls in all kinds of other
> stuff into the beginning of "types.h" which themselves depend on
> definitions of "types.h".

It was not just this. I'm pretty sure that what unbroke it for you is
keeping fd_set in types.h.

> > > The below works nicely for me:
> > 
> > OK. Do you prefer that we take that one or just a stub ? I'm personally
> > fine with both.
> 
> I prefer moving the code.

OK. Do you want me to merge your patch or will you take care of it ?

Thanks,
Willy
