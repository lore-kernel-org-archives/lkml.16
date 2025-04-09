Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95651D8A0A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 06:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178623; cv=none; b=auW+3cTNIbyHK+ZxWjVPH1KAdJ2x+8DAATNsfsLUywLYj+6PtF8fcVHNz5OnQTQm3B8fbMIenl+9WaOVqPd+5+2BajrhrkNjUPzrPvHcXmJgvsjLFDSR7TDWE9lDEVKtLa5TM9F3r6c/EPw7Zcbjzrxd8PnOzfNk12A1cohaMhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178623; c=relaxed/simple;
	bh=4xHqhPgdW8TYcTqscponCgob90BA2s/YzsyIWQJriDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cowtHcEDdt1iA71kQBxMEdMYcTtfLmWa2ulWQBwAnom8HwtxCJZ+0Ep8ypsi9LXE/9LteUmWrv/H12V79xk6x6/vUb5iQ7oqxNQN8bcpO6wgd4IsJmwfDvMYvvZ5G30n0PCBf1rw09pPCBiwPGQf9cSKGpODEnN68/XRiEgEOiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q4LsYP1J; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q4LsYP1J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744178622; x=1775714622;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4xHqhPgdW8TYcTqscponCgob90BA2s/YzsyIWQJriDY=;
  b=Q4LsYP1JHQamzXcqRNJ2rkwHcOcBarvq4w1tcgeMbS91pEFWr0h35Qxl
   4f0DxJ21ww/avsRwPWX84sfEMvVpV0H22vxIZYFow385KcYDrvXVsXCpX
   vMqrnULS2nW2XIka+hc16uF+HPc6krvcmsvZkvthiZoC6bKb+bju0rOaX
   KzRN0iTQuGn+CrQZ2IZr+GumJPqkcfgOxkPCOCE4l35yLVRM5oxhnriXq
   73Mxao5LmQj8LYQTXmLEhv5FiySbJkdDY/aKTrQdgCTIeAMoOtOJ2+rX6
   WH4NHyxMKl2L7XapWxCinYnBQv+FpjNu92RLCnNU9d7Wf0VXxshdOmwsb
   w==;
X-CSE-ConnectionGUID: BNJXzRs+QZiwxr+twJtYoQ==
X-CSE-MsgGUID: pGtqVG9SRSGsC21kagWurw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45756773"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="45756773"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 23:03:04 -0700
X-CSE-ConnectionGUID: 6NCazJJkS4CXXx6fTKPOhg==
X-CSE-MsgGUID: F1VGdALsRbGwrqJ8DRVZ1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="159463384"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Apr 2025 23:02:55 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2OWT-0008Md-0p;
	Wed, 09 Apr 2025 06:02:53 +0000
Date: Wed, 9 Apr 2025 14:01:54 +0800
From: kernel test robot <lkp@intel.com>
To: Wentao Liang <vulab@iscas.ac.cn>, harry.wentland@amd.com,
	sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
	alexander.deucher@amd.com, christian.koenig@amd.com,
	Xinhui.Pan@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	hamza.mahfooz@amd.com, chiahsuan.chung@amd.com,
	sunil.khatri@amd.com, alex.hung@amd.com, aurabindo.pillai@amd.com,
	hersenxs.wu@amd.com, mario.limonciello@amd.com, mwen@igalia.com,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, Wentao Liang <vulab@iscas.ac.cn>
Subject: Re: [PATCH v2] drm/amd/display: Add error check for avi and vendor
 infoframe setup function
Message-ID: <202504091350.V54m3vD1-lkp@intel.com>
References: <20250408022018.2786-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408022018.2786-1-vulab@iscas.ac.cn>

Hi Wentao,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-exynos/exynos-drm-next]
[also build test ERROR on linus/master v6.15-rc1 next-20250408]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wentao-Liang/drm-amd-display-Add-error-check-for-avi-and-vendor-infoframe-setup-function/20250408-102113
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250408022018.2786-1-vulab%40iscas.ac.cn
patch subject: [PATCH v2] drm/amd/display: Add error check for avi and vendor infoframe setup function
config: arm64-randconfig-003-20250409 (https://download.01.org/0day-ci/archive/20250409/202504091350.V54m3vD1-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250409/202504091350.V54m3vD1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504091350.V54m3vD1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6221:12: error: incompatible pointer types passing 'struct drm_device *const' to parameter of type 'const struct device *' [-Werror,-Wincompatible-pointer-types]
                           dev_err(connector->dev, "Failed to setup avi infoframe: %zd\n", err);
                                   ^~~~~~~~~~~~~~
   include/linux/dev_printk.h:154:44: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                     ^~~
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                           ^~~
   include/linux/dev_printk.h:86:36: note: passing argument to parameter 'dev' here
   void _dev_err(const struct device *dev, const char *fmt, ...)
                                      ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6227:12: error: incompatible pointer types passing 'struct drm_device *const' to parameter of type 'const struct device *' [-Werror,-Wincompatible-pointer-types]
                           dev_err(connector->dev, "Failed to setup vendor infoframe: %zd\n", err);
                                   ^~~~~~~~~~~~~~
   include/linux/dev_printk.h:154:44: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                     ^~~
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                           ^~~
   include/linux/dev_printk.h:86:36: note: passing argument to parameter 'dev' here
   void _dev_err(const struct device *dev, const char *fmt, ...)
                                      ^
   2 errors generated.


vim +6221 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

  6156	
  6157	static void fill_stream_properties_from_drm_display_mode(
  6158		struct dc_stream_state *stream,
  6159		const struct drm_display_mode *mode_in,
  6160		const struct drm_connector *connector,
  6161		const struct drm_connector_state *connector_state,
  6162		const struct dc_stream_state *old_stream,
  6163		int requested_bpc)
  6164	{
  6165		struct dc_crtc_timing *timing_out = &stream->timing;
  6166		const struct drm_display_info *info = &connector->display_info;
  6167		struct amdgpu_dm_connector *aconnector = NULL;
  6168		struct hdmi_vendor_infoframe hv_frame;
  6169		struct hdmi_avi_infoframe avi_frame;
  6170		ssize_t err;
  6171	
  6172		if (connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
  6173			aconnector = to_amdgpu_dm_connector(connector);
  6174	
  6175		memset(&hv_frame, 0, sizeof(hv_frame));
  6176		memset(&avi_frame, 0, sizeof(avi_frame));
  6177	
  6178		timing_out->h_border_left = 0;
  6179		timing_out->h_border_right = 0;
  6180		timing_out->v_border_top = 0;
  6181		timing_out->v_border_bottom = 0;
  6182		/* TODO: un-hardcode */
  6183		if (drm_mode_is_420_only(info, mode_in)
  6184				&& stream->signal == SIGNAL_TYPE_HDMI_TYPE_A)
  6185			timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR420;
  6186		else if (drm_mode_is_420_also(info, mode_in)
  6187				&& aconnector
  6188				&& aconnector->force_yuv420_output)
  6189			timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR420;
  6190		else if ((connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR444)
  6191				&& stream->signal == SIGNAL_TYPE_HDMI_TYPE_A)
  6192			timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR444;
  6193		else
  6194			timing_out->pixel_encoding = PIXEL_ENCODING_RGB;
  6195	
  6196		timing_out->timing_3d_format = TIMING_3D_FORMAT_NONE;
  6197		timing_out->display_color_depth = convert_color_depth_from_display_info(
  6198			connector,
  6199			(timing_out->pixel_encoding == PIXEL_ENCODING_YCBCR420),
  6200			requested_bpc);
  6201		timing_out->scan_type = SCANNING_TYPE_NODATA;
  6202		timing_out->hdmi_vic = 0;
  6203	
  6204		if (old_stream) {
  6205			timing_out->vic = old_stream->timing.vic;
  6206			timing_out->flags.HSYNC_POSITIVE_POLARITY = old_stream->timing.flags.HSYNC_POSITIVE_POLARITY;
  6207			timing_out->flags.VSYNC_POSITIVE_POLARITY = old_stream->timing.flags.VSYNC_POSITIVE_POLARITY;
  6208		} else {
  6209			timing_out->vic = drm_match_cea_mode(mode_in);
  6210			if (mode_in->flags & DRM_MODE_FLAG_PHSYNC)
  6211				timing_out->flags.HSYNC_POSITIVE_POLARITY = 1;
  6212			if (mode_in->flags & DRM_MODE_FLAG_PVSYNC)
  6213				timing_out->flags.VSYNC_POSITIVE_POLARITY = 1;
  6214		}
  6215	
  6216		if (stream->signal == SIGNAL_TYPE_HDMI_TYPE_A) {
  6217			err = drm_hdmi_avi_infoframe_from_display_mode(&avi_frame,
  6218								       (struct drm_connector *)connector,
  6219								       mode_in);
  6220			if (err < 0)
> 6221				dev_err(connector->dev, "Failed to setup avi infoframe: %zd\n", err);
  6222			timing_out->vic = avi_frame.video_code;
  6223			err = drm_hdmi_vendor_infoframe_from_display_mode(&hv_frame,
  6224									  (struct drm_connector *)connector,
  6225									  mode_in);
  6226			if (err < 0)
  6227				dev_err(connector->dev, "Failed to setup vendor infoframe: %zd\n", err);
  6228			timing_out->hdmi_vic = hv_frame.vic;
  6229		}
  6230	
  6231		if (aconnector && is_freesync_video_mode(mode_in, aconnector)) {
  6232			timing_out->h_addressable = mode_in->hdisplay;
  6233			timing_out->h_total = mode_in->htotal;
  6234			timing_out->h_sync_width = mode_in->hsync_end - mode_in->hsync_start;
  6235			timing_out->h_front_porch = mode_in->hsync_start - mode_in->hdisplay;
  6236			timing_out->v_total = mode_in->vtotal;
  6237			timing_out->v_addressable = mode_in->vdisplay;
  6238			timing_out->v_front_porch = mode_in->vsync_start - mode_in->vdisplay;
  6239			timing_out->v_sync_width = mode_in->vsync_end - mode_in->vsync_start;
  6240			timing_out->pix_clk_100hz = mode_in->clock * 10;
  6241		} else {
  6242			timing_out->h_addressable = mode_in->crtc_hdisplay;
  6243			timing_out->h_total = mode_in->crtc_htotal;
  6244			timing_out->h_sync_width = mode_in->crtc_hsync_end - mode_in->crtc_hsync_start;
  6245			timing_out->h_front_porch = mode_in->crtc_hsync_start - mode_in->crtc_hdisplay;
  6246			timing_out->v_total = mode_in->crtc_vtotal;
  6247			timing_out->v_addressable = mode_in->crtc_vdisplay;
  6248			timing_out->v_front_porch = mode_in->crtc_vsync_start - mode_in->crtc_vdisplay;
  6249			timing_out->v_sync_width = mode_in->crtc_vsync_end - mode_in->crtc_vsync_start;
  6250			timing_out->pix_clk_100hz = mode_in->crtc_clock * 10;
  6251		}
  6252	
  6253		timing_out->aspect_ratio = get_aspect_ratio(mode_in);
  6254	
  6255		stream->out_transfer_func.type = TF_TYPE_PREDEFINED;
  6256		stream->out_transfer_func.tf = TRANSFER_FUNCTION_SRGB;
  6257		if (stream->signal == SIGNAL_TYPE_HDMI_TYPE_A) {
  6258			if (!adjust_colour_depth_from_display_info(timing_out, info) &&
  6259			    drm_mode_is_420_also(info, mode_in) &&
  6260			    timing_out->pixel_encoding != PIXEL_ENCODING_YCBCR420) {
  6261				timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR420;
  6262				adjust_colour_depth_from_display_info(timing_out, info);
  6263			}
  6264		}
  6265	
  6266		stream->output_color_space = get_output_color_space(timing_out, connector_state);
  6267		stream->content_type = get_output_content_type(connector_state);
  6268	}
  6269	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
