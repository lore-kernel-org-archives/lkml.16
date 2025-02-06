Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60182288D9
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 09:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738835967; cv=none; b=rpEXudfBWbDb+9SuRkGdmIb1Rr7T0oaCUQNrgJx1o/enO6MgNJtog/t4a7yjd0dGEHT631Uo39KTW/MaNEu6sjQzKZTXfNBvLoxvcgK9cvg4ThzR/4x7ZXtr01xu2qtJTWpkn9YgaVu+EWedrvl1UAIXD81/sjTPNLbe9GdWphs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738835967; c=relaxed/simple;
	bh=RDDBDw9JeYu1xIOg/YNrPFFO4SeHaUppMThbt4gDaqw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NVKHsch2tH/ODKGIXYYWwQj4e1f/kdaI5LAnG10UTKiFHeUAVWOn9J5Q0iAPXmjnXM+qlpCVPyCg2GT5KkUyzCMXgJht/oLsoB0EQN+RFtWpVe/7/i3g/Tr7u1PLntfE+2W169L953AXoJHbko4yKhSZRoSxgRQuz88qON/VX+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bgJWav13; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bgJWav13"
Received: from isaac-ThinkPad-T16-Gen-2.lan (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 26CA7520;
	Thu,  6 Feb 2025 10:58:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738835885;
	bh=RDDBDw9JeYu1xIOg/YNrPFFO4SeHaUppMThbt4gDaqw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=bgJWav13Kquw9dLhBDPFY05zQUMxsKWH/brjootmv6BYq0U2aCSX2aY8FGewt1Bee
	 2w/ZDMkpfZZZ6ti6imP5qCUvneOQAnWz0BEOIpKh0SxN1a0re8AKq4VPBdoaijenC0
	 pWSuW8P1ciuKIwwx5wYcz0UWbxvT0Jf6Jfi5gLHM=
Message-ID: <f66366da01ae84313f79b5990d9a906bf7a5eb1e.camel@ideasonboard.com>
Subject: Re: [PATCH v2 1/3] regulator: ad5398: change enable bit name to
 improve readibility
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: michael.hennerich@analog.com, lgirdwood@gmail.com, broonie@kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 06 Feb 2025 09:59:13 +0000
In-Reply-To: <bf646a72-1695-4305-be7e-a64ce9d32523@roeck-us.net>
References: <20250128173143.959600-1-isaac.scott@ideasonboard.com>
	 <20250128173143.959600-2-isaac.scott@ideasonboard.com>
	 <bf646a72-1695-4305-be7e-a64ce9d32523@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Guenter,

On Wed, 2025-02-05 at 10:45 -0800, Guenter Roeck wrote:
> On Tue, Jan 28, 2025 at 05:31:41PM +0000, Isaac Scott wrote:
> > The mask name AD5398_CURRENT_EN_MASK is misleading, as it implies
> > that
> > setting bit 16 of the AD5398 enables current flow. In fact, setting
> > this
> > bit prevents current flow, due to this bit being a software power
> > down
> > control. This bit is referred to as "soft power down" in the
> > datasheet.
> > As such, change the name of the bit and modify its use in the
> > driver to
> > make the regulator more intuitively usable.
> >=20
> > (When calling ad5398_enable, current will start flowing, and vice
> > versa).
> >=20
> > Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> > ---
> [ ... ]
> > =C2=A0
> > -#define AD5398_CURRENT_EN_MASK	0x8000
> > +#define AD5398_SW_POWER_DOWN	BIT(16)
>=20
> 0x8000 is BIT(15).

You're totally right! The reason this got through is because in my use
case, I am powering the regulator on and off in multiple ways. This
should definitely be BIT(15), so I will send a V3 shortly.

Thank you very much!

Best wishes,

Isaac

>=20
> Guenter

