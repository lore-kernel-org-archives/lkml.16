Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DB428ECE0
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750776753; cv=none; b=asyflgViWssQQ71qh1XAnAEz4/++OT4crs+uom8inLs0F9pn2dR4yQKbtZNQXbEeDj9CyFmF4rVSEqdrLc1YHwYExGK7FUEBvkun3qflgH75J46IJSmMuEO5Jumen8BbtVOESkuw1aAlW8e322wtgEbcxbHmPyxz3uEhd9Bk0dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750776753; c=relaxed/simple;
	bh=ceUCtSYWiIlQmuJ0bYheOpHsWDwbZ/a/I0j7HVRa43g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l5XFc5zYjGUGTFMQMfGXup0kLKWfXP6NmHIN7BzKPpA1zZLOGkND1tovT+GR9ZdVG33L7zkbL61D7vzUjtVXWJcJy7eMvtCtiPlvyj+jKf4jZBUBYD5P0E7Ezx0d38wr7yS94bBFIF94tmcN8vhhKdAxwQ4zBJvytn06hiPUQ5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q9fNB0DZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q9fNB0DZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CF7BC4CEE3;
	Tue, 24 Jun 2025 14:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750776752;
	bh=ceUCtSYWiIlQmuJ0bYheOpHsWDwbZ/a/I0j7HVRa43g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q9fNB0DZUr1xiaknhEWKMnn53zVOJchtoC02SLDnCq/bg5lcbK/1jG0Ie0wbxbDMq
	 BRgsyPryrczw7RDsNfL1HTSeuQ35cpy9F+/f+2x31BUN5Fc7Dl8Qsbir2cjjs/gBel
	 C/4cxjthlZDIytlNeh5pM/RbRzxenLXuM4IP4/SYBa8Bxmmtw7R1NR4tlI0E1tv5UC
	 Wl+R3D57fZiE/fEU/nfT4i/ZujL5A4fz7gZTlA6mau6fouJreINHnOYbWAH3wMEB3X
	 DluZvqlOKzze2IP1RuLwIdk1o/45vCFZL8ZnodVbhyKXAtHsaLIqNFSS481ys+Wlfs
	 x/lUyw7YZAqVA==
Date: Tue, 24 Jun 2025 16:52:30 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v6 6/6] timers: Exclude isolated cpus from timer migation
Message-ID: <aFq7rqbHugtiWF6Z@localhost.localdomain>
References: <20250530142031.215594-1-gmonaco@redhat.com>
 <20250530142031.215594-7-gmonaco@redhat.com>
 <875xgqqrel.ffs@tglx>
 <b33dcafca895da1d9c64a7d6ab771952a932e579.camel@redhat.com>
 <878qlhnunz.ffs@tglx>
 <1bc41a7a5bd46860318b0417fa27121758f28448.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1bc41a7a5bd46860318b0417fa27121758f28448.camel@redhat.com>

Le Tue, Jun 24, 2025 at 04:06:41PM +0200, Gabriele Monaco a écrit :
> Right, but as far as I understood, the first call to 
> tmigr_set_cpu_available() happens after the isolcpus parameter has been
> parsed so we know at least cpu0 is going to be isolated.
> 
> On my machine it works reliably this way. I'm a bit lost in the init
> code but seeing housekeeping_init() before rcu_init(), which in turn
> should be required for some RCU-related early_initcalls, makes me
> believe this order is guaranteed to be respected.
> Or am I missing something?

Right I think you need to keep those checks because if CPU 0 is isolcpus
and CPU 5 is nohz_full, CPU 0 will become later the timekeeper and must stay
in the tmigr hierarchy.

OTOH if CPU 0 is isolcpus and there is no nohz_full CPUs, then CPU 0 doesn't
want to go to the hierarchy.

cpuset isolated partitions are different because they issue SMP calls whereas
isolcpus is defined on boot.

An alternative for isolcpus could be to make a late initcall and do the smp
calls from there just like is done for cpusets.

Thanks.

-- 
Frederic Weisbecker
SUSE Labs
