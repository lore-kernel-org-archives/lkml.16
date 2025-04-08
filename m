Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B1B1DB958
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 14:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744122262; cv=none; b=B/apkB6c3oxifFr/7fJYJOxlhhTHLuZ3w5I9zKwyw/kttoUm0OGuGkZpiUPM8yfJTUHjRMrkNbewahBIuaHl1BBIaJyS1S2VjM0Nqk6kf38Fa0gm7+jZFSLudni4XUaBqnmjWQlXvgeyGjE+lDy9J6uWYJMaQ+Mj1eaMbBuhADY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744122262; c=relaxed/simple;
	bh=J292iOE9WkhH72JvBdw12fX0X0zF4DUVgfCar1FYmPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DdfodMpYnXECOnYssRHaTdj3ffbaAOAGmE99djNacWaKpGKVxLuZawHNf/wTc5oXfW4SmgK1Galfieooo0JJlN1AWX9mQNgiuMRmkjj8Unnfi3a8HCqhUkcAr7UN80IV9Ub9khOXwL+XJj5pm6jYIDohfyNQA70rraJMcUhHqZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=BjGvoPzZ; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="BjGvoPzZ"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e5cd420781so10079541a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 07:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744122258; x=1744727058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jN75VHlpEpvNXbp74E5FvhHDPRMXANPA97q82FFTYMY=;
        b=BjGvoPzZ/RpuXPj1t66Ig2oC8P27wbSI+sCF3W7Ql90viKunEMSxpiSwI26prj1X1k
         h+qH+1CWdAjqKI2AoiJGaeOCGqbHfBnJwOUVsmyGB64bmNzxSovZ2WmtBJzeGwYowxFf
         GOYjWw2jcvbR1K6naIHC/y8oDIHXVGzi+QL5jV0XceVQTQqY3W//TA7xefrg4TCdtaS2
         5s+oZa2qZMAAV/8gweadqAX1G14SZ8QZbHdQNNXM2sXPem3ol/yWxQXlBLWC0EDCtoP9
         3mLCxhuSNkFVgULigG6hje3n3AgGU/d2R8xjjn7Syxz6+uiMbTszVQE7kNDihXJ8wL7D
         scuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744122258; x=1744727058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jN75VHlpEpvNXbp74E5FvhHDPRMXANPA97q82FFTYMY=;
        b=cs4+dk0jHfiKu3AMtnkCDW6K65dIyuxYznCsSNdVmfZCl9eLbJxWcOK90cNQucX2+2
         8eUcmKgCefCoGrFgX71su9nALbqW5/XDw7b2IEYRuhqHh3kj0/TC+nSme/eyLFXnglY7
         TawBdN7cRNGOjv+9igabgVA4vdtGRcuyE8inEImKGJOu/w/dEwrzEPAUMyQ1gW3VJCVj
         +zwYLfK+VYORbjVLmIJKybeETDHxHA/jMRdvqoCtBqp+UDccGUq9xAOFpGXHNfZh58ND
         DsKp01TVu4SYv9soYlJq9YNjMz406GYr0brZRHatZcFZaKVuQal8eSXyGQvt9NFJjDSP
         aYkg==
X-Forwarded-Encrypted: i=1; AJvYcCUvuOGvLPsPUF7GLlPZcoAd69GbWhurIJWude/xsFRkGYMirJrl1udV74kNWjVpkKgKafN7XaSD9HfJ2E0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwyafFwLshs0Zz6canjc35IZosZlo8Ey559tYo/xHMl1+AUOxs
	8DVj3lzjGemzl2Viy9BCO6+3mmZjKHk+f+MOE25pXfEXYzHf8wOF13VlOzJZX1k=
X-Gm-Gg: ASbGncuCTYixSNIxPcc2r/3v0evzz1HZVf0zxYZmm3UgKdLG6i/+0vFkXellRxairk2
	585SVQ8u7wJxJWTa+HuRrXy9z4n9THa5J0I+zJkJb+dA0snjjJSgB76qe3AnQTmJlkkocthPNmV
	hjYiTs8GG+2MryyYw6yWFn1AXyTtqtkA+6gtmb+pjOAgShwE1zffvnRmY+LVf9LOKFTBoq7oB+N
	KgUWuzNdsaL6K9EAMEDMNlvl34QFHD3IBzXPlyiSelhzoZcBH4oo+xLf9PXM0O0aH7W66Ra3/H+
	CjJs7HXcZq1fyoltEHJqCtQgcXv/Bh6tFC9zFaQSiukzxl0JVQ==
X-Google-Smtp-Source: AGHT+IF+ly+l4/UXy+tMS97/2RnWdvVrZV7ItHBInP0obZi8zGo0SzX72WCRJMp4qCaKmCr2ncFgqg==
X-Received: by 2002:a05:6402:501f:b0:5eb:9673:183f with SMTP id 4fb4d7f45d1cf-5f0db8352a7mr12278976a12.20.1744122257886;
        Tue, 08 Apr 2025 07:24:17 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5f088087a90sm7982446a12.56.2025.04.08.07.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 07:24:17 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: David Lechner <dlechner@baylibre.com>,
	Kent Gibson <warthog618@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/2] pwm: Better document return value of pwm_round_waveform_might_sleep()
Date: Tue,  8 Apr 2025 16:23:54 +0200
Message-ID:  <db84abf1e82e4498fc0e7c318d2673771d0039fe.1744120697.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1744120697.git.ukleinek@kernel.org>
References: <cover.1744120697.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1282; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=J292iOE9WkhH72JvBdw12fX0X0zF4DUVgfCar1FYmPE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBn9TF9/LpNaM/Bch8Has2e48caAj51HtjvT8X4R SrTHCuP2cCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ/UxfQAKCRCPgPtYfRL+ TomDCACo10bxApC4Nukoph5HIdTyAH85ItZMlMc72CtfYum40b1yruJffVXsKCVZP2X241L7cnu 8sQ9EPaKExwJisqiiF0DJXOhQGnru5jKnao+Gw/woTt5CWhqDHNOH3nONAtGdbBN2MMjmhq+6zd qQQWmJdNJF0ooyF/POQC5WPdCopOFrTCUCl5U9VxBbCwy/dBYeB2BF7Jx+valyH86tDt1m3c96I 06UaSkxGL7ksQQNR7VNPuQL5IUa48L6ttJabZcy4RHVICDs4JBTZOEzOHWxwbCdSvn9XPFn8IjE C7L7UZMYRQr1JdlcMJpE9eLJKHFx6Xy1JIXfiRfDZz/jVgPY
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Better explain how pwm_round_waveform_might_sleep() (and so the
respective lowlevel driver callback) is supposed to round and the
meaning of the return value.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index 59cc8792e312..cec325bdffa5 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -229,8 +229,12 @@ static int __pwm_write_waveform(struct pwm_chip *chip, struct pwm_device *pwm, c
  * these two calls and the waveform determined by
  * pwm_round_waveform_might_sleep() cannot be implemented any more.
  *
- * Returns 0 on success, 1 if there is no valid hardware configuration matching
- * the input waveform under the PWM rounding rules or a negative errno.
+ * Usually all values passed in *wf are rounded down to the nearest possible
+ * value (in the order period_length_ns, duty_length_ns and then
+ * duty_offset_ns). Only if this isn't possible, a value might grow.
+ *
+ * Returns 0 on success, 1 if at least one value had to be rounded up or a
+ * negative errno.
  */
 int pwm_round_waveform_might_sleep(struct pwm_device *pwm, struct pwm_waveform *wf)
 {
-- 
2.47.2

