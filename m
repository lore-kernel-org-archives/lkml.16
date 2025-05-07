Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B67223DEA
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 07:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746604531; cv=none; b=dWyZ8Oy3MRemX1hRDWT+1NzbCOAca0GldkcCPS4i4uXfsVoCLKcJbp8Zhx2gVR94hLK/8Dg8cV5K4EHgfq8SSPwd+jrU3Em77I+7UTy5yqvO0ehS1PKwCb1NlzMxNHQZrCSMZ6KB2HNEQtlsG5KYEIn9CSBHF7ai0HMuq3k21x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746604531; c=relaxed/simple;
	bh=q6pNPs0UuN6WlRKaJkUjx2xsLLW66yNqWqj7oq0oEBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qYqsDlCwt3ezqQvh4lhvG6+UZZy+5P7Yx2b0vBhj+kwgXNkcC0SNWfIo/QVzlqe638JPqMMJYEspZPRQVRjCt8G3svQxwJGsdyC/FJr7jg3K046oZ97Z6NXj5oOR+xe7lNSEntOpwK+SDXcVXggtOrWQOpbi0SYFXcP3IpyaPk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XAsyMpah; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XAsyMpah"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39ee623fe64so6775262f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 00:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746604528; x=1747209328; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TBL3qIVf81e3PhkRqu3EdoePuATSbIziAx1f5bGu5+Q=;
        b=XAsyMpahI3Avjef5C/FsbxPfog4HQ/ERRThKWUgHnt+W2OYpbx//L5RhqESqyNdKz3
         aXG4Kt4Q+V0jPt9ILrMCvlBvkHgjwP4/hB229sSGatcJIZOsijzxZMtjRArqpHzab8ZA
         4A7j0Z9X/KBfvkmhRta1gzno5aymrIZzrSGuavC4288sBQMV+YaPxaWIkL395XGtjyAL
         gDPA+IydTOp9MlXzngQHRu0AtRf3sLA8pn0CUwoxKPZqBhANsSjFlTUYgY8Y11ZFACFD
         ZsYZ2M0jFNdHM5slxcWOHS2cOh55iLuT9cjvVA4sXa3NkMSrjKPTcAZkPx9v2VyS2aD/
         caPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746604528; x=1747209328;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TBL3qIVf81e3PhkRqu3EdoePuATSbIziAx1f5bGu5+Q=;
        b=pbQYoOthEduXc6S/jZurYxsrlCgLVHzFPCSOLQUKeXUcdqGGpB67fn2G7r0fWxdc0L
         QwnFMlY3zw0nw6Rvx9/LCd6HXOh/Wya9Edwaii3jwjOKHAPpkBCzDT2Gk5iMsRwm5vhO
         J1De5vpSq2x2CoAkcq7pRkx7F+6aaIvBXKmyS7zOD04PLRdTxcoL1FIi7K4Hu4+bfMrZ
         cBH8HkblUsR/YPbmM4mFfwbSb2A60kVLWgkSunfNIFwa5z0kKo36bpol5R65Tn0DdORe
         AF/PJV7B3Qj/7+uP8oa58fAI6gB0FqUVAQw72bsZgG6HIn0i5WdZFMEoztJzaA6S2Aiy
         eaZw==
X-Forwarded-Encrypted: i=1; AJvYcCXJIXhGr1DZDeyGKaukH5XEQCUZ7Y7MymE2/j1LuQwBnYZRre9bVewPi6WbaPIZZx+fU3r1WvHqkMUJ5jY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPGItodVjiQYp40DfH3z9bleXx9m6p9nU97HHy0ow7okFJVVJy
	xbrqcOnn7ymLIg1RxDlx2aiUH89dwC/jFl6hJNWNxImM+9PLhHCdPPplMXa1lKA=
X-Gm-Gg: ASbGncvxPzf3A0WZRx5U13e0O2YUd7VnvWIsFq+3Bj4tKKt3+Om7U9hjHXGXdLyJlFV
	Pb8Obp7jH2K7sIj57k94ReoRIjuT7Umd7gZ7nTQijwPIrODR/7dwiK5kPne4Lk5oo8cHxFK/uFN
	MfDYYnj8yYhGbBlJP3FGw5WtJQFsjdkROJNa1SZoktzLQSAEE39E0b5AB6Lg4TJw8Hvioaodrtu
	5C5GJ6E0wAldQ3A4ARP3lyviAymzToWnjke+KQBlubvXKzC2TNBwed27o/LDTgmM6uBGdtVWf0h
	6yAo+t//rBdL8R5m2EjbkX2gf8sGcBZENJf6LdbMPa1xvmEPro319+cUvNoxDO6okT52v5nInC5
	dtbM=
X-Google-Smtp-Source: AGHT+IHSub+w3i180SBYtmH4xnfpAxz/7R8NINsxJdekQwKRKRmtdqdbqRAvzeMDt6WyEG1Omh+Khw==
X-Received: by 2002:a5d:47c7:0:b0:3a0:a3f3:5034 with SMTP id ffacd0b85a97d-3a0b49d26bemr2060932f8f.34.1746604527781;
        Wed, 07 May 2025 00:55:27 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0ad54f105sm4491875f8f.85.2025.05.07.00.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 00:55:27 -0700 (PDT)
Date: Wed, 7 May 2025 09:55:25 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: lee@kernel.org, alexandre.torgue@foss.st.com, tglx@linutronix.de,
	ukleinek@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jic23@kernel.org, robh@kernel.org, catalin.marinas@arm.com,
	will@kernel.org, devicetree@vger.kernel.org, wbg@kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org,
	olivier.moysan@foss.st.com
Subject: Re: [PATCH v6 3/7] clocksource: stm32-lptimer: add support for
 stm32mp25
Message-ID: <aBsR7W15mPQiTjCc@mai.linaro.org>
References: <20250429125133.1574167-1-fabrice.gasnier@foss.st.com>
 <20250429125133.1574167-4-fabrice.gasnier@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250429125133.1574167-4-fabrice.gasnier@foss.st.com>

On Tue, Apr 29, 2025 at 02:51:29PM +0200, Fabrice Gasnier wrote:
> On stm32mp25, DIER (former IER) must only be modified when the lptimer
> is enabled. On earlier SoCs, it must be only be modified when it is
> disabled. There's also a new DIEROK flag, to ensure register access
> has completed.
> Add a new "set_evt" routine to be used on stm32mp25, called depending
> on the version register, read by the MFD core (LPTIM_VERR).
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
> Changes in V6:
> - Fixed warning reported by kernel test robot in
>   https://lore.kernel.org/oe-kbuild-all/202504261456.aCATBoYN-lkp@intel.com/
>   use FIELD_GET() macro
> Changes in V5:
> - Added a delay after timer enable, it needs two clock cycles.
> Changes in V4:
> - Daniel suggests to encapsulate IER write into a separate function
>   that manages the enabling/disabling of the LP timer. In addition,
>   DIEROK and ARROK flags checks have been added. So adopt a new routine
>   to set the event into ARR register and enable the interrupt.
> Changes in V2:
> - rely on fallback compatible as no specific .data is associated to the
>   driver. Use version data from MFD core.
> - Added interrupt enable register access update in (missed in V1)
> ---

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
