Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D141A20459F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744099651; cv=none; b=Xlai/BHeGYWCeWNbVUAkypqLyR8we0M0/8xVCh0bZcymLmxCm2/MzFXDCY5qjLLIMRJpnhKEGELJMHnlra7bcHhKc8af1o+JzaVWZeGbDeK76qIOBhGRVoTTGSUfgCR/FAwCBodjLu0zsLEgQENqfNcu+2OmYpDlsUcsdlglYqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744099651; c=relaxed/simple;
	bh=k9CSGfDZYhat9A7hNdYkbf5OXkvSJrxO9ZA3cNbzaCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DU8nQoUD3eJxTJX0xagINARgjvQbJcLupR6xVkMvCOKACtZMyVmfwamtg9ooWyb5dZBV2ue1dPqTi6eARBm4+ldq3iTfKYuXwTAYHUa1jZ82qFYn4OI47P11kh+krmrmPZFWdhIYquujRAOLAdOqMXDn3MB5Zp2SJdCpFUzCrx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EBPT1YTL; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EBPT1YTL"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf848528aso42057155e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 01:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744099648; x=1744704448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WSDEwc7QWvNnjNYSgC4m4TCyiYUs1psSSUJ0e9qdFNY=;
        b=EBPT1YTLzyh+CU+bPbQyUw6ybXSipZWvoqLNVEp9WhoDErABX4womSpXpQkSjMBSDC
         KJkYPRyYCnyEguKQfDV6MFjcjYPv8/LSiC8uhf2oI7Fss7IG6/j12MKg4iyvcNrSst01
         C4PEc6pL3eVb0YAGosqyRFNsDq9uHcWmrWkuC0JSdlES7yqtok/4N38qPp3oGf/hEtFi
         aMDVvNYDmiMdII/Wz7mEwTeHuFu25p3xl063Ojlf6HRmu/d3LrRd2gbgl9BDGgVgZ3tH
         EP88bG15UpPiFLI3xAnVStSN3XEuEITkUBrKWyQIM/hf9m/nTH/HA8lDlRj4Eda6EHB1
         trXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744099648; x=1744704448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WSDEwc7QWvNnjNYSgC4m4TCyiYUs1psSSUJ0e9qdFNY=;
        b=WFnPKeQsE4BwZDA6f/H0jrokGk9u8/W5q1oSddvXlh7O8s9a0A5OQs2Nnzt6jK6tLT
         B1V8qLANxdOBF6BMJjcYXbQQpw8fKhZUqzg43HhD2boNnCiLrr2+ShkYC8140YWyWClQ
         Rri6ohEaOIrUqMajqiOy69bK/v/ys5Kk669QqG71hZmd1ktnRH/YwFqjCoDl70y2oS2X
         ur718aWVnI+S6ddcwTPBV9HwBBiKd1uqd4oKF4rNj5qghNRQSvaLUjycJfcJO05Ddq9M
         BjPDDrLbSGAYtjF3Cd8Nd/nAVtOxqTfPEcj4brk26o4rM7+YGqDQiPsmLgfiM/iNmK7O
         hdcA==
X-Forwarded-Encrypted: i=1; AJvYcCU5poNLMAs2KymDrKhXdj+jtBgWnCb31+FdTG5qi4yb5FlCLdyZYCOD3++IG0jWbCcryaaHhUTew12IskQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOo+p07MHR6EFO1yN1vxHOG4frPn+vyi/Gb6xn/B84DwPjp+Lk
	qW5PxuuFd2wMtryi0LKY0j1KNZescAe5GhCv9mCc+C6jX5QNeJmHPoUEr/jDJk4=
X-Gm-Gg: ASbGncvy/Yn1zTsjBMXHIbq9VPMKC5W2Kr2gHfHhKZRaBG75eggmYuDzmor2zKbb9K9
	AbrUOw2DDFZH+Tf9HSFgq7ZtNgbI5Jk4HfvEs59+rOSsbovF7sRKEvjFeyINXd3JsjD1v8h0fiB
	pRIQKGkzP3t0yrNKtJHalfnQO/7iQvBxJfUak8T+DMYAxly/pIfT4W4kI49iqtHmnLqGIqZltJ5
	nwstWx+HZgXE2Vtzd+6qACcS1ZbBs/hE4VAKPqNeAYCKR2FoJezsqfTeeVzXXdcP9MX5uNNoUX7
	DAk7QwDBxl+NWN0JYZxdI2T1XRhUDUE0kfHavoEUt4X8Y+CdzEqoNWOydxqnqiDJOIVi9yDIAQ=
	=
X-Google-Smtp-Source: AGHT+IFDiZ0cnV2ayvj8DA4Rl4xGe57ExDt/t21NR6kpjVQ87p06SQ/qaCpf+bTExejAD5z/3aBKUw==
X-Received: by 2002:a05:600c:9a5:b0:43c:f78d:82eb with SMTP id 5b1f17b1804b1-43f115eb698mr9593075e9.15.1744099648109;
        Tue, 08 Apr 2025 01:07:28 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43ec17b0dbesm156568955e9.33.2025.04.08.01.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 01:07:27 -0700 (PDT)
Message-ID: <7222bbbd-51f7-43b6-9755-29808833cf5f@linaro.org>
Date: Tue, 8 Apr 2025 09:07:27 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] ASoC: q6apm: add q6apm_get_hw_pointer helper
To: Johan Hovold <johan@kernel.org>
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmitry.baryshkov@linaro.org, johan+linaro@kernel.org, stable@vger.kernel.org
References: <20250314174800.10142-1-srinivas.kandagatla@linaro.org>
 <20250314174800.10142-3-srinivas.kandagatla@linaro.org>
 <Z_O2RhwYp6iy02cM@hovoldconsulting.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <Z_O2RhwYp6iy02cM@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks Johan,

On 07/04/2025 12:25, Johan Hovold wrote:
> Hi Srini,
> 
> On Fri, Mar 14, 2025 at 05:47:57PM +0000, Srinivas Kandagatla wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>
>> Implement an helper function in q6apm to be able to read the current
>> hardware pointer for both read and write buffers.
>>
>> This should help q6apm-dai to get the hardware pointer consistently
>> without it doing manual calculation, which could go wrong in some race
>> conditions.
>   
>> +int q6apm_get_hw_pointer(struct q6apm_graph *graph, int dir)
>> +{
>> +	struct audioreach_graph_data *data;
>> +
>> +	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
>> +		data = &graph->rx_data;
>> +	else
>> +		data = &graph->tx_data;
>> +
>> +	return (int)atomic_read(&data->hw_ptr);
>> +}
>> +EXPORT_SYMBOL_GPL(q6apm_get_hw_pointer);
> 
>> @@ -553,6 +567,8 @@ static int graph_callback(struct gpr_resp_pkt *data, void *priv, int op)
>>   		rd_done = data->payload;
>>   		phys = graph->tx_data.buf[hdr->token].phys;
>>   		mutex_unlock(&graph->lock);
>> +		/* token numbering starts at 0 */
>> +		atomic_set(&graph->tx_data.hw_ptr, hdr->token + 1);
>>   
>>   		if (upper_32_bits(phys) == rd_done->buf_addr_msw &&
>>   		    lower_32_bits(phys) == rd_done->buf_addr_lsw) {
> 
> 			graph->result.opcode = hdr->opcode;
>                          graph->result.status = rd_done->status;
>                          if (graph->cb)
>                                  graph->cb(client_event, hdr->token, data->payload, graph->priv);
>                  } else {
>                          dev_err(dev, "RD BUFF Unexpected addr %08x-%08x\n", rd_done->buf_addr_lsw,
>                                  rd_done->buf_addr_msw);
>                  }
> 
> I just hit the following error on the T14s with 6.15-rc1 that I've never
> seen before and which looks like it could be related to this series:
Its unlikely, but the timings have changed here.
I have not seen it either, but I will try to reproduce this with 6.15-rc1.
> 
> 	q6apm-dai 6800000.remoteproc:glink-edge:gpr:service@1:dais: RD BUFF Unexpected addr ffe0d200-00000001
> 
> Any ideas about what may be causing this?
How easy is this to reproduce?

--srini
> 
> Johan
