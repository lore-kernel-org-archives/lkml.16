Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7F81EDA2F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 21:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749762033; cv=none; b=kP6fsElZLwRBptkClztPpvgBtliRufoa+wfvBs0i2k6dWY3PlvHyJJXUQdY/qkrgMAfLUcst0TsuSju+bwhcfMDdu2DGlKlYSE2JdvPDZLFizRienPO0p6fQ8YUwrJmng5y15iXBdAA9D406oiBMGIkZA4t8M80JT1iOT8jegFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749762033; c=relaxed/simple;
	bh=HCdEwaaThMHRZ5Xzwr6mxB5JXVqgzmFreywQgmG0UD4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZIY0tEpMBtfahrijhcJo2gTaE/BIJk8Jcwn4ZB1+aP/TY8UOTyml6ryStcXvNjTXfcTIN8s/f3ma+MfLPuv3UqI7F2aAqROrMrUiwwvsc4CtNI6qhX7SWLvGQ5MbfcVX0V0j9JGcOeF2iyIL5VxD8YfyMV9DLXGfyQZhqQr/9kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jWLw7Jmg; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ekIDyWtd; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jWLw7Jmg";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ekIDyWtd"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749762030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qrGUtjUHIflOpi6l7TkWmAkkFbD2GUJ3cHRUJP08Dmc=;
	b=jWLw7JmgCyIPV3kJ9Q5z//uDGSlEKKYGZcpmqh+vNixXWwAeG0KOc+FzHj8Ge9DWRh2eD+
	a45O6D+LcCE9IrlQ3u2epgtvT65l9quSQJNwmTdb/KmFD2TBxZG8R0kc9iXp2Na8IWq7Fe
	SKihtPCTtA0SCkuy9eBkqRYlKh0Ec2YHLHz+LvduJzvA1QqXnGsk/VMPvJk9qiU5QCqh4y
	lm1AzU7Yf3zDqlJtmj76TVgBnIAjBgH9zIJLrsLqMx0h/6hUo5MPhO4EiGzeoOMG+33X5g
	KDgFD3p6sYA8MgIFaN9lh7sYBD5RbmXXx9BTZKKf7gYaECz5TjjC8dsmk+9k1w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749762030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qrGUtjUHIflOpi6l7TkWmAkkFbD2GUJ3cHRUJP08Dmc=;
	b=ekIDyWtdI73Szm2C9dEcytidI6w2gbR17fuPqvRSruFDGG6GfAn5I0XI36qyt+iTs7fVEJ
	nkPTN2pP2mRsLHDQ==
To: kernel test robot <oliver.sang@intel.com>, Waiman Long <longman@redhat.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>,
 Waiman Long <longman@redhat.com>, oliver.sang@intel.com
Subject: Re: [PATCH v2 3/3] timers: Disable memory pre-allocation of timer
 debug objects
In-Reply-To: <202506121115.b69b8c2-lkp@intel.com>
References: <202506121115.b69b8c2-lkp@intel.com>
Date: Thu, 12 Jun 2025 23:00:29 +0200
Message-ID: <87qzzosmj6.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Jun 12 2025 at 12:55, kernel test robot wrote:
> kernel test robot noticed
> "WARNING:possible_circular_locking_dependency_detected" on:

The lockdep issue comes from patch 2/3 which prints with the hash bucket
lock held.

> commit: 89fd87e046372ce70f8146357324cacd365369fe ("[PATCH v2 3/3] timers: Disable memory pre-allocation of timer debug objects")

This one triggers it because the preallocation disable makes debug
object go out of memory.

> [ 92.564990][ T1] _printk (kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/printk/printk.c:2475) 
> [ 92.565340][ T1] lookup_object_or_alloc (kbuild/obj/consumer/x86_64-randconfig-003-20250608/lib/debugobjects.c:700) 

That's the:

       debug_objects_disable("out of memory");

introduced by patch 2/3. The printk() in debug_objects_disable() needs
to be deferred.

> [ 92.565838][ T1] __debug_object_init (kbuild/obj/consumer/x86_64-randconfig-003-20250608/lib/debugobjects.c:750) 
> [ 92.566274][ T1] debug_object_init (kbuild/obj/consumer/x86_64-randconfig-003-20250608/lib/debugobjects.c:785) 

Which means that the changelog saying:

  "So the chance that debug_objects gets disabled because it is running out
   of free debug_object should be minimal."

is slightly off ....

Thanks,

        tglx
