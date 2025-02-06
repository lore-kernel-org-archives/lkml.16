Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F49D13BADF;
	Thu,  6 Feb 2025 14:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738853511; cv=none; b=g07Oid0xFmEIRvc24KHU17itS1mkNMAwtm6uPvxwdXt93qYXx1tXgZZq5EUluYXTmiVS+RaU4n2VKF2PLxGV4mh3n7oeTsMXX0C4s74Wjh30L+778YkFHLs3yfN6P2tATSp4U5DSMJMKbttroKcM84QjnjTp9gvgBRmDGmCdOSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738853511; c=relaxed/simple;
	bh=fMj8Mk7m+/sOohY6VfoATzz94KYI2Kpefe1/ceI/S8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rXY94ONjih3uVVaYMRQLhYe1xiHyXBhUDnmRKMNTXEYLD7yC8B70SEj3rOSQsm94kJ0cc1vtp6zxWZY+LGi5CnMrxGhGIz//222PIImPt+zUeArmbVFM++QCv4/d8+LVHM7spDAg8iYZfmSXthoWeUT6YYDT8u75dI+8P8Zsy6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=R/bNzBO7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="R/bNzBO7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EB63C4CEDD;
	Thu,  6 Feb 2025 14:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738853511;
	bh=fMj8Mk7m+/sOohY6VfoATzz94KYI2Kpefe1/ceI/S8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R/bNzBO7JxuqvpLv0EHCr1ZG+kFk8HBOobm7zslzz6r343f2ZFFmAeBH3I85ZxS30
	 +yrRCowGSTA9GR764E0ct3SslVvjmY8sICsKNbC72ca0h//veqWVCpjCkmM1fN1QyJ
	 o84onU6JrleqTyISxP4mVLxLoFhQd0fj4Jn/BDI4=
Date: Thu, 6 Feb 2025 15:51:48 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
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
Message-ID: <2025020643-federal-uneatable-5da4@gregkh>
References: <20250206141936.1117222-1-heikki.krogerus@linux.intel.com>
 <20250206141936.1117222-2-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206141936.1117222-2-heikki.krogerus@linux.intel.com>

On Thu, Feb 06, 2025 at 04:19:31PM +0200, Heikki Krogerus wrote:
> Some of the UCSI commands can be used to configure the
> entire Platform Policy Manager (PPM) instead of just
> individual connectors. To allow the user space communicate
> those commands with the PPM, adding a mailbox interface. The
> interface is a single attribute file that represents the
> main "OPM to PPM" UCSI data structure.
> 
> The mailbox allows any UCSI command to be sent to the PPM so
> it should be also useful for validation, testing and
> debugging purposes.

As it's for this type of thing, why not put it in debugfs instead?

> +static ssize_t ucsi_write(struct file *filp, struct kobject *kobj,
> +			  const struct bin_attribute *attr,
> +			  char *buf, loff_t off, size_t count)
> +{
> +	struct ucsi_sysfs *sysfs = attr->private;
> +	struct ucsi *ucsi = sysfs->ucsi;
> +	int ret;
> +
> +	u64 *control = (u64 *)&sysfs->mailbox[UCSI_CONTROL];
> +	u32 *cci = (u32 *)&sysfs->mailbox[UCSI_CCI];
> +	void *data = &sysfs->mailbox[UCSI_MESSAGE_IN];
> +
> +	/* TODO: MESSAGE_OUT. */
> +	if (off != UCSI_CONTROL || count != sizeof(*control))
> +		return -EFAULT;
> +
> +	mutex_lock(&sysfs->lock);
> +
> +	memset(data, 0, UCSI_MAX_DATA_LENGTH(ucsi));
> +
> +	/* PPM_RESET has to be handled separately. */
> +	*control = get_unaligned_le64(buf);
> +	if (UCSI_COMMAND(*control) == UCSI_PPM_RESET) {
> +		ret = ucsi_reset_ppm(ucsi, cci);
> +		goto out_unlock_sysfs;
> +	}
> +
> +	mutex_lock(&ucsi->ppm_lock);
> +
> +	ret = ucsi->ops->sync_control(ucsi, *control, cci, NULL, 0);
> +	if (ret)
> +		goto out_unlock_ppm;
> +
> +	if (UCSI_CCI_LENGTH(*cci) && ucsi->ops->read_message_in(ucsi, data, UCSI_CCI_LENGTH(*cci)))
> +		dev_err(ucsi->dev, "failed to read MESSAGE_IN\n");
> +
> +	ret = ucsi->ops->sync_control(ucsi, UCSI_ACK_CC_CI | UCSI_ACK_COMMAND_COMPLETE,
> +				      NULL, NULL, 0);
> +out_unlock_ppm:
> +	mutex_unlock(&ucsi->ppm_lock);
> +out_unlock_sysfs:
> +	mutex_unlock(&sysfs->lock);
> +
> +	return ret ?: count;
> +}

This worries me, any userspace tool can now do this?  What other "bad"
things can it to the connection?

> +
> +int ucsi_sysfs_register(struct ucsi *ucsi)
> +{
> +	struct ucsi_sysfs *sysfs;
> +	int ret;
> +
> +	sysfs = kzalloc(struct_size(sysfs, mailbox, UCSI_MAILBOX_SIZE(ucsi)), GFP_KERNEL);
> +	if (!sysfs)
> +		return -ENOMEM;
> +
> +	sysfs->ucsi = ucsi;
> +	mutex_init(&sysfs->lock);
> +	memcpy(sysfs->mailbox, &ucsi->version, sizeof(ucsi->version));
> +
> +	sysfs_bin_attr_init(&sysfs->bin_attr);
> +
> +	sysfs->bin_attr.attr.name = "ucsi";
> +	sysfs->bin_attr.attr.mode = 0644;
> +
> +	sysfs->bin_attr.size = UCSI_MAILBOX_SIZE(ucsi);
> +	sysfs->bin_attr.private = sysfs;
> +	sysfs->bin_attr.read_new = ucsi_read;
> +	sysfs->bin_attr.write_new = ucsi_write;
> +
> +	ret = sysfs_create_bin_file(&ucsi->dev->kobj, &sysfs->bin_attr);

You raced with userspace and lost, right?  Why are you dynamically
creating this attribute, can't you just use a static one?

But again, why not debugfs?  I'd feel a lot more comfortable with that
instead of sysfs.

thanks,

greg k-h


