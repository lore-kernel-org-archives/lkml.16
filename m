Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CA026560D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097916; cv=none; b=Nfifm/Qj6pHifGo5d7La29tcmixhx9090JCSXt5SR/4ZlM2Kq9tixsKNlKSbS+99mluyUT3UjGWcEA971Oj+0TmG0OR6Pt4vo3wsrV85P9Ffx3xe3Y3hWYAP7uN/7AmWSj/fexYt0TvKcPzxtKBz3+7r3sHXQCbztFslssvDhNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097916; c=relaxed/simple;
	bh=R/A3ylqOH9M0lwaSSat9OzcHkaRY1rHj05MI244k0Kw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ul4KEq4mcf83mhNMh3Cyj/2mmKP2ML/glBl1PuAzA9h1DVcrGvWD/vr0eZvGWWHJ9jZxmnMqr7CHvwmQx3YlmkRScoj1Wtm34aW//rl3u5Tan5JqtnBYDv/kMI7dxKZTmK/gfCTuNbX++A4yo2P1kS1Eg/HDVlfA/Q9MJk7SYog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RXt1wO2c; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RXt1wO2c"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3995ff6b066so2830061f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 00:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744097913; x=1744702713; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B1uFhkuKxlLMwl31+Z0D6QqX7Bfo4gt21QMBWz3jFqM=;
        b=RXt1wO2cCD+aZTO0dw2wUq5CzOHh+BbDPxSOPi4P2PYgKLen3IQsX+e7D14nM2HLRi
         veRzBOuRWDgz6GhFYGQt1c+X6Kk0CKQtUxSMtzTIUCJJ5U05AEpkVNqp0VW2ZVyeC7hd
         bK1qK3Bm6K7jb+fvANqKuBqB84GnUO0U4i2o7MvEFOXLkohzX5+aQ4F3DVe9ArBq/7c8
         3EnCqFsffPU/VHM25Z5tVfr1J0wVjyiSGWpnYNKWmNlmBPhYFC6pNAcasqqtQNNgV1xO
         oGiE42UnfQy3VQPd0N8fDQTZPtB32sSot50v6NQQUL7SsYVb7SrzXLIhW0WInvh3gBVU
         neng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097913; x=1744702713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B1uFhkuKxlLMwl31+Z0D6QqX7Bfo4gt21QMBWz3jFqM=;
        b=Kz0sU0nKHCQDeLmNfcNvEdpAHMojcP7rnAKt1DqXPhcAfkK9lg95gOMPhovsEEi14X
         PlfKiRjzWIPoKCg1hwv6MO13uR5z5d4hgn9Is9uAzQtxcqWaSqByHmwO+6MSzYZ0sRwc
         QT8VB4N9Uj8uTsRCc55nnSH8MBn8ytIRcMVAP+Kv0UVqasNnDJ9gElt2/LnkqDE2Xddn
         VAX3HZmpABgCErR8y3rzLC0YoiPxr+TbNdubEbIWvYjQnwP20MXEWRG807tFB59rzVxo
         lEgYYruEMjo38ujFRlZ+FC7XJJQkrOXjQa0JXah88j5R4WyztrIY/tmibrBCGu3XIq2h
         7QUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVB7rmAFYriBmFpU3vrNKKMAVN4ArlPottpRHXbmVbDSjo3l3qRI4tBbAmM7xkIGr+zOZPGv285FOi4eYw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBEpcggx/caazgR5+TSEd9OyFJLqyb7RGNzH1Sv+zt3mKa0Fpc
	18O2WrmrXaLMJPXDZDbWJSYeNwo4ZUEUHZDxfqwJZiYI5NXBy9ZEejOmMJTOPC4=
X-Gm-Gg: ASbGncuTnYLAJtXJzWkz6Zshl21xxyJkG61a7RT4LtTMr2XqKDRRTzQzU86WDgChl5f
	pmYq02efqJSs9DbOmLh5Zs37fnpY6fro3lM+SBXPZWlYIQLPvwRkdfzd2ZW5B7AUOkkSNg9iT09
	hlPPQTZbYi9iYmp+6VkUbnFTKKlLBsMkjqCKUMZ+G5znSzffk+KMXiI5Kixn8nVdXvrM7GMqlSS
	dxBjG6W7VOe+TxsMjkzDT3mwVk++10Nk1cYBRBduDWATbW7ee1KTOMEdklFKFPUkZVxhpBzPBuN
	zeXjhq/Lxqmi3wg7JC4MezEBES1xiLEfd8pUkw==
X-Google-Smtp-Source: AGHT+IH7iNRt7fIB3NK4furLHtKGOmNKWjDvqJqeUDP7R1K5uKGIvdDe43Tv9iw3hACcOH9nLmnqQg==
X-Received: by 2002:adf:b647:0:b0:39c:13fd:ea9c with SMTP id ffacd0b85a97d-39cba933220mr10732675f8f.47.1744097913203;
        Tue, 08 Apr 2025 00:38:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30239813sm13892137f8f.101.2025.04.08.00.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:38:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:38:25 +0200
Subject: [PATCH 07/12] ASoC: codecs: tlv320adc3xxx: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-sound-v1-7-dd54b6ca1ef9@linaro.org>
References: <20250408-gpiochip-set-rv-sound-v1-0-dd54b6ca1ef9@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-sound-v1-0-dd54b6ca1ef9@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Oder Chiou <oder_chiou@realtek.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1473;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=NsqwcSofKcQmDaEngiuDI5yN4QKWQmReIXbN5GWUN9Y=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9NJvYdFcFg+BfZgGFSOp+Nn+UTNQcd/DMKJ7h
 sDDcwF4HqWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TSbwAKCRARpy6gFHHX
 chnqD/wJyAtjmyiPPpsVt7o1nDHpXRZY8sLviChhI1phvTSvnrU3BpTQiBjb09lyDoBqVReMTnK
 kstdJfb+JXw8xJhs2Rlyt/X/AcZOvHokd/eJWvRB8zjlkQOCvzsgle25YtURSJkg2yNsIWL5ZUM
 hJGoMqM6pM7lXQ+NRiBs21v8f+93uAreL8pNwkitKdyn4td9CC+rfdVi6s0Gy4kMqQ4VuXyaq+L
 SIxV1W7LhXWlxlbSsjMJm5IGeK+4z6mEnyoid6WZbshAWIhN7L9JOVmf9szQfGQMPwPv8pFrnmn
 Tt8vXHJ1uTm9SHP0dS2trsf9Ef4EppfmIDTXJlXYr9I9NBE7Yz7g1Q2egLzs8FBLChjWPeK/Kr1
 TNi4KObYXv5YfocxPwZfHX1CTzv2ENTOOXuJ8tJALFhltcYF2wd4CDXuuCRtE5ScxtdJEkHJL0C
 R/ZvmG2gwORLBGdwxOKixxAAqn91RPfwcJR1q6FWSqzQsapjJRXJYAVvmIoMvzy8ESYE++4H8j0
 JpwUKJ2cSqOcRe8uF+EukAC5efOZKyCRc6F5sUSAtKU4/JBXN2cp8HBcEYPyMW7E6XRqMB2FZFl
 7DIbjxOObh6kam3uoBLZa8xooV/Wz0V8e8RKmRFsLY/4ureE4MCHDPdO1ths/duwx+muvrG+Syc
 pZw7RuDmPiH4WdA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 sound/soc/codecs/tlv320adc3xxx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/tlv320adc3xxx.c b/sound/soc/codecs/tlv320adc3xxx.c
index 191e067ed1c9..1035ba17dc5d 100644
--- a/sound/soc/codecs/tlv320adc3xxx.c
+++ b/sound/soc/codecs/tlv320adc3xxx.c
@@ -1015,10 +1015,10 @@ static int adc3xxx_gpio_direction_out(struct gpio_chip *chip,
  * so we set the output mode and output value in the same call. Hence
  * .set in practice does the same thing as .direction_out .
  */
-static void adc3xxx_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			     int value)
+static int adc3xxx_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
-	(void) adc3xxx_gpio_direction_out(chip, offset, value);
+	return adc3xxx_gpio_direction_out(chip, offset, value);
 }
 
 /* Even though we only support GPIO output for now, some GPIO clients
@@ -1052,7 +1052,7 @@ static const struct gpio_chip adc3xxx_gpio_chip = {
 	.owner			= THIS_MODULE,
 	.request		= adc3xxx_gpio_request,
 	.direction_output	= adc3xxx_gpio_direction_out,
-	.set			= adc3xxx_gpio_set,
+	.set_rv			= adc3xxx_gpio_set,
 	.get			= adc3xxx_gpio_get,
 	.can_sleep		= 1,
 };

-- 
2.45.2

