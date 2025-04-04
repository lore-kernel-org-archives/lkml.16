Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064D31B423D;
	Fri,  4 Apr 2025 13:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743774588; cv=none; b=Et/xD3S/B6v2sYLKjd104vcnoxta7dPDTK1nFsXQnMTPUIKopAXfRnzaORbvfiGI+SaZ4aFk85o6n3jV3Fzyo7xsAxvBBJvhDxVTEo1eMc0touxhWz+iRZfic6xWSCBvEIeiCnBOdr3vwSAl+m/qpezL044ErKBhhe3jOj9XFgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743774588; c=relaxed/simple;
	bh=/dptjStSDMMJMudHNbgUWzi4jLWy8qr/uVmDB7rU88A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kta4QUuGVHNi9upHGLkyZ5x9RYkapOrqrCEogLOxpXQsWo1ZZz311UGPulzYXIDzwKy6aLKsVf2gDoVRIn9L112cGqyeiZ7zJtgIpaQmNx6sJCeTVqNamT/caXdqR1FLSfLXb7Gaa0xPpLeLgod+5Kg0gzblkr7l6Nz+fW8jD3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=RhF4dXXX; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="RhF4dXXX"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ZTg2Z0N5lz9t2j;
	Fri,  4 Apr 2025 15:49:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1743774582; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/dptjStSDMMJMudHNbgUWzi4jLWy8qr/uVmDB7rU88A=;
	b=RhF4dXXXAixla5UfN0PU+Crs4lP64BchwhmSeF00bXDPDh/L0RA5l+ybI9YZxuOc9pGe+t
	rV8zVnTFz9cxa5DwsvLrMfcmM5tblaiLoEiguv+fGCD72outaDF/MgJZKxT/pucxRt0EUS
	hZe7DawkDCVKZqZgDoMudfrjInBJQvOdM2KKt7UvPscuQk5WLfNgYsPTkpwLGMTcWNSlfX
	nAkD3ePdNmdClkMleflvtYvHc3CywVhwCxY89Uv/0oLsBg7CUfpIQp6hzmfdZC5MdlfdAT
	i4Vn+TpDjWAc0M5QXYWCdfSezvP/yL9ozY28dJEfF10WTyRRAGGkWN6MqXKPZA==
Message-ID: <01627e70902d331f7a9e8c08bd5c78dc6991ea74.camel@mailbox.org>
Subject: Re: [PATCH 00/11] sound: Replace deprecated PCI functions
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Takashi Iwai <tiwai@suse.de>, Philipp Stanner <phasta@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Clemens
 Ladisch <clemens@ladisch.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>,  Thorsten Blum <thorsten.blum@linux.dev>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Maxim Mikityanskiy <maxtram95@gmail.com>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>,  He Lugang <helugang@uniontech.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Binbin Zhou <zhoubinbin@loongson.cn>,
 Tang Bin <tangbin@cmss.chinamobile.com>,  linux-parisc@vger.kernel.org,
 linux-sound@vger.kernel.org,  linux-kernel@vger.kernel.org
Date: Fri, 04 Apr 2025 15:49:36 +0200
In-Reply-To: <87plhs2g4h.wl-tiwai@suse.de>
References: <20250404121911.85277-2-phasta@kernel.org>
	 <87plhs2g4h.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: aymtz56nufw1qgqjcbqq8zxezp1rjtxk
X-MBO-RS-ID: 820365da6c78a0c542e

On Fri, 2025-04-04 at 15:47 +0200, Takashi Iwai wrote:
> On Fri, 04 Apr 2025 14:19:01 +0200,
> Philipp Stanner wrote:
> >=20
> > pcim_iomap_table() and pcim_iomap_regions() have been deprecated by
> > the
> > PCI subsystem. In sound/, they can easily be replaced with
> > pcim_iomap_region().
> >=20
> > This series was around some time in late summer last year as a
> > single
> > patch. I lost track of it for a while, but Takashi Iwai (AFAIR)
> > requested that I split it by component.
> >=20
> > So that's being done here. Feel free to squash the patches as you
> > like.
>=20
> Thanks for the patches.=C2=A0 I suppose those are no urgent fixes, and ca=
n
> be postponed for 6.16?=C2=A0 If so, I'll pick them up after 6.15-rc1 merg=
e
> window is closed.

Sure, those are just improvements that aren't urgent.

Thx,
P.

>=20
>=20
> Takashi

