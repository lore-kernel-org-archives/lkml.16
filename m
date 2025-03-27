Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC88218845
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743086530; cv=none; b=CUvreNDaQYQlx2gpk8w5TbiE5FgHNMt+L6OV2NoA2WDruXMW1Z/usqkrfji91COEdk5vH0G0PASnqn/GkYW6AVcagQ8MKncCnoXoxFVWlP31jOlvc+ymyfx5KzsQFbvptqJVOVAAolcHBfsR/xt9dgHthqejsfMwAXqPZRuEluw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743086530; c=relaxed/simple;
	bh=uVjCt12OKYdq8tTukghoZpsYK72mbDzi/1QIxzI3x2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D8oOu4+/Spq6ziB4SX6PGhZ4104wxmCEAPGhnFOfsxZIAM64/XQxzLllRWGyfiQiKPfjBbUPqahX/cyF71sQl9/E/fj1fW/v+R5HloF5B/Rkn5ZoXgOwh4Ltlk5PYiY32rp7N6ztQdQJ3RYHl6/iUJ9wPNny/MlhK7QioHqI+9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mIB+qYNy; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mIB+qYNy"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39973c72e8cso143551f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 07:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743086527; x=1743691327; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GQ6ENJjmMMWO0y0iR8M6dWk36AQmBxaNp4B5objfMtk=;
        b=mIB+qYNyiPkiOKbYH0LVahAKLmSW9Ez5uq56dC36dbZj/SGd+JTRaVYibHwYKYL3uK
         feIoT/37Pz8UKjP+tO7PoqHSmiRSSedlGl+Cpwyq08nInhlZEiAkPGjT+rrCkowvgt0Q
         8meXsJ0WLObEZOTmsDkPABbx4iZTor4M5Y/L8mwZC6o4yqhkkoIsA3rgQjHCo/NV8Xpo
         9QfVNQLMiB2+mpWsNGnpoMt48yaf0LU2KaVS7yi5DCz2esssjjGQFG9afflcwVy+4JWM
         tt+Dw19oLkDTPJm6JU0UW8haj8mZ2jVs7RHBePDKKGBzCRNnm1PsYThQ8kPUyRrJW3sC
         8/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743086527; x=1743691327;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQ6ENJjmMMWO0y0iR8M6dWk36AQmBxaNp4B5objfMtk=;
        b=NRu7ED/mAP7G7iIrQxznBL1zYzSkuPDbOJPQy8QhjzJJpGVszh/KF2uNW5mxWZ69QE
         eKpxcDfqHXJUbwmqcgyAyjbK2bsikT2sE0xr/5101c8UdL90Y05LWXvwy8LWco8mdD0S
         tNOVPL5s95fEiHspT0S2YiGJdYeOBhwp459Tztu6kWhJSQ2UeEUEcaKfOTGpBqWtxpyl
         IpwDCoqBVGDoQQFbn4SCHuRHpTN8TRMM2lXUn1jVp2dQMF+TSpE4mnhro7Jiy0xjeCk0
         DNXTO8Es1U10+hIwSy7AAHTH5EzQ5+fBt464z4Pz+6oAJO84U4Unh8bGcdNAc6bKljb/
         /wEA==
X-Forwarded-Encrypted: i=1; AJvYcCUf3ODzwdv2pXxu+VGbnH/bLfctmw0pPIwGdAde5tJsr36Nnu4YcdM8afWrdIZRieODEWADiiOAMIHxFsg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSxms6SlNsGclC68M0ElpIfCFW877xOXdzygGDnyb9EsR1Mzdy
	QwvNvp9+XLmoSsFVVR4lCBHvlsTVF18jfE2R1NUDNUCXgPrzFxKSPhZqk+L/ou4=
X-Gm-Gg: ASbGncuArr/T+2Dc8BO+dsoEok5rJcbpTiA4KeknD5wt5YI6G5JITpMjAeIX8qaw4sZ
	30+Zv26QbbIKoqobOibg+xC78oKUBnyhbvZ2mRL6pU9YD8X8+KFVdD/GeDbsSxzWnwfPaMzOWW/
	UOUgVBvZQwTOVd58Sd8KFEn/5XnHksguA1arRE6evoAp9pNFcHK1y//I28j1GxDn3iZukyfGY7c
	73a9WxaRwfoeRvvOUO4GIMkt0OZAzF9eIA02tr/tMEWBkf6SbuZcO+Ce2S5MnxeDRpLUkVOkL7h
	eWx5/1H2YAw8Y6/0YA9qv7Mlsi12/vhyE2t/B2Nmx3spDlHPXUszZYDXx9uvPdw=
X-Google-Smtp-Source: AGHT+IHMeyVSp84ZVswyUQyEc433wzebATMUgMMvgJmQXwYKz5AHJh0Xl4lDjTCEWpCNMsq5AW2eNQ==
X-Received: by 2002:adf:9c90:0:b0:39b:f72c:b521 with SMTP id ffacd0b85a97d-39bf72cb76amr475188f8f.6.1743086527067;
        Thu, 27 Mar 2025 07:42:07 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39ab907da9asm17696645f8f.90.2025.03.27.07.42.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 07:42:06 -0700 (PDT)
Message-ID: <25fd5b82-043e-4b0a-89fe-3c24d0a6dab4@linaro.org>
Date: Thu, 27 Mar 2025 15:42:04 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v2] media: platform: cros-ec: Add Moxie to the match
 table
To: Ken Lin <kenlin5@quanta.corp-partner.google.com>,
 LKML <linux-kernel@vger.kernel.org>
Cc: groeck@chromium.org, Benson Leung <bleung@chromium.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 chrome-platform@lists.linux.dev, linux-media@vger.kernel.org
References: <20250327145729.1.I04b964661552ce532dbefd1ee5999fb0a0641a07@changeid>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250327145729.1.I04b964661552ce532dbefd1ee5999fb0a0641a07@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/03/2025 07:59, Ken Lin wrote:
> The Google Moxie device uses the same approach as the Google Brask
> which enables the HDMI CEC via the cros-ec-cec driver.
> 
>            Hans Verkuil <hverkuil-cisco@xs4all.nl>,
>            Mauro Carvalho Chehab <mchehab@kernel.org>,
>            Reka Norman <rekanorman@chromium.org>,
>            Stefan Adolfsson <sadolfsson@chromium.org>,
> 
<form letter>
This is a friendly reminder during the review process.

It seems my or other reviewer's previous comments were not fully
addressed. Maybe the feedback got lost between the quotes, maybe you
just forgot to apply it. Please go back to the previous discussion and
either implement all requested changes or keep discussing them.

Thank you.
</form letter>

Best regards,
Krzysztof
