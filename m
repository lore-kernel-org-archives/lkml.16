Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5998022E412
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 09:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744016660; cv=none; b=d2Du/+3GF3R8FVif366MyLv+EESWApvb+FRlaqNenoIQky7UJLxumZcd6X7ILHaztmPWdIyzYgyVSlpbp/ybkjK9HotGJm1cebKPegQYzePTcLNJCPSrc4g7E2Rt2GIzRM+2AAvfQfvMLCd0LHwvKkHG/7kPw8Q6d4d3cbjvOAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744016660; c=relaxed/simple;
	bh=iqoN+wUuUnOuLAL2yag/p3e39+tGVOKR9kF12dHb6lM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VkKl+3GhoqA+NBY8oiyyHTkZRkzRyAS72gQ+E0fIgowdKZf8E+0NbCyxFzXzguub8pdNPcC9LbLikY4lLO7DMFQKq8l2IgU2FIl2YumOYj1a8HehNy9ZRUPxXpate5UBQ1RtWhL8YiZwFF3B6ePyd13+ZtrkHEQfBri8/zdoLHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F7MRokof; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F7MRokof"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so21653065e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 02:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744016656; x=1744621456; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mjc1Y+yTBBrDmieRT6oEJnnJtw+qsXJp/dvlQ9n6z4A=;
        b=F7MRokofS7GOHOlEa2Y/IcRMQaLHA/mcZOzKjZZz9COPVbSo8MexKdCZT/Cb8rla0Z
         St66w17w+UU3O3py69hv6fYCDLUV2MBq9CDCsQKopVMWxi5pwzHOTWiaMG64ptXUSQjC
         2lCBLs4aCdLTy058gXTuylZPJ1fJ0sYvSLt+k3L8nxdOb2y7e9j53ffSTHvzgyef+Z0R
         tMfyoBE8i+cOKBw7xa0nOxPrTNeAN4jasfILZX7UxpptjSt5WKmGcOLhAXrP0SOqd8R+
         dcQKf6zEubqpDjXygknq5z0afp3SWyIyyzGTFEDXd5GYUgm6pcpNsFdc/jF1J/ZdJtpG
         lkqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744016656; x=1744621456;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mjc1Y+yTBBrDmieRT6oEJnnJtw+qsXJp/dvlQ9n6z4A=;
        b=ftDh7/iC1O/p7HRn7oRYE9Czg0DhCf0C+hVYFaFpw5UJtC/yX7i6i2EyLolCHQ6Idb
         JtSilUqhkq0Y6j52HhACUhncO/GvUMBQivpYJgofEALYH+07z+NJXt8xEc92rNgjS6Eg
         xC2eR+r3w6mwzxPCMPSv1EWpsw+fERUZQYXVoYdBWx5Y9AjcQOYKgJFiGkeeYDT124Ma
         db+FtsjvCLa9EyGE6oPuUfuDDoWovVrkn4YTwkimY77W8ahQyZIa98d4Rcar2+Yv+UWF
         KER00Y7Y0IjHmGq49LTA6SG9N9zZSTix9ak2QIoTSPQysAoIhVCj486V509ZcA6DFFNK
         H8iw==
X-Forwarded-Encrypted: i=1; AJvYcCVJN9iEekcXuK+ym3ZR3IIZVuW2MpbMdMyKBRuZPPZKNfnwjyeLcO6nESRripuyh1RoDBzraFRi3XcxUl8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOpJ1ev+bAYfXPdOkAnxX6/nus+qdHFg+8cLH8XFFzr/8Oi9+V
	eov6hWp0Ky91oTI5ES3X8B9aWq5dOUnskPOXe8gRzHarvUjfGw+JEUSgSo0JK9I=
X-Gm-Gg: ASbGncsCvufSAop5jfzigWWks40m3MccT/VuEsyV7vAo7F4w3spYuyhip3/CVtuxazV
	7zLcHBWecKTZ6WW0N3SC2o3wOkqxAFMYLea6otBVm3eups8wTiz5BnmijoTJxNRPsOiNJtbK1Pz
	XykD8ehHdI6bsOFu9MEHD4D0Yfld8LpAmryySlvUim72tcxzQVyC5uj7hf+lFaiKzHOXsFLL23L
	ORrFoH7VNKvBXyuni7zA6B8SLYIYKQkk4NReDgv8Rup7HVI+7zkWN9DQ8gbW5L6jaynHlztzgBZ
	IX7Z7ow//uSB/LQFPQ2HQLxJe05W8t0FL2T3XQhLYvfiZJ6whsOBSkCf5LhhVHuk7wB68pkQdFt
	Z2B357fP2rQ==
X-Google-Smtp-Source: AGHT+IHqiLtGTmRqnpWpvYCAC7ffTJvnLRZkBR4aIwuAQ3CmyK5RdU7aVIzfT+V2SRxkUVqIof16+Q==
X-Received: by 2002:a5d:6da7:0:b0:39c:141a:6c67 with SMTP id ffacd0b85a97d-39d0de66aacmr9192901f8f.45.1744016656623;
        Mon, 07 Apr 2025 02:04:16 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096ed7sm11148889f8f.8.2025.04.07.02.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 02:04:16 -0700 (PDT)
Message-ID: <22b1c835-b0d2-47d1-97ee-1976d31beaf9@linaro.org>
Date: Mon, 7 Apr 2025 10:04:15 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: csid: suppress CSID log spam
To: Johan Hovold <johan+linaro@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Depeng Shao <quic_depengs@quicinc.com>
References: <20250407085125.21325-1-johan+linaro@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250407085125.21325-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/04/2025 09:51, Johan Hovold wrote:
> A recent commit refactored the printing of the CSID hardware version, but
> (without it being mentioned) also changed the log level from debug to
> info.
> 
> This results in repeated log spam during use, for example, on the Lenovo
> ThinkPad X13s:
> 
> 	qcom-camss ac5a000.camss: CSID:0 HW Version = 1.0.0
> 	qcom-camss ac5a000.camss: CSID:0 HW Version = 1.0.0
> 	qcom-camss ac5a000.camss: CSID:0 HW Version = 1.0.0
> 	qcom-camss ac5a000.camss: CSID:0 HW Version = 1.0.0
> 	qcom-camss ac5a000.camss: CSID:0 HW Version = 1.0.0
> 
> Suppress the version logging by demoting to debug level again.
> 
> Fixes: f759b8fd3086 ("media: qcom: camss: csid: Move common code into csid core")
> Cc: Depeng Shao <quic_depengs@quicinc.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/media/platform/qcom/camss/camss-csid.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index d08117f46f3b..5284b5857368 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -613,8 +613,8 @@ u32 csid_hw_version(struct csid_device *csid)
>   	hw_gen = (hw_version >> HW_VERSION_GENERATION) & 0xF;
>   	hw_rev = (hw_version >> HW_VERSION_REVISION) & 0xFFF;
>   	hw_step = (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
> -	dev_info(csid->camss->dev, "CSID:%d HW Version = %u.%u.%u\n",
> -		 csid->id, hw_gen, hw_rev, hw_step);
> +	dev_dbg(csid->camss->dev, "CSID:%d HW Version = %u.%u.%u\n",
> +		csid->id, hw_gen, hw_rev, hw_step);
>   
>   	return hw_version;
>   }
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
