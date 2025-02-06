Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E271EA7C6
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 13:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738850241; cv=none; b=n3Q1Dsy44+v56U5CS5B5PON7edEYJGxhvsSBQaQrTWGYxxSlX4IWy3GMZnndCxdMQkSRWy8Ds0Mm3w/31IJ1fP9AB7PzFJFC7ACl5csV/D/jW1W0DfgugQSDskVbK2D/jSlX+KBzwybEhKZp4GF7DK0gmjuK+DFwx2x0TOJKkUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738850241; c=relaxed/simple;
	bh=mFHSD2vGfJxtr3fViMxBugMLC8RZXESZd8BRYMPyvWo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aBs96WW5CofV+U9D4GAGN+yd7Mgd6xfziV+t9V0hmTiN18xfPCFl9ArNCmXmY6+BDNt+b2EIsaKy8DeuaDF5SUNwa2gtbb1N9rGIcAXImHGe9L7uVr9dmpx4/hJgy37vaTP7NojvI36nS1oNsgTmHbPIACVqDxIMiv692xnlHNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MGh1P7Yb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MGh1P7Yb"
Received: from isaac-ThinkPad-T16-Gen-2.lan (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 051261198;
	Thu,  6 Feb 2025 14:56:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738850164;
	bh=mFHSD2vGfJxtr3fViMxBugMLC8RZXESZd8BRYMPyvWo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=MGh1P7YbWc+InDmt8Sz0zMb3Jf100Sz4mzvttDsk0UyXL33Un2745Ekx0HVFnzFTF
	 r2Y3V2JcBZrMEmSrlX+W04v5qXVaODDCUX9qDkZDTX4dMEi0NJj2YE5SO+Vga7vkXI
	 tP5uFlEcyFNfOOOoZvIlbHgT4eWMfX+PnxiD1Gec=
Message-ID: <1da6b6e3f9cd1abd84cc5d3d73a2ad3d1340914d.camel@ideasonboard.com>
Subject: Re: [PATCH 1/1] regulator: ad5398: Correct the SW_POWER_DOWN bit
 number
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: Mark Brown <broonie@kernel.org>
Cc: michael.hennerich@analog.com, lgirdwood@gmail.com, 
	linux-kernel@vger.kernel.org, dheeraj.linuxdev@gmail.com
Date: Thu, 06 Feb 2025 13:57:14 +0000
In-Reply-To: <28767ef9-0909-4d74-99fa-514c9bc99afc@sirena.org.uk>
References: <20250206122459.197985-1-isaac.scott@ideasonboard.com>
	 <20250206122459.197985-2-isaac.scott@ideasonboard.com>
	 <c29affda-e769-4658-bb74-3b8c273e8262@sirena.org.uk>
	 <2a0f24c61de73f7bd2bb495d697dcedd8462f4c0.camel@ideasonboard.com>
	 <f81d5101-1dd2-4ff4-9a23-403b6efbcdf3@sirena.org.uk>
	 <1afa0cd19e48014f3a59bfeaae58f85c9db92c1d.camel@ideasonboard.com>
	 <28767ef9-0909-4d74-99fa-514c9bc99afc@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-02-06 at 13:44 +0000, Mark Brown wrote:
> On Thu, Feb 06, 2025 at 01:28:15PM +0000, Isaac Scott wrote:
> > On Thu, 2025-02-06 at 12:58 +0000, Mark Brown wrote:
>=20
> > > You didn't include a Fixes tag or otherwise mention that this was
> > > a
> > > fix
> > > for a recent change so I was applying this as a fix for Linus'
> > > tree.
>=20
> > To be clear, would you like me to resend the patch with the fixes
> > tag?
>=20
> Yes, like the message said please resend.=C2=A0 Though isn't this the sam=
e
> as
> the fix that Dheeraj already sent:
>=20

Yes, we have both fixed the same thing! Although I wasn't CC'd so I
didn't know they fixed my patch.

Best wishes,
Isaac
> =C2=A0=C2=A0
> https://lore.kernel.org/r/20250206103153.59114-1-dheeraj.linuxdev@gmail.c=
om

