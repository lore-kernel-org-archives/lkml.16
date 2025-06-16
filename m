Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEAB2741B0
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750067147; cv=none; b=IJDY4ucNMpKkx+F34h/sZ1PFGNL5tBwk7GIi0AzwNSG2r6YWLCe1NoCOfC1SG+IKkUgJWRYXMCZLy2rXaCFoa/XuKxOCihypOWHRJM83AgGbMHuqcRzGOIrnkgGNUND5OXGeQ2tZiEP29Scq/RXnK3DLssscqREMcJzzmBDtSSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750067147; c=relaxed/simple;
	bh=zkQWBO37VN3NVGbjoJhPxoXCrT6Q3CmQrD7g+/aYgks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gK3FyQquPD+fSoq09KLlQpuAcFpz8fGB2Ek8QxwhoMElyYwOmTLUU9ITyswx/6y7R6oFS1LuHl3A++pVWGPpWy/jnaj7KjdewqnM0Daj/hDeVoKn/bHHro/qEI9y2cgQ95a7NBujUhGFfPqwdJFk61voYHR/XcRz4VejW5sVrDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bco48ha3; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bco48ha3"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a4eb4dfd8eso333966f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 02:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750067143; x=1750671943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=stfq1sXWKmsRuu2Jonzta4jrsZNZk4m5C7fvRbIkSl4=;
        b=bco48ha3LteeKVsX713f03R3hndl9dyEatmE7AQstiTZ73Io/sYhfVISraYpFmNKZD
         0c4xEGbf1Sw0QrwbPuJf5ZLpDyHVM07oN/O/dcn42Rl0/5hYCjOzLBHRu1/w2gL85ARv
         EKdNUzsL7MNydBFm6LzYMqU4sC9LTBDfcCelhdNjeVVlv5/dKEURFosoz/ENfR0fcmFR
         Q760fHhokicx90+XYm/wYwqdPYzL3JyUyd9VT1HQtYEy03HfG/B8wtP1lyV2i1sqmjcm
         WN70d7c1x8DTAKAFL9WQwTglh+uKX53WO/GjdMpcT3+znYdc6rjDQOmS/H5brbLHyA8O
         1Y+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750067143; x=1750671943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=stfq1sXWKmsRuu2Jonzta4jrsZNZk4m5C7fvRbIkSl4=;
        b=QtzlBCNk6pIsbtaEHlbhOuaLNUR1+1XalBUiLTj3hF69iF+gNByYTBBK99paCJ+qAL
         ZjwHerRzNZ5PDyikNK6mwgN5ffWRdZ6/rtUvyrJaobA3bPX7Mywuiugt6CdreRb2tPp5
         yzAb/pF07vgVY4PgBdpWWBx0VzPFlJEe92nCZp88iDQpVkGxk2mVJrPxhT6/F2QnmekL
         tANK8pUhZ9ATsKlMgaEAJBQ1Vv/hY5ijyWxuNYG/hCyjKjR7o1iRwXgZg+c/CqABnSoL
         d6ziyGCTRVVKQv/qnn3+tLXYdkCZsKNR4fCtxqUXBko0RsOKoUJn2nnK5PjZu9eNhjQR
         RK3w==
X-Forwarded-Encrypted: i=1; AJvYcCUldzeeQqgmWXeAap4r7AbA833XErCraGYCuh8F5KIJAcGuVjwc/xj8smLlqy939FoOH7P4rAR7PV4unOU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqkzaTkQh545kNcerqRt8KYr5TJhTpb6ybYe+hPtj+Yj5DAA31
	ce84b9ZaFU0tItqbrmmpcYuy2bFgJbeaJFrMO99AwI6a8IoQvs7Xp+nlWkyCVqG3PIM=
X-Gm-Gg: ASbGnctOsIoEXNZcypySlBRtYhq7aRwV2UdL2bkMsWdAw0ZUHoiEr8af51edOAWhX29
	CZAOHLtura5Xw5jlUy55y2UIaITB4gSe6mUY1kCQpuFSReyBOzoJsK9Ny3HWPRsaJm7EUO3/p+I
	G3JUkVrrkLEu1sFyOxr0LuQ5r970wcXDiBdjQi733Vt1eNl1sUvIV/Xv1tVj+yBQmtFvLGuSQ6l
	C4x3E+/UkTCI50sPLQOwPxyoc/BViRiBJ23NZkWFf7zEaQ18AxwkPXj6DLC8y1VH7r/CxCWrSWJ
	xyKKPXKTqCoKYd7zHi0Ic5fZw/8ONetSgwohVU4ijib5sX998NI53smTd0Prbw9cYUyP3D1Wsg=
	=
X-Google-Smtp-Source: AGHT+IFmhUzV2REZ+armXUuBCrTN/HZvKEo4jmpES0++U9AIxkv7x67178KFZZA0J/Ne420xjaKjFg==
X-Received: by 2002:a05:6000:2087:b0:3a4:e0e1:8dbd with SMTP id ffacd0b85a97d-3a572e7a579mr2511491f8f.11.1750067143332;
        Mon, 16 Jun 2025 02:45:43 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a67361sm10711943f8f.30.2025.06.16.02.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:45:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	andersson@kernel.org,
	konradybcio@kernel.org
Subject: [GIT PULL fixes] ARM: samsung: soc fixes for v6.16
Date: Mon, 16 Jun 2025 11:45:39 +0200
Message-ID: <20250616094538.33256-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1498; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=zkQWBO37VN3NVGbjoJhPxoXCrT6Q3CmQrD7g+/aYgks=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoT+fCBAboPqnDdMQ1PbbW1abt+tp9PiIs4J8uF
 Zr8YV5NFt+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaE/nwgAKCRDBN2bmhouD
 1+wzD/9FB4y+oWO5csn0+pLRk1mm9Z+42W/TegH2R2wag3jd3cYzP86Vv4/BBQbxHc4hsGxAAZ5
 RJsw5q0sX6vx3hDeyo1uZH1BmKQHEJASDC8WDPDPC3pYHQYhAxRYU617yNlp5UNNk6JJ9rC+25p
 ZXvz6nLdWoj8peI4annyXHOGVlPEZ53Mn/2PBlzdYdLvUgDMX6bUwli5SWfkibYRWq9FzXrZ8FP
 MNZtWXFU21u8GVRwWqONPdwtAkYCBVIuq+Ven2bdI7PCds9Qh04Nd5QIT/Nd+XRAV8IQBZjUd4z
 xsdRNotZyXzhceSmHfMDHx5jFJvSRz9OrXXYvaW1uXHD7bi+b0h+xai9SkzSyHsMzRL0FX2+hB3
 MA/GXCreM+h2UXk0QhYRP4oQTQHrJ/ZF1PxAhrHw7+7H8lgOnevjGTQ0SF1fpVS2Ve9x1XmKcKd
 B8dODZghP92kNu7iATg0RlDsXFilqRJ9fsekxbzPbmqriNAWrQ6Ozc2sHyDPTc1kNJ881pJsHRn
 DTkh3it/D6s8jI9+0Njc6Yl8YEK22YfjkiY5LGPe0+k/i6XgGxbMBQPkgpOD9OZsttb/J0TtHLc
 KwAdUydr1wsCOlqvU3YluXNrJddgEq6JPnGl0er01MlMYa6C+e/F6GjLgjO1EEas12HlvlYxHV4 fpTfFw2FA9IP2GA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi,

Fixes for issues introduced in this merge window.

The defconfig change affects Qualcomm SoC, but the originating commit came from
Samsung Soc tree and it was not yet picked up by Bjorn, thus I am sending it.

Best regards,
Krzysztof


The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-fixes-6.16

for you to fetch changes up to 8d2c2fa2209e83d0eb10f7330d8a0bbdc1df32ff:

  firmware: exynos-acpm: fix timeouts on xfers handling (2025-06-10 10:20:16 +0200)

----------------------------------------------------------------
Samsung SoC fixes for v6.16

1. Correct CONFIG option in arm64 defconfig enabling the Qualcomm SoC
   SNPS EUSB2 phy driver, because Kconfig entry was renamed when
   changing the driver to a common one, shared with Samsung SoC, thus
   defconfig lost that driver effectively.

2. Exynos ACPM: Fix timeouts happening with multiple requests.

----------------------------------------------------------------
Casey Connolly (1):
      arm64: defconfig: update renamed PHY_SNPS_EUSB2

Tudor Ambarus (1):
      firmware: exynos-acpm: fix timeouts on xfers handling

 arch/arm64/configs/defconfig           |  2 +-
 drivers/firmware/samsung/exynos-acpm.c | 27 ++++++++++-----------------
 2 files changed, 11 insertions(+), 18 deletions(-)
