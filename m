Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB2119F422;
	Fri, 27 Jun 2025 16:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751040154; cv=none; b=VF8zo6g8nx1ApVlT8JcYEqN+caZ20zMzXaaE0KsRUJfP1GjQDqHVYH4HV99VEcNJGp3iSlkb/Z//wXlLMqaoR5z+rCraTg3oYpETM9AdIsaeZAgi38BHA5nFCDIuSdc22A23wSpWKoeJhAAiKFK13h4fLBS9yB/nrrSuQxo5HwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751040154; c=relaxed/simple;
	bh=L+EH8xUN/kTamOCel3cN068LKn0HdNYIsmWH8Px/0sQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NKFXXSFMd+2P5jNrePRN1+xLiX1xNofrp7+arechZcpGtUTUnTQZwp/Q+XgHnTeDFfJd1N/hCNUVkEfqMNQCI9a9Zm53gSpMLV82Vgk4IAkLbtENKfM7Vf8xPjl31xfsmdSvdIGquCvQCTxegliNxbE1hjPhrCc67YbI8jR1hX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LmoJR5AV; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LmoJR5AV"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4538a2fc7ffso15261735e9.0;
        Fri, 27 Jun 2025 09:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751040151; x=1751644951; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KyLLRbISSweC81aqmpyBtxhoJFl2pqPLdoDYJV2N3oA=;
        b=LmoJR5AV80T86m6GMONTPeKkCyxSLeEgqTGqDqnQCg2N5p/Y6j653vg0bRpGzlMirQ
         8DnOaLOaZqbtHcMw1pkZz8t73vegMMtGpdTg0/k6ARex+0hAxgvwlP2qK9EH0Lf25hDZ
         N2V2ElQyqQl2qiE4jq5jpUfNnv4i2eMf8qFMkh0U2fn2yMl6Tmdz7GZkuSXyvOLqrNus
         +FlR6hHZ4gnnIHXZUk/GpMQGBtluIiQ7FXVP/bmLeJ0XriSZHeCXKiN33Dt+jlj54pxI
         W1i4nV+LOCRUiZnFJW+CALUoesM6BWbIJ/oWVd8elsC0qhgept0oKZygCRvSn3l1u5Va
         tRAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751040151; x=1751644951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyLLRbISSweC81aqmpyBtxhoJFl2pqPLdoDYJV2N3oA=;
        b=E1/fIyIAZ4bdCX0RhN1zWimnFH8khtiWqb2xkwCNNpZgFien7DQ04e413oLNbLkhg1
         gN7GU6DMm89qYsOQ0D3v08tEDb2PhBziWgQ4MGbRJAV6I+ug+C/L1AEfFLsDC+8j08lS
         YcNijlRs23N62vIptvncOxSMhHOqDfmQvgfKi5VFnw/SdzyLsxU66Yhb5xytOsxci3aA
         gW9RPEBAmkvpydYpJyc9gHx7/q/g7T6f7ARE10913Hp6b2GBHnh1frtOe6H8xgdbRJFP
         9YMUgv3CsBryDo/dRCyX1bqNl2aBnVgVbaN1cj/0OC/yIY/WTyy6BBWzG9j/sqaOqRRr
         Ux8w==
X-Forwarded-Encrypted: i=1; AJvYcCUr4X4zS31WqFyEFP5SlUwTe8Riz8jwf2EnX52X/d48MSJ2kG2SbdUoa3+sDdLWnnDsUoJvDksrFweT@vger.kernel.org, AJvYcCUtC+uXJ4XmlzOUoIuJgYZmoy+sgdsaGdKS3DW4rw1JVl3QDdWL7CdJfvZaCZEBvl8rO5WYQ0bMvZmJ0GcR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4AWCuqg0hPzoudT2kOA3rq3m6YnKbhcl7s3+AgSVjOR7PiM9h
	9FwAtjHn4T5GJfSvtQJ5WolSQa96weVoXeTt9cZ/5uJCXeqff2TLkcg2
X-Gm-Gg: ASbGncuMhQHGgQunnzQMl0rcfozBSJzdsJ1bKGf2E2dMRALFH1WD5U6BCMBuXF8mdm8
	fHgnHrzLdDIZr7MvVfHBIaYUTFkIbpRpMluCOjWRjpyaqvMaSvDublnWhmgMXpIogZDCJW1fuA/
	lKQVc6XLww8ifxfZ9vDBX1/DMde7AFpTfEkt+OgnEunEwfqvEPj2TTewGKWVsOdt+VcbQnnrKjP
	2l5QwK5G7cmwVT5aIPuq/Hwc9m3fT2uuMlOcOUFynGe9xCI/uzWT+OXXkXoBLLhjGt9H9XfEJEP
	0iGX1aCY8W+34oXy/oxMtbMDnyl9/oOPp97eZBmVq60pQP1EFz453DdN04vtbC6TOS2AKS6yHA5
	p0g0nBfo=
X-Google-Smtp-Source: AGHT+IGO7G80owL1UgXjlNkD6fOUWrTlmMT/3NWx91C6Idl3MW0ZTwFQqisHo2CQ/VPPMeqo+HL21g==
X-Received: by 2002:a05:600c:8184:b0:453:92e:a459 with SMTP id 5b1f17b1804b1-4538ad600f0mr72891895e9.16.1751040149634;
        Fri, 27 Jun 2025 09:02:29 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([137.71.226.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a306a01sm57556615e9.0.2025.06.27.09.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 09:02:29 -0700 (PDT)
Date: Fri, 27 Jun 2025 18:02:26 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <cfi6rzhco2ba6pcbk57l7tblimuks5jnpgaly7nbedbrpyhtma@u46if22kurwk>
References: <20250626-adi-i3c-master-v4-0-3846a1f66d5e@analog.com>
 <20250626-adi-i3c-master-v4-1-3846a1f66d5e@analog.com>
 <20250627-steadfast-ferret-of-expertise-5c8ff2@krzk-bin>
 <tl5fckhrivaqfyzwyb2o2a7gykpigwend7z2nduqgbbej3hqbs@vxxtsadhtdmt>
 <41782ded-908b-46ef-8f75-4d2565476b7c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41782ded-908b-46ef-8f75-4d2565476b7c@kernel.org>

On Fri, Jun 27, 2025 at 04:49:19PM +0200, Krzysztof Kozlowski wrote:
> On 27/06/2025 16:38, Jorge Marques wrote:
> > On Fri, Jun 27, 2025 at 08:56:55AM +0200, Krzysztof Kozlowski wrote:
> >> On Thu, Jun 26, 2025 at 12:07:36PM +0200, Jorge Marques wrote:
> >>> Add bindings doc for ADI I3C Controller IP core, a FPGA synthesizable IP
> >>> core that implements the MIPI I3C Basic controller specification.
> >>
> >> How did you resolve my last comment? I don't see any explanation -
> >> neither here nor in the binding description. Binding description is
> >> actually better place, I think now.
> >>
> >> Best regards,
> >> Krzysztof
> >>
> > 
> > Hi Krzysztof,
> > 
> > I forgot to condense out discussion on v4.
> > What about this binding description:
> > 
> >   description: |
> >     FPGA-based I3C controller designed to interface with I3C and I2C
> >     peripherals, implementing a subset of the I3C-basic specification.
> >     The IP core is tested on arm, microblaze, and arm64 architectures.
> >     It takes one or two clocks, axi and i3c. If only axi is provided,
> >     then there is no clock signal to the i3c input clock pin and axi
> 
> This is obvious from the schema, drop.
Ack.

> 
> >     clock drives the whole IP. The compatible is suffixed by 1.00.a
> >     foreseeing future controllers by Analog Devices Inc. and breaking
> >     changes.
> 
> I don't understand that. How are you breaking any changes? And how
> 1.00.a predicts future? I don't think this reflects previous discussion.
> Why you were asked to go with v1.00.a?
The -1.00.a suffix came from this discussion:
  
  https://lore.kernel.org/linux-i3c/ildi2pup2zkyv4stuknkrjysex3yzsbrrsrwbgcc4xgvdhwrdd@7qh4y6mutgy2/

Other adi bindings use this suffix. I personally wouldn't add any suffix
unless told otherwise, as I expressed on the thread. Should I drop it?
or suffix it with something else?
> 
> Best regards,
> Krzysztof

Best regards,
Jorge
