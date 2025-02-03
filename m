Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8162520ADC2
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 16:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738599986; cv=none; b=U58XSCNpWJXqhTo+68B033JAo5/QSLfEqGaTqz1pfAhCjJ/8CsJ/M8CUegEkHxPmI8XtrfAfvKV6QFQ6OY68jP40nw9f4LVwOVkxVkDshHLogvfyC5WRNYTq9J/dFtSWwO0tUGWZN3wr4SR52V83jJU+7jGSV2i7RiVVoi+QgM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738599986; c=relaxed/simple;
	bh=OVibP8ReQyd3HQmntDn0iiGBJZzdEqwa87ZWcwRodw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IFVgt7R4O7ManciesvBc4J7ZDgSyRxnbjf8ZYBVg92kZgmPht7KBh6O+J+8W1oaEwuLA/HjcEKxhklO8JEeRAVFatfvwEp0FS7eOlCD+Bzaf7CBISpcCxs1nG4CtLlxa38wdjwtpTYzd5NIEZiXIzwin78NQeXzzxcn5XLZXqtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WSit5eS9; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WSit5eS9"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21649a7bcdcso79460495ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 08:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738599984; x=1739204784; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fpVOevLK/nWn6zp5PxG8PfTYQAwpuKIZhTQ2q8JK1sU=;
        b=WSit5eS9RXGVOCTJ3Sf5kWBU2jEnJtiLb2D33Jc9Fzs4GRqZg+EycRTOA9O1CIJ0bN
         sOAiQfW4sp2VOnxF8AAUuD4ao5paRh5xkz73HC868qZvza6H5dFzFL5zvg0xuDEcFgnn
         l0iuXzPwRvAqeusDkzxbelsPpSnPde+Nae6xU3Kq96zoXEH0Tv3mgUKxDXMpIACO9AYh
         tXi+qaajoQYgkQhjS+yVk91rq6q6/K9NOo2N+g1W6nMyrb+WimMzKd9zmApa8cKMPYYa
         0zf4aSdOfvmfh/h3QX0ldaflPIKJGJzUfYEvgqkkJRFywKOWi3894COOjLhkpL6sNM67
         6zSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738599984; x=1739204784;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fpVOevLK/nWn6zp5PxG8PfTYQAwpuKIZhTQ2q8JK1sU=;
        b=LcEcs/KBWWC3v/01IfXyuWJI+41FsFjqufTZ9XV9/c9WADmg/R6P17hNlMre1ZEr73
         RYvyQJjHermUsg1S6aiatqHZxTnQJtEu0P/OBzNXXTtM0CCae+fyAyJmoRz1aW3sQNxb
         +yEET4ypnk0+PReiiYsewr1q/HMLwrevU5AnfsrcxowF/YsYRcPNzB8bbEoRcjaJ/8/d
         yw7p5cN65eQQ/NYcKR5nlbDOsJLpZ5zZAxaGcksNmj3Jufr+ghpVD5ddRAlHRecb73oZ
         NR3oy9xx6vrgPr8vB4926xDd6sxyM2iBOucYm4HBiCJ+aSOC3yrg55sisfq9vRCcdVrH
         SjQA==
X-Forwarded-Encrypted: i=1; AJvYcCUUra/EVoCdsySDF2BB6Cj60n8hcMEYkJcyhxBjoUXpmc4/nyuWVFnprp4kqQ/7ELHo4RQNlEpZBhoOHIo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlfkcR45RiBEyQv0Z5nZXWWypGgs10vhnGPluGEp66c9crihxx
	4swdXWNcI50f9WTpGJt38lc3PdnhiwKuPGxOLbu8JDJE3M5EEtlJ7uDKTn9pjA==
X-Gm-Gg: ASbGncvk7TgXVJfHFrY2kmoErE1AQMKE8w49gXcSUJsK31o9hKRrlEu1kjTdptcqdFb
	GIJ8+i+1E2Qmw5aKprsllxXHfyydAFfN23NiRAerYrMrT5bbMTJfM0XqgkDPksYGJVDIzMs3poP
	UlM+ub3g9emulfF86CG/xgAWIychopTnXZFxyotFIA4SL1WC/V4tlN6cmnWSmW5ov1MitbD3dZV
	CZFAZQ4jwULeXcSHOz2ZPw5Fql64L4HnMMB9WqvyneziChl04/9fofbFeJj5wizYAmreqKCV9Zc
	otEoF83pCVBbXqqCTVK2V4SZSA==
X-Google-Smtp-Source: AGHT+IFOuXKAdtxhNw7CHCzZkSB+L34XynX4lNUCqGi6tRRgVguTo3ptD/9ETnLqXyet7OFZO69Avw==
X-Received: by 2002:a17:902:f68a:b0:21a:8769:302e with SMTP id d9443c01a7336-21dd7c65746mr352286105ad.14.1738599983682;
        Mon, 03 Feb 2025 08:26:23 -0800 (PST)
Received: from thinkpad ([120.60.129.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31ee1fasm78854315ad.44.2025.02.03.08.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:26:23 -0800 (PST)
Date: Mon, 3 Feb 2025 21:56:17 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	vkoul@kernel.org, kishon@kernel.org, andersson@kernel.org,
	konradybcio@kernel.org, p.zabel@pengutronix.de,
	dmitry.baryshkov@linaro.org, quic_nsekar@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Praveenkumar I <quic_ipkumar@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 6/7] arm64: dts: qcom: ipq5332: Add PCIe related nodes
Message-ID: <20250203162617.sstmdvv7d3k53izf@thinkpad>
References: <20250122063411.3503097-1-quic_varada@quicinc.com>
 <20250122063411.3503097-7-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250122063411.3503097-7-quic_varada@quicinc.com>

On Wed, Jan 22, 2025 at 12:04:10PM +0530, Varadarajan Narayanan wrote:
> From: Praveenkumar I <quic_ipkumar@quicinc.com>
> 
> Add phy and controller nodes for pcie0_x1 and pcie1_x2.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

One minor comment below.


[...]

> +			assigned-clocks = <&gcc GCC_PCIE3X2_AUX_CLK>,
> +					<&gcc GCC_PCIE3X2_AXI_M_CLK>,
> +					<&gcc GCC_PCIE3X2_AXI_S_BRIDGE_CLK>,
> +					<&gcc GCC_PCIE3X2_AXI_S_CLK>,
> +					<&gcc GCC_PCIE3X2_RCHG_CLK>;
> +
> +			assigned-clock-rates = <2000000>,
> +						<266666666>,
> +						<240000000>,
> +						<240000000>,
> +						<100000000>;
> +

Does the drivers really need to set clock rate for these many clocks?

No, as per the reply to my similar question to IPQ5424:
https://lore.kernel.org/linux-arm-msm/9206e44c-da4f-4bdb-850f-fac511f4ddc7@quicinc.com/

- Mani

-- 
மணிவண்ணன் சதாசிவம்
