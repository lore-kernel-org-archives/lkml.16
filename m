Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F0D258CC0
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 09:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745228701; cv=none; b=J3By5AOVUTlx9YGCTzySmxDlxO+ae7eMxOFHkPcU41aFflEHWIwmABL7RDh+Q6QPg2hhYYHab0Ga2wfVaCPZReXRISEjZzSgBEZ39woa++lLdglT6UicNWvO2oCpjz15vF9gNLzx+pRUuyCl3aK+m+cu0ojpPwfzdXS5RkE0qMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745228701; c=relaxed/simple;
	bh=r5RfvvulzxFSJLlZqt290Ox/VLbLHPLFtE3S4Q/eFF0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c8Mc3MGQazVcPkszWqrneGdEHsUWvFk+lDAbFMOsW68ILgH0rpI4t7rgFN6rgQXtu9lpCqRAt1UupgWIwlOl5DwigIGPWXrNlfIHx9u7Xzu6pYyWRO/tgRfY1UGjDiLpC1x3cynW89Xtz5CNsr/YVIX44hCIxD1ICcWJWyKANCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=l8Fz2Uem; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="l8Fz2Uem"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-736a7e126c7so3051204b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 02:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745228699; x=1745833499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9oomD+rheO8hWgzZWTPQh42T2jzzNJl6ps7gCFAZrzo=;
        b=l8Fz2UemKb7dUbfYNQ+ZTpPaIaUs9C2xO5cB9NibsuXq67vDKcrB6OeKm24UC6UwRA
         nxQ9m94jOhcrmKXSNxpcor9+WWdTfNMVt5tMl7MHnTOpl0A+qhCLsVbkhz24Rv5tVEOf
         z/ZieyfbBai8UEVspMuxuyIWfFintRcvRvc/b6AypV2WdGS3hqaaHFQLECPcJsmEoq/q
         ynjfp9EpEvZ9jOapztEBiPcPe/VbfpbVOMzM4tUnUHAyBCp96vLBRGT+SOYq7caN7ngx
         TRYfFHZdRPn0XDZx908ioRKucFwUpwGFhONAy2zQme4hdlKbpxqrRZfsftUTUvm8P6X4
         3/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745228699; x=1745833499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9oomD+rheO8hWgzZWTPQh42T2jzzNJl6ps7gCFAZrzo=;
        b=aFlglEd0GCkbF4nFHpx5nwO+LEvaaGvLc7aPWw5s9KDxQrK34Dr/XYPxYXuZibVUz7
         Hbzzfuurk6mz66HgYzZnpa3hzxEAw4GeCUQ7RqIhwR44RQVNG4ffN6+CsOs7OXgynsMc
         WlvI3DVO1QrXRMXNR21GFLnvXAk3S+423UJPIsjDcqwkK9WpR1IbFjWyZwyBcjopRxpg
         OvnLkl9sjZpYQeQbEuqPnr7NLWG88eRzI9YfX+4XeagxDlfwohZGOQPizamkHxz0RJws
         eEWUH6T6EbMHeUdpB2g5Z0xgyIS4CRew8/X5hYkVgMvxLc/J10Uvskg+jq3mV9RBdajq
         4VWw==
X-Forwarded-Encrypted: i=1; AJvYcCV+4i8S0xktJMAAxj/EIzbeSB2uqKP0sJidMVrEEJuyKS1EWeiAOl28uC35pZC6g3hE67MI/nfFeub45/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyup6erkSLvCGinACTXAajJkomF1qARSd3uHNhaJkTyFV77TkXh
	imDvwe0o4nAWkbz/2DQ0IqgczBNqWAOe6RIvRVdeSsgBMnrThuSYwtQPI1I3ZKo=
X-Gm-Gg: ASbGncsqTVZ+Ly/GMk7ZPf1GxM/BgnIhkVZJVzS9A32aa49g0S/jaTvtdeYLGV6TEOD
	YscbhAJqbGkSC2RzjIQuHCHIVKGm3NS7vFjTb2wg/1wDlPxBiripftmTvIyx4NzSZasBjW4rtuS
	hacRbX15g7zJRFIj+dGVGF2ZPG809CTldE2PxGVekDNJ0n/ADHw5tBj/157eYVDs79pt/tKL93M
	zS4+i0fiQX9xI6OI7kFwYh5Kuis07mCyLLbgBBUafo5AArHPqdMqtcdewywcDhqX0XXi3Fa+8zl
	2akP/u0cPImZ8ixqWCjsU+5M6jKacREru+n6wZg/uqYXu0Ys6N61p8FQ288By5tRG35re/e1J0L
	iJw==
X-Google-Smtp-Source: AGHT+IG3700mpvecN8OGtblvyO5T1EjDBNVZFMQ7/RSZwGoTrQaT76dyL6hRUY7pUUMOaUwerM2e1g==
X-Received: by 2002:a05:6a00:80d:b0:736:6ecd:8e34 with SMTP id d2e1a72fcca58-73dc1582843mr12640767b3a.18.1745228699199;
        Mon, 21 Apr 2025 02:44:59 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaacf32sm6371965b3a.142.2025.04.21.02.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 02:44:58 -0700 (PDT)
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
	Zong Li <zong.li@sifive.com>
Subject: [PATCH v11 5/5] pwm: sifive: clarify inverted compare logic in comments
Date: Mon, 21 Apr 2025 17:55:21 +0800
Message-Id: <20250421095521.1500427-6-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250421095521.1500427-1-nylon.chen@sifive.com>
References: <20250421095521.1500427-1-nylon.chen@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The FU740‑C000 manual says “pwms ≥ pwmcmpX -> HIGH”, but in Figure 29 pwmcmpXcenter
is forced to 0 via an XOR, so hardware actually outputs HIGH when pwms < pwmcmpX.
Thus pwmcmp holds the off‑period count, and the driver must invert it
to expose a normal active‑high interface.

Co-developed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
 drivers/pwm/pwm-sifive.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
index 1404c383461d..fd1660e16a4c 100644
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
+ * Figure 29 in the same manual shows that the pwmcmpXcenter bit is
+ * hard‑tied to 0 (XNOR), which effectively inverts the comparison so that
+ * the output goes HIGH when  `pwms < pwmcmpX`.
+ *
+ * In other words, each pwmcmp register actually defines the **inactive**
+ * (low) period of the pulse, not the active time exactly opposite to what
+ * the documentation text implies.
+ *
+ * To compensate, this driver always **inverts** the duty value when reading
+ * or writing pwmcmp registers , so that users interact with a conventional
+ * **active‑high** PWM interface.
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
@@ -113,6 +130,8 @@ static int pwm_sifive_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	u32 duty, val, inactive;
 
 	inactive = readl(ddata->regs + PWM_SIFIVE_PWMCMP(pwm->hwpwm));
+	/* PWM hardware uses 'inactive' counts in pwmcmp, so invert to get actual duty.
+	 * Here, 'inactive' is the low time and we compute duty as max_count - inactive. */
 	duty = (1U << PWM_SIFIVE_CMPWIDTH) - 1 - inactive;
 
 	state->enabled = duty > 0;
@@ -160,6 +179,7 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	frac = num / state->period;
 	/* The hardware cannot generate a 0% duty cycle */
 	frac = min(frac, (1U << PWM_SIFIVE_CMPWIDTH) - 1);
+	/* pwmcmp register must be loaded with the inactive - time count (invert the duty) */
 	inactive = (1U << PWM_SIFIVE_CMPWIDTH) - 1 - frac;
 
 	mutex_lock(&ddata->lock);
-- 
2.34.1

