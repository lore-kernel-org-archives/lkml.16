Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D634522DF9B;
	Thu, 24 Apr 2025 11:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745494434; cv=none; b=lsIzp0LXN2wxKVmEaTaQyU8W3dLZV9qn/8u534L1m12Q3QZNIUEwOyRHVcKC+03GR1lW7SrVRVocABaswb5F6dxKvNdN2uWrI0SLV/xcCJV87bKuvP0wiSIDdTgYXIh4nVOqAZuBpFygpyWvbbX9C9kIfvmgGbjAT6Puz/r7NuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745494434; c=relaxed/simple;
	bh=V6GHoM+Hg9b0NR0ndNd7C2EGSHQD9YLjrj/4HlocGLY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NSAZeQ2uln+8TTWRyAUIHAyZXgN2RUdYOcxVCEsMhZ+H+v71GJ00okynoujUziAHNcVZAJVUgJoX4SIFSith+vAw0urRPmeIgfF+Hb8zeZz9GPMTBZcOYb0mEB3Vo/l6mxs2hYtSWkDmw0NYDnLT0czbCz2sn+7n2RA+iqPI650=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=wf/0iuac; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="wf/0iuac"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Zjv4Y0zgBz9sQ7;
	Thu, 24 Apr 2025 13:33:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1745494429; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VvmYiqO9VGDW4sHmKipaGsuLZDGBQXLdUdLsW2eNGXs=;
	b=wf/0iuacaCy/4Q7GPIehBvUDBkcHLLoLAIHbDLJgByNhz1Da4dQ5kM9mRLdmkLDlhL8QQZ
	d4T2E9BrtdCgQVJBwEGGwFS3CJ3E3PrxSCNr6UWa8jSVe2kuwZkinA85DhnxLuPas/NtpX
	y+BxxylQxI4tfOFYcwBJdysZ0dX5w/wBVuLNtYh+LP9uFgKAewekfYjGhecBsOqi82PJzf
	AA/acyyLnHA2ooJDkgWggnc9030ldSs/Dx3gz/hahvIJE1BSpxa8xAnMvYlfFaJXlixWeA
	3IzSRNz9JuR+lzYSatXie3FTzLOOIiJVvJbqFdn/s9VL7Fw5lUXRtaqmKV6AAA==
Message-ID: <4afd7908d687e51405bfe9fd4fcb3cd9b3631775.camel@mailbox.org>
Subject: Re: [PATCH v2 2/4] ASoC: intel/avs: Use pure devres PCI
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Amadeusz =?UTF-8?Q?S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Philipp Stanner <phasta@kernel.org>,
  Cezary Rojewski <cezary.rojewski@intel.com>, Liam Girdwood
 <liam.r.girdwood@linux.intel.com>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>,  Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>, Mark Brown <broonie@kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Daniel Baluta
 <daniel.baluta@nxp.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Damien Le Moal <dlemoal@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sound-open-firmware@alsa-project.org
Date: Thu, 24 Apr 2025 13:33:41 +0200
In-Reply-To: <ebf0ccd0-9429-43b6-b56b-73feeb856593@linux.intel.com>
References: <20250423082858.49780-2-phasta@kernel.org>
	 <20250423082858.49780-4-phasta@kernel.org>
	 <ebf0ccd0-9429-43b6-b56b-73feeb856593@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: fb6bd41d72a09f6eadb
X-MBO-RS-META: kosr7ru5pbbkztmwa149qwtdq5tnmgj7

On Thu, 2025-04-24 at 12:21 +0200, Amadeusz S=C5=82awi=C5=84ski wrote:
>=20
>=20
> On 2025-04-23 10:28, Philipp Stanner wrote:
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
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > =C2=A0 sound/soc/intel/avs/core.c | 7 ++-----
> > =C2=A0 1 file changed, 2 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/sound/soc/intel/avs/core.c
> > b/sound/soc/intel/avs/core.c
> > index 8fbf33e30dfc..dafe46973146 100644
> > --- a/sound/soc/intel/avs/core.c
> > +++ b/sound/soc/intel/avs/core.c
> > @@ -445,7 +445,7 @@ static int avs_pci_probe(struct pci_dev *pci,
> > const struct pci_device_id *id)
> > =C2=A0=C2=A0		return ret;
> > =C2=A0=C2=A0	}
> > =C2=A0=20
> > -	ret =3D pci_request_regions(pci, "AVS HDAudio");
> > +	ret =3D pcim_request_all_regions(pci, "AVS HDAudio");
> > =C2=A0=C2=A0	if (ret < 0)
> > =C2=A0=C2=A0		return ret;
> > =C2=A0=20
> > @@ -454,8 +454,7 @@ static int avs_pci_probe(struct pci_dev *pci,
> > const struct pci_device_id *id)
> > =C2=A0=C2=A0	bus->remap_addr =3D pci_ioremap_bar(pci, 0);
> > =C2=A0=C2=A0	if (!bus->remap_addr) {
> > =C2=A0=C2=A0		dev_err(bus->dev, "ioremap error\n");
> > -		ret =3D -ENXIO;
> > -		goto err_remap_bar0;
> > +		return -ENXIO;
> > =C2=A0=C2=A0	}
> > =C2=A0=20
> > =C2=A0=C2=A0	adev->dsp_ba =3D pci_ioremap_bar(pci, 4);
> > @@ -512,8 +511,6 @@ static int avs_pci_probe(struct pci_dev *pci,
> > const struct pci_device_id *id)
> > =C2=A0=C2=A0	iounmap(adev->dsp_ba);
> > =C2=A0 err_remap_bar4:
> > =C2=A0=C2=A0	iounmap(bus->remap_addr);
> > -err_remap_bar0:
> > -	pci_release_regions(pci);
>=20
> Hm... shouldn't we also drop call to pci_release_regions() in=20
> avs_pci_remove()?

Oh, yes, we should!

And in soc/sof/sof-pci-dev.c it slipped me too.

Will reiterate.

Thx
P.

>=20
> > =C2=A0=C2=A0	return ret;
> > =C2=A0 }
> > =C2=A0=20
>=20
> Nitpick: If there will be v2, can you also align title with how it=20
> usually is in this directory:
> ASoC: Intel: avs: Use pure devres PCI
>=20

