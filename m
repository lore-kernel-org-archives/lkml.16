Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893F9205ADA
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 14:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591961; cv=none; b=BAy5XF5deSdN9LfBR0uFRl+b03nwsclstxyQcpWJ4KoIoCAcXtku3Pd2x49uU6Kr1qpw93ms2UCOthOK6BNbI3WH1Jz4aiOZYS8fnxfKQChUAQ7KW+KLRtzmXJnTQPtNltMAaFvqo670kN9iKmkeerRZar/jbbJza/l3Q910pI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591961; c=relaxed/simple;
	bh=tsZxVi3hWnfSgdTZWSolIwnNneopaRWe39nLdwQMAoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sCmSbSivbJmH8+9Lrp1VwygJ4IEraS/nZkbOBG5KV5xw/My/XLfCv9dliP88Mi6z5y2MR6lRAAgpP09tboSm7APy0TsMRX3v/BkUHZgxxEQ0QJ1K5voWpt3SNYB1IVu1tPtx2UmDYxuhk8Oagizdeon62AorpHaIhPqY6VeioMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IvgVrmch; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IvgVrmch"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43626213fffso33905395e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 06:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738591958; x=1739196758; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QUjPahpJZ490tF5nS7xvrKmwqtWzzB567d1rXxR9fdw=;
        b=IvgVrmch1fV5tP63yh0ZqdFO5wOkKsKd2FurqHJDCZCXuljPMJFqUg+6sBYrQQMOVx
         o9guUFbL1qVl3cckmizrHh1MPwZ0uYN4yh16XU1IhdrkrXwS6ZETQcu8LbkAUcrCyGiM
         y7xKUdvr5jjHMwozoH6w7NKGX+ZQjIuELGM/O80Ce2Zz3WviHOac60MWjyE7yIK+KDyo
         f4oXHJZk6hhgwKQaM6SLtdCo6d6dv20CJXVW4jyswRHebiw/6rHV32uOYWSRipJ07NOm
         qvxitPmU4OkLfhGKmXGDlKScielOeEX6AgfxjkpDHOdxV3PppNMeyhdHv65VcX46eJyi
         VBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738591958; x=1739196758;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QUjPahpJZ490tF5nS7xvrKmwqtWzzB567d1rXxR9fdw=;
        b=ZWdJZd5y4hKz7Y+2DHW36/d0kvBByuQWpJh/B7rfEkfNwpX24AaLQ7bT0s86p5RtjM
         bzvQ2kDiHzqGQUXChDrzriEQMyCppm5C88Frnt3VGbs2yGOffrcX2ElZyBkdUs786zQl
         Kl95I0KzfYTXusVoOXpxCZXdrCEVq91KUBLJXxF+Bqacdp7dv+Q4Cd/2AOrYlmyuq1zu
         UDA2ZjeFJsryM+OELbFOw16G5q/2KD2VHHWrMdCuRyYRFUEI1ybDUWFPA5htGWyv0hCi
         7jaDXHWVuko1v7i1eMBPLXZvs/r0RCd6oMoYUJAMPUBwX49WpxTDmJca3wRXgANNfjmQ
         DPsg==
X-Forwarded-Encrypted: i=1; AJvYcCUEUeOYubiC+k+UFqMrNHnpTChjY7PGvkqRhoYEFBp2L8tKoM2GqbGR34hfTd9PcNK8fREfUezPnsxVHcM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKappnHuVzGneZfHUOdQGzMIBMJTeElDVvu8jYnMN4URcBoBfV
	vO/EwI0kwEdwPXneiID+RUcWwU5MsqreWdBZuZVpDfk8ElTDl/UftmkCcf2lpmU=
X-Gm-Gg: ASbGncvh+ZxoIF/NzSX8CkI1xrC+KdO9gj3y4eF00UIHJBZus9tiHR41cbshO9Y4DEQ
	boQBfr7DVrLEU8VlEINEJ/h6Iw2Sd9TPrvS7qVYToOpkwVuwAGsCs515Ui0XEDA8QJEg5OSOj3C
	ogXLM9j6GknKOM95HXog3ZPbWI15AhR0hJXg/SS8tLL7XBBZWqOgbTdg7hnyIB7rAby8b4AfY2g
	YATAb8fyYmDdqp/I0qYmnlMSMNxS5cFS86v9TflAIzwT+h3ja39AVT42fh+ssMuBCquvVw4w3rX
	WQPdEf65/h07wviN/kez8d2QiSWeP9J6mg==
X-Google-Smtp-Source: AGHT+IFA8mWEpLmmdVcjuR4koqsoB3sj55W01B83hJSvs3SAyixdmRXxMrYb2kLmMpISqzfZlvuUaw==
X-Received: by 2002:a05:6000:2a5:b0:38b:f3f4:5812 with SMTP id ffacd0b85a97d-38c5a9a62damr16085238f8f.21.1738591957643;
        Mon, 03 Feb 2025 06:12:37 -0800 (PST)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38c5c1cfa2fsm13136123f8f.91.2025.02.03.06.12.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 06:12:37 -0800 (PST)
Message-ID: <14f167e6-ea2f-401a-87e9-2722929bd9a2@linaro.org>
Date: Mon, 3 Feb 2025 14:12:36 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: q6apm-dai: schedule all the periods before we start
 streaming
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 krzysztof.kozlowski@linaro.org, pierre-louis.bossart@linux.dev,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250203124945.11406-1-srinivas.kandagatla@linaro.org>
 <za6jydjpvhz77h22qvssjxv2vrh6g637ctgfndqavoxo7pnqel@vcalzbkbfoss>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <za6jydjpvhz77h22qvssjxv2vrh6g637ctgfndqavoxo7pnqel@vcalzbkbfoss>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/02/2025 14:09, Dmitry Baryshkov wrote:
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
>>
>> Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
>> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   sound/soc/qcom/qdsp6/q6apm-dai.c | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
>> index c9404b5934c7..148c3fb77168 100644
>> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
>> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
>> @@ -299,15 +299,17 @@ static int q6apm_dai_trigger(struct snd_soc_component *component,
>>   {
>>   	struct snd_pcm_runtime *runtime = substream->runtime;
>>   	struct q6apm_dai_rtd *prtd = runtime->private_data;
>> -	int ret = 0;
>> +	int ret = 0, i;
>>   
>>   	switch (cmd) {
>>   	case SNDRV_PCM_TRIGGER_START:
>>   	case SNDRV_PCM_TRIGGER_RESUME:
>>   	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>>   		 /* start writing buffers for playback only as we already queued capture buffers */
>> -		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
>> -			ret = q6apm_write_async(prtd->graph, prtd->pcm_count, 0, 0, 0);
>> +		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>> +			for (i = 0; i < runtime->periods; i++)
>> +				ret = q6apm_write_async(prtd->graph, prtd->pcm_count, 0, 0, 0);
> 
> So, all errors except the last one are ignored now?

this needs fixing,

thanks for review
--srini
> 
>> +		}
>>   		break;
>>   	case SNDRV_PCM_TRIGGER_STOP:
>>   		/* TODO support be handled via SoftPause Module */
>> -- 
>> 2.39.5
>>
> 
