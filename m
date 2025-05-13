Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E35E2BE0F8
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 14:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146356; cv=none; b=tvguhBODMZkTGbWNtfTT93rjsrnAhmkfeq186doAU45h9gHASJQCMBmthr7WlePfvW7dPsDsh8QFORFGaMV7KwSWuHdACvztVeINc3TxDRIflasXDMIrbYds80wfCnIRb+Sq/GdfhgABzAWWyVnWWhUD69OgJ3g6tINlZQ0YUQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146356; c=relaxed/simple;
	bh=HXRQwuROw8MKPijyfUq6N7s7cAR/L7i+mxofui1ruJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BFGbTqotGjAb6vSe3PVW419V2XOhW+mSU614rwinmcK+EPZYQ8NVr+PbivZIfHjIzgQJmErQthdnV0mHcrTpZgj5ZBAXM8/SvKQPzU6ey3PRzDNraShcWB1jEu/vRC1Sxppjglf/dP46jIEjCHqWhSzLl8x2sGn1TI6n208ytbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=EaOsQlFk; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="EaOsQlFk"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6f535b11824so55331846d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 07:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1747146354; x=1747751154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9cLoF/O57LNlYc+iwyGRZeR5b650X2MnqJnqGtm8eH8=;
        b=EaOsQlFk2VwkdoXjMn0xqOBGWmlTY2/V9bAQTXhT9e8m8fH70Ixgg6eC15T6afJx9+
         kOzs43BUV12otvR0zQ1Co3L8JwvWiu55aiJxZaId17fhgIEYZh5Mnox4Up6R6gz/Abr1
         TDHrrANG6JLOtm51/4115PM45o38TylIudb2jxlA2SSDgePsB7RtBCxC5EUbQs2zHtmW
         /guXxE+CpHIa+2F6GxK9RtbJ4zs+zsvo9YchHldC3pFCOW5+kCXYxeJgUqtAfvGucsJh
         DRS1G/AzzjrXR5QP3Mh8CzBISUG6+v2DagEQsANvsPl5Mua5vi6MJHLGofPX2ibj3B1b
         CRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146354; x=1747751154;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cLoF/O57LNlYc+iwyGRZeR5b650X2MnqJnqGtm8eH8=;
        b=I/T+etwEqtnDSmebzQLkU9f0smZTV7/2AbEKFcRm4bNwEDOMQIrsXuSib/Fa6LwXXV
         IG6QE4HdWgb25saAAZPvFLARVIvboZXhoioO5EatWSa/tnNUODOGrib+1MNcP6VB2wG4
         BffznrmOk7sr/3A0yq+XJl8bD39+zIDMyMm4mUIEl9QKagaqfsU6D+rAKTOs6fe5Gg2E
         YpFIJ/qKDUCSSvrM+YonESUVMr9rhyAxycatHRZAgdpoybtrJ2eSEHN1JEUj88RtSieq
         WFJVzrQensEUT6t0gXeYW7q+5R5KK6h7S90PoctGBIrMsJmljyPptWrLG6UL50XOo0G/
         5thQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0Uk7JizOuQ1c8LU1s4qcKjpz8EWXc5ybxBv64F8jbNWlwDlqxvB+OS8Wwy5dg4eX3lDthJFESCx9BYLE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5KoSCUerm41ao4TVQXlEzfcXPgSER+yuowawakT9OHV+UMdHV
	iGCEJ16h/4WFwCk6+0zsfab2C74NyEvb1DnkmuEDGYHWRK3LLyGi4JjGr1cupg==
X-Gm-Gg: ASbGnctZ1+lbxDaRxdtaWYDj8irMGaDHp5Zx7RUfu4spdyTGXvXFoHdy4cg5RZiZFmE
	ctVbP3oZO4s0M4ozP6R5iGaJYZfQNPeJ0YZPoSElA1yWzBtFP8euS2i3YEt8oRTVdciPRS/Py6P
	zKl+BbzofBGnwliv+CtFXtAO87tvBn+sRGkeFeMqp3wYesRQLzaIA4w502Ashse2vpY7odcZpvv
	6CccnG0n8oPoOC1BKIs5mDfGpiCF1Hc58sLveAwGzkMQyOCFvtTLZnW5dVVMmX6S3wQFAVYpL6k
	MUMnBn3SFVMaT2VfTlkkaNTtDfcj5s/B4xPkRZJz+mkJ4npr+LK19RXqAT3XEpTzpUvpJA==
X-Google-Smtp-Source: AGHT+IHJfcnXh9oYA31injeuwlKCu3XfVe0Yr+B5+cVM0kreyrVuVJNaR+vnji5+fhQz+vprtI6mGg==
X-Received: by 2002:ad4:5aa5:0:b0:6f5:436:9e46 with SMTP id 6a1803df08f44-6f6e47c77eemr266308656d6.15.1747146353639;
        Tue, 13 May 2025 07:25:53 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e39f4d78sm67586836d6.40.2025.05.13.07.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:25:53 -0700 (PDT)
Date: Tue, 13 May 2025 10:25:50 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: David Wang <00107082@163.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org, oneukum@suse.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] USB: core: add a memory pool to urb for
 host-controller private data
Message-ID: <8c963ad0-a38f-4627-be11-80ccb669d006@rowland.harvard.edu>
References: <20250512150724.4560-1-00107082@163.com>
 <20250513113817.11962-1-00107082@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513113817.11962-1-00107082@163.com>

On Tue, May 13, 2025 at 07:38:17PM +0800, David Wang wrote:
> ---
> Changes:
> 1. Use caller's mem_flags if a larger memory is needed.
> Thanks to Oliver Neukum <oneukum@suse.com>'s review.
> ---
> URB objects have long lifecycle, an urb can be reused between
> enqueue-dequeue loops; The private data needed by some host controller
> has very short lifecycle, the memory is alloced when enqueue, and
> released when dequeue. For example, on a system with xhci, several
> minutes of usage of webcam/keyboard/mouse have memory alloc counts:
>   drivers/usb/core/urb.c:75 [usbcore] func:usb_alloc_urb 661
>   drivers/usb/host/xhci.c:1555 [xhci_hcd] func:xhci_urb_enqueue 424863
> Memory allocation frequency for host-controller private data can reach
> ~1k/s and above.
> 
> High frequent allocations for host-controller private data can be
> avoided if urb take over the ownership of memory, the memory then shares
> the longer lifecycle with urb objects.
> 
> Add a mempool to urb for hcpriv usage, the mempool only holds one block
> of memory and grows when larger size is requested.
> 
> Signed-off-by: David Wang <00107082@163.com>

It should be possible to do what you want without touching the USB core 
code at all, changing only xhci-hcd.  That's what Mathias is suggesting.

Instead of having an URB keep ownership of its extra memory after it 
completes, xhci-hcd can put the memory area onto a free list.  Then 
memory areas on the free list can be reused with almost no overhead when 
URBs are enqueued later on.

This idea can become more elaborate if you maintain separate free lists 
for different devices, or even for different endpoints, or sort the free 
list by the size of the memory areas.  But the basic idea is always the 
same: Don't change usbcore (including struct urb), and make getting and 
releasing the extra memory areas have extremely low overhead.

Alan Stern
