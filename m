Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E246520FAAC
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 02:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743991830; cv=none; b=D3o2QKrfIPgF6Eq+9bj9Dz9BRFm8aMUCBzrRzNJBXNmikJ5JaTvXVOoVb6HJP3n7/9T4WvTRzfutZkB6vY2fGX1HpmT+b3jf/Fy7shPTqUgAYgct8nBpLAfXt7R10PbhVqGsZ/WS6fOSReo1tZQpLLn7yX0MJiL0ZClW+4MemMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743991830; c=relaxed/simple;
	bh=XfcLzj4u9hEabd0szkloLzxLYdzD/t+nSwjBELOsAWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fqf9m2IRIMTBsZmQy+RvOpXNbZI05iGcnbrvzaiy6gJybj8djFaduiRMziVrNGW/7hyJwufpIQ2bZqJ3P8RGyv2SayJhjIhtw27F8sQB1ybP03nkfJNecnYkKp7Z51l1gKvYaXeJnF64hIU9w7MBNk9gHkrDEOMBVHvd7dl85Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/jSChcO; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/jSChcO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743991829; x=1775527829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XfcLzj4u9hEabd0szkloLzxLYdzD/t+nSwjBELOsAWM=;
  b=K/jSChcOIAOFVCbexhzkhPnQbkHQIgFDkps8kcWkR8H2nU/9lfRV3pEx
   NDevq8dut+YFOn03vtlVakh7T46bXZhpnBbw16X8QyEHb95KFOpAfN1PN
   C/wLtHQoXg+09I4M2Q6WpzV0Psv5ACWkChO89YQL2CikdozEQKUWY6hwD
   XfTkMu9ZvGFAWPfsLUzbdmcnQrCfS3hiBipEHE9ZROgtIEJ65d+3PrLlh
   4B3B3t+3iHQ9EtZTkr+XUgY/cw9eWwyia+ALfn/mWrsUPqEKpzFeVU8CT
   w9NqEtnuh3BtFkNGY3urSSSX/3TTclbkugte99mDzqLP+xxtnr1hscai0
   g==;
X-CSE-ConnectionGUID: WjZ5QxE8S9qU3yphgZjeqA==
X-CSE-MsgGUID: rBQeSdp6Twyy2ants5elkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="67834845"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="67834845"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 19:10:28 -0700
X-CSE-ConnectionGUID: gTwHepnPQy+/87yJ/JnJNg==
X-CSE-MsgGUID: /vCHT+ryR/ijaSKwWumzNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="128331273"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Apr 2025 19:10:27 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1bwO-0002t9-1m;
	Mon, 07 Apr 2025 02:10:24 +0000
Date: Mon, 7 Apr 2025 10:10:02 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: sound/soc/soc-ops-test.c:520:1: warning: the frame size of 1304
 bytes is larger than 1280 bytes
Message-ID: <202504071003.NtmGvvqC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0af2f6be1b4281385b618cb86ad946eded089ac8
commit: 7a24b876ad8cdd56457e881d384a038922b508c3 ASoC: ops-test: Add some basic kunit tests for soc-ops
date:   3 weeks ago
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250407/202504071003.NtmGvvqC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250407/202504071003.NtmGvvqC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504071003.NtmGvvqC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/soc-ops-test.c: In function 'soc_ops_test_access':
>> sound/soc/soc-ops-test.c:520:1: warning: the frame size of 1304 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     520 | }
         | ^


vim +520 sound/soc/soc-ops-test.c

   475	
   476	static void soc_ops_test_access(struct kunit *test)
   477	{
   478		struct soc_ops_test_priv *priv = test->priv;
   479		const struct access_test_param *param = test->param_value;
   480		struct snd_kcontrol kctl = {
   481			.private_data = &priv->component,
   482			.private_value = (unsigned long)&param->mc,
   483		};
   484		struct snd_ctl_elem_value result;
   485		unsigned int val;
   486		int ret;
   487	
   488		ret = regmap_write(priv->component.regmap, 0x0, param->init);
   489		KUNIT_ASSERT_FALSE(test, ret);
   490		ret = regmap_write(priv->component.regmap, 0x1, param->init);
   491		KUNIT_ASSERT_FALSE(test, ret);
   492	
   493		result.value.integer.value[0] = param->lctl;
   494		result.value.integer.value[1] = param->rctl;
   495	
   496		ret = param->put(&kctl, &result);
   497		KUNIT_ASSERT_EQ(test, ret, param->ret);
   498		if (ret < 0)
   499			return;
   500	
   501		ret = regmap_read(priv->component.regmap, 0x0, &val);
   502		KUNIT_ASSERT_FALSE(test, ret);
   503		KUNIT_EXPECT_EQ(test, val, (param->init & ~param->lmask) | param->lreg);
   504	
   505		ret = regmap_read(priv->component.regmap, 0x1, &val);
   506		KUNIT_ASSERT_FALSE(test, ret);
   507		KUNIT_EXPECT_EQ(test, val, (param->init & ~param->rmask) | param->rreg);
   508	
   509		result.value.integer.value[0] = 0;
   510		result.value.integer.value[1] = 0;
   511	
   512		ret = param->get(&kctl, &result);
   513		KUNIT_ASSERT_GE(test, ret, 0);
   514	
   515		KUNIT_EXPECT_EQ(test, result.value.integer.value[0], param->lctl);
   516		if (param->layout != SOC_OPS_TEST_SINGLE)
   517			KUNIT_EXPECT_EQ(test, result.value.integer.value[1], param->rctl);
   518		else
   519			KUNIT_EXPECT_EQ(test, result.value.integer.value[1], 0);
 > 520	}
   521	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
