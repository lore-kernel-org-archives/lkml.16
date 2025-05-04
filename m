Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2BF19DF4A
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 09:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746351741; cv=none; b=Pg9fiPd84x6twVZQGlT8MLwX2QsXuvQlTwl/bs9F702MmrE9NdoE4V0cpQbZXaTuXVhoyTinUVqOzBlQgB7uqyrEdqab5ejxpWYSo5LPjzTzf4awegvxmKYv+99MkpjMrNq4fYho4gu5hiifUJZHRpzmottbzJcZo45HncN8P60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746351741; c=relaxed/simple;
	bh=DZfudZchi8xutQlDTuYgH2X5Zx/DAfwSefU97dYwvZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h8i38+Go4eao99Kp6G5i9PlWOEK2k6XHTF6ltKncW1WUiiCJbBdMXy9JShrVV/HgdKdR2AEf6rBrVXWdjjlxnHsSYNl5fzPOkWmkTzQ7nm6dYvy3No+N4X4qb8xxtDaLIo+9XAzG3Z8c9bQYjI9TuN7v+BpxC6sUXoZM28/CuyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FGR/iXw2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0F82CkAK; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FGR/iXw2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0F82CkAK"
Date: Sun, 4 May 2025 11:42:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746351738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TLQT1y9cYPIq84ABkgJ6IyJcL0f+HU6phmhJvzRkxGk=;
	b=FGR/iXw2JYbjDDiP80NUzYaai4uw4jSHlIdoYqBymDOnFejv3H64pYoYE9b11fOglvsi1V
	3RAgkuu5PL/pEhjM/rx8ZovdbEGt4lKV0804fh1gF1p/6k1ZdOtl4omqK+SnnY89rqjuRe
	GwLUd6H/pgWPpwufA3EHvGLkemYCO+UmvKTpM6isxd4HSNs2ItV4WWFG9rXB41cqeU4CST
	Hi6sSRGSKoTyZi7y2FmnsTUsFpB/VrzQt0L8OfTSqswzErOlVOY+5R3SNLwI1trEcYnyiF
	jkYgSRstYlVdLEmxW/ICK4OqXMyordsSTX6EiWaPViPCG7I69i8vupTDJdUv/g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746351738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TLQT1y9cYPIq84ABkgJ6IyJcL0f+HU6phmhJvzRkxGk=;
	b=0F82CkAK39bWgHyyIgY3qXrjdmXSD+xN78hk7AUQcXZ0PwADhAg6E5DBmHW+vUVHMpjGta
	CJxv9wiproYpMfDA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Ingo Molnar <mingo@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [tip:timers/urgent 3/3] llvm-readelf: warning:
 'arch/riscv/kernel/vdso/hwprobe.o': bitcode files are not supported
Message-ID: <20250504113922-5cc48741-0c27-4384-a77f-c088050bc747@linutronix.de>
References: <aBb6nudVcs+cqRyZ@rli9-mobl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBb6nudVcs+cqRyZ@rli9-mobl>

Hi Ingo,

On Sun, May 04, 2025 at 01:26:54PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/urgent
> head:   7aeb1538be5df3efa1d799e5428ac3a0ae802293
> commit: 7aeb1538be5df3efa1d799e5428ac3a0ae802293 [3/3] vdso: Reject absolute relocations during build
> :::::: branch date: 4 hours ago
> :::::: commit date: 4 hours ago
> config: riscv-randconfig-001-20250503 (https://download.01.org/0day-ci/archive/20250503/202505030636.3ExDB8O2-lkp@intel.com/config)
> compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250503/202505030636.3ExDB8O2-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/r/202505030636.3ExDB8O2-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> llvm-readelf: warning: 'arch/riscv/kernel/vdso/hwprobe.o': bitcode files are not supported
> --
> >> llvm-readelf: warning: 'arch/riscv/kernel/vdso/hwprobe.o': bitcode files are not supported

Could you drop "vdso: Reject absolute relocations during build" from the "urgent"
branch for now? It is not necessary for the actual bugfix.
I have an idea on how to fix the issue found by 0day but those patches can then
go through the normal process.


Thomas
