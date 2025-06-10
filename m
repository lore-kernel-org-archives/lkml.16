Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FB029A0;
	Tue, 10 Jun 2025 02:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749520871; cv=none; b=kAdkgKZvpqBrrrE2nhe9VkQNhdKOfqHPQKR9hEC/XR1+OMomIdHZPJC7APvK4BpY6umEzXdVGfR3v4PtDql6XGEIddH+e/5d9Os4tgdzLhjlY1DCVJWSh4vlyeO1EPMmk4k5RVHW/5AsJLubFkM5ZEoNguN/z+Ez0zcqWj9ORWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749520871; c=relaxed/simple;
	bh=CyNwbY6nEr0olQ6LJ2zGtYSCQHhinzwFP0N0A0awhxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qq8Psdhbd5i7cgfVL9ZTeafMNE7GTrMjiLOgGAocVXX3GymzOHPCWQNkFJn+l0AYqxbH04WPjxpROuOkt/w9uFYv5bdDL3ChOUJmKwkYw8WYgoT4Nwm86QxbHJRylORJKhUJsZ5oKvVABY7ZoZfGsJPQgYxVp6cpYRPQ2jZH7K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZIpuRrWY; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZIpuRrWY"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c5a88b34a6so482404885a.3;
        Mon, 09 Jun 2025 19:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749520869; x=1750125669; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w6JdwJlEWwWtngse9JGszpYE1mZus0TKH2ovIgjd1RE=;
        b=ZIpuRrWYG8Ax2jqI/AgHHhjvqA4gg97DqRIwhIyWcQh6D3+RuMH6rafZguEmpwzFwJ
         LhXInf9B+He1c0XyLcqHzQqBlb/afxLRYIwG6kkpiWV9f+mhZCXWeAM9HbpaMEnrpGq1
         s66mCWUbrOjsKq9BNyOHj6p20Gtjk7QuMGqvmXa/lKgQF3sSLWkbTUbchATYkqoDvTXY
         570bUahlzrdD0VzPBb07cP8XkOP5HTE7KtWRG4z+eusN0tRQb1k7MTNNTjLiSr4dAVKR
         72cX4mISX8VdoHkGaQQd4cl2pM4HzRoUD7KqppRzARWfZt8Nfrm1/LEGdiI2/uknO8fY
         yjpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749520869; x=1750125669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6JdwJlEWwWtngse9JGszpYE1mZus0TKH2ovIgjd1RE=;
        b=cG5K2+y66vSxeDKDOmHW/PlxZ7z4qW9x7cHkTtCD+c/+14n8iTfWWtDVO2qDY4x/EQ
         uHG6X/b+MHay91/WwYkyyv6ydmvsUESKnVvEXMW8tRhQaoahO5ajZbB0GlpsJl6oBryt
         P4Sl1D6sWoRje66aYBcTiylLIDNb+9HCemamxfCxhXLWEG7zJIUkdAXfcISjpw+Xc6Yc
         ygsl4qxvFBalxYkYFueTUyAKFlEs9UEgCmmtVbipbVtf/OwlMQMFEpXL5/lFOGupGaqe
         mUVHAJZxVFy6GUZrP6XyJmOW/ekene8H7PtJdUmuLh+fONtgJ5nBK8qjH5mZoVRkJmFl
         HDGA==
X-Forwarded-Encrypted: i=1; AJvYcCWEETsvsqJhz+mOLfR9XxwtGAaOUWg96qBdhtWF5BGu6UWJWCaM7ZbIsE2mJL1R3mRdpdAEZInihkC3i9d5@vger.kernel.org, AJvYcCX0L03sWC0fx4pEvuAZL6Yi/ElroqNhP2m1jc+8jgo3BIuHFkQWAdihiUgvosacOSK3oiBiLw1wTA3Q@vger.kernel.org
X-Gm-Message-State: AOJu0YzITakhDda5xVacfCj73pR272uURLMpgGFIhpygDHGKWS5hJT9L
	+Sx2Qz2EXJexpwvtApeIVijqasbkb8fEIV6F/vfGhCA7rwbv1p8+DSHE
X-Gm-Gg: ASbGncuVLStpJI8XOJZJ9qDYLnO4j6fL4xT9WsHNmq7cGjKfUKflyNmvCq2InUTbQbu
	iDzd6VBrU3F7PW1GAsvUbO3QuMyOM0TCMpJFKKCqma39jxPR6wGA1coF42yWw9TrgMEdtavirfZ
	M93d9J2E/Bb2WXawYQgQDjXKEQfYjM6U6+W8vy/cuzEvvt5Bbpg076Frh2C4Ul2YkdFelT0GATk
	CfDj5E6t39mdpUjj0yKX63fjPIlUBk8/EQgsqTZN2Lki83bqIdXLzEnxHVn24JSsmGtVX6jn2Kc
	P6MeSWZq6iJ/pQHLC3y8r73XD8bp6kICrkw7TA==
X-Google-Smtp-Source: AGHT+IH15GV3DBze0O0Pg4+wloDqugMihWd6D/DIzMiu1G03qL/lbAtUUB6hL47UJJsPSF118+iHFw==
X-Received: by 2002:a05:620a:4151:b0:7d2:279d:c18d with SMTP id af79cd13be357-7d2298ec94amr2846349785a.36.1749520868837;
        Mon, 09 Jun 2025 19:01:08 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d2513357dbsm625576185a.13.2025.06.09.19.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 19:01:08 -0700 (PDT)
Date: Tue, 10 Jun 2025 10:00:02 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	sophgo@lists.linux.dev, soc@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Jisheng Zhang <jszhang@kernel.org>, Haylen Chu <heylenay@outlook.com>, 
	Chao Wei <chao.wei@sophgo.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 0/6] arm64 support for Milk-V Duo Module 01 EVB
Message-ID: <yavt4eztc4n74h55ilqbw46df6hxh4j3uwuefbzcsx7vxezrnn@5mpll7lymyp4>
References: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609234125.722923-1-alexander.sverdlin@gmail.com>

On Tue, Jun 10, 2025 at 01:41:11AM +0200, Alexander Sverdlin wrote:
> This series adds very basic support for Milk-V Duo Module 01 EVB [1] in
> arm64 mode. The SoC (SG2000) is dual-arch, RiscV and ARM64, the latter has
> been chosen because the upstream toolchain can be utilized.
> 
> Sophgo SG2000 seems to be a continuation of the Cvitek CV18xx series, same
> peripherals with an addition of ARM64 core. Therefore it would be
> beneficial not to copy-paste the peripherals' device-tree, but rather split
> the most suitable riscv DT into ARCH-specific and peripherals parts and
> just include the latter on the arm64 side.
> 
> This series adds the device-tree for Milk-V Duo Module 01 EVB, which
> in turn contains Milk-V Duo Module 01 (separate .dtsi) on it, which has
> SG2000 SoC inside (separate .dtsi).
> 
> This series has been tested with Sophgo-provided U-Boot binary [2]: it
> boots from SD card; pinctrl, serial, GPIO drivers are functional (same
> as for RiscV-based CV18xx SoCs).
> 
> Partial SoC documentation is available [3].
> 
> This series lacks the support of:
> - USB
> - Audio
> - Ethernet
> - WiFi
> - Bluetooth
> - eMMC
> - Video
> 
> Changelog:
> v6:
> - rebase onto sophgo/for-next (108a76779829)
> - dropped first patch refactoring RiscV counterpart (equivalent present in
>   sophgo/for-next)
> - added cpu_on/cpu_off properties into psci node
> - added reset-controller node, compatible comes in [4]
> v5:
> - PSCI node in DT
> v4:
> - minimized patch 1/7 (cleanups dropped)
> - cv18xx-cpu-intc.dtsi instead of cv18xx-cpu.dtsi+cv18xx-intc.dtsi in
> patch 1/7
> v3:
> - &cpus node has been moved into cv18xx-cpu.dtsi, &plic and &clint nodes
> were moved into cv18xx-intc.dtsi to reduce code duplication;
> v2:
> - dropped all patches related to the new reboot driver and corresponding DT
> and bindings;
> - grouped DT-related and config-related patches together;
> - added patch moving sophgo.yaml from riscv into soc (to share it with
> ARM); added SG2000 SoC and Milk-V Duo Module 01 EVB into it;
> - other changes are documented in the corresponding patches;
> 
> [1] https://milkv.io/docs/duo/getting-started/duo-module-01
> [2] https://github.com/milkv-duo/duo-buildroot-sdk-v2/releases/
> [3] https://github.com/sophgo/sophgo-doc/releases/download/sg2000-trm-v1.01/sg2000_trm_en.pdf
> [4] https://lore.kernel.org/sophgo/20250609230417.620089-1-alexander.sverdlin@gmail.com/
> 
> Alexander Sverdlin (6):
>   dt-bindings: soc: sophgo: Move SoCs/boards from riscv into soc, add
>     SG2000
>   arm64: dts: sophgo: Add initial SG2000 SoC device tree
>   arm64: dts: sophgo: Add Duo Module 01
>   arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
>   arm64: Add SOPHGO SOC family Kconfig support
>   arm64: defconfig: Enable rudimentary Sophgo SG2000 support
> 
>  .../{riscv => soc/sophgo}/sophgo.yaml         |  7 +-
>  arch/arm64/Kconfig.platforms                  |  6 ++
>  arch/arm64/boot/dts/Makefile                  |  1 +
>  arch/arm64/boot/dts/sophgo/Makefile           |  2 +
>  .../sophgo/sg2000-milkv-duo-module-01-evb.dts | 31 +++++++
>  .../sophgo/sg2000-milkv-duo-module-01.dtsi    | 85 +++++++++++++++++
>  arch/arm64/boot/dts/sophgo/sg2000.dtsi        | 91 +++++++++++++++++++
>  arch/arm64/configs/defconfig                  |  4 +
>  8 files changed, 226 insertions(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml (81%)
>  create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi
> 
> -- 
> 2.49.0
> 

With all change I mention fixed:

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
