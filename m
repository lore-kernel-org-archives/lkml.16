Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6321DA53
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 01:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746839934; cv=none; b=keO7v757rgyJ2Wl2eeqaeKI95s9DefoNnlI/r5AJvjzvi7aERqCwk3hUmoHzNW+Icvh4pUYvFFmm3Odb3+MMR7RxpI7ZIXjNBI/WG5lkBMp5G+X0oMRj9af992P+SgFUnka4fo/05zJhWzP4vbEoAtrj7+6T4cYafRsWDVmk1ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746839934; c=relaxed/simple;
	bh=PbYFQjdoKu69RC4WNgwhi5aZfsI3D2anxiI+WrXsHYc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oO9NF/GUXKGt94gfr6nFgbJIGXDsuWvyZW3dmP/FmP3h9KmY/OffYbsJBmHlcVnIDPBMwdZhzJ0sqCWw3bBQtC/WUHmqK+seRUMveu16Wp5eti6OulLYTiGR99wEAociM1m72+rD55Zcjz+G1YierMb3ClUwTmqNMHpJQdzbPnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fGeMwD2f; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fGeMwD2f"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so19636255e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 18:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746839931; x=1747444731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lgefQKrkl7AUiVIowJ5uHO9Gz0mmelQXe1AybeWFtqE=;
        b=fGeMwD2fe6nNtDG8ZjnO0bE59Ts2ROEp3MANzcFKwPruebLu2cymGPVMCq/DplzZqw
         nanivuqFulYjIOQ23t06i4qtxoNxGLR4EhLvchk8eDFyStZPRI1Qk3c2y6lYpA9JQ1uj
         zwguPf1mu787mLxGVzDQTUx64OPshlCwl0ymAgniQzdHndpzOBkLj6FQ4cg62IE8qIvD
         Yr/bsggEtUHUmfwXat5cRn5KDOQjjgLnvL9Fhvw82zU4mwHhRLDIxmFDX0MOuAablotc
         E8wMYgzKnRfurftuYMiSLmGHwgRlpoIIGEhr8G0YB6JOUQL2ho5gP5+xrtlcriBQmQPN
         Sxkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746839931; x=1747444731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lgefQKrkl7AUiVIowJ5uHO9Gz0mmelQXe1AybeWFtqE=;
        b=r6v3X3NU0mMXyE5et9R5qGxFo/VPYt45nnzvLKEcooutRgb3AGrcayVpXwxaO6vmnw
         RLF5rhHrOtX1i6IbHnScvuOyPS74FTU4pJkEpLFqGi57NcR6M81nyoEEFmkkV+A/+enC
         /iXVdamo3hYdTGH2BtkPQk0pbBNQXC0X/pd4KEb4zCgs9xKt+wjICDTn/GXhoKtYtm5L
         wg5+1SG7y/wTUJFNBfFxQIMB+2ySBuBwiK7KGeyC4Mb83w2hJu0wypWqBQCgWz4ykw4d
         VOaDZ6C+7KR1WzFEOdUrRuU7A08a7ez2dtadbTYy/+kWR4oYmw+wsFNkWVXYVqTWNYuX
         hw+w==
X-Forwarded-Encrypted: i=1; AJvYcCVXrMOqxvm2QyCWrkiugtowYpzl92RerJj7wmUL+Wr4Fd/XqbNUNlSWBMhN9ADnUa8qZMk43TsNTQEYx5E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/obs6lxfwxzce0btlGbaAQBKVthv8Ajvhelo5Ie1FGtrvHaam
	CY1yVwdUeH8jCxtAfzSEyfEb2UDGn0oOWFgRqtMMad2xMdRXA4Ps
X-Gm-Gg: ASbGnctyI7mf19RMaKHCkW+XOrGoWcZtVAbDXGvBIJD3u5KJbFiS8x1hIeuie1UABSp
	w3dNdIQITD37wx+EORDiwZ2RFmYuVLo+FMo2qqH8jE0SjYt0Dfl7hDWkIplrWLuJiB8KlIYguUg
	cq5qmlF47YFAxaZHMuV2p0zLRr2CtkQqbnurxwVi8m+VUXNsHlYo/IwT3x/z81HbJgA2ND71PCn
	XvFuQcr6Be/FHkorGdfyFTZgZImHxnIAupMnGzBPwDDepfXbnFeyrSavVChM9QGrZzj2hbETqch
	kr1xbmG9LhN4IfMaG59ejrlWptfsEz07kWZ5KTT/KF8NkXYPq+vv9zNIaiXoJBftc2fhw5qM9Km
	krnqH7g==
X-Google-Smtp-Source: AGHT+IFnYaVPCAzu64yluN6ujyxlAajvDa+pg82hQpa7k6WPDQeLMevDuZw2bzKwlYilO6uHfOQAvw==
X-Received: by 2002:a05:600c:3586:b0:43c:f85d:1245 with SMTP id 5b1f17b1804b1-442d9cacc19mr33564445e9.17.1746839930843;
        Fri, 09 May 2025 18:18:50 -0700 (PDT)
Received: from localhost.localdomain ([176.206.99.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f0easm86967305e9.12.2025.05.09.18.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 18:18:50 -0700 (PDT)
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
Subject: [PATCH 0/3] arm: fix imx_* defconfig
Date: Sat, 10 May 2025 03:18:03 +0200
Message-ID: <20250510011806.13470-1-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Compiling the kernel using affected imx defconfigs lead
to a hard CPU crash that reaches a state where each register,
including PC ends up in 0xDEADBEEF.

That is because the SoC support depending on CONFIG_ARCH_MXC
gets disabled since CONFIG_ARCH_NXP is not defined while
said feature depends on it.

The default arm defconfig is unaffected as it defines
CONFIG_ARCH_NXP=y correctly as excepted.

These patches solve the crash causing my confusion:
https://lore.kernel.org/all/c84e8246-8104-4409-8d95-389d61bc07af@gmail.com

Denis Benato (3):
  ARM: imx_v4_v5_defconfig: define CONFIG_ARCH_NXP
  ARM: imx_v6_v7_defconfig: define CONFIG_ARCH_NXP
  ARM: imxrt_defconfig: define CONFIG_ARCH_NXP

 arch/arm/configs/imx_v4_v5_defconfig | 1 +
 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 arch/arm/configs/imxrt_defconfig     | 1 +
 3 files changed, 3 insertions(+)

-- 
2.49.0

