Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5BC189915
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 20:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746564463; cv=none; b=Spkg7IaUDxGC/oLWNgYq9lPawqT2MwXzuUZU2QpSkIlKM41BLIJmaffArLR+6+cZ6n53WoqseZIoYXnJ1ivnm4gQ8noo78tUXRInzpbBX9uSVJvIwEp1+q20P/kLviy+VFSSjJ9d9vBOVfzWqiNy2995cRFIvRLjUcc5+3dSVvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746564463; c=relaxed/simple;
	bh=HoSPNJpzAj/UHgTcCm+14l6OqVn0UOHxo2Yn1NKbwwc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5nMbfb5Jx+dvg6oEN/PVzXUGja6z3L2JDuPzxlueOS2jbDMVOppCu2b2nkfuhuJYdyvUoMky1OYKqnOcrircT68605b5XsXQbxPU2itSEmcbVw4Bd96jKOWK7jf5W8kuj3BCovvwMrikLQ5lhtc0YKSkkMSaTObrWfNpQvLRrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gBDh+uwv; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gBDh+uwv"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-acacb8743a7so50726066b.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 13:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746564459; x=1747169259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pi47gK8MYhyGIqIdKO9+ShtObSRr4S3t2PvkIQxuaXA=;
        b=gBDh+uwvqOEb3fLM4eNviuqwt3dZpUuSnrvnEac6apQCsRqOMi0E89SJlebAeuGJlu
         29jc5MflQOtiZdAlaW7UueewAZmgrE7KnNq3XfTDdFzT3YWTZmNXIUKCYiuWnULLyGal
         HOPF+AUrGqI0fCB5N+IkmdMarL8VDvUzvvvTcTaRcoK//+MtWrgjrxAI7Qv4u3atBkOf
         L5SYGvvF2J1mNeaNHcivYH2+j+AS2Gk2KTJEUPV/l7xQuQcQmwyQ87PtJPmRQHNOfv8t
         H8FGhg7pxvHH1k/TkfPJAiv/OHRQqJTTOqVhL9XwbUWPx+dTUKJYNLazYYmAXYEp3B4Y
         GCoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746564459; x=1747169259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pi47gK8MYhyGIqIdKO9+ShtObSRr4S3t2PvkIQxuaXA=;
        b=vjrNm/aSchwsaaYsBCTRwiEegIMSNjQZsGmQaY5/tjDLMmiFCUTjWStCkhMLx7bRnh
         ZOniDl+8oVy5TbOh/SacWkQ1UhV/IRS2VUSXd9eB0vv0jPN+vHHmbW0rJlHwZ1ikxZOW
         ncUQYzHkiDThCUBX9GOQrBm3dsP6CB3YGyiuo1RL9TrnRnVTH5O6cO2utB61fg7TcANg
         YMbcW5hvlRSB5o9PU5yMgV0NjJCtP7fmow/LezuBbFeGxK/oMEk5jwVR4SD+eg20R4Yt
         wXE0RppRqd1SgZ+RadpnfkYnPZzsjxqSbw4Q47zKzKZGSfippEs6HpAV2jzfEbEV9z6i
         3vQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkwRgkGO8hbToPA4Lu9dtOmRkE6qyJWMLZBT9n/s5CQiq8S+GYpjrMU06lVJAS7fB46/Ruar/xWfizmfI=@vger.kernel.org
X-Gm-Message-State: AOJu0YysZo011Tslc4fFE1otkCZsa1DaDCcMDLyH3NPPXdoEvmZ/fM8k
	NgtAoHR+cSHod+06yc4RS5IFDtE2CWRxBLqhRAXrmklrAW/g5MSU6jKtW/HJqYw=
X-Gm-Gg: ASbGncs8AEoo8HFIta1/iyU7JdsuvMmPTU33IzOGOG0IibHNiMkxO4nbUWLyaWcFEAI
	M/6jtzmOFy29LuQTwxZI+9IdWCXsWqa676i/GQUbwr8XdgiC4wfv9/XlAY08OW4aRhhaWAHemxw
	SDqtnbNJ9ESDlZQLgV2hnkxhMcYWU+dh3BHodQTre9bMAuqtDCMAJkClaAskjUr0g2sIa3mBuBC
	dYWzVdMR9dPalh+eqGZx4rXe39UVDFT3e1ynss1sP+2grQ187g/xKGMyPSiBgE3b2haG46chYBa
	G3lU4GkKzLD0iBu/u9TshAxOHTrLkVmKUPCZaT61AeU2fpI2XzbGMNyFUCisaza343gj7b4=
X-Google-Smtp-Source: AGHT+IGdejKWhHgobANcBR0HkA6BZ7303l9tnuRyiuAvIspM7E6yB+9PaEvl5m9+eOZo13IwvIZIoA==
X-Received: by 2002:a17:907:6d23:b0:ac7:3929:25fa with SMTP id a640c23a62f3a-ad1e79a28bamr109364566b.30.1746564459254;
        Tue, 06 May 2025 13:47:39 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189540d5bsm770703266b.176.2025.05.06.13.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 13:47:38 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 6 May 2025 22:49:07 +0200
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com, Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH v9 -next 08/12] arm64: dts: bcm2712: Add external clock
 for RP1 chipset on Rpi5
Message-ID: <aBp1wye0L7swfe1H@apocalypse>
References: <cover.1745347417.git.andrea.porta@suse.com>
 <38514415df9c174be49e72b88410d56c8de586c5.1745347417.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38514415df9c174be49e72b88410d56c8de586c5.1745347417.git.andrea.porta@suse.com>

Hi Florian,

On 20:53 Tue 22 Apr     , Andrea della Porta wrote:
> The RP1 found on Raspberry Pi 5 board needs an external crystal at 50MHz.
> Add clk_rp1_xosc node to provide that.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

A gentle reminder for patches 8 through 12 of this series, which I guess
would ideally be taken by you. Since the merge window is approaching, do
you think it's feasible to iterate a second pull request to Arnd with my
patches too?

With respect to your devicetree/next branch, my patches have the following
conflicts:

PATCH 9:
- arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts: &pcie1 and &pcie2
  reference at the end, my patch was rebased on linux-next which has them
  while your devicetree branch has not. This is trivial to fix too.

PATCH 9 and 10:
- arch/arm64/boot/dts/broadcom/Makefile on your branch has a line recently
  added by Stefan's latest patch for RPi2. The fix is trivial.

PATCH 11 and 12:
- arch/arm64/configs/defconfig: just a couple of fuzz lines.

Please let me know if I should resend those patches adjusted for your tree.

Many thanks,
Andrea


> ---
>  arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> index 34470e3d7171..6ea3c102e0d6 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> @@ -16,6 +16,13 @@ chosen: chosen {
>  		stdout-path = "serial10:115200n8";
>  	};
>  
> +	clk_rp1_xosc: clock-50000000 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-output-names = "rp1-xosc";
> +		clock-frequency = <50000000>;
> +	};
> +
>  	/* Will be filled by the bootloader */
>  	memory@0 {
>  		device_type = "memory";
> -- 
> 2.35.3
> 
