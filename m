Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7FC1FA85A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744703211; cv=none; b=NgMTJx2K8nscIQYW0KEchIb61+yH+F/3oam9wU64M/10aK/4z+qQGUS6uAXsPOkLhkgksZ22Vv+RJHLhp/+5jougv5Vk2VHkPEyWmRC+kJdqDbfNrD9z+AdmMOht3iVksENzAQQxQs90Ws4W9LzIU1jxsaDyacWbkDiHaJ83FL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744703211; c=relaxed/simple;
	bh=nY8Tqunj6Ge/7wm9FhZ0tmE7RLL+A9iGIOQS0ueQIEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HcR6ynR0fp3m05XoeZqwP537l9sFL48zvlDmF4TySPWvf+MtyraTiRvWG+JCb49g+0NT5opSyDE8P6QkxrpomOottVgh5It01IAOwVMFqDocfS2C0IbTzmvu6IYGvunMjDe7LSTVi2M2gtMH4VkO9r2TVwopiMgUft0RxoPAycY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TqDQl29K; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TqDQl29K"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-736b34a71a1so6103587b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 00:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744703209; x=1745308009; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0yi1XGyu7vnRMe1p7NI5hUFFuvkRWcO+953pawUCGZw=;
        b=TqDQl29Kth+N0fc4zmL15lAUbjEJU4fVovy2OJNaBUtXnERf97ClzlywuJLOEykYLp
         M4/YphRWw0CiO5N09DAdqt6dLVbXbcXBM7etxFQNQaV3tA9fJQTJgdi82SGoKs9DvQTx
         /YMq+MtgqAzecRgFY5VXyxo7lVnDYSJ9h67lY2RNg6VNXFM2t5IeHuYzebX9O2G7/cDc
         TAZXa/kANiOC81J4hSsF+Vv7Lwtb6tCHMr84FmIXWNp7F2abwFyFbiQlaFzmRw9nE9d0
         3koSyVNLUeWAtrXzhhk/1Tc6xcgS7GubyQdQEENkObOcCH4mKKG3pOX0XqP6h7rNg8Z4
         tKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744703209; x=1745308009;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0yi1XGyu7vnRMe1p7NI5hUFFuvkRWcO+953pawUCGZw=;
        b=AljFBPwqrtFh7xr1QZ4N4QLAkb+JNzaml+7P6N6I9Arql4VZgiHMQk8zC3uwrQMigA
         Ph2WBlKmfAFnoMfl5/TfnNEXY2uy9ZqfzeFdu54vM/X5NV1+c078VpscPuiIcYs8Wzny
         7DtA+BAdobFsDLKwsB3oNj5qv3nlmuDWbjsHMHm1nWJV29SePWW9jhbaPFMVlwmbLWlq
         CWcQzHU5iUC1bO5tEZSiFgdAYbZI7dp9G1V8uw9KUhdg1UUIK74Eiqyte72wY1kHjeIB
         EEmBVVX2tKYhdRK++/n1JayuwRZm2g8mGCOf5kXr2jNK06JofkCk+BfMAlNFMIpQ3E5K
         mZAw==
X-Forwarded-Encrypted: i=1; AJvYcCXMA6Sa/AJrvgp12keMXuz8ggSs1jCkSBtDKRd6C2N/Iv5ykgadUvKQ0A5MBnLYmKeVOYOxWF+ejV15coE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZOm11N9GQM668YSyykJLvHM2S30p6r1Cyy5y9sIuFpQC/ppKj
	hJc6OZbcV79aKEBxwvsx/8Z6rxLoUq6tbydG0NhLdwIpc6y1foaD5zSBk5y02g==
X-Gm-Gg: ASbGncvb54Kz3KK07rlZQKVc10T5X2rKhpfcwSsvGAL5qU5t4spwbA5sUF7L3X0d9Xq
	nE8NR66Wba4/ZsMlDnCLAZbewgICgkJQ7NoJLyueerHKnaL50Y0hEyGFI19G+VhNh60FF+nNLlT
	sPThUHSwiKEqqbhqk0Ncx00ZVPBwhNvbKs78+jQA0AebQWOqJFdisFz0iyS+PHuds6cquUczWw3
	7TB+SiDz9heNf2H5PVpHtiqWZsyWNMbkueM9QPEUVGI+Rp8QeKjkbUcQk2yE74DB1mJFKlqD9Y1
	CI8pK42M0X7D2/9b/luo9sNINlI3UBW6IxgC2SnstawEYREJeA==
X-Google-Smtp-Source: AGHT+IGTCKyO+F34iBxsSLbuw7BRnf112WGbpw40IN8bUUZot9bE4g6Xr02iDin0+FeT5ut+LRJNkA==
X-Received: by 2002:a05:6a00:3d46:b0:735:d89c:4b8e with SMTP id d2e1a72fcca58-73bd1196ea5mr19849919b3a.5.1744703208693;
        Tue, 15 Apr 2025 00:46:48 -0700 (PDT)
Received: from thinkpad ([120.60.71.35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21949dasm7848682b3a.35.2025.04.15.00.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 00:46:48 -0700 (PDT)
Date: Tue, 15 Apr 2025 13:16:42 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Caleb Connolly <caleb.connolly@linaro.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, quic_vbadigan@quicinc.com, 
	quic_mrana@quicinc.com
Subject: Re: [PATCH v2 2/3] arm64: qcom: sc7280: Move phy, perst to root port
 node
Message-ID: <ebx53jr7enadvxgywt7nuoxfvvspxvvsiecmpuw3f2qqljj3fd@zwsjtcrpxsh6>
References: <20250414-perst-v2-0-89247746d755@oss.qualcomm.com>
 <20250414-perst-v2-2-89247746d755@oss.qualcomm.com>
 <511f8414-bbb1-4069-a0a6-f7505190c1e0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <511f8414-bbb1-4069-a0a6-f7505190c1e0@linaro.org>

On Mon, Apr 14, 2025 at 02:49:00PM +0200, Caleb Connolly wrote:
> 
> 
> On 4/14/25 07:39, Krishna Chaitanya Chundru wrote:
> > Move phy, perst, to root port from the controller node.
> > 
> > Rename perst-gpios to reset-gpios to align with the expected naming
> > convention of pci-bus-common.yaml.
> > 
> > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > ---
> >   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts   | 5 ++++-
> >   arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 5 ++++-
> >   arch/arm64/boot/dts/qcom/sc7280-idp.dtsi       | 5 ++++-
> >   arch/arm64/boot/dts/qcom/sc7280.dtsi           | 6 ++----
> >   4 files changed, 14 insertions(+), 7 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > index 7a36c90ad4ec8b52f30b22b1621404857d6ef336..3dd58986ad5da0f898537a51715bb5d0fecbe100 100644
> > --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > @@ -709,8 +709,11 @@ &mdss_edp_phy {
> >   	status = "okay";
> >   };
> > +&pcie1_port0 {
> > +	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> > +};
> > +
> >   &pcie1 {
> > -	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> >   	pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>;
> >   	pinctrl-names = "default";
> > diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> > index 2ba4ea60cb14736c9cfbf9f4a9048f20a4c921f2..ff11d85d015bdab6a90bd8a0eb9113a339866953 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> > @@ -472,10 +472,13 @@ &pcie1 {
> >   	pinctrl-names = "default";
> >   	pinctrl-0 = <&pcie1_clkreq_n>, <&ssd_rst_l>, <&pe_wake_odl>;
> > -	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> >   	vddpe-3v3-supply = <&pp3300_ssd>;
> >   };
> > +&pcie1_port0 {
> > +	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> > +};
> > +
> >   &pm8350c_pwm {
> >   	status = "okay";
> >   };
> > diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> > index 7370aa0dbf0e3f9e7a3e38c3f00686e1d3dcbc9f..3209bb15dfec36299cabae07d34f3dc82db6de77 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> > @@ -414,9 +414,12 @@ &lpass_va_macro {
> >   	vdd-micb-supply = <&vreg_bob>;
> >   };
> > +&pcie1_port0 {
> > +	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> > +};
> > +
> >   &pcie1 {
> >   	status = "okay";
> > -	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> >   	vddpe-3v3-supply = <&nvme_3v3_regulator>;
> > diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > index 0f2caf36910b65c398c9e03800a8ce0a8a1f8fc7..376fabf3b4eac34d75bb79ef902c9d83490c45f7 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > @@ -2271,9 +2271,6 @@ pcie1: pcie@1c08000 {
> >   			power-domains = <&gcc GCC_PCIE_1_GDSC>;
> > -			phys = <&pcie1_phy>;
> > -			phy-names = "pciephy";
> 
> Isn't this a huge API breakage that will break using new DT with old
> kernels? It will also break U-boot which uses upstream DT.
> 

That's right.

> This is bad enough, but at least let's break it a clean break by changing
> all platforms at once.
> 

Even though converting all platforms is the end goal, I don't think converting
all of them in a single patch is going to do any good.

> As I understand it, we seem to allow these breakages in DT for now (and this
> patch landing will confirm that), but perhaps we could at least track them
> somewhere or at acknowledge the breakage with a tag in the commit message
> pointing to the relevant dt-bindings patch.
> 

I'll leave the decision of breaking old kernels to DT maintainers, but I'd
atleast prefer to use this in upcoming targets. So the binding and driver
changes can go any time.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
