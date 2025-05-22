Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D2318A6A9
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747938740; cv=none; b=gV9t4U77GCpI9Z5LmoGcDI30oqNadbxTz62AsJhiWlsrSjoRSe25IalubdVqxVb0xK6/qvhDEZaqibDlz3rVE7SnVhHuURqDorrnjCBLbdAJMOzUzt9Ome7i8Pyv16ChqLU8gs/D0YaCm55vmlzNVWhhmC0bjGvbA2AYYSXGJDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747938740; c=relaxed/simple;
	bh=utZbOKXUpsVCUiSXZg10bx3I+v3jj2dHl7w4DDwLeCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jt/glqsZXnw8QEs3/PTGrleRF49DusBDxNESlRHL7Ez3rUVbxY7o1XKmqdCjcASEGZ9VzXpjp+g9ZGRh3h5k9mMpt0t0zd23xEa/t0wS6pa6SWYtHhKK4xk93xR+kYKy3ulT4YIuWAdbG/w+ILuWsLwveZVHtPxSfhfLCeRNElU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gYlmNE34; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gYlmNE34"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a374754e03so333714f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747938736; x=1748543536; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rOYkb8ARNGoWzGK6NIRQbMqEIL4sIWgyEMwNFCwUiPs=;
        b=gYlmNE340Ewez03Nhl09xe1ud665Z2lUlD62HRlRK7vJoY/YN/2Mnh6ueSz9sPi7Sb
         5KtIwXMCbAZ/LX/665xTHJUJGwY9hV1bwF1IffoHvlLfKqTgfBdo0NhKSlGItoDwHTh/
         Vlq6RI1J7mLIsXuyRAoZOgSw4BtUpsxvnVbXNr7pooMW/Ejdg2f0nWC6BH45ZrQ/HiAe
         qcXRkwWj0zeDhlo9BnrBtPE7f23lICocFh4/9bT5bveAtVioHNhASxhldKUfHtaJnT1J
         ttzM9hIWxRGwqU7sXDRIMxNlCtBCslSS2kQDXxVJEycvxLEj9+N/FedtrJ4RzrX5DUHX
         Vj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747938736; x=1748543536;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rOYkb8ARNGoWzGK6NIRQbMqEIL4sIWgyEMwNFCwUiPs=;
        b=BkOpky3O79uEIxTzh5PExkxKTFypkHCqf0zrz74p1Gggie4xgj9pNgo/RWX6PdHcGU
         3Oe3Qtjxp82/r41ieg5HvBDaa+xUw3ffPjmEV+EZbM5wAekxKCjHtrBySeRN+l9/FvGc
         zk8yfD1D/QceMRVHirVbUS1oQsvJuuWclf5ccwWckewk6oYh3FTz8t9rnBeyIlDfLET6
         wRaeITFmIME7QPxeB9m5j2arCvfSDtW2YZUfzIwjMk/CzJFVOHO5ZufjHM+qKKFW1icg
         esIPMAfzuwCRTsiGqEJ9vGAVcs0DIgbOkx1gfyCK3hl2UAiud6dZNlmHAyMGSzUWcE43
         eI1A==
X-Forwarded-Encrypted: i=1; AJvYcCVsO7yLwkWOO7BwSugztXHfRL8mztX/mBw9P0bOUeb/OuE2hryMLBqEv1pNKK+v0OAlcgqw4FpaEW72XcE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqib77TAmQWH0+icUlgMBaLl7qz7z+dMXp45ESWgep3CAavFni
	mTB6sAi3aXFErAeSCp9J3TOUGKxPerdCYmbASflGCkQ/16yfp4Y3hHUsw0SwJNd4Agw=
X-Gm-Gg: ASbGncttyJBn0W//vpbrd8Q0+CPXuRwMAEOqSotkNOk6+RViEW2CmBClTouAYPQNUtc
	KVDeybdSIHJwYCvPrnqf0seW3RRWfyerOKfmdQtel+IITZkn1rd7d+wy3lUSKVGPx2KWxULJn6n
	PhzezKa4FxwnPH28Q9YYI4BzajjBu6skvQMGJMkTE5MvfMQ0Sd8KerUNNyg7JvIUNbF/lh4CjAS
	ezCxNomy4pwgRAJlNrMhJEm8yJc0nr2iO0ckwlYiZAztzUZBkHDxNnepkLPEWFDy0ws/Dnb6m7u
	X8Pb4tIqgHuNTRYYcw91KKv2V25zC4q2NSYcPpPJX59Zwl9RsbZjEC+65I4zOfg9cIA3V0TdUNK
	/SzvDwQ==
X-Google-Smtp-Source: AGHT+IElOSB5BApnFcPON4k3G6fN+T3e6tCMODFfwlTj5KlbfM3fgpMePZRiUwP9/6DJMNlIdFOSPQ==
X-Received: by 2002:a5d:404a:0:b0:3a3:62e1:a7dc with SMTP id ffacd0b85a97d-3a362e1ab39mr6921412f8f.1.1747938736169;
        Thu, 22 May 2025 11:32:16 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a3ca066eb7sm5955103f8f.2.2025.05.22.11.32.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 11:32:15 -0700 (PDT)
Message-ID: <24905725-21ca-4408-9822-285f0a96b4da@linaro.org>
Date: Thu, 22 May 2025 20:32:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] clk: nuvoton: Do not enable by default during compile
 testing
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, =?UTF-8?Q?Emilio_L=C3=B3pez?=
 <emilio@elopez.com.ar>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
 <20250404-kconfig-defaults-clk-v1-2-4d2df5603332@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250404-kconfig-defaults-clk-v1-2-4d2df5603332@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/04/2025 13:56, Krzysztof Kozlowski wrote:
> Enabling the compile test should not cause automatic enabling of all
> drivers.  Restrict the default to ARCH also for individual driver, even
> though its choice is not visible without selecting parent Kconfig
> symbol, because otherwise selecting parent would select the child during
> compile testing.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/clk/nuvoton/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Ping. Any Nuvoton maintainers are going to pick this up?

Best regards,
Krzysztof
