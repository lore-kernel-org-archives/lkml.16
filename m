Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABBA1448F2;
	Wed,  9 Apr 2025 04:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744173040; cv=none; b=NPnoAitIslsUw9QArU+PdKcF1MAFTZEjSSQiR+M6HwWydZWG4u6gWs+SaXsdgiPIGYUXBu7H0cNa1eEzhDIWeTxd7adV7noL2a7cwDbbIzuf17KBPuOsuyP4/GQtyt9jSoWB1JhL4/Fu0jQZS77bVB/1fw5w0659m6jhuN+CNXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744173040; c=relaxed/simple;
	bh=A+B/gLgYYuRdNUd1qUlwvwecmPuJjkMVoaI5fQ59yrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UuH3HJIqWXtGH/vqJqpBWB26yIvtfkYfKjtGybKLzXqnjAcRbOXWNQh+nefLAxhm6IsTlt0EFemRdxj/rd1+1B4khDRRHRJ22sfrBBE3E3SxHKBc7k77UcLZ2zDarEYRcrM+4kZerirkXW4GtJ10MisL/T3kr+XMfGQDbSyDVec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QIlovDAY; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QIlovDAY"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5499c5d9691so7083792e87.2;
        Tue, 08 Apr 2025 21:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744173037; x=1744777837; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yFwO+hYw03wGfjNxNJud8inynjlbdbEn6J8azxQuyYo=;
        b=QIlovDAYGgT62F6SfFBS+wUuE4JgpWETyXch0gXjzCZ+ifneeJTlIXufzJcwu8EuIL
         kI0s4mHdoh4jExoGszNJwpWpBz63qWKZsltnqYjpqouvJ1lSmWu0MKxA3Ej3xnZ55YwF
         JfN/EsYJaxar4IucHfxFibkicqwxFnmiYDSVlSRNl7tObX9WjPP0qK0dd9bRQF1RCJ5p
         Ju9qr7m2Yx+08FD+TONsd4yo39mJVGrO/Ex03lkSH5KElVh0Bz0uGrwETL3IJa3mOSdO
         NeaMfTT92cgZEQfUIH894UEYNbZpRuFtzO8tTKIYKuE7WjqjGRT8a3PEWKA9puONAJEI
         m3Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744173037; x=1744777837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yFwO+hYw03wGfjNxNJud8inynjlbdbEn6J8azxQuyYo=;
        b=EaYEUjnMYxxc/IppQYhpOy/GlM8ec2CMbEsH30b2487OPtAVdp8EZv/otSKa81I/Jh
         tcP0GsTrri3QzQ6tHoflqyynB6XoSl9CJn3V00kMUETNOyU8JzxBnu9/VCxszO5HrG3l
         EUkYUCmWM9Y0CCxTS7LGtohlRuYRMb4Cn++3uugTmvXPaTkO0ouWX020EpsyPcDESSmW
         nxPcxvMAEzj5vMQHVIGsNcDPVNn/w7P/MeOepYfnUlMkXdF7/vznIxZxgb66nzcmOIfZ
         btgnO3B2h8/22HRrnURm9ABi6hRcsFHVmO3EoQHsfYiKlcsH/AQIUb9/EGR3lXtvQjK6
         cjPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVy5IUvTJdQevw7QO9z7iEz+SZ+8uX9m1Lc+aN/trA7Ml7bdmQqW1GJpzFLJ/qnk0qe8REhjFNS7nr/Tf1K@vger.kernel.org, AJvYcCWP43SmEMF971O2csgzrEtPIu2DgUS2OQe6MnHGDvYaGgoddum6C1pl2BTVAwtIOa91HP/hsQ77l15D@vger.kernel.org
X-Gm-Message-State: AOJu0YyhxthhXkMqWunKOjmatZfY7P98SUBCD5BYTjyYZBsyfPvVwnp4
	k66Ju7SEe6je2stHoo88nTOODSetZ8022M1cyx6zaX0aEDDSq24OdPxwmA==
X-Gm-Gg: ASbGnctn9O2CuVSNOg3vpHZwEab0i1d3DFs+8semdd1v/JoIw+E5CfqigvIn609KKnG
	flv/wwIoZVt0qI1poiQq1lel+ug0uafN7a1MlV2SuKkQMgCTgUxOU829TfpMtAJCS7lshjPJm8V
	45rGb5t6xnpnlp+4MVmphh+Dz4+Iju/8TjyW3mvWQcWHcDICKStQALt+bjY6o4509RAv6gVZcn6
	exZ5ZM0zhsf0g0qIaMTpsSrthmfN4V1gw94FQXaK5nl/Swek6NOjdPov5cgiywoIX6h8e+7qFEj
	n2gsN4GvqOs0WkdtNkvkm4j7ZzAQGkzxFDmhy4zLhd0PKQmOLBCV5zvq+OFFIWi5UDvYESlmUXf
	nso3Ve4KPhwB3FWcpzvgjxN/TBN12CvJGqNB+
X-Google-Smtp-Source: AGHT+IEl8OyCkcEb62DT5Krt7eESLpqsnrh9N81tshj4PwOv7L6cNiDBrNhuNhjlJB5cNM8eX75vTw==
X-Received: by 2002:a05:6512:3f27:b0:54a:cc11:a94c with SMTP id 2adb3069b0e04-54c444b3815mr290619e87.3.1744173036744;
        Tue, 08 Apr 2025 21:30:36 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c4566ddd5sm32199e87.185.2025.04.08.21.30.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 21:30:36 -0700 (PDT)
Message-ID: <b233f08a-ac8a-4670-8b32-8afc8a7dfc0c@gmail.com>
Date: Wed, 9 Apr 2025 07:30:33 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/14] dt-bindings: regulator: Add ROHM BD96802 PMIC
To: Conor Dooley <conor@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1744090658.git.mazziesaccount@gmail.com>
 <df7983e7c623041f14a4fbe409a2cff846e68a05.1744090658.git.mazziesaccount@gmail.com>
 <20250408-boogieman-underwent-968671653b3f@spud>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250408-boogieman-underwent-968671653b3f@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2025 19:16, Conor Dooley wrote:
> On Tue, Apr 08, 2025 at 11:40:41AM +0300, Matti Vaittinen wrote:
>> BD96802Qxx-C is an automotive grade configurable Power Management
>> Integrated Circuit supporting Functional Safety features for application
>> processors, SoCs and FPGAs. BD96802 is controlled via I2C, provides two
>> interrupt lines and has two controllable buck regulators.
>>
>> The BD96802 belongs to the family of ROHM Scalable PMICs and is intended
>> to be used as a companion PMIC for the BD96801.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> I think I acked this one on v1, no?
> https://lore.kernel.org/all/20250326-candy-endocrine-2e7b2182e53b@spud/

Sorry Conor!
Somehow I managed to drop your acks. Also from the other binding 
patches. That wasn't by purpose.

Yours,
	-- Matti
