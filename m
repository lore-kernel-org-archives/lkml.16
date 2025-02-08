Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47107372;
	Sat,  8 Feb 2025 01:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738976623; cv=none; b=dc8aexEmTrAT4Z/fzQ46ULfz7pEPzqnmzCMSAc5vQlOt3dVegwakcfa8qOWEPjCBQWh6/MlNMnG2CySdkPCg1XJ/wupKjFQgS7wfNfh16Zp8y1zhtBdb6qd3mV/yMiVRUqw210BDBkcw1w31uEpKeE0IzizRBjN+jdD24DJzQZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738976623; c=relaxed/simple;
	bh=LpB13TyaqfIa/Ah4f9XkGtFnMZnkGvAbfUD1IHR7o7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u0X1aT/d71A6iPSRxa0kVM+MS9GddYopdbpR81UbpjBi8tSGZi4xDAZDOXIAG8r4emfpdLZ8hu4jOUovKUdWOl5czG6X7DT9U70fN6N+MKg64dnIfQ5MKxdB1GaMWEyQsxk8rMsJkAiz3RMFPPDSukV0GY4omxPJZ1dX7Ze/mt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WKs9/EKX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WKs9/EKX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6E6AC4CEE4;
	Sat,  8 Feb 2025 01:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738976622;
	bh=LpB13TyaqfIa/Ah4f9XkGtFnMZnkGvAbfUD1IHR7o7k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WKs9/EKX2cJNMBuAxOCof+y8zQaFB/8QqsCsWf4lmUVDDoXGu1VdhlSyFnDFwIB8g
	 NJ8tNpEo2IW6ngNo7ENigk/lNq8+Om/dfNY239rq1KvKLRmIuN+9Ez7jjh2hZLZqyK
	 iQ1O09C+GlOQ7h9P00w68gUCjSByKM1lK4JmJzniHhDMHdeNIrd0Ya9B1zH7ZVuypA
	 W1d5M4EPdaSK5XV1L/fJYFxtf/oKUeqXYmuHtlBudWV1Ovyv4UhyuF7EmzZ52P/LSo
	 EYGswQ0SrkcevAenOyb5eaeykBSpl5dWTlOTA/P11gi8I4FpqGJS+SP1LRSOSWh217
	 J4ZDXd+2AdIGg==
From: broonie@kernel.org
Date: Sat, 08 Feb 2025 01:03:25 +0000
Subject: [PATCH 2/4] ASoC: tas2764: Wait for ramp-down after shutdown
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250208-asoc-tas2764-v1-2-dbab892a69b5@kernel.org>
References: <20250208-asoc-tas2764-v1-0-dbab892a69b5@kernel.org>
In-Reply-To: <20250208-asoc-tas2764-v1-0-dbab892a69b5@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Dan Murphy <dmurphy@ti.com>, Hector Martin <marcan@marcan.st>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-42535
X-Developer-Signature: v=1; a=openpgp-sha256; l=1421; i=broonie@kernel.org;
 h=from:subject:message-id; bh=EeZ9JxtdRfnJDqF7P+IHhZuxKSGMmCozAUcZpgUxIxw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnpq1iexnn2unfR4qH4Z/mId3O0APy0a3WEVP8o
 oss6qxJK0aJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ6atYgAKCRAk1otyXVSH
 0Ff/B/9CKmiJdTa8wfAaZiGqifD60xj3mZ9NSOGmvffMxp0M9C1JynX8vyDf2cQQHfJqxwg0woi
 20WB4NuaYcyBij6tX04p2uMIesslQ1rV5YG3X//Mk9PflLZh3VMXvCsW7jEOUGUvAXHEPqdHjhD
 C605zlwdulr+b+OLXAQlNZgemtvyquw77pMPdTcLgVJqgt1A9j6LvJLQEg+UDuO9jYljsjcHtT2
 +S51xVcmTu9VLkT4bsuE/FZC/8c6UDYV022JOW2S3J7sgw3lXgYNOUjmk9YxjwRtAQHCdIMsqDG
 Ne/dS2+lgsFFpwMbjJjYhMdI8d0b24CYRyxGWYwUgMWr62Ok
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

From: Hector Martin <marcan@marcan.st>

When we shut down the amp, we need to wait for the built-in ramp-down
before we can remove the TDM clocks. There is no documented status
regiter to poll, so the best we can do is a delay. Datasheet says 5.9ms
for ramp-down and 1.5ms between shutdown and next startup, so let's do
6ms after mute and 2ms after shutdown. That gives us a cumulative 8ms
for ramp-down and guaratees the required minimum shutdown time.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tas2764.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 60d660a88fab..0b033ab51f7f 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -142,6 +142,8 @@ static int tas2764_codec_suspend(struct snd_soc_component *component)
 	regcache_cache_only(tas2764->regmap, true);
 	regcache_mark_dirty(tas2764->regmap);
 
+	usleep_range(6000, 7000);
+
 	return 0;
 }
 
@@ -228,10 +230,16 @@ static int tas2764_mute(struct snd_soc_dai *dai, int mute, int direction)
 		return ret;
 
 	if (mute) {
+		/* Wait for ramp-down */
+		usleep_range(6000, 7000);
+
 		tas2764->dac_powered = false;
 		ret = tas2764_update_pwr_ctrl(tas2764);
 		if (ret)
 			return ret;
+
+		/* Wait a bit after shutdown */
+		usleep_range(2000, 3000);
 	}
 
 	return 0;

-- 
2.39.5

