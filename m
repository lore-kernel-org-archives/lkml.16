Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663C41898FB
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 06:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743144342; cv=none; b=DAzJ3fD3AY8o9tkF+M1+fM1VaVovVIlZGILAjmWuXIotTTNzDQLW3wbxjf8QuQNjqtsp/5sto1TBt02OFB8ApVNQJLm78FVLkfoCiI8iBSwQzho6QvrFT1uPUyyjeH4DCOdg9gxLWTPnia7XyZQRQC+DQH67RehHBtRUUV9uQXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743144342; c=relaxed/simple;
	bh=KEXuAvGR6b6lzqgZK23RTCDLLbmKotBYs3tIqP6xaZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h4/Wcut18NWqxvnToArC+xU5XOKjndfA1P5AFwi9pxA7jhtUc4jyCzn/T0+DEQg9b5CzIz26GRm2TFH40V+Fyb/qmoARX+n1VmEjYNnUJS7aZMcJD+0f4iq5xr3uat0thFbiYZYOmwe57PQiK1kr7fd6/Jps3GaTll7hwTYr6H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ryzwUU6h; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ryzwUU6h"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ff85fec403so5856691a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 23:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743144340; x=1743749140; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=54fd9XomxozUMYP9lqWRd9DunYOsr0ScKSvXhsi/qYU=;
        b=ryzwUU6h6kixfEUwjDJOJQZPOL94arjfic9Y1ylhawdfxv3Z3uhm6Gxr9jmPSNQRWa
         xxqsaoNA/9Ys2TWPnj50mbrCmFxBiIGZKg3UkUZNJFL6/+aayQja7cOyqjRdwlOYidP+
         LIT6pMtKAaL9bCmuVQLkrcNZVaMmnO06AALBJMGJ2LDtxCTWRA87JstIljFDz53Lrr9n
         e3E7ADTLJWti9SG2ZWCxCk/lBtt4N++96bTH9Jwlnpdm8EVHWe3wAMByCNR6yqmgvVlT
         7BCf+ESpzUTziyC5oFnwQErRxWyD+HxLC72I79n3bDZDuLJcdGB3SOKJWw1wLY/j2mk9
         GXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743144340; x=1743749140;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=54fd9XomxozUMYP9lqWRd9DunYOsr0ScKSvXhsi/qYU=;
        b=V2S5FNOQPOs+Qauv0h/blyW+8kHHvSSIAzt103DgoXYWkCQScYY4x2LTzxLr4iKGCw
         RayAXeAfsl401Ya4H/jQFy1HIB40XoQEAjkkx+lQHSZMcFLvpJkgS6GtYnGAwnMeOT2m
         zTSh9NnWsDGh6mxIFmWv2SujyWPKr2zvQawWwj0pPh41a3aDF/70uz82FBBZGLBcjlv/
         qEMPY6HIoO81NyDwHWxDvfDI09EfoiODlciwqQW+vjPp5RCrDOUhoClIhCps5OEdAyVW
         MWP9Ze2SLNDKfBEAGodekcClMxarT/YQyJ1fGh08F/Qqqr+r/4GAHBCFHOqAIXpMvVBl
         ccBA==
X-Forwarded-Encrypted: i=1; AJvYcCUeHFrJyOut+1oae1ZQ7WTlxqZGHPCw3hmpk05k1mmZ8fsI+M3WuedeHyk3ZoUgArX6yktTEzEcl9vsWfw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEAD7xokaT46GRgKF4G8geDTTvJySPjmC9bwLYgUGv1tBRIkum
	XvwX37iPxnMwprUmABXCl9/xDdVfzk52d8NOauT4qwUB5bU4eHlBPRmvDUO0eQ==
X-Gm-Gg: ASbGncsCI0feOjX4Yx8bOzyGnPZerQ1aoRB5vHZWvD/PgFFFTmjDhPRTwsgX7rPF3mZ
	WMmHfb8HcMVjrC9jwjU7Z5PjpEni2ZikDrl6YHt+hhzUADKWudWepb0SlkEiestsEy8FneoeBe1
	1H2gAjHKsx5s7YL1tLUgYnj70DSxvSmwZXDSJHAR08bBx8vNs2PvQD66ldDoc5VxcG7Vr/7PdQU
	jvZqDMz3/h+5KVJdf0zipwl4PbKxwkye9gk8iGuE+iiswP9EF7MUTUQVWqUzA5nWsDpsme+0ACk
	LJGQvEMYGa7umSUtdJ32PYvYIT/W3JwKgbLfQCNsmw3GgG6a1wULSIk=
X-Google-Smtp-Source: AGHT+IGZKZtzFxis5h3cdv3dYAB2lOQJgZwWnL8kh3A0nuBZD/Tk7Y3yM9h5+Q1a4MPXEp6ddYwgKw==
X-Received: by 2002:a05:6a21:3294:b0:1f3:34a4:bf01 with SMTP id adf61e73a8af0-1feb5d04fa0mr2201903637.17.1743144340440;
        Thu, 27 Mar 2025 23:45:40 -0700 (PDT)
Received: from thinkpad ([120.60.68.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93b69f577sm931818a12.19.2025.03.27.23.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 23:45:40 -0700 (PDT)
Date: Fri, 28 Mar 2025 12:15:34 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, quic_mrana@quicinc.com, quic_vbadigan@quicinc.com
Subject: Re: [PATCH v8 4/4] PCI: dwc: Add support for configuring lane
 equalization presets
Message-ID: <mslh75np4tytzzk3dvwj5a3ulqmwn73zkj5cq4qmld5adkkldj@ad3bt3drffbn>
References: <20250316-preset_v6-v8-0-0703a78cb355@oss.qualcomm.com>
 <20250316-preset_v6-v8-4-0703a78cb355@oss.qualcomm.com>
 <3sbflmznjfqpcja52v6bso74vhouv7ncuikrba5zlb74tqqb5u@ovndmib3kgqf>
 <92c4854d-033e-c7b5-ca92-cf44a1a8c0cc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <92c4854d-033e-c7b5-ca92-cf44a1a8c0cc@oss.qualcomm.com>

On Fri, Mar 28, 2025 at 11:04:11AM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 3/28/2025 10:23 AM, Manivannan Sadhasivam wrote:
> > On Sun, Mar 16, 2025 at 09:39:04AM +0530, Krishna Chaitanya Chundru wrote:
> > > PCIe equalization presets are predefined settings used to optimize
> > > signal integrity by compensating for signal loss and distortion in
> > > high-speed data transmission.
> > > 
> > > Based upon the number of lanes and the data rate supported, write
> > > the preset data read from the device tree in to the lane equalization
> > > control registers.
> > > 
> > > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > > ---
> > >   drivers/pci/controller/dwc/pcie-designware-host.c | 60 +++++++++++++++++++++++
> > >   drivers/pci/controller/dwc/pcie-designware.h      |  3 ++
> > >   include/uapi/linux/pci_regs.h                     |  3 ++
> > >   3 files changed, 66 insertions(+)
> > > 
> > > diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> > > index dd56cc02f4ef..7c6e6a74383b 100644
> > > --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> > > +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> > > @@ -507,6 +507,10 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
> > >   	if (pci->num_lanes < 1)
> > >   		pci->num_lanes = dw_pcie_link_get_max_link_width(pci);
> > > +	ret = of_pci_get_equalization_presets(dev, &pp->presets, pci->num_lanes);
> > > +	if (ret)
> > > +		goto err_free_msi;
> > > +
> > >   	/*
> > >   	 * Allocate the resource for MSG TLP before programming the iATU
> > >   	 * outbound window in dw_pcie_setup_rc(). Since the allocation depends
> > > @@ -808,6 +812,61 @@ static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)
> > >   	return 0;
> > >   }
> > > +static void dw_pcie_program_presets(struct dw_pcie_rp *pp, enum pci_bus_speed speed)
> > > +{
> > > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > > +	u8 lane_eq_offset, lane_reg_size, cap_id;
> > > +	u8 *presets;
> > > +	u32 cap;
> > > +	int i;
> > > +
> > > +	if (speed == PCIE_SPEED_8_0GT) {
> > > +		presets = (u8 *)pp->presets.eq_presets_8gts;
> > > +		lane_eq_offset =  PCI_SECPCI_LE_CTRL;
> > > +		cap_id = PCI_EXT_CAP_ID_SECPCI;
> > > +		/* For data rate of 8 GT/S each lane equalization control is 16bits wide*/
> > > +		lane_reg_size = 0x2;
> > > +	} else if (speed == PCIE_SPEED_16_0GT) {
> > > +		presets = pp->presets.eq_presets_Ngts[EQ_PRESET_TYPE_16GTS - 1];
> > > +		lane_eq_offset = PCI_PL_16GT_LE_CTRL;
> > > +		cap_id = PCI_EXT_CAP_ID_PL_16GT;
> > > +		lane_reg_size = 0x1;
> > > +	} else {
> > 
> > Can you add conditions for other data rates also? Like 32, 64 GT/s. If
> > controller supports them and if the presets property is defined in DT, then you
> > should apply the preset values.
> > 
> > If the presets property is not present in DT, then below 'PCI_EQ_RESV' will
> > safely return.
> > 
> I am fine to add it, but there is no GEN5 or GEN6 controller support
> added in dwc, isn't it best to add when that support is added and
> tested.
> 

What is the guarantee that this part of the code will be updated once the
capable controllers start showing up? I don't think there will be any issue in
writing to these registers.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
