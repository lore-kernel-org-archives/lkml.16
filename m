Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE622343B6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 07:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743580781; cv=none; b=krjSo/J76/ttvhIq+Ao4LNJwSdcefY1nQOTzACcaVgJw4eq5+0LtNSTlP3yKe+Q5J8Dlkmi1bZbM4FBPjMOmBPyRx7uuCOx8VpgQU/YCkqhSmkE/rtFaPuovNyrFcLOnG0KFHjc0oY1YasfqszxYkbIV6mMVdX3a3R54BEjhWTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743580781; c=relaxed/simple;
	bh=EeAEFKVFkeTVTY4MKWIbOh97BEkD1xjvPChnfwRJj+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a+DWGBc73V1/xcIPZMCtRw3W1KaXSswAO2FATERYuUmaPyLeKr7MOyR7f8xMvSXl04az/9FkRjgkkO+P2/2UOQ04szuMCQIVqmRII/QlkyPx+Su1idx87SiV+uQ2iu0boFofgHh5AmuJJXLiLe2s17O4bhbNd1r9yXQ0CjMUqhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w3j0bVQs; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w3j0bVQs"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2243803b776so60421075ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 00:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743580778; x=1744185578; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xNQJSqgVcQ2iPgaLBe7WIY8ZsQ9nSS3RuMEpdf6p8IE=;
        b=w3j0bVQsYy9sP1A2LphVvUn2DgSUdu9jKVsnm3wWqzIKK5ME1itWQiJD5Ek2lfUmms
         d/NoujgDcwQfy8fmG/45ToR3BEc8KUUZDl9M/m7MJqkgzK2NDflgCXCx9NWwzD3BYLA3
         vqfFgka6mxB2PIFPEGeF0WSnSVnvcnNaILx0lAKUCYwv+z2e58pSbkjJi71ir7IsJoM3
         Jbtzquh7POdTaHvF6PxjGULwLr8PzmlpIvdgr1f5AYQc/dkSbY0qcmjuY5G/+shtcRhU
         86ek7Scl8T3fm5nnJYdoFG0PJdh9P/HNFHAI5TnwexL1shougnC3t8zM2BPE4tZ28ZOF
         WVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743580778; x=1744185578;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xNQJSqgVcQ2iPgaLBe7WIY8ZsQ9nSS3RuMEpdf6p8IE=;
        b=F6b6XZkwVozmslee27al35aEnaUltK+7080Hp0qeKxyT8o91l93cQoVhOjmTamUEc6
         i1DXS5IQgL7B+R/sOnDTT+S9DDxyi9phzyX8z1ffJCz9GIX2KTZoyvNW3etVMElIzWbw
         d5PuJ28ZrOszFK81L2t5fuQ1XsdGMxfJ6OjQNCgyCs63PupQOs6SOU2xuDAdFkeclJWb
         jTPDtNO2280+85aktDVh5S3T6Dxk8O28Ig8xmutnCg+/ID7oaQPu/iXHEjp68AHTb0KO
         XC3RdHf4vsaSjL1BJgEwzktQZ0gASm4LkQZ8wHBXfd20HFO+ol7oBrKCvb/2GLoAfJP4
         ndIA==
X-Forwarded-Encrypted: i=1; AJvYcCWOyukolLPfSMTDt3aFkFrTf0MLAj4nOCkNtK35aZMhQg0w8IBwyYmWFPnY9sQZptxV3OLaFqM3RFSoDEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJcwd5MI0zDQmdsdx7pysdcm+Rpfr2nrjzDf9snVeVDreZYOwF
	VpzU8ZqF5Gy1RQk3JwhiVb6N+JxH0Z1K+MYk0oVpPehvRQATkPAYvhP+HzJBGA==
X-Gm-Gg: ASbGncsLYNf+fnU0g4m/BOXYDKWRJhqFPQoafsuA7vLkYYC0dmffMq/wmC08t+WYgTU
	CMsYvLdnT/xQ7R7lrTcWV62Rsaqif6bkCuOmhApASGdRTU20k3uqY0KaxAk2RGlPGGdJCfH5V48
	thfGzlQW3J34dEhm55XRoKQXG8FGEJ+CMh7zuc6HLCokL7eGB6nKP7GEw3V+w2W7c65G48XeRp7
	2J00JYIwjJsQtvdrZo2Rbh6LxdBo9CMmjDRmrPo9avlmD9lDY396KBzA2zsrxqcYiV7YpRKgeBu
	Vv0BOiHGDIqzMjOlCyOOyYbVckt9k1LXOf4PgY+poxeftIb/p15fSf+F
X-Google-Smtp-Source: AGHT+IHHtIKZamquGvlYQKBeDMhKCjad+kAxu1cMMSeS4Ryti5qYcRLU0/Yjc8yzunZ5hH6601Gojw==
X-Received: by 2002:a17:903:94e:b0:223:6455:8752 with SMTP id d9443c01a7336-2296c8785acmr22734265ad.43.1743580777749;
        Wed, 02 Apr 2025 00:59:37 -0700 (PDT)
Received: from thinkpad ([120.56.205.103])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1dedb5sm102207125ad.176.2025.04.02.00.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:59:37 -0700 (PDT)
Date: Wed, 2 Apr 2025 13:29:31 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, quic_mrana@quicinc.com, quic_vbadigan@quicinc.com
Subject: Re: [PATCH v9 5/5] PCI: dwc: Add support for configuring lane
 equalization presets
Message-ID: <sj2tjrj2lqeuoaqtbsjgdryiclcykexxuorxfuaxpdhqy42hmb@aajog6mmkayh>
References: <20250328-preset_v6-v9-0-22cfa0490518@oss.qualcomm.com>
 <20250328-preset_v6-v9-5-22cfa0490518@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328-preset_v6-v9-5-22cfa0490518@oss.qualcomm.com>

On Fri, Mar 28, 2025 at 03:58:33PM +0530, Krishna Chaitanya Chundru wrote:
> PCIe equalization presets are predefined settings used to optimize
> signal integrity by compensating for signal loss and distortion in
> high-speed data transmission.
> 
> Based upon the number of lanes and the data rate supported, write
> the preset data read from the device tree in to the lane equalization
> control registers.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c | 76 +++++++++++++++++++++++
>  drivers/pci/controller/dwc/pcie-designware.h      |  3 +
>  2 files changed, 79 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index dd56cc02f4ef..153f9ce93ccd 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -507,6 +507,10 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  	if (pci->num_lanes < 1)
>  		pci->num_lanes = dw_pcie_link_get_max_link_width(pci);
>  
> +	ret = of_pci_get_equalization_presets(dev, &pp->presets, pci->num_lanes);
> +	if (ret)
> +		goto err_free_msi;
> +
>  	/*
>  	 * Allocate the resource for MSG TLP before programming the iATU
>  	 * outbound window in dw_pcie_setup_rc(). Since the allocation depends
> @@ -808,6 +812,77 @@ static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)
>  	return 0;
>  }
>  
> +static void dw_pcie_program_presets(struct dw_pcie_rp *pp, enum pci_bus_speed speed)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	u8 lane_eq_offset, lane_reg_size, cap_id;
> +	u8 *presets;
> +	u32 cap;
> +	int i;
> +
> +	if (speed == PCIE_SPEED_8_0GT) {
> +		presets = (u8 *)pp->presets.eq_presets_8gts;
> +		lane_eq_offset =  PCI_SECPCI_LE_CTRL;
> +		cap_id = PCI_EXT_CAP_ID_SECPCI;
> +		/* For data rate of 8 GT/S each lane equalization control is 16bits wide*/
> +		lane_reg_size = 0x2;
> +	} else if (speed == PCIE_SPEED_16_0GT) {
> +		presets = pp->presets.eq_presets_Ngts[EQ_PRESET_TYPE_16GTS - 1];
> +		lane_eq_offset = PCI_PL_16GT_LE_CTRL;
> +		cap_id = PCI_EXT_CAP_ID_PL_16GT;
> +		lane_reg_size = 0x1;
> +	} else if (speed == PCIE_SPEED_32_0GT) {
> +		presets =  pp->presets.eq_presets_Ngts[EQ_PRESET_TYPE_32GTS - 1];
> +		lane_eq_offset = PCI_PL_32GT_LE_CTRL;
> +		cap_id = PCI_EXT_CAP_ID_PL_32GT;
> +		lane_reg_size = 0x1;
> +	} else if (speed == PCIE_SPEED_64_0GT) {
> +		presets =  pp->presets.eq_presets_Ngts[EQ_PRESET_TYPE_64GTS - 1];
> +		lane_eq_offset = PCI_PL_64GT_LE_CTRL;
> +		cap_id = PCI_EXT_CAP_ID_PL_64GT;
> +		lane_reg_size = 0x1;
> +	} else {
> +		return;
> +	}
> +
> +	if (presets[0] == PCI_EQ_RESV)
> +		return;
> +
> +	cap = dw_pcie_find_ext_capability(pci, cap_id);
> +	if (!cap)
> +		return;
> +
> +	/*
> +	 * Write preset values to the registers byte-by-byte for the given
> +	 * number of lanes and register size.
> +	 */
> +	for (i = 0; i < pci->num_lanes * lane_reg_size; i++)
> +		dw_pcie_writeb_dbi(pci, cap + lane_eq_offset + i, presets[i]);
> +}
> +
> +static void dw_pcie_config_presets(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	enum pci_bus_speed speed = pcie_link_speed[pci->max_link_speed];
> +
> +	/*
> +	 * Lane equalization needs to be perfomed for all data rates
> +	 * the controller supports and for all supported lanes.
> +	 */
> +
> +	if (speed >= PCIE_SPEED_8_0GT)
> +		dw_pcie_program_presets(pp, PCIE_SPEED_8_0GT);
> +
> +	if (speed >= PCIE_SPEED_16_0GT)
> +		dw_pcie_program_presets(pp, PCIE_SPEED_16_0GT);
> +
> +	if (speed >= PCIE_SPEED_32_0GT)
> +		dw_pcie_program_presets(pp, PCIE_SPEED_32_0GT);
> +
> +	if (speed >= PCIE_SPEED_64_0GT)
> +		dw_pcie_program_presets(pp, PCIE_SPEED_64_0GT);
> +}
> +
>  int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> @@ -861,6 +936,7 @@ int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
>  		PCI_COMMAND_MASTER | PCI_COMMAND_SERR;
>  	dw_pcie_writel_dbi(pci, PCI_COMMAND, val);
>  
> +	dw_pcie_config_presets(pp);
>  	/*
>  	 * If the platform provides its own child bus config accesses, it means
>  	 * the platform uses its own address translation component rather than
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 61d1fb6b437b..30ae8d3f4282 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -25,6 +25,8 @@
>  #include <linux/pci-epc.h>
>  #include <linux/pci-epf.h>
>  
> +#include "../../pci.h"
> +
>  /* DWC PCIe IP-core versions (native support since v4.70a) */
>  #define DW_PCIE_VER_365A		0x3336352a
>  #define DW_PCIE_VER_460A		0x3436302a
> @@ -381,6 +383,7 @@ struct dw_pcie_rp {
>  	int			msg_atu_index;
>  	struct resource		*msg_res;
>  	bool			use_linkup_irq;
> +	struct pci_eq_presets	presets;
>  };
>  
>  struct dw_pcie_ep_ops {
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
