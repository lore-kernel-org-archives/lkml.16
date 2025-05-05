Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D8E4C85
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 15:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746458093; cv=none; b=Z6khYyAArwgPdM9zZ4NX4CaGbYuBousaBq/dgMvxIYjyPgU/HrSqTE/jv655HgtHxfUO3rrSO/9qHJSEwY3TOnACvrX4+g1O3HGyIeAbrw3wvsAz3sIh+ljKKMeWvFnTfIJljb79bo5Ifojk1b+VhTPol3maYHxksoT355Tp10I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746458093; c=relaxed/simple;
	bh=pgPKW4o269AEzuRZ7ilMi1bigEa3Hu2tQwNb2hqo0bY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U7cI65px4oF5BL21wyTZHjJfiaJIjd3IOkQlE+lniLoTfvr4foJyGMU6JyrOCvHA/Otjfl0LXrGkzoDXstnliz+unKCe3CQS2tn3+jUqYFiRLS82gF5a0588M0hHke+NFTPm98YU472LnDx8i6oSGNg5J/cmsOaeyWi/k/iaSBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KeyV2cBh; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KeyV2cBh"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-44069f5f3aaso5420055e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 08:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746458090; x=1747062890; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=d32GTanChrRQiIX2kw/78XA2TlMTohJ35wsLjmwnrpU=;
        b=KeyV2cBhwdOBj86COo1QPl3oGjWmy1Vuk4j6RzqYQcffmZLvwrpDFPp6A+PDWMfrNG
         fWSTdHvXIlj5aM47r0oO5/0WcVyOJIfyrApvA/RTfzcyzv7TJQHvOw1i69LNjfKog2Nx
         CVjY57PnNB4zKsu1IxNVIHCGOgOaozxdj/uKmAe6BWAH7OQ/e7gLFUxx20dHpeWgtPuD
         fQssMeUEMAHuGfa53CsunVFFduLvWdW/bIIN3PSnuwQfW6J2qBWuKim4UqG891EKXsaK
         0JQVAuUyhQqdcj/8mSaxINkQk2LrZnKCiaZc81yklpZVDQ2gjxGtUaRICLbgTOGDEBdq
         1iRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746458090; x=1747062890;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d32GTanChrRQiIX2kw/78XA2TlMTohJ35wsLjmwnrpU=;
        b=ZLXBGZiiPAeNEs1fgxjC5nCenIJPkHtzJFTSwVPHx1qOYJ7DjZa9ZfYk6OmD32c23I
         9JxYwRUvHxL/kq7Y7fRaI+z2uEKF3tluoHfpNu5hS6sg+rV44vQ9D0rcy16neLLPAKHT
         CBus6+2q65Y7qinc9wvDzVAuyKsnDta6X4ieSPlaJMV2RzdSfDnB7ztSoQdsMAS6yh1Y
         OW8t7Vegk6JNaaI5d1hHmH26H4dzOsLD32GMcOT3LgI0Vx5ex43C1WDyfFVK65sjfDIk
         VmmoIirf/d29J5pgk3XdeiuNMfNBPfiUs3JntaqWDTGOC1eUdpNrAblZDSf3GCYi8rsV
         q3Pg==
X-Forwarded-Encrypted: i=1; AJvYcCVO4nPSEy7qMNSPqwV2Xi1GMB5SW6yXiL+BfDkzewuy3hTZEwfrnsZ+jpQ+MzTpu6AVkLGLM/ZU9/QcDik=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRnEZ8E+93fllvpem95Ekq+DiQF5oMgXemSIvY/PpJEj/iVxoR
	3L1X6ofaA/MRe69iQmq/faF6GXWnSo/xUCifL3BCHORj5YneWtggSkTWeHidjMo=
X-Gm-Gg: ASbGncug++6AOomN/XCyYWS3IcXJAez/xJdGsEnz9EjtHtkVD9xiCZUorVnfTPdAKfG
	Zmaqz2zbs7PsuHWVwqBXj8e98lj+lIlP4N2JBH3+pS/EATHGIfnZ1UP8JnQJNAqgjgsVgtTvKtD
	CHV/cs+OS92m+7qU5b43IDh5zzrAjVUDc4XDYy4kd4XQBBZiVrG8CXSZ2cqJ1YYnNxw/Sk6Mdtl
	amJLJb3mZ7IOF24ohlfkqI1YWbyPgqRzelkjjv8SVU1dxQhm9Sbza6GtLXvSa6rxo+ulRU9Eq6X
	v+uDRdV7Mpwn1e5Yg9WTREt9bR7Nj6iIHwfRQgfXBkFwoPURB7z0eJoWCvi9+8O5vrYxSw==
X-Google-Smtp-Source: AGHT+IGcpN1WH+W1TOAguqrm2FpFHGatweK6lfRlcaT9gjRgYlUH82bX8IAOdPt8S2pz9M/xpfDWfg==
X-Received: by 2002:a05:6000:40dc:b0:3a0:6bd0:9771 with SMTP id ffacd0b85a97d-3a099adde6emr3159216f8f.7.1746458089886;
        Mon, 05 May 2025 08:14:49 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2aecc14sm182288875e9.12.2025.05.05.08.14.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 08:14:49 -0700 (PDT)
Message-ID: <4fe7a429-50d8-41a6-a63a-6294cc76d599@linaro.org>
Date: Mon, 5 May 2025 17:14:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/panel: Add Novatek NT37801 panel driver
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250505-sm8750-display-panel-v1-0-e5b5398482cc@linaro.org>
 <20250505-sm8750-display-panel-v1-2-e5b5398482cc@linaro.org>
 <2fb8cb05-8fd7-431d-87a9-134448125f06@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <2fb8cb05-8fd7-431d-87a9-134448125f06@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/05/2025 15:58, Neil Armstrong wrote:
>> +	dsi->lanes = 4;
>> +	dsi->format = MIPI_DSI_FMT_RGB888;
>> +	dsi->mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET | MIPI_DSI_CLOCK_NON_CONTINUOUS;
>> +
>> +	drm_panel_init(&ctx->panel, dev, &novatek_nt37801_panel_funcs,
>> +		       DRM_MODE_CONNECTOR_DSI);
> 
> Please switch to devm_drm_panel_alloc()
Ack

Best regards,
Krzysztof
