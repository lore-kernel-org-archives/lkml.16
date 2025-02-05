Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4332135C6
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 03:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738727547; cv=none; b=QztQ2jlI1bECnzkWsJybomlt8hrhOiwhLf/pQmTiwkJZduyWOrF86m5RJjq6gQOPh6WxkYYFAckhqn754HMdsb4a7UwzZvpnspMOnZ/zS6v6X+cLkGur/9CdGLBSz3YhmJqtRriK9j9FAftlkcCo2JPZhHRjkPGs0Sb+5ppXfes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738727547; c=relaxed/simple;
	bh=FZxJGHQlT9DI/NO09r7wJ3UYpH5tIrkULYGc3tBIlWc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QgeaNRAFOK6R3wBcaFA/WGBkuKbEHBBKkqczoXcpJ7P6qH8WKPLvvY9dYw3GqFtLcIlP9Mod//smF2u9zcVPw+Swjmey5ZVIT3GgnR+pxNmBilOeqgPwcPZ+FduCQv1OzJ3q8f8Rwnn/Z7+7KX275OiWZs/IceDd7jya4V1jX5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=iQd8PfzG; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="iQd8PfzG"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5153pmjM2460265
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Feb 2025 21:51:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738727508;
	bh=bc7DrfXMiezmhGSHNHfGUSjT2T5Wh+3CSoZhxlscp40=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=iQd8PfzGJvn6kZEwBKEC0HfTlonncmeI6BjPErkIQC0jkSBy1WqtFJr9zrgLE+1OW
	 /pMI04O8qLZU98gGLlxq2YnaHcriflI6spXSVP+omc5IW8HHq72nr2LOeisv1Xie6s
	 loNPvTlb/9vFeo9s/oFU7SS9sK9Pkr3qDC1DqFPs=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5153pmnG003193
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Feb 2025 21:51:48 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Feb 2025 21:51:48 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Feb 2025 21:51:48 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5153pmHF047406;
	Tue, 4 Feb 2025 21:51:48 -0600
Date: Tue, 4 Feb 2025 21:51:48 -0600
From: Nishanth Menon <nm@ti.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Vaishnav Achath <vaishnav.a@ti.com>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <quic_bjorande@quicinc.com>,
        <geert+renesas@glider.be>, <krzysztof.kozlowski@linaro.org>,
        <dmitry.baryshkov@linaro.org>, <arnd@arndb.de>,
        <nfraprado@collabora.com>, <ebiggers@google.com>, <ardb@kernel.org>,
        <vigneshr@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <nfrayer@baylibre.com>,
        <glaroque@baylibre.com>, <tglx@linutronix.de>, <u-kumar1@ti.com>
Subject: Re: [PATCH v2] arm64: defconfig: Enable TISCI Interrupt Router and
 Aggregator
Message-ID: <20250205035148.krqvlysv73d4wcgs@uncooked>
References: <20250203150801.2399555-1-vaishnav.a@ti.com>
 <CAMuHMdUOMCxfsOrUF3-6PX0ZZ_E2g1SK4bwDqZE=mWiibPFt1A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUOMCxfsOrUF3-6PX0ZZ_E2g1SK4bwDqZE=mWiibPFt1A@mail.gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 08:42-20250204, Geert Uytterhoeven wrote:
> Hi Vaishnav,
> 
> Thanks for your patch!
> 
> On Mon, 3 Feb 2025 at 16:08, Vaishnav Achath <vaishnav.a@ti.com> wrote:
> > Enable TISCI Interrupt Router and Interrupt Aggregator drivers.
> > These IPs are found in all TI K3 SoCs like J721E, AM62X and is required
> > for core functionality like DMA, GPIO Interrupts which is necessary
> > during boot, thus make them built-in.
> >
> > bloat-o-meter summary on vmlinux:
> >         add/remove: 460/1 grow/shrink: 4/0 up/down: 162483/-8 (162475)
> >         ...
> >         Total: Before=31615984, After=31778459, chg +0.51%
> 
> My first thought was: that's a hefty size increase for two rather
> small drivers!  So I enabled these two options in one of my own kernel
> configs, and saw a size increase of only 7872 bytes...
> 
> > Fixes: 2d95ffaecbc2 ("irqchip/ti-sci-intr: Add module build support")
> > Fixes: b8b26ae398c4 ("irqchip/ti-sci-inta : Add module build support")
> >
> > Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
> > ---
> >
> > V1 : https://lore.kernel.org/all/20250119182121.3956546-1-vaishnav.a@ti.com/
> >
> > V1->V2:
> >         * Add Fixes tag.
> >         * Add bloat-o-meter summary to commit message.
> >
> > Previously both of these configs were selected for ARCH_K3 in respective
> > Kconfigs, but commit b8b26ae398c4 ("irqchip/ti-sci-inta : Add module build support")
> > and commit 2d95ffaecbc2 ("irqchip/ti-sci-intr: Add module build support")
> > in dropped this recently without adding those back in arm64
> > defconfig, this causes boot failure in all TI K3 platforms.
> >
> > Passing bootlog with configs enabled:
> > https://gist.github.com/vaishnavachath/03d8d3ce0f22219643c2f4d1dd243fd1
> >
> >  arch/arm64/configs/defconfig | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index cb7da4415599..1f25423de383 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -1551,6 +1551,8 @@ CONFIG_PWM_VISCONTI=m
> >  CONFIG_SL28CPLD_INTC=y
> >  CONFIG_QCOM_PDC=y
> >  CONFIG_QCOM_MPM=y
> > +CONFIG_TI_SCI_INTR_IRQCHIP=y
> > +CONFIG_TI_SCI_INTA_IRQCHIP=y
> >  CONFIG_RESET_GPIO=m
> >  CONFIG_RESET_IMX7=y
> >  CONFIG_RESET_QCOM_AOSS=y
> 
> However, on arm64 defconfig, this has indeed a much bigger impact,
> as it also (re)enables several other drivers that depend on the
> irqchip symbols.
> 
> You probably want to mention that in the commit message...

Thanks Geert and I agree. This however just restores the status quo as
it was in 6.13 tag kernel (and ofcourse the default boot status).

Will be good to mention that as well - in effect, we are just restoring
the behavior, not introducing new features.

Side note: We are still working towards fixing up other driver modules
and some time in near future, hope to transition to initramfs boot as
default in a single patch.. but till then let us maintain the status
quo.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
