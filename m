Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07FE79C2
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 13:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745674389; cv=none; b=dUiGKmbfatPpOKp1WjyvOYT4RwfKB2mbL0aJUaGphCCCTZ/+UFvP0//DKYSpGEY6b0oLqRsYZSpaP42Vaf2lZ1oEfDzFREde6JoKBQdfvEksdiYHZZvCKZ7m5/h2SIwBNRUvLOO8U2XrGYIreSXC/eBIs+HAl46v7nW21Dp6+jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745674389; c=relaxed/simple;
	bh=0qGhH3+U1SPTs017FsmMyMhnlJ+pkiy8FKu/cYJDvks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qMphAVV/vS25EZHrsIPQ+JK98xh2ZKn4a2Pc74tGXFr7BNkp7Vo2Vl/w4R6jU37boIA7JoFAir7cSxG2sRchxSEBTBdP/ErvkiwxTMeMcxLYHg+mUfBmpSYhz5zUaAA8lJ5kE5at8qkEk01tedIV2Wa8aBSgpPcFgVcaucyKANQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j+scJeLg; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j+scJeLg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745674388; x=1777210388;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0qGhH3+U1SPTs017FsmMyMhnlJ+pkiy8FKu/cYJDvks=;
  b=j+scJeLg3fc0fzWsPrOmJPA7dV4KlGekBWt2tpiwVj1j7Hn4i4i3k8Pk
   otqLRrgeYeRJ/D6jKdW5l0jRaDKwvxoyjkJORaPsTXJdWp+Yc6bS6Tn49
   dOw3JCZIKiF6duM4a+VLK/7IH1/gWRIDlkP2SnSghYs5IVk51IiXNKHZ0
   czJLMmB4IiIBwjZpN9s10wbmV+vpvenSuMR5QS2Ga6gL+7iAVeeEiZfiX
   U4I0mPVUm7uXCWId7w3VU8pUI6rfTw9T9v602dX6yFCJmrt7+xuBxYgVj
   iZO8ckIVrXxiyu6pKcQoPIVPnV6aXZO65lKKfSpxTn3nzSGY/y5aGPnKw
   w==;
X-CSE-ConnectionGUID: pf/LIMWMSamfIxXsyy9ekQ==
X-CSE-MsgGUID: iWk/zHa4R+WPcohCkTPP3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="47481544"
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="47481544"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 06:33:07 -0700
X-CSE-ConnectionGUID: KUSVCJB3SRi3R1kehzEFJg==
X-CSE-MsgGUID: bDjypwCPQeygCEYnaFa55A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="133038441"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 26 Apr 2025 06:33:06 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8feR-0005px-1V;
	Sat, 26 Apr 2025 13:33:03 +0000
Date: Sat, 26 Apr 2025 21:32:51 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: sound/soc/qcom/sdw.c:93: warning: cannot understand function
 prototype: 'ret = sdw_enable_stream(sruntime); '
Message-ID: <202504262154.sBmNTrcB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   02ddfb981de88a2c15621115dd7be2431252c568
commit: db7e59e6a39a4d3d54ca8197c796557e6d480b0d ASoC: qcom: sc7280: Fix missing Soundwire runtime stream alloc
date:   6 months ago
config: sh-randconfig-002-20250426 (https://download.01.org/0day-ci/archive/20250426/202504262154.sBmNTrcB-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250426/202504262154.sBmNTrcB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504262154.sBmNTrcB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/qcom/sdw.c:93: warning: cannot understand function prototype: 'ret = sdw_enable_stream(sruntime); '

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +93 sound/soc/qcom/sdw.c

d32bac9cb09cce Krzysztof Kozlowski 2023-11-28   52  
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   53  int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   54  			 struct sdw_stream_runtime *sruntime,
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   55  			 bool *stream_prepared)
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   56  {
77678a25d1ecf7 Krzysztof Kozlowski 2024-04-30   57  	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
9b1a2dfa8a00ff Kuninori Morimoto   2023-09-11   58  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   59  	int ret;
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   60  
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   61  	if (!sruntime)
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   62  		return 0;
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   63  
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   64  	switch (cpu_dai->id) {
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   65  	case WSA_CODEC_DMA_RX_0:
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   66  	case WSA_CODEC_DMA_RX_1:
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   67  	case RX_CODEC_DMA_RX_0:
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   68  	case RX_CODEC_DMA_RX_1:
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   69  	case TX_CODEC_DMA_TX_0:
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   70  	case TX_CODEC_DMA_TX_1:
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   71  	case TX_CODEC_DMA_TX_2:
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   72  	case TX_CODEC_DMA_TX_3:
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   73  		break;
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   74  	default:
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   75  		return 0;
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   76  	}
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   77  
e2e53088635924 Srinivas Kandagatla 2023-03-23   78  	if (*stream_prepared)
e2e53088635924 Srinivas Kandagatla 2023-03-23   79  		return 0;
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   80  
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   81  	ret = sdw_prepare_stream(sruntime);
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   82  	if (ret)
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   83  		return ret;
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   84  
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   85  	/**
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   86  	 * NOTE: there is a strict hw requirement about the ordering of port
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   87  	 * enables and actual WSA881x PA enable. PA enable should only happen
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   88  	 * after soundwire ports are enabled if not DC on the line is
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   89  	 * accumulated resulting in Click/Pop Noise
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   90  	 * PA enable/mute are handled as part of codec DAPM and digital mute.
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   91  	 */
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   92  
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31  @93  	ret = sdw_enable_stream(sruntime);
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   94  	if (ret) {
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   95  		sdw_deprepare_stream(sruntime);
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   96  		return ret;
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   97  	}
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   98  	*stream_prepared  = true;
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31   99  
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31  100  	return ret;
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31  101  }
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31  102  EXPORT_SYMBOL_GPL(qcom_snd_sdw_prepare);
0cbf1ecd8c4801 Stephan Gerhold     2022-12-31  103  

:::::: The code at line 93 was first introduced by commit
:::::: 0cbf1ecd8c4801ec7566231491f7ad9cec31098b ASoC: qcom: Fix building APQ8016 machine driver without SOUNDWIRE

:::::: TO: Stephan Gerhold <stephan@gerhold.net>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
