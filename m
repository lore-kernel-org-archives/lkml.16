Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC3D220F3B
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748599881; cv=none; b=eeWD+5VxkyTdssd9LNBdXTg8bghHVjPI0w2u8CYzmdk7bqtx50/veF98BQQD/WEI7NzmP+++HS5sMEXLIvkImOlk2QG/liQ2btuvQulgT9JqJpVAxIJ+vm+pfyYfUz/6MjUr30YWuDhyM8P+Rgk1yIY8OD15sYsTZM3OHoMkKlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748599881; c=relaxed/simple;
	bh=BtgiWbtyObg4xFKH7C8Tduzp8RP6HRLtefwrW+i2WLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f6obQqiIPQEaCrRhYSBAYWIKZqI1z+PYEhuRmu32v3R5fCsMx21wYmxLxdyrzPOk+owPNTT9KlN98AxN0OjMWMTP4JhjQWlsmATMCfRiwErkCNarLnUO3TLg8cd+Q1+Y35Osr6iVxtPusOfimVKz94JMQpipg9lNtVjfN3n8EG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MEXI23nf; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MEXI23nf"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a374f727dbso1543974f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 03:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748599878; x=1749204678; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w2uvJQQDga9gpIshIa1ROf0lj+l2p+xM+9sY9IixreE=;
        b=MEXI23nfGNOhAh4nJzWlci373SRWGwDGVyPXdMJxwL/Ug+KO78CEkPVilIyDSlnlF5
         sVQb8jplnd9SxGYWx+FhMCO/2e9jUZYhhnWk6V/7bq5FignpBE9uX+Wtzvz6PhSmJujr
         heFblOgB4L6DosbBoUap/t7RECiKKHSjw1idHg+MNY/oODXqAdngmgkZVsIHVHSchvXG
         DJvoC8A8zaL0stufC75yQ5nE2/MjswI2QfcgVI35/7pOJDprR6Ir9Y9i3tttN9q5GdgV
         QnDfm5iiaepyaaLshzp71BAsnmPuO67/mOVEhXAIltyjlgaY5fBetGeK5VkF1Mt4HqSi
         gLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748599878; x=1749204678;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w2uvJQQDga9gpIshIa1ROf0lj+l2p+xM+9sY9IixreE=;
        b=oB2/9zcf9wXfQgwWnlFHrF/1hPTMb7AyCBCEUcDGKma3ZXzfpHciaBVzffhlNDpduM
         eH5F+kRH2Q2dAFK+fWXQXb+h9uzAy4NxlICJJi8SczzI9duZlYwMgeS0dZcDHhRV+p7C
         +EHn2Gn75yDqpIQzkfQeO1deUwKV+EIKQIAf0edLPgtPL1qXECHdpNUDgxkNtx0DNJqo
         EwbRyxAH2HEgMw2lKyVNF5LepjYuWWOT3rcpm4hHV9HHkyMw01JeVXsy3bADyS/W73vJ
         1q8++y2ZZsNh1EViX7caLKV1v/y/cco6dDGq4lDUFA4+7z9QvaviCOsrXKhUw7kUmIXQ
         cRdA==
X-Forwarded-Encrypted: i=1; AJvYcCWAyV27W+FlVvgz911Oide1bDh6P6ciRsI5BH6urCcPcOKPYR/6lg6i2zuI1sYITw55x7uedwZyAzZLEBw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrmEYMbOU6LCBTzWTxd389/q4FvB+PVAtTmsMOXB1Vg/RwHOp3
	IZA2xCDLzsNAbsAf7dtVju7Bzhhb0Dwz4OJNb0L+DxIvvhmK4XRV8N3gYR03/FXAKEc=
X-Gm-Gg: ASbGncuHzGgxdGLeI6tAzWdUafkEA2/YFs5grVsSt0fFW4J6PT0Emja0i4voUnzSP0O
	fUjzq1JXtFsSsCYv48xg4Vb3o8DK25+R5uQ8ygqSn0HsY7fOnajKFjxJ3UyAzDdZYdr5+1itWjD
	kozXQfZfQAXDLI6p8IUD0B0OUL+ADW183TdqyoaxiiPqWW+wcC9UnvRh1mUzxzRrUKem9xYOmPZ
	TgmBqYqJ7MBiTAjUzGzJpmwW4/cR41pj1ERaQCdA0fhTaRMCrRRZHGYlm7TWGB/w5QzfG5FLQ/t
	lk3P2D4r1uXjKDOGZ4snzEeT2CtQsPD+zw3GGLgdmywOXJtSERKMFTsJzIplrr1Yt3xW9xki68c
	y3/gDGf8v0DckT1rR
X-Google-Smtp-Source: AGHT+IEGpK9wxifZBoINj4a9WAqhHPQBuG6oOIYEnwaBOMGLx5F2IGQmU5aCTNH4ODtjQn5uXNaecw==
X-Received: by 2002:a05:6000:22c6:b0:3a0:b8b0:43ff with SMTP id ffacd0b85a97d-3a4f89a7a30mr1169064f8f.14.1748599878104;
        Fri, 30 May 2025 03:11:18 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8ed27sm13971185e9.2.2025.05.30.03.11.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 03:11:17 -0700 (PDT)
Message-ID: <7f001134-e099-492d-8ce5-4122d83a3de3@linaro.org>
Date: Fri, 30 May 2025 11:11:15 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] power: supply: qcom_battmgr: Add charge control
 support
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
 David Collins <david.collins@oss.qualcomm.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 kernel@oss.qualcomm.com, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <497BF3hThnrmYe-YHKmdOyZwdjP3ivm1hFYDDy3-HkSOvkCOMVSkokyhb859mcTarGb55Go5nJLfgsc553u7ZA==@protonmail.internalid>
 <20250530-qcom_battmgr_update-v2-5-9e377193a656@oss.qualcomm.com>
 <8b396edf-e344-47e9-b497-3f7fb35783ed@linaro.org>
 <spfJeVsefz_dTMqOG1lKaUye4O8Jz-RSdLCGtvPIrDMwKC9rxNNY_zKkBFVhdrPMheNf2WMkPsv7ElI4uhBfxg==@protonmail.internalid>
 <3df56548-49ea-498c-9ee3-b7e1d2d85d2e@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <3df56548-49ea-498c-9ee3-b7e1d2d85d2e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/05/2025 10:37, Fenglin Wu wrote:
> Thanks for reviewing the change!
> 
> On 5/30/2025 4:48 PM, Bryan O'Donoghue wrote:
>> On 30/05/2025 08:35, Fenglin Wu via B4 Relay wrote:
>>> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>>
>>> Add charge control support for SM8550 and X1E80100. It's supported
>>> with below two power supply properties:
>>>
>>> charge_control_end_threshold: SOC threshold at which the charging
>>> should be terminated.
>>>
>>> charge_control_start_threshold: SOC threshold at which the charging
>>> should be resumed.
>>
>> Maybe this is very obvious to battery charger experts but what does
>> SOC mean here ?
>>
>> Reading your patch you pass a "int soc" and compare it to a threshold
>> value, without 'soc' having an obvious meaning.
>>
>> Its a threshold right ? Why not just call it threshold ?
>>
> "SOC" stands for battery State of Charge, I will rephrase the commit
> text for better explanation.
>>>
>>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>> ---
>>>    drivers/power/supply/qcom_battmgr.c | 256
>>> ++++++++++++++++++++++++++++++++++--
>>>    1 file changed, 248 insertions(+), 8 deletions(-)
>>>
>>> -    if (battmgr->variant == QCOM_BATTMGR_SC8280XP)
>>> +    if (battmgr->variant == QCOM_BATTMGR_SC8280XP ||
>>> +            battmgr->variant == QCOM_BATTMGR_X1E80100)
>>
>> Please run your series through checkpatch
>>
> I actually did that before sending the patches out. I run checkpatch
> with below two commands and I saw no issues:
> 
> git format -1 xxxx --stdtout | ./script/checkpatch.pl -
> 
> b4 prep --check
> 
> Can you let me know what specific command that you ran with it?

do $KERNELPATH/scripts/checkpatch.pl --strict $file;
codespell $file;

> 
>> 0004-power-supply-qcom_battmgr-Add-state_of_health-proper.patch has no
>> obvious style problems and is ready for submission.
>> CHECK: Alignment should match open parenthesis
>> #95: FILE: drivers/power/supply/qcom_battmgr.c:521:
>> +    if (battmgr->variant == QCOM_BATTMGR_SC8280XP ||
>> +            battmgr->variant == QCOM_BATTMGR_X1E80100)
>>
>>>
>>> +static int qcom_battmgr_set_charge_start_threshold(struct
>>> qcom_battmgr *battmgr, int soc)
>>> +{
>>> +    u32 target_soc, delta_soc;
>>> +    int ret;
>>> +
>>> +    if (soc < CHARGE_CTRL_START_THR_MIN ||
>>> +            soc > CHARGE_CTRL_START_THR_MAX) {
>>> +        dev_err(battmgr->dev, "charge control start threshold exceed
>>> range: [%u - %u]\n",
>>> +                CHARGE_CTRL_START_THR_MIN, CHARGE_CTRL_START_THR_MAX);
>>> +        return -EINVAL;
>>> +    }
>>
>> 'soc' is what - a threshold as far as I can tell.
> 
> I will update it with a more meaningful name
> 
>>>
>>>        if (opcode == BATTMGR_NOTIFICATION)
>>>            qcom_battmgr_notification(battmgr, data, len);
>>> -    else if (battmgr->variant == QCOM_BATTMGR_SC8280XP)
>>> +    else if (battmgr->variant == QCOM_BATTMGR_SC8280XP ||
>>> +            battmgr->variant == QCOM_BATTMGR_X1E80100)
>>>            qcom_battmgr_sc8280xp_callback(battmgr, data, len);
>>>        else
>>>            qcom_battmgr_sm8350_callback(battmgr, data, len);
>>> @@ -1333,7 +1560,8 @@ static void qcom_battmgr_pdr_notify(void *priv,
>>> int state)
>>>    static const struct of_device_id qcom_battmgr_of_variants[] = {
>>>        { .compatible = "qcom,sc8180x-pmic-glink", .data = (void
>>> *)QCOM_BATTMGR_SC8280XP },
>>>        { .compatible = "qcom,sc8280xp-pmic-glink", .data = (void
>>> *)QCOM_BATTMGR_SC8280XP },
>>> -    { .compatible = "qcom,x1e80100-pmic-glink", .data = (void
>>> *)QCOM_BATTMGR_SC8280XP },
>>> +    { .compatible = "qcom,x1e80100-pmic-glink", .data = (void
>>> *)QCOM_BATTMGR_X1E80100 },
>>> +    { .compatible = "qcom,sm8550-pmic-glink", .data = (void
>>> *)QCOM_BATTMGR_SM8550 },
>>
>> Please separate compat string addition from functional changes.
>>
> The compatible string "qcom,sm8550-pmic-glink" has been present in the
> binding for a while and it was added as a fallback of "qcom,pmic-glink".
> The battmgr function has been also supported well on SM8550 for a while.
> The change here is only specifying a different match data for SM8550 so
> the driver can handle some new features differently. Does it also need
> to add it in a separate change? If so,  this change would be split into
> following 3 patches I think:
> 
> 1) add QCOM_BATTMGR_SM8550/X1E80100 variants definition in
> qcom_battmgr_variant.
> 
> 2) add compatible string with corresponding match data for SM8550.
> 
> 3) add the charge control function support.

For preference compats and functional change should be disjoined IMO.

---
bod
