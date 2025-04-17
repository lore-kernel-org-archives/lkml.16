Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685452153CD
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744873816; cv=none; b=mm2P9t6m00T4HucyTnaHT4VtUcd/LAWsRCktIUw04vRA/Z6bXHDjTsoVIWDm+9alLifcmTTNtr1WL23l4/St3y5lttVp/NN07+W8AfGOsrlArjPkMigpB5wFery9fuF7r8LfUUKoqIuD4Z7mFl/kqWwa0gppgJBS/5ZOOSnWQrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744873816; c=relaxed/simple;
	bh=BGdRhUgbz6IHnB/5nKa0J0kWtQyqH6AfunEBxs/BTZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pkBKUcHkqG51ugiUNsbZ5dgYH7UEyLDNO802jvFTZaRRatDKjGviej4I2zIM8nkcqX3uIq7enb1zzpUrxJd/fomAtjj28W3JfTB4UxdzypcRr1vk3OJp9VxwxZeedIUtaIH8f7LVgRzMVeA8mpwmfYEAsP/RK0R5f+Ynn54+fF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XAWCdDVX; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XAWCdDVX"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39d94327297so63254f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744873812; x=1745478612; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Lul/GSjYvkQhSC1y0UnqH61paijsP+u/iqsJV8tyjv0=;
        b=XAWCdDVXgpKatlPIid94vVmURDztfJ9ogiKlj+MtrQXOzNaU6poGhIGZToBy8e2RBm
         0Q6NWcmFC/aNAb+R3t7JalUxneRJDFj8JqwQ40G48Y+/GNXYp78tN3xUK26wz4O+b97C
         mizCyKi8gkBaxEEHOwaH4HCXaIAt+KBR/VfzTlTulrJuEWCU7aaRbzDnqQf/gXWiDHgs
         URhC57fIzEz0XctCBwQmdRcfzOhJ/qDN0pw5kJQ7YNxT4u41Oe0P4Q+UhWeYToAqqCFZ
         iZkB+XGOb4Imujk7eXKsnY2Estwd20VPYOfR3NVDAQFa3gQf8LCLrgSimQ+YBUpNwN1V
         TjRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744873812; x=1745478612;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lul/GSjYvkQhSC1y0UnqH61paijsP+u/iqsJV8tyjv0=;
        b=WExvheqCQD9fi2ZQgMTEtyu34bD3SGO7xk8IbnR2zP2Ryvn/FC1mH4ii/bY9kF/csP
         x+mX045RMKcKy88FM0x60nu1h0ACpsTyXPVJhl+NgsC8ZMIR9auwmyuw30GjbgqSsn22
         Y2ov21onIlt+PacRVQdkai3kleBfyI3OLa2UgpAFrueaGP0E3GwrMjEJK1BXPusagJQ2
         T1Uoy1h2jAKCtF0p6HvefAwTWdSp1vhnP8mUDN5xwjvLj5BHS0AKMN3D3e6hUSlYSgxr
         hABE0jyhWRLGCW1qr4B0ev+q6uHCBg2y1f77cccZ1vhGE9SR6P9TR0lhvX0nmGEYtotr
         Mxjg==
X-Forwarded-Encrypted: i=1; AJvYcCWIfxJGchAeiU4au0WE/BO/zJWuoBLHncoPTUwIVgw73XG5sgXAKmjnVN/qpe2YD0D14V9OzT3+UukuLz8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjKxZ106FBPYeEM2h/KWgVzR2VpqsYBDwfEX4k+QRtZWAg9Zes
	Hj50S586oDNsF2m/LY5I3GVeUl5xd4Y5YpZAemOEzN3AVVk7chqFyGTQoW4XFCo=
X-Gm-Gg: ASbGnct/I4DzzT8a37pm3l/IHym0Bug4SN3LQ0ADpwSAbE1VWmX+VAAbH787HCFi7lx
	yrrEx7U6NrnUGUE2X3+df20GqXHZmRx3Vj4P2/DpDJXuZXn92pN7CXGfpxFZhZ2Azn7WD68UtGg
	aoqqJUS3WthVKr5ZDZASimjHw3oKCQcw66BaCIvGvIMSxK3OBhxocGkoTR4Of0I4rN/GmGu8Uxh
	XHN9YjV8ZWBqZz3721jsfIVORFs0hqwPUtfddivlSRzeeYufZbQ7UrG52wtcxWUQ+YbFNqh4iuV
	wJyS+RyjRfqHdjoQZ0vJ9dVsDbMBQ1MxMd7Y+oxJHOv+nbSq8o2tC0HLWG+KrQQECHMWYFtEVsO
	ZSWTMcGSiBEW08n8u
X-Google-Smtp-Source: AGHT+IFP74Dcw2ePTB8XNvlZG/LBO0dpD3C8vJ/rqjSdpc2m1Zh0504XVQwpY7FgGs0ERlglDXTGMA==
X-Received: by 2002:a05:6000:1886:b0:391:277e:c400 with SMTP id ffacd0b85a97d-39ee8fde03bmr689110f8f.13.1744873811586;
        Thu, 17 Apr 2025 00:10:11 -0700 (PDT)
Received: from [192.168.0.101] (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b50b8ccsm42434875e9.28.2025.04.17.00.10.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 00:10:11 -0700 (PDT)
Message-ID: <a0739b6b-b043-47f1-8044-f6ed68d39f2c@linaro.org>
Date: Thu, 17 Apr 2025 09:10:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] cpufreq: fix compile-test defaults
To: Johan Hovold <johan+linaro@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250417065535.21358-1-johan+linaro@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250417065535.21358-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/04/2025 08:55, Johan Hovold wrote:
> Commit 3f66425a4fc8 ("cpufreq: Enable COMPILE_TEST on Arm drivers")
> enabled compile testing of most Arm CPUFreq drivers but left the
> existing default values unchanged so that many drivers are enabled by
> default whenever COMPILE_TEST is selected.
> 
> This specifically results in the S3C64XX CPUFreq driver being enabled
> and initialised during boot of non-S3C64XX platforms with the following
> error logged:
> 
> 	cpufreq: Unable to obtain ARMCLK: -2

But isn't this fixed by my commit (d4f610a9bafd)? How is it possible to
reproduce above error when you are NOT test compiling?

> 
> Commit d4f610a9bafd ("cpufreq: Do not enable by default during compile
> testing") recently fixed most of the default values, but two entries
> were missed

That's not really a bug to be fixed. No things got worse by missing two
entries, so how this part could be called something needing fixing?

>  and two could use a more specific default condition.

Two entries for more specific default - before they were ALWAYS default,
so again I narrowed it from wide default. Nothing to fix here. You can
narrow it further but claiming that my commit made something worse looks
like a stretch - and that's a meaning of fixing someone's commit.

> 
> Fix the default values for drivers that can be compile tested and that
> should be enabled by default when not compile testing.
> 
> Fixes: 3f66425a4fc8 ("cpufreq: Enable COMPILE_TEST on Arm drivers")


> Fixes: d4f610a9bafd ("cpufreq: Do not enable by default during compile testing")

That's not correct tag - it introduced no new issues, did not make
things worse, so nothing to fix there, if I understand correctly.

> Cc: stable@vger.kernel.org	# 6.12
> Cc: Rob Herring (Arm) <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
> 
> Changes in v2:
>  - rebase on commit d4f610a9bafd ("cpufreq: Do not enable by default
>    during compile testing")
> 
Best regards,
Krzysztof
