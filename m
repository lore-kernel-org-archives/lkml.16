Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84719A92E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 06:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743575246; cv=none; b=aWtcA+9O/4SpcQpF74nlXVVNwEoyZHiBHYh1HUMOFB2iGP97BZukMUZxthSbFGhu1jMi0SMFpKswU+r5+2F3wn2gNTKGqgzMBAX/9JQdKuE/5HKriXx5HFtA9wPmiij4iYoCKNOBE9ewY8jczxXoxW0YS3zRcCqBai6GTsBsles=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743575246; c=relaxed/simple;
	bh=dZNfw4e53R/2i9yKfUihZGMQ/0k4D+W1DqhP5bAjhq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UJCsJvO7gfcbCM63vwJUT7VQpPwD/sOkZOV/BAD9VvS2YDA8pB3UqQkVBkaHBjxiipKODYhy0oDfaMuCunsL2bk0Lt/CLXYiwbGajlsmJlkjF3hd9E/qNeAMxsPFP643Uf7ga9ztcJSKadH2AQKLXhpQk+bTdcMM82jABLyLYdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zX+oJqvJ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zX+oJqvJ"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-224100e9a5cso118653385ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 23:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743575244; x=1744180044; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0vxtuFvSbsxOaM1zbzEuh2qcT0p6czX42zd3rEEDXyw=;
        b=zX+oJqvJGBE5aDyxQQJ4Ix43jfeL4lSEdRC2C5sVAbLYr65hlcrk97oiWxVBwqZ+m8
         gHQRxrkJx/M2U+18RevB7RoUmopxyYMrSD6CqVaTN913glGWBmrP92isLxbfn2O6p8LR
         xKY+mYm12nVmiPHU2PRg3WlPxtn4ISmxCHfZuJOHAAPgSOb+enNk8ALp69sVMvc9OjAS
         84RDlM6TcMjZbk9LZgpjAg/suTeeQ+Blh6obg1UbA3eS5bdccOwOht5U9nw8igQblPh9
         ZzhvsF7W2LjpkP3XBPLefMJ2ILnBbnvFkvdzImEBHulDxd3WfP6rKsvPQo/+QF9w1/wr
         GW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743575244; x=1744180044;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0vxtuFvSbsxOaM1zbzEuh2qcT0p6czX42zd3rEEDXyw=;
        b=HOsqYpK7AvQrHtlPpPHFeTZCjgaM+zCrk9JLf6YyG6bcC1e8BhwLDpE99sgMYj/tzF
         j0EVN0YPyC+Mzo91fe0td+Pd8QyHd9ZmOpBLBUDKdWR3RRhUoapueKmC+JMy9EkFGn54
         jN7IKKGF61bdOkrGNomFfhIuCIE8AtWBZXDR5whroOw0FDLyq8Rpj3XvnwK0kf68Li+y
         4hwN7Y6r/zXkx3tUuwtP36e/VmFjKdYihjf+NeffqkV4vcQsBmXirr8ATqXDAh++C97l
         w40cd8uZTbmLRAaoqfxedX/ajNKfr/Z/nQxdY0zb/yxBOzq8i5xKjC64hh1RaJJLhJsS
         w5Gw==
X-Forwarded-Encrypted: i=1; AJvYcCVLLqnoTFDHt7Fma0EfoJhPRJmojOKzDTSxA5ta7mevAZAOuygzHtzCDgQ5K8LETtGxq68JqfupI7s4PkA=@vger.kernel.org
X-Gm-Message-State: AOJu0YznFqVuJoPCo9xZ8pn3GSChFErBrxG6AXn6GbMT2tvWrdudO7ph
	6erO1z9Fi9pd4enlv2oT7o7b6P7a1p4guUihfPI8p4jfoim9luLc0j/Te2u32Q==
X-Gm-Gg: ASbGnct2+anHni/9yS2cxbGNzDN+8pL1w2kA/Lef/8LR0QMiQ2qU7MaVhoWY9xccGvs
	WDyxeGRJV7SSwKQjC+K6QKI69QF+RF9M3i3Dh0qsUpEOYVoTKT/xr5WthfjDyY4vEL+Ru94VzKN
	WT81WnT6BIGn/+x8aW8cKFxLwXBdUJQPVhy6cG6Ix7xTwPVShQATcFyFy1D5f2iANNxAFFKgbTq
	znKztgym2YjQfpeDhk2nmQdR/tj2q0kI9j3a2ES9ewzNeI079kIwG2kU/xJmnlHpsBSASXa2xEa
	sCH+Iw9LcrT/ZNbIqeEqzU1QtakZss9spnAKGRoBTN5WKexwA/woJlNq
X-Google-Smtp-Source: AGHT+IEftqywmuVKm2jxf0hoVI8+XFFEcICMDydA0YNIWpJc2sWztLxMbLmbc7T+583swHeEhH9wPw==
X-Received: by 2002:a17:903:11c7:b0:224:1ec0:8a16 with SMTP id d9443c01a7336-2292f9622b5mr229392235ad.21.1743575243714;
        Tue, 01 Apr 2025 23:27:23 -0700 (PDT)
Received: from thinkpad ([120.56.205.103])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee1b3fsm99908325ad.74.2025.04.01.23.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 23:27:23 -0700 (PDT)
Date: Wed, 2 Apr 2025 11:57:17 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] PCI: imx6: Start link directly when workaround is
 not required
Message-ID: <kskqytb67s6qpt2jfn6sry4oj3zq46y5hizyzxxvehtjtqtj6r@qmtfepjzjrpk>
References: <20250328030213.1650990-1-hongxing.zhu@nxp.com>
 <20250328030213.1650990-2-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328030213.1650990-2-hongxing.zhu@nxp.com>

On Fri, Mar 28, 2025 at 11:02:08AM +0800, Richard Zhu wrote:
> The current link setup procedure is one workaround to detect the device
> behind PCIe switches on some i.MX6 platforms.
> 
> To describe more accurately, change the flag name from
> IMX_PCIE_FLAG_IMX_SPEED_CHANGE to IMX_PCIE_FLAG_SPEED_CHANGE_WORKAROUND.
> 
> Start PCIe link directly when this flag is not set on i.MX7 or later
> platforms to simple and speed up link training.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

One observation below (not related to this change).

> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 34 +++++++++++----------------
>  1 file changed, 14 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index c1f7904e3600..57aa777231ae 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -91,7 +91,7 @@ enum imx_pcie_variants {
>  };
>  
>  #define IMX_PCIE_FLAG_IMX_PHY			BIT(0)
> -#define IMX_PCIE_FLAG_IMX_SPEED_CHANGE		BIT(1)
> +#define IMX_PCIE_FLAG_SPEED_CHANGE_WORKAROUND	BIT(1)
>  #define IMX_PCIE_FLAG_SUPPORTS_SUSPEND		BIT(2)
>  #define IMX_PCIE_FLAG_HAS_PHYDRV		BIT(3)
>  #define IMX_PCIE_FLAG_HAS_APP_RESET		BIT(4)
> @@ -860,6 +860,12 @@ static int imx_pcie_start_link(struct dw_pcie *pci)
>  	u32 tmp;
>  	int ret;
>  
> +	if (!(imx_pcie->drvdata->flags &
> +	    IMX_PCIE_FLAG_SPEED_CHANGE_WORKAROUND)) {
> +		imx_pcie_ltssm_enable(dev);
> +		return 0;

While looking into the code, I realized that we could skip waiting for link
during the workaround in atleast one instance:

```
diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 5f267dd261b5..9dbfbd9de2da 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -875,11 +875,11 @@ static int imx_pcie_start_link(struct dw_pcie *pci)
        /* Start LTSSM. */
        imx_pcie_ltssm_enable(dev);
 
-       ret = dw_pcie_wait_for_link(pci);
-       if (ret)
-               goto err_reset_phy;
-
        if (pci->max_link_speed > 1) {
+               ret = dw_pcie_wait_for_link(pci);
+               if (ret)
+                       goto err_reset_phy;
+
                /* Allow faster modes after the link is up */
                dw_pcie_dbi_ro_wr_en(pci);
                tmp = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
@@ -913,17 +913,10 @@ static int imx_pcie_start_link(struct dw_pcie *pci)
                                goto err_reset_phy;
                        }
                }
-
-               /* Make sure link training is finished as well! */
-               ret = dw_pcie_wait_for_link(pci);
-               if (ret)
-                       goto err_reset_phy;
        } else {
                dev_info(dev, "Link: Only Gen1 is enabled\n");
        }
 
-       tmp = dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKSTA);
-       dev_info(dev, "Link up, Gen%i\n", tmp & PCI_EXP_LNKSTA_CLS);
        return 0;
 
 err_reset_phy:
```

dw_pcie_wait_for_link() in DWC core should serve the purpose.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
