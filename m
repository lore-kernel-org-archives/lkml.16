Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEF31E1E00
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 11:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743162810; cv=none; b=Lod+ZVf+5aEtC+iNUle3SRJFbUiPOwSi7O8gTb7ekK5sFZAOdPIzeXjw7HeIKGxP0ivic4yN5tYLyZ6qjN1gJlgQZ/2mXji7SO5aiugzyQoJNU/ywd5e0uvRSb6TsgqYwWVYEat5HppmAeDTeMle4ia0zcsJRDckXiDaCi2HVCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743162810; c=relaxed/simple;
	bh=+KPaBcdDplqSZzH8Dmz/9Pd2L3Q7Ai/3Z0gwOh8ET40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jD6zqmGXWwxX0ii0yZXzW1kTSvOBLiKARe1xasREIMXB3IZ28ZfiTaLbNCzXWkcZn7gIusXD9zrV9vUG916EThB6ZbPoRGHsiOedeJxW8qN2lfsdy9GjST7N2F1i3x4HSaEXUWmm50BKt3p/OOXltCTCT+EtcWHp2kZ8iBnWpr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rjlh0NLO; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rjlh0NLO"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2239c066347so47662715ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 04:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743162807; x=1743767607; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RbPiP4EbP7eCOnwuLfA9DRinWmfOSHZ00Gjy8hH6OQ4=;
        b=Rjlh0NLOOrGeZMrG3khcHJskRpcvuN4Fw40qwRoKU07MFXm9WFRLxs05Ig3P3RKGn/
         0oOJt4OojtZw54WpA2NIyzxlkNftzPRLfyj6GpPmR07C82TJr4oO+7A6CX8Z8oeXAKEJ
         CFqlkIw63JEO7oOWs24NgVCProYFzRh9hNcGkdn12uubzerz8DANF8Urv541AXxPWLFr
         +qgcXuuaa7kMrHKPGtgWuabXbzscos6GduZnIUT/g2JNZP3EaeTaapXCSA3w6dqdp0j7
         M1Rjux+68KbLODoVBovF7WSRQ7WUmw22cZJCjNkomwOqzJQnHGuaH0QLXs3QFgpvrdZK
         72Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743162807; x=1743767607;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RbPiP4EbP7eCOnwuLfA9DRinWmfOSHZ00Gjy8hH6OQ4=;
        b=FJpBeB+ciThOa4XpPQxacBANxJ6euCbdTsHw3JrGlk//+gjfvAGXsLrqoRpThSgpNY
         XuYf3gX9wIa77SY+5p9ayzJgsDQ5Uy+1tCO4xFBwFcUVTYXOfYpKucULK9Cgp6Zrv6Wo
         HQCNLONkS3ORGzgTX+e5X//kbGZwmBs7jN+Hmw8BQcJi/Oe6tlTN3QPd4C6UuZLjU0p3
         6xfPWq/d5qI5IuHJAXAsXUfY7XzBtq1kb+g50p9WhaS286v3KU/RdAlATxTjHNp+/hQH
         pHsRCJqw4Qww0lIc8ogqQrI4wmwH4erIlbsUqEpKR3ZBgxqh0yu9JAvVST5BtIASCNZ8
         Resg==
X-Forwarded-Encrypted: i=1; AJvYcCUCCFvJjdJOLHXnW5CE3RxSYhU07/S7KYskLWWPw5CbIid1P82nmp5LKJ4YqgV7gjb9HhlKFQgZT+HXQzA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzU5KlyKtofMOxhb50NraIF2VrwZgkxwJ7ZOlzOFq1n0poxb7h/
	7F36P3zyziq1TwaiJvssRd7KfSX6bEHHnDN+N3zzf3q9Bl5DBnrcvKkoC9jhSA==
X-Gm-Gg: ASbGncvwFsgIM0inPehreMUInzXWqBru3Lk/VZP/VkJXeK++Gkq4eFNt3LftaEYsBV0
	h8E+MGs97ghu3MXCRK5n9y2vRDDrtP9eDxNqsdokrDo+dnUNr37uShU0qLNxEyAs6XmpzX4JHR3
	ZLkkSTO0Vz5R/PWQSqqSfahInu1/0GBZmk7oPcEEBYz0E5lQ/QfGCiRO9GlhZN+O2nrZmK204Ih
	joEiIF8RqOD9twYM7uqKXDPCMN4DHquLo1CfKCM/n82fdcpO1ZdRr/kKfm0lApKWd7SEKBvaezX
	5OE5cy/WzuSVuu9V8jWOI/12JjezEO8Zh0nubLseABg45R8htnoaivw=
X-Google-Smtp-Source: AGHT+IFz9XDScU1xrQzVvHGClUV+atKcmTEkzNc/q4xgcFCTocrd9IHlXpxqpsSmlXqSqGyqsW46bg==
X-Received: by 2002:a17:902:ecd1:b0:224:93e:b5d7 with SMTP id d9443c01a7336-2280493165emr104158825ad.34.1743162807333;
        Fri, 28 Mar 2025 04:53:27 -0700 (PDT)
Received: from thinkpad ([120.60.68.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1f7dd8sm15699105ad.226.2025.03.28.04.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 04:53:26 -0700 (PDT)
Date: Fri, 28 Mar 2025 17:23:20 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: cros-qcom-dts-watchers@chromium.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Jingoo Han <jingoohan1@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, quic_vbadigan@quicinc.com, 
	quic_mrana@quicinc.com, quic_vpernami@quicinc.com, mmareddy@quicinc.com
Subject: Re: [PATCH v5 4/7] PCI: dwc: Add support for ELBI resource mapping
Message-ID: <aot5wc5fki7f3scvtp56cdxpli65zpnsj4wr5n3zsa4pc2i5un@p6gnu7gqa5gh>
References: <20250309-ecam_v4-v5-0-8eff4b59790d@oss.qualcomm.com>
 <20250309-ecam_v4-v5-4-8eff4b59790d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250309-ecam_v4-v5-4-8eff4b59790d@oss.qualcomm.com>

On Sun, Mar 09, 2025 at 11:15:26AM +0530, Krishna Chaitanya Chundru wrote:
> External Local Bus Interface(ELBI) registers are optional registers in
> dwc which has vendor specific registers.

s/dwc which has/DWC IPs having

> 
> As these are part of dwc add the mapping support in dwc itself.
> 

'Since ELBI register space is applicable for all DWC based controllers, move the
resource get code to DWC core and make it optional.'

> Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/dwc/pcie-designware.c | 9 +++++++++
>  drivers/pci/controller/dwc/pcie-designware.h | 1 +
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> index 145e7f579072..874fd31a6079 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.c
> +++ b/drivers/pci/controller/dwc/pcie-designware.c
> @@ -157,6 +157,15 @@ int dw_pcie_get_resources(struct dw_pcie *pci)
>  		}
>  	}
>  
> +	if (!pci->elbi_base) {
> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "elbi");
> +		if (res) {
> +			pci->elbi_base = devm_ioremap_resource(pci->dev, res);
> +			if (IS_ERR(pci->elbi_base))
> +				return PTR_ERR(pci->elbi_base);
> +		}
> +	}
> +
>  	/* LLDD is supposed to manually switch the clocks and resets state */
>  	if (dw_pcie_cap_is(pci, REQ_RES)) {
>  		ret = dw_pcie_get_clocks(pci);
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 501d9ddfea16..3248318d3edd 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -443,6 +443,7 @@ struct dw_pcie {
>  	resource_size_t		dbi_phys_addr;
>  	void __iomem		*dbi_base2;
>  	void __iomem		*atu_base;
> +	void __iomem		*elbi_base;
>  	resource_size_t		atu_phys_addr;
>  	size_t			atu_size;
>  	u32			num_ib_windows;
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
