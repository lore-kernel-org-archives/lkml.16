Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF9719F40B
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 14:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748788843; cv=none; b=nDR+gf38MhC74RS30P7KB+nLBnj/Un2MPYiJyb9SsNV5TitbHP04rn+3zsYEWjpfkNcG2Dq2IsjBD4Q5HiSig6xao2XqDgnplaNj5FB8ws9uqfs6ab7WcR11l0OxJBgDODkqOKhuiU7lK+kTDRVgfpg7aFrv4OKkNED5uUBhZjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748788843; c=relaxed/simple;
	bh=LshmdfiWve+XeQhGY+13PReCQefpKHL9c+zAwcGE6Ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DhOkGTmEbBmkhv+3vbRrkvEQJP9lPS588cSU/bXNb3faEz70G7vF97YZBlLpzvPnDVg0raghXZpJPSUo07+fGqwqFiqLvs0mlcwcCvTXpqHb2S5mUAeLxoaZWXv/X6irvdSI5+4BP2CBW/sxr8hyj9edaP1ZXOqp8HFbJ0cYq9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ab4THk8K; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ab4THk8K"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso2694815b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 07:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748788841; x=1749393641; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UizcElBaNDkQh+jlOwX5IX9W7q8aEMMNlWIx0H8Hau8=;
        b=Ab4THk8KZCT9hUI4oWWRTGRKJwPOrD+Bk3L6OCVAyLMuGtkG3TOs2zlch20Tht4e44
         FITZL6E0FWgEUPhG3wzaPUYTrEJcbtoqBv+PL0cbEYdQtqj5G9mpex6T9kAaRB+yBhdw
         dxLF8OzrwIErM3GMrWECuc7ylqf0xqljfQDBoKJyqizekADEpJ/09fbsx2DzQf765m5+
         Xnkp3jOXL2GqiTKBN14XwrfrHmOEKBxDy+lupn6iAHtblodLPT5T66tKD2rf/RXl8Pyq
         X6J5mg3JxIuqJYWCymVIqYapFmJTar9Txho8V90gzPvJwqdEk5R1+ULUy47If8pnGNPy
         gn3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748788841; x=1749393641;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UizcElBaNDkQh+jlOwX5IX9W7q8aEMMNlWIx0H8Hau8=;
        b=l5OCv6RdnOkJ5xaebH7oF78sVsKO+kR46fV22ll1lBoaDFHeuvfkDJXkdIxg2RK6lV
         pUZwNCMWylFViKWZPmgQrhHZKnWUWU1khpj4EgjRnBUTyMnnbQ65MhsV9kAd8xTIFraz
         kWAatefRQv9bIK436wfqoF4aOW/7D//TlapOxPytHaeAVDgEt6L3RqW3QEHSOAxejf09
         JYZeIS5n1SBy3/xnnFORIiX/TFqnLJh+0A3JTONHmWJekROBSw9r6jvOVx+3CclcXElv
         FwSQVBuqVz3fctkojuGR41IjAZ5HjybskR0gfYzDjcYTc8xbPNrAAluLqXKiSolM0kQS
         W9hg==
X-Forwarded-Encrypted: i=1; AJvYcCWRfrli4Aj61ITZIoqxBhRTK+nkQQHzWHKvw95yII+iBgG3nUnbaG5B5TA9g41MDeV1xc2n7jeCn6u+bFY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDrAKInTBn13GiHFSOutyEfan14R3Ey83fT9qMbc5kCdx7YqxZ
	GTC/hcDymtqFB3j8yneX55v3ryPD3xQTFdAblWE4rO7c1ZWPPn/VREyT/ZTvOK75Ug==
X-Gm-Gg: ASbGncszuiZCPwCJY1ntUhJVvCFW6ahuxy1QP8HJBo5LMsASCMI+qYFibkujS1FU2Ak
	+KOZOxjGtuZUoDnKt7J6++XxC0zVIx8DindpuoCXLZi6Kpz6om7Bui8V6w3d/OSf3KavGyFrtnM
	s7dp6uSCi4yBe2r1ikeNK2veLb/+YrqeODLb/nOMsF7Dnpt8ttLht2LS9yPl8a2GxSTO87zrxoT
	qSa2necM/xff98Qu696L7n+pLZSZmI0v7h2kh/NNdTTFLpQ7/112wfnL3O42LE0XKJOk28Icc82
	8+gM8gohUymxmPpZx5L6oO7TbgwykbNd+ueWXowA66S8//giSA/UL/bTWhmaKe8=
X-Google-Smtp-Source: AGHT+IHcM6bYGdBIEoU2fNPLNOKyH3lOKMTxiDcltgNMUhr4FcLY5BuPvA/16VTJ6dOChivXDvfkjw==
X-Received: by 2002:a05:6a00:3c89:b0:740:afda:a742 with SMTP id d2e1a72fcca58-747d156608emr7752782b3a.0.1748788840681;
        Sun, 01 Jun 2025 07:40:40 -0700 (PDT)
Received: from thinkpad ([120.56.205.120])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afe9648dsm6034087b3a.6.2025.06.01.07.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 07:40:40 -0700 (PDT)
Date: Sun, 1 Jun 2025 20:10:34 +0530
From: 
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
To: Manikandan Karunakaran Pillai <mpillai@cadence.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	"hans.zhang@cixtech.com" <hans.zhang@cixtech.com>, "bhelgaas@google.com" <bhelgaas@google.com>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kw@linux.com" <kw@linux.com>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, Milind Parab <mparab@cadence.com>, 
	"peter.chen@cixtech.com" <peter.chen@cixtech.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 5/5] PCI: cadence: Add callback functions for RP and
 EP controller
Message-ID: <7oafcgprthitopfne3iawig53gdkjhpoe2noe7s555hz53uclt@qykd4udbzdu4>
References: <20250424010445.2260090-1-hans.zhang@cixtech.com>
 <20250424010445.2260090-6-hans.zhang@cixtech.com>
 <25f5e8e4-1b64-478f-84ab-eede2c669655@kernel.org>
 <DS0PR07MB10492918808B18BF4E619DE3FA2862@DS0PR07MB10492.namprd07.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DS0PR07MB10492918808B18BF4E619DE3FA2862@DS0PR07MB10492.namprd07.prod.outlook.com>

On Sun, Apr 27, 2025 at 03:52:13AM +0000, Manikandan Karunakaran Pillai wrote:
> >
> >> ---
> >>  drivers/pci/controller/cadence/pci-j721e.c    |  12 +
> >>  .../pci/controller/cadence/pcie-cadence-ep.c  |  29 +-
> >>  .../controller/cadence/pcie-cadence-host.c    | 263 ++++++++++++++++--
> >>  .../controller/cadence/pcie-cadence-plat.c    |  27 +-
> >>  drivers/pci/controller/cadence/pcie-cadence.c | 197 ++++++++++++-
> >>  drivers/pci/controller/cadence/pcie-cadence.h |  11 +-
> >>  6 files changed, 495 insertions(+), 44 deletions(-)
> >>
> >> diff --git a/drivers/pci/controller/cadence/pci-j721e.c
> >b/drivers/pci/controller/cadence/pci-j721e.c
> >> index ef1cfdae33bb..154b36c30101 100644
> >> --- a/drivers/pci/controller/cadence/pci-j721e.c
> >> +++ b/drivers/pci/controller/cadence/pci-j721e.c
> >> @@ -164,6 +164,14 @@ static const struct cdns_pcie_ops j721e_pcie_ops = {
> >>  	.start_link = j721e_pcie_start_link,
> >>  	.stop_link = j721e_pcie_stop_link,
> >>  	.link_up = j721e_pcie_link_up,
> >> +	.host_init_root_port = cdns_pcie_host_init_root_port,
> >> +	.host_bar_ib_config = cdns_pcie_host_bar_ib_config,
> >> +	.host_init_address_translation =
> >cdns_pcie_host_init_address_translation,
> >> +	.detect_quiet_min_delay_set =
> >cdns_pcie_detect_quiet_min_delay_set,
> >> +	.set_outbound_region = cdns_pcie_set_outbound_region,
> >> +	.set_outbound_region_for_normal_msg =
> >> +
> >cdns_pcie_set_outbound_region_for_normal_msg,
> >> +	.reset_outbound_region = cdns_pcie_reset_outbound_region,
> >
> >How did you resolve Rob's comments?
> >
> >These were repeated I think three times finally with:
> >
> >"Please listen when I say we do not want the ops method used in other
> >drivers. "
> >
> >I think you just send the same ignoring previous discussion which is the
> >shortest way to get yourself NAKed.
> >
> >
> 
> I was waiting to check if there are additional comments on the approach, because this approach was taken 
> based on an earlier comments on the patches. Since we have not got any adverse comments from other
> maintainers on this, I will separate out the entire driver for old and new architecture. The few common functions
> will be moved to a common file, to be used as library functions. There will be repetitions of
> code but from Rob's comments, I believe it is fine.
> 

I agree with Rob. We should really get rid of the callbacks and try to make the
common code a library.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
