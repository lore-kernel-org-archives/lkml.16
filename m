Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163BE2E03EF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 11:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751540478; cv=none; b=CgOnaMy3eZaff0OU+nkBUzhQOtAsruKpGRBa8iYgUvSnE10Tasv/4cg6vYivkHq7FkB1H/YL5xZxk0IgNtD6NBlTPYrBWa/eJEZZFC+aDC8TcrVJdj3rqJajWFL1m+Cw/JZc5Rdo0TG5v/bL4Jv90e77cZc7x8VflhEsQ49+w+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751540478; c=relaxed/simple;
	bh=XL9mj5YIkNoC5JCykpYkHaa5t3F3PIC3UliPRQHLUDE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qsr9Ulxg3B4AydbY6SOTtWW9hD3KB+aYpozfTNRMXu/ZxE1VREhUS+XYcQHvxGrf+PO4Yf67HpF6l26ZLE0Yuo3j/JuHcPhFi2nr8o8+GOj/dN5mNay9gnZ+m+Sqj33HCI3eKs12ydz1bnnRnysx8Qso5vljwUun84PpG/NSYIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XUII3I5+; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XUII3I5+"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-453398e90e9so44658775e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 04:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751540475; x=1752145275; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=he9iT9WyI7YlpqKEh8jhMVFH9zJFZphKaP2582ttrGw=;
        b=XUII3I5+d35ALoIa6MqKWEYXw3e664O5FOHxVBeU9HJb+ptdAj/faO9vzFo6tlbvg3
         mUjQOtDrFpgbW/9eH2vJip+CN1hm6zzmF51eOQ7rD4FkaCVBD6UYoaHzJNMhfJLoVOA/
         oFULlM7Xl/l/6KgPLfs47ZHG/dHSL4GZNWivh+VJ8cbUaiBDsTasSDjjacW7mUNGnsvh
         1qo2T59+GBlX8LjQatM8FxhSs7TdTblu75lIE2sjIYpLDpc+UazOBao2wSAAqOqGxdHf
         iXrmbmAdJHfO+jv68GaKZ0Z1ZzYbbA6mlfeBQX2JLvo8r201QNxLIPI5T8XZkrNEKZm8
         m1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751540475; x=1752145275;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=he9iT9WyI7YlpqKEh8jhMVFH9zJFZphKaP2582ttrGw=;
        b=XTqJyploR2x/910zyxA9JFgV1QwCrNCblmom+8qNgB862YL6QtpDkjhVmFBU6NmFKZ
         bu2Pllin74lL1LcYGh1pioM2VKkPO2ZeFZ3qLCt8dwnwxXTJAbFbuy39x/DkQ20kIwIT
         zZ3vgiV9KZjNH4R+oUPzg0EqXEg/7r7Oon1+P6jcRg9mPFtM8kkSHdXZx4ghjyl4HRM7
         hgN3i0jZWvw44bx1rcIMRANlHZ722pQykGUDyf/kbdfQHtZoiwRDyoxrlFVVVWEOERvc
         rkjMuJGUkO6x0sbjFMoJz+fbKYN9xiPKyt4zHbBNT8olxLauvltaP9Rlx4NqtIg5Bm2I
         r0JA==
X-Forwarded-Encrypted: i=1; AJvYcCXfxL5jEVMkSN6Dmai/RktbTDaguuaFItZ0PyAR6MtboXpTNyY9leQsVLV5wntQGGcnuRnF3SOvy1TrXkA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0ylMzxccioS6IY8qXDC+4Onk13YSuyn63PQ+TWCYvmt1/wCHM
	Bk8LSukb1iCkziG+qYMum1MQGdmLugpUvTr7u5v2bspW2C4nEI4rqX1Z3E8hBAVXdqI=
X-Gm-Gg: ASbGncsXPpjJSdHNxg5qHCOGBrT8jQA81NKdqX6lQM9E0VDOsWNk4YMM1RLabyeeKek
	xoHSnd3GabdeDhuLXszolgF1845q+5VGMximuy8i51FVT5LcX+tfXWV7OWJA+OEBPfox7HClNCU
	c/laDgny7CCX55+4G8pEjo3SwtH4miqizoTTVTNKNyxmbkta4sb+u/2AULYnGPof/Al7Vxz3UMl
	jKEALVTv+8YJPZRAzEQ9RJLu2nmSbXT20XBSl8f+Kx+fU21bVoToxOVWBSCG2ru4201M/a/rQtq
	JvB7Jh+B4p8Z3+fWgLn9zeN5hvDDB9PC8ERVOipNndom5RZVlTn4uOkrJPNFOiRrXg==
X-Google-Smtp-Source: AGHT+IFmsyLTW5PbUc7ffB5ixd3FjfkYoUZQCDDDXT+dNjoFbQ1TMzjLRO6Z08bG9VoRMBxKr/UkgA==
X-Received: by 2002:a05:600c:1554:b0:450:d4a6:79ad with SMTP id 5b1f17b1804b1-454a9ca8543mr30636995e9.23.1751540475173;
        Thu, 03 Jul 2025 04:01:15 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9967ee7sm24208965e9.8.2025.07.03.04.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 04:01:14 -0700 (PDT)
Message-ID: <53a214b4039872ce7584a2ae6e688fcef0c86d7e.camel@linaro.org>
Subject: Re: [PATCH v3] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: William Mcvicker <willmcvicker@google.com>, Krzysztof Kozlowski
	 <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Date: Thu, 03 Jul 2025 12:01:13 +0100
In-Reply-To: <20250627-gs101-cpuidle-v3-1-0200452dfe60@linaro.org>
References: <20250627-gs101-cpuidle-v3-1-0200452dfe60@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

More small comments. Sorry for the drip feed, just trying to understand
things...

On Fri, 2025-06-27 at 14:08 +0100, Peter Griffin wrote:
> [...]
> =C2=A0
> +static int gs101_cpu_pm_notify_callback(struct notifier_block *self,
> +					unsigned long action, void *v)
> +{
> +	switch (action) {
> +	case CPU_PM_ENTER:
> +		/*
> +		 * Ignore CPU_PM_ENTER event in reboot or
> +		 * suspend sequence.
> +		 */
> +
> +		if (atomic_read(&pmu_context->sys_suspended) ||
> +		=C2=A0=C2=A0=C2=A0 atomic_read(&pmu_context->sys_rebooting))
> +			return NOTIFY_OK;
> +
> +		return gs101_cpu_pmu_offline();
> +
> +		break;

break is not needed after return, and generally there should be an empty
line before the next case statement.

> +	case CPU_PM_EXIT:

Should this also handle CPU_PM_ENTER_FAILED in the same way to bring
the CPU back up in case of failures?

> +
> +		if (atomic_read(&pmu_context->sys_rebooting))
> +			return NOTIFY_OK;
> +
> +		return gs101_cpu_pmu_online();
> +
> +		break;

No break needed.

Cheers,
Andre'
