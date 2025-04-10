Received: from bayard.4d2.org (bayard.4d2.org [155.254.16.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C026E5234;
	Thu, 10 Apr 2025 04:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=155.254.16.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744258656; cv=none; b=sCxMsMFSDQvlLCllVapvPwRv33vP10lGnT/nDrUwmqxUcy1V2jD3xjM1eDwLFSXtSZ1w/H5zDw50wYoTxiP3vA/eQQOrR/EHuAEbC2E7+peL9ogaUYzKcswDSSeT82VOv6IUTVuurvrh/UrLZoUguwCRtiaOUFzjO/fhMV/iTH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744258656; c=relaxed/simple;
	bh=wgjhY07JmOy0jeSsmsRiIIIvXV7/C2jnGirbmw6AC1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i2rhp4uRfSEHrojzeNuHUJKwr8tjx+5JcfzKAKjn1Z3ly+Z7MZwHaf55aMIZC4piwJ722QSmiRDneFzCo/5LjZCFUE0JYKip/BvTGDezBUz7yVGqdREWL52Ir/l8TKEd+aYAOSd+WJDteg0ag3+E7+l52AZSR2EBn0mUvg6XR94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=3Kmi5CVo; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=bFhdk/0+; arc=none smtp.client-ip=155.254.16.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="3Kmi5CVo";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="bFhdk/0+"
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id DA9E012FB450;
	Wed, 09 Apr 2025 20:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1744257347; bh=wgjhY07JmOy0jeSsmsRiIIIvXV7/C2jnGirbmw6AC1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=3Kmi5CVo1pMM+cd4RUcdTA6+WpKsl0sw2hNQlSCy90nobFIE+EdyvMqIz6qIt4xQO
	 YoTjiReLhoHljyR09alsRvWxb3TgOf4P/s+S6Ef6zg+tJR2RPvBN/Wq/tNrkPxodRu
	 fGHlGf3Txa2lMG5UVTaHvjQ3SBfD0+GutoUrhAb0T3TOoBsWxsGCk5M+VfrLj3q5/Y
	 1bESY89v/TcRJWPKoLO0vUgMn6QFYoLPuI/67VwCe4xKkYz2HPNF9ze+tOnf79ReCi
	 Uly9/mPaTH9gtaDoq8W5R/q39GH0o7imlIF+ryVhMi71V1tHOZJRjekhXdbMI5MggS
	 t+rIQ0CFtVNRQ==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jhOuNXDkq9mH; Wed,  9 Apr 2025 20:55:44 -0700 (PDT)
Received: from ketchup (unknown [183.217.80.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 315EE12FB430;
	Wed, 09 Apr 2025 20:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1744257343; bh=wgjhY07JmOy0jeSsmsRiIIIvXV7/C2jnGirbmw6AC1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bFhdk/0+xneP8C6zaGA5j01SWTc7DIUXqS/VuSlQUu4ehDqhS3QvyZhq5ptAYjPdH
	 cX0I/pts2QfuFIBRyNb/HBBp/fP58CyMASAWv9UdQlZLVRGCy3zG7yL82crz3yqirn
	 q2zHi9dKvljxJUHDx2c7nzjTCNdziqtptMJFnSPMRHfDjdfBxDdvOnTp9u6/8x/FsZ
	 1lIKbBYHkS6WWrf/JQTjcWHOCQaQ+V8rX1IEqtake5D7QlKb+ax32R0QXVFISjyWqZ
	 ZvlHkA8f1CP0Oivlu9ZLF0voR6TbDuB3c+2+3Of4aN4luSGCOdOghiUAVNusVArIUj
	 PgAJv0BcxQbcw==
Date: Thu, 10 Apr 2025 03:55:35 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v6 3/6] clk: spacemit: Add clock support for SpacemiT K1
 SoC
Message-ID: <Z_dBN6b8LfeMq1gz@ketchup>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-4-heylenay@4d2.org>
 <20250410005522-GYB19359@gentoo>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410005522-GYB19359@gentoo>

On Thu, Apr 10, 2025 at 12:55:22AM +0000, Yixun Lan wrote:
> On 17:24 Tue 01 Apr     , Haylen Chu wrote:
> > The clock tree of K1 SoC contains three main types of clock hardware
> > (PLL/DDN/MIX) and has control registers split into several multifunction
> > devices: APBS (PLLs), MPMU, APBC and APMU.
> > 
> > All register operations are done through regmap to ensure atomiciy
> > between concurrent operations of clock driver and reset,
> > power-domain driver that will be introduced in the future.
> > 
> > Signed-off-by: Haylen Chu <heylenay@4d2.org>
> > ---
> >  drivers/clk/Kconfig               |    1 +
> >  drivers/clk/Makefile              |    1 +
> >  drivers/clk/spacemit/Kconfig      |   18 +
> >  drivers/clk/spacemit/Makefile     |    5 +
> >  drivers/clk/spacemit/apbc_clks    |  100 +++
> >  drivers/clk/spacemit/ccu-k1.c     | 1316 +++++++++++++++++++++++++++++
> >  drivers/clk/spacemit/ccu_common.h |   48 ++
> >  drivers/clk/spacemit/ccu_ddn.c    |   83 ++
> >  drivers/clk/spacemit/ccu_ddn.h    |   47 ++
> >  drivers/clk/spacemit/ccu_mix.c    |  268 ++++++
> >  drivers/clk/spacemit/ccu_mix.h    |  218 +++++
> >  drivers/clk/spacemit/ccu_pll.c    |  157 ++++
> >  drivers/clk/spacemit/ccu_pll.h    |   86 ++
> >  13 files changed, 2348 insertions(+)
> >  create mode 100644 drivers/clk/spacemit/Kconfig
> >  create mode 100644 drivers/clk/spacemit/Makefile
> >  create mode 100644 drivers/clk/spacemit/apbc_clks
> >  create mode 100644 drivers/clk/spacemit/ccu-k1.c
> >  create mode 100644 drivers/clk/spacemit/ccu_common.h
> >  create mode 100644 drivers/clk/spacemit/ccu_ddn.c
> >  create mode 100644 drivers/clk/spacemit/ccu_ddn.h
> >  create mode 100644 drivers/clk/spacemit/ccu_mix.c
> >  create mode 100644 drivers/clk/spacemit/ccu_mix.h
> >  create mode 100644 drivers/clk/spacemit/ccu_pll.c
> >  create mode 100644 drivers/clk/spacemit/ccu_pll.h
> > 

...

> > diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> > new file mode 100644
> > index 000000000000..cd95c4f9c127
> > --- /dev/null
> > +++ b/drivers/clk/spacemit/ccu-k1.c
> > @@ -0,0 +1,1316 @@

...

> > +/* APBC clocks start */
> > +static const struct clk_parent_data uart_clk_parents[] = {
> > +	CCU_PARENT_HW(pll1_m3d128_57p6),
> > +	CCU_PARENT_HW(slow_uart1_14p74),
> > +	CCU_PARENT_HW(slow_uart2_48),
> > +};
> > +CCU_MUX_GATE_DEFINE(uart0_clk, uart_clk_parents, APBC_UART1_CLK_RST, 4, 3,
> > +		    BIT(1), CLK_IS_CRITICAL);
> I'd request adding an explict documents for why need CLK_IS_CRITICAL flag
> (there are more place, I won't add comments)
> 
> Can you check this one? I think it's probably not necessary here,
> I can understand your concern of afraid of serial console breakage once clk
> driver merged, since we already enabled uart driver and using a dummy clk.. 
> 
> I think we probably could handle this carefully, sending an incrimental
> patch of uart to enable clk along with clk merged..

Yes, I've seen Alex's series on adding bus clocks to UART nodes and
could then depend on the series and add the correct UART clocks in
devicetree, then CLK_IS_CRITICAL to uart0_clk and uart0_bus_clk could go
away.

For other places applying CLK_IS_CRITICAL: it should be unnecessary for
cpu_c1_hi_clk, which is only a possible parent of CPU cluster 1's clock.
cci550_clk, cpu_c0_{core,ace,tcm}_clk and cpu_c1_{core,ace}_clk are
clocks for CPU cores. I think there's no good way to describe the
dependency in devicetree for now as we're lacking of a proper CPUfreq
driver, so I'd like to keep them as is (and may add a comment).

If there's a better way to handle these CPU clocks, I'd like to remove
the CLK_IS_CRITICAL flag as well.

> [...]
> -- 
> Yixun Lan (dlan)
> Gentoo Linux Developer
> GPG Key ID AABEFD55

Thanks,
Haylen Chu
