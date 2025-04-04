Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54854217647
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 17:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743788653; cv=none; b=JXn1Uv8JnPMnN2X3gaZ7oj4dZdxoBZN1RoJ2q7dUJJ3NDp3obkHQj8Xl1eN+/WPHwwZAOlCXtA/7x8MkpRi5Jhy8FXNYszmj8iYWOSR+9JGGIaadhqEBYf54e/Gl0Mb5HiDbmukZJGk0SeLEOtN511iq8MxTUSrBBFMyWjAP8DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743788653; c=relaxed/simple;
	bh=icX7MV22mrIepn/IXi871HeRt6dn0goevltgwb74F0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fwuDjRs9S2Ib3tyyvGO8b3Wc8SaOQ5Y570KFy+OmC3DukUrMxX0r9812kJ/+ELflzhQ3f0r1f0lR+TQKNaiLaiCrymeV9kqKBNiQwy8hvN1b2cTs5X8EgpmG1CnrevpyPqfFB8g1WU2oPKojFOgNlGcaBicyOKkeljic+8uVbAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Xv/AU4ZN; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Vrt7GB0+; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Xv/AU4ZN";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Vrt7GB0+"
Date: Fri, 4 Apr 2025 19:44:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743788650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iHQ9OX+ZOQUeuIy6BoY0oVTleFUXwctEKDTtRbatX8g=;
	b=Xv/AU4ZNf+PDMEQzR0YIBb3k3juLflyUzeoxJpz2gEx1sa4RSHpZfLLBw+ZY3AfzIBpXTl
	T4RZpOcPPSqUzvNbJmFqrAfKrUNiW8nAmX+UVhQAMFaO0Jt1zTov7LLHcJtWvrisoFX9DZ
	MONdGiLVWz96qR2U6n05vD5Epg6MjD33Kzmh1I/Fhu8d+GrjpyB8zq3SDJGAVoU8bnVEPI
	UyHx5Hq/7bKMvvDPjYo2R1nRJ1uF3ZQvsJRIt4wmkaCsJV/f6AkeEgztrLukQEE8fomHYQ
	xnzwbHpkGy/0sNz+/EvzBN1+tKTgpZJs5tcsi3P2U0yxK2Jclf7PUgX/PqNSxQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743788650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iHQ9OX+ZOQUeuIy6BoY0oVTleFUXwctEKDTtRbatX8g=;
	b=Vrt7GB0+Fcy2TWYejPlC30je4YTs0Mu9tyQl5ikkjlMHj8M2wfZ4ZNqLMGTqsMh+tBn3Qk
	bSMQag1+bEzNgkAw==
From: Nam Cao <namcao@linutronix.de>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [tip:timers/cleanups 2/10]
 drivers/input/keyboard/gpio_keys.c:593:17: error: implicit declaration of
 function 'hrtimer_init'; did you mean 'hrtimers_init'?
Message-ID: <20250404174409.tkifcSrx@linutronix.de>
References: <202504050021.ouKQ30CE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202504050021.ouKQ30CE-lkp@intel.com>

On Sat, Apr 05, 2025 at 12:53:41AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/cleanups
> head:   5c4da3a96bf484f965057c281f1ef48ac46987bc
> commit: 58b3f2cce01bb48b6f6e0c1cdca5e5a2fc0c56ad [2/10] hrtimers: Delete hrtimer_init()
> config: csky-randconfig-001-20250404 (https://download.01.org/0day-ci/archive/20250405/202504050021.ouKQ30CE-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 13.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504050021.ouKQ30CE-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504050021.ouKQ30CE-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/input/keyboard/gpio_keys.c: In function 'gpio_keys_setup_key':
> >> drivers/input/keyboard/gpio_keys.c:593:17: error: implicit declaration of function 'hrtimer_init'; did you mean 'hrtimers_init'? [-Werror=implicit-function-declaration]
>      593 |                 hrtimer_init(&bdata->debounce_timer,
>          |                 ^~~~~~~~~~~~
>          |                 hrtimers_init
>    cc1: some warnings being treated as errors

The patch converting this is still in the input tree.

Best regards,
Nam
