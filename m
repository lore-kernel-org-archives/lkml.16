Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46461E9B1A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 17:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751648650; cv=none; b=JAbco8iOlY6LibdUQqox7ySp/mEtNjsLsr7/ml/Jbaswbatncl91pS+6vqOPwA60XjjwUgG/wIYc69j6a1ORgxNbTPPNvXyg5CwK/zOkdEndmJSoL0gCffg3quNKfDLrxZk2X1RHqnrzLDxkE7CpTqd9WngyktpO44ApgpukvW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751648650; c=relaxed/simple;
	bh=lqYfplVOcJgRqG5FzapqJCwfBcQIrf/J0x6peT/mYX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gK/KJud4HgRCkPLhn/YkwZcZr2gFucJLlAXyeZHbIIeq+46McPclK3aTKu25WlGm7TFcA3NrytZ39pplp1pGzfLaMCM9ANgiBGlq5ACWkVGXfpHzKjDC68CN9MB8ntwGy0lP4RDvlPJhtOgjO7nVGHOVrrnI7MJRWuQmJCiRMfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZA86L84z; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZA86L84z"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-72c14138668so455909a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 10:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751648647; x=1752253447; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CN3sOATSj+YBgo48N1dSK7mB6HorpFhEBYf8ysHRS7I=;
        b=ZA86L84zlZsZxMCk8Pw225Rh3S51iiA1fiqwcm4v14l87c6viFExkQ6x03wakKKzix
         nG3y46JVFiQ2pQFW9JHIpYEqByY2jBY/H9sW82sZ4s+lnKhJt0Yf3Hod2zMCHObEFSxm
         TUvRiUd81zwjp7h3h+8f9rEDNekERbJSCL8HtbBFgJ22zvCl4NWyNdRI2+I/o07QtQ5v
         dgo7DXNOpKHp6vbaga40Z8tJXAK+Eml8pu7TwXjzArNH1jgUU/SMbP+4/ykl253NvrZs
         MEbjIuAxYIT+3iex43rG9ck0/lMPkGrRy9DL3zH0cc6Yag8+SOW6TlM17M1DXBD2+es0
         04yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751648647; x=1752253447;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CN3sOATSj+YBgo48N1dSK7mB6HorpFhEBYf8ysHRS7I=;
        b=YwFHLE1Sp+K0BpzDVLpcODeexO/TjhryfuYW6k+t9j0EJXQ1YMYIAL/vLSwzY0yOep
         L1wJalvgYBXH4HKr8IN/fCuWYl6Af71JOQmxYaCqIlN+9pNXO+wiM6f3q4NC+xSj9blZ
         rIgKMbto7KXIT2MDQjtg9wnVLyCjT5Rr4Id2CHtpGgMYEXtYgSODkl1cEdLS0q8bqf5a
         zFIEgQx0Dglnzc3JEUYVlR/Gcj0m9rjHOlsTcLvoKi8ucS+tNbGKrKR5puUDoN5JBAgY
         wjeLMdyKE5eAOskjK1P3qPGYEOLIV5TrR+z6jL32oWAf1zJ4Byloo+0zkMkqemnYhTt6
         Xbdg==
X-Forwarded-Encrypted: i=1; AJvYcCVVFyF1TcYyzMx1koCnZhFlPhA5+tTb4+mcxzyC7khpEyxcB6bd0K8xGZYD64xuG41Jo2ICBaxJiVKn6Yc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5TZjQzdU4XJVa7FF1JmLcrLwOyuOWmGNKW0nJxCSS6GmZXRVz
	xaOXrTwJ/kdSy8/0anpaj2HHYvnErhZcMJx1WJ80zX/CapsZOU+XsjGnugWfLLAu2gc=
X-Gm-Gg: ASbGncsNiOhleKpP3amgeSRMT1hnE3PgMoY9pSRKhFIjgbiXT5grJyx+VVY5DKdos42
	6ZrZJSwEvefGGg0i41LBqrcBUliTqazLbF8YZJS+6/Ex6LakMZ+amnY9N5F0SQ40FLqCyoe/oMV
	cggkAdiahxAWVUhYdZYOBFYJLC1QFXlFHIGP7W/eLnTbUsS9KY7yOLNyVFWZLd/b5u79mQm7Va5
	0Qu2YRqjJRc07UN4SHf1uPZTj17bxR9M9f7mLyLIab+uXBj7w7H7YouQN17vHP9H/j3SO6SYb2g
	vdbpEOAf+h09+PFnUTGe0Da0kIgwjcv4yD0NeuHNn1WAl2JX0XXSbWV91R//2Iz3q3GNIeISK3c
	1GkwDlIeWQXJOd5X+BrVrynu0oRWcl3M/zokChF8=
X-Google-Smtp-Source: AGHT+IG8EgByZwQ/4WmW/RGFyJyd8LeDPxSLfts6w/ve/r5mPINs/1/BOseR8G5eXYSst8Wib3FSWg==
X-Received: by 2002:a05:6830:490c:b0:73b:bd5:b9d9 with SMTP id 46e09a7af769-73ca48f7d1cmr2267150a34.10.1751648646855;
        Fri, 04 Jul 2025 10:04:06 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:d956:6ab3:7240:6bd9? ([2600:8803:e7e4:1d00:d956:6ab3:7240:6bd9])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73c9f9801dfsm435962a34.66.2025.07.04.10.04.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 10:04:05 -0700 (PDT)
Message-ID: <f023c92b-183c-4157-a6eb-ff722dfd716a@baylibre.com>
Date: Fri, 4 Jul 2025 12:04:04 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iio: adc: ad7173: fix num_slots
To: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250704-iio-adc-ad7173-fix-num_slots-on-most-chips-v2-1-a74941609143@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250704-iio-adc-ad7173-fix-num_slots-on-most-chips-v2-1-a74941609143@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/4/25 11:21 AM, David Lechner wrote:
> Fix the num_slots value for most chips in the ad7173 driver. The correct
> value is the number of CHANNELx registers on the chip.
> 
> In commit 4310e15b3140 ("iio: adc: ad7173: don't make copy of
> ad_sigma_delta_info struct"), we refactored struct ad_sigma_delta_info
> to be static const data instead of being dynamically populated during
> driver probe. However, there was an existing bug in commit 76a1e6a42802
> ("iio: adc: ad7173: add AD7173 driver") where num_slots was incorrectly
> set to the number of CONFIGx registers instead of the number of
> CHANNELx registers. This bug was partially propagated to the refactored
> code in that the 16-channel chips were only given 8 slots instead of
> 16 although we did managed to fix the 8-channel chips and one of the
> 4-channel chips in that commit. However, we botched two of the 4-channel
> chips and ended up incorrectly giving them 8 slots during the
> refactoring.
> 
> This patch fixes that mistake on the 4-channel chips and also
> corrects the 16-channel chips to have 16 slots.
> 
> Fixes: 4310e15b3140 ("iio: adc: ad7173: don't make copy of ad_sigma_delta_info struct")
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
> Changes in v2:
> - Improve commit message.
> - Link to v1: https://lore.kernel.org/r/20250703-iio-adc-ad7173-fix-num_slots-on-most-chips-v1-1-326c5d113e15@baylibre.com
> ---
>  drivers/iio/adc/ad7173.c | 37 +++++++++++++++++++++++++++----------
>  1 file changed, 27 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/iio/adc/ad7173.c b/drivers/iio/adc/ad7173.c
> index dd9fa35555c79ead5a1b88d1dc6cc3db122502be..9c197cea11eb955becf4b9b97246379fa9c5da13 100644
> --- a/drivers/iio/adc/ad7173.c
> +++ b/drivers/iio/adc/ad7173.c
> @@ -771,10 +771,27 @@ static const struct ad_sigma_delta_info ad7173_sigma_delta_info_8_slots = {
>  	.num_slots = 8,
>  };
>  
> +static const struct ad_sigma_delta_info ad7173_sigma_delta_info_16_slots = {
> +	.set_channel = ad7173_set_channel,
> +	.append_status = ad7173_append_status,
> +	.disable_all = ad7173_disable_all,
> +	.disable_one = ad7173_disable_one,
> +	.set_mode = ad7173_set_mode,
> +	.has_registers = true,
> +	.has_named_irqs = true,

> +	.supports_spi_offload = true,

Well drat, I was too quick with the update and the bots [1] noticed that
this conflicts with the in-flight patch that added this field [2].

I guess we can drop this one line, but then the other patch will wait
until this fix makes its way back into the togreg/testing branches.

[1]: https://lore.kernel.org/linux-iio/202507050018.iWEJiG04-lkp@intel.com/
[2]: https://lore.kernel.org/linux-iio/20250701-iio-adc-ad7173-add-spi-offload-support-v3-12-42abb83e3dac@baylibre.com/

> +	.addr_shift = 0,
> +	.read_mask = BIT(6),
> +	.status_ch_mask = GENMASK(3, 0),
> +	.data_reg = AD7173_REG_DATA,
> +	.num_resetclks = 64,
> +	.num_slots = 16,
> +};
> +
