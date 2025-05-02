Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0140242D7B
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 08:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746176394; cv=none; b=tLBs4anNCgtnvGxPIKOiTH0LGxqpLXnDbQQD9zQmaIusLTDsqhMY53kf7/XiOzrAuIVPNvV2vZmbR5prJXrpUe7G+/UnJwhMdspSG8Uz0UQ9Wf80vFKaBJicfJXkVf0b0O2yqz34qHavcMFaWdlm3Yg44FjNyWojLA3v8PmmJaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746176394; c=relaxed/simple;
	bh=5mkPquEYhHhuaHDlP2FWJwcbCha2j8346u44CjTk/b8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qa/G4IZzGg69W5tkJWjh9Yh1D8dXvWXDGiDPAwo70odba3F26txTC0lQD6UA7VnEB6nk6CM0KpvTuGzRAM1BgkIFYYyggSOImjB+0cIBw5+XwBdadufzZN9DXMgPm+rYPQF1EnBEf5vmxheW0gjCK6muIdJTmQOX13Zilh1pyfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FSFQali2; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FSFQali2"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39ee682e0ddso1038122f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 01:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746176391; x=1746781191; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1rOqsO31HLSQBn8sCWbcbFta882rLl4DDI6mWD+gWFc=;
        b=FSFQali2X9HuW2FDwiWRnoBRNGLYWf7QhdA5eBmedJJGniwpOYrpSMwuHuNJ8Mi+W/
         hMKb314gC8NDzwp1Pql2yfxMnT/EZXGkJbqmamsAV09hJNQe3cp/z1mrBxlz7kptO8Uu
         +7lvYb1n7Yu27XRV6I6KavAHQltgAnNF3jj9TH9MrHtLcu0gReLtjWzqZPPOJuNYRPt1
         j5Ind3h8XKMDChEh0OTWfceu9DNDnVqKdukbr7xrEKC4DoyuBzAgLBcqhvwb+LhIRDdZ
         EDgPmx1EYQ2K9czk+rwS2YZbQkZjghwAcFqDJR2mglyOeB4OphZ+rGgM+WANmIOu78uK
         XdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746176391; x=1746781191;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1rOqsO31HLSQBn8sCWbcbFta882rLl4DDI6mWD+gWFc=;
        b=eKgjf90nuEv6nyJ5bf9IvCANxumGK8/B/+xr14tkF0zp7qO8w7jzYBWpJYT1Lqgbmj
         q/cjuuPdl4xMG3uROodZ74FLfMwMYKZPRRBDDkRMrUsse7TqA5gpDiNVzahjtUqxKKKQ
         yLcCcFuVAhlvUPJxYXrhYhryuD/075WD4WWR7moJBWR077+tYMcHQFCP+5wybZEBGRHu
         MOD7tBDNvKZBbC5g9fSxTzLt+t/v5LC1AOQrOHuSg1H7AiHykbXDv2YniwIHOdA4nP72
         wYfjyzpfCx4VEIPA92U9qW0n2fGXNIm3orqYV/tiPidbViuSQCMSSOocaR1WkEkDCK0w
         XLcw==
X-Forwarded-Encrypted: i=1; AJvYcCXW6NSww3fCuX2HEEfdV1Dzf69juQERdyWC2tbBOynqAV1mKVpO2Zqx2r/qaqmJpQGcGXshjuUnsTki364=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbaRNDBx1C8eD7A/9idr0j6Ip9aAjxlveOUM4kUPz3SjCinIYy
	9QqiTbMWQTMLEBVDUlZwxVGY7rjHtQZcDvDnrzNBpWDharqwn3ngkPufJs0pUEs=
X-Gm-Gg: ASbGncuOT06qltZco/VreUBdDv5AU/c7IrkSkLU33S7ltB3k+6AVvGthw5JyLDYhtKW
	VSqBdzC2BxazFY2HiiKhRMhD/l+HXXyNfRnTpDolGjQCPXmP6Jtg55WBNYMh1sKFWJVfnleKwoT
	azeg+31d1KtI+PS0Zj9jb/zTYWcLdAhZpydMZddsYsxj6jbXjZa6uY/Uvk3VFXg5MuSjV4x+lwF
	zOU44/28LCvm6SQsYKoP6oJgGY9PrXUtjDV6+6O5maHfegEOQqOlvPtrNwPuBpuOE67hGzE0YOU
	zhgwWoZub6Si8p5LRpcEswyhIGqezAhCoxM=
X-Google-Smtp-Source: AGHT+IGkAmj0QTn7U0/RzbLyZFE3GXCS35eKh83HE+zzPG33Ol9TAe6eJSEee/o7TqoMVcjZZmYXFw==
X-Received: by 2002:a05:6000:2501:b0:391:3b11:d604 with SMTP id ffacd0b85a97d-3a099af0f94mr1403321f8f.54.1746176390895;
        Fri, 02 May 2025 01:59:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f280:a08c:3f15:ae3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17017sm1552055f8f.92.2025.05.02.01.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 01:59:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/5] powerpc: convert board-file GPIO chips to using new
 value setters
Date: Fri, 02 May 2025 10:59:46 +0200
Message-Id: <20250502-gpiochip-set-rv-powerpc-v2-0-488e43e325bf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIKJFGgC/3WNQQ6CMBBFr0K6dkw7KKIr72FY1DLAJIY2U1I1p
 He34trle8l/f1WRhCmqS7UqocSR/VwAd5Vyk51HAu4LK9R41DU2MAb2buIAkRaQBME/SYIDQ+e
 2xxYRrVVlHYQGfm3lW1d44rh4eW9HyXztr3nQ7d9mMqDhVPfO0N01NJjrg2crfu9lVF3O+QNbQ
 tBBvwAAAA==
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Anatolij Gustschin <agust@denx.de>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1469;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=5mkPquEYhHhuaHDlP2FWJwcbCha2j8346u44CjTk/b8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoFImEk8IL2kl18zA8xLaZV5UpuGvSQ0944hzDl
 +MCaHC/g5qJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBSJhAAKCRARpy6gFHHX
 ctyvD/0QuzQl8wwUQP5TkXhU0j7o76hnUPg9igcQd/mlb+GN+T5YJ7enSR4IgmeJkZVbUmRH+BV
 Hve2ufGgwDdIv07zwz2sc4sI2TWM3P3McMJIqlcBt2hfBtRvoJkic85ly65NV0rqScnJkrTQCOa
 Kt9pci1vAm3TX2K9j6b9Y6YUsMXkPpnBxJ7Bgfub+lBlDr128sdvgGUhkdFsd4+AP0EshgJ/R/J
 k/8Ga/IVA6Ze2en6raVViv1FiW+hN/4Ddg5hGdq4yzD3rqBJ93+1Wtg0VKthkwew43D1ucROH6a
 7wKorwf4SPc7ByLaJ3lrYuH1036ZpeJqPm97EEMD0DRHYa6sJxey4YyVx6o5rrgoTtGO8dn/nU8
 VE8hCMvzhdVGXaOpoFQ1312JoE+Z/Cn8/xxa9Vd0bSLIPDh/rlzmRO7PBKAKvoGH2rnC6eJl8rT
 653e8AqEn3aqaDBJJWhR+GHXSw942if2lOPnPyBzfU8MbB3VxBWlrmuzZAvsdtqQ6sKk4I82LS2
 WzBX3jKtN0qxJmwErJz/ZRA692Sf5gSIJh7sqCt0+A0m0XyuwpTEeDRhThbk6462Ct7+ht4syCU
 JN1r4TU0Yqi/FyFaI5d/eg01SodTxDrEsSOZVWKdEIOWomBY5DSmt5wqXgGIki8mmiyRnbGahnt
 Lyx4jfzgnRhTnIg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of 
converting all GPIO drivers to using the new API. This series converts 
all powerpc board-file level controllers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- propagate the return value of i2c_smbus_write_byte_data() in
  mcu_gpio_set() (Christophe Leroy)
- Link to v1: https://lore.kernel.org/r/20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org

---
Bartosz Golaszewski (5):
      powerpc: sysdev/gpio: use new line value setter callbacks
      powerpc: 83xx/gpio: use new line value setter callbacks
      powerpc: 44x/gpio: use new line value setter callbacks
      powerpc: 52xx/gpio: use new line value setter callbacks
      powerpc: 8xx/gpio: use new line value setter callbacks

 arch/powerpc/platforms/44x/gpio.c              |  7 ++++---
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c      |  6 ++++--
 arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c | 13 ++++++++-----
 arch/powerpc/platforms/8xx/cpm1.c              | 12 ++++++++----
 arch/powerpc/sysdev/cpm_common.c               |  6 ++++--
 5 files changed, 28 insertions(+), 16 deletions(-)
---
base-commit: 8a2d53ce3c5f82683ad3df9a9a55822816fe64e7
change-id: 20250326-gpiochip-set-rv-powerpc-1e98d28222aa

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

