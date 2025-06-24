Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A36835975
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 04:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750738168; cv=none; b=CqSUiU2ypW5fiGGYQPT4cxM9e5gfZe7H9YfWZaCE39dKYiP8fPQRJhKj5qrcUtL2TMkb8KM6oSnj+767pQag+dC3CCnDlvdcIghhEEbyJB6Xtu2ue+xV+98ZtOI4IpVrjMY8zagMjpEBIUSYhb6UmWgPL6qpL1tiXs6YYAatgZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750738168; c=relaxed/simple;
	bh=llL1b/tMVw+11+IKe3ZnE3pVeGhnuAyfrOKK27BdZsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T/azTtJZl99zrGAYO87Oi9aD+ejOgZhIBcccQmMGa7S3OcwTR7Ebx4VyH4blIsnXaSexn26ymo/hYIuJsQpsQy7jzxu5hzyGqnH7oAjawMDLMl6a1ffOVvtIH/3e6mvcG4ZzDC8zDN4I6sB4/kvmw39Pe7f8cmuH/VqbWKyhdak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Uij9b74B; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Uij9b74B"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-742c7a52e97so6577b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 21:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750738166; x=1751342966; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iZLBQ5GMO3S5FZKU93RAqvRqbEiTSgWH++nyXw8Nmek=;
        b=Uij9b74BSFX4VCnpzYoOrHnMEd1rTDyh0Ss38HWjhF1sJaA49vSmR9uL89VtCWZ9yp
         pQkEXBl4QQ+s6SnhHpwqoO+D4QLzmtNBiNPb0GXBoU0OxMwzhfeNoCX8HpkHsZ+CVKbg
         ySa1FfHVOf6oa+QhkMwOedduFzr/J83hBi13A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750738166; x=1751342966;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iZLBQ5GMO3S5FZKU93RAqvRqbEiTSgWH++nyXw8Nmek=;
        b=o9rZSZYvGwNOZN2s5JS0zrLafLb0XAb8qG6Jm1xB1G3fdYaUy7CaQz4vAXTYLbZ2au
         dAH5zbtUWTffOFJZhFCtm9KV6OZkZV657XBRC+2AoNZC+GZuAEllEqui09zyk12kIL0W
         GOvY6XyBUYTOvzC6EJvCBD7v3aHSY7AojEcfJP+41liFFgrcJBn8+m1RCsUUMe2F7AJB
         v4d4cqfJtTG4ABqam5z9HazroRexRomdk432hgXDVzCe8OL/9aG4OX5ZXn6jtuv0S8lL
         F4igQUqPgM9qR8G8S4zmi27w8nGIPIrUg7uSLXxSXabFHmwRTS9NlUENJsSK1+0dJiv0
         zGjA==
X-Forwarded-Encrypted: i=1; AJvYcCXFdqZmuUTkhJPLtn8D3JYEUB4fO//eq3PUbR7AsCV4VkhdqbFu/tZi5aEYnbqMqOrF/xw67sQlvpAot9k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7Yi/m8WRAsz4VcYQMjHLnnS1XnVXpFhD4JmbdzfPugtgIOgX3
	HRXGeQ0ZRMjsJHZbJxVP3pYOFQCcXyRpGhkATydyL1k+4wh1G50bmmUUk+dCngMjZA==
X-Gm-Gg: ASbGncsc80uTYhY72ZQemJnNEqP460llItBkbfU+m1vJShTBFgcDpJHRjvp5A5Vh6tF
	eGdFZwOP3P7nRiGCp8BWhUssRqCex5hMus5XBnYYtsYomolfBCEZbBs1SQuAPqSuiOT3vYq0j/A
	mVUJkF0Zi6by4b7ze70oZGg8IaYbM4CdwEc2djH8gE5eqYIIQER44KfT96eToA/wSS3z01sG3YH
	GW634pJWSM/j3yWhJ4QXokUAfIf95YieFQVnuwkRPv4drn27Vk1IZljLnmiSkMhPFs0KwTSDv3/
	+mP2ewvUJV3wR0IDGqGGuVr3vgjOojx0Fpxp1w218IhftrUdeWwNK6g=
X-Google-Smtp-Source: AGHT+IE7k5HWqp6yZ4coLK9zxOOKVUatWn7F2bJv6NZWHFFs+9T9PielkjniSbuXSSxVbFmuLwM0yQ==
X-Received: by 2002:a05:6a00:b8f:b0:736:3ea8:4805 with SMTP id d2e1a72fcca58-7490d7a170cmr19157532b3a.7.1750738166415;
        Mon, 23 Jun 2025 21:09:26 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:9e4d:2f37:d5ea:8954])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749b5e4069csm679035b3a.65.2025.06.23.21.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 21:09:26 -0700 (PDT)
Date: Tue, 24 Jun 2025 12:09:22 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com, weiyi.lu@mediatek.com,
	tinghan.shen@mediatek.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH v1 1/2] arm64: dts: mediatek: mt8195: Add subsys clks for
 PCIe power domains
Message-ID: <20250624040922.GA1077353@google.com>
References: <20250402090615.25871-1-angelogioacchino.delregno@collabora.com>
 <20250402090615.25871-2-angelogioacchino.delregno@collabora.com>
 <CAGXv+5GHf5D3JDh+OZ-Cxf91PTAGYk2+jvuwK1gymy=k1YOo_A@mail.gmail.com>
 <33847b76-11b5-4233-a5e6-9f8fd3c691a2@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <33847b76-11b5-4233-a5e6-9f8fd3c691a2@collabora.com>

On Wed, Apr 02, 2025 at 12:07:16PM +0200, AngeloGioacchino Del Regno wrote:
> Il 02/04/25 11:34, Chen-Yu Tsai ha scritto:
> > On Wed, Apr 2, 2025 at 5:10 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> > > 
> > > The PCIe MAC needs the sram to be powered on for internal IP
> > > access and it has always worked before because the bootloader
> > > on Chromebooks was leaving the PCIe PERI_AO MEM clocks on
> > > before booting the kernel.
> > > Add the SRAM (mem) clock as a subsystem clock on the PCIe MAC
> > > P0 and P1 to correctly describe the hardware and to avoid any
> > > issue with bootloaders behaving differently.
> > > 
> > > Fixes: 2b515194bf0c ("arm64: dts: mt8195: Add power domains controller")
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > ---
> > >   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > > index b33726da900b..0cb96cba727a 100644
> > > --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > > +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > > @@ -792,12 +792,16 @@ power-domain@MT8195_POWER_DOMAIN_CAM_MRAW {
> > > 
> > >                                  power-domain@MT8195_POWER_DOMAIN_PCIE_MAC_P0 {
> > >                                          reg = <MT8195_POWER_DOMAIN_PCIE_MAC_P0>;
> > > +                                       clocks = <&pericfg_ao CLK_PERI_AO_PCIE_P0_MEM>;
> > > +                                       clock-names = "ss-pextp0-mem";
> > 
> > Doesn't the PCIe host controller already reference this clock?
> > 
> > >                                          mediatek,infracfg = <&infracfg_ao>;
> > >                                          #power-domain-cells = <0>;
> > >                                  };
> > > 
> > >                                  power-domain@MT8195_POWER_DOMAIN_PCIE_MAC_P1 {
> > >                                          reg = <MT8195_POWER_DOMAIN_PCIE_MAC_P1>;
> > > +                                       clocks = <&pericfg_ao CLK_PERI_AO_PCIE_P1_MEM>;
> > > +                                       clock-names = "ss-pextp1-mem";
> > 
> > Not this one though, since:
> > 
> >           /* Designer has connect pcie1 with peri_mem_p0 clock */
> >           <&pericfg_ao CLK_PERI_AO_PCIE_P0_MEM>;
> > 
> 
> I'm not sure what this comment refers to - as in, whether this is referring
> to the board designer or to the SoC//IP designer...

When MediaTek says "designer" they are referring to the hardware designer,
in this case I believe it would be the SoC-level hardware designer /
integrator.

> ...but if MediaTek can clarify, I'd be happy :-)
> 
> Cheers,
> Angelo
> 
> > 
> > ChenYu
> > 
> > >                                          mediatek,infracfg = <&infracfg_ao>;
> > >                                          #power-domain-cells = <0>;
> > >                                  };
> > > --
> > > 2.48.1
> > > 
> > > 
> 
