Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DF21F0984;
	Tue, 10 Jun 2025 09:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547862; cv=none; b=DpxAcAbb8SAOr3NirQRr6pRFodMtLBeO0oYnGZk+nLLd2G8XU5GK10SYHnlwc422pXMp+NdX09Lx/mq6Q3HIOGrCDf5kHRu9x2rDgXqwRuXRF1q+kZFQn669VJT3wKY9+VUjljdE5CnDYqCXvBd6roOvaKprn4avAo9e79XwxvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547862; c=relaxed/simple;
	bh=YKy/3amZLqH2nzrlfIaM1pmEoEybpgu45G58wMSbjrA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Rrb4ua1qOuYXPzGlLFY6+2JLz3mar+3k4iQVUo24QBGed4ru+qt4fLDNdH9L4MBW430YsU6LzYczA6r1WWN7GkY7pGM/fsB9nUe8MfyeQYKH9kdE4kpGvj32Fa/IEVLlf0Nrm3ZcokwM2S23h+GqSCr9oKJ4oOjAzKnjA+h4/4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t4iwjV2O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t4iwjV2O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49FB2C4CEED;
	Tue, 10 Jun 2025 09:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749547862;
	bh=YKy/3amZLqH2nzrlfIaM1pmEoEybpgu45G58wMSbjrA=;
	h=From:To:Cc:Subject:Date:From;
	b=t4iwjV2OYGDxQJffBC6xTdOgJ2c9WJkN7PG/I3NMe5yYWCi2fCsdEV1NuPwPwi8LE
	 hzN0/p0rMJPg0IPOnVnjgvyIfJIKXEmLZBpfKK2PaZJxPx85EQMq0YBjefS4WWvH5w
	 5twWc7Jm8T43zs8sYGhzTJjQ3NTYDmt2V7rdJo6FScPeEUFtGoJzgf0iI5lpn+O1gq
	 zQ3hhEhfNzmkQ/rGv5hirKaNLMHWRa5GtcYnP+5PNuVYRjYZ/Y8mTPharvBmH03CT+
	 ctGDJEC5cq0nGgXDgYPPHHHENrOpOcwDdnyYHQOiLAzI/tAEMkpvIhzrXaK12zLMSS
	 BVQall8+QAb7A==
From: Arnd Bergmann <arnd@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: ops: dynamically allocate struct snd_ctl_elem_value
Date: Tue, 10 Jun 2025 11:30:53 +0200
Message-Id: <20250610093057.2643233-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

This structure is really too larget to be allocated on the stack:

sound/soc/soc-ops.c:435:5: error: stack frame size (1296) exceeds limit (1280) in 'snd_soc_limit_volume' [-Werror,-Wframe-larger-than]

Change the function to dynamically allocate it instead.

There is probably a better way to do it since only two integer fields
inside of that structure are actually used, but this is the simplest
rework for the moment.

Fixes: 783db6851c18 ("ASoC: ops: Enforce platform maximum on initial value")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/soc-ops.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index a1a011e6b17c..00c6f1ce7474 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -399,28 +399,32 @@ EXPORT_SYMBOL_GPL(snd_soc_put_volsw_sx);
 static int snd_soc_clip_to_platform_max(struct snd_kcontrol *kctl)
 {
 	struct soc_mixer_control *mc = (struct soc_mixer_control *)kctl->private_value;
-	struct snd_ctl_elem_value uctl;
+	struct snd_ctl_elem_value *uctl;
 	int ret;
 
 	if (!mc->platform_max)
 		return 0;
 
-	ret = kctl->get(kctl, &uctl);
+	uctl = kzalloc(sizeof(*uctl), GFP_KERNEL);
+	if (!uctl)
+		return -ENOMEM;
+
+	ret = kctl->get(kctl, uctl);
 	if (ret < 0)
-		return ret;
+		goto out;
 
-	if (uctl.value.integer.value[0] > mc->platform_max)
-		uctl.value.integer.value[0] = mc->platform_max;
+	if (uctl->value.integer.value[0] > mc->platform_max)
+		uctl->value.integer.value[0] = mc->platform_max;
 
 	if (snd_soc_volsw_is_stereo(mc) &&
-	    uctl.value.integer.value[1] > mc->platform_max)
-		uctl.value.integer.value[1] = mc->platform_max;
+	    uctl->value.integer.value[1] > mc->platform_max)
+		uctl->value.integer.value[1] = mc->platform_max;
 
-	ret = kctl->put(kctl, &uctl);
-	if (ret < 0)
-		return ret;
+	ret = kctl->put(kctl, uctl);
 
-	return 0;
+out:
+	kfree(uctl);
+	return ret;
 }
 
 /**
-- 
2.39.5

