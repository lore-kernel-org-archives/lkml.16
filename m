Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905DD2459D2
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734142; cv=none; b=M93zVPPRnHquTLwgEee5nWpwtck1tUHBU0ITYrHUvp+aXmvkTsVZ13iIEy2pjGufp4KcmUNWJx70u3Bq5q7UMOqUs2H51okzx8biCIuIQDhprZMvl7hF25HoBE8uWaibQgmM6HdjHM2Pq+IHr59KcgeqwREzfnVqd41o55c3Wuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734142; c=relaxed/simple;
	bh=smpoRJPqTgqboXPBnMexqjWTEKSSiuerFWJdx+xG4jk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MF7LpJCib1POG1ap/3rtVC5DCBPkNG864nMwndj5hnrppT33xK3e1yIV4T16hcz6DLXQHvZlrhGZ7jBOaI86o7+2XhyJ6g6EnyErgQrTkWeJdZnwajSTMzHJC3ARefyib+oFfIdhguBHTWMjw/qCFVlo040ZkqLgYoFU/oYFF+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=K0l+CeF8; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="K0l+CeF8"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-441ab63a415so9887155e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734138; x=1750338938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MsO/RfPfPYEcGu7pzHlaE+05FqNn0lPn9H16RQ8VcEk=;
        b=K0l+CeF8FLmO/WW+t3AzaDZO1u2KuZ4CWJQvwsm18daE5kHBcJlg+zIt/1LLaq0QK8
         WU6QX3pyI95FrHCd9oCQpnHQjYA2tyvfDthpQXkEjR9hIc9zrPyJYSJcf2e9IE3/emAb
         NnV/fair17Jy14R2w44xisqI+oEcC5dlZ83glFHrxkqcpp5qOMhU0z9+dUPgm2FfbKrV
         OsU9qOVW1oTAk9WQybJyahCWGHRXgz1sn96RcvIc3s0MllcLY6ku562BLrEMIbiJDWul
         KaWsf9lfDa/2BC+BeZxHLRpyJeHMVykA4mkMMJT4/yGrGCmRqixSRRztiqQGggVZ4nJk
         +Fpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734138; x=1750338938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MsO/RfPfPYEcGu7pzHlaE+05FqNn0lPn9H16RQ8VcEk=;
        b=biMVWlVThidWeo1J2145GTAbxt4QySgAIYaGYQuWG5r06RIFKstOn0awzjIb+mMC6R
         GOgdQVbi5t4uOxbMzFd8USNP7BqFb+8y7lypkzWNJeLVB5tgCEnolbmnUHOtf9f3MXsK
         0ofw6N3gk6sx1E0VZDk3B5MSD7g9gMXKTO6TfnTZR8S1nQd31UWM3C5Zb6D9Lm1pdV0S
         nvNR1yjfpLiUdKWavBOCXLvi/81hUjORLbKIY63spY1C9gFhhKqFTIw5vALkUzP7sQRw
         FTFNCyJ4CKkqYH3FC2NSDR06P63mKCt41OkOAiEy420of//BaHKSdQ8Cw35xX3X8YGSl
         brXg==
X-Forwarded-Encrypted: i=1; AJvYcCXIExvdWW034HsXg6OlMoLZvbD4NiJbn1H4CBAWX6coBlSVxQPKVU55ewrDxDC2/W8sKjKuFnn9aMsmgQk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZNAVk5vcpuyIorhud6cWz0Gry5BYzGuasHftC1pvIa0GZX2+y
	XOR2gGBbCb7FJyXrFBcGoupap0KXezTruLDfNSHpRuNKhTZy5PPzmxhVxBbSfqDTid4=
X-Gm-Gg: ASbGncvQq5KXNuViZEQ/BJm1++QZn4v+N+Hpwr6evGmqKqeb63m757S21b4ns8a00Se
	RBozP+QyDqQqNBYJyA2bOqnUDerklsuUdGq7/e4D5cqe8JzYbBFfaLMLeYLO34Gdxkp9tkvbfJF
	YNf/UZH3ubZGrtZN//3FDzHd7NGj3+cMkRMOZLpr7PhlSH3MzujwDE+jVRzRVWG8r3DNjK5zPNo
	m5uP9mwhbxsm6Sb7YB7ocLQeCRUzKKzVJ+4q+1jmkJ+jrRLnZyAGf9UBDUPRM8UUReYbvTlcPwK
	6hFKYtjkD7Ck7v4ronKe/0qNE1BbX6WQnm+eIMoYCuPI+5vFB+N2pHs=
X-Google-Smtp-Source: AGHT+IF/kkUZmqJMzJYib645Bdu8k5BoQYvJm3jm3K7Cxkyey72KYBawXxzfCbRcLK0/hrXvvJy0SA==
X-Received: by 2002:a05:600c:3b94:b0:442:f4d4:546 with SMTP id 5b1f17b1804b1-4532486c513mr66058075e9.1.1749734137693;
        Thu, 12 Jun 2025 06:15:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:20 +0200
Subject: [PATCH 11/16] pinctrl: pic32: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-11-556b0a530cd4@linaro.org>
References: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
To: Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Baruch Siach <baruch@tkos.co.il>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Viresh Kumar <vireshk@kernel.org>, 
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, soc@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1720;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=36c+wupdpQstMiyirn6O+A3D3CWfgG4Pu3KgyyFz9nA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLmawJ7WD6umM/5yinajp8MTMUCxK3T/5pvO
 NJPhif2mbeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5gAKCRARpy6gFHHX
 ctMdEACUmqcuKhVLteNNFsKXjhb0zQLkw4a2Fw9Tyn53Jq2evetPN4alNRZOafrKnN4EQaA2bjC
 rCflz4VMDSQ8DB+ExJ1dZMPiE47azhpnGrP2Ntday7+7iuRXGMWpM8ADbtGgUe/87ZPFa0KidXZ
 DVBXl4M3NXYsc5IWpsJnmoLdg5UyE+mW9JoofY+Mz04Oxd6n9fQ5bZeifkdllln4Q3y5qnNSjb0
 cdW1s1afOJlDtHkPTAbuP2RB+eGem60QlsIWtBpMPpWxv4eitSa3ucXGPDal0PCK9fSTCstU62g
 lrFrlnFbOaL7ZWcHtDDFy2m24jc1lIqxy0Azvs7DQWHF0D7SQDExoX8kLuVPW/sqEt2t8AoFs3v
 jXf+K1tgpr5K9xn8S10zcd7MNFEPWRxFLTb1T+GPZpPJ9kW51o0pp6qBvuDUrgf6N9wwDjtloqU
 knRNbrM431Biml5vy6a26Ze8NeXj9D9txpKR9izG2oM0yUdAS90qQqn8d8Gl4J5gwP28GB5WU7E
 7FYMcPwKodRzc69PaB4Ab4ULl+m160z7TQtvhZhM/bIK067QAAX5rXY8ZTyU/ZMnRRLh9VaBrr/
 V2zPICzcxe2Duc+ES9nlLO+6hTvzZ4Wrzz2cnxnr+exUfjvlrPHT1knIw87EtPiAZVpvG3qC7BA
 oo6HMlDJeALdzbQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-pic32.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-pic32.c b/drivers/pinctrl/pinctrl-pic32.c
index bf827ab081a1d672c440a8b4eccab539fdc215e7..6d64cab97e8116625c2efce29a3e5db8248bcba4 100644
--- a/drivers/pinctrl/pinctrl-pic32.c
+++ b/drivers/pinctrl/pinctrl-pic32.c
@@ -1828,8 +1828,8 @@ static int pic32_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(readl(bank->reg_base + PORT_REG) & BIT(offset));
 }
 
-static void pic32_gpio_set(struct gpio_chip *chip, unsigned offset,
-			       int value)
+static int pic32_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			  int value)
 {
 	struct pic32_gpio_bank *bank = gpiochip_get_data(chip);
 	u32 mask = BIT(offset);
@@ -1838,6 +1838,8 @@ static void pic32_gpio_set(struct gpio_chip *chip, unsigned offset,
 		writel(mask, bank->reg_base + PIC32_SET(PORT_REG));
 	else
 		writel(mask, bank->reg_base + PIC32_CLR(PORT_REG));
+
+	return 0;
 }
 
 static int pic32_gpio_direction_output(struct gpio_chip *chip,
@@ -2118,7 +2120,7 @@ static void pic32_gpio_irq_handler(struct irq_desc *desc)
 			.direction_input = pic32_gpio_direction_input,	\
 			.direction_output = pic32_gpio_direction_output, \
 			.get = pic32_gpio_get,				\
-			.set = pic32_gpio_set,				\
+			.set_rv = pic32_gpio_set,			\
 			.ngpio = _npins,				\
 			.base = GPIO_BANK_START(_bank),			\
 			.owner = THIS_MODULE,				\

-- 
2.48.1

