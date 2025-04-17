Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CC835948
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 20:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744923204; cv=none; b=mw2/+LPqijqzNDqhV+cJjUJraNcAuOQ44jNLR+MXrVTYQMPbRIWlydXk9TP99tthtxHR8wrtRNkUH6COmisgFLmPaRJHwfFxDKNciqb5bqVkfAmz1UozxVzWAjgTODLC8YKpezhSv219sZJsQdv/Itk5qrGFBHz1+iGgTcLs+38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744923204; c=relaxed/simple;
	bh=dU4K8w2iZUqK1qEwcjzFKZf95JgMH503fYGue1h04/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ufROpsaZLX4aWa5Ly07DbcXNCZ02QIyn6UUBD85q6+k5VdkZVsdY1QN96MtkcxQ28aEfxpkGYoA5BH/OsoM3UID9Zm8ciQom5ZAds2tP9k0pj21n9mTUgU9Ry7GbRnW9w6Yllk4x3BM5WmhQ2VQJrMrZdBXkz/APLVN8D34wvp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ATBPhGaE; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ATBPhGaE"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4394a823036so4098685e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 13:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744923200; x=1745528000; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xDbB859dSDSfvEjPhjet4jsYsLjTq5f/3IKKPbQbhjc=;
        b=ATBPhGaE921YD+OxmrFJAIF5q1jNXPA8c9QQKqWjM8UOprf7i31rmipI1ohg64JvSL
         XfACDbNayyuzU+bKe0YDOjMbSTch7sMf9bK1pS5vdpcRUfT0bD5F0hoZXvi8qpfY4FNp
         7YjE0Se4qINVirmd0RPalDjWOQHDA6k1ZrxrNCHsr/SGWMINDiaVJTBW8XrA7Hk3l5zZ
         3yrc0k0FIvKuGx3DOYffGqu1FBu+Bk1dHvAgfnH7g6yH28SKJ7Cv5SpLKte1Pm6hqPqd
         VuJsyL6FVVwQQOGIsr29MrvrAwa8paM7xZHJswJpapmOIjcU25Sjd75vRzxIGRPeh1Fj
         /4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744923200; x=1745528000;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xDbB859dSDSfvEjPhjet4jsYsLjTq5f/3IKKPbQbhjc=;
        b=v1UNY/Vq0HiPKu+OzWFuKScsQ1CGCjWh1QcKBp2hgpO8fR8sRGRjZpxHK08c8dNUUb
         mEDlQuRT7GQmyP5tc4yd3zMZQiNdiMlAUDFWBA+XE90JeSpXxSWy98FZVbJm7o0YhdTm
         9i9PPAXhOWRQIh/PXLBFsEkiX4pneIm3vuXH8Hqsf1Kk2e0qi5pvze6G5ZvMHtbSLV8i
         5QhbC575T8t2Bqzhnf0A4dT023PHFBUQDIpU0S5DhG5pS47u1M5vulCenf9mj0nHPApv
         rqlbMLiPrxcVcUw1qlCBbZYyA8gZCzFQ5eksf4ug/tC+V6kDU10Rtk1Ne5sK44mQMsSW
         AAng==
X-Forwarded-Encrypted: i=1; AJvYcCXBqHrDz1utoB7kvctRvQUhURy0YN1qMSml8sm5tGiSqGQ3TbcpLojSTvoVlMiQ5pc75St/Obm+vLIulms=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUK5J6r9k24uk2dUR6RBsSmE7A4WJN0UQrEbYfjxpCPDFNrCQu
	3kr9y3Yb/OaBDcXrrvcs2GV2n0xsgwyCuALgE/fKR9cT3xEFD9qmcgfRIDFJ5Zo=
X-Gm-Gg: ASbGncte3TIm5BuuB5KoJsdwhLK8Ba4mTD5zksUMdmZzHWSTA/LxHoEfrhpxbtXIHVB
	TocHBeJ2XpJIURHA2MSBr5a1rn7QO+ntm6skqg3CynmqHbPFQ1rqt+eJeDcwykAtcCxSke+3Dtj
	2ePH28x8xVJzt0b/FA4S20+hFdPTATUQNKMl4cm7Op4Bk3nms7JkjsZl+1VVuXO6yNVDwuDVl06
	dhsJt5W90cgr0n063905j7OozwdLQ3tpZa5y0ZcS7cj1DEbLOGc7foYLNqnJHyfq1mAa6g8bTNn
	5AmwC0qwRJEw8CoO5byitRid8rsoNSyZinpp5RIJogS2uo77zm13FvA1Hz9eY403kAbke/sNLHg
	maT8=
X-Google-Smtp-Source: AGHT+IE/Yp64SirhNGNelGiWpri0X2Q09E00vtNFhQsoUcfIVJFu1JQsSDwG5YgCWmsxIzILvvYqcA==
X-Received: by 2002:a05:600c:b94:b0:43d:fa59:af98 with SMTP id 5b1f17b1804b1-4406ac65474mr2651105e9.33.1744923200468;
        Thu, 17 Apr 2025 13:53:20 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406abb640bsm3339605e9.2.2025.04.17.13.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 13:53:19 -0700 (PDT)
Date: Thu, 17 Apr 2025 22:53:18 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thermal: hisi: Do not enable by default during compile
 testing
Message-ID: <aAFqPuFBfGEKFb-D@mai.linaro.org>
References: <20250417074638.81329-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250417074638.81329-1-krzysztof.kozlowski@linaro.org>

On Thu, Apr 17, 2025 at 09:46:37AM +0200, Krzysztof Kozlowski wrote:
> Enabling the compile test should not cause automatic enabling of all
> drivers, but only allow to choose to compile them.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

Applied, thanks


-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
