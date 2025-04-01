Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0005E86353
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 10:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743501887; cv=none; b=WLNwqPTSA4KGkSe5ylDgJ2ZKeFDopuwMMlew9cI9QoEV7rjTR2pCkc88X2LsEWfJoQNzwtLFUAqTztT3XJ4XQSbOzq6lwCNKcuZPb27Yxa/5nBVFbL8M0AivJLtoasCQe9dKEwBnWxx7uDYQ/vzl9n5++bFX5Apy6lBxVedcWr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743501887; c=relaxed/simple;
	bh=yLVThYYA6cNY9PUGPSW4FSYUx9C5pZJnEK45ZxDswes=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l9ak7xJmqgXXQbbxpsk3NgnSVrH19Yq609zwdL+XhjUO3XZ20wim06DBXHHEdELfX4zFTPR2b5IcTh3uJFjuvk1wYhSC6em8T8Bdtrk/Bnx4ddNvUfMIiHlahmD96+f9pWrIQL/5mlwQhuzA8dL/AWyROneIjzr5TnjSji1UnWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rsmTr/E7; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rsmTr/E7"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-399749152b4so2329976f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 03:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743501884; x=1744106684; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KQo23aXh6Enj5fdA9qEy1GpUeWFTdLXEwF6NE7m3mJA=;
        b=rsmTr/E73C+8xuRlBvpeVwPWpmYH2sibcp7HqrnEM3mhz8vZoDaxI/Vp2YpYzvTWdC
         OjXGkj4JBODemD18IobpH8ZFdQdIDlSNFBt5SIIkeX1Gnoad33j7GvS8Rdk1XNCVIisB
         U380vxQvZgrmvZ26Td7JsBhSUEaOZQL13ZHVY4h6YRJiNopOmjihvYBp8nkwzCw/Bl3G
         kt8fynB0A+c8J/tldFPUTf7CuU/TVfhzOnZJCc/eHZ0aiceSZMSnlOIdE07wvDUlNaZN
         ufKFl4sQNSdgBQIIGM4S5feCAcQULrmctPLB9Zev6lUrSKS2I77SsJjvMccJTvwi0fAl
         N76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743501884; x=1744106684;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KQo23aXh6Enj5fdA9qEy1GpUeWFTdLXEwF6NE7m3mJA=;
        b=CabRUW1HZz91cYZnwHxbR+cWUpgqNCNWh04DhsgvuAMu8IeacRMPIJb/iWtjBvR6q0
         xHr4SkITBnG04zUQ2XpIVy6K2QgMjTypjdABhMGrBKZC2640whL/aBbm/dsYWK9mmBG2
         ZXtfyed3395Upfwc38Vj06N4581rLQVbigV3B1mbLHtiFJP2LBRtOUqq37mFGG/Pdeyh
         KLSqOucvlxDT6OCeBRJJz1vu0KqtXWRYgYifF5Qt0nv9z3WvSLLWqF1qbNXbH9lz2jGz
         L9o6FzJBpSAQxY0oVwODbfji8kCtvpUUVEUKCltPRWg179QGNGKmGwIBuJXlsz9zOQfH
         O9Dg==
X-Forwarded-Encrypted: i=1; AJvYcCXhcHk63zA+zetqPwTwfJ/s9wvIZcjD9VoRCAuy4VY0PXqILPNJeA91HfDitp6l1/izQxO4KIfmRLtgXM4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhyTDrkrHZkpMrunzzEYbKLfkpGo9/NksBhyj9V1kyXmG1fbq0
	g59ZX15wUksh1cM0MH2uPrXuXlgGROby7htIiCYG1fUMoC/vYQfeDsNB7ivgu4c=
X-Gm-Gg: ASbGnctxxF9XWtKssINTv8vaIN085G3XqRxo38NI29zPMJy7IWHtUNjxJJnw66E1WIk
	W61yNTWMwSaZ+Do4VXC1I3agIKLwLTqm53+5gSnh+jWSwSbz+p+JECb8liCf25pp7lkI5O6gERx
	JpaKprwKeD5TSC3NzONm8uIC4utj+77rOyzjdhBrmRAK1env4AF0G24uIsQ1vSInVkJVARLkZf3
	dmogN0RsJEN6SB9H5HohO/sZJiIBhU/hstsIsgE94mq6pbYInhfSPYz1To5HHayrHCERYIuK5aZ
	MopGiLfvC3cLeHk1ovsRY2G93nnMw7255KW26BE10q0KE4YoGg==
X-Google-Smtp-Source: AGHT+IGKH3+YwFpScbDFlONwMqvW6JZG47d1awQxbTH0GHEPJL6z6wmrXivexFM6D28nOH+YD/pWrw==
X-Received: by 2002:a5d:64e4:0:b0:399:737f:4de3 with SMTP id ffacd0b85a97d-39c2364ffa7mr1429075f8f.29.1743501884293;
        Tue, 01 Apr 2025 03:04:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d90001413sm151945485e9.39.2025.04.01.03.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 03:04:43 -0700 (PDT)
Date: Tue, 1 Apr 2025 13:04:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Felix Fietkau <nbd@nbd.name>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/net/wireless/mediatek/mt76/channel.c:307
 mt76_put_vif_phy_link() warn: variable dereferenced before IS_ERR check
 'mlink' (see line 305)
Message-ID: <9d01c307-e61c-49b4-8d0c-692b72b5d968@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   08733088b566b58283f0f12fb73f5db6a9a9de30
commit: 3ba20af886d1f604dceeb4d4c8ff872e2c4e885e wifi: mt76: scan: set vif offchannel link for scanning/roc
config: x86_64-randconfig-161-20250401 (https://download.01.org/0day-ci/archive/20250401/202504011739.HvUKtUUe-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202504011739.HvUKtUUe-lkp@intel.com/

smatch warnings:
drivers/net/wireless/mediatek/mt76/channel.c:307 mt76_put_vif_phy_link() warn: variable dereferenced before IS_ERR check 'mlink' (see line 305)

vim +/mlink +307 drivers/net/wireless/mediatek/mt76/channel.c

e411b8190fe7c9 Felix Fietkau 2025-01-02  301  void mt76_put_vif_phy_link(struct mt76_phy *phy, struct ieee80211_vif *vif,
e411b8190fe7c9 Felix Fietkau 2025-01-02  302  			   struct mt76_vif_link *mlink)
e411b8190fe7c9 Felix Fietkau 2025-01-02  303  {
e411b8190fe7c9 Felix Fietkau 2025-01-02  304  	struct mt76_dev *dev = phy->dev;
3ba20af886d1f6 Felix Fietkau 2025-03-11 @305  	struct mt76_vif_data *mvif = mlink->mvif;
                                                                             ^^^^^^^^^^^
Dereference

e411b8190fe7c9 Felix Fietkau 2025-01-02  306  
e411b8190fe7c9 Felix Fietkau 2025-01-02 @307  	if (IS_ERR_OR_NULL(mlink) || !mlink->offchannel)
                                                                   ^^^^^
Too late

e411b8190fe7c9 Felix Fietkau 2025-01-02  308  		return;
e411b8190fe7c9 Felix Fietkau 2025-01-02  309  
3ba20af886d1f6 Felix Fietkau 2025-03-11  310  	rcu_assign_pointer(mvif->offchannel_link, NULL);
e411b8190fe7c9 Felix Fietkau 2025-01-02  311  	dev->drv->vif_link_remove(phy, vif, &vif->bss_conf, mlink);
e411b8190fe7c9 Felix Fietkau 2025-01-02  312  	kfree(mlink);
e411b8190fe7c9 Felix Fietkau 2025-01-02  313  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

