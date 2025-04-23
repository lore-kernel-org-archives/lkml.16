Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B890E1F4E34
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745398407; cv=none; b=E63aC/PjQw90SgHWCmgirsjs0dJLw2KD+Je71Ypavg3MaBS2omIAXGREb0bpRR1zt8YFHZvFTxPenV3wZAhC0FV1+LCDwOzBy9ZPFmZlrAVrXNVZJHzVBxTSaoAIeSwVUy98T+TcKTaPq8I13PYHFr0/A6aAJs/gTfh55pATiKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745398407; c=relaxed/simple;
	bh=AhRbnxt00FmE/WhEN1u8zVz8q5gXEKLj1JYmMYck0AA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RO3XXGyOWpezxR+Lnuaq8U/HPfqbS8jLUUsb7AEmeT5vawbhK01TAmEnlhLW4ZKqMbZzHvNVya09UD5p/xBz1jLtafIZCrbmhCADfXLL6KmCo168AXxIlwr5JYIlG11gBQdJquqJ/Rl227tVVTrm/hsc5rK79bTVeFG/7MMWK2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=Cu9kjWIG; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Cu9kjWIG"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22409077c06so86188105ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 01:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745398405; x=1746003205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTYlTOXj1U7VnsAmcUnx1eYdk5rL5ZGZ7LNT8Q6B11E=;
        b=Cu9kjWIG8znuKzo0gtx2TMdcxVbb6b/Goxq2MzVzzPpa2kkowbuxhJCVcjQa5pKEZT
         58EXQw5d4HtUQiJO/MATgbx8yfCM4QgzUerZ5LHflaki4bEBEiUjVKXytPoJpBJrcqps
         XzxSc9Bez1kYOQg/LtL1B+DM7Qts3CLsd89vff713nLLFmFBZX2425L0t8BmHrK71wZJ
         NH8yrqLTmBSH6lbk4S+EZLa6gXQqDAlZ3M/Jo/yGEO11zxp230mjdFrkHipHRXvBt3mN
         LTKcPAuYRvlNOvGNZiapAfQQwqPI+E9zDPlO7W2hdYE1xK9MWkiHXH5EFlmfk8NAqQu7
         ytCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745398405; x=1746003205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dTYlTOXj1U7VnsAmcUnx1eYdk5rL5ZGZ7LNT8Q6B11E=;
        b=cZLDkfo/qtBnoia3Osb4u2yls+XH1RBM/mkttJ8qUUn9NLw5xgTRcZg+fE4k8u25or
         KXeeRZpYAVDtJ90YdcM7or0W1eGh3lXcntS5Va0MSodl4EuApxZXirFvzhNQYXkTjVE5
         JqtrVEKCluBFA0b94gFzuoJbjxzknBxV2w1DQsSP5Z5wS3/x7MUJByTs4jSoHXUCk3Zj
         HEiH6awCJtu2psXx8StqFEwHbOMJfauvV/y82FbGmp+Mzl+w07CpSds+Uvt+QWyqyXwi
         pxRhvz4rPAxk6ofRPs0EEWOI5I9ydtiZ4QnPyu4XSghGe7er2U4nDpcUl5EEKGSns2Hm
         suzw==
X-Forwarded-Encrypted: i=1; AJvYcCVuvxRRv0zB7SNiEim9+WE9B3w09LoInJkO/ClxARwPUp60Yfbt//24QMmK8l3csgjkK29Wnc2wnO0l88A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCl7DVltGjrcjW4hBZsehSKda3MYy2Wd6OQl9vgijcuFYcbNGR
	UDYIz+6pDUPhoG6re1pKIOzotk1JJcnjCK7cgX1aAw8R6fXQaRd/EToZp4QMpyQ=
X-Gm-Gg: ASbGnctyBhfEeZk28hPObJzwtdwZPDqK45mdmFHG89ZUhEYte4Kzq9ViTfK8yMn20VP
	tH/Fv/o7uFS2YvyHTzWD/YlVj8f5lvLa7vQSlsc7M3b14sMrDKruhzl0yb1o7BeO7KfsRmCKAwi
	3fG4Mt3vwBAOaECYc24Wi+JoLDk1FisqfjqwTcC0eEH9b45gRRkqKkO8u7L9KSKk1MsAhqmmbMU
	F+Ubc3ad0xdLUoB/tW0dJ2oP+MYOA04Zp+8n3hJWxBq7vPsZr5L6bY7guAkGjLoRFR6RPmfKkkU
	eqidObW/SwUOwwBW7ecOggyAY1XU7AowDbHyvf23FZ99wYXj9b0/TVX7nPCQafo1UVxiT3VBdlk
	bwQoDFA87syZ7
X-Google-Smtp-Source: AGHT+IHsne6SwuPfQCy1RW0kcEWQ/ZXryn74BlHfS0I+6JQfEYDqbMrgCVn3H2qm22jhwAVayF6+Dg==
X-Received: by 2002:a17:90b:568b:b0:2fe:a545:4c85 with SMTP id 98e67ed59e1d1-3087bbbfca6mr26166817a91.27.1745398404883;
        Wed, 23 Apr 2025 01:53:24 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309dfa5f880sm1047611a91.38.2025.04.23.01.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:53:24 -0700 (PDT)
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
	Zong Li <zong.li@sifive.com>,
	Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH v13 2/5] pwm: sifive: change the PWM algorithm
Date: Wed, 23 Apr 2025 17:04:43 +0800
Message-Id: <20250423090446.294846-3-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423090446.294846-1-nylon.chen@sifive.com>
References: <20250423090446.294846-1-nylon.chen@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `frac` variable represents the pulse inactive time, and the result
of this algorithm is the pulse active time. Therefore, we must reverse the result.

The reference is SiFive FU740-C000 Manual[0]

Link: https://sifive.cdn.prismic.io/sifive/1a82e600-1f93-4f41-b2d8-86ed8b16acba_fu740-c000-manual-v1p6.pdf [0]

Co-developed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
 drivers/pwm/pwm-sifive.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
index d5b647e6be78..bb9146267bc5 100644
--- a/drivers/pwm/pwm-sifive.c
+++ b/drivers/pwm/pwm-sifive.c
@@ -110,9 +110,10 @@ static int pwm_sifive_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 				struct pwm_state *state)
 {
 	struct pwm_sifive_ddata *ddata = pwm_sifive_chip_to_ddata(chip);
-	u32 duty, val;
+	u32 duty, val, inactive;
 
-	duty = readl(ddata->regs + PWM_SIFIVE_PWMCMP(pwm->hwpwm));
+	inactive = readl(ddata->regs + PWM_SIFIVE_PWMCMP(pwm->hwpwm));
+	duty = (1U << PWM_SIFIVE_CMPWIDTH) - 1 - inactive;
 
 	state->enabled = duty > 0;
 
@@ -123,7 +124,7 @@ static int pwm_sifive_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	state->period = ddata->real_period;
 	state->duty_cycle =
 		(u64)duty * ddata->real_period >> PWM_SIFIVE_CMPWIDTH;
-	state->polarity = PWM_POLARITY_INVERSED;
+	state->polarity = PWM_POLARITY_NORMAL;
 
 	return 0;
 }
@@ -137,9 +138,9 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	unsigned long long num;
 	bool enabled;
 	int ret = 0;
-	u32 frac;
+	u32 frac, inactive;
 
-	if (state->polarity != PWM_POLARITY_INVERSED)
+	if (state->polarity != PWM_POLARITY_NORMAL)
 		return -EINVAL;
 
 	cur_state = pwm->state;
@@ -157,8 +158,9 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	 */
 	num = (u64)duty_cycle * (1U << PWM_SIFIVE_CMPWIDTH);
 	frac = DIV64_U64_ROUND_CLOSEST(num, state->period);
-	/* The hardware cannot generate a 100% duty cycle */
+	/* The hardware cannot generate a 0% duty cycle */
 	frac = min(frac, (1U << PWM_SIFIVE_CMPWIDTH) - 1);
+	inactive = (1U << PWM_SIFIVE_CMPWIDTH) - 1 - frac;
 
 	mutex_lock(&ddata->lock);
 	if (state->period != ddata->approx_period) {
@@ -190,7 +192,7 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		}
 	}
 
-	writel(frac, ddata->regs + PWM_SIFIVE_PWMCMP(pwm->hwpwm));
+	writel(inactive, ddata->regs + PWM_SIFIVE_PWMCMP(pwm->hwpwm));
 
 	if (!state->enabled)
 		clk_disable(ddata->clk);
-- 
2.34.1

