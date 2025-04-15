Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DBAA48
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702905; cv=none; b=bou+P07ArV/FQ23b2i1VuTZ8n4t8mo42hKldhPbnMrbLz6xgHbB7mhc9wj/zCnlBHdg77mkaSbOZa11xzFevExYxNV3B50pFKwRbmCgTamcQbBda9U39+01jtUxv1W8j/A6XzqhXFkgJJs1xRvSBR5R4yuB++OfSnXkGy03RkoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702905; c=relaxed/simple;
	bh=YL5QJ110xB5bIstZFqLfAhe6+k8X5YNSR1kmNf8Sb/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tuv8zx8hznDhXiK+VJTfKv1b7nqk7DTQfoO+0i/R0MZzqBMg4OnCTzkeriEM7SM334p4NQBiGWxQWewtiODgyOJK0aJsXMynvR6s5M8U2o0iaAs/joZqHBM4QYix+++P5wqBWjdNZa2Pu7OYgWy5Q5W3CDJuV4Y6Xh0IZ+muq48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ON63hOS+; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ON63hOS+"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-301918a4e3bso5268369a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 00:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744702903; x=1745307703; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OAto5TMsyfm0PnIWFCrMK2YomypnAVk8abWD+aRoNLw=;
        b=ON63hOS+eyH/EAiaIay06G0QAqs1s7XB2LSLl146SotkR8kx2/1kiPqpSTDQ09O+HD
         31UsPWK5kFrGN9oDrf1vGOp9jLCmBS8Xlw8oNXEhN359r1SPKnR/zdyD9cbf+PTGBx3h
         y+B/VGkjmEXPxvtxIBscNff90XFueT7F9VFXA6Qli+tO02nGPkWCMg0JAgXG4dSGd6Fq
         3mOKt0a/D9yi4roHx3gyVkIdycl1TQGdfMSOX0oQMcaguRITDi8+uzh+9zdHJqfXfsiD
         98vRuRt2gF6JtToY+iTer4r0tdEKeYeu3E7H9RZ53jeWyd6rhAfUlEMkA6t0KsIyMHfY
         kFuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744702903; x=1745307703;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OAto5TMsyfm0PnIWFCrMK2YomypnAVk8abWD+aRoNLw=;
        b=lxGCbd5UHF3R8WRyVirTOhOMMU96sPi+8jDKO0LdxMB/plAIDw5xLQoGYVGHFEqYIA
         aH8eYXUlDczFlwdbGQoFXYI3asdzKjFu0kbcX+Tx/71urTmZXE3oERnjZ1le05Z00MEo
         I+8OzDJogBlkKMYaD9f/kyK1RlNDSl5fQU7Agf+FYMx1RPmAjgNM7CZEPu1A7p727PZj
         cfu7FB7TXwy2J68nrZ/OziEhuMi9/YXtCXn9CIEXmbiygNw8aaPuExBIVGwOgaqqLQZ3
         zRy6dgb1AYlofnhx22Gjf7cL60aHwvKGl+VL+l57cd5TK1aruXDQOx+FB0jKQuDUti1i
         GSFg==
X-Forwarded-Encrypted: i=1; AJvYcCUaw9PsMocPRZMj0JKIvPHjDFK6JJOEyWegTwQzWw8gHcUJ1yOQ+DzJhStSdt+LB6wOoApPkbegLTDIDTs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIzklATltTBKztDyYZoG/KwOCt4oomA1RgRpSebeAUYg8+Sm79
	GNqdcHYnMkEsl3Bmot5Tdfcwc7NIJoPCP7FsuiacGR7+qMH4UYvJfE2u7nVl+A==
X-Gm-Gg: ASbGncuDza/+rBiGJhHcNX4EWkO19WmSdZT6ppsGpqsteTrCT/9I5DQ2MBu8xcUMlSt
	sdF7FzJYo/RMVbdQouu37LwELhwRFMtCL26IsKsDgHZ8YDaLD0vq/Bxl8GTSdBRuIYwHFkQ2Ljk
	fkh+dvPr+lWgw/wlpbVBtZjNFMhwZve9JRfFKP9HbJinh7xyKkRtlbecoPFsf+JFS4DDuXbmEXs
	HqPcgknJl9xf4t6npYTT5/Ocatl6QnLgUxjZS9r9ZMs+lQZG9dbVH2snG+ePvsH7txAUxB/l7TH
	/aaCIqVsm7wCqmSWEl4nKhi5HWJ1jMOaNa0sRJLWvE2TBTC1gg==
X-Google-Smtp-Source: AGHT+IGKE+4zKM94UuTJQK/vyjfN6oxik3zVIACkmE5DFSJGrhrXSedhBxQ3pi+f1PJx7Y4YJ1fP+g==
X-Received: by 2002:a17:90b:17ca:b0:301:6343:1626 with SMTP id 98e67ed59e1d1-308236281f7mr19205173a91.1.1744702903554;
        Tue, 15 Apr 2025 00:41:43 -0700 (PDT)
Received: from thinkpad ([120.60.71.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd11e6c8sm12572515a91.14.2025.04.15.00.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 00:41:43 -0700 (PDT)
Date: Tue, 15 Apr 2025 13:11:35 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Caleb Connolly <caleb.connolly@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_vbadigan@quicinc.com, quic_mrana@quicinc.com
Subject: Re: [PATCH v2 1/3] dt-bindings: PCI: qcom: Move phy, wake & reset
 gpio's to root port
Message-ID: <tsnvoy2spr2dtqt3q2cnvl7rxobjgcgxntxb6rjtjdeej625i5@35je7sp3xqea>
References: <20250414-perst-v2-0-89247746d755@oss.qualcomm.com>
 <20250414-perst-v2-1-89247746d755@oss.qualcomm.com>
 <ody5tbmdcmxxzovubac4aeiuxvrjjmwujqmo6uz7kczktefcxz@b6i5bkwpvmzl>
 <6db146b9-ad63-42c7-9f33-83ecf64ed344@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6db146b9-ad63-42c7-9f33-83ecf64ed344@linaro.org>

On Mon, Apr 14, 2025 at 02:50:19PM +0200, Caleb Connolly wrote:
> 
> 
> On 4/14/25 10:04, Dmitry Baryshkov wrote:
> > On Mon, Apr 14, 2025 at 11:09:12AM +0530, Krishna Chaitanya Chundru wrote:
> > > Move the phy, phy-names, wake-gpio's to the pcie root port node instead of
> > > the bridge node, as agreed upon in multiple places one instance is[1].
> > > 
> > > Update the qcom,pcie-common.yaml to include the phy, phy-names, and
> > > wake-gpios properties in the root port node. There is already reset-gpio
> > > defined for PERST# in pci-bus-common.yaml, start using that property
> > > instead of perst-gpio.
> > > 
> > > For backward compatibility, do not remove any existing properties in the
> > > bridge node.
> > > 
> > > [1] https://lore.kernel.org/linux-pci/20241211192014.GA3302752@bhelgaas/
> > > 
> > > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > > ---
> > >   .../devicetree/bindings/pci/qcom,pcie-common.yaml      | 18 ++++++++++++++++++
> > >   .../devicetree/bindings/pci/qcom,pcie-sc7280.yaml      | 17 +++++++++++++----
> > >   2 files changed, 31 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
> > > index 0480c58f7d998adbac4c6de20cdaec945b3bab21..16e9acba1559b457da8a8a9dda4a22b226808f86 100644
> > > --- a/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
> > > +++ b/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
> > > @@ -85,6 +85,24 @@ properties:
> > >     opp-table:
> > >       type: object
> > > +patternProperties:
> > > +  "^pcie@":
> > > +    type: object
> > > +    $ref: /schemas/pci/pci-pci-bridge.yaml#
> > > +
> > > +    properties:
> > > +      reg:
> > > +        maxItems: 1
> > > +
> > > +      phys:
> > > +        maxItems: 1
> > > +
> > > +      wake-gpios:
> > > +        description: GPIO controlled connection to WAKE# signal
> > > +        maxItems: 1
> > > +
> > > +    unevaluatedProperties: false
> > 
> > Please mark old properties as deprecated.
> 
> Since this is a trivial change, just moving two properties, I don't see why
> it makes sense to deprecate -- just remove the old properties, and move over
> all the platforms at once.
> 

This will be an ABI break. You should not remove properties all of a sudden
without first deprecating them (even if you convert all upstream DTS at once).
ABI is for older DTS also.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
