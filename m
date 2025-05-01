Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028BF2DC781
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 10:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746096903; cv=none; b=UV3YunJWXSCBJ3KNMnDLb/KsBV4MDT9G7L9+oaY8U1zdLFyH6VqXlNOecG089lYrpPy5PSrTwROw12mSQbxTNwPJxjmQeafFSsLXptmN2ccRedxfHjHZNu6RjFjXNHTtekX6EmNhRxD6gsxXik33uFwrpHx+yV79khKRvreCvyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746096903; c=relaxed/simple;
	bh=tNe3DaboEpV7Qmd1esrn3cNosezaUluTbEZh7A5lnsY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=UxLSN2fKsmYMNb5lVN9zOlpO/AXcGP1K03mrRRIYyWJFxNPWNtcXEZNMzEq/nuaJUuS/o1W7AWurLxq8KnJ07kjVvP7COKWHK0MUD03oGvY2fYgtujOKCamHOrg7ytEP4CG5nhD0rJhZtWOWkOF5ozy3RDKDjSMl4zJj9vlSgSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C4yzvgXA; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C4yzvgXA"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso4002555e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 03:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746096900; x=1746701700; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b3TEajX3ol7WpjQM7Bs02XMYqvu3P30s/EI/WZ6xncs=;
        b=C4yzvgXArvaZAg+CbdE8sGBWfwNczYLhYe11SYNDS0r48ceiI4mv+oyeXD+h+LotFK
         ouQ5aoT3oTxfckimIIlVfXT4mfg7+nzc7tQgSxAjVugUIfd6OsyLtQfyDjPkqT8PgndA
         xx5hkfo7/Pr+Wi4X8gs7p0XOEi9UycP5cLq8P5n1AWvy192O0wxvgTloO5CVDtWRPIBh
         JmrCfK5bPOrFjDnB9ysn8k1A/vXloXUxNWEG+ZNXzgPnGKPJqBWUtdHPBN5tsV99rvOP
         7R9Mt0vNkNkWIHFzTgO1mehKk8/0NT5PDJtI8elLPNcaGZH5mLUYbtCbxegVvSucI+SC
         llcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746096900; x=1746701700;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b3TEajX3ol7WpjQM7Bs02XMYqvu3P30s/EI/WZ6xncs=;
        b=YETdMTkReWATgm95Myg7irixnuLTobhseWsqqihIxqGESdhKd0Q939C4lvMHRClOoA
         vtLdo7jly48+yIX+uVMF8HNtokDhaKYJdlHTQ6RzvdRZ0+d0FQ3UElnlxLyXq4YthMwk
         2qN4mX2L7SKfiIr0i7NsD4QGIu0YTmpFExlmQJ3r2v4+PS9DD6UiIUcA/RcH8Nd1lmA4
         SdAl0O16C8tC6GmwhMaGRjNoyiJWvZkH5btR1kzPzZrKzhxRD/kzgppKHd9hMcdsDYOf
         Ug/6wOS0Xu1e9VDspG73sntg60MA7RGtE3LHEu5k7ZXvKlROs7paIkTddXZfkT5KkblH
         ncsA==
X-Forwarded-Encrypted: i=1; AJvYcCUaTuNmessFeCpudJngJwJyx594stcnXe47DpgUC52xM+Z6BCRvKf2z0tkdsHIzHyO+v0O6FX5I08vA+9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz53G0mYPIvw32BiXMfQFxaJUQF74TzuyMVsfUgCMp0KfzLOpib
	3LyOvYhPavZ9AQ6/z6qNZqKGElKrDMiZnyYaNiwEMy8jtGIq1b/XbY1F7KQ0WMo=
X-Gm-Gg: ASbGncu1qrbWAHexPDUzcevkg5DkNOD0IYruUuCSKIBExq9MXNj+XtS0al2sF4EqlKm
	j22xlCTd/HRojXi6TwRy3C3K4q0apCipUDhr10kkE3MbZghr5gaOdj4WUBMY6HEEn3Y+QEn1HVl
	zKKUL/w0FnIxDDjP6nEBFLJi3ZvQmd/BOYVMjK+6dJ7hNU/AQJopnYQPxRkU6X0peM0WUZ18Y44
	b7T/pa/6sMygbm7j3dQtVFCV/dJE5QiuJqsuUDLnTz5cl/ADc5rKPmXapG7Wj/kM0XLLxujPyly
	E+lU0wQElwK0A3moTeWJXbGiXnvzd8aw6fEfWDHusC8=
X-Google-Smtp-Source: AGHT+IEHpDCwTkBvG4KAXQYb/Pg+aRPSsJLfMls67U2P6l6YA0MQUP8uc2z5KlrWDlDqTkEd5taFng==
X-Received: by 2002:a05:600c:3b03:b0:43c:f332:703a with SMTP id 5b1f17b1804b1-441b2696c9fmr65103385e9.31.1746096900318;
        Thu, 01 May 2025 03:55:00 -0700 (PDT)
Received: from [192.168.1.3] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a882c0sm525040f8f.79.2025.05.01.03.54.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 03:54:59 -0700 (PDT)
Message-ID: <16bf2a1e-2a98-41b3-b780-c0215db5a6dc@linaro.org>
Date: Thu, 1 May 2025 11:54:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: etm4x: Remove redundant claim register setting
To: Leo Yan <leo.yan@arm.com>
References: <20250501104216.2375126-1-leo.yan@arm.com>
Content-Language: en-US
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250501104216.2375126-1-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01/05/2025 11:42 am, Leo Yan wrote:
> The claim register is set twice in the restore flow; remove the
> duplicate operation.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 5c20ed4cf4ed..228317991ec2 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1958,8 +1958,6 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
>   	if (drvdata->numvmidc > 4)
>   		etm4x_relaxed_write32(csa, state->trcvmidcctlr0, TRCVMIDCCTLR1);
>   
> -	etm4x_relaxed_write32(csa, state->trcclaimset, TRCCLAIMSET);
> -
>   	if (!drvdata->skip_power_up)
>   		etm4x_relaxed_write32(csa, state->trcpdcr, TRCPDCR);
>   

Reviewed-by: James Clark <james.clark@linaro.org>

Semi-related to this patch but probably not worth fixing: There's 
technically a race condition with an external debugger here. It would be 
better to use coresight_claim_device_unlocked() and report the error 
that's returned instead of manually writing to the whole claim register 
without checking it before and after like the claim function does.


