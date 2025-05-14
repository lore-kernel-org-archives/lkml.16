Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBA81624C2;
	Wed, 14 May 2025 15:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747234897; cv=none; b=ue4h8mffR9Veh2U0q3BhUa0cdhElOkqU9BzoU5vM+fsNqxxkK7S7GOHFCXXyFlX/7BF5+ojFZUPDRBR+bROggL/d3Hpw7KyCmFQm9DylUsNaMwpeg1b/njhpjKUZoxI7pp0pic5N6Xias/bsz4TsBYW62J96a2AQCSgzfYJYfRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747234897; c=relaxed/simple;
	bh=UtAN4Ton/9OUVMqLuje4Bwq3iKoTshw5ftoT3Wo4niA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K33QmMJ6dx/pK1t3UtiTfCKJ7bAHNJKQ1IPvEZOiCrdxNQqLgOsmcXAJgm8Qhtw64tEvyGDII3CbXjsPhtFy4vgWJmT8AsUPR+1be880+KEPhhR8jLqu39eIIx4i3R1hQTIoD+RyjeaA0E3fft2izPZ+wgIfxWPiHXJuwvRkNis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b9AYKyG2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b9AYKyG2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E408C4CEE3;
	Wed, 14 May 2025 15:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747234896;
	bh=UtAN4Ton/9OUVMqLuje4Bwq3iKoTshw5ftoT3Wo4niA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b9AYKyG2U87LmHdU2+TMI9es2J94xjYL5GjUAwoxxAwXVp0VpCQu9dMzBMr65O2i9
	 KzPmcBrYNfzgYS9CNIIF7Xlp+QzOykOWF7bDDKq2leW7hx3IFpoeCIVHISeh09JSeW
	 4ANObG9lNLrtrrjdYvaeZs7pMi8Vdd665lg5j8wuPSKceBwyAhFA50WIyO87xJuaSw
	 AQoedSjkXGZilhFZ1qCjQE6rLiM/Bbw3EZRUnulZtpAJLYcJDW2DSkG/tmfr+P7owv
	 TByAMheGVeybJD1rB+FK0LlVdBjsXzyUwm/1DK5SBI/3X+gpPllew4ftFWRvaNhLQ+
	 moAE8cujCog5A==
Date: Wed, 14 May 2025 10:01:34 -0500
From: Rob Herring <robh@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: krzk+dt@kernel.org, tglx@linutronix.de, magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, paul.walmsley@sifive.com,
	alex@ghiti.fr, daniel.lezcano@linaro.org, conor+dt@kernel.org,
	aou@eecs.berkeley.edu, devicetree@vger.kernel.org,
	tim609@andestech.com, linux-kernel@vger.kernel.org,
	geert+renesas@glider.be, palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 3/9] dt-bindings: interrupt-controller: add Andes
 QiLai PLIC
Message-ID: <20250514150134.GB2180131-robh@kernel.org>
References: <20250514095350.3765716-1-ben717@andestech.com>
 <20250514095350.3765716-4-ben717@andestech.com>
 <174723438154.2170160.6461910184012543621.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174723438154.2170160.6461910184012543621.robh@kernel.org>

On Wed, May 14, 2025 at 09:53:08AM -0500, Rob Herring (Arm) wrote:
> 
> On Wed, 14 May 2025 17:53:44 +0800, Ben Zong-You Xie wrote:
> > Add a new compatible string for Andes QiLai PLIC.
> > 
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> > ---
> >  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> 
> Applied, thanks!

And now dropped.

Rob
