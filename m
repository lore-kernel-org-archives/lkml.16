Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C48264609
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 20:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739220694; cv=none; b=Td+ZYXqkp6TZMs3Btk3C50G6ZLxyxIVlmhm+soEwkFAJevMlgaSKE88Kzk6yMMUGKXGk2W5ksJzmXPZRh7y2XV0TUhMYCXxVNKXjijFZprMzFSQsE6AC8lEM93OuheeIrtRTb4+b5xYhU0nPKqD36J7nG0802OUx45EPkKNFI+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739220694; c=relaxed/simple;
	bh=9Tts8bN+Vg2rVmzEoo3WT6QiqIuEvhCfD+wFxC4C/Jo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gwynA9UStRN5h9wbqDpQq6mgORpzd+JtTe5t7wP8Lx2Px4FB/FSN4V2JM3rn1itunT2fL+u2ae2esCZ97o3VhRF81GYhrfRosyV3mGFlHKEbu+ky3tuKbz9acJhdyQGSCmYUXn8W0byl4nqGbrbJPkMnvwMWxODA00vmwsNQfaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=I07Jfy4K; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="I07Jfy4K"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-724a5d0427fso3298923a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 12:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739220690; x=1739825490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pK7AXEk3/gHFbkZZyPXrZYFNc/hvV4Yc2BS6Eez02IA=;
        b=I07Jfy4Kjq2r6YSoOVR26jWRn+Bn8cPqLaX6uFnLJASNQNaxDP6TGtjdzbQ+H/WkbL
         nBbG6paq+YUXNhxkSVpZE9O+1wGJvJsuFfSTkn7iqlKqxAFe8zn4kuHvEss1dsDQAO+6
         27LZ4pJH5OwNK3bQuzB8APCd4MZFvyv/JOPNeoKDiToMHpeVFZ28KQ1FAuaAUClHXBAj
         jsCmwX/4x93UA1DUnJDYtnVvtc2LTnch6LrBxFj042F/Yeu2LwcoGHcjao9maqZNB/Q5
         fGC+vkOA1w5o5uNXlq8KvAh8323Ye41eSi1eIera4MMhTf0y/AX25Qm2ETlZBCNY+MFk
         Jy4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739220690; x=1739825490;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pK7AXEk3/gHFbkZZyPXrZYFNc/hvV4Yc2BS6Eez02IA=;
        b=QIcnQrgcPMi9Dgfdds0MNzcqZdDjjYG2mojpOhS+t2ArKn0ZTgpH/a0e8ZPlqtttX/
         D1Rdt4ILdQZAkEH0LodNrP/wCC2yIMK0YQ1dgsp96BjDmpi8SxBptnjtgV8kELRExSJ0
         2TadrNq94NiI4vFnZAbEPwVrLx0X5HzSwXj8YMFcrhjmTICI3Cy2tuJFK16+Wd9+mdq/
         +DOG5vgkiVDnmMEyfdKxfz7WrUt3aY8d/1mMvXj+FJkZQupY49HI+DbrlNDnCph2uZuz
         1F3h9aAYdcGcWzu8tOMWIzxb2PsrckIGcTO2FzMxjkr89gZ2AH1EtHkutWRKXCwffWSB
         JTAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvCQldOX58BXo7nwMC5scBWX4UPN5ywX9JduMhZRoVaueAqPbeywOTJ0otMQ7AurbhrLYA4N+j9eLTWzE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQpSUC0FQSgcrf8xr5lXAeEM0CocOu4MYx8stMsGL01TNRqNOG
	sVal+9vUh958l/tDxczpq4nPEFjT78HBlw27u1CujppsobQ0D+QIPDLJ5u3Rlgg=
X-Gm-Gg: ASbGnctmiE0KiN8ogqhG6tWeTK4pcPmv9IvK/EJB4hVchNeh3ngZBkUSLww8VZWcBjZ
	p48SwLLeMeCkPnF8i7UBMPNU3iNN7Y/ov+m9YV5eMgIQWxOqjatG0E5KDJeeTtkDRtrEHmQz63h
	mmlpWKCMnH0NfGrZke7M4sXmtbZoABUK35P3cZVgi664pTrH9Jl4CfpI9pwxoHrO7CZ40qOg9dd
	4OOdQUIfRJveAI+q2u1hcHGeSatrme5EHGGQwBCOOIbabbeBp6Fo5AXZsOmXL+Th58t242wTt0m
	ciF68YVyLnDWSiQiZM1TewXI0l+EOXDMwLNIXBuRh7ev2kWnFCHK
X-Google-Smtp-Source: AGHT+IFXJEk9MmUBU7EcXTekFZ1M/oOWVBHRM0C0GSQlAeJ7h505gqEEuTCNxJAioGvI8djE5kEKCg==
X-Received: by 2002:a05:6830:3917:b0:71d:ed5f:f181 with SMTP id 46e09a7af769-726b88957c6mr9514423a34.22.1739220690448;
        Mon, 10 Feb 2025 12:51:30 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726afa4fa41sm2598776a34.68.2025.02.10.12.51.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 12:51:30 -0800 (PST)
Message-ID: <425af129-f13d-44d5-8d49-c928265d635f@baylibre.com>
Date: Mon, 10 Feb 2025 14:51:29 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] iio: adc: ad4695: add oversampling support
To: Trevor Gamblin <tgamblin@baylibre.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250109-ad4695-oversampling-v2-0-a46ac487082c@baylibre.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250109-ad4695-oversampling-v2-0-a46ac487082c@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/9/25 12:47 PM, Trevor Gamblin wrote:
> Add driver logic and documentation for the oversampling feature of the
> AD469x parts from Analog Devices. For now, this only works with offload
> support, and takes advantage of that mode's higher performance to make
> oversampling possible on multiple channels with varying sampling
> frequencies. Some significant rework of the driver had to be done in
> order to conditionally support this feature, including use of
> iio_scan_types to help determine the appropriate spi message
> configurations depending on oversampling ratio.
> 
> This series depends on David's recent SPI engine changes for adding
> offload support:
> 
> https://lore.kernel.org/all/20241211-dlech-mainline-spi-engine-offload-2-v6-0-88ee574d5d03@baylibre.com/
> 
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---

Tested-by: David Lechner <dlechner@baylibre.com>

