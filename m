Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AEF17A2F3
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 17:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748713824; cv=none; b=qDTbeWVNkxjbUccN8hT1aGGofT4WLWYhN/htZTJlq4njHfa7zC+KLJI/n2XZfsnAitv+34opAbTqhK+H7eg38ZWinRUtRuoGhiKfiP5FIQOCjN1WvywZWddItHuKvBkQMA7uGVGrnfA7jKSjZ2UU4NnAn7P7WphfxnmlA1ZyABI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748713824; c=relaxed/simple;
	bh=HCvJG+sgtpgwdiZu6mAcUtxYGNjIK0MPNLZyapgK+HM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B9J2xbEhJc5uOEC6OMZD/lPowE+k5fdfBoD1ds6OY+Wem2yWtUm+YCojGWYCCF1MdddjJpj2eDGCO93d6VMnxPZf2p9fRcdoT7H6jFZA9Ppad7svBAyZJKsn0FeW9volzznTfkLlQ1+WpKHyWG4gOs7g1Z7zydMiy3J5EQBk6zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ayz/B4Bl; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ayz/B4Bl"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-742c27df0daso2450801b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 10:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748713822; x=1749318622; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5AbNlKkJboN5wZoU7ozNTe8jKHTn2i9ktrC3fw6ibsc=;
        b=ayz/B4Bl1f0vbCmPrEobj2Hc7pK91Xq9mBPz9GSC7upwbgD2P5zITF9x6JQaTKCAio
         cxUeeI31Xo8zGewuLV6/QBjqnrYEQMK7hcKEGTHxuoI1A/o/vpJHyhBZxFdGjzbDPidh
         dok1NZ2kamfvvsrdHpAUXOqaxwZYilk7pBtPJvmCvmWgTc0fyDzG0SXVfBmWJOAZ8E4B
         bQVi3bdzlsYZGfLp0zYYzHveSSTVauuDnk7YR/wDvzLgwGY0ha6HXFock1nOUslzE1A3
         fGti3slAHQaN3hDUz15IBsldCfLaKYMKbzkRsx8W6QEJfL3PVDaYXW51JhUDgIkU1vYP
         0Low==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748713822; x=1749318622;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5AbNlKkJboN5wZoU7ozNTe8jKHTn2i9ktrC3fw6ibsc=;
        b=q19hX9U9hGPGmL4MeZTkl2iL2/A9CRPNc6MhY9zaIs0xxKeVaPjZgFT1u6CVg3Hr04
         Lv2XZAsvr/RlM64tAp59gJSN4u+oh8uiT5nR69LWSh51T5juTBnvMYPcvcemIfwnLNyK
         ispRCnlSAbisVfwYJtelbpmN7cpzov3v+BucGb6UWhDUkZW6yEE7/o0uP67PmibDg89u
         OzzP+bgT5b4k3kotqtJ+eN/ZD326ZpfF+mkhtxvkkUZ8gXmEGQJ4sNa7GI/0fQZV/s1q
         bHDkXUxqz+5S713m/uEMMVK/d4wqb2F+fsywx/jM7KJ5EP5Tz7s1VEXLN9laXItJvgkz
         nFwg==
X-Forwarded-Encrypted: i=1; AJvYcCUc+H6eCj5M6JQGBfzXGqMqRVOQRHLOnKkxpVoYOSJa0FeltROfar+IpuaCuzBzOeF9zKEIoEuMwQw5MQM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi9uyv0XWadg2f5qkQlAsfkhBfiQC0zn+W1yAVlNM9Ep32zD4Z
	G5zABg8t7DbzgA4Z+DQnAToZB/qHRM2FZ+RZo82/d0jrsDHv9AZNKZk52uRWc+t8RA==
X-Gm-Gg: ASbGncuEVRWtCqGe2eSyED27X1D9v01dxhSCG0kUxx/GkjfNO3euZgE9RgKxRb6QKxr
	sxZvumiCUsyFNot9wvKGnsbIPHMh1fu7XqRnqnXlGHjp2Y6OVBh1IXyBS/MhX3U1rewoNwaOwtd
	s94VElo2ybd77P/vxnbG4qS/Moyn4P3sCgG0ZBaTfMzleQ/6IFr8eSMGYpKoH45iNEgpeZ+6Tsi
	xBUX7kBsNTPcBokxrWjuJGidxVhR628gegZPY63rsZSanBui89NV7T/bWwm5So8bGEEVNRC2ECr
	2yJtK/bfoNdYRX7aGTD44J43L8s2qgsrxdUkJmylCYzqIeXeAyM/nyeWs+m2jw==
X-Google-Smtp-Source: AGHT+IEdPK+JHZ+t44u8hV+Tuwo0Dn5k2WtHvYf+YRYNtFb+Y0T4pf/Gas2+IG+qUK9yX+xyBHPdxg==
X-Received: by 2002:a05:6a20:1583:b0:218:76dd:a66 with SMTP id adf61e73a8af0-21ad95636d1mr11124498637.13.1748713822539;
        Sat, 31 May 2025 10:50:22 -0700 (PDT)
Received: from thinkpad ([120.56.204.95])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2ecebb4834sm2748724a12.74.2025.05.31.10.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 May 2025 10:50:20 -0700 (PDT)
Date: Sat, 31 May 2025 23:20:15 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: jingoohan1@gmail.com, frank.li@nxp.com, l.stach@pengutronix.de, 
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org, bhelgaas@google.com, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/4] PCI: dwc: Add quirk to fix hang issue when send
 out PME_Turn_Off Msg TLP
Message-ID: <xq6ojgyh5tpm4zbpymb2wvtf4at3xq7bai3ztuublgh63e7qdn@vfxan6mew3os>
References: <20250408065221.1941928-1-hongxing.zhu@nxp.com>
 <20250408065221.1941928-3-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250408065221.1941928-3-hongxing.zhu@nxp.com>

On Tue, Apr 08, 2025 at 02:52:19PM +0800, Richard Zhu wrote:
> When no endpoint is connected on i.MX7D PCIe, chip would be freeze when do
> the dummy write in dw_pcie_pme_turn_off() to issue a PME_Turn_Off Msg TLP.
> 
> Add one quirk to issue the PME_Turn_Off only when link is up to avoid
> this problem on the PME_Turn_Off handshake broken platform, for example
> the i.MX7D.
> 

Why do we need to send PME_Turn_Off if there is no endpoint connected? We should
skip PME_Turn_Off and L2/L3 Ready transitions in that case.

- Mani

> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  .../pci/controller/dwc/pcie-designware-host.c    | 16 +++++++++++-----
>  drivers/pci/controller/dwc/pcie-designware.h     |  1 +
>  2 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 0817df5b8a59..a62bf7e0ade8 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -956,12 +956,18 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>  	if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
>  		return 0;
>  
> -	if (pci->pp.ops->pme_turn_off) {
> -		pci->pp.ops->pme_turn_off(&pci->pp);
> +	if (dw_pcie_get_ltssm(pci) <= DW_PCIE_LTSSM_DETECT_WAIT &&
> +	    dwc_check_quirk(pci, QUIRK_NOLINK_NOPME)) {
> +		/* Don't send the PME_TURN_OFF when link is down. */
> +		;
>  	} else {
> -		ret = dw_pcie_pme_turn_off(pci);
> -		if (ret)
> -			return ret;
> +		if (pci->pp.ops->pme_turn_off) {
> +			pci->pp.ops->pme_turn_off(&pci->pp);
> +		} else {
> +			ret = dw_pcie_pme_turn_off(pci);
> +			if (ret)
> +				return ret;
> +		}
>  	}
>  
>  	if (!dwc_check_quirk(pci, QUIRK_NOL2POLL_IN_PM)) {
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 05fe654d7761..d752af660e95 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -283,6 +283,7 @@
>  #define DMA_LLP_MEM_SIZE		PAGE_SIZE
>  
>  #define QUIRK_NOL2POLL_IN_PM		BIT(0)
> +#define QUIRK_NOLINK_NOPME		BIT(1)
>  #define dwc_check_quirk(pci, val)	(pci->quirk_flag & val)
>  
>  struct dw_pcie;
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்
