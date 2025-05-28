Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C74221579
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 20:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748462417; cv=none; b=IBaN/M7SijBh0oKb5mXYAGk5PwhB1S0n7C6alKqqUDQX79JfgljjQe+UennQTcYTvF7E5tqE1oobSHeNVV5lABgPqqJWqU3mJIwDDPRPtS6p49njMP8Pe5zF8huS+kJ261fD9USUVoYTy665CY+1KJewph7Kg3XHNlQceJ4mdbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748462417; c=relaxed/simple;
	bh=bE4AstDjnvFxLFE0Ha1Csaz7+vgcKuDvPOFc39zCH/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a916hnE/qHyG09Og6a7Xi56Gt9XxdvncmHJe4YRXInNc7k54UVQ7qWxROq4np5TKBtU3/XIsZzEw9dDf0nIDvdH3hzDjn7D6ZDLxCh9aUNTKAjAHHHtalHjaNvh6nDb0ujCFILHdT6NC8RVt8QLU1EGgu2DKfx6TLSmrngHKb68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a31gCKQZ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a31gCKQZ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4db4d1bd7so30418f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748462414; x=1749067214; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mUSrmQGzRLm1yXmwpcZ6EHzpQ97NUziF5cyDbhiDKYw=;
        b=a31gCKQZFfrFBhW/sLn5IAo96f007/uhu0a74KALSGiC8uLKHJ8LfjQ2J7YMepW86X
         caeLHrmylAmpgp4FWTfdgOphXvdMG03uOHVE/sBBbDZq7RC45uDhxWmMhczrB+wLdKU+
         VCJ4k5UEnp3lweRhr4zM5FIxo2Ost59oZFYqpTQIoQgrLQrYc9Gph0eeHhXSSaM7LLD6
         89sfaqYv8PrwDhDZa9MXY+gmXTPU3mzvFEYWcWWAm+OlmGAyI6fMBrsaOKi5ikW5Th7z
         7DXec7KNoaAUTJv6cXHiF9FsaPm4KEWTBSLJPTj3ze09lOY1oZx0eajyHPJZM76gtOM2
         qh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462414; x=1749067214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mUSrmQGzRLm1yXmwpcZ6EHzpQ97NUziF5cyDbhiDKYw=;
        b=bd2W09OOiPS1+/sYNK4LKw98Qr/yQUAUVvr3wSgfuFHLN8xFM9DvoqUyAuOa3M/j10
         pUEu5MJ9H56SRe5S92L4bPp8V5/NuU+ufhDJyMfPI/xA9BuanWW5UzesXqFV5ESeiFGb
         mqAfniNMIBZc0W+g0a1R+2zmmhN32b0Nbcpkl0zJ/91a76wuDgzh7lLNIL/mwe2OF1/t
         /2cZkyIuO6n8hOpmu9ag/QTMHbgybkefltCpMcYj8Htt471BJUzK8BwqtQgh+y49Ftcf
         tjB2TbyqqW9Li7LNQ0nr9wKcRK/FhFyZM15YCswalcLovuXiWfU6BAedIPUCQWqHTkxx
         atWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGDFmQ8ySciVZDSMxQeBBoyu0KpZ8ASWy0bFNsT6yJxRvEeS8gzGAzu/Rasql9ZohljNEaKZy/LIogm0o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGPdjVyNyFoCfO4p20rvOrrTBwmVv6lfSZOQ/KR5Xio3EskG8K
	Gacc/pH2cCFL5Wm06pWsMhw/XX4tzhO9a725cFaAaT7iI+pyMzd5tHnXbsbRUc9aIUY=
X-Gm-Gg: ASbGncvOYbFqOmT1M6Q2qtKSoFCXMrDS0IpXwrMhqG+029Kt+9eIsI+LHRXFeYXmZHm
	+fkU6rndGMmwt1q+H09mjRc2B2fhMAx2kVHuZtAgdi1thzXaPb4J8mVWBhfBPjwjpw/qMtuhicG
	K8BMLkaOo61OU52h1lz3D7bWyb+nWCFLleqVPuWJx6dqGFUeAGc1UyLwvaZu6VyE+v2ta40ZziS
	+OAI5WeWT3J797hrQTIgqfX73Vt5Q/Vm0i30xuC9G9y7iMaGqJ+cz0CegH66hpywDhpy3isJCX8
	UIGqRM/E6S3KV6zt6Ykwx/YbHK7uFe7k6NNBz6iaN3B3W6hLoRyaNgAxSjehddQqkpjK1n8=
X-Google-Smtp-Source: AGHT+IGfU8NFt+DqotOkDnTjGF7XzJKz4InJeaeMrRliPYDudRhDJYMTWxE+7D8L8v2uiJmW/9+V8Q==
X-Received: by 2002:a05:6000:22c7:b0:3a4:d924:e650 with SMTP id ffacd0b85a97d-3a4d924e7acmr4088338f8f.3.1748462414106;
        Wed, 28 May 2025 13:00:14 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44fcbd61553sm53347665e9.0.2025.05.28.13.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 13:00:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 21:59:58 +0200
Subject: [PATCH 4/8] ASoC: codecs: wcd934x: Drop unused
 num_rx_port/num_tx_port fields
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-asoc-const-unused-v1-4-19a5d07b9d5c@linaro.org>
References: <20250528-asoc-const-unused-v1-0-19a5d07b9d5c@linaro.org>
In-Reply-To: <20250528-asoc-const-unused-v1-0-19a5d07b9d5c@linaro.org>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Oder Chiou <oder_chiou@realtek.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1164;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=bE4AstDjnvFxLFE0Ha1Csaz7+vgcKuDvPOFc39zCH/Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoN2tAPg4TdSpzrnusk8/T1AviguPqy8H5ac0sf
 fUwz2vi3r6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDdrQAAKCRDBN2bmhouD
 12gcEACIIAskqI79X3CWPeeqtkbf389joGRl9j0Z3/TBo+YE0zAGoLygLCjCxovWSIp4Q9+9bjz
 tjAG5P4m70aauB0+sUTBy9aS7+sTiY0mxrReQKzqh4FtHSZIorAt5e81IzP8h18ONx4o61A2NW1
 ON5zm5321mfYDFeephAO5g+ISQutxjHEbR4Q4QYzIKSHPVJCac1N3gV/xHXRXgCP5TVrBSVbRkZ
 ugKzBhxgXw8KcMB69mnoHWypcP4AB1GxrDirlql+IywJg9fcBaxe+OhandyVmJaBfqpEW3s6Ce7
 2SDdVPdkZhIIPFFwGfcR9gzyW+PhM8l1/m5rq/Tz4/RidVls1Kg8U7woejgDsUakrQsrp2Eia5a
 MRdps9hdh4dIkJhbUsaQGIrLFKD9d7IvuDTKbLWSA7FWuVt7mVd2aXG+SWTX6sIx6uENZLM/nPq
 cy114SC/Fq4zEwoLoLbSkgeLj0BXVuJcfm62aSfQFrYCjyZqtHsyEZ5M8VdHZGBffs1eNRo5cue
 oSSiji8mfSjxawQokubfc+UO99Sr2R65oDtarSkXLjlZtQecJ8yd1WwfobzB96nG8BrQxpsLEDd
 ArCTD9P0YGhujSOt7JL8FDNkD6Um8WbDDWebxCC6foNi1fKypNRnAZFhdGUrY0nZpclACByimX9
 RqKKAUwNqaF8ZcQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Members wcd934x_codec.num_rx_port and num_tx_port are not read anywhere
after assignment, so they can be safely dropped.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd934x.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index fa69817c97eaf1bf226b140f3a89095a50a128b2..1bb7e1dc7e6b0a5528cbdb7ada943a7d417fb684 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -537,8 +537,6 @@ struct wcd934x_codec {
 	int rate;
 	u32 version;
 	u32 hph_mode;
-	int num_rx_port;
-	int num_tx_port;
 	u32 tx_port_value[WCD934X_TX_MAX];
 	u32 rx_port_value[WCD934X_RX_MAX];
 	int sido_input_src;
@@ -1928,13 +1926,11 @@ static int wcd934x_set_channel_map(struct snd_soc_dai *dai,
 		return -EINVAL;
 	}
 
-	wcd->num_rx_port = rx_num;
 	for (i = 0; i < rx_num; i++) {
 		wcd->rx_chs[i].ch_num = rx_slot[i];
 		INIT_LIST_HEAD(&wcd->rx_chs[i].list);
 	}
 
-	wcd->num_tx_port = tx_num;
 	for (i = 0; i < tx_num; i++) {
 		wcd->tx_chs[i].ch_num = tx_slot[i];
 		INIT_LIST_HEAD(&wcd->tx_chs[i].list);

-- 
2.45.2

