Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F45282FA;
	Wed,  9 Apr 2025 05:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744177416; cv=none; b=YSVmZxPeMEllfztFvF87FWstfU+eya+KAu2uIEomUvT8H9Hz8B4B3TVkgtmc3GfUAmFhGWZWvVl9eQq56Mmn22H5d/Q4AafKRJlTfyS4CTlz1AhZuj1LURcFNaMDpdOSVWs1jLByYYp2VHqB7irckklTmpX31wbSILqO4XQwb9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744177416; c=relaxed/simple;
	bh=J8LGMW7whhEgDF1kkORXiCUzQ4kiTZwBcZaIB8TG5Rs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=KTLD9KXp1C8UWM4x3uKumThIw3So9Vy5LtmV/YNevrQqRDEOBqXZsbcXYdeqEbCzqBbfp+ISYaESrrshUMdiR+IxlCPv/+bIH1h2N1vnRElD2PHptb06koGnymgfOXA+k+f7uWM2LtvBYWtDGavn3mT6I/Zg/bV766R0NnMnC6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMZz0b/0; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMZz0b/0"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54addb5a139so7062705e87.0;
        Tue, 08 Apr 2025 22:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744177413; x=1744782213; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=In49OOnUnZvZAmK2s0fur5Q6IBBJkwDHf53+fdgFBOY=;
        b=WMZz0b/05Pnhk8mU72IX0U/rTIKyqw7+F2cL8yduRkpWqzi5WG0tYgL3G8L4vtPSBv
         A6E3DSG/ce3EAank5OJPnFCCNVc8+dipBaCMrL79Uof3vnW3Kod1zwk2yvkvPzesJ26C
         81fRio5sFn3+aqbo3+PoZ7yCvVZNBwthcjleishSXekd/d67ePwMVVr320iU0tLjGjEW
         pUt30Bdv6dbn0J5n5kkdPXzirmyse9PjY9zJ4XeDlwMhAIMDcKwUnpXCXW1SSOxPAyV0
         Wz3bc0qXbPq5gicA3AonGFoeVfz8Ea9c84PGBGKbOZpGi4NWzNbVIYDiPVSS8OzucVhe
         dFIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744177413; x=1744782213;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=In49OOnUnZvZAmK2s0fur5Q6IBBJkwDHf53+fdgFBOY=;
        b=xJ41INaSSFATFq8JFgsGRl2+c1LMaogckaEihfAu9CeF7cbJE2UL9Qhp3dxQO/qcXB
         OanaaLTsfzznbva2vkPEEFPFEFIAjjxANlNNQVtOHdUu8PoRbEZMt0moq8Tk20JpenRw
         tW94flQTf/AIMvfMO+vgZ/mQ2dKqNQ8JWvZBwFzAvasHukbr5rkDXtBxPDVQ9XzZgbaw
         2i06QNz6l5qNgCtRQ6W/vWTk2baDzKJfn96ciiwg85E67FaI+gWlOeQCo0a26D4+f8GP
         dFfx3dFe6P1ku3RQEJiy/0AEnkKc0mlLLuRapXjbOdwtBZ6sQULULshr8TKAv0jvNLYr
         MvTw==
X-Forwarded-Encrypted: i=1; AJvYcCVlzOkAl0yrfqQi5iOk+Y8G4PemEhf4YHUkEF2RQe4NxykpS1wWoikHKDE2fNb1W2EFA2QLB1N0Nrwnkr9v@vger.kernel.org, AJvYcCXSkvenY4J7+m0bUZ30okQCO1j7OaWhH/eMn5S4+f6wqWhu5yWozhuo9PVy+e7bGexyRWNlMP6TKCtf@vger.kernel.org
X-Gm-Message-State: AOJu0YzivLG/7br0DOmKyWtWAylBo7eKABsFFdPJPYCJ+wMFozIVGRxs
	UkrlLUEfHMkGARQtuSYVJ96500q1pmCWHDVcRIBKDPogduKwjRfxPu1ZVw==
X-Gm-Gg: ASbGncu+RAcHDaeFmwbzNo+mQfKfA9uNuQ11+qzPMfMZ99rR5W/yHpvKXNTzxAUfIvK
	eJGAT9py4Ix6/aSZfnQ9cG0E4qHsQZgi4sCfEBLsAJPWwY47421b/WbAyBu09hEf1Ig/m9aZi6t
	mPVlY0l4yHGhnEo4WBOFI4tK2IxeJARZbUM9BIwXWM05xEYA5izwkrWZtuSFbthQKkoxYLMKjBb
	/u2Gldxh/36zo8YptRvYp+S3MpzYAT9WqVW5ZJNO4fKHLcdWNcd+YyVjG/5ukkkeVPVq0zzCHl4
	hlsEEUK1ExlU7j7PfpmK1myMUM8V28er0Y+cMiMjP0HYjhU3HeJho0xfhlAjiZ3FjT+TGFWhewP
	W+xpXrHcWhOp3bOVI9j5oaA==
X-Google-Smtp-Source: AGHT+IEjVOH0cbgp0Cn3BQSndRXT//QCFT+iAuFmZ0J4tEVy6BjhZuTDOKomi+NcIz3wdVSRuebPhA==
X-Received: by 2002:a05:6512:1586:b0:54b:ed9:2cf6 with SMTP id 2adb3069b0e04-54c444fdc93mr383432e87.32.1744177412917;
        Tue, 08 Apr 2025 22:43:32 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c455e5f2csm45868e87.58.2025.04.08.22.43.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 22:43:32 -0700 (PDT)
Message-ID: <62f78786-f9db-4e05-9001-28b786df669b@gmail.com>
Date: Wed, 9 Apr 2025 08:43:31 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/14] dt-bindings: regulator: Add ROHM BD96802 PMIC
From: Matti Vaittinen <mazziesaccount@gmail.com>
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
 <b233f08a-ac8a-4670-8b32-8afc8a7dfc0c@gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
In-Reply-To: <b233f08a-ac8a-4670-8b32-8afc8a7dfc0c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/04/2025 07:30, Matti Vaittinen wrote:
> On 08/04/2025 19:16, Conor Dooley wrote:
>> On Tue, Apr 08, 2025 at 11:40:41AM +0300, Matti Vaittinen wrote:
>>> BD96802Qxx-C is an automotive grade configurable Power Management
>>> Integrated Circuit supporting Functional Safety features for application
>>> processors, SoCs and FPGAs. BD96802 is controlled via I2C, provides two
>>> interrupt lines and has two controllable buck regulators.
>>>
>>> The BD96802 belongs to the family of ROHM Scalable PMICs and is intended
>>> to be used as a companion PMIC for the BD96801.
>>>
>>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> I think I acked this one on v1, no?
>> https://lore.kernel.org/all/20250326-candy-endocrine-2e7b2182e53b@spud/
> 
> Sorry Conor!
> Somehow I managed to drop your acks. Also from the other binding 
> patches.

Oh, actually, I didn't drop acks from the other bindings. Seems like it 
was just this one. Sorry for the confusion!

Anyways, all should have acks now - Thanks again for the reviews!

Yours,
	-- Matti
