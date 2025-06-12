Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005A226FD91
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 16:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749745387; cv=none; b=fA2O+IXcXeEm0V1sVyznygNWWei9XddeREvj4LDYxNyRU6N90h78FU+cErSkhckRawXDk/43GuvtJPXqo5LaYEZYuDXbwQdE+48F433T7DTlapJcyhtCAaKzd94stK5l6LMoEKb1JzY+5tUsXLEkVHJBkTLiR73zxJtApUhgX6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749745387; c=relaxed/simple;
	bh=y4WFL2SbvgeV88Dn3pvioaJZuCsarQOzHwGhQ3uefK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fMelwO6XbGN2QYyj71E9CqXBz4aur9e9mu7m+e1eWYZ1l8xUdw78V2J+05+SzbLooPFQQzMw9z5wNfX0UuR2VLbkzWcvWd+2xPOogJ1pmNeHqqO0dT6Jy4+Ap0k58oNeg4Lk2WHcYQk/WOxZF+4cMIfR2+19Y4suuGeM7qDZzhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=GkdNJFj9; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="GkdNJFj9"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-72c13802133so415723a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 09:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749745383; x=1750350183; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oYwm5KPWdXCHcqPHzjdSfYHQXy0MsNGLcDPBqq6h364=;
        b=GkdNJFj9bv6/o+n4GP+aLJ6HpkHTVWFSr0x00mj2+Tqn1ojLKNp/itqxkBxNtSB0TD
         znkS2SImxvPCG1H8/3xJ8MWDMkqrASWn6eTnRRDLoq3naJId4LGIzdNdettKI97BYdJo
         RK29eeUI6pgknaVjgi3JAX+htiQW5sXqMVDrIdo9JGBC1aXNY7owkyEXYVysCccRrP3O
         Q8Vkd7z0LHGvSmAjBl3Hg3+LkY2r5e9lZ2D/pKIP9T4rebW101B+YKMURFm2Y37mvgWX
         aFJo9b4wZYDp9+4dFia2rYLD3vzjrQTgwx5KaGIWqmP1/f2zgM0IaW1OVhMDG/zNPDvX
         +Ogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749745383; x=1750350183;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oYwm5KPWdXCHcqPHzjdSfYHQXy0MsNGLcDPBqq6h364=;
        b=bSMPNkCsFTjGbbLd3XcXHHISxXlyNaN+zLjBoyAXyLON4kTWQywIHz6aMMnUT9bzWA
         Hugtfwt7v21U/lUIozrVUlSgNLs1xVPe5ev/660IDZiFHXPyjvJpVH3ICdbLteLxGJfU
         tQF7zgMkzIz1GtSa5EPzdNRR350Igq1lGCxN5vfH0IZ6QrC4IkHQlaO+8cjC1KNXh+dA
         zXKH5MXNvqYBD5CCAPTAdkSkUEXQdLGzeclm+DYh6UJsZK7O3XeATnkBKyrUtzQED+DZ
         8g8MHGasyYSnvNk56OFqtPmWvqZ5v8C5SumZtp7kjBvaHxx9Lp4NJM72mhdLQ5VuKj2N
         LXgw==
X-Forwarded-Encrypted: i=1; AJvYcCXQnuNdhKGiglL3DC+eS93jYx+d9uXxBi0SgbYfQfbLSn747maCm3Bqdf/lGVQWV2WpGQte014XOU7Tih0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTHEmsELcDo5NTHmLjQwi1T9TPk0+0iMEYYYnaWZKiPJjqF3t/
	OmxG+72Qquhxqaxa3AiRd+9enzTgjZbCgGVw+YFihOVkPUbrOnqYs+jox1BVWqjz/GQ=
X-Gm-Gg: ASbGncvu9f+WWxfcGy09zsy6sdZr4JzcWLdIQVDS+AQotfqMoE26yqYcRbxSfJmBPjY
	KygvQpRL+5MBgH34+UNJlAlnXHg5j6BFbKlJGciQZ8LOF2chDKj/ZkXSb/q2IQnmC3FW5Bf1s45
	wNmakE3silQlY8x95z3aURDjyqCdYp3bnra5LqKn3DDQ96s5FmBAfXy7zTvIg/rwS0o+8AL0/q3
	jNzgvY/odrzJS1e0mlda+F+gBYh0P+JmzlsP8YjPtiq6/zpD/1wj18Gsz4vG4TQKwHxQ3/+PCqc
	vMHy4xBwObobFxuf8MKrBWLSGmiKAu9N96NeZzML2ewqWO5zaj+kzfWHH/XOnSei/CP/Mqclog4
	bLG1Mewl4/mNKnFCsDuMsKkcbiZjqhm0KdZ3hn5k=
X-Google-Smtp-Source: AGHT+IFTwehji9nh5NvvDQuKE+AZnMrQrDaqD349Jh5toAGXoSpDzkbqFYAG6hYvMWXToSQmqhzzoA==
X-Received: by 2002:a05:6830:8088:b0:727:3957:8522 with SMTP id 46e09a7af769-73a13ab0ce3mr2638607a34.20.1749745382919;
        Thu, 12 Jun 2025 09:23:02 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:4753:719f:673f:547c? ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a16a2673dsm320209a34.5.2025.06.12.09.23.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 09:23:02 -0700 (PDT)
Message-ID: <9a3731cc-ea6f-45fa-a3e7-c2a33d44ecef@baylibre.com>
Date: Thu, 12 Jun 2025 11:23:01 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] iio: Add IIO_DENSITY channel type
To: surajsonawane0215@gmail.com, Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250612100758.13241-1-surajsonawane0215@gmail.com>
 <20250612100758.13241-2-surajsonawane0215@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250612100758.13241-2-surajsonawane0215@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/12/25 5:07 AM, surajsonawane0215@gmail.com wrote:
> From: Suraj Sonawane <surajsonawane0215@gmail.com>
> 
> Add IIO_DENSITY channel type for particulate matter sensors,
> with base units of grams per cubic meter (g/m³). This is needed
> for optical dust sensors like the Sharp GP2Y1010AU0F that measure
> airborne particle concentration rather than raw voltage.
> 
> Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
> ---
> V2: Initial version introducing IIO_DENSITY channel type
> 
>  Documentation/ABI/testing/sysfs-bus-iio | 8 ++++++++
>  include/uapi/linux/iio/types.h          | 1 +
>  2 files changed, 9 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-iio b/Documentation/ABI/testing/sysfs-bus-iio
> index 190bfcc1e..9b1b538ce 100644
> --- a/Documentation/ABI/testing/sysfs-bus-iio
> +++ b/Documentation/ABI/testing/sysfs-bus-iio
> @@ -2383,3 +2383,11 @@ Description:
>  		Value representing the user's attention to the system expressed
>  		in units as percentage. This usually means if the user is
>  		looking at the screen or not.
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/in_density_raw
> +KernelVersion:	6.15
> +Contact:	linux-iio@vger.kernel.org
> +Description:
> +		Raw reading from an optical dust sensor.
> +		This value is proportional to dust density in air,

I don't see why density would be specific to dust. We could make
this description more generic.

> +		with base units of g/m^3.
> +
> diff --git a/include/uapi/linux/iio/types.h b/include/uapi/linux/iio/types.h
> index 3eb0821af..e7d09ec0b 100644
> --- a/include/uapi/linux/iio/types.h
> +++ b/include/uapi/linux/iio/types.h
> @@ -37,6 +37,7 @@ enum iio_chan_type {
>  	IIO_DISTANCE,
>  	IIO_VELOCITY,
>  	IIO_CONCENTRATION,
> +	IIO_DENSITY,

This is part of the userspace ABI, new items have to be added
to the end. We can't change the meaning of the numeric values.

>  	IIO_RESISTANCE,
>  	IIO_PH,
>  	IIO_UVINDEX,

There are also a couple more places where this new channel needs
be added as well. See [1] for an example (although density probably
doesn't need to be added to known events).

[1]: https://lore.kernel.org/all/20241101-hpd-v3-3-e9c80b7c7164@chromium.org/
