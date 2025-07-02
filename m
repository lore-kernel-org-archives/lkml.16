Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419BD2E7BCB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470314; cv=none; b=ZH8rYxMOnKe8SWVWCZd40uSMIKbLUqsUktSWnYWC9oN/+JF5Io0oF9osbX8AO+ky6v3Ym+30gdpfxEzOXBfHcKUe6wLJW3tAo5C0kajnNJ03f7TtHy1JBx8ZS4PknNFDMzqHL51/GZdtmKLQQMxzkpE1rfHtmSX/IpfsLYezT4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470314; c=relaxed/simple;
	bh=/1kRWoC2EsLIFEi+ZoNxnFy6k7VTG3sy3RXoHv/e3nE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kIV97WzeVbI+E7aazgK5g5ESMtCvHwRyGeWr1dAmSCzSe7cE5Js16HAHUVePVUj6gqaaVwQpjCg0KHp/eiwmeRhfyVXKcdhH1pDkMyitxvLr2HMlmetpG/JXFx6XVBuvHblBU7Tkaw1YmYF231RRZFxUAmMB78AdqBQ7hPbMK4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hV4hAe1F; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hV4hAe1F"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4e749d7b2so1218271f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 08:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751470310; x=1752075110; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LS59bh+aYEEoA2xZkY56WfoUxH9ABdUpUJ8WT1B/mAs=;
        b=hV4hAe1FHqB9kXnKN3sHLNfDx8lxk36b8xdKs045h+9NYQcRUe/FVQsX/V9sLK2yHf
         j4KGYKCQYH1TYRudRJnuq0zHRnyfVLFOkihBi6ChiyCyV+CUPcGtsZkEQ/MKIPd+PdQ8
         FXiWkvzuGGFa/nynbx/PItp6bZEHgj1V8sfoKVe3mWmMb4XfhrY01iMrqqc57z4S6Udf
         HYkl7FHXuSp/Xhs8IlxTXL2WK7KAafJT449dnGfI2AIV04mWoZCPAfcEcwg9P7J+U7hH
         HBgNlL66JxdLaPkjCG1tozXNrjxuR/+rX7fS2ZMtqH6W9oKwj+NhEPmoNvoTCO6KaFmC
         39cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470310; x=1752075110;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LS59bh+aYEEoA2xZkY56WfoUxH9ABdUpUJ8WT1B/mAs=;
        b=t/oCc/4n72PwoUgucjdt5J5S/h3tUJ8LPl1BAuU5YJ17bm6qQIaWFLt5VQgI/B9RBh
         W8PrxzTNmFxU0/j7flunoyGkRHhIeSSNp2rvIGSTcd9GWXt+0ufGMT+v+nn7w3lGr36M
         NKceT++1930bEr6SY6p4N1itFJivZ65tcTmVf7waVafu/iFtK2OFpzADywre4wO/nmBu
         1ziIvZbuvig5GqopnNSq+1BjF64qVzWhzEpdZacWH8rJn+flfE/T44gDuIKUPB46UELn
         HSinc2Q5D8i3ecNgd84DPsaQrJb62Pf8vUHHXuC7FW4bpRk0WeMVJZcoGoqxnUehrR2R
         dWcQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1gboh1lsB8u3TSml+S+2hxa/PfrzJbGTfld9OG8vr8MGCaLCjof4xyBFHEcSqFKOarGYXp1vSG7PMg4M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxJbO+IzibEjADIKa9OqSeKgu2pxM0+bE6XfHzwSTxZvN5ytCk
	U75LVATjM90I11J5ZUWcE4KNO+2VDIYG7dsxZiwEsgRaW1GWUVu1XPxIchetnSGQYC7ImYgSc9p
	k+XJc
X-Gm-Gg: ASbGncuvPrVqMoqjBPZMINMSH9GXGdzC8/SnDRPM6/cjUZ4Nz2hSj4p/xoR+lToLYs2
	2G8KZ/2ijU3unsyS4k5ar46+3//Yg7HBIZYocerM3eivqKZ0dVRza/EdaM7Tu0luF3oIVYcJMX+
	5VnUeiSC5EMA7vxh4MJo0oIYiVs6udpqvJeOahtBCYmhjN6C/7OP49wFYRupJ/AL/hT8yp49v6O
	eOshlFwG/uyCj8KALojRfuK08a+FLvTCqzivaOhXCX7h3KKqNRo/13HSCqHH5b6UBV05IHE+ZVV
	3YfxHDkJSCtVsatMwbZo/h5eFCknHBcovn+rSl4dKocHb5NXWBQCoWXNvYpJ87Fl/1d7rhpVdPv
	h9EJ50w==
X-Google-Smtp-Source: AGHT+IES6iUbDyize6ToIJZ0dWMNbjtXPFT0gpuS9it5XKMDA3ArL2EKriSzAXWLW85soefAH74ZZQ==
X-Received: by 2002:a5d:5f52:0:b0:3a5:1306:3c30 with SMTP id ffacd0b85a97d-3b1fb064480mr1055958f8f.0.1751470310428;
        Wed, 02 Jul 2025 08:31:50 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52c8esm16506660f8f.55.2025.07.02.08.31.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 08:31:49 -0700 (PDT)
Message-ID: <246f847a-df24-48a5-ae8c-97fba7f5b3cf@linaro.org>
Date: Wed, 2 Jul 2025 17:31:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: Be explicit in naming of VPU2 power off
 handlers
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250702134227.211104-2-krzysztof.kozlowski@linaro.org>
 <dd5717a7-9476-4207-967f-a30e7cb3b3e7@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <dd5717a7-9476-4207-967f-a30e7cb3b3e7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/07/2025 17:07, Bryan O'Donoghue wrote:
>>   {
>>   	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
>>   	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
>> index 93b7fa27be3b..8f63f243dd0d 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
>> @@ -24,8 +24,8 @@ void iris_vpu_clear_interrupt(struct iris_core *core);
>>   int iris_vpu_watchdog(struct iris_core *core, u32 intr_status);
>>   int iris_vpu_prepare_pc(struct iris_core *core);
>>   int iris_vpu_power_on(struct iris_core *core);
>> -int iris_vpu_power_off_controller(struct iris_core *core);
>> -void iris_vpu_power_off_hw(struct iris_core *core);
>> +int iris_vpu2_power_off_controller(struct iris_core *core);
>> +void iris_vpu2_power_off_hw(struct iris_core *core);
>>   void iris_vpu_power_off(struct iris_core *core);
>>   
>>   #endif
> 
> I prefer these names with an explicit v2 more logical/consistent with 
> the hw names.
> 
> Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


Thanks.

I got some patchwork complains, so it seems I missed something which
clang did not catch. There will be a v2.


Best regards,
Krzysztof
