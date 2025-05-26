Received: from mail-wm1-f98.google.com (mail-wm1-f98.google.com [209.85.128.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F6E2110E
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 16:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748275987; cv=none; b=fLS+AfF0wcA19a4bEdBma/OKe7upt8VE8frYTmVKOBAjBzraUeYpmfRR3MR4uA9ABhk5dzVRdBARJF4mCgrFpbXcw3WhlBvXZF2U5FJE1H8PpV0oQzQIMdGIMEZgjs+hfz9UB36shHlHLL97A3/pNKAET9KvAm0NW88+x6D4WLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748275987; c=relaxed/simple;
	bh=NI/OMUec2usdoLBvlfF1jggeIGrfCEBPdwkE8290v6o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=DbcpcsCLnQSlgJMdlyKuofmKe61BdaDsywyrjSuc+pqion7BEWfTx6QWYwckS+pBa6bniXLmvBzuWASQopNkQQbUFG7ON3Stq5O7V10CRHLG3e1dOzfkfiqTIUqIaQMFGHVcBDB9ZjJO7SBQMBzbQiNr3b8dn2fNIlfwgijCCO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sferalabs.cc; spf=pass smtp.mailfrom=sferalabs.cc; dkim=pass (2048-bit key) header.d=sferalabs.cc header.i=@sferalabs.cc header.b=log9DSDf; arc=none smtp.client-ip=209.85.128.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sferalabs.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sferalabs.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sferalabs.cc header.i=@sferalabs.cc header.b="log9DSDf"
Received: by mail-wm1-f98.google.com with SMTP id 5b1f17b1804b1-43d0618746bso19136555e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 09:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sferalabs.cc; s=google; t=1748275984; x=1748880784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wsS+0LtRwDL05ZQn//FChAFOcAReeJDC/8+kYOO8seM=;
        b=log9DSDf7WzforFJgsOhL+VJF0M70vmOJtMY354+9btEzOaCmmH/YZiKNc+V2BalKx
         34oVIkponN5GD1SkYjsqUz6OSyiTOqP4V1WJEYRrNOgnzoOA8uVD0qfGxUh7qVT7ryu4
         E7m443SqSWT1IkKtSZsezzho6UVekiSDj378dN35xLInFjLE9AFwrB2Ef/TSV//Lm3pl
         bB090eoRM4M7hzT1SeArNTg5JP7rAmnrnjWu9QMJoCqSfaPm2CJy/TcrujjdU+/C9Nux
         SAFJyj8PiKzKIYeR0x60iJfI6ll2/lHCyeGIybh1QFHLbnIemp2KWHC+NiQ16WDDBf4s
         0+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748275984; x=1748880784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wsS+0LtRwDL05ZQn//FChAFOcAReeJDC/8+kYOO8seM=;
        b=xJOL8ng4WeOB426idt8A+Yn5X50PfHelH40g5i/yiWQMQG9h+K5NnpK4m7KLH3zQPO
         tQbc02n406euVKHOdurDmO3T3JS+FTWeXx7QjkpQPadoepjP1N2vijUqkHYQEBXzCIrg
         crRP3GDP10t9Gr0jHVyxK0Qp/aNFArnbOla4Hc9r87s7yAnimvodGRUW0Wc6E0OaGyAl
         wmkRTiHi5frOt1eXhBVPwTWj4Y5fHg/ohObmmYd9akSp/iH+HhXQGUXEsn86fs8yQHpf
         bm/7hB5ZiQ5bz8H67Poy6j/YCJO/J4jnltriL/2Ba1HapF77TE3SzGxSXGLwuD/t6XjE
         l6eg==
X-Forwarded-Encrypted: i=1; AJvYcCVYopeGxBB/GrsPfiVsti9sS3RGVOGYtByhj7S9YxmhnOOpo2vmBFDDkOquLHb754iphVua6qDLXJoahg8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh3rr+XIRs2xLqx+kdbPGnO8NHSXUlqqElXqjg+XOYXbCq17Dt
	FscS/Z/hfooGrHri6Qv5o7H7d4ZNzIpqYUSQh/f+PMSEN1L2vov7fm62MBfKD7251vWNAebS7RR
	Yp0ekn45XGBqW1N4pb7IeR/mapFKHVPAMgQp/
X-Gm-Gg: ASbGncvnELUZXuB9Nzb0IJuYJC9XYaYXklxph3sAaQXtlqLM9uIKqO0Yj0Rq0Df/zpm
	ACofZEIVsTJp7YB9RWrncXOQTgEzyBIKKfKVlvPkfBcJ6iylGCrlw8u1DGbuAEEyGyOC35VH5/g
	yJ4NnGM8SouiZIJrazmcLIGUNGhSEZdrMNoyvoN2emaRFyseAeDzbd+Ra6a/MInyqDzf1ujx9N7
	TOuxlcOr1dKc6SRQWaG8DodmWlLiLyDu2NI1PcwuL9H6/V8Lr/WpWC+ORk4KqwCuNVP/90DP6hg
	PdgjyRGgshQkAK41/9k82+JDKa9t3+xq1R3p6N0cV8B8JCGjT1D7TEaBVVvI+bZmGT7s
X-Google-Smtp-Source: AGHT+IH0g6FE2f7zN/oIK2mWRyULJDNx6nM32OtLWp8hn/k3j7zaBjmvWmX/XmHRj3KLDTbwO9NBV6wS4gic
X-Received: by 2002:a05:600c:8283:b0:43d:45a:8fca with SMTP id 5b1f17b1804b1-44c94c2a4c6mr87142115e9.30.1748275983808;
        Mon, 26 May 2025 09:13:03 -0700 (PDT)
Received: from localhost.localdomain (net-5-89-7-58.cust.vodafonedsl.it. [5.89.7.58])
        by smtp-relay.gmail.com with ESMTPS id 5b1f17b1804b1-447f1fe4fbcsm14730775e9.12.2025.05.26.09.13.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 May 2025 09:13:03 -0700 (PDT)
X-Relaying-Domain: sferalabs.cc
From: Giampiero Baggiani <giampiero@sferalabs.cc>
To: alexandre.belloni@bootlin.com
Cc: Giampiero Baggiani <giampiero@sferalabs.cc>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: pcf2127: align power management configuration
Date: Mon, 26 May 2025 18:12:34 +0200
Message-Id: <20250526161234.13236-1-giampiero@sferalabs.cc>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The PCF2131 comes with the following default settings:
- battery switch-over function is disabled;
- battery low detection function is disabled.
These defaults differ from those of other models supported by this driver.

This commit aligns the behavior across all supported models, configuring
them to the settings typically expected from an RTC.

Signed-off-by: Giampiero Baggiani <giampiero@sferalabs.cc>
---
 drivers/rtc/rtc-pcf2127.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 31c7dca8f469..cbdf7f23e6a6 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -1312,8 +1312,15 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 	 * Clear battery interrupt flags which can block new trigger events.
 	 * Note: This is the default chip behaviour but added to ensure
 	 * correct tamper timestamp and interrupt function.
+	 *
+	 * Power management functions set to:
+	 * - battery switch-over function is enabled in standard mode;
+	 * - battery low detection function is enabled;
+	 * - extra power fail detection function is enabled.
+	 * Note: This is the default configuration except for pcf2131.
 	 */
 	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL3,
+				 PCF2127_CTRL3_PM |
 				 PCF2127_BIT_CTRL3_BTSE |
 				 PCF2127_BIT_CTRL3_BIE |
 				 PCF2127_BIT_CTRL3_BLIE, 0);
-- 
2.39.2 (Apple Git-143)

