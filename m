Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D253204C0F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743517489; cv=none; b=MccqiubWU79CeDpdg/yy3nEKWQ653ul0z/sNvzwKE9ud01h+v49ZUE7FidJZ7EgquOeDWMuoZwWmnrZCYSOH4IFnbWs99zOB0iXzit7i5ECAUg0zLHjPp/rJeuwQ1al0t/nC23Rqt/WjfCm7+IxZ3GoXD15TQA8R39g+r3BOFek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743517489; c=relaxed/simple;
	bh=ruRQP+NALzlaps2YWcoiJXAJEk0o6bPMKOX1fg7yeVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fTYCtBzF1efT1pTiu0GZfy1+j22BbZcpZQUaF5irVg6Z5DgdgZ5z1vZ719lVqdK34aoDCis4kPRBB0Ov6OnwhQ9xjrE9C4DK2bHALWRe/cue8fkUFAnmawTJq/p9ERvMycBQ8+kMCpM0uAl4MghzBo9kCz1g+h1ctn+vi7Qm/l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=M75HErG7; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="M75HErG7"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6e8f43c1fa0so66224426d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 07:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1743517484; x=1744122284; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KalA4225oBl3ZvNYyeXZv8udkfU/6CXUOgPRtBpVF98=;
        b=M75HErG7nlQueEr/I5yNgtPRsq7Dbop8Rp8hB3KzqRncY4IUY5IWdMOyv5edBrRv/S
         nD5VejQGsw3BAujgvlnJzS7bvtEFeF00T69B4IgRLWWD6GeiVzagfFhNSMkTvrHRbZz6
         bdD4lSaoVlsr0ynDBlrsFJEDW7zuiJu/7PdUG/KPgeiOZiBOw3BZGNxlhrzBKrHkxiM2
         o3vf0hpt05fFt3Hyih3f9jqO7WrTSJdeFOPttxaW3SURz2AqXtJaRlCh3BWkjhDz0P11
         gCWlBamIAnK3g9ACfgyVDud1EW3ukShDQ6flyyLZ/Jj/pPtAvl7fAxti99aNe/JwOCLo
         zQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743517484; x=1744122284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KalA4225oBl3ZvNYyeXZv8udkfU/6CXUOgPRtBpVF98=;
        b=EniEPtiXTucRAOQklHv8iiDNRyN7ldD3UHfKR5rD2LqHLz3lvcAaNlTC+Yd4Xls7R8
         Co9bX53dLIk0SDE7iNyuIFrsUovqjFHi0x1zXImwWrBgUjRLKBKyKaDfWwQtz6C+25Sb
         YcYR9UFe+EOlOw8H5N8OHDosVzjks60Y/FP3ANoDy9OlctUSZLQNQO/Qywa6DB2ZgvKH
         dEYwDkHDSQe0EMf3ZzpLgQZBkVCLAkTqVNGyGmu8YEU3Bgct0b/Yar15UuAgNACcbKGc
         T9MVUHPZgxLEeHoyur+EkP/aW3EAqDRPjAMoeT2QF6/P7zbDHUq/UFqsBXXrk35E5z78
         mFiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAnBL+9U50epebGDza9uR0lRDYnhcQZg2F4nSjcrER+w0rMnek+quRQktqaSS06mVeFWbSOceyaGkqzgc=@vger.kernel.org
X-Gm-Message-State: AOJu0YypL8xOX9KefQdD/a3oFhWXX3S6R9T9UqXuOVLubnOm4R99ghOG
	K2nnSenS9HdIxOpp7KHLvanA44tixbwX6kWCrJ3e+/HVispzCZq/IPXH7mbp8A==
X-Gm-Gg: ASbGncsE4gjnzRRcdggxriwyuLDZbCq2nEKmJaDfUiVADHCdw8/TbOpUxyYS0iLSDWH
	Wk90j5kEIIQZqYLhgDmKMxtl6LahXqWUHUl4dzjUP8F0UiKqVpk53eIKc7A4suPLJEOhjMXVYcW
	KZlomYoA3Yq8pi7qANL+asyo8Dqjd5k/hVncJ3JPnhTZM0FpXBg0dV3IdRVwgnQ6cnaE7iPhxFE
	TsGkoGzppyi9XfwT1SCngy+RiJrRcJ/S0SyJJ5i288m9JD5wVmfmGd+mBY0zuEAnr2Efnn/0h0k
	yvzVIUu99673AZ++pYbM9+vgFZPLcoI2IjnWAPHyK39/IIc5UD/UXLia6HNTS1E=
X-Google-Smtp-Source: AGHT+IHM51nyniYqK5T/X7rJ6xKvSn4u9N4XA6OP1lkcVAxyNAwhavhEPDkoCbRJzJPfgL1uJjnDug==
X-Received: by 2002:a05:6214:202c:b0:6ee:ba5b:d8d1 with SMTP id 6a1803df08f44-6eed61c3606mr265124296d6.16.1743517484138;
        Tue, 01 Apr 2025 07:24:44 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f76824d5sm663280885a.30.2025.04.01.07.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 07:24:43 -0700 (PDT)
Date: Tue, 1 Apr 2025 10:24:41 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Guan-Yu Lin <guanyulin@google.com>
Cc: gregkh@linuxfoundation.org, mathias.nyman@intel.com,
	sumit.garg@kernel.org, kekrby@gmail.com,
	jeff.johnson@oss.qualcomm.com, elder@kernel.org,
	quic_zijuhu@quicinc.com, ben@decadent.org.uk,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/4] usb: add apis for offload usage tracking
Message-ID: <fd54ab58-1357-462a-8e3f-a785f7b56813@rowland.harvard.edu>
References: <20250401062951.3180871-1-guanyulin@google.com>
 <20250401062951.3180871-3-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401062951.3180871-3-guanyulin@google.com>

On Tue, Apr 01, 2025 at 06:22:40AM +0000, Guan-Yu Lin wrote:
> Introduce offload_usage and corresponding apis to track offload usage
> on each USB device. Offload denotes that there is another co-processor
> accessing the USB device via the same USB host controller. To optimize
> power usage, it's essential to monitor whether the USB device is
> actively used by other co-processor. This information is vital when
> determining if a USB device can be safely suspended during system power
> state transitions.
> 
> Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
> ---

> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -2036,6 +2036,114 @@ int usb_disable_usb2_hardware_lpm(struct usb_device *udev)
>  
>  #endif /* CONFIG_PM */
>  
> +#if IS_ENABLED(CONFIG_USB_XHCI_SIDEBAND_SUSPEND)
> +
> +/**
> + * usb_offload_get - increment the offload_usage of a USB device
> + * @udev: the USB device to increment its offload_usage
> + *
> + * Incrementing the offload_usage of a usb_device indicates that offload is
> + * enabled on this usb_device; that is, another entity is actively handling USB
> + * transfers. This information allows the USB driver to adjust its power
> + * management policy based on offload activity.
> + *
> + * The caller must hold @udev's device lock.
> + *
> + * Return: 0 on success. A negative error code otherwise.
> + */
> +int usb_offload_get(struct usb_device *udev)
> +{
> +	int ret;
> +
> +	if (udev->state == USB_STATE_NOTATTACHED ||
> +			udev->state == USB_STATE_SUSPENDED)
> +		return -EAGAIN;
> +
> +	/*
> +	 * offload_usage could only be modified when the device is active, since
> +	 * it will alter the suspend flow of the device.
> +	 */
> +	ret = pm_runtime_resume_and_get(&udev->dev);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	refcount_inc(&udev->offload_usage);
> +	pm_runtime_put_sync(&udev->dev);

The USB subsystem has wrappers: usb_autoresume_device() and 
usb_autosuspend_device().  You should use them instead of calling the 
runtime PM routines directly.

The same advice applies to usb_offload_put().

Alan Stern
