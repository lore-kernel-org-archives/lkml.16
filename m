Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA9D188907
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 18:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750701828; cv=none; b=BA4gUaNTgKO1D2osHgFPZAwvG16FzfYS5nXmYdbN2y79y+6NSIfDDVDiV8c4U/XtnH/U3EHMy3l662aZPXUtpdCwLp5uY00+ijldjbiEMj9eqKykGtwVQxdVtoSdCixMmjWlMtHNus36mLZCtgggYHXJ38x+KvSr7IF1nVYkkHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750701828; c=relaxed/simple;
	bh=Jbo4k+tvGe68im8kTb0fDDmxiwNAWyXpz9FqbT0qwmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZAFv6MblUrqlF5PnSwuf1CTXkMkO/c9fdtHDg5MKc+ESaDLafUfl4sh0WC1tEimx6TXiN3avD4ynFtC8sR/D1i76bosHW+IWuvWXOP8/s6NfO/lf1tzpOqmGTF/nEvo2YUeTN8RPi715ML1DOYWMG3kdGB1oqVEeL4SR18Kw6GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mqtMncmR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mqtMncmR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A9D4C4CEEA;
	Mon, 23 Jun 2025 18:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750701827;
	bh=Jbo4k+tvGe68im8kTb0fDDmxiwNAWyXpz9FqbT0qwmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mqtMncmR4IE9UMravHfIC0SDof7BYAqwto/Ax2jooBOT4/qgEhRj9BLGIjPI/ooVC
	 x+n91E38wUkxr/PP/0+ujV6W6mET3SIxpUzA50Ay/UAJWO1I1pO1AO3CmsGoOUwUXJ
	 REm5dUesKcoTceywnZkL2GCNJN2IVNCh77ScyF8AqJkuTBlrP0EG7pNMrqvaL5eY6I
	 fLM05RRxBFjKltJj1GuX0q4kGxii1KiSqr/bwfg8fbT2Lv+FN4KcvUXqLtC3M/bxH6
	 QsYY0kQbxCE0MbO+IabPjyI9WgfjmshdqSZZSSQHxXBYy/mSYwAHsCzVv4ATEvDRMA
	 pYJBtRxTU1VVA==
Date: Mon, 23 Jun 2025 08:03:46 -1000
From: Tejun Heo <tj@kernel.org>
To: Waiman Long <llong@redhat.com>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH 02/27] sched/isolation: Introduce housekeeping per-cpu
 rwsem
Message-ID: <aFmXAjmtasot2rp6@slm.duckdns.org>
References: <20250620152308.27492-1-frederic@kernel.org>
 <20250620152308.27492-3-frederic@kernel.org>
 <3bf95ee2-1340-41b1-9f5c-1563f953c6eb@redhat.com>
 <aFmRQLv2RWbqX01b@slm.duckdns.org>
 <509c307c-c72f-423c-b5c4-a1c5fdcac7a1@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <509c307c-c72f-423c-b5c4-a1c5fdcac7a1@redhat.com>

Hello,

On Mon, Jun 23, 2025 at 01:57:17PM -0400, Waiman Long wrote:
> The percpu-rwsem does have a cheaper read side compared with rwsem for
> typical use case where writer update happens sparingly. However, when the
> writer has successful acquired the write lock, the readers do have to wait
> until the writer issues a percpu_up_write() call before they can proceed. It
> is the delay introduced by this wait that I am worry about. Isolated
> partitions are typically set up to run RT applications that have a strict
> latency requirement. So any possible latency spike should be avoided.

I see. Hmm... this being the mechanism that establishes the isolation, it
doesn't seem too broken if things stutter a bit when isolation is being
updated. Let's see what Frederic says why the strong interlocking is needed.

Thanks.

-- 
tejun
