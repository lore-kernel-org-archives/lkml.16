Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE76B1F130A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 07:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744182382; cv=none; b=Z9A8Mr518jcrRy6Lanf4Zqb13JLXpcX7xRtBv0+1bhqW6F47TurbPT9YD3Wae5cfwOLoVDQl/WZHBnmoTlD4rtKmLHi5owJz1Kc3rZjlX3y1jaPgc2+UTkOOO+x4d11SKQECpzXrABOs6fOha1BxIrloRR6D4oESc3/v9PbnQHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744182382; c=relaxed/simple;
	bh=yS+f3fqEzIoMXoYigNyYL1iRCbrDvUkMQNrAccauF30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QCMQDQyl0tQ2c8HO6ixRLIQHReENaTRSRnVQOlwvPz1dwoiW2B5gzurFXWtTjHEqNmUlNds9dHolP7wOgdfsWpIgK/ZfCe0lAi37B27bOXvuJqP0DeoIxSo2jNlEXhz37hKJ6guRgNoTF4s//eUzgowuFRcqucBN+dmY6mfiElA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PrD1SWNd; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PrD1SWNd"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22438c356c8so61990925ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 00:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744182379; x=1744787179; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Nm7nG2cOghl5We3pl16VQKS1/9Lv238uk1E4idOp5vQ=;
        b=PrD1SWNdTtPZUgQjRNif2ls9MubJr9v7WpJMbQBGMplnDg/ESsiWZdjv3qFwkjXX84
         lONLGQro2/xnruJpKObbR0aS2CwXuG+xYN7mEDe6swzRcwdKYHIsV0Tdsf7qulqmhtGs
         Cc8rW41SvaR0djm60tukZRnm7/UJwVxZfwxkgxrg3Tr655x/wfxsO4clFVrmI7HuSYf/
         de5vws9DkS4T4CONHe/9F/zIFWKLZezzppEir0ux2e3BT9qXb+QxEmfcGt7X0//8ObMG
         o9xHdnnb1H9q0Krb0GTqrwVDZp/zBjXN+7WsSUD+qKjqcbBhQI5bcyCIkorcYa4Wfe0y
         Ch+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744182379; x=1744787179;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nm7nG2cOghl5We3pl16VQKS1/9Lv238uk1E4idOp5vQ=;
        b=oHGCcJLnCLU8nM0nLogANIh17NpbWFdlmxPWIcMrd54LuM7Jpa6fK/IJz9TNm8WG+J
         XxtfMcjeMJHJqoIdQbTUzq8Lk0sNLzvrebFvcmhMTe86dJUME/NI2LEE7tn1RvL2EOzQ
         bcwPii0tZ1i9nJSgiwwcutr9D+n3W3iqtdAikaUWnZ0IKCIdBOdXuEzafnbqBREuIpcS
         aCqf/UEs3M2RbJ2Nl8Gu9/zlPw7V/7kJSKbUxgAbVZKW3SlptGyICaDN89W2g5eFP1Tu
         rExR///4LtFlt4n0h6O83M9jkaowogwxVwtpvi+W4CAYiEQWS4XIZV7E+9fOGWtKEZfr
         4ZgA==
X-Forwarded-Encrypted: i=1; AJvYcCXvE6wzu7y0X9okNCl2ohoky0J5Lia4JEw9OJmIwfhg3HQ5R2Z6iKTWVQYuWjVKnBmVb47IBHDorTrB5Kw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDDYBC024mfAG/TItfMEV4CzvWh1KlmJu2ZilxgZE5n13HIGY6
	LDJ4hoBP6JUT33XkwDBSMaoTTv3n+SWG4CS9MHEnjmWsGdsBnrDYAVTDaZmlVQ==
X-Gm-Gg: ASbGncuRQI0pY3o1u2D8ixYjpO0iJY1xYIE3MIMe9PVznb6KYeY7W4Iuh7dE2L0r7ze
	hIuLdsDAWFlMqiXKLWPyyquVl/j4U0FJy/fou3XcCiTJ07o8ZDf7w3REQfBYcXPqu1VrJWZ3zde
	BzIvFXO/IWZ0W97vr74x2h/YDdRfh7PXw+bNclM38xilkbjuHBUS6aZiY9suZyVUlHKUll7ciyy
	uYUa0KsQYQRCeA+iy84NdJQ27PHtxPn6DalM54ZWiDf1FH23Pm+Nb6plKbyl393LibbBT9UYJLV
	ftU5MeCpyITVUyc3nOlzjLW/jeA+EOSBV64Y/i7DeyZ6sjhpErU=
X-Google-Smtp-Source: AGHT+IG2IBbUsP4jpyoBsAQl7I0S2iGdcUbnYfvvANGYcDIZAtyYHJ27CyPFx40ttshkAUckDfLO7g==
X-Received: by 2002:a17:903:3bc6:b0:224:10a2:cad9 with SMTP id d9443c01a7336-22ac2a2991bmr35596635ad.41.1744182379003;
        Wed, 09 Apr 2025 00:06:19 -0700 (PDT)
Received: from thinkpad ([120.56.198.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb5047sm4544815ad.170.2025.04.09.00.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 00:06:18 -0700 (PDT)
Date: Wed, 9 Apr 2025 12:36:08 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Jim Quinlan <jim2101024@gmail.com>, 
	Nicolas Saenz Julienne <nsaenz@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Srikanth Thokala <srikanth.thokala@intel.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Greentime Hu <greentime.hu@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>, Michal Simek <michal.simek@amd.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Tom Joseph <tjoseph@cadence.com>, Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/2] dt-bindings: PCI: sifive,fu740-pcie: Fix include
 placement in DTS example
Message-ID: <3cfkeludmigojzadrgyxyidiydb3mx6yqjcvmgpbhdk75cflog@66i4zpvjcwzv>
References: <20250324125202.81986-1-krzysztof.kozlowski@linaro.org>
 <20250324125202.81986-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250324125202.81986-2-krzysztof.kozlowski@linaro.org>

On Mon, Mar 24, 2025 at 01:52:02PM +0100, Krzysztof Kozlowski wrote:
> Coding style and common logic dictates that headers should not be
> included in device nodes.  No functional impact.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
> index 844fc7142302..d35ff807936b 100644
> --- a/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
> @@ -81,10 +81,10 @@ unevaluatedProperties: false
>  
>  examples:
>    - |
> +    #include <dt-bindings/clock/sifive-fu740-prci.h>
>      bus {
>          #address-cells = <2>;
>          #size-cells = <2>;
> -        #include <dt-bindings/clock/sifive-fu740-prci.h>
>  
>          pcie@e00000000 {
>              compatible = "sifive,fu740-pcie";
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்
