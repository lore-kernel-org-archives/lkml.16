Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A96020E00E
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 14:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738593031; cv=none; b=SHN5767QVmtK/jcmP23Px/LZexWQL7ZfxuUNqC3+iaLpgekzmK3O8op7h40/LDyyPa8Htv6gZ/8qdu8H4AlwAeMbk5aUG996+u4gVchdJLSscI/7T8nPBwFtfNzee+ezxtNpAsZfRUhrpviRLW3PJti5Y5G2+XrrvzqrvrvgEs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738593031; c=relaxed/simple;
	bh=IWZd5hlmNpgXQZ0243k8J0hL5ndXbwMghQLT8bz/dl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kD+o9HreYHfaO+abduQFLnOz3v+i9YGPKo9MWQHc56zwD7jX7EMiYDBH1RsGu654ZhPP20cxLHMq7A4bGYWnbR4mVuzNBtbq3GYbxUGHgzQZyhJ39cXj/qShvBnCfNyPfzeNqXsaCz60ts2VGP3qGL/Aay9B05NXU5m2bVRxHpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g6t8XjBT; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g6t8XjBT"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361f796586so52349595e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 06:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738593028; x=1739197828; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9vWFSQn7DgiKs/FycuACWL8FOOG/NvIUTBk5O9mP/jE=;
        b=g6t8XjBTUXglndFfVqzVdljDbO83j/VyLnqhmpi2yiCIcd+B/JjEO1VX+PSEzhpfB1
         2mm2m3TcpfTFrd9fzqgIcDrHAMEL7FBLxATUFPpDwt68cLnjpvYdGkZSZoNruIsyTNvI
         WEAwBOwKtLarvSMuj9HyVdYnovY6n72IiDUi8//PujcqXANVlmK/NPcL0Ua88hqWv/m9
         N2DQ1WP58EL268ay/gp/QA/MYVysFpwFRtnpUlYlT8XDB0SfP0f84FmgVxkFjv424M2S
         +quj9z1OpbGV2gUERzN2sBjpbAod91jRgKlaTiD7KmUordG9dUCpnYb+0bgQ85X4zEcL
         6OoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738593028; x=1739197828;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9vWFSQn7DgiKs/FycuACWL8FOOG/NvIUTBk5O9mP/jE=;
        b=UClsJsvdW68lt43ksweQrKMxARUh2lZCyDBWI4Vgneetvv8JqgJsSzwaPT2tK0B7nR
         CABR5yJ+WgPlpNLV4rtnKyu1kraSXucbyjVEtBD19PkbnP0TLHIOAX/v+4yHfE1rAS+h
         pg6PaGZ3N12/2083AjyLkgIu71NgimtxbKshW7bSp06ocTt6L10M3cejUiJSD6lojFUz
         JEDsnHSGIRLhaip4ALi1Gd8k+zSzr1bx7POe55UtnS5/a0GU0Tfc/h/jc1lfEpbT0guu
         gsFxckszOPYG1TzshH78Os4+wAKo/1Nfy8W2R65rZDXdFju/p8SScXKuQS/YBqU0nVky
         Vpqg==
X-Forwarded-Encrypted: i=1; AJvYcCUFoqZxXwy7IgWx2gO5C4JBHl4s7NNNM87+hADOgu4jukU/SSustvc3uSZqU7Ol4G6sGcNd6MpdThCR9Qc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyILhrAxS3A831f+YfI25SHOHuZ+xuioyuhdjPfgSnr/+wAbobg
	zWUvDDFddy/RGtYeSkcnTjA3vxsEjkNcEb7ecRkE5aRIAsrJ9TeCL20z804+MeQ=
X-Gm-Gg: ASbGnctCMuP0qfgbuOUJr/FhjqUPPNyuGXBqUbpJKSt3xbZvZ5ztNX5++Mri2LmG8Si
	+xg0+NvKRfJmRXKcf/vaC4SxrZ1B1bJGtVY1HcUM7hIfyKWBxt8J4GElF1Wpp5syG2eJRMFwLXr
	BS+JoxjmLNFB1E19J9I0z3vz3vYBoRk1n8zR4CetcgT/fwdBANi1TyODNy6+IhbHkksf9SGw5Ha
	VO+YeK3fqjoDmZmTvo0PjlkGaaW5rPrla4HeaCRC9CnbW6j14NbkT8bS5TlhF/Zd1FPsSuhqExH
	10slIV7t2tNfgSQ/IwYUryxLhWaYXiNMUQ==
X-Google-Smtp-Source: AGHT+IHinY+xh0nJesZnDupVI2Wp4r4N0MF/Fkn9c+8reC2w8xLtTGDIrtM8PVUM9uRToGo6QBxJ7A==
X-Received: by 2002:a05:600c:4fc1:b0:436:1ac2:1acf with SMTP id 5b1f17b1804b1-438dc40d55emr204148275e9.20.1738593027971;
        Mon, 03 Feb 2025 06:30:27 -0800 (PST)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-438dcc81589sm191206255e9.33.2025.02.03.06.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 06:30:27 -0800 (PST)
Message-ID: <35cf66a2-05ef-4e49-a146-ca96ab19fcf8@linaro.org>
Date: Mon, 3 Feb 2025 14:30:26 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: q6apm-dai: schedule all the periods before we start
 streaming
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 krzysztof.kozlowski@linaro.org, pierre-louis.bossart@linux.dev,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org
References: <20250203124945.11406-1-srinivas.kandagatla@linaro.org>
 <357e28eb-f245-4647-8e10-79805b53731e@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <357e28eb-f245-4647-8e10-79805b53731e@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/02/2025 14:17, Mark Brown wrote:
> On Mon, Feb 03, 2025 at 12:49:45PM +0000, srinivas.kandagatla@linaro.org wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>
>> With the existing code, we are only setting up one period at a time, in a
>> ping-pong buffer style. This tiggers lot of underruns in the dsp
>> leading to jitter noise during audio playback.
>>
>> Fix this by scheduling all the periods, this will ensure that the dsp
>> has enough buffer feed and ultimatley fixing the underruns and audio
>> distortion.
> 
> Should we be writing all periods or just the minimum number of periods
> that's configured?  Userspace might not have filled the whole buffer
> yet.
Just minimum number of periods or 1 period. We are queuing up all the 
periods to the DSP, so that we do not have to wait for period interrupt 
to queue the next one. This significantly reduces the latency in queuing 
the periods to dsp.

--srini
