Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4524219EED2;
	Sun,  4 May 2025 09:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746352299; cv=none; b=aH8iNnWzt36znixb2Oltyl0La2w8Omy7GG4Sy+Oth2ffuLR3dZTaruI5OO5wxgqcd2Dpz9u1L0dAW594cZLsZZCGswZSfHFMBiKnBynydzuCR/0AA/D7xkL4mj1PuXZCTLiJwzyim4vp7ofqrdNMcG70NxexSxVBDeNUqaqPgWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746352299; c=relaxed/simple;
	bh=muQRDpDkvQ3yr7wM6RRqm9LFsCCKkEzqPpd6l/TYDwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IbemeLq9R7x5Jo1CbRPmCA4xUqUfgt6ba5lvgZHQpsthGL0eHw8BKvOjDir4lLL2sJb5zj8IkJI78+Tp1lhj+9J7sRcvU++lzzTA9HD0Iejr+QYS2zzPGAfz3dvKk1n7DbrcIK6ahxI1mZWz16wE2+Xv0Cvfl18yFwPhkKmNkWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mzo9TFLF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mzo9TFLF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26524C4CEE9;
	Sun,  4 May 2025 09:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746352298;
	bh=muQRDpDkvQ3yr7wM6RRqm9LFsCCKkEzqPpd6l/TYDwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mzo9TFLFWxqIRdkMawjsHqpMv2Dnksm4QDpBBlVSpx6RuhhjMi4nZ1N4or4OSZhh1
	 fP/d9pA2Ic8Co6Ox7cqc1ufmi2igiIJDuKthJmoZ7/KXRKfoS8D8P35cheGHxzt/LF
	 7fJUnomSWCbs+t5PHzLeQM2htkTo0xc49WL+EfzBR9QT81EYH0IA1x4ype1yE3rEWb
	 V+QnxXGjHj6jTTIacL33DuLEv/STEwPpRQyn1mwVfSpCYg7BKgDGvV19qZs5D1CXB4
	 hqaL48a3iMkcZDJuLNApvZSfGbdWAfVSHXQlywyjZdh+6Qwb6Hhu3rI2W9Fy1LtXLq
	 5q8qNGss+vYcw==
Date: Sun, 4 May 2025 11:51:04 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [tip:timers/urgent 3/3] llvm-readelf: warning:
 'arch/riscv/kernel/vdso/hwprobe.o': bitcode files are not supported
Message-ID: <aBc4iLZoH1cFzM96@gmail.com>
References: <aBb6nudVcs+cqRyZ@rli9-mobl>
 <20250504113922-5cc48741-0c27-4384-a77f-c088050bc747@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250504113922-5cc48741-0c27-4384-a77f-c088050bc747@linutronix.de>


* Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de> wrote:

> Hi Ingo,
> 
> On Sun, May 04, 2025 at 01:26:54PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/urgent
> > head:   7aeb1538be5df3efa1d799e5428ac3a0ae802293
> > commit: 7aeb1538be5df3efa1d799e5428ac3a0ae802293 [3/3] vdso: Reject absolute relocations during build
> > :::::: branch date: 4 hours ago
> > :::::: commit date: 4 hours ago
> > config: riscv-randconfig-001-20250503 (https://download.01.org/0day-ci/archive/20250503/202505030636.3ExDB8O2-lkp@intel.com/config)
> > compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250503/202505030636.3ExDB8O2-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/r/202505030636.3ExDB8O2-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> llvm-readelf: warning: 'arch/riscv/kernel/vdso/hwprobe.o': bitcode files are not supported
> > --
> > >> llvm-readelf: warning: 'arch/riscv/kernel/vdso/hwprobe.o': bitcode files are not supported
> 
> Could you drop "vdso: Reject absolute relocations during build" from the "urgent"
> branch for now? It is not necessary for the actual bugfix.

Done.

> I have an idea on how to fix the issue found by 0day but those 
> patches can then go through the normal process.

Thanks!

I'd still prefer to delay the other timers/urgent fixes to be on the 
safe side and send them in a day or two, but it's up to Thomas.

	Ingo
