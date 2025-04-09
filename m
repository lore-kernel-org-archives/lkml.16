Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8B52253E4;
	Wed,  9 Apr 2025 14:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744207455; cv=none; b=hH6M59VW+GGIB8lI7QXz66DkDlME0NBfdp/k+Jb0IlADmuJLASRWjhAL3aHpFfwfP/OtlnIp038VJhk0NTi7YWck2pRVrLpZ6Yq0xl5nk5oe6KCRNwm9xDw4lTR/L9Il1JyZoG1mNB0sVtutGh9c1Zk0tNQ2Jesp32L2TDJcfkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744207455; c=relaxed/simple;
	bh=HcsrtxcBfrTGd4om7Qx2pPfzoIlpON5iTTrTwya39ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F6tYDuP//xMkkD4DwqEUxLVrtNszwewwsdd/UTkqq/dRbnOHEIvTMDXTbAiJXF0fThM4RIjSVfFQfy3apL2xrTTqPJYSmBgJNawWYFIRW4JMb/UJxwSpTnFXGfpdjMcnMplcm+J6dyPUpyyYDb/io5Wh/hMjg2mSd3zvbSkGXSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S8UNhrHn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S8UNhrHn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 866C6C4CEE3;
	Wed,  9 Apr 2025 14:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744207454;
	bh=HcsrtxcBfrTGd4om7Qx2pPfzoIlpON5iTTrTwya39ng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S8UNhrHn7rhtr8XgDlour0jm5WNeS37YzYZj1/QvEAnSBn/4Vr4Ev02vPFY9lOpRO
	 GryoW3AT/cDrxQy6gRv4LKbDwqeHjPDJGIJPevauC0SDkpb8te9kCeLRjp4Zyo4/fC
	 /zhNKx+eObZ0AZC0SGWVAPHPtktS5zzLHF9ryeCLPfLmBGbmCipMj7/NHToaEsmWKH
	 2Sqc5sC6ZqYORNZQ7Yi/44mnQSvzYLKOuiTAGf3rtw+0QnVH3pu/Ws1fHu8yrkJElv
	 i7gq3qnk1Ix6lOz98q9/Z1YcHdE8NphXmVkS0pq4gvIEGynmcG4ugUgBnN7CJMsQIP
	 MoTkZYznsf3wA==
Date: Wed, 9 Apr 2025 16:04:06 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 24/24] arm64: Kconfig: Enable GICv5
Message-ID: <Z/Z+VtK96h1yezE7@lpieralisi>
References: <20250408-gicv5-host-v1-24-1f26db465f8d@kernel.org>
 <202504092127.YaPW3UWk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202504092127.YaPW3UWk-lkp@intel.com>

On Wed, Apr 09, 2025 at 09:44:42PM +0800, kernel test robot wrote:
> Hi Lorenzo,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 0af2f6be1b4281385b618cb86ad946eded089ac8]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Pieralisi/Documentation-devicetree-bindings-Add-GICv5-DT-bindings/20250408-190630
> base:   0af2f6be1b4281385b618cb86ad946eded089ac8
> patch link:    https://lore.kernel.org/r/20250408-gicv5-host-v1-24-1f26db465f8d%40kernel.org
> patch subject: [PATCH 24/24] arm64: Kconfig: Enable GICv5
> config: arm64-randconfig-001-20250409 (https://download.01.org/0day-ci/archive/20250409/202504092127.YaPW3UWk-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250409/202504092127.YaPW3UWk-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504092127.YaPW3UWk-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/irqchip/irq-gic-v5-iwb.c:298:3: error: cannot jump from this goto statement to its label
>      298 |                 goto out_free;
>          |                 ^
>    drivers/irqchip/irq-gic-v5-iwb.c:300:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
>      300 |         guard(mutex)(&its->dev_alloc_lock);

This is clearly wrong, will update code in the IWB (if we are keeping
the current IWB driver) and ITS by removing the guard where misused and
keeping the mutex_lock/unlock().

Lorenzo

>          |         ^
>    include/linux/cleanup.h:319:15: note: expanded from macro 'guard'
>      319 |         CLASS(_name, __UNIQUE_ID(guard))
>          |                      ^
>    include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
>      166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
>          |                             ^
>    include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
>       84 | #define __PASTE(a,b) ___PASTE(a,b)
>          |                      ^
>    include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
>       83 | #define ___PASTE(a,b) a##b
>          |                       ^
>    <scratch space>:82:1: note: expanded from here
>       82 | __UNIQUE_ID_guard576
>          | ^
>    drivers/irqchip/irq-gic-v5-iwb.c:288:3: error: cannot jump from this goto statement to its label
>      288 |                 goto out_free;
>          |                 ^
>    drivers/irqchip/irq-gic-v5-iwb.c:300:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
>      300 |         guard(mutex)(&its->dev_alloc_lock);
>          |         ^
>    include/linux/cleanup.h:319:15: note: expanded from macro 'guard'
>      319 |         CLASS(_name, __UNIQUE_ID(guard))
>          |                      ^
>    include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
>      166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
>          |                             ^
>    include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
>       84 | #define __PASTE(a,b) ___PASTE(a,b)
>          |                      ^
>    include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
>       83 | #define ___PASTE(a,b) a##b
>          |                       ^
>    <scratch space>:82:1: note: expanded from here
>       82 | __UNIQUE_ID_guard576
>          | ^
>    2 errors generated.
> 
> 
> vim +298 drivers/irqchip/irq-gic-v5-iwb.c
> 
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  247  
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  248  static struct gicv5_iwb_chip_data *
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  249  __init gicv5_iwb_init_bases(void __iomem *iwb_base,
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  250  			     struct fwnode_handle *handle,
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  251  			     struct irq_domain *parent_domain, u32 device_id)
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  252  {
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  253  	u32 nr_wires, idr0, cr0;
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  254  	struct gicv5_iwb_chip_data *iwb_node;
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  255  	struct msi_domain_info *msi_info;
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  256  	struct gicv5_its_chip_data *its;
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  257  	struct gicv5_its_dev *its_dev;
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  258  	int ret;
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  259  
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  260  	msi_info = msi_get_domain_info(parent_domain);
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  261  	its = msi_info->data;
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  262  	if (!its) {
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  263  		pr_warn("IWB %pOF can't find parent ITS, bailing\n",
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  264  			to_of_node(handle));
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  265  		return ERR_PTR(-ENODEV);
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  266  	}
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  267  
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  268  	iwb_node = kzalloc(sizeof(*iwb_node), GFP_KERNEL);
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  269  	if (!iwb_node)
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  270  		return ERR_PTR(-ENOMEM);
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  271  
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  272  	iwb_node->iwb_base = iwb_base;
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  273  	iwb_node->device_id = device_id;
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  274  
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  275  	idr0 = iwb_readl(iwb_node, GICV5_IWB_IDR0);
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  276  	nr_wires = (FIELD_GET(GICV5_IWB_IDR0_IW_RANGE, idr0) + 1) * 32;
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  277  
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  278  	iwb_node->domain = irq_domain_create_hierarchy(parent_domain, 0,
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  279  			   nr_wires, handle, &gicv5_iwb_irq_domain_ops,
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  280  			   iwb_node);
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  281  	irq_domain_update_bus_token(iwb_node->domain, DOMAIN_BUS_WIRED);
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  282  
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  283  	cr0 = iwb_readl(iwb_node, GICV5_IWB_CR0);
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  284  	if (!FIELD_GET(GICV5_IWB_CR0_IWBEN, cr0)) {
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  285  		pr_err("IWB %s must be enabled in firmware\n",
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  286  		       fwnode_get_name(handle));
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  287  		ret = -EINVAL;
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  288  		goto out_free;
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  289  	}
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  290  
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  291  	iwb_node->nr_regs = FIELD_GET(GICV5_IWB_IDR0_IW_RANGE, idr0) + 1;
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  292  
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  293  	for (unsigned int n = 0; n < iwb_node->nr_regs; n++)
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  294  		iwb_writel(iwb_node, 0, GICV5_IWB_WENABLER + (sizeof(u32) * n));
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  295  
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  296  	ret = gicv5_iwb_wait_for_wenabler(iwb_node);
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  297  	if (ret)
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08 @298  		goto out_free;
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  299  
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  300  	guard(mutex)(&its->dev_alloc_lock);
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  301  
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  302  	its_dev = gicv5_its_alloc_device(its, roundup_pow_of_two(nr_wires),
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  303  					 device_id, true);
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  304  	if (IS_ERR(its_dev)) {
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  305  		ret = -ENODEV;
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  306  		goto out_free;
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  307  	}
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  308  
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  309  	return iwb_node;
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  310  out_free:
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  311  	irq_domain_remove(iwb_node->domain);
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  312  	kfree(iwb_node);
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  313  
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  314  	return ERR_PTR(ret);
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  315  }
> 6b60a5125729caf Lorenzo Pieralisi 2025-04-08  316  
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
