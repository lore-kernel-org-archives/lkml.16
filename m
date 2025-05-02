Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100141E883A
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 09:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746177792; cv=none; b=C+lVbwvvGXxXwJitRIoIsdpZ/+DM9E6NWOKRfhB4e0WVc+ejEitnfWkkTsMlXZxfdbMd9r7x9OP9iS4dSYh5gnjT1GuPvt7rjLJtk3U2v9MhjqXzAkJPIU8xKCVmqltMs2UzJ4OuztjjE5byreqgVmruPZLg2nLsyTnIfA5SkMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746177792; c=relaxed/simple;
	bh=ekJa/d94ESjfMuIQNVaqRWOsDNgRaf36C6VoqCPZFV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kj64vJFD1a3VG32d8zytDdvUvyPG9t0iF8pPqFzw1SbubJ4vfT1hWzPpEs0Wv3wLE4QaxP7b4OsebUf00wEqJHYAIEt/a4libECAePOotqqv5E+wiFii2MlwBYjp3PVtj4RJOJkQpA2SuJXYUtwkHVZuYz0WrJIWepRKaCZA6Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sNYaepKS; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sNYaepKS"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39ee5ac4321so1828824f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 02:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746177789; x=1746782589; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CaOQHqMDa8OZ46blFqHo7Rw/aRIi/u9Q9Wy1w1jQELI=;
        b=sNYaepKSdKb83a8yXkERuKY/EQ1QRoA15T8YMXgcfz+biHzAxFFRQ+ZTad52Nk7mEX
         wKfsBfkIDRFjiet42P4D/8h5WnWIafypeTCuHXW9RZBppR2n0Lw20I2pWEw5o1wjTuUq
         79VUgNdB/DHkeBDX2cjp94XrjqdOdGM/OC9sPlf+XaEzBFqtnJ1GA5H/8WWyDD/pFLxa
         zgFVMM8hwTqjwrYD1g8kfDde1OSIzzWZmKGVHGaQs196pPJg/EDzg860HrDR1dLr2Psz
         577/OjMCQ3micw+sLeXw+Qdthlxy/VgPOfp9K7ci/PQqhL0CcvccJxw1rO+cHQctICQX
         V9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746177789; x=1746782589;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CaOQHqMDa8OZ46blFqHo7Rw/aRIi/u9Q9Wy1w1jQELI=;
        b=sJJwzyCZDdTUrptvxOzW3kqQ/kFtuVrZWKPosxDOyAY94qhJt0kbd3HVA4f8aidXV3
         4wgfo6CqYc/BkIgq1yK8dAXIY9IaTtUVeMf3gGbT4g32I0etd8cV5up2n4B75ZtzVdiQ
         4TbFXHEqz2ri3m8eXNs6+BKW76THEZpeHqqE76w6izWnTP0XW1lUuRLcARNP+CjIBu2H
         Ac/EqnBbqhr0iqjjfl7B8kAlPn5KxdMw/IB+jztLsdjDw1j7KX5HSSNsBPCCHFdeQ+bD
         OQ5cqIPsayb8wjpJhrcEYCW0GmW8xEa41YT4UUPO7QzL9hBtGl6eTQY1q7jQ96H23sLa
         DvQA==
X-Forwarded-Encrypted: i=1; AJvYcCWmwodnh/NgCIhJvp53OTxpAypfB+DdrBqCjKiXniL8YZo5Mf1BMGP/L/Nk1pd2/QEG+DB6XdNZT/286YY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKyA9P+eRoRlNq4+zSMBkxW1XeTILiW7g9ReHVad5uzQLhYaih
	JSfoYceVLbeFPLUlAZgNmD/6IQOV02NuAd+eajMa2QWZLGCJ/SaJQD6DSjoawck=
X-Gm-Gg: ASbGncsuURzKHkS80v5D/AfdVZLwX2aJWvYxrQygy36ZOt0n08cSx3+UWnkQcPpD7uT
	lvA82k9cihUhdD6PXLhC4MhWRMTT7pzXlOBvOrGHZM3BwpC7BiDvg7PdtpkAYwKbfD8brpu8o/q
	20dfBth3i3JjmCUo34jsY8kKLspxWhlfbSuaccBbfNY1tieNg7mDfSct/6k0OfJmVU/0NveVJvI
	eHvSsGCPkq9dJV9TKC+JRYUKH53TIy4q7Ae2k9eCwdEs0o016PXBaaFhLPQbPMhew4S5gxav4or
	6R8r7cENpeIM2ra/MMxOXbR1j6XRics7dReCeuoJfGee2tHs3AkKn6FihJaUZcN4khV0yMB2+cO
	s74E=
X-Google-Smtp-Source: AGHT+IHZIZQKxokVXfqMkIHYqovCFqCOMp1S59YaL8IoOtnobquxt5VlkTlRg2xMgElyl2ygcoOp2A==
X-Received: by 2002:a5d:64c4:0:b0:39e:e438:8e4b with SMTP id ffacd0b85a97d-3a099af1fbamr1268637f8f.50.1746177789352;
        Fri, 02 May 2025 02:23:09 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b172b3sm1609188f8f.90.2025.05.02.02.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 02:23:08 -0700 (PDT)
Date: Fri, 2 May 2025 11:23:07 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Robert Lin <robelin@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de,
	pohsuns@nvidia.com, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, sumitg@nvidia.com
Subject: Re: [PATCH v7 0/3] clocksource: fix Tegra234 SoC Watchdog Timer.
Message-ID: <aBSO-wk5WPsWYs-V@mai.linaro.org>
References: <20250502043727.396896-1-robelin@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250502043727.396896-1-robelin@nvidia.com>

On Fri, May 02, 2025 at 12:37:24PM +0800, Robert Lin wrote:
> From: robelin <robelin@nvidia.com>
> 
> This set of patches includes a fix for watchdog for it may not bark
> due to self-pinging and adds WDIOC_GETTIMELEFT support.
> 
> --

When sending a new version, could you please Cc: the watchdog maintainers ?

Thanks
  -- Daniel

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

[ ... ]

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
