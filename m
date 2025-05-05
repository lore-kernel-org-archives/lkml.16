Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9931F1A316A
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 11:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746445188; cv=none; b=WmXu2c9HKO1vEzqk10JeYbzonyl6/3K8znmUSQpe8YofgzO7/IWRBcNOpQ3hH7oQam4juZkRmGTSRAjoi3JsfNDQr1oD6jrWLNqcgZZjSk2tdb8LmLbCiglD7vz79OJxqdEcvcL+7W/++tL+nI+vdSUpgh29gnNd82TFwIPCgFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746445188; c=relaxed/simple;
	bh=4bKLvDsMPtH7EF9AXDSmtoiw8jurLha7GghprHG3BvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H/MQndwX9FDCuvsft3nQV0WYrGeyuejfXuPII8/JWigsxcErpybMV30G+dcTqF3UvMhZTlCkwrREv/SFSsQtS51RfaYxPX6RrjhzZqV9pHuhiBV09iESTLMYR3N2Tu67t/4KYITrStSlRKtgBI9HW/v5VPQ5FJg4vqVJB8nG9kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TN6+LJud; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TN6+LJud"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ede096d73so25201645e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 04:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746445184; x=1747049984; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mJ5GcmEYYVhQR96gxyM5WKIfvUizOn+pM0wiDy3cDmQ=;
        b=TN6+LJud85Ylkf8tXRdSjuWZCMG+R80wAhlGd9Q9RRCjzeuZ1s/C3xpVXpkxYUvuFK
         iJL9DH7KK987kWAtrQ+TtJj9lyQCOmih7JRBjdHUFIVJUQ42MZw6/LD2cWqInT1jdXEB
         D3BB1OH3mOUmnD6+aj2OXUJEYhwpm2kogzQZofcHWAlpkmo6czoYn0R0I+K6AoXmUlTC
         +IJX5eQIg5a6iNe0faQkR2/xHOkPadnevNuQ+I3E7Nj/OnSltEapQ0+mscncGe1kHUtc
         xF3dnT+u7bg/K1eMpMTbm0sEQ7caHL6OxU6t/sqV7QmwwMXZcifcXQudScPqmTKqCIjZ
         M1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746445184; x=1747049984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJ5GcmEYYVhQR96gxyM5WKIfvUizOn+pM0wiDy3cDmQ=;
        b=h393lq+SwXvWg51IHPoaXi4hQN4pJsx5PugJFrtB96Essfg7jJrWdkLMRrVeMxTil6
         WiXmd5FOsI1ODf9yiqYBnfRW+Wk/bFHKDnwd0hjfw6KpQvWWAeEVi9bKdmuehWu+4EBv
         hSw/PoXJ416+kQfWbKBiCUJlBmjcItjGVTh3hURSrSAyNBhUKEvooYsrqC/LskVDwJG8
         vd+wR1Beb1Z0FxcUiA9q+UNp81R2DkkE7Dv4+3R7QN5zWxzYdEaZ4qJK2M2dSq9Bv+Np
         Ur1T0GLgYZuLB2z36WXeFtXyHFFIX9bNuCKTZ0D3bsz2IuXe5KAjewWgNWeuUFp/dNeS
         3iHw==
X-Forwarded-Encrypted: i=1; AJvYcCVY66iag/EuCE1H52Hl4k7Uj3OPlYzUdhnXHXEPVVZdDfBEVwo0aF6KdU8ifuJ2/ZMYulq/NHdGD3iqIIs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6SdTC9IxfQ4zvv1c+Lb8r1A8PHA1TaugVr/7vECUn4NcK4o5Q
	eLWy3LW5jw6jmxTCDuaQYoRaoz+YHVC+SMyY2Lwqjl7b5mIXucWBqVKLl0EnA7I=
X-Gm-Gg: ASbGnctL5C74Gov80K9ZatDvHNg2Fmi3oHHZ3giroVM8fqDswZ9PY1eYXCZflnit8b+
	DlPR5TkNDmbbybc0D1g1opyCJe+5hCKbJwdN1+vEc1DilRWuXnGnuO5cPzNmyxiID8HWHp+z8mF
	gxIvYIyG790GXrmtm3RvIrtMv9heAveclmIRyZ0L0gG72SjsyRxV4A8FZbqNXaM/HnR5ZEPJsMu
	h2JKIHof9ZSDe5+VHnnbhzf6dH3AhAMqQsc/ORGu7aU8xj2nGqp9vdMuqPOvt6SG94qKkH7NyGl
	TJ26mNKVDeEYCyqFZBKdZLF1+U2gssJyenegMP0eLY/10g==
X-Google-Smtp-Source: AGHT+IF691cbKdNi4eo7oEzfSp9l49WgI8HMTDJbfgYt7c7D7g1nuGGELzTh8vYSZBETmpZ7y7TCVA==
X-Received: by 2002:a05:600c:500b:b0:43c:f050:fed3 with SMTP id 5b1f17b1804b1-441c48bdfb7mr51792235e9.11.1746445183903;
        Mon, 05 May 2025 04:39:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b89ee37dsm129618395e9.22.2025.05.05.04.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 04:39:43 -0700 (PDT)
Date: Mon, 5 May 2025 14:39:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC 7/7] pinctrl-scmi: remove unused struct member
Message-ID: <e7a338b653d378b37f8e0a73ebe6750adc1cf280.1746443762.git.dan.carpenter@linaro.org>
References: <cover.1746443762.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1746443762.git.dan.carpenter@linaro.org>

The ->nr_pins is not used so delete that.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/pinctrl-scmi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 40b432aa4756..d1f3c126c3cb 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -45,7 +45,6 @@ struct scmi_pinctrl {
 	struct pinfunction *functions;
 	unsigned int nr_functions;
 	struct pinctrl_pin_desc *pins;
-	unsigned int nr_pins;
 	struct gpio_chip *gc;
 };
 
-- 
2.47.2

