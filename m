Received: from pf-012.whm.fr-par.scw.cloud (pf-012.whm.fr-par.scw.cloud [51.159.173.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E8E126BF7;
	Mon, 30 Jun 2025 11:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.173.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751281662; cv=none; b=WKKmdJFDtD657soDG+JE6oQpZcGpgxzyfbPmxk6cddkCSOUa8TK2ku/zwHHITJgZ/XqLHSaKNIONu4LzndUlljJfzZ76y59mC5HEfgB8YqQ8uFuOV60yQC7YR6JwvuKe7S+MwHZfYvprd/r8ELyCv+xMuh5+fKMLuliZlXIpytw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751281662; c=relaxed/simple;
	bh=xfYoCknVjFKY7hexB2crz0/hJFMyOF7Z5INvKQpVLWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S1OG3xka8YmTH6w2adwH+ZOYB7KXvmqTMEpOXk5x2P9Y7xXR5uWSmwM3wYvFTfRZVHm164i/xSLHuvrM+0dRNOnoffpwISMckloHsU0dCyuHQ3vjNlaF4AYoxpuOXumooIRVqNunoM+8U9u0VD+LQWCb6pYaZpSohsMSCELKyUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr; spf=pass smtp.mailfrom=oss.cyber.gouv.fr; dkim=pass (2048-bit key) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.b=l/TK0w2p; arc=none smtp.client-ip=51.159.173.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.b="l/TK0w2p"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=oss.cyber.gouv.fr; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1tzNfrRTiSp2dVKABoPLLSFxhEriDVBQdVTSGrooIoY=; b=l/TK0w2pB3thTidPAS/qeRu30Q
	w4/YrRy0CKBHYe8brbCLEXLqsjHJy/I9uvFWt/tA+1pSxfgho16tSV2RXx6wVyYH4rycEBWW1LdJ0
	vUiE+ZsNQp8wfCd8DJ9mcnyR8w4aFx/5UDdUxTiZ8+6yDZbK+YpJPc7MxKeBbKj4Lof4HeSRxFU8C
	jxXC3HSqnSUXxOapSCg6RZc/DpzlzeseTkwj1HC4nRj4qXPYhCnUIUUgWsOcxJEzqhZOcQzZyJOls
	xejwJrt5UsOVUuQ/irF6ElVO/yrHB0QxjiSs0yGiTdgh6mNxzp4X2Q5H5Fs47ctRnAeYvvQJvdFCG
	8BC7eQeg==;
Received: from laubervilliers-658-1-215-187.w90-63.abo.wanadoo.fr ([90.63.246.187]:20395 helo=[10.224.8.110])
	by pf-012.whm.fr-par.scw.cloud with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <nicolas.bouchinet@oss.cyber.gouv.fr>)
	id 1uWCMF-0000000GqVZ-0eZI;
	Mon, 30 Jun 2025 13:07:31 +0200
Message-ID: <16140d2c-1d44-400b-93de-2216013f017f@oss.cyber.gouv.fr>
Date: Mon, 30 Jun 2025 13:07:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/4] usb: core: Introduce usb authentication feature
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Kannappan R <r.kannappan@intel.com>,
 Sabyrzhan Tasbolatov <snovitoll@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 Thomas Gleixner <tglx@linutronix.de>, Pawel Laszczak <pawell@cadence.com>,
 Ma Ke <make_ruc2021@163.com>, Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>,
 Luc Bonnafoux <luc.bonnafoux@oss.cyber.gouv.fr>,
 Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250620-usb_authentication-v1-0-0d92261a5779@ssi.gouv.fr>
 <20250620-usb_authentication-v1-2-0d92261a5779@ssi.gouv.fr>
 <2025062059-dangling-coping-1e17@gregkh>
Content-Language: en-US
From: Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>
In-Reply-To: <2025062059-dangling-coping-1e17@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - pf-012.whm.fr-par.scw.cloud
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - oss.cyber.gouv.fr
X-Get-Message-Sender-Via: pf-012.whm.fr-par.scw.cloud: authenticated_id: nicolas.bouchinet@oss.cyber.gouv.fr
X-Authenticated-Sender: pf-012.whm.fr-par.scw.cloud: nicolas.bouchinet@oss.cyber.gouv.fr
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hi Greg,

Thank you very much for your review. We will take every style remarks into
account in the next patch version. Other responses are inline (there is 
only one):

On 6/20/25 16:54, Greg Kroah-Hartman wrote:
> First off, thanks so much for doing this work, I've been wondering if
> anyone would ever do it :)
>
> Just a few quick review comments that you might want to do for the next
> round of your patches for some basic style things:
>
> On Fri, Jun 20, 2025 at 04:27:17PM +0200, nicolas.bouchinet@oss.cyber.gouv.fr wrote:
>> +#include <linux/types.h>
>> +#include <linux/usb.h>
>> +#include <linux/usb/ch9.h>
>> +#include <linux/usb/hcd.h>
>> +#include <linux/usb/quirks.h>
>> +#include <linux/module.h>
>> +#include <linux/slab.h>
>> +#include <linux/device.h>
>> +#include <linux/delay.h>
>> +#include <asm/byteorder.h>
>> +
>> +#include "authent_netlink.h"
>> +
>> +#include "authent.h"
> No need for the blank lines there.
>
>> +static int usb_authent_req_digest(struct usb_device *dev, uint8_t *const buffer,
>> +				  uint8_t digest[256], uint8_t *mask)
>> +{
>> +	int ret = 0;
>> +	struct usb_authent_digest_resp *digest_resp = NULL;
>> +
>> +	if (unlikely((buffer == NULL || mask == NULL))) {
>> +		pr_err("invalid arguments\n");
>> +		return -EINVAL;
>> +	}
>> +	ret = usb_control_msg(dev, usb_rcvctrlpipe(dev, 0), AUTH_IN, USB_DIR_IN,
>> +			      (USB_SECURITY_PROTOCOL_VERSION << 8) +
>> +				      USB_AUTHENT_DIGEST_REQ_TYPE,
>> +			      0, buffer, 260, USB_CTRL_GET_TIMEOUT);
>> +	if (ret < 0) {
>> +		pr_err("Failed to get digest: %d\n", ret);
>> +		ret = -ECOMM;
>> +		goto exit;
>> +	}
>> +
>> +	// Parse received digest response
>> +	digest_resp = (struct usb_authent_digest_resp *)buffer;
>> +	pr_notice("received digest response:\n");
>> +	pr_notice("	protocolVersion: %x\n", digest_resp->protocolVersion);
>> +	pr_notice("	messageType: %x\n", digest_resp->messageType);
>> +	pr_notice("	capability: %x\n", digest_resp->capability);
>> +	pr_notice("	slotMask: %x\n", digest_resp->slotMask);
> Always use the dev_*() macros instead of pr_*() ones as that way you
> know what device is making the message please.
>
>> +
>> +	*mask = digest_resp->slotMask;
>> +	memcpy(digest, digest_resp->digests, 256);
>> +
>> +	ret = 0;
>> +
>> +exit:
>> +
>> +	return ret;
>> +}
>> +
>> +struct usb_auth_cert_req {
>> +	uint16_t offset;
>> +	uint16_t length;
>> +} __packed;
> Kernel types are u16, not uint16_t.  The uint*_t types are from
> userspace C code, not kernel code.  Yes, they are slowly sliding in in
> places, but let's not do that unless really required for some specific
> reason.
>
> And why packed?

Since this structure is part of the usb authentication protocol, we need 
to be
sure it is sent as is on the usb bus.

>
> And what about endian issues, the data from the devices should be in a
> specific format, right?
>
>
>> +
>> +/**
>> + * @brief Request a specific part of a certificate chain from the device
> Are you sure this is proper kerneldoc style?  Does this build properly?
>
>> + *
>> + * Context: task context, might sleep
>> + *
>> + * Possible errors:
>> + *  - ECOMM : failed to send or receive a message to the device
>> + *  - EINVAL : if buffer or cert_part is NULL
>> + *
>> + * @param [in]     dev       : handle to the USB device
>> + * @param [in,out] buffer    : buffer used for communication, caller allocated
>> + * @param [in]     slot      : slot in which to read the certificate
>> + * @param [in]     offset    : at which the certificate fragment must be read
>> + * @param [in]     length    : of the certificate fragment to read
>> + * @param [out]    cert_part : buffer to hold the fragment, caller allocated
> Again, I don't think this is kerneldoc format.  Please build the kernel
> documentation output and see what this results in.
>
>> + *
>> + * @return 0 on SUCCESS else an error code
>> + */
>> +static int usb_auth_read_cert_part(struct usb_device *dev, uint8_t *const buffer,
>> +				   const uint8_t slot, const uint16_t offset,
>> +				   const uint16_t length, uint8_t *cert_part)
>> +{
>> +	struct usb_auth_cert_req cert_req = { 0 };
>> +	int ret = -1;
> Use real error values, not random integers :)
>
>> +
>> +	if (unlikely(buffer == NULL || cert_part == NULL)) {
> Only use likely/unlikely if you can measure the speed difference.  For
> USB, and probe sequences, that will never be the casae.
>
>> +		pr_err("invalid argument\n");
> Again, dev_err()?
>
> But how can these parameters not be set properly?  You control how they
> are called, no need to always verify that you wrote the code properly :)
>
>> +		return -EINVAL;
>> +	}
>> +
>> +	cert_req.offset = offset;
>> +	cert_req.length = length;
>> +
>> +	// AUTH OUT request transfer
>> +	memcpy(buffer, &cert_req, sizeof(struct usb_auth_cert_req));
>> +	ret = usb_control_msg(dev, usb_sndctrlpipe(dev, 0), AUTH_OUT,
>> +			      USB_DIR_OUT,
>> +			      (USB_SECURITY_PROTOCOL_VERSION << 8) +
>> +				      USB_AUTHENT_CERTIFICATE_REQ_TYPE,
>> +			      (slot << 8), buffer,
>> +			      sizeof(struct usb_auth_cert_req),
>> +			      USB_CTRL_GET_TIMEOUT);
>> +	if (ret < 0) {
>> +		pr_err("Failed to send certificate request: %d\n", ret);
>> +		ret = -ECOMM;
>> +		goto cleanup;
>> +	}
>> +
>> +	// AUTH IN certificate read
>> +	ret = usb_control_msg(dev, usb_rcvctrlpipe(dev, 0), AUTH_IN, USB_DIR_IN,
>> +			      (USB_SECURITY_PROTOCOL_VERSION << 8) +
>> +				      USB_AUTHENT_CERTIFICATE_RESP_TYPE,
>> +			      (slot << 8), buffer, length + 4,
>> +			      USB_CTRL_GET_TIMEOUT);
>> +	if (ret < 0) {
>> +		pr_notice("Failed to get certificate from peripheral: %d\n", ret);
>> +		ret = -ECOMM;
>> +		goto cleanup;
>> +	}
>> +
>> +	// TODO: parse received header
>> +	memcpy(cert_part, buffer + 4, length);
>> +
>> +	ret = 0;
>> +
>> +cleanup:
>> +
>> +	return ret;
> As "cleanup:" does nothing, no need for it, just return the error value
> above when you were doing a goto line.
>
>> +}
>> +
>> +/**
>> + * usb_authent_read_certificate - Read a device certificate
>> + * @dev:		[in] pointer to the usb device to query
>> + * @buffer:		[inout] buffer to hold request data, caller allocated
>> + * @slot:		[in] certificate chain to be read
>> + * @cert_der:   [out] buffer to hold received certificate chain
>> + * @cert_len:   [out] length of received certificate
>> + *
>> + * Context: task context, might sleep.
>> + *
>> + * Possible errors:
>> + *  - EINVAL : NULL pointer or invalid slot value
>> + *  - ECOMM  : failed to send request to device
>> + *  - ENOMEM : failed to allocate memory for certificate
>> + *
>> + * Return: If successful, zero. Otherwise, a negative  error number.
>> + */
>> +static int usb_authent_read_certificate(struct usb_device *dev, uint8_t *const buffer,
>> +					uint8_t slot, uint8_t **cert_der, size_t *cert_len)
>> +{
>> +	uint16_t read_offset = 0;
>> +	uint16_t read_length = 0;
>> +	uint8_t chain_part[64] = { 0 };
> Again, u16 and u8 please.
>
> thanks,
>
> greg k-h
