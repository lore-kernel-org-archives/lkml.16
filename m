Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13607149E00
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 17:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743788940; cv=none; b=RFkaekGqRrXKWlTV5berb8OWK7cRH3NLGORLtGpI8Uun6UF4iXmrOSUCMbVdq3J6KAoRvpaKyC/PLLa0ym3bgWGPBCeyJ3biLBKUZhrwbgOm7v3ZkJZCYIne0YTwFY+HjmqippPGA8LUo95Yyol0nIupFJJQa3t7G4uU/8ObKxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743788940; c=relaxed/simple;
	bh=0r8e4vTkDPidKWJOzyU+ulRQfL7TGTgfHCsNAGQJEPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YAwunMKReLXKKNNzHRFVHQRSwCQIEs+r7ut5dYqLk2Tryt8XcihbqkuzK+4Ls02CMGjOSWSp9/PMCOZgBg1TT3uqR3opwbfhuSKkpEC77eCUsilTDqHohkcDBMEW3Hj0b3uOynnZdHh1EpDDBc8Qn4xZnvMYnqGU2SjIGgQlSEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2tPPBTv3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=25a477Kk; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2tPPBTv3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="25a477Kk"
Date: Fri, 4 Apr 2025 19:48:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743788936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NaP91HbdEJ40EW7i5QXSG0kIpziu9NVDnYKBrwZZ/L4=;
	b=2tPPBTv3/53E7kbXDk8YsoSUIHxTQsoW1PBgsoZ/n4UVqLGirUxW9k+FVlivW5uA9v4mz2
	5vi8jYPrwWY/veJ9JhTCCal7F1Dv+2Gxn7hfzJP39Q3dERQeVCv5o0+nPbnrd8mKZs99jo
	SUVIMHXesuUek0N4+HPyheVInB13291VU1tsYeqIcb2Yc/rhb80eU6mh4Eydvzebzffhii
	dnzxq4wXTnTEbYPSF/7Y9W1FElEFhFcp4rc09NpO/7ziKk4rRPCvp7fsFYtxYTQHgMbc22
	5huaVN+tE+YW+bS/VoBMbaQemXJHxcW7GX/uVvLoyFuCJIXzjzN9PlnBT89XsQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743788936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NaP91HbdEJ40EW7i5QXSG0kIpziu9NVDnYKBrwZZ/L4=;
	b=25a477KkRl6RaQab9W8tjVGjG51q8gtJn3QjXBnoMVgc9G39vfpIT8CFujmxBwBF0hk3hb
	cUq0U5YtMxxomLAw==
From: Nam Cao <namcao@linutronix.de>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [tip:timers/cleanups 2/10]
 drivers/pps/generators/pps_gen_tio.c:230:9: error: implicit declaration of
 function 'hrtimer_init'; did you mean 'hrtimers_init'?
Message-ID: <20250404174855.MPAaPNjT@linutronix.de>
References: <202504050126.K62Di5RY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202504050126.K62Di5RY-lkp@intel.com>

On Sat, Apr 05, 2025 at 01:04:05AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/cleanups
> head:   5c4da3a96bf484f965057c281f1ef48ac46987bc
> commit: 58b3f2cce01bb48b6f6e0c1cdca5e5a2fc0c56ad [2/10] hrtimers: Delete hrtimer_init()
> config: i386-buildonly-randconfig-002-20250404 (https://download.01.org/0day-ci/archive/20250405/202504050126.K62Di5RY-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504050126.K62Di5RY-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504050126.K62Di5RY-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/pps/generators/pps_gen_tio.c: In function 'pps_gen_tio_probe':
> >> drivers/pps/generators/pps_gen_tio.c:230:9: error: implicit declaration of function 'hrtimer_init'; did you mean 'hrtimers_init'? [-Werror=implicit-function-declaration]
>      230 |         hrtimer_init(&tio->timer, CLOCK_REALTIME, HRTIMER_MODE_ABS);
>          |         ^~~~~~~~~~~~
>          |         hrtimers_init
>    cc1: some warnings being treated as errors

This new user of hrtimer_init() was recently added by c89755d1111f ("pps:
generators: Add PPS Generator TIO Driver").

git grep shows me there's also bf3624cf1c370 ("netdevsim: call
napi_schedule from a timer context") adding another hrtimer_init().

I will send patches converting them over to hrtimer_setup()

Best regards,
Nam
