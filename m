Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B8B279330
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 09:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746783703; cv=none; b=cnv7uKZzmr3ff5nJrDkKtN1fMywfIiVuh1/1dVQjc+kZKoGPiW2yD8MSwYE8hKBHduKr79eJS4O5Rpc7G1oE+nJgr2sP+oDGgyFMeHZWKRmrS8BFaYw01cLTED0eDropInAgyVmIm3QYKoFI0H6KzL3cMMMIwartqSAzCTegteE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746783703; c=relaxed/simple;
	bh=AhRbnxt00FmE/WhEN1u8zVz8q5gXEKLj1JYmMYck0AA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RCH9CDY54LY3M6G8YJ+U8JiFNCl2ZHLgJ9GNvOHUEmCBP+JYbGGGC+KMNbHJOK2gZEnNze20ItiEypuoZrB27b4O0fHg9IK3Qg7LPFHGyxpDqiJfsSmXXCWHM1ZevAOMnjo0NJv2XOkFuvClP1B5bvGfyDSkHCXO2iNhqekh8ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=gnk6RZ/K; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="gnk6RZ/K"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22e76850b80so14803245ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 02:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1746783701; x=1747388501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTYlTOXj1U7VnsAmcUnx1eYdk5rL5ZGZ7LNT8Q6B11E=;
        b=gnk6RZ/KgoV7HPxvwotAKtrfohVED2CYX0BLPhyouCfXpb8ssaUAlQDC+EBsk1tMx9
         lpC1PLO9KsV3ivvqwjECKDhEeX4b3O9eSzpQCc/9gVwaWHzsaFZjBNWA+bKXPGzOhSnP
         2W5A1MJHmb5FfY0isBTbwsyljaZXyC0Rrq1E+P9PmvpZBgr4VCzicsD96EY6w6aiTcxt
         1Izos8yH5u5ubAdLtskPdkfuVduY88PTVihQc8XtRJlFLAyKDcus65p2JR3qVizNH+fH
         eAfUgY7ysmu6xuNNwqlLdJAYiYNhxeA1rl1q7pKydqwdTU9HYtdHBs7xh2CRSbTZDi2Z
         uflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746783701; x=1747388501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dTYlTOXj1U7VnsAmcUnx1eYdk5rL5ZGZ7LNT8Q6B11E=;
        b=Pf8sgqQzKppoFKF3cVtVpxqfyn41Ara1akjtPAjgOUn7u+UwdkFNz1jYXUNUT1Omu0
         YOjF/WhjaUGQ4RzwNMTyw1Nc+oL6wXYXtEUjRDQMI3ye7YQrD0W1RpHuXaC6I8Qb5rGs
         paZwhUGrqyc8yz09q+r35oaro36WZ/OmYNUXaPEEQD/tgaD10j16ZAidv7mYohBra5sy
         /zvf38sJCXiTWW7gaQY48Fbac7kPyqWpToV0WVMgs2UoeLCy+dAM7/trIIb3+QNQCLsg
         Wa4chwR1tFzMvqfgH3ToVpTNJeCJK0JoOQWcKBkjtLlcnBKMlmz5YtUugsTqE6bge+dk
         GcAA==
X-Forwarded-Encrypted: i=1; AJvYcCVDaraId3QUzUtWSKus89dGEzftH7GStmm1ENM66FHO9xyL8O/vLwVa9XPL8d+hb1MoJyk/vH+XPFjRoWA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXhKMvZc0hnCeAx3Sx6Y+ojw8ooHMKyoJuW1Z1dmjhGixQh42D
	NML6u+yePGevsPRnGsfqIsGt9g113xMjNawfCY3IVPiD+fGl8wa/Tq3euvDvUM8=
X-Gm-Gg: ASbGncveo2IW/sha8R9LewPYz4xDaoq5UZHe5fcVPcdU5IYMGxI/+89XKYl1pxk8att
	fUl6ncGq8P2NvCz9xGN4RC1ttb4duOQ3FWos5rzr8zhG1PssI/JMklYQkFKTsfxNx3N88zrj6wV
	tfyXT+9KrjYqFK23vh0zsVqsoxcIwQhwiwNeX+hoIO+d2s8d8UKulptBCqhSbJ0PcsMjGWgl/6c
	neg++cgudIA/ZKNLKJfB1hxsE5XZwV7vRAV+qaYq1ClyCTalevmHS7ZWJSup4ZgDikAZ7QYsn26
	8r+eemS6F6Y97C6m2cYBN0M7J1UFU8oruf1UMg/aeY80s+xchldVuYs8ogPG47e7cbf/P5uUBOg
	guQ==
X-Google-Smtp-Source: AGHT+IH6CJp7geNRf/gfDN17FTLMQyKVaZTxIXnNcwyUwIxRi1b6xhJMl5CuSsuy0q5Q7sBCMcAAog==
X-Received: by 2002:a17:902:f644:b0:224:a74:28d2 with SMTP id d9443c01a7336-22fc8b76ab5mr41666335ad.26.1746783701043;
        Fri, 09 May 2025 02:41:41 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271c38sm13271035ad.119.2025.05.09.02.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 02:41:40 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	devicetree@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	samuel.holland@sifive.com,
	Nylon Chen <nylon.chen@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH v14 2/5] pwm: sifive: change the PWM algorithm
Date: Fri,  9 May 2025 17:52:31 +0800
Message-Id: <20250509095234.643890-3-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509095234.643890-1-nylon.chen@sifive.com>
References: <20250509095234.643890-1-nylon.chen@sifive.com>
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

