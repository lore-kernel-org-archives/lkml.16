Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77194B1E6E;
	Tue,  6 May 2025 16:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746548233; cv=none; b=r6+7xvmfjxQtWnCN978ZnyIWhRDy9sYb3tbJW5ILn4COBM+5xaQQfppqf54Y6Fr83JTYZdvIIW5t6gqt0XszP7I3+oWRPe9s76+RCDY0n4L5MCO8QUKgGdhCmvf+ekhapC2Q9cxKrOQLtsv8Rsf1aPYqx6VwYmmxX+b3lKtKFts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746548233; c=relaxed/simple;
	bh=uQPdaamYV9M4xKVTFpX4mjBOoGc+R4PojMb6xlT09Dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S09BLpD3TwLqyI5y8+/F/Y6YkKflJQnjllgh6dJ1QLFHbck60KaU3/a6jNPxZyI4tk4jSBdLRkuHz04UnwhBQELFWcB2gSv/oi30eKu2pjeWAFiuvb4XApbiNnEarv8xB9oOI/ZVEWr/sXxutd2jfSQaCoPgeR8jR7l2OkovOeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X7kXtVwq; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7kXtVwq"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so210355e9.1;
        Tue, 06 May 2025 09:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746548230; x=1747153030; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=63U4JScT4wShQa1SlDVp8/2lKwq9BUtSNd6QocbAFgI=;
        b=X7kXtVwq9tl3mnr33lurfzkaZDXiyJ/XBPE1H4+5X3/ZjcMAKk6/Ssz09QtXzPBfqK
         DIVc0X4ySFRPaEoieF3TvDuikEDkLVW0dnmgfhuQI1vfV4OICjuQOKqQYEmo9zojIGkn
         rePhig1ocoMFdNbEsvCTFsyHcCtWgtESRNAvCdTeEIm5LcTfqBkLoXciBfgXQMpYuHxA
         ykH3LyB2ZCkmnRZxWXCBCrXAJanYiB72JQGqAk31r/GQ1FvL20v5s7AIwlBiUPSXQaqN
         T1MEUv6TmMa+GOybDH6AVz5LRIxX+olg41Ky+r3+UqsIZyMdi8ft6AJH3pFd7oIjnBxK
         BzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746548230; x=1747153030;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63U4JScT4wShQa1SlDVp8/2lKwq9BUtSNd6QocbAFgI=;
        b=N/23W/vRfsog/4a+Q0WTos/KjWOS6cORCuIrf6+CtHN4gREA4A81yayZ6tbkL2PPjb
         Lg5FRmO6rg1rO39SLhvlMMjFOpf1nZq1jG2MmzrqCmSF+dmFx8wTNQuz5EUVZDTCto4Q
         on+5EQrCX4TyBIWYEoJOLCc+uhh7p0QsP9It4j+K0wk4/VjaXqgIONabhu7BotQsxNEV
         GaVd+qjTFYVBdyEhjgoBwm+pl/iCGAHiKjRZZfv31PUYYPhIB7Whf6EUjIcHinpqeC2S
         7t7hHfeG6hWgWTxlVVwTV3unf/JFYlPJZQ+rJ7cwyaKNU8SGuAuHfV14Akklah7Ftjlo
         PCUA==
X-Forwarded-Encrypted: i=1; AJvYcCUgqrzzYDOgOMFtA0lYJC7UXAunn3G5P8fuFvoBHfbAY6rZ0WQ/v0VFPmyxSjC3OojeZEAVlBPC5RmrpDnM@vger.kernel.org, AJvYcCVlUW+RG03iGAJ32vWAX/GwgpkWY0HQPElv81Yo+0eZWFEhUZSnMyVS/3a0wPpBM+YQxkyrdoBWB0ii@vger.kernel.org
X-Gm-Message-State: AOJu0YzYhNMnH7TGD91pR3EHYm+ebeqekvgnbgjHsMBGRCEsyK9zZFnn
	zmCox96PkGKrEri8k/SDHzfbJpvnGOp8cNJ4QBZkctU+Fx5CNOnX75VYLA==
X-Gm-Gg: ASbGnct0kPKfB+uLrrBp+nrlpTO2qO4DStWHQ2qHewYwpJ2fbnzjSagQi+cQYiaoiDy
	jzcSTLiyXxhn2EQjW5l5p/Xq3Wp1t+kT4TCQn4IH3DLWKcGBJHvR+whct6svhQfIXrFZhxGsX9b
	euEl/EMKB1zypG/0IufzC2SCVZhFZSmt4wzZpr3mQCTyVNjPYDU84fPrGt/n+V5cIx9oI2IXLga
	7MvMPMGl+dIiwQnVaJwqDxRAPmNH7aNOqSItxhSZ7kpBDMmQJsldqAXvmCoiimkhn6D3lx5IVx0
	TTWo6G73sBVxuB/LfEmRUZLDpEMetMiPn//vmWUGTj41YJ8OIPpL/T4TMusQuWRsnyTloOQ+h3R
	AgPOS
X-Google-Smtp-Source: AGHT+IHgdJOIesoussHLZPwsDGBbdv/91+ohZlpgtmlod0hn4+4fQzPPoWrxLXhD/T/nyjndpxy+jg==
X-Received: by 2002:a05:600c:4d95:b0:435:edb0:5d27 with SMTP id 5b1f17b1804b1-441d3a49cfdmr3022755e9.9.1746548229688;
        Tue, 06 May 2025 09:17:09 -0700 (PDT)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net. [86.9.131.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2af2a9dsm222380445e9.19.2025.05.06.09.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 09:17:08 -0700 (PDT)
Date: Tue, 6 May 2025 17:17:07 +0100
From: Stafford Horne <shorne@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Convert
 openrisc,ompic to DT schema
Message-ID: <aBo2A_SsUdeuH7UQ@antec>
References: <20250505144813.1291810-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505144813.1291810-1-robh@kernel.org>

Hi Rob,

On Mon, May 05, 2025 at 09:48:12AM -0500, Rob Herring (Arm) wrote:
> Convert the OpenRISC OMPIC interrupt controller binding to schema
> format. It's a straight-forward conversion of the typical interrupt
> controller.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../interrupt-controller/openrisc,ompic.txt   | 22 ---------
>  .../interrupt-controller/openrisc,ompic.yaml  | 45 +++++++++++++++++++
>  2 files changed, 45 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/openrisc,ompic.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/openrisc,ompic.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/openrisc,ompic.txt b/Documentation/devicetree/bindings/interrupt-controller/openrisc,ompic.txt
> deleted file mode 100644
> index caec07cc7149..000000000000
> --- a/Documentation/devicetree/bindings/interrupt-controller/openrisc,ompic.txt
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -Open Multi-Processor Interrupt Controller
> -
> -Required properties:
> -
> -- compatible : This should be "openrisc,ompic"
> -- reg : Specifies base physical address and size of the register space. The
> -  size is based on the number of cores the controller has been configured
> -  to handle, this should be set to 8 bytes per cpu core.
> -- interrupt-controller : Identifies the node as an interrupt controller.
> -- #interrupt-cells : This should be set to 0 as this will not be an irq
> -  parent.
> -- interrupts : Specifies the interrupt line to which the ompic is wired.

I guess this extra documentation is obsorbed by the fact that these are all
standard fields?

> -Example:
> -
> -ompic: interrupt-controller@98000000 {
> -	compatible = "openrisc,ompic";
> -	reg = <0x98000000 16>;
> -	interrupt-controller;
> -	#interrupt-cells = <0>;
> -	interrupts = <1>;
> -};
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/openrisc,ompic.yaml b/Documentation/devicetree/bindings/interrupt-controller/openrisc,ompic.yaml
> new file mode 100644
> index 000000000000..4efbfba3aa6b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/openrisc,ompic.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/openrisc,ompic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Open Multi-Processor Interrupt Controller
> +
> +maintainers:
> +  - Stafford Horne <shorne@gmail.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: openrisc,ompic
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 0
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    interrupt-controller@98000000 {
> +        compatible = "openrisc,ompic";
> +        reg = <0x98000000 16>;
> +        interrupt-controller;
> +        #interrupt-cells = <0>;
> +        interrupts = <1>;
> +    };

I think this is ok.

I will queue this via the OpenRISC queue.

-Stafford
