Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9E91EA7C2
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 13:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738848502; cv=none; b=Z6XN34uGr/ib4g6tMsNucjHijlX0eedvhXRjNsQ75+i4yZ1lzdlEb/u/N6HKm6sStC7yFoXNTyIClydRIexKj6kgz383RIipR81FtxTgBbrTuuPN4PL+vCMLaaVaRuCicmeWFsoUnyaHEu2v8zX55UWIuqtFRRje5jN8yzvcTZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738848502; c=relaxed/simple;
	bh=jtUws1HcsG+tW4zSQi/KnyvtZdjF3+86pf/eKGaLF2M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=msWhlnhjDTHKj9rFcIsM0UMTY9ZMzEf3r8IZ2xMEunhyhSy25vux2k1n8nvsvtrkQOnH57o+BJoYSOocku2oM/izCBKOrPyNpTBVUSvAhV1TBNwDYkRQqloSzCVuoyIQ0/f5R911vZdueOFl7YI3y3KnLutDHhOiGP6ZuthlNak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=C6Dg6Mhk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="C6Dg6Mhk"
Received: from isaac-ThinkPad-T16-Gen-2.lan (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EBCD81198;
	Thu,  6 Feb 2025 14:27:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738848425;
	bh=jtUws1HcsG+tW4zSQi/KnyvtZdjF3+86pf/eKGaLF2M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=C6Dg6MhkzQVjnz651f3rHQgTViYk5e88QQNdd0ltKcXFAHenRtzZtZamcY/YJB2Lr
	 DXAv7Axaumtq+KWsZvitMmzQqCPcowjdYlwKwpswAGoObcp6oXgujqQtZE4jjp9TT7
	 RyxUr0tOfZ898ijvLy64HLaP14tEZLKpBKFyusqQ=
Message-ID: <1afa0cd19e48014f3a59bfeaae58f85c9db92c1d.camel@ideasonboard.com>
Subject: Re: [PATCH 1/1] regulator: ad5398: Correct the SW_POWER_DOWN bit
 number
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: Mark Brown <broonie@kernel.org>
Cc: michael.hennerich@analog.com, lgirdwood@gmail.com, 
	linux-kernel@vger.kernel.org
Date: Thu, 06 Feb 2025 13:28:15 +0000
In-Reply-To: <f81d5101-1dd2-4ff4-9a23-403b6efbcdf3@sirena.org.uk>
References: <20250206122459.197985-1-isaac.scott@ideasonboard.com>
	 <20250206122459.197985-2-isaac.scott@ideasonboard.com>
	 <c29affda-e769-4658-bb74-3b8c273e8262@sirena.org.uk>
	 <2a0f24c61de73f7bd2bb495d697dcedd8462f4c0.camel@ideasonboard.com>
	 <f81d5101-1dd2-4ff4-9a23-403b6efbcdf3@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Mark,

On Thu, 2025-02-06 at 12:58 +0000, Mark Brown wrote:
> On Thu, Feb 06, 2025 at 12:45:28PM +0000, Isaac Scott wrote:
> > On Thu, 2025-02-06 at 12:28 +0000, Mark Brown wrote:
>=20
> > > This doesn't apply against current code, please check and resend.
>=20
> > I have checked, and it applies on top of linux-next next-20250206,
> > which includes my previous patch you have already applied:
>=20
> > [1/3] regulator: ad5398: change enable bit name to improve
> > readibility
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 commit: 19d022d67d7353f0e6e9ba255435d3de=
93862ac4
> > [3/3] regulator: ad5398: Add device tree support
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 commit: 5a6a461079decea452fdcae955bccecf=
92e07e97
>=20
> > Have I applied it to the wrong branch?
>=20
> You didn't include a Fixes tag or otherwise mention that this was a
> fix
> for a recent change so I was applying this as a fix for Linus' tree.

To be clear, would you like me to resend the patch with the fixes tag?

Best wishes,

Isaac

