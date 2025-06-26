Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B0C79FE;
	Thu, 26 Jun 2025 11:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750938759; cv=none; b=qhw9nLtjk7CW5rRka9XONvPHEA1xQ4IuBHOgONVdCcQ3hWZm+5xq7GCcaZCKFYYaLPBk10drnDOYgpvYoEO7kV8w42tlmT9XaUe1jB8kckrSLY89EP/269Jyfor4ywpMU5YWISlpF00cab98J3AsTr8Tf0SnXLALyXp7GbI3DU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750938759; c=relaxed/simple;
	bh=2Qh2Zd3dzsgYDm5txrfwRiPP+X34/1hlDIJLd3js8GQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bQ7P4zuqFtzpO/YNY+YsxIoX0h//wt4+aT6/earbNnaSl7rbZeoMl/5DEL9KQDSKqtG9jbP/nKuOWp+SYHgLbSuCen3l3/5HlcB+joQXjDVvGKorNYAM89mnxsCYwArx/6T4U/O4HP9f9jej73P79eN3fURH0QNPmosTl+8Nvrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arunraghavan.net; spf=pass smtp.mailfrom=arunraghavan.net; dkim=pass (2048-bit key) header.d=arunraghavan.net header.i=@arunraghavan.net header.b=QkH2ScQe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=n4jF9ECf; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arunraghavan.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arunraghavan.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arunraghavan.net header.i=@arunraghavan.net header.b="QkH2ScQe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="n4jF9ECf"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 7206F1D001A7;
	Thu, 26 Jun 2025 07:52:36 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 26 Jun 2025 07:52:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	arunraghavan.net; h=cc:cc:content-transfer-encoding:content-type
	:date:date:from:from:in-reply-to:message-id:mime-version
	:reply-to:subject:subject:to:to; s=fm1; t=1750938756; x=
	1751025156; bh=D76ucE6r4U6GishIFwF0qlrah5XVDlhRiq5O7CVmMK4=; b=Q
	kH2ScQeY9TemKvzA4WHpb1jJ8BG2dseCerHmx31zFgB3yEedFEgZPqdql6j5U4It
	mlR0fVAwqNHylO/IBV7eYs6tGt2wcB8QvnqDNSofJtW3VSBe+jLIEeLWfPl40Dlw
	WXhvpebiW3VfzplDFppykeBISJBxJn2BN/1tabKZn0QCHVuv10UEGxB9NqwiFTcr
	8pnyxYUcYWFotsojwAl3b1cIaA72LHWuxhP9SlsFwAuiwhDrwALkIDsvGkGhAx4/
	5K4Pe5YB1Ta1DZXHZ6U7875R+gqJMboMLXP3w3pnurKbFnFQ3/4vyGxTYd1BrQ0N
	cwr2ckQtNIYXXW8JUG1ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1750938756; x=1751025156; bh=D76ucE6r4U6GishIFwF0qlrah5XVDlhRiq5
	O7CVmMK4=; b=n4jF9ECf6EkTSqo/wddtNtU3q6w2R3G/Hw5WJgg0WsAx4B3fp//
	CZ/Z5nndXscxYpMMqbl7TXOt38uCJ2R6AUG19YlNZBos+wIPCKvvWs1Ot7z6H0MM
	H9wkarbyBSPvA13lh6aiS/YxEibl1+IwLoUEd0F+Cx2h9L3chfh3rdTMEstfAoML
	Z8J4WY1HFhJ0NcIeEMgFSMTiAcf+pQaJIAhrAlKfPwdg/zai/bnIr4SjJwOFoXtk
	PC3dWweRE+8q5IMCBk6sHHfRtyTLDgjQeyqPc+HZOeHpYR5N7CaJf4rRv8jMSz8S
	yvb3ubfzikDg3NS36FzxSsBaq/sJ/n1yW4Q==
X-ME-Sender: <xms:gzRdaFxoc4Kt8em8TEOF9SBgQVUcFEcW3_lh4prOv47W7LGE0aRZuQ>
    <xme:gzRdaFQzrH_uuiH-XBEB8U_uj8uK6VqPDY4WkEPHI_DG2NPOPUz8oFA679OYqyT8z
    HW7hYWiEJw-g56Q6g>
X-ME-Received: <xmr:gzRdaPWqPzO7IyyzIAj13qZEPVkxKIkCv7ZjyRg2lqCI3G8_v6b312E_6POXDAvk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    fhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeetrhhunhcutfgrghhhrghv
    rghnuceorghruhhnsegrrhhunhhrrghghhgrvhgrnhdrnhgvtheqnecuggftrfgrthhtvg
    hrnhepteduheelvedvledvudfhudevkefhhfeifefggeevkedvudfgueelvdehtdetvdef
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghruh
    hnsegrrhhunhhrrghghhgrvhgrnhdrnhgvthdpnhgspghrtghpthhtohepudefpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehshhgvnhhgjhhiuhdrfigrnhhgsehgmhgrih
    hlrdgtohhmpdhrtghpthhtohepgihiuhgsohdrlhgvvgesghhmrghilhdrtghomhdprhgt
    phhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphhtthhopehnihgtoh
    hlvghothhsuhhkrgesghhmrghilhdrtghomhdprhgtphhtthhopehlghhirhgufihoohgu
    sehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgiipdhrtghpthhtohepthhifigr
    ihesshhushgvrdgtohhmpdhrtghpthhtohepphdrtggrmhgvrhhlhihntghksehtvghlvg
    hvihgtrdgtohhm
X-ME-Proxy: <xmx:hDRdaHhUc1pAZjHaW9ixReOptq3kk6Ay4dDv0pAr14hmefVThJvq0g>
    <xmx:hDRdaHCL4ktOslRU0PokGQgLvbqPe3mzY5g7rkgJuz-uHLSzbUrHFA>
    <xmx:hDRdaAKb4gTiWcmTRgmAD-nvWdU1UYkXRwHmmpn_VM7fUGi1IpHNqQ>
    <xmx:hDRdaGBdNcBnGbR0Q4htHNFosMSMadeCVXpUO43mXd2n0Vmhxb_0KA>
    <xmx:hDRdaFS3yrc7xiYB0oLUqf7AgIvf1k__38E-Xw3zK1E0_dbjPCF09HYC>
Feedback-ID: i42c0435e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jun 2025 07:52:35 -0400 (EDT)
From: Arun Raghavan <arun@arunraghavan.net>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Pieterjan Camerlynck <p.camerlynck@televic.com>,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Arun Raghavan <arun@asymptotic.io>
Subject: [PATCH v3] ASoC: fsl_sai: Force a software reset when starting in consumer mode
Date: Thu, 26 Jun 2025 07:52:18 -0400
Message-ID: <20250626115218.141874-1-arun@arunraghavan.net>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arun Raghavan <arun@asymptotic.io>

On an imx8mm platform with an external clock provider, when running the
receiver (arecord) and triggering an xrun with xrun_injection, we see a
channel swap/offset. This happens sometimes when running only the
receiver, but occurs reliably if a transmitter (aplay) is also
concurrently running.

It seems that the SAI loses track of frame sync during the trigger stop
-> trigger start cycle that occurs during an xrun. Doing just a FIFO
reset in this case does not suffice, and only a software reset seems to
get it back on track.

This looks like the same h/w bug that is already handled for the
producer case, so we now do the reset unconditionally on config disable.

Signed-off-by: Arun Raghavan <arun@asymptotic.io>
Reported-by: Pieterjan Camerlynck <p.camerlynck@televic.com>
---

v3
- Incorporate feedback from Shengjiu Wang to consolidate with the
  existing handling of this issue in producer mode

 sound/soc/fsl/fsl_sai.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index af1a168d35e3..50af6b725670 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -803,13 +803,15 @@ static void fsl_sai_config_disable(struct fsl_sai *sai, int dir)
 	 * anymore. Add software reset to fix this issue.
 	 * This is a hardware bug, and will be fix in the
 	 * next sai version.
+	 *
+	 * In consumer mode, this can happen even after a
+	 * single open/close, especially if both tx and rx
+	 * are running concurrently.
 	 */
-	if (!sai->is_consumer_mode[tx]) {
-		/* Software Reset */
-		regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), FSL_SAI_CSR_SR);
-		/* Clear SR bit to finish the reset */
-		regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), 0);
-	}
+	/* Software Reset */
+	regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), FSL_SAI_CSR_SR);
+	/* Clear SR bit to finish the reset */
+	regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), 0);
 }
 
 static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
-- 
2.49.0

