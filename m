Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F7278F36;
	Wed, 18 Jun 2025 07:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750230608; cv=none; b=jDj0NDtf2v0yBvawg09JJjylMKLp9jnC8oD1re3jVACYf+6K7AkhT+7HVWMNvIZJNZRqHNRIDL+azz3Z/g+yW0WF32sGlMJRg2VvJ6Z4m5CBWNatuGHYrziLhnfcDelU+Iurl41xD8ax9nePh+5yNoIb63t0xsNZJVek1SheQbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750230608; c=relaxed/simple;
	bh=3vquAr1YlfiylI1As2h+MQIfiv4ocQLAEY378qEErc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tN7mTjpUlD7OlG4/rAOvBvWMGwC8tZZwgEdG5b0kLMaZ95LUWEVx0jCWImQmk8ekxDXyrqrqvUcYp+/qA/4fHIoZ133YVSc8FZO9ALwYqDZIZpxxM/GC3TNqsxZ70ZIiHJR34G/qi8/VdFrG/Sv7ah1Vq0as0u9A+uWsK9G6oXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=esQarsYS; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="esQarsYS"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so48696385e9.0;
        Wed, 18 Jun 2025 00:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750230605; x=1750835405; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=blHlfMe+5CBJc/TGBy1gRr5vofntcL3F+SvJ+oaL4XI=;
        b=esQarsYSzkv6LwwQCUQGN0fUm/DnA2jQ+Ai58pVKRvuL+TIvHtVjiODI21Z6P/eE/8
         U5zPA51Tld5dCPWa5XbNB7LjW/TNUgQmGU9CF2NJey1oWpHqrk30QVIq7tRnTDuuNvMp
         0ffQPfro8AA9mQgcHpQWm+83oHK2bEEssUjkRRKpfcZ7pbBjkABRVy2ZrgR0uTcbJXVA
         ARfpU23I824yy/E5TKqdFrOHeqbS5NhjAvKiuQ9vhjul9nLiMUdk+bzeulh29KRZ/IJr
         7UQUI2ozLiIWEP7XluQiI0TrfW+vp/tVS3v4UKpGwNAPsLKo5pcRpSGMBAKoLL6NR8VH
         cZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750230605; x=1750835405;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=blHlfMe+5CBJc/TGBy1gRr5vofntcL3F+SvJ+oaL4XI=;
        b=XG8Ulrouf+IL1PhAyr1RSW1jtQAOHckaBVmI/5bE/k88NX+1QrXXRmdMwwdKQfDauv
         IPJZiaYXVMhntemtltXDmmcqmSRy1ENKrYAnIV4qM293SYHWMwoth5BLTpFuE5TzRnZz
         b3DhkbuoUer4An4Uwni10szFLVbFFHcDGPLM74WL4ukRMhQWfgTCCs6e4AZrEaiSZEXQ
         j2eUB31f+fJvF6lSGj/Z1/YMRKKkM2gIUeZjfi9c4ZuoCMJz/j5A58T3IVIFwAWhUaZO
         EwyBi+JjYiKF63u4UX4bLNkP8lqmwXxNpQPTon7ukG/8s2v9ozxu8ONIIUYNVOUZG4Cs
         g+2g==
X-Forwarded-Encrypted: i=1; AJvYcCU0/PMyzUTkWoU/v/5gV3te+mguBsDBq2IZI0yPHs3Yu5JbVk1caEFT9Gy1BgiFAIbNA5ZdnQD3abE/@vger.kernel.org, AJvYcCVarOIfi3KURNccy0+Ycr8wUKVc2cJiWDCI8O1BOZRHIc2Mtbie/5U6VTymQLVol0hIxPnajpLqpLCUl9+j@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/vPvPGzt3gi83ojHqsfZEQL/dPMMGvqfyd3mMZhb5Cd4h3bH+
	W8ht3d3B3gMMufPPc3kPyk/GT4QlWx7ThR0IX/esnunOUsn/6P0/NifT
X-Gm-Gg: ASbGncvntxYA1sjSKTyc73VXiphpxGk/KJL54ycAt/eOkhaobYT/oD/mjB/vo8Ggxn+
	/NavjnP4bmdgN1MXocpQXBR2X/eiFEwezH/BxZJCfHqpCXG6XpDWMIW+XN5YmG336rkHaF87eUI
	QX/JbQ2BxkA63GYa9tCrb0/dYiHlBF8LwcGCEf/vE9XgrDMDTaaFiu6msFH2qGppG/wCKiy7GnP
	eIjBus1jNSjTi+trh4jtv5Vw1BUAufYMwTrUeyv/P5S3q626mJmvJKzS+AuXTCsSR/V74bfzBhS
	6iO5Nyf8VFjX16naDsklm7z7VqzhSEAsb0zjzBiQP+3fvUbbj8FNVotbgH19ECB37f/vNxcmCXF
	T3NgZxog=
X-Google-Smtp-Source: AGHT+IGbwEhIWV4IKMQ3WRcacP8pkDAtcfY/QWEP271EBcrbZmLFg+GQMV3so/GYmhjA/VhLeTRu7g==
X-Received: by 2002:a05:600c:b95:b0:450:d012:df85 with SMTP id 5b1f17b1804b1-4534b4d8ad2mr103112555e9.18.1750230604970;
        Wed, 18 Jun 2025 00:10:04 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([137.71.226.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b70d77sm16171244f8f.94.2025.06.18.00.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 00:10:04 -0700 (PDT)
Date: Wed, 18 Jun 2025 09:10:01 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <qg2l6wfzaquxepeubxgrp2xdbdsfqam3vpzc75sar66jhpc3zn@wi3yk75lebo2>
References: <20250606-adi-i3c-master-v2-0-e68b9aad2630@analog.com>
 <20250606-adi-i3c-master-v2-1-e68b9aad2630@analog.com>
 <20250606-sliver-freeing-d01268258c25@spud>
 <ildi2pup2zkyv4stuknkrjysex3yzsbrrsrwbgcc4xgvdhwrdd@7qh4y6mutgy2>
 <20250617-pawing-octane-a983fbf7100d@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617-pawing-octane-a983fbf7100d@spud>

On Tue, Jun 17, 2025 at 04:47:58PM +0100, Conor Dooley wrote:
> On Tue, Jun 17, 2025 at 04:50:43PM +0200, Jorge Marques wrote:
> > On Fri, Jun 06, 2025 at 05:08:45PM +0100, Conor Dooley wrote:
> > > On Fri, Jun 06, 2025 at 03:21:02PM +0200, Jorge Marques wrote:
> > > > Add bindings doc for ADI I3C Controller IP core, a FPGA synthesizable IP
> > > > core that implements the MIPI I3C Basic controller specification.
> > > > 
> > > > Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> > > > ---
> > > >  .../devicetree/bindings/i3c/adi,i3c-master.yaml    | 63 ++++++++++++++++++++++
> > > >  MAINTAINERS                                        |  5 ++
> > > >  2 files changed, 68 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
> > > > new file mode 100644
> > > > index 0000000000000000000000000000000000000000..e7fae394ad8fd4143eb1fffb9591a30a2d6cc6ac
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
> > > > @@ -0,0 +1,63 @@
> > > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/i3c/adi,i3c-master.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Analog Devices I3C Controller
> > > > +
> > > > +description: |
> > > > +  The ADI I3C controller implements a subset of the I3C-basic specification to
> > > > +  interface I3C and I2C peripherals [1].
> > > > +
> > > > +  [1] https://analogdevicesinc.github.io/hdl/library/i3c_controller
> > > > +
> > > > +maintainers:
> > > > +  - Jorge Marques <jorge.marques@analog.com>
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: adi,i3c-master
> > > 
> > Hi Conor,
> > > Seeing this with no versioning info is pretty suspect.
> > > The adi spi, pwm, axi-dmac etc all have versioning info, please try to
> > > emulate that.
> > > 
> > > Otherwise, I think this is okay.
> > > 
> > > Cheers,
> > > Conor.
> > > 
> > The driver checks the IP version via register access, for the other adi
> > ips, the -x.00.a suffix was never updated. For example, the axi-dmac
> > current IP version is v4.5.64 while the compatible still is 1.00.a and
> > there is a mention of v4.3.a in the binding. It is unclear whether
> > suffixing it with "-1.00.a" would be useful, or if the time comes call
> > the new "adi,i3c-master-2".
> > 
> > Do you still think it is necessary?
> 
Hi Conor,

> I do, yes. In the other cases, if a new version comes out that has some
> sort of meaningful difference a new compatible can be added. Until then,
> using the -1.00.a one is okay.

Ok, I will add the -1.00.a suffix,

Best regards,
Jorge

