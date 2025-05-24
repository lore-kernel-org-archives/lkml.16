Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D892940B
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 05:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748064101; cv=none; b=Pu/Fe3ttj2iEU7aho1dxDnSzZliNiWCjafkR1l37W2WGo8MmfPBEHBX8eSBK0k8lScOTIKt257M6CHk87NAWd8bBhNXvTO5Q0brtjnBaJNYu7YU1ab9uOSg5WcBBJHyC1uHaVXOCDzRG2vtnWehu38z+SHsb6qr4DDcrWEs5POQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748064101; c=relaxed/simple;
	bh=3aztcBEs5t+8vb2HvoZuOjO3OzbfcifNMPQfFU+/Q0g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=O18PWi+m7UWRDOIi07Mc+eDQ9ZZCmbfsdE+0jMbAiol49VajukDon+H9yiocd0PTw6mvWfJIJ8cj5roITrF4KCIm4ZqCjGTBgSI7pFvFoua+DTzMsjM0acU0BbpiuURWBaFRcyAQwegqCPsdIiZZOVekxyzUTg6LRGTRgmN+EEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eSn4nZ+D; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eSn4nZ+D"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-602e203db66so517262a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 22:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748064098; x=1748668898; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HVLgX7oZgKgmp7JBYszc+Lbf8YbgAmX++SIMz1uljwM=;
        b=eSn4nZ+D1wAIxz51qMcxVy7kmAiMCv0Wmdqdz5/vlhy392XzVhKsdAEg5+f/PDUXAt
         UAZGgh3UcC5+Fevb0V0gFSZ0FkVam3Ov9VTlbkqhYxGMVakq8g/MivUDWdJblU3+OKTw
         L7FEmu247ydu3wnXmcHOy4BRzGH/3u6RF/DrOmt05JCwDPaCO++xwRH964HXFH9mnfi5
         W/r8fZKwv/hbox+6lfBMjtZuM+rMXT7S11P9Kfm5dmK7DPLSaYUURee7hRLKFeY49pU/
         O4f3bbabLWJFD+jIlkBgFmzbpTxZ3zlGCodaeIv/Zh+5vo2c8Waw30FJo5qwOMh4C/e0
         egxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748064098; x=1748668898;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HVLgX7oZgKgmp7JBYszc+Lbf8YbgAmX++SIMz1uljwM=;
        b=wruKmWMeS+k/igTdLBuPEAhleHyUk7qqULYLbEHjxrLv728NxiHWHkXIrF0SB5DqY4
         qHGnr9cbuCqPrhxOQ8Nw1odMWHWVv/4tM99YaM8BfwWSMcJ/iUz0nZUW0AQ4cGnPO92c
         MAXSg5JwpQs55W257k7IgIBk9O++WddoyTyfPNgShh8cGLIUJaKQfcd5coP1C/WdML93
         tFNG+RJkcEk8TjBg8EZum21zScuLJCNS2ryBJtZi8S0ilC0IyyVVm4bNYFvht5Umz/Q4
         22LD7tmI2fz+doXhO2ajRDC+u0BLDqeIKL2SEEyPF+eu0TsdLFPKejWMZyl/VmE9jLW6
         00PA==
X-Forwarded-Encrypted: i=1; AJvYcCWk8WtVh2/MVmer6vARQ3JwCqTL9hohtFb6L1MRk9/cb0Y0W5fB/JnNS1oJlu+2mUrZ+IrJpv3htXmaCXw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3aanv5jsGO3HiCsNeVSzXlQJBo9dhtAWfLwsny+pcZHj52COD
	l7KyrPT16hRjK7F1OmdDVR4Q5qylRUqe5duXlWgd0UyXbtjWdY42TCCaGdKMG4aDz5A=
X-Gm-Gg: ASbGnct6Y69bZi7Eab/qcAckywlSLg+xUny5cveHyro0nPs/Sclc1f/1uwMUQi9lsCj
	uEM/qcv+y9Uh215x6klvSlULE6aJ5X6S5wGEcY1ggpd8ULDUxw4K3XFtE9Bobsj21YT9NW3GNay
	3b2isODszcsVVe1lfj+HTdewNKVV7kobjIj8ZsYIKl+kdpaWDMva26ASwHcTHB/bTUszosMgAyw
	SbtvxhX88xIUoxItr8F3b1lpaCS6SNs4s8bwEXZIeBsezoKvbYOmp1PU6GIeW9/k/f0zH8bwWr6
	QgO0Z7AV+TXlrVJzmeyDGufkeU6wsN1OrLskriKUryaUclDFQcu6gwEv+zJk/OkKbHu+NwTUT6n
	4YTIRjNqbYvcjX/x5JjWJwQyPMl9k19lrF0c=
X-Google-Smtp-Source: AGHT+IFwfRfCw7b+i30fDVsYjamnwABVc4tlq1MkutzLjfaI4FhpNhFaGTjcBmSVXr0eujU+xxYGNA==
X-Received: by 2002:a17:907:9688:b0:ad5:7499:2644 with SMTP id a640c23a62f3a-ad85b2a4f94mr135383166b.54.1748064097988;
        Fri, 23 May 2025 22:21:37 -0700 (PDT)
Received: from puffmais.c.googlers.com (68.57.204.35.bc.googleusercontent.com. [35.204.57.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad5572f6402sm1106778066b.178.2025.05.23.22.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 22:21:37 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 0/4] gs101 max77759 enablement (DT)
Date: Sat, 24 May 2025 06:21:27 +0100
Message-Id: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFdXMWgC/32NQQ6CMBBFr0Jm7ZhSpBRX3sOwoHQKkwg1LSEY0
 rtbOYDL95L//gGRAlOEe3FAoI0j+yWDvBQwTP0yErLNDFLIWlRCobnh3O9N09Qtzs6iXSM6o7V
 RgzJWCcjLdyDH+1l9dpknjqsPn/NkK3/2f28rUWDrSBtBRpeyerx46YO/+jBCl1L6AjRlJpK3A
 AAA
X-Change-ID: 20250306-b4-max77759-mfd-dts-fb88b6c6bd60
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Hi,

This series enables the recently merged Maxim max77759 driver and
updates the DT for the Google Pixel 6 / Pro (oriole / raven) boards
accordingly.

This gives us some extra GPIOs, and enables NVMEM which is used to
communicate the requested boot mode to the bootloader when doing a cold
reset.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- rebase against next-20250516
- add dm-verity-device-corrupted to reboot-mode (nvmem & syscon)
- update commit messages slightly
- Link to v1: https://lore.kernel.org/r/20250306-b4-max77759-mfd-dts-v1-0-9fe8b0eb8123@linaro.org

---
André Draszik (4):
      arm64: defconfig: enable Maxim max77759 driver
      arm64: dts: exynos: gs101-pixel-common: add Maxim MAX77759 PMIC
      arm64: dts: exynos: gs101-pixel-common: add nvmem-reboot-mode
      arm64: dts: exynos: gs101: add dm-verity-device-corrupted syscon-reboot-mode

 .../boot/dts/exynos/google/gs101-pixel-common.dtsi | 76 ++++++++++++++++++++++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  1 +
 arch/arm64/configs/defconfig                       |  1 +
 3 files changed, 78 insertions(+)
---
base-commit: 8566fc3b96539e3235909d6bdda198e1282beaed
change-id: 20250306-b4-max77759-mfd-dts-fb88b6c6bd60

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

