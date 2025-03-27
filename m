Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB201ACEB7;
	Thu, 27 Mar 2025 21:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743111347; cv=none; b=u260evumXjGpAe4HixMc75Ji0u2No3vy86yBKrJoDWCrIHrl0OQbE6ttl2jHQ8H0U0eptLpUz5tOtSCM8D0LPJmIQXpTojPIAWbQRPRSEdGuTstAf6/26tqYVgJAmWxzFSGnRPIZkU+LZ+XqoVjtupnJ8e+U00BmEOwKg2ujXcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743111347; c=relaxed/simple;
	bh=y2t4sGzePV0gBh70jx0GpXFEsn0dO13iSTufPv91BjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uSGS1HvmgZDxqtl9Hyk5ImSCbfAyM3FsLbUH7YFYcfVQLloLQGXb/T/0g2b6E77UOsYramkEZibYSjUDGhzf3hEP1ozkZmWesIwmL64LqNGolEQFUkkzhDX5CnbSUTQtFaSPlwLQojTGt/knja6jJm0IKd9yszutM0bXTfBabDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WCHeo5NI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WCHeo5NI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EB4AC4CEDD;
	Thu, 27 Mar 2025 21:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743111346;
	bh=y2t4sGzePV0gBh70jx0GpXFEsn0dO13iSTufPv91BjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WCHeo5NIRoFVWwYS57iCju9Up+26D1xFTpj0R2cHrhN224T5dTUAm7ZfBzPFbsOo5
	 6s/dKbgYnoA3posrlGyKcBoSbUYP9aO86MB9lBhFTxIcsTB1xxszlXUNneQ96dqtKD
	 QyV0SvrhlBAg9y0ydzxBEc+CnBBPt7H054taogS9dpzzvlmswvZd7spqT3RNLBgx3V
	 Z8dBcRqmYl+9zJEnUk9ahnPdvLJzrgVARVTQn2VzOeSJOsm+lPySxCzYyy9jvtOmU/
	 p30IAckJKjcO+zs93vjE2whLEy/uYf7wsa/4mT8F08fuHAKyxrG35Z8T2+rELO4bRv
	 nDRYhhojViYtA==
Date: Thu, 27 Mar 2025 22:35:41 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: kernel test robot <lkp@intel.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>, Phil Auld <pauld@redhat.com>
Subject: Re: kernel/sched/isolation.c:50: undefined reference to
 `sched_numa_find_closest'
Message-ID: <Z-XErTy1sqFCVId6@gmail.com>
References: <202503260646.lrUqD3j5-lkp@intel.com>
 <20250326093532.GA30181@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326093532.GA30181@redhat.com>


* Oleg Nesterov <oleg@redhat.com> wrote:

> On 03/26, kernel test robot wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   2d09a9449ecd9a2b9fdac62408c12ee20b6307d2
> > commit: 5097cbcb38e6e0d2627c9dde1985e91d2c9f880e sched/isolation: Prevent boot crash when the boot CPU is nohz_full
> > date:   11 months ago
> > config: sh-randconfig-r132-20250326 (https://download.01.org/0day-ci/archive/20250326/202503260646.lrUqD3j5-lkp@intel.com/config)
> ...
> > >> kernel/sched/isolation.c:50: undefined reference to `sched_numa_find_closest'
> 
> kernel/sched/isolation.c makes no sense without CONFIG_SMP, but
> 
> 	config CPU_ISOLATION
> 		bool "CPU isolation"
> 		depends on SMP || COMPILE_TEST
> 
> and .config above has CONFIG_COMPILE_TEST but not CONFIG_SMP.
> 
> It also has CONFIG_NUMA, it doesn't depend on CONFIG_SMP in
> arch/sh/mm/Kconfig, so isolation.c can't use the dummy version
> of sched_numa_find_closest() in kernel/sched/sched.h, and
> kernel/sched/build_utility.c doesn't include topology.c without
> CONFIG_SMP.
> 
> Perhaps we can should simply remove this "|| COMPILE_TEST" ?
> 
> Oleg.
> 
> --- x/init/Kconfig
> +++ x/init/Kconfig
> @@ -709,7 +709,7 @@ endmenu # "CPU/Task time and stats accou
>  
>  config CPU_ISOLATION
>  	bool "CPU isolation"
> -	depends on SMP || COMPILE_TEST
> +	depends on SMP
>  	default y
>  	help
>  	  Make sure that CPUs running critical tasks are not disturbed by

Yeah, please send a patch with a SOB.

Thanks,

	Ingo
