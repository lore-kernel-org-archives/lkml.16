Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52211A83ED
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168686; cv=none; b=uYC2yF1QFZq324LZGwHXVDhQEMGYkBu7yo8j+xPU1YZ8FzeN5WGKYxgfle487nK3EivDP+ncI8XvdkQLYvB0/A/ZocMTaTbW15StUTFxHOKlt9suL+TdQlGf/DMr7/BFlBGfZxgZHFph8gDGvn8pl2ksqjLVdN7NQkOjld3y05I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168686; c=relaxed/simple;
	bh=X0QQTgyZyBPIURJ3v2tympUyOwlqSVYuYyMtIMSpfpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q+S3llgJ//i4MoqrcyXIirqm9KNeQEmEOi0Ll9pPVZnA42wewfP0HY5e8NgiI2NWtc5bVHP1Y0JRafj5S14VcZQt8czafCnKq9BL/nOqaEjJ20Mlj/3IHMzblaXNdMRrsTVYCpD/sP/ccB+2HJ5lQOT0t0DG2GD87ORBe9OfiFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=En+/83zz; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="En+/83zz"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e60cfef9cfso3340293a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 06:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168664; x=1743773464; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kV75c5wurwfdiB4LfjbAT+jBLqgbz3xs0SfJTGIePwA=;
        b=En+/83zz2JnMpQOWtuk2jCDJ+XxaXrWiMelE/N8tSqAWNlQjxSxlMoVEEmE6b33Sfk
         NTdaOnhFa94eLQmjNm0kQX9LkllxVIDbU0jX95dZG3s26gd0JJk0H2UYYfLo62vvjKjf
         fnVNqpK0uxH3NSfbnQYY0Cs0UQD3VnK0PRhGQtW99BP2c0ZYhui+pddKFsu6/BbjMEJ8
         zN5/RQBoIdNDbbIDDtUR2jvqr3ZdbOGfRIpuIAf0rNr3I2aDjSfPDJgoqXvQSULs3eDe
         SHS86+6HeMQPVvrg6x0rJ2IHK5sir5Tjuqxtqg6lIo4mVJXez7M2lduvv1DNech54jG0
         6NOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168664; x=1743773464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kV75c5wurwfdiB4LfjbAT+jBLqgbz3xs0SfJTGIePwA=;
        b=W/o5NCs14UVbsfIqU2nGSTZ5v6C8qoIipIImgtZ/ZPW5qN8tnvhhU0hTIPsMY7pb43
         bXLXn7adrY5/p5LiSIHM7lIGW/q9plUsT4LDKT68nIYDxW8I6/5ESeSn6NN7P2mZPVzA
         5PPo/Y4wCc1uIhjmE3yVUgs6dzLg8XvpNuwXe7qc9zR7MUlfo3IExrX0HT0WxADmNESH
         R/buHbXkS1IZilX4QBfk1y7OMA5m636V50bXYR04ypK8542KVxlA8TH42hrkdw5LDqdk
         c5e4VMvGBcfJTF6oAoQnybMowg2k6aKTvVN9fRrRue3Cbb8jHmL440JmNd8/e6hoPOBP
         GjWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgqTNqZs4/YuhRG6N7uZ/uwNbx2eJj7bluTpGeOz1lDMfURXyXOIaV0GxIdJkH+IF/m7bmV7BhTmwz+I4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHGcysKi3B+gJXRDT+0GXekpQMHdUAoTrP2NvyJn61M0ntO2tD
	jG91xvcRE+s4SdRwo/MyKsGZrD8ZF4AXpvFUaoyMc8lih3Cy7FI37miBRvIFE/I=
X-Gm-Gg: ASbGncstLEqKj3JVaBr3r00ZVCAblQOkxPzQ/LaZyEKzjTuf9kRDZzzhUNmMs8igIsK
	aFfI7FN26zyWCdB/DILs/BR3ji6G7KOHh8UNEOFVZrwAdSyn7r8SpOEV7H2W8Dmy6JbrHwggDod
	bslWi9G9+5UbXhXIJ4GReXn+mH4jGUS81epmBi4wItyh8plW4T6IHPUpKxvG2Zp8sjCaS9K+liq
	SH2u+63W3VW0YyymJ/cgBhoa9qkEHTucwNVEq1bWesZ/9zZfU8u/vIvnm+aLJL2oyqczbxPmMlw
	M8aLXUxqObW4IJfOnOVqtkmvkmm+3Syi/k16+IYT4N20g2epYzOfcIzSPWY3368sJjl7n9sy6Qa
	W7jQwtd9SqdqKvd1k5mKxJSidQNBu
X-Google-Smtp-Source: AGHT+IH82jsJ04KqxSx2urRuI126Wc6BqmkR0wyKM63ai8QchgotV1y1Ewu8V3BijV087u2FKOXDPg==
X-Received: by 2002:a05:6402:26d0:b0:5e5:c637:b69 with SMTP id 4fb4d7f45d1cf-5ed8df6b334mr7910381a12.6.1743168664240;
        Fri, 28 Mar 2025 06:31:04 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:03 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:06 +0000
Subject: [PATCH v2 20/32] mfd: sec: use sizeof(*var), not sizeof(struct
 type_of_var)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-20-b54dee33fb6b@linaro.org>
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

Using sizeof(*var) is generally preferred over using the size of its
open-coded type when allocating memory.

This helps avoiding bugs when the variable type changes but the memory
allocation isn't updated, and it simplifies renaming of the struct if
ever necessary.

No functional change.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 55edeb0f73ff4643f23b9759b115658d3bf03e9a..e8e35f7d5f06b522a953e8f21603e6904401c983 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -163,7 +163,7 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 	struct sec_pmic_dev *sec_pmic;
 	int ret, num_sec_devs;
 
-	sec_pmic = devm_kzalloc(dev, sizeof(struct sec_pmic_dev), GFP_KERNEL);
+	sec_pmic = devm_kzalloc(dev, sizeof(*sec_pmic), GFP_KERNEL);
 	if (!sec_pmic)
 		return -ENOMEM;
 

-- 
2.49.0.472.ge94155a9ec-goog

