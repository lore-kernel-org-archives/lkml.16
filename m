Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19BB2417C9;
	Fri,  7 Feb 2025 13:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738933482; cv=none; b=GUQzApVFregWRGlXMRzOEg9qO+gob6MLXQxTKlO5aTicvscY0l5BhIEjRl3N+ofYBA3Sk/I0wjIVnW1DFg8O1AWDoBmeFxfUb9Y14Rj2/2Wv4z/YS6uicPLLXgAQ0q583jJRZWYdrzvvv31QtwtC8quDGfkkg7tV30IJXP3aAMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738933482; c=relaxed/simple;
	bh=nq7QO3U2zkXhkXMN/kYLNDAMQ+ro0niPd6+D9FDb9L0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5hYa3YcxPkGWMvHktqp3vy30682eFH0w1uun5vXAcxRWfUYa75dh/6jojlGoevWAXgchFeMf8mynDSCBR/xsOHrb9tX6lSvi3yiFCtusv6cNeMonTrCBh+xcq//Qffv3wVzaYWoXIAERtYnWH4tHIHKFYfu41XSIliIV9XHZcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ISuM3qIS; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ISuM3qIS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738933482; x=1770469482;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nq7QO3U2zkXhkXMN/kYLNDAMQ+ro0niPd6+D9FDb9L0=;
  b=ISuM3qIStomkOz7bPkaQcIobS3tTpZsvyXwTEayY96cP8obL7iz4iIux
   +3WXQlgkJit9bv6qR8Fc0JTddV54krC2/cW35X4BQl/AqBrPWKHNTZEjn
   WV0VHJ8k+kY/o0UeTwACRi2TzbNj1pLgWfjqw6i+Tiawn76zQYMNUuFvZ
   kv+uLCZfwOIn0Jz86d1rRHTu2Irby8n6xhqg57/gXU7rP13Uup5++5b1k
   FFguT7NwyBtAgwdw8BwleZjUbDOvWmFPqIJ/TFbF4+W3RSDRlE/6K9yyE
   bGnHIf6DQ0VTp3rxxG3PpctZS4kRC2c2h6/XOgMAZOBXyB8i9K85TB6q7
   g==;
X-CSE-ConnectionGUID: zRa+Qv3eRkKZJkkpBdkgnQ==
X-CSE-MsgGUID: 9ynbfwkRSbOCAqbZ5CRhPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39598986"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="39598986"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 05:04:41 -0800
X-CSE-ConnectionGUID: LblW5Yh9S+akKf7roBjTtg==
X-CSE-MsgGUID: FDW6ZjwxQd6Nw7+GRaTIgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111371283"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa010.jf.intel.com with SMTP; 07 Feb 2025 05:04:35 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 07 Feb 2025 15:04:34 +0200
Date: Fri, 7 Feb 2025 15:04:34 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Jameson Thies <jthies@google.com>,
	"Katiyar, Pooja" <pooja.katiyar@intel.com>,
	"Pathak, Asutosh" <asutosh.pathak@intel.com>,
	"Jayaraman, Venkat" <venkat.jayaraman@intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] usb: typec: ucsi: Command mailbox interface for
 the userspace
Message-ID: <Z6YE4mJHx1zHNW8d@kuha.fi.intel.com>
References: <20250206141936.1117222-1-heikki.krogerus@linux.intel.com>
 <20250206141936.1117222-2-heikki.krogerus@linux.intel.com>
 <2025020643-federal-uneatable-5da4@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025020643-federal-uneatable-5da4@gregkh>

On Thu, Feb 06, 2025 at 03:51:48PM +0100, Greg Kroah-Hartman wrote:
> On Thu, Feb 06, 2025 at 04:19:31PM +0200, Heikki Krogerus wrote:
> > Some of the UCSI commands can be used to configure the
> > entire Platform Policy Manager (PPM) instead of just
> > individual connectors. To allow the user space communicate
> > those commands with the PPM, adding a mailbox interface. The
> > interface is a single attribute file that represents the
> > main "OPM to PPM" UCSI data structure.
> > 
> > The mailbox allows any UCSI command to be sent to the PPM so
> > it should be also useful for validation, testing and
> > debugging purposes.
> 
> As it's for this type of thing, why not put it in debugfs instead?
> 
> > +static ssize_t ucsi_write(struct file *filp, struct kobject *kobj,
> > +			  const struct bin_attribute *attr,
> > +			  char *buf, loff_t off, size_t count)
> > +{
> > +	struct ucsi_sysfs *sysfs = attr->private;
> > +	struct ucsi *ucsi = sysfs->ucsi;
> > +	int ret;
> > +
> > +	u64 *control = (u64 *)&sysfs->mailbox[UCSI_CONTROL];
> > +	u32 *cci = (u32 *)&sysfs->mailbox[UCSI_CCI];
> > +	void *data = &sysfs->mailbox[UCSI_MESSAGE_IN];
> > +
> > +	/* TODO: MESSAGE_OUT. */
> > +	if (off != UCSI_CONTROL || count != sizeof(*control))
> > +		return -EFAULT;
> > +
> > +	mutex_lock(&sysfs->lock);
> > +
> > +	memset(data, 0, UCSI_MAX_DATA_LENGTH(ucsi));
> > +
> > +	/* PPM_RESET has to be handled separately. */
> > +	*control = get_unaligned_le64(buf);
> > +	if (UCSI_COMMAND(*control) == UCSI_PPM_RESET) {
> > +		ret = ucsi_reset_ppm(ucsi, cci);
> > +		goto out_unlock_sysfs;
> > +	}
> > +
> > +	mutex_lock(&ucsi->ppm_lock);
> > +
> > +	ret = ucsi->ops->sync_control(ucsi, *control, cci, NULL, 0);
> > +	if (ret)
> > +		goto out_unlock_ppm;
> > +
> > +	if (UCSI_CCI_LENGTH(*cci) && ucsi->ops->read_message_in(ucsi, data, UCSI_CCI_LENGTH(*cci)))
> > +		dev_err(ucsi->dev, "failed to read MESSAGE_IN\n");
> > +
> > +	ret = ucsi->ops->sync_control(ucsi, UCSI_ACK_CC_CI | UCSI_ACK_COMMAND_COMPLETE,
> > +				      NULL, NULL, 0);
> > +out_unlock_ppm:
> > +	mutex_unlock(&ucsi->ppm_lock);
> > +out_unlock_sysfs:
> > +	mutex_unlock(&sysfs->lock);
> > +
> > +	return ret ?: count;
> > +}
> 
> This worries me, any userspace tool can now do this?  What other "bad"
> things can it to the connection?

Although, there is actually only a limited number of things that you
can do to the connection using UCSI, that is definitely a concern.

The PPM (which is the EC firmware in most cases) is expected to prevent
any harmful or "unauthorized" UCSI commands from being executed, but
I'm not sure there is any guarantees for that at the moment.

> > +int ucsi_sysfs_register(struct ucsi *ucsi)
> > +{
> > +	struct ucsi_sysfs *sysfs;
> > +	int ret;
> > +
> > +	sysfs = kzalloc(struct_size(sysfs, mailbox, UCSI_MAILBOX_SIZE(ucsi)), GFP_KERNEL);
> > +	if (!sysfs)
> > +		return -ENOMEM;
> > +
> > +	sysfs->ucsi = ucsi;
> > +	mutex_init(&sysfs->lock);
> > +	memcpy(sysfs->mailbox, &ucsi->version, sizeof(ucsi->version));
> > +
> > +	sysfs_bin_attr_init(&sysfs->bin_attr);
> > +
> > +	sysfs->bin_attr.attr.name = "ucsi";
> > +	sysfs->bin_attr.attr.mode = 0644;
> > +
> > +	sysfs->bin_attr.size = UCSI_MAILBOX_SIZE(ucsi);
> > +	sysfs->bin_attr.private = sysfs;
> > +	sysfs->bin_attr.read_new = ucsi_read;
> > +	sysfs->bin_attr.write_new = ucsi_write;
> > +
> > +	ret = sysfs_create_bin_file(&ucsi->dev->kobj, &sysfs->bin_attr);
> 
> You raced with userspace and lost, right?  Why are you dynamically
> creating this attribute, can't you just use a static one?

The size of the attribute depends on the UCSI version.

> But again, why not debugfs?  I'd feel a lot more comfortable with that
> instead of sysfs.

I would actually prefer debugfs for this, but this is in any case
not primarily for debugging and validation.

The initial goal was to supply the user space some way to control the
EC's power related policies using UCSI commands such as
SET_POWER_LEVEL and GET_POWER_LEVEL (guys, please correct me if I got
that wrong).

But I'm now again wondering could those power policy tasks be handled
using the UCSI power supplies after all? Venkat, did you look into
that?

thanks,

-- 
heikki
