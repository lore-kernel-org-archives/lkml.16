Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79ACE1DE2A9
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745475477; cv=none; b=aTdl0w1gX43zL4npGlzs91b9jc7Um/TMVcz7xNzBOlHMhp1886eC+Sgt2qRMg+aRjMMhUmKWz31GIhPGJn/KINI/NLc2mW9hjG3XhPyOtB1aBDYP8U6fbVHqzZbdTum18RDDna1LzJjGz5kRMxAUL8A11V3VnrKvYf267n6CpE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745475477; c=relaxed/simple;
	bh=hyHUJE9U+MoYH8hkG0p1Z0k7oFnjPW5T/gGtMe8NGhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XLdxqkgiHVj/7COlZwxzEBzRgXx6d5BeBhnNpym8NWrAV93pTwJY0X6HfZLUExvncAyUYYWjkftwnICwlPf8NdIv0AI9rEmz2USc57tXhHcMx+U6bJ4ARza2F3h6IOUOsuyCfNeEV5XrKDhKgpKiRsajXI9W/kfEtOlGi3t3oqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vSvZ1W6W; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vSvZ1W6W"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-acb94bf784bso7748966b.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745475474; x=1746080274; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rklllEBObx/x+b7n4H4TEO6tJG9bMtiQ3JNDGpRuTl8=;
        b=vSvZ1W6W43F1JDcFeF6Zwvh9USqLzga+6IB4ux7+N+IqBVDzq2on8951lakvyXCFz7
         9UooBCRoj64z3ZO9V1yEkTtyP/ATtkaAnqFYqwzfh27aZchMGPTugxHqUFAmvowIsVhc
         x+C3HKJJXotv54vrF5HKdwxiOi/vRcyYMw3g5/O4QFPuU/BRfYWYT3iWk21P9ToB7LP1
         Bc6Aqzm4rhxnsmgph+EtnAL2OhkDcvrAIAoyjjAEA7lunMv+XGcM49tjIEHo8TyMXBTH
         8Wy1GG04+c1Pyzc3l2sqcJOOMSjI82p55zK5CW5cyw3QtYZqjbAoNwhk7VAaCt6v4d86
         z+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475474; x=1746080274;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rklllEBObx/x+b7n4H4TEO6tJG9bMtiQ3JNDGpRuTl8=;
        b=LV9Kgc4gCC6fMnvInEMqO4n9SQaXVrRvYunFBCoYIDisc292ehqW9rFCnfMhsLWurP
         YVI4jSrbKz0MFFFuEJduvZTA7yov+77RtBewoaJW+uElrzsZRS4K3uvX/B1Tv5IfS2eO
         /gmA3mJmT2Rn+z65ufNrGLRSIAba48Gu+ZUCB1U4wPgAub8/iObtkvbsT9PLa5UB+rkr
         GJFEcHa5mRegLvFd8a+SNtdXFe4d+xMHYMM7rFy72spo5Pqt2YCJSyB+Y1t7zGYRPt2w
         mKQNLMRQhs8LstNaq7KmOFHzBjiNmgrf2RZjwk/YvXRMZ2zGU18ipYx+HJe54tXCsoRn
         ajvQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5mT0cHVr1BgU4a4RiWmyh9iNU769Uw+OjWuT96CRuuN8gsQHYcpAxzHE4dvqDLJdqCnwXSCXuEIUyW5A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6POj5ZT09yycYcxReJI6wIBLyaznSdefhKuRitzp6fAbmN2Kc
	aYqK6shL0Fi87OfglWNi8OIEGW6NmBe0DuQzQw5U9GCSO9DAlCOP1CN5UjAycIo=
X-Gm-Gg: ASbGncuQ5QWtHjY1lyPtFHcHyPZuQGSwkM3EIXm78JxzeuQRPQxYeprLHHclk3JsdPp
	P3EiWK+tbfb6HrsGLIePg6GwZIb/zS3nONxUjtFG7i69jDkHT6OUxuRpnqcwk7fCIvrHIehetHN
	8pnVurSdeJ7ge7yvFb31Z4r2gWA9a8JPvlCozeH3PMbNKAg7TyBuTtPxk0yFEtVI46bF+QRL2Ov
	JeHtE0c2FvnVmrwyWbAYNIIdDmXeLJmng5DPzpGuqjfbNpOuPra0SNeI42YvCTx2OYofvC2Vhz3
	TXdcv8VNqlEA2KCWz3JnbOWxJoxuoA9ixniaPLh/pzhxzkVsyxzmDqStaUE=
X-Google-Smtp-Source: AGHT+IHkeVDI/7zTPMacv2G7VBrbvfTY2jdH2deHU7UxMb5EBF8jUdCXPWFE+sUo0DSaRIj0YJezBQ==
X-Received: by 2002:a17:907:8687:b0:ac3:f6c9:4856 with SMTP id a640c23a62f3a-ace56e63dc1mr47965166b.0.1745475473766;
        Wed, 23 Apr 2025 23:17:53 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59bbdbb5sm52554566b.90.2025.04.23.23.17.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 23:17:53 -0700 (PDT)
Message-ID: <121d4e01-00cd-4be5-acbb-b140188048c3@linaro.org>
Date: Thu, 24 Apr 2025 08:17:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: arm: qcom: add SA8255p Ride board
To: Deepti Jaggi <quic_djaggi@quicinc.com>, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_ptalari@quicinc.com,
 quic_psodagud@quicinc.com, quic_shazhuss@quicinc.com
References: <20250423003845.3980330-1-quic_djaggi@quicinc.com>
 <1d75a955-409a-409e-8708-754e89d6f046@linaro.org>
 <21a13826-0ee3-486a-956c-153f42477160@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <21a13826-0ee3-486a-956c-153f42477160@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/04/2025 01:54, Deepti Jaggi wrote:
> 
> On 4/23/25 05:00, Krzysztof Kozlowski wrote:
>> On 23/04/2025 02:38, Deepti Jaggi wrote:
>>> From: Nikunj Kela <quic_nkela@quicinc.com>
>>>
>>> Document the SA8255p SoC and its reference board: sa8255p-ride.
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
>>> Signed-off-by: Deepti Jaggi <quic_djaggi@quicinc.com>
>>> ---
>>> Changes in v3:
>>> 	Removed the patches from original series[1]
>>
>> Why? This makes no sense on its own. Binding goes with the user. No
>> user? No binding.
> 
> Thanks for taking the time to review the patch.
> All the bindings that were initially included in the original series [1]
> were removed and posted as individual patches.
> devicetree has been posted as a separate patch :
> Link: https://lore.kernel.org/all/20250422231249.871995-1-quic_djaggi@quicinc.com
> If necessary, I can consolidate the bindings and dt into a single series
> for the next version.
I asked why and that's not the answer to why. That's description of what
you did, but we see it here. Anyway, I explained you the process.

Best regards,
Krzysztof
