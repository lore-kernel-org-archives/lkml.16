Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956D741C69
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 17:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745431035; cv=none; b=KRmy4UGbmrjnEglupCInFUWREktR7fC84NC+865MCriEmavC03Nzz0hPmwKeHHnRc5bLrPC73yCB+6ngZBzVZCLydrCLBSMbegN5hTG7Sm9XHvmtxu/x2bd3FhKWhyNonOH5VBFrnQkzihyxMZO4IAocWM+v2rM0dH7uJdyv84c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745431035; c=relaxed/simple;
	bh=bjdltNmlFLEI8HZPhOlOSEjUjufZxqhoWRX8J02eMg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lbBcw7I6QDHe/2XkMdXcQB8nGAWh6q1sT3z6243HMdRrdSruDpMXJhOeJGkk5x7XzZvJ2YssNqxhCiX74XqYMfWm7fRO73YrMNiC+vXmZInWJZLT1whYpCCcyBkZxj2+2pkUjC80CvrznyRUcQw5/u0Kt/Dnnn584do/q3QwXqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TxMP1xYF; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TxMP1xYF"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-73712952e1cso72178b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 10:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745431033; x=1746035833; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j1BdEQv1vdl7T9oYKU0EylrvVFVYx8fAUdWQcXrcTcI=;
        b=TxMP1xYFHEkzBby/hYtGGkWVhT7XIyyFBzYsA540A6jshEg77D1juicw89gQ5cm9W6
         QOZCPTCCCbGrmLkMpZSP39FT6dCrXYdEHDptoqgYhXuzXpfpMmwN7Fcj+X8/KQI0pq7N
         orp3apvL6KZLWumUAHISfeJzMH+gLoodwlj6b55lMUJnM53w0Xelhi5+bpwrhixtjf7t
         t874pxd7qEMfm5nFbgICqffcWLlr/FwWcl6hEcWOj+xQ7frOyVGBzVZAU4HclN1hDsp0
         Q1SQ8mBRi4X+9qyNUbKVTMa2GA+ACGXIPnNZj0wmnE+NLQUTIvxgTQqNkuT+prGsK0wt
         qN+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745431033; x=1746035833;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j1BdEQv1vdl7T9oYKU0EylrvVFVYx8fAUdWQcXrcTcI=;
        b=S5wnZcmM7NLNzCpKcXs4ev1YDZNTTIpLzL+BiVSoTd85uvpV3XwYeScDUoKUlCMTLR
         wcPCKafzr/L6VOg0YZcLHrgCj52cg7sbGjy/GMwVAoI/szebvM0cXqkDB/M0o5BbEfEm
         tRsKb7EHD0xW22CdavOiGR5J4OQ/xNGDiwmFqGUsICeT6a52egyFVy830kfLUaHvw0+f
         xFKK/h+ZjCptpx3W1CCGNLbMxad1e+Kms4hQ09WmOcWsCkuXzFYTRAJ2/L77NWHV1WbP
         pdkqswU5+TJbMOf+LxWfnGhs2sdKXNQdtAaTJPNfYuCcRlqSW/f237z2oHC1qTN1fQtO
         hOTA==
X-Forwarded-Encrypted: i=1; AJvYcCV266AhNCPjufFACiHuqCDlz09NrNnAG4hBeEW1ZUh9TgQJLquVXmLM/0w+0GRHQfOYb7/go4GlPVLrACs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8vgyyjpUu45OV2a7EdSkiM1GyDDqFro/GFPEBHIoIfXZ+N5AR
	cI4zP1hjXXiOKDNzlinqtEN3acRMzasnGfDPHqF+zbpkJo3nu1+lm+Lm8z9+SA==
X-Gm-Gg: ASbGnct7C+hXd9UVGSmx0twsCrYETwfk2mWDMO3bd3ZwmpA6kJ83rNEUlXMFqBnN1ma
	WjOvtV3xHVFNs1tQ9Ot1GlndDRbzk8DCT5jRz97gXDdMDy3UxTW2F5lLdwuRk5Fs2E2iva9WH+C
	+asqDa1KStf1mBLl3uY3e2dkF98PDMLlYonbDpojkvxqQsNOLsBjz89bbRUOEXVZJTh2P5VYaGo
	aiaQVIFGOh5tk/PMnDssqzUIi0ifK94gKwFJXXjr3jYVciznve4icQdOFsuDpVPnTv4vFv18gWh
	6cRNC9zF97cdorIMBcEOHjOwVjy5uzAU1NdYFDpqI8WKW5lZ6TU=
X-Google-Smtp-Source: AGHT+IGrh2Cgm+iBVSRE2C97fqzoIaOwZNhd46QOiq5ZCKspweWWHR9ruYah5noD7/eE9vCwrtWuzg==
X-Received: by 2002:a05:6a00:1410:b0:736:5f75:4a44 with SMTP id d2e1a72fcca58-73dc1616619mr22287454b3a.22.1745431032859;
        Wed, 23 Apr 2025 10:57:12 -0700 (PDT)
Received: from thinkpad ([120.60.139.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaab922sm11178588b3a.133.2025.04.23.10.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:57:12 -0700 (PDT)
Date: Wed, 23 Apr 2025 23:27:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Brian Norris <briannorris@chromium.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	Brian Norris <briannorris@google.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] PCI/pwrctrl: Cancel outstanding rescan work when
 unregistering
Message-ID: <lvod2nhpzanaiz6o3ysmsgt66gxcdi5p4yxxbm7uknaif2l334@jmo43oc4ps77>
References: <20250409115313.1.Ia319526ed4ef06bec3180378c9a008340cec9658@changeid>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250409115313.1.Ia319526ed4ef06bec3180378c9a008340cec9658@changeid>

On Wed, Apr 09, 2025 at 11:53:13AM -0700, Brian Norris wrote:
> From: Brian Norris <briannorris@google.com>
> 
> It's possible to trigger use-after-free here by:
> (a) forcing rescan_work_func() to take a long time and
> (b) utilizing a pwrctrl driver that may be unloaded for some reason.
> 
> I'm unlucky to trigger both of these in development. It's likely much
> more difficult to hit this in practice.
> 

I never envisioned this situation :) But yeah, better be safe than sorry.

> Anyway, we should ensure our work is finished before we allow our data
> structures to be cleaned up.
> 
> Fixes: 8f62819aaace ("PCI/pwrctl: Rescan bus on a separate thread")
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Brian Norris <briannorris@google.com>
> Signed-off-by: Brian Norris <briannorris@chromium.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> 
>  drivers/pci/pwrctrl/core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pci/pwrctrl/core.c b/drivers/pci/pwrctrl/core.c
> index 9cc7e2b7f2b5..6bdbfed584d6 100644
> --- a/drivers/pci/pwrctrl/core.c
> +++ b/drivers/pci/pwrctrl/core.c
> @@ -101,6 +101,8 @@ EXPORT_SYMBOL_GPL(pci_pwrctrl_device_set_ready);
>   */
>  void pci_pwrctrl_device_unset_ready(struct pci_pwrctrl *pwrctrl)
>  {
> +	cancel_work_sync(&pwrctrl->work);
> +
>  	/*
>  	 * We don't have to delete the link here. Typically, this function
>  	 * is only called when the power control device is being detached. If
> -- 
> 2.49.0.604.gff1f9ca942-goog
> 

-- 
மணிவண்ணன் சதாசிவம்
