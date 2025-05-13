Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434271D555
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 15:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747150646; cv=none; b=k6CK0d3047swgNnN7SC9LjF9kvQhdPP1b3d2fc0Dm+TQxHz0s+dQ2eMuNjfsQdLjNvv5hdn/Eg/KPrQT215XE6wDXkt1UFf1VuQz0uwqDtJDPU9LoSrvakb9LGzRs9tmAErwsa6UI4xEr8K8t20+labWsq+JXRfybaZTIWhwrBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747150646; c=relaxed/simple;
	bh=CTtDbeWwdllOOJFC6Uy8ygOqbtnJf22JPHMG6jug4UE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mCDeme4mn76PUO44ddK7p6bJWBqMQ9bkVe1YHsc3RxFHw3Wt8IgrxrrVkGdJdXa6G6WqAhQIjnaYWNuiQdI5sh00ytmJnaQ2T51id2MJlyBB2y1bSpdl28n92idcDfcnMM5ZOfF6PIj8M0B7wH7QoKWY8ZaIWXQ2ZXIJWkXnOWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=uZnzP3Vq; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="uZnzP3Vq"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6f0ad744811so42694136d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 08:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1747150643; x=1747755443; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NFGbIoM56oY9CYSlck5qbHpuQ4uA8AlSWoOsJXQxQnQ=;
        b=uZnzP3Vqldfp6S/mKh4emO+FxOi+DjPNrQofYIRKgTxEYMOps2iJ2NB2JqdpMcQVcT
         ICWmxvCgf64vrPxEhnN/lJfPiim8y25lbegciZZKwBdNBvvydiaVgVXwifij/1ohU6bB
         9TpkHPwprdVGT3NbaFquz/Epzs4U0Zz8DNtfLaGhZr3rij+SQUB2radEPwQU/qh5x0/r
         t6LoE5pzUO6hsOZ598gKdgAEMyDKcjO/QBuI+fAyaoxurwsLP76ormN4jkUqDJ9Mtw9n
         CdHrLOZWbLqAkNTPjJh0UdiEWi6CFdOzhD7keZLmDMupJXpX05RG2ScW1zNSnBHhD+dL
         /xJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747150643; x=1747755443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFGbIoM56oY9CYSlck5qbHpuQ4uA8AlSWoOsJXQxQnQ=;
        b=Q/RKIvr0dbqBoBk5Ybt7ZLNKL2Vpt3Fzyfe2a5I5njKpbeswKItn2TBLUtoc8cY0FJ
         EtBNOalErDI1D2mGyXrgfI+UAL81/wFDmnhn+3Yf9eZJ7cSz1xDHZlmSy4UyJ5a0uDEs
         TxMD7ZVjMo14OrICkLU7HbAPi6qCGjV3gr1gUDJCrZrKgB4Zfi2zNZ6DjT4Oujtqyna3
         wpTvn0JqNvpaC9RS3J8g9L4GF9M/3KP95q4+GiTwIvZHsjjNjDi5X0tated/9U41txDj
         VTVu9qyKx1Kl/62+6ZTy4SLiCJ3l2VM/XdDxIfybmOndkFQcNh98QT6wJjg1Ypn26pfD
         TXwg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ/77OQz3nKgAaRtu2WkJ6xUe04UfeOnSZQKYLMUoytPBr1qsxm9bL4qlTIngbwhA9Ou8/CMDUyphSEag=@vger.kernel.org
X-Gm-Message-State: AOJu0YznknLIzfUx3mhhcJ4TN08Rb0o8Z0ZYhqHThOh4laER0sjw0iLO
	jKi/uY3VyQXFWZDKxKeXPWbBUDQrtTkUKkk1pZYDruyq6Y+hmyE2vVFRWpvaMA==
X-Gm-Gg: ASbGncteJ/bXC2JvlBT7QNmzqrm3FdIbh07dmGnxtVbBcZRWi0zz+kboVZmQvssaVRn
	o5tUJ4Bo2M7d+y4aQYKi5ogzoWec3VMPPeSTFC8siUwHQ7HF2VRjKL7DEK0GseMdcZGwQpKqIN0
	wf/H6OPUVRhdWPB1zpt8IrfK4gXxq45Op2EFcAfMYBBmApCFGcgL13VfkWFfHuUaARJVBoU7gHq
	55p28KCfkarR0xi0e+/fzu0k8u6axmTj0AhX3vS57K4Or3+3fKcFYNkzMPZ/uUYPv8FOZtNUp3h
	xp4vAuef8DDn2joMJDfnT1iqEMThUdEHunsMCOLaBAn72h7qWS4GvTKMQ3sZA6vV+2ZBQg==
X-Google-Smtp-Source: AGHT+IEHksdm/pCnn1uQwnUiWMrycBmsekx8bStKKlWjCJife5ySIwj7iwgMGAClNr2Csvd7UdE+Dg==
X-Received: by 2002:a05:6214:f2c:b0:6f5:41b8:47ed with SMTP id 6a1803df08f44-6f6e470e2fdmr303779196d6.0.1747150643015;
        Tue, 13 May 2025 08:37:23 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e3a0c93esm68146846d6.60.2025.05.13.08.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 08:37:22 -0700 (PDT)
Date: Tue, 13 May 2025 11:37:20 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: David Wang <00107082@163.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org, oneukum@suse.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] USB: core: add a memory pool to urb for
 host-controller private data
Message-ID: <b334ef97-1f79-4dd9-98f6-8fd7f360101e@rowland.harvard.edu>
References: <20250512150724.4560-1-00107082@163.com>
 <20250513113817.11962-1-00107082@163.com>
 <8c963ad0-a38f-4627-be11-80ccb669d006@rowland.harvard.edu>
 <69accee9.accf.196ca18308a.Coremail.00107082@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69accee9.accf.196ca18308a.Coremail.00107082@163.com>

On Tue, May 13, 2025 at 10:41:45PM +0800, David Wang wrote:
> 
> 
> At 2025-05-13 22:25:50, "Alan Stern" <stern@rowland.harvard.edu> wrote:
> >On Tue, May 13, 2025 at 07:38:17PM +0800, David Wang wrote:
> >> ---
> >> Changes:
> >> 1. Use caller's mem_flags if a larger memory is needed.
> >> Thanks to Oliver Neukum <oneukum@suse.com>'s review.
> >> ---
> >> URB objects have long lifecycle, an urb can be reused between
> >> enqueue-dequeue loops; The private data needed by some host controller
> >> has very short lifecycle, the memory is alloced when enqueue, and
> >> released when dequeue. For example, on a system with xhci, several
> >> minutes of usage of webcam/keyboard/mouse have memory alloc counts:
> >>   drivers/usb/core/urb.c:75 [usbcore] func:usb_alloc_urb 661
> >>   drivers/usb/host/xhci.c:1555 [xhci_hcd] func:xhci_urb_enqueue 424863
> >> Memory allocation frequency for host-controller private data can reach
> >> ~1k/s and above.
> >> 
> >> High frequent allocations for host-controller private data can be
> >> avoided if urb take over the ownership of memory, the memory then shares
> >> the longer lifecycle with urb objects.
> >> 
> >> Add a mempool to urb for hcpriv usage, the mempool only holds one block
> >> of memory and grows when larger size is requested.
> >> 
> >> Signed-off-by: David Wang <00107082@163.com>
> >
> >It should be possible to do what you want without touching the USB core 
> >code at all, changing only xhci-hcd.  That's what Mathias is suggesting.
> >
> >Instead of having an URB keep ownership of its extra memory after it 
> >completes, xhci-hcd can put the memory area onto a free list.  Then 
> >memory areas on the free list can be reused with almost no overhead when 
> >URBs are enqueued later on.
> 
> I have to disagree,  your suggestion has no much difference from requesting memory from
> system, locks and memory pool managements, all the same are needed, why bother?

There are two differences.  First, xhci-hcd already has its own lock 
that it acquires when enqueuing or dequeuing URBs, so no additional 
locks would be needed.  Second, complicated memory pool management isn't 
necessary; the management can be extremely simple.  (For example, 
Mathias suggested just reusing the most recently released memory area 
unless it is too small.)

> The reason I choose URB is that  URB life cycle contains the private data's lifecycle, 
> and no two HCD can take over the same URB as the same time.
> 
> I think the memory pool here is not actually a pool,  or I should say the mempool consists of
> pool of URBs, and each URB have only "single one" slot of mem pool in it.
> 
> 
> >
> >This idea can become more elaborate if you maintain separate free lists 
> >for different devices, or even for different endpoints, or sort the free 
> >list by the size of the memory areas.  But the basic idea is always the 
> >same: Don't change usbcore (including struct urb), and make getting and 
> >releasing the extra memory areas have extremely low overhead.
> 
> Why implements a device level memory pool would have extremely low overhead?

Because then getting or releasing memory areas from the pool could be 
carried out just by manipulating a couple of pointers.

Some fraction of the time, URBs are created on demand and destroyed upon 
completion.  Your approach would not save any time for these URBs, 
whereas my suggested approach would.  (This fraction probably isn't very 
large, although I don't know how big it is.)

> Why  making changes to usb core is bad? The idea in this thread is meant for all kinds of
> host controllers, xhci is what I have in my system; i think similar changes would benefit other
> HCs

Those other HC drivers would still require changes.  They could be 
changed to support my scheme as easily as your scheme.

If I were redesigning Linux's entire USB stack from the beginning, I 
would change it so that URBs would be dedicated to particular host 
controllers and endpoint types -- maybe even to particular endpoints.  
They would contain all the additional memory required for the HCD to use 
them, all pre-allocated, so that dynamic allocation would not be needed 
during normal use.  (The gadget subsystem behaves this way already.)

Such a drastic change isn't feasible at this point, although what you 
are suggesting is a step in that direction.  In the end it comes down 
to a time/space tradeoff, and it's very difficult to know what the best 
balance is.

I'm not saying that your approach is bad or wrong, just that there are 
other possibilities to consider.

Alan Stern

Alan Stern
