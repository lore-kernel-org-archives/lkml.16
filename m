Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA2D28F501
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 11:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746788678; cv=none; b=RWmc0N+DOUQH4T9eDJFzaZ2R/HwzwsOqUxaGcpTqfBHEVifqBM0cfGOnMFEBQYtq4Np/5VQ62M87q3aDvCQXi2rrQ182k4Q7a/BN4z1cxA2hh5K55K8nO5kLhZrDZQYHiSPCw316th/3enuyNWhrrrbh2HqvGX22NTheFjvH+XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746788678; c=relaxed/simple;
	bh=xq9/lr0ckddmJlPg5ez1SbbCWYcaXPPvQeWDl7s5Uqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uILzLCfjcZN849pJvG/XYm6BdjorRmmCC1Dzdr6f0FNXHHGHl254GVhJqRmMD7daNzv4ZJASc9pFOey397pACVajw7OM0DwB31jIDWM/RY01gYUZlLgnEVrFLTxIQLojjkIJwhQQFXcd0VHKUaWb3L5tTO2OI9D67MmV+s4DC2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a9aMR3YT; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a9aMR3YT"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a1c85e77d7so796894f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 04:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788675; x=1747393475; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RFGeu4rqa4NbdBxLMRAKny6nuW4xYvTJilVyN9sQWDs=;
        b=a9aMR3YTafGfMtz0ClHPCksXqJFVSYWezaZ1JoJjGLXYQiRGjxjFoid/ryt5wg71eM
         xNt6Pna1GjrQ9ZaMyHdbedjfb9MzXVnPBdRm2gmiT89s3vanheEorXWyj2VzYd2cxTiq
         DN943+hBc8XVVuyNr5B3RY0w6moFTggh9fYnVg5PP7dlv5FUfNorvTw+4/zR6j7L4xEr
         GE1Ix5sMhV7ywVfqyiFAflwc1RAEccJjMX+DlmpqrsrGWecrwZFuRLqtrD4V6uu4P+6X
         W+W8U6PmZIyXL9VSi9HvorTkr8YnQaCmu8WCv4qc8ttZsRHsSmpZva3BGvNCwgC4/HOM
         kf0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788675; x=1747393475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFGeu4rqa4NbdBxLMRAKny6nuW4xYvTJilVyN9sQWDs=;
        b=tk/Cem6NgJU4TFtPp67mMoixLEs7Bhoq0PQEl5vfDdiJI4MshMedFBhrwapKRCocKn
         QKVcNCv/FOQCIqfL/sZznQDORrM4ihKki8oPBOIDuJjaMFivezSqK4s6polpQlrJQ8H4
         7XXZS5powNvEvjtWgQ8niu1uw0uzybnycuQAb7X2iezLk60KYmJzg78+G6sdTm061El9
         ihxgTcsTSekNq6E6LCRw9dH8oSKpM11ZUJbj8zHY9stFhh8zdv/GhRo0cQpKDEFLzZup
         bfBmHSpaXAoH2f37iIyeV7U0QZojEqUDPXUqT/uSN0amZcjGVGYEZmNGYktfxFpHoCbK
         sMPw==
X-Forwarded-Encrypted: i=1; AJvYcCVExlxezCPu+OTK4qAWOOwENep5ta+O9Q/I2sXxuPKHGRZPp9smTr7+oGxTKiZpaB2EDXsrIqF41kl0vnw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAXrcPWaGqdfKk2eXV8jPbjkVF4pfnXNUQp3vMhi7+j2zoZO01
	jcscOh/4+trUj4xuGps/Nne235aRifov9LDxztm3FdEtwWs9G69LAQklJlqgbcU=
X-Gm-Gg: ASbGncvdxUakVfQ5DMMh1NQwCu7zSPIcKbFXxHuv1vDSVviXgUjA7jdVa8v9s0/SN/A
	Pw+GG8uVw8iXMdO2k9GC+hIriRf5x9UNi3EwhiMGgB1zPGk98+FnEYk/Qwo0BroAKs073FolKgT
	IKQLH1WSBHXWng0DYy9re07+k4HmIW+TSx00l50wAg0njV41bHyW1Q2pbn42z+LFK+/C5gmnT1s
	MOphYg5meGJiGC4RHL5OXw3VpuMknJNesATLd1eHVrp5Km6QMKrVtyRB2aHbdFgUFvBiaY+spxl
	Lr6WFK8ZSYGdf4k4aeci9bbn9v4WVsxbQx4INnw6wBKGSg==
X-Google-Smtp-Source: AGHT+IFoLOmKX914wuAyiGBAuaM7PeEJMdeV8PiUZxo0dtylTjuaMjYw6oH6HF/eoBRmbKUgAyX7qA==
X-Received: by 2002:adf:fa87:0:b0:3a1:f684:39a7 with SMTP id ffacd0b85a97d-3a1f6843a51mr2176018f8f.0.1746788674618;
        Fri, 09 May 2025 04:04:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a1f5a4d21esm2931116f8f.99.2025.05.09.04.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:04:34 -0700 (PDT)
Date: Fri, 9 May 2025 14:04:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Christophe Kerello <christophe.kerello@foss.st.com>,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] memory: stm32_omm: Fix error handling in
 stm32_omm_configure()
Message-ID: <a69ce0445324e994ea2ed7493bda1f6046c7ff69.1746781081.git.dan.carpenter@linaro.org>
References: <cover.1746781081.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1746781081.git.dan.carpenter@linaro.org>

There are two error handling bugs in the stm32_omm_configure() function.
1) The error code needs to be set if clk_get_rate() fails.
2) If devm_reset_control_get_exclusive() then call
   pm_runtime_put_sync_suspend() before returning.

Fixes: 8181d061dcff ("memory: Add STM32 Octo Memory Manager driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/memory/stm32_omm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/stm32_omm.c b/drivers/memory/stm32_omm.c
index 166baed0738a..fa0f75e4a6e8 100644
--- a/drivers/memory/stm32_omm.c
+++ b/drivers/memory/stm32_omm.c
@@ -222,6 +222,7 @@ static int stm32_omm_configure(struct device *dev)
 		clk_rate = clk_get_rate(omm->clk_bulk[i].clk);
 		if (!clk_rate) {
 			dev_err(dev, "Invalid clock rate\n");
+			ret = -EINVAL;
 			goto error;
 		}
 
@@ -230,8 +231,10 @@ static int stm32_omm_configure(struct device *dev)
 	}
 
 	rstc = devm_reset_control_get_exclusive(dev, "omm");
-	if (IS_ERR(rstc))
-		return dev_err_probe(dev, PTR_ERR(rstc), "reset get failed\n");
+	if (IS_ERR(rstc)) {
+		ret = dev_err_probe(dev, PTR_ERR(rstc), "reset get failed\n");
+		goto error;
+	}
 
 	reset_control_assert(rstc);
 	udelay(2);
-- 
2.47.2

