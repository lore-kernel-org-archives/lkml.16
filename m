Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1110190664;
	Sun, 22 Jun 2025 07:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750575978; cv=none; b=nstXrFvpAxQR0JGI7pKdASv720bH+yeCJ8pAmDOnnmICLMwheGvDR7XTWxB3T7J5ngqCea5lIO++PffRsLtHPm8zQCU4634rpRJjqjQ1PaOcK15U8Kteo8JpTo2gzZyywkYHB73w9OEONiS4FvkvYIdVrjJknibiGgpy5+OgkC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750575978; c=relaxed/simple;
	bh=/mEaZiDkxvA8xQBci38dTdbpic64eWVtIEiUzlkw6/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X2jFIGl2Ko3N2aG3DUCEDgIln67BjMlGBf/NkXt+/ab1h4yQChoHmn0vpE+x2cPNOxsJ3lJxiNubU6SETQdpwzLKu1I0sP4d1wnXj1VXZ4RcUVeYhNX5oauVfLh42rMZrtnQkWA3FbYzksVOXd63VJrEPxu5Q038IokVyHEyGow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=TrolYCgw; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="TrolYCgw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FFgB7yVhkCYbVKaio78A+NxHIGQiBK91qOypmJFDfks=; b=TrolYCgwmXOnXzlbG1JWPr8g+k
	/Qc1sREx/pcPmO0F2Kko5AdXedX9rBRHBCidIGNnsA2Ws6N1vBCP3YcbQ9NX8C6Sg5y/IaO9uU+dC
	1tb9OxeJXF8h/vNyqCl4PXX5sTyl4jS9tNggAu9Zjzo3L9EwThtMkAF2TO7LYc+5lZ5eDMNP6YkRX
	WjL2cdp+Rf5b/1QD5o9m1MXAZGnUXRG2r0uzgBAwx0+heeMmOjS9RnyefDfWrFpxNCLE0dugrnu4m
	Uc0iapqmVhU4x8RwxxuMASG7w/R48Z9LgoxDPGY9+9YrHuMm7fXoT/CHaannPdHVFwcubtzSczAeQ
	H6PYFSvw==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <carnil@debian.org>)
	id 1uTEmA-000WTb-61; Sun, 22 Jun 2025 07:06:02 +0000
Received: by eldamar.lan (Postfix, from userid 1000)
	id 8329FBE2DE0; Sun, 22 Jun 2025 09:06:01 +0200 (CEST)
Date: Sun, 22 Jun 2025 09:06:01 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Christian Brauner <brauner@kernel.org>,
	Luca Boccassi <luca.boccassi@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation/sysctl: coredump: add %F for pidfd number
Message-ID: <aFerWSlrlRYMkB2h@eldamar.lan>
References: <20250612060204.1159734-1-carnil@debian.org>
 <87y0tkc0gx.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y0tkc0gx.fsf@trenco.lwn.net>
X-Debian-User: carnil

Hi Jonathan,

On Sat, Jun 21, 2025 at 02:18:38PM -0600, Jonathan Corbet wrote:
> Salvatore Bonaccorso <carnil@debian.org> writes:
> 
> > In commit b5325b2a270f ("coredump: hand a pidfd to the usermode coredump
> > helper") a new core_pattern specifier, %F, was added to provide a pidfs
> > to the usermode helper process referring to the crashed process.
> >
> > Update the documentation to include the new core_pattern specifier.
> >
> > Link: https://github.com/systemd/systemd/pull/37125
> > Link: https://lwn.net/Articles/1024160/
> > Signed-off-by: Salvatore Bonaccorso <carnil@debian.org>
> > ---
> >  Documentation/admin-guide/sysctl/kernel.rst | 1 +
> >  1 file changed, 1 insertion(+)
> 
> Applied, thanks.

Thank you!

> > FWIW, I was not sure if I should add a 'Fixes: b5325b2a270f
> > ("coredump: hand a pidfd to the usermode coredump helper") to make
> > sure that it get backported as well to the series where a backport of
> > b5325b2a270f landed.
> 
> A Fixes tag is not sufficient to ensure that a patch is backported to
> previous kernels - you must CC stable@vger.kernel.org to be sure.  In
> this case, it's a documentation tweak for a 6.16 change, so I don't
> think there is a lot of urgency here.

Ack (apart the change did land in variou stable series, i.e.
b5325b2a270f ("coredump: hand a pidfd to the usermode coredump
helper") did land in 6.16-rc1 *and* the stable versions v6.15.1,
v6.14.10, v6.12.32, v6.6.93, v6.1.141, v5.15.185, v5.10.238 and
v5.4.294.

You are right it is not urgent, would be more to have documentation
consistent as well in those versions.

Regards,
Salvatore
