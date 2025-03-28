Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B4921B8F7
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168683; cv=none; b=qWUAsg63IXG4RC4pcuFcY6kh3WAswBcTkoevOLyv4EcAtmHWQ2NDOQX/T9ByDgYtvhXJf1InK57jAB7HyogGI9S1lrwWuyQRHOpIaa9YgeTxa3Jz154t+hWzJARibpbDTwNjhV6KvRbuNFQcWdaOAKazoo+HQXWh5iM34wIDtRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168683; c=relaxed/simple;
	bh=OstHPLtut+rInIwPbWUGG5F4uJhc1s8p9YL3Yn+eQfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YsDS35dDiPSAN/zwjEiyZqktcYxxmiL1Th4EU4dik8VbAIYGgVBYbv5jZeq5Mq8Yko6bOHVqssIrNKFKdra8DK4j9oyNkoj4dQdml1doDjpTzWX+jCZDHT+X7o2AJJa+/OOUEz4burQ9KkM5cGtWjs/2gJBmlNyKK1Atk3WoaYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i4SRp9az; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i4SRp9az"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e5e63162a0so3149809a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 06:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168669; x=1743773469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zOrAobgqux207RdFFKdVSyI3bSrdsl4WaNtosICsko=;
        b=i4SRp9azeCw6ildaDM+Jt1ptlEfcVSNAp2jBSKX+I1dZarZ08fJs3bxXIKf0hOgbWh
         ImmY3aB2kP0NihUk7KJdIVezaSIchjQKw9cWDpSuuwu8rCQmd3F3BfWSqKJXalorYhn+
         6WeWWXwAlhG7hYh/I2QQoioykshyYGWsfqO0Q4HxJTUuYow+pAh6xz62s9VR5oCZcFQy
         wJmAipyT4KmD8/rMys7Nx12AfQcOcpkzOtPaWwKPmhIx6ULE8OP0RBCRYMtMD7MgMlLB
         AYw/5IB+1oGEreWhGr4KV+WB6DG2GThA7wBLwI0Khscwqjp3SS0M//P161dMvQs/rlHA
         aj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168669; x=1743773469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5zOrAobgqux207RdFFKdVSyI3bSrdsl4WaNtosICsko=;
        b=flJZdd+r1Qr0eFrxVVl++QkPYtKqXr+9jcstcDBBM+lOIuDrbVIxMChpuwKbH9FEkI
         UPscXzEBM7k7Ct2A1SGAM+RgSHafHiB13Q/WCcwDivyHLbIExBNDJ+T0odxqBgDDQBHh
         nj00qEwfPbEdB95j5K6FBbiuPEOYuXcT17yhi5LPXYwrmWLtmH1WAKUV+YcvKH/MfcP9
         Q+LsxTf+Zj6lq5KjuAHfyUdYf/2R/6/0pNIOoEMS4o+GyNVwmetbXSGMvKIf10RjvTdI
         TFJ9RnbN4+OIAu0irs+dKuMSiovvv3x9MbESka3C8CJDLykUPtxbI4c6sN/JKNTmlimV
         uCtw==
X-Forwarded-Encrypted: i=1; AJvYcCX6VqyHwgYxiSxCcElw8H5EHFA1YlYVCrVtxYeRTw4eHvOoep+ke9haDgz9aFgmonhbK4xQa9kb1Ai0Ha0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjlrP6qVawXzPicvHuow/lLFt58lAcxDIO6lMu/TPzD+lZFD1c
	j4aciaX16nrukJ4MmrlkW5KzLEvwm/OgP+A0sPpf0PlUuP5ozesHR065w/tOfKE=
X-Gm-Gg: ASbGncvkRrYwKpczp8r6y6Kyw6uzs9hDf/LJBU/201xcoBTGJMBS9HLJW6quqEnd8L4
	K7/Y/iTRCeEo2Sm+ln/xV/6JE3Ir8t5MiagK8c3gEI0v3I50cnV3MpR9PDnkipeYkUYI/EfA/EY
	MLHcSbx2s4iCkOd3h7v5i4z1cHXMOss1mCW+P1tPWUKKyl1Ss0KAOm8eGUlSAvpSwXthXDHlQFC
	RwQQiv74EPR74wqSFuwxUhx5/IgG2kH0dIBFom3hLHs7VTNlU6TgZ+SIEi29PiaddTZrnpAc4dK
	qXHW9EJgPogsSjdyNDuuaCCPIU4nGVGUb7d0E03vt4ngEJlLtjdv7K+BjpAW+8bo7ObfOdYJuKO
	lkPgUY7b0ELFy60MVysXgLSPICfqX
X-Google-Smtp-Source: AGHT+IGPOuJOhetnhPLDwYjmYCFkw94wWYnGaOGbWSLs66EXrE/s58NfpYkGGvWXaz4pE2WTKd2LXg==
X-Received: by 2002:a05:6402:40cc:b0:5ec:c7e4:b6ee with SMTP id 4fb4d7f45d1cf-5ed8ed2ff84mr7735639a12.27.1743168669063;
        Fri, 28 Mar 2025 06:31:09 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:08 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:14 +0000
Subject: [PATCH v2 28/32] rtc: s5m: fix a typo: peding -> pending
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-28-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Fix this minor typo, and adjust the a related incorrect alignment to
avoid a checkpatch error.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 0d8783577bab4f4ebe61050dbd68387d970773bd..7b00e65bdd9c25b3426f92355f8ea36e66c3939f 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -243,8 +243,8 @@ static int s5m8767_wait_for_udr_update(struct s5m_rtc_info *info)
 	return ret;
 }
 
-static int s5m_check_peding_alarm_interrupt(struct s5m_rtc_info *info,
-		struct rtc_wkalrm *alarm)
+static int s5m_check_pending_alarm_interrupt(struct s5m_rtc_info *info,
+					     struct rtc_wkalrm *alarm)
 {
 	int ret;
 	unsigned int val;
@@ -451,7 +451,7 @@ static int s5m_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 
 	dev_dbg(dev, "%s: %ptR(%d)\n", __func__, &alrm->time, alrm->time.tm_wday);
 
-	return s5m_check_peding_alarm_interrupt(info, alrm);
+	return s5m_check_pending_alarm_interrupt(info, alrm);
 }
 
 static int s5m_rtc_stop_alarm(struct s5m_rtc_info *info)

-- 
2.49.0.472.ge94155a9ec-goog

