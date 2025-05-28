Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969FC20F07D;
	Wed, 28 May 2025 10:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748427787; cv=none; b=tGgYZeRbOI5wrj4QJl863673rVODH/vHmEjaZLRf8xmPiCzQhccAxD5QX2dQpkzjBZYDVlehU9IPIZno4k0GQzKW7va1ncppE6YyGtGNeQ5SDW1sUltpewScZ+dCz4v1wZhwyXNWlQSPcACN/pcc7QJGKCJ9xFCfq5YgNSC36zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748427787; c=relaxed/simple;
	bh=5q0BJjuFYMKfAu0Lsls9akQKrbkSPVyVkJDHOZPWe9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fVy+DVwS8tBAJsUA7BIekfW43TAT78dt6SB8VDfnAMHPs9l7rlZq+NZpfoE1JMuLdiWntt0oZwuubJzi+JgOa5i0xuwBqXVEnJwPI/x148KHqlNu7EK0o0lSQgwJVSpg/iK821JS9KS+Ovd8xYzdTKkdq5PtRBsXr96wIBPF7Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LxWF0gfB; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LxWF0gfB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748427786; x=1779963786;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5q0BJjuFYMKfAu0Lsls9akQKrbkSPVyVkJDHOZPWe9E=;
  b=LxWF0gfBcgevgV+MswMAatUwdYMvxXMgldN6cAJMjtM+VZELRRSFhzvL
   GfcCs2wzjrbKEqRHPR96qkevDikGwINNnGeKpeLpb2zu7lYYB6gU+1Sy2
   b+qAPnu0YLVdfMZFy0PFRNK4wAYy28lfddBNdw+l6bMpOBh5K4UpXFx2R
   lgrCwJPj1aLsNTMXUtGogfDM8E+I8jyJYuNtYpXoWfLEWLS/94mFuK0bJ
   nXGZgL+xxvVvQWBh/AUHGfJX8EAIxubOYlsS+B8gHey+uSIyTLhpZT1Fl
   5tOok6cXGM1SOpiNTC17J+MrnwzcWyDJ+hlPAJmLjs6oNqxI1OqKutGOG
   g==;
X-CSE-ConnectionGUID: QzIGebEYTmO84Hx4iRKeCQ==
X-CSE-MsgGUID: h4q5bwZaQHOZG5M521FO/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50146342"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="50146342"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 03:23:05 -0700
X-CSE-ConnectionGUID: cmf5Wwz4ThCES6b3Go4S4w==
X-CSE-MsgGUID: gBILxGxYSHe6BVzY1oTLCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="143116436"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa006.jf.intel.com with SMTP; 28 May 2025 03:23:02 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 28 May 2025 13:23:01 +0300
Date: Wed, 28 May 2025 13:23:01 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Yongbo Zhang <giraffesnn123@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: fusb302: fix scheduling while atomic when
 using virtio-gpio
Message-ID: <aDbkBZi1L442jd7i@kuha.fi.intel.com>
References: <20250526043433.673097-1-giraffesnn123@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526043433.673097-1-giraffesnn123@gmail.com>

On Mon, May 26, 2025 at 12:34:33PM +0800, Yongbo Zhang wrote:
> When the gpio irqchip connected to a slow bus(e.g., i2c bus or virtio
> bus), calling disable_irq_nosync() in top-half ISR handler will trigger
> the following kernel BUG:
> 
> BUG: scheduling while atomic: RenderEngine/253/0x00010002
> ...
> Call trace:
>  dump_backtrace+0x0/0x1c8
>  show_stack+0x1c/0x2c
>  dump_stack_lvl+0xdc/0x12c
>  dump_stack+0x1c/0x64
>  __schedule_bug+0x64/0x80
>  schedule_debug+0x98/0x118
>  __schedule+0x68/0x704
>  schedule+0xa0/0xe8
>  schedule_timeout+0x38/0x124
>  wait_for_common+0xa4/0x134
>  wait_for_completion+0x1c/0x2c
>  _virtio_gpio_req+0xf8/0x198
>  virtio_gpio_irq_bus_sync_unlock+0x94/0xf0
>  __irq_put_desc_unlock+0x50/0x54
>  disable_irq_nosync+0x64/0x94
>  fusb302_irq_intn+0x24/0x84
>  __handle_irq_event_percpu+0x84/0x278
>  handle_irq_event+0x64/0x14c
>  handle_level_irq+0x134/0x1d4
>  generic_handle_domain_irq+0x40/0x68
>  virtio_gpio_event_vq+0xb0/0x130
>  vring_interrupt+0x7c/0x90
>  vm_interrupt+0x88/0xd8
>  __handle_irq_event_percpu+0x84/0x278
>  handle_irq_event+0x64/0x14c
>  handle_fasteoi_irq+0x110/0x210
>  __handle_domain_irq+0x80/0xd0
>  gic_handle_irq+0x78/0x154
>  el0_irq_naked+0x60/0x6c
> 
> This patch replaces request_irq() with devm_request_threaded_irq() to
> avoid the use of disable_irq_nosync().
> 
> Signed-off-by: Yongbo Zhang <giraffesnn123@gmail.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/fusb302.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> index f15c63d3a8f4..f2801279c4b5 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -1477,9 +1477,6 @@ static irqreturn_t fusb302_irq_intn(int irq, void *dev_id)
>  	struct fusb302_chip *chip = dev_id;
>  	unsigned long flags;
> 
> -	/* Disable our level triggered IRQ until our irq_work has cleared it */
> -	disable_irq_nosync(chip->gpio_int_n_irq);
> -
>  	spin_lock_irqsave(&chip->irq_lock, flags);
>  	if (chip->irq_suspended)
>  		chip->irq_while_suspended = true;
> @@ -1622,7 +1619,6 @@ static void fusb302_irq_work(struct work_struct *work)
>  	}
>  done:
>  	mutex_unlock(&chip->lock);
> -	enable_irq(chip->gpio_int_n_irq);
>  }
> 
>  static int init_gpio(struct fusb302_chip *chip)
> @@ -1747,9 +1743,10 @@ static int fusb302_probe(struct i2c_client *client)
>  		goto destroy_workqueue;
>  	}
> 
> -	ret = request_irq(chip->gpio_int_n_irq, fusb302_irq_intn,
> -			  IRQF_ONESHOT | IRQF_TRIGGER_LOW,
> -			  "fsc_interrupt_int_n", chip);
> +	ret = devm_request_threaded_irq(dev, chip->gpio_int_n_irq,
> +					NULL, fusb302_irq_intn,
> +					IRQF_ONESHOT | IRQF_TRIGGER_LOW,
> +					"fsc_interrupt_int_n", chip);
>  	if (ret < 0) {
>  		dev_err(dev, "cannot request IRQ for GPIO Int_N, ret=%d", ret);
>  		goto tcpm_unregister_port;
> @@ -1774,7 +1771,6 @@ static void fusb302_remove(struct i2c_client *client)
>  	struct fusb302_chip *chip = i2c_get_clientdata(client);
> 
>  	disable_irq_wake(chip->gpio_int_n_irq);
> -	free_irq(chip->gpio_int_n_irq, chip);
>  	cancel_work_sync(&chip->irq_work);
>  	cancel_delayed_work_sync(&chip->bc_lvl_handler);
>  	tcpm_unregister_port(chip->tcpm_port);
> --
> 2.49.0

-- 
heikki
