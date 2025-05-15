Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE3B298CDD
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747313544; cv=none; b=eUZmze4YykgT3tLkv3t2y4tZg8yiY3kj/u6NqsClT/1pauBzE+7A+cssPkSyE6OxoF0UtFxPajFTDdpVOQ+51RGUnml5ok6NHUfLnuDMPEyFkzfaghJTBlQIXRyab2GKHJdq6dIHWmKObaoSbz1lywWybDVKrmgXqREKysxBo8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747313544; c=relaxed/simple;
	bh=CPkuAWMDXEB5UuZ6HlFfiQZ87mvHOAlAeOGYVCqenus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cbWSsIAjNoBlBAaKKYZo4kVzI34Wmub2F3N4H83z4LYEqjDO2g4UmK89cRr4UZz7Kx+UdD6oGKgMpvFRCbv8wd540WIIow2cQV6Vv8d0Z2PixYmbYBnH4NF4Plh4Wko1viS2goGM+tVz9jqSMsVnrsAXeXRlEhVQGzt4DNw9lV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RR8++vlc; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RR8++vlc"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-442ec3ce724so7217685e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 05:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747313540; x=1747918340; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fK3aTKI5/68JTESvc/oXGZyIBHmOFX8dt6G+gKVeWWw=;
        b=RR8++vlclrR7mSnYYWcClj7379hRTHpvCAatuSGIK+PKgt1QaQeYIsRM9A9IVH+8NR
         gzJbRVdAwYEptf40X5KvRYyS4KNTzVWHnFtI4+2/bkszInITcI5M1xlUsJnX5r15UX95
         mzvu/WtaR5mjaJD5KmI0NvQo+b3EJy2O6NcdwUXExaT0nvbLcEj3ppkOrce+asojVmHE
         28M4jxXWP7RgbQPTZtOc7raTyVlo9gk5jBMO+CgjoREyNLxrdafWi3CljnHf+Ky3QAB3
         EZmjaHLOvEHRp6LGWyi8LJqzU9ivfnjPo2tG7NrXaoXHKNOzVGAI73ISEo3o92qVjq67
         s38g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747313540; x=1747918340;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fK3aTKI5/68JTESvc/oXGZyIBHmOFX8dt6G+gKVeWWw=;
        b=WnwHtu/NDQk1catcnjoPm0JhXSGB8ZS2852vbnb6Zj7uhBdEQRsoekap82Lf4s3OgS
         9zXjb9g6Cd95g1oycOQ60EB1Q1Q/BEH7Vax4z7alLBmpHZo+cmO0a1sb40JRUuKIcy19
         4/pHztkPV8cPtMsgoBadAFk8k/q8UHvES1n/IIy0jrkbtUnMAd1lU4L2CVOmm19rIc8k
         ac7hMshYzTPFr5lTj566uGe1qRKo2oNJERqlh0rGrRkKj98EVe3GkQoxdFPkG1/isFqm
         oIq/dLQrON+XiD+n+/sx90n2XUkepx7NHK5uwJAMTTEDsfeFnXfdyELNjLOtP8Oz8lvJ
         KZnw==
X-Forwarded-Encrypted: i=1; AJvYcCXpNWgwBKHycz0XvgwSMGfRdGaBwn46Bk225RHgs+lAQlB4qIMcC+ksHjgfdRys3QOul+qED15bBF5+uAc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKGae6W2N7OrGijL3OMv64ptcmwnxpgt1bkt/q8VnoI8nWc89J
	zULvHqQERp5/92aCelMCUS067SU3dlDxhcIZmwdbdGUvq872bYeZFjFD/EDH96w=
X-Gm-Gg: ASbGnct7bE6LAv6yRd+UvK4SYx+v1WLMW2JQmNlaNWYwyAR1WRWeMU/G0RCQThQ3ya/
	3t5o1Zz8wx6nAZf4r6lV1W1Um3RyXvHgmv653yTsMIkOkMCf5FxywcbWJ+XU3Pdc2IvPnYc2DhL
	lcFtFtE9cqfTuo2yrPXs0f4Asd/OoFKzkfjqj2yFUsAFhR5zCoVVRfn1oK5QI09EVsYClZc1jiI
	gpDhs3YlJXwQtdH4XTBwS7KHhFuuHzHS2EegNjXHIUXpx/d0BOBvJy1Izzi2raw5AXU+430JhdK
	Ykg13EQRuU7onxJgm4bXpInBLmmDLXIvowlLh2eM9T+dIjR1eniWse/NaUEDox/VcPaNBNq89LH
	LeFlauMbgmLZYfA==
X-Google-Smtp-Source: AGHT+IHS2/j9+N7xSaRjAkIWps6mxeAYqws1hdNZCTv0XgJraew6abe5Y67oztqEy7hekjalJ6mCwg==
X-Received: by 2002:a05:6000:2501:b0:3a3:55e6:eac6 with SMTP id ffacd0b85a97d-3a355e6f03fmr1782764f8f.17.1747313540359;
        Thu, 15 May 2025 05:52:20 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddd2dsm22638932f8f.9.2025.05.15.05.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 05:52:19 -0700 (PDT)
Date: Thu, 15 May 2025 14:52:18 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	ALOK TIWARI <alok.a.tiwari@oracle.com>
Subject: Re: [PATCH] thermal: airoha: Fix spelling mistake
Message-ID: <aCXjgj-3kmcCqLpT@mai.linaro.org>
References: <20250514213919.2321490-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250514213919.2321490-1-ansuelsmth@gmail.com>

On Wed, May 14, 2025 at 11:39:12PM +0200, Christian Marangi wrote:
> Fix various spelling mistake in airoha_thermal_setup_monitor() and
> define.
> 
> Reported-by: ALOK TIWARI <alok.a.tiwari@oracle.com>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
