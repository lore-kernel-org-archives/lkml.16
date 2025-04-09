Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4BC21C175
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 20:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231076; cv=none; b=eIf9ePsAZkN0RTHSDaSFYr+1N+Bi/KtoeOB0sw6Bx3qXbST6kRujokrQYyk+g3NHqqWlVpYeQRYQruRepPPeZnL45Fv9gyQ3fu4vQ3nOvc9BhRKyvuXYB+REdhlCJU9qzQqpXVak1I+UA0M6YGgrT4GT3OrDq2CWoUJN5Z6YOZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231076; c=relaxed/simple;
	bh=MOwN2YKQRpsoNetHBGgHFyjhqmCGn2sEj3wN4XKb40M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MDy4lLJ3bQHaGaK2EHTCeUQod8DxvKxSyzuwe8jQwayLuNlGI5dtVWBtNMV8YWrAbclYQX7yXNhtuinuLz1DWpmdzeic7itxEajFNOoev4cb16V9oqnoXCiVE7yYc/RQ5UJOUgU/YHblFO642ZqZOl4EoLeMB2kl5EyKHa4UwM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vm497A+j; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vm497A+j"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e677f59438so145039a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 13:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231064; x=1744835864; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mKIEGv3zVsS/tvIgE0OLlPL/FateDyHpIQVfqm7tXaQ=;
        b=Vm497A+jx1EVsnEcAwNyYtILjLg/h8AtRd4f8kz3krTaccpoQpSFgQFyjb5fRM3mnu
         0gREPRuSqIVeGcsgrcw5Xjc2QgboErF/SfDeNoHSve8QPuTEK8tF5hNodZGTTELP2QvZ
         7P2svcFnz9I3kFpga/CWKZxHjMGLSxbi6siT+q6BPTrchYpvUaRyJVXOyiQNwApfnUGP
         XEK9wBVfX1O8dugaFuFEbCzl01Dq61xTdCVfzW5kPLJ61905qEVZu2gYHdUBuF9jCa/x
         eeYJ0e3UzHObjvCJrc6gthnoulEtuZj10SZejvZtfJvhnTlFi44dVYXI/8vpD3AVY/ZG
         d7jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231064; x=1744835864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mKIEGv3zVsS/tvIgE0OLlPL/FateDyHpIQVfqm7tXaQ=;
        b=oRDVgi442hNgaDVVzzkbjdz4RwYn3n3QYembvlDmSjq08eGrdv6bknPdIaDTBM4sn8
         s5jM33ZLA+z+xnciXOFlsZfYDZ86A5lTIP9XBfVidV29GDE9uHmpo2U2Gf9JsY27k+jG
         HZBPyrnzDSgcJpusrAgeQumYvhgXEzXz6fci8uADyYDNKbuWUSejFELJ+DEfhjEbuMAf
         sddPHbuCsazozRmp7ABXkPS0xF46kAgnGSGUyWcgxUmyk4/GkoZyaanzdhiyKOkHgFpL
         6SLQcYhR6U+74FXnenpkRW7bPp3G8sWx0JCwHS9GMsDe0rJEYx4RpSajRLh2LK8Oloow
         WXWw==
X-Forwarded-Encrypted: i=1; AJvYcCVGJn//knM66o6/0TjG70Shjl6SzCHcI/wyyBVlfVbIjnmUIQWTRs8RzlxgYnFN9mjlmhKPVoL1uhQp0Os=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6vLwzlqPlkr//TECH9YwxPYbz5QAnmquu+1DMxJHPbV01XejY
	9jO/rQrR79j7mUSv25ZYoFWUDbaTKdAQQzmFC78Mn/AqdHm5iyHA4VXBamiIUdo=
X-Gm-Gg: ASbGncvTrfVqCsw98QgEZvM/CAvkK8NPVxi7Cja3AJ8foKAV5QzYpnEIH+74SpddYx+
	1da51+syi64oXSxEX4/Mb1jeLoLKZzk6g7mPw2cKgIoJxu9ob83hDccdIvrGVe1rEGm725VrNMn
	Du6PnZGPZ2dWAe28o1AW5/DzRjL671vamHW1Y6E1g/x0SHdoQXmn6ZYwzUwfya1dWCrJ26xSVOJ
	hNVGdSbZHhw2NSvKOHmRrF3Aa/wXPVOam2vHfIVIfUi6/dB3/G4Z1G6CD5x8rPi5AfpElTG/o89
	Te+/9IJTb6j4hjQdtxve3fNpLwmelPAQ4jBy7uObhVFGTRb8ytlC99JiQtc4Wt2mBB9cju1nzjo
	P7Gx5z+w+qbuiVgNCu3oQlPE3HOlbb9olgaHOpA==
X-Google-Smtp-Source: AGHT+IG1YTLblK2ZacnQ+muHHFTtW2fsPo4+YsM4khlJQ2EKJXJA7UZyAbkh8L9PKTjc8rDv/I4VCQ==
X-Received: by 2002:a17:907:7da3:b0:ac2:cae8:e153 with SMTP id a640c23a62f3a-acabd126d26mr9987066b.4.1744231063960;
        Wed, 09 Apr 2025 13:37:43 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:43 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:49 +0100
Subject: [PATCH v4 28/32] rtc: s5m: fix a typo: peding -> pending
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-28-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

Fix this minor typo, and adjust the a related incorrect alignment to
avoid a checkpatch error.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index c6394faaee860427e8b84e9c6df2d8229cf06d93..095b090ec3949e0e8074cc344105daa00b795245 100644
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
2.49.0.604.gff1f9ca942-goog

