Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA17263F24
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097732; cv=none; b=L+vWeKAaJzBSLP8wLEMkYVnTWY21kFkD1v34cbRr5JfT5iv8ndjmTamC6fs8qDOvT4eICLaIbqSTKD7m+lDJO1IjPRXMY7qxpGzy8ln2TvYf5WJyegfDqFZsJLEZPT2/vJ/PBxfRV1h7bBNhaYIgHyZ47F8o0V8hZhOO+uHeeKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097732; c=relaxed/simple;
	bh=lT5mKdSlq8oPEv2oBvQ90+eQd2L1YXxqPfN8R/eFRE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AE4LVRUKxtcZ3eX1Nv5NLxdpiwlJpndjdyDZDb6H5wP4t+4uiNBakckBE3bQ1tEiAUwDiL9tJQ1wB4CP3zbdR7vsW+/SmbrGr+5Z2kF8fBX7lyrShdn6OPcT9jzHe1qvrImKE1DQ13iKc+lgaIuh0lesu68561PZdTSB0ItrN7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JnQWSaZx; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JnQWSaZx"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so23014135e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 00:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744097729; x=1744702529; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bzDOAHoHmGJFY2C4m+oCbnEJZ1yOWSsgLDpINkYOwtw=;
        b=JnQWSaZxGQ8u8bxeKuhWxZtROTpv1UdpcKMxAlked7NqrEL0rYhgWe+0+UsT20yj5E
         9fyMpx6PhxHne4v/PcNgkVnApKe3Zof0j71+YGACPwufsRkvTRDp/Emqf/nJlWOAFka8
         AE4r9Yhzbhw54PnJKao38xgS4hmCmFdBzj8IF039TdTfHpIJf8oMdcJZZPYfdhuEtTIS
         kzunyLWUxK2zNSCTnaSUaWGJC6rTNmxJPlU3GDUTSaclpwcn4j/jGC7GPS1ojp0OWLbd
         r3pgsEYHch3JhztDjZ5OsCFvgZ7txmUlugPImCiHwiTjS7VkV1Tj3+ZwzM5Ee3VHczXK
         Abww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097729; x=1744702529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bzDOAHoHmGJFY2C4m+oCbnEJZ1yOWSsgLDpINkYOwtw=;
        b=FkjBb38RlxL3IAwHKNka1FCTMxU73BPkfFu59q0qe7JEfcsSabSTi9t7Dj8U05onJJ
         k+/6Yb+88Udn9G2LpKG/SUSPGiTXUFGdltjlu4K6nJ2249pKphPK4G8m6/62MlydcPLm
         th59FPhkt/8sWKfKqp/anj4KM7m78f1NpcistjmS9vMJzR5nm/ji2vRO9SmNrji8f031
         RZVOU0eoeKhWIhnKjipmGkjWjAaoO1rYzDZKEzVdhbcDxf5aXw4/R3TWwNn7G6VS6UpE
         STkonDyrxd4nSXGrVnK/QvJv1dihbKBrZnQcQBVje8b/0+ey3BnH/kcRXSa7pnDNoQry
         HUcQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9v6mRK7jyiRw5BNimM4mwgEbb1e5bjepZ4v9b2JvuQqrC4M7NjPG6rvZja9w7ZiyBxEgj24Q0h4woyQM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpzOyO2oalRiscOKGqOwK6tfZfnPgdS9GxjD1bBx5TCvhLVrNV
	qIHb4f0u7+DlNtcL1dMDq86shREBGoOxxfy8M+HZnmWeJ2Xbcbl4y0I8o5lObCk=
X-Gm-Gg: ASbGncvH5JvOgzczFjrWTObZrZEqC2nA+aiPzjzNRCXko5zQccHxLvCihcG83g3aDD3
	XrFy8E/lnxnYjDLr3szgHvLTwhNpHV6pCerKJRviXJW3NeVVq50+l8d+ppgyQouINBCeCAdSYzp
	rMHgf3I0OLj4dOxphGft8QYPZgqVxqYubTpYxy3fpRzlaPjRjlUeul+0su7S/c7wkx0d8V/iv6X
	LozUclV6hwANfrAokYkW5fP97ot15pSsJXwo3RC6dHTQW4US5s3EQ+gXaNPCFNEFyDlIt6lwL2n
	mc+S2VFBSAPJRxIPhhqXKMBOxJa7Oj3Onvr6KWtJWVs=
X-Google-Smtp-Source: AGHT+IHJ4HfDuWG19jV3pAC/z0UwKWS4vohMre2m90wxX+hddBFsMJUEGHrkQ7C6iLrYU3yh7T2Htg==
X-Received: by 2002:a05:600c:8719:b0:43c:f85d:1245 with SMTP id 5b1f17b1804b1-43ecf8e7321mr170671655e9.17.1744097728808;
        Tue, 08 Apr 2025 00:35:28 -0700 (PDT)
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2ffsm151346185e9.22.2025.04.08.00.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:35:28 -0700 (PDT)
Date: Tue, 8 Apr 2025 08:35:27 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, virtualization@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: virtio: pci-iommu: Add ref to
 pci-device.yaml
Message-ID: <20250408073527.GA2279090@myrica>
References: <20250407165341.2934499-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407165341.2934499-1-robh@kernel.org>

On Mon, Apr 07, 2025 at 11:53:40AM -0500, Rob Herring (Arm) wrote:
> The virtio pci-iommu is a PCI device, so it should have a reference to
> the pci-device.yaml schema. The pci-device.yaml schema defines the 'reg'
> format as a schema, so the text description for 'reg' can be dropped.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  .../devicetree/bindings/virtio/pci-iommu.yaml          | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/virtio/pci-iommu.yaml b/Documentation/devicetree/bindings/virtio/pci-iommu.yaml
> index 972a785a42de..8bd6ad72ac7a 100644
> --- a/Documentation/devicetree/bindings/virtio/pci-iommu.yaml
> +++ b/Documentation/devicetree/bindings/virtio/pci-iommu.yaml
> @@ -20,6 +20,9 @@ description: |
>    virtio-iommu node doesn't have an "iommus" property, and is omitted from
>    the iommu-map property of the root complex.
>  
> +allOf:
> +  - $ref: /schemas/pci/pci-device.yaml#
> +
>  properties:
>    # If compatible is present, it should contain the vendor and device ID
>    # according to the PCI Bus Binding specification. Since PCI provides
> @@ -33,12 +36,7 @@ properties:
>            - const: pci1af4,1057
>  
>    reg:
> -    description: |
> -      PCI address of the IOMMU. As defined in the PCI Bus Binding
> -      reference, the reg property is a five-cell address encoded as (phys.hi
> -      phys.mid phys.lo size.hi size.lo). phys.hi should contain the device's
> -      BDF as 0b00000000 bbbbbbbb dddddfff 00000000. The other cells should be
> -      zero. See Documentation/devicetree/bindings/pci/pci.txt
> +    maxItems: 1
>  
>    '#iommu-cells':
>      const: 1
> -- 
> 2.47.2
> 
