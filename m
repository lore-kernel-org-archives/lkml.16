Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA97028F51C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 13:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749045487; cv=none; b=r9BolriEHl3hgAbNTs8q9AFPecjDJYaGuAyNMI2C3sAyuFK6oLK4vXNJnKbnxFq0wamrESujQV1jNjLCxFthbj7LfeQbzBcXa609rwRJydq+InYZgGY3bk5W6AJACROMFHqbR1A4cJ5SMZKfUL2FijI2JSoTxls2oSOViyuvHMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749045487; c=relaxed/simple;
	bh=zRFxwlOuzhqwZx7qzxl80h5Bo/0p7oc7WIbfN8Qjlw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q+Q18UYuasyY4bU700hhcNPmKmWdx/H5O1CsxvMsiEIrhbfBs3lKKxELayqflsV8Gc6z+9KGyD7w+f9gAePoCvCzIOxpZ+Fi5nnH8r2EAwl5eXAC8gsWl0LGx2LJVJg+exmb0Hb/oT5KUVei1xhjxvtKq1p+TaOKZGQA6WCjzWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NRoq57/T; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NRoq57/T"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e7dc3df7ac3so6848859276.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 06:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749045485; x=1749650285; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IFWXnsIMSq1bn0DUFYmY7z6V87/rRA1du54TZxFaV2Y=;
        b=NRoq57/TUbyB7bb5VxHVyq24yoAGAr1hQ99CQFtbu6trcUZRoVYF23HAk6hj45wG3D
         xLe1YFmQwsOHaa9BMDXe14VjCzh96PvvR5MUJNO+l+6aOU9AEcCfRV2eQXWBsinrtB8e
         kA7MBL8cGEHkE2KlegjBelu5eMfxydvNaMguOW2laDNBFcNSQkSll6Nkz7IEey4Guwd4
         e7qStXO29JO3J6kXMPCMFiM0TYqmMgOpi4u+EEWdWhHwSKZ+J4Mg4WdzGWZyTRTfZQ6f
         rs2D2tVO5bqTuHr7m4Q8BaMd++fXkMlFMTwk1Z5gYK51QjoqSP0HG8sQltH7IStlAGTI
         g0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749045485; x=1749650285;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IFWXnsIMSq1bn0DUFYmY7z6V87/rRA1du54TZxFaV2Y=;
        b=G6v+rgWeeE9Mdz1SK9GTmj1t3XT2HW6nnkPZNvhAYDv5qX0XhPGuPQ26UacYXiT+AJ
         +kfMrG4EVoFFnJe7SmZfIOwNX7vkGviJ/2KdD8RmE7II/pfVpeWW6cam2yx4tjfRB/q0
         7HP1Fav+hHYSTheN+xCQUMJYpIcpUPysFMT7ISkqB2E/HAZRYMZYp7ktVxRSlxPNAv+8
         xDw8kJMgr5One4dL9pJ+IABNQgw8+88rvbdWmqKCgqco4gbpmzY2GEWupO4DdvuzeOEs
         UjoxvG9+gy1vYSs9QUMr8mozgkfSeel8Q6ib1yg7mImESPcEKgtfudG0NYhdBt4AFqFW
         uqsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWY/HdqQfCWNAA2D6MOABxBFDrBXB/Ij4jAjb20dV/44A/9twscgnyPgFcnn8GR/ijiTwn9tpMDv/ve4F8=@vger.kernel.org
X-Gm-Message-State: AOJu0YysOKHZ7pHxleH5U5JDgWM4xvLOyuOyIWEBwGGi+9rZpMR2kuOZ
	pdFjkcQBn6si9/SUqWfPe3LP9UQky2Zo3jBFtxtylGEiV2fFcSiA5aS59fX3KvsVcqG7WFe+bU1
	dHqXLrtvu/viFpqE54CuHwCtgOzUuCok5F004DcLsaw==
X-Gm-Gg: ASbGncvqtN95LzqQTV0fCWfsw9fEAmCFgy65ZeKtCVdJBNUS3TmTMtiWWfqTd8HhChP
	qfkrlzsVZY6qND71ExPYRUPnU4PHDoBtiZRLz/JrcVp5VvLhdQP3s3BVyhTTTCD8VA8wTsbGoOs
	Jx/cnTpHV2wxdM7H+HfmRii3IDC9QyMbcnVQ==
X-Google-Smtp-Source: AGHT+IGXFY8gppNCB1I6k87GeD/bmWPUV8R4mMgK2i7dZCLcfF2RhkUBwoySiJMKIOMWeHJraaSZXAxgR7paTZPeyFU=
X-Received: by 2002:a05:6902:1383:b0:e81:2447:6b74 with SMTP id
 3f1490d57ef6-e817a0011f4mr3409868276.43.1749045484537; Wed, 04 Jun 2025
 06:58:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250529222410eucas1p2e1d41a2fc717caef1aed51367a7db944@eucas1p2.samsung.com>
 <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
 <20250530-apr_14_for_sending-v3-7-83d5744d997c@samsung.com>
 <CAPDyKFpYfZNthdRN=pCv4FEdFCzrKEH4aFBy4ew-xLKtpbJ5Tg@mail.gmail.com> <a68e3bee-f4ad-4d73-a5a8-e39772c41711@samsung.com>
In-Reply-To: <a68e3bee-f4ad-4d73-a5a8-e39772c41711@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 4 Jun 2025 15:57:28 +0200
X-Gm-Features: AX0GCFsKqqHfcoyjgQNY4Bx0T-G_vnaUmkhnEv_Xdt_09WriRo8KoB3SpnFxVUU
Message-ID: <CAPDyKFo8scYL59+ELgawop30habZad0Xsd6bKGLXtSF+UNd9Ng@mail.gmail.com>
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

On Wed, 4 Jun 2025 at 14:40, Michal Wilczynski <m.wilczynski@samsung.com> wrote:
>
>
>
> On 6/3/25 14:27, Ulf Hansson wrote:
> > On Fri, 30 May 2025 at 00:24, Michal Wilczynski
> > <m.wilczynski@samsung.com> wrote:
> >>
> >> Add a device tree node for the IMG BXM-4-64 GPU present in the T-HEAD
> >> TH1520 SoC used by the Lichee Pi 4A board. This node enables support for
> >> the GPU using the drm/imagination driver.
> >>
> >> By adding this node, the kernel can recognize and initialize the GPU,
> >> providing graphics acceleration capabilities on the Lichee Pi 4A and
> >> other boards based on the TH1520 SoC.
> >>
> >> Add fixed clock gpu_mem_clk, as the MEM clock on the T-HEAD SoC can't be
> >> controlled programatically.
> >>
> >> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> >> ---
> >>  arch/riscv/boot/dts/thead/th1520.dtsi | 22 ++++++++++++++++++++++
> >>  1 file changed, 22 insertions(+)
> >>
> >> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> >> index 6170eec79e919b606a2046ac8f52db07e47ef441..ee937bbdb7c08439a70306f035b1cc82ddb4bae2 100644
> >> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> >> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> >> @@ -225,6 +225,13 @@ aonsys_clk: clock-73728000 {
> >>                 #clock-cells = <0>;
> >>         };
> >>
> >> +       gpu_mem_clk: mem-clk {
> >> +               compatible = "fixed-clock";
> >> +               clock-frequency = <0>;
> >> +               clock-output-names = "gpu_mem_clk";
> >> +               #clock-cells = <0>;
> >> +       };
> >> +
> >>         stmmac_axi_config: stmmac-axi-config {
> >>                 snps,wr_osr_lmt = <15>;
> >>                 snps,rd_osr_lmt = <15>;
> >> @@ -504,6 +511,21 @@ clk: clock-controller@ffef010000 {
> >>                         #clock-cells = <1>;
> >>                 };
> >>
> >> +               gpu: gpu@ffef400000 {
> >> +                       compatible = "thead,th1520-gpu", "img,img-bxm-4-64",
> >> +                                    "img,img-rogue";
> >> +                       reg = <0xff 0xef400000 0x0 0x100000>;
> >> +                       interrupt-parent = <&plic>;
> >> +                       interrupts = <102 IRQ_TYPE_LEVEL_HIGH>;
> >> +                       clocks = <&clk_vo CLK_GPU_CORE>,
> >> +                                <&gpu_mem_clk>,
> >> +                                <&clk_vo CLK_GPU_CFG_ACLK>;
> >> +                       clock-names = "core", "mem", "sys";
> >> +                       power-domains = <&aon TH1520_GPU_PD>;
> >> +                       power-domain-names = "a";
> >
> > If the power-domain-names are really needed, please pick a
> > useful/descriptive name.
>
> Yeah they are required. Even though this convention doesn't seem to be
> enforced by the dt-binding it seems like it's hard-coded into the driver
> 330e76d31697 ("drm/imagination: Add power domain control"). So I don't
> think I have any choice here.

Well, unless there is a DT doc describing the power-domain-names it's
perfectly fine to change the driver too.

Moreover, it looks like 330e76d31697 is a brand new commit, just in
linux-next, so not even included in a release yet.

Kind regards
Uffe
