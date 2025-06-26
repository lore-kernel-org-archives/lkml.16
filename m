Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE33F2EBDC6
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750949477; cv=none; b=J43a7QHWASokxgZKn21J34a7fQTJtjDVA5QOfjSnYZHBrezsK+IOr7L3LOfUy0E9lJhWrkc2Le2lH5K4rdKQ+H7R5dKzKlbuB1QIL17n0jWKP6epDznTnXfY8gT6r1/LxsghtpxsAVmmYX6JgicCoxmibO9993QeuWJOdDEn1OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750949477; c=relaxed/simple;
	bh=hb0t7W6wWhCAfD8zp8vw/jxoMB8N6zb8dEsKzlP/xWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QD0xdIP2WQyxyKMzkp6SHtUXcjkR3PObrypUR/AchhvTwBuLvV4xqn2S9QNGgTo29rlczYJ4TuXwNp05Bj8+JwNlvlsYLusBWY0i113bndTpfZ3se4KpYMVpFPOaot4cOZKNIJl0WtTIJ45xs2+hYwUwoPHxeSlYJwgUw93EMBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sru82K9U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sru82K9U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D1ADC4CEED;
	Thu, 26 Jun 2025 14:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750949475;
	bh=hb0t7W6wWhCAfD8zp8vw/jxoMB8N6zb8dEsKzlP/xWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sru82K9U63wKBqGZUpioOrPwwYh4IcCRYO1ja/9K+tY95okU/ICcnff7j5wdkv8OX
	 3hy8VmfTdTM36mUOR7WrXquUQhY7QJ3A+jlu34U0Vv+S4iOvzSibeksjE6+Wwg/UIB
	 CSxLO09RYkQyA9yJOY/gXu2H5w3ChE7aJimj5PBoMkSBOqGyy9WKd4mLsqp+T1zUvj
	 X5bbSmsfr1v5zajGOGeLDDCDaN+YTcm8oyuvlPoeg2lybJEFAQU05xd4PLpFp6PuOs
	 xnN3ziMI+y627nwtSRS/jPfVnYb4pSBPHv4+ktxZCRrp/gX+U4bwHwBwwlnfPea5jh
	 kdubYgArWpnhg==
Date: Thu, 26 Jun 2025 16:51:12 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Peter Zijlstra <peterz@infradead.org>, Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>, Waiman Long <longman@redhat.com>
Subject: Re: [PATCH 03/27] PCI: Protect against concurrent change of
 housekeeping cpumask
Message-ID: <aF1eYIkUA6k60kTK@localhost.localdomain>
References: <20250620152308.27492-4-frederic@kernel.org>
 <20250620161710.GA1296438@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250620161710.GA1296438@bhelgaas>

Le Fri, Jun 20, 2025 at 11:17:10AM -0500, Bjorn Helgaas a écrit :
> On Fri, Jun 20, 2025 at 05:22:44PM +0200, Frederic Weisbecker wrote:
> > HK_TYPE_DOMAIN will soon integrate cpuset isolated partitions and
> > therefore be made modifyable at runtime. Synchronize against the cpumask
> > update using appropriate locking.
> 
> s/modifyable/modifiable/
> 
> > Queue and wait for the PCI call to complete while holding the
> > housekeeping rwsem. This way the housekeeping update side doesn't need
> > to propagate its changes to PCI.
> 
> What PCI call are we waiting for?  I see housekeeping_lock(), but I
> assume that's doing some housekeeping-related mutual exclusion, not
> waiting for PCI work.

It's waiting for the call to work_on_cpu() to complete (along with
the CPU election through housekeeping_cpumask()).

> 
> I don't know how to use housekeeping_lock() or when it's needed.  Can
> you add some guidance here and at the housekeeping_lock() definition?

You're right, it's missing documentation, context and guidance. I'll
try to fill that in the next iteration. Also the lock is likely going
to be replaced by RCU instead.

Thanks.

-- 
Frederic Weisbecker
SUSE Labs
