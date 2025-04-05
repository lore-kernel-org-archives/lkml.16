Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F841DF254
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 09:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743845266; cv=none; b=WgMJ/apyFDesbha1bj9goUDaHPBNJgXl9y1CL/IXPRxIzZFAZ1x2qONAZTld3mayQeDiHWTjRZatXzx4Nuq41Fgjr54ypJtLEXwAyOThMw0Sc0BqFZh5MuBoOIhHsxNrBVmEd5Sgj9US9HgHS9OJ9pfO2IlkU9Qi8k3lWhgz76Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743845266; c=relaxed/simple;
	bh=PeMUN5MaPR/iihGuaAYk1+RqNZDBvhqS1HijQAO+fo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fVLHnE/IAKBrfmKZ+lMpTEajeecs4OYSC+FTVf1sYFxQnuLULC6qQBmgOJTPb+ZjUXW/ulGWB24ae5g95QFplaWZHS+fTzjV5AqwpNknFvR8fxVaRgou+mC4QKsNMiQsODBlq3ydN6G5uwukHLfaCybeQyq9bifTj3Ensv32hUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ycS583EC; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ycS583EC"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2bfcd2a70so369193766b.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 02:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743845263; x=1744450063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZnZ1QBH4c/cR2r7Z2I0IWQDQQpPtp/xF22TjNG8zFs=;
        b=ycS583ECOuUzKWKMfrY1W1xmumbs15pUWtPkZ76FQ86PZugNIy1oVVg3Md3h9QtYfM
         zkqwX0+aAg7WdNIvCyn+hAyXuMuSBDEjzl01FmeohcXh6F92BOpB3e5T71cByn6G/Cbi
         955P1+2ehCyiTS+xqBnpx34pMta46pJ0LPSCfTCt0xr2iamS/IiX2y0ziBljWyNbIP2q
         i5D9ON69ZgFJEWPZNTAUyS2wQYxRBDU5daUXmoflbeMGy+tHpa0CBPgz9kpZVGVnMOCn
         02kvx8G2QibNh52qs/Q92VPWyBe7YZiy1RE7SMuozkws2OQ5rtynAQnW2nx1UNGEj6Q/
         LcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743845263; x=1744450063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZnZ1QBH4c/cR2r7Z2I0IWQDQQpPtp/xF22TjNG8zFs=;
        b=VtwuZEZ2tAViWTdphhGfeRv972QQmOp/h59ClkX0UWialGU0ZwqmYvEVwnlJYsxr4H
         tT226lnxfgqOF8BBp4RHFNsKrLe29v1MgcOsuiIM9Bh3+LUBT1m0+AFumtbt5dT19WnX
         R4KwgMex0+ZZjNguBZmI6hK5iz/jAOMZ23YtNyImld4DSaJjxnpR6I77WO2vY7Zb6l3t
         FY0nn46+cwBIEuefhjRdTO0b84/Da6efP6sSv3JR07t0iiWO5Eike3oHkPSfiUfJ7OGK
         9dvXyAXBH6qRD/oZGzVypBh9UoJ1D+xfQR+zZiRZxZ+K6EjSFLk7USd+cQAh0BnCywBw
         xGZA==
X-Forwarded-Encrypted: i=1; AJvYcCVJLyGvDi1moKrXE1TWDrJ87MO3YST3B4FDKrXonJgzkzYjJ8GpMemHGlYWtORkm+2VDgSYXeebIiAfXsQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5JuH/5l31+8V3QkR/qKVEHdPH5BYF3bHZrQX2zTm4OJ7Zxf/m
	x19kJ1u8JBaIusmFfZdkKyezkSKepjU5blPny1INVGWBJOQo8zUWlLhHlMXIXFYXnL0Fgr+cWtm
	J
X-Gm-Gg: ASbGnct2dMwTxOAe1o/4HZuML/r3+w/267PuvI2zAO/C3huFlbe2IHVNJIFCbzD/nFD
	n5Zeujrzpz9TF/UaPvMXOE+1iNCOGp0eYoM7It4G0watMEZ/Tb5ZcEcKq6gsX6vuQr5C1riEs98
	/7qXsAHcUQBcgvUJ6MvmbhKGS01m32Ipd3ptcqhLICqDiUdS90qXoNx60Kkq4NpdkryEaGlAI0/
	PVlolWb7Z2Ud8rMxM4TeQz+xvCG2jSUPur9YF/b//RsJmzd8FnFZi8i3wWmIf2p0vbFg9jsDYJT
	FWVWbe/8OXaoRzpiDkpISB7yaIdlz2WFS4l4DT7t/lqmWjEUaA==
X-Google-Smtp-Source: AGHT+IGWO7dBoEwfH+vhvetzVchvOebwHG0LSEkTGJ+mVXy0B0Ix45di+z7EJEIkw1x3jHja6bWBjg==
X-Received: by 2002:a17:907:7f07:b0:ac3:8a3a:e924 with SMTP id a640c23a62f3a-ac7d19903fdmr555132166b.39.1743845263101;
        Sat, 05 Apr 2025 02:27:43 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac7bfea0eadsm394579766b.67.2025.04.05.02.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 02:27:42 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] pwm: stm32: Emit debug output also for corner cases of the rounding callbacks
Date: Sat,  5 Apr 2025 11:27:15 +0200
Message-ID:  <fe154e79319da5ff4159cdc71201a9d3b395e491.1743844730.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1852; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=PeMUN5MaPR/iihGuaAYk1+RqNZDBvhqS1HijQAO+fo4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBn8Pd6gBS/U7sm8gCc++Qe+H9FPvkAFOyatKX8B qZYNTVb/8WJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ/D3egAKCRCPgPtYfRL+ TiyKB/0dJZmWMtAaRs0WJ3PXT9d3VqFRF+ApoExKeBVC+2ES9YhZvF7McGhAzK48ik7Ly+LbIdd Il/cB2eBN8HrWNjZoHv/RVydoIwXGPyxm+7EVsFLjp6QVEbKfRjnonbncS3QTgmSKMIUL6e6JSC Exlph+FquJCDEjgnQZiyDNnKFMpId9mwZfG4STy0nFW4ohy/2CIVisdMr+VJ/Ku9COUq3a/FB+F QNpy10ntJAQfeJnxjycByIlnMBpPR+ouavHhm3lAae1baYZOSbounM633kPFBC43UuT9ehZ8ryi RmE7IGRwAQ/z49wXa8pqeOAbyygY5+bxUJ0PuQwUNrsaJoRK
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

When you're interested in the actual register settings the driver
chooses or interprets you want to see them also for calls that hit
corner cases.

Make sure that all calls to stm32_pwm_round_waveform_tohw() and
stm32_pwm_round_waveform_fromhw() emit the debug message about the
register settings.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-stm32.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
index c6625f51a199..dca5d09d80b9 100644
--- a/drivers/pwm/pwm-stm32.c
+++ b/drivers/pwm/pwm-stm32.c
@@ -180,11 +180,11 @@ static int stm32_pwm_round_waveform_tohw(struct pwm_chip *chip,
 
 	wfhw->ccr = min_t(u64, ccr, wfhw->arr + 1);
 
+out:
 	dev_dbg(&chip->dev, "pwm#%u: %lld/%lld [+%lld] @%lu -> CCER: %08x, PSC: %08x, ARR: %08x, CCR: %08x\n",
 		pwm->hwpwm, wf->duty_length_ns, wf->period_length_ns, wf->duty_offset_ns,
 		rate, wfhw->ccer, wfhw->psc, wfhw->arr, wfhw->ccr);
 
-out:
 	clk_disable(priv->clk);
 
 	return ret;
@@ -236,17 +236,16 @@ static int stm32_pwm_round_waveform_fromhw(struct pwm_chip *chip,
 			wf->duty_length_ns = ccr_ns;
 			wf->duty_offset_ns = 0;
 		}
-
-		dev_dbg(&chip->dev, "pwm#%u: CCER: %08x, PSC: %08x, ARR: %08x, CCR: %08x @%lu -> %lld/%lld [+%lld]\n",
-			pwm->hwpwm, wfhw->ccer, wfhw->psc, wfhw->arr, wfhw->ccr, rate,
-			wf->duty_length_ns, wf->period_length_ns, wf->duty_offset_ns);
-
 	} else {
 		*wf = (struct pwm_waveform){
 			.period_length_ns = 0,
 		};
 	}
 
+	dev_dbg(&chip->dev, "pwm#%u: CCER: %08x, PSC: %08x, ARR: %08x, CCR: %08x @%lu -> %lld/%lld [+%lld]\n",
+		pwm->hwpwm, wfhw->ccer, wfhw->psc, wfhw->arr, wfhw->ccr, rate,
+		wf->duty_length_ns, wf->period_length_ns, wf->duty_offset_ns);
+
 	return 0;
 }
 
-- 
2.47.2

