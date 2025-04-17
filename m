Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B8922687C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744899540; cv=none; b=kD1xv2tMW8ovHBLeJwq6UfqM5SsDUdwTFyIIEhL1rtvlv7tpsyx2iakjlLPB+IJnttH7EpI5PL4zUAt56jmMb4ohQRGNTSwfArmYnXTG/FHtZkNHj1ALcBZwfECr7MRyx+NUEL3ThSe8jzeKNFLtfx94K6S4GO4s2lQh2zL+rbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744899540; c=relaxed/simple;
	bh=PrJVLP5f8fwnGGlUkRAHMFELfuQEh6br7KhpaFyfBEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g4FxUSxdfO2JjbePTOoz70FaMCVijqhq2NnqYO54e93e64e33cEaRdBaxv0GwAdKxFWtmqFzGe/TkzajHD2a95cdkzmAenvUp6ljUzkcxmXfHEL5crHQE9RKmQ4vEy44B5Ys9KMAacRebrmnOeQn6wmILtQGyXWjyFmWER2blAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=IcEvn5P7; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="IcEvn5P7"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 79714240101
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 16:18:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1744899531; bh=PrJVLP5f8fwnGGlUkRAHMFELfuQEh6br7KhpaFyfBEg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=IcEvn5P7CPvR3WM212MVKLuhSZCSaIZzkri4rgqml2phktYxIjWjN0vJACvsJVfIz
	 CtBFwykipg7y1p5DEvXTxHjhm8F1eErOcyPUlhlVUFFj30F0VFDddFDgAzpRokljY+
	 oXh0uIFlk68wZEUf3WreCJGGJK1rVgoSyxpb9SzgzGQKO94IAg0M1+a3oHvAXOOayn
	 1yp1Ak1zdr5Jk/v2kLIAswnvTyNtxppCrmBePqvhfBc8GuCW6A9fWoK/JrBuYJh1ks
	 +6MsvGJlVzCexLxExnb3wo2fim/XWGDqBn4Uy49+8sdVBa6e3EsLeAW2bxzEOhQ+c3
	 DLQzlMpvIdnoA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Zdg491zWsz6tyf;
	Thu, 17 Apr 2025 16:18:49 +0200 (CEST)
Date: Thu, 17 Apr 2025 14:18:49 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Rob Herring <robh@kernel.org>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Crystal Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: powerpc: Convert fsl/pmc.txt to YAML
Message-ID: <aAENyZObpPCmm1m9@probook>
References: <20250412-fslpmc-yaml-v2-1-98c0948a2921@posteo.net>
 <20250412183732.GA1442430-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250412183732.GA1442430-robh@kernel.org>

On Sat, Apr 12, 2025 at 01:37:32PM -0500, Rob Herring wrote:
> On Sat, Apr 12, 2025 at 02:49:38PM +0200, J. Neuschäfer wrote:
> > This patch rewrites pmc.txt into YAML format. Descriptive texts are
> > expanded or shortened in a few places to better fit today's conventions.
> > 
> > The list of compatible strings (and combinations of them) is based on
> > existing device trees in arch/powerpc as well as compatible strings
> > already mentioned in the plain-text version of the binding.
> > 
> > One thing I didn't handle are soc-clk@... nodes as seen in
> > Documentation/devicetree/bindings/powerpc/fsl/pmc.yaml.
> > 
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> > ---
> > Changes in v2:
> > - Rebase on v6.15-rc1
> > - Link to v1: https://lore.kernel.org/r/20250315-fslpmc-yaml-v1-1-10ba354a85c2@posteo.net
> > ---
> > 
> > Note: The examples include a consumer (sata@19000), to demonstrate how
> > sleep specifiers work. I've heard that "unrelated" nodes in examples are
> > generally discouraged, but I'm not sure if it's better to keep it or to
> > drop it in this example.
> 
> I'd drop. Unless you want to fix the error. There's nothing really 
> unique with how 'sleep' property works.

Okay.

> > +properties:
> > +  compatible:
> > +    oneOf:
[...]
> > +      - const: fsl,mpc8548-pmc
> > +
> > +      - const: fsl,mpc8641d-pmc
> 
> 1 enum for these 2.

Will do.


Thanks,
J. Neuschäfer
