Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90EA270EC5
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744971306; cv=none; b=mZUNhlDAFc6xtIkEUJO/8+eCzeDFGTX2lnOPkeCdYJAsgqI+jJ5JiKUp1ujoFjxMRmLkjreAoB+NDP9aLQkjcLhAY7oOWtxdDHQd6Ul5CCEVXuhcwYtD0Qy9psS8BK64PdXTFB/BrOOt/D5XS9lIxiuumm1ZYwM+EpkOj95NdMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744971306; c=relaxed/simple;
	bh=FDL0XuqWdCNXKCV6rHzlLDqABeeuPDwzCJF2k8OG2Lw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nt6i6L5mzi0nc0nTR6/papor/qLgnagKFs4RUsvtwS9tqGaM/MVbK1cXzopxivSQY2FOD7DufgxxkB+oERBajzrRjk4kjivSjPNoo6bGfaoYoZA+fS72CZqc6u8LHNcyToSvpX/yz6NJco3rK8unOEqo/0rHO0MTN0YeivmnhwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vtFZUBCw; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vtFZUBCw"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43690d4605dso12944295e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 03:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744971303; x=1745576103; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Brm5STyxzbguEtMeEkkW8xOR3kBb6To3TGxKet6+640=;
        b=vtFZUBCwab7lW7w367P/fF3aFzK+uRlrsco+e5slPu2ySl0iJ478Wjt+CovRi87a4o
         R31qOA1CqokQxSdD7V64wtHMaiCSYdMkuma/kcfKNl+j3rTyucX5HRLBK78fwVu3Ztu0
         hYVnCQklXKdWCaVUip1twl5p07ppKWnn5IzbX51BKH7C+Td8L8vHDbuvncBd77j4Tu3M
         V4R7HigEfhiMS5KLmqAGs21aXjv8YzK+aVG2YCa8BFwxVruWxm7+jDYk1tQ3O4wYv0Nf
         7PV54OEx0txN+qA7VO+VunTR6YOP6cl/CaT35aTWz48sbFUW25bAAIGQIITJ0AiEwsES
         bb7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744971303; x=1745576103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Brm5STyxzbguEtMeEkkW8xOR3kBb6To3TGxKet6+640=;
        b=wQUqa5nyZY3AFLIkrZyyjD+7bEaJm4+FdYLerYtbaiX/1Md3OamaoVgBo2HDWcnMxi
         IMyZCINDq9ch2ls6jep6FQ8lj73SoBkMdQn53oVw8fdRdooTiBgiA40iot8Zh4yxrFZb
         FhRVpLxa9kOdIIz5KTkeInI2YsvZ6dTIhBBq2mYOCBZnf8fdNQX6Z2WQA2kmCG2tCnFM
         cAjQGrhbnkB4PtLOj7p2oTplbQ27DvdP91xlwhssDsT/FeRG01p/VI9+unL7enIEN7i5
         QS4YD4t6wNDgqOsZJEDAFReTMoPCfaZDJItdn1V+d0/7/KxzzfOi7ZWFnhXU9J19G2xU
         cGwQ==
X-Forwarded-Encrypted: i=1; AJvYcCV341kQ6mYLQjalbqN6tLIxwoiG4DDVNabWtcokmhFua0opBsMyFdmRfCSR0/72lwq3YukL0x9DHzehFKI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwoZJ7ugB4an/dCVvMi7dj5uXFvVV5jK+d65/Quy2JNjIFBwZT
	t0eFuFasx2FVSYSPQE5M9vRaCcPtcyo4UXARKzuudnS3KAsxFnuxSEY0BKl0pyI=
X-Gm-Gg: ASbGncuGcmRZJqQiu507/HV7R6Wm89rx2c6j5FO9C8nnowyi+OdJSlPfDfXnXf+sCYi
	DKAzIKKSvcba3ffbtgjzzQNo0ibg56Bdp0cK4y7Fs3pB2dJXb1KogS3gV1NBu463uN5syP4rSsM
	wXZNjM0crBV+9X8hS9HwE65P+sbZJIJJ/1QV00RTDKY+Dx6OP3e2Q8DI8rSqRsghQrYtX3XfEdh
	VFNoNUXpwZDp6OtMyzbgE/e0bNqfnVTTSrGTbbNG5efK3vqGingkR7/XLm/Vmq7mYmZdzpBRTim
	IQ6/0U9VsR+jUoX61qQfi247Z8WoGr0axqxjWoZ3kVUsEEmOXtbMDd6diz2q/WrhjB8omVwkur7
	sdNc=
X-Google-Smtp-Source: AGHT+IEcKk9KGrLL6sDXqR3gMjy5WEdmXo67OfFx7M6ZB2w1ef+PTXxi1HWDOSvixA62VlDaDy3SRw==
X-Received: by 2002:a05:600c:4e8f:b0:43d:47e:3205 with SMTP id 5b1f17b1804b1-4406ab99521mr16674895e9.11.1744971303184;
        Fri, 18 Apr 2025 03:15:03 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4403605892fsm59513175e9.2.2025.04.18.03.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 03:15:02 -0700 (PDT)
Date: Fri, 18 Apr 2025 12:15:00 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Enrique Isidoro Vazquez Ramos <kike.correo99.f@gmail.com>
Cc: glaroque@baylibre.com, rafael@kernel.org, rui.zhang@intel.com,
	lukasz.luba@arm.com, linux-pm@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thermal: amlogic: Rename Uptat to uptat to follow kernel
 coding style
Message-ID: <aAImJGYXFDx_q8D_@mai.linaro.org>
References: <Z-MEZNMLUmj75uxN@debian.debian>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-MEZNMLUmj75uxN@debian.debian>

On Tue, Mar 25, 2025 at 01:30:44PM -0600, Enrique Isidoro Vazquez Ramos wrote:
> The variable Uptat uses CamelCase, which violates the kernel's coding
> style that mandates snake_case for variable names. This is a purely
> cosmetic change with no functional impact.
> 
> Compilation tested with:
> - checkpatch.pl --strict passed (no new warnings/errors).
> 
> Signed-off-by: Enrique Isidoro Vazquez Ramos <kike.correo99.f@gmail.com>
> ---

Applied, thanks
