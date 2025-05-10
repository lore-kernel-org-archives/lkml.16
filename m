Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C1A1494D8
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 05:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746854341; cv=none; b=HVtS/s5ZeI7cMsBct3Gj+4OVovxrKNKhZutuQTgUyvFzud2ApyuUS0qveTkKB8FrC3Ry/HWM1xz+tg8xjdmHmWAwZ4fuEnUfDsAgC6HVFBwaS8eC8JWhmr28K/cVtFNFHHPriViKNebiPu3hsgZvh3b1e38PIBIV8qJwDbSIY6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746854341; c=relaxed/simple;
	bh=76T5UwJajciv+5KU8yAbC7WVnk5b6DjPtTgufl/eT0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QE4iabChtWmF+hqnWxIFK0S2F6hVhzVA8hQRZibdXavn255OWAKdKlxbGoQW4DriNcZU5chJXnfDUXhWJD76/1chcafhM+N56F2i8aZ5Ucf92XR8Fv//kKKtbddToEvFrTILbEWQ6U4cyrRqNCwTL0zB5gJH6e0CNzKXtcS7F7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kwQXlXbp; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kwQXlXbp"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a1f5d2d91eso1162782f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 22:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746854337; x=1747459137; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TPJs0SAm+KWy8iiStDcoiQ0ya+FPtzPKeqCBhvqJ8Tg=;
        b=kwQXlXbp4Fa5uvBGZ8DqDjaqFVQbOtuEp3K5mFo49fSVeDlO2M5GZM93xrno2h2pf8
         QsEIqM/2a07IaAbrJbaHyCHMVNbbWlXjh7SirBokucHgeDs8Ra+16rmIHSAHugEqGIEx
         BgkOllpRPeCsk9MW/twI6PHS1jCygl7rpZ20DSY8GNFo/179qjZN1J9A12LoeCP9QHC4
         Ipv7B0/NBkMC8OWjZ3bTyEUjSejAjSr31pfttaqob/53okxLZgsE2c9ADNF8Q8iO3SWw
         HmQJYEuRds1Dyl1wRRzoP03HU092+4TpaVlyFEVmX9gH9T5/4y0naTPWQbAVnw67T7z9
         7WBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746854337; x=1747459137;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TPJs0SAm+KWy8iiStDcoiQ0ya+FPtzPKeqCBhvqJ8Tg=;
        b=UO63PgO2oFnGqyZUypKYfCy/xmdLABhRcMnmE8SLecOkfT8PmhayjqOp0xb84VXMce
         EogNr3CF12Fz6yf7E/xmPcm5r8e8nraLWkfBFtiAYgxhcNq0UHXF7bFbj7UxvxTrr8Hy
         ts7hxUHSAL9uZT4XtSbjUdYUtyI2B8r2e0eSibxVDJKHf/PsA62PtJMJlbV3bcJgEiwc
         6qBdVvKWE4J14Qned9mj6aD6CpiSDbQM7nvCeZv8apUlwxx6sKnCBgu2gSFgkBQnB11J
         pMKLEjqSW0mp2/a9LOlMRDj/990moFSI26bPbVivYQxFw+CAdp0O60v8TT9FG1IikJGz
         pLFA==
X-Forwarded-Encrypted: i=1; AJvYcCWF+dn0fWWwrtezSSgfyzRAUNm9AHKAvdQCCrsB6XOX3FU6vyuKdUBjq90L6wmxEwzvHLDtPW1UA5qR9Xw=@vger.kernel.org
X-Gm-Message-State: AOJu0YymyOpeaZ2orDJ6fWye6lQEbEB99NOWgyxGJ54O5utWEHxroHds
	A7bt5ZNEO32LmKDFMffpOs1TjfBPSXjg/UOGg82GtyBNXMUKoLWoQbEL2/wegA==
X-Gm-Gg: ASbGnct/D9StBQ7zowZWiNyDlWipxX8pz+GhP3jOMjHzv5HPdJyf2LdSShKPzs8Z/wa
	1C9PCzDjbd31gESt0luLnlxuXQCQDaawcK/tSWFGf/8ZtqO4rfYc3NE2GSdLiVYinW2Z58aCsYZ
	TIU6pYi4dxi2fy3CY1idJCDy4p5D+HnzSL6sW3P+lvShS5M4S5n8/I9MhOOjYFfueA9NUhOBcdB
	65Y3K5Bbc0qAcvPqSCCm75F2oB6UnUlMCQ2hJ+fOnTHoVPBFfBYao9iIRc//EHy0ZpZs4CALyLq
	Ydzv/8c5f+aKriQC+yQ7nOO4k8MH/w7RLgvNjrIfofpxHsgCncjoLCQ1JOuoQZMr2WS6xGHyruJ
	aSIVJPJ1JIp2e8URlPAXBIFpRfKPv5Dmrcw==
X-Google-Smtp-Source: AGHT+IHVJVk7Mhjam6g3QnKtJUb9VCcchPBmtRYjyvpoUa11jXjBzs1+C+Ts6P0d1bBomDaLw9WLKA==
X-Received: by 2002:a5d:5f56:0:b0:39e:dce8:1c07 with SMTP id ffacd0b85a97d-3a1f64a43a5mr5182223f8f.46.1746854337503;
        Fri, 09 May 2025 22:18:57 -0700 (PDT)
Received: from thinkpad (cust-east-par-46-193-69-61.cust.wifirst.net. [46.193.69.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ec0e4sm5239317f8f.40.2025.05.09.22.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 22:18:56 -0700 (PDT)
Date: Sat, 10 May 2025 10:48:56 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com, 
	kw@linux.com, robh@kernel.org, thomas.richard@bootlin.com, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v2] PCI: dwc: ep: Use FIELD_GET()
Message-ID: <yqbq7lgaxwf6lc55e5pe6x7zjnehmmde2imhkvwz5hrsk4ztoa@yrkltzbmxph4>
References: <20250428124230.112648-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250428124230.112648-1-18255117159@163.com>

On Mon, Apr 28, 2025 at 08:42:30PM +0800, Hans Zhang wrote:
> Use FIELD_GET() to remove dependences on the field position, i.e., the
> shift value. No functional change intended.
> 
> Signed-off-by: Hans Zhang <18255117159@163.com>
> Reviewed-by: Niklas Cassel <cassel@kernel.org>

Applied to controller/dwc-ep!

- Mani

> ---
> Changes for v2:
> - The patch commit message were modified.
> ---
>  drivers/pci/controller/dwc/pcie-designware-ep.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index 1a0bf9341542..f3daf46b5e63 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -256,11 +256,11 @@ static unsigned int dw_pcie_ep_get_rebar_offset(struct dw_pcie *pci,
>  		return offset;
>  
>  	reg = dw_pcie_readl_dbi(pci, offset + PCI_REBAR_CTRL);
> -	nbars = (reg & PCI_REBAR_CTRL_NBAR_MASK) >> PCI_REBAR_CTRL_NBAR_SHIFT;
> +	nbars = FIELD_GET(PCI_REBAR_CTRL_NBAR_MASK, reg);
>  
>  	for (i = 0; i < nbars; i++, offset += PCI_REBAR_CTRL) {
>  		reg = dw_pcie_readl_dbi(pci, offset + PCI_REBAR_CTRL);
> -		bar_index = reg & PCI_REBAR_CTRL_BAR_IDX;
> +		bar_index = FIELD_GET(PCI_REBAR_CTRL_BAR_IDX, reg);
>  		if (bar_index == bar)
>  			return offset;
>  	}
> @@ -875,8 +875,7 @@ static void dw_pcie_ep_init_non_sticky_registers(struct dw_pcie *pci)
>  
>  	if (offset) {
>  		reg = dw_pcie_readl_dbi(pci, offset + PCI_REBAR_CTRL);
> -		nbars = (reg & PCI_REBAR_CTRL_NBAR_MASK) >>
> -			PCI_REBAR_CTRL_NBAR_SHIFT;
> +		nbars = FIELD_GET(PCI_REBAR_CTRL_NBAR_MASK, reg);
>  
>  		/*
>  		 * PCIe r6.0, sec 7.8.6.2 require us to support at least one
> @@ -897,7 +896,7 @@ static void dw_pcie_ep_init_non_sticky_registers(struct dw_pcie *pci)
>  			 * is why RESBAR_CAP_REG is written here.
>  			 */
>  			val = dw_pcie_readl_dbi(pci, offset + PCI_REBAR_CTRL);
> -			bar = val & PCI_REBAR_CTRL_BAR_IDX;
> +			bar = FIELD_GET(PCI_REBAR_CTRL_BAR_IDX, val);
>  			if (ep->epf_bar[bar])
>  				pci_epc_bar_size_to_rebar_cap(ep->epf_bar[bar]->size, &val);
>  			else
> 
> base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
