Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945CF1957FC
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 22:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748297871; cv=none; b=sSJcBov0WJssFrc3esSm3juw00xV5ZTYCRBAWJOrDDmZKS3Fi2Dld4EgutmshQzyoPs6QxdZ8qIGmuF9e41v2Y4xkCSi8F4ZwSHPtMQV1jKronbTPstqj5LHcXbYuI+oYlMMAWvovvg2YYUGBnqxKbW9A+oQVYDV6xXErBr4HHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748297871; c=relaxed/simple;
	bh=4D+AotAhkqyyq603rPCeRmywsUD0Aj+0e+3KhZu56IM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QcREDikP2At5n9Yldrp0Qid5X/pxs7I0Rdkx6vv1WIzLhLAXGtcJtT0mthv2uJIji9WpOfMTElr+0rxSIUCMwUE2hLMxum17usOjzoeDBtcOveLaTbZ5ynmZuvxi2KaTuqR3XcrP2MIZUpO7+2cP+/sr9TW8sEl18GJLs1S5v14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PQ4IVtBU; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PQ4IVtBU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748297870; x=1779833870;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4D+AotAhkqyyq603rPCeRmywsUD0Aj+0e+3KhZu56IM=;
  b=PQ4IVtBUDLDqYs1jCekLY6dTp6VgQvMsDgDkcSnzpb6vRjWnkvT8tpoG
   gtvhydJL5Tj0gpoXcZjdP6V1IAc5qDcKM+4egOpsrZly3e4yyVkzeJ7qO
   ppvc7OHeIwwRFK+jqI+8IJ4vE8IWKGoXS4al8+pxKXJHiiU6eOkjJK4zg
   RfvZ/NgAclYIi0lu/tyKIRnpsiwuZWaGe1IL/+nbZndu/97opesMSpFcC
   GGtk6Ra/dJBQuxKLEraQfbjcq0RWdXxRguoGi0EPRN83g75sGKTvVmNPA
   zEZ1O1oA8JSFz/9nJyrQyi308xGILA2vPDv2TrLekDX/iOxnIwFZbcDhm
   Q==;
X-CSE-ConnectionGUID: EtEa5Z2QSDKutIiTI7iMOw==
X-CSE-MsgGUID: JBJSpJwAQh2ohRCNeClZqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="50384342"
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; 
   d="scan'208";a="50384342"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 15:17:49 -0700
X-CSE-ConnectionGUID: F0mTqo3VS0GzVAdFgb41WQ==
X-CSE-MsgGUID: WatK2GHVQXSgZFIK1oZ2gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; 
   d="scan'208";a="143124224"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 May 2025 15:17:48 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJg8f-000SjQ-0T;
	Mon, 26 May 2025 22:17:45 +0000
Date: Tue, 27 May 2025 06:17:02 +0800
From: kernel test robot <lkp@intel.com>
To: Qiu-ji Chen <chenqiuji666@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: drivers/dma/mediatek/mtk-cqdma.c:453:1-18: ERROR: nested
 lock+irqsave that reuses flags from line 452.
Message-ID: <202505270641.MStzJUfU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   49fffac983ac52aea0ab94914be3f56bcf92d5dc
commit: 157ae5ffd76a2857ccb4b7ce40bc5a344ca00395 dmaengine: mediatek: Fix a possible deadlock error in mtk_cqdma_tx_status()
date:   12 days ago
config: hexagon-randconfig-r061-20250526 (https://download.01.org/0day-ci/archive/20250527/202505270641.MStzJUfU-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505270641.MStzJUfU-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/dma/mediatek/mtk-cqdma.c:453:1-18: ERROR: nested lock+irqsave that reuses flags from line 452.

vim +453 drivers/dma/mediatek/mtk-cqdma.c

b1f01e48df5a345 Shun-Chih Yu 2018-10-18  436  
b1f01e48df5a345 Shun-Chih Yu 2018-10-18  437  static enum dma_status mtk_cqdma_tx_status(struct dma_chan *c,
b1f01e48df5a345 Shun-Chih Yu 2018-10-18  438  					   dma_cookie_t cookie,
b1f01e48df5a345 Shun-Chih Yu 2018-10-18  439  					   struct dma_tx_state *txstate)
b1f01e48df5a345 Shun-Chih Yu 2018-10-18  440  {
b1f01e48df5a345 Shun-Chih Yu 2018-10-18  441  	struct mtk_cqdma_vchan *cvc = to_cqdma_vchan(c);
b1f01e48df5a345 Shun-Chih Yu 2018-10-18  442  	struct mtk_cqdma_vdesc *cvd;
b1f01e48df5a345 Shun-Chih Yu 2018-10-18  443  	struct virt_dma_desc *vd;
b1f01e48df5a345 Shun-Chih Yu 2018-10-18  444  	enum dma_status ret;
b1f01e48df5a345 Shun-Chih Yu 2018-10-18  445  	unsigned long flags;
b1f01e48df5a345 Shun-Chih Yu 2018-10-18  446  	size_t bytes = 0;
b1f01e48df5a345 Shun-Chih Yu 2018-10-18  447  
b1f01e48df5a345 Shun-Chih Yu 2018-10-18  448  	ret = dma_cookie_status(c, cookie, txstate);
b1f01e48df5a345 Shun-Chih Yu 2018-10-18  449  	if (ret == DMA_COMPLETE || !txstate)
b1f01e48df5a345 Shun-Chih Yu 2018-10-18  450  		return ret;
b1f01e48df5a345 Shun-Chih Yu 2018-10-18  451  
157ae5ffd76a285 Qiu-ji Chen  2025-05-08 @452  	spin_lock_irqsave(&cvc->pc->lock, flags);
b1f01e48df5a345 Shun-Chih Yu 2018-10-18 @453  	spin_lock_irqsave(&cvc->vc.lock, flags);
b1f01e48df5a345 Shun-Chih Yu 2018-10-18  454  	vd = mtk_cqdma_find_active_desc(c, cookie);
b1f01e48df5a345 Shun-Chih Yu 2018-10-18  455  	spin_unlock_irqrestore(&cvc->vc.lock, flags);
157ae5ffd76a285 Qiu-ji Chen  2025-05-08  456  	spin_unlock_irqrestore(&cvc->pc->lock, flags);
b1f01e48df5a345 Shun-Chih Yu 2018-10-18  457  
b1f01e48df5a345 Shun-Chih Yu 2018-10-18  458  	if (vd) {
b1f01e48df5a345 Shun-Chih Yu 2018-10-18  459  		cvd = to_cqdma_vdesc(vd);
b1f01e48df5a345 Shun-Chih Yu 2018-10-18  460  		bytes = cvd->residue;
b1f01e48df5a345 Shun-Chih Yu 2018-10-18  461  	}
b1f01e48df5a345 Shun-Chih Yu 2018-10-18  462  
b1f01e48df5a345 Shun-Chih Yu 2018-10-18  463  	dma_set_residue(txstate, bytes);
b1f01e48df5a345 Shun-Chih Yu 2018-10-18  464  
b1f01e48df5a345 Shun-Chih Yu 2018-10-18  465  	return ret;
b1f01e48df5a345 Shun-Chih Yu 2018-10-18  466  }
b1f01e48df5a345 Shun-Chih Yu 2018-10-18  467  

:::::: The code at line 453 was first introduced by commit
:::::: b1f01e48df5a3454b88c5ff1eb4501f685351c67 dmaengine: mediatek: Add MediaTek Command-Queue DMA controller for MT6765 SoC

:::::: TO: Shun-Chih Yu <shun-chih.yu@mediatek.com>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
