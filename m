Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D4D802
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 12:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743595849; cv=none; b=aBh1n4pb5ovsTtcHSBLjYIGKnKA2jrD3veytnav/3CYeU+094uo0AYKA72tOJMJLuijMy3Cry3R3d5uVpcsrh7+UZ26Fi5uU/KIyCad7Ij3O+y9pftGMhpbezaiasZj5i5Cg0VYqnwzQyhKpci9HLjciQ7rxSg/OFO2ASCynnas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743595849; c=relaxed/simple;
	bh=IUSG6x8jg+0GyDRnL8VhaFv/k5xiKGHkXOpNUq/V8T0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a4GzqsvToVTPhcJ//2UJKBybEAaAKtIcKKFcHDQ0ZURtNyG1PcaftPsmnIx703aAd8xrcE/CZdrEJSUHV/hg+sGhwniqPfThARRIx36kvwRY9Oz/RsAokKsnuADG4hfwfqKXvUy/Cz3MZaqFrnlelmmel1uveigAo3Eq8e9PqKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hncSghb3; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hncSghb3"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so66438835e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 05:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743595846; x=1744200646; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RYc1LuB/xIhlHruIFuXcUs0gJsKL3VzWsL18O/VLaxk=;
        b=hncSghb3+51qvS62kA0kvOqS6WKdCgQDdrQIQI32lMeJM1Ow3AONb4jBf4jeTCbMTf
         JhTMVFD+Ia5+l4qLEsSUxe/2iUcM6xGIYKjfApABgC8wYoIWiA+ZA7a/Xfg3pxWEo6Cl
         65R9x6EDh21qCQ9eUb3hjYTQOVSIm5SCEyTfdaqtSbXRaK/rlZH66VVwPvoeDrXhdyja
         RUI+X6CAxTe7z5YadFFwNDAru2Tluio0G5JPkaODvygtOxrnPbUsYg7MjM3u5+FLriU3
         ZP+hD27iIqHzyCcTMuh1jZ6R7xAcuvLJ9/7tOLeqn1kDjfi5/4HnlN2TZsO3B216ayU6
         ohwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743595846; x=1744200646;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RYc1LuB/xIhlHruIFuXcUs0gJsKL3VzWsL18O/VLaxk=;
        b=WvE9UEu25ex6oEnRmuHGemC3oK8+HZyNd/6Z8b4lMsuvO01+pjzKkAzT0Uqk0r7fft
         cLGz6wC3ce5CgmYqFttLfQWhQpZJtCHcCkmrkWdnW8Pb1PgXFWq5SXLtv5YlQnM+qNTU
         v0ffY1r+T+e0K2lYVilWSrFUDK61Fj2rI+92CrovdWwPiipAgGakXhtUN2mxI3M5nxly
         vGzQwbiwqZApJiqNntm3OUC9QZG+d+MfKZWbS7ZgR0IxGVcktDguVL0GO2zhHxkDI5+d
         uLdmefIvOeui9wxyDq5QRJUA34QdB4Y26ndINAhZt2PpfXhXL+n4SHKie9lhPI4xnghM
         6RGw==
X-Forwarded-Encrypted: i=1; AJvYcCUMCQCKP3kSGvqrWpSuEqiehMjwMkmzyZzrZt4aMv+1Z8uU3DxcJx6Z6rAzpMvXAbg2qsABTJ5nyHqfspY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm5mQztvW02+9NeyaFWkGqHHq87+bg8Tk2Q9bjAH0gIhy+lLQb
	rLsv5dT8/FV+inHkOvyppXlE7Tf7mcrcN8QUi1qeGV+rKdJnZufIlihOStn8c9I=
X-Gm-Gg: ASbGncsVhVijqGATT8vIWZ9NP1zPPCLWXhLDhJ6ZyIw9Rwou2FdIl1bb2DJzVRfl0Dr
	mnPF7JP/WwEWG5u7bVexT03BCz3EoXfpIJ9u7VOZyzEYVk4RoPl1WPeWN0v+lQIXshf0joQlTpv
	LOo+lxIiba8aGpyZVhRUxn6/d7Xh/Q10MoyI7XCtIFHq5uFUjnapYwpXHTHrEYadwWBuugYclk4
	NKn9FBgPiNOyJx8dQv7UVEdo2mWcsIZqfi9xoK/F9lahkEF7OIHDIK+/fUd4rGmzb+YlGBE9pSC
	ZqaEKI3GbDWQeVHHXKabwuRqyjxVW/bIXMinLQE/UTTG7Phzm+q8wA==
X-Google-Smtp-Source: AGHT+IEUaRlq843Y7/JXmnM/b92P4/Evfz3Q6+OEj5CnWNZqw+5LChhSQFa8MJAQNMyyV9Csuv1rZQ==
X-Received: by 2002:a05:600c:b97:b0:43d:1b74:e89a with SMTP id 5b1f17b1804b1-43db6228697mr160288065e9.9.1743595845868;
        Wed, 02 Apr 2025 05:10:45 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb613a7edsm18871825e9.38.2025.04.02.05.10.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 05:10:44 -0700 (PDT)
Message-ID: <7aca2dd2-611d-4af2-b4a8-265528de2534@linaro.org>
Date: Wed, 2 Apr 2025 13:10:43 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] mtd: spi-nor: macronix: Move
 macronix_nor_default_init logic to macronix_nor_late_init
To: Cheng Ming Lin <linchengming884@gmail.com>, pratyush@kernel.org,
 mwalle@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: alvinzhou@mxic.com.tw, leoyu@mxic.com.tw,
 Cheng Ming Lin <chengminglin@mxic.com.tw>
References: <20250402085129.1027670-1-linchengming884@gmail.com>
 <20250402085129.1027670-4-linchengming884@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250402085129.1027670-4-linchengming884@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/2/25 9:51 AM, Cheng Ming Lin wrote:
> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
> 
> Remove macronix_nor_default_init and move its functionality to
> macronix_nor_late_init to ensure proper quad_enable initialization.
> 
> For MX25L3255E, SFDP follows JESD216, which does not include the Quad
> Enable bit Requirements field in its version. When the size field is
> removed, manufacturer->fixups->default_init hook is not executed, causing
> params->quad_enable not being overwritten with the intended function.
> Consequently, it remains as the default spi_nor_sr2_bit1_quad_enable.
> 
> By moving quad_enable setup from default_init to late_init, quad_enable
> is correctly assigned after spi_nor_init_params, regardless of the size
> field removal.
> 
> Additionally, according to spi-nor/core.h, quad_enable is more
> appropriately placed in late_init, as older SFDP versions did not define
> the Quad Enable bit Requirements. This change removes default_init and
> moves quad_enable handling to late_init accordingly.
> 
> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
> ---
>  drivers/mtd/spi-nor/macronix.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index 07e0bd0b70a0..216c02b92bfe 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -282,22 +282,17 @@ static int macronix_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
>  	return enable ? macronix_nor_octal_dtr_en(nor) : macronix_nor_octal_dtr_dis(nor);
>  }
>  
> -static void macronix_nor_default_init(struct spi_nor *nor)
> -{
> -	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
> -}
> -
>  static int macronix_nor_late_init(struct spi_nor *nor)
>  {
>  	if (!nor->params->set_4byte_addr_mode)
>  		nor->params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_en4b_ex4b;
> +	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;

Not at manufacturer level, please. You change the behavior and overwrite
whatever is retrieved from SFDP for all the flashes. Instead you should
introduce late init just for MX25L3255E, because set_4byte_addr_mode is
not covered in rev A of JESD216 I assume. Then if other flashes get this
param wrong from BFPT, amend them with post_bfpt hooks.


>  	nor->params->set_octal_dtr = macronix_nor_set_octal_dtr;
>  
>  	return 0;
>  }
>  
>  static const struct spi_nor_fixups macronix_nor_fixups = {
> -	.default_init = macronix_nor_default_init,
>  	.late_init = macronix_nor_late_init,
>  };
>  

