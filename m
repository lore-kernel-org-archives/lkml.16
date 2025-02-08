Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AB2243940
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 22:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739052401; cv=none; b=Es2W4+Cv/3ZV5+O1AQrPvMb9z4fCTHgA5t/ZSi82L4f5vlZmPQE5Wec80uUy86XfdGXJQeBX6heT+XGsqRMXuiOEff4Ra/ALSStPyYFefK85XB42qXBXVQabZoEi8FiG6o67tppOLn+2nNURx4r7QJqUe3rg80uJ+Siju00PCco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739052401; c=relaxed/simple;
	bh=Fo+ykbDTPpT4mrrcDExrEmKP6wtEHK06fgU4k2k8QUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jLlWaVfO5xuv1WQzhsBGSIY1eQqgglWqakMoKn2KHyhCfDI5beLQ+WNCOhODy2i7/h3Bdz9xGLQ/zIl6YwomxR9r07nVZ+I5d9ZzPZxMS2X7WIGNrkeIhKKgGj0o6fpjeEpV9rPekU8tIhJZOJwzFhFajI7GdFk0TCGeV0iwgL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lBfo0zTM; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lBfo0zTM"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-308a559bdf7so17522331fa.1
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 14:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739052397; x=1739657197; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LrS7fwaYNFpy0Tlho86QxjG6trr99uIwcC04J7bzN3U=;
        b=lBfo0zTMDuy9U/YrG7wXFksKEKICrL9lcthVy+U/QSuLVBhYS8CWvKzvUiqBnEGXH6
         X32Cu5GYxHcgxAzHN7nH63T6f5c647VIRTOKmH5xsWu5hblmndXUvHQo36j4eldLEo+X
         pxfGdswh4kUrMscePJC5oBwpdblJ6KHii0xjCnzRYksQyDOsqeNuLFB/duqwZdjsmCMA
         3OvhmqPGXcDc/StLn9ysjBufsroOw9RDVWJlDBvcMImPyK7xzrzlVLV2zagaJ162f5Oz
         oNPuIU8N0PX5UZTbS7rsXv3KHJkAXQEe3Hsvg7YbVP3+xMdzlibvg6ld/0ZrNBOXAiGe
         CnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739052397; x=1739657197;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LrS7fwaYNFpy0Tlho86QxjG6trr99uIwcC04J7bzN3U=;
        b=kAQCvgFoU5ezgb5xthuYbdalS6jZkVFu+z+iUho8WGN+m+ZENGHy7ENBOF9CfsSGvS
         NxNqiu3j8OkUfG3rJopN+rjKr+JYIkRzknqLpC6b3lPFCfP3lBL0yq1d57mJI4wUFDcl
         GWfZJDfkf9lxwCJaHT/+39rHhxxUpQSYCSnTOUwtKZn5cQ5V4uxsBaBglk4QoBalYo4B
         QQoXdhV7Mff27CigsiF5JlDchXc/R9M81ceWPddq7IJQ3wd8klRvYVBP3grF1ewMcH/i
         RmKIf69k4SPODeER9zWuarw7kXuokvk5RHw+973IAmecP4Ur+CWzHnDtPEK+UYyUjv/o
         STUg==
X-Forwarded-Encrypted: i=1; AJvYcCUwg1ZDs/LCI+hKKK0E+N3MIFA0256oa7pGMPsngkT7jhYEe2zf9WdkwW5gXk7vQK1gt7VVkvi55Hzi8HI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuMfNXGZNp5PBGqQFOGOtZ8J8XVdZN0C34b6EK1s+/DHAurGUO
	SwLgp5vht4B0/6888bnZgseTGhBAD0yEKTj46GvU6Yy8mKKYodZPAhUGeDU+ml4=
X-Gm-Gg: ASbGnctnr0BcbCL+UM45tDcZqxZTpTS73L2s4aLIkJjtvaKR+bDH262qQtAyBSA9m5g
	ZdGyeU1GGu1PGEfNcR3xV4FlBpsv53L3jlaZisegGR8poSpuZf4BbDU35v2EhjdMiAC6vwND7tV
	EYOJsYByAFeVoNUa7UVDLNnl4RQjOP2qgFLySTvr7vsOt8TUwxtaKi0+d8yjkBhOe5x7Gsfsg+M
	WI3ZckDVmUDHmR28uX9h47oATza7u+MO+G1DrH5IDsULHMG/A3ftlpx40QHOEXa4fAdFywpDjQo
	Bm32OZ/pO7Uf173cxnpMH03qZonU30CYWCR0TxqMb4LmsKaJZTbaaCPTEgcVCrKHfabL5Gk=
X-Google-Smtp-Source: AGHT+IHD3w+RD2uIY/nbdfmmcQb7IkradBev5VfMYzeQzDJnvkdElXfAgc+erv7xrm5uRwc1zCnFQA==
X-Received: by 2002:ac2:4ed0:0:b0:542:9883:26f with SMTP id 2adb3069b0e04-54414aee2c3mr2164430e87.50.1739052397255;
        Sat, 08 Feb 2025 14:06:37 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54508f5617asm43871e87.170.2025.02.08.14.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 14:06:36 -0800 (PST)
Date: Sun, 9 Feb 2025 00:06:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: Melody Olvera <quic_molvera@quicinc.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>, Bjorn Andersson <andersson@kernel.org>, 
	Andy Gross <agross@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, 
	Manish Pandey <quic_mapa@quicinc.com>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sm8750: Add UFS nodes for SM8750
 SoC
Message-ID: <ferdaevlfrpf2ewzcct7mqyxltvmt6aaar4fujxfehrmizm3qw@aaroprnpwlxq>
References: <20250113-sm8750_ufs_master-v1-0-b3774120eb8c@quicinc.com>
 <20250113-sm8750_ufs_master-v1-4-b3774120eb8c@quicinc.com>
 <vifyx2lcaq3lhani5ovmxxqsknhkx24ggbu7sxnulrxv4gxzsk@bvmk3znm2ivl>
 <be8a4f65-3b36-4740-a4f7-312126cfd547@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be8a4f65-3b36-4740-a4f7-312126cfd547@quicinc.com>

On Sun, Feb 09, 2025 at 12:47:56AM +0530, Nitin Rawat wrote:
> 
> 
> On 1/14/2025 4:22 PM, Dmitry Baryshkov wrote:
> > On Mon, Jan 13, 2025 at 01:46:27PM -0800, Melody Olvera wrote:
> > > From: Nitin Rawat <quic_nitirawa@quicinc.com>
> > > 
> > > Add UFS host controller and PHY nodes for SM8750 SoC.
> > > 
> > > Co-developed-by: Manish Pandey <quic_mapa@quicinc.com>
> > > Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
> > > Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> > > Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/sm8750.dtsi | 81 ++++++++++++++++++++++++++++++++++++
> > >   1 file changed, 81 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> > > index 3bbd7d18598ee0a3a0d5130c03a3166e1fc14d82..20690c102244b337847a6482dd83c37e19746de9 100644
> > > --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> > > @@ -13,6 +13,7 @@
> > >   #include <dt-bindings/power/qcom,rpmhpd.h>
> > >   #include <dt-bindings/power/qcom-rpmpd.h>
> > >   #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> > > +#include <dt-bindings/gpio/gpio.h>
> > >   / {
> > >   	interrupt-parent = <&intc>;
> > > @@ -1939,6 +1940,86 @@ mmss_noc: interconnect@1780000 {
> > >   			#interconnect-cells = <2>;
> > >   		};
> > > +		ufs_mem_phy: phy@1d80000 {
> > > +			compatible = "qcom,sm8750-qmp-ufs-phy";
> > > +			reg = <0x0 0x01d80000 0x0 0x2000>;
> > > +
> > > +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> > > +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
> > > +				 <&tcsrcc TCSR_UFS_CLKREF_EN>;
> > > +			clock-names =	"ref",
> > > +					"ref_aux",
> > > +					"qref";
> > > +
> > > +			resets = <&ufs_mem_hc 0>;
> > > +			reset-names = "ufsphy";
> > > +
> > > +			power-domains = <&gcc GCC_UFS_MEM_PHY_GDSC>;
> > > +
> > > +			#clock-cells = <1>;
> > > +			#phy-cells = <0>;
> > > +
> > > +			status = "disabled";
> > > +		};
> > > +
> > > +		ufs_mem_hc: ufs@1d84000 {
> > > +			compatible = "qcom,sm8750-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
> > > +			reg = <0x0 0x01d84000 0x0 0x3000>;
> > > +
> > > +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
> > > +
> > > +			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
> > > +				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
> > > +				 <&gcc GCC_UFS_PHY_AHB_CLK>,
> > > +				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
> > > +				 <&rpmhcc RPMH_LN_BB_CLK3>,
> > > +				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
> > > +				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
> > > +				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
> > > +			clock-names = "core_clk",
> > > +				      "bus_aggr_clk",
> > > +				      "iface_clk",
> > > +				      "core_clk_unipro",
> > > +				      "ref_clk",
> > > +				      "tx_lane0_sync_clk",
> > > +				      "rx_lane0_sync_clk",
> > > +				      "rx_lane1_sync_clk";
> > > +			freq-table-hz = <100000000 403000000>,
> > > +					<0 0>,
> > > +					<0 0>,
> > > +					<100000000 403000000>,
> > > +					<100000000 403000000>,
> > > +					<0 0>,
> > > +					<0 0>,
> > > +					<0 0>;
> > 
> > Use OPP table instead
> 
> Currently, OPP is not enabled in the device tree for any previous targets. I

Excuse me? ufs_opp_table is present on SM8250, SM8550 and SDM845 (and
QCS615). So this is not correct

> plan to enable OPP in a separate patch at a later stage. This is because
> there is an ongoing patch in the upstream that aims to enable multiple-level
> clock scaling using OPP, which may introduce changes to the device tree
> entries. To avoid extra efforts, I intend to enable OPP once that patch is
> merged.

Whatever changes are introduced, old DT must still continue to work.
There is no reason to use legacy freq-table-hz if you can use OPP table.

> Please let me know if you have any concerns.
> 
> 
> > 
> > > +
> > > +			resets = <&gcc GCC_UFS_PHY_BCR>;
> > > +			reset-names = "rst";
> > > +
> > > +
> > > +			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
> > > +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> > > +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> > > +					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ALWAYS>;
> > 
> > Shouldn't cpu-ufs be ACTIVE_ONLY?
> 
> As per ufs driver implementation, Icc voting from ufs driver is removed as
> part of low power mode (suspend or clock gating) and voted again in
> resume/ungating path. Hence TAG_ALWAYS will have no power concern.
> All previous targets have the same configuration.

arch/arm64/boot/dts/qcom/qcs615.dtsi:                                    &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;

It might be a mistake for that target though. Your explanation sounds
fine to me.

> 
> Thanks,
> Nitin
> 
> 
> > 
> > > +			interconnect-names = "ufs-ddr",
> > > +					     "cpu-ufs";
> > > +
> > > +			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
> > > +			required-opps = <&rpmhpd_opp_nom>;
> > > +
> > > +			iommus = <&apps_smmu 0x60 0>;
> > > +			dma-coherent;
> > > +
> > > +			lanes-per-direction = <2>;
> > > +
> > > +			phys = <&ufs_mem_phy>;
> > > +			phy-names = "ufsphy";
> > > +
> > > +			#reset-cells = <1>;
> > > +
> > > +			status = "disabled";
> > > +		};
> > > +
> > >   		tcsr_mutex: hwlock@1f40000 {
> > >   			compatible = "qcom,tcsr-mutex";
> > >   			reg = <0x0 0x01f40000 0x0 0x20000>;
> > > 
> > > -- 
> > > 2.46.1
> > > 
> > 
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry
