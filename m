Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0636325D527;
	Wed,  7 May 2025 13:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746624897; cv=none; b=CAEXRwNpoRgguVdPvDYl8j7BhE/AjGShO1PpcfgKivnyl2eATg8tjcPJYM+N1oeslr9GO/TmK3Rl/0BjlzL2ZB59nVQKCr+xRrtQ8NxE3ncx2B4NcY0tgNBGjV7pBFur/ZTT9NjEL6RkngPVfel32Xq+ZUvx5yqXHj8i1KmVyek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746624897; c=relaxed/simple;
	bh=Y4eD+OhbCfhQaDdRgrXrG36PPqACyRsvgcYUvjr51mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nXJw6Yw9pFOEZhsU6Z2/3TrO21BR+QUD4cM6gcDkrOE2sfbEaWzpYd9gS53ZVOUtlUv6YHoK3jgIN+z33CHDiajkdRuezWAgt70NBh/aQWE5beYvKEZYkRL9zie6KELPPqsOmngroq1vwzy9UExKlPrPnlAJnBUBMfLu7T4Cq9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BY+Yddkc; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BY+Yddkc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746624895; x=1778160895;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y4eD+OhbCfhQaDdRgrXrG36PPqACyRsvgcYUvjr51mg=;
  b=BY+YddkcU8+dg6/b7xIsL4ri5Bt7lKdVMAY36kYno5EYfdDUmK6FZZi4
   1pQbKO721lcDWOhviaIXqRdsQZzrpRu9I7pO0OMF3SQQXcWVUMerAk5W8
   yynFTIK2qt6Vf/DxtzsPKMN1baaX/XgUE/4tmBlIa2cF1VEFQmJUrmn6L
   D5RdZk7sBh1yvLGtV/M+DHKDNNaz6I17fPL5CQA1tPiPXzxMSkjVorS//
   8ZE2YzQRMnPdLtKBlG2gD3t3PsDuykTOSKc+P2dUMLBNkiL0wmpBbyYhH
   8vZv2CkB+NObPX2zLDMeSJ8HRh9/gonvyGvXjzB08YRGg16ivzo9zMOTz
   w==;
X-CSE-ConnectionGUID: 5DO6RYjVQt2aJQSlwcG5FQ==
X-CSE-MsgGUID: vZQGGR4NTM6hCDjGbi44Jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="47606969"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="47606969"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 06:34:54 -0700
X-CSE-ConnectionGUID: Q82sXOpbRVKju48KD1yChg==
X-CSE-MsgGUID: vRjHQcFiSNylZ0CMo4EqGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="140006945"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 May 2025 06:34:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCevB-0007sZ-2w;
	Wed, 07 May 2025 13:34:49 +0000
Date: Wed, 7 May 2025 21:34:41 +0800
From: kernel test robot <lkp@intel.com>
To: justin.chen@broadcom.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, florian.fainelli@broadcom.com,
	conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
	jassisinghbrar@gmail.com, bcm-kernel-feedback-list@broadcom.com,
	Justin Chen <justin.chen@broadcom.com>
Subject: Re: [PATCH v4 2/2] mailbox: Add support for bcm74110
Message-ID: <202505072033.soYE6U5p-lkp@intel.com>
References: <20250415182826.3905917-3-justin.chen@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415182826.3905917-3-justin.chen@broadcom.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on jassibrar-mailbox/for-next]
[also build test ERROR on linus/master v6.15-rc5 next-20250507]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/justin-chen-broadcom-com/dt-bindings-mailbox-Add-support-for-bcm74110/20250416-125112
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git for-next
patch link:    https://lore.kernel.org/r/20250415182826.3905917-3-justin.chen%40broadcom.com
patch subject: [PATCH v4 2/2] mailbox: Add support for bcm74110
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250507/202505072033.soYE6U5p-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505072033.soYE6U5p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505072033.soYE6U5p-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/mailbox/bcm74110-mailbox.c: In function 'bcm74110_rx_push_init_msg':
>> drivers/mailbox/bcm74110-mailbox.c:142:15: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
     142 |         msg = kzalloc(sizeof(*msg), GFP_ATOMIC);
         |               ^~~~~~~
>> drivers/mailbox/bcm74110-mailbox.c:142:13: warning: assignment to 'struct bcm74110_mbox_msg *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     142 |         msg = kzalloc(sizeof(*msg), GFP_ATOMIC);
         |             ^
   drivers/mailbox/bcm74110-mailbox.c: In function 'bcm74110_rx_pop_init_msg':
>> drivers/mailbox/bcm74110-mailbox.c:237:9: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]
     237 |         kfree(msg);
         |         ^~~~~
   cc1: some warnings being treated as errors


vim +/kzalloc +142 drivers/mailbox/bcm74110-mailbox.c

   137	
   138	static void bcm74110_rx_push_init_msg(struct bcm74110_mbox *mbox, u32 val)
   139	{
   140		struct bcm74110_mbox_msg *msg;
   141	
 > 142		msg = kzalloc(sizeof(*msg), GFP_ATOMIC);
   143		if (!msg)
   144			return;
   145	
   146		INIT_LIST_HEAD(&msg->list_entry);
   147		msg->msg = val;
   148	
   149		spin_lock(&mbox->rx_svc_list_lock);
   150		list_add_tail(&msg->list_entry, &mbox->rx_svc_init_list);
   151		spin_unlock(&mbox->rx_svc_list_lock);
   152	}
   153	
   154	static void bcm74110_rx_process_msg(struct bcm74110_mbox *mbox)
   155	{
   156		struct device *dev = &mbox->pdev->dev;
   157		struct bcm74110_mbox_chan *chan_priv;
   158		struct mbox_chan *chan;
   159		u32 msg, status;
   160		int type;
   161	
   162		do {
   163			msg = bcm74110_rx_readl(mbox, BCM_MBOX_RDATA);
   164			status = bcm74110_rx_readl(mbox, BCM_MBOX_STATUS0);
   165	
   166			dev_dbg(dev, "rx: [{req=%lu|rply=%lu|srv=%lu|fn=%lu|length=%lu|slot=%lu]\n",
   167				BCM_MSG_GET_FIELD(msg, REQ), BCM_MSG_GET_FIELD(msg, RPLY),
   168				BCM_MSG_GET_FIELD(msg, SVC), BCM_MSG_GET_FIELD(msg, FUNC),
   169				BCM_MSG_GET_FIELD(msg, LENGTH), BCM_MSG_GET_FIELD(msg, SLOT));
   170	
   171			type = BCM_MSG_GET_FIELD(msg, SVC);
   172			switch (type) {
   173			case BCM_MSG_SVC_INIT:
   174				bcm74110_rx_push_init_msg(mbox, msg);
   175				break;
   176			case BCM_MSG_SVC_PMC:
   177			case BCM_MSG_SVC_SCMI:
   178			case BCM_MSG_SVC_DPFE:
   179				chan = &mbox->controller.chans[type];
   180				chan_priv = chan->con_priv;
   181				if (chan_priv->en)
   182					mbox_chan_received_data(chan, NULL);
   183				else
   184					dev_warn(dev, "Channel not enabled\n");
   185				break;
   186			default:
   187				dev_warn(dev, "Unsupported msg received\n");
   188			}
   189		} while (status & BCM_MBOX_STATUS0_NOT_EMPTY);
   190	}
   191	
   192	static irqreturn_t bcm74110_mbox_isr(int irq, void *data)
   193	{
   194		struct bcm74110_mbox *mbox = data;
   195		u32 status;
   196	
   197		status = bcm74110_irq_readl(mbox, BCM_MBOX_IRQ_STATUS);
   198	
   199		bcm74110_irq_writel(mbox, 0xffffffff, BCM_MBOX_IRQ_CLEAR);
   200	
   201		if (status & BCM_MBOX_IRQ_NOT_EMPTY)
   202			bcm74110_rx_process_msg(mbox);
   203		else
   204			dev_warn(&mbox->pdev->dev, "Spurious interrupt\n");
   205	
   206		return IRQ_HANDLED;
   207	}
   208	
   209	static void bcm74110_mbox_mask_and_clear(struct bcm74110_mbox *mbox)
   210	{
   211		bcm74110_irq_writel(mbox, 0xffffffff, BCM_MBOX_IRQ_MASK_SET);
   212		bcm74110_irq_writel(mbox, 0xffffffff, BCM_MBOX_IRQ_CLEAR);
   213	}
   214	
   215	static int bcm74110_rx_pop_init_msg(struct bcm74110_mbox *mbox, u32 func_type,
   216					    u32 *val)
   217	{
   218		struct bcm74110_mbox_msg *msg, *msg_tmp;
   219		unsigned long flags;
   220		bool found = false;
   221	
   222		spin_lock_irqsave(&mbox->rx_svc_list_lock, flags);
   223		list_for_each_entry_safe(msg, msg_tmp, &mbox->rx_svc_init_list,
   224					 list_entry) {
   225			if (BCM_MSG_GET_FIELD(msg->msg, FUNC) == func_type) {
   226				list_del(&msg->list_entry);
   227				found = true;
   228				break;
   229			}
   230		}
   231		spin_unlock_irqrestore(&mbox->rx_svc_list_lock, flags);
   232	
   233		if (!found)
   234			return -EINVAL;
   235	
   236		*val = msg->msg;
 > 237		kfree(msg);
   238	
   239		return 0;
   240	}
   241	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
