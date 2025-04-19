Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4552513CFB6;
	Sat, 19 Apr 2025 10:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745057331; cv=none; b=eHIrqEDr8INBLNxVeUP7SlRlxvkVUhUjAtdhgbvpu6VCkWnSKXYP9x7nZHd4Ffmrl4NIDes52D9w14F/3atznRLY5NMz7bZfDjkR8c3fNgsXao3MQlflgyFCXasJmNRO+e2LWghL3/b+TCHr3wKpHFrTcBfc+O1B6EGZ7RYnKj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745057331; c=relaxed/simple;
	bh=B2EqCOFVYPJGm4kbIcA38H8ygbgF+b1tGvM63gAKFoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S/p2fob7Zlc5JyFrA1c8nQgTiGrv+UaRlnzsEPN1PZjnCmAcPYjeDME0u8L/ihDtTqvSwsfahToFlCqke7SaLELLc4RsiRe2hjamcEc8pIdOTNA/RZjzKS8e7QVHifOnR+6ueoQeTZV2GdX1jOgBSgxvrLS/PCxWF2HrH+ioSmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 02F9A34301B;
	Sat, 19 Apr 2025 10:08:48 +0000 (UTC)
Date: Sat, 19 Apr 2025 10:08:44 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Haylen Chu <heylenay@4d2.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alex Elder <elder@riscstar.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] riscv: dts: spacemit: Add clocks to pinctrl and UART
Message-ID: <20250419100844-GYA38730@gentoo>
References: <20250419-05-dts-clock-v1-0-1cce5d59aba2@gentoo.org>
 <aANwGZCIpMcd47IB@ketchup>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aANwGZCIpMcd47IB@ketchup>

On 09:42 Sat 19 Apr     , Haylen Chu wrote:
> On Sat, Apr 19, 2025 at 11:32:29AM +0800, Yixun Lan wrote:
> > Populate clock property for pinctrl and UART controller.
> > 
> > The pinctrl's clock dt-binding patch is still waiting to be merged[1].
> > 
> > The UART's dt-binding and driver code has already been accepted[2],
> > so we now are only sending the DT part patch.
> > 
> > These two patches are abased on SpacemiT SoC tree's for-next branch[3]
> > 
> > Link: https://lore.kernel.org/r/20250416-02-k1-pinctrl-clk-v2-0-2b5fcbd4183c@gentoo.org [1]
> > Link: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/log/?h=tty-next [2]
> > Link: https://github.com/spacemit-com/linux/tree/for-next [3]
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> 
> Generally this looks good to me, but I realized that splitting the
> commit that introduces clock controllers and the one that correctly
> fills clock properties for various peripherals may cause bisectable
> issues, i.e. the UART won't function with only the clock controller
> introduced and no clk_ignore_unused specified on commandline.
> 
I don't think you should worry about this, my plan is to apply
these two patches to for-next branch of spacemiT SoC tree, which
exactly on top of clock patches, besides pinctrl[1], uart[2] patches
will go via different subsystem, and this series depend on them
in order to work properly at run time phase, so regarding this, it's
 kind of broken already.. but if take a high picture that they all
will be merged into for-next/master branch, then it's fine


> If this isn't really a problem, for the whole series,
> 
> Reviewed-by: Haylen Chu <heylenay@4d2.org>
> 
> > ---
> > Yixun Lan (2):
> >       riscv: dts: spacemit: Acquire clocks for pinctrl
> >       riscv: dts: spacemit: Acquire clocks for UART
> > 
> >  arch/riscv/boot/dts/spacemit/k1.dtsi | 39 +++++++++++++++++++++++++++---------
> >  1 file changed, 30 insertions(+), 9 deletions(-)
> > ---
> > base-commit: 279d51ad9f6dc0c667f6f141a669b2c921277d1a
> > change-id: 20250419-05-dts-clock-026bfca75e5b
> > 
> > Best regards,
> > -- 
> > Yixun Lan
> > 
> 

-- 
Yixun Lan (dlan)
