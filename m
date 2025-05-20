Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47278267AF4
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 11:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747742245; cv=none; b=Thw3CZDVi0OZRM1P9DXKrHQxGPkH8RKSHlz9aO1MS+te0N0Nfzvse3QeRrEOTr29PU8RoJWBU25Kz6nwtcPs/dsmcC/EgwZHSHrh2jOg66AtoTagpXHj4j8J+cuXrivKkj8LzEsX/mSjDDGQptmRrL73zpLLupBj41aFZMALl/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747742245; c=relaxed/simple;
	bh=JA5IURh3R/rz1YWIDzC4eb8tG4fWBRz24TVzdqmCUIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iKVGiXFalP5L+chGN72JCDoUH33C62Uqpt27Mfy2iHWb2D7rUPsnO1wTZ7O7FVpsjG/8wOjgAqxXAJiApYR7XI8sv/yyUDRSGtkMEsjCYg6PFuT1quXSQ6K5iYLsu6L+ZoyZUp00s3D1EA5w6Kv7rmFOQQFx8vIEazCKy28Hwr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jzK0MJjY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jzK0MJjY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58B2EC4CEE9;
	Tue, 20 May 2025 11:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747742244;
	bh=JA5IURh3R/rz1YWIDzC4eb8tG4fWBRz24TVzdqmCUIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jzK0MJjYXuvKtQhEAoJHYz55uFH7Pa7cnl315wCeKnDgdRBmPMhYs7hu38laa4ILd
	 npwDGuM+qwnnawNQKjyfjpHTG0mmhFI0+yAt8q2GFIkVZHby3DQfnI0sR3FQZkdWjl
	 qE7n1GBpplxbmNYcONc6Qrx/9TH5elOp1e7Wxe39JkbsOI5fNfG+08nBNCjkXctJU5
	 CcLqNPVBdTVyzv/eanvHGlt26E28gm2NKscqxNcWcxtwjtMoxYvDFITDLnj1rTS9Tf
	 dO0jkecc6qTJjRX3UOq9hS/M61lEu6eqJSpCz60BJTph5VtalApkZd7Orl9ZZy0odL
	 /Y5COYvGDlvCg==
Date: Tue, 20 May 2025 13:57:21 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v5 4/6] sched/isolation: Force housekeeping if isolcpus
 and nohz_full don't leave any
Message-ID: <aCxuIYqvbEn1xgmd@localhost.localdomain>
References: <20250508145319.97794-8-gmonaco@redhat.com>
 <20250508145319.97794-12-gmonaco@redhat.com>
 <aCxWwVy2UUmvinyZ@localhost.localdomain>
 <685cdf5db59a8aaf0b7c0d9847d109d878da039b.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <685cdf5db59a8aaf0b7c0d9847d109d878da039b.camel@redhat.com>

Le Tue, May 20, 2025 at 01:17:20PM +0200, Gabriele Monaco a écrit :
> The isolcpus parameter can be used like:
> 1. isolcpus=1,2,3
> 2. isolcpus=domain,1,2,3
> 3. isolcpus=nohz,1,2,3
> 4. isolcpus=domain,nohz,1,2,3
> ...
> 
> 1 and 2 are equivalent (e.g. if no mode is specified, that's domain
> isolation), 3 is equivalent to nohz_full=1,2,3 and 4 is equivalent to
> 1-2 in combination with nohz_full=1,2,3
> 
> Now, the code takes into account that there are 2 arguments that can
> isolate (isolcpus and domain) and can be passed in any order, that
> specific code guards against those two passing inconsistent maps, e.g.:
> 
> 	isolcpus=nohz,0-4 nohz_full=5-8
> 
> Strictly speaking it's guarding for any other possible inconsistency
> but I believe that's the only one actually achievable.
> 
> Again, nothing forbids e.g.
> 
> 	isolcpus=domain,0-4 nohz_full=5-8
> 
> since they're different isolation flags and that's allowed (not sure if
> it really should be though).

Duh, yes, it only refuse if the flags are common and masks are different.
I seem to remember you already explained that to me last time and I already
slapped my forehead. Prepare for me to ask the same question one more time
in one week ;-)

-- 
Frederic Weisbecker
SUSE Labs
