Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB34D22F766
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747807870; cv=none; b=Fl503xiC4IYFGmhxSrCYrfsQFwPqAWla3gZ9W28nQb4wXPEs/LRa9+szIqst8AWYdp29araUQhr4uIifNFBrFCP3OneWMGDhEtR8SPhF/jtILGtkR0AvLN4Gv4gGiIG38IaoM/eY4H60LWGWnye0D6+8zhS/iqBaSYzypuG3bQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747807870; c=relaxed/simple;
	bh=fHtFUn70VLHFXuV1kq2SNpwhsushNeG1dqtCD932Myo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PHllqOPcvWG3G7eV/xOAyw5QR5/sAVitlTkIBKb+XyjPEmJEctnJ9jro+PQqg94X4uidR7yH2L/znVnmOrb7G1fsthPVROPnZfDjKfhhfW70XCUP0rmuYqEhcXx+bmM6oq8Nr4QlGuhfzW74SBtbm8lzUc2c1P1P+UmJakotPz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c8KdBd/K; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c8KdBd/K"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a35ae46214so578441f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 23:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747807867; x=1748412667; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qVCQxmIBPGpkmC3SOMAigSq4dFVhiNnLk8ZvthJ04qE=;
        b=c8KdBd/KnhCXTjmsJ6rNrYF4RhNGvFSKtTug5GshsJoYomxRRmbHg8UrUN6JC7nsLY
         YkoaeM8VlceIJ96YlkIZ2+n3WG66Nr7fXAApopYp4epL7OGzHLCjyvAAvrVj3715bAzO
         DOoNI7xydux9OtpO1jr6UsVyuJ4NHReRIRt03Ibztkt8h1mY++Ed1uDlcLNpV8TljS2z
         AZy//l/eFgoFxGZy6gc/sF4DBZYUrkSaUMEN2vQEzW4/7KT7BUFpcILulaYoejvT/H4m
         OM8yFlzbYgQWYn7u3j8OygznTQ3W0NGJBYfvxFUpu2/yLh6AUwTvMbkswzW4L5OS4GgN
         HXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747807867; x=1748412667;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qVCQxmIBPGpkmC3SOMAigSq4dFVhiNnLk8ZvthJ04qE=;
        b=ceJ9WvK8QZuXH/tqPAd3pyMi+SbZdI0eVqWbIqvgJEze5SpsoAY7pv2HWT8A0ZHfxT
         he3tjUSkdRSaqB46itfI17A+I+lfA0U/fQL9K3toFDDaJd5GhmcsVOOBNzFB5og2mIbq
         RUBm2dDqvnEeKorP2x6dyLrdX2gmWF+Mj1oPDUeSa9NuV3jgmeGAV+4C6FG6JCNDrb2g
         mvRZmYwk5h/GcvnACVkGtLEjFkheUmg3bAGzy4rtTI2B7lWPR/jziZFJuxx05xq8ok/8
         Ut+mxAv6MtBed8b0xuo5NHckPk28gxxRj55yX+ISjC/k5D32NKjhJVNPpec1qJamz3Mq
         xVWg==
X-Forwarded-Encrypted: i=1; AJvYcCVQazRz9EnaAw43lygnLTTaIsSdWPka0k607GSal7hK4u3ilGG19gkWbesucwaqJF89B7q3ouqT2TxbASQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtS72TDxHFx3kPZtStC9TBi4A+Vstm4q+gsspbhwty8qw6EV93
	LPdJRZLOnSCC8IBpD8NMJwin8TBa195aJwYRQpFiCNXsjqkSmri+vK2+M7rMQmMg/KA=
X-Gm-Gg: ASbGncuv1LYyayXVZNKjtRskWk3s04KClhs6CEmYynnhE98pU4cKIJsUjZ/EN8epL3u
	4LLU8H5QVDRqI7ZUF0RmLF8N49PAXB5fZGIjqMXgJtH/Ljexnw7h1ojyVGd4wF7VVxegF5cb38z
	aJyUa81QQrZdVr/cDRmj9I8zmkcw6y0Wijl7ETb8Jy7w4eQqbqBhlleVuMjR/zJbTcAqpwVH+qM
	yeR6RIHvbNsWyDWETVdvQjvgEeHM520gzg8xkZV1Sa2lKsAa5pFIZ/RAYAhgmxUJAxpC33XeUsO
	+cH9f+2TMwHpQ1uFPv3Cp04GnBe/bpx/zgZYG5wg1DnEyK2j31wcUN2n/mGlXR9KodclZJI=
X-Google-Smtp-Source: AGHT+IG/Vu/91YjmlBWgvPSmMlmSsw0ONgg+leAfY8UfWAa7kSP5roUhJkzMOVZb64MQAmXuNtn6/Q==
X-Received: by 2002:a5d:4044:0:b0:3a3:5c94:c287 with SMTP id ffacd0b85a97d-3a35c94c2a3mr5179290f8f.2.1747807867231;
        Tue, 20 May 2025 23:11:07 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca9417dsm18309048f8f.101.2025.05.20.23.11.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 23:11:06 -0700 (PDT)
Message-ID: <0c6c6f0b-02f3-4220-aba4-caeafedc7ff0@linaro.org>
Date: Wed, 21 May 2025 08:11:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/24] drm/msm/dsi/phy: Define PHY_CMN_CTRL_0 bitfields
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-15-8cab30c3e4df@linaro.org>
 <j47udhqq3ldsza3cr6a6rd5dq7uxjgpolbmdhmpzvzt7glpuva@v5tgkydlywag>
 <b4f68273-6c3d-4ca5-8b8d-8837f3f03683@linaro.org>
 <f4ciopex6fo6u77shetfa3hjb3ehvy3brkocyjcbd6xchkmgxs@v6xfxhye24hg>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <f4ciopex6fo6u77shetfa3hjb3ehvy3brkocyjcbd6xchkmgxs@v6xfxhye24hg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/05/2025 23:23, Dmitry Baryshkov wrote:
>>
>> There is no checkpatch --strict warning here exactly for the reason I
>> was saying. For readability there should be no empty line after because
>> such statements are expected to be together. I don't mind of course
>> adding one, so I will implement the change.
> 
> I'd prefer this:
> 
> u32 data;
> 
> data = readl();
> data &= foo;;

Ah, ok, I understand now.

Best regards,
Krzysztof
