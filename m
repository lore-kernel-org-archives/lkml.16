Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2083A1F1301
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 07:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749108839; cv=none; b=gJI0Xb25JF4qZwSss03ljbmgT1oAM999x/7JhfdQ2XToFiOXAudzpfv8dT2rivFihLaCisb9EMglEKV0Fxp38dUC4d/MU04lh6Aad/wbBe+68TtnjZE//PcDIOS/YvFG4SFI5zZ2zV0YDxh00IZ8iMcBONVI34PK9Be9saTX2rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749108839; c=relaxed/simple;
	bh=Oq23UztHZrFpE5MHj9Wy2J9DoFWem7fBQMScvu1GuwU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nuteleXXjbBjcdtlsStrdAWYN+K0qzAGHC8go07aHhxJbXDp77ZWgLtU++WS5SEqdLaKYJ4NJ1YFU+422bI1K4ZTf2EsH8aw6ir72r1wIPg7GlxOLNy57yHOSfRlgodygu332AylCvHffr6/E4ZhLVfpAFCMOEZAS0YNvfAT+HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=fy3gZALw; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="fy3gZALw"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-742af848148so473747b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 00:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1749108835; x=1749713635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DVZjus1ELPzuP51DN+x+ciUrQVA+2y5n7YpTYBbGMMA=;
        b=fy3gZALwmKsVSTkbcZuX0w58aEF42HDnaSu7sz1dDqQZSE5sGolpgkPpHOcOfdONR+
         BvvgrFP/4JuCWI73Y4gB+u+Cj2QMg/gd2vzS0o5n4MLQTCctyImKflX8IXPvqQAnRNQ9
         Qvx9K6WXY7bDEUAL6wkY8C+PSJ5ioQk+tqfYvWev45xny/AhsGvBG8D26CYW8ooIdvhs
         4FLNdFNL9sdypimW73EyxrXWp0LdZmGr8vI9tbbqE7mll4yvT2A6CRf51xbgbo3hrBmm
         Z4zyf8cNxtRwsY4kuhNBUdusm98YRu+P/EdDxlvp+2L7lqdJSk78ewZ81SdzJdIYJSyx
         0byA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749108835; x=1749713635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DVZjus1ELPzuP51DN+x+ciUrQVA+2y5n7YpTYBbGMMA=;
        b=eLZb8UI6/R0R25K76DWlLhtNRgm4MOobr7hP+5/s6vzYZOZSTdweSId/dQpFaRvHiD
         2WWVAqMaNalQf1fHeDs7x1K5TR02OgifExDyOlLkv3h00SYQsMiLB8GZQW+PVpCgrD7h
         Fs2xwpupP3wmn7gCT8r++OVzbZSQRBIeG6ipLov/eXk5PUuTr7EJ86qeurdcmrbo6iMZ
         4tYoW8nqW4aCo9lOvVXrW/+5d01tjeLd6PGRdkEsGd/igzaJlu54rbcK3srbXq23w62V
         6XtF00at3FB85KqTCgX6jcJ7pITSclTE4DkxAugKgzOLdBe/i3IcoN24SlzigbhtTG6m
         cvhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPuROgoAbT5lp7uzGoOjLKx0CR5b+WUerwLdGCSpYOGqbp6cLxu0XhIhJkFD3z4ggAqVFKohci3wMVN2A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxA4n+c7brsfqEKMfzbtRfZbxtEuOQjgDm5aed5Xx8mv4X4UlSI
	TJ+SvZbhTnR52GPHwJQBRTbfzBHao6ZsV1QwhzDoSuG5j61bXCNBFMygRxFUuO6h6o8=
X-Gm-Gg: ASbGncuSyTF0HWNmukzNs2wAtnvrAv/5Uq2u60kLwM/DDXCkklOenpsPc/jJjAePK1t
	4H1taAXNOgGWmgdRQC3JBeHCCXGG3BncE6EUgxxmTUlPERY0KKdC8dzMOfXQgJBbHaT9t6QPbBr
	uTpZI4ZKk20IYXz64Z48qvmyxlSJ2i7V1rnUPR9BZjbA3gf8HAjXnJSrOEQGiFMga9klxL6926g
	mVYtiu3j8PnJCJ2bcKrKhmWLqfEmN1jHIw0SKJgFhIsgsoTdg2wrY46p9O0A5KONi1MLkzmTptS
	oX5LOKRcMLh18V55Iv0ePK6NnDzJHjFXAtj7xKgvGTEtEtBrzahhGjH32vA=
X-Google-Smtp-Source: AGHT+IH0324sFIz083/koIgx+gH9KYl0BcA5zNyP6D3F8oqFko/vUktQ55Hf8LJzzH/VR98FTVsa5g==
X-Received: by 2002:a17:903:2304:b0:234:eadc:c0b4 with SMTP id d9443c01a7336-235e11fdc01mr89861685ad.44.1749108835283;
        Thu, 05 Jun 2025 00:33:55 -0700 (PDT)
Received: from thelio.tailc1103.ts.net ([97.120.245.255])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d14abdsm114511405ad.239.2025.06.05.00.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 00:33:54 -0700 (PDT)
From: Drew Fustini <drew@pdp7.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>
Subject: [PATCH] riscv: defconfig: Enable TH1520 aon, mbox and reset support
Date: Thu,  5 Jun 2025 00:17:48 -0700
Message-ID: <20250605071940.348873-3-drew@pdp7.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable TH1520 Always-On (AON) firmware protocol, TH1520 Mailbox and
TH1520 reset controller.

Signed-off-by: Drew Fustini <drew@pdp7.com>
---
 arch/riscv/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index fe8bd8afb418..86b13177f27b 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -178,6 +178,7 @@ CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_AXP20X=y
 CONFIG_REGULATOR_GPIO=y
+CONFIG_RESET_TH1520=m
 CONFIG_MEDIA_SUPPORT=m
 CONFIG_MEDIA_PLATFORM_SUPPORT=y
 CONFIG_VIDEO_CADENCE_CSI2RX=m
@@ -258,7 +259,9 @@ CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_VIRTIO=y
 CONFIG_PM_DEVFREQ=y
 CONFIG_IIO=y
+CONFIG_TH1520_AON_PROTOCOL=m
 CONFIG_THEAD_C900_ACLINT_SSWI=y
+CONFIG_THEAD_TH1520_MBOX=m
 CONFIG_PHY_SUN4I_USB=m
 CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
 CONFIG_PHY_STARFIVE_JH7110_PCIE=m
-- 
2.43.0

