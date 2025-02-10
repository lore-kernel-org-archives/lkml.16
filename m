Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2E61F78E4
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 12:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739191926; cv=none; b=hzxXU8h8i3RFGPKjK1PlNGrHm5RqWFCaLu1W9LujhZjb+sKqyTqQ1cdulr2tagg4RgsxkvK/czcgUSa+Okm53Qvjho+EdAvmSe7H4j3exg+wcSuilN4EhnBqwRPEl74Cqjcr6TAKKRTFIUlB5mZYLPzgB0tm+una8smaf/1668g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739191926; c=relaxed/simple;
	bh=XQa/TfZllLbPwu6jv18G9VcuIA3/df1URiLusiD2l3o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hY0IEVL+Wj+Faz39I1ersHtL5lKOD+9HWRmzQLTXvceOqQly56JXmgNxoYxgk0GC5WA8UFe+kDIbst0Q7DN3+L65q6e4geNxDqgjfKNI+5ASFKq4K9cEqw8agevU++P4KUxkgCpvC90qelWQkxXbyaC86bXoJYPdI+Te9CSDdTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LSZpazow; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LSZpazow"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38dc660b56cso3217376f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 04:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739191923; x=1739796723; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ndgp99sk2+qm0AJX1iEOr9hIRvudwvRxmxME0Ub9m/4=;
        b=LSZpazowM2dV73iaK1UOw6IF37AnRhxMN6mW79wcqp4KfecVR/DeDp9mQ4D9/mvbbt
         5O3mrVA0PqiLAFms8BgUssVY/WA0NRqiiClYqzKEAFhhkE3MilWeNJx+QBkqtG6Xlegu
         k4VG1BSakccRTHN7qqSmA2nMeU4A5XLdP/c0XxKHDBx6WQ7tkUx0tYukgLnC9cKwHgT0
         OqF+shbGLCd8Y0Xqebs0TgS+97u2dVTXzvb1oKFeGn0rPN4rHnqUPmkEgzQe4t/TsLzt
         XOA/JkImKzOv9jqIam41psr9RChRXyNDhXHx9Ym1lSPpIT4P+9yLHYdn8mJye8+WBdEW
         W7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739191923; x=1739796723;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ndgp99sk2+qm0AJX1iEOr9hIRvudwvRxmxME0Ub9m/4=;
        b=uk9bq1VVQ/d0hFmJa6htnogNEJlWDbxucXMhBdRBqT+Y9pCEFi5EsnXDITHN3Q5Csg
         hW8nY6LpWj6ZGDg9lQ/GUBPqexsyO9eYx5b+zkSXxJv0kl1yqJeGYn1O1PoSWRKBk0JH
         6JaJGxxZD2KWFyHtZMXZNDq+lEhtckKCUSBammJZNMBrfV33JGx20BPG2GAp2nGB7i7c
         BX4fNdQOiX6g5ELC1XXzqFbSeNreMAOEZXIrgHD1q7F5GJpckgzj9TQqjjhXCMlqUcSI
         j4ISsI7kNBtGs+ORmxV3y1dk1DTOkena/LmGQXAjjSoYWGW2AGeCNfXwAkgrV+S+t2lF
         fYZA==
X-Forwarded-Encrypted: i=1; AJvYcCVHjrzYDTXhHla/UDDdOzpE316CQNVvQsRhIxdpYNHrzV4eoYv7Xqx43PRfy0MPo4R/NKh7FzFCEnjLyMg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnCM+Dbdkl0kgZzotuyNbPTCHi/SZOB2X3YddCF3VzKg0IlzHw
	tYtvrC73qKwsgCVLI3PYfbPmMyJpi4v/ExAAjmoOEdjZePcYYXHOsk8Pki/jBErFblFw2Xrg6Se
	9n4w=
X-Gm-Gg: ASbGnctLIThqAy++umxL54jkQNuQuEH6pfexrBE4VkCbBJ36aT0YRFiUeejuRyNlyt8
	F/M9xie0wkwLvjkJhiPgUlTtwx/F8Cnmgb4+jQqt4lH56NXfsliFElunsEhP1vq/zqDDD4TbygI
	mwyiHe+aMeqkwwpn0j+qN1dXWTXGjC8pc6OFOwRu1Y26aZn+EhxOzem173B1s/GL4BrhkIfh6L6
	Cn4yr65aV6NerjX/AsUZfvlBkSMCNHt+TEyBV4Rc0X4mKAWK4uy9cRGI54EmJILAm4ni2iy56th
	2tzBhVX2bEu9eJiJUIs6Y+CNWnJ8vDN7XFr74Ve6UXREtMk0jYWYa/jDEcpEqPQ7rL323OtrwEY
	=
X-Google-Smtp-Source: AGHT+IGusahsybY44rc6nO4AWzY0imCi+cXnlxDgiDZzKI1dgfuiNW8fncCJWn89N3rzpgZLceWGBg==
X-Received: by 2002:a05:6000:1243:b0:38c:3f12:64be with SMTP id ffacd0b85a97d-38dc9135899mr9939327f8f.35.1739191922884;
        Mon, 10 Feb 2025 04:52:02 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7ceae3a3bsm85819266b.129.2025.02.10.04.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 04:52:02 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 0/3] gs101 reboot updates (DT)
Date: Mon, 10 Feb 2025 12:52:01 +0000
Message-Id: <20250210-gs101-renppt-dts-v2-0-fb33fda6fc4b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHH2qWcC/32NQQqDMBBFryKz7pQkVqldeY/iwsSJDpREJhJax
 Ls39QBdvgf//R0SCVOCR7WDUObEMRQwlwrcMoaZkKfCYJRplFEtzkkrjUJhXTectoTO3kfbWt+
 a7gZltgp5fp/J51B44bRF+ZwPWf/sn1jWqNBNnrqu9rZ2Tf/iMEq8RplhOI7jC2o0bRuxAAAA
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

Hi,

These patches update some of gs101's reboot / power off DT nodes to
bring them in line with downstream / bootloader / EL3 monitor
expectations.

In particular:
* an unnecessary property is removed from the DT
* the shutdown SMC call is aligned with downstream now
* we now implement the requested boot mode as a notification for the
  boot loader 

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- keep SYSTEM_CONFIGURATION register unchanged (Peter)
- collect tags
- Link to v1: https://lore.kernel.org/r/20250206-gs101-renppt-dts-v1-0-cdfe993fb3c5@linaro.org

---
André Draszik (3):
      arm64: dts: exynos: gs101: drop explicit regmap from reboot nodes
      arm64: dts: exynos: gs101: align poweroff writes with downstream
      arm64: dts: exynos: gs101: add reboot-mode support (SYSIP_DAT0)

 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)
---
base-commit: 808eb958781e4ebb6e9c0962af2e856767e20f45
change-id: 20250206-gs101-renppt-dts-cb8ab6bf6294

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

