Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB8225A2A4
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734140; cv=none; b=LuFMOacZGJ7BttGa3D6dPLGWEV5GwmTSx2CZX+7NPavrTRt/i28fmvXwgLCuivJymOahqsFoOitQjLzVayH7YIgiv2K0i7WWEQy77hNtvo3DZ66o0tKrsqp6OzspxFIZM2I1wHDVh4wyWnhVs/WIrA6YWe1s6fqD/c05z93O4rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734140; c=relaxed/simple;
	bh=Ek5gzG7d4ZwNZMLDtQPVgdgJ3Mwq+w30jIM+xzq/1NM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qgf0w14AehMo6FXU2i8vWQz/QBbsoxjmsrXCOI74b9ogSrKNHpWgYsuvtkjK5TMRQ57piSLtC8XsAlMI1QpmeYMAPUSd7VcWglOfWNQ8P7U7CRfpLdIuggldESz6xUPH+HcudYanbkL7VI6Q0TiJJ1asnOZwnJ7OZor37fTwTuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IGb7onSb; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IGb7onSb"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-451d6ade159so7953495e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734137; x=1750338937; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ip6lbynAFYtNjOClsW2vFt7aCkU5Ra6KlZGM45oXiHg=;
        b=IGb7onSb1drfDqPn0qVxMizoxrlhjNGgjDMyG8YQeojPpw5n6Y5T2lI/XbSBF/2fn8
         o6oabitw/t/H6H+ZpCIcFWSZtiCxs/up16tS+ztbV2tkBJ6wZnUg/R5SNz/TvykeLUFK
         IB8xR9sNmq+xrFd904gJRMnV4YGtX6FtFcDJNSSRBLWdLmAVamxIiuH6hA1CKUQT8eM4
         HVNPCqpaRIkfgvaVMAMIMuEc5Z6MeT0CJUG7np/bwcKmh0+Fsumyq/ptUvRwTJF/vDHp
         +CU+ItxxWPimc9y4ZQ7RoeErtna73qNZvSICQDe0dmqqLCqVqb0Idv9O81TUx2nqW7lp
         3fMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734137; x=1750338937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ip6lbynAFYtNjOClsW2vFt7aCkU5Ra6KlZGM45oXiHg=;
        b=ui+6/BVIkO4cplDfcyO7AQ7vq6ROUkSU11QAAhsSnkKN4Rl7lgJTNLMogcXYVUDcgt
         ItLm1w4LpkpwjXL1FFSf746MJyp/Kyh/xLxe6ILPKFQ2aeny2XCm4V3ASYu8P0vT5D10
         zwb9EloyvN0JKzn880+mh9iQwWDub4YopGE8lv/OoDbnwEvidJ+IMCrfmisYtjJpNTzG
         7BfzafgtV1Ked60rEaUtUbExeQxdmNO76LamaKiJVW8oYAJ/NfESjs0Em8dXVCoPjwE+
         QZsilkl51Ab8edl8q52sbmYZFS1DHmlP7nJmfUjOO4DAfBkzGnUChJP2wUde1ZShUj4O
         NkZg==
X-Forwarded-Encrypted: i=1; AJvYcCUM5kONVTBv8cRY+RpKZePaNL04J0FKamvTGmZwKnDw7C3Ao/hAfJlUFzzYDFE8X7nuZ0vp/c7ebA0h+Gk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRqASE+MwvQ/IzoaH1X0l+R/tOcmrNeHVmUjIEOU9qchkb2ib3
	Yh/XYeO06/DGLbhLwlSpopgZ8GFJIKfZz5kE7saJD2mi7hHfzZF022cpnrk1G5fXomM=
X-Gm-Gg: ASbGncsYjk8mbTdXxbxE1cuKVIVOq1IUTHFk6ZmSLMvM9mD4k1O3+jcZrmN7Q54XYUf
	JDWAkMhNvetk5NXxCJ0zbfzUZ2cu3smjdZDqNimZf9KGcGxS63IvilNaeorT7/f7/XxsdI7+Y9i
	pNWV/8pOO5VblhCc9EhMgyzAw9chIMsRUcwC9USss4gTICQzwSnhpdQHATjv5/Tgp2Pzc+TedEt
	sldnKquUJmF/w4ofanBIz5FNA1tAmEDtY4WieY09RNHa4rSAyTF697U+xuCex3F7vg9FvfwZ4Fy
	5en5CnNmxnvrdAycsEwgVsAlAg7fnKwCS9+OC22zXpndMVgnsYIMeSA=
X-Google-Smtp-Source: AGHT+IHar0PqDY1QE4EHUJ2UDPwjmIuAL/4fwnWhb7FmMh0PHKvPQEkqatf4UNuUJGPMW4GVTDu7YQ==
X-Received: by 2002:a05:600c:8b56:b0:43d:17f1:2640 with SMTP id 5b1f17b1804b1-4532d30e471mr25451165e9.26.1749734136591;
        Thu, 12 Jun 2025 06:15:36 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:36 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:19 +0200
Subject: [PATCH 10/16] pinctrl: apple: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-10-556b0a530cd4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1644;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=1IApo4igNtXTEv/Q7vu31GP6B3n4wjJlImJTj9XqA2s=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLmWXbtvzzN20cI8pq1ql0lzItgzIAO4vu7/
 Vh13Q8eW6qJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5gAKCRARpy6gFHHX
 cu4rD/0bUGcQAKydYhwzI9Rk/4kHLYT1KvTVAL/i42Z3N0kU9QrjzFMdnxe7jVZscx8cUH4C0RJ
 X9vX1NV14ApTq4Go5LEVS87FcIdp+/PFp1v6HEJ2Z5Ei+lFdiGuViKFiVnbt0k7KUdLG/biuyyM
 s6fFrmrS+TfsQ5BFkvtpCwMfMANjwALeIeCP4WrYERolA9GZatzEePL/ARH6y1DSXROrVeMGDzE
 o4QV5ertmVruQ7cQaDBYdUSKcXziz3nUk3vVU0aq3RLWz4z0jPqnCsurFZ7XWH6++JSdwl9eGDD
 N+p/3J/wpZDelRBqVD/AP40yjN19ZnEKYJuseqMWttjNyzv+Tavo50Rtr1Zp4gVD2ynUU57Z0vL
 sEMEA8+n3RvnOXutl/uFVp4NdK5eaJruYdT2+ghGilFAdEn/UcdQGWE1gTPGqvD4k2NUSGJ96X4
 8T8eFub+XjCYsI4wnnCONAnuu1XYOe52wBFeUjCq93IFXlbOw+TUdspUkW9ih/YTUA985jdJKOJ
 tbfCEf6yADWiWCiHgKPcWgrnCh/TXoaxvooD/K+kkXUBQ/N8brH2KbqXnt1d8kVquhyNqVIBFoL
 w8p+GSbvQJQ3DGwzFuWGVO3aAa0fSjQI7BpFePHwFJbW+e7i/vVKozf6dqVUuhpNiqnF7WD5j5U
 Pfx5x5E6gbynZDw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-apple-gpio.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
index 0f551d67d482d96c7a1e4c28a6db580f0db6452e..dcf3a921b4df54250194403f06a3c1fb40110eaa 100644
--- a/drivers/pinctrl/pinctrl-apple-gpio.c
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -217,11 +217,13 @@ static int apple_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(reg & REG_GPIOx_DATA);
 }
 
-static void apple_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int apple_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
 
 	apple_gpio_set_reg(pctl, offset, REG_GPIOx_DATA, value ? REG_GPIOx_DATA : 0);
+
+	return 0;
 }
 
 static int apple_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
@@ -376,7 +378,7 @@ static int apple_gpio_register(struct apple_gpio_pinctrl *pctl)
 	pctl->gpio_chip.direction_input = apple_gpio_direction_input;
 	pctl->gpio_chip.direction_output = apple_gpio_direction_output;
 	pctl->gpio_chip.get = apple_gpio_get;
-	pctl->gpio_chip.set = apple_gpio_set;
+	pctl->gpio_chip.set_rv = apple_gpio_set;
 	pctl->gpio_chip.base = -1;
 	pctl->gpio_chip.ngpio = pctl->pinctrl_desc.npins;
 	pctl->gpio_chip.parent = pctl->dev;

-- 
2.48.1

