Received: from pf-012.whm.fr-par.scw.cloud (pf-012.whm.fr-par.scw.cloud [51.159.173.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53D028A701;
	Mon, 30 Jun 2025 12:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.173.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751287098; cv=none; b=tOGeWSzd4jXvNeWjyqt7G2AV3HY0fu7cY58ZDnPyg+YXWttKVtpnmSmJQsx0u2OqTA9yV5B2moc0qJzijaeBhJUH+tycVh2cjIb/C1RxzYyNCLDCap1fCIhCNNucT/PKaFnQBtLZlb8YFd2cUeU77fyOYwNMtLik9741e+G5a1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751287098; c=relaxed/simple;
	bh=Gbu8i1eh6M5heNOkxAVxaz60Hdci3B5fWg6UDtGzEts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XMiUmZ/w7UloiwwR0kA6IZTYkrS+nLQJHhUfa1cmeXAnHMvClARt0cYad4NbB51/bD7dxRm0kQoUcEZnYaz7oz05ksDgap5a9nXTG9H6mjAg1GABj0CeyykfgwAB0Jl4xxtSsR043ygB8R1NyAia7cdNDKv0ekokEA4izPIs8hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr; spf=pass smtp.mailfrom=oss.cyber.gouv.fr; dkim=pass (2048-bit key) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.b=OCnzfRIY; arc=none smtp.client-ip=51.159.173.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.b="OCnzfRIY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=oss.cyber.gouv.fr; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=a/SvZhLDiw2GqeYM8RNajhdtaQZwGKHObQAt3Q8rsB8=; b=OCnzfRIY+7LnTN4JaSLJmnY0LG
	bbTQQikXnOMvvvzY7epQfVq1U9FSZKYET9kTdPC7ZhfDPDkTfG+UyJmmtQ4PJY4Z/TRAeRm4QV2Px
	NWu6awHQXcLCJnDF8t3UC4JHCNn7ecbRrfT9CsJkH71TEHEvwNDnNTJGShRYmd8ltPRPqjpREez7j
	LpWVvyZdSnD4vFtPjs8b/On7v16+1Iihe0Xt+14e3mqHGuTxUQwkLHkwVfxQ+SgdhOXsQY7ia/xNV
	ue8NAFWS6I9u9B91RpAzLHGul6bbkxANkqJwMsyhQwAypEiyvz19nvrTqmNkZRIM7eL5TX+GWP9px
	i8dXjVTA==;
Received: from laubervilliers-658-1-215-187.w90-63.abo.wanadoo.fr ([90.63.246.187]:39897 helo=[10.224.8.110])
	by pf-012.whm.fr-par.scw.cloud with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <nicolas.bouchinet@oss.cyber.gouv.fr>)
	id 1uWDm2-00000000RTw-0Bb0;
	Mon, 30 Jun 2025 14:38:14 +0200
Message-ID: <9af9cff1-9f23-48d5-adc2-53e438b68da2@oss.cyber.gouv.fr>
Date: Mon, 30 Jun 2025 14:38:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/4] usb: core: Introduce usb authentication feature
To: Oliver Neukum <oneukum@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
 <e028a659-9535-4cf9-92c1-373f72fae3cf@suse.com>
Content-Language: en-US
From: Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>
In-Reply-To: <e028a659-9535-4cf9-92c1-373f72fae3cf@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Olivier,

Thanks for the remarks on the style. We will take them into account in 
the next
patch version.

We started to include endianess conversion function but tests are still 
ongoing
with a physical device to ensure everything works as it should.

On 6/25/25 11:59, Oliver Neukum wrote:
>
>
> On 20.06.25 16:27, nicolas.bouchinet@oss.cyber.gouv.fr wrote:
>
>> +/**
>> + * usb_authent_req_digest - Check if device is known via its digest
>> + * @dev:        [in]  pointer to the usb device to query
>> + * @buffer:     [inout] buffer to hold request data
>> + * @digest:     [out] device digest
>> + *
>> + * Context: task context, might sleep.
>> + *
>> + * This function sends a digest request to the usb device.
>> + *
>> + * Possible errors:
>> + *  - ECOMM : failed to send or received a message to the device
>> + *  - EINVAL : if buffer or mask is NULL
>> + *
>> + * Return: If successful, zero. Otherwise, a negative  error number.
>> + */
>> +static int usb_authent_req_digest(struct usb_device *dev, uint8_t 
>> *const buffer,
>
> How can buffer be const if it is used for output?
Here, const operates on the left value which is the pointer, hence, the 
address
is constant, not the value pointed by the pointer.
>
> [..]
>> +struct usb_auth_cert_req {
>> +    uint16_t offset;
>> +    uint16_t length;
>> +} __packed;
>
> Endianness?
>
>
>> +/**
>> + * usb_authent_read_certificate - Read a device certificate
>> + * @dev:        [in] pointer to the usb device to query
>> + * @buffer:        [inout] buffer to hold request data, caller 
>> allocated
>> + * @slot:        [in] certificate chain to be read
>> + * @cert_der:   [out] buffer to hold received certificate chain
>> + * @cert_len:   [out] length of received certificate
>> + *
>> + * Context: task context, might sleep.
>> + *
>> + * Possible errors:
>> + *  - EINVAL : NULL pointer or invalid slot value
>> + *  - ECOMM  : failed to send request to device
>> + *  - ENOMEM : failed to allocate memory for certificate
>> + *
>> + * Return: If successful, zero. Otherwise, a negative  error number.
>> + */
>> +static int usb_authent_read_certificate(struct usb_device *dev, 
>> uint8_t *const buffer,
>> +                    uint8_t slot, uint8_t **cert_der, size_t *cert_len)
>> +{
>> +    uint16_t read_offset = 0;
>> +    uint16_t read_length = 0;
>> +    uint8_t chain_part[64] = { 0 };
>> +
>> +    if (unlikely(slot >= 8 || buffer == NULL || cert_der == NULL || 
>> cert_len == NULL)) {
>> +        pr_err("invalid arguments\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    // First request to get certificate chain length
>> +    if (usb_auth_read_cert_part(dev, buffer, slot, 0,
>> +                    USB_AUTH_CHAIN_HEADER_SIZE,
>> +                    chain_part) != 0) {
>> +        pr_err("Failed to get first certificate part\n");
>> +        return -ECOMM;
>> +    }
>> +
>> +    // Extract total length
>> +    *cert_len = ((uint16_t *)chain_part)[0];
>
> Endianness
>
>
>> +
>> +/**
>> + * usb_authent_challenge_dev - Challenge a device
>> + * @dev:                [in] pointer to the usb device to query
>> + * @buffer:            [in] pointer to the buffer allocated for USB 
>> query
>> + * @slot:                [in] certificate chain to be used
>> + * @slot_mask:    [in] slot mask of the device
>> + * @nonce:            [in] nonce to use for the challenge, 32 bytes 
>> long
>> + * @chall:            [out] buffer for chall response, 204 bytes 
>> long, caller allocated
>> + *
>> + * Context: task context, might sleep.
>> + *
>> + * Possible errors:
>> + *  - EINVAL : NULL input pointer or invalid slot value
>> + *  - ECOMM  : failed to send or receive message from the device
>> + *
>> + * Return: If successful, zero. Otherwise, a negative  error number.
>> + */
>> +static int usb_authent_challenge_dev(struct usb_device *dev, uint8_t 
>> *buffer,
>> +    const uint8_t slot, const uint8_t slot_mask, const uint8_t 
>> *const nonce,
>> +    uint8_t *const chall)
>> +{
>> +    int ret = -1;
>> +
>> +    if (unlikely(buffer == NULL || slot >= 8 || nonce == NULL)) {
>> +        pr_err("invalid arguments\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    // AUTH OUT challenge request transfer
>> +    memcpy(buffer, nonce, 32);
>> +    ret = usb_control_msg(dev, usb_sndctrlpipe(dev, 0), AUTH_OUT,
>> +                  USB_DIR_OUT,
>> +                  (USB_SECURITY_PROTOCOL_VERSION << 8) +
>> +                      USB_AUTHENT_CHALLENGE_REQ_TYPE,
>> +                  (slot << 8), buffer, 32, USB_CTRL_GET_TIMEOUT);
>> +    if (ret < 0) {
>> +        pr_err("Failed to send challenge request: %d\n", ret);
>> +        ret = -ECOMM;
>> +        goto cleanup;
>> +    }
>> +
>> +    // Complete the challenge with the request
>> +    chall[1] = USB_SECURITY_PROTOCOL_VERSION;
>> +    chall[0] = USB_AUTHENT_CHALLENGE_REQ_TYPE;
>> +    chall[2] = slot;
>> +    chall[3] = 0x00;
>> +    memcpy(chall+4, nonce, 32);
>
> This may be worth a definition.
>> +
>> +    // AUTH IN challenge response transfer
>> +    ret = usb_control_msg(dev, usb_rcvctrlpipe(dev, 0), AUTH_IN, 
>> USB_DIR_IN,
>> +                  (USB_SECURITY_PROTOCOL_VERSION << 8) +
>> +                      USB_AUTHENT_CHALLENGE_RESP_TYPE,
>> +                  (slot << 8) + slot_mask, buffer, 168,
>> +                  USB_CTRL_GET_TIMEOUT);
>> +    if (ret < 0) {
>> +        pr_err("Failed to get challenge response: %d\n", ret);
>> +        ret = -ECOMM;
>> +        goto cleanup;
>> +    }
>> +
>> +    pr_notice("received challenge response\n");
>> +
>> +    // Complete last part of the challenge with what is returned by 
>> the device
>> +    memcpy(chall+USB_AUTH_CHAIN_HEADER_SIZE, buffer, 168);
>
> The 168 comes whence?
>
>> +
>> +    ret = 0;
>> +
>> +cleanup:
>> +
>> +    return ret;
>> +}
>
>
>> +/**
>> + * @brief Check that the authentication can resume after a sleep
>> + *
>> + * @param [in] dev : the usb device
>> + * @param [in] hub : the parent hub
>> + *
>> + * Possible error codes:
>> + *  - ENODEV : hub has been disconnected
>> + *
>> + * @return 0 if possible to resume, else an error code
>> + */
>> +static int usb_auth_try_resume(struct usb_device *dev, struct 
>> usb_device *hub)
>> +{
>> +    // Test if the hub or the device has been disconnected
>> +    if (unlikely(hub == NULL || dev == NULL ||
>> +             dev->port_is_suspended == 1 ||
>> +             dev->reset_in_progress == 1)) {
>> +        return -ENODEV;
>> +    }
>> +
>> +    // TODO: test if the device has not been disconnected
>> +    // TODO: test if the device has not been disconnected then 
>> replaced with another one
>> +
>> +    return 0;
>> +}
>> +
>> +/**
>> + * usb_authenticate_device - Challenge a device
>> + * @dev:        [inout] pointer to device
>> + *
>> + * Context: task context, might sleep.
>> + *
>> + * Authentication is done in the following steps:
>> + *  1. Get device certificates digest to determine if it is already 
>> known
>> + *       if yes, go to 3.
>> + *  2. Get device certificates
>> + *  3. Challenge device
>> + *  4. Based on previous result, determine if device is allowed 
>> under local
>> + *     security policy.
>> + *
>> + * Possible error code:
>> + *  - ENOMEM : failed to allocate memory for exchange
>> + *  - TODO: complete all possible error case
>> + *
>> + * Return: If successful, zero. Otherwise, a negative  error number.
>> + */
>> +int usb_authenticate_device(struct usb_device *dev)
>> +{
>> +    int ret = 0;
>> +
>> +    uint8_t is_valid = 0;
>> +    uint8_t is_known = 0;
>> +    uint8_t is_blocked = 0;
>> +    uint8_t chain_nb = 0;
>> +    uint8_t slot_mask = 0;
>> +    uint8_t slot = 0;
>> +    uint8_t digests[256] = { 0 };
>> +    uint8_t nonce[32] = {0};
>> +    uint8_t chall[204] = {0};
>> +    uint32_t dev_id = 0;
>> +    size_t ctx_size = 0;
>> +    int i = 0;
>> +
>> +    uint8_t *cert_der = NULL;
>> +    size_t cert_len = 0;
>> +
>> +    if (unlikely(dev == NULL || dev->parent == NULL))
>> +        return -ENODEV;
>> +
>> +    struct usb_device *hub = dev->parent;
>> +
>> +    // By default set authorization status at false
>> +    dev->authorized = 0;
>> +    dev->authenticated = 0;
>> +
>> +    uint8_t *buffer = NULL;
>> +    // Buffer to hold responses
>> +    buffer = kzalloc(512, GFP_KERNEL);
>
> Should this not be cached for comparison after resume?
>
>     Regards
>         Oliver
>
