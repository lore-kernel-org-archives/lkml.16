Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4F723956E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 11:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751454116; cv=none; b=p2KkAdTTuY9ye8EO2pHelJkeLwWwkwQP6Pd08UD1EU+o7mBmE3tHrYUvZSp9JsD7vFrTc/pAYRMQJ1IM2Fz6lxbhGPMhISFy3gzLEebAOA4h7o9q4gLQvLzYcd9eZEyhqRoBVs4f8qiOr8MmUuusaG7BQVimxeGcO92UpJoFs7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751454116; c=relaxed/simple;
	bh=FeFsPc7VT3Q/RnvMHtDp40L6Fsjz/dUSoNLGFGp/mtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ua3DDDRf9JvRrx/QSQCUybLUtqlw44v/ZtnTpVukZnicTN9gVk0o2kHXGfSqFKDzefBuqY805n80P64bPFhrIBbvko6SrTbtGLM3/abT9naaxRUUEfQhHgncZ3spplZIF8RhFgF7K/hoqXOWtCEX41+7uPXSMq2384nq0VKStSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NoG7wmrA; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NoG7wmrA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751454114; x=1782990114;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FeFsPc7VT3Q/RnvMHtDp40L6Fsjz/dUSoNLGFGp/mtI=;
  b=NoG7wmrAOyXCbD4GfFh5UA4G8+JafdARP1eLEjZZPt5tbv3OrgK/2SB4
   nuhVh+4qoS9DImpgHSXjHIWNJRflylZfzldwapRSLFnUgg3MnUJNzr4Jo
   aNHNiZWYsH2kwlJD3bdUAfUuN4wcZh32Ye1Ia5SJpWFFbXsPaP5Jll9QG
   gS18mS2/x9hTtqp4g4gLMeGCWIE5KxwUUAEOGhMvNJbSoKVkSj8hpu0Kx
   zYNZa69bHbqflXSrtJWgj0gE/mbfDRhCGzRYt1dxnI1xEslKBdQClXpIK
   rGdnZugGU1ZN5Y69DxZbKQV0hLuWtrRxb5/xvVA+CWn5UqL3bUZ5NPF0H
   w==;
X-CSE-ConnectionGUID: eJ6X6YPdS4etssu9FzFOtg==
X-CSE-MsgGUID: 2wAt0bEBTgirlTmCldWwJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="79183701"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="79183701"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 04:01:54 -0700
X-CSE-ConnectionGUID: 35CtsZ/dRv2LBqUJv9omAw==
X-CSE-MsgGUID: jQ7VrpufRJSLgSje2onZ7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="154777678"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Jul 2025 04:01:52 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWvDp-0000Xl-2K;
	Wed, 02 Jul 2025 11:01:49 +0000
Date: Wed, 2 Jul 2025 19:01:07 +0800
From: kernel test robot <lkp@intel.com>
To: Dawid Niedzwiecki <dawidn@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Benson Leung <bleung@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, chromeos-krk-upstreaming@google.com,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
	Dawid Niedzwiecki <dawidn@google.com>
Subject: Re: [PATCH v2] platform/chrome: Add ChromeOS EC USB driver
Message-ID: <202507021809.3gclls4s-lkp@intel.com>
References: <20250630122155.2060589-1-dawidn@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630122155.2060589-1-dawidn@google.com>

Hi Dawid,

kernel test robot noticed the following build warnings:

[auto build test WARNING on chrome-platform/for-next]
[also build test WARNING on chrome-platform/for-firmware-next linus/master v6.16-rc4 next-20250701]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dawid-Niedzwiecki/platform-chrome-Add-ChromeOS-EC-USB-driver/20250630-202610
base:   https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next
patch link:    https://lore.kernel.org/r/20250630122155.2060589-1-dawidn%40google.com
patch subject: [PATCH v2] platform/chrome: Add ChromeOS EC USB driver
config: i386-randconfig-r122-20250702 (https://download.01.org/0day-ci/archive/20250702/202507021809.3gclls4s-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507021809.3gclls4s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507021809.3gclls4s-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/chrome/cros_ec_usb.c:345:50: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned short const [usertype] idProduct @@     got restricted __le16 [usertype] idProduct @@
   drivers/platform/chrome/cros_ec_usb.c:345:50: sparse:     expected unsigned short const [usertype] idProduct
   drivers/platform/chrome/cros_ec_usb.c:345:50: sparse:     got restricted __le16 [usertype] idProduct

vim +345 drivers/platform/chrome/cros_ec_usb.c

   338	
   339	static int cros_ec_usb_probe(struct usb_interface *intf, const struct usb_device_id *id)
   340	{
   341		struct usb_device *usb_dev = interface_to_usbdev(intf);
   342		struct usb_endpoint_descriptor *bulk_in, *bulk_out, *int_in;
   343		struct device *if_dev = &intf->dev;
   344		struct cros_ec_device *ec_dev;
 > 345		const u16 idProduct = usb_dev->descriptor.idProduct;
   346		struct cros_ec_usb *ec_usb = cros_ec_usb_get_registered(idProduct);
   347		const bool is_registered = !!ec_usb;
   348		int ret;
   349	
   350		/*
   351		 * Do not register the same EC device twice. The probing is performed every reboot, sysjump,
   352		 * crash etc. Recreating the /dev/cros_X file every time would force all application to
   353		 * reopen the file, which is not a case for other cros_ec_x divers. Instead, keep
   354		 * the cros_ec_device and cros_ec_usb structures constant and replace USB related structures
   355		 * for the same EC that is reprobed.
   356		 *
   357		 * The driver doesn't support handling two devices with the same idProduct, but it will
   358		 * never be a real usecase.
   359		 */
   360		if (!is_registered) {
   361			ec_usb = kzalloc(sizeof(*ec_usb), GFP_KERNEL);
   362			if (!ec_usb)
   363				return -ENOMEM;
   364	
   365			INIT_WORK(&ec_usb->work_ec_evt, usb_evt_handler);
   366	
   367			ec_dev = kzalloc(sizeof(*ec_dev), GFP_KERNEL);
   368			if (!ec_dev) {
   369				ret = -ENOMEM;
   370				goto error;
   371			}
   372	
   373			ec_usb->ec_dev = ec_dev;
   374			mutex_init(&ec_usb->io_mutex);
   375			init_waitqueue_head(&ec_usb->resp_ready_wait);
   376	
   377			ec_dev->priv = ec_usb;
   378			/* EC uses int endpoint to signal events. */
   379			ec_dev->irq = 0;
   380			ec_dev->cmd_xfer = NULL;
   381			ec_dev->pkt_xfer = do_cros_ec_pkt_xfer_usb;
   382			ec_dev->din_size = sizeof(struct ec_host_response) +
   383					   sizeof(struct ec_response_get_protocol_info);
   384			ec_dev->dout_size = sizeof(struct ec_host_request) +
   385					    sizeof(struct ec_params_rwsig_action);
   386		} else {
   387			ec_dev = ec_usb->ec_dev;
   388	
   389			/*
   390			 * We need to allocate dout and din buffers, because cros_ec_register
   391			 * won't be called. These buffers were freed once previous usb device was
   392			 * disconnected. Use buffer sizes from the last query.
   393			 * The EC_HOST_EVENT_INTERFACE_READY event will be triggered at the end
   394			 * of a boot, which calls cros_ec_query_all function, that reallocates
   395			 * buffers.
   396			 */
   397			ec_dev->din = devm_kzalloc(ec_dev->dev, ec_dev->din_size, GFP_KERNEL);
   398			if (!ec_dev->din) {
   399				ret = -ENOMEM;
   400				dev_err(if_dev, "Failed to allocate din buffer\n");
   401				goto error;
   402			}
   403			ec_dev->dout = devm_kzalloc(ec_dev->dev, ec_dev->dout_size, GFP_KERNEL);
   404			if (!ec_dev->dout) {
   405				ret = -ENOMEM;
   406				dev_err(if_dev, "Failed to allocate dout buffer\n");
   407				goto error;
   408			}
   409		}
   410	
   411		ec_dev->dev = if_dev;
   412		ec_dev->phys_name = dev_name(if_dev);
   413		usb_set_intfdata(intf, ec_dev);
   414		/* Allow EC to do remote wake-up - host sends SET_FEATURE(remote wake-up) before suspend. */
   415		device_init_wakeup(&usb_dev->dev, true);
   416	
   417		ec_usb->udev = usb_get_dev(usb_dev);
   418		ec_usb->interface = usb_get_intf(intf);
   419	
   420		/* Use first bulk-in/out endpoints + int-in endpoint */
   421		ret = usb_find_common_endpoints(intf->cur_altsetting, &bulk_in, &bulk_out, &int_in, NULL);
   422		if (ret) {
   423			dev_err(if_dev,
   424				"Could not find bulk-in, bulk-out or int-in endpoint\n");
   425			goto error;
   426		}
   427		/* Bulk endpoints have to be capable of sending headers in one transfer. */
   428		if ((usb_endpoint_maxp(bulk_out) < sizeof(struct ec_host_request)) ||
   429		    (usb_endpoint_maxp(bulk_in) < sizeof(struct ec_host_response)) ||
   430		    (usb_endpoint_maxp(int_in)) < sizeof(struct int_msg)) {
   431			ret = -ENOSPC;
   432			dev_err(if_dev, "Incorrect max packet size\n");
   433			goto error;
   434		}
   435	
   436		ec_usb->bulk_out_pipe = usb_sndbulkpipe(ec_usb->udev, bulk_out->bEndpointAddress);
   437		ec_usb->bulk_in_size = usb_endpoint_maxp(bulk_in);
   438		ec_usb->bulk_in_pipe = usb_rcvbulkpipe(ec_usb->udev, bulk_in->bEndpointAddress);
   439		ec_usb->bulk_in_buffer = kmalloc(ec_usb->bulk_in_size, GFP_KERNEL);
   440		if (!ec_usb->bulk_in_buffer) {
   441			dev_err(if_dev, "Failed to allocate bulk in buffer\n");
   442			ret = -ENOMEM;
   443			goto error;
   444		}
   445	
   446		ec_usb->int_in_size = usb_endpoint_maxp(int_in);
   447		ec_usb->int_in_pipe = usb_rcvintpipe(ec_usb->udev, int_in->bEndpointAddress);
   448		ec_usb->int_in_interval = int_in->bInterval;
   449		ec_usb->int_in_buffer = kmalloc(ec_usb->int_in_size, GFP_KERNEL);
   450		if (!ec_usb->int_in_buffer) {
   451			dev_err(if_dev, "Failed to allocate int in buffer\n");
   452			ret = -ENOMEM;
   453			goto error;
   454		}
   455		ec_usb->int_in_urb = usb_alloc_urb(0, GFP_KERNEL);
   456		if (!ec_usb->int_in_urb) {
   457			dev_err(if_dev, "Failed to allocate int in urb\n");
   458			ret = -ENOMEM;
   459			goto error;
   460		}
   461	
   462		/* Use URB for the int endpoint. */
   463		ret = submit_int_urb(ec_dev);
   464		if (ret) {
   465			dev_err(if_dev, "Failed to sumbit int urb: %d\n", ret);
   466			goto error;
   467		}
   468	
   469		mutex_lock(&ec_usb->io_mutex);
   470		ec_usb->disconnected = false;
   471		mutex_unlock(&ec_usb->io_mutex);
   472	
   473		if (!is_registered) {
   474			ret = cros_ec_register(ec_dev);
   475			if (ret) {
   476				dev_err(if_dev, "Cannot register EC\n");
   477				goto error;
   478			}
   479			ret = cros_ec_usb_register(idProduct, ec_usb);
   480			if (ret) {
   481				cros_ec_unregister(ec_dev);
   482				goto error;
   483			}
   484			ec_usb->registered = true;
   485		}
   486	
   487		/* Handle potential events that haven't been handled before registration */
   488		schedule_work(&ec_usb->work_ec_evt);
   489	
   490		return 0;
   491	
   492	error:
   493		/* Free allocated memory */
   494		cros_ec_usb_delete(ec_usb);
   495	
   496		return ret;
   497	}
   498	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
