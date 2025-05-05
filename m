Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EBB155C88
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 08:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746435429; cv=none; b=EDx7JX8HJsH4lXfwGJFcww406knszaDQxQmlD+GpZMjsBBP90x3Ym0lS/CWr0UyIjt7o25yabN/3BVZXopSnAEk5/HYxnVg2UkyH2oM5PQQSo97wq0wqzyLaKtiJ5zCRhI4jl56ems+TaRjfn9xnazbCBncl165UY2smom3n3SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746435429; c=relaxed/simple;
	bh=zwQ2WGMJRkig3reMsZHumtlh3zNCndRtN4zYIDuHLec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vAjzjAX8yX+xkvR1EBZLsGHfNwY8751KKY573OQ7W8lrx4RIG/zL/HYclmjB9aT7tLG+wHRgzCLV24PkuT0PWKdkAIgT/cjid7ImEvhHLSEm9pAHFhUCsqSEyo7Ioawmk2+GposS4jiQTSq4oUvJpJAGVVLVkr3uMlZIm07WMBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rbt+1+ru; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rbt+1+ru"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-acb39c45b4eso666547566b.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 01:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746435424; x=1747040224; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=twFRaaGQAif63hrg13kb5IFUKfR33Ambpgl1WwN0LnE=;
        b=rbt+1+rulLi1Ty+KpoH8MhEjxhaIO6NTjneMqGWjgGXAsqOfgiWSCUChaEcjc0gDxt
         WvNwF5sYCfF1Z0eksKBatcf39px3IEfgeitePSz0LtJ9v7IQ+HoEHeIu/J1/gLiUEdkM
         2vHg2Ps5XW6ZdsW4eBGkI/of3OSaspGiZBe2bCOAfIXfRRZAWb9/dTyo4C3kx2dFC3K0
         NjIe6vX4ZpTvrBzss9qw/lxeR+/rkR2lwxA6mxJSjztSoHv1nlkz9o09hcAnn1zrN1+K
         P3UyC4RVjE3+upL8Fpb1SxZkvjT75KQTF9azti42ccPCAgtczPsAkpYaL84JZhvmGZhR
         dZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746435424; x=1747040224;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twFRaaGQAif63hrg13kb5IFUKfR33Ambpgl1WwN0LnE=;
        b=q1BL/zaeFCCX6usqN/tGaMbDPoA66pCCfn8L3ImicwBQCGyDWYHl3pFoGsLL+dFv6e
         6QsDvjpTLGcR3+6lDVQHeAiqOQin267OSii+IO3vFKJ5CXoxFvhfYLaLKDJ8uACEzTAp
         gOnk+wKcPdhTnBnOceo/aRpL8nGeIowhMgC1Jmz5AF6dENFEMLQEsKxxEA54euV6Ct5z
         0Q65eAScAUQpTAqQDOcqYJCzmADQctdw6IhYwFzpTuFH146HPA7bHNXPolaxx0ifqJhj
         VbtYmnOlFEG8YFBevjV7VViNPhv/PTiu0rckSmxUVDfurqMkg7fJg6nuePlguOCq2CC7
         QemQ==
X-Forwarded-Encrypted: i=1; AJvYcCVE86nqtmy/rQAidlspBAsDSvbJk7z883FcYkRXEHjchjlYdxp0nX/EuMQ+eBB9kIG+yaFCZxTkJ0qj2NM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjOQI9sikbfYH15T4n3n7HnfOq5XZ0ru9VzOoIs+wgt0o8qwng
	1156gK4V1ObONtF52D8wCu9grNa2A2grhHRK63TyKWmqnqh8iRiRxLnJXgxdBfU=
X-Gm-Gg: ASbGncuPd1xUNdf6h5SMfL5q9SV2lTYSApcLd9pNm66Ls7gRQxt8hndvHKLdObAsxqQ
	Wk6rV8n1BbX4x1EgoGK71fpp4/yrKZTsSOklB/6/RFMw1GfoqQ5iu4nVyt8t/QRaiQNztrVEPEP
	hGT6R/O/G0QZSKu/eCp9YS8yeZrQL0LdWjWyLLMppKGoxrrdkSB5JkymvNKPYrr5domwvA5bhvn
	Z2CkzWSi3wYx4HL05NjQKAqyX2btc/NjHXHXTQL9k7GwBsyLbZ8rt4rwShlJO0dEJmWLGROFHcD
	UH8fAd/5HqlTJPg9C7hA+sOudOIw/HzVNKotmSE5sS+2HzkBbg==
X-Google-Smtp-Source: AGHT+IE7wNqWzTYqeQUTRoeCnQGzyN3VhgiWSTOZ9M/mvZ4hW4jHw55Y7DRHPzUaVluMv512tH+2nw==
X-Received: by 2002:a17:906:dc8a:b0:ac3:afb1:dee7 with SMTP id a640c23a62f3a-ad17b5dbc98mr1130736866b.28.1746435424095;
        Mon, 05 May 2025 01:57:04 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:d6d0:d270:a4d:dbd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189508d03sm458777866b.133.2025.05.05.01.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 01:57:03 -0700 (PDT)
Date: Mon, 5 May 2025 10:56:56 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: qcom: bam_dma: keep remotely controlled units
 on during boot
Message-ID: <aBh9WL2OMjTqBJch@linaro.org>
References: <20250503-bam-dma-reset-v1-1-266b6cecb844@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503-bam-dma-reset-v1-1-266b6cecb844@oss.qualcomm.com>

On Sat, May 03, 2025 at 03:41:43AM +0300, Dmitry Baryshkov wrote:
> The commit 0ac9c3dd0d6f ("dmaengine: qcom: bam_dma: fix runtime PM
> underflow") made sure the BAM DMA device gets suspended, disabling the
> bam_clk. However for remotely controlled BAM DMA devices the clock might
> be disabled prematurely (e.g. in case of the earlycon this frequently
> happens before UART driver is able to probe), which causes device reset.
> 
> Use sync_state callback to ensure that bam_clk stays on until all users
> are probed (and are able to vote upon corresponding clocks).
> 
> Fixes: 0ac9c3dd0d6f ("dmaengine: qcom: bam_dma: fix runtime PM underflow")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Thanks for the patch! I actually created almost the same patch on
Friday, after struggling with this issue on DB410c when trying to add
the MPM as wakeup-parent for GPIOs. :-)

How is this issue related to _remotely-controlled_ BAMs?

The BAM clock will get disabled for all types of BAM control, so I don't
think the type of BAM control plays any role here. The BLSP DMA instance
that would most likely interfere with UART earlycon is
controlled-remotely on some SoCs (e.g. MSM8916), but currently not all
of them (e.g. MSM8974, IPQ8074, IPQ9574, ...).

The fixes tag also doesn't look correct to me, since commit 0ac9c3dd0d6f
("dmaengine: qcom: bam_dma: fix runtime PM underflow") only changed the
behavior for BAMs with "if (!bdev->bamclk)". This applies to some/most
remotely-controlled BAMs, but the issue we have here occurs only because
we do have a clock and cause it to get disabled prematurely.

Checking for if (bdev->bamclk) would probably make more sense. In my
patch I did it just unconditionally, because runtime PM is currently
a no-op for BAMs without clock anyway.

I think it's also worth noting in the commit message that this is sort
of a stop-gap solution. The root problem is that the earlycon code
doesn't claim the clock while active. Any of the drivers that consume
this shared clock could trigger the issue, I had to fix a similar issue
in the spi-qup driver before in commit 0c331fd1dccf ("spi: qup: Request
DMA before enabling clocks"). On some SoCs (e.g. MSM8974), we have
"dmas" currently only on &blsp2_i2c5, so the UART controller wouldn't
even be considered as consumer to wait for before calling the bam_dma
.sync_state.

It may be more reliable to implement something like in
drivers/clk/imx/clk.c imx_register_uart_clocks(), which tries to claim
only the actually used UART clocks until late_initcall_sync(). That
would at least make it independent from individual drivers, but assumes
the UART driver can actually probe before late_initcall_sync() ...
Most of this code is generic though, so perhaps releasing the clocks
could be hooked up somewhere generic, when earlycon exits ...?

Thanks,
Stephan
