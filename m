Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4762DF58
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 10:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748775072; cv=none; b=d2rQQfuJimx3cnDTPaq6SlRhMRV+g0nIbmTlla3GjA7jLLD1RsVoIg2/Z/6mgba81WDRO2471Ql14r+SlD9nIYR05q6my8r1eG3aMqj+vWAE397SuqWbgVbs8LMvVsKXXOJoFmOQGmYixDfDUxjy2CUleSbssJoeZ+JVfF88D1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748775072; c=relaxed/simple;
	bh=IedTI6y31Z9wfDQygWxGLOTQXuBtfOVSY0+G/3MDsxk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gf05FGpFxTiVwByT8hsDc+C8fXuQaTk6NIXzD4uA/QYfpLGKpOmbkgcWZbX9k99Fc8o/Edo03E7V6Y/yqN+G4TpBaYgRqEZjGTrr+hLW9PpELN6hXPd5AXE5If8Egvrm2QLlIuijkwr3xbL3ATYr6T8WFqStMfFgb1bVWqCGpe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QDskuaOg; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QDskuaOg"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-450d15e2d25so406275e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 03:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748775068; x=1749379868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2nUpZNBlpikPmomyW++aVf1JU8CJ0XDbJuCOPljwsA0=;
        b=QDskuaOg1F+4eeToybGPmPfULxZNpZUcxChqLBJv+Gy4FF3AYyViqdxcZ9ZTvqkhNT
         0aQUkLcRa9j3FscAI7h683FlAq0tHO5NhO4VJgi6sjGWEFbAGbf+T24aOou+vqMNmN0j
         diOgTx6B5+sbd0mKgl/zyua97x1pI8vg5vtZTdVCMC3Oc78lCTdo3GgqmuxX3/oue4xt
         pvkMEWzZZdbTazvRK2iZllBAdxsbSoHn0S2PDnQDooH/H5Z1H0NN1lYeXRHvrnBD/n+G
         sTjGcOzeED6W9lmk5Kx7B22mJ1VpgrVtGf2WpfcVC9x8u7KrCMxi4s8rUIRwOWMmPPbu
         BmWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748775068; x=1749379868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2nUpZNBlpikPmomyW++aVf1JU8CJ0XDbJuCOPljwsA0=;
        b=pT4LeuSU50CW88gt5fdNG6qwhg+VB4AnW5QZVeiOfFiwWUXKhW9s0tF/YnnJsAIc9Z
         Xf542qsEUyTlb/TwrTm0f9aJ3YsDu1aF5/NfmGvdpmdRfunNEu6ATISNH9U5cgO0lY5Y
         FvSq3UZQ5ecz5YZ/YuTmh0KXNLtafnzbrJbVotQ4Yx2SOOg3gZEAnXeq8EdiQnixtPgv
         DHvuOI3R+etzmyLRybHsc/n2oAR7Ea9HdXZaHAiw8F+RFyWNwh2VotmbiMBDpeYHd2nl
         2Lu18jWa9YqO89s7qDU5r2ak5qVLufzTFjpsjwzMuvGx+W/1xo3T4QJOKFOYwJBv1Yet
         avmg==
X-Forwarded-Encrypted: i=1; AJvYcCXmoSE04k/YBXCE8p5u1DhzvvwJW07tWRoiPzYoCswaBq/vZ/yXMvROAqCzDlSRl90uTjFgQaFXsAWTAKw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvdFLXGNwKoJHVjYxaSq0V6Cv6BAZvDfBUbhgWVBOG8T5z6pof
	spk4L9zqdKCl7AoWertJ5DCguacK1SSJx6UlMg1RDHt8HXZlCBSwRUYdQiyYayK/9FZiY6nRJzX
	658tA
X-Gm-Gg: ASbGncuHDgMF3qXewuiGK1suv3hcLhzwIgaNgmj5SjEda/qbsB6bUE9fgEwY1Vf97az
	8JrNPw4UZi1QkkR+Hd9VpD53VRnnL2nH/5pWt/yfs8So1pAvPmSncEXRAlPQ5TImQgRD9pRtQk6
	50adrTKbb4CQ7GvxcOkoLqMP76PCgsBue8SkwPkfavaD34fCV4aHKmIF6c3i/gmjbg6eD0QNwnK
	PYgKu8qa6rqrWEgPl5hvLLmSh4w76da4CM72jncCtTYXYKCMG3I8j4DzRr3tKczluMpsm+ONuKF
	+G4AFYeBRTWcpKVm4hNTgPQs3pT9jA98oQujCiBX9OxuJxCepTVPHuv53ZqH/w==
X-Google-Smtp-Source: AGHT+IFMEf+V7VynpC+46zXghcXGWiqK1ENHXMZzGZ9cm7VdWMxCLQgYHfpKM5q5fyapqZaKoZ3G/w==
X-Received: by 2002:a05:600c:1caa:b0:43d:2318:ed7f with SMTP id 5b1f17b1804b1-450d7a7493dmr27209595e9.0.1748775067858;
        Sun, 01 Jun 2025 03:51:07 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c7adsm10918723f8f.26.2025.06.01.03.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 03:51:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] pinctrl: tb10x: Drop of_match_ptr for ID table
Date: Sun,  1 Jun 2025 12:51:01 +0200
Message-ID: <20250601105100.27927-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=IedTI6y31Z9wfDQygWxGLOTQXuBtfOVSY0+G/3MDsxk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoPDCUJSZf9oVpRH48R80uvcuxTee3SGaUU9J7T
 9Mi13CXgouJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDwwlAAKCRDBN2bmhouD
 11BaEACV5gqYXBoKx4pHWvXE/c/7/+RNcjZigQVTzqiAgB+2gpzUa2t4XF238EJhzHxIns+3SVR
 NFGlYisEqE+xv6ZZ9sfMHIoIXaXmulV59L8yGFOQ4RZwGCSGj/FpojztqFiVX0coWw19XcfffK3
 rISmvoV50afEbGhv7YFbIaxcpLUX8ps7O5JcPVzw1pmw4aNDl23Hz5Q/nG91fRZIkEGwMyfYZMN
 RJJLTgVKCLdBGfGcl2GumEaDKT++xTsWDAq2lwSq2vd3s40ZuhxdKA8YasREKHp2809y/lpwIHQ
 UAK8vmb/MFosIYeUBrRJ8WRo2ZNZASycIgb3K7Spu//la8sU/rqfGdUUP3kYpasuFPoTFCMdpo5
 TyGS7d3GM3h9gcFGAMDSxahbs/DQjs3Z8m3hQXA++hHmdRIfwMeoM7evd/Yt9mwafp5fPFLdkvE
 ZQfLRsTJLwVddY0uGY8BGcFvsWnYE0fkXUcBtQepdmiBU6fjsnnYKDxswZLK4STW63XC23kZ1Ar
 Mka0ba6Ta1E4PSXyjQ3tZ+RNEg9gfNh2CHK3L6lhbZZJ+pwYjizMNDahWlRPNZRQmEVnUOd9GAk
 dD3VTfgabMezJByDivzM/UipJHIpgUwech357T0OHtjjPLe4dkPbU/fWvZa9+ibYkyI0KCLjRH2 4PWo7u5mgD9O23A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it might not be relevant here).  This
also fixes !CONFIG_OF warning:

  pinctrl-tb10x.c:815:34: warning: unused variable 'tb10x_pinctrl_dt_ids' [-Wunused-const-variable]

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505301317.EI1caRC0-lkp@intel.com/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/pinctrl-tb10x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-tb10x.c b/drivers/pinctrl/pinctrl-tb10x.c
index 2d2e9f697ff9..129fa51d13b1 100644
--- a/drivers/pinctrl/pinctrl-tb10x.c
+++ b/drivers/pinctrl/pinctrl-tb10x.c
@@ -823,7 +823,7 @@ static struct platform_driver tb10x_pinctrl_pdrv = {
 	.remove  = tb10x_pinctrl_remove,
 	.driver  = {
 		.name  = "tb10x_pinctrl",
-		.of_match_table = of_match_ptr(tb10x_pinctrl_dt_ids),
+		.of_match_table = tb10x_pinctrl_dt_ids,
 	}
 };
 
-- 
2.45.2

