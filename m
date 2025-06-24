Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9861C28466F;
	Tue, 24 Jun 2025 10:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750761713; cv=none; b=hwIPKSsReP576RVVOP2zrs2nfwecI+M2+jPCtT+UctBJDoXrHV1fpsGgfiGmOyoMoLZIKUe7Ma6CMDofKHCm+H5lNnJU12vWefqnfKU0gvRb+ae2MBm5P6ecSqSOzgwbeSyF3yS2n63jUTgcHihKgRLli/p6BO5CAxxjyLjMlD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750761713; c=relaxed/simple;
	bh=K/6nYeBo/6GMRm/IJUluTXarB6TXhlyTShmGZg83qWE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Cf/WonWyU9bJ8hhq+8IpJOp+WXOr6eQHnWfVqbBlMkmF2z4+nC5IclA6aY5xNfvNO0GVGZSWo4i7nf2qIuNVUY4k4+OrjEbVgMQo/IF5DXZ6BZnqJ3ufixR6NHnH84BrEVbHXvSrH9GvdJe2JWC4epRIOOUHELMEGk15yZBjnXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lo61+Wpa; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lo61+Wpa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750761711; x=1782297711;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=K/6nYeBo/6GMRm/IJUluTXarB6TXhlyTShmGZg83qWE=;
  b=Lo61+WpaeIm/kV3D1KRFGlJPvGy7APcRPa0Wps9go/hmsMtp6fIhqjeS
   5XbWeLfisqUrTr+IaqWnbeHiBDrWho9BJ1e2Yix73ZZ8wXDC8GzVR2ZO2
   VJlhQQsW8jVdTlqUYAtSDyzwJrEdUqRzfCErslZ8WJWaHzeAsqGDf0QTX
   SKpCM3z1i4793AWPiPkH30psLHZ3A6xFc4jA5gdn/W2RrI0S5qE6qCVNo
   6ljBhbsFlpUEBjImdaWxfdPblaeBh/tKyqvn6+ca6P+DHrbA2gcRtvRG7
   iIzqIkGPkJycf88T8WcpqHAgkqq3OGsPLiXO/y6RU7QToiBqP8jCEFKAX
   A==;
X-CSE-ConnectionGUID: mXSlqwPYSKWtSl1RuZW4tg==
X-CSE-MsgGUID: cY7QUJpVSQGuYE6jt9Sl8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="53090922"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="53090922"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 03:36:03 -0700
X-CSE-ConnectionGUID: eTgT9tTeQLSNO23lmfZECQ==
X-CSE-MsgGUID: rXky3VK0QF+HIv5mLeALbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="152007753"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.16])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 03:36:00 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 24 Jun 2025 13:35:57 +0300 (EEST)
To: Xiang Shen <turyshen@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, acelan.kao@canonical.com, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: intel-vbtn: Fix code style issues
In-Reply-To: <hlsev7jydwejtdlyay6e6f53yorf2aguhxykscuukqfxugg7ff@hmmpcg7s4sx6>
Message-ID: <83b27cc9-3544-4fd5-4ece-a46f422ec6fe@linux.intel.com>
References: <20250620003849.54442-1-turyshen@gmail.com> <fdb9c21f-aada-498a-92ec-bc48aceeb76e@kernel.org> <hlsev7jydwejtdlyay6e6f53yorf2aguhxykscuukqfxugg7ff@hmmpcg7s4sx6>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 22 Jun 2025, Xiang Shen wrote:
> On Fri, Jun 20, 2025 at 12:00:03PM +1000, Hans de Goede wrote:
> > On 20-Jun-25 2:38 AM, Xiang Shen wrote:
> > > Fix checkpatch code style errors:
> > > 
> > > ERROR: do not use assignment in if condition
> > > +	if ((ke = sparse_keymap_entry_from_scancode(priv->buttons_dev, event))) {
> > > 
> > > ERROR: do not use assignment in if condition
> > > +	} else if ((ke = sparse_keymap_entry_from_scancode(priv->switches_dev, event))) {
> > > 
> > > Signed-off-by: Xiang Shen <turyshen@gmail.com>
> > 
> > Thank you for your patch, but this change really does not make
> > the code more readable.
> > 
> > The contrary the suggested changes are making the code harder
> > to read, so NACK.
> > 
> > Note checkpatch is just a tool, sometimes there are good reasons
> > to deviate from the style checks done by checkpatch.
> > 
> > Next time when submitting a patch to fix checkpatch issues please
> > take a look at the resulting code after the patch and only submit
> > the patch upstream if it actually is an improvement.
> > 
> > Regards,
> > 
> > Hans
> > 
> Hi Hans,
> 
> Thanks for the feedback. 
> 
> That's fine if breaking the "rule" is the only way to keep the file readable.
> 
> However, there are only three files (x86/sony-laptop.c and 
> x86/dell/dell_rbu.c) out of 273 files in the whole drivers/platform 
> folder that have such an error. 

Hi,

Please don't call correct code "error" even if checkpatch may label it as 
such. The goal is NOT and will never be to have zero checkpatch warnings.

The fact that the checkpatch "rule" is broken only a few times does not 
mean those 3 places have a problem, it just tells it's good rule for the
general case. So I won't accept using such numbers as a leverage against 
the few places just for the sake of silencing checkpatch.

> Perhaps there are other approaches to make them more readable without 
> breaking the rule.

Perhaps, but I'm not sure the effort spent to find one is worthwhile 
investment.

> > > ---
> > >  drivers/platform/x86/intel/vbtn.c | 38 +++++++++++++++++--------------
> > >  1 file changed, 21 insertions(+), 17 deletions(-)
> > > 
> > > diff --git a/drivers/platform/x86/intel/vbtn.c b/drivers/platform/x86/intel/vbtn.c
> > > index 232cd12e3c9f..bcc97b06844e 100644
> > > --- a/drivers/platform/x86/intel/vbtn.c
> > > +++ b/drivers/platform/x86/intel/vbtn.c
> > > @@ -160,30 +160,34 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
> > >  
> > >  	guard(mutex)(&priv->mutex);
> > >  
> > > -	if ((ke = sparse_keymap_entry_from_scancode(priv->buttons_dev, event))) {
> > > +	ke = sparse_keymap_entry_from_scancode(priv->buttons_dev, event);
> > > +	if (ke) {
> > >  		if (!priv->has_buttons) {
> > >  			dev_warn(&device->dev, "Warning: received 0x%02x button event on a device without buttons, please report this.\n",
> > >  				 event);
> > >  			return;
> > >  		}
> > >  		input_dev = priv->buttons_dev;
> > > -	} else if ((ke = sparse_keymap_entry_from_scancode(priv->switches_dev, event))) {
> > > -		if (!priv->has_switches) {
> > > -			/* See dual_accel_detect.h for more info */
> > > -			if (priv->dual_accel)
> > > -				return;
> > > -
> > > -			dev_info(&device->dev, "Registering Intel Virtual Switches input-dev after receiving a switch event\n");
> > > -			ret = input_register_device(priv->switches_dev);
> > > -			if (ret)
> > > -				return;
> > > -
> > > -			priv->has_switches = true;
> > > -		}
> > > -		input_dev = priv->switches_dev;
> > >  	} else {
> > > -		dev_dbg(&device->dev, "unknown event index 0x%x\n", event);
> > > -		return;
> > > +		ke = sparse_keymap_entry_from_scancode(priv->switches_dev, event);
> > > +		if (ke) {
> > > +			if (!priv->has_switches) {
> > > +				/* See dual_accel_detect.h for more info */
> > > +				if (priv->dual_accel)
> > > +					return;
> > > +
> > > +				dev_info(&device->dev, "Registering Intel Virtual Switches input-dev after receiving a switch event\n");
> > > +				ret = input_register_device(priv->switches_dev);
> > > +				if (ret)
> > > +					return;
> > > +
> > > +				priv->has_switches = true;
> > > +			}
> > > +			input_dev = priv->switches_dev;
> > > +		} else {
> > > +			dev_dbg(&device->dev, "unknown event index 0x%x\n", event);
> > > +			return;
> > > +		}
> > >  	}
> > >  
> > >  	if (priv->wakeup_mode) {
> > 
> 

-- 
 i.

