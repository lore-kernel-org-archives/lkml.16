Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416BB191F91
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745503926; cv=none; b=SRDuU8IMNYdO+F+/9oZ1cozBLwbw6X3oAOMVqajKS3oOumgb72TeV1XS0+4hf9YUYT+aDmgMRRz1F7HIAzY1iMEN4dlO+Zn1P6EAcirrz59NE403rGYBsFfjOmSVreXUrX/l6TpF0u43MqKiiGfywFe/4F63xy3ay4rXvV12ELI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745503926; c=relaxed/simple;
	bh=CtEiAcc/nNoaN3GI5PvoThuoQG72iKhqq2zgIqa7tYg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=dMyRofhKqbVY3M1JNWriBsQRYOC8670ti+MRysCuu1ZFl7dwnw2Wqjk1hioOpgfQBX2MoozDZzupsSwWWYQat+AJHMJd03DH/YOQZEa56NQY+kjpovtalNFAWTGbuMGoLpyPzA0V4Vef5CVXlnZWTEYJTvc1bdZsvA3l8TgfOTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uzAM9zOn; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uzAM9zOn"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso10776835e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745503922; x=1746108722; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VMVKepFY++CcE6uPsrs1OkWWcrChDnDL5Zv6xP0L1IA=;
        b=uzAM9zOnbe8AqN5bWqXFQuouPRDdx/ZXawPUA74CoEdORcPETsCEzwIr5N64TmWB6D
         EOZKEU9DtL4cnRQOmYpwNgL5pqsYuVod+FJpwjkugjd+kPDIR8Ili7f8O+KS9ugAmWXh
         lusUFJWbfaYCmsNbQp21pdW5xmxD5F94Lg+wNQfOgTmFfOSCOanlKINeUdw7KgZCBzdj
         aA60NOLNh0T041uX37RminswwzfrslF3cHXBHX83J4BVLmEpGgjzqu+yb26rSJBG4nCT
         G2ObPtzd6qqHZHGQsqjNaKuM64pm05HlXgc+cosQwVNWDB/YxrYj5j57W3MqqHyL7NCS
         hZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745503922; x=1746108722;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VMVKepFY++CcE6uPsrs1OkWWcrChDnDL5Zv6xP0L1IA=;
        b=nibQTXeORD0Yk6FWOdcrXajoJjFV6kYzYNPMgStNA+2lpnu541EwZwRJ7Hda5O06BP
         5xYt/l1i4F+KNzJKNBD3Z6YwvzdjVrftalLuJQOhbTF3XTanEjswBM+vODzcjmPcQih4
         P15h05moW+04dXPkSGtEUjQFHLLyWcinf733rRRXgnm5R3kmKduhz4G/xr79bsYMvbM4
         0l21c5r2oPDVkSWWM0qZF3R59R8RMnLHsWeW3nVyTXEG3rkINlRIxadFu+abhzDVskWF
         yafeLChIsxSMowo8sz2i/3hXRTZN6rLVozOmnbYG1Fn4Q0A5NxVdzkdqG/uKH0NL+bUe
         WpnA==
X-Forwarded-Encrypted: i=1; AJvYcCX/x9CAEyOnYmRxfFZAqksfKSP9Vrs2z1zYOLs6U13e5YTrNqRBsFxVmiyxMp77YMoi+0HISgTLMwbkOts=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzXRdu16esz1y6jV9ACEnJ5hgaf5rsk5Wcc+nzg2qv25ORcL8I
	tWilSYOqfLaMdR//iPY5bgH+EPwMQbiGa+QYwygD2QllrXS+5hM1MWWJvE9KLnQ=
X-Gm-Gg: ASbGnctFrwEEjPbJ+tdU8T5ISCVeDryPZTsWo8oiCjQWg41Y/+kSeYzEWzw9pwDPWZP
	hz/jp7u/JUsCSHgM1qPOUz0tU97I4Z4HYe54GhUeHBk/B9bt8/HPazGAS15Nn/BZEiVDeJq7Jlx
	7sfRGsFAofZejm417ppQH8G3teBmQWdX6xUJm/N6/AZIpmIqoOex1pATtCeJqQcJAvVNusaihJo
	i+hoCdAG1quy1GeKFtBd6Hz1M1ygByvI45/Ru+oUESUifSY34ZHf58AqjzymXUyu4Y9Xj4QFKRi
	gXRZBolqA9H2JVCaLhhdOJpHr+UxffM80Vpf8hwOTgiWjN2OCWqbp6Wq2Wax6optC/0lP8IbGfl
	f084w24DGZQt1fyE=
X-Google-Smtp-Source: AGHT+IHDAgJu2/VSQFzrBijOYgsGceJrM3M9BXgk2UdJQTMK4wICpOgpqmOlkNppVo8F1dpEn3P2XQ==
X-Received: by 2002:a05:600c:1f94:b0:43d:49eb:9675 with SMTP id 5b1f17b1804b1-4409bd76f5dmr26518185e9.22.1745503922448;
        Thu, 24 Apr 2025 07:12:02 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4409d2b86fdsm23700385e9.27.2025.04.24.07.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 07:12:02 -0700 (PDT)
Message-ID: <d06f9e32-0c53-4ec0-8e78-1eedf5d6e2fc@linaro.org>
Date: Thu, 24 Apr 2025 16:12:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: watchdog: Add NXP Software Watchdog
 Timer
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: wim@linux-watchdog.org
Cc: linux@roeck-us.net, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, S32@nxp.com, ghennadi.procopciuc@nxp.com,
 thomas.fossati@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 alexandru-catalin.ionita@nxp.com
References: <20250410082616.1855860-1-daniel.lezcano@linaro.org>
 <20250410082616.1855860-2-daniel.lezcano@linaro.org>
Content-Language: en-US
In-Reply-To: <20250410082616.1855860-2-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Wim,

On 10/04/2025 10:26, Daniel Lezcano wrote:
> Describe the Software Watchdog Timer available on the S32G platforms.
> 
> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Cc: Thomas Fossati <thomas.fossati@linaro.org>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---

I do believe all the comments have been taken into account, the driver 
has been reviewed and tested.

Is it possible to merge those changes in order to have them available in 
linux-next ?

Thanks

   -- Daniel



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
