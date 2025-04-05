Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73580B66E;
	Sat,  5 Apr 2025 00:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743812031; cv=none; b=mrJBrYn7EWmnuFOsLXAOYG418dIFAvij1TNllEl8CbJxQK3hiUCfq5oB6CLRrEHoBCIXVe7IrSuXaELMvO2ZYFDtWjSxPABWAGQrun5Vtvtr66K28te48zBlftH6lHG+SXGDbpSSq1SCq+GL+zlPrUy0pHuAlwpxNUKgrJU96zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743812031; c=relaxed/simple;
	bh=6UnJG1AvPDEmmk5tRo4+qNp8VLMd4iFaYjd8CWq1RX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gCBv+sIvmQMIqwI4Bh+6scphg6euAPDh/E7+z00PqPoFOQVxtKDPASg3En4z8XCB+wm+r/MThshYlSKWa33Z82xyvPGO/Nl8uIyU4o58D7i6J82G7g8nZ/92BnwvvH2jrsBy/FidKxWcexelK1XPu0e9UasOHYCMJcV+iPX6xSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c0QTHGzm; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c0QTHGzm"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-301918a4e3bso2403301a91.3;
        Fri, 04 Apr 2025 17:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743812028; x=1744416828; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fL3P1BWquDAW+NuEcw0ECyZ7Z9hisONSWat88Huzv4Y=;
        b=c0QTHGzmHqaLZOkzOrOt6K5OI/lgJs4OcUWS16RKoNraMziwURc0ys7y2ZzzO2KEhg
         txlu1T+oMB+swXYHxZ8yuIww1rQecyqF016Y77SFXnNAbNYrDEIZzz8KunnFpx6l6Lth
         0/vbwiQAiupDnJgyCDrkxE40jmdhYyAkKgNXsJ4kvBqtXZ8nlBR+Jk7XTE9nrt2TCGzf
         OzwpFQFRSnipCReqgwnO47lwYmMKYloa5fKgpdrSWv379q91xasil29XWtwk44xtWlwl
         u8LrjehzxEbJHY1RsU1/JBYDgC6S0oWNEvl08QkwKUS6m0ZVRnOPU6hSOQpOHKgQgF3/
         86qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743812028; x=1744416828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fL3P1BWquDAW+NuEcw0ECyZ7Z9hisONSWat88Huzv4Y=;
        b=t7Ku7oz11b4y3EX0Ljn7gqAuGPb2uLTiYCWKQ5Ak4Awz95mjw6nicM0WO5xD6OgMsx
         TZWH/Wv64snHuGf5ewwH4jjPA/vM9CrS3ivjZhh/meKuAI7heeo8eulRddwehUfw2zBm
         P0tmik2XsE71qkadZi9HH/pfA8heSC04OoTR4A+2aiiLDCvYoAo7fey7Cna4VLp2A9zt
         8rlngiGeA1QuxyDnFS4OC+mQrK0RcxNs3pR9drAtF9usEZUJ4KyoLDH8gXTvckfqqqPw
         P+4CHjfk0IxClOyTxEn4/TAwV/FR6G8d5u3M3h6GKsrd5QAKES0aEVK44ui8G1hS4uBS
         vQ9w==
X-Forwarded-Encrypted: i=1; AJvYcCUYr8V3L4agqGBRblVvS6ic1Pqp1cb+3rvo0yfRbceic09lT9B7rhL1hOWLiwBDMThz7pvDvjDf+E16rxM=@vger.kernel.org, AJvYcCVSy6LhB76CumdMuO53cl9/3/uwqOTbvgf5tp1AIhC79vpZptnJdXDzdnUW0IKVMSp9UM4s3C7dmAxQ@vger.kernel.org, AJvYcCVfVKuwiuYbUmeakG8+Rbq5ujU0n2cZCJayZsr7+caq53PID1hBh7joGcQQWVXcqODn4rmyP73TMtskifY=@vger.kernel.org, AJvYcCWbQnJqCdvKiXK9rTN7iNuIQAtcBIxpP8imVhNEC2PBoZz7a3NGFwwq8ISFALACDGEQgeKqtHb3oS2BEHdP@vger.kernel.org
X-Gm-Message-State: AOJu0YxjqicHNcGeXgKjA99nzOUVe13su2ZBuSF5xJJZwAObAYxnhcoV
	WVcm8L+K8/0sL8LQ1/m0T9aHvLnvXwuapnW1vsSAuFfMFmuS4e7Mizkj4ovF
X-Gm-Gg: ASbGncv8K06g3raKs4NpK156z9wh5eiH3Qu7KC5YN3tmVtYvp7j4GB2t/6vjLQ/r1cM
	6nwRR4A+vPrs6PS6g0uocEZOR2EqEkfP1MVO4YgpaOazZFMdM/LmMItaKi0GfJp5kJi1IWl3u1U
	zDnyBuNOZaH+0WbEvYr2TYokCBSemBe9GBuy3tayKFp3UCiNmQWgNCbZrsgSNoRIpfm4km6/+9p
	GPolE80VTQ71WrmU4qtek8cwye90f+vschKv3SNoGnoHYEviszCH4V9bUk3uoUidKHCiIMYpXgr
	DG7qPJaIYMPVKdXdXB0UJYtlVsRrIBXDJk8Q+HHB9IxUgL9gBZp5cL6WmmFvjVGDczfL1i6kMXT
	XZh2Yf01Xcohr4zPm5N5HIjXwFTj9jE/eYdV/ODI=
X-Google-Smtp-Source: AGHT+IHkfxB1GT0mGtqFz7+RsHm/7YTJC41hwXazAtzx6CVSa1u5O7PgnVqJkyRif6Z+zdP+u52gdw==
X-Received: by 2002:a17:90a:c2d0:b0:2ee:d193:f3d5 with SMTP id 98e67ed59e1d1-306a6120999mr5968395a91.7.1743812028515;
        Fri, 04 Apr 2025 17:13:48 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb5d665sm4327855a91.30.2025.04.04.17.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 17:13:48 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 05 Apr 2025 10:12:43 +1000
Subject: [PATCH v4 06/10] ASoC: tas2764: Crop SDOUT zero-out mask based on
 BCLK ratio
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250405-apple-codec-changes-v4-6-d007e46ce4a2@gmail.com>
References: <20250405-apple-codec-changes-v4-0-d007e46ce4a2@gmail.com>
In-Reply-To: <20250405-apple-codec-changes-v4-0-d007e46ce4a2@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Dan Murphy <dmurphy@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shi Fu <shifu0704@thundersoft.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Hector Martin <marcan@marcan.st>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-hwmon@vger.kernel.org, 
 Neal Gompa <neal@gompa.dev>, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2333;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=+6z+IFHagOAeKJHhgePAxflNx1m94p7Kaz6yE2bMnys=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkfStvMEs8Jffv7t3KxmAvbx5lKazr8Zl08vXHjNHeG4
 /8W3hZq7ChlYRDjYpAVU2TZ0CTkMduI7Wa/SOVemDmsTCBDGLg4BWAiKpEM/xQtN8yc921zJVeS
 tOwJ5Se/fhlM3X4kUmhtwoRQ1/lb9rYz/LN5smG7s8iPqTO3nVhruWcpcxwTw5llh5gs0jJv2x6
 OEuQBAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

As per the datasheet, SDOUT bits must be zeroed out if the
corresponding TDM slot is invalid for a given clock ratio.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 39 +++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index fbfe4d032df7b26b7db0f7c7dcb47661277006d0..e291ec0951d49ee902589df16c4db96e83614e66 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -367,6 +367,44 @@ static int tas2764_hw_params(struct snd_pcm_substream *substream,
 	return tas2764_set_samplerate(tas2764, params_rate(params));
 }
 
+static int tas2764_write_sdout_zero_mask(struct tas2764_priv *tas2764, int bclk_ratio)
+{
+	struct snd_soc_component *component = tas2764->component;
+	int nsense_slots = bclk_ratio / 8;
+	u32 cropped_mask;
+	int i, ret;
+
+	if (!tas2764->sdout_zero_mask)
+		return 0;
+
+	cropped_mask = tas2764->sdout_zero_mask & GENMASK(nsense_slots - 1, 0);
+
+	for (i = 0; i < 4; i++) {
+		ret = snd_soc_component_write(component, TAS2764_SDOUT_HIZ_1 + i,
+					      (cropped_mask >> (i * 8)) & 0xff);
+
+		if (ret < 0)
+			return ret;
+	}
+
+	ret = snd_soc_component_update_bits(component, TAS2764_SDOUT_HIZ_9,
+					    TAS2764_SDOUT_HIZ_9_FORCE_0_EN,
+					    TAS2764_SDOUT_HIZ_9_FORCE_0_EN);
+
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int tas2764_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio)
+{
+	struct snd_soc_component *component = dai->component;
+	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
+
+	return tas2764_write_sdout_zero_mask(tas2764, ratio);
+}
+
 static int tas2764_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct snd_soc_component *component = dai->component;
@@ -506,6 +544,7 @@ static int tas2764_set_dai_tdm_slot(struct snd_soc_dai *dai,
 static const struct snd_soc_dai_ops tas2764_dai_ops = {
 	.mute_stream = tas2764_mute,
 	.hw_params  = tas2764_hw_params,
+	.set_bclk_ratio = tas2764_set_bclk_ratio,
 	.set_fmt    = tas2764_set_fmt,
 	.set_tdm_slot = tas2764_set_dai_tdm_slot,
 	.no_capture_mute = 1,

-- 
2.49.0

