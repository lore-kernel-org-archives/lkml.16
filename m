Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70941EB5E6
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 19:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746212667; cv=none; b=Vi2kzpPuWVh3Dvx+lB04esnKVHfg7syVHmKnr6FbqBIVqRjgdj5IPjMzhF2IsmLD/BSynsuyehB+nzMQ+znMtCD5pkrEjvm5zWk5cAF1a4x41FCZXijt/wcVD7U/NEWzT7MbyxI5FIvrnqRn1iTSZT9Nd2dRjloWO6bllcFT2LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746212667; c=relaxed/simple;
	bh=t066xCSdjFWkkNePOxD5BiV1LRz0rsf0Gzi1MYlr/s0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ub5c9068Hlzb1QBTQDdtNynrKeaf1QSgFh8zqgRc1JnMnX/XPx0eun5g1sVJwwG8Dn6FXQpfoMATUTFBHX5SPGCvnONwcHJcjEYGRCiT0yp+8TRqiX46SwBNn8c/CO4RfVJDQ2mcQKonYkvA1U/tQrHAkPlFY5PsvQc75NraWhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xmCuGVTN; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xmCuGVTN"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-400fa6eafa9so1695524b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 12:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746212665; x=1746817465; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BjRpOGGgbAWQbSA5NOkI3u2WsID4GcRH8J4ZAsY71WI=;
        b=xmCuGVTNBNKiQR9J3Ssdz/f2p6SPxKfn8YcsbT9c2Z3LZLHJLQLMa6SYPSPcp3NR/W
         fvlLxkFIlUzb3zTmSFj057EhNuCkfYUpgyBbFxeYw+ErKOm6dGqtO2Pgt00Ny8oXWc4F
         lkG9b6C34VdWRvKME/CMqEtviGLuNH35ZvRt1ycBLeEgkWqU9a56fbUfbMP+68yEyyMP
         bU8KQuH1WbockXHxG4cZA/vA6ZUmCX03R5i/Jao61OmkIXeHGioQ95mLIkthwy/bSS60
         a5dWlhs4mOzWvWzNvIranGtIiqt0CYY6SZ+Fi8Tv5WOWPWshSi9SrP28u5o5Qh3LKiZ4
         qBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746212665; x=1746817465;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BjRpOGGgbAWQbSA5NOkI3u2WsID4GcRH8J4ZAsY71WI=;
        b=IIybg6R8M/dKuxE5Yqbi/NvkBr3oTbZryX7KC3q4HYAd2cCNvz2w9XWlnF8DmA6giR
         vm2Mq+wG0MC5jdcoasLVINS4hu41VniUDd3L3AYwqqDuDxLZb+9dHL0VcsjRkpAzruaR
         0J45ydiu5i0vMdvp3VHUpWSUR1eB9wCakDv315tdPwdzCkhQctdBLWhBX2subgmSLxLo
         Rac1Xe/1uf5mPzEVvtJSygvXq8wYwIdyqfTnVw3zrRc4JydvsPnU8xqVcekyfaFL1rl8
         uAVb1dDNKsYJTg3tw0antRo6ADxywLTC/At94vnvQ/JfPsTGDsDiYmuLMtz0GwH5aZWT
         XWWA==
X-Forwarded-Encrypted: i=1; AJvYcCV3WA2m8DAXzD2G6wNEUjnhus3bNGJNXuqvJ8EfYZmXqzBPtdZ3j5hXWJDloOliTTMyalwZst+lx90XbDM=@vger.kernel.org
X-Gm-Message-State: AOJu0YybI7x+hawIk+5rlDugpWq3pxWCejTJjPTflXSXuaWyERigtRt+
	WMGXFh+2rS0WM5CNEdJmRjoz960XbT9dXIPTsVhgG8PLxTw6gDUCI4yIDSL92T0=
X-Gm-Gg: ASbGncvdmEdLkXUavf5MrKh0SOEeTgGqQKEj6sIX4zpHzjXQGBfvGzf5bCFsHP16PUc
	aqCJGaICrcUzeDgvmxNUcnFNPqGys3+ijY3jjPJ4CAiXIuVJE9oU7768YOntNoYMjN1d89dF8pY
	82cZBntLwhDYJSGjajH6mnjiYw26o/RkvYTUL0F4P+LcsXMnnHYWOieWeFJe6duyK5gAR4HuTPi
	XiX/qcKIxkCT9LCh+ysRH3knjtsGYIErLYO8TcCwKkUddr2t/TOsGYFwRuugQpP6R1YUYtSuVng
	cr0Hz1CDhK9IaVdDnlyOskei1gPDuLb2xbxU88QWBk2H1+vrf/8+5MzuF+JzJZrNApm9evYOGv5
	I9+zpxgy4J5fcn2cMIw==
X-Google-Smtp-Source: AGHT+IEfYJCLCxyAOFGQT4FLH2tIQ4AoMpU7TsaalCGnIgP55NFMW7fYVOitfdDNvza3Q28GZSzsgg==
X-Received: by 2002:a05:6808:1a0d:b0:3f8:acb4:8d8e with SMTP id 5614622812f47-40341c7bc0bmr2418662b6e.39.1746212664840;
        Fri, 02 May 2025 12:04:24 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:4489:d382:ca90:f531? ([2600:8803:e7e4:1d00:4489:d382:ca90:f531])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-607e7fb645bsm638237eaf.28.2025.05.02.12.04.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 12:04:23 -0700 (PDT)
Message-ID: <66eaff22-a3cb-4975-811c-5e85bd5b125b@baylibre.com>
Date: Fri, 2 May 2025 14:04:21 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] iio: adc: ad7606: add offset and phase calibration
 support
To: Angelo Dureghello <adureghello@baylibre.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250502-wip-bl-ad7606-calibration-v2-0-174bd0af081b@baylibre.com>
 <20250502-wip-bl-ad7606-calibration-v2-3-174bd0af081b@baylibre.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250502-wip-bl-ad7606-calibration-v2-3-174bd0af081b@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/2/25 8:27 AM, Angelo Dureghello wrote:
> From: Angelo Dureghello <adureghello@baylibre.com>
> 
> Add support for offset and phase calibration, only for
> devices that support software mode, that are:
> 
> ad7606b
> ad7606c-16
> ad7606c-18
> 
> Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> ---
Tested-by: David Lechner <dlechner@baylibre.com>
