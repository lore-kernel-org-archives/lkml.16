Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C4A1A238E
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 15:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744557178; cv=none; b=dCXY78tn6+QZqDPRw5r9exr9YX7qG8LcLOY+M1QBm0SBBXmchxDD4RqJopfcOIhdInqoDpNOhPcCpKDDO3Wgx4FIiK9rFt2WeczwXHW+7XA44p6J8rug6MGEd7ZT6X0ROqvtVAkvDnIqlgvYTEx7HVbJ384b8ycs/3jxd2ie//U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744557178; c=relaxed/simple;
	bh=phS3D5OOOkm6noFR0FYDt75hv1VoWhQUHvXWkLWoIaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XntmtposueGI0wxmZJx4NOrt12T6r67TlQQQf+/uN4uTZLMiZ9luRsvqT1Gn128hrBaO+Ru9Pz3aYwEXciWLTNONCW9/ZCfOgEkvL4FZMJoopN9EIAeQkNSEPOyY37/JS9mxbWb9s/7HV+EnaTY0/cBbAU3B2moSf3VQuqBx34k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UGVvgTTk; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UGVvgTTk"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b041afe0ee1so2780738a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 08:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744557175; x=1745161975; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vj0Jh4u4n9sOWnZj41OkfdidrvtJgy6o9CdCA00I7q0=;
        b=UGVvgTTkbQNGa4dIjj7oBOjfyPn29NY5aUMhSrH7MVRGn7R2HSwZ3GzwnIcgQZRGdc
         WIv2EhSFzS721UaalquqEGVC4kgHDrbBSt5o5+0FZhC3+0L6S+7YDi2KVVhlnHfi9Ehw
         Kt26KcymYB5JZ/HeBHW1a2XCYIfpFZfWNOOXa4L0EQDghM0w+6YIPyBNOG270ZP1qP/5
         sda2aQT8R6503ICP2fqZ3No8mAqOCph7WNILCPLgKBjAY6CXJbiB6YBHFzCwuBLH4L22
         4Jr4kRYH6oc/bCdYO7/5fRJvPCDzV0aHOM5GRMkDJubpX4/B8omU7sZLUKZYMkPxP0ap
         1vrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744557175; x=1745161975;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vj0Jh4u4n9sOWnZj41OkfdidrvtJgy6o9CdCA00I7q0=;
        b=bUVb4mWmNf5tNkrAlYjxu6yG0It/ud/q/bu/crZMJLZmFbCUQz/j4ufzoKIP/fBGXL
         PmZ1maQZfC2yEkTtWcOFhDKdIGTAmZALZZH/mTw/+QBNe7Gi90Co5zo72SJpSf4G1FzU
         Zv9YTvA4zOhqFPaKOV92zh+h9/aQHP21j3whe9TbA02VWeKe46Ygl3t7+QtlXqV/bd09
         TBhmm3z1a6a9knrU9OZNLysH4HLs1weXOVsHsxErUUWlk61eUC2nokfHfIGkW0IXnWpT
         BFbLU12xbrGe92OR9EHZKqpHkzmZI45TfjUlG443UUfZcXJD/BChvaMHptPXzAKQpC7p
         aY6g==
X-Forwarded-Encrypted: i=1; AJvYcCUHOKNUy7KO1p0l1oyb9OSuFMvbAjbEKfvtKYZbRD9y36mCR56fo6Thr2ChtcDgYCWpcCx0Z+NDcRekFfc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUY0ABamwfIRUyr1IoPBdzUIdiOGozhd5sfhGgJ6TJbu4iAr1J
	1UMCkvrj2kCkZgnaZxd3wGY/05dzSHzba2AQAwRpOcIk4EfbfEKE81u0OoVZAg==
X-Gm-Gg: ASbGncsuXqzxgVyXcTmK+oSDswCrxV1/WGpKRKRjw0ZAUsWkz17BEnFycd8lAAwerJl
	fS75PHuhvSVu10pULWDX2vsqaEAK68CuiuREO9r4hTjnaDzxSd/ygyfDmbdFwzXkF/TlC3EK71+
	9JG6hA5N6M4Q/ma0VBMU0MUzLJ9mIip1ely9RRVPBzqezCk1V7R5K1LV7EBkvI/PDSMPFZWK95M
	MauYiZw2iNYHIscLo5RyyYRAT4R9C8CFJNvjW6wA845f4SWNQvZUtikntb9qsRvMHWatR1bZHBv
	9j/KKre7LaLGBkBd6TZ04Xj3xZFdeSmFox881U8LA8DiHpNoDYHV
X-Google-Smtp-Source: AGHT+IEl1mfp4h8joqe88PR+eqAgq+GkZLNrPfPvCZVzAzUCEhJOKuX/kTRe8Qw9Vvxua7aCf7iBqA==
X-Received: by 2002:a17:902:d484:b0:223:517a:d2a3 with SMTP id d9443c01a7336-22bea4ab6abmr108986985ad.17.1744557174513;
        Sun, 13 Apr 2025 08:12:54 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd18580esm9589319a91.46.2025.04.13.08.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 08:12:53 -0700 (PDT)
Date: Sun, 13 Apr 2025 20:42:46 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/7] PCI: imx6: Skip one dw_pcie_wait_for_link() in
 workaround link training
Message-ID: <2hbtwy3tfzip7dglixhcipaykxxg3ph6hy3bwn5ujmvj75mwvy@6qcqptbakkey>
References: <20250408025930.1863551-1-hongxing.zhu@nxp.com>
 <20250408025930.1863551-3-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250408025930.1863551-3-hongxing.zhu@nxp.com>

On Tue, Apr 08, 2025 at 10:59:25AM +0800, Richard Zhu wrote:
> Remove one reduntant dw_pcie_wait_for_link() in link traning workaround
> because common framework already do that.
> 
> Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index a4c0714c6468..c5871c3d4194 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -881,11 +881,11 @@ static int imx_pcie_start_link(struct dw_pcie *pci)
>  	/* Start LTSSM. */
>  	imx_pcie_ltssm_enable(dev);
>  
> -	ret = dw_pcie_wait_for_link(pci);
> -	if (ret)
> -		goto err_reset_phy;
> -
>  	if (pci->max_link_speed > 1) {
> +		ret = dw_pcie_wait_for_link(pci);
> +		if (ret)
> +			goto err_reset_phy;
> +
>  		/* Allow faster modes after the link is up */
>  		dw_pcie_dbi_ro_wr_en(pci);
>  		tmp = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
> @@ -907,17 +907,10 @@ static int imx_pcie_start_link(struct dw_pcie *pci)
>  			dev_err(dev, "Failed to bring link up!\n");
>  			goto err_reset_phy;
>  		}
> -
> -		/* Make sure link training is finished as well! */
> -		ret = dw_pcie_wait_for_link(pci);
> -		if (ret)
> -			goto err_reset_phy;
>  	} else {
>  		dev_info(dev, "Link: Only Gen1 is enabled\n");
>  	}
>  
> -	tmp = dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKSTA);
> -	dev_info(dev, "Link up, Gen%i\n", tmp & PCI_EXP_LNKSTA_CLS);
>  	return 0;
>  
>  err_reset_phy:
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்
