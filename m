Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7412207A18
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 11:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749208682; cv=none; b=cz3pLooGRajQJlg4gzigbuLeu831sUdG4jaDI+BJ08S2+TCuiV3go7Z/kHi/cP7jQ5n+oa5PF7fjnQ1hPLEkln0gPGyf2IfSPRQ/zdOb11VpyOk9BspviMfYZqG7tkqkqqVYm2KQCXNUkGlTBogvBBmsNBXtQCxwYXeuWONVDU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749208682; c=relaxed/simple;
	bh=xqceFklevNKHrB4ZeBPwo3lRayjsO/IEtbJhI2UtAgA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nPH/DqZyHDKg/HFbxahGzIFQbFHF6Eck8+LAlzfdq83U/fBukkQnvzWH49h1t+ovm94Nrfa4AIVjLi2JN3df4hi1Rqhp7Pd6oIw7o/pa9rolQtO96LAdLQj/zxd4NELFPMaT3DS7DTKSv5SeWhyCTu6+J5aZDuIuGu7lr1bOy6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=GKuliRjh; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="GKuliRjh"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ade326e366dso20982266b.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 04:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1749208677; x=1749813477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Do+QkiJD6NZpQLNVX8MWxR+5B4FmjG9ealql6MxkGsQ=;
        b=GKuliRjh/3XQYYGRR4O1FIoUa7x4jjtwAglDorwOy/82DyRUFU+vIAL+r/bcUtL7Fn
         o3xuR1836fE3oss3v/3J1qAJZon4UHZCazi0vfZtRo2C5iYX55uDuV0+2zOX8Y41rKlQ
         iU7C9VKz1HxQJo3Evfec/iRDbs7RUOkjBr5e9U4+dSgvL2awhD5MIFDcXwIByUshzBVb
         NrozqBNUi7igNkxzizL3+wOW+uQWlasOeDNG1O6LyaKUUXZoX2DK8+qCMn7CYPFYP6Jt
         +2U1rIW7Srsjd2HxJmLwzuy+Uzf3//hne1ChpqDtlgXfUryqDp+lFO8Vf756/eM3xKCE
         ffzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749208677; x=1749813477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Do+QkiJD6NZpQLNVX8MWxR+5B4FmjG9ealql6MxkGsQ=;
        b=AmGRMl591L61ma3wHHdQSdcFmd0q+/9aCc5XlmA5AnuLu0Bun2PZGkAGCVzTufT+qM
         GhxGS21PVPQuTm6YIQAYsGWe/mkPa8aj7FuSUVu7BoWM0ogbM0fgpfxVrYzWiTqTTB5m
         7j1i1BLgO1nneD0zudcymjBY5GZT6wo0FK3X9mLKx6apAHQ1skzBf57H7VjXTfhUFfqV
         0ctgQkHS/TiAPbTpW6Sh21hgMZhLzRZsJC095qhSFbownXXqoaEJrR8vMoQuZryUlcxz
         bG8QpsXQ0dPUn2JwwZBOUEkgsZaVIGokl3mRFYDLvWuNo2pEszHC0tE86yhhgmuoNefQ
         AJlg==
X-Forwarded-Encrypted: i=1; AJvYcCXsNBPvBLKIQy8DroXL7nyWC1La6SykxgMy+Pi/IT0YVWm8g2JshpjUDid0XWGiKV/dPRbqdAHJKO2lx+A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8C1D/ts52lkPP27aKLpvh5FQ/zRGIXuVaG1YBVXvtyOuCCPO9
	BjW7tYuSSbZqRJzd4+9j8WmUoyXjk2lRAFrmj5Y7pZqGclvlR8wYkdb7yGaiY1+zNSY=
X-Gm-Gg: ASbGncsbt8ZfDftCgF+Bf6Jf3TDGHg2bmmuhb03ZsnCXRRoYCi8wc+nnOiVvYjYjW0M
	T/JuoRTI23Pj0etfufiSWMK18sR3AUY4rqrJLKwnZ/wkxyrXnfWNhlKVIizCWww4rqqIETHP2di
	A6NSkmk2q+HPcKrApINPmqTy2O9caOJ7BNVbwnytdLnPXSTEzZrC8las49eKsy1rYrFZCfbtG3i
	eTXNcxFegq2EDUVPLTnaGEnv3a5L8z10JGijzseqQBLyz9owzgSk36NL8ZSdFli2EjzvmIzVu0N
	FAZk42Yg6mRYJvJs5FL20VKoIaJaG8aiO9aBqzKGCuOzwp0sN1JVWs+90zArCpC+SN/SO/L1VV5
	zxrS096ECST0tzi9D
X-Google-Smtp-Source: AGHT+IHWDvzZ+cK5XGmhp46aq4fLVkiHMu9QfV5rZevpbF7hqhSG/HrvSR909QCTjWOMJuFnjrtBHw==
X-Received: by 2002:a17:906:c14f:b0:ad5:55db:e40d with SMTP id a640c23a62f3a-ade1a978c16mr236485566b.34.1749208677061;
        Fri, 06 Jun 2025 04:17:57 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc7b566sm98704566b.164.2025.06.06.04.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 04:17:56 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	len.brown@intel.com,
	pavel@kernel.org,
	ulf.hansson@linaro.org,
	jic23@kernel.org,
	daniel.lezcano@linaro.org,
	dmitry.torokhov@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	bhelgaas@google.com,
	geert@linux-m68k.org,
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	fabrizio.castro.jz@renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 0/2] PM: domains: add devm_pm_domain_attach()
Date: Fri,  6 Jun 2025 14:17:47 +0300
Message-ID: <20250606111749.3142348-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

As a result of discussion at [1], series adds the devm_pm_domain_attach()
and uses it in platform bus probe.

Please provide your feedback.

Thank you,
Claudiu

[1] https://lore.kernel.org/all/20250215130849.227812-1-claudiu.beznea.uj@bp.renesas.com

Changes in v3:
- dropped the detach_power_off argument of devm_pm_domain_attach()
- use a single cleanup function
- fixed build warning

Changes in v2:
- add devm_pm_domain_attach()
- drop the devres grup open/close approach and use the newly added
  devm_pm_domain_attach()

Claudiu Beznea (2):
  PM: domains: Add devres variant for dev_pm_domain_attach()
  driver core: platform: Use devm_pm_domain_attach()

 drivers/base/platform.c     |  8 ++----
 drivers/base/power/common.c | 50 +++++++++++++++++++++++++++++++++++++
 include/linux/pm_domain.h   |  6 +++++
 3 files changed, 58 insertions(+), 6 deletions(-)

-- 
2.43.0

