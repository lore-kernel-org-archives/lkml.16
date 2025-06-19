Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F2C261390
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750320408; cv=none; b=P0W4qwj11yNkIMBW5bTUadeiM6f9T2o6LkM1x0/u6KISnWei2f7DJJuFsHLpX8TBw4fnGA+FtgbXkl8CP5AJ0WA6Gw6oDC+PBbgRaGS+O/StvJf2GOHxgprW9hL3EE/4mYneJKGliDH2mvcI4mhj5fM48vitQGuuwZXy+f9iWqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750320408; c=relaxed/simple;
	bh=a+rcVLKG5LogbRwc+21ftsMiRlVNjgK1wni99iSuW3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BUhS8BYHp6pBGQ4eduvf6yBU/3hMaIjZaxtNVDtmI+opOX5/oXdeuR8ITGzrtyNoR/VzvYkY9bzNYnQ6gA3ckTlUYsT8TqGwy83UAC9pmy8esYpQ/OzY4ULNEOsFDNxySPfbCPudhpe1pwXqjZDWyqNhgaYjEJD6aowqFENs0NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ckGS5+M0; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ckGS5+M0"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450dd065828so3364345e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750320403; x=1750925203; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=salczjjRssYDH2+0mmcRfcDYi7Wgd3Z2sKQXxoQU/+k=;
        b=ckGS5+M058gnTKUMG9RLGD96zj326GLXJa9omuttPur7zjwxhgPk9TniSH8spzi2V9
         uHXvKcgMlSmqCIwNxDDW+U2kN5aHUR68n9Kk7S7BlMG82MgeEVMm2YJbBXCHxNq+hCyE
         UQY2qPAQegXZ1ghDFEx2J7vBVspeB6aBEC65wS2iFVt29LvxCNsh+/dsmYlvcM2O67zI
         fU+e43gInjYIh2TxYsmEQ8fVC3O+S+MlupvQdfXWbqF8+MqWLd9NmJ2y3DTmsYV/Ku62
         caFygxMhnvKe6VQaAPNu+IuzulGLpuiT+jDim5h9bdaWeuqIDB/Zve+b2yA7aZGaCVrc
         5+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750320403; x=1750925203;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=salczjjRssYDH2+0mmcRfcDYi7Wgd3Z2sKQXxoQU/+k=;
        b=tWOEMW9k0xxTeLvGzYw0YV6jRAJ+4U1WSMTvA8vTdadtgdhuyvTBWrAsHsq2PYnrC/
         wCeYOuJ+x1jRAukHA1Lcf6J/pGPXxiUcd6jHb7PLPHRIVFv6sDrIT/M2G3Wuat4ViOxx
         OGtvAvsYDKHhLBhS4lgmcdqCQrxxztGoK2nXFUh7MQX/WC27AuycLUH6S10LW2Nr4WoB
         IBiXwT2fW2RaIpNv7Q2bkEdxsTQEUCbFrd08z2dXK4HuJUOd+TYDVPZQh3cHZ9Px+ihM
         Gj2AAm15hg5HFnR7hhHvI9BeIh5kVN1C218iVf3zmRuFO2XmLj79M+wf8cTB+u6GFRlj
         sMGg==
X-Forwarded-Encrypted: i=1; AJvYcCUA7iRW6VE5unmbu88Cg1SfXa5QTUlzPbjcB0DlAcVtuX14YSeZGL3LRAKYg5DuNW5Kn8t6sZDLHe4cCbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgQPJ18JdfR61AGkwD1x82REyyvaZVgcgs3j05YDG3VJ2tWXKH
	f6zbV6tgz5o696DiR7KICpjJqsYPsDjmheuZ3qLjgdNnyxP+F8w0WxrjuLKXaFaarVITitgTTh8
	gDUQHNts=
X-Gm-Gg: ASbGncsn196WO7xdS2FEJXwES8r2Uj6RmYziv28uyc/y6mijivRUL2Va8lQTQzXR/1g
	SrMm2S4d1mpqr2FrfJJkaBA5UUPc+7zrC6Z3GSVULNRa9MuUFoPwIOgXAL1qvmRxIjyG8wCehaX
	00OAM09iqOdr26iNZ3vbo9TJWUZA+xqUkI2SOP8iskOlL2VV60mqsQk0aSzsEbkdOp10fiw6dWF
	c6+ymzysw1vwBMSU9f7RFjtG39grsLdrzfuAVPqWGAYkNzOZ4jTwE4ePxm0vYlhg0rq/kTjjkgt
	hFtvm0tABSlY92UfBeeRrftSfQNodpf5gV8uHcVBbNJ19twpVD+4s2Wo2PkKqj9E8mJOTdvHcUF
	NrD2VzyengY8ObzuOZOEO7iPKn6M=
X-Google-Smtp-Source: AGHT+IFWX8/s2AmWjw7FnW4683L5SDBApq2DrAPvcaPvOV+s02ya9PajScAuugPZCDr89km6tcZARw==
X-Received: by 2002:a05:600c:8b51:b0:450:d367:c385 with SMTP id 5b1f17b1804b1-4533cad630amr205407535e9.16.1750320402887;
        Thu, 19 Jun 2025 01:06:42 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e99cdcdsm20490695e9.34.2025.06.19.01.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 01:06:42 -0700 (PDT)
Message-ID: <af44846f-8e1b-493f-8023-b96348a95df4@linaro.org>
Date: Thu, 19 Jun 2025 09:06:41 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: venus: hfi: explicitly release IRQ during
 teardown
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250619074830.1708453-1-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250619074830.1708453-1-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/06/2025 08:48, Jorge Ramirez-Ortiz wrote:
> Ensure the IRQ is disabled - and all pending handlers completed - before
> dismantling the interrupt routing and clearing related pointers.
> 
> This prevents any possibility of the interrupt triggering after the
> handler context has been invalidated.
> 
> Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
> 
>   v2:
>      disable the handler and block until complete.
>      allow devres to release and free the allocated irq
> 
>   drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> index b5f2ea879950..ed003adb0282 100644
> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> @@ -1678,6 +1678,7 @@ void venus_hfi_destroy(struct venus_core *core)
>   	venus_interface_queues_release(hdev);
>   	mutex_destroy(&hdev->lock);
>   	kfree(hdev);
> +	disable_irq(core->irq);
>   	core->ops = NULL;
>   }
>   
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
