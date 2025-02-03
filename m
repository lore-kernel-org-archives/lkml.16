Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875AB1D6DDD
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 19:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738611683; cv=none; b=EbLFuvTVmNyXu7zY8OQmTMo8wKdB4IWRJ2HD4DCjCmBHEuEg9KXNbNLY764jxWYaVJN5prKah3GTal6KGvNC3EpuH1DW7RK0T50WwK4C/Av0wPsDPSyFVVjE40dT6TLOMgFK7E6vT4HguM+Qmpt8mPWJKQ1Khz9WS0Vqua5XLkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738611683; c=relaxed/simple;
	bh=C2rIhJCYgLZHofyOC36e6wr55qi2ZJaXCF/8/4URIVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uUBqRRLkjsV+e0juys1qH+FIGuZzHR+zK2oQlxG7JmjBvBnmb7ygljWXY893485HrA5iRWnxPrAmKnLucD+fJIysRs9aJUKQLoF6o63mVeB390R9u89ZAx5cU0BSADkM8GAFxbkpmBKsv8sw05gI+gsWuHqEBPCV3QHK08mkdTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=t95rlNLP; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="t95rlNLP"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-723442fd88aso1283682a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 11:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738611680; x=1739216480; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YppiSqGC2tFNDurF8FBbMGB85ESIBegHPAFelTZuV6s=;
        b=t95rlNLPrbcBv9Uo/BeuNrGH7LEFgSm0RBN/ZxjmrJtb5Np2kE5m6WbXJsi8u9z6D+
         F10scF65mSetwwq/AuuRmA1QNRKnRG+Wzed3+Y383VmGXn469RBhH8k3VmklufMqRcPo
         dBc88EWRdLRgiwFK7oG9+0lcAuFH/USuewrVF87Ig+EueBcDtmWgsw2QdpTBwABJYWMl
         UGirutvDx4qGFfURCxG155LyQWV2ejbv2FBV+PvSr4DhQeunenVqUtxGpz36X8tV41gv
         e85W/nwZ2qf6GZCPwh89d9QEJUBHVKcDutW1BHgi62Z/bVIS7AYfAZApj3IyzXbbPY+5
         cu8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738611680; x=1739216480;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YppiSqGC2tFNDurF8FBbMGB85ESIBegHPAFelTZuV6s=;
        b=b5hY25JXA6KLzlXhb3rYE+NXwO3fOTIXsM1dnL060G38YpPLOM2rO/T0PfLWa3Aeiv
         WMG5WI3UwKm3JGQmuKfMvu+8nGUa7uIPV94e1ESdwieu6dJSbLFK8hMXMrKNkF4T8O+/
         Twg/qryXKjPzhl2GnBXcGbRftMogPpgU+ooZbl3WF2lE6Grxyf2nuM4pmgGEt5qDuMFc
         cjY9On8NdM9V3iLPZMnmCVKd3yEGcf+MAexp75Ye85Lh1rP4F/Rj0XPL8zunpOCaRAZB
         rVSQDjb4wy6iQXltWlptv1NVVtzBgkvmiHKWpzMu+m0dJYpy3z023iAKn4IDCw/Q7jtD
         K/Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVSAlIdI8JZ2fQ+6KZNwcD2Ap9A1p3q7XggNRnoQUcVBS/0iITiGIF8wdqJ3XY9ZRPCksPY/iMvsfwGIlg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVdK+z/MH/rWzWPgckm1obfGiEoLyTutQnC8ZvJqwbngcksD3H
	glWYzq79/kitxS0Hde4Xp1QQJAP8NsJvuaDe5ug6oBm8EhmXdzI4ZF2abbp3xKQ=
X-Gm-Gg: ASbGncuUWgLgk19C1kPDNKhQ85MwtD9nz8Tp0Xtjl//CUb7ZDKy+I1Uk+AKUaJpOQQU
	yIweutMRTkbyOXc73wjG0gRW4bOa8Aln9BpHynrxTr2BKjRuT1bd/GEqcEZ8bbTT8QlQWPfY5nY
	0BXUBc2emlj8c+A14VAkOmCIC0a9DeFp9ZSy+mat1mkrL8jcnVT4cCDxccXXlzkUvmsbipj9ccM
	HypKlGFeMfSien4eTD1MMd8cwJGi+lAzxIKCSRgiD0Pz+0HkO+RxQwks2YvHR1fE7uZDiB+D3Yu
	G+YoNMB4EsuU0re4pBoNYny8L9uk9axcpTbj2fwzjysmWSY8ctY2
X-Google-Smtp-Source: AGHT+IEQz7OUSD6AXEJ8r5qtD8jUHGuAC+qm8pf8qvOq6RQJOACIueUVlB1z2UcBizH91IDpylQdnA==
X-Received: by 2002:a05:6830:6887:b0:71e:57b5:2251 with SMTP id 46e09a7af769-72656763fe0mr13740128a34.11.1738611680379;
        Mon, 03 Feb 2025 11:41:20 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fc22514e0bsm1951705eaf.29.2025.02.03.11.41.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 11:41:19 -0800 (PST)
Message-ID: <322c34f8-a920-41d1-b77c-09537554ad04@baylibre.com>
Date: Mon, 3 Feb 2025 13:41:18 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] Documentation: ABI: IIO: Re-add
 sysfs-bus-iio-adc-ad4130
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: cosmin.tanislav@analog.com, jic23@kernel.org, lars@metafoo.de,
 granquet@baylibre.com, u.kleine-koenig@baylibre.com,
 marcelo.schmitt1@gmail.com
References: <cover.1738608986.git.marcelo.schmitt@analog.com>
 <0d73303f2bca3312ccf2abfeb2c654c228fa7f60.1738608986.git.marcelo.schmitt@analog.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <0d73303f2bca3312ccf2abfeb2c654c228fa7f60.1738608986.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/3/25 1:11 PM, Marcelo Schmitt wrote:
> The ad4130 driver exports in_voltageY-voltageZ_filter_mode and
> in_voltage-voltage_filter_mode_available attributes to user space. A
> previous patch merged the documentation for those attributes with the
> documentation for filter_type/filter_type_available into sysfs-bus-iio.
> Filter mode and filter type refer to the same feature which is the digital
> filter applied over ADC samples. However, since datasheets use the term
> `filter type` and ad4130 driver is the only one using filter_mode,
> deprecate the filter_mode ABI in favor of filter_type and keep the docs
> separate to avoid confusion and intricate attribute descriptions.
> 


> The digital filter helps shape the noise rejection bandwidth and is
> supposed to be adjusted according to the signal of interest. Depending on
> the particular ADC design, the digital filter configuration may have an
> impact on the output data rate (ODR) (which is equivalent to the sampling
> frequency for SAR ADCs - `sampling_frequency` ABI), 3dB cutoff frequency of
> the filter (`_low_pass_3db_frequency` attributes), or settling time.
> 
> Digital filters are a common feature among sigma-delta ADCs and
> IIO drivers set digital filters according to different attributes.
> ad4130 and ad7779 filter options are supported through dedicated
> filter_mode/filter_type attributes in sysfs.
> ad7768-1 and ad7173 set the sinc filters according to the
> sampling_frequency attribute. No filter_type attribute.
> ad7124 sets the digital filter according to a filter_low_pass_3db_frequency
> attribute so it doesn't export filter type attributes to user space.

These last two paragraphs seems a bit excessive and could be dropped.

> 
> Fixes: 01bb12922b60 ("Documentation: ABI: added filter mode doc in sysfs-bus-iio")
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---
>  Documentation/ABI/testing/sysfs-bus-iio       |  1 -
>  .../ABI/testing/sysfs-bus-iio-adc-ad4130      | 20 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  3 files changed, 21 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-adc-ad4130
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-iio b/Documentation/ABI/testing/sysfs-bus-iio
> index ff9cc09360dc..e4fd99c92d81 100644
> --- a/Documentation/ABI/testing/sysfs-bus-iio
> +++ b/Documentation/ABI/testing/sysfs-bus-iio
> @@ -2277,7 +2277,6 @@ Description:
>  		representing the sensor unique ID number.
>  
>  What:		/sys/bus/iio/devices/iio:deviceX/filter_type_available
> -What:		/sys/bus/iio/devices/iio:deviceX/in_voltage-voltage_filter_mode_available

Instead of removing the line, I think we need to replace it with:

/sys/bus/iio/devices/iio:deviceX/in_voltage-voltage_filter_type_available

(change mode to type)

This attribute is used in the previous patch.


>  KernelVersion:	6.1
>  Contact:	linux-iio@vger.kernel.org
>  Description:
With those changes...

Reviewed-by: David Lechner <dlechner@baylibre.com>
