Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06992620E5
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 01:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746839935; cv=none; b=tthWj2m54+O6snC+lj4GD1Hjrg84+YCaKFBwhGNhLEWa1n7dJbmPVt5DC8UMXxPk67DA7Cbqq2A+OExzhqreft1/VA1xhIGvMgsDaM06NmIjaZdikeKdpVhZOBerZuEBvyl3gaLVKhXoLKj62OhCFxXkjQUd3Qio1bAwfXSbhk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746839935; c=relaxed/simple;
	bh=Vd8MLSTM4uqn7PmAmWXghKlh2fnrsmJaQbxTzGZOE1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gdrXrrtyFUxEO0Odi0qYQ0yrGkBlr6jKE8k8qHFcx9kW51hfyirkk2/guILQvN7G4UL3+bPasEtng86rm/AB5veiysjRBMBq1lKf7skUuGIrSXaVxh5CI8Gknh4/TYD6RDmLAIytRfj8WqLqCRrgCwGa9NHqwMy6t3WkXlAS7yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NHVYzKi+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NHVYzKi+"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so19151865e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 18:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746839932; x=1747444732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sF2Bg8dFphUkCryZWbe4OS7qSU2jUKmCAqLckdO43HE=;
        b=NHVYzKi+OUYxt2E9E3HEVJ3OPHpgBoniyZcx5YHTv9DX8elgqXffxBKDB+jwRw2X7n
         91OfMNitTx0ZC/lG+AWkmkp0DMcuN8BcTr777L1fdxQFmIxPdQgPA0dB3hcEe4JA9bfO
         KYpZPVzbxXt8OXSMmStElMVkXKXZkqQUVEWkArTRXp8SWFD5p0zvrU2/z4KXU93/0YrH
         WVvsn1rCzM3a5hxtjE1L+k5xQlkvRCu4C7/keXQ8UtZYCTq21t+jWeu4usqEMWOeBjrG
         6GzuN/SdoR+slsu5sxXGnnxRkUSlNQN/V85J95pvd+OS8XrBCRTmgRy1FUIOj+pc6I5L
         eVpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746839932; x=1747444732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sF2Bg8dFphUkCryZWbe4OS7qSU2jUKmCAqLckdO43HE=;
        b=RclK77HYPYK1Ia2Ycjp2muaMzI3E1bT1CFpOgmLfp9NnrDJKYVOouKOoa1bQ0xIbp4
         CYvH8tDYk7MikyQXKQN+jowlsNd+/2/UK9xI0LkQBj8VG+4dy92HT/ZlrAfuU5mEhgrC
         CiewC4obcttM846BXCCQ07iyHCq2VXd55oTvQZUFlANaX4ftj5slAE03yLTCISaxo9TI
         YIXHMal1XnUK0KaDpeIVOQVhbKmLtd0HHiDa4PpG+XA/QOLhSK2+DfxtcBjr6MgwEWDk
         OueyjxTRfJI0wRkOJOOwH0rT261eU6dMy6Y9hAohkQF8XseW/tdJKTmkBqWZW/b3G0it
         ceGg==
X-Forwarded-Encrypted: i=1; AJvYcCVU0m+9wl9pPOACG/bdY7AqRIFeT7ToeUpi3ck5Kisgj1Jisyxi7dCJn5BCfAO9JVqfbs7aT7NDC+vjozY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzoa0xy+vSvLCufLP8ImzR/KfixUzUlK63gsgx54Ajkyj4XtSM9
	CVD6ZsaZGHpUvGSO7ug3Ds/lXE5EXM5btsjF42CKpboXHlNodknv0LdEFbcMo24=
X-Gm-Gg: ASbGncvItL1l9VA2y3t+9TWoauIguwnRoatiI/X0jV5tvt9d8lnVpBNccEWBBptwOib
	BoXmDeY9U+tvtRW2t8YSROOI2C36D1ag2ESNMed71tm9VUshlDEsVVwztoDo1p7r5rihORC0Rl+
	MIJy5e6k3DZUKuIZbw2/hvrl+yibfucTZkmSRB99Rmk+TEwyIeu389UrF+UOhAtgaeoe+O5kufb
	BE5dfupbsWsTMcTwcz6lgWL5+/r12fZYkl94Y1dgU8/ztnUO7Sne+oJDagOKLD7O+8k2pimroh5
	0uAGV8dVOmsuyOzFQz3etd2YFpiQl/ToAQIP7TDsCc6ryMcy3MXXhgloZNFL7FxDbzR8pv8=
X-Google-Smtp-Source: AGHT+IHYdvdXBuzhOXulslg3FcTy7/1wnjTVOQ8CVC6MbjHWdXZlynWwgpVoO+4Ylf2Y6Y2tzQn0Xg==
X-Received: by 2002:a05:600c:1913:b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-442d6d3dc11mr49327095e9.13.1746839931663;
        Fri, 09 May 2025 18:18:51 -0700 (PDT)
Received: from localhost.localdomain ([176.206.99.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f0easm86967305e9.12.2025.05.09.18.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 18:18:51 -0700 (PDT)
From: Denis Benato <benato.denis96@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Denis Benato <benato.denis96@gmail.com>
Subject: [PATCH 1/3] ARM: imx_v4_v5_defconfig: define CONFIG_ARCH_NXP
Date: Sat, 10 May 2025 03:18:04 +0200
Message-ID: <20250510011806.13470-2-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250510011806.13470-1-benato.denis96@gmail.com>
References: <20250510011806.13470-1-benato.denis96@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define CONFIG_ARCH_NXP so that CONFIG_ARCH_MXC won't be disabled
as it depends on CONFIG_ARCH_NXP.

Signed-off-by: Denis Benato <benato.denis96@gmail.com>
---
 arch/arm/configs/imx_v4_v5_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v4_v5_defconfig b/arch/arm/configs/imx_v4_v5_defconfig
index 875c8cdbada7..19e26b4a9fb7 100644
--- a/arch/arm/configs/imx_v4_v5_defconfig
+++ b/arch/arm/configs/imx_v4_v5_defconfig
@@ -11,6 +11,7 @@ CONFIG_PROFILING=y
 CONFIG_ARCH_MULTI_V4T=y
 CONFIG_ARCH_MULTI_V5=y
 # CONFIG_ARCH_MULTI_V7 is not set
+CONFIG_ARCH_NXP=y
 CONFIG_ARCH_MXC=y
 CONFIG_SOC_IMX1=y
 CONFIG_SOC_IMX25=y
-- 
2.49.0

