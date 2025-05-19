Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1971DF273
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 15:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747667750; cv=none; b=JHutcpqYDsYDCqAwxcHl6PTyuv3D5cHmcLrsU+XnSoMbjDK0H/+LDQN22UJsZFh7Mg6azjY7dgctCuh8whnqqKPP4xZe6EegoW2S92YEuqHmDB99yvW52wNx087t860wIz2EG+BrPOZt8d7bwW2JaBMsBaNWApftLytx4f9Z30k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747667750; c=relaxed/simple;
	bh=+waXAjHPp2/K09OP/lmIyVTinzIg/SgT5315tIPMPqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BuYtbv82yY6QUzTYSuWjWq/GMMsTbYq+GWvFmqOOAKC8rUJ/vuM0Zib/yPGj7evUip5TyTCy8zf3qAHmtsJk9w8taKBalHbpRYhYrysFw8cJ9gS0tDECwP6uZ+IA/5UD9Pwr5SUULTH3ncJ3MEbd3+HBkBXaiRg1Qm+Xf3qWH6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=GAMjgOvh; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="GAMjgOvh"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2cc36b39545so1769751fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747667747; x=1748272547; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RvV2Or60168cJV1VNj4zxLnm+t0hyD0WIsws06poAZg=;
        b=GAMjgOvhDmyalJfnykb2zZDfgSg+iGLKaPRpXCurM7/RGYd/qn9Eq9cBjoiKKam9eM
         /IaRt65UzPPnmBCEbUuxPsLOEaj1HodqDXlO4GNrHDx3/nSg5twXSrQPWMgiKOeFZbDc
         /V2ty0fKVRVWc8eGwBB7wVPfh/num5Z5ALIvqt4a9NJuDxwZVy4g+W5zTwX0RV6LJIC3
         K9pc/c2XGE2z+5l13UNfi5SqUzGHgkf5VjQYXJOLjLeftwDwvO7QxyOtkvuksyILDLKl
         WKmeKD8K1PLx0DnzJk7Upezs7OhjQ7iw3gyvbtu3AlYDCO3Ymm4MlK9jRylVOmwefPSw
         Vpww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747667747; x=1748272547;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RvV2Or60168cJV1VNj4zxLnm+t0hyD0WIsws06poAZg=;
        b=tWO1ihZGmH7GvUswnziMJ0Dxe7Nlv2+CXmvX1zoP4mB5v0/N/wpkxmfvT8NAmE2FZ4
         90+/j2Wl9abphNHwqJqeu3B9Rqe2QicpVjIX2ja3acVKYCxijXlw+UYTH7+04mWZ6zxx
         PmroM7dQQgGrDncZo34L0jZkn1o4Ye+OcVxcjvcoeWCe+jVUp0J/AtP3XyMKC2A1C22k
         7oiopripteD7enHjCx6GaL+uZJgFCnHgbvf5XQo5EzU+JzOKNHlxwv3qx6g83eEQ1FVV
         mHBiL7hxCnLP1A6pNk9wAxMFPzzg6LCyHZE80Vhn5Dr57tl9PXc1XgkBjxNFpFFgtwgV
         BEUA==
X-Forwarded-Encrypted: i=1; AJvYcCVJ6nkZv9k6qeHrSL/j/3Mxj0/TA3whmf9XI/qib78Pj98g/v58se4LHdunZsEL5GYFClPDcBQugkX4LRY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxai/1808BFtPpuJcw7kXV5No3JERTnFBiczhZYnwl7VfFqMk/f
	konEXHmUSr7rRTvWDBFCejIszFs4j5kE2jUNSc7BTeAeI5Qwk/cE0fEBhvTMwbn+y2A=
X-Gm-Gg: ASbGncsLHTRC0xfCb8OZDy7PYvnnZjX5J7Mu6DfoQZMSdegUzrbGBL9LABhFO/apCXi
	Bo/MhX3CCTJhqhl/Y1xnLb9MEcQfqwBii1aWwgVNgnAAe3zB88o/m/CXaX9NPphhuYhgTT30DGz
	LzBT7rCpmg6bXuO7Xi/RB2OwVA/ER/MU2tA07DrY/iJcvM5C3beaQ3CaR6w6ntXDpl84WkLWMhv
	vFSBAulhGBAjkbgBpOvLtNTe8PgC/ncbp8Y0bEdW2w7H007EcZ3pMunpUC+YOPYitJeZ0XaBZg4
	enO/cF3dZVN1Boa0iw2y5bXXdyZZRA7bQNlsalrRWDn+0roe/VW5ZT/XOi1fxhIEraqPtB/vJC5
	aUjOiTpP7JrHxnoS1Fn2+VjMzJA==
X-Google-Smtp-Source: AGHT+IFzJgzYkKq/FCa8DGUlgA0CYWDxadcejzt65LMfSHnfbviuGpb3/HHpYiAlzUizIYPsBvdn/A==
X-Received: by 2002:a05:6871:5291:b0:2d5:2dfd:e11c with SMTP id 586e51a60fabf-2e3c2800e09mr7135103fac.7.1747667746597;
        Mon, 19 May 2025 08:15:46 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:a628:91ca:eb5:d6f5? ([2600:8803:e7e4:1d00:a628:91ca:eb5:d6f5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2e3c0b21e70sm1776494fac.41.2025.05.19.08.15.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 08:15:45 -0700 (PDT)
Message-ID: <556bb250-d7c6-48aa-8773-26799265f782@baylibre.com>
Date: Mon, 19 May 2025 10:15:43 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] iio: adc: adi-axi-adc: add
 axi_adc_oversampling_ratio_set
To: Pop Ioan Daniel <pop.ioan-daniel@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Sergiu Cuciurean <sergiu.cuciurean@analog.com>,
 Dragos Bogdan <dragos.bogdan@analog.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Tobias Sperling <tobias.sperling@softing.com>,
 Alisa-Dariana Roman <alisadariana@gmail.com>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>,
 =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250519140220.81489-1-pop.ioan-daniel@analog.com>
 <20250519140220.81489-4-pop.ioan-daniel@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250519140220.81489-4-pop.ioan-daniel@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/19/25 9:02 AM, Pop Ioan Daniel wrote:
> Add support for setting decimation rate.
> 
> Signed-off-by: Pop Ioan Daniel <pop.ioan-daniel@analog.com>
> ---

With the bit below fixed:

Reviewed-by: David Lechner <dlechner@baylibre.com>

...
> @@ -381,7 +397,8 @@ static int axi_adc_ad485x_data_size_set(struct iio_backend *back,
>  }
>  
>  static int axi_adc_ad485x_oversampling_ratio_set(struct iio_backend *back,
> -					  unsigned int ratio)
> +						 unsigned int chan,
> +						 unsigned int ratio)

I think this change belongs in the previous patch. Most importantly because
it could cause a compile error during a git bisect, but also because that
is where it logically belongs.

>  {
>  	struct adi_axi_adc_state *st = iio_backend_get_priv(back);
>  
