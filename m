Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9F9A945
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750696424; cv=none; b=Sr60T3pWMA4UkjOOOmFKUfZcaRupUIlbl3gabsTZqFxRcglZmfsKZRpRLS2iBjBtj42JwjNvQz3lCJ4yPhSpkdtDDC/Cjslfu0WwEgvexZymMESqxiM6Ad2VpVloQJa/Le7sma8K26uJaCptng0+MdrFC2Cw/codlP7IuPnhFcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750696424; c=relaxed/simple;
	bh=bUrESiPRUdiT3aZBD/7m90ntrZOEQs+uNbXB0hfmyLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sAUjyqyjNspdyErAeB5qOAzEbJ1hTGl093tuI2CJT4qH3UAe38NsTQnG1TOSZJZ2sXq/bvYO4D48ZVgsaXNb65HdHEhoVxk2k/gyWODwS7uJtpMH9J2NPnkvJQ2RggaZgUY9fJAgwtwf7wLkfiSj+fJo74GYzxDrVQ022CCYYD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PZutgFjj; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PZutgFjj"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60179d8e65fso7836999a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750696421; x=1751301221; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XXbXOUYB6IBOkueWjAb33r4P7mb75EnqewGXePwUiUc=;
        b=PZutgFjjE1wzaRvF4ETc7QoGsoTEEUDKTVkzYNkXkoYszUGKlGsHGUSRk0enpvArNS
         lTBA5d1Lu3ZQzGDN40009BUpWDw6RkspNHAGO6JqtGIm18QjpVY+3TtjQNNvkgVphkSG
         H7jDfH0fdHjyXxjwmBa+N14Ox3L3AiNgJtP7sYxJ4qNdTmAXRuGIb7/S64sQNPzergW/
         Yfftagh5OSoY8a3EdnW5XBg9uu6wVZ7W3hD78jqK0iHYkiypuEKEvVN38u9uJqkiUe6/
         2uoTIFnPBTDwdaYuYC7XLc3qbw5mEbrVHDS35AOxNiIdsuSW9N2593UYBiXv8630J4Ai
         WB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750696421; x=1751301221;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XXbXOUYB6IBOkueWjAb33r4P7mb75EnqewGXePwUiUc=;
        b=KaM7cvni6BxYtM/DL1XKCvnAAxTV0peG4zlTyxR0DpM0hCFNUFZMBHHvm1pGjKIf9A
         k328aDcM808fsjugwppsJmAekkaQLbjyxcgIt0dRAF0fPWJaFGjTY94ZEPOgd7SP+hGo
         6jM5b3aXJZv4ib1efugUiwIjCKkatyIaY3t6gcdKlkSbmrVNeYS6hJuC991tXi9HzbeD
         BIq5XMjRHKqiPMO0rjSIRjDJoePUp2ur54BWn5QdefxuuYDD7Xek0FGvy7hWOghWVROd
         vb2qV/AyuiCbxPYfLVIC1M1PKBHX1LUj7ziM2CDuLsqxjwfDtH7vobywRefIJE2svdRU
         Q9Ww==
X-Forwarded-Encrypted: i=1; AJvYcCVVreXUXiPILAfPo18QBAz4MV33MbKtO7cZJ8za5hHw5a/0vGvBxtlu5LNINwiWnXEWMceyHUZPbRN9hhs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqwFioGRFCO368csuwxgzM5g8y88V3vvDVMXVUeAJp8TAdr+aM
	v8dIN4mqThZqZtglWbTugL0emKa209NjCcnNGVH3ZbqDVZxwWWV4JsvAeZGdSaX2LnE=
X-Gm-Gg: ASbGncsoxDTMvuyLsKBRR94VAt9LbRjTb87oaIvMpocb2od4+XJjovwu4ENy/zU8Dxj
	nG+00yZjvULsLVOqkvJc/6cmQsft9ui7wycuLWCaaQH+a5BVsqN7sh9ENZ0obkBtD1mZnl5dnVd
	aegwtjl2M1o38335trBscA8Q7qgZK2AGzIMM3XyZLCPNMsbZNEeILmGffaL8qyxHum0zSWwFW5O
	e7vjZAOoRtv4RJ6DfFcw7rw9utvcs6LcvgOgmu5Lbzwyoe38VUXwjJb/qBtDb60aIHY+cqJ8mRJ
	4ZqJ9TT9wglSZgVn7jaw/k/naZ4I+kDAL5CMGvJEu920iWmaOzMtBLOWGtxEs4Xqlfyza73a6BI
	lzA09rThF5Q==
X-Google-Smtp-Source: AGHT+IExPgFei+2P+PVJukxiS3aE9U+PHRfpSN5B4qb4zFW+/87BEDL9btqRL9zzd7hz7A0oT7z89A==
X-Received: by 2002:a17:906:2c1b:b0:ad5:23e3:48b6 with SMTP id a640c23a62f3a-ae057bd6e23mr1051197566b.45.1750696421104;
        Mon, 23 Jun 2025 09:33:41 -0700 (PDT)
Received: from [192.168.1.159] ([213.240.182.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209349sm734281666b.152.2025.06.23.09.33.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 09:33:40 -0700 (PDT)
Message-ID: <613f2812-3c60-41fe-bdd3-fbe8ea7eeb69@linaro.org>
Date: Mon, 23 Jun 2025 18:33:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] power: supply: qcom_smbx: program aicl rerun time
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-hardening@vger.kernel.org
References: <20250619-smb2-smb5-support-v1-0-ac5dec51b6e1@linaro.org>
 <20250619-smb2-smb5-support-v1-11-ac5dec51b6e1@linaro.org>
 <2d3ff07d-1cd8-4eb6-8b3b-2d0d6f64445f@oss.qualcomm.com>
Content-Language: en-US
From: Casey Connolly <casey.connolly@linaro.org>
In-Reply-To: <2d3ff07d-1cd8-4eb6-8b3b-2d0d6f64445f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/20/25 19:00, Konrad Dybcio wrote:
> On 6/19/25 4:55 PM, Casey Connolly wrote:
>> We don't know what the bootloader programmed here, but we want to have a
>> consistent value. Program the automatic input current limit detection to
>> re-run every 3 seconds. This seems to be necessary at least for smb5.
>>
>> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
>> ---
>>   drivers/power/supply/qcom_smbx.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/power/supply/qcom_smbx.c b/drivers/power/supply/qcom_smbx.c
>> index d902f3f43548191d3d0310ce90e699918ed0f16f..b723dba5b86daefb238ee6aae19b1b7e5236fce3 100644
>> --- a/drivers/power/supply/qcom_smbx.c
>> +++ b/drivers/power/supply/qcom_smbx.c
>> @@ -1091,8 +1091,14 @@ static int smb_probe(struct platform_device *pdev)
>>   	if (rc < 0)
>>   		return dev_err_probe(chip->dev, rc,
>>   				     "Couldn't write fast charge current cfg");
>>   
>> +	rc = regmap_write_bits(chip->regmap, chip->base + AICL_RERUN_TIME_CFG,
>> +			       AICL_RERUN_TIME_MASK, AIC_RERUN_TIME_3_SECS);
> 
> FWIW a random downstream clone I have sets 0x01 which is claimed to
> mean "every 12s" instead

hmm I saw that too, I think more documentation would be needed to 
understand this properly (I'm not exactly clear on what this actually 
means, when the AICL would re-run, etc).

I have reports that this works ok, so I'd just leave it unless we have 
info to suggest otherwise.

> 
> Konrad
-- 
Casey (she/they)

