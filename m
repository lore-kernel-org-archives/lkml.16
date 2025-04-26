Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CABA25D212;
	Sat, 26 Apr 2025 14:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745678965; cv=none; b=GPLK75zNH63nPrDg8V/YCxtDQvGueXQatxTZblGczuAPoWlyHV/qgD7ISjP84UFQugU/NF3d/+U+qkhflNhCFy+3NP3C28tkS0il3Kn6VO0sxgKPucPTGC257OXNH4ulWtynxZpt6FbRVvYbtF0CLrB4fPK9ADg4l0WojOww8qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745678965; c=relaxed/simple;
	bh=TCjIUMQhUHnSLDDQBZcImrdXzq+N5thjBf/twGBfmig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bGkDjUrB6x/nlv0VI2EtY/znBpjxV7tzMzV+gU153f8olnts6/Yww8EaKUKuLVz3FBt636fldKmAWcAx7AWU3zfVrUKWFVGijMB//TjpRve/LBtNpI+Ng42haSHianyXm5AiF5Q+dK0rW5GFhnoTaP5JVKmnVcMgG2zxRqaHyL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LIkd5rnR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LIkd5rnR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 489C6C4CEE2;
	Sat, 26 Apr 2025 14:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745678964;
	bh=TCjIUMQhUHnSLDDQBZcImrdXzq+N5thjBf/twGBfmig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LIkd5rnR5sgsAT9xGm2RZ29iCkLdlLhhuRACunIz02F+phiTirenEhGm3Yqn6/rdD
	 GEgEkPwpj94RxXahsaU15YY4ycebNo0dojDZ8YujYFz8Or51Oxjli/y679Sm9Ou9WW
	 MA2b7djDd4fnQHlVgp8QT1ZwoOMPDE4FuUKc9O98QDTlFGArLdWgXOYTSo7DUazvTC
	 yj+RnGbpuAUStGUikBd2MdfNz4rM/y6cDwm9YJYYwA0iXRNJpF29/c2sS4LznXFgYY
	 1I0xFVsyA1tI57F0/k2Fy/SwsJ/XSVHGa2WVkWz8DdDcx3Iz/pxxZvxsH6cvxhpc2U
	 Nx3lWkUSO1X1w==
Date: Sat, 26 Apr 2025 22:32:34 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Min Lin <linmin@eswincomputing.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, Aradhya Bhatia <a-bhatia1@ti.com>,
	rafal@milecki.pl, Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/10] Basic device tree support for ESWIN EIC7700
 RISC-V SoC
Message-ID: <aAzugucziBi4Nr-y@xhacker>
References: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>

On Thu, Apr 10, 2025 at 08:55:09PM +0530, Pinkesh Vaghela wrote:
> Add support for ESWIN EIC7700 SoC consisting of SiFive Quad-Core
> P550 CPU cluster and the first development board that uses it, the
> SiFive HiFive Premier P550.
> 
> This patch series adds initial device tree and also adds ESWIN
> architecture support.

Per past experience, new SoC needs at least pinctrl and clk tree ready.
> 
> Boot-tested using intiramfs with Linux 6.15.0-rc1 on HiFive Premier
> P550 board using U-Boot 2024.01 and OpenSBI 1.4.
> 
> Changes in v3:
> - Rebased the patches to kernel 6.15.0-rc1
> - Added "Reviewed-by" tag of "Rob Herring" for Patch 4
> - Updated MAINTAINERS file
>   - Add GIT tree URL
> - Updated DTSI file
>   - Added "dma-noncoherent" property to soc node
>   - Updated GPIO node labels in DTSI file
> - Link to v2: https://lore.kernel.org/lkml/20250320105449.2094192-1-pinkesh.vaghela@einfochips.com/
> 
> Changes in v2:
> - Added "Acked-by" tag of "Conor Dooley" for Patches 1, 2, 3, 7 and 8
> - Added "Reviewed-by" tag of "Matthias Brugger" for Patch 4
> - Updated MAINTAINERS file
>   - Add the path for the eswin binding file
> - Updated sifive,ccache0.yaml
>   - Add restrictions for "cache-size" property based on the
>     compatible string
> - Link to v1: https://lore.kernel.org/lkml/20250311073432.4068512-1-pinkesh.vaghela@einfochips.com/
> 
> Darshan Prajapati (3):
>   dt-bindings: riscv: Add SiFive P550 CPU compatible
>   dt-bindings: interrupt-controller: Add ESWIN EIC7700 PLIC
>   dt-bindings: timer: Add ESWIN EIC7700 CLINT
> 
> Min Lin (2):
>   riscv: dts: add initial support for EIC7700 SoC
>   riscv: dts: eswin: add HiFive Premier P550 board device tree
> 
> Pinkesh Vaghela (2):
>   riscv: Add Kconfig option for ESWIN platforms
>   cache: sifive_ccache: Add ESWIN EIC7700 support
> 
> Pritesh Patel (3):
>   dt-bindings: vendor-prefixes: add eswin
>   dt-bindings: riscv: Add SiFive HiFive Premier P550 board
>   dt-bindings: cache: sifive,ccache0: Add ESWIN EIC7700 SoC
>     compatibility
> 
>  .../bindings/cache/sifive,ccache0.yaml        |  44 ++-
>  .../sifive,plic-1.0.0.yaml                    |   1 +
>  .../devicetree/bindings/riscv/cpus.yaml       |   1 +
>  .../devicetree/bindings/riscv/eswin.yaml      |  29 ++
>  .../bindings/timer/sifive,clint.yaml          |   1 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  MAINTAINERS                                   |   9 +
>  arch/riscv/Kconfig.socs                       |   6 +
>  arch/riscv/boot/dts/Makefile                  |   1 +
>  arch/riscv/boot/dts/eswin/Makefile            |   2 +
>  .../dts/eswin/eic7700-hifive-premier-p550.dts |  29 ++
>  arch/riscv/boot/dts/eswin/eic7700.dtsi        | 345 ++++++++++++++++++
>  drivers/cache/sifive_ccache.c                 |   2 +
>  13 files changed, 469 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/riscv/eswin.yaml
>  create mode 100644 arch/riscv/boot/dts/eswin/Makefile
>  create mode 100644 arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
>  create mode 100644 arch/riscv/boot/dts/eswin/eic7700.dtsi
> 
> -- 
> 2.25.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
