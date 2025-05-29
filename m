Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2ADD24EA85
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 03:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748490204; cv=none; b=By5mPWsABAVvXwRxZ4sZ2IqsyxilyU9Ar6mOuBJ4yJ0UTokTD88vLgC6ywIKM87C0y9CwJFtjDPc9dO+bKdEikaLbV8dRkQeuoZgcqPgcfkqiFEBPyKIKnpnPDhmcJq+WmnmbgQ8cPFKl7XmP7DuXUb1StL6V/yyhCZXIesHN6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748490204; c=relaxed/simple;
	bh=flsrf78ADstduszuNfIIsFasVeoYk0NLoNIljnBjXqI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mNSUiWZvNqplARIQOdB+tjJgWrUIKUATM8TGKILyMnfAvP+XBRgDLgvrYc4eIZxC1DAnbuObK+HySOenb7YbZV6opzTjFotWqqkwcCTaJ2A3lgI3vyllDParbcC3/ReL4hbQ8pvdBb7aGvwHcFScDF90ssHBEPdq+IFWxIiReK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=GkHcaWNq; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="GkHcaWNq"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-23508d30142so1290475ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 20:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1748490201; x=1749095001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7f3IyERhfqlZ+9BGF7A4Kt5h9pzQNTOt7gsFORfraM=;
        b=GkHcaWNqB3uf2Dku/frlVWBLunpSO/ZkqI/sJDlR2zIYBQjIAesFOGLs+weES9F6Vi
         XIMN0Hgx+9I4IsnIkmMqjUEaYxbuuutWHf6FBMcRSJFck1xycY4u3ArkfwH7T5zBrZAk
         Bpr5VFh0dmytno/nbJmWY7SKncJUJpSI+ZzD9YcNWCAHCDIKYLYBvRqiL8eFLLKrOikY
         KOq0S1zdQlJgMFgi45NddXxd88sAFisarW6wb/b0gaxDSvUToIvOK+yZSQ6IkZTRyOKv
         YDQGI9JyLHZXtFNyHdAt3P2/TTrzzP06ohqZH7S8bwwa2m/eJVA2WODi68q6P0/ljGXG
         tC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748490201; x=1749095001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E7f3IyERhfqlZ+9BGF7A4Kt5h9pzQNTOt7gsFORfraM=;
        b=vAwEHHXNr1JAgXGv4/8K1yUbiNJLg97ni66kz6Kbtr7t0/FCphWClDuVMcVFrgg121
         +jIkJgpbq/yVUQbWKeIU+acI1o/Ed/0SNO74pyNhAXiyNj+7DoXOjCg79oIIIzzd/Qa5
         Gxxu8mgXaSB5pOPRgVryDQJSQFPNig7Hb4dILvKvAwUrcLtPS1QtRCNd2Gab2827zPr2
         L61KjoCSXaHPU0y0VS94hBKD7Xfj3fRUJX6tddAx+wCSYtYezfROAD9SD3Yk6bssPHwz
         tRk0jSCxmMeHV5UCH2dFlbsUebdXvZnVwm+4p497sw6uYa6oPArqPW6R8a0vKi7M1IU3
         R/MQ==
X-Forwarded-Encrypted: i=1; AJvYcCWg5gAhe0Y7EUj/J1VVNK0vLLivxSLxdC3LzBdi2j4176mGEhqHSjUpMhsraIKq7l4j73XO1VXpCA9ywd8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7B0GVReWL2urMq4Jpjf/LURPqiqM6IISFsddPDdhW9KPNt4KX
	P8WXAvjkyEyORgDeEgzS1G9xFJqzTy8y/+UyHoS1jJwZW7kmBB4Vp08iGHiKTxo2sBs3zNmWiFu
	fLG8inLnoaIZgWnQ=
X-Gm-Gg: ASbGncs470Z46MKxBQzq2IokaImZ0RKKi/UP4jSiz8Du3hxx5wdECszRAgyk3rlTYV3
	ULU0XC5OCvB3bBzVh+NEZpb43MboXIURveJiuaeni0JRW0R41mP+JqR9Qr/LbVJqfvV3gbiA9ui
	j0edH199NdPIbpuaano/1PnMBAMWpEz7BOyLcj4bTDiw45t5NkrWAY8IbK+1nvYyZs1uRlp8lhh
	jnp0by+EQlbRjIG9V9WAZCCGf6HYkIKuoPEoAznfziu7EusAXoHx0PUTLQqpUm1XVjWIg6N9Pfh
	yrb7HGtcLjkrUFk+TW0jXW/sOYXUqtkATXNNqGM2hbz6A914u6N5jY05RtpbZT4kCNWgzhRjYkr
	25Klt8qssPDE4
X-Google-Smtp-Source: AGHT+IH5Y8EDMppSiMya4T548VEwYkSKhJqKlchdDU2Hj4M6cj23ihri+hOVMR8Z2nfo6I1IKGtyrQ==
X-Received: by 2002:a17:903:4283:b0:234:bfcb:5c1d with SMTP id d9443c01a7336-234bfcb5cd4mr70545935ad.40.1748490201163;
        Wed, 28 May 2025 20:43:21 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd92c7sm3425905ad.62.2025.05.28.20.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 20:43:20 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Nylon Chen <nylon.chen@sifive.com>,
	kernel test robot <lkp@intel.com>,
	Zong Li <zong.li@sifive.com>
Subject: [PATCH v15 3/3] pwm: sifive: fix rounding and idempotency issues in apply and get_state
Date: Thu, 29 May 2025 11:53:41 +0800
Message-Id: <20250529035341.51736-4-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250529035341.51736-1-nylon.chen@sifive.com>
References: <20250529035341.51736-1-nylon.chen@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fix ensures consistent rounding and avoids mismatches
between applied and reported PWM values that could trigger false
idempotency failures in debug checks

This change ensures:
- real_period is now calculated using DIV_ROUND_UP_ULL() to avoid underestimation.
- duty_cycle is rounded up to match the fractional computation in apply()
- apply() truncates the result to compensate for get_state's rounding up logic

These fixes resolve issues like:
.apply is supposed to round down duty_cycle (requested: 360/504000, applied: 361/504124)
.apply is not idempotent (ena=1 pol=0 1739692/4032985) -> (ena=1 pol=0 1739630/4032985)

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505080303.dBfU5YMS-lkp@intel.com/
Co-developed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
 drivers/pwm/pwm-sifive.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
index f3694801d3ee..4a07315b0744 100644
--- a/drivers/pwm/pwm-sifive.c
+++ b/drivers/pwm/pwm-sifive.c
@@ -118,7 +118,7 @@ static void pwm_sifive_update_clock(struct pwm_sifive_ddata *ddata,
 
 	/* As scale <= 15 the shift operation cannot overflow. */
 	num = (unsigned long long)NSEC_PER_SEC << (PWM_SIFIVE_CMPWIDTH + scale);
-	ddata->real_period = div64_ul(num, rate);
+	ddata->real_period = DIV_ROUND_UP_ULL(num, rate);
 	dev_dbg(ddata->parent,
 		"New real_period = %u ns\n", ddata->real_period);
 }
@@ -143,8 +143,8 @@ static int pwm_sifive_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 		state->enabled = false;
 
 	state->period = ddata->real_period;
-	state->duty_cycle =
-		(u64)duty * ddata->real_period >> PWM_SIFIVE_CMPWIDTH;
+	state->duty_cycle = DIV_ROUND_UP_ULL((u64)duty * ddata->real_period,
+					     (1U << PWM_SIFIVE_CMPWIDTH));
 	state->polarity = PWM_POLARITY_NORMAL;
 
 	return 0;
@@ -159,7 +159,8 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	unsigned long long num;
 	bool enabled;
 	int ret = 0;
-	u32 frac, inactive;
+	u64 frac;
+	u32 inactive;
 
 	if (state->polarity != PWM_POLARITY_NORMAL)
 		return -EINVAL;
@@ -178,9 +179,11 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	 * consecutively
 	 */
 	num = (u64)duty_cycle * (1U << PWM_SIFIVE_CMPWIDTH);
-	frac = DIV64_U64_ROUND_CLOSEST(num, state->period);
+	frac = num;
+	do_div(frac, state->period);
 	/* The hardware cannot generate a 0% duty cycle */
-	frac = min(frac, (1U << PWM_SIFIVE_CMPWIDTH) - 1);
+	frac = min(frac, (u64)(1U << PWM_SIFIVE_CMPWIDTH) - 1);
+	/* pwmcmp register must be loaded with the inactive(invert the duty) */
 	inactive = (1U << PWM_SIFIVE_CMPWIDTH) - 1 - frac;
 
 	mutex_lock(&ddata->lock);
-- 
2.34.1

