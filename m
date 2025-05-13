Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C219F1A38E1
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747152933; cv=none; b=X1hPYfZXk4rATxvNG1wzZxryuJi5iePyF4/yZDuRV2gD4NdtFTE6MmBynrnYP6+gjkOL8W3qW919HEKujW654pgU5Ug1s4UhAlJ2nCtf8A37d/ZTIMKmEIFFQIKrxyq4Hdrwk4rOkM8kAx3Et9r5IXm4vbyMZbPFVVKr08fnWqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747152933; c=relaxed/simple;
	bh=ah8bSLd4n3ODXUTmfJPUlD1MUWxxPKMMuTRnrZTBgGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hj4tCUtHbWeqcASQ87diIRVYUk4dqBuE358quh+IBqshgxsrAxU0B+Ezbqhnd5ni/FzmNTfEQ4CpPBvbtRtT/4t457YNbRpyizJCJARrQTikAkoEfyir5eqvMDUWIGGPSyZoKImjScMQuhIltFtyUEd+idUUMDtiTxLZG6wqsDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HJRoMkvT; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HJRoMkvT"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-440685d6afcso64661375e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747152930; x=1747757730; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=23030sfZlYo4XXUwpy8Xijq/xitTfF3FnawkIR2T3C4=;
        b=HJRoMkvTtQHjsElk2TAMtlFlJNdjPGTCz4iQrGnuJpk1/s3NOnVI1PWY+gnrsHtd8Z
         K1uC/5R59GHINynvDzJm+f7ZGrPkocFjCVUHOaTB224XpVLDmqcnVeXC2P/j1AANfqkZ
         DoIfVobpsz9EwGOgDDehFRuukgiQgUEBaqPOH/XPrMX/ANapTgkr4gS6nGr8HyblXaAn
         G+CpqspSsywpgQM3KkYjw+motAh5ADrMajz9lthoMkP0dEHOFvpSOfr0CkeVvepevtP8
         +d2Gp2ht4jIEnrhR7RddERPBn54OfN8V3I1bKQRqyC3PEjZkFeJ5iLhY7PkXlPDCgZPR
         AGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747152930; x=1747757730;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=23030sfZlYo4XXUwpy8Xijq/xitTfF3FnawkIR2T3C4=;
        b=c7lF1hqFWVc632bFZIWKOj49djmtFrF/GCsFsSLL/JYptlBFmZ/w+m2DWqhnDA9ojU
         GP1b8nsa08g9ia8B/m9Ix6DwENwt897pOhOMIqutq6EMP/mK5B1KyXY8XxXWCUiK/o7Q
         hrtL9/b/re3xmDKU/G67iJQQfbeS3cFPuF7KLBFd0hqhVOaly1O5P3pN5cEIC/c6XSz1
         pnKMZXRHQnoRrSCdKYWMY9+OHBiOXdjDpGKLS5ucuilg98YvSNbmw8Y6Wa6bqqaVwtK+
         /6Ky4yMoCMbA0qtUdVDTVxH3Ph/npKKSelLs3KONwQpO99kpt5X+1Z5aDblimZcOMqir
         sHjw==
X-Forwarded-Encrypted: i=1; AJvYcCVje4KXmQv+gar+wsmctof2C8Iq31iEb8Q269lqccntFErEj0Hif63hVqiU8DmtbcIuktAybnNNK9yfY3c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0rmDmjHjXKCw/XbHnWNAw2sPssiKpLVJV2stJ/ESUS+9CZGNp
	SlR+TrOa1ke+vutDZoIzzBiu/aH1gSCipkLzz1oBD3FGsMC3eybemolTlwRRg3Q=
X-Gm-Gg: ASbGncsbgxMdcEsruy16HFyV2+WyS1QqJsxWueQHedGJ+0b0PTpO+xcPmTITWcwiNRW
	9dWZ/BWXNe2qEvEbjkaFG2je8Pj9+eXcK2N5CBH8BosKnWhepH3CNf5gx27W445sJK5Ni1TJaqh
	DI1uprKbKyHpZDsymmCYD7WNbUmE+ORSv9g9vVIVbv1p3A5bQxhWKqe1Opc7/htsu5j90QuN1bH
	urSMPvFnGMcVX3KknVUI0cTmbDD72srQfGqWz018ysdrjjdo+0jbfTklEM1OxTFXqsnvBT769ee
	9AUhCnsg4lsJM4o9cQmk/4pdxGz+iaoydiNVHZr0eVD+Ym8Bh2jct8U9jz3FgKyNtEA+m2XBaWc
	nzI+meumzBh+6gw==
X-Google-Smtp-Source: AGHT+IE517qaNT/l4Wh33p0Dm3gFH8OKngeQCf2Udv2lzkZQNwRj+tloE1Jj35HueH2x5ewGA4LEHA==
X-Received: by 2002:a05:600c:37cd:b0:43d:fa59:be38 with SMTP id 5b1f17b1804b1-442d6ddf676mr135234745e9.32.1747152929962;
        Tue, 13 May 2025 09:15:29 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d6858566sm171835295e9.32.2025.05.13.09.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 09:15:29 -0700 (PDT)
Date: Tue, 13 May 2025 18:15:27 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: thermal: Add support for Airoha
 EN7581 thermal sensor
Message-ID: <aCNwHzqD0wC4yMUN@mai.linaro.org>
References: <20250511185003.3754495-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250511185003.3754495-1-ansuelsmth@gmail.com>

On Sun, May 11, 2025 at 08:49:54PM +0200, Christian Marangi wrote:
> Add support for Airoha EN7581 thermal sensor and monitor. This is a
> simple sensor for the CPU or SoC Package that provide thermal sensor and
> trip point for hot low and critical condition to fire interrupt and
> react on the abnormal state.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied, thanks!

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
