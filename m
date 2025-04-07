Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A23B22756A;
	Mon,  7 Apr 2025 22:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744066341; cv=none; b=oF/TPLcHICs6o95tCH7xR2WS8SVFtj3cZxzf9vP+j9Uxwm34MS3PAXdwbWVIHo4JJrygGR0iRJi7+VKUMpfkbP/ardfTJdISVSRw2u2BdT68eTUmrdz8bDwNvtUs1AI9d7HamyUq+pnQJm6wl/cPU1Pf5FZNvCI5BVvBGlVZRgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744066341; c=relaxed/simple;
	bh=zDw6p/nrFabHPx2fns0yPmR1KypKtmRjTUt+OZMiUHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sz2tlF9d4ataEzoml1+BLveFDBHuKkf1eMIx9gwk7cMPF2v1DJgJzyXhtRHBd6ghRbF5IfaVn+yzYNrvkJKVWXIWVXorycnpWb0uqv/Hg4Xd8Huf/uoTVzfHBsKRemWE0/YWHgDwp1Ahxr0m+rHTWuMkDzhoifSIrM+RFdoUI0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CeKlbyKw; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CeKlbyKw"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22438c356c8so47224065ad.1;
        Mon, 07 Apr 2025 15:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744066339; x=1744671139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ONmngaQrt848tSL3nlt0r5IHv9Au2hpL7/9mDfuemm8=;
        b=CeKlbyKwHQPaCweoE1mYlUfUDYa/CNfC8KEWTMivr5mIdj2WAXDr9TZYwr5nst3bwu
         5SmiHYbG0cthPwWzvnHEtK30DewDRWI0aN9NQQ3DZsAC+jR3WQTVv1fIwn1sxrJNWeqc
         13nDUtzrDy4CmeTgcmn+d9kGPVADp+lJPi8vOZB3XK2Xd2e0xEIVfSjRuh/90y/ZqSjy
         /ND6ByfBmbWXwMMZLLqE8vlr5t6T9gD6kOWjtciB22AJ2QJk2JmJA4yICqoE0giWEqF6
         19j6bn6EWdahzMDR7aDLXNXfCcvsacEzBbWHNGfotX2w3wvB4i//O+vDuA8E+AP6pvgB
         nQbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744066339; x=1744671139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ONmngaQrt848tSL3nlt0r5IHv9Au2hpL7/9mDfuemm8=;
        b=fxBp4T7JmdP5gSoXKzHZItUpjaFgcr+jUwLXZ/4wz6XcM1zGp1VZ5SCG/UH4P7VmGt
         SYTFaHWG3V4tW3hrol2Xv/z/Yfml8JDciKMF9pC+VJLRLbpcTXIuIwFqjy9vwtUTMbtS
         K2nvlWKLfMAe+vJbYXMrBJBZxLWroz8JW8wzpNK811YS+ElchejtmrYDBJsPFfDuZGNB
         653L0MgaN5EtArcaT6zqzgCUF9jlYuNpr6YWgqas5qyGwz2hm8g4atr7LBiXcyD9q35T
         r46bZhYOPLc3xs+KMz+0/BMKObbP5nvhyq+AWczWvCSJ7kPwf/SRP4EOYw5KUghmK2c2
         BueA==
X-Forwarded-Encrypted: i=1; AJvYcCUhalfkoP8rVB1DRGlPuritXlke8+AmAnpI0bU8jxVda7NnYQuEDxzlc1rsnf3Uu0/QqZ6Ytl2CUtNmxD4/@vger.kernel.org, AJvYcCXL9lGjMceWLrScod6LrVf9F8WJCqGxKx9lrsiV3AVwRX8P9yN7s/E8C9NvwJJCjANZledYkZzyXwIQyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwY7WTqgU+oRg3I3C/pmXzxS5bMpt97t+G4T6H7N5JgwhwF1LRW
	jl4Q8QGCcGHW6pmmMhkR2qfjSQhlJINaFhOx/Ebz/+K6ufj4FRUL
X-Gm-Gg: ASbGncuTJ/xEVjokKBpbXB1T72XlHnMxaTIDGp2FuPgKWlHcTmVzpaa04YSnKisUgAn
	ZkVrLHD9laDLhCIQAjlvnaOiheJRONYcnwP1/RIuLEmWmAa+9f5dUNFkZQxJusxqh15gc6KSW/7
	MAzOyHhwlCSiJJA4Ak21OmR0B5SBER0O4yuzqJltPTfdKL+qu73PzlX7I5RjaMwKlZMEsQvzpuw
	z4rVAdfUDPYEJ6n0ET/9bUfmPOL4cz/905xnLXgFgYLr8s9P3DY2x08bWGv34YXpbSzmtMEcmqQ
	cc5G89UlLIW42UJsckRgluKlFDsEwbqUCmtWZdOK997RiAEVESa8Uy85Mw==
X-Google-Smtp-Source: AGHT+IFrmmDLxQJo6iSXayiG7seHcUOBypyJoJwOIWwgbxm4mHpcqg39FqW9z8AjzBzeF77nHQ6TdQ==
X-Received: by 2002:a17:902:d4c7:b0:220:ec62:7dc8 with SMTP id d9443c01a7336-22a8a85a18dmr198140525ad.2.1744066338692;
        Mon, 07 Apr 2025 15:52:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0b3009sm9094338b3a.123.2025.04.07.15.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 15:52:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 7 Apr 2025 15:52:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Your Name <naresh.solanki@9elements.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2] hwmon: (max6639) : Allow setting target RPM
Message-ID: <54c57f1c-38f4-42ad-9aca-05233c9a4483@roeck-us.net>
References: <20250404115646.2000563-1-you@example.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404115646.2000563-1-you@example.com>

On Fri, Apr 04, 2025 at 05:26:45PM +0530, Your Name wrote:
> From: Naresh Solanki <naresh.solanki@9elements.com>
> 
> Currently, during startup, the fan is set to its maximum RPM by default,
> which may not be suitable for all use cases.
> This patch introduces support for specifying a target RPM via the Device
> Tree property "target-rpm".
> 
> Changes:
> - Added `target_rpm` field to `max6639_data` structure to store the
>   target RPM for each fan channel.
> - Modified `max6639_probe_child_from_dt()` to read the `"target-rpm"`
>   property from the Device Tree and set `target_rpm` accordingly.
> - Updated `max6639_init_client()` to use `target_rpm` to compute the
>   initial PWM duty cycle instead of defaulting to full speed (120/120).
> 
> Behavior:
> - If `"target-rpm"` is specified, the fan speed is set accordingly.
> - If `"target-rpm"` is not specified, the previous behavior (full speed
>   at startup) is retained.
> 
> This allows better control over fan speed during system initialization.
> 
> Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>

Applied.

Thanks,
Guenter
