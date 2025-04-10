Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E238315B135
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 15:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744298332; cv=none; b=YmfulpGPSn+muIawYrAo0a0ZyXOds0d7FF9PiFWyEgQ7XWbSv1SvGeNUxRVngulqUuDfMk67cr1Aj2mSzbZd8aU3k3kgeObvNsQP+34nqorbxdPY2g2kOL8LtUaP8zhISR6DxHdFNAdmgObP4F7xvxsydeKYKi/0TCqA80YXy1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744298332; c=relaxed/simple;
	bh=ZgOQAZvumfUXfeffHx7Q7R93BM4bR5fjCMubsX+S41I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b4DKjdajvfC1ywO3tkmC9z2d4+Ysiwh5n0jcesFGhvNp/wi3y2a8Kt7T5hpm2YbEbNlzJ1/h/Gbpjld69BTHenjL7SdK8QHTpqNrdk4m752D6VEXTPlU9Tr2w7VhskFF0BFYGp8dnHqDT/pDO++8gvW8H1RZjEq9HQZbKBeId1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=0PBRvYZl; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0PBRvYZl"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-72c47631b4cso532903a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 08:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744298329; x=1744903129; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y/MdAZR4KCk5kccToHKoimBc3Y45j9tz7BCn6zhsjAk=;
        b=0PBRvYZl9CU0sCyicY8d47aA6uQmiTHjp8grG6PCxHfl0FFNOBylNpw6mW93Lf+Dit
         lf/mb9E/Gp/P4hUvoighxhPVXvjZSaZiwMYu72Qa0iocCcgLgrWZChXvJqWGJBd0VsV/
         l/NZ7395GcK9+Dyf4CNWdRgJYuXwXneCKKq0HkUDTpyp+mEbErOpqiNd5W+oC9LwSjW0
         3KDcop9jHtISwWbYGr+8iQg7x/ADMBg6ibwJf+qrQrKFW7vkcCXELwYnY1YnWcRF5AOi
         RcRhKm1qzEtr4zl6xuIFJy8odFu4nJ58rRrS6+DnqfXvgf0za5ZL3KC3xYHEVL+iYs76
         5Hrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744298329; x=1744903129;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y/MdAZR4KCk5kccToHKoimBc3Y45j9tz7BCn6zhsjAk=;
        b=VqJSLeq38lxrNX+IcoRvUTwAryUb3mVDvw37zzbf/O7JioRzJuFA2eylDVcT4CvkT7
         q6blf9i5Da2e5LNkLxlQTJuy0ESOvJMy8V8/QkYZWUSF7XFZIMaePqzG1r/llClos2/B
         InjPPQgnhBc62cOKGZH17QMxOm0Pi7JhxyD5xVes5xSDWqNZc19CcdR4bMjtB3jqVfOT
         W5+jokzB+ODz/ij3cgCdD2X425SOmNIU+hOzJo6YVCbmlsKJMhhWhabil1YdIizn3S+w
         pFclFyVPCy1pjQELHrK9oXQ4gUGuhbck5z2za9GffCNxG/K24CwYQZdeL3bS3SZjSFLB
         A/qQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJbQ59LOH5hY92qyaO2uNarDvQLcxrCiLdrzrNgepVb2edkrwa8Ui+53hZESH3M5tAY92t+eBvbl0UJes=@vger.kernel.org
X-Gm-Message-State: AOJu0YzomMjlD3yrpcDjvlrFs+bHq4BZmRrOFLgnEQyHh+gwHA2GtXQZ
	ei3N6b+Wh0by0K0+t3ZkIcCqsuuvElFwK+ssou/2UzhyrTBuSexsxs9dWG0Kvo8=
X-Gm-Gg: ASbGncvzxBtK2l/M2UemOxgITB2WkncfuUqLbkdRDl/6FjpQ1lGyy+xh7ZaTZEGQg/C
	MRe0Yy8NNF151dqpI3ACErK4bNVAnMJxUWpDcCXBEixsY6FF/rFTimpS19sSN18KLU1DNQN/Xl3
	IRwkCP6dCqAkRvx1ERn6Q3z/uoD8IU5S1F2u7ZV2YLqyVcQKqZHKC1lLEmXI+CSw8P0xZ6pOEQT
	PcgUpYzwq9soy51KjPzkT5w+XkvTiHep6oekW8W9VcjQK3SyBtLpWarN3RG0IdWuqwkp7zuZs1m
	6OKcSHu9yftSI/js4Khmak4MODIZ9y98NVxU8swplecK4Bev19IdverP+C7KBSkb9PnELPv7aMc
	hkw==
X-Google-Smtp-Source: AGHT+IH6rrDtVsseh9Xvuyf/noenwuLMx9zjDSedC+XBqH+zbZ7Nwdp30096w8lLRgkzXs6H3TqsGA==
X-Received: by 2002:a05:6830:3506:b0:72a:1494:481e with SMTP id 46e09a7af769-72e7cb8d73amr1644611a34.0.1744298328766;
        Thu, 10 Apr 2025 08:18:48 -0700 (PDT)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72e73d52b7asm604325a34.13.2025.04.10.08.18.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 08:18:48 -0700 (PDT)
Message-ID: <3295202e-3f4b-457d-907a-9058a9719f83@baylibre.com>
Date: Thu, 10 Apr 2025 10:18:47 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: davinci: remove support for da830
To: Bartosz Golaszewski <brgl@bgdev.pl>, Russell King <linux@armlinux.org.uk>
Cc: Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250407-davinci-remove-da830-v1-1-39f803dd5a14@linaro.org>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250407-davinci-remove-da830-v1-1-39f803dd5a14@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/7/25 2:50 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> We no longer support any boards with the da830 SoC in mainline linux.
> Let's remove all bits and pieces related to it.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>

