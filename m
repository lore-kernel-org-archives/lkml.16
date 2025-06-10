Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1184422B8C8
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749556718; cv=none; b=tGXZZ8iJYMs8heIAeTw9nN90ibGF4youA1XxKvvRMNJtuWgd768iii2WMacZptXCpii9fIVNbvHSybmKOW2VMKhYbKNewF9IbEUZdOWQY5UhSJ7tq8yRy8ywUsYb8NcWZlwLCpXryKautx7kAQxjI89HiB2M6LgxhBVXSLCxMXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749556718; c=relaxed/simple;
	bh=oSuwhQq+Bluwo64QpqkDIb7AUhl07to8IoFJ8lS9/2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k5eWD2Go1fqvE9XQjBjDS2NrFFQD81PVDdqGdg89sVijxGw7m+Q4RzkWyCaH/A1Ixaz1PEu/tB0DUm4+0jLRMHUQDBCHsPDHunJdnnPlAV/1GyF+QWFC20+qCDvCRVq3Cv5IUSnQNH+RvUuMpkcQy2I43Ea4X3lwPRI3g/AKnNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pz8ey0z/; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pz8ey0z/"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a3798794d3so4587563f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 04:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749556714; x=1750161514; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fr2GHHHlW+Ho8xouKG/ZW5VnBO30aTll50LbwTTQKV4=;
        b=pz8ey0z/s5+Alembr0xHrNR51FejOlwMs33TM3OMzGK9AqaV2UsVGVoruGAcB+2L2P
         54aYipwDga9IJm+29mvA/VhUku7u2iBO9LDtQeZl8mZjh514cjM+WOExeMcN5WVzj6v/
         2simxTNvVedV7krK2V1i4yBuny8slFMGe448wyH+ZO4oO3PJ0hZLCfGBpJyF9ELG3JAM
         XQiMj2LTVIliS89h5fd3oP5jFuHdR0BtHUeqVB4VPm31H/Jf6ilrZUbKHZ9W0i5RfrUo
         K78aI14cK5xV9o09glRj6HCLo2d00o8y7EgcTf9ztVRFjTsXFTN7b2obEndr3BnCVF0n
         mPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749556714; x=1750161514;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fr2GHHHlW+Ho8xouKG/ZW5VnBO30aTll50LbwTTQKV4=;
        b=U9yoeAX9yHn1pl3y9pNR+UPVhlzlQoRMOIp1mZYtsFbvfRYOS0YZaR2i4+oLMkDYvn
         GcA+KpML1dlHGee94JO0DU5/JVWKYJ8zH48KfMetwvsRMO0faEfEDrTMbnHGjn+m7mq/
         nDjH/3xVYKHRUb4lAlAi/l3uOjyzAuM/CJNTM2rlCvPMRksRBWh3pVOhYyr/S1om2tNU
         ZKYLY4n997qqi6RP80L8M7+kSh04THj0EweNOVX/cSe2nQADXnGPMl1EcJLVzwZK4j/F
         YHeaf4FAgypp/JKEVD7FisiLWyeKwWVei/8egQhzNyisM/EfYgLGKSAzPaRQeDfFbzcR
         NQRA==
X-Forwarded-Encrypted: i=1; AJvYcCVznKJVbDvybTnHoaEPUspwfkrtuWQxjgdgFTZElKHAN/63lrPRucmeX1uhPwNz91IR+6KIluNd12MX5k8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjaIQDXxr65cmExbsEo2d7x1uKLZk1unNOmw0sxyEG7yBlq5hO
	cRYQ+n5uddnqBnSYhJyOSNJCqB+hOEEwwSR+1tfwIgnp2QTWl/yTG20Apix9VmzKocI=
X-Gm-Gg: ASbGnctqH0SBKXrTkamYVNzKN30KU+DmMJup490hIvzE+wiaMCgrBz2TTwN10kgeWFf
	tR7vCLpX7gNGDjY7AGkoCTgXLHLV1Ah85RqIU6+y0FbBtRNMzOrRE+5oEZsur9ixiLpHGnQ8Sbe
	8RRA6pDqh2ffHmjKyZkdACucGjUXiE0hdEDYbKhbWQlQhtRePIMaogCJBySfoMxYRicmkt1M8rQ
	zn5nNmMC4lfrKPml8W9S0dZl0VJpYfxSecsEojA9tqV/ItlYsjcPj6T+a87F0DzttEvZgrfdkBS
	uQZIzBhwNs7ny8mI5RFcu/7oJKtSL/9Vt8bY7+8yOUKT/KKPD/aNcufb6+8B9bJ326A=
X-Google-Smtp-Source: AGHT+IFqytf/nTbHkRUIG/diZDiXo150ezbaVxRb2wLQm9hfUCK+BslHNFXbNjepnJ7Jh/G3vpM4Cg==
X-Received: by 2002:a05:6000:288c:b0:3a4:db49:94aa with SMTP id ffacd0b85a97d-3a531ab5272mr14966842f8f.21.1749556714376;
        Tue, 10 Jun 2025 04:58:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a532435f95sm7571216f8f.60.2025.06.10.04.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 04:58:33 -0700 (PDT)
Date: Tue, 10 Jun 2025 14:58:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Johannes Berg <johannes.berg@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>
Subject: drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c:624
 iwl_trans_pcie_gen2_start_fw() warn: inconsistent returns
 '&trans_pcie->mutex'.
Message-ID: <202506100707.WAnP5ePA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
commit: 909e1be6546258efb45993851d51d86862e2e5ee wifi: iwlwifi: implement TOP reset
date:   5 weeks ago
config: sparc-randconfig-r073-20250608 (https://download.01.org/0day-ci/archive/20250610/202506100707.WAnP5ePA-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506100707.WAnP5ePA-lkp@intel.com/

smatch warnings:
drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c:624 iwl_trans_pcie_gen2_start_fw() warn: inconsistent returns '&trans_pcie->mutex'.

vim +624 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c

eda50cde58de73 Sara Sharon    2016-09-28  486  int iwl_trans_pcie_gen2_start_fw(struct iwl_trans *trans,
eda50cde58de73 Sara Sharon    2016-09-28  487  				 const struct fw_img *fw, bool run_in_rfkill)
eda50cde58de73 Sara Sharon    2016-09-28  488  {
eda50cde58de73 Sara Sharon    2016-09-28  489  	struct iwl_trans_pcie *trans_pcie = IWL_TRANS_GET_PCIE_TRANS(trans);
70582b826365d2 Johannes Berg  2023-04-13  490  	bool hw_rfkill, keep_ram_busy;
909e1be6546258 Johannes Berg  2025-04-30  491  	bool top_reset_done = false;
eda50cde58de73 Sara Sharon    2016-09-28  492  	int ret;
eda50cde58de73 Sara Sharon    2016-09-28  493  
909e1be6546258 Johannes Berg  2025-04-30  494  	mutex_lock(&trans_pcie->mutex);
909e1be6546258 Johannes Berg  2025-04-30  495  again:
eda50cde58de73 Sara Sharon    2016-09-28  496  	/* This may fail if AMT took ownership of the device */
eda50cde58de73 Sara Sharon    2016-09-28  497  	if (iwl_pcie_prepare_card_hw(trans)) {
eda50cde58de73 Sara Sharon    2016-09-28  498  		IWL_WARN(trans, "Exit HW not ready\n");
909e1be6546258 Johannes Berg  2025-04-30  499  		ret = -EIO;
909e1be6546258 Johannes Berg  2025-04-30  500  		goto out;
eda50cde58de73 Sara Sharon    2016-09-28  501  	}
eda50cde58de73 Sara Sharon    2016-09-28  502  
eda50cde58de73 Sara Sharon    2016-09-28  503  	iwl_enable_rfkill_int(trans);
eda50cde58de73 Sara Sharon    2016-09-28  504  
eda50cde58de73 Sara Sharon    2016-09-28  505  	iwl_write32(trans, CSR_INT, 0xFFFFFFFF);
eda50cde58de73 Sara Sharon    2016-09-28  506  
eda50cde58de73 Sara Sharon    2016-09-28  507  	/*
eda50cde58de73 Sara Sharon    2016-09-28  508  	 * We enabled the RF-Kill interrupt and the handler may very
eda50cde58de73 Sara Sharon    2016-09-28  509  	 * well be running. Disable the interrupts to make sure no other
eda50cde58de73 Sara Sharon    2016-09-28  510  	 * interrupt can be fired.
eda50cde58de73 Sara Sharon    2016-09-28  511  	 */
eda50cde58de73 Sara Sharon    2016-09-28  512  	iwl_disable_interrupts(trans);
eda50cde58de73 Sara Sharon    2016-09-28  513  
eda50cde58de73 Sara Sharon    2016-09-28  514  	/* Make sure it finished running */
eda50cde58de73 Sara Sharon    2016-09-28  515  	iwl_pcie_synchronize_irqs(trans);
eda50cde58de73 Sara Sharon    2016-09-28  516  
eda50cde58de73 Sara Sharon    2016-09-28  517  	/* If platform's RF_KILL switch is NOT set to KILL */
9ad8fd0b4a24e6 Johannes Berg  2017-06-20  518  	hw_rfkill = iwl_pcie_check_hw_rf_kill(trans);
eda50cde58de73 Sara Sharon    2016-09-28  519  	if (hw_rfkill && !run_in_rfkill) {
eda50cde58de73 Sara Sharon    2016-09-28  520  		ret = -ERFKILL;
eda50cde58de73 Sara Sharon    2016-09-28  521  		goto out;
eda50cde58de73 Sara Sharon    2016-09-28  522  	}
eda50cde58de73 Sara Sharon    2016-09-28  523  
eda50cde58de73 Sara Sharon    2016-09-28  524  	/* Someone called stop_device, don't try to start_fw */
eda50cde58de73 Sara Sharon    2016-09-28  525  	if (trans_pcie->is_down) {
eda50cde58de73 Sara Sharon    2016-09-28  526  		IWL_WARN(trans,
eda50cde58de73 Sara Sharon    2016-09-28  527  			 "Can't start_fw since the HW hasn't been started\n");
eda50cde58de73 Sara Sharon    2016-09-28  528  		ret = -EIO;
eda50cde58de73 Sara Sharon    2016-09-28  529  		goto out;
eda50cde58de73 Sara Sharon    2016-09-28  530  	}
eda50cde58de73 Sara Sharon    2016-09-28  531  
eda50cde58de73 Sara Sharon    2016-09-28  532  	/* make sure rfkill handshake bits are cleared */
eda50cde58de73 Sara Sharon    2016-09-28  533  	iwl_write32(trans, CSR_UCODE_DRV_GP1_CLR, CSR_UCODE_SW_BIT_RFKILL);
eda50cde58de73 Sara Sharon    2016-09-28  534  	iwl_write32(trans, CSR_UCODE_DRV_GP1_CLR,
eda50cde58de73 Sara Sharon    2016-09-28  535  		    CSR_UCODE_DRV_GP1_BIT_CMD_BLOCKED);
eda50cde58de73 Sara Sharon    2016-09-28  536  
eda50cde58de73 Sara Sharon    2016-09-28  537  	/* clear (again), then enable host interrupts */
eda50cde58de73 Sara Sharon    2016-09-28  538  	iwl_write32(trans, CSR_INT, 0xFFFFFFFF);
eda50cde58de73 Sara Sharon    2016-09-28  539  
eda50cde58de73 Sara Sharon    2016-09-28  540  	ret = iwl_pcie_gen2_nic_init(trans);
eda50cde58de73 Sara Sharon    2016-09-28  541  	if (ret) {
eda50cde58de73 Sara Sharon    2016-09-28  542  		IWL_ERR(trans, "Unable to init nic\n");
eda50cde58de73 Sara Sharon    2016-09-28  543  		goto out;
eda50cde58de73 Sara Sharon    2016-09-28  544  	}
eda50cde58de73 Sara Sharon    2016-09-28  545  
909e1be6546258 Johannes Berg  2025-04-30  546  	if (WARN_ON(trans->do_top_reset &&
909e1be6546258 Johannes Berg  2025-04-30  547  		    trans->trans_cfg->device_family < IWL_DEVICE_FAMILY_SC))
909e1be6546258 Johannes Berg  2025-04-30  548  		return -EINVAL;

ret = -EINVAL;
goto out;

909e1be6546258 Johannes Berg  2025-04-30  549  
909e1be6546258 Johannes Berg  2025-04-30  550  	/* we need to wait later - set state */
909e1be6546258 Johannes Berg  2025-04-30  551  	if (trans->do_top_reset)
909e1be6546258 Johannes Berg  2025-04-30  552  		trans_pcie->fw_reset_state = FW_RESET_TOP_REQUESTED;
909e1be6546258 Johannes Berg  2025-04-30  553  
909e1be6546258 Johannes Berg  2025-04-30  554  	if (trans->trans_cfg->device_family >= IWL_DEVICE_FAMILY_AX210) {
909e1be6546258 Johannes Berg  2025-04-30  555  		if (!top_reset_done) {
909e1be6546258 Johannes Berg  2025-04-30  556  			ret = iwl_pcie_ctxt_info_gen3_alloc(trans, fw);
909e1be6546258 Johannes Berg  2025-04-30  557  			if (ret)
909e1be6546258 Johannes Berg  2025-04-30  558  				goto out;
909e1be6546258 Johannes Berg  2025-04-30  559  		}
909e1be6546258 Johannes Berg  2025-04-30  560  
909e1be6546258 Johannes Berg  2025-04-30  561  		iwl_pcie_ctxt_info_gen3_kick(trans);
909e1be6546258 Johannes Berg  2025-04-30  562  	} else {
97b00d877bb8c2 Johannes Berg  2017-04-19  563  		ret = iwl_pcie_ctxt_info_init(trans, fw);
97b00d877bb8c2 Johannes Berg  2017-04-19  564  		if (ret)
97b00d877bb8c2 Johannes Berg  2017-04-19  565  			goto out;
909e1be6546258 Johannes Berg  2025-04-30  566  	}
eda50cde58de73 Sara Sharon    2016-09-28  567  
70582b826365d2 Johannes Berg  2023-04-13  568  	keep_ram_busy = !iwl_pcie_set_ltr(trans);
25628bc08d4526 Johannes Berg  2021-03-26  569  
595c230b95130b Matti Gottlieb 2021-08-26  570  	if (trans->trans_cfg->device_family >= IWL_DEVICE_FAMILY_BZ) {
70d400ba7fa71d Johannes Berg  2024-07-29  571  		IWL_DEBUG_POWER(trans, "function scratch register value is 0x%08x\n",
70d400ba7fa71d Johannes Berg  2024-07-29  572  				iwl_read32(trans, CSR_FUNC_SCRATCH));
595c230b95130b Matti Gottlieb 2021-08-26  573  		iwl_write32(trans, CSR_FUNC_SCRATCH, CSR_FUNC_SCRATCH_INIT_VALUE);
9ce041f5966fd0 Johannes Berg  2021-08-02  574  		iwl_set_bit(trans, CSR_GP_CNTRL,
9ce041f5966fd0 Johannes Berg  2021-08-02  575  			    CSR_GP_CNTRL_REG_FLAG_ROM_START);
595c230b95130b Matti Gottlieb 2021-08-26  576  	} else if (trans->trans_cfg->device_family >= IWL_DEVICE_FAMILY_AX210) {
25628bc08d4526 Johannes Berg  2021-03-26  577  		iwl_write_umac_prph(trans, UREG_CPU_INIT_RUN, 1);
595c230b95130b Matti Gottlieb 2021-08-26  578  	} else {
25628bc08d4526 Johannes Berg  2021-03-26  579  		iwl_write_prph(trans, UREG_CPU_INIT_RUN, 1);
595c230b95130b Matti Gottlieb 2021-08-26  580  	}
25628bc08d4526 Johannes Berg  2021-03-26  581  
70582b826365d2 Johannes Berg  2023-04-13  582  	if (keep_ram_busy)
70582b826365d2 Johannes Berg  2023-04-13  583  		iwl_pcie_spin_for_iml(trans);
70582b826365d2 Johannes Berg  2023-04-13  584  
909e1be6546258 Johannes Berg  2025-04-30  585  	if (trans->do_top_reset) {
909e1be6546258 Johannes Berg  2025-04-30  586  		trans->do_top_reset = 0;
909e1be6546258 Johannes Berg  2025-04-30  587  
909e1be6546258 Johannes Berg  2025-04-30  588  #define FW_TOP_RESET_TIMEOUT	(HZ / 4)
909e1be6546258 Johannes Berg  2025-04-30  589  		ret = wait_event_timeout(trans_pcie->fw_reset_waitq,
909e1be6546258 Johannes Berg  2025-04-30  590  					 trans_pcie->fw_reset_state != FW_RESET_TOP_REQUESTED,
909e1be6546258 Johannes Berg  2025-04-30  591  					 FW_TOP_RESET_TIMEOUT);
909e1be6546258 Johannes Berg  2025-04-30  592  
909e1be6546258 Johannes Berg  2025-04-30  593  		if (trans_pcie->fw_reset_state != FW_RESET_OK) {
909e1be6546258 Johannes Berg  2025-04-30  594  			if (trans_pcie->fw_reset_state != FW_RESET_TOP_REQUESTED)
909e1be6546258 Johannes Berg  2025-04-30  595  				IWL_ERR(trans,
909e1be6546258 Johannes Berg  2025-04-30  596  					"TOP reset interrupted by error (state %d)!\n",
909e1be6546258 Johannes Berg  2025-04-30  597  					trans_pcie->fw_reset_state);
909e1be6546258 Johannes Berg  2025-04-30  598  			else
909e1be6546258 Johannes Berg  2025-04-30  599  				IWL_ERR(trans, "TOP reset timed out!\n");
909e1be6546258 Johannes Berg  2025-04-30  600  			iwl_op_mode_nic_error(trans->op_mode,
909e1be6546258 Johannes Berg  2025-04-30  601  					      IWL_ERR_TYPE_TOP_RESET_FAILED);
909e1be6546258 Johannes Berg  2025-04-30  602  			iwl_trans_schedule_reset(trans,
909e1be6546258 Johannes Berg  2025-04-30  603  						 IWL_ERR_TYPE_TOP_RESET_FAILED);
909e1be6546258 Johannes Berg  2025-04-30  604  			ret = -EIO;
909e1be6546258 Johannes Berg  2025-04-30  605  			goto out;
909e1be6546258 Johannes Berg  2025-04-30  606  		}
909e1be6546258 Johannes Berg  2025-04-30  607  
909e1be6546258 Johannes Berg  2025-04-30  608  		msleep(10);
909e1be6546258 Johannes Berg  2025-04-30  609  		IWL_INFO(trans, "TOP reset successful, reinit now\n");
909e1be6546258 Johannes Berg  2025-04-30  610  		/* now load the firmware again properly */
909e1be6546258 Johannes Berg  2025-04-30  611  		trans_pcie->prph_scratch->ctrl_cfg.control.control_flags &=
909e1be6546258 Johannes Berg  2025-04-30  612  			~cpu_to_le32(IWL_PRPH_SCRATCH_TOP_RESET);
909e1be6546258 Johannes Berg  2025-04-30  613  		top_reset_done = true;
909e1be6546258 Johannes Berg  2025-04-30  614  		goto again;
909e1be6546258 Johannes Berg  2025-04-30  615  	}
909e1be6546258 Johannes Berg  2025-04-30  616  
eda50cde58de73 Sara Sharon    2016-09-28  617  	/* re-check RF-Kill state since we may have missed the interrupt */
9ad8fd0b4a24e6 Johannes Berg  2017-06-20  618  	hw_rfkill = iwl_pcie_check_hw_rf_kill(trans);
eda50cde58de73 Sara Sharon    2016-09-28  619  	if (hw_rfkill && !run_in_rfkill)
eda50cde58de73 Sara Sharon    2016-09-28  620  		ret = -ERFKILL;
eda50cde58de73 Sara Sharon    2016-09-28  621  
eda50cde58de73 Sara Sharon    2016-09-28  622  out:
eda50cde58de73 Sara Sharon    2016-09-28  623  	mutex_unlock(&trans_pcie->mutex);
eda50cde58de73 Sara Sharon    2016-09-28 @624  	return ret;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

