Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4121024CED5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 08:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670771; cv=none; b=FfDYs6SS2wOvNheKn69pocaeQQC49nyo3Ma8EZrJVHRWopzwmkk7v8PJn1Rut5gEZ3HlaE7fOJ+TWAKAyfBYS6+2xE45itdukFs7659gu1AVvl3M3DU+LAi9wIVfTO3Rb2+eRSq95NQ8nj6gILFSlpcU7zT5Zh0WCRVxRdB9T+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670771; c=relaxed/simple;
	bh=oM7nIChVy6AnX102peSIS6No2vZfRMNewLZjt/WfrE0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tuVdhop5uz/HHdIBBrfAiDaEClOeyZJU8tXTNtJ+0N7RzLSq3dcfK+J/TV/SGeLAaXwWaSvD2+wXjAUN3chhW9rWTUVRopmhMXJxVKm68sSJbf5GUDaPH23Tt5v3JM2xdv/qOf6dn5HsQw1G4qaI0BWyoptV7vkyt0yEDbwV6pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xnmhaCd9; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xnmhaCd9"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e5bc066283so1078749a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 01:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670758; x=1744275558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=31t2yEGURbHN+dYzF9A6q02DZ3VBH6YOfFo8ts0pTFs=;
        b=xnmhaCd9Zm5KVsU5ibOL1l6D3ybGyd/eToDjJmQT5PDvMGfSd++pD138Ee+e7c6AnE
         PrQO2B2imaSLq/6GihlyV6wQHVAHrH6pO7KtpEbpQ8ZYRP2wm6RtQ284Gc+91DR+hcvV
         CLhaEMocZTXuQeDi9dCAcBXJZHxlg+TRAfaotPV/Nj+Yh+3inN6eEgLoA98Sv/+Xzbal
         bVc0/DoClIL1mqzeOmFd0JFa2UjruYi1p7J6JvZ1G+27kCpVi89RAUkyeFumJtofu1FV
         +SQlFzBpWsj0q5C3n2rRHSNCquYbhdkDctbSt7fXnz5Trj3I0Q03JjTYTDSOjJpz6ktu
         qBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670758; x=1744275558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31t2yEGURbHN+dYzF9A6q02DZ3VBH6YOfFo8ts0pTFs=;
        b=p9VnMP4t9ktiwK/akQieyrYvHa5g7fzobJ9+uJHB8ok4nUfJE4tIZrR0YWh8uMquEc
         2aDYNW/KUxL240dQHNUWOkbJHjLQXhAhtROqTWC9cppI/rIuW4meMuY5HNEeMyNGLcYI
         cA9Z2g1d+VBBWZfToVLUJGYU6NGuUxWGQP3e5YfmXY3blNHboNNmK5RRllx+I2YYImj7
         owG2VObzgfC4kq5YtKZRsNxIAq7gTm51RrvUeghEyECEZKlMLU3CYXqOADXrWQxXmmkG
         zj31S8BUX6xFGp1GmWKK5UEMyo8fWubM25glg5o4FmXnjImtHeVSDjDEg6JzTdE1qO8/
         fFJA==
X-Forwarded-Encrypted: i=1; AJvYcCXz9fJHYhQ7hESpLMRCumH51etwHLpbRkkqyL0EbRlvixSGnIioTuhyuUPi5hMk4fRlncvkKNVVg/MT+78=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf59p7pORNsuh36YLAnYRbk0TE9w03crmKXNqBXtOQeJqZ7Wu5
	Dki1N9Q9YaE3LOol7Hii7UfK5UkPbfAOsuLuOi3w86IF4KmrQv7R5hiknxEuY5k=
X-Gm-Gg: ASbGncv7jdxXtF33x7Zza6X8ZGXosfl0v/qZcXlsQvBgJ7xRxaYxhthqIkjOHlhshQ5
	VXr1c3AqiL/5V29yVF2UxlaYazGlhvN6VFneUCdqJ1h7rhlmoDBGWYA0qZdJSc7PbozH0hVpaEn
	aftYA8QqLWONnph/keBqvEuFs7DmBPJxf/Nwmj46Gc1j+libtWym6oS8iGYAfxfOiaJEClN0XGY
	1JKydz58WYEjU/tTqeO8FHmH2jJASmCNAggUa6roh2COGRN7Hrx7C2OjSkcXUgQKFQaqCtAvfOr
	UGbiN4IANKeNGw2kxFX7zzrgfNKuQ9FkoVdiHqKjoHiLJGpux7gh63C+f9PvaBStOATvbPazT2p
	s9NOXcrb5i9gYybzwwRydAcUNO/6d
X-Google-Smtp-Source: AGHT+IFEc5fuLq8ADhguEhOTmTcH3HLdnlMJdU+ak+pq0TlS6iw1Do8PDAk7ua5/zSdVwdumNPkJLg==
X-Received: by 2002:a05:6402:40c6:b0:5ec:f769:db07 with SMTP id 4fb4d7f45d1cf-5edfde2199fmr15498579a12.29.1743670758300;
        Thu, 03 Apr 2025 01:59:18 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:17 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:22 +0100
Subject: [PATCH v3 30/32] rtc: s5m: replace regmap_update_bits with
 regmap_clear/set_bits
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-30-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
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

The regmap_clear_bits() and regmap_set_bits() helper macros state the
intention a bit more obviously.

Use those.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index e8e442c503064eb4e570af5bf7dcff6bfa7f4656..fb65a8e439d72d9070751c00f5826a403ac0b416 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -338,8 +338,8 @@ static int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
 
 	/* On S2MPS13 the AUDR is not auto-cleared */
 	if (info->device_type == S2MPS13X)
-		regmap_update_bits(info->regmap, info->regs->udr_update,
-				   S2MPS13_RTC_AUDR_MASK, 0);
+		regmap_clear_bits(info->regmap, info->regs->udr_update,
+				  S2MPS13_RTC_AUDR_MASK);
 
 	return ret;
 }
@@ -351,10 +351,8 @@ static int s5m_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	int ret;
 
 	if (info->regs->read_time_udr_mask) {
-		ret = regmap_update_bits(info->regmap,
-				info->regs->udr_update,
-				info->regs->read_time_udr_mask,
-				info->regs->read_time_udr_mask);
+		ret = regmap_set_bits(info->regmap, info->regs->udr_update,
+				      info->regs->read_time_udr_mask);
 		if (ret) {
 			dev_err(dev,
 				"Failed to prepare registers for time reading: %d\n",

-- 
2.49.0.472.ge94155a9ec-goog

