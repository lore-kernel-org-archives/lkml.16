Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D438328ECDA
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 11:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746788668; cv=none; b=pMfAN+suv3l7fX5DsXKutKB7RQlnPIAjxeE+yq+X61yv5z4tYCroi7ALeqgMVirepievCMq92CmCE8Q19zbOli4sLF9d8uVSHYM2mNLqdbgJ2GA99IwP7gHW+HABvu0fMFgf98cF1noVbKLFhlKTEEcrqwzjqyzpfWToTW41o5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746788668; c=relaxed/simple;
	bh=yM95fF0Jei5vqJ3/y+feByrpKShwlWgTmgWBG472VeA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GycYbDtW7WGFuf75StQb+IL+KpoBqFbZjD++eLKacpiQGjSt/M/n2jLw3R94/3l6b/qVuIxAQ46Ab93IQ5KWv7LyzUceFYvNrd/F94gKY100NOadJvzyCaQiswNGCMdFiHq9Wi0LWeJYmDNOCIimUnG90ZAEejIkV/wCpoEtyfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pTCbSaGJ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pTCbSaGJ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so21663095e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 04:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788665; x=1747393465; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3yJCNV9ygDRNtqgzkE30hTda74O4Y8KfcrRRQ3zGk4A=;
        b=pTCbSaGJald0fZjq9+mR0EflJWr6J8mo3SnzchHKAdSYPUHnhtnPw3eyRup5IPrzQz
         7lifPq0ExbqV773l/3bjCkvvuW4jNRWLv8tjBMjapZKNdEUeiv6mLWLU247keMzQKj0A
         LeTWtNEnAqqwul1/+PzZqN7S6EVYr/NPJkN5NkwyqgbwmEcUON0QzQiTOVy4V3NwKiZo
         rrn82lCKtaKYYWU/WPCWnBpWh8SuZB5gOOcRfaElty+68A1upvKZwy6BswSwce4hHo7p
         Nz0Cx+s0hDHK5KVTRXl8eIFQ84HOogfhZApbHnBfMB3LI1+dGhhoL6MkLGLa4gh45XQE
         I3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788665; x=1747393465;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3yJCNV9ygDRNtqgzkE30hTda74O4Y8KfcrRRQ3zGk4A=;
        b=LZOPtSQKjjccQ11NisIlxp/zsK8h/yKl4cKDnc1NlY6KhUIKr4d483t36fT3dkmN98
         m7GCndPm50AKTAw10UM4qWmczrXP89jeLNRf85guOdbTRs/KedrHB53G3yQKbrCOCOx8
         +lGJLYWz8I3pT2SFM/+vjpsPMvh6fqd4IaSUjFg3fmk9y4U2l9kF8aXomDTWXNi8oNYx
         j30yDretXcMAZdNIcTjkDQkuzw0FtU36YSQag2djH2g+EYd6KdXarsa/i1d7AnIH9Ini
         p6h1kr2Z8aP6aAzxRQ7WxbSDYqRh0xVT+nKY8/7wUwdCWA5FTxTJi98mTqdzfAyXdBKI
         UUvg==
X-Forwarded-Encrypted: i=1; AJvYcCWN2IBh1OE7wQ3L/7KShcfIP2b3iaER11wWNYpTyV/S1vHa9GbzFgKwa80fwJkVn4Y7S+1WUJhmuvo0vCw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcIvpGjf0/owZAbObDo5E9JHZ6gE9OlhCYK6HfYkilh18B6OOn
	JQ5JPIvQU7pxk+H5OZE+dRa8uwZ9GLwvRyOzpTo88N6zoqMWZIB6LGIQytOutZjxW00WHCUvU+u
	7
X-Gm-Gg: ASbGncu9Aew6sjob7yPGVGO3EoQ6/msanb1eI31t6+JQHBzzjlXjIdaSewTn3mi7MYx
	yeIhtSFFWi9gFGsRy6D1oL+3AwQkj3TpUQ+B7aJ7nyb4imcUMzhY1eGBYyYZQ8KfVJpqU2KRmIU
	aHUNAmSqgDF2G/4CpV1+Km8GKmS3/1l3OgRJzdewVKQ+qhPtqg+iCtQuuOvhcpX/QfE0Uiztvkk
	rLg38w9vrnPgNBDfZSB1kPrsoN6y9q3v1lDVDmR66yZCAlROZJpWouhbTRNOrh2YIhMP/uHyIXM
	zHq32NlmAR7zDvz+aElUco/lK+RAJ8GyRzMFzABq/pbl/w==
X-Google-Smtp-Source: AGHT+IFw8W+AkGKpeFKjDzyDOm27ntxoNpUsFE65aEkWAInoVy+JgWVEmUmGVOr2GtLsFyJO7gfMIQ==
X-Received: by 2002:a05:600c:8205:b0:43b:c857:e9d7 with SMTP id 5b1f17b1804b1-442d6d98a88mr23417245e9.5.1746788663606;
        Fri, 09 May 2025 04:04:23 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442d68585d1sm25970195e9.31.2025.05.09.04.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:04:23 -0700 (PDT)
Date: Fri, 9 May 2025 14:04:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Kerello <christophe.kerello@foss.st.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 0/2] memory: stm32_omm: Fix error handling bugs
Message-ID: <cover.1746781081.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

These are a couple bugs which were detected using the Smatch static
checker.

Dan Carpenter (2):
  memory: stm32_omm: Fix error handling in stm32_omm_configure()
  memory: stm32_omm: Fix NULL vs IS_ERR() check in probe()

 drivers/memory/stm32_omm.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

-- 
2.47.2

