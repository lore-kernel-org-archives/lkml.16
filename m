Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F5A192B7D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750316822; cv=none; b=TDWGn/tqKyxni42V3lSHImKyLn9TPJ7pkeP502k8KaCJfPhWVEVLOpm7x+Mb544JRd31oPGewulGY5eanDzpV+PEmJt7v+5nMXfRr/oLD8z+37qOiSV2yFk930Ytj6UhzRyZLDC+N4tvO/1PR+i/rhU5kWodRENqEQLC+ef1Eik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750316822; c=relaxed/simple;
	bh=gIrndrxqEQYIbQKwOcS4Mln3+RBHF7hskkcp5VOAKaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IxtVhMWiUpnBwU3DjsU/2MIBmTRq/mVbx9fny66Xmsv5hCYmF5M/CdHDFUqyUwSJd/rFE2t5cEu49kqvaEbJ90M7eWdg43MIaMS7aKDs/t5NzQryx7p4T/4wQWp1lWNOVoNbWFP1p3VVxdSQNw8bbP96RKUsDJ4vDRWlViwhGow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jITB6Yxw; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jITB6Yxw"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3137c20213cso390816a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 00:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750316821; x=1750921621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IymuwWFz5efXWH2kgyyNSxlRPSBhBIlq8B6srm/Era0=;
        b=jITB6YxwNdiziytTZMmOunSrMJYwnfFJlf59FgIG1M1zfjzHw1YCXXr1cL3RxvSt9g
         pPfWHXi/GNu71l2fiKMDAD72d9CJ3Y9UoIV/RsDOorBaVU3gOBolh+p8n5rfDQRzibJ7
         TwTnQKtw0DDJmlBWvmz0kjxdyTtr26oBtIGcjGMdiAxz8IY+WfbJ7QJTYsG1DRpmxAvm
         06Rh09Bq0BurbrmGwM0b0/oKXjAsZuiyEg9rXqfaE+LlAFBq9JT6ZH8aHeIlg+yxjH4X
         uFpnAKJ9eCSPTjVWwOg/a8LLN7UT89MEkyFa3m6rQgjEWpV2uqHy1QcfXVeWOXZ+3zx2
         Og4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750316821; x=1750921621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IymuwWFz5efXWH2kgyyNSxlRPSBhBIlq8B6srm/Era0=;
        b=d0oR+zlEAQDa61Jc+MODcRBOoHE2byq62nhg28uynk9Yl6/yGURQYBKzoaf9wqIYLJ
         Vpr5OMed7dhGXdvKD+Imky7gpO+MqvsesJrdGMko0vbG7m3Ajsywh5g8P+wGz6jhmAFK
         AS+f6c0InXAhGXOr0gvXH6QKi6kVM1EU6ba1Pal9EbX7jn/lUHByqoU8NF15n9VvIokr
         ubxAUG32zaNXgnXUrODiOVOnhHr5X2TdAz1sWg3jWrvcR1fVI+6vuudMDYQG6y9w7R4d
         PMmuZLuqnHqDJSe0Pka+WXYb9nrBywlfAA359gxL67octohdAvC1MlO1OeejBFQUhMUQ
         hrLw==
X-Forwarded-Encrypted: i=1; AJvYcCVtaRygPGrINo4RsGtFk6T9664V7KPYnxIXhE/VgPNTQx1Q78ZaRv9Y6/l4lainIzOD0CpjDu+JplTdaJs=@vger.kernel.org
X-Gm-Message-State: AOJu0YypQHHoALapGTloH2VwWYeJoqncosULQI/HzX4Ej6GEVLxY0Nss
	vgpwOdCU3aZcXZbWx00QH0lvsQLi6OarPVFulZ5BD6Wf5cyIbhfW867vjm97bkPXjLM=
X-Gm-Gg: ASbGnctqMhIbviM+k1C+p03TXIkoF3wXikWf/9FyKv1qOpN3cQNancfZubl179TsaFp
	rOaYU+AK6sNtkgxO1DhnKSVCU13z+aSwJO6Sg4UJ3jMqiArdbxRFfbIyqcqOs+Fi7jhabfVF7j5
	YeEku4o1iruemuF6cYIK8b6VEe0Pf5xW2ORKX3rGPcnlkAK3gBo0GgDx6+3MoqRj+tmAj5ZG1Ji
	Bx7tYRRmLXVMu9eFmZAFRf4TeuWv7pSD/f/2ReHuzIGAiIMaN+2zvarnvI+H0HtLGS/qYQh6ULB
	MSn3jOo+06t1Qn8ArqS1jA2Lt6idZShwL8vZtPn0XAuC7QxYokkAEYYAoXm7kP8=
X-Google-Smtp-Source: AGHT+IGyYaOKIL36CbVXP5wK2R0Ni0YKSM2IJpGDucT9Et2S+y0DrU3AlyTGX8LLr5798o70TnJH/A==
X-Received: by 2002:a17:90b:380c:b0:311:baa0:89ce with SMTP id 98e67ed59e1d1-313f1c06bf5mr36604358a91.12.1750316820675;
        Thu, 19 Jun 2025 00:07:00 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a23e627sm1365892a91.18.2025.06.19.00.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 00:07:00 -0700 (PDT)
Date: Thu, 19 Jun 2025 12:36:57 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Markus Mayer <mmayer@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: brcmstb-avs: Fully open-code compatible for
 grepping
Message-ID: <20250619070657.dshqwhulzadxpyz3@vireshk-i7>
References: <20250613071643.46754-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613071643.46754-2-krzysztof.kozlowski@linaro.org>

On 13-06-25, 09:16, Krzysztof Kozlowski wrote:
> It is very useful to find driver implementing compatibles with `git grep
> compatible`, so driver should not use defines for that string, even if
> this means string will be effectively duplicated.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/cpufreq/brcmstb-avs-cpufreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied. Thanks.

-- 
viresh
