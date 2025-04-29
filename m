Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBC52D193D;
	Tue, 29 Apr 2025 13:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745932353; cv=none; b=KokQSECHFjU5r7rJ5TGjDtYy/B7ZkA9KPU47UI0Pkoh/8HQEQNAySTTG5gUtQW1rMHm3FsCkZ89rbkXda5/gfUHhlP8jWDfKQ1qcxtJCYi3e9vuzXNAUMzUbgO7OjsPGbsyJKBVTTPLX6EZACzSpWmEKjXV/H9U774qXfzETld4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745932353; c=relaxed/simple;
	bh=+LZXNUvSl96G7My8kfcoIojmFR7D5eQCvXXk5EKbpRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nkNnIX9nifkU7IZIYF2dHH6GGeZ0qYQ9o5thZk3U4aNwzJkmB7FlOAadfInknopWBqNbEdrNKsZu6Nr9qQGvMQsZyhvhS1+pygUop0xp2fAdfY9DddeXnNK0f013EwLlyYhcV4TTgqD/sYVKjazs0Th3qIGRqZ1LscLqdMsmtKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCypap3G; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCypap3G"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-22438c356c8so64888495ad.1;
        Tue, 29 Apr 2025 06:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745932351; x=1746537151; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zLr/pZVUZiZvuJBsY2l2h1qnIyCFg/TeFQKOeAXVIOA=;
        b=WCypap3G351knGewhlh6z7+spXZ64EK6VhEznd9FFL2HO7WG3sKxnQKXUIyUl4RVUg
         F8o9EHimvnkp7/02HujS/KZTr5+Bnx2M1h+8RLxTgOw1d9pfA/Y4u3/uu2yT+D3zj7ZQ
         aML+UnTcpSqWx+buYF/hcRyE3BvNLIi+gv0WkIFrvB4jgR7fsSy+S+4V2PRXC6YkO+tV
         P9Kx0IbXKFMCDDcV6geILeer4L3QqmVedEsd1VI/ibOjik0tVg69FTYL+nDiBJ+RnU6w
         LGMWOAPAAhLdqX3hgCAuex6zbOVswJkHO6mi80TJe6Y0EnpjE1VbWJEsdPoMiX1KZa1D
         LWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745932351; x=1746537151;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zLr/pZVUZiZvuJBsY2l2h1qnIyCFg/TeFQKOeAXVIOA=;
        b=Y0ZXZcLdD0ucKAvF+BEqrSMzeemEbwyd6MzLuB6hk+XqOtJzl4OipcFnf5jStGzw/P
         bwh3GrMJCDtWqHx6W6HHjSs2/oXr+/3MEtIbgzSjgv9NC0mbErxn/rI6QVP6s213NniE
         iP4982SoQxuClSl3wdfnAAo3moaMEOQuGaBOrPeE8hBsHtUPo2CfTvY+8+tWln8tF09H
         01W34aLIf3milJZGa3NrBInw7LuhmZ7Ryn0RYZeykzsFyNHBHkKyk4SycOF9pkjjPFuR
         jUtM1JO2Ki5Dnjab5VSyGDT64rSEdBdU4cBZBp5oRxgqokAKF9g7cv86whtZuUO33HvJ
         Dtow==
X-Forwarded-Encrypted: i=1; AJvYcCW9PiZXbkAjgRgg7Zew6d+rFWpMQGiEasCyGfSjz6+mzg+C8DAnIz6LMqzkQdrUHts516CDbkIY0H0f@vger.kernel.org, AJvYcCWa2R9sRawkPtip2O16CP6RaF3KKMZnY4Bv9HbUBFKeY+tr17yOyecsLWYDlkbR/NvyKU1ZdrgWiVcnQXlv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3SnNZUOjFORzicJdnWX4aZR1WLVFPma91zIOpZ95HJcqTPbMj
	q7nV0p960IbxdAGBM6oQxvTEXunXBurhIU2AG7tBSAQDfmisDKEo
X-Gm-Gg: ASbGncuqXhW81Dql4hI8NfxChG++EoOMAsOa1t9HkDSBZ5OAeRxCDVgg5b9SRqIcK8z
	asS4i14D5j2ABlHOu9MoLVxLgh1K7fdXHwgBby3vCdEQq+LVF1/4YVGNoEks2PW7hdsW3v7pKBX
	JcFyomp5BlqFuoBESuSzoBt8quh0t3cJS1HcFY3+xb2PMplwvP8kZF/126um5wKU3O+1IKbWp4Z
	dHwCt0VAaE24yhjcXAbR+PexvtVZjsT/N5LcKPC938AJ5WOzdWMvCu0AXAlWpf0Du1brzVoLrvY
	3VyqylHI32RMozCvDHW3mtfxy2cYm9C6
X-Google-Smtp-Source: AGHT+IE46nQZvQZOoQ5SdP3lN+MPETDnAaTMkTXjhLibuyGrKWlwgPpdOsObZavwJSYSN6nA7zZfhQ==
X-Received: by 2002:a17:903:120d:b0:223:47b4:aaf8 with SMTP id d9443c01a7336-22de60a3e97mr48866585ad.52.1745932349403;
        Tue, 29 Apr 2025 06:12:29 -0700 (PDT)
Received: from localhost ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbc0d1sm101560245ad.72.2025.04.29.06.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 06:12:28 -0700 (PDT)
Date: Tue, 29 Apr 2025 21:12:25 +0800
From: Troy Mitchell <troymitchell988@gmail.com>
To: Xukai Wang <kingxukai@zohomail.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Troy Mitchell <TroyMitchell988@gmail.com>
Subject: Re: [PATCH v6 2/3] clk: canaan: Add clock driver for Canaan K230
Message-ID: <20250429131225.eza27be7wm4lmehy@troy-wujie14-pro>
References: <20250415-b4-k230-clk-v6-0-7fd89f427250@zohomail.com>
 <20250415-b4-k230-clk-v6-2-7fd89f427250@zohomail.com>
 <MA0P287MB2262F6D556E48A73E317553AFEB82@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
 <1d8c27be-95f9-4cb8-8d41-9c00faefd360@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d8c27be-95f9-4cb8-8d41-9c00faefd360@zohomail.com>

On Tue, Apr 22, 2025 at 04:01:35PM +0800, Xukai Wang wrote:
> 
> On 2025/4/21 18:43, Chen Wang wrote:
> > Hi, Xukai, I have some comments below.
> >
> > In general, my suggestion is that the code can be further optimized,
> > especially in terms of readability.
> >
> >
> > On 2025/4/15 22:25, Xukai Wang wrote:
> >> This patch provides basic support for the K230 clock, which does not
> >> cover all clocks.
> >>
> >> The clock tree of the K230 SoC consists of OSC24M, PLLs and sysclk.
> >>
> >> Co-developed-by: Troy Mitchell <TroyMitchell988@gmail.com>
> >> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> >> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
> >> ---
> >>   drivers/clk/Kconfig    |    6 +
> >>   drivers/clk/Makefile   |    1 +
> >>   drivers/clk/clk-k230.c | 1710
> >> ++++++++++++++++++++++++++++++++++++++++++++++++
> >>   3 files changed, 1717 insertions(+)
> >>
> >> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> >> index
> >> 299bc678ed1b9fcd9110bb8c5937a1bd1ea60e23..1817b8883af9a3d00ac7af2cb88496274b591001
> >> 100644
> >> --- a/drivers/clk/Kconfig
> >> +++ b/drivers/clk/Kconfig
> >> @@ -464,6 +464,12 @@ config COMMON_CLK_K210
> >>       help
> >>         Support for the Canaan Kendryte K210 RISC-V SoC clocks.
> >>   +config COMMON_CLK_K230
> >> +    bool "Clock driver for the Canaan Kendryte K230 SoC"
> >> +    depends on ARCH_CANAAN || COMPILE_TEST
> >> +        help
> >> +          Support for the Canaan Kendryte K230 RISC-V SoC clocks.
> >> +
> >>   config COMMON_CLK_SP7021
> >>       tristate "Clock driver for Sunplus SP7021 SoC"
> >>       depends on SOC_SP7021 || COMPILE_TEST
> >> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> >> index
> >> fb8878a5d7d93da6bec487460cdf63f1f764a431..5df50b1e14c701ed38397bfb257db26e8dd278b8
> >> 100644
> >> --- a/drivers/clk/Makefile
> >> +++ b/drivers/clk/Makefile
> >> @@ -51,6 +51,7 @@ obj-$(CONFIG_MACH_ASPEED_G6)        += clk-ast2600.o
> >>   obj-$(CONFIG_ARCH_HIGHBANK)        += clk-highbank.o
> >>   obj-$(CONFIG_CLK_HSDK)            += clk-hsdk-pll.o
> >>   obj-$(CONFIG_COMMON_CLK_K210)        += clk-k210.o
> >> +obj-$(CONFIG_COMMON_CLK_K230)        += clk-k230.o
> >>   obj-$(CONFIG_LMK04832)            += clk-lmk04832.o
> >>   obj-$(CONFIG_COMMON_CLK_LAN966X)    += clk-lan966x.o
> >>   obj-$(CONFIG_COMMON_CLK_LOCHNAGAR)    += clk-lochnagar.o
> >> diff --git a/drivers/clk/clk-k230.c b/drivers/clk/clk-k230.c
> >> new file mode 100644
> >> index
> >> 0000000000000000000000000000000000000000..84a4a2a293e5f278d21510d73888aee4ff9351df
> >> --- /dev/null
> >> +++ b/drivers/clk/clk-k230.c
> >> @@ -0,0 +1,1710 @@
> > [......]
> >> +
> >> +struct k230_pll {
> >> +    enum k230_pll_id id;
> >> +    struct k230_sysclk *ksc;
> >> +    void __iomem *div, *bypass, *gate, *lock;
> >
> > No need define these iomem address, just calculate them and use them
> > when use them. The clock reading and writing efficiency requirements
> > are not that high, so there is no need to waste memory for this.
> >
> I see, I'll drop these next version.
>
Hi Xukai, feel free to skip replying one by one.
just point out anything you disagree with or find confusing.

        - Troy
> >
> >> +    struct clk_hw hw;
> >> +};
> >> +
> >> +#define to_k230_pll(_hw)    container_of(_hw, struct k230_pll, hw)
> >> +
> >> +struct k230_pll_cfg {
> >> +    u32 reg;
> >> +    const char *name;
> >> +    struct k230_pll *pll;
> >> +};
> >
> > Can we combine k230_pll and k230_pll_cfg into one to simplfy the code?
> OK, and I think the role of k230_*_cfg is maybe some redundant, and I'm
> considering remove them.
> >
> >> +
> >> +struct k230_pll_div {
> >> +    struct k230_sysclk *ksc;
> >> +    struct clk_hw *hw;
> >
> > I see k230_clk use "struct clk_hw", but here we use "struct clk_hw*", 
> > can we unify these?
> The clk_hw in k230_pll_div is a pointer returned by
> `clk_hw_register_fixed_factor()`, whereas the clk_hw in the PLL and in
> regular clocks is the actual entity that gets populated by
> `clk_hw_register()`.
> >
> > Just use "struct clk_hw" and init it as static global var should be
> > enough, see drivers/clk/sophgo/clk-cv1800.c for example.
> >
> >> +};
> >> +
> >> +struct k230_pll_div_cfg {
> >> +    const char *parent_name, *name;
> >> +    int div;
> >> +    struct k230_pll_div *pll_div;
> >> +};
> >> +
> >> +enum k230_pll_div_id {
> >> +    K230_PLL0_DIV2,
> >> +    K230_PLL0_DIV3,
> >> +    K230_PLL0_DIV4,
> >> +    K230_PLL0_DIV16,
> >> +    K230_PLL1_DIV2,
> >> +    K230_PLL1_DIV3,
> >> +    K230_PLL1_DIV4,
> >> +    K230_PLL2_DIV2,
> >> +    K230_PLL2_DIV3,
> >> +    K230_PLL2_DIV4,
> >> +    K230_PLL3_DIV2,
> >> +    K230_PLL3_DIV3,
> >> +    K230_PLL3_DIV4,
> >> +    K230_PLL_DIV_NUM
> >> +};
> >> +
> >> +enum k230_clk_div_type {
> >> +    K230_MUL,
> >> +    K230_DIV,
> >> +    K230_MUL_DIV,
> >> +};
> > Please document what's meaning of MUL, DIV, and both? They are type
> > for what?
> OK, I'll add one to explain this.
> >> +
> >> +struct k230_clk {
> >> +    int id;
> >> +    struct k230_sysclk *ksc;
> >> +    struct clk_hw hw;
> >> +};
> >> +
> >> +#define to_k230_clk(_hw)    container_of(_hw, struct k230_clk, hw)
> >> +
> >> +struct k230_sysclk {
> >> +    struct platform_device *pdev;
> >> +    void __iomem           *pll_regs, *regs;
> >> +    spinlock_t           pll_lock, clk_lock;
> >> +    struct k230_pll           *plls;
> >> +    struct k230_clk           *clks;
> >> +    struct k230_pll_div    *dclks;
> >> +};
> >> +
> >> +struct k230_clk_rate_cfg {
> >> +    /* rate reg */
> >> +    u32 rate_reg_off;
> >> +    void __iomem *rate_reg;
> >> +    /* rate info*/
> >> +    u32 rate_write_enable_bit;
> >> +    enum k230_clk_div_type method;
> >> +    /* rate mul */
> >> +    u32 rate_mul_min;
> >> +    u32 rate_mul_max;
> >> +    u32 rate_mul_shift;
> >> +    u32 rate_mul_mask;
> >> +    /* rate div */
> >> +    u32 rate_div_min;
> >> +    u32 rate_div_max;
> >> +    u32 rate_div_shift;
> >> +    u32 rate_div_mask;
> >> +};
> >> +
> >> +struct k230_clk_rate_cfg_c {
> >> +    /* rate_c reg */
> >> +    u32 rate_reg_off_c;
> >> +    void __iomem *rate_reg_c;
> >> +
> >> +    /* rate_c info */
> >> +    u32 rate_write_enable_bit_c;
> >> +
> >> +    /* rate mul-changable */
> >> +    u32 rate_mul_min_c;
> >> +    u32 rate_mul_max_c;
> >> +    u32 rate_mul_shift_c;
> >> +    u32 rate_mul_mask_c;
> >> +};
> >> +
> >
> > What's "k230_clk_rate_cfg_c", and what's the difference against
> > "k230_clk_gate_cfg". Please document it and clarify this.
> >
> > It is recommended to add documentation comments to important structure
> > types and their members.
> >
> > Regarding how to document kernel code, see
> > https://docs.kernel.org/doc-guide/kernel-doc.html.
> OK, I'll try to clarify it next version.
> >
> > [......]
> >
> >
> > This structure definition looks a bit complicated, with nested
> > structure pointers. Can it be simplified, similar to struct
> > k210_clk_cfg in drivers/clk/clk-k210.c?
> >
> > And can we use composite clk here?
> I'm considering using clk_composite here.
> >
> > [......]
> >
> >> +static struct k230_clk_cfg k230_cpu0_src = {
> >> +    .name = "cpu0_src",
> >> +    .read_only = false,
> >> +    .flags = 0,
> >> +    .num_parent = 1,
> >> +    .parent[0] = {
> >> +        .type = K230_PLL_DIV,
> >> +        .pll_div_cfg = &k230_pll_div_cfgs[K230_PLL0_DIV2],
> >> +    },
> >> +    .rate_cfg = &k230_cpu0_src_rate,
> >> +    .rate_cfg_c = NULL,
> >> +    .gate_cfg = &k230_cpu0_src_gate,
> >> +    .mux_cfg = NULL,
> >> +};
> >> +
> >> +static struct k230_clk_cfg k230_cpu0_aclk = {
> >> +    .name = "cpu0_aclk",
> >> +    .read_only = false,
> >> +    .flags = 0,
> >> +    .num_parent = 1,
> >> +    .parent[0] = {
> >> +        .type = K230_CLK_COMPOSITE,
> >> +        .clk_cfg = &k230_cpu0_src,
> >> +    },
> >> +    .rate_cfg = &k230_cpu0_aclk_rate,
> >> +    .rate_cfg_c = NULL,
> >> +    .gate_cfg = NULL,
> >> +    .mux_cfg = NULL,
> >> +};
> >> +
> >
> > Suggest use Macro to simplify the code here, see
> > drivers/clk/sophgo/clk-cv1800.c for example.
> I see, I' ll replace these init code with macro instead.
> >
> > [......]
> >
> >
