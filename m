Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7A91B392B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745478259; cv=none; b=GDBMZRZUznp4Uq8RRtkBY1Qi6gcYn5mnYu7JwMjM3GtDZPyiuX04iEIwFh1BlV6HMe7kIpk3JSp0UzUBBPkW0x97/slMIIHAN/bwJOiOp+dZd3p8PUYxTSxTu/iJlQThcoATaC/eCuE+xwMGPuRVnmIjTIMPucEdBPpUd1D2/us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745478259; c=relaxed/simple;
	bh=SvckNjKAAS7pT0RVb3J0/SrYkdOGfTe2ytVtg9wz3bw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ciGfl1lHnCvPOMpsrKUNxpy7zxHwkLAMwStagyihQx5xfFJBMS1nQ4Glz4RQeu5UIh9/lTal2y2R/nPIBA4CgGxGb6f2TT16Z5T8LiAluWGdNlrI+YzFWUlX3MtRDCZ0/G8ZJYjXVRxVuc7RLXher9Zwc2ovR7YOfgc0Cv5AXTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XgJUaZ3P; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XgJUaZ3P"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5bc066283so1167679a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 00:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745478254; x=1746083054; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D1iRaF8DEz7JFVtNCWSp0T0HzrBBP76McD5zA/V6IhY=;
        b=XgJUaZ3P2rJEUz2ZRkeP4ecUt6k3Vmz6VJNC8emBdPOfEwVU3CQEf5w40241IiY1dH
         biz6pY7EMA32SRpmFqI9JILY55qFBeJRMYoZxx1h3Qjx71hbOQEaaBNZyEdcLNoa95TB
         csBgH4lsGaZmi2udRjn1dbu0UlxFT0Z/Zzg1d+WN0pwgVtQA+PIIEZDWlO7vc1vo6tln
         3Qbm3uvlKRQm61Bjw1YF5qfCH/TKJ0kfjvgvNrqFSEULlwrcMG9YcYSuVAG7QscjPXnl
         SgyvqvlWGejsBlz/YwKYEv4y9eZurRAyv8GkfCbtTIs0CsI7uulJirZiiRfYRKQlwbVI
         mzNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745478254; x=1746083054;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1iRaF8DEz7JFVtNCWSp0T0HzrBBP76McD5zA/V6IhY=;
        b=MVQgqKl9cSW9YJ4IAG02cUwlkL2R3JgPODLqZMdkmFOqKKCk8ZKwDwpDapCuJRt4cy
         h/cI55qY4eviQS13HkOJrB2/c43qomZSjngedrmVg37pxXS6Tt7/iZ4Fn+MMn3kMhtlC
         BeQB6KmdVVNqtGsb2J+S1HxdjhDRWDZC4H95YBSdHcBy+8wmvO0RCmZyDA0DKJhF5a2x
         ngZqwriApWBa6FDfXxaU5uYquApnVxqrHbYla1tIBlKjHFfqqhPXZzZ6n1TaeX7DCu0B
         Or1Ltt0SxYCIAtx9Fz3PCfbQLoj5iKPdwJPbuw3yBxozHh7uObaV9JgfqAMKeEzRZIyN
         lPIg==
X-Forwarded-Encrypted: i=1; AJvYcCUaIFFm52vatiouKoyhNt9nI4gTGbI8orpyWt3sqZvxB+220iFu5hJhUfoGmE03U0xmfuXtDbma6TdXDMQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+PRSHwIc11YbWj1YLL8LPWXtL+mpamb+tU2mnRXlymgiSdXrH
	aZV/3SSiXievLKw8o9f0i3+FvcR/vL7Lb26S4pRj5+KVNhuIHij5/yhLMxwMPAw=
X-Gm-Gg: ASbGnctJZesNmGzaPBKQvA+LledWn9rVZnxUllBnaDBBItBvF9l73N2Aw0fOru4ElQm
	/uBcWQbWSrTBbD69PQktKZC5BZ6C+qEP1WnEpzzGav2YU2kEciJ4RvvnYcnOEpWKnxMcXXfgwgi
	APMhd/Bcx0paeOdsECT6GlwJRZOa8Q69Zuys/CM1WzbzHz66mO9Tr2jugE49E89oQuwEFeUJ7KM
	QSARxtVShTMmCaBfdUgQv4HGgzgX1tUfy1CFHx9iYrZRLlfgPQV6mJuWPlag57u8XZaOkQuS5t4
	OVbVlD0ggsPR7knHF/gK9agu5M780BfrE0R/BA==
X-Google-Smtp-Source: AGHT+IE/3mNCR4/4NZlHXiIHHU6zr3VRymMPMYgsCSGHm3hUjKJCoLnIAqlX7BK+6k+UO9+ZElCHuA==
X-Received: by 2002:a17:907:728d:b0:ac7:d0fe:e9e4 with SMTP id a640c23a62f3a-ace5725cefemr166986266b.19.1745478254508;
        Thu, 24 Apr 2025 00:04:14 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace5982cc9dsm59444366b.18.2025.04.24.00.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:04:13 -0700 (PDT)
Date: Thu, 24 Apr 2025 10:04:12 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Johan Hovold <johan+linaro@kernel.org>,
	Krishna Kurapati <quic_kriskura@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: qcom: use modern PM macros
Message-ID: <aAnibPAln1kS+KHO@linaro.org>
References: <20250423162613.2082417-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423162613.2082417-1-arnd@kernel.org>

On 25-04-23 18:26:09, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The use of the old SET_SYSTEM_SLEEP_PM_OPS/SET_RUNTIME_PM_OPS macros
> without __maybe_unused annotations causes warnings when build testing
> without CONFIG_PM:
> 
> drivers/usb/dwc3/dwc3-qcom.c:421:12: error: unused function 'dwc3_qcom_suspend' [-Werror,-Wunused-function]
>   421 | static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
>       |            ^~~~~~~~~~~~~~~~~
> drivers/usb/dwc3/dwc3-qcom.c:457:12: error: unused function 'dwc3_qcom_resume' [-Werror,-Wunused-function]
>   457 | static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
> 
> Change these to the modern SYSTEM_SLEEP_PM_OPS/RUNTIME_PM_OPS/pm_ptr
> macros, which avoids the warnings and improves readability at the same
> time.
> 
> Fixes: 1881a32fe14d ("usb: dwc3: qcom: Transition to flattened model")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
