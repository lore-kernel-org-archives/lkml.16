Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2A120FA86
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 07:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603486; cv=none; b=rWTYjMiLnOGPvXkUHtTKYKdVNwhME2J2pv3i4z2qWtd3wGH7rcLrQsxtARU3gdE4wnXV+p8Iz6wTGf40mxB3iLZbo9OV9dHrcFpLGqmvWx4nQaw5GbTS2ewfjNA7jR6+LHEBgolQINmpE1nvvqG+PHcXTMVca+bCjUXWaus0EOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603486; c=relaxed/simple;
	bh=7npp6hPVQ4yM/96OUj34mNQnuigGDI/MdlJq9LMAeSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SRsIvqtv1zkzT3hHoldzX0LQ/rCANYIoBDmV3RZ1APutFNZfbTO2zTN3boQsosKEWO+GFk0A4Ladx8ISOxH+ktoN6+uhky/YbY1oJAw/njeVXFIKCVwa6ECURWTjCx2gKrNgayiQRrGwGLw7hsaYuDfNfBwHhEBKwItA/Tx6+es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OXPQi0Os; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OXPQi0Os"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a0adcc3e54so885064f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 00:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746603483; x=1747208283; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ku1Cd6liaJS1iLKgaFG0kdzf7HtFlMcgCf1BXc7L4Dk=;
        b=OXPQi0Os+ZfrAqN/E9Klo3GQjvwLQuTZDzVb8EI3I4uSZj7J1SPKTL0JYDbkHbUC42
         l/r/L8V3RLkyV8JaCp7uZ8KSW4a5VKXGUiOEJXIT/gYjgukikaULnOkQqzvdKxesF5+l
         w76eHPB9yS3NsfF7DD1pIU4fmWNNH/f7u01zswWsycSspOplD8tlRzSqqeP1RSQoQeJr
         NjpVAFMgp+Nn2fK8U2pe+lrctQ4E/E57uIAtTO/Qb30FiCwBqVTU/nuW7e4i4i+aSBmG
         awLV94yjBEPS8IcL4nKTAnlrhkTifkLn2AGOawWv1Gxbmd5t897KsN+a/XhVITLAAaK4
         WmXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746603483; x=1747208283;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ku1Cd6liaJS1iLKgaFG0kdzf7HtFlMcgCf1BXc7L4Dk=;
        b=XTarT8HyMTm9DaRXcSKSvtQPvtH2lvxdV6jRqdQtQVCPjYKrDNSxvAbnNNnp4vuINA
         J9ZtsdR0Kp5WlX5Va69xWv04QhLcDgYJ2eFOWs0JyGBUtx8/MaNmytCOBlYSAWF1YwRj
         KwrsEiHGN4SivoP+jSTH4op2GRtdrxgu3bn8/alUiotoilnhWFjsIkw1ftX19l6USgx/
         2v7ycwAn5KtxEeFFQo0/2WSMIkYZsWtmrX7Fk/5ULc3AURHHB7HZMgJKhiUcYoYg0SIs
         wkWq+TGId7s749a5YkRj6gb1eSudN7X9BNRuyv71t/YrYaYfPdbfWTGVqHDupcHkrz66
         pL+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUa67ObakfPMiRskewobJePIWUCgoIajNGNfvCleYjzPaqZ9wnMQ3IZoF22OmfwcNM1IzfboWBuj/QJNuM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3Ub2bt6INWFkH4mlvzfcrfIgDI2hjzrPqitcK+GwTUh47c+fy
	me2k3YgKKo/cSm5OEJYvcHlObvyV4X9Hx5wXqyrLprTyU9qyciBRC/bXkZBWQQk=
X-Gm-Gg: ASbGncua3gb4aBVdbsbJIyf6IVz0SRzU5U6gcRhq3EE5/T0SfKnie+GiaNMeYKOExC3
	SwgrCCdfANU+Gal/hXFf8Y8oI3yHFymUc3ZeHUfDDe1Bp1xL/W1CdWk2PGC9EsZGNtu82buvRjF
	EBTa0nXsXW7/pY8HuRYXrpW9RCphB2Ar+12SHi9uA3PKjm9Wgz7biiwJYFZfTXTioBc33CfzLNZ
	NDz4GYiYJhGY0YoIhNGIl62Tip6Le3V8RYwP96dPR/RmyIBI/CTwpeg29TEzEyfzF3TrqpuwXI8
	+Z3PVdkzX2bDhnfQaEt53737P/9u3TtIrhxhNmwP47n2IzMTbDhXST1FkL/W9wQ46SaLRFnkVU4
	qy+8=
X-Google-Smtp-Source: AGHT+IH2OGqrTp/OeMgPGxQlZfnrGAyad5LXS0wg/MdZb7u/oyAnw+kFBdwrxcGQe3PnVxyYJ6CP0w==
X-Received: by 2002:a05:6000:1448:b0:3a0:b733:f255 with SMTP id ffacd0b85a97d-3a0b733f3d8mr119641f8f.25.1746603482927;
        Wed, 07 May 2025 00:38:02 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae0bb5sm15753969f8f.7.2025.05.07.00.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 00:38:02 -0700 (PDT)
Date: Wed, 7 May 2025 09:38:00 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Robert Lin <robelin@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de,
	pohsuns@nvidia.com, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, sumitg@nvidia.com,
	linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
	linux@roeck-us.net
Subject: Re: [PATCH v8 0/3] clocksource: fix Tegra234 SoC Watchdog Timer.
Message-ID: <aBsN2Lvx476ZO6Lv@mai.linaro.org>
References: <20250507044311.3751033-1-robelin@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250507044311.3751033-1-robelin@nvidia.com>

On Wed, May 07, 2025 at 12:43:08PM +0800, Robert Lin wrote:
> From: robelin <robelin@nvidia.com>
> 
> This set of patches includes a fix for watchdog for it may not bark
> due to self-pinging and adds WDIOC_GETTIMELEFT support.
> 
> --
> V8:
> - Change WARN_ON() to WARN_ON_ONCE() to not spew too many message
> - Use pre-exist DIV_ROUND_CLOSEST_ULL for the same math operation
> 
> V7:
> - Fix formatting
> - Consider overflow and warn if happens
> 
> V6:
> - Fix timeleft value addition using unmatched time unit
> - Use u64 type to maintain the microseconds value in case of overflow
> 
> V5:
> - Print warning message if get unexpected value from the register
> 
> V4:
> - Improve the precision of timeleft value
> - Fix the unused variable warning
> 
> V3:
> - Improve comment description
> - Refactor to fit codeline within 80 columns
> - Remove unused if(0) blocks
> 
> 
> V2:
> - Fix a compilation error, a warning and updates copyright
> --

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
