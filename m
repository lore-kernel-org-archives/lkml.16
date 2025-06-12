Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFED2F4309
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749735874; cv=none; b=oto/DiKjM+HaTc7RKRrxK2L4g4UKPuabFfKtLsc/pxMtBDySNbuke2KtpuafP0/anwIi4oX5fz/DahaRVj6ZFsZ6nZGGgHLGovu+dV1LQfABhr07u1d/QX0eH4kCImW4NgUWe4TYQX2TZ6PDNVSByAx4b4JxphSTrF5zNWvALgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749735874; c=relaxed/simple;
	bh=fmLKNgtKcJwjP5FDnh9DbIUvWbuQxYQ2VpHaBRIju80=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u/D0GRNiIkIOcBse5uR12SdL/abupNbfsWxkxQcoSPUUXK3lwxsQxDNPhpBajLCUkN2pwQpRtl9gQC5aNb2lq//ym540RUp/PAENhljjm/MR+mUGWF0W7IEqxLbgOMhZgHiFcZ3QCGtFZna/FEWoPqUa9H2+KJRVECtmmVbqrJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eXXiabof; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eXXiabof"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-453079c1e2eso1051645e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749735871; x=1750340671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TAPAekU/LrZe1nJf7fcuyTNybcW9G7I09lCZHvf9oYc=;
        b=eXXiabofD51o+LER7CAup3y0CTPMzQZvEfJOfKSfntayrrx9ogu2RqBxpV8pjniYUd
         fB8sPPdpX2FCwG5JIskkbTBtMYiIah+tzFDQOKEHbQADK0tRCyqv+iDL6jxMLj4A4o4S
         7zaX213+uFJJvxe9XGWDFp8GjYnmCehKZpDU9VPuSuskRulVLh/Br1mf06QE/bJqyYOl
         tldOL/TPqia6/4ZaWzgjPEn3S8aoS57eYU1buClPSCMQOrIKLQ2VtDoUXkms+52ml8JB
         JtbWkx8F5ASsX85p3x1x2sW1F11aMW7T4/rKInmsEQoxXvYs38nfRavnY3HW4Mtc5rc3
         v70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749735871; x=1750340671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TAPAekU/LrZe1nJf7fcuyTNybcW9G7I09lCZHvf9oYc=;
        b=Da36kU7JboSTmzF3g1rLgKEum5d53Jjl7vH+QrfyERKRAxpH8J8zEn2Rv5c1hX72YJ
         2bEOoTyRrY5ufsgVTSkojMpSLIeKyREqFHEMesDJ6Nh66JJPepUEn3M0WjxD/lLr5cZ9
         1WzHVKvOX/j68qg3944U85BBTEdtiHlafnTXeZE78k6Q1/NApBATsieIQZJgg2s0ZMcm
         d5ZqCS0x2aa2yXA3Ei9sWnNrHoQXrQwEgLat+GXQ80cBY2gzn2naV3qG1oZXUjtJOZTI
         APDN7CIUcGVGm3FVWDlYYo0ZA32uvXHU2wvhUyKrCiYXM3rb5zp9Dl4DCx2jkO0F+pOS
         zspw==
X-Forwarded-Encrypted: i=1; AJvYcCVQLGvb0UyBNXw+swStYQkY05nQE+2DF1NUOYvLIR2GbQU/zgTV8Kl+apyf5Xc8GUqYs0n4XwZlu2w5CcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8nFeI0X1A+RseO5t89xoW1ms+UyVG3OaGcsV4DFlhkUfCUk1P
	qma/p9bPxOUKAqJLt2VpbfFL6n7y7RY8KXMXYi8x6jO2YtmVwN7Wy/84hGS55N4FPUAfukjiUXd
	tyLXl
X-Gm-Gg: ASbGnctyZLzPUeS3ihavlzPcqekcsZsx4rIP2PgS46IBugOfn2Ilc1OlN2+SynOpkyM
	Sj0kZhvHpqcU/eb/DWgjFp6p64lentxtNcfi9411QmTxzhQR1PMWq6hY4GVvvixD2HEf4KjXo9T
	ggRemng8sR9xiQpjamnOA3CLKbWOrv1msAANGhQ74d8MshigSL2cpfQ6UpeofCfNYFvF7yMV/WP
	4iQlufWZvSHwUpr26YdbHNVP5MB/kfFN12GO7eHqabXeS8uz8FYO4+d0Tr4FHfNICgw8ttfZ/v9
	VPmJkdNHNaK4+ZDZ9K40QfatgjcNLgOJVgwUflaAq0mZJg1ifO3NC7DuzulR6jnz8DBaCOMP12z
	yAEWEVFsY
X-Google-Smtp-Source: AGHT+IE+fhgoMi57FWpyHSYtxYdJ8jLOUeAusqX+ark2CzDRRR4iGxpFzDQ3xzR11gn00SA1jvJm8A==
X-Received: by 2002:a05:6000:26c1:b0:3a4:f8a9:ba02 with SMTP id ffacd0b85a97d-3a5586b8858mr2485885f8f.1.1749735871092;
        Thu, 12 Jun 2025 06:44:31 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561976f13sm2053661f8f.4.2025.06.12.06.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:44:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	asahi@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 1/2] arm64: defconfig: Switch SOUND to module
Date: Thu, 12 Jun 2025 15:44:22 +0200
Message-ID: <20250612134421.95782-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2107; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=fmLKNgtKcJwjP5FDnh9DbIUvWbuQxYQ2VpHaBRIju80=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoStm1fWX3mgWeCfVDeyKr/swV92niRZ1QIQm2L
 x0clvJz/4OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaErZtQAKCRDBN2bmhouD
 16UJD/4gbBqdnKUQ84IoVn0fZjjNqBAcba0ix34ZycfQc2PNtNzj0qZHfGCJGVpQOxzcgkoXOEq
 jhWhHkYFtIo6Lsg0VwNqL/L3ekD4JJHQGo960GpnogiLCrnrbpxbshD0lwLcbDRQXIQjLWt0tQj
 fKUm5PbsBezIb+pefiu1vvOmYAVgD32POwCeudbqt8eq6Zm2Vx2tJ6uWY+oSu5O+7pzdMNNFePK
 7dGjAVGZ5KCVNJozzdJhZlY1YGvqXQM5oC8q1P43A6oo4Ie9b5V0JsNahMzjraH5cludNg96ZLC
 v/4snCT7kkqVoiOHeiPRPOSHOQ89QRyEz70ytN9gU7ZtO9wEKVq6t1uF6EIhjG+BIvELqdO/Uah
 HFLOq6ud/MkyU+F3euRxLvrUvNotkQHr2yQyQY6BGRsJKxQi0jodb8ePJA8KOajiIE4KEUry0dy
 Fyyasl030WAwpGABh4Hf+bd7QZYRerUBaFPYpplwas95E50QgGjNnDDMm7QbPoXiIWFmGA+Yw3K
 xIA4t5W9xTZFf84FQgC8P4MaDrkN8qDh1d6qXTtDDkYqklXdv9bwKe2seNkDmzbY0vziJiDXXDS
 hqBYYohbVXBdyN1IWxk1IP1NQvbo9nwur4ejDfTY9tbEJVoyaTO6gsebVFDwtW/m+FAC5Wu1SJD wDzMrRZ67JlN7Ew==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Sound drivers are not essential to boot boards or mount rootfs,
therefore in effort to reduce the size of kernel image (and boot images)
switch the ASoC drivers to modules to decrease the size:

  vmlinux: 152864 kB -> 154528 kB
  Image: 39391 kB -> 39067 kB

No difference in resulting include/generated/autoconf.h, except making
modules: SND_SOC_SAMSUNG, SND_SOC_SDCA_OPTIONAL, SND_SOC_APPLE_MCA,
SND_TIMER, SND_COMPRESS_OFFLOAD, SND_PCM, SND_SOC_SOF_OF and
SND_DMAENGINE_PCM.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

If patches are fine, I will take them via Samsung SoC.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Sven Peter <sven@kernel.org>
Cc: Janne Grunau <j@jannau.net>
Cc: asahi@lists.linux.dev
Cc: linux-samsung-soc@vger.kernel.org
---
 arch/arm64/configs/defconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 62d3c87858e1..14fcd0a85f5b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -979,12 +979,12 @@ CONFIG_BACKLIGHT_LP855X=m
 CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_MONO is not set
 # CONFIG_LOGO_LINUX_VGA16 is not set
-CONFIG_SOUND=y
-CONFIG_SND=y
+CONFIG_SOUND=m
+CONFIG_SND=m
 CONFIG_SND_ALOOP=m
 CONFIG_SND_HDA_TEGRA=m
 CONFIG_SND_HDA_CODEC_HDMI=m
-CONFIG_SND_SOC=y
+CONFIG_SND_SOC=m
 CONFIG_SND_BCM2835_SOC_I2S=m
 CONFIG_SND_SOC_FSL_ASRC=m
 CONFIG_SND_SOC_FSL_MICFIL=m
@@ -1021,12 +1021,12 @@ CONFIG_SND_SOC_ROCKCHIP_SAI=m
 CONFIG_SND_SOC_ROCKCHIP_SPDIF=m
 CONFIG_SND_SOC_ROCKCHIP_RT5645=m
 CONFIG_SND_SOC_RK3399_GRU_SOUND=m
-CONFIG_SND_SOC_SAMSUNG=y
 CONFIG_SND_SOC_RCAR=m
 CONFIG_SND_SOC_MSIOF=m
 CONFIG_SND_SOC_RZ=m
+CONFIG_SND_SOC_SAMSUNG=m
 CONFIG_SND_SOC_SOF_TOPLEVEL=y
-CONFIG_SND_SOC_SOF_OF=y
+CONFIG_SND_SOC_SOF_OF=m
 CONFIG_SND_SOC_SOF_MTK_TOPLEVEL=y
 CONFIG_SND_SOC_SOF_MT8186=m
 CONFIG_SND_SOC_SOF_MT8195=m
-- 
2.45.2

