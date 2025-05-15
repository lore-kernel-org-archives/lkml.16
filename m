Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1C31548C
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 19:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747336592; cv=none; b=JNfj9WZTagfnwi0UPB4BO9eLZwre7Q0J+GvoCy5ojatIaB74WuJ0uTXgf84GWEylCkaI+HaXb9p/j5L7GDg/vOwg828uVIMO2ziTMw1l1V+zYDBvPeoGRgSjP9hf2Jgb7ca15bYwScbU+yl9hEUTHn8qGb2xUARtyQhGUEGAyJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747336592; c=relaxed/simple;
	bh=6gx4VxiCZp/8s5LdcEThfA6AUSuIOJ+dOXNvZScqpZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yh2VYL7PpEbJbaBX3YezxexkK2FvyYhp/ecR9mT/AG8kwJjo3zFF528v5vrjRF6WN5zMLZuQDyPSYn92WYhYSiwXmUpEYh8+ao1yTN9hNrHNuWFiHErFSYcFD/plJhEjT1lBJfj/vvrbgEIUnDR+fDSfJvQ/ldEWc2triQ0ns8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EeapQvRr; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EeapQvRr"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso1457787b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747336590; x=1747941390; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xpGvtrdgAlWK1GS1LjsTZA3K4q6PeKTyfdS4buJzP1w=;
        b=EeapQvRremYQ7UatWetsKT12fYVKmEs9OZfquc4AGhJbcOVDtl+o0d+VCHt9hb0QlS
         V1WbKTPTjiOGHW6soum5Cy+uX+/sNVy0SJVXrkBXfkrbG+kKlOmAbUNR+Fmgf5xCNqo8
         f0Qe4DzxkKqLTonOPqprY+KKdBbl4OWqV/a8JHnzjH1eH81BvnN8jlZhZmdV/+hxbExp
         XgUrfhFuV3yBijdWwLVdGkwqdGIcxNAfyjVjCKuC8Gv2Zk+RXSi2odeiW5EXwdMF38FW
         5+Ohy2Js4CQtwwVDzFVXp3NKlrqUPO921ukM8Z25cei5Ff/bobiQyLZ69gnZaNj4cuXp
         cbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747336590; x=1747941390;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xpGvtrdgAlWK1GS1LjsTZA3K4q6PeKTyfdS4buJzP1w=;
        b=tCmc3ek+Fg77m1uCHDHet32swiS6zF0TiHEVBaOw3xXb0ySDcp6kYgE7N9fRAmrEix
         oIrkULDneQ+BrxLinLVKP3VyKcNUan2IQQSmFvxjh5PpEyGRi5DYElzbdmtN6tvovdwx
         Cg8YviVlC70zJ6wO5v7KRfYU1iQFbKLO9ClYp6Vk52VZn3x3ciYDcynWlKX/x13mHBTn
         jmjh9ym+eyk7czjsQpDvghkah1mWwo5Uwh0PQYa5ZN01brJLSFVJLwq+ThhG5qxs39OJ
         OwiDmUzqfUyBpTiMzTtKdAizZPYu07Hj4UoM2LsAUceD2AEmtqFS4qsH2lxoMyio9y/A
         ZCxw==
X-Forwarded-Encrypted: i=1; AJvYcCU2tmFjI9KH03nP64f/ILDualZTsonGn2WDu4MyGFSP9hISpG74qtDt4refBYsQ1mX2oxyk7PJPS7DC2pw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRkcWpvMnIL9ZTKbUlSxO4yJtfUDdOHLBQuEaGw5VMApa9FUUr
	niyREOzTnQaTZhRnk9/tGUCJ0ROeCB5M7FWh5qglMdfARiQH6Ma2Sk6Ory25YFM2fGE=
X-Gm-Gg: ASbGncuBmIXj1a+OwqeXoxXRxqm09yikPG2oVAM6GdCj8gHsc6EKxqsdjqghtyHbtBr
	Yr7Mx1SVPlCXGVIIVVTgOCurtfwEXMoPnQOMUBe5icSFeTq1IMyoB9k08St+dyoHoPr5Iht3n9e
	6QcehVxLADRg8MRhRvIgR4ubTyHHFXMBz+fDfDmzqgX/bGxNKvDRd5eIq6kyw2uDp1a/nwhUb+R
	DZdcl5P78cTszOO1ZKcdsuOZWcrMRPJz2lIbLbKsCWi9umZnp4+xFJdPelbmtrexD0QLblXDSBW
	i8UiBFd1X6emeeJbjzfRBWltxzKMxRysTvDF7e/cX0AJHX6DAM/HvEk=
X-Google-Smtp-Source: AGHT+IGZupUWMej+hx+Dw+EEdAD/oqenAqiibpJbxASZMfi6QIT8v+zU2mA4H5vMiCO29lJkfqgdEQ==
X-Received: by 2002:a05:6a20:6f90:b0:204:695f:47e1 with SMTP id adf61e73a8af0-21621909218mr943369637.23.1747336590376;
        Thu, 15 May 2025 12:16:30 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:1d7a:b4f2:fe56:fa4e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982b853sm163131b3a.98.2025.05.15.12.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 12:16:29 -0700 (PDT)
Date: Thu, 15 May 2025 13:16:27 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "remoteproc: core: Clear table_sz when
 rproc_shutdown"
Message-ID: <aCY9i0iwB9msN-iR@p14s>
References: <20250513-revert-rproc-table-sz-v1-1-a8c6b5d6f8a7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513-revert-rproc-table-sz-v1-1-a8c6b5d6f8a7@kernel.org>

On Tue, May 13, 2025 at 04:52:46PM +0100, Bjorn Andersson wrote:
> Clearing the table_sz on cleanup seemed reasonable, but further
> discussions concluded that this merely working around the issue
> and that the fix is incomplete.
> 
> As such, revert commit efdde3d73ab2 ("remoteproc: core: Clear table_sz
> when rproc_shutdown") to avoid carrying a partial fix.
> 
> Signed-off-by: Bjorn Andersson <andersson@kernel.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 1 -
>  1 file changed, 1 deletion(-)
>

I have applied this patch.

Thanks,
Mathieu

> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 48d146e1fa560397c11eeb8f824ae0fb844a022b..81b2ccf988e852ac79cee375c7e3f118c2a4b41a 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2025,7 +2025,6 @@ int rproc_shutdown(struct rproc *rproc)
>  	kfree(rproc->cached_table);
>  	rproc->cached_table = NULL;
>  	rproc->table_ptr = NULL;
> -	rproc->table_sz = 0;
>  out:
>  	mutex_unlock(&rproc->lock);
>  	return ret;
> 
> ---
> base-commit: aa94665adc28f3fdc3de2979ac1e98bae961d6ca
> change-id: 20250513-revert-rproc-table-sz-53ecf24726ae
> 
> Best regards,
> -- 
> Bjorn Andersson <andersson@kernel.org>
> 
