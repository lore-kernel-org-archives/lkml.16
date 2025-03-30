Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED7C1CAA80
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 13:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743340164; cv=none; b=SKUh1DNuMknhz+HTSVB0xCsB7O81bmESaYAxdqSg99w5X4uIU/DM4ofY9SHHATy0PsWS0hIzKu2m8EvSk4/pEOSkEFuLBTbwerkjR0t0aUv3w2NSU1GFsca65XW+ryiu1N5823LVAupzDwFgb89PUyGMqgspSW5452/PRuIMWp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743340164; c=relaxed/simple;
	bh=aQJ0XHn65sGs6NtxiUXiYeUBvt4Fj924GaZ8/5yJieA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H8eWZDtJBwqJzxsaToLW5MQ5OYFTQkiqiblL7cwrnIchRjVjKh2GAVxVkYqYb3pmUR/2ky7Tzph2B1Twf5bDM/5tlFYgmiK5fxSKhBWJyyhjkxuPbJgWTVi0wSAwvOJl2Vw6Z21M875miy0VQ98r3iQYGuh1HEWO3sCd+fKGahI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9YgWV2h; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9YgWV2h"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4769bbc21b0so35152941cf.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 06:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743340162; x=1743944962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=otHxdnQGm4FsPjJIQad3dVHmLl/Ou8a+L9FvFBgdAz4=;
        b=W9YgWV2h9nYitj8wIZOvIMeDhz8X4Eyxqon28pDpJTzYvb0NoZxA/panIVnCmASNvj
         6H1i9+6S0IxGxcvATlvX7BLjNzFnf+w663pJVoqL+VE46+o1aOvThkK+maev++R3vm3X
         IvI6Eh6I+tWJqTsPB+mA1qKS4iEkkUT5G1DPBWPeRm4xsv5jcxHRUiQmHzn3yzlAQK6p
         sC2rc1FnLXdMF/+6nRsK0ckHUC4OtfYFb8PCz4/iF7wHYsWHydbP66Brof+I9DsLfGHk
         79Py6znRuC0kfcJMrjGwxPK4FjMzRftJdGAa0k1xRrZOZx1K9aAbm41NrjcZmiicdBZ4
         awEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743340162; x=1743944962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=otHxdnQGm4FsPjJIQad3dVHmLl/Ou8a+L9FvFBgdAz4=;
        b=B5CvgPLGyZQo1z8TvmE2TL3O1tL6+yY+OjaO79eoOkif7W/O+jn5b8SyudRrZnwDZT
         eGYlf/1kXs3r4565eBi5PKV+M9st4ORkt2W+/f/j3saZXe1y/IINKLTQ2EanWyqCpa0T
         uqRMfNW/HHl7PGMiiCYgfNAuSAPpkrmGIkU9scojYdDB0qMBDD0CSQYZV3CYPzr7cpO5
         gEuWjb9Ow4C/9SYhDDwSQNJry9NQN7CL7KCZcsykrKkBJanuUssdxyiIEEDQfvszSZ/1
         /xjUKq3y71LD4pSwieOv3ft/SXHsDFry0B5OF2CXWPNBHce9f+YEiuhR0SsUdX2CQT0Y
         xaNA==
X-Forwarded-Encrypted: i=1; AJvYcCXwPyPuKIuQ/5fVQDW3mnXG3s2DDhlsylcj8BL2La5pILNLtugerMSnBtLwy+6TOzSxqalA6YIyNSJDMAI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ4KrUJqQYIpWIiTwevy4tqQwCYfuxooKjw9LJhT9NXgRT3V6e
	qeZTkvOI+n25CkYq89A0Z70UR1fItOynaREKkZtBm2nfNDo9LSA4
X-Gm-Gg: ASbGncvV3ue8BvG3gor2/RbrHEhLap0ktIYnpw4PscY6TN+kPdllLSo8u9FlJp8q1k0
	7e6hNgAaBX9k5Zk8bEtwDsX4zBZUpxM0rq6jmSkQ6nH3tdBkjlZ+UHupk9YSeTktuhKlk6uW8na
	TKH/ETxUdSvX1Vs0u2X0k17Jk1A4DYPQj+DofgNNFhTkQcKMCrFGLfmzR5lHWWS58kuCXUUsGlz
	lEe0CRW6CDSfNHbFatikj3sCLdL+P9VPNd7xMIQ8lhnEnTuZCxQ81sD1a0PrIrpbhHiCzv36ITc
	8rFjj+nbWj5sUgHiExXtRHjkUJ8l2FbqZlBzebTHme0bi9Y2vN1lL/KFdrTKy3Nv2QxJUvTjBPt
	DHbRU4VPFYCPl2nhwzDI=
X-Google-Smtp-Source: AGHT+IEV8HdK/DqdmO1+sj1GpGoXKylPrmqo89BfAGEMtLL+QVpJqbJGjIWVOPMDUkqeLA+AxhvjQg==
X-Received: by 2002:a05:622a:1a25:b0:476:8595:fa09 with SMTP id d75a77b69052e-477f7ae9679mr63879991cf.40.1743340161958;
        Sun, 30 Mar 2025 06:09:21 -0700 (PDT)
Received: from localhost.localdomain (c-68-55-107-1.hsd1.mi.comcast.net. [68.55.107.1])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-477831a65a3sm35687731cf.79.2025.03.30.06.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 06:09:21 -0700 (PDT)
From: Brady Norander <bradynorander@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	u.kleine-koenig@baylibre.com,
	Brady Norander <bradynorander@gmail.com>
Subject: [PATCH v2] ASoC: dwc: always enable/disable i2s irqs
Date: Sun, 30 Mar 2025 09:08:54 -0400
Message-ID: <20250330130852.37881-3-bradynorander@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit a42e988 ("ASoC: dwc: add DMA handshake control") changed the
behavior of the driver to not enable or disable i2s irqs if using DMA. This
breaks platforms such as AMD ACP. Audio playback appears to work but no
audio can be heard. Revert to the old behavior by always enabling and
disabling i2s irqs while keeping DMA handshake control.

Fixes: a42e988 ("ASoC: dwc: add DMA handshake control")
Signed-off-by: Brady Norander <bradynorander@gmail.com>
---
v2: reword commit message to better describe the issue
---
 sound/soc/dwc/dwc-i2s.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 57b789d7fbed..5b4f20dbf7bb 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -199,12 +199,10 @@ static void i2s_start(struct dw_i2s_dev *dev,
 	else
 		i2s_write_reg(dev->i2s_base, IRER, 1);
 
-	/* I2S needs to enable IRQ to make a handshake with DMAC on the JH7110 SoC */
-	if (dev->use_pio || dev->is_jh7110)
-		i2s_enable_irqs(dev, substream->stream, config->chan_nr);
-	else
+	if (!(dev->use_pio || dev->is_jh7110))
 		i2s_enable_dma(dev, substream->stream);
 
+	i2s_enable_irqs(dev, substream->stream, config->chan_nr);
 	i2s_write_reg(dev->i2s_base, CER, 1);
 }
 
@@ -218,11 +216,12 @@ static void i2s_stop(struct dw_i2s_dev *dev,
 	else
 		i2s_write_reg(dev->i2s_base, IRER, 0);
 
-	if (dev->use_pio || dev->is_jh7110)
-		i2s_disable_irqs(dev, substream->stream, 8);
-	else
+	if (!(dev->use_pio || dev->is_jh7110))
 		i2s_disable_dma(dev, substream->stream);
 
+	i2s_disable_irqs(dev, substream->stream, 8);
+
+
 	if (!dev->active) {
 		i2s_write_reg(dev->i2s_base, CER, 0);
 		i2s_write_reg(dev->i2s_base, IER, 0);
-- 
2.49.0

