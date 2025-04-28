Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A105F266B67;
	Mon, 28 Apr 2025 13:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745846928; cv=none; b=i2pYEkaFA8QdOHUca6zq2VCOFsqq6EUmFtXxLaE29LtqOHZAuZX6TRPJpxuBU0ZDp+nazpS0TmBAIdXq9qysysmmXV7YKagc7kaKmMgpU3cg12XDbEvOZIQHNL2n3MhtUltBc6qSbtrjLk1qtH91NMFIqzmztf64pXKDTzwe6ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745846928; c=relaxed/simple;
	bh=7ME4el9W1EryrG+ff6X+K6a1q5k92r1S8gNYARZtph8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g2sqNE29FuEqqFoXzND+MDCTxWCdHvP/Q7ltmRzfLqdUVEbnL9FqtI0WGKbbQnqPTzfMNoYCP6p969nwB6P6vEF1EFxjc+ki3qC8EN5pZIHAGFS+9lCkuVjGsakb5qFYtrjseRvXFd9HYKjBRye7pyQ6SJQWV2DP7NqqUfhzfYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=X5weSPrx; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="X5weSPrx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745846924;
	bh=7ME4el9W1EryrG+ff6X+K6a1q5k92r1S8gNYARZtph8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=X5weSPrx2BaUXCD/qFq0fbGpZDLwypIgAaFEE8y3S/XpnvzJBHSswH8X3Es98GLV1
	 WYbHhfmG/y4oYifKVf3/I49Zcj6JcQYQ4+IyOaloYQVAnYvTTeOiWO/XGOehlrB4Zg
	 vVxnT8gfdR9ChumHoEKlw4zEyHbDrGqiYD1i41p7NH2npqejQkepMgKseHdMLFdjN8
	 2NOR12wXflrORWbY7BithdfdIhfbxO1exnlFYINmw1+D20gi6l9BsC4MKu6HhYvTK9
	 8TURjNcGpjmCFEzDHZNuquqN1iLRSchy4U6efjfm5TxpcY+ldyiC1RlAAsB2f0CHOF
	 X8fSe+ENH+KKQ==
Received: from apertis-1.home (2a01cb0892f2d600c8F85cF092d4Af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D8F1817E0657;
	Mon, 28 Apr 2025 15:28:43 +0200 (CEST)
Message-ID: <3810c1bc4a968fa037b76601636e4c13aa4a5b52.camel@collabora.com>
Subject: Re: [PATCH] ASoC: SOF: topology: Fix null pointer derefence
From: Julien Massot <julien.massot@collabora.com>
To: Markus Elfring <Markus.Elfring@web.de>, linux-sound@vger.kernel.org, 
	sound-open-firmware@alsa-project.org
Cc: kernel@collabora.com, LKML <linux-kernel@vger.kernel.org>, Bard Liao	
 <yung-chuan.liao@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Jaroslav Kysela	 <perex@perex.cz>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Liam Girdwood	 <liam.r.girdwood@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown	 <broonie@kernel.org>,
 =?ISO-8859-1?Q?P=E9ter?= Ujfalusi	 <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart	 <pierre-louis.bossart@linux.dev>, Ranjani Sridharan	
 <ranjani.sridharan@linux.intel.com>, Takashi Iwai <tiwai@suse.com>
Date: Mon, 28 Apr 2025 15:28:43 +0200
In-Reply-To: <2583415c-6338-47ba-9688-eae9d5ae6736@web.de>
References: <20250428-fixup-of-sof-topology-v1-1-dc14376da258@collabora.com>
	 <2583415c-6338-47ba-9688-eae9d5ae6736@web.de>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,
On Mon, 2025-04-28 at 15:10 +0200, Markus Elfring wrote:
> Prevent null pointer dereference in snd_sof_load_topology
It sounds better indeed, I will send a v2.

Thanks,
Julien
