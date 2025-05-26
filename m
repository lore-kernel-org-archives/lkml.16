Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3CA1FF7BC
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 12:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748262082; cv=none; b=jwMuGI4vtX2WXTkFoDpHqW8qAMTlVtbfb3MSXoL0pDMlNCpht06udNSdo1InbRK1ak1QaayxVjq6nRyYzXsVkYPreBKmgolq7/VKkWMkJN6PCybLpKHi6l0koO6QaqMBH1BzCWUYNlPv/A+suRq5CWoyWHWLUV6SbSBSkOGSU4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748262082; c=relaxed/simple;
	bh=OSjenUtGeUxY2QKIW0qhPspnf7oHuTj3PCtjTBlzbp4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XO+ETvXWJndopnJmDVNGIgrCCyvuBduN7QwfBVl+loas4l/MylkQdr08aqIUbq9Y7o9sqZp2MsRJR8YoilDgyZdK47eI+A8A75N5yk+2zvj+4ljb748SPMNQrOctQGr9D5KmgQ/PCSMdo552KeVvWLMIoKS8w/vwC+2nnre2w+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=e4kzRv9X; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="e4kzRv9X"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-602039559d8so4483227a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 05:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1748262077; x=1748866877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=768zz3A5MyltBkQLlSbOf4oJniHEYxMfBQNxunlsy5M=;
        b=e4kzRv9X7YDuVP+psgZDvgW2JfxVPKQjZGqnHmZ9nazMd8PSdws/UwD7htHySuvzd9
         lDDDuEjaJD2+QeOhzmL+T0NmYGm1rPgIdsrqy/0VHiTGK8N7+F5UbKeRT/yulQjQq2f7
         g+1FZXOwttW2qWUoPZKlVmme8oF2sVrT93wJcmwJqdjuzS0LwiCW1T2EkGSDVjt1Ndfh
         RoLazqb5d+nnzkkhmKlotpWHeHFZLuWpvYk/w2+jumB/xaIYPq3WDTsZcxLNDZVeNEnD
         QXIpoptNMDiRNrXpQGhO3pqRJUmhZ9EWGqcVv/JIgDSBFdXLJ5SCbZOzPNMkBs/Kg11F
         iFwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748262077; x=1748866877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=768zz3A5MyltBkQLlSbOf4oJniHEYxMfBQNxunlsy5M=;
        b=lubZc03MRLhKfWGC8ZkqFMig/j0eSchZL331b+nIOlg55dmhXE4Ax9RSqNX4S32Ota
         vr2R3fEIrykSzF7aE0XrBvsFQPtJCDjiG8QNPc11k+Ocg1kJacgPIiMGDQ4u9Z/t7XZu
         I/oIKKjl3Sn9DO7ieDye2oosyOtq7zo/Wi0lDtquVVydEGHYqEmoIR1WAFyBemoBYV9/
         3ImFm7zAjjb5JUzQky8WMUFDCaYX5WUfqAIkig31RMyDX8b9nwVFoBSlY6AGiZI0zJkw
         oKZILmatJnvPrllGE/366yKYJ9/tenNDejmAxVjgG0wXQ6HvlM75XEcQ/LvGUUDKBYgH
         7w5A==
X-Forwarded-Encrypted: i=1; AJvYcCXCL1HhpLVpqwDkvs27rowoXdl7waZdWTAqfiKFK996MxKASuX8ZewaPGd9dKqJGe8dWlR+CjRk5GugmGM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTKytI13bYc6EOW5tFwvkhVV+22rGz/0+BikTx1SW43nLGO4t3
	dRIUYi9Z7XOG5v3/09UCEhEvIcodzK+UNri6QO8muoyqPaKM5mih9UB4gXFnzKBV3+s=
X-Gm-Gg: ASbGncv+2UTnkjissLO+qPcHspAkVlPsyrKLWiu2P6Y33i2H00uo3rd/op/eelia7o4
	YwUCG8Y7Z/GSpM+oHqtZiAjXP68lWWiKYoWlGlGyhsvqPYFlahLckr6PZjCfKuGKtKgfP+ip3tO
	rc0L9NAqPsLiiTj0l0P98RenZOv1NGxFFTkZKL+DI+ANuy9V9Z13MMQLgctTo/wWI/FbqQWYH29
	iQKYENMggayGev9sC5QoLLupcvxBiYCsG4Cq8ERAqTvX3u7P+uY6tZyWj6HucqLAujJ9hVYlXEu
	wAQ2R5McSWl5odDvO1e0VPwidM7aED8ldrtUFon2NCU97N1C4C4323AePlrxJysBwjrBRzt5UR1
	rw5tk
X-Google-Smtp-Source: AGHT+IF/1QayFTF9qsFXVEeDjJ2ecvcZuUY2FjpmdnnRWet2lfUsBrEqZWoEsIXUVBdEMDGEtRJkAg==
X-Received: by 2002:a17:907:8dcb:b0:ad5:1fe4:4d0d with SMTP id a640c23a62f3a-ad85b2065d0mr729565366b.61.1748262077456;
        Mon, 26 May 2025 05:21:17 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d071c36sm1687630066b.64.2025.05.26.05.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 05:21:17 -0700 (PDT)
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
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	bhelgaas@google.com,
	geert@linux-m68k.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 0/2] PM: domains: add devm_pm_domain_attach()
Date: Mon, 26 May 2025 15:20:52 +0300
Message-ID: <20250526122054.65532-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v2:
- add devm_pm_domain_attach()
- drop the devres grup open/close approach and use the newly added
  devm_pm_domain_attach()

Claudiu Beznea (2):
  PM: domains: Add devres variant for dev_pm_domain_attach()
  driver core: platform: Use devm_pm_domain_attach()

 drivers/base/platform.c     |  8 ++---
 drivers/base/power/common.c | 59 +++++++++++++++++++++++++++++++++++++
 include/linux/pm_domain.h   |  8 +++++
 3 files changed, 69 insertions(+), 6 deletions(-)

-- 
2.43.0

