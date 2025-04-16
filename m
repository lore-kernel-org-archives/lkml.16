Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27241F418B;
	Wed, 16 Apr 2025 16:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744820772; cv=none; b=pI5vtRsie3KU5/V3sq7qnsw8JHQW1kKwxRu/2KfYF1OHrfnbC64p9MuhyctZVvp3Tk+aUIsfPcypXxxWWu+QAOA/5IFgL4y7aQWTbmyjxSP5cpvp9iMHDPwRGFH7XTrXX/l5Ha7HlC7PG7xPhpNw1ahOfwgQ+nsBSn5Leon5luA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744820772; c=relaxed/simple;
	bh=oIk5RB2Z7VODW71DCnyv/1I2G8sqUu3r8RnvySXZ2Qo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gep0ewI/5BFb9GWjJwI/JxTp34wxF/pryBPeO+C6veHMMVZ3YuWM+UMNl7TU7wuR6YbEwNLpYeGS33GRrYxkYGrIZxWHkfB2IUZphHJ26kpMEBJ4eybEZH1JridqIg3x0fszaCHZjen0OsQRLGDC12cbXo5EQtcw9JDUEa3Gx8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=uVkYkYng; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="uVkYkYng"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4Zd5xN6PCQz9skp;
	Wed, 16 Apr 2025 18:26:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1744820760; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Daumu/GKB63UxCCk17/VedpOd+PiGaKu/v1uLufAehk=;
	b=uVkYkYngJx/tXivKPfhecZqFy1cisWZu6g9GQRE3/sKk5/23S4MynAGdPf4XpoqsVqYjsv
	+MriMlPQMeqND32HHTdMrLPDkiyE/9luMTXCqwpYQ/L1P6fbFD+TR73lFijlFAnIHjpqRV
	VeWYZy4OzXkf77YQ/kDQllC09nnfYPKqo5rD9BEBEzpH5ZNZ84blduMYP2G0XNe/b5ZT2s
	cQ3Kzhdmf/F20xBnQKGw6YjWrcQ4fGJ0A+cZ1U+fwIw2xF0ShqHDY1iKQ8d9wWMwPDDh4B
	cAPO4xJgqu3V2oPnGzD58GBI34e7wk02qwU2UknxYeKn0m1NnB9XEdv3yVCgBA==
Message-ID: <d035a74a2c6d53721df8d68fd75f439feb8da4a7.camel@mailbox.org>
Subject: Re: [PATCH 02/31] ASoC: intel/avs: Use pure devres PCI
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Philipp Stanner
	 <phasta@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>, Krzysztof
 =?UTF-8?Q?Wilczy=C5=84ski?=
	 <kwilczynski@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Jaya
 Kumar <jayakumar.alsa@gmail.com>, Clemens Ladisch <clemens@ladisch.de>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Liam Girdwood
 <liam.r.girdwood@linux.intel.com>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,  Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>, Mark Brown <broonie@kernel.org>, Daniel
 Baluta <daniel.baluta@nxp.com>,  Colin Ian King <colin.i.king@gmail.com>,
 David Rhodes <drhodes@opensource.cirrus.com>, liujing
 <liujing@cmss.chinamobile.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Andres Urian Florez <andres.emb.sys@gmail.com>, Oswald Buddenhagen
 <oswald.buddenhagen@gmx.de>, Thorsten Blum <thorsten.blum@linux.dev>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 Amadeusz =?UTF-8?Q?S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Charles Keepax
 <ckeepax@opensource.cirrus.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
Date: Wed, 16 Apr 2025 18:25:52 +0200
In-Reply-To: <Z__PINxPVW5QrpgH@smile.fi.intel.com>
References: <20250416131241.107903-1-phasta@kernel.org>
	 <20250416131241.107903-3-phasta@kernel.org>
	 <Z__PINxPVW5QrpgH@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 576a6f1260635a5ab7d
X-MBO-RS-META: a9oh6gij3kdzcsuoa8utnddcwngjne4d

+Cc Bjorn, Krzysztof

On Wed, 2025-04-16 at 18:39 +0300, Andy Shevchenko wrote:
> On Wed, Apr 16, 2025 at 03:12:12PM +0200, Philipp Stanner wrote:
> > pci_request_regions() is a hybrid function which becomes managed if
> > pcim_enable_device() was called before. This hybrid nature is
> > deprecated
> > and should not be used anymore.
> >=20
> > Replace pci_request_regions() with the always-managed function
> > pcim_request_all_regions().
> >=20
> > Remove the goto jump to pci_release_regions(), since pcim_
> > functions
> > clean up automatically.
>=20
> ...
>=20
> > =C2=A0	bus->remap_addr =3D pci_ioremap_bar(pci, 0);
> > =C2=A0	if (!bus->remap_addr) {
> > =C2=A0		dev_err(bus->dev, "ioremap error\n");
> > -		ret =3D -ENXIO;
> > -		goto err_remap_bar0;
> > +		return -ENXIO;
>=20
> Here and everywhere else these can now be converted to
> dev_err_probe().
> Are you planning to do so?

I want to do what's necessary to get PCI in better shape, since that's
what the GPUs and accelerators we / I care about use :)

IOW, I want pci_request_regions() removed from here.

>=20
> ...
>=20
> > =C2=A0err_remap_bar4:
> > =C2=A0	iounmap(bus->remap_addr);
>=20
> This looks weird if the driver already is using pcim_enable_device().
> Doesn't this look to you as an existing bug?

I looked briefly at it and it doesn't appear like an obvious bug to me
because the drivers uses the (very old? deprecated?) pci_ioremap_bar().

In any case the driver doesn't set up any devres callback, so has to
iounmap() manually.

@Bjorn:
Any comments on pci_ioremap_bar()? Should we mark that as deprecated?

P.

>=20
> > -err_remap_bar0:
> > -	pci_release_regions(pci);
> > =C2=A0	return ret;
>=20

