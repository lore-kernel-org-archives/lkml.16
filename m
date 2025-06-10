Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C011F2853FA;
	Tue, 10 Jun 2025 22:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749593147; cv=none; b=cB0g06K5ugJ0HbnProFzMXAHIColBpDvI2h+FmbRGV+heQOTx1ix6HpKDWmHPoEhzjnMK+nVF7w3pR/dI4yboT6GVRQ/t881at/vnOH/SlmeFK7nYfa/YENwzRmToNeTRJPvKdZD0QATFjzxZxvIHaVBn9HVwr60CeaPKmQRW3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749593147; c=relaxed/simple;
	bh=HuM5zxnDhh4RUNVAMh1E77pQ4bXzqpgKY2NT2k/Zg2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aiAGSsi6NujFmIazxblshXYIP27u+oQN4s58YPX3KpZqjGYtKIeamtB+jMsYufDzuVeWu4R77l1wU2DU281VEvy5YacM434HDq8NO08/Sd20B/vh/Vud6Ldv3vvdgIWJ09J4AgNxBnZf5957uUtNwWQ/lCzTCQFU8V38aeAWS0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T7K+Jx7n; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T7K+Jx7n"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4a56cc0def0so104106001cf.3;
        Tue, 10 Jun 2025 15:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749593144; x=1750197944; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DmTWmU9NEikrwp3F1QNeTNdfTomvenelOaCl9Z9m7F8=;
        b=T7K+Jx7nFzDem7VVEAMxLNwpdDx6tth8WpUyQNShYf7Sh4GEwpivUKLumFYFHmHYHB
         UdPmurW9apSIlZyusB4sWQ+iAesdIvOWd4YeeIb5q16944py7qm+6bym0qpaCCSycvGG
         iPkSEWb/1938VWK/+h1z1TfRl8fP8PBHwr6wtCMbscqR9s2o4olzlIeOjaHGWerEv/0y
         vOlDHQdnvbw98Z1pG4nqwaEoTq+DdL57oFiwJ5pimnl6NYTo40BUXcBl91MvCeGy2z/o
         hqShPt2aG5QJpDeh7CRoupIQo2AoljeMXTzxPzh0gWMU9/xKJ4x+p7jtrXhjGGQRCHam
         Vn5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749593144; x=1750197944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmTWmU9NEikrwp3F1QNeTNdfTomvenelOaCl9Z9m7F8=;
        b=bACDlW0W4FsuIIDeTw2VZxh1iOTj1SueMamm651QOOsSLzTiaG6576c0oaS3pJS7fc
         2B56qRitVpoaxBnJk2V8/xlyUDyKyWVabU9Z+cp8YkPCvZD3XUD6LSfOk/bJRiLtPwYj
         XTwMDuRSLhqSgH9upTUMhXhNJ+JfbBHduoKYd4paiv3DlPfpUr4nJK0UGlbzduleqpTZ
         YkIrUzj3xAJkB2VonoK572Q6Lr6Thoc/9xjquqXwyVQYgiPZtb2hLPwmyejYuchsBCvR
         Q5vpo9HVIkWJjgV8GXLqZ/ruPpHhmx71ZePL9BzB8Jmw60gfKo9d88hvVm0cTs6mMFD/
         vYrg==
X-Forwarded-Encrypted: i=1; AJvYcCU0zA+SSzwQzH0dT33eCut1MqFNeqkzmZR4rBaR6sG28atoO0uPJiEIl9O5fyIfUvrwgu+keFdQ8hqespFP@vger.kernel.org, AJvYcCUjeCxDrd5XoRgRHMAs2j21nW07jZWGoFmZLQXzC7dKJb6psAl2nvRnJX7oEf/YnB5DzRGouR5wv/Pe@vger.kernel.org
X-Gm-Message-State: AOJu0YxqiwX6l5zecSzjG3JzufCikx2eXlf/PlworHiU9VwWgwEKRhGG
	xq2bwTNN6sfM7CpANZw1piAMMIQt1OyB5T4mj2rFV09fI+vuIId9TiJv
X-Gm-Gg: ASbGncs44kofvrSLBc6Nray1ykzCFQJuxcl0sRKrHizb7mF+6qvxDQo3uWXpomlIbuw
	OBA5k5BP1IcxpDr2AQKPQd1kkFpU6u+EMwOnPQ/xaORPqRBdn9Fp2T6wYVAhPuG/LrdT99mWb1p
	pM06sgS+KQrM0IalkzNsEp5JTRCx0b2SSm9+H5X9yt3SPetDRCd1hEcg1v/Ght4vxhqyQpc4fVH
	kRfRZc5DYJlKaDWK/MGpVgYzFw8WlTKZ40WzlV+KoogiMcP3/LHnzVw6ITgfe9lrFi0j3CjW7fv
	yReT4cP/XULUGpqQDas3VvmlY3h8IIXxR8kgoNF2NLiixf+h
X-Google-Smtp-Source: AGHT+IEDJpOYkGfTUyYs1FXlXzDYqJOyu0jNJBu7zkL7VpiJWuUnOT+hGZ2ALGAVCMSkNmIUlRsQhQ==
X-Received: by 2002:a05:622a:558e:b0:476:8f75:b885 with SMTP id d75a77b69052e-4a713c45603mr18755041cf.44.1749593144531;
        Tue, 10 Jun 2025 15:05:44 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4a619853048sm79911851cf.47.2025.06.10.15.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 15:05:44 -0700 (PDT)
Date: Wed, 11 Jun 2025 06:04:37 +0800
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
Subject: Re: [PATCH v7 3/6] arm64: dts: sophgo: Add Duo Module 01
Message-ID: <h3vnwdlmzdjdm2nfpg3rvbck22pgvpweqphuwy67a5ny2wkhen@d2vmojc23pli>
References: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
 <20250610201241.730983-4-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610201241.730983-4-alexander.sverdlin@gmail.com>

On Tue, Jun 10, 2025 at 10:12:16PM +0200, Alexander Sverdlin wrote:
> The Duo Module 01 is a compact module with integrated SG2000,
> WI-FI6/BTDM5.4, and eMMC.
> Add only support for UART and SDHCI.
> 
> Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
>  .../sophgo/sg2000-milkv-duo-module-01.dtsi    | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
> 
> diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
> new file mode 100644
> index 000000000000..bb52cdad990a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
> @@ -0,0 +1,85 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +
> +#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
> +#include "sg2000.dtsi"
> +
> +/ {
> +	model = "Milk-V Duo Module 01";
> +	compatible = "milkv,duo-module-01", "sophgo,sg2000";
> +
> +	aliases {
> +		serial0 = &uart0;
> +		serial1 = &uart1;
> +		serial2 = &uart2;
> +		serial3 = &uart3;
> +		serial4 = &uart4;
> +	};
> +};
> +
> +&osc {
> +	clock-frequency = <25000000>;
> +};
> +

> +&pinctrl {
> +	sdhci0_cfg: sdhci0-cfg {
> +		sdhci0-cd-pins {
> +			pinmux = <PINMUX(PIN_SD0_CD, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +
> +		sdhci0-clk-pins {
> +			pinmux = <PINMUX(PIN_SD0_CLK, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <16100>;
> +			power-source = <3300>;
> +		};
> +
> +		sdhci0-cmd-pins {
> +			pinmux = <PINMUX(PIN_SD0_CMD, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +
> +		sdhci0-data-pins {
> +			pinmux = <PINMUX(PIN_SD0_D0, 0)>,
> +				 <PINMUX(PIN_SD0_D1, 0)>,
> +				 <PINMUX(PIN_SD0_D2, 0)>,
> +				 <PINMUX(PIN_SD0_D3, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +	};
> +
> +	uart0_cfg: uart0-cfg {
> +		uart0-pins {
> +			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
> +				 <PINMUX(PIN_UART0_RX, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +	};
> +};

Please move this slice to the board dts, only configuration related to
the module itself can be left in this dtsi file.

Regards,
Inochi
