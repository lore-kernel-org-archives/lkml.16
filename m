Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2F21CAB3
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743094631; cv=none; b=tiLpH67ChN1ZWWaw1j9rA8NJ8fnQK5afrxdwCRc6pawOTfUecO2E+uzrn4gdvVJi2DqMYJbu5YuwhKI1b3p4L6YMGhTkeellT+NnaqTmyMQVurjn0+jpsE/BQ1/rdeXb3H7FMWGpPzRapFJouo6Lv6hYW3l+YKQRtCN44FguJ0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743094631; c=relaxed/simple;
	bh=qj8jPAUQG15kiy/2pnBbudNpRkOrU+khB9NIZvl+qoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lQiqXFOU54aynOQ7ZfMFgLYf4953+8YwkkGHVJuA4PfMB96drT7eHoEdfSxPaqR625QCFiKFWZ/H5GB72tcerCW2cPAOB/ylemF4zGeKNkcoWnd19B1N2GqB/NGE9Lmm338FzSxp2eQQgKC+dNZxP5imy04d+5JICIz17n9HshA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tl2kjLTy; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tl2kjLTy"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-225df540edcso48236995ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743094628; x=1743699428; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qxgqM8SruWplrfrQ7ieYBgizc+YY6It5QEvSwAgx9mQ=;
        b=Tl2kjLTyfrEyJMeC7YZTnVaP2dg2mJ3hE09FemMot0wnchu0kSZ8APlDCGEKfuLjEq
         6/+UvvYYIl3KJV6MTCT5uARqxs5c10IWlgrNL8ygiOGyntqMGw7SEBg7VbMnGT2L7irc
         0PoLGT1//Ryordx2FHkdCf3Dm3py03ai05jyDTkaX1H1Bp22f3NcWkUafBIVgl64ks5f
         ecfWdL4Qrqkub1WxvIPod3fldv/kDlLyujOqhVdRFEKxMLxh/fdg6ABoaEpgvUpvDwdP
         beGI82GFEeShNfiqrcQHvy78swyluiMzI3MCfhyRfAh2ALntoYsjWR6KT4VWFG9dYcrM
         9tzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743094628; x=1743699428;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qxgqM8SruWplrfrQ7ieYBgizc+YY6It5QEvSwAgx9mQ=;
        b=O6gAEkfl6zzvg3etG5glyaPQpF+Fto2CM9d9zwd5LsLGj/SQXuP/fBAeLbqO2ulTKw
         VDkZDua9rm7go1OCy8MTeyBvRlOUMRFbScTt2xmQPbZNQ2l9hHSY0NdFylbXse5yCCgq
         j0u+/SwZU0Xm8LhSANCY1UiQVfxn9lTRx4Pn+/fiDMCLDsGb7GjzjEZpHElc/ecF0Kt4
         gz80epmEEIAzgY8MshoeVXGDiVckp4mut4i8lsZnRbEqEy9dk6gCzMS4Auc+uu5WYFY/
         gV/kRsedaaXHtwgEZw7I/DgLyn3svUhaht5sBfMOfJRsUMousCI34FIejjtj8QYlD8cQ
         HOEg==
X-Forwarded-Encrypted: i=1; AJvYcCUdT+YQjnwIfS2Leb6gwP5UVrxehKhjhXP+734UC9hMv2I9UUFtJ7UGnkgtK+mm3Q26Gt+XP5xaark5oGo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjZvhGSHL+B4k1DgwhItHarg57khxWXXEv5Cyp5K/LYWNwTqY7
	LbQSlx46tmy90duofafSAiHGKqHz8ENYkqmlBZWkCrO+OVVvJCINWhj+fkbjhkfMIKbT1h0wSoQ
	=
X-Gm-Gg: ASbGncuY3ZYS8byzuXrCRXXx1vBShDC997UZJWk8ih7xi2WOWUE26pAeiDNOSoTJWea
	7bzdJEkw/6dgEuqgM77liPkqJIaFp6i80j5iTmWDjtHjnDQw7OhOI5YqZoWpIsLb3kVkmgvhFfc
	PBr9bQCNnmpoAbB9JmLUWb9DCIlrt9FKJknhx1+Hl3iAF1vu4/jGX4ZqO890Vi1py2sHG3IUd70
	EnOtITNQlANjndtH9DOVTiCDgQ0/ynuQUkmpn0Jx5EyD2/TA1GLewJjuxODvt4g+s93y0eNA8TS
	mFu3tkyF3ToRC+PZjUgluF+ZchVwxtVU1UUTu+FsPokSPk/ETechU/o=
X-Google-Smtp-Source: AGHT+IFa8BISCQR44KkE/pAAyn25h9KnAx0099iiC8NJuHQ8ReFXl65yHnBsP9aSbAHzgngKtkgWQw==
X-Received: by 2002:a05:6a21:9986:b0:1f3:26ae:7792 with SMTP id adf61e73a8af0-1feb1b18caemr902546637.18.1743094628393;
        Thu, 27 Mar 2025 09:57:08 -0700 (PDT)
Received: from thinkpad ([120.60.71.118])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93ba1b22bsm101854a12.77.2025.03.27.09.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 09:57:07 -0700 (PDT)
Date: Thu, 27 Mar 2025 22:27:03 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org, 
	bhelgaas@google.com, jingoohan1@gmail.com, thomas.richard@bootlin.com, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [v6 1/5] PCI: Introduce generic capability search functions
Message-ID: <xvu4vmk5gxhf5gkftgiycm5ler3vawesgw6zirw5bhba2kqxzt@sytribs5ir6u>
References: <20250323164852.430546-1-18255117159@163.com>
 <20250323164852.430546-2-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250323164852.430546-2-18255117159@163.com>

On Mon, Mar 24, 2025 at 12:48:48AM +0800, Hans Zhang wrote:
> Existing controller drivers (e.g., DWC, custom out-of-tree drivers)
> duplicate logic for scanning PCI capability lists. This creates
> maintenance burdens and risks inconsistencies.
> 
> To resolve this:
> 
> Add pci_host_bridge_find_*capability() in pci-host-helpers.c, accepting
> controller-specific read functions and device data as parameters.
> 
> This approach:
> - Centralizes critical PCI capability scanning logic
> - Allows flexible adaptation to varied hardware access methods
> - Reduces future maintenance overhead
> - Aligns with kernel code reuse best practices
> 
> Signed-off-by: Hans Zhang <18255117159@163.com>
> ---
> Changes since v5:
> https://lore.kernel.org/linux-pci/20250321163803.391056-2-18255117159@163.com
> 
> - If you put the helpers in drivers/pci/pci.c, they unnecessarily enlarge
>   the kernel's .text section even if it's known already at compile time
>   that they're never going to be used (e.g. on x86).
> 
> - Move the API for find capabilitys to a new file called
>   pci-host-helpers.c.
> 
> Changes since v4:
> https://lore.kernel.org/linux-pci/20250321101710.371480-2-18255117159@163.com
> 
> - Resolved [v4 1/4] compilation warning.
> - The patch commit message were modified.
> ---
>  drivers/pci/controller/Kconfig            | 17 ++++
>  drivers/pci/controller/Makefile           |  1 +
>  drivers/pci/controller/pci-host-helpers.c | 98 +++++++++++++++++++++++
>  drivers/pci/pci.h                         |  7 ++
>  4 files changed, 123 insertions(+)
>  create mode 100644 drivers/pci/controller/pci-host-helpers.c
> 
> diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
> index 9800b7681054..0020a892a55b 100644
> --- a/drivers/pci/controller/Kconfig
> +++ b/drivers/pci/controller/Kconfig
> @@ -132,6 +132,23 @@ config PCI_HOST_GENERIC
>  	  Say Y here if you want to support a simple generic PCI host
>  	  controller, such as the one emulated by kvmtool.
>  
> +config PCI_HOST_HELPERS
> +	bool
> +	prompt "PCI Host Controller Helper Functions" if EXPERT

User is not required to select this Kconfig option so that his driver can build.
Please make this symbol invisible to user and make it selected by the required
controller drivers only.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
