Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693C179C4
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 01:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751161678; cv=none; b=TMWOU/2txOhEdjpr1YPsL2yRICK0lun0lBYgPg4mgufRUxddgHy2krK+JA45vyI9WQqyc9EDtCCj32yvo8tldCCVRDF89/TVMKHQLfh9X418/i9RgS65ri+zpWEOK8eoICgrU9vDYUR2aAu6TtqsTg//LMELmpIjgEsTXRd3GFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751161678; c=relaxed/simple;
	bh=Z1dW7783ckCRwHFGZBVJ38YKD/g6xhZ4LUD6nmffePo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vEK0eQ88ovUfz0ZUB/ytzXe57s/ax29vFPtTcGNY8dvX/h1/Day55bniFKLH5R9MstDtK+Myn9kedKvixwoeACS5KPwXu1DP3Hhm7wvP2AcfFYjoEXfi7nYoW4Blq10/zoDmY72qOFWH494PP6v5aSUxwHYyBeBHoutHWtwXwxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (3072-bit key) header.d=posteo.net header.i=@posteo.net header.b=HpODEQVQ; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (3072-bit key) header.d=posteo.net header.i=@posteo.net header.b="HpODEQVQ"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 95452240104
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 03:47:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.ea087b; t=1751161669;
	bh=wdTPHBtu+qNmk5C2Bn0zJ90/8NEFjhlUIq+Nt2kOfDE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=HpODEQVQ0LmdwqtslxkJoEOlGy0tEDdruH9DTSixJXJHAD7pJJe2j2BA7g/k7gBdg
	 5sS15ZPnQW/bE8w6G6iejwMKHlgE6VIvgZyNnWvq3pH9ysgJubR9vjyJse8UbnEB6D
	 IZRyhtc7IaH/LOhLUbwKvXEHYEKpdsyP7Q2YMglImdJLpEeI3O/YonQ9V24Z+qc4DN
	 lr3VNmHEZvQDhJPvjkunnP1h7FaCkaEOHza3o60faH6UKMqhynBhKTPqyisyb/gysc
	 tQxdyCbTyctdfb5cyvqFt9g8DB18Ek8+AENS6Rzn+VcjX5FuVft+BQuyD4hgijkTLo
	 qjHp+wmocx9NR1/yHtyR1CD/tkhfEBZNalj+Mekaw/6r+fftnn5NVUUImbworlC51O
	 XNwmEnrFFfsf9L0Yn++JBsSEKLU7x+iBqHr0ydERCTfrSOumg5nxVkTv3SdnI3GzTu
	 eTziKcIP6MyTK2gkLOyvr7C9bP4oqhsmSY8K/OFrT9SM8v7u2rN
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4bVBxv5VVNz6tsf;
	Sun, 29 Jun 2025 03:47:47 +0200 (CEST)
Date: Sun, 29 Jun 2025 01:47:47 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Rob Herring <robh@kernel.org>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Crystal Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] dt-bindings: interrupt-controller: Convert
 fsl,mpic-msi to YAML
Message-ID: <aGCbQ100CFJz6BjK@probook>
References: <20250611-msipic-yaml-v2-1-f2e174c48802@posteo.net>
 <20250625201232.GA2128052-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250625201232.GA2128052-robh@kernel.org>

On Wed, Jun 25, 2025 at 03:12:32PM -0500, Rob Herring wrote:
> On Wed, Jun 11, 2025 at 11:42:09AM +0200, J. Neuschäfer wrote:
> > As part of a larger effort to bring various PowerPC-related bindings
> > into the YAML world, this patch converts msi-pic.txt to YAML and moves
> > it into the bindings/interrupt-controller/ directory. The conversion may
> > necessarily be a bit hard to read because the binding is quite verbose.
> > 
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> > ---
[...]
> > +  interrupts:
> > +    minItems: 1
> > +    maxItems: 16
[...]
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +
> > +anyOf:
> 
> allOf

AFAIUI, at the current moment it doesn't make a difference because there
is only one item under the anyOf/allOf, but for robustness allOf looks
better.

> 
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - fsl,mpic-msi-v4.3
> > +              - fsl,vmpic-msi-v4.3
> > +    then:
> > +      properties:
> > +        interrupts:
> > +          maxItems: 16
> 
> Don't you mean 'minItems: 16'? Otherwise, this schema has no effect.

Indeed.

> 
> I can fix these up when applying.

Please do. Thank you!

J. Neuschäfer

> 
> > +          description:
> > +            Version 4.3 implies that there are 16 shared interrupts, and they
> > +            are configured through MSIIR1.
