Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508BE26C39E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 10:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750935409; cv=none; b=rJtgIirRho1yc+QznrSYbOihwKKAQmNgK12YdaXIMU+/yNdcejXBQweR08XH8JSX3gPbvi6d8OJS9sCUfY1lJL2Ld5QgWLR7/8G6zfMe3WnLobWheQqGLdEoV0Hvu1qGf6rNkbX9erD/6HttvmL1/56xX8v26rXGuYybtIE+keM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750935409; c=relaxed/simple;
	bh=unJVU3Xl3Wm7HDliPBmbf0uw3veqwlYT5BkTyANO19U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U0Q5+WKklOibt5oOzzZH0RbCMmSjIGoHGc8Eq/SH7SFRt6dPHdQTn9Earh1yBVV/5RhTArG4+AH0OSd94qWwEF9ejnPQFGwROKXBOVbmqDzOiQ14yE/bvQaMISW+/+uB5NZR4QkwyhP+5qzMmT65opQbcsrNvGtV8TfJQwYc6PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UEYEKqWd; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UEYEKqWd"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-32b3afec1c4so540381fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 03:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750935405; x=1751540205; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RrVEb7SOHXOjIaJsMr6PdsN8zJOeLk7RyAInvGFhJ0Q=;
        b=UEYEKqWdJJgWuMFvBOsD4Q6B/UfuBOrxO0TvlXtnGGFC2fcQgqtvwC5yuFviBretQI
         U5W6hcU9Lskj41m0iWJ59Supnxik4DeJ7Yb96UF9660zRiqfFTjIi0O+jJ0PCY6nq0pD
         J/g4icH0y+p3xlKTqlbS7Nbi0iUcL2jWtfhuBywdLqZF/sdVfVLKrLx3TA3ZG4vo4f4I
         Cn1evGDvVSE0KuJH33zrEmlYpEBQilUQj9ss6a11SUqfEZWnRFMppL4xEGMmBS+FIljU
         wOqop6o9/fznGMq5qtWhULatKz9lDHxXqpV40EZCM2CCkbbr8bUVHK6qORgAhmN6aNZV
         4S8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750935405; x=1751540205;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RrVEb7SOHXOjIaJsMr6PdsN8zJOeLk7RyAInvGFhJ0Q=;
        b=Lju2FoucSlC73Nrk+zq6ZbqMDfMS4l/8ZklTcDvgOAk463tPk4NTgPQvPCSakEY7ln
         zUc8gfVB+I+ulEIgY03k6uKrusZcdZB9ERZEiRae2cbogjKExqHZ3tDj3dRhIas9o124
         TfMm1fVfreOGGFUWdjJaDLjzfV9/Zfh38lswdv81C0VKPgfTyC3YZp+77sxCHZ5FoAJN
         hS6HsOMVidD27afRc8TaLeW4rKw0tF0zIjvP1dMioj5B4JbMFNzEordDLs6H49QBLzzY
         /6zf3dniLVvVOykZvAr6W9zn6fXGlDZPw6RUHk33KScWxZDPNysXy8bvHuRNrtX/te9Z
         ZA1w==
X-Gm-Message-State: AOJu0YwhHsy05m9o1smSOFjPumRNnzI2ReGAJ+88GXkZfsYhExmKUWQx
	z1V2U6SZuzZLyo7RY34bVuDH/rt5zjwZ5tpQqpv5MQgXOCsBxfndzk4A6q5dXeYFFO8=
X-Gm-Gg: ASbGnculPP5r6tMspj1Kj5Ja0u/4PbKkWrXeVxDhIzIhK+4JvrDnUyGirG3IcQkciuO
	1/LCUhha+SDLTkt93+oma0JxfKVRx3tN17OicRwx/74Yz/inwPKWYtMMU8EPmERr2hLk9Tidk9Q
	8vFfhrRiWiTHhmv0N1B6GWBs7Cdz7jBBSMdnWgo9oPL8aDncBlzULMorf9HJ7I6/nptCHC9qrGx
	N1VOf1z9MdBVXhmox52RJI+eoNrqi3o5zLniYVviUGEgxMqiSNp7CpPSFI9M5PrAQQ/lH2JcG5c
	o0hJEIIB9MwpvYuE6P3hpL3UXvDP0Ddf3BnYOWRrBx89oXOtMTg/3Vl/EBXPxBNNfEr6K1X3LJN
	Eynmf4KBF6iY9FpAphRkFjyNDG57GGhiQmKFy1cLq
X-Google-Smtp-Source: AGHT+IH57sZpqtFwHoa4JW0LInHA8kw3WhTt17SJ6Qp+hkH5OY5V3UsY/0SWnVUa5DXSYTbv462qjA==
X-Received: by 2002:a05:6512:234e:b0:554:f74e:9f0a with SMTP id 2adb3069b0e04-554fdd59ee7mr658062e87.14.1750935405424;
        Thu, 26 Jun 2025 03:56:45 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41c2ef7sm2581675e87.144.2025.06.26.03.56.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 03:56:45 -0700 (PDT)
Message-ID: <c4fc49d5-e946-4526-9100-0e891c4a5e4c@linaro.org>
Date: Thu, 26 Jun 2025 13:56:44 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] media: qcom: camss: Add support for MSM8939
Content-Language: ru-RU
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250613-camss-8x39-vbif-v5-0-a002301a7730@mailoo.org>
 <20250613-camss-8x39-vbif-v5-2-a002301a7730@mailoo.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250613-camss-8x39-vbif-v5-2-a002301a7730@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Vincent.

On 6/13/25 12:33, Vincent Knecht via B4 Relay wrote:
> From: Vincent Knecht <vincent.knecht@mailoo.org>
> 
> The camera subsystem for the MSM8939 is the same as MSM8916 except with
> 3 CSID instead of 2, and some higher clock rates.
> 
> As a quirk, this SoC needs writing values to 2 VFE VBIF registers
> (see downstream msm8939-camera.dtsi vbif-{regs,settings} properties).
> This fixes black stripes across sensor and garbage in CSID TPG outputs.
> 
> Add support for the MSM8939 camera subsystem.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>

I would repeat my ask given previously:

https://lore.kernel.org/all/877a72fa-cdae-4a66-9991-5ea86ef76aac@linaro.org/

<snip>

>   
> +static const struct camss_resources msm8939_resources = {
> +	.version = CAMSS_8x39,
> +	.csiphy_res = csiphy_res_8x39,
> +	.csid_res = csid_res_8x39,
> +	.ispif_res = &ispif_res_8x39,
> +	.vfe_res = vfe_res_8x39,
> +	.csiphy_num = ARRAY_SIZE(csiphy_res_8x39),
> +	.csid_num = ARRAY_SIZE(csid_res_8x39),
> +	.vfe_num = ARRAY_SIZE(vfe_res_8x39),
> +	.link_entities = camss_link_entities

There shall be no more dragging of the .link_entities, it's gone
a bit more than 6 weeks ago.

https://lore.kernel.org/all/20250513142353.2572563-4-vladimir.zapolskiy@linaro.org/

> +};
> +

For sake of simplicty you may include that particular change preserving
all its tags into your MSM8939 changeset, it will help a maintainer
to resolve merge conflicts.

-- 
Best wishes,
Vladimir
