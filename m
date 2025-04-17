Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EB42550D7
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 17:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744910217; cv=none; b=PdeMh+itbHMCXEgWbnywv1bfenAorpWxO/AEmcMR8wlxtgQEoC8FYVXMabODumvxViOqHsEsIolK4rhhPFYEaLEpadr99b7LIfNXzKseEnzh6YPRQGhNqvKoaWdcavvnD9aJ19BODZNtcKbM6pzIr6N6XOn9GspTOwRCeNI1FHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744910217; c=relaxed/simple;
	bh=kI3m2dSSi5DaU0S+gonJqqPl8NDyXRdj0RJkeMs3+PE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DPxhdLMqwKC0TpSumEU9oHae4xm4X9IGU2Zgf+i4kMiR7yWK3u/KstVi50vuzSeKllT0SOVJHQF5UtrzOunRUTnZk33cHjriqXY6bImxqbUeO9v8n7I/62xu8ue5J+3B8oeaVnknnFBWQeHTogdqTvkNTwD0/0eeAQ8irCqCcUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=0HbllX6i; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0HbllX6i"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-72c27166ab3so649313a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 10:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744910214; x=1745515014; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NgF74Y1x7cdnEZ6zTA2j/Rn/3r7hmq1Fkr3Xk5+i6o0=;
        b=0HbllX6iUzAdRdqZCV6gtZ2JdH8crC5tTngpdeoDqEvpVQycfNBz6BZGXs81jVprKI
         9Bx4W3NqqKc2Ock8KZbhej6GWJVxBFtGrEl9woD18ORXWVA+ied5tPHQwZ4J0W1TmhG0
         uMLyk792ISllZf0wlrbqXYoysD1tTuUvMBzVrA/TybikFBso2ZgrlJquLMpY+Wgfg7H5
         7wdvRSDIzxGIZ+/hey5/OooVAuHQ785EtDJtlfKWB8sz+X1iOdTuddkAG4a2JuuzQzoP
         BVVjXz3ixlxg7zPgPSoJoob7YqxDKVK614NbIyDuIwHCWg+Oi3DpEtzXziL7cV4t9DaL
         FTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744910214; x=1745515014;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NgF74Y1x7cdnEZ6zTA2j/Rn/3r7hmq1Fkr3Xk5+i6o0=;
        b=m2mRqc7FaTCyXlTjs1fMT5Hx6pHTrBIS4FJFdsYMjcjuGinobV9e34Y1fur/ZM5GBT
         Mrps/OLDqztBjgR5FXWKI8t5UHhCfluAV/wXgS3u8YK/3jHzfQcxvMFuaTPPNyauJAa9
         Y2xnBGwN4vg2LXGGLtD9VtlCGYt24CbKZkUUEESERBfGtL/hUEfifI8XPr/WV4J6BFKI
         AYYmNt1swzvlzSKjJ6WrRdfqOXcprYFOUOl6lfMd3u58reN84fhwS9FdvvCv3kOc/24m
         X8juOrHmSII9v3GXeGhp/NP6ITmCH7BFs28xQ5TOVdiEdZhVR9c0ZJOCkLEqkXir7Cgc
         rQHw==
X-Forwarded-Encrypted: i=1; AJvYcCWUVGfDbPPAbB2rGpC7CmVoHc5bpHhJQ5E68jEUHHIcoRnfYZ6PgQIuf6tqmk9Dp+ZwJfljbo8oOOsQdw8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQejylV5jWYVNTkR6sjzJAHpM01SopjlhCVaqXoFF5ZTN+xINZ
	IYSxlYCGUFZsGQXngLRfC5d2c1Qcu9GVOufTY/vMot4rGt/UgTkdza+m3nsxZXg=
X-Gm-Gg: ASbGncsJj8JT3uZtwqeovNUV6Y2mkHiKa3dw6SxN0EanwftdvmH3dJt9gTjtLBS2xUs
	MEmC9w0cAccWAoBP0KanDOevD6ucXOTeEEAjUXp93chvkG87ku4U6wlpm7potXGgOIAWp7E2NJj
	juJHrho/DV1sLNO0muf8uzniaZmt0Nnvj8JXI19AXXl3rTszYtaMUg0iBK6Z6wugfduOlvDAG5I
	J0g0wWYhe3DcvHqIQPYBpoApYTM8X13qahU6JS0ZtjQWES2kibM844jwOrtRz021fcH5i1N3Y+d
	OnCzVroRwN2lnhs3VejnmERAyvIB4xM6Vx3wgQANX3nSix38kj9f8sdgBq1ZTUuF7jaQNuZrFXQ
	TzSvfkDhW4XKw5IPD3w==
X-Google-Smtp-Source: AGHT+IG2ya+SWKqWkEWn8r9JpbAOf9gOHMhtRFWZIjuKx4wF7uh2Oa75D8nMaKP4BJF4mMuOP+61ew==
X-Received: by 2002:a05:6830:61cc:b0:727:3f3e:53bb with SMTP id 46e09a7af769-72ec6d200d9mr4250103a34.24.1744910214661;
        Thu, 17 Apr 2025 10:16:54 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee? ([2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-730047caf24sm22509a34.38.2025.04.17.10.16.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 10:16:54 -0700 (PDT)
Message-ID: <6ff6e3be-6193-4977-977b-24de89c09153@baylibre.com>
Date: Thu, 17 Apr 2025 12:16:53 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] iio: more timestamp alignment
To: Andy Shevchenko <andy@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Tomasz Duszynski <tduszyns@gmail.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Andreas Klinger <ak@it-klinger.de>, Petre Rodan
 <petre.rodan@subdimension.ro>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
 <aAEz2ZD0Ipd1Xuy6@smile.fi.intel.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <aAEz2ZD0Ipd1Xuy6@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/17/25 12:01 PM, Andy Shevchenko wrote:
> On Thu, Apr 17, 2025 at 11:52:32AM -0500, David Lechner wrote:
>> Wile reviewing [1], I noticed a few more cases where we can use
>> aligned_s64 or need __aligned(8) on data structures used with
>> iio_push_to_buffers_with_timestamp().
>>
>> [1]: https://lore.kernel.org/linux-iio/20250413103443.2420727-1-jic23@kernel.org/
> 
> 
> Link: URL [1] :-)
> 
> This will help to maintainer with b4 as it manages tags.

In this case, I don't want b4 to add this Link: to all patches, it is just
context for the cover letter and not so useful long-term.

> 
>> Signed-off-by: David Lechner <dlechner@baylibre.com>
> 
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> for non-commented patches.
> 

