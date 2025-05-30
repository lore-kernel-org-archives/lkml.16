Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF279258A;
	Fri, 30 May 2025 16:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748623490; cv=none; b=MdR91u+xEFh3hFqJGBIZNWRTAeC/p5RAzZ04tZQun/vL7V0VaQYSlVpQTLcAuK3Qmse5NLRud7ZPN3H/7MozGSBEo+iJ2VarpBDeJOReFjWypqyhp6fEfKoGaROm3lRjjlW+YD7LQXUHZd8wOGRw2rm+1Ch+ymlIt0/2f49X9OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748623490; c=relaxed/simple;
	bh=pUFXPNioH5+1QSGJlHV1wuX4spmGaSHYnbG/z3bhnWI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D5R+6QnJ2x/ypDwRvCXeoI3IWiUX4NaVJOfDtAD1WPpZUWtl1keL3giDCa5B/iIJXugr+5zyE5DnmOujsbi60i6vp5X9/77fQfnTpcvP/gQAbLKhR2xT7nl5H/Ep2YCq7fhk3SDN9upHShevbcLxGk3ykH2aAnnaLY/mUODJViQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=UJKJizg+; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="UJKJizg+"
Received: from fedora.intra.ispras.ru (unknown [10.10.165.16])
	by mail.ispras.ru (Postfix) with ESMTPSA id 502AD40737D7;
	Fri, 30 May 2025 16:44:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 502AD40737D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1748623478;
	bh=wgZVDaiwB/ysM5KR2x6/lxy0bp5OSY9UQ0R5kiHgSPk=;
	h=From:To:Cc:Subject:Date:From;
	b=UJKJizg+m5aLZgu0NoDS8CBHBgkB6OpnECX5TYGhWhKU2ddcT0xNYX/CGqhDwbQhb
	 UNFPwhH5fSk5gcZbx1YrupVuHC5yvaXJVtngZXPRzkOmLvBNeL/FaQ30GvObPolqPJ
	 /Y2HM+G76PHkpquFI1te9Kq/Y9DkcfTJE0yeAeB4=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>,
	Jaroslav Kysela <perex@perex.cz>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH 0/3] ASoC: amd: fixes for runtime private data memory leaks
Date: Fri, 30 May 2025 19:44:13 +0300
Message-ID: <20250530164425.119102-1-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here follows a set of related patches regarding leaks of memory referenced
to by runtime->private_data pointers in amd soc drivers.

Fedor Pchelkin (3):
  ASoC: amd: acp6x-pdm-dma: free pdm device data on closing
  ASoC: amd: acp3x-pcm-dma: free runtime private data on closing
  ASoC: amd: acp3x-pdm-dma: free pdm device data on closing

 sound/soc/amd/raven/acp3x-pcm-dma.c  | 2 +-
 sound/soc/amd/renoir/acp3x-pdm-dma.c | 2 ++
 sound/soc/amd/yc/acp6x-pdm-dma.c     | 2 ++
 3 files changed, 5 insertions(+), 1 deletion(-)

-- 
2.49.0

