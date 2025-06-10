Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F411625
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 18:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749579251; cv=none; b=HNRV08u8ByGgl/h8S2Ew6dl7pMFoAMNw/ch1oZomVVTRaUFBMxeVs3IPq7elbt2lRo4SDTce0rkL5AbZK/T2mV/7R39mStVmjGquZtMeg7W+t5AEhBhZKVUzC59+xjFwQreZx739yF17fyr8mLryhYG/TipgoBBEgaL41qmwShM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749579251; c=relaxed/simple;
	bh=HTzJ4CeEqQieDasfVAxFSBHNx5uBQqcVsEFN/1PuvDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9TeURHP8Lb/L+9BelagtAwEDCK/zgyrYe3rA5EDwpJSgqeWwBR/Y1e9g0e7CaxCFZ9FV0WzNUgKPAgMx1J9HGa00JWXY0Ro3IGEG/k+qGhbJrY+IOrJheP+plqVr1Mu0nakUycEuzKxkM3YCMWhX4IdxhoVMgdSH2uMS6QSU2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=2UnrrDuk; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="2UnrrDuk"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-742c3d06de3so6651075b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1749579248; x=1750184048; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Buv6QogeYoqXPnf42/VWqtqjYW36NJ7ABH1YHvLm5sY=;
        b=2UnrrDukpeNHh88+6YLmi7MZ2u3Rtab4fBHguHIZyHNgdblRW4ZGC1+IlLTpC0bvfW
         16ZK6PkTUJT6OB4fxarjt7EmRDv/8Aj+vKbhslKJ+z3sjcaTftvjkpq1hXMUcV0uJPTP
         187LXwTp6j5gjcJQVKVV8y9cHpAeDkCnd9CTI0e5JzncyPkypPnXdLTszUhlxJc5AoHA
         L8uq65HmabCR1zDJHRbiirQrcxKqyGsSPqfZF38yysXg+4H/6/mCOlehsq+FBb9Xo0tC
         T2iSoaUJOMi5+7j83tVoCfOUNMIRX084Yb28vV6U/jx+67iTDIN27QFASYZALm2amD6Q
         rO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749579248; x=1750184048;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Buv6QogeYoqXPnf42/VWqtqjYW36NJ7ABH1YHvLm5sY=;
        b=mgbn43OsFk1jZelWxneI44VIkO4J9eLHgoRk+/rjQoRN/L59RqzWnfGHPbrBtIDy7b
         uBBYsdF6eBPGpWXPcXhrnsXeT7zv+IGsnbQR5sNL8mxD7WDZypWxjdEN/0bmp3QNzZ+b
         0ZlsyRBU4AslNFH3ilVUTXW9BQ07W0k/abqHgq8MaqpUZyByNL97fwKvJTngKi+xEpcg
         hlRZNFUYPZtB7q93AsW8voEOR8rHvUqpH+Swu1Xgil29zLflRosZRpYn5WRnYqVrha2m
         uzC0JFjoljBOS6EcEyWKE3RxGFh86OrzF22LBfNSWLXp44EnXgPPrTvSjREz2oSe1NhD
         Kahw==
X-Forwarded-Encrypted: i=1; AJvYcCU/pMOsJkPXPQzNIesaOGwBMTbrcj+IARavo2RJLUO+7+EbSUgkD+r7rnQa3hvxEKX5GDTzhVq3ghm5JoY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzH21wGAyIkhdXTMB8h90ms22NWJKMynrjjibhqWe/8L2bYL8aK
	EB37DTytzFHX5y7EH9qGeEnokJ/6eycSQ4NCImoDcefqhvyTedlnErJH7T18/SgEbVM=
X-Gm-Gg: ASbGnctimUlRW2c0dvGa58qXiDKEa0yzRVNFvuTR8DPVtZabimYG3SnUbxlptNFLk2W
	/ZcB2ZmJ3eVTTP5dkruEtQHR93MlJGe1z48LNhxR3iEWYsH0RYMTiMA9I2ZeOP7+xGsZKQBdsoO
	k8VCD2GKEfXhW/TFW8G2gzZvXevDm7s0NnLqbkf7ntpPtteqW5YP08NNIQQ6Qj+JM9IlvwBaNNY
	dU8DDkqzdnEcI9gDLX/asp+Ss23sA7VQlIjY5SlhlcdgQRcsQg0KiAUF9GY1HmEYkATcoDvqiZn
	+3dUSnMGTXR1+KkGVjHgQLZNC0fw/sL5r1Axj1jwE4KN7uJkR4hbtQAEIIMWQIE1ocIIIxcpXQ=
	=
X-Google-Smtp-Source: AGHT+IEKKfnqp8pCNkWI7DvGsMSwF7RA49Rt6mnDZLu2angUdnwaCraNN4mnhemBVW55MDBsnha8Sg==
X-Received: by 2002:a05:6a00:170b:b0:748:2ff7:5e22 with SMTP id d2e1a72fcca58-7486cb4cb97mr680434b3a.10.1749579247498;
        Tue, 10 Jun 2025 11:14:07 -0700 (PDT)
Received: from x1 (97-120-245-201.ptld.qwest.net. [97.120.245.201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af3835fsm7775456b3a.27.2025.06.10.11.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 11:14:07 -0700 (PDT)
Date: Tue, 10 Jun 2025 11:14:05 -0700
From: Drew Fustini <drew@pdp7.com>
To: Rob Herring <robh@kernel.org>
Cc: Dan Williams <dan.j.williams@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>, nvdimm@lists.linux.dev,
	Oliver O'Halloran <oohall@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3] dt-bindings: pmem: Convert binding to YAML
Message-ID: <aEh17S0VPqakdsEg@x1>
References: <20250606184405.359812-4-drew@pdp7.com>
 <20250609133241.GA1855507-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609133241.GA1855507-robh@kernel.org>

On Mon, Jun 09, 2025 at 08:32:41AM -0500, Rob Herring wrote:
> On Fri, Jun 06, 2025 at 11:11:17AM -0700, Drew Fustini wrote:
> > Convert the PMEM device tree binding from text to YAML. This will allow
> > device trees with pmem-region nodes to pass dtbs_check.
> > 
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Acked-by: Oliver O'Halloran <oohall@gmail.com>
> > Signed-off-by: Drew Fustini <drew@pdp7.com>
> > ---
> > Dan/Dave/Vishal: does it make sense for this pmem binding patch to go
> > through the nvdimm tree?
> > 
> > Note: checkpatch complains about "DT binding docs and includes should
> > be a separate patch". Rob told me that this a false positive. I'm hoping
> > that I can fix the false positive at some point if I can remember enough
> > perl :)
> > 
> > v3:
> >  - no functional changes
> >  - add Oliver's Acked-by
> >  - bump version to avoid duplicate message-id mess in v2 and v2 resend:
> >    https://lore.kernel.org/all/20250520021440.24324-1-drew@pdp7.com/
> > 
> > v2 resend:
> >  - actually put v2 in the Subject
> >  - add Conor's Acked-by
> >    - https://lore.kernel.org/all/20250520-refract-fling-d064e11ddbdf@spud/
> > 
> > v2:
> >  - remove the txt file to make the conversion complete
> >  - https://lore.kernel.org/all/20250520021440.24324-1-drew@pdp7.com/
> > 
> > v1:
> >  - https://lore.kernel.org/all/20250518035539.7961-1-drew@pdp7.com/
> > 
> >  .../devicetree/bindings/pmem/pmem-region.txt  | 65 -------------------
> >  .../devicetree/bindings/pmem/pmem-region.yaml | 49 ++++++++++++++
> >  MAINTAINERS                                   |  2 +-
> >  3 files changed, 50 insertions(+), 66 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/pmem/pmem-region.txt
> >  create mode 100644 Documentation/devicetree/bindings/pmem/pmem-region.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pmem/pmem-region.txt b/Documentation/devicetree/bindings/pmem/pmem-region.txt
> > deleted file mode 100644
> > index cd79975e85ec..000000000000
> > --- a/Documentation/devicetree/bindings/pmem/pmem-region.txt
> > +++ /dev/null
> > @@ -1,65 +0,0 @@
> > -Device-tree bindings for persistent memory regions
> > ------------------------------------------------------
> > -
> > -Persistent memory refers to a class of memory devices that are:
> > -
> > -	a) Usable as main system memory (i.e. cacheable), and
> > -	b) Retain their contents across power failure.
> > -
> > -Given b) it is best to think of persistent memory as a kind of memory mapped
> > -storage device. To ensure data integrity the operating system needs to manage
> > -persistent regions separately to the normal memory pool. To aid with that this
> > -binding provides a standardised interface for discovering where persistent
> > -memory regions exist inside the physical address space.
> > -
> > -Bindings for the region nodes:
> > ------------------------------
> > -
> > -Required properties:
> > -	- compatible = "pmem-region"
> > -
> > -	- reg = <base, size>;
> > -		The reg property should specify an address range that is
> > -		translatable to a system physical address range. This address
> > -		range should be mappable as normal system memory would be
> > -		(i.e cacheable).
> > -
> > -		If the reg property contains multiple address ranges
> > -		each address range will be treated as though it was specified
> > -		in a separate device node. Having multiple address ranges in a
> > -		node implies no special relationship between the two ranges.
> > -
> > -Optional properties:
> > -	- Any relevant NUMA associativity properties for the target platform.
> > -
> > -	- volatile; This property indicates that this region is actually
> > -	  backed by non-persistent memory. This lets the OS know that it
> > -	  may skip the cache flushes required to ensure data is made
> > -	  persistent after a write.
> > -
> > -	  If this property is absent then the OS must assume that the region
> > -	  is backed by non-volatile memory.
> > -
> > -Examples:
> > ---------------------
> > -
> > -	/*
> > -	 * This node specifies one 4KB region spanning from
> > -	 * 0x5000 to 0x5fff that is backed by non-volatile memory.
> > -	 */
> > -	pmem@5000 {
> > -		compatible = "pmem-region";
> > -		reg = <0x00005000 0x00001000>;
> > -	};
> > -
> > -	/*
> > -	 * This node specifies two 4KB regions that are backed by
> > -	 * volatile (normal) memory.
> > -	 */
> > -	pmem@6000 {
> > -		compatible = "pmem-region";
> > -		reg = < 0x00006000 0x00001000
> > -			0x00008000 0x00001000 >;
> > -		volatile;
> > -	};
> > -
> > diff --git a/Documentation/devicetree/bindings/pmem/pmem-region.yaml b/Documentation/devicetree/bindings/pmem/pmem-region.yaml
> > new file mode 100644
> > index 000000000000..a4aa4ce3318b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pmem/pmem-region.yaml
> > @@ -0,0 +1,49 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pmem-region.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +maintainers:
> > +  - Bjorn Helgaas <bhelgaas@google.com>
> 
> Drop Bjorn. He only did typo fixes on this.
> 
> > +  - Oliver O'Halloran <oohall@gmail.com>
> > +
> > +title: Persistent Memory Regions
> > +
> > +description: |
> > +  Persistent memory refers to a class of memory devices that are:
> > +
> > +    a) Usable as main system memory (i.e. cacheable), and
> > +    b) Retain their contents across power failure.
> > +
> > +  Given b) it is best to think of persistent memory as a kind of memory mapped
> > +  storage device. To ensure data integrity the operating system needs to manage
> > +  persistent regions separately to the normal memory pool. To aid with that this
> > +  binding provides a standardised interface for discovering where persistent
> > +  memory regions exist inside the physical address space.
> > +
> > +properties:
> > +  compatible:
> > +    const: pmem-region
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  volatile:
> > +    description: |
> 
> Don't need '|' here.

Rob - Thanks for the feedback. Should I send a new revision with these
two changes?

Drew
