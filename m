Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A191F91F6
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739275033; cv=none; b=QG5+4PHnFpQC7q0bs8PJiN1iolT7SpPXS+qeC6dJSwEnisic/6xBh5TGvkuaUJE8fZvhEJKyPTYCDE23lMXgRzzpdbL7Ih18gCGTs/HCeo15xpaHCkeAcyrEyhAbW7HcAAWPP9DOBzXmHW0BuDsDoivqpX7InkxOMqm1ZRmeD+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739275033; c=relaxed/simple;
	bh=vpI+yV0dwbmZFIhRaRGyW8a5HVtO/K90AaYY0HmkYxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N0njscVrczYzzeAO9xXFlhG1OroGxQEbcJiu+VP5uj+yeQITPWNG61sEfCpr2lIUv1pUZuUfkCxfw8ahdBEQoeNsOJotoxHCz6aF23PjIfmxbYqkpa9OcH8smS24NWOKK6fmOmOkKqH/j9GmZSn1h/HqmZWfPK9oxv0wqVbgxTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AIyPVGkJ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AIyPVGkJ"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38dc33931d3so2402224f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 03:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739275030; x=1739879830; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x+/rKU8hND2RosjvAKGWInz1qgNkLNHLXSblj/1XFjg=;
        b=AIyPVGkJlgcML6BtskWNgRrGfUuf9CBdc6cgkcsCoa3i+KMlwVsOueaISXXdmgZcDZ
         0sTXWYKKIBPGT4hPQFRacfzfSE25L0sysAGAYvi395QM7JVcmuZYRDRhckGII+KrZP7R
         2uF//yw2DEXlSY5SmpOpJUdBEKTvAp6/ZmfWE3S6wF8HtOC1BeJrN3P42cHtK+UoAYFK
         hJQ5boYIUIUz8mIr/Mcb0NNHccZ3Skd6fJlAahADpL4HANcN+rId25PuFwEBTntX+/iM
         dcJCf88NGq80TBAMoqJehV/iBPum2qpifWIpfW63refMjwOHU8RxNrk4bIVaAzU/mFL2
         Wnmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739275030; x=1739879830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x+/rKU8hND2RosjvAKGWInz1qgNkLNHLXSblj/1XFjg=;
        b=IY0kV1fUQwV2j3ac04JzguBVVoI8KLWokN4tABY8hFwGb3wznbdfWX67fNgOIt3D7F
         C4hf3ojfZN9L/u8sMeCbCSozTw2piF6mGy49FZRp0qsoiT2Ds+gJnLF6AwcIKFshpZg/
         igqKO1ep8I+0d1liGTN19u+WzUwPM+1rKV1MeOQZn8281ko6rn6z9tW5V7BECkiTAfd1
         lWoMdhN4a9TLMB7NZ293pW6mi4WIQqFpY4CJX4wtp1zHUt7fmHjB7AlNM4u246N4O9zV
         fNP8i9MrSkMTQu+2+JocdAbG6M02YI15hFq+3PZTFlAgp38W2c/dJCJXOO9DK2wzJiLA
         ttXQ==
X-Gm-Message-State: AOJu0Ywf/MpaKRxR4rCiXFjZ4ABRk1MKNQrEcDVnK7u564RdnWh3Uvxp
	NRpjSkt69DZ3RqZ8wK5d81deWPlqKlTaQZMgLeFLgCjUw35Ft8WbPwZlo1d0Swk=
X-Gm-Gg: ASbGncsj2iDKpkvejZwDKYxujNLL6tk+VA5sQ8kN2p5taEJba6b8wkIpCmARo9axyo2
	7qcqFqrWozZITRRDoxVOkUNdj/jDfNPMu/8Wo+/3BdcPo77+ZJD5N9Kcna6FOEWi6frXINvCPz0
	nOcDQk7oRk6nzbA9bVZBdiDIAY+KoM/XRk56/i/BpjtxP9Ix02E0dUMEBCakLlGPaXNeety09ET
	LOj2+lJOzMtZUvdmQ5wyZ5ufV5cLtgrzqKo9afnn2pJMiBoe3H2epDHy3ROSibyhln+yaw6BRfS
	5ChCeYwuZJyNXZmhMAeb34tD
X-Google-Smtp-Source: AGHT+IGEDbZ4F+KtHnkoF3QqtYj/Mv0BkaXQoyniQIaUjtGof6BuGlXWqpwnecn1thdzCU0aThGJqw==
X-Received: by 2002:a5d:64af:0:b0:38d:d0ca:fbd5 with SMTP id ffacd0b85a97d-38dd0cb6a75mr11977488f8f.22.1739275030079;
        Tue, 11 Feb 2025 03:57:10 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc0c5a894sm14314088f8f.95.2025.02.11.03.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 03:57:09 -0800 (PST)
Message-ID: <bad87f30-0483-48c1-b263-02cc752c77e6@linaro.org>
Date: Tue, 11 Feb 2025 11:57:07 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] dt-bindings: firmware: add google,gs101-acpm-ipc
To: Diederik de Haas <didi.debian@cknow.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com,
 peter.griffin@linaro.org, daniel.lezcano@linaro.org,
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250211-gs101-acpm-v8-0-01d01f522da6@linaro.org>
 <20250211-gs101-acpm-v8-1-01d01f522da6@linaro.org>
 <D7PJTD3PSP78.27N2S94J2CNZG@cknow.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <D7PJTD3PSP78.27N2S94J2CNZG@cknow.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/11/25 10:36 AM, Diederik de Haas wrote:
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> Shouldn't this be ``(GPL-2.0-only OR BSD-2-Clause)`` ?
> 
> AFAIK it's the recommended form since SPDX 3.0:
> https://spdx.dev/license-list-3-0-released/

It should, it's a copy-paste error.

Looking in the driver patch, I shall update
include/linux/firmware/samsung/exynos-acpm-protocol.h to GPL-2.0-only as
well.

And then I shall s/MODULE_LICENSE("GPL");/MODULE_LICENSE("GPL v2");/
everywhere as "GPL" indicates [GNU Public License v2 or later].

I'm going to respin everything to fix the License mismatch in the set.

Thanks!
ta
