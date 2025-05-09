Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930B628D8D4
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 09:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746783720; cv=none; b=rxUWKmzGwKyG3WYdC7im2uCibnPn5y234Nfv5t5Suq7ucEex1GuO3RykxUbl0IEvUm+euHd30NZLb9l472rtUjtpgdQTWyVcLRhQznkNIxjtUZwnOTxVA3leG6st0n/EpDdf4akYAD3rNtJmvzpREOXG9Xwae17bcWsTtwIJEhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746783720; c=relaxed/simple;
	bh=to9iLI09IuUpk5B76wu/vxa60Ry89kvmQ/y3CQWanPs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Id45ksTUTIvz0G06SW+POXJ9daoxaTWhteDnmct8W2qcdgQe5ALB89ANmUHM3IYC0kCl+Go4UcM115MNefd6WsV9HL+rixonkGFgopqSdY+J3/oHSTI+tsZNigDSnUv4DpGE8lFJgzlAvO6b6Eht1DBIfEXmZVyCLpDf5W9ZW1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=f0cHU1Fq; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="f0cHU1Fq"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7423fadbe77so389150b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 02:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1746783718; x=1747388518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=db3r56u6WbxunAQsqmv+qz1Bx6fNV6R3VtqVTo1N8lM=;
        b=f0cHU1FqsQM77D6YjCqt1Q7VxDzwAtqjLwRwNFDP3SyCh9VLzkZSCnV9RSGKH/eqzt
         nMfeazoI2Ryi8htOswiNeps7mLoY1eIS2q1yG8eQMjXQJwhvuRVuXg9eH+eFeXcV8MAu
         e2iAq0GZb/hgqAfSb3/gseSrneanO8q7VZ43cCz0qRhtnUEf0Xdg1S4OjLgnJIXAd0h3
         Gzvuv+G0+oi+LhMJbc/K3kpA7+dytJs9+F/9bE5Cnn7ZiL44bY3HXl9bS4BVG3fDnM9H
         xj3b71GR0vFxbQTpbkuumJDTk/Tmuj55ZrAXWld7+B3Fsbfc3+Hus3EUyU4/SHSsBlcy
         NA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746783718; x=1747388518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=db3r56u6WbxunAQsqmv+qz1Bx6fNV6R3VtqVTo1N8lM=;
        b=hqtJG0dYdJREAfnE8vIWlFlniLiNk/DbAJp9E/hkO0LU4UBbKMkbBVGp120/SqAyHm
         L3ClbERpnqChOV8LjexfJViNG9bjgIlZ8B0Tq2WuxsSAjBaTeHIPVPShbhRMJTnDdlo8
         HDvj25mffPDQEVuj4EmwBw2oUmowZrIlA/VrszSIMCSLaFPeB9TTmvQBlMnhGSagqOqu
         VlnCRKxNccumEGTZGYbF3rncJ9sKjeSAVI8sf594WqLBYJxPoy6VtVOh93l8kxmYGit1
         DInvDYU11mzt+vIoExO6XlxkUkJpv50ixfTZLvrp88aHJnIycgdWaGhvERpG1p4/ff/P
         NK+w==
X-Forwarded-Encrypted: i=1; AJvYcCVCwXqA2N3neBuiAvG97tLPs9WRTLDUZdMLvB5L1Wn90BQPEW8TV8kX3tc42gvxBF0Oei3hdN6mQWhjz+8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmgzmviUMvThGF/V1c49Mou4I+vObTvm9gtG5309a+N385JxKk
	81o49UE/aYNWs7I0iWL0wO5eijVufd2q5IrV5ZjFW9YE0Y3tblAXATIPgQbvo3s=
X-Gm-Gg: ASbGncsrX2rVCT5+HBNY8l6EdLoHayr2L5h4QqS4HU9z0mgSnkHBw39Rybt+WwipRi8
	VEip27XcBV56JUc2zLWurE9U/YRSCVhGiIu7GnjqHxadNvYszueMV4f9mS3yrpvKfYrstJ0EO9i
	pnoOPvW0uHI7dMu6zctUXQW497WvzFtL6KjO65YtB0PaEwti64QHvfkjqyLnpl155cqIn9hwcWF
	MBajqPt/9bNF5/XyGoo+iY00sx2kxoFhKrEhaTr7gaGvkpwgHjU3f+XJc3YcXD5ky2tEH+wwk+O
	CpHteKWKAUlmWV+naTXjPD4JIi33amTiETom0waUO8hqGu5EXQhzo+LhuCitqja2F1vgsAX3KFe
	hsg==
X-Google-Smtp-Source: AGHT+IH5OUjlU44wPTcS9YvNdweW8Hmi+ylHBcWO0ZjkJN+zsQnLZEzF4So5FHTc3N4rkAEKt0P6Pg==
X-Received: by 2002:a17:902:e744:b0:22d:b240:34c9 with SMTP id d9443c01a7336-22fc91a9093mr48509735ad.53.1746783717970;
        Fri, 09 May 2025 02:41:57 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271c38sm13271035ad.119.2025.05.09.02.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 02:41:57 -0700 (PDT)
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
	Zong Li <zong.li@sifive.com>
Subject: [PATCH v14 5/5] pwm: sifive: clarify inverted compare logic in comments
Date: Fri,  9 May 2025 17:52:34 +0800
Message-Id: <20250509095234.643890-6-nylon.chen@sifive.com>
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

The reference manual says "pwms >= pwmcmpX -> HIGH", but in Figure 29 pwmcmpXcenter
is forced to 0 via an XOR, so hardware actually outputs HIGH when pwms < pwmcmpX.
Thus pwmcmp holds the off-period count, and the driver must invert it
to expose a normal active-high interface.

Co-developed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
 drivers/pwm/pwm-sifive.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
index 70cf644cde4a..4a07315b0744 100644
--- a/drivers/pwm/pwm-sifive.c
+++ b/drivers/pwm/pwm-sifive.c
@@ -4,11 +4,28 @@
  * For SiFive's PWM IP block documentation please refer Chapter 14 of
  * Reference Manual : https://static.dev.sifive.com/FU540-C000-v1.0.pdf
  *
+ * PWM output inversion: According to the SiFive Reference manual
+ * the output of each comparator is high whenever the value of pwms is
+ * greater than or equal to the corresponding pwmcmpX[Reference Manual].
+ *
+ * Figure 29 in the same manual shows that the pwmcmpXcenter bit is
+ * hard-tied to 0 (XNOR), which effectively inverts the comparison so that
+ * the output goes HIGH when  `pwms < pwmcmpX`.
+ *
+ * In other words, each pwmcmp register actually defines the **inactive**
+ * (low) period of the pulse, not the active time exactly opposite to what
+ * the documentation text implies.
+ *
+ * To compensate, this driver always **inverts** the duty value when reading
+ * or writing pwmcmp registers , so that users interact with a conventional
+ * **active-high** PWM interface.
+ *
+ *
  * Limitations:
  * - When changing both duty cycle and period, we cannot prevent in
  *   software that the output might produce a period with mixed
  *   settings (new period length and old duty cycle).
- * - The hardware cannot generate a 100% duty cycle.
+ * - The hardware cannot generate a 0% duty cycle.
  * - The hardware generates only inverted output.
  */
 #include <linux/clk.h>
@@ -113,6 +130,10 @@ static int pwm_sifive_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	u32 duty, val, inactive;
 
 	inactive = readl(ddata->regs + PWM_SIFIVE_PWMCMP(pwm->hwpwm));
+	/*
+	 * PWM hardware uses 'inactive' counts in pwmcmp, so invert to get actual duty.
+	 * Here, 'inactive' is the low time and we compute duty as max_count - inactive.
+	 */
 	duty = (1U << PWM_SIFIVE_CMPWIDTH) - 1 - inactive;
 
 	state->enabled = duty > 0;
-- 
2.34.1

