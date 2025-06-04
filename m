Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E131F2BAB
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 17:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749057813; cv=none; b=HMMcZj1gVqfVlqwvjHQHPQb+HVl8wBXvPSK+PSZT0oyxsB0e8Kah7L7v59+8BWdO8NjrvGGW+GMJBIAyrLsJRUCAOvq+bOrA+dVYx3vNO9avtvsZyjAbIW932yKAUpb8dhTqqkV05oomK7vmvO76ixbdKUKzVoOpe/E3FkWx5Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749057813; c=relaxed/simple;
	bh=gZSXx3AMeT4oZP2iB0iJUp1MZzfV5OppJkNcfJLcdDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rphqPfONC8B6suvP960kuaiSj+IIW8mSf2dG7qtbpG/oKiQ/A21OwnUA5fcbrS1NNaordpxJ2yZCTIst8OQ/VtMVkP7ssPdqu5GQAGELHoSlzs7Whm9NITBYxIhPAqsqS+TvfqIAu5D03FY48gRu73xT1fTeQevD60T0+MkqSNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K16Xu1EQ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K16Xu1EQ"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-231e98e46c0so893915ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 10:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749057811; x=1749662611; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QHono2++O4fr0FrSH5Q5xobqEyxv94ONXS/va49k4Z8=;
        b=K16Xu1EQarnOLYxZ+KxOUwiFUrFPGthEsvvxo/KFVx5wyedFw+0ShZrfd1GX7uOeRl
         nMs4/3Zpt5j35wnkexKWWtw0NXaDY7k74k9KJQOUc52KV3zFlhMBymJKibaIsDyEiJAB
         NoJZKxo5U4yjG/E/rIXoQ32/kmDvRR9WsfKQH0Gw2/oe3nrUpYdSYSnrKQNd1RJ//dYB
         ALIyjQT1lJ8LK4+g/Ai0QCiFyVNf0pBf1wSFSIg5SNLHs7vKTSyBhXFLrna07wmfxxUk
         3h5ZcPm9kD0B/FChnixl4mnEEiAYiE33WWjaysWE+JKtP37+Tx5muYElQdEntbfQ9Kkw
         oT2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749057811; x=1749662611;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QHono2++O4fr0FrSH5Q5xobqEyxv94ONXS/va49k4Z8=;
        b=g03foLEozW09EPJSQ/lk7/VFIngzrAic1fZqTANVlhXwWufhRYtekqR7wd2sVwhx7G
         i2qVSMgLEndop8+VZSl8kKyzoWOV8GFJzAJIgezmPsWXcfhPRZ5zmBtqaqtuudv0RCPz
         DJG+ONeQG2NaufBhMKFTLGBK0/WskHufV3RAu/dYtUUjWoxXj35VkW3m65uLOD6/3qgP
         H5KOIJNHyXTQvASiDTwbh9WHvv4JZbTxcdsSlUkubO0DK8I6GPCVgkak9NODiPziXfiy
         1K/R99jsA70dgPX2bQxNywegYkYCgtw/fsU12mXcEa/eOeVivo93hzQIKQPgZF1XPUNk
         BcWg==
X-Forwarded-Encrypted: i=1; AJvYcCXHfU5vBswbRUv5EweOkiOVTKnHRx/f3q4KJ/L+MkEqyJrDZJqBifTbZekf/U+Nnjrq+tCOm2s++Un3m/0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH1/tpXiLRZCnSO7VMqJizW3d/e095sUiEwuXaUifKIFraXW8c
	2g0e/FKJaPYZ+ldM7Ce5tLEv+NAOOZq1FX0HhrrvzqhlLWAMc8lQNNQrZf+dRBug1Q==
X-Gm-Gg: ASbGncuzCs8TURBBLursHtNR6GlXdJCx4J8TaoNvC4RldCnVXJLq+ap3dY4b6qsgPCk
	Zq4phbXvQdEPAk+Rl2pQWbMIOhhI54ocSYr4v1G50hIOM1Qs9YkM14FDTp9a/RS9U48qMmi5qMo
	eoWKp8lebWIvGCy/V+dYShYTXOPo5iS4siGDS//G+BN+RKeBB6oVw6t5ivrC+F8WU8oSNMDqJBr
	/K6/vqCkEUlmSc1WFqTO8u6EEtuGhJP5S20S+1cq3fnkFsxDKX+65OwTr+kzYoL8+A2m9flreaJ
	p6dNawwtunyLooU9HmNwk5VZHgU32eI9DCfYZonXC1DpdKJiCjYkX5Vj9H+zIg==
X-Google-Smtp-Source: AGHT+IGwgeJyFDpkWLW3KBe5vXSpgr0D7NF/b6JqvGw4nc8XALIL1xWj89jgG04Uup6TALuRObzniQ==
X-Received: by 2002:a17:902:c94f:b0:234:ef42:5d69 with SMTP id d9443c01a7336-235e112337emr48387725ad.13.1749057811256;
        Wed, 04 Jun 2025 10:23:31 -0700 (PDT)
Received: from thinkpad ([120.60.60.253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-235caa81c24sm30776725ad.200.2025.06.04.10.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 10:23:30 -0700 (PDT)
Date: Wed, 4 Jun 2025 22:53:26 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI/pwrctrl: Fix double cleanup on
 devm_add_action_or_reset() failure
Message-ID: <tghehtcxc45rtdnt4mj6td4zziebckwfclbu665mtmcwvz562u@q24eds5pn4bn>
References: <f60c445e965ba309f08c33de78bd62f358e68cd0.1749025687.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f60c445e965ba309f08c33de78bd62f358e68cd0.1749025687.git.geert+renesas@glider.be>

On Wed, Jun 04, 2025 at 10:38:33AM +0200, Geert Uytterhoeven wrote:
> When devm_add_action_or_reset() fails, it calls the passed cleanup
> function.  Hence the caller must not repeat that cleanup.
> 
> Replace the "goto err_regulator_free" by the actual freeing, as there
> will never be a need again for a second user of this label.
> 
> Fixes: 75996c92f4de309f ("PCI/pwrctrl: Add pwrctrl driver for PCI slots")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> Compile-tested only.
> ---
>  drivers/pci/pwrctrl/slot.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/pci/pwrctrl/slot.c b/drivers/pci/pwrctrl/slot.c
> index 18becc144913e047..26b21746da50baa4 100644
> --- a/drivers/pci/pwrctrl/slot.c
> +++ b/drivers/pci/pwrctrl/slot.c
> @@ -47,13 +47,14 @@ static int pci_pwrctrl_slot_probe(struct platform_device *pdev)
>  	ret = regulator_bulk_enable(slot->num_supplies, slot->supplies);
>  	if (ret < 0) {
>  		dev_err_probe(dev, ret, "Failed to enable slot regulators\n");
> -		goto err_regulator_free;
> +		regulator_bulk_free(slot->num_supplies, slot->supplies);
> +		return ret;
>  	}
>  
>  	ret = devm_add_action_or_reset(dev, devm_pci_pwrctrl_slot_power_off,
>  				       slot);
>  	if (ret)
> -		goto err_regulator_disable;
> +		return ret;
>  
>  	pci_pwrctrl_init(&slot->ctx, dev);
>  
> @@ -62,13 +63,6 @@ static int pci_pwrctrl_slot_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, ret, "Failed to register pwrctrl driver\n");
>  
>  	return 0;
> -
> -err_regulator_disable:
> -	regulator_bulk_disable(slot->num_supplies, slot->supplies);
> -err_regulator_free:
> -	regulator_bulk_free(slot->num_supplies, slot->supplies);
> -
> -	return ret;
>  }
>  
>  static const struct of_device_id pci_pwrctrl_slot_of_match[] = {
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்
