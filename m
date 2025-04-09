Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C761325D8E3;
	Wed,  9 Apr 2025 10:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744193907; cv=none; b=FUhmlh5C0nD9zPSvzfloOOYbZ35IZJvfn2/rcoC4NcHwYJeSxZzPle4mmxFKrPC3d7oxYkQTbWbvR/091HixEvP0wgU8DEJtqhuNE3XNyryBNfPOnxWNHOfpfbl4GUQGZOaPR2H2+gtU/apHm4Y8fwW1QlD22A1ckz66JqOZgv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744193907; c=relaxed/simple;
	bh=fC6Hu988itxJobHVjIyl2N25uYpfG2R9GTAajm0H80A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NLuUqx1QtSFetdKKzg2r4lfaL4J0Zp76FlGFmu/iyABik7lvzit7/vDsjSqE8BnRJXCEPkdoH2uY6j29cMEgs1ZU7bi6cQDl0m79XliyLusdsdPGcU4B4AS8DjhsRJLvNsKbLhOXTE40BwLI8aj2RG6RfjuDkirHMbhzgtYTLk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k0gaoH7q; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k0gaoH7q"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54acc04516cso7642108e87.1;
        Wed, 09 Apr 2025 03:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744193904; x=1744798704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zS7Ack0Y5Rf82PolP7CbpVR9ELTjfJ8a0j6nVSCIVEs=;
        b=k0gaoH7qREiwZzkd8i7o7sGkTIr2dQnG2DtxnEQ2xFyfVgfP8b8CiLL/5v9gtfQYzH
         VfSWK18rjSavheelDbzXy4JtA1+rKc0oY6ls4ZQIqpgP2+YXbtc0Dxde7QpJuqOalxdi
         sOp9kzgsl0gWqcdx1jJlji6O6/NlSaEkG0Xn1UL+5LA2t96qWsKRnzILNvf2N12EXNdI
         L8dotuNHc4I3EZM3Ibdf+JmOsjSvp4AVuww7BxIS+NAz8UJWU38QZiJPG5bMR0i56w0c
         49gtm1yDE4NHKeVJc9jyrx6Puqzt0vc2ugkc5cRrTVcgIONWNuaD7ww9xpp0DQT5uTSC
         cysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744193904; x=1744798704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zS7Ack0Y5Rf82PolP7CbpVR9ELTjfJ8a0j6nVSCIVEs=;
        b=euSNyQSRjAnzOIsWOVdeQ4QJrrawwmnYSjJp7tLdOj3b4/u8Hn52DCW9EeBkdlhDfJ
         NnTTz8hxZV2CgQfJ57/HhYYVtJpodU+DRnrJh73HXCkIhClvMB8r3yYbzC1Lpi/tBMhF
         o4QIBNRaYQoVMZ/bZylc+Y0buyEGi6OXopoilVurjw2x3si2ejZo9ffoCsiqZknHieAX
         2SejIx/OjWsS167hRw9ZhrscGZYBXoEZ5HHyri4htKFDMS62gWBHRg3DTWNYjqPriL1i
         MZGGICf39B0/AaTY0LywntG8JrQ6u/WWizC9WY1jRU7MOQ+OT/pz4cktL15W/gfYJxnA
         4qQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmpbVNas1umw/vQcbLdG2B9wyzMrXpRWWi7SYTtPalDPuUAfiYkHiG3KcPTWjkwny362ZSGDx9FFdY7TM=@vger.kernel.org, AJvYcCWJGfJ6QHFfCF45EqkrFXo8JYYevxIma38ykWhpdjFLYBlP3sTByjzZ7lx/efxga+5fmG9brEhOI4Yy@vger.kernel.org
X-Gm-Message-State: AOJu0YzJJ/8PpdKia79kskhCpCRfng7eeCzMp5rOVzoIdH3dnuRODzpI
	jBFYzgQaKgo86I5huU5tveKeqahdXP3RErwFr0yxa5hNt2W0sKLWl0XIxg==
X-Gm-Gg: ASbGncsDHufSBa2SEGJ07/+hXa9g+E7sZxnkuRZyfkgPUC0eQfF3Z4pTvKqYZhM2SuL
	EGmr8AVD+Ha1QHsbIyZhWcW/tDmBZDsKHb90tdnIc4T2qpmCz1zqfsWnIvzE6KGLg5bfkv2jX1O
	Tw+OYR8yeI4/mSTgwcmSZ9g4glj6oRzwZqZJCaF14bHxw63gDgIEtIV+5Vv2QLP9V3E7P8wg3oW
	zAjXLAMsXRvlDd1IUtt8jKblwsffQdnUFHbcF0/JnQDR1TtGDkURCxJ66vInHEkZF0QFz4l+LsP
	Kr9DI549a8+9Xhzuh+qv6TDKqt0G68uYNkA3chehRsq6ktgA9R+pzStLxYT8pGA3JCRM
X-Google-Smtp-Source: AGHT+IF56XODRGoGorCF28z0pxYiO8EdSzRH3NU1mlnYnutfK4P2r4ExRLOtmZ8IkLeM73uJyohhpw==
X-Received: by 2002:a05:651c:12c8:b0:30b:f924:3565 with SMTP id 38308e7fff4ca-30f438be86dmr7349781fa.37.1744193903460;
        Wed, 09 Apr 2025 03:18:23 -0700 (PDT)
Received: from foxbook (adtq195.neoplus.adsl.tpnet.pl. [79.185.228.195])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465d50fbsm1174151fa.80.2025.04.09.03.18.22
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 09 Apr 2025 03:18:23 -0700 (PDT)
Date: Wed, 9 Apr 2025 12:18:19 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, Mathias Nyman
 <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Menzel <pmenzel@molgen.mpg.de>, linux-usb@vger.kernel.org, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC RFT] usb: hcd: Add a usb_device argument to
 hc_driver.endpoint_reset()
Message-ID: <20250409121819.64db23a0@foxbook>
In-Reply-To: <357368ff-0c49-4f22-a03d-fd9560c22dae@linux.intel.com>
References: <c279bd85-3069-4841-b1be-20507ac9f2d7@molgen.mpg.de>
	<b356f743-44b5-4f48-a289-fae0afe106ff@linux.intel.com>
	<84b400f8-2943-44e0-8803-f3aac3b670af@molgen.mpg.de>
	<20250406002311.2a76fc64@foxbook>
	<ade0d77a-651a-4b03-bf21-00369fdc22f8@rowland.harvard.edu>
	<20250406095008.0dbfd586@foxbook>
	<20250406175032.12b7d284@foxbook>
	<14197657-0a0f-45a8-ac36-dd37b16a1565@rowland.harvard.edu>
	<20250407074905.2d236fb9@foxbook>
	<3efb52b8-0974-4125-a344-00f459fbe4e4@rowland.harvard.edu>
	<20250408121817.6ae8defd@foxbook>
	<357368ff-0c49-4f22-a03d-fd9560c22dae@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 8 Apr 2025 16:55:24 +0300, Mathias Nyman wrote:
> 1. driver->reset_device will free all xhci endpoint rings, and lose
> td_list head, but keep cancelled_td_list and ep->ep_state flags. xHC
> issues reset device command setting all internal ep states in xci to
> "disabled".
> 
> 2. usb hcd_alloc_bandwith will drop+add xhci endpoints for this
> configuration, allocate new endpoint rings, and inits new td_list
> head. Old cancelled_td_list and ep_state flags are still set, not
> matching ring.
> 
> 3. usb_disable_interface() will flush all pending URBs calling
> xhci_urb_dequeue(). xhci_urb_dequeue() makes decision based on stale
> ep_state flags. May start to cancel/giveback urbs in old
> cancelled_td_list for tds that existed on old freed ring. will also
> set host_ep->hcpriv to null
> 
> 4. usb_enable_interface() calls xhci_endpoint_reset() that finally
> clears the EP_STALLED flag (udev now found thanks to this patch)
> 
> Disabling endpoints, like calling usb_disable_interface() in step 3
> should be done before calling  usb_hcd_alloc_bandwith().
> This was fixed in other places such as usb_set_interface() and
> usb_reset_config()

I haven't thought about it, but you are right. This means that my
commit message is wrong to suggest that the problem occurs after
altsetting changes, it is apparently unique to device reset case.

> We might need to clean up ep_state flags and give back cancelled URBs
> in xhci_discover_or_reset_device() after the reset device xhci
> command completion.

I guess it wouldn't be strictly necessary if core flushed all endpoints
before resetting. I frankly always assumed that it does so, because it
also makes sense for other HCDs which don't even define reset_device().

There seems to be nothing stopping them from talking to a device while
it is undergoing a reset and re-configuration, seems a little risky
given that HW isn't exactly free of its own bugs.

Speaking of xhci, I wonder if this could also be responsible for some
xHC crashes during enumeration. I recall that those Etron quirk patches
mentioned events for a disabled endpoint and "HC died" in some cases.

Regards,
Michal
