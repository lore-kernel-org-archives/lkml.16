Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CE725F79A;
	Wed,  2 Jul 2025 10:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751453887; cv=none; b=Ub1Cxl8IRWThTMAlB/UfrUjHVd1h4Qbrob5M86OyFUg8B79ovhb5eo+VLCkkv8oxaBY3RNRj9wRkfI6BzkJtP+zhHog2qON0F5d9q6m4lR0Zy3J4zV4NBtX4qh2Zaw1V+4NZRAfcBTnMEUxf7cy7CVm6/v3jgnhEHserCaN0uvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751453887; c=relaxed/simple;
	bh=ww9qVi9kS/GRl/dQgoVS7ktOBVeLoeyQcow80qPNWP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XRwcsPKJhG/7CIRZEFOBoO5k8UufIRWQfKszaYyKtWfJ/HsUM4+8YBd/+/YAGKPeFxU+tHt9YXcAxxfo/QD/e1on9aHlzq1QtoPSnCZMDiGZCbuw/VY9Ffito3p2rff3MtgmmkOTeDA3EA36DWkLpZWECa68PAR7vBbPG9yKvg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PjRiaMwy; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PjRiaMwy"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ae36e88a5daso850338666b.1;
        Wed, 02 Jul 2025 03:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751453884; x=1752058684; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4UQDvStLCCqdjbM2QKt6gHnnOIKDEa8/C2rjjg0SswI=;
        b=PjRiaMwyYaG/UPgImqoFqHGZIyDPT22KEYAMGPEISUTuZiZfqnzZLfWI/2dHQf1XN/
         00106gMqcwu6K1lcj+AgkPKw/bJawebg4yybpXwtuW8QabmgXAzLo5WTDXcrKjB32Sic
         GGmm5T58P65Iko2OLLEy5WHQlYCLFjx7y4qMOltBbh4EsLwQh3mufH67RRDZ5Y/6oazo
         0yIElvyR+MasZWI7JmuCH7594KPCuLm8t+uYCvERGDCZlGRD3g/Sz4QYq1Zy2uzwY2Ox
         KZrWT8ClApsFg+R/izFd+rEN2hYW33QW3vQoELDlkQE2cg85+sTqQYiI6vUd79kVmF0h
         Rywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751453884; x=1752058684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4UQDvStLCCqdjbM2QKt6gHnnOIKDEa8/C2rjjg0SswI=;
        b=M8Ryv1jWl4QwldGDUiwmEdOVwblJlcxiHzdxRZSeqdz7H3qvElcljdj78ruNhKxyXG
         Auik6lRXQgO4AsGTo2Wr66kCpl6A6vlLKpFdPu1nljiJCogknLPEgAXWOFV1n9QcuuX7
         pgVVUQSjtAV+qVZU3OM5F44EqftK23gBh481IWYpngPfcAeOM+bF8grESfR9AtCm+g0e
         V31uMbbYo0dPsOuCJa8InZkvkG0ZfXpFW729KfnYEwf/xYLp/G0rw9sLUVqq5+LDKzON
         VjqYmse8n9799OGAvmm4Y8za/LqhuUQsXoZLTE/wP/Ii/vx7HF7+TJt6KvN7fRYx4Ym6
         PcNA==
X-Forwarded-Encrypted: i=1; AJvYcCU7KXOG/+oFCxzv5IUnZfiGkx+toXiPO+Y2zjf0OMFx5wA7jBAgx3eggb0knOtCBEErBTEUaXGfWrgmDlT3@vger.kernel.org, AJvYcCW/2F8N86hP5ez5ONL6iRclz4uah+oUvMnHrfihk7bdsP9F32qeo5HkLF6GLtr3+NQKwNSnXfZozK8i@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ4QSdfq7lP24e0wMNUvwaTjb6PxfxpHuZcq3tkQQZyVFNQqnD
	k18r8A60pJkiGwbGfQALAZeDikDNq9afRJOArKXtwj1O9WpTEnLzrXFr
X-Gm-Gg: ASbGncs0uG0WVzBqwAazH8b8XWVn9odpeQR1dVDZg21A8m3qPmSflqIhEgjB3ncCBnI
	bsbGMILwDFp0LyfE5duRR07yQqRviN93FhCGERqNhfGe6yxh8NWaJMbg50DJX+UkoL88TSlq731
	qUzHwDUYBgiDwYiwEgPD5MC6Qr5uXeQD66fTyCENgjMymHynN1xl71e/fcAwRKoFeT72fkTWJCR
	y7zSx5duFxd5vL9cAagaEZpP8nYu6+XS8duWSg7YaJwa1R+2TRqVKyPTWYxMEfSDYKqoH/OMLO7
	cGPG7uSAFFTxUuLrbY7Ae4frAYn6xD6FQcmvZYEMOvdumFm4KZYe2kAxJuIXPAfIm9ney7vD2cx
	yQr0N2+c=
X-Google-Smtp-Source: AGHT+IEsoB7YBUau4TzIFD9Pd++QxJk8jVRKzBz/JBIA6OBn/guMweMpUf9qL70n0g01Wfz1g1iRgA==
X-Received: by 2002:a17:907:6095:b0:ae0:a0d0:eca0 with SMTP id a640c23a62f3a-ae3c2c4bf31mr216834366b.14.1751453883569;
        Wed, 02 Jul 2025 03:58:03 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([137.71.226.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3c7606786sm79736466b.60.2025.07.02.03.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 03:58:03 -0700 (PDT)
Date: Wed, 2 Jul 2025 12:58:00 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <v2ybju75bpjdqxfkell47nlkeyal36ylmnqt2yvpncxnmp2irb@pygx56jsyxkr>
References: <20250626-adi-i3c-master-v4-0-3846a1f66d5e@analog.com>
 <20250626-adi-i3c-master-v4-1-3846a1f66d5e@analog.com>
 <20250627-steadfast-ferret-of-expertise-5c8ff2@krzk-bin>
 <tl5fckhrivaqfyzwyb2o2a7gykpigwend7z2nduqgbbej3hqbs@vxxtsadhtdmt>
 <41782ded-908b-46ef-8f75-4d2565476b7c@kernel.org>
 <cfi6rzhco2ba6pcbk57l7tblimuks5jnpgaly7nbedbrpyhtma@u46if22kurwk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfi6rzhco2ba6pcbk57l7tblimuks5jnpgaly7nbedbrpyhtma@u46if22kurwk>

On Fri, Jun 27, 2025 at 06:02:26PM +0200, Jorge Marques wrote:
> On Fri, Jun 27, 2025 at 04:49:19PM +0200, Krzysztof Kozlowski wrote:
> > On 27/06/2025 16:38, Jorge Marques wrote:
> > > On Fri, Jun 27, 2025 at 08:56:55AM +0200, Krzysztof Kozlowski wrote:
> > >> On Thu, Jun 26, 2025 at 12:07:36PM +0200, Jorge Marques wrote:
> > >>> Add bindings doc for ADI I3C Controller IP core, a FPGA synthesizable IP
> > >>> core that implements the MIPI I3C Basic controller specification.
> > >>
> > >> How did you resolve my last comment? I don't see any explanation -
> > >> neither here nor in the binding description. Binding description is
> > >> actually better place, I think now.
> > >>
> > >> Best regards,
> > >> Krzysztof
> > >>
> > > 
> > > Hi Krzysztof,
> > > 
> > > I forgot to condense out discussion on v4.
> > > What about this binding description:
> > > 
> > >   description: |
> > >     FPGA-based I3C controller designed to interface with I3C and I2C
> > >     peripherals, implementing a subset of the I3C-basic specification.
> > >     The IP core is tested on arm, microblaze, and arm64 architectures.
> > >     It takes one or two clocks, axi and i3c. If only axi is provided,
> > >     then there is no clock signal to the i3c input clock pin and axi
> > 
> > This is obvious from the schema, drop.
> Ack.
> 
> > 
> > >     clock drives the whole IP. The compatible is suffixed by 1.00.a
> > >     foreseeing future controllers by Analog Devices Inc. and breaking
> > >     changes.
> > 
> > I don't understand that. How are you breaking any changes? And how
> > 1.00.a predicts future? I don't think this reflects previous discussion.
> > Why you were asked to go with v1.00.a?
> The -1.00.a suffix came from this discussion:
>   
>   https://lore.kernel.org/linux-i3c/ildi2pup2zkyv4stuknkrjysex3yzsbrrsrwbgcc4xgvdhwrdd@7qh4y6mutgy2/
> 
> Other adi bindings use this suffix. I personally wouldn't add any suffix
> unless told otherwise, as I expressed on the thread. Should I drop it?
> or suffix it with something else?
> > 
> > Best regards,
> > Krzysztof
> 
> Best regards,
> Jorge

Hi Krzysztof and Conor,

I went after the reason of the historically -1.00.a suffix and
discovered that they came into existence due to AMD Xilinx auto
generation devicetree tool SDTGen
https://github.com/Xilinx/system-device-tree-xlnx
that would automatically suffix with the IP version, defaulting to 1.00.a,
and for a seamless experience, the were copied over to the dt-bindings.

The adi,axi-pwmgen dt-binding went more creative and suffixed with
-2.00.a, while never enforcing Vivado to yield the devicetree with such
value (Major version is asserted in the driver through reg access, the
current core version is v2.1.1)

Testing on my side (AMD Xilinx Vivado 2024.2), it seems Vivado now
defaults to 1.0, so the previous bindings from the other IPs are not
accurate anymore, either, (axi-pwmgen auto gens
`compatible = "xlnx,axi-pwm-gen-1.0";` (`xlnx` instead of `adi`, also)).

For fun, the current Vivado version thinks the devicetree node for the
i3c master should be as follows:

  i3c_host_interface: i3c_controller_host_interface@44a00000 {
          compatible = "xlnx,i3c-controller-host-interface-1.0";
          reg = <0x44a00000 0x10000>;
          clocks = <&clkc 15>;
          clock-names = "s_axi_aclk";
  };

Let me know if we can drop the suffix, or replace with something else.
The current register defined core version is v0.1.0.

Best regards,
Jorge
