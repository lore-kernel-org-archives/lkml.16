Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99021F7580
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744878455; cv=none; b=lgcicqsDLAGjlkE/QTNGiRiYrXlBVCGDe9S5GDrjFiyS759EYqgG7r8TfucUZc7N4PHwnxgYU7+Xqx5SE4brAUJCPOwDRVFcZVji/L9/yhtDiaRLo4hPuxXQh1UraEAArkqP7vsjx/F6eJ3efXCpuD6pjOhZE0WTxE1RqXdF/6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744878455; c=relaxed/simple;
	bh=Ys7turLPNUrCbQ/IqSXrDiwYLViP3PKPFaDGr1MT3mM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZKIReBf8GwKpGCtd2lf29GOFHz8J5UnH/vS+wivbW1O+gyTPjUBKCBgiuSyHzZeNaH33t0+ZZOUeD/+CfyMD6rO38bvg6qRXsT/5d8SBRPpKUvZRuIfBmEpeEofnE1NRHSLUEODdtR18OJGeJriMm/Yd/T2rfYuhSbj3Y7ev6P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=brim1i8g; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="brim1i8g"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d72b749dcso144725e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 01:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744878451; x=1745483251; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f5PvR3AodARroRTyuj8IWmURh8VDNFVUppDggbzQxys=;
        b=brim1i8gmk9uDMmdzM4k5IZ3ddMIC1HmEpaO4t/+LR9skPYAf1Ne6yZB0UPa0fvVhc
         dmPPRKIZqSFpXrHCtpZ0lKa8o9SLNH+/Qe1I54BAmAE74rmLnYiIkfTaAPYdupaanv52
         kEx+68MqkjcUDfXoKa3v7ITDTPbN3PP3IXn9qCnCK0Fj8ai7O93VTAASSm70oDPzapzG
         QPYmjZG1BzvZjy66jpMLPpuPiQFNYBrKlRN3DkAKOgv+7Kz/vUNHYMKHkCavmWQfhqow
         PC14M1hxmMOsHfmE74GGrWlsnq/OghRdCShpJugoMCZTx++iPB/PBYlxJr6y9cA/I5Qq
         iR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744878451; x=1745483251;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f5PvR3AodARroRTyuj8IWmURh8VDNFVUppDggbzQxys=;
        b=h2E7V0i2GZyNhBc/GoChbn4lu6YiYVlBd4R7FqKKRC6UwkEdJpIb/f4tOIN6TxoSi/
         kdBNwFTTuCfAdF26BTMvDeY4sjZFJ6xWFJ0N2KoPSNUOPq9D1aqvSqFsE6cmZFwrGn7K
         4OQ5vVI/T1pO9GiM1T3Gfw0d1KGfZwvHu6H3AuIZPLVd81pIFqEiya82AALTQRCtMgd/
         hW5zaKON3xibBvjqbTS2UbGqncz9zH2sXUlTT5Hx4iooqig4fOL59RCg53Vtr7Qj/CpH
         eWiQFWrOKqntzBaYC5X9zWviHr1bxvod6Lafv/0C6rEDEqs1N6Fjmn4+Jli3oGdzENIU
         AMBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk+gCyhn075OKhbKB1zOw/WeaenI4+8mR3K2MpJxReYAuyLQukaGWvYtRJxN3dPzCV6gZLRlycztkoKiw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl4YTGbEMSg7xJ4KYNinFaiWmThsiy2dWVqWn8UektuvVIQKa7
	7gmzQCzuTvej9qMEn2XhYb73rx2TV0YqBnLSUmWlXq/Oa/b0S1y99jvDg8heThCk/8E/tgP6njF
	t
X-Gm-Gg: ASbGncsXKORb8y68VBYXfWM+fxbgozisCxbp+UEsq/Ety8Fp2XLynRvJXTYODlIv+IB
	8bMfc/cWh2R2AruX2C0IM8P+4G6ATQ+EEac5LyIFpFhXsrI9RlxS7Z6qhjDhSeAdJGJPZtVhjjv
	L2SP0J1L31g7pvB5nwzKH3zeu751elrvg4m4NXdXXqpGGyX9AUIYA5g/PXZ3Bb0t1kCCVOCEQOF
	FtfMjSeWAH7lBpxaskmed6msLcBaH248Z0gT2CanfSVX0SQjaYgU06qKgLELBSOy0kaS7iIBSMY
	Png7USKA5pJXjMEXI7BK35RcV8dDV3zKrxQF6/1TYh496EegWhLskIvn5jrRnozh60DD82Af6vQ
	bwg56ydIkp+eUBFlN
X-Google-Smtp-Source: AGHT+IEcGbORPITh0fLvXCs/AzuHGYG5B9pgjdozQySOTPwc6DbyW89ut0VlnjxCwO44OoH8xIv1Eg==
X-Received: by 2002:a05:600c:b90:b0:439:9a40:aa1a with SMTP id 5b1f17b1804b1-44062a3b804mr6837235e9.6.1744878451200;
        Thu, 17 Apr 2025 01:27:31 -0700 (PDT)
Received: from [192.168.0.101] (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4d3523sm44540455e9.15.2025.04.17.01.27.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 01:27:30 -0700 (PDT)
Message-ID: <d4bfefc7-cdd0-46d7-aa0e-d038f3c43e36@linaro.org>
Date: Thu, 17 Apr 2025 10:27:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: host: omap: Do not enable by default during compile
 testing
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250417074634.81295-1-krzysztof.kozlowski@linaro.org>
 <2025041747-cruncher-exposure-590c@gregkh>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <2025041747-cruncher-exposure-590c@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/04/2025 10:22, Greg Kroah-Hartman wrote:
> On Thu, Apr 17, 2025 at 09:46:34AM +0200, Krzysztof Kozlowski wrote:
>> Enabling the compile test should not cause automatic enabling of all
>> drivers, but only allow to choose to compile them.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> For longer rationale:
>> https://lore.kernel.org/all/191543a8-2e2e-4ac4-9b2b-d253820a0c9f@app.fastmail.com/
>> ---
>>  drivers/usb/host/Kconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
>> index d011d6c753ed..6dedacba94b3 100644
>> --- a/drivers/usb/host/Kconfig
>> +++ b/drivers/usb/host/Kconfig
>> @@ -225,7 +225,7 @@ config USB_EHCI_HCD_OMAP
>>  	tristate "EHCI support for OMAP3 and later chips"
>>  	depends on ARCH_OMAP || COMPILE_TEST
>>  	depends on NOP_USB_XCEIV
>> -	default y
>> +	default ARCH_OMAP
> 
> Should this get a "Fixes:" tag as well?
> 
I think not, because some people's intention was to enable everything
during compile test, thus it was not a bug, but a feature.

Best regards,
Krzysztof
