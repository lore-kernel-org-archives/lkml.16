Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2736F1DFDBB
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745477806; cv=none; b=QUnfG14xTuaTehHRC2W1wsMCM7DMxKJYhEI7cUAR/CqtavnjH6vkJL5D5jJSDiR1WOa4wCHrKWotbDk/KF0BNdl2ihrkaoVph28Ce/4N26uKq1AL1jdGfrEtpWLG/bk00sN8KIYc2QxJv6kINxIDAUveceXd5igjQn5xutP/EWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745477806; c=relaxed/simple;
	bh=KaDurauswI188KUjZ3KNQvsryIeiaUhlpIHOyWF2O0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OtoE6Q0IopyjkW+NiUBTIJJMJwxwR9XYvZFcBVGr4B8jFW4N3LCGc//Id7cCkwOUKhAyplI6f50VvBdD4+uzXBMQ2UgaNbZ7V9tRS/fsnv49xVWqwFs81rJ4X3rzOeuKp/r5MqLY9/wp8JzWM41uqFFNtEMBbovsC9uJtJ5sL+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QpAcP0ul; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QpAcP0ul"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5eb92df4fcbso1166547a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745477802; x=1746082602; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7kzVv79whvRhzEeD6JG5Yuqa4/y4qdCf+2FXelQG1Yg=;
        b=QpAcP0ull37osyzz0lwmfHbM6xwEU6yYa1hORanq77BXJc36z1RgOTaQPsXD2k8122
         bO9/CqpUcrK07DTpAeexhlaDBbeOJyKUw+CkmrSztl0By8FCn28+32swlC6BAzjGd3uK
         Ju36Alpzn+KeDeAWQQSpT1vF9VInhuMsLBu6BhSXifDq9h+wT9J5Ve+UDwg+9WWiP4mQ
         3wucdPs4KneMVdSxlJ6/VilaaWKpUrutOSJdEjVu8dZA+zPVsSPTpCSx5/hN759fXjyx
         Aq6TqNJWgzbWmJK7s6fRO1BFovKuMhhfCobqB6YeJ1JWgGul3Mk2vZ+i91oQU8wPqLyi
         DJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745477802; x=1746082602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7kzVv79whvRhzEeD6JG5Yuqa4/y4qdCf+2FXelQG1Yg=;
        b=sUbDxD/xKtm7x+oDV5NXitEdCxB/y7FaSjR17w5v0UFBNaJ/XlSIsui+EF72/S/mDF
         AZsBNxfKq9qs1nEhDaISaRQTUVHhL0x7p7IT917troKrV9ahpH8qdQuAcSSuiUWs8x+j
         Sdeh7zHeeXUARXbKHo4AQ5fag8jbu/oM8c4oSggtzRaQ/hqCEP5ixvxDMx5x4oz/JVxO
         HmlzsEbYtK2lcU1jCJuLeIVUOSJkwocIqNDCKs46wnM9n16JKbQchRkqaDKQcx3k75Yz
         rgeq4Hc1OgArDaHeY39v4RQTvl9HJfaGgyTJUQeaomiPnqcdUbZrlsTcT1vftVfhJK+8
         olrg==
X-Forwarded-Encrypted: i=1; AJvYcCUuZ7fpIViFDaXZ6LHQfrsVTioDFPWXqu2Zz7rwr2vN5c0jOyGH7FQ9UyJBMv0gsDfpdMUVz3Atif7WB6M=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwrdb0w5qGZtReY9aqJjPNjKjBmwvAVms4c87pb/Kq4hfsYMcp
	R8hqsnEZVmXf8qUuA+QUxlBcMmdWHOWlhvyEvMah8axhKH2VrFNXywRoKkK7QHo=
X-Gm-Gg: ASbGnctGQsZFy38khHVFTRu6TdVc/tYhwUH4tsJ2NaKbABosC5h1PRjR+q3vyK6ulMS
	zJzy/NcoITd/ga5fLEoZTc+hpHnEIvKShx/y93NEQBkWiXfFBToh7t2Eia960T24QDE+p/xjj7N
	5blV4x2JSnovwuOmb/woxvevw5CIGjzNZlLujzZIXL7A1g0cvLnf3Na+XL30TOwe1yXBZDLoRRk
	5LuIRltE21W2xbE1aw5hTD2iE4odQ/ixGKEBMXdZ/NhUg168w8kJPz3Yp0gd614Me4xHite18ps
	s7UpUyeSviUTYpF46GfyxIP1t8dqGjMu+03FIQ==
X-Google-Smtp-Source: AGHT+IHGr9cBdHuxjSZWLqVT9rmChGPepYhM4CQE7w0ih4cdp+SrjuSnVfBVqnG9DIEOEXWf/Vdtbw==
X-Received: by 2002:a05:6402:254b:b0:5f4:c499:54e8 with SMTP id 4fb4d7f45d1cf-5f6de697effmr1551743a12.15.1745477802488;
        Wed, 23 Apr 2025 23:56:42 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f6ed9e0936sm674611a12.71.2025.04.23.23.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:56:41 -0700 (PDT)
Date: Thu, 24 Apr 2025 09:56:40 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Melody Olvera <melody.olvera@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: Fix PINGROUP defination for sm8750
Message-ID: <aAngqFUPUxJfHhXJ@linaro.org>
References: <20250424-pinctrl_sm8750-v1-1-b070790ccbce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-pinctrl_sm8750-v1-1-b070790ccbce@oss.qualcomm.com>

On 25-04-24 10:17:10, Maulik Shah wrote:
> On newer SoCs intr_target_bit position is at 8 instead of 5. Fix it.
> 
> Also add missing intr_wakeup_present_bit and intr_wakeup_enable_bit which
> enables forwarding of GPIO interrupts to parent PDC interrupt controller.
> 
> Fixes: afe9803e3b82 ("pinctrl: qcom: Add sm8750 pinctrl driver")
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Nitpick: in commit subject, fix spelling of definition.

With that fixed, LGTM:

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
