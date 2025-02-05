Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF471DE4D3;
	Wed,  5 Feb 2025 16:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738774438; cv=none; b=pqryLjaMQw02EqBSVnkOGXBdDSgNhfmb0X8hGAFmo1KVBIsquyJswR0Upmw16JIMJ9Z4pzQ/ACiTJaWDApp7rP70DndaK5LqQ8Rw9sm2N0uJTH0CSZM1BFtgfZ0y2BWLp6a4rcYG7RfuDrvIUHxvi2uS5RbPy6OwoRpvqrOpsHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738774438; c=relaxed/simple;
	bh=6/qxTgSjf0NmMsk0AWx6ZxvhMxm17fBMw1oe/n5osWM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Smb93LXloRIk4/M57V1U14g79tBExzOjbjHbz5YLb/rB0KkOvVhHDyI1VetaXJvxoIVwiWyE68rR8Cjj4c3GaxMfEtwHUx1R664JZZmCDZVjoWd1E0AUlGdI9S/Ws16uUU3+mGTvwpkqvHrfKm8gzErGsQ1x5r70iOMP6BjztZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hKALLm5j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hKALLm5j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 427F5C4CED1;
	Wed,  5 Feb 2025 16:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738774437;
	bh=6/qxTgSjf0NmMsk0AWx6ZxvhMxm17fBMw1oe/n5osWM=;
	h=From:To:Cc:Subject:Date:From;
	b=hKALLm5jfEwZdAFjvyxbyfoqPGiFQIANGb77eMvaUsZ5V+ZGoO20CwueoWj43SaPY
	 jrdJiz9Ul3/YfJXzmN73i7CzE0weYm1LpmufXF8cfyeKMrQOsfi2TYIkin9dgU4728
	 llpPHNefmtVat9KOl9SANWrewS/XGp5h3HFwozm7s+cegB1ZIg/7RA8NHQxnWuRRq4
	 x0/EIOqmbK5ilzzfPrW+NOj+jwMVpspojnShZpOqH495KiczxsoEXC5RR8nfJukJZe
	 EnA2DkPFKKrnos6KKrBPs4oCs0vDvvvFM+ErcRGdjClIoyVP47Pl6uEQZ5qfP4F5ln
	 /0RLp1erQmXbw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: dapm: unexport snd_soc_dapm_update_dai()
Date: Thu,  6 Feb 2025 01:53:34 +0900
Message-ID: <20250205165337.3466336-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The symbol provider (sound/soc/soc-dapm.c) and the symbol consumer
(sound/soc/soc-pcm.c) belong to the same module, snd-soc-core.ko.

There is no need to export it.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 sound/soc/soc-dapm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index eb629edfbe42..420fe7dea31e 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2782,7 +2782,6 @@ int snd_soc_dapm_update_dai(struct snd_pcm_substream *substream,
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(snd_soc_dapm_update_dai);
 
 int snd_soc_dapm_widget_name_cmp(struct snd_soc_dapm_widget *widget, const char *s)
 {
-- 
2.43.0

