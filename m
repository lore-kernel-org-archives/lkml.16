Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B85140E30
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 07:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748761540; cv=none; b=rl5hkjwYyNgCS69cA1a09qARMihO/KPeEZ4jxQg9YOZ5uc6qD88ktpYKP/EXYIpGHan9vA/f/JFDwIttVC4gdESULpWeVc2JBvYiq1/EYv63VEkw3x1WisZiWtGr9qvp/c7IpUvCitWWkwW5pXC6URAjGi/CAzRcCDmfLeIlUP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748761540; c=relaxed/simple;
	bh=b5TBNVn7AFtnC8283/oMyrwCoOBsBN6iBn6q0WoWmzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EaC5Ce+eda5PlyMINAzScEAsR0YQJ4nP7JPhVVK0yhDEDKkEyT2UGreM5nh7N9V0GFq9OKpV0YCQrcQUQYmZgIPiMwCl8SU5AisIHvAG6vMXdYjMnr/8S+iruENlTtu65tYKWkPUqkq46diRk0IzP/+S0+LUI+5H3RBjxO/ZqC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xXC/rtIA; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xXC/rtIA"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2301ac32320so30755005ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 00:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748761538; x=1749366338; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tP4cIEQvwMPVrEztoI29giGwTzVH1fjQVhB02Bph62w=;
        b=xXC/rtIA7ES0SNr01OfeoDa4mrx4CJVRZCsLMsuKiB2bEBAGMfihLTScGL0CAsbmLl
         fMRhvcTiGXA3FjfD0bds7iBfe5DuJ8l80jLiHPXtIdDAwNu2twC1ke+OTKH6EDjHXcj4
         wanmh85FyEOzfq+aN/SHrar+maZ8pq9RRW37kkaglM2ESKFNeOgM8ikD5hp8q3JkyJoP
         nb4Obn5BVQu8apvvClkpNo7rJ9+exasY8ZVjRcj6w1c37E5b/ZgVdc8XXLkRb26ps9Bm
         uSLMY1Q1piTTGAGhXzVVyLKNbTbFUPYeXZnSXMN3RLDKf3uz5Eg9OOZb2peRD37zQMrV
         uI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748761538; x=1749366338;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tP4cIEQvwMPVrEztoI29giGwTzVH1fjQVhB02Bph62w=;
        b=a+1RM+iubRnX+OxCkZfJiqGTNN1NzDk/O49lj11FhoCoW5zdqeWubwAmxz5oFEXjGO
         6kdbL0H1FlcSPmwypHuVPF3fegRWHLcZqYUh+ZtJamVEXKkLPMcv+Lm3IlPnWFCbFBd/
         ImpMCywUFJqUc+XVo18eE3UlG9NiAHI/1f0YW+agSdKpn0Tltkz+bpeIGsTbT+g8/vPt
         SFzsuI84RDLC/w11sAZPzIcZkAEDG2BXmhC+iUDJpthrJR+Yuzpbc3qt7f+0Pn8jQzS+
         FR9RQ6uQdUkrrfc6a5xZx8298k5TjeMjFc/0k9BkupMYYXXNY+1dWNHBgDOuL/JIzZJl
         MUeg==
X-Forwarded-Encrypted: i=1; AJvYcCWsnuRYeLZwIKTywbgt0KVZwTvAImhaF1+FgtNlwN3egOiPfrJiNfC9Vlef6tcF9H7h6qHuqUY92zVCi7k=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj8UEsK++uS1iJGk3qLdoPhllKLXEh7ATyN8+DN5kY2tnEPA6U
	ZqnhxMb1AuJabluPjSSzDVSkWr4UATohWXkG/sEa+EYHcGNK5vWzElnDpIrp+0H5yQ==
X-Gm-Gg: ASbGnctTgYln0mKiGQEQLzwGDJ300uw/I7Ip30KprShktTwyebAYilEXWWEyEFEuc5P
	Y5fRmbNuPCrfAVrFSHPFvn6m70D09GSBN0rltHoxVmHIswGnNjK1eRFJXO0bC7GwfmnVHaAdUL4
	MbF5MmBNt3eQr+s82jy4wHX/jHpcJKsx+pbGnuF4/LYwyBPrnWxVYHbt4gFlN/XJn6KBNF7uZA3
	kJ0ATOJs18bShzit91LTlNzswPgcMTucRcuFQ8tpB3Wk7Muoenh7gHEONcDFiycRJjFBC7pAsrK
	2drU24P8vNM4XBY/zBksD/SMI7WsouJIEau2P0qxv18Bc8QALTZgzdmxYquuw+8=
X-Google-Smtp-Source: AGHT+IE247uLd/iBzphkxeKxftAlRKgNkFf6A4iG4K2SNJInbQbWVZdn+4gqUSzoyj78p796a0CT5w==
X-Received: by 2002:a17:902:74c6:b0:234:a44c:18d with SMTP id d9443c01a7336-235290e435emr124157195ad.22.1748761538281;
        Sun, 01 Jun 2025 00:05:38 -0700 (PDT)
Received: from thinkpad ([120.56.205.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf47edsm51491055ad.161.2025.06.01.00.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 00:05:37 -0700 (PDT)
Date: Sun, 1 Jun 2025 12:35:31 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_vbadigan@quicinc.com, quic_mrana@quicinc.com
Subject: Re: [PATCH v3 3/3] arm64: qcom: sc7280: Move phy, perst to root port
 node
Message-ID: <r4mtndc6tww6eqfumensnsrnk6j6dw5nljgmiz2azzg2evuoy6@hog3twb22euq>
References: <20250419-perst-v3-0-1afec3c4ea62@oss.qualcomm.com>
 <20250419-perst-v3-3-1afec3c4ea62@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250419-perst-v3-3-1afec3c4ea62@oss.qualcomm.com>

On Sat, Apr 19, 2025 at 10:49:26AM +0530, Krishna Chaitanya Chundru wrote:
> There are many places we agreed to move the wake and perst gpio's
> and phy etc to the pcie root port node instead of bridge node[1].

Same comment as binding patch applies here.

> 
> So move the phy, phy-names, wake-gpio's in the root port.

You are not moving any 'wake-gpios' property.

> There is already reset-gpio defined for PERST# in pci-bus-common.yaml,
> start using that property instead of perst-gpio.
> 
> [1] https://lore.kernel.org/linux-pci/20241211192014.GA3302752@bhelgaas/
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts   | 5 ++++-
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 5 ++++-
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi       | 5 ++++-
>  arch/arm64/boot/dts/qcom/sc7280.dtsi           | 6 ++----
>  4 files changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 7a36c90ad4ec8b52f30b22b1621404857d6ef336..3dd58986ad5da0f898537a51715bb5d0fecbe100 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -709,8 +709,11 @@ &mdss_edp_phy {
>  	status = "okay";
>  };
>  
> +&pcie1_port0 {
> +	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> +};
> +
>  &pcie1 {
> -	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
>  
>  	pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>;
>  	pinctrl-names = "default";

What about the pinctrl properties? They should also be moved.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
