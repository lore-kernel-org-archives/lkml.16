Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670EE1EB1A9;
	Fri,  7 Feb 2025 15:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738941694; cv=none; b=MDXWgzqjhXGrS4wP504k2i5Os4MpblVmgmv9LOAjPzbzEcD+loaj5ueeXH8gsLLZdcStoSt6/ie+tg9pNg84TvfpPi+AONrZno9b3PGelA0fTPMti3QIQotFgTFCZFcC8EjFF9HvVP3wpbPQV8jW5kDpXDg4oPsW7KkDQ9aGEPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738941694; c=relaxed/simple;
	bh=mj0RF2nhB7SojgOQqUxKsct/kmckX3wRO55PiFDqnYs=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=bZYucUOLv+K8HbX4xJWhyZwqsufxef3WTKqnOMS1aDhFFx3Nq2q+n6pDo1kBfP/6Rhj5bS6VHntK3zFEkFJgRRdqugQcI7QRv4ruQdDt8yeYfWF2qucpJlqOpkrOWoyIYzj5bRP9eKKo8pwRdoQpat2no1lvAr7ndbrnCwSUz1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o5pkp1u0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o5pkp1u0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D511C4CEDF;
	Fri,  7 Feb 2025 15:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738941693;
	bh=mj0RF2nhB7SojgOQqUxKsct/kmckX3wRO55PiFDqnYs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=o5pkp1u0x2XiXI2HmhxdCxyQBK7GEt414yTRePv/2zVb4Fewdcs1ee4baISf8B5i7
	 dtzuL5Dr7htQGpoPRqD6a2zIt3dbwn8++an9AeTt2lYgOh6ZnGV/DPkG7D67ZvQPgG
	 cADj6hQb7Jk2mHI8VrQC7/+fGEvuRFogkNUfVNrl+Y4srEYUIVLf0/Z9AEJqrnmNOt
	 iGgedPh5nCsM+L8eUrOgD5MgqCX3FodMbk47RV21AZc0BrEsHCE6D78nuzt4/SwbQH
	 TQRSgsxiEHE8RRfJx07wOlDR9Rajcqezbse01d7E++rwAZCb6NStI1lw9p8n0G6cF/
	 zgfbNEFTbl52A==
Date: Fri, 07 Feb 2025 09:21:32 -0600
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-usb@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 linux-kernel@vger.kernel.org, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Vijayavardhan Vennapusa <quic_vvreddy@quicinc.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Jack Pham <quic_jackp@quicinc.com>, Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@oss.qualcomm.com
To: Akash Kumar <quic_akakum@quicinc.com>
In-Reply-To: <20250206111543.17392-1-quic_akakum@quicinc.com>
References: <20250206111543.17392-1-quic_akakum@quicinc.com>
Message-Id: <173894150695.330871.12666874941049117797.robh@kernel.org>
Subject: Re: [PATCH 00/18] Reserve high bandwidth for HS isoc eps


On Thu, 06 Feb 2025 16:45:25 +0530, Akash Kumar wrote:
> It is observed while testing multiple audio devices over usb, a glitch is
> observed during testing. As per dwc datasheet,By default, HC reserves 80%
> of the bandwidth for periodic EPs which can be increased if needed.
> 
> Add quirk to set GUCTL register BIT 16 to accommodate higher bandwidth for
> 2 isoc eps.
> 
> If this bit is set, the bandwidth is relaxed to 85% to accommodate two high
> speed, high bandwidth ISOC EPs. USB 2.0 required 80% bandwidth allocated
> for ISOC traffic. If two High-bandwidth ISOC devices (HD Webcams) are
> connected, and if each requires 1024-bytes X 3 packets per Micro-Frame,
> then the bandwidth required is around 82%. If this bit is set, then it is
> possible to connect two Webcams of 1024bytes X 3 paylod per Micro-Frame
> each. Alternatively, you might need to lower the resolution of the
> webcams. This bit is valid in Host and DRD configuration and is used in
> host mode operation only.
> 
> Set this bit for host mode uvc uac usecases where two isoc eps are used
> and uvc flickers or audio glitch is observed.
> 
> Akash Kumar (18):
>   usb: dwc3: Reserve Higher Bandwidth for HS Periodic EPs
>   arm64: dts: qcom: sa8775p: Enable high bandwidth for hs isoc eps
>   arm64: dts: qcom: sm8350: Enable high bandwidth for hs isoc eps
>   arm64: dts: qcom: sm8450: Enable high bandwidth for hs isoc eps
>   arm64: dts: qcom: sm8150: Enable high bandwidth for hs isoc eps
>   arm64: dts: qcom: sm6125: Enable high bandwidth for hs isoc eps
>   arm64: dts: qcom: sm8250: Enable high bandwidth for hs isoc eps
>   arm64: dts: qcom: sm6350: Enable high bandwidth for hs isoc eps
>   arm64: dts: qcom: sc7280: Enable high bandwidth for hs isoc eps
>   arm64: dts: qcom: sdm630: Enable high bandwidth for hs isoc eps
>   arm64: dts: qcom: sdm845: Enable high bandwidth for hs isoc eps
>   arm64: dts: qcom: sdx75: Enable high bandwidth for hs isoc eps
>   arm64: dts: qcom: qcs404: Enable high bandwidth for hs isoc eps
>   arm64: dts: qcom: sc7180: Enable high bandwidth for hs isoc eps
>   arm64: dts: qcom: x1e80100: Enable high bandwidth for hs isoc eps
>   arm64: dts: qcom: Enable high bandwidth for hs isoc eps
>   arm64: dts: qcom: sc8280xp: Enable high bandwidth for hs isoc eps
>   arm64: dts: qcom: sc8180x: Enable high bandwidth for hs isoc eps
> 
>  arch/arm64/boot/dts/qcom/qcs404.dtsi   |  2 ++
>  arch/arm64/boot/dts/qcom/qdu1000.dtsi  |  1 +
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi  |  3 +++
>  arch/arm64/boot/dts/qcom/sc7180.dtsi   |  1 +
>  arch/arm64/boot/dts/qcom/sc7280.dtsi   |  2 ++
>  arch/arm64/boot/dts/qcom/sc8180x.dtsi  |  3 +++
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi |  3 +++
>  arch/arm64/boot/dts/qcom/sdm630.dtsi   |  2 ++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi   |  2 ++
>  arch/arm64/boot/dts/qcom/sdx75.dtsi    |  1 +
>  arch/arm64/boot/dts/qcom/sm6125.dtsi   |  1 +
>  arch/arm64/boot/dts/qcom/sm6350.dtsi   |  1 +
>  arch/arm64/boot/dts/qcom/sm8150.dtsi   |  2 ++
>  arch/arm64/boot/dts/qcom/sm8250.dtsi   |  2 ++
>  arch/arm64/boot/dts/qcom/sm8350.dtsi   |  2 ++
>  arch/arm64/boot/dts/qcom/sm8450.dtsi   |  1 +
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi |  5 +++++
>  drivers/usb/dwc3/core.c                | 11 +++++++++++
>  drivers/usb/dwc3/core.h                |  4 ++++
>  19 files changed, 49 insertions(+)
> 
> --
> 2.17.1
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250206111543.17392-1-quic_akakum@quicinc.com:

arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: usb@a4f8800: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: usb@a4f8800: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm7125-xiaomi-curtana.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm7125-xiaomi-curtana.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm7125-xiaomi-curtana.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: usb@a0f8800: usb@a000000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: usb@a0f8800: usb@a000000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: usb@a000000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-discovery.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-discovery.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-discovery.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs404-evb-4000.dtb: usb@7678800: usb@7580000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs404-evb-4000.dtb: usb@7678800: usb@7580000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs404-evb-4000.dtb: usb@7580000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs404-evb-4000.dtb: usb@79b8800: usb@78c0000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs404-evb-4000.dtb: usb@79b8800: usb@78c0000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs404-evb-4000.dtb: usb@78c0000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: usb@a4f8800: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: usb@a4f8800: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: usb@a4f8800: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: usb@a4f8800: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: usb@a0f8800: usb@a000000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: usb@a0f8800: usb@a000000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: usb@a000000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a4f8800: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a4f8800: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp.dtb: usb@8cf8800: usb@8c00000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp.dtb: usb@8cf8800: usb@8c00000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp.dtb: usb@8c00000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8150-mtp.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8150-mtp.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8150-mtp.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdx75-idp.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdx75-idp.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdx75-idp.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: usb@a4f8800: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: usb@a4f8800: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: usb@a4f8800: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: usb@a4f8800: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8155p-adp.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8155p-adp.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8155p-adp.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8155p-adp.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8155p-adp.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8155p-adp.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: usb@a0f8800: usb@a000000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: usb@a0f8800: usb@a000000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: usb@a000000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: usb@a4f8800: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: usb@a4f8800: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: usb@a2f8800: usb@a200000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: usb@a2f8800: usb@a200000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: usb@a200000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: usb@a4f8800: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: usb@a4f8800: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-lte.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-lte.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-lte.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-idp.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-idp.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-idp.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8150-hdk.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8150-hdk.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8150-hdk.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8150-hdk.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8150-hdk.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8150-hdk.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a4f8800: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a4f8800: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/qru1000-idp.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qru1000-idp.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qru1000-idp.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r10.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r10.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r10.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: usb@a4f8800: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: usb@a4f8800: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: usb@a4f8800: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: usb@a4f8800: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dtb: usb@4ef8800: usb@4e00000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dtb: usb@4ef8800: usb@4e00000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dtb: usb@4e00000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: usb@a0f8800: usb@a000000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: usb@a0f8800: usb@a000000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: usb@a000000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: usb@a4f8800: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: usb@a4f8800: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: usb@a4f8800: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: usb@a4f8800: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: usb@a4f8800: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: usb@a4f8800: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb: usb@c2f8800: usb@c200000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb: usb@c2f8800: usb@c200000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb: usb@c200000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: usb@a4f8800: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: usb@a4f8800: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: usb@a400000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-kb.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-kb.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-kb.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/qdu1000-idp.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qdu1000-idp.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qdu1000-idp.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs404-evb-1000.dtb: usb@7678800: usb@7580000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs404-evb-1000.dtb: usb@7678800: usb@7580000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs404-evb-1000.dtb: usb@7580000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs404-evb-1000.dtb: usb@79b8800: usb@78c0000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs404-evb-1000.dtb: usb@79b8800: usb@78c0000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs404-evb-1000.dtb: usb@78c0000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dtb: usb@4ef8800: usb@4e00000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dtb: usb@4ef8800: usb@4e00000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dtb: usb@4e00000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb: usb@a8f8800: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb: usb@a800000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r10.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r10.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r10.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: usb@a6f8800: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: usb@a600000: Unevaluated properties are not allowed ('snps,dwc3_guctl_resbwhseps_quirk' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#





