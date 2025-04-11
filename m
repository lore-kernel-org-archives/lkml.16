Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718662367C6
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 12:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744375890; cv=none; b=UY9mSYmQKQvQ7npfLT8pZBG3txIC3lES97O/NwevPN+6WPTkqAfwt0zNpvtasTU0vnPThoR4/1nzORVJy9N6cHT/UUExT5BE85OIO48MdpsbaRd8IUbOunnaE+Nqp9ubvpgdxeUncsD8yx2iAnXDRa+c+L6YIhpEbHRRdfEAgqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744375890; c=relaxed/simple;
	bh=Qmeh4hTchOwJYVtrYQ6NlZZQ4TUWUgCH5SLxLm+RCwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hsQTdkGRqST11IaFWfdMhRXUtRJxv6H7h40QwLKZM16HAIggwtYjlXvXSI+Qm0Yb9oVvl/GB+9SEVENTKsIkSrMsmAGzUU9OYe7OQjIjDqnFBVZYzZEYVdULHkc65rYTkeHnRAr0yMF92tX5Veeh7L5XEmQ3xkfthoBDpkxrMXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jlCpiLHx; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jlCpiLHx"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43d0618746bso14777955e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744375886; x=1744980686; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=riHuEPZaH2UzIe43vzXOZGpSbV5+ij8h98YzpgoN7WU=;
        b=jlCpiLHxp2dAkRvXFqmssoUe0g90glCYHmNA3zAPfZqoJ4WF5X2dkHfJP1dW4hm1e/
         eO8oK6D4fVjShVCloGxfQKvhwTS2ni9/UWJbsDsEDh4INTfQQa8RiOPJZT2uzuV9cQ9G
         hvXLJrWnbSVXNl9UReAgnshe5YYFjJutLXFJexpuZFZ+cookTMsmFkruMmpfGer4R32d
         rRyTptqNJDpwKjJ8IjbP9kzA6rViOfl32WRYWNA5M7C1p2mx7Z8pMfKEJE30JEjz2qLX
         FD5QGaCuXJZb+cbNoKhcDHrxnA1IOD9EyX6hBkf1EcyfYNGOOAfLKs7nCRIirxXYyG/R
         +dXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744375886; x=1744980686;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=riHuEPZaH2UzIe43vzXOZGpSbV5+ij8h98YzpgoN7WU=;
        b=ejBC+S7nTpVAeOEEW9Wrxc+BoSzADKvTqmqiaIllNfBl/sFOLPIkIL57sKz76gAUGS
         Y9mJhPEOWdXNpaIt1IpZtTCUMuWqNvJEQEGDOuE6P5P6RG8DcLQXxTCgt5mQ4FzWk65d
         sfIzb4+vEK2h223HdKRnOy2q47XDBC2ZlS0JKKQux6OQcT9dFCG/TBngMf2IXjh3jFzT
         psvIN+1u3ZU41KyEWJHSgyozh3Gs/9NWbLz973Lsm7EY+XifnkbooJ6hM8M5EmkgXL6j
         p39JuOxFEJhxMfWRGAjsF4VGX+mzzjmhE9MF9KTYkSMa98AMnjeTxmyRBrse46/9jpDn
         J9Fw==
X-Forwarded-Encrypted: i=1; AJvYcCViuIG9X/zmWRbysfgL8FkhVs1UsP86IGvKUYbSY1C9uDy3FeY/mBzJN8MBginjheYWpXL3O0Y22QB5ZT4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIV0/0fsDu2R90/646XBZjBqqQCDUfnWo5sVFnnXxt4/bp7/Hj
	jZCrDmfp6H7l1GcEElJ64YJLkwGHZmH8CNse8RG48ZakXJfxXUKEQiY2QqZgOUA=
X-Gm-Gg: ASbGncusdBwR75S0eaeREo3N9QLu2raDzZqwTqBp8PGnnhnAP4uAZwYS3M+Y8GsutTx
	RZBuTyo+xC9Z5fxlyLD5GGyft0C4a9ip0lleuGZGuwGRKyLhBJj9XJnb/Ca+RoH3bl1iWdtFexT
	llvebWiIlZpvmd5TG2QH5EnkAf0rGmPgg0jXZZk0LZPDGJ45niCixCXLH7PPlxGcbkg4HVrIaCZ
	uy2v4YWMARYG+QzdXMGwNvJGIgMRaNQXxAwPxoQuxFKUyCj4XfOqv8mgYVWJtVuHDVyg+eKHGzz
	f+GLbQTTlV1g3WPNgINh5Q9NAjXTifj39ErY+j742opTFSFDE5oDzdd431NtUkuxLGv9Sdz7E19
	MUxQDMg==
X-Google-Smtp-Source: AGHT+IFAJk+ThCtQ5r6Ogz7zXQnZLWvFSOxBBn0d7BWFfnRxGWxCV0FsKjihE47cYfeE4hCS+/ne5w==
X-Received: by 2002:a05:600c:384b:b0:43c:f3e4:d6f6 with SMTP id 5b1f17b1804b1-43f3a9b1564mr29467745e9.31.1744375885776;
        Fri, 11 Apr 2025 05:51:25 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f235a5d57sm84182605e9.34.2025.04.11.05.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 05:51:25 -0700 (PDT)
Message-ID: <b857d1dc-2b21-4b93-89db-808c5dd4035a@linaro.org>
Date: Fri, 11 Apr 2025 13:51:24 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/20] media: iris: Send V4L2_BUF_FLAG_ERROR for buffers
 with 0 filled length
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
 <20250408-iris-dec-hevc-vp9-v1-5-acd258778bd6@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250408-iris-dec-hevc-vp9-v1-5-acd258778bd6@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2025 16:54, Dikshita Agarwal wrote:
> Firmware sends buffers with 0 filled length which needs to be dropped,
> to achieve the same, add V4L2_BUF_FLAG_ERROR to such buffers.
> Also make sure:
> - These 0 length buffers are not returned as result of flush.
> - Its not a buffer with LAST flag enabled which will also have 0 filled
>    length.

Any buffer with a zero length must be flagged as LAST, else that buffer 
should be discarded.

Is this another bugfix ? Feels like one, processing redundant packets.

> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index b75a01641d5d..91c5f04dd926 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -377,6 +377,12 @@ static int iris_hfi_gen2_handle_output_buffer(struct iris_inst *inst,
>   
>   	buf->flags = iris_hfi_gen2_get_driver_buffer_flags(inst, hfi_buffer->flags);
>   
> +	if (!buf->data_size && inst->state == IRIS_INST_STREAMING &&
> +	    !(hfi_buffer->flags & HFI_BUF_FW_FLAG_LAST) &&
> +	    !(inst->sub_state & IRIS_INST_SUB_DRC)) {
> +		buf->flags |= V4L2_BUF_FLAG_ERROR;
> +	}
> +

Is this hypothetical or does it happen in real life ?

>   	return 0;
>   }
>   
> 

---
bod
