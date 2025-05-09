Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEC2266B4E
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 06:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746770464; cv=none; b=RxO1d0yCZSosGei3sHdO6Xe8pWn8HPw+PMwdHOcUtjSG+sHSZbcYMzOYO2M1xvVlbUprZHtVBSTG6JeX7hQnvWdSwpfB7cz/GXDhKMmL8V0ruuTasMj47+j5F6Dsp57Zg0e2rVCW8/76dIwSb0OpXsc0+PFVm4iP0E8I82S0XUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746770464; c=relaxed/simple;
	bh=iMC+wmxymIFqPTNdVrLvdX+TjkSiglWerKKQ9Lw+V1Q=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BFl+Q3Doikk835j2LBU6hIWDP/tobKkzulh8NOP6INylBXiyWuYMB6c1X1HbZba91VLugsNu67qrOxK7qQGm6doUYLp9ztJNZStCw1GmG8MwnTvbh3pBMJurDJTTvUVpstDeoLB4kaJamV+1WE5XnoFf3G9yM48YiHiV0xANorU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 54960Bnb078767
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Fri, 9 May 2025 14:00:14 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from atctrx.andestech.com (10.0.15.173) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 14:00:11 +0800
Date: Fri, 9 May 2025 14:00:11 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
CC: Conor Dooley <conor@kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <tim609@andestech.com>
Subject: Re: [PATCH] riscv: add Andes SoC family Kconfig support
Message-ID: <aB2Z6zq+pQ1LxQ47@atctrx.andestech.com>
References: <Z8rMKZoDYmpNosSj@atctrx.andestech.com>
 <mhng-d0a8012c-c5c9-4309-ac08-bcb1dab85b26@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <mhng-d0a8012c-c5c9-4309-ac08-bcb1dab85b26@palmer-ri-x1c9a>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 54960Bnb078767

On Thu, May 08, 2025 at 10:48:46AM -0700, Palmer Dabbelt wrote:
> [EXTERNAL MAIL]
> 
> On Fri, 07 Mar 2025 02:36:25 PST (-0800), ben717@andestech.com wrote:
> > On Thu, Mar 06, 2025 at 04:40:49PM +0000, Conor Dooley wrote:
> > > [EXTERNAL MAIL]
> > 
> > > Date: Thu, 6 Mar 2025 16:40:49 +0000
> > > From: Conor Dooley <conor@kernel.org>
> > > To: Ben Zong-You Xie <ben717@andestech.com>
> > > Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
> > >  paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
> > >  alex@ghiti.fr
> > > Subject: Re: [PATCH] riscv: add Andes SoC family Kconfig support
> > > 
> > > On Wed, Mar 05, 2025 at 11:05:26AM +0800, Ben Zong-You Xie wrote:
> > > > The first SoC in the Andes series is QiLai. It includes a high-performance
> > > > quad-core RISC-V AX45MP cluster and one NX27V vector processor.
> > > 
> > > I'd expect a config option like this to come with the user, which in
> > > this case is the dts etc for a board using the QiLai SoC or drivers for
> > > the SoC. Without dts or drivers, there's no reason to ever enable this,
> > > so where are those patches?
> > > 
> > > Cheers,
> > > Conor.
> > > 
> > 
> > Hi Conor,
> > 
> > We are still preparing those patches for upstream, and we will add them
> > in the next patch series.
> 
> This is still "Needs Ack" in patchwork, so
> 
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> Though like Conor says, we need the rest of the code to do anything
> here, so that's really just a way to get it out of my queue ;)
>

I have not added the remaining code in the next version of this patch series.
Instead, I’ve submitted a new patch series [1] that incorporates this patch.
Maybe add your Acked-by tag to the new series and disregard this patch.

[1] https://patchwork.kernel.org/project/linux-riscv/cover/20250503151829.605006-1-ben717@andestech.com/

Thanks,
Ben

> > 
> > Thanks,
> > Ben
> > 
> > > >
> > > > For further information, refer to [1].
> > > >
> > > > [1] https://www.andestech.com/en/products-solutions/andeshape-platforms/qilai-chip/
> > > >
> > > > Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> > > > ---
> > > >  arch/riscv/Kconfig.errata | 2 +-
> > > >  arch/riscv/Kconfig.socs   | 9 +++++++++
> > > >  2 files changed, 10 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> > > > index e318119d570d..be76883704a6 100644
> > > > --- a/arch/riscv/Kconfig.errata
> > > > +++ b/arch/riscv/Kconfig.errata
> > > > @@ -12,7 +12,7 @@ config ERRATA_ANDES
> > > >
> > > >  config ERRATA_ANDES_CMO
> > > >    bool "Apply Andes cache management errata"
> > > > -  depends on ERRATA_ANDES && ARCH_R9A07G043
> > > > +  depends on ERRATA_ANDES && (ARCH_R9A07G043 || ARCH_ANDES)
> > > >    select RISCV_DMA_NONCOHERENT
> > > >    default y
> > > >    help
> > > > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > > > index 1916cf7ba450..b89b6e0d1bc9 100644
> > > > --- a/arch/riscv/Kconfig.socs
> > > > +++ b/arch/riscv/Kconfig.socs
> > > > @@ -1,5 +1,14 @@
> > > >  menu "SoC selection"
> > > >
> > > > +config ARCH_ANDES
> > > > +  bool "Andes SoCs"
> > > > +  depends on MMU && !XIP_KERNEL
> > > > +  select ERRATA_ANDES
> > > > +  select ERRATA_ANDES_CMO
> > > > +  select AX45MP_L2_CACHE
> > > > +  help
> > > > +    This enables support for Andes SoC platform hardware.
> > > > +
> > > >  config ARCH_MICROCHIP_POLARFIRE
> > > >    def_bool ARCH_MICROCHIP
> > > >
> > > > --
> > > > 2.34.1
> > > >
> > > >
> > > > _______________________________________________
> > > > linux-riscv mailing list
> > > > linux-riscv@lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/linux-riscv
