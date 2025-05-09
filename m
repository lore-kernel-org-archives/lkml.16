Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3489228C99
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 11:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746788752; cv=none; b=Z2LntrQC0Y8rAfINd+N7iyFM50y/FEo0Dj1kj9gNHi7sWc5WF22q4GDvqdt45kwSQJ7lGrwqm09ZpINJKGJfFv2Yw+cdccRrREASZm/IhSFS8BrRNOolsyOTu10cSCOql36mV3GGWO0hVGwKxzOyKIFZGBGXwpm8MoKKpPGpDrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746788752; c=relaxed/simple;
	bh=HtlxtTe7nrbfoONlv91HljKDl3ZjJxLieMuEZGdCo1o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lfe+/5suz/uw7WOXjbArijyFGLw3T+UWdxOfUrkH2Fa0/2KbP0f3n0QVmNniAgD5HLo6F1Keu/ZLp//aUVZNaeqwucEyLlP0dE9wMx3Q31Q4Q0gj0oboXGFkmW1MdKu168jKzJ7f6KG28lfR3h6VzpjaELBGR07QF9nztS3YeWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lZsXp7D9; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lZsXp7D9"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so19571915e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 04:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788748; x=1747393548; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=irxrEhweCUXCqGm1VUjTuBVxoEJgZZgYdEdb4JaFlBI=;
        b=lZsXp7D95KXVzcde7g1yuRsj7nHKIvTgG01gyMaIZGQ2K6nMcKLoeUuZfiZg+j1PX9
         ydhisSgcbeXQFEqYkuNuYJAXmTPa8ozAEnEYC9JFNJYcnuEpdvk6m94ZF8jTuKNTlKTy
         W3X/2JS/TVfyDFGsepnHfpsxL5D0T+sC7nzBNc2tATxNCDzkWq5h36H1A5pywB2+Mi0h
         GDyU6vCQd//l2GPAJPjgDe/p+gOwPC3tZIUrxxH6SmcGyYKciIM/67UymaYAiJkFyz49
         tA2/pJj8y2bIGFfPpNf1rV5wJxcG160hOwYwXjHjDT1TJMPg14M8KJ9dgvQcOHTKf192
         UQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788748; x=1747393548;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=irxrEhweCUXCqGm1VUjTuBVxoEJgZZgYdEdb4JaFlBI=;
        b=chWEz/kryD4Kfd6kUFL79xxa5mbq1wT88a+//rtFzxxf9s9a7RKczh4/AKy51gM/Pd
         3wOXOQcS8Qk0cLzh9Eld55HCFLIMNEEJAFcPJTZYUBF+hO1NAkM/H0DhwOXbm2RKEAGg
         SsIjEI0D53J4NbQmWegvyBkXe661w8RPUK04BAweQAI3nHy+3qGZc+y0i1iVSfq2HBra
         Ce6hkMW3MFhRJw5FB+hc2K02RqP5twyO8YKbAdeypL0zVoLhiZVNEeub90WtKZH0zsfg
         D3YEG4iWUK1nsvTJsdwzo3bJl2e4LZrwja4J81TGklwgySuopVzpXg3XJIgKZWy9ZUyD
         YQ2Q==
X-Forwarded-Encrypted: i=1; AJvYcCX5MXv39N+GhnzKuirSKRXWGZT9MRj/mC41wyPKk89QdgR1XAzlvRh1ICJNV+uds0KA74DP5DO+Khar1RM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx/vRkEfBSRjpazgJs6E63zN83ZK9wskzXFkVSEUBQEbSpUqYE
	LY+KkbysbVEpwfomaL8jYBTiBTQRSHwIWn+SZS5k9BqOpcWK52pdki4wgVAfoGI=
X-Gm-Gg: ASbGnctvaDn+82JxuCf4Ws3tNElHr2Fj5TttRTD0pbsruCVmNPewvHj6dchLqovd15T
	5ZZ1QuvN6qcAOiNdHBlmR6xs/hsGwOtnSaAk1/50NpaJYJo4V/0fv4vc+bJMbL05KtGlU5cOt7u
	FMQM+FXl2vzlr830sVSQLfgGi6xVnHYpNOW2vHbzuzsIS8zs+GPO0vx6Q5atyOLuiKp2jTlOAX6
	ySz83DItP3C953TpARL0ABL+6nY1CUAPE7MAnrcySgxalFYCAhgXN8c5r75X1qNla/omFzzewN9
	/kfaqgHvkV2Thdi6LMI5+UjOiJ9wfMxQeeqTUDCR4yateA==
X-Google-Smtp-Source: AGHT+IH+jBPAUs3aXz3zrzpBM/2GBSQQqn+LzvaGfSuxOybuE/QO/NbJAsghIVYoGpfZOS2NV7eWLw==
X-Received: by 2002:a05:600c:8714:b0:43d:fa59:a685 with SMTP id 5b1f17b1804b1-442d6ddf58cmr18396045e9.33.1746788748089;
        Fri, 09 May 2025 04:05:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a1f5a2d2c8sm2916601f8f.61.2025.05.09.04.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:05:47 -0700 (PDT)
Date: Fri, 9 May 2025 14:05:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2 next] regulator: tps65219: regulator: tps65219: Fix error
 codes in probe()
Message-ID: <aB3hiEM0CB8m_X8m@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There is a copy and paste error and we accidentally use "PTR_ERR(rdev)"
instead of "error".  The "rdev" pointer is valid at this point.

Also there is no need to print the error code in the error message
because dev_err_probe() already prints that.  So clean up the error
message a bit.

Fixes: 38c9f98db20a ("regulator: tps65219: Add support for TPS65215 Regulator IRQs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Clean up the error message.
    Also fix a typo in the Subject

 drivers/regulator/tps65219-regulator.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
index b16b300d7f45..d80749cdae1d 100644
--- a/drivers/regulator/tps65219-regulator.c
+++ b/drivers/regulator/tps65219-regulator.c
@@ -454,9 +454,9 @@ static int tps65219_regulator_probe(struct platform_device *pdev)
 						  irq_type->irq_name,
 						  &irq_data[i]);
 		if (error)
-			return dev_err_probe(tps->dev, PTR_ERR(rdev),
-					     "Failed to request %s IRQ %d: %d\n",
-					     irq_type->irq_name, irq, error);
+			return dev_err_probe(tps->dev, error,
+					     "Failed to request %s IRQ %d\n",
+					     irq_type->irq_name, irq);
 	}
 
 	irq_data = devm_kmalloc(tps->dev, pmic->dev_irq_size, GFP_KERNEL);
@@ -477,9 +477,9 @@ static int tps65219_regulator_probe(struct platform_device *pdev)
 						  irq_type->irq_name,
 						  &irq_data[i]);
 		if (error)
-			return dev_err_probe(tps->dev, PTR_ERR(rdev),
-					     "Failed to request %s IRQ %d: %d\n",
-					     irq_type->irq_name, irq, error);
+			return dev_err_probe(tps->dev, error,
+					     "Failed to request %s IRQ %d\n",
+					     irq_type->irq_name, irq);
 	}
 
 	return 0;
-- 
2.47.2

