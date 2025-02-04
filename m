Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A97E2147E8
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 15:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738684273; cv=none; b=B+7sphK6PKIbzkwlh8MIki/mwP6T0DzzYEESOrWgyujCFhG/5TE5lK3G6H6VOs92P3PbA2yMaOHW93P0m5U3s7XgwG6oCn8RBrYV8TjEaXFMk8JxYy7AJfqJJCwot129/Y1tFASg/QLjeqsLi1gIHgkMf+Df7ZnqlJkLZfp2+7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738684273; c=relaxed/simple;
	bh=ZuUNrlqs2+aEEq9lA/giTYv0bSIQaTWXS2zm+kyEjcQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LwoN4cx1MuGhnzIuHTT6duEtvSNnXXpBFX2GCb6sI7rClw5WHZtFF3ZU9DBmd7UMO3EgjhtynL2qsJp0oMujlQwkPWrDToiFj7viYy94Utd0KqrQxtQyX+WRHGYwSnQNe1Vw04TBCnopeS1o2U7mXvvekr6Akrf7yT2Vt0u/F8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=zNH0Cmhu; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="zNH0Cmhu"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 514Foscj3245682
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Feb 2025 09:50:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738684254;
	bh=zndc8PR0P5lLeI9hk6+/pAG9i80aAaymOx4/8e6Jv7I=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=zNH0CmhuZswO0Af6xhizc8ZJbD2X9OjxdRDSQOsl2xk3eLmBZ01tCARMl25oljFCd
	 0oCaV8H2oqdIovmwpSfBtllArI8JKQZLjJcZxrf0TL2lDg3GLK7nxzl3Y1zEwTDTXs
	 eiRCk84wgagCkrAYGdeDIYk+o288hmMUFQA+qe5A=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 514FosDW016407
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Feb 2025 09:50:54 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Feb 2025 09:50:54 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Feb 2025 09:50:54 -0600
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 514ForZ6050947;
	Tue, 4 Feb 2025 09:50:54 -0600
Date: Tue, 4 Feb 2025 21:20:53 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Kees Cook <kees@kernel.org>
CC: Frederic Weisbecker <frederic@kernel.org>,
        Andrew Morton
	<akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>, Chen Yu
	<yu.c.chen@intel.com>,
        <linux-kernel@vger.kernel.org>, Randy Dunlap
	<rdunlap@infradead.org>
Subject: Re: [PATCH] kthread: Fix build warning variable 'ret' set but not
 used
Message-ID: <20250204155053.7tthci4fyamo37lz@lcpd911>
References: <202501301528.t0cZVbnq-lkp@intel.com>
 <20250204090838.214647-1-d-gole@ti.com>
 <202502040714.0E55ACBDDB@keescook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202502040714.0E55ACBDDB@keescook>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Feb 04, 2025 at 07:15:41 -0800, Kees Cook wrote:
> On Tue, Feb 04, 2025 at 02:38:38PM +0530, Dhruva Gole wrote:
> > Fix the following build time warning in kthread:
> > 
> >    kernel/kthread.c: In function 'kthread_affine_preferred':
> > >> kernel/kthread.c:861:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
> >      861 |         int ret;
> >          |             ^~~
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202501301528.t0cZVbnq-lkp@intel.com/
> > Signed-off-by: Dhruva Gole <d-gole@ti.com>
> > ---
> >  kernel/kthread.c | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/kernel/kthread.c b/kernel/kthread.c
> > index 4005b13ebd7f..f730b1413d13 100644
> > --- a/kernel/kthread.c
> > +++ b/kernel/kthread.c
> > @@ -859,7 +859,6 @@ int kthread_affine_preferred(struct task_struct *p, const struct cpumask *mask)
> >  	struct kthread *kthread = to_kthread(p);
> >  	cpumask_var_t affinity;
> >  	unsigned long flags;
> > -	int ret;
> >  
> >  	if (!wait_task_inactive(p, TASK_UNINTERRUPTIBLE) || kthread->started) {
> >  		WARN_ON(1);
> > @@ -873,7 +872,6 @@ int kthread_affine_preferred(struct task_struct *p, const struct cpumask *mask)
> >  
> >  	kthread->preferred_affinity = kzalloc(sizeof(struct cpumask), GFP_KERNEL);
> >  	if (!kthread->preferred_affinity) {
> > -		ret = -ENOMEM;
> >  		goto out;
> >  	}
> 
> This seems wrong? This is an error path, so removing this causes "return
> 0" to happen. I would take a look at the commit history to figure out
> when this mistake was introduced and adjust it correctly. I would have
> expected "int ret = 0;", and "return ret;" at "out:" to be the fix.

Seems like it was introduced in commit 4d13f4304fa43 ("kthread: Implement preferred affinity")

This was a bit wrong to begin with. But you're right I will follow your
suggestion and send out a v2.

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated
