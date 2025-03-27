Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35E91F3D44
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 07:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743060187; cv=none; b=SYqrmMaW9hFc4dm73XN2BF5Ee7TTZ6ExMykluDmYEgl3RMoQZAFhjUnkbr+6CVgO9Pc5NPmB+FmIzkv/x7DQ7Pk2FhG8LT3mj5P0YqZsljsZ2Vge5ipxBwYXpVcRj+ERkFgoncrLKk8IJ1rkICs61emMj67LJx+pg2OtO7IYwwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743060187; c=relaxed/simple;
	bh=N9SMOd1thOD5auMiNd2nLvxsn7PA2OVj34IXN8Dpmfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cnXu6z29235GHY8Bc82d/eD6zMqRFNWPguqQa+PfL3hMDXpYI0fe6Eu6LFoq9Kzrzqj5iv7F4nMAUGuO4wg2BMRW5NbO4oxI1E/p3HKA2dpmT+4qmFYYsZnLfPo8I+d4AJSx9pUb8LgMqxeZ79S54W4i//7O4TrNXB1hFBGdSiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gMsRV8ml; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gMsRV8ml"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43938828d02so1376725e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 00:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743060184; x=1743664984; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/Y59y/fYXI/MIDZveqdd+FFwrRU+OYf9xm8AEwmjAE=;
        b=gMsRV8mlcslTmUdoSmtRm7J0xtOhdxtC2VW7rsMvbnelzF0IpnqxRpn5OElw2AwyDh
         jxb6vz0FcJ57h+AZ/rkJ0iJ6BIF0uuVT2j938WAn87RA6/T9qAX05avGfCpIwm9kZFpS
         DqcSHtlwl1Y4zxa0j8DT8y/hrGO0vbkvSolAfa9ch3Rp5yrPOavfSWVviflRUrI8IsBS
         3BuuwPtaMQ+TBeq6PmWdH7sDRxCJSq6fHKrbeBR1uLHaGashwjpGFM9vaaVFnKDOxCu7
         OKrTRmXFjTj99etTXQ3wuUBDFO9IRT/pU1YSE0xxjUj12E3/IqJyRzP5ZPGhS6sY7QRu
         CTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743060184; x=1743664984;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z/Y59y/fYXI/MIDZveqdd+FFwrRU+OYf9xm8AEwmjAE=;
        b=J4/o5SRTFgiYYaWuMnqImj+FxeOhDKew+A6D7wgPqk4w/JDDkpRlsK5eJ5qZnnjS34
         H/QxlBqtVU1IoJhre3NBQ1g3QojIWjhnVEuCHFY7PXLB834BDbTy0umMkd2Psr7fEMDJ
         f4dFlyLPVhX8H6jtwFWBK0hF42WOH18GdCaV1wfWpxAJP5jyPU+nbm4dxoSk7hcjQB4r
         T5LLP+M7oYm8iEvwLptgdA65xd9REN/dPItVhzoBe/m/xoxQBMgQprAEQYSR6TLyGU8o
         MRrvlEsneqmsBPHfWCoKhzqdwjDwhx9v6r5pwTVwlLLD4Smy/WqDBdfCRKSGs8iP1Upc
         7+Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVMsHvU7VUL/eAB8AXvsOszs+n47dNCdQ8DQcgALBM48u3xS+Ds6tYW+KjT7Ee9VvyKtcm6IS+7rceYM1g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGfOQg4cf/b5roW1UvoN3iisDzTXKTVAKzBPAWqYJrqkABoT2c
	dGDPK7bgff0kPUEbwcWylckTdxsSX7WRmzX6zyJwELDfwyHkjYVV1KYojjxy428=
X-Gm-Gg: ASbGncv5OhtP8WvfZUNp+kfmxyCHl5GM1cGMJv9dPCzmXY9gnRDRSrz0611utnWw25m
	2D8NAywW+tE03TYgm9Cpjr/cI80cyxYFT+zLyejbHO5no65An4gqf7QaFfsX1T4W4b7lMbfTt1R
	zcVjMhWoBqwIUDwANK2WaMpyOVo+SGp5th8A1RxC7qvHiGqnhMA7EDnufAXSFDwLEg8/ObI81gp
	ytVDVdyS2q3/DxvFp3Pd5qECfZcmARdIs4zpO83+uZhSTGM/Vp5VLT9qxwR20BMSSxjXwb5Hrd/
	9c5LrSte6eev5ouKaUS7urcKuEIzjonP2+V4IlVYNTVZVOUOFVAxyvAT1n0FZZ4=
X-Google-Smtp-Source: AGHT+IFWaINuXHKUMdyo5RP37K8zDQ0bWgCSEpHcoB9XhhgozZBQGKZ3w4EmQfkOaefijiS9p7CwZg==
X-Received: by 2002:a5d:5849:0:b0:38b:eb86:694c with SMTP id ffacd0b85a97d-39ad2aaef54mr446469f8f.0.1743060184101;
        Thu, 27 Mar 2025 00:23:04 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9957c3sm19517639f8f.18.2025.03.27.00.23.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 00:23:03 -0700 (PDT)
Message-ID: <5549a95e-938b-4560-9e60-146e5e0883c4@linaro.org>
Date: Thu, 27 Mar 2025 08:23:01 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] UPSTREAM: media: platform: cros-ec: Add Moxie to the
 match table
To: Ken Lin <kenlin5@quanta.corp-partner.google.com>,
 LKML <linux-kernel@vger.kernel.org>
Cc: Benson Leung <bleung@chromium.org>, groeck@chromium.org,
 Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 chrome-platform@lists.linux.dev, linux-media@vger.kernel.org
References: <20250327103918.1.I704cb6f738208386a0d431d355169c6fdf0f51bc@changeid>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250327103918.1.I704cb6f738208386a0d431d355169c6fdf0f51bc@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/03/2025 03:39, Ken Lin wrote:
> The Google Moxie device uses the same approach as the Google Brask
> which enables the HDMI CEC via the cros-ec-cec driver.
> 
>            Hans Verkuil <hverkuil-cisco@xs4all.nl>,
>            Mauro Carvalho Chehab <mchehab@kernel.org>,
>            Reka Norman <rekanorman@chromium.org>,
>            Stefan Adolfsson <sadolfsson@chromium.org>,
No clue what's that... and I don't get why you call it upstream. Follow
standard upstreaming processes and guides.

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

If this is for your own projects, then obviously NAK.

Best regards,
Krzysztof
