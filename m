Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD5C27E06D;
	Fri, 20 Jun 2025 14:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750431271; cv=none; b=IKa5GLQOGI5bHPOzWUgI7HnK7GRM1985QWK2yCX1CNvFpm/p7L70wNUlA0MFttUKaH0EokRlolHmHfVO65tx0Ea24uH6H08Wio+BMOTCAZBs2/YW+rMgtZTwEt0GN1SfdU8wG+oDNxFdMoPDbi5MMXEdG1eL9AnKBi1ni++oPcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750431271; c=relaxed/simple;
	bh=2lQ3H1t6+IN+7snjljZ9bQpsGdJOcZIe4RxA3UQstrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NPDwvKq7QcJevPz2YEWoCscXsDFrEgwZCcs2mniltQx+Ta6fp8MbifXPWSZw0WXwKr/8rvqQfdiYaF6iVp55yGd9XF+uA9UHUHw9qQnVtqS5uErJ17aV4dxYh1XqpUShA51X5gZhUt+KABqVQxvYYHSkSGeLQbJeO/AIpWl48W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tx0+Mufu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tx0+Mufu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93A8FC4CEE3;
	Fri, 20 Jun 2025 14:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750431271;
	bh=2lQ3H1t6+IN+7snjljZ9bQpsGdJOcZIe4RxA3UQstrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tx0+Mufuzq1sVt+Blo8kgoP9ETj8PphYr9ucL1jeurZO5sYHBCghVqs6J2W4QcxHZ
	 fu/THVoIBYXBvO7RDklmks7AV0ihuZZq7LeEjAjZAYif3/Vh7IRwwtUGAlFffhc942
	 W4hHegzafNPDL2eVkIsgz+PpwY4rfXMkYBMaehhI=
Date: Fri, 20 Jun 2025 16:54:28 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: nicolas.bouchinet@oss.cyber.gouv.fr
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
Message-ID: <2025062059-dangling-coping-1e17@gregkh>
References: <20250620-usb_authentication-v1-0-0d92261a5779@ssi.gouv.fr>
 <20250620-usb_authentication-v1-2-0d92261a5779@ssi.gouv.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620-usb_authentication-v1-2-0d92261a5779@ssi.gouv.fr>

First off, thanks so much for doing this work, I've been wondering if
anyone would ever do it :)

Just a few quick review comments that you might want to do for the next
round of your patches for some basic style things:

On Fri, Jun 20, 2025 at 04:27:17PM +0200, nicolas.bouchinet@oss.cyber.gouv.fr wrote:
> +#include <linux/types.h>
> +#include <linux/usb.h>
> +#include <linux/usb/ch9.h>
> +#include <linux/usb/hcd.h>
> +#include <linux/usb/quirks.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/device.h>
> +#include <linux/delay.h>
> +#include <asm/byteorder.h>
> +
> +#include "authent_netlink.h"
> +
> +#include "authent.h"

No need for the blank lines there.

> +static int usb_authent_req_digest(struct usb_device *dev, uint8_t *const buffer,
> +				  uint8_t digest[256], uint8_t *mask)
> +{
> +	int ret = 0;
> +	struct usb_authent_digest_resp *digest_resp = NULL;
> +
> +	if (unlikely((buffer == NULL || mask == NULL))) {
> +		pr_err("invalid arguments\n");
> +		return -EINVAL;
> +	}
> +	ret = usb_control_msg(dev, usb_rcvctrlpipe(dev, 0), AUTH_IN, USB_DIR_IN,
> +			      (USB_SECURITY_PROTOCOL_VERSION << 8) +
> +				      USB_AUTHENT_DIGEST_REQ_TYPE,
> +			      0, buffer, 260, USB_CTRL_GET_TIMEOUT);
> +	if (ret < 0) {
> +		pr_err("Failed to get digest: %d\n", ret);
> +		ret = -ECOMM;
> +		goto exit;
> +	}
> +
> +	// Parse received digest response
> +	digest_resp = (struct usb_authent_digest_resp *)buffer;
> +	pr_notice("received digest response:\n");
> +	pr_notice("	protocolVersion: %x\n", digest_resp->protocolVersion);
> +	pr_notice("	messageType: %x\n", digest_resp->messageType);
> +	pr_notice("	capability: %x\n", digest_resp->capability);
> +	pr_notice("	slotMask: %x\n", digest_resp->slotMask);

Always use the dev_*() macros instead of pr_*() ones as that way you
know what device is making the message please.

> +
> +	*mask = digest_resp->slotMask;
> +	memcpy(digest, digest_resp->digests, 256);
> +
> +	ret = 0;
> +
> +exit:
> +
> +	return ret;
> +}
> +
> +struct usb_auth_cert_req {
> +	uint16_t offset;
> +	uint16_t length;
> +} __packed;

Kernel types are u16, not uint16_t.  The uint*_t types are from
userspace C code, not kernel code.  Yes, they are slowly sliding in in
places, but let's not do that unless really required for some specific
reason.

And why packed?

And what about endian issues, the data from the devices should be in a
specific format, right?


> +
> +/**
> + * @brief Request a specific part of a certificate chain from the device

Are you sure this is proper kerneldoc style?  Does this build properly?

> + *
> + * Context: task context, might sleep
> + *
> + * Possible errors:
> + *  - ECOMM : failed to send or receive a message to the device
> + *  - EINVAL : if buffer or cert_part is NULL
> + *
> + * @param [in]     dev       : handle to the USB device
> + * @param [in,out] buffer    : buffer used for communication, caller allocated
> + * @param [in]     slot      : slot in which to read the certificate
> + * @param [in]     offset    : at which the certificate fragment must be read
> + * @param [in]     length    : of the certificate fragment to read
> + * @param [out]    cert_part : buffer to hold the fragment, caller allocated

Again, I don't think this is kerneldoc format.  Please build the kernel
documentation output and see what this results in.

> + *
> + * @return 0 on SUCCESS else an error code
> + */
> +static int usb_auth_read_cert_part(struct usb_device *dev, uint8_t *const buffer,
> +				   const uint8_t slot, const uint16_t offset,
> +				   const uint16_t length, uint8_t *cert_part)
> +{
> +	struct usb_auth_cert_req cert_req = { 0 };
> +	int ret = -1;

Use real error values, not random integers :)

> +
> +	if (unlikely(buffer == NULL || cert_part == NULL)) {

Only use likely/unlikely if you can measure the speed difference.  For
USB, and probe sequences, that will never be the casae.

> +		pr_err("invalid argument\n");

Again, dev_err()?

But how can these parameters not be set properly?  You control how they
are called, no need to always verify that you wrote the code properly :)

> +		return -EINVAL;
> +	}
> +
> +	cert_req.offset = offset;
> +	cert_req.length = length;
> +
> +	// AUTH OUT request transfer
> +	memcpy(buffer, &cert_req, sizeof(struct usb_auth_cert_req));
> +	ret = usb_control_msg(dev, usb_sndctrlpipe(dev, 0), AUTH_OUT,
> +			      USB_DIR_OUT,
> +			      (USB_SECURITY_PROTOCOL_VERSION << 8) +
> +				      USB_AUTHENT_CERTIFICATE_REQ_TYPE,
> +			      (slot << 8), buffer,
> +			      sizeof(struct usb_auth_cert_req),
> +			      USB_CTRL_GET_TIMEOUT);
> +	if (ret < 0) {
> +		pr_err("Failed to send certificate request: %d\n", ret);
> +		ret = -ECOMM;
> +		goto cleanup;
> +	}
> +
> +	// AUTH IN certificate read
> +	ret = usb_control_msg(dev, usb_rcvctrlpipe(dev, 0), AUTH_IN, USB_DIR_IN,
> +			      (USB_SECURITY_PROTOCOL_VERSION << 8) +
> +				      USB_AUTHENT_CERTIFICATE_RESP_TYPE,
> +			      (slot << 8), buffer, length + 4,
> +			      USB_CTRL_GET_TIMEOUT);
> +	if (ret < 0) {
> +		pr_notice("Failed to get certificate from peripheral: %d\n", ret);
> +		ret = -ECOMM;
> +		goto cleanup;
> +	}
> +
> +	// TODO: parse received header
> +	memcpy(cert_part, buffer + 4, length);
> +
> +	ret = 0;
> +
> +cleanup:
> +
> +	return ret;

As "cleanup:" does nothing, no need for it, just return the error value
above when you were doing a goto line.

> +}
> +
> +/**
> + * usb_authent_read_certificate - Read a device certificate
> + * @dev:		[in] pointer to the usb device to query
> + * @buffer:		[inout] buffer to hold request data, caller allocated
> + * @slot:		[in] certificate chain to be read
> + * @cert_der:   [out] buffer to hold received certificate chain
> + * @cert_len:   [out] length of received certificate
> + *
> + * Context: task context, might sleep.
> + *
> + * Possible errors:
> + *  - EINVAL : NULL pointer or invalid slot value
> + *  - ECOMM  : failed to send request to device
> + *  - ENOMEM : failed to allocate memory for certificate
> + *
> + * Return: If successful, zero. Otherwise, a negative  error number.
> + */
> +static int usb_authent_read_certificate(struct usb_device *dev, uint8_t *const buffer,
> +					uint8_t slot, uint8_t **cert_der, size_t *cert_len)
> +{
> +	uint16_t read_offset = 0;
> +	uint16_t read_length = 0;
> +	uint8_t chain_part[64] = { 0 };

Again, u16 and u8 please.

thanks,

greg k-h
