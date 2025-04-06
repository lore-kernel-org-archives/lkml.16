Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E354922094
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 02:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743907256; cv=none; b=XYsyylIdk7IgyXrhkOQygpRnkowFCMz0mhoz3Ke7IW+f+vYgdnXP6IM7EuP/P9qxGq+pH4YUVBqDWJmgJltj+9ut5PmO/+1VljpCL4vS81Im45iDCiaoD4aRCnGUmKbkQdLShmXL8Z0HY2gNQec2+3x9cYCwZkW2vjAuZpGGFVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743907256; c=relaxed/simple;
	bh=ZPjlu/o7yAmRlRV5k9+OF0qso2rudeX40I2rwH2beYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QunhW9GYbqeb1Y5CRHPN5sOJbhqLT1I7eX5XPlKiPqZR7IFdiNniT8t7v6A3ehHytnCOIeqg4hFfo97noGbGyvY7RVweoEnuMmTqPSfurzWiazdJBfsu+D2FP/qnNviIydWsjOILVkiuYGEwfBbKPEeHoKSwj9Njwln8hZ/Sn7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=S3fqqHB7; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="S3fqqHB7"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-727388e8f6cso2089027a34.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 19:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1743907254; x=1744512054; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DvkATYiLz5cQIQ9cEPd3sXGL2OWPbXfUXWROCURcGgg=;
        b=S3fqqHB7f9UXjS3CpsY+gOhiNIoxUoSmS3SwD9mqO19STl2DsfY0XJb0eFWIR1W4R9
         x2XenR08pfeZH8JGooy/iwpCAgcf8TKEOpH50iKqDvKshUCiPHI10/jxval2KOhXGkJy
         g7b9BtwHRSp0O2d07MyO42il7s353sNLLm8XA6PmF7nW/xxb9hubaUFAeLUGJTmeClTl
         z4l/EL38Kn9rf2+VZHYCKOQx5BXpj884b7nk3yQDVW43uaDGgLJrSBchmA2HuqMu7ahf
         RA+QJO9CMlvy3Po8sFx8PjmnpeptXw8bu+Jcp4ZmgEGWUONF4hJrpfHqmfhfP86qFCg2
         qiyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743907254; x=1744512054;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DvkATYiLz5cQIQ9cEPd3sXGL2OWPbXfUXWROCURcGgg=;
        b=tUzX7RdtL/LqH7rRv6LaoNgHrTdWKTfxuKifHvusgkfxYB4nsTnAdRj0K62H2V91Wn
         fIQYJMumVj2rLr9B72QceVBfD4xS9O0nCtjAQ8dqL0UFpHUKY3fMfVTvAOoASYixyL6i
         dXoe+w41deLKEokGuO7Q6NG3T8afCGvENO129LRbusoBb2KCSFVrBBbv4lRv2fs7uf8h
         rLBDFvKhjSdNvhWlcMedNB4dPtUwlkrfCCOnNSL2ltE+fVMriDVrkHKvYW6rR5CiPdaB
         Z3X6Mc6dMmpZikpzpqjwxhE0yVu/8ranpHXfmsSQSpUBKNyX2yOPnxYtDCeqIVEfVNV5
         +eUw==
X-Forwarded-Encrypted: i=1; AJvYcCVMIHJR5U5S0ObB3z8VWP67f/5ppeH7kcGkGHblL1YcfusaKj73o2k/95B75EOqUUMu6ZhsuUO6px0+Gn8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfEsFke6UIS7L2szwlWShMrblwj/RRZSfQyClb+kluZwJy7HwB
	X2qgFgg2zwffrIliQN2/rprEH5ul6zjIreZeMsRauhLdvUy8UmRlxDNRhS/sLQ==
X-Gm-Gg: ASbGnct9Pr8399+CW+YN1z5E6gywiYenAihEvClPDkoxOtadL3rSrY5Ps4KF4freJw9
	y26xWYmSnMnfd9I/XrUZE3U7Zc6QVOtCS/JPlu5xbLs44fCzMJbsNPXaXT5FBgMqpzxLxhjjOTZ
	0intGgcZSGl07kAkfEEVXbMu4uuLb0bbrVdo35GLlD2TjcnsBnEaaNIXRWvPfAqo2pE1inS0Ox8
	bmhZfWJnTuxmfKWBc4aUYuKqZvikzOYpnZkovEDz4tPBTBijNleMXe28DtWHtUw1HqJ/7e7xZnh
	WuZb1DdhwfbXwIFiPCIoNcIZJ8CtUk9jrWnBmcE+ZrIK//MK86linDI3kIA2
X-Google-Smtp-Source: AGHT+IGfAIkfN/dnQssdEgxIXWGwWtMgJClKtdrGbthxg5aW1FuZ1CRI4RtUzTwTGhX07uGJbHwo0w==
X-Received: by 2002:a05:6830:6187:b0:72b:9506:8db6 with SMTP id 46e09a7af769-72e366a37f2mr5473956a34.6.1743907253898;
        Sat, 05 Apr 2025 19:40:53 -0700 (PDT)
Received: from rowland.harvard.edu ([12.111.7.147])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72e3059a334sm1233314a34.54.2025.04.05.19.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 19:40:52 -0700 (PDT)
Date: Sat, 5 Apr 2025 22:40:51 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: =?utf-8?Q?Micha=C5=82?= Pecio <michal.pecio@gmail.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: xhci: WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep
 state.
Message-ID: <ade0d77a-651a-4b03-bf21-00369fdc22f8@rowland.harvard.edu>
References: <c279bd85-3069-4841-b1be-20507ac9f2d7@molgen.mpg.de>
 <b356f743-44b5-4f48-a289-fae0afe106ff@linux.intel.com>
 <84b400f8-2943-44e0-8803-f3aac3b670af@molgen.mpg.de>
 <20250406002311.2a76fc64@foxbook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250406002311.2a76fc64@foxbook>

On Sun, Apr 06, 2025 at 12:23:11AM +0200, Michał Pecio wrote:
> Looks like some URB stalled and usb_storage reset the device without
> usb_clear_halt(). Then the core didn't usb_hcd_reset_endpoint() either.
> And apparently EP_STALLED is still set in xhci_hcd after all that time.
> 
> Then usb_storage submits one URB which never executes because the EP
> is in Running-Idle state and the doorbell is inhibited by EP_STALLED.
> 30s later it times out, unlinks the URB and resets again. Set TR Deq
> fails because the endpoint is Running.

> Not sure if it's a USB core bug or something that xHCI should take
> care of on its own. For now, reverting those two "stall" patches ought
> to clean up the noise.

The core believes that resetting a device should erase the endpoint 
information in the HCD.  There is a callback in hub_port_reset() to that 
effect:

		if (hcd->driver->reset_device)
			hcd->driver->reset_device(hcd, udev);

So after this the EP should not be in the Running-Idle state; in fact it 
should not exist at all (unless it is ep0, but in this case I think it 
isn't).

Is the implementation of the reset_device callback in xhci-hcd missing 
something?

Alan Stern
