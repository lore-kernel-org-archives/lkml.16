Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690B121FF56
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745398414; cv=none; b=CtoEaH4RkHn4oXhD0xzMrFaIS6PhQJVo/7kAfZ/hPpwVmKTkb7saAzlx8tQF6zCENE3pMyIjwfL2J6PSzSJKTvehqBrf2+PuNlr1KsyFafhHYp6HZhAOgGVdlQDPAHvz/Aj1+TbmDTuSHimJbpz4heXIIG09iZ/x5pRiqSzFrZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745398414; c=relaxed/simple;
	bh=3r/5Z/FYNGrd9yVol3oPvJOMUrAGXQMWCQuwPGjhyIU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hmKFid2JV/Vn/UAUtHn/ZickhxedpVx7XTgz9XanDiiavE8n64vD1gk5YjoeIQjlZDSApzegsCe/eySADTDe0Fo3yQwaWyZ0DHxO9O6qBLsU4xlfrkEvG4LKsYxsDFLcYtOe7wwxN3y6NfhpWycx2tV3HPlE26anRn8oCh017JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=l/BFXzFY; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="l/BFXzFY"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b03bc416962so4445499a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 01:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745398413; x=1746003213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ySeC6yawUczfsda0tPZSNQIrOLUHwdCmyF43sMLfrQ=;
        b=l/BFXzFYywi7/G3t8cBtRni0/CZA3hGD2bySF7QiOGUGb8+zYoKc8/stk3r9riNFnw
         /LNkxvkRxvALiGOkjeBJouN8eKjJaa3XXhgBLNaKENBZbwKMaLvfj46B8WiPJdDCNpsz
         gzgccTtbDOEluw5csuUwAy1CZWdwinYbcX+u4fvOB3vstMYyHKuUMwUvFk+Ph9qg03W8
         mhsPHSpA1Rwb5biWDsz0dbBSr/ITkkzI8yTlb2l8Gb17m+tHEu/5IEPc1mdS4+yIlemU
         CvV7qEUV9kD3CXBBNMNSEsZrJ6alWM+vdTlb8LVgQReLU0E7etLhgSypQNXkVQg3NPix
         wg9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745398413; x=1746003213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ySeC6yawUczfsda0tPZSNQIrOLUHwdCmyF43sMLfrQ=;
        b=EKSSyaA1m0wcYFZXEo4xW6o+AvAmp6fHwXog+8eMpLNLfjE/cQ4pSxSgX0QTOLr8Es
         A4fdBxTnyrTYhts+pMSi9cALh0a2n76so34iy3Q8WcEEbPQCGZX9JyfHc9xpILK9HMl4
         V+FcL76MbxDex6Td0nU//kXw1Wezlph2tJMsYmmhCAV/FhTavzfKkvmLOAMtJ6zBXMNf
         c413P31y8743hqUKCOUcLSPUsnKhb2O9+TPKXmrUZmuo0dnfV9AgTKjjh2xFiXb9gTzc
         bv6rnw44ZmcApP8BEzy4knLGnaISntkck8y+zZyEuQZKsUKePB5DzqDMpQppL6gV623B
         5sxw==
X-Forwarded-Encrypted: i=1; AJvYcCWEPoeFr0LhStf9tU7Ba8hEG0Hc2XxXfrplMIf4GOFUmXSDgUetXQKkjSeWaEqGWpt0zBUeUqWWMsd25j0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlDYGOI29+0mZO1ECkOdJcvt4kk2zk/IDKxoH/Z6uk9uzs9lR6
	QHJKLBHCuzVnL7toKRwZ8tIiUxy+waaf2ycIKiM3i3oflOczHKJB4lea7NpjtQA=
X-Gm-Gg: ASbGncuI1WzneaLAGZUovUtst2YlcL2nZha8ducLnsih2Y+l6MHnbLwizyTGwaBfnuO
	bD0HXDI/GF7F3GL9PDBa8tOtruFdN/hVR50ETgCryWsyuNAOsuNi4myQe6yoOYbrvvLR3H5UdyU
	q3sx4sAJnkcspZuppT1rPspE+ncPQ/tyvWkfL1Esm1y7tEsrjRmnh7/+EQDWzsiEX/+3KNaS10L
	EYtrcw7XO6qWz9OQ4L/TkRSh1RnW5wVFlqRxHkq6NnXLQEwxuPlYiXDIjqzfHOPSk9yXnvaPYjI
	CEvalNLeAszBITR8No1hbWN/at6bSwPpt7hFUUSRQmd3ZTaXl0E94DuwyqJNwxNCzV0PQrF/MHE
	h6g==
X-Google-Smtp-Source: AGHT+IGCdyRrXA3gFk3nBMhtBGH9c8nvuEZ3lZ6EALzxbQyXUOgptExJPWtu72AQ/7Ux8Uo93heJog==
X-Received: by 2002:a17:90b:380b:b0:2f6:d266:f45e with SMTP id 98e67ed59e1d1-3087bb3e794mr27325433a91.2.1745398412701;
        Wed, 23 Apr 2025 01:53:32 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309dfa5f880sm1047611a91.38.2025.04.23.01.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:53:32 -0700 (PDT)
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
Subject: [PATCH v13 4/5] pwm: sifive: Fix rounding issues in apply and get_state functions
Date: Wed, 23 Apr 2025 17:04:45 +0800
Message-Id: <20250423090446.294846-5-nylon.chen@sifive.com>
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

Fix PWM apply and get_state rounding to ensure consistency between
setting and reading values

This fixes the reported errors:
pwm-sifive 10021000.pwm: .apply is supposed to round down
duty_cycle (requested: 360/504000, applied: 361/504124)
pwm-sifive 10021000.pwm: .apply is supposed to round down
period (requested: 504000, applied: 504124)

Co-developed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
 drivers/pwm/pwm-sifive.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
index 6259f8500f71..4cf3e715fd84 100644
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
@@ -157,7 +157,8 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	 * consecutively
 	 */
 	num = (u64)duty_cycle * (1U << PWM_SIFIVE_CMPWIDTH);
-	frac = DIV64_U64_ROUND_CLOSEST(num, state->period);
+	frac = num;
+	do_div(frac, state->period);
 	/* The hardware cannot generate a 0% duty cycle */
 	frac = min(frac, (1U << PWM_SIFIVE_CMPWIDTH) - 1);
 	inactive = (1U << PWM_SIFIVE_CMPWIDTH) - 1 - frac;
-- 
2.34.1

