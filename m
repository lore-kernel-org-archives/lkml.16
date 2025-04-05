Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9205420311
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 09:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743845262; cv=none; b=rzn9DtTZ34tJKs0gidpC4nx2ZMGGG05n0lc/cDuuQabcEfA18IcxbqPhpXD/b3e9N+bbTm5djfN6JRzvuCn7s7Hme90K2E/SaAPlMO1Z79BumzvtZ3+cpD6j8I73ufej0cBFtDgf+sI+5Ur289HUH+ChT/E92d/uZnF9ZrBprl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743845262; c=relaxed/simple;
	bh=XTHV/BxyEsvy+/e1D0B3U1SFxzinwxu6RXZECENuXK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dIVDnhVXya2vMBThrUFlL1Dcdwh666xik+bf7V3V7auFS2X+sEBD9quKJ6JroansPFvr+LbQb6wXw/wUqfGqcbuu9QLfQdfaNm+ZcyCtib9FziA3X2sI/E/ei6EutylLnSioSYGFr6p57Nb5XvFhMBz4Pg1GgygA7EEoh3E8aKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=CIaqSVi6; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CIaqSVi6"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e8be1bdb7bso4519012a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 02:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743845258; x=1744450058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlQ4TT3nPVoe8QQVGOI9fFCYTSHJoW/Kf2xwJnvneTw=;
        b=CIaqSVi6SYjQ7loT6hwzb+35YzMWeXsLmWmYtBRdTJfDCqj+4l7jEFOAr9/GWFOQBl
         vNr9o8qgZbvrBhJJDs3N7eB2ueRYs6rM6wXDsH8wb1WWjBPLKgXIqxT3wen9vMuVw7zq
         0I8Gy/Cx8/1OK6jWB16INU5/opIG60mp7w61xrUM2VlHx8MUxmB23aoUE/lAUk1z7uuO
         3F/WAzajgGnXbL3WNTH6a5CwpyVxjGI9hTi83tzvJsgRWFBvt14MS0sNiEb6hGfUpNu9
         IkOsXXn4+KDzYhR/nHWieOAfiC/Undo10sMYf4WHkq3X6fBA6xpz9+VN6pqbfbRWEJ5C
         q4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743845258; x=1744450058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZlQ4TT3nPVoe8QQVGOI9fFCYTSHJoW/Kf2xwJnvneTw=;
        b=gE1rCJHWx872iA5XqTNwuk5Cy2QvIwFFlXvXkSEB1wSznDulMKdonh3YCwP/GZzt1s
         7E+Q0bNgogqOleiJb0Z8wKIjV1JTYzI1VeBSQaDcaedbnb9hgmw0jdUzk8DHjaCP0rOY
         FjbdybvkzvdNRwrxxrtqUTT76ZUfmFSWH+yTBm5+X6lK70eNdfdg8k7xBboErW8wFN6u
         ILNg8Bb8CH8sw0/Kw9yN7RXCThv7cm+tEjJmDdGmhpzEHQL4OHGLqoZ9qjB7j9tT/w4T
         l9UbfhHMNAOqnA+XivZaVL/2tw6BFDXzSPjqOzR10QoqQ95g/ZftCqDsFyHullV55HF0
         IpCw==
X-Gm-Message-State: AOJu0YxR2+ELb+joAcLymnsTbnaiNKWitT25LMwRqmEikHOkb9VP02pZ
	KuMju+j0CXmeAPUNDu1rJR3nnZY/O6YfFyCO0aWjiA1W8I8gGuWCfBlWK0PqHP3CoDQzau9fM9i
	Y
X-Gm-Gg: ASbGncshpiGcahnklks02RnYRPDy5uBIDkvu9y2nLXJLxKnPR9d/3nFLGsc6RhZkHVg
	Ssg1yrEK3aqXpvvqdDUBbKw1faM8g0UVw8UKetTbkUqz+D8JczitbmS+1CWaAf53Sw3PsWkoq1P
	WbWOJkRhB48FxDzW7WLcqh2L5CkUuVH5YASeLCoJV6H4Xbda3467VioolOJU3lVAmmXHfgq7RY/
	uzEitzyyy1K9W3F4X30rcQszUiF+ITa2P624LRr0XI+pJ23/bPSe2WuUutvJ9Lh0g01hx3vET18
	MOIFGlQjLdRLV2joIp+79TvuuF5MHZQ9PiyL6lVZaUU3qoL+6w==
X-Google-Smtp-Source: AGHT+IEXvmhmbIbbkjCi3hawdQL0SQlUYAdL8aKJgHcQ+8J2SwQbWTSlVJxLO/kiivFzTBaI65uI9g==
X-Received: by 2002:a17:906:6a14:b0:ac3:3f84:4055 with SMTP id a640c23a62f3a-ac7e71702ddmr207332466b.4.1743845257710;
        Sat, 05 Apr 2025 02:27:37 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac7bfee46f0sm387214566b.86.2025.04.05.02.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 02:27:37 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] pwm: Let pwm_set_waveform() succeed even if lowlevel driver rounded up
Date: Sat,  5 Apr 2025 11:27:12 +0200
Message-ID:  <353dc6ae31be815e41fd3df89c257127ca0d1a09.1743844730.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2342; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=XTHV/BxyEsvy+/e1D0B3U1SFxzinwxu6RXZECENuXK0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBn8Pdz3lV+2k9YVQCgxCIptG5ZhxMNDMRXIKrKY 3z+g/Apcb2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ/D3cwAKCRCPgPtYfRL+ TtBdCACRYlwLk+xNAXLqrPUvRBo6pclQCBurf1hke0ta+7+zwB7BVif1PatD0/kS7Xk5+O5w30C qGmVK/j6sOMwbZKTp/4NpShPKxrrNrX2TKaME8TMF9BiriX0ajcXjzE/X6+Z6l7NGj6catNNtYY l+c3+Guh/ahSK63PUoUvlNKvw3Bbtvbc1Z8XtAatQ40q83aHlYO7yJPNPk9ry+o1E/yMLfrERqU 9tQvsv95BamFNcffLLGerow5gJlZoij+3e/WgKFo9B66REBHOZfDReREAa2HjXmjevAYR1jgQRN tVmBliqVOI/g1CaPIJqvi6hPeG2WlQqxuL5LRLchLZR5TRi6
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Waveform parameters are supposed to be rounded down to the next value
possible for the hardware. However when a requested value is too small,
.round_waveform_tohw() is supposed to pick the next bigger value and
return 1. Let pwm_set_waveform() behave in the same way.

This creates consistency between pwm_set_waveform_might_sleep() with
exact=false and pwm_round_waveform_might_sleep() +
pwm_set_waveform_might_sleep() with exact=true.

The PWM_DEBUG rounding check has to be adapted to only trigger if no
uprounding happend.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/core.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index a40c511e0096..0387bd838487 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -322,7 +322,7 @@ static int __pwm_set_waveform(struct pwm_device *pwm,
 	const struct pwm_ops *ops = chip->ops;
 	char wfhw[WFHWSIZE];
 	struct pwm_waveform wf_rounded;
-	int err;
+	int err, ret_tohw;
 
 	BUG_ON(WFHWSIZE < ops->sizeof_wfhw);
 
@@ -332,16 +332,16 @@ static int __pwm_set_waveform(struct pwm_device *pwm,
 	if (!pwm_wf_valid(wf))
 		return -EINVAL;
 
-	err = __pwm_round_waveform_tohw(chip, pwm, wf, &wfhw);
-	if (err)
-		return err;
+	ret_tohw = __pwm_round_waveform_tohw(chip, pwm, wf, &wfhw);
+	if (ret_tohw < 0)
+		return ret_tohw;
 
 	if ((IS_ENABLED(CONFIG_PWM_DEBUG) || exact) && wf->period_length_ns) {
 		err = __pwm_round_waveform_fromhw(chip, pwm, &wfhw, &wf_rounded);
 		if (err)
 			return err;
 
-		if (IS_ENABLED(CONFIG_PWM_DEBUG) && !pwm_check_rounding(wf, &wf_rounded))
+		if (IS_ENABLED(CONFIG_PWM_DEBUG) && ret_tohw == 0 && !pwm_check_rounding(wf, &wf_rounded))
 			dev_err(&chip->dev, "Wrong rounding: requested %llu/%llu [+%llu], result %llu/%llu [+%llu]\n",
 				wf->duty_length_ns, wf->period_length_ns, wf->duty_offset_ns,
 				wf_rounded.duty_length_ns, wf_rounded.period_length_ns, wf_rounded.duty_offset_ns);
@@ -382,7 +382,8 @@ static int __pwm_set_waveform(struct pwm_device *pwm,
 				wf_rounded.duty_length_ns, wf_rounded.period_length_ns, wf_rounded.duty_offset_ns,
 				wf_set.duty_length_ns, wf_set.period_length_ns, wf_set.duty_offset_ns);
 	}
-	return 0;
+
+	return ret_tohw;
 }
 
 /**
-- 
2.47.2

