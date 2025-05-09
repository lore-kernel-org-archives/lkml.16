Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC44828D8D4
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 09:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746783715; cv=none; b=I0Fu3frbDs/7cDXACGBrLUyFWL6QRzlMflHGYO/YavToEgVs7jmx7PbbX5SA83KKugtBpNzhzwFqrUhpGcZ8gNBuNE+D4qLSyCI8Nsf5sg8ICStFBiKwLSYf0ABa1h51eXZi2BpB+iN7AHhDqorbUWQJijHgM31Uiu/wjcHmqt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746783715; c=relaxed/simple;
	bh=5Fho6oc6oCSAcMIq7sBJ+jJgp2mgJUTo8ceJNyolcho=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aCiKvz4HqRZZQWz5Xh4L2/OIHoQzJl0hPUsqm2p2kt+74gaQifQBwv6OIhMEz90ouOkqrPxQNIwsaaV8EczJrk5DLGGprOZmbZVJ+UVWZJolJIMFdFeRN4C5im/43fYPAA34BDjqhcQDSfCA1RKDef0+fsHdyf5MTSXMryxETgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=kHdChev1; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="kHdChev1"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22c33677183so18834445ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 02:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1746783713; x=1747388513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugS8tql+ZkgpltWYLoVv6syziSyX6JXa04P6wg0Uox8=;
        b=kHdChev1wskK6yqwWjc+uqHTpFb+3/dS87tx0oepj28/fVmx+ougmKYFRDUE4GrAvO
         H0D1gWmp0WPhXXiRZMKu/9H/S3ifoeBugb267EjL9vy7ndvjJ7xc6UAtLmWl0IRZD+XZ
         w2N1Q2nYGUZMk5Ytu6E8IrDna/vu/6nDLYXvSq+H/bFI7jt1dzdFYlO7qI7rUdSjwb9X
         1yOATX7ORkA/wWUhrwJCDkRb6iZjbwBt3n1Lj/Abnx5CQvZGPAwkmC88aCt8zA/aak+K
         gyvSmdL3vA9dJ9NN0QTt38O+JZTB6fyEx4yn2yoCiprj691fHlAsXSDP66cNBZMcY+hk
         ZFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746783713; x=1747388513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugS8tql+ZkgpltWYLoVv6syziSyX6JXa04P6wg0Uox8=;
        b=JUOV70pfMs49r4qcH3G89rO+cWPuGtrklrY9LLTzW2UDKnC+Uh5CJ0p4yc/lFV49Z3
         /Jim2Vb5gbdQCLEgW8pSxHbS4W24DgvBY51lnFx6ikTrvBCmPTI3XfGwXPsIGjJEn5wZ
         XCWsbDgAZOLh5TCay9vp0K5aREVyvVgt3q6a1HDqPMiiEJLMC/UfvSw7NWStTQaAYce2
         F0wtmtbC6bvS4pT7r8GTChNam8OLsxT602nVo5nMcl2T3+ni2U+nC033u9C6zKUKWmAD
         wfSPyEXrNn6JPzq0UZNyX50XYeNFjy7HPM0x6XSObVjrN8kL3f935T41YtGXjimGUAZj
         hkjw==
X-Forwarded-Encrypted: i=1; AJvYcCWl7zq9RPLMvSk16oZFCN9Vrwzp2OcXIsSudb4CyQ2Rprv7Jz5PCowvnYx98wxk0XHjI+/aZAMMiXuux+k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHwBDgMe0IiqTxsZ3RkiadvQMPaklfIzerUX6g/K7kexfG0oLk
	vp0vI6t6/Yk4E6RMWrXAf/IOLkpwIX+9MV0WjnuOc9k3UMgRpPaCyQZ5XwAIPcA=
X-Gm-Gg: ASbGncsyf1tNcNeP8Vt3KzDX5rydpq8k54tVg0fzq99N07z2GIHHLA4iMb3Jtln4xis
	Adc+LUfHezcBDZ6iX0AZjiO7A7ZHLdPUxIsx55mi7YCKEPUBglIpEpha+fs6y6vtmbqQw9DVz5t
	Cl/YXXFGEVOBzFRvFWqqoSlPQXpXvro1PjyXugfnA9IqA/63wtVkTJgctNzTw+RioNZuNPaUj59
	4WK7RfCrLeW5MHrcvMSSqubAGQ45AHDQRh1kIHBcWtw3N1F307GlfwsOyWKLHvW+UHwybFfg7Eb
	6fYhE/3K55CGAXZgX6VmaYPgBuOCo4KzaDxkJn4ADtY1Fn71LthRJbngOH1ymSypmSsrc8ahml5
	xJStyA4wdT4UK
X-Google-Smtp-Source: AGHT+IFbQW40EyZrlZRGe5s6zM9YRrKDGJY5Na8xxo2g44zO+suwtj7zXhUWYQw4VTbBqnhb3rIQfg==
X-Received: by 2002:a17:903:3ba3:b0:220:ca08:8986 with SMTP id d9443c01a7336-22fc8b3e338mr38936145ad.22.1746783712936;
        Fri, 09 May 2025 02:41:52 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271c38sm13271035ad.119.2025.05.09.02.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 02:41:52 -0700 (PDT)
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
	kernel test robot <lkp@intel.com>,
	Zong Li <zong.li@sifive.com>
Subject: [PATCH v14 4/5] pwm: sifive: Fix rounding issues in apply and get_state functions
Date: Fri,  9 May 2025 17:52:33 +0800
Message-Id: <20250509095234.643890-5-nylon.chen@sifive.com>
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

Fix PWM apply and get_state rounding to ensure consistency between
setting and reading values

This fixes the reported errors:
pwm-sifive 10021000.pwm: .apply is supposed to round down
duty_cycle (requested: 360/504000, applied: 361/504124)
pwm-sifive 10021000.pwm: .apply is supposed to round down
period (requested: 504000, applied: 504124)

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505080303.dBfU5YMS-lkp@intel.com/
Co-developed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
 drivers/pwm/pwm-sifive.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
index 6259f8500f71..70cf644cde4a 100644
--- a/drivers/pwm/pwm-sifive.c
+++ b/drivers/pwm/pwm-sifive.c
@@ -122,8 +122,8 @@ static int pwm_sifive_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 		state->enabled = false;
 
 	state->period = ddata->real_period;
-	state->duty_cycle =
-		(u64)duty * ddata->real_period >> PWM_SIFIVE_CMPWIDTH;
+	state->duty_cycle = DIV_ROUND_UP_ULL((u64)duty * ddata->real_period,
+					     (1U << PWM_SIFIVE_CMPWIDTH));
 	state->polarity = PWM_POLARITY_NORMAL;
 
 	return 0;
@@ -138,7 +138,8 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	unsigned long long num;
 	bool enabled;
 	int ret = 0;
-	u32 frac, inactive;
+	u64 frac;
+	u32 inactive;
 
 	if (state->polarity != PWM_POLARITY_NORMAL)
 		return -EINVAL;
@@ -157,9 +158,11 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
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

