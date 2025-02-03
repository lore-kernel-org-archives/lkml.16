Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665F021129E
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 14:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738592774; cv=none; b=npaXyaR+22n5NWgXusfo7KaSGnph6hwwig7+X+RWnbUtNMRAbYLkANtfm4ymrenIQvqwh7h2tIyNWDnrpyHTnLT/cuRWQi1koUIeLNgdlBPyWOgpjpJj1Lbei/YBgVNGou7o+vMpHDFis9l1ZaOAzJgqb0OIJzmlAwLpQeSJF+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738592774; c=relaxed/simple;
	bh=eQmN+wSYqNfPSq7/lGm2FRWILAta40UWxadBXdb2dCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JTRMSovqw31S9djNfiW8Opxq7aLY4vi26N1J1QBXukCdCbKnUofzPWKDiDjle0UBP9ocmA/LDYZy4K1M67Grq46xQN/wtGFStmdsFrmT+8w1BWnBa96vqYucSQrmOX3CnevhQc6+DS94qyKfvcOYsTPlMbDQRFvzXvV4JRrWoPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s+tecW68; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s+tecW68"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-216395e151bso52991905ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 06:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738592770; x=1739197570; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qwfs5ZTiLlNTPpq6GVEveYLjOMUtMGx1iY3Hoyz/gnI=;
        b=s+tecW689LgIGw0VrSgiByP4ICnBQSld2ZzeFry37wwwBqAKo/17W4SETTGHjCVk2Q
         i5C2T/NddpZG0wN14JcWW7m8ihJZ4jLvg2icw61leP3VuNqEijc69e/o8tYKqTRHuuV8
         8b8emQYOnrtBFCaM1T588AjDUPAX58sPapZS1mrJlV7pQuTSgBLU5/6cEWeEMxogjprc
         Q0bNXnGeHVNZpjVO4bIWUzdWnZHC9jQZcsgL9i2eD/mg2emzKEVVX8+G4imbr5FCfLq8
         LqGapAPASv3xut9E0NRfyT7fo7OC11RFw4frkNlXDqzDCuWIKphqJKQzJbg1WeJPs19D
         J/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738592771; x=1739197571;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qwfs5ZTiLlNTPpq6GVEveYLjOMUtMGx1iY3Hoyz/gnI=;
        b=WiOZ5z45dopawUim527+cip3tfe2ceY3nFDHEUKFYb1Bi8PR+WSzkOmEJ41Piido2i
         74yI5i518TGUdGFRh2OFEaAz0V5Ihrx7zy7MbhISL2Ht5Tt5CaTs/uKMoHS1ipmS75Y5
         iPSHl12K4H3OXV+o2Yf6ldpUKASL1komGbZjfESE+tp+cssMH3iRgy3SrmiQ66sX676e
         4+OLI8NeGJJRHaciSWFwOJIJMFKn+EYI6zI+tuM9fUreFfdm2e549BbsV/cStVjcV+B6
         INpfznN10nTeE973x00EGRZA/SNL7/IUZ/1yZkQ+FBph/+BClMV0H6ZSkP5AC5M+lkUz
         WMnA==
X-Forwarded-Encrypted: i=1; AJvYcCVo6rfOzoQHS8reD2Z8abm0Ozx+q3QTyXOsq6CNABpqUhL7Wf9qkWLMhvdsf728j8VHfH5qLsi5nQjGCXI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWrZe9knIVsBQKOzbA3YAu++bscWkLwv3laT/5qacY4+8bDwHN
	TvLXCzJ8uuoh8cneBejdq8hDn/R+izVTzsxWsrWkz4lWXBKO8EVxUW07HR5tfg==
X-Gm-Gg: ASbGncs4SVBL0w3yrW0yMeroOQ3xhtLWBwrrHjdDFI2WOO/riBBsi/vTh3tm/ms/feQ
	Ndk6htFNQvTb/WYB5mOW8IhAMXymf1FMQ6f2THwoJl3tkR6RzbmAP9VHRJgN6DBKN2gGNjGkQLN
	VZ/+jkm0g/XUoKNHBYkmAMSd45cZzDTn7Rtt+tFO56vHgRbbcSIqcFArfLGU3NdHjdYQ8pIG6aS
	kGWU0AqgGG1evrjHfoeX5igZY5+trH5vGN+5LqHmuCBM7YzIDShnmunntVSZhg2vnfAyU8s6PqN
	qz8Kx3UZl/2+pdFNWwEtik51Bw==
X-Google-Smtp-Source: AGHT+IG8vvs+euO/ez1FxBukXMJbsbYt2P49CFmVm6CSf7uQjAXZ4KTRY4SvUqVfvG4OF84t8Yabqg==
X-Received: by 2002:a17:902:cecc:b0:215:3998:189f with SMTP id d9443c01a7336-21de19566bemr244795305ad.6.1738592770645;
        Mon, 03 Feb 2025 06:26:10 -0800 (PST)
Received: from thinkpad ([120.60.129.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32eb995sm75748215ad.148.2025.02.03.06.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 06:26:10 -0800 (PST)
Date: Mon, 3 Feb 2025 19:56:04 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	konrad.dybcio@oss.qualcomm.com, quic_mrana@quicinc.com,
	quic_vbadigan@quicinc.com, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: x1e80100: Add PCIe lane
 equalization preset properties
Message-ID: <20250203142604.mh3vx2fzrut5wc3z@thinkpad>
References: <20250124-preset_v2-v4-0-0b512cad08e1@oss.qualcomm.com>
 <20250124-preset_v2-v4-1-0b512cad08e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250124-preset_v2-v4-1-0b512cad08e1@oss.qualcomm.com>

On Fri, Jan 24, 2025 at 04:52:47PM +0530, Krishna Chaitanya Chundru wrote:
> Add PCIe lane equalization preset properties for 8 GT/s and 16 GT/s data
> rates used in lane equalization procedure.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
> This patch depends on the this dt binding pull request which got recently
> merged: https://github.com/devicetree-org/dt-schema/pull/146
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index a36076e3c56b..6a2074297030 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -2993,6 +2993,10 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  			phys = <&pcie6a_phy>;
>  			phy-names = "pciephy";
>  
> +			eq-presets-8gts = /bits/ 16 <0x5555 0x5555>;

Why only 2 entries? Isn't the property supposed to define the preset for all
lanes?

Same below also.

> +

remove newline here.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
