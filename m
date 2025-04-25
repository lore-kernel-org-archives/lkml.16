Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CC522ACF7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745574187; cv=none; b=UIA1uICH74vFv1pmBKfynYe7Ams0rOpje5+STpAGsh67Iabs18A732rFx/weDkAdz6IZzr7OsI1LTyim6rYvZvP6QR1a+XR4H/iR+4I2Kctt/eqDJz1Hd8r9pzy9lorBLnyKCl3fKFnbyEJ2s4wSsApWfzNhZkvmkvs+kbda1Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745574187; c=relaxed/simple;
	bh=HR1ELbXjB62zE6Sff0xpFGFrP2hzDkcrivmHZuYivdI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PCt2UQISstbPQQ2VzQKJWdLPAHDhw8Gi2yYoNuf/8LB3OBjpNTSzf3APj6ChhcFCDRNwHwvSLk3AQOyq9IjfBJ4mjFRM1/UTxRGLctJL3e/ZTfDUark8hAHLPN6cv7nZwYYJUpIkcFpYIqUGLSjnTJ4kp6rJlK405xj0gCr6BO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WZ3w28sy; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WZ3w28sy"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43eeb4e09b5so2198375e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745574183; x=1746178983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDp105elx3apeSKKADmSSqdqJbinr0IUn9mnqQkF98s=;
        b=WZ3w28sy5uDk84L0Jj5N7p1QwFcp9T2ivniA9tGfNHNj1ytyKngak+qP5I49bYxwt4
         AC0C+BCXKIB5zp2fHs555x5RpbA6AWkBqu1DHFAHbjuptavuTtrHIsTmz0RhcQBidIhP
         YGXdx+2MAdGkW8LmMKr3DUrfgqdWiIgPDX6D4KsMR8y469/03+VRSwv9mFjBC0H7v2vZ
         am/7IJNfNlIQi0OxQRXYBIgRmOnrZmwg5+x+d4hl7y3mDOtsGBk2MIq5/AfFZfmtel7f
         RlgLmdNR91I2GBrxe4zUWFSE9QZAnRr+eFaav4P8WIHai7TAlua12ie9xeYrPK+e2MQq
         ZvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745574183; x=1746178983;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDp105elx3apeSKKADmSSqdqJbinr0IUn9mnqQkF98s=;
        b=ixoWVPBQ2auXXUAm6Q5zYimYTT9HeGxheK4yJVUHqcLnO7RAggb+4/miLSJM+DihbQ
         nrVAdPX2VujsmerpK04A62PHxmN25I0k8DkmT35rqaM/3KNA3UCpiA9m3a6/27lQngre
         e7keQgIw/TAwzQRDF9Zn88ovIXhX5yTEs2MJv9j23/i8F/fBMquu/bUALLCC1TmF0Cfd
         wi96f//NgXpsF6aMTFFXdGaEstLXNhM3Wp01CygBXpJJkE7w06bDlTz95Jj8qOwOJEwg
         csW0BQVKM8S5nD/V9Bg/m8Cg0DAVAdRlE9IlX/imPEKuapDJRfVtsdoc+jNCcLGuQtcy
         KZWw==
X-Forwarded-Encrypted: i=1; AJvYcCWeuzyB00klUUmszBmKimMcoA9/+u5+6EKNH7z7GUQzfLeWkji0vkWQ+1BUX++MdIlkZZs0N1UxYT5/Xcw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgj3pqzc9eeTs0nMIR1LdV8QUD6yv5hI1YnuMsKXQZbFIf/tjj
	exC0e9PlcjuTy24a77mBQ3O/VoK/AQj74+AmC69f5H68EYw5pK9DYD+UQCfU2Ew=
X-Gm-Gg: ASbGncvUfZwYqCtNzqhULPdHBPxCUciKmD6Gl9F/gRGXBvpWHTfRH/djoeV3/Atbrpg
	6xTouPAdi/mOEhPY15Q7TZhiQI0dAEyWKBZvb4fxMP/o9deZYFogQGvb9NKHBW/YJv15fqMP8OH
	oxwbm33pN0+86OmcP/k4tXE9ckiM7JeFNwgD/IribOb32OT4EPW/CzROrEaR7oDjTuQ0SlEBrUi
	IuzQJjhYsoTcPbC/XqBJynceWVpLhCtcFuO9qn4NIOw3dcGFtmBfv43iHnFZh2K+OAom6KKZ8Ny
	3P7Xy6+AbUuzPYBzImwYK20c3OeybNjrZrdwpOFYg1zMSBavMRfWu8J2cEw=
X-Google-Smtp-Source: AGHT+IESpUAhFZOOS82e4GvGIHokl7WEd11AkZbPGij323CqMMkH0yOxQl4M55ja81NtzkvTeEUUHg==
X-Received: by 2002:a05:600c:1d01:b0:43d:fa5e:50e6 with SMTP id 5b1f17b1804b1-440a66c250dmr4935225e9.9.1745574183356;
        Fri, 25 Apr 2025 02:43:03 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8909sm19441395e9.2.2025.04.25.02.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:43:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: kernel test robot <lkp@intel.com>
In-Reply-To: <20250424203308.402168-2-krzysztof.kozlowski@linaro.org>
References: <20250424203308.402168-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] firmware: exynos-acpm: Correct kerneldoc and use
 typical np argument name
Message-Id: <174557418225.69534.7174672611109460880.b4-ty@linaro.org>
Date: Fri, 25 Apr 2025 11:43:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 24 Apr 2025 22:33:09 +0200, Krzysztof Kozlowski wrote:
> Correct kerneldoc warnings after commit a8dc26a0ec43 ("firmware:
> exynos-acpm: introduce devm_acpm_get_by_node()") changed the function
> prototype:
> 
>   exynos-acpm.c:672: warning: Function parameter or struct member 'acpm_np' not described in 'acpm_get_by_node'
>   exynos-acpm.c:672: warning: expecting prototype for acpm_get_by_phandle(). Prototype was for acpm_get_by_node() instead
> 
> [...]

Applied, thanks!

[1/1] firmware: exynos-acpm: Correct kerneldoc and use typical np argument name
      https://git.kernel.org/krzk/linux/c/2c2e5e908ea2b53aa0d21fbfe4d1dab527a7703e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

