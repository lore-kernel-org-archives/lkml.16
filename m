Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EBA1D9A54
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744265942; cv=none; b=fTeOZfbDYCqR+LNLd+bcpRrORpgGK7dcmHVefxkl+CMKfdklglS76BnUnelecpkoFu03ZRs21ZIMsvDLPj5/DemClDCC0XR7TZsJiO/kMrMBx/pNyl4ec+zGm8u1/0Q7BQlh/uM56CYSm+lYB+S0gclXXzjo/ulDUsAnv1qtF3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744265942; c=relaxed/simple;
	bh=5FD9HeV5dMdYtycO1IP5ZxNeX6YXzBxjky0WuD8uPFc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pQqLix9YBn/Cnsa8PaHksSUEEbcTX8LKphzf1xwnekiPKbfa0w5rz6cysMBIopab37tRoOfiahKJcEnNLUq3Bq55XxRgdoxMK5mFkyg0okQ9HPneQ7+Ft5h9ykSBUx0h7eacs9tKPG4izWWTiYEsdWRWRCs9uJxJ/GWvvStzXsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IUe3cQSj; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IUe3cQSj"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39c2688619bso165136f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 23:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744265937; x=1744870737; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WO0sPvu+NJhcf5FTIP2koNXdzW3VS5n8QUGsSgSnAZw=;
        b=IUe3cQSj24cCe5SCAWD3sareVRPTXoWNZl6KKjxGcpcAsIZ8ctEqkZKTw9a4CmUsdW
         ts1YQzWoUtGe2IppLWE97uVDh7PMbnpCtZWXc0i6orQCgYxUTvn4TGfd4DPaCaJ3nPXH
         zUxpHWTVD4kfSwdpIYRgth4oOIQv4sSotlbYTVeKc3rkJGCA1t1cUAuwhhD9BW3R5lDI
         /Oay0G8fzgMn9xnRiL74D+2ozWmpWE0dF1ATlzgYNz4ZSKSKoXYlabiRpuYWTHzA7Dvv
         hMBGV/acfVwrxNpMxGapBHDy05iV4RPge2WBkF7+a8SWpfixIrBNEZe9ArxldAxxPtxg
         YJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744265937; x=1744870737;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WO0sPvu+NJhcf5FTIP2koNXdzW3VS5n8QUGsSgSnAZw=;
        b=Oc9u5XeniTnf2D9tYFClhbKsaPAiTQ3fj/VWq7jw/HSwSwKN9qC456T+bZXuYVxn/c
         mDWcXlwALD/4BvoLyiV1EGEfhzmyb0sIrHhFEuNWpfIbgkNPWz9G9oT+hx3KqZHI+D8E
         R1GUWUVaCxe7dSs218bISYFeAbQDLMgajoOSiB1lyYUZnwJPiBIIjPxkmXshbPOIEppp
         sAokhYM+Vbu/YkJOGfHJVp+9MIL5PgyDyOS/19O1Z99mq/M9zSEjgz6ovDD9dk8vdfsk
         qw4AdNA3vlyrt+4OkJ3ZS9UnAq1LPsV8T/qJ3YrKbcF+Il2ReXCL5BphIbMMO5dXJsm6
         KHGg==
X-Forwarded-Encrypted: i=1; AJvYcCWmepD7UnBFPytEJQLO4q6jWeTMPXsPSH/s9bmrXas7uV7uPqfstOqwqxPsTEZvY0zCj/zw3qRPGxVjaek=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4f+5GHpdIZ5ltNKjObpIZwJvSfvd3RbrUxYPAe9+TJNv6TZ9j
	iXckpRBfZ6kpHQ4yvh8yABTLx+ehTVto02P0Bvo+7CYfvAQ8Aq4fTNC5h+7kErzeArUoj1RJRUp
	O
X-Gm-Gg: ASbGncvfOIXQWK7doyy/nLd6ZpYvnmKe9pFr1wo2USRH4qBtC4NC/+7Pqblhry/sflI
	E8rxzeqylFsTGmxhn6Co6eNJr1frkSqGpsjJtD4dz7DhliLw6unVTTOOLZGnF1UZa00nvCZSPMn
	7OY9tGXucbazybbp5jDiDjXqi0JZ26D6DRFY0zJuM3uQEeZWVJcfE4GyJuCn62LicmGN6clNIj9
	NsvQuByvPj0JpTu4UFTST7THG+xGMMEIa9uWOlj7BG/SM+R1cimYb11Ea1igqY0a6AkQm/HqxsJ
	SAYXlJJttScZ61y/LlRQlywlgVxbj845kV1Zqm5g+Q68wHOjWvYrWByy
X-Google-Smtp-Source: AGHT+IE3Vkgj/iD9RCM6QwVVg82nnZ0Xtq80ks64ANuUFiN6dHiXhMD/Y+i1TeQXx08R6wbm0fmQSw==
X-Received: by 2002:a05:6000:2282:b0:39c:30d8:3290 with SMTP id ffacd0b85a97d-39d8f276007mr1149394f8f.7.1744265936819;
        Wed, 09 Apr 2025 23:18:56 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39d893f0b76sm3712417f8f.77.2025.04.09.23.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:18:56 -0700 (PDT)
Date: Thu, 10 Apr 2025 09:18:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>
Subject: drivers/net/wireless/mediatek/mt76/mt7996/main.c:952
 mt7996_mac_sta_add_links() error: uninitialized symbol 'err'.
Message-ID: <47f95421-75f8-418e-9f0f-47775f615d41@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3b07108ada81a8ebcebf1fe61367b4e436c895bd
commit: dd82a9e02c054052b5899872c1f32805428f6131 wifi: mt76: mt7996: Rely on mt7996_sta_link in sta_add/sta_remove callbacks
config: powerpc64-randconfig-r073-20250409 (https://download.01.org/0day-ci/archive/20250410/202504101051.1ya4Z4va-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202504101051.1ya4Z4va-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/main.c:952 mt7996_mac_sta_add_links() error: uninitialized symbol 'err'.

Old smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/main.c:73 mt7996_stop_phy() warn: variable dereferenced before check 'phy' (see line 71)
drivers/net/wireless/mediatek/mt76/mt7996/main.c:360 mt7996_set_monitor() warn: variable dereferenced before check 'phy' (see line 358)

vim +/err +952 drivers/net/wireless/mediatek/mt76/mt7996/main.c

dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  924  static int
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  925  mt7996_mac_sta_add_links(struct mt7996_dev *dev, struct ieee80211_vif *vif,
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  926  			 struct ieee80211_sta *sta, unsigned long new_links)
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  927  {
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  928  	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  929  	unsigned int link_id;
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  930  	int err;
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  931  
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  932  	for_each_set_bit(link_id, &new_links, IEEE80211_MLD_MAX_NUM_LINKS) {
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  933  		struct mt7996_vif_link *link;
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  934  
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  935  		if (rcu_access_pointer(msta->link[link_id]))
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  936  			continue;
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  937  
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  938  		link = mt7996_vif_link(dev, vif, link_id);
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  939  		if (!link)
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  940  			goto error_unlink;

error code?

dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  941  
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  942  		err = mt7996_mac_sta_init_link(dev, vif, link, sta, link_id);
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  943  		if (err)
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  944  			goto error_unlink;
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  945  	}
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  946  
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  947  	return 0;
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  948  
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  949  error_unlink:
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  950  	mt7996_mac_sta_remove_links(dev, sta, new_links);
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  951  
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11 @952  	return err;
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  953  }
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  954  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

