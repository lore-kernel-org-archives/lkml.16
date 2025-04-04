Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C928F18FC92
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 17:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743789148; cv=none; b=er8AzSiQPzmefoCpcM0mi3pKzEjiS7HaIwC6Tf2s77b2RWp6SzZRYAKUHJYDjR+CaxGzPUcPWHuau8i12rzSTB8UowiK+bgBWYiynFmsjVfcQ0jlZkuQU+fEFJpUxGhKnT+EwwrmmsdelZLqnVWRX5amGA3tDNxm5gDbmxd5cug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743789148; c=relaxed/simple;
	bh=ijKAdrOfUEruS1C0Gax17e8UkNvmb8eAXLVy4CVXgd8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hqkeEKZ/sKJFBsI4dmPpeVEL2V3gLRtQOJBKOpoP24wrXjYoeUTg+M2MYSgmLT6vvpn+ZD8pO/U1VHvKqfaoJQOwmAAdFIzyA9kzVkNmpx/orcpIrciE3QrDW43xKzjG6FOs2y0o1Z0iMWM3qk336+E1Ze90tlVdWLRZkNVTOhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DW96PsZD; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=V+I0G7Du; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DW96PsZD";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="V+I0G7Du"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743789145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ELWNztBWFajMaBLTzI6T47va1ooxWGMTy8wR2FzUKrI=;
	b=DW96PsZDbjNk4On4qJe8xOtECo8Ec+x7Ln9bJ/DrGpn/QhzBHJHVOkGHurNY2YHXqOsQHB
	UXYrHhOi8rKbv9aMRRgfGSutIqnO/0tHDITIFAGsSF2WCUsM6b176us88QNG9ra4sb+LD+
	S2OX7gD8XmcCSJ8vi1eOYK4G9KBvOBv68pH2LtsEZ5iGfXC3hihEqLJPA+34lcmkv3/E6r
	J5yWYyhq0cVMJD1j1ydwAsmrRZNMf61osLM4LGYbF8S0I9oyL0Sb1x9Xaq8nrSga8dHHE1
	PzfjBN4690WaJKZbrUcxXhvpW1z4zFP+ccPsKXLB9QOSatpp4SNBHOPz6ZxGAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743789145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ELWNztBWFajMaBLTzI6T47va1ooxWGMTy8wR2FzUKrI=;
	b=V+I0G7Du4Bd5c28gTd6qjKTaPLdJO+prY3uKahrHKiKx6AnVQdy7z4q6FG1nQhDoyKq4x4
	UEn5XB2KcMASSaDg==
To: Nam Cao <namcao@linutronix.de>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org
Subject: Re: [tip:timers/cleanups 2/10]
 drivers/pps/generators/pps_gen_tio.c:230:9: error: implicit declaration of
 function 'hrtimer_init'; did you mean 'hrtimers_init'?
In-Reply-To: <20250404174855.MPAaPNjT@linutronix.de>
References: <202504050126.K62Di5RY-lkp@intel.com>
 <20250404174855.MPAaPNjT@linutronix.de>
Date: Fri, 04 Apr 2025 19:52:24 +0200
Message-ID: <878qofvmp3.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Apr 04 2025 at 19:48, Nam Cao wrote:

> On Sat, Apr 05, 2025 at 01:04:05AM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/cleanups
>> head:   5c4da3a96bf484f965057c281f1ef48ac46987bc
>> commit: 58b3f2cce01bb48b6f6e0c1cdca5e5a2fc0c56ad [2/10] hrtimers: Delete hrtimer_init()
>> config: i386-buildonly-randconfig-002-20250404 (https://download.01.org/0day-ci/archive/20250405/202504050126.K62Di5RY-lkp@intel.com/config)
>> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504050126.K62Di5RY-lkp@intel.com/reproduce)
>> 
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202504050126.K62Di5RY-lkp@intel.com/
>> 
>> All errors (new ones prefixed by >>):
>> 
>>    drivers/pps/generators/pps_gen_tio.c: In function 'pps_gen_tio_probe':
>> >> drivers/pps/generators/pps_gen_tio.c:230:9: error: implicit declaration of function 'hrtimer_init'; did you mean 'hrtimers_init'? [-Werror=implicit-function-declaration]
>>      230 |         hrtimer_init(&tio->timer, CLOCK_REALTIME, HRTIMER_MODE_ABS);
>>          |         ^~~~~~~~~~~~
>>          |         hrtimers_init
>>    cc1: some warnings being treated as errors
>
> This new user of hrtimer_init() was recently added by c89755d1111f ("pps:
> generators: Add PPS Generator TIO Driver").
>
> git grep shows me there's also bf3624cf1c370 ("netdevsim: call
> napi_schedule from a timer context") adding another hrtimer_init().
>
> I will send patches converting them over to hrtimer_setup()

It's already fixed in the timers/cleanup branch
