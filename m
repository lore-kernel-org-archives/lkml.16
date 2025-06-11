Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D9328136C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749646865; cv=none; b=mQGIuUSmyZ/htzRs6lqMJC6SvQeIVNu7IZ4BgoL6DeZM/NbhmmQjR8mPm+i4Phawl3cQ7Tc/MBQRQ8DKDk0ILNA9c9OUa7ILJy/Ve2kxpjVMsp/K5FehhmVKajJ8hLPMVD4YqTE0hG5DT5Ljjv7xseO3Em/ms5p0DjPDAUB0Gws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749646865; c=relaxed/simple;
	bh=OUo46ask5zEdNnxgtDRLYOxKjqeZYpKbIvKQrOHiQr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ra3lp8BQ39yLAZoHigX9yk/M6esZGshyxMK3I0YTXckaB5zeeWyhr/bb0a7f9nkQtbcuWK3FYCOc7sxvf5WTbErsZc+hc8szJztuL3ApRKhQb3H75GoGuMztAUVZ9TW/anasq3DR2FUMFeoUQx3eIQ2ASLEw35iuDw4cZbXLlxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=QbPMM9gW; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="QbPMM9gW"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-235ea292956so62935285ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749646864; x=1750251664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSKx+jiwSQ8DJGzzvr3skZPVBhTTim+uSj665SiqoD0=;
        b=QbPMM9gWoczJsDC0oLzWD3iFJK53GT6JRMtpLCBIDg+Ub+xFO9Jif9egm9lljW8vtR
         rWcjApI4GscBPCBAOcRJ8G2HP0YMlc5tCZ6RBzf/SD7XRdiwQbiaGNdX+vNcUv+UwVYM
         nnbFUE0yK8TjEh4/8+HlIDZjs+XVJsdOvYOf/JlO2Dk0aYZhUDpcia3u8+eUcNyubEdQ
         lNLHYmg5zsXzQh7NeJS1MBPhJIJHuasHIiVBTxN2mzoImm4t6Mm0GAF6qFsdN4FCk5gl
         KsMp1SOndgeKTghBNQKTTh0fiWiJcgFdkfekkyzZXiVZUP8gqbFJ4DWOvzhTx7IrVjRZ
         HRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646864; x=1750251664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CSKx+jiwSQ8DJGzzvr3skZPVBhTTim+uSj665SiqoD0=;
        b=WuWxlWtUvUoi17DQwU+bxFp8Fb0P0XjmDnJDoyFe2huoOj4kyz5VVI+i506aKJ5X9I
         G4mmTsoENEKBNCNmPjV04M3wZp/mJAadD9YLGkShBoyFLEv4qIOtC++6ImNAq9B7KTms
         GHftzkG3bi7H7Fc9NDn3sJJxTkEhAAtsDL3ivNx9TQeLFIW7vdea1DVRnkxAf4JgLc9c
         Ta3YWy6o12HIwppIMKNopnbiI1WGATYZnr47BvJOpgTyPcpS++VDjUF98yAtLbXexft4
         GMlk53RtTsbWIsFZIMS0IjU3qInd3JwawduHHCoi1CTF+lrXVqUKo4klNSuxiIijekl4
         C4bA==
X-Forwarded-Encrypted: i=1; AJvYcCWx3hIUO9tlIG+aZ0znYIt0NesOzogg6Q7OvrOtfXySd2ipC/iqU+3W/30OTHM0G1jeARpfPCynfabvvwo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3+RLMeWu/E18p8OoVJ8hQgpWJwFujks9C1B5JfKcKkmPgbmQ7
	hqcrwNuTWHg65i+sFDgy9aTATb7HAT/ML18Who2FWTKJw7d8YDquAhFXhGCQngkdClg=
X-Gm-Gg: ASbGncvFL2jr0gAN2rTDW+81R2xiXV7oSbqdS3MVngGURPAnz5ku7HndKu/KXplJPL9
	4ISVci3zordqQrAhrecaz7CljXJcDnjhsBZ1DQJckF0Eeruaw/EqwrjyE2/IY2NQvHpboplZJ7Y
	R0AEPN14M6eEVHxstUajMfyIZZzSf2u7Ox3IodAEoNdw1d6YXJCG09jSETedpK7MclV/PzLX7Sj
	TYF8raGWYMhCFwRrLQe9K5P0KfRpKMKCMKcj/IuZN0yBJTOIrHotaCngtDfaW1UkkKZ6N4q5akd
	ghI5t1bUzu92rR8fxwlPSbh+epqhy86MII7KM5GLqgNOoIy5fHXOr3H1V5OaKfQKlEJ34kDWnEr
	YS0FshPnhns057Q/u83WZec2JYOLCgMN2
X-Google-Smtp-Source: AGHT+IHRhbcivXCxN135O16ueeb4/aUJWfnS89ixSiurI5FZ7uV83frEUoZkuyXDNWNmUKyh7r0P9A==
X-Received: by 2002:a17:902:c94d:b0:234:8c52:1f9b with SMTP id d9443c01a7336-23641b1553emr48488375ad.43.1749646862200;
        Wed, 11 Jun 2025 06:01:02 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a00:31a4:6520:3d67:ceb1:7c60:9098])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030925e3sm86984115ad.53.2025.06.11.06.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 06:01:01 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	emil.renner.berthing@canonical.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	joel@jms.id.au,
	duje.mihanovic@skole.hr
Cc: guodong@riscstar.com,
	elder@riscstar.com,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 8/8] riscv: defconfig: Enable MMP_PDMA support for SpacemiT K1 SoC
Date: Wed, 11 Jun 2025 20:57:23 +0800
Message-ID: <20250611125723.181711-9-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611125723.181711-1-guodong@riscstar.com>
References: <20250611125723.181711-1-guodong@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable CONFIG_MMP_PDMA in the riscv defconfig for SpacemiT K1 SoC boards
like the BananaPI-F3 (BPI-F3) and the Sipeed LicheePi 3A.

According to make savedefconfig, the position of CONFIG_DWMAC_THEAD=m
should be in another place. It was updated in this patch.

CONFIG_DWMAC_THEAD was initially introduced into riscv defconfig in
commit 0207244ea0e7 ("riscv: defconfig: enable pinctrl and dwmac support
for TH1520")

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 arch/riscv/configs/defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 517cc4c99efc..83d0366194ba 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -134,6 +134,7 @@ CONFIG_MACB=y
 CONFIG_E1000E=y
 CONFIG_R8169=y
 CONFIG_STMMAC_ETH=m
+CONFIG_DWMAC_THEAD=m
 CONFIG_MICREL_PHY=y
 CONFIG_MICROSEMI_PHY=y
 CONFIG_MOTORCOMM_PHY=y
@@ -240,7 +241,7 @@ CONFIG_RTC_DRV_SUN6I=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_SUN6I=m
 CONFIG_DW_AXI_DMAC=y
-CONFIG_DWMAC_THEAD=m
+CONFIG_MMP_PDMA=m
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y
-- 
2.43.0

