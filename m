Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9228427A113
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 12:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746621056; cv=none; b=Znzw/4kMjb9q5iJfCQAiH42fBk0onpvqY6mCfme8PD1Y5vYXsfv0OgqGPlmIVGI5+F/BB7cRyFmBXhcZuX47Ur814gwK4uCbWYQ/YDzoj+fjjp2AJvozmSbL1MnzRjM24lrJyjCCs3LqcXVHAOkt/hhG6q1aLtPjaN0kl0Ogpls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746621056; c=relaxed/simple;
	bh=mWlndLyalZYUD1rA6pPQ3NKdXvmubakqHNhUnfLWQDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qspFFSPyXqOeMbjOnt64yBH8LXD/j8xjWvO0G4ilL/RBlB13lAU3eXZXKZfPS11qOoehN+L+svYBBBYNeKVZHW1cnf1YWrLdvPlqHWdy3T5+AQ1H/jjYRmduvmSp1wL6M5/3C3NK1k4NyqqA0WX/MTnPPnrnlG1/WIAbxLK/hUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B1ke6CXT; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B1ke6CXT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746621054; x=1778157054;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mWlndLyalZYUD1rA6pPQ3NKdXvmubakqHNhUnfLWQDM=;
  b=B1ke6CXTUTymKIm1aN8Sz3JVsUSpecFq1S3Kh3x9aJRhkIUXmHaEFMC9
   3tVdrPmRunZIhwQ2UUyLwZVE2k/GgQgwxqTRl++ljkqtYJytEynQAya4A
   DqA2Uwg5AfdmEjbeVITyNGfUGL2Y077xZNhGcf9Kz0XD8En6UlWGO1Hj1
   I85s+GcjEc+XifebhUUMKiA9V1kpuqskUtEZFiS9Gw2J2eJux3bVvbSJo
   Z0U7lb7Ifu6kKIb+WtOIKy9x2e/lZPSxsPaFIJ6zbtyROw/W88bkHpSm6
   bqbsEkMQV7dxZ4fS0EAgkN7vQIWXGD4gSvlsbkemlecvzD0REk+0QRb9d
   w==;
X-CSE-ConnectionGUID: fHUB9hXbT0u+NoxqvBIvzw==
X-CSE-MsgGUID: Nm5VLdgjRgS6leYkek8h/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48362534"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48362534"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 05:30:53 -0700
X-CSE-ConnectionGUID: eNeijQCxQUiEpDzDZT5kjg==
X-CSE-MsgGUID: E5LZ4jChTrO3fnbLXvhCAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="159241073"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 May 2025 05:30:50 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCdvD-0007mY-1m;
	Wed, 07 May 2025 12:30:47 +0000
Date: Wed, 7 May 2025 20:30:47 +0800
From: kernel test robot <lkp@intel.com>
To: chenchangcheng <ccc194101@163.com>, laurent.pinchart@ideasonboard.com,
	ribalda@chromium.org
Cc: oe-kbuild-all@lists.linux.dev, hdegoede@redhat.com, mchehab@kernel.org,
	linux-kernel@vger.kernel.org,
	chenchangcheng <chenchangcheng@kylinos.cn>
Subject: Re: [PATCH v7] media: uvcvideo: Fix bandwidth issue
Message-ID: <202505072016.LlOxF8BG-lkp@intel.com>
References: <20250416031838.254061-1-ccc194101@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416031838.254061-1-ccc194101@163.com>

Hi chenchangcheng,

kernel test robot noticed the following build errors:

[auto build test ERROR on 8ffd015db85fea3e15a77027fda6c02ced4d2444]

url:    https://github.com/intel-lab-lkp/linux/commits/chenchangcheng/media-uvcvideo-Fix-bandwidth-issue/20250416-140638
base:   8ffd015db85fea3e15a77027fda6c02ced4d2444
patch link:    https://lore.kernel.org/r/20250416031838.254061-1-ccc194101%40163.com
patch subject: [PATCH v7] media: uvcvideo: Fix bandwidth issue
config: i386-randconfig-012-20250424 (https://download.01.org/0day-ci/archive/20250507/202505072016.LlOxF8BG-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505072016.LlOxF8BG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505072016.LlOxF8BG-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/usb/uvc/uvc_video.c: In function 'uvc_fixup_video_ctrl':
>> drivers/media/usb/uvc/uvc_video.c:268:17: error: implicit declaration of function 'dev_warn_ratelimit'; did you mean 'dev_warn_ratelimited'? [-Werror=implicit-function-declaration]
     268 |                 dev_warn_ratelimit(&stream->intf->dev,
         |                 ^~~~~~~~~~~~~~~~~~
         |                 dev_warn_ratelimited
   cc1: some warnings being treated as errors


vim +268 drivers/media/usb/uvc/uvc_video.c

   162	
   163	static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
   164		struct uvc_streaming_control *ctrl)
   165	{
   166		const struct uvc_format *format = NULL;
   167		const struct uvc_frame *frame = NULL;
   168		unsigned int i;
   169	
   170		/*
   171		 * The response of the Elgato Cam Link 4K is incorrect: The second byte
   172		 * contains bFormatIndex (instead of being the second byte of bmHint).
   173		 * The first byte is always zero. The third byte is always 1.
   174		 *
   175		 * The UVC 1.5 class specification defines the first five bits in the
   176		 * bmHint bitfield. The remaining bits are reserved and should be zero.
   177		 * Therefore a valid bmHint will be less than 32.
   178		 *
   179		 * Latest Elgato Cam Link 4K firmware as of 2021-03-23 needs this fix.
   180		 * MCU: 20.02.19, FPGA: 67
   181		 */
   182		if (usb_match_one_id(stream->dev->intf, &elgato_cam_link_4k) &&
   183		    ctrl->bmHint > 255) {
   184			u8 corrected_format_index = ctrl->bmHint >> 8;
   185	
   186			uvc_dbg(stream->dev, VIDEO,
   187				"Correct USB video probe response from {bmHint: 0x%04x, bFormatIndex: %u} to {bmHint: 0x%04x, bFormatIndex: %u}\n",
   188				ctrl->bmHint, ctrl->bFormatIndex,
   189				1, corrected_format_index);
   190			ctrl->bmHint = 1;
   191			ctrl->bFormatIndex = corrected_format_index;
   192		}
   193	
   194		for (i = 0; i < stream->nformats; ++i) {
   195			if (stream->formats[i].index == ctrl->bFormatIndex) {
   196				format = &stream->formats[i];
   197				break;
   198			}
   199		}
   200	
   201		if (format == NULL)
   202			return;
   203	
   204		for (i = 0; i < format->nframes; ++i) {
   205			if (format->frames[i].bFrameIndex == ctrl->bFrameIndex) {
   206				frame = &format->frames[i];
   207				break;
   208			}
   209		}
   210	
   211		if (frame == NULL)
   212			return;
   213	
   214		if (!(format->flags & UVC_FMT_FLAG_COMPRESSED) ||
   215		     (ctrl->dwMaxVideoFrameSize == 0 &&
   216		      stream->dev->uvc_version < 0x0110))
   217			ctrl->dwMaxVideoFrameSize =
   218				frame->dwMaxVideoFrameBufferSize;
   219	
   220		/*
   221		 * The "TOSHIBA Web Camera - 5M" Chicony device (04f2:b50b) seems to
   222		 * compute the bandwidth on 16 bits and erroneously sign-extend it to
   223		 * 32 bits, resulting in a huge bandwidth value. Detect and fix that
   224		 * condition by setting the 16 MSBs to 0 when they're all equal to 1.
   225		 */
   226		if ((ctrl->dwMaxPayloadTransferSize & 0xffff0000) == 0xffff0000)
   227			ctrl->dwMaxPayloadTransferSize &= ~0xffff0000;
   228	
   229		if (!(format->flags & UVC_FMT_FLAG_COMPRESSED) &&
   230		    stream->dev->quirks & UVC_QUIRK_FIX_BANDWIDTH &&
   231		    stream->intf->num_altsetting > 1) {
   232			u32 interval;
   233			u32 bandwidth;
   234	
   235			interval = (ctrl->dwFrameInterval > 100000)
   236				 ? ctrl->dwFrameInterval
   237				 : frame->dwFrameInterval[0];
   238	
   239			/*
   240			 * Compute a bandwidth estimation by multiplying the frame
   241			 * size by the number of video frames per second, divide the
   242			 * result by the number of USB frames (or micro-frames for
   243			 * high- and super-speed devices) per second and add the UVC
   244			 * header size (assumed to be 12 bytes long).
   245			 */
   246			bandwidth = frame->wWidth * frame->wHeight / 8 * format->bpp;
   247			bandwidth *= 10000000 / interval + 1;
   248			bandwidth /= 1000;
   249			if (stream->dev->udev->speed >= USB_SPEED_HIGH)
   250				bandwidth /= 8;
   251			bandwidth += 12;
   252	
   253			/*
   254			 * The bandwidth estimate is too low for many cameras. Don't use
   255			 * maximum packet sizes lower than 1024 bytes to try and work
   256			 * around the problem. According to measurements done on two
   257			 * different camera models, the value is high enough to get most
   258			 * resolutions working while not preventing two simultaneous
   259			 * VGA streams at 15 fps.
   260			 */
   261			bandwidth = max_t(u32, bandwidth, 1024);
   262	
   263			ctrl->dwMaxPayloadTransferSize = bandwidth;
   264		}
   265	
   266		if (stream->intf->num_altsetting > 1 &&
   267		    ctrl->dwMaxPayloadTransferSize > stream->maxpsize) {
 > 268			dev_warn_ratelimit(&stream->intf->dev,
   269					   "the max payload transmission size (%d) exceededs the size of the ep max packet (%d). Using the max size.\n",
   270					   ctrl->dwMaxPayloadTransferSize,
   271					   stream->maxpsize);
   272			ctrl->dwMaxPayloadTransferSize = stream->maxpsize;
   273		}
   274	}
   275	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
