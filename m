Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B368E1E1E1A
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 09:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743845268; cv=none; b=SzgecdqYXAipTZGVAgT3uvqBHAEydY0oT1ooNiF5KcaCXpAtoysga4U6t0EDMH4NNPQb+G3M+vi/7lBZgPg0rVC9Xztj2LQoGzMexamu2wF8rLQ0xqm3caKtoiROH3bkc7c7j7D8x5b433H46JwA/g7RxJPOvLmMgKCCnTAvMxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743845268; c=relaxed/simple;
	bh=OiM7+jqt6Q921Kpmw9b8tSzzTFzLcdB8tQr9oQGe03Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ItmlnQ2DCuqAOfedIy4axcwQISaTb/dvjTci+PL5iWBQiQPPHEF6cOmVaHvxCm9Aml7+V0G44yDS2z/GxJpXYsT+vLxPOltEemLIzD/fhSgRVs8cVm/DdiIBaxJLiCsecFb5enQbUlZLTRyPmGP3DIfGEuHV4XpMBv8SddM46gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=tmi0N1EQ; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tmi0N1EQ"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5eb5ecf3217so4810961a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 02:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743845265; x=1744450065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8qXAEECYwT3mvFz4b37atfzJpcEAFkVbCcjXByt9ryg=;
        b=tmi0N1EQzFnou2AgOrggkSKdEjjXyzpIG+CVZ+2L9CjaRNfCY0p6JmsJ7vqMbdleSb
         vOnxlJZzb1VdbEKCkBt2iwJqR50GEPDJOzAPmomrPe4aWX6Zho/qSutx5wKCD1St+YB7
         Tw+agm1lm3qVBTiOFRiV7L51ErD3K7u+EHYtFXz4wUMdwM1/4LTzAbgi0ax39Nsiwg1a
         kvkVJGKc5uYuKQyMZA8q+2+1X2gTYnrCwTtSg0werl/H8hrosEoX/kM8Ccwp2X4ukmNg
         34TSUeM3Pxe1Dw5fFmT7b837pd0vTK+4Ffy1aHbYAB0nTJwJdSkfWvTc7x3J9rKVAj00
         d7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743845265; x=1744450065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8qXAEECYwT3mvFz4b37atfzJpcEAFkVbCcjXByt9ryg=;
        b=n6ZX5rs7d18R76GCV2gy4M/cXBgjfapJs7Hb5e5I2libSWTn8o4INV+QfLFWKP6oRI
         OBfCw6nH91g7VH9QUax3BFqz0PYhLZYJwTWn4V5Bu45a7+pS5sINGqhkuYwHQgU9jldi
         Usllfi8IFcmV3W8EIR5QAEhK0bOEnEWDHfwW9OSBHOIV6ianG+gDldGorTsKCR0qgf0I
         GBxoWLDdstC+Ipwp/aWY4hTPBzEQs1aKqwGwflwnD2aX5dtECV1sloOHWdNLuqrxNCYf
         rbWvJGnDlb/xfz7jRb9b/v5gv2LPk0NyAcxCNUnSgkZro5G+oFG4meIK6+E6bwJpx69S
         qPHg==
X-Forwarded-Encrypted: i=1; AJvYcCVH1thS2qBBLkDCE9zr06t1NAoT5YVN+kwPcGDjL+b3RV9IDOFkFETDynHto0gIigVe/G/6kQuUNV9JhdU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhczIle2GeThquW7lbUE4qmO5NvT/8MdmaRy9EZgn1LDMWc2HE
	AXxJAk4zSIPpZzj24Z0NSGzLRDMK8UvG0lDVRv7C7WI6LNtkXn8+LikpjwE16Ko=
X-Gm-Gg: ASbGncuW7HnnL4Lsy+4d6uEcRI9EOESKqdLnq3rpZuZSq9wNc8l+SDFv7LUnRTharop
	ezmjXXnuHJmU0K/MbO03lIE6MtwN4UFzi122BtqQrccqA52RMXeeaWy9qYvpETKStwvW27nB6fJ
	PyhRjbYV5KOCdemZ5pZy01AHWp25553GmPBZo3l7ZlEfL4tGUQOEulKTXrlg2R72DYD3pHYga1A
	/97rfqgWFiYGFbl5uC+Y6GunLeWHWAGnMU0rMuIJHEJ8+MXxZwTUIIOGpS9s41KFJWNSK8djEmF
	J0VjHWAiiDiOc58AUeXTvv6+p7iLskJ27CB3etuO4xFObNbcuxSMTo9G2GpS
X-Google-Smtp-Source: AGHT+IH/Vu+m+Mp96HrPw4Gc+WIBgyrjTJKLuS6DXnK5YxiYpNywofXLPxP1H8Q6LOOpccRFikcNhQ==
X-Received: by 2002:a05:6402:1941:b0:5f0:9eb3:8e6a with SMTP id 4fb4d7f45d1cf-5f0b471645fmr5054504a12.32.1743845264986;
        Sat, 05 Apr 2025 02:27:44 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5f087f0945bsm3642602a12.45.2025.04.05.02.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 02:27:44 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] pwm: axi-pwmgen: Let .round_waveform_tohw() signal when request was rounded up
Date: Sat,  5 Apr 2025 11:27:16 +0200
Message-ID:  <ba451573f0218d76645f068cec78bd97802cf010.1743844730.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1743844730.git.u.kleine-koenig@baylibre.com>
References: <cover.1743844730.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2006; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=OiM7+jqt6Q921Kpmw9b8tSzzTFzLcdB8tQr9oQGe03Y=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBn8Pd80SugWzSxb6ho2jCZImiC2vqkQWOStcSd0 V4RR6iNKFaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ/D3fAAKCRCPgPtYfRL+ Ti9cB/wM1fMEC3gf4eEravDOl/yv2NTu1+Sze6OydWWzWPeuLRUO2Cp5VV9e/I3a5z9ela0StAk qXXo0Pk/yGPLJXL75nXfBUf8nguCShWalSu57ZQI5PETtvUAD6PaXCBjHnV1MC4C8e8yEiDjt7B cg/s8T2keZctsewK+pI4biBczLymTI7WDTa7VbHMBnvsQPikdFtR0g9EKgbUZZxkHZ6i/OUHarI DqAQHRlzYT99WApwX7HISK2A1FUOx5oB28zZtswNPDx0NpcmuvkykKZwjS5Ho2vrIvPhNpFimlQ MZdU4ecdAHSYHDZ2RHmo4Myl5OpX9DAVXOSuSlCEC1aG3GIs
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The .round_waveform_tohw() is supposed to return 1 if the requested
waveform cannot be implemented by rounding down all parameters. Also
adapt the corresponding comment to better describe why the implemented
procedure is right.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-axi-pwmgen.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-axi-pwmgen.c b/drivers/pwm/pwm-axi-pwmgen.c
index 4259a0db9ff4..4337c8f5acf0 100644
--- a/drivers/pwm/pwm-axi-pwmgen.c
+++ b/drivers/pwm/pwm-axi-pwmgen.c
@@ -75,6 +75,7 @@ static int axi_pwmgen_round_waveform_tohw(struct pwm_chip *chip,
 {
 	struct axi_pwmgen_waveform *wfhw = _wfhw;
 	struct axi_pwmgen_ddata *ddata = axi_pwmgen_ddata_from_chip(chip);
+	int ret = 0;
 
 	if (wf->period_length_ns == 0) {
 		*wfhw = (struct axi_pwmgen_waveform){
@@ -91,12 +92,15 @@ static int axi_pwmgen_round_waveform_tohw(struct pwm_chip *chip,
 		if (wfhw->period_cnt == 0) {
 			/*
 			 * The specified period is too short for the hardware.
-			 * Let's round .duty_cycle down to 0 to get a (somewhat)
-			 * valid result.
+			 * So round up .period_cnt to 1 (i.e. the smallest
+			 * possible period). With .duty_cycle and .duty_offset
+			 * being less than or equal to .period, their rounded
+			 * value must be 0.
 			 */
 			wfhw->period_cnt = 1;
 			wfhw->duty_cycle_cnt = 0;
 			wfhw->duty_offset_cnt = 0;
+			ret = 1;
 		} else {
 			wfhw->duty_cycle_cnt = min_t(u64,
 						     mul_u64_u32_div(wf->duty_length_ns, ddata->clk_rate_hz, NSEC_PER_SEC),
@@ -111,7 +115,7 @@ static int axi_pwmgen_round_waveform_tohw(struct pwm_chip *chip,
 		pwm->hwpwm, wf->duty_length_ns, wf->period_length_ns, wf->duty_offset_ns,
 		ddata->clk_rate_hz, wfhw->period_cnt, wfhw->duty_cycle_cnt, wfhw->duty_offset_cnt);
 
-	return 0;
+	return ret;
 }
 
 static int axi_pwmgen_round_waveform_fromhw(struct pwm_chip *chip, struct pwm_device *pwm,
-- 
2.47.2

