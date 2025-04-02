Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1977081C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 08:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743580843; cv=none; b=SHG25zXcC7emY3S823lJf8G38h9/sz2y+xE50dlU4qyfPBlpy4S+4w+D51DQ9gSvryB8Z/IaqkF4cKLo/j9dvhuToJm/2ErpO/iKqFdVJ2vAPdRJfcJQ/7GOgWah9ouOXs4ddfBYS9lHR3kZCCpMnWd9Tld1BsnN0rQqJzv7g7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743580843; c=relaxed/simple;
	bh=0a4g2AA3yqI2lZl/rLdcxJlvVBoXlDU/3TS7Jxz9usY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=atZb8Ssf9Xsdu4/3vmsroys2Ck5nzqsJu4CHkacljbVWds5/B5f7Ne5uXiSlTytBfu5WaxnaBPPNCK1d5jYK10e98LDTjna+8SjxmO6NqF5bGFj8JtBfJ8XBez/WqsbXRbrDImquV1Ip9CtaCIEs8dGhBHBv/2yTwzJKtPMHAp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E8KZeGlv; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E8KZeGlv"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ff6e91cff5so11203215a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 01:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743580840; x=1744185640; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ctkJhtxKsp7SbmROJ/NcWvcFC2gk/L3/qKRnLMhq/34=;
        b=E8KZeGlvhHQ5ZBVIMXgyhFY1Z97wEupWCdkGhGcJnW4mnUxYLPUcrb3IA4sTJsln57
         w8tVtG/OSgh9g1Akc+dNZdsCD7+HEhHOcDDMmbQ0zjtxR54U5xvQCfYz22xHnWN+GkVd
         4isG5cZUZvE4nldLhqIc8C7U09lrtlLCOZry9cpR4BLTrXRj+QndmXZ4ZDexQLiQsK63
         G55FnqbrYoOFjEwo+lCHNdO8RNZu9nTC9qptiplN5GOLloztonZGHTx2084ODG0xC+2G
         OLeqp2lXDqjO0Rp/dFp7Y8PPSNyqFBEydBFmorWUL4HmafopomhOHvOVSywi1fxOrf92
         +QTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743580840; x=1744185640;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ctkJhtxKsp7SbmROJ/NcWvcFC2gk/L3/qKRnLMhq/34=;
        b=QjYtBla54nf6eVaNfEtAjNU4EltmZHn2rVLIrQz9qDgHqxZWtcuf562h/DyyP+O1vx
         iO2FKnyinbJIomUvBB6oKeuj6s/25pdy16tZoHqEnRbOwQNVV67EvS8Mu0ZVlaNh6A7Q
         nOAaj1gvQ+AiE2qjPkcto30xGBsxW+VFjivt95Wy35IsaXlu7uZOJ9egfXh7Ydc/tId6
         d8SO6pGgXBlA0UQ2H9suYnTjbAvu4QBUPGLxG2mo+fz8uPQHX+kYNLmTctgcDerZR8ON
         Fx+/c0nVWPykXpRj52On0WLlRTX/3rQ9Zn8cM8iOidHI4DRTQH6lVreKxp7P4lq+o3fg
         rbQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRM826P97AV+JvcJqAmHVeC/uQp9HJZyoGnUjgXdSO4bHTv5bHWV+J9J3dD3KesBEuLeMPBr8axbuhXag=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBXH73QFgDrtBpIuNJ2CBMw1+ycDoVCKZy21yYCPGnMhI2VMs9
	WHm37xJlXXQivqfrfBeE5UAmMlfLf/ocl/5QpVi0CFLreQ1/s2G6JA7AVxxJcA==
X-Gm-Gg: ASbGncsWpymRWi4kNqm8r1844es7++dMqC24YWaEP6FVHuF8ODHSWkVbwTxXPf5YjlX
	KYkL/68r/IIt48K2POa0i2O3Wf91BDUwDPR/vmE5Za5czi2tqbd2R8cVPVA6Qh+FGPxtPkGbblG
	3Ol2zuendmmKCyHpOPmdm+j3ObOqqOIIg1aH+XeCCCTWxq31mwQAsRwI0F+bYCkZjvZNz9Esvpt
	YkhYKlX/Whv+uGu/0YXnJCyoRHBoywrXoDSmqiqMaTCAfxAcI950ZJU86TH+CuarV17JbqKmUJo
	svyOZU+Uy3n0KfrRdKzc5JadUd0O/i9PO+odo7zUtD1JnaXmGGEgQctk
X-Google-Smtp-Source: AGHT+IGTopCX2yplsS8GSpqfdGC18AVuR2urMTzElNFnwCLQ4BxN3uKkDEM1puu2xMXe8rc89mguVQ==
X-Received: by 2002:a17:90b:1f92:b0:2fa:15ab:4dff with SMTP id 98e67ed59e1d1-3053215b176mr5797036a91.31.1743580840354;
        Wed, 02 Apr 2025 01:00:40 -0700 (PDT)
Received: from thinkpad ([120.56.205.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3056f979d6fsm1010122a91.45.2025.04.02.01.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 01:00:39 -0700 (PDT)
Date: Wed, 2 Apr 2025 13:30:34 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, 
	Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] PCI/arm64/ath11k/ath12k: Rename pwrctrl Kconfig
 symbols
Message-ID: <bsk4s5tlbpnvds73uxeasqxydcxolxpxvmtladtejhbi65yxob@4h5gy5srxlrr>
References: <20250328143646.27678-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328143646.27678-1-johan+linaro@kernel.org>

On Fri, Mar 28, 2025 at 03:36:42PM +0100, Johan Hovold wrote:
> The PCI pwrctrl framework was renamed after being merged, but the
> Kconfig symbols still reflect the old name ("pwrctl" without an "r").
> 
> This leads to people not knowing how to refer to the framework in
> writing, inconsistencies in module naming, etc.
> 
> Let's rename also the Kconfig symbols before this gets any worse.
> 
> The arm64, ath11k and ath12k changes could go through the corresponding
> subsystem trees once they have the new symbols (e.g. in the next cycle)
> or they could all go in via the PCI tree with an ack from their
> maintainers.
> 
> There are some new pwrctrl drivers and an arm64 defconfig change on the
> lists so we may need to keep deprecated symbols for a release or two.
> 

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> Johan
> 
> 
> Johan Hovold (4):
>   PCI/pwrctrl: Rename pwrctrl Kconfig symbols and slot module
>   arm64: Kconfig: switch to HAVE_PWRCTRL
>   wifi: ath11k: switch to PCI_PWRCTRL_PWRSEQ
>   wifi: ath12k: switch to PCI_PWRCTRL_PWRSEQ
> 
>  arch/arm64/Kconfig.platforms            |  2 +-
>  drivers/net/wireless/ath/ath11k/Kconfig |  2 +-
>  drivers/net/wireless/ath/ath12k/Kconfig |  2 +-
>  drivers/pci/pwrctrl/Kconfig             | 27 +++++++++++++++++++------
>  drivers/pci/pwrctrl/Makefile            |  8 ++++----
>  5 files changed, 28 insertions(+), 13 deletions(-)
> 
> -- 
> 2.48.1
> 

-- 
மணிவண்ணன் சதாசிவம்
