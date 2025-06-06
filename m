Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161E81EE033;
	Fri,  6 Jun 2025 20:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749241768; cv=none; b=KBYH9zxACC9WIqFq417Tv9cBtOnEbxbRsoKPso82rGgpePh9xb3a+neqJQQt439/GvBS0AGMM6057Ye6imAXRXCvKNkNYbxjykTk/bhdzAmp2LgcEhWwPCLKwKi2gBc8OSDSMa7k4Vbd6kErw6FLgt8jroHTXqGXZJlytCHmZ50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749241768; c=relaxed/simple;
	bh=XE8OBWuC9+U991iDiZIJKTb6Sh+vpFUYsmJELuaWVeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BSA04iuYANyC9HxTOx62P6Ki3I9tvJovo9sait1aZq811eT+nfGNeVyqEXnbqaWSDDtjrM5E2IP/tm7UA2V3W36xm56A1mVosBO7teFs5AHrSLNXcxGD3YBmfHNvfz8+EnoOL1Wm9rHYSW1x8o/s+RZSrWA1UYC6I9KQ5yY1Nk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EvwcQn5I; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EvwcQn5I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749241767; x=1780777767;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XE8OBWuC9+U991iDiZIJKTb6Sh+vpFUYsmJELuaWVeI=;
  b=EvwcQn5Ivl7QD3OlwVjzIR/hXUEvzijyLW8ETWgmRsNi87qk3WwLwS6K
   AlIUjqg0QXo1ZKRmX4ycGvnrrtnQcifXpi43U6lIE8V/xYZKlFMDjk41J
   hHby+LfbgVf+5cPG6pl1NCUyLGCDu80SptVpY96w/Fj5Kzi/rrokipu5a
   52TeCppz8E2q/bNr1qLUHQsC8OGXN7bvBrPiYklIqXHo/VZDMUiuZ1B8o
   ZoUSRlSQkN6PaT0VQstLzexib2gOZ2TmQ1SzYR+OaKt2y0WY5YlWJJmx8
   8ON9dRagg2FYiv5o8ochJeWianC5B0IZg3Ixe/lul8MAI5MoRdlf1F2Ls
   A==;
X-CSE-ConnectionGUID: aQtAo0kcQnayHLCDW+xOjQ==
X-CSE-MsgGUID: pJRE5U4QQP+odBHRGO3Wqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="62059335"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="62059335"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 13:29:26 -0700
X-CSE-ConnectionGUID: MlPlovSpR4CrjKcFPkerWA==
X-CSE-MsgGUID: nKyfc+FEQTuVjuW0oKJFtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="145847260"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Jun 2025 13:29:25 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNdgo-0005Fx-2F;
	Fri, 06 Jun 2025 20:29:22 +0000
Date: Sat, 7 Jun 2025 04:28:23 +0800
From: kernel test robot <lkp@intel.com>
To: "feng.liu" <feng.liu@senarytech.com>, perex@perex.cz, tiwai@susu.com
Cc: oe-kbuild-all@lists.linux.dev, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, "feng.liu" <feng.liu@senarytech.com>
Subject: Re: [PATCH] Correct boost volume
Message-ID: <202506070421.thMBn9rY-lkp@intel.com>
References: <20250606113349.129746-1-feng.liu@senarytech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606113349.129746-1-feng.liu@senarytech.com>

Hi feng.liu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus linus/master v6.15 next-20250606]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/feng-liu/Correct-boost-volume/20250606-201348
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20250606113349.129746-1-feng.liu%40senarytech.com
patch subject: [PATCH] Correct boost volume
config: i386-buildonly-randconfig-002-20250607 (https://download.01.org/0day-ci/archive/20250607/202506070421.thMBn9rY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250607/202506070421.thMBn9rY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506070421.thMBn9rY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/pci/hda/patch_conexant.c: In function 'cxt_get_defaut_capture_gain_boost':
>> sound/pci/hda/patch_conexant.c:1223:1: warning: no return statement in function returning non-void [-Wreturn-type]
    1223 | }
         | ^


vim +1223 sound/pci/hda/patch_conexant.c

  1204	
  1205	static int cxt_get_defaut_capture_gain_boost(struct hda_codec *codec)
  1206	{
  1207		struct conexant_spec *spec = codec->spec;
  1208		int i;
  1209		unsigned int boost;
  1210	
  1211		for (i = 0; i < HDA_MAX_NUM_INPUTS; i++) {
  1212			if (spec->gen.imux_pins[i] == 0)
  1213				continue;
  1214	
  1215			boost = snd_hda_codec_read(codec, spec->gen.imux_pins[i],
  1216				0, AC_VERB_GET_AMP_GAIN_MUTE, 0);
  1217			spec->init_imux_boost_val[spec->gen.imux_pins[i]] = boost;
  1218			codec_info(codec, "%s, node_id = %x, mic_boost =%x", __func__,
  1219				spec->gen.imux_pins[i], boost);
  1220		}
  1221	
  1222		spec->gen.cap_sync_hook = cxt_cap_sync_hook;
> 1223	}
  1224	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
