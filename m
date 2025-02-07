Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D0E1A314D
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 18:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738953150; cv=none; b=T1FOcKUGPkSUFlia4l55bpG7glA5tHvHkoxweOUjiTwIVIOTQ0BHfHwRU1olTt4kO7QC58C4nbXtznZt/5R5eGXeQHdm1Zvot6uWIQlB6unX2B/yhGSXnht/DUTAbiuDJX5xRs4FH9KFrjP14Ms7a3TYmgAnDCGK+F7GxkrnVbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738953150; c=relaxed/simple;
	bh=mJL5mx7JVIAFBJIFueL4p+i7pi7BKua8Kg1T3ciXsEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OZGjDgOz9QGpC+iMU1FougnRMO3TL0wicXX54IEvMEUoDtpwL4aKCm2CsNmg+TVq1BrUSTDHP+jVk+bvTPjToTFRyxf20jGzS8k2lkM2l4lNegK9V6uBQX5ZlA+6NKylSg0aHVsG6IvT+1hp+cupAO7Z0f8g4OIk9bSbiOmRSIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fz4B6Oqc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fz4B6Oqc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 659C2C4CED1;
	Fri,  7 Feb 2025 18:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738953149;
	bh=mJL5mx7JVIAFBJIFueL4p+i7pi7BKua8Kg1T3ciXsEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fz4B6OqcntaFVPATVCq8PVIsyW+Uvjm3SQCp55IC38b1nzkLFdDgPfWsf7i7C8zLS
	 qu7G8MEVaAja57TotYhm0Woq0EXrI51OY9lnSaVxywDL4zkMYzSD+oQmZbb6taIFU4
	 NATF2JrpL4CzoYdWA2rPz2gXmnuPYkReX84hVu3bd62mWygME/vcXn9srxS8vjOoFo
	 VcgYhDMPF2EoQWC17Ux0BGrIEWbCijlTIw1w4u759k8nq0Rrh5lqXLn7cd95VaaBpP
	 m9ISoO5eQbtFVQ6CrOYYFn/UAVjaxgiPt0t+MAtvtzSAWOYssOi6ZlJUj2boXz36Ra
	 tVFOQEw5qbjyw==
Date: Fri, 7 Feb 2025 19:32:27 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] kthread: Return the assigned value rather than 0
Message-ID: <Z6ZRu4biBY7Y_Zss@pavilion.home>
References: <20250203164855.3699026-1-andriy.shevchenko@linux.intel.com>
 <Z6FjGV1-CxE12f8L@pavilion.home>
 <Z6IkFec26HmiwM4H@smile.fi.intel.com>
 <Z6YbTgpbimhonft2@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z6YbTgpbimhonft2@black.fi.intel.com>

Hi Andy,

Le Fri, Feb 07, 2025 at 04:40:14PM +0200, Andy Shevchenko a écrit :
> On Tue, Feb 04, 2025 at 04:28:37PM +0200, Andy Shevchenko wrote:
> > On Tue, Feb 04, 2025 at 01:45:13AM +0100, Frederic Weisbecker wrote:
> > > Le Mon, Feb 03, 2025 at 06:48:55PM +0200, Andy Shevchenko a écrit :
> > > > Recently introduced kthread_affine_preferred() has a bug that the value
> > > > of ret variable set but not used. This breaks the compilation with error
> > > > (assume default CONFIG_WERROR=y and `make W=1` to run the build):
> > > > 
> > > > kernel/kthread.c:862:6: error: variable 'ret' set but not used [-Werror,-Wunused-but-set-variable]
> > > > 
> > > > Fixes: 4d13f4304fa4 ("kthread: Implement preferred affinity")
> > > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > 
> > > Thanks but I already have it queued there:
> > > 
> > > https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git/commit/?h=kthread/fixes&id=1b0332a42656b798bea867631d739de023633ec6
> > > 
> > > I'll do a pull request shortly.
> > 
> > I'm fine with any approach as long as the issue will be fixed rather sooner.
> 
> Any news? As of today no appearance of the (alternative) fix either in upstream,
> or in Linux Next. What's the plan, please?

It's there for a week or so. I must confess I should have advertized it:

1b0332a42656 ("kthread: Fix return value on kzalloc() failure in kthread_affine_preferred()")

Thanks.
