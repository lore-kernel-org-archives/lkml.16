Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF25320CCDB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 17:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743789109; cv=none; b=iP3hW1ztwl8SBgGBPUe79fF1UDfU7dlxXuuI08hGKzKCcC4C7uU+DlW+TPBDc5JDzB0OuVLx5zr0m5yDRlcExksfaJvPuDYzotOuIvpEyM9GyZ/RyIqBUPNxAUOFmGGT+QFGP6unFqPH/C4G9LxiIEorG0rYSz/TviuvR5VpIvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743789109; c=relaxed/simple;
	bh=jpsIcm6IfckQEAuDllrTxPz3DsognVjIo+CmVa1e8Zc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=J4QBgSRM7v3oQwP2GxaoW1AjHmx/MtkXq0LiHQYyH6ydI0vvBrvXChEpQwvQ2NAenEcHI2/eeGPU2byMrBP3mBjgqZ8Eb+aePBumbykfEyoXe0v+gLV9KmmUPRU16wIztItT4aoA1cU9tp9TQGJncyAEyZVhwPLKHW/e9LuMymg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=muWKV490; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=y1AZ82t6; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="muWKV490";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="y1AZ82t6"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743789106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YQOBVbXuEBr8fjiL1dgvrW4wr+2jDlXQUlS+BYPr0VU=;
	b=muWKV490W2Mopfx6SegWCxwoT/oZPZJKd93kMZmidLOy/ND2NeCgMFSfLhS4ueTcf8Ntn3
	tARnms7XPsT59GHcItGqur7C+knq4hsP7BhMQXzAMp1oyZ0HxMOlFG6c/fkTLxzKpSl7az
	6rymdPSIgxBCjwq5JQcPBH0eDmczupKMBRabyNvKEbFbiNlccyfv99NdT0YSyubT3bFXlI
	AsY9Zo7uJXVuFNab4LZs+qhqklC6zYni7/7CZPdgXE8zZznmA7BTx5f+PJ0MtdCWS9x5Lw
	v69ycJHqIIPjQfzQ3VPIghC3i2dgeha4JZyCbwPF5VrxQJKc9BMjCsPfhP8hiQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743789106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YQOBVbXuEBr8fjiL1dgvrW4wr+2jDlXQUlS+BYPr0VU=;
	b=y1AZ82t63mu+PQQmRsYzQm4JEFZxtAmqzK37yBS+iUx0uaf75rldCALeCkBw7gRNd5Ye4I
	aV887/fTg9kZojCw==
To: Nam Cao <namcao@linutronix.de>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org
Subject: Re: [tip:timers/cleanups 2/10]
 drivers/input/keyboard/gpio_keys.c:593:17: error: implicit declaration of
 function 'hrtimer_init'; did you mean 'hrtimers_init'?
In-Reply-To: <20250404174409.tkifcSrx@linutronix.de>
References: <202504050021.ouKQ30CE-lkp@intel.com>
 <20250404174409.tkifcSrx@linutronix.de>
Date: Fri, 04 Apr 2025 19:51:45 +0200
Message-ID: <87bjtbvmq6.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Apr 04 2025 at 19:44, Nam Cao wrote:
> On Sat, Apr 05, 2025 at 12:53:41AM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/cleanups
>> head:   5c4da3a96bf484f965057c281f1ef48ac46987bc
>> commit: 58b3f2cce01bb48b6f6e0c1cdca5e5a2fc0c56ad [2/10] hrtimers: Delete hrtimer_init()
>> config: csky-randconfig-001-20250404 (https://download.01.org/0day-ci/archive/20250405/202504050021.ouKQ30CE-lkp@intel.com/config)
>> compiler: csky-linux-gcc (GCC) 13.3.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504050021.ouKQ30CE-lkp@intel.com/reproduce)
>> 
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202504050021.ouKQ30CE-lkp@intel.com/
>> 
>> All errors (new ones prefixed by >>):
>> 
>>    drivers/input/keyboard/gpio_keys.c: In function 'gpio_keys_setup_key':
>> >> drivers/input/keyboard/gpio_keys.c:593:17: error: implicit declaration of function 'hrtimer_init'; did you mean 'hrtimers_init'? [-Werror=implicit-function-declaration]
>>      593 |                 hrtimer_init(&bdata->debounce_timer,
>>          |                 ^~~~~~~~~~~~
>>          |                 hrtimers_init
>>    cc1: some warnings being treated as errors
>
> The patch converting this is still in the input tree.

I fixed it up locally. No idea when the input tree gets merged.
