Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622251DB153;
	Wed,  5 Feb 2025 16:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738774410; cv=none; b=VgZy65NHG21oO43j9yEYFSbEXniknXqPrhKgGJU+/yVjrpR51rx8+hm0JHPpNFQXov/qTn8y/pcYxzr9mGGRxA3fbTYf8R1EXxY0k8zGXbBJleOV2RPMbsvEHKl3QqnGXg4Gbd2hRVwyiMjpGwlu2ajHGxhN10g0c1RwNCo/Oq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738774410; c=relaxed/simple;
	bh=fpPbk87ghxqhxwd+nofpzT2xI5YUy8Iw61bPc5zLeyA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jgVbhMAdanBcDwx1IGWLl57M5cBQFX+J+tk/NvuppVGiz58AzkEi/PgcjwS8OF0LM5oIltmv4DdiKBqXOw4pSWa1fQECxgRqh/dIfhUtF2cKh8wq1ZnWkabbnwkJXcRzp101xcXEWXn1uLHaJHf/JIxIlRA2jVcp3ZqErnIvIVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BAVj7KAz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BAVj7KAz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 659E7C4CED1;
	Wed,  5 Feb 2025 16:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738774409;
	bh=fpPbk87ghxqhxwd+nofpzT2xI5YUy8Iw61bPc5zLeyA=;
	h=From:To:Cc:Subject:Date:From;
	b=BAVj7KAz7gvln1n5gN+k6DzYcz8vqWM/ssEp3J7cyAF0y2/AsxDSeG34jeOWAyhqE
	 717p/kWhXd8OBMY54oO0tusa5v7m1gOtgyZyNsdxX7TmD3Ti1kJ5ENV8Bqf813SSBH
	 plRJsQjQ5ybLmbfqU+8JbNY3dp8lTWgjZies49xRi9CaFV+qdtxPa6E2lJNlBgm6KL
	 ZfDZhm54DUnPCCAajenpu+Fe/TvG5Ac2K5L7XBH/2YyP5M7V2zq7o6IxjdlBveBZaC
	 eh3bcxQ168fV2i8oZrv7ZbgWfczPR/p1WL9JyCzOo5P6xiLWwwYTqM8wwpzt2wjMFO
	 2BicflgZYMtVA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: dapm: unexport dapm_mark_endpoints_dirty()
Date: Thu,  6 Feb 2025 01:53:08 +0900
Message-ID: <20250205165310.3466254-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The symbol provider (sound/soc/soc-dapm.c) and the symbol consumer
(sound/soc/soc-core.c) belong to the same module, snd-soc-core.ko.

There is no need to export it.

I deleted the comment, as other modules cannot use it any more.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 include/sound/soc-dapm.h | 2 --
 sound/soc/soc-dapm.c     | 1 -
 2 files changed, 3 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 12cd7b5a2202..7cf52c8c9cf3 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -514,8 +514,6 @@ int snd_soc_dapm_force_enable_pin(struct snd_soc_dapm_context *dapm, const char
 int snd_soc_dapm_force_enable_pin_unlocked(struct snd_soc_dapm_context *dapm, const char *pin);
 int snd_soc_dapm_ignore_suspend(struct snd_soc_dapm_context *dapm, const char *pin);
 unsigned int dapm_kcontrol_get_value(const struct snd_kcontrol *kcontrol);
-
-/* Mostly internal - should not normally be used */
 void dapm_mark_endpoints_dirty(struct snd_soc_card *card);
 
 /* dapm path query */
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 3fa53ce80189..eb629edfbe42 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -317,7 +317,6 @@ void dapm_mark_endpoints_dirty(struct snd_soc_card *card)
 
 	snd_soc_dapm_mutex_unlock(card);
 }
-EXPORT_SYMBOL_GPL(dapm_mark_endpoints_dirty);
 
 /* create a new dapm widget */
 static inline struct snd_soc_dapm_widget *dapm_cnew_widget(
-- 
2.43.0

