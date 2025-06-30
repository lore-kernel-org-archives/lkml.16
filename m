Received: from pf-012.whm.fr-par.scw.cloud (pf-012.whm.fr-par.scw.cloud [51.159.173.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369D923A987;
	Mon, 30 Jun 2025 11:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.173.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751282433; cv=none; b=O8Ig+F8+bpI26doO30f/9VBQAlWoO3ZXVETyqebFNKP2dzhaMSvQQdAyhRy47xxY58OHykcRME7BAANjO7oZ8RdafSNR675KYsCEbNuXuJD3OM/bUkGe/Bq7IdkLqyhEIZr6fkuGmLn/v+KAyGrBySzvyWSBvnA2ucgKrKiBXj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751282433; c=relaxed/simple;
	bh=u6TyST1O6sLfXgME/6iOt5qbLcnLAXTbTrK6u6YEUyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WFx1U8fx18v44s4n69mSgTMQPUYA1d+YhbmvG3xeEmQxvyS402u27TXQntIDfbp1rO7UsSILSvIsqqrGgcu8cgcEHkTuVQ+Hc5OZb1ahQOsP5hJwLStEIn1zD9w86Uu9CQTeV8Xws5nWZJ7diLNIDK1tRFXWivumIZew+54G0lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr; spf=pass smtp.mailfrom=oss.cyber.gouv.fr; dkim=pass (2048-bit key) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.b=T8meQ8gB; arc=none smtp.client-ip=51.159.173.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.b="T8meQ8gB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=oss.cyber.gouv.fr; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ftJmJGzI0hZauI2PKPhMk+JAhZgtSsK0USUL7TOt/jk=; b=T8meQ8gBe2fB79ptreBSc8E8Tv
	J8WArTjYTnVU+1teeJ0Pkz1FNh7upzNeLtx0T+Xuu7TzLzJjBE9mNQPtmsoLF3/3go3coSE8iZUg5
	xm9N0n1UBGb62a572eQHMOHfwLIp1VCNx7wPvKhm27udH4en6CEcHmLxCsIbpjkYxtFnpFtNwNPAV
	5nhRuaeFE8UXxitVzIv7SSfTOTaUaR79I6Jtv9NRCQCRYjinWkT7f7mtavBl3bUiuogfyUBlYeRmL
	ntiPxAF8M7Jp702nPSEsh9TPnhgKWasuMWGR8ULx3l96gF588A4YTMBTxyL0e1H0OETd/0AuUVM3C
	OtsctmCw==;
Received: from laubervilliers-658-1-215-187.w90-63.abo.wanadoo.fr ([90.63.246.187]:55544 helo=[10.224.8.110])
	by pf-012.whm.fr-par.scw.cloud with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <nicolas.bouchinet@oss.cyber.gouv.fr>)
	id 1uWCYm-0000000Gvoj-220P;
	Mon, 30 Jun 2025 13:20:28 +0200
Message-ID: <8cc10112-23a7-41af-b81f-7fc0c097d34d@oss.cyber.gouv.fr>
Date: Mon, 30 Jun 2025 13:20:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/4] usb: core: Plug the usb authentication capability
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
 <20250620-usb_authentication-v1-3-0d92261a5779@ssi.gouv.fr>
 <1a85b3c3-66e1-4a31-ad39-391b03393bf9@rowland.harvard.edu>
Content-Language: en-US
From: Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>
In-Reply-To: <1a85b3c3-66e1-4a31-ad39-391b03393bf9@rowland.harvard.edu>
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

Hi Alan,

Thank you very much for your review. We will take every form remarks into
account in the next patch version.

On 6/20/25 21:11, Alan Stern wrote:
> On Fri, Jun 20, 2025 at 04:27:18PM +0200, nicolas.bouchinet@oss.cyber.gouv.fr wrote:
>> From: Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>
>>
>> Plugs the usb authentication implementation in the usb stack and more
>> particularly in the usb_parse_configuration function after the BOS has
>> been parsed and the usb authentication capacity has been controlled.
>>
>> The authentication bulk is implemented by the usb_authenticate_device
>> function.
>>
>> The authorization decision enforcement is done via the authorized field of
>> the usb_device and the associated authorization and deauthorization functions.
>> The usb_device also contains an authenticated field that could be used to track
>> the result of the authentication process and allow for more complex security
>> policy: the user could manually authorize a device that failed the
>> authentication or manually deauthorize a device that was previously
>> authenticated.
>>
>> The usb_authenticate_device returns 0 or an error code. If 0 is
>> returned, the authorized and authenticated fields of the usb_device are
>> updated with the result of the authentication.
>>
>> Co-developed-by: Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>
>> Signed-off-by: Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>
>> Signed-off-by: Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>
>> ---
> Here are some more stylistic suggestions, similar to what Greg said.
>
>> @@ -824,7 +825,50 @@ static int usb_parse_configuration(struct usb_device *dev, int cfgidx,
>>   		kref_init(&intfc->ref);
>>   	}
>>   
>> -	/* FIXME: parse the BOS descriptor */
>> +	/* If device USB version is above 2.0, get BOS descriptor */
>> +	/*
>> +	 * Requirement for bcdUSB >= 2.10 is defined in USB 3.2 §9.2.6.6
>> +	 * "Devices with a value of at least 0210H in the bcdUSB field of their
>> +	 * device descriptor shall support GetDescriptor (BOS Descriptor) requests."
>> +	 *
>> +	 * To discuss, BOS request could be also sent for bcdUSB >= 0x0201
>> +	 */
>> +	// Set a default value for authenticated at true in order not to block devices
>> +	// that do not support the authentication
> It looks really weird to see three comment blocks, in three different
> styles, right next to each other.  In the kernel, we avoid C++-style //
> comments.  And two adjacent /**/-style comments would normally be
> separated by a blank line or just merged into one bigger comment.
>
>> +	dev->authenticated = 1;
>> +
>> +	if (le16_to_cpu(dev->descriptor.bcdUSB) >= 0x0201) {
>> +		pr_notice("bcdUSB >= 0x0201\n");
>> +		retval = usb_get_bos_descriptor(dev);
>> +		if (!retval) {
>> +			pr_notice("found BOS\n");
>> +#ifdef CONFIG_USB_AUTHENTICATION
>> +			if (dev->bos->authent_cap) {
>> +				/* If authentication cap is present, start device authent */
>> +				pr_notice("found Authent BOS\n");
>> +				retval = usb_authenticate_device(dev);
>> +				if (retval != 0) {
>> +					pr_err("failed to authenticate the device: %d\n",
>> +					       retval);
>> +				} else if (!dev->authenticated) {
>> +					pr_notice("device has been rejected\n");
>> +					// return early from the configuration process
>> +					return 0;
> Do these two cases need to be handled separately?  Regardless of whether
> the function call fails, or succeeds but gives a negative result,
> shouldn't the end result be the same?
>
>> +				} else {
>> +					pr_notice("device has been authorized\n");
>> +				}
> Be careful not to mix up the two separate notions of authentication and
> authorization.  It's already difficult to keep them straight, because
> the words are so similar.


You are right indeed.

We moved the `usb_authenticate_dev()` call in `usb_new_device()` in 
order to
perform the authentication only once the device configuration is 
complete. Also
we think we need to split the problem of handling the authentication vs
authorization in two parts.

- which component has authority to set the two fields ?
- where/how is it enforced ?

To answer the first question :

- We think that the authenticated field can only be set by the
`usb_authenticate_dev()` function.

- it is less clear for the authorized status which is already 
manipulated by
the sysfs (usbguard) and the default hcd policy.

The reconciliation between the two fields could be done at the enforcement
point. In `usb_probe_interface()` instead of simply checking the 
authorized flag
it could check a more complex policy. For example:

+-------------------+----------------------------------------+----------------+ 

|                   | authorized                             | not 
authorized |
+-------------------+----------------------------------------+----------------+ 

| authenticated     | OK                                     | NOK       
      |
+-------------------+----------------------------------------+----------------+ 

| not authenticated | Depends on tolerance in local security 
|                |
|                   | policy (set by cmdline or sysctl)      | NOK      
       |
+-------------------+----------------------------------------+----------------+ 


This way it would also help to handle internal devices. When 
`hcd->dev_policy` is
set to USB_DEVICE_AUTHORIZE_INTERNAL, only internal devices are 
authorized by
default on connection. So external devices will have to be authenticated 
and
then authorized via the sysfs. Internal devices will be authorized and not
authenticated.

>
>> +			} else {
>> +				// USB authentication unsupported
>> +				// Apply security policy on failed devices
>> +				pr_notice("no authentication capability\n");
>> +			}
>> +#endif
> We generally prefer to avoid #if or #ifdef blocks inside function
> definitions, if at all possible.  In this case, you could define a
> separate function usb_handle_bos_authent() (or whatever you want to call
> it) that does this work, all inside a #ifdef block, along with a #else
> section that defines usb_handle_bos_authent() to be an inline empty
> function.
>
>> +		} else {
>> +			// Older USB version, authentication not supported
>> +			// Apply security policy on failed devices
>> +			pr_notice("device does not have a BOS descriptor\n");
>> +		}
>> +	}
>>   
>>   	/* Skip over any Class Specific or Vendor Specific descriptors;
>>   	 * find the first interface descriptor */
>> @@ -1051,6 +1095,7 @@ int usb_get_bos_descriptor(struct usb_device *dev)
>>   	length = bos->bLength;
>>   	total_len = le16_to_cpu(bos->wTotalLength);
>>   	num = bos->bNumDeviceCaps;
>> +
> Patches shouldn't make extraneous whitespace changes to existing code.
>
>>   	kfree(bos);
>>   	if (total_len < length)
>>   		return -EINVAL;
>> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
>> index 0e1dd6ef60a719f59a22d86caeb20f86991b5b29..753e55155ea34a7739b5f530dad429534e60842d 100644
>> --- a/drivers/usb/core/hub.c
>> +++ b/drivers/usb/core/hub.c
>> @@ -2640,6 +2640,12 @@ int usb_new_device(struct usb_device *udev)
>>   	udev->dev.devt = MKDEV(USB_DEVICE_MAJOR,
>>   			(((udev->bus->busnum-1) * 128) + (udev->devnum-1)));
>>   
>> +	// TODO: Check the device state, we want to avoid semi-initialized device to userspace.
>> +	if (!udev->authenticated) {
>> +		// If the device is not authenticated, abort the procedure
>> +		goto fail;
> A comment that simply repeats what the code already says is not very
> useful.  Such comments do exist here and there (I'm guilty of adding
> some of them myself), but in general they should be avoided.
>
>> diff --git a/include/linux/usb.h b/include/linux/usb.h
>> index b46738701f8dc46085f251379873b6a8a008d99d..e9037c8120b43556f8610f9acb3ad4129e847b98 100644
>> --- a/include/linux/usb.h
>> +++ b/include/linux/usb.h
>> @@ -431,6 +431,8 @@ struct usb_host_bos {
>>   	struct usb_ssp_cap_descriptor	*ssp_cap;
>>   	struct usb_ss_container_id_descriptor	*ss_id;
>>   	struct usb_ptm_cap_descriptor	*ptm_cap;
>> +	/* Authentication capability */
>> +	struct usb_authent_cap_descriptor *authent_cap;
> None of the other entries here have a comment like this.  Why does the
> new entry need one?
>
> Alan Stern
