Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E12929A0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 14:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744208036; cv=none; b=hHa0iRFdFuvVBVXAMVHCxL8u3bYAFupAgzKi2I4cho/8kHxj4+cMldldAm2FILyPpqRazQoBYW+MLoUTeq6Nyrah1nBRRz04gYeptliCH/WoQ9tn9jj8f9AFV02LlWjK37qE4o2HUNQXdejtTMyg51SpVzWFwMRC4RPfSMTFIRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744208036; c=relaxed/simple;
	bh=7bkA2PczaPTcw0z3byoPrLp7tlZRN3KvmPFdWqUAqgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MkJ+6fHIRBRsf6x19i3ov42FJzMi5YpWfcEedjAVHJJ/l0M5BIDdEGtLF+lKeePES9ffN+M6BM7flSLePpvrR24cwe+ahOHXEG5aJVbt/xasl6+ya5LkWye+GXu0EEj9mdIoXUAWo3co/Idirdq0rZUhGH1wx8Q9dcJXal8az7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=lh7ZM+ND; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="lh7ZM+ND"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6ecfc2cb1aaso68384126d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 07:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1744208034; x=1744812834; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zQjwsYxVJm6WPlt0A+NzAOPHsz05ZTBWq46FyQQsT1s=;
        b=lh7ZM+NDOAQ70u00IxwM+qZ1G6OVBJeLDZbV2VpMLBRwtjpC3ktKmbnD4UxSks/l5n
         6JSuOzQ4bGIX7TG60LmQsHjM3LZIIK3Z3mSqtn+XN7/k4ImTG2OtoD0EGKj1y6bpfcrp
         jadWcifmjT5+17t09cAZsGmguU4sW2OvYmb0+w6Y+/wi4TL+/fhgLRnGyekqlbxyA8m2
         teUPDCw52LSqMWNJNICQkCJxFhdFrEWtPzI09kdXeAlA8HGi3DwcEdxb4fTpDNquHI2P
         bg93hm6K4Iza9SFZaQkey2YyNo/1d+nGxQ5sZCFipS5Uzzepsr4i5FbNKvVWC9VIp1oq
         ZUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744208034; x=1744812834;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zQjwsYxVJm6WPlt0A+NzAOPHsz05ZTBWq46FyQQsT1s=;
        b=RjBDpeeWmNv9rnQ/ee0JrAkffssOMXzqedUZSVIBveO2vtnWjJFsDCeQUXeRUGK4HX
         BT7GtRYk+nSWe6c0jn3JSbUl+fkV82Nqz58iWSuTDA6qJTPn3sl4+zDxFxo1N6RMKg7e
         lsMGnwccpFe0G14FTkrTlcslE1ZFK4hkeAFrWKwccmIuiii86o7fk4Snuy+EEXNVS0GU
         qb8lS3vK548wVEql27KnRhfBTWgPWCl/Fs+7VKyhcKRauVMQ/hOSZokc7vDcO1abBZzO
         o+AYKrZ2ZkkNR00tmghDRKcdyBmDRdZU4wbawHSRsZFCsM1NFVjwVhP6f0L5b290JSZc
         A9ug==
X-Forwarded-Encrypted: i=1; AJvYcCUufbWs4YAxU0tieuCyVkTpPKOsF6zWXSXpVCteeNVAqZHnjtCiAsgPP41b/pMTRis8rtHE3/vHc18gLYU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgnf5WS7EKgL5zbQOUhMaoVaK2wB/+46PrjujJGvuXuO3Ls9Fn
	RjmzJ4gSU5WE9LtD3knfWIw2n+zkefA8Fvqf49kA2IAHNPli2wTbXz8DaP5BCw==
X-Gm-Gg: ASbGncuCx/wZpM6C+bacn33m4uv3eiZIuMBO5ffUhjNh3wLUTp648bGaSModHFwojlK
	xxQwnA9GWPcNzOxPO3woC7V+4Mefu8Im6lVE6q0wJbsUNsvv6mXNBm4I/p54UgegsCCLJ/QxOl8
	ssMD/fQgUaMxuQVoWNp8IHhlgHniYdTIkGGrixor2zafxhSMDjkNc4mCHEu5bSX1dztUo6I25Zf
	xU6dNMiDF30x+DPAFT7PP8ou/ON8HQQZRDe0pnG8ilYOSRXOIlj3QKgtkhZkFtNwxyI1EQOWLff
	aiHi5X5QFN9xpd7IvaT7ppVOW+L6ymewATD7a+jztpIGOnrB778gKdU7AL4=
X-Google-Smtp-Source: AGHT+IEn5i/ww2ov8S9+SncAFdHf/8G9GrLcjiA/zurVR3NAzYNFqmty70schbmVP4rbv+d1JkRWNQ==
X-Received: by 2002:a05:6214:2b49:b0:6f0:e2d4:5936 with SMTP id 6a1803df08f44-6f0e2d45a61mr9825496d6.22.1744208033895;
        Wed, 09 Apr 2025 07:13:53 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f0de970e72sm7782556d6.36.2025.04.09.07.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 07:13:53 -0700 (PDT)
Date: Wed, 9 Apr 2025 10:13:50 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: =?utf-8?Q?Micha=C5=82?= Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>, linux-usb@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC RFT] usb: hcd: Add a usb_device argument to
 hc_driver.endpoint_reset()
Message-ID: <657969a0-08c1-431a-b459-089c6d316a0f@rowland.harvard.edu>
References: <20250406002311.2a76fc64@foxbook>
 <ade0d77a-651a-4b03-bf21-00369fdc22f8@rowland.harvard.edu>
 <20250406095008.0dbfd586@foxbook>
 <20250406175032.12b7d284@foxbook>
 <14197657-0a0f-45a8-ac36-dd37b16a1565@rowland.harvard.edu>
 <20250407074905.2d236fb9@foxbook>
 <3efb52b8-0974-4125-a344-00f459fbe4e4@rowland.harvard.edu>
 <20250408121817.6ae8defd@foxbook>
 <357368ff-0c49-4f22-a03d-fd9560c22dae@linux.intel.com>
 <20250409121819.64db23a0@foxbook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250409121819.64db23a0@foxbook>

On Wed, Apr 09, 2025 at 12:18:19PM +0200, Michał Pecio wrote:
> On Tue, 8 Apr 2025 16:55:24 +0300, Mathias Nyman wrote:
> > 1. driver->reset_device will free all xhci endpoint rings, and lose
> > td_list head, but keep cancelled_td_list and ep->ep_state flags. xHC
> > issues reset device command setting all internal ep states in xci to
> > "disabled".
> > 
> > 2. usb hcd_alloc_bandwith will drop+add xhci endpoints for this
> > configuration, allocate new endpoint rings, and inits new td_list
> > head. Old cancelled_td_list and ep_state flags are still set, not
> > matching ring.
> > 
> > 3. usb_disable_interface() will flush all pending URBs calling
> > xhci_urb_dequeue(). xhci_urb_dequeue() makes decision based on stale
> > ep_state flags. May start to cancel/giveback urbs in old
> > cancelled_td_list for tds that existed on old freed ring. will also
> > set host_ep->hcpriv to null
> > 
> > 4. usb_enable_interface() calls xhci_endpoint_reset() that finally
> > clears the EP_STALLED flag (udev now found thanks to this patch)
> > 
> > Disabling endpoints, like calling usb_disable_interface() in step 3
> > should be done before calling  usb_hcd_alloc_bandwith().
> > This was fixed in other places such as usb_set_interface() and
> > usb_reset_config()
> 
> I haven't thought about it, but you are right. This means that my
> commit message is wrong to suggest that the problem occurs after
> altsetting changes, it is apparently unique to device reset case.
> 
> > We might need to clean up ep_state flags and give back cancelled URBs
> > in xhci_discover_or_reset_device() after the reset device xhci
> > command completion.
> 
> I guess it wouldn't be strictly necessary if core flushed all endpoints
> before resetting. I frankly always assumed that it does so, because it
> also makes sense for other HCDs which don't even define reset_device().
> 
> There seems to be nothing stopping them from talking to a device while
> it is undergoing a reset and re-configuration, seems a little risky
> given that HW isn't exactly free of its own bugs.

The core does not explicitly flush endpoints before resetting a device.  
However, it does notify the class drivers' pre_reset callback, which is 
supposed to unlink all the URBs used by that driver.  If a driver 
doesn't have a pre_reset callback, the core unbinds it from the device 
(which will unlink all its URBs).  _If_ everything is working properly, 
there shouldn't be any outstanding URBs when the reset takes place.

Either way, though, the core doesn't invoke the HCD's endpoint_reset or 
endpoint_disable callback before the reset.  If you think the core needs 
to do more, or needs to issue the callbacks in a different order, let me 
know.

Alan Stern

> Speaking of xhci, I wonder if this could also be responsible for some
> xHC crashes during enumeration. I recall that those Etron quirk patches
> mentioned events for a disabled endpoint and "HC died" in some cases.
> 
> Regards,
> Michal
