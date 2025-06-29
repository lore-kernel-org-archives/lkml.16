Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56E91C862C
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 09:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751189830; cv=none; b=Ee8aXBJWxBgXtosgIu8OPo4A1uq0AzW98iV3749/okAh48TK0SlkwNSpD9k60PGgfpQGJPnAHfu8rgv0esP6x0bE8f8o0ygvt9GUsNT49U0DIyz+JRXL8HxOZWcvd+xpq3bLzW/VsVW+7OxP0ejgTMekPJuPHsZMwvWlMQ+kB6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751189830; c=relaxed/simple;
	bh=/Dj4K9dXzMHgU0EuTLBsT7aN6PMJ+tvKYG6ZSBuxETg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RhllE34KXgfzxF+3OGZLrIAiyob2GTJW/iWOiMX5jfX5J2g5mkhXQsLvwa3QNESlSmOj+opCrG9gpwAWvLWHAgJpLrOLCY/PtNtlQSJSlpYD8adLLfiplKwu44m8YfnrrDCivf8IsItZqC6cT+hAhDCWyJkoztPWN0iiUXJznYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=fuwLxIvX; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="fuwLxIvX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1751189827;
	bh=/Dj4K9dXzMHgU0EuTLBsT7aN6PMJ+tvKYG6ZSBuxETg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fuwLxIvXeICUZILRqqBvQbITVfhS+8MlqdAWRlt+im2HQIS5pK9KmiUXnucdokV58
	 8AcTamiL61KNjAaup85Q6alm9nLPR3Sjaqm9Ag2XX/tvVje1JMFR5pU2IEC/evJ8cZ
	 NrdiRTSBiOFlV4Emnr98Uy2XEfLxEk4omcECUVfs=
Date: Sun, 29 Jun 2025 11:37:06 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] tools/nolibc: move FD_* definitions to sys/select.h
Message-ID: <029f24fa-3512-4736-94a0-e158c158cc8e@t-8ch.de>
References: <20250620100251.9877-1-w@1wt.eu>
 <20250620100251.9877-4-w@1wt.eu>
 <25eb3144-d19e-43d2-af4f-b0251d28808c@t-8ch.de>
 <20250622071958.GA3384@1wt.eu>
 <07f5fdb4-2c5c-4723-b12a-abdb0c9f33b7@t-8ch.de>
 <20250623025618.GA29015@1wt.eu>
 <20250629084628.GA7992@1wt.eu>
 <d8d9ab91-0617-468e-a82d-9f271c5e6a7f@t-8ch.de>
 <20250629092552.GA30947@1wt.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250629092552.GA30947@1wt.eu>

On 2025-06-29 11:25:52+0200, Willy Tarreau wrote:
> On Sun, Jun 29, 2025 at 10:53:34AM +0200, Thomas Weißschuh wrote:
> > On 2025-06-29 10:46:28+0200, Willy Tarreau wrote:
> > > On Mon, Jun 23, 2025 at 04:56:18AM +0200, Willy Tarreau wrote:

<snip>

> > > Trying it has reopened the circular dependencies can of worms :-(
> > > It's the same problem as usual that we've worked around till now
> > > by placing some types in types.h, except that this time fd_set is
> > > defined based on the macros FD_* that I moved to sys/select.h.
> > 
> > Can't fd_set also move to sys/select.h? This is how I read fd_set(3).
> 
> That was what I did and precisely what was causing the problem. We
> have sys.h defining select() with fd_set in it with sys/select not yet
> being included. I moved sys.h after all sys/* and it broke something
> else instead.

Ah. Then move select() also into sys/select.h; where it belongs. :-)

<snip>
