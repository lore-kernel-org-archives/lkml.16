Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0881D1A3159
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743093466; cv=none; b=PtPYCnfb8hNE+fUtiI4acD5Q4OFCzsWJ/1egBiPdIMYtx1HMdqusg4bhEezeaWLjABsoSsludqhFd/FXE4GuzpRONfk5pyXHVvPf6HZKTGE4dp6BZfXt1c9YGMsB3l6iicK33UCc2bqWOvBS8olmnHWcisL+h+jtpAzRu4fNE0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743093466; c=relaxed/simple;
	bh=IlhSJSRYcLEAAcGfU7Byv7TgRNNf7r4Er08p3Fs31d8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lKqjg0+J5o2tgC4fF5m+7okVtEY6L7DqgGuWyJGII2zNyCP4zrbzcnZ27rsCEQzy4p3j8aNVw2g5tt+HILuWlzxbXOLFKm0rM9TxrzFHFObneWCGCkIiR7oZYWzd+9T3t8i+vvP9uAGqwHLCV6yvmndEKf/DOmQLSNAwWQ67tJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=glVjRJ/Z; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="glVjRJ/Z"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-225477548e1so25704315ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743093464; x=1743698264; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u6i+dua1DWnJP+F+1GqV5SNGBVtQy+N1E/4ibX74lzQ=;
        b=glVjRJ/Z++vTgYe0Zh1elZuBPZ23OshKUvpmyTKe2inpqw+oGKBEuaGJOHiDgM4pBI
         pgtnTELgFs3/VCgjPRfUOyZHa5ORIZx09IIA9hO2kHInsNLF+RgM/bwxjj5ISd4PuM8A
         090eBvQhvGcRRhh8mH1G0Ajpvi3ZJ0+b20tUmtjKPLUsgfmB49PbnAs8rvcoWpuRtt3K
         Jx+Bx/1AYwDd+19k9TzmmivbZA8fyvYzX1G9WFfDn9Z0/PMER1JcB+73OPJVnM/CKGS5
         fmiEVYz76HN4GlxW1VK0oewVIV9P/Fr/Lwv2VA5Aq/aE87YWPvUUbDr7nYr6VKTU9V2+
         UkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743093464; x=1743698264;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u6i+dua1DWnJP+F+1GqV5SNGBVtQy+N1E/4ibX74lzQ=;
        b=aKSYX0Le5zTtNjjlhFTgPaGl4e/0sdb55+BScKPspenMdI9QfRLdosidBTNRg3HxPV
         q/PPAA31YIdiqgiUttD3O5owJXNo0c8JevKLv1tvtYcokzT0QXKGkh2nN8BDmHHTRB4V
         59t4WfLbxmyO+16RaVbF43dZnbSlDsX/dTlbKsICUwlqKiXWolIdc4fxr+timajP/87E
         enCRaxBLMZ0rBbUvlU3hVWJVMDJdtMOKCNd98rTF25zmpYxLmSLrhmYAPn1a+jH1WbF9
         52o/HCx4doitIYTFqCyK4aATJAqQTQmhznF94s77bh3TTPwU0NnZMv1fhTReF813/5YT
         8aqg==
X-Forwarded-Encrypted: i=1; AJvYcCUoy4ijLHwQnvizihryAZFXur6aBD+yFs0wPLRt6Cvjrdjq86Ine3JgoJyiAMd2o5LfT0p2ytnFOnGEf/E=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywik2Xl1LXcqPG4H0d3XguUSd8gnbbEOXIswEY4Io7rZ9IYWpYa
	+znFxxyjFJNpNnfKCrFUFFpI/v6zLAdKKhbVxKWTwSVf5Y6/YwIPWHCoSICTJg==
X-Gm-Gg: ASbGncsPppGFQPhEurf0hn00vjJ1OR7DLrC8Kr/OKXncWohVpsHd2dFmnGkCNRTYpCW
	mDLp6AmPh7X40Mw+6wQb6ZM6MUaRSyw1i3o6i158Ff2PWJuKRJ1WFJWdUrUHIpXOyjHF9FOM586
	mpY1AAuCcg9TGz3IjamlFx5i1WmClXe/MEObK6louuNHg4je6nFNRlf0E/hO3OlcNiIzoWaPcp6
	/BT9y03Qh/MWj0xv0CMt17nl44d6yBNPpr2egPANYeyJemxy8DgwGCjKZvTr0CGrokzY4w+Bo5r
	o39p4Gnh40XmeB0pvcmNHEYJB0o0sEJ+vZ3ihVNdoaA4rLzJliabnD8=
X-Google-Smtp-Source: AGHT+IEeybUXkRlX6IExbahc3GrdkHExpvIKd+wfMV/CdPHX2glQu/itP/sXUsc5pkDfYlioP9hSOw==
X-Received: by 2002:a17:902:f649:b0:223:33cb:335f with SMTP id d9443c01a7336-2280482a71emr59657665ad.3.1743093464103;
        Thu, 27 Mar 2025 09:37:44 -0700 (PDT)
Received: from thinkpad ([120.60.71.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cf6dcsm1592085ad.113.2025.03.27.09.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 09:37:43 -0700 (PDT)
Date: Thu, 27 Mar 2025 22:07:40 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bo Sun <Bo.Sun.CN@windriver.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Vidya Sagar <vidyas@nvidia.com>, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kevin Hao <kexin.hao@windriver.com>
Subject: Re: [PATCH v3 2/2] PCI: of_property: Omit 'bus-range' property if no
 secondary bus
Message-ID: <st52vx7pu64o64f76demebvp54sz3ai4nhhvmhfep3ivex63jf@te234j44leiy>
References: <20250324090108.965229-1-Bo.Sun.CN@windriver.com>
 <20250324090108.965229-3-Bo.Sun.CN@windriver.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250324090108.965229-3-Bo.Sun.CN@windriver.com>

On Mon, Mar 24, 2025 at 05:01:08PM +0800, Bo Sun wrote:
> The previous implementation of of_pci_add_properties() and
> of_pci_prop_bus_range() assumed that a valid secondary bus is always
> present, which can be problematic in cases where no bus numbers are
> assigned for a secondary bus. This patch introduces a check for a valid
> secondary bus and omits the 'bus-range' property if it is not available,
> preventing dereferencing the NULL pointer.
> 
> Cc: stable@vger.kernel.org
> Fixes: 407d1a51921e ("PCI: Create device tree node for bridge")
> Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
> Signed-off-by: Bo Sun <Bo.Sun.CN@windriver.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> v3: Add 'Fixes' tag as requested by Mani. 
> 
>  drivers/pci/of_property.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
> index 58fbafac7c6a..792b0163af45 100644
> --- a/drivers/pci/of_property.c
> +++ b/drivers/pci/of_property.c
> @@ -91,6 +91,9 @@ static int of_pci_prop_bus_range(struct pci_dev *pdev,
>  				 struct of_changeset *ocs,
>  				 struct device_node *np)
>  {
> +	if (!pdev->subordinate)
> +		return -EINVAL;
> +
>  	u32 bus_range[] = { pdev->subordinate->busn_res.start,
>  			    pdev->subordinate->busn_res.end };
>  
> -- 
> 2.49.0
> 

-- 
மணிவண்ணன் சதாசிவம்
