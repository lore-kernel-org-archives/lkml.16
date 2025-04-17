Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D77F139CE3
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 15:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744903850; cv=none; b=ryh0dEURshFLfo7A47uei0XlJynObAQDvtRkPyU6V0YW0r3IJhY8xtZI1kBce2HH0iDgXe6cUvjVkKEslZ3M5yAs6LWv3Oi4DUqmn3pweOim7dTqhP2Tf68pYHG0xlHR80+yBApozjjPN0IAsLXCgFEZpNmFucbs2PPBQCyeG5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744903850; c=relaxed/simple;
	bh=1/T6eTWyjdWP8JXLFox7jHloAnTqxA+En1HzeLc8tMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jKXOGM3cIV+sxL+IrdN8nsgM4CPyGYxeuwnBxQm2IKQBNEpJlzVDZRuzn/G9E2ypphT+U+fLKzx9yfQBuVzjLkMAiVETf4f/oDsT5QThKy6Ioi6JAoaxzhdc9ApiceF/h5MMkbp/bMgzQ2Np8FXRU7lEr566S7hNX9PvhzRNghI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ozlSgqsR; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ozlSgqsR"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3fa6c54cdb2so665995b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744903847; x=1745508647; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XOeGPuCuer24nPs3jiXqTFKRA2f4CnIaphU/0fLPogg=;
        b=ozlSgqsRIAI8kucwGHF1c0gSxmM++NWPIlGor3E+KpGDKrULaH6dmu+soYKX2gvhXx
         v52T74HyF7n0U4TmRj9DPVV+aHZkw3WuVVlZGhKApKad10eZRsFP+Jty5kp/2RbsXhdl
         L1WRewnVypSIqrCqMaUNWEKXqqSmOjU2D8bH/KJVgHa4U0l3bCiQgxJTch6s93NqY/FF
         fVuUYkE44vTcEwlX8TQ6v5LwZOg8s/uLS31WOgEcKZqCyzvRWXh7/g/EGbvJ5jKOZW1e
         A8IstxVW3mYKBqC+trsmkrzzQBm/wuFvwu2CO0BDaF872O9EYKGhdAn0oxX72P07Lf82
         TyWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744903847; x=1745508647;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XOeGPuCuer24nPs3jiXqTFKRA2f4CnIaphU/0fLPogg=;
        b=wab/DQ952hZzUwTD7LJdJ6GzNGwYIw6VAl/WhiiPFvux7m33YyYL3g8674oFIFjiS9
         NnnTtJi47xAKYl5ziN42tHVsLhCrgND+E+tCkWQuEdA0ZCA/ZRodduF8cqQoMpJ7TdCS
         0NMMryRkD9VwRYJfArDdP83TED43MRoBT6qy5UYTpk+s8BB95hncGgjM0qG4ACcKyg6P
         +7mFfAF0lvYofta2JDocNjmgIv9KeLU9unmaaUN76zbZYAck2Mvpbc0Q9LxbrtKo94Jc
         PQDbvW2Xv8vs4PozBUJb+FO4ItJcnpJt0wgqo1bJW0tKvGvjjhbsErIanEHXsHW0/1Yu
         K1jA==
X-Forwarded-Encrypted: i=1; AJvYcCWTtpDQP8VEfW3yNk/VN3JI1Azn+ZSMObPay8mBwA6X/zNffPPGFIgGtTdErpG4Q28h/xiS5pUNOs45OfQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz8dUPFEEEiu8icV8AY/Y/HjoDaMuNNhrncgiVsmizIIhaYGB5
	EIXrsREQMMygBJ9xdmmG04qvvWjTzaM3m9uWmjAETF7sl0n5/cXTmDZKCV6VYOs=
X-Gm-Gg: ASbGncuzayKGQ4g7lhPfjOFFyBDrV5qRhKsqbQYgiRxWji+yw+GuBnsc9Df8YPXR2pi
	qG9XactcWCvwLG9ZUZVkd7fGPMD9flsbboh9l3NoTFVxzAeXdd+MFdDeq24eQDLbzWaxyQRL+Mf
	Z1DfO4CY8OMcvWV6myr5E7E3iXjzSUdiSbpJqzKjFI2CCEFgM6vettq4Hc7/mFsuxPgrCo48238
	aS2UFYXSpxmjs5/MaOPVcNS/fIGiQnJH3xx0VtRPuyXMQLTfHvYOH4D0z9ohGtj3OeVB2Pun5f+
	4fMbN+CweIpZpfh0zddRCK3ZYPssgcG9mAzcKoDEwJZYuG3kQplIa9YSeIVplsiEMWSn+MAELfK
	Ng/70godpeVPkk0Jovw==
X-Google-Smtp-Source: AGHT+IGAfa1PX8vDkTnj8WdCvrzF5q7nd7OzjW4lFji9+sTfZfkL3x0sCXY/RLK+4LCF+9aRtpGwLQ==
X-Received: by 2002:a05:6808:23c2:b0:3f7:e553:56c6 with SMTP id 5614622812f47-400b0242959mr3658195b6e.37.1744903847383;
        Thu, 17 Apr 2025 08:30:47 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee? ([2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4007639de56sm3244201b6e.34.2025.04.17.08.30.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 08:30:46 -0700 (PDT)
Message-ID: <1e22baf9-303e-4e49-9e9a-0daa3cd4caec@baylibre.com>
Date: Thu, 17 Apr 2025 10:30:46 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] spi: Introduce and use spi_bpw_to_bytes()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250417152529.490582-1-andriy.shevchenko@linux.intel.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250417152529.490582-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/17/25 10:24 AM, Andy Shevchenko wrote:
> Recently in the discussion with David the idea of having
> a common helper popped up. The helper converts the given
> bits per word to bytes. The result will always be power-of-two
> (e.g. for 37 bits it returns 8 bytes) or 0 for 0 input.
> More details are in the respective code comment.
> 
> This mini-series introduces it and replaces current users
> under drivers/spi and we expect more (and possibly some
> lurking in other subsystems).
> 
> Mark, if you okay with the idea, please, make this to be
> an immutable branch or tag for others to pull.
> 
> In v3:
> - fixed the typos in the examples
> 
> In v2:
> - improved examples in the code comment and commit message (David)
> 

Reviewed-by: David Lechner <dlechner@baylibre.com>

