Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C84242AA1
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 01:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745371075; cv=none; b=AqNtWiFQ0KfKecyiAm+t8kOMP/CD2c5FP4wD2OVZjm1yPVJlAasK8FqHUkJk8DUFhqzQuZxXOM6mWELTMkz84+4QforWgJOGK1JTKRIEFahDBoCKPvyShgSJHHSvAPVxDqge3In2mQRRCPMVNrnjE+RzDEdaN1hCs2UfkdwK3bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745371075; c=relaxed/simple;
	bh=Zylnpb2TEmbMQh5WC0vsdH2I+J9na/9RUwBuAp0YScE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TMpxhv0Jdh5S4XkKfdSPORFVTvCYFwc1wUyEtdvS5nmSg7R69k4+NnwXi627h2Nuuse5pjTWUfx6w7u/P5vUOZGr/Q8Drw4zT0YRPa2b6DdZFBk0LT6b8fwujf4yQAti06zKDqPAwf5u1TjTEEgtbmABrabXd6MnEEGqiRQvLV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a2/2xe3W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a2/2xe3W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37D61C4CEE9;
	Wed, 23 Apr 2025 01:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745371074;
	bh=Zylnpb2TEmbMQh5WC0vsdH2I+J9na/9RUwBuAp0YScE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a2/2xe3WFytGgxOnWjC+Er9KJ4V2acrQ/2OFwTsINq50VN/MkTk1ge6H6Fq0gaEtp
	 302ejpCSGFofo//ErRRv0kAeH3xzjqcIv2Qnx6Jt1Iov8SegtAeq2sUNMln1AKKGTp
	 UtlEa5L19MB2X0iXhtH/94Dm1Qv10bIftdxSIz5t3/wQ7UygZwUxNS8OjkbZRzD8w3
	 Q95LYwjI8qk3TGQJ6hwNW1ATZrJ9/sjcrlM7jX3XTqqzoN10oHSwqt3LFTCGhbCGVl
	 QJBOsR51TFoyUrOHsDDheKMZld6TQq1Uc2/sp4ET0RaGeeITM9IHU76uE1zi87kk3s
	 rZlmc6Jt4oBoA==
Date: Tue, 22 Apr 2025 18:17:52 -0700
From: Dennis Zhou <dennis@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: gaoxu <gaoxu2@honor.com>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"surenb@google.com" <surenb@google.com>,
	yipengxiang <yipengxiang@honor.com>
Subject: Re: mm: percpu: increase PERCPU_MODULE_RESERVE to avoid allocation
 failure
Message-ID: <aAg_wPQa_RJkmFDa@snowbird>
References: <bcfb90b2cecf43d7a0760ebaddde10d8@honor.com>
 <20250422170209.a8beaa8a3610d2e92421476f@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422170209.a8beaa8a3610d2e92421476f@linux-foundation.org>

Hi Andrew,

On Tue, Apr 22, 2025 at 05:02:09PM -0700, Andrew Morton wrote:
> On Tue, 22 Apr 2025 11:39:30 +0000 gaoxu <gaoxu2@honor.com> wrote:
> 
> > In android16-6.12, enabling CONFIG_MEM_ALLOC_PROFILING causes some modules
> > to fail to load during boot because of failed percpu memory allocation.
> 
> Which modules?  If they're in-tree modules then we should fix this
> issue in -stable kernels also.
> 
> If they're out-of-tree modules then what argument is there for altering
> the mainline kernel?
> 
> > [811:modprobe]percpu: allocation failed, size=5200 align=8 atomic=0, alloc
> > from reserved chunk failed
> > [811:modprobe]Call trace:
> > [811:modprobe] dump_backtrace+0xfc/0x17c
> > [811:modprobe] show_stack+0x18/0x28
> > [811:modprobe] dump_stack_lvl+0x40/0xc0
> > [811:modprobe] dump_stack+0x18/0x24
> > [811:modprobe] pcpu_alloc_noprof+0x96c/0xb58
> > [811:modprobe] percpu_modalloc+0x50/0xec
> > [811:modprobe] load_module+0x1158/0x153c
> > [811:modprobe] __arm64_sys_finit_module+0x23c/0x340
> > [811:modprobe] invoke_syscall+0x58/0x10c
> > [811:modprobe] el0_svc_common+0xa8/0xdc
> > [811:modprobe] do_el0_svc+0x1c/0x28
> > [811:modprobe] el0_svc+0x40/0x90
> > [811:modprobe] el0t_64_sync_handler+0x70/0xbc
> > [811:modprobe] el0t_64_sync+0x1a8/0x1ac
> > [811:modprobe]ipam: Could not allocate 5200 bytes percpu data
> > 
> > Increase PERCPU_MODULE_RESERVE to resolve this issue.
> > 
> > ...
> >
> > --- a/include/linux/percpu.h
> > +++ b/include/linux/percpu.h
> > @@ -16,7 +16,7 @@
> >  /* enough to cover all DEFINE_PER_CPUs in modules */
> >  #ifdef CONFIG_MODULES
> >  #ifdef CONFIG_MEM_ALLOC_PROFILING
> > -#define PERCPU_MODULE_RESERVE		(8 << 13)
> > +#define PERCPU_MODULE_RESERVE		(8 << 14)
> >  #else
> >  #define PERCPU_MODULE_RESERVE		(8 << 10)
> >  #endif
> 
> PERCPU_MODULE_RESERVE is a pretty unpleasant thing.  It appears that it
> gives us the choice between either wasting memory or failing module
> loading.  But I expect that something more dynamic would be a ton of work.

From Tj's commit back in 2009... 6b19b0c24004

+/*
+ * On x86_64 symbols referenced from code should be reachable using
+ * 32bit relocations.  Reserve space for static percpu variables in
+ * modules so that they are always served from the first chunk which
+ * is located at the percpu segment base.  On x86_32, anything can
+ * address anywhere.  No need to reserve space in the first chunk.
+ */

I'm not too sure where our x86_64 32 bit support is. If that is no
longer true then we can likely fold the reserved region back into the
dynamic region.

Given the above, there's not really an opportunity to do this after the
system has booted hence why it's baked into the first chunk.

Thanks,
Dennis
