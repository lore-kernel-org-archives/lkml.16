Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B25EACD;
	Sun,  6 Apr 2025 11:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743937690; cv=none; b=Y7R+OJzmwc9QgMky4ewi/0cfPT5cwH2mnwsvNKhvkPfaNAf2BCC2x4etnKGEjMQrXyHqqGIho96do72FLQaO/FjRACcHM7hd/XaMGCt5+heTZRxMwsAHZ26it3Xjs6jeeMt8FhWvBtM3p1/fNt47ysP6OTWlbBf5N7t0RUMWIbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743937690; c=relaxed/simple;
	bh=oUhxAnOMCHsqdz8DNQsypzn7+qug73xuCJrLxNoJ6pw=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=Ms1zxxndSNttxFQr+lf09vXA49sel/C3sA8LoF24TN260fgBC+kopzmLzOwaV3fRNAk6yiH3Q2phfZeDKfXLAPLat0+UyavlpN9sa0tlvyC5jzxDZntFJxPqLwpbIxiUV5mTEg0HvKO70oiysPp5QsSY6Cck6fAgwW46fye1AcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bAvsywBG; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bAvsywBG"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736b0c68092so2643097b3a.0;
        Sun, 06 Apr 2025 04:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743937688; x=1744542488; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZT8Yrr5vxwZg9guu+30Mw3AXNH1uiqWJ290W7GyHofo=;
        b=bAvsywBGRSiLhT40kWIJYL42DJbtaVgF8GgJvSoS7jxIA41gCjhPHmK591ATSbxT9N
         iBF+S4DvXF1dWT30+BQfUKB+V6GlFZmcTwN0ojtkDBknjNJkNzCAXUmE/flEewLBhtaw
         epLlB6wmZIvCjN+wwTXJX8r6f6GEiA2R8sr9lMVCVaO1WMADQvhWIxlOdt3Lj+xAgHzP
         vfvm9t9fiuCvZBKa664cCLNWpqAEdteVD/CS2eeh8sJWRDHN4IRbNkAwzl6BqntTv+yJ
         QKq5pSj4xTukyJIOZT4LFxVnNDBxzicMxwl6AkUUMdLXnn0rqsCMthdMYvxj/WdFKWjE
         5dJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743937688; x=1744542488;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZT8Yrr5vxwZg9guu+30Mw3AXNH1uiqWJ290W7GyHofo=;
        b=UU1LtfYB/TljChcTFaqIMNCjHZj4Vx0kRf3FxmHBxuoaqAb8pMVf8azZaZ+N2Qyb+9
         PdScbFd3zcW6MC42MSBNI5qB8kTTX9OVfIUnVQrfzEfo2f3Rcj3yArLicJWtPWBxPcES
         MLL4E6szT5zrFvcjnQFm0P2jxjiKIO0Iv7FtTrU19FBX6hTLnG6FM2CBcDN109FfyNAO
         XVVciPOSaebZzggN/4aJRJi5G3/4IpOPvJHK4HPGTwdLt25z11csISJOB3MNcQsGP0nF
         YdbwDX8gnN0Vq25FHRb48RP0rldU2X5oOQWFa6Vd1Q/fXg9LMNMRtYAXBHFw8ONYbbdY
         BjhA==
X-Forwarded-Encrypted: i=1; AJvYcCUrPkTqTp1I0ou1bYLefIajpGJOCtw/7dZ7COkZSBq7vq9E6ox6g6KlIfRK38rdqRgJjUaloYemhFx0Wkre@vger.kernel.org, AJvYcCWugRpPzhsVYMa0qcoHPuJmiyk1jruqOr00PY9TWpSp5e64KDe3zwt9oRycmXdBuRrjH0fuha3LGD0=@vger.kernel.org
X-Gm-Message-State: AOJu0YywsIpUEqmu7q3THrpM4ZBlcBlTYxo9zqQNWnBIJuIheHq0oD89
	sqF4IsBJlIoBQtgHgZKUGi3HUUeWn0zOyf7TcO3Bck5q3RJujC6P
X-Gm-Gg: ASbGncsxCpYIhAJsbtulHiumcaFtgmg7rYU2ZJKfyTdsVMFHxvu9nJj93etR5ukNwFb
	zEsREuR12EzPx2whCn4caj77qTcGgzdqrdZp1sxBalLkoOqXSJgBPHWirUt2yWUVk63HP9f2T2+
	X8d2FhrU7r13+G1h/LvKa9bfmjFWV+XN/BXGWmMPGmS/SokSWiUr6JkY7W1X+bnUAonEgRAC9+K
	1noCpnhlJ2g5fD9rn6iF6tSNbdObeX2ZDv/mGDr4TqK8TaUQgbLcoBcbD7DYEUqPdL4AZF7evzB
	2WDGWpQG7bVz8MSjYqdfGAgwqEOpTbwpfxIRB4Ke0V8IvPHlw1BAI7hBh/jKA6fiVyYLjw4bbnV
	kNZEj8zgXvkGBaiM=
X-Google-Smtp-Source: AGHT+IEjBAE/rld+9aiCuqigpuY+9zpIRh773iCRiL5ITop6OwxL60YXEg8KAl4CRgm6Ds8OhqjP/A==
X-Received: by 2002:a05:6a20:72a3:b0:1f3:4427:74ae with SMTP id adf61e73a8af0-2010462b559mr14593665637.25.1743937688009;
        Sun, 06 Apr 2025 04:08:08 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97ee385sm6471991b3a.45.2025.04.06.04.08.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 04:08:07 -0700 (PDT)
Message-ID: <48bdc474-2dd8-4c51-a32f-04bc7e9f50e7@gmail.com>
Date: Sun, 6 Apr 2025 20:08:04 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: kevinpaul468@gmail.com
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 rbrasga@uci.edu, rdunlap@infradead.org, skhan@linuxfoundation.org,
 Akira Yokosawa <akiyks@gmail.com>
References: <20250405165116.147958-1-kevinpaul468@gmail.com>
Subject: Re: [PATCH] Added usb_string function to a namespace
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20250405165116.147958-1-kevinpaul468@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Kevin Paul Reddy Janagari wrote:
> with reference to WARNING:
> Duplicate C declaration, also defined at driver-api/usb/gadget:804
> There is a function usb_string in the file message.c,
> there is also a struct usb_string in the kernel api headers.
> The docs is unable to index the function as the index is occupied by struct
> This fix adds messgae.c to the usb_core namespace (in docs) hence providing
> usb_sting a unique index usb_core.usb_string()

This is a bug of Sphinx.
Quote of my message in July 2023 [1]:

 > This is a bug of Sphinx >=3.1, first reported by Mauro back in September 2020 at:
 >
 >     https://github.com/sphinx-doc/sphinx/issues/8241
 >
 > It was closed when a local fix was presented.  Unfortunately, it was not
 > merged at the time and a subsequent pull request was opened at:
 >
 >     https://github.com/sphinx-doc/sphinx/pull/8313
 >
 > It is not merged yet and carries a milestone of Sphinx 7.x.

[1]: https://lore.kernel.org/0475d177-4c01-0988-0b34-3099dd703498@gmail.com/

The PR carries a milestone of Sphinx 8.x now ...

It might be a high time to make some noise in the PR.

       Thanks, Akira

> 
> Signed-off-by: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>
> ---
>  Documentation/driver-api/usb/usb.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/driver-api/usb/usb.rst b/Documentation/driver-api/usb/usb.rst
> index 89f9c37bb979..976fb4221062 100644
> --- a/Documentation/driver-api/usb/usb.rst
> +++ b/Documentation/driver-api/usb/usb.rst
> @@ -161,6 +161,7 @@ rely on 64bit DMA to eliminate another kind of bounce buffer.
>  .. kernel-doc:: drivers/usb/core/urb.c
>     :export:
>  
> +.. c:namespace:: usb_core
>  .. kernel-doc:: drivers/usb/core/message.c
>     :export:
>  
> -- 
> 2.39.5

