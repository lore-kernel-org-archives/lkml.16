Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68A1259CBB
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 11:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746014188; cv=none; b=NPzOoYNUuIPJI8zlejKnonb193ZVAIsWVovLUy73QhGZbAoXX6fLtpUwjX5T3y/LBNzWKSXTmASCODaPVYF5+Y968Xf1/lL++mgVuEdeZQdQjA5G/nvO6WelisnbU9cK7ZuVpXTgivDcX6VcJAYdboVUeOzonM+I4pWHXFHBJA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746014188; c=relaxed/simple;
	bh=RjoEXSIkY3DqTEk4/M+XxiagMUMOfWsaQZWgGc6PuWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z3YxuN2f047m4lfgn6841I0SKZwyWUBqW6t2XU1DHQjwX9XPPhgtkVG75RMTL8M1DHbcPtufUV54BP18pJhLl3NZWTO/XyT5X33BGU9DQ6/qATSIykswhtcaBM9Ld+kR7zSRrxc5OJPjKZXH2uSkhU9vp+D7IKEdxaP9nOjaq9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=tD3GNvO7; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tD3GNvO7"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39efc1365e4so3324665f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 04:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746014185; x=1746618985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRxmOkREDtNcYi3zS5d08yarRVufAZekuzgf6z5cgxM=;
        b=tD3GNvO7uBNyIi74rDd3aFQ6CDs8e051ZWkHn0DMjp6+jsbEVVFNLhSrXl1viCHdTr
         8JClVAkD9QkWlvMhgthT0AA4lK17ZTQ4izksZ5qVJbl4OrJfRDoj/MhL2CGYXCWYR5IE
         eJHrsDWdiVNkffUyTfKaFljxIW0Fc4+zk42saJCM07pUFdfNDUcQf3xqKLxSwzEWDjp5
         n7yQX/1vVxr/PgeKSLdnIOUU4dmpDOkGnS44SiIzvMor5RVlq2dxH/rSmUVGoaUWpV1I
         8/7zbAjtZFTzVVvLjWHGfWShToDCdPxjvTcirp+KyFfr1uX8e0uqT36gzIR6AWPqB2EZ
         ugqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746014185; x=1746618985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iRxmOkREDtNcYi3zS5d08yarRVufAZekuzgf6z5cgxM=;
        b=GW6ksnXbX1bD8qx/3v64FrINdJD2avgFCSzNrw5HqeAKEeAeDy7RSdJDi45obwA32o
         QQi7KdHaLuYk3c4gIE6lGfdtlCWoO2JNgOhXO3FTmCc0QH3WEcy/Qsx+/+zum7CvY5SC
         wdStBuKV775/HN/zb53CYxqoCXHGA46HMDMM0V7T957uy65ADAMAUAX5WFP06Csg2RI7
         A5rAlk1qX5YyFmeufqfxL5/Vui6OaFo6BQNL9E7pIo0s9tDKeKvKFfRpovUXJf02fZiW
         dmx3fl8K+NybVgz7TvD9kFc03L7/MoH8Fo4q20wlD5O6AqsGDjS8x+V9EyWgYYvZTsr4
         afYg==
X-Forwarded-Encrypted: i=1; AJvYcCWnOLSIMZz7M8SG8nmw3bG+W6Zf4agAQNMDwkTXljnPOCw7gMvlaZ6MRcfWBUQ7irFXme48mq+0OtC4rJc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzoxo3dnebnraRKe+mMv9+gPM9x+xnordM2qs7lfhbLGEXxa7AH
	G23r4G4nkdNuubn3NvfhBSQzjRei4BeqCbFYvxm7T4OiuTQmeAWIBbNvEb9oURE=
X-Gm-Gg: ASbGncvKpoqpjlQ6ZhR29TQLRulZSlPYpl2Zmjb+AGEJ0mF3CfPFGAb0NpzgHhHVbPa
	353s5M8wknO3t9FfsdWIB7LCcJ3NpGU3TPoS7GxcBDBGvjAtrxXWoe0GM4D48gJ8vbvWBHLhcyv
	71OBhrLVuKxJ9akrdv/a6w6xqHzAU9dW5xXQuOGdxQMRr1eybLKC5VDTIgtgdL1r+XsHTrra1F3
	Z0K5E7oxk4THgdApIDeBspoTGyddWu7T7RqPT6EBdjPbdPzJcMkZtqfT59DqAZy2B20+TF+O7nN
	TgLmPJisXQceotjIpuicOeSs1UQ05oS+M7IbsnNm38Y6Ka4ObqUtbhcIoUEszebauU6KRXT/q/u
	wDB1bvuw=
X-Google-Smtp-Source: AGHT+IFyQST3rH0YuQYldPgvha6jikAYlv7DUnoof5VueESfC3/kHD0oJ3b0nyoh4FA/mTRr6s2cVw==
X-Received: by 2002:a05:6000:1844:b0:3a0:7faa:309d with SMTP id ffacd0b85a97d-3a08f7c8ecdmr1805907f8f.37.1746014184884;
        Wed, 30 Apr 2025 04:56:24 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073cc4025sm17070285f8f.56.2025.04.30.04.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 04:56:24 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: David Lechner <dlechner@baylibre.com>,
	Kent Gibson <warthog618@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/4] pwm: Formally describe the procedure used to pick a hardware waveform setting
Date: Wed, 30 Apr 2025 13:56:00 +0200
Message-ID:  <d2916bfa70274961ded26b07ab6998c36b90e69a.1746010245.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1746010245.git.u.kleine-koenig@baylibre.com>
References: <cover.1746010245.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2752; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=RjoEXSIkY3DqTEk4/M+XxiagMUMOfWsaQZWgGc6PuWc=; b=owGbwMvMwMXY3/A7olbonx/jabUkhgwh/htfS9ZlvdrfbJkx37ufs2/D9FXxGzJzPIP6srx5k 3Zk777fyWjMwsDIxSArpshi37gm06pKLrJz7b/LMINYmUCmMHBxCsBEGrs5GFY+VLOcGVGw9/6k 9o18nTYnuQu1c9rUBaZa/Dy6Tr063XLlEkWDZfzFk2Rkvr0U7ZRMeO/dqL7W9fLH91crg8WmnPx WLWym/e1/dLHujujGFNbAT4FrZ8e2RGRsf+S4sye12orTOrb9tOc8iW13jHRjp3zeH7jGL183z2 HTpI0VgYk9rjOPJxo2+b1NN3gf1zitoWyZ3/NXtUE2Xpxn+Xc/dbT87mVxNqXbf8HKW27dkXdn3 BEMOFW/nz1u06+Tzu53rs/K4X3D68wSZiMlvr/67uGAfrn6eXJtqtLKEvVl35l+3S6q9pik8tHl cdIZrmW3Q3U1wp+faVrHVBdh+OHayQvrIn99Vra702IMAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

This serves as specification for both, PWM consumers and the respective
callback for lowlevel drivers.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/core.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index 5cf64b3a4cdf..4d842c692194 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -231,7 +231,9 @@ static int __pwm_write_waveform(struct pwm_chip *chip, struct pwm_device *pwm, c
  *
  * Usually all values passed in @wf are rounded down to the nearest possible
  * value (in the order period_length_ns, duty_length_ns and then
- * duty_offset_ns). Only if this isn't possible, a value might grow.
+ * duty_offset_ns). Only if this isn't possible, a value might grow. See the
+ * documentation for pwm_set_waveform_might_sleep() for a more formal
+ * description.
  *
  * Returns: 0 on success, 1 if at least one value had to be rounded up or a
  * negative errno.
@@ -411,6 +413,26 @@ static int __pwm_set_waveform(struct pwm_device *pwm,
  * possible/needed. In the above example requesting .period_length_ns = 94 and
  * @exact = true, you get the hardware configured with period = 93.5 ns.
  *
+ * Let C be the set of possible hardware configurations for a given PWM device,
+ * consisting of tuples (p, d, o) where p is the period length, d is the duty
+ * length and o the duty offset.
+ *
+ * The following algorithm is implemented to pick the hardware setting
+ * (p, d, o) ∈ C for a given request (p', d', o') with @exact = false::
+ *
+ *   p = max( { ṗ | ∃ ḋ, ȯ : (ṗ, ḋ, ȯ) ∈ C ∧ ṗ ≤ p' } ∪ { min({ ṗ | ∃ ḋ, ȯ : (ṗ, ḋ, ȯ) ∈ C }) })
+ *   d = max( { ḋ | ∃ ȯ : (p, ḋ, ȯ) ∈ C ∧ ḋ ≤ d' } ∪ { min({ ḋ | ∃ ȯ : (p, ḋ, ȯ) ∈ C }) })
+ *   o = max( { ȯ | (p, d, ȯ) ∈ C ∧ ȯ ≤ o' } ∪ { min({ ȯ | (p, d, ȯ) ∈ C }) })
+ *
+ * In words: The chosen period length is the maximal possible period length not
+ * bigger than the requested period length and if that doesn't exist, the
+ * minimal period length. The chosen duty length is the maximal possible duty
+ * length that is compatible with the chosen period length and isn't bigger than
+ * the requested duty length. Again if such a value doesn't exist, the minimal
+ * duty length compatible with the chosen period is picked. After that the duty
+ * offset compatible with the chosen period and duty length is chosen in the
+ * same way.
+ *
  * Returns: 0 on success, -EDOM if setting failed due to the exact waveform not
  * being possible (if @exact), or a different negative errno on failure.
  * Context: May sleep.
-- 
2.47.2

