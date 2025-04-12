Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E978E18DB1E
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 10:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744452938; cv=none; b=FOyytqAXC/NS22xcT/V3aNKfRaWVQ5cRJlKmTLirJpAGy0fsfapMDPepZXDA43dazKxlCPC/AJD1kohHyfy0A2yswpP2rUx/7T+RPXoWLFivfoHt5mPCnGoDh+xro/xeeQxVcGqak9TJhfFoUFHfSQWrcxb25eXrb+7DDjrMNHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744452938; c=relaxed/simple;
	bh=U5hk+MMWODIgneoe/y7sjmG33jRN88m0448jMEiqvfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JKcaJFuF75Y5VIQpGmZFAV8icLl+ctHH20iARh7QRC0uHkL1F/Caet+pnKocXpNfeVJ1uwQdwfw7re0rv28HhKcjRdLRNkLF4kNZBrKWC3hlSjYBJ4GE5uN3PX3BcqXYNYVIvT3N6+PdismP4Bp5dp0W56G0lqE1vg2su/aLlDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s8QrKQ0Y; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s8QrKQ0Y"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so13359535e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 03:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744452935; x=1745057735; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e4ZyWmi66QBBd2EXEOk510Gi6AUK8otoa49t7kPH6c0=;
        b=s8QrKQ0YLrkvny7p8Vk4mO2D3IloATv5VmLyHCobKJi+7GeacHSRw9nmz4XUUBHUAk
         fT4IIXnCwFA7ZR2O+H7ICECgzt4XBo3H+r1XR27fvH9NWCPh+8Amxqe191qAOwAhawdx
         IK5Ss70MdpVbXL2zWsmM44rHOCcA5X+djAHUap92JMn3GkYkXGVkVq5Vi7s/OakqUGR8
         cq7IkzWo9aS+OPY+3vLgIeSAYaPMUvf5eAfdUxujUVBvb8NuXoTb3UZyIxMtLlgXfTrh
         L4lLP/sXYHqKLCA3lc+vAPuC6YJBrV2azftWWH4Oiy1dVM7eCcXLx9rRCw1MKrkHrCzL
         jSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744452935; x=1745057735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4ZyWmi66QBBd2EXEOk510Gi6AUK8otoa49t7kPH6c0=;
        b=v+qaD7KN+pLYePa6FLmxFvBJNVA0JRjf7PzpT1/xRNsVOlVjrN04KpcGc626gfoPdz
         rDuOmI6CCeWqe8lB6ccIBcLST1lNTeihVBFYDUhJRwhcSnrTEELHdPTEZRD3PMcHuJoA
         wkjZKo+de5pDU+C6G3YC6IfQv6S04YGqTvanRXHYpZEe5e6ggkTSaCSBk+FhDGEjSa0V
         0PS1RLVPi5he/t1F4fnC1KSxIdZg2IU1lDGhnVRXPsP6pYslPUtWtm37f+anQ/l+t3lG
         Ojc0rXZUfZYabWzuSqBNaWJj10+Sh52UUM2K2lkU5Pug7vUrbJXzK1g+17TxcfK3iKZU
         8t+w==
X-Forwarded-Encrypted: i=1; AJvYcCVSoGSH+x2iEV+/kKc5Hv4PpJ7McKuCwhU9PkFLUmN9TRMvQSa2ATDTvwNTqlEP0C5A0eAfCLjWhADnZ80=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUK+LahH+d6eS1F6kZfbHD4itT9bG6c4uw83OwIbjKK7i6RUqc
	hXDTrFP+9AAhU9z5JHZ8DOFyb49b3PFV4SW7pbFTgbvq6dZn3g/oIW4V4j4HbxE=
X-Gm-Gg: ASbGncs1KiTc8bx/BZlkDi9TnSdm8bRxQrXfuwYE0EAYQfuF2/WKxrzjM85NQ5smraw
	H3MqPE1vvCslPC1uR6mArZIYSoqcpXccVJnn8QVLqO4/TEWD6XdfkF7zIZ43Fqz0VeUW6RaWQob
	7Y5JJ91Ue7jVJ21W5chS/IPRpBCHVrw25UD0JoUOb6YioJlCC/HEWwij3nXhFtsSBO4w9hzWZBu
	bHmB+0vsLI5SeW2cPR3fiEkaPQi/FP3vW9Fe3BwbiXOTLDqyJ3Noax9TxGWVkNzEgSivMd5+QlI
	ZVRVWgBsUzLmDGwtliZvFv/PodJpEXo4J2CVsFVHaNqyPw==
X-Google-Smtp-Source: AGHT+IGQa6VYeWqqBTxj6y7PlQMkElGotH4Th/ZzP0eMaB+7v7hp4x7EvVajjz8OyBown1N1qO/VMQ==
X-Received: by 2002:a05:600c:c87:b0:43d:abd:ad0e with SMTP id 5b1f17b1804b1-43f4aafa03amr1252175e9.18.1744452935145;
        Sat, 12 Apr 2025 03:15:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eae9640e3sm4735171f8f.12.2025.04.12.03.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 03:15:34 -0700 (PDT)
Date: Sat, 12 Apr 2025 13:15:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Koichiro Den <koichiro.den@canonical.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] gpio: aggregator: Fix leak in gpio_aggregator_parse()
Message-ID: <e023bfe52509ce1bef6209ec7c47e99279c551dd.1744452787.git.dan.carpenter@linaro.org>
References: <cover.1744452787.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1744452787.git.dan.carpenter@linaro.org>

Call gpio_aggregator_free_lines() before returning on this error path.

Fixes: 83c8e3df642f ("gpio: aggregator: expose aggregator created via legacy sysfs to configfs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpio/gpio-aggregator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 071d76dbfcec..6f941db02c04 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -1101,7 +1101,7 @@ static int gpio_aggregator_parse(struct gpio_aggregator *aggr)
 		error = bitmap_parselist(offsets, bitmap, AGGREGATOR_MAX_GPIOS);
 		if (error) {
 			pr_err("Cannot parse %s: %d\n", offsets, error);
-			return error;
+			goto err;
 		}
 
 		for_each_set_bit(i, bitmap, AGGREGATOR_MAX_GPIOS) {
-- 
2.47.2

