Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14402F852;
	Tue, 27 May 2025 06:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748328802; cv=none; b=ikrLFDcBlY9qjTybwgSPrbo9XgK+Y20PhfhMBcZbOxRMq/rgcIDozRRO0HSjLmD+tibmR/Yv3DnTR2dLsTY31AYBRs6wPdlvdvpL643qrTsXHPfdBcIczz1O/rboNh8C7XFGf340HzjTmYB/pgIAoGVrLJOGFx3fWfjxJ01w9Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748328802; c=relaxed/simple;
	bh=kdiH0AXGuvY9XtxMtuYU8wXg/NjMgu8AdKdsundsshE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RMqYKULXzQzmF3QtKFJdLLQtNnl8ERTrreSKSPyIJcQMqnoVxLYpzyzxhHjjd8Dhw43Z/NucfT+Lu99r9BvJgtkJzqWniUrfHfiGwdmvIA1ZEy6T1bpncSaM3iw22S7tC39Hb0B98wjhb1vIOlz4+hjacwDMNIF+XiN5svSbavM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m8TYFJai; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m8TYFJai"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B40ECC4CEEA;
	Tue, 27 May 2025 06:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748328801;
	bh=kdiH0AXGuvY9XtxMtuYU8wXg/NjMgu8AdKdsundsshE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m8TYFJaiafMEoqsHW6CNxlG44eo6K7DjL+010aqCJtFWAib1HyStZM5Oq96pfyo1Z
	 4IrpibWl5tDqGczCJoKw0PxTCTk7A2+pNL21Pjlfnt8He+lIi3sA0M4Rk+QgVH0aL9
	 LcRntmKt5OyKc43ZhnzbuLVijMC9759CcPN1OzMEE5GTuMXcV+72Uh8wjepgzb2Hb9
	 ZID9sAf/I61ZbT/2/pJOdSorTG+lmsjKPke/Pz5Pp/7oyr7rRhqXTiatqhdDfS+Iwb
	 K5xRouXRVjPgl5iggBJ8a2MrTavxORXYQoecg/MOYKzB85NJu06GMaYUR02cY8HztS
	 OmxbYTpzv1nUg==
Date: Tue, 27 May 2025 08:53:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ze Huang <huangze@whut.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: usb: dwc3: add support for SpacemiT
 K1
Message-ID: <20250527-burrowing-adventurous-ermine-dd4eb6@kuoka>
References: <20250526-b4-k1-dwc3-v3-v4-0-63e4e525e5cb@whut.edu.cn>
 <20250526-b4-k1-dwc3-v3-v4-1-63e4e525e5cb@whut.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250526-b4-k1-dwc3-v3-v4-1-63e4e525e5cb@whut.edu.cn>

On Mon, May 26, 2025 at 10:40:17PM GMT, Ze Huang wrote:
> +
> +  interconnects:
> +    maxItems: 1
> +    description:
> +      On SpacemiT K1, USB performs DMA through bus other than parent DT node.
> +      The 'interconnects' property explicitly describes this path, ensuring
> +      correct address translation.

This does not seem write. You mixed DMA with interconnects.


> +
> +  interconnect-names:
> +    const: dma-mem

