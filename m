Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4142222D9
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 02:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750299640; cv=none; b=ui9ozwiWnMvGUpegLjDJ7nAihfPCpj10cxl3yGBFB30OzT8sve5snDFgalC5YYcukuWi9ABC24IkN/4RGk5V+RK0OWbQWaWghYEbrAIincAkBN93Z/l59sI+tPXNI0IuYdD3HC5o0WURE1abh6B/ndlJA8+XQTR7w/ny8pJLceU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750299640; c=relaxed/simple;
	bh=fbHwj/6Mc7LjY4LJrhtl5037k7Ipk80XNh/vyQkqCi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OuqicHqpuOQ29NGpu7gD5RvhqLSKF2dFZHQ8w3ue1v2VNIr+FqSGJXi4Xc5q905EJCwV/0+7NxjJkVOwTu94NirURzsb/BFfgAWrsbIxrdlRZ2MqB6jCMRKwh63E8+ojfzxYA6PeWzSTRzuRoxyZSwNF2THDtbFgCmpSNUjZwwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=g2CwFCi6; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="g2CwFCi6"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-748f54dfa5fso182996b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 19:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1750299638; x=1750904438; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aB+z+oapAeIvD/LMQC0pA+9Dvh98i3pYzrLPX5UVNgs=;
        b=g2CwFCi6sq6bYsGW56STu/fdSElwcbEqRmqpOgT+x6/oQ4HJlBBqJw7823cKPGAnn8
         quYuYv5opcB/hsTq0mT3zTvnupthMsWM8LLCPQSj8tsJNlq7BGSNLKV9o4i21u7ibsT8
         3kV3etSW9CXZ6jZWxt1ddGgA4VUBxNvkgbzNPGz4DEtAHxdfSOJDtdinDRFMFDpXmIzu
         XxXHvKt9wyxQS1Spg4UWayJjuwrlKOfKsvU+HngTZEatK8ABBlvF1NHfsGjA80tCOSuC
         jAVwNfeUS21qD2p1bH2eR8qwbtpiUSv6MTszxks7l6vYTtJHC19vJY0ZykxoBLAk04Qn
         iNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750299638; x=1750904438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aB+z+oapAeIvD/LMQC0pA+9Dvh98i3pYzrLPX5UVNgs=;
        b=OYrVYWBcz+8VcoEhW3vvpajiMPTyxRUDaQPH7G8GSqGmY/ia8DokPlvMNqBvh89ShQ
         UieUDj6VlTzr3HVaTakaNJqRjEvZyyAtm6AMqlFk0r0MZj7JMcFWaip7wpBNa3DExVvN
         cCzxBkQSa/9VZL2QaZImCbfegNRdR0uBQeVCx4LM4wwo63LQJipovCPtmcBCUlwZGkPB
         p1liT+T33td85JRxlbaZnzPuHno/UrQ2YkhxjBReJmKDQjWFJ7eCALI3a8/7/jcPW2RX
         ybwS40NivNYJkXqFh0U5W6v13rHC0xEGnec6/y6cyvKZaV5rQ7jl9Swzoi1UoNbrqTte
         lYng==
X-Forwarded-Encrypted: i=1; AJvYcCVkZCiI098Lr2JG+/uB4zvXJsbbbdbW6Hgc1xyEE/xNo8nuGmUVljnUlq5QYE0xIa6T+xfJtIepo+UnpMw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcmwkH2yRDx8o3+6TZ0U2R0sT7VDyDLJb8RJRdToMLRmYKk64E
	NYh+vJ/WFSaeQFoPEVfdSAK4KkSBiTWWwJmig/+n9WV8HBfqxwDRIR3qsrGT/BlCs+8=
X-Gm-Gg: ASbGncvJ7eZ8dCj09erPkNWItuOuPC+6TLrAH/pcPSZSvKQ7puxhUgyHMwRFyBxdRdL
	vaGuzqcGoOxwl9T0RAXOph9n9rSJ0Be0XfjRYauFd6RuWmKNEMP5XDiHYm3k0zPoy6vrElCi9IF
	8r/ZxpdrNzBo87FXfDW2GTRSHCVhCMXy0R0hXdaEtSFLI219P6kNL6OeQ6/0XQqbbOdfqwjxzdr
	1YyQtMuTUdiBlCZzeR7Tm/rX4s1bThtPWQmkC7QskC+tIIBUbE+ul/CBygsgYeOl7oITf2aMvAX
	Fir0od00lKAN7sAQ8wgu5H2HTcX2BLo//WT7X+/M6orho6AqTGlhyWQ+8L05P8a0SJubLBg=
X-Google-Smtp-Source: AGHT+IGjSSZuolaUpbJOSDgxdNJ2rz6g6jIUWqfE+ln3NvBoOq+EqOxlPwszxtc7pzssoDHlu8HO3g==
X-Received: by 2002:a05:6a21:62c9:b0:1f5:7366:2a01 with SMTP id adf61e73a8af0-21fbd6925a5mr30398731637.37.1750299638092;
        Wed, 18 Jun 2025 19:20:38 -0700 (PDT)
Received: from x1 (97-120-250-80.ptld.qwest.net. [97.120.250.80])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31c84be11fsm2584945a12.78.2025.06.18.19.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 19:20:37 -0700 (PDT)
Date: Wed, 18 Jun 2025 19:20:35 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 6/8] riscv: dts: thead: th1520: Add GPU clkgen reset
 to AON node
Message-ID: <aFNz8/m7q4T2qSHd@x1>
References: <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
 <CGME20250618102231eucas1p1ec99058179825cb1250a1f189313b3eb@eucas1p1.samsung.com>
 <20250618-apr_14_for_sending-v5-6-27ed33ea5c6f@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618-apr_14_for_sending-v5-6-27ed33ea5c6f@samsung.com>

On Wed, Jun 18, 2025 at 12:22:12PM +0200, Michal Wilczynski wrote:
> Add the "gpu-clkgen" reset property to the AON device tree node. This
> allows the AON power domain driver to detect the capability to power
> sequence the GPU and spawn the necessary pwrseq-thead-gpu auxiliary
> driver for managing the GPU's complex power sequence.
> 
> This commit also adds the prerequisite
> dt-bindings/reset/thead,th1520-reset.h include to make the
> TH1520_RESET_ID_GPU_CLKGEN available. This include was previously
> dropped during a conflict resolution [1].
> 
> Link: https://lore.kernel.org/all/aAvfn2mq0Ksi8DF2@x1/ [1]
> 
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index 1db0054c4e093400e9dbebcee5fcfa5b5cae6e32..f3f5db0201ab8c0306d4d63072a1573431e51893 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/clock/thead,th1520-clk-ap.h>
>  #include <dt-bindings/power/thead,th1520-power.h>
> +#include <dt-bindings/reset/thead,th1520-reset.h>
>  
>  / {
>  	compatible = "thead,th1520";
> @@ -234,6 +235,8 @@ aon: aon {
>  		compatible = "thead,th1520-aon";
>  		mboxes = <&mbox_910t 1>;
>  		mbox-names = "aon";
> +		resets = <&rst TH1520_RESET_ID_GPU_CLKGEN>;
> +		reset-names = "gpu-clkgen";
>  		#power-domain-cells = <1>;
>  	};
>  
> 
> -- 
> 2.34.1
> 

Reviewed-by: Drew Fustini <drew@pdp7.com>
