Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525CF132122
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 17:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749058275; cv=none; b=QCF/czZEB1UfxWkZWkB3FamHBMqF/yAwpy2XGQ3tdHXRbEbI3lI2iPT2SwkvWKEs3KgXT/gwx18Sq1cymZWJslX65ATr/LXQcQNPEEI+v7f/JYbZJvFvrlUuCC5fXdlumf1zaVFspXjWc3drSsbUL9cCFXJ1h35qZZ+9L/nREU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749058275; c=relaxed/simple;
	bh=q3sM5ckkqu3S1pmAwhJML99ONUvr7j4/sHrWjEGrst4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y1N8lHD+gzbyn2hkQbdfjO6ZWH/6oTzQN3/uWgmo3p8eQSjWGpD0XaEslk3s93aE9EEPFJKJKyENAW+YTtwn8UbAoxByNQf4c789hc5f8JKca928RXhm63BojwRWOJTAW0GhUhpRBq7YHZ9i++rYFT+Ru10mg8DwSpfTShAGCkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JzhMZbfn; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JzhMZbfn"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22c336fcdaaso718635ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 10:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749058273; x=1749663073; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xOObWxm0mCeJEpZwglb2CEVZr9rm6jEf/VR9UY9bUP8=;
        b=JzhMZbfnuYM+p039M/njIQ0ic2qUG/QZfO9DZZS7yP0TmyXg7knaNKGmUC11M4ZWMM
         iMb7psbuW29PNZR2Ekai5Y4wLJ3qCjI2dDD/i5IR5PknNt3uW7wRk4cu/GXz/Uxbm01k
         qK8QW0dKDejMbE1/FUNJmTDcEInqhO0unPHfkjvILPAwL2ktLpvxhQekeRSulqKWAzaO
         1dyKiQk1ah5ULVN6LhGsQdFpX+Gn0arGYCCSfaevyO4W1NFUARfD3GR+1mgoVNFRLOeO
         7sQWg6dJjTGI54eFoo1aZSp5zGMa93ZgA0eDnGTcl+Us/FZo0evtpcGY+oRQLVllNXD6
         M1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749058273; x=1749663073;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xOObWxm0mCeJEpZwglb2CEVZr9rm6jEf/VR9UY9bUP8=;
        b=OYe86UD3v/3Di+sOO2lIksC1l7M7Hfm9BZfv7EiDG+zc3kenc32vhaeR/dYcxHnMJj
         4ARssTTcKAJksOtqXi84A6N31jPGN8Uk4v3FGKU9YTIYzTr1ihlmwB2GGl/UPub30Lqg
         WSqStJf8yBA2ghnmxdmnpcCIQyxwT7WAkCX3Gkq1ppFfZaJLyNWf7X2M2dk95gwdF64T
         8C6AuD5S+lUdnb0ZQWZiIoRea0OIjI+9itnofAfqajzKiDAu/aVUzxu3BkEE1yOon2Ue
         V3BveqW3eT04kKoXegEUwCyE5d84Lwh3rI6mt2g8TkmTJknXeerLXyV62qbCBrH8lUGi
         /gqQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+k9TFlcw4X6Bk1Dw8nZmvaWkryYBMgbNP37A1s5XRm5/iEHQiKsdfCPONyQxQwCfO73MrE5KAyazMF40=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Hgq63oXpEd7fuBkDID8fCwsmEk4SisyuZmLVmrNuuMPJc2uk
	uGO6UVJWmlRSbuqFjrV/lRKDe1Cwg81mLWQEaRd+k5ivOBMuobj6epkDzzeBJM92iA==
X-Gm-Gg: ASbGncutWLoXy3U3EL7w1GFBAtFwSfwti2ZsPop5pl4oUJ20kdCHxSE0j7LmlrG4edG
	HtegCbtDNbMyhaSxUwywedT3Ye2EnY68vxW0BHG6SIQhCQT48K/ijcTAod3rh5+dhweDWetRsQ7
	zWNMkhtoGdIusywm/Aqpo0sL1igZ4zJeAfHxLQp5Bm9wEKb/oCCuuUC/fGK6eS2DG3C1eRt8jsN
	jVEqLIX5CgAvrMaJ2BXZhmgedaUZ9UOlPHu0yY9XdwK7jCkIEBWZvgZgU0hFjn5KZXeqK/hqHO7
	GaaGkFmud6uaYeCnZ6DJfhBOwcn9+9JA6a3yD0hB+GSgZmdCHIN0HjaQPIb1NA==
X-Google-Smtp-Source: AGHT+IGIJbSx2qDc2q2Gt3qbCZCgqmWW4FPwxtFTdbgDTBwo3IdO7XqHuYRl/uF5BzOmzUrf40UoSQ==
X-Received: by 2002:a17:903:1c9:b0:235:6e7:8df2 with SMTP id d9443c01a7336-235e11fcb67mr57141715ad.41.1749058273586;
        Wed, 04 Jun 2025 10:31:13 -0700 (PDT)
Received: from thinkpad ([120.60.60.253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf50c9sm106668185ad.162.2025.06.04.10.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 10:31:13 -0700 (PDT)
Date: Wed, 4 Jun 2025 23:01:02 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: r8a779g3: Describe split
 PCIe clock on V4H Sparrow Hawk
Message-ID: <egtsvxsfc5c2s4hrwucsqk3s5dv7xsi6ghrnf6jd3mvf3zvskb@z7hvehbd33t5>
References: <20250530225504.55042-1-marek.vasut+renesas@mailbox.org>
 <20250530225504.55042-3-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUVYzaUyP=OUOST8SK66_BpubOh0WCXcaVWBy=RxBrquA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUVYzaUyP=OUOST8SK66_BpubOh0WCXcaVWBy=RxBrquA@mail.gmail.com>

On Wed, Jun 04, 2025 at 11:24:17AM +0200, Geert Uytterhoeven wrote:
> Hi Marek,
> 
> On Sat, 31 May 2025 at 00:55, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
> > The V4H Sparrow Hawk board supplies PCIe controller input clock and PCIe
> > bus clock from separate outputs of Renesas 9FGV0441 clock generator chip.
> > Describe this split bus configuration in the board DT. The topology looks
> > as follows:
> >
> >  ____________                    _____________
> > | R-Car PCIe |                  | PCIe device |
> > |            |                  |             |
> > |    PCIe RX<|==================|>PCIe TX     |
> > |    PCIe TX<|==================|>PCIe RX     |
> > |            |                  |             |
> > |   PCIe CLK<|======..  ..======|>PCIe CLK    |
> > '------------'      ||  ||      '-------------'
> >                     ||  ||
> >  ____________       ||  ||
> > |  9FGV0441  |      ||  ||
> > |            |      ||  ||
> > |   CLK DIF0<|======''  ||
> > |   CLK DIF1<|==========''
> > |   CLK DIF2<|
> > |   CLK DIF3<|
> > '------------'
> >
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> Thanks for your patch!
> 
> > V2: Use pciec0_rp/pciec1_rp phandles to refer to root port moved to core r8a779g0.dtsi
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> I understand this has a hard dependency on [PATCH v2 1/3] (and on
> enabling CONFIG_PCI_PWRCTRL_SLOT), so I cannot apply this before that
> patch is upstream?
> 

TBH, this patch is describing the binding properly. So even though the driver
change is necessary to make the device functional, I don't see it as a hard
dependency. But since people care about functionality, if both driver and DTS
changes go into the same release, it should be fine IMO.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
