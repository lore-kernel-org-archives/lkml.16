Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1705325E44E;
	Mon, 30 Jun 2025 11:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751283789; cv=none; b=iD7dy8+i93MzWALQ6XUPdnkr6mz+wL5dB380V6MCJdF1KRD/RzLe+Tp/KMxxIDlMAuBdKJjioTiDBUt3KR48ucYjZyn6uXitJYsGGFl50YxuTcVT7iTaLZX8SBZC7x+QqcgBpIZv3kRET+DABNUGFCeh4LXwVY+nVH3yvOEfEMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751283789; c=relaxed/simple;
	bh=tg/sWro/raNuItuq7zdWvexi6gvxBCgZDU8NADM9O38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XlLQFU3jzsgSLeI+W9D+RlBdHl/9aXZEf4D6/ypzpC91gPNlKPR++fhqHxuhZvtsix0DSZ7JB4Hf2cdLMu131PK3BtfCLHoX5SeuQ00BLh4t4B8SrVS0kRULNkwnanaTPIBArEfEF0AGYp/EjrOVgwHghopQnOv8mTYcZyRyvQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=orIUEKU/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="orIUEKU/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAB9FC4CEE3;
	Mon, 30 Jun 2025 11:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751283788;
	bh=tg/sWro/raNuItuq7zdWvexi6gvxBCgZDU8NADM9O38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=orIUEKU/lgZzTLAtqcJxKtotLzxaD9d4/aaDgHv/SFr3674kUolQx3FBiclO0UjQ2
	 ChPZpdOLehFlSCKcbk6h30GXyZcrD2bTUFYwrdOh7s7QDC/K5QbkoRBemBewwyI0Hf
	 9Sa2dt2Fs8LKR8I0291HMHUon1jQwSxE/RbusUMo=
Date: Mon, 30 Jun 2025 13:43:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Kannappan R <r.kannappan@intel.com>,
	Sabyrzhan Tasbolatov <snovitoll@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Pawel Laszczak <pawell@cadence.com>, Ma Ke <make_ruc2021@163.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>,
	Luc Bonnafoux <luc.bonnafoux@oss.cyber.gouv.fr>,
	Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [RFC PATCH 2/4] usb: core: Introduce usb authentication feature
Message-ID: <2025063051-yelp-brim-d2d6@gregkh>
References: <20250620-usb_authentication-v1-0-0d92261a5779@ssi.gouv.fr>
 <20250620-usb_authentication-v1-2-0d92261a5779@ssi.gouv.fr>
 <2025062059-dangling-coping-1e17@gregkh>
 <16140d2c-1d44-400b-93de-2216013f017f@oss.cyber.gouv.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16140d2c-1d44-400b-93de-2216013f017f@oss.cyber.gouv.fr>

On Mon, Jun 30, 2025 at 01:07:29PM +0200, Nicolas Bouchinet wrote:
> Hi Greg,
> 
> Thank you very much for your review. We will take every style remarks into
> account in the next patch version. Other responses are inline (there is only
> one):
> 
> On 6/20/25 16:54, Greg Kroah-Hartman wrote:
> > First off, thanks so much for doing this work, I've been wondering if
> > anyone would ever do it :)
> > 
> > Just a few quick review comments that you might want to do for the next
> > round of your patches for some basic style things:
> > 
> > On Fri, Jun 20, 2025 at 04:27:17PM +0200, nicolas.bouchinet@oss.cyber.gouv.fr wrote:
> > > +#include <linux/types.h>
> > > +#include <linux/usb.h>
> > > +#include <linux/usb/ch9.h>
> > > +#include <linux/usb/hcd.h>
> > > +#include <linux/usb/quirks.h>
> > > +#include <linux/module.h>
> > > +#include <linux/slab.h>
> > > +#include <linux/device.h>
> > > +#include <linux/delay.h>
> > > +#include <asm/byteorder.h>
> > > +
> > > +#include "authent_netlink.h"
> > > +
> > > +#include "authent.h"
> > No need for the blank lines there.
> > 
> > > +static int usb_authent_req_digest(struct usb_device *dev, uint8_t *const buffer,
> > > +				  uint8_t digest[256], uint8_t *mask)
> > > +{
> > > +	int ret = 0;
> > > +	struct usb_authent_digest_resp *digest_resp = NULL;
> > > +
> > > +	if (unlikely((buffer == NULL || mask == NULL))) {
> > > +		pr_err("invalid arguments\n");
> > > +		return -EINVAL;
> > > +	}
> > > +	ret = usb_control_msg(dev, usb_rcvctrlpipe(dev, 0), AUTH_IN, USB_DIR_IN,
> > > +			      (USB_SECURITY_PROTOCOL_VERSION << 8) +
> > > +				      USB_AUTHENT_DIGEST_REQ_TYPE,
> > > +			      0, buffer, 260, USB_CTRL_GET_TIMEOUT);
> > > +	if (ret < 0) {
> > > +		pr_err("Failed to get digest: %d\n", ret);
> > > +		ret = -ECOMM;
> > > +		goto exit;
> > > +	}
> > > +
> > > +	// Parse received digest response
> > > +	digest_resp = (struct usb_authent_digest_resp *)buffer;
> > > +	pr_notice("received digest response:\n");
> > > +	pr_notice("	protocolVersion: %x\n", digest_resp->protocolVersion);
> > > +	pr_notice("	messageType: %x\n", digest_resp->messageType);
> > > +	pr_notice("	capability: %x\n", digest_resp->capability);
> > > +	pr_notice("	slotMask: %x\n", digest_resp->slotMask);
> > Always use the dev_*() macros instead of pr_*() ones as that way you
> > know what device is making the message please.
> > 
> > > +
> > > +	*mask = digest_resp->slotMask;
> > > +	memcpy(digest, digest_resp->digests, 256);
> > > +
> > > +	ret = 0;
> > > +
> > > +exit:
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +struct usb_auth_cert_req {
> > > +	uint16_t offset;
> > > +	uint16_t length;
> > > +} __packed;
> > Kernel types are u16, not uint16_t.  The uint*_t types are from
> > userspace C code, not kernel code.  Yes, they are slowly sliding in in
> > places, but let's not do that unless really required for some specific
> > reason.
> > 
> > And why packed?
> 
> Since this structure is part of the usb authentication protocol, we need to
> be
> sure it is sent as is on the usb bus.

Great, then properly document it as such please.  Ideally in a header
file as we have tried to document all the USB messages in ch9.h where
defined.

thanks,

greg k-h
