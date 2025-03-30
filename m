Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E60B663
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 13:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743340161; cv=none; b=ANjuS6Md6jKiN1hTjYNJWAepO11WS/gyd0zM37zoktUSDAYpVpjpUf9kP6k51IVdeeT0r/knPPnj1zM7Wg6MbbvJ5cG0/tvXHqWhhEAS5rn+DtAdSh3weIyoWk+R8/JopsiC51OBs5lSeCERg/FX3PZvaPvlfPCwzDUyJ3vrqXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743340161; c=relaxed/simple;
	bh=D3olxYLlBQ+nUTuxA65h4ayn7fzQD05m+AcZNVbUetg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WM+ZRCYO2gx8+bA6BBPInIAyVaJTufmjI+qAZOdvBO8apYxKxhSBeiGbzedWuY7O2rAEC0Rs3Hk8oXpCAli+muLQSfHWr4XTXWsSb0G2jgDHQSvAKmFFYqiaI1z1Qp7mRfIH2HThNSdz5RXmJRjJ2eC/QK6kaPqfm3de1H9HDCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+LORdF1; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+LORdF1"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6ecfc7ed0c1so32874786d6.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 06:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743340159; x=1743944959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+f8/d1LUJCYjyq/aaDtzvsA9nVkE0shHwGbrMegDUrU=;
        b=g+LORdF1VlzYpl4gOLrHJZ1hRP1mSfxhqfkOrglulxyh2Apz7CFRFLVmxBzjg2SSmm
         wqk6iU5KK4efV2KBaNWI8g7HXbpKmeXVG/+oOI4v4DT9lsjKBwZhHiF4zX/W+DZdXO0O
         vJVgjziHoaXTONEJfMCC0UmO2NRJDtXCL0vKXZy6pWnLrvIiDE54dZ4Uf/3PQ3rbmyi2
         mUJFI/7Xj2pVbmj+MganXA0ovKeWz21J79b3Cueq80KFN8h1Lp+XK+SsiG1XyOdUDjsD
         VQUCwZa5PZyVlNVLKKraXB0gbz7ok5zm5+qJtF3e6GFYH6r5Pegrr9Sjs+iPeN4lQNFb
         8wpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743340159; x=1743944959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+f8/d1LUJCYjyq/aaDtzvsA9nVkE0shHwGbrMegDUrU=;
        b=GexLFOfEDRXn581hkBtEho9YvdV3+G3mtfu6RZCK6Lc6FwE7C5NM/9yOZFA2Jh8hd2
         j9CMuPaAaU/2+H8ssjeKw+XJ/j/YX6aEa1Tl2IGlV8/uTmZYQ2qL9cINt0V0yOHDkJ5T
         v4zLEqeHKwbjaboQRdgkpnVqOXqEp6KuGQX36+cdCaPgMFfUspLWYsNMKLaHD3+fuWxm
         G++7ntRqR157UYW3BjwMg+I4QCTZ3/9OG59shRVDmnmfOGJr4OTP3G9nTP4jpEWbNAAa
         ikMDozV9pQ1+/8+5omONZvCfIR0pf8AiUH9v7Q/8Ca4aGv8YiPPIlSnbwIuYU/WSQt4/
         MKRg==
X-Forwarded-Encrypted: i=1; AJvYcCVSJ27/63aevQYuGhCQNliL3by8qc52skDwlxTyywjOxhffNVCHs5ahNW7Im+8PeynPpgdQLabXfM/GjK4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhfeaklBk4IhS7fbHrdnQVLB/82i0k2h5vwhiktTNPI7Vhfvta
	VyDbHqUJ4i8/RR7cLEP27MlfuwqxBvYwdV4oFfRHjRfpqnyJUglg1sjnvkxnPTM=
X-Gm-Gg: ASbGncvtCbopna1nb/Pz7x6vPY5jtqDJal1ZdtkixmDWV0pOMaN/b7NT5m+zIHCZ0La
	AAEU7wemfpE/Sy+AclPHXUEwGvZ+451q6WAYP7Y107b8OL/N2zQOU7J9s0jN8D5kjGhfQE/ZVaw
	aiUg1eLEvUOnQXUubWy87vRktLuKeBqvelgiCqu4WFiOS/2ocsYWRGEaZjt8DH3+B3p5n1se3RO
	+o1QJervcTNIGLIGtnRO6j3kbbsscEPoRWA3Gyyx/J+dR2+6dsPJSKwmGQpEBsHxLwWAgH08NBq
	gFiIWtFCC1nwxv6ofoOjnBIYDboj5mSx4BSJxKlnig+6IvLt5pXNrTi9mKZnAIyS35Ku2HhkSkm
	dY0awPpsWnWA9uHcqf2o=
X-Google-Smtp-Source: AGHT+IGeW8/4t87eo3BmiJ5DqyKAxUo+ucEX1aeMXgaM2kqMDezafr8XhvZLkCdxwkgarITLCh9R1g==
X-Received: by 2002:a05:6214:1bc5:b0:6ed:df6:cdcd with SMTP id 6a1803df08f44-6eed604410fmr77297666d6.21.1743340158836;
        Sun, 30 Mar 2025 06:09:18 -0700 (PDT)
Received: from localhost.localdomain (c-68-55-107-1.hsd1.mi.comcast.net. [68.55.107.1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec9627b36sm34011146d6.6.2025.03.30.06.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 06:09:18 -0700 (PDT)
From: Brady Norander <bradynorander@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Aleksandr Mishin <amishin@t-argos.ru>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Brady Norander <bradynorander@gmail.com>
Subject: [PATCH v2] ASoC: amd: use new ACP dev names for DAI links
Date: Sun, 30 Mar 2025 09:08:45 -0400
Message-ID: <20250330130844.37870-2-bradynorander@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On AMD SoC platforms with an ACP2x gpu ip block (such as stoneyridge),
the amdgpu driver will create several platform devices for the ACP ASoC
driver to communicate with the ACP hardware block on the gpu. These
platform devices include dma for audio and one or multiple i2s
interfaces. The amdgpu driver has always created these platform devices
with automatic ids. The ASoC machine drives hardcode the platform device
name. This creates an issue where if the ACP platform devices are not
the first to be created, the ids can be different to what the machine
drivers expect, causing them to not find the ACP platform devices and
failing to load. Switch to using static ids for these ACP platform
devices so that the names never change.

Depends on patch: drm/amdgpu: use static ids for ACP platform devs [1]

[1] https://lore.kernel.org/all/20250325210517.2097188-1-bradynorander@gmail.com/

Signed-off-by: Brady Norander <bradynorander@gmail.com>
---
v2: rewrite commit message to better describe the issue
---
 sound/soc/amd/acp-da7219-max98357a.c | 8 ++++----
 sound/soc/amd/acp-es8336.c           | 4 ++--
 sound/soc/amd/acp-rt5645.c           | 6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index 02b04f355ca6..42aa009c4e13 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -517,11 +517,11 @@ static const struct snd_soc_ops cz_rt5682_dmic1_cap_ops = {
 };
 
 SND_SOC_DAILINK_DEF(designware1,
-	DAILINK_COMP_ARRAY(COMP_CPU("designware-i2s.1.auto")));
+	DAILINK_COMP_ARRAY(COMP_CPU("designware-i2s.1")));
 SND_SOC_DAILINK_DEF(designware2,
-	DAILINK_COMP_ARRAY(COMP_CPU("designware-i2s.2.auto")));
+	DAILINK_COMP_ARRAY(COMP_CPU("designware-i2s.2")));
 SND_SOC_DAILINK_DEF(designware3,
-	DAILINK_COMP_ARRAY(COMP_CPU("designware-i2s.3.auto")));
+	DAILINK_COMP_ARRAY(COMP_CPU("designware-i2s.3")));
 
 SND_SOC_DAILINK_DEF(dlgs,
 	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-DLGS7219:00", "da7219-hifi")));
@@ -533,7 +533,7 @@ SND_SOC_DAILINK_DEF(adau,
 	DAILINK_COMP_ARRAY(COMP_CODEC("ADAU7002:00", "adau7002-hifi")));
 
 SND_SOC_DAILINK_DEF(platform,
-	DAILINK_COMP_ARRAY(COMP_PLATFORM("acp_audio_dma.0.auto")));
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("acp_audio_dma.0")));
 
 static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 	{
diff --git a/sound/soc/amd/acp-es8336.c b/sound/soc/amd/acp-es8336.c
index 0193b3eae7a6..b16dde0e2987 100644
--- a/sound/soc/amd/acp-es8336.c
+++ b/sound/soc/amd/acp-es8336.c
@@ -137,11 +137,11 @@ static const struct snd_soc_ops st_es8336_ops = {
 };
 
 SND_SOC_DAILINK_DEF(designware1,
-		    DAILINK_COMP_ARRAY(COMP_CPU("designware-i2s.2.auto")));
+		    DAILINK_COMP_ARRAY(COMP_CPU("designware-i2s.1")));
 SND_SOC_DAILINK_DEF(codec,
 		    DAILINK_COMP_ARRAY(COMP_CODEC("i2c-ESSX8336:00", "ES8316 HiFi")));
 SND_SOC_DAILINK_DEF(platform,
-		    DAILINK_COMP_ARRAY(COMP_PLATFORM("acp_audio_dma.1.auto")));
+		    DAILINK_COMP_ARRAY(COMP_PLATFORM("acp_audio_dma.0")));
 
 static struct snd_soc_dai_link st_dai_es8336[] = {
 	{
diff --git a/sound/soc/amd/acp-rt5645.c b/sound/soc/amd/acp-rt5645.c
index 72ddad24dbda..11d373169380 100644
--- a/sound/soc/amd/acp-rt5645.c
+++ b/sound/soc/amd/acp-rt5645.c
@@ -108,15 +108,15 @@ static const struct snd_soc_ops cz_aif1_ops = {
 };
 
 SND_SOC_DAILINK_DEF(designware1,
-	DAILINK_COMP_ARRAY(COMP_CPU("designware-i2s.1.auto")));
+	DAILINK_COMP_ARRAY(COMP_CPU("designware-i2s.1")));
 SND_SOC_DAILINK_DEF(designware2,
-	DAILINK_COMP_ARRAY(COMP_CPU("designware-i2s.2.auto")));
+	DAILINK_COMP_ARRAY(COMP_CPU("designware-i2s.2")));
 
 SND_SOC_DAILINK_DEF(codec,
 	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10EC5650:00", "rt5645-aif1")));
 
 SND_SOC_DAILINK_DEF(platform,
-	DAILINK_COMP_ARRAY(COMP_PLATFORM("acp_audio_dma.0.auto")));
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("acp_audio_dma.0")));
 
 static struct snd_soc_dai_link cz_dai_rt5650[] = {
 	{
-- 
2.49.0

