Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B6B42056;
	Tue, 24 Jun 2025 09:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750757029; cv=none; b=PPpLVLQvY7+rEje9sukciDuppU5rLrUuuv3ev8pggQcl9jnUaYwYd33iwQUp9PVO3WuNikDZyx3o5OAYHcucSQpBcrA6Kp3lQ+bMDa/WkuqtRBGi8pI+8f40a3fidvRzeBe8INjYsf7KMUFhbUUALOp9Wvom2e2We0zolKpbEkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750757029; c=relaxed/simple;
	bh=dhth3qJigOYuFKtx08jfd4tK7Y/6UJuY4WpKxFOp6XM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B1H2jC+lhQZ91tnm9epeSMCzGmLsbH3XAhtsmYeJRUEXGEIZAPqulgMZN7uV6vp8Y7P1ggS0oTLmKSjl3EInJVpJe8FHeAQEwKlUWmB5pRzWNMRnO8zU8HcDYMCn1R9ldv7PkvybBfpsx0CMRx1PMz8GKbtacf6V6oo3N8XNVNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E95Zh1OK; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E95Zh1OK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750757028; x=1782293028;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=dhth3qJigOYuFKtx08jfd4tK7Y/6UJuY4WpKxFOp6XM=;
  b=E95Zh1OKGS44Zqp+frZs657CrGVepeu4lMJLJP2smRDEAfDi9JpmbUKO
   DGbCGo+R7nAgyUtGHUYz5kI0L8NX9EMWZ6ZfO9jo+T1z6KJ41s8apZGbU
   B31aLje9QJlCC6+IzcKU1NH3agMZBCEcwTIDgx+jdWiKgOluBz3eqlSnP
   rU+lF0UJrqGvV3g6fnpSN+8I+iSBhOo+ZE9DMIdJ9eniQwW5N3xWHH34m
   42/BlsNhlxOItRdh9+K09uFFqlxJnbBnfgBpKY2BT1exSKhubWINqfbOY
   j+juvsAjlaMMvdAnWEDyG7b496pCOkQd8hhNN+xi1ZWtH1sWkrW6sAq7w
   Q==;
X-CSE-ConnectionGUID: YDaEc1ZQTKmZcH8VSZnIBQ==
X-CSE-MsgGUID: +DTll/9KTjGdZSli8Ci9MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="53124882"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="53124882"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 02:23:47 -0700
X-CSE-ConnectionGUID: oTh/KndoR8WjjA89tlA9YA==
X-CSE-MsgGUID: zYpdrGNzQNS8JhAPMuTglA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="157367536"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa004.fm.intel.com with SMTP; 24 Jun 2025 02:23:44 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 24 Jun 2025 12:23:43 +0300
Date: Tue, 24 Jun 2025 12:23:43 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: RD Babiera <rdbabiera@google.com>
Cc: badhri@google.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: altmodes/displayport: add irq_hpd to sysfs
Message-ID: <aFpunwaDQKVNs86J@kuha.fi.intel.com>
References: <20250623204947.732915-2-rdbabiera@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250623204947.732915-2-rdbabiera@google.com>

On Mon, Jun 23, 2025 at 08:49:45PM +0000, RD Babiera wrote:
> Add irq_hpd sysfs node to displayport driver. This allows the userspace
> to subscribe to irq events similar to how it can subscribe to changes in
> hpd.
> 
> irq_hpd is read only and returns the number of irq events generated since
> driver probe. pending_irq_hpd is added so that a sysfs_emit can be
> generated if the HPD high event belonging to the same status message
> is delayed until a successful configuration.
> 
> Signed-off-by: RD Babiera <rdbabiera@google.com>
> Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes since v1:
> * fixed bracket styling error
> ---
>  .../testing/sysfs-driver-typec-displayport    | 10 +++++++
>  drivers/usb/typec/altmodes/displayport.c      | 28 +++++++++++++++++++
>  2 files changed, 38 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-typec-displayport b/Documentation/ABI/testing/sysfs-driver-typec-displayport
> index 256c87c5219a..314acd54e13e 100644
> --- a/Documentation/ABI/testing/sysfs-driver-typec-displayport
> +++ b/Documentation/ABI/testing/sysfs-driver-typec-displayport
> @@ -62,3 +62,13 @@ Description:
>  			     by VESA DisplayPort Alt Mode on USB Type-C Standard.
>  			- 0 when HPD’s logical state is low (HPD_Low) as defined by
>  			     VESA DisplayPort Alt Mode on USB Type-C Standard.
> +
> +What:		/sys/bus/typec/devices/.../displayport/irq_hpd
> +Date:		June 2025
> +Contact:	RD Babiera <rdbabiera@google.com>
> +Description:
> +		IRQ_HPD events are sent over the USB PD protocol in Status Update and
> +		Attention messages. IRQ_HPD can only be asserted when HPD is high,
> +		and is asserted when an IRQ_HPD has been issued since the last Status
> +		Update. This is a read only node that returns the number of IRQ events
> +		raised in the driver's lifetime.
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> index b09b58d7311d..7f9f1f98f450 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -65,6 +65,13 @@ struct dp_altmode {
>  	enum dp_state state;
>  	bool hpd;
>  	bool pending_hpd;
> +	u32 irq_hpd_count;
> +	/*
> +	 * hpd is mandatory for irq_hpd assertion, so irq_hpd also needs its own pending flag if
> +	 * both hpd and irq_hpd are asserted in the first Status Update before the pin assignment
> +	 * is configured.
> +	 */
> +	bool pending_irq_hpd;
>  
>  	struct mutex lock; /* device lock */
>  	struct work_struct work;
> @@ -151,6 +158,7 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
>  {
>  	bool configured = !!DP_CONF_GET_PIN_ASSIGN(dp->data.conf);
>  	bool hpd = !!(dp->data.status & DP_STATUS_HPD_STATE);
> +	bool irq_hpd = !!(dp->data.status & DP_STATUS_IRQ_HPD);
>  	u8 con = DP_STATUS_CONNECTION(dp->data.status);
>  	int ret = 0;
>  
> @@ -170,6 +178,8 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
>  				dp->hpd = hpd;
>  				dp->pending_hpd = true;
>  			}
> +			if (dp->hpd && dp->pending_hpd && irq_hpd)
> +				dp->pending_irq_hpd = true;
>  		}
>  	} else {
>  		drm_connector_oob_hotplug_event(dp->connector_fwnode,
> @@ -177,6 +187,10 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
>  						      connector_status_disconnected);
>  		dp->hpd = hpd;
>  		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
> +		if (hpd && irq_hpd) {
> +			dp->irq_hpd_count++;
> +			sysfs_notify(&dp->alt->dev.kobj, "displayport", "irq_hpd");
> +		}
>  	}
>  
>  	return ret;
> @@ -196,6 +210,11 @@ static int dp_altmode_configured(struct dp_altmode *dp)
>  						connector_status_connected);
>  		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
>  		dp->pending_hpd = false;
> +		if (dp->pending_irq_hpd) {
> +			dp->irq_hpd_count++;
> +			sysfs_notify(&dp->alt->dev.kobj, "displayport", "irq_hpd");
> +			dp->pending_irq_hpd = false;
> +		}
>  	}
>  
>  	return dp_altmode_notify(dp);
> @@ -707,10 +726,19 @@ static ssize_t hpd_show(struct device *dev, struct device_attribute *attr, char
>  }
>  static DEVICE_ATTR_RO(hpd);
>  
> +static ssize_t irq_hpd_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct dp_altmode *dp = dev_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "%d\n", dp->irq_hpd_count);
> +}
> +static DEVICE_ATTR_RO(irq_hpd);
> +
>  static struct attribute *displayport_attrs[] = {
>  	&dev_attr_configuration.attr,
>  	&dev_attr_pin_assignment.attr,
>  	&dev_attr_hpd.attr,
> +	&dev_attr_irq_hpd.attr,
>  	NULL
>  };
>  
> 
> base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
> -- 
> 2.50.0.rc2.761.g2dc52ea45b-goog

-- 
heikki
