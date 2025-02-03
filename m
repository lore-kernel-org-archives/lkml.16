Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1105C20A5F8
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 16:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738599412; cv=none; b=SUQQgtoajktxIkRZmvkM0JXnQdnejOsafzv5uBZlxRmE3A2yllLIwZ85XeQfqLksG1+E0iOG0hlrUHfcoT+fkWHOtKa355gECjL6cueCQ9BXp8LYkdTunkf7plfUfLuSUIWJbksObGCE4KoDlamiMrnSZnx526+a2QOBVNnXdBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738599412; c=relaxed/simple;
	bh=erhTwVPsLXivFVXTanoN6EQD7Qcx9B1QNR5p4w1Yt44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e20L5mqM/rhCwoK1lRZ2KKkAcGPmPBT4Pj4ZIOiQyNlzdzNRlXukJkdNxFbSyl3KKSsCtDB09E8BboNhNtTraRuyAyfGUW3+hdvA3lfE97Z8oZSGacP/ePhy5usnRx31fE2P0ZpXh6HpTlSZhl5b3iY7R5R5c4tU6m9a9yNJckw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BoHQLHD8; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BoHQLHD8"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21c2f1b610dso106077955ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 08:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738599410; x=1739204210; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6flYFTaf2FZxbVF3ZCOxc2I7HjIzsuP1MXEjy7hroyk=;
        b=BoHQLHD83QOQu+7YB5jQPWX/hL19er1lQJt0rbfOdPzGLItwYAu1qUrk9ay8H0EfmL
         q0m7xMGH80Za4m8M5zgZlE4BA8vHUHfLF2q6QKoL/SAYmK/uextByv5PIeIMakUrLM/f
         x6SgxzTW3Bw4ovSTctyz+a4/tkoNBAlpKLEBiPNpZhfu2FNU24oePZFXKjYf1sUUkVZ3
         lL6Grj30pm/oxPxA5VGoo68IC08OAkiw3MxV4OCXinSidMeQpb/sosBMPPx1l/+hrruc
         8h1E1+nlUwq0NcEKobuWCm7s7te4KfM7Q+ZnB2uvoIq5FGS+2DH0NlTQtLpZly2OY+JI
         Ivhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738599410; x=1739204210;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6flYFTaf2FZxbVF3ZCOxc2I7HjIzsuP1MXEjy7hroyk=;
        b=QBwhcVClm0nmz2dZ88EBq/HQtAhUh3tOr6mATxMwqK60ErmUOJQgHodsIE10rZZe+C
         YBDiwicqOe9OJceD02NHm45hp/bHvywrFyMTbfyQHRsNQyH8pWeiSDHysGgbczkBhK+y
         oLv4Eo/1y6uckZXYLBVnPNeYGA9OaQmYxecNNr3+1V+ZJNlY3MYyIe2DZnLIydMNWQR0
         LHcwQ0BE8PgkFjnNiDk1OwWPpNKg3zQlhAx8Wc8uyc85Fb5RB/L2OyH0FEP05BH8s2Gg
         nMwkMivdJdITkfFMKrenBHuq7/eMIUDkONfgYnC7808o9imf223oVgzFcmFzk8+Ag1rw
         1W9A==
X-Forwarded-Encrypted: i=1; AJvYcCU/BCSEsY/qNprizNu+15cHNZueO6TJLYFZSF7c30Xadd9aFXnEm5JfBrvcmMqUuGuWBcsIF2HgECmVdcA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8yWQwzfR0470JfzreJw8ySSKVnSmTop2BIgqrJmHHjP/xzAA7
	b05FZsaok5kZRSOk2Ji3SM4taKC8M2qopugyPXvnhnwvtxdZB5YFRq3ghOHawQ==
X-Gm-Gg: ASbGncsQMjzAFN0q3TpxfN2oy4PIdlAYFyNxvv4l4R7J9Ef6YveVv/KE7kvNwEU8eTw
	+gaMDui0TtG/2QknKqjBn+3DTXYA2t/6NWDaO3dpA/ONsiPsPJCiXg5xTWd34OJFCJicTDDxIrP
	slVZXTiH7hWMJBgTfIL1vehLc6Gv3hc2AA0vXsRAz5oFjwK2Bt0l3/Fu6N0OFvVSUzeUsjCRSmu
	C3CujNOhQCQhJJB6AJzrVAdOKoA5Q3f8TZckHP/0Ae5Q58cmhVfLSqru2oKEtNAF9p2Eo2PlbYO
	NvFNBgIlICxRqMQ8mHa3h/+pdQ==
X-Google-Smtp-Source: AGHT+IFVZMlh6cYlSlFoHEwxzXAOuYn28wRS6kTbfChhspc03x0TeQyb4e1aNIvAKSJnT3jHJ38A8A==
X-Received: by 2002:a17:902:d48a:b0:216:4064:53ad with SMTP id d9443c01a7336-21dd7de20f8mr385506735ad.48.1738599410161;
        Mon, 03 Feb 2025 08:16:50 -0800 (PST)
Received: from thinkpad ([120.60.129.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec0479887sm8145679a12.52.2025.02.03.08.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:16:49 -0800 (PST)
Date: Mon, 3 Feb 2025 21:46:43 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	vkoul@kernel.org, kishon@kernel.org, andersson@kernel.org,
	konradybcio@kernel.org, p.zabel@pengutronix.de,
	dmitry.baryshkov@linaro.org, quic_nsekar@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v7 3/7] dt-bindings: PCI: qcom: Use sdx55 reg description
 for ipq9574
Message-ID: <20250203161643.n2dmu6yg6rb5lp6u@thinkpad>
References: <20250122063411.3503097-1-quic_varada@quicinc.com>
 <20250122063411.3503097-4-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250122063411.3503097-4-quic_varada@quicinc.com>

On Wed, Jan 22, 2025 at 12:04:07PM +0530, Varadarajan Narayanan wrote:
> All DT entries except "reg" is similar between ipq5332 and
> ipq9574. ipq9574 has 5 registers while ipq5332 has 6. MHI is the
> additional (i.e. sixth entry). Since this matches with the
> sdx55's "reg" definition which allows for 5 or 6 registers,
> combine ipq9574 with sdx55.
> 
> This change is to prepare ipq9574 to be used as ipq5332's
> fallback compatible.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  Documentation/devicetree/bindings/pci/qcom,pcie.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> index bd87f6b49d68..413c6b76c26c 100644
> --- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> @@ -165,7 +165,6 @@ allOf:
>              enum:
>                - qcom,pcie-ipq6018
>                - qcom,pcie-ipq8074-gen3
> -              - qcom,pcie-ipq9574
>      then:
>        properties:
>          reg:
> @@ -206,6 +205,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,pcie-ipq9574
>                - qcom,pcie-sdx55
>      then:
>        properties:
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
