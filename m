Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EE227F72E
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 16:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748364103; cv=none; b=BRV1bhS5CrCQdsYFMAHXJBAfHnbFbBf9Hnb+rVhvGP86/PGEtSqWjyx7kLJ9MuYJDniWTsYQWv958x16Pe0cbqvgZwb4oBgd//HLeX1tzlugmeA1eJISSBbcwKtPQihqwX4NIhpbaOsbQEZZJb6tXXWsmTlhRdI8UzekIcKf8o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748364103; c=relaxed/simple;
	bh=ukJPA0XtU32Ecq35Tu9JsOdKWxywwRz0NHZNFe5yJx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7KfmB82+BxSlv/uQWzjrBc5J7AzQ8BoYqHS61J8L4g05y6leHdfvMi7b9onzCLyhKs/J5b2hd5DpkcUGuT242knkHrYo+L+sw4Z3jZjxqoAe49t0MntFgWo5JtC7gFsFYm2Qh6KGhiWgd1PCbJL8bZH+UcTm1isHTf7wZuXDf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q6rQThh4; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q6rQThh4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748364101; x=1779900101;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ukJPA0XtU32Ecq35Tu9JsOdKWxywwRz0NHZNFe5yJx8=;
  b=Q6rQThh4OTQucjMNWd2vbqczk3g7pkL2vcM6ICF5hDFkhgxHHAzcbw+j
   wibxdHqbWcCMqUw9FERR4MSADPPZv6lU81I1jQl0rn/YdD9Ob65YjWW2n
   rIMomtzIZl3IrhUKp6MKomO9JVYn+w3QNA3OOke+v7inFCKS9SlvCyAqy
   0CJgg3nY8ha2pPGmXSDaU3TXFCEfF+AYfEkM8wmaHmLA3M/g/a3A9lJkJ
   JsyEucMRN+8dIL5HLzhthsEKcykE7+FyV2YOHGL9JyNOY6Nh+QH51aUuz
   1hxMYdn+02VW8NMk3QG20ihrYpRo7p+Zl0XmcWXt4qroTHKlI+X3DMr+p
   Q==;
X-CSE-ConnectionGUID: QKn9DPFUQ62y0AHswz6uGw==
X-CSE-MsgGUID: NklmeYv6TXux/vy8+w+BzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="75753537"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="75753537"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 09:41:40 -0700
X-CSE-ConnectionGUID: DUtYUoYfTRmWnZZqVBzNsA==
X-CSE-MsgGUID: J7RjXSH3Qi+n5+GKbPS0xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="148028416"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 May 2025 09:41:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJxMs-000TLs-2K;
	Tue, 27 May 2025 16:41:34 +0000
Date: Wed, 28 May 2025 00:41:25 +0800
From: kernel test robot <lkp@intel.com>
To: Chaoyi Chen <kernel@airkyi.com>, Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: Re: [PATCH v3] drm/rockchip: cdn-dp: Convert to drm bridge
Message-ID: <202505280026.8VDl0TWN-lkp@intel.com>
References: <20250527081447.304-1-kernel@airkyi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527081447.304-1-kernel@airkyi.com>

Hi Chaoyi,

kernel test robot noticed the following build errors:

[auto build test ERROR on rockchip/for-next]
[also build test ERROR on linus/master v6.15 next-20250527]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chaoyi-Chen/drm-rockchip-cdn-dp-Convert-to-drm-bridge/20250527-161941
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20250527081447.304-1-kernel%40airkyi.com
patch subject: [PATCH v3] drm/rockchip: cdn-dp: Convert to drm bridge
config: i386-buildonly-randconfig-002-20250527 (https://download.01.org/0day-ci/archive/20250528/202505280026.8VDl0TWN-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505280026.8VDl0TWN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280026.8VDl0TWN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/rockchip/cdn-dp-core.c:783:17: error: incompatible pointer types passing 'struct drm_device *' to parameter of type 'const struct device *' [-Werror,-Wincompatible-pointer-types]
     783 |                 DRM_DEV_ERROR(bridge->dev, "Invalid format %d\n", daifmt->fmt);
         |                               ^~~~~~~~~~~
   include/drm/drm_print.h:504:17: note: expanded from macro 'DRM_DEV_ERROR'
     504 |         drm_dev_printk(dev, KERN_ERR, "*ERROR* " fmt, ##__VA_ARGS__)
         |                        ^~~
   include/drm/drm_print.h:488:42: note: passing argument to parameter 'dev' here
     488 | void drm_dev_printk(const struct device *dev, const char *level,
         |                                          ^
>> drivers/gpu/drm/rockchip/cdn-dp-core.c:844:3: error: field designator 'dp_audio_prepare' does not refer to any field in type 'const struct drm_bridge_funcs'; did you mean 'hdmi_audio_prepare'?
     844 |         .dp_audio_prepare = cdn_dp_audio_prepare,
         |          ^~~~~~~~~~~~~~~~
         |          hdmi_audio_prepare
   include/drm/drm_bridge.h:702:8: note: 'hdmi_audio_prepare' declared here
     702 |         int (*hdmi_audio_prepare)(struct drm_connector *connector,
         |               ^
>> drivers/gpu/drm/rockchip/cdn-dp-core.c:845:3: error: field designator 'dp_audio_mute_stream' does not refer to any field in type 'const struct drm_bridge_funcs'; did you mean 'hdmi_audio_mute_stream'?
     845 |         .dp_audio_mute_stream = cdn_dp_audio_mute_stream,
         |          ^~~~~~~~~~~~~~~~~~~~
         |          hdmi_audio_mute_stream
   include/drm/drm_bridge.h:728:8: note: 'hdmi_audio_mute_stream' declared here
     728 |         int (*hdmi_audio_mute_stream)(struct drm_connector *connector,
         |               ^
>> drivers/gpu/drm/rockchip/cdn-dp-core.c:846:3: error: field designator 'dp_audio_shutdown' does not refer to any field in type 'const struct drm_bridge_funcs'; did you mean 'hdmi_audio_shutdown'?
     846 |         .dp_audio_shutdown = cdn_dp_audio_shutdown,
         |          ^~~~~~~~~~~~~~~~~
         |          hdmi_audio_shutdown
   include/drm/drm_bridge.h:716:9: note: 'hdmi_audio_shutdown' declared here
     716 |         void (*hdmi_audio_shutdown)(struct drm_connector *connector,
         |                ^
>> drivers/gpu/drm/rockchip/cdn-dp-core.c:1011:4: error: use of undeclared identifier 'DRM_BRIDGE_OP_DP_AUDIO'
    1011 |                         DRM_BRIDGE_OP_DP_AUDIO;
         |                         ^
>> drivers/gpu/drm/rockchip/cdn-dp-core.c:1046:9: error: use of undeclared label 'err_free_connector'
    1046 |                         goto err_free_connector;
         |                              ^
   drivers/gpu/drm/rockchip/cdn-dp-core.c:1114:7: error: call to undeclared function 'devm_drm_bridge_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1114 |         dp = devm_drm_bridge_alloc(dev, struct cdn_dp_device, bridge,
         |              ^
   drivers/gpu/drm/rockchip/cdn-dp-core.c:1114:7: note: did you mean 'devm_drm_bridge_add'?
   include/drm/drm_bridge.h:945:5: note: 'devm_drm_bridge_add' declared here
     945 | int devm_drm_bridge_add(struct device *dev, struct drm_bridge *bridge);
         |     ^
   drivers/gpu/drm/rockchip/cdn-dp-core.c:1114:34: error: expected expression
    1114 |         dp = devm_drm_bridge_alloc(dev, struct cdn_dp_device, bridge,
         |                                         ^
   drivers/gpu/drm/rockchip/cdn-dp-core.c:1114:56: error: use of undeclared identifier 'bridge'
    1114 |         dp = devm_drm_bridge_alloc(dev, struct cdn_dp_device, bridge,
         |                                                               ^
   9 errors generated.


vim +783 drivers/gpu/drm/rockchip/cdn-dp-core.c

   755	
   756	static int cdn_dp_audio_prepare(struct drm_connector *connector,
   757					struct drm_bridge *bridge,
   758					struct hdmi_codec_daifmt *daifmt,
   759					struct hdmi_codec_params *params)
   760	{
   761		struct cdn_dp_device *dp = bridge_to_dp(bridge);
   762		struct audio_info audio = {
   763			.sample_width = params->sample_width,
   764			.sample_rate = params->sample_rate,
   765			.channels = params->channels,
   766		};
   767		int ret;
   768	
   769		mutex_lock(&dp->lock);
   770		if (!dp->active) {
   771			ret = -ENODEV;
   772			goto out;
   773		}
   774	
   775		switch (daifmt->fmt) {
   776		case HDMI_I2S:
   777			audio.format = AFMT_I2S;
   778			break;
   779		case HDMI_SPDIF:
   780			audio.format = AFMT_SPDIF;
   781			break;
   782		default:
 > 783			DRM_DEV_ERROR(bridge->dev, "Invalid format %d\n", daifmt->fmt);
   784			ret = -EINVAL;
   785			goto out;
   786		}
   787	
   788		ret = cdn_dp_audio_config(dp, &audio);
   789		if (!ret)
   790			dp->audio_info = audio;
   791	
   792	out:
   793		mutex_unlock(&dp->lock);
   794		return ret;
   795	}
   796	
   797	static void cdn_dp_audio_shutdown(struct drm_connector *connector,
   798					  struct drm_bridge *bridge)
   799	{
   800		struct cdn_dp_device *dp = bridge_to_dp(bridge);
   801		int ret;
   802	
   803		mutex_lock(&dp->lock);
   804		if (!dp->active)
   805			goto out;
   806	
   807		ret = cdn_dp_audio_stop(dp, &dp->audio_info);
   808		if (!ret)
   809			dp->audio_info.format = AFMT_UNUSED;
   810	out:
   811		mutex_unlock(&dp->lock);
   812	}
   813	
   814	static int cdn_dp_audio_mute_stream(struct drm_connector *connector,
   815					    struct drm_bridge *bridge,
   816					    bool enable, int direction)
   817	{
   818		struct cdn_dp_device *dp = bridge_to_dp(bridge);
   819		int ret;
   820	
   821		mutex_lock(&dp->lock);
   822		if (!dp->active) {
   823			ret = -ENODEV;
   824			goto out;
   825		}
   826	
   827		ret = cdn_dp_audio_mute(dp, enable);
   828	
   829	out:
   830		mutex_unlock(&dp->lock);
   831		return ret;
   832	}
   833	
   834	static const struct drm_bridge_funcs cdn_dp_bridge_funcs = {
   835		.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
   836		.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
   837		.atomic_reset = drm_atomic_helper_bridge_reset,
   838		.detect = cdn_dp_bridge_detect,
   839		.edid_read = cdn_dp_bridge_edid_read,
   840		.atomic_enable = cdn_dp_bridge_atomic_enable,
   841		.atomic_disable = cdn_dp_bridge_atomic_disable,
   842		.mode_valid = cdn_dp_bridge_mode_valid,
   843	
 > 844		.dp_audio_prepare = cdn_dp_audio_prepare,
 > 845		.dp_audio_mute_stream = cdn_dp_audio_mute_stream,
 > 846		.dp_audio_shutdown = cdn_dp_audio_shutdown,
   847	};
   848	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
