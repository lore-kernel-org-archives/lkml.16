Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101E01D5AD4
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750869152; cv=none; b=PfGv06YDewq8ujCjT2RKzZZ+HecofEtpGrJShS7gPdMvKaMN2i4VL73neVmYD8Qave4M5rQh+F/mVhFb7S2DCG+hklg8ri6584tiJGyuBid6WgESslRDbVk/Q+npBc+a7KeLIG5wiCU8jwX/f7yHF+8mZPw1Vwduy0TTbFqfWHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750869152; c=relaxed/simple;
	bh=8TYcMGuvfrOPTqiK2suEA8nHlm5YxH4UZz2kZg9xykE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p2tlH1Lf4TXZpNdL8BhEkhwQ97iZhiCfP72z8+fkKo9LQtm/B5YfKXNdIfSqXRcsccFzmRFYUo/o4BXDbxhGNtIFBOXlzpp6Vv6ffffcOYGRt5sw2vQm49cwrHJrUZKqJW7CGImOuNhY5jyWS7a66QjiUFD72RAJjLGsDOwqI88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1AoFpX+I; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1AoFpX+I"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-237f270513bso171895ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750869150; x=1751473950; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNDCMsFM0dLcD3giL6El7GcEVgAj+FPi15dFWxjF5N4=;
        b=1AoFpX+IAQZaIR7SoWqXFCveJKe22IDQWaH0KItEd5dfCR/A6Fh6rv8LeR7Hu2Xy8e
         TwKLvFLAfu8Na85RO4AhnoJ/C4lCKVNPu+e7ea1INKnOFkLssIO7R4Gfta6UdLGYAqgM
         Im9Ri3mwDsY9+Z50HRffs3a0G3WVOMDkQnEgkslnTZAQSM3SDuMvtbZK88AXI4lh5EtA
         GGOkchjkHpYuKX2kiDldB50kTAaMTumGQvYwr4N+erPxESFKfvHXbu1PL7qUymNT2ZlA
         u4v3+NwzpcmPECAvtJAvb3q2vOvnJKs8fPeGUC7C8nquD5mC4b/f7ALOI7l28gjpHW4J
         lKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750869150; x=1751473950;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNDCMsFM0dLcD3giL6El7GcEVgAj+FPi15dFWxjF5N4=;
        b=vJ6etpD7VNQMrjh6v12YUhwRtubZeW38Izl94LRKV1baK6R7eT+HnAhTYSZsZqZXjp
         5vkpzxLUgT0Kd2XUe94Z1z2DDXURgxVuNzi7vqYg2lNn29ofRm+GMW9b6q5GTgRxikSF
         Pr3p/FhuQKjMKxXa0rrG1IwQkRPZGElKkLeE00z+//q68elLjw3Ol8weBx7nwCFViShS
         aUtkLhc/HWFz3x0g/n1HKH6CEOJJkGIi6ayJjzFxjucij0/w27Texh69HRrTPTYD3a3x
         Ner6eJa7dcDTrRwDBTv/unywdNajPC2PZ6fxAt9MqOOlw+mIZ/gKUqGkyFbwe8iBiVHE
         KLbw==
X-Forwarded-Encrypted: i=1; AJvYcCWlRyw6tkU4bwWDoMoGlf/r7QV1BCV0lCzfOWgoz7pGeTbObyHTPPtGCGazzjVWCR1TeUxde23s6ajAMBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKiDS1eAH1vNgMKpqyv2V3RHE63bO8ymZcnlzQoxvdUhYzZV7+
	uJnTeHSQJ6SpnsL6W8gmsILE0zWPKvet1rI2A2N+4Hxe2O77mOPNc3K/xgs8rkUXFQ==
X-Gm-Gg: ASbGncv1dpKxQji7t2uTHkLyiIiI0ZEth46t5kdap+3Wc9jZXEFxgj8EXt+B2s5gjDS
	YTH+Q9eYC4txYr9fnbJ54ZCYmySRicgiiyAP5ZBLUSUNvUcH/KVX0nU1dJa+uav6os6AgRBgymC
	e7Y5ghsTFnHnYjGTaWm8BtFtLI9vvqjB98q/S6S3GGfIinleHX1QbtIGjScnWx59TYlHeqi7hlq
	sJKCXkKsKbvC6Yc5hbg0yaFV/QKH6knGXXkObRNqTJRau09O64vyFFjn3lDRRW7QrYQCSBbVEZ5
	iodmNPoY/JbqGAt190xfz1FoQ+sBq2JHkLYO2ENW32equyvNpGupItIupXZGOyfIZ61XyGQd7aK
	WvxEKjkqRh6ud+d5biwnt
X-Google-Smtp-Source: AGHT+IGPl5ZbRLp9CMT7E4DlPhiFrpFNfXgOWI+ELwfYYz5UC1jy4W18mFMj0Uk0hA0ox3edCzOrvA==
X-Received: by 2002:a17:902:eccf:b0:234:8eeb:d81a with SMTP id d9443c01a7336-2382728934fmr3551785ad.16.1750869150129;
        Wed, 25 Jun 2025 09:32:30 -0700 (PDT)
Received: from google.com (60.89.247.35.bc.googleusercontent.com. [35.247.89.60])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f126a7d2sm11309303a12.68.2025.06.25.09.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:32:29 -0700 (PDT)
Date: Wed, 25 Jun 2025 09:32:24 -0700
From: Vipin Sharma <vipinsh@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>,
	Aaron Lewis <aaronlewis@google.com>
Subject: Re: [RFC PATCH] PCI: Support Immediate Readiness on devices without
 PM capabilities
Message-ID: <20250625163224.GA868055.vipinsh@google.com>
References: <20250624171637.485616-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624171637.485616-1-seanjc@google.com>

On 2025-06-24 10:16:37, Sean Christopherson wrote:
> Query support for Immediate Readiness irrespective of whether or not the
> device supports PM capabilities, as nothing in the PCIe spec suggests that
> Immediate Readiness is in any way dependent on PM functionality.

After reading spec I also arrived at the same conclusion, this can be
done irrespective of PM functionality. For example, wait after FLR
behavior which are done using PCI Express Capability is also covered by
this Immediate Readiness bit.

> 
> Opportunistically add a comment to explain why "errors" during PM setup
> are effectively ignored.
> 
> Fixes: d6112f8def51 ("PCI: Add support for Immediate Readiness")
> Cc: David Matlack <dmatlack@google.com>
> Cc: Vipin Sharma <vipinsh@google.com>
> Cc: Aaron Lewis <aaronlewis@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
> 
> RFC as I'm not entirely sure this is useful/correct.
> 
> Found by inspection when debugging a VFIO VF passthrough issue that turned out
> to be 907a7a2e5bf4 ("PCI/PM: Set up runtime PM even for devices without PCI PM").
> 
> The folks on the Cc list are looking at parallelizing VF assignment to avoid
> serializing the 100ms wait on FLR.  I'm hoping we'll get lucky and the VFs in
> question do (or can) support PCI_STATUS_IMM_READY.
> 
>  drivers/pci/pci.c | 40 +++++++++++++++++++++++++---------------
>  1 file changed, 25 insertions(+), 15 deletions(-)
> 
> +void pci_pm_init(struct pci_dev *dev)
> +{
> +	u16 status;
> +
> +	device_enable_async_suspend(&dev->dev);
> +	dev->wakeup_prepared = false;
> +
> +	dev->pm_cap = 0;
> +	dev->pme_support = 0;
> +
> +	/*
> +	 * Note, support for the PCI PM spec is optional for legacy PCI devices
> +	 * and for VFs.  Continue on even if no PM capabilities are supported.
> +	 */
> +	__pci_pm_init(dev);
>  
>  	pci_read_config_word(dev, PCI_STATUS, &status);
>  	if (status & PCI_STATUS_IMM_READY)
>  		dev->imm_ready = 1;

I don't see a reason to keep it in pci_pm_init then. This should be
moved out of this function, maybe in the caller or its own function.
> -poweron:
> +
>  	pci_pm_power_up_and_verify_state(dev);
>  	pm_runtime_forbid(&dev->dev);
>  	pm_runtime_set_active(&dev->dev);
> 
> base-commit: 86731a2a651e58953fc949573895f2fa6d456841
> -- 
> 2.50.0.714.g196bf9f422-goog
> 
