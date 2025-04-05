Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFACEED8;
	Sat,  5 Apr 2025 14:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743862952; cv=none; b=TgkJCv9PvIERK0YZFRSVEJXf07RMpDsMxcLFRs8ATreDi0e+ggRJTpA/wURjNp7XRRWAfF+zN4xweXv3eCfvC8zGtlLC907LxldjcgifX8+GJMO4fwS0rrVVA2HQVeSwirvkIPRj7+uIh3pN9D26Kbax52wrM9qvpL6+xH/dguI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743862952; c=relaxed/simple;
	bh=4TlZYBczBvOtge2KRLN9HBOYe1GtJnM1LarhN79o9NI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a4wwIAqI2JRxF6RF6y8SGU3JR98UZ4J/DiXHyTmUooG6sAtJA4AvlU9CMz9fKxIiRHjjZWZyZSORb4Bm/ZWDVhvTHEuINvuuA1GVRMMdU1XM/sdOlGgb82gqrjoAH9yQ81pK8r2JDNjIPJ1QE3HSQX7GZMNSMAaasYFpx6ZQR4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CaniO4sJ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CaniO4sJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743862951; x=1775398951;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4TlZYBczBvOtge2KRLN9HBOYe1GtJnM1LarhN79o9NI=;
  b=CaniO4sJ9ogqQfQgofKFJl29SnTIj9EwY2bsZkui7Ipg/41K/sh0wyVl
   BYG0e3e5TZoQy5oh+7LXwtlmXzGhHYNW0cxU66H///SbakZdQZXNlL/NQ
   jN2VswzgQNj7kqizQJUPF16VXAMbS7J58hqHAwUnxcPctMypzJrCm03AU
   WusklESXzm2RWo6IArbw2I/fVM90gnKnDXYLkSdkuQXqrltdN3yj8GOmC
   vhY8AJeQicoFW1mXEGW8gvIBL9+xCJwDq+MiQVEJpfl3GcffdbPZAHS7f
   8zKVk3OPwpB9xDZJu6xQAGFFP/f5vjGb0zkMnhvY9LUo7EK60mGmwkPQd
   A==;
X-CSE-ConnectionGUID: p6cFW4s1R22aw9fz05nB3A==
X-CSE-MsgGUID: m8/wSJfFQZ+s8/5PQhx5ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="62693245"
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="62693245"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 07:22:30 -0700
X-CSE-ConnectionGUID: 2kRR535sQ+2ZOiH1PAhaow==
X-CSE-MsgGUID: YNTyaPyDTs2VGc+DlORbOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="127428025"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Apr 2025 07:22:27 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u14Pg-000255-1f;
	Sat, 05 Apr 2025 14:22:24 +0000
Date: Sat, 5 Apr 2025 22:21:51 +0800
From: kernel test robot <lkp@intel.com>
To: cy_huang@richtek.com, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Rob Herring <robh@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Otto lin <otto_lin@richtek.com>, Allen Lin <allen_lin@richtek.com>,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ASoC: codecs: Add support for Richtek rt9123
Message-ID: <202504052206.HFqFRXUk-lkp@intel.com>
References: <cff65757c4665a81397ef5f559b277f96d4236c3.1743774849.git.cy_huang@richtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cff65757c4665a81397ef5f559b277f96d4236c3.1743774849.git.cy_huang@richtek.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on a2cc6ff5ec8f91bc463fd3b0c26b61166a07eb11]

url:    https://github.com/intel-lab-lkp/linux/commits/cy_huang-richtek-com/ASoC-dt-bindings-Add-bindings-for-Richtek-rt9123/20250404-223054
base:   a2cc6ff5ec8f91bc463fd3b0c26b61166a07eb11
patch link:    https://lore.kernel.org/r/cff65757c4665a81397ef5f559b277f96d4236c3.1743774849.git.cy_huang%40richtek.com
patch subject: [PATCH 2/4] ASoC: codecs: Add support for Richtek rt9123
config: loongarch-randconfig-001-20250405 (https://download.01.org/0day-ci/archive/20250405/202504052206.HFqFRXUk-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504052206.HFqFRXUk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504052206.HFqFRXUk-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/codecs/rt9123.c: In function 'rt9123_dai_hw_params':
>> sound/soc/codecs/rt9123.c:233:18: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     233 |         fmtval = FIELD_GET(SND_SOC_DAIFMT_FORMAT_MASK, rt9123->dai_fmt);
         |                  ^~~~~~~~~
   In file included from include/linux/cpumask.h:11,
                    from arch/loongarch/include/asm/processor.h:9,
                    from arch/loongarch/include/asm/thread_info.h:15,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/loongarch/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from sound/soc/codecs/rt9123.c:7:
   sound/soc/codecs/rt9123.c: At top level:
>> sound/soc/codecs/rt9123.c:476:31: error: 'rt9123_dev_pm_ops' undeclared here (not in a function); did you mean 'rt9123_dai_ops'?
     476 |                 .pm = pm_ptr(&rt9123_dev_pm_ops),
         |                               ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:48:44: note: in definition of macro 'PTR_IF'
      48 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                            ^~~
   sound/soc/codecs/rt9123.c:476:23: note: in expansion of macro 'pm_ptr'
     476 |                 .pm = pm_ptr(&rt9123_dev_pm_ops),
         |                       ^~~~~~


vim +/FIELD_GET +233 sound/soc/codecs/rt9123.c

   223	
   224	static int rt9123_dai_hw_params(struct snd_pcm_substream *substream,
   225					struct snd_pcm_hw_params *param, struct snd_soc_dai *dai)
   226	{
   227		struct rt9123_priv *rt9123 = snd_soc_dai_get_drvdata(dai);
   228		struct snd_soc_component *comp = dai->component;
   229		unsigned int fmtval, width, slot_width;
   230		struct device *dev = dai->dev;
   231		unsigned int audfmt, audbit;
   232	
 > 233		fmtval = FIELD_GET(SND_SOC_DAIFMT_FORMAT_MASK, rt9123->dai_fmt);
   234		if (rt9123->tdm_slots && fmtval != SND_SOC_DAIFMT_DSP_A && fmtval != SND_SOC_DAIFMT_DSP_B) {
   235			dev_err(dev, "TDM only can support DSP_A or DSP_B format\n");
   236			return -EINVAL;
   237		}
   238	
   239		switch (fmtval) {
   240		case SND_SOC_DAIFMT_I2S:
   241			audfmt = 0;
   242			break;
   243		case SND_SOC_DAIFMT_LEFT_J:
   244			audfmt = 1;
   245			break;
   246		case SND_SOC_DAIFMT_RIGHT_J:
   247			audfmt = 2;
   248			break;
   249		case SND_SOC_DAIFMT_DSP_B:
   250			audfmt = rt9123->tdm_slots ? 4 : 3;
   251			break;
   252		case SND_SOC_DAIFMT_DSP_A:
   253			audfmt = rt9123->tdm_slots ? 12 : 11;
   254			break;
   255		default:
   256			dev_err(dev, "Unsupported format %d\n", fmtval);
   257			return -EINVAL;
   258		}
   259	
   260		switch (width = params_width(param)) {
   261		case 16:
   262			audbit = 0;
   263			break;
   264		case 20:
   265			audbit = 1;
   266			break;
   267		case 24:
   268			audbit = 2;
   269			break;
   270		case 32:
   271			audbit = 3;
   272			break;
   273		case 8:
   274			audbit = 4;
   275			break;
   276		default:
   277			dev_err(dev, "Unsupported width %d\n", width);
   278			return -EINVAL;
   279		}
   280	
   281		slot_width = params_physical_width(param);
   282		if (rt9123->tdm_slots && slot_width > rt9123->tdm_slot_width) {
   283			dev_err(dev, "Slot width is larger than TDM slot width\n");
   284			return -EINVAL;
   285		}
   286	
   287		snd_soc_component_write_field(comp, RT9123_REG_I2SOPT, RT9123_MASK_AUDFMT, audfmt);
   288		snd_soc_component_write_field(comp, RT9123_REG_I2SOPT, RT9123_MASK_AUDBIT, audbit);
   289	
   290		return 0;
   291	}
   292	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
