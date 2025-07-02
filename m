Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5741269830;
	Wed,  2 Jul 2025 19:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751486056; cv=none; b=urILNZCzprDDxalSTxRHQyxH1pvW4bvY5SO1nEqd/xw+XS3DDnCM1UflZoYduMnALZrjM7U0fS3Eolkzdl0O7lUMw7+w0jN4ZcdCT4xGXmYwwMSX0jaV3XQMIVyyvclQHV20leU2f4gN3W0AW5kQmcEpzEi7CuBNiq1qGSqEXTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751486056; c=relaxed/simple;
	bh=wwz1hIB1NXjK34VbesMPuAkjSQZMf2atfDZ/9HclXM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y88Z8AkQqQP6OSG/xV+BM62036fKDqbWcgfmdc6ISc8r6mDsn9yi7n3Tyv9gRs/2AUBp25Xz+htY83fg0GgIzMMR4y/1c/0Ny6Dv9uCjTLBGwT6Wr2UCHy87scSrPynBkzw3BsfXqqS95h4ihVGKV6C3U13uJjAuh6450vUsmmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IEytrSfF; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEytrSfF"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-60c3aafae23so598513a12.1;
        Wed, 02 Jul 2025 12:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751486053; x=1752090853; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TmPW8V8zA0N+0RM8g3oXGj0lKhBGP6NeWfr9DyiUeXw=;
        b=IEytrSfFNPW+X/mgwDoF5syOcdhDieFJIw8UorwA2SWZpX2mtgUYxzI/wCeGx4yxwp
         6fEgHghggN8Li5S92S02tvOQZm1aaXq0g4GvJn0P2l/4Y9MQspVIhb1kxckvJgtCsXOk
         PVddyhn253kHPPeipE7yow4WhJS1kv6n/TIuPlaFbZWjOuJYZYK68mA7tyDoxnq6F9cG
         m/IexDXUT368Ol7EIeQEZ4UWIwd9cmTly5nnvj4apl4Ef2fvla/LUl+a7fR5/1ZET7Op
         /R+BqvjN+nCQ7eLIo+w+L/9Yq9iGS306lwjSWc8a4JZRdH3II+KlcyGj/TyHXDpJEu4Z
         lhgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751486053; x=1752090853;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TmPW8V8zA0N+0RM8g3oXGj0lKhBGP6NeWfr9DyiUeXw=;
        b=Z4RkHOuWfDn2VyHdrRs9U1fGq+EYWXmEssfbVe2zJxsplKiNlbZv8Hbz+DM7EabJQ3
         NJysZhgPEqulEOzCvWrz8LhLK95iWOQF1NnOn9fwf37ixcYs1COIc403+Uotwpno/kyv
         56TnA3zdQBij2yeT/CzTSnWBM82kHqSYEx9TtVLlkVlhBu91ZtEEAifx3NP7SQyKLGBh
         EC6dBKx9xhw1a9e18B+Esx18i3gtgyK52UXxwPwtoQ5sUtfe47CAGXmBJJoqUcmJCKCw
         x78xFip9pN1VNufz8HfVrFlbwxFKi0/MJcs0jhfwo/4xaJGaOhEsGa0e7+VpViLE1k6X
         6cvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBXC8jLc+kRZUtNe4fX7U7uowReiDWaaD/GIaGHYByiuCGZlFOd+txM8nfLY7p8OdR0OJg0hKyTADF@vger.kernel.org, AJvYcCWT4qMNoK5LVCIqeGcGhnZcA8ziv55OmlT3WkSMnW3TbsYH1Cne22Mnp5wFMd+K6Z5OzH07n9Z8Xqa52/Ay@vger.kernel.org
X-Gm-Message-State: AOJu0YymalxGMEiINgg/dKr2fVpwJB1lX2Kt8z5TNADuSmfh1jVGO0bx
	EAJiVs75Lktx91w1s/ktb/uEw9S11obGGSHShId0reA5WFZIciRaHHOx
X-Gm-Gg: ASbGnctEmrggvMF3IlgVQUSjPx1i8DSP1FYIRq8T8SHFB4ruNIyzKMLkwGcpOrL/Sm2
	9vKIxENklmaoPu48YzaHOy+eD0+WMAUwYI44vZI58YbSGzgUH6Gi5+RVaIj+CkFxKRryQeevXgi
	WeBzKeJQZi/Y24vS7xqcQmrOYCllPZ+g1z7DFdSvnfSsGaaAMx9KRQi68QGx5b8EmNqjCS3amOH
	kFlJz/8Aid3db1oyPXZVfx8E+vBM7YsyYEHokeUDLdlRXL5o58jfUcvbZedxAvTdiJP5vpM4VwC
	xKdgM/lJYW/Y/GEwDEmx9Q8toO7+OSL8tdR00Gimr01UXW+Fkp9PzLhsILboC50/EPk2KJoqqnI
	HQTNBlxCSD7O6XQ==
X-Google-Smtp-Source: AGHT+IEEv4SAI/kYMvjmT0AuIHDgZyTBNcF2bWLyaYLuZrid3Rgx7jF4/Zg1edoD8uel5WIfiOf7DQ==
X-Received: by 2002:a17:906:ef0c:b0:ae0:a464:99d with SMTP id a640c23a62f3a-ae3dd3c1e03mr18767066b.17.1751486052730;
        Wed, 02 Jul 2025 12:54:12 -0700 (PDT)
Received: from [192.168.1.129] ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353ca201asm1132959266b.150.2025.07.02.12.54.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 12:54:12 -0700 (PDT)
Message-ID: <c3deef24-fed7-4405-9953-804bff118c11@gmail.com>
Date: Wed, 2 Jul 2025 22:54:09 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
 <20250610160152.1113930-5-laurentiumihalcea111@gmail.com>
 <ac1daf6b-ee06-4076-b86f-b436ca0acd6d@sirena.org.uk>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <ac1daf6b-ee06-4076-b86f-b436ca0acd6d@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/2/2025 9:49 PM, Mark Brown wrote:
> On Tue, Jun 10, 2025 at 12:01:50PM -0400, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> AIPS5 is actually AIPSTZ5 as it offers some security-related
>> configurations. Since these configurations need to be applied before
>> accessing any of the peripherals on the bus, it's better to make AIPSTZ5
>> be their parent instead of keeping AIPS5 and adding a child node for
>> AIPSTZ5. Also, because of the security configurations, the address space
>> of the bus has to be changed to that of the configuration registers.
>>
>> Finally, since AIPSTZ5 belongs to the AUDIOMIX power domain, add the
>> missing 'power-domains' property. The domain needs to be powered on before
>> attempting to configure the security-related registers.
> I'm seeing failures to probe the audio devices on the i.MX8MP Verdin
> system in -next which seem to bisect down to this commit,  I'm seeing
> separate boot failures on the EVK so haven't been able to confirm the
> status there.  There's no obvious logging, the dt selftest shows:
>
> # not ok 141 /sound
> # not ok 142 /sound-hdmi
>
> Full log at:
>
>   https://lava.sirena.org.uk/scheduler/job/1530197#L5119

Hi Mark,

Thanks for catching this!

After browsing through the provided logs it would seem like no device under the
AIPSTZ bus gets probed. Right now, my guess is that the AIPSTZ driver is not being
compiled since CONFIG_IMX_AIPSTZ might be set to 'n'.

Which defconfig is the CI using? Is it arch/arm64/configs/defconfig?

Thanks,
Laurentiu
