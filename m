Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D59231CB0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 11:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743592723; cv=none; b=LL+YNSF5Qk/6xf6IaPtZTOV11ZGOJA0GWF9hVdslT5WhQ5u/CnjAz6MajoYAml0vlDTyKS/br39vX12vhBxLwCZZ9XCAwbl6mMTGYbxNIqadnYWbGXZcFfh//m1S9eQhl480lBvhPiFhMZrl+01dV2mzd9FCfJI88+BfOwEvyVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743592723; c=relaxed/simple;
	bh=4zw2XxD/lazYdn6ObIwPethXbgBPAkjmsXSYybr3Lq8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SAhcV5TP4RGI+Gu2QObvnAlXTUe8Qx5HuzyluTMZRiaj8DihPbJYLeVMZWsT6Ac9r1BEp8VyM/ioBAjM1sluVftJfv1NNN9c06nwoOCAOQfqY6Qpinu+O5E3frRcv0mCztL5Robxdv8/XUzMtoHrpa+r53kenuN+Bfu15MbsCl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fZKA9kGm; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fZKA9kGm"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39bf44be22fso3450251f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 04:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743592719; x=1744197519; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Pe81jop8Ll7ztioIZQS1clySmVs5CptZvcTXW3TsFI=;
        b=fZKA9kGm5IW44FJ4XNx9NP1yJGlq32xxRImUWVGQY9hRL7r1j5wO6exWXb95nyEHcE
         k/gahIzmeOcZhyArYgexmZ4yGIxs8BjlUrd6HyXaGQf8Wc35mLDbO8JUtjBzV1ouFxuX
         YIbYSDBA70GB/JsNvws42uZROjwICdYhKU6l4BEorCJGvchleeI+yTD6vJMt+GwpnFDu
         Ie/7cCXW2ixsTJzcvBwR5aUbWtwVqNNC5gV1LNz+wj4PJIrk6xD8Vs99ZIIkr6YupM6g
         vjc+7rkJoHjPgnTEtdZTih2XSON3QhIh0dApXwe3zbXT9HkDKrXSU5V6PIzfAHxKp7Fu
         fX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743592719; x=1744197519;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Pe81jop8Ll7ztioIZQS1clySmVs5CptZvcTXW3TsFI=;
        b=NiLPVygRjkIjRuk/HYXCESiElsqYw6ZK5nCPIjA/gfRUNhPj+a0NJZZrGqxV6CFJyX
         qUjXY/OZKcodBGyA9BO6IzsNxqo+n3ovwOoQP2paRUfPmrDqlfBcxorKJ1H8hAVfk2T/
         LKmPQ6ITB1HLYv35Sw9Q++1thBYWcv9dyT8F+N7FbzypCICqk/WpkLv8FHh/+cl+O/WX
         wIbESpOWCb0sjl92YYV5727sKfYmAXF9CEcnk2dRR5aStViAE+v3Z6DaMDfnz5ZF0w82
         6EO/F7ElnI21yqCXhhYkiU+2CKnnd+IEj7H1A+1BSqjZVkk2zFyP93GoyaFZjILiU7MD
         zxhA==
X-Forwarded-Encrypted: i=1; AJvYcCV2PWydwYlC5FAB7ytaueIMQlrq/ngybmriaODV8S1WKX5K15NJW0wGtYo8Bfz589UpC77DL3HDRSWqZWw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwCjSei4u1Yi4Gg8D1WQpMsuwGnU4Y3kOzHIN1vNebKPWl/3gV
	yZHqCXIhEj4QdBVpuy1Z7juwMg5m4pfIojX5J+88VMe0QoI5vsMJN6tgDEQ9ycM=
X-Gm-Gg: ASbGncu6YeGcSAyFvqDPmTP5JAEPNZl41amWgx2XMoThSanF1Hxgk6sye/1sBQvR71A
	d68hM0sXJzPtHYb/8xAPoJJBc/w3bjvC1ukEz9ZtfIvb43Glp15kt/FZpD55I+sIQTDA6Uy34cM
	XVvh0MfC00KStYd30f2tzyfJXzCLGNF/EuI8sgO4HXB2q91373mJOo4k6xNsiUA2cbqb8nMd7Aj
	KR+LiwSQO2KnMu5sfaXhPRAGvSfCXDEvrwh1zqlvPeDknsChhShEYm8TOKxa1SWkvnBz5r9b2Ik
	TIfDL2N4vP81Fe022c008S0cJfBAM74rrq06Lod7vGvQAvf+NLQAcXv5ZeE+
X-Google-Smtp-Source: AGHT+IHQRoQJa2mTQNLyy8U+kE0q2bREN0pW+4OWNG0b+gLWh2w0Dnh3vEPbOrElFvpZkpi8WgtQ+w==
X-Received: by 2002:a05:6000:1449:b0:38d:dffc:c133 with SMTP id ffacd0b85a97d-39c297e465amr1484283f8f.44.1743592719227;
        Wed, 02 Apr 2025 04:18:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c0b79e393sm16898932f8f.72.2025.04.02.04.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 04:18:38 -0700 (PDT)
Date: Wed, 2 Apr 2025 14:18:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1672
 _dpu_encoder_trigger_start() warn: variable dereferenced before check 'phys'
 (see line 1670)
Message-ID: <36935440-aa60-469e-876c-f0a0cb7074c5@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   acc4d5ff0b61eb1715c498b6536c38c1feb7f3c1
commit: 8144d17a81d9ea742be5a02da62f5a7b2a8f95c1 drm/msm/dpu: Skip trigger flush and start for CWB
date:   4 weeks ago
config: arm64-randconfig-r073-20250402 (https://download.01.org/0day-ci/archive/20250402/202504021825.IW2340OS-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202504021825.IW2340OS-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1672 _dpu_encoder_trigger_start() warn: variable dereferenced before check 'phys' (see line 1670)
drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1814 _dpu_encoder_kickoff_phys() error: we previously assumed 'dpu_enc->cur_master' could be null (see line 1807)

vim +/phys +1672 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c

58fba464eaeff6 Sean Paul         2018-09-20  1668  static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1669  {
8144d17a81d9ea Jessica Zhang     2025-02-14 @1670  	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(phys->parent);
                                                                                                               ^^^^^^^^^^^^
Dereference

8144d17a81d9ea Jessica Zhang     2025-02-14  1671  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27 @1672  	if (!phys) {
                                                            ^^^^^
Checked too late.

25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1673  		DPU_ERROR("invalid argument(s)\n");
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1674  		return;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1675  	}
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1676  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1677  	if (!phys->hw_pp) {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1678  		DPU_ERROR("invalid pingpong hw\n");
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1679  		return;

[ snip ]

b4bb9f15b44392 Rob Clark         2019-08-29  1771  static void _dpu_encoder_kickoff_phys(struct dpu_encoder_virt *dpu_enc)
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1772  {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1773  	struct dpu_hw_ctl *ctl;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1774  	uint32_t i, pending_flush;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1775  	unsigned long lock_flags;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1776  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1777  	pending_flush = 0x0;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1778  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1779  	/* update pending counts and trigger kickoff ctl flush atomically */
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1780  	spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1781  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1782  	/* don't perform flush/start operations for slave encoders */
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1783  	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1784  		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1785  
b6fadcade62704 Drew Davenport    2019-12-06  1786  		if (phys->enable_state == DPU_ENC_DISABLED)
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1787  			continue;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1788  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1789  		ctl = phys->hw_ctl;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1790  
f98baa3109cea4 Sean Paul         2019-01-30  1791  		/*
f98baa3109cea4 Sean Paul         2019-01-30  1792  		 * This is cleared in frame_done worker, which isn't invoked
f98baa3109cea4 Sean Paul         2019-01-30  1793  		 * for async commits. So don't set this for async, since it'll
f98baa3109cea4 Sean Paul         2019-01-30  1794  		 * roll over to the next commit.
f98baa3109cea4 Sean Paul         2019-01-30  1795  		 */
b4bb9f15b44392 Rob Clark         2019-08-29  1796  		if (phys->split_role != ENC_ROLE_SLAVE)
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1797  			set_bit(i, dpu_enc->frame_busy_mask);
f98baa3109cea4 Sean Paul         2019-01-30  1798  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1799  		if (!phys->ops.needs_single_flush ||
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1800  				!phys->ops.needs_single_flush(phys))
b4bb9f15b44392 Rob Clark         2019-08-29  1801  			_dpu_encoder_trigger_flush(&dpu_enc->base, phys, 0x0);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1802  		else if (ctl->ops.get_pending_flush)
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1803  			pending_flush |= ctl->ops.get_pending_flush(ctl);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1804  	}
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1805  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1806  	/* for split flush, combine pending flush masks and send to master */
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27 @1807  	if (pending_flush && dpu_enc->cur_master) {
                                                                             ^^^^^^^^^^^^^^^^^^^
Check for NULL

25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1808  		_dpu_encoder_trigger_flush(
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1809  				&dpu_enc->base,
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1810  				dpu_enc->cur_master,
b4bb9f15b44392 Rob Clark         2019-08-29  1811  				pending_flush);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1812  	}
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1813  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27 @1814  	_dpu_encoder_trigger_start(dpu_enc->cur_master);
                                                                                   ^^^^^^^^^^^^^^^^^^^
Unchecked dereference

25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1815  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1816  	spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1817  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

