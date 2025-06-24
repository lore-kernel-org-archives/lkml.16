Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593E0248F6F;
	Tue, 24 Jun 2025 11:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750764194; cv=none; b=iSmYt+LQnx2Cv71b1tElySfA94+W2O3e1hcM/h0pvs8cmgWXmheS9KHTJ1EmQMU4pchJ3064phk0HJ6DmOIkwybp84Wq2L353Gf3LGjgCPPuguth5QP3tcJD50CmRiRza7aDhs6DPbB67Bc521rpP/2mLI86H38ZMT7YDWaxsB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750764194; c=relaxed/simple;
	bh=jiKUfZqjG7qOZGQfCaAa2+Vnx3BVrYF0VLfPGeJuxmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y3qE146WQyXL3sC8lxSzlHe1wL0ebIB/4als17BVrDPplJ5ddGFeE2dt2wu5R+kBgn61chrFdqql+WxRsnYVAniuufufGrHPXrnIaeTwcVlWinl1p2ahtyA2zxIBu9Ig0CwZkQRuJLGYNY5LTSv8a/J9MUB/gXbPdcG1qpzRKpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F2mxsHvp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F2mxsHvp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750764193; x=1782300193;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jiKUfZqjG7qOZGQfCaAa2+Vnx3BVrYF0VLfPGeJuxmY=;
  b=F2mxsHvpAcvM0qgDfk3pEFceEkNXLwkdlWOleylSGYFvL6XU1J6lGPv2
   JiXiNNLvana/TRewu7ON+TffBeH3Qr4gZX+WcsFT2oCZhx02miyr9g5mK
   m8e0Y9xtLhu0zJH/Hwcez511DGkFI12oqxzkJtKmRWFH6Q12dD0gsvCBw
   DWcC1qzHhIZgj1bm8VdrpUYOiVDp5Yo9Op2Y8Oc+2sKplK9eF6VYa73Cd
   kTEBF+tye6Y5X/r2d16vg1u47tXi5zKWB2DLgYs0dtcVjrQIZAI5OPw4+
   +pjRip+FpufbSanAcjm+JUq3b7e7A7BWuq/YUbJuLaFDoU/WuAvRjPB1T
   g==;
X-CSE-ConnectionGUID: ktv6DD8WTqKVJV3fTnmCjg==
X-CSE-MsgGUID: ENcnmZjbQ9KsYzaL3Y42zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52721278"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="52721278"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 04:23:12 -0700
X-CSE-ConnectionGUID: kxUeEGS9Qhe2/bO/DnAVLw==
X-CSE-MsgGUID: 3f3kdLdqTwuaN2cQTp+PAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="151373519"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 24 Jun 2025 04:23:09 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uU1k2-000S3W-2D;
	Tue, 24 Jun 2025 11:23:06 +0000
Date: Tue, 24 Jun 2025 19:22:32 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	jassisinghbrar@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v1 2/2] mailbox: Add MediaTek TinySYS MHU-like Mailbox
Message-ID: <202506241946.HEKwafHB-lkp@intel.com>
References: <20250623120127.109237-3-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623120127.109237-3-angelogioacchino.delregno@collabora.com>

Hi AngeloGioacchino,

kernel test robot noticed the following build errors:

[auto build test ERROR on jassibrar-mailbox/for-next]
[also build test ERROR on robh/for-next soc/for-next linus/master v6.16-rc3 next-20250623]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-mailbox-Add-MediaTek-TinySYS-MHU-mailbox/20250623-201139
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git for-next
patch link:    https://lore.kernel.org/r/20250623120127.109237-3-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v1 2/2] mailbox: Add MediaTek TinySYS MHU-like Mailbox
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250624/202506241946.HEKwafHB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506241946.HEKwafHB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506241946.HEKwafHB-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mailbox/mtk-tinysys-mailbox.c: In function 'mtk_tinysys_mhu_mbox_startup':
>> drivers/mailbox/mtk-tinysys-mailbox.c:95:9: error: implicit declaration of function 'irq_clear_status_flags' [-Werror=implicit-function-declaration]
      95 |         irq_clear_status_flags(priv->irq, IRQ_NOAUTOEN);
         |         ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/mailbox/mtk-tinysys-mailbox.c:95:43: error: 'IRQ_NOAUTOEN' undeclared (first use in this function); did you mean 'IRQF_NO_AUTOEN'?
      95 |         irq_clear_status_flags(priv->irq, IRQ_NOAUTOEN);
         |                                           ^~~~~~~~~~~~
         |                                           IRQF_NO_AUTOEN
   drivers/mailbox/mtk-tinysys-mailbox.c:95:43: note: each undeclared identifier is reported only once for each function it appears in
   drivers/mailbox/mtk-tinysys-mailbox.c: In function 'mtk_tinysys_mhu_mbox_probe':
>> drivers/mailbox/mtk-tinysys-mailbox.c:152:9: error: implicit declaration of function 'irq_set_status_flags' [-Werror=implicit-function-declaration]
     152 |         irq_set_status_flags(priv->irq, IRQ_NOAUTOEN);
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/mailbox/mtk-tinysys-mailbox.c:152:41: error: 'IRQ_NOAUTOEN' undeclared (first use in this function); did you mean 'IRQF_NO_AUTOEN'?
     152 |         irq_set_status_flags(priv->irq, IRQ_NOAUTOEN);
         |                                         ^~~~~~~~~~~~
         |                                         IRQF_NO_AUTOEN
   cc1: some warnings being treated as errors


vim +/irq_clear_status_flags +95 drivers/mailbox/mtk-tinysys-mailbox.c

    90	
    91	static int mtk_tinysys_mhu_mbox_startup(struct mbox_chan *chan)
    92	{
    93		struct mtk_tinysys_mhu_mbox *priv = to_mtk_tinysys_mhu_mbox(chan->mbox);
    94	
  > 95		irq_clear_status_flags(priv->irq, IRQ_NOAUTOEN);
    96		enable_irq(priv->irq);
    97	
    98		return 0;
    99	}
   100	
   101	static void mtk_tinysys_mhu_mbox_shutdown(struct mbox_chan *chan)
   102	{
   103		struct mtk_tinysys_mhu_mbox *priv = to_mtk_tinysys_mhu_mbox(chan->mbox);
   104	
   105		disable_irq(priv->irq);
   106	}
   107	
   108	static const struct mbox_chan_ops tinysys_mbox_chan_ops = {
   109		.send_data = mtk_tinysys_mhu_mbox_send_data,
   110		.startup = mtk_tinysys_mhu_mbox_startup,
   111		.shutdown = mtk_tinysys_mhu_mbox_shutdown,
   112		.last_tx_done = mtk_tinysys_mhu_mbox_last_tx_done,
   113	};
   114	
   115	static int mtk_tinysys_mhu_mbox_probe(struct platform_device *pdev)
   116	{
   117		struct device *dev = &pdev->dev;
   118		struct mtk_tinysys_mhu_mbox *priv;
   119		struct mbox_controller *mbox;
   120		int ret;
   121	
   122		/* Allocate memory for device */
   123		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
   124		if (!priv)
   125			return -ENOMEM;
   126	
   127		priv->base = devm_platform_ioremap_resource(pdev, 0);
   128		if (IS_ERR(priv->base))
   129			return PTR_ERR(priv->base);
   130	
   131		priv->irq = platform_get_irq(pdev, 0);
   132		if (priv->irq < 0)
   133			return priv->irq;
   134	
   135		priv->pdata = device_get_match_data(dev);
   136		if (!priv->pdata)
   137			return -EINVAL;
   138	
   139		mbox = &priv->mbox;
   140		mbox->dev = dev;
   141		mbox->ops = &tinysys_mbox_chan_ops;
   142		mbox->txdone_irq = false;
   143		mbox->txdone_poll = true;
   144		mbox->txpoll_period = 1;
   145		mbox->num_chans = 1;
   146		mbox->chans = devm_kzalloc(dev, sizeof(*mbox->chans), GFP_KERNEL);
   147		if (!mbox->chans)
   148			return -ENOMEM;
   149	
   150		platform_set_drvdata(pdev, priv);
   151	
 > 152		irq_set_status_flags(priv->irq, IRQ_NOAUTOEN);
   153		ret = devm_request_irq(dev, priv->irq, mtk_tinysys_mhu_mbox_irq,
   154				       IRQF_TRIGGER_NONE, dev_name(dev), mbox->chans);
   155		if (ret < 0)
   156			return ret;
   157	
   158		ret = devm_mbox_controller_register(dev, &priv->mbox);
   159		if (ret)
   160			return dev_err_probe(dev, ret, "Failed to register mailbox\n");
   161	
   162		return 0;
   163	}
   164	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
