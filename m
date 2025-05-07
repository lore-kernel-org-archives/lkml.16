Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9A629A0;
	Wed,  7 May 2025 06:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746598032; cv=none; b=RVHwjIyEyB72gLyPwH8gPqv78w1JQ72+5qQZT9KgHTP4jnwgngkc6mQC40K5RIZC5pPUdHnMRm/040yQoqlQE+dq6XH8JqkKv9KdZpxZo3A8nomo2cXL7YDhfxAiuSLyy1IhVZsNH2pbsr60hF6Deszl7Z3++Gk3C+EzkEgqtDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746598032; c=relaxed/simple;
	bh=XJ3GmIEe0qHJJespiwekgd+syCW0uno2XczVjcXdZcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qx2y1XJ2oqvmYcfLGJCzFx1n/CIW15IZQDMJI8mJK0S0bntyIMCKa6vksZfASEdPRmEcn0UmAfkwNkwW/kJy19rQgA8V8dZa1ZjStuh76+Ew8dA8yycqeHbyzx9/oQo9UF5mb15rGhcB7GE+wqVV9HvXeG00rk4gTB8JxiPLlGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NW9nVC2S; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NW9nVC2S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746598031; x=1778134031;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XJ3GmIEe0qHJJespiwekgd+syCW0uno2XczVjcXdZcw=;
  b=NW9nVC2StyMnrB0NQggreaB/0PK3fQGVHxbw8xrRw3IpGqz3QOJJNi3z
   Ndj+g+n7w6BFJtczHW51Be8foDuvxEMoSP8BTRlZ7Io49jToa8U9lIwZN
   9J87F00ITjD6LpZWfxmgBelCcMlkfLmqh7cLrbPoNTvjfoMVGNwcx5P51
   fikO2gyhLzZS3cEO9R9bgsUiNpFD5N+R7DbDiTxh+ykYXcm/gAh38jKAo
   2+YiOeoNITU1yRJ5R/Jn12oX+ZUc3FEAmEQ2y6/5DlCnCL3YsYZEa+bg6
   oENEBIEfyWJz7mcH87bl9EtbNUM454zAE1DhUxdTrplMjXXnpaeC7UWv1
   g==;
X-CSE-ConnectionGUID: t2JET63oRLCMmfMugbBM8g==
X-CSE-MsgGUID: CLSdpcvUQAmm4GCifh2xvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48316402"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="48316402"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 23:07:09 -0700
X-CSE-ConnectionGUID: mYUWIYhbR5efS8YdeLTv+A==
X-CSE-MsgGUID: 8L47qrO8S56HbJmO3Re3Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="136370562"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 May 2025 23:07:06 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCXvr-00079S-0D;
	Wed, 07 May 2025 06:07:03 +0000
Date: Wed, 7 May 2025 14:06:20 +0800
From: kernel test robot <lkp@intel.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Yuntao Dai <d1581209858@live.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 3/3] mailbox: sophgo: add mailbox driver for CV18XX
 series SoC
Message-ID: <202505071325.uHimwt0g-lkp@intel.com>
References: <20250428-cv18xx-mbox-v3-3-ed18dfd836d1@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428-cv18xx-mbox-v3-3-ed18dfd836d1@pigmoral.tech>

Hi Junhui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b4432656b36e5cc1d50a1f2dc15357543add530e]

url:    https://github.com/intel-lab-lkp/linux/commits/Junhui-Liu/dt-bindings-mailbox-add-Sophgo-CV18XX-series-SoC/20250428-221604
base:   b4432656b36e5cc1d50a1f2dc15357543add530e
patch link:    https://lore.kernel.org/r/20250428-cv18xx-mbox-v3-3-ed18dfd836d1%40pigmoral.tech
patch subject: [PATCH v3 3/3] mailbox: sophgo: add mailbox driver for CV18XX series SoC
config: m68k-randconfig-r121-20250429 (https://download.01.org/0day-ci/archive/20250507/202505071325.uHimwt0g-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250507/202505071325.uHimwt0g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071325.uHimwt0g-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mailbox/cv1800-mailbox.c:64:50: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/mailbox/cv1800-mailbox.c:89:33: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/mailbox/cv1800-mailbox.c:88:42: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long long [noderef] [usertype] __iomem * @@     got unsigned long long [usertype] * @@
   drivers/mailbox/cv1800-mailbox.c:88:42: sparse:     expected unsigned long long [noderef] [usertype] __iomem *
   drivers/mailbox/cv1800-mailbox.c:88:42: sparse:     got unsigned long long [usertype] *
   drivers/mailbox/cv1800-mailbox.c:109:21: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/mailbox/cv1800-mailbox.c:109:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *dst @@     got unsigned long long [usertype] * @@
   drivers/mailbox/cv1800-mailbox.c:109:21: sparse:     expected void volatile [noderef] __iomem *dst
   drivers/mailbox/cv1800-mailbox.c:109:21: sparse:     got unsigned long long [usertype] *

vim +/__iomem +64 drivers/mailbox/cv1800-mailbox.c

    54	
    55	static irqreturn_t cv1800_mbox_isr(int irq, void *dev_id)
    56	{
    57		struct cv1800_mbox *mbox = (struct cv1800_mbox *)dev_id;
    58		size_t i;
    59		int ret = IRQ_NONE;
    60	
    61		for (i = 0; i < MAILBOX_MAX_CHAN; i++) {
    62			if (mbox->content[i] && mbox->chans[i].cl) {
    63				mbox_chan_received_data(&mbox->chans[i],
  > 64							(void *)mbox->content[i]);
    65				mbox->content[i] = NULL;
    66				ret = IRQ_HANDLED;
    67			}
    68		}
    69	
    70		return ret;
    71	}
    72	
    73	static irqreturn_t cv1800_mbox_irq(int irq, void *dev_id)
    74	{
    75		struct cv1800_mbox *mbox = (struct cv1800_mbox *)dev_id;
    76		u8 set, valid;
    77		size_t i;
    78		int ret = IRQ_NONE;
    79	
    80		set = readb(mbox->mbox_base + MBOX_SET_INT_REG(RECV_CPU));
    81	
    82		if (!set)
    83			return ret;
    84	
    85		for (i = 0; i < MAILBOX_MAX_CHAN; i++) {
    86			valid = set & BIT(i);
    87			if (valid) {
  > 88				mbox->content[i] =
    89					MBOX_CONTEXT_BASE_INDEX(mbox->mbox_base, i);
    90				writeb(valid,
    91				       mbox->mbox_base + MBOX_SET_CLR_REG(RECV_CPU));
    92				writeb(~valid, mbox->mbox_base + MBOX_EN_REG(RECV_CPU));
    93				ret = IRQ_WAKE_THREAD;
    94			}
    95		}
    96	
    97		return ret;
    98	}
    99	
   100	static int cv1800_mbox_send_data(struct mbox_chan *chan, void *data)
   101	{
   102		struct cv1800_mbox_chan_priv *priv =
   103			(struct cv1800_mbox_chan_priv *)chan->con_priv;
   104		struct cv1800_mbox *mbox = dev_get_drvdata(chan->mbox->dev);
   105		int idx = priv->idx;
   106		int cpu = priv->cpu;
   107		u8 en, valid;
   108	
 > 109		memcpy_toio(MBOX_CONTEXT_BASE_INDEX(mbox->mbox_base, idx),
   110			    data, 8);
   111	
   112		valid = BIT(idx);
   113		writeb(valid, mbox->mbox_base + MBOX_SET_CLR_REG(cpu));
   114		en = readb(mbox->mbox_base + MBOX_EN_REG(cpu));
   115		writeb(en | valid, mbox->mbox_base + MBOX_EN_REG(cpu));
   116		writeb(valid, mbox->mbox_base + MBOX_SET_REG);
   117	
   118		return 0;
   119	}
   120	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
