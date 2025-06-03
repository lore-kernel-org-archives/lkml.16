Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E27E22B8BD
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 12:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748953669; cv=none; b=O+eOhcS4c3csPjzslkuChxt7ipFUibz5feaU9iOOAjS+Kif/kiMt0ifYYTnMLzHpDxfeEEN++w+9Zb1Cf8/PPHgT8xfqnfn6o8j/PosOhLJ2882A3ubWnZnzWRaGIU9XQCo5wtp9Wzk0LCLzPJqqV5igiE6cYwY8aGNdkXwj3Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748953669; c=relaxed/simple;
	bh=U9TZhzl9LGoUPww5lpOtQmKYBtkSSXsm2J5aXtd5Vbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EQO4ASDZ1XdPhb+DdWKeE3pJ+AnBN7JVp2uwzQVMY7kRtLrLcAWg6YlIrO4urc9jzuCdHaDnibcRHP3yLD7ik/8HpTgn7qmk0frxdS4GasD+hiPuPvLGQ+K1O4HBhQkWpOmBPjKHnyDq7FYjv9VwfjdSXPPTmhDKBEaT8V0ixfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cQQao7Av; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cQQao7Av"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e7b3410e122so4840989276.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 05:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748953667; x=1749558467; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zkBUpTusJpTA0VXTt0i8mXorEGwS/Hyqj+o9q7jAdU0=;
        b=cQQao7Avf2nKTsXVByFZd6nXqpN0S6lZb4dJ3bv4Ijb1FYWc6rego/h6maf8yGp55j
         L4WZNKhXD4V7il3neMw2eIsAfpm79+dv7R2oj/JVOQ0YYBxXEpjoZYfX6iK0M3dKmqRq
         qPc86RyXwH0XqSjbuC0+Wewdx1lNgFMVkQV+b0fevNMbjZ0XreRnvKpFYfKCfiy9AYBq
         HgiYhCAxmqxKqphUg24OwK6Zi8TDwGWq8VgCg6PlZNzYu6b9yCBSNgdRIDKTO7mKfxxq
         hdrhXQ/s6X5PiLJRdVUmi6gzPOF2Dx++70AdRZ1VZzo8V7ZM1WokBNL74O3QnPCySUxt
         iY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748953667; x=1749558467;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zkBUpTusJpTA0VXTt0i8mXorEGwS/Hyqj+o9q7jAdU0=;
        b=dKWY/tPn3mKSYYpbXcG1apTpjLu7uwgwicYyLJOLcpviaQ60PpWUAThkyHvkzpQqDU
         hFYknCCbs6/OvF+5F5p9yKMccZauqDNB7mObcARq4MlYbQ2clKDiFnHYN1pR2NrjJxK8
         BRmQnHojEOXkHXC6+mJP0oLJipGW6dJ2jicGrTDgASlp97RpKhUWFh69ERVBEki38lxy
         zUy8CzvSDpaEW7Aalh5BHXEhsKMWbX5ceaWoo2IC8FSdD20o+JKRKdkTNcdxdw4rgkNE
         5/RMhfGRaWpXdCkmhHZzmEMyaw5dYJvNkyozFAQqyYn3WkIvm3FaaDjCmfLvlk8y96B+
         AdQg==
X-Forwarded-Encrypted: i=1; AJvYcCWJfghvuf1YW9m5fifiD5yoAj9x2anJpWyRmsdurAyU/y6ZFSt2YyvHHKrFcoWTei++d8sZeibtSyWiNjk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZaafHocTGNdQdUEVS/1ME5NOh2M7iSLjbJlz7rYvkpbFuZhuN
	kiRBuEvt2o3Sr62FKqyWi19QndVn+Lmh4HOG0YCXErzEtBtQ7iBimgfDC4P3skqeAeOu19XKPzZ
	RqmImXzBdevbJB4rTc61EKAFQuKyQT3wpSv+wFtpXaA==
X-Gm-Gg: ASbGncumJIUtdBtR50phfgzADOcEdzze/za2d9eufuL6iWzAxYjUsJYnMIQzVs2Yab2
	Z7/w5w7b1QKGtNYMI/3nPWRhWZ9wHKc60f+xYU2D0y23UA9v4jxviTfrAoqATGucoMf53WkDKPD
	OzByMX0scj4m1hUSGcAYvyzn/sQ+p5EWDi
X-Google-Smtp-Source: AGHT+IHrpeHkj+2BBo06F52MCRNOttN7I/OSF6yK1xPb3e+88rZaXmBzR2xH+shfwb8QDbG4StP/a4Wb3x5cAxCSx/4=
X-Received: by 2002:a05:6902:6b10:b0:e7d:b0b6:1bf6 with SMTP id
 3f1490d57ef6-e7f81dfaa44mr21941753276.12.1748953666949; Tue, 03 Jun 2025
 05:27:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250529222410eucas1p2e1d41a2fc717caef1aed51367a7db944@eucas1p2.samsung.com>
 <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com> <20250530-apr_14_for_sending-v3-7-83d5744d997c@samsung.com>
In-Reply-To: <20250530-apr_14_for_sending-v3-7-83d5744d997c@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 3 Jun 2025 14:27:11 +0200
X-Gm-Features: AX0GCFuhikVc4rQPnpXMCgeyFTV30-WWzpds7-nPqvmmTrY7jKqhLTeVB-8SqLA
Message-ID: <CAPDyKFpYfZNthdRN=pCv4FEdFCzrKEH4aFBy4ew-xLKtpbJ5Tg@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU node
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 May 2025 at 00:24, Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
> Add a device tree node for the IMG BXM-4-64 GPU present in the T-HEAD
> TH1520 SoC used by the Lichee Pi 4A board. This node enables support for
> the GPU using the drm/imagination driver.
>
> By adding this node, the kernel can recognize and initialize the GPU,
> providing graphics acceleration capabilities on the Lichee Pi 4A and
> other boards based on the TH1520 SoC.
>
> Add fixed clock gpu_mem_clk, as the MEM clock on the T-HEAD SoC can't be
> controlled programatically.
>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index 6170eec79e919b606a2046ac8f52db07e47ef441..ee937bbdb7c08439a70306f035b1cc82ddb4bae2 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -225,6 +225,13 @@ aonsys_clk: clock-73728000 {
>                 #clock-cells = <0>;
>         };
>
> +       gpu_mem_clk: mem-clk {
> +               compatible = "fixed-clock";
> +               clock-frequency = <0>;
> +               clock-output-names = "gpu_mem_clk";
> +               #clock-cells = <0>;
> +       };
> +
>         stmmac_axi_config: stmmac-axi-config {
>                 snps,wr_osr_lmt = <15>;
>                 snps,rd_osr_lmt = <15>;
> @@ -504,6 +511,21 @@ clk: clock-controller@ffef010000 {
>                         #clock-cells = <1>;
>                 };
>
> +               gpu: gpu@ffef400000 {
> +                       compatible = "thead,th1520-gpu", "img,img-bxm-4-64",
> +                                    "img,img-rogue";
> +                       reg = <0xff 0xef400000 0x0 0x100000>;
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <102 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&clk_vo CLK_GPU_CORE>,
> +                                <&gpu_mem_clk>,
> +                                <&clk_vo CLK_GPU_CFG_ACLK>;
> +                       clock-names = "core", "mem", "sys";
> +                       power-domains = <&aon TH1520_GPU_PD>;
> +                       power-domain-names = "a";

If the power-domain-names are really needed, please pick a
useful/descriptive name.

[...]

Kind regards
Uffe
