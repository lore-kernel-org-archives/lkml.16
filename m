Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D2B76034
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 19:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750446703; cv=none; b=qQGqkCyVoMrraUqgY2lSgRueYlPW7si8dKIfSCC9do07v6GvIWRJaKLjv4udqaBw+0dcTMY4h1xz/vmUbr39kDoutZLltyOFk1BG0EBkfhAR8PqWVGBdBG95rIjWGreyj3Fd0q/wUnfNCj+DbGuDjvzUjbG7raZnEvPpH3MhKps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750446703; c=relaxed/simple;
	bh=F4IwHJMGBfw+4ScmW4uhiESU+x+bAVsK+vac6p9B2CY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fL9izyfPdbfho4SVqd710RAxDJgDmRM3LeEyyC0pK2dF/TJMJw/V4V4khadmpUYiM+Z/7NPompLUCwxLifUt5PZByYJQwuLas1N9oOTWKAYl1iSV16MZrqX9oB9tyT0NDGUwXo46td3k595+K8PFerFLtKVRruIgCrZdgyTqmpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=rhOZLNKi; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="rhOZLNKi"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7d3f1bd7121so211299185a.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 12:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1750446700; x=1751051500; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yhKCiEZjGstvrS5HDtUBggg/g+PhxNdKRETqsLLrRj8=;
        b=rhOZLNKila3vxHcp4Xoy2xg0hmaNiwwpwZYHWU4pSChih6x6lcAj5i+khDzhsj8pJL
         nLg8aCZd+NK+lrkuSZhtHOtJNsBlLsJtP0nN127FV9rtNOu3/DUrnlH27LcLbbG09ySD
         QB2I/HMH7A1VVX2zfw0zhWed7KYX/HRoIjoXlDyAlGy7/2LGTuzXfizR20jNtMMasa1N
         WL3AihQMkkyeRVtBqGBny+6J3YNeuZNbZiQJ4sngqVS5akMhdnFHf6r4k74qmBiCW1n/
         9O+puQNLV2/cb+/1fLdAul5PnG1VLstTy7A5MXnEv0uQtLInoPt3qTlS7eAJwOvLCZqG
         OK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750446700; x=1751051500;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yhKCiEZjGstvrS5HDtUBggg/g+PhxNdKRETqsLLrRj8=;
        b=GPeuy6mmOQk/2huREciffoGV6FGxa3B3Q7c7VzlSQBjQFMuDM3vgC8OrdaOe50tGyg
         ln+yDPGat5Sw6o9xMl21+dE+D4bAZOHfleyVnnydfLdDem2+c3YJXAKnmivEGuLe6nES
         HB40ib990kdRhDeR1gJwM3DDDTCvacoGGPXrkUImGyEyiD4YonVN55Kot26ufSPn98mw
         4BBfwS8CZCOh2MbmNjAdkf0L6q+MHVG2tuRt6Xu3u7HdYwI5iXvffvApq4MFdGSP/gc/
         Qq/aOuQO8J9kltyfhWm14azSv7otLefPMAstPGVdhmGjNhVFnngxtXrc3UUVmwmYeJ/d
         vKNA==
X-Forwarded-Encrypted: i=1; AJvYcCXQMH20CCaaGH9Sus0WU+NjQRFE4s+5wJ0CIsq1xEFw4e25YXNSJib2bBbrgfJf6PC4eM5Bcv9JSbj/MJU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5lnCcCsqXL04Cd+KYu1yyXTioaCGXS1DAoY0ICvFZX/kx2Clm
	cMrPITVUT1bKOJbbBp0CAoQ/W06LuXhOOgx4s9WGXge3ZQv/s2w7GiwFE5WzfdECeg==
X-Gm-Gg: ASbGncvMvxkO8rhxw5KqDOZtXPoDGiU97EAQjJqVxmgsePd5uofrYceU8hv8Wxoeja9
	nb9UIVeOC/m4NE7C7UoDKMlVEuNGPihGGmKHX9RFt3IrQmFnoS1vuAIWXD/uG/qcUzyfkW3c/Cr
	lYAxVHRqr+7V7GCDM/CtVOQVIoGt5Pc0wTi+1rxY7t4MB71UnWnu6dP2f3JUSG+zVNff3bNFR6z
	EnUZv1g7rBIY6+It8LHTDro/pQEouuqNENYngbfkZrXya5elnd0mAI0nj46dVo6eUy+dXVAIaE3
	8NxOoaQVfuQyqvKfb76hGZHQr1N/5rELNATmOhH9kvDAbpGrf9MT+B0nJtiKclOnUjS4MwDLEup
	XXwg9gqTt2dWt5Ia+VI3ePeCSgZU+TXZXL8dZCnRRsILaDbtCdBUsC9o=
X-Google-Smtp-Source: AGHT+IG98oaF+O8z76UDIfQuVsIvVHSBHDJUgTWNFZomYjv/iD5FyE6cNRPp5FMx3eChGDfalJ2gGg==
X-Received: by 2002:a05:620a:f12:b0:7d3:9260:6db0 with SMTP id af79cd13be357-7d3f98c4a7dmr535919585a.3.1750446700354;
        Fri, 20 Jun 2025 12:11:40 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-28.harvard-secure.wrls.harvard.edu. [65.112.8.28])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f9a0709esm121218085a.110.2025.06.20.12.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 12:11:39 -0700 (PDT)
Date: Fri, 20 Jun 2025 15:11:36 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: nicolas.bouchinet@oss.cyber.gouv.fr
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Subject: Re: [RFC PATCH 3/4] usb: core: Plug the usb authentication capability
Message-ID: <1a85b3c3-66e1-4a31-ad39-391b03393bf9@rowland.harvard.edu>
References: <20250620-usb_authentication-v1-0-0d92261a5779@ssi.gouv.fr>
 <20250620-usb_authentication-v1-3-0d92261a5779@ssi.gouv.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250620-usb_authentication-v1-3-0d92261a5779@ssi.gouv.fr>

On Fri, Jun 20, 2025 at 04:27:18PM +0200, nicolas.bouchinet@oss.cyber.gouv.fr wrote:
> From: Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>
> 
> Plugs the usb authentication implementation in the usb stack and more
> particularly in the usb_parse_configuration function after the BOS has
> been parsed and the usb authentication capacity has been controlled.
> 
> The authentication bulk is implemented by the usb_authenticate_device
> function.
> 
> The authorization decision enforcement is done via the authorized field of
> the usb_device and the associated authorization and deauthorization functions.
> The usb_device also contains an authenticated field that could be used to track
> the result of the authentication process and allow for more complex security
> policy: the user could manually authorize a device that failed the
> authentication or manually deauthorize a device that was previously
> authenticated.
> 
> The usb_authenticate_device returns 0 or an error code. If 0 is
> returned, the authorized and authenticated fields of the usb_device are
> updated with the result of the authentication.
> 
> Co-developed-by: Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>
> Signed-off-by: Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>
> Signed-off-by: Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>
> ---

Here are some more stylistic suggestions, similar to what Greg said.

> @@ -824,7 +825,50 @@ static int usb_parse_configuration(struct usb_device *dev, int cfgidx,
>  		kref_init(&intfc->ref);
>  	}
>  
> -	/* FIXME: parse the BOS descriptor */
> +	/* If device USB version is above 2.0, get BOS descriptor */
> +	/*
> +	 * Requirement for bcdUSB >= 2.10 is defined in USB 3.2 §9.2.6.6
> +	 * "Devices with a value of at least 0210H in the bcdUSB field of their
> +	 * device descriptor shall support GetDescriptor (BOS Descriptor) requests."
> +	 *
> +	 * To discuss, BOS request could be also sent for bcdUSB >= 0x0201
> +	 */
> +	// Set a default value for authenticated at true in order not to block devices
> +	// that do not support the authentication

It looks really weird to see three comment blocks, in three different 
styles, right next to each other.  In the kernel, we avoid C++-style // 
comments.  And two adjacent /**/-style comments would normally be 
separated by a blank line or just merged into one bigger comment.

> +	dev->authenticated = 1;
> +
> +	if (le16_to_cpu(dev->descriptor.bcdUSB) >= 0x0201) {
> +		pr_notice("bcdUSB >= 0x0201\n");
> +		retval = usb_get_bos_descriptor(dev);
> +		if (!retval) {
> +			pr_notice("found BOS\n");
> +#ifdef CONFIG_USB_AUTHENTICATION
> +			if (dev->bos->authent_cap) {
> +				/* If authentication cap is present, start device authent */
> +				pr_notice("found Authent BOS\n");
> +				retval = usb_authenticate_device(dev);
> +				if (retval != 0) {
> +					pr_err("failed to authenticate the device: %d\n",
> +					       retval);
> +				} else if (!dev->authenticated) {
> +					pr_notice("device has been rejected\n");
> +					// return early from the configuration process
> +					return 0;

Do these two cases need to be handled separately?  Regardless of whether 
the function call fails, or succeeds but gives a negative result, 
shouldn't the end result be the same?

> +				} else {
> +					pr_notice("device has been authorized\n");
> +				}

Be careful not to mix up the two separate notions of authentication and 
authorization.  It's already difficult to keep them straight, because 
the words are so similar.

> +			} else {
> +				// USB authentication unsupported
> +				// Apply security policy on failed devices
> +				pr_notice("no authentication capability\n");
> +			}
> +#endif

We generally prefer to avoid #if or #ifdef blocks inside function 
definitions, if at all possible.  In this case, you could define a 
separate function usb_handle_bos_authent() (or whatever you want to call 
it) that does this work, all inside a #ifdef block, along with a #else 
section that defines usb_handle_bos_authent() to be an inline empty 
function.

> +		} else {
> +			// Older USB version, authentication not supported
> +			// Apply security policy on failed devices
> +			pr_notice("device does not have a BOS descriptor\n");
> +		}
> +	}
>  
>  	/* Skip over any Class Specific or Vendor Specific descriptors;
>  	 * find the first interface descriptor */
> @@ -1051,6 +1095,7 @@ int usb_get_bos_descriptor(struct usb_device *dev)
>  	length = bos->bLength;
>  	total_len = le16_to_cpu(bos->wTotalLength);
>  	num = bos->bNumDeviceCaps;
> +

Patches shouldn't make extraneous whitespace changes to existing code.

>  	kfree(bos);
>  	if (total_len < length)
>  		return -EINVAL;

> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 0e1dd6ef60a719f59a22d86caeb20f86991b5b29..753e55155ea34a7739b5f530dad429534e60842d 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -2640,6 +2640,12 @@ int usb_new_device(struct usb_device *udev)
>  	udev->dev.devt = MKDEV(USB_DEVICE_MAJOR,
>  			(((udev->bus->busnum-1) * 128) + (udev->devnum-1)));
>  
> +	// TODO: Check the device state, we want to avoid semi-initialized device to userspace.
> +	if (!udev->authenticated) {
> +		// If the device is not authenticated, abort the procedure
> +		goto fail;

A comment that simply repeats what the code already says is not very 
useful.  Such comments do exist here and there (I'm guilty of adding 
some of them myself), but in general they should be avoided.

> diff --git a/include/linux/usb.h b/include/linux/usb.h
> index b46738701f8dc46085f251379873b6a8a008d99d..e9037c8120b43556f8610f9acb3ad4129e847b98 100644
> --- a/include/linux/usb.h
> +++ b/include/linux/usb.h
> @@ -431,6 +431,8 @@ struct usb_host_bos {
>  	struct usb_ssp_cap_descriptor	*ssp_cap;
>  	struct usb_ss_container_id_descriptor	*ss_id;
>  	struct usb_ptm_cap_descriptor	*ptm_cap;
> +	/* Authentication capability */
> +	struct usb_authent_cap_descriptor *authent_cap;

None of the other entries here have a comment like this.  Why does the 
new entry need one?

Alan Stern
