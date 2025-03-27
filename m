Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5F22A1CA
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 17:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743094871; cv=none; b=X7xGfu6kcdP82GoQzNpty8wmH02Rz+6ZWZttC2GgRxWIwRPwl1arDYTxMdPPWkS4PG4efJVJXmF550GM1aRvX5z6cQZqjcl3rwRNYhK6TViRwxY8HDwo/GJnuWBKZW6XWPMzCrDVp4NjxPiadGRiuUMu/hliqkmc5UrIip5z5Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743094871; c=relaxed/simple;
	bh=90Oqr8LPETJCgzlxDfWErsEUt1o4ENjdoCUxT37hAlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cq1khb8hBv896KhHO2UHti+lnCTPc6Hinpfhd3OL/tCyeMphV1e4TMn57i26IcMH80Q5ZENLg9Q+R4S8JnBr56jXmg2rybBwhEigsW3Bf6+yL+OehCzc5HDZWiQbHhCiCZ+eUXOup1fV0iUAHRRkHEjRNII1kiS3j+i3l2hsIIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bxSCHOto; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bxSCHOto"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-224100e9a5cso26657015ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 10:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743094869; x=1743699669; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x9Om66rj99/DALJuBXsg77rBt0HogaVaFZqpEHuMUIc=;
        b=bxSCHOtoHBzUH5YlBS97unjqFWt+ChcYbeDj87G1OqBZMnaLD1bUeMO9qhjm8ARm9s
         TxzQVWRGkPQZUTBKJzRxcRumgloyYQu0HAaYlOTbsR2YqLcU5djHqSTu0VpiCKL1QQ0k
         3OKlYjhroXAmxoh3OdjBmFCei8nJ6Ozf79/9cH5GfahnRBjGJvYkroWJWfOu2N/Vm+pr
         sRTh5nz6KKWMyU/icRLG9xOj+hejCyJga9ZTAk8GnQNUU2KrmQdgvbt6Qq5M32/Rjbw9
         8kl7eRMR1YmNRBABFJAVixoRR5sutBg/7A2E+d8nv2LV8QCVreqmwtgwSzmMt8MJNH8S
         Zx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743094869; x=1743699669;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x9Om66rj99/DALJuBXsg77rBt0HogaVaFZqpEHuMUIc=;
        b=hFZLso+8aMrkUod+1KFyyWhhE/ZxhAYB2aNN55HTZXtlECn+bB1+T31ZCzzpNFWffl
         OpD80gDv45tzpb1/cOYkflJzhDHR1MdqVl0seZTcNnbWd5YnRzl9dh5KOQph5Q4ygWAN
         t9wcF5pkSj9BXA6hysQVTwTF3fAeDojDpDq7ck6CVVN0B1cdfialfIwPnkByMJfA3Yrm
         cZy0yKh/7pCY++O2i6KrIs7gZ08iiPET7DKkD2CgwI6iMRy1dakuxji7RvsaaXYVCt1t
         8mm/WPxUheo4zwiOqixw5/CVCUKhFDoOsLDEWkPWyMMeQuwGAdES/edOl3nlyOTL05aa
         yrIw==
X-Forwarded-Encrypted: i=1; AJvYcCX6gICfKQkJS3zzh3MkwKISUD0yRd4pMJEKAv59qfdaDKPcZJ7z9m1eeKck5ibi4KyatdcViT+cYI/LREk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuYnfhuPcKmVERvC+iTo8GAkRCfK5zwIkgpf6guJNUfc037BP5
	OnvfoC93NoNjiSEQAKzZrL3bWudiGPVc9ECsNalvAt1TbrWEjvF6kX+HsW0Lww==
X-Gm-Gg: ASbGncum54UshYz8qeIbvIu5Me6kGzSI/cZpOqe6cQhi3sX8wLn9HlbQsZWL49miLGz
	cawE2NOG+F6uk3MOMY9UyaveMSJwJZnSWM9ev+KW2eS7r+7gvNIJh+5bldIuIqYlSSKDCxvHaAh
	bYq/flazPkqbmfBepxRcr8d775KXeiZTMQkMZDS58A/BdS6/BUpvvdDRAYR5OkaXFb4Klgv8Zo+
	KqEo9p0Ei3NfoXXRPNVeGK8DJ3KBMl59v0rJ77D+VzwMVCwAruXTwGTMfGcDRs3oJDRriEmdXa0
	cI+aF+L4CbItEqQStY+7ogCXbEab2BAl8sdYqx127Zm0lMmOkkSaSVE=
X-Google-Smtp-Source: AGHT+IEVdHVK7JF7u8j+EUGnNoxibuaKXvJexJszG0yV+dnakw5BqGXTpJg0+X0nED7L5VQvd0YN0g==
X-Received: by 2002:a05:6a00:2382:b0:736:6151:c6ca with SMTP id d2e1a72fcca58-73960e0b5f1mr6804772b3a.4.1743094869370;
        Thu, 27 Mar 2025 10:01:09 -0700 (PDT)
Received: from thinkpad ([120.60.71.118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7397109d241sm30123b3a.129.2025.03.27.10.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 10:01:08 -0700 (PDT)
Date: Thu, 27 Mar 2025 22:31:05 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org, 
	bhelgaas@google.com, jingoohan1@gmail.com, thomas.richard@bootlin.com, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [v6 5/5] MAINTAINERS: Add entry for PCI host controller helpers
Message-ID: <qbqkt53c27zwaetm7faqleqypy7yuxjfdcbukd3vd6t4p3tiwq@jtrk4524wsjr>
References: <20250323164852.430546-1-18255117159@163.com>
 <20250323164852.430546-6-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250323164852.430546-6-18255117159@163.com>

On Mon, Mar 24, 2025 at 12:48:52AM +0800, Hans Zhang wrote:
> Add maintenance entry for the newly introduced PCI host controller helper
> functions. These functions provide common infrastructure for capability
> scanning and other shared operations across PCI host controller drivers.
> 
> Signed-off-by: Hans Zhang <18255117159@163.com>
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 00e94bec401e..9b3236704b83 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18119,6 +18119,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/pci/intel,ixp4xx-pci.yaml
>  F:	drivers/pci/controller/pci-ixp4xx.c
>  
> +PCI DRIVER FOR HELPER FUNCTIONS
> +M:	Hans Zhang <18255117159@163.com>
> +L:	linux-pci@vger.kernel.org
> +S:	Maintained
> +F:	drivers/pci/controller/pci-host-helpers.c

I don't see much value in maintaining this file separately as these helpers are
not going to evolve much, thus not needing separate maintenance.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
