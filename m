Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D6A71747
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 12:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751113084; cv=none; b=Mjnad52AuJ0ywpZrJyJu0LQpD2VWloH+tGRZ4qUkCAePBHmsjhmwQorpx1cMws7mah1D9jMRfu9Xu/dgL/Q6ch5aDek3//5MglTH4cslw1JIiH42LKkJG5rtnsHJufJ+fQwZn3LxPynTQOnYMl72hVFKGxo4G7gDA6B1IIaN7e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751113084; c=relaxed/simple;
	bh=5gNTyyIrr9xdgGlz/I/Vt0rXDxRjosNLvKaatqfFq7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=quUxpP/5aUiqlmekxGb23P1qTIst5IVvhkw/mVVd3PWiDoLImXpQSfr0HzRCpzVJHcUPA7V5kxdINpzg7L7gIjMXHdouC2+pQ/l52asB8pqttCeFhFOsjAStZCF1ZuB6jvU5DWPVWrz6C5wy0WW010ignUWsPJrUFkWjVryxuDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TBlOfUQR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TBlOfUQR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52816C4CEEA;
	Sat, 28 Jun 2025 12:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751113084;
	bh=5gNTyyIrr9xdgGlz/I/Vt0rXDxRjosNLvKaatqfFq7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TBlOfUQRtZsSL8uPBfO6n6f+WrxX13RpMqIU8NTXfKkiKN3Kqbb9GcawVqs9MgMyQ
	 lBGKDBEHEiTA+wo6hEifMGdkGDjgBvCDTNn4NUDMOEOj6mtVBD6H6RlsJIONJ+yMKQ
	 G6vW87B7am9lQlUQxRtaBfPJUv4aSEKVTBqjp0Xk=
Date: Sat, 28 Jun 2025 14:18:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, anshuman.gupta@intel.com,
	rodrigo.vivi@intel.com, alexander.usyskin@intel.com,
	daniele.ceraolospurio@intel.com
Subject: Re: [PATCH v4 02/10] mei: late_bind: add late binding component
 driver
Message-ID: <2025062834-scraggly-barracuda-7ea6@gregkh>
References: <20250625170015.33912-1-badal.nilawar@intel.com>
 <20250625170015.33912-3-badal.nilawar@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625170015.33912-3-badal.nilawar@intel.com>

On Wed, Jun 25, 2025 at 10:30:07PM +0530, Badal Nilawar wrote:
> --- /dev/null
> +++ b/drivers/misc/mei/late_bind/mei_late_bind.c
> @@ -0,0 +1,281 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 Intel Corporation
> + */
> +#include <drm/intel/i915_component.h>
> +#include <drm/intel/late_bind_mei_interface.h>
> +#include <linux/component.h>
> +#include <linux/pci.h>
> +#include <linux/mei_cl_bus.h>
> +#include <linux/module.h>
> +#include <linux/overflow.h>
> +#include <linux/slab.h>
> +#include <linux/uuid.h>
> +
> +#include "mkhi.h"
> +
> +#define GFX_SRV_MKHI_LATE_BINDING_CMD 0x12
> +#define GFX_SRV_MKHI_LATE_BINDING_RSP (GFX_SRV_MKHI_LATE_BINDING_CMD | 0x80)
> +
> +#define LATE_BIND_SEND_TIMEOUT_MSEC 3000
> +#define LATE_BIND_RECV_TIMEOUT_MSEC 3000
> +
> +/**
> + * struct csc_heci_late_bind_req - late binding request
> + * @header: @ref mkhi_msg_hdr
> + * @type: type of the late binding payload
> + * @flags: flags to be passed to the firmware
> + * @reserved: reserved field

Reserved for what?  All reserved fields need to be set to a default
value, please document that here.

> + * @payload_size: size of the payload data in bytes
> + * @payload: data to be sent to the firmware
> + */
> +struct csc_heci_late_bind_req {
> +	struct mkhi_msg_hdr header;
> +	u32 type;
> +	u32 flags;

What is the endian of these fields?  And as this crosses the
kernel/hardware boundry, shouldn't these be __u32?

> +/**
> + * struct csc_heci_late_bind_rsp - late binding response
> + * @header: @ref mkhi_msg_hdr
> + * @type: type of the late binding payload
> + * @reserved: reserved field
> + * @status: status of the late binding command execution by firmware
> + */
> +struct csc_heci_late_bind_rsp {
> +	struct mkhi_msg_hdr header;
> +	u32 type;
> +	u32 reserved[2];
> +	u32 status;

Same questions as above.

> +} __packed;
> +/**
> + * mei_late_bind_push_config - Sends a config to the firmware.
> + * @dev: device struct corresponding to the mei device
> + * @type: payload type

Shouldn't type be an enum?

> + * @flags: payload flags
> + * @payload: payload buffer
> + * @payload_size: payload buffer size
> + *
> + * Return: 0 success, negative errno value on transport failure,
> + *         positive status returned by FW
> + */
> +static int mei_late_bind_push_config(struct device *dev, u32 type, u32 flags,
> +				     const void *payload, size_t payload_size)

Why do static functions need kerneldoc formatting?

> +{
> +	struct mei_cl_device *cldev;
> +	struct csc_heci_late_bind_req *req = NULL;
> +	struct csc_heci_late_bind_rsp rsp;
> +	size_t req_size;
> +	ssize_t ret;
> +
> +	if (!dev || !payload || !payload_size)
> +		return -EINVAL;

How can any of these ever happen as you control the callers of this
function?


> +
> +	cldev = to_mei_cl_device(dev);
> +
> +	ret = mei_cldev_enable(cldev);
> +	if (ret < 0) {

You mean:
	if (ret)
right?


> +		dev_dbg(dev, "mei_cldev_enable failed. %zd\n", ret);

Why display the error again if this failed?  The caller already did
that.

And the function returns an int, not a ssize_t, didn't the compiler
complain?

thanks,

greg k-h
