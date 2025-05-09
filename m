Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D849225F79A;
	Fri,  9 May 2025 22:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746830250; cv=none; b=sbSYcQb3NxzwZWkD32bxJuRwLshhlX4JfSIdT1jEeYohWGdLlBy1MIMbOem1w/KxRcCiC5GC1aeaQN8ZIS0DsrFkguBQL365uYYHLhZJSmYAOSHdyLU4XZwqm/MOBI9Lixn+x7qUG7EOEVTuX04m+RJDyt0kXnmzCDeqDfAG1c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746830250; c=relaxed/simple;
	bh=A3w4RuWEmr5Bdnc77LbTtq0I+pATPQNYK9q8S93+9hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ouiTyXZlKzO0SFh29YuNkRBjh2AnFX2I92jRL2CrLQ3n8EeZ+aI/Lras1He8pvgWFnQos4yOSEkvAt5UNghE/XrrtprjJMAxW8XYi6WzJ8U9OX5w1ARTk8b9jUaBsVVbFfnpKP7XT4/tSbm0zl6tNum5JHw8j1LdO0h9MIvK4QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kBQRMJ9d; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kBQRMJ9d"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6f5365bdbaeso24749576d6.3;
        Fri, 09 May 2025 15:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746830248; x=1747435048; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wls++UmOuF/4mPyEoE5Qu8r2syygUVJY2hk7mKDxU0s=;
        b=kBQRMJ9dwJZgF1BGObmbsFrp1c8zoe9gH5bhZHEoBDtBdFn2aIu04JxsEBYJX6inH1
         xpzQJZCsiFJ24O32XqJD5r7uSwkBdWm5SRfLnFIfCfqMVbtOQdNJbb++eWiD+ZiVVudg
         Xsn62KG/AE+t/sIFFNG3Vxr5rEQEa8hAKqUsi3AhH7EK7fJYO7dzXBQyiNH+ONw3zib1
         yul7EVpISXUXnBy33zRs35n1W6SKhSK0wbKmJYPm7JoaFcoMhGkBn4RZCeOl4uptiUIf
         6+X9XKig51yWaWA7h5bl6X5cPorrFV7uLjnP/FuK9ZA7a6JbiUew4RzjA8BnErkqaLIM
         AeVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746830248; x=1747435048;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wls++UmOuF/4mPyEoE5Qu8r2syygUVJY2hk7mKDxU0s=;
        b=qMSeeMD2sGZOupiu+ZqzPBkOWZxf6GchDzb2MSPKUU63EdHvCVgFqR7KIBRoRFbIXN
         C/OfsA8FAywbJW7alHiZ8T+8T5IJ4GvX7T2enBI6vQpuCLfFx8U7qKLC6IJUfLCfyPp4
         VYBBXpA9O3xPwDHsUlfYmm1jX9cnOSwqX7e3hklj6+uQzIDaiqHDoYY218Vk6mb8uNLm
         LsfQs4JBo/5J5iywOwmTWJBfoQT6c5wTLcc0GzhHSjmJqaP/A9YXZ181gyuh+3dUW0xo
         /4EKEEgmo+xQ9YQS0PjjWjuV82q1Q0aU5a7GWGESDFmbyuJwJb4DMmCC+ypSwAC0nLnF
         pzUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFt9CMPHe8BR4fkG9HYIxky19NGITgzbHMtAJl3Cfcc2kiPoLNhae1sWk112pdZ0c2oNaouJjbsq6AsGW1@vger.kernel.org, AJvYcCUbKeZB5JYHpdk9QUPYukYYGWs0Fr6eKo86E5HHnlIXHV9tpSyqAl5QXAlOmQXSsJ24keDEeqy4Rs5f@vger.kernel.org
X-Gm-Message-State: AOJu0Yyin6tQJlQGk2nbKtInNNAUJhRHuBryDKZz4Wj+4unfBBFygx01
	mlB8qjExpo0W4wF9YZSggSwb1o/K3hRwerkmxW+7w1jbE08TNHye
X-Gm-Gg: ASbGncvZdm+jcWaaZNbQeCQfNmpIFXR2CshFqFXfQaz+HylL8ifcXCchPbkcYzR3Hpt
	s0cgrDQt9MuePsAx7qCLb0B56+ftktInoJINcWWsUjmovTUjHpcReTT6mUNhkxCagXr4OhKeG0l
	3tQwNwa2/UpTbbHCoYkZTyPChftNR1QWIJG/4sAoUOwmITqXwY0K9scBZKAd1mBkBpjlbQVlUeV
	jNQjISwgOvhQ9h6y14yI4K+koQsdKjKEKfeVL45cIr1pnHXJFGcYwIbh/i5GcdJUT4Jne3qQu7W
	4wy9S+BX1qlomXk6F79GNwr6YGE=
X-Google-Smtp-Source: AGHT+IGT4gynGMwVrr5xrHK5k1kPhXxajuXtDsQp/TWj+voeyjLTQ+BuPWtRD2a2o0XUy3TbdPOunQ==
X-Received: by 2002:a05:6214:528f:b0:6f4:f458:7ef2 with SMTP id 6a1803df08f44-6f6e480f83amr63955966d6.43.1746830247675;
        Fri, 09 May 2025 15:37:27 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f6e39e0685sm19440936d6.13.2025.05.09.15.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 15:37:27 -0700 (PDT)
Date: Sat, 10 May 2025 06:37:00 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Guo Ren <guoren@kernel.org>, Chao Wei <chao.wei@sophgo.com>, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: riscv: add Sophgo x4 EVB bindings
Message-ID: <5hn5ywklwlc2cfjeesarg7hcf2knsujloxijzp46o26ox33yzo@6kuf3bkqqigf>
References: <cover.1746811744.git.rabenda.cn@gmail.com>
 <4a9236b67a368423c1bb1a86720dfcd7593f0d1b.1746811744.git.rabenda.cn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a9236b67a368423c1bb1a86720dfcd7593f0d1b.1746811744.git.rabenda.cn@gmail.com>

On Sat, May 10, 2025 at 02:13:29AM +0800, Han Gao wrote:
> Add DT binding documentation for the Sophgo x4 EVB board [1].
> 
> Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x4-EVB [1]
> 
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> ---
>  Documentation/devicetree/bindings/riscv/sophgo.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
> index ee244c9f75cc..0f93f4cbfc6c 100644
> --- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
> +++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
> @@ -35,6 +35,7 @@ properties:
>            - enum:
>                - milkv,pioneer
>                - sophgo,sg2042-x8evb
> +              - sophgo,sg2042-x4evb
>            - const: sophgo,sg2042
>  
>  additionalProperties: true
> -- 
> 2.47.2
> 

Please keep alphabetical order.

Regards,
Inochi
